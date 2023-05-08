Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 617CB6FB3EC
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 May 2023 17:35:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234371AbjEHPfb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 8 May 2023 11:35:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49832 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232716AbjEHPfa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 8 May 2023 11:35:30 -0400
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31C4591
        for <linux-arm-msm@vger.kernel.org>; Mon,  8 May 2023 08:35:27 -0700 (PDT)
Received: by mail-lj1-x229.google.com with SMTP id 38308e7fff4ca-2ac7462d9f1so52383641fa.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 May 2023 08:35:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683560125; x=1686152125;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=y+rGMM6WldBczt8RNjSEnRHxOpQkBYT/hbYgVK8fNow=;
        b=bJ8h3KMYMCP7/Uk4X9NyK8D65ogdkLENKzzcLz5QY6S0c6oiU+5uzZGt75lfTZ4osE
         Iwao1AvIqgHENfdY6hgyqGL8PhfsIECVdsOVVkjCUMOpHYrwH06zt3HdwSmI+7C+rWAW
         ZqlBuVfkBAapZubsKKVfgaWjBQzxnYr+rZcXIstuNJnFcpmZn5jc/OWVOmswWWQiRsf+
         RDe941T/hk8X17HuHiln/CUd7DLeJdsEphrVyp7xEBdUR1unDQCjAzQVZOvdv4yao3Z3
         3697pXgLPte87OdW7xUJ2FNj0l3EBUUWah4KLssJeJZm1GXYbjgWV0s5eTKulIieeFqC
         0vqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683560125; x=1686152125;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y+rGMM6WldBczt8RNjSEnRHxOpQkBYT/hbYgVK8fNow=;
        b=D/emRaBJQVUikFZGnR1QIBm+CtZgpG60e/IF0BIfRQ+mEaizpozqIMPknFVeFYJbR1
         7wZY0vm1ynrBbupFuZzGP+UELxaCCAmVXuMqE91VhiZ1P77E9QyuJzJOe+0hzWTQDAEn
         iO+fpv0qQGN2PjhnhSXAln39m6lRUmonj643wcP6JzCh8+sG4cgJL3JFE0IIeuuecp5J
         B8Pp+65cJD+Axz00mPNIVz8vgS/RebwEVvYpPn7kvcsDynb0+uKSigm7znMWDx5cdc3X
         XT4nVZnURdfYcR8t+zP1gH88JuAmu//1xHw/BCYLd+e6kZSChY4PBDBLlKL1Hz9u4Oxx
         N17A==
X-Gm-Message-State: AC+VfDz+36U/wMxe+XeZ0mexdIKPxp2bMPenM7ET7cdxqFIAmN8U6OLm
        HMH6+u3CygkKoxXkRqmkTU3tXQ==
X-Google-Smtp-Source: ACHHUZ4PS+Dueoz0V8cQJRS5V1Be4SfBRBJR1yuveA/NiY//o6/VPQtD+btdu0QrWkKnZpAIANVBzw==
X-Received: by 2002:a2e:86cb:0:b0:2a7:6f60:34f2 with SMTP id n11-20020a2e86cb000000b002a76f6034f2mr2758618ljj.33.1683560125460;
        Mon, 08 May 2023 08:35:25 -0700 (PDT)
Received: from lothlorien.lan (dzdqv0yyyyyyyyyyybm5y-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::ab2])
        by smtp.gmail.com with ESMTPSA id f4-20020a2e3804000000b002a634bfa224sm1222065lja.40.2023.05.08.08.35.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 May 2023 08:35:25 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org
Subject: [PATCH v2] remoteproc: qcom_q6v5_mss: support loading MBN file on msm8974
Date:   Mon,  8 May 2023 18:35:24 +0300
Message-Id: <20230508153524.2371795-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On MSM8974 and APQ8074 the MSS requires loading raw MBA image instead of
the ELF file. Skip the ELF headers if mba.mbn was specified as the
firmware image.

Fixes: 051fb70fd4ea ("remoteproc: qcom: Driver for the self-authenticating Hexagon v5")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---

Changes since v1:
- Replace fixed offset 0x1000 with the value obtained from ELF headers
- Implement ELF validity checks

---
 drivers/remoteproc/qcom_q6v5_mss.c | 47 +++++++++++++++++++++++++++++-
 1 file changed, 46 insertions(+), 1 deletion(-)

diff --git a/drivers/remoteproc/qcom_q6v5_mss.c b/drivers/remoteproc/qcom_q6v5_mss.c
index ab053084f7a2..b4ff900f0304 100644
--- a/drivers/remoteproc/qcom_q6v5_mss.c
+++ b/drivers/remoteproc/qcom_q6v5_mss.c
@@ -11,6 +11,7 @@
 #include <linux/delay.h>
 #include <linux/devcoredump.h>
 #include <linux/dma-mapping.h>
+#include <linux/firmware.h>
 #include <linux/interrupt.h>
 #include <linux/kernel.h>
 #include <linux/mfd/syscon.h>
@@ -29,6 +30,7 @@
 #include <linux/iopoll.h>
 #include <linux/slab.h>
 
+#include "remoteproc_elf_helpers.h"
 #include "remoteproc_internal.h"
 #include "qcom_common.h"
 #include "qcom_pil_info.h"
@@ -459,6 +461,35 @@ static void q6v5_debug_policy_load(struct q6v5 *qproc, void *mba_region)
 	release_firmware(dp_fw);
 }
 
+/* Get the offset of the segment 0 for mba.mbn */
+static int q6v5_mba_get_offset(struct rproc *rproc, const struct firmware *fw)
+{
+	const struct elf32_hdr *ehdr;
+	const void *phdr;
+	char class;
+	u64 phoffset, poffset;
+	u16 phentsize;
+	int ret;
+
+	ret = rproc_elf_sanity_check(rproc, fw);
+	if (ret < 0)
+		return ret;
+
+	ehdr = (const struct elf32_hdr *)fw->data;
+	class = ehdr->e_ident[EI_CLASS];
+	phoffset = elf_hdr_get_e_phoff(class, ehdr);
+	phentsize = elf_hdr_get_e_phentsize(class, ehdr);
+	if (phoffset + phentsize > fw->size)
+		return -EINVAL;
+
+	phdr = fw->data + elf_hdr_get_e_phoff(class, ehdr);
+	poffset = elf_phdr_get_p_offset(class, phdr);
+	if (poffset > fw->size)
+		return -EINVAL;
+
+	return poffset;
+}
+
 static int q6v5_load(struct rproc *rproc, const struct firmware *fw)
 {
 	struct q6v5 *qproc = rproc->priv;
@@ -477,7 +508,21 @@ static int q6v5_load(struct rproc *rproc, const struct firmware *fw)
 		return -EBUSY;
 	}
 
-	memcpy(mba_region, fw->data, fw->size);
+	if (qproc->version == MSS_MSM8974 &&
+	    !memcmp(fw->data, ELFMAG, SELFMAG)) {
+		int poffset;
+
+		poffset = q6v5_mba_get_offset(rproc, fw);
+		if (poffset < 0) {
+			memunmap(mba_region);
+			return poffset;
+		}
+
+		memcpy(mba_region, fw->data + poffset, fw->size - poffset);
+	} else {
+		memcpy(mba_region, fw->data, fw->size);
+	}
+
 	q6v5_debug_policy_load(qproc, mba_region);
 	memunmap(mba_region);
 
-- 
2.39.2

