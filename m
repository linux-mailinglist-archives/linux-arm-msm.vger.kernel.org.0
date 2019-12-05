Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4EB7B11448F
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Dec 2019 17:15:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729187AbfLEQPJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 5 Dec 2019 11:15:09 -0500
Received: from mail-wm1-f65.google.com ([209.85.128.65]:50662 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726028AbfLEQPJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 5 Dec 2019 11:15:09 -0500
Received: by mail-wm1-f65.google.com with SMTP id p9so4531567wmg.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Dec 2019 08:15:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=47X1V7vPpUGfZijH5fw+doIEIShAH7EVNX3Y7JRu0ZQ=;
        b=PszjNfyelRsDZc+UOcCatEfKAg3JIX9nhuu1tqaQ4eMcl5HiuouMTwu6Uu+CfBXAYM
         NdUTPBUJi0qDi39CJgHk0oP1BH6VjBHsItRuZuTC8GHO67Cs/BFBZznFP2Kex/VdfPha
         +7clRXcpBM4nHJ0DzlUeZmKiZV04zFeeem6ljsC93PrB4dmJC+drIHRtgywgwndhWxR/
         6iAAK4nJAqmLJqz9RRxmULNxdimsoA773rlW+TsYWo57IE2gSo1rPVaEKFRB9IEfKagh
         X4CVHswQTCd2xaq+WXhMK3MJwIxmF9LJ3BV+eIzkmn5a0MyMQiM2Xj1jl+jAjXPEi9c2
         /nqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=47X1V7vPpUGfZijH5fw+doIEIShAH7EVNX3Y7JRu0ZQ=;
        b=eOaf5rZfu2a+WtF8O+SyFrXpDUCOKnIAKTMOzNvqvWVb08gNpwQlNd+d5nz/Ntp82F
         w4kiVPNVOXJC14iY+7B9ddCdpJ0wtW0M29s5g538zXV9dxpnMOIZzpuOiqsysVbvkQwo
         5bWBPHcksiwRKxSAKZcP/pk5VwQyEsK9sotJhecSGFK29vcFu5U7U3TP148J0FqkY2JL
         4Jy3kIRYS1eCRcwjFXZB9vqkkRinvbROSTopZ11hYWNZkXXeaUFot/vLwqFnOw/yv9K6
         PZCAPu2NI67YIte2uGNN977PnwwG0gt7zUii91WGAbyjxTH/gPI1/r13ObkxYxEMO5v3
         aL3w==
X-Gm-Message-State: APjAAAUeEhB+wcGkY9kyuy8jUpUotLmYbQaM+PK/8ViK5owXzbRcccvi
        HCM2X/L2I5REGnXnemJA/DI=
X-Google-Smtp-Source: APXvYqzxSC9XO3pqS8ydY+zsJufkJE7bzaHXGBv35YE0qlOMCcgxepW/oldk+a3/2hw57PFvuoCmrQ==
X-Received: by 2002:a7b:c8d4:: with SMTP id f20mr6335525wml.56.1575562507107;
        Thu, 05 Dec 2019 08:15:07 -0800 (PST)
Received: from gmail.com (net-37-119-134-251.cust.vodafonedsl.it. [37.119.134.251])
        by smtp.gmail.com with ESMTPSA id j184sm277364wmb.44.2019.12.05.08.15.06
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 05 Dec 2019 08:15:06 -0800 (PST)
From:   Paolo Pisati <p.pisati@gmail.com>
To:     Andy Gross <agross@kernel.org>,
        Amit Pundir <amit.pundir@linaro.org>,
        Manu Gautam <mgautam@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org
Subject: [PATCH 0/6] msm8996: db820c: Fix mmc/ufs and get 5.4 to userspace
Date:   Thu,  5 Dec 2019 17:14:59 +0100
Message-Id: <20191205161505.15295-1-p.pisati@gmail.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

With 5.4 + arm64 defconfig, db820c fails to boot to userspace: crashes
right before mounting rootfs, and resets back to LK (Bjorn pushed a
series of dts changes to support the IFC6640[1] out of msm8996, and i
thought 5.4 was in a good state for this SoC).

To get a basic set of features working (mmc, ufs, eth, usb, etc), i had
to cherry-pick a couple of patches and config changes from Linaro
4.14[2], and revert an upstream qmp patch:

1) these two cherry-picks from Linaro 4.14 fix the broken mmc[3].

clk: qcom: Drop gcc_aggre1_pnoc_ahb_clk clock
arm64: dts: qcom: msm8996: Disable USB2 PHY suspend by core

2) without these =y config changes, UFS refuses to init[4].

arm64: defconfig: PHY_QCOM_QMP=y
arm64: defconfig: PHY_QCOM_QUSB2=y
arm64: defconfig: PHY_QCOM_UFS=y

3) without this upstream revert, pci, ethernet and are wifi dead[5].

Revert "phy: qcom-qmp: Correct ready status, again"

4) with all the above patches applied, msm_drm still complain about
clks, but at least the board is up, running and reachable[6].

Any thoughts from the author of these patches or the ml?
In particular, the =y config changes are bothering me because we
are clearly pushing problems under the rug.

1: https://lkml.org/lkml/2019/10/21/15
2: https://git.linaro.org/landing-teams/working/qualcomm/kernel.git/log/?h=release/qcomlt-4.14
3: https://pastebin.com/DDHvZD6Q
4: https://pastebin.com/hmPVqNqs
5: https://pastebin.com/fMqtH8u5
6: https://pastebin.com/irGv9Qmb

Amit Pundir (1):
  clk: qcom: Drop gcc_aggre1_pnoc_ahb_clk clock

Manu Gautam (1):
  arm64: dts: qcom: msm8996: Disable USB2 PHY suspend by core

Paolo Pisati (4):
  Revert "phy: qcom-qmp: Correct ready status, again"
  arm64: defconfig: PHY_QCOM_QMP=y
  arm64: defconfig: PHY_QCOM_QUSB2=y
  arm64: defconfig: PHY_QCOM_UFS=y

 arch/arm64/boot/dts/qcom/msm8996.dtsi |  4 ++++
 arch/arm64/configs/defconfig          |  5 +++--
 drivers/clk/qcom/gcc-msm8996.c        | 15 ---------------
 drivers/phy/qualcomm/phy-qcom-qmp.c   | 33 +++++++++++++++++----------------
 4 files changed, 24 insertions(+), 33 deletions(-)

-- 
2.7.4

