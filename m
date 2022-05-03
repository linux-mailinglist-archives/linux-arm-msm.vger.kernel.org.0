Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1D13C51912D
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 May 2022 00:16:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243514AbiECWNE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 3 May 2022 18:13:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52780 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233631AbiECWNE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 3 May 2022 18:13:04 -0400
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19F54419B1
        for <linux-arm-msm@vger.kernel.org>; Tue,  3 May 2022 15:09:30 -0700 (PDT)
Received: by mail-lj1-x22f.google.com with SMTP id 4so23636251ljw.11
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 May 2022 15:09:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tyry8wJ59egG0H5SK/jTT/dzqJg71vKONwvUqY1kOig=;
        b=rcu7A/mFmyI/94UFw7ixP6fgjzXlcridf531j21P7ejbOCLt8IZac/a0zopMwmcWbu
         XkT5lMQ/yXb9XcS0I3MCDXqx1ip4WavHpm2igXsJbaxKmLjUi+zrZeIWKf1hwRLQF7as
         qRDHHKsWhTPxltSJsE3KUQmNOY9O3qwwn+RPqUtm5i8YvQyHWvu4pam/r1rDyQKKm+hx
         GyUJ4r4q+X0ZB/PMkyhPJfBXO8DHG6dK01xXy3p+ocd46SATbUS/GCVjkgZlmqndk31d
         FENLYmLaWErNZhGttb6XodezeEMrkLMkypupmb9a8SplR65cyuVSzNftMsU+LtubEL4O
         zwvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tyry8wJ59egG0H5SK/jTT/dzqJg71vKONwvUqY1kOig=;
        b=xnrgU4Ypc7OIsXaiBeiQ7OlmdsXj1Y+0d/f2/LD6wvOVcBDG3QXSUVwaLVgpUHzldI
         Y3QsUkVDZcW6BVFgIozamQtHCfUxYFmHXpmyJzYSOsBe+wptbtZUm2gnhkYJsxMf3+po
         9dsVRuVjUUkDN9fS9gwmMnj2PbShrZTXri2yChYLXbkXWDq+pZMNE80c2ynH1LfwK9aZ
         IxsE2R3me7MIvurL+ene0w7bGcl3DnINLNxFRV1ONNNFGUhrITwP0hx8cVuN19+kzB1m
         xZfa7yPyIE7yQG126fJX/qEWJ+iAV2/n1CNLUaF9taCIyzvdSUfoL7vupo2aUeF9j6PK
         VZgg==
X-Gm-Message-State: AOAM5311TVBk4Qhy+mbt/lntwq8/mLLaYnZStX0/tWaTuVaXHvY8iwaf
        xAvgLRHESRk6wzSu4TYoPl6B63sEhTC5/g==
X-Google-Smtp-Source: ABdhPJzUtxpXZuzgASmJYnIUuTQuKVApDqJ1B7xy+olU7J1q7CVqsV1eXRTIsZbzVQ9Wax9oTFvimQ==
X-Received: by 2002:a05:651c:104f:b0:24f:3fc4:1892 with SMTP id x15-20020a05651c104f00b0024f3fc41892mr10936018ljm.399.1651615768430;
        Tue, 03 May 2022 15:09:28 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id j9-20020ac24549000000b0047255d2111bsm1042349lfm.74.2022.05.03.15.09.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 May 2022 15:09:27 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v1 0/5] arm64: dts: qcom: initial Inforce IFC6560 board support
Date:   Wed,  4 May 2022 01:09:22 +0300
Message-Id: <20220503220927.960821-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
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

This work is largely based on the previous work by Bjorn Andersson ([1])

Changes since Bjorn's v2:
- Disable dsi1, dsi1 phy, GPU by default in sdm660.dtsi/sdm630.dtsi
- Fix qusb2phy ref clock
- Added USB2 host support to sdm630.dtsi
- Renamed DTS to follow SoC-vendor-board pattern
- Fixed vph_pwr voltage
- Removed extra/unrelated comments
- Added keys, USB2, USB3,
- Added configuration for the attached HDMI bridge
- Enabled MDP, MDSS and DSI0/DSI0 PHY devices
- Removed uart pinctrl and /reserved-mem nodes (present in main dtsi
  file)
- Added card detection for the SDCC2
- Disabled BLSP BAM DMA devices, they make the board reset during boot

[1] https://lore.kernel.org/linux-arm-msm/20210825221110.1498718-1-bjorn.andersson@linaro.org/#t

Dmitry Baryshkov (5):
  arm64: dts: qcom: sdm660: disable dsi1/dsi1_phy by default
  arm64: dts: qcom: sdm630: disable GPU by default
  arm64: dts: qcom: sdm630: fix the qusb2phy ref clock
  arm64: dts: qcom: sdm630: add second (HS) USB host support
  arm64: dts: qcom: sdm660: Add initial Inforce IFC6560 board support

 arch/arm64/boot/dts/qcom/Makefile             |   1 +
 .../boot/dts/qcom/sda660-inforce-ifc6560.dts  | 455 ++++++++++++++++++
 arch/arm64/boot/dts/qcom/sdm630.dtsi          |  59 ++-
 arch/arm64/boot/dts/qcom/sdm660.dtsi          |   3 +
 4 files changed, 517 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm64/boot/dts/qcom/sda660-inforce-ifc6560.dts

-- 
2.35.1

