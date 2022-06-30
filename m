Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 209F95619DC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Jun 2022 14:08:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232842AbiF3MIw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 30 Jun 2022 08:08:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51812 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230350AbiF3MIv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 30 Jun 2022 08:08:51 -0400
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72661205C1
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jun 2022 05:08:49 -0700 (PDT)
Received: by mail-wr1-x42b.google.com with SMTP id v14so26958338wra.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jun 2022 05:08:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=b+2KfJ+EbtiUw/VFlCJvwTsR648bOr42JoNq/qybfo0=;
        b=tlAlhjc6NZN7ne6vQQPlSmUWHBOWkq6YIolr+75AcP9IiMe7sRBNCo+XTzQUR1fXN0
         2bQlmeJCzRQ3xHciw1xCY6gxg9aJ71INftV391l3/TmYL4vsubg/eZxvAD5xyu4G4YGG
         /6oCIBcdOTRbWjJrif47hNyBPIFO6OOko2gxi4w1VvPq8+UeSx9ZeHqKVtWX3BrsDxkQ
         Bv3ENwd4eOHgqb9kPbTz6YgBXAlaAlqnpjy+PBCTw82ZBlvIkMiaa1ZvA9r4F9eZcvY8
         6OCh7JiR47yYqRfn/c1yK5SeURqJu8nWtfwuMHUbbZTJAiZi8ftu4z8rP/W5O/MKQ8n+
         jCAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=b+2KfJ+EbtiUw/VFlCJvwTsR648bOr42JoNq/qybfo0=;
        b=6XtC+S2TUFrPiySy8qwwsYwxpysGJ8SUbHl/e7AwWq7mJ3FasBpyZr8IavCTEXsA0m
         3DUJN8XM/4xqmWDTey7n2Ts2FhTAeYsL5wLlBC5sh8iIS6BhgPTZK1Aq1Bqg/Y/e6wTo
         eibAN3OGVWlnN52br+FVvGEQdvTieoiMOmLol4CNJFWyCwhAxzc7WqT/3cERTaRtXXmB
         0neeL367dFZ6T4ty8Qt11O1pp4Vh74DV8a67WtjREN2kPOye11uIlezl4kqGqRnfR2SM
         aeH5VpUESgy4rpSG/ilFG12WX6L+953TUokegkqgXKr3+/CLiOdcP5fDm9EGCU3sQ4rP
         vehg==
X-Gm-Message-State: AJIora8Jbst2km7c2m3wG2pz83nChY/OgPZMzI8eTYtWWt0hM9oV8jE9
        fZtEZFea20hO2ok491dpb8xkOw==
X-Google-Smtp-Source: AGRyM1tu763LSSFunvSobsS1rb3AceLNnzNP0wf4briumXSyFXIpk6oc7PQ8fjdRvuPu9CZqhod1rg==
X-Received: by 2002:a5d:6a81:0:b0:21d:3f7a:3 with SMTP id s1-20020a5d6a81000000b0021d3f7a0003mr1991415wru.300.1656590927998;
        Thu, 30 Jun 2022 05:08:47 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id m1-20020a7bcb81000000b003a05621dc53sm6286532wmi.29.2022.06.30.05.08.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jun 2022 05:08:47 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     robdclark@gmail.com, quic_abhinavk@quicinc.com,
        dmitry.baryshkov@linaro.org, sean@poorly.run, airlied@linux.ie,
        daniel@ffwll.ch, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org
Cc:     quic_mkrishn@quicinc.com, swboyd@chromium.org,
        bjorn.andersson@linaro.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, bryan.odonoghue@linaro.org
Subject: [PATCH 0/7] msm8916/msm8939 DSI controller and DSI PHY bindings fixes
Date:   Thu, 30 Jun 2022 13:08:38 +0100
Message-Id: <20220630120845.3356144-1-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.36.1
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

This series fixes up a number of dtbs checks which are being flagged adding
in the msm8939 dtsi.

When converting from .txt to .yaml a number of the parameters for the older
msm8916 silicon were not transmitted into the yaml.

Adding in the msm8939 which is a near 1:1 copy of the msm8916 in terms of
dtsi triggers a rake of dtbs checks as a result.

Bryan O'Donoghue (7):
  dt-bindings: msm: dsi: Fix phy-name binding
  dt-bindings: msm: dsi: Fix operating-points-v2 constraint
  dt-bindings: msm: dsi: Fix power-domains constraint
  dt-bindings: msm: dsi: Add vdd* descriptions back in
  dt-bindings: msm: dsi: Fix clock declarations
  dt-bindings: msm: dsi: Add missing clocks to 28nm DSI PHY YAML
  dt-bindings: msm: dsi: Add missing qcom,dsi-phy-regulator-ldo-mode

 .../display/msm/dsi-controller-main.yaml      | 39 ++++++++++++++-----
 .../bindings/display/msm/dsi-phy-28nm.yaml    | 20 ++++++++++
 2 files changed, 49 insertions(+), 10 deletions(-)

-- 
2.36.1

