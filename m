Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 932112CC246
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Dec 2020 17:31:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728674AbgLBQ36 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 2 Dec 2020 11:29:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33028 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728496AbgLBQ36 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 2 Dec 2020 11:29:58 -0500
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26077C0613D4
        for <linux-arm-msm@vger.kernel.org>; Wed,  2 Dec 2020 08:29:18 -0800 (PST)
Received: by mail-pl1-x641.google.com with SMTP id x15so1420132pll.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Dec 2020 08:29:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=uXYlmVHYdw9bJqtaDtjoHGPwzeOmsZaC7koT0MCGsSw=;
        b=lKF/G47kFnGsaMNRc04XrX3fP7tFGm0zi/9ZNVqqzTAUJAjuokW1/3Zp56Jsmlvont
         Clh0j5zXiAg5muRILgWcaLxXXFnWXfs37VqmtIqw+zsKafNBbkHe9+C56yVJo1Op+afB
         k6CMPKIuNoICWFWEKJQMo0XCt0xxde+gbfO7OCWp0Io2JQbgelhLa9C7kck+TPteo9JW
         I4xYJxSZaBOQFR0ZDIpnzBrgnw0sMVpczxlGvBMe4RP+hDS3lT2ZAPU3J+y1ujTGvYcs
         FNd0HcIdNcntkK+v04KQP5csQRvkpD/vVL9i4YD2nDIxaU+tGVqkc6wvTmTEdrW5M0Iz
         ZcyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=uXYlmVHYdw9bJqtaDtjoHGPwzeOmsZaC7koT0MCGsSw=;
        b=isAQcGD+zVTEhCLT+E9XLYoNkQVpTWaxQYMpkPFLJYUocB9tUhtFBrQHekpQUQYL80
         hFuxJGs2mg6k9ge3IJHp1rdV4LTfpl9CytKHBAyJlzgBtLgT6lYG+4XA/wuz2/rJcla9
         vtSUDUk71nIUXDb9u2BlK3+C67SXe81Hxxk9DzNvVOqDCgfNXg7sF8JEKxOsKyxOF4zz
         LDPCm/v3ZcPmoCt33N/mUb96gfNNFlGEpWqWRTCF6MIf87NRe9nouPr8U4ISA7/As22i
         WYE0DUFc8PORgEYCviKqD6H2VPR40E1ZTiae3K1fmSJiF7m31K+BNGYIgXvx5z4lKifM
         WLEg==
X-Gm-Message-State: AOAM530D71wSyuY82fs+FwNmkC5COO0eVc6SckwfBEov6GwMZcCTiKAs
        8cHSwvP7zK5/RyAw17TRGdpP
X-Google-Smtp-Source: ABdhPJy2N9geEmBvYivnWSjBLUoBrwgqmFGFfgHnsJHlPVIJUL/jcLf1wDEiqNYLWLxktQ30IkIBsw==
X-Received: by 2002:a17:902:9690:b029:d9:c94a:339 with SMTP id n16-20020a1709029690b02900d9c94a0339mr3248216plp.27.1606926557507;
        Wed, 02 Dec 2020 08:29:17 -0800 (PST)
Received: from thinkpad ([2409:4072:100:69b9:b5fe:d7f9:67a:4196])
        by smtp.gmail.com with ESMTPSA id b13sm311787pfo.15.2020.12.02.08.29.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Dec 2020 08:29:16 -0800 (PST)
Date:   Wed, 2 Dec 2020 21:59:10 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     gregkh@linuxfoundation.org
Cc:     hemantk@codeaurora.org, bbhatt@codeaurora.org,
        linux-arm-msm@vger.kernel.org, jhugo@codeaurora.org,
        linux-kernel@vger.kernel.org, loic.poulain@linaro.org
Subject: Re: [PATCH 00/29] MHI changes for v5.11
Message-ID: <20201202162910.GB3033@thinkpad>
References: <20201202094159.107075-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201202094159.107075-1-manivannan.sadhasivam@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Greg,

On Wed, Dec 02, 2020 at 03:11:30PM +0530, Manivannan Sadhasivam wrote:
> Hi Greg,
> 
> Here is the MHI patch series for v5.11. It was a busy cycle for us and so far we
> have accumulated almost 29 patches. Most of the patches are cleanups and fixes
> but there are some noticeable changes too:
> 
> 1. Loic finally removed the auto-start option from the channel parameters of the
> MHI controller. It is the duty of the client drivers like qrtr to start/stop the
> channels when required, so we decided to remove this option. As a side effect,
> we changed the qrtr driver to start the channels during its probe and removed
> the auto-start option from ath11k controller.
> 
> **NOTE** Since these changes spawns both MHI and networking trees, the patches
> are maintained in an immutable branch [1] and pulled into both mhi-next and
> ath11k-next branches. The networking patches got acks from ath11k and networking
> maintainers as well.
> 

Sigh... this is not going to work for patches in email form due to the immutable
branch. I will send a pull request this time.

Please ignore this series.

Thanks,
Mani

> 2. Loic added a generic MHI pci controller driver. This driver will be used by
> the PCI based Qualcomm modems like SDX55 and exposes channels such as QMI,
> IP_HW0, IPCR etc...
> 
> 3. Loic fixed the MHI device hierarchy by maintaining the correct parent child
> relationships. Earlier all MHI devices lived in the same level under the parent
> device like PCIe. But now, the MHI devices belonging to channels will become the
> children of controller MHI device.
> 
> 4. Finally Loic also improved the MHI device naming by using indexed names such
> as mhi0, mhi1, etc... This will break the userspace applications depending on
> the old naming convention but since the only one user so far is Jeff Hugo's AI
> accelerator apps, we decided to make this change now itself with his agreement.
> 
> 5. Bhaumik fixed the qrtr driver by stopping the channels during remove. This
> patch also got ack from networking maintainer and we decided to take it through
> MHI tree (via immutable branch) since we already had a qrtr change.
> 
> Please consider applying!
> 
> Thanks,
> Mani
> 
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/mani/mhi.git/log/?h=mhi-ath11k-immutable
> 
> Bhaumik Bhatt (19):
>   bus: mhi: core: Remove unnecessary counter from mhi_firmware_copy()
>   bus: mhi: core: Add missing EXPORT_SYMBOL for mhi_get_mhi_state()
>   bus: mhi: core: Expose mhi_get_exec_env() API for controllers
>   bus: mhi: core: Remove unused mhi_fw_load_worker() declaration
>   bus: mhi: core: Rename RDDM download function to use proper words
>   bus: mhi: core: Skip RDDM download for unknown execution environment
>   bus: mhi: core: Use appropriate names for firmware load functions
>   bus: mhi: core: Move to using high priority workqueue
>   bus: mhi: core: Skip device wake in error or shutdown states
>   bus: mhi: core: Move to SYS_ERROR regardless of RDDM capability
>   bus: mhi: core: Prevent sending multiple RDDM entry callbacks
>   bus: mhi: core: Move to an error state on any firmware load failure
>   bus: mhi: core: Use appropriate label in firmware load handler API
>   bus: mhi: core: Move to an error state on mission mode failure
>   bus: mhi: core: Check for IRQ availability during registration
>   bus: mhi: core: Separate system error and power down handling
>   bus: mhi: core: Mark and maintain device states early on after power
>     down
>   bus: mhi: core: Remove MHI event ring IRQ handlers when powering down
>   net: qrtr: Unprepare MHI channels during remove
> 
> Carl Yin (1):
>   bus: mhi: core: Fix null pointer access when parsing MHI configuration
> 
> Dan Carpenter (1):
>   bus: mhi: core: Fix error handling in mhi_register_controller()
> 
> Jeffrey Hugo (1):
>   bus: mhi: core: fix potential operator-precedence with BHI macros
> 
> Loic Poulain (7):
>   bus: mhi: Remove auto-start option
>   net: qrtr: Start MHI channels during init
>   bus: mhi: Add MHI PCI support for WWAN modems
>   bus: mhi: Fix channel close issue on driver remove
>   bus: mhi: core: Indexed MHI controller name
>   bus: mhi: core: Fix device hierarchy
>   mhi: pci_generic: Fix implicit conversion warning
> 
> -- 
> 2.25.1
> 
