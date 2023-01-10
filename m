Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 89F34664C5B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Jan 2023 20:23:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233693AbjAJTXJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 10 Jan 2023 14:23:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59782 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239726AbjAJTWp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 10 Jan 2023 14:22:45 -0500
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 013E21B4
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jan 2023 11:22:44 -0800 (PST)
Received: by mail-wm1-x32d.google.com with SMTP id k22-20020a05600c1c9600b003d1ee3a6289so10910452wms.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jan 2023 11:22:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5zlEq+szaC9jzYJEsHWHt1ai4b91KOiLfW+IEavVvd0=;
        b=HvoTMm1s6sdwPzv8C23cwaqXrMEshROIJmcbTzHuCChp7AhXKL22TQjkA1SJ3L8fLE
         JMoPdfN9B+lz315IGm6RjGH31V5C0jeQfUdkJ/Bv7Pfw2asg1edzfDR4rGB2FbceMJtO
         OBRzt/EkjVTMMoLKzrAkzYev5dlcRcmQq0SL4EoHZxU1vKcu497xOvplcO3m+c4u3ZtM
         fjyHDtjFVvc7rp7AYb9F4H/sHvQgc2zN3sxOKXq5AZ9L5CgAlT2tw/Cx/doiD6nheivN
         bSgw5MSv7TwqqlK9BhcLwOIddmcgmH/EUcnZL7D6JoxYgts8TYd+N88nAYiJ68CLQ4Xl
         PwvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5zlEq+szaC9jzYJEsHWHt1ai4b91KOiLfW+IEavVvd0=;
        b=OxEYK3Vv4hRGy0t1FZQaRH68SywgWnx54Q2wldmuL/0XlkVoz8ilXYo/DX5NGh7t92
         +rY7Q23UoymCi84XZ2PgTJuVyauijGIWsiNlHRc4VF5LWp+NEjoRDDkkxlulmJKfgOOC
         hI+WAxAOlsPt6Vza3Pd0KWihAI3xz9fXsWhzrFUvqrYs2I0pNy64Qq1KJh+R5UuPJFgn
         wYcbMyDmdUQr+PhFOeV1EELiKJ+W4VGXqRNOxovv+Rvg3qOHuQGBpmT5c0+923C6f4dk
         U8Ex4vDlL1UZZGm5s3OXoVIQJIXrIK4aeZAej3maQV/OmWglzPc639L6v2KpEnM4jHFM
         K9BA==
X-Gm-Message-State: AFqh2kog8XJa5TcclmnqyWGW/xmFFlTFi0DnmtDDarnX+fJrftWNx9rU
        jE3p291+RMExkkGQ3Lc/zogcjw==
X-Google-Smtp-Source: AMrXdXtwl+tzR7j30Byk5USB7+6s9fh52dD7EGx7AkK55FEmF+V9UI5OtGX1Xv2Gjx5FtRTuqXuV0Q==
X-Received: by 2002:a7b:c3c6:0:b0:3d2:3376:6f37 with SMTP id t6-20020a7bc3c6000000b003d233766f37mr49599033wmj.10.1673378562582;
        Tue, 10 Jan 2023 11:22:42 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id l14-20020a05600c4f0e00b003d96c811d6dsm22284343wmq.30.2023.01.10.11.22.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jan 2023 11:22:42 -0800 (PST)
From:   Neil Armstrong <neil.armstrong@linaro.org>
Date:   Tue, 10 Jan 2023 20:22:37 +0100
Subject: [PATCH v2 2/3] arm64: dts: qcom: sm8550-mtp: enable display hardware
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230104-topic-sm8550-upstream-dts-display-v2-2-9fbb15263e0d@linaro.org>
References: <20230104-topic-sm8550-upstream-dts-display-v2-0-9fbb15263e0d@linaro.org>
In-Reply-To: <20230104-topic-sm8550-upstream-dts-display-v2-0-9fbb15263e0d@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.11.1
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Enable MDSS/DPU/DSI0 on SM8550-MTP device.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8550-mtp.dts | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8550-mtp.dts b/arch/arm64/boot/dts/qcom/sm8550-mtp.dts
index 8586e16d6079..5b7e301cc2a2 100644
--- a/arch/arm64/boot/dts/qcom/sm8550-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/sm8550-mtp.dts
@@ -359,6 +359,28 @@ vreg_l3g_1p2: ldo3 {
 	};
 };
 
+&dispcc {
+	status = "okay";
+};
+
+&mdss {
+	status = "okay";
+};
+
+&mdss_dsi0 {
+	vdda-supply = <&vreg_l3e_1p2>;
+	status = "okay";
+};
+
+&mdss_dsi0_phy {
+	vdds-supply = <&vreg_l1e_0p88>;
+	status = "okay";
+};
+
+&mdss_mdp {
+	status = "okay";
+};
+
 &pm8550_gpios {
 	sdc2_card_det_n: sdc2-card-det-state {
 		pins = "gpio12";

-- 
2.34.1
