Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2666610C98A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Nov 2019 14:35:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726764AbfK1Nem (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 28 Nov 2019 08:34:42 -0500
Received: from mail-wm1-f65.google.com ([209.85.128.65]:50274 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726696AbfK1Nej (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 28 Nov 2019 08:34:39 -0500
Received: by mail-wm1-f65.google.com with SMTP id l17so11019228wmh.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Nov 2019 05:34:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/SDaimtx4qvfQT+a77LcPCR1TXpL+CTCSqALSHB4+Rg=;
        b=fKWoGZnUHc0AEupO0e6BxYnAvJWsF4R3vlQfEGVemUrT1VmzmBVuRcs3pYHh1i022b
         gHmZKlDlHLPDLKLOFB31mC+7L1exI346izL/6cLcwo2keOu59Zw/hKq7Fx1iS2FOTJZD
         mrE7l2joW729IcshdEEbg8w+u5mfrT3HexEs7L86uvd6tZlm29ugtWvQDcHsUeUURYYj
         vsec6EgQjjsV+Rn7koKFXTjcMr42HpbtZsEwcA5vxEIBbyymZfRIf9MWFdoWveRAa2xJ
         y+FhU5PfevlbWXY3k+t9i7MqLgHUKy5Tn5QeNyyX0XO1UTS1j6uaZCNiWEMOzFGkdVX5
         970Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/SDaimtx4qvfQT+a77LcPCR1TXpL+CTCSqALSHB4+Rg=;
        b=l9ZASiphZnqys3KYpp4xuFlRIoSPm9BGFrZsdOaKzJKuKvlrEN3661UBeqtteIRMy1
         MzcllYqfuVw4MOMHlS7Nr1zLlw4+gb2Mg0xrr7a/AgludVgkDqA4xKeWV3nLi3mbwypC
         lohnFjcNz8Bxt6/VM7+G19i3tEypaeaxhYNVgPJxp6Ujq4W4fSdXPNvhO0z3zOVegB07
         IPMJYEF0r/cVBgj91JYZ6wFaYODoy9gDssvkhnwL7kFFQzI2hPfsi0AqMxoF09KdQZdE
         UsflfWJK6nnrkpzNG60g7Kdt5yIkd0RjsCQp1QF/I60tpcB57D/H7TC1LgdRHMg757oa
         GWhg==
X-Gm-Message-State: APjAAAWy3FWaiq/ixFZ74StJs1s7TSC9xtVQlYzRopuZ11dO7hP0F/hW
        tKdm79tqBS592M0/HCH6TwB9qg==
X-Google-Smtp-Source: APXvYqz50wTmdDHppw64lnOGv4kBmYEywC/jd69HR/l3/KqJ/30thrOsVhsT64GKvxVlxa0p/ykg9w==
X-Received: by 2002:a1c:23d5:: with SMTP id j204mr9329041wmj.0.1574948077036;
        Thu, 28 Nov 2019 05:34:37 -0800 (PST)
Received: from localhost.localdomain ([212.45.67.2])
        by smtp.googlemail.com with ESMTPSA id y20sm2220451wmi.25.2019.11.28.05.34.35
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Thu, 28 Nov 2019 05:34:36 -0800 (PST)
From:   Georgi Djakov <georgi.djakov@linaro.org>
To:     linux-pm@vger.kernel.org
Cc:     bjorn.andersson@linaro.org, agross@kernel.org, digetx@gmail.com,
        evgreen@chromium.org, daidavid1@codeaurora.org,
        masneyb@onstation.org, sibis@codeaurora.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        georgi.djakov@linaro.org
Subject: [PATCH 1/5] interconnect: qcom: sdm845: Walk the list safely on node removal
Date:   Thu, 28 Nov 2019 15:34:31 +0200
Message-Id: <20191128133435.25667-1-georgi.djakov@linaro.org>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

As we will remove items off the list using list_del(), we need to use the
safe version of list_for_each_entry().

Fixes: b5d2f741077a ("interconnect: qcom: Add sdm845 interconnect provider driver")
Reported-by: Dmitry Osipenko <digetx@gmail.com>
Signed-off-by: Georgi Djakov <georgi.djakov@linaro.org>
---
 drivers/interconnect/qcom/sdm845.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/interconnect/qcom/sdm845.c b/drivers/interconnect/qcom/sdm845.c
index 502a6c22b41e..924c2d056d85 100644
--- a/drivers/interconnect/qcom/sdm845.c
+++ b/drivers/interconnect/qcom/sdm845.c
@@ -870,7 +870,7 @@ static int qnoc_remove(struct platform_device *pdev)
 	struct icc_provider *provider = &qp->provider;
 	struct icc_node *n;
 
-	list_for_each_entry(n, &provider->nodes, node_list) {
+	list_for_each_entry_safe(n, &provider->nodes, node_list) {
 		icc_node_del(n);
 		icc_node_destroy(n->id);
 	}
