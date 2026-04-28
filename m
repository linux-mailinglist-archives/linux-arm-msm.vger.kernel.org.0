Return-Path: <linux-arm-msm+bounces-104887-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sPqcJjhg8GnDSQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104887-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 09:22:32 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1022A47EBC7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 09:22:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 766013060CAC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 07:14:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED05E3A1A22;
	Tue, 28 Apr 2026 07:14:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pJjAvay/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="klyWdH0N"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6025540DFB9
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 07:14:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777360496; cv=none; b=qwDi9mqEB716VLV0tPQo6/60HKipJCnFWqr9yQXHmh1O1hL1qBuO5Y/MuQ7SBd+PsdnrGLYKBL5VvpjdwP8egJVk7LIRCjYOh7Ypf+axYJl3kJSQ1ls9VMt4eFgA6D0dFA7I/ak/kO6y3n/lQGJ7wQa6xK6SLcVhSwmRJS06uV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777360496; c=relaxed/simple;
	bh=5IAbPV7GjXJcmCemjnRj6zkNyiWGO0VFknnZB5qbFJ4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=R252RSQkBkeigakOuW4bezO2Ik8eWnpQVpc5pZ1qWlf1fZVPQrtnmB23ijJlM6CTNosB3n4wDv9a1ocS63S+Sbx96AJeahHnElWA0wSQTtlp44mchm8amFdj5nHj2rXGI8jgkbg+W5j9RWlm1jSVdyrS5S0whZqn3XAfzy9yfOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pJjAvay/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=klyWdH0N; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63RNl2PP3760591
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 07:14:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=mRkuhVxeIvIJUI8nAiBY//
	YMf+HTmpsVYFRpYf2MAlg=; b=pJjAvay/xLiY3dQ6EH9jnVAieHGekhHfy2jvzk
	63Yd0ZJxlEx37Cisj/ocdyjNeELKC8iIx51bkbsIgp1kKhJue0bP7Xm9RFiI469J
	l7GSKkI54G9cotUxMroObTW3FB3zIZqErX2XUIz13Hm1MAApiCl4vi8g+xa961z9
	tdGEsmooAMOS49xvjQtGxR/oFuTxs1OZONLa2cs+nfHV48brSkcaTCK89dYYDecD
	PfGdhs6DivS8DYrXUzIr0lR4u/DIdJV0BhTeV1B0NbFBlaUuaEu2ORWfM10/rH+v
	Bksyfxg4269/ttjHjuT2ONUhc6N/dvJcz1AKujcoLO3UHMQQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dtacdu5a8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 07:14:54 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-82f2138a9e0so6892692b3a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 00:14:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777360494; x=1777965294; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mRkuhVxeIvIJUI8nAiBY//YMf+HTmpsVYFRpYf2MAlg=;
        b=klyWdH0NasXRo4aZOjC1NrZYO8D78G5iWucW9Q5tCLMlEzxTLdMIRZrg3nCQTt7cN1
         w1+pYjxWIBWlTR0WtpiAkbAI48xqhpj3ewIhhWidnElUFrSUufiSwtov0mOaIcKJRSZ9
         U5iQyBjhqLvkX4kFs+1JCTJsgMdHZxIkDco2LhpgURNjHv8lLIXzeTF96UOx1nE8CjXU
         7dwffyBpNllshszHg4S3Xr46a2nXUU0NqIFkMYZO+GVkzrEs7P4Cl5k1qhh22lSZfUjo
         CjxYTFtVf20+L1wf6dh0rLvswpKloYd63haS9czv8kjxOb3uo2W3DwYzzdi+Ke8Hrq6a
         FMWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777360494; x=1777965294;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mRkuhVxeIvIJUI8nAiBY//YMf+HTmpsVYFRpYf2MAlg=;
        b=QCfPANHxnraL+relERUZbpHTOxzlVrvRCCiTz/ZxlIwGFWt/3TQrRMTf5MhdTtlTf4
         ibt6P/C0jq1SZpTUV5o2NysCAg77nUv/haEW8CCKo0QfTFbjpBsqK65MpPj1wxBIxeVu
         LzZXufq5iWh02+SrTQRSE0s1r4viOlPGRbBOfnN7vi57AzWIrIsB/kBnQbvc5SEOV5UJ
         E07wp1DgiKRBRYG2FhJFoWfewdkQuaViPN7M7gVYpXmgyThNJEGbn8c9XAKwcVkldMM9
         5FjiPS6d6I6f8TdQ+CWJLyvx1OzRPvDL2grMf5UMDl9B8kINbCver4jFshX7FscluEMx
         fMdw==
X-Forwarded-Encrypted: i=1; AFNElJ+5d8HaCSPx0dDoE46aZAOMi88Dr6xrAUWG96PBWdjEqdYMGFxHO1YKw3RaEfMMEpvmJf880D4bHCC+ABpG@vger.kernel.org
X-Gm-Message-State: AOJu0YyTV9fLx5d1caJXJnUGiN3yMyM/LmzAkku2Z89zWOyyW1FGW4mX
	2+81K5ND8fHcfqwQ4TPgCZ6LJaqEZ0RGnf4VXmXf5dVR4qF4Ks1hWCYMBkX1rJLG7ns73m4/72b
	+5oic8rf4jZhibMICWp1aE8XEURNR6EekqI3u/kTpdwJAmjYz9/OxkHCZC8jwrPcNnuuM
X-Gm-Gg: AeBDiesPAou9l6ePVm1LtcM9ngFOOELvwPWh1RZB472q87Pajv+j96yMikrW/d5JB/N
	Ox9LskIs3XxQJuoxu5SPCrHcNE4VNmKlR0KQ5bijAD3WYX9W6hb3bV/iTgGv5i04kmniLukM/Sf
	pBlLnWdMs5oeN+pGXNXI+7KyuGJxMBUTLENbppW3vmMAxFf/80Qt8mkIvIz/N+dyuDVwRkMHiIU
	sialTgutD0TjbxqmpW/8p0R55cfQH5IIKZmICuxl00IVgF3Bfv/rcKOMHZqkwMdWgndTxIEaXNf
	tR4lQ5L+1Bdu0X81GGmjyU1GCSQZFVcTqsCX1u0nHw6shF2eFKJT7ZB7dC7Vtmy+O+rLhx1YTms
	Vwvx46J1ARieojZFcVQYTvhQeqAXO9rd2g2iqqsfLaohU2XO/lwM1uvOd4VCV4AE=
X-Received: by 2002:a05:6a00:2990:b0:82a:6461:6d1e with SMTP id d2e1a72fcca58-834ddc7705bmr1787103b3a.46.1777360493352;
        Tue, 28 Apr 2026 00:14:53 -0700 (PDT)
X-Received: by 2002:a05:6a00:2990:b0:82a:6461:6d1e with SMTP id d2e1a72fcca58-834ddc7705bmr1787081b3a.46.1777360492863;
        Tue, 28 Apr 2026 00:14:52 -0700 (PDT)
Received: from hu-sachinku-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-834daf5705fsm1980977b3a.42.2026.04.28.00.14.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 00:14:52 -0700 (PDT)
From: Sachin Kumar Garg <sachin.garg@oss.qualcomm.com>
Date: Tue, 28 Apr 2026 12:44:43 +0530
Subject: [PATCH] Add support for multi_slice in iris encoder
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260428-iris_multi_slice-v1-1-92c327619ebf@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAGJe8GkC/x3MSQqAMBAF0atIrw2Y4HwVkSCx1Q9OpFUE8e4Gl
 29R9ZCwBwvV0UOeLwi2NUDHEbmpW0dW6IPJJCZPUpMpeIhdzvmAlRmOVand0Ls801VVUMh2zwP
 uf9m07/sBGeROo2IAAAA=
X-Change-ID: 20260425-iris_multi_slice-81cfdc651997
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sachin Kumar Garg <sachin.garg@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777360489; l=10274;
 i=sachin.garg@oss.qualcomm.com; s=20260211; h=from:subject:message-id;
 bh=5IAbPV7GjXJcmCemjnRj6zkNyiWGO0VFknnZB5qbFJ4=;
 b=VvhmKb2UQTG9AjmACJwhVlRM6ueOIKj6vl2+bWMsPlsaq71j2JFjP4HWAljISkd0GKICmjJr6
 JOJXiMvNfeaADGeskDFlmSkzfnZs8L6muDk3iNDAmhsFfJLnr2EAWaW
X-Developer-Key: i=sachin.garg@oss.qualcomm.com; a=ed25519;
 pk=KcRhp4CP9cR1V2tg6xSNRnB2STYaU0vVigdUF4Actu0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI4MDA2NSBTYWx0ZWRfX/ol9yW1B8rET
 iyXzbGHfU6EolAOLySv5RnFhnZ+UUsFV677BAlxrwH8X6ikGhZCiNQPgPxkYo78SYVeCSL2CFZx
 SbMMGgZowFAwYlpXRsJjAWFt2KhtAuMtLthiDKGquRjOdTvnAJWAxa2SJ9hSwIFG2/HpM7H3NNR
 LWnp8IE8lxbvY7pJwoAPwdGEAbUjvxDvBfxmmDuw2zKPa3L6qgi8WORdEMWsJYsrkmj9NWr2GQA
 dXSYKvWu2G1BsB0I1hsIfVeKYE8BByoSWQ+t3iawD9vkcM1dJcYCEObvFh0h4zZwX7LwcUT9qox
 k6XwOS82RbqIL8bUZa53HnL/IoOpSBsvsQrcTkdgPPA/eCdmqgbmflFIkePTct6NJAhgl0c6o1F
 bPBBjjMx3PnBl8tJyCsm5Uq+cSo6yEsmwrcPH+iOgvIGeQqfPRtqhzP90oqXqklilX7QZH9ffVI
 BN6PxLvxd1YnMuPwxSw==
X-Authority-Analysis: v=2.4 cv=QsduG1yd c=1 sm=1 tr=0 ts=69f05e6e cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=ea3OJAFQNpsezTeQoQYA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: af_MSS3RILFzbYyNhVaW44B98JcNrlwB
X-Proofpoint-ORIG-GUID: af_MSS3RILFzbYyNhVaW44B98JcNrlwB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_01,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 suspectscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604280065
X-Rspamd-Queue-Id: 1022A47EBC7
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104887-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[sachin.garg@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]

Add multi-slice encoding support with MAX_MB and MAX_BYTES modes.

Clients can enable slice mode using V4L2_CID_MPEG_VIDEO_MULTI_SLICE_MODE
control and configure slice size via V4L2_CID_MPEG_VIDEO_MULTI_SLICE_MAX_MB
or V4L2_CID_MPEG_VIDEO_MULTI_SLICE_MAX_BYTES controls.

Signed-off-by: Sachin Kumar Garg <sachin.garg@oss.qualcomm.com>
---
This series adds the support for multi slice feature in the
Qualcomm Iris driver.

Multi-slice mode allows encoding a single frame into multiple slices,
which can improve error resilience and enable parallel processing.
The feature supports two slice modes:
- MAX_MB mode: Slices are created based on macroblock count, controlled
  via V4L2_CID_MPEG_VIDEO_MULTI_SLICE_MAX_MB
- MAX_BYTES mode: Slices are created based on byte size, controlled via
  V4L2_CID_MPEG_VIDEO_MULTI_SLICE_MAX_BYTES

Clients can enable slice mode using the
V4L2_CID_MPEG_VIDEO_MULTI_SLICE_MODE control.

This series adds multi-slice support for HFI Gen2 targets (SM8550 and later).
Support for HFI Gen1 targets will be added in a follow-up series.

This Patch has been verified with GST level.
Command used:
gst-launch-1.0 -v videotestsrc ! video/x-raw,format=NV12, \
width=1280,height=720,framerate=30/1 ! v4l2h264enc output-io-mode=4 |
capture-io-mode=4 extra-controls="controls,video_bitrate_mode=1, \
slice_partitioning_method=1,number_of_mbs_in_a_slice=460;" \
! filesink location=/opt/test_enc.h264
---
 drivers/media/platform/qcom/iris/iris_ctrls.c      | 89 ++++++++++++++++++++++
 drivers/media/platform/qcom/iris/iris_ctrls.h      |  1 +
 .../platform/qcom/iris/iris_hfi_gen2_defines.h     |  2 +
 .../platform/qcom/iris/iris_platform_common.h      |  3 +
 .../media/platform/qcom/iris/iris_platform_gen2.c  | 31 ++++++++
 5 files changed, 126 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.c b/drivers/media/platform/qcom/iris/iris_ctrls.c
index 3cec957580f5..52b92241e7f0 100644
--- a/drivers/media/platform/qcom/iris/iris_ctrls.c
+++ b/drivers/media/platform/qcom/iris/iris_ctrls.c
@@ -13,6 +13,15 @@
 
 #define CABAC_MAX_BITRATE 160000000
 #define CAVLC_MAX_BITRATE 220000000
+#define MAX_SLICES_PER_FRAME 10
+#define MAX_SLICES_FRAME_RATE 60
+#define MAX_MB_SLICE_WIDTH 4096
+#define MAX_MB_SLICE_HEIGHT 2160
+#define MAX_BYTES_SLICE_WIDTH 1920
+#define MAX_BYTES_SLICE_HEIGHT 1088
+#define MIN_HEVC_SLICE_WIDTH 384
+#define MIN_AVC_SLICE_WIDTH 192
+#define MIN_SLICE_HEIGHT 128
 
 static inline bool iris_valid_cap_id(enum platform_inst_fw_cap_type cap_id)
 {
@@ -112,6 +121,12 @@ static enum platform_inst_fw_cap_type iris_get_cap_id(u32 id)
 		return IR_TYPE;
 	case V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD:
 		return IR_PERIOD;
+	case V4L2_CID_MPEG_VIDEO_MULTI_SLICE_MODE:
+		return SLICE_MODE;
+	case V4L2_CID_MPEG_VIDEO_MULTI_SLICE_MAX_BYTES:
+		return SLICE_MAX_BYTES;
+	case V4L2_CID_MPEG_VIDEO_MULTI_SLICE_MAX_MB:
+		return SLICE_MAX_MB;
 	default:
 		return INST_FW_CAP_MAX;
 	}
@@ -213,6 +228,12 @@ static u32 iris_get_v4l2_id(enum platform_inst_fw_cap_type cap_id)
 		return V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD_TYPE;
 	case IR_PERIOD:
 		return V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD;
+	case SLICE_MODE:
+		return V4L2_CID_MPEG_VIDEO_MULTI_SLICE_MODE;
+	case SLICE_MAX_BYTES:
+		return V4L2_CID_MPEG_VIDEO_MULTI_SLICE_MAX_BYTES;
+	case SLICE_MAX_MB:
+		return V4L2_CID_MPEG_VIDEO_MULTI_SLICE_MAX_MB;
 	default:
 		return 0;
 	}
@@ -996,6 +1017,74 @@ int iris_set_ir_period(struct iris_inst *inst, enum platform_inst_fw_cap_type ca
 					     &ir_period, sizeof(u32));
 }
 
+int iris_set_slice_count(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
+{
+	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
+	u32 slice_mode = inst->fw_caps[SLICE_MODE].value;
+	u32 bitrate = inst->fw_caps[BITRATE].value;
+	u32 rc_type = inst->fw_caps[BITRATE_MODE].value;
+	u32 fps = inst->frame_rate;
+	u32 output_width = inst->fmt_dst->fmt.pix_mp.width;
+	u32 output_height = inst->fmt_dst->fmt.pix_mp.height;
+	u32 mbpf = NUM_MBS_PER_FRAME(output_height, output_width);
+	u32 max_width, max_height, min_width, min_height;
+	u32 max_avg_slicesize, hfi_value, hfi_id;
+
+	if (slice_mode == V4L2_MPEG_VIDEO_MULTI_SLICE_MODE_SINGLE) {
+		dev_dbg(inst->core->dev, "slice mode is: %u, ignore setting to fw\n", slice_mode);
+		return 0;
+	}
+	if (!fps) {
+		dev_err(inst->core->dev, "Invalid frame rate %d\n", fps);
+		return -EINVAL;
+	}
+	if (fps > MAX_SLICES_FRAME_RATE ||
+		(rc_type != HFI_RC_OFF && rc_type != HFI_RC_CBR_CFR &&
+		rc_type != HFI_RC_CBR_VFR)) {
+		dev_err(inst->core->dev, "slice unsupported, fps: %u, rc_type: %#x\n",
+			fps, rc_type);
+		return -EINVAL;
+	}
+
+	max_width = (slice_mode == V4L2_MPEG_VIDEO_MULTI_SLICE_MODE_MAX_MB) ?
+			MAX_MB_SLICE_WIDTH : MAX_BYTES_SLICE_WIDTH;
+	max_height = (slice_mode == V4L2_MPEG_VIDEO_MULTI_SLICE_MODE_MAX_MB) ?
+			MAX_MB_SLICE_HEIGHT : MAX_BYTES_SLICE_HEIGHT;
+	min_width = (inst->codec == V4L2_PIX_FMT_HEVC) ?
+			MIN_HEVC_SLICE_WIDTH : MIN_AVC_SLICE_WIDTH;
+	min_height = MIN_SLICE_HEIGHT;
+
+	if (output_width < min_width || output_height < min_height ||
+		output_width > max_width || output_height > max_height) {
+		dev_err(inst->core->dev, "slice unsupported, codec: %#x wxh: [%dx%d]\n",
+			inst->codec, output_width, output_height);
+		return -EINVAL;
+	}
+
+	if (slice_mode == V4L2_MPEG_VIDEO_MULTI_SLICE_MODE_MAX_MB) {
+		hfi_value = inst->fw_caps[SLICE_MAX_MB].value;
+		hfi_value = max(hfi_value, mbpf / MAX_SLICES_PER_FRAME);
+		if (inst->codec == V4L2_PIX_FMT_HEVC)
+			hfi_value = (hfi_value + 3) / 4;
+		hfi_id = inst->fw_caps[SLICE_MAX_MB].hfi_id;
+	} else if (slice_mode == V4L2_MPEG_VIDEO_MULTI_SLICE_MODE_MAX_BYTES) {
+		hfi_value = inst->fw_caps[SLICE_MAX_BYTES].value;
+		if (rc_type != HFI_RC_OFF) {
+			max_avg_slicesize = ((bitrate / fps) / 8) / MAX_SLICES_PER_FRAME;
+			hfi_value = max(hfi_value, max_avg_slicesize);
+		}
+		hfi_id = inst->fw_caps[SLICE_MAX_BYTES].hfi_id;
+	} else {
+		return -EINVAL;
+	}
+
+	return hfi_ops->session_set_property(inst, hfi_id,
+					     HFI_HOST_FLAGS_NONE,
+					     iris_get_port_info(inst, cap_id),
+					     HFI_PAYLOAD_U32,
+					     &hfi_value, sizeof(u32));
+}
+
 int iris_set_properties(struct iris_inst *inst, u32 plane)
 {
 	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.h b/drivers/media/platform/qcom/iris/iris_ctrls.h
index 9518803577bc..5280ee00d9a0 100644
--- a/drivers/media/platform/qcom/iris/iris_ctrls.h
+++ b/drivers/media/platform/qcom/iris/iris_ctrls.h
@@ -35,6 +35,7 @@ int iris_set_qp_range(struct iris_inst *inst, enum platform_inst_fw_cap_type cap
 int iris_set_rotation(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
 int iris_set_flip(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
 int iris_set_ir_period(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
+int iris_set_slice_count(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
 int iris_set_properties(struct iris_inst *inst, u32 plane);
 
 #endif
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
index cecf771c55dd..8a27f246e114 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
@@ -71,6 +71,8 @@ enum hfi_rate_control {
 #define HFI_PROP_MIN_QP_PACKED			0x0300012f
 #define HFI_PROP_MAX_QP_PACKED			0x03000130
 #define HFI_PROP_IR_RANDOM_PERIOD		0x03000131
+#define HFI_PROP_MULTI_SLICE_MB_COUNT		0x03000132
+#define HFI_PROP_MULTI_SLICE_BYTES_COUNT	0x03000133
 #define HFI_PROP_TOTAL_BITRATE			0x0300013b
 #define HFI_PROP_MAX_GOP_FRAMES			0x03000146
 #define HFI_PROP_MAX_B_FRAMES			0x03000147
diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index 5a489917580e..05962d8fbb25 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -159,6 +159,9 @@ enum platform_inst_fw_cap_type {
 	VFLIP,
 	IR_TYPE,
 	IR_PERIOD,
+	SLICE_MODE,
+	SLICE_MAX_BYTES,
+	SLICE_MAX_MB,
 	INST_FW_CAP_MAX,
 };
 
diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
index 5da90d47f9c6..191154a8ab8d 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
@@ -18,6 +18,8 @@
 
 #define VIDEO_ARCH_LX 1
 #define BITRATE_MAX				245000000
+#define MAX_SLICE_MB_SIZE         \
+	(((4096 + 15) >> 4) * ((2304 + 15) >> 4))
 
 static struct iris_fmt platform_fmts_sm8550_dec[] = {
 	[IRIS_FMT_H264] = {
@@ -740,6 +742,35 @@ static const struct platform_inst_fw_cap inst_fw_cap_sm8550_enc[] = {
 			CAP_FLAG_DYNAMIC_ALLOWED,
 		.set = iris_set_ir_period,
 	},
+	{
+		.cap_id = SLICE_MODE,
+		.min = V4L2_MPEG_VIDEO_MULTI_SLICE_MODE_SINGLE,
+		.max = V4L2_MPEG_VIDEO_MULTI_SLICE_MODE_MAX_BYTES,
+		.step_or_mask = BIT(V4L2_MPEG_VIDEO_MULTI_SLICE_MODE_SINGLE) |
+					BIT(V4L2_MPEG_VIDEO_MULTI_SLICE_MODE_MAX_MB) |
+					BIT(V4L2_MPEG_VIDEO_MULTI_SLICE_MODE_MAX_BYTES),
+		.value = V4L2_MPEG_VIDEO_MULTI_SLICE_MODE_SINGLE,
+		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
+		.set = iris_set_slice_count,
+	},
+	{
+		.cap_id = SLICE_MAX_BYTES,
+		.min = 512,
+		.max = BITRATE_MAX >> 3,
+		.step_or_mask = 1,
+		.value = 512,
+		.hfi_id = HFI_PROP_MULTI_SLICE_BYTES_COUNT,
+		.flags = CAP_FLAG_OUTPUT_PORT,
+	},
+	{
+		.cap_id = SLICE_MAX_MB,
+		.min = 1,
+		.max = MAX_SLICE_MB_SIZE,
+		.step_or_mask = 1,
+		.value = 1,
+		.hfi_id = HFI_PROP_MULTI_SLICE_MB_COUNT,
+		.flags = CAP_FLAG_OUTPUT_PORT,
+	},
 };
 
 static struct platform_inst_caps platform_inst_cap_sm8550 = {

---
base-commit: 4fbeef21f5387234111b5d52924e77757626faa5
change-id: 20260425-iris_multi_slice-81cfdc651997

Best regards,
-- 
Sachin Kumar Garg <sachin.garg@oss.qualcomm.com>


