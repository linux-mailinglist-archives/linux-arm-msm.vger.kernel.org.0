Return-Path: <linux-arm-msm+bounces-20658-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 579628D0F23
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 May 2024 23:11:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8926F1C21547
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 May 2024 21:11:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C8B216C437;
	Mon, 27 May 2024 21:09:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="dhfcfbng"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E47DC16ABF2
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 May 2024 21:09:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716844149; cv=none; b=SPxGHBT7YYkTaVHKxbEDMgNypTJyuPb1+OC7EY7d5fVdY/GeyBw7PMvSYzTv7IzgkU4SjE+hcE8jPGc69JKVye7KTUv/e8yjrhs9S1twKfav3K25v9neaZDVF+3aH8VBL2pUXPEYNkiVBJ0TCubdUfyBkfKB6UiJ/nnyhs/RCBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716844149; c=relaxed/simple;
	bh=SkYzkaG0dYFUzqixrUpSplhPbKC3wytiTj/w+GTRMzE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=i1ZDyy5x7iW2dbt77kwQg0ZdL2zhSwuwq5t0rrpEv9253n+j8MRcSezJOJgMxkIwenmfiKrATZgki61XOp/xScED7eAppiIPvTBT9ss0aTeHV7IfoEx7iiZkbTKy46Z3kQokN8QDCt5jC7F1/BKdkB67IOBnFesQCmRx3tzPMio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=dhfcfbng; arc=none smtp.client-ip=209.85.167.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-3d19dfb3dceso103410b6e.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 May 2024 14:09:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1716844147; x=1717448947; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wbbB0QGbRD56aYsaD+Y+ZEPd95SUig7FuxMvDlZcWEM=;
        b=dhfcfbngqy3w7ZU6o0dA7/r0jv2M6iVSPLaa+2fDViiuo2A8b+eeSWEX3hVJMLjnLV
         cCZ7AyecobAJdsIspop+ywAs/NgrJo7xowUm1QJwYpFNEIrRBBqbrnH6OwyPkLpyQfpu
         9vm3+RVjW7n1z1vJmjf2qIxWaVWPwKBNeumgM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716844147; x=1717448947;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wbbB0QGbRD56aYsaD+Y+ZEPd95SUig7FuxMvDlZcWEM=;
        b=s3lDcwEssWL+72fh2uSB5t41WkE/kDbhlATcul3WkiECEeVME75GCjpghcoDN0f1Ui
         b/YHRN8sSMmVIqYqS9bfbPWazfwCJ0mMUiorhPQFSsh+3DhDrWssBlAu9O4ow4oD4rf5
         2BcI5JRNik0FbzTh+rsQHnQLTThb3tCQs44FBZRHc1Jx/0z3lFD5pqr1j8rf/qhqgMWO
         EUCjrmFgUcDNcHlLAGnBjDCx7Gg9v9ZfM7uF6WVFpZJ9cLh/ructbl2KFnkXsNdRdU2Y
         cnBVzmXKmkYRd2BbhhKsP3YgU6YG8+tTBO05dz3PlbG+Pw1RqIZrM2a76MF4BqLSMgBV
         Uspg==
X-Forwarded-Encrypted: i=1; AJvYcCU2p8j1bmN0CT5Xst3Fp2oEGkETljVIj4hjffHz1giWzV54pfDvJu40KVlYSARLnWGxBnTzyRPAyNBFwmAHd7aSjsriiTjrhYiTYUjF9w==
X-Gm-Message-State: AOJu0Yy2KSV3K1UijD/BTNDsrLyxFqPDtlyeMfAnziBz8SHjvYKl7j+l
	VAwn67rTXwtiHgU4uxScvuSDb10VPHv+XhvETm3I6+b7ODQalRGDlwu9uEmcJQ==
X-Google-Smtp-Source: AGHT+IEnIyO0WIHMxuiEtYRurphYM/ASsB5F423fmVs+Mw1AhNj6jPPmJvmyuQNG+kiC5cStpK/OGg==
X-Received: by 2002:a54:449a:0:b0:3c9:7a7b:a7cd with SMTP id 5614622812f47-3d1a91908d4mr10056024b6e.51.1716844147133;
        Mon, 27 May 2024 14:09:07 -0700 (PDT)
Received: from denia.c.googlers.com (125.135.86.34.bc.googleusercontent.com. [34.86.135.125])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6ad850a6dc7sm9511866d6.93.2024.05.27.14.09.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 May 2024 14:09:06 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 27 May 2024 21:09:02 +0000
Subject: [PATCH v3 12/18] media: venus: Refactor struct
 hfi_session_get_property_pkt
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240527-cocci-flexarray-v3-12-cda09c535816@chromium.org>
References: <20240527-cocci-flexarray-v3-0-cda09c535816@chromium.org>
In-Reply-To: <20240527-cocci-flexarray-v3-0-cda09c535816@chromium.org>
To: Michael Tretter <m.tretter@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Michal Simek <michal.simek@amd.com>, Andy Walls <awalls@md.metrocast.net>, 
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, 
 Vikash Garodia <quic_vgarodia@quicinc.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.12.4

The struct hfi_session_get_property_pkt is always used to fectch a
single property. Make that explicit in the code and avoid a single
element array at the end of the struct.

This change fixes the following cocci warning:
drivers/media/platform/qcom/venus/hfi_cmds.h:194:5-9: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/platform/qcom/venus/hfi_cmds.c | 4 ++--
 drivers/media/platform/qcom/venus/hfi_cmds.h | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/hfi_cmds.c b/drivers/media/platform/qcom/venus/hfi_cmds.c
index 3418d2dd9371..75f4a3d3e748 100644
--- a/drivers/media/platform/qcom/venus/hfi_cmds.c
+++ b/drivers/media/platform/qcom/venus/hfi_cmds.c
@@ -402,7 +402,7 @@ static int pkt_session_get_property_1x(struct hfi_session_get_property_pkt *pkt,
 	pkt->shdr.hdr.pkt_type = HFI_CMD_SESSION_GET_PROPERTY;
 	pkt->shdr.session_id = hash32_ptr(cookie);
 	pkt->num_properties = 1;
-	pkt->data[0] = ptype;
+	pkt->data = ptype;
 
 	return 0;
 }
@@ -1110,7 +1110,7 @@ pkt_session_get_property_3xx(struct hfi_session_get_property_pkt *pkt,
 
 	switch (ptype) {
 	case HFI_PROPERTY_CONFIG_VDEC_ENTROPY:
-		pkt->data[0] = HFI_PROPERTY_CONFIG_VDEC_ENTROPY;
+		pkt->data = HFI_PROPERTY_CONFIG_VDEC_ENTROPY;
 		break;
 	default:
 		ret = pkt_session_get_property_1x(pkt, cookie, ptype);
diff --git a/drivers/media/platform/qcom/venus/hfi_cmds.h b/drivers/media/platform/qcom/venus/hfi_cmds.h
index 6dff949c4402..f5708fdfb197 100644
--- a/drivers/media/platform/qcom/venus/hfi_cmds.h
+++ b/drivers/media/platform/qcom/venus/hfi_cmds.h
@@ -191,7 +191,7 @@ struct hfi_session_resume_pkt {
 struct hfi_session_get_property_pkt {
 	struct hfi_session_hdr_pkt shdr;
 	u32 num_properties;
-	u32 data[1];
+	u32 data;
 };
 
 struct hfi_session_release_buffer_pkt {

-- 
2.45.1.288.g0e0cd299f1-goog


