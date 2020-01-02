Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1C4BA12E779
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jan 2020 15:55:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728618AbgABOy4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 2 Jan 2020 09:54:56 -0500
Received: from mail-pj1-f67.google.com ([209.85.216.67]:39258 "EHLO
        mail-pj1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728604AbgABOyz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 2 Jan 2020 09:54:55 -0500
Received: by mail-pj1-f67.google.com with SMTP id t101so3438096pjb.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jan 2020 06:54:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fBoLG1yNGX8O84D+YcSt5B+i5/exbpkdJTkAsAGAlGk=;
        b=qCXuNdiSR16NjCl2MfuL4UuKLIGqC+aI6fJyLyPkOWfXERE1srFvi+G65shbWPvUUB
         yak7t+K9YILtB2M5FMNMR0YVzag6Juq+ocVuPWl4xIQl5Eg6pHAvopOBMrsQm2p6dinN
         4vqGMMaqasKh/O+sWbMJj6uYO5QmuxYeiWAjg+56ly2wJAU/THpVF1vGf/phd7stDSx8
         oor7SODucz0k2ufCAhJSTm4r8ryWa8AEXXGZcImfJq3LhB6ZQRv4sGTStymGBlnryzLe
         5PEr+I6wFkGsD+I8Oi1wwF49AmSc9yM5qb+3h28Jt2WDCaESn9e2horyLYCaeeEVC9dF
         gYRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fBoLG1yNGX8O84D+YcSt5B+i5/exbpkdJTkAsAGAlGk=;
        b=Q96jKghv85G8h4pLdSc67/VfRMCH7VKOAaqwb5DtN65uYc9VNCSb91KMG8PwbPZR0X
         BM+ZYrmOntNp6sHR19qhtHcL4RjsjatlyF4FYnrPafx+KsNykteNYP/ot2CNc5qpbdth
         XgfVr3G/UzZvUV92tc4NZ1pkF958TffrQjgwWq9EXJ1z8Scfz6kqrKBpn4zVFUiSSpZ1
         597ecsmk6aA6E6RZsNO5NSTNuLMp+vHUganOIrOzHi6OWHvVyKZUVauXXyU012VXwltv
         eHVpPYVjT4C3dQEF9ZpUr/joT/rdp3o9FaUd5K0I9PlOfqYaUImSPmKjweOipayPXW0d
         qHpQ==
X-Gm-Message-State: APjAAAWlTDyVDEAAtvo65Q4c3HOBv8cYqSmbtkwa7LhuPY0i355aHjm+
        IqsRJRRZ99zxh/E4a1RSRvxlKQ==
X-Google-Smtp-Source: APXvYqzqhn/VAN3Br6Oz2bcdlCFgzIT2moGT2q0uNq4nk+Ht9Z8UyjO9WjWb12H49524M/mjfLgVNg==
X-Received: by 2002:a17:90a:26ec:: with SMTP id m99mr20400488pje.130.1577976894354;
        Thu, 02 Jan 2020 06:54:54 -0800 (PST)
Received: from localhost ([103.195.202.148])
        by smtp.gmail.com with ESMTPSA id h128sm66808306pfe.172.2020.01.02.06.54.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jan 2020 06:54:53 -0800 (PST)
From:   Amit Kucheria <amit.kucheria@linaro.org>
To:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        bjorn.andersson@linaro.org, swboyd@chromium.org,
        sivaa@codeaurora.org, Andy Gross <agross@kernel.org>
Cc:     Amit Kucheria <amit.kucheria@verdurent.com>,
        linux-pm@vger.kernel.org
Subject: [PATCH v3 4/9] drivers: thermal: tsens: Release device in success path
Date:   Thu,  2 Jan 2020 20:24:29 +0530
Message-Id: <0a969ecd48910dac4da81581eff45b5e579b2bfc.1577976221.git.amit.kucheria@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1577976221.git.amit.kucheria@linaro.org>
References: <cover.1577976221.git.amit.kucheria@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

We don't currently call put_device in case of successfully initialising
the device.

Allow control to fall through so we can use same code for success and
error paths to put_device.

Signed-off-by: Amit Kucheria <amit.kucheria@linaro.org>
---
 drivers/thermal/qcom/tsens-common.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/thermal/qcom/tsens-common.c b/drivers/thermal/qcom/tsens-common.c
index 1cbc5a6e5b4f..e84e94a6f1a7 100644
--- a/drivers/thermal/qcom/tsens-common.c
+++ b/drivers/thermal/qcom/tsens-common.c
@@ -687,8 +687,6 @@ int __init init_common(struct tsens_priv *priv)
 	tsens_enable_irq(priv);
 	tsens_debug_init(op);
 
-	return 0;
-
 err_put_device:
 	put_device(&op->dev);
 	return ret;
-- 
2.20.1

