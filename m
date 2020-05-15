Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D5C531D4303
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2020 03:37:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728176AbgEOBhe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 14 May 2020 21:37:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55028 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726090AbgEOBhd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 14 May 2020 21:37:33 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8DCE5C061A0C
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2020 18:37:33 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id a4so241483pgc.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2020 18:37:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=cFLXFjRR5A3gVgBRs/3cq91isvYI/YMEqHqKMfTLIfY=;
        b=ST8ny/aTnC9mJCuv9OK8jmqlpZiMn5kyWYI0wvwNyygnON9LPxQvZtTqf0G/UTNsSJ
         R+CgWeJuedGON5jyUbwwTsKFJW2xBRevUKUY4EsojOOYCogkX4O8OqVbH+jQYQ72qtXH
         LzN9w+jTIbfNxqc6bFlU7ByWxZv8qa4BOq0iYNe6wCetd4n9NZQ7/FtSGKgFYC/EYTA6
         nVR7pMlbnu/VsAQ7JWWd96ppdKWwbCfW62xJ0Wx9oAwr8Yw0AqV5S1pYDQ3c/7pbKbFL
         BKJp7iozPW9djEeW+v8eB/hcGQtQ/A3Z/LbNB1hkGS5bQzLiimnhTjYyrWLHQn8dIOqN
         KHDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=cFLXFjRR5A3gVgBRs/3cq91isvYI/YMEqHqKMfTLIfY=;
        b=Oh/xS8TsUX5azQBOULFRsebduQ9/d2yiY/pM42wiG8SRLS2JioFmLbcu+Ax3KlidTR
         c3ytaEJlG53PN169t2q2sS4XilGjIXpmwpwoznZ/tb96n0DcMU82Ud8Qf/MPwbX1glg9
         7G+evi5ze6fPhHI8sGGhDDGhylbVZcmGxEyiw8i9+sbAJIk0leYFohCGhANx+45ofgKv
         0P++13Dr/N12ybO1oPIfkG4B/v3aVwodCIsqgXrgId3UsqEfF6AZa1gQwMji/P1MkRdE
         adkOh4F29kxmHBYvOxpfMW0qCDJSqULqKpErLC2eGHo9ZtHAyZVIfYuIgx0blU5y0TU0
         eq0g==
X-Gm-Message-State: AOAM531giu4smSByWIPLDnV0NWD1HJCUOERMZB4ZZoicl99xl5MFyWeX
        o/l1GEfbo0W009HJXRFJvW7ohg==
X-Google-Smtp-Source: ABdhPJwyvaj5ekFAeFD+ATcyuEVMe3JjX7TZN9DC+ER6jwn2dLMGDA5bm8BxjR+yi+0EZCWfn9Kn9w==
X-Received: by 2002:a62:76c1:: with SMTP id r184mr1439871pfc.155.1589506652891;
        Thu, 14 May 2020 18:37:32 -0700 (PDT)
Received: from localhost.localdomain (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id c2sm402675pfp.118.2020.05.14.18.37.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2020 18:37:32 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>,
        Wesley Cheng <wcheng@codeaurora.org>
Cc:     Manu Gautam <mgautam@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] phy: qcom-qmp: Ensure register indirection arrays initialized
Date:   Thu, 14 May 2020 18:36:43 -0700
Message-Id: <20200515013643.2081941-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

It's possible that struct qmp_phy_cfg->regs references an array that is
smaller than the possible register lookups that is going to be
performed, with the resulting out-of-bounds read resulting in undefined
behavior.

One such example is when during qcom_qmp_phy_com_init() performs a
qphy_setbits() on entry QPHY_PCS_POWER_DOWN_CONTROL (i.e. 17) with
msm8996_ufsphy_regs_layout only being 12 entries long.

Solve this by inflating all "regs_layout" arrays to ensure that any
remaining entries are zero-initialized, as expected by the code.

Fixes: e4d8b05ad5f9 ("phy: qcom-qmp: Use proper PWRDOWN offset for sm8150 USB")
Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/phy/qualcomm/phy-qcom-qmp.c | 20 +++++++++++---------
 1 file changed, 11 insertions(+), 9 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp.c b/drivers/phy/qualcomm/phy-qcom-qmp.c
index 5942167320a3..c4bf5fd26fa0 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp.c
@@ -120,14 +120,16 @@ enum qphy_reg_layout {
 	QPHY_PCS_LFPS_RXTERM_IRQ_CLEAR,
 	QPHY_PCS_LFPS_RXTERM_IRQ_STATUS,
 	QPHY_PCS_POWER_DOWN_CONTROL,
+	/* Keep last to ensure regs_layout arrays are properly initialized */
+	QPHY_LAYOUT_SIZE
 };
 
-static const unsigned int msm8996_ufsphy_regs_layout[] = {
+static const unsigned int msm8996_ufsphy_regs_layout[QPHY_LAYOUT_SIZE] = {
 	[QPHY_START_CTRL]		= 0x00,
 	[QPHY_PCS_READY_STATUS]		= 0x168,
 };
 
-static const unsigned int pciephy_regs_layout[] = {
+static const unsigned int pciephy_regs_layout[QPHY_LAYOUT_SIZE] = {
 	[QPHY_COM_SW_RESET]		= 0x400,
 	[QPHY_COM_POWER_DOWN_CONTROL]	= 0x404,
 	[QPHY_COM_START_CONTROL]	= 0x408,
@@ -143,7 +145,7 @@ static const unsigned int pciephy_regs_layout[] = {
 	[QPHY_PCS_STATUS]		= 0x174,
 };
 
-static const unsigned int usb3phy_regs_layout[] = {
+static const unsigned int usb3phy_regs_layout[QPHY_LAYOUT_SIZE] = {
 	[QPHY_FLL_CNTRL1]		= 0xc0,
 	[QPHY_FLL_CNTRL2]		= 0xc4,
 	[QPHY_FLL_CNT_VAL_L]		= 0xc8,
@@ -157,7 +159,7 @@ static const unsigned int usb3phy_regs_layout[] = {
 	[QPHY_PCS_LFPS_RXTERM_IRQ_STATUS] = 0x178,
 };
 
-static const unsigned int qmp_v3_usb3phy_regs_layout[] = {
+static const unsigned int qmp_v3_usb3phy_regs_layout[QPHY_LAYOUT_SIZE] = {
 	[QPHY_SW_RESET]			= 0x00,
 	[QPHY_START_CTRL]		= 0x08,
 	[QPHY_PCS_STATUS]		= 0x174,
@@ -166,31 +168,31 @@ static const unsigned int qmp_v3_usb3phy_regs_layout[] = {
 	[QPHY_PCS_LFPS_RXTERM_IRQ_STATUS] = 0x170,
 };
 
-static const unsigned int sdm845_qmp_pciephy_regs_layout[] = {
+static const unsigned int sdm845_qmp_pciephy_regs_layout[QPHY_LAYOUT_SIZE] = {
 	[QPHY_SW_RESET]			= 0x00,
 	[QPHY_START_CTRL]		= 0x08,
 	[QPHY_PCS_STATUS]		= 0x174,
 };
 
-static const unsigned int sdm845_qhp_pciephy_regs_layout[] = {
+static const unsigned int sdm845_qhp_pciephy_regs_layout[QPHY_LAYOUT_SIZE] = {
 	[QPHY_SW_RESET]			= 0x00,
 	[QPHY_START_CTRL]		= 0x08,
 	[QPHY_PCS_STATUS]		= 0x2ac,
 };
 
-static const unsigned int qmp_v4_usb3phy_regs_layout[] = {
+static const unsigned int qmp_v4_usb3phy_regs_layout[QPHY_LAYOUT_SIZE] = {
 	[QPHY_SW_RESET]			= 0x00,
 	[QPHY_START_CTRL]		= 0x44,
 	[QPHY_PCS_STATUS]		= 0x14,
 	[QPHY_PCS_POWER_DOWN_CONTROL]	= 0x40,
 };
 
-static const unsigned int sdm845_ufsphy_regs_layout[] = {
+static const unsigned int sdm845_ufsphy_regs_layout[QPHY_LAYOUT_SIZE] = {
 	[QPHY_START_CTRL]		= 0x00,
 	[QPHY_PCS_READY_STATUS]		= 0x160,
 };
 
-static const unsigned int sm8150_ufsphy_regs_layout[] = {
+static const unsigned int sm8150_ufsphy_regs_layout[QPHY_LAYOUT_SIZE] = {
 	[QPHY_START_CTRL]		= QPHY_V4_PCS_UFS_PHY_START,
 	[QPHY_PCS_READY_STATUS]		= QPHY_V4_PCS_UFS_READY_STATUS,
 	[QPHY_SW_RESET]			= QPHY_V4_PCS_UFS_SW_RESET,
-- 
2.26.2

