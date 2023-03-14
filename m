Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1D5856B8CA8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Mar 2023 09:11:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230215AbjCNILK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 Mar 2023 04:11:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229642AbjCNIKv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 Mar 2023 04:10:51 -0400
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81CA7984E2
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Mar 2023 01:09:24 -0700 (PDT)
Received: by mail-ed1-x529.google.com with SMTP id eh3so2546656edb.11
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Mar 2023 01:09:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678781359;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=x1PSQgL33ohtJquVW+t7o1NxjNP0oyAspia+EQvzd50=;
        b=vm/q2LQC3P7MB4vFg2ifwDttlYhxCI2q9m98fZrZsT+TQlWB+h18oh0UrLRGhDSPDy
         cpE5K3evv6wn72Fj3xRbnOkvaYdBzkdd9dP1Y/kLKAxYGCKJyOUFgGKVuxexbg+9SmL4
         6rTCCvyURzSqhihV5r7lCtBCQBNwzwgDG83ZK0SX+guO07UJWIaQgIw/1ZbkZh6CU14W
         E/MddrTbx1nh6zuK0cCKQIK/GDhBtUSMwHaVOyn4Bm+Gj1ZFmZw3VQjfJXI2M9/eaoDj
         Flx37suiYBw9NED/ZXDp6yx22adybrvvI8palQzf8L/el5IE7jsXUWSbVOLmT978tOFy
         XlkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678781359;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x1PSQgL33ohtJquVW+t7o1NxjNP0oyAspia+EQvzd50=;
        b=kwOYXDu6hLypD87dDFBdb2J47K5e6KQ4PPGHjY6lrEgp8PZWD5PKZl9N8P51yOCcf5
         7KfgXKvfw6CzKYeS5Av1ix84MQyMyZIkQAgDVIBQnsW2II3Jcb8lhiKB5nL0oPEkY2kS
         +iT2nXPbaLUmVHV33BGejQTRKWV0xcfTkNDmTzN7NQZi59QXfLWg7V5HQxhNBQrYOIaj
         0HTmHMeMh5MESU/ppzHThyl+wrA9TR72eqlYsWqpNd3fhqv4gV6gUuoGQXNjd/eRYpd2
         AtgPOmnNycVSLvJ8mLA/WCkwHkjuUTm9yqedzZ69XkAqAzcU2/OMgplaBM5qXYaanLD4
         wnRg==
X-Gm-Message-State: AO0yUKWPLbejV6e8J/6OYRsKoMW0L6YNkicUZ8GJ6rVVmT+layERwKUA
        mUE8D1d1ehynG4LWp4R4/3Z3tQ==
X-Google-Smtp-Source: AK7set/Ot7ZHnnV+7qOQNMB/yKOZe2yhN5MZ8POU3b+IKWXlV5h8AHimqXSWeQ/nPX8OX24+Tqe/Bg==
X-Received: by 2002:a17:906:cc50:b0:8b1:7e1e:7756 with SMTP id mm16-20020a170906cc5000b008b17e1e7756mr1524908ejb.73.1678781359535;
        Tue, 14 Mar 2023 01:09:19 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:6932:5570:6254:9edd])
        by smtp.gmail.com with ESMTPSA id co2-20020a0564020c0200b004fce9ff4830sm584872edb.88.2023.03.14.01.09.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Mar 2023 01:09:19 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Jassi Brar <jassisinghbrar@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 00/13] mailbox/arm64/ qcom: rework compatibles for fallback
Date:   Tue, 14 Mar 2023 09:09:04 +0100
Message-Id: <20230314080917.68246-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

Changes since v1
================
1. Rebase
2. Make msm8994 fallback for several variants, not msm8953, because the latter
   actually might take some clocks.
3. Two new patches for SDX55.
4. Minor corrections in bindings style.
v1: https://lore.kernel.org/all/20230202161856.385825-1-krzysztof.kozlowski@linaro.org/

Description
===========

If entire approach is accepted (and correct), there are no dependencies and
patches can be picked independently.  Although the best in the same cycle, so
there will be no new `dtbs_check` warnings.

Best regards,
Krzysztof

Krzysztof Kozlowski (13):
  dt-bindings: mailbox: qcom,apcs-kpss-global: correct SDX55 clocks
  dt-bindings: mailbox: qcom,apcs-kpss-global: fix SDX55 'if' match
  dt-bindings: mailbox: qcom,apcs-kpss-global: use fallbacks
  mailbox: qcom-apcs-ipc: do not grow the of_device_id
  arm64: dts: qcom: ipq8074: add compatible fallback to mailbox
  arm64: dts: qcom: msm8976: add compatible fallback to mailbox
  arm64: dts: qcom: msm8998: add compatible fallback to mailbox
  arm64: dts: qcom: sdm630: add compatible fallback to mailbox
  arm64: dts: qcom: sm6115: add compatible fallback to mailbox
  arm64: dts: qcom: sm6125: add compatible fallback to mailbox
  arm64: dts: qcom: qcs404: add compatible fallback to mailbox
  arm64: dts: qcom: sc7180: add compatible fallback to mailbox
  arm64: dts: qcom: sm8150: add compatible fallback to mailbox

 .../mailbox/qcom,apcs-kpss-global.yaml        | 67 ++++++++++---------
 arch/arm64/boot/dts/qcom/ipq8074.dtsi         |  3 +-
 arch/arm64/boot/dts/qcom/msm8976.dtsi         |  3 +-
 arch/arm64/boot/dts/qcom/msm8998.dtsi         |  3 +-
 arch/arm64/boot/dts/qcom/qcs404.dtsi          |  3 +-
 arch/arm64/boot/dts/qcom/sc7180.dtsi          |  3 +-
 arch/arm64/boot/dts/qcom/sdm630.dtsi          |  3 +-
 arch/arm64/boot/dts/qcom/sm6115.dtsi          |  3 +-
 arch/arm64/boot/dts/qcom/sm6125.dtsi          |  3 +-
 arch/arm64/boot/dts/qcom/sm8150.dtsi          |  3 +-
 drivers/mailbox/qcom-apcs-ipc-mailbox.c       | 11 +--
 11 files changed, 60 insertions(+), 45 deletions(-)

-- 
2.34.1

