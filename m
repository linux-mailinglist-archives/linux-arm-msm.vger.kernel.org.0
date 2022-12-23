Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BA121654B08
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Dec 2022 03:12:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235990AbiLWCMb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 22 Dec 2022 21:12:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58716 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235993AbiLWCLs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 22 Dec 2022 21:11:48 -0500
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 785CB22BD8
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Dec 2022 18:10:49 -0800 (PST)
Received: by mail-wr1-x42e.google.com with SMTP id bx10so3427996wrb.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Dec 2022 18:10:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eHjoTnRNTZFA0ZBsqDkIXARH9jeUb+0DAfgRumKgoyA=;
        b=lBDQtSit+1LqfmJbT1uhbKUQP17QT6jOYcXSoMTBTOZLa2xXlUhOmhQKhAvtRFKopi
         Ay1nv3bo5Xrq8o5PcsK6DjS4wliQlovmoSSTSpInMaUc8mErA8Ro1SyVnrhidsTAfAzl
         SFv5CVFN01XmU0CiED1g7Wh6QdmlHPrvuSv0YkFUQWkCjCY4Crb582wgyPwFIVloO4iv
         UVn9aehPzGoeFjylzhnKGyO4yMuMEQIiQ/My8GmvBzObXQ4uLD6kmTKz3PeVzkTgXorZ
         RvAw4sA4vGMjWnfUnjv7wxYrvC92tR8p5w0OpByZ87hIyTzNOnVlEOFoKOix2lgJCbH3
         zzzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eHjoTnRNTZFA0ZBsqDkIXARH9jeUb+0DAfgRumKgoyA=;
        b=ssdE3y3NMkL5qENgBTUnbNe1WTmg/ArLahdd5PtMtbTJiY7dLKHXsjlZQVZyU3zccn
         z7PCQ8VdSEHqdaKNRI2g9q/ZfF0bAqS7dmz4eXZFO+rudGQXXe+ygUA0q5XCJOr0Lh4G
         gAZ/LQZCzuczZix/rzwOnrc52RqQsvHu65hrihLfI1+uvx7LsF1NF8M/8E19o9ZNzi0e
         pRKQPOzMFWWc8GLWnpkQOj7VpkSxsYEJ2o9xSED2WCbD642czayJow3xd+L4LN0xRIvJ
         qzluGME/XuOdZibU0fAG1ndS+MUkmlFhRGHLiW8m3ukYUE94UR2CgiNNr2ZJ8eSNn9Uu
         XUlQ==
X-Gm-Message-State: AFqh2kqKRGjJaYTYPvHJvn2hJj8LWWJa7ICm8UjkEd8S1FCdIRLcpvwj
        TpkzD9si+BChC2w7T7nM0w+vI17RVO9wuipj/7A=
X-Google-Smtp-Source: AMrXdXsjlvDyNSKBvKq4fxfuBOK1I1bluwc0R6MKJ8g3VyJ6MY+VRGeAv1iWAuoPLG8kUzwNT8Trjg==
X-Received: by 2002:a5d:4950:0:b0:26e:7604:6575 with SMTP id r16-20020a5d4950000000b0026e76046575mr3878257wrs.65.1671761447428;
        Thu, 22 Dec 2022 18:10:47 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id j11-20020a5d452b000000b0022cc0a2cbecsm1849725wra.15.2022.12.22.18.10.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Dec 2022 18:10:47 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org
Cc:     robdclark@gmail.com, quic_abhinavk@quicinc.com,
        dmitry.baryshkov@linaro.org, sean@poorly.run, airlied@gmail.com,
        daniel@ffwll.ch, robh+dt@kernel.org, dianders@chromium.org,
        david@ixit.cz, krzysztof.kozlowski+dt@linaro.org,
        swboyd@chromium.org, konrad.dybcio@somainline.org,
        agross@kernel.org, andersson@kernel.org,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        bryan.odonoghue@linaro.org
Subject: [PATCH v6 18/18] arm64: dts: qcom: sm8250: Add compat qcom,sm8250-dsi-ctrl
Date:   Fri, 23 Dec 2022 02:10:25 +0000
Message-Id: <20221223021025.1646636-19-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221223021025.1646636-1-bryan.odonoghue@linaro.org>
References: <20221223021025.1646636-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add silicon specific compatible qcom,sm8250-dsi-ctrl to the
mdss-dsi-ctrl block. This allows us to differentiate the specific bindings
for sm8250 against the yaml documentation.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index dab5579946f35..9240132efa75e 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -4050,7 +4050,8 @@ opp-460000000 {
 			};
 
 			dsi0: dsi@ae94000 {
-				compatible = "qcom,mdss-dsi-ctrl";
+				compatible = "qcom,sm8250-dsi-ctrl",
+					     "qcom,mdss-dsi-ctrl";
 				reg = <0 0x0ae94000 0 0x400>;
 				reg-names = "dsi_ctrl";
 
@@ -4141,7 +4142,8 @@ dsi0_phy: phy@ae94400 {
 			};
 
 			dsi1: dsi@ae96000 {
-				compatible = "qcom,mdss-dsi-ctrl";
+				compatible = "qcom,sm8250-dsi-ctrl",
+					     "qcom,mdss-dsi-ctrl";
 				reg = <0 0x0ae96000 0 0x400>;
 				reg-names = "dsi_ctrl";
 
-- 
2.38.1

