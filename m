Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 203BC792C70
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Sep 2023 19:34:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236164AbjIERcj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 Sep 2023 13:32:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40720 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236432AbjIERcV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Sep 2023 13:32:21 -0400
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD07361066
        for <linux-arm-msm@vger.kernel.org>; Tue,  5 Sep 2023 09:58:22 -0700 (PDT)
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4013454fa93so27390405e9.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 Sep 2023 09:58:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693933017; x=1694537817; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=u6kNwqRygWFRS5KQ5/JjmBSWEbqa5XGk45okpfYEhOI=;
        b=AiXw8nfQn3C9KFVnfLP1AkX5p/laldXiKRrMX6DsD8lwYtrok1KE7VbcHiiIGxBdqA
         qYa4+UnNitQ2n06DyYFoVP+Yqy9A1DpCMRm31j4CoushI9ksKyNRNB2i26hf4WQAQEK/
         s03iwQs+AWPcTJPu8kJx6fhtSW7tVmc+YaLIh+ILZhwaUIYCkIKCBPMGpvQZYlDzU2U7
         2+5O3NPXv/zMzHDmq+MdbuLKBYnVUb8ebxXmlzhXJjPu4tLlrpFdorXff0I2t30l3tJe
         icT0W+ZzrNgzlFKY81tMutRmksgB4+nsehNMnW5hi2lyWaskep4uzFoT5lbtCHXOdqXX
         MnpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693933017; x=1694537817;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u6kNwqRygWFRS5KQ5/JjmBSWEbqa5XGk45okpfYEhOI=;
        b=MzVrnfwMDLx+noMRa6IR/T6hWCnz8yKgc/zv2hqtVGWZBQQiCOsmzuvsUlVEPzXInb
         c+lScAT0SU6J3njF/WXBS6NdAX8zRLK0IUn5DiN/aayADjbq7mzink/df6jsf27LpzTS
         FpfN2bUdaV1atZ5UPw17dEhaZHtRYOgrriD9k6FPU8XMHmNO87z1gkQUDNr/4Vm2Xj2e
         zqj6Ls0a+47lD9ks0RYmGtS3NPytQyzMglelwCaf0vSc60Xl2/dTaojQRt+BfBiEhvsF
         tFCmAFWMknr4ARY92h//FGTlsOT+Gf2+mdNCfwvNd0U17MknA1GESlvk6AwzsYjQMCV8
         q+pA==
X-Gm-Message-State: AOJu0YzIpMoGbQb5YOypgzo0XyQ/ZT0atTZMa7xAEvfhVvqFZH5BQ2f8
        Vhwww3T4rxWIaPkjiuT8I/cN5vxb4PU5d1ff/XQ=
X-Google-Smtp-Source: AGHT+IG6fE0DFLC4mYCTNB761pLBJXI5zEAPWKwDAUwTMhFfQUCno/UDPuizMGw8KuJR95wGbAxJtA==
X-Received: by 2002:a17:906:d0:b0:9a6:1eab:9c84 with SMTP id 16-20020a17090600d000b009a61eab9c84mr287940eji.9.1693930767760;
        Tue, 05 Sep 2023 09:19:27 -0700 (PDT)
Received: from krzk-bin.. (77-252-46-238.static.ip.netia.com.pl. [77.252.46.238])
        by smtp.gmail.com with ESMTPSA id v26-20020a170906489a00b0099cc36c4681sm7743165ejq.157.2023.09.05.09.19.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Sep 2023 09:19:27 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 00/12] arm64: dts: qcom: correct UFS pad supply
Date:   Tue,  5 Sep 2023 18:19:08 +0200
Message-Id: <20230905161920.252013-1-krzysztof.kozlowski@linaro.org>
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

Not tested on hardware.

Best regards,
Krzysztof

Krzysztof Kozlowski (12):
  arm64: dts: qcom: sm6125-sprout: drop incorrect UFS phy max current
  arm64: dts: qcom: sm6125-sprout: correct UFS pad supply
  arm64: dts: qcom: sm6115-pro1x: correct UFS pad supply
  arm64: dts: qcom: sm6115p-j606f: correct UFS pad supply
  arm64: dts: qcom: apq8096-db820c: correct UFS pad supply
  arm64: dts: qcom: msm8996-oneplus: correct UFS pad supply
  arm64: dts: qcom: msm8996-gemini: correct UFS pad supply
  arm64: dts: qcom: msm8998-pro1: correct UFS pad supply
  arm64: dts: qcom: msm8998-mtp: correct UFS pad supply
  arm64: dts: qcom: msm8998-oneplus: correct UFS pad supply
  arm64: dts: qcom: msm8998-sagit: correct UFS pad supply
  arm64: dts: qcom: sm4250-billie2: correct UFS pad supply

 arch/arm64/boot/dts/qcom/apq8096-db820c.dts              | 2 +-
 arch/arm64/boot/dts/qcom/msm8996-oneplus-common.dtsi     | 2 +-
 arch/arm64/boot/dts/qcom/msm8996-xiaomi-common.dtsi      | 2 +-
 arch/arm64/boot/dts/qcom/msm8998-fxtec-pro1.dts          | 2 +-
 arch/arm64/boot/dts/qcom/msm8998-mtp.dts                 | 2 +-
 arch/arm64/boot/dts/qcom/msm8998-oneplus-common.dtsi     | 2 +-
 arch/arm64/boot/dts/qcom/msm8998-xiaomi-sagit.dts        | 2 +-
 arch/arm64/boot/dts/qcom/sm4250-oneplus-billie2.dts      | 2 +-
 arch/arm64/boot/dts/qcom/sm6115-fxtec-pro1x.dts          | 2 +-
 arch/arm64/boot/dts/qcom/sm6115p-lenovo-j606f.dts        | 2 +-
 arch/arm64/boot/dts/qcom/sm6125-xiaomi-laurel-sprout.dts | 4 +---
 11 files changed, 11 insertions(+), 13 deletions(-)

-- 
2.34.1

