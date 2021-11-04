Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 317DE444C99
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Nov 2021 01:33:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232972AbhKDAgc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 3 Nov 2021 20:36:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54262 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232877AbhKDAg2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 3 Nov 2021 20:36:28 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B851C035445
        for <linux-arm-msm@vger.kernel.org>; Wed,  3 Nov 2021 17:29:52 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id u11so8605235lfs.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Nov 2021 17:29:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=nwYCCdNtyMbZbSJ/polNoMepOcUeNj/GK8zAIcvz2JU=;
        b=w+mX8Dlt0Oqh39Q6u3BbZgGuN39uDdFFwqteIGeJFxeY7KP+JDAWEOKTCHwrqrPWG4
         C57qa4nCDHC2MLc6XOk2pIS5bQhy/sbQJ0HH/jRE99DlaoN58D0lZh79y7HzKmY3r79v
         PLhwCsJFhrOcljEfe5/D3ZtsMsUWi16U3rNp+v707h9QfFOL57l59BavY2ospKj3UP6k
         fYQlEz3rKgMxr7bqPujRUy3q5XFxDE59q3dboULtm+eCXkmr/4lHlluQ6ljkPdoOScvA
         UCeeadTEbX9rdgHqItJxCHxAEB34/V/QE3NYi3C/XitrMBlzxhLSJ5xsypfmtw+gZX0T
         CHZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nwYCCdNtyMbZbSJ/polNoMepOcUeNj/GK8zAIcvz2JU=;
        b=Hp0yCDHjRVy9T6Q/K7yefm/qflTqq7giOh1iwRFQ9lSXL+xMMY8cYhTSzu8IGbIlBq
         2qM2O1r8G7JyWWMVYQs1I2eUNkcsx6ebsYXWbW9rzBfZ47Rs1KdM3r4+k886b+c1CPgo
         LLoJ7FxdWN9ICrakyZfZ+3hQsUn71ziFvwZBEJ7wKsKuUJfXmUfRX224JVRESY8QbALT
         w9i758RCxyP63cBdHzWiF8SWMdRPOXDXv6cPC6wGcKKBKXbrNebyhEzZaAVf9jde3X5u
         FKIj0KKl1Y6vLh4Z9cGR+0NJJo9rNzRrzId5+vL/HWZHEeAzKNVMC1cLi2KXh+7vx5Bm
         ddpw==
X-Gm-Message-State: AOAM530i1ztNRG6ANsvYkAlER7wqH1+kmlIEsy0aXydwtmB5YpoTM4t4
        dJMgAdUfaiKWTrhtw/wI4m5E2w==
X-Google-Smtp-Source: ABdhPJwM4E0BlTIbGiFtozoyuY+6HFWx3kKyyHBvp/mdOaYBWMb+o2kSvxQdC5MjNapSlN2ZyOIp9A==
X-Received: by 2002:a05:6512:131b:: with SMTP id x27mr42268811lfu.210.1635985791053;
        Wed, 03 Nov 2021 17:29:51 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id 188sm329861ljf.71.2021.11.03.17.29.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Nov 2021 17:29:50 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH 2/5] arm64: dts: qcom: apq8096-db820c: add missing regulator details
Date:   Thu,  4 Nov 2021 03:29:46 +0300
Message-Id: <20211104002949.2204727-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211104002949.2204727-1-dmitry.baryshkov@linaro.org>
References: <20211104002949.2204727-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Specify that S11 (well, whole block of s8+s9+s10+s11) of pm8994 and S2
(s2 + s3) of pmi8994 are supplied by vph_pwr. While we are at it, add
regulator name to S11, so that is displayed as VDD_APCC in the system.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/apq8096-db820c.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/apq8096-db820c.dts b/arch/arm64/boot/dts/qcom/apq8096-db820c.dts
index 7e7b416e7d21..9dbac589482b 100644
--- a/arch/arm64/boot/dts/qcom/apq8096-db820c.dts
+++ b/arch/arm64/boot/dts/qcom/apq8096-db820c.dts
@@ -633,6 +633,8 @@ &pm8994_mpps {
 
 &pm8994_spmi_regulators {
 	qcom,saw-reg = <&saw3>;
+	vdd_s11-supply = <&vph_pwr>;
+
 	s9 {
 		qcom,saw-slave;
 	};
@@ -641,6 +643,7 @@ s10 {
 	};
 	s11 {
 		qcom,saw-leader;
+		regulator-name = "VDD_APCC";
 		regulator-always-on;
 		regulator-min-microvolt = <980000>;
 		regulator-max-microvolt = <980000>;
@@ -673,6 +676,8 @@ pinconf {
 };
 
 &pmi8994_spmi_regulators {
+	vdd_s2-supply = <&vph_pwr>;
+
 	vdd_gfx: s2@1700 {
 		reg = <0x1700 0x100>;
 		regulator-name = "VDD_GFX";
-- 
2.33.0

