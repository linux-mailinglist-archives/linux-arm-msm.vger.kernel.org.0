Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 79196629FDD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Nov 2022 18:03:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231213AbiKORDO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 15 Nov 2022 12:03:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230368AbiKORDH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 15 Nov 2022 12:03:07 -0500
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE1F82D764
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Nov 2022 09:02:57 -0800 (PST)
Received: by mail-wr1-x429.google.com with SMTP id j15so25386679wrq.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Nov 2022 09:02:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=C+QI+a1LLKHJmXjbPhLCERTRJmwAWFttEeqSMGvp67c=;
        b=hQ+brCIqwW8qYaEySmMH026wtvc3hNKIAWioWo/wZKzTqCv2yrOwEeEOlxz9uE9NqK
         uYMW8T+UCZDxzXTkrse0eU3lphVpQG3HhaHyC1PDaWKZ1nA/zroHPvI3QTAxpa92nEkA
         k3jSJfcYX5N70C/XHcRZLvkKhxSZRdj5i1g6xrePnaNIZ0i8jHTHnKB1l5A8DpsKFiU5
         3RmQMuFFyO/YhksMCMkj4U09WDdFrGtitwbGHxNr4rmwxM/UUhe4ihGpYgN96c3ddJcI
         vtQFnaJ7N0F9psjC+nrWM9isYSW7s2kUAzQAPRxKxB9lANBQXYjr8GlOLawhgZaWgFD7
         6a6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C+QI+a1LLKHJmXjbPhLCERTRJmwAWFttEeqSMGvp67c=;
        b=MSNfckH+LaZbtn8r5PnOdtDrnM8vS83Ru8rTAlHKvtWy70NOIT1LqDXmzyRM9qKnXc
         VqcYYlklPSbB4C2WDIoyfHurhDA1z4a/cXx5KmE3j2MF7pBIp7xoaz28cN84GVFq4/y/
         FwYxDrWhcym4q0nSd/lwlsj1X5X0NlyQUyCpUKdbexhWEI38QAcPwPzPwT5GK5dHexCG
         6JtoN9rHQL9gQrvsEJvgW5+WPMA2fXzCytIqjxqem+x94bbg00RxVDxmAtVfD/DDyLnD
         9Vec0u/c1cZ43+rKarXK1uliZTLTFxEHYKANm5Hv9AadzwxVT3DnjZocDS5FZ6UDgZfO
         wmRQ==
X-Gm-Message-State: ANoB5pl9J8UIR95bSFhv8xujwMaZY2I9hJn/zRQf1R9nJuG6OJVF2SGX
        Hlcjc6l9uuS69XIEsHSbyKpVig==
X-Google-Smtp-Source: AA0mqf7iiEvtIjraL7maQb8oxdfrIYeg3cHrgjjDrjNzxCzwmr9TGWZhUP/P0H+J+flUHnFd+0Vouw==
X-Received: by 2002:adf:fc81:0:b0:236:7083:21df with SMTP id g1-20020adffc81000000b00236708321dfmr10970590wrr.123.1668531776414;
        Tue, 15 Nov 2022 09:02:56 -0800 (PST)
Received: from localhost.localdomain ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id v21-20020a05600c215500b003c6c3fb3cf6sm15747090wml.18.2022.11.15.09.02.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Nov 2022 09:02:55 -0800 (PST)
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To:     agross@kernel.org, andersson@kernel.org
Cc:     konrad.dybcio@somainline.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH 0/3] arm64: dts: qcom: sc8280xp: add audio support
Date:   Tue, 15 Nov 2022 17:02:39 +0000
Message-Id: <20221115170242.150246-1-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.25.1
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

This patchset adds audio support for sc8280xp Lenovo x13s.
Support for Headset Playback/Capture, Speaker Playback and DMIC is
tested.

A prebuit ASoC topology file available at
https://git.linaro.org/people/srinivas.kandagatla/audioreach-topology.git/tree/prebuilt/SC8280XP-LENOVO-X13S-tplg.bin

Thanks,
Srini


Srinivas Kandagatla (3):
  arm64: dts: qcom: sc8280xp/sa8540p: add gpr node
  arm64: dts: qcom: sc8280xp/sa8540p: add SoundWire and LPASS
  arm64: dts: qcom: sc8280xp: Add soundcard support

 .../qcom/sc8280xp-lenovo-thinkpad-x13s.dts    | 213 ++++++++++
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi        | 364 ++++++++++++++++++
 2 files changed, 577 insertions(+)

-- 
2.25.1

