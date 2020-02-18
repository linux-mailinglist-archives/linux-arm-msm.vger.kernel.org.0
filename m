Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6CDCF162DF3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Feb 2020 19:13:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726339AbgBRSM4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 18 Feb 2020 13:12:56 -0500
Received: from mail-pl1-f193.google.com ([209.85.214.193]:42451 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726799AbgBRSMy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 18 Feb 2020 13:12:54 -0500
Received: by mail-pl1-f193.google.com with SMTP id e8so8385415plt.9
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Feb 2020 10:12:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=oLeONphgN8bI3yXOD6b6adnLltoiWoWgl8XWN+7QgxY=;
        b=VFZj2SsqMCbIShucyuZlAHB1hbUvkl/E0khDnin9ueeSQG3ICe56NLzND/ROolqv75
         PZZ9/TYDfmZ9pqyrg0NxDm8rItdRvQFa7QGeBPRtCKN1XuOk6ngqul1pfAFXiY1bXifU
         SXBqfoKKQP3z7DfVjxeiRZPKL/YfhK57cBLYhoPLyaOUvYLFEaQU7v4eMLtWgO9RlyuM
         9jLWV6VYMNO14UpvFfy6IFOmnxkaTmtdqRSjbrOfkaDevdhUYK0q6V0aLEj1F23fyCPA
         t41CTKy627ZQrELEExiV+bG7DcAUzoygNamg/ZgSVmVbjBF58ki6jVazVq3iLe/oIQ/y
         7z7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=oLeONphgN8bI3yXOD6b6adnLltoiWoWgl8XWN+7QgxY=;
        b=SxKUr104GZmL/Oi6LoFv8T7zb//Gb462AK6lrSzv3mexbLosCrPrztg8llvtao3dBm
         dR9YENrMi2qH+G8qTGsuMlVnnwG0VP5/TO3N4M1jGsHbgfMRvXcbuIZtRs8oXBoKsT/c
         57jgOl78xO1JcSg1jmIa3wQwBTt6e3G5t/W1coJk5BFldVq0+++HG+CDSa+9hNacxZYj
         y+cSps7gEpAz7JW6n33E0ZmPy6Pn3/VwiF4Q8JRPnymVpXCx/o5rGkU2/hJb03WgEpb0
         7QWBOmomD0YtaM5nw/e/8bfTV1sqn/wg0Wa1a2PfRIpfEYRacHIw5JZOMFg+1MG1ItAZ
         JUow==
X-Gm-Message-State: APjAAAWL2SnXyF4l2NADtXtW1h5NJAt4mgGVvOnlbBc+y5NbOxG6+zkB
        th3eOw8F9AfoYMbRzZSSsNc83A==
X-Google-Smtp-Source: APXvYqxiNPa/1gH9eAM7SpBofRF5udb8qqSPMvgm5ozyIY2/qfio9pHlLjFssqaOxPtTkBAL38KDCw==
X-Received: by 2002:a17:90a:cb11:: with SMTP id z17mr4153616pjt.122.1582049572841;
        Tue, 18 Feb 2020 10:12:52 -0800 (PST)
Received: from localhost ([103.195.202.120])
        by smtp.gmail.com with ESMTPSA id t66sm5185236pgb.91.2020.02.18.10.12.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Feb 2020 10:12:51 -0800 (PST)
From:   Amit Kucheria <amit.kucheria@linaro.org>
To:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        daniel.lezcano@linaro.org, bjorn.andersson@linaro.org,
        swboyd@chromium.org, sivaa@codeaurora.org,
        Andy Gross <agross@kernel.org>
Cc:     Amit Kucheria <amit.kucheria@verdurent.com>,
        linux-pm@vger.kernel.org
Subject: [PATCH v5 8/8] drivers: thermal: tsens: Remove unnecessary irq flag
Date:   Tue, 18 Feb 2020 23:42:12 +0530
Message-Id: <d3e1c0f148d46e395a0886d9028df0faf8e9f9bb.1582048155.git.amit.kucheria@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1582048155.git.amit.kucheria@linaro.org>
References: <cover.1582048155.git.amit.kucheria@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

IRQF_TRIGGER_HIGH is already specified through devicetree interrupts
property. Remove it from code.

Signed-off-by: Amit Kucheria <amit.kucheria@linaro.org>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/thermal/qcom/tsens.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/thermal/qcom/tsens.c b/drivers/thermal/qcom/tsens.c
index 5b003d598234..9ee00c67144c 100644
--- a/drivers/thermal/qcom/tsens.c
+++ b/drivers/thermal/qcom/tsens.c
@@ -118,7 +118,7 @@ static int tsens_register(struct tsens_priv *priv)
 
 	ret = devm_request_threaded_irq(&pdev->dev, irq,
 					NULL, tsens_irq_thread,
-					IRQF_TRIGGER_HIGH | IRQF_ONESHOT,
+					IRQF_ONESHOT,
 					dev_name(&pdev->dev), priv);
 	if (ret) {
 		dev_err(&pdev->dev, "%s: failed to get irq\n", __func__);
-- 
2.20.1

