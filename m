Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6082D17B9DF
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Mar 2020 11:10:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726090AbgCFKKH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 6 Mar 2020 05:10:07 -0500
Received: from mail-wm1-f65.google.com ([209.85.128.65]:52521 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726054AbgCFKKE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 6 Mar 2020 05:10:04 -0500
Received: by mail-wm1-f65.google.com with SMTP id p9so1712695wmc.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Mar 2020 02:10:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=og3sMPJN+Nb579KWuJJ61AJ7TUDj6TNf09RkDt7hsI8=;
        b=W3e46LJj5LqwGN7bmYVtalGehYEZNj3nHr/KAjP31KhaaXN+m0uWmMkf3acHKomptm
         89d0LyK/fwtGemR8XoQyJ0Ys/LcWeWGdlwW4CeVEEcaicTe2FKFajLwdJ5fOYlueg0Sl
         TK9CYNYdO7MxSrz07jDyQcWVpS506xMCbX+/TC3r/e8J6B1ZMT5UKVvra0iQbFiIzTGv
         115moqqHKTtOhYVG2HvcfiNX1TYPoAk1uZbA5LrtS1I/ItmZcZ3+3JYMcA9v6viTj0Yz
         eEAPwp4x5R0wWQQAwxCEk2yzvnV5bNaOC/JH7GsT7wADh0zmXAuNdX6IGcE4tUIHjkXg
         jtrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=og3sMPJN+Nb579KWuJJ61AJ7TUDj6TNf09RkDt7hsI8=;
        b=sdBf1PxVaEAZD788KKaneJSq09RNzk5lJfVI8R97NbYkfZNCPj9MZlQITKCqicwEf7
         UfFV7NoauXIDsqfCOWWzcTbczR6ev9gkOQBKUBO6UH/SN0sMI9kgpWjNWmACLKgzsY3q
         EzHgpD0n6ghIXAA3Tkogf3LkF3Erso/1TKdJa0kgLfcu/uwGQT+wZ5RDyCwF4VZJjveK
         Sh0UPvuOaVbN9GtF0Q4q4dlvSO/tWDfsfxxxwwg1M0Btgx5S1EYMtzokymO0+VBwLANz
         ShdHRXz36QFMxKUpOS2PyZDDV41JRacCYY1VqcviwAIDvpQ/ph4QQSzG0zC2VPTfxCcT
         S5OQ==
X-Gm-Message-State: ANhLgQ3rz3staTSCz26qox3Mr17mroZetDF1zFZTukOAFHatjtIVMrsS
        VwcJRIs7e7PbUcJqmyBWbReqIw==
X-Google-Smtp-Source: ADFU+vuYWMHCslvUNwXUcaXSJwmBGmrU+STTteHzbOUtCKoxHdMrNV0++OcL5lLFlieALAAa/Z3NFg==
X-Received: by 2002:a1c:48c1:: with SMTP id v184mr3204485wma.5.1583489402366;
        Fri, 06 Mar 2020 02:10:02 -0800 (PST)
Received: from myrica ([2001:171b:c9a8:fbc0:116c:c27a:3e7f:5eaf])
        by smtp.gmail.com with ESMTPSA id f6sm12992707wmc.9.2020.03.06.02.10.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2020 02:10:01 -0800 (PST)
Date:   Fri, 6 Mar 2020 11:09:55 +0100
From:   Jean-Philippe Brucker <jean-philippe@linaro.org>
To:     Hanjun Guo <guohanjun@huawei.com>
Cc:     Joerg Roedel <joro@8bytes.org>, iommu@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-mediatek@lists.infradead.org,
        virtualization@lists.linux-foundation.org,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Linuxarm <linuxarm@huawei.com>
Subject: Re: [PATCH 00/14] iommu: Move iommu_fwspec out of 'struct device'
Message-ID: <20200306100955.GB50020@myrica>
References: <20200228150820.15340-1-joro@8bytes.org>
 <ea839f32-194a-29ea-57fc-22caea40b981@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ea839f32-194a-29ea-57fc-22caea40b981@huawei.com>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Mar 06, 2020 at 04:39:37PM +0800, Hanjun Guo wrote:
> Hi Joerg,
> 
> On 2020/2/28 23:08, Joerg Roedel wrote:
> > Hi,
> > 
> > here is a patch-set to rename iommu_param to dev_iommu and
> > establish it as a struct for generic per-device iommu-data.
> > Also move the iommu_fwspec pointer from struct device into
> > dev_iommu to have less iommu-related pointers in struct
> > device.
> > 
> > The bigger part of this patch-set moves the iommu_priv
> > pointer from struct iommu_fwspec to dev_iommu, making is
> > usable for iommu-drivers which do not use fwspecs.
> > 
> > The changes for that were mostly straightforward, except for
> > the arm-smmu (_not_ arm-smmu-v3) and the qcom iommu driver.
> > Unfortunatly I don't have the hardware for those, so any
> > testing of these drivers is greatly appreciated.
> 
> I tested this patch set on Kunpeng 920 ARM64 server which
> using smmu-v3 with ACPI booting, but triggered a NULL
> pointer dereference and panic at boot:

I think that's because patch 01/14 move the fwspec access too early. In 

                err = pci_for_each_dma_alias(to_pci_dev(dev),
                                             iort_pci_iommu_init, &info);

                if (!err && iort_pci_rc_supports_ats(node))
                        dev->iommu_fwspec->flags |= IOMMU_FWSPEC_PCI_RC_ATS;

the iommu_fwspec is only valid if iort_pci_iommu_init() initialized it
successfully, if err == 0. The following might fix it:

diff --git a/drivers/acpi/arm64/iort.c b/drivers/acpi/arm64/iort.c
index 0e981d7f3c7d..7d04424189df 100644
--- a/drivers/acpi/arm64/iort.c
+++ b/drivers/acpi/arm64/iort.c
@@ -1015,7 +1015,7 @@ const struct iommu_ops *iort_iommu_configure(struct device *dev)
 		return ops;

 	if (dev_is_pci(dev)) {
-		struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
+		struct iommu_fwspec *fwspec;
 		struct pci_bus *bus = to_pci_dev(dev)->bus;
 		struct iort_pci_alias_info info = { .dev = dev };

@@ -1028,7 +1028,8 @@ const struct iommu_ops *iort_iommu_configure(struct device *dev)
 		err = pci_for_each_dma_alias(to_pci_dev(dev),
 					     iort_pci_iommu_init, &info);

-		if (!err && iort_pci_rc_supports_ats(node))
+		fwspec = dev_iommu_fwspec_get(dev);
+		if (fwspec && iort_pci_rc_supports_ats(node))
 			fwspec->flags |= IOMMU_FWSPEC_PCI_RC_ATS;
 	} else {
 		int i = 0;


Note that this use of iommu_fwspec will be removed by the ATS cleanup
series [1], but this change should work as a temporary fix.

Thanks,
Jean

[1] https://lore.kernel.org/linux-iommu/20200213165049.508908-10-jean-philippe@linaro.org/
