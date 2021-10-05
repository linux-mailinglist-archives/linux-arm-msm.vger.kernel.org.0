Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E7A3B42203D
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Oct 2021 10:11:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232511AbhJEINP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 Oct 2021 04:13:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39850 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233321AbhJEIND (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Oct 2021 04:13:03 -0400
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AAADEC061745
        for <linux-arm-msm@vger.kernel.org>; Tue,  5 Oct 2021 01:11:12 -0700 (PDT)
Received: by mail-ed1-x52a.google.com with SMTP id g8so75300951edt.7
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 Oct 2021 01:11:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=NmNy3i7s7hkAq0MWmGrwqRoyEBYaUhWJOlMgIBRIabE=;
        b=fRACUKHw5J6LBEjmv2sBLsFdyXBxC1V9ozedco1OMNDzAl2bKFx6eb3sF3bDF+dtZu
         nefergbhHmFMtaYDeK1LUm0ZOe1kISlmPKer5r1mhbds1hc6AnWhuM/296wWt0aK/zeS
         mQ0Y6owfsq534Ab2sc527Da0KqLgGKvY8tQTtxe5fAhtpkNuYr/YeTd0MtrOL1h7UZWb
         h8vNuf99nhynEXtUls0jIx3MADIdVXZ3R2AtGDuBAz26X+tYnT8RI9M0I9+keBJrQFju
         faPnfz9mW7zhXmyNeIt/l7V3jA7nc6m53qPaeXagQJKbkcKfTVlxWyhTtu2qSTkomP9B
         lZkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NmNy3i7s7hkAq0MWmGrwqRoyEBYaUhWJOlMgIBRIabE=;
        b=7gfF77hxXpGbvVtsmQsofUfw6wWOb/7AWdTxj3tRLfTXDsId4y963997O0aWkk/EFI
         qfrvcrNm+tFrPFQb2Oz72rUYX2PHNbb5IAVuD+0nKs3BbvpQkdSyUwCqjDM/H03Yz2aB
         pYmjdfk0IOCRhQlwzd4RB2eWzAdeG+69bVcAcZ6lnJdNkF/B6NFFt4o1iI2LgPCH2HCb
         KS2x4HYTgpOqIVN8L/UPvge2NDBFGQ0BNpx+VJ9LWD+Zrn6MHsKugUxx68KMlzgCwSpy
         fz/I3NYJak9MHJNAjeJd2MTQWyZ02Ai2Csfl5BlEypZIikMoLTz4llqBY9OJOZWAAx84
         WIAg==
X-Gm-Message-State: AOAM530fn/1WRe0mtrnYq201Y8JIubpOCw0ISSplZfHmnLKIq3IST/Hx
        vT3dF6t4vR5hhpw/EZeUxQDTLQ==
X-Google-Smtp-Source: ABdhPJwdwDEJtPktwVHX9sOtwHiTTPPRYYotLxL1VjtHR6zfxAmt+iMGKvW+R0kGohFIKPWPSURNsQ==
X-Received: by 2002:a17:906:8e0c:: with SMTP id rx12mr23105415ejc.423.1633421471283;
        Tue, 05 Oct 2021 01:11:11 -0700 (PDT)
Received: from localhost.localdomain ([84.238.208.199])
        by smtp.gmail.com with ESMTPSA id f1sm3096258edz.47.2021.10.05.01.11.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Oct 2021 01:11:11 -0700 (PDT)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-media@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        vgarodia@codeaurora.org,
        Dikshita Agarwal <dikshita@codeaurora.org>,
        Mansur Alisha Shaik <mansur@codeaurora.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH v5 6/7] media: venus: helpers: update NUM_MBS macro calculation
Date:   Tue,  5 Oct 2021 11:10:47 +0300
Message-Id: <20211005081048.3095252-7-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211005081048.3095252-1-stanimir.varbanov@linaro.org>
References: <20211005081048.3095252-1-stanimir.varbanov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Dikshita Agarwal <dikshita@codeaurora.org>

Consider alignment while calculating NUM_MBS.

Co-developed-by: Mansur Alisha Shaik <mansur@codeaurora.org>
Signed-off-by: Mansur Alisha Shaik <mansur@codeaurora.org>
Signed-off-by: Dikshita Agarwal <dikshita@codeaurora.org>
Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
---
Dropped changes in the patch which are not related to it
 
 drivers/media/platform/qcom/venus/helpers.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/helpers.c b/drivers/media/platform/qcom/venus/helpers.c
index 1f46a6f4456a..196a24892176 100644
--- a/drivers/media/platform/qcom/venus/helpers.c
+++ b/drivers/media/platform/qcom/venus/helpers.c
@@ -18,8 +18,8 @@
 #include "hfi_platform.h"
 #include "hfi_parser.h"
 
-#define NUM_MBS_720P	(((1280 + 15) >> 4) * ((720 + 15) >> 4))
-#define NUM_MBS_4K	(((4096 + 15) >> 4) * ((2304 + 15) >> 4))
+#define NUM_MBS_720P	(((ALIGN(1280, 16)) >> 4) * ((ALIGN(736, 16)) >> 4))
+#define NUM_MBS_4K	(((ALIGN(4096, 16)) >> 4) * ((ALIGN(2304, 16)) >> 4))
 
 struct intbuf {
 	struct list_head list;
-- 
2.25.1

