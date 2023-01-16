Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3249066D1FE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Jan 2023 23:52:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230238AbjAPWw2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 16 Jan 2023 17:52:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35750 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232550AbjAPWwZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 16 Jan 2023 17:52:25 -0500
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F39AD19696
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Jan 2023 14:52:21 -0800 (PST)
Received: by mail-wr1-x42a.google.com with SMTP id r9so6046126wrw.4
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Jan 2023 14:52:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Kw+oAwv+EcQEFASMBAPz2KLbf62A35edcEVc6mE7AXE=;
        b=xArFiqmd3FaAExuO7l83LFxAvnUEL8xopraUiVNoyEqoBGD8NucRzw7IFalJ29uHbE
         LKwegSH4HfW4e8mQaUu2hOWowMLqP17XJrJrAM3q2W4a9cAOvuCc6fUQppbbXDKqcBoz
         FWc0HdpoAkrQIP7hCic7pODo+f46Xr7Z5+IPCTT2Tsv1jDCyNSCeACv7JNSXahtRlX2s
         zUtrZnxSSTfFLprZWPXoOkYnJWvDrO32ZuwOGUUwGBKChVCvLI7l34mmo4HPs3BSeNnp
         0PgksXpYaoStpCR2YBN6JnCKS+S+keQbY4rAKIMbwEaDPNWjm32Td/Bwl/gmbcBH+7GC
         BSEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Kw+oAwv+EcQEFASMBAPz2KLbf62A35edcEVc6mE7AXE=;
        b=gfmYO6IZpUUNEDk2GpmP/9mJhJWtp4fw9kN36mjzklU5tLocZEBFY8g3jICNkuzAZl
         jse/oJOMlPyCm1s0wJC1aYcJsHKp5l6fFbgahj4roaL6CQN6yzto25pLxgQK8ZxwAKNh
         65j0hldvQuFYN2s+oa3BBVL+W2+j6aZXP/iE8WBs1EucAWy78f/2xJhjD6np7JC457UD
         8pomOWxoc8lKOmSqdYW8foNwyW3WZSf2dxrenz3CxM1+WYrDEmLIflJirTCRxexziFrw
         l7UkkQpfiyO1UH33BWGwEFhqK0B8PB403SBnmBXLxktSnDujYuPGwMIH1+y3WCGI+Zt6
         xzvQ==
X-Gm-Message-State: AFqh2kqiyAVnUosUml0HHndtWPL3jOlXVOuS+Y4AurGMfZRN27fkrURn
        LEptTw0sXzXxT+SGR7XaYAVyeljvrs0nd8LS
X-Google-Smtp-Source: AMrXdXsB94ueJS1PLRtGq3YTKV3HhRn7rlCDIsqMiCFJEX6AQ/ccz5iLUQBpix2OJPI9lA/gViGQRQ==
X-Received: by 2002:a5d:5646:0:b0:298:7fc:60ac with SMTP id j6-20020a5d5646000000b0029807fc60acmr8271414wrw.59.1673909540312;
        Mon, 16 Jan 2023 14:52:20 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id q15-20020adfab0f000000b002bde7999cd6sm9247880wrc.61.2023.01.16.14.52.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jan 2023 14:52:19 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org
Cc:     robdclark@gmail.com, quic_abhinavk@quicinc.com,
        dmitry.baryshkov@linaro.org, sean@poorly.run, airlied@gmail.com,
        daniel@ffwll.ch, robh+dt@kernel.org, dianders@chromium.org,
        david@ixit.cz, krzysztof.kozlowski+dt@linaro.org,
        swboyd@chromium.org, konrad.dybcio@somainline.org,
        agross@kernel.org, andersson@kernel.org,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        bryan.odonoghue@linaro.org
Subject: [PATCH v8 0/3] mdss-dsi-ctrl binding and dts fixes
Date:   Mon, 16 Jan 2023 22:52:14 +0000
Message-Id: <20230116225217.1056258-1-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.38.1
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

V8:
- Squash first and last patch to fix bisectability

link: https://lore.kernel.org/linux-arm-msm/167388664232.594279.4607492026981202284.robh@kernel.org/T/#u

V7:
- The bulk of the patches for this series have been merged.
  There are still four patches to be pushed/updated.
- Adds clocks for msm8974 - Dmitry
- Adds compat strings for sm8150, sm8350, sm8450, sm8550 - Dmitry
- Changes last patch in series to state - Rob
  compatible:
    contains:
      const: qcom,mdss-dsi-ctrl

link: https://lore.kernel.org/linux-arm-msm/20221223021025.1646636-1-bryan.odonoghue@linaro.org/

V6:
- Squashes a number of patches per Krzysztof's comments on bisectability
- Adds in Acked-by Rob and Krzysztof 

V5:
- Adds compat strings to bindings/display/msm/qcom,SoC-mdss.yaml - Dmitry
- Re-orders simple fixes to the start of the series to allow backports - Dmitry 
- VDDA and drop of node-names - Krzysztof
- Deprecates qcom,dsi-ctrl-6g-qcm2290 - Krzysztof, Dmitry
- Expands set of updated files to include new msm8953 - bod
- Converts to agreed compat string qcom,SoC-dsi-ctrl hence
  -              - qcom,mdss-dsi-ctrl-msm8996
  +              - qcom,msm8996-dsi-ctrl
- Adds RB where indicated for the compat strings.
V4:
- Moves the update of the example from patch #5 to patch #4

V3:
- Moves declaration of mdss-dsi-ctrl into compat string declaration
  patch - Krzysztof, Dmitry
- Renames qcm-2290 compat string to agreed compat "qcom,socname-dsi-ctrl"
  Dmirty, Krzysztof
- Adds empty line after if clause in yaml control flow section - Dmirty
- Adds Rb/Ack - Krzysztof, Dmitry, Doug, David
- vdd*
  Looking into this some more, I don't believe vdd, vdda, vddio ought to be
  required properties. Its up to the PCB manufacturer and the panel in-use
  how that panel is powered. Powering the panel is not something that
  even necessarily needs to be done from the dsi-ctrl driver.
  Originally marking vdd* as required in the .txt was an error, its not a
  SoC level dtsi requirement.
- clock-names
  Rather than replicate the clock-name in each if block I listed them with
  a specific description from a similar reference in usb/qcom,dwc3.yaml.
 
https://lore.kernel.org/linux-arm-msm/eb80681f-2e0b-605f-0444-ec65562f74b8@linaro.org/

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

Bryan O'Donoghue (3):
  dt-bindings: msm: dsi-controller-main: Add compatible strings for
    every current SoC
  dt-bindings: msm: dsi-controller-main: Document clocks on a per
    compatible basis
  dt-bindings: msm: dsi-controller-main: Add vdd* descriptions back in

 .../display/msm/dsi-controller-main.yaml      | 261 ++++++++++++++++--
 .../bindings/display/msm/qcom,mdss.yaml       |   3 +-
 .../display/msm/qcom,msm8998-mdss.yaml        |   8 +-
 .../display/msm/qcom,sc7180-mdss.yaml         |   6 +-
 .../display/msm/qcom,sc7280-mdss.yaml         |   6 +-
 .../display/msm/qcom,sdm845-mdss.yaml         |   8 +-
 .../display/msm/qcom,sm8150-mdss.yaml         |   8 +-
 .../display/msm/qcom,sm8250-mdss.yaml         |   8 +-
 .../display/msm/qcom,sm8350-mdss.yaml         |   6 +-
 .../display/msm/qcom,sm8450-mdss.yaml         |   4 +-
 10 files changed, 277 insertions(+), 41 deletions(-)

-- 
2.38.1

