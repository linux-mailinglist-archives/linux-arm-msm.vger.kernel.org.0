Return-Path: <linux-arm-msm+bounces-100934-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iACUFdhPy2khGAYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100934-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 06:38:48 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A985B363E7F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 06:38:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 57D68305E30C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 04:37:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D9502D5408;
	Tue, 31 Mar 2026 04:37:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Zl7nRzsH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Oeedl7Fo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E01332BE02C
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 04:37:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774931865; cv=none; b=DdtVF/OAoOBA2V3VN7Y4Ot014LL0LyDuocxCz3nsXpTb/Us9mkJx6iwiUU0pjddcmVGUX+1MYjPyF0piJESJqNgGw8I9OttkuAUjOsjfLVEcvo+kNytfmu5t9yXlyPK1ZMEVPIIiS6CaJkZA25zIKIp+Ononfzish9bneMDnAZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774931865; c=relaxed/simple;
	bh=xYsLcQTGNHUKd8VrMpxYEPuruDVyUmLfia/4sp32nkE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YgKZr2pUoBPseC6zYT7KmNk4ta0lab1WeWpdMYwEquiWSzgUCWBIjbxW2H3KQEuzW0wUo17RXD1XcCDvhbiizZjZeS+XdccGR1xlmRI1mzSZtdGbCnHGcse7s2Q4pMPCh4w2qTPsfsF3wXJiv4tl9olDT1o4DHssLSX5wAuZycA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Zl7nRzsH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Oeedl7Fo; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62UKqgo01091578
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 04:37:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jF85H2GHE+7UGzxJyreadfp1atVe8zeWAoztPT146mg=; b=Zl7nRzsHoxvl8bNQ
	PAeVRc3bRfL4uIp82aO1JJeBt+nGNn60SJ8KLV3NzGWydNeS8NDdnW/OvC4t5Awz
	VMD2FsdUNc3meiMwA05YNxPK2VXr0Pb79QmK4MZrNLPCivTmgf3xfxkukFdShEwP
	woB+Q+gQTPAagvm1e/DNFroWQXW8u53lyZQficjetY7657g3hu8zK6Yd5Kjq+674
	1Z2fpYRDe7pxPINhQ7xVadokNEk62vd9zzzuRsTmNln4FtmBEsPpiwmAKHaXVbrG
	CqYc/m19r7Eb4X06UR4tX8WYyCdCIT8UxaJinRc1a8R76rKHPjthnHPNQ1jjVZAh
	Tys+YA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d7trd2u2y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 04:37:43 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-2bda35eab74so4077431eec.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 21:37:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774931862; x=1775536662; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jF85H2GHE+7UGzxJyreadfp1atVe8zeWAoztPT146mg=;
        b=Oeedl7ForCWN5LuUaxKt3ynZyP59XFc7h2+Nn4lhndaEeannqUGalCRnVbmUnjhGQY
         SRq8X6BhUJ6JYIfC0a08kGPbLEPAB7rsPlV/Ym+GYsmmSr1XtaBkzHCVNKGXr6kV9CN4
         kZSluECOsQAmY8Vvc2MsNqxMJwVNPxDEt37jBy88BRqLV2IJRIJQLak0TwuBDYr2iaNM
         guod/iX1MM5AEPFF96Gnr7aL1rydR84nsRXNZtByIlhh4wu2o7Ok56qkho3Ndie12o1x
         V9AGC/xLhgksZlO/exb2gbjIuKo+VLBGo1PdERlO5UpvN7fVbkTfTeTGmunNxAXOmjyD
         mP5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774931862; x=1775536662;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jF85H2GHE+7UGzxJyreadfp1atVe8zeWAoztPT146mg=;
        b=FzSk9RqONTV0O6x66Uc8+cdRv1DfTsIhVNOI/72YgDvduK9GLzNU4B5EgGxpO8Q7iu
         r4GnKf/jDK6PlxG+vBPbtfnyMRN75Kqo+p/hgDccgEJ3xtoPH4cPIBPH6fptZAtsMnD2
         4j72I0kLLQTQxOk8GCCnyEF9/xLBVRLAqZEJ2t4WS4LMUmMMMj3vBUhHza0xy6IQ/JwW
         Rf/2mMOI7Bq1zzhjEbtyLWT8g9UDaOcvWeP1MezV7tcodaU6rLTcP6rX6CwWaK1VrOg0
         EUjOf+Hx0aA41b7LFNd2vYftVap70QgzkYPZl54kP/U0t0G4L8HzwGsD7E3DpPv52RIm
         2L+g==
X-Forwarded-Encrypted: i=1; AJvYcCV+jAegNwoWC4OKPAZb0QoKTxEXGWpVqjGC9axzjrPKUY883WZCHcvtMhAWlx2RmiAC+/8htQiG8daDhVsw@vger.kernel.org
X-Gm-Message-State: AOJu0YwtNH+rROY/t0ZAb3BPrEowlz0VWvnUpmjTBGfqoux/v2tH9H86
	9vusF3uBriLLYJQ9Re3YKBhpFR17Bxqjpt8C/EpBIGX8PZNeNjj4ckZq0QH+0+TNx0CM4sTdKML
	LC13elEBLq3IZ5iTGWK/jW4ay11eynZY1qDSXwiqZDcp0kZnPIVpOJVFgweHvZ2W3ezrAiH62Us
	2Jhq8=
X-Gm-Gg: ATEYQzyBqGyk0MYuzGc6f5orryIXY3UPMjFiFLpKOtB3atUW5buePrz+kyfAV3z84pi
	lAlFewv7yBaOLTBF9ehvfm1c7Z8t3VdJU3R/oCInKN280/TMFW4sO1nryUJW9OeM39q4loWKxzB
	FE1Jss8lxUN5JASwHlByQwmOVHajY0f+f9DCNBo1PXDx3pEmIGpKBbm7K7J+NxjYKBgXvz202An
	EvbPnnkYZx5JkOfrXHoezAEL/Dpj8YwJ1EWDVHKQvGKkSQrRJ0dto+Ao1PVZ/+6FvmrRL2OiItr
	3i/nnG1rRo0BQ8RotTr34CwOWtWxCL3a0SUMzciGbVjFcBxdjC0aiwgjNGpBkB9nToDAsxYfuaZ
	n52GuFvt30QEwWf4wsceQr1b2BvOfHVl2XRwlbmxGhVhfb9Y5kt3O
X-Received: by 2002:a05:7300:80cb:b0:2c0:df3b:ec1e with SMTP id 5a478bee46e88-2c7bcb2e7bdmr1099413eec.11.1774931862312;
        Mon, 30 Mar 2026 21:37:42 -0700 (PDT)
X-Received: by 2002:a05:7300:80cb:b0:2c0:df3b:ec1e with SMTP id 5a478bee46e88-2c7bcb2e7bdmr1099399eec.11.1774931861762;
        Mon, 30 Mar 2026 21:37:41 -0700 (PDT)
Received: from hu-renjiang-sha.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c3c3bd9894sm9252248eec.4.2026.03.30.21.37.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 21:37:41 -0700 (PDT)
From: Renjiang Han <renjiang.han@oss.qualcomm.com>
Date: Tue, 31 Mar 2026 10:07:08 +0530
Subject: [PATCH 2/3] media: qcom: venus: relax encoder frame/blur dimension
 steps on v4
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260331-fix_venus_bug_issue-v1-2-e4ae7a1d8db2@oss.qualcomm.com>
References: <20260331-fix_venus_bug_issue-v1-0-e4ae7a1d8db2@oss.qualcomm.com>
In-Reply-To: <20260331-fix_venus_bug_issue-v1-0-e4ae7a1d8db2@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Alexandre Courbot <acourbot@chromium.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Tomasz Figa <tfiga@chromium.org>, Hans Verkuil <hverkuil@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Renjiang Han <renjiang.han@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774931842; l=3961;
 i=renjiang.han@oss.qualcomm.com; s=20241001; h=from:subject:message-id;
 bh=xYsLcQTGNHUKd8VrMpxYEPuruDVyUmLfia/4sp32nkE=;
 b=XpAV2TFPUZEjQ7yJ9E3qyuZpcUlV93KnuIvIqnSoqkoa/ybPTQzZEqRZ62wk/oaEpUPOYIJSY
 e1a7fSUMM2vBLwfIJPXcxsp9gbXVx3sn7XjV8fEgS9ssG9/QsA1uK5K
X-Developer-Key: i=renjiang.han@oss.qualcomm.com; a=ed25519;
 pk=8N59kMJUiVH++5QxJzTyHB/wh/kG5LxQ44j9zhUvZmw=
X-Proofpoint-GUID: 59MQnBcZFldFmWpI-PZ7wErfabRPP3em
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDA0MSBTYWx0ZWRfX47AGp+Maijnf
 K85ErMrelPAYgcuBc39fgY9C17e5Om224svDDoYS1HkI1JAJWPzwtcwhVm473VgtpUOxzjylseS
 ZcKRoWHKbVaqPeyKtBh70iFmCh21NUbjZcE18MKyhT0tR0eHEcqbzm7+KOUuK+LkenQSI4nBsQk
 sEGDQ0r4uetsn2Kx0aCFf7MaFHq/BEflLK33CIB7uito89UcbGKiJLHEsfbeytbraCxlEtP5viF
 vuFbb38MPBiYUznO4ncTbftQF5hV+mOEHS7Cdns7RD9rXZktcDFfCQSgAQLtAzF+a+iK0FQqfnn
 ab7xTUM57R+rpoQJzGX91m3dF+Gr9fYeTfTHJdExEadjE7TQoNOXRdHIvpizaAR49BKRSAqZTZ2
 h7grJo0wHGhPdISFV2UP1SvUUpBLCW8ZxwX68dhR5bo278vDtdOOJcK+rlBNP7XTNK1W0MtBvdG
 EyTI5HlOZJVmKkRVPeA==
X-Proofpoint-ORIG-GUID: 59MQnBcZFldFmWpI-PZ7wErfabRPP3em
X-Authority-Analysis: v=2.4 cv=H8/WAuYi c=1 sm=1 tr=0 ts=69cb4f97 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=0MT3MKzd5yeUH7whqLMA:9 a=+jEqtf1s3R9VXZ0wqowq2kgwd+I=:19
 a=QEXdDO2ut3YA:10 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-31_01,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 bulkscore=0 spamscore=0 lowpriorityscore=0
 clxscore=1011 impostorscore=0 phishscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603310041
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-100934-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[renjiang.han@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,samsung,huawei];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A985B363E7F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Encoder HFI capabilities on v4 advertise a 16-pixel step for frame and
blur dimensions. This is overly restrictive and can cause userspace caps
negotiation to fail even for valid resolutions.

Relax the advertised step size to 1 and keep alignment enforcement in
buffer layout and size calculations.

Fixes: 8b88cabef404e ("media: venus: hfi_plat_v4: Populate codecs and capabilities for v4")
Signed-off-by: Renjiang Han <renjiang.han@oss.qualcomm.com>
---
 drivers/media/platform/qcom/venus/hfi_platform_v4.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/hfi_platform_v4.c b/drivers/media/platform/qcom/venus/hfi_platform_v4.c
index cda888b56b5d4806f10d062371b9a4969e27d9b4..e0b3652bb44093111ce610fb09366c38db516966 100644
--- a/drivers/media/platform/qcom/venus/hfi_platform_v4.c
+++ b/drivers/media/platform/qcom/venus/hfi_platform_v4.c
@@ -136,8 +136,8 @@ static const struct hfi_plat_caps caps[] = {
 	.codec = HFI_VIDEO_CODEC_H264,
 	.domain = VIDC_SESSION_TYPE_ENC,
 	.cap_bufs_mode_dynamic = true,
-	.caps[0] = {HFI_CAPABILITY_FRAME_WIDTH, 96, 4096, 16},
-	.caps[1] = {HFI_CAPABILITY_FRAME_HEIGHT, 96, 4096, 16},
+	.caps[0] = {HFI_CAPABILITY_FRAME_WIDTH, 96, 4096, 1},
+	.caps[1] = {HFI_CAPABILITY_FRAME_HEIGHT, 96, 4096, 1},
 	.caps[2] = {HFI_CAPABILITY_MBS_PER_FRAME, 1, 36864, 1},
 	.caps[3] = {HFI_CAPABILITY_BITRATE, 1, 120000000, 1},
 	.caps[4] = {HFI_CAPABILITY_SCALE_X, 8192, 65536, 1},
@@ -173,8 +173,8 @@ static const struct hfi_plat_caps caps[] = {
 	.codec = HFI_VIDEO_CODEC_HEVC,
 	.domain = VIDC_SESSION_TYPE_ENC,
 	.cap_bufs_mode_dynamic = true,
-	.caps[0] = {HFI_CAPABILITY_FRAME_WIDTH, 96, 4096, 16},
-	.caps[1] = {HFI_CAPABILITY_FRAME_HEIGHT, 96, 4096, 16},
+	.caps[0] = {HFI_CAPABILITY_FRAME_WIDTH, 96, 4096, 1},
+	.caps[1] = {HFI_CAPABILITY_FRAME_HEIGHT, 96, 4096, 1},
 	.caps[2] = {HFI_CAPABILITY_MBS_PER_FRAME, 1, 36864, 1},
 	.caps[3] = {HFI_CAPABILITY_BITRATE, 1, 120000000, 1},
 	.caps[4] = {HFI_CAPABILITY_SCALE_X, 8192, 65536, 1},
@@ -195,8 +195,8 @@ static const struct hfi_plat_caps caps[] = {
 	.caps[19] = {HFI_CAPABILITY_RATE_CONTROL_MODES, 0x1000001, 0x1000005, 1},
 	.caps[20] = {HFI_CAPABILITY_COLOR_SPACE_CONVERSION, 0, 2, 1},
 	.caps[21] = {HFI_CAPABILITY_ROTATION, 1, 4, 90},
-	.caps[22] = {HFI_CAPABILITY_BLUR_WIDTH, 96, 4096, 16},
-	.caps[23] = {HFI_CAPABILITY_BLUR_HEIGHT, 96, 4096, 16},
+	.caps[22] = {HFI_CAPABILITY_BLUR_WIDTH, 96, 4096, 1},
+	.caps[23] = {HFI_CAPABILITY_BLUR_HEIGHT, 96, 4096, 1},
 	.num_caps = 24,
 	.pl[0] = {HFI_HEVC_PROFILE_MAIN, HFI_HEVC_LEVEL_6 | HFI_HEVC_TIER_HIGH0},
 	.pl[1] = {HFI_HEVC_PROFILE_MAIN10, HFI_HEVC_LEVEL_6 | HFI_HEVC_TIER_HIGH0},
@@ -210,8 +210,8 @@ static const struct hfi_plat_caps caps[] = {
 	.codec = HFI_VIDEO_CODEC_VP8,
 	.domain = VIDC_SESSION_TYPE_ENC,
 	.cap_bufs_mode_dynamic = true,
-	.caps[0] = {HFI_CAPABILITY_FRAME_WIDTH, 96, 4096, 16},
-	.caps[1] = {HFI_CAPABILITY_FRAME_HEIGHT, 96, 4096, 16},
+	.caps[0] = {HFI_CAPABILITY_FRAME_WIDTH, 96, 4096, 1},
+	.caps[1] = {HFI_CAPABILITY_FRAME_HEIGHT, 96, 4096, 1},
 	.caps[2] = {HFI_CAPABILITY_MBS_PER_FRAME, 1, 36864, 1},
 	.caps[3] = {HFI_CAPABILITY_BITRATE, 1, 120000000, 1},
 	.caps[4] = {HFI_CAPABILITY_SCALE_X, 8192, 65536, 1},
@@ -229,8 +229,8 @@ static const struct hfi_plat_caps caps[] = {
 	.caps[16] = {HFI_CAPABILITY_P_FRAME_QP, 0, 127, 1},
 	.caps[17] = {HFI_CAPABILITY_MAX_WORKMODES, 1, 2, 1},
 	.caps[18] = {HFI_CAPABILITY_RATE_CONTROL_MODES, 0x1000001, 0x1000005, 1},
-	.caps[19] = {HFI_CAPABILITY_BLUR_WIDTH, 96, 4096, 16},
-	.caps[20] = {HFI_CAPABILITY_BLUR_HEIGHT, 96, 4096, 16},
+	.caps[19] = {HFI_CAPABILITY_BLUR_WIDTH, 96, 4096, 1},
+	.caps[20] = {HFI_CAPABILITY_BLUR_HEIGHT, 96, 4096, 1},
 	.caps[21] = {HFI_CAPABILITY_COLOR_SPACE_CONVERSION, 0, 2, 1},
 	.caps[22] = {HFI_CAPABILITY_ROTATION, 1, 4, 90},
 	.num_caps = 23,

-- 
2.34.1


