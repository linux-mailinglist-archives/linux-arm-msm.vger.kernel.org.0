Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8C20232B2D5
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Mar 2021 04:49:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242291AbhCCBPw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 2 Mar 2021 20:15:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53016 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1446284AbhCBN25 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 2 Mar 2021 08:28:57 -0500
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0428C061A27
        for <linux-arm-msm@vger.kernel.org>; Tue,  2 Mar 2021 05:28:16 -0800 (PST)
Received: by mail-pj1-x1033.google.com with SMTP id o6so1979203pjf.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Mar 2021 05:28:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=m7oz8g4qBib/YKo3cyWxkyrFd1RmlxMZFfZ1/Uas0RU=;
        b=yACFu5QX1bnGgYUH4FBE0uTtamgfft1DFQ7l1w0A4JJ5ZhVafDNQDrhomC7sqsSj5z
         78TbMpBE0sRpryLTnlzIrpvCQL108o8rYSbzd/zIWut1l+Krqq/RrAcRNQXNHYnjrE/U
         MV/zx9mafCzEnTr1i7V/vHFywoRVk68kT+pZoruldys620xohe+eHVI4HVUsx1NItCKW
         fUU5TP684i75vAao3HY2VoG+ebEcmQWIjftRiOMSrMgf3XpTk3/43Z9ss4z6mD40kydk
         9Uva377Dgkz0nh9JURq8fP5xo19ETK3TFXFxReul0wyTdRd8xNl2n/LhNDweZG2z8AHj
         5bwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=m7oz8g4qBib/YKo3cyWxkyrFd1RmlxMZFfZ1/Uas0RU=;
        b=r8DYC3e37ti8nqQ+axEa5RHVdr3/sCG5Ce0IGJ8j2eArdT+0faNuvYN1/bNk1UKQh6
         BZFg9MY+1QMTdXExnylvaptOv374arvLHX4EELn6T0pCYb+KIr7qdgbCL3VJZQo2stAb
         N16bm80JG4uSrehFrIHr0ounF4BaKPgVinjXdxo1RvJ4XH450s+PdsjtBCMczjxzFMdW
         7pmC6fQmD1BeVO/gRNx4DAzTAxvQybKn0DwTwri6NJggI7xc33sTlu1p8vLC/KCkVyQD
         jaKXifES8EzxSvbkl2ZWLqf6/LdXiQeGdAUE4kmTturyz/yaOy+0IiUYI5j6Z/zglIy1
         mKNw==
X-Gm-Message-State: AOAM532uo/QSwm5MfY6Nac34PjzZbAX+hDcbR4wK2qZ8EqsDLg0bMCEf
        M3EGEU48WtCllrdkOpbGdZ1n
X-Google-Smtp-Source: ABdhPJxsZ1SDOQ37H4yNVcYg4KGLYNp4XCJ/VhPwDSwRAJMYPm0N8sKUxQ/KrP+t6cdjsSQoNed4Jw==
X-Received: by 2002:a17:90a:a794:: with SMTP id f20mr4264897pjq.185.1614691696400;
        Tue, 02 Mar 2021 05:28:16 -0800 (PST)
Received: from localhost.localdomain ([103.66.79.74])
        by smtp.gmail.com with ESMTPSA id w1sm13027454pgs.15.2021.03.02.05.28.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Mar 2021 05:28:15 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com
Cc:     linux-arm-msm@vger.kernel.org, linux-mtd@lists.infradead.org,
        linux-kernel@vger.kernel.org, boris.brezillon@collabora.com,
        Daniele.Palmas@telit.com, bjorn.andersson@linaro.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 1/2] mtd: Handle possible -EPROBE_DEFER from parse_mtd_partitions()
Date:   Tue,  2 Mar 2021 18:57:56 +0530
Message-Id: <20210302132757.225395-2-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210302132757.225395-1-manivannan.sadhasivam@linaro.org>
References: <20210302132757.225395-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

There are chances that the parse_mtd_partitions() function will return
-EPROBE_DEFER in mtd_device_parse_register(). This might happen when
the dependency is not available for the parser. For instance, on SDX55
the MTD_QCOMSMEM_PARTS parser depends on the QCOM_SMEM driver to parse
the partitions defined in the shared memory region. With the current
flow, the error returned from parse_mtd_partitions() will be discarded
in favor of trying to add the fallback partition.

This will prevent the driver to end up in probe deferred pool and the
partitions won't be parsed even after the QCOM_SMEM driver is available.

Fix this issue by bailing out of mtd_device_parse_register() when
-EPROBE_DEFER error is returned from parse_mtd_partitions() function and
propagate the error code to the driver core for probing later.

Fixes: 5ac67ce36cfe ("mtd: move code adding (registering) partitions to the parse_mtd_partitions()")
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/mtd/mtdcore.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index 2d6423d89a17..d97ddc65b5d4 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -820,6 +820,9 @@ int mtd_device_parse_register(struct mtd_info *mtd, const char * const *types,
 
 	/* Prefer parsed partitions over driver-provided fallback */
 	ret = parse_mtd_partitions(mtd, types, parser_data);
+	if (ret == -EPROBE_DEFER)
+		goto out;
+
 	if (ret > 0)
 		ret = 0;
 	else if (nr_parts)
-- 
2.25.1

