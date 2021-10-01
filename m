Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2718F41F0E2
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Oct 2021 17:12:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354913AbhJAPOh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 1 Oct 2021 11:14:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354867AbhJAPOg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 1 Oct 2021 11:14:36 -0400
Received: from mail-qt1-x833.google.com (mail-qt1-x833.google.com [IPv6:2607:f8b0:4864:20::833])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E7F2C06177C
        for <linux-arm-msm@vger.kernel.org>; Fri,  1 Oct 2021 08:12:52 -0700 (PDT)
Received: by mail-qt1-x833.google.com with SMTP id d8so9235910qtd.5
        for <linux-arm-msm@vger.kernel.org>; Fri, 01 Oct 2021 08:12:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=poorly.run; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5zr3OobeWPDbB43eIxP82xAzyAQPk96HLICMejbx2Ro=;
        b=LNVEaQ7pTm7VaBh9QQpzHYNEUpXgUcY/ayJUSSDUO8lyH2NhPrW8ax0jMQjSRtKV0z
         9buqQyQtxJo4p6FMy0OLE+3s3mAEXyNEMUEjuRw/w4FxPGb6wfwjthlOMWiQ+pdF5pDD
         2ClY2xhZKXeYDSPmYQ/HFqPv/suYAKP7RWB0WdYiSeV4cf+kI3HVFHMH/XkUIAGNCDgx
         js3wtlzXm/vI4tititRm2JmkaKr/wCHUVnefnkeeBr63QrM2NeaATidAy9RkWUMHLHCT
         IH+p5/1lQq6a4V5umxm+MlXf9lfTzvL9KplvE89S0Vfa+83QlyoEf2Sjvn2Up7ICegap
         JN7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5zr3OobeWPDbB43eIxP82xAzyAQPk96HLICMejbx2Ro=;
        b=594TiSSZmHrf5K1SMQN2XdSXodfx6HRBoYJ+cKrwj8w1FcBFj3OLljdbiV8lM+z1m3
         wVXldC2/iBfNOLIYpk3dEvmcTFaLXQYfMv/h0mz3WU/nF058fFxV1tEC8ntVfCh4+1Ct
         /ynFd33wSDiRu1KvhaG2jpyN6GqerODyuF9w+5SrS6vQbpF7ZJ78aUr/jIYfbEW4tQeA
         xoBvd7isDgLLnvU3s7dScX4CJ6nPuKqsPv99g/4WDA299EuK+Y79qqrhg/196GXo28NU
         poZ2fvSOPXAdcisA7u+yfP3k+f2AoNotnuJjh3Whm5ZDatSzaCRZhF7t+G0ZGV5dcaxO
         aNBg==
X-Gm-Message-State: AOAM533PKEQelTsgught5yW9IWP4aN8fNj9OsFomI7XtdXcg45QZRwkj
        N7O7oGyeBc5TAZATwbBwhoyLGA==
X-Google-Smtp-Source: ABdhPJyBZVlKPSTxoaF30k1Yffh0z0OUpyfO1SUldEuXtxsQaxSqtcKpI4aLv84Y6zLhTndZWv1pZw==
X-Received: by 2002:ac8:7959:: with SMTP id r25mr13301003qtt.29.1633101171713;
        Fri, 01 Oct 2021 08:12:51 -0700 (PDT)
Received: from localhost ([167.100.64.199])
        by smtp.gmail.com with ESMTPSA id o5sm1984163qkl.50.2021.10.01.08.12.51
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 01 Oct 2021 08:12:51 -0700 (PDT)
From:   Sean Paul <sean@poorly.run>
To:     dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Cc:     swboyd@chromium.org, jani.nikula@linux.intel.com,
        Sean Paul <seanpaul@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v3 13/14] arm64: dts: qcom: sc7180: Add support for HDCP in dp-controller
Date:   Fri,  1 Oct 2021 11:11:42 -0400
Message-Id: <20211001151145.55916-14-sean@poorly.run>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20211001151145.55916-1-sean@poorly.run>
References: <20211001151145.55916-1-sean@poorly.run>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Sean Paul <seanpaul@chromium.org>

This patch adds the register ranges required for HDCP key injection and
HDCP TrustZone interaction as described in the dt-bindings for the
sc7180 dp controller. Now that these are supported, change the
compatible string to "dp-hdcp".

Signed-off-by: Sean Paul <seanpaul@chromium.org>
Link: https://patchwork.freedesktop.org/patch/msgid/20210913175747.47456-15-sean@poorly.run #v1
Link: https://patchwork.freedesktop.org/patch/msgid/20210915203834.1439-14-sean@poorly.run #v2

Changes in v3:
-Split off into a new patch containing just the dts change (Stephen)
-Add hdcp compatible string (Stephen)
---
 arch/arm64/boot/dts/qcom/sc7180.dtsi | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
index c8921e2d6480..f2d7f3c95c1f 100644
--- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
@@ -3085,10 +3085,12 @@ dsi_phy: dsi-phy@ae94400 {
 			};
 
 			mdss_dp: displayport-controller@ae90000 {
-				compatible = "qcom,sc7180-dp";
+				compatible = "qcom,sc7180-dp-hdcp";
 				status = "disabled";
 
-				reg = <0 0x0ae90000 0 0x1400>;
+				reg = <0 0x0ae90000 0 0x1400>,
+				      <0 0x0aed1000 0 0x174>,
+				      <0 0x0aee1000 0 0x2c>;
 
 				interrupt-parent = <&mdss>;
 				interrupts = <12>;
-- 
Sean Paul, Software Engineer, Google / Chromium OS

