Return-Path: <linux-arm-msm+bounces-9491-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id AA482846AFF
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Feb 2024 09:44:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3D619B27465
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Feb 2024 08:44:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 541F563111;
	Fri,  2 Feb 2024 08:42:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xVc5INHk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 599A26216D
	for <linux-arm-msm@vger.kernel.org>; Fri,  2 Feb 2024 08:42:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706863326; cv=none; b=Qbup6SLYfvW6N4Nl0Z/3onthaH4n8PSFmuQiEQzjlMMgPopueLinsEbn/AKm2QKuB9fEwpSbl2KWSlDUQy0UadVGZGG5B8Kz/N4qrikSL5pIf42TYBBhutQdThudgCFDLC1qDAX8pLyRZKNrUSJ0mqN2odPqB4ii5BVILke3/O0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706863326; c=relaxed/simple;
	bh=ZDgYBSdHUqvVtgWwNERWyROBmahpZQM352YbvD82Z2w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eN4sQvuNBZpMld8sHL9iz05VzM6mFZ+rhUMIQaovNz3gWrDoc8akxcO7oqu2zwR0U8hv0i0J/EIRGwij24Os7mcH2y3jhhSeGLIp/l2Ndv+3ufVXYRJCyCaOAHtkdCne6BcgoDbtTSr3EIxGWKgXGZiFbF90xVBs9YGbuluE7gY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xVc5INHk; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-1d51ba18e1bso17151375ad.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 Feb 2024 00:42:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706863323; x=1707468123; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oA9Pz0U+zB8iLdA+DZx7A8mWXGcixcYAfyaOM28M5MA=;
        b=xVc5INHkXghJc/SCsXdXXmh/HUF4b214j83rZpmPChyvS3I0x5mXXAWhhIMG26PdZo
         H9pPbvsKR+ACL+Eewx7Bw1AhMJuueVx/z0E9mEEgM2UMvsXybj/EgRksiwHwripdx9ma
         uspup77M31+3iiIFK61+45D4ue4emC8laOXLQP95Jwrr68GOeIB6791BO/5ocOkopRBC
         BT6Y126q4PTWfmgjT3/3IzLhchX/3OnG/ZCIOcOC49tixDA0jtpjMxksIcH24m2VN+6H
         kOgQTmJMcK8tqT6hDp0Wd3mAL0VfxMXg2gGzZYlBMaBYSdStmMnF7uXwtI1LaMOgmhIc
         4ELQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706863323; x=1707468123;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oA9Pz0U+zB8iLdA+DZx7A8mWXGcixcYAfyaOM28M5MA=;
        b=g2cJGR6AztMDaOcGCy+6sekHfZ2mMhUgU4IG+LGTvvemorLAReCSuzyClLMuc5mKW/
         A60jSymSTWK+2MBwDll0lokBUA3Xxli6cpxf2YWNtG19keXpJlYJl2ljTYbpQnWdPXzZ
         HcHwBOcT06ypLVKRtAkRHlHM/xL/cNnGpJu9Ri0NCdW1ZeLuaBpC+46+7j3d/fbzE5hH
         LDe0sxlDErMKiYHosQizNm8c6kvqZOy+tUyj2O4pbD/c5sLL21v9FdcdvM1zGFVuN0rU
         XjN+62Zn9IDikWn1p0H2vZ7YU4wHNQ3D9YmuWM3r1K+Hu/kMVNv9cAM1O1XbBWitoGjs
         bzWw==
X-Gm-Message-State: AOJu0Yy+0ARY6MM6CXPajd3x+gLLwMOZGpXv7Ek6DU1On5v/4Z8i0pRY
	IQlYaSyYFSYIRJYEyVGcfEKzc4M3Ei3A8l0e84chVNoFn5RaOX8abz1zQWUBgg==
X-Google-Smtp-Source: AGHT+IGjNFKpCQgBo+OS5e/hYX7NUDiUJBBwnBMuf/w5Bw9mgn5cpJPNFXMTL5wo8VwT1mhLsYYROg==
X-Received: by 2002:a17:902:bd97:b0:1d8:d58d:7ea1 with SMTP id q23-20020a170902bd9700b001d8d58d7ea1mr1376090pls.59.1706863323641;
        Fri, 02 Feb 2024 00:42:03 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCWq/9URP6zPVWfFFUuvFYv/ZCeW6HuWTDYwWvOv9TNAZicvX9spBshq8COdLfWC3fFJQIiyOha32SnPF6C35e35Rh0fs9wKXkwDTfSd2AEgYp6HpGsxsoRL0wjtOfO5bFN1ubpxx0ozxCLPoC7ExO/s04oHzRSCqehY/sge7FMer2ayFITkmAowOmytUzEbxLhQYvnc7WOm/rcSXwRe5gVUs0k+Dh9sAIC//kaYvinhlodo0rwLUSVHZ0mzxIhbVTNMNPRoMerkmcZNjRPEVfJOJM2fZIR9fJ2kBwaG1K2Fc5NUiWJfCykeXUair+cJ38Hkhw/JARTjCUEMX3lj
Received: from thinkpad ([120.56.198.122])
        by smtp.gmail.com with ESMTPSA id f7-20020a170902ce8700b001d8f81ecebesm1064741plg.192.2024.02.02.00.41.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Feb 2024 00:42:03 -0800 (PST)
Date: Fri, 2 Feb 2024 14:11:57 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: neil.armstrong@linaro.org
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>,
	Abel Vesa <abel.vesa@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	linux-pci@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] PCI: qcom: Add X1E80100 PCIe support
Message-ID: <20240202084157.GE2961@thinkpad>
References: <20240129-x1e80100-pci-v2-0-a466d10685b6@linaro.org>
 <20240129-x1e80100-pci-v2-2-a466d10685b6@linaro.org>
 <30360d96-4513-40c4-9646-e3ae09121fa7@linaro.org>
 <a0034c34-4af7-4733-93f7-f82f665f36f3@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a0034c34-4af7-4733-93f7-f82f665f36f3@linaro.org>

On Fri, Feb 02, 2024 at 09:13:25AM +0100, neil.armstrong@linaro.org wrote:
> On 01/02/2024 20:20, Konrad Dybcio wrote:
> > On 29.01.2024 12:10, Abel Vesa wrote:
> > > Add the compatible and the driver data for X1E80100.
> > > 
> > > Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> > > ---
> > >   drivers/pci/controller/dwc/pcie-qcom.c | 1 +
> > >   1 file changed, 1 insertion(+)
> > > 
> > > diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
> > > index 10f2d0bb86be..2a6000e457bc 100644
> > > --- a/drivers/pci/controller/dwc/pcie-qcom.c
> > > +++ b/drivers/pci/controller/dwc/pcie-qcom.c
> > > @@ -1642,6 +1642,7 @@ static const struct of_device_id qcom_pcie_match[] = {
> > >   	{ .compatible = "qcom,pcie-sm8450-pcie0", .data = &cfg_1_9_0 },
> > >   	{ .compatible = "qcom,pcie-sm8450-pcie1", .data = &cfg_1_9_0 },
> > >   	{ .compatible = "qcom,pcie-sm8550", .data = &cfg_1_9_0 },
> > > +	{ .compatible = "qcom,pcie-x1e80100", .data = &cfg_1_9_0 },
> > 
> > I swear I'm not delaying everything related to x1 on purpose..
> > 
> > But..
> > 
> > Would a "qcom,pcie-v1.9.0" generic match string be a good idea?
> 
> Yes as fallback, this is why I used qcom,pcie-sm8550 as fallback for SM8650.
> 

Right. Fallback should be used here also.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

