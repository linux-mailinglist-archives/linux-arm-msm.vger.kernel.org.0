Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2442821F60
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 May 2019 23:09:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728384AbfEQVJg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 17 May 2019 17:09:36 -0400
Received: from mail-pl1-f194.google.com ([209.85.214.194]:43142 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729519AbfEQVJ1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 17 May 2019 17:09:27 -0400
Received: by mail-pl1-f194.google.com with SMTP id n8so3857790plp.10
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 May 2019 14:09:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xUs4KzX7CWJigxzrg3FXk071ARVu1l5gjrllphQPJ70=;
        b=fUH9ofFCLhOWE/+eplpGUDYFizPvxtNGBQtesTIFeafxTA1h0zSx7BAy8TXlukUFHA
         MCXO2sPQqoMoeL8/MmjyYMBlbCmfcZHqY1+LTUw+wPHwcaGe4uAgqQfx7qAekVSvrkQF
         dxv8g5AIVuNyhffCnDdhL+ZzQoRhkJLW5NpfQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xUs4KzX7CWJigxzrg3FXk071ARVu1l5gjrllphQPJ70=;
        b=LeHMuaXB+BxVq+hndFMKJc7Jyxt4x9fYXJeIy79vIeXrkUBqktMjAWGenbfon460Gu
         zb+j2RLRt1NdiPhb4heSg4yFQNj6jHdbu5dTqF1FVbQ8NraD4357WUfWGR6BCOjtt9gT
         lcgzWcK1HX/689pbt6c3Ps9pfPYqquUpdANvjA067nKaXUSkjUL97U9XeRvIy/oKYBCi
         yBksYRV+5hhT3TmiNGaHDV+1wPIIqpq/KSyliIWnfaHCVWrqlzfKw8hTI5IkZHmlzUSr
         NPu2AGvdfgmetYXlcSFHsLkqZPsesNrjS4Rw15mFDSAcRs0rxXu8rzQ9wx7u7gpgma0/
         ibHQ==
X-Gm-Message-State: APjAAAWXAHAqoNK+JeeONbCiz9FepfQAKgt1mjytGlXqs4SgT9jWbShM
        7v3tHzYj173bwuSodzGvFfgz9A==
X-Google-Smtp-Source: APXvYqwg+KNuNv6iQvKM/0JEY8vuqonvkPls25uezBNYAandLnYwUenBqTUhBs/2LWnxSZ9b+q1v4A==
X-Received: by 2002:a17:902:442:: with SMTP id 60mr20543597ple.325.1558127366677;
        Fri, 17 May 2019 14:09:26 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id q142sm7890448pfc.27.2019.05.17.14.09.25
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 17 May 2019 14:09:26 -0700 (PDT)
From:   Stephen Boyd <swboyd@chromium.org>
To:     Andy Gross <agross@kernel.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Ian Jackson <ian.jackson@citrix.com>,
        Julien Grall <julien.grall@arm.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Avaneesh Kumar Dwivedi <akdwived@codeaurora.org>
Subject: [PATCH 2/3] firmware: qcom_scm: Cleanup code in qcom_scm_assign_mem()
Date:   Fri, 17 May 2019 14:09:22 -0700
Message-Id: <20190517210923.202131-3-swboyd@chromium.org>
X-Mailer: git-send-email 2.21.0.1020.gf2820cf01a-goog
In-Reply-To: <23774.56553.445601.436491@mariner.uk.xensource.com>
References: <23774.56553.445601.436491@mariner.uk.xensource.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

There are some questionable coding styles in this function. It looks
quite odd to deref a pointer with array indexing that only uses the
first element. Also, destroying an input/output variable halfway through
the function and then overwriting it on success is not clear. It's
better to use a local variable and the kernel macros to step through
each bit set in a bitmask and clearly show where outputs are set.

Cc: Ian Jackson <ian.jackson@citrix.com>
Cc: Julien Grall <julien.grall@arm.com>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Avaneesh Kumar Dwivedi <akdwived@codeaurora.org>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/firmware/qcom_scm.c | 34 ++++++++++++++++------------------
 include/linux/qcom_scm.h    |  9 +++++----
 2 files changed, 21 insertions(+), 22 deletions(-)

diff --git a/drivers/firmware/qcom_scm.c b/drivers/firmware/qcom_scm.c
index 0c63495cf269..153f13f72bac 100644
--- a/drivers/firmware/qcom_scm.c
+++ b/drivers/firmware/qcom_scm.c
@@ -443,7 +443,8 @@ EXPORT_SYMBOL(qcom_scm_set_remote_state);
  */
 int qcom_scm_assign_mem(phys_addr_t mem_addr, size_t mem_sz,
 			unsigned int *srcvm,
-			struct qcom_scm_vmperm *newvm, int dest_cnt)
+			const struct qcom_scm_vmperm *newvm,
+			unsigned int dest_cnt)
 {
 	struct qcom_scm_current_perm_info *destvm;
 	struct qcom_scm_mem_map_info *mem_to_map;
@@ -458,11 +459,10 @@ int qcom_scm_assign_mem(phys_addr_t mem_addr, size_t mem_sz,
 	int next_vm;
 	__le32 *src;
 	void *ptr;
-	int ret;
-	int len;
-	int i;
+	int ret, i, b;
+	unsigned long srcvm_bits = *srcvm;
 
-	src_sz = hweight_long(*srcvm) * sizeof(*src);
+	src_sz = hweight_long(srcvm_bits) * sizeof(*src);
 	mem_to_map_sz = sizeof(*mem_to_map);
 	dest_sz = dest_cnt * sizeof(*destvm);
 	ptr_sz = ALIGN(src_sz, SZ_64) + ALIGN(mem_to_map_sz, SZ_64) +
@@ -475,28 +475,26 @@ int qcom_scm_assign_mem(phys_addr_t mem_addr, size_t mem_sz,
 
 	/* Fill source vmid detail */
 	src = ptr;
-	len = hweight_long(*srcvm);
-	for (i = 0; i < len; i++) {
-		src[i] = cpu_to_le32(ffs(*srcvm) - 1);
-		*srcvm ^= 1 << (ffs(*srcvm) - 1);
-	}
+	i = 0;
+	for_each_set_bit(b, &srcvm_bits, sizeof(srcvm_bits))
+		src[i++] = cpu_to_le32(b);
 
 	/* Fill details of mem buff to map */
 	mem_to_map = ptr + ALIGN(src_sz, SZ_64);
 	mem_to_map_phys = ptr_phys + ALIGN(src_sz, SZ_64);
-	mem_to_map[0].mem_addr = cpu_to_le64(mem_addr);
-	mem_to_map[0].mem_size = cpu_to_le64(mem_sz);
+	mem_to_map->mem_addr = cpu_to_le64(mem_addr);
+	mem_to_map->mem_size = cpu_to_le64(mem_sz);
 
 	next_vm = 0;
 	/* Fill details of next vmid detail */
 	destvm = ptr + ALIGN(mem_to_map_sz, SZ_64) + ALIGN(src_sz, SZ_64);
 	dest_phys = ptr_phys + ALIGN(mem_to_map_sz, SZ_64) + ALIGN(src_sz, SZ_64);
-	for (i = 0; i < dest_cnt; i++) {
-		destvm[i].vmid = cpu_to_le32(newvm[i].vmid);
-		destvm[i].perm = cpu_to_le32(newvm[i].perm);
-		destvm[i].ctx = 0;
-		destvm[i].ctx_size = 0;
-		next_vm |= BIT(newvm[i].vmid);
+	for (i = 0; i < dest_cnt; i++, destvm++, newvm++) {
+		destvm->vmid = cpu_to_le32(newvm->vmid);
+		destvm->perm = cpu_to_le32(newvm->perm);
+		destvm->ctx = 0;
+		destvm->ctx_size = 0;
+		next_vm |= BIT(newvm->vmid);
 	}
 
 	ret = __qcom_scm_assign_mem(__scm->dev, mem_to_map_phys, mem_to_map_sz,
diff --git a/include/linux/qcom_scm.h b/include/linux/qcom_scm.h
index d0aecc04c54b..1d406403c843 100644
--- a/include/linux/qcom_scm.h
+++ b/include/linux/qcom_scm.h
@@ -57,8 +57,9 @@ extern int qcom_scm_pas_mem_setup(u32 peripheral, phys_addr_t addr,
 extern int qcom_scm_pas_auth_and_reset(u32 peripheral);
 extern int qcom_scm_pas_shutdown(u32 peripheral);
 extern int qcom_scm_assign_mem(phys_addr_t mem_addr, size_t mem_sz,
-			       unsigned int *src, struct qcom_scm_vmperm *newvm,
-			       int dest_cnt);
+			       unsigned int *src,
+			       const struct qcom_scm_vmperm *newvm,
+			       unsigned int dest_cnt);
 extern void qcom_scm_cpu_power_down(u32 flags);
 extern u32 qcom_scm_get_version(void);
 extern int qcom_scm_set_remote_state(u32 state, u32 id);
@@ -95,8 +96,8 @@ qcom_scm_pas_auth_and_reset(u32 peripheral) { return -ENODEV; }
 static inline int qcom_scm_pas_shutdown(u32 peripheral) { return -ENODEV; }
 static inline int qcom_scm_assign_mem(phys_addr_t mem_addr, size_t mem_sz,
 				      unsigned int *src,
-				      struct qcom_scm_vmperm *newvm,
-				      int dest_cnt) { return -ENODEV; }
+				      const struct qcom_scm_vmperm *newvm,
+				      unsigned int dest_cnt) { return -ENODEV; }
 static inline void qcom_scm_cpu_power_down(u32 flags) {}
 static inline u32 qcom_scm_get_version(void) { return 0; }
 static inline u32
-- 
Sent by a computer through tubes

