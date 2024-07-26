Return-Path: <linux-arm-msm+bounces-27081-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1629B93D29C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jul 2024 13:59:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2F7331C20B2D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jul 2024 11:59:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A10D36D;
	Fri, 26 Jul 2024 11:59:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="T0Fy4lAQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D984179658
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jul 2024 11:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721995147; cv=none; b=HcJW4EavY0BwJfB1oZQJKJJs8mFOOlPoiVwiXzo2Kw63vKfzY1f29ETYRpuSYOKJihfDnut/7a8dRwimk7lY4Y5UL2IdGOrS5t4aFvFYHpmZIF0G3BJ+zy+xYXsu8zgFwwXCBisojPe33/+WIIFbrHKPd3umaK/4ecyNLrCheyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721995147; c=relaxed/simple;
	bh=d9Uvfpm1+olbEQnf22j9NxwOQ6AOvTmVMoe3g2uQjkQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CvNJ8jf4zaFm8kGoxgc2JYJdlR0qyKFKxu0mXs/KX8g6Exb1SqHwI1X8blecvSu9suTSwmogxjb0WzkbD/yPyLi5z7ha0VXxJzM8DOnwVtTs50L2OcJRZpogdBiVCspibf3NL2SBCcHseUeOxWpmkFLshx767Df528/tMpyzSUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=T0Fy4lAQ; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-7a115c427f1so625251a12.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jul 2024 04:59:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721995145; x=1722599945; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nCqhXkOq08VRhr8kdRSoPvARZCdTjzCOkLN6nvvCPow=;
        b=T0Fy4lAQQK48elGKBnMYZrBxqeYt2cOsRaygSpc9+RHDkK9gGH6yfyl2Rk1z6LB5lm
         DG+VZIGjuz64/Q+7hw6hRgjhluI8vmxsDiP+QGqzgFYEq2GfKgBTQ1/MtCbBtxi+eyYO
         b01pAXQRCR4zFmiRgqJxdk5UbCwpGz8vgh+DqQff61W8xmlZ9OkcZwai22oYeYooZKK4
         /andYSIKzjsHWQxtzHZFCM/sV0qnW4ctZBFgmjVsx0SkttPRatkJzEhDjnZInzaFohLX
         vScPOlKNXWLDNePq2BuYr8y4TpoX3H2RwOe2oCSJGRGLz1GwW/x+j6rOF3wT3f//nZ6P
         Ae3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721995145; x=1722599945;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nCqhXkOq08VRhr8kdRSoPvARZCdTjzCOkLN6nvvCPow=;
        b=DtlGhwrgGuUGZR24MBXt0rkrE14Z1ZyMv736Q8z46lz4glYgQq4JJPCs/g+R8WJqwQ
         nvyp43ZKTAtgESty7awAGIALfY11LscX4lL/xtolqljcl1H/9Rcdsee+mjJCsHjG7LTY
         +Sq0H6wwNj8tCABRXi95WkiM+F4UJcGU+hwmKitcNwYJ/8xFPgKgKvr7WT4cFb3JDkZz
         yF3HVBRPWuhXCAcGn+QHdkrIfBizw/i0ayN4cuNiXlexGxwJCfOkQWpDFm7muzCHmGRY
         9Qt0Ad+s9C4HHnapUPjXNZD/OA+Oz+demoOFsxJKSxCUXS6+Hpicw8ul3kZvqhhfx2oC
         XzFw==
X-Forwarded-Encrypted: i=1; AJvYcCUFM6WQMkRS2PHoE7MxAin0eIwht4jn+JNqPBufFeMYZ3DOaD3v5/FDqqEjpjwc3tI9Uzi7v5HEypFQCJJUNtwGeGf+Ucwja9VA6L4hAw==
X-Gm-Message-State: AOJu0YxRbtJxofLXw1f5E4Zfei4rB4oT9KSKEIE03+QrvyVqDHK18Bba
	t1vT1b82Xhwu53qkCI/dEO/PDGVVve129EAXEAs2+VmJYTGA/qG5SfKUqfLSkQ==
X-Google-Smtp-Source: AGHT+IGV4a+dkH6mJm2DjgT8P9LA6fVlC4dy3yiqcdZY6+sD4wOqGT0QDMtCozMzcmIzowYPndTbAA==
X-Received: by 2002:a05:6a20:72ac:b0:1c2:8d16:c684 with SMTP id adf61e73a8af0-1c47b18fa49mr5776244637.21.1721995144742;
        Fri, 26 Jul 2024 04:59:04 -0700 (PDT)
Received: from thinkpad ([2409:40f4:201d:928a:9e8:14a5:7572:42b6])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7a9f836ace5sm2658394a12.34.2024.07.26.04.59.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jul 2024 04:59:04 -0700 (PDT)
Date: Fri, 26 Jul 2024 17:28:58 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Slark Xiao <slark_xiao@163.com>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: Re: Re: [PATCH v2 1/2] bus: mhi: host: pci_generic: Update the
 file path for Foxconn SDX55/SDX72
Message-ID: <20240726115858.GG2628@thinkpad>
References: <20240725022941.65948-1-slark_xiao@163.com>
 <20240725035954.GA2317@thinkpad>
 <6dd00891.8235.190e91ac139.Coremail.slark_xiao@163.com>
 <20240726050051.GA2628@thinkpad>
 <5aa442e3.4d45.190ed9bf7c0.Coremail.slark_xiao@163.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5aa442e3.4d45.190ed9bf7c0.Coremail.slark_xiao@163.com>

On Fri, Jul 26, 2024 at 01:55:40PM +0800, Slark Xiao wrote:
> 
> At 2024-07-26 13:00:51, "Manivannan Sadhasivam" <manivannan.sadhasivam@linaro.org> wrote:
> >On Thu, Jul 25, 2024 at 04:56:03PM +0800, Slark Xiao wrote:
> >> 
> >> At 2024-07-25 11:59:54, "Manivannan Sadhasivam" <manivannan.sadhasivam@linaro.org> wrote:
> >> >On Thu, Jul 25, 2024 at 10:29:40AM +0800, Slark Xiao wrote:
> >> >> To separate the images of Foxconn from other vendors, adding a
> >> >> new foxconn subfolder under qcom/<platform> for edl image path.
> >> >> And delete the fw patch since it's useless for Foxconn devices.
> >> >> 
> >> >> Fixes: bf30a75e6e00 ("bus: mhi: host: Add support for Foxconn SDX72 modems")
> >> >> Signed-off-by: Slark Xiao <slark_xiao@163.com>
> >> >> ---
> >> >> v2: change the folder path architecture
> >> >> ---
> >> >>  drivers/bus/mhi/host/pci_generic.c | 13 +++++--------
> >> >>  1 file changed, 5 insertions(+), 8 deletions(-)
> >> >> 
> >> >> diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
> >> >> index 14a11880bcea..f159a9dd53e7 100644
> >> >> --- a/drivers/bus/mhi/host/pci_generic.c
> >> >> +++ b/drivers/bus/mhi/host/pci_generic.c
> >> >> @@ -433,8 +433,7 @@ static const struct mhi_controller_config modem_foxconn_sdx72_config = {
> >> >>  
> >> >>  static const struct mhi_pci_dev_info mhi_foxconn_sdx55_info = {
> >> >>  	.name = "foxconn-sdx55",
> >> >> -	.fw = "qcom/sdx55m/sbl1.mbn",
> >> >> -	.edl = "qcom/sdx55m/edl.mbn",
> >> >> +	.edl = "qcom/sdx55m/foxconn/prog_firehose_sdx55.mbn",
> >> >
> >> >I think you misunderstood what I suggested in earlier revision. You should add
> >> >the Foxconn specific fw only if it is different from the qcom one. Is it really
> >> >different for all these modems? Otherwise, what is the point of adding them?
> >> >
> >> >- Mani
> >> 
> >> >
> >> Hi Mani,
> >> Yes, all programer files are different with default. We add a sign step for each image
> >> file. That means other vendor's edl image(including Qualcomm) can't be applied for
> >> Foxconn devices. 
> >> 
> >
> >Gotcha. Please include this info in the commit message as people may wonder what
> >the difference between yours and qcom.
> 
> >
> If possible, pelase help me add it into my commit message.
> 

Ok. I can add this while applying.

> 
> >Unrelated question to this patch: Once the EDL is programmed, what are the
> >images that the user has to flash using Firehose protocol? Is that the full SDK
> >or just SBL/APPS image?
> >
> 
> >If so, what is the size of the images?
> 
> 
> This depends on a raw file, let's take SDX65 as an example. The file 
> rawprogram_nand_p4K_b256K.xml contains below items:
> .....
> <erase PAGES_PER_BLOCK="64" SECTOR_SIZE_IN_BYTES="4096" num_partition_sectors="640" start_sector="0"/>
> <program PAGES_PER_BLOCK="64" SECTOR_SIZE_IN_BYTES="4096" filename="xbl.elf.enc" label="sbl" last_sector="639" num_partition_sectors="640" physical_partition_number="0" start_sector="0"/>
> .....
> <erase PAGES_PER_BLOCK="64" SECTOR_SIZE_IN_BYTES="4096" num_partition_sectors="27456" start_sector="16512"/>
>   <program PAGES_PER_BLOCK="64" SECTOR_SIZE_IN_BYTES="4096" filename="NON-HLOS.ubi.enc" label="modem" last_sector="43967" num_partition_sectors="27456" physical_partition_number="0" start_sector="16512"/>
> ...
> 
> 
> This file contains 2 part, "erase" and "program".
> erase will tell the tool to erase the partition from sector x to y.
> And "program" will tell the tool to flash the file into that partion which start from sector m to n.
> 
> 
> So the logical is, full SDK or just one or some partitions are flashed depends on this raw file.
> Normally, full SDK is the main scenario. And the size is about 150MB to 200MB.
> Thanks. 
> 

Okay, thanks. I just wanted to understand what images are getting flashed.

- Mani

> >
> >- Mani
> >
> >> >>  	.config = &modem_foxconn_sdx55_config,
> >> >>  	.bar_num = MHI_PCI_DEFAULT_BAR_NUM,
> >> >>  	.dma_data_width = 32,
> >> >> @@ -444,8 +443,7 @@ static const struct mhi_pci_dev_info mhi_foxconn_sdx55_info = {
> >> >>  
> >> >>  static const struct mhi_pci_dev_info mhi_foxconn_t99w175_info = {
> >> >>  	.name = "foxconn-t99w175",
> >> >> -	.fw = "qcom/sdx55m/sbl1.mbn",
> >> >> -	.edl = "qcom/sdx55m/edl.mbn",
> >> >> +	.edl = "qcom/sdx55m/foxconn/prog_firehose_sdx55.mbn",
> >> >>  	.config = &modem_foxconn_sdx55_config,
> >> >>  	.bar_num = MHI_PCI_DEFAULT_BAR_NUM,
> >> >>  	.dma_data_width = 32,
> >> >> @@ -455,8 +453,7 @@ static const struct mhi_pci_dev_info mhi_foxconn_t99w175_info = {
> >> >>  
> >> >>  static const struct mhi_pci_dev_info mhi_foxconn_dw5930e_info = {
> >> >>  	.name = "foxconn-dw5930e",
> >> >> -	.fw = "qcom/sdx55m/sbl1.mbn",
> >> >> -	.edl = "qcom/sdx55m/edl.mbn",
> >> >> +	.edl = "qcom/sdx55m/foxconn/prog_firehose_sdx55.mbn",
> >> >>  	.config = &modem_foxconn_sdx55_config,
> >> >>  	.bar_num = MHI_PCI_DEFAULT_BAR_NUM,
> >> >>  	.dma_data_width = 32,
> >> >> @@ -502,7 +499,7 @@ static const struct mhi_pci_dev_info mhi_foxconn_dw5932e_info = {
> >> >>  
> >> >>  static const struct mhi_pci_dev_info mhi_foxconn_t99w515_info = {
> >> >>  	.name = "foxconn-t99w515",
> >> >> -	.edl = "fox/sdx72m/edl.mbn",
> >> >> +	.edl = "qcom/sdx72m/foxconn/edl.mbn",
> >> >>  	.edl_trigger = true,
> >> >>  	.config = &modem_foxconn_sdx72_config,
> >> >>  	.bar_num = MHI_PCI_DEFAULT_BAR_NUM,
> >> >> @@ -513,7 +510,7 @@ static const struct mhi_pci_dev_info mhi_foxconn_t99w515_info = {
> >> >>  
> >> >>  static const struct mhi_pci_dev_info mhi_foxconn_dw5934e_info = {
> >> >>  	.name = "foxconn-dw5934e",
> >> >> -	.edl = "fox/sdx72m/edl.mbn",
> >> >> +	.edl = "qcom/sdx72m/foxconn/edl.mbn",
> >> >>  	.edl_trigger = true,
> >> >>  	.config = &modem_foxconn_sdx72_config,
> >> >>  	.bar_num = MHI_PCI_DEFAULT_BAR_NUM,
> >> >> -- 
> >> >> 2.25.1
> >> >> 
> >> >
> >> >-- 
> >> >மணிவண்ணன் சதாசிவம்
> >
> >-- 
> >மணிவண்ணன் சதாசிவம்

-- 
மணிவண்ணன் சதாசிவம்

