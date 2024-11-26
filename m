Return-Path: <linux-arm-msm+bounces-39157-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D6C69D915A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Nov 2024 06:30:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D2E7BB21685
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Nov 2024 05:30:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D18649627;
	Tue, 26 Nov 2024 05:30:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="c8ObY1C1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D758E28FF
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 Nov 2024 05:30:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732599028; cv=none; b=HLlJgEwKinVryLo1OTUKlqKlIEgGLKh/v8+7FxXaCsOhigaKXvRJ/30kbeEc2IEV94+Aj/MzxHznKUIF6aFnenASKGddqH1jiwEDIM+vvmZwoMtrR1Xry6IuHZS865BSS42j/AGl/0gYU6VHcx56qEtl/mbxTYj7AVkWADLAj50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732599028; c=relaxed/simple;
	bh=o4LhmfXC5MooUEDUNdHO8UKVRmTQhxNWb1GETowtOkg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Dwlt++vke32iIegGBTKFkSgGIJiNn7W9gKcLB7Q3W/k0vti0aD1mN+mKB2l17vo9JJlWHdjIztYwBgkpbL8niY9NAiTH8adhbWCjGxMtb2g4YNqsGHzZG9GspJRHRRIIU49Txi8dE5bIss+HAV28k+G8qm7Q44vmoZqvE7QN93c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=c8ObY1C1; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2129fd7b1a5so35241315ad.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Nov 2024 21:30:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732599025; x=1733203825; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DRK5oxyyGXu9C+opb6esMTgR5oRPw3Spok7HT4y56m0=;
        b=c8ObY1C1v7SB45P9+X521c7sff5JC1Z1Bf523z5lxakWDrSWtSxFvw1qYwKT6ql2Q0
         j/FsqY1gj+sfw1HAt9xOCYEMqs/k9rZBeP6//Rsowiw9x6CXsuJZ5PkrMr74l1llT6yt
         NyLMmpm6mamU//EpAf1jv/E1Mm2coxG1xWUZVcld265Z8zxlOwchdPg4enOqFkTstCVx
         Tnk8YmMqGu+5Ro0qdxzHLbzMHYyRZC8Ah+CU4n6F093KiZdbR7Z6izK1uGXnQXICOghG
         OmrqNLr0DAN+njVJAUoa9KmX0EBDOZFExYuI20HUK7p/nvSbKaZrR1B0wmOLQfWOxhg6
         t77g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732599025; x=1733203825;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DRK5oxyyGXu9C+opb6esMTgR5oRPw3Spok7HT4y56m0=;
        b=l54qSuEgUcFO01NVafJpD4hbesvHmPChV2RZ6dJp+KA6P/6voYqAKi0s3ZHZSzGCzG
         /DHVo6KigqseD3r+P69b2E0CpOquw2dWlSNPBGm37hvlzvhKbpDdIVIk9OQkygHuoomM
         StQZr/7v/EF0NBhFk8qXEdl4IhxQaLgeSucNVwUeu3346pUzpfpVKzWWFTfTtZ0T9qdb
         cIeGJhSMIc+kgFSyxQCOa7EdOJimRgpCyYPGqtR/2ipYvwXh11XD67ht69xEOAVGZz5T
         xugaXqn7d6ToeGibtTID3P9eP/yai4Ii0ExNgBy2AT5vtuUe1wLaPf/V3wrAVgskJDp5
         Nbtg==
X-Forwarded-Encrypted: i=1; AJvYcCW9lSad0BukVfqj8JF4fkSxfv7hwZzN4QdDszm+DC++toMEHWBmXJSUTq4vXC7Qw11bHcHhUNlbBodb6Wlw@vger.kernel.org
X-Gm-Message-State: AOJu0YyJ8ktLtpzoP1/t61dJDVX45itLNJwa6WhpdO2OIu1Jl6Q22U0M
	2vUAJk7cqS0TcYA2vmkz5vDdp/yzaNqxw8eph/EVqmeXSTfIkqQVu+92wv2+NA==
X-Gm-Gg: ASbGncsTO2mkSCERqmSKM1LJDsfBOLpX7iHn+/9tNp6s/Ifm816O5SfBvgN0fvzY/JY
	QJF1a5k4GF0YeUqAeUPjH7mTQE020G0ELjyNziEVTQetRSGX4ai5CoVn6rryv1TIp52aR61uOly
	Ude4fwGY5IAlTK94uyS5wipTV1F7gXsnKJLiupY3mS1Vy9EeQ4RZT0wIOthBjEOALwOIqoHL1wZ
	8CHyw1tNiDxvzNlmBKBXDIn96JfJmlHigrYPp3cW/l91Ad8v5jzDD3Yg7yY+74=
X-Google-Smtp-Source: AGHT+IGZ020HY/PPdo2y57mtAEO25NQ77pGViPvf4gHiy78OoGcD1OclydKAhtt/4Zcov+z5xdsELQ==
X-Received: by 2002:a17:902:cec4:b0:212:52b9:1571 with SMTP id d9443c01a7336-2129f28a295mr213455245ad.43.1732599025102;
        Mon, 25 Nov 2024 21:30:25 -0800 (PST)
Received: from thinkpad ([220.158.156.172])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2129dbfa342sm75502395ad.115.2024.11.25.21.30.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Nov 2024 21:30:24 -0800 (PST)
Date: Tue, 26 Nov 2024 11:00:19 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Md Sadre Alam <quic_mdalam@quicinc.com>
Cc: miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
	bbrezillon@kernel.org, linux-mtd@lists.infradead.org,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	quic_srichara@quicinc.com, quic_varada@quicinc.com,
	quic_nainmeht@quicinc.com, quic_laksd@quicinc.com
Subject: Re: [PATCH v2 1/3] mtd: rawnand: qcom: Pass 18 bit offset from QPIC
 base address to BAM
Message-ID: <20241126053019.ujdb7nkkj3f25jyn@thinkpad>
References: <20241122085933.2663927-1-quic_mdalam@quicinc.com>
 <20241122085933.2663927-2-quic_mdalam@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241122085933.2663927-2-quic_mdalam@quicinc.com>

On Fri, Nov 22, 2024 at 02:29:31PM +0530, Md Sadre Alam wrote:
> Currently we are configuring lower 24 bits of address in descriptor
> whereas QPIC design expects 18 bit register offset from QPIC base
> address to be configured in cmd descriptors. This is leading to a
> different address actually being used in HW, leading to wrong value
> read.
> 
> the actual issue is that the NANDc base address is different from the
> QPIC base address. But the driver doesn't take it into account and just
> used the QPIC base as the NANDc base. This used to work as the NANDc IP
> only considers the lower 18 bits of the address passed by the driver to
> derive the register offset. Since the base address of QPIC used to contain
> all 0 for lower 18 bits (like 0x07980000), the driver ended up passing the

SDX55's NANDc base is 0x01b30000 and it has bits 17 and 18 set corresponding to
0x30000. So it is correct that the IP only considers lower 18 bits and it used
to work as the driver ended up passing 0x3000 + register offset.

Your wording is not correct.

> actual register offset in it and NANDc worked properly. But on newer SoCs
> like SDX75, the QPIC base address doesn't contain all 0 for lower 18 bits
> (like 0x01C98000). So NANDc sees wrong offset as per the current logic
> 

'all 0 for lower 18 bits' is not true.

> Older targets also used same configuration (lower 24 bits) like SDX55,
> SDX65, IPQ8074, IPQ6018  etc. but issue is masked in older targets due
> to lower 18 bits of QPIC base address being zero leading to expected
> address generation.
> 

This paragraph is redundant now.

> The address should be passed to BAM 0x30000 + offset. In older targets
> the lower 18-bits are zero so that correct address being paased. But
> in newer targets the lower 18-bits are non-zero in QPIC base so that
> 0x300000 + offset giving the wrong value.
> 
> SDX75 : QPIC_QPIC | 0x01C98000 (Lower 18 bits are non zero)
> SDX55 : QPIC_QPIC | 0x07980000 (Lower 18 bits are zero) Same for

This address is wrong as I mentioned above.

> older targets.
> 
> Cc: stable@vger.kernel.org
> Fixes: 8d6b6d7e135e ("mtd: nand: qcom: support for command descriptor formation")
> Signed-off-by: Md Sadre Alam <quic_mdalam@quicinc.com>
> ---
> 
> Change in [v2]
> 
> * Updated commit message
> 
> * Added Fixes tag
> 
> * Added stable kernel tag
> 
> * Renamed the variable from offset_from_qpic to nandc_offset
> 
> Change in [v1]
> 
> * Preliminary correction for the register address forwarded to BAM
>  
>  drivers/mtd/nand/raw/qcom_nandc.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/mtd/nand/raw/qcom_nandc.c b/drivers/mtd/nand/raw/qcom_nandc.c
> index b8cff9240b28..cc59461df72e 100644
> --- a/drivers/mtd/nand/raw/qcom_nandc.c
> +++ b/drivers/mtd/nand/raw/qcom_nandc.c
> @@ -207,7 +207,7 @@ nandc_set_reg(chip, reg,			\
>  #define dev_cmd_reg_addr(nandc, reg) ((nandc)->props->dev_cmd_reg_start + (reg))
>  
>  /* Returns the NAND register physical address */
> -#define nandc_reg_phys(chip, offset) ((chip)->base_phys + (offset))
> +#define nandc_reg_phys(chip, offset)  ((nandc)->props->nandc_offset + (offset))
>  
>  /* Returns the dma address for reg read buffer */
>  #define reg_buf_dma_addr(chip, vaddr) \
> @@ -561,6 +561,7 @@ struct qcom_nandc_props {
>  	bool is_qpic;
>  	bool qpic_v2;
>  	bool use_codeword_fixup;
> +	u32 nandc_offset;
>  };
>  
>  /* Frees the BAM transaction memory */
> @@ -3477,6 +3478,7 @@ static const struct qcom_nandc_props ipq806x_nandc_props = {
>  	.is_bam = false,
>  	.use_codeword_fixup = true,
>  	.dev_cmd_reg_start = 0x0,
> +	.nandc_offset = 0x30000,
>  };
>  
>  static const struct qcom_nandc_props ipq4019_nandc_props = {
> @@ -3484,6 +3486,7 @@ static const struct qcom_nandc_props ipq4019_nandc_props = {
>  	.is_bam = true,
>  	.is_qpic = true,
>  	.dev_cmd_reg_start = 0x0,
> +	.nandc_offset = 0x30000,
>  };
>  
>  static const struct qcom_nandc_props ipq8074_nandc_props = {
> @@ -3491,6 +3494,7 @@ static const struct qcom_nandc_props ipq8074_nandc_props = {
>  	.is_bam = true,
>  	.is_qpic = true,
>  	.dev_cmd_reg_start = 0x7000,
> +	.nandc_offset = 0x30000,
>  };
>  
>  static const struct qcom_nandc_props sdx55_nandc_props = {
> @@ -3498,7 +3502,8 @@ static const struct qcom_nandc_props sdx55_nandc_props = {
>  	.is_bam = true,
>  	.is_qpic = true,
>  	.qpic_v2 = true,
> -	.dev_cmd_reg_start = 0x7000,
> +	.dev_cmd_reg_start = 0x0,

What is this change?

- Mani

-- 
மணிவண்ணன் சதாசிவம்

