Return-Path: <linux-arm-msm+bounces-100021-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QP10JS+3xGlf2wQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100021-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 05:33:51 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id A02C932F123
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 05:33:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 0A27C30225A6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 04:33:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 247D819AD8B;
	Thu, 26 Mar 2026 04:33:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QhpKn4II";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DNwUldgF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0FD3395260
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2026 04:33:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774499616; cv=none; b=iB+nsUCctD9uFZf45UXG0mOvpTc7G9go90NCmbANA+C5FW52oaixnCuq+tFegxs2atAilc2JChEP2SjShM0nks61zPK01r2ubU1LpSheqt5Vq4GUKxopeuxMX4dSjn+kqasFKzZpjvLkHWmzpWOY36qBcS0iJTr4oiRf/AuzqIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774499616; c=relaxed/simple;
	bh=aBT1PdwjdNx1+M+MvBs+mg6b92K0E6DC77yGQdHQuAs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=b4e1IdQXWXCwo3iHEBz2aHwtDkwTYYijor9U6wXBZVR8umSBz5vpq6os9Bsj/QkIdOh0nJIV/ReIFCwV108lrFS315wZ+nkGqiO0OBs6oPO2RHk5U/OmCrljmEMi90yinBhC5Fts+Xkilx8jdh+X/OxsQmzjYuaxvRgL9yTvNwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QhpKn4II; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DNwUldgF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62Q0nqAA1811897
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2026 04:33:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=V7GsGH689fM
	rj+lpWrTL+ysDdRauI7b9YYAiBDzdW4o=; b=QhpKn4IIo+pEgTl166rBFCFMO2X
	DNEyWgOiMbYdaQIHXuiKYAk2Y+5h+/QvuYuoTtpG2CeA2ljKM3RXBJnHnDo4iPZ+
	aAwPUYv8gobQj5lW8ouQpzHNsRohtzZVEo0ylEq9Z03SgGZG7Ij5ndky8tVMz5x4
	j1JdEIFGblse4wuMEPXQQk/WQnmgb5L90AB7rAtIBQWnwRbJYabwNyRkVLN0SOlV
	wk2kKERIbqpryxOn6m5L9CT0QP0uIzun0UrKpYZKcAUyid7Iabe37RI//VdpSgY5
	xwXifsqTWtOWXLZ9OpBqthqmqwOY/fx3AirlzCZsfX0UCegTdJBYqtfJFow==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d4tkn0k61-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2026 04:33:34 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2b068299665so6676145ad.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 21:33:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774499613; x=1775104413; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V7GsGH689fMrj+lpWrTL+ysDdRauI7b9YYAiBDzdW4o=;
        b=DNwUldgFDpcFSA8iWYDb1CfqqA98MsaWySK0B+V1zTGXnj1lf4HNvdLM20b94k8vPd
         anTkV2RXLT30ANir6MBTxkohilwhdmSYSkH7240pYkc0gDd52qwlbzNyHITd37dsd7Jq
         cprg5YUfrV5zjuIxCDxOTBGxsfc0zQxSWU2K1RVQH9P1HfugLhL/Yw7hpf399fKoLKNT
         r9YjMOZ63FxSPGam50WIbcTYEBSo7ajzEAb+IbrzPQLy0pXMdDRTDgoAsYO+bE3fqJ27
         uXyavWOXRGN0HikEtlYjyORjMEC3R+kd26FNeyiXe8AI1tBCbE1+bLXx2PVXmNr+3X1h
         nWwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774499613; x=1775104413;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=V7GsGH689fMrj+lpWrTL+ysDdRauI7b9YYAiBDzdW4o=;
        b=cvi07Dk9ncl+FrZaFNLSbK3rLpQ/FXJlnrYJg8Ak0c4QEAhgShx7+jdeQCAQ5Dnu+R
         QZUKFEgEbrGLq66KW1qMYzOpDdIyU8SFp3bGBLj/wC6Oi+kpcxH/YyQ/l/UIx2HyzuLJ
         huAJS3sNLvsk4WHGcDe7zTkPBcaNcdAMn0AvoAxU2ZWVVV/pd2Su+oOuBUIiiwbDL3f5
         I3IlWU8kNVOFDINigg4Z+NpAjTWSezSIsTRj08oEFdjvGJObcGvDrpBfQJ7Bx1Hbq5qy
         2yU+op6eZbuVaxH/3RwTFLS18zPEcwgCDmDxhz+vL8TCvXORHc+EUBHD4j8OabcbvbK+
         m3Fw==
X-Forwarded-Encrypted: i=1; AJvYcCVEPeiM3ogczCj6V2HSvURbvXHEPwTaM8xzW/c/Q55H1ZDgbRb1lPxVfJ3X0WyidspBAlwhvJKV7uihNkI4@vger.kernel.org
X-Gm-Message-State: AOJu0YzqH0sfKpIdi2FOsUANcHcri+4tpsIfYWk0DImXtoLrdqBC24PV
	hrjVGlU4hXka/Ekk7KZXt9GipE36x3jNxLGNoP+Jyr7iRAtKS5Q9xfw8F2jwK0J9ghuHFODlUL/
	SNdLKl7DYCTNV/Q/CCalua6cGT3f+1MgtaEMRv0hdV9bkbaG7jj7gUxJjyCOzyKbdo8iL
X-Gm-Gg: ATEYQzw2le7kl9NGnoA1axjGydWV9GDJXLw15BzlyTlbSLM9zuTTLHdGGX34ovZnYCE
	tdYa2R/7Tw6392hnHv2MLnnS881dff2ePz9CytwSukBXjdHVEJyHUeXuRYuoyVXBdvFqe8XEddQ
	eWub6no2jRKR4+F/mTWZ0krt92p8e4lwLFdLFfncGsFYQZ/Oma4B7NkHomtPussU096CZGCvmWG
	P1NGr6POf7n3pIk1KbUEidWhLAnMB7teMzt4W/0dNgXl8YU2o+mAiNKmucSSedOHyWIOfXWL9MU
	BVIcSLr3QSCe6bYJDxzF0CfPltsXbE+WXrftLaCpFmy9QnTow9dqqUoPqPOcJqk5pNRRW1GbNaA
	+6vSsrS+YdF8T2yTJkY++OsFMkn1GWcYawvVspmaF2qBT2L0+v8Xu7fa5rDVxGaTKZZ54Kv7/dV
	3/dCzcAHQRCDaOvriCxzBljNvE1+npeXIvczj6Vzv5L673459G7qw=
X-Received: by 2002:a17:903:1666:b0:2b0:5682:6973 with SMTP id d9443c01a7336-2b0b09e732cmr65230525ad.19.1774499613552;
        Wed, 25 Mar 2026 21:33:33 -0700 (PDT)
X-Received: by 2002:a17:903:1666:b0:2b0:5682:6973 with SMTP id d9443c01a7336-2b0b09e732cmr65230105ad.19.1774499613019;
        Wed, 25 Mar 2026 21:33:33 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b0bc7b233fsm15163715ad.32.2026.03.25.21.33.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 21:33:32 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
To: andersson@kernel.org, mathieu.poirier@linaro.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, konradybcio@kernel.org,
        quic_mmanikan@quicinc.com, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Gokul Sriram Palanisamy <gokul.sriram.p@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Subject: [PATCH v11 1/6] firmware: qcom_scm: ipq5332: add support to pass metadata size
Date: Thu, 26 Mar 2026 10:03:15 +0530
Message-Id: <20260326043320.2507890-2-varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260326043320.2507890-1-varadarajan.narayanan@oss.qualcomm.com>
References: <20260326043320.2507890-1-varadarajan.narayanan@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI2MDAzMiBTYWx0ZWRfX2nqk5hSS0jC2
 wDEs+ZaSPQGy2baUV4cIQsEHyHpRqRw1fd0pO6MiEvgYmgSmB9Axaot5wupCJ15FVDiSb/2ALl7
 VnZCEnZX7vMgbjQfRcw9MQ99CHRmzUsGzX7Uuko203aZXuX4t/D6LFM9XGJMsX96Egi1QyCd7eT
 U4BbaV/RTYbACM/IvwhXq2Yi9MTccbKqR6Edstv/fNViCJo+iaQIpqssg+SzrqaMjlCML1gCPFI
 08xup/0KMkpLn7Nl/ZZe7C9XEEJ7YzLknd/E9CljhcofLlhgYAsII1d9GXDxxaAeNO7330u2iBs
 hjmHiBnvjvLnfPkYJMkqb0V0KWo/G++A7nr1TxTnF/yK4HVaZ8/JYk1J/IemhuxV9j442pWQz4w
 xUMiBxnxmF/mpc+qTlj5WgMWeaKFUOtREdfqTGhbppYXy7LQmMMo0iaFTYrXRCTcb/E8Qg03bq2
 IMENlPYluTRmg5P0Ivw==
X-Authority-Analysis: v=2.4 cv=It8Tsb/g c=1 sm=1 tr=0 ts=69c4b71e cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=Hho1wTqgLjreKoR7ChkA:9 a=1OuFwYUASf3TG4hYMiVC:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: Ec7qqn-x7CIuQIZ0cNzDhcq810xTVFoq
X-Proofpoint-ORIG-GUID: Ec7qqn-x7CIuQIZ0cNzDhcq810xTVFoq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_01,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0
 malwarescore=0 priorityscore=1501 suspectscore=0 clxscore=1015
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603260032
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-100021-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[varadarajan.narayanan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,quicinc.com:email];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A02C932F123
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>

IPQ5332 security software running under trustzone requires metadata size.
With new command support added in TrustZone that includes a size parameter,
pass metadata size as well.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
Signed-off-by: Gokul Sriram Palanisamy <gokul.sriram.p@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
v11: Rebase to top of tree
v10: Added r-b Dmitry tag
v9: Added signed-off-by tag
---
 drivers/firmware/qcom/qcom_scm.c | 14 +++++++++++---
 drivers/firmware/qcom/qcom_scm.h |  1 +
 2 files changed, 12 insertions(+), 3 deletions(-)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index d1082695ec38..9770c0b75b57 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -605,7 +605,7 @@ struct qcom_scm_pas_context *devm_qcom_scm_pas_context_alloc(struct device *dev,
 EXPORT_SYMBOL_GPL(devm_qcom_scm_pas_context_alloc);
 
 static int __qcom_scm_pas_init_image(u32 pas_id, dma_addr_t mdata_phys,
-				     struct qcom_scm_res *res)
+				     struct qcom_scm_res *res, size_t size)
 {
 	struct qcom_scm_desc desc = {
 		.svc = QCOM_SCM_SVC_PIL,
@@ -626,6 +626,14 @@ static int __qcom_scm_pas_init_image(u32 pas_id, dma_addr_t mdata_phys,
 
 	desc.args[1] = mdata_phys;
 
+	if (__qcom_scm_is_call_available(__scm->dev, QCOM_SCM_SVC_PIL,
+					 QCOM_SCM_PIL_PAS_INIT_IMAGE_V2)) {
+		desc.cmd = QCOM_SCM_PIL_PAS_INIT_IMAGE_V2;
+		desc.arginfo = QCOM_SCM_ARGS(3, QCOM_SCM_VAL, QCOM_SCM_RW,
+					     QCOM_SCM_VAL);
+		desc.args[2] = size;
+	}
+
 	ret = qcom_scm_call(__scm->dev, &desc, res);
 	qcom_scm_bw_disable();
 
@@ -650,7 +658,7 @@ static int qcom_scm_pas_prep_and_init_image(struct qcom_scm_pas_context *ctx,
 	memcpy(mdata_buf, metadata, size);
 	mdata_phys = qcom_tzmem_to_phys(mdata_buf);
 
-	ret = __qcom_scm_pas_init_image(ctx->pas_id, mdata_phys, &res);
+	ret = __qcom_scm_pas_init_image(ctx->pas_id, mdata_phys, &res, size);
 	if (ret < 0)
 		qcom_tzmem_free(mdata_buf);
 	else
@@ -706,7 +714,7 @@ int qcom_scm_pas_init_image(u32 pas_id, const void *metadata, size_t size,
 
 	memcpy(mdata_buf, metadata, size);
 
-	ret = __qcom_scm_pas_init_image(pas_id, mdata_phys, &res);
+	ret = __qcom_scm_pas_init_image(pas_id, mdata_phys, &res, size);
 	if (ret < 0 || !ctx) {
 		dma_free_coherent(__scm->dev, size, mdata_buf, mdata_phys);
 	} else if (ctx) {
diff --git a/drivers/firmware/qcom/qcom_scm.h b/drivers/firmware/qcom/qcom_scm.h
index caab80a73e17..cb80e22a3d90 100644
--- a/drivers/firmware/qcom/qcom_scm.h
+++ b/drivers/firmware/qcom/qcom_scm.h
@@ -105,6 +105,7 @@ int qcom_scm_shm_bridge_enable(struct device *scm_dev);
 #define QCOM_SCM_PIL_PAS_SHUTDOWN	0x06
 #define QCOM_SCM_PIL_PAS_IS_SUPPORTED	0x07
 #define QCOM_SCM_PIL_PAS_MSS_RESET	0x0a
+#define QCOM_SCM_PIL_PAS_INIT_IMAGE_V2	0x1a
 #define QCOM_SCM_PIL_PAS_GET_RSCTABLE	0x21
 
 #define QCOM_SCM_SVC_IO			0x05
-- 
2.34.1


