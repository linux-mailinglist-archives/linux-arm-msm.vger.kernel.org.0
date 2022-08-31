Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 951515A804E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Aug 2022 16:36:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231526AbiHaOgn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 31 Aug 2022 10:36:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50430 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230215AbiHaOgm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 31 Aug 2022 10:36:42 -0400
Received: from mx.kernkonzept.com (serv1.kernkonzept.com [IPv6:2a01:4f8:1c1c:b490::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8BE6465830;
        Wed, 31 Aug 2022 07:36:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=kernkonzept.com; s=mx1; h=Content-Transfer-Encoding:MIME-Version:Message-Id
        :Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=kItaLmx8+//UUguaHgtMVugiMoHgLZplR7VDHU7uylI=; b=UP2TZdb/K2rwG+vcv/nQZecbI5
        uyE7Pwh4rk16ER0P/U3Ak0tFtPj68U3v7OTF0es7+9J38oGa1OFWm3afZOfP+qrlGgXRoKSnGPzRU
        httzHG9R+HQGTp4EYyHj8teMB6xecooA3ETDB9G0zMUcE88OSJG7KmhYN57KM4ekhFKo34UyPnVNF
        fi2l5GJNe3nxfWw7aSU2FHkKbdOgeJoYFfY5FpXhloaE6IXbaytGVnFJy8vJ/fZD6HSnfo9wejnyA
        N55c1WOe+TmbanhKnjyJYQN+UpqmaIVVGf+9VQluzyB2/UcIT/Xum4HOLEAA7FfzCCmyfUYqTHrVF
        cQbe0v/A==;
Received: from [10.22.3.24] (helo=kernkonzept.com)
        by mx.kernkonzept.com with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim 4.94.2)
        id 1oTO3y-003wS7-Sf; Wed, 31 Aug 2022 15:47:26 +0200
From:   Stephan Gerhold <stephan.gerhold@kernkonzept.com>
To:     Bjorn Andersson <andersson@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Sireesh Kodali <sireeshkodali1@gmail.com>,
        Luca Weiss <luca@z3ntu.xyz>,
        Stephan Gerhold <stephan@gerhold.net>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org,
        Stephan Gerhold <stephan.gerhold@kernkonzept.com>
Subject: [PATCH v3 0/7] remoteproc: qcom_q6v5_mss: Add MSM8909 and MSM8953
Date:   Wed, 31 Aug 2022 15:46:19 +0200
Message-Id: <20220831134626.2803117-1-stephan.gerhold@kernkonzept.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Convert parts of the qcom,q6v5.txt binding documentation to a DT schema
(together with some DT fixes) in preparation of adding new compatibles
for MSM8909 and MSM8953. The schema can be easily shared between
MSM8916, MSM8974, MSM8909 and MSM8953 because they have almost the same
requirements. The other SoCs are quite different and are likely more
clearly described in separate DT schema(s) to avoid a lot of complicated
if statements.

Since there were some concerns about overlap with the more generic
(but also more complex) DT schema Sireesh made in [1], I've coordinated
with Sireesh for v3 and include his adjusted changes for MSM8953 here.

---
Changes in v3:
  - Combine series with Sireesh's for MSM8953

Changes in v2:
  - Address review comments from Krzysztof
  - Drop "ARM: dts: qcom: msm8974: Disable remoteprocs by default"
    since Bjorn applied it already

Sireesh Kodali (1):
  remoteproc: qcom: q6v5-mss: Add modem support on MSM8953

Stephan Gerhold (6):
  arm64: dts: qcom: msm8916: Drop MSS fallback compatible
  dt-bindings: remoteproc: qcom,q6v5: Move MSM8916 to schema
  dt-bindings: remoteproc: qcom,msm8916-mss-pil: Add MSM8974
  dt-bindings: remoteproc: qcom,msm8916-mss-pil: Add MSM8909
  remoteproc: qcom_q6v5_mss: Add support for MSM8909
  dt-bindings: remoteproc: qcom,msm8916-mss-pil: Add MSM8953

 .../remoteproc/qcom,msm8916-mss-pil.yaml      | 291 ++++++++++++++++++
 .../bindings/remoteproc/qcom,q6v5.txt         |  35 ---
 arch/arm64/boot/dts/qcom/msm8916.dtsi         |   2 +-
 drivers/remoteproc/qcom_q6v5_mss.c            | 174 +++++++++--
 4 files changed, 433 insertions(+), 69 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/remoteproc/qcom,msm8916-mss-pil.yaml

-- 
2.30.2

