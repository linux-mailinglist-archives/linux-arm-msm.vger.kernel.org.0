Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4E2122E9BAF
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Jan 2021 18:05:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727745AbhADRFM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 4 Jan 2021 12:05:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55868 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727720AbhADRFL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 4 Jan 2021 12:05:11 -0500
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B510C061793
        for <linux-arm-msm@vger.kernel.org>; Mon,  4 Jan 2021 09:04:31 -0800 (PST)
Received: by mail-pj1-x1032.google.com with SMTP id lj6so10461969pjb.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 Jan 2021 09:04:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=T7UOVsn/Scp7OYLtcdt5J/Qc1XlbIMBrPyEA+SYoN4Q=;
        b=WEKu18zXHBZcOloih3SeVznUTcIyL3DXMq3URRn9lNk1e0KCyZmOq9cLaq5JXE+Z04
         jbOF0mESG2FBTWazjIS7tFkb2P4SsJMviCuOZwehgKhM8FpakPCFG/IBcEsJwbx7Zhxd
         XYfNVc96Qf6YgLHc69XGtVhghHP9FcmuFzrO5jZVWDEWdLKeSSOs8qXcAkK+Mq5Y26L/
         XJeo9tbWuaFH1UHN0vOIuIkLACXvNdJ1nRVAqMl39QFOqvZkhiXWp+dxY/ewKQK/erOi
         vbjoAJl57DkHkXd9+LVq5vtcCJJwePGkQYlG0k/KNtJYtYnrdzeIJfdzfLo/Je/Ly78N
         lU0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=T7UOVsn/Scp7OYLtcdt5J/Qc1XlbIMBrPyEA+SYoN4Q=;
        b=mVfkSH6Xdqea3xpmjaUMYvc6Namr7oeb2f1vTgWI6fDW7WmrB/OO+KFRUpIez2M0tN
         4JB/YlD0cEDQrAaPUZgqbn5sEJ3U3cYDalsgDh4bODcuR4LVHH5E0gfurDlsr0Wc2Izp
         YMj44dyjJKJ7VBDz/1oLvEVKoVI8tWeRAjCE/Q8UQvDyEkRxb23TjXqTLfoetC3lfSMv
         JrSfbLVSuu3GrHINp/S8qFYenxn65uu5a80Wrij4HzmConItemwM7bzkkx5kQSAteHcY
         9qTWgV8H7zJWKJcHN0uAmX8Ecqe8AMKcmyTAQTdmxlx4K12Fen94ELML8krc6MJyxSo6
         RCcg==
X-Gm-Message-State: AOAM532e5P8y58AyPPLnVqLFL/2sp93NGsMeDauMHXvIH+H5sk/VpMuE
        0cVX3q0w/kr/aBLqloCitV31YIcWo+H2
X-Google-Smtp-Source: ABdhPJxKr7M9myoHEBeI1FSAxfRPdIcY71gKuYEL+HXoPBJF8yuPR1qLQrh9cwjw6+Ujad/u9TlxYQ==
X-Received: by 2002:a17:90a:4a85:: with SMTP id f5mr30489537pjh.117.1609779870982;
        Mon, 04 Jan 2021 09:04:30 -0800 (PST)
Received: from work ([103.77.37.129])
        by smtp.gmail.com with ESMTPSA id mj5sm22416752pjb.20.2021.01.04.09.04.28
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 04 Jan 2021 09:04:30 -0800 (PST)
Date:   Mon, 4 Jan 2021 22:34:27 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Loic Poulain <loic.poulain@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, bbhatt@codeaurora.org,
        hemantk@codeaurora.org
Subject: Re: [PATCH v8 00/10] mhi: pci_generic: Misc improvements
Message-ID: <20210104170427.GF2256@work>
References: <1609776899-30664-1-git-send-email-loic.poulain@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1609776899-30664-1-git-send-email-loic.poulain@linaro.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Jan 04, 2021 at 05:14:49PM +0100, Loic Poulain wrote:
> This series adjust some configuration values to ensure stability and
> robustness of mhi pci devices (timeout, number of events, burst mode).
> 
> It also includes support for system sleep as well as a recovery procedure
> that can be triggered when a PCI error is reported, either by PCI AER or by
> the new health-check mechanism.
> 
> All these changes have been tested with Telit FN980m module
> 

Series applied to mhi-next!

Thanks,
Mani

> v2:
>   - Cancel recovery work on suspend
> v3:
>   - enable doorbell_mode_switch for burst channel (HW)
>   - Add mhi_initialize_controller helper patch
> v4:
>   - Delete hard reset on module unload, MHI reset is enough (Jeffrey)
>   - Move soc reset support in MHI core (Jeffrey)
>   - burst mode: enable doorbell_mode_switch for HW channels (Bhaumik)
>   - Add diag channels
> v5:
>   - Remove useless call to mhi_initialize_controller in alloc_controller (hemant)
>   - Add define for post reset timeout (hemant)
>   - Fix static misses (hemant)
> v6:
>   - Add debug print in case of recovery success (Mani)
>   - Return error code in case of resume failure (Mani)
> v7:
>   - Removed mhi_initialize_controller API (Mani)
>   - Added controller specific reset callback (Mani)
>   - Reworked error handling using reset_prepare/done (Mani)
> v8:
>   - Rebased on v5.11-rc1
> 
> Loic Poulain (10):
>   bus: mhi: core: Add device hardware reset support
>   mhi: pci-generic: Increase number of hardware events
>   mhi: pci_generic: Enable burst mode for hardware channels
>   mhi: pci_generic: Add support for reset
>   mhi: pci_generic: Add suspend/resume/recovery procedure
>   mhi: pci_generic: Add PCI error handlers
>   mhi: pci_generic: Add health-check
>   mhi: pci_generic: Increase controller timeout value
>   mhi: pci_generic: Add diag channels
>   mhi: pci_generic: Set irq moderation value to 1ms for hw channels
> 
>  drivers/bus/mhi/core/main.c   |  13 ++
>  drivers/bus/mhi/pci_generic.c | 359 +++++++++++++++++++++++++++++++++++++++---
>  include/linux/mhi.h           |   9 ++
>  3 files changed, 361 insertions(+), 20 deletions(-)
> 
> -- 
> 2.7.4
> 
