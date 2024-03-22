Return-Path: <linux-arm-msm+bounces-14857-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E5847886F62
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Mar 2024 16:05:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 14FBC1C21290
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Mar 2024 15:05:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 710DF482F3;
	Fri, 22 Mar 2024 15:05:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="E9it4zVh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1C334CE13
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Mar 2024 15:05:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711119917; cv=none; b=GbbsOxTwBU1wgelJNAk8K4TrOaUL3j8EH3vbcbNa2LdgVa3QWFSk8ef2YP+nnuKE+Jt88BPu49sFvX6+0Pqs4ZZ68x7LuTMInckdYxiAt7RV590oulc6rqZbEysry6ShRZ4NS6gnbBHxuR87J3u9XdiZ3582dUXycVk3i6dE15M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711119917; c=relaxed/simple;
	bh=gkYusBscgoxgaz2KTP3MjsMEu9+re1gKs0yjn4oDBW4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uIKHq2qt0tfM03u6Zt8jsT3CTuBeKU6svsTMcf/ddqTTpx48R+lyORCmoIORWsgTNYUW+GOl0NOwTsDrVt3saPdWF3VEPeFQ8gU4Tw1QYRfrKO5SyhV9xVSvkJLTb4gIN8xRHgSM0/nYRq2FOJiXVwBrdIEJc0+1b9uVX2Su4Y0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=E9it4zVh; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-6e6082eab17so1667740b3a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 Mar 2024 08:05:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711119915; x=1711724715; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nYtRMDTbG4RNH7nK1yI7ROk5/pYQnmRT4k34XSD/fpw=;
        b=E9it4zVh9Pkks3nwfSUogd0oEvXC8XrwSt0mueISehd+g9ShdMJRzkz0xBSr10Zg6B
         3YQo5ZfQDiVEbC22WCdo1df/bt7/ji62Uira2xHoj8SkxYtmo5WOanEsqdUVftPi497H
         wirNuBmfYtc0eOy0TBHulPPitlIBZCjbZQmHKO7SVmuf2FARpKNGaxenvSy/th3Uaqdq
         kNL2myDWA1GWQwol1RInA1akjed1GNeyyj6QhEZ0FqmDYtNikQX+mNNVegvah+G//4ZD
         rAAh6eA+OPerRqfSbphSb5dIkxGqgxNsdPkIvRtiFEKhuvw/vMWsNJrJtlRoLFHR498C
         rVYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711119915; x=1711724715;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nYtRMDTbG4RNH7nK1yI7ROk5/pYQnmRT4k34XSD/fpw=;
        b=fFCzf5CZpb90WTnoYFsoqN7c1FRQGicndmNiyUD41DLSyZQGdiKFbbWuMa5ezS1scB
         vUOfMjMGARBwco9qX01JCDFLlIzrgJdEWBALvSZTkBIZMUJSxKakfd0YymbKMvD+XOQG
         5YMASAmSN0JgL5lW6P6+ZQMCSq1uwEGMCxGkOSP6XxC3xeyO1neM+KnztjvPRvY1TmaW
         wn53amnzqkfp2vsPEnTO/o0XFE3XPQXyHRbdXyHoq4v9q9TypCQZ1lxLnyVZsDZLY4z1
         TGeBfOVS/Jh/A916NOfHcPiTx4gyZAAG5EduUDYHz7mctUV0zW7xm41y+64C2z5NqONa
         SNVQ==
X-Forwarded-Encrypted: i=1; AJvYcCUOGI1NoB5eUsaK5/DhjYHmBo3rvduDr6ONKRVl5XWP2UimC3LBlfGoqfU8GNR74p9edvieJeMplp6zt97zgD40I8E8bysBeTRfSLZAdQ==
X-Gm-Message-State: AOJu0YxnzZ00sxHFYjr/zCcLuS7jGOLxHmSxG+tbhK98uOnR8gHhii8R
	+W07yKGdBkpXs9lBsinnALniQLFKuX2ZEvLVTZeybI5NSK225Z2+5RjAdemenA==
X-Google-Smtp-Source: AGHT+IGYbQybiUZqXzRNwAr1M/pqxdrMdugBVhGSQDcs2L60R2/mNWIyHVBayTYGU3wCM5UA6L13jA==
X-Received: by 2002:a17:90a:ff95:b0:29f:9548:4932 with SMTP id hf21-20020a17090aff9500b0029f95484932mr2430080pjb.3.1711119914819;
        Fri, 22 Mar 2024 08:05:14 -0700 (PDT)
Received: from thinkpad ([103.28.246.103])
        by smtp.gmail.com with ESMTPSA id x20-20020a17090abc9400b0029dd7b52d1bsm5604576pjr.56.2024.03.22.08.05.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Mar 2024 08:05:14 -0700 (PDT)
Date: Fri, 22 Mar 2024 20:35:10 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Sricharan Ramabadhran <quic_srichara@quicinc.com>,
	Md Sadre Alam <quic_mdalam@quicinc.com>,
	linux-mtd@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] mtd: rawnand: qcom: Fix broken misc_cmd_type in exec_op
Message-ID: <20240322150510.GC3774@thinkpad>
References: <20240320001141.16560-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240320001141.16560-1-ansuelsmth@gmail.com>

On Wed, Mar 20, 2024 at 01:11:39AM +0100, Christian Marangi wrote:
> misc_cmd_type in exec_op have multiple problems. With commit a82990c8a409
> ("mtd: rawnand: qcom: Add read/read_start ops in exec_op path") it was
> reworked and generalized but actually dropped the handling of the
> RESET_DEVICE command.
> 
> The rework itself was correct with supporting case where a single misc
> command is handled, but became problematic by the addition of exiting
> early if we didn't had an ERASE or an OP_PROGRAM_PAGE operation.
> 
> Also additional logic was added without clear explaination causing the
> erase command to be broken on testing it on a ipq806x nandc.
> 

Interesting. I believe Alam tested the rework on IPQ platforms and not sure how
it got missed.

> Add some additional logic to restore RESET_DEVICE command handling and
> fix erase command.
> 

This sounds like two independent fixes, no? Please split them into separate
patches.

- Mani

> Fixes: a82990c8a409 ("mtd: rawnand: qcom: Add read/read_start ops in exec_op path")
> Cc: stable@vger.kernel.org
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> ---
>  drivers/mtd/nand/raw/qcom_nandc.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/mtd/nand/raw/qcom_nandc.c b/drivers/mtd/nand/raw/qcom_nandc.c
> index b079605c84d3..b8cff9240b28 100644
> --- a/drivers/mtd/nand/raw/qcom_nandc.c
> +++ b/drivers/mtd/nand/raw/qcom_nandc.c
> @@ -2815,7 +2815,7 @@ static int qcom_misc_cmd_type_exec(struct nand_chip *chip, const struct nand_sub
>  			      host->cfg0_raw & ~(7 << CW_PER_PAGE));
>  		nandc_set_reg(chip, NAND_DEV0_CFG1, host->cfg1_raw);
>  		instrs = 3;
> -	} else {
> +	} else if (q_op.cmd_reg != OP_RESET_DEVICE) {
>  		return 0;
>  	}
>  
> @@ -2830,9 +2830,8 @@ static int qcom_misc_cmd_type_exec(struct nand_chip *chip, const struct nand_sub
>  	nandc_set_reg(chip, NAND_EXEC_CMD, 1);
>  
>  	write_reg_dma(nandc, NAND_FLASH_CMD, instrs, NAND_BAM_NEXT_SGL);
> -	(q_op.cmd_reg == OP_BLOCK_ERASE) ? write_reg_dma(nandc, NAND_DEV0_CFG0,
> -	2, NAND_BAM_NEXT_SGL) : read_reg_dma(nandc,
> -	NAND_FLASH_STATUS, 1, NAND_BAM_NEXT_SGL);
> +	if (q_op.cmd_reg == OP_BLOCK_ERASE)
> +		write_reg_dma(nandc, NAND_DEV0_CFG0, 2, NAND_BAM_NEXT_SGL);
>  
>  	write_reg_dma(nandc, NAND_EXEC_CMD, 1, NAND_BAM_NEXT_SGL);
>  	read_reg_dma(nandc, NAND_FLASH_STATUS, 1, NAND_BAM_NEXT_SGL);
> -- 
> 2.43.0
> 

-- 
மணிவண்ணன் சதாசிவம்

