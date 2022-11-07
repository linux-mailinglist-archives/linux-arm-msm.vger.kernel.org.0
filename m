Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6F42062040E
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Nov 2022 00:57:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232075AbiKGX5B (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 7 Nov 2022 18:57:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232464AbiKGX5A (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 7 Nov 2022 18:57:00 -0500
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9FCD24940
        for <linux-arm-msm@vger.kernel.org>; Mon,  7 Nov 2022 15:56:57 -0800 (PST)
Received: by mail-wm1-x32e.google.com with SMTP id t1so7812889wmi.4
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Nov 2022 15:56:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GU52ibE5W1Ny+2F+t/pHhZX3DcUfXCRbANW17FzXrZY=;
        b=wMiu0FtWxeys401bXBYoNGlRQgCh89/EhZvDVmpFhWSRTockH7/a6bxBTEO45fCQbC
         DoQ7JscuimI+m2Gc6cxaNkiFjZy1T0rQN3747GzbxcBuQHEGvZ2syORvgkHDspJPDf7Y
         S7DHgxoeSXuz4hlo+tzsMkxo2LUCw9rV87zyvWWWJzb6DuQoxEOdrUCdKS3z3h31xYl9
         Q2xGWxf5Bvet5JVB3bqxmAmgcB/R5eZgY+SNgU7W9eeHu/jUybbMcUX8Ucge0OR6IFL1
         DLCRFGTJanJ06RiHqE9l48z9ZWFAO+NvHhAFV1tSLvFvupzLxuVKRSRfU09mDoR3IstX
         My/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GU52ibE5W1Ny+2F+t/pHhZX3DcUfXCRbANW17FzXrZY=;
        b=UhOoOrBxgeNZw3FLfYTG7aSS4CQlwZGTDNmWMCuH7bxSsA9ewh2dz478M3f7eFZnAk
         6m1G6a6xWVDjZy+5oLR2T+Tf2+dLO5fKt90PGHnJI9M2rk9mHMuRwMvrh9iVxZBhC5KM
         moyq0tLIMbDrSDuOZZ95rGf4zOiIRRvv9Nx8C6IFVo7j7UoreQUc2lTeUc94y/NAR7FN
         fN154PW9h3fu6PC73SC1FoDWWkZoYZSduHEZwJ1K/DOpbcXTI2CpoEApEQXOJrTino2/
         TFaRfC9rcUUw0hMqqJt1G6NYDEp+EWkAW3HcIPg/5YO1pu4Y5p8wRWvmKj8j+TH+fehc
         N96Q==
X-Gm-Message-State: ACrzQf0QrpS/gAHuz5Q+hmBzlRj/kBUFN2A7B7VymIFC+m+t9iz99U4z
        v6Q4ZQaAgYJC4zOjCuxAd5lZnvyhClfh+g==
X-Google-Smtp-Source: AMsMyM7U8IL9WWeqrjShfAUHl+oniNtE4JZfPniCI8v1rkeUxYA6QYX93jgKWCsEo/aBnrX/3kd+KA==
X-Received: by 2002:a05:600c:c1:b0:3cf:63e3:bd73 with SMTP id u1-20020a05600c00c100b003cf63e3bd73mr34635503wmm.206.1667865416514;
        Mon, 07 Nov 2022 15:56:56 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id b18-20020a056000055200b00236545edc91sm8386161wrf.76.2022.11.07.15.56.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Nov 2022 15:56:56 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     robdclark@gmail.com, quic_abhinavk@quicinc.com,
        dmitry.baryshkov@linaro.org, krzysztof.kozlowski+dt@linaro.org,
        robh+dt@kernel.org, quic_mkrishn@quicinc.com,
        linux-arm-msm@vger.kernel.org
Cc:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: [PATCH v2 00/18] mdss-dsi-ctrl binding and dts fixes
Date:   Mon,  7 Nov 2022 23:56:36 +0000
Message-Id: <20221107235654.1769462-1-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.38.1
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

V2:
https://www.spinics.net/lists/linux-arm-msm/msg116326.html

- Moves the DSI PHY changes to a different later series.
  There are enough dsi-controller-main changes to justify its own
  standalone series.

- The original phy-name binding change given discussion with Rob and
  Krzysztof became its own standalone series that has since been merged.
  https://www.mail-archive.com/dri-devel@lists.freedesktop.org/msg403214.html

- Retains the drop of power-domain from yaml as a required property.
  I dug into the available dtsi. The apq8064 doesn't appear to have any
  GDSC which can be attached as a power-domain, which means the
  power-domain requirement is not universal across the various silicon
  versions.

- Adds Dmitry's RB to power-domain drop

- For the clock declarations I've
  * I noticed that the simple change I had worked for msm8939 but
    subsquently broke other dtsi which drove a bigger change to document
    the clocks on a per compatible basis.
  * Added compat strings in yaml.
  * Moved the allOf down later in the file to acomodate the if/then.
  * Number of clocks validated on a per compatible basis
  * The driver code which doesn't care about the number of clocks
    can still operate on the mdss-dsi-ctrl compat but the dts checks will
    validate against the compat string and yaml.

- vdd descriptions
  Took the previous text I missed from the .txt file - Krzysztof, Dmitry
  Adds vdd, vdda and vddio to the required list. This exposes warnings in
  existing dtsi but the previous .txt declared these regulators as
  required. - Krzysztof
 
V1:
This series fixes up a number of dtbs checks which are being flagged adding
in the msm8939 dtsi.


When converting from .txt to .yaml a number of the parameters for the older
msm8916 silicon were not transmitted into the yaml.

Adding in the msm8939 which is a near 1:1 copy of the msm8916 in terms of
dtsi triggers a rake of dtbs checks as a result.

https://www.mail-archive.com/dri-devel@lists.freedesktop.org/msg403211.html

Bryan O'Donoghue (18):
  dt-bindings: msm: dsi-controller-main: Fix operating-points-v2
    constraint
  dt-bindings: msm: dsi-controller-main: Fix power-domain constraint
  dt-bindings: msm: dsi-controller-main: Add vdd* descriptions back in
  dt-bindings: msm: dsi-controller-main: Fix clock declarations
  dt-bindings: msm: dsi-controller-main: Fix description of core clock
  dt-bindings: msm: dsi-controller-main: Alphanumerically sort
    compatible enum
  dt-bindings: msm: dsi-controller-main: Add compatible strings for
    every current SoC
  dt-bindings: msm: dsi-controller-main: Document clocks on a per
    compatible basis
  ARM: dts: qcom: apq8064: add compat qcom,mdss-dsi-ctrl-apq8064
  ARM: dts: qcom: msm8974: Add compat qcom,mdss-dsi-ctrl-msm8974
  arm64: dts: qcom: msm8916: Add compat qcom,mdss-dsi-ctrl-msm8916
  arm64: dts: qcom: msm8996: Add compat qcom,mdss-dsi-ctrl-msm8996
  arm64: dts: qcom: sc7180: Add compat qcom,mdss-dsi-ctrl-sc7180
  arm64: dts: qcom: sc7280: Add compat qcom,mdss-dsi-ctrl-sc7280
  arm64: dts: qcom: sdm630: Add compat qcom,mdss-dsi-ctrl-sdm630
  arm64: dts: qcom: sdm660: Add compat qcom,mdss-dsi-ctrl-sdm660
  arm64: dts: qcom: sdm845: Add compat qcom,mdss-dsi-ctrl-sdm845
  arm64: dts: qcom: sm8250: Add compat qcom,mdss-dsi-ctrl-sm8250

 .../display/msm/dsi-controller-main.yaml      | 185 ++++++++++++++++--
 arch/arm/boot/dts/qcom-apq8064.dtsi           |   3 +-
 arch/arm/boot/dts/qcom-msm8974.dtsi           |   3 +-
 arch/arm64/boot/dts/qcom/msm8916.dtsi         |   3 +-
 arch/arm64/boot/dts/qcom/msm8996.dtsi         |   6 +-
 arch/arm64/boot/dts/qcom/sc7180.dtsi          |   3 +-
 arch/arm64/boot/dts/qcom/sc7280.dtsi          |   3 +-
 arch/arm64/boot/dts/qcom/sdm630.dtsi          |   3 +-
 arch/arm64/boot/dts/qcom/sdm660.dtsi          |   3 +-
 arch/arm64/boot/dts/qcom/sdm845.dtsi          |   6 +-
 arch/arm64/boot/dts/qcom/sm8250.dtsi          |   6 +-
 11 files changed, 194 insertions(+), 30 deletions(-)

-- 
2.38.1

