Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B30DA7CFD22
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Oct 2023 16:43:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235423AbjJSOnS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 19 Oct 2023 10:43:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235436AbjJSOnR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 19 Oct 2023 10:43:17 -0400
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07A8C114
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Oct 2023 07:43:15 -0700 (PDT)
Received: by mail-lj1-x233.google.com with SMTP id 38308e7fff4ca-2c50cd16f3bso89584921fa.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Oct 2023 07:43:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697726593; x=1698331393; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZidanZapShOTMYSy8dRTfrdEdrq+jVskErnDZbTql3w=;
        b=UhuHLlVokjHz0B5ox0r5JYNKOlHoZX9rAHsF88NdEFU/A4Z1YLVnf8UMzNbxMq7kPr
         dRXuxRBY3dBtyUYYQ4AwAhR4IqUX0hJrmf0C2NXCXXkfBcwvEYb8emlBeYigKIza/y9z
         L9s0eBfho9aK6zzXg/U24pE8wbqwbHHpdzOYKaKVFHE6WPg4fHkTPoJ5OfTVx3Mq/k3i
         iWuet1//tqYbneR4s5iWRtiddQKFq8yZqnH4BwrQW+tBscVfMFNj8yAXjDn9OvWg3Aj3
         DqxuWB3Ha1VYNYaY2nvireYYl7iwoyphc7wLQLW2w8ZdZWVh4j16gJVjWtVdlqkpedVh
         bucw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697726593; x=1698331393;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZidanZapShOTMYSy8dRTfrdEdrq+jVskErnDZbTql3w=;
        b=gl4/SK2rR1Q78MnTx2gnA+jsSiAy5xXFJ899Hm+KCXo2MoozuWblfcmQf9K+jw/74v
         9RFdLmv891NhFiCn/UAhR/YNNWsdZsBYNtKaapEkmfAz/nnVXHtsRM2LmRawPRtpV/aS
         N4ZY4HURTxXTj5sLGyQHvebkEuTz8/W2XUVkKCr8HkEkhszq57gIMe/aJoBoFNrkMRHK
         sjhhylfR6fvQmnxQCDB4SdvrwvZ/hp2zXDYQRLLShZck5O7ISHFVJmdkEWyw3DvPi416
         iWSWZFMoxF86dUimwPD4ZmhoYM6WLJGF4nGXRx8qbTdNznW/YtKaAiQnS522RzRscuN+
         UnFA==
X-Gm-Message-State: AOJu0Yxci6fk+YcCUVr1kFLBYTDHMti+sZb2fnw46aPpXZFfyg6seM1V
        p+LjeLIhqN3CG0XZTRuYLlEapOwQvP+tSyLj+OEJrw==
X-Google-Smtp-Source: AGHT+IEnwh5NZNVwZB6i0IRegzkzcEf9hRUomzf8uKNcKmuFRzY0N4UeiEB+cBUP6JfWBTFvSZNRMg==
X-Received: by 2002:a2e:9854:0:b0:2c5:1ad0:e306 with SMTP id e20-20020a2e9854000000b002c51ad0e306mr1542594ljj.8.1697726593150;
        Thu, 19 Oct 2023 07:43:13 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id s16-20020a05651c201000b002b6cd89a3fcsm1115758ljo.118.2023.10.19.07.43.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Oct 2023 07:43:12 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Zhang Rui <rui.zhang@intel.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org
Subject: [PATCH] thermal/qcom/tsens: drop ops_v0_1
Date:   Thu, 19 Oct 2023 17:43:11 +0300
Message-Id: <20231019144311.1035181-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Since the commit 6812d1dfbca9 ("thermal/drivers/qcom/tsens-v0_1: Fix
mdm9607 slope values") the default v0.1 implementation of tsens options
is unused by the driver. Drop it now to stop compiler complaining about
the unused static const. If the need for the default v0.1 ops struct
arives, this commit can be easily reverted without further
considerations.

Fixes: 6812d1dfbca9 ("thermal/drivers/qcom/tsens-v0_1: Fix mdm9607 slope values")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/thermal/qcom/tsens-v0_1.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/thermal/qcom/tsens-v0_1.c b/drivers/thermal/qcom/tsens-v0_1.c
index 87c09f62ee81..32d2d3e33287 100644
--- a/drivers/thermal/qcom/tsens-v0_1.c
+++ b/drivers/thermal/qcom/tsens-v0_1.c
@@ -325,12 +325,6 @@ static const struct reg_field tsens_v0_1_regfields[MAX_REGFIELDS] = {
 	[TRDY] = REG_FIELD(TM_TRDY_OFF, 0, 0),
 };
 
-static const struct tsens_ops ops_v0_1 = {
-	.init		= init_common,
-	.calibrate	= tsens_calibrate_common,
-	.get_temp	= get_temp_common,
-};
-
 static const struct tsens_ops ops_8226 = {
 	.init		= init_8226,
 	.calibrate	= tsens_calibrate_common,
-- 
2.39.2

