Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0915C3B3C3C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Jun 2021 07:28:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230172AbhFYFbQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 25 Jun 2021 01:31:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48290 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230097AbhFYFbQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 25 Jun 2021 01:31:16 -0400
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com [IPv6:2607:f8b0:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 39B7CC061574
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jun 2021 22:28:56 -0700 (PDT)
Received: by mail-pg1-x530.google.com with SMTP id v7so6664161pgl.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jun 2021 22:28:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=uH4YEvmp5g7u93n9Dq2yTIhMcUrniJ3GekoEltOXyi0=;
        b=BWh1AVeR7HY31dhsptuFMdXnjvMV7kDmH0Lm8NCVFqXNGL+U+OAstSLqLf0vzL5TjU
         kHw58AdDMDAB7aSROhCCVa/+zIfRC38hzdVbOGxcpuv+bn/EK0EM2v5yqM6nRlzAmWyt
         NPis4x1Gr58EuzqIeu467LxXh9f4xHabKX7auC1na/14Fk35yLXT2h+CPe4qfeWtuEtB
         w+WgYiN6z+euS54vuxzJvB1bIIjDDjFHSd1bEWy4R3bNzG1d5sSy2uqkHte5/OHwJtZe
         K7WO0jDr5hvADqUqxSZPHEGmW/UF2Su1D3czDqjWIMJ6DfjUSZWqOYsMaQLyYd2+ifcG
         FAEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=uH4YEvmp5g7u93n9Dq2yTIhMcUrniJ3GekoEltOXyi0=;
        b=EXxfNyaEPQMEjsik571IEMrAZqzq7W9qpQw490Cg/sgHRPauEIFSynXA7qKWdewiI8
         N6qd7RsAPznvWg0DU/rXPp/748drhLMllT2YX8FQGV2UQf2qnm/4sN3MsEcl8gPrbHW5
         6tWxngX90DM1ibOpvb5U844wMIzOXAIdFSM+L5ydhke5UeXk0WtYJmbvNhTe9QTKnhAT
         gsPOpxqB+QlBji41leQWxZ90bzN/Npwn6eL4VHN8v/O1ydPIwALW0bpvPP2uGm8t1Dc5
         XCbg87VT5RGPgJUppD+qRMtUKemP77UM5Z0jNZf/20GHyX/C14sNPs145jogn4QilqwX
         t7Bg==
X-Gm-Message-State: AOAM530Jm19NfhcgrvcYkRHIsua9/8nLl3RyKyhhn06c8PSTgou3SNeg
        tkaZ23q9L0aa/sNuGIFpEbF/g3maZERd
X-Google-Smtp-Source: ABdhPJxP31Y8odt9uYHFYA5YARCzn1gDkW177thP7cFAk7Q1JIRMzZxVqmXOzD51LDnm/kp0w86Vew==
X-Received: by 2002:aa7:8684:0:b029:305:9474:6934 with SMTP id d4-20020aa786840000b029030594746934mr8533191pfo.45.1624598935313;
        Thu, 24 Jun 2021 22:28:55 -0700 (PDT)
Received: from workstation ([120.138.13.204])
        by smtp.gmail.com with ESMTPSA id g17sm4186329pfv.62.2021.06.24.22.28.52
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 24 Jun 2021 22:28:54 -0700 (PDT)
Date:   Fri, 25 Jun 2021 10:58:51 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Bhaumik Bhatt <bbhatt@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, hemantk@codeaurora.org,
        jhugo@codeaurora.org, linux-kernel@vger.kernel.org,
        loic.poulain@linaro.org, linux-wireless@vger.kernel.org,
        kvalo@codeaurora.org, ath11k@lists.infradead.org
Subject: Re: [PATCH v4 0/6] BHI/BHIe improvements for MHI power purposes
Message-ID: <20210625052851.GF4974@workstation>
References: <1620330705-40192-1-git-send-email-bbhatt@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1620330705-40192-1-git-send-email-bbhatt@codeaurora.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, May 06, 2021 at 12:51:39PM -0700, Bhaumik Bhatt wrote:
> This patch series improves the power up behavior by allowing MHI host driver to
> set BHI and/or BHIe offsets early on in the preparation phase and fail pre-power
> up if offsets are not found or not within a limited MMIO region. This also
> allows MHI host to clean up the offsets in the unprepare after power down phase.
> 
> Going forward, controllers will be required to specify a reg_len field which
> will be used to check whether the BHI/BHIe offsets are in range or not.
> 
> This series has been tested on X86_64 architecture with the PCI generic driver
> as controller and an SDX55 device.
> 

Since there is a chance to send this series for 5.14, I've applied it
now to mhi-next!

Thanks,
Mani

> v4:
> -Added reviewed-by tags
> -Updated range check patch to include BHI/e offsets in the error message
> 
> v3:
> -Added reviewed-by tags
> -Updated order of reg_len in mhi_controller structure documentation
> 
> v2:
> -Added reviewed-by tags
> -Moved reg_len entry in mhi_controller structure to allow for a packed struct
> 
> Bhaumik Bhatt (6):
>   bus: mhi: core: Set BHI/BHIe offsets on power up preparation
>   bus: mhi: core: Set BHI and BHIe pointers to NULL in clean-up
>   bus: mhi: Add MMIO region length to controller structure
>   ath11k: set register access length for MHI driver
>   bus: mhi: pci_generic: Set register access length for MHI driver
>   bus: mhi: core: Add range checks for BHI and BHIe
> 
>  drivers/bus/mhi/core/init.c           | 61 ++++++++++++++++++++++++-----------
>  drivers/bus/mhi/core/pm.c             | 28 +++-------------
>  drivers/bus/mhi/pci_generic.c         |  1 +
>  drivers/net/wireless/ath/ath11k/mhi.c |  1 +
>  include/linux/mhi.h                   |  2 ++
>  5 files changed, 50 insertions(+), 43 deletions(-)
> 
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 
