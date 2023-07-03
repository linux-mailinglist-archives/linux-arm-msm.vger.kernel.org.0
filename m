Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 813E27461E1
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Jul 2023 20:16:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230356AbjGCSQD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 3 Jul 2023 14:16:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230073AbjGCSQD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 3 Jul 2023 14:16:03 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E5B4E5F
        for <linux-arm-msm@vger.kernel.org>; Mon,  3 Jul 2023 11:16:01 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-4f96d680399so7203769e87.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Jul 2023 11:16:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688408159; x=1691000159;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QTb+nXJp46q8JDCpV9EvFgYbL4krB6DdNBmj86VEcFo=;
        b=XuZ6q3VRsc5ysNSSfsmGf3gsLeCvE1lGP2VNQwr+GWLbH8tuBgj7maui1ViU+F5QnS
         a4nwNpK4WsD5x/XEw/yyC+NHBu5be9jZpSd7SBcJYsEeA4xiBua1PIfBd2sw8N0p0s/9
         WKUczo7kHoFvD6ea02hfGzGC0caphZjYO8Xmmde4RvG7RNV/XFlcqtJ9FcRotHD6z+NM
         xLYFJWCq8bCkogJ86G6z5RwbVjuL02LBOLHRMswnUfFTzXvZT0lJrkjpZ8nAo6WCDwIc
         kzwDeuWb3kXyK53ee3e3SgMoJZFikYmbsZKsOopOkx2AnjQyWLRDOv5nZMRYnqgoq3zQ
         xzMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688408159; x=1691000159;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QTb+nXJp46q8JDCpV9EvFgYbL4krB6DdNBmj86VEcFo=;
        b=Zi6L+074Y6qn1jkRTCWgq40r/rnTgIF3jLh9hA1Xtkj3IB8ye/CJf37BzB+++9Ex0v
         6N2V60p/dGxoBZmM6Mt94L6mf1mQ8KedDkYyCYfkQQEDuYfiKtkKhCePPspMnFyRxyK8
         QsRbbAHaZb9UfKUlN3mDTDLEvQSBl7YflY/zRusa4EiWyHq1YQdqk219o79b0NU1fFeE
         qexB6F2xZXo4qq44Bs1RRurHZ235/YKnCsiIsoUR8FGJWAOfFslAA9EWOiS708wdtJFN
         FfD6tw2kFmPdoJIIOgDv4h0L9BBenXZYTz2UjZvuJYyCHCfVgdbSKqk2wZv77HcnyjL/
         nsOw==
X-Gm-Message-State: ABy/qLZgEjolCnw+QzH7QoHAX+zdOavaie8fMloc35xfZpRvQ5k5VbYr
        Wan+9NjWmcyY+n/XhMf34AUFLGoXhV33NNO459IHRw==
X-Google-Smtp-Source: APBJJlG0xwPkH81x0r1EHWM3a5V/GX1Xj4goSnJifgUtJ4oyaEqa+JWCs3kuS1MhflC4Xn2C133tSw==
X-Received: by 2002:a19:2d05:0:b0:4fb:8e1b:ba05 with SMTP id k5-20020a192d05000000b004fb8e1bba05mr7952874lfj.11.1688408159219;
        Mon, 03 Jul 2023 11:15:59 -0700 (PDT)
Received: from [192.168.1.101] (abyj26.neoplus.adsl.tpnet.pl. [83.9.29.26])
        by smtp.gmail.com with ESMTPSA id a6-20020a056512390600b004f1383d57ecsm4633034lfu.202.2023.07.03.11.15.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jul 2023 11:15:58 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: [PATCH v3 0/4] Qualcomm REFGEN regulator
Date:   Mon, 03 Jul 2023 20:15:53 +0200
Message-Id: <20230628-topic-refgen-v3-0-9fbf0e605d23@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFkQo2QC/32Nyw7CIBREf8WwFsOjQHXlfxgXgLctSQMNVKJp+
 u/edudCl2cyZ2YhBXKAQi6HhWSooYQUEeTxQPxgYw80PJCJYEIyLVo6pyl4mqHrIVLedI45owX
 niqDibAHqso1+QCk+xxHDCcvhtX/c7shDKHPK7/2y8i39sV45ZZQLDeqsjARw1zFEm9Mp5Z5sS
 1X8swXamkvdtMab1qsve13XD8P2byn8AAAA
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh@kernel.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1688408157; l=1915;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=3ESCbgZ3PrD9wdJUC4E4i1ivhrr8hMCGWLtTU5VEbiE=;
 b=lVsR+3/ZTGKIrLGUE+kXfNb+uXPVJuPxZnKBT6Vi1scMbUIju2H2BmbC+EPLt8/QOISbRw6xR
 0GP4K7edxsvAYyTe+5BUX/I6zfBEYtpiezeRluPx78MvRquvBpGgf0t
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Recent Qualcomm SoCs have a REFGEN (reference voltage generator) regulator
responsible for providing a reference voltage to some on-SoC IPs (like DSI
or PHYs). It can be turned off when unused to save power.

This series introduces the driver for it and lets the DSI driver
consume it.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
Changes in v3:
- depend on HAS_IOMEM (s390 build failure, meh)
- constify regulator_ops
- Link to v2: https://lore.kernel.org/r/20230628-topic-refgen-v2-0-6136487c78c5@linaro.org

Changes in v2:
- Remove "|" from bindings description
- fix 'renegator' typo
- define number of 'reg'
- adjust reg= to size/address-cells = 1
- fix regmap usage
- use C++ comments for the header
- remove now-unused struct qcom_refgen
- use common helpers for sm8250 refgen (simple bit ops)
- add missing FIELD_PREPs (small brain forgot regmap_update_bits
  doesn't do shifting)
- pick up tags
- Link to v1: https://lore.kernel.org/r/20230628-topic-refgen-v1-0-126e59573eeb@linaro.org

---
Konrad Dybcio (4):
      dt-bindings: regulator: Describe Qualcomm REFGEN regulator
      regulator: Introduce Qualcomm REFGEN regulator driver
      dt-bindings: display/msm: dsi-controller-main: Allow refgen-supply
      drm/msm/dsi: Hook up refgen regulator

 .../bindings/display/msm/dsi-controller-main.yaml  |   4 +
 .../regulator/qcom,sdm845-refgen-regulator.yaml    |  57 ++++++++
 drivers/gpu/drm/msm/dsi/dsi_cfg.c                  |   2 +
 drivers/regulator/Kconfig                          |  11 ++
 drivers/regulator/Makefile                         |   1 +
 drivers/regulator/qcom-refgen-regulator.c          | 154 +++++++++++++++++++++
 6 files changed, 229 insertions(+)
---
base-commit: 296d53d8f84ce50ffaee7d575487058c8d437335
change-id: 20230628-topic-refgen-14fb0b762115

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@linaro.org>

