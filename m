Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 14ADE5A9446
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Sep 2022 12:23:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233920AbiIAKXX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 1 Sep 2022 06:23:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46968 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233867AbiIAKXV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 1 Sep 2022 06:23:21 -0400
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6611C13609A
        for <linux-arm-msm@vger.kernel.org>; Thu,  1 Sep 2022 03:23:18 -0700 (PDT)
Received: by mail-lj1-x22a.google.com with SMTP id k22so17372582ljg.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 01 Sep 2022 03:23:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=gHw35hCInqQhuDYl7ZZa1qf6fa7wiZH9XT+GfWRFFMc=;
        b=rFB9/u4T8YvCl32MoibWldYrtApWUE2Mwc3abtCfGjSKZe5TERbmeA/TeP7TaH/Xk6
         3lbvJPDfMz58BulZbM9mBiLT7dcmeUgJgR7+o0H0M+VrXUz0C8zfDdT5k6OYmEuZ6FjI
         F3O1YR+WwHVhUWhIwGalHCOnDCHlEgbEfCTZXO09NYSAGx0ztqcxNBKUmruHaQG7svBf
         PkJ7PxWpP8cSY/Zxf0bNLjuFxfsTj7xyFNdkPtAoY+idBHwYKRxmKQlHN56W3GldOHYs
         ztdCSt5hp6Mc4aVZit0CzYcNVd7PkPf//hb/VfYhRA4ycBSKUmJ9jth57xHFTxKubZdi
         HPbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=gHw35hCInqQhuDYl7ZZa1qf6fa7wiZH9XT+GfWRFFMc=;
        b=NHw0bEkQ+laHrR/4JGOnzX2NV9UmpIcgxQo4iSYFxi+p5LpzVcmxYZxa1cxUvdBGNZ
         eC02YqtvpMqFZQtghYhT0NTFveeewBM+LAFfkry8XdvkjcrgmhN14GdWoMKRf+BUxTV1
         ssoo476YcgZnrHFehg8vOWfv72IImCGqJ5mKvkT8ep1Il80sYT0rj7Zlni7f0n4ToQSG
         X03dTD7Y4J1DPp3tUFWNOkb3OLt79FbWJw7Oj0kWyvYIiTuT71lBQDd2/rjXuCVXlOOx
         Eh/LPQ/C4WoP1+3EuiZvsVfiT3/66VQpOPEIQnbv6gf3WMbXwLRk8aL4EdGpWRVmoxer
         KZ/w==
X-Gm-Message-State: ACgBeo0iFqb9fX/AdsoVCShHDPJIdpgUFbMXi6W+bsK7ThoSk9UbTYGp
        8mKQukZfmSbGqlcrNkUIMChMEw==
X-Google-Smtp-Source: AA6agR4gytM8sG5Cdwi+tanY8MLQ8kDkTvqfVr/BW4fEhYGQZ6oOgajiBYV3dnWiX+CAm8JI4s5DKw==
X-Received: by 2002:a2e:92ce:0:b0:261:e39e:2c1d with SMTP id k14-20020a2e92ce000000b00261e39e2c1dmr9275777ljh.273.1662027796776;
        Thu, 01 Sep 2022 03:23:16 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id z19-20020a056512371300b004949ea5480fsm123453lfr.97.2022.09.01.03.23.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Sep 2022 03:23:16 -0700 (PDT)
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
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Loic Poulain <loic.poulain@linaro.org>
Subject: [PATCH v6 03/12] dt-bindings: display/msm: add interconnects property to qcom,mdss-smd845
Date:   Thu,  1 Sep 2022 13:23:03 +0300
Message-Id: <20220901102312.2005553-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220901102312.2005553-1-dmitry.baryshkov@linaro.org>
References: <20220901102312.2005553-1-dmitry.baryshkov@linaro.org>
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

Add interconnects required for the SDM845 MDSS device tree node. This
change was made in the commit c8c61c09e38b ("arm64: dts: qcom: sdm845:
Add interconnects property for display"), but was not reflected in the
schema.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../devicetree/bindings/display/msm/dpu-sdm845.yaml    | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dpu-sdm845.yaml b/Documentation/devicetree/bindings/display/msm/dpu-sdm845.yaml
index 3cb2ae336996..ff19555d04e2 100644
--- a/Documentation/devicetree/bindings/display/msm/dpu-sdm845.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dpu-sdm845.yaml
@@ -57,6 +57,16 @@ properties:
 
   ranges: true
 
+  interconnects:
+    items:
+      - description: Interconnect path specifying the port ids for data bus
+      - description: Interconnect path specifying the port ids for data bus
+
+  interconnect-names:
+    items:
+      - const: mdp0-mem
+      - const: mdp1-mem
+
   resets:
     items:
       - description: MDSS_CORE reset
-- 
2.35.1

