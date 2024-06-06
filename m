Return-Path: <linux-arm-msm+bounces-21934-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EEAF58FE77B
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Jun 2024 15:18:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7A1BE2858F9
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Jun 2024 13:18:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B621196DB7;
	Thu,  6 Jun 2024 13:17:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="UkKa/XJl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF25F196C7D
	for <linux-arm-msm@vger.kernel.org>; Thu,  6 Jun 2024 13:17:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717679857; cv=none; b=O/H7QY/5uQ1gSuisUl3r0gafZAyBYYQxVvwOntNqtUPJA5KDSJgSoArKjsunsnK2qQQuDd8CTkZbmWWz0WOtsRO8jAO1K+T79Zi1s+aleTrurNuR786Vf6tuI+pAmvQ828TxhP/V7DHh7HLRKfOHO94to/1het0v2fi3Sr/2Im0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717679857; c=relaxed/simple;
	bh=q/yIjMSqnXj8v7L7GkQC3K27otk7HPW5heUqxBmLTVc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=isX+32bpoAs/KtLyeMv+GswDxC/Kn3tVhWhKsq3p5Xe4zKQZSE+DsitaNC/kRqCpi3s3WTsSW0ue6jEytsFCjH2FjTgQHCZ+WzHkkQ/MtjA1KxOSvUE6n1qQj02ENKdbl29oyBYOsqOaEroN35FKotAQQ+wlXaksh8b+UyYR/mY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=UkKa/XJl; arc=none smtp.client-ip=209.85.219.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-6af27d0c9f8so4471516d6.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Jun 2024 06:17:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1717679855; x=1718284655; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e2AAUOSqY0VuuUiDfECnNkpzmbnAcXOGiikRuWRSAa4=;
        b=UkKa/XJlLcI5Ssyawo/sbucMPb9oT0FmCygLPm740rx/AcjqYX++l6CaF6nYEkSLZ4
         CyxYLm0jWtaboiQXA4KL+w62uvipVV1pstDxFK/us1gRV12IDaLlj8k1OqSp3MWfu8nv
         Q4WdCbzl9rY85sr8hcO18Mq/E5nB1v0P46+RI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717679855; x=1718284655;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e2AAUOSqY0VuuUiDfECnNkpzmbnAcXOGiikRuWRSAa4=;
        b=LCz0v0XjuDLFB0rpyEnX/ztGAdaW9Z5QUty1ick/SZAYVdX9w/30x7P/KiYJBm/4nY
         xO/UU6keQobNrP93/WydoogyvS/Ukko2l6fZPKSfZCrZBDphjLTkErUp06L2vGsiqwH8
         AzOiqdmiTZxxW1bKtsDqZ4WQR18JkTjhumiXP49S4YhJcUe/fMCqb1xP1Gk/xIV2vhG0
         WBsi7OnMNWJNL6vOzSwnMJbd0RQlo/BQN2EpKxb3ao6dEHhZ2+A/sM08+0sRzf2XbuW2
         06foCTEl4pTABgQixI0a6hxnId7rEGRXI/nQqYADWCGyMT95rMFMkxaNQI4kA9oSQ79C
         YxnA==
X-Forwarded-Encrypted: i=1; AJvYcCUYTKso8Wjkq9zNi7ZpyPvVLAP/cHwNeDAkUzjUYjZ9//RUFxzuXDL2EKDjWamU6PRqM3kCpCh/IHVWpt5GnI0aTOdda7qC/o5nRamHGQ==
X-Gm-Message-State: AOJu0YzKj/kbeO6ZeeGL30iQ0u8nWdHVILrBBYfKYyhsOrqeBZqMa9Qk
	eyKgIu38p52q2TDSH3mGL1i74qoOlSgob3b4FTUajern3tlruNaPWv3JCz14lg==
X-Google-Smtp-Source: AGHT+IF2SHvoVvYn/P2leNQvN1o8bRfjg6tCknHvek81SGWfjCxGxX7kcfXDgqQa2sakPR4YvGy8vg==
X-Received: by 2002:a05:6214:3d8b:b0:6a9:b253:58d5 with SMTP id 6a1803df08f44-6b02bf1eb0amr54587866d6.17.1717679854725;
        Thu, 06 Jun 2024 06:17:34 -0700 (PDT)
Received: from denia.c.googlers.com (123.178.145.34.bc.googleusercontent.com. [34.145.178.123])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6b04f6607f5sm6118036d6.31.2024.06.06.06.17.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jun 2024 06:17:34 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Thu, 06 Jun 2024 13:16:39 +0000
Subject: [PATCH v4 05/11] media: venus: Refactor struct
 hfi_session_get_property_pkt
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240606-cocci-flexarray-v4-5-3379ee5eed28@chromium.org>
References: <20240606-cocci-flexarray-v4-0-3379ee5eed28@chromium.org>
In-Reply-To: <20240606-cocci-flexarray-v4-0-3379ee5eed28@chromium.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, 
 Vikash Garodia <quic_vgarodia@quicinc.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
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
2.45.2.505.gda0bf45e8d-goog


