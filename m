Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6508356CDE6
	for <lists+linux-arm-msm@lfdr.de>; Sun, 10 Jul 2022 10:41:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229605AbiGJIln (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 10 Jul 2022 04:41:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53504 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229602AbiGJIln (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 10 Jul 2022 04:41:43 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2915A18B2E
        for <linux-arm-msm@vger.kernel.org>; Sun, 10 Jul 2022 01:41:42 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id t1so685987lft.8
        for <linux-arm-msm@vger.kernel.org>; Sun, 10 Jul 2022 01:41:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=EeMCpK/TFDgQ/NFlsbZ30ylj/18M0aiLg8g2O9zei+A=;
        b=BAu/9auckXGyXAI3V7+n568uMA84XQfpQkA3uhy9UBmyWef3h/x33O9zBTS7jBvahG
         2qP/cn5UMwgyrkIbm30jHG1CFOmZHRJtWMpMN26ctD7fhHkeM5lNbLfaqMdFszO2x5qF
         SQ0eAV+t11L6m6I5koNCvUqZlrZdao+aXdJfWznZBRMrXObmCnufPpORF5myjU9H5NLC
         ThJVeC87h2XN07nVnSLQf/0Dt7l2dk/WTuC2noYNkmxP+d/yMz9hNzub8fiba+mpjlIY
         q8ZDKi8+DHE/JG/jo8fqQ6UGOllsBzSBMa6F86fHyw3jfywyhS3Ap7zRRXtL2zd0GsrT
         D6xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=EeMCpK/TFDgQ/NFlsbZ30ylj/18M0aiLg8g2O9zei+A=;
        b=2LIuZHHSIKHLx9IcxW7FwrHCrZTcHqofZ6ywx4vTWCC+WYY0yuSnMlyxeQ8Z2sJEzW
         CkDz2wv97a0HiFFfQHiTea0AKRU7YGP5P8KlLBFzyzMnoYmw1n0BpqgmNwtQnWN4+W9X
         oCpTID1lPkI5XlXX8+4EhKstLd/tUSrbDLA0q6PR2Q6pprdJrdSa/75+aiT17Th9lIO9
         DSoz/qFdwFQXwloa6XK4nj9EWstCFSYQQlGlXVdIfJ9sWDiVdwXk8f7fRMhgCRl+bH9W
         HOJnPtJukiRrth6w+q0p8jvmh8MWfLVkS/Y/6djlHw0uGRe5UvTVlcAFMp2naOVfYN3Z
         jGaQ==
X-Gm-Message-State: AJIora9ZCPhyGOvKq4hFMHqraeahZohlSJWGiiPjKWTgDHS42tFmYhgi
        wLhFV+NAVUTYpuamRgxonj5yUQ==
X-Google-Smtp-Source: AGRyM1vH7ZQmx5RPbbnk6oxL2Y2n2beqCk+Q/ta32NCSmrRyI1vyWjW0jXiEJNjyC4WmPgryu9w/iQ==
X-Received: by 2002:a05:6512:304c:b0:489:d0e3:2efb with SMTP id b12-20020a056512304c00b00489d0e32efbmr2935998lfb.34.1657442500538;
        Sun, 10 Jul 2022 01:41:40 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id i21-20020a2ea235000000b0025d4addbad4sm912536ljm.91.2022.07.10.01.41.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Jul 2022 01:41:39 -0700 (PDT)
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
        freedreno@lists.freedesktop.org,
        Kuogee Hsieh <quic_khsieh@quicinc.com>
Subject: [PATCH v2 5/9] arm64: dts: qcom: sc7280: drop address/size-cells from eDP node
Date:   Sun, 10 Jul 2022 11:41:29 +0300
Message-Id: <20220710084133.30976-6-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220710084133.30976-1-dmitry.baryshkov@linaro.org>
References: <20220710084133.30976-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Drop #address/#size-cells from eDP device node. For eDP the panels are
not described directly under the controller node. They are either
present under aux-bus child node, or they are declared separately (e.g.
in a /soc node).

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sc7280.dtsi | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
index a55e6caaaadc..13590e84772e 100644
--- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
@@ -3740,9 +3740,6 @@ mdss_edp: edp@aea0000 {
 				operating-points-v2 = <&edp_opp_table>;
 				power-domains = <&rpmhpd SC7280_CX>;
 
-				#address-cells = <1>;
-				#size-cells = <0>;
-
 				status = "disabled";
 
 				ports {
-- 
2.35.1

