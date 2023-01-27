Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 85B2267E447
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Jan 2023 12:56:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233807AbjA0L4M (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 27 Jan 2023 06:56:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48682 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234143AbjA0Lzd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 27 Jan 2023 06:55:33 -0500
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B6E934EEE
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Jan 2023 03:52:55 -0800 (PST)
Received: by mail-lj1-x233.google.com with SMTP id by7so5261481ljb.6
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Jan 2023 03:52:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+geWY6qVjZfig772ABS5/qXq/ZgJ7dn7lm+IKTyyWoI=;
        b=OMyHpbZ6HsEXqsz63vAd4jHNfBYMOzUxEox4x4gurP8O0BJ3WNDi7Qfju7Qdwg47NQ
         ivENSeZCff6XNNlGgqgzrI4vkWNPIKDBSYo2RZOvtV6lmQigxDq+18EpGXfFCa1MoJPH
         waeigfCMTbN/MfGO1t44svziHIuudDf/rGmDk8h1N527WpTQn+tSiYN5YDHCWF0SAF27
         erqCVpFHDT/g6g8Jpjrni73vdnlsX/zmdSPuByJP/U1wHSigNN8Uj2JNwrR7zyOb3CLR
         8ebi7HH8CzMuaLjenHYUtqpIqUHqnmY0g1br1ykcepRU37Ut1+8vOP5kEW/J9ghEDBDo
         Ds/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+geWY6qVjZfig772ABS5/qXq/ZgJ7dn7lm+IKTyyWoI=;
        b=VNbEQPYJFTF+EmGdEZbxPoJfElRqB2Esxfz/08p9vcVOjWmMV5kZRmbZsqJx4pho5k
         24Elhk+9EckBXuIRM0rvj27kjubVUd/qppjtlH0M5SJgaksyYPUlev99fxQ5byoIWE3B
         A9WV36XTaaxXI9Xvig6IoktVgjNZPEGm8oy8dkmwDLjMGF4XXJPU7jqFCr7izFtzHSbJ
         3WpgD3smeCcuYBpLcghGtiSBv1SbpPpXBITS20Y8BSbr6k3dXy08e/IlxachgqTzzbYu
         q1yhzBihVhdyAKXc0OUQky3zOPlpzR2imegKOEtuhJYXNGoPk0W+p+z2uuueXZQ8Nfha
         7wMA==
X-Gm-Message-State: AFqh2kq9E1jimTBcFKCAk+GLBS5IGp7muqeAfbOHdjpmt3dpM6nI/Le/
        JujOXSV0J1U8l0WxqOZlcaHd5Ka/s3jHUNaQ
X-Google-Smtp-Source: AK7set+DdbYHUvl6CYuPKq1XuN538q52AQpEocIbtSSMPdQoBsz7gj5GUL/KzPkcIOEzfFJF3/xWpA==
X-Received: by 2002:a5d:4911:0:b0:2bf:b217:e365 with SMTP id x17-20020a5d4911000000b002bfb217e365mr11110995wrq.11.1674819851073;
        Fri, 27 Jan 2023 03:44:11 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id z14-20020a5d4c8e000000b002bfc2d0eff0sm3807760wrs.47.2023.01.27.03.44.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jan 2023 03:44:10 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 01/11] ARM: dts: qcom-sdx55: align RPMh regulator nodes with bindings
Date:   Fri, 27 Jan 2023 12:43:37 +0100
Message-Id: <20230127114347.235963-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Device node names should be generic and bindings expect certain pattern
for RPMh regulator nodes.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

See:
https://lore.kernel.org/all/20230112203653.23139-1-quic_molvera@quicinc.com/
---
 arch/arm/boot/dts/qcom-sdx55-mtp.dts             | 2 +-
 arch/arm/boot/dts/qcom-sdx55-t55.dts             | 2 +-
 arch/arm/boot/dts/qcom-sdx55-telit-fn980-tlb.dts | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/qcom-sdx55-mtp.dts b/arch/arm/boot/dts/qcom-sdx55-mtp.dts
index 6f8909731faf..7e97ad5803d8 100644
--- a/arch/arm/boot/dts/qcom-sdx55-mtp.dts
+++ b/arch/arm/boot/dts/qcom-sdx55-mtp.dts
@@ -75,7 +75,7 @@ vreg_s7e_mx_0p752: pmx55-s7e {
 };
 
 &apps_rsc {
-	pmx55-rpmh-regulators {
+	regulators-0 {
 		compatible = "qcom,pmx55-rpmh-regulators";
 		qcom,pmic-id = "e";
 
diff --git a/arch/arm/boot/dts/qcom-sdx55-t55.dts b/arch/arm/boot/dts/qcom-sdx55-t55.dts
index ccf2b8b42b16..d5343bb0daee 100644
--- a/arch/arm/boot/dts/qcom-sdx55-t55.dts
+++ b/arch/arm/boot/dts/qcom-sdx55-t55.dts
@@ -98,7 +98,7 @@ vreg_vddpx_2: vddpx-2 {
 };
 
 &apps_rsc {
-	pmx55-rpmh-regulators {
+	regulators-0 {
 		compatible = "qcom,pmx55-rpmh-regulators";
 		qcom,pmic-id = "e";
 
diff --git a/arch/arm/boot/dts/qcom-sdx55-telit-fn980-tlb.dts b/arch/arm/boot/dts/qcom-sdx55-telit-fn980-tlb.dts
index db7b3d5b0bd0..ad74ecc2a196 100644
--- a/arch/arm/boot/dts/qcom-sdx55-telit-fn980-tlb.dts
+++ b/arch/arm/boot/dts/qcom-sdx55-telit-fn980-tlb.dts
@@ -98,7 +98,7 @@ vreg_vddpx_2: vddpx-2 {
 };
 
 &apps_rsc {
-	pmx55-rpmh-regulators {
+	regulators-0 {
 		compatible = "qcom,pmx55-rpmh-regulators";
 		qcom,pmic-id = "e";
 
-- 
2.34.1

