Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D13C63D4B18
	for <lists+linux-arm-msm@lfdr.de>; Sun, 25 Jul 2021 05:04:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229853AbhGYCXb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 24 Jul 2021 22:23:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39238 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229665AbhGYCXa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 24 Jul 2021 22:23:30 -0400
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com [IPv6:2607:f8b0:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB4D9C061757
        for <linux-arm-msm@vger.kernel.org>; Sat, 24 Jul 2021 20:04:01 -0700 (PDT)
Received: by mail-oi1-x231.google.com with SMTP id o185so6709422oih.13
        for <linux-arm-msm@vger.kernel.org>; Sat, 24 Jul 2021 20:04:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=i41MjxNBGnyelNR6Z6r7QRVZ7cIT7dJr7P2wEnNvkN4=;
        b=xUiQueEb0Mm6puORxMN7ixcknmUUW7+ty+PZyzjcQPvpupXPffuQt4ijgFFkrC6QSU
         CCjoELE1Z8Dt7Dg4wncEY04J0XdCaIP3u3QULzICX/fphldn+YvY3I6n1ZqbSg13dMe6
         8msM6VYTW4ammgtJ/Xdrv7E9Zl+Oz+KDtkLPgJEbUlWUcagKP56aoQ6p6bksHvPhUROj
         3QMOtYVKQRnYGLFRPyg5ClvHHbxHrxO829i7B7r2IqoYsPYiI8HRMgUDXaIvbpSFhGpA
         Ya1nyfigcwJtWKnMZPT0MuQeblptluXHEEfh1joHXjyFK4klMbV/bbYksPf2zK0lSrUv
         MN5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=i41MjxNBGnyelNR6Z6r7QRVZ7cIT7dJr7P2wEnNvkN4=;
        b=fRa8DU8hY/zBBdBglCUes8P5NYemG5lXaoTLi3mukbZtxsHC6Jh0tPMrRbMBxInIgd
         DE2JX8ezxcPDfIkG9LMDRHygDa8jnIX7I8nPHGRy7C0lchxsH6dFpWJEjy8dQB/x/VSm
         7shcbFTdOtv86XYw3JIvl4pRKUNARcTZULIwAZTReHq5EhaSVZ4K3uGErkTK6V366pLa
         P8X8hdvy0axwy1S/3/VKQTsQAckvVKGfsDeWUuKKGb5RtVj8AXmLj5Smbzq4y64Wc0P6
         EvnlkR0I/MLlbS6cdp/YGI6qKTW0Mg9HtOobTUDxDiB3G1/l9v/fxpkdcH+5lp5rRSRO
         688Q==
X-Gm-Message-State: AOAM531K4VesYfidOY1G7nU3ImnDZdkaF+7nAbj07cVBtzF1faNj1pZu
        RnYdaSXnH5EZZZj58UBETsmwEw==
X-Google-Smtp-Source: ABdhPJx8yltFDhA0miTyRRKekdr4v45UgoxLBmNRVd7x4VzkGSI+Z0nicX86cSIo7Ajo+Tn+k+xcnQ==
X-Received: by 2002:aca:5c0a:: with SMTP id q10mr5076341oib.11.1627182241092;
        Sat, 24 Jul 2021 20:04:01 -0700 (PDT)
Received: from localhost.localdomain (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id w35sm3389048ott.80.2021.07.24.20.04.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Jul 2021 20:04:00 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Viresh Kumar <viresh.kumar@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] cpufreq: blacklist Qualcomm sc8180x in cpufreq-dt-platdev
Date:   Sat, 24 Jul 2021 20:02:14 -0700
Message-Id: <20210725030214.3942250-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The Qualcomm SC8180x platform uses the qcom-cpufreq-hw driver, so
it in the cpufreq-dt-platdev driver's blocklist.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/cpufreq/cpufreq-dt-platdev.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/cpufreq/cpufreq-dt-platdev.c b/drivers/cpufreq/cpufreq-dt-platdev.c
index bef7528aecd3..9d5a38a91f10 100644
--- a/drivers/cpufreq/cpufreq-dt-platdev.c
+++ b/drivers/cpufreq/cpufreq-dt-platdev.c
@@ -139,6 +139,7 @@ static const struct of_device_id blocklist[] __initconst = {
 	{ .compatible = "qcom,qcs404", },
 	{ .compatible = "qcom,sc7180", },
 	{ .compatible = "qcom,sc7280", },
+	{ .compatible = "qcom,sc8180x", },
 	{ .compatible = "qcom,sdm845", },
 
 	{ .compatible = "st,stih407", },
-- 
2.29.2

