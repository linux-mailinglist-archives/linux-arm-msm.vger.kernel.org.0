Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0CCC4640932
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Dec 2022 16:21:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233455AbiLBPVG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 2 Dec 2022 10:21:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54244 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233405AbiLBPVF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 2 Dec 2022 10:21:05 -0500
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30507CD9BD
        for <linux-arm-msm@vger.kernel.org>; Fri,  2 Dec 2022 07:21:02 -0800 (PST)
Received: by mail-lj1-x235.google.com with SMTP id x6so5740949lji.10
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 Dec 2022 07:21:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cbWFszEMmqGUPOEqPZjBaUL8KEVz70KD/aIBGs3YtpM=;
        b=QEMgeicpAWtxBjZB9F45ICXguszrCK92n+ifZv+DOFuuiOgxVEVBCxjaM0xPhcQuQX
         /f400DEkYgfAkOa+SBfiqcqjqftnNidNqGI4G6vkBGC66lrdjZW7jdIc9jIBpfVWSCig
         uOb3DqjCbsMiPRbDdNmg2UvP+ciE2i45eOQyUsGPLlNH/UsMfaQ6oB3h9U1NxmgwH8Cj
         zdS/wcwUCNjNBPDkpO0uNT5bk0fhHBq8Yqnea43hNVyuwNwhHIPuGGH/k0omkyJEd9G9
         hICNytiWhM3KKrQIXj092/jJY4arApprR866l3fUicNtXpGpwzz3rgAtEEQ0DgHnJOO1
         w54Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cbWFszEMmqGUPOEqPZjBaUL8KEVz70KD/aIBGs3YtpM=;
        b=pk4MC4YvtNbdsirNyxNA3K1jqcosUJSGJbvXoKIJWTgB9krXeW1KN8HcjcWokeITFu
         Xs+mkM6hG82L8VXExlDHVrU19h+rearAAqM9NTwJRgd3RX8rCIARmXuGdmJ/do7hIMB6
         RaugCrIcKbaRdeotqm4ovwR9I2kTkpXKGpAlccAejGTm4Yb6E7AAPfi0VSBhSyxYAcmi
         aMrLksM0YXvZHtNxbo6/nkc1iG8UsR7Q8JyIBQBdgiRWK15h+kcSjoKyso3tcotdMe2M
         1pKns1G+kmaooJWLh8dGfgeDTfxrCbgWALbaCYAJm0F8q8LttRDJrhtku2pTWN1m9dWp
         b8nw==
X-Gm-Message-State: ANoB5pkmiUiqBPMlADYpLrq5wfHOsxylaB3+onMmZY1AIOrp9bxfNcvL
        IIorS0fRzG9de7aETsTgttIjxA==
X-Google-Smtp-Source: AA0mqf4zL9HhbU7DlgQ/axTl96ilZ3+BVJIm9yx+hcCe3RM/4AAR4LLky5meEeDbmUocr3t/RAzGvw==
X-Received: by 2002:a05:651c:1796:b0:26c:3ec4:b71e with SMTP id bn22-20020a05651c179600b0026c3ec4b71emr24203042ljb.193.1669994460459;
        Fri, 02 Dec 2022 07:21:00 -0800 (PST)
Received: from krzk-bin.NAT.warszawa.vectranet.pl (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id l16-20020ac24310000000b00498f871f33fsm1043273lfh.86.2022.12.02.07.20.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Dec 2022 07:20:59 -0800 (PST)
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
Subject: [PATCH v6 0/3] arm64: dts: qcom: sm8450-hdk: add sound support
Date:   Fri,  2 Dec 2022 16:20:51 +0100
Message-Id: <20221202152054.357316-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

Changes since v5
================
1. Patch 2:
   - Use different clocks (codec@31e0000, codec@3240000).
   - Order LPASS pinctrl nodes by GPIO number.
   - Add dmic01-default-state and dmic02-default-state to LPASS pinctrl.
2. Patch 3:
   - Use TX_CODEC_DMA_TX_3 for VA capture.
   - Reverse order of speakers (left/right).
   - Drop duplicated wcd-playback-dai-link and add wcd-capture-dai-link.

Changes since v4
================
1. Patch 2:
   - Re-order few properties between Soundwire nodes, to keep them ordered
     consistently.
   - Drop unsupported qcom,port-offset.

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

 arch/arm64/boot/dts/qcom/sm8450-hdk.dts | 186 ++++++++++++
 arch/arm64/boot/dts/qcom/sm8450.dtsi    | 364 ++++++++++++++++++++++++
 2 files changed, 550 insertions(+)

-- 
2.34.1

