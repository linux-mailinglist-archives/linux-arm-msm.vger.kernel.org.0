Return-Path: <linux-arm-msm+bounces-91191-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wPIHE7Z7e2kQFAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91191-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jan 2026 16:24:38 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BB6E7B1690
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jan 2026 16:24:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 58A32300C901
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jan 2026 15:24:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 151C07260A;
	Thu, 29 Jan 2026 15:24:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="c729QAIa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WsqvND2h"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBA082D46B2
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jan 2026 15:24:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769700252; cv=none; b=iSVdBDJOI0/LKzL72RT4JXTV5sNUonf2Yh3hXU1a3ji+8FD5nq42fmNwNCv2FfnKF0OswNL1QZggimVmE/6u6X39XQhLAtXMiL3CQA8qnXYRhvPPFJP6YAQAyGuylncyKqAg6x/YH8pUyq2LQbGnS29UlPxPKEn1M1NNccnnkxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769700252; c=relaxed/simple;
	bh=tF0E8lC+uiU81dU0CtyWmtcMMwdLTvuPjrP8S6F4MPs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fSrCjWRYki/4jr0JmSlSpNKctNLtiKKkUR6t5rLbYAfu0/8UTCc3JuPtP7h5TdRlUqzaFeLATxfIJqrhjOqD9Gyxa+U+XBc1V6Ovu7g7+jFByVq9Bw6Kyd3OQ49OhDDfoJgTbFsnpo7T5Cdfi19PxiU+d55DgtDdq6IyDbgNVQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=c729QAIa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WsqvND2h; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60TAlgIc2953199
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jan 2026 15:24:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=00pqdJR80XL
	4o6AX2Y2gnWBPYBCcbFZU8ZwbRzjowHc=; b=c729QAIafb6fTz6z70J5ra8Oifb
	jbYuk+77Xhm6X+/D/xDBrtuGnrKdJeW0gGnjMeP4iOudKByS0d+zlVsnPTqszxWz
	NqEcWVkthzp6y4u2XociKaKMv7xW5ngJ63unTBANGWmNQyBNns/8VRhf3vcO2m3g
	/u4uJEfRpTgsSpSa11YWDhmNQ7OSPQ49MtzLirbP5hLvL3sdRBW8wgIjVkvcVkoY
	9m/Cmib0s+ymmgfj/GKiToRiRl7syiSmY+1qLQALTamJL6loFX3LcO3TBax3xxR2
	WFchj44Dlp/vXlnXd5riDWNIm/w8tgDyrlOPRZMJBdmMzmqTuqyAT7DMzdA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c06420uk2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jan 2026 15:24:10 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-29f1f79d6afso11954225ad.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jan 2026 07:24:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769700249; x=1770305049; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=00pqdJR80XL4o6AX2Y2gnWBPYBCcbFZU8ZwbRzjowHc=;
        b=WsqvND2hvvc9vjS1hvdMtbDEFXZFGNK+lPoz5deVu/SLB0gc05ZvTsR+T6sqeeYBh2
         vCfWDGXL4PS5lPg3wqJ5a3J7yP2USQEEBG+L54eJ9SXOnPsP+Sc42dB+BwsemeDx+/yv
         VM6NQyZ0qZOLByq0M8PkJcC54Z5UZgrw2U5Sb6tcvai2B9rcRm6BWPVVlVkiKIX3bKEC
         siOTZQ8LxSa0idSk+qxvo+z86RxNfK1oYtm/bonJnlEXfi3OaOkJ5Fyf0CzxG94M0lho
         lm3edcxGl2owvXuTmtSauNyuY7uM+mExKX3dseHSNSQREdAsODT0T9RYIECw7zp4O9KB
         v58Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769700249; x=1770305049;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=00pqdJR80XL4o6AX2Y2gnWBPYBCcbFZU8ZwbRzjowHc=;
        b=Yt0YvU0xmvraUC/p9HLE2QQDSgNIMwdomzByT2ak8OYR56FC62JTsxWdFSHQoxj/Wk
         0yL8pvHfADwO8YbG+ywk7LIGAN5K/10/Oef4RTKL7LEbsbHMvTZCpPEPtSyWcRbgQFw9
         e7hBC2VbLPwRdI0Mo5Gt39tNkz3lLYjXYEljkOqOjtvl+gWoUlLy08leu/zxWc5v3+m7
         rsFJL2bpbNiEgxhakPThAaBP/raIdlCRRYx1xvjd45c3v1Tl6MKuVbrFQ9k7N0xxgl3T
         perWNoCvuiNzRVREyZHFHamvTP1cGpZlKLd0dJnGkKAUxtNjP7E8brh/1k5tJeaM7q3e
         iasA==
X-Gm-Message-State: AOJu0YxP/zIeTDS2lCsqMSF7/CdIRw40kd0xtFSCv0sFQ7APPqpGBpQu
	PbSOrPV4KFQrBNjrJcgDr8CHhPB613pWrDnYG7oHE3c4HhXIHWGV350HyXfCj3s191806Ay15eB
	JWRHxsE25TBNHLshxr2JXLbjNODV0I7bMdAj4TsfUV6kyfa3J5zkWpPBPvWpZe+BpqdxN
X-Gm-Gg: AZuq6aJE2NllIc6Pv7Vu3dJ0ues2ecvfF7q1Iy+duWVm/FHA3WXwoFlXe7/X7MAyPuw
	PFOCliTbrV3cwG5zM0T7bkpgOq0cjMRy+1/6lBQFTA4hpDFFIb+bIs+ZM70iozrbaEGfO+OrwSo
	lWLUBRQTrx4WqXBWFITZLuRHKs8BR7Z0tqr2bqeIkcf5wMlQPci4bpwaRDDSsPqxfNHMbEtFvT7
	qTxDK6Fj8bJnR76ZWNOCmzeVE9OpBlj0AkWcKGZocxNMpE34WbkBdg5OJQa2UpVotSiaGbVFAtV
	DLOPIs+qyqWBHe+jGfEwtQurgMnw/wVGGCBAuEiZ9/XwLG36wx+wOlwCdfk33QUOV6tsE6ELSub
	k4m5ikYBC4Rc8V5uL9eqVpW4CkS6IVQooCyfx
X-Received: by 2002:a17:903:1aae:b0:2a8:7814:47ce with SMTP id d9443c01a7336-2a8781449cfmr95521075ad.23.1769700249353;
        Thu, 29 Jan 2026 07:24:09 -0800 (PST)
X-Received: by 2002:a17:903:1aae:b0:2a8:7814:47ce with SMTP id d9443c01a7336-2a8781449cfmr95520465ad.23.1769700248595;
        Thu, 29 Jan 2026 07:24:08 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a88b5d93cdsm52959165ad.70.2026.01.29.07.24.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jan 2026 07:24:08 -0800 (PST)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Chris Lew <quic_clew@quicinc.com>, Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH 2/2] soc: qcom: pd-mapper: Fix element length in servreg_loc_pfr_req_ei
Date: Thu, 29 Jan 2026 20:53:20 +0530
Message-ID: <20260129152320.3658053-2-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260129152320.3658053-1-mukesh.ojha@oss.qualcomm.com>
References: <20260129152320.3658053-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI5MDEwNiBTYWx0ZWRfXyxM1udWZeMcq
 ZPJpQAFi7OI+6AH2QKP57tJVXUr/sDe3KSNI3QWc86VS6AQfBzoYD0fDeMPx7LS5GMeQA32cUap
 3mC+WcTlSLx0gFzXj8XcE7+/3ZKWw3EXka9WyOomSx+2R0bG+GU9jw+yyo6KMtvSQp/C18W+RR6
 aOnKxumsRNrTZjG4xF774KFQmi8q92KuuCRC5rfeLHp7rPrWOEWCoozTraQJwLz82C3qr3AnKDn
 FoKRprsvqhaHgaO53rTdo4EvZn5dYp3XLWkuXghFzcXG3LDWbB93AiWuWxXxL8PC8sRPOm7R+Ha
 gw3atZJ2qsYBRNzshBYWkrqzvMYX338idiJE8pJp1cBr0LZ6GSgAnWe/ck0/5JXKh/A3xA53EcJ
 JsbOOIMQs6I91FCKMGs3ZTWECNUCiuURrB4XxrLNR0FN1AgH5N1rPK2soMump53AxbVTu1qcOCH
 ZlHebR+cAtLm/qdt7Zg==
X-Proofpoint-GUID: T1jEXz1R9PE0bI-NggsB-bgYwwgV6wga
X-Proofpoint-ORIG-GUID: T1jEXz1R9PE0bI-NggsB-bgYwwgV6wga
X-Authority-Analysis: v=2.4 cv=dpTWylg4 c=1 sm=1 tr=0 ts=697b7b9a cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=4SdLi392XpQnjlbbtgAA:9 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-29_02,2026-01-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 malwarescore=0 bulkscore=0 clxscore=1015
 spamscore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601290106
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91191-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: BB6E7B1690
X-Rspamd-Action: no action

It looks element length declared in servreg_loc_pfr_req_ei for reason
not matching servreg_loc_pfr_req's reason field due which we could
observe decoding error on PD crash.

  qmi_decode_string_elem: String len 81 >= Max Len 65

Fix this by matching with servreg_loc_pfr_req's reason field.

Fixes: 1ebcde047c54 ("soc: qcom: add pd-mapper implementation")
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/soc/qcom/pdr_internal.h | 2 +-
 drivers/soc/qcom/qcom_pdr_msg.c | 2 +-
 include/linux/soc/qcom/pdr.h    | 1 +
 3 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/qcom/pdr_internal.h b/drivers/soc/qcom/pdr_internal.h
index 039508c1bbf7..047c0160b617 100644
--- a/drivers/soc/qcom/pdr_internal.h
+++ b/drivers/soc/qcom/pdr_internal.h
@@ -84,7 +84,7 @@ struct servreg_set_ack_resp {
 
 struct servreg_loc_pfr_req {
 	char service[SERVREG_NAME_LENGTH + 1];
-	char reason[257];
+	char reason[SERVREG_PFR_LENGTH + 1];
 };
 
 struct servreg_loc_pfr_resp {
diff --git a/drivers/soc/qcom/qcom_pdr_msg.c b/drivers/soc/qcom/qcom_pdr_msg.c
index ca98932140d8..02022b11ecf0 100644
--- a/drivers/soc/qcom/qcom_pdr_msg.c
+++ b/drivers/soc/qcom/qcom_pdr_msg.c
@@ -325,7 +325,7 @@ const struct qmi_elem_info servreg_loc_pfr_req_ei[] = {
 	},
 	{
 		.data_type = QMI_STRING,
-		.elem_len = SERVREG_NAME_LENGTH + 1,
+		.elem_len = SERVREG_PFR_LENGTH + 1,
 		.elem_size = sizeof(char),
 		.array_type = VAR_LEN_ARRAY,
 		.tlv_type = 0x02,
diff --git a/include/linux/soc/qcom/pdr.h b/include/linux/soc/qcom/pdr.h
index 83a8ea612e69..2b7691e47c2a 100644
--- a/include/linux/soc/qcom/pdr.h
+++ b/include/linux/soc/qcom/pdr.h
@@ -5,6 +5,7 @@
 #include <linux/soc/qcom/qmi.h>
 
 #define SERVREG_NAME_LENGTH	64
+#define SERVREG_PFR_LENGTH	256
 
 struct pdr_service;
 struct pdr_handle;
-- 
2.50.1


