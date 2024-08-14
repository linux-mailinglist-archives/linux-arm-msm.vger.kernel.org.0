Return-Path: <linux-arm-msm+bounces-28563-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 01A9E952552
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Aug 2024 00:14:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A230C1F22303
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Aug 2024 22:14:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4822E149C61;
	Wed, 14 Aug 2024 22:14:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="QJ4rGgLN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A334149C46
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Aug 2024 22:14:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723673658; cv=none; b=BczvkA8Uuzj6dn29Z0MrF24E1KYa1OuVUtKmYbJCH09k1QlXCsGTzO05W+SEiXO1y+558to3QESnliLpgXW4gzvAMZ1VpLnee018MqMbfwusyFrTbaswqtm36mz+BqgS9wu7Ud7gtgVsqdRU9GU+JflfB05Zr2ywdRFmphrwPBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723673658; c=relaxed/simple;
	bh=8gV0ItKrwqYDT8zD5KqT8goQykbTT6iJU2la2paZJck=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tS3hvrmHcvld1ATjyWEt31p8EJ2go7UJsYhfhiBiBJdVjMyojGDmJP0pKd4iH4gtMWwO3wISyo03yq2zQrM0zSXyc+feq2juM/jq45O6Z0/9VuTf3l2NNHzvJShbNxOfGdJX2iH9obNdrtqljBvkoeeSoKk6MPNzeDT22dq8rE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=QJ4rGgLN; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-201e64607a5so2487735ad.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Aug 2024 15:14:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1723673655; x=1724278455; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EXHXVreezWNC5EHxJgjqT1mvVrC/aYQyKnBr40aFpQA=;
        b=QJ4rGgLNsP2HfzxSxzDmW4ZRtC/RPpF/olWsIC7au7j3oYQrc00rQckCUK+qGyq/HC
         2ekXkKlDcOC2vale51Ip/clnEZiXtSzGY4wAc3QjQ4lRe8E+1xMFbRx1fkzymkv1Ahkr
         g//HyasKlTxBUgnLloExSa6Apz/fxnMCA8w2k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723673655; x=1724278455;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EXHXVreezWNC5EHxJgjqT1mvVrC/aYQyKnBr40aFpQA=;
        b=fNSekBd5EpMd2Pn55PmDNsC8H1YUH1Ty2OaWH+cOFCYReE7eEHYliFWWj3fAJ3Mp1a
         flpUJJnNU0aXBdOlxHWBvQjGWJQxe6Yj4pR2i2Qvx274oQTZN/FMXIjALTSzoVLaV+f/
         RdOPG3/8ER2/LWfajCr/k6FqF418NpxyXIWszkKt/tFhFlaKLjSmjaSRyoRMToOByXCA
         uIEV9oy9Z2KEwdwx44pJAPxOEjXtwzwsTGScCuZxnxpFVs4J76+6pDw6RaKayvE+RPNX
         NYvQNK02k1D1s7Fmvstx29uhVTCZMXHWp2Fy/gYGCCuPgu6Dt/ZQiHg//mrX/dJlib1u
         rOBQ==
X-Forwarded-Encrypted: i=1; AJvYcCX0fbb7UYV/1Sb2c7qt8QhgPUrYdazLAYuCEsC0gQWNJ00851Aje/VzjYwvQ9nI2m8EYPv/PVaSoaCDFzZ9cUdce/QH1uJc/kzAAlveLA==
X-Gm-Message-State: AOJu0Yzbc6Z2k9WwEATE1T9P89H+Hh0faJOBYuLrGXFzOiaW2Nxvd3Id
	R9tE9kBijjyxU0qUKbnCvua5yEoQ66G+638KrW+ldEtNp3fQBe9BHzw8btzINg==
X-Google-Smtp-Source: AGHT+IG1dLi1vpHge3g4ia/y7OQ39uKNyxTgRTDNKEiBk3r+oe9MbbtSjtb2Ij3jgSmwRLV8Zw3NBQ==
X-Received: by 2002:a17:903:244e:b0:1fa:8f64:8b0d with SMTP id d9443c01a7336-201d63b3eb8mr58544065ad.4.1723673655410;
        Wed, 14 Aug 2024 15:14:15 -0700 (PDT)
Received: from zipper.pdx.corp.google.com ([2a00:79e0:2e13:6:aab8:3da7:4601:820d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-201f0375725sm1046595ad.132.2024.08.14.15.14.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Aug 2024 15:14:14 -0700 (PDT)
From: Fritz Koenig <frkoenig@chromium.org>
Date: Wed, 14 Aug 2024 15:14:04 -0700
Subject: [PATCH v3 1/2] media: venus: Helper function for dynamically
 updating bitrate
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240814-submit-v3-1-f7d05e3e8560@chromium.org>
References: <20240814-submit-v3-0-f7d05e3e8560@chromium.org>
In-Reply-To: <20240814-submit-v3-0-f7d05e3e8560@chromium.org>
To: Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, 
 Vikash Garodia <quic_vgarodia@quicinc.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Dikshita Agarwal <quic_dikshita@quicinc.com>
Cc: Nathan Hebert <nhebert@chromium.org>, linux-media@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Fritz Koenig <frkoenig@chromium.org>
X-Mailer: b4 0.13.0

Move the dynamic bitrate updating functionality to a separate function
so that it can be shared.

No functionality changes.

Signed-off-by: Fritz Koenig <frkoenig@chromium.org>
---
 drivers/media/platform/qcom/venus/venc_ctrls.c | 34 +++++++++++++++-----------
 1 file changed, 20 insertions(+), 14 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/venc_ctrls.c b/drivers/media/platform/qcom/venus/venc_ctrls.c
index d9d2a293f3ef..3e1f6f26eddf 100644
--- a/drivers/media/platform/qcom/venus/venc_ctrls.c
+++ b/drivers/media/platform/qcom/venus/venc_ctrls.c
@@ -67,12 +67,28 @@ static int venc_calc_bpframes(u32 gop_size, u32 conseq_b, u32 *bf, u32 *pf)
 	return 0;
 }
 
+static int dynamic_bitrate_update(struct venus_inst *inst, u32 bitrate,
+				  u32 layer_id)
+{
+	int ret = 0;
+
+	mutex_lock(&inst->lock);
+	if (inst->streamon_out && inst->streamon_cap) {
+		u32 ptype = HFI_PROPERTY_CONFIG_VENC_TARGET_BITRATE;
+		struct hfi_bitrate brate = { .bitrate = bitrate, .layer_id = layer_id };
+
+		ret = hfi_session_set_property(inst, ptype, &brate);
+	}
+	mutex_unlock(&inst->lock);
+
+	return ret;
+}
+
 static int venc_op_s_ctrl(struct v4l2_ctrl *ctrl)
 {
 	struct venus_inst *inst = ctrl_to_inst(ctrl);
 	struct venc_controls *ctr = &inst->controls.enc;
 	struct hfi_enable en = { .enable = 1 };
-	struct hfi_bitrate brate;
 	struct hfi_ltr_use ltr_use;
 	struct hfi_ltr_mark ltr_mark;
 	u32 bframes;
@@ -85,19 +101,9 @@ static int venc_op_s_ctrl(struct v4l2_ctrl *ctrl)
 		break;
 	case V4L2_CID_MPEG_VIDEO_BITRATE:
 		ctr->bitrate = ctrl->val;
-		mutex_lock(&inst->lock);
-		if (inst->streamon_out && inst->streamon_cap) {
-			ptype = HFI_PROPERTY_CONFIG_VENC_TARGET_BITRATE;
-			brate.bitrate = ctr->bitrate;
-			brate.layer_id = 0;
-
-			ret = hfi_session_set_property(inst, ptype, &brate);
-			if (ret) {
-				mutex_unlock(&inst->lock);
-				return ret;
-			}
-		}
-		mutex_unlock(&inst->lock);
+		ret = dynamic_bitrate_update(inst, ctr->bitrate, 0);
+		if (ret)
+			return ret;
 		break;
 	case V4L2_CID_MPEG_VIDEO_BITRATE_PEAK:
 		ctr->bitrate_peak = ctrl->val;

-- 
2.46.0.184.g6999bdac58-goog


