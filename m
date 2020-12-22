Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3FF622E0A40
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Dec 2020 14:05:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726557AbgLVNFf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 22 Dec 2020 08:05:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54902 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726518AbgLVNFe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 22 Dec 2020 08:05:34 -0500
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57174C0613D6
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Dec 2020 05:04:54 -0800 (PST)
Received: by mail-lf1-x12e.google.com with SMTP id o13so31811262lfr.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Dec 2020 05:04:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=s3V/TtIufHPkQhmtTrjVzj5+nIzx7UpDGpZLYRgMPKs=;
        b=irN+kovVrKnG5RJweP71z1TelLa1u9KQVwH0GR4kcFdtNJ2IgkP8j9TMyfJmrZb+ZO
         gsIzeTkTGgeNpgW+cOOMz666APb1CiZ/ZpQmyqDXOjdj2MVrK85eL2uaATSwKdXwyyK3
         yvQv94CCrXFmaQa77iCluGxPSJqmx0ApAcnckgY/ga9gieZPad5/6wKigrdKW/Xz1nJ0
         iIjZfA8EtQdg1qzvINZCIOpxVjgmNxl0Xv2ovEGg8gBh4CZgz9xzKMx6FDQYNbJX0anL
         TgMEbEBULznVgxoIC/aiWAHEmd/fC4PSXsPaDaNhla2L2UZAGtup3PmwRt5LM128N7F+
         klwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=s3V/TtIufHPkQhmtTrjVzj5+nIzx7UpDGpZLYRgMPKs=;
        b=oz0UCyM5Y3dacUOqV3I0foTxe7jwKLhW/qCjKSGBYqoL9SGz0ev3ug0lEvx/I+lppU
         qGjFWVoZyEXvodhpNQLAHbVy+Gh6f/lGtTtCxt4Bcl+FdStsHCpghmnRW+OjGER88NUe
         /qkGokvPtcjht4cRcer/ZHM3AFc7fU0ZocQfUN2d/H4FAQ11uGn2DeAgW212JH8l6F/Z
         37TdWEauLRAQHxppPf+I8KPBZZRfZzaksixew+1wSlkp4AVfZFT81NvmjXRrUCv+s084
         kql/FSf+BqdpZ4DlL1AwMyC1c6gaya4JZHan8FhgLBGPXzGNgNh5wMsSW1Zrj+2Ylye7
         69gw==
X-Gm-Message-State: AOAM531jx4VEJyyLn7S/0BBuWc285OgTOd97UlCBAP20U8WCc6VCmk/y
        fkb2goJzsxxLYhaKHLjdgWRs0g==
X-Google-Smtp-Source: ABdhPJy2Sb5bsYgQ7YuoLWh2GAiaau1gVIUm18vrGipq+CdAvpeV0blLEb1dNUZ9aB5Pme85erLmEg==
X-Received: by 2002:a2e:b52c:: with SMTP id z12mr10184160ljm.250.1608642292872;
        Tue, 22 Dec 2020 05:04:52 -0800 (PST)
Received: from eriador.lumag.spb.ru ([94.25.228.224])
        by smtp.gmail.com with ESMTPSA id k18sm2864235ljb.80.2020.12.22.05.04.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Dec 2020 05:04:52 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org
Subject: [PATCH 2/3] soc: qcom: socinfo: add several PMIC IDs
Date:   Tue, 22 Dec 2020 16:04:47 +0300
Message-Id: <20201222130448.4125297-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201222130448.4125297-1-dmitry.baryshkov@linaro.org>
References: <20201222130448.4125297-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add several PMIC IDs found on Qualcomm RB5 platform.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/soc/qcom/socinfo.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/soc/qcom/socinfo.c b/drivers/soc/qcom/socinfo.c
index cbd59937aac5..7229c3c04083 100644
--- a/drivers/soc/qcom/socinfo.c
+++ b/drivers/soc/qcom/socinfo.c
@@ -83,6 +83,11 @@ static const char *const pmic_models[] = {
 	[23] = "PM8038",
 	[24] = "PM8922",
 	[25] = "PM8917",
+	[30] = "PM8150",
+	[31] = "PM8150L",
+	[32] = "PM8150B",
+	[33] = "PMK8002",
+	[36] = "PM8009",
 };
 #endif /* CONFIG_DEBUG_FS */
 
-- 
2.29.2

