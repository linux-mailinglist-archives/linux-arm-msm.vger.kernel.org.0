Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 34F58321C37
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Feb 2021 17:07:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230411AbhBVQEc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 22 Feb 2021 11:04:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50686 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231339AbhBVQDk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 22 Feb 2021 11:03:40 -0500
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82C8AC061A32
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Feb 2021 08:01:57 -0800 (PST)
Received: by mail-wm1-x336.google.com with SMTP id n10so14875298wmq.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Feb 2021 08:01:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=bpo0//4chUUR1mhPO3iw62PhjsjchQwUrKOO/MLsUwc=;
        b=MVWjFI+Sfit+bMcvmbseAz4TacHVWZSxgdYfAkMX5Hu089gKmKBb8G/z5vMOT/ctVb
         /F6P6CdLeQEXQ2e9k6GLASmB35q7TPxFwYmX2NihGtHFSzZjlQlN5YXcgPEn6H62mqmq
         +PxZkm2UEUYF4F3D6H3rJFlFFiWbcjCBelJphqn4pRVX3h84jT+tG1zA+7TQc5MrUaRo
         4bH8i1PYY7Gy8NwHr/IJ7KeJ9qAyGwAgftN7MK/ICjbudOXJCe3591HryeQ8IRAUBi3B
         mC9UPTkCrx4bKG2ikO/N3TMucV6JPtGKbdX/EiltIZPmgxJ4Nmq1zMUb4iY9PNVWxTDJ
         6B7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=bpo0//4chUUR1mhPO3iw62PhjsjchQwUrKOO/MLsUwc=;
        b=efJmrGwIajxbIdWKOwjeDfApNKb4uviuDdCDx+9yTn7e6wuwbxGHZJ2bejEOSl5eVB
         8Uz/qHTzR9EslLHlQvBXDvz2R6aBbL8KuDQ9dOuVFGJzEiFhBFsVhy0tS/isWBVZ7J85
         Lavy7VZl45wWhb1Ek0FDnlTBU8IeZF0mheXYIhMaoO9fBCepNr1aA/OpW9w62pjD8H9f
         3ApG6JHT28ljFo9+PnZKZvxmF4tkTQqA+WVCi7njEEZwFx+Xvz14gAoKg8qDW3FxQta4
         UdVdAizlHxgYy1WSBV7bZ5PysisOmnJfLujK8drMl3N+kakDqNZ8VCHDUkT5saph/XKh
         NO6Q==
X-Gm-Message-State: AOAM533b7sNefBCbKMwUb3JmbWvwfC1IBBmr9XsI2mwzR7g68f0K9y7R
        ArcINiT0hfgO2phmzdEJTlQTbA==
X-Google-Smtp-Source: ABdhPJyKckeF+UMG+tH7Hgwbnl/M2KfEg2MALzeEwe4hENqHoEG2lhVp4165tiz9wFW4+quXT05D8w==
X-Received: by 2002:a1c:f409:: with SMTP id z9mr110111wma.141.1614009716353;
        Mon, 22 Feb 2021 08:01:56 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id c3sm7373697wrw.80.2021.02.22.08.01.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Feb 2021 08:01:55 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     stanimir.varbanov@linaro.org, agross@kernel.org,
        bjorn.andersson@linaro.org, mchehab@kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc:     bryan.odonoghue@linaro.org, dikshita@codeaurora.org,
        jonathan@marek.ca, vgarodia@codeaurora.org
Subject: [PATCH 19/25] media: venus: pm: Toggle 6xx wrapper power in vcodec_control
Date:   Mon, 22 Feb 2021 16:02:54 +0000
Message-Id: <20210222160300.1811121-20-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210222160300.1811121-1-bryan.odonoghue@linaro.org>
References: <20210222160300.1811121-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Dikshita Agarwal <dikshita@codeaurora.org>

When in vcodec_control_v4() on the 4xx path we select between one of two
vcodec cores to toggle power control bits. In 6xx there is only one core
which offsets the relevant control registers to a slightly different
address.

This patch accounts for the address offset for 6xx silicon.

Signed-off-by: Dikshita Agarwal <dikshita@codeaurora.org>
Co-developed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/venus/pm_helpers.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/venus/pm_helpers.c b/drivers/media/platform/qcom/venus/pm_helpers.c
index f163526c3f83..9ca90632c60e 100644
--- a/drivers/media/platform/qcom/venus/pm_helpers.c
+++ b/drivers/media/platform/qcom/venus/pm_helpers.c
@@ -397,7 +397,10 @@ static int vcodec_control_v4(struct venus_core *core, u32 coreid, bool enable)
 	u32 val;
 	int ret;
 
-	if (coreid == VIDC_CORE_ID_1) {
+	if (IS_V6(core)) {
+		ctrl = core->wrapper_base + WRAPPER_CORE_POWER_CONTROL_V6;
+		stat = core->wrapper_base + WRAPPER_CORE_POWER_STATUS_V6;
+	} else if (coreid == VIDC_CORE_ID_1) {
 		ctrl = core->wrapper_base + WRAPPER_VCODEC0_MMCC_POWER_CONTROL;
 		stat = core->wrapper_base + WRAPPER_VCODEC0_MMCC_POWER_STATUS;
 	} else {
-- 
2.29.2

