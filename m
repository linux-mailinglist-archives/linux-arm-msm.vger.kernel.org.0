Return-Path: <linux-arm-msm+bounces-26962-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 635B993B267
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jul 2024 16:10:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0733A281F41
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jul 2024 14:10:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0069158A26;
	Wed, 24 Jul 2024 14:10:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="c4gTwJPW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 341F3EEAB
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jul 2024 14:10:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721830217; cv=none; b=SkC80dCv3RehZD+if7gihMFgAfUY5GESB+DusndQwgvhtNEmOZ2vJx+z0rKQoz/eIZRANMXQtFgoutczCpvyWOIsKCMg02I2ME8hU3MNTNn7/17nbYf0b/o9+MPBYqeoQNFBbCJIG4H7ZfXPqTXq6lTK3OJ8uN+wPRO4tFepaVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721830217; c=relaxed/simple;
	bh=bQ66+SsmOkp4FfJAE3qwpS9H2kE3nhkswugvFsE26zU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TA3Elw/AEsqBm0lMVYCS9tSrATfU+wykKyLxEaJdsoxtTpTHSZMgGt3q9OxTCMugnvmRgyoA6Kkn9B76WmZffH51HqlGR4A+xkhjcSdpfwrm/Ychyblrz+q62HK4T0OOhbhn9WDAJAmFadAYxrRQlkFYNLGjF8EU1/d7LnVM5ng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=c4gTwJPW; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-1fa9ecfb321so14502795ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jul 2024 07:10:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721830215; x=1722435015; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hvjqD7swXLIXWuSmMXHVgPpzmpB1cUWaSgkw1M36cKs=;
        b=c4gTwJPWymuuKecIwgPz3AuZEykTZkYGZnIoZExEOJRb6SEmey0Tii9SpHxNrLpwl3
         hsFv5OVeAtxKfox9bPplQUA8aHkgKvpsh62Q7VV3/CNtViuatztdhWJfGjGHQ/yHeFJo
         0HX6OosEbTbSPeQVwz7UUhqPjPfhaFL7uWf2s4mGRRuz1mgBB9H4oPNP46uH7dj2+uhT
         ronJCbNNK+gvFoKXTKSAco5SnBqHuKbiTn8kMZXfxr08jk2braE0mxrx4Z385VU5CfrN
         rbqB2SNqiJn/qik8yOitk0w/1p+Y4kuPjxoHvcm/4ZDzTM6LueFlmod9FDPFtzcGlvxC
         ZyNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721830215; x=1722435015;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hvjqD7swXLIXWuSmMXHVgPpzmpB1cUWaSgkw1M36cKs=;
        b=V1jlq8O+gvp6wHjPwwRymCn0Q54NfX6TJCElmvCRWwHoPKwasPPNJvJU4q5F2WRcKS
         XoktzPtfQAvuaeRi70kgB/hbiYqI53V2/hp8AAlbINnbDpF4h/e7+ctFxEbt3ck4qkxr
         bhvd09H+1OFu8O6DvFkQKsIB9L1SAWUg/9Dx9cwL2lipaKaaZOVGt2gjr9lqxfDvucKn
         w4amOVrXD8tosCidYKfT9JyvaY8hrzvqzeWGC5Q6K+ZpVQg4pXYjaeU7sbFe6M3oFQf8
         k4T7x/0YDotELfGpM/y0uGNGoVYfSRxCiXZcLKY/152b+3KQpQJRtC3NOd8kdsA5DTPD
         yPsA==
X-Forwarded-Encrypted: i=1; AJvYcCU2sOJkJRnKvzCUgsr5YUSd4HC7V7KCtlS3ljgHRzNMsfJiMEAn811ARdeDKB3EokIim2BhonWarEqX2SrgCkGmNfkIUF6dQRutgIV9Gw==
X-Gm-Message-State: AOJu0YyTLLHwv2nd12f+YZlvBH8iqOJDd8gkq044lWhEshscVLzyvDsR
	nxZ6C8IOLbiVOuW6JPuec9CBq3f5HYcNLcUt85VmMeEb7eDwvH7jWEYVNxnuMQ==
X-Google-Smtp-Source: AGHT+IEoUP6NUSEW4jgaZi/xERIdHEdgC0MhnYneK7cZJ4vc3A7QarO7M6AJ9jWlyTlwGFhNHH9trQ==
X-Received: by 2002:a17:902:8549:b0:1fd:6d6d:68e4 with SMTP id d9443c01a7336-1fdd559aef0mr21243895ad.57.1721830215494;
        Wed, 24 Jul 2024 07:10:15 -0700 (PDT)
Received: from thinkpad ([103.244.168.26])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fd6f31d2bbsm94453065ad.132.2024.07.24.07.10.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jul 2024 07:10:15 -0700 (PDT)
Date: Wed, 24 Jul 2024 19:40:11 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Prudhvi Yarlagadda <quic_pyarlaga@quicinc.com>
Cc: jingoohan1@gmail.com, lpieralisi@kernel.org, kw@linux.com,
	robh@kernel.org, bhelgaas@google.com, linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	quic_mrana@quicinc.com
Subject: Re: [PATCH v3 2/2] PCI: qcom: Avoid DBI and ATU register space
 mirror to BAR/MMIO region
Message-ID: <20240724141011.GF3349@thinkpad>
References: <20240724022719.2868490-1-quic_pyarlaga@quicinc.com>
 <20240724022719.2868490-3-quic_pyarlaga@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240724022719.2868490-3-quic_pyarlaga@quicinc.com>

Subject:

PCI: qcom: Disable mirroring of DBI and iATU register space in BAR/MMIO region

On Tue, Jul 23, 2024 at 07:27:19PM -0700, Prudhvi Yarlagadda wrote:
> PARF hardware block which is a wrapper on top of DWC PCIe controller
> mirrors the DBI and ATU register space. It uses PARF_SLV_ADDR_SPACE_SIZE
> register to get the size of the memory block to be mirrored and uses
> PARF_DBI_BASE_ADDR, PARF_ATU_BASE_ADDR registers to determine the base
> address of DBI and ATU space inside the memory block that is being
> mirrored.
> 
> When a memory region which is located above the SLV_ADDR_SPACE_SIZE
> boundary is used for BAR region then there could be an overlap of DBI and
> ATU address space that is getting mirrored and the BAR region. This
> results in DBI and ATU address space contents getting updated when a PCIe
> function driver tries updating the BAR/MMIO memory region. Reference
> memory map of the PCIe memory region with DBI and ATU address space
> overlapping BAR region is as below.
> 
>                         |---------------|
>                         |               |
>                         |               |
>         ------- --------|---------------|
>            |       |    |---------------|
>            |       |    |       DBI     |
>            |       |    |---------------|---->DBI_BASE_ADDR
>            |       |    |               |
>            |       |    |               |
>            |    PCIe    |               |---->2*SLV_ADDR_SPACE_SIZE
>            |    BAR/MMIO|---------------|
>            |    Region  |       ATU     |
>            |       |    |---------------|---->ATU_BASE_ADDR
>            |       |    |               |
>         PCIe       |    |---------------|
>         Memory     |    |       DBI     |
>         Region     |    |---------------|---->DBI_BASE_ADDR
>            |       |    |               |
>            |    --------|               |
>            |            |               |---->SLV_ADDR_SPACE_SIZE
>            |            |---------------|
>            |            |       ATU     |
>            |            |---------------|---->ATU_BASE_ADDR
>            |            |               |
>            |            |---------------|
>            |            |       DBI     |
>            |            |---------------|---->DBI_BASE_ADDR
>            |            |               |
>            |            |               |
>         ----------------|---------------|
>                         |               |
>                         |               |
>                         |               |
>                         |---------------|
> 
> Currently memory region beyond the SLV_ADDR_SPACE_SIZE boundary is not
> used for BAR region which is why the above mentioned issue is not
> encountered. This issue is discovered as part of internal testing when we
> tried moving the BAR region beyond the SLV_ADDR_SPACE_SIZE boundary. Hence
> we are trying to fix this.
> 
> As PARF hardware block mirrors DBI and ATU register space after every
> PARF_SLV_ADDR_SPACE_SIZE (default 0x1000000) boundary multiple, write
> U32_MAX (all 0xFF's) to PARF_SLV_ADDR_SPACE_SIZE register to avoid
> mirroring DBI and ATU to BAR/MMIO region. Write the physical base address
> of DBI and ATU register blocks to PARF_DBI_BASE_ADDR (default 0x0) and
> PARF_ATU_BASE_ADDR (default 0x1000) respectively to make sure DBI and ATU
> blocks are at expected memory locations.
> 
> The register offsets PARF_DBI_BASE_ADDR_V2, PARF_SLV_ADDR_SPACE_SIZE_V2
> and PARF_ATU_BASE_ADDR are applicable for platforms that use PARF

There is no 'PARF Qcom IP', just 'Qcom IP'. Here and below.

> Qcom IP rev 1.9.0, 2.7.0 and 2.9.0. PARF_DBI_BASE_ADDR_V2 and
> PARF_SLV_ADDR_SPACE_SIZE_V2 are applicable for PARF Qcom IP rev 2.3.3.
> PARF_DBI_BASE_ADDR and PARF_SLV_ADDR_SPACE_SIZE are applicable for PARF
> Qcom IP rev 1.0.0, 2.3.2 and 2.4.0. Updating the init()/post_init()

Use imperative tone in commit message. s/Updating/Update

> functions of the respective PARF versions to program applicable
> PARF_DBI_BASE_ADDR, PARF_SLV_ADDR_SPACE_SIZE and PARF_ATU_BASE_ADDR
> register offsets. And remove the unused SLV_ADDR_SPACE_SZ macro.
> 
> Signed-off-by: Prudhvi Yarlagadda <quic_pyarlaga@quicinc.com>
> Reviewed-by: Mayank Rana <quic_mrana@quicinc.com>
> ---
>  drivers/pci/controller/dwc/pcie-qcom.c | 62 +++++++++++++++++++-------
>  1 file changed, 45 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
> index 0180edf3310e..6976efb8e2f0 100644
> --- a/drivers/pci/controller/dwc/pcie-qcom.c
> +++ b/drivers/pci/controller/dwc/pcie-qcom.c
> @@ -45,6 +45,7 @@
>  #define PARF_PHY_REFCLK				0x4c
>  #define PARF_CONFIG_BITS			0x50
>  #define PARF_DBI_BASE_ADDR			0x168
> +#define PARF_SLV_ADDR_SPACE_SIZE		0x16C

Use lowercase for hex.

Rest LGTM! With above mentioned changes,

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

- Mani

-- 
மணிவண்ணன் சதாசிவம்

