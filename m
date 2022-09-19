Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E9B925BD4FB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Sep 2022 21:00:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229773AbiISTAr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 19 Sep 2022 15:00:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229687AbiISTAn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 19 Sep 2022 15:00:43 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 925D02ED70
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Sep 2022 12:00:41 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id a8so48414932lff.13
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Sep 2022 12:00:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=PtYAXaw7SqXRsF0uwP9fA2Gkxd8ErzzPCvmWtCq6/A0=;
        b=acimAWdbWmYxhkcIOBj1+ysSQfFCwBDSq3t4w2xxuXa0GaTxpEkJkIHhvhTzZu8IMW
         jT+bn5GUuIo2be/l814kDMUyU3lCybsj5Ru+P30JY5YGZU/5JtHBiP5SMIWydExQQFp4
         wlSIX5BWfhaeCl11h7gQ0P5vBKLpZXfQ/GIA3ogvI59guWrJyQj0IgPJC1uV5sj6qECo
         TZtNRxfV4TA1Ar7KQMTunlIje/5q9ZdNV7KJ+ilCd6Oj8SuHH3/JJg8V+zMoobR9Bmfz
         SLelg09s/Q0JksbM84MJfGP0fDQlxNOGaX7ojT/ouQRlF2cD3A7kAgVB+mTBR0eeEi5e
         cPgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=PtYAXaw7SqXRsF0uwP9fA2Gkxd8ErzzPCvmWtCq6/A0=;
        b=rBA4BqMJ6gp8q7kmn+BVK9CcRtO7MUPWPhW9ol6XhausqH8fe6CbmOfWiVchNJ77US
         QsBIVSxkuUMYkKNX/hgKna6INIvGvFKSHZBmdnc1k0pT277jB4ZqV4XdJgDZo/JJloHN
         AFrS3NU67Sz8i6hBE7yxniYZV92pchzIIx2XkbeBrjoi2DxfagSQihE+Orbw3RaULE9i
         5pWcn/Nps9WRspFu9QRNZKI6FCjRJo3X/jP56IxtVRhbAvjNgqoI7zfItAKiwIOCoaDb
         eH2W2M9/U59POv67pAygYF9Memlpu/dClqazqjvcs8nrtaw6ef0durEcMnRXKRw5zIq8
         dQvg==
X-Gm-Message-State: ACrzQf2qO16CuZoqRc5J5mkad62MEy87j2my8wVl84b+X8Zq2VpN8G2U
        PYpp8Hfz4npelEcC5/ucE9rc9w==
X-Google-Smtp-Source: AMsMyM45wO46AL62Hf9EOzcGg/IvCrqbB4TUCPdNFf7UOY9d41/ZpA33ObxzxN5m/koNyMLpF0mv8g==
X-Received: by 2002:a05:6512:3408:b0:49a:b195:7ab5 with SMTP id i8-20020a056512340800b0049ab1957ab5mr6392943lfr.92.1663614039395;
        Mon, 19 Sep 2022 12:00:39 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id u12-20020a05651220cc00b0049a747d6156sm4878907lfr.287.2022.09.19.12.00.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Sep 2022 12:00:38 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v1 0/6] arm64: qcom: dts: correct firmware paths
Date:   Mon, 19 Sep 2022 22:00:31 +0300
Message-Id: <20220919190037.2122284-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
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

This patchset corrects firmware paths for several Qualcomm-based devices
to include the SoC name.

Changes since RFC:
 - Fixed firmware paths for Sony devices according to the discussion
   with Konrad (added Sony, renamed pdx223 to nagara).
 - Changed ifc6560 to use SoC-generic firmware since the board doesn't
   seem to be fused to particular PKI.

Dmitry Baryshkov (6):
  arm64: qcom: dts: w737: correct firmware paths
  arm64: qcom: dts: miix-630: correct firmware paths
  arm64: qcom: dts: ifc6560: correct firmware paths
  arm64: qcom: dts: sagami: correct firmware paths
  arm64: qcom: dts: pdx223: correct firmware paths
  arm64: qcom: dts: nile: correct firmware paths

 arch/arm64/boot/dts/qcom/msm8998-lenovo-miix-630.dts   |  4 ++--
 arch/arm64/boot/dts/qcom/sda660-inforce-ifc6560.dts    |  2 +-
 arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile.dtsi  |  2 +-
 arch/arm64/boot/dts/qcom/sdm850-samsung-w737.dts       | 10 +++++-----
 .../arm64/boot/dts/qcom/sm8350-sony-xperia-sagami.dtsi | 10 +++++-----
 .../boot/dts/qcom/sm8450-sony-xperia-nagara-pdx223.dts |  6 +++---
 6 files changed, 17 insertions(+), 17 deletions(-)

-- 
2.35.1

