Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E91259AF04
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Aug 2019 14:17:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2394414AbfHWMRC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 23 Aug 2019 08:17:02 -0400
Received: from onstation.org ([52.200.56.107]:50842 "EHLO onstation.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2394397AbfHWMRC (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 23 Aug 2019 08:17:02 -0400
Received: from localhost.localdomain (wsip-184-191-162-253.sd.sd.cox.net [184.191.162.253])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: masneyb)
        by onstation.org (Postfix) with ESMTPSA id 23D7C3E8A5;
        Fri, 23 Aug 2019 12:17:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=onstation.org;
        s=default; t=1566562621;
        bh=6Hv11UScrKxg7gOfOYLlr900WEfm2Wpv89bnNSptn6E=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=VFhXpCcAn5aoWr0Ip/RmGAFhGMunRFiH8tjLLKOgW0v6kgjPOYk61dWS/K2WaiEhl
         SabT9AuI9s52v1PSl+PxXz5HwNTBlTIj36ID2vVWI6UShqNoSNC6H8u5ggNhQPJqBB
         q72bulKWIkrzA9vWrvtaQZFE7k62hoK0LXgtGoSI=
From:   Brian Masney <masneyb@onstation.org>
To:     agross@kernel.org, robdclark@gmail.com, sean@poorly.run,
        robh+dt@kernel.org, bjorn.andersson@linaro.org
Cc:     airlied@linux.ie, daniel@ffwll.ch, mark.rutland@arm.com,
        jonathan@marek.ca, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        jcrouse@codeaurora.org
Subject: [PATCH v7 7/7] ARM: qcom_defconfig: add ocmem support
Date:   Fri, 23 Aug 2019 05:16:37 -0700
Message-Id: <20190823121637.5861-8-masneyb@onstation.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190823121637.5861-1-masneyb@onstation.org>
References: <20190823121637.5861-1-masneyb@onstation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add ocmem driver that's needed for some a3xx and a4xx based systems.

Signed-off-by: Brian Masney <masneyb@onstation.org>
---
Changes since v6:
- None

Changes since v5:
- None

This patch was introduced in v5.

 arch/arm/configs/qcom_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/configs/qcom_defconfig b/arch/arm/configs/qcom_defconfig
index 34433bf5885d..595e1910ba78 100644
--- a/arch/arm/configs/qcom_defconfig
+++ b/arch/arm/configs/qcom_defconfig
@@ -225,6 +225,7 @@ CONFIG_QCOM_WCNSS_PIL=y
 CONFIG_RPMSG_CHAR=y
 CONFIG_RPMSG_QCOM_SMD=y
 CONFIG_QCOM_GSBI=y
+CONFIG_QCOM_OCMEM=y
 CONFIG_QCOM_PM=y
 CONFIG_QCOM_SMEM=y
 CONFIG_QCOM_SMD_RPM=y
-- 
2.21.0

