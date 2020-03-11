Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2CE581825E5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2020 00:32:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731464AbgCKXcP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 Mar 2020 19:32:15 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:37212 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731459AbgCKXcP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 Mar 2020 19:32:15 -0400
Received: by mail-pg1-f195.google.com with SMTP id a32so1191055pga.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2020 16:32:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZAFxnU3NgpJMRLveB1Jihkaz6R/8FOdMPSF2gijKBWE=;
        b=RQnJ/B/XeSshmnos7GbXMEoonGg2/3cDqgKr1Pp8lC9PlWN7SkhRbcX7KTF7i3dkkZ
         ZnNwYPwTVpxTdi1m9i21YZACZzEdehahf5C8jse8o0DAIa0WHeJ2Cuodt8MExVHa7XC5
         hvOPCnF7rT6SrSdz29jq4rBXUyc8wLhQTEYfIFfJq6cwKWIHEofYDSv5Tpcjc5f3oK5C
         6koZQsAjIwMgnVps0Q6exeHjuc1D/DRvax8MqIe8Ll47uX3X1C/GHUPd/BlhDE6eLSlm
         pNQ3D3PmRgVmJ01pXu8eWHSgXt4CLXsqRlUefG6iN7PZ/Erk/VlsSVC35pJxlmpY1Wyt
         lwfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZAFxnU3NgpJMRLveB1Jihkaz6R/8FOdMPSF2gijKBWE=;
        b=IV9d7xR8jPo9OvNqoA6x82d6NBbk3Ax+7qLnRXnHAOGZXTVMzz1nhU1KB8c7SpZoF3
         7JF9TFqTLpxoTwqcmrQ8TayP4scL7VuO6mLq5C6vzQAxzmN7yuqQudInPwEVYMCig+65
         iUJC1EHY4eJQK8YeNgT/fXKEXOnzt2vpJ3Ns++LGumCIaWo9I+0q2HXDwzfLGiGoZFty
         2RIRIMr2Jnf51tZvtyp1bwWeOsl1vlPFp5Mrsf5V+PVftMeeo3QVtVBUXSYwgf1Grm3d
         GCRxW+hczAYf9V6/fsTorc0FmLLZyJbZf3kDqBY1F/3iIwLDwjtj9EKvcSlr3r+1KhKa
         4udQ==
X-Gm-Message-State: ANhLgQ3JMFMZNPi8DNc4/5jOv49STzjgZ/LumioRG6/kefOBZ2fSROWh
        ev0DeYvJWrIttFU4RzHipQkkbg==
X-Google-Smtp-Source: ADFU+vssJZbi4+8lRsENa/Dx4wELabrI5tBFSOR/chzDO+9tWUirfJxgeaXL9W7NYjIV1v7Tyvfs1Q==
X-Received: by 2002:a63:441e:: with SMTP id r30mr4888212pga.51.1583969532339;
        Wed, 11 Mar 2020 16:32:12 -0700 (PDT)
Received: from localhost.localdomain (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id d77sm40505835pfd.109.2020.03.11.16.32.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2020 16:32:11 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
Cc:     Shawn Guo <shawnguo@kernel.org>, Olof Johansson <olof@lixom.net>,
        Anson Huang <Anson.Huang@nxp.com>,
        Maxime Ripard <maxime@cerno.tech>,
        Dinh Nguyen <dinguyen@kernel.org>,
        Leonard Crestez <leonard.crestez@nxp.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: [PATCH] arm64: defconfig: Enable Truly NT35597 WQXGA panel
Date:   Wed, 11 Mar 2020 16:30:39 -0700
Message-Id: <20200311233039.928605-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The Truly NT35597 WQXGA panel is found on the Qualcomm SDM845 MTP,
enable the driver for it.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index e8be14b93b40..07b57510394b 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -573,6 +573,7 @@ CONFIG_DRM_TEGRA=m
 CONFIG_DRM_PANEL_LVDS=m
 CONFIG_DRM_PANEL_SIMPLE=m
 CONFIG_DRM_DUMB_VGA_DAC=m
+CONFIG_DRM_PANEL_TRULY_NT35597_WQXGA=m
 CONFIG_DRM_SII902X=m
 CONFIG_DRM_THINE_THC63LVD1024=m
 CONFIG_DRM_TI_SN65DSI86=m
-- 
2.24.0

