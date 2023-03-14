Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 82AC46B8D7B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Mar 2023 09:37:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229902AbjCNIhW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 Mar 2023 04:37:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229605AbjCNIhV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 Mar 2023 04:37:21 -0400
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5AD96A1D3
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Mar 2023 01:36:49 -0700 (PDT)
Received: by mail-pj1-x1036.google.com with SMTP id u3-20020a17090a450300b00239db6d7d47so14367761pjg.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Mar 2023 01:36:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678783009;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ep4FbqH2ivKVLrPSEdoGqO90JFBOp5Qq0eV9bigyzfQ=;
        b=gpiRvT9ut1uJuy+xY2utEz+E6QTxxgLvyQh/KiodtNZgfIBCPC1R9FKFISqD3YLA3O
         A9nM+vWyzCTGzwJBVddW8t/PsVmcj0mm6ewyYY4z6BWFv8AzijVMyqyOvmH5gosqTWlD
         sSCZxjQx+9M6OcYRiZeE6y8iIvax93P5lc8Nb8iLvkEE8qwknsKjhWEJ2L6caJa+dpkH
         NHAiHzvngCdZWRaJmkIPui4ZhM2+5SdTRwEuxJvN/rA5ZmbKvOAEBB6ofYffNcyraVpH
         rgzulq61ulb++IG/6vl7U4YG4XOrWFVOtkxEqsC1jMVnsw+gxlsgddOsgf35YDK+Krg7
         6+Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678783009;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ep4FbqH2ivKVLrPSEdoGqO90JFBOp5Qq0eV9bigyzfQ=;
        b=xpkcT8BMaD5kLxUkPt4IK5m5y96V3Sja32t+WTdxDAvksV4m396TSdIldY1YHiM41a
         Wp0CA4v3W4MONFCPiV00e6Hd20zR2wE3/I2AIq5zBzItGJWOwb0q2G5pFYBGcgdO5YeQ
         RYIJ8Pgk5dYyOsdFkckKrLFpLvqM2njinaxd9j+HGnj5wkcG5m7jASMl3Rc1ksStpsHq
         1ZDmccrQ2EyBTN4b1dV89+P+mwCNU/4IoAE5vijaYeRUq3F46NnmjJ1neRk6wYGD7DcZ
         Wh8gugVdteOQuavQwqiY+6FvmE3GVF3mYIAGcJ2dKUIn+OUmJoRG36dWWjd4sGsw61MK
         FeMA==
X-Gm-Message-State: AO0yUKVxxgYChT9/zvOVMlT81h0HU7fg1RmFwYbrk2sIJxZG0gEPV+Jw
        Hz9CWLFdiHeJnFURwIl1fb7uyWZx1rHLbvkx4zk=
X-Google-Smtp-Source: AK7set9RhE0UvOCriYS53PUEwOykVkUBNcW5NhAdkJmcMTYWbPTbsd6rc3W9A5cVrgQ3lhYURp9NQQ==
X-Received: by 2002:a05:6a20:1e62:b0:cc:4db0:f2b5 with SMTP id cy34-20020a056a201e6200b000cc4db0f2b5mr32516543pzb.48.1678783008610;
        Tue, 14 Mar 2023 01:36:48 -0700 (PDT)
Received: from localhost.localdomain ([2401:4900:1c5e:4a3e:15d0:d540:3861:ef0e])
        by smtp.gmail.com with ESMTPSA id g3-20020a631103000000b00502ecb91940sm1020980pgl.55.2023.03.14.01.36.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Mar 2023 01:36:48 -0700 (PDT)
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
To:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Cc:     agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        linux-kernel@vger.kernel.org, bhupesh.linux@gmail.com,
        bhupesh.sharma@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski@linaro.org
Subject: [PATCH v4 0/2] arm64: dts: sm6115: Perform USB node related cleanups
Date:   Tue, 14 Mar 2023 14:06:31 +0530
Message-Id: <20230314083633.1882214-1-bhupesh.sharma@linaro.org>
X-Mailer: git-send-email 2.38.1
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

Changes since v3:
-----------------
- v3 can be seen here: https://lore.kernel.org/linux-arm-msm/20221215094532.589291-1-bhupesh.sharma@linaro.org/
- Split the series into two - this patchset proposes only 'fixes'.
  The USB SS qmp phy change will be sent out separately now that we need
  a driver change as well.
- Also fix the recently added sm6115p lenovo dts.

Changes since v2:
-----------------
- v2 can be seen here: https://lore.kernel.org/linux-arm-msm/20221214203124.564537-1-bhupesh.sharma@linaro.org/
- Fixed a blank line issue in [PATCH 3/3]

Changes since v1:
-----------------
- v1 can be seen here: https://lore.kernel.org/linux-arm-msm/20221213123823.455731-1-bhupesh.sharma@linaro.org/
- Addressed the review comments from Konrad and Krzysztof regarding the
  USB HS and SS Phy usage in sm4250 oneplus board dts ([PATCH 3/3]).
- Collected R-B received from Konrad on v1 patches [1/3] and [2/3].

This series performs some USB related cleanups in sm6115 dtsi.

Note that this series is rebased on linux-next/master.

Bhupesh Sharma (2):
  arm64: dts: qcom: sm6115: Cleanup USB node's label
  arm64: dts: qcom: sm6115: Move USB node's 'maximum-speed' and
    'dr_mode' properties to dts

 arch/arm64/boot/dts/qcom/sm4250-oneplus-billie2.dts |  9 +++++++--
 arch/arm64/boot/dts/qcom/sm6115.dtsi                | 10 ++++------
 arch/arm64/boot/dts/qcom/sm6115p-lenovo-j606f.dts   |  9 +++++++--
 3 files changed, 18 insertions(+), 10 deletions(-)

-- 
2.38.1

