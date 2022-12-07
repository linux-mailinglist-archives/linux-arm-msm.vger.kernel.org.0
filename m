Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9A4276450EB
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Dec 2022 02:22:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229573AbiLGBWk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 6 Dec 2022 20:22:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229602AbiLGBWi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 6 Dec 2022 20:22:38 -0500
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74F36D2EB
        for <linux-arm-msm@vger.kernel.org>; Tue,  6 Dec 2022 17:22:36 -0800 (PST)
Received: by mail-lf1-x12e.google.com with SMTP id j4so26450409lfk.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Dec 2022 17:22:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Eq+xrGXQkafyNxdD3bUOX4BO/00RbY/2YQOJ/yUkbp4=;
        b=a0KPp17aX3VBhc6WjLD33V4Bh8koqCHY8U9RWH5IQ4VswKF6JwBL77ccq3GkvUSuCG
         CfcsmPnoeTmb0MXYFkygNmqMDwSh3U0bt4gN9f/GPC2QcWTe3FYGN2k1ZLSvo5wKmbKD
         0QJ6MwsKVZfu5FtYxhI36mleqBEXd9txqpdxAcbjt7s/AHztZ9tzJa3aud1wvjJiI6bg
         WXxZbnDlyDeJWmJ03UbuoSKidB8q1wZJzGTuqjdBkUIDiUaOZmRR+Jof0KsfaxvL9Afm
         D0Hd0I+7hx8XDp5cDzRLOz//uyrFxL14eF0UzMitdjKc7/PpjhiDn2j1iOOW4WFOHaTN
         enUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Eq+xrGXQkafyNxdD3bUOX4BO/00RbY/2YQOJ/yUkbp4=;
        b=rii9kq9epQa0W1XiFHDDYp1Z0PNtSJuzalrocYW6P4UOSi1Dn6csZ5L/TDYnGeuC47
         UtMwD+LWCz4gnjyONvH7XOD8iuqeIr9WBVsTlKQvthXMbolUBKulUdMx+eT7P5dminX8
         YOvamCRk+Hb/6GPkpyw59B/WBKc+a0oJHauN7znlmzITK5kuFlJCZvjkCCUaZ1hGTJQd
         SIOblD+XOoIGo+4XiYPqn6syNyapOK23L9i++MaJpgPDOFibGkF19gmztiuUXkhwkMMx
         8ipxTCnQLN36R4afnyEq7RsjK6lpfSdRUCosvX1DDb4QM4EOPoNwIIJKVq8YjYOU5dlJ
         1Etg==
X-Gm-Message-State: ANoB5pmvyUo+cyulbHf0ssPjFWQk2yQM76UMtf82Y5IlQDnEx0/neNP7
        Jm2sA9xNpUPCffMZMsRrEi2UGQ==
X-Google-Smtp-Source: AA0mqf5ap13IUItCE4FmOqAO8pw758yyVeEppRzmSs+FcStpWVjmZzxb6Uw1+fWgo8fH5Y1OVrUGkA==
X-Received: by 2002:a05:6512:400e:b0:4b5:5da1:4bc7 with SMTP id br14-20020a056512400e00b004b55da14bc7mr5831301lfb.485.1670376154848;
        Tue, 06 Dec 2022 17:22:34 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id a11-20020ac25e6b000000b0048a9e899693sm2678916lfr.16.2022.12.06.17.22.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Dec 2022 17:22:34 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v6 03/11] dt-bindings: display/msm: add sm8350 and sm8450 DSI PHYs
Date:   Wed,  7 Dec 2022 03:22:23 +0200
Message-Id: <20221207012231.112059-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221207012231.112059-1-dmitry.baryshkov@linaro.org>
References: <20221207012231.112059-1-dmitry.baryshkov@linaro.org>
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

SM8350 and SM8450 platforms use the same driver and same bindings as the
existing 7nm DSI PHYs. Add corresponding compatibility strings.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml b/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
index c851770bbdf2..bffd161fedfd 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
@@ -15,6 +15,8 @@ allOf:
 properties:
   compatible:
     enum:
+      - qcom,dsi-phy-5nm-8350
+      - qcom,dsi-phy-5nm-8450
       - qcom,dsi-phy-7nm
       - qcom,dsi-phy-7nm-8150
       - qcom,sc7280-dsi-phy-7nm
-- 
2.35.1

