Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ECA9254F57E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Jun 2022 12:36:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1380066AbiFQKgV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 17 Jun 2022 06:36:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1380840AbiFQKgU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 17 Jun 2022 06:36:20 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25F3F6AA75
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jun 2022 03:36:19 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id h36so6271525lfv.9
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jun 2022 03:36:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+mbF+CT4pj0sqOG4T30LpuUV61IhgblfEF1NrGou+hc=;
        b=kx4PfLy2XLmc8jxKBvCw5y+bwlmV5LhtLO3ZV3A/LS5GqtkQDVOaiRGkIWzZIoVFsy
         ETBCtf0RCSBO4mgakTkVDr0ZCygFPtjWf1pE6rPf7dxjqEZyNszlv2709v/GZkwauE7z
         HWndjnaUKvNquf+3uL5laRFKMqMBp0Oia50ho90s1CAYpW0tIOQHilUH7NwnzVPXjuTv
         h5w9MepAt61gsMO2hA57hk4h28oW8of6+JvN1jhBNHdyTLTQ/RSeZciiOJ/Z711E45t+
         mg72oZRK6I2dDL1509XFIuZthHQUuU1vdJ2C0oK42L2z8UVUHs9w+UcQeQa6FT2E4Sh0
         ChSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+mbF+CT4pj0sqOG4T30LpuUV61IhgblfEF1NrGou+hc=;
        b=ah9hwS/bmulTqE8aZzIla8CrBTSfT2s1F03QI8I6aD6n2ubrobBsp8WqyS3wTZNYgj
         tCLI46bVEafQKLfzUj0Htf4ikD4lob4XFWgGSw3ySiVaAI7H+GFVBKWVYF2d43dM7gs6
         yfo1BONaLFds6l1UrF77T7vppGXWtp29OCpiy1BmukY/J/NQmEvvqllYl4f2+hfS3z7v
         /1FPBau3wHZCd7sOTMU8b8dELcTD7DR9znjYFBKhP0Im4oJ9JDYH0rAtkmq1O9tuwTh/
         C/yj1zt1TFFI8+JkzR8U/LlBtNaHrqc9wIAkhwlQIVgpbmbsF7QbmS416vNN23dD1CYg
         /z/g==
X-Gm-Message-State: AJIora84iE1T0SWuWB3qLd5B1Ep9KH9iz9pmQoAiVk7hMDqMVqP8SzzK
        Y960wb8BFqbzwxNmOn9vYUajTQ==
X-Google-Smtp-Source: AGRyM1sKdiIYMNjTRBjuxiCZLxXGBdUfp5MBs0U9Q+lvXrTgNjerprVbhOZjK57i7s5XIItJ9Jcy4w==
X-Received: by 2002:a05:6512:3a93:b0:479:76e7:3861 with SMTP id q19-20020a0565123a9300b0047976e73861mr5188182lfu.446.1655462177295;
        Fri, 17 Jun 2022 03:36:17 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id d3-20020a056512368300b00478ff020832sm591803lfs.106.2022.06.17.03.36.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jun 2022 03:36:16 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, Vinod Koul <vkoul@kernel.org>,
        linux-phy@lists.infradead.org
Subject: [PATCH 1/3] dt-bindings: phy: qcom,hdmi-phy-qmp: add clock-cells
Date:   Fri, 17 Jun 2022 13:36:06 +0300
Message-Id: <20220617103608.605898-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220617103608.605898-1-dmitry.baryshkov@linaro.org>
References: <20220617103608.605898-1-dmitry.baryshkov@linaro.org>
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

As the QMP HDMI PHY is a clock provider, add constant #clock-cells
property. For the compatibility with older DTs the property is not
marked as required.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 Documentation/devicetree/bindings/phy/qcom,hdmi-phy-qmp.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,hdmi-phy-qmp.yaml b/Documentation/devicetree/bindings/phy/qcom,hdmi-phy-qmp.yaml
index eea2e02678ed..1ada0d9857c0 100644
--- a/Documentation/devicetree/bindings/phy/qcom,hdmi-phy-qmp.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,hdmi-phy-qmp.yaml
@@ -44,6 +44,9 @@ properties:
   vddio-supply:
     description: phandle to VDD I/O supply regulator
 
+  '#clock-cells':
+    const: 0
+
   '#phy-cells':
     const: 0
 
@@ -78,6 +81,7 @@ examples:
                <&gcc 214>;
       clock-names = "iface",
                     "ref";
+      #clock-cells = <0>;
       #phy-cells = <0>;
 
       vddio-supply = <&vreg_l12a_1p8>;
-- 
2.35.1

