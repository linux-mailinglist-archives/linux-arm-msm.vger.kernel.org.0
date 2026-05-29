Return-Path: <linux-arm-msm+bounces-110273-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sDubKJKOGWpTxggAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110273-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2026 15:03:14 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 07E6C6029F2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2026 15:03:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2A033305E28A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2026 13:01:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3C391EDA0F;
	Fri, 29 May 2026 13:01:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ovlRGB64"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D11721E7C12;
	Fri, 29 May 2026 13:01:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780059697; cv=none; b=chStErK2nq+q45vNK6uqUnWXX3MFdlRsJWavm4KR53ZSJ583IdZRrDViu7BwxQ5VWz+tBE6FKaIU8vhxcYBT6mZGPi9FZjiQU0bHFrju/Kyo/A0VuSyiElBw8bTiH+zMWH+ApabZyZqLKa5u8fW+YYXyo2n59Im5cZh7axZBKko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780059697; c=relaxed/simple;
	bh=B1WHAEMnlzUoNP6q6nTGN2j6SKR2m0O3noPQ6FlXro8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=bYsiBaw2HpM8nYgxwpBedticMol2Ieq67Lj86BMBxYHBs6INPltJlw1aMPn6uBJZFxLNl/o4a/ZRo4Nj4rGi7sNMTEwPzUBPQu620sQylHi6tBKgQcDmhoxGXJ1aUwDrd5X/iWDql+caJnFdKdN04Cd94SLh5fu6LYiE4l6Ty/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ovlRGB64; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E47B1F00893;
	Fri, 29 May 2026 13:01:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780059696;
	bh=xNO7FedvkewdHFzu1AzHiNyYoASas47HurFETp8VPqY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=ovlRGB64wq0qRCXCrYpPtowB5m9YNX61YDpMi8J46F6YCwV5LwmczYM9SF8wJ7MUz
	 jys+ERjOzRDTT/6u1e5WcNDmSt4hMh/G3Z0qE5F4c21OTBHKQus1Z9Cf7aW4/npYii
	 E8HK9QB0rcEyzueP6uKnbEkYhzkO1x2WyBl/wcXWcuiJyQnrtRml0L3AGbsPtRI5Ut
	 aZjbAaRm+eGG4eoviBg0v5uW9eFypZFRxzaUQqK/Cktcmy2tPPHHZc0lZvVUdQLkVG
	 f1chDrZpg/0SV9eRS9YCSE120bfl1tDrMraWTO7oIg06N1AIL2kfWkNPc2EI7Ftr/d
	 peq49Rel8lkXw==
From: Srinivas Kandagatla <srini@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Vinod Koul <vkoul@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
In-Reply-To: <20260331-slim-ngd-dev-v2-0-9441e9c8420e@oss.qualcomm.com>
References: <20260331-slim-ngd-dev-v2-0-9441e9c8420e@oss.qualcomm.com>
Subject: Re: [PATCH v2 0/7] slimbus: qcom-ngd-ctrl: Fix some race
 conditions and deadlocks
Message-Id: <178005969421.10029.6639063792138905670.b4-ty@kernel.org>
Date: Fri, 29 May 2026 14:01:34 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-110273-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[srini@kernel.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 07E6C6029F2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Tue, 31 Mar 2026 22:22:42 -0500, Bjorn Andersson wrote:
> When the qcom-ngd-ctrl driver is probed after the ADSP remoteproc, the
> SSR notifier will fire immediately, which results in
> qcom_slim_ngd_ssr_pdr_notify() attempting to schedule_work() on an
> unitialized work_struct.
> 
> The concrete result of this is that my db845c/RB3 now fails to boot 100%
> of the time.
> 
> [...]

Applied, thanks!

[1/7] slimbus: qcom-ngd-ctrl: Fix up platform_driver registration
      commit: 77330fa612f4aea1c3be1f9e7b3c76f2d9697741
[2/7] slimbus: qcom-ngd-ctrl: Fix probe error path ordering
      commit: 0dbd05bfc81c9cf649bff11606d373a0174c2f9d
[3/7] slimbus: qcom-ngd-ctrl: Correct PDR and SSR cleanup ownership
      commit: c395d822e6019e86f029766d2b47c374dfa22beb
[4/7] slimbus: qcom-ngd-ctrl: Register callbacks after creating the ngd
      commit: f1de562a166a68fe62466684f9ca8bec6d574733
[5/7] slimbus: qcom-ngd-ctrl: Initialize controller resources in controller
      commit: bebe9de4d2c9a1a953b46ddad2702c32d2feeff9
[6/7] slimbus: qcom-ngd-ctrl: Balance pm_runtime enablement for NGD
      commit: b997618e05f468bae2e4fadbd938a6b421c4b335
[7/7] slimbus: qcom-ngd-ctrl: Avoid ABBA on tx_lock/ctrl->lock
      commit: 7aa41590ac55284cdf46ffb64ec9587a4d450fe0

Best regards,
-- 
Srinivas Kandagatla <srini@kernel.org>


