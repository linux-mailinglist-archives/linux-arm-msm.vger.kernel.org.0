Return-Path: <linux-arm-msm+bounces-50651-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 05170A56F6A
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Mar 2025 18:44:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E1BEC7ABDEF
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Mar 2025 17:42:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51014243387;
	Fri,  7 Mar 2025 17:40:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xB5cSBqx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 423AC241672
	for <linux-arm-msm@vger.kernel.org>; Fri,  7 Mar 2025 17:40:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741369257; cv=none; b=E0J5+18tIZVdDn+pQIZpkA3yMuJllvH2Jmz2C0XzLXw0apV5lGlIKefppFQjA6x8UJwdpVdhMOUSEnZ6rM4+I3TX7/J9KC5Jtj7MAQTuvuzVq3hJOsNmse/R2oufqfOeYoHEoFASDPoqoJL109KcWQauPgQIeVHVEaA7QlAtzVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741369257; c=relaxed/simple;
	bh=vvsDem0LWEb3rv3KK4bNEQLkDkJSUlyDTuvfqYCUcTQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jTnZAmFf8Hzb7VHz544V3Dj1o2XCuGZpHPzpjGibtTbB/D0U9q+Q2uYBkgyfN3S6Jd/VWn+b/S2JO7L3ExNqnh3KFx/c0nYjFXibWLYMGstRbBDxbBBi2D/ZLRTK8K33eYi3w9tye32RYP41OsFPZIBA2uESWWSuEp03nVy81vc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xB5cSBqx; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-22113560c57so41388505ad.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 Mar 2025 09:40:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741369253; x=1741974053; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YFDw1TpDcZv57gXTEDbqMyPjxYXThMMnlm4QJcP2uvQ=;
        b=xB5cSBqx+JylvcBZkJiZdn0/ORxDg67SEJslJQt+W/FG6QsOmQbVRqyEVXaOZPpFw0
         fsQn77G1sGQe5u/Gaeh1VKmpv/DVnNb0ngVku8uON2nmrtoPZhNiKpy3YiMWdmKhv1gx
         c3PQatB4AKQnmrzoEIha0guIW2FutZO+dWWbaT+smbD0oYAUJ2Xem18Vwp/my9hEo7CY
         cVxU53iKibzHHO6apD4RJ846C4jU7NEh6mrurngLiiRef5l9mw3IwTjkbDlZIeExTZLk
         Mtfe2aoVfhJTx6DJnVKwz2szjNuUEDjr1Ld21OFkD5lnC7l+Upxmp+aiNQHhotBawwCi
         QivQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741369253; x=1741974053;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YFDw1TpDcZv57gXTEDbqMyPjxYXThMMnlm4QJcP2uvQ=;
        b=siFalB6GMaW6qsMlX3YfvEL/7n6SD798S7WsA6eYtuT6n3LWPyReAyvD54XSWnF3lF
         hj4u38ePkDD2T9smXnfqTo1pP/imURrxLrtVxLEa9I/oXwKhs50m41GIzxzWHVIOhhUp
         tI88eKsxQvEIk8ptHb2W72plfGTyXr2kTV4lRjzwPzRomGmdbAJq23FaeE5wHZ3WyHS6
         1TlTI8YjHAaDa6kpY9E8sfJA6mdd3l3iWVpy50vnvb2EmTDQIF9Ph4a0bcmFpqfUzJn6
         qqzGLiJt3COOYaQrLykMsbHc5ft7iX9g3otVJmc/LlQDPDOTj8am93J4xyqUdd0QLW1a
         mbeQ==
X-Forwarded-Encrypted: i=1; AJvYcCWHyiFwFAz+YUUBJeLEn7gFSyYOT8cj1aFaLfNtDbRwHNXqpjCcFbFxRDTTR+b7M4f5uVE7XGjccagrOQXR@vger.kernel.org
X-Gm-Message-State: AOJu0YwNuXSP9TodVa4B4tGvG0XapqEDH4+CMW8MV8eTHF5fq7Mkuxvs
	E4YwCjKUsHfKxpG0vSFhxFWOIP/Af6ew4kY8wrPRrPYQsdPfM2K9uf2yVDN/pQ==
X-Gm-Gg: ASbGncv1vebAYyII6qbCsDwjbwnVImxXcbY0iQ+Mr1WDGn470FRwiDX99j7CJx2IMF4
	9nAqKd3QDFjHRgFBzJeGxuF6pj53sciSj2lB9mqAingwooGFErOSPqpRCATWJsNq6xw5sZpkogg
	rMwkhNII+NkKRPJk3vXCkYRZKxkzkhGYm2Wt+D83qdD6Ot3mpM+qW6+AJAbwY0HxwXOE6B3/Y+e
	hqXnMzK0e5VL3+1Rlbv2hwPoqNG7r+ia0+WkXiR54Sdzui5fa7Za23CTdZPXE45FTqlytzn4Q+Q
	YN4NBW7XZLML6A2b4YLSiKWiwXJF9EJZYV76AauRNlB0yFY+xcE0dUg=
X-Google-Smtp-Source: AGHT+IH2Gm7EH0VzWhkmc1lSsBMkw3yz36z3PAc81n5kU3dgXqc5+Cu/jVWB6qmViZyU3wZuvOYzUA==
X-Received: by 2002:a17:903:98b:b0:223:397f:46be with SMTP id d9443c01a7336-22428ad4a09mr75342445ad.47.1741369253483;
        Fri, 07 Mar 2025 09:40:53 -0800 (PST)
Received: from thinkpad ([120.60.79.235])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-736982077c8sm3646560b3a.10.2025.03.07.09.40.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Mar 2025 09:40:53 -0800 (PST)
Date: Fri, 7 Mar 2025 23:10:45 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: Krishna Chaitanya Chundru <quic_krichai@quicinc.com>,
	cros-qcom-dts-watchers@chromium.org,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Jingoo Han <jingoohan1@gmail.com>, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org, quic_vbadigan@quicinc.com,
	quic_mrana@quicinc.com, quic_vpernami@quicinc.com,
	mmareddy@quicinc.com
Subject: Re: [PATCH v4 4/4] PCI: qcom: Enable ECAM feature
Message-ID: <20250307174045.5r5dj56nmajnhygg@thinkpad>
References: <20250207-ecam_v4-v4-0-94b5d5ec5017@oss.qualcomm.com>
 <20250207-ecam_v4-v4-4-94b5d5ec5017@oss.qualcomm.com>
 <20250210092240.5b67fsdervb2tvxp@thinkpad>
 <5fc8c993-4993-d930-2687-96fdf95dc1cf@oss.qualcomm.com>
 <20250210094709.lih7lhnwjhmvrk7r@thinkpad>
 <149f513f-a68f-8966-4c3a-ed8c7aafb1ab@quicinc.com>
 <20250305182639.ov6yiqplyaymdbpa@thinkpad>
 <263aa955-943d-5bdf-8eb9-74e90d289fb5@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <263aa955-943d-5bdf-8eb9-74e90d289fb5@oss.qualcomm.com>

On Fri, Mar 07, 2025 at 06:44:53AM +0530, Krishna Chaitanya Chundru wrote:
> 
> 
> On 3/5/2025 11:56 PM, Manivannan Sadhasivam wrote:
> > On Mon, Feb 10, 2025 at 03:23:43PM +0530, Krishna Chaitanya Chundru wrote:
> > > 
> > > 
> > > On 2/10/2025 3:17 PM, Manivannan Sadhasivam wrote:
> > > > On Mon, Feb 10, 2025 at 03:04:43PM +0530, Krishna Chaitanya Chundru wrote:
> > > > > 
> > > > > 
> > > > > On 2/10/2025 2:52 PM, Manivannan Sadhasivam wrote:
> > > > > > On Fri, Feb 07, 2025 at 04:58:59AM +0530, Krishna Chaitanya Chundru wrote:
> > > > > > > The ELBI registers falls after the DBI space, PARF_SLV_DBI_ELBI register
> > > > > > > gives us the offset from which ELBI starts. so use this offset and cfg
> > > > > > > win to map these regions instead of doing the ioremap again.
> > > > > > > 
> > > > > > > On root bus, we have only the root port. Any access other than that
> > > > > > > should not go out of the link and should return all F's. Since the iATU
> > > > > > > is configured for the buses which starts after root bus, block the
> > > > > > > transactions starting from function 1 of the root bus to the end of
> > > > > > > the root bus (i.e from dbi_base + 4kb to dbi_base + 1MB) from going
> > > > > > > outside the link through ECAM blocker through PARF registers.
> > > > > > > 
> > > > > > > Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> > > > > > > ---
> > > > > > >     drivers/pci/controller/dwc/pcie-qcom.c | 77 ++++++++++++++++++++++++++++++++--
> > > > > > >     1 file changed, 73 insertions(+), 4 deletions(-)
> > > > > > > 
> > > > > > > diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
> > > > > > > index e4d3366ead1f..84297b308e7e 100644
> > > > > > > --- a/drivers/pci/controller/dwc/pcie-qcom.c
> > > > > > > +++ b/drivers/pci/controller/dwc/pcie-qcom.c
> > > > > > > @@ -52,6 +52,7 @@
> > > > > > >     #define PARF_AXI_MSTR_WR_ADDR_HALT_V2		0x1a8
> > > > > > >     #define PARF_Q2A_FLUSH				0x1ac
> > > > > > >     #define PARF_LTSSM				0x1b0
> > > > > > > +#define PARF_SLV_DBI_ELBI			0x1b4
> > > > > > >     #define PARF_INT_ALL_STATUS			0x224
> > > > > > >     #define PARF_INT_ALL_CLEAR			0x228
> > > > > > >     #define PARF_INT_ALL_MASK			0x22c
> > > > > > > @@ -61,6 +62,17 @@
> > > > > > >     #define PARF_DBI_BASE_ADDR_V2_HI		0x354
> > > > > > >     #define PARF_SLV_ADDR_SPACE_SIZE_V2		0x358
> > > > > > >     #define PARF_SLV_ADDR_SPACE_SIZE_V2_HI		0x35c
> > > > > > > +#define PARF_BLOCK_SLV_AXI_WR_BASE		0x360
> > > > > > > +#define PARF_BLOCK_SLV_AXI_WR_BASE_HI		0x364
> > > > > > > +#define PARF_BLOCK_SLV_AXI_WR_LIMIT		0x368
> > > > > > > +#define PARF_BLOCK_SLV_AXI_WR_LIMIT_HI		0x36c
> > > > > > > +#define PARF_BLOCK_SLV_AXI_RD_BASE		0x370
> > > > > > > +#define PARF_BLOCK_SLV_AXI_RD_BASE_HI		0x374
> > > > > > > +#define PARF_BLOCK_SLV_AXI_RD_LIMIT		0x378
> > > > > > > +#define PARF_BLOCK_SLV_AXI_RD_LIMIT_HI		0x37c
> > > > > > > +#define PARF_ECAM_BASE				0x380
> > > > > > > +#define PARF_ECAM_BASE_HI			0x384
> > > > > > > +
> > > > > > >     #define PARF_NO_SNOOP_OVERIDE			0x3d4
> > > > > > >     #define PARF_ATU_BASE_ADDR			0x634
> > > > > > >     #define PARF_ATU_BASE_ADDR_HI			0x638
> > > > > > > @@ -84,6 +96,7 @@
> > > > > > >     /* PARF_SYS_CTRL register fields */
> > > > > > >     #define MAC_PHY_POWERDOWN_IN_P2_D_MUX_EN	BIT(29)
> > > > > > > +#define PCIE_ECAM_BLOCKER_EN			BIT(26)
> > > > > > >     #define MST_WAKEUP_EN				BIT(13)
> > > > > > >     #define SLV_WAKEUP_EN				BIT(12)
> > > > > > >     #define MSTR_ACLK_CGC_DIS			BIT(10)
> > > > > > > @@ -294,6 +307,44 @@ static void qcom_ep_reset_deassert(struct qcom_pcie *pcie)
> > > > > > >     	usleep_range(PERST_DELAY_US, PERST_DELAY_US + 500);
> > > > > > >     }
> > > > > > > +static void qcom_pci_config_ecam(struct dw_pcie_rp *pp)
> > > > > > > +{
> > > > > > > +	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
> > > > > > > +	struct qcom_pcie *pcie = to_qcom_pcie(pci);
> > > > > > > +	u64 addr, addr_end;
> > > > > > > +	u32 val;
> > > > > > > +
> > > > > > > +	/* Set the ECAM base */
> > > > > > > +	writel_relaxed(lower_32_bits(pci->dbi_phys_addr), pcie->parf + PARF_ECAM_BASE);
> > > > > > > +	writel_relaxed(upper_32_bits(pci->dbi_phys_addr), pcie->parf + PARF_ECAM_BASE_HI);
> > > > > > > +
> > > > > > > +	/*
> > > > > > > +	 * The only device on root bus is the Root Port. Any access other than that
> > > > > > > +	 * should not go out of the link and should return all F's. Since the iATU
> > > > > > > +	 * is configured for the buses which starts after root bus, block the transactions
> > > > > > > +	 * starting from function 1 of the root bus to the end of the root bus (i.e from
> > > > > > > +	 * dbi_base + 4kb to dbi_base + 1MB) from going outside the link.
> > > > > > > +	 */
> > > > > > > +	addr = pci->dbi_phys_addr + SZ_4K;
> > > > > > > +	writel_relaxed(lower_32_bits(addr), pcie->parf + PARF_BLOCK_SLV_AXI_WR_BASE);
> > > > > > > +	writel_relaxed(upper_32_bits(addr), pcie->parf + PARF_BLOCK_SLV_AXI_WR_BASE_HI);
> > > > > > > +
> > > > > > > +	writel_relaxed(lower_32_bits(addr), pcie->parf + PARF_BLOCK_SLV_AXI_RD_BASE);
> > > > > > > +	writel_relaxed(upper_32_bits(addr), pcie->parf + PARF_BLOCK_SLV_AXI_RD_BASE_HI);
> > > > > > > +
> > > > > > > +	addr_end = pci->dbi_phys_addr + SZ_1M - 1;
> > > > > > > +
> > > > > > > +	writel_relaxed(lower_32_bits(addr_end), pcie->parf + PARF_BLOCK_SLV_AXI_WR_LIMIT);
> > > > > > > +	writel_relaxed(upper_32_bits(addr_end), pcie->parf + PARF_BLOCK_SLV_AXI_WR_LIMIT_HI);
> > > > > > > +
> > > > > > > +	writel_relaxed(lower_32_bits(addr_end), pcie->parf + PARF_BLOCK_SLV_AXI_RD_LIMIT);
> > > > > > > +	writel_relaxed(upper_32_bits(addr_end), pcie->parf + PARF_BLOCK_SLV_AXI_RD_LIMIT_HI);
> > > > > > > +
> > > > > > > +	val = readl_relaxed(pcie->parf + PARF_SYS_CTRL);
> > > > > > > +	val |= PCIE_ECAM_BLOCKER_EN;
> > > > > > > +	writel_relaxed(val, pcie->parf + PARF_SYS_CTRL);
> > > > > > > +}
> > > > > > > +
> > > > > > >     static int qcom_pcie_start_link(struct dw_pcie *pci)
> > > > > > >     {
> > > > > > >     	struct qcom_pcie *pcie = to_qcom_pcie(pci);
> > > > > > > @@ -303,6 +354,9 @@ static int qcom_pcie_start_link(struct dw_pcie *pci)
> > > > > > >     		qcom_pcie_common_set_16gt_lane_margining(pci);
> > > > > > >     	}
> > > > > > > +	if (pci->pp.ecam_mode)
> > > > > > > +		qcom_pci_config_ecam(&pci->pp);
> > > > > > > +
> > > > > > >     	/* Enable Link Training state machine */
> > > > > > >     	if (pcie->cfg->ops->ltssm_enable)
> > > > > > >     		pcie->cfg->ops->ltssm_enable(pcie);
> > > > > > > @@ -1233,6 +1287,7 @@ static int qcom_pcie_host_init(struct dw_pcie_rp *pp)
> > > > > > >     {
> > > > > > >     	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
> > > > > > >     	struct qcom_pcie *pcie = to_qcom_pcie(pci);
> > > > > > > +	u16 offset;
> > > > > > >     	int ret;
> > > > > > >     	qcom_ep_reset_assert(pcie);
> > > > > > > @@ -1241,6 +1296,11 @@ static int qcom_pcie_host_init(struct dw_pcie_rp *pp)
> > > > > > >     	if (ret)
> > > > > > >     		return ret;
> > > > > > > +	if (pp->ecam_mode) {
> > > > > > > +		offset = readl(pcie->parf + PARF_SLV_DBI_ELBI);
> > > > > > > +		pcie->elbi = pci->dbi_base + offset;
> > > > > > > +	}
> > > > > > 
> > > > > > If you use the existing 'elbi' register offset defined in DT, you can just rely
> > > > > > on the DWC core to call dw_pcie_ecam_supported() as I mentioned in my comment in
> > > > > > patch 3.
> > > > > >    >> +
> > > > > > >     	ret = phy_set_mode_ext(pcie->phy, PHY_MODE_PCIE, PHY_MODE_PCIE_RC);
> > > > > > >     	if (ret)
> > > > > > >     		goto err_deinit;
> > > > > > > @@ -1615,6 +1675,13 @@ static int qcom_pcie_probe(struct platform_device *pdev)
> > > > > > >     	pci->ops = &dw_pcie_ops;
> > > > > > >     	pp = &pci->pp;
> > > > > > > +	pp->bridge = devm_pci_alloc_host_bridge(dev, 0);
> > > > > > > +	if (!pp->bridge) {
> > > > > > > +		ret = -ENOMEM;
> > > > > > > +		goto err_pm_runtime_put;
> > > > > > > +	}
> > > > > > > +
> > > > > > 
> > > > > > This will also go away.
> > > > > > 
> > > > > Hi Mani,
> > > > > 
> > > > > I get your point but the problem is in ECAM mode the DBI address to maximum
> > > > > of 256 MB will be ioremap by pci_ecam_create(). If we don't skip
> > > > > this ioremap of elbi ioremap in pci_ecam_create because we already
> > > > > iormaped elbi which falls in dbi address to 256 MB region( as we can't
> > > > > remap same region twice). so we need to skip doing ioremap for elbi
> > > > > region.
> > > > > 
> > > > 
> > > > Then obviously, your DT entries are wrong. You cannot define overlapping regions
> > > > on purpose. Can't you leave the ELBI region and start the config region?
> > > > 
> > > > - Mani
> > > ELBI is part of DBI space(present in the first 4kb of the dbi) we can't
> > > relocate ELBI region to different location.
> > > can we keep this elbi region as optional and remove elbi from the
> > > devicetree and binding?
> > > 
> > 
> > Since ELBI is a DWC generic region, you should move the resource get call to
> > dw_pcie_get_resources(). Also, it is an optional region, so you should open code
> > devm_platform_ioremap_resource_byname() to skip devm_ioremap_resource() if
> > platform_get_resource_byname() returns NULL. DT binding should make sure that
> > the DTS has the region specified if required.
> > 
> Hi Mani,
> even though elbi is a dwc region the registers in the elbi are specific
> to the vendors. The ELBI register contents in the qcom might not match
> with the other vendors. So we can skip this adding this in
> dw_pcie_get_resources()
> 

No. I was just asking you to move the devm_platform_ioremap_resource_byname() of
ELBI to dw_pcie_get_resources(), like DBI, iATU. Then controller drivers can use
'dw_pcie::elbi' to access EBI specific registers with their own offset.

Since ELBI is DWC specific, the resource fetch code should belong to the DWC
core. And it will simplify your patch also.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

