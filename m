Return-Path: <linux-arm-msm+bounces-83856-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A5364C93E0C
	for <lists+linux-arm-msm@lfdr.de>; Sat, 29 Nov 2025 14:18:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8EC983A64C4
	for <lists+linux-arm-msm@lfdr.de>; Sat, 29 Nov 2025 13:18:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2EF7E30F938;
	Sat, 29 Nov 2025 13:18:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="T/XhvJ7l";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EEPALHLM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90EE530F80D
	for <linux-arm-msm@vger.kernel.org>; Sat, 29 Nov 2025 13:18:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764422296; cv=none; b=Xt1JsQtgp8Qqz5TdxDM7cFFfVBEAEGUXqObGVVyL3NWiP9WwVCoAqvON9/IYuerdelv9+2LkqpahSUuRp3VuYaCeMosCDbAaUuE2J6jCuRqIItNDHhuPJMwtlsQwJ7aQOqStPRJ9siVvJmSJuuY24iFpWD093WJIlFz4ozoJsvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764422296; c=relaxed/simple;
	bh=4tP20X4JE/X1M+a1qcu2Sp7p+7XlYzP88ouU3+KHMk4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=k4CEu4MMMH0y7cWF85zQuk576x9NoBC0ji1RqaSAyR2rE9ZXhbt7T/IfqgmExNh4NijHry6ON84lie8u24ZwBCVLRLrbYxXst8kKZWJiABDZOiYaRG6ckrGirGiiYOmWDycQxlq/888wkAu5g/js1mueeqtbFJzFF9afxCZBhus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T/XhvJ7l; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EEPALHLM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AT9L0Zx2401980
	for <linux-arm-msm@vger.kernel.org>; Sat, 29 Nov 2025 13:18:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8cbthdZNrXFWsLhrsZsdx/l3lBDTGHaz6pZq9MgKjzc=; b=T/XhvJ7lx2Tc/2oK
	+26zu+xACxuq9j2pHiBUOtFFWOpsme4k6S5t+xfj5nZC4BGMWvyV/PwR987DMCJ5
	dIY/QBm6YFJl53NJOV1DdZ8VFuYW/hVApGT253hZ0Gx8c75InjcVJvy/vootbtiI
	WtIbBYz1N+S540KZzhc9YX45MYJptkGnFp2lNOuBHaepOMr0FXPAkitun4G7SefA
	WIiOnVzeejXqkGH/NcGVM6GvY87gtzcwl795qIGSrF516Iq63N9/eZy7edFQ5zbT
	syHYWxWjaCdi9OP7Y43ezG6M+xANMx2GP6+xNjYbI8e6IQepwigdA7OWGphlVyV/
	hjThRQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aqs20rppk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 29 Nov 2025 13:18:07 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8b23a64f334so521323285a.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 29 Nov 2025 05:18:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764422287; x=1765027087; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8cbthdZNrXFWsLhrsZsdx/l3lBDTGHaz6pZq9MgKjzc=;
        b=EEPALHLM+iE4J+n1gMljso8vhtqZ8zyE3rUNfTzztOq7sPbZEENdbd0J8OkphVyM3m
         pI7fsCTdggNiu3Y1B2zgoQdlvNgcaN0GXcqomPpiKJ9N+2+YuuWI1FRNMbtPZsZgdYj5
         XU2d5VDTEgof3cHeIuJyzqKOn8sPhr94RdOsplO0OJQFKvuBZE/K2DmkanyfqxaBA2A9
         4G0xqrvgnNq7dk1J038yXS0j9T89evfQp+AHm+d2Z0fFHJofOo/hFuUcOJzAWVxeeaTP
         gNGbzwDapaw/JI9H7Ev04KXThbpj2AkhBkmoPXwnvGPDQuFN6+DSc3HV3GO6ho0FRxYI
         DUeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764422287; x=1765027087;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8cbthdZNrXFWsLhrsZsdx/l3lBDTGHaz6pZq9MgKjzc=;
        b=DM8JbJ8OUqCPo2ughZoGmRkPBnuXhFcOzGKA9lZYPBO5NptjNLRusNOULIY0Ezu74g
         6XoRJkHSyPR6sY9H7Y0Zez7tpRK9mGoLEeqQRPYUxi+DnwTNa+4fVtTyQGf4cSC0ts6e
         m1vmqAZDAdO67tf0ZkDyfNWK1WbjyF8cTIu1/hS6W+xQ1UfBljMCOAdd4JKRTPC38OVQ
         L1JUcrx0ARqC5QBVxA+1b4Q2/o3iAM/oKYib3XyVRDNDj1Roxou3x/DdlhK6owfwc1SR
         1xcZesismPqflq72qJwVhqRfdJCYYR/WMRGpGKPNihDYge7vCNKcaCMjbYiNLJGgEjJG
         gF/Q==
X-Forwarded-Encrypted: i=1; AJvYcCUzJWW1UUfB3sWf2YBtB/AcgPU7T8jP/Zvzhfpa/CzEGdwkGxpumzCkTjDPKCY7ueEniJwBVcMmBd38IJce@vger.kernel.org
X-Gm-Message-State: AOJu0YyQ7PCLibBq7ROUzwJwwS31A1Dp8XZ5wmnM2jDMom9PttPhI2bY
	scqOsIsWTBtkFsz2tmZNUBypQUsXA+9Cv2tQFkHtp8C6CP1mAva2N3WZHpbdhPSMcjw96hyNVWL
	Ssy3+ZKhb6kgBn+lxnVJpYjg2WMzs9lNiLtVAYp0SGRupRTQFb7sIWtIMQcmUjaVaaQWJ
X-Gm-Gg: ASbGncsYNiHx76asClGs7eGjamn1iqLblAAebPJbKYtUQhz0RN+7oupn4zygE6HOmLK
	6/0asYhKaK6Zftn+Si0AS+Aun6uf0xjVGKrKQwO/1kp6DALHeXaeqoFDNnIhYOzkUteslKTaJVR
	PJbjuJ+7k66wWRHHk2Lm2M+PISQ3GeMtimB1GBvavwoG0ttPzSCF8jRJWKPKfwVHoHKOfds/Yq0
	pIF1x7ZaGxj2m/DKs5xYBp3YBCAORZTCcs+YwBSZLOKw1ArX9Kiq2M+u4KFeaMd5NQ/6gxnonZc
	RUoc9YwJwKhXrn6dhMdm4xOqUi10tmRd31vMoH4z4PfNmElMFuFXVyd3N498opFi9pV3cDjcaHi
	0lLFYbMFnAQYbSqFSrtXavKQuEm5EaaCRMg==
X-Received: by 2002:a05:620a:45ab:b0:890:2419:d6d9 with SMTP id af79cd13be357-8b33d46974dmr3938479185a.57.1764422286902;
        Sat, 29 Nov 2025 05:18:06 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFYM57l60GAmVKeTAWPzcoREO+EjPDS5tiqd9ImbPTfr1osrjKj/E9eSTlrKMeDkmWlgAV+5A==
X-Received: by 2002:a05:620a:45ab:b0:890:2419:d6d9 with SMTP id af79cd13be357-8b33d46974dmr3938474585a.57.1764422286454;
        Sat, 29 Nov 2025 05:18:06 -0800 (PST)
Received: from [127.0.1.1] ([178.197.195.159])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b76f5163903sm723233866b.7.2025.11.29.05.18.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Nov 2025 05:18:05 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Sat, 29 Nov 2025 14:17:53 +0100
Subject: [PATCH 1/6] ASoC: qcom: q6prm: Fix confusing cleanup.h syntax
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251129-asoc-wrong-cleanup-h-can-people-stop-sending-this-without-reading-docs-v1-1-c38b06884e39@oss.qualcomm.com>
References: <20251129-asoc-wrong-cleanup-h-can-people-stop-sending-this-without-reading-docs-v1-0-c38b06884e39@oss.qualcomm.com>
In-Reply-To: <20251129-asoc-wrong-cleanup-h-can-people-stop-sending-this-without-reading-docs-v1-0-c38b06884e39@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3209;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=4tP20X4JE/X1M+a1qcu2Sp7p+7XlYzP88ouU3+KHMk4=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpKvKGIUYvporfOfRuCmpz74ach1rJTk3sjEnBH
 URtH6FNhdKJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaSryhgAKCRDBN2bmhouD
 11+HD/45xpdzC4pD31u6j2/8H2wXpVwiAVrbQzYCQOsTTuL+2Fr1noDKul2/osJmJSTW3tcqEep
 cb0Ld1fdFCidrNlcWXGksdwRz5eM5TZtDacZ9pjGLHfTMHwzTvIifMK8/ghLW3KB9tQ7sGMtUSe
 OGTIijHy2ExNvXNNO4p1DTvlvYyqbA8YGzAx+VT5Pem3hmh6Zyqwy2hcfZrmt93cgjMB0OL5Z7e
 JI/VuZ5bgv62dI6gyxHvigTFqZm2pZJQOkUu6Vm8kTzX+sAzpD+JHBYhJI6iRaSm0Ilkv0rUAjl
 tlkrkxvASIIrLEq6hVXqbn6jOxSwdDbcrA7aYgqTpqFTMHFF3MULIod8tiz0vIWh+4y0O/tBGQB
 6efuxSu8bE1Y3QwPF0Nq1h/P96Ek6HMKPUqUaKQDF+she8Wis1E2/gQ3cIhT8kBonRJZewJXvWK
 zzP1xXsmdVYyMR98xmjGo4crqQ3Jr22nsTzpGX9U1w8Zs7DIW4JPEWr8Nxf9i8kWZqVtMf2HbV6
 7H3Z25s08Vm9tdQGHgQyyGOuLjeIDu4i7wuhYH7ech0Q5bpMrudQ3pAg3zZFEfNGzusfnwBRfOk
 X7zFcqefnqTq86l/SQFXVPHKx+3PG6oUeb0SoCVspDob3dZalj96KkPLjfOgHsU9wsX8wsbdCBy
 e00iQKMXYh/Rqww==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: QCopBZo77QFgqpaAE7aRr4o1r54RYLN_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI5MDEwNiBTYWx0ZWRfXza3YmWABpXJn
 vkCI1R/b5vLorVMoNArFgK29pCyrew34XU1+4JUZQ5nktbdttTNcnNfM+FEnJ5j5uXcNL2toq9O
 6Nu0fWGy4oPoQB3fd0uGl8l8G6KBt3oei0Ed43ZtpZo54GZ/ZQ0LCG3iYvf97H21lVGEcipJ44G
 iMJK+z5ouAaa9xt30XkExYqleI3vZ21WCfOBINKxlLKP30r/Iw/TtiUQ8qIe1MQlMTGgd4oIAVO
 j9Al3QlD2LZ9O3j/iy+mVS+NkhYrA/Epdw8hzy4UbvRbIgjBoTwPyZzaPA8O7CG+SkIOZ1zM7pY
 Z+ghe7rHF/VOoTp3UHfuX3aBhgYvHuoS2EJoKlXz6hBxoI9s6Rgi0P9SVNm8DA2U4fmwdrI4X4X
 gKkkdRGET4kB6mwW7ScFCKw7xQ4fBQ==
X-Proofpoint-GUID: QCopBZo77QFgqpaAE7aRr4o1r54RYLN_
X-Authority-Analysis: v=2.4 cv=EqXfbCcA c=1 sm=1 tr=0 ts=692af28f cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FPK7cjBCgYbqzSTDLBmM0Q==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=In8TF76piAPFrmgoFOgA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_08,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 phishscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511290106

Commit de8e95773c48 ("ASoc: qcom: q6prm: Use automatic cleanup of
kfree()") did not make the code simpler but more complicated.  Already
simple code of allocation and free, without any error paths, got now
declaration with one constructor followed by another allocation, which
is in contrary to explicit coding rules guiding cleanup.h:

"Given that the "__free(...) = NULL" pattern for variables defined at
the top of the function poses this potential interdependency problem the
recommendation is to always define and assign variables in one statement
and not group variable definitions at the top of the function when
__free() is used."

Code does not have a bug, but is less readable and uses discouraged
coding practice, so fix that by moving declaration to the place of
assignment.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Can we pleas stop sending these cleanup.h patches when people do not
bother to read cleanup.h?
---
 sound/soc/qcom/qdsp6/q6prm.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/q6prm.c b/sound/soc/qcom/qdsp6/q6prm.c
index 0b8fad0bc832..2544c4519b26 100644
--- a/sound/soc/qcom/qdsp6/q6prm.c
+++ b/sound/soc/qcom/qdsp6/q6prm.c
@@ -62,7 +62,6 @@ static int q6prm_set_hw_core_req(struct device *dev, uint32_t hw_block_id, bool
 	struct prm_cmd_request_hw_core *req;
 	gpr_device_t *gdev = prm->gdev;
 	uint32_t opcode, rsp_opcode;
-	struct gpr_pkt *pkt __free(kfree) = NULL;
 
 	if (enable) {
 		opcode = PRM_CMD_REQUEST_HW_RSC;
@@ -72,7 +71,8 @@ static int q6prm_set_hw_core_req(struct device *dev, uint32_t hw_block_id, bool
 		rsp_opcode = PRM_CMD_RSP_RELEASE_HW_RSC;
 	}
 
-	pkt = audioreach_alloc_cmd_pkt(sizeof(*req), opcode, 0, gdev->svc.id, GPR_PRM_MODULE_IID);
+	struct gpr_pkt *pkt __free(kfree) =
+		audioreach_alloc_cmd_pkt(sizeof(*req), opcode, 0, gdev->svc.id, GPR_PRM_MODULE_IID);
 	if (IS_ERR(pkt))
 		return PTR_ERR(pkt);
 
@@ -111,10 +111,10 @@ static int q6prm_request_lpass_clock(struct device *dev, int clk_id, int clk_att
 	struct apm_module_param_data *param_data;
 	struct prm_cmd_request_rsc *req;
 	gpr_device_t *gdev = prm->gdev;
-	struct gpr_pkt *pkt __free(kfree) = NULL;
 
-	pkt = audioreach_alloc_cmd_pkt(sizeof(*req), PRM_CMD_REQUEST_HW_RSC, 0, gdev->svc.id,
-				       GPR_PRM_MODULE_IID);
+	struct gpr_pkt *pkt __free(kfree) =
+		audioreach_alloc_cmd_pkt(sizeof(*req), PRM_CMD_REQUEST_HW_RSC, 0,
+					 gdev->svc.id, GPR_PRM_MODULE_IID);
 	if (IS_ERR(pkt))
 		return PTR_ERR(pkt);
 
@@ -143,10 +143,10 @@ static int q6prm_release_lpass_clock(struct device *dev, int clk_id, int clk_att
 	struct apm_module_param_data *param_data;
 	struct prm_cmd_release_rsc *rel;
 	gpr_device_t *gdev = prm->gdev;
-	struct gpr_pkt *pkt __free(kfree) = NULL;
 
-	pkt = audioreach_alloc_cmd_pkt(sizeof(*rel), PRM_CMD_RELEASE_HW_RSC, 0, gdev->svc.id,
-				       GPR_PRM_MODULE_IID);
+	struct gpr_pkt *pkt __free(kfree) =
+		audioreach_alloc_cmd_pkt(sizeof(*rel), PRM_CMD_RELEASE_HW_RSC, 0,
+					 gdev->svc.id, GPR_PRM_MODULE_IID);
 	if (IS_ERR(pkt))
 		return PTR_ERR(pkt);
 

-- 
2.48.1


