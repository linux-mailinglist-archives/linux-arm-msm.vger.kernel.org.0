Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B7684261D82
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Sep 2020 21:38:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732350AbgIHThw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 8 Sep 2020 15:37:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53402 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730751AbgIHPzo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 8 Sep 2020 11:55:44 -0400
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com [IPv6:2a00:1450:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61FAFC061343
        for <linux-arm-msm@vger.kernel.org>; Tue,  8 Sep 2020 05:33:30 -0700 (PDT)
Received: by mail-ej1-x644.google.com with SMTP id i22so22247165eja.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Sep 2020 05:33:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=U/ytzC+Xy3Xxbn3dWyObssuKdvhh3djXX6G5KrguHpw=;
        b=MjtH2eoLRl2Yx7RGtVGNBFgZha7XbJDmTzJ4JjTcvphGudl1klnSeOMryTbu+Ily37
         14AklWjovAy63brJ/GgEQIDkKrs/31qaZdDaaUTOc7blnCecsjH9LGMxMWo25+EQ/mJB
         MXuU3RBSzuDcC/KTnmqaYkvIrQLkgDbd4vdBW+3YRA+66uX2cNSZNvUWsqWytxCyZRUc
         XAK49sYqHBftaE3lz8/C8T5JtXldioVXGC78H2KCRFYlExr6qU/Co8K8+6dYMX3uXG8E
         mbfvO6nTM6/YTMqq2Oyl5p2FVdLxtGH8nsY2MUNe1JuQxigIbKnx5yUlCMnhSVOp0PKr
         yBTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=U/ytzC+Xy3Xxbn3dWyObssuKdvhh3djXX6G5KrguHpw=;
        b=NpyUsUYuXVlIwv8eCwwI6Ceml0gv90qSm6ondm1TpX5AwQ4xNsOPMzot2vp6eG1gkp
         pFY0sU8gbj2kH30O/LE0C+7v2PCTMGu55FnY9tKR1R1hYxX8KVF2OYTo+zNaDK1PHdE2
         KifIhy9xoiNJNsMMzLlGfU0eg4UB1pLX7F/9poG7axzNckV+VRy+sqvtZb+lFH64IDlt
         qdrSHz+hrf9xm26LpwkErBE2eCRo/dMK2rIeax+bbMqdf3pgjqunzfH1p1OTZo4vnnoW
         KfZgYtK4ah4pDZqUrgL0H5PsI1uQ/o9AzmOKXQwaWrK9SMUc8uvUaHuNtBkf50qnMFQ9
         uRrg==
X-Gm-Message-State: AOAM530f8run0M0PfZlRdBwZ/mXpmNc5Kuc3NUPOFqZ08tx1dPnXBmuC
        EVyMinilu7F+i0SNRbQLTW7teSigN96oSmud
X-Google-Smtp-Source: ABdhPJwP5Dtyk6XvdHyWoAeIATGo0/jTovJF2dUFA4ZnMyr0o1/OZvHbiVUU4RhBjHgXEBsTQ81vLg==
X-Received: by 2002:a17:907:37b:: with SMTP id rs27mr27158410ejb.0.1599568408830;
        Tue, 08 Sep 2020 05:33:28 -0700 (PDT)
Received: from localhost.localdomain ([195.24.90.54])
        by smtp.gmail.com with ESMTPSA id y9sm17499744edo.37.2020.09.08.05.33.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2020 05:33:28 -0700 (PDT)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org
Cc:     Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Neil Armstrong <narmstrong@baylibre.com>,
        nicolas.dufresne@collabora.com,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH v3 2/6] venus: hfi_helper: Add VP9 profile and levels
Date:   Tue,  8 Sep 2020 15:32:17 +0300
Message-Id: <20200908123221.2793-3-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200908123221.2793-1-stanimir.varbanov@linaro.org>
References: <20200908123221.2793-1-stanimir.varbanov@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add HFI defines for VP9 codec profile and levels.

Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
---
 drivers/media/platform/qcom/venus/hfi_helper.h | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/media/platform/qcom/venus/hfi_helper.h b/drivers/media/platform/qcom/venus/hfi_helper.h
index 758c70ac26fd..60ee2479f7a6 100644
--- a/drivers/media/platform/qcom/venus/hfi_helper.h
+++ b/drivers/media/platform/qcom/venus/hfi_helper.h
@@ -364,6 +364,24 @@
 #define HFI_HEVC_TIER_MAIN			0x1
 #define HFI_HEVC_TIER_HIGH0			0x2
 
+/* VP9 Profile 0, 8-bit */
+#define HFI_VP9_PROFILE_P0			0x00000001
+/* VP9 Profile 2, 10-bit */
+#define HFI_VP9_PROFILE_P2_10B			0x00000004
+
+#define HFI_VP9_LEVEL_1				0x00000001
+#define HFI_VP9_LEVEL_11			0x00000002
+#define HFI_VP9_LEVEL_2				0x00000004
+#define HFI_VP9_LEVEL_21			0x00000008
+#define HFI_VP9_LEVEL_3				0x00000010
+#define HFI_VP9_LEVEL_31			0x00000020
+#define HFI_VP9_LEVEL_4				0x00000040
+#define HFI_VP9_LEVEL_41			0x00000080
+#define HFI_VP9_LEVEL_5				0x00000100
+#define HFI_VP9_LEVEL_51			0x00000200
+#define HFI_VP9_LEVEL_6				0x00000400
+#define HFI_VP9_LEVEL_61			0x00000800
+
 #define HFI_BUFFER_INPUT			0x1
 #define HFI_BUFFER_OUTPUT			0x2
 #define HFI_BUFFER_OUTPUT2			0x3
-- 
2.17.1

