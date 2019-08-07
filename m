Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 655858426A
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Aug 2019 04:24:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728772AbfHGCYD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 6 Aug 2019 22:24:03 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:38705 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729232AbfHGCYB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 6 Aug 2019 22:24:01 -0400
Received: by mail-pf1-f195.google.com with SMTP id y15so42576429pfn.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Aug 2019 19:24:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=pkL8MY9zC5v+zrBda/zPQm0g3an3ptjtpVdI7jzPVfs=;
        b=hcewzGRW803/McXeTj5WrIwfjtIILcuMOhhJI0+XH2tVg9fxh/5KolBT0x1b5T51+R
         XQ7IzrsxAVtHeyFEBDzoK5YSDcR82uErm3bVWGbHKSg1K4zRos0VapMK+1uxdw/foioe
         8U99TG1Qn/sp68fFKtdn6NTCKGlwrmX0NtkvzSDWUbbHDKqXSrIiBsfWxTVkj/N/HyjT
         iBlOtyfqcbF00/ppnxcHXZDVoeccewmF/JIELCQ0/o5INRAL4oHH+C/PTBqw4XC3Tb6P
         RFC6O+PCswW6u79cxA/A/infPSvko1boCXwi+HBSH6bCnN9eOji0e8EqlqN67zYuqmqS
         OzHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=pkL8MY9zC5v+zrBda/zPQm0g3an3ptjtpVdI7jzPVfs=;
        b=dPUgxQswBhpyyDWtTui/wZAHa1v7+m/ejkCumy+j9TVj5VAa4goozZ8gaIeqJF2Dv0
         kvn5K0NplR7QLKK5JdqtYqwhARzVfXKI3ZIfimIRnbqIvB8Kqd76QPpIjC6zb48hjKNt
         A5eujETbFIaWQ8rPvdmJEzCajmZV13f0JqQsV0Gir6b1iUjTyp+RtefMA/JTUJiGscxS
         ZglmqLwHz+I5NqZ9anTrrX8K2nLgWjNEmI1ShLXfg2vvgOnB38l1r1qvqTbL2oVwp6u0
         HJdGVmb/vaYK/0kxnhluUm14PYMTzQ14Nq9M7DxWcoAMEbwOp723EMmM1WHACwjbhf4I
         hGkg==
X-Gm-Message-State: APjAAAVEBdhPaZ91bhrzib8Jv5O71l8GAI3kBDgp0rip1z5kSOgJnyTN
        lwaILnNspBTykO1mUa3BGxmdjBaFYYM=
X-Google-Smtp-Source: APXvYqz7rj/ZOxWgoHwJTLzC8i+4illOfJNW0JcRCpvRX9rpVQhzih41tpGt3i/vt14DeAjuz7iIjA==
X-Received: by 2002:a62:b515:: with SMTP id y21mr6996570pfe.213.1565144639931;
        Tue, 06 Aug 2019 19:23:59 -0700 (PDT)
Received: from localhost.localdomain (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id i124sm164007064pfe.61.2019.08.06.19.23.58
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 06 Aug 2019 19:23:59 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: [PATCH v2] soc: qcom: socinfo: Annotate switch cases with fall through
Date:   Tue,  6 Aug 2019 19:23:56 -0700
Message-Id: <20190807022356.8502-1-bjorn.andersson@linaro.org>
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
 drivers/soc/qcom/socinfo.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/soc/qcom/socinfo.c b/drivers/soc/qcom/socinfo.c
index 855353bed19e..a39ea5061dc5 100644
--- a/drivers/soc/qcom/socinfo.c
+++ b/drivers/soc/qcom/socinfo.c
@@ -323,6 +323,7 @@ static void socinfo_debugfs_init(struct qcom_socinfo *qcom_socinfo,
 		debugfs_create_x32("raw_device_number", 0400,
 				   qcom_socinfo->dbg_root,
 				   &qcom_socinfo->info.raw_device_num);
+		/* Fall through */
 	case SOCINFO_VERSION(0, 11):
 	case SOCINFO_VERSION(0, 10):
 	case SOCINFO_VERSION(0, 9):
@@ -330,10 +331,12 @@ static void socinfo_debugfs_init(struct qcom_socinfo *qcom_socinfo,
 
 		debugfs_create_u32("foundry_id", 0400, qcom_socinfo->dbg_root,
 				   &qcom_socinfo->info.foundry_id);
+		/* Fall through */
 	case SOCINFO_VERSION(0, 8):
 	case SOCINFO_VERSION(0, 7):
 		DEBUGFS_ADD(info, pmic_model);
 		DEBUGFS_ADD(info, pmic_die_rev);
+		/* Fall through */
 	case SOCINFO_VERSION(0, 6):
 		qcom_socinfo->info.hw_plat_subtype =
 			__le32_to_cpu(info->hw_plat_subtype);
@@ -341,6 +344,7 @@ static void socinfo_debugfs_init(struct qcom_socinfo *qcom_socinfo,
 		debugfs_create_u32("hardware_platform_subtype", 0400,
 				   qcom_socinfo->dbg_root,
 				   &qcom_socinfo->info.hw_plat_subtype);
+		/* Fall through */
 	case SOCINFO_VERSION(0, 5):
 		qcom_socinfo->info.accessory_chip =
 			__le32_to_cpu(info->accessory_chip);
@@ -348,23 +352,27 @@ static void socinfo_debugfs_init(struct qcom_socinfo *qcom_socinfo,
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

