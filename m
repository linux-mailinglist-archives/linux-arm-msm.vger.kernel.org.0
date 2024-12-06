Return-Path: <linux-arm-msm+bounces-40790-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B2A359E711A
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Dec 2024 15:51:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 34C621684AC
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Dec 2024 14:51:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 421242036FA;
	Fri,  6 Dec 2024 14:51:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="P7D43zKc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14BE21527AC
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Dec 2024 14:51:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733496699; cv=none; b=vB6gdrxXntgIb/M1yicmQ0TPlIswaN/meLf6cQgEV6zd5KUu83iMs1/3kwCekyAFLD5V1Y5cnLVHj7snfsbBqt2UwU2il+lnd3lra677533E/2R9UoW8sEm4HctWtCMtlzf/YIXg0RK51TAmWxZsn5HjrArIYy+1UW+2lGFZkdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733496699; c=relaxed/simple;
	bh=/tuYPwJTtJ4Svob5I/ujRMdmikjrzcucjhMGBvhTg/A=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=DDaafS9DC6VHdFIoOrgawEng5VzjSh7ygqnYhnKiCg1Xuv2y6JWT8zQHaVxzCWZ+BilIQy7w3AeJVcmqiiQPBb/l32kDWAq5+JNNQyD8+AcvDgkU5E5P1+KrC2iGfddtH5c97A194cxbh4VfC+zuyQTcavW2Gy5vCme940AgRi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=P7D43zKc; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5d2726c0d45so2794859a12.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Dec 2024 06:51:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1733496694; x=1734101494; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u4sWRf4hJF+nJwKhKGaqJGBfySo0Ly+PnsMhNpbfdzo=;
        b=P7D43zKchPrhdx3fk4Ecjry55dvz3dYInI/0bHsdDgwvTvqIv+CjFOgtb5nq2NC581
         1KIUWBnoLGanbgqju8OX0gunuamecdC07hwa0oPs2YdmkGXa6LFzdEjLlbHk6oMh0tJK
         ZoiQu56CDMfc+VZNAY1g5dhrKdGxmDwdqzgjWFBcTeyHa8JEsJOiYJIIUof0UMQVvrM/
         S7kzXSEk2zK7PCLtHtcOvDw3cFi7KdmZb7pD5MNyvrr0lxtomrMVFfbeUqV55CmrWd2x
         ji+nqPLrFMeUWSS8caktjRI+X7f+P0nlUOQLwnYPg1NiBxZxUu/YxUlug9CdeJhvxmkP
         8TSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733496694; x=1734101494;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=u4sWRf4hJF+nJwKhKGaqJGBfySo0Ly+PnsMhNpbfdzo=;
        b=ivLxMxCUHffspZyUrERVoEzuocueSWIxrAOCw3al0tisRf/zqaf0HVvfn7QdzzURGh
         JyQMJ/WSIgo3Ll5Yk5Xhdms20S8EyDRmkFYthHqd/8NpiGRC9q+NA8BiEGv2/wpbO0jY
         Zg8b2TXc1fLU6ZnQwdaJ8Jz45BiCfbLqKtRqfwgevAly1nYyOs/ZE9htWPzxX16Ax1kM
         BuNAmZB874kLjG438f3/Zle50HUXela4m42htGw1tX5RzItHPX3Wr6D5WsUJgTIVi1yb
         MxPapFUUKOngRfUgHa7N0F9u9y0WLiIZKICfMXN5eZiEXHLc8wYfoz1GhOxpvb24VrW6
         +/RQ==
X-Forwarded-Encrypted: i=1; AJvYcCVI0p0GuHp4VxHOcRqR2wnaDodmfuxqHqX+yunt1u5qAOqdaXFsEWRIkAUObKCqq0j+8mphQeakD4CIFp1m@vger.kernel.org
X-Gm-Message-State: AOJu0YyCcRY89Ge56uDZZgqJvJX02KZ7bElnkyQNL62xhyUn9hW9U6XX
	CZD+gman9Fq+H3n7BHHtn7Y11as7LJscwna8kU9nigzLIXIQYZUYvZ0n+rQs2Qw=
X-Gm-Gg: ASbGnctATWS8O4pRuQ0PUiUD9cs05vtrdcQ7zG+WbnPdp4hjktda9rES+tR8KDIbutK
	q9orbH2PNpjf6K/PxUD7cFbxbvbJTj3UpLW6y9rRESxbIRWluvaTLCbPqyqBpKTbRZQWxsu6hBE
	vSNnOhXMUxrOkNEPQxW9vTZra0o7pUFB/mgrq3x063mVxK94ikmqXkLlh01NypjGLRhlFEAtisp
	kfgLzIMo21eLez1Gy7CbQWEuvPryiFJrGJA+uCGn59/+6zG7e86oeeVObbpaDmU7kEJcElb77eU
	OfJhpoYQY8ZVF57vSh3ZMHFmVyEDgGWI/XMBd+e+pjTbhXnYK4mxIX40K7dM/A==
X-Google-Smtp-Source: AGHT+IF3ycQKdVhs/GREAgOvRVra6yPFbB24y2IHadPhsDlfk3Y572eRHeBOD9F6SFeEhTxMX7fWeA==
X-Received: by 2002:a05:6402:358a:b0:5d2:7199:ae7 with SMTP id 4fb4d7f45d1cf-5d3be6d74b2mr3641833a12.11.1733496694443;
        Fri, 06 Dec 2024 06:51:34 -0800 (PST)
Received: from localhost (2a02-8388-6584-6400-d322-7350-96d2-429d.cable.dynamic.v6.surfer.at. [2a02:8388:6584:6400:d322:7350:96d2:429d])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d3bc829433sm1261863a12.38.2024.12.06.06.51.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Dec 2024 06:51:34 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 06 Dec 2024 15:51:33 +0100
Message-Id: <D64PAIXELZ6A.37ZSFBIRPE6MT@fairphone.com>
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Jordan Crouse" <jorcrous@amazon.com>, <linux-media@vger.kernel.org>
Cc: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, "Mauro Carvalho Chehab"
 <mchehab@kernel.org>, "Robert Foss" <rfoss@kernel.org>, "Todor Tomov"
 <todor.too@gmail.com>, <linux-arm-msm@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v1 1/2] media: camss: Increase the maximum frame size
X-Mailer: aerc 0.18.2-0-ge037c095a049
References: <20240802152435.35796-1-jorcrous@amazon.com>
 <20240802152435.35796-2-jorcrous@amazon.com>
In-Reply-To: <20240802152435.35796-2-jorcrous@amazon.com>

On Fri Aug 2, 2024 at 5:24 PM CEST, Jordan Crouse wrote:
> Commit 35493d653a2d
> ("media: camss: add support for vidioc_enum_framesizes ioctl") added a
> maximum frame width and height but the values selected seemed to have
> been arbitrary. In reality the cam hardware doesn't seem to have a maximu=
m
> size restriction so double up the maximum reported width and height to
> allow for larger frames.
>
> Also increase the maximum size checks at each point in the pipeline so
> the increased sizes are allowed all the way down to the sensor.

Hi Jordan,

Looks like this hasn't landed yet, do you plan on resending this?

Just wanted to try a 8192x6144 format but csid limiting the size to 8191
is a bit in the way.

Regards
Luca

>
> Signed-off-by: Jordan Crouse <jorcrous@amazon.com>
> ---
>
>  drivers/media/platform/qcom/camss/camss-csid.c   | 8 ++++----
>  drivers/media/platform/qcom/camss/camss-csiphy.c | 4 ++--
>  drivers/media/platform/qcom/camss/camss-ispif.c  | 4 ++--
>  drivers/media/platform/qcom/camss/camss-vfe.c    | 4 ++--
>  drivers/media/platform/qcom/camss/camss-video.c  | 6 +++---
>  5 files changed, 13 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/media/platform/qcom/camss/camss-csid.c b/drivers/med=
ia/platform/qcom/camss/camss-csid.c
> index 858db5d4ca75..886c42c82612 100644
> --- a/drivers/media/platform/qcom/camss/camss-csid.c
> +++ b/drivers/media/platform/qcom/camss/camss-csid.c
> @@ -752,8 +752,8 @@ static void csid_try_format(struct csid_device *csid,
>  		if (i >=3D csid->res->formats->nformats)
>  			fmt->code =3D MEDIA_BUS_FMT_UYVY8_1X16;
> =20
> -		fmt->width =3D clamp_t(u32, fmt->width, 1, 8191);
> -		fmt->height =3D clamp_t(u32, fmt->height, 1, 8191);
> +		fmt->width =3D clamp_t(u32, fmt->width, 1, 16383);
> +		fmt->height =3D clamp_t(u32, fmt->height, 1, 16383);
> =20
>  		fmt->field =3D V4L2_FIELD_NONE;
>  		fmt->colorspace =3D V4L2_COLORSPACE_SRGB;
> @@ -781,8 +781,8 @@ static void csid_try_format(struct csid_device *csid,
>  			if (i >=3D csid->res->formats->nformats)
>  				fmt->code =3D MEDIA_BUS_FMT_UYVY8_1X16;
> =20
> -			fmt->width =3D clamp_t(u32, fmt->width, 1, 8191);
> -			fmt->height =3D clamp_t(u32, fmt->height, 1, 8191);
> +			fmt->width =3D clamp_t(u32, fmt->width, 1, 16383);
> +			fmt->height =3D clamp_t(u32, fmt->height, 1, 16383);
> =20
>  			fmt->field =3D V4L2_FIELD_NONE;
>  		}
> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.c b/drivers/m=
edia/platform/qcom/camss/camss-csiphy.c
> index 2f7361dfd461..43c35ad6ac84 100644
> --- a/drivers/media/platform/qcom/camss/camss-csiphy.c
> +++ b/drivers/media/platform/qcom/camss/camss-csiphy.c
> @@ -368,8 +368,8 @@ static void csiphy_try_format(struct csiphy_device *c=
siphy,
>  		if (i >=3D csiphy->res->formats->nformats)
>  			fmt->code =3D MEDIA_BUS_FMT_UYVY8_1X16;
> =20
> -		fmt->width =3D clamp_t(u32, fmt->width, 1, 8191);
> -		fmt->height =3D clamp_t(u32, fmt->height, 1, 8191);
> +		fmt->width =3D clamp_t(u32, fmt->width, 1, 16383);
> +		fmt->height =3D clamp_t(u32, fmt->height, 1, 16383);
> =20
>  		fmt->field =3D V4L2_FIELD_NONE;
>  		fmt->colorspace =3D V4L2_COLORSPACE_SRGB;
> diff --git a/drivers/media/platform/qcom/camss/camss-ispif.c b/drivers/me=
dia/platform/qcom/camss/camss-ispif.c
> index a12dcc7ff438..01e2ded8da0b 100644
> --- a/drivers/media/platform/qcom/camss/camss-ispif.c
> +++ b/drivers/media/platform/qcom/camss/camss-ispif.c
> @@ -912,8 +912,8 @@ static void ispif_try_format(struct ispif_line *line,
>  		if (i >=3D line->nformats)
>  			fmt->code =3D MEDIA_BUS_FMT_UYVY8_1X16;
> =20
> -		fmt->width =3D clamp_t(u32, fmt->width, 1, 8191);
> -		fmt->height =3D clamp_t(u32, fmt->height, 1, 8191);
> +		fmt->width =3D clamp_t(u32, fmt->width, 1, 16383);
> +		fmt->height =3D clamp_t(u32, fmt->height, 1, 16383);
> =20
>  		fmt->field =3D V4L2_FIELD_NONE;
>  		fmt->colorspace =3D V4L2_COLORSPACE_SRGB;
> diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/medi=
a/platform/qcom/camss/camss-vfe.c
> index 83c5a36d071f..826c0fb31785 100644
> --- a/drivers/media/platform/qcom/camss/camss-vfe.c
> +++ b/drivers/media/platform/qcom/camss/camss-vfe.c
> @@ -1049,8 +1049,8 @@ static void vfe_try_format(struct vfe_line *line,
>  		if (i >=3D line->nformats)
>  			fmt->code =3D MEDIA_BUS_FMT_UYVY8_1X16;
> =20
> -		fmt->width =3D clamp_t(u32, fmt->width, 1, 8191);
> -		fmt->height =3D clamp_t(u32, fmt->height, 1, 8191);
> +		fmt->width =3D clamp_t(u32, fmt->width, 1, 16383);
> +		fmt->height =3D clamp_t(u32, fmt->height, 1, 16383);
> =20
>  		fmt->field =3D V4L2_FIELD_NONE;
>  		fmt->colorspace =3D V4L2_COLORSPACE_SRGB;
> diff --git a/drivers/media/platform/qcom/camss/camss-video.c b/drivers/me=
dia/platform/qcom/camss/camss-video.c
> index cd72feca618c..5fee3733da8e 100644
> --- a/drivers/media/platform/qcom/camss/camss-video.c
> +++ b/drivers/media/platform/qcom/camss/camss-video.c
> @@ -19,10 +19,10 @@
>  #include "camss.h"
> =20
>  #define CAMSS_FRAME_MIN_WIDTH		1
> -#define CAMSS_FRAME_MAX_WIDTH		8191
> +#define CAMSS_FRAME_MAX_WIDTH		16833
>  #define CAMSS_FRAME_MIN_HEIGHT		1
> -#define CAMSS_FRAME_MAX_HEIGHT_RDI	8191
> -#define CAMSS_FRAME_MAX_HEIGHT_PIX	4096
> +#define CAMSS_FRAME_MAX_HEIGHT_RDI	16833
> +#define CAMSS_FRAME_MAX_HEIGHT_PIX	8192
> =20
>  /* ---------------------------------------------------------------------=
--------
>   * Helper functions


