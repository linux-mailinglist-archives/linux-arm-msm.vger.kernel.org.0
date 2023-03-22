Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5AA286C54F2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Mar 2023 20:31:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231261AbjCVTbD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 22 Mar 2023 15:31:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60178 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230372AbjCVTa5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 22 Mar 2023 15:30:57 -0400
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B1AA637E2
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Mar 2023 12:30:55 -0700 (PDT)
Received: by mail-ed1-x52e.google.com with SMTP id b20so44450205edd.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Mar 2023 12:30:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679513453;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oRGfqxS3Cuhr+hCasaA+YOW33r20PpniBOrtxdIGcX0=;
        b=inQm7xzCyQOh5EJoTJb3jasI4/FSfygaq+ZRJe0pZrojhUEzzCPW9JFRfZJm2NTiRT
         /UD7LxStKPeFPsQpjIh5hkhg4g4Lv+ZhRxMsKLgYUP9KbRAHqFm0NsHO2OGkE/S+RlaX
         ej6foPCIIpGeIKXlEvkeNaSaW9BiYHv0X47LlV/kiuSRfKGRw16wHI2X9oupebYYHDTR
         HsydLgnLglziWOG8h1K5dfbe05qOiC2Z0gW4DCiEe1Dftzh0UwtEcvrC58IxjSwii31B
         P82Xj7+XKOEi5K8LnQVSoYfy06TUd9h17RIsZ9ZAUf9jBS2xm+IyhJGGS8w6KMoDS3bZ
         gO6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679513453;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oRGfqxS3Cuhr+hCasaA+YOW33r20PpniBOrtxdIGcX0=;
        b=isyHvj7t1iWghQLZgqmq1Ff8zzZDHdz/wqNHgpZTgVqUHcpjTlP1cjZ7jDlV8/KFzI
         eO4CfVh5DLVnetDx1s72gfPC4TPr6XHC6iUGsQH/3DFa6PIczlHMJ0HKonItBy4TDRWB
         rVF9UKAa5fjHE90Iq1vsbTR2W94A8t0hYab2EpN95bj8Ngonb24qxe3kQTREcGdzUGQh
         0suZc4ram+1DJsdjkrC2RWo+h32QlmkZpOCfRwO/frlTZnkevu3RqAPa4qcYr1qkCzIN
         /I0IZ72gvJlRwsa486RYCjxRe8IoyNHVLcohbN4ggdDLv4XxZAtduPeDRNHh6HwR5oBI
         ZhAA==
X-Gm-Message-State: AO0yUKVz3QYldGNFySxMW348mKqXXNDiMI1548s8MLI2zcm1E8qiK21V
        WWp4OixyGhW+FXHuP0PxdK63orGlreZccBCZlo8=
X-Google-Smtp-Source: AK7set9WLN7NWaQ52fw51W8qEE+YjRmc+x333mjWlC90BmMCEViH9M8ALzprJHojcfxTdTdWWpdjXA==
X-Received: by 2002:a17:906:d92f:b0:8a9:e330:3a23 with SMTP id rn15-20020a170906d92f00b008a9e3303a23mr7897458ejb.26.1679513453691;
        Wed, 22 Mar 2023 12:30:53 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:5050:151b:e755:1c6])
        by smtp.gmail.com with ESMTPSA id n25-20020a1709061d1900b008e9c79ff14csm7660309ejh.96.2023.03.22.12.30.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Mar 2023 12:30:53 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [RESEND PATCH 0/4] arm64: dts: qcom: Use proper WSA881x shutdown GPIO polarity
Date:   Wed, 22 Mar 2023 20:30:47 +0100
Message-Id: <20230322193051.826167-1-krzysztof.kozlowski@linaro.org>
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

Resending after all dependencies got merged.  The DTS changes are not
compatible with kernel older than v6.3-rc1 (where the driver changes were
merged).

Description
===========
The WSA881x shutdown GPIO is active low (SD_N), but Linux driver assumed
DTS always comes with active high.  Since Linux driver were updated to
handle proper flag, correct the DTS.

Best regards,
Krzysztof

Krzysztof Kozlowski (4):
  arm64: dts: qcom: sdm850-lenovo-yoga-c630: Use proper WSA881x shutdown
    GPIO polarity
  arm64: dts: qcom: sdm850-samsung-w737: Use proper WSA881x shutdown
    GPIO polarity
  arm64: dts: qcom: sm8250-mtp: Use proper WSA881x shutdown GPIO
    polarity
  arm64: dts: qcom: qrb5165-rb5: Use proper WSA881x shutdown GPIO
    polarity

 arch/arm64/boot/dts/qcom/qrb5165-rb5.dts             | 4 ++--
 arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts | 4 ++--
 arch/arm64/boot/dts/qcom/sdm850-samsung-w737.dts     | 4 ++--
 arch/arm64/boot/dts/qcom/sm8250-mtp.dts              | 4 ++--
 4 files changed, 8 insertions(+), 8 deletions(-)

-- 
2.34.1

