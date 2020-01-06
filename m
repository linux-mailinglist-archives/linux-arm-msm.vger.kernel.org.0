Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 03B2613116E
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jan 2020 12:30:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726448AbgAFLaH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 6 Jan 2020 06:30:07 -0500
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.52]:17613 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726303AbgAFLaH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 6 Jan 2020 06:30:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1578310201;
        s=strato-dkim-0002; d=gerhold.net;
        h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=dKbJztBbkmL0YIWEIYJv3XK1TEYnXyCnkL6G2KkOO54=;
        b=kmHt7q3kp9v3y6+RAcZHZlSGkEUiG2/RS08MnN1B6En/FEq4JM7lxXaAq7msjU8tSv
        Rvalz7oYpI1ZuFAbNTu6xksYObF4oNinVjQRn0FqP3KlFzDxp574d538T9MQr0dmj8wQ
        4NSKZNTLpKNt011X17sv4Losjkl2xbeQaTezjDPckipqwJQ5PguuTl9bPMt7JfB/et3X
        SZPTG130HN090C2ekwTLK4Ql83E6EYv20hmId8EL2rmDb+DBfEFDGN7FZpFnofKDWhKG
        69tMt+mHY3vRslRDF5HSvkc5nTMjXqwIawz0yAVCcU49PZhS90h1u8xRIbT58RMSQLHK
        Fs7g==
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVOQ/OcYgojyw4j34+u267EpF+OQRc4ofeF5yQwnE="
X-RZG-CLASS-ID: mo00
Received: from gerhold.net
        by smtp.strato.de (RZmta 46.1.3 AUTH)
        with ESMTPSA id z012abw06BU0mVk
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
        Mon, 6 Jan 2020 12:30:00 +0100 (CET)
Date:   Mon, 6 Jan 2020 12:29:52 +0100
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Elliot Berman <eberman@codeaurora.org>
Cc:     bjorn.andersson@linaro.org, agross@kernel.org, swboyd@chromium.org,
        saiprakash.ranjan@codeaurora.org, tsoni@codeaurora.org,
        sidgup@codeaurora.org, psodagud@codeaurora.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 00/17] Restructure, improve target support for
 qcom_scm driver
Message-ID: <20200106112952.GA900@gerhold.net>
References: <0101016efb7349c0-3c8f33b3-f7d2-46df-9bbb-c8f4401c5bf2-000000@us-west-2.amazonses.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0101016efb7349c0-3c8f33b3-f7d2-46df-9bbb-c8f4401c5bf2-000000@us-west-2.amazonses.com>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Dec 12, 2019 at 06:51:07PM +0000, Elliot Berman wrote:
> This series improves support for 32-bit Qualcomm targets on qcom_scm driver and cleans
> up the driver for 64-bit implementations.
> 

Thanks a lot for working on these patches! Finally no more duplication
of all SCM calls in qcom_scm-32.c and qcom_scm-64.c!

I spent some time testing your patches in different configurations
on my MSM8916 devices.

1. arm64 + SMC_CONVENTION_ARM_32 (MSM8916)
   Seems to work fine except for WCNSS (see my comment on patch 16).
   If you fix it like I suggested, feel free to add my
   Tested-by: Stephan Gerhold <stephan@gerhold.net>

The other configurations are not really (officially) supported by
mainline, but I tested them for the sake of completeness:

2. arm32 + SMC_CONVENTION_LEGACY (MSM8916)
   This is an (unfortunate) device with outdated firmware which can only
   boot arm32 kernels... But mainline is actually working quite well
   when compiled for arm32.

   Since the IOMMU calls were previously unimplemented for the legacy
   convention, the GPU is now working out of the box with your patches.

   Overall it seems to work fine, just same note about WCNSS.

Given that the motivation for this patch series was to support ARM SMCCC
on arm32, I also tried booting arm32 on the device from (1).
I don't care about this particular configuration, but maybe the results help:

3. arm32 + SMC_CONVENTION_ARM_32 (MSM8916)
   It works mostly but not completely. arch/arm/kernel/smccc-call.S does
   not implement ARM_SMCCC_QUIRK_QCOM_A6 (unlike the arm64 version),
   so interrupted SCM calls are not working correctly (see [1]).

   Several SCM calls are failing because of this:
       qcom-wcnss-pil a204000.wcnss: invalid firmware metadata
       remoteproc remoteproc0: Failed to load program segments: -22
       qcom-iommu soc:iommu@1f08000: secure init failed: -22
       qcom-iommu 1ef0000.iommu: secure init failed: -22

   After I changed arch/arm/kernel/smccc-call.S to implement the quirk
   with some hacky assembly everything is working correctly.

Therefore I have one question below:

[1]: https://lore.kernel.org/linux-arm-msm/1485970108-14177-1-git-send-email-andy.gross@linaro.org/

> Currently, the qcom_scm driver supports only 64-bit Qualcomm targets and very
> old 32-bit Qualcomm targets. Newer 32-bit targets use ARM's SMC Calling
> Convention to communicate with secure world. 

Do these "newer 32-bit targets" still require the ARM_SMCCC_QUIRK_QCOM_A6
quirk? If yes, you will need to implement ARM_SMCCC_QUIRK_QCOM_A6 for
arm32 to make everything work correctly.

If not, everything is fine I guess. I don't think anyone (myself included)
will be running an arm32 kernel on an arm64-capable device...

> Older 32-bit targets use a
> "buffer-based" legacy approach for communicating with secure world (as
> implemented in qcom_scm-32.c). All arm64 Qualcomm targets use ARM SMCCC.
> Currently, SMCCC-based communication is enabled only on ARM64 config and
> buffer-based communication only on ARM config. This patch-series combines SMCCC
> and legacy conventions and selects the correct convention by querying the secure
> world [1].
> 
> We decided to take the opportunity as well to clean up the driver rather than
> try to patch together qcom_scm-32 and qcom_scm-64.
> 
> Patches 1-3 and 15 improve macro names, reorder macros/functions, and prune unused
>             macros/functions. No functional changes were introduced.
> Patches 4-8 clears up the SCM abstraction in qcom_scm-64.
> Patches 9-14 clears up the SCM abstraction in qcom_scm-32.
> Patches 16-17 enable dynamically using the different calling conventions.
> 
> [1]: https://source.codeaurora.org/quic/la/kernel/msm-4.9/tree/drivers/soc/qcom/scm.c?h=kernel.lnx.4.9.r28-rel#n555
> 
> Changes since v3:
>  - Updated recepients
> 
> Changes since v2:
>  - Addressed Stephen's comments throughout v2.
>  - Rebased onto latest for-next branch
>  - Removed v2 08/18 (firmware: qcom_scm-64: Remove qcom_scm_call_do_smccc)
>  - Cleaned up the convention query from v2 to align with [1].
> 
> Changes since v1:
>  - Renamed functions/variables per Vinod's suggestions
>  - Split v1 01/17 into v2 [01,02,03]/18 per Vinod's suggestion
>  - Fix suggestions by Bjorn in v1 09/18 (now v2 10/18)
>  - Refactor last 3 commits per Bjorn suggestions in v1 17/18 and v1 10/18
> 
> Changes since RFC:
>  - Fixed missing return values in qcom_scm_call_smccc
>  - Fixed order of arguments in qcom_scm_set_warm_boot_addr
>  - Adjusted logic of SMC convention to properly support older QCOM secure worlds
>  - Boot tested on IFC6410 based on linaro kernel tag:
>    debian-qcom-dragonboard410c-18.01 (which does basic verification of legacy
>    SCM calls: at least warm_boot_addr, cold_boot_addr, and power_down)
> 
> Elliot Berman (17):
>   firmware: qcom_scm: Rename macros and structures
>   firmware: qcom_scm: Apply consistent naming scheme to command IDs
>   firmware: qcom_scm: Remove unused qcom_scm_get_version
>   firmware: qcom_scm-64: Make SMC macros less magical
>   firmware: qcom_scm-64: Move svc/cmd/owner into qcom_scm_desc
>   firmware: qcom_scm-64: Add SCM results struct
>   firmware: qcom_scm-64: Move SMC register filling to
>     qcom_scm_call_smccc
>   firmware: qcom_scm-64: Improve SMC convention detection
>   firmware: qcom_scm-32: Use SMC arch wrappers
>   firmware: qcom_scm-32: Add funcnum IDs
>   firmware: qcom_scm-32: Use qcom_scm_desc in non-atomic calls
>   firmware: qcom_scm-32: Move SMCCC register filling to qcom_scm_call
>   firmware: qcom_scm-32: Create common legacy atomic call
>   firmware: qcom_scm-32: Add device argument to atomic calls
>   firmware: qcom_scm: Order functions, definitions by service/command
>   firmware: qcom_scm: Remove thin wrappers
>   firmware: qcom_scm: Dynamically support SMCCC and legacy conventions
> 
>  drivers/firmware/Kconfig           |   8 -
>  drivers/firmware/Makefile          |   5 +-
>  drivers/firmware/qcom_scm-32.c     | 671 -----------------------------
>  drivers/firmware/qcom_scm-64.c     | 579 -------------------------
>  drivers/firmware/qcom_scm-legacy.c | 242 +++++++++++
>  drivers/firmware/qcom_scm-smc.c    | 151 +++++++
>  drivers/firmware/qcom_scm.c        | 852 +++++++++++++++++++++++++++++--------
>  drivers/firmware/qcom_scm.h        | 178 ++++----
>  include/linux/qcom_scm.h           | 113 ++---
>  9 files changed, 1224 insertions(+), 1575 deletions(-)
>  delete mode 100644 drivers/firmware/qcom_scm-32.c
>  delete mode 100644 drivers/firmware/qcom_scm-64.c
>  create mode 100644 drivers/firmware/qcom_scm-legacy.c
>  create mode 100644 drivers/firmware/qcom_scm-smc.c
> 
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 
