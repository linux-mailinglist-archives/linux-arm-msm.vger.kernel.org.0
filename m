Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 58586690502
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Feb 2023 11:37:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230172AbjBIKhM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 9 Feb 2023 05:37:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56314 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229798AbjBIKgy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 9 Feb 2023 05:36:54 -0500
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A56D51D918
        for <linux-arm-msm@vger.kernel.org>; Thu,  9 Feb 2023 02:35:53 -0800 (PST)
Received: by mail-wr1-x42a.google.com with SMTP id a2so1282825wrd.6
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Feb 2023 02:35:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ORVNcn4oxDxrIgNoJAZMZAddQO7WzsSVyVftEEFXVZc=;
        b=ARkQp7pqtoU5/edfv/LIOMfL1rANrThzYg2Q7UhFbsZUlk9B++ZtZ+38f0OAHnA2sw
         xe5ettuBllKQF+9EKMGZEE0ZTth4fF7rk+J97ZS24rmwyW7gLr2u6fvInAs2UdQAYcUe
         UxCgLACQhpMwAECKfTE43r7u0tyWT+6MI88EWvrwa5d7DZ8yCR3uQXEJSeHx3RkO5/5K
         5aNnis00UKXbTI2GTjvOy5O6A0iBUmMU9+zTNcyPx5nPu89nauOIlGNR5+sxaFhdquay
         +dxBTU/5RS8q6iHlX+2yZpD2BiMf7HPudsIdSGpejUB/wj2JobT7yjlnigiEP4yoBjG+
         jklQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ORVNcn4oxDxrIgNoJAZMZAddQO7WzsSVyVftEEFXVZc=;
        b=YkwW86Y/fI483qC4kVXAEIGs1KzPhzwzzRAKmR/UOf3WQEJ+2+J70Qm7aggpQRfu0T
         HkY/8uKUqrkFcxZ9koDSbNWMOAM9efNCl+eCBGXBN3FWwgUcaj75Qqy5zUKzPOy/JYQz
         MCXU3/YSQ99RczMYDdpGeGX3FmETdx2B8kpy5S0cqj305sjnTmOjZtQAteSQlqa8EuDJ
         3b9l2Q1jBznBhhTTvWO5utSsCwN700OyteLQwh4cFeP4CCGcEB5xEe+n4GpUExIe4H1M
         aXcNfHpjHL1Ic/e3haIAOGY4wOM68h8IUNwIOSQa1Kt+lj6l99nXywTggd0/ilTmJ0/f
         FHEQ==
X-Gm-Message-State: AO0yUKWURs8bZ0oMIXOrbek9kSo+UX3qe5bNum+WlE5+UuyNrum2SwFG
        CPjMKejpe5wAZT35uKpEt9kPug==
X-Google-Smtp-Source: AK7set/aAk+ledm936AmdP3OuiMsRJouZPnmlakdUvbPZubu3gD9jQNNJnXeanjM9cnV9Y1S+OFxSA==
X-Received: by 2002:adf:eccb:0:b0:2c3:f7a9:e71a with SMTP id s11-20020adfeccb000000b002c3f7a9e71amr8347235wro.30.1675938934344;
        Thu, 09 Feb 2023 02:35:34 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:7e6e:bfb6:975d:225b])
        by smtp.gmail.com with ESMTPSA id a6-20020a056000100600b0029a06f11022sm890602wrx.112.2023.02.09.02.35.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Feb 2023 02:35:34 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Bjorn Andersson <quic_bjorande@quicinc.com>,
        Shawn Guo <shawnguo@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [RESEND PATCH] arm64: defconfig: enable drivers required by the Qualcomm SA8775P platform
Date:   Thu,  9 Feb 2023 11:35:31 +0100
Message-Id: <20230209103531.469809-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Enable the pinctrl, GCC clock and interconnect drivers in order to allow
booting SA8775P boards. The drivers need to be built-in for QUPv3 and
subsequently UART console to work.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Resending with tags collected and this time Cc'ing linux-arm-msm

 arch/arm64/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 695c4e44d241..8e0ce9915f01 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -566,6 +566,7 @@ CONFIG_PINCTRL_QCM2290=y
 CONFIG_PINCTRL_QCS404=y
 CONFIG_PINCTRL_QDF2XXX=y
 CONFIG_PINCTRL_QCOM_SPMI_PMIC=y
+CONFIG_PINCTRL_SA8775P=y
 CONFIG_PINCTRL_SC7180=y
 CONFIG_PINCTRL_SC7280=y
 CONFIG_PINCTRL_SC8180X=y
@@ -1378,6 +1379,7 @@ CONFIG_INTERCONNECT_QCOM_MSM8916=m
 CONFIG_INTERCONNECT_QCOM_MSM8996=m
 CONFIG_INTERCONNECT_QCOM_OSM_L3=m
 CONFIG_INTERCONNECT_QCOM_QCS404=m
+CONFIG_INTERCONNECT_QCOM_SA8775P=y
 CONFIG_INTERCONNECT_QCOM_SC7180=y
 CONFIG_INTERCONNECT_QCOM_SC7280=y
 CONFIG_INTERCONNECT_QCOM_SC8180X=y
-- 
2.37.2

