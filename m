Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E88DA8BBE4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Aug 2019 16:46:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729732AbfHMOqg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 13 Aug 2019 10:46:36 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:50974 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729731AbfHMOqf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 13 Aug 2019 10:46:35 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id A85E760D35; Tue, 13 Aug 2019 14:46:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1565707594;
        bh=2IoyEMqIXK1S5ig0MQsZwXaRBSkNTdyKo/J01X/b8o4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=e8yB4kQplmaqGkC4+8We5ZhYHkxl3Buxb8spHCWAxkyN1YYWMCb/9bATg8zOHNckK
         L6/BTxFGGB60QDD7v0Apnj+In6lNNJx+Q2edQqL+INNvTsQxjYJ+LjHMAQCiO7Xrxw
         xFyFg2oxpPVulfLMxyCKNR2L7WPrRcd92DHW6zWg=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from jcrouse1-lnx.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jcrouse@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id DDA83608FF;
        Tue, 13 Aug 2019 14:46:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1565707593;
        bh=2IoyEMqIXK1S5ig0MQsZwXaRBSkNTdyKo/J01X/b8o4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Oj2alQPlJikRq38cn+AQr57B198EMQJbTPoCBATnYp9x6QUiMvPZsxsKmGkDwQUtF
         mDTQC/KCsFYs54Y0Q2ta2pkXSSBUXKKqIkx7Y+br313ufb0NQK5mSrdJyafiQKEsR8
         OU3Fvsthkx8IrWwUQshL554z9DoIEIM5OWgBlqXQ=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org DDA83608FF
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=jcrouse@codeaurora.org
From:   Jordan Crouse <jcrouse@codeaurora.org>
To:     freedreno@lists.freedesktop.org
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Leonard Crestez <leonard.crestez@nxp.com>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Olof Johansson <olof@lixom.net>,
        Dinh Nguyen <dinguyen@kernel.org>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        Will Deacon <will@kernel.org>,
        Jagan Teki <jagan@amarulasolutions.com>,
        Fabrice Gasnier <fabrice.gasnier@st.com>,
        Russell King <linux@armlinux.org.uk>,
        Shawn Guo <shawnguo@kernel.org>,
        Simon Horman <horms+renesas@verge.net.au>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        =?UTF-8?q?Yannick=20Fertr=C3=A9?= <yannick.fertre@st.com>,
        Maxime Ripard <mripard@kernel.org>,
        Alexandre Torgue <alexandre.torgue@st.com>,
        linux-kernel@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Brian Masney <masneyb@onstation.org>,
        Frank Rowand <frank.rowand@sony.com>,
        Tony Lindgren <tony@atomide.com>,
        Anson Huang <Anson.Huang@nxp.com>
Subject: [PATCH v2 2/2] arm: Add DRM_MSM to defconfigs with ARCH_QCOM
Date:   Tue, 13 Aug 2019 08:46:25 -0600
Message-Id: <1565707585-5359-2-git-send-email-jcrouse@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1565707585-5359-1-git-send-email-jcrouse@codeaurora.org>
References: <1565707585-5359-1-git-send-email-jcrouse@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Now that CONFIG_DRM_MSM is no longer default 'y' add it as a module to all
ARCH_QCOM enabled defconfigs to restore the previous expected build
behavior.

Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
---

 arch/arm/configs/multi_v7_defconfig | 1 +
 arch/arm/configs/qcom_defconfig     | 1 +
 arch/arm64/configs/defconfig        | 1 +
 3 files changed, 3 insertions(+)

diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index b0a0568..12dfdab 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -635,6 +635,7 @@ CONFIG_DRM_ATMEL_HLCDC=m
 CONFIG_DRM_RCAR_DU=m
 CONFIG_DRM_RCAR_LVDS=y
 CONFIG_DRM_SUN4I=m
+CONFIG_DRM_MSM=m
 CONFIG_DRM_FSL_DCU=m
 CONFIG_DRM_TEGRA=y
 CONFIG_DRM_STM=m
diff --git a/arch/arm/configs/qcom_defconfig b/arch/arm/configs/qcom_defconfig
index 34433bf..02f1e7b 100644
--- a/arch/arm/configs/qcom_defconfig
+++ b/arch/arm/configs/qcom_defconfig
@@ -147,6 +147,7 @@ CONFIG_REGULATOR_QCOM_SMD_RPM=y
 CONFIG_REGULATOR_QCOM_SPMI=y
 CONFIG_MEDIA_SUPPORT=y
 CONFIG_DRM=y
+CONFIG_DRM_MSM=m
 CONFIG_DRM_PANEL_SIMPLE=y
 CONFIG_FB=y
 CONFIG_FRAMEBUFFER_CONSOLE=y
diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 1cd66cf..4fec7a9 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -531,6 +531,7 @@ CONFIG_DRM_RCAR_DU=m
 CONFIG_DRM_SUN4I=m
 CONFIG_DRM_SUN8I_DW_HDMI=m
 CONFIG_DRM_SUN8I_MIXER=m
+CONFIG_DRM_MSM=m
 CONFIG_DRM_TEGRA=m
 CONFIG_DRM_PANEL_SIMPLE=m
 CONFIG_DRM_SII902X=m
-- 
2.7.4

