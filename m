Return-Path: <linux-arm-msm+bounces-16290-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E0A1897181
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Apr 2024 15:48:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 770E11F218F1
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Apr 2024 13:48:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0F77148824;
	Wed,  3 Apr 2024 13:48:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SDtq65k/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E493014830F
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Apr 2024 13:48:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712152112; cv=none; b=We8vl9nA3E0yiqMm8CdkcVvu20EMuKIqaZmZrnyakX35xMMfuC1vV2oOcJbNp5zrF21y/YsX18piu281AJkUZpDD37rcanex32IuJyS4OQGPUk8tk+WrA9DgdnJUpP/0VOCw184oUeMROcgCDSv4PHcHh8H0iCfUu9Tpakm28B8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712152112; c=relaxed/simple;
	bh=fvKLwKU3KWCORD/8PD/VwUpCx2RAkGiPOHgcgK0dHSs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ifhe4lG+8zAC2ShjxNAHDwdPD5fJj6kwVRpEiIEbevuFJrEnSAum3Dy/6/bDawHq0/30r6riGsdh947P14pZtqihXRK5s3JDwAmuZh4qQ+b6ilUWbsfdAlshp+355b/8LZBLmbjX+LmsKKIoofjJwoJdqmGlUXZ6wjd+XLODa80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SDtq65k/; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-1e27fadbbe1so13352475ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Apr 2024 06:48:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712152110; x=1712756910; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7b50vJkoLiWoH+ssMmq08Gs/zjVCDhawPZcPztNxgJk=;
        b=SDtq65k/8Qr5eQv/BZ5PrgHkGEwpERgIvEA4T7snlXkn1SNi/Y5pNtXye+I38P8MQv
         PCBjY0BFxUlyzV7MxZQPvJb+4nZsMIqfWavNr4cn1SxVVFR7VIfxbc8aB/mMcNUE/6Q5
         5CBdykVkzgL+CHR5GJM2tPVOL2XKDlOJmblHY8tSoWPNMT2fOkzy2xU1InLLzrxC8q4o
         mkn6zoQTCiKPbyTPQrn+0p9piecZSxFRdMgm3Wk3cN5mz06wSebcJFhe/5Eb7YNkUB3t
         gFuYTY8MzdfP27+/gbuCcwmOxq4lWxRkYispo3Ura2Kvn6zXE7Rt0gg8qP95gmpGFxzK
         1byg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712152110; x=1712756910;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7b50vJkoLiWoH+ssMmq08Gs/zjVCDhawPZcPztNxgJk=;
        b=B+JmXVbCwcYpdQVmtZuqtC1N6ChhPg4/uhhZN6wnvbzlBMYP7FPyX45YMfx5wAF6wb
         5/ou2ZfhNXSiT56GLSH2ZZDKgDYnNit0DeJCfLcjruhw8vh3jfmPVENdbBKNnrwwruYA
         /gE8kcG1ehjccA9uQ4aB4/9lJX+aNL6josvngqRjURyEPW2xGKkiEN6zfJutbgSSMfEM
         RYKafSzrYrWB3Mi1Tka2u0ilD2Hb+DZCCMDqYp5sXYbPuyzseI5Z2QtO364b95DANo0n
         ySvFkARiMAPl1SHR4lHvUI/c64w8PMPRNps59nOLpJDohiimVM0MMSwVusVF0aFJi5Br
         B3eA==
X-Forwarded-Encrypted: i=1; AJvYcCWJUmGzJBzJvz1ge8laP1CJkEwkO2suLU+2bDiNB3FKZRi0nuGZYJfnLKyR4fq9acmP7Cpshq26eGLKV8rtSdALoFdEtQAbifjiVfCtfg==
X-Gm-Message-State: AOJu0YzxA4uQtjaE3UqJm7lANWdG26oEAe0d5lZHRIzZ0DALjzLdMn3T
	+mZDNQz5n/PUo/0KzQQaejxt77+NfZYq/AXWPpOCziX/ywknNS4qeMlDABqVQA==
X-Google-Smtp-Source: AGHT+IGXV+jQUuyUhwPLCje+0fj8XIZ3KQtQiZTK53j+7cd8QBLHXxtfW6qNqfI4owlQNalec+sXsg==
X-Received: by 2002:a17:902:e84c:b0:1e0:9ee1:d4cf with SMTP id t12-20020a170902e84c00b001e09ee1d4cfmr15834926plg.41.1712152110147;
        Wed, 03 Apr 2024 06:48:30 -0700 (PDT)
Received: from thinkpad ([103.28.246.48])
        by smtp.gmail.com with ESMTPSA id d5-20020a170902c18500b001dddce2291esm13281068pld.31.2024.04.03.06.48.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Apr 2024 06:48:29 -0700 (PDT)
Date: Wed, 3 Apr 2024 19:18:25 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Niklas Cassel <cassel@kernel.org>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Jingoo Han <jingoohan1@gmail.com>, linux-pci@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	mhi@lists.linux.dev, linux-tegra@vger.kernel.org
Subject: Re: [PATCH v2 00/10] PCI: endpoint: Make host reboot handling more
 robust
Message-ID: <20240403134825.GM25309@thinkpad>
References: <20240401-pci-epf-rework-v2-0-970dbe90b99d@linaro.org>
 <ZgvSrLpvChG4jqQl@ryzen>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZgvSrLpvChG4jqQl@ryzen>

On Tue, Apr 02, 2024 at 11:41:00AM +0200, Niklas Cassel wrote:
> On Mon, Apr 01, 2024 at 09:20:26PM +0530, Manivannan Sadhasivam wrote:
> > Hello,
> > 
> > This is the follow up series of [1], to improve the handling of host reboot in
> > the endpoint subsystem. This involves refining the PERST# and Link Down event
> > handling in both the controller and function drivers.
> > 
> > Testing
> > =======
> > 
> > This series is tested on Qcom SM8450 based development board with both MHI_EPF
> > and EPF_TEST function drivers.
> > 
> > Dependency
> > ==========
> > 
> > This series depends on [1] and [2].
> > 
> > - Mani
> 
> Hello Mani,
> 
> > [1] https://lore.kernel.org/linux-pci/20240314-pci-dbi-rework-v10-0-14a45c5a938e@linaro.org/
> > [2] https://lore.kernel.org/linux-pci/20240320113157.322695-1-cassel@kernel.org/
> 
> AFAICT both these series [1] (DBI rework v12, not v10) and [2] are fully
> reviewed and seem to be ready to go.
> 
> Considering that we have patches depending on [1] and [2],
> namely the series in $subject, but also:
> https://lore.kernel.org/linux-pci/20240330041928.1555578-1-dlemoal@kernel.org/T/#t
> 
> I think it would be a good idea if you could apply [1] and [2] to the
> pci/endpoint branch.
> 

Unfortunately, I cannot merge the patches outside 'pci/endpoint' even though
these are related to the PCI Endpoint subsystem. But I have delegated these 2
series to Krzysztof, so hopefully he'll apply it soon.

- Mani

> (It is not easy for people to know that they will need to rebase their work on
> these (fully reviewed) series, when they have not been applied.)
> 
> 
> Kind regards,
> Niklas
> 
> 
> > 
> > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > ---
> > Changes in v2:
> > - Dropped the {start/stop}_link rework patches
> > - Incorporated comments from Niklas
> > - Collected review tags
> > - Rebased on top of v6.9-rc1 and https://lore.kernel.org/linux-pci/20240320113157.322695-1-cassel@kernel.org/
> > - Link to v1: https://lore.kernel.org/r/20240314-pci-epf-rework-v1-0-6134e6c1d491@linaro.org
> > 
> > ---
> > Manivannan Sadhasivam (10):
> >       PCI: qcom-ep: Disable resources unconditionally during PERST# assert
> >       PCI: endpoint: Decouple EPC and PCIe bus specific events
> >       PCI: endpoint: Rename core_init() callback in 'struct pci_epc_event_ops' to init()
> >       PCI: epf-test: Refactor pci_epf_test_unbind() function
> >       PCI: epf-{mhi/test}: Move DMA initialization to EPC init callback
> >       PCI: endpoint: Introduce EPC 'deinit' event and notify the EPF drivers
> >       PCI: dwc: ep: Add a generic dw_pcie_ep_linkdown() API to handle Link Down event
> >       PCI: qcom-ep: Use the generic dw_pcie_ep_linkdown() API to handle Link Down event
> >       PCI: epf-test: Handle Link Down event
> >       PCI: qcom: Implement shutdown() callback to properly reset the endpoint devices
> > 
> >  drivers/pci/controller/dwc/pcie-designware-ep.c |  99 ++++++++++++++---------
> >  drivers/pci/controller/dwc/pcie-designware.h    |   5 ++
> >  drivers/pci/controller/dwc/pcie-qcom-ep.c       |   9 +--
> >  drivers/pci/controller/dwc/pcie-qcom.c          |   8 ++
> >  drivers/pci/controller/dwc/pcie-tegra194.c      |   1 +
> >  drivers/pci/endpoint/functions/pci-epf-mhi.c    |  47 ++++++++---
> >  drivers/pci/endpoint/functions/pci-epf-test.c   | 103 +++++++++++++++++-------
> >  drivers/pci/endpoint/pci-epc-core.c             |  53 ++++++++----
> >  include/linux/pci-epc.h                         |   1 +
> >  include/linux/pci-epf.h                         |  27 +++++--
> >  10 files changed, 248 insertions(+), 105 deletions(-)
> > ---
> > base-commit: e6377605ca734126533a0f8e4de2b4bac881f076
> > change-id: 20240314-pci-epf-rework-a6e65b103a79
> > 
> > Best regards,
> > -- 
> > Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > 

-- 
மணிவண்ணன் சதாசிவம்

