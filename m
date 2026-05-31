Return-Path: <linux-arm-msm+bounces-110444-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SL86CYHNG2prGQkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110444-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 31 May 2026 07:56:17 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C2786149CA
	for <lists+linux-arm-msm@lfdr.de>; Sun, 31 May 2026 07:56:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A07F9302BA61
	for <lists+linux-arm-msm@lfdr.de>; Sun, 31 May 2026 05:55:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51E117DA66;
	Sun, 31 May 2026 05:55:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eLuF/427";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Omz2gJHL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D38EA3264DE
	for <linux-arm-msm@vger.kernel.org>; Sun, 31 May 2026 05:55:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780206934; cv=none; b=m7w1MuF9z/5qe7JjlX0IliAQ/ACdbpkNdOtViud95xf5BXokHC/GhH/FKyWCYDkdF0WpqMe3chUbuorQkYNs/Ly6oZnt6uqvcdY3ScrELq67eVnmE7bExlfZzJH47dTzvpq4DpvDSZCoJzxQgvocASfgX1UnNkTtAo+9NRfEIV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780206934; c=relaxed/simple;
	bh=2wDUGwNJnnoaQiVEwY7nGl7/imywJz1LeFcyb3cZxEc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nJ0Rfx9Byqh9J6g6F4SL+c/lfYuJ1Q5+BqepMYWV7nuodAVlCPZmHJPW7IS+bvjLHgqGLiCRjN8VaRkeGKkkyDIHb60Iuw234MD6XtS+2G2c0ExH+VwJRBUcqPYBwbqXu0S62LiM9zw2klI6+3orckMUr2SpUBazvAXteFitVvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eLuF/427; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Omz2gJHL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64UNnqlH295267
	for <linux-arm-msm@vger.kernel.org>; Sun, 31 May 2026 05:55:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BXM56e/y7AP/IChoOzUGo6IPhuY5BvOU0TGBXjBtMEM=; b=eLuF/427Mw84TC4r
	Z9WzOCmiWQZVcSDN1H98pOsKVWoaX7DZPz9kfC7x4NlGqhzodNklTolZzWHVhldz
	RBLnD57v7cIw9TnXGUwNHPjBM/JRqSvZOJ0Iui8DLjOY2VJ2Fwk6NZF391cLE4/0
	2nUAlFTre/Q7u3XLNiIPlsxb1CxWZTOy2ca+FhbM0iyN8aaZGu5tJIZbF5a02sIt
	JnlWtY1KHRUBBB0IxAL2BrZzK+fZLiVBHzlSJK5Aha7Sc0rCBsnZbA8kgT+LM25s
	oB+4oHjMYinkdDs3WeiYWwMwDzeTaa0/4/DEastswHH1l0+j2xMyzY+Y4+LtFz7x
	BCHyXA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4efs2hare0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 31 May 2026 05:55:32 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2bd04e4fe3dso135997885ad.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 30 May 2026 22:55:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780206931; x=1780811731; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BXM56e/y7AP/IChoOzUGo6IPhuY5BvOU0TGBXjBtMEM=;
        b=Omz2gJHLMV7OQm8OlvWjbmN2Te1VkH1opAPfMTX4pNqCtXNc155vvLsnBsGL3+0NfZ
         xtg1THGtDR1HD2bGRq6PvM3uYGwnahxGMudeB7CscCZC2AdfM1RmBgCcxuCEaYzgMBlT
         E6MgEQmJglsFg9obF/MhsYy8w4RqwBcCSCle9bx+tZtkj7MQbrUtIPfDmWt6NbP+6ve7
         6fcE71ZZeGncHpQAaKDOUMIOEdb1sC74QoXe9DBCwBMWucTDEtlisje6z5U6Ic7Z1Afm
         NzvjpMxa44X6JkJVNUO5w6r5Q1hfvxx+x9YXlueAyKzVYlflwoyjrgk2+ekKWgmsOvEK
         BBpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780206931; x=1780811731;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BXM56e/y7AP/IChoOzUGo6IPhuY5BvOU0TGBXjBtMEM=;
        b=ggTWh/QIANW4ppmHBPwSZ1AfgDlvuAXksJ8/aqb9nRvUxW6s4SrHSc/UOS1kQ5SAw5
         gx4kUcK9SlhvTiAcwCHtzUePsWcPPmgf89ky0gSj4+GV8+VYeHifvLQ3r7i76idMSnU4
         7OcvXRyuQ2M5+JW9WmiDaiMpzbwVFmnRCp2OfLrUTpWByE0s0Fk25LwwONXK8gsyd+RM
         N7rjYz6etkIcJPZGaS0PlItG5ULU+9Jl5BeSp0gav9+Q4eYeyOB0zf35WCkOrYHXa3Lp
         ppiCQATRT5Wo9OXi2OZ9dKwZq1Z/koUK7jdPoUYqlNwwTtJzMMpCCr/o3LYEyole1Wv5
         lx/Q==
X-Forwarded-Encrypted: i=1; AFNElJ++c+i3veMVSqRQwhr9n22UfX7nbENQkewsheuSSuemYvkHl8Pucjf2pKVvSQPDbfwZKcxTyXM33pU8ZedH@vger.kernel.org
X-Gm-Message-State: AOJu0Ywx40gLl7J6OkbAw2saPZ2fkkAOuchsePRkU2SPQJu4cBuFe0Kq
	eesRWfLKdEieJv4dlM1X9OltM6zvsd5u7AAmhTuJVDXo4SlvVyciynrh5NPTfGLZ5rHV64yH1Z3
	NaAHcZZ74RzXPUPdS64wZ/tOe+A7KEDjeojzVLtsPMnuP3qP7FYqgR8srH++Wz4C9YQXbnJ8P7A
	Yy
X-Gm-Gg: Acq92OGGDUlFIpeAE4AOyZrjhBE018yyDU73En8urCmwv5PRl56epq59D1LGjHZvSbd
	10EsXBLGLtyYhZVpGsSl197G3z8pdGIcEn1mglkT98q8qRpI3AGaJL3XrrDHPARs2hZtns2VRQA
	cpaaHcBttqIhk1x5+uv4qhssmuf7Sbe1RBtYZNeoQmwqGQlLvR9joLiLgY4PoGnVGz/OF1q1BtM
	cgixjGhpXCwrzeK98Wirwvo4u+mbU9AKmXbe1SMCe+kWi5AM35nUg5lqR4eNjOqFBZSehvv7ZGL
	UbXQMjYwXFBfKXXGphZuqyEQ9zFtC/NjPRUEtc7QHGS4LIVrXjMGM6I/Vj0eJzr5gxbR5LS5PP1
	Wfi6bxQmd0+1s7fx3gi/AEwV9hKqhaW8zrRdI/qQ8ZIYqXr1r5CfeEHNex5D/UjcokA==
X-Received: by 2002:a17:903:1905:b0:2ba:924b:3948 with SMTP id d9443c01a7336-2bf367e4391mr77834265ad.15.1780206931500;
        Sat, 30 May 2026 22:55:31 -0700 (PDT)
X-Received: by 2002:a17:903:1905:b0:2ba:924b:3948 with SMTP id d9443c01a7336-2bf367e4391mr77834065ad.15.1780206931035;
        Sat, 30 May 2026 22:55:31 -0700 (PDT)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf239e702fsm67124375ad.4.2026.05.30.22.55.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 May 2026 22:55:30 -0700 (PDT)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Sun, 31 May 2026 11:20:35 +0530
Subject: [PATCH v3 1/7] media: qcom: iris: Centralize internal buffer table
 selection
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260531-iris-code-improvement-v3-1-4c699c3dd719@oss.qualcomm.com>
References: <20260531-iris-code-improvement-v3-0-4c699c3dd719@oss.qualcomm.com>
In-Reply-To: <20260531-iris-code-improvement-v3-0-4c699c3dd719@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780206921; l=8143;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=BZOdvz5iarQDnl8uGdnmlUoVqz3/4hTjx21nuSXgFvI=;
 b=03jCnFQheIXzUvky9qOzq4x7dQ6FDyu4wTNiebYH+IT83uTXII/QHXGW3d850PoMWl+Vl2dv4
 g/sZ2OfV9pUCvX81x/TV69lArDXznK7qjtYbno6SRKncTfZlw3/Dj0L
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTMxMDA2MiBTYWx0ZWRfX8TDsQfoLFy7D
 +3R5zWNdSk/xD3qKyM6gw9h8289NxPsZtN8LHvZkhzkVzAfP3ixQRm8irqqhZGdHdv5OoH3cHCg
 KN2L4kT6V8x0osoJr3/t4mOulf64IyCsb/GkAQsMnaewcDwlHuyiRJHtlzEVK6+Af8O+TCMquMx
 t3ZwfdMV5kbPngiHGMHzg5Xlfnr/lRQ94wP1oM7qd0qocic/XWaHG72ouhaJk+eqF1e2T4lzLCv
 gI6zShyOrUCPWHDVdh1RU/S+M4eTo3FGQq5/y7VtNGHEDStHs0nmJZvx/KChhImhyO6hKizz7CS
 yRbNW+m/MHpLULEazEPcqJUs95klH3FfAmHNzaFLoNbtzoJrm7EYiFsO0uvjswSjiLFODC5aVTK
 sGMTIpXatnnWmEm3btPqli0dSnnGwnp1K88cUyATTcpue8d5goskJzVZe24BbR38ysJX3W7aFJU
 9Lk0nMiarpWpsDY8IaQ==
X-Proofpoint-ORIG-GUID: Tf4X-S7WPsEqi_wMvoV9Sr1rG3YVCu-V
X-Proofpoint-GUID: Tf4X-S7WPsEqi_wMvoV9Sr1rG3YVCu-V
X-Authority-Analysis: v=2.4 cv=UIvt2ify c=1 sm=1 tr=0 ts=6a1bcd54 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=22hBRqbxvLe5Obw_dBcA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-31_02,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 impostorscore=0 adultscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605310062
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
	TAGGED_FROM(0.00)[bounces-110444-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[busanna.reddy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,cisco];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 7C2786149CA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

Internal buffer table dispatch is duplicated across multiple Iris code
paths, which is error‑prone and makes future changes harder to reason
about.

Consolidate the buffer dispatch logic into a single helper so that table
selection is defined in exactly one place and keep call sites minimal.
No functional change intended.

Reviewed-by: Bryan O'Donoghue <bod@kernel.org>
Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_buffer.c | 107 ++++++-------------------
 1 file changed, 26 insertions(+), 81 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_buffer.c b/drivers/media/platform/qcom/iris/iris_buffer.c
index ef7f6f931557..73b4d3381e47 100644
--- a/drivers/media/platform/qcom/iris/iris_buffer.c
+++ b/drivers/media/platform/qcom/iris/iris_buffer.c
@@ -299,39 +299,41 @@ static void iris_fill_internal_buf_info(struct iris_inst *inst,
 	buffers->min_count = iris_vpu_buf_count(inst, buffer_type);
 }
 
-void iris_get_internal_buffers(struct iris_inst *inst, u32 plane)
+static void iris_get_int_buf_tbl(struct iris_inst *inst, u32 plane,
+				 const u32 **internal_buf_type, u32 *internal_buffer_count)
 {
 	const struct iris_firmware_data *firmware_data = inst->core->iris_firmware_data;
-	const u32 *internal_buf_type;
-	u32 internal_buffer_count, i;
 
 	if (inst->domain == DECODER) {
 		if (V4L2_TYPE_IS_OUTPUT(plane)) {
-			internal_buf_type = firmware_data->dec_ip_int_buf_tbl;
-			internal_buffer_count = firmware_data->dec_ip_int_buf_tbl_size;
-			for (i = 0; i < internal_buffer_count; i++)
-				iris_fill_internal_buf_info(inst, internal_buf_type[i]);
+			*internal_buf_type = firmware_data->dec_ip_int_buf_tbl;
+			*internal_buffer_count = firmware_data->dec_ip_int_buf_tbl_size;
 		} else {
-			internal_buf_type = firmware_data->dec_op_int_buf_tbl;
-			internal_buffer_count = firmware_data->dec_op_int_buf_tbl_size;
-			for (i = 0; i < internal_buffer_count; i++)
-				iris_fill_internal_buf_info(inst, internal_buf_type[i]);
+			*internal_buf_type = firmware_data->dec_op_int_buf_tbl;
+			*internal_buffer_count = firmware_data->dec_op_int_buf_tbl_size;
 		}
 	} else {
 		if (V4L2_TYPE_IS_OUTPUT(plane)) {
-			internal_buf_type = firmware_data->enc_ip_int_buf_tbl;
-			internal_buffer_count = firmware_data->enc_ip_int_buf_tbl_size;
-			for (i = 0; i < internal_buffer_count; i++)
-				iris_fill_internal_buf_info(inst, internal_buf_type[i]);
+			*internal_buf_type = firmware_data->enc_ip_int_buf_tbl;
+			*internal_buffer_count = firmware_data->enc_ip_int_buf_tbl_size;
 		} else {
-			internal_buf_type = firmware_data->enc_op_int_buf_tbl;
-			internal_buffer_count = firmware_data->enc_op_int_buf_tbl_size;
-			for (i = 0; i < internal_buffer_count; i++)
-				iris_fill_internal_buf_info(inst, internal_buf_type[i]);
+			*internal_buf_type = firmware_data->enc_op_int_buf_tbl;
+			*internal_buffer_count = firmware_data->enc_op_int_buf_tbl_size;
 		}
 	}
 }
 
+void iris_get_internal_buffers(struct iris_inst *inst, u32 plane)
+{
+	const u32 *internal_buf_type;
+	u32 internal_buffer_count, i;
+
+	iris_get_int_buf_tbl(inst, plane, &internal_buf_type, &internal_buffer_count);
+
+	for (i = 0; i < internal_buffer_count; i++)
+		iris_fill_internal_buf_info(inst, internal_buf_type[i]);
+}
+
 static int iris_create_internal_buffer(struct iris_inst *inst,
 				       enum iris_buffer_type buffer_type, u32 index)
 {
@@ -366,29 +368,12 @@ static int iris_create_internal_buffer(struct iris_inst *inst,
 
 int iris_create_internal_buffers(struct iris_inst *inst, u32 plane)
 {
-	const struct iris_firmware_data *firmware_data = inst->core->iris_firmware_data;
 	u32 internal_buffer_count, i, j;
 	struct iris_buffers *buffers;
 	const u32 *internal_buf_type;
 	int ret;
 
-	if (inst->domain == DECODER) {
-		if (V4L2_TYPE_IS_OUTPUT(plane)) {
-			internal_buf_type = firmware_data->dec_ip_int_buf_tbl;
-			internal_buffer_count = firmware_data->dec_ip_int_buf_tbl_size;
-		} else {
-			internal_buf_type = firmware_data->dec_op_int_buf_tbl;
-			internal_buffer_count = firmware_data->dec_op_int_buf_tbl_size;
-		}
-	} else {
-		if (V4L2_TYPE_IS_OUTPUT(plane)) {
-			internal_buf_type = firmware_data->enc_ip_int_buf_tbl;
-			internal_buffer_count = firmware_data->enc_ip_int_buf_tbl_size;
-		} else {
-			internal_buf_type = firmware_data->enc_op_int_buf_tbl;
-			internal_buffer_count = firmware_data->enc_op_int_buf_tbl_size;
-		}
-	}
+	iris_get_int_buf_tbl(inst, plane, &internal_buf_type, &internal_buffer_count);
 
 	for (i = 0; i < internal_buffer_count; i++) {
 		buffers = &inst->buffers[internal_buf_type[i]];
@@ -442,30 +427,13 @@ int iris_queue_internal_deferred_buffers(struct iris_inst *inst, enum iris_buffe
 
 int iris_queue_internal_buffers(struct iris_inst *inst, u32 plane)
 {
-	const struct iris_firmware_data *firmware_data = inst->core->iris_firmware_data;
 	struct iris_buffer *buffer, *next;
 	struct iris_buffers *buffers;
 	const u32 *internal_buf_type;
 	u32 internal_buffer_count, i;
 	int ret;
 
-	if (inst->domain == DECODER) {
-		if (V4L2_TYPE_IS_OUTPUT(plane)) {
-			internal_buf_type = firmware_data->dec_ip_int_buf_tbl;
-			internal_buffer_count = firmware_data->dec_ip_int_buf_tbl_size;
-		} else {
-			internal_buf_type = firmware_data->dec_op_int_buf_tbl;
-			internal_buffer_count = firmware_data->dec_op_int_buf_tbl_size;
-		}
-	} else {
-		if (V4L2_TYPE_IS_OUTPUT(plane)) {
-			internal_buf_type = firmware_data->enc_ip_int_buf_tbl;
-			internal_buffer_count = firmware_data->enc_ip_int_buf_tbl_size;
-		} else {
-			internal_buf_type = firmware_data->enc_op_int_buf_tbl;
-			internal_buffer_count = firmware_data->enc_op_int_buf_tbl_size;
-		}
-	}
+	iris_get_int_buf_tbl(inst, plane, &internal_buf_type, &internal_buffer_count);
 
 	for (i = 0; i < internal_buffer_count; i++) {
 		buffers = &inst->buffers[internal_buf_type[i]];
@@ -501,30 +469,13 @@ int iris_destroy_internal_buffer(struct iris_inst *inst, struct iris_buffer *buf
 
 static int iris_destroy_internal_buffers(struct iris_inst *inst, u32 plane, bool force)
 {
-	const struct iris_firmware_data *firmware_data = inst->core->iris_firmware_data;
 	struct iris_buffer *buf, *next;
 	struct iris_buffers *buffers;
 	const u32 *internal_buf_type;
 	u32 i, len;
 	int ret;
 
-	if (inst->domain == DECODER) {
-		if (V4L2_TYPE_IS_OUTPUT(plane)) {
-			internal_buf_type = firmware_data->dec_ip_int_buf_tbl;
-			len = firmware_data->dec_ip_int_buf_tbl_size;
-		} else {
-			internal_buf_type = firmware_data->dec_op_int_buf_tbl;
-			len = firmware_data->dec_op_int_buf_tbl_size;
-		}
-	} else {
-		if (V4L2_TYPE_IS_OUTPUT(plane)) {
-			internal_buf_type = firmware_data->enc_ip_int_buf_tbl;
-			len = firmware_data->enc_ip_int_buf_tbl_size;
-		} else {
-			internal_buf_type = firmware_data->enc_op_int_buf_tbl;
-			len = firmware_data->enc_op_int_buf_tbl_size;
-		}
-	}
+	iris_get_int_buf_tbl(inst, plane, &internal_buf_type, &len);
 
 	for (i = 0; i < len; i++) {
 		buffers = &inst->buffers[internal_buf_type[i]];
@@ -593,18 +544,12 @@ static int iris_release_internal_buffers(struct iris_inst *inst,
 
 static int iris_release_input_internal_buffers(struct iris_inst *inst)
 {
-	const struct iris_firmware_data *firmware_data = inst->core->iris_firmware_data;
 	const u32 *internal_buf_type;
 	u32 internal_buffer_count, i;
 	int ret;
 
-	if (inst->domain == DECODER) {
-		internal_buf_type = firmware_data->dec_ip_int_buf_tbl;
-		internal_buffer_count = firmware_data->dec_ip_int_buf_tbl_size;
-	} else {
-		internal_buf_type = firmware_data->enc_ip_int_buf_tbl;
-		internal_buffer_count = firmware_data->enc_ip_int_buf_tbl_size;
-	}
+	iris_get_int_buf_tbl(inst, V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
+			     &internal_buf_type, &internal_buffer_count);
 
 	for (i = 0; i < internal_buffer_count; i++) {
 		ret = iris_release_internal_buffers(inst, internal_buf_type[i]);

-- 
2.34.1


