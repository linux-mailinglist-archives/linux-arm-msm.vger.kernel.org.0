Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 063D12A49C3
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Nov 2020 16:31:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728438AbgKCPah (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 3 Nov 2020 10:30:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728550AbgKCP3d (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 3 Nov 2020 10:29:33 -0500
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98A34C061A04
        for <linux-arm-msm@vger.kernel.org>; Tue,  3 Nov 2020 07:29:32 -0800 (PST)
Received: by mail-wr1-x442.google.com with SMTP id g12so18980095wrp.10
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Nov 2020 07:29:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=BTdnnrRVuCbgQS2De8FJKm0elKhLf/t/tAH+rByd77A=;
        b=LVNw/niQDAW9U7ijNZkhMS5ThcE3Jvp1uQvhf0orWmEtKn2CTN9GW0y+S2nuI3TkUP
         9YzM8gG6PxBhLWezVef2ftvQMHKTXdvz5YynRQPSOskmRGlTGP50XRRVVp0SnM1P86lJ
         lRTwtO+SFwmzD9DWFSLR1S4zQjSqQCBPBsLFAYXOCxV+wBg3Tt6qTCSgA3NSjApHInUk
         7lgDysC3A4RQpdlLpRKt35LNUbNxLkMnGb72huwi8QO1/6nexal6XGW2GJ96Ffn/t97a
         E/863EOxVDf06cKGDxLtq0iB6Uu5H4AUBlunSAf6eXkcwnIWcfqHdvS8oL2QTOXQxvOE
         NvMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BTdnnrRVuCbgQS2De8FJKm0elKhLf/t/tAH+rByd77A=;
        b=Izm37BJhHlcUzharolVce4kieS4DxuYqFzSlMLKxJCgj6yUyi9MqP7C8x7crJrGwr3
         LdasPAjR67bWcmw00zBR54SLpfkLCy/Myv8/jtogcvAbniYLU2aPmHBZndnQRAVyJTl6
         08ym1MjuxWJnK7tbC8FUnhAjqliRKWhXw4ADYV2aWuH2XQraEE+UpOvHEbMJQMTzSTxz
         fQRrQ4dp3uDMGy9Hm/xJediQY9FIhTA0jqHp7++Tc1KGFqWeaNG3D9xDNaTcPCI5AiwB
         YIBGX9DF1rAP9qIcR4+1UDGa2BlubB0YjYG19Ja9H3g+BAR1zjnrv2NLvsfkCMp3Dbz2
         i7/w==
X-Gm-Message-State: AOAM531TqI/oJIrDbr8YPo5mjih/uGzIfujJCeR3yBt7bX7UP7Gj48GZ
        9h071Ww1wlwr4MGe/xpwGp8srg==
X-Google-Smtp-Source: ABdhPJxSK592GbXUg76+lrIYFwt6ZRAQ5oj1sTAb7oGVb8E0cWpfd3EnUqKOOq2siJj50icyAKN3Ww==
X-Received: by 2002:adf:f10e:: with SMTP id r14mr25710602wro.337.1604417371320;
        Tue, 03 Nov 2020 07:29:31 -0800 (PST)
Received: from dell.default ([91.110.221.242])
        by smtp.gmail.com with ESMTPSA id j127sm3491779wma.31.2020.11.03.07.29.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2020 07:29:30 -0800 (PST)
From:   Lee Jones <lee.jones@linaro.org>
To:     lee.jones@linaro.org
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org
Subject: [PATCH 16/25] soc: qcom: smem: Fix formatting and missing documentation issues
Date:   Tue,  3 Nov 2020 15:28:29 +0000
Message-Id: <20201103152838.1290217-17-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201103152838.1290217-1-lee.jones@linaro.org>
References: <20201103152838.1290217-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Fixes the following W=1 kernel build warning(s):

 drivers/soc/qcom/smem.c:135: warning: Function parameter or member 'toc' not described in 'smem_header'
 drivers/soc/qcom/smem.c:275: warning: Function parameter or member 'socinfo' not described in 'qcom_smem'

Cc: Andy Gross <agross@kernel.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: linux-arm-msm@vger.kernel.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/soc/qcom/smem.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/qcom/smem.c b/drivers/soc/qcom/smem.c
index 28c19bcb2f205..7251827bac88d 100644
--- a/drivers/soc/qcom/smem.c
+++ b/drivers/soc/qcom/smem.c
@@ -122,7 +122,7 @@ struct smem_global_entry {
  * @free_offset:	index of the first unallocated byte in smem
  * @available:		number of bytes available for allocation
  * @reserved:		reserved field, must be 0
- * toc:			array of references to items
+ * @toc:		array of references to items
  */
 struct smem_header {
 	struct smem_proc_comm proc_comm[4];
@@ -255,6 +255,7 @@ struct smem_region {
  *		processor/host
  * @cacheline:	list of cacheline sizes for each host
  * @item_count: max accepted item number
+ * @socinfo:	platform device pointer
  * @num_regions: number of @regions
  * @regions:	list of the memory regions defining the shared memory
  */
-- 
2.25.1

