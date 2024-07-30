Return-Path: <linux-arm-msm+bounces-27422-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B69D94158D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jul 2024 17:39:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 04754B24922
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jul 2024 15:39:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 967B71A38E7;
	Tue, 30 Jul 2024 15:39:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="CZ2bb6AI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0B8D1A2C02
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jul 2024 15:39:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722353960; cv=none; b=Io9uYQ4yLLC0qiRFPZ+6oyhNUymYL0c3Wmd2/gLUQGM1x1cuKqvH9rnj5PYu+ab8d10VCn0WBrGuW1/G8z0d2GJdswCl0uVMRqXJwWZo9jDKmuaLl2CeEuJzmVJXPalEPixDqjsETN8lk6ULJAwk249HkYf2iKYNZng3FSt+Rdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722353960; c=relaxed/simple;
	bh=Hasbc8+yF8XQzZCpg0T6G1/68A0ZFnmNAjtdywxxM6Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=im3MnnNXffR6fv+Gg1HelQIwLbTiOnznhDwE+Az20eOzR66DrfjQims9T8J2LWCi5F2wFk9gPVJQiIjBZDUUpo3SxeEwciYKMzwjIFeaK+s8W/q7U1NVK28P+NM/z90JhtztN/uSsyxyEu4fottazSWsmmQAUhJwboueW92f814=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=CZ2bb6AI; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-428163f7635so27102555e9.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jul 2024 08:39:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1722353957; x=1722958757; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ad1kfhfFSaX8fO3RoYoAsmuxUZ2UUq0/AhSVhOZuz8c=;
        b=CZ2bb6AIM91YHtVb2DxZ4FBdrrVzpwf3Ed0ERgjikxnmI7uJGJqdJYlnMLxIndTc33
         C2MjtVDhP00lv7iA5hvI4m5/tV+tQWrJz157pcuV1E0SWcKNXNPmpalQUsmCIl0AvAAE
         zyEI8rA1E/z9RzI1QpSiPEV0S8e9pqv9bPk9NiZEvG3OgCYRaLIceXpO0sLgAhitNwqY
         e0jwXvUaCrrRPdA8W1KtyncBWEJeaLqpGI0ZNFWw4yheuyXdWhfQM4F2dw1WGtpBvRVR
         8dl0Qja+FkaNHolM3pePdtRGzwUv9585xEI6EIffrTZ4++gYMr8ar9GFAvcuLiCq6Z1z
         Os5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722353957; x=1722958757;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ad1kfhfFSaX8fO3RoYoAsmuxUZ2UUq0/AhSVhOZuz8c=;
        b=iyUOxeYzoHcA/qFAU72jtyoqFYtqyYBz/rEOHLevIznK6aUiAaDwKHS7g+XkBudEWT
         0SbHE/yu2ZuFHBsbB4OZuFpAWsxUcCeYao79mv24WTHx8hK9ggVvfM5ZpRIDl9SorYbe
         wFmQGMHWhSczQZZcOvql0i3+585xLSJ4Q9z/CmR7FUwsWA6XEoi6ttSHl8QJuxupPL2l
         j+qGnYp8m3Eqydz2h7rgPoMsmd4j9MpBx+IbzT06ZpjI+Iz7aUtNcyltRycyOECWg9PC
         0DQXD+qFOtFy4bOfSc7Fur/E8UNcf//flmGqfCepP5aZBPTpSDuuWbpFIxhqGgIl29sr
         VbPg==
X-Gm-Message-State: AOJu0Ywf0+1dFqFst2O+QXYkHSsKV6KUpcKWNpQKcIOs8Vg/DW9g8JNT
	c1XeusA9xQbT6qECBRnNk+ja+MvDOvJ5JpZLofoR9BYdNMwelw1bRNqsDKpjwHU=
X-Google-Smtp-Source: AGHT+IFHMzvE4wNNHD+ABsoLe2j53q7LI5FC96drUsTaD7yAZ87Q29mLeQKU2o5LRafJwSAmidepig==
X-Received: by 2002:a5d:62c4:0:b0:368:7f58:6550 with SMTP id ffacd0b85a97d-36b5ceef410mr6871071f8f.15.1722353956920;
        Tue, 30 Jul 2024 08:39:16 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:ccf2:71b3:8f46:e8cb])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36b36857d5asm14952522f8f.84.2024.07.30.08.39.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jul 2024 08:39:15 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 30 Jul 2024 17:38:48 +0200
Subject: [PATCH 1/2] firmware: qcom: tzmem: fix virtual-to-physical address
 conversion
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240730-tzmem-efivars-fix-v1-1-bb78884810b5@linaro.org>
References: <20240730-tzmem-efivars-fix-v1-0-bb78884810b5@linaro.org>
In-Reply-To: <20240730-tzmem-efivars-fix-v1-0-bb78884810b5@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Elliot Berman <quic_eberman@quicinc.com>, 
 Andrew Halaney <ahalaney@redhat.com>, 
 Amirreza Zarrabi <quic_azarrabi@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
 Johan Hovold <johan+linaro@kernel.org>, 
 Maximilian Luz <luzmaximilian@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2261;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=7z0fTcRaxEyPpnyXTNsiK08KdsTsi3lFr/knj5N0iIQ=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBmqQkiqb+qsYi+VVmkoa9a5mo6d0DLOXCvDQxQu
 Ww7A47yafqJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZqkJIgAKCRARpy6gFHHX
 cjrgD/wJGtzkDNDaZouCA4E6+Zyk5dMf9Q/w8I471u0CEZsPPFywU4Z2ALV+AGCy6IK15b+Zdhr
 LXhhsI/FVqTtqbOwXN6Zc8ErzVEc+ikcsvHQz0HwYYOhCB0DeOBcymoyHMfq2+6JvYpHRAK+5fX
 n5B9n9mRII89qVlO211qpdSBmIQjMr2Ly9Ua8NK64zv3i7ObBwvCy9F9jebYfyJAOJBNidMsup2
 jKtxSWX2kxz15+N4NRB5rWFxaAtYDuwnZ1LoRQe2Hw6j/Qup2Y7j2YR65zLYan6ADhSx5I20XjN
 UEc39i8IDIDi1aNAn/HG4IVhV1AG551W9Iuyf23oPzSTLA/sbptoh5dKswbk5jzQ1JX92tdjKh6
 RGW4vYE6MzTzS4mz85UqTk3PHtNl110ZDH58EIMGvHHtEiQx3Uk8+OfCSm00lcfNlJCUDZG+O/1
 A8GaU2Ugr7uY1ZDsQoA84ikkYGmH2J9kHRJgoCsGfkDjnypWrMfCJGhF2UcQOwfK9RsnA9Jjd+/
 Fdf6Ix8RD1SmchmfN7sxxS39Ec6b3kTT52j/y4MPo1Usjnjd7pCSrOWpxcsRn1ofXopsRjYtr4o
 qKUzyRlU1MRfNYAIpUvR4H7j42I3XN/dsI0mrMaiAqmiyAJrT5n3OvmL64DIlDzECTtYyJq8nh0
 C2ntgiWnXRkDvBg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

We currently only correctly convert the virtual address passed by the
caller to qcom_tzmem_to_phys() if it corresponds to the base address of
the chunk. If the user wants to convert some pointer at an offset
relative to that base address, we'll return 0. Let's change the
implementation of qcom_tzmem_to_phys(): iterate over the chunks and try
to call gen_pool_virt_to_phys() just-in-time instead of trying to call
it only once when creating the chunk.

Fixes: 84f5a7b67b61 ("firmware: qcom: add a dedicated TrustZone buffer allocator")
Reported-by: Johan Hovold <johan+linaro@kernel.org>
Closes: https://lore.kernel.org/lkml/20240729095542.21097-1-johan+linaro@kernel.org/
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/firmware/qcom/qcom_tzmem.c | 21 +++++++++++++++------
 1 file changed, 15 insertions(+), 6 deletions(-)

diff --git a/drivers/firmware/qcom/qcom_tzmem.c b/drivers/firmware/qcom/qcom_tzmem.c
index 17948cfc82e7..1294233a4785 100644
--- a/drivers/firmware/qcom/qcom_tzmem.c
+++ b/drivers/firmware/qcom/qcom_tzmem.c
@@ -40,7 +40,6 @@ struct qcom_tzmem_pool {
 };
 
 struct qcom_tzmem_chunk {
-	phys_addr_t paddr;
 	size_t size;
 	struct qcom_tzmem_pool *owner;
 };
@@ -385,7 +384,6 @@ void *qcom_tzmem_alloc(struct qcom_tzmem_pool *pool, size_t size, gfp_t gfp)
 		return NULL;
 	}
 
-	chunk->paddr = gen_pool_virt_to_phys(pool->genpool, vaddr);
 	chunk->size = size;
 	chunk->owner = pool;
 
@@ -442,14 +440,25 @@ EXPORT_SYMBOL_GPL(qcom_tzmem_free);
 phys_addr_t qcom_tzmem_to_phys(void *vaddr)
 {
 	struct qcom_tzmem_chunk *chunk;
+	struct radix_tree_iter iter;
+	void __rcu **slot;
+	phys_addr_t ret;
 
 	guard(spinlock_irqsave)(&qcom_tzmem_chunks_lock);
 
-	chunk = radix_tree_lookup(&qcom_tzmem_chunks, (unsigned long)vaddr);
-	if (!chunk)
-		return 0;
+	radix_tree_for_each_slot(slot, &qcom_tzmem_chunks, &iter, 0) {
+		chunk = radix_tree_deref_slot_protected(slot,
+						&qcom_tzmem_chunks_lock);
 
-	return chunk->paddr;
+		ret = gen_pool_virt_to_phys(chunk->owner->genpool,
+					    (unsigned long)vaddr);
+		if (ret == -1)
+			continue;
+
+		return ret;
+	}
+
+	return 0;
 }
 EXPORT_SYMBOL_GPL(qcom_tzmem_to_phys);
 

-- 
2.43.0


