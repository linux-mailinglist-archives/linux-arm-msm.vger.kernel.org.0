Return-Path: <linux-arm-msm+bounces-106808-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AL07JZtVAGp5GQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106808-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 10 May 2026 11:53:31 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id F1B5B50379C
	for <lists+linux-arm-msm@lfdr.de>; Sun, 10 May 2026 11:53:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 48B10301AD2D
	for <lists+linux-arm-msm@lfdr.de>; Sun, 10 May 2026 09:48:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 918EA37C0F6;
	Sun, 10 May 2026 09:48:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FToPpjRm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40E3837CD20
	for <linux-arm-msm@vger.kernel.org>; Sun, 10 May 2026 09:48:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778406499; cv=none; b=RyPMIMaxkGTeeZhVYs95U+UC5s2Ls2dIM/WNmmE62SCzsHFNBR0NXlTeqlBpk+STtXcCi7AeZWd8eO41aBli3j489cTK5AxKzzd4BsmPnDQUsOpUhOOmUcr/Jn4YKJ5VKW94uMk2UGud+A+1JiCrRxlnR2Ygpu3rf3NCtHPD7n8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778406499; c=relaxed/simple;
	bh=oPx+TYWEbOLSoB6gl8GiiVCXJsV3cGiWKVqM3xR9UtE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kISxoIin8F/EYL7oRGUCi9xTkVaZmg5B7548IEY2o2X2nzTeoiw5MskDThHWQ8EcOef70UiKf1Y0pNxs95sVWTuXXWWvZXNSXw4EBmGKlZy73TJAv6pT5vNo3fO2t9+ekLSEJrgQy7/WxOqXMSnnHbXbAVRu965glHPDXjL8/PA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FToPpjRm; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-488b0e1b870so56170505e9.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 10 May 2026 02:48:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778406492; x=1779011292; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y+ZA0O5WYutVBzNDlZS1hqQyKCHJ3cdUiG33N7QKPgQ=;
        b=FToPpjRm4RG+zsaGViYBOCvdo2+0SXHSbBAleSZ2kQyCB2yac72sRj07vVMsyJqIDl
         Go8ZubrjIwoGCm6/SPjgs7lo/T5z3cCgYmEix0dWTV1bc766tNJqpLzYJ1h6D+vnscK2
         79tb5DObwslWUk3+oRFLwsldEMiVUJ+lLxPikurtOlCXxL3fvs4U0NL/0ljpOxv2vMIv
         KNXjcL+s8ml2G/OO8G1OafDfZR7UzNDuxFzoKDWm2K0kV+HULejHtsgsTWfX3SuA+4Pe
         A2sGn4uTLfp6NrXrukjlfxMpg44jMl3wkSmMQxKHdiL5A8mliDyf+04pJSwkY/aBve3h
         ZHHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778406492; x=1779011292;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Y+ZA0O5WYutVBzNDlZS1hqQyKCHJ3cdUiG33N7QKPgQ=;
        b=mmi7p8hnM1lhrAaJMkniQLT4OCxnqqf5o5M8QsAOt4NMyaq2c8OFuvTFYI3bMZ4Tit
         /pTS+lCY+Dlg2kkU5r4Y/rqmM8421jTcgJZ8+bLot8CASBgrnvMZpGXex50Uj9MdvTEo
         SgIC/n314iYsuGTitWSo1yNk1d8i6O/XKhZcf0c6Ete1PHShnOWlI6yEpkgkR+LHtZs1
         HFnViDBlMo0IHIhJeVddQ5PZhzPfTxLlsToV1nIVa4oCNwplfVJdinA9wlrNTUCcoln5
         VyUG5Qs7bZukrRcfhCi57q9/OOV9uOwzKjYizaIzfq0dn5BdOsSKvtKXprkhJlft863D
         1f/A==
X-Forwarded-Encrypted: i=1; AFNElJ+Dcpx/snkD27bkGx9jm95kxc9mkRC7L6nvS/VacZZClf70bxgxNjfbarlNyJIAB2kZTM2qdJ+JoyXrE5LV@vger.kernel.org
X-Gm-Message-State: AOJu0YwisbZpGoiGfu9MFzMxXn+psH6TzNaLzoGjdeqGWVUioCdQEs2Q
	ow90r5b4xWtPxPXkfIRt0iZUX02eTKFtZs8MaDM+mytUCoZBL+U42hLw
X-Gm-Gg: Acq92OH4m675gfsXjgXEE2u/yBINaWpW9cIR5j2x+B7k/vOIBLvBzo+Gd6LGxyRFTWy
	kNCWoVzLWOT9PESu53NDI9axio1JJQeFSld9uHaEb5dWcc6EdMVKEDhOaagG8ct92s8q+w16C+R
	/KJgcFeQReITPwmkCCziwPI3e7LNmf5MtNyhu7MLZvVnZb3S1ect2JNFNhLQvWLWIRa7PzL2ejl
	xZlQal6dpbQIuWf6+XnO1s36CvK60ac0PYv7WER6fzHnhPRm21sP/k2u/kAv/1CmFyDUcD4S+18
	KFlveIKjKvJ3tvqoldfFUQeL/pKRrBzjw0CIW/x7qHaXLNzXnY5YMalHGeWd+6AL4CPJ8uTs1Rj
	Y8/11qtWWdiDO+R2efuBJTtR+h8Mo2sXop0FRxZzsSjx4mkRW51N/4bATMj+/qaJoWNooNQEAKD
	1YMXqSf8Lve4gshv9pA8m7m91e/MHE
X-Received: by 2002:a05:600c:4ba6:b0:488:a882:c7 with SMTP id 5b1f17b1804b1-48e51f4bab4mr180086765e9.25.1778406491652;
        Sun, 10 May 2026 02:48:11 -0700 (PDT)
Received: from [192.168.8.79] ([2a00:f502:160:4e2:a099:cad9:2ecd:93de])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e702e0bf2sm182807925e9.4.2026.05.10.02.48.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 May 2026 02:48:11 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Sun, 10 May 2026 12:47:46 +0300
Subject: [PATCH v6 8/8] media: qcom: venus: add codec blacklist mechanism
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260510-msm8939-venus-rfc-v6-8-e69465375900@gmail.com>
References: <20260510-msm8939-venus-rfc-v6-0-e69465375900@gmail.com>
In-Reply-To: <20260510-msm8939-venus-rfc-v6-0-e69465375900@gmail.com>
To: Bryan O'Donoghue <bod@kernel.org>, 
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org, Erikas Bitovtas <xerikasxx@gmail.com>
X-Mailer: b4 0.15.2
X-Rspamd-Queue-Id: F1B5B50379C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-106808-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.sr.ht,gmail.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[21];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xerikasxx@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

Add decode and encode blacklist properties to allow disabling different
codecs per Venus device, instead of doing it per HFI version.

Despite using HFI version 1, MSM8939 supports HEVC decoding, therefore
it is not blacklisted. Add HEVC to the type converter function so it can
be recognized.

Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
---
 drivers/media/platform/qcom/venus/core.c       |  6 ++++++
 drivers/media/platform/qcom/venus/core.h       |  2 ++
 drivers/media/platform/qcom/venus/hfi_parser.c | 10 +++++-----
 3 files changed, 13 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
index 6ad20d58dda2..75cf63b452dd 100644
--- a/drivers/media/platform/qcom/venus/core.c
+++ b/drivers/media/platform/qcom/venus/core.c
@@ -178,6 +178,8 @@ static void venus_sys_error_handler(struct work_struct *work)
 static u32 to_v4l2_codec_type(u32 codec)
 {
 	switch (codec) {
+	case HFI_VIDEO_CODEC_HEVC:
+		return V4L2_PIX_FMT_HEVC;
 	case HFI_VIDEO_CODEC_H264:
 		return V4L2_PIX_FMT_H264;
 	case HFI_VIDEO_CODEC_H263:
@@ -684,6 +686,8 @@ static const struct venus_resources msm8916_res = {
 	.vmem_addr = 0,
 	.dma_mask = 0xddc00000 - 1,
 	.fwname = "qcom/venus-1.8/venus.mbn",
+	.dec_codec_blacklist = HFI_VIDEO_CODEC_HEVC | HFI_VIDEO_CODEC_SPARK,
+	.enc_codec_blacklist = HFI_VIDEO_CODEC_HEVC,
 	.dec_nodename = "video-decoder",
 	.enc_nodename = "video-encoder",
 };
@@ -724,6 +728,8 @@ static const struct venus_resources msm8939_res = {
 	.vmem_addr = 0,
 	.dma_mask = 0xddc00000 - 1,
 	.fwname = "qcom/venus-1.8/venus.mbn",
+	.dec_codec_blacklist = HFI_VIDEO_CODEC_SPARK,
+	.enc_codec_blacklist = HFI_VIDEO_CODEC_HEVC,
 	.dec_nodename = "video-decoder",
 	.enc_nodename = "video-encoder",
 };
diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
index 7506f5d0f609..514dfb99449c 100644
--- a/drivers/media/platform/qcom/venus/core.h
+++ b/drivers/media/platform/qcom/venus/core.h
@@ -84,6 +84,8 @@ struct venus_resources {
 	unsigned int vcodec_pmdomains_num;
 	const char **opp_pmdomain;
 	unsigned int vcodec_num;
+	const u32 dec_codec_blacklist;
+	const u32 enc_codec_blacklist;
 	const char * const resets[VIDC_RESETS_NUM_MAX];
 	unsigned int resets_num;
 	enum hfi_version hfi_version;
diff --git a/drivers/media/platform/qcom/venus/hfi_parser.c b/drivers/media/platform/qcom/venus/hfi_parser.c
index 92765f9c8873..8e762cf77968 100644
--- a/drivers/media/platform/qcom/venus/hfi_parser.c
+++ b/drivers/media/platform/qcom/venus/hfi_parser.c
@@ -206,11 +206,11 @@ static int parse_codecs(struct venus_core *core, void *data)
 	core->dec_codecs = codecs->dec_codecs;
 	core->enc_codecs = codecs->enc_codecs;
 
-	if (IS_V1(core)) {
-		core->dec_codecs &= ~HFI_VIDEO_CODEC_HEVC;
-		core->dec_codecs &= ~HFI_VIDEO_CODEC_SPARK;
-		core->enc_codecs &= ~HFI_VIDEO_CODEC_HEVC;
-	}
+	if (core->res->dec_codec_blacklist)
+		core->dec_codecs &= ~core->res->dec_codec_blacklist;
+
+	if (core->res->enc_codec_blacklist)
+		core->enc_codecs &= ~core->res->enc_codec_blacklist;
 
 	return sizeof(*codecs);
 }

-- 
2.54.0


