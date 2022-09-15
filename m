Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 30B7B5B998C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Sep 2022 13:28:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229650AbiIOL2S (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 15 Sep 2022 07:28:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48196 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229553AbiIOL2R (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 15 Sep 2022 07:28:17 -0400
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C8757C1E7
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Sep 2022 04:28:16 -0700 (PDT)
Received: by mail-pf1-x433.google.com with SMTP id d82so17730966pfd.10
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Sep 2022 04:28:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=8BbJuqttJ/4fV8VqdOXoHInPzBrkD/Iy1FYpvE30g1c=;
        b=Bi8jW5stvM7E/VS68FDwwRlwNAFRPBXV03tcB7arf/SAHExnJ59XJtmwUg1wqr8cLk
         ZxfITpFvHJjzKL1jH6pyhGJ3dNSb8QL6ifnIVCJkkKEs0J3jgAs11uovByFus/9sN8VT
         RQOzvYx6dKEDrjNeUyvPRA6CQqTl7+TVJIIIiul6tiopmX0X9aJHOu70hjdYjFoNtQzR
         qv/HRulxb3D0RRFrWD3LPye8mCexxByJw6+z6S53VtGMpD3tpIy0Y06VsHdQ5yX+EesX
         +7sz03IGYRhYXarssSJBeQAVjtF5rF3CI0JiZdcH4e/sbPsqovWhVbywvbCoKGeT7AlO
         80GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=8BbJuqttJ/4fV8VqdOXoHInPzBrkD/Iy1FYpvE30g1c=;
        b=Y4sQnGXJYgrGjfwexl1a7zu5+gYus5lSjx12L/ZVoe9Z7RUg4kansNJP3d4NELf9BQ
         U8Dw5Cp5dbOlaZM6X0EMrhSGmJuxFLn1lTO56vwH6+08xaPmKbIdKUzaL7OLHcHHC+Wu
         Xyz6swR66XL3A3Z2d9EvmfFIQNyfgrV/WVOtKmH9sB0HO3JOMyx5mCjzI2GquTg/UGsm
         Jl2+PkTvlR0xVvog2FK+iS5dIHB5iGFwzUEsY7ZsibBME9aESCpq8Q07SpKkvfV8METM
         7uo/QBTdPUO9iNjQ9v2j5RaGABjHdtAJ/nOqVNXD332+duX3eiFMQbWStK5yt/ew3fvb
         deOA==
X-Gm-Message-State: ACgBeo3V3aaoSZd7jACVZMgmrCZ/FQNJaDdEDvYupDvAZ7z3zaDYg3yi
        tLNmwUiFwikkG2twGQxk3YO6Zw==
X-Google-Smtp-Source: AA6agR4B/IutwaBDZel5D+SGqN4y4Z0TKVPo8Zo/Vm2Hwunv3YSwj0n9BBt71rBKTNLWw0ZyHbex6A==
X-Received: by 2002:a63:778d:0:b0:438:5c5b:f2ac with SMTP id s135-20020a63778d000000b004385c5bf2acmr29736269pgc.401.1663241295529;
        Thu, 15 Sep 2022 04:28:15 -0700 (PDT)
Received: from localhost.localdomain ([2401:4900:1c61:6535:ca5f:67d1:670d:e188])
        by smtp.gmail.com with ESMTPSA id m17-20020a170902db1100b001782751833bsm9214157plx.223.2022.09.15.04.28.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Sep 2022 04:28:15 -0700 (PDT)
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
To:     netdev@vger.kernel.org
Cc:     linux-arm-msm@vger.kernel.org, bhupesh.sharma@linaro.org,
        bhupesh.linux@gmail.com, linux-kernel@vger.kernel.org,
        Vinod Koul <vkoul@kernel.org>,
        David Miller <davem@davemloft.net>
Subject: [PATCH] MAINTAINERS: Add myself as a reviewer for Qualcomm ETHQOS Ethernet driver
Date:   Thu, 15 Sep 2022 16:58:04 +0530
Message-Id: <20220915112804.3950680-1-bhupesh.sharma@linaro.org>
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

As suggested by Vinod, adding myself as the reviewer
for the Qualcomm ETHQOS Ethernet driver.

Recently I have enabled this driver on a few Qualcomm
SoCs / boards and hence trying to keep a close eye on
it.

Cc: Vinod Koul <vkoul@kernel.org>
Cc: David Miller <davem@davemloft.net>
Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index c26a5c573a5d..e8b58d4afce5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -16943,6 +16943,7 @@ F:	drivers/net/ethernet/qualcomm/emac/
 
 QUALCOMM ETHQOS ETHERNET DRIVER
 M:	Vinod Koul <vkoul@kernel.org>
+R:	Bhupesh Sharma <bhupesh.sharma@linaro.org>
 L:	netdev@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/net/qcom,ethqos.txt
-- 
2.37.1

