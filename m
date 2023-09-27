Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DD9497AFFBC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Sep 2023 11:21:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229650AbjI0JVx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 27 Sep 2023 05:21:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229531AbjI0JVw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 27 Sep 2023 05:21:52 -0400
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E764ABF
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 Sep 2023 02:21:50 -0700 (PDT)
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-9a6190af24aso1327616266b.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 Sep 2023 02:21:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695806509; x=1696411309; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tFEJ4pRe+RB1S9eb0nmG/4BAZfGRthsh3flPCD+93R4=;
        b=WhVlbdoT/UbfAa1ALegmvUfo9MrTYoBVoFMRzmRfA1IA537UQR3Za+unZ445nMxECp
         srbEkGyUbUpw3QHFiwika4+uEKnaqwszxuogG541/ZT+/kvezrEWq5f4u9XpXQugvh6f
         ZJmoNlNu4M+eeiN7dtNh/7UKtiZlv56OAvSeNWxG6pBEXMQqZVL34bDo7fiFfowSt5Kc
         A7lEdCq63HtENWofVar7I+1XzBxHK3rG//KSveUM/lh6MfQTF/kTjKfT+5EaMTT+Tisa
         8N9t9QCwuzBGAyYEJz6d/FucNSKCLlBhIwgptIQXcW+eWzrF80wazdm5Il6Tb/KuGoOG
         bjgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695806509; x=1696411309;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tFEJ4pRe+RB1S9eb0nmG/4BAZfGRthsh3flPCD+93R4=;
        b=mKt8MW8s8dGD/74TE8xiJzp/bbsYmApZ0Mv9cOfxvzp4mOGrCtocq8ycpQQ2wJUpLS
         YLyAL3nD9FITvO+9tBTtfkmH3geSOQqVYxLDfRGNJ+hr+0bWXaKMLusB+xf3r4jEHcrg
         VcrabV3nhD90IrLL7Opq06iXehkxlGhvTABPbK21u8/RWI+AFNO0Pe28ob945LRQ24vi
         ZCs+DHoaVufHayMkTGsMYgVw7WI9tvqZ9eomSb4W1Id9V+dWNp+6f5sRZCJC2WY09x4R
         QIdR3O2GEPBvkdMoSkPBNYUNSJuKKs1DnKhyAhsJqfSYMIx9kZ7RqLMv1pVCpk9m2kpr
         cLqg==
X-Gm-Message-State: AOJu0Yz8+rVhAly+s4lMQELxVkXKlt9G1DG4I/D8lOlJWuJKmuoMpdA2
        onoypvBPkYINORqlMfdscGYlhg==
X-Google-Smtp-Source: AGHT+IEfd9IgnlewzgBfO8d7DSxLjgAmY8I8VmUFRqOAsBoFq2F7INqGsO5rfP3NP7DOfMPJns7dpg==
X-Received: by 2002:a17:906:53:b0:9b2:b152:b0f2 with SMTP id 19-20020a170906005300b009b2b152b0f2mr1281195ejg.10.1695806509315;
        Wed, 27 Sep 2023 02:21:49 -0700 (PDT)
Received: from [10.167.154.1] (178235177023.dynamic-4-waw-k-1-1-0.vectranet.pl. [178.235.177.23])
        by smtp.gmail.com with ESMTPSA id qq23-20020a17090720d700b00993664a9987sm8948574ejb.103.2023.09.27.02.21.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Sep 2023 02:21:49 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: [PATCH 0/4] SM6375 features
Date:   Wed, 27 Sep 2023 11:21:39 +0200
Message-Id: <20230927-topic-6375_stuff-v1-0-12243e36b45c@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACP0E2UC/x2N0QqDMAwAf0XyvICL07L9yhCJbToDUqVRGYj/v
 rLHOzjuBJOsYvCqTshyqOmSCtxvFfiJ00dQQ2Ggmpr6SQ63ZVWPXePawbY9RmR6hNh2FFgclGx
 kExwzJz+VMO3zXOSaJer3/3n31/UDBv/QoHcAAAA=
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1695806508; l=746;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=XAM++hTphVwtDuN0lDqWZr8AwiM0zMzanpAwXHVMGoM=;
 b=3uMZXTpEc+IKGbvWYMzp8RaSk/nWisvJkb8re7GobynRuXaaeZlNjXgcRYQpKTbQwcmYfFCKp
 8pWd5N0l3x6AfL3IWy1C9DsuqLCqW4L7outqOp2lOBNH5Pfu9XNnbFV
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Enable modem & wifi on sony 10 IV, add bt uart to the soc dt.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
Konrad Dybcio (4):
      arm64: dts: qcom: sm6375: Add UART1
      arm64: dts: qcom: sm6375-pdx225: Enable MSS
      arm64: dts: qcom: sm6375-pdx225: Enable ATH10K WiFi
      arm64: dts: qcom: sm6375-pdx225: Add USBPHY regulators

 .../dts/qcom/sm6375-sony-xperia-murray-pdx225.dts  | 29 ++++++++++++---
 arch/arm64/boot/dts/qcom/sm6375.dtsi               | 43 ++++++++++++++++++++++
 2 files changed, 66 insertions(+), 6 deletions(-)
---
base-commit: 18030226a48de1fbfabf4ae16aaa2695a484254f
change-id: 20230927-topic-6375_stuff-a24df562dae7

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@linaro.org>

