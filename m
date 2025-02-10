Return-Path: <linux-arm-msm+bounces-47487-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C2C90A2FB0B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Feb 2025 21:50:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 60296163E45
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Feb 2025 20:50:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47719264633;
	Mon, 10 Feb 2025 20:50:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="guHJ8h9a"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6542A264609;
	Mon, 10 Feb 2025 20:50:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739220610; cv=none; b=f+DiTmHgLQN7HZRiWZhoPMHHbb47BcpEoSDpjHdCWFJ68qssJZprPtNIi54CNoefaxSpVX8ESqlAUE31CrXKBjeYmI5RjqTpCnmC0W5b4dWvpH8OQSG3Dwnt8joHeGsHOQeEDARQLcdaU9iCZzRyBtnAPTCizsvsisgk9ctYQGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739220610; c=relaxed/simple;
	bh=8PdGzdMAw141j5O17SG3txWU1gZMeelmxkXkuHaKQdU=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PKmOHylujxyGZCXa3w0DUJ4Dk/eattt7/dOpv1NB553P/ArV+ClvCLi2uWQSGemDE9Chx7qbYmOZ2P+ok3nXzGgXmz0YSFUg+mV62HKq/D3hoj5vovVG5GbMyQdv+sCuJt92f+/0LxgX5TGZ2TKCzMwx7PQ8uPicGsLALMRNmt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=guHJ8h9a; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-38a25d4b9d4so2535501f8f.0;
        Mon, 10 Feb 2025 12:50:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739220607; x=1739825407; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:subject:cc:to:from:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2dJefyF8Ntih0gd63NWW8Bntajol0MzpM/Fx+CJZc70=;
        b=guHJ8h9a5Ip2Cm4HT3us7CIF+CMtMvBJyzLDwxku9KmAhFzFi00b6zfieaiqFfg1Ix
         AQWYU11Oumxy9Izbcdg9iAyo8S+MT1ct36cYtep8V97rJ9h6tNR51l98ttbkYqp0oIIT
         FWcOIiC+nDkmadWI6oHf/6+d866LCm/HfkN7obroPTa/3D2daobXEJ91+84a2Ne0cxx7
         0r4aWoMeEgH/Rm9EBFVN9ecX3BwDIw59bS77YeACjnwtkgmZc/7QbwDT3BCGBbH079kk
         q8htIM83OeJNMg5FqElsluD7k++/Gf/fiCbev7pdwodz82Np2uj8wFljN/vgtbY43WIe
         nXMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739220607; x=1739825407;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:subject:cc:to:from:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2dJefyF8Ntih0gd63NWW8Bntajol0MzpM/Fx+CJZc70=;
        b=S+u22TlE8BDmZ6qq8leS7Jy97TDR3K+MZ9mPMyTaMs6c0+vsF8++mWZT2i69WtajQs
         HqdSOK0zIg5xxa/q2O6qMDwPP8GkKH+YGZ4ErAqyj7F9Dh1AvclYEOsE5toTFEOxOnFn
         tSMALGcZTFOxb+2vIVlR29jSjp9ezt5lgDxeZ26Es0SgWb67GbKiaCfSnzTYkKLPEAOH
         8RnIEU/9DhpHOheGTAc9ukBcmWkf8OHkVHFXAKOi/bkf2SyNkkseU+6yFKx2pEO73oIk
         JOireXUQErN5X21fRXTE4X6lHIows9mwk3gDpZg6Velqcxq70ZmtJIhcv2GdebwY8W6e
         SDdA==
X-Forwarded-Encrypted: i=1; AJvYcCVefL2Daz+rrwh2I3X4Y+F3f4bwtZVtdAI84euI16fq28cnB/vjgYgLWgRGYl6rhrk4TCFd5GYhz9GbEl5n@vger.kernel.org, AJvYcCW8XBcVlkXsMyP7M8szSVrPjfdtSGZVy3BLlOsyEDIc7dMrpbRDmdVyoBEUTCWORlIZ+KKjdOCu@vger.kernel.org, AJvYcCXOP64VJCeu3XfvxnY+kUin8smQggZX1/Y/rV6zF5DJ6+rE4FKBFB1ylpa5dM7w20OxgJe7gIPLojuuotwA@vger.kernel.org
X-Gm-Message-State: AOJu0YymK6waKpvl0sLpss74o4iApeFRv4N8PmM5YGGt015Z+wndvQqW
	lLrZKslfYWhbyLIQccpbr/HJN9/YWqipHxGaFdjaYCSCCSuZHWkK
X-Gm-Gg: ASbGncstu9naD7CXBVkehvdqKZX8LOJcZRUzTmZD4AQWSoZILjzwQ7/Q5z6TG46s+aT
	ZI379lQysqR2gFhPKuYeK38PmJYLJLh+PYGUShTQ7MM/FL65oEzUz5cOMoho2QxskB+bQi86WD7
	IFCNwQ/FlOQ7KOdGp2NUI/DwxfDYgPAqXEAzdgdOGTUXEzK4RGhzoACMwTbNgDA9siSFCgt/t7q
	KpVxOv13aoYIWHLbNRrl+Dd/mWgdQOVS+qVpPtskx93EozZ5oVWwOulfaqBiwIZnxvnnvR8kQXM
	6qWvrmj4nPCE/iQP0eOWtnhAUfs5EovCSOsp8m7PfUzKLAs=
X-Google-Smtp-Source: AGHT+IFIiQmFF40j4k+DZN1cv4CpJRfjsukU/nNRgBxij1fWcbwCzmkxQC0FA+Nto3thlx1zvIp20g==
X-Received: by 2002:a5d:6da6:0:b0:38d:e0d2:55c6 with SMTP id ffacd0b85a97d-38de0d256bdmr3397519f8f.17.1739220606489;
        Mon, 10 Feb 2025 12:50:06 -0800 (PST)
Received: from Ansuel-XPS. (93-34-91-161.ip49.fastwebnet.it. [93.34.91.161])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dd02e2a90sm9105954f8f.98.2025.02.10.12.50.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 12:50:06 -0800 (PST)
Message-ID: <67aa667e.5d0a0220.10ff3e.24a6@mx.google.com>
X-Google-Original-Message-ID: <Z6pmezDoznGIoXH0@Ansuel-XPS.>
Date: Mon, 10 Feb 2025 21:50:03 +0100
From: Christian Marangi <ansuelsmth@gmail.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Md Sadre Alam <quic_mdalam@quicinc.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	linux-mtd@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org,
	Robert Marko <robimarko@gmail.com>
Subject: Re: [PATCH v2] mtd: rawnand: qcom: fix broken config in
 qcom_param_page_type_exec
References: <20250209140941.16627-1-ansuelsmth@gmail.com>
 <20250210170950.zxgm5hjeb2a4evfn@thinkpad>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250210170950.zxgm5hjeb2a4evfn@thinkpad>

On Mon, Feb 10, 2025 at 10:39:50PM +0530, Manivannan Sadhasivam wrote:
> On Sun, Feb 09, 2025 at 03:09:38PM +0100, Christian Marangi wrote:
> > Fix broken config in qcom_param_page_type_exec caused by copy-paste error
> > from commit 0c08080fd71c ("mtd: rawnand: qcom: use FIELD_PREP and GENMASK")
> > 
> > In qcom_param_page_type_exec the value needs to be set to
> > nandc->regs->cfg0 instead of host->cfg0. This wrong configuration caused
> > the Qcom NANDC driver to malfunction on any device that makes use of it
> > (IPQ806x, IPQ40xx, IPQ807x, IPQ60xx) with the following error:
> > 
> 
> I'm wondering whether the offending commit was really tested or not :(
>

Wellllllll..... It was but it wasn't. The series where this was
introduced was to push the new Qcom QPIC driver driven by a dedicated
SPI controller. That part works and was probably where this was tested.
What was not tested is if these changes affected SNAND driver for other
devices. Saddly it's always difficult to test these changes that affects
lors of devices, in OpenWrt we are working on implementing some kind of testbed
to test images on real devices. (it's currently only an idea and we are
far from having it but it's something I would love to have it so we
could catch these kind of regression faster than getting Issue spammed
with devices getting bricked)

> > [    0.885369] nand: device found, Manufacturer ID: 0x2c, Chip ID: 0xaa
> > [    0.885909] nand: Micron NAND 256MiB 1,8V 8-bit
> > [    0.892499] nand: 256 MiB, SLC, erase size: 128 KiB, page size: 2048, OOB size: 64
> > [    0.896823] nand: ECC (step, strength) = (512, 8) does not fit in OOB
> > [    0.896836] qcom-nandc 79b0000.nand-controller: No valid ECC settings possible
> > [    0.910996] bam-dma-engine 7984000.dma-controller: Cannot free busy channel
> > [    0.918070] qcom-nandc: probe of 79b0000.nand-controller failed with error -28
> > 
> > Restore original configuration fix the problem and makes the driver work
> > again.
> > 
> > Also restore the wrongly dropped cpu_to_le32 to correctly support BE
> > systems.
> > 
> > Cc: stable@vger.kernel.org
> > Fixes: 0c08080fd71c ("mtd: rawnand: qcom: use FIELD_PREP and GENMASK")
> > Tested-by: Robert Marko <robimarko@gmail.com> # IPQ8074 and IPQ6018
> > Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> 
> Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> 
> Thanks for the fix!
> 
> - Mani
> 
> > ---
> > Changes v2:
> > - Fix smatch warning (add missing cpu_to_le32 that was also dropped
> >   from the FIELD_PREP patch)
> > 
> >  drivers/mtd/nand/raw/qcom_nandc.c | 24 ++++++++++++------------
> >  1 file changed, 12 insertions(+), 12 deletions(-)
> > 
> > diff --git a/drivers/mtd/nand/raw/qcom_nandc.c b/drivers/mtd/nand/raw/qcom_nandc.c
> > index d2d2aeee42a7..6720b547892b 100644
> > --- a/drivers/mtd/nand/raw/qcom_nandc.c
> > +++ b/drivers/mtd/nand/raw/qcom_nandc.c
> > @@ -1881,18 +1881,18 @@ static int qcom_param_page_type_exec(struct nand_chip *chip,  const struct nand_
> >  	nandc->regs->addr0 = 0;
> >  	nandc->regs->addr1 = 0;
> >  
> > -	host->cfg0 = FIELD_PREP(CW_PER_PAGE_MASK, 0) |
> > -		     FIELD_PREP(UD_SIZE_BYTES_MASK, 512) |
> > -		     FIELD_PREP(NUM_ADDR_CYCLES_MASK, 5) |
> > -		     FIELD_PREP(SPARE_SIZE_BYTES_MASK, 0);
> > -
> > -	host->cfg1 = FIELD_PREP(NAND_RECOVERY_CYCLES_MASK, 7) |
> > -		     FIELD_PREP(BAD_BLOCK_BYTE_NUM_MASK, 17) |
> > -		     FIELD_PREP(CS_ACTIVE_BSY, 0) |
> > -		     FIELD_PREP(BAD_BLOCK_IN_SPARE_AREA, 1) |
> > -		     FIELD_PREP(WR_RD_BSY_GAP_MASK, 2) |
> > -		     FIELD_PREP(WIDE_FLASH, 0) |
> > -		     FIELD_PREP(DEV0_CFG1_ECC_DISABLE, 1);
> > +	nandc->regs->cfg0 = cpu_to_le32(FIELD_PREP(CW_PER_PAGE_MASK, 0) |
> > +					FIELD_PREP(UD_SIZE_BYTES_MASK, 512) |
> > +					FIELD_PREP(NUM_ADDR_CYCLES_MASK, 5) |
> > +					FIELD_PREP(SPARE_SIZE_BYTES_MASK, 0));
> > +
> > +	nandc->regs->cfg1 = cpu_to_le32(FIELD_PREP(NAND_RECOVERY_CYCLES_MASK, 7) |
> > +					FIELD_PREP(BAD_BLOCK_BYTE_NUM_MASK, 17) |
> > +					FIELD_PREP(CS_ACTIVE_BSY, 0) |
> > +					FIELD_PREP(BAD_BLOCK_IN_SPARE_AREA, 1) |
> > +					FIELD_PREP(WR_RD_BSY_GAP_MASK, 2) |
> > +					FIELD_PREP(WIDE_FLASH, 0) |
> > +					FIELD_PREP(DEV0_CFG1_ECC_DISABLE, 1));
> >  
> >  	if (!nandc->props->qpic_version2)
> >  		nandc->regs->ecc_buf_cfg = cpu_to_le32(ECC_CFG_ECC_DISABLE);
> > -- 
> > 2.47.1
> > 
> 
> -- 
> மணிவண்ணன் சதாசிவம்

-- 
	Ansuel

