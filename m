Return-Path: <linux-arm-msm+bounces-55564-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AC1DBA9C007
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 09:48:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B97AA1B85B21
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 07:48:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A404230981;
	Fri, 25 Apr 2025 07:48:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RWWFpaZx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5AE25A79B
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 07:48:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745567284; cv=none; b=ORvKeLoOQrXgStqcE57DXQbzpNH56aAHI5rmpFjcR/ZhiEsj3w1IMmlVBc+XW3GsrS7B4VgauQgnZwi1hvkGctLY/uGkkomUGUGGQsVdo5K2FOBLHCR4edXemQfbIHuM4rRJjUWp7zN/3cnZRNAJdYdeMTRzbNUW7p5Hcr8Kf7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745567284; c=relaxed/simple;
	bh=f7h8dxvV7ChOf0zR9pxS70TS/wjvGYnZMMlO0a4r8D8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VAzMqCMvPT+0Gw2NX+UnEhA/b7J6KnIEWAzOyoxbWpfiv9Wj6AP9qfS/jqB29WXske4wi2+hHcPrrVY5KczFd8gnRyOLVXAPMxuA5KpJ5Z9izDZTTNc1DekUaeFMBUmV/CsFy7xnWZbEBr92AaPQOk5sgLg7BwdB177XqdsMcXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RWWFpaZx; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-739525d4e12so1645542b3a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 00:48:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745567281; x=1746172081; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LXYXeX99yUYQ64wKe7OdIaME+qdUHpQKuv9wqgqo5Cs=;
        b=RWWFpaZxkLRx+H2sOdgvh35bwYAVrE22g4rw6im295QLwFZN6SmuZ3dugN3oQifO3v
         tQmr/eJU1WwyHisU0m9vpaE7QVrjx288n/Rz9R1Qbkn0R3VPaKE7bUpHq039VZvgvmCX
         YLRoGCLzZovjuGK4gGOGFrG3P2pHNPkSsUbJx/WFaW9FKE46CPD7uzwH+f4cZ1xBPyAA
         ZcPjCteXGiV08TVhlJHO8R8QTtEDpN1oCt8+apvor4xE2D6M49FRJqQheKFoxkT6c1S/
         +09ltCMYnYlYoSPisMyPT7FI6C5vy6G8ozkH8scOu0yhy5IYmMd6p3d1/Fsqt3ay7Koe
         7j6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745567281; x=1746172081;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LXYXeX99yUYQ64wKe7OdIaME+qdUHpQKuv9wqgqo5Cs=;
        b=vmRbaA3hwp68tzNutBLaEN8ogljoTyMD/+mJ8LMLciXKUZ4zdBA68mNQIjs6IG/QJP
         9SDphBhRU6PuEEXv36rbtozJ4mx/6ohnkUb6RaeWNWmNW+C85uDJXRZSb+UIE94EsKAN
         aXcqTd4bDcFeaqt2JQycRVaZJVcwArR+Aw1Se1PR2O42va6NTC3whR7wbo2TK+1hRfqB
         jz5uO/gc5RsV9R6Ks3fPECtiU8v5tvH+ZYlMn7CGCQNe4EgM15hmSpuarrOyDpDpTCFV
         OIYvCkvVNyHnRBH5LDgKI446a8pRnYTpn8nzp1GLAn/rOK3tsiCpQkx8iC6e1v3dUbm5
         FXsA==
X-Forwarded-Encrypted: i=1; AJvYcCVLbU5aYuTsy3DHj5DkjAefTpVE2o2vN0lE3Kil7CdY7JSMNGUIYpKli29Me5bfSf4GyExiknITE0Jou9wT@vger.kernel.org
X-Gm-Message-State: AOJu0YxNSVz/sKk6Z30Jh1UHzu9016PgSLjp7s8JVD6SOrUJmHeh7wg4
	fP2bdhF2x+mgKUuoVZyUB6MC5YEZEHGjBhnH7nIFj7RQys3QJX99TVEGtPTeMg==
X-Gm-Gg: ASbGncuJG8G+ch9BM8Fu8CHG3R8PhbrT27HJQQ8GNDScyRJO8U55K/w4i/nAv024fKk
	OSr7SXzjlVj747IkZGU76ztenjGP4zmQ5wR8rTpNNqxTnU9BZ15cb9sYEiReKnynSMcPSTEj+O9
	HFPmhcyqZZop+TrURaOI8o2lQPNeYeff208aet+LLGRgjlUMzvSZcGzzbE1wyIVYc8POaYjeUGq
	QAY3XdfJJvdQxlD2mobG+y4LzryeArSJMzMyuVqvLMwRAEVEkB5L/f+pbnaPJS9Q9x02nLzjQLJ
	U5gNdLPgF0qDTuzWJnJ1gj+m1l+wZQPj/ZdwhjlIwsPnsWHSMrw=
X-Google-Smtp-Source: AGHT+IFC/H/dBuQro0RKj49t41PCO5t1nJ6DAmlcyxyxl51nS8GK+dmHa5dgtUQcySuxJPxP0VqInQ==
X-Received: by 2002:a05:6a00:179e:b0:730:927c:d451 with SMTP id d2e1a72fcca58-73fd90457demr1937127b3a.20.1745567280870;
        Fri, 25 Apr 2025 00:48:00 -0700 (PDT)
Received: from thinkpad ([120.60.77.160])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73e25a6a317sm2647101b3a.93.2025.04.25.00.47.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 00:48:00 -0700 (PDT)
Date: Fri, 25 Apr 2025 13:17:54 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Md Sadre Alam <quic_mdalam@quicinc.com>
Cc: miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com, 
	broonie@kernel.org, absahu@codeaurora.org, bbrezillon@kernel.org, 
	architt@codeaurora.org, quic_srichara@quicinc.com, linux-mtd@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-spi@vger.kernel.org
Subject: Re: [PATCH v4 1/3] mtd: rawnand: qcom: Pass 18 bit offset from NANDc
 base to BAM base
Message-ID: <bsj6kvqjo3pfbsakex5quamk5tkrtigxdcoyu5bj3nt37zsgc5@7h7zidzbcs7p>
References: <20250410100019.2872271-1-quic_mdalam@quicinc.com>
 <20250410100019.2872271-2-quic_mdalam@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250410100019.2872271-2-quic_mdalam@quicinc.com>

On Thu, Apr 10, 2025 at 03:30:17PM +0530, Md Sadre Alam wrote:
> The BAM command descriptor provides only 18 bits to specify the NAND
> register offset. 

s/NAND register offset/BAM register offset

> Additionally, in the BAM command descriptor, the NAND
> register offset is supposed to be specified as "(NANDc base - BAM base)

Same here.

> + reg_off". Since, the BAM controller expecting the value in the form of
> "NANDc base - BAM base", so that added a new field 'bam_offset' in the NAND
> properties structure and use it while preparing the command descriptor.
> 
> Previously, the driver was specifying the NANDc base address in the BAM
> command descriptor.
> 
> Cc: stable@vger.kernel.org
> Fixes: 8d6b6d7e135e ("mtd: nand: qcom: support for command descriptor formation")
> Tested-by: Lakshmi Sowjanya D <quic_laksd@quicinc.com>
> Signed-off-by: Md Sadre Alam <quic_mdalam@quicinc.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

- Mani

> ---
>  drivers/mtd/nand/qpic_common.c       | 8 ++++----
>  drivers/mtd/nand/raw/qcom_nandc.c    | 4 ++++
>  drivers/spi/spi-qpic-snand.c         | 1 +
>  include/linux/mtd/nand-qpic-common.h | 4 +---
>  4 files changed, 10 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/mtd/nand/qpic_common.c b/drivers/mtd/nand/qpic_common.c
> index e0ed25b5afea..4dc4d65e7d32 100644
> --- a/drivers/mtd/nand/qpic_common.c
> +++ b/drivers/mtd/nand/qpic_common.c
> @@ -236,21 +236,21 @@ int qcom_prep_bam_dma_desc_cmd(struct qcom_nand_controller *nandc, bool read,
>  	int i, ret;
>  	struct bam_cmd_element *bam_ce_buffer;
>  	struct bam_transaction *bam_txn = nandc->bam_txn;
> +	u32 offset;
>  
>  	bam_ce_buffer = &bam_txn->bam_ce[bam_txn->bam_ce_pos];
>  
>  	/* fill the command desc */
>  	for (i = 0; i < size; i++) {
> +		offset = nandc->props->bam_offset + reg_off + 4 * i;
>  		if (read)
>  			bam_prep_ce(&bam_ce_buffer[i],
> -				    nandc_reg_phys(nandc, reg_off + 4 * i),
> -				    BAM_READ_COMMAND,
> +				    offset, BAM_READ_COMMAND,
>  				    reg_buf_dma_addr(nandc,
>  						     (__le32 *)vaddr + i));
>  		else
>  			bam_prep_ce_le32(&bam_ce_buffer[i],
> -					 nandc_reg_phys(nandc, reg_off + 4 * i),
> -					 BAM_WRITE_COMMAND,
> +					 offset, BAM_WRITE_COMMAND,
>  					 *((__le32 *)vaddr + i));
>  	}
>  
> diff --git a/drivers/mtd/nand/raw/qcom_nandc.c b/drivers/mtd/nand/raw/qcom_nandc.c
> index 5eaa0be367cd..ef2dd158ca34 100644
> --- a/drivers/mtd/nand/raw/qcom_nandc.c
> +++ b/drivers/mtd/nand/raw/qcom_nandc.c
> @@ -2360,6 +2360,7 @@ static const struct qcom_nandc_props ipq806x_nandc_props = {
>  	.supports_bam = false,
>  	.use_codeword_fixup = true,
>  	.dev_cmd_reg_start = 0x0,
> +	.bam_offset = 0x30000,
>  };
>  
>  static const struct qcom_nandc_props ipq4019_nandc_props = {
> @@ -2367,6 +2368,7 @@ static const struct qcom_nandc_props ipq4019_nandc_props = {
>  	.supports_bam = true,
>  	.nandc_part_of_qpic = true,
>  	.dev_cmd_reg_start = 0x0,
> +	.bam_offset = 0x30000,
>  };
>  
>  static const struct qcom_nandc_props ipq8074_nandc_props = {
> @@ -2374,6 +2376,7 @@ static const struct qcom_nandc_props ipq8074_nandc_props = {
>  	.supports_bam = true,
>  	.nandc_part_of_qpic = true,
>  	.dev_cmd_reg_start = 0x7000,
> +	.bam_offset = 0x30000,
>  };
>  
>  static const struct qcom_nandc_props sdx55_nandc_props = {
> @@ -2382,6 +2385,7 @@ static const struct qcom_nandc_props sdx55_nandc_props = {
>  	.nandc_part_of_qpic = true,
>  	.qpic_version2 = true,
>  	.dev_cmd_reg_start = 0x7000,
> +	.bam_offset = 0x30000,
>  };
>  
>  /*
> diff --git a/drivers/spi/spi-qpic-snand.c b/drivers/spi/spi-qpic-snand.c
> index a2af731049d4..89c774bf85a6 100644
> --- a/drivers/spi/spi-qpic-snand.c
> +++ b/drivers/spi/spi-qpic-snand.c
> @@ -1605,6 +1605,7 @@ static void qcom_spi_remove(struct platform_device *pdev)
>  
>  static const struct qcom_nandc_props ipq9574_snandc_props = {
>  	.dev_cmd_reg_start = 0x7000,
> +	.bam_offset = 0x30000,
>  	.supports_bam = true,
>  };
>  
> diff --git a/include/linux/mtd/nand-qpic-common.h b/include/linux/mtd/nand-qpic-common.h
> index cd7172e6c1bb..e8462deda6db 100644
> --- a/include/linux/mtd/nand-qpic-common.h
> +++ b/include/linux/mtd/nand-qpic-common.h
> @@ -199,9 +199,6 @@
>   */
>  #define dev_cmd_reg_addr(nandc, reg) ((nandc)->props->dev_cmd_reg_start + (reg))
>  
> -/* Returns the NAND register physical address */
> -#define nandc_reg_phys(chip, offset) ((chip)->base_phys + (offset))
> -
>  /* Returns the dma address for reg read buffer */
>  #define reg_buf_dma_addr(chip, vaddr) \
>  	((chip)->reg_read_dma + \
> @@ -454,6 +451,7 @@ struct qcom_nand_controller {
>  struct qcom_nandc_props {
>  	u32 ecc_modes;
>  	u32 dev_cmd_reg_start;
> +	u32 bam_offset;
>  	bool supports_bam;
>  	bool nandc_part_of_qpic;
>  	bool qpic_version2;
> -- 
> 2.34.1
> 

-- 
மணிவண்ணன் சதாசிவம்

