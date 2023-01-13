Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E090966927A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Jan 2023 10:11:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241138AbjAMJLD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 13 Jan 2023 04:11:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43712 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240969AbjAMJKZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 13 Jan 2023 04:10:25 -0500
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C6F97575C
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Jan 2023 01:07:53 -0800 (PST)
Received: by mail-lf1-x130.google.com with SMTP id b3so32213513lfv.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Jan 2023 01:07:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=60yxEW22hoAOOhOWGOTH5M2hZiABdMD97947KesUJto=;
        b=REXQMGrJIZiWEPdOgQHYLdJ9o+K2QMjcuaT+NTV+ebUUz4hhyPNl9sS599Q6Ybm7on
         LjFQxGfLaVPqPg5CNyr7pWxxYPYt99yLCFsnkoU0UH6WnbuqPHHNqSOjSYhwD74f3Lig
         Z2Kuvn5xMbIy8l7iXCZ8oWHZ4WxCyJE4Ztf6vAMucE4c8LRI9NlKyDiNeavPUhV+EnhX
         DjNYDvoFKcpxXdqP2jflY7yQYUHA1Kf0Wx5ozomvhedwtI5rIxe3Ws6ZwAjqPt/9SWOV
         RHO5xV2KDTI58qogbnCe2QuGJMEicSGwPyCEXB06Jls1QNS5SbT+XSuQQZXrrmouxgfy
         IHug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=60yxEW22hoAOOhOWGOTH5M2hZiABdMD97947KesUJto=;
        b=f5/hSDhF35YHolOPVhxaj1yhUdfl9SpkVjkZrmWpYGKqnaSVlz2PDmzQUzd4uWXm22
         TorXMl8qLsiA3vcm6T8uAE7RHG8a21CgA+bfN49cgzjZeHbOQ9i168v3YJMgOIj3+CPo
         edc+WKcwrDMGTN0WtVxu+Z8QDxdFw+tYvr74RIsUwn71cQDAVpApWdYisJsUkD233X3D
         jfO4Ob7axfwN6/vw7FdczRerxBLP+DljKZxEKU5l0oU9HhClJrB7Jy5NZ6zLViKZzF5I
         fy3F4vIkYlXIQOVv/+fiGktefJIE69yNMAfjeYFOC3c7g1cOReg+goOvAhai1PfYeSOo
         DyFg==
X-Gm-Message-State: AFqh2kpsl7569ol+YfUn6//VSHFjFZCKK0CLhJHmjcrArnnoswtNHNsk
        TPAPJpuS/Gzmeaq1Et2HdzWscw==
X-Google-Smtp-Source: AMrXdXtXkDr/H6UigCTKrCgJk574+PyWuTRkf5tQWSma76n0kWaaeffJv22h2NdCvHUGDJNVy3Ixog==
X-Received: by 2002:a05:6512:3051:b0:4b5:79ca:e62d with SMTP id b17-20020a056512305100b004b579cae62dmr32092348lfb.16.1673600872902;
        Fri, 13 Jan 2023 01:07:52 -0800 (PST)
Received: from eriador.lumag.spb.ru ([194.204.33.9])
        by smtp.gmail.com with ESMTPSA id d4-20020a05651233c400b004947a12232bsm3735296lfg.275.2023.01.13.01.07.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jan 2023 01:07:52 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH v2 3/4] mailbox: qcom-apcs-ipc: enable APCS clock device for MSM8996
Date:   Fri, 13 Jan 2023 11:07:38 +0200
Message-Id: <20230113090739.45805-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230113090739.45805-1-dmitry.baryshkov@linaro.org>
References: <20230113090739.45805-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

MSM8996 also has the clock-related part of the APCS mailbox device.
Follow the usual pattern and create a child device to handle these
clocks.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/mailbox/qcom-apcs-ipc-mailbox.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mailbox/qcom-apcs-ipc-mailbox.c b/drivers/mailbox/qcom-apcs-ipc-mailbox.c
index 0e9f9cba8668..bd61dacb44ba 100644
--- a/drivers/mailbox/qcom-apcs-ipc-mailbox.c
+++ b/drivers/mailbox/qcom-apcs-ipc-mailbox.c
@@ -42,7 +42,7 @@ static const struct qcom_apcs_ipc_data msm8994_apcs_data = {
 };
 
 static const struct qcom_apcs_ipc_data msm8996_apcs_data = {
-	.offset = 16, .clk_name = NULL
+	.offset = 16, .clk_name = "qcom-apcs-msm8996-clk"
 };
 
 static const struct qcom_apcs_ipc_data apps_shared_apcs_data = {
-- 
2.39.0

