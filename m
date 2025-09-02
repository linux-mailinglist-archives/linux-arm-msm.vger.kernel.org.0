Return-Path: <linux-arm-msm+bounces-71680-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 33150B40CB8
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Sep 2025 20:05:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 99053547FA7
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Sep 2025 18:05:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FE5A34A327;
	Tue,  2 Sep 2025 18:04:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kLUtS4EQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 070F0342CB8;
	Tue,  2 Sep 2025 18:04:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756836286; cv=none; b=aALaqA8s3tGsfnDathfSEjDBs2jV5BysmsE1d+ePBZ7NJaNBxL7yK3LkcIB/gxs/AR/B8luGm+bSZCglRytKim3rBd3dexnPm2jQn7oczXo7rMwZqyJ4yoG6yeAzx2MEXN0JTPf7kGtYWN+EavWHG/9zECUiRBksLC3v4zq2OiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756836286; c=relaxed/simple;
	bh=EeQ8qmgl4PWfxl1pAaKnRAnYiAo1vJ0KyU0hmIyxK4w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=koVKvX46S+RoLpQ2NgpKmn4d+1BozNvbjiiDIU7/fXXO2BAGbBdv/azEJ6OrKIIaMWt0e8u0KjrZhhh5XNteqcWe4kI2xmj4xFTgKYJuHcbsZFxQ/rgvfbNEUvjBrzFy/fcNaC26G+qjk3cx2MTkh4aaLXu2oqX8xTS+Ld4kr3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kLUtS4EQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DE14C4CEF5;
	Tue,  2 Sep 2025 18:04:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756836285;
	bh=EeQ8qmgl4PWfxl1pAaKnRAnYiAo1vJ0KyU0hmIyxK4w=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=kLUtS4EQCkk/A9dMyixoi1pGnw8CaT7/84yqRE0njOsg7CM9YeKCsMJW2LZqf/3el
	 OwkLmz0zmHq/Ult0Mjr+J3xAczSUME/cJj+KIXIpKd2tFpIBXsvDUA3dYAeFh3xrrc
	 PVSXoeERVQ1XBMcvHz8gfRkBvTxrA9Z5py1fkabCPxPqrr6etzxIFWOKWRg/IKjarU
	 VsS8FcOdKXyrR1omkG8kdLEyhSKjHNP2CPLo/lqGpTvrnlLJrm0y422E5+xy6W7aox
	 WOFv69o5TYtUmb/4fVCkFspy4l2qy/HJ0wAE27xvGE7ICT3+iEZbI0ctdpyICJE8tH
	 57cM+k93Ss8hw==
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-61cd6089262so9235852a12.3;
        Tue, 02 Sep 2025 11:04:45 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVdZy2qaA2iYd6AnlPvrkdMCZE1a0AlVNBOrgvJSh83okn0OuObIXRD1HrUqsymLHOeYUpc6BFgn8+2ToU=@vger.kernel.org, AJvYcCWT03hd+m6J0ShcjZdkS1WuzTSHywcSd5rQwsA497gcmu8Nd1LbLfIryTvHX5xgbEblykSKpBtXTY4f9LJ/wA==@vger.kernel.org, AJvYcCWzzEieouwW1HSw12ZDiKIXQjMQ+UXb1wl5UZwvB0G3aYLlmtFMmBIMbhaYIkSJY+94dzd/WhZellw8@vger.kernel.org
X-Gm-Message-State: AOJu0YxUMlhndtS3D6a6CTXptaeORz0erv3STVrqZzn9FJ1vRjDMtB08
	AxotFFFxV4kdE5g04WSD8BcJCLb1kbG0EAxpUULiVjeU0uE0JIAd8sVGjEnSLZslQ1mZstgl0tv
	4gf2gdZMwrTCGzZjBRLBE4pmzjjGaiQ==
X-Google-Smtp-Source: AGHT+IFS6/jTBaxYrOJnscPEN+/2YvkXakCmNm/PwzwXCk1mnjslLPBcUGBBbnZoHxpujqjkp7TnqY/26l/YlWGGcLY=
X-Received: by 2002:a05:6402:2815:b0:61c:1b27:56d4 with SMTP id
 4fb4d7f45d1cf-61d26da447cmr10421007a12.35.1756836284070; Tue, 02 Sep 2025
 11:04:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250902161156.145521-1-srinivas.kandagatla@oss.qualcomm.com> <20250902161156.145521-2-srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20250902161156.145521-2-srinivas.kandagatla@oss.qualcomm.com>
From: Rob Herring <robh@kernel.org>
Date: Tue, 2 Sep 2025 13:04:31 -0500
X-Gmail-Original-Message-ID: <CAL_JsqKxPJ5KSJLoQNQjnivAYZF9j2wCLAxs4TgqeB7P6+XMOA@mail.gmail.com>
X-Gm-Features: Ac12FXzChS6xv6fFnfBFo-YbbDH_HBgYtWIDPAASPv30eOZopkMvjiG8g64KNhI
Message-ID: <CAL_JsqKxPJ5KSJLoQNQjnivAYZF9j2wCLAxs4TgqeB7P6+XMOA@mail.gmail.com>
Subject: Re: [PATCH v2 1/7] of: base: Add of_property_read_u8_index
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: krzk+dt@kernel.org, vkoul@kernel.org, conor+dt@kernel.org, 
	srini@kernel.org, yung-chuan.liao@linux.intel.com, 
	pierre-louis.bossart@linux.dev, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 2, 2025 at 11:12=E2=80=AFAM Srinivas Kandagatla
<srinivas.kandagatla@oss.qualcomm.com> wrote:
>
> Add support for of_property_read_u8_index(), simillar to others
> u16 and u32 variants. Having this helper makes the code more tidy in
> isome cases, specially when we are parsing multiple of these into
> data structures.
>
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> ---
>  drivers/of/property.c | 33 +++++++++++++++++++++++++++++++++
>  include/linux/of.h    |  9 +++++++++
>  2 files changed, 42 insertions(+)
>
> diff --git a/drivers/of/property.c b/drivers/of/property.c
> index c1feb631e383..a644b24d5b75 100644
> --- a/drivers/of/property.c
> +++ b/drivers/of/property.c
> @@ -147,6 +147,39 @@ static void *of_find_property_value_of_size(const st=
ruct device_node *np,
>         return prop->value;
>  }
>
> +/**
> + * of_property_read_u8_index - Find and read a u8 from a multi-value pro=
perty.
> + *
> + * @np:                device node from which the property value is to b=
e read.
> + * @propname:  name of the property to be searched.
> + * @index:     index of the u8 in the list of values
> + * @out_value: pointer to return value, modified only if no error.
> + *
> + * Search for a property in a device node and read nth 8-bit value from
> + * it.
> + *
> + * Return: 0 on success, -EINVAL if the property does not exist,
> + * -ENODATA if property does not have a value, and -EOVERFLOW if the
> + * property data isn't large enough.
> + *
> + * The out_value is modified only if a valid u8 value can be decoded.
> + */
> +int of_property_read_u8_index(const struct device_node *np,
> +                                      const char *propname,
> +                                      u32 index, u8 *out_value)
> +{
> +       const u8 *val =3D of_find_property_value_of_size(np, propname,
> +                                       ((index + 1) * sizeof(*out_value)=
),
> +                                       0, NULL);
> +
> +       if (IS_ERR(val))
> +               return PTR_ERR(val);
> +
> +       *out_value =3D *(val + index);

val[index]

Otherwise,

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

