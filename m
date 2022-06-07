Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0DF705418F8
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jun 2022 23:18:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1376293AbiFGVS2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 Jun 2022 17:18:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50392 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1380979AbiFGVRM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 Jun 2022 17:17:12 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4FCA132A29
        for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jun 2022 11:58:11 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id t25so29706559lfg.7
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jun 2022 11:58:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=aGzqYEGQn+If9ubvMiuRbk2B+EdJKY+QHOiiUFFUgLA=;
        b=Sj2qVill9L+8Omi1aXH+ITfabJemTKGx5YdS65gfo5MKRt51SxHahuPZdrVhAwkqWi
         6GKL8CY71YignAnsb7FS5qEuahe4EHe2lDKvSxCklkwaVDn54B0+wwMWOWzCWr5ehS8g
         wQGVjfEIc1i2TdNEZUwLSaLPDCiWtcZvnKr+urn/LGuirb3I4yYJPQSCq/lcaeGOJ5NK
         e8IbYxw2bZ7pzXXFGmnBOdaxAvL5YHPS+QM8Fx3iWbkDbaeXuagC9CQ4i5vSQ1GWaY0b
         O8yGgBqnp5VzG7pMTLEZh0E9dU1V+Iq3LNEYIq6hWRP3kuLZB8Dnc6Zf0B3H2V6fkfiD
         Wqow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=aGzqYEGQn+If9ubvMiuRbk2B+EdJKY+QHOiiUFFUgLA=;
        b=WdEfnjxdGaI9d4J7G7KGcUEHgEsZ3WKhdndwA4MtOlTR3+NmLR7LgrmDgxEIgmUFmy
         9/wWXSR3kqSkbL+buitSICaJLswj86+GaWJwAyAoeSSXhuhP84SE8L/k/c6KVzwFUkHk
         w/5tejihPrgOZowHDvb1eAi0xlRI54KOqMof4KD0Uztf/dJVlpngzGMUvVNZndj+DicI
         w7biJ4C1weRAbwkbIyeriuW0saW+4RBfXvHbNi5v4YVSBD/Y0kUCyIec+07/sEhPbQ1j
         A2bX6oYMmTiYjfPldOrxgoYSG2FAqJCRcUl8qLif3mXAViSss3cZVsINmIZjAvggtTOs
         dWow==
X-Gm-Message-State: AOAM5312D07xMtgE9ivaL8feY8gtXVVzqMfirOW6PpCNT2GBysQc3xXT
        mzvK0il2Xd70eQ0yTqaTDXDL3g==
X-Google-Smtp-Source: ABdhPJzEpQjDU9eJCieoZIm+7e2VEurWFXSje1/LOnq676gG9dGxHWnm+QON/hUbK3UpJK4BXh8MKA==
X-Received: by 2002:a05:6512:22c1:b0:479:54b6:8281 with SMTP id g1-20020a05651222c100b0047954b68281mr5727582lfu.291.1654628289821;
        Tue, 07 Jun 2022 11:58:09 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id d19-20020a2eb053000000b0025587b872cesm1611668ljl.70.2022.06.07.11.58.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jun 2022 11:58:08 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, David Heidelberg <david@ixit.cz>
Subject: [PATCH v1 2/7] dt-bindings: display/msm: hdmi: mark old GPIO properties as deprecated
Date:   Tue,  7 Jun 2022 21:58:01 +0300
Message-Id: <20220607185806.2771739-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220607185806.2771739-1-dmitry.baryshkov@linaro.org>
References: <20220607185806.2771739-1-dmitry.baryshkov@linaro.org>
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

Mark obsolete GPIO properties as deprecated. They are not used by
existing device trees. While we are at it, also drop them from the
schema example.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../devicetree/bindings/display/msm/qcom,hdmi.yaml         | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,hdmi.yaml b/Documentation/devicetree/bindings/display/msm/qcom,hdmi.yaml
index 2f485b5d1c5d..2b1cac0851ce 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,hdmi.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,hdmi.yaml
@@ -59,22 +59,27 @@ properties:
 
   qcom,hdmi-tx-ddc-clk-gpios:
     maxItems: 1
+    deprecated: true
     description: HDMI DDC clock
 
   qcom,hdmi-tx-ddc-data-gpios:
     maxItems: 1
+    deprecated: true
     description: HDMI DDC data
 
   qcom,hdmi-tx-mux-en-gpios:
     maxItems: 1
+    deprecated: true
     description: HDMI mux enable pin
 
   qcom,hdmi-tx-mux-sel-gpios:
     maxItems: 1
+    deprecated: true
     description: HDMI mux select pin
 
   qcom,hdmi-tx-mux-lpm-gpios:
     maxItems: 1
+    deprecated: true
     description: HDMI mux lpm pin
 
   '#sound-dai-cells':
@@ -171,8 +176,6 @@ examples:
           <&clk 61>,
           <&clk 72>,
           <&clk 98>;
-      qcom,hdmi-tx-ddc-clk-gpios = <&msmgpio 70 0>;
-      qcom,hdmi-tx-ddc-data-gpios = <&msmgpio 71 0>;
       hpd-gpios = <&msmgpio 72 0>;
       core-vdda-supply = <&pm8921_hdmi_mvs>;
       hdmi-mux-supply = <&ext_3p3v>;
-- 
2.35.1

