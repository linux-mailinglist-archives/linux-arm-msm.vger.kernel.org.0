Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 81DF47936A1
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Sep 2023 09:58:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229817AbjIFH6b (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 Sep 2023 03:58:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39026 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229530AbjIFH6a (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 6 Sep 2023 03:58:30 -0400
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92474CF
        for <linux-arm-msm@vger.kernel.org>; Wed,  6 Sep 2023 00:58:26 -0700 (PDT)
Received: by mail-lj1-x22e.google.com with SMTP id 38308e7fff4ca-2b974031aeaso55565691fa.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Sep 2023 00:58:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693987105; x=1694591905; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tesgV8kU3XCb/lf2mTrQCPfFGTkmUChK0pxAnvjxU9A=;
        b=FVy0MFbGWgYlDpvsUX7AWW74QgAzt9FC2kWeNmRJopRwvLVTgKWKkAdGVWSeMOANyS
         ZBMup1f/61J1xDoo2FhifJceiKV0SLj8wZAWrAb475NoCdbObrUuZUGuc1B2EDogcfBm
         Ejo9H1uXMMHCjH0oh8R5GS1j/GlfknkJ2yxOcZRSs6oeaYjjI9wvWb8cblc1k4Su6rjW
         GvWAIXAOHcQAkdPjXwHXC0rPwxe6wsyH6CCrL8mFSa4GQiUd1GHiPevU2ckKt0gujNdt
         8KeBXVzafJCEHwdFFj5pmqEP56xlFgMs9PHT+vE1o/tL1iDO9mIDzSpJtRrppkh6vwxD
         Y5yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693987105; x=1694591905;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tesgV8kU3XCb/lf2mTrQCPfFGTkmUChK0pxAnvjxU9A=;
        b=ZTodKVg9lzQ5Dv8/ZfIn362uDNemp5EVtIfLQyJU4Vc6FfkKsk+F5krhdwB+YkGLXy
         tn3s+4HQuZnSucCL1BuDVkGs/MAwPwLemrvhwasukXnNWd3Vo1r3fayo/WdTw8jIaXG9
         Naz/g0NvXT+QQhYELt7uRzieFnKo0Z1Cdng7GxnlZoPPEtSqFUKjtMaNOlmkLnDs8pFM
         /SI42tJ0Zb7Hg+6C79K5EOIzqCSMWuCLULGr8apDAW1ts/5BDpgWa8xn90xlWbJQil//
         UWq0aEetbWWKcMdeR5VRU1X6msoJ2JY1BTm/tXDwhU8UN0dg1sHC6w+VbDhcAwfDOTqm
         1ETw==
X-Gm-Message-State: AOJu0YxF8HTjJ5kRo+C/xz+KqYYUCN3pD6MNn4sn5xHAnb6/eAWX08GT
        PdEOKDOzwC0vUv1j43nyoYly6Q==
X-Google-Smtp-Source: AGHT+IE442k7t62AHxgn5SFP7J4LowMuFNL9bZ6tjhpFmANANokVBj4RiC2pzPcxwTLuHHU/X/8WlA==
X-Received: by 2002:a2e:910d:0:b0:2bc:b0c3:9e8d with SMTP id m13-20020a2e910d000000b002bcb0c39e8dmr1597383ljg.41.1693987104805;
        Wed, 06 Sep 2023 00:58:24 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id z10-20020a2e7e0a000000b002b9ec22d9fasm3268324ljc.29.2023.09.06.00.58.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Sep 2023 00:58:24 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        Abel Vesa <abel.vesa@linaro.org>
Subject: [PATCH 0/4] phy: qcom-qmp-combo: correct sm8550 PHY programming
Date:   Wed,  6 Sep 2023 10:58:19 +0300
Message-Id: <20230906075823.7957-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Fix one bug and several small issues with the QMP USB+DP PHY programming
on the Qualcomm SM8550 platform.

Dmitry Baryshkov (4):
  phy: qcom-qmp-combo: correct sm8550 PHY programming
  phy: qcom-qmp-combo: fix the prefix for the PCS_USB v6 registers
  phy: qcom-qmp-usb: move PCS v6 register to the proper header
  phy: qcom-qmp-combo: use v6 registers in v6 regs layout

 drivers/phy/qualcomm/phy-qcom-qmp-combo.c     | 50 +++++++++----------
 .../phy/qualcomm/phy-qcom-qmp-pcs-usb-v6.h    | 27 +++-------
 drivers/phy/qualcomm/phy-qcom-qmp-pcs-v6.h    | 19 ++++++-
 3 files changed, 49 insertions(+), 47 deletions(-)

-- 
2.39.2

