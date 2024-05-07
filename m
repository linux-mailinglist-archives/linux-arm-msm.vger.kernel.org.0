Return-Path: <linux-arm-msm+bounces-19374-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C7F9A8BE8FF
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 May 2024 18:31:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0265FB2A7CA
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 May 2024 16:30:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9224D16F288;
	Tue,  7 May 2024 16:27:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="K+IC5bPN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1AEA16EC0B
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 May 2024 16:27:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715099242; cv=none; b=uIXo1j09yjl7UFeckn+lg1VgLVuyMwOj0wF7C0EOpvcA7TmJo5ZFWzRi8ARqNBK0iG2ATd3oVrL3DfGJ+GjqAD6XtwZ+LaWV8EilWyRTgrCu+BfEI8TznqPcdQkFimMV94fiyq7O/oK5j+XoIxIqs7eGakDAxNNkFxf7FQ3CqIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715099242; c=relaxed/simple;
	bh=cqQiASSb1ke8R5KptOfAxJYuMrFDRm8Ouf7QBhfinuo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KXt5xhYtqzF0NUuUgtSp8kKy3uTDRf9EBtd/JNB68jK9xP4GlbgvzZxbv1FbOukx4+/b528mtqJPTSAc0Wi93fMHrchH+dOboGBhsaxQRqhveovTQr/qvppSUfOW9H/VjWvRR6N11UJSUodkI/UI+U61nPY0zZSDIamzY6hoV1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=K+IC5bPN; arc=none smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-43d3a33d41dso19517311cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 May 2024 09:27:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1715099240; x=1715704040; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1Dzq1v7dj+VBVNk1zZzFNzIZj2cxfHYcizI+MBp1ZX8=;
        b=K+IC5bPNXCf9EbQsDCio0EEQQ89Rl0AWp3jW1km2IZUxiUzR8r6nK9t7wN6MSD6rN2
         l75dvH1kZ2ikOphpShYOXCg4CRUGX763J/Czqm9bP8USGvETq2MdWWKBk0Ic7jvYVCBJ
         IGG3IO8dWU6mBHcszdzXe0t/FP8woipHBFIeg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715099240; x=1715704040;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1Dzq1v7dj+VBVNk1zZzFNzIZj2cxfHYcizI+MBp1ZX8=;
        b=mqoEGhsWKperiFYSyj5socexTeo21u34ko92Z16FcGM67lYmDtQtxlHWMcFVD9DvFR
         q02QySIByKglVx4EgMNI4INIyt9u+kpgq2D/b9DnlLOoTJ4YwmoW6OyqcP9yRFxGhumN
         /2HgGblJSz1Lk14ztU/XwFcuvm9uorD+uW42ikoxiRQYyUVumMzM5WNZLE3RDSJeoP90
         JdG4cac6oFfCWlrwANszvOzUIQHs0e22606F04hXiVjV8xjusiE1KwHblPTSKEpnIR3W
         +LnfHMNkIsEh9Dr5IvTHN+g1p9Po6TQaW11wfcPj0WOQssCW1NiNRlJmMxTUXtziMmkA
         zJzA==
X-Forwarded-Encrypted: i=1; AJvYcCWirfwCU3u8++aBMSgV3oreYYWJ0Yyh1nxFf3u+UaEHlRMgd2R65HcgySz8OcFDrc8CyUF54WfyoxZ96ej9usHwwdY+hKoPRsMNI0GjTw==
X-Gm-Message-State: AOJu0YyytKhTa2baXd3to9aforKs24SIOZcXq7vHIwAKrAOKxb9/tTkt
	KYuQdCAEwLNW/X1B/oAKO3No9BgTuZFO4o70alvAkJ47TxsrDfmLcPrSbCSY0g==
X-Google-Smtp-Source: AGHT+IHXb5fqM0+WhwYErzB4YNZEKLztS54+R7oGh+gtQ5dv4ZRmegXN7RcfrH/DsD9yhahUSJeC+w==
X-Received: by 2002:a05:622a:50a:b0:43a:829b:a32f with SMTP id d75a77b69052e-43dbf754b18mr1904941cf.66.1715099239735;
        Tue, 07 May 2024 09:27:19 -0700 (PDT)
Received: from denia.c.googlers.com (114.152.245.35.bc.googleusercontent.com. [35.245.152.114])
        by smtp.gmail.com with ESMTPSA id hf23-20020a05622a609700b0043d1fc9b7d9sm4160597qtb.48.2024.05.07.09.27.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 May 2024 09:27:19 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 07 May 2024 16:27:17 +0000
Subject: [PATCH v2 12/18] media: venus: Refactor struct
 hfi_session_get_property_pkt
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240507-cocci-flexarray-v2-12-7aea262cf065@chromium.org>
References: <20240507-cocci-flexarray-v2-0-7aea262cf065@chromium.org>
In-Reply-To: <20240507-cocci-flexarray-v2-0-7aea262cf065@chromium.org>
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

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/platform/qcom/venus/hfi_cmds.c | 8 ++++----
 drivers/media/platform/qcom/venus/hfi_cmds.h | 4 ++--
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/hfi_cmds.c b/drivers/media/platform/qcom/venus/hfi_cmds.c
index 3418d2dd9371..520ff8a587e6 100644
--- a/drivers/media/platform/qcom/venus/hfi_cmds.c
+++ b/drivers/media/platform/qcom/venus/hfi_cmds.c
@@ -401,8 +401,8 @@ static int pkt_session_get_property_1x(struct hfi_session_get_property_pkt *pkt,
 	pkt->shdr.hdr.size = sizeof(*pkt);
 	pkt->shdr.hdr.pkt_type = HFI_CMD_SESSION_GET_PROPERTY;
 	pkt->shdr.session_id = hash32_ptr(cookie);
-	pkt->num_properties = 1;
-	pkt->data[0] = ptype;
+	pkt->one = 1;
+	pkt->data = ptype;
 
 	return 0;
 }
@@ -1106,11 +1106,11 @@ pkt_session_get_property_3xx(struct hfi_session_get_property_pkt *pkt,
 	pkt->shdr.hdr.size = sizeof(struct hfi_session_get_property_pkt);
 	pkt->shdr.hdr.pkt_type = HFI_CMD_SESSION_GET_PROPERTY;
 	pkt->shdr.session_id = hash32_ptr(cookie);
-	pkt->num_properties = 1;
+	pkt->one = 1;
 
 	switch (ptype) {
 	case HFI_PROPERTY_CONFIG_VDEC_ENTROPY:
-		pkt->data[0] = HFI_PROPERTY_CONFIG_VDEC_ENTROPY;
+		pkt->data = HFI_PROPERTY_CONFIG_VDEC_ENTROPY;
 		break;
 	default:
 		ret = pkt_session_get_property_1x(pkt, cookie, ptype);
diff --git a/drivers/media/platform/qcom/venus/hfi_cmds.h b/drivers/media/platform/qcom/venus/hfi_cmds.h
index 6dff949c4402..e1dd0ea2be1a 100644
--- a/drivers/media/platform/qcom/venus/hfi_cmds.h
+++ b/drivers/media/platform/qcom/venus/hfi_cmds.h
@@ -190,8 +190,8 @@ struct hfi_session_resume_pkt {
 
 struct hfi_session_get_property_pkt {
 	struct hfi_session_hdr_pkt shdr;
-	u32 num_properties;
-	u32 data[1];
+	u32 one;
+	u32 data;
 };
 
 struct hfi_session_release_buffer_pkt {

-- 
2.45.0.rc1.225.g2a3ae87e7f-goog


