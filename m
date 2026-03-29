Return-Path: <linux-arm-msm+bounces-100600-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id J9XXI5YAyWkqtQUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100600-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Mar 2026 12:36:06 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B472B35196E
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Mar 2026 12:36:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 60A51301224E
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Mar 2026 10:36:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E935A3101A9;
	Sun, 29 Mar 2026 10:36:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UI7QGgJo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 744CF2D23BC
	for <linux-arm-msm@vger.kernel.org>; Sun, 29 Mar 2026 10:36:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774780563; cv=none; b=FgobihG+/cQMhDE8zM1hglZKYdZ+vhx03rQ/ouQc1aqZsyDxLNk/p98Gakklm9uXendo3AbXWgPGlEhwl/VyHoQlAbuszlZDhUpIj8dYLavcGzo2h5CPYuuXNB2lQ5bbUbHYXLGHPEOcUwLjEbM8Cs4j98ToufV9Jr5KMcXmCFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774780563; c=relaxed/simple;
	bh=otXHHIxUcVkOKT4kg/b8IKo9nR1gEbZGzgVmxCC6PSo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=R4xyl42BigfBWrxaZvphRkJGRQCSKP0lnkjUychYPFeDvLOZcFax/EA9qKv4TvEJJL+86eCs0LiRKpSqaYxrOqKqapDjIIo8M+uwFc6YVjbhV87Ywlz7MZaIf8VIalOzNW+tKplkjCbspi1aRoSR3C6lt5IHljlQcJfSmGxOGs8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UI7QGgJo; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-486fe655187so44670805e9.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 29 Mar 2026 03:36:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774780561; x=1775385361; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bchxObtGWko8YywUX16TMs4qLqqo6ynrliog/EkgTB8=;
        b=UI7QGgJo5UnuQyandvC9eBzLPlsuP3etqWz1h+8+YIzX3wPQTWLUzHg4jR8t4NOTdW
         6hI9Das94pWZv3GBC8Skkz8oJafsmTsPV0fg0szrs0YeT7j34/TDPqXHBApyLf5T+p51
         ycn7MJm9OFZCSJTwB2uPyDGj1j4JpLlBcCn4cuOVcAe/Dz10R0wHp2rCHfoOGm2ZFQn0
         Ls7TG/7KHHYjRsLP7YtTyjWVdlskeeMPNsPCHOJyc4sjRM0NWr712btGNSsJE087Y6E5
         L7hDJpyglmZj6rmFYPkZqGLtoXCM49y82cE4bN5R5s8zjOCo1D2LtCS32feQ7xd3HO7I
         RRZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774780561; x=1775385361;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bchxObtGWko8YywUX16TMs4qLqqo6ynrliog/EkgTB8=;
        b=V3XrMDBX721E0RtCvXXj+S1cNVMIssdCXfHped0FC3INHzv6aciL4vKZM338e02Okd
         GB8oRnGPUvQnlOz0KqvJ2aU9nfFvC2N0InDq4TVzcOei6IcZawb6/odRL+LzJnC8DwYA
         7IatiM3YjfL33Ww9isG4NyhINujdLY+/khOh6YcArFXvt8MTE08AZix19tYlvXBLPjck
         jBsoYL4Vq/ezFbz2DO0qG+YDYh7MuKITFvVe7QQcPhsZ9F1bW8QbmGMDegIER+Nu9wKu
         t1pfb5Ad/lM/vRgGi3AdylZbApguksxBvAJAc7vRGgzdILQdAgZmmcUPV4oV3NzVYIZg
         Zmgg==
X-Forwarded-Encrypted: i=1; AJvYcCWUV/9qMD+aFbuD7yvqQO2OK5bONZuQUmYrM6Aznv5r0jon06eYquplRrA75ZJOprsGwOKniKl46nUu6YfI@vger.kernel.org
X-Gm-Message-State: AOJu0YxRSGqxhdKpBhZ+ndrMTAlvScmysMYKmxx1TCHWVzlY+sYWv8Kg
	ak+QCeceX+ggRY9GcFpu3KQ67lTjun1FydlqaRHx/XzUTw4KNh8I/mDkL6Da/OnfUPnRBkTv1Jt
	DsRav
X-Gm-Gg: ATEYQzzZSmrFhPNBk3uRfrLTQ9vwTJ+9lX4jelLy37CZOYLrIuno7eyrXD7uM20JUSj
	7tpAS9DeGGtpUPh4HlPRT1Z8soGY1XfKUGxZCVS9NPiNvT4yKjXxLVo2ySLu5RhTnujTFaSEIdB
	7bssGS6llXguZsb+WKqGYYZF99txFEaXhzGvvkUfkVZi/2t60HTqE+EaoJOw53J4hM4JV3obsWa
	M1uV1UEnK/xxoH0iVn5QwPyPXkqsJJOG+8GavqEcxD8cpYtnu5bV43c8y+QdSKyMjVUNdXXP+3F
	PlC6Jq7bvKBWJQXvEfVRDkqQsezYFC3vMzNzzrIuwJiLcZRymtRiw0gx7lubqQgBe2khNxGo7qm
	WG+cQdS3ksQterUgtuOtxmatbDRwELw8DFmueZHmM9B3UVo4leJpXu+zDi23upSrxhchTak/fN/
	bmMDL8TaJ0ucs/3m3TtKpMmsdM5fC9TyQ=
X-Received: by 2002:a05:600c:8b6d:b0:485:35ba:1d81 with SMTP id 5b1f17b1804b1-48727eb7fb7mr148621085e9.21.1774780560818;
        Sun, 29 Mar 2026 03:36:00 -0700 (PDT)
Received: from [192.168.0.35] ([64.43.41.12])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43cf245f8a3sm11835742f8f.24.2026.03.29.03.35.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 29 Mar 2026 03:36:00 -0700 (PDT)
Message-ID: <1dd66c87-1b4d-4f86-a00f-229552ed3e74@linaro.org>
Date: Sun, 29 Mar 2026 11:36:04 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] media: qcom: camss: Use proper BPL alignment
 helper and non-power-of-two rounding
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
 vladimir.zapolskiy@linaro.org
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 mchehab@kernel.org
References: <20260313195152.275196-1-loic.poulain@oss.qualcomm.com>
 <20260313195152.275196-3-loic.poulain@oss.qualcomm.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20260313195152.275196-3-loic.poulain@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-100600-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Queue-Id: B472B35196E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 13/03/2026 19:51, Loic Poulain wrote:
> Bytes-per-line (BPL) alignment in CAMSS currently uses ALIGN(), which
> only works correctly for power-of-two values. Some RAW Bayer packing
> formats (e.g. RAW10/12/14) require non-power-of-two alignment such as
> 3, 5, or 7-byte multiples, so ALIGN() produces incorrect results.
> 
> Introduce the use of roundup() with the per-format alignment returned by
> camss_format_get_bpl_alignment() when no hardware alignment is enforced
> (video->bpl_alignment).
> 
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/camss/camss-video.c | 13 ++++++++++---
>   1 file changed, 10 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss-video.c b/drivers/media/platform/qcom/camss/camss-video.c
> index f52d8e84f970..0852eb6f1315 100644
> --- a/drivers/media/platform/qcom/camss/camss-video.c
> +++ b/drivers/media/platform/qcom/camss/camss-video.c
> @@ -47,6 +47,9 @@ static int video_mbus_to_pix_mp(const struct v4l2_mbus_framefmt *mbus,
>   	unsigned int i;
>   	u32 bytesperline;
>   
> +	if (!alignment)
> +		alignment = camss_format_get_bpl_alignment(f);
> +
>   	memset(pix, 0, sizeof(*pix));
>   	v4l2_fill_pix_format_mplane(pix, mbus);
>   	pix->pixelformat = f->pixelformat;
> @@ -54,7 +57,7 @@ static int video_mbus_to_pix_mp(const struct v4l2_mbus_framefmt *mbus,
>   	for (i = 0; i < pix->num_planes; i++) {
>   		bytesperline = pix->width / f->hsub[i].numerator *
>   			f->hsub[i].denominator * f->bpp[i] / 8;
> -		bytesperline = ALIGN(bytesperline, alignment);
> +		bytesperline = roundup(bytesperline, alignment);
>   		pix->plane_fmt[i].bytesperline = bytesperline;
>   		pix->plane_fmt[i].sizeimage = pix->height /
>   				f->vsub[i].numerator * f->vsub[i].denominator *
> @@ -459,6 +462,7 @@ static int video_g_fmt(struct file *file, void *fh, struct v4l2_format *f)
>   
>   static int __video_try_fmt(struct camss_video *video, struct v4l2_format *f)
>   {
> +	unsigned int alignment = video->bpl_alignment;
>   	struct v4l2_pix_format_mplane *pix_mp;
>   	const struct camss_format_info *fi;
>   	struct v4l2_plane_pix_format *p;
> @@ -491,6 +495,9 @@ static int __video_try_fmt(struct camss_video *video, struct v4l2_format *f)
>   	width = pix_mp->width;
>   	height = pix_mp->height;
>   
> +	if (!alignment)
> +		alignment = camss_format_get_bpl_alignment(fi);
> +
>   	memset(pix_mp, 0, sizeof(*pix_mp));
>   
>   	pix_mp->pixelformat = fi->pixelformat;
> @@ -500,7 +507,7 @@ static int __video_try_fmt(struct camss_video *video, struct v4l2_format *f)
>   	for (i = 0; i < pix_mp->num_planes; i++) {
>   		bpl = pix_mp->width / fi->hsub[i].numerator *
>   			fi->hsub[i].denominator * fi->bpp[i] / 8;
> -		bpl = ALIGN(bpl, video->bpl_alignment);
> +		bpl = roundup(bpl, alignment);
>   		pix_mp->plane_fmt[i].bytesperline = bpl;
>   		pix_mp->plane_fmt[i].sizeimage = pix_mp->height /
>   			fi->vsub[i].numerator * fi->vsub[i].denominator * bpl;
> @@ -525,7 +532,7 @@ static int __video_try_fmt(struct camss_video *video, struct v4l2_format *f)
>   			lines = p->sizeimage / p->bytesperline;
>   
>   			if (p->bytesperline < bytesperline[i])
> -				p->bytesperline = ALIGN(bytesperline[i], 8);
> +				p->bytesperline = roundup(bytesperline[i], alignment);
>   
>   			if (p->sizeimage < p->bytesperline * lines)
>   				p->sizeimage = p->bytesperline * lines;

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

