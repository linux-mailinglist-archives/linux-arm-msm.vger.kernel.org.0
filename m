Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5D72956AD97
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Jul 2022 23:32:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236799AbiGGVcV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 7 Jul 2022 17:32:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236804AbiGGVcR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 7 Jul 2022 17:32:17 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 174784D4C8
        for <linux-arm-msm@vger.kernel.org>; Thu,  7 Jul 2022 14:32:15 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id u14so23848830ljh.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 Jul 2022 14:32:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qg3phGBpGh0Q4w+FACeCRFYbTOaYwTMtzSGkLURYM0A=;
        b=wRlDiZ4VRTDJ6qMcTYxer9cy7CLyvVmSBx02kXtJ/Axs3g7m8u+E8XShj1WNL2roFQ
         oSZCU/eiLRR2fW8dsAUVQWm33tuuENdcW22ZZTIAYSFsw51rz+qbmYRfc/7hlMZHwlrA
         fphv8ZxjjIBydQ5H0ujyM7aPIBnzhA3fh6hShWrmCfgCffm/luEep8BSc1WuIb9tiqBH
         ZYqkWsKJE01ICoogLJfDASLBjPjKifRijaDYlKCFAviV5Kmw3b2CW/LI+VL0JEa138ft
         iSKMpAB3jCDAIBpJ95ksDwcKIZgr6b7VZVwVYFqGeUWBH95i7C9H9Y5kPX4g0rpVeTZh
         LIcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qg3phGBpGh0Q4w+FACeCRFYbTOaYwTMtzSGkLURYM0A=;
        b=h3jVRsaOOa3gOSH6Qrf8aqda3KCANSNV24n5aO/ftcq3KnXwhXvCjAiYq1MUxnGgvA
         zf7WqxUbUCTalsSVb3GsSGzjQ9RLVSWTrk2l290CkPdvHK+VsOqpwFN/GaTxRIdMunNu
         IYED/gZ1sh5AWEgz4Pr15nmMBK4CnTAKIhT3DX6gTySn8jSytRMW/BynTLB/H0TofwM4
         MbDq+Gr87tGfDTX2YrSugEPjKhqXp+AAGJgY+IsK7vIG1454+FV63NiJhsc6K/Ue+eki
         ce5e4wsqZlFh4O6MFSt+fDagbRBjxG6b9E0N1bsstDis0RZHf3YwXWhvRu34dtJIn3Ox
         5TNg==
X-Gm-Message-State: AJIora/j2pTHJ7y+Jn94Q8Pc1Udz+QnAVbwtJe9ZyTMAo+Ou0E7fYZs7
        M5UbgUhrdiSfV+J8WiIFg6Xsww==
X-Google-Smtp-Source: AGRyM1tUvRA4gmZUMQz2K5Uvhi/UzUkWkncKpm7W09yQh/5HP/RFKJt4MpQ5Apk13MYqMp5gGA+WOQ==
X-Received: by 2002:a2e:a60a:0:b0:25a:7304:6879 with SMTP id v10-20020a2ea60a000000b0025a73046879mr15260ljp.85.1657229533396;
        Thu, 07 Jul 2022 14:32:13 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id o19-20020ac24e93000000b0047f8cb94004sm7046709lfr.35.2022.07.07.14.32.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Jul 2022 14:32:12 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH 8/9] arm64: dts: qcom: sc7280: drop #clock-cells from displayport-controller
Date:   Fri,  8 Jul 2022 00:32:03 +0300
Message-Id: <20220707213204.2605816-9-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220707213204.2605816-1-dmitry.baryshkov@linaro.org>
References: <20220707213204.2605816-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Drop #clock-cells from DP device node. It is a leftover from the times
before splitting the it into controller and PHY devices. Now clocks are
provided by the PHY, while the controller doesn't provide any clocks.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sc7280.dtsi | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
index a3def1022ea2..21ab986968e2 100644
--- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
@@ -3730,7 +3730,6 @@ mdss_edp: edp@aea0000 {
 					      "ctrl_link",
 					      "ctrl_link_iface",
 					      "stream_pixel";
-				#clock-cells = <1>;
 				assigned-clocks = <&dispcc DISP_CC_MDSS_EDP_LINK_CLK_SRC>,
 						  <&dispcc DISP_CC_MDSS_EDP_PIXEL_CLK_SRC>;
 				assigned-clock-parents = <&mdss_edp_phy 0>, <&mdss_edp_phy 1>;
@@ -3825,7 +3824,6 @@ mdss_dp: displayport-controller@ae90000 {
 						"ctrl_link",
 						"ctrl_link_iface",
 						"stream_pixel";
-				#clock-cells = <1>;
 				assigned-clocks = <&dispcc DISP_CC_MDSS_DP_LINK_CLK_SRC>,
 						  <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK_SRC>;
 				assigned-clock-parents = <&dp_phy 0>, <&dp_phy 1>;
-- 
2.35.1

