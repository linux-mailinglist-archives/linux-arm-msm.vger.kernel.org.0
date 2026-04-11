Return-Path: <linux-arm-msm+bounces-102759-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cAGADl+62WnUsQgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102759-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Apr 2026 05:05:03 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FC9D3DE2F6
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Apr 2026 05:05:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BE3883022F82
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Apr 2026 03:04:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6A9B2853F2;
	Sat, 11 Apr 2026 03:04:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k2Dsp8/k"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81A3140DFA1;
	Sat, 11 Apr 2026 03:04:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775876698; cv=none; b=fC3S+RmZSgwpBGtcd1zEYmH9gPaq87Qwldnx6dF0sUXmkZUBoo9zVu11j//QbW5B3wDArhOEDoUm3BmZkmFHbOWDJ8d1QhSLF9BhnQSkDIznz9hhU4wmYDgUrcMcVmcRJXOecPlDrQCaSRA8e9znnlqFozWHmLYph3S9syp4T8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775876698; c=relaxed/simple;
	bh=V2ZILMX/p1oNZIi2ItoaXn+8Uc/hwLMsXf8VNamhx3c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Tlhtm2EtFxcwRha/PeN86ytvZf/ANN83Tl5Avb4gC5dhSOfKFK5hcxFUehPuDRxOMVfDqo8PuHTsCXzLJrMYN7CNrcoFuzV0dKVSk5tR/HdAPpTxRRa3gwA7b1DJu0HMmt8gxHc2TjjF8oNpbSiPk4cPOVpFYJWs330jdNQplVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k2Dsp8/k; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0E00C19421;
	Sat, 11 Apr 2026 03:04:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775876698;
	bh=V2ZILMX/p1oNZIi2ItoaXn+8Uc/hwLMsXf8VNamhx3c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=k2Dsp8/k4eYR+QuBLlvvJSYydSsJCifyoR3EUrPA0gLinV584O3wzcYHolAFEOq5W
	 94fXeH62BwlaATz5qdBBNm2mpPItO79/bsNeQU5y9I1Cy2Z2xRY9w01CJ43Uca2j+B
	 ljItjdW+dMA2VTYYqoFCrcNBg/tqI5AwFb/T3+zWYu9D0EPQvUtdMAGljLvV7vrvDb
	 soM9krwk9djirpFRcbvuHvN6S8rPji/ZH+xZ/Z+3k/+ToTu7BBNOp07jThicP+yq0i
	 qKzwHFg/XZrLmjhc1wXYlEDquehdJtRjtN20JxsPaDVbYI19Q7/jso5l0FU7E3qJg6
	 uWO3Yb1gZPbnw==
Date: Fri, 10 Apr 2026 22:04:54 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Luca Weiss <luca.weiss@fairphone.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com, 
	trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com, linux-arm-msm@vger.kernel.org, 
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Gokul Krishna Krishnakumar <gokul.krishnakumar@oss.qualcomm.com>
Subject: Re: [PATCH v5 4/5] remoteproc: qcom: pas: Add late attach support
 for subsystems
Message-ID: <adm56u_cDoKnuPob@baldur>
References: <20260409-knp-soccp-v5-0-805a492124da@oss.qualcomm.com>
 <20260409-knp-soccp-v5-4-805a492124da@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260409-knp-soccp-v5-4-805a492124da@oss.qualcomm.com>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102759-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 8FC9D3DE2F6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Apr 09, 2026 at 01:52:27AM -0700, Jingyi Wang wrote:
[..]
> diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
> index da27d1d3c9da..34b54cf832d0 100644
> --- a/drivers/remoteproc/qcom_q6v5_pas.c
> +++ b/drivers/remoteproc/qcom_q6v5_pas.c
> @@ -60,6 +60,7 @@ struct qcom_pas_data {
>  	int region_assign_count;
>  	bool region_assign_shared;
>  	int region_assign_vmid;
> +	bool early_boot;
>  };
>  
>  struct qcom_pas {
> @@ -423,9 +424,15 @@ static int qcom_pas_stop(struct rproc *rproc)
>  
>  	qcom_pas_unmap_carveout(rproc, pas->mem_phys, pas->mem_size);
>  
> -	handover = qcom_q6v5_unprepare(&pas->q6v5);
> -	if (handover)
> -		qcom_pas_handover(&pas->q6v5);
> +	/*
> +	 * qcom_q6v5_prepare is not called in qcom_pas_attach, skip unprepare to
> +	 * avoid mismatch.

Can you confirm that no load_state should be sent to AOSS for SoCCP?
(I.e. from the skipped qcom_q6v5_prepare())

Regards,
Bjorn

