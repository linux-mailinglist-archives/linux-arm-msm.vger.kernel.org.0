Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6AF9A27D2B7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Sep 2020 17:28:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729115AbgI2P2o (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Sep 2020 11:28:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46184 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728506AbgI2P2n (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Sep 2020 11:28:43 -0400
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74E17C0613D0
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2020 08:28:42 -0700 (PDT)
Received: by mail-pf1-x429.google.com with SMTP id l126so4897578pfd.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2020 08:28:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=+97+bLWjG8Cnh6+0K5ue9SNwWVgC0isyenr+b9GC6ys=;
        b=J8M0Kziv9svfBrZ+ZnUZToGP+ah43vFYAF1546jBzsfDVyAmrG0g0hsxC/NeO5/1XM
         rGqOYwuSe45qyXeVOdTz9oFjmbER5svmirEVAzpcvLyEzd3JKPkmWQ+CTZqiy7naCfhi
         NApDnQ7eQuGlF58/PXYpQOwyQo/RVKogx6v21BA0bmYGnHcV9hhCIrNG5bzZ0KcR56U/
         0tvb1OYq+lSHBI7rJQpD/E9hmMwihmdnwHl9d9yaqaZU9RJL/KX4tcyvbG5ZX4wQ8RNC
         fA5eheGFSz32PGeoGAYLfWbPkzRbSYaYvEVP7rosACouIUIHqP3QtGdQtPX9WV6bYVcB
         eRLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=+97+bLWjG8Cnh6+0K5ue9SNwWVgC0isyenr+b9GC6ys=;
        b=Jq0KUbjZ+4E6hF+/LUoZ7qBa4v6Nf7wNEeP3z514PydsKGqHnI+0TLuTzGQ3AakXTU
         R6ruJGbk7Fw9ZSq9pZ21+Fyy4dWqFR/7mRm2sIdQRWIbTi2sh9AmRoAKvOLLuI1msO4q
         JyOXHAnzqdMYXPHnUqUmr7zFD6O4s9FA/zv89OC/kJz2Iy2t10UAIRyq4e8sXyKED76V
         g3XL0RCO203HqpxDMP+I0swfCkadudkpPoviJM3/lqeZKK3axcso9lF7jD7TXQTpG1LL
         uLth4KhsR6l+CDyxHGBUEfRVmRcMWsh89/+kNcQm6oQ2vn1DUisTipMv7NN/kAPT7+LX
         roRg==
X-Gm-Message-State: AOAM533dVsrzZcRUpfwj5mA5JAiHRrkhVGRz+Lh18OQkO56LUJytQQiJ
        uiBfWflw3yoFigrqRhKGGiWK5jYAzl7dtPw=
X-Google-Smtp-Source: ABdhPJz523+9I5p665u5UEBxj+5pSPklH4lLxk5h8MOYoA0FSRk8WOJFC6AUtx907yLtLtHQeM2KNw==
X-Received: by 2002:a05:6a00:808:b029:13e:d13d:a05d with SMTP id m8-20020a056a000808b029013ed13da05dmr4414184pfk.35.1601393321614;
        Tue, 29 Sep 2020 08:28:41 -0700 (PDT)
Received: from Mani-XPS-13-9360 ([103.59.133.81])
        by smtp.gmail.com with ESMTPSA id gn24sm5216956pjb.8.2020.09.29.08.28.38
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 29 Sep 2020 08:28:40 -0700 (PDT)
Date:   Tue, 29 Sep 2020 20:58:34 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     gregkh@linuxfoundation.org
Cc:     hemantk@codeaurora.org, bbhatt@codeaurora.org,
        linux-arm-msm@vger.kernel.org, jhugo@codeaurora.org,
        linux-kernel@vger.kernel.org, kvalo@codeaurora.org,
        ath11k@lists.infradead.org
Subject: Re: [PATCH v2 00/21] MHI changes for v5.10
Message-ID: <20200929152834.GA17845@Mani-XPS-13-9360>
References: <20200928040951.18207-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200928040951.18207-1-manivannan.sadhasivam@linaro.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Greg,

On Mon, Sep 28, 2020 at 09:39:30AM +0530, Manivannan Sadhasivam wrote:
> Hi Greg,
> 
> Here is the MHI series for v5.10 cycle. Most of the patches are cleanups
> in the MHI stack. Notable changes are below:
> 
> * Saving the client device hardware information obtained through the BHI
>   protocol. This information will be exposed through sysfs to make use in
>   the userland applications.
> * Introduce sysfs entries to read the serial number and OEM PK hash values
>   of the client device obtained from BHI protocol. Relevant API documentation
>   is also added.
> * Introduce debugfs entries to show MHI states, events, channels, register
>   state etc... to aid debug.
> * Remove the channel name from MHI device name as the device is not specific
>   to channels. Used generic names instead!
> * Fix the warning reported by Kbuild bot by using append (+=) Kbuild rule
>   to the mhi/core Makefile.
> * Introduce APIs to allocate and free MHI controllers. This is done to make
>   sure that the allocated structs are initialized to NULL before passing to
>   the MHI core.
> * Remove the requirement to have a dedicated IRQ for each event ring.
>   The MHI controllers can now use a single IRQ for all event rings.
> * Remove the auto-start option for MHI channels. This is done to avoid
>   receiving spurious uplink from MHI client device when the client driver
>   is not up. The corresponding qrtr change is also included with Dave's ACK.
> 
> Please consider merging!
> 

Can you please drop the below two patches while applying this series?

bus: mhi: Remove auto-start option
net: qrtr: Start MHI channels during init

We realized that without these patches, net-next will be broken for QCA6390.
Proper way to handle this is by using an immutable branch or by carrying the
ath11k change through MHI tree. We decided to handle this in next merge window.

Or if you prefer to have a next revision of the series without these patches
I can send it. Please let me know!

Thanks,
Mani

> Thanks,
> Mani
> 
> Changes in v2:
> 
> * Clubbed both series (take one and two) onto a single one
> * Used dev_groups to manage sysfs attributes
> * Merged the debugfs fix patch with the debugfs patch
> * Dropped MAX_MTU patch for now
> 
> Bhaumik Bhatt (12):
>   bus: mhi: core: Remove double occurrence for mhi_ctrl_ev_task()
>     declaration
>   bus: mhi: core: Abort suspends due to outgoing pending packets
>   bus: mhi: core: Use helper API to trigger a non-blocking host resume
>   bus: mhi: core: Trigger host resume if suspended during
>     mhi_device_get()
>   bus: mhi: core: Use generic name field for an MHI device
>   bus: mhi: core: Introduce helper function to check device state
>   bus: mhi: core: Introduce counters to track MHI device state
>     transitions
>   bus: mhi: core: Read and save device hardware information from BHI
>   bus: mhi: core: Introduce APIs to allocate and free the MHI controller
>   bus: mhi: Fix entries based on Kconfig coding style
>   bus: mhi: core: Introduce debugfs entries for MHI
>   bus: mhi: core: Introduce sysfs entries for MHI
> 
> Clark Williams (1):
>   bus: mhi: Remove include of rwlock_types.h
> 
> Hemant Kumar (1):
>   bus: mhi: core: Add const qualifier to MHI config information
> 
> Loic Poulain (5):
>   bus: mhi: core: Allow shared IRQ for event rings
>   bus: mhi: Remove unused nr_irqs_req variable
>   bus: mhi: debugfs: Print channel context read-pointer
>   bus: mhi: Remove auto-start option
>   net: qrtr: Start MHI channels during init
> 
> Manivannan Sadhasivam (1):
>   bus: mhi: core: Fix the building of MHI module
> 
> Randy Dunlap (1):
>   bus: mhi: fix doubled words and struct image_info kernel-doc
> 
>  Documentation/ABI/stable/sysfs-bus-mhi |  21 ++
>  MAINTAINERS                            |   1 +
>  drivers/bus/mhi/Kconfig                |  20 +-
>  drivers/bus/mhi/core/Makefile          |   3 +-
>  drivers/bus/mhi/core/boot.c            |  17 +-
>  drivers/bus/mhi/core/debugfs.c         | 411 +++++++++++++++++++++++++
>  drivers/bus/mhi/core/init.c            |  96 ++++--
>  drivers/bus/mhi/core/internal.h        |  38 ++-
>  drivers/bus/mhi/core/main.c            |  27 +-
>  drivers/bus/mhi/core/pm.c              |  28 +-
>  include/linux/mhi.h                    |  53 +++-
>  net/qrtr/mhi.c                         |   5 +
>  12 files changed, 644 insertions(+), 76 deletions(-)
>  create mode 100644 Documentation/ABI/stable/sysfs-bus-mhi
>  create mode 100644 drivers/bus/mhi/core/debugfs.c
> 
> -- 
> 2.17.1
> 
