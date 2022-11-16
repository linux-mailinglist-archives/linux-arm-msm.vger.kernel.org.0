Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F095262BB3D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Nov 2022 12:17:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239090AbiKPLRs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 16 Nov 2022 06:17:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59366 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239098AbiKPLRV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 16 Nov 2022 06:17:21 -0500
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F02175B87B
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Nov 2022 03:05:30 -0800 (PST)
Received: by mail-wm1-x32e.google.com with SMTP id t25-20020a1c7719000000b003cfa34ea516so2626344wmi.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Nov 2022 03:05:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TqJhaI2f39O+mx8H8+knTybOAJrfRfd7YGQks+65llo=;
        b=TXKEyU7XKIOG8NGPkuFoUzgNzeuky6U6Q7L0T/BnPdocMdJxgsmgF1cZCtgX5Jq/3Z
         9gxOWCpGKXS4MNb1iVsrxnZy9Tr2Kwo0II+8rj97Wpvazs3dAX9Vgx1g7k8TLZ7IR0W6
         igfCQr9ZgizHo9tZGQJZJ1Jxdg8YZSUGOk64CeC3TJLRgNYF/YvlMEhwFSScPG59bJEB
         xEqz/yj6ulTS+11d3GTQ50PQjkSR+iMVPiCpdkeIL2tEXTFM+iluzVi9KOOqzQPDw/51
         x+HjbyvFL9CS3xZMqcBgOroXhkuZFhZqSbWVWlQvAgTO7vbUZb3QDhMwEAoO8F2nqywh
         eunQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TqJhaI2f39O+mx8H8+knTybOAJrfRfd7YGQks+65llo=;
        b=jjRg8GrCghq+ongNt8wNRqW/eYSTVzNGwowFmnDY+SIFOxZzuDEx7+Lsz7xnii2vzN
         FEAnr81y1DQGSbJ6re7bldyXaQl+A3fcutQW/F/TrHaXRbZ8sg2/ZV/lhWFxgKMPAOqJ
         Cmv2mWgpzjaoDEuM7dG4GllS5BCOSlofaFLgRyOMHzSPLyCWpSNyz1g5yDrh0/R+MaW8
         Nks6mJaECKsQ4mCVwPIBzSz7gAy6Fh7wOHMAm3Tvz2bUWCb7mhfCTu7PurjvaqdM5MzD
         cTqkK/3G8SqKxShCcBpxulwOgK6/SjDvocnNLKmNI3Mpo/1babYS0MpKfS7Oso7lCaky
         +gFg==
X-Gm-Message-State: ANoB5pm4TedLmlKx/js3kVIIYDU4G9lXVF08CHf48MGyaTxFRb3aGEXX
        PZksoa5fQ6TkXQB/vBp2YFY5lg==
X-Google-Smtp-Source: AA0mqf4OybDC4xV1zlil6w6c8LALL5eJsPs/3cBj72/cAY3sCLm/zoCQIli6TjrgBd/FKkJDpuZoMA==
X-Received: by 2002:a05:600c:792:b0:3cf:6a83:bd19 with SMTP id z18-20020a05600c079200b003cf6a83bd19mr1773328wmo.29.1668596729522;
        Wed, 16 Nov 2022 03:05:29 -0800 (PST)
Received: from localhost.localdomain ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id i6-20020a05600c354600b003cf894c05e4sm1806231wmq.22.2022.11.16.03.05.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Nov 2022 03:05:29 -0800 (PST)
From:   Abel Vesa <abel.vesa@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: [PATCH 0/2] regulator: qcom-rpmh: Add support for PM8550
Date:   Wed, 16 Nov 2022 13:05:13 +0200
Message-Id: <20221116110515.2612515-1-abel.vesa@linaro.org>
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

This patchset adds regulator support for the new Qualcomm PM8550 PMIC.

To: Andy Gross <agross@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>
To: Liam Girdwood <lgirdwood@gmail.com>
To: Mark Brown <broonie@kernel.org>
To: Rob Herring <robh+dt@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org

Abel Vesa (2):
  regulator: qcom,rpmh: Add compatible for PM8550
  regulator: qcom-rpmh: Add support for PM8550 regulators

 .../regulator/qcom,rpmh-regulator.yaml        | 29 ++++++-
 drivers/regulator/qcom-rpmh-regulator.c       | 81 +++++++++++++++++++
 2 files changed, 107 insertions(+), 3 deletions(-)

-- 
2.34.1

