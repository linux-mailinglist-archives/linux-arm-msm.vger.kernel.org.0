Return-Path: <linux-arm-msm+bounces-40347-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 30E909E42F3
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Dec 2024 19:08:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E0AAA284430
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Dec 2024 18:08:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 234CB1F03DA;
	Wed,  4 Dec 2024 18:02:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Rrwb2jTN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D8461F03D4
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Dec 2024 18:02:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733335365; cv=none; b=TZlk0QzHEgBtDjcQDsC9OYed5VvDkyod3zyMkNNGAdIg5cDYYgQ6/t4X/LTlzdFky7E8PfV2eyvR8lvuBVWSLsaA5VkaC21tnoRXzwoBN+F++5NeTVmMUYu+K1WcNMoWnUfSJKF1xOb6+JKq0X2RjmYCwleaB4X2E/wn0S9cqXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733335365; c=relaxed/simple;
	bh=08n36W/CMnCDfr62bUaB+P/NXZKNqgjlOHf6GtLMtoc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GfSIo2wNsgIPSVnpt/SrVV7vrSdG0vVzlVLcNO7UwPLrZyZl8+cB5097/vMvhE1Wf/Z58XMdQgXkr3tk4rntAUgOusgzdz5oBvhiHHALCRsxzpNQDrQ+pcVL9i7njhvILJfTkBQxNqOCXzhNzhsNAatrY2h3B2P7jp9XuxV/Qx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Rrwb2jTN; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-723f37dd76cso108998b3a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Dec 2024 10:02:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733335362; x=1733940162; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PeBuKTAzT5t/xg0HOfB6aMdefP/YbNUMgGL/5kx9O2s=;
        b=Rrwb2jTN1zDfPDslIuMer6x6fUBuRsJWUgY7sOycFdbNaGBm6u1rrBkyOfRVeOv4wZ
         qimIkIQbtBgOIvhDLqXpbYrhIC4rd5Z9I/1st59GGfG8rn2LrAFjJzMA2F6FRF4GQNma
         GeULyVACUC5DgaQQPpsu8/d/RNIJZn5ONSIWfso8Wcf3SrDkW0snEeTHgoGjsIDtuVj2
         RJOspcVMTppQ2jXhU3rGAPxxGTZzE3qUikxTZQjB6v+lTBxbHLIW8jMIG6D9UfODwMAL
         /yDJXTLvZvYNThD2mmYgdg/TUNwh0TQ9mbC5ggbkOUuz6x0Woy/9X/jJSOXQvxPufRFV
         EeHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733335362; x=1733940162;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PeBuKTAzT5t/xg0HOfB6aMdefP/YbNUMgGL/5kx9O2s=;
        b=dtFyR0pKNY82y+agvr1hsQRnzzejFDrKVd6PiMJIjIYCzh7eX5ATsv1ipzmWj2SriJ
         qO4NoMvspdVMdEmyLkayCHrhoIvWsnZ5NQFXmHjQj2F/UHxgZO/Vwv/QCRoCs/t4QLvo
         uM3lsQoCgrSFBvZtR45bkyKA0QtjmY9F/myTeZpzI6CDQ+qVTi7sx+7Zp69XAJk9nxl+
         A6fkKm2Fx76996JEi+VcAlGCYv9O2B8/e26ObT23OZeaNQwZtKhMMb64qF+fmiylDf82
         xHLIvKuteg23pwwGjoqpPO58HTTEuu9m6+dwcGTLyc/PJ/18i6isSFexd7iF+hVeZzqZ
         hvkA==
X-Forwarded-Encrypted: i=1; AJvYcCVWaTDAmw+1nNW4N4R7FeckO2aYOLbexTMWZBaArsZZJnTHRDfvxfCYLOt4QM7S4nCVfhbejTMwpUPSspnq@vger.kernel.org
X-Gm-Message-State: AOJu0YyMQi0Ne6K1UGf1/cVMdL3q1hLTmtf8FbxCa/8+KO5S4WwtSiWx
	68/v8WkGCCD1MJBOLpMzBNhpqiIdKES+5pYxDrdgX6GDt57Bt3S6ykfVJ9Mt/J4=
X-Gm-Gg: ASbGncsrmdF46sUONmGAgA6iJ3sHpgCizo5nE0Au7JImAUcFkAhP0FAJTjktEDViyco
	8zQ/m+lrMDqg58Js0w6VtHEcXhcv79fUvf3CxCA5bgfiPGxsr/lHGswNcCUqMohXVNHHjWJ0efR
	/QcAqtH8Ilg7e0GMJozqv8b/YPxo/8OWLDbvo/7R3wUAeV2NB5FUILnPnyNaPZ4b7zvbxcsSTaR
	PCnHyg6RA3q8Lq6SpPbovNy2/rJ/Y3AtIPfdXc0zqRmZ6pRYCnUnw==
X-Google-Smtp-Source: AGHT+IGz/ZtmC4PnERHkalD6CvmzPb7Tp2woBDFzd1PcOy0yfXwbSkND0GchAL+Kghl7UNvinfrk8Q==
X-Received: by 2002:a05:6a00:180a:b0:725:1d37:ebff with SMTP id d2e1a72fcca58-7257fcd968dmr10230325b3a.22.1733335361978;
        Wed, 04 Dec 2024 10:02:41 -0800 (PST)
Received: from p14s ([2604:3d09:148c:c800:cb58:bf7f:6102:4f57])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7259470e2c9sm1282202b3a.190.2024.12.04.10.02.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2024 10:02:41 -0800 (PST)
Date: Wed, 4 Dec 2024 11:02:38 -0700
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Patrice Chotard <patrice.chotard@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	kernel test robot <lkp@intel.com>, linux-remoteproc@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH v15 4/8] remoteproc: Rename load() operation to
 load_segments() in rproc_ops struct
Message-ID: <Z1CZPhu1T2opd906@p14s>
References: <20241128084219.2159197-1-arnaud.pouliquen@foss.st.com>
 <20241128084219.2159197-5-arnaud.pouliquen@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241128084219.2159197-5-arnaud.pouliquen@foss.st.com>

On Thu, Nov 28, 2024 at 09:42:11AM +0100, Arnaud Pouliquen wrote:
> With the introduction of the load_fw() operation in the rproc_ops
> structure, we need to clarify the difference in the use of the load()
> and load_fw() ops.
> 
> The legacy load() is dedicated to loading the ELF segments into memory.
> Rename this to a more explicit name: load_segments().

This is introducing more code churn than is worth it.  Please enhance the usage
comment for ->load() as part of the previous patch and drop this one.

I am done reviewing this set.

Thanks,
Mathieu

> 
> Suggested-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> ---
> Update vs version V14:
> Fix: Rename missing load() to load_segments() in drivers/remoteproc/pru_rproc.c.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202411281332.Ra70nJAW-lkp@intel.com/
> 
> ---
>  drivers/remoteproc/imx_dsp_rproc.c       | 2 +-
>  drivers/remoteproc/imx_rproc.c           | 2 +-
>  drivers/remoteproc/meson_mx_ao_arc.c     | 2 +-
>  drivers/remoteproc/mtk_scp.c             | 2 +-
>  drivers/remoteproc/pru_rproc.c           | 2 +-
>  drivers/remoteproc/qcom_q6v5_adsp.c      | 2 +-
>  drivers/remoteproc/qcom_q6v5_mss.c       | 2 +-
>  drivers/remoteproc/qcom_q6v5_pas.c       | 4 ++--
>  drivers/remoteproc/qcom_q6v5_wcss.c      | 4 ++--
>  drivers/remoteproc/qcom_wcnss.c          | 2 +-
>  drivers/remoteproc/rcar_rproc.c          | 2 +-
>  drivers/remoteproc/remoteproc_core.c     | 4 ++--
>  drivers/remoteproc/remoteproc_internal.h | 4 ++--
>  drivers/remoteproc/st_remoteproc.c       | 2 +-
>  drivers/remoteproc/st_slim_rproc.c       | 2 +-
>  drivers/remoteproc/stm32_rproc.c         | 2 +-
>  drivers/remoteproc/xlnx_r5_remoteproc.c  | 2 +-
>  include/linux/remoteproc.h               | 4 ++--
>  18 files changed, 23 insertions(+), 23 deletions(-)
> 
> diff --git a/drivers/remoteproc/imx_dsp_rproc.c b/drivers/remoteproc/imx_dsp_rproc.c
> index 376187ad5754..a4a85fbce907 100644
> --- a/drivers/remoteproc/imx_dsp_rproc.c
> +++ b/drivers/remoteproc/imx_dsp_rproc.c
> @@ -934,7 +934,7 @@ static const struct rproc_ops imx_dsp_rproc_ops = {
>  	.start		= imx_dsp_rproc_start,
>  	.stop		= imx_dsp_rproc_stop,
>  	.kick		= imx_dsp_rproc_kick,
> -	.load		= imx_dsp_rproc_elf_load_segments,
> +	.load_segments	= imx_dsp_rproc_elf_load_segments,
>  	.parse_fw	= imx_dsp_rproc_parse_fw,
>  	.find_loaded_rsc_table = rproc_elf_find_loaded_rsc_table,
>  	.sanity_check	= rproc_elf_sanity_check,
> diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> index 800015ff7ff9..f45b3207f7e9 100644
> --- a/drivers/remoteproc/imx_rproc.c
> +++ b/drivers/remoteproc/imx_rproc.c
> @@ -681,7 +681,7 @@ static const struct rproc_ops imx_rproc_ops = {
>  	.stop		= imx_rproc_stop,
>  	.kick		= imx_rproc_kick,
>  	.da_to_va       = imx_rproc_da_to_va,
> -	.load		= rproc_elf_load_segments,
> +	.load_segments	= rproc_elf_load_segments,
>  	.parse_fw	= imx_rproc_parse_fw,
>  	.find_loaded_rsc_table = imx_rproc_elf_find_loaded_rsc_table,
>  	.get_loaded_rsc_table = imx_rproc_get_loaded_rsc_table,
> diff --git a/drivers/remoteproc/meson_mx_ao_arc.c b/drivers/remoteproc/meson_mx_ao_arc.c
> index f6744b538323..a1c8c0929ce3 100644
> --- a/drivers/remoteproc/meson_mx_ao_arc.c
> +++ b/drivers/remoteproc/meson_mx_ao_arc.c
> @@ -137,7 +137,7 @@ static struct rproc_ops meson_mx_ao_arc_rproc_ops = {
>  	.stop		= meson_mx_ao_arc_rproc_stop,
>  	.da_to_va	= meson_mx_ao_arc_rproc_da_to_va,
>  	.get_boot_addr	= rproc_elf_get_boot_addr,
> -	.load		= rproc_elf_load_segments,
> +	.load_segments	= rproc_elf_load_segments,
>  	.sanity_check	= rproc_elf_sanity_check,
>  };
>  
> diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
> index e744c07507ee..4e9a8bf3bc6e 100644
> --- a/drivers/remoteproc/mtk_scp.c
> +++ b/drivers/remoteproc/mtk_scp.c
> @@ -924,7 +924,7 @@ static int scp_stop(struct rproc *rproc)
>  static const struct rproc_ops scp_ops = {
>  	.start		= scp_start,
>  	.stop		= scp_stop,
> -	.load		= scp_load,
> +	.load_segments	= scp_load,
>  	.da_to_va	= scp_da_to_va,
>  	.parse_fw	= scp_parse_fw,
>  	.sanity_check	= rproc_elf_sanity_check,
> diff --git a/drivers/remoteproc/pru_rproc.c b/drivers/remoteproc/pru_rproc.c
> index 327f0c7ee3d6..0b2bf2574f74 100644
> --- a/drivers/remoteproc/pru_rproc.c
> +++ b/drivers/remoteproc/pru_rproc.c
> @@ -1015,7 +1015,7 @@ static int pru_rproc_probe(struct platform_device *pdev)
>  		return -ENOMEM;
>  	}
>  	/* use a custom load function to deal with PRU-specific quirks */
> -	rproc->ops->load = pru_rproc_load_elf_segments;
> +	rproc->ops->load_segments = pru_rproc_load_elf_segments;
>  
>  	/* use a custom parse function to deal with PRU-specific resources */
>  	rproc->ops->parse_fw = pru_rproc_parse_fw;
> diff --git a/drivers/remoteproc/qcom_q6v5_adsp.c b/drivers/remoteproc/qcom_q6v5_adsp.c
> index 572dcb0f055b..aa9896930bcf 100644
> --- a/drivers/remoteproc/qcom_q6v5_adsp.c
> +++ b/drivers/remoteproc/qcom_q6v5_adsp.c
> @@ -527,7 +527,7 @@ static const struct rproc_ops adsp_ops = {
>  	.stop = adsp_stop,
>  	.da_to_va = adsp_da_to_va,
>  	.parse_fw = adsp_parse_firmware,
> -	.load = adsp_load,
> +	.load_segments = adsp_load,
>  	.panic = adsp_panic,
>  };
>  
> diff --git a/drivers/remoteproc/qcom_q6v5_mss.c b/drivers/remoteproc/qcom_q6v5_mss.c
> index 2a42215ce8e0..a8beac1deabe 100644
> --- a/drivers/remoteproc/qcom_q6v5_mss.c
> +++ b/drivers/remoteproc/qcom_q6v5_mss.c
> @@ -1687,7 +1687,7 @@ static const struct rproc_ops q6v5_ops = {
>  	.start = q6v5_start,
>  	.stop = q6v5_stop,
>  	.parse_fw = qcom_q6v5_register_dump_segments,
> -	.load = q6v5_load,
> +	.load_segments = q6v5_load,
>  	.panic = q6v5_panic,
>  };
>  
> diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
> index ef82835e98a4..9b269ce390c1 100644
> --- a/drivers/remoteproc/qcom_q6v5_pas.c
> +++ b/drivers/remoteproc/qcom_q6v5_pas.c
> @@ -436,7 +436,7 @@ static const struct rproc_ops adsp_ops = {
>  	.stop = adsp_stop,
>  	.da_to_va = adsp_da_to_va,
>  	.parse_fw = qcom_register_dump_segments,
> -	.load = adsp_load,
> +	.load_segments = adsp_load,
>  	.panic = adsp_panic,
>  };
>  
> @@ -446,7 +446,7 @@ static const struct rproc_ops adsp_minidump_ops = {
>  	.stop = adsp_stop,
>  	.da_to_va = adsp_da_to_va,
>  	.parse_fw = qcom_register_dump_segments,
> -	.load = adsp_load,
> +	.load_segments = adsp_load,
>  	.panic = adsp_panic,
>  	.coredump = adsp_minidump,
>  };
> diff --git a/drivers/remoteproc/qcom_q6v5_wcss.c b/drivers/remoteproc/qcom_q6v5_wcss.c
> index e913dabae992..44b5736dc8b9 100644
> --- a/drivers/remoteproc/qcom_q6v5_wcss.c
> +++ b/drivers/remoteproc/qcom_q6v5_wcss.c
> @@ -771,7 +771,7 @@ static const struct rproc_ops q6v5_wcss_ipq8074_ops = {
>  	.start = q6v5_wcss_start,
>  	.stop = q6v5_wcss_stop,
>  	.da_to_va = q6v5_wcss_da_to_va,
> -	.load = q6v5_wcss_load,
> +	.load_segments = q6v5_wcss_load,
>  	.get_boot_addr = rproc_elf_get_boot_addr,
>  };
>  
> @@ -779,7 +779,7 @@ static const struct rproc_ops q6v5_wcss_qcs404_ops = {
>  	.start = q6v5_qcs404_wcss_start,
>  	.stop = q6v5_wcss_stop,
>  	.da_to_va = q6v5_wcss_da_to_va,
> -	.load = q6v5_wcss_load,
> +	.load_segments = q6v5_wcss_load,
>  	.get_boot_addr = rproc_elf_get_boot_addr,
>  	.parse_fw = qcom_register_dump_segments,
>  };
> diff --git a/drivers/remoteproc/qcom_wcnss.c b/drivers/remoteproc/qcom_wcnss.c
> index a7bb9da27029..42102bc4c458 100644
> --- a/drivers/remoteproc/qcom_wcnss.c
> +++ b/drivers/remoteproc/qcom_wcnss.c
> @@ -335,7 +335,7 @@ static const struct rproc_ops wcnss_ops = {
>  	.stop = wcnss_stop,
>  	.da_to_va = wcnss_da_to_va,
>  	.parse_fw = qcom_register_dump_segments,
> -	.load = wcnss_load,
> +	.load_segments = wcnss_load,
>  };
>  
>  static irqreturn_t wcnss_wdog_interrupt(int irq, void *dev)
> diff --git a/drivers/remoteproc/rcar_rproc.c b/drivers/remoteproc/rcar_rproc.c
> index cc17e8421f65..e36778fec072 100644
> --- a/drivers/remoteproc/rcar_rproc.c
> +++ b/drivers/remoteproc/rcar_rproc.c
> @@ -142,7 +142,7 @@ static struct rproc_ops rcar_rproc_ops = {
>  	.prepare	= rcar_rproc_prepare,
>  	.start		= rcar_rproc_start,
>  	.stop		= rcar_rproc_stop,
> -	.load		= rproc_elf_load_segments,
> +	.load_segments	= rproc_elf_load_segments,
>  	.parse_fw	= rcar_rproc_parse_fw,
>  	.find_loaded_rsc_table = rproc_elf_find_loaded_rsc_table,
>  	.sanity_check	= rproc_elf_sanity_check,
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index 8df4b2c59bb6..e4ad024efcda 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -2485,11 +2485,11 @@ static int rproc_alloc_ops(struct rproc *rproc, const struct rproc_ops *ops)
>  	if (!rproc->ops->coredump)
>  		rproc->ops->coredump = rproc_coredump;
>  
> -	if (rproc->ops->load || rproc->ops->load_fw)
> +	if (rproc->ops->load_segments || rproc->ops->load_fw)
>  		return 0;
>  
>  	/* Default to ELF loader if no load function is specified */
> -	rproc->ops->load = rproc_elf_load_segments;
> +	rproc->ops->load_segments = rproc_elf_load_segments;
>  	rproc->ops->parse_fw = rproc_elf_load_rsc_table;
>  	rproc->ops->find_loaded_rsc_table = rproc_elf_find_loaded_rsc_table;
>  	rproc->ops->sanity_check = rproc_elf_sanity_check;
> diff --git a/drivers/remoteproc/remoteproc_internal.h b/drivers/remoteproc/remoteproc_internal.h
> index 2104ca449178..b898494600cf 100644
> --- a/drivers/remoteproc/remoteproc_internal.h
> +++ b/drivers/remoteproc/remoteproc_internal.h
> @@ -167,8 +167,8 @@ u64 rproc_get_boot_addr(struct rproc *rproc, const struct firmware *fw)
>  static inline
>  int rproc_load_segments(struct rproc *rproc, const struct firmware *fw)
>  {
> -	if (rproc->ops->load)
> -		return rproc->ops->load(rproc, fw);
> +	if (rproc->ops->load_segments)
> +		return rproc->ops->load_segments(rproc, fw);
>  
>  	return -EINVAL;
>  }
> diff --git a/drivers/remoteproc/st_remoteproc.c b/drivers/remoteproc/st_remoteproc.c
> index 1340be9d0110..8d6b75e91531 100644
> --- a/drivers/remoteproc/st_remoteproc.c
> +++ b/drivers/remoteproc/st_remoteproc.c
> @@ -233,7 +233,7 @@ static const struct rproc_ops st_rproc_ops = {
>  	.start			= st_rproc_start,
>  	.stop			= st_rproc_stop,
>  	.parse_fw		= st_rproc_parse_fw,
> -	.load			= rproc_elf_load_segments,
> +	.load_segments		= rproc_elf_load_segments,
>  	.find_loaded_rsc_table	= rproc_elf_find_loaded_rsc_table,
>  	.sanity_check		= rproc_elf_sanity_check,
>  	.get_boot_addr		= rproc_elf_get_boot_addr,
> diff --git a/drivers/remoteproc/st_slim_rproc.c b/drivers/remoteproc/st_slim_rproc.c
> index 5412beb0a692..0f91d8f1e7c7 100644
> --- a/drivers/remoteproc/st_slim_rproc.c
> +++ b/drivers/remoteproc/st_slim_rproc.c
> @@ -201,7 +201,7 @@ static const struct rproc_ops slim_rproc_ops = {
>  	.stop		= slim_rproc_stop,
>  	.da_to_va       = slim_rproc_da_to_va,
>  	.get_boot_addr	= rproc_elf_get_boot_addr,
> -	.load		= rproc_elf_load_segments,
> +	.load_segments	= rproc_elf_load_segments,
>  	.sanity_check	= rproc_elf_sanity_check,
>  };
>  
> diff --git a/drivers/remoteproc/stm32_rproc.c b/drivers/remoteproc/stm32_rproc.c
> index 8c7f7950b80e..7e8ffd9fcc57 100644
> --- a/drivers/remoteproc/stm32_rproc.c
> +++ b/drivers/remoteproc/stm32_rproc.c
> @@ -667,7 +667,7 @@ static const struct rproc_ops st_rproc_ops = {
>  	.attach		= stm32_rproc_attach,
>  	.detach		= stm32_rproc_detach,
>  	.kick		= stm32_rproc_kick,
> -	.load		= rproc_elf_load_segments,
> +	.load_segments	= rproc_elf_load_segments,
>  	.parse_fw	= stm32_rproc_parse_fw,
>  	.find_loaded_rsc_table = rproc_elf_find_loaded_rsc_table,
>  	.get_loaded_rsc_table = stm32_rproc_get_loaded_rsc_table,
> diff --git a/drivers/remoteproc/xlnx_r5_remoteproc.c b/drivers/remoteproc/xlnx_r5_remoteproc.c
> index 5aeedeaf3c41..59cfba0a02e7 100644
> --- a/drivers/remoteproc/xlnx_r5_remoteproc.c
> +++ b/drivers/remoteproc/xlnx_r5_remoteproc.c
> @@ -864,7 +864,7 @@ static const struct rproc_ops zynqmp_r5_rproc_ops = {
>  	.unprepare	= zynqmp_r5_rproc_unprepare,
>  	.start		= zynqmp_r5_rproc_start,
>  	.stop		= zynqmp_r5_rproc_stop,
> -	.load		= rproc_elf_load_segments,
> +	.load_segments	= rproc_elf_load_segments,
>  	.parse_fw	= zynqmp_r5_parse_fw,
>  	.find_loaded_rsc_table = rproc_elf_find_loaded_rsc_table,
>  	.sanity_check	= rproc_elf_sanity_check,
> diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
> index ba6fd560f7ba..55c20424a99f 100644
> --- a/include/linux/remoteproc.h
> +++ b/include/linux/remoteproc.h
> @@ -374,7 +374,7 @@ enum rsc_handling_status {
>   * @find_loaded_rsc_table: find the loaded resource table from firmware image
>   * @get_loaded_rsc_table: get resource table installed in memory
>   *			  by external entity
> - * @load:		load firmware to memory, where the remote processor
> + * @load_segments:	load firmware ELF segment to memory, where the remote processor
>   *			expects to find it
>   * @sanity_check:	sanity check the fw image
>   * @get_boot_addr:	get boot address to entry point specified in firmware
> @@ -402,7 +402,7 @@ struct rproc_ops {
>  				struct rproc *rproc, const struct firmware *fw);
>  	struct resource_table *(*get_loaded_rsc_table)(
>  				struct rproc *rproc, size_t *size);
> -	int (*load)(struct rproc *rproc, const struct firmware *fw);
> +	int (*load_segments)(struct rproc *rproc, const struct firmware *fw);
>  	int (*sanity_check)(struct rproc *rproc, const struct firmware *fw);
>  	u64 (*get_boot_addr)(struct rproc *rproc, const struct firmware *fw);
>  	unsigned long (*panic)(struct rproc *rproc);
> -- 
> 2.25.1
> 

