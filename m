Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CBA347B18A8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Sep 2023 12:54:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231316AbjI1Kyz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 28 Sep 2023 06:54:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39576 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231589AbjI1Kyv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 28 Sep 2023 06:54:51 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF18A196
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Sep 2023 03:54:48 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id 38308e7fff4ca-2bfed7c4e6dso212475181fa.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Sep 2023 03:54:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695898486; x=1696503286; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8eTmhhfj3uISmMmZz0RzGov1pSw9iByYowc/Vyf2gMM=;
        b=bM2Leb8ZGqTT9A7mSnpsZA6NeMDSvMOBIladFA6aS+ya5wMV1GQLh/41Ty4UgdscYL
         Ri5WNotDFQI5wX5pXVElNqe5oRiexKqB+pSBjxVUZ96wOeSWz+UuxeuMXxTAft52X46V
         vNYTZmQnSRXBb5IiagfpCm590lIa8CvpWNeu63mN1IBPc1B/5S4qaGhCrKfl0SfLdxe9
         xb9fyn9vn+nA3lc8biNsAM2p/IAo8niZi6yoVquE+B4RE/iYqHfRbOqVnvYI6FfvRqVV
         DclRqBgCDqE8uxD8WR52XER0L2z3JOHvzRHlZh2yNrLqLue8/i/Nxwaz9Tpj1FSzX0tF
         Jp8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695898486; x=1696503286;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8eTmhhfj3uISmMmZz0RzGov1pSw9iByYowc/Vyf2gMM=;
        b=HXZ42+NIUwRmz2UE7BeWxfFWKxIvyoD6ETNokZMw8ApVyr/j4p8/eI/F1jgUl1oVg9
         zkLqVgYb6neHJAXPgNg18I8glS5T5eP8J5tiT2RXdnp0EC1wkJvSiDgvgqwW3cX8J7er
         GAn9hMFK6PMZEDRTBRPr6IsoIMFVezuGsMrEnGWMFKrq1QplC1vQa93oMYfT5+9CbdQc
         rizrE/i2LQepSuN18oWPvNqlhOPNNujQBZlLP/be/SdsHiLCncPIiciIvtyCepOEhm30
         elDX9gCiG+aXf48me2ZhGdgPW6Noc9CX3xGztQ/zMjTeZUig3rxcqpyEJO5WlPLnvEzE
         2XyQ==
X-Gm-Message-State: AOJu0Yxc4StK0fCVDP0APnOVUDIhl4zlNXmLN3te1mW2nkJVUJXO6bGJ
        gc6PGGvioxp1vC+hbJ6IteIWbiH2pSGq97HiXQxC4Q==
X-Google-Smtp-Source: AGHT+IFmpVOfkCCfaDVRa1U+RJW+yTyWfNHiVhhxTRGpA42Wsu+Lgk/Uep/PK1IeYLotcgCvgqyvRg==
X-Received: by 2002:a2e:9983:0:b0:2bc:d889:2d89 with SMTP id w3-20020a2e9983000000b002bcd8892d89mr966158lji.44.1695898486491;
        Thu, 28 Sep 2023 03:54:46 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id y24-20020a2e9d58000000b002b47a15a2eesm3551455ljj.45.2023.09.28.03.54.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Sep 2023 03:54:45 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org
Subject: [PATCH v3 0/3] phy: qcom-qmp-combo: correct USB v6 registers
Date:   Thu, 28 Sep 2023 13:54:42 +0300
Message-Id: <20230928105445.1210861-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
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

Move and rework USB QMP PHY v6 register names to follow the usual practice.

Changes since v2:
- Renamed the series from 'phy: qcom-qmp-combo: correct sm8550 PHY
  programming', since the fix for sm8550 was landed separately (via [1])
- Removed the comment regarding v5-v6 difference, which looks invalid
  now (Konrad)

Changes since v1:
- Rebased on top of Konrad's patchet ([1])

[1] https://lore.kernel.org/all/20230829-topic-8550_usbphy-v3-0-34ec434194c5@linaro.org/

Dmitry Baryshkov (3):
  phy: qcom-qmp-combo: fix the prefix for the PCS_USB v6 registers
  phy: qcom-qmp-usb: move PCS v6 register to the proper header
  phy: qcom-qmp-combo: use v6 registers in v6 regs layout

 drivers/phy/qualcomm/phy-qcom-qmp-combo.c     | 50 +++++++++----------
 .../phy/qualcomm/phy-qcom-qmp-pcs-usb-v6.h    | 29 +++--------
 drivers/phy/qualcomm/phy-qcom-qmp-pcs-v6.h    | 20 +++++++-
 3 files changed, 50 insertions(+), 49 deletions(-)

-- 
2.39.2

