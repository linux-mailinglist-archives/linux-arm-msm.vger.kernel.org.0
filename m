Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 42CA6578DD0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Jul 2022 00:57:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234267AbiGRW5a (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 18 Jul 2022 18:57:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53838 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229533AbiGRW53 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 18 Jul 2022 18:57:29 -0400
Received: from mail-oa1-x35.google.com (mail-oa1-x35.google.com [IPv6:2001:4860:4864:20::35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92D3D32EF7
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Jul 2022 15:57:28 -0700 (PDT)
Received: by mail-oa1-x35.google.com with SMTP id 586e51a60fabf-10c0430e27dso27897658fac.4
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Jul 2022 15:57:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kali.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TuU3ZOFKTE6zQTfvXEKarKiWPE5JX+FTT3FfzT9iCBQ=;
        b=AY/0VRtOeRV9Q8nkjH+TBv+HhTW5snzi7o+EV++90GW8OK6g24oBpOuU7bncIzg0GE
         g5+Tozea7Qg3BVFoH/puHPco3xA7gUk/SQdwwZ2IdKjP+X6nsJ4Dwh/u3JnNyKbfsR8e
         tWRBAQktloKA5Moqf9IJCsENzFVB3LX0XGSg7UBYSuII12BVyN/4iX9HG4Mf0lvWThX5
         KArO6pDqzF2pzLzY/dBhS/ir6kJvz0GBW1dxnaOCfF32jwQlBOKGt1TRwLHX2S+x4wRM
         YkswQA3wZaIIlwGV4lxxKhovWX0VbEa+JNbAFRlLjfPZGMp4MhUZvMqBd0AMTxQ3ITIV
         5GDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TuU3ZOFKTE6zQTfvXEKarKiWPE5JX+FTT3FfzT9iCBQ=;
        b=rQRRHD1SqYeQc1/i9O8Fz/8PzZQd1WTI9NxQh+XeoNWxKjLMeeRYj8lKF1XAXrBP16
         Cy+CFUEJA6CHCxin1VI/HCuKiFD8M6ltuUcZMRGW1cpvDoJnRAJZDptDCkLtYnwsbpWL
         49Im8//kIDQbEt+BXDoBiGJd9v1oqvyDX7SdTRYAqqCa+/WuJASMJ8XlfHRlmH7+LH3G
         ka1MJ1Mf599atZiutQs7S8oKjBOeYcZt5ni2nW+GOKrT8YNXoMQPbXY5IWw0I0cGu+Mq
         vq3wN0pKY8ZTaDJr/92VdCtv0O0iai1TdkSdKFzAv3D8173z2R+mlmUrd+NLeFRBGLUB
         Rz3w==
X-Gm-Message-State: AJIora9POcRQAZJChqdRpNnd0tIfcRS3wwuYqAqos+1Rp7Hj0hKEsse7
        2D88Qh7hORaj9Uwadne9p8w7iQ==
X-Google-Smtp-Source: AGRyM1snqpROytp61XxtUIrGtJTcJPBz705918qLGe1VIp81gTLAd7RoS0IPcatzgT5Z8YKN+01gIg==
X-Received: by 2002:a05:6808:1313:b0:335:cad6:715c with SMTP id y19-20020a056808131300b00335cad6715cmr14808239oiv.130.1658185047923;
        Mon, 18 Jul 2022 15:57:27 -0700 (PDT)
Received: from localhost (cpe-173-173-107-246.satx.res.rr.com. [173.173.107.246])
        by smtp.gmail.com with ESMTPSA id u15-20020a056870304f00b0010be09dc797sm6865123oau.18.2022.07.18.15.57.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Jul 2022 15:57:27 -0700 (PDT)
From:   Steev Klimaszewski <steev@kali.org>
Cc:     Steev Klimaszewski <steev@kali.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: qcom: sc8280xp: add missing 300MHz
Date:   Mon, 18 Jul 2022 17:57:14 -0500
Message-Id: <20220718225714.8074-1-steev@kali.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

When booting a Thinkpad x13s, we see the message

[    0.997647] cpu cpu0: failed to update OPP for freq=300000

So, lets add in 300MHz to make it happy

Signed-off-by: Steev Klimaszewski <steev@kali.org>
---
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
index 12267feb2fc5..49ea8b5612fc 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
@@ -36,6 +36,9 @@ cpu0_opp_table: cpu0-opp-table {
 		compatible = "operating-points-v2";
 		opp-shared;
 
+		opp-300000000 {
+			opp-hz = /bits/ 64 <300000000>;
+		};
 		opp-403200000 {
 			opp-hz = /bits/ 64 <403200000>;
 		};
-- 
2.30.2

