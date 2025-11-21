Return-Path: <linux-arm-msm+bounces-82815-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 77ACDC78A67
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Nov 2025 12:04:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sea.lore.kernel.org (Postfix) with ESMTPS id 0C55F299AA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Nov 2025 11:03:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 575FE34BA4C;
	Fri, 21 Nov 2025 11:02:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QQOdspTO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jKc2MeuR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87E0E34B19A
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 11:02:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763722923; cv=none; b=qRBOFbYq2KlauCShuGOYJoVzN6M+2jpDjAfzwx40s4RXLCY4rdG0VVQ9uODlvvEPcZhsPS+9unEvHX2O70H1rhTi67GmvtO1suC4Y6rVNLj3X7XV6ZW+zqoyib5hztJkiwSdnEG7mwdeEpQftPvwKs4vd0l3OiMrhSHiM7k4sgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763722923; c=relaxed/simple;
	bh=WhBuwExsVsI+8Yj8gpXVinRIooqGhxyPW83/caypxOY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dHdccm5dJ5M/r89FFllJLHANLsfmHngPmco+V+tyWlkWqPOoXxri7PXl75ih5cAklMr+CVr/qhJ0G71gfwUY05ib0bR+N+YK1dHhz854+cg4QjGltplaZQF7CTbB8pvZkEXYUFAXAoyNoBQ1wJxu2EqYp8l1HskFiR7FjHslKkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QQOdspTO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jKc2MeuR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AL5Rs5o2756656
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 11:02:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dlX9tCMyfj6v0h2ombC9MqTa6CoSiT/Y2x1G6IPrzT8=; b=QQOdspTOhdbmS+EO
	S9SbKNUEy2nHZhFPrmcMfMf0mqo8Tb6R8qN6tThiJrI1/rmbsLHt07UK42eDNcYw
	FSdTAjd66R08SnI6M77xvDLMJ0v1R2GZxYN687EtOkRSUhQH0pR9/OpAtQO1eAuu
	bbRLde8WEUvOgPLTzdvWX4OoPdFuNBzOBmPxytr6DYyeTjEl+qMzyOnUMnuRcANH
	eXpgjK7Bzz1YHqRh6WYUbZWfDUptRDHhYlT+0PQS+xYfkgFb9Ap4Duvd534Jq0SD
	aSwhwYS0d05l/4FRh6XPFFnkBYLELScD5yjMyjEvy/YKKBPk2vQXkTPsN9U2hxcQ
	1TWJEg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ajhy615b8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 11:02:00 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-341cd35b0f3so3244286a91.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 03:02:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763722920; x=1764327720; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dlX9tCMyfj6v0h2ombC9MqTa6CoSiT/Y2x1G6IPrzT8=;
        b=jKc2MeuR6wFN3PXKJ61IAYUMDMdz3lH2yuTYNCNf2/Uo5BbL6DN6aef/hzZzeMTuJZ
         soyAfFRQZQGoLMn8vScbS8TYnYYHAYh2svZJD/HZCbs9gDjasrz+GVwzZBH40LH+lRb4
         WLjvlYQofTyb5b3Eoy1K4htdGlid5IPz01ofRD1CR/wcQjwJKwSVR0x+xJX46VNub5GW
         AdaMdtKB5fVO2RytSHsT/HW+o46Pk6cxWxELBHeSU91BrTn8oqdWG967+x+8yr9g4e3J
         6u0bpHQLuWsqa5XrjkmXMBrK+pwWHdrDlJyeXIWcnRtVwcLgLfRPyxhGIWZ+sTQYcrjq
         XxLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763722920; x=1764327720;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dlX9tCMyfj6v0h2ombC9MqTa6CoSiT/Y2x1G6IPrzT8=;
        b=e/FoSAMmEYh4cJ/V3Fs/cP/FUbB/iJkFBrstYPiHAA/1EJhtGUGemRYlaRhExlf46o
         w9ou5kVGEzocaUaDTWD6RKKY3xpYAI5gNLnJPdmYWZuRiKQaqyIoBoZJ7Zac0B/NBArW
         sL2gcLhMOwuZBjErZvCFyNsapMOc19RcVKmGtDfjjrElajIIUnWi3ur433q9u+d9TeYN
         gklQi98T7M4IVPw5IQF4h4VAaL61X2bgHvqUVzw5lHwx+8nZ7XfDBNNReXL1QbzTNoNG
         iONmD7zvi07OwNyfXjuw64lseSKcc8xxM1La8qEzkjF+l5BsxO4m+3ElMa+9t7ZYJJU4
         QWXg==
X-Gm-Message-State: AOJu0YywVMicV3Dd/CFTkGQWNRN8xnwy0kBK9Bn/CULHs0ezzru3rc+7
	h8nqGPiSAh2ys4lMz3F3E66v7crfv3YKQif7qtcE5xZr40BjGty8EoVfdisHHViNKSc0Vu74Sah
	5S6EO0eG0NNPGZ3m4MUuxDHTL0v1fSBBAuFgnwBCea9nLUSTZqG2adEKgsWrQeTiZ5Nph
X-Gm-Gg: ASbGncuBuzYo0c0wcj1sQBbsDNzjsTBPkDdLUd3NegRzLQYqqX5goN9x340rNzeJ5RS
	Jyxpftxq+6yEPwWbSHUKTyaBRpDY4WONBeNrH4oa1iMwzZl0Zjkxzh+Q8r2dsAIpL/ZQIV3ICMS
	92GDeCN6zuantaMHmZ9BPTEXp7tDbne3rX83Z5xlel3dplOrkQbgw6MmO9b/6Ihp7qVzpIxmERA
	iBgICf8aJ3Lk8WsEDwgqbwJM4Vk9q30rlP0lgwA68vmoFh8NLD/w2NoB2lmOOUHqH5STRtXKBZq
	PkQQ1r5PK6ZOeWjrPXFd8WulEz8E2KPKpvntTarHJdkkKFiYhR8ZpPAe/UdAPvOIfu6aAhaihMU
	1ol2aqWaLKwWNB4G/1X2UBsYT0s/XcNPiLu78
X-Received: by 2002:a17:90b:2e03:b0:343:a298:90ac with SMTP id 98e67ed59e1d1-3472976090amr7563953a91.0.1763722920009;
        Fri, 21 Nov 2025 03:02:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEpO8joTe+3KL4VByz4ruBxOPPVuDamEIBR30hGSQsIWGTTCbHT4fpjWnEHMOGPd/OLL17s1Q==
X-Received: by 2002:a17:90b:2e03:b0:343:a298:90ac with SMTP id 98e67ed59e1d1-3472976090amr7563891a91.0.1763722919354;
        Fri, 21 Nov 2025 03:01:59 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34727d5208csm5191165a91.15.2025.11.21.03.01.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Nov 2025 03:01:58 -0800 (PST)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Date: Fri, 21 Nov 2025 16:31:11 +0530
Subject: [PATCH v8 09/14] firmware: qcom_scm: Refactor
 qcom_scm_pas_init_image()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251121-kvm_rproc_v8-v8-9-8e8e9fb0eca0@oss.qualcomm.com>
References: <20251121-kvm_rproc_v8-v8-0-8e8e9fb0eca0@oss.qualcomm.com>
In-Reply-To: <20251121-kvm_rproc_v8-v8-0-8e8e9fb0eca0@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
X-Mailer: b4 0.14-dev-f7c49
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763722879; l=3093;
 i=mukesh.ojha@oss.qualcomm.com; s=20250708; h=from:subject:message-id;
 bh=WhBuwExsVsI+8Yj8gpXVinRIooqGhxyPW83/caypxOY=;
 b=9UfiGNedwMif1vT58CvrqaHmQFd5mRZVlIbHVk8ys6doYfaQUs/eNG6cD0b5NadIJg/feKQ1H
 1elQ8f/50oEBECJEERZsFqztdULi1xWqkId35CBs28yZqBOV+TmBdVs
X-Developer-Key: i=mukesh.ojha@oss.qualcomm.com; a=ed25519;
 pk=eX8dr/7d4HJz/HEXZIpe3c+Ukopa/wZmxH+5YV3gdNc=
X-Authority-Analysis: v=2.4 cv=Lb0xKzfi c=1 sm=1 tr=0 ts=692046a8 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=DgMsYHmrIKO9_Yj2pW0A:9 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: ugGCsfEb5qdwgOoC2cLcKZUvN_Mg9I94
X-Proofpoint-GUID: ugGCsfEb5qdwgOoC2cLcKZUvN_Mg9I94
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIxMDA4NCBTYWx0ZWRfX+lP7dFBjT3ao
 oGHrbUKD4fLsP8dLz7q+8WYWXpAVpeCERIjUvE05v1IjEmOKyHc7rLxosP5smSELiRFlsFSMKFG
 2u+SFM7b4jSDYcya3UkO2jJ19vYYuH+WZE6zsRwwqShqh7hMQ/UHKNeQ6vjC9lX7zX3Gc4SEvVD
 xvCGbmgt+NV2FyM1xclilg4jq+XyRdEkbgyYMkbHVcaWpuC8D+rebRF24r3oF67M+XsUi/ZJflU
 uYuwykIcVEaV21lLe0TcugPnDASwiHfIN7REfulPRTltpuF+LEp6nLz9DFJUK8JY6sQHPUV1yfm
 ceOZ/J+u7edEA7zXC9PHEtLMNktYS+Rk6ibfxXMJNU2h2pPPJHWX9MApvu0sSfhnVdszJ4l4pOY
 PBKh1p8oEWu6etEvqnJalwxiCOw9wA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-21_03,2025-11-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 impostorscore=0 clxscore=1015 malwarescore=0
 lowpriorityscore=0 suspectscore=0 adultscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511210084

Refactor qcom_scm_pas_init_image() by moving the memory allocation,
copy, and free operations to a higher-level function, and isolate the
actual SMC call in a separate function. The main intention is to allow
flexibility for different allocators and to respect any constraints that
the allocator API may impose before invoking the actual SCM function.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/firmware/qcom/qcom_scm.c | 58 +++++++++++++++++++++++-----------------
 1 file changed, 33 insertions(+), 25 deletions(-)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index fdb736d839db..90649d9ade97 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -592,6 +592,37 @@ struct qcom_scm_pas_context *devm_qcom_scm_pas_context_init(struct device *dev,
 }
 EXPORT_SYMBOL_GPL(devm_qcom_scm_pas_context_init);
 
+static int __qcom_scm_pas_init_image(u32 pas_id, dma_addr_t mdata_phys,
+				     struct qcom_scm_res *res)
+{
+	struct qcom_scm_desc desc = {
+		.svc = QCOM_SCM_SVC_PIL,
+		.cmd = QCOM_SCM_PIL_PAS_INIT_IMAGE,
+		.arginfo = QCOM_SCM_ARGS(2, QCOM_SCM_VAL, QCOM_SCM_RW),
+		.args[0] = pas_id,
+		.owner = ARM_SMCCC_OWNER_SIP,
+	};
+	int ret;
+
+	ret = qcom_scm_clk_enable();
+	if (ret)
+		return ret;
+
+	ret = qcom_scm_bw_enable();
+	if (ret)
+		goto disable_clk;
+
+	desc.args[1] = mdata_phys;
+
+	ret = qcom_scm_call(__scm->dev, &desc, res);
+	qcom_scm_bw_disable();
+
+disable_clk:
+	qcom_scm_clk_disable();
+
+	return ret;
+}
+
 /**
  * qcom_scm_pas_init_image() - Initialize peripheral authentication service
  *			       state machine for a given peripheral, using the
@@ -612,17 +643,10 @@ EXPORT_SYMBOL_GPL(devm_qcom_scm_pas_context_init);
 int qcom_scm_pas_init_image(u32 pas_id, const void *metadata, size_t size,
 			    struct qcom_scm_pas_context *ctx)
 {
+	struct qcom_scm_res res;
 	dma_addr_t mdata_phys;
 	void *mdata_buf;
 	int ret;
-	struct qcom_scm_desc desc = {
-		.svc = QCOM_SCM_SVC_PIL,
-		.cmd = QCOM_SCM_PIL_PAS_INIT_IMAGE,
-		.arginfo = QCOM_SCM_ARGS(2, QCOM_SCM_VAL, QCOM_SCM_RW),
-		.args[0] = pas_id,
-		.owner = ARM_SMCCC_OWNER_SIP,
-	};
-	struct qcom_scm_res res;
 
 	/*
 	 * During the scm call memory protection will be enabled for the meta
@@ -643,23 +667,7 @@ int qcom_scm_pas_init_image(u32 pas_id, const void *metadata, size_t size,
 
 	memcpy(mdata_buf, metadata, size);
 
-	ret = qcom_scm_clk_enable();
-	if (ret)
-		goto out;
-
-	ret = qcom_scm_bw_enable();
-	if (ret)
-		goto disable_clk;
-
-	desc.args[1] = mdata_phys;
-
-	ret = qcom_scm_call(__scm->dev, &desc, &res);
-	qcom_scm_bw_disable();
-
-disable_clk:
-	qcom_scm_clk_disable();
-
-out:
+	ret = __qcom_scm_pas_init_image(pas_id, mdata_phys, &res);
 	if (ret < 0 || !ctx) {
 		dma_free_coherent(__scm->dev, size, mdata_buf, mdata_phys);
 	} else if (ctx) {

-- 
2.50.1


