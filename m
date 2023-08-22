Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BF465784AFC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Aug 2023 22:06:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230117AbjHVUGe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 22 Aug 2023 16:06:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40412 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230196AbjHVUGd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 22 Aug 2023 16:06:33 -0400
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 39D6DCE6
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Aug 2023 13:06:31 -0700 (PDT)
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-31781e15a0cso4363357f8f.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Aug 2023 13:06:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692734790; x=1693339590;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=W5TKtFXf3MZKrzAMomkIUprhHnUtImmLl+og3MtZcOc=;
        b=ENQvSHxelq973mRBGY7iBhX5HFAm8BxAI4VIPmyP3fXyxX491Czm+IPuYk+/RWz6Le
         VV+xjOuA5u/tm6vjQIbc7p5Q90dB6qJNM+pfJh956FZ6dcV3bHG8yfiDwL3+U4wCc7y2
         m1PsLlw2eJY1vBLp/75kZiUjRPKtIY0V3YUeNdgnMGp1U6kUXCOhqNaA8Xp+oTW1i8xr
         6KhYPHhYdHNYlH+cyZd/NqA7CM45ihbkAJe3In596kY1hhpKiFMBcIKhZ2cgLswZ7LpD
         FyF2pHyAzjCDMUuWvwxp6tZnx+sycASJeQPKtQc2oSLgw/16sA2akmInediJXtIvkgLV
         uWVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692734790; x=1693339590;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W5TKtFXf3MZKrzAMomkIUprhHnUtImmLl+og3MtZcOc=;
        b=i5imbygtkpynDXQBBKTxhHNoRAwjQOV1kWZpyeSwxdLklQ7wx9gNSD4VwLpN7bds6o
         acFLckUkLeY/Pu1SSXKNjG6QHiE74/uxtEqbur6j1+Msx8iYGOQmmnPgHNVv2l5P1/Xe
         vHQrsAiThBKYqOxA3aox5dgtuforR2IKXS5gLUC3rqIM0dyZ9jhs+9qPcJO2jUywJyxn
         QyF3xh3z58QHaZSIanSpoG7aQuPfs9aPTPNFJ1jnaezoi14h8muA5QR/bs4GAK5WXGwQ
         +I600fH7sQH50Vi3TR2Q5niezeytAXD+tquTCYhOeK7H25+ZTHV/qeM8Bn1thG9ZE3zx
         g0kQ==
X-Gm-Message-State: AOJu0Ywp4uk51T+nHkRWHUPBQ4mNscH4hF7MaNjN57dlvreVPdyIYjBO
        vsU4YP5LeZYcL+m5Va10E6mGIA==
X-Google-Smtp-Source: AGHT+IFq0QIrECqyY2h104tU4JuuGQoxoofcMpvxGAzuT0kIyHScTg3Bf6XZcehUu8a/HNqHHVu2Hw==
X-Received: by 2002:a5d:6811:0:b0:319:8a5a:ab5e with SMTP id w17-20020a5d6811000000b003198a5aab5emr7165067wru.38.1692734789654;
        Tue, 22 Aug 2023 13:06:29 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id y12-20020adfee0c000000b0031aeca90e1fsm12873690wrn.70.2023.08.22.13.06.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Aug 2023 13:06:29 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     rfoss@kernel.org, todor.too@gmail.com, bryan.odonoghue@linaro.org,
        agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        laurent.pinchart@ideasonboard.com, sakari.ailus@linux.intel.com,
        andrey.konovalov@linaro.org
Cc:     linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/9] media: qcom: camss: Bugfix series
Date:   Tue, 22 Aug 2023 21:06:17 +0100
Message-ID: <20230822200626.1931129-1-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

V2:
- Amends commit log for TPG fix to cover dropping of fixed
  VC when setting up a TPG - Konrad

- Leaves GENMASK etc out. I'm happy to do a "make it pretty"
  series later on. - bod

Link: https://git.codelinaro.org/bryan.odonoghue/kernel/-/commits/Bugfix-series-v2?ref_type=tags

V1:
- Drops dt_id = vc * 4 in favour of a patch in a later series - Hans
  Link: https://git.codelinaro.org/bryan.odonoghue/kernel/-/commit/d4c382c5d6ee153b410a01e172b3e811011d0b14
- Adds Konrad's Acked-by as indicated

V0:
This series covers a number of Fixes: all of which are for application to
stable as well as -next with the exception of the second patch which is a
fix for a SHA that is still in -next.

Link: https://git.codelinaro.org/bryan.odonoghue/kernel/-/tree/linux-next-23-08-07-db410c-rb3-camss-dts-v3

This series is part of a larger set of fixes, improvements developed/found
when adding a new SoC.

Link: https://git.codelinaro.org/bryan.odonoghue/kernel/-/tree/lenovo-x13s-v6.5-rc4-x13s-camss-patches

First pass on that larger series is to get all of the current Fixes: in the
branch out.

Andrey Konovalov (1):
  media: qcom: camss: Fix csid-gen2 for test pattern generator

Bryan O'Donoghue (8):
  media: qcom: camss: Fix pm_domain_on sequence in probe
  media: qcom: camss: Fix V4L2 async notifier error path
  media: qcom: camss: Fix vfe_get() error jump
  media: qcom: camss: Fix VFE-17x vfe_disable_output()
  media: qcom: camss: Fix VFE-480 vfe_disable_output()
  media: qcom: camss: Fix missing vfe_lite clocks check
  media: qcom: camss: Fix invalid clock enable bit disjunction
  media: qcom: camss: Fix set CSI2_RX_CFG1_VC_MODE when VC is greater
    than 3

 .../platform/qcom/camss/camss-csid-gen2.c     | 11 ++++----
 .../qcom/camss/camss-csiphy-3ph-1-0.c         |  2 +-
 .../media/platform/qcom/camss/camss-vfe-170.c | 19 +++-----------
 .../media/platform/qcom/camss/camss-vfe-480.c | 19 +++-----------
 drivers/media/platform/qcom/camss/camss-vfe.c |  5 ++--
 drivers/media/platform/qcom/camss/camss.c     | 26 +++++++++----------
 6 files changed, 28 insertions(+), 54 deletions(-)

-- 
2.41.0

