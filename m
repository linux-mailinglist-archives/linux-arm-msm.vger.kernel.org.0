Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4DAA227FE9C
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Oct 2020 13:46:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731936AbgJALqc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 1 Oct 2020 07:46:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32854 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731767AbgJALqc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 1 Oct 2020 07:46:32 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E9B3C0613E2
        for <linux-arm-msm@vger.kernel.org>; Thu,  1 Oct 2020 04:46:32 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id d6so4226666pfn.9
        for <linux-arm-msm@vger.kernel.org>; Thu, 01 Oct 2020 04:46:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Rnni/Cv+bQVQlSIzLD2ItMQfmr811sjupc4SJVMgYT4=;
        b=h4x2dSm9xB03i9BrBBYUdglp+hnHS11/GMAKzhfsa22ngeWuyIxprjf0s1nq1YK1sq
         mpX/C4RrV/9tP0GGcbSzEaYzOUkcF1pw28cPnY/barzhlWV8geU0q2Qm6Nim+sCc/al+
         u8Ox3O01ikON0e/V/h3e3v2ddeNmwER1h7hyBJ8w1byF2/QCzF2OrKcRvGfwRiuHh0ed
         TainMiIQyOqqLgBYsi8TGXVEW8BDWwW3HVyiP+slhyUUEmcENgou+n+P/KRwohJZWSd1
         j6dv63o5mNLwbUAlNmIGHhP+tAAv4tFNVfZ25O6oJY3hfpoC3wclxTVt8VbdAvyQC7Sw
         Zztw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Rnni/Cv+bQVQlSIzLD2ItMQfmr811sjupc4SJVMgYT4=;
        b=qBHz8xHSPVWHZ4L7qfB1nwBk0Y93cuehNbupVBtmbPwwKaF8oHXVFTW7asPqaToNJA
         e9lAJwZBnx9oDApapRiWaU27cuYeqH/zuRRiFIbgafbdHLufCgY1avczltXi/x8nrNEc
         DklbYfaHrLt9W0+7McdBrQIa5jW2SXZL80ZYiQu3sc5SaytDj9yc2Zk0UJpQLe279J62
         cXal8bf/a4sEseMHWr7CWa07B732EoVy6hj+0376zM8LeuiY+cNO4WtuEt+DdCPMX1EN
         4DnL31ZtEsKzPN/OIe0Ayg/J1Rbr1VX3tLAZzMe43EITcR6tBqGUrgWzO7vZTd7/q90w
         B2SA==
X-Gm-Message-State: AOAM532roYIQ/REXMOWU5432LfHXW2e0Pd+YL92DKgzblNFKsjwOu/nS
        JjRrTitqibC00yohDmymkTan
X-Google-Smtp-Source: ABdhPJxguKQqngkdRbxl7frvbumBZvaSZQE16mQOYdDDvdzboLLPSRdsN3CxrUX97jXWhSgIzmsUPA==
X-Received: by 2002:a17:902:c394:b029:d2:4ca:2e22 with SMTP id g20-20020a170902c394b02900d204ca2e22mr7074768plg.77.1601552791161;
        Thu, 01 Oct 2020 04:46:31 -0700 (PDT)
Received: from Mani-XPS-13-9360 ([2409:4072:188:5adb:1423:88c1:4321:a364])
        by smtp.gmail.com with ESMTPSA id v8sm5865855pgg.58.2020.10.01.04.46.23
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 01 Oct 2020 04:46:30 -0700 (PDT)
Date:   Thu, 1 Oct 2020 17:16:20 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Stanimir Varbanov <svarbanov@mm-sol.com>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org, kishon@ti.com,
        vkoul@kernel.org, robh@kernel.org, bhelgaas@google.com,
        lorenzo.pieralisi@arm.com, linux-arm-msm@vger.kernel.org,
        linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        mgautam@codeaurora.org, devicetree@vger.kernel.org,
        Marc Gonzalez <marc.w.gonzalez@free.fr>
Subject: Re: [PATCH v2 5/5] PCI: qcom: Add support for configuring BDF to SID
 mapping for SM8250
Message-ID: <20201001114619.GC3203@Mani-XPS-13-9360>
References: <20200930150925.31921-1-manivannan.sadhasivam@linaro.org>
 <20200930150925.31921-6-manivannan.sadhasivam@linaro.org>
 <507b3d50-6792-60b7-1ccd-f7b3031c20ac@mm-sol.com>
 <20201001055736.GB3203@Mani-XPS-13-9360>
 <e63b3ed4-d822-45dc-de60-23385fb45468@mm-sol.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e63b3ed4-d822-45dc-de60-23385fb45468@mm-sol.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Stan,

On Thu, Oct 01, 2020 at 01:57:59PM +0300, Stanimir Varbanov wrote:
> Hi Mani,
> 
> On 10/1/20 8:57 AM, Manivannan Sadhasivam wrote:
> > Hi Stan,
> > 
> > On Thu, Oct 01, 2020 at 12:46:46AM +0300, Stanimir Varbanov wrote:
> >> Hi Mani,
> >>
> >> On 9/30/20 6:09 PM, Manivannan Sadhasivam wrote:
> >>> For SM8250, we need to write the BDF to SID mapping in PCIe controller
> >>> register space for proper working. This is accomplished by extracting
> >>> the BDF and SID values from "iommu-map" property in DT and writing those
> >>> in the register address calculated from the hash value of BDF. In case
> >>> of collisions, the index of the next entry will also be written.
> >>
> >> This describes what the patch is doing. But why? Is that done in the
> >> other DWC low-level drivers or this is qcom specialty?
> >>
> > 
> > AFAIK, only some NXP SoCs deal with similar kind of mapping but right now
> > this is a Qcom only stuff.
> > 
> >>>
> >>> For the sake of it, let's introduce a "config_sid" callback and do it
> >>> conditionally for SM8250.
> >>>
> >>> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> >>> ---
> >>>  drivers/pci/controller/dwc/Kconfig     |   1 +
> >>>  drivers/pci/controller/dwc/pcie-qcom.c | 138 +++++++++++++++++++++++++
> >>>  2 files changed, 139 insertions(+)
> 
> <snip>
> 
> >>>  
> >>> +static int qcom_pcie_get_iommu_map(struct qcom_pcie *pcie)
> >>> +{
> >>> +	/* iommu map structure */
> >>> +	struct {
> >>> +		u32 bdf;
> >>> +		u32 phandle;
> >>> +		u32 smmu_sid;
> >>> +		u32 smmu_sid_len;
> >>> +	} *map;
> >>> +	struct device *dev = pcie->pci->dev;
> >>> +	int i, size = 0;
> >>> +	u32 smmu_sid_base;
> >>> +
> >>> +	of_get_property(dev->of_node, "iommu-map", &size);
> >>> +	if (!size)
> >>> +		return 0;
> >>> +
> >>> +	map = kzalloc(size, GFP_KERNEL);
> >>> +	if (!map)
> >>> +		return -ENOMEM;
> >>> +
> >>> +	of_property_read_u32_array(dev->of_node,
> >>> +		"iommu-map", (u32 *)map, size / sizeof(u32));
> >>
> >> iommu-map is a standard DT property why we have to parse it manually?
> >>
> > 
> > So right now we don't have a way to pass this information from DT. And there
> > is no IOMMU API to parse the fields also. We need to extract this information
> > to program the hash tables (BDF, SID) as the mapping between BDF and SID is not
> > 1:1 in SM8250.
> 
> We used iommu-map for msm8998 see this commit:
> 
> b84dfd175c09888751f501e471fdca346f582e06
> ("arm64: dts: qcom: msm8998: Add PCIe PHY and RC nodes")
> 

The iommu-map property will be present in most of the SoCs as needed for the
SMMU translation of DMA transfers. But in the case of SM8250, we need to map the
BDF (Bus Device Function) identifier (aka RID) to the SMMU Stream ID (SID)
in the PCIe controller, and we get that information from existing iommu-map
property.

Thanks,
Mani

> I also Cc-ed Marc if he knows something more.
> 
> > 
> > Perhaps I can add this information in commit message.
> 
> 
> -- 
> regards,
> Stan
