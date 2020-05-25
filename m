Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 342B01E1300
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2020 18:48:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391265AbgEYQsY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 25 May 2020 12:48:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389087AbgEYQsY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 25 May 2020 12:48:24 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF044C061A0E
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2020 09:48:23 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id v16so21438685ljc.8
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2020 09:48:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qiWKxhYi/YMJ+m01984GaO2DEsOeOP9WoQp14EKeVgY=;
        b=Jker/vaUihP9dB/QptkseqeqyGMgRlEGX8R6uIqyNsuPjg1FR2WNDHwGYx4+begViw
         d9xOFNhgj+EZkqCurFyf2ohJW/2vwWhw9fPlgxMgqqHy15W8t7m2ax9+MuXhG5eBZeFE
         b8IJvmIwgjzmKR7LtSpSXjkG7I1EalErLGwbsa2nBW8YMRXcx3GQwqWJeJFDRggfkXN+
         S8Q+r6bFUTVzMZ5KpQF2ycD9TdLJVZ5NLP6hktYVTv74+up35fZ/EmITp2mfo2hVCJLk
         heuBkbnz+D6P1+tRn1mqblkOiTWry369H32afiq5ID+2eXU5aW5Sgm9sUtQHo7cg2Poj
         Jobw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qiWKxhYi/YMJ+m01984GaO2DEsOeOP9WoQp14EKeVgY=;
        b=R2/p0+Mdt5Z/+lttQ5a7Jr1EOUVwPkiI3KNyWd14+Qk0RNA5c9rMQ7FRSJitqCna77
         ogFe3JkcvZMqts6JtDycyKdcpifM0FHZCAnDgmXsRHK3xZHaHeckEGaqjj1sBp6qE/IZ
         7gRjPI6qFufpTq9p6ANu8WUVOBqXr8ek+7vgb/B+QNxDHCeFJkS9FN0HjvvXQawQ7fyB
         9vu4ktqr3uRHT3VDXaDV2nBauCoquI4PKOYZAQSUJlcj25s2anf4+6QAyNk7b6P4X4Id
         +Iyn510dnQgrb1y2bqrR4HrqMuqY3O+tcrbFb4vIDaQ4jql/X9zW5ThjyHnb+JNzbEOI
         8VYw==
X-Gm-Message-State: AOAM532Hv5RKOKi6xAUeTg5Y6tjgHzOLGnjJiLw2o/hc9NWYVggDXe99
        o4vKcqa/s8br6MEVmq5sFVYjKRGlE4Q=
X-Google-Smtp-Source: ABdhPJw4ZfvriwVp8OJvPY3JYXP5NaW1Atd85v4ZanHFGaTMBXkqHB8AOT0TbHXh1/wG7tdh00U/MQ==
X-Received: by 2002:a2e:95d2:: with SMTP id y18mr11693961ljh.342.1590425301583;
        Mon, 25 May 2020 09:48:21 -0700 (PDT)
Received: from lothlann.lan ([188.162.64.24])
        by smtp.gmail.com with ESMTPSA id y21sm2914337ljg.48.2020.05.25.09.48.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2020 09:48:21 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     linux-arm-msm@vger.kernel.org
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        patches@linaro.org, linaro-kernel@lists.linaro.org
Subject: [PATCH 3/4] soc: qcom: socinfo: add file with SoC info format version
Date:   Mon, 25 May 2020 19:48:16 +0300
Message-Id: <20200525164817.2938638-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200525164817.2938638-1-dmitry.baryshkov@linaro.org>
References: <20200525164817.2938638-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

To ease debugging socinfo driver for newer chips add debugfs file
returning SoC info format version.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/soc/qcom/socinfo.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/soc/qcom/socinfo.c b/drivers/soc/qcom/socinfo.c
index 41f48c3447cc..5f98949c7562 100644
--- a/drivers/soc/qcom/socinfo.c
+++ b/drivers/soc/qcom/socinfo.c
@@ -338,6 +338,9 @@ static void socinfo_debugfs_init(struct qcom_socinfo *qcom_socinfo,
 
 	qcom_socinfo->info.fmt = __le32_to_cpu(info->fmt);
 
+	debugfs_create_x32("info_fmt", 0400, qcom_socinfo->dbg_root,
+			   &qcom_socinfo->info.fmt);
+
 	switch (qcom_socinfo->info.fmt) {
 	case SOCINFO_VERSION(0, 15):
 		qcom_socinfo->info.nmodem_supported = __le32_to_cpu(info->nmodem_supported);
-- 
2.26.2

