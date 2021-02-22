Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 76E52321C21
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Feb 2021 17:03:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230457AbhBVQDX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 22 Feb 2021 11:03:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231185AbhBVQDU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 22 Feb 2021 11:03:20 -0500
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68F72C061223
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Feb 2021 08:01:47 -0800 (PST)
Received: by mail-wr1-x434.google.com with SMTP id 7so19654023wrz.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Feb 2021 08:01:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1+CgN0nh2JSnbM9Feox54p0kdgx4CZZNK6cQ0ib5plk=;
        b=WXL5BQlO+UjH/ToUwcMHmiCSQ3gGzRjFdRuhHLrbIIB+Cxy3OpsGsH5MvT94ufvxnc
         rgmkbaMk5qtNE6YJ61Ia8ZXKuIX8O4tJAekMq4NGaVChowIlTzdeTd0uoxq08KC1QSj3
         X8+ZPjIUEJFC58iwoD7nAJFGf/l3J1z1tm5FlZFmR0KjdLehMKyprt4XtOkjxF6unB4G
         EIKrDKnt0DRPMcAYq3ni+61xow8bM1t9JYBYoOmkV+uXX+/809b0PicEP+AP2Lk8TOBs
         fNZ25z9Itgmn7HCovq3arFEMANjr5SXiilp4jMlLPvDjuFy8TqKSo8POzBVcRmMuJpVd
         denQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1+CgN0nh2JSnbM9Feox54p0kdgx4CZZNK6cQ0ib5plk=;
        b=ebpAe84NOAP/WJnPr9ObnKSdXxTO1rpyhd1N8h3pl836OrO4PGjCxRpQlzEZx69C8K
         a+qckr0Zxsg/0zJwtRUcWM5x7DAe5XxdUpnj2UgGYlsGPHF8QrVU7udIOg/waCqVfsNN
         c8TzLKPGNvcxfk4y8FzrKVdJKpxdpw+e5kw3s5UxQEE+aU9FWS/SxKDLygo6p9LYR/JQ
         MGzaRGrZEKH6LBjcCNEnqAzBFbcDtxRJGv1Vn20PVrsbhIjVBRV8dR0Do3SXUZL2Kpe/
         2yv7e5GIvbUEslQoDP2siIaPCB6CazQ7tReOljVuNWvzCsHVwER1vJnkTJLSzaPaLq+D
         3Tqg==
X-Gm-Message-State: AOAM532WxkalYNjVSCJ+fEgXQ44fRBU3eag4fhDlqyYtfI56i5LJ3A2W
        pFPx8BUX7W0d0kI6onAOvu0lzA==
X-Google-Smtp-Source: ABdhPJzZ2BTSUQa9HprJfmL7ORnqrbg2mJ8XyEkeA7E/1pixQ19SD0uOtQnIXqoyjBdlAn+YVY0yxg==
X-Received: by 2002:a5d:540d:: with SMTP id g13mr22185325wrv.143.1614009706184;
        Mon, 22 Feb 2021 08:01:46 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id c3sm7373697wrw.80.2021.02.22.08.01.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Feb 2021 08:01:45 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     stanimir.varbanov@linaro.org, agross@kernel.org,
        bjorn.andersson@linaro.org, mchehab@kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc:     bryan.odonoghue@linaro.org, dikshita@codeaurora.org,
        jonathan@marek.ca, vgarodia@codeaurora.org
Subject: [PATCH 09/25] media: venus: core: Add differentiator IS_V6(core)
Date:   Mon, 22 Feb 2021 16:02:44 +0000
Message-Id: <20210222160300.1811121-10-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210222160300.1811121-1-bryan.odonoghue@linaro.org>
References: <20210222160300.1811121-1-bryan.odonoghue@linaro.org>
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
index 1be73c707d21..0c90f48323f2 100644
--- a/drivers/media/platform/qcom/venus/core.h
+++ b/drivers/media/platform/qcom/venus/core.h
@@ -417,6 +417,7 @@ struct venus_inst {
 #define IS_V1(core)	((core)->res->hfi_version == HFI_VERSION_1XX)
 #define IS_V3(core)	((core)->res->hfi_version == HFI_VERSION_3XX)
 #define IS_V4(core)	((core)->res->hfi_version == HFI_VERSION_4XX)
+#define IS_V6(core)	((core)->res->hfi_version == HFI_VERSION_6XX)
 
 #define ctrl_to_inst(ctrl)	\
 	container_of((ctrl)->handler, struct venus_inst, ctrl_handler)
-- 
2.29.2

