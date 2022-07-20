Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 646B457C07B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Jul 2022 01:06:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230323AbiGTXGx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 20 Jul 2022 19:06:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56224 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230125AbiGTXGw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 20 Jul 2022 19:06:52 -0400
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com [IPv6:2607:f8b0:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF3BB140C9
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 Jul 2022 16:06:50 -0700 (PDT)
Received: by mail-ot1-x331.google.com with SMTP id z12-20020a056830128c00b0061c8168d3faso13517175otp.7
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 Jul 2022 16:06:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9l1HeQDiotjqJIv5Il7K5ATLOcCGvQ53f+vdiVnWUvY=;
        b=Qk7zS8c0PgkoGxfjIoIPmT+Jj4O8j4dX9JWQkAgBDhsVZXps/h11yjwALceKU+NH+l
         dsIiRw1a3LVLZevDTSq+Fe7L+zTC+XPHsuLKLoPsrpUHlZ6fsT1eG74L9eqI/Ai9mr7b
         ptJBvi3+zbz5ba+VKs9eZrjcR1WK1i9haqEZSJwCeugcBNHjkCQ/cT0UgHfQTbC+j0NN
         vhVevwg7WcsHFIyaVDb1Mr4iEtU79QdVdPSE7ZuJ0ZLIIcAo26ne8443pTjoeByU5/+A
         N+KGnUFnM5NPUs+UmglRENjS+ek2lYQust8wTTXCn0F7i9MdnH+iZzssEk/ym5qwB/5l
         r+9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9l1HeQDiotjqJIv5Il7K5ATLOcCGvQ53f+vdiVnWUvY=;
        b=SfdpPvL3gNFTptSn9WksMSRH7CtgB7cEL+J9fwwzNYZpQ7LzQ/xKO5UJRQEBmA6/l1
         RGlX7/gYbP3clx8x788ozoRmEpLPohH05/q4w1a/OqPhZhK9gSpTsSezbORdy3DZdprb
         1tiAtMiMAgiYbwyn6aBTWpPZK5AlJivHDMh8pVtQsynGCcKHDJhRFjVnBQrcGsbB9hpf
         5NMeqGD58bPQl7qj3L/mqOZNRT+tb6+TfwOIqaLSrwL+sZsYKI2M/Wuhw5zRapKSVTfd
         ceXa6z9b5UCPbCGT26xgexoGalcyWSelUKgwu8PMnf6LWWsS30FFyDQlPMELPMY2o9Sk
         1sTg==
X-Gm-Message-State: AJIora9mRHk7bdZvPGSQnHTs4gtEdzzDiSmHrFwwFMc3nvvyK+fvAPy+
        j70h3mHB86Zo40Jh2ocTFx9Udg==
X-Google-Smtp-Source: AGRyM1teuAqc54sPbqVd5WQINGjAiYqQewnHwR8RmMeDUacYjp5xeL+BxSYUyX17DbixxSurTrHW2w==
X-Received: by 2002:a05:6830:314f:b0:61c:bb6e:331 with SMTP id c15-20020a056830314f00b0061cbb6e0331mr2864558ots.283.1658358410185;
        Wed, 20 Jul 2022 16:06:50 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id r1-20020acaa801000000b0032e548d96e0sm20976oie.23.2022.07.20.16.06.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Jul 2022 16:06:49 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     arm@kernel.org, soc@kernel.org
Cc:     linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Andy Gross <agross@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Olof Johansson <olof@lixom.net>,
        Kevin Hilman <khilman@baylibre.com>,
        Stephan Gerhold <stephan.gerhold@kernkonzept.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Parikshit Pareek <quic_ppareek@quicinc.com>,
        Yang Li <yang.lee@linux.alibaba.com>
Subject: [GIT PULL] More Qualcomm driver changes for v5.20
Date:   Wed, 20 Jul 2022 18:06:48 -0500
Message-Id: <20220720230648.2113609-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.37.1
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

The following changes since commit b9c2ae6cac403dee3195fda9eb28d8ee733b225b:

  soc: qcom: icc-bwmon: Add bandwidth monitoring driver (2022-07-06 15:57:51 -0500)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-drivers-for-5.20-2

for you to fetch changes up to c23b7d4967892430674f03f97d5fbd2f37a6732a:

  dt-bindings: soc: qcom: qcom,smd-rpm: add power-controller (2022-07-20 10:12:03 -0500)

----------------------------------------------------------------
More Qualcomm driver changes for v5.20

This adds support for booting secondary cores, SPM, SMD-RPM and RPM
power-domain support for the MSM8909 platform.

It drops an unnecessary print in icc-bwmon, corrects SA8540P entries in
socinfo and a Kconfig build dependency for QCOM_RPMPD.

Lastly it continues to clean up up the Devicetree bindings for the
Qualcomm drivers.

----------------------------------------------------------------
Konrad Dybcio (1):
      soc: qcom: Make QCOM_RPMPD depend on PM

Krzysztof Kozlowski (3):
      dt-bindings: soc: qcom,rpmh-rsc: simplify qcom,tcs-config
      dt-bindings: soc: qcom: aoss: document qcom,sm8450-aoss-qmp
      dt-bindings: soc: qcom: qcom,smd-rpm: add power-controller

Parikshit Pareek (1):
      soc: qcom: socinfo: Fix the id of SA8540P SoC

Stephan Gerhold (8):
      dt-bindings: soc: qcom: smd-rpm: Add MSM8909
      soc: qcom: smd-rpm: Add compatible for MSM8909
      dt-bindings: power: qcom-rpmpd: Add MSM8909 power domains
      soc: qcom: rpmpd: Add compatible for MSM8909
      dt-bindings: soc: qcom: spm: Add MSM8909 CPU compatible
      soc: qcom: spm: Add CPU data for MSM8909
      dt-bindings: arm: cpus: Document "qcom,msm8909-smp" enable-method
      ARM: mach-qcom: Add support for MSM8909

Yang Li (1):
      soc: qcom: icc-bwmon: Remove unnecessary print function dev_err()

 Documentation/devicetree/bindings/arm/cpus.yaml    |  1 +
 .../devicetree/bindings/power/qcom,rpmpd.yaml      |  1 +
 .../bindings/soc/qcom/qcom,aoss-qmp.yaml           |  1 +
 .../bindings/soc/qcom/qcom,rpmh-rsc.yaml           | 33 ++++++++--------------
 .../devicetree/bindings/soc/qcom/qcom,smd-rpm.yaml |  4 +++
 .../devicetree/bindings/soc/qcom/qcom,spm.yaml     |  1 +
 arch/arm/mach-qcom/Kconfig                         |  4 +++
 arch/arm/mach-qcom/platsmp.c                       |  1 +
 drivers/soc/qcom/Kconfig                           |  1 +
 drivers/soc/qcom/icc-bwmon.c                       |  4 +--
 drivers/soc/qcom/rpmpd.c                           |  1 +
 drivers/soc/qcom/smd-rpm.c                         |  1 +
 drivers/soc/qcom/socinfo.c                         |  3 +-
 drivers/soc/qcom/spm.c                             | 14 +++++++++
 include/dt-bindings/power/qcom-rpmpd.h             |  7 +++++
 15 files changed, 51 insertions(+), 26 deletions(-)
