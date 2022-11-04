Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B24126197B3
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Nov 2022 14:23:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231309AbiKDNXZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 4 Nov 2022 09:23:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53006 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230209AbiKDNXY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 4 Nov 2022 09:23:24 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B0C22793A
        for <linux-arm-msm@vger.kernel.org>; Fri,  4 Nov 2022 06:23:19 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id r12so7424391lfp.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Nov 2022 06:23:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GFPRMQrPpUte237J6aCjznuQ9mnU+Eo0yi+srZmgqHY=;
        b=A7fuxhHuzCtWSVl2IK6kcDQurpzpuO8OBwGAMDYDXea0/R8QZAboNBqWoyQ6bGl8wl
         8RdIVVlkbl36q4I5Har+3fRMKU17oWX1njqYpoip7vq+PpZPqLeMvgT4hFf9osPtU5Wi
         P+yXUC7yT5i4scH3iEAcAkZTIgqnmWT7WHoaMRmAvTDOITTWwqhPl8Wj6yd4zJCkmOlT
         pL9e9seENnu7JYK1KOoW0XRKUlCvcRTbqYpBbSTsQ3VC3/usbo1lUPRB+odZywDmgC5X
         rQxqjHzNRloHR3+g3tYyeo8Viy8s33wX797GmI0WjPbFsg3XVmktoj0oW+M0f8TQZcDZ
         of+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GFPRMQrPpUte237J6aCjznuQ9mnU+Eo0yi+srZmgqHY=;
        b=c7pR4u0GHxznbKa/2H+6bVeGsicPHFw2RSebBbO+4AHvEtdLIOPXPoQpTFA5vLMoZ5
         49u0hZm5DLiT+hupuSBpxCK45JlVOs8g6ojWDT/zutvm3sxzkgg23GNPhO9/B/J4yu2c
         JauiVN2yOMaW3KWsZ5k5c5TQM7Gm9ri2Kc8YpObFwwdI1qSAGtxN4Mb82+CcfR1UdeIY
         beYYStDF+I8Rx7yxyv9NMHGvKlMb8dpL3QtVZJTnJ/D93foaKqIAKeNhiWgneSDWCwef
         Zl1mPAGOKTKf1Gn1J9kg36rlIM5Y2ChDA3BG8r4CyXAQpstVogPan/DWJEY5TSD3HVcp
         nsXA==
X-Gm-Message-State: ACrzQf3KSDwGa0gA7yrbgIUXXUBuTSXwpvj5cUdOkTiT8mIpDvVIILLt
        X7X5N9dPK6AvH7ZvlsJ/aE5LOd1MFFeRnQ==
X-Google-Smtp-Source: AMsMyM705LK4MchUkNOU6hSRxD3UWDywaZKy0DbUuwM6BjHiHbB82FGOEodinOzlXBYu5/teATWkZg==
X-Received: by 2002:a05:6512:ad3:b0:4ac:df10:6af6 with SMTP id n19-20020a0565120ad300b004acdf106af6mr15000229lfu.214.1667568197813;
        Fri, 04 Nov 2022 06:23:17 -0700 (PDT)
Received: from localhost.localdomain ([195.165.23.90])
        by smtp.gmail.com with ESMTPSA id o11-20020ac24e8b000000b004a478c2f4desm456468lfr.163.2022.11.04.06.23.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Nov 2022 06:23:17 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org,
        Loic Poulain <loic.poulain@linaro.org>
Subject: [PATCH] dt-bindings: qcom: add another exception to the device naming rule
Date:   Fri,  4 Nov 2022 16:23:16 +0300
Message-Id: <20221104132316.1028137-1-dmitry.baryshkov@linaro.org>
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

The 'qcom,dsi-ctrl-6g-qcm2290' compatibility string was added in the
commit ee1f09678f14 ("drm/msm/dsi: Add support for qcm2290 dsi
controller") in February 2022, but was not properly documented in the
bindings. Adding this compatibility string to
display/msm/dsi-controller-main.yaml caused a warning from
qcom-soc.yaml. Fix the warning by adding an exception to the mentioned
file.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 Documentation/devicetree/bindings/arm/qcom-soc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom-soc.yaml b/Documentation/devicetree/bindings/arm/qcom-soc.yaml
index 889fbfacf226..e333ec4a9c5f 100644
--- a/Documentation/devicetree/bindings/arm/qcom-soc.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom-soc.yaml
@@ -43,6 +43,7 @@ properties:
       - pattern: "^qcom,rpm-(apq|ipq|mdm|msm|qcm|qcs|sa|sc|sdm|sdx|sm)[0-9]+.*$"
       - pattern: "^qcom,scm-(apq|ipq|mdm|msm|qcm|qcs|sa|sc|sdm|sdx|sm)[0-9]+.*$"
       - enum:
+          - qcom,dsi-ctrl-6g-qcm2290
           - qcom,gpucc-sdm630
           - qcom,gpucc-sdm660
           - qcom,lcc-apq8064
-- 
2.35.1

