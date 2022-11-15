Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 31C16629720
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Nov 2022 12:18:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232839AbiKOLSZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 15 Nov 2022 06:18:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236559AbiKOLSB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 15 Nov 2022 06:18:01 -0500
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3932027FDC
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Nov 2022 03:17:33 -0800 (PST)
Received: by mail-ej1-x635.google.com with SMTP id f18so2191948ejz.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Nov 2022 03:17:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=f6IjOuxVRqwYYk9pLv1Yfn07Gi6XGY94dgyzaZaHkoI=;
        b=puMBpdWyj4ubsojCo/jC54Hst8XON3KObkLMeAubcKA6ihpqoIIDRkJRvVIQCMJ1YP
         7eYr5a7zHxqqgsEuzmiMYYTazppiXKn+gSLR1tX9tuNh9OlcJhOsfU9MVeQsUOcTqsdv
         5njesmo3FllfcDseoIMj9J+nHjEUgrq4sKghAnOETIr1jkbt3lnW6rjGAaAtLBO2cI8c
         UpqCQNu7F2MLUz9fIbW3PH+I78Ux5G+zWgal1/0RHbC7JQYj5HvLaPhJwNLKuPHK3X2b
         n+8I1dMIX0BhhtsmDr3YURxUhOhIpJymN0jsjr6wD+y42GeSA2CQjo5h6ghaSvTfET+0
         Nguw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=f6IjOuxVRqwYYk9pLv1Yfn07Gi6XGY94dgyzaZaHkoI=;
        b=VZAoUQsmzgu4xNOgFILCLB0rvnKHwsEbSSDJ4dSmD02fTZcNoLsLWcnMkVuT3U9Scw
         DBjRNh7BwObAmLBZnxki85bmMA4G5fEYrquD6KlMnAUAcQ9Z6cFZ5Cxv1dcZ9n0Z7cEB
         zWQFuhYVo/Pa3chdfrdyPPF1b4X9XhSuYlzodYQej8D4VN0Jr1fYn78ClDhsFntYmqrw
         HVjHvsQq6Iuc7sJcTq0rx/r5liIANLSeAr0F+BFm4uiQ7Poa4J6vT9xxHRzjaLBjjHhW
         UiqiRdHmgi8UVZh/GJSHP/bJB8TXafpp2ivn3Jjoe9NEQBCl3Or38uG92xfJ6fDGDi48
         81OQ==
X-Gm-Message-State: ANoB5pljHFxAuOhTn4v1gbJvMbrKDfneRuvqXn+Nbii36EFw/XkmIdXW
        sDD/eyI6vTEluRXmutq0pQD3lw==
X-Google-Smtp-Source: AA0mqf5IysjqPGQiH0eOOXTA4zlm4ZoIUc/ikYmnFKhdkc7e/dZX+QzxUMdfSlI1E9bvlfo9aJxpaw==
X-Received: by 2002:a17:906:388c:b0:7aa:97c7:2c04 with SMTP id q12-20020a170906388c00b007aa97c72c04mr13520583ejd.191.1668511051709;
        Tue, 15 Nov 2022 03:17:31 -0800 (PST)
Received: from prec5560.. (freifunk-gw.bsa1-cpe1.syseleven.net. [176.74.57.43])
        by smtp.gmail.com with ESMTPSA id eg25-20020a056402289900b00457b5ba968csm5973519edb.27.2022.11.15.03.17.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Nov 2022 03:17:28 -0800 (PST)
From:   Robert Foss <robert.foss@linaro.org>
To:     robdclark@gmail.com, quic_abhinavk@quicinc.com,
        dmitry.baryshkov@linaro.org, sean@poorly.run, airlied@linux.ie,
        daniel@ffwll.ch, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, agross@kernel.org,
        bjorn.andersson@linaro.org, konrad.dybcio@somainline.org,
        quic_kalyant@quicinc.com, swboyd@chromium.org,
        robert.foss@linaro.org, angelogioacchino.delregno@somainline.org,
        loic.poulain@linaro.org, vkoul@kernel.org,
        quic_vpolimer@quicinc.com, dianders@chromium.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Jonathan Marek <jonathan@marek.ca>,
        vinod.koul@linaro.org, quic_jesszhan@quicinc.com,
        andersson@kernel.org
Subject: [PATCH v2 00/12] Enable Display for SM8350
Date:   Tue, 15 Nov 2022 12:17:09 +0100
Message-Id: <20221115111721.891404-1-robert.foss@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=1.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_SBL_CSS,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Level: *
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
https://git.linaro.org/people/robert.foss/linux.git/log/?h=sm8350_dsi_v2

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
 

Robert Foss (12):
  dt-bindings: display: msm: Add qcom,sm8350-dpu binding
  dt-bindings: display: msm: Add qcom,sm8350-mdss binding
  drm/msm/dpu: Refactor sc7280_pp location
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
 .../display/msm/qcom,sm8350-mdss.yaml         | 240 +++++++++++++
 arch/arm64/boot/dts/qcom/sm8350-hdk.dts       | 332 ++++++++++++++++++
 arch/arm64/boot/dts/qcom/sm8350.dtsi          | 226 +++++++++++-
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    | 210 ++++++++++-
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |   1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |   1 +
 drivers/gpu/drm/msm/msm_mdss.c                |   4 +
 8 files changed, 1108 insertions(+), 26 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,sm8350-dpu.yaml
 create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,sm8350-mdss.yaml

-- 
2.34.1

