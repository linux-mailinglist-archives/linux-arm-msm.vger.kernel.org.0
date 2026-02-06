Return-Path: <linux-arm-msm+bounces-91977-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KEcuIXSghWlKEAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91977-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Feb 2026 09:04:04 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FD2FFB3C3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Feb 2026 09:04:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 71314300B122
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Feb 2026 08:00:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 892E033F395;
	Fri,  6 Feb 2026 08:00:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YlWn99IG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6025733F37F;
	Fri,  6 Feb 2026 08:00:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770364812; cv=none; b=l7vtVkUwO3VADSAdG7yR9EFRkaNTm4ExagMZ94Sq4uayFTKScEqcw9q0JzmDYtCcdHpf/gmuwewkJuuIEV6DJGbva6OI/yjvD6NR3GhZYoDTKiW4ZW15g3TE32cuNTv5jZx19zsqQcU7cMBPLjqUDEgbECrsWM6HcQWU/8XFXlI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770364812; c=relaxed/simple;
	bh=QYQxMJpseoM1Pjg/ppDkYzFEx9y2SCTxdUniu1od0g4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Bjoyx5TiMkoCIIAk11oPqHPQkAIr6OCftLGwcbpCABGfyWVhMfMM0Fztbb4NRQG1RYbUaLfqocWDkeeE8TJCpJ/bl50YtE4gcYq6R5X/NwEC+usOJHi6UQ5UJoF53SKCMakzFg+ML7sjSJEyR/NX4VU8dflv1PXM7bQGLH6zkpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YlWn99IG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39DA9C116C6;
	Fri,  6 Feb 2026 08:00:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770364811;
	bh=QYQxMJpseoM1Pjg/ppDkYzFEx9y2SCTxdUniu1od0g4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YlWn99IG2UbCJd0tPwymWE00YeNRIWyvSyDeO3n2OypA+Hd3ItfcjBvZf2lQBrDjW
	 /RBqj8OL9nUonPbW6Ob1nsuqjxY5qYqDYvrZXYvoa04mHNoY/v7PlgHTIxwFuBViBL
	 Wlk1Xpk3FevA5eKTZeiCG3/Ll49DQHyTWAVK5DEaqvMdfMmIg5DAr80c3efq2cNKCA
	 kfL2DHMKTg1NtUvx/NSAX9yBXFGlqNznzroZYBLq4vuBJLWWlxvu1jA0XiazLuDEuA
	 Y3HwsZwwg5UQiap5xgsrrTlRjhYm4LJqgEPbOOUK08PsgMhkZJwkDRQLF9B9BTuqci
	 5BKiL47ukLnAA==
Date: Fri, 6 Feb 2026 09:00:09 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: broonie@kernel.org, lgirdwood@gmail.com, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, srini@kernel.org, perex@perex.cz, 
	tiwai@suse.com, alexey.klimov@linaro.org, mohammad.rafi.shaik@oss.qualcomm.com, 
	quic_wcheng@quicinc.com, johan@kernel.org, dmitry.baryshkov@oss.qualcomm.com, 
	konrad.dybcio@oss.qualcomm.com, linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 05/10] ASoC: qcom: q6dsp: add support for LPASS LPI MI2S
 dais
Message-ID: <20260206-petite-tireless-iguana-addf9e@quoll>
References: <20260205171411.34908-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260205171411.34908-6-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260205171411.34908-6-srinivas.kandagatla@oss.qualcomm.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-91977-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,perex.cz,suse.com,linaro.org,oss.qualcomm.com,quicinc.com,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Queue-Id: 2FD2FFB3C3
X-Rspamd-Action: no action

On Thu, Feb 05, 2026 at 12:14:06PM -0500, Srinivas Kandagatla wrote:
> Add new dai ids and dai driver entries ior LPASS LPI MI2S lines
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> ---
>  .../sound/qcom,q6dsp-lpass-ports.h            | 12 ++++-
>  sound/soc/qcom/qdsp6/q6dsp-lpass-ports.c      | 47 +++++++++++++++++++
>  2 files changed, 58 insertions(+), 1 deletion(-)
> 

It's impossible to reply via korg - wrong address of Conor...

> diff --git a/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h b/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h
> index 609bc278f726..0febc641f351 100644
> --- a/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h
> +++ b/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h
> @@ -140,7 +140,17 @@
>  #define DISPLAY_PORT_RX_6	134
>  #define DISPLAY_PORT_RX_7	135
>  #define USB_RX			136
> -#define LPASS_MAX_PORT		(USB_RX + 1)
> +#define	LPI_MI2S_RX_0		137

Odd indentation appeared.

> +#define	LPI_MI2S_TX_0		138
> +#define	LPI_MI2S_RX_1		139
> +#define	LPI_MI2S_TX_1		140
> +#define	LPI_MI2S_RX_2		141
> +#define	LPI_MI2S_TX_2		142
> +#define	LPI_MI2S_RX_3		143
> +#define	LPI_MI2S_TX_3		144
> +#define	LPI_MI2S_RX_4		145
> +#define	LPI_MI2S_TX_4		146
> +#define	LPASS_MAX_PORT		(LPI_MI2S_TX_4 + 1)

Confusing change or actual proof that my previous comments for similar
patch are valid:
1. not a binding
or
2. you cannot change this, because you break ABI.
Choose only one from these options.

Drop.

Best regards,
Krzysztof


