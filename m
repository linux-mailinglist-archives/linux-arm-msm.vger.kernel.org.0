Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 67EA4612B8D
	for <lists+linux-arm-msm@lfdr.de>; Sun, 30 Oct 2022 17:16:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229665AbiJ3QQR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 30 Oct 2022 12:16:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229494AbiJ3QQR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 30 Oct 2022 12:16:17 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 33BAC65E4
        for <linux-arm-msm@vger.kernel.org>; Sun, 30 Oct 2022 09:16:16 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id t4so2762732lfp.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 30 Oct 2022 09:16:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KG9nW6QZ+nRTJl8Lw6nATA7KbiGGQOwaWs6dE7XfSMg=;
        b=S3x1lXOc2gPwe3jD78QMDw00kyiI8IJkY6HZ69eTqBttaq4zf7vdDw0v5bgKISqfSh
         o7lVMzhFFxZJ2fKU5f8IVTYqOpNHapoDaKoBAfRGLRN/KZ5dwTL0gHji5zmdGkxi3kC0
         zR/bC8Ys/quQo1fFtt9M28YvwMfyZmIlByZmfv1Yb4Rb3u8pcmZPZ2mmJlRrNxUCC6M4
         mTq4ZswbTgBLegOajfbG5JFQXDR/OXYBuOk4c7JAx8nOdes9/x/U0rEjprDXmqOrTuC9
         PyvxptG8lKzSPbJal78J0YKFMJBLSFNvXIbHw22U4/jZf8ttd5muThJlkGbDbYO2kjzH
         iagQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KG9nW6QZ+nRTJl8Lw6nATA7KbiGGQOwaWs6dE7XfSMg=;
        b=0djnW7tyVhyqzXF8vj0dWKoPbAVrLElmEdnaCATfShhLa9nw81YUWPZYfUlC5zbCHC
         ds6MCX1Xk1DYqE7YNf6KgGZa2TXf3m4n9uuV64GNSn1h0MaIgjboLPQUKyqn3mZEkGUi
         XfcJzGm5VeMfOBwodBHzYcg2vPrlWG5Zea9GAuK0Yd3KzOJNgfmblcbba2q3uLpHoh9/
         fiCx4RHxKllYiujuOMNJisXMbY0C+MK+fkELu+36gfX/SU0HHc2evhAslNmIbg5M5rTC
         c1RYFJLRnuZCDIWzLD525m8bvgZiHelDSxA+ytcBH59va8SaUbe8hLwdZj9gBIy+MMZ2
         hCCQ==
X-Gm-Message-State: ACrzQf1OWTgMUDQgf83whtmz8vtZvT3Rq0+BhHYAjX9HTIIvPKTUE5qH
        c+ne7tF1L1A/0JoPLGm/+08QV+KehaCfHA==
X-Google-Smtp-Source: AMsMyM7cLqu7fr9BXTqqyWVxmdZfxNtsKHefndl4dvbPRNVcrui8RImz2u21ZHIorgF1LBhzJtnDDA==
X-Received: by 2002:a19:640a:0:b0:4ac:3f59:2959 with SMTP id y10-20020a19640a000000b004ac3f592959mr3957265lfb.274.1667146574405;
        Sun, 30 Oct 2022 09:16:14 -0700 (PDT)
Received: from localhost.localdomain ([195.165.23.90])
        by smtp.gmail.com with ESMTPSA id v9-20020ac258e9000000b004a47e7b91c4sm854365lfo.195.2022.10.30.09.16.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Oct 2022 09:16:13 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH 1/2] arm64: dts: qcom: msm8996: use hdmi_phy for the MMCC's hdmipll clock
Date:   Sun, 30 Oct 2022 19:16:11 +0300
Message-Id: <20221030161612.95471-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
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

Link hdmi_phy as a clock provider of "hdmipll" clock to the MMCC.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8996.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
index 5ff8de3e3de7..4ba5d13da23b 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -882,7 +882,7 @@ mmcc: clock-controller@8c0000 {
 				 <&dsi0_phy 0>,
 				 <0>,
 				 <0>,
-				 <0>;
+				 <&hdmi_phy>;
 			clock-names = "xo",
 				      "gcc_mmss_noc_cfg_ahb_clk",
 				      "gpll0",
-- 
2.35.1

