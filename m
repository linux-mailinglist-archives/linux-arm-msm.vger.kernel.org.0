Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E416766C3B8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Jan 2023 16:24:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229725AbjAPPYK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 16 Jan 2023 10:24:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230443AbjAPPXn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 16 Jan 2023 10:23:43 -0500
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F2209234F8
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Jan 2023 07:21:32 -0800 (PST)
Received: by mail-wr1-x429.google.com with SMTP id b7so1809017wrt.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Jan 2023 07:21:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nv0qa2Y9kKxU6VGIR/RqoCE+47f00hC3eEX/3It1chk=;
        b=BKqVukHaNZ2DjWhsK2wghZ2mTsJu+9IwS9P/qGTacZ0hXj+iyool3k9BEfn8x6JXQJ
         hw3JDOmQN3yWNzSVg3VGPy9Cf5/GGU1zFY0l3Nca3VaEqh1+MzTcGR4ZGwDI7cGGdHD+
         8TbSsVQEieGnEMxsTK9HhLpZaXZ+S/SWQ+oSzinvM9LN7mM5yYZbBIsIzQqCLMBiYOlS
         KABMxb76aWIK83/ubWTSgBlSwmAq78EZ9yPnMgv4A+pmjowA8zokO7+q0ESsyUFMri9B
         KI2bEKXrT9Fif28tva4jio2E2+tU//zFGLIe0M7b2SuEdASgsbDp8+dapdW+vkNO7lZc
         seVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nv0qa2Y9kKxU6VGIR/RqoCE+47f00hC3eEX/3It1chk=;
        b=twEOCcrDZh8A/Dj962Pdxvfx+sVoRThF4NwUaK2AcxUnOKl+TwsWthU7GoC434X6IW
         sExKKLFHiinA5UL5KWIUBp11YKTE77BmGv48X2EQW0ALk+7EkK92p6Nhnd+UdvozZPHW
         PwMv1ezG3jxYqhxsxSaaBlm1FUauHoP91UpHZlpEikscSUj+xzdC0crcXvWaP4aTbffe
         8Db3J3eAiMRVTNWLomfpc7R+gutKyZvtUyH+PtxmMEa67mEVbh6U4P1vLTTactgslt6v
         tubQPKdhO1c91DYaUW8iWRZmDaWq9BzqlFl50MUD3JWqpBZMdbaMjwKsexLrwhpt2Rjk
         eu/Q==
X-Gm-Message-State: AFqh2koPhtnmiBHTEs1FTvmHO+4a7pMDVO2tk2qiy9WR3MraoJkvquuY
        pXJb0jmVuY23Gp1Hk+w/JpOdVfMgpQ8Ig1fy
X-Google-Smtp-Source: AMrXdXvzupPXPZrH8q5lavvJWVE7k7Wke3TppTjy+Xv6euTu3Vht9rwJhUpDg2Gdg2InPn98dgobaA==
X-Received: by 2002:a05:6000:1b05:b0:2b5:dc24:e08e with SMTP id f5-20020a0560001b0500b002b5dc24e08emr26936729wrz.69.1673882491286;
        Mon, 16 Jan 2023 07:21:31 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id u18-20020adff892000000b002bded7da2b8sm6874686wrp.102.2023.01.16.07.21.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jan 2023 07:21:30 -0800 (PST)
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
Subject: [PATCH v7 0/4] mdss-dsi-ctrl binding and dts fixes
Date:   Mon, 16 Jan 2023 15:21:24 +0000
Message-Id: <20230116152128.909646-1-bryan.odonoghue@linaro.org>
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

Bryan O'Donoghue (4):
  dt-bindings: msm: dsi-controller-main: Add compatible strings for
    every current SoC
  dt-bindings: msm: dsi-controller-main: Document clocks on a per
    compatible basis
  dt-bindings: msm: dsi-controller-main: Add vdd* descriptions back in
  dt-bindings: display/msm: Add list of mdss-dsi-ctrl compats

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

