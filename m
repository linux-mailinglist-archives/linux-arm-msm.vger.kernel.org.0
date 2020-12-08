Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2E8FD2D2927
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Dec 2020 11:46:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726138AbgLHKqr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 8 Dec 2020 05:46:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727193AbgLHKqq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 8 Dec 2020 05:46:46 -0500
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B6BB3C061794
        for <linux-arm-msm@vger.kernel.org>; Tue,  8 Dec 2020 02:46:06 -0800 (PST)
Received: by mail-pg1-x543.google.com with SMTP id n7so11848352pgg.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Dec 2020 02:46:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Hg/xY5zxGl+MoKUjrJ8sljuQNnoJdKAUjIvRJqc5mNk=;
        b=wKxmi4fptBt2cbv39exkMGyGRL4Vmxcbw8d9jg/9PRr2FeSUHMeiEU5MrO2OpMXJew
         Gs6qoDwSi+v/48LhaBDm3gOVn1hGePworNevuILfBNBUA0Aom9OCNTia+FTP7JLbYegp
         OUBIgv1/UkI53f/QSJzb/l4rzGM5FyMkpIWdY5jLAxkKPf5AE2aUU2HUwVmNP9KMSWW7
         OeWP6asGKmNkwcdVOT/koR698wknGHJhgNAamcQa8tXVGko0ME5E4UFJcTXshZ7JKJly
         0CWCKlMcRT/b4psEIEWH6GpzOK86uSrHhdYD4j3bf1mB09hR4xJF+v4iPvhlOD1Yi9xt
         ancw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Hg/xY5zxGl+MoKUjrJ8sljuQNnoJdKAUjIvRJqc5mNk=;
        b=EiE/l62gBXT2q74RUT6apGz8M6UWCGxXweebNpgcFKbOG3bcVdjyKDrlB/de3PP+9I
         4G1+MyRwPGOSmp7g8U0DqLOk8Tg8FM/mIKPTPLZEI7MaLZtn4l+d8lww8JRJbfR3t9y0
         GL/JdG+GB4DDP7YINZusVGsbFL424r2YLMWGCG5ikYw5HcQ1kynvjH67b1WDbc8ZVr2n
         eHC5yBltR5M0jn4/VJMk5+7/XXlbaNKdcL1ruCUOOmf1L2bEvcJ60eR6UDoXRIV37VIo
         UcCa9F+6Y3A12U6BNu+aIRZRCOFZt/aktaulb3UfpaH4LKuA/h1MKZAIQMpb3L4d4iMk
         SvYQ==
X-Gm-Message-State: AOAM5324CwSyZisMOO2jCrJbch6Zdw7ZubBlJS3hA7QvN5OGQOtGdjoF
        JEr6cCBGtgHV9BnB5E53I6gH
X-Google-Smtp-Source: ABdhPJxbTiP7ly21Zaa3MdaZPpAeAG2meS/rKeLuIOP3g2CQ62A3bPNoV4glgcPjAzbwKV3PnsPHjg==
X-Received: by 2002:a17:90a:72c6:: with SMTP id l6mr3677108pjk.233.1607424365982;
        Tue, 08 Dec 2020 02:46:05 -0800 (PST)
Received: from work ([103.59.133.81])
        by smtp.gmail.com with ESMTPSA id ck20sm2855405pjb.20.2020.12.08.02.46.01
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 08 Dec 2020 02:46:05 -0800 (PST)
Date:   Tue, 8 Dec 2020 16:15:57 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org, kishon@ti.com,
        vkoul@kernel.org, robh@kernel.org, svarbanov@mm-sol.com,
        bhelgaas@google.com, linux-arm-msm@vger.kernel.org,
        linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        mgautam@codeaurora.org, devicetree@vger.kernel.org,
        truong@codeaurora.org
Subject: Re: [PATCH v5 0/5] Add PCIe support for SM8250 SoC
Message-ID: <20201208104557.GA8081@work>
References: <20201027170033.8475-1-manivannan.sadhasivam@linaro.org>
 <20201208094712.GA30430@e121166-lin.cambridge.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201208094712.GA30430@e121166-lin.cambridge.arm.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Lorenzo,

On Tue, Dec 08, 2020 at 09:47:12AM +0000, Lorenzo Pieralisi wrote:
> On Tue, Oct 27, 2020 at 10:30:28PM +0530, Manivannan Sadhasivam wrote:
> > Hello,
> > 
> > This series adds PCIe support for Qualcomm SM8250 SoC with relevant PHYs.
> > There are 3 PCIe instances on this SoC each with different PHYs. The PCIe
> > controller and PHYs are mostly comaptible with the ones found on SDM845
> > SoC, hence the old drivers are modified to add the support.
> > 
> > This series has been tested on RB5 board with QCA6391 chipset connected
> > onboard.
> 
> Hi,
> 
> I would be merging this series, I understand patch {2) was already
> taken by Vinod - should I take {1,3,4,5} via the pci tree ?
> 

Vinod merged patches 1/5 and 2/5 as they belong to phy subsystem. You
can take the rest of the patches via pci tree.

Thanks,
Mani

> Thanks,
> Lorenzo
> 
> > Thanks,
> > Mani
> > 
> > Changes in v5:
> > 
> > * Added Review tags from Rob
> > * Cleaned up the bdf to sid patch after discussing with Tony
> > 
> > Changes in v4:
> > 
> > * Fixed an issue with tx_tbl_sec in PHY driver
> > 
> > Changes in v3:
> > 
> > * Rebased on top of phy/next
> > * Renamed ops_sm8250 to ops_1_9_0 to maintain uniformity
> > 
> > Changes in v2:
> > 
> > * Fixed the PHY and PCIe bindings
> > * Introduced secondary table in PHY driver to abstract out the common configs.
> > * Used a more generic way of configuring BDF to SID mapping
> > * Dropped ATU change in favor of a patch spotted by Rob
> > 
> > Manivannan Sadhasivam (5):
> >   dt-bindings: phy: qcom,qmp: Add SM8250 PCIe PHY bindings
> >   phy: qcom-qmp: Add SM8250 PCIe QMP PHYs
> >   dt-bindings: pci: qcom: Document PCIe bindings for SM8250 SoC
> >   PCI: qcom: Add SM8250 SoC support
> >   PCI: qcom: Add support for configuring BDF to SID mapping for SM8250
> > 
> >  .../devicetree/bindings/pci/qcom,pcie.txt     |   6 +-
> >  .../devicetree/bindings/phy/qcom,qmp-phy.yaml |   6 +
> >  drivers/pci/controller/dwc/Kconfig            |   1 +
> >  drivers/pci/controller/dwc/pcie-qcom.c        |  92 ++++++
> >  drivers/phy/qualcomm/phy-qcom-qmp.c           | 281 +++++++++++++++++-
> >  drivers/phy/qualcomm/phy-qcom-qmp.h           |  18 ++
> >  6 files changed, 398 insertions(+), 6 deletions(-)
> > 
> > -- 
> > 2.17.1
> > 
