Return-Path: <linux-arm-msm+bounces-95903-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KFrILWcUq2lzZwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95903-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Mar 2026 18:52:39 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AA8E622675C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Mar 2026 18:52:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B5A8E3004D23
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Mar 2026 17:52:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3ED9F41C0BF;
	Fri,  6 Mar 2026 17:52:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GqDuG0bj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A193136CDF9
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Mar 2026 17:52:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772819551; cv=none; b=Q88R8uTTSdEYpZ9TVtd+Q+GiMlSJs3o4tc7mPw06icrI1nOXP+LM7iSVS6U4O+RgYGj55/bhLl5QqfUAP3ufEqr1T73h28LX2kc8jrxZnRv+rLC7h/UJf8fmkPR9cd2GW+Q0hnvWaGqb8ILTZrWIZBu+4c7IhRjrL+aahMU3UNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772819551; c=relaxed/simple;
	bh=2bD5C7jvlLxflrkfRGXqo+l2s4p8kN3Ch+5EVDDE7fE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TzYEJ8lmTXQVd4/NzJ6t0XxLzsAnCAQef5if4QmA26DZ/bVjXAzkfmnKDMAJxMXBJ8lnvI8gcZms9Aj/2Q2hRmm7+44s+7oPQlqncfWj1NMOE4QIzuiRH2rbOahUvVjVv4prgbTXTx+GrzukwdJJqLL7FGJfZyf8lWyhDLD1bFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GqDuG0bj; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4806cc07ce7so109183735e9.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Mar 2026 09:52:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772819547; x=1773424347; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kYf9cZD34CcbArpMkNc6VugylQHt++gZoLdJWNxJK1A=;
        b=GqDuG0bjoVhreImsweq25E9i9FNkDsvzD1PcU+GdeSVnYCXhu5l9bDZwmyx1aAy9s2
         yTBKOvMlkWVyTC95i7GzY1z3k9In21mXgtT/CyGHSv7Xszeij4S0srb+PMK5Ug4w/LAS
         NQE9Eb1Nr6++YP1fzuAxo8uyYJWttFC29cipxS3HDIR4Plndkps9vCFvlohrT3Vh13AG
         0/wHJqJRZ4Ds4I1W/X6ALjfGdl8xRsZP7m9HX30iNenXI74PiZr5aPriwvBt8E4hYyCd
         sb9/RYebHcgM7N3Er6QbP572szwbGJKk3ORut2871PBUPjB/31Bc4lieNjx//o5y7LtC
         SMLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772819547; x=1773424347;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kYf9cZD34CcbArpMkNc6VugylQHt++gZoLdJWNxJK1A=;
        b=V6jrbw04gm0Jfh3HgvRsKHARG8hyQGgSziqBtTqXOCM322PvOee7fwC4oSWKHB9AbD
         EiJol+N6ib/r0gz/JpOl+JLExX5Xe80d20pY+ttbwrEw4PTFWVKrc67wMZsawihVjhEp
         Lv9xug+A/hu5yVOG1Mkyfm5WXW4pCwpsA0IUoRpGqiZntolYPoxPjMIU4QV4XGoW1pva
         f3ouNGZYB+z79OlEWIq5oESGsePyVXb6PaKuYgerVzAdPzo69eE/swV58GZKhnPHyvMs
         WoVfExCsVukmVUBRHcMYvNmKHJfVdHhJxcve4xsGYqtooSSj7YVF/2SodNlmp3mxNbCn
         9cfg==
X-Forwarded-Encrypted: i=1; AJvYcCV0cSE7KJu/oqeHhSnk+wXDZU2Rdb92P0aTBN3azW5q7JYpp/WNP2GagZqzRekabU7Adp1uAgrGkfQQAF27@vger.kernel.org
X-Gm-Message-State: AOJu0YwfOihWGCDaInskqE+I1f03zCGUCTqKzA7KtWnTJQkmTMjGHykK
	NP2Rnt1u00t+d4sLvmTi+z4P7bjmhYqYX7pXL6arYvkpUHmYpYSZSuvr1sXe9Go4OJE=
X-Gm-Gg: ATEYQzxrW/eed4t1iP9A+HVX8fhPyGR7F62ssmHPZAmjbHD/lAQ41Vdv8pzVVSQB/Xf
	jx5aLsH3jZehBtnqgSMgjUrTPJoerxZ7RDwUZMM9cWl9DmK8p56dYgc9jUcbB/tEis4f0dic3Gn
	kLykI8nFYFP6gAPJPw39V68FmJ/7qI1Q++0lF2JHdr1L4jKnScBVeYJT9PwqnGpIMQojPubYHFa
	UmyhOjkaUjT++d/jDOc3fG41z80yPLrOBVRBwaDGWOFtARoEG/p6ys7OWMdff43XxWc1eZtj1cS
	2pO6rtngRjrxEDotEQ6AWkUy5VuU6U26Pn6PLB9Gh+okXVNrHNb8JrxLMtlMN3YJPXJI++7Q+Y7
	pE22XpRRjDSo728bj/VsG/ysr6UIAYd7JAlF4FxIYYAQ2GvaW7HdBFbV3qI6b4z+CW5OaWVjd7s
	qQlmGZv9LNcS90/MI83CgwTY1nlChUsuFfWXY=
X-Received: by 2002:a05:600c:529a:b0:485:2ce2:4c8e with SMTP id 5b1f17b1804b1-4852ce24da4mr2600435e9.1.1772819546996;
        Fri, 06 Mar 2026 09:52:26 -0800 (PST)
Received: from [192.168.1.102] ([93.107.81.172])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-485244a5c0esm37627935e9.4.2026.03.06.09.52.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Mar 2026 09:52:26 -0800 (PST)
Message-ID: <b0ac4984-358d-4b2e-838d-92e91dfff3af@linaro.org>
Date: Fri, 6 Mar 2026 17:52:23 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/5] media: camss: csid-340: Add VC-to-interface
 mapping
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
 vladimir.zapolskiy@linaro.org
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 mchehab@kernel.org, konrad.dybcio@oss.qualcomm.com,
 dmitry.baryshkov@oss.qualcomm.com
References: <20260306140220.1512341-1-loic.poulain@oss.qualcomm.com>
 <20260306140220.1512341-3-loic.poulain@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20260306140220.1512341-3-loic.poulain@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: AA8E622675C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-95903-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-arm-msm@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.946];
	RCPT_COUNT_SEVEN(0.00)[7];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:dkim,linaro.org:email,linaro.org:mid,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,qualcomm.com:email]
X-Rspamd-Action: no action

On 06/03/2026 14:02, Loic Poulain wrote:
> The CSID-340 block uses different register offsets for the PIX and RDI
> interfaces, but the driver previously indexed these registers directly
> with the VC number. This happened to work for RDI because the VC index
> matches the RDI register layout, but this assumption breaks with upcoming
> PIX interface support
> 
> Introduce an explicit VC-to-interface mapping and use the mapped iface
> index when programming CSID_CFG0 and CSID_CTRL. This replaces the
> standalone __csid_ctrl_rdi() helper and simplifies the RDI stream setup
> path.
> 
> Also correct the CSID_CFG0/CTRL base offsets and clean up the code in
> preparation for full PIX path support.
> 
> Like RDI, PIX outputs Bayer frames but can also achieve some image
> processing such as scaling, cropping and generating statitics (e.g.
> histogram), it also offer more flexebility in term of image alignment
> and stride. All of that can then later be leveraged to improve
> software or hardware frames post-processing.
> 
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> ---
>   .../platform/qcom/camss/camss-csid-340.c      | 43 ++++++++++++-------
>   1 file changed, 27 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss-csid-340.c b/drivers/media/platform/qcom/camss/camss-csid-340.c
> index adcbe3e01d62..9e80408727ee 100644
> --- a/drivers/media/platform/qcom/camss/camss-csid-340.c
> +++ b/drivers/media/platform/qcom/camss/camss-csid-340.c
> @@ -41,7 +41,7 @@
>   #define		CSI2_RX_CFG1_MISR_EN			BIT(6)
>   #define		CSI2_RX_CFG1_CGC_MODE			BIT(7)
>   
> -#define CSID_CFG0(iface)					(0x300 + 0x100 * (iface))
> +#define CSID_CFG0(iface)					(0x200 + 0x100 * (iface))
>   #define		CSID_CFG0_BYTE_CNTR_EN			BIT(0)
>   #define		CSID_CFG0_TIMESTAMP_EN			BIT(1)
>   #define		CSID_CFG0_DECODE_FORMAT_MASK		GENMASK(15, 12)
> @@ -51,10 +51,24 @@
>   #define		CSID_CFG0_DTID_MASK			GENMASK(28, 27)
>   #define		CSID_CFG0_ENABLE			BIT(31)
>   
> -#define CSID_CTRL(iface)					(0x308 + 0x100 * (iface))
> +#define CSID_CTRL(iface)					(0x208 + 0x100 * (iface))
>   #define CSID_CTRL_HALT_AT_FRAME_BOUNDARY		0
>   #define CSID_CTRL_RESUME_AT_FRAME_BOUNDARY		1
>   
> +#define CSID_MAX_RDI_SRC_STREAMS	(MSM_CSID_MAX_SRC_STREAMS - 1)
> +
> +enum csid_iface {
> +	CSID_IFACE_PIX,
> +	CSID_IFACE_RDI0,
> +	CSID_IFACE_RDI1,
> +	CSID_IFACE_RDI2,
> +};
> +
> +static enum csid_iface csid_vc_iface_map[CSID_MAX_RDI_SRC_STREAMS] = {
> +	[0] = CSID_IFACE_RDI0,
> +	[1] = CSID_IFACE_RDI1,
> +	[2] = CSID_IFACE_RDI2,
> +};
>   
>   static void __csid_configure_rx(struct csid_device *csid, struct csid_phy_config *phy)
>   {
> @@ -70,17 +84,13 @@ static void __csid_configure_rx(struct csid_device *csid, struct csid_phy_config
>   	writel_relaxed(val, csid->base + CSID_CSI2_RX_CFG1);
>   }
>   
> -static void __csid_ctrl_rdi(struct csid_device *csid, int enable, u8 rdi)
> -{
> -	writel_relaxed(!!enable, csid->base + CSID_CTRL(rdi));
> -}
> -
> -static void __csid_configure_rdi_stream(struct csid_device *csid, u8 enable, u8 vc)
> +static void __csid_configure_rdi_stream(struct csid_device *csid, bool enable, u8 vc)
>   {
>   	struct v4l2_mbus_framefmt *input_format = &csid->fmt[MSM_CSID_PAD_FIRST_SRC + vc];
>   	const struct csid_format_info *format = csid_get_fmt_entry(csid->res->formats->formats,
>   								   csid->res->formats->nformats,
>   								   input_format->code);
> +	enum csid_iface iface = csid_vc_iface_map[vc];
>   	u8 dt_id;
>   	u32 val;
>   
> @@ -106,23 +116,24 @@ static void __csid_configure_rdi_stream(struct csid_device *csid, u8 enable, u8
>   	if (enable)
>   		val |= CSID_CFG0_ENABLE;
>   
> -	dev_dbg(csid->camss->dev, "CSID%u: Stream %s (dt:0x%x vc=%u)\n",
> -		csid->id, enable ? "enable" : "disable", format->data_type, vc);
> +	dev_dbg(csid->camss->dev, "CSID%u: Stream %sable RDI (dt:0x%x vc:%u)\n",
> +		csid->id, enable ? "en" : "dis", format->data_type, vc);
>   
> -	writel_relaxed(val, csid->base + CSID_CFG0(vc));
> +	writel_relaxed(val, csid->base + CSID_CFG0(iface));
> +	writel_relaxed(enable, csid->base + CSID_CTRL(iface));
>   }
>   
> +
>   static void csid_configure_stream(struct csid_device *csid, u8 enable)
>   {
>   	int i;
>   
>   	__csid_configure_rx(csid, &csid->phy);
>   
> -	for (i = 0; i < MSM_CSID_MAX_SRC_STREAMS; i++) {
> -		if (csid->phy.en_vc & BIT(i)) {
> -			__csid_configure_rdi_stream(csid, enable, i);
> -			__csid_ctrl_rdi(csid, enable, i);
> -		}
> +	/* RDIs */
> +	for (i = 0; i < CSID_MAX_RDI_SRC_STREAMS; i++) {
> +		if (csid->phy.en_vc & BIT(i))
> +			__csid_configure_rdi_stream(csid, !!enable, i);
>   	}
>   }
>   

You've a stray \n which I will fix for you on application.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

