Return-Path: <linux-arm-msm+bounces-15121-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 681E888BB76
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Mar 2024 08:40:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1D5261F358C0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Mar 2024 07:40:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22472131185;
	Tue, 26 Mar 2024 07:39:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jCiGPbub"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 963BF1804F
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 Mar 2024 07:39:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711438797; cv=none; b=oLV6/3+H4R2/+LQImhsy5yKGAleG1+zA7hWEh4KpMydnnhOk1Kr6VH/Y4vQv1bjlPiqeQAAiZY6GF6z/TC4YGbWPTKriu1d2kWBRpvCcIhse+obPbQViobU8yEM9QWnSYtg7/K84nDVCQ8mH+EvQGpJKEkJltXGY3Ow4wb3lA54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711438797; c=relaxed/simple;
	bh=esPNlzpWbLxMQzI1yxZu2zFQjKNKfzX8D+qjmApMNiU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PHCAYRfJAFiWRYvoPoUGKyKiWxl7myGYCKKZ8/jy5EZO6Zk8E/BkFr6qTVEoCHGDc25qw0BCjxR+bm6ZWEt52H/0kf6jsFEDmQQDT5ojO9T1TC6uK69zdoOUhArbKqUAeVefpyEgv5Kyevd0Z4IhkYmG3JfODC9ov0Pv+4d1/9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jCiGPbub; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-6e6ce174d45so3730670b3a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Mar 2024 00:39:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711438795; x=1712043595; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4FNmONmGMNfUWAyGbjVY02MYpPraJ84XZnXoSpBgNIE=;
        b=jCiGPbub/vlTBcEG0jnQejpN1fc10Zs1NVFLp1IHkmUryg1tuaGX4NQtmo9vvj1za6
         Kaxui34bmIyCj6iUgTyAtCLWpxcHr1pNTitCLBafan19R/RY/Xu+ZCIL60xS3+APyzRE
         y9yUv+NaVy+/bxYaOOgzXrX2JNYp3TeDZ4AdakoT0HnaDSxyuM84V+oqiwbaX8ywoUk1
         LXTmNL7jGT4r69cZ9qzezSTI4g5OgcreLPAtqKaT8OBP833za4j9dNPWyEom58cAW/3y
         8/zHYqKrsNKolimh4UHRsodc2nNYecPTzR/vA0CL3AgHLdYq7LnfS2fkc3FFSC4kV1Hm
         DV/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711438795; x=1712043595;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4FNmONmGMNfUWAyGbjVY02MYpPraJ84XZnXoSpBgNIE=;
        b=jdwr+KWRCqoO5UvRJiILIRwX7K9Vj4ZFL0CzSJgs+xkBqDmZq6Fc0Hz0V7YapPnR2o
         BRVf8kmbx/50gGYngjSL8vRMHqnny16Bt1GFtjFye/GRICOy7aX6vrNobgR/cwLSGCkN
         RtjGjvp6BLYK+jp0bi7YALgiz6FfxJ0QccagUNq06oqh10hd09nZhjRHdAu0eJbgAXBZ
         g/KTAHBerUUyZVtLJGIydmKFc5rtaaqnwMmOPIWwMv2ptJsoaY+AK6Y3705G13Cn6qPT
         NRXU0KNXwik5V0HE0iL2659qPwUtla6zheSlp5ZHPDItIk6CSAkBpXdb6Yw4QtulZ6QW
         ou8Q==
X-Forwarded-Encrypted: i=1; AJvYcCWrc2T0F3PZdkgcimufFqCyi3OApHunFTQ6yUStnvfmdFJj5XX+VvLydVBcvAz+RD7qv3YpBNB3cZzDbJ99oC99BqSP43Bpiyr1gQSrXg==
X-Gm-Message-State: AOJu0YxgLqNEr46OZB7ulEkBAW2XvRBhuVS2sc4/4PXAZSICzizRyYJT
	HEdfsRHMYPlQCFcS3Gf3LyrVicjl6XW4XKzYcNpsRoOIj5d96Z1jE2lWAVz5XQ==
X-Google-Smtp-Source: AGHT+IHJlXwZ3IC716MHv8npsQJ6w1dHTImu5xrrXh/rtboJQ6PofKuxB0iLA8zqqLrX+vk2q6DCmw==
X-Received: by 2002:a05:6a21:99a2:b0:1a3:a67f:f3a8 with SMTP id ve34-20020a056a2199a200b001a3a67ff3a8mr9651411pzb.48.1711438794819;
        Tue, 26 Mar 2024 00:39:54 -0700 (PDT)
Received: from thinkpad ([117.207.28.168])
        by smtp.gmail.com with ESMTPSA id d2-20020a170902cec200b001db5ecd115bsm6010635plg.276.2024.03.26.00.39.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Mar 2024 00:39:54 -0700 (PDT)
Date: Tue, 26 Mar 2024 13:09:47 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Md Sadre Alam <quic_mdalam@quicinc.com>,
	Sricharan Ramabadhran <quic_srichara@quicinc.com>,
	linux-mtd@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v2 1/2] mtd: rawnand: qcom: Fix broken erase in
 misc_cmd_type in exec_op
Message-ID: <20240326073947.GA9565@thinkpad>
References: <20240325103053.24408-1-ansuelsmth@gmail.com>
 <20240326072512.GA8436@thinkpad>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240326072512.GA8436@thinkpad>

On Tue, Mar 26, 2024 at 12:55:19PM +0530, Manivannan Sadhasivam wrote:
> On Mon, Mar 25, 2024 at 11:30:47AM +0100, Christian Marangi wrote:
> > misc_cmd_type in exec_op have multiple problems. With commit a82990c8a409
> > ("mtd: rawnand: qcom: Add read/read_start ops in exec_op path") it was
> > reworked and generalized but actually broke the handling of the
> > ERASE_BLOCK command.
> > 
> > Additional logic was added to the erase command cycle without clear
> > explaination causing the erase command to be broken on testing it on
> > a ipq806x nandc.
> > 
> > Fix the erase command by reverting the additional logic and only adding
> > the NAND_DEV0_CFG0 additional call (required for erase command).
> > 
> > Fixes: a82990c8a409 ("mtd: rawnand: qcom: Add read/read_start ops in exec_op path")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> > ---
> > Changes v2:
> > - Split this and rework commit description and title
> > 
> >  drivers/mtd/nand/raw/qcom_nandc.c | 5 ++---
> >  1 file changed, 2 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/mtd/nand/raw/qcom_nandc.c b/drivers/mtd/nand/raw/qcom_nandc.c
> > index b079605c84d3..19d76e345a49 100644
> > --- a/drivers/mtd/nand/raw/qcom_nandc.c
> > +++ b/drivers/mtd/nand/raw/qcom_nandc.c
> > @@ -2830,9 +2830,8 @@ static int qcom_misc_cmd_type_exec(struct nand_chip *chip, const struct nand_sub
> >  	nandc_set_reg(chip, NAND_EXEC_CMD, 1);
> >  
> >  	write_reg_dma(nandc, NAND_FLASH_CMD, instrs, NAND_BAM_NEXT_SGL);
> > -	(q_op.cmd_reg == OP_BLOCK_ERASE) ? write_reg_dma(nandc, NAND_DEV0_CFG0,
> > -	2, NAND_BAM_NEXT_SGL) : read_reg_dma(nandc,
> > -	NAND_FLASH_STATUS, 1, NAND_BAM_NEXT_SGL);
> > +	if (q_op.cmd_reg == OP_BLOCK_ERASE)
> > +		write_reg_dma(nandc, NAND_DEV0_CFG0, 2, NAND_BAM_NEXT_SGL);
> 
> So this only avoids the call to, 'read_reg_dma(nandc, NAND_FLASH_STATUS, 1,
> NAND_BAM_NEXT_SGL)' if q_op.cmd_reg != OP_BLOCK_ERASE. But for q_op.cmd_reg ==
> OP_BLOCK_ERASE, the result is the same.
> 
> I'm wondering how it results in fixing the OP_BLOCK_ERASE command.
> 

Perhaps you are trying to fix the OP_RESET_DEVICE command altogether?

- Mani

-- 
மணிவண்ணன் சதாசிவம்

