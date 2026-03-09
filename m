Return-Path: <linux-arm-msm+bounces-96160-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wDkjEKqMrmnlFwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96160-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 10:02:34 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A7A8A235CEB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 10:02:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0E37D301589E
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Mar 2026 09:02:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46868376BCE;
	Mon,  9 Mar 2026 09:02:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QzzV8Aqf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Us9O/aSU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F300A376BC4
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Mar 2026 09:01:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773046921; cv=none; b=HX6IJyf2hr0xbJ4hKB5ggayDB4lLPbR2tbKN4r4g66KLA/thVwQv/0ltTvMvSLK0VKgliMQxM3gSebh+mnyqTJpccsANXfhoPaC/jzBJ7QhMHRMQwqAiTsIvWWjIxRByxhXZw2TJhbKoN/oiyGIGNBs+ZdFWOpFEKylg64dq48o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773046921; c=relaxed/simple;
	bh=Dg8zrA6CUods8o4GrDVZcKD1y+aUliP9q3308zWT0yI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lLRuBOeYb7d+zgYo56dva8lr0PfTXocKxDoQAjgT/avyfW1Prwd0aWHoxp8DxqKIIc607E2QMBZmLMOj/veC7WK4EVQrb/PdoVmxaVm7Uyyc/1ZPSDVFABnlmoaxVncwYc58JBr3CsXAWskSVaDJd/EI4gHts/FcUYWcgjWKnIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QzzV8Aqf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Us9O/aSU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6297tcTd2921786
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Mar 2026 09:01:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=Hd0u74ruSn6uVMlMdsGn8P4cicEn+NcTzo5
	0tkBlkiQ=; b=QzzV8Aqf3/BfpVkIcjKaLnyQ1icNDC09UnqbkX4pYZYTghv3Jf8
	ujnxu+uK1R0AZBMfd2Gus7GdQzJDXmAmT/nWdZLVUziNgfgZ+ZBJpLjX0Ifxz4fw
	JqoRkFDznKamxJnNzNfkQIbCycHZb8jy+DqlJGuiV6g7DJ9YmiouQSciZC05zU5m
	Bl9upAcnvdVcPhAjy4ORBpfwF7GMBGv4j48E3fN6/kLeIX8NvAwADqOV0J3tVwXf
	pED/Yb5g50CZfoOTNxSDSr8bCZcrJw39/DRrXvFjaVsyDq3sUOKWTeUrYYnvRz98
	aPXK9k2kAGsKYJKm2fSfmVe2vUjJrp9pWHg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cr9qew0pr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2026 09:01:59 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c6e7f45e2ddso40955059a12.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2026 02:01:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773046918; x=1773651718; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Hd0u74ruSn6uVMlMdsGn8P4cicEn+NcTzo50tkBlkiQ=;
        b=Us9O/aSUWLQDCWB0uE9fDIbNH0G/jGkqNHj+6WORqkn0vgp2jEY1WevKGJ7gVfu5yy
         NFS6TQCgSK0k4iK9QfaPyWJKETMAzHkWLabuFe2XCFX+5YxbL8hofI7bb9s/FlRYM4wW
         OQPHZWuKnnFVoAHijXId0KlCTdpqSgB0yPHXo2FWD16XTVTkFwRF0QPDdFWftHyAO3TW
         me3/pvrJ2h5tMS9ba3XH7z6PQZxndRCAChE0rdZ4/RYpM6PW2YI7aPIKZhieezNRaTbY
         9P+bDlQydiHQJ+Iw/1fpjG0Hma7uhk1Zg6IsLJFk8juQEk+HJ64wIUXYpQY9tP/v4Zi9
         jwTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773046918; x=1773651718;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Hd0u74ruSn6uVMlMdsGn8P4cicEn+NcTzo50tkBlkiQ=;
        b=c9r6KoBEPmGTemiEePb4QRMAlgkpQvCAf7q/7jak66pb2ZhxVDbzGOqBxqs72VXgfF
         Qa+NDfZuKQeDhnPJEgztGJNsvDEWNyl82XrVHu3n/Zg2dL8KdJK6RUXGt9XLYF4Um5Rt
         oOXrcqIq8lKFZ2VvuFBjy/wEl8sGAoGd9vkTEIIksJbB3RD1QlaLsp3zlxxPWZPLwDO5
         FJIVJumKGcHEKMx5BsiAix7LQtchZQW4euZK2fPExS3m7UUWmbBdJ1JxuOOrnWf+pqtj
         FOnPXlXgjgEYRFhisrfyq4gKGZ1gopqHJTgnA8/RIXAdYMQpCJBTfCKEB3KYUD/i2TYQ
         M+rQ==
X-Gm-Message-State: AOJu0YyOR+PeA2YdoIAlkKri3rOzMRrjkpuzkLqPtlFLWOx6d7dwd6QA
	bgYJnNbQmaInixQC1kIrghcr+oVnWwEMIBNGj9XFHrmPjRLyhg3s72Pr6hVfxYxn5343ROvvwtr
	1MObEqJqIKRSdIl/ED6L6jTRO2aQ4RItN/5fEkKeEJPTJJ7nH9/IM44l8XgcOh2je28vm
X-Gm-Gg: ATEYQzxmeDyPLL85uWQc8za14NAxK2Fai34Sf4GCYb8LcgLegw3aOJHNQ5bniaL3KS5
	0L7LT7WNzyyVStIrsbXUxJL45WrjaQ/SJXvVzHCuLHEJVAvJ/YY8ZCheZG7XxjNmN1nvkqIdTl8
	ytvg/S6B8TWSlXpXHZO/C4Ir2qXN8TspCCK02M14tV5f0sl05bCCjoR+N/kTAPl54spROGQYN9M
	JgEsJ1ZYLREFv3dVkI8cd/oJ1uc7nnGyeTXBa/Ty38LG3vHHAJFA/Q4ihXseasgE1kGGUnlj5YS
	yO4Ej1hLdZxRu6fB87pJ3Rpy3BxckGmmHTf+VKgcZqRFZn58UBOz7En6+1pDDxDZIlFGQP15fZt
	o6bOr2/8WfifByVGoMrzuooNvGX4PVjMeQqf5J6fwW7vXxqLo
X-Received: by 2002:a05:6a00:2e99:b0:81f:3cd5:206e with SMTP id d2e1a72fcca58-829a2dd7258mr9294060b3a.1.1773046918400;
        Mon, 09 Mar 2026 02:01:58 -0700 (PDT)
X-Received: by 2002:a05:6a00:2e99:b0:81f:3cd5:206e with SMTP id d2e1a72fcca58-829a2dd7258mr9294016b3a.1.1773046917738;
        Mon, 09 Mar 2026 02:01:57 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-829a48d372esm9698087b3a.61.2026.03.09.02.01.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 02:01:57 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>, Chris Lew <quic_clew@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Gokul Krishnakumar <gokul.krishnakumar@oss.qualcomm.com>,
        stable@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v3] soc: qcom: pd-mapper: Fix element length in servreg_loc_pfr_req_ei
Date: Mon,  9 Mar 2026 14:31:50 +0530
Message-ID: <20260309090151.897685-1-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: AjCDaI4sr9ehbxhw8J8fyYvKR3oZ6v3v
X-Proofpoint-GUID: AjCDaI4sr9ehbxhw8J8fyYvKR3oZ6v3v
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDA4MiBTYWx0ZWRfX7+hl2lFQD7eQ
 oTtCjm9MHTfL7CIm78nLfDMPHDV0GAb643qpKXITHM/1N/lBLVvREV6OADwhb/btfUI4FWAZ0pq
 V9qn6PayrN/bnMgxeAEcQRDdnCrayBQov2zNO95FrcS78e3Rr9bNVWZOUpckR+lVh1UldkJ+LqR
 lNy3tczxNtE45Fa2J7opClmUEOKwvaoQJoLBWEbwAPSRrQlb9Eh5t3Yg+5fA//EWbe4uqBAbWpz
 YsnbGwXUVrsaRDgNvt7WAClhqd5sgEKSg1P+CJ9sxgdL8QpTTIEzNtuFMbad9qt4z7roXhCxG+q
 XnHobi8qF96ne9cATEMM1ftHjWdotPNOwm8zD2zoqn8oj9NnV6OYQJG6eVad4L1Rzvyii93EZCG
 xL+ocVm+FsFMmWOFEvDLCx6cx3y49e9iv/pGI0hrttQqFf7IBQL6kqycALnmw6rr+lsGRE37LIZ
 PGCAgilSM0xmwpq2sBA==
X-Authority-Analysis: v=2.4 cv=dcqNHHXe c=1 sm=1 tr=0 ts=69ae8c87 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=2cWN1nsCyI40IQ2q-vwA:9 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_03,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 adultscore=0
 clxscore=1015 impostorscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090082
X-Rspamd-Queue-Id: A7A8A235CEB
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-96160-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-0.986];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

From: Gokul Krishnakumar <gokul.krishnakumar@oss.qualcomm.com>

It looks element length declared in servreg_loc_pfr_req_ei for reason
not matching servreg_loc_pfr_req's reason field due which we could
observe decoding error on PD crash.

  qmi_decode_string_elem: String len 81 >= Max Len 65

Fix this by matching with servreg_loc_pfr_req's reason field.

Cc: stable@vger.kernel.org
Fixes: 1ebcde047c54 ("soc: qcom: add pd-mapper implementation")
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Gokul Krishnakumar <gokul.krishnakumar@oss.qualcomm.com>
[mukesh: the element length change to the service field is not required.
 Fixed it by removing the change and rephrasing the commit text.]
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
Changes in v3: https://lore.kernel.org/lkml/20260202103641.3003867-1-mukesh.ojha@oss.qualcomm.com/
  - Remove debug patch as we have enough prints to make decode error
    code.
  - Added Gokul as the author of the patch and added the information on the 
    changes done by me on top.

Changes in v2: https://lore.kernel.org/lkml/20260129152320.3658053-1-mukesh.ojha@oss.qualcomm.com/ 
  - Given credit to my colleague Gokul.K who first faced this issue and given
    initial fix and that was later corrected by me.
  - Rebased it on next-20260130 and added stable mailing list, R-b tag.


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


