Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 17B44596DBE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Aug 2022 13:41:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233895AbiHQLiI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 17 Aug 2022 07:38:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50662 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229627AbiHQLiH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 17 Aug 2022 07:38:07 -0400
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8FD5A76463
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Aug 2022 04:38:04 -0700 (PDT)
Received: by mail-wr1-x42c.google.com with SMTP id a4so4156509wrq.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Aug 2022 04:38:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=ROj7sohlv4wPY+5HlOVbTna+mgXrBuTWZnNGpotVQLk=;
        b=e4yAfxmB1tVdajNhK/1ivZF0aox0ByJDsTVMsHzALfL4uHhFXuIR5X9hqC9qLAo6ts
         3Faf9zC7KNtXvlu8DLPzEQp/JSRumNIeEwr1uVGREH+WmJq+c+kAfcitzq3NruszkfSm
         XjXV5q+oyLvFkVgwLsVXw3p6iYgbXa35v/PSrKjUkWDxFljfJoGePCM0htnTGkQH2BDD
         Xp4l2x7t2SpnixaLuhxlxDcK7BBP1n/D/fQZ3iuoup3p+Q0K50p8Gy67OrUSetD4VlS4
         k/bd8DC3i5kPxgTUqZZ18Wl24O0EY+oPXRXYGfS6Yl1eOhLn693beGLCFWOPchKbXZX5
         18Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=ROj7sohlv4wPY+5HlOVbTna+mgXrBuTWZnNGpotVQLk=;
        b=FVkx0X6hU/45Gp4CsbRBLSlV4ElZUWK9fBjsuwztiTBwadxC/Iv3TMvjeEE1h8YUGo
         BsUxPAConXBDay+OBSR1bXEbEOlAMKZ1y2nkFc0bnC3sU7fK+9jotcAJH8o0ucB0T1JH
         80lcN+TT/wbHj8JqCUEVfHXISjROPglA6nMVWk57e6Oex0F8bOBkNzTcoAMqkkn3Qbvw
         LDZPEMvh+xeLV7Vly9mkh5n6bnTuZl2aYGSyKSb8P4uGs4tkoKhWHZc7/jfok1/Rzznm
         JCrRFcaVCEjxQfRfifwhAzi5gjzUJE+AuJRqP8Sg0K3CVfjFbf7BPGmwlyGsdJ2JFAAE
         DdEg==
X-Gm-Message-State: ACgBeo2NCqozqju/5Q40t58XcyWLBH5zuChFTd/ekU4b+VWWioFXVEBS
        duGIjzjH1ey42iYo6gHC9DJBTQ==
X-Google-Smtp-Source: AA6agR4lL3Z2TIlBusKl2gqZuysmfsWLu0x+L1feFLZyNYXCQcGUxEguL54Lb4P+529sYR6YbY7cqA==
X-Received: by 2002:a5d:5985:0:b0:222:c827:11d5 with SMTP id n5-20020a5d5985000000b00222c82711d5mr14202254wri.323.1660736283087;
        Wed, 17 Aug 2022 04:38:03 -0700 (PDT)
Received: from srini-hackbox.lan (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
        by smtp.gmail.com with ESMTPSA id m30-20020a05600c3b1e00b003a5ad7f6de2sm2004220wms.15.2022.08.17.04.38.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Aug 2022 04:38:02 -0700 (PDT)
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org,
        linus.walleij@linaro.org
Cc:     konrad.dybcio@somainline.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, srinivas.kandagatla@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] pinctrl: add support for SC8280XP LPASS LPI pinctrl
Date:   Wed, 17 Aug 2022 12:37:45 +0100
Message-Id: <20220817113747.9111-1-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This patchset adds pinctrl driver to support pin configuration for LPASS
(Low Power Audio SubSystem) LPI (Low Power Island) pinctrl on SC8280XP.
    
This IP is an additional pin control block for Audio Pins on top the
existing SoC Top level pin-controller.
    
Tested this on Thinkpad X13s

Thanks,
Srini

Changes since v1:
	- removed unnecessary quotes in bindings
	- remove lable in bindings
	- fixed gpio pattern and removed an extra line after alt functions.

Srinivas Kandagatla (2):
  dt-bindings: pinctrl: qcom: Add sc8280xp lpass lpi pinctrl bindings
  pinctrl: qcom: Add sc8280xp lpass lpi pinctrl driver

 .../qcom,sc8280xp-lpass-lpi-pinctrl.yaml      | 133 +++++++++++
 drivers/pinctrl/qcom/Kconfig                  |   9 +
 drivers/pinctrl/qcom/Makefile                 |   1 +
 .../pinctrl/qcom/pinctrl-sc8280xp-lpass-lpi.c | 207 ++++++++++++++++++
 4 files changed, 350 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,sc8280xp-lpass-lpi-pinctrl.yaml
 create mode 100644 drivers/pinctrl/qcom/pinctrl-sc8280xp-lpass-lpi.c

-- 
2.21.0

