Return-Path: <linux-arm-msm+bounces-95276-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IKgSOcL5p2mtmwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95276-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Mar 2026 10:22:10 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 544301FD810
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Mar 2026 10:22:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B6F8F3083DD5
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Mar 2026 09:20:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 676B8364EA3;
	Wed,  4 Mar 2026 09:20:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EJLxzpsA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SUkFCX09"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7E7F395261
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Mar 2026 09:20:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772616025; cv=none; b=LzM0RJocB/bi4XKP9sPlkV5KHYyLmW+a9qneu+5DQBt6bRq7AEfEQbW7198JFqGcYxbxTBXHjj/L2yfLDqg2j5kXHZ/Yey4SWxkgeWxqSx2WUY6plZ4CA0HYoszhbS2uftUIrM2cT67VjFrk9nisd3mzPNtOwH5BWaKNYgv5Kbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772616025; c=relaxed/simple;
	bh=8ABxF8KGWyosxpUtDGwgLl2L+AgpEgGxwR2CtQsrr9o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Tw6wvhMzRDX5qj+r8HiCbAUtI/igkcZbwGJx3yDg3sU0vNEWAonJahCgF9x4pS/gno6gImbKAYryJbGyrJc2S/4pfsg7RfoMgstlhKRTUpOG0m7iyyQEgsX+3neFCN4hvxFyOKKzXIZw9XkZc3n0EpnWkE7RfOyvdAEmqDMkQLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EJLxzpsA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SUkFCX09; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6245SQD2631876
	for <linux-arm-msm@vger.kernel.org>; Wed, 4 Mar 2026 09:20:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=/M3P51h1a1yRann62VX77s
	1NXUJKicz1Y0SDE55UB5Q=; b=EJLxzpsA+/w8ts3WmSF2pXGIAkzsMUVwccnPC5
	vL5OfHiBJwnaNzkMYbmd/XBCBUmf2whww83iUz58PXpGerDqSw8JMEyeRJUsIOkD
	l6irhr/vzlJkiho2l2zENMLtbuwhCwu3H6E3iq1TnlLKSDrZN+W/JCO6ychubRrD
	P023RPMZb/4liBIDfMc2Q/ifg9VjI1atgS/EmGLdo6JPW1LYt0ATop6ktug3WEK6
	R2cPpkM6e2F3wkFPIXBNZy2RU4XmiXnxyPu6GS4R5kDhchTBKozSd8PCPksz5g9c
	COTyJkjKscs6vfIpp6e/c39JX0FeGMW1UfoIXaMJ/vWYOJ5w==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cnvtucec9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 04 Mar 2026 09:20:20 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-35986cc87a6so3296481a91.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Mar 2026 01:20:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772616019; x=1773220819; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/M3P51h1a1yRann62VX77s1NXUJKicz1Y0SDE55UB5Q=;
        b=SUkFCX09ZUDfYxLa7dDtBgreTlEM5HQJoFRyYH1MY3CxiMbU5P4cJTaNy0oTuTNi8k
         c+XBN0YY2nA0czoRlKRCFIVFcGZSb0rbKs5ko8wvqy1HwS2eLsYrogJDIl9blRk8eZat
         dkAvOEGuRF7I2CeKdrRvlQu2a7pnIxF1FrVkTOofB0yHD9Sq+lGLq4eaOMwnmwtbVEUT
         ar6TicknmJzKD8gdQnk/Rz8v02743heOhnmnXGn1bjuBW09dPVQu9BuBvjAOmeb4IyUv
         5IX8/S92RB9ldPS5bf8xp9cKKFEnFqZ+r5tuq7+TwuqaQKg19j/BAaDRpBOTdeyAjyle
         uujA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772616019; x=1773220819;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/M3P51h1a1yRann62VX77s1NXUJKicz1Y0SDE55UB5Q=;
        b=YCKPHjuFgXwJSClsP9yOvUsRduvvhx6ukIFgZbZEP+lQQ0kZoVIXEz0te7ix2O6ELG
         YWNB+m+Z5e4g7VWonNNel/ti0LBuvjEQq2PNSzA1jp+gRNt5MK0fCyWC2MDgLe/BS0H4
         oMa+3jiTs1C209Qk295eqYH53betwU+aE28uq19yejiqfFbkxfC+ZpmOQ0qkjKhn+8lN
         4lpCdAf8JxeRX45vsaPAZ7OEEHx8f8o0Dl7cA2lGuc2XxNRIA/KT5gm1nwgH+PnI3QfE
         HiDhnhFRvOBGCzftEvESivpB3TWVpsZPpLRYnnPeIEmly7w/MturgEI3G+CrdBa7K6Ac
         GvBA==
X-Forwarded-Encrypted: i=1; AJvYcCV802/Cb9F8EwJ25mGZjvTKBRmviGPZ5Cz1gDHr3gS4jehJWlxjnt6NCTqhPPU2nefBv6Pi+aSAVD6vkx9g@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1yksnrxJuUvrWl069q6p4bCpIN0haoWq40jAvseG6CBPqCmCY
	wn6HMe8qCRpiYodkdVd9w6Uh0kX0nYmLVaSaRVrCgbxfdMKLMlNJxZQW/0511BdWKkAuwpOxLCR
	+l2EYgKmr+4aM9+MTHyiDQBKp9S4C90S19JQSV5N7rF4C/lZ/PhsNzacB/MLIiRcsQofM
X-Gm-Gg: ATEYQzzZ4FkVVdmxP8jwH//cezs+qyhHHyjFM+BRGjyRvvq5IQelqVeo95KzipEltkm
	bS524o4I0468xSelk3Pfjne3O2m2F3C6dNmi5EZB7MRgNDj7N/J0vkH8j5kqIxP8637pRZIUqIX
	mgoynlUxMDhkWRIwPpP4nvjfAWvyQs8O3KMqi2JxYzSf68j6uX6k9sfKT0OB7KW4VAwsMQJ0lHg
	gIkHkk9Ir110cIoF99lv+0jqeSrtPenpUY4s/4/hG5u+wx7r6bBQrcjyNP+wfTPXiLBKU5D0QwI
	rsQP7PBkhicj4lh8dMXJ2DDhRNGSUDib9v2hfGG7nh8FSSTSI0R5S2+j0k8tIDuLV7q16Z2WO5y
	SlpYfsf6TS5+/0glWuwVO2c+uZKlR+5GCZAMDUG1jP8t2V9AfrczxLLw=
X-Received: by 2002:a17:90b:2ccf:b0:354:bd08:4802 with SMTP id 98e67ed59e1d1-359a6a7c458mr1241512a91.35.1772616019483;
        Wed, 04 Mar 2026 01:20:19 -0800 (PST)
X-Received: by 2002:a17:90b:2ccf:b0:354:bd08:4802 with SMTP id 98e67ed59e1d1-359a6a7c458mr1241499a91.35.1772616018970;
        Wed, 04 Mar 2026 01:20:18 -0800 (PST)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae4651e409sm123643265ad.44.2026.03.04.01.20.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 01:20:18 -0800 (PST)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Wed, 04 Mar 2026 14:48:54 +0530
Subject: [PATCH] media: iris: add FPS calculation and VPP FW overhead in
 frequency formula
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260304-update_fps_calculation-v1-1-4eeac373a504@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAP34p2kC/yWMWwqDMBAAryL73UDUaGKvUkTW7KYN+GoSS0G8e
 0P9nIGZAyIHzxHuxQGBPz76dclQ3gqwL1yeLDxlhkpWraylEvtGmHhwWxwsTnafMOVEdIZZO91
 IPZaQ4y2w89//+NFfHPi953+6JIwYWdh1nn26F66RDXfaUIlSqQppHImVQabaWGkUEWNLLUN/n
 j+xY9wLtAAAAA==
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772616015; l=4136;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=8ABxF8KGWyosxpUtDGwgLl2L+AgpEgGxwR2CtQsrr9o=;
 b=3pv5kCDvQZyFvKiptpI/HpmnbMCL4Q6+sQGcxCof/YQtHdtCPqLdNTyWjgagdYeb6a/jIMEy8
 R90QfE/2394DNFLI/ehIOldVdh484LgMkHmSsUxm3yVhou6zdvO5OGl
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-GUID: qjde20omMlJW4MHxiNFZDSI27Qxk3xI-
X-Proofpoint-ORIG-GUID: qjde20omMlJW4MHxiNFZDSI27Qxk3xI-
X-Authority-Analysis: v=2.4 cv=A75h/qWG c=1 sm=1 tr=0 ts=69a7f954 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=aZFUA4iBNJJznah6NdIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDA3MCBTYWx0ZWRfX0RAeJumarVUL
 Myi6hO3MOHhYw62YU4dXsQTzMROG1pRd9NFF/4YXhj1JQz7zKaRaUTf4t7abwBuykI55asDYEYX
 iWVLohjoI9Z4or9WFLnQ1j+Ycg5ubK+U3pvgVZJ2hxSzUn9vyiVzmCw2iDtN0RYmpb59IOILogB
 wta8dTAgSaXSfIaT9Wa1X0iEaSIIOCStBF1ohoReZyks+AFdzwQfEy25mzVf5J/TNpUrtOLYJc1
 jDd8Bh5W5MIP3N8pmrSswuArrBNkYe9HCBVXhWoKi5R1OkOLPuSUBxgimTwxP3ruxXjX8pMsI7x
 17Gl6UDcC1f6JFEkDWR6zRpMIxWpCgvi9Qa5Ncnf7yfejqc5sr6bgAzHriSZI3ftSmvVK9+8FVs
 +M7+qbJRnzThLby8/uD0xwEPgdqxvPmN/jZLXXjzwp/EvB8/rtCXObMqMwgOxtAD6PaLSLzWgB4
 BtFgMV9nKf34USYyN6w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_04,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0
 adultscore=0 clxscore=1015 bulkscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603040070
X-Rspamd-Queue-Id: 544301FD810
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-95276-lists,linux-arm-msm=lfdr.de];
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
X-Rspamd-Action: no action

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
 drivers/media/platform/qcom/iris/iris_instance.h   |  2 ++
 drivers/media/platform/qcom/iris/iris_vdec.c       | 21 +++++++++++++++++++++
 drivers/media/platform/qcom/iris/iris_vpu_common.c |  6 +++++-
 3 files changed, 28 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_instance.h b/drivers/media/platform/qcom/iris/iris_instance.h
index 16965150f427..180cba36a7f2 100644
--- a/drivers/media/platform/qcom/iris/iris_instance.h
+++ b/drivers/media/platform/qcom/iris/iris_instance.h
@@ -109,6 +109,8 @@ struct iris_inst {
 	u32				metadata_idx;
 	u32				codec;
 	bool				last_buffer_dequeued;
+	u64				last_buf_recv_time_ns;
+	u32				frame_count;
 	u32				frame_rate;
 	u32				operating_rate;
 	u32				hfi_rc_type;
diff --git a/drivers/media/platform/qcom/iris/iris_vdec.c b/drivers/media/platform/qcom/iris/iris_vdec.c
index 719217399a30..88820060e22a 100644
--- a/drivers/media/platform/qcom/iris/iris_vdec.c
+++ b/drivers/media/platform/qcom/iris/iris_vdec.c
@@ -369,6 +369,8 @@ int iris_vdec_streamon_input(struct iris_inst *inst)
 	if (ret)
 		return ret;
 
+	inst->frame_count = 0;
+
 	return iris_process_streamon_input(inst);
 }
 
@@ -411,6 +413,7 @@ int iris_vdec_qbuf(struct iris_inst *inst, struct vb2_v4l2_buffer *vbuf)
 {
 	struct iris_buffer *buf = to_iris_buffer(vbuf);
 	struct vb2_buffer *vb2 = &vbuf->vb2_buf;
+	u64 cur_buf_recv_time_ns, time_delta_ns;
 	struct vb2_queue *q;
 	int ret;
 
@@ -427,6 +430,24 @@ int iris_vdec_qbuf(struct iris_inst *inst, struct vb2_v4l2_buffer *vbuf)
 		return 0;
 	}
 
+	if (buf->type == BUF_INPUT) {
+		cur_buf_recv_time_ns = ktime_get_ns();
+
+		if (inst->frame_count == 0) {
+			inst->last_buf_recv_time_ns = cur_buf_recv_time_ns;
+			inst->frame_rate = MAXIMUM_FPS;
+		}
+		time_delta_ns = cur_buf_recv_time_ns - inst->last_buf_recv_time_ns;
+
+		if (time_delta_ns >= NSEC_PER_SEC) {
+			inst->frame_rate = clamp_t(u32, inst->frame_count, DEFAULT_FPS,
+						   MAXIMUM_FPS);
+			inst->last_buf_recv_time_ns = cur_buf_recv_time_ns;
+			inst->frame_count = 0;
+		}
+		inst->frame_count++;
+	}
+
 	iris_scale_power(inst);
 
 	return iris_queue_buffer(inst, buf);
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.c b/drivers/media/platform/qcom/iris/iris_vpu_common.c
index 548e5f1727fd..3ccc8feff678 100644
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
 
+	/* 1.050 is VPP FW overhead */
+	if (inst->fw_caps[STAGE].value == STAGE_2)
+		vpp_cycles += div_u64(vpp_cycles * 50, 1000);
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


