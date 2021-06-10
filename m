Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B3AFF3A2FBD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Jun 2021 17:46:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231942AbhFJPsL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 10 Jun 2021 11:48:11 -0400
Received: from mo4-p00-ob.smtp.rzone.de ([81.169.146.162]:34999 "EHLO
        mo4-p00-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231878AbhFJPrp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 10 Jun 2021 11:47:45 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1623339940; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=rH1ttNdAX2fXm76Hh1ZkP8bSOCqS13dNSEBbnhepXfTa1vheOtK9ytClFCEo27qan7
    0/Vlk+4PRI9t9z4mZjRGm8BHzVS7brnqfX8hlknokEC84ws/jbi29AKxvAeCH2CcTsuM
    wqn6mNHTppXNHA8CpTfzfYOXaivdpI4xQ5lz1Lgad8E2QbO++ieY3f8DK63m9rlkAI+K
    trbNtd0YQjdMww5foO6hZkYOuoD90dtP+accf3I/XJ9xkJrXGknmPDUmIP0ppg5DW821
    Jb4gZQ+lbv6Ria+i8Gw3IYQ9qXjkdQF/0QHWPvGdM+5dNIxJEphibsii2yK8kwwvlfjn
    PrwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1623339940;
    s=strato-dkim-0002; d=strato.com;
    h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=LgNah1Hd5ulVXX6VtdOiftK1WXILSNDtQbgC/NWdrng=;
    b=ZIi55ydcLvNwKel306g+GM5OOrlF5tKyY/XkejqH/rnL2vuH5Kv5pB8oBD6Qtiss8L
    Bv2PJWBfnX/+fYAoR61hsFN7j2X54JQ2DZKQREFL6Ida/0ouqgV93op8XaNCIqjY1QcN
    SBe0Zk6d35trc2Unhb5NOys6pmsQ6Dwc0yYUHEmw3gxbjNFaU+lHHoy90sL15bGA5g7i
    03KdfRRX6pVzONL1Y6mLdM9NUDiARQo5Bz+I2GTRtFNmEOZJ5KeCZrVze5uUIcwhCLLm
    ZoR7Cq+2JcVKPG6LSo/mYEuRNmpEBYfVXZuD3Nq1HPQe4BjM84DP/XXh24v26g6xVMeb
    RN8A==
ARC-Authentication-Results: i=1; strato.com;
    dkim=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1623339940;
    s=strato-dkim-0002; d=gerhold.net;
    h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=LgNah1Hd5ulVXX6VtdOiftK1WXILSNDtQbgC/NWdrng=;
    b=mush8MvESGlv+Mq2p6C7dDWr6b00TlG7ljv5awrjN/RiIwcXEEPBvLMUotD9Ck68ov
    DqLcgvJy6UgXB/aYVp8MgtVsp9NVkcjsnU1fo9w05tLl0PV58h+oXUt3onajbXU+c/dW
    p1ZeKPtLeNFayWo7hN9olA/In63zU57ZNmnhqC+NH6udUyH5rEpu2kt7A8UsSOnZ+Zyz
    3z6D/oDLHocqQMBK66AxdHAWOZsAfgVSzmKUZbwt2wiIJYCjYnfkBWs0I7bi5py4viqS
    pewpyau0QIM/VOSyYWkCz9VCCO8p8EpL+1wyZRISXHux+44lWPVcmDlHjM747aPLVJRJ
    oGtw==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVOQ/OcYgojyw4j34+u26zEodhPgRDZ8nxIc/BaYo="
X-RZG-CLASS-ID: mo00
Received: from gerhold.net
    by smtp.strato.de (RZmta 47.27.2 DYNA|AUTH)
    with ESMTPSA id y01375x5AFjdwZj
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
    Thu, 10 Jun 2021 17:45:39 +0200 (CEST)
Date:   Thu, 10 Jun 2021 17:45:34 +0200
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH 1/5] arm64: dts: qcom: msm8916: Add device tree for
 Huawei Ascend G7
Message-ID: <YMIznk4scPv1qOzP@gerhold.net>
References: <20210514104328.18756-1-stephan@gerhold.net>
 <YMIwovyb9ROfGaET@builder.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YMIwovyb9ROfGaET@builder.lan>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Jun 10, 2021 at 10:32:50AM -0500, Bjorn Andersson wrote:
> On Fri 14 May 05:43 CDT 2021, Stephan Gerhold wrote:
> 
> > The Huawei Ascend G7 is a smartphone from Huawei based on MSM8916.
> > It's fairly similar to the other MSM8916 devices, the only notable
> > exception are the "cd-gpios" for detecting if a SD card was inserted:
> > It looks like Huawei forgot to re-route this to gpio38, so the correct
> > GPIO seems to be gpio56 on this device.
> > 
> > Note: The original firmware from Huawei can only boot 32-bit kernels.
> > To boot arm64 kernels it is necessary to flash 64-bit TZ/HYP firmware
> > with EDL, e.g. taken from the DragonBoard 410c. This works because Huawei
> > forgot to set up (firmware) secure boot for some reason.
> > 
> > Also note that Huawei no longer provides bootloader unlock codes.
> > This can be bypassed by patching the bootloader from a custom HYP firmware,
> > making it think the bootloader is unlocked. I use a modified version of
> > qhypstub [1], that patches a single instruction in the Huawei bootloader.
> > 
> > The device tree contains initial support for the Huawei Ascend G7 with:
> >   - UART (untested, probably available via some test points)
> >   - eMMC/SD card
> >   - Buttons
> >   - Notification LED (combination of 3 GPIO LEDs)
> >   - Vibrator
> >   - WiFi/Bluetooth (WCNSS)
> >   - USB
> > 
> > [1]: https://github.com/msm8916-mainline/qhypstub
> > 
> > Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
> > ---
> >  arch/arm64/boot/dts/qcom/Makefile             |   1 +
> >  .../arm64/boot/dts/qcom/msm8916-huawei-g7.dts | 279 ++++++++++++++++++
> >  2 files changed, 280 insertions(+)
> >  create mode 100644 arch/arm64/boot/dts/qcom/msm8916-huawei-g7.dts
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> > index 456502aeee49..c894de19654e 100644
> > --- a/arch/arm64/boot/dts/qcom/Makefile
> > +++ b/arch/arm64/boot/dts/qcom/Makefile
> > @@ -7,6 +7,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= ipq6018-cp01-c1.dtb
> >  dtb-$(CONFIG_ARCH_QCOM)	+= ipq8074-hk01.dtb
> >  dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-alcatel-idol347.dtb
> >  dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-asus-z00l.dtb
> > +dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-huawei-g7.dtb
> >  dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-longcheer-l8150.dtb
> >  dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-longcheer-l8910.dtb
> >  dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-mtp.dtb
> > diff --git a/arch/arm64/boot/dts/qcom/msm8916-huawei-g7.dts b/arch/arm64/boot/dts/qcom/msm8916-huawei-g7.dts
> > new file mode 100644
> > index 000000000000..d67aa7dd4a21
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/qcom/msm8916-huawei-g7.dts
> > @@ -0,0 +1,279 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> 
> Would it be possible to change this to BSD license instead?
> 

Sorry, I'm not sure I can. :/

This is derived from the other MSM8916 device trees that are
GPL-2.0-only, which are again derived from work that was made by many
other people. I'm not sure I can just put BSD here.

Also, would this really change anything? All the common MSM8916 includes
(msm8916.dtsi, pm8916.dtsi etc) are GPL-2.0-only so the resulting device
tree will forever stay GPL-2.0-only anyway. I think we can only properly
apply BSD to new device trees (unless we could somehow get permission
from all previous contributors).

Personally I would rather have the license consistent for all devices
based on one SoC, everything else will just be confusing for someone who
looks only at this particular file and mistakenly assumes it's
completely available under BSD.

Thanks,
Stephan
