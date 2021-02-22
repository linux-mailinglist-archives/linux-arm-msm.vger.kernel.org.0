Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8F539321C3C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Feb 2021 17:07:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231293AbhBVQEt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 22 Feb 2021 11:04:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50692 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231384AbhBVQDo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 22 Feb 2021 11:03:44 -0500
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89CF3C061BC3
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Feb 2021 08:01:58 -0800 (PST)
Received: by mail-wm1-x32d.google.com with SMTP id x16so13996108wmk.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Feb 2021 08:01:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zhmZ46o1OlmHrlQ7agfIkG8JPYi4dbZzTMRJzpesQV0=;
        b=JIXh1zW5uU25ACVRi+kJpbkqGxy2QkO3Jcg/RcV6qf3HRx9q6CMyYnS9xJA2cJ9och
         WIi+F/xF/z9qolVwDxYmgeZf+1VWk6eDihIN0pGsYtWyCT11QmVOGgwdNg97fTSImBt1
         g63EBZDFYxygtHzLvUj/fuQZMiGLEvOflBMfZzOX79l7p2fhbwAfK+4BkuLMCq9NarqM
         TBO7g8CorWCR6N1CoyZN5PbSySjWwMYe6Eawv7Z8QizB6noRgjvbHi8y2nKAsu8F8Rdz
         0irTykLNVEJKzoBKCEq1sH4afmiyTXixRjA7wn+b4PEI5Te6IzFA1fVS7AswwlarGh/r
         y5Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zhmZ46o1OlmHrlQ7agfIkG8JPYi4dbZzTMRJzpesQV0=;
        b=gOHC9a//TsZf4j4Z3YXrpCYJpV4pvA8H2AaqeH5i6cjowP6yBJRC/qmhWaHMZGBZyQ
         1jB2eHzkTF7wfXeMq3qA8zH2FT2Vdjl2Lnlx6f7fwPapIEKDnJISY8JPc97GUwSKUgVu
         0RisEqtUfQRswX73d3R93h1jKgECtg6LUTXB5cavoutFppfqfK/3t03pYnXyEwDjM8TA
         0fyH2xGwj9IpbEmWMDT70tUzl2W+w4goqmsk15nAMUlSNOLTeeYL6VEOUjo6lvkEpuyY
         GK7YZJ5inqNy58iyMTlH9rC9YS+qsg0IaHADC2pDpbFho4wBCITWlEAkfsEsPm/JFdkB
         6H2w==
X-Gm-Message-State: AOAM533lb+JwyzQUirFGy0akRXyNsfw/Xd8R/fuSMioM75Fy8ufHp3NG
        eleYmCy6BCzuJlP6nIEyDMwvAg==
X-Google-Smtp-Source: ABdhPJzgzFllYad+7viwuWTaM5BYaOwHodDARgseCUh2aeGpFCT7TENdzmUxdUpTX+l4DJ/OmgqxFg==
X-Received: by 2002:a05:600c:4c17:: with SMTP id d23mr3430529wmp.116.1614009717314;
        Mon, 22 Feb 2021 08:01:57 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id c3sm7373697wrw.80.2021.02.22.08.01.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Feb 2021 08:01:56 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     stanimir.varbanov@linaro.org, agross@kernel.org,
        bjorn.andersson@linaro.org, mchehab@kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc:     bryan.odonoghue@linaro.org, dikshita@codeaurora.org,
        jonathan@marek.ca, vgarodia@codeaurora.org
Subject: [PATCH 20/25] media: venus: firmware: Do not toggle WRAPPER_A9SS_SW_RESET on 6xx
Date:   Mon, 22 Feb 2021 16:02:55 +0000
Message-Id: <20210222160300.1811121-21-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210222160300.1811121-1-bryan.odonoghue@linaro.org>
References: <20210222160300.1811121-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Dikshita Agarwal <dikshita@codeaurora.org>

Do not toggle the WRAPPER_A9SS_SW_RESET on 6xx.

Signed-off-by: Dikshita Agarwal <dikshita@codeaurora.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/venus/firmware.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/firmware.c b/drivers/media/platform/qcom/venus/firmware.c
index f9170f596849..a7ebe8de2812 100644
--- a/drivers/media/platform/qcom/venus/firmware.c
+++ b/drivers/media/platform/qcom/venus/firmware.c
@@ -53,10 +53,12 @@ int venus_set_hw_state(struct venus_core *core, bool resume)
 		return ret;
 	}
 
-	if (resume)
+	if (resume) {
 		venus_reset_cpu(core);
-	else
-		writel(1, core->wrapper_base + WRAPPER_A9SS_SW_RESET);
+	} else {
+		if (!IS_V6(core))
+			writel(1, core->wrapper_base + WRAPPER_A9SS_SW_RESET);
+	}
 
 	return 0;
 }
-- 
2.29.2

