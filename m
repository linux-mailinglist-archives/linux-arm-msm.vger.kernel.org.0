Return-Path: <linux-arm-msm+bounces-42728-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 53AE49F73FB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Dec 2024 06:38:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 80B701892950
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Dec 2024 05:38:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C29421660D;
	Thu, 19 Dec 2024 05:37:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="TXsXHTEZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D899E2165F8
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Dec 2024 05:37:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734586663; cv=none; b=R+3n/hyIkc/IuAPfgJuFTbA7K7i2OkFNWThBut3Em84uykQI7xLtfGni6rAsiQ5hhDlq0IRqsRu93ME1ZXTlltdcB58PvcoEw9fN+82WOFqGFJDFx5op0IRmlmP7zP1/5FJLYCqyO9bSZ1F1HqbVWEBpoPdXFm2jVLW3JmVw6vE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734586663; c=relaxed/simple;
	bh=dMFCoKl8j4FH/8eXlAGGgiy7+lrqgUrPx0Dr/aA22A4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hvDkWcLZ0bbtOaoCiWqE86W0baSyhgHoKOiqrtkAzvQf/0/Dn4KEgxaRSuQSr2ZdIqO9P5619u1QXMaUZh80uw0YHs+LCToQZAnpCurs/8rTj5qgD4H+JoX3ulcLup1dyqNZrE7peo9Ij8TnGu7UDvsQA64kudE52h66icaifII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=TXsXHTEZ; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-2ee8aa26415so356143a91.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Dec 2024 21:37:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1734586661; x=1735191461; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5Wn3NJnLnCIIAi7YjcEiBCUAPAzdJ5Obb2vhkb7cmKA=;
        b=TXsXHTEZz+8i8rlCA6mEodWfZgp7sekmG6yUql24RbmXIgWQ8PNMVpyPAEkouV16XM
         fCc0JgwHvWfcyy9uQj2Fw9rNNTSZ3vwZufvR+apV9z58U3GvnjwgeRzyek48BG0zjoa5
         8LvBBDcR9lv2v+byxz/ZlF4tPwJl/By0R54lo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734586661; x=1735191461;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5Wn3NJnLnCIIAi7YjcEiBCUAPAzdJ5Obb2vhkb7cmKA=;
        b=sAt2iafgM//Oma8dN9OnjL2jWX6EhDWHKZOUdg0GKHMgdMNmcXvfat9axq3/FsdxyU
         qWIR5OfSUYrjCLGvF55Rts3GPqLhasm42qwtP2rPHdhTgjM1Frui/5Ne1ff3dvYouwqY
         74RSgwDCFemK95acdey17AqlK7vyBMYscU1rzB5BOJgpFFnww5xr6fiTe3i/q5zCiZV/
         7bZ35w06Yse1/WjXTK+AUjLvt8/ofMR10DO5Eg0Govw4NyGHO2XBTRZ3FM4hiRzavoz3
         wMGSwnkmaHjgBUaQV+wH1MHmAFAd37GKy2buOVqcJFD7RuyI0eBLfB4upE6UBmMo+oxp
         Vacw==
X-Forwarded-Encrypted: i=1; AJvYcCUpCr22SV3m8/Imq2aW5xYCa5vGbColMI+ZcMJeEruC3ZhctnrxBnl/63393uq4208UoQq3JuEa7coqSlm+@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9wRHBY7UXxuTrOM/BfASfXMapTRF8jCjYoLLjSJd6xSSjQDwH
	b5g7xSjiHaL0vY2cLCCccDTbsNweR80F0y7XHbNgSnDBcUc0K26My9M5Qrs56Q==
X-Gm-Gg: ASbGncsgfil5Ud6GSyC2rivmOs1WwEDs1DRwbxpX0aciyE9yY9kH6Ro4LWilNLH/lqJ
	JmWlQuIsm194/khDAjtGvKO0RBGnQJvI77n90n/Yw3ya70T4RfsKrAZR3n3S2smsqnnrIDu0uHz
	zDkblVBWh/1mxdpfZwHcBkBHcdpo1eYwoC0riWCEkdmF4DgRkw8+tvAGha1aivKEKK2zzeQx4A9
	KWJfynnZyggev7uv47p22HzV8qrgqVK7xT6K42raIpnVLjJErno/rCYQMA=
X-Google-Smtp-Source: AGHT+IEdvG+uasdZ1W4PcxNqxIKk8BfTf425UpPmgcIcIOiA1ibN8Q8K9PclAPCzYtQpJKJ0kK7ElQ==
X-Received: by 2002:a17:90b:1b48:b0:2ee:c9b6:c267 with SMTP id 98e67ed59e1d1-2f2e91e1183mr8717990a91.9.1734586661136;
        Wed, 18 Dec 2024 21:37:41 -0800 (PST)
Received: from localhost ([2401:fa00:8f:203:5479:11c3:e91d:de6b])
        by smtp.gmail.com with UTF8SMTPSA id 98e67ed59e1d1-2f4478ac7dbsm444615a91.50.2024.12.18.21.37.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Dec 2024 21:37:40 -0800 (PST)
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
	Vikash Garodia <quic_vgarodia@quicinc.com>,
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Cc: Hans Verkuil <hverkuil@xs4all.nl>,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	stable@vger.kernel.org
Subject: [PATCHv2] media: venc: destroy hfi session after m2m_ctx release
Date: Thu, 19 Dec 2024 14:37:08 +0900
Message-ID: <20241219053734.588145-1-senozhatsky@chromium.org>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
In-Reply-To: <20241219033345.559196-1-senozhatsky@chromium.org>
References: <20241219033345.559196-1-senozhatsky@chromium.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This partially reverts commit that made hfi_session_destroy()
the first step of vdec/venc close().  The reason being is a
regression report when, supposedly, encode/decoder is closed
with still active streaming (no ->stop_streaming() call before
close()) and pending pkts, so isr_thread cannot find instance
and fails to process those pending pkts.  This was the idea
behind the original patch - make it impossible to use instance
under destruction, because this is racy, but apparently there
are uses cases that depend on that unsafe pattern.  Return to
the old (unsafe) behaviour for the time being (until a better
fix is found).

Fixes: 45b1a1b348ec ("media: venus: sync with threaded IRQ during inst destruction")
Cc: stable@vger.kernel.org
Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
---
 drivers/media/platform/qcom/venus/core.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
index 2d27c5167246..807487a1f536 100644
--- a/drivers/media/platform/qcom/venus/core.c
+++ b/drivers/media/platform/qcom/venus/core.c
@@ -506,18 +506,14 @@ static __maybe_unused int venus_runtime_suspend(struct device *dev)
 void venus_close_common(struct venus_inst *inst)
 {
 	/*
-	 * First, remove the inst from the ->instances list, so that
-	 * to_instance() will return NULL.
-	 */
-	hfi_session_destroy(inst);
-	/*
-	 * Second, make sure we don't have IRQ/IRQ-thread currently running
+	 * Make sure we don't have IRQ/IRQ-thread currently running
 	 * or pending execution, which would race with the inst destruction.
 	 */
 	synchronize_irq(inst->core->irq);
 
 	v4l2_m2m_ctx_release(inst->m2m_ctx);
 	v4l2_m2m_release(inst->m2m_dev);
+	hfi_session_destroy(inst);
 	v4l2_fh_del(&inst->fh);
 	v4l2_fh_exit(&inst->fh);
 	v4l2_ctrl_handler_free(&inst->ctrl_handler);
-- 
2.47.1.613.gc27f4b7a9f-goog


