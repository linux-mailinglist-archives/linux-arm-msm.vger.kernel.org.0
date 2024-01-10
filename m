Return-Path: <linux-arm-msm+bounces-6905-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 77B1482995A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jan 2024 12:42:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 159751F23916
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jan 2024 11:42:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4F3247F57;
	Wed, 10 Jan 2024 11:42:01 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail78-59.sinamail.sina.com.cn (mail78-59.sinamail.sina.com.cn [219.142.78.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D77C247F58
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jan 2024 11:41:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sina.com
X-SMAIL-HELO: localhost.localdomain
Received: from unknown (HELO localhost.localdomain)([113.118.69.212])
	by sina.com (172.16.235.25) with ESMTP
	id 659E825600002DBD; Wed, 10 Jan 2024 19:41:13 +0800 (CST)
X-Sender: hdanton@sina.com
X-Auth-ID: hdanton@sina.com
Authentication-Results: sina.com;
	 spf=none smtp.mailfrom=hdanton@sina.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=hdanton@sina.com
X-SMAIL-MID: 31099534210304
X-SMAIL-UIID: 96EB86E16263455A8C3FE6FECD19F94C-20240110-194113-1
From: Hillf Danton <hdanton@sina.com>
To: Elliot Berman <quic_eberman@quicinc.com>
Cc: Will Deacon <will@kernel.org>,
	Sean Christopherson <seanjc@google.com>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v16 07/34] gunyah: rsc_mgr: Add resource manager RPC core
Date: Wed, 10 Jan 2024 19:41:01 +0800
Message-Id: <20240110114101.3343-1-hdanton@sina.com>
In-Reply-To: <20240109-gunyah-v16-7-634904bf4ce9@quicinc.com>
References: <20240109-gunyah-v16-0-634904bf4ce9@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Tue, 9 Jan 2024 11:37:45 -0800 Elliot Berman <quic_eberman@quicinc.com>
> +
> +static irqreturn_t gunyah_rm_tx(int irq, void *data)
> +{
> +	struct gunyah_rm *rm = data;
> +
> +	complete_all(&rm->send_ready);
> +
> +	return IRQ_HANDLED;
> +}
> +
> +static int gunyah_rm_msgq_send(struct gunyah_rm *rm, size_t size, bool push)
> +	__must_hold(&rm->send_lock)
> +{
> +	const u64 tx_flags = push ? GUNYAH_HYPERCALL_MSGQ_TX_FLAGS_PUSH : 0;
> +	enum gunyah_error gunyah_error;
> +	void *data = &rm->send_msg[0];
> +	bool ready;

	lockdep_assert_held(&rm->send_lock); instead of __must_hold
> +
> +again:
> +	wait_for_completion(&rm->send_ready);
> +	/* reinit completion before hypercall. As soon as hypercall returns, we could get the
> +	 * ready interrupt. This might be before we have time to reinit the completion
> +	 */
> +	reinit_completion(&rm->send_ready);

Given wait_for_completion(&rm->send_ready) with rm->send_lock held,
complete(&rm->send_ready) works for you with the bonus of cutting this
reinit off.

> +	gunyah_error = gunyah_hypercall_msgq_send(rm->tx_ghrsc.capid, size,
> +						  data, tx_flags, &ready);
> +
> +	/* Should never happen because Linux properly tracks the ready-state of the msgq */
> +	if (WARN_ON(gunyah_error == GUNYAH_ERROR_MSGQUEUE_FULL))
> +		goto again;
> +
> +	if (ready)
> +		complete_all(&rm->send_ready);
> +
> +	return gunyah_error_remap(gunyah_error);
> +}

