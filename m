Return-Path: <linux-arm-msm+bounces-28849-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8342C9555A4
	for <lists+linux-arm-msm@lfdr.de>; Sat, 17 Aug 2024 07:55:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B3CF91C214CE
	for <lists+linux-arm-msm@lfdr.de>; Sat, 17 Aug 2024 05:55:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D87FE84DF1;
	Sat, 17 Aug 2024 05:55:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D0l+LWVQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D994585283;
	Sat, 17 Aug 2024 05:55:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723874117; cv=none; b=bxMdgJRmOQqMa8U2jpcVaAhDG26oSzK+KrmaLxnWmJfGmC1POH4E6u8TkP6OfGB86N2mDewKFgmiKegrpTkNFqiWqXdHk38atP5o53uFnx9vF5FYcwUthGjRmNdDxKg1cSd4EAaUHnWY1StL/oxpNSK7nPW1589HnjAaKNM35Fc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723874117; c=relaxed/simple;
	bh=HKG2pveTsX+z1Xe9DReCbD4Qokg0N7ksaogIoX/ziqk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FDRCz2odJ1WRBKveeNjWJzd6IIY1gmZhrOa0+iyIsRsYaXbjEqJmkQa67OWYg7Ox5R5jBzQaUrC+Tjga3p02j7APT60BYrswKtPHGXuLGwspG88+IrQr8VEgme07Waykmpsd8LHTA29M8E3V7vFQY4lhNE4WLvUY5y4BdAjaEqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D0l+LWVQ; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-2d3b595c18dso2212807a91.0;
        Fri, 16 Aug 2024 22:55:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723874115; x=1724478915; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tcGPNa2OqtrLegopPjqkiD5lC5fpo5SZicIuaeN9D3o=;
        b=D0l+LWVQE9CdwWyC0ny28sWR+v7OpJGI1TvsrvvUnjLJlSMO5O2/nzig2csFu58Lj+
         j6UdwBfDUZHMTU+srn2qRT4RWXUYJFLxuwabul6OTBQJBVEvK9aI+89l5tH4qlYWkrpS
         +ajdPDdij3IDM8pC6QyzlwC4+nUa7N3AEVvUdaeMjTSvfSi355gNWFMe3wOBb/LMPHoz
         iRzzmSV83NWOxnQLtX6DVoahvhvq6VKZl7DrqoEn0KVpYWW+QV4BNPqpmcbkEf5QvZyi
         zwpg7MZS87pqrtSez3UAubLltdEOX7v3xErq/sTGGUful1fSkbEj95CoXnJH45o1AMvO
         LEKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723874115; x=1724478915;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tcGPNa2OqtrLegopPjqkiD5lC5fpo5SZicIuaeN9D3o=;
        b=AC8HQrGIuCl66vH0MrGqiOVVk7gde96UjloTzAJepHqwCzGF7w7qFuhyiJt1Q9uJl5
         x+npcyvs0UIsvcTpp3WPsEJnu0vwvq6tGc1jRnalsyq0a7NwgWxeqNgMJnfTX5pErwLh
         JYsM4XAWYOEQJCLh6LUe20PYxmNp379cxldR4FA+3nubPVL2VK83lvyFhSABZW14O3ap
         bfoOnrxytRNCF3DktS2F3ID8Tn5nltbSXN9n6/bVgL7BzVbXg/W0ue1FfO/v/gHmW4DX
         uJFWiPHhUPXizxu6rDWvFhTpMwrmiNFVLWpJyRw2opM3YdqQw0LH8y+vrbRLfybxbjZL
         FbLw==
X-Forwarded-Encrypted: i=1; AJvYcCWVytJG4XmPzPmwzBhpQJfzIy7a+JHkwIEX1BQeRux1WrFQLVW2rN4OdF8XPFZbWvE7x2+sOcaR5M0HLpkdPen3ZIjs5xeJfJOeLjzFJgKGi6+FcvuJOc+2nscLSGPEWeKkWaXxqbaaafg=
X-Gm-Message-State: AOJu0YxE4BnM2+hzHrIqYNiYGERsVkNrwnRpDdDPpc/nGSmQwee9bjVI
	U1hPkEKUVGxCs3VtbGxaK84LPGS460zz+lc/WqDOrbNmdgoD3apV
X-Google-Smtp-Source: AGHT+IEEwioOC1xEMy2g9xf3Rrr/B/HzHjvzlQGeZZ7FWZdw4oqMAkK/JDXIipPJivoGID6UBn4Iig==
X-Received: by 2002:a17:90a:3ea5:b0:2c2:d590:808e with SMTP id 98e67ed59e1d1-2d3e4579733mr7071507a91.13.1723874115023;
        Fri, 16 Aug 2024 22:55:15 -0700 (PDT)
Received: from thinkpad ([220.158.156.182])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2d3e2e6b2d1sm2978924a91.18.2024.08.16.22.55.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Aug 2024 22:55:14 -0700 (PDT)
Date: Sat, 17 Aug 2024 11:25:08 +0530
From: Manivannan Sadhasivam <manisadhasivam.linux@gmail.com>
To: Bjorn Andersson <quic_bjorande@quicinc.com>
Cc: regressions@lists.linux.dev, Kyoungrul Kim <k831.kim@samsung.com>,
	"James.Bottomley@HansenPartnership.com" <James.Bottomley@hansenpartnership.com>,
	"martin.petersen@oracle.com" <martin.petersen@oracle.com>,
	"bvanassche@acm.org" <bvanassche@acm.org>,
	"Ed.Tsai@mediatek.com" <Ed.Tsai@mediatek.com>,
	Minwoo Im <minwoo.im@samsung.com>,
	"linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH V4] scsi: ufs: core: Check LSDBS cap when !mcq
Message-ID: <20240817055508.iomq7c4wvsn5gvj3@thinkpad>
References: <CGME20240709232520epcms2p8ebdb5c4fccc30a6221390566589bf122@epcms2p8>
 <20240709232520epcms2p8ebdb5c4fccc30a6221390566589bf122@epcms2p8>
 <Zr/XrH1hsp0seP2Q@hu-bjorande-lv.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Zr/XrH1hsp0seP2Q@hu-bjorande-lv.qualcomm.com>

On Fri, Aug 16, 2024 at 03:50:20PM -0700, Bjorn Andersson wrote:
> On Wed, Jul 10, 2024 at 08:25:20AM +0900, Kyoungrul Kim wrote:
> > if the user sets use_mcq_mode to 0, the host will try to activate the
> > lsdb mode unconditionally even when the lsdbs of device hci cap is 1. so
> > it makes timeout cmds and fail to device probing.
> > 
> > To prevent that problem. check the lsdbs cap when mcq is not supported
> > case.
> > 
> > Signed-off-by: k831.kim <k831.kim@samsung.com>
> > ---
> > Changes to v1: Fix wrong bit of lsdb support.
> > Changes to v2: Fix extra space and wrong commit messeage.
> > Changes to v3: Close missing parenthesis and fix grammatical error.
> 
> This causes the probe of the UFSHCD in Qualcomm SM8550 MTP to fail with
> -EINVAL.
> 
> [    6.132937] ufshcd-qcom 1d84000.ufs: Adding to iommu group 4
> [    6.142509] ufshcd-qcom 1d84000.ufs: freq-table-hz property not specified
> [    6.149843] ufshcd-qcom 1d84000.ufs: ufshcd_populate_vreg: Unable to find vccq2-supply regulator, assuming enabled
> [    6.209794] ufshcd-qcom 1d84000.ufs: ufshcd_init: failed to initialize (legacy doorbell mode not supported)
> [    6.226571] ufshcd-qcom 1d84000.ufs: error -EINVAL: Initialization failed with error -22
> [    6.348770] ufshcd-qcom 1d84000.ufs: error -EINVAL: ufshcd_pltfrm_init() failed
> [    6.363203] ufshcd-qcom 1d84000.ufs: probe with driver ufshcd-qcom failed with error -22
> 
> #regzbot introduced: 0c60eb0cc320
> #regzbot title: scsi: ufs: Qualcomm SM8550 MTP UFSHCD probe failing
> 

Fix got merged for v6.11: https://lore.kernel.org/linux-scsi/20240816-ufs-bug-fix-v3-0-e6fe0e18e2a3@linaro.org/

- Mani

-- 
மணிவண்ணன் சதாசிவம்

