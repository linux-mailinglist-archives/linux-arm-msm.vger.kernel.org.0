Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 03817654AD1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Dec 2022 03:11:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235823AbiLWCLM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 22 Dec 2022 21:11:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56692 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235881AbiLWCKs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 22 Dec 2022 21:10:48 -0500
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DEA8327B2F
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Dec 2022 18:10:39 -0800 (PST)
Received: by mail-wr1-x435.google.com with SMTP id a17so3368918wrt.11
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Dec 2022 18:10:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vZavQr6k2PeSy9xz8+KrvthbNaKQoAyOMCSTDf4sGKg=;
        b=B7QnemNIR5OCuEq260uL72kCj+SdXlF5J8CtY6xGBSI2NwaNpGDnORFmSDGic7f6ax
         EvNPUDAZ+qWbS3VDISiK6bBDc710d6uUSxH/BO2ElTz40k8d5FOURc1CMrSxIipVxeuF
         kOzDo3Pd9vBDaQUmIw4r/mFWFOIw6BuGYeEt8wysitQcTi6bfNgh0sAUMPsjupdOV8gM
         IcNHEAse0uWJo6bE5CYnRHeWZ6jqYNdqXunBnfFs0rKsfaOIHeuyOtXVQ7f587cRnRRP
         QAO0CBFxxPx45TmnMoQHbnv3vEZi97oem0rPf6V4Gs6H3oynzP3gMsbA78WsBmNK4hVY
         u1sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vZavQr6k2PeSy9xz8+KrvthbNaKQoAyOMCSTDf4sGKg=;
        b=lnuv5Ov1qUy0MCxdcB5PwjJCRnvmdZUCBvtFVdUhKfAofvs4D2hBIj1XIgs0hwS/+f
         ioORiEPhxPeh9mnrmwsdpk+t+BvDfOgVPINN6V3J/w03s8Dg86CSuryu3cAHoAX0jtk0
         KVR4UCjboiGXVi0OW90NsZ3JkEfWx4Ag4NAaSrG8IKcAIIS/s1l2V0X7gvcHAVSEUCjI
         ephqb6ISMznLHfx3cKxlMmIril3VbhxVtCElJ3ieQNV8Tc0w5B4hI/hSryHLMI4JO+2w
         7n4MT8Sl4BdQasQeg4SuvVi/OhsQMyI4E3PbjcT/peF3RpnyvUIt5qgM15zfbAKrgMc+
         5aSA==
X-Gm-Message-State: AFqh2kpFjymqRCB3TWNS8GrFI4r5GHaPlQO0vAsiXLdeP13AsYTN5QmP
        vg1vBcnpDa/qYJPKoDXe/cXcSJmQCERZbDMFq5o=
X-Google-Smtp-Source: AMrXdXtWB92q8QYqsfmFwfOfE1sobGfz5U0oDcSl1HBVxU96+nDthKhz9lU6GQIoHJLcnkRk/FXmSw==
X-Received: by 2002:adf:d4c7:0:b0:26b:2694:c563 with SMTP id w7-20020adfd4c7000000b0026b2694c563mr5813512wrk.15.1671761439290;
        Thu, 22 Dec 2022 18:10:39 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id j11-20020a5d452b000000b0022cc0a2cbecsm1849725wra.15.2022.12.22.18.10.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Dec 2022 18:10:39 -0800 (PST)
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
Subject: [PATCH v6 10/18] arm64: dts: qcom: msm8916: Add compat qcom,msm8916-dsi-ctrl
Date:   Fri, 23 Dec 2022 02:10:17 +0000
Message-Id: <20221223021025.1646636-11-bryan.odonoghue@linaro.org>
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

Add silicon specific compatible qcom,msm8916-dsi-ctrl to the
mdss-dsi-ctrl block. This allows us to differentiate the specific bindings
for msm8916 against the yaml documentation.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8916.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916.dtsi
index 2ca8e977fc2a9..ffb4ce8935b37 100644
--- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
@@ -1021,7 +1021,8 @@ mdp5_intf1_out: endpoint {
 			};
 
 			dsi0: dsi@1a98000 {
-				compatible = "qcom,mdss-dsi-ctrl";
+				compatible = "qcom,msm8916-dsi-ctrl",
+					     "qcom,mdss-dsi-ctrl";
 				reg = <0x01a98000 0x25c>;
 				reg-names = "dsi_ctrl";
 
-- 
2.38.1

