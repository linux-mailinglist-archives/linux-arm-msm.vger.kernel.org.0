Return-Path: <linux-arm-msm+bounces-30985-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3327896DF73
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Sep 2024 18:23:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A5A2C1F22AD6
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Sep 2024 16:23:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B096F19FA8E;
	Thu,  5 Sep 2024 16:23:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qpXuBYoN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B5FB1A01BA
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Sep 2024 16:23:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725553386; cv=none; b=AeoJB8kyGCQ7h56hj17PRGK4k/BnKuB2Ehhkt58qLyuuMVddxFNFXQlzyDkmm03SeBpdDQE/MeFyBmV7uFyfsVahwu7p0WoIFdXa4vXlskSQsz/PYI6/c7xrhHz4S9LGtG3fnMxyAk8m2C5WnnJfQGQBHwzRLoRsB5i9ewbXw5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725553386; c=relaxed/simple;
	bh=sW7uqszWU4sZLJOvGO07u1icXoKy1sNjZG27wJW95gQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GZIJRi7xXS5SjOWODx9H3UNBapooM79qAKlgCFFXVrq3u6KZLxEoBQJcbkmsvCx4vZ4XkrGg7/EhOUo8vai3yNwHxNF3Rt5ZlfjrUUiS2PLZUdcgCJ0nxX9Nk7CgGJi7zdaetSWMWMsAXsJPlRHBN8Oi7Kb1zild8T16QQeq5Z8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qpXuBYoN; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-71788bfe60eso829324b3a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Sep 2024 09:23:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725553383; x=1726158183; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WGwxBe/iaaoqwox8h/HS48crgUAbtB3Lz0hvS0382cQ=;
        b=qpXuBYoNENnLkm19crEElbKUC+MnI2RWt0x3W67+0oOI+/l7j11MOwlvhJkTYMq3fU
         c5YBRQX0PE3as0cYSOVzLDc9cWppuSvCyLcqzLU+uJbBOSQmaNHKDmsgCyIBStUdevke
         ONAEKbfGSVVD1h3iJi97EZ7m4M+KgINaxV2ieVBTF4TCt093fiQGQh8bRVXBTJnzix4r
         Q5WT1NYgOR++vDyTArLNQvCrhsGEBvidfzI7eacndB4JTSw+v0kIy/FMz1bdYvEERK6n
         sG+AqqQYRtg9vSc596yeqPSvybxZP6uhi0cvfFnAhTmHMaINzwRE9TGodtj08vnpI84y
         z9zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725553383; x=1726158183;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WGwxBe/iaaoqwox8h/HS48crgUAbtB3Lz0hvS0382cQ=;
        b=dCv7STZrbjpKhW8JuDMAx7w7AVyGip8fHG8ewcjaRGsCGuhCNRbJhUwJTMaJBcNeV0
         L9nJCgAnTHzgFX4R5k7vX83hfEzJGukLdffOJZWMU23VhAYggX2ADlb+uTpVIAZSJhKN
         SCj2QU+p8XlEmJfidllNnDsD0j1mJvARDMkXsqqtb5fHgee5COOWHyrofpWO4xurVlR6
         SkBys+aiQigaQTIyzeLjEOBP/uADaTyxZXyPzJJLwyVakoCK7i7PS+3y7g5sEz0+taiw
         OEWwlkCbLSy2WddiOcciWU1ctjenA3ixgu0YrFYZ4eyso4vn2Vm1naHlY3di90tfXyQV
         TrLA==
X-Forwarded-Encrypted: i=1; AJvYcCXHmUZ+kFc3TnpcL0RPISCTcyMlUvOBpUWvgkFrCGPofPOuqifrHPEiciWCdycDVe0XSB/H6s5Mb6zJvOW8@vger.kernel.org
X-Gm-Message-State: AOJu0YyzLK10YWdmtzEVTj822dqWwe9QXknWAypI8HJiOgnFRBcNiyKW
	RD+ly8nlxNwkMShxvNaqGSC4CHmxUv74Ke/IAjj20X9ZVn/sN3yFXVlzDYsjl60=
X-Google-Smtp-Source: AGHT+IEstKk+LEI8X3OaN9fTZu6CZPPKQppwGBYLvxBQ/FfkUBW23FDlSvzIk3BvLCy/OE4uzgavvQ==
X-Received: by 2002:a05:6a20:e196:b0:1cc:dfd1:2453 with SMTP id adf61e73a8af0-1cce1016eebmr24968329637.30.1725553383443;
        Thu, 05 Sep 2024 09:23:03 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:3b5d:f081:c58f:f7e2])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7177859a369sm3510923b3a.148.2024.09.05.09.23.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Sep 2024 09:23:02 -0700 (PDT)
Date: Thu, 5 Sep 2024 10:22:59 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Liu Jing <liujing@cmss.chinamobile.com>
Cc: andersson@kernel.org, paul@crapouillou.net, matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	patrice.chotard@foss.st.com, linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] remoteproc:remove redundant dev_err message
Message-ID: <Ztna4xyKbOJTw5C1@p14s>
References: <20240904185417.14357-1-liujing@cmss.chinamobile.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240904185417.14357-1-liujing@cmss.chinamobile.com>

On Thu, Sep 05, 2024 at 02:54:17AM +0800, Liu Jing wrote:
> devm_ioremap_resource already contains error message, so remove
> the redundant dev_err message
> 
> Signed-off-by: Liu Jing <liujing@cmss.chinamobile.com>
> 
> diff --git a/drivers/remoteproc/da8xx_remoteproc.c b/drivers/remoteproc/da8xx_remoteproc.c
> index 9041a0e07fb2..289d5ce9f7af 100644
> --- a/drivers/remoteproc/da8xx_remoteproc.c
> +++ b/drivers/remoteproc/da8xx_remoteproc.c
> @@ -214,8 +214,6 @@ static int da8xx_rproc_get_internal_memories(struct platform_device *pdev,
>  						   mem_names[i]);
>  		drproc->mem[i].cpu_addr = devm_ioremap_resource(dev, res);
>  		if (IS_ERR(drproc->mem[i].cpu_addr)) {
> -			dev_err(dev, "failed to parse and map %s memory\n",
> -				mem_names[i]);
>  			return PTR_ERR(drproc->mem[i].cpu_addr);
>  		}
>  		drproc->mem[i].bus_addr = res->start;
> diff --git a/drivers/remoteproc/ingenic_rproc.c b/drivers/remoteproc/ingenic_rproc.c
> index 9902cce28692..b3ee5c47001d 100644
> --- a/drivers/remoteproc/ingenic_rproc.c
> +++ b/drivers/remoteproc/ingenic_rproc.c
> @@ -186,7 +186,6 @@ static int ingenic_rproc_probe(struct platform_device *pdev)
>  	mem = platform_get_resource_byname(pdev, IORESOURCE_MEM, "aux");
>  	vpu->aux_base = devm_ioremap_resource(dev, mem);
>  	if (IS_ERR(vpu->aux_base)) {
> -		dev_err(dev, "Failed to ioremap\n");
>  		return PTR_ERR(vpu->aux_base);
>  	}
>  
> @@ -197,7 +196,6 @@ static int ingenic_rproc_probe(struct platform_device *pdev)
>  		vpu->mem_info[i].base = devm_ioremap_resource(dev, mem);
>  		if (IS_ERR(vpu->mem_info[i].base)) {
>  			ret = PTR_ERR(vpu->mem_info[i].base);
> -			dev_err(dev, "Failed to ioremap\n");
>  			return ret;
>  		}
>  
> diff --git a/drivers/remoteproc/keystone_remoteproc.c b/drivers/remoteproc/keystone_remoteproc.c
> index 7e57b90bcaf8..a31f94a290c9 100644
> --- a/drivers/remoteproc/keystone_remoteproc.c
> +++ b/drivers/remoteproc/keystone_remoteproc.c
> @@ -312,8 +312,6 @@ static int keystone_rproc_of_get_memories(struct platform_device *pdev,
>  						   mem_names[i]);
>  		ksproc->mem[i].cpu_addr = devm_ioremap_resource(dev, res);
>  		if (IS_ERR(ksproc->mem[i].cpu_addr)) {
> -			dev_err(dev, "failed to parse and map %s memory\n",
> -				mem_names[i]);
>  			return PTR_ERR(ksproc->mem[i].cpu_addr);
>  		}
>  		ksproc->mem[i].bus_addr = res->start;
> diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
> index e744c07507ee..cb8ad16583c7 100644
> --- a/drivers/remoteproc/mtk_scp.c
> +++ b/drivers/remoteproc/mtk_scp.c
> @@ -1126,7 +1126,6 @@ static struct mtk_scp *scp_rproc_init(struct platform_device *pdev,
>  	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "sram");
>  	scp->sram_base = devm_ioremap_resource(dev, res);
>  	if (IS_ERR(scp->sram_base)) {
> -		dev_err(dev, "Failed to parse and map sram memory\n");
>  		return ERR_CAST(scp->sram_base);
>  	}

There is another instance in the Mediatek driver - please address.

Thanks,
Mathieu

>  
> diff --git a/drivers/remoteproc/omap_remoteproc.c b/drivers/remoteproc/omap_remoteproc.c
> index 9ae2e831456d..07e707776cf9 100644
> --- a/drivers/remoteproc/omap_remoteproc.c
> +++ b/drivers/remoteproc/omap_remoteproc.c
> @@ -1201,8 +1201,6 @@ static int omap_rproc_of_get_internal_memories(struct platform_device *pdev,
>  		}
>  		oproc->mem[i].cpu_addr = devm_ioremap_resource(dev, res);
>  		if (IS_ERR(oproc->mem[i].cpu_addr)) {
> -			dev_err(dev, "failed to parse and map %s memory\n",
> -				data->mems[i].name);
>  			return PTR_ERR(oproc->mem[i].cpu_addr);
>  		}
>  		oproc->mem[i].bus_addr = res->start;
> diff --git a/drivers/remoteproc/pru_rproc.c b/drivers/remoteproc/pru_rproc.c
> index 327f0c7ee3d6..85b95e025c17 100644
> --- a/drivers/remoteproc/pru_rproc.c
> +++ b/drivers/remoteproc/pru_rproc.c
> @@ -1047,8 +1047,6 @@ static int pru_rproc_probe(struct platform_device *pdev)
>  						   mem_names[i]);
>  		pru->mem_regions[i].va = devm_ioremap_resource(dev, res);
>  		if (IS_ERR(pru->mem_regions[i].va)) {
> -			dev_err(dev, "failed to parse and map memory resource %d %s\n",
> -				i, mem_names[i]);
>  			ret = PTR_ERR(pru->mem_regions[i].va);
>  			return ret;
>  		}
> diff --git a/drivers/remoteproc/qcom_q6v5_adsp.c b/drivers/remoteproc/qcom_q6v5_adsp.c
> index 572dcb0f055b..fe65ffa9a93f 100644
> --- a/drivers/remoteproc/qcom_q6v5_adsp.c
> +++ b/drivers/remoteproc/qcom_q6v5_adsp.c
> @@ -602,7 +602,6 @@ static int adsp_init_mmio(struct qcom_adsp *adsp,
>  	} else {
>  		adsp->lpass_efuse = devm_ioremap_resource(&pdev->dev, efuse_region);
>  		if (IS_ERR(adsp->lpass_efuse)) {
> -			dev_err(adsp->dev, "failed to map efuse registers\n");
>  			return PTR_ERR(adsp->lpass_efuse);
>  		}
>  	}
> diff --git a/drivers/remoteproc/st_slim_rproc.c b/drivers/remoteproc/st_slim_rproc.c
> index d17719384c16..a6e50f51c794 100644
> --- a/drivers/remoteproc/st_slim_rproc.c
> +++ b/drivers/remoteproc/st_slim_rproc.c
> @@ -251,7 +251,6 @@ struct st_slim_rproc *st_slim_rproc_alloc(struct platform_device *pdev,
>  
>  		slim_rproc->mem[i].cpu_addr = devm_ioremap_resource(dev, res);
>  		if (IS_ERR(slim_rproc->mem[i].cpu_addr)) {
> -			dev_err(&pdev->dev, "devm_ioremap_resource failed\n");
>  			err = PTR_ERR(slim_rproc->mem[i].cpu_addr);
>  			goto err;
>  		}
> @@ -262,7 +261,6 @@ struct st_slim_rproc *st_slim_rproc_alloc(struct platform_device *pdev,
>  	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "slimcore");
>  	slim_rproc->slimcore = devm_ioremap_resource(dev, res);
>  	if (IS_ERR(slim_rproc->slimcore)) {
> -		dev_err(&pdev->dev, "failed to ioremap slimcore IO\n");
>  		err = PTR_ERR(slim_rproc->slimcore);
>  		goto err;
>  	}
> @@ -270,7 +268,6 @@ struct st_slim_rproc *st_slim_rproc_alloc(struct platform_device *pdev,
>  	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "peripherals");
>  	slim_rproc->peri = devm_ioremap_resource(dev, res);
>  	if (IS_ERR(slim_rproc->peri)) {
> -		dev_err(&pdev->dev, "failed to ioremap peripherals IO\n");
>  		err = PTR_ERR(slim_rproc->peri);
>  		goto err;
>  	}
> diff --git a/drivers/remoteproc/wkup_m3_rproc.c b/drivers/remoteproc/wkup_m3_rproc.c
> index 36a55f7ffa64..5648f450c018 100644
> --- a/drivers/remoteproc/wkup_m3_rproc.c
> +++ b/drivers/remoteproc/wkup_m3_rproc.c
> @@ -186,8 +186,6 @@ static int wkup_m3_rproc_probe(struct platform_device *pdev)
>  						   mem_names[i]);
>  		wkupm3->mem[i].cpu_addr = devm_ioremap_resource(dev, res);
>  		if (IS_ERR(wkupm3->mem[i].cpu_addr)) {
> -			dev_err(&pdev->dev, "devm_ioremap_resource failed for resource %d\n",
> -				i);
>  			ret = PTR_ERR(wkupm3->mem[i].cpu_addr);
>  			goto err_put_rproc;
>  		}
> -- 
> 2.33.0
> 
> 
> 

