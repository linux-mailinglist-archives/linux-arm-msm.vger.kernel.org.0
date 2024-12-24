Return-Path: <linux-arm-msm+bounces-43197-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BAAE39FBA2D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Dec 2024 08:25:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 492F1165876
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Dec 2024 07:25:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD92618FC70;
	Tue, 24 Dec 2024 07:24:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="JB/iyRvo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2445A18EFDE
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Dec 2024 07:24:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735025098; cv=none; b=UHJ2i9L6BYbSx2XD+r+TJRXzi/WueD0isUdWn9yWbkd/uOi5hXtpDawfURJXEGeXuxiN7BdSMq0J38KNJCvlr2iU5xm+AajznqpdP5nyWoyXfXnVTNgKhyfskc1OfQttxM31+Y33tJF5iHO/lMVt4Jt33qHB8ARO8XaJeamRU1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735025098; c=relaxed/simple;
	bh=9cZLG5L2vkdEDHKnH31YZBkU40Mvvp2J/3ooo59x45Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=c/XZgGF8Ll6boPOFju93Qdmdp3PyLDISajDInatgdhmXMrchBiIk51rDwWBGcwxgwEQRUeO8wGxq6CxNHb8mPmkWNRLzer/GE3kM18QUoM+53dOaOA+96Jk4rL5nNaOV0ss36p3Bw8tbGaS1ILnrDWuapJ6bVj4pqdM78c4e+S8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=JB/iyRvo; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-21644aca3a0so55870345ad.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Dec 2024 23:24:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1735025096; x=1735629896; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AE9nvfJslVj9qB/yCOxLUqgILFx3DJwfUeD0T7gDpl8=;
        b=JB/iyRvo9lcf0AJEefx2I49AOL80+IZ5EHaO8o+bsCBcOJvHOl2xdT/5KHUjWOOTT4
         fs4KPmi1M1JvNuaN6PlPVZCIkOYPjBcVoMpRGsffS/3yBXIcbXxnPhKOnnVZO1wTSlVj
         boKUGTExYAd003Cgpg2d/D8Gj3gngY1dmRNKs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735025096; x=1735629896;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AE9nvfJslVj9qB/yCOxLUqgILFx3DJwfUeD0T7gDpl8=;
        b=k9i2c26UI5gUxqOeb+GpDBjkyS5bkzGJDX6KC2e32C2p/LLLSSEKHdPc+NTJhiI1PO
         y7laFXb08pSkHz0isdiw9FQXuCw8Rczg2f/m2/F12vkzW6CYqe61z/apwS+CUKwzFboi
         Cc0YSkggej9Hb8o4cT5538zoUlanP1XIoVOf1Ze4Ln8MzlRtcBCLgjAgGUB869AqoKns
         zhdKIpOj4o17rN57ilB9baGHzH/wYlsCCtAVUh8fRFjsJ4/y+iEmzQCIcYHmZqVdIapZ
         2Ji+wAb3lrby4arODf4eT5VVXhE3jtyEstN3PxD9raR44puiPhpCUwmGXJFRXv7lCKhr
         yXEg==
X-Forwarded-Encrypted: i=1; AJvYcCUzdGkVgSEmCd2o9qa9rWLaDHvuixBunmG/GOmL1BP3GRsDU88MPez+/DOOARXtsup3L+XIg6Hts8LImQfe@vger.kernel.org
X-Gm-Message-State: AOJu0YzXPigexUWMABehZRXworYL2xu6Q8KiTjuV3ccxwUL2VdI+w9TR
	gLxA2rTJj/0YY7In8/0F8/yLSZL8FvzS1OntGxYSn4rDlcgHAFRNgLH52YRbSg==
X-Gm-Gg: ASbGnct/jZA3nod7ISmicXCWy5RBqta0XbX2HwCFzoWpatJIjM4i/oPQKw1pk8yxrh6
	L+YyYBvLBcgdmkRTGWDyaauQvRkpNE6FtoFvNHPMkvPHpX0g8R4jSc01GUU//KsJpWHV6uRxwKA
	FwFTjiSmld/Ew6efu3V19ZDDQ9gK3QahOwyid9c3J4IHXDoHHcMk2zZ6dSJcgiVYp1DfodLtnuS
	BEan+HfP/iKIQsFn0mOS55uxBEhvHg6RBW2b6OQb6ZD+0q40eGLmzfd6Qc=
X-Google-Smtp-Source: AGHT+IHKoKTL2NIALRxLrphqegLKe8K7HSq2hikZhf5VhPOyutofWJK6Rrh5cMHHc0VdChmeAIfuLw==
X-Received: by 2002:a17:902:ccc7:b0:215:94b0:9df4 with SMTP id d9443c01a7336-219e6f283aemr251758405ad.54.1735025096549;
        Mon, 23 Dec 2024 23:24:56 -0800 (PST)
Received: from localhost ([2401:fa00:8f:203:de21:da72:a349:25b2])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-219dca02b77sm84195355ad.242.2024.12.23.23.24.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Dec 2024 23:24:56 -0800 (PST)
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
	Vikash Garodia <quic_vgarodia@quicinc.com>,
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Hans Verkuil <hverkuil@xs4all.nl>,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	stable@vger.kernel.org,
	Nathan Hebert <nhebert@google.com>
Subject: [PATCHv3 1/2] media: venus: destroy hfi session after m2m_ctx release
Date: Tue, 24 Dec 2024 16:24:05 +0900
Message-ID: <20241224072444.2044956-2-senozhatsky@chromium.org>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
In-Reply-To: <20241224072444.2044956-1-senozhatsky@chromium.org>
References: <20241224072444.2044956-1-senozhatsky@chromium.org>
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

Fixes: 45b1a1b348ec1 ("media: venus: sync with threaded IRQ during inst destruction")
Cc: stable@vger.kernel.org
Reported-by: Nathan Hebert <nhebert@google.com>
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


