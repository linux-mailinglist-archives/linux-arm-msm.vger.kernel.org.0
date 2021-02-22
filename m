Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DA46A321C49
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Feb 2021 17:07:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230428AbhBVQFO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 22 Feb 2021 11:05:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230498AbhBVQE2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 22 Feb 2021 11:04:28 -0500
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90E5AC061D7F
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Feb 2021 08:02:01 -0800 (PST)
Received: by mail-wr1-x430.google.com with SMTP id h98so14822489wrh.11
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Feb 2021 08:02:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=uD6Ll3UJbUUhhLZHFuXMtl1QMIBqbo6mMrhSF9pYSkY=;
        b=uBnedkvDB7342lXR2f5JiB8TO+1gniqpgOixNUpoHsLVAte5OV29I4KJyk6B8DPpLK
         5t5ldjBbruyxfcJZs+OuwBLdAa7zOJKsXFjr6cDG/pFWCu+C4Uio1xasdJIbOLHA1zwX
         hUqS4Ltvp8Caoccn8UlO2kKaoYEJl4oUV/k5JcZ/ulo729OIzB4zyKOk05NGtscG1WdP
         nP7h8tKykKUsDFHSf4eaxyL/SX0dPKOMrbGli9GdtW/Wu0hncWcDL9kNvbEAnmr4gBi3
         j33VjF5Oy8mZQAx2swLVJ5ZBOHxM/IpUQAeA02MrzPoxQ7+krttL+vx0uIRgOqY1sjvu
         DdBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=uD6Ll3UJbUUhhLZHFuXMtl1QMIBqbo6mMrhSF9pYSkY=;
        b=RRnR5rapaPP/Sa2FPDC+K8Pily5ecZ1I3/M7xHy1G4FpR8oTeFWhf+TAm2kyhliXQc
         LXplTQ0QD5DWPx3TajHviJqxq62/BImi+14/GdNteNL+qBD9/xnKbtlqq90Y9FVAC+7L
         0ri1mYNKY+1hJoqFDR01Pb5R0bqvzz0XZy9nSvjNdvocjL6mViKBuqQVFpkG95yNyiw2
         d+KHFfgX72sZPirnlLzp1oovwGLvavhg73qLmJ5aouhhKlRlp3mnQVM0LgPzosN3tEnz
         stz2W9fgZC3NMA/0jAuu1CLvVzYznMnubgLKzPo2/5vEcDptgTocGXhUzXW4d2UCjShi
         N2ng==
X-Gm-Message-State: AOAM531U738SbP1ZgXLoEd36mxvh5ML7yZ2Akr+7jU89+Ktw4+t0erGI
        7aKxrG1GS4sXJs05P0cg41KJZg==
X-Google-Smtp-Source: ABdhPJzgiclUaRS8AnLQjO9qMcBlNDlI4+W7zQLgvDO01q+HNjqhz5fv7+XZYMWcDM3/WexnDYdOOw==
X-Received: by 2002:a05:6000:1184:: with SMTP id g4mr9242154wrx.322.1614009720380;
        Mon, 22 Feb 2021 08:02:00 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id c3sm7373697wrw.80.2021.02.22.08.01.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Feb 2021 08:01:59 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     stanimir.varbanov@linaro.org, agross@kernel.org,
        bjorn.andersson@linaro.org, mchehab@kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc:     bryan.odonoghue@linaro.org, dikshita@codeaurora.org,
        jonathan@marek.ca, vgarodia@codeaurora.org
Subject: [PATCH 23/25] media: venus: hfi: Increase plat_buf_v6 o/p buffer count.
Date:   Mon, 22 Feb 2021 16:02:58 +0000
Message-Id: <20210222160300.1811121-24-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210222160300.1811121-1-bryan.odonoghue@linaro.org>
References: <20210222160300.1811121-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Dikshita Agarwal <dikshita@codeaurora.org>

Presently, minimum buffer count for output buffers for h264 &
hevc codec is kept as 8 which might not be sufficient for
few use cases so increasing the value to 18.

Signed-off-by: Dikshita Agarwal <dikshita@codeaurora.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/venus/hfi_plat_bufs_v6.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/venus/hfi_plat_bufs_v6.c b/drivers/media/platform/qcom/venus/hfi_plat_bufs_v6.c
index d43d1a53e72d..075d9546b15e 100644
--- a/drivers/media/platform/qcom/venus/hfi_plat_bufs_v6.c
+++ b/drivers/media/platform/qcom/venus/hfi_plat_bufs_v6.c
@@ -1159,7 +1159,7 @@ static int output_buffer_count(u32 session_type, u32 codec)
 		case V4L2_PIX_FMT_H264:
 		case V4L2_PIX_FMT_HEVC:
 		default:
-			output_min_count = 8;
+			output_min_count = 18;
 			break;
 		}
 	} else {
-- 
2.29.2

