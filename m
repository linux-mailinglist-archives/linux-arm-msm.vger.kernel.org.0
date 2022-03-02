Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6F7684C99BF
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Mar 2022 01:14:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238704AbiCBAO6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 1 Mar 2022 19:14:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50480 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237363AbiCBAO5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 1 Mar 2022 19:14:57 -0500
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0798527CD
        for <linux-arm-msm@vger.kernel.org>; Tue,  1 Mar 2022 16:14:13 -0800 (PST)
Received: by mail-lf1-x12f.google.com with SMTP id i11so29692558lfu.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Mar 2022 16:14:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=r6j1RnvliKlo06NEbsXMz1JE3sTo5nc2f1FocUULplg=;
        b=lYKRJMToGKwmhHNEU9Dj4fWJY81n58e98eZkT5KbJf0ah4zkCFYjSJMhk2RMLR2YVx
         05tleAzmq9y79oH46pmnqhNWly2msX29NWR0gN2jKOdQS1Ib3J1d1Z08X0YSD+wdhdKM
         XpsaXyfdV4/KLU+MARc5ZH8hTL6PamJSMFi2HGgiKVw3yfPFvtK0dOO+sY/IDbNMwmWT
         nV3pO9dWZ3ioLblxd5zQDUN+1Zq1KvBr2K+2I98RJQ5ovA8rOA8Ille/1KDBtoyaV/zN
         0lNHB07igQW7fPkfUS0R7fIsekEINc92bdREYIoz3zRcJ7JckJGXs0ApkXMydbBIj6ot
         PiqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=r6j1RnvliKlo06NEbsXMz1JE3sTo5nc2f1FocUULplg=;
        b=bGNmH+vYVydRhTDdnP6F42yBf+3hs2ezaGBBH1SRwzb+Q1vphWuPrg42WF0h5t6qNV
         7EnXCLvdmRtawlQZ6b79oSPfPHwNvqFq32O3I5JGDoUItSQ+nXxtnz68VO9hwX+vYXI1
         m0pqzaXcskplvqpyaYHn55QYdGdU+TRZgB0D/tkhu9Fdw/PCZRV6qX6yxKSETa4EDpc2
         kphTl5OW7VzHFZ6c1yrr0XaDp6QIiiEKVwCHTTnQPV6rCi7BejqIKPn6hvtX/Qj6obtl
         LyMvbWDelCQhxnn3kk0R/ZJNnwakNoK0QywIQwa7atBqU9eKFmmXhUNDOTrixnrsuKAd
         ui7Q==
X-Gm-Message-State: AOAM532HD0rvYqA1LvuFRJlX5nqlns1swzhJATVzcSrHfOkFjSOAP97w
        K38rM1+UJV82DU5paew78wqwHw==
X-Google-Smtp-Source: ABdhPJzFFxxw80VkIGyBqID0M6qtQ02PtYQg3lVjdMGD0xBhjRsRppC656mY1y9Ek4dz+PiTMnv+Bg==
X-Received: by 2002:ac2:5fc8:0:b0:445:a43e:3526 with SMTP id q8-20020ac25fc8000000b00445a43e3526mr6021693lfg.39.1646180052211;
        Tue, 01 Mar 2022 16:14:12 -0800 (PST)
Received: from eriador.lan ([2001:470:dd84:abc0:5258:5528:7624:3edd])
        by smtp.gmail.com with ESMTPSA id q5-20020a19a405000000b0042b6082b10fsm1734307lfc.262.2022.03.01.16.14.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Mar 2022 16:14:11 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, Rob Herring <robh@kernel.org>,
        Loic Poulain <loic.poulain@linaro.org>
Subject: [RESEND PATCH] dt-bindings: display/msm: add missing brace in dpu-qcm2290.yaml
Date:   Wed,  2 Mar 2022 03:14:10 +0300
Message-Id: <20220302001410.2264039-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.34.1
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

Add missing brace in dpu-qcm2290.yaml. While we are at it, also fix
indentation for another brace, so it matches the corresponding line.

Reported-by: Rob Herring <robh@kernel.org>
Cc: Loic Poulain <loic.poulain@linaro.org>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Didn't include freedreno@ in the first email, so resending.
---
 Documentation/devicetree/bindings/display/msm/dpu-qcm2290.yaml | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/msm/dpu-qcm2290.yaml b/Documentation/devicetree/bindings/display/msm/dpu-qcm2290.yaml
index 8766b13f0c46..b1b4652077db 100644
--- a/Documentation/devicetree/bindings/display/msm/dpu-qcm2290.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dpu-qcm2290.yaml
@@ -209,6 +209,7 @@ examples:
                                         remote-endpoint = <&dsi0_in>;
                                 };
                         };
-                 };
+                };
          };
+    };
 ...
-- 
2.34.1

