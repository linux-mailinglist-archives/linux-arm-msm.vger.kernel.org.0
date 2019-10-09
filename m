Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1DD00D04AA
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Oct 2019 02:14:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729487AbfJIAOt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 8 Oct 2019 20:14:49 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:40878 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727051AbfJIAOt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 8 Oct 2019 20:14:49 -0400
Received: by mail-pf1-f195.google.com with SMTP id x127so399065pfb.7
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Oct 2019 17:14:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=2daljnqJ+TtRPEyYLJ4e1aRJCyE8bNHOU/f2G9I+p7o=;
        b=gzi+Iqn+b7UyW+Nn5p2dSIEhAAfOdFiPkN+vo4RpC07gdosWLT/KX3vesssNIs1Zi6
         cGPzjR1SNhZm5gov+c5mEkEb7yM3Ub1kxh7Oe3FJC3Pl3By1UgUY8sqqXuXi3lsOmI8m
         DQSd3Fdcpu8+qwy+tS0rVgU391WWmA6aLrcnJS9IPZBH4yVW3L+Dv/3Z1cgOe/YqQSnm
         Cyb82QPumv1lT9O2GRLn/u/Q/MMPvmS4mcDb0X+C6Z3r3O16dkUjJi+y8ot0f1poSCt/
         ZlriLBgN9QW/tXS563BQs3cTeI+MC7Lr55OlDBFudWzjcFij36DsUnPQogs0nxHuTe2L
         U26Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=2daljnqJ+TtRPEyYLJ4e1aRJCyE8bNHOU/f2G9I+p7o=;
        b=JO13nuMJZjryU1nPuK/mL2X173bYCL/yWEkZTAWVqMoTbvXQtY6EKl7+cDR7mor3y8
         +L2ALf1D34sYcAfgAIizxdzBpvWf+xiexOSpyf3h0ZsRMGR+TnCk6rXUYMJUcNnGdPMA
         gje2WNJb3+puCiZFCGWEVWBwp4YkgKy5YD/P9w3qced6NA1LXVF+0JG5e9pWH4rgWjhd
         T5NOU3AirLVkWeHfGnJGLxNYbwYKcvye8xj7QmJxJOsFLJYUhpfVaBXEO89XhsrZeMGS
         Bi+e86f/ovLPkxy5GLXRcdX+FRTADRwsmVJJqHhAIsvWzxHYxfoAaxAH3kEwk+bwgYOa
         Nq5w==
X-Gm-Message-State: APjAAAVFBFYvcl3Iqf1IFXgl4Diy5onbFhDf8mCJRVfNhYeyMxSyE6EJ
        e08b9zx/o+EdMjDNx32I8h+26Q==
X-Google-Smtp-Source: APXvYqxXp6F2cO1CIJ92gpJFgWmn49fZlqWDTCkmzg84veYWn8c3Rr5ldjJ0xnGY2Y06Ve/FVc+wWA==
X-Received: by 2002:a17:90a:2302:: with SMTP id f2mr661674pje.132.1570580087804;
        Tue, 08 Oct 2019 17:14:47 -0700 (PDT)
Received: from localhost.localdomain (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id v3sm241289pfn.18.2019.10.08.17.14.46
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 08 Oct 2019 17:14:47 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
        Olof Johansson <olof@lixom.net>,
        Maxime Ripard <mripard@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Jagan Teki <jagan@amarulasolutions.com>,
        Anson Huang <Anson.Huang@nxp.com>,
        Leonard Crestez <leonard.crestez@nxp.com>,
        Dinh Nguyen <dinguyen@kernel.org>,
        Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, Alex Elder <elder@linaro.org>
Subject: [PATCH] arm64: defconfig: Enable Qualcomm remoteproc dependencies
Date:   Tue,  8 Oct 2019 17:14:42 -0700
Message-Id: <20191009001442.15719-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.18.0
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Enable the the power domains, reset controllers and remote block device
memory access drivers necessary to boot the Audio, Compute and Modem
DSPs on Qualcomm SDM845.

None of the power domains are system critical, but needs to be builtin
as the driver core prohibits probe deferal past late initcall.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 arch/arm64/configs/defconfig | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index c9a867ac32d4..42f042ba1039 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -732,10 +732,13 @@ CONFIG_RPMSG_QCOM_GLINK_SMEM=m
 CONFIG_RPMSG_QCOM_SMD=y
 CONFIG_RASPBERRYPI_POWER=y
 CONFIG_IMX_SCU_SOC=y
+CONFIG_QCOM_AOSS_QMP=y
 CONFIG_QCOM_COMMAND_DB=y
 CONFIG_QCOM_GENI_SE=y
 CONFIG_QCOM_GLINK_SSR=m
+CONFIG_QCOM_RMTFS_MEM=m
 CONFIG_QCOM_RPMH=y
+CONFIG_QCOM_RPMHPD=y
 CONFIG_QCOM_SMEM=y
 CONFIG_QCOM_SMD_RPM=y
 CONFIG_QCOM_SMP2P=y
@@ -780,6 +783,8 @@ CONFIG_PWM_ROCKCHIP=y
 CONFIG_PWM_SAMSUNG=y
 CONFIG_PWM_SUN4I=m
 CONFIG_PWM_TEGRA=m
+CONFIG_RESET_QCOM_AOSS=y
+CONFIG_RESET_QCOM_PDC=m
 CONFIG_RESET_TI_SCI=y
 CONFIG_PHY_XGENE=y
 CONFIG_PHY_SUN4I_USB=y
-- 
2.18.0

