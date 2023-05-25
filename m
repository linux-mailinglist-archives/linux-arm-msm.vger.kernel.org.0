Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5338E710C1C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 May 2023 14:30:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241117AbjEYM36 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 25 May 2023 08:29:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57158 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241096AbjEYM34 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 25 May 2023 08:29:56 -0400
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC87B183
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 May 2023 05:29:54 -0700 (PDT)
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-309553c5417so2018969f8f.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 May 2023 05:29:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685017793; x=1687609793;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oCxzKkO2/lHavfo2OyvfuRt2aCjvLPfV2Y7BikzkuZY=;
        b=K8SpNBammOEJdC0qmg8B6k8tFL5P8MCricyIA/vJNvi+JRW8UapzXZTpYFKkQNVVH9
         A+M9qVUEEiccpvC2afmP4g6AvTdd5MkuRTEVh75F90nJPeHv+/AruPCiY5usvCEfzUUD
         qTk2JzjuxtUK6yXMBpksOzKkFnIDl4D1BL4R553WfOG6FlKr83HiqZm0RRqIfjIRUgl5
         S/2YXgeBt4xAlokAzGKRqM6dcw94LfgSY3e/H3132vM8GGoI+7jsSM5L4mQ4peDz+w7j
         hg/vhGrhwOEwoxLo+MZi+ZUlMobIzSbxCp7G6l77tHKOT/n8Ho/mgOeS2pLSFl4/ymkf
         6dmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685017793; x=1687609793;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oCxzKkO2/lHavfo2OyvfuRt2aCjvLPfV2Y7BikzkuZY=;
        b=YvCzfOC0vKfH3AjCb8XLC6N5cWh23zI7c8bvLCEAn1teZuX4XAVL+RvQcyu5ibWXld
         IeZs8MVUndYQgmCRWWYOnb/Mr1wkCTso+sg8zQdCLTENL1/vtJySaN+sTJL54htrXVd5
         6FFm+ovPE3i0qA4S7D5zuzmokTqkQ06qIHmowL/Wdq+Ks59KMxJs4XYyLCZt6K07RBEH
         pU/OzDd1kpaf5Pi4a142r2vf/+W+GnBh7JdEPY4PIe9iwk++KgY57epxWWTWtdIIqNFS
         x+jxzcap25GaLidKMGQAPWATRomvlJNMxWVXiN5PF3AAIjegNPFLiKfWQtf4xb/AqK2Y
         328w==
X-Gm-Message-State: AC+VfDxt9kwHbEaRCXQoLV4UGdswxEiZwfI9yjMmMwbbu9aAQEpWzsU5
        rM8syv6kqRQ0H/plbrpsPuRc6Q==
X-Google-Smtp-Source: ACHHUZ42qAHS+VWwocT2RaowE8Hwgv/dRON45KLUBXwbPTMzVke9heU6NltoTaBVTlNkQUreXsGnAg==
X-Received: by 2002:adf:f404:0:b0:2f3:e981:f183 with SMTP id g4-20020adff404000000b002f3e981f183mr2310548wro.10.1685017793509;
        Thu, 25 May 2023 05:29:53 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id k7-20020adfe3c7000000b003062b2c5255sm1700227wrm.40.2023.05.25.05.29.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 May 2023 05:29:52 -0700 (PDT)
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To:     andersson@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org
Cc:     johan+linaro@kernel.org, agross@kernel.org,
        konrad.dybcio@linaro.org, mturquette@baylibre.com,
        sboyd@kernel.org, conor+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH v2 6/6] arm64: defconfig: Enable sc828x0xp lpasscc clock controller
Date:   Thu, 25 May 2023 13:29:30 +0100
Message-Id: <20230525122930.17141-7-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230525122930.17141-1-srinivas.kandagatla@linaro.org>
References: <20230525122930.17141-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Enabled sc828x0xp lpasscc clock controller driver required for X13s laptop.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 57ceb528426d..95ece45fd0cd 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1176,6 +1176,7 @@ CONFIG_SC_GCC_7180=y
 CONFIG_SC_GCC_7280=y
 CONFIG_SC_GCC_8180X=y
 CONFIG_SC_GCC_8280XP=y
+CONFIG_SC_LPASSCC_8280XP=m
 CONFIG_SDM_CAMCC_845=m
 CONFIG_SDM_GPUCC_845=y
 CONFIG_SDM_VIDEOCC_845=y
-- 
2.21.0

