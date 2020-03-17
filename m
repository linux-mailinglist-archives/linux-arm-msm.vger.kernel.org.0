Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2E5DC188695
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2020 14:58:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726814AbgCQN6E (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 17 Mar 2020 09:58:04 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:45605 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726883AbgCQN6B (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 17 Mar 2020 09:58:01 -0400
Received: by mail-wr1-f67.google.com with SMTP id t2so15748923wrx.12
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2020 06:58:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=UppQrsnlpe86U1iJ2vxLuqmcwC6nQrjDuqLHzwr9eq8=;
        b=n6l/WllNY7yB9vdu0o78Kevuih0X0jlKF33Qac5TIulVecbJJhn04M3bXa5FVZ2Ayj
         nMdI2M0fpHFdBWRa0BhPJzsNtf74iIzJYsfnN/E1j7ud159TZCGIsrMb4PANiVBt/4LX
         JDIvbOBhvc0l5ps5YEzy+FSZY670na89VlTNkUBEPnAT4m+/pqKZCSCBGpNcv48E88W0
         sG19qv8z6WQT4MsCry1difL47JM6xzqgNIUayos0WV1rsSJ3xwsFJb9ciVilyB624Sp5
         OzHf51degqnW+xr8gcVWrV//eDELr22o9g1plb1Y699FSbPxS61/1fq8hycr0Gr9+fK0
         cazQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=UppQrsnlpe86U1iJ2vxLuqmcwC6nQrjDuqLHzwr9eq8=;
        b=iVspNN6wdZ/oTYUomWjwhpmrrEaervnx5zan3CvSHyWPwdfbA4j3pZgD+qk8Vb5DMN
         DEn6dyfdj0HQWRLvDtXrbOJehJaI0/gPUL4ebqauuF1WSaCF2DSHuLJmvWUhvK6/qyxG
         ho6tB+DH71N/y15UEi1zzXPCUaU+zSZJb6EhWkhNxShGhEnzU5CIVlKRK0njdAgTzHgv
         rH4CutHo3r7iO66qVDFk2VQM198vz5fl09FRNxZb+yQ0kF3mnOd6fjsZwproy9pj5oar
         yiiKSLIPh3qv4knqEZmSLMpx+7W0A3L3VrtlGz9kg3xYeM/11dAiKQ3T+UUPOdaprQSi
         mKcA==
X-Gm-Message-State: ANhLgQ1v3Me7otF/4Rj99fJGxUBv8sB9EVWv8mB+Evy2ej/SL8OVM46R
        e4xI9dFurXY1Img4vMmAqirmOA==
X-Google-Smtp-Source: ADFU+vuB83bdRe3honSZVhDGSTt2YdioMyqclnLEVfdMeETbDf0ejd9vEKSvzBHwoB0XWvgcu6GtAg==
X-Received: by 2002:adf:a348:: with SMTP id d8mr6276482wrb.83.1584453479320;
        Tue, 17 Mar 2020 06:57:59 -0700 (PDT)
Received: from xps7590.local ([2a02:2450:102f:13b8:84f7:5c25:a9d8:81a1])
        by smtp.gmail.com with ESMTPSA id r3sm2976558wrn.35.2020.03.17.06.57.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2020 06:57:58 -0700 (PDT)
From:   Robert Foss <robert.foss@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org, robh+dt@kernel.org,
        mark.rutland@arm.com, catalin.marinas@arm.com, will@kernel.org,
        shawnguo@kernel.org, olof@lixom.net, maxime@cerno.tech,
        Anson.Huang@nxp.com, dinguyen@kernel.org, leonard.crestez@nxp.com,
        marcin.juszkiewicz@linaro.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Loic Poulain <loic.poulain@linaro.org>
Cc:     Robert Foss <robert.foss@linaro.org>
Subject: [v2 6/6] arm64: defconfig: Enable QCOM CAMCC, CAMSS and CCI drivers
Date:   Tue, 17 Mar 2020 14:57:40 +0100
Message-Id: <20200317135740.19412-7-robert.foss@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200317135740.19412-1-robert.foss@linaro.org>
References: <20200317135740.19412-1-robert.foss@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Build camera clock, isp and controller drivers as modules.

Signed-off-by: Robert Foss <robert.foss@linaro.org>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 arch/arm64/configs/defconfig | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 4db223dbc549..7cb6989249ab 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -376,6 +376,7 @@ CONFIG_I2C_MESON=y
 CONFIG_I2C_MV64XXX=y
 CONFIG_I2C_OWL=y
 CONFIG_I2C_PXA=y
+CONFIG_I2C_QCOM_CCI=m
 CONFIG_I2C_QCOM_GENI=m
 CONFIG_I2C_QUP=y
 CONFIG_I2C_RK3X=y
@@ -530,6 +531,7 @@ CONFIG_VIDEO_SAMSUNG_S5P_MFC=m
 CONFIG_VIDEO_SAMSUNG_EXYNOS_GSC=m
 CONFIG_VIDEO_RENESAS_FCP=m
 CONFIG_VIDEO_RENESAS_VSP1=m
+CONFIG_VIDEO_QCOM_CAMSS=m
 CONFIG_DRM=m
 CONFIG_DRM_I2C_NXP_TDA998X=m
 CONFIG_DRM_NOUVEAU=m
@@ -732,6 +734,7 @@ CONFIG_MSM_GCC_8994=y
 CONFIG_MSM_MMCC_8996=y
 CONFIG_MSM_GCC_8998=y
 CONFIG_QCS_GCC_404=y
+CONFIG_SDM_CAMCC_845=m
 CONFIG_SDM_GCC_845=y
 CONFIG_SM_GCC_8150=y
 CONFIG_QCOM_HFPLL=y
@@ -762,6 +765,7 @@ CONFIG_QCOM_COMMAND_DB=y
 CONFIG_QCOM_GENI_SE=y
 CONFIG_QCOM_GLINK_SSR=m
 CONFIG_QCOM_RMTFS_MEM=m
+CONFIG_SDM_CAMCC_845=m
 CONFIG_QCOM_RPMH=y
 CONFIG_QCOM_RPMHPD=y
 CONFIG_QCOM_SMEM=y
-- 
2.20.1

