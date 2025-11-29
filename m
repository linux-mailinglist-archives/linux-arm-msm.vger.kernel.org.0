Return-Path: <linux-arm-msm+bounces-83879-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id A7835C94473
	for <lists+linux-arm-msm@lfdr.de>; Sat, 29 Nov 2025 17:51:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 18A594E2F3C
	for <lists+linux-arm-msm@lfdr.de>; Sat, 29 Nov 2025 16:50:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE19E1C701F;
	Sat, 29 Nov 2025 16:50:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vLwxFzdo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A4642AD3D
	for <linux-arm-msm@vger.kernel.org>; Sat, 29 Nov 2025 16:50:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764435031; cv=none; b=hm7MZg+EKFKnLwJM3vqcALeQoxILKit/zr7V5KfEyUXYwQpUG3+uEVoZrhwv/MxA4tgaFE7yDqOPgfhqXxRjwfgsjT2546OM2xEaX78R88N5bkVhhDK+K+hWt3Z5KSqJKgxAH+0aHmMc3eCF3u/RvkAbGRq5eaN1bq2KFQuaeUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764435031; c=relaxed/simple;
	bh=Cn+yNuLXa8lWVWpF6f/eF1X7MDE7Ri0IU5SGShQe0HM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=dHV7I77a4STcd2J3eA0n8Mih49s+eFfBQ89Y5194WAXvtzmiTjXv8McpXnbpdAgOXz8zprI7/+nVt3iYRczhO7peZ5VFvrICknK/XhG0U2is1gCB1aKGkrrE1Ggi1Qigde4O6HRFPsW1THTZdmP8reW9n1Aj6yJi84hU0Y4yCRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vLwxFzdo; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4779d47be12so22109605e9.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 29 Nov 2025 08:50:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764435027; x=1765039827; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+u+kxqq4MMJGawqIDaTzXliKugbB0Ij2lnspVyD3E7E=;
        b=vLwxFzdoqbvrnnOp7dQCuCCA/jIpY/NmTLEuxOZpBnSMusIyCRr3XBkQfP1XNVhS7N
         fQlWflSSsFNTitmUMSejctgCJ1V4SakiYXej7qsulWvcz7uqFfIo2Lvon1qUnrXNeMPE
         7VEYCPsPVvhBuL7noS6/Vz81ycw9Uz7up/N52k/A2Gj/IliS4BvwM4yXdNLNAWqJCu4h
         qKjDaGx6wT76S+xJjBFoeLPNwm+fvMvlGP0ZbMvqPq7GeGA6mYvf5eOvCO03JIJf3bNZ
         rU64fHiLK0z26NFDyIx0ETR5mtcCga/6f5e6BCPxmuPsONLnJzyIHND2aZbzlrh5mH8u
         KFwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764435027; x=1765039827;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+u+kxqq4MMJGawqIDaTzXliKugbB0Ij2lnspVyD3E7E=;
        b=cxRhyjYVnZkedqgYXpZZH5n8HnV9GEGFCUT1dxRlcDyaLUcW0+IPwH827bYZ/NrFkX
         +Ls2mKyAadXxHGperYlufLJF/MZUA7k26sTvBzWytJ6OB/pY8HudA7s3Bu6QXCXYQ3IJ
         whu6DTJe8uU/+GfCORDdqS1qvaElo92Vu99us+G8twO0QKDFj91ATW4ntvf/kycpGfVI
         IbD1lDE2RQ61tyaLj0Rd0Ljp+wDHi3qjiX7f0fAJtbYUMHKH6kmhMdW4lp2Be09F/dK/
         G9FH1Wrzm5S3MniKiknyxFmvTA8aLcC67ZLU1eEFI8fw4e2U4iQcLPBThG8qt8Wzze3z
         QKdQ==
X-Forwarded-Encrypted: i=1; AJvYcCUreNhBELd68pUPaCXo2JWHvTh284EtWSdAlYOS3qpu+RvKatxY2bHTeqmZogsm7ltrzT/nI3lxEJQ5kNNe@vger.kernel.org
X-Gm-Message-State: AOJu0YwktVSkXwV+4GlXH6F3YeHpY17BOYcJeBC4a7V7ZRAJmnaCHSjv
	f7DqL4B4qEGskiFwgjcJlRlCMRhQJjF1gXa70zbA/bvrSpvINCL3pD1SHo4aZXc4rr0=
X-Gm-Gg: ASbGnctSJf96CDLl0O9GB0hUQf1OqC4wTJ3L7ESZTHE43gvxeryeqOrWMr/3IIeMCP5
	u5EFogQgnIvEXA0mqb7kPRDc+NmMP+HfVvdFuFJhbPSNNsCGMwqRmW/KXiIyDs5FtQ0Rxj2cfU1
	koHVvx+dAbAWqU0RG/QKurgxfsgW3iooXqEAzZUptXSmpIVT1/DGpLNbd5trY9xxBqoZab9lV07
	pR6pECgkngBwkKvACZwfvkyzD6306WyRqzZUJqUqBHkrefReO41LDIdueZWa1i2+8K+8YJH+oVx
	hNt+2oqEJx5KGbDIP61NQBIsw9iiH/6I7rxbshC5XkRNHRIh7Z73HnvN7fmRrMKhJCLLdAtaAjE
	bsihgJy9ZyCdtrD75oBEtnRe+shHH0426lGUAzukjXK7E0D0AIC3/7/dSxrJJbIDIpXGX14RWC0
	R1I2xQi2Hy2p/2h1Wv
X-Google-Smtp-Source: AGHT+IGEoZUwPFD59KrJidNkG9F67yymewSdufIMxYqDAzd7rSdFYU/UTCa8BEI6YpP6tuO8Wx01SA==
X-Received: by 2002:a05:600c:46cc:b0:477:7b16:5fb1 with SMTP id 5b1f17b1804b1-477c0174856mr324752135e9.7.1764435026599;
        Sat, 29 Nov 2025 08:50:26 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4791115caa7sm144049695e9.6.2025.11.29.08.50.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Nov 2025 08:50:26 -0800 (PST)
Date: Sat, 29 Nov 2025 19:50:22 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Niklas Cassel <cassel@kernel.org>,
	Jingoo Han <jingoohan1@gmail.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <helgaas@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	FUKAUMI Naoki <naoki@radxa.com>, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] PCI: dwc: Make Link Up IRQ logic handle already powered
 on PCIe switches
Message-ID: <202511290255.uBLXDIG5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251127134318.3655052-2-cassel@kernel.org>

Hi Niklas,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Niklas-Cassel/PCI-dwc-Make-Link-Up-IRQ-logic-handle-already-powered-on-PCIe-switches/20251127-214649
base:   https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git next
patch link:    https://lore.kernel.org/r/20251127134318.3655052-2-cassel%40kernel.org
patch subject: [PATCH] PCI: dwc: Make Link Up IRQ logic handle already powered on PCIe switches
config: x86_64-randconfig-r071-20251128 (https://download.01.org/0day-ci/archive/20251129/202511290255.uBLXDIG5-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202511290255.uBLXDIG5-lkp@intel.com/

smatch warnings:
drivers/pci/controller/dwc/pcie-designware-host.c:737 dw_pcie_host_init() warn: missing error code 'ret'

vim +/ret +737 drivers/pci/controller/dwc/pcie-designware-host.c

59fbab1ae40eb0 drivers/pci/controller/dwc/pcie-designware-host.c Rob Herring               2020-11-05  712  
939fbcd568fd29 drivers/pci/controller/dwc/pcie-designware-host.c Serge Semin               2023-01-13  713  	ret = dw_pcie_setup_rc(pp);
939fbcd568fd29 drivers/pci/controller/dwc/pcie-designware-host.c Serge Semin               2023-01-13  714  	if (ret)
939fbcd568fd29 drivers/pci/controller/dwc/pcie-designware-host.c Serge Semin               2023-01-13  715  		goto err_remove_edma;
939fbcd568fd29 drivers/pci/controller/dwc/pcie-designware-host.c Serge Semin               2023-01-13  716  
c5097b9869a136 drivers/pci/controller/dwc/pcie-designware-host.c Johan Hovold              2023-07-06  717  	if (!dw_pcie_link_up(pci)) {
a37beefbde8802 drivers/pci/controller/dwc/pcie-designware-host.c Serge Semin               2022-06-24  718  		ret = dw_pcie_start_link(pci);
886a9c1347558f drivers/pci/controller/dwc/pcie-designware-host.c Rob Herring               2020-11-05  719  		if (ret)
939fbcd568fd29 drivers/pci/controller/dwc/pcie-designware-host.c Serge Semin               2023-01-13  720  			goto err_remove_edma;
da56a1bfbab551 drivers/pci/controller/dwc/pcie-designware-host.c Ajay Agarwal              2023-04-12  721  	}
886a9c1347558f drivers/pci/controller/dwc/pcie-designware-host.c Rob Herring               2020-11-05  722  
8d3bf19f1b585a drivers/pci/controller/dwc/pcie-designware-host.c Krishna chaitanya chundru 2024-11-23  723  	/*
8d3bf19f1b585a drivers/pci/controller/dwc/pcie-designware-host.c Krishna chaitanya chundru 2024-11-23  724  	 * Note: Skip the link up delay only when a Link Up IRQ is present.
8d3bf19f1b585a drivers/pci/controller/dwc/pcie-designware-host.c Krishna chaitanya chundru 2024-11-23  725  	 * If there is no Link Up IRQ, we should not bypass the delay
8d3bf19f1b585a drivers/pci/controller/dwc/pcie-designware-host.c Krishna chaitanya chundru 2024-11-23  726  	 * because that would require users to manually rescan for devices.
8d3bf19f1b585a drivers/pci/controller/dwc/pcie-designware-host.c Krishna chaitanya chundru 2024-11-23  727  	 */
cd723d3dce14ac drivers/pci/controller/dwc/pcie-designware-host.c Niklas Cassel             2025-11-27  728  	if (!pp->use_linkup_irq) {
c5097b9869a136 drivers/pci/controller/dwc/pcie-designware-host.c Johan Hovold              2023-07-06  729  		/* Ignore errors, the link may come up later */
c5097b9869a136 drivers/pci/controller/dwc/pcie-designware-host.c Johan Hovold              2023-07-06  730  		dw_pcie_wait_for_link(pci);
c5097b9869a136 drivers/pci/controller/dwc/pcie-designware-host.c Johan Hovold              2023-07-06  731  
cd723d3dce14ac drivers/pci/controller/dwc/pcie-designware-host.c Niklas Cassel             2025-11-27  732  		/*
cd723d3dce14ac drivers/pci/controller/dwc/pcie-designware-host.c Niklas Cassel             2025-11-27  733  		 * For platforms with Link Up IRQ, initial scan will be done
cd723d3dce14ac drivers/pci/controller/dwc/pcie-designware-host.c Niklas Cassel             2025-11-27  734  		 * on first Link Up IRQ.
cd723d3dce14ac drivers/pci/controller/dwc/pcie-designware-host.c Niklas Cassel             2025-11-27  735  		 */
cd723d3dce14ac drivers/pci/controller/dwc/pcie-designware-host.c Niklas Cassel             2025-11-27  736  		if (dw_pcie_host_initial_scan(pp))
113fa857b74c94 drivers/pci/controller/dwc/pcie-designware-host.c Serge Semin               2022-06-24 @737  			goto err_stop_link;


	ret = dw_pcie_host_initial_scan(pp);
	if (ret)
		goto err_stop_link;

cd723d3dce14ac drivers/pci/controller/dwc/pcie-designware-host.c Niklas Cassel             2025-11-27  738  	}
4fbfa17f9a0755 drivers/pci/controller/dwc/pcie-designware-host.c Shradha Todi              2025-02-21  739  
feb85d9b1c47ea drivers/pci/dwc/pcie-designware-host.c            Kishon Vijay Abraham I    2017-02-15  740  	return 0;
feb85d9b1c47ea drivers/pci/dwc/pcie-designware-host.c            Kishon Vijay Abraham I    2017-02-15  741  
113fa857b74c94 drivers/pci/controller/dwc/pcie-designware-host.c Serge Semin               2022-06-24  742  err_stop_link:
a37beefbde8802 drivers/pci/controller/dwc/pcie-designware-host.c Serge Semin               2022-06-24  743  	dw_pcie_stop_link(pci);
113fa857b74c94 drivers/pci/controller/dwc/pcie-designware-host.c Serge Semin               2022-06-24  744  
939fbcd568fd29 drivers/pci/controller/dwc/pcie-designware-host.c Serge Semin               2023-01-13  745  err_remove_edma:
939fbcd568fd29 drivers/pci/controller/dwc/pcie-designware-host.c Serge Semin               2023-01-13  746  	dw_pcie_edma_remove(pci);
939fbcd568fd29 drivers/pci/controller/dwc/pcie-designware-host.c Serge Semin               2023-01-13  747  
9e2b5de5604a6f drivers/pci/controller/dwc/pcie-designware-host.c Jisheng Zhang             2019-03-29  748  err_free_msi:
f78f02638af594 drivers/pci/controller/dwc/pcie-designware-host.c Rob Herring               2020-11-05  749  	if (pp->has_msi_ctrl)
9e2b5de5604a6f drivers/pci/controller/dwc/pcie-designware-host.c Jisheng Zhang             2019-03-29  750  		dw_pcie_free_msi(pp);
c6481d51dc65f2 drivers/pci/controller/dwc/pcie-designware-host.c Serge Semin               2022-06-24  751  
c6481d51dc65f2 drivers/pci/controller/dwc/pcie-designware-host.c Serge Semin               2022-06-24  752  err_deinit_host:
aea370b2aec9d3 drivers/pci/controller/dwc/pcie-designware-host.c Yoshihiro Shimoda         2023-12-20  753  	if (pp->ops->deinit)
aea370b2aec9d3 drivers/pci/controller/dwc/pcie-designware-host.c Yoshihiro Shimoda         2023-12-20  754  		pp->ops->deinit(pp);
c6481d51dc65f2 drivers/pci/controller/dwc/pcie-designware-host.c Serge Semin               2022-06-24  755  
f6fd357f7afbeb drivers/pci/controller/dwc/pcie-designware-host.c Krishna Chaitanya Chundru 2025-09-23  756  err_free_ecam:
f6fd357f7afbeb drivers/pci/controller/dwc/pcie-designware-host.c Krishna Chaitanya Chundru 2025-09-23  757  	if (pp->cfg)
f6fd357f7afbeb drivers/pci/controller/dwc/pcie-designware-host.c Krishna Chaitanya Chundru 2025-09-23  758  		pci_ecam_free(pp->cfg);
f6fd357f7afbeb drivers/pci/controller/dwc/pcie-designware-host.c Krishna Chaitanya Chundru 2025-09-23  759  
feb85d9b1c47ea drivers/pci/dwc/pcie-designware-host.c            Kishon Vijay Abraham I    2017-02-15  760  	return ret;
feb85d9b1c47ea drivers/pci/dwc/pcie-designware-host.c            Kishon Vijay Abraham I    2017-02-15  761  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


