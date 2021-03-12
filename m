Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A21DA3394E2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Mar 2021 18:30:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232881AbhCLR36 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 12 Mar 2021 12:29:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232814AbhCLR3d (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 12 Mar 2021 12:29:33 -0500
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 377A3C061761
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 Mar 2021 09:29:33 -0800 (PST)
Received: by mail-wm1-x333.google.com with SMTP id d139-20020a1c1d910000b029010b895cb6f2so15620989wmd.5
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 Mar 2021 09:29:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=WKTuRup8dPa/K5+GFpnvDSVBJYngatFOEgMROjY7gcc=;
        b=b0JTfx0uO5qWWjVtsMhOMtSGVIQd2mJGlrzHR4wEgCXwmZvtORgoCayl11gDTbN9ph
         1WKmSG8KMO8NG8BiBCphPPLXMiQFIohDpPI7s72ybCQFrcLAkDw0PDNBGE4xVSqHSeBQ
         YHmIxnxRz9wmhd6iPml/0u1HM/lhfXlOuLYIKWn1OEMfPNTERbAa62NqZqVCJ4tb32wH
         URF0yQq3IoCDsdSNs11BYkAhNCzUWo3nTOr2JLPjSyjGwBXF7HHAdrGlw88Vhh5x17xE
         ZGMAjKKy7KZv5tTtDCl712ol3c6ct/1QuxCSH8HmpsF5GjTrbcZ8W8SVkk7FohWxph5y
         koaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=WKTuRup8dPa/K5+GFpnvDSVBJYngatFOEgMROjY7gcc=;
        b=HDTmEGRdk1UknyvfNVEnnqMB5GzfgiYX0GL6E87LUVKfGcwPEzWlR9LRp9FjOH/9BM
         Xcr872aKAEDfqGfFivfTwTbvJu5d4RRc9SPikcpOCyU/AsuZ3kZgs0XKZaa7EnEkETtG
         C9XrAvC/F1WvniHz646PSyIVyRuth3aqi0lQ3gR1esWY/+MTuY+nZRD0XM5Vvultn+3F
         6wSac/W8Njw1BJA1tizwnFxdu5ElM2caiO04cvdFtvqdjVUzWODdBvdYkX9bApeGNe82
         skJ/WTLyYgqaTHSc4JoUkLD1SGCT0tJPsRGvLKktOjcIgS6TirNWlotTqF/aXpvZM+IE
         oZWw==
X-Gm-Message-State: AOAM532nygjrSNHD038zg9jvfYx2/3V9X12JsqkF3KqdnIUVLOPRPRbX
        Mxd0mgQCggPtZftDVw5a9/LZ1w==
X-Google-Smtp-Source: ABdhPJw5k2nNX7HyV5ZXMpGjwg9SGHPAAzHuioH00kVzr3qv9+O2NKDdLdS0XK0TCefPQx9z8WREpA==
X-Received: by 2002:a7b:cc85:: with SMTP id p5mr14274777wma.148.1615570171959;
        Fri, 12 Mar 2021 09:29:31 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id 18sm2876375wmj.21.2021.03.12.09.29.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Mar 2021 09:29:31 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     stanimir.varbanov@linaro.org, agross@kernel.org,
        bjorn.andersson@linaro.org, mchehab@kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc:     bryan.odonoghue@linaro.org, dikshita@codeaurora.org,
        jonathan@marek.ca, vgarodia@codeaurora.org
Subject: [PATCH v2 20/25] media: venus: firmware: Do not toggle WRAPPER_A9SS_SW_RESET on 6xx
Date:   Fri, 12 Mar 2021 17:30:34 +0000
Message-Id: <20210312173039.1387617-21-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210312173039.1387617-1-bryan.odonoghue@linaro.org>
References: <20210312173039.1387617-1-bryan.odonoghue@linaro.org>
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
index 8c2c68114bbd..227bd3b3f84c 100644
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
2.30.1

