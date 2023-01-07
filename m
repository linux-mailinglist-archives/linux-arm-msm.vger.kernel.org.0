Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C0B5D660E3B
	for <lists+linux-arm-msm@lfdr.de>; Sat,  7 Jan 2023 12:12:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231421AbjAGLMo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 7 Jan 2023 06:12:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53598 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229468AbjAGLMm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 7 Jan 2023 06:12:42 -0500
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de [85.215.255.52])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BAE7E6E433;
        Sat,  7 Jan 2023 03:12:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1673089956;
    s=strato-dkim-0002; d=gerhold.net;
    h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=fMF78Zv0kyXCrgTx5+2bHw+/X/3+6GExnxwiOChAOEg=;
    b=mxmEXcsA8c7FO1uvD6K6tInoD2+AhiljHIb/MPAUmpHzrY1tyCNJET1sOLaD4yWyhZ
    P7prH0IsojItRqykP3+F+tJZ/+NcS9fciudsZfc3RjotfCAWiT4AmB4vOSmv9Y9bMu94
    NYc1gjVQIY3GVGGxi+s9GjsnMwoom2uKuFiw+BCt/2nc847VJ1McF0tpNMz+OfhWmzpj
    abIk2sDbx/MKU2AYKNzMlnUlPe6edcd29MoxgL0chul6Un4JnEnDaHFXaX8y2bO3q4Hv
    C39pBMprltVJaiXjXjFdKWI9fH1Ur5xu2UNkvysyZlzrnQSAoYN2isFyoeVgGfd3pc7u
    QjGg==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVORvLd4SsytBXTbAOHjRHIRvweFKMuQ=="
X-RZG-CLASS-ID: mo00
Received: from droid..
    by smtp.strato.de (RZmta 48.2.1 DYNA|AUTH)
    with ESMTPSA id Yce349z07BCatJC
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
    Sat, 7 Jan 2023 12:12:36 +0100 (CET)
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Bjorn Andersson <andersson@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Stephan Gerhold <stephan@gerhold.net>
Subject: [PATCH 0/2] arm64: dts: qcom: msm8916: Enable DMA by default
Date:   Sat,  7 Jan 2023 12:09:56 +0100
Message-Id: <20230107110958.5762-1-stephan@gerhold.net>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_PASS,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add the DMA channels for all I2C controllers in msm8916.dtsi and enable 
the DMA controller by default (this is necessary because otherwise the
i2c-qup driver will no longer probe with the DMAs added).

Stephan Gerhold (2):
  arm64: dts: qcom: msm8916: Enable blsp_dma by default
  arm64: dts: qcom: msm8916: Add DMA for all I2C controllers

 arch/arm64/boot/dts/qcom/apq8016-sbc.dts |  4 ----
 arch/arm64/boot/dts/qcom/msm8916.dtsi    | 13 ++++++++++++-
 2 files changed, 12 insertions(+), 5 deletions(-)

-- 
2.39.0

