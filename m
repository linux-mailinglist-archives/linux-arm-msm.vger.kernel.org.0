Return-Path: <linux-arm-msm+bounces-99904-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kP8aKBkUxGmfwAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99904-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 17:58:01 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A32683297DD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 17:58:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 2A65F30FE7FE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 16:36:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8E7F3F7AA8;
	Wed, 25 Mar 2026 16:35:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="p3yJKLxi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OvBtA//2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96EEC3FA5F9
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 16:35:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774456535; cv=none; b=Vi7Giq64XABo2lDADpzKrxwYYx2QLdSv77kvofkXwBbOR0r5WnpJCqCFTvrHlD8fyS7Jx0cXsa6YO61TgFDDoFaKZ4Y9SQ/foiwEefu2WX92INr37ZwlPgbYD9SlC/ve76yqXq0thhn8GxJkyJKXWASM6PItLYM/pXJ+5bI8G0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774456535; c=relaxed/simple;
	bh=SkM04Tuc1oWoCnquGSiDaEayQNN7DyeQkIktNqEIUTQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Rww0r2uMAFhF27PTtSvKjltOBc5yvv+kHSWRHXzkQn4AcZmaszekGzwEzFuJCmOqZ0zGLs0o+CZhWdez0c+1dAjWySY8wdsvgJMWLTPy9ao+tryJxDPDjAMCrPbU/7QTRI4iL6Hj1iaVFVncm0puctJvx/U7wDJJVkecmzuL04Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=p3yJKLxi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OvBtA//2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62PFH2151257944
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 16:35:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Xua7y/qVOt6Psq0DlarnsA
	3wXTzgqE7tw4Y/8vH23fo=; b=p3yJKLxiA/cSTk6xgKz2MjDQFDlvlCvxJkxKHf
	/6odZiRqB4vwQE6HlFRaDdGfeBe5aeA4g0kS4MLI2EVd3uY/xpzdbgLxXg8P9haC
	MAx68OaglNzMxhDDkhH0alwSLYm9MPSjrLyLbpe+BnePMXu5KEDekSTiy2GJg3b1
	OzPqeom0ZOBrlaJ47UwyW8lqGdMUaJNOGyYerqxNPjSOT/7hSSq0gZ87IKOQZ0yT
	32dx2IpHL8whwQxbFZFSY0Vq1AYmJmPYB54R9SAO7q/qby26fErGhK2+gygfnU2J
	4mX++cJDYzq3JGyjT3Dy3uV96M53OPnIpQz1fCQG31XVvq8A==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d4dm2sehx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 16:35:30 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-82c613194caso39594b3a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 09:35:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774456530; x=1775061330; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Xua7y/qVOt6Psq0DlarnsA3wXTzgqE7tw4Y/8vH23fo=;
        b=OvBtA//2eeThU14R7h7Oz/8BJuO2y7gMuV57JFnGz392kEhAJSo6HljHuApfL7giYU
         puoOiEifZyx7W6JBQcBpkyOPRq485kdu5Yg9I4+zFel2ZnCoudCkadXxPz9WZr77urr6
         obkJG3jAwE+6gMbRrnxnvmP91GP1Kx+IF+nDLB+yAhpd6mIuQFyatvgPmkCYblBx9FJY
         14I5ZiXmXcd7dz6VtZ5t4kZC3wt5vNmLYc4x5SmHWj9wyW3EYzirzz22qdSaJw8mvlyS
         vvzaGlShJTMdWxwImx/MolkqEOLb63Mmtaa2VO9Ij9QcSMDuKSageUmYv58fAalFRrlC
         Ps5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774456530; x=1775061330;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xua7y/qVOt6Psq0DlarnsA3wXTzgqE7tw4Y/8vH23fo=;
        b=YOgacf7FDVP8R5QMvRIhPKQIj3BZpxYvlYynZPxYWEcm1EwQvzqrb5IJVPMo8u6G2w
         fCW62TXzQmH+vIdivoLQjIefOBr55iTOZY+zA4ym6fXpcHCbxYsOIpoOJIaJRO77kd5p
         wjJc+OMdODbvc4HBPNF2ZEwJ7DWkCG5Ul7xnqUZgmQWovZFfn3lfyXX4SfqCn+4gyxgP
         CXSKXu4t22/bYyL+95iK/UZtnJgxA+O3teDHdRUvsbdMH0NbKVf/eDerm6OTaOUfzPZy
         hxBZJ7JK4ty9JfW2DycCUcBxxFFg3Aih2Vez3ZAZML2KuLTNTFqeSHD8HFwhIzxZJPmP
         czeg==
X-Forwarded-Encrypted: i=1; AJvYcCXuqLIlCAMAFUg7cQcEWQZppo7DFqlV/DG3k5JuxO93mIZ05tjGbhYhrmFtatAz4iWzKQURxVN+uE+VPH9e@vger.kernel.org
X-Gm-Message-State: AOJu0Yw64Yf3RBc9V6eZZyLTZlzQhTb2j1WHNZMAe/If8H6IkuIP5LX6
	n5Bn3abChQEF6HP35s5GghI5K9zG83Tkv/EsjWnlHn4TCbmb5Rj/lJDATO/bTLpFgejON9IK4Gy
	fboNWBrV9G1+8bfQ3NM7TXjs25o2/0SQ53uvvTu2AYktaD+vZxgVAAede3fvxLjDUFfXDvILYoP
	x4
X-Gm-Gg: ATEYQzwiDhvucwD6NVoXJDWWbfS4SyMUyn38CTZ29eYd2UXSesEn1xQPcfQUQDAYaj+
	ReVy60yWFZ+vyWiC7Iu+NPQqaoyNJTueylxvb9iGiTN4HmZORf1Egvq3uACWEfwwAJ+j/8PTrKq
	Y5ufCTQp8iM+agB7DC4AzSY5SuoiT9HMYfxgnQb1XV7HJa63U6+kxSO3AZUm6KDggCfpMSYYqrj
	H+OcdDubAo7pDSmdD3VhnX9aGPIiolppfNSt0/Afr2s28+A2R/bf9UEqrNVzY6ohyzpHXCZDw9z
	/mIJ+N3jTe3WT8HjkhlGhXM8BcK+fPUu8Y3v0ZSseK9k+qB6L5fSmNYMRRTUgrTCB9oBuoJWQQY
	j5jo05GIoqrqYFvPJXhFGVv+5SzF4GKIv9F967OF2zpOBUfdQwmxZrE4=
X-Received: by 2002:a05:6a00:3cc8:b0:824:18cd:f2f6 with SMTP id d2e1a72fcca58-82c6e0d6eb6mr4130686b3a.59.1774456529557;
        Wed, 25 Mar 2026 09:35:29 -0700 (PDT)
X-Received: by 2002:a05:6a00:3cc8:b0:824:18cd:f2f6 with SMTP id d2e1a72fcca58-82c6e0d6eb6mr4130655b3a.59.1774456529023;
        Wed, 25 Mar 2026 09:35:29 -0700 (PDT)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82c7d216a0esm207991b3a.17.2026.03.25.09.35.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 09:35:28 -0700 (PDT)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Wed, 25 Mar 2026 22:05:11 +0530
Subject: [PATCH v4] media: iris: add FPS calculation and VPP FW overhead in
 frequency formula
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260325-update_fps_calculation-v4-1-13728c0065ff@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAL4OxGkC/4XOTWrDMBAF4KsYraugn5HkZJV7lBJG0qgRJLFj2
 aYl+O5VnU0WNd0MvGHm4z1YoSFTYYfmwQaac8ndrQZ4a1g44+2TeI41MyWUFVoAn/qII51SX04
 BL2G64Fhf+L4lcskZ4bxk9bkfKOWvFX7/eOaB7lP1x+eSeSzEQ3e95vHQJCMM7V0bJQoAhdH7S
 NAiRd0G0UKMhDZaYr/WOZexG77XzrNcsf/qzZJLDkQYtNNoBBy7Unb3qZ7UBrs6VnlWr5rZ1FT
 VSHsTQvBSgd3Q9IumtjVdNa8oWAPJEcQ/tGVZfgCfmKhdqwEAAA==
X-Change-ID: 20260304-update_fps_calculation-98ee7f7507b1
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774456525; l=4990;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=SkM04Tuc1oWoCnquGSiDaEayQNN7DyeQkIktNqEIUTQ=;
 b=OPenVd7otuxeRKIhxBkKDzulhSJJJRAd+z7/3z22lVIj1YHgff7g4KPL2bRdarnRCjJRVvZ3N
 j9FQmgGW9yEDmbLr8bSXbWd2OcktuOabtQwRKsEgdZPXHmaNbnnEZxo
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI1MDEyMCBTYWx0ZWRfXytXcgPNLnGUN
 wChucHsxqsLEsfQZwOXwTnh9G4G+kpp6vnl/DsPaTtIZBgkQEjpnQ9dzveeQcizR/yfVEl6/4iV
 33I+J8mfFnPOlmdLTr17uS2BQUno5JU7NJV0X8fGlbCZqjVlfy7RZnUTTtjeQ6Q+QAdqW0bZL1h
 WeP3vVF/9FK0/JOmCLB+dU0JcFerHGArRxm4L93f1ibxQg1VfT8kmcy+xP+U0aTpHwIjXJwc0ht
 hehGeTSnMub3WdLScdONnA1E78T63Bm44sZap1eU0OSscQing/YnamNyWtn3+5Y3rQtla7O8wyz
 viIzjGe7WgscprmaLOrmpdIzp0TVVbQIPJhfDpuZtKkvDDKiBKcQWZ8xN2II9NTC1EvYPoGpse4
 IsWo/yWTvx5aNnhPzCT/+GIxAAQ9/ZY0p70r4WSqJSF6sKp8N7dWYGZ7brpk2IziKM4HIw2B/s6
 4an4sNr0RuUc+u6IyhA==
X-Proofpoint-GUID: 9Jo0Fk5vcCiVE7paztbaMWcjayD6HIIo
X-Authority-Analysis: v=2.4 cv=Fo0IPmrq c=1 sm=1 tr=0 ts=69c40ed2 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=aZFUA4iBNJJznah6NdIA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: 9Jo0Fk5vcCiVE7paztbaMWcjayD6HIIo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-25_05,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 clxscore=1015 spamscore=0
 bulkscore=0 phishscore=0 priorityscore=1501 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603250120
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-99904-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[busanna.reddy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A32683297DD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The driver was using a fixed default FPS value when calculating the VPU
frequency. This caused wrong frequency requests for high‑frame‑rate
streams, for example 4K at 240 FPS. Because of this, the hardware was
running at a lower frequency than needed.

Add the FPS measurement based on the decoder input buffer arrival rate.
The measured FPS is stored per instance and used in frequency calculation
instead of the fixed default FPS. The value is clamped so that it does
not exceed platform limits. Add a VPP firmware overhead when running in
STAGE_2.

Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
Changes in v4:
- Renamed the variable names (Vikash Garodia)
- Updated the fps calculation logic (Vikash Garodia)
- Link to v3: https://lore.kernel.org/r/20260325-update_fps_calculation-v3-1-b2ec654f7e4d@oss.qualcomm.com

Changes in v3:
- Updated the frame_count condition check (Vikash Garodia)
- Link to v2: https://lore.kernel.org/r/20260305-update_fps_calculation-v2-1-e3b5cccb1246@oss.qualcomm.com

Changes in v2:
- Replaced div_u64 with mult_frac (Konrad Dybcio)
- Link to v1: https://lore.kernel.org/r/20260304-update_fps_calculation-v1-1-4eeac373a504@oss.qualcomm.com
---
 drivers/media/platform/qcom/iris/iris_instance.h   |  2 ++
 drivers/media/platform/qcom/iris/iris_vdec.c       | 20 ++++++++++++++++++++
 drivers/media/platform/qcom/iris/iris_vpu_common.c |  6 +++++-
 3 files changed, 27 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_instance.h b/drivers/media/platform/qcom/iris/iris_instance.h
index 16965150f427..a47cd949645f 100644
--- a/drivers/media/platform/qcom/iris/iris_instance.h
+++ b/drivers/media/platform/qcom/iris/iris_instance.h
@@ -109,6 +109,8 @@ struct iris_inst {
 	u32				metadata_idx;
 	u32				codec;
 	bool				last_buffer_dequeued;
+	u64				last_buf_ns;
+	u32				frame_counter;
 	u32				frame_rate;
 	u32				operating_rate;
 	u32				hfi_rc_type;
diff --git a/drivers/media/platform/qcom/iris/iris_vdec.c b/drivers/media/platform/qcom/iris/iris_vdec.c
index 719217399a30..7fb45df37db6 100644
--- a/drivers/media/platform/qcom/iris/iris_vdec.c
+++ b/drivers/media/platform/qcom/iris/iris_vdec.c
@@ -54,6 +54,7 @@ int iris_vdec_inst_init(struct iris_inst *inst)
 	f->fmt.pix_mp.quantization = V4L2_QUANTIZATION_DEFAULT;
 	inst->buffers[BUF_OUTPUT].min_count = iris_vpu_buf_count(inst, BUF_OUTPUT);
 	inst->buffers[BUF_OUTPUT].size = f->fmt.pix_mp.plane_fmt[0].sizeimage;
+	inst->frame_rate = MAXIMUM_FPS;
 
 	memcpy(&inst->fw_caps[0], &core->inst_fw_caps_dec[0],
 	       INST_FW_CAP_MAX * sizeof(struct platform_inst_fw_cap));
@@ -369,6 +370,8 @@ int iris_vdec_streamon_input(struct iris_inst *inst)
 	if (ret)
 		return ret;
 
+	inst->frame_counter = 0;
+
 	return iris_process_streamon_input(inst);
 }
 
@@ -411,6 +414,7 @@ int iris_vdec_qbuf(struct iris_inst *inst, struct vb2_v4l2_buffer *vbuf)
 {
 	struct iris_buffer *buf = to_iris_buffer(vbuf);
 	struct vb2_buffer *vb2 = &vbuf->vb2_buf;
+	u64 cur_buf_ns, delta_ns;
 	struct vb2_queue *q;
 	int ret;
 
@@ -427,6 +431,22 @@ int iris_vdec_qbuf(struct iris_inst *inst, struct vb2_v4l2_buffer *vbuf)
 		return 0;
 	}
 
+	if (buf->type == BUF_INPUT) {
+		cur_buf_ns = ktime_get_ns();
+
+		if (!inst->frame_counter)
+			inst->last_buf_ns = cur_buf_ns;
+
+		inst->frame_counter++;
+		delta_ns = cur_buf_ns - inst->last_buf_ns;
+
+		if (delta_ns >= NSEC_PER_SEC) {
+			inst->frame_rate = clamp_t(u32, inst->frame_counter, DEFAULT_FPS,
+						   MAXIMUM_FPS);
+			inst->frame_counter = 0;
+		}
+	}
+
 	iris_scale_power(inst);
 
 	return iris_queue_buffer(inst, buf);
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.c b/drivers/media/platform/qcom/iris/iris_vpu_common.c
index 548e5f1727fd..d621ccffa868 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_common.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu_common.c
@@ -416,7 +416,7 @@ u64 iris_vpu3x_vpu4x_calculate_frequency(struct iris_inst *inst, size_t data_siz
 	u32 height, width, mbs_per_second, mbpf;
 	u64 fw_cycles, fw_vpp_cycles;
 	u64 vsp_cycles, vpp_cycles;
-	u32 fps = DEFAULT_FPS;
+	u32 fps = inst->frame_rate;
 
 	width = max(inp_f->fmt.pix_mp.width, inst->crop.width);
 	height = max(inp_f->fmt.pix_mp.height, inst->crop.height);
@@ -435,6 +435,10 @@ u64 iris_vpu3x_vpu4x_calculate_frequency(struct iris_inst *inst, size_t data_siz
 	if (inst->fw_caps[PIPE].value > 1)
 		vpp_cycles += div_u64(vpp_cycles * 59, 1000);
 
+	/* 1.05 is VPP FW overhead */
+	if (inst->fw_caps[STAGE].value == STAGE_2)
+		vpp_cycles += mult_frac(vpp_cycles, 5, 100);
+
 	vsp_cycles = fps * data_size * 8;
 	vsp_cycles = div_u64(vsp_cycles, 2);
 	/* VSP FW overhead 1.05 */

---
base-commit: f505e978d1a0442adbbde48aed38c084ddea6d6e
change-id: 20260304-update_fps_calculation-98ee7f7507b1

Best regards,
-- 
Vishnu Reddy <busanna.reddy@oss.qualcomm.com>


