Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A105C3394C8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Mar 2021 18:30:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232653AbhCLR3Z (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 12 Mar 2021 12:29:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232804AbhCLR3V (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 12 Mar 2021 12:29:21 -0500
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 401ABC061574
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 Mar 2021 09:29:21 -0800 (PST)
Received: by mail-wm1-x336.google.com with SMTP id g20so4266027wmk.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 Mar 2021 09:29:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ns2FNG0XYO8CSarlZvsWL5K0oFxStVf7JDc9WV+CdgM=;
        b=oRwI0GNv26UBWNzWGgBeK3oJP3HbQlSskJYVRCfDP+KXBI6dHxKNFYfL1Sbv6txdpL
         j9MopI20nH2y5mT5ZfdsMyQjsyN1VWeyoBwPUJhtnwLi1tvPknpimzEzZjBilFa/lJjo
         WoeAoipB2JEzTb0G6eAVqjzkd9Gle9CafmiV8sHQwsaCKNJy7/a94aRMTt10l99YeNXG
         pB2AFFn05z3i1uCQwe8931qbgXM2jXIJj/BQrYy/ddBJGZ6NF2rUXBs+ronCObqEBEKA
         VpWuMRYCDegk1cgBXqMSoEIkcytp4oRgbWreBOPeZATC6IgULsOgr9Invp3jopW7Eazz
         nepg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ns2FNG0XYO8CSarlZvsWL5K0oFxStVf7JDc9WV+CdgM=;
        b=QIde/DwRdVLbuyv+BSMhVR6CdnQ9b4NIvjAszp0wqtq8+aMfIyz9U2RHYDMRlbY4m3
         OAkF+JZOLC2cKCCO2KXQOUosq7kXxsQtUk6knJS80sEBB88i6yTOPO9fmDY5Nfd2RuOe
         ZF8Q94onBy9Eivpr722auvyUDHMut7HBxPw44UgwKBuBf3dDiZpnSi8wVqQknlMuMYXU
         YyMw/cZ1odLxfOocC0UBsG+FQDpNQdaorXDaUxu+s5hTmTKOFhOHx+Z1udk5f6JFxZQM
         BhzaiE5h3XtuwIMdhIXRph/BNxTNEr2gKJfD7izK910UJw9GoEMCkkm0wSm/bH+VvHp/
         WZvg==
X-Gm-Message-State: AOAM531shR8ktz5t704fhkaaXXS4Qm7uCjN7/MhlvfRNpyBwf35bdtnL
        lCOtBHSWFO/Fwh4M8mP9JaU6VQ==
X-Google-Smtp-Source: ABdhPJyBL/4NyRuIxbyGrl0e1OrVsgCWFkCT/F20gthq+7JilL66jFjcVQsz0AkRWAzYJps/kf6lxg==
X-Received: by 2002:a05:600c:2145:: with SMTP id v5mr14373934wml.65.1615570160033;
        Fri, 12 Mar 2021 09:29:20 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id 18sm2876375wmj.21.2021.03.12.09.29.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Mar 2021 09:29:19 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     stanimir.varbanov@linaro.org, agross@kernel.org,
        bjorn.andersson@linaro.org, mchehab@kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc:     bryan.odonoghue@linaro.org, dikshita@codeaurora.org,
        jonathan@marek.ca, vgarodia@codeaurora.org
Subject: [PATCH v2 08/25] media: venus: core: Add differentiator IS_V6(core)
Date:   Fri, 12 Mar 2021 17:30:22 +0000
Message-Id: <20210312173039.1387617-9-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210312173039.1387617-1-bryan.odonoghue@linaro.org>
References: <20210312173039.1387617-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This commit adds the macro helper IS_V6() which will be used to
differentiate iris2/v6 silicon from previous versions.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
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

