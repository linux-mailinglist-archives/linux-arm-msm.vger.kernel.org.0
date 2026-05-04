Return-Path: <linux-arm-msm+bounces-105636-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id lNcSMUob+GnCpwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105636-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 04 May 2026 06:06:34 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 200974B848F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 04 May 2026 06:06:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id ADEA730086C3
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 May 2026 04:06:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57DD719B5B1;
	Mon,  4 May 2026 04:06:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fDkn2F09";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gIO+qw1a"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE43978F4F
	for <linux-arm-msm@vger.kernel.org>; Mon,  4 May 2026 04:06:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777867592; cv=none; b=mz98/dbclFf2IsB0rRfwreLBf+vE0iq02iXLYsYzj1K4mtTlNAiYfDYER4eEXzOUfmugYYwHaZd6jVdThUcUAlfHEAUludSsrIy6s/x2jDbJ8UzU73a2W7GGY/iTI8N6mX67apDQ36miWd0Ra0pca0x36KPODFjv1xI33uGq8A4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777867592; c=relaxed/simple;
	bh=12pRirn1zk1xj1elPFSKYdiBh1v8/jVlyKYve51i0pk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=GfN/PsCY2Ui+HgRBAraJAvMDfXeryXqSbgqxzwOQ9hVgGq202drUtzFphFwHr0ugp3wjvvlG0FGM0nQGH2/veJd9TTkMHvKduKTTqanm3lliyvGHNxKXozwNdDvh7dlMhcTzt5V8hG4uqT8ErJQgjZmc0Ts92ZBX0RhJUnkdXYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fDkn2F09; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gIO+qw1a; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6443nQ1g3985257
	for <linux-arm-msm@vger.kernel.org>; Mon, 4 May 2026 04:06:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=3zhF01JXEYpr/3XOfnPCDP
	F1pYnEF63r+hp7fuv2gmo=; b=fDkn2F09kvBji05y1QOvbiCy4WuzXBvfsHZZMw
	lyMMSflfgKp81lMpt69nPbu+OPm86sR/xmW/+JeHUL/3RArxrAW36a8Pyllb7trm
	cCzacKlPe57ROTZexSmsn6nPjbeMezaRXRvVG04n5BYPx6o2QipPHN2DbYrOMGWz
	QBM/vsVgxQ4n6zyaU5HMC5GCW4Z5uO5H0NBo5xNke4E8Gf5Z7dEY8RQjndMnasDZ
	+LSUdrg++39PwMnBvJalPzzpkeni7fuSYLZtGAL6yJLPdXFYLxlhYjJgq8Xig0GG
	K1ep3pLr3fNX6KBwTn3mj95OE6RB1AUAQPo6IBVLZt7BdeCg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dw8kg4768-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 04 May 2026 04:06:29 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-82fa1c94b37so3669204b3a.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 03 May 2026 21:06:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777867589; x=1778472389; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3zhF01JXEYpr/3XOfnPCDPF1pYnEF63r+hp7fuv2gmo=;
        b=gIO+qw1acnnlpigxebC2LOupP1mFN1WdhwuMBEcFwFQEKKcKiwIKYvasDwNI2Ipw4o
         zzSPV3lu0flrsOl2AwUDY5KMj+4ozVTAZ1Y1Y9J6bpnk+fa0zuvE5rEt1oLOZ1P2eCqH
         uAgmitWWHbAK/DW3y/1xTk5Mn9013GVqhs4bFzaFhWor/V3tAS18nQ+mAVY9HbgbhfOx
         jlfYhoEarHmdVuIJIBAeSfBrd6R0FT0cReUjzluAoCs6+ttNVA2IC0VY9C687OK3vSw7
         7D8B5X1qUuO76DkLf2yG7ArjdMT2XjHEimtNtfdOcWXr3Gnp9u/iel5YN2ONN2RYUQR9
         TVxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777867589; x=1778472389;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3zhF01JXEYpr/3XOfnPCDPF1pYnEF63r+hp7fuv2gmo=;
        b=Vuwd1D3IRsbwLd+IbxSBa+UA3qr+VmvrYD/H9vUVWJ0ao6YVzJ9nq/LedFdG3s6dUa
         ITbAjd62HiawpUrSYgoUkl0GndkqLoY0/4N9x7tO+aGTHsUu7QeBGurQsvtn3HxjBBHF
         YP1X36T8+NOTMF2ULo3MbAF5cIFuBcHuzmFeO68lB5gIJn0huRMn4cZyzOd08SGJ4bEn
         kJuhg85XeNqqD41H94Rhv9gZYpb3CCgjiN88bMrbB8ZXxPIGGuGiAx37F8FryYxfGtUY
         zgxYHQzPWnbIel1qcCgw3xmtRenXSmrh+I1omGOv31P11YeMFAkbJ1c/sQCXZMgqIFm6
         ymiA==
X-Forwarded-Encrypted: i=1; AFNElJ9E8FleEQRiusir50NkgDm3wq3mvO2EQOv5FAnZ1s/B0PyV0mPUbIgYJRBhVyYE4lzkM7jUa5WXwuyM032y@vger.kernel.org
X-Gm-Message-State: AOJu0YwsJNzLo7K84Uaq85Z6lUuAPSgqMAWtxQPZnwnlLrYn8uOSNzmD
	LZvN6WsCEv52101Ch61JY1omCTo1A5BDhdR1ayUhKOYp/WIAA/o45tYXFB0R3AF6iKM8rGfoS8W
	XrbGR08TtGX3jcfruUIdi5tALhcUgUEeiJyYRi0FzNw0GlL+n99bx87oteUYeh0Mf4aT/
X-Gm-Gg: AeBDieuFWqOe/ZxWTtXp8UcL6SSMYmLhBz5FWkznaMKtH/LoJECygGAdaioEMTezssE
	UBlh/hEqx0TOC835nqHddJB0HImTgHati+LCFixn33maDCrUM6fJHQutxQwmMPhf33g8+/qRzUY
	92lZYPVoqzpDW1isSIl5XATE3K5yHlz/VHAejxwFIY9lJBM4gYI7Ei1JMu8UjMiIx3bNFEs9hec
	ZXa2yTlL0vyIUtEGdXSj+BMhcKAR8msoZopf7a77VlIFVQSQq2epIGHjwcNB0P9VY+Z++axb9qa
	CAJMFswQmR5yAHotAu2fOUiZLfvQzK5eJwegHF6y+4rYGBD+i51+pyJ4cdFUp9WV5F2okoC17nz
	xoxjlCnm81ISOv2kzI0CneTYWSyvIOYghDcUur+7XPcF/uDPxMOwmBo9CrfyAyIqi+A==
X-Received: by 2002:a05:6a00:b85:b0:82f:9a88:9092 with SMTP id d2e1a72fcca58-835001ab087mr13431543b3a.33.1777867588560;
        Sun, 03 May 2026 21:06:28 -0700 (PDT)
X-Received: by 2002:a05:6a00:b85:b0:82f:9a88:9092 with SMTP id d2e1a72fcca58-835001ab087mr13431519b3a.33.1777867588086;
        Sun, 03 May 2026 21:06:28 -0700 (PDT)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8351582dc36sm11086428b3a.6.2026.05.03.21.06.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 May 2026 21:06:27 -0700 (PDT)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Mon, 04 May 2026 09:35:47 +0530
Subject: [PATCH v2] media: iris: optimize COMV buffer allocation for VPU3x
 and VPU4x
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260504-optimize_comv_buffer-v2-1-69379a59e17d@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIABob+GkC/4WNTQ6CMBCFr0JmbUlbSBtceQ9DSC2DTCIUW2hU0
 rtbuYCbl3wv72eHgJ4wwLnYwWOkQG7OIE8F2NHMd2TUZwbJpeK1FMwtK030wc66KXa3bRjQM4N
 acK10pXgDubp4HOh1zF7bzCOF1fn38RLFz/0zGAUTTNvGyLo3lemriwuhfG7mkVNTmQXalNIXo
 XRDbr8AAAA=
X-Change-ID: 20260421-optimize_comv_buffer-ae7107673609
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777867584; l=5920;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=12pRirn1zk1xj1elPFSKYdiBh1v8/jVlyKYve51i0pk=;
 b=GJluqoVPIgFjhGqPFJi2MOWMxUP41SONq7ntZOcFcQo+biTqegs9fmQUpHj9RaCaeU+q8n9iI
 J2kEMYoSp9qBZqIIx7TV7jfN5lFgV1SNOWXaTr51GwwqvVFqIIyQfWg
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Authority-Analysis: v=2.4 cv=P8sKQCAu c=1 sm=1 tr=0 ts=69f81b45 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=1JcM8n5T7VQChgOHro0A:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: r-13bq21PdPYcDcBtCZOnKj-vUISHMPk
X-Proofpoint-ORIG-GUID: r-13bq21PdPYcDcBtCZOnKj-vUISHMPk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA0MDA0MSBTYWx0ZWRfXw7bY9k24IgqI
 rFvAdglRGq9VHqCNyvrwuUdLft7odTIX3xSgMGYlJV0PD6Pia/AEHeDMLO5dQRyjkYMynAH3tZl
 u0U9UevR2VVa/HCgsLt+raUtou+wqB5YUN7zAwdK/yQ2EX/fWnewwtFGrOKmNXFUFIsGi27U/+R
 A6sEkFuyyoEYVPZ3hbyszeB5ipbCQS4wVLs4j69rF3Y8sAK9Q+aJ++gQvIFl3riJ0c4xwTZLdJn
 FKacsEK4Jx6kpgdGipPvZXIRHwaloGch25hUQ44MDpBIWgmqjrItTohFq2Ffclkb/h7E+IWv28c
 SNm5DeiyT1Q4srrp/TughKfdbqXKjsfeC57PFejWOqz0oiRm2/fz65PexqIT2YqqDINthHqi9Qa
 x4r55jweu0IarecSqp6BcZL2HICF1GleUNiGcchSrgalyWRigOO/SoQ27aacDw0Cwp4qXBx+8I9
 xnm/krcOy8lAj4iANQA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-04_02,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 malwarescore=0 priorityscore=1501 phishscore=0
 spamscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605040041
X-Rspamd-Queue-Id: 200974B848F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-105636-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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

The existing iris_vpu_dec_comv_size() used VIDEO_MAX_FRAME (32) as
num_comv count unconditionally when calculating the co-located motion
vector (COMV) buffer size. This resulted in an oversized COMV buffer
allocation throughout decode session, wasting memory regardless of
actual number of buffers required.

For VPU3x and VPU4x platforms, introduce iris_vpu3x_4x_dec_comv_size() to
replace iris_vpu_dec_comv_size(). These derive num_comv dynamically, it
uses inst->fw_min_count once the firmware has reported its buffer
requirements, and fallback to output count during initialization before
firmware has communicated its requirements. This aligns the COMV buffer
size to the actual count needed rather than always allocating with fixed
VIDEO_MAX_FRAME value.

Additionally, during iris_vdec_inst_init(), fw_min_count was initialized
to MIN_BUFFERS instead of 0. This masked the fallback logic and caused the
COMV size calculation to use MIN_BUFFERS even before firmware had reported
its actual requirements. Fix this by initializing fw_min_count to 0.

During testing of 1080p AVC, it reduces the COMV buffer size from 32.89MB
to 6.16MB per decode session, significantly reducing memory consumption.

Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
Changes in v2:
- Update commit description (Bryan)
- Update hfi comv buffer count value to use actual num_comv count which
  used for buffer calculation to avoid any overhead or fixed values (Vikash)
- Link to v1: https://lore.kernel.org/r/20260421-optimize_comv_buffer-v1-1-7c9a24da3ad3@oss.qualcomm.com
---
 .../platform/qcom/iris/iris_hfi_gen2_command.c     |  9 +-------
 drivers/media/platform/qcom/iris/iris_vdec.c       |  2 +-
 drivers/media/platform/qcom/iris/iris_vpu_buffer.c | 26 ++++++++++++++++++++--
 3 files changed, 26 insertions(+), 11 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
index 30bfd90d423b..3ade359f21e5 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
@@ -10,7 +10,6 @@
 
 #define UNSPECIFIED_COLOR_FORMAT 5
 #define NUM_SYS_INIT_PACKETS 8
-#define NUM_COMV_AV1 18
 
 #define SYS_INIT_PKT_SIZE (sizeof(struct iris_hfi_header) + \
 	NUM_SYS_INIT_PACKETS * (sizeof(struct iris_hfi_packet) + sizeof(u32)))
@@ -1212,13 +1211,7 @@ static int iris_set_num_comv(struct iris_inst *inst)
 	u32 num_comv;
 
 	caps = core->iris_platform_data->inst_caps;
-
-	/*
-	 * AV1 needs more comv buffers than other codecs.
-	 * Update accordingly.
-	 */
-	num_comv = (inst->codec == V4L2_PIX_FMT_AV1) ?
-				NUM_COMV_AV1 : caps->num_comv;
+	num_comv = caps->num_comv;
 
 	return core->hfi_ops->session_set_property(inst,
 						   HFI_PROP_COMV_BUFFER_COUNT,
diff --git a/drivers/media/platform/qcom/iris/iris_vdec.c b/drivers/media/platform/qcom/iris/iris_vdec.c
index 719217399a30..f433065e08b2 100644
--- a/drivers/media/platform/qcom/iris/iris_vdec.c
+++ b/drivers/media/platform/qcom/iris/iris_vdec.c
@@ -24,7 +24,7 @@ int iris_vdec_inst_init(struct iris_inst *inst)
 	inst->fmt_src = kzalloc_obj(*inst->fmt_src);
 	inst->fmt_dst = kzalloc_obj(*inst->fmt_dst);
 
-	inst->fw_min_count = MIN_BUFFERS;
+	inst->fw_min_count = 0;
 
 	f = inst->fmt_src;
 	f->type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE;
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_buffer.c b/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
index 9270422c1601..924b210cc4cd 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
@@ -731,6 +731,28 @@ static u32 iris_vpu_dec_comv_size(struct iris_inst *inst)
 	u32 height = f->fmt.pix_mp.height;
 	u32 width = f->fmt.pix_mp.width;
 
+	if (inst->codec == V4L2_PIX_FMT_H264)
+		return hfi_buffer_comv_h264d(width, height, num_comv);
+	else if (inst->codec == V4L2_PIX_FMT_HEVC)
+		return hfi_buffer_comv_h265d(width, height, num_comv);
+
+	return 0;
+}
+
+static u32 iris_vpu3x_4x_dec_comv_size(struct iris_inst *inst)
+{
+	u32 num_comv = iris_vpu_buf_count(inst, BUF_OUTPUT);
+	struct v4l2_format *f = inst->fmt_src;
+	u32 height = f->fmt.pix_mp.height;
+	u32 width = f->fmt.pix_mp.width;
+	struct platform_inst_caps *caps;
+
+	if (inst->fw_min_count)
+		num_comv = inst->fw_min_count;
+
+	caps = inst->core->iris_platform_data->inst_caps;
+	caps->num_comv = num_comv;
+
 	if (inst->codec == V4L2_PIX_FMT_H264)
 		return hfi_buffer_comv_h264d(width, height, num_comv);
 	else if (inst->codec == V4L2_PIX_FMT_HEVC)
@@ -2025,7 +2047,7 @@ u32 iris_vpu_buf_size(struct iris_inst *inst, enum iris_buffer_type buffer_type)
 
 	static const struct iris_vpu_buf_type_handle dec_internal_buf_type_handle[] = {
 		{BUF_BIN,         iris_vpu_dec_bin_size             },
-		{BUF_COMV,        iris_vpu_dec_comv_size            },
+		{BUF_COMV,        iris_vpu3x_4x_dec_comv_size       },
 		{BUF_NON_COMV,    iris_vpu_dec_non_comv_size        },
 		{BUF_LINE,        iris_vpu_dec_line_size            },
 		{BUF_PERSIST,     iris_vpu_dec_persist_size         },
@@ -2098,7 +2120,7 @@ u32 iris_vpu4x_buf_size(struct iris_inst *inst, enum iris_buffer_type buffer_typ
 
 	static const struct iris_vpu_buf_type_handle dec_internal_buf_type_handle[] = {
 		{BUF_BIN,         iris_vpu_dec_bin_size         },
-		{BUF_COMV,        iris_vpu_dec_comv_size        },
+		{BUF_COMV,        iris_vpu3x_4x_dec_comv_size   },
 		{BUF_NON_COMV,    iris_vpu_dec_non_comv_size    },
 		{BUF_LINE,        iris_vpu4x_dec_line_size      },
 		{BUF_PERSIST,     iris_vpu4x_dec_persist_size   },

---
base-commit: 254f49634ee16a731174d2ae34bc50bd5f45e731
change-id: 20260421-optimize_comv_buffer-ae7107673609

Best regards,
-- 
Vishnu Reddy <busanna.reddy@oss.qualcomm.com>


