Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D264335295B
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Apr 2021 12:05:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234389AbhDBKFb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 2 Apr 2021 06:05:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45462 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234563AbhDBKFa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 2 Apr 2021 06:05:30 -0400
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60613C0613AB
        for <linux-arm-msm@vger.kernel.org>; Fri,  2 Apr 2021 03:05:26 -0700 (PDT)
Received: by mail-wr1-x436.google.com with SMTP id e18so4303781wrt.6
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 Apr 2021 03:05:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8FFDLZB/vHm0pWu0rgOmQ3F7+I8O6+iIXPof9tEB6Pw=;
        b=F83GTV9ORyhd5EWryfWuRGx3v7/9FByVfUDvcXjbSTYuCsqLL0ZAiHw+9Ermx9hGDh
         wPLUTfN1LQtC7XPQ7JrM75svfALU7yudwhGtcg/FKA+Me39aJ3MXDosjBOMuMN6JXhud
         9A7nNpV1+7ouoaTYJr8FhPW38S1a+1XS3e2xsgX7JaOiSo2S+rh6JOTbzbntTCoTWEEK
         /kPyiH56HBFTzUIrPENUvTZEdyjT1XFZ4ZDNAdlrt2QS+SqX6XoWnNa7RAl6hRcIaFQo
         8Aym4rFXzlcohdQfqW5hSRzRgJhOZjs4NIs2zyVCCj+TMPiQD6iYBS2C3WPlq/+KMpVN
         Bk0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8FFDLZB/vHm0pWu0rgOmQ3F7+I8O6+iIXPof9tEB6Pw=;
        b=IPM2PAsHPOwwQgxAWgu9fzoDQR46fbz+myvunVjPUbpVTwHvJLn/Dlu/5V4ERB8doj
         jcC+obzXvRZEMvfAdUuvO6YWeA9QfbeXZfe+dFAaR29bb0UY73Ul+ssj7Et44kBLBnTF
         ZHCTCPvSnwD2SVbwk2Z1B67/YXf++F6j5o2t8iUnVv9LhAab9BMSHxBAykUsm8i+T/5K
         i4tiUsu+jrm5f4zklx6fIjf2pLLhXOfr7itm88FLfxxORQfa5pP4RInAhSOSJ/X/PiFf
         tp4/W0cOntIUUOjhz6tCri1Rvr+lPqu50rEH1yPxzuQwgqqeqrNROoUTQK16xSZnNovk
         1IeQ==
X-Gm-Message-State: AOAM532ylqGfq7FtEzwt+hlgf60Fjm0siADynSp1WtxagGtzS2q1qCVH
        S0XL4aLM/55eUPEQWcwYEJzccQ==
X-Google-Smtp-Source: ABdhPJwIjJeIKF5imDRak5quEnC0BAQB9Jk94FKTbfBG/qrdYz65XcSHLJgT/ia3AEXzUeqtFykhaA==
X-Received: by 2002:a5d:5256:: with SMTP id k22mr14726134wrc.162.1617357925162;
        Fri, 02 Apr 2021 03:05:25 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id v18sm15466618wrf.41.2021.04.02.03.05.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Apr 2021 03:05:24 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     stanimir.varbanov@linaro.org, agross@kernel.org,
        bjorn.andersson@linaro.org, mchehab@kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc:     bryan.odonoghue@linaro.org, dikshita@codeaurora.org,
        jonathan@marek.ca, vgarodia@codeaurora.org
Subject: [PATCH v3 08/25] media: venus: core: Add differentiator IS_V6(core)
Date:   Fri,  2 Apr 2021 11:06:31 +0100
Message-Id: <20210402100648.1815854-9-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210402100648.1815854-1-bryan.odonoghue@linaro.org>
References: <20210402100648.1815854-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This commit adds the macro helper IS_V6() which will be used to
differentiate iris2/v6 silicon from previous versions.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Acked-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
---
 drivers/media/platform/qcom/venus/core.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
index 110287279f05..85047806142f 100644
--- a/drivers/media/platform/qcom/venus/core.h
+++ b/drivers/media/platform/qcom/venus/core.h
@@ -420,6 +420,7 @@ struct venus_inst {
 #define IS_V1(core)	((core)->res->hfi_version == HFI_VERSION_1XX)
 #define IS_V3(core)	((core)->res->hfi_version == HFI_VERSION_3XX)
 #define IS_V4(core)	((core)->res->hfi_version == HFI_VERSION_4XX)
+#define IS_V6(core)	((core)->res->hfi_version == HFI_VERSION_6XX)
 
 #define ctrl_to_inst(ctrl)	\
 	container_of((ctrl)->handler, struct venus_inst, ctrl_handler)
-- 
2.30.1

