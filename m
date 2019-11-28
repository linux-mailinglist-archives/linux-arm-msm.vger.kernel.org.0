Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 81FF610C98D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Nov 2019 14:35:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726754AbfK1Nem (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 28 Nov 2019 08:34:42 -0500
Received: from mail-wr1-f65.google.com ([209.85.221.65]:34048 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726726AbfK1Nel (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 28 Nov 2019 08:34:41 -0500
Received: by mail-wr1-f65.google.com with SMTP id t2so31112723wrr.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Nov 2019 05:34:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=V0r1Vz9ksKDupLD9OJqzUcDOf67hQCL9kz7e13IH3GE=;
        b=m4dlAYMM/PIeKCsaJqVlO08YbmIhD6RhsLm7nOtLkOytXmO3qq1q/NJvnv0LeaLeXq
         oOxVm1tA7z9hL1eDdcBG3ZUiO1MH5iA1h4sF3xpAlE1lKk6ohD8GACAbkL7U1OghSHi+
         tmZI95GQrE0w++WAg0zQJylT9wyydK5AgU2j0e1JsJ11SuNdMrOSjevlP/Ik/E+liFev
         RBrkrVi/nH5XUspOIPSa7aKqMRRDTzxZY7KpqXEQXr2a5qAohXFKbjJ78CV33+TMQcxj
         UIzA9mthlQkhSlOU/7B04DggmQ2Ez87farNVp7idFzMk/LaeYnLpnkvgL4+KwERgHQjJ
         O16A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=V0r1Vz9ksKDupLD9OJqzUcDOf67hQCL9kz7e13IH3GE=;
        b=A46WZk2l3QtfOFM9pW3SaUuiwVQCUwR/5ukyi0qr9C00+dKfl5BJ3X9/gHHe6NTXb9
         DpyohsXylj2o+fSPEufN1KNh+btkbPP+5iNu9Jow5WgPv0bdwQ8CO8RpNWcO+/uegwkb
         ca5OgHQ6+Ng4zwJRrBZt8sQlZ85x5DvawbbI8E8QhJZOYdK3qfMzG4qczQ1cEzpjZCX6
         0EXfF/xNfVgqPNL19YNbuECd1DHYnH0N0uR6oYau0vtjzZ/0myZZjfWy1TlKTVrsvW/b
         8d0FK+1s/JkVVv0htMWzscinn1xR6UlnYKLpetKN6X5FATeoM0GLKn/01PMqCGVJQOp/
         xavg==
X-Gm-Message-State: APjAAAW4d/T05ImCHxXgy+IC9hD3aVUEKYtTJ9hqmp1OUK3ejgqwxiwN
        Nc3ztmi4Fx5vNvpAV4aAN5Mitg==
X-Google-Smtp-Source: APXvYqy1rwDcBh0cI1GWX7oMKqVb5qJCvtu5a2XAY1XhhuLyV/p3LIlUO78MiO0KUCQBqiPRluL1bg==
X-Received: by 2002:adf:f303:: with SMTP id i3mr46618947wro.157.1574948079524;
        Thu, 28 Nov 2019 05:34:39 -0800 (PST)
Received: from localhost.localdomain ([212.45.67.2])
        by smtp.googlemail.com with ESMTPSA id y20sm2220451wmi.25.2019.11.28.05.34.38
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Thu, 28 Nov 2019 05:34:39 -0800 (PST)
From:   Georgi Djakov <georgi.djakov@linaro.org>
To:     linux-pm@vger.kernel.org
Cc:     bjorn.andersson@linaro.org, agross@kernel.org, digetx@gmail.com,
        evgreen@chromium.org, daidavid1@codeaurora.org,
        masneyb@onstation.org, sibis@codeaurora.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        georgi.djakov@linaro.org
Subject: [PATCH 3/5] interconnect: qcom: msm8974: Walk the list safely on node removal
Date:   Thu, 28 Nov 2019 15:34:33 +0200
Message-Id: <20191128133435.25667-3-georgi.djakov@linaro.org>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191128133435.25667-1-georgi.djakov@linaro.org>
References: <20191128133435.25667-1-georgi.djakov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

As we will remove items off the list using list_del(), we need to use the
safe version of list_for_each_entry().

Fixes: 4e60a9568dc6 ("interconnect: qcom: add msm8974 driver")
Reported-by: Dmitry Osipenko <digetx@gmail.com>
Signed-off-by: Georgi Djakov <georgi.djakov@linaro.org>
---
 drivers/interconnect/qcom/msm8974.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/interconnect/qcom/msm8974.c b/drivers/interconnect/qcom/msm8974.c
index ce599a0c83d9..0a1a8ba6afa7 100644
--- a/drivers/interconnect/qcom/msm8974.c
+++ b/drivers/interconnect/qcom/msm8974.c
@@ -732,7 +732,7 @@ static int msm8974_icc_probe(struct platform_device *pdev)
 	return 0;
 
 err_del_icc:
-	list_for_each_entry(node, &provider->nodes, node_list) {
+	list_for_each_entry_safe(node, &provider->nodes, node_list) {
 		icc_node_del(node);
 		icc_node_destroy(node->id);
 	}
@@ -750,7 +750,7 @@ static int msm8974_icc_remove(struct platform_device *pdev)
 	struct icc_provider *provider = &qp->provider;
 	struct icc_node *n;
 
-	list_for_each_entry(n, &provider->nodes, node_list) {
+	list_for_each_entry_safe(n, &provider->nodes, node_list) {
 		icc_node_del(n);
 		icc_node_destroy(n->id);
 	}
