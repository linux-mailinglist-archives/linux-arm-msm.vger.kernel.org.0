Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7105B3FBC86
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Aug 2021 20:35:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234319AbhH3SgL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 30 Aug 2021 14:36:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233414AbhH3SgK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 30 Aug 2021 14:36:10 -0400
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0BF8C061760
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Aug 2021 11:35:16 -0700 (PDT)
Received: by mail-pl1-x62f.google.com with SMTP id n12so9041875plk.10
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Aug 2021 11:35:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=4lObGbOH7wYXLZts3Wjag1RVJ/fSvvfuumDMeXOvamY=;
        b=Q7lSvLugEcsO6jz/dsvEvqZfD5CfuPaFmPsqDAtVPqSs20Jd/6dgCj3+ylqcIr1EnF
         jwLepnTsPsP/+QPpe0p2M4mjvLGTJj0BWKxHTP9O7z1aO2tFiTY3aHcZlUOb+a6XlQXM
         ATUXIgkDyHiUBCYrZWUoo8y35gJiW/5N5IyhGJ73fequBefUKl85zNfhuYdjRjOwkFFO
         DMcbXDNdSqX8SPThW2njxQagVjwPbOA5wHbxiKMLnrCe3jWHierYYo0BcKop19CuPfp+
         rkjM8Q2Fg/hZzBzo1IglI+E+uAlQI1OjhJFzgdnkDt7bDMl3n3HYnvg6BBlII8/6fxOb
         eN4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=4lObGbOH7wYXLZts3Wjag1RVJ/fSvvfuumDMeXOvamY=;
        b=nWC0OT9j0gBYD9p6tJD4x1Q52Vo5CgAlK2165VN7Vj/1aJM5ZtEmJm3ClVCv3FnKIT
         wrwbYnnhMfxUxk5sHMj7RF3IKRkI5ppQOBZT2rIyPXIbkl6xiKou5P6t3iLptiFSKWwp
         kMzPXzCLVQleSXB3IsibUzCDDcQ0Ou5RcKSntUWlZ6Hvh73os1nsaHYzEis/fKBaWhDl
         3rs5AQjEzDpz4nw7XaME2zFAfh5t3IlGo/3GAQmLU7hB1jrQk+cwLYhcUG29RCYO7EU+
         PqQBmftgnf33GjYbEOacMw5hYeq+XbRk0eBlzejxqRT629MXRYUYfWdPgpiVl8iGLhAl
         AUDQ==
X-Gm-Message-State: AOAM530es9YBwL2mAA0ZG1sTTwnlTMLN4RzjHDRL245Fvu7P/a2479j4
        dAiNVu3NxOz8okr3CyypGqwt
X-Google-Smtp-Source: ABdhPJymp1hhLxI4Bg+PenRAv5ZqZvFwlomKc4Z90s9V466OSSk/8nDL72VECdaY3v0GglRuL8taGg==
X-Received: by 2002:a17:90a:940e:: with SMTP id r14mr497274pjo.208.1630348516218;
        Mon, 30 Aug 2021 11:35:16 -0700 (PDT)
Received: from thinkpad ([2409:4072:6e8f:10da:9c90:a2f4:77aa:6f51])
        by smtp.gmail.com with ESMTPSA id n14sm208169pjm.5.2021.08.30.11.35.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Aug 2021 11:35:15 -0700 (PDT)
Date:   Tue, 31 Aug 2021 00:05:08 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     kishon@ti.com, lorenzo.pieralisi@arm.com, bhelgaas@google.com,
        robh@kernel.org
Cc:     devicetree@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        hemantk@codeaurora.org, smohanad@codeaurora.org,
        bjorn.andersson@linaro.org, sallenki@codeaurora.org,
        skananth@codeaurora.org, vpernami@codeaurora.org,
        vbadigan@codeaurora.org
Subject: Re: [PATCH v7 0/3] Add Qualcomm PCIe Endpoint driver support
Message-ID: <20210830183508.GA50238@thinkpad>
References: <20210722121242.47838-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210722121242.47838-1-manivannan.sadhasivam@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Thu, Jul 22, 2021 at 05:42:39PM +0530, Manivannan Sadhasivam wrote:
> Hello,
> 
> This series adds support for Qualcomm PCIe Endpoint controller found
> in platforms like SDX55. The Endpoint controller is based on the designware
> core with additional Qualcomm wrappers around the core.
> 
> The driver is added separately unlike other Designware based drivers that
> combine RC and EP in a single driver. This is done to avoid complexity and
> to maintain this driver autonomously.
> 
> The driver has been validated with an out of tree MHI function driver on
> SDX55 based Telit FN980 EVB connected to x86 host machine over PCIe.
> 

Any chance this driver could make v5.15?

Thanks,
Mani

> Thanks,
> Mani
> 
> Changes in v7:
> 
> * Used existing naming convention for callback functions
> * Used active low state for PERST# gpio
> 
> Changes in v6:
> 
> * Removed status property in DT and added reviewed tag from Rob
> * Switched to _relaxed variants as suggested by Rob
> 
> Changes in v5:
> 
> * Removed the DBI register settings that are not needed
> * Used the standard definitions available in pci_regs.h
> * Added defines for all the register fields
> * Removed the left over code from previous iteration
> 
> Changes in v4:
> 
> * Removed the active_config settings needed for IPA integration
> * Switched to writel for couple of relaxed versions that sneaked in
> 
> Changes in v3:
> 
> * Lot of minor cleanups to the driver patch based on review from Bjorn and Stan.
> * Noticeable changes are:
>   - Got rid of _relaxed calls and used readl/writel
>   - Got rid of separate TCSR memory region and used syscon for getting the
>     register offsets for Perst registers
>   - Changed the wake gpio handling logic
>   - Added remove() callback and removed "suppress_bind_attrs"
>   - stop_link() callback now just disables PERST IRQ
> * Added MMIO region and doorbell interrupt to the binding
> * Added logic to write MMIO physicall address to MHI base address as it is
>   for the function driver to work
> 
> Changes in v2:
> 
> * Addressed the comments from Rob on bindings patch
> * Modified the driver as per binding change
> * Fixed the warnings reported by Kbuild bot
> * Removed the PERST# "enable_irq" call from probe()
> 
> Manivannan Sadhasivam (3):
>   dt-bindings: pci: Add devicetree binding for Qualcomm PCIe EP
>     controller
>   PCI: qcom-ep: Add Qualcomm PCIe Endpoint controller driver
>   MAINTAINERS: Add entry for Qualcomm PCIe Endpoint driver and binding
> 
>  .../devicetree/bindings/pci/qcom,pcie-ep.yaml | 158 ++++
>  MAINTAINERS                                   |  10 +-
>  drivers/pci/controller/dwc/Kconfig            |  10 +
>  drivers/pci/controller/dwc/Makefile           |   1 +
>  drivers/pci/controller/dwc/pcie-qcom-ep.c     | 710 ++++++++++++++++++
>  5 files changed, 888 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/devicetree/bindings/pci/qcom,pcie-ep.yaml
>  create mode 100644 drivers/pci/controller/dwc/pcie-qcom-ep.c
> 
> -- 
> 2.25.1
> 
