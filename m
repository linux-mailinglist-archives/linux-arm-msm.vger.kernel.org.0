Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 95AF0638DCB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Nov 2022 16:52:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229641AbiKYPw4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 25 Nov 2022 10:52:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40492 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229642AbiKYPwx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 25 Nov 2022 10:52:53 -0500
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C99C2715E
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Nov 2022 07:52:52 -0800 (PST)
Received: by mail-lf1-x12e.google.com with SMTP id j16so7467971lfe.12
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Nov 2022 07:52:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1S80mqqzZPV4x0fjfvSYuvzqcnujfLUcEw9LE2vdO30=;
        b=rxTk+ofk5/kp/tBgvUncx34Wmy8PgkdH58ZnTcqVFqL6NiwtquGNdY9uMuSjTxWRU4
         3ABUuer/n0skicY6HzPI/ItzipsC74K25KnLi71x6JCoC4olV7sXe815Frn+7irN2KBI
         OggqKwajRyS7oiMjBW9sF+eQoLtbULqADkFczb69mTXl573T/acIro0SXY4bVxOVTFv+
         IdDONAr3bVmK5L5A1DrmgAYz4xWZSK0YAuPR/ISkMJUCESleloB4Ra4PvliqpfJsRJJH
         uqmhmgT/CxRAQT+y3ZBuqEXVDIaYHb9ATpEaCKoJyYFF+Er8bDb1d2j/scrgK6YtTPqM
         nA9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1S80mqqzZPV4x0fjfvSYuvzqcnujfLUcEw9LE2vdO30=;
        b=5D++yKbcjaMxyoHZNWAP73Lq1ptei+o2utKyJCAPlR68noDD3BcFm67UQ8ivgGRxTz
         tktr9b6Uw82eo05QGSZ4Jch7MU0TZnuk95f+Vdqg8z/vg1x+f5AdFzV662/CUjP9VyKx
         +xPBnzdPJdvM2yYfK+hftzukJ+tkj98eVkQTdzbtxekyRWy/X+B2YhDp+EEqmJvBxxij
         ezpx6jHLhw8uEKQZI/crHPJ9iKDKTcTFdfyhfe3aYYf7N6aoSRyV0zXGmzHx/LE0O2pv
         nNOjzGV0CcyYxRzt43OPLdxv2pDCnOuycWh9iveypVXTDCMol0uJo9pheS8N+gzbb3tL
         Ektg==
X-Gm-Message-State: ANoB5pkS8fogNHId9BqFi/1hkwc9j3wBMOZ6OOrVMd4yXtR10BVK57oC
        Cgba9KQm3Sh5B/jj44ypOt7bqQH70j2X1Uti
X-Google-Smtp-Source: AA0mqf6X/KnbJCFxPa7UnT2OxSIX0wk6JLemR+lPA+e4v/zQ+I1V5mQKQC1w//ayTYER8W7yYAXiIQ==
X-Received: by 2002:a19:5e58:0:b0:4a7:5a63:71e1 with SMTP id z24-20020a195e58000000b004a75a6371e1mr6959397lfi.399.1669391570441;
        Fri, 25 Nov 2022 07:52:50 -0800 (PST)
Received: from krzk-bin.NAT.warszawa.vectranet.pl (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id t14-20020a05651c204e00b002778a76a3c3sm391488ljo.112.2022.11.25.07.52.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Nov 2022 07:52:50 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH v4 0/3] arm64: dts: qcom: sm8450-hdk: add sound support
Date:   Fri, 25 Nov 2022 16:52:44 +0100
Message-Id: <20221125155247.501203-1-krzysztof.kozlowski@linaro.org>
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

Changes since v3
================
1. Re-order reg and sound-dai-cells.

Changes since v2
================
1. Patch 2: Use lower-case hex.
2. Patch 3: Use ACTIVE_LOW for qcom,wcd9380-codec reset-gpios.
   https://lore.kernel.org/all/20221116053817.2929810-11-dmitry.torokhov@gmail.com
3. Add Rb tags.

Changes since v1
================
1. Patch 2:
   - Whitespace cleanups.
   - Correct include - do not use deprecated one.
2. Patch 3:
   - Sort.
   - Add Rb tag.
   - Correct include - do not use deprecated one and drop q6asm.h (not used).

Description
===========
Initial work (still partially in progress) adding audio to HDK8450 board.

Working/tested:
 - speakers
 - one channel of headset

The DTS patches do not have particular dependencies, however they:
1. Use updated ASoC bindings:
   https://lore.kernel.org/linux-arm-msm/20221111113547.100442-1-krzysztof.kozlowski@linaro.org/T/#t

2. For full operation need changes in Soundwire and Qualcomm ASoC drivers, not
   yet upstreamed:
   https://github.com/krzk/linux/commits/wip/sm8450
   Booting remoteproc without these changes will report errors, but these are
   expected at this stage.

Best regards,
Krzysztof

Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

Srinivas Kandagatla (3):
  arm64: dts: qcom: sm8450: add GPR node
  arm64: dts: qcom: sm8450: add Soundwire and LPASS
  arm64: dts: qcom: sm8450-hdk: add sound support

 arch/arm64/boot/dts/qcom/sm8450-hdk.dts | 160 ++++++++++++
 arch/arm64/boot/dts/qcom/sm8450.dtsi    | 334 ++++++++++++++++++++++++
 2 files changed, 494 insertions(+)

-- 
2.34.1

