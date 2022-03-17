Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5B88E4DBBB1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Mar 2022 01:28:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350024AbiCQA3q (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 16 Mar 2022 20:29:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37742 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349978AbiCQA3o (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 16 Mar 2022 20:29:44 -0400
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68E131C932
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Mar 2022 17:28:27 -0700 (PDT)
Received: by mail-pj1-x1030.google.com with SMTP id m22so3589712pja.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Mar 2022 17:28:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=s7sITGOccSSxXbU5IqO/h2LY98v91UmNuWsJwF4ndG0=;
        b=WDLX8RusToDhguFb9R+rCWHeuiQ9xj1U0FmX3/jNDcQHvip5vREM6uhQ0SlzUIIT2j
         Ph2NU9QMfsX+77WZ2mKP8w46ikhcXVC7eVnPTkNSJ+82v4hh+/sAEertJqaOCgn6qI4U
         oIuPVUAvZacjdffC/1xVdem7LqSICRDZe+ltE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=s7sITGOccSSxXbU5IqO/h2LY98v91UmNuWsJwF4ndG0=;
        b=UAHw6TzCDQojJBDKqFjB0teEmsystlsJrXKeYuJTbNH5+mZ44k+HFdOCD3a4+Jwh0v
         ULZnlgHPWxRUZsBI6kC6u0nBFL83+NiNRtGGwD7TJjcdscNWFJGqZiohg2rPf+CHv4qw
         dilXiooPTHR33DPTdoaIJ+LV57Vk7lHywxYJA8OzGkGjC0jY2JAbQabGLH+nSTxHJh9h
         F7ZUbYBc+Irf1WnG2Uk2MQcNQBgBvIPwQ7t17mny69cZUrqYifAMHSiMC6D94giLJI3N
         wx1m5++kzDPbkxHinv7rUaTQYSYo2uVSMcIGu890oIu2KlmEw1h9dJQoEetwcKe4AhJ4
         ehMg==
X-Gm-Message-State: AOAM530UA9STgCJsHBYwBv8vXexa7p5bVr31QY5RPn5kPty7DErZsqcN
        9LU+W9FMAFs5ySI/gcttfMthZg==
X-Google-Smtp-Source: ABdhPJxoDEonzZLvxbRJfDVLNOwBp6GF5KVNLA9ru3wOYbA5CpXQ2CMarPevTUmhXDQpypumPPymGA==
X-Received: by 2002:a17:903:32c3:b0:152:c1b:e840 with SMTP id i3-20020a17090332c300b001520c1be840mr2494389plr.40.1647476906946;
        Wed, 16 Mar 2022 17:28:26 -0700 (PDT)
Received: from localhost ([2620:15c:202:201:3314:2f99:65d0:5a73])
        by smtp.gmail.com with UTF8SMTPSA id x16-20020a637c10000000b00380b351aaacsm3396764pgc.16.2022.03.16.17.28.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Mar 2022 17:28:26 -0700 (PDT)
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Stephen Boyd <swboyd@chromium.org>, devicetree@vger.kernel.org,
        Douglas Anderson <dianders@chromium.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Matthias Kaehlcke <mka@chromium.org>
Subject: [PATCH v1 1/4] arm64: dts: qcom: sc7280: Rename crd to crd-r3
Date:   Wed, 16 Mar 2022 17:28:17 -0700
Message-Id: <20220316172814.v1.1.I2deda8f2cd6adfbb525a97d8fee008a8477b7b0e@changeid>
X-Mailer: git-send-email 2.35.1.723.g4982287a31-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

There are multiple revisions of CRD boards. The current sc7280-crd.dts
describes revision 3 and 4 (aka CRD 1.0 and 2.0). Support for a newer
version will be added by another patch. Add the revision number to
distinguish it from the versionn. Also add the revision numbers to
the compatible string.

Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
---

 arch/arm64/boot/dts/qcom/Makefile                             | 2 +-
 .../arm64/boot/dts/qcom/{sc7280-crd.dts => sc7280-crd-r3.dts} | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)
 rename arch/arm64/boot/dts/qcom/{sc7280-crd.dts => sc7280-crd-r3.dts} (91%)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index f9e6343acd03..38d41b1d70ad 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -87,7 +87,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sc7280-herobrine-herobrine-r0.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sc7280-herobrine-herobrine-r1.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sc7280-idp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sc7280-idp2.dtb
-dtb-$(CONFIG_ARCH_QCOM)	+= sc7280-crd.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= sc7280-crd-r3.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sdm630-sony-xperia-ganges-kirin.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sdm630-sony-xperia-nile-discovery.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sdm630-sony-xperia-nile-pioneer.dtb
diff --git a/arch/arm64/boot/dts/qcom/sc7280-crd.dts b/arch/arm64/boot/dts/qcom/sc7280-crd-r3.dts
similarity index 91%
rename from arch/arm64/boot/dts/qcom/sc7280-crd.dts
rename to arch/arm64/boot/dts/qcom/sc7280-crd-r3.dts
index e2efbdde53a3..7a028b9248c3 100644
--- a/arch/arm64/boot/dts/qcom/sc7280-crd.dts
+++ b/arch/arm64/boot/dts/qcom/sc7280-crd-r3.dts
@@ -11,8 +11,8 @@
 #include "sc7280-idp-ec-h1.dtsi"
 
 / {
-	model = "Qualcomm Technologies, Inc. sc7280 CRD platform";
-	compatible = "qcom,sc7280-crd", "google,hoglin", "qcom,sc7280";
+	model = "Qualcomm Technologies, Inc. sc7280 CRD platform (rev3 - 4)";
+	compatible = "qcom,sc7280-crd", "google,hoglin-rev3", "google,hoglin-rev4", "qcom,sc7280";
 
 	aliases {
 		serial0 = &uart5;
-- 
2.35.1.723.g4982287a31-goog

