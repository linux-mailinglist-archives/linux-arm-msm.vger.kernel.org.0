Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 85AB730F5BB
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Feb 2021 16:04:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236963AbhBDPCo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 4 Feb 2021 10:02:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60904 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237056AbhBDPBV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 4 Feb 2021 10:01:21 -0500
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20145C061794
        for <linux-arm-msm@vger.kernel.org>; Thu,  4 Feb 2021 07:00:07 -0800 (PST)
Received: by mail-wm1-x331.google.com with SMTP id j11so3393438wmi.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Feb 2021 07:00:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=2V2m5rFMMubWGXq76HAlBgLUJ0bO/2ibl98uXVHvBnk=;
        b=Vr6z69kNemvb4ISPZBfKLFUvl7Qwz9RTvkne0fGh90hcug60aw+RJQuYrgq9ZovLXn
         1kFySmYTQ0+lRYNFTX7UIKMOrjVFJKNHye498apgZBy7sloGZAHkkX36IiUxQ2szXOIY
         QQrfxwI1cdOBne1unSBK4yk02VwFGPUIDL7nu3Yg17lgu2WPIc/MNnVnsJFGuz9wNeT4
         PDSXbxo9y7TLzZbrJ4m+qTzkrf8UCdbvk/49z75iLn6u8MZp/EqiKEvC7rmB5J7V/57q
         CM1LiL67on67xfLp3BSdLHuZNMv9ETOO+T1dp/5ykfQi/W/RSceGwH2xtT7ONRhIs0Wm
         N3eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2V2m5rFMMubWGXq76HAlBgLUJ0bO/2ibl98uXVHvBnk=;
        b=k2XGoxVvA4T4q3ooLSCgbPT5C3hrZK9BCntCWKFkAV8IksqHLJTUPc9z6otoeTZ67g
         WQ/G0Nn5XWb8vkVHA/q/p+xgO8LpjN8qHkCC4fylusCQnIt1YbwyDP0rCKydpeCjOpyB
         2blpa0xe9gdvQj3+zakS1417ZLwcTnW8L/185xvv8m/pHVs1LMnG7JDtTx/T2WyG6r/c
         ISjoRIry5QiZPmOTcMSVMZ0NRDt+NvqgjgeNgvDfBi1HiQetjDyQipMcl31CyAHZEJT8
         KY9tGa57xqFEe9+2FvG1qo/KLnuK9sae5qbVguS2evL0nsNznuWM8heqomuel0xkvLxV
         bQRg==
X-Gm-Message-State: AOAM532oRhSlNGEr2VFvEXthATNCLBs41oXVqg0UbaKRR4tTHYUbBNAJ
        nhrn4Nmo4P/nLY3RcAqjGVEVoA==
X-Google-Smtp-Source: ABdhPJySjxV1EgJQJ74M32YnITdnmrBITFlqYSxQ32+AwO33LuKPe8/3Im3vp2sh77jSlmWetIvHUw==
X-Received: by 2002:a1c:a957:: with SMTP id s84mr7753547wme.166.1612450805830;
        Thu, 04 Feb 2021 07:00:05 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id c11sm8312664wrs.28.2021.02.04.07.00.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Feb 2021 07:00:05 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux-clk@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        mturquette@baylibre.com, sboyd@kernel.org,
        bjorn.andersson@linaro.org, robh+dt@kernel.org, agross@kernel.org
Cc:     bryan.odonoghue@linaro.org, jonathan@marek.ca,
        dikshita@codeaurora.org, dmitry.baryshkov@linaro.org,
        stanimir.varbanov@linaro.org
Subject: [PATCH v2 1/4] dt-bindings: clock: Add missing SM8250 videoc clock indices
Date:   Thu,  4 Feb 2021 15:01:17 +0000
Message-Id: <20210204150120.1521959-2-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210204150120.1521959-1-bryan.odonoghue@linaro.org>
References: <20210204150120.1521959-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Two indexes need to be added to videocc-sm8250.h for venus to function
properly. Rather than adding the missing indexes when used we add them
separately here to keep checkpatch.pl happy.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Tested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 include/dt-bindings/clock/qcom,videocc-sm8250.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/dt-bindings/clock/qcom,videocc-sm8250.h b/include/dt-bindings/clock/qcom,videocc-sm8250.h
index 2b2b3867af25..8d321ac3b1fa 100644
--- a/include/dt-bindings/clock/qcom,videocc-sm8250.h
+++ b/include/dt-bindings/clock/qcom,videocc-sm8250.h
@@ -16,6 +16,8 @@
 #define VIDEO_CC_MVS1C_DIV2_DIV_CLK_SRC	6
 #define VIDEO_CC_PLL0			7
 #define VIDEO_CC_PLL1			8
+#define VIDEO_CC_MVS0_DIV_CLK_SRC	9
+#define VIDEO_CC_MVS0_CLK		10
 
 /* VIDEO_CC resets */
 #define VIDEO_CC_CVP_INTERFACE_BCR	0
-- 
2.29.2

