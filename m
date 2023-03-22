Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C790A6C52BC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Mar 2023 18:41:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230146AbjCVRl4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 22 Mar 2023 13:41:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57504 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230076AbjCVRlz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 22 Mar 2023 13:41:55 -0400
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89C035F6D0
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Mar 2023 10:41:53 -0700 (PDT)
Received: by mail-ed1-x531.google.com with SMTP id cn12so30507607edb.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Mar 2023 10:41:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679506912;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aKlL6nsYofXrtklvN1qI1lejcYycd4GhbbCIaQ5NUPQ=;
        b=jO9pMLZFmIBx4QiK9NtouToQqQgfCw4psqC40hSYjOYE3v0afiVflW4+5q8b5PqTyB
         LNhiXumAxIjVigf0g4khe9JFIKSnSxKwj3RWEXeonE+N5+XF+bwW11VQfd6vymNKMCJT
         3HSCcuiyFLShCuE7DUa05MqdlZ0J+7WOHjBfpvuLyMhD5HpgQh3Waw0PSKYLE0V88WsK
         PvPYg4lwUJe2OK0whQT54v64W6zGNZcFj4PponDYcLCljLFCKuR8PQPeZwcWbxfuSP2x
         ThuUFoTX2AmDnrwxNljnYn53thGcs6rTyGwHY38AzFq7D/GXfJ6Xlem5NNTPrZReF0p6
         DxWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679506912;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aKlL6nsYofXrtklvN1qI1lejcYycd4GhbbCIaQ5NUPQ=;
        b=on5bw5ocuBbyhy0+pCyr/GjylfsrwperuBiup1ZUCMNSpann1VrSJhhKEIDT7LqEYH
         GRfcE841iCe2T0uZAd/IQ1LZsJm2sOXj0d3qAmgVyBCuy2cwdOpPHb/QZ+D27RNVByhK
         elUy6dPD6lVbj7yHkUncMX5JZ/ZWipbQJbwgtPJ2La8DgWwR4jSLX7UT0oT+pt7a+62F
         zIZHhWiD5SReeMaOsl2lgB1CT+N8cUhGzIXZyUFSxNscXbj17HYAK5ijz+yB7ec7hbqY
         wuZdYtYSLAyc5YnnnuWv+fkfHgbuJY2hWlStVZm+sNzALCxBrzeQSKb+cDAcv44k13R4
         WP9w==
X-Gm-Message-State: AO0yUKV7IXVxHHm1runwZnA+P/tFdvrsC6hJMR5JyRMIb9lvR7e5VRtJ
        Mt8Qme6DP5F56xjFNYlacqxMww==
X-Google-Smtp-Source: AK7set9ZqSnoxPTJoYl8rmNhO6mCJvGJiuwW3XY++uRRew01B/OdANi5i7AG+3W5py5YYuxWkdRGiQ==
X-Received: by 2002:a17:907:8a1a:b0:920:7827:302 with SMTP id sc26-20020a1709078a1a00b0092078270302mr3629263ejc.18.1679506911966;
        Wed, 22 Mar 2023 10:41:51 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:5050:151b:e755:1c6])
        by smtp.gmail.com with ESMTPSA id jx3-20020a170907760300b00930876176e2sm7548088ejc.29.2023.03.22.10.41.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Mar 2023 10:41:51 -0700 (PDT)
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
Subject: [PATCH v3 00/11] mailbox/arm64/ qcom: rework compatibles for fallback
Date:   Wed, 22 Mar 2023 18:41:37 +0100
Message-Id: <20230322174148.810938-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

Changes since v2
================
1. Split fixes to separate patchset which is now dependency:
   https://lore.kernel.org/linux-arm-msm/20230322173559.809805-1-krzysztof.kozlowski@linaro.org/T/#t
2. Add Ack
3. No other changes, as discussion with Dmitry did not reach conclusion on incompatibility.

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

Krzysztof Kozlowski (11):
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

 .../mailbox/qcom,apcs-kpss-global.yaml        | 58 ++++++++++---------
 arch/arm64/boot/dts/qcom/ipq8074.dtsi         |  3 +-
 arch/arm64/boot/dts/qcom/msm8976.dtsi         |  3 +-
 arch/arm64/boot/dts/qcom/msm8998.dtsi         |  3 +-
 arch/arm64/boot/dts/qcom/qcs404.dtsi          |  3 +-
 arch/arm64/boot/dts/qcom/sc7180.dtsi          |  3 +-
 arch/arm64/boot/dts/qcom/sdm630.dtsi          |  3 +-
 arch/arm64/boot/dts/qcom/sm6115.dtsi          |  3 +-
 arch/arm64/boot/dts/qcom/sm6125.dtsi          |  3 +-
 arch/arm64/boot/dts/qcom/sm8150.dtsi          |  3 +-
 drivers/mailbox/qcom-apcs-ipc-mailbox.c       | 11 ++--
 11 files changed, 55 insertions(+), 41 deletions(-)

-- 
2.34.1

