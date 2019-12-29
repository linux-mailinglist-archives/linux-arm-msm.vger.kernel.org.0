Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 06DD912BFF9
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Dec 2019 03:45:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726396AbfL2Cpv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 28 Dec 2019 21:45:51 -0500
Received: from mail-pf1-f193.google.com ([209.85.210.193]:43958 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726329AbfL2Cpv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 28 Dec 2019 21:45:51 -0500
Received: by mail-pf1-f193.google.com with SMTP id x6so15590404pfo.10
        for <linux-arm-msm@vger.kernel.org>; Sat, 28 Dec 2019 18:45:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=6vQfMDnjAnyBecC4EFX4YToQU0vypJ/cCTtTTcCKPbQ=;
        b=wP8/Z/fA9v6JoO3+Oqg8HNkYly6trwIiyQslwb8eMR0EJflqyY7kQ841eKvzL6t7Tu
         NHjGwIdu5gfTyen+njsZyiefStSrCKSidxy23jGOx6WzdDsZjYUiqs3mR17+ZsCDOUfV
         dTXLUe6Z+Mq31YgonJj1j/D6MKfLF6uov9FmqsMOBsCY+lEA7HJzJYHYaH5hRF3Q+wkm
         i7RbBHkbJhoXMA+zHDVkAGfpmvIi+BBVwkBOOVdIN/mxpYrrANQ/KHdrgROr/CUv+ZFx
         eURuoD7Zz9CTiwBZL/pM7UcE+qKqtUp5PNPg3OctGlT91iL/YiQ23JjiwqKBgPiEMpe4
         Sizg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=6vQfMDnjAnyBecC4EFX4YToQU0vypJ/cCTtTTcCKPbQ=;
        b=anlqPBck8amAG4lBtTUvcr5dSP9oQvWJlA1bzaOsD7Mlryn5sJAh3VpMwLRT5ieQkO
         pI6Uf2JeeDgPQeE/Yc6WA/6v1koeSjqsBGXJ8tZIwBj2QTJBVSv49vV4ezyyyzUt2YXp
         Q9jt3eCbVt7UnY/YFjTduEQYjSvs4D/3PCZQIqsOBwOgBKy2ShXWQMRqsVAJQJaQvkrP
         eJn7tj/D/4v1GXCj3D+nD42FMdYGzByAkzjij7vGKklm23JN4p04ipD+WzxAJM/lnobE
         u9n5fqc8jyzWpxnSNKE1XskzNlJeRtKmmunODIM4h7KOQPAbu0xdiys/hKTGxCtHC1tH
         BdFQ==
X-Gm-Message-State: APjAAAXalmVLFDMb09GYeDOTmyT1sMqY3nnRepuanTyd/ypAtrb4cVFS
        qJ/ccPzuT3CJ+wo8YYJEenAyvw==
X-Google-Smtp-Source: APXvYqzUR77xdE839/m6l8S88LYUtA1Wd64x+Elee8gvNt2cGvGDlb/OXr1UQYYdYRdHMPZDl3i5Bw==
X-Received: by 2002:a63:338e:: with SMTP id z136mr64204052pgz.60.1577587550101;
        Sat, 28 Dec 2019 18:45:50 -0800 (PST)
Received: from builder (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id p17sm44724028pfn.31.2019.12.28.18.45.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Dec 2019 18:45:49 -0800 (PST)
Date:   Sat, 28 Dec 2019 18:45:47 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Marc Gonzalez <marc.w.gonzalez@free.fr>
Cc:     Stanimir Varbanov <svarbanov@mm-sol.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Andrew Murray <andrew.murray@arm.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
        linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v2] PCI: qcom: Fix the fixup of PCI_VENDOR_ID_QCOM
Message-ID: <20191229024547.GH3755841@builder>
References: <20191227012717.78965-1-bjorn.andersson@linaro.org>
 <9e5ee7e8-aa63-e82c-8135-acc77b476c87@mm-sol.com>
 <38acf5fc-85aa-7090-e666-97a1281e9905@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <38acf5fc-85aa-7090-e666-97a1281e9905@free.fr>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat 28 Dec 07:41 PST 2019, Marc Gonzalez wrote:

> On 27/12/2019 09:51, Stanimir Varbanov wrote:
> 
> > On 12/27/19 3:27 AM, Bjorn Andersson wrote:
> >
> >> There exists non-bridge PCIe devices with PCI_VENDOR_ID_QCOM, so limit
> >> the fixup to only affect the relevant PCIe bridges.
> >>
> >> Cc: stable@vger.kernel.org
> >> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> >> ---
> >>
> >> Stan, I picked up all the suggested device id's from the previous thread and
> >> added 0x1000 for QCS404. I looked at creating platform specific defines in
> >> pci_ids.h, but SDM845 has both 106 and 107... Please let me know if you would
> >> prefer that I do this anyway.
> > 
> > Looks good,
> > 
> > Acked-by: Stanimir Varbanov <svarbanov@mm-sol.com>
> > 
> >>  drivers/pci/controller/dwc/pcie-qcom.c | 8 +++++++-
> >>  1 file changed, 7 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
> >> index 5ea527a6bd9f..138e1a2d21cc 100644
> >> --- a/drivers/pci/controller/dwc/pcie-qcom.c
> >> +++ b/drivers/pci/controller/dwc/pcie-qcom.c
> >> @@ -1439,7 +1439,13 @@ static void qcom_fixup_class(struct pci_dev *dev)
> >>  {
> >>  	dev->class = PCI_CLASS_BRIDGE_PCI << 8;
> >>  }
> >> -DECLARE_PCI_FIXUP_EARLY(PCI_VENDOR_ID_QCOM, PCI_ANY_ID, qcom_fixup_class);
> >> +DECLARE_PCI_FIXUP_EARLY(PCI_VENDOR_ID_QCOM, 0x0101, qcom_fixup_class);
> >> +DECLARE_PCI_FIXUP_EARLY(PCI_VENDOR_ID_QCOM, 0x0104, qcom_fixup_class);
> >> +DECLARE_PCI_FIXUP_EARLY(PCI_VENDOR_ID_QCOM, 0x0106, qcom_fixup_class);
> >> +DECLARE_PCI_FIXUP_EARLY(PCI_VENDOR_ID_QCOM, 0x0107, qcom_fixup_class);
> >> +DECLARE_PCI_FIXUP_EARLY(PCI_VENDOR_ID_QCOM, 0x0302, qcom_fixup_class);
> >> +DECLARE_PCI_FIXUP_EARLY(PCI_VENDOR_ID_QCOM, 0x1000, qcom_fixup_class);
> >> +DECLARE_PCI_FIXUP_EARLY(PCI_VENDOR_ID_QCOM, 0x1001, qcom_fixup_class);
> 
> Hrmmm... still not CCed on the patch,

You are Cc'ed on the patch, but as usual your mail server responds "451
too many errors from your ip" and throw my emails away.

> and still don't think the fixup is required(?) for 0x106 and 0x107.
> 

I re-read your reply in my v1 thread. So we know that 0x104 doesn't need
the fixup, so resumably only 0x101 needs the fixup?

Regards,
Bjorn
