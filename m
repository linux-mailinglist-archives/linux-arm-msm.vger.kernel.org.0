Return-Path: <linux-arm-msm+bounces-73714-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 723EAB5977F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Sep 2025 15:25:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E83791BC5DFF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Sep 2025 13:25:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01E4A307AEA;
	Tue, 16 Sep 2025 13:25:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="jeIYMd/q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD1441D7E26
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Sep 2025 13:24:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758029101; cv=none; b=sUDAFouG1fBzwsT6dWmOeIwherjnpggK49W3Q4WMpDyM4i17zPsPqi6fcQlKPuPK1zqsJbuHBOLE8FsLMn2Yjvr4PddyPEI3lPK520LZn1WAD1sjWLaWkstgMLzjObWIkb+rYDURaDIpxBltuRTvQXC1IidPqDYL6cagaGuehwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758029101; c=relaxed/simple;
	bh=s8ThdCXM5O9yyBHIfDFZ9OEayAHX03FFFGLLjXjF7XY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jGHvDDWSSrJvtmG1a6BbtfyMk3+jM+RZhp/sOnxu6rsr0V84jxJmaIFF6XwTvDpkBwtvZBF8pzVkQPGRxTJ62kKzkU7wsqG2wbnLC8+3e1peJ79MtyjrHaooh/pSIqRpCvRbXT3pfxBxK7ZKX/nMzaB2Y77h1rDHX8ypSZOMLc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=jeIYMd/q; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-b03fa5c5a89so891740566b.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Sep 2025 06:24:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1758029098; x=1758633898; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gwfKh8YcNEbswE2yYv8jHBhvIioj0iL2kRQaWZR7TS4=;
        b=jeIYMd/qRHO+nPBNV5EseY3/4XkcyAp9gayRU5pCXHVJYBIhZMwzNpcKQEuDLXP+n0
         hRv6WaRsqF6Ex0gQ0qpwcj64LW0uIrA8ciLh5U7qSFL8B1w/zkZnBTiXUCzyEZBjDurA
         K6CR9IXZBnBFGym4LBqzhiLHAgJgfBnNoGae8Si//bWDUMWlcAY1EeHoQVodaONgiHa0
         bxJO0hKeD1TWbAt5q6sAG5RvONO8mQGXGLAcjDAbl7uFwgx0MrTYOOuwmfJYj0dkOQxe
         fpuXn0D4l7gsCNF31gjZFhGfIMV1dL6ARMSoTS295WLe/s0NQVrjR2TRHl7BFK0DKxUW
         fbWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758029098; x=1758633898;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gwfKh8YcNEbswE2yYv8jHBhvIioj0iL2kRQaWZR7TS4=;
        b=QyRinCEBovlFdvf4ZR2s7O/9F4YxeXjkzI0ZQp+32+amuL9/a6AiuCRyggCEbindsn
         r8PK0zrQYmEmb3lp+WlHA04OoaAvfMCbbO8l3YBZb1BTx3Y9Vpx50BPVkc1RYVwQ68MJ
         VLSwuKFkS4UDcixrgZsRwEcwN8qy1AifmBxic+xNI+SsbJHqKmLDLnORE9K43qVRB89r
         KaSD861vTstkK9+wuvrhGR8kYYomWMWPzGGrCCLr3o36FhycSb70ofHBYfhRS/MyRIk7
         LBsyeReGldWnaV6r733UFEg9mP4zglcNu32jBqfjFUK8HM/upqaBVOoujcJRy/Rwbk7s
         D9Nw==
X-Forwarded-Encrypted: i=1; AJvYcCX7R96F89I6joZ/cSdpiPh/KhZmRMz6ReEJnyGVPQ1W/kT8lYRmxB3k5vNv+JMBJrXSQjVUEu5y7qLMxUX1@vger.kernel.org
X-Gm-Message-State: AOJu0YwPvqoVT6ORSckVsPO96dG4wsDCP11UKa/gchTBcOM87IcQ/2+A
	ZpVnxccziOjEher3eUTMht/1FwzwKCQf2cBQvh3PmCVdCydWnkaM6HopTpJTZBQ5y/M=
X-Gm-Gg: ASbGncsZne6zvJ74Ff2uq/xqgW1LqpY4TLkkkUkFw/yK4BxTYg8sjMUor0UN/8VmEX8
	w+GIqo/+65doDM/nhzSScGwaYdvp96Ua5IYwq0h8oZxLn05eB+yHqg6OFqkAjUyvV8rzCoAy95+
	zT/wr5KqEplDOqO/+VUkaS/rsSbYMeS/NkzIOytOYJDZX4Ui6pf+xp0yw8ycwDL3DyEXpJ7dRio
	YiTWmBLYKz+TGxZfn/hHbXXX1SUXmAnd7jiP9ls6Gk36IzoPx3pFV8cGcHaUYqDAgxst5NoTAsG
	iN91qvCwF0Et5yUAj8rFXtiUpA9onSsM57zQ7Wq3xPYJPXij1D71GLjDaGrz+p8JXSoT1tB/qbW
	e9LZp2vvwqh1D7a6Y4qKN9FnbwuKBUUQcf4tY2fJqnaGWwf+3hEXFwz74FhOzbaPU
X-Google-Smtp-Source: AGHT+IE9kjhldcCIBvjPr9jo7lRPPHVqNSYEJDmsT9jH1F0DRGqPEBku/9BloIv9jKtuTpavenfoLw==
X-Received: by 2002:a17:907:d16:b0:afe:c6a0:d116 with SMTP id a640c23a62f3a-b07c3572d31mr1812203466b.18.1758029098143;
        Tue, 16 Sep 2025 06:24:58 -0700 (PDT)
Received: from localhost (p200300f65f06ab0400000000000001b9.dip0.t-ipconnect.de. [2003:f6:5f06:ab04::1b9])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-b07b32f202dsm1164355266b.84.2025.09.16.06.24.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Sep 2025 06:24:57 -0700 (PDT)
Date: Tue, 16 Sep 2025 15:24:56 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: sboyd@kernel.org, jic23@kernel.org, dlechner@baylibre.com, 
	nuno.sa@analog.com, andy@kernel.org, arnd@arndb.de, gregkh@linuxfoundation.org, 
	srini@kernel.org, vkoul@kernel.org, kishon@kernel.org, sre@kernel.org, 
	krzysztof.kozlowski@linaro.org, linux-arm-msm@vger.kernel.org, linux-iio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, linux-pm@vger.kernel.org, 
	kernel@collabora.com, wenst@chromium.org, casey.connolly@linaro.org, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v4 2/7] nvmem: qcom-spmi-sdam: Migrate to
 devm_spmi_subdevice_alloc_and_add()
Message-ID: <t3uk3k4h3l53yajoe3xog2njmdn3jhkmdphv3c4wnpvcqniz4n@opgigzazycot>
References: <20250916084445.96621-1-angelogioacchino.delregno@collabora.com>
 <20250916084445.96621-3-angelogioacchino.delregno@collabora.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="36zni4ukkwfibixi"
Content-Disposition: inline
In-Reply-To: <20250916084445.96621-3-angelogioacchino.delregno@collabora.com>


--36zni4ukkwfibixi
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v4 2/7] nvmem: qcom-spmi-sdam: Migrate to
 devm_spmi_subdevice_alloc_and_add()
MIME-Version: 1.0

Hello,

On Tue, Sep 16, 2025 at 10:44:40AM +0200, AngeloGioacchino Del Regno wrote:
> @@ -119,19 +128,24 @@ static int sdam_probe(struct platform_device *pdev)
>  	if (!sdam)
>  		return -ENOMEM;
> =20
> -	sdam->regmap =3D dev_get_regmap(pdev->dev.parent, NULL);
> -	if (!sdam->regmap) {
> -		dev_err(&pdev->dev, "Failed to get regmap handle\n");
> -		return -ENXIO;
> -	}
> +	sparent =3D to_spmi_device(dev->parent);
> +	sub_sdev =3D devm_spmi_subdevice_alloc_and_add(dev, sparent);
> +	if (IS_ERR(sub_sdev))
> +		return PTR_ERR(sub_sdev);
> =20
> -	rc =3D of_property_read_u32(pdev->dev.of_node, "reg", &sdam->base);
> +	rc =3D of_property_read_u32(dev->of_node, "reg", &sdam_regmap_config.re=
g_base);

It's a bit ugly that you pass the address of an unsigned int as u32*.
But this isn't new, so fine for me. (Also for all Linux archs we have
sizeof(unsigned int) =3D=3D 4, so AFAICT it's safe anyhow.)

>  	if (rc < 0) {
>  		dev_err(&pdev->dev, "Failed to get SDAM base, rc=3D%d\n", rc);
>  		return -EINVAL;
>  	}
> =20
> -	rc =3D regmap_read(sdam->regmap, sdam->base + SDAM_SIZE, &val);
> +	sdam->regmap =3D devm_regmap_init_spmi_ext(&sub_sdev->sdev, &sdam_regma=
p_config);
> +	if (IS_ERR(sdam->regmap)) {
> +		dev_err(&pdev->dev, "Failed to get regmap handle\n");

dev_err_probe()

> +		return PTR_ERR(sdam->regmap);
> +	}
> +
> +	rc =3D regmap_read(sdam->regmap, SDAM_SIZE, &val);
>  	if (rc < 0) {
>  		dev_err(&pdev->dev, "Failed to read SDAM_SIZE rc=3D%d\n", rc);
>  		return -EINVAL;
> @@ -159,7 +173,7 @@ static int sdam_probe(struct platform_device *pdev)
>  	}
>  	dev_dbg(&pdev->dev,
>  		"SDAM base=3D%#x size=3D%u registered successfully\n",
> -		sdam->base, sdam->size);
> +		sdam_regmap_config.reg_base, sdam->size);
> =20
>  	return 0;
>  }
> @@ -181,3 +195,4 @@ module_platform_driver(sdam_driver);
> =20
>  MODULE_DESCRIPTION("QCOM SPMI SDAM driver");
>  MODULE_LICENSE("GPL v2");
> +MODULE_IMPORT_NS("SPMI");

If it's exactly the files that #include <linux/spmi.h> should have that
namespace import, you can put the MODULE_IMPORT_NS into that header.

Best regards
Uwe

--36zni4ukkwfibixi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmjJZSUACgkQj4D7WH0S
/k5X2gf8CPcy37sX+3TAvMselYC6a5KTw9qBUgRRRW2xU0jMLPVSugZd9i7RFBsX
qcP6Xq/FcBLfEIdwT9uwud13CtVdV6qyNQaWgz+BnrTomiNrrr4wZTVrOOhNgSDi
VElZSzvXwu+7EZQLmdGAwoXB3HnCHuShI5LiCUQ0zi4pYoMoAc4Tw6htJhjM7NJ2
48eZomVZ2s+xwPA17EyHn9FaHiisgWV/tjxRtL9P5Kt79qZNel8MXHgWU4jFEUDm
hqciH+VQhquuUhU/UfWhV0q4Q6aJ2acuI+AsHcWctTI1Whgdtm0Ddr8/iJmUjitw
JNecAkD3czkJvfdQpE1uSbxMdDBrww==
=Jcue
-----END PGP SIGNATURE-----

--36zni4ukkwfibixi--

