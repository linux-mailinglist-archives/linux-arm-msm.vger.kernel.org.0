Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A4ABE5957E8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Aug 2022 12:18:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234118AbiHPKR0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 16 Aug 2022 06:17:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41236 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233146AbiHPKQu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 16 Aug 2022 06:16:50 -0400
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72813BD765
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Aug 2022 02:37:18 -0700 (PDT)
Received: by mail-pf1-x42f.google.com with SMTP id u133so8863891pfc.10
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Aug 2022 02:37:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=EGNQJRIPLumZf7DqKjclfQvb9o3UYOp5ZwZhQHSQQ/I=;
        b=Ak9otAjwzHCu40bRgga78Z1a/w5XmFv4rBlwJlUtFg21GblJ0oBlpOoIa+9J4T7eFR
         kC6Isx7q0xBXJ5Nm4ZOWpzGeTFEdUYaRPDGZJow7Dv69qW8L4r/kgxKCw2DRLjz1no0/
         AU68paDW/UbjTlkOTEy/PxeF32eDVKqjUFUB0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=EGNQJRIPLumZf7DqKjclfQvb9o3UYOp5ZwZhQHSQQ/I=;
        b=S1GVVKNT+p53t+Nzdb523gKppl0W7pJTzY06/1ugBkWw51lpjHbp543pd2OHPf4N+l
         7eC4DCmJp7pmQB1USu0XoMFP3oxEtuZyKjoiiKQhhSa5xgCRivEFCabhHxG8K+OFMtux
         9Z9VuVf+JwA0K012Zzh1V+pdLdW09Rnd0MAgTifs2RenNe+xL0eTfJwjX09gE8a1TU53
         7OKP0njMQyZz6uvYzkyQpb3sUeVH2KJP/Mt4L8jbyLS0gJF70HXeXDKcG6f80SBj9NYb
         e3YpcMTEpoSxKgv88eGeGCgDMC/d33ZHmKdaJpI+CggYwtzx+tDVl4cffx/O22YkSlsW
         GgVQ==
X-Gm-Message-State: ACgBeo2FOqzdac7htvBkpbHm9rej8zQszhNhc3dsEhoSbq9QslRCi0yf
        GNaJUSbPl4Bv5iyqYLVxTKzIyg==
X-Google-Smtp-Source: AA6agR5RMR7nwdxfCdO/lQPIYn1JC1RLaj1gHqEjp0p04k8mcgVG7ekoDRkJ8cxSAYn85WAIO+AcgA==
X-Received: by 2002:a05:6a00:1588:b0:52f:a5bb:b992 with SMTP id u8-20020a056a00158800b0052fa5bbb992mr19821980pfk.38.1660642612935;
        Tue, 16 Aug 2022 02:36:52 -0700 (PDT)
Received: from judyhsiao0523.c.googlers.com.com (21.160.199.104.bc.googleusercontent.com. [104.199.160.21])
        by smtp.gmail.com with ESMTPSA id i3-20020aa796e3000000b0052e26b8f610sm7924788pfq.89.2022.08.16.02.36.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Aug 2022 02:36:52 -0700 (PDT)
From:   Judy Hsiao <judyhsiao@chromium.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Srini Kandagatla <srinivas.kandagatla@linaro.org>,
        dianders@chromium.org, mka@chromium.org, cychiang@google.com,
        judyhsiao@google.com, swboyd@chromium.org,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Judy Hsiao <judyhsiao@chromium.org>,
        Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
Subject: [PATCH v2] arm64: dts: qcom: sc7280: Use "PP1800_L2C" as the DMIC power source.
Date:   Tue, 16 Aug 2022 09:36:44 +0000
Message-Id: <20220816093644.764259-1-judyhsiao@chromium.org>
X-Mailer: git-send-email 2.37.1.595.g718a3a8f04-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Use "PP1800_L2C" as the DMIC power source to match the hardware
schematic.
It fixes the DMIC no sound issue of villager-r1.


Co-developed-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
Signed-off-by: Judy Hsiao <judyhsiao@chromium.org>
---
Changes since V1:
    -- Update the commit message.


This patch depends on:
arm64: dts: qcom: sc7280: Add herobrine-villager-r1. [1]

[1]
https://patchwork.kernel.org/patch/12926099/


 .../dts/qcom/sc7280-herobrine-villager-r1.dts | 28 +++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7280-herobrine-villager-r1.dts b/arch/arm64/boot/dts/qcom/sc7280-herobrine-villager-r1.dts
index c03b3ae4de50..983defa7c76d 100644
--- a/arch/arm64/boot/dts/qcom/sc7280-herobrine-villager-r1.dts
+++ b/arch/arm64/boot/dts/qcom/sc7280-herobrine-villager-r1.dts
@@ -12,3 +12,31 @@ / {
 	model = "Google Villager (rev1+)";
 	compatible = "google,villager", "qcom,sc7280";
 };
+
+&lpass_va_macro {
+	vdd-micb-supply = <&pp1800_l2c>;
+};
+
+&sound {
+	audio-routing =
+			"IN1_HPHL", "HPHL_OUT",
+			"IN2_HPHR", "HPHR_OUT",
+			"AMIC1", "MIC BIAS1",
+			"AMIC2", "MIC BIAS2",
+			"VA DMIC0", "vdd-micb",
+			"VA DMIC1", "vdd-micb",
+			"VA DMIC2", "vdd-micb",
+			"VA DMIC3", "vdd-micb",
+			"TX SWR_ADC0", "ADC1_OUTPUT",
+			"TX SWR_ADC1", "ADC2_OUTPUT",
+			"TX SWR_ADC2", "ADC3_OUTPUT",
+			"TX SWR_DMIC0", "DMIC1_OUTPUT",
+			"TX SWR_DMIC1", "DMIC2_OUTPUT",
+			"TX SWR_DMIC2", "DMIC3_OUTPUT",
+			"TX SWR_DMIC3", "DMIC4_OUTPUT",
+			"TX SWR_DMIC4", "DMIC5_OUTPUT",
+			"TX SWR_DMIC5", "DMIC6_OUTPUT",
+			"TX SWR_DMIC6", "DMIC7_OUTPUT",
+			"TX SWR_DMIC7", "DMIC8_OUTPUT";
+
+};
-- 
2.31.0

