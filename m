Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 58E6A5E8A4A
	for <lists+linux-arm-msm@lfdr.de>; Sat, 24 Sep 2022 10:51:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233612AbiIXIvf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 24 Sep 2022 04:51:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42586 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233505AbiIXIvd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 24 Sep 2022 04:51:33 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89796F3135
        for <linux-arm-msm@vger.kernel.org>; Sat, 24 Sep 2022 01:51:32 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id s6so3604946lfo.7
        for <linux-arm-msm@vger.kernel.org>; Sat, 24 Sep 2022 01:51:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=xNoN7Rur629DmHYO6x8lTOQzMphVPPTOlrlp3Mu/xhg=;
        b=M+VYFsnT7wx332ngBy0fhnt5a9ykY3FoKYjc9sEAsNODehBiFX2kIpCpSbSxje//7M
         Lct5RwwYbJTPCmcHg0osNqEEQvk3VZ5Uo+j6XP2hRjc8aeFpEGijsyUBexntcEMU/Efq
         rhJ76SzVyIbjdOltIeLE5C9SzM0jT3YL8Fe0mRhfPwgxbQhDGEIzIQt7scHIgKAF6qVi
         ibHDxziuFZPcUzt0A5ZwpkvBym0USkKmfenHnwgIPe/OV79BCQjkfJU8PF2E9nj253h3
         D/pSLUdWss/V+7L6nMnglx0lVShUFQTLWDu2he2NKoTxEsl4Gw/z9l8WNwQ+M4qT29dI
         y8AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=xNoN7Rur629DmHYO6x8lTOQzMphVPPTOlrlp3Mu/xhg=;
        b=f2EswcbScfpVsrxjrccOoJy/SC7tugjBlMbMDGlPKy100fPUAysWCQZHzu0hs7uBRm
         WUbg5sEaelXqgs0ElfA0JjoMplZ6eHCFItrGInjQSyF+GhWW0Zsue/PODaLEvIU9J3sF
         fiNzap2H339nxNPM77eNsVYYuCupwZbej5zhbVzazIdIPbVmLgntkmEDKgK1Wvwf5E7h
         IuI46z3tch2ihYxhcJtqK4iQF/n/cMp0bvoJmT8M4W0szJYdkix4xlrEIh1oaj7FDfaX
         TZkUQCBQC7bXAP/weIeZIwhVDuxD8OuqtZexsVXPIN61pp/qLkZfImI6boKYEx/2z5XP
         bYqg==
X-Gm-Message-State: ACrzQf2rVnmi0wI8nNmb2rt+fPaxB3MySbOFNjQdKqSMZRP3neKvxGwP
        ouC0KQRQWwz3m2Sq3xe1plnkwQ==
X-Google-Smtp-Source: AMsMyM66Uofz3Y3RoWQKzaoPo3wwTKaiclsITBOK1mBebDIaGOUt9+kbh72dpigvd21js3NSrIiS2Q==
X-Received: by 2002:a05:6512:6c7:b0:49f:5491:3330 with SMTP id u7-20020a05651206c700b0049f54913330mr4821276lff.197.1664009490916;
        Sat, 24 Sep 2022 01:51:30 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id 129-20020a2e0987000000b0026acfbbcb7esm1717607ljj.12.2022.09.24.01.51.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Sep 2022 01:51:30 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
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
        Loic Poulain <loic.poulain@linaro.org>
Subject: [PATCH v2 1/2] dt-bindings: display/msm: Add QCM2290 DSI phy
Date:   Sat, 24 Sep 2022 11:51:28 +0300
Message-Id: <20220924085129.161086-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220924085129.161086-1-dmitry.baryshkov@linaro.org>
References: <20220924085129.161086-1-dmitry.baryshkov@linaro.org>
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

From: Loic Poulain <loic.poulain@linaro.org>

QCM2290 platform uses the 14nm DSI PHY driver.

Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
[DB: changed compat to follow the agreed scheme]
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 Documentation/devicetree/bindings/display/msm/dsi-phy-14nm.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-phy-14nm.yaml b/Documentation/devicetree/bindings/display/msm/dsi-phy-14nm.yaml
index bc3d0b4063c7..088a03ed5f80 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-phy-14nm.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-phy-14nm.yaml
@@ -17,6 +17,7 @@ properties:
       - qcom,dsi-phy-14nm
       - qcom,dsi-phy-14nm-660
       - qcom,dsi-phy-14nm-8953
+      - qcom,qcm2290-dsi-phy-14nm
 
   reg:
     items:
-- 
2.35.1

