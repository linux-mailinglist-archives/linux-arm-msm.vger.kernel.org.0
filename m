Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9D8156E6B3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Jul 2019 15:43:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727717AbfGSNnQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 19 Jul 2019 09:43:16 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:40855 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727603AbfGSNnQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 19 Jul 2019 09:43:16 -0400
Received: by mail-pf1-f194.google.com with SMTP id p184so14205959pfp.7;
        Fri, 19 Jul 2019 06:43:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7zeyL/sJJFWI+pA0DcCM1VcGvAIjstI/Pa4aQrhB6ZU=;
        b=Ktq0Er2QBU4tPrp4Ljes8kakeeGwLz0415Hs/leTqPQTCFeXE2rlNMI+8yYbspB7s5
         2u3++0CY+f+SkZUAHvCUgxZEPtMyl3fuLL3ZQuz3o6fnUVvfYSZ20ITrweX3WiLRFGxh
         mNomR4lLX3rVDsY4ILlXe0lce/VEpAW6CNlygiLxxo9DDVFViWZAg/1f74us4qBMp8UE
         auSgnYMS6y2lubHLPXpn2cPcU72R5M6PqVP29EThWma2hUQ3IH1UPWBe/+bZgHg/z9od
         Pc9nUoLoMrqlD2in1vZtfzaFaJ1EPDloywplzUDuU1dUYdkEGhhrt+AEkbuOa7K53w1t
         YLVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7zeyL/sJJFWI+pA0DcCM1VcGvAIjstI/Pa4aQrhB6ZU=;
        b=STMbjs4lW1GSGwGqbVnfshFLMHoj/TfHAqRh8ky710hspAq1sHXPQhnIikmevqWMDj
         HsfgnzkhbPvgjG9TaPOmNQdyGmkdYszZ5/Hz7F9FIwTaX4c19ZMoL5cc8/fuPXkulCmC
         qNlGi+jqjb4qQXDtjHDO/xt5YizIsCfv7UCol6ttGp+Q0R7/NIrUpf8MIzdX1Ox/R4M0
         qIhUoqXnHFR7EwwXOLHM0tgXQUQCGbG3kToZdiw1BtxgiFvUN6DVwWF1BWDc56p6RlB6
         2TCi732U/8WzGUXgm33d9zbfFzC5d0x1rtN7sKw4XrlrWV2YcyezGl2VtsTLwurwjmWX
         oepw==
X-Gm-Message-State: APjAAAV+5u6gmwrI9bKLvgFecY9ECHaiL7RdupbinwvcFDetsG8CXWnP
        LXRCnkFSPWgIV47lGB9FHppQ0PyTP9U=
X-Google-Smtp-Source: APXvYqwEX0ABsWtlBoqF2rtHFxJEpCgX6c09pch3iUufTDN+w2JV8x0N+dDgTtHHGeFhcXc9yF1nLg==
X-Received: by 2002:a17:90a:7148:: with SMTP id g8mr58593367pjs.51.1563543795109;
        Fri, 19 Jul 2019 06:43:15 -0700 (PDT)
Received: from localhost.localdomain ([123.213.206.190])
        by smtp.gmail.com with ESMTPSA id q69sm44845093pjb.0.2019.07.19.06.43.12
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 19 Jul 2019 06:43:14 -0700 (PDT)
From:   Minwoo Im <minwoo.im.dev@gmail.com>
To:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Minwoo Im <minwoo.im.dev@gmail.com>,
        Andy Gross <agross@kernel.org>,
        David Brown <david.brown@linaro.org>
Subject: [PATCH] firmware: qcom_scm: fix error for incompatible pointer
Date:   Fri, 19 Jul 2019 22:43:03 +0900
Message-Id: <20190719134303.7617-1-minwoo.im.dev@gmail.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The following error can happen when trying to build it:

```
drivers/firmware/qcom_scm.c: In function ‘qcom_scm_assign_mem’:
drivers/firmware/qcom_scm.c:460:47: error: passing argument 3 of ‘dma_alloc_coherent’ from incompatible pointer type [-Werror=incompatible-pointer-types]
  ptr = dma_alloc_coherent(__scm->dev, ptr_sz, &ptr_phys, GFP_KERNEL);
                                               ^
In file included from drivers/firmware/qcom_scm.c:12:0:
./include/linux/dma-mapping.h:636:21: note: expected ‘dma_addr_t * {aka long long unsigned int *}’ but argument is of type ‘phys_addr_t * {aka unsigned int *}’
 static inline void *dma_alloc_coherent(struct device *dev, size_t size,
                     ^~~~~~~~~~~~~~~~~~
```

We just can cast phys_addr_t to dma_addr_t here.

Cc: Andy Gross <agross@kernel.org>
Cc: David Brown <david.brown@linaro.org>
Signed-off-by: Minwoo Im <minwoo.im.dev@gmail.com>
---
 drivers/firmware/qcom_scm.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/firmware/qcom_scm.c b/drivers/firmware/qcom_scm.c
index 2ddc118dba1b..7f6c841fa200 100644
--- a/drivers/firmware/qcom_scm.c
+++ b/drivers/firmware/qcom_scm.c
@@ -457,7 +457,8 @@ int qcom_scm_assign_mem(phys_addr_t mem_addr, size_t mem_sz,
 	ptr_sz = ALIGN(src_sz, SZ_64) + ALIGN(mem_to_map_sz, SZ_64) +
 			ALIGN(dest_sz, SZ_64);
 
-	ptr = dma_alloc_coherent(__scm->dev, ptr_sz, &ptr_phys, GFP_KERNEL);
+	ptr = dma_alloc_coherent(__scm->dev, ptr_sz, (dma_addr_t *) &ptr_phys,
+					GFP_KERNEL);
 	if (!ptr)
 		return -ENOMEM;
 
-- 
2.17.1

