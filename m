Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D4DC383EBE
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Aug 2019 03:25:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727746AbfHGBZC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 6 Aug 2019 21:25:02 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:45203 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727733AbfHGBZB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 6 Aug 2019 21:25:01 -0400
Received: by mail-pl1-f196.google.com with SMTP id y8so38593939plr.12
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Aug 2019 18:25:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=7FaHyZF1ytvXmMKwCY/+k3LPm48Hqmka/roO7lTdlfk=;
        b=W2pIBOZDMlqjCRetFToDIC8mCbZmZSEt/H5K/cFfP2QAj+Od/VAzU39DoUW/gu4mRh
         MfcvcIf34TrCsKQa7YjVxazj1Gzvnrik2WCVQMCQSskglgalm6XupTZwluycEDv051xH
         5pLALLcxXXgkIRz+3YC2zEOpiTXCb673jQ8IH0Jqm+c8V+QSLglNvsOy8hHF3pkIA5sU
         UbzUvQ3WZ/HOVdbU2uja1ewMrNfFZ6YpPor+o0W1FHaHKvEjpVEyi2cGz9Otoml6Tc3o
         719QBFWIWECKfiXvXn9LleI4h+7q3D19Px1wbOHB+yTc/wHKeUVSf+xct0s9Rbdu4mNs
         KDvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=7FaHyZF1ytvXmMKwCY/+k3LPm48Hqmka/roO7lTdlfk=;
        b=Po5gsz4XKdqa7WPT/3qDDemHqaSIfNVzt0lvXJ4AfvpN1YHUxaym4HdSmHIpj0Iq0G
         axukvkoyT00kJn0vQ+SERBzrWWBdnD7m7f7+wriEtYo5rJZ2ys+cXD+tbdEQsXlBCyef
         0KHxDLN1hS163vH4jCPEO63meMz0YySJgbFyoHZIbnFPZZdOUrPYrFyMZ5Dq0JDDOMAb
         lC5R1gd1fQs9SYIWCJiRdyNu7hs5tlpdYPtqJFeZnMVFZ+fMu6y4tQ2YbUj1WK9GSfyn
         blZUN7+BacHFXvV12BACQFHG6QnHQbx7QM9fHYlXEyGnsAMyZh3N0Y1crG+QpvBHBtKA
         clnQ==
X-Gm-Message-State: APjAAAVM582rKCXS1P6oYIlVcXXMFTeMSV6SP7UPleAZ3O0dUqGkXmdC
        owZd3S1kj2CHq3S8ItpPS3z0/Cj0KZs=
X-Google-Smtp-Source: APXvYqz70zFAXr+KOybPQi1XC/A2h56130aPIZLAlrxB52DWP6wUc26wvAp+g/3nUGcOS2EQSNdAxQ==
X-Received: by 2002:a17:902:b497:: with SMTP id y23mr5916521plr.68.1565141100693;
        Tue, 06 Aug 2019 18:25:00 -0700 (PDT)
Received: from localhost.localdomain (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id a12sm16687179pgv.48.2019.08.06.18.24.59
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 06 Aug 2019 18:25:00 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: [PATCH] soc: qcom: socinfo: Annotate switch cases with fall through
Date:   Tue,  6 Aug 2019 18:24:57 -0700
Message-Id: <20190807012457.16820-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20190807100803.63007737@canb.auug.org.au>
References: 
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Introduce fall through annotations in the switch statements of
socinfo_debugfs_init() to silence compiler warnings.

Fixes: 9c84c1e78634 ("soc: qcom: socinfo: Expose custom attributes")
Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/soc/qcom/socinfo.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/soc/qcom/socinfo.c b/drivers/soc/qcom/socinfo.c
index 855353bed19e..f0ca9d7c7966 100644
--- a/drivers/soc/qcom/socinfo.c
+++ b/drivers/soc/qcom/socinfo.c
@@ -323,17 +323,23 @@ static void socinfo_debugfs_init(struct qcom_socinfo *qcom_socinfo,
 		debugfs_create_x32("raw_device_number", 0400,
 				   qcom_socinfo->dbg_root,
 				   &qcom_socinfo->info.raw_device_num);
+		/* Fall through */
 	case SOCINFO_VERSION(0, 11):
+		/* Fall through */
 	case SOCINFO_VERSION(0, 10):
+		/* Fall through */
 	case SOCINFO_VERSION(0, 9):
 		qcom_socinfo->info.foundry_id = __le32_to_cpu(info->foundry_id);
 
 		debugfs_create_u32("foundry_id", 0400, qcom_socinfo->dbg_root,
 				   &qcom_socinfo->info.foundry_id);
+		/* Fall through */
 	case SOCINFO_VERSION(0, 8):
+		/* Fall through */
 	case SOCINFO_VERSION(0, 7):
 		DEBUGFS_ADD(info, pmic_model);
 		DEBUGFS_ADD(info, pmic_die_rev);
+		/* Fall through */
 	case SOCINFO_VERSION(0, 6):
 		qcom_socinfo->info.hw_plat_subtype =
 			__le32_to_cpu(info->hw_plat_subtype);
@@ -341,6 +347,7 @@ static void socinfo_debugfs_init(struct qcom_socinfo *qcom_socinfo,
 		debugfs_create_u32("hardware_platform_subtype", 0400,
 				   qcom_socinfo->dbg_root,
 				   &qcom_socinfo->info.hw_plat_subtype);
+		/* Fall through */
 	case SOCINFO_VERSION(0, 5):
 		qcom_socinfo->info.accessory_chip =
 			__le32_to_cpu(info->accessory_chip);
@@ -348,23 +355,27 @@ static void socinfo_debugfs_init(struct qcom_socinfo *qcom_socinfo,
 		debugfs_create_u32("accessory_chip", 0400,
 				   qcom_socinfo->dbg_root,
 				   &qcom_socinfo->info.accessory_chip);
+		/* Fall through */
 	case SOCINFO_VERSION(0, 4):
 		qcom_socinfo->info.plat_ver = __le32_to_cpu(info->plat_ver);
 
 		debugfs_create_u32("platform_version", 0400,
 				   qcom_socinfo->dbg_root,
 				   &qcom_socinfo->info.plat_ver);
+		/* Fall through */
 	case SOCINFO_VERSION(0, 3):
 		qcom_socinfo->info.hw_plat = __le32_to_cpu(info->hw_plat);
 
 		debugfs_create_u32("hardware_platform", 0400,
 				   qcom_socinfo->dbg_root,
 				   &qcom_socinfo->info.hw_plat);
+		/* Fall through */
 	case SOCINFO_VERSION(0, 2):
 		qcom_socinfo->info.raw_ver  = __le32_to_cpu(info->raw_ver);
 
 		debugfs_create_u32("raw_version", 0400, qcom_socinfo->dbg_root,
 				   &qcom_socinfo->info.raw_ver);
+		/* Fall through */
 	case SOCINFO_VERSION(0, 1):
 		DEBUGFS_ADD(info, build_id);
 		break;
-- 
2.18.0

