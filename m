Return-Path: <linux-arm-msm+bounces-100602-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qK2NF2YDyWl4tQUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100602-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Mar 2026 12:48:06 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BE8C351A09
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Mar 2026 12:48:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 2D02930060B8
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Mar 2026 10:48:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A9002FFF9D;
	Sun, 29 Mar 2026 10:48:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VMFFCopV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D85D2DC792
	for <linux-arm-msm@vger.kernel.org>; Sun, 29 Mar 2026 10:47:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774781281; cv=none; b=ZVqdq10hSifo6EQtFh6GvYIjntItEiTsbSI25s8ZZE/a3Yjj9alFE5oT444XoqrgyKb/4dlujw9wf621Z6uR8SZmH6d1meFVehNHTvkmWpud3XqFW1Yr5CH/QdnqHV+dUIdqF8+QqRShPLLG3IpLATATAjCWH+5oKLAjSPNzKI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774781281; c=relaxed/simple;
	bh=68gXmVcZU5GN4jgGwt36iPqG0zA4iJPmM/O/kREzA9E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=n4WaA//mrarmLwTR2AB1M+nTOYktsnSgwM34OPLpl9m4fX+6gvuXGRYrAzi7mylk7VNjvuR6TNz/mhoKrLWmNutHcvWwQL1Eu120hM+Srh277dNI4uVM6wa91HoUAI2ZOdbwXbr7MqRm0Ba0gDREUvN1SutLuE7IA2o2KMbI3jY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VMFFCopV; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-486fe655187so44740735e9.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 29 Mar 2026 03:47:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774781278; x=1775386078; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JtjFNYtwQ+MSt7QhABeLSXCowPvIkslY/0SivHMBnFg=;
        b=VMFFCopVyTnAUVIi/LP7NIAM/zQTi148No3j62fJG/Jvmk17G5BF22ZXl9XgVxo2GK
         S7IqMZxc1sKfxaljJrpjLzD/3qyLD1/reXnuqEev4Zdr1KLUDsTcvBu7iq03qdE/khqt
         p25bJWTMAk8p9NEheIEH8S7mtpWWSoWMBA5ifwRjJSUEFtM0VyJVli5PpxqXMgNfeoLu
         4qDoR2NtTRjvu6NLxy4vJHI/EsI968zqP0pVIhSpjluHDkdRaZp4Eu7lKjH3a+7zdQBi
         hYhH1oeIA7NL6pwVsHzRvnsZDVY+kxSNvzW+MeSxfOSuHp8QxpT0iI0XsIFcdE2131GF
         ce6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774781278; x=1775386078;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JtjFNYtwQ+MSt7QhABeLSXCowPvIkslY/0SivHMBnFg=;
        b=IHMl03VDTLmdiVpF9dD0wVXAorGe9pJsYpE80/DpkS0KtlFzfNJ//wxgmNvmu7PKwW
         SHHFx+dLiQexDP7A67X9P4cF0oN221F2SD8HWBQjsG+wDG8iebOq3D4gi1TQUG9vKvok
         T/xfwhdLjQ0qQMLuG8RGyP098sDPq0HiCQXrp2cjxmh4aYPcoHVnfpzf8bJzOfbe52IP
         vJ5dUkmtrRqC5kAfeS81yueXUaz4QDYbN3ND/Rb3IWWBhoEHhvpxO6dcE0rt5GhXG7PB
         C/oOgaoOj3licAWpYQKkt2mvGAM5Wgm0RP8b4WdmtCAVmgF95FegU6QmjDZqh0ldLBdf
         PfzQ==
X-Forwarded-Encrypted: i=1; AJvYcCUhAnxP6KO1mTQdUnnh55JNTrmaLZl9gkgFhuwTE+6K10joUUbbp2cIqyJ6qjksHU4A6MItpXBg8RszSIgk@vger.kernel.org
X-Gm-Message-State: AOJu0YxWskukaPz9e25JeQi6k5KMRxCnDV4qayRR3LhLeBVvUKK7QaUz
	T4Rfnz3pD0Xsp6jcwXbHYOS3vHHcYtQ9l8R2ZuM5VUqqyRaD+oO2hoq7HSxYUCYuOeA=
X-Gm-Gg: ATEYQzzc0kw426mvn3WE1wcG3saXPqK7W0ufbVNmFMn8OX91Rt8lxyK7qGATdxXCmn/
	Jreuj4e02kfZdmAYjP3SYHolhA6xt1BSzMV69lCIwJUBhhcvWoQvwWUm/wYCAv8YIrKv7iiI6vM
	/WyTUS4l5tWasM54kTej4k1v1FxNqiAfj+pIOVH7qw4RJMpzNWeXTzwnalWOp3BymjyQte9Uitg
	XTBAWpcwZaRTiL9SY8gsVkwhmId/B1lmcdGsIwZ9643Yc5CAqi7Lpbr2FyNgy1n729YcwoULqIz
	toskue208reHsCPU2JeEfAsHkjhP7BfKzF4Zveof2fc3Njs5Th9oaW1t2RyEqmxMqqUXX0hhcg3
	to1N9Diec9stYGq1z4Py4a3Ou5aFGYYlpeg8PXCrykwkJYcLU0e9ySr7weS2P0RslAb9ipkXUO3
	Pauqr6ICIbp0qRJ1i2erSvjN+g4xQ4x98=
X-Received: by 2002:a05:600c:6387:b0:487:cd8:4c9 with SMTP id 5b1f17b1804b1-48727ed5618mr141150335e9.27.1774781277703;
        Sun, 29 Mar 2026 03:47:57 -0700 (PDT)
Received: from [192.168.0.35] ([64.43.41.12])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48725eae727sm94054905e9.2.2026.03.29.03.47.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 29 Mar 2026 03:47:57 -0700 (PDT)
Message-ID: <1ad5f031-cfd5-4feb-9092-03214872509e@linaro.org>
Date: Sun, 29 Mar 2026 11:48:01 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/5] media: qcom: camss: vfe-340: Support for PIX
 client
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
 vladimir.zapolskiy@linaro.org
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 mchehab@kernel.org, konrad.dybcio@oss.qualcomm.com,
 dmitry.baryshkov@oss.qualcomm.com
References: <20260313131750.187518-1-loic.poulain@oss.qualcomm.com>
 <20260313131750.187518-6-loic.poulain@oss.qualcomm.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20260313131750.187518-6-loic.poulain@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-100602-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-arm-msm@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 4BE8C351A09
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 13/03/2026 13:17, Loic Poulain wrote:
> Add support for the vfe-340 PIX write engine, enabling frame capture
> through the PIX video device (e.g. msm_vfe0_pix). The PIX path requires
> a separate configuration flow from RDI, including cropping setup, line-
> based write engine configuration, and the correct packer format based
> on the input pixel format.
> 
> In contrast to RDI, the PIX interface embeds a lightweight processing
> engine we can use for cropping, configuring custom stride/alignment,
> and, in the future, extracting frame statistics.
> 
> The functionality has been validated on Arduino-Uno-Q with:
> media-ctl -d /dev/media0 --reset
> media-ctl -d /dev/media0 -l '"msm_csiphy0":1->"msm_csid0":0[1],"msm_csid0":4->"msm_vfe0_pix":0[1]'
> media-ctl -d /dev/media0 -V '"imx219 1-0010":0[fmt:SRGGB8_1X8/640x480 field:none]'
> media-ctl -d /dev/media0 -V '"msm_csiphy0":0[fmt:SRGGB8_1X8/640x480 field:none]'
> media-ctl -d /dev/media0 -V '"msm_csid0":0[fmt:SRGGB8_1X8/640x480 field:none]'
> media-ctl -d /dev/media0 -V '"msm_vfe0_pix":0[fmt:SRGGB8_1X8/640x480 field:none]'
> yavta -B capture-mplane --capture=3 -n 3 -f SRGGB8 -s 640x480 /dev/video3
> 
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> ---
>   .../media/platform/qcom/camss/camss-vfe-340.c | 85 ++++++++++++++++---
>   1 file changed, 75 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss-vfe-340.c b/drivers/media/platform/qcom/camss/camss-vfe-340.c
> index d129b0d3a6ed..600c472534fb 100644
> --- a/drivers/media/platform/qcom/camss/camss-vfe-340.c
> +++ b/drivers/media/platform/qcom/camss/camss-vfe-340.c
> @@ -54,6 +54,7 @@
>   
>   #define TFE_BUS_CLIENT_CFG(c)				BUS_REG(0x200 + (c) * 0x100)
>   #define		TFE_BUS_CLIENT_CFG_EN		BIT(0)
> +#define		TFE_BUS_CLIENT_CFG_AUTORECOVER	BIT(4)
>   #define		TFE_BUS_CLIENT_CFG_MODE_FRAME	BIT(16)
>   #define TFE_BUS_IMAGE_ADDR(c)				BUS_REG(0x204 + (c) * 0x100)
>   #define TFE_BUS_FRAME_INCR(c)				BUS_REG(0x208 + (c) * 0x100)
> @@ -63,12 +64,23 @@
>   #define TFE_BUS_IMAGE_CFG_2(c)				BUS_REG(0x214 + (c) * 0x100)
>   #define		TFE_BUS_IMAGE_CFG_2_DEFAULT	0xffff
>   #define TFE_BUS_PACKER_CFG(c)				BUS_REG(0x218 + (c) * 0x100)
> +#define		TFE_BUS_PACKER_CFG_FMT_PLAIN8	0x1
>   #define		TFE_BUS_PACKER_CFG_FMT_PLAIN64	0xa
> +#define		TFE_BUS_PACKER_CFG_FMT_MIPI10	0xc
> +#define		TFE_BUS_PACKER_CFG_FMT_MIPI12	0xd
>   #define TFE_BUS_IRQ_SUBSAMPLE_CFG_0(c)			BUS_REG(0x230 + (c) * 0x100)
>   #define TFE_BUS_IRQ_SUBSAMPLE_CFG_1(c)			BUS_REG(0x234 + (c) * 0x100)
>   #define TFE_BUS_FRAMEDROP_CFG_0(c)			BUS_REG(0x238 + (c) * 0x100)
>   #define TFE_BUS_FRAMEDROP_CFG_1(c)			BUS_REG(0x23c + (c) * 0x100)
>   
> +#define PP_CROP_REG(a)					(0x2800 + (a))
> +#define TFE_PP_CROP_CFG					PP_CROP_REG(0x60)
> +#define		TFE_PP_CROP_CFG_EN	(BIT(0) | BIT(9))
> +#define	TFE_PP_CROP_LINE_CFG				PP_CROP_REG(0x68)
> +#define		TFE_PP_CROP_FIRST	GENMASK(29, 16)
> +#define		TFE_PP_CROP_LAST	GENMASK(13, 0)
> +#define	TFE_PP_CROP_PIX_CFG				PP_CROP_REG(0x6C)
> +
>   enum tfe_client {
>   	TFE_CLI_BAYER,
>   	TFE_CLI_IDEAL_RAW,
> @@ -245,18 +257,72 @@ static void vfe_wm_update(struct vfe_device *vfe, u8 wm, u32 addr,
>   	writel_relaxed(addr, vfe->base + TFE_BUS_IMAGE_ADDR(client));
>   }
>   
> +static u32 vfe_packer_format(struct vfe_device *vfe, u32 pixelformat)
> +{
> +	const struct camss_formats *fmt = vfe->res->formats_rdi;
> +	int i;
> +
> +	for (i = 0; i < fmt->nformats; i++)
> +		if (fmt->formats[i].pixelformat == pixelformat)
> +			break;
> +
> +	if (i >= fmt->nformats)
> +		return TFE_BUS_PACKER_CFG_FMT_PLAIN64;
> +
> +	switch (fmt->formats[i].mbus_bpp) {
> +	case 8:
> +		return TFE_BUS_PACKER_CFG_FMT_PLAIN8;
> +	case 10:
> +		return TFE_BUS_PACKER_CFG_FMT_MIPI10;
> +	case 12:
> +		return TFE_BUS_PACKER_CFG_FMT_MIPI12;
> +	default:
> +		dev_err(vfe->camss->dev, "VFE%u: Unsupported pixelformat", vfe->id);

This to me is wierd.

If a bpp is wrong we should detect that fact well before writing a value 
to a register and we shouldn't proceed to write a wrong value anyway.

If there is a real prospect to even have the bpp be something other than 
what we accept then that error should be trapped prior to wm_start() and 
the error thrown up the call stack in a meaningful way.

> +	}
> +
> +	return TFE_BUS_PACKER_CFG_FMT_PLAIN64;
> +}
> +
>   static void vfe_wm_start(struct vfe_device *vfe, u8 wm, struct vfe_line *line)
>   {
>   	struct v4l2_pix_format_mplane *pix = &line->video_out.active_fmt.fmt.pix_mp;
>   	u32 stride = pix->plane_fmt[0].bytesperline;
>   	u8 client = tfe_wm_client_map[wm];
> -
> -	/* Configuration for plain RDI frames */
> -	writel_relaxed(TFE_BUS_IMAGE_CFG_0_DEFAULT, vfe->base + TFE_BUS_IMAGE_CFG_0(client));
> -	writel_relaxed(0u, vfe->base + TFE_BUS_IMAGE_CFG_1(client));
> -	writel_relaxed(TFE_BUS_IMAGE_CFG_2_DEFAULT, vfe->base + TFE_BUS_IMAGE_CFG_2(client));
> -	writel_relaxed(stride * pix->height, vfe->base + TFE_BUS_FRAME_INCR(client));
> -	writel_relaxed(TFE_BUS_PACKER_CFG_FMT_PLAIN64, vfe->base + TFE_BUS_PACKER_CFG(client));
> +	u32 cfg = TFE_BUS_CLIENT_CFG_EN;
> +
> +	if (client == TFE_CLI_BAYER) { /* PIX - Line based */
> +		struct v4l2_rect *crop = &line->crop;
> +
> +		/* Cropping */
> +		writel_relaxed(TFE_PP_CROP_CFG_EN, vfe->base + TFE_PP_CROP_CFG);
> +		writel_relaxed(FIELD_PREP(TFE_PP_CROP_FIRST, crop->top) |
> +			       FIELD_PREP(TFE_PP_CROP_LAST, crop->top + crop->height - 1),
> +			       vfe->base + TFE_PP_CROP_LINE_CFG);
> +		writel_relaxed(FIELD_PREP(TFE_PP_CROP_FIRST, crop->left) |
> +			       FIELD_PREP(TFE_PP_CROP_LAST, crop->left + crop->width - 1),
> +			       vfe->base + TFE_PP_CROP_PIX_CFG);
> +
> +		/* Write Engine */
> +		writel_relaxed(pix->width + (pix->height << 16),
> +			       vfe->base + TFE_BUS_IMAGE_CFG_0(client));

Shouldn't this be width | height not with + height since you are 
shifting by a nibble.

> +		writel_relaxed(0u, vfe->base + TFE_BUS_IMAGE_CFG_1(client));
> +		writel_relaxed(stride, vfe->base + TFE_BUS_IMAGE_CFG_2(client));
> +		writel_relaxed(stride * pix->height, vfe->base + TFE_BUS_FRAME_INCR(client));
> +		writel_relaxed(vfe_packer_format(vfe, pix->pixelformat),
> +			       vfe->base + TFE_BUS_PACKER_CFG(client));
> +
> +		cfg |= TFE_BUS_CLIENT_CFG_AUTORECOVER;
> +	} else { /* RDI - Frame based */
> +		writel_relaxed(TFE_BUS_IMAGE_CFG_0_DEFAULT,
> +			       vfe->base + TFE_BUS_IMAGE_CFG_0(client));
> +		writel_relaxed(0u, vfe->base + TFE_BUS_IMAGE_CFG_1(client));
> +		writel_relaxed(TFE_BUS_IMAGE_CFG_2_DEFAULT,
> +			       vfe->base + TFE_BUS_IMAGE_CFG_2(client));
> +		writel_relaxed(stride * pix->height, vfe->base + TFE_BUS_FRAME_INCR(client));
> +		writel_relaxed(TFE_BUS_PACKER_CFG_FMT_PLAIN64,
> +			       vfe->base + TFE_BUS_PACKER_CFG(client));
> +		cfg |= TFE_BUS_CLIENT_CFG_MODE_FRAME;
> +	}
>   
>   	/* No dropped frames, one irq per frame */
>   	writel_relaxed(0, vfe->base + TFE_BUS_FRAMEDROP_CFG_0(client));
> @@ -266,11 +332,10 @@ static void vfe_wm_start(struct vfe_device *vfe, u8 wm, struct vfe_line *line)
>   
>   	vfe_enable_irq(vfe);
>   
> -	writel(TFE_BUS_CLIENT_CFG_EN | TFE_BUS_CLIENT_CFG_MODE_FRAME,
> -	       vfe->base + TFE_BUS_CLIENT_CFG(client));
> +	writel(cfg, vfe->base + TFE_BUS_CLIENT_CFG(client));
>   
>   	dev_dbg(vfe->camss->dev, "VFE%u: Started client %u width %u height %u stride %u\n",
> -		vfe->id, client, pix->width, pix->height, client);
> +		vfe->id, client, pix->width, pix->height, stride);
>   }
>   
>   static void vfe_wm_stop(struct vfe_device *vfe, u8 wm)


