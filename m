Return-Path: <linux-arm-msm+bounces-73364-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E1079B552E3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Sep 2025 17:14:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5D891AC39E1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Sep 2025 15:14:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B539C326D54;
	Fri, 12 Sep 2025 15:10:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dj9E4H+n"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yx1-f51.google.com (mail-yx1-f51.google.com [74.125.224.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DC04322DC5
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Sep 2025 15:10:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757689856; cv=none; b=a92QpVexjNltiOSXs2AWTYuKRHtcN0JpGLm+xzfa63hZV8X2Qsg/7EbfSEAbMoKXaAJBtKCBEM6Ue8pjMmgSK7UBHyZiWaYf8+9yD3m1bk7yAeDdqwtwXi/1TO2sTVYfcH6lP/GPT87IMPxMloJKluQooRMt1+r5vzDUFxpkILM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757689856; c=relaxed/simple;
	bh=mqm9C4r9CGB+Ni8ye2QxHYk0tRre6qbdyx5buxGNNkE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sLosvbpzI0wJKewo5GaiRID9Nxib+eVaraUlg9r+7CN2iaZxvWnsEpJBnP5NXgNxhftLci1l4LnOrsc1b7hDIUNLIkg61FD/eWtIxVw2kh2l7CyFGhWBp1LeCA8mWHuMUYSRhlmp34eSjwrOeBidOq0iEFEicMs8QceHTN0aTXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dj9E4H+n; arc=none smtp.client-ip=74.125.224.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yx1-f51.google.com with SMTP id 956f58d0204a3-6296f6ce5f1so404418d50.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 Sep 2025 08:10:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757689853; x=1758294653; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zRFg2hFdscTgaOHG8cpymzmUrui3DhwhCxVktuuhhLc=;
        b=dj9E4H+no8XAqg107yE5TNeSG+7gi0ZtZiDlPOcflDzIR1+cD5ThGatjldRUsxTtat
         qsTWvqAmnIlhuZw9RPmraQ/Cx7iBIxhdmSzYgJDAK5QVJahT98MGfzNykqnXeV/b31+9
         h++zS/gU6SKeXjg5brrSfGSsvl1PaX+WJOrgrn8EacU2DucpbwozB5FHqgr0oZaRg3YK
         AocMhhxbwq8kDTnqLAe9jjRnLeQOqyfCF78yohY6/ZFBNMsiuzkhc9T96c+JCUdo7AOy
         VeAReLqohOjy1pW/qm2jDi36GgHfKnCwMgknOhCynzopGAPvqRB2ptx64+g1t3TdET1E
         mwZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757689853; x=1758294653;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zRFg2hFdscTgaOHG8cpymzmUrui3DhwhCxVktuuhhLc=;
        b=xNMvjaMRP5fQxOsh8IisXDO2peG/TSQpkWS2gJVMW2fbTKbX1TdFvyrFcDkiK/FapG
         +3HN+BP5ujJy3rOqy7uI4SS4jTdwjazxCuhIUxn3w4RFmqKg96jUoZKykks9QJFDpzLU
         ZnRb3HaO/BkbyH+yEORP2VqDcL2geoFtn9pj9rRUHKKfaV2bd4J71/glZofP6byeCjeT
         T37B8uAgCXUzncWEsce23LrpC9MzJhA1fNq2Q4TwyCvZsQ74JW9mWAxqsPMJiFwb5x5f
         dCmQrQzw74ZUbOHUniRQmVUzUyfzGimXO4P4kw9DqAujynKakzz5e4N+y9pnIELbPmvi
         JkzA==
X-Gm-Message-State: AOJu0YxQN/idCF5+eJqSyCOPzkL8v8VxDk3Q4kkbs0kEK1+Qy/OHYwEK
	ot1JHPgT6GJaUkfLVQ/3hoFWUbMJBruRIeRiGEzou1Qo4e692SKBjSprAtEdbHapgz5ytBufdho
	1QTPg+F5vWA==
X-Gm-Gg: ASbGncutpAP3ZdAhVFovrDajb3xaXpP7HmtJ+U4gwYB7gkyiKvwGeVQSLHEUweQmQdd
	OPnSEqTaQHCrqAvbu7gu5zwmUaFU63ghX4VrvMNTJN1Uf+4wGgVWbcHpDqamFTNvDCVg6iK3kIH
	y6p44KK9VOr103jiebEdjHuO9Eg3LtRceCG9TSFASAKM68CwtGpC/S7rc7AFDtx5EYh/tIHD3PF
	I8ZyJZnKdW+pKhnEBsmKHnzHxQVOlw0BGzJ3VYGBJnm2YiNMT+4B2grUAK0UOHmkFYfkO7aj67E
	Skv/w8ct0UYGAo9YjXI4fEYF+iH6GtmOm/ie04K4SBzWpA/Sgs5UGA2MOxe1DcUC9IjjNx+NF+Q
	DcFUZUwz5FEVNsaVpLOsMlPh0hR+XUSkFZQ==
X-Google-Smtp-Source: AGHT+IGA3TFT+vemEd/ubQxEEhLwHcx7hg7Tn+5tAGBp/Y4gBcPvEFcB1itw15g/ByzT4/+eDheVvA==
X-Received: by 2002:a53:84c7:0:b0:626:d26c:cca3 with SMTP id 956f58d0204a3-62714ee78ffmr2387133d50.0.1757689852988;
        Fri, 12 Sep 2025 08:10:52 -0700 (PDT)
Received: from eugen-station.. ([145.224.119.89])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-624841586c1sm1302244d50.6.2025.09.12.08.10.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Sep 2025 08:10:52 -0700 (PDT)
From: Eugen Hristev <eugen.hristev@linaro.org>
To: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	tglx@linutronix.de,
	andersson@kernel.org,
	pmladek@suse.com,
	rdunlap@infradead.org,
	corbet@lwn.net,
	david@redhat.com,
	mhocko@suse.com
Cc: tudor.ambarus@linaro.org,
	mukesh.ojha@oss.qualcomm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-hardening@vger.kernel.org,
	jonechou@google.com,
	rostedt@goodmis.org,
	linux-doc@vger.kernel.org,
	devicetree@vger.kernel.org,
	Eugen Hristev <eugen.hristev@linaro.org>
Subject: [RFC][PATCH v3 12/16] printk: Register information into Kmemdump
Date: Fri, 12 Sep 2025 18:08:51 +0300
Message-ID: <20250912150855.2901211-13-eugen.hristev@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250912150855.2901211-1-eugen.hristev@linaro.org>
References: <20250912150855.2901211-1-eugen.hristev@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Kmemdump requires the prb, data, descriptors and info.
Add it inside the log_buf_vmcoreinfo_setup()

In the case when the log buffer is dynamically replaced by a runtime
allocated version, call kmemdump to register the data but call unregister
to remove the old registered data first.

Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
---
 kernel/printk/printk.c | 47 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
index 5aee9ffb16b9..f75489fd82df 100644
--- a/kernel/printk/printk.c
+++ b/kernel/printk/printk.c
@@ -49,6 +49,7 @@
 #include <linux/sched/debug.h>
 #include <linux/sched/task_stack.h>
 #include <linux/panic.h>
+#include <linux/kmemdump.h>
 
 #include <linux/uaccess.h>
 #include <asm/sections.h>
@@ -964,6 +965,43 @@ const struct file_operations kmsg_fops = {
 };
 
 #ifdef CONFIG_VMCORE_INFO
+static void log_buf_vmcoreinfo_kmemdump_update(void *data, size_t data_size,
+					       void *descs, size_t descs_size,
+					       void *infos, size_t infos_size)
+{
+	kmemdump_unregister(KMEMDUMP_ID_COREIMAGE_prb_data);
+	kmemdump_register_id(KMEMDUMP_ID_COREIMAGE_prb_data,
+			     (void *)data, data_size);
+
+	kmemdump_unregister(KMEMDUMP_ID_COREIMAGE_prb_descs);
+	kmemdump_register_id(KMEMDUMP_ID_COREIMAGE_prb_descs,
+			     (void *)descs, descs_size);
+
+	kmemdump_unregister(KMEMDUMP_ID_COREIMAGE_prb_infos);
+	kmemdump_register_id(KMEMDUMP_ID_COREIMAGE_prb_infos,
+			     (void *)infos, infos_size);
+}
+
+static void log_buf_vmcoreinfo_kmemdump(void)
+{
+	kmemdump_register_id(KMEMDUMP_ID_COREIMAGE_prb,
+			     (void *)&prb, sizeof(prb));
+	kmemdump_register_id(KMEMDUMP_ID_COREIMAGE_prb_descs,
+			     (void *)&_printk_rb_static_descs,
+			     sizeof(_printk_rb_static_descs));
+	kmemdump_register_id(KMEMDUMP_ID_COREIMAGE_prb_infos,
+			     (void *)&_printk_rb_static_infos,
+			     sizeof(_printk_rb_static_infos));
+	kmemdump_register_id(KMEMDUMP_ID_COREIMAGE_prb_data,
+			     (void *)&__log_buf, __LOG_BUF_LEN);
+	kmemdump_register_id(KMEMDUMP_ID_COREIMAGE_printk_rb_static,
+			     (void *)&printk_rb_static,
+			     sizeof(printk_rb_static));
+	kmemdump_register_id(KMEMDUMP_ID_COREIMAGE_printk_rb_dynamic,
+			     (void *)&printk_rb_dynamic,
+			     sizeof(printk_rb_dynamic));
+}
+
 /*
  * This appends the listed symbols to /proc/vmcore
  *
@@ -1029,6 +1067,8 @@ void log_buf_vmcoreinfo_setup(void)
 
 	VMCOREINFO_STRUCT_SIZE(latched_seq);
 	VMCOREINFO_OFFSET(latched_seq, val);
+
+	log_buf_vmcoreinfo_kmemdump();
 }
 #endif
 
@@ -1214,6 +1254,11 @@ void __init setup_log_buf(int early)
 		 new_descs, ilog2(new_descs_count),
 		 new_infos);
 
+#ifdef CONFIG_VMCORE_INFO
+	log_buf_vmcoreinfo_kmemdump_update(new_log_buf, new_log_buf_len,
+					   new_descs, new_descs_size,
+					   new_infos, new_infos_size);
+#endif
 	local_irq_save(flags);
 
 	log_buf_len = new_log_buf_len;
@@ -1257,8 +1302,10 @@ void __init setup_log_buf(int early)
 	return;
 
 err_free_descs:
+	kmemdump_unregister(KMEMDUMP_ID_COREIMAGE_prb_descs);
 	memblock_free(new_descs, new_descs_size);
 err_free_log_buf:
+	kmemdump_unregister(KMEMDUMP_ID_COREIMAGE_prb_data);
 	memblock_free(new_log_buf, new_log_buf_len);
 out:
 	print_log_buf_usage_stats();
-- 
2.43.0


