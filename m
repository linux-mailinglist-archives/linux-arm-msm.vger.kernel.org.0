Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B548CB0AFD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Sep 2019 11:10:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730454AbfILJKf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 12 Sep 2019 05:10:35 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:41347 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730427AbfILJKf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 12 Sep 2019 05:10:35 -0400
Received: by mail-wr1-f68.google.com with SMTP id h7so26559414wrw.8
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Sep 2019 02:10:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Kn+E+YIgEzAwFw6LDS2rhCIDFOekAT5wUT4i1H5I0jU=;
        b=NNhVc4+zFj9YKvx2J6B6qN5MzAdlKTHdqGtnT1NG2nSB64+n6K54DSSyyJ1PJh9i/t
         qgkPmm4Dlocu4Q/kXKmEIw9CaUlN5pPj98lv2NtfOJhCNcb+PkL0GgB/GKKO0QSw/+m+
         ux6wA5JnTs0LrWB6mrNFN3GqKdB1O84PQKPIWjCJYmZbzCArKd7pUDbaXCyg+jSqBr79
         N0wkh4/lWNPUEBwjexjQerMxu2ukNFPI+TvGscxO+htoGSCzDoXTO9VaYS1ojZpLEdKJ
         cVaf++Kr4np3A/owArrlJYElzS2drX/Ly7W1aOm2P2sZPmmXNknjygzmHeWNUuAqrDnL
         ovow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Kn+E+YIgEzAwFw6LDS2rhCIDFOekAT5wUT4i1H5I0jU=;
        b=iRHNTUYL6ACOSlmxRst3aUKkZxml9zMUeMPVjDmsKmWDdIZcp6eL9pB/vp9oIe09lA
         ifkX5WLWc6X74cAb2zbOVm3Zy1i4eqYN/927UTNQ2o6UCpPOX9wPQ0FFopGeGGFEuOMH
         Iep6e7JKOTgLMpfik2sCSWrVPl8oxPiA9EyGciCEVGHzTVQ6hMNedIPYmeVfmi4hR+hh
         36B14YnMemygrUaIsb2X4JWF7q7DlYKFcYXSvOiCf4rF9HLdRLSrRbRJBNJV55M2rajJ
         JdpNbGvHtJd7En3sZ5jOWHSvLxPNjePmkP4nY19gqajM+KJuvONOfL4ueTS+6lFJXlxO
         HCbg==
X-Gm-Message-State: APjAAAUdgcs7NG4kiynBGxe8Hx9uhkpyp9OeUtTs4kNJWAElvDd+sLqa
        tYETQNksrjBeSRsn86iXsZOPHxS0UDM=
X-Google-Smtp-Source: APXvYqzeFdxmytYWfmtUdm55ABcbUG4HVVjjMXD+aVaF/dEh3n1lMf+hJVKE/2IAWyG8Oz9kHLwNCA==
X-Received: by 2002:adf:ea0c:: with SMTP id q12mr1903410wrm.172.1568279433093;
        Thu, 12 Sep 2019 02:10:33 -0700 (PDT)
Received: from srini-hackbox.lan (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
        by smtp.gmail.com with ESMTPSA id y14sm39377181wrd.84.2019.09.12.02.10.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Sep 2019 02:10:32 -0700 (PDT)
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To:     andy.gross@linaro.org, bjorn.andersson@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH] soc: qcom: socinfo: add missing soc_id sysfs entry
Date:   Thu, 12 Sep 2019 10:10:19 +0100
Message-Id: <20190912091019.5334-1-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

looks like SoC ID is not exported to sysfs for some reason.
This patch adds it!

This is mostly used by userspace libraries like SNPE.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 drivers/soc/qcom/socinfo.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/soc/qcom/socinfo.c b/drivers/soc/qcom/socinfo.c
index 8dc86a74559b..876a3f6612a3 100644
--- a/drivers/soc/qcom/socinfo.c
+++ b/drivers/soc/qcom/socinfo.c
@@ -422,6 +422,8 @@ static int qcom_socinfo_probe(struct platform_device *pdev)
 	qs->attr.family = "Snapdragon";
 	qs->attr.machine = socinfo_machine(&pdev->dev,
 					   le32_to_cpu(info->id));
+	qs->attr.soc_id = devm_kasprintf(&pdev->dev, GFP_KERNEL, "%u",
+					 le32_to_cpu(info->id));
 	qs->attr.revision = devm_kasprintf(&pdev->dev, GFP_KERNEL, "%u.%u",
 					   SOCINFO_MAJOR(le32_to_cpu(info->ver)),
 					   SOCINFO_MINOR(le32_to_cpu(info->ver)));
-- 
2.21.0

