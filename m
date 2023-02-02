Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5804E68840C
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Feb 2023 17:19:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232430AbjBBQTz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 2 Feb 2023 11:19:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57454 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232411AbjBBQTk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 2 Feb 2023 11:19:40 -0500
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3E175CE58
        for <linux-arm-msm@vger.kernel.org>; Thu,  2 Feb 2023 08:19:37 -0800 (PST)
Received: by mail-wm1-x330.google.com with SMTP id o36so1838971wms.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Feb 2023 08:19:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GYAWqJvDoRygWTEoiFjYQelcbvmOngriBQBL9Sj+pUQ=;
        b=PnkWbsKDXqvff8X61o3pe5etTAzX8wapifMWxPveQ11DcvcYF68CUR/qWVD3D8DGh1
         ZAxmCrTqmokg1liAYkNdVpX1yQVumX2ATwWdUrWODQK4Rh4k//mh+9VAkvyKH5Oz+xd8
         tRdI9ykIYZS0xUomUeI0c4ohRZGgygmJPivgARD8iHzhCgg6DEPZkZVnZ0MjxzTqUcq/
         bYAFV57QiZb4bbUF9heFrEoqymmwOaW29O8E3DgPSW7fIh7W60yczAy+muBU12j2rpWM
         dCRFc3Ok1zSs+HiHluc7sbns3O1Pb7dmS8KHS218EPbH45hmJf2R8k7w9AUHasxjZIx/
         ndXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GYAWqJvDoRygWTEoiFjYQelcbvmOngriBQBL9Sj+pUQ=;
        b=cwmnaIXYIskTqPRT51DXOIMBPKPP80RiTdI2EFWU3EPeu3bbLnPYKNYnVAY5uKsKl4
         In37eTTQpwU6NaWea4bd7GVM+DTj6VJ0FbXbz8QDIOEpdt/Rl7e/dBdwTGMv+osYQY5c
         wdUvZVurzuX7B98EtvJNihj0Yx19jb/0Kn538Ks8CCVktnMI5Wja60gun7bF7WDVrdu7
         ZmhCvM4v78VgwKp6XvhCwZH/tdcfSlMPW1Z11q8KGdGqD45Fs9wyskiVMY6JhDMrW//K
         gMLID1wac/+Vybnj8KmSwrziSFpdtf5QpRRT959zdKlzm9t8i/iz/wgElVDlTYRmV9sO
         Hyzw==
X-Gm-Message-State: AO0yUKXW4uKUPZYBO4f1LeFYRc5AA6eD9fzjXoX+mSiZ0M89dn2hXElm
        kvNeR9EyMhwvPpTjJ6T8Xd6x8A==
X-Google-Smtp-Source: AK7set/laZAa6VUPzgbwPB+HtPYzztQCFJurYP1QEN75sOYFz6EBJrICRlv5hY9V1wrfv2qa24Vqkw==
X-Received: by 2002:a05:600c:2e06:b0:3dc:51f6:8f58 with SMTP id o6-20020a05600c2e0600b003dc51f68f58mr6746120wmf.6.1675354776333;
        Thu, 02 Feb 2023 08:19:36 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id h16-20020a05600c351000b003dc521f336esm212416wmq.14.2023.02.02.08.19.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Feb 2023 08:19:35 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Jassi Brar <jassisinghbrar@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 00/13] mailbox/arm64/ qcom: rework compatibles for fallback
Date:   Thu,  2 Feb 2023 17:18:43 +0100
Message-Id: <20230202161856.385825-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
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

Hi,

If entire approach is accepted (and correct), there are no dependencies and
patches can be picked independently.  Although the best in the same cycle, so
there will be no new `dtbs_check` warnings.

Best regards,
Krzysztof

Krzysztof Kozlowski (13):
  dt-bindings: mailbox: qcom,apcs-kpss-global: use fallbacks
  dt-bindings: mailbox: qcom,apcs-kpss-global: document missing sdx55
  mailbox: qcom-apcs-ipc: do not grow the of_device_id
  arm64: dts: qcom: ipq8074: add compatible fallback to mailbox
  arm64: dts: qcom: msm8976: add compatible fallback to mailbox
  arm64: dts: qcom: msm8994: add compatible fallback to mailbox
  arm64: dts: qcom: msm8998: add compatible fallback to mailbox
  arm64: dts: qcom: sdm630: add compatible fallback to mailbox
  arm64: dts: qcom: sm6115: add compatible fallback to mailbox
  arm64: dts: qcom: sm6125: add compatible fallback to mailbox
  arm64: dts: qcom: qcs404: add compatible fallback to mailbox
  arm64: dts: qcom: sc7180: add compatible fallback to mailbox
  arm64: dts: qcom: sm8150: add compatible fallback to mailbox

 .../mailbox/qcom,apcs-kpss-global.yaml        | 67 +++++++++++--------
 arch/arm64/boot/dts/qcom/ipq8074.dtsi         |  3 +-
 arch/arm64/boot/dts/qcom/msm8976.dtsi         |  3 +-
 arch/arm64/boot/dts/qcom/msm8994.dtsi         |  3 +-
 arch/arm64/boot/dts/qcom/msm8998.dtsi         |  3 +-
 arch/arm64/boot/dts/qcom/qcs404.dtsi          |  3 +-
 arch/arm64/boot/dts/qcom/sc7180.dtsi          |  3 +-
 arch/arm64/boot/dts/qcom/sdm630.dtsi          |  3 +-
 arch/arm64/boot/dts/qcom/sm6115.dtsi          |  3 +-
 arch/arm64/boot/dts/qcom/sm6125.dtsi          |  3 +-
 arch/arm64/boot/dts/qcom/sm8150.dtsi          |  3 +-
 drivers/mailbox/qcom-apcs-ipc-mailbox.c       | 11 +--
 12 files changed, 66 insertions(+), 42 deletions(-)

-- 
2.34.1

