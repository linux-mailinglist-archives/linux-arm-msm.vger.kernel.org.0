Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4E07E70E33F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 May 2023 19:46:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231334AbjEWQy1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 23 May 2023 12:54:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237843AbjEWQy1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 23 May 2023 12:54:27 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7AC6C2
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 May 2023 09:54:25 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-4f13c41c957so12627e87.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 May 2023 09:54:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684860864; x=1687452864;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iIS9SFexITirFRd16yXcUHPU7FYqwbhVnhTW6RRL/rs=;
        b=BuUfxZ5VHPUlq9N3QgZHPlgVqzU40vp05EbtoiO86hamkd9lY18OtLKKU0zCgAmFL/
         W2tLrSQE0HTF2j5QNDY+FLVIM9Idg+CGhXWk768wF4Zmj3mCnmA1Yr9Eo0MlhgpTssrX
         gT6f1fFRz95IwgW3r8zLGNFQ7ZfXsmaHk585J6EmFFURGTnCJmRDyj/j8taFY7/DikCJ
         zNit3ec0kjbr/Cxkpze549UOiOgAEDP8PJVKw23SK4M6t6zgKB6VHbu/ePnidaUMN/+c
         QEY/huicuZ4QTV3YUKSk9OLUs3igy/FG0tPXPoPnrMUZhpJ7iydyS56nz4HvXOKfY0qc
         JUpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684860864; x=1687452864;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iIS9SFexITirFRd16yXcUHPU7FYqwbhVnhTW6RRL/rs=;
        b=CJnWQdzwR2EyrOWrwpHW6i4Ir78+5DdqbHGjZjxLRp6ju62Llfe17EImu7dwD45jJt
         Jyq+yxJ8SnqbNTT5Nk9Hv8yRXsFYpYQi9iU8db5bxCeXxqGIyA6MJ+b2d5XY5Iq7QftU
         3AKgZkIUeV0hwhXtAfWV//Nag9XlGOU9Dkwd1oxDt6+G0hwQbcFDXgrpWvaaeLeS+2x0
         27kEcnX1GJafCNbbmzSu6MBC7pC+sA6Vb5FjiGWCHc+YARyIBEPoWobb6JZ4REEWyOT7
         PI9Cgjt9ykSUpPbysljjKZqMFhBIt517vGnU/PYI7pxwnB229bMgRHw68VZ0VF4Isfzf
         7vaA==
X-Gm-Message-State: AC+VfDyZFSss2oZt8uiiycS8UwDZfzRi3hbzutcn1/rvUBPcyjgLFyeS
        KWpBmME3iUqSj4XY7+/PXkFitw==
X-Google-Smtp-Source: ACHHUZ4oD0MF6jhp1y+19w18CniTY7S0GWpfvPabRhBF13xWh1QDmw6FECc59cklj16ZNzUjLUx6Lg==
X-Received: by 2002:a2e:b533:0:b0:2ac:767c:fba0 with SMTP id z19-20020a2eb533000000b002ac767cfba0mr4960152ljm.2.1684860864182;
        Tue, 23 May 2023 09:54:24 -0700 (PDT)
Received: from localhost.localdomain (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id q2-20020a2e84c2000000b002adbf24212esm1695245ljh.49.2023.05.23.09.54.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 May 2023 09:54:23 -0700 (PDT)
From:   Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To:     Bjorn Andersson <quic_bjorande@quicinc.com>,
        Arnd Bergmann <arnd@arndb.de>
Cc:     Will Deacon <will@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org
Subject: [PATCH 3/5] arm64: defconfig: Build interconnect driver for QCM2290
Date:   Tue, 23 May 2023 19:54:09 +0300
Message-Id: <20230523165411.1136102-4-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20230523165411.1136102-1-vladimir.zapolskiy@linaro.org>
References: <20230523165411.1136102-1-vladimir.zapolskiy@linaro.org>
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

Build Qualcomm QCM2290 interconnect driver.

Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index e2f6a352a0ad..ec9b828b14e2 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1415,6 +1415,7 @@ CONFIG_INTERCONNECT_QCOM=y
 CONFIG_INTERCONNECT_QCOM_MSM8916=m
 CONFIG_INTERCONNECT_QCOM_MSM8996=m
 CONFIG_INTERCONNECT_QCOM_OSM_L3=m
+CONFIG_INTERCONNECT_QCOM_QCM2290=y
 CONFIG_INTERCONNECT_QCOM_QCS404=m
 CONFIG_INTERCONNECT_QCOM_SA8775P=y
 CONFIG_INTERCONNECT_QCOM_SC7180=y
-- 
2.33.0

