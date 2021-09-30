Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DC09041E37D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Sep 2021 23:51:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230086AbhI3Vw5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 30 Sep 2021 17:52:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53684 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230051AbhI3Vw5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 30 Sep 2021 17:52:57 -0400
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com [IPv6:2607:f8b0:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CCBEEC06176A
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Sep 2021 14:51:13 -0700 (PDT)
Received: by mail-ot1-x332.google.com with SMTP id c26-20020a056830349a00b0054d96d25c1eso9116111otu.9
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Sep 2021 14:51:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FYmJqhBP9Gy5I1JVDj0HW7OppwoO5pAX8Rg1hw6n6CA=;
        b=YeNEvEBk8SLRom8LultWOuQewDBu1X4/91nIAKjtOyEauCf/W3CvI0biMBm3yZ27iw
         ySMu43hW+BXzYnWZ5aSE7qE5Qd+SIVPqsmhDER1eBFE0yULqvsoEWJ6vOEbbfuSUV+ZY
         VMAiymy275ZtEGn9hUErbiuHm4ePNE2F+NeCfBMsKfeIt+Fx0ojXMnqXp8d6eC7Eoou9
         JVvZ15i8ZvFEHl9v5pPZv2GF6tOahSLL/Vo1A87pCTUvjzvDiBSXduZHYl9ARaCDpBm0
         XkiIE60aSDDz/U9FX+W6Fvwww79dreIf6hjA281+T1sBKeN2au95I1U8m0IFiIvMbBbe
         9cTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FYmJqhBP9Gy5I1JVDj0HW7OppwoO5pAX8Rg1hw6n6CA=;
        b=1BHsd/ocFLaHPtlls3Cw82iupFqN7R3gJir4LU1iYnuOcD0OS2bXhpc3MIuOLtXHWF
         4dM8ze7Ma0Sx53IJiVUn9Q8vEhD+HeA3PSzkUSOlH8xz/4GMeHCHVoFKg1J2AW/KDgtX
         RybG35PxZqt8KtNt8lmtlKwlh00JdkYoi7tYvOpD2Q8KL92ConqK8OJP8v9fPScS0D/+
         c0cn8T0D4lNjD9H0JhDob0FntG4sXpu40MfI24yuEyVaDvmZiwTVwWY3h+j1FC9gYLXl
         C8DRKoi+ulPvDrVJlcUUuAZfnRilyCOku+by066a13If1hVhXNfREPxwbMRE3sGgdRgM
         4FQQ==
X-Gm-Message-State: AOAM530aXTZEmcvdnUWYwnN9hKvaGUSo+RLPTh6CumVkFVAH81cduQfA
        I8Z1KK3lwzM0xbPM0EwN3aIWlw==
X-Google-Smtp-Source: ABdhPJwNJ5kqZrlgIyGNRUEqn1VIxbpJK1XB/LsvhT2fRtitc9fd94G6D8uZQPNl3VcNYORLiYbsjw==
X-Received: by 2002:a05:6830:2706:: with SMTP id j6mr7359200otu.380.1633038673122;
        Thu, 30 Sep 2021 14:51:13 -0700 (PDT)
Received: from localhost.localdomain (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id h1sm846908otm.45.2021.09.30.14.51.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Sep 2021 14:51:12 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Vinod Koul <vkoul@kernel.org>, Arnd Bergmann <arnd@kernel.org>
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, Robin Gong <yibin.gong@nxp.com>
Subject: [PATCH] arm64: defconfig: Disable firmware sysfs fallback
Date:   Thu, 30 Sep 2021 14:53:00 -0700
Message-Id: <20210930215300.60290-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Part of the enablement of SDMA on the IMX platforms, '7f4e4afa140c
("arm64: defconfig: Enable SDMA on i.mx8mq/8mm")' also enabled
CONFIG_FW_LOADER_USER_HELPER_FALLBACK, to allow "firmware loaded by
udev".

Unfortunately having the fallback enabled does, due to the 60 second
timeout, essentially requiring userspace to provide a firmware loader.
But systemd dropped the support for this interface back in 2014 and
because arm64 is the only architecture that has this enabled, there
doesn't seem to be any standard solution available.

Examples of this problem can be found in e.g. the ath10k driver, which
with a standard distro can take about 10 minutes before wlan0 appears.

The alternative to this patch would be to change these drivers to use
firmware_request_direct(), to avoid the sysfs fallback. But that would
prevent other systems, such as Android, to rely on a userspace firmware
loader to pick the firmware from a non-standard place, with just a
custom defconfig.

This patch therefor attempts to align the arm64 defconfig will all other
architectures in the upstream kernel.

Cc: Robin Gong <yibin.gong@nxp.com>
Cc: Shawn Guo <shawnguo@kernel.org>
Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 arch/arm64/configs/defconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index da988a54bfb9..f9e0b3fdaf0b 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -243,7 +243,6 @@ CONFIG_PCI_EPF_TEST=m
 CONFIG_DEVTMPFS=y
 CONFIG_DEVTMPFS_MOUNT=y
 CONFIG_FW_LOADER_USER_HELPER=y
-CONFIG_FW_LOADER_USER_HELPER_FALLBACK=y
 CONFIG_HISILICON_LPC=y
 CONFIG_SIMPLE_PM_BUS=y
 CONFIG_FSL_MC_BUS=y
-- 
2.29.2

