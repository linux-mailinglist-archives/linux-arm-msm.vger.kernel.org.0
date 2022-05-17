Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 713E6529A05
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 May 2022 09:01:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240442AbiEQHB2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 17 May 2022 03:01:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33762 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231332AbiEQHBX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 17 May 2022 03:01:23 -0400
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB4BA12773
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 May 2022 00:01:19 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id dk23so32795995ejb.8
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 May 2022 00:01:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=SaU/TiiHzOkzid5l5kcU60hkgpxxTP5zphiGicoFW6s=;
        b=VN86rM2WjHmr3FgpcI8Qs7A0wMDf3qtuM4S0db7k/Q/YUxhL7OKt0HptPq947qUgur
         iAta1C9xIyG61HsStuVkfSYLG1Lxv8c0gnwD/2jTQTFDVJGR/rw5Mh1kU07rGLw5SW7P
         6fVMfKtp3Ff/s8iUmkTb5VKuZOjBL7OGYpYS2cyDo/IeTBzoogfwR4phVgRzV4bNAMRQ
         HvfZn3Ddc7pb82Fl+LZClUdZ9D/oKBUxvfhCZkfE/U4RdlrIP7z2mCPR+LwlHNvX0weO
         S6N9NNbtYVHoDogJfu+rgLyJCg4k8I6cgHdxOJU5QOixXSYBh2EmRgudQGa8Gu1HSj66
         1ZUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=SaU/TiiHzOkzid5l5kcU60hkgpxxTP5zphiGicoFW6s=;
        b=1SfJnSl3t+zdpGpTN1Vi+gX4UoJsNfPY7go3bI2gFHTSoAIZnH6YXHT1r3uDM35j+u
         DPHTGg8WMPh+i1cZlPsErBlt9XYNkzXzDRt4l1lZgDCh/Wxopoo92PzVJbW9Y19F7US7
         jvtXnlEgYP89osNccHgDSeWWiJlX7vod5GREcIehWHoH2TF3g3W5ML9s3HzxR0lq5t/y
         MN37JzCL3iC/DXQiCYTybv2E49HcmoFYP8gSibD5mnvO3lfVvVw+Fc9Whf8N9UsmqY4F
         qRMj7/GjhoKPHGrHFqcxyNukQbHej1wtH7zuGVQA8I5IrH4NKlbBPL9tPdvRWoA7mrFt
         ONrQ==
X-Gm-Message-State: AOAM533yJ6t75iCfEvjZ1qu7NToW6qaWr8apO/2Mevx7UEeoHZMthCr1
        MKNLYOchH6eRFeDehT5SgBseHQ==
X-Google-Smtp-Source: ABdhPJxLRA8R7wyAh+sZEOnRDPTPf7DTDWmLEvSHN98IzYQfKyUsReLw3wbAhhm71SaV8Nhdaf2cGw==
X-Received: by 2002:a17:907:629c:b0:6e1:6ad:5dd8 with SMTP id nd28-20020a170907629c00b006e106ad5dd8mr18105378ejc.641.1652770877949;
        Tue, 17 May 2022 00:01:17 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id b5-20020a056402138500b0042617ba637esm6487016edv.8.2022.05.17.00.01.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 May 2022 00:01:17 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 00/12] dt-bindings: remoteproc: qcom: cleanups and improvements
Date:   Tue, 17 May 2022 09:01:01 +0200
Message-Id: <20220517070113.18023-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.32.0
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

Hi,

Patches are mostly independent, so they can go via:
1. Qualcomm SoC (dt-bindings/soc: + arm64)
2. remoteproc (dt-bindings).

Changes since v1
================
1. Add review tags
2. Patch 8: Remove ref from label (Rob)

Best regards,
Krzysztof

Krzysztof Kozlowski (12):
  dt-bindings: soc: qcom,wcnss: remove unneeded ref for names
  dt-bindings: remoteproc: remove unneeded ref for names
  dt-bindings: remoteproc: qcom,adsp: add interconnects
  dt-bindings: remoteproc: qcom,adsp: simplify interrupts
  dt-bindings: remoteproc: qcom,adsp: simplify SM8150 power domains
  dt-bindings: remoteproc: qcom,adsp: use GIC_SPI defines in example
  dt-bindings: remoteproc: qcom,glink-edge: define re-usable schema for
    glink-edge
  dt-bindings: remoteproc: qcom,smd-edge: define re-usable schema for
    smd-edge
  arm64: dts: qcom: ipq6018: add label to remoteproc node
  arm64: dts: qcom: sdm630: remove unneeded address/size cells in
    glink-edge
  arm64: dts: qcom: sm8350: remove duplicated glink-edge interrupt
  arm64: dts: qcom: sm8450: remove duplicated glink-edge interrupt

 .../bindings/remoteproc/qcom,adsp.yaml        | 74 ++++++----------
 .../bindings/remoteproc/qcom,glink-edge.yaml  | 72 ++++++++++++++++
 .../remoteproc/qcom,qcs404-cdsp-pil.yaml      |  1 -
 .../remoteproc/qcom,sc7280-wpss-pil.yaml      | 21 ++---
 .../remoteproc/qcom,sdm845-adsp-pil.yaml      |  1 -
 .../bindings/remoteproc/qcom,smd-edge.yaml    | 85 +++++++++++++++++++
 .../bindings/soc/qcom/qcom,smd.yaml           | 53 +-----------
 .../bindings/soc/qcom/qcom,wcnss.yaml         |  1 -
 arch/arm64/boot/dts/qcom/ipq6018.dtsi         |  1 +
 arch/arm64/boot/dts/qcom/sdm630.dtsi          |  2 -
 arch/arm64/boot/dts/qcom/sm8350.dtsi          |  1 -
 arch/arm64/boot/dts/qcom/sm8450.dtsi          |  1 -
 12 files changed, 193 insertions(+), 120 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/remoteproc/qcom,glink-edge.yaml
 create mode 100644 Documentation/devicetree/bindings/remoteproc/qcom,smd-edge.yaml

-- 
2.32.0

