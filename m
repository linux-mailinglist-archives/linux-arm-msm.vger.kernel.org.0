Return-Path: <linux-arm-msm+bounces-100499-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wBBiGNQTx2lUSgUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100499-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Mar 2026 00:33:40 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 01E7B34C52C
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Mar 2026 00:33:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E3AC13088E97
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 23:28:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2A3C37F743;
	Fri, 27 Mar 2026 23:28:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="n4bSSAJN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dq5rYIRT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 083B2393DD3
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 23:28:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774654139; cv=none; b=JoK16z+jXWp0+OnXj2lY9UYZBqyMuMsb/ziMGAvO1sCua0T6PTTusR+e3Tv2ogThR6VTI7ZqbWG/XGKJAaZXQrrJWEFWN0L5sqVnv1j1Lxf/L8f+MABvgXo3JZ6FK+dxTeHDmHRvICcHmvDg8qK4l2Xhk2BhbApjLWO4PHvVpvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774654139; c=relaxed/simple;
	bh=xFJdeT3yOlq/oRgFq0BzLBs7EsRlJjjKB4aOCgE5Kn8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=G2sxGlm7+9yT7rreM6aqrRJ+UbqyGky5n5s4UUsH++drFvU9ejPvWpjrFVLZK/5yBnTKxU78cQKr3aXXX7EfSN/dGJxVITKYZk0BT+JgedLBvVi6NX85VHk8uvw5hF8SKULAWGbI/qMgAgqa2CnZvpLsh1WPIYHDBkzhYiIGzGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=n4bSSAJN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dq5rYIRT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62RN4Loe2410944
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 23:28:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kiX3oiS3V2FER92MkVmW6VCS+AmFEidamWAh+fCmPtk=; b=n4bSSAJNDFooxQxG
	+S0V3GGikP+dmUmxUYSI5db2ehNnRbVwfDpnPUV1dbsH9MmzxD7tecujL9YVjsn+
	qrFrh9jRkrX8g5EqExB+0vLVDJYvkQMDqF2jbIqsOBrZkHVuw/qUnbDVKF65UtRE
	d2Rzrzz1QOLr3NzAETJPKrnThqlqz1Ag56c5SWAG8SnBFr36ahUYkldLPE93H+/9
	irv9NFuYs601q69i4XcEJdDg6LogArRtaGyClP3Uv0vTSMmhu4ZhpGzDu8zEr0Hx
	xEevQwgF6Rwg1sQtnvKxh6o+2UsAr1iZ9gk4EYIuBFa6matTnI4PIeDBOBhAotBj
	RSCbXA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d5vvv98qn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 23:28:53 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5093a985e21so23053271cf.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 16:28:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774654133; x=1775258933; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kiX3oiS3V2FER92MkVmW6VCS+AmFEidamWAh+fCmPtk=;
        b=dq5rYIRTttVAFdD0mDlWNYynEbY9ub61gSbR8c6lNaBqj1ge+fIhzijmxkmgTuTe6N
         yp2sNTotDPDp03Od3G0kEGgqRajLX7d7iBeDdteOQU/KenICiH7deX0HdPIefuqlqT63
         3p/ODgKGMpwBGa+NH6wHS2+8YPEJ+apJI3HeFJV4QECeHf6Pf7TYdyJrRR10YULfxETI
         X/zDtEaNteqZEHw3VKJv0KaWt+k3Nv/nSwBRvv/AtmALduO/Dhv0gMFbxinaYHzF/eUK
         Qp5BUXqzc+Byw39t2OWqLwaThfJhufNL4Um79JOrvQiW+GoWo4Frak63xHlzx/DwmCj4
         EeRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774654133; x=1775258933;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kiX3oiS3V2FER92MkVmW6VCS+AmFEidamWAh+fCmPtk=;
        b=Msvvfj2X9syQRHW8rwbXLxAtvTEqiZghp4AQ/On97QwOUPn+0RJ/j9okreoUUh/rs0
         W7DsRX9yccbJKX+ftz7gguTAyZE/OXfe22qLfpq62RNE/8J6uzddn1wJv66OvGbky7ab
         feba/Mc9s3XksaewHmWkWhHvKl3aXsdQpzR7THn2VdUF/TDD3Ij190IrgROi6wD4NVsA
         gckswTUVjZMa/wqO3B3daQAHE5YFZCNkRxXvBLWep2bvA+UhnY20CZNtV+06LwAJK04b
         EZrkrJFQ2wrwTpunnbaiRJhyRAm3OORNuWOS0xvyrsTrQphGlEonbgxx7YbIw5vUM3OW
         DwTQ==
X-Forwarded-Encrypted: i=1; AJvYcCVGCtJK7h2elS5U1Gom0kh0zkEBt3D72Gh0Gg/Xry2YkE4n8wyGGzmZwLfAuplnzBuxCS9K5HV7tbz+9A+O@vger.kernel.org
X-Gm-Message-State: AOJu0YxR2QuMbcifCZ6ikbfAmKPVTHltKwAFPlny4DoNGUSltm6ZNNRf
	0GKKGM8YlxaY6eVpyfBDgHicFYHaBJuOszbtN9LpktWvI/QaLyNsWFa7epfT2liJu8TFDhGNW1x
	IX6kgXebP7EtiGRo+I0UzaTp0lwd4FfEmoxSd1hfqyUmK09POUGd1EQMcyDRUwPMi/f9GsCUwIm
	VR
X-Gm-Gg: ATEYQzwLn7ncQWGJsW5pCafoiBLVanYRNCgc2f5m6n4f2STfTBtI88Eg6rr2kgYdaj/
	LubgpSCteYKpgR02Ls2sdDZwExYhEXZ9pmfJoM0rJleyPTb8MzT8XZi2r5rXodqHkcczoxYNZoU
	yBY5/M1I3hxy2sFjz6qKsoEnzR2DLW7GiYwPUvti/I9aO9SMpRn2WNogqLW8v40RymJy8NMeY1H
	XbMDYBEhCW+cvOVuPnWNSUpoq8+JbSLQk51u6DJ6JTKH9Ss2rPR87/ViVeJkEeTFEDNvfw2o/mB
	yh0xhmBzoKH8RXmNbKV2i7olll1EWl+T0HOz8gEhh6uP6cReklXTm+F1fpoHbGj5v5wpKei2np+
	ypb1qeOMGVsUDntYxiqPuwIQ7294JiDr6FLPcighUFPkKqmR61rt+FLi6+VF6vgNM+kRF8WHDjB
	9FqyFpAgk1YCvwYjJURtV0pispkeQWK5HLkS8=
X-Received: by 2002:ac8:5f06:0:b0:50b:3c7e:a33c with SMTP id d75a77b69052e-50ba391a1a7mr64638711cf.38.1774654132752;
        Fri, 27 Mar 2026 16:28:52 -0700 (PDT)
X-Received: by 2002:ac8:5f06:0:b0:50b:3c7e:a33c with SMTP id d75a77b69052e-50ba391a1a7mr64638531cf.38.1774654132326;
        Fri, 27 Mar 2026 16:28:52 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38c83729522sm1177991fa.14.2026.03.27.16.28.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 16:28:51 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 28 Mar 2026 01:28:38 +0200
Subject: [PATCH v10 03/11] media: qcom: iris: don't use function
 indirection in gen2-specific code
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260328-iris-platform-data-v10-3-46b92bfe7b52@oss.qualcomm.com>
References: <20260328-iris-platform-data-v10-0-46b92bfe7b52@oss.qualcomm.com>
In-Reply-To: <20260328-iris-platform-data-v10-0-46b92bfe7b52@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2232;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=xFJdeT3yOlq/oRgFq0BzLBs7EsRlJjjKB4aOCgE5Kn8=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpxxKoJkbS0xXQbX5XbyM2uOG87ScKh1z/jaayf
 IBdI+KDyQCJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaccSqAAKCRCLPIo+Aiko
 1bLwCACKdwmcSusnFmzpaRvfa8yzxiGYxL60Mwp7+0QTU3vmOFw9agKjOvgeNwmvSxQ/kUICvZx
 UzncWn+j/ATknLssZoCzBlFz86LR58cxtER18ZspERLvc6L+4p5+RJNqgZvY52iaY67zvwD6IDf
 Lrgpzd4x3epR7ejkXdYMUUs9UcOAGWSVrhWkBSNNFEh0WxOXrHlQod0qghkkiEYvF0iEcAFMcQ0
 bY89ZQxedYt7DLp4G5T/iC1uKV5q6bpETEGzaE7l1wVaJcqCo+S8bu41SmPyw4ZhlhVU4alvTsz
 F+MomIMySZ0riZoD/A7RB5TS2WBdwbLIxG8RpA/nUdeLPlJe
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: -0nzG_J9dEtSMtPPkaXkulfdMGEtcz7z
X-Proofpoint-GUID: -0nzG_J9dEtSMtPPkaXkulfdMGEtcz7z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDE2NCBTYWx0ZWRfX1vKpjBV+gH80
 J7BFY6UojPcM9u53iqjJpyY2yjnTka3qXpelINJQzCly8mvlo8zyfGqd5wOR0WNGiG6W9GbiHWE
 P8CT9wk5fRzo/GFxOuVNV/bbUNu+bjAjnStqdazy+3ewb5O/kf4NPmO6qb3TGUGZdF6bT/BiYjR
 pjUNB/pujirB+WLuwGHAPumKDGzc6wN3gPDY7YHppoOWjtIGfOwCx0iXiSegigSQ1dxCNEphDnt
 6jK1wIxRv0z2YjPWsCBPz6xLHcY01BhQ1bNauehzvBxbh4T8okar5Ncw9egbc3bbtUcU+yims7O
 9SG3FKX6zF6Jz26QcnrhWycydn5esHXcIuZTVaPnXFozGZ12aujlkuf20qMhSiBi3xb3nfAiwUy
 XJxnBJHODr2075OeTm13zjkt6faGDWfQ+ikUDigR8bF3n7n10JFznr3I0WEMOBCnWwYBdjfIh45
 +Rt+ABD+7NGQMU/I/5A==
X-Authority-Analysis: v=2.4 cv=PL0COPqC c=1 sm=1 tr=0 ts=69c712b5 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=yEfzmaBkz_6XQGMMuZMA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-27_01,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 bulkscore=0
 malwarescore=0 phishscore=0 spamscore=0 clxscore=1015 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603270164
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-100499-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 01E7B34C52C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

To note that iris_set_num_comv() is gen2-internal, rename it to
iris_hfi_gen2_set_num_comv() and then stop using hfi_ops indirection to
set session property (like other functions in this file do).

Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
index 30bfd90d423b..e4f25b7f5d04 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
@@ -1205,7 +1205,7 @@ static u32 iris_hfi_gen2_buf_type_from_driver(u32 domain, enum iris_buffer_type
 	}
 }
 
-static int iris_set_num_comv(struct iris_inst *inst)
+static int iris_hfi_gen2_set_num_comv(struct iris_inst *inst)
 {
 	struct platform_inst_caps *caps;
 	struct iris_core *core = inst->core;
@@ -1220,12 +1220,12 @@ static int iris_set_num_comv(struct iris_inst *inst)
 	num_comv = (inst->codec == V4L2_PIX_FMT_AV1) ?
 				NUM_COMV_AV1 : caps->num_comv;
 
-	return core->hfi_ops->session_set_property(inst,
-						   HFI_PROP_COMV_BUFFER_COUNT,
-						   HFI_HOST_FLAGS_NONE,
-						   HFI_PORT_BITSTREAM,
-						   HFI_PAYLOAD_U32,
-						   &num_comv, sizeof(u32));
+	return iris_hfi_gen2_session_set_property(inst,
+						  HFI_PROP_COMV_BUFFER_COUNT,
+						  HFI_HOST_FLAGS_NONE,
+						  HFI_PORT_BITSTREAM,
+						  HFI_PAYLOAD_U32,
+						  &num_comv, sizeof(u32));
 }
 
 static void iris_hfi_gen2_get_buffer(u32 domain, struct iris_buffer *buffer,
@@ -1257,7 +1257,7 @@ static int iris_hfi_gen2_session_queue_buffer(struct iris_inst *inst, struct iri
 
 	iris_hfi_gen2_get_buffer(inst->domain, buffer, &hfi_buffer);
 	if (buffer->type == BUF_COMV) {
-		ret = iris_set_num_comv(inst);
+		ret = iris_hfi_gen2_set_num_comv(inst);
 		if (ret)
 			return ret;
 	}

-- 
2.47.3


