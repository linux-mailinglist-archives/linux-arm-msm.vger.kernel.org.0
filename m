Return-Path: <linux-arm-msm+bounces-6166-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F6C882096A
	for <lists+linux-arm-msm@lfdr.de>; Sun, 31 Dec 2023 01:48:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5BD7528299C
	for <lists+linux-arm-msm@lfdr.de>; Sun, 31 Dec 2023 00:48:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC57E185D;
	Sun, 31 Dec 2023 00:48:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LfBCosbe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4385F1844
	for <linux-arm-msm@vger.kernel.org>; Sun, 31 Dec 2023 00:48:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2cc6b5a8364so78688291fa.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 30 Dec 2023 16:48:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1703983693; x=1704588493; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=g7LyVOuEsI9PRtyYZaiHMTcUkVHkouuFw6JcSFaYF9Y=;
        b=LfBCosbe2SSY8FNfRObYLrlr+4IpA668TFBIRbF0L5yyv3lJvBIjS0+cTPKwH+2Zvm
         C4ntBTvS0mBq4iRwuR+nVRt7g++c+RkKZ9O+4EzzPRX88ADWzf5AgVZLLW/BHmLHC5ln
         wHOZawPHG1Ce66IixMejydRYEks1e50vqdbZDcEEHlFeDBakQVaRh9cAwUTmAMe4MZwP
         8EBhLdYFU7JgHqal5d79uH0dwWu1IIy/EpFBSV2dnN/MIgCJ1IDJAw0cHtIIddiB9P2N
         JrliJ+CRUYlx3wemkIqCbBVcwSUhjb51Sj0I6TPDjsbQOYjrx6BMEce/gBrcD+QvYgej
         BmSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703983693; x=1704588493;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=g7LyVOuEsI9PRtyYZaiHMTcUkVHkouuFw6JcSFaYF9Y=;
        b=h+aTZ9m/QxIJc5qTjCBhWz0Te+ZCFSFzayNIzbHgRmXZPnJgK0yPzcLHJReDoS21d5
         QyfL7gfAdufmh/iMke4/Wx2K35ZBRr7YSfi0wmINWtHd2c774HoWPvjdC2nICNfve36Y
         tyQPWTemaUdngeZDQ0JGTZ//IoR/wZQO7O15cV2E2I4q9KzRsECRs9zdTtFSvjJ1Rrb+
         JaQzJrBcCDZ2QZadwG32Z+XYukfbNESIcr9OwXFE1EGpEo3NjU2INMf9nJyWxe7FSTIk
         aM7E+YYTueMv64Dw/7QBdyshV2YuClD/9OzzXOgzzey+4gYGMi82pn2YDtbLlf9UyKkV
         dWYw==
X-Gm-Message-State: AOJu0YxkAtWfDFR3bVZftCDEglTKW1Ubtis+oB+4HWQTJL5zE5tacDrI
	iHouOF72RRjcm/aJklg3kbO8nFF5rFsP2w==
X-Google-Smtp-Source: AGHT+IFmpEejX/rrWOhfbfbbPGmg2BZWWE014xgmA5s5zEjRh9/e6LaV9fp1/CE3wIgp0lirhDeR0w==
X-Received: by 2002:a2e:9b11:0:b0:2cc:eaf4:5c67 with SMTP id u17-20020a2e9b11000000b002cceaf45c67mr1952274lji.99.1703983693359;
        Sat, 30 Dec 2023 16:48:13 -0800 (PST)
Received: from ?IPV6:2001:14ba:a0db:1f00::227? (dzdqv0yyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::227])
        by smtp.gmail.com with ESMTPSA id cy22-20020a2e9a16000000b002cce9e771b2sm1182475ljb.71.2023.12.30.16.48.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 30 Dec 2023 16:48:12 -0800 (PST)
Message-ID: <cb1129ca-6ee9-46cf-8ea7-77707f9d4edc@linaro.org>
Date: Sun, 31 Dec 2023 02:48:12 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] iommu/msm-iommu: don't limit the driver too much
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 iommu@lists.linux.dev, Russell King <linux@armlinux.org.uk>,
 Joerg Roedel <jroedel@suse.de>
References: <20231216162700.863456-1-dmitry.baryshkov@linaro.org>
 <20231216162700.863456-2-dmitry.baryshkov@linaro.org>
Content-Language: en-GB
In-Reply-To: <20231216162700.863456-2-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 16/12/2023 18:26, Dmitry Baryshkov wrote:
> In preparation of dropping most of ARCH_QCOM subtypes, stop limiting the
> driver just to those machines. Allow it to be built for any 32-bit
> Qualcomm platform (ARCH_QCOM).
> 
> Acked-by: Robin Murphy <robin.murphy@arm.com>
> Acked-by: Joerg Roedel <jroedel@suse.de>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Robin, Joerg, Will, is there any chance this can be picked up into 6.8? 
We will proceed with merging the rest through qocm tree into 6.9.

> ---
>   drivers/iommu/Kconfig | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/iommu/Kconfig b/drivers/iommu/Kconfig
> index 9a29d742617e..0d6095290b6a 100644
> --- a/drivers/iommu/Kconfig
> +++ b/drivers/iommu/Kconfig
> @@ -179,7 +179,7 @@ config FSL_PAMU
>   config MSM_IOMMU
>   	bool "MSM IOMMU Support"
>   	depends on ARM
> -	depends on ARCH_MSM8X60 || ARCH_MSM8960 || COMPILE_TEST
> +	depends on ARCH_QCOM || COMPILE_TEST
>   	select IOMMU_API
>   	select IOMMU_IO_PGTABLE_ARMV7S
>   	help

-- 
With best wishes
Dmitry


