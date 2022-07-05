Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F2B575663DF
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Jul 2022 09:26:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230221AbiGEHXw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 Jul 2022 03:23:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230210AbiGEHXv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Jul 2022 03:23:51 -0400
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 060E82BF8
        for <linux-arm-msm@vger.kernel.org>; Tue,  5 Jul 2022 00:23:49 -0700 (PDT)
Received: by mail-pl1-x630.google.com with SMTP id m2so10289745plx.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 Jul 2022 00:23:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8rbEhw6j9pFcMzg6DlhT76WbqkNNFflGCPGuP0xsCvg=;
        b=CRNz0GunVs1FoGBH1egrw9QzY53WtHgCknHKIf9Ij2oeHltlJ8saEDwEWShrWPhV+p
         1+Ug/RUhOTGcEzLCEg6gb3RE4+ItgPm/qGEqkQ3ppGCjTk6efwWxMN2LqRr24dXXA/d6
         KM9rfDkEHB251KclJQuJhmwp+qgcr099oiz9Yl77nwtkzcM/hxqx93rm13VPo+BsOEAN
         0IwgAkLt3i5TMo4FkZ2rEktYVO+ao5mFqHjV3vfwXl5Y6SKzoTdz9Q4TTipfLpMEvVkx
         pELjlBGPR+KfjThxzZw5qzVGd5dVZ6QtwEcpLTEHQ0uQoPnd172zG+WLUKBgqCXgrI8i
         ycBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8rbEhw6j9pFcMzg6DlhT76WbqkNNFflGCPGuP0xsCvg=;
        b=jFy/Yclv9N7RPjhJjVGVuH7G1MKyaKoi3I4DF0gleYr3gIt6BFmsfs99NGEmSXRtzS
         +PAuDauhp3M83ko4yeEfZV00xr+6ujCjyUf/7VUqQvz5SeQp1f1oR90qcK+/VQXyrN1D
         A92F3G5h8rSC3QJeK5eOl/1lhViBIy54lYHXM47mNWM+WAIurJmzjEeSY7ngyWmol6Vl
         2lhOk73XK6VCYPLtV7N2p+fXKn1t81dgP1K2uib4W/Dl+rYpPJBFfUCemuyy/vbMYwx1
         xNroglw5viXgSyRsgqiyGYBB70pIKMyYS/ZVwMqphTQP6rsyIra39OT0Af4AHxRyzI+T
         nmiw==
X-Gm-Message-State: AJIora/lvV5dZln1j8LNugO8bwurvJ0pi1Hb3FQ+ojOxRGLQDpvGGQgg
        qIeTvnkg78UaJWqrefyqk6h4aw==
X-Google-Smtp-Source: AGRyM1ujrD8pTQ5NVOgiq84qm4JbwiwkARGBkqLVU0itnVKShIBiN9vGOR8+cBcIJHPKHXlJ0eDzZw==
X-Received: by 2002:a17:902:7c12:b0:16a:11b9:ae9f with SMTP id x18-20020a1709027c1200b0016a11b9ae9fmr39927775pll.82.1657005828364;
        Tue, 05 Jul 2022 00:23:48 -0700 (PDT)
Received: from leo-build-box.lan ([154.3.32.171])
        by smtp.gmail.com with ESMTPSA id y6-20020a626406000000b0050dc76281f0sm22148016pfb.202.2022.07.05.00.23.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Jul 2022 00:23:47 -0700 (PDT)
From:   Leo Yan <leo.yan@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Georgi Djakov <djakov@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Leo Yan <leo.yan@linaro.org>
Subject: [PATCH v4 0/5] interconnect: qcom: icc-rpm: Support bucket
Date:   Tue,  5 Jul 2022 15:23:31 +0800
Message-Id: <20220705072336.742703-1-leo.yan@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This patch set is to support bucket in icc-rpm driver, so it implements
the similar mechanism in the icc-rpmh driver.

We can use interconnect path tag to indicate the bandwidth voting is for
which buckets, and there have three kinds of buckets: AWC, WAKE and
SLEEP, finally the wake and sleep bucket values are used to set the
corresponding clock (active and sleep clocks).  So far, we keep the AWC
bucket but doesn't really use it.

Patches 01, 02, 03 enable interconnect path tag and update the DT
binding document; patches 04 and 05 support bucket and use bucket values
to set the bandwidth and clock rates.

Changes from v3:
- Removed $ref and redundant sentence in DT binding document for
  '#interconnect-cells' (Krzysztof Kozlowski).

Changes from v2:
- Fixed for DT checker error for command ''make DT_CHECKER_FLAGS=-m
  dt_binding_check' (Rob Herring).

Changes from v1:
- Added description for property "#interconnect-cells" (Rob Herring);
- Added Dimtry's reviewed tags for patches 02 and 03 (Dmitry Baryshkov);
- Rebased on the latest mainline kernel and resolved conflict.


Leo Yan (5):
  dt-bindings: interconnect: Update property for icc-rpm path tag
  interconnect: qcom: Move qcom_icc_xlate_extended() to a common file
  interconnect: qcom: icc-rpm: Change to use qcom_icc_xlate_extended()
  interconnect: qcom: icc-rpm: Support multiple buckets
  interconnect: qcom: icc-rpm: Set bandwidth and clock for bucket values

 .../bindings/interconnect/qcom,rpm.yaml       |   6 +-
 drivers/interconnect/qcom/Makefile            |   3 +
 drivers/interconnect/qcom/icc-common.c        |  34 +++++
 drivers/interconnect/qcom/icc-common.h        |  13 ++
 drivers/interconnect/qcom/icc-rpm.c           | 134 ++++++++++++++++--
 drivers/interconnect/qcom/icc-rpm.h           |   6 +
 drivers/interconnect/qcom/icc-rpmh.c          |  26 +---
 drivers/interconnect/qcom/icc-rpmh.h          |   1 -
 drivers/interconnect/qcom/sm8450.c            |   1 +
 9 files changed, 182 insertions(+), 42 deletions(-)
 create mode 100644 drivers/interconnect/qcom/icc-common.c
 create mode 100644 drivers/interconnect/qcom/icc-common.h

-- 
2.25.1

