Return-Path: <linux-arm-msm+bounces-38716-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8555F9D5538
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Nov 2024 23:10:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2E50D1F23361
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Nov 2024 22:10:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0E881DD9A8;
	Thu, 21 Nov 2024 22:10:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="H9P1RY7q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F102F1DC1B7
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 Nov 2024 22:10:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732227043; cv=none; b=LOsH8p2fIMsyMmHWk2VocA7/+01PyFjJJhnQ1ojGV5JdtkpJVThF9Wk5cqKP7XesBTwFbvFy2sj63gSEQ4UX5Gj2tdKlFJ6wUG7yG1xMn06yPyO/G8Pj89fkXtpn6BR+SFyhxsMaDqfHTtlAYauV2eEPOe9zEdXNvB0CvLQygP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732227043; c=relaxed/simple;
	bh=yeWBaZyskmHQQzGoYf4eQzjnS5JlEV8qt70IgjYzCIE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lTLN57Rra1uuPz3f4u5GYK+VX3HysGqSRCYnJ5UcjLp4w0NJDPnCYSta6xvKyHEHKXxh4mh1cycTtlE/naAh3EnKHjrtmxIXdwp6blbuAu7CR0QTL1faEv50o9iT/WXH12n/uJRprl+eC/JDPYsyOl4vNjs2Zys5M7LLppOF17M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=H9P1RY7q; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2f7657f9f62so15520341fa.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Nov 2024 14:10:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732227040; x=1732831840; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gFDuP7IjDwDMv6NR+DnprUqGpxBiP59fQ/sq6qPsJrg=;
        b=H9P1RY7qOTOzBIoE9oqgJcctr5IqJ9f3UvXdpcBOJrQ+nVf0lLCpWjh477uvHWFek6
         GyU8h2ELHq2Z3bMc47zDNEd79WT3cBbSUGXDV2djQlMm65J/kXFUkNlg1wU3Dtz0R5Wd
         5G2b8/aIRkJFmuwAcotlk1VyuJ43aCcl8b1nlQ4Ly3nfcfIOaJfMO3YoP0vw/xNJbElc
         QFw9qUhPOH90ZGVpph3XJiYDtXcUrUsjVEa14Ug9bKk2KoiaYzPUdsaTNxfvMfdH7FoT
         +qwyDMnMDRRcVGZIpqyT8K+DLrUUCIIGpgsYuv1UkA/0jSSNliFxe1LGWb4EtXbxVsFQ
         eT+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732227040; x=1732831840;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gFDuP7IjDwDMv6NR+DnprUqGpxBiP59fQ/sq6qPsJrg=;
        b=Unx03KGYjMXh4/CZiptd9X5zBLvLxWhfzjNGFvsuuV897G0+mvfaUbHatFRWAEIKBf
         q3OBCYZznw/2IcyTEZ3s1Q/Xb7jdkvNIvBE7drV4Dl9SGAvh5pv1RjMThn6Hq8FqiyUt
         pdKYyIvFfhn4oFy4u1c+lYJw9F4cozV8YwAPaaLpm9uXuni4o8oVojaa8EhVXt2ePeEU
         T0WsOqvWZIX9vouUG3jT4RdL5pclw1DHASy6QgayqxXFPp3pK/u3vkfmNse2B2v3BJbz
         IaP+98ZW/lcx3ZYzQCZl6AxojSAstu/RoQZCc2wcGdDocjnYA780M7VKa7aGybs1TT8g
         Cfyw==
X-Forwarded-Encrypted: i=1; AJvYcCVGweTceXkp2qNU8jhLsicAyxb1JuRtIQo7inuCifCDSxvpdPbaxao6V5w2mP+1bxq0+Wsfsj6B+tQZpeXV@vger.kernel.org
X-Gm-Message-State: AOJu0YxyKbuJWQINSyTEnqlmjZGsuM6kM2KdmP+zj+zfVTmm6JkQWujm
	OcA/5vup0Tsh2zY55vBjHT0TGD6zMK0co5p/vttQV/U/vYhZA+waH3ZBwf+VxOU=
X-Gm-Gg: ASbGnctAC8fL+S849ZiQWa9NcBw+bVgtm6VopR1cnglCSBVDzXU3zBjNlw+DMhj+CHj
	WFaAc/v26G7aRhRwm9k8q/3WGblWXkPMYL/zrpmfsyeCIt9VtU8IJeiNVFNGG9M9GSvYRrEhe0k
	bWC/22yahBZ3jD/mUrvUY3C95Tls5ZLClahSrT+2jP8VRJIbideq5MXgWdOVC/r1FrP6IOQVFY2
	WeEn1DPQdZU28sniNSVddkt3Hdmihjqukiu6GR8MkvnMshVg3TRMDEnHOErYrq1+AJxCbJ9/7bq
	PtuXeW+WjmlCnoSx6L6bvHd6Oxn6RQ==
X-Google-Smtp-Source: AGHT+IF5UEvVH8EwlVFvDbA8yqDXP2EnIvz85XTHp+jyVxMS03tfkpla0bwll8dc1ETCUfCWi+KKfg==
X-Received: by 2002:a05:651c:2208:b0:2f4:3de7:ac4c with SMTP id 38308e7fff4ca-2ffa70f0968mr1996351fa.8.1732227039935;
        Thu, 21 Nov 2024 14:10:39 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ffa538f100sm593151fa.103.2024.11.21.14.10.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Nov 2024 14:10:38 -0800 (PST)
Date: Fri, 22 Nov 2024 00:10:36 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jyothi Kumar Seerapu <quic_jseerapu@quicinc.com>
Cc: Vinod Koul <vkoul@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, 
	Sumit Semwal <sumit.semwal@linaro.org>, Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, 
	linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-i2c@vger.kernel.org, linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linaro-mm-sig@lists.linaro.org, quic_msavaliy@quicinc.com, quic_vtanuku@quicinc.com
Subject: Re: [PATCH v3 3/3] i2c: i2c-qcom-geni: Update compile dependenices
 for I2C GENI driver
Message-ID: <zfkhbjm6wrmcocqcvluov3nbrpb2ozbo52c6nlwxro44gublcw@5645ksz4cfm2>
References: <20241121130134.29408-1-quic_jseerapu@quicinc.com>
 <20241121130134.29408-4-quic_jseerapu@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241121130134.29408-4-quic_jseerapu@quicinc.com>

On Thu, Nov 21, 2024 at 06:31:34PM +0530, Jyothi Kumar Seerapu wrote:
> I2C functionality has dependencies on the GPI driver.
> Ensure that the GPI driver is enabled when using the I2C
> driver functionality.
> Therefore, update the I2C GENI driver to depend on the GPI driver.
> 
> Signed-off-by: Jyothi Kumar Seerapu <quic_jseerapu@quicinc.com>
> ---
> v2 -> v3:
>    - Moved this change to patch3.
>    - Updated commit description.
> 
> v1 -> v2:
>    -  This patch is added in v2 to address the kernel test robot
>       reported compilation error.
>       ERROR: modpost: "gpi_multi_desc_process" [drivers/i2c/busses/i2c-qcom-geni.ko] undefined!
> 
>  drivers/i2c/busses/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
> index 0aa948014008..87634a682855 100644
> --- a/drivers/i2c/busses/Kconfig
> +++ b/drivers/i2c/busses/Kconfig
> @@ -1049,6 +1049,7 @@ config I2C_QCOM_GENI
>  	tristate "Qualcomm Technologies Inc.'s GENI based I2C controller"
>  	depends on ARCH_QCOM || COMPILE_TEST
>  	depends on QCOM_GENI_SE
> +	depends on QCOM_GPI_DMA

So... without this change the previous patch is broken, which is a
no-go. And anyway, adding dependency onto a particular DMA driver is a
bad idea. Please make use of the DMA API instead.

>  	help
>  	  This driver supports GENI serial engine based I2C controller in
>  	  master mode on the Qualcomm Technologies Inc.'s SoCs. If you say
> -- 
> 2.17.1
> 

-- 
With best wishes
Dmitry

