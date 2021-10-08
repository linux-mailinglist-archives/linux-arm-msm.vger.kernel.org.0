Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8280A427169
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Oct 2021 21:27:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240659AbhJHT3C (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 8 Oct 2021 15:29:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59890 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240480AbhJHT27 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 8 Oct 2021 15:28:59 -0400
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com [IPv6:2607:f8b0:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF0DAC061755
        for <linux-arm-msm@vger.kernel.org>; Fri,  8 Oct 2021 12:27:03 -0700 (PDT)
Received: by mail-ot1-x335.google.com with SMTP id w10-20020a056830280a00b0054e4e6c85a6so3898324otu.5
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 Oct 2021 12:27:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=At+rzAF9JxliFGjcUgoCAeEDAuwuDjjyfL8d49BtplE=;
        b=wxctF5hXYa0N79Ws1NmAATw4BqGCV9oYImePuBFjconnTc3/551vNWtiMD4qiUnRek
         keuE4Hx+jRJ2ETervwUL1uSEqtxuA09JBA/Oi7XUrz1aBnyNEGFA7yLiFm/l46K/ihGM
         pDfb/lT+zGw4WxKqKrKFaZM41xCZyf1IKQXfATwTLN43V94gsAmHLAbIYMO1XgG38VOt
         3EXnLqCSpe5cgeVBJFeDa//fIRmHtzb89i/zbwDDoElGirfxrvDJMj97P+uBVD5khBr0
         UhxJVuvYUZcg6gT7EDzjStgiQtlG+4WyfjXrWgYTwoOYPc5ZBgZkan3e2IK4VwkWLdIb
         yX2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=At+rzAF9JxliFGjcUgoCAeEDAuwuDjjyfL8d49BtplE=;
        b=niIzZXB8061wgVOqsDp37N5MJptEztWw6sxex8yuzFPPkB0ULFl1jRg71YfdAvx4vf
         tXR+k6hyimCyr29oJV+nS1HRqpGQ8JLpvsGkEAiSTUAKz1vJifSp/jeBhfku+jbVbpBL
         uwkrNDx6VUKx0NcBXXB7fTUDnTpwXDHPFNwe2MtjAPfaUiZ8qqPozOCbHIUeHFhWa+Uw
         YbnIQ7c08PAxfhKZEghvBYRdZZhAYLegCXIK2GhXzWd85cpZYWxuh9eP5vt3Sn1dWxYH
         b+ZI6VEkgKgONZPQNPBvav8ExHthQNbxhnCMDGCP9xFmTcu6KINwFPZfy4z1gmZ9tLGF
         fyqA==
X-Gm-Message-State: AOAM530u7xJg5BQtplCK60LXAmzN9Q7aeScAcTg7UXRx09MSTKiXh044
        1x452sQZV/KKqa5M7V/hbAeq4w==
X-Google-Smtp-Source: ABdhPJyWpJLxOkZw0kyBxjYbEJdbXbpNO4H5eRTVP0sIn+HSfMN83JCI/sRWOF10LiWtStfKiX28ag==
X-Received: by 2002:a9d:6a85:: with SMTP id l5mr10697270otq.122.1633721223062;
        Fri, 08 Oct 2021 12:27:03 -0700 (PDT)
Received: from localhost.localdomain ([2600:1700:a0:3dc8:205:1bff:fec0:b9b3])
        by smtp.gmail.com with ESMTPSA id f2sm58397oia.44.2021.10.08.12.27.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Oct 2021 12:27:02 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Stephan Gerhold <stephan@gerhold.net>
Subject: [PATCH] arm64: defconfig: Enable Qualcomm prima/pronto drivers
Date:   Fri,  8 Oct 2021 12:28:40 -0700
Message-Id: <20211008192840.3593362-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The Qualcomm prima/pronto drivers consists of a remoteproc driver boot
the combined WiFi and Bluetooth firmware on the related co-processor, a
control driver to load calibration and settings firmware, the wcn36xx
WiFi driver and the SMD based Bluetooth driver.

Enable these in the defconfig to provide Bluetooth and WiFi on devices
such as the Qualcomm Dragonboard 410c.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 arch/arm64/configs/defconfig | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 39a448e9edd3..c39c96f14208 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -201,6 +201,7 @@ CONFIG_BT_HCIUART=m
 CONFIG_BT_HCIUART_LL=y
 CONFIG_BT_HCIUART_BCM=y
 CONFIG_BT_HCIUART_QCA=y
+CONFIG_BT_QCOMSMD=m
 CONFIG_CFG80211=m
 CONFIG_MAC80211=m
 CONFIG_MAC80211_LEDS=y
@@ -380,6 +381,7 @@ CONFIG_USB_NET_MCS7830=m
 CONFIG_ATH10K=m
 CONFIG_ATH10K_PCI=m
 CONFIG_ATH10K_SNOC=m
+CONFIG_WCN36XX=m
 CONFIG_BRCMFMAC=m
 CONFIG_MWIFIEX=m
 CONFIG_MWIFIEX_PCIE=m
@@ -1020,6 +1022,8 @@ CONFIG_REMOTEPROC=y
 CONFIG_QCOM_Q6V5_MSS=m
 CONFIG_QCOM_Q6V5_PAS=m
 CONFIG_QCOM_SYSMON=m
+CONFIG_QCOM_WCNSS_PIL=m
+CONFIG_RPMSG_CHAR=m
 CONFIG_RPMSG_QCOM_GLINK_RPM=y
 CONFIG_RPMSG_QCOM_GLINK_SMEM=m
 CONFIG_RPMSG_QCOM_SMD=y
@@ -1043,6 +1047,7 @@ CONFIG_QCOM_SMD_RPM=y
 CONFIG_QCOM_SMP2P=y
 CONFIG_QCOM_SMSM=y
 CONFIG_QCOM_SOCINFO=m
+CONFIG_QCOM_WCNSS_CTRL=m
 CONFIG_QCOM_APR=m
 CONFIG_ARCH_R8A774A1=y
 CONFIG_ARCH_R8A774B1=y
-- 
2.29.2

