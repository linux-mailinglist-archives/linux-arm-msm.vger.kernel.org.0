Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3427F642D23
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Dec 2022 17:39:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232482AbiLEQjn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 5 Dec 2022 11:39:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35146 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232644AbiLEQjQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 5 Dec 2022 11:39:16 -0500
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF1CF1FCDC
        for <linux-arm-msm@vger.kernel.org>; Mon,  5 Dec 2022 08:38:00 -0800 (PST)
Received: by mail-ej1-x62f.google.com with SMTP id x22so6820600ejs.11
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 Dec 2022 08:38:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=vw1KzIGH3Ss6fc3E2pWM7Y1p2LnTyddlJD34yedCJAo=;
        b=pTffiomX2l7lpqqQICVRZW2YjRrUfsAG9YcxMc6p6E3UP+pPkbCOkb9YR3AoCGXC4c
         uJeTGVrrIGm4cp5rb4tLmQqoMEBwH+Tgh3t9WBD0IeGETbJjDsFTV9nDJeLhc5XdWhsZ
         eHUU9Jx0Gczcn80vfl33SKaNwgzfLSf3bQmGGT/8P3kz0DLCaBlG/gAZZP1CozHMziKF
         cLZ0eADIBn4sz2f+tKf+06++2PynfoQbijcqj7zvIHcFRFWXN+DodmbngpiV8Jl7ehoy
         OFEzrEaSVGT0abiluET+em7HubIg+MQvZjm8YmSTRyjaTrEBD/wm9UEIhqqHLQxGSQqi
         xFDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vw1KzIGH3Ss6fc3E2pWM7Y1p2LnTyddlJD34yedCJAo=;
        b=Wtm66zVTUu9Ed1/5e7VO5O9n6TKVnbOcO9yvg9lbb24fO7Q8l2QErzCz9FnRy2w9ej
         DJBNAT3T9fRN9jhizrUe/vAaA9EmPJINKSJSa1PRImRYYbXkPDw+dR9qKNczUt5f7qKb
         EiDr69v5JIlHvJLT2KDpARt1V+5kDmAmcQsm0tyLWO5Y5hxyEISZ+596FJfrgZrFEuu+
         k3GK2+w8XZlKuqyVQDOgiA7e89EGxl2rW5az7H4oBXnZ0qT3hQI3avGMgOz4M0uueiPg
         Onvu10WQnDaL2a0dI8NWN96JKjlXDMGeI8qr16XodWg+WzK+ho0ssBJrkwYU+uoBWnVj
         RQfw==
X-Gm-Message-State: ANoB5pkUjKX+rD845TQFjQ1IXxTKCLJaQ2PYxaq2jb9r5Z6y4pMrDFCe
        7FH2QM8+betu7UB1SRGHiT+OXA==
X-Google-Smtp-Source: AA0mqf5eJN8MzV9ViJA/mumudvzKh8vziLSQLFAlZs+wrELKleuv/lGeIxtJNoSPv68nbYDzR5yvAw==
X-Received: by 2002:a17:906:240f:b0:7c0:f7b0:fbbb with SMTP id z15-20020a170906240f00b007c0f7b0fbbbmr4155635eja.266.1670258279325;
        Mon, 05 Dec 2022 08:37:59 -0800 (PST)
Received: from prec5560.localdomain (ip5f58f364.dynamic.kabel-deutschland.de. [95.88.243.100])
        by smtp.gmail.com with ESMTPSA id e21-20020a170906315500b007bed316a6d9sm6413610eje.18.2022.12.05.08.37.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Dec 2022 08:37:58 -0800 (PST)
From:   Robert Foss <robert.foss@linaro.org>
To:     robdclark@gmail.com, quic_abhinavk@quicinc.com,
        dmitry.baryshkov@linaro.org, sean@poorly.run, airlied@linux.ie,
        daniel@ffwll.ch, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, agross@kernel.org,
        bjorn.andersson@linaro.org, konrad.dybcio@somainline.org,
        quic_kalyant@quicinc.com, angelogioacchino.delregno@somainline.org,
        robert.foss@linaro.org, loic.poulain@linaro.org,
        swboyd@chromium.org, quic_vpolimer@quicinc.com, vkoul@kernel.org,
        dianders@chromium.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jonathan Marek <jonathan@marek.ca>, vinod.koul@linaro.org,
        quic_jesszhan@quicinc.com, andersson@kernel.org
Subject: [PATCH v3 00/11] Enable Display for SM8350
Date:   Mon,  5 Dec 2022 17:37:43 +0100
Message-Id: <20221205163754.221139-1-robert.foss@linaro.org>
X-Mailer: git-send-email 2.34.1
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

Dependencies:
https://lore.kernel.org/all/20221102231309.583587-1-dmitry.baryshkov@linaro.org/
https://lore.kernel.org/all/20221024164225.3236654-1-dmitry.baryshkov@linaro.org/
https://lore.kernel.org/all/20221104130324.1024242-5-dmitry.baryshkov@linaro.org/

Branch:
https://git.linaro.org/people/robert.foss/linux.git/log/?h=sm8350_dsi_v3


This series implements display support for SM8350 and
enables HDMI output for the SM8350-HDK platform.


Changes from v1:
 - Added R-b tags from v1
 - Added qcom,sm8350-dpu binding patch
 - Added qcom,sm8350-mdss binding patch
 - Corrected sm8350.dtsi according to new dpu/mdss bindings
 - Bjorn: Removed regulator-always-on property from lt9611_1v2 regulator
 - Bjorn: Moved lt9611 pinctl pins into a common node
 - Bjorn/Krzysztof: Moved status property to last in node
 - Krzysztof: Changed hdmi-out to hdmi-connector
 - Krzysztof: Fixed regulator node name
 - Krzysztof: Changed &mdss to status=disabled as default
 - Krzysztof: Changed &mdss_mdp node name to display-controller
 - Krzysztof: Fixed opp-table node name
 - Krzysztof: Fixed phy node name
 - Dmitry: Split commit containing dpu & mdss compatibles string
 - Dmitry: Added msm_mdss_enable case
 - Dmitry: Fixed dpu ctl features
 
Changes from v2:
 - Rob: Added r-b
 - Rob: Improved mdss binding description
 - Rob: Added interconnect names for mdss-binding
 - Rob: Removed phy from example
 - Konrad: Remove sc7280_pp refactor patch
 - Konrad: Fixed upper case hex in dpu_hw_catalog
 - Konrad: Fixed various downstream dts based values for dpu_hw_catalog
 - Konrad: Removed status=disabled from mdss_mdp
 - Konrad: Removed phy-names from dsi nodes
 - Konrad/Dmitry: Change mdp_opp_table opp-200000000 to use &rpmhpd_opp_svs, add comment
 - Dmitry: Move mdp_opp_table to dsi0 node


Robert Foss (11):
  dt-bindings: display: msm: Add qcom,sm8350-dpu binding
  dt-bindings: display: msm: Add qcom,sm8350-mdss binding
  drm/msm/dpu: Add SM8350 to hw catalog
  drm/msm/dpu: Add support for SM8350
  drm/msm: Add support for SM8350
  arm64: dts: qcom: sm8350: Add &tlmm gpio-line-names
  arm64: dts: qcom: sm8350: Remove mmxc power-domain-name
  arm64: dts: qcom: sm8350: Use 2 interconnect cells
  arm64: dts: qcom: sm8350: Add display system nodes
  arm64: dts: qcom: sm8350-hdk: Enable display & dsi nodes
  arm64: dts: qcom: sm8350-hdk: Enable lt9611uxc dsi-hdmi bridge

 .../bindings/display/msm/qcom,sm8350-dpu.yaml | 120 +++++++
 .../display/msm/qcom,sm8350-mdss.yaml         | 221 ++++++++++++
 arch/arm64/boot/dts/qcom/sm8350-hdk.dts       | 332 ++++++++++++++++++
 arch/arm64/boot/dts/qcom/sm8350.dtsi          | 228 +++++++++++-
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    | 196 +++++++++++
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |   1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |   1 +
 drivers/gpu/drm/msm/msm_mdss.c                |   4 +
 8 files changed, 1084 insertions(+), 19 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,sm8350-dpu.yaml
 create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,sm8350-mdss.yaml

-- 
2.34.1

