Return-Path: <linux-arm-msm+bounces-95911-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +AQEMdYXq2nMZwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95911-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Mar 2026 19:07:18 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AC55226904
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Mar 2026 19:07:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C07E03012503
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Mar 2026 18:07:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B6BC366803;
	Fri,  6 Mar 2026 18:07:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dD6zvk2Y"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10D933176FD
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Mar 2026 18:07:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772820436; cv=none; b=o5E5gjWlM1J+qSPNPQdUuz0W5Kf380YOU6YsMjDq9qx7qswP8jGgUr2iXnBqFvNUKksSxVGJxwASq/sNtt94u47o8M4KYHGIUp6/BxbakC8bIJXBBqf/iOWurev4ALl7IsE4CAmCGYW6CpWQEHdjYoVxnUrKat6LeHC/Pkzk5BQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772820436; c=relaxed/simple;
	bh=za/u5OWT6vGjVtXAlbEKi0r0Fy2n+xpZHa4RApaK/60=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=I/kv1WkTVLTXlq4snFevPhiANgFccIfP6SIvRV3rVshvP3hUIrOOvtrF/Ulv/m6t3RRd3uA5sM0I6VEQQtjceEek5mxJ9kDTvWycX4UtxWKqmdyT83ylepWcEh/eR+WThkRIA5Y9F0VpNieetAfMMTdYYfHmhLairpdMpR7kiZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dD6zvk2Y; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4838c15e3cbso87541755e9.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Mar 2026 10:07:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772820433; x=1773425233; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=paY3nSpAVM1sX639S9JaAR1ZcjfM4x2sHww4ugttz7E=;
        b=dD6zvk2Yaf5hcvWcHzJMeC6eZ5uwTtkbN9rB3BxgEHTatsG/39WmC7J6kSHOqzhtXD
         fzdMZeZqnDjZkob28R0uRd0wdtjH28LfxWCGs2CsZBQV3uAAppPwwZnGFEPrnS5ZVPiF
         0vLqwGIdTj+uVrEO4I3IlUiaJzvk+U8Gyr2XlKrqFjVNw74E9arjV4Xm7BKNvWCnq7WA
         o5RzjZIOqnW3xyEOzKq+GhFgnL9fEKdh416YyoxBPOdH6t0lCWQJNZioJx/KpPCd/A9I
         uAYn4WF0e1Zw5LHAJmkZzFR3giQYE75un7IVCDwZIdM5J3JOhNKhAnywjlD9s1hf9M5n
         1AQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772820433; x=1773425233;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=paY3nSpAVM1sX639S9JaAR1ZcjfM4x2sHww4ugttz7E=;
        b=iarhxnPQVRXFTxygzXybdho1ewHBNaOc82ICSKxCwhAvSmZeLZMtrtluCszR1qQFvj
         CvxsSCKbMfN77XPfiqQXDiczsfLDg72SXkZiJkByh2RR5f8ZllfFLuWVU+Ymz2QpxvQt
         Kx6U39+KM8SwX2Y0kS6eJ+n2SgCOSLgmiLbcCRtqcNu01ITj/MPAmqvaLD4AjnpdCSDN
         nV2ggCtkPAw3816136oS6+3ilTznY7dMTOkM18yXqUbfbvuV4fnek7ufEzI3KZmq86HO
         EGKv26dDLEUVVPucl8ST1E3wI101gT5natfPw+EnR7ByP6t0p7A/+PRNwTmED8jdZDMO
         k4mg==
X-Forwarded-Encrypted: i=1; AJvYcCW+SwX8gHdzqhr5upc950Jvrq1doQK7bjZSaPIx3Kcs7C4ysotdpjD/THfcrCh4ZR0B0mpXP0zI0e8RlbgJ@vger.kernel.org
X-Gm-Message-State: AOJu0YxpWOexKoLZjO9RwccopVsVJ4HvOyevrZEql4OVGVfxZA/+nKBb
	Lv2XRGoTQCi5+9m0mOyXl08k+0VxqEZfoZvMQL2a3JOeGmpAmv2aM8955LI2IypbmAY=
X-Gm-Gg: ATEYQzytA78KbIQinvqMclfAXrSDh1usw2eMEEsp0SvqBnrLHfO1CoqBvk3vNAAQ+x8
	/QEpY+yOfinYYZDfiHXCSz1ceZw0l03BaiObOnvBKgEfkT9ByA/8Mz5ko1A4ELc9xRuOsyi2EYF
	c7K9/E66rwu+QYvr81B3Z9FZ8RY7ffO37gJrkPkLwQGwN8Lw5rav30XmUSSGwVGttWH+VLoTxG+
	Jc7FO3XoMA27v73lVxzxzC/NfmGKBZ59DhQh+6LHqGim+ThFk2ABqe1AIP5sDwZoMK63WILFzBX
	f8s9BFGY7LM7lHoW7sdU/E072zYVQnC/+KfTifEa+m1EcswkulcHV9lpyEzv/i5T3sxS/mzkD8o
	HgI7InGP5r7Oa/VsbhwkLV9emG3KOG28R783RAXuvQXXm3qLquGxVWzmYJWjY9lmDgAX8PH4Vgl
	sciXqmeEr7SXZiyUJIMZaBk7ZxDJEZOSp5aJc=
X-Received: by 2002:a05:600c:5253:b0:475:da1a:53f9 with SMTP id 5b1f17b1804b1-4852692c99bmr49110955e9.14.1772820433357;
        Fri, 06 Mar 2026 10:07:13 -0800 (PST)
Received: from [192.168.1.102] ([93.107.81.172])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-485237dcf87sm23627765e9.1.2026.03.06.10.07.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Mar 2026 10:07:12 -0800 (PST)
Message-ID: <6f341604-fc77-4329-ba0a-2d67ef01e60a@linaro.org>
Date: Fri, 6 Mar 2026 18:07:10 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] media: camss: Use proper BPL alignment helper and
 non-power-of-two rounding
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
 vladimir.zapolskiy@linaro.org
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 mchehab@kernel.org
References: <20260306160006.1513177-1-loic.poulain@oss.qualcomm.com>
 <20260306160006.1513177-3-loic.poulain@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20260306160006.1513177-3-loic.poulain@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 6AC55226904
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-95911-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.946];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,qualcomm.com:email,linaro.org:dkim,linaro.org:mid]
X-Rspamd-Action: no action

On 06/03/2026 16:00, Loic Poulain wrote:
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

This seems fine.

I still don't think the error handling in the dependent function is 
right/warranted so I'll hold off on RB until you updated that.

---
bod

