Return-Path: <linux-arm-msm+bounces-55792-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 676A1A9D660
	for <lists+linux-arm-msm@lfdr.de>; Sat, 26 Apr 2025 01:48:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AB0E74C6436
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 23:48:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 997852980BA;
	Fri, 25 Apr 2025 23:48:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cNYu5m4B"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C952E297A5D
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 23:48:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745624894; cv=none; b=JQj7XIa2gy+f3TRG8hbsPGaopbOa129IqTlMA4+XLf0r8tnOEH909w+hK7O5jrIUcA9/xc6f7sQI4aHPSAQoRXnDPQmYOrSzBYp1MGek2U3DeNs5NCHaJ6nLH5+9zqpZrteLrZjwfTQxEHXQ5L6khwHF9ZbvgfE3B2rroRmclzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745624894; c=relaxed/simple;
	bh=CxAQMDuh9krf1N30Zll9vwqxkcHp/5I1Da/5rxIOxLU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mj+Q9QeNhhGo4L/oF0BQAse0aeA2gJI03vB4EIzqYmn2IFuj35xRZ4MEZcyxmz9YE8TCzbafxo7CT1sgj+mNFnjnAthqoOwBfW+SL9hCnI6dTbclWPpEXkMlgxmRSIbCVsYnUzJQzhFnP4w//LOCvF36VWnaMnlU7uBO6V8yJ9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cNYu5m4B; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53PGJweH032080
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 23:48:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/cM78RDPLdFeQcNGGFl0xqNHvrHRmJYbSLftRUJXI/Q=; b=cNYu5m4BiRtqvetd
	/LHKYtfMQ1NyWTc3OXwmptl5gEzAL2pSabcYTqfmvUEJo138DVG/Bz87AwswfMdM
	8bQJj/mcr0Pq9vJk55bqcBBadREspaLSJm69Ta5xNqwzjupG+1uDkECo4SKZwXls
	WCEUv/7YIwvn5Mbc99PWd161uYDqB5VGNrUXJ7//QyGIP3Mhi1ViZiXI4Db7vofC
	vYxqwMJb/aQId5flgoEovFRjKIi6f8JkKl4dfeZGoudsOSNJDe3q8D0+fVzwqrcN
	Xq8ykvzjsnLX4t7d5KaaNaaPyiB6CWyMIYKjEC5V+X85DK5bx/MllW3sUnmoWKV/
	q5n3Bg==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh1ad2c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 23:48:11 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-739525d4d7bso2159018b3a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 16:48:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745624890; x=1746229690;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/cM78RDPLdFeQcNGGFl0xqNHvrHRmJYbSLftRUJXI/Q=;
        b=biUoBbq5GbRQ5NYxGPy9hg28srZwDdnuLQQhEaeQUBW7fSloE/Q3hGx5oNT1s9zJQ/
         +YDUiqI/+ndovzKjObtPCkmjt0CuN2l+4c3URTNkJStBHrDztpEHKDehtAd11IrL9H0X
         weOCsFf6V3eUJ98spXPYo1XB/61zPiPWMdTgyghI4r6pY00ui0iaTn+j0uVnKm04EIq/
         CU9yHaq+3D/6v0GIEQ33Q8Ys3E+qk/2aoYIhT0M8AtWbgAWwaqe1Ed/JAFaM80vMsw/Z
         7pRlGlw+JgRAK4/BmEEOurvxBiqOQtnLgJABQa0Jxnhn/y5B04090sY1QM1XXt0j9Toj
         1wdw==
X-Gm-Message-State: AOJu0Yz6t8xK1gGgcVQ8yXzr6clNrxNTVjzHnYLprcc4tZ7eF7ksnezY
	uEV8dDi/jjV7k7DV6B5OtBvRhnBnBwLZvtpZVAuLBMpAIdTEIn4OSzaDXCGcqbFiRVr2RJ6WQPV
	CZV5mE9arGccu/ERzRlUEQTwZSglLFkG9hPNczgR3MrjcTkq9mt5apfTjIdKCOy9QV5OTa7qT
X-Gm-Gg: ASbGncu2f6hkXSGfprB55AqynbsAfLbmnyvDsRKrF/BtVIIAb6iGzZQ6F8IPNguDbSw
	2Lc0ljPWGJwjM/AcKD9GpihI9Z8w5iEdp0Bxq28LITLjHiMtE6IXoFUlyCj2PdzqLLso859eRpD
	rszjLlun9Ll66UDbllkiDuy5KQ4V+yrcYT/65DtNUr76QjVsUBugxHIio+NkwxJ0PkkEstKxPrK
	y9ERDkx3Ge7GcdVrv2Ig8TF+UQyHBa+0P4OPz65/KBEmMUBFg9yXmP5OeooDwDnYgmwMs8jFXM3
	FbwXgJjpfYhA2wrMtypwLgOxDs/Ip/NAVuf6g5cuPolVema5wlbIgu5yhdKrXbTA6YaKL6zLUZO
	JECc=
X-Received: by 2002:a05:6a00:3a12:b0:73e:2dc8:94f3 with SMTP id d2e1a72fcca58-73ff725247amr1612736b3a.1.1745624889725;
        Fri, 25 Apr 2025 16:48:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE+S26bInhZBenA2dmE7t07ZXFkmKEWQS4evqWc88J7A2otJ6UPmPtEA9c7IzbqwWzy2fhtog==
X-Received: by 2002:a05:6a00:3a12:b0:73e:2dc8:94f3 with SMTP id d2e1a72fcca58-73ff725247amr1612710b3a.1.1745624889365;
        Fri, 25 Apr 2025 16:48:09 -0700 (PDT)
Received: from hu-uchalich-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73e25a9a308sm3868948b3a.136.2025.04.25.16.48.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 16:48:08 -0700 (PDT)
From: Unnathi Chalicheemala <unnathi.chalicheemala@oss.qualcomm.com>
Date: Fri, 25 Apr 2025 16:48:02 -0700
Subject: [PATCH v6 2/3] firmware: qcom_scm: Support multiple waitq contexts
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250425-multi_waitq_scm-v6-2-cba8ca5a6d03@oss.qualcomm.com>
References: <20250425-multi_waitq_scm-v6-0-cba8ca5a6d03@oss.qualcomm.com>
In-Reply-To: <20250425-multi_waitq_scm-v6-0-cba8ca5a6d03@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@oss.qualcomm.com,
        Prasad Sodagudi <prasad.sodagudi@oss.qualcomm.com>,
        Satya Durga Srinivasu Prabhala <quic_satyap@quicinc.com>,
        Trilok Soni <quic_tsoni@quicinc.com>,
        Unnathi Chalicheemala <unnathi.chalicheemala@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745624885; l=4913;
 i=unnathi.chalicheemala@oss.qualcomm.com; s=20240514;
 h=from:subject:message-id; bh=CxAQMDuh9krf1N30Zll9vwqxkcHp/5I1Da/5rxIOxLU=;
 b=dz2NiBZ9DGZH4/87bJKCw9aH1uTMzvimIZ3Ing3QOSgd092wkyhzGNap/LUVA9DhgcYTM0wfa
 Ix6f0hXcRETAzOHs8oABuucTO4yO1ccZvK3wnsnn/S0rSL7roKBMA48
X-Developer-Key: i=unnathi.chalicheemala@oss.qualcomm.com; a=ed25519;
 pk=o+hVng49r5k2Gc/f9xiwzvR3y1q4kwLOASwo+cFowXI=
X-Proofpoint-GUID: 2GPOx0I-BDGj1MyBLQJTELHRT0UKtnEf
X-Authority-Analysis: v=2.4 cv=OY6YDgTY c=1 sm=1 tr=0 ts=680c1f3b cx=c_pps a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=IoDWPEjDBkkTTY39AZoA:9 a=+jEqtf1s3R9VXZ0wqowq2kgwd+I=:19
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: 2GPOx0I-BDGj1MyBLQJTELHRT0UKtnEf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDE3MiBTYWx0ZWRfX2NTkpZk7pqTW RwdtO0ZfAuRxYJQRnW1v26b5Az/pFPk/NNo8zxsVao7UFWrwKjoEZWPNDqxrCEcPTBge9pexnIc IwgmPGQ/8ZQeOWVUvV0w3t+keEj+kSYnRyWXU9tD8aAtVCJfM/2ektIJIGxNdpiPwvylOxQaKau
 fYiARKefLit8YKVFVhOow3Hxe+57wm6qO1bqtyrY7y69WyfBonFKRv8svdvw6Usj71Gqmrizeym u/t7tlA1vSYqmgpI9/jnyvLWa7x3lz7Swmmd3gHK+26y2EkvdmsCujmSgHGy2UB+Z1hmd32M6n/ UYWSC1WNAFAF0OcXCCjBFiZ2N/ySQq42bFyjtswYVtIjZxXi5tbMxkHcAI42qGP0+g3dZOtnZbx
 1SQFyynsWdjb7H/9Q42pZ3iZ9Oe33EavH8xyjemGVFGV880W0Pz6ftsWJheoY9MMW2yN9K+q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_07,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 mlxscore=0 clxscore=1015 malwarescore=0
 mlxlogscore=999 phishscore=0 priorityscore=1501 spamscore=0 adultscore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250172

Currently, only a single waitqueue context exists, with waitqueue id zero.
Multi-waitqueue mechanism is added in firmware to support the case when
multiple VMs make SMC calls or single VM making multiple calls on same CPU.

When VMs make SMC call, firmware will allocate waitqueue context assuming
the SMC call to be a blocking call. SMC calls that cannot acquire resources
are returned to sleep in the calling VM. When resource is available, VM
will be notified to wake sleeping thread and resume SMC call.
SM8650 firmware can allocate two such waitq contexts so create these two
waitqueue contexts.

Unique waitqueue contexts are supported by a dynamically sized array where
each unique wq_ctx is associated with a struct completion variable for easy
lookup. To get the number of waitqueue contexts directly from firmware,
qcom_scm_query_waitq_count() is introduced. On older targets which support
only a single waitqueue, wq_cnt is set to 1 as SCM call for
query_waitq_count() is not implemented for single waitqueue case.

Signed-off-by: Unnathi Chalicheemala <unnathi.chalicheemala@oss.qualcomm.com>
---
 drivers/firmware/qcom/qcom_scm.c | 78 ++++++++++++++++++++++++++++------------
 1 file changed, 56 insertions(+), 22 deletions(-)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 529e1d067b1901c4417a1f1fd9c3255ee31de532..9f8db13ef1ce14cc324fa9f0abf5c6a97ceb7b8b 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -47,7 +47,7 @@ struct qcom_scm {
 	struct clk *iface_clk;
 	struct clk *bus_clk;
 	struct icc_path *path;
-	struct completion waitq_comp;
+	struct completion *waitq;
 	struct reset_controller_dev reset;
 
 	/* control access to the interconnect path */
@@ -57,6 +57,7 @@ struct qcom_scm {
 	u64 dload_mode_addr;
 
 	struct qcom_tzmem_pool *mempool;
+	unsigned int wq_cnt;
 };
 
 struct qcom_scm_current_perm_info {
@@ -2118,6 +2119,28 @@ static int qcom_scm_fill_irq_fwspec_params(struct irq_fwspec *fwspec, u32 virq)
 	return 0;
 }
 
+static int qcom_scm_query_waitq_count(struct qcom_scm *scm)
+{
+	int ret;
+	struct qcom_scm_desc desc = {
+		.svc = QCOM_SCM_SVC_WAITQ,
+		.cmd = QCOM_SCM_WAITQ_GET_INFO,
+		.owner = ARM_SMCCC_OWNER_SIP
+	};
+	struct qcom_scm_res res;
+
+	if (!__qcom_scm_is_call_available(scm->dev, QCOM_SCM_SVC_WAITQ, QCOM_SCM_WAITQ_GET_INFO)) {
+		dev_info(scm->dev, "Multi-waitqueue support unavailable\n");
+		return 1;
+	}
+
+	ret = qcom_scm_call_atomic(scm->dev, &desc, &res);
+	if (ret)
+		return ret;
+
+	return res.result[0] & GENMASK(7, 0);
+}
+
 static int qcom_scm_get_waitq_irq(void)
 {
 	int ret;
@@ -2149,42 +2172,40 @@ static int qcom_scm_get_waitq_irq(void)
 	return ret;
 }
 
-static int qcom_scm_assert_valid_wq_ctx(u32 wq_ctx)
+static struct completion *qcom_scm_get_completion(u32 wq_ctx)
 {
-	/* FW currently only supports a single wq_ctx (zero).
-	 * TODO: Update this logic to include dynamic allocation and lookup of
-	 * completion structs when FW supports more wq_ctx values.
-	 */
-	if (wq_ctx != 0) {
-		dev_err(__scm->dev, "Firmware unexpectedly passed non-zero wq_ctx\n");
-		return -EINVAL;
-	}
+	struct completion *wq;
 
-	return 0;
+	if (WARN_ON_ONCE(wq_ctx >= __scm->wq_cnt))
+		return ERR_PTR(-EINVAL);
+
+	wq = &__scm->waitq[wq_ctx];
+
+	return wq;
 }
 
 int qcom_scm_wait_for_wq_completion(u32 wq_ctx)
 {
-	int ret;
+	struct completion *wq;
 
-	ret = qcom_scm_assert_valid_wq_ctx(wq_ctx);
-	if (ret)
-		return ret;
+	wq = qcom_scm_get_completion(wq_ctx);
+	if (IS_ERR(wq))
+		return PTR_ERR(wq);
 
-	wait_for_completion(&__scm->waitq_comp);
+	wait_for_completion(wq);
 
 	return 0;
 }
 
 static int qcom_scm_waitq_wakeup(unsigned int wq_ctx)
 {
-	int ret;
+	struct completion *wq;
 
-	ret = qcom_scm_assert_valid_wq_ctx(wq_ctx);
-	if (ret)
-		return ret;
+	wq = qcom_scm_get_completion(wq_ctx);
+	if (IS_ERR(wq))
+		return PTR_ERR(wq);
 
-	complete(&__scm->waitq_comp);
+	complete(wq);
 
 	return 0;
 }
@@ -2260,6 +2281,7 @@ static int qcom_scm_probe(struct platform_device *pdev)
 	struct qcom_tzmem_pool_config pool_config;
 	struct qcom_scm *scm;
 	int irq, ret;
+	int i;
 
 	scm = devm_kzalloc(&pdev->dev, sizeof(*scm), GFP_KERNEL);
 	if (!scm)
@@ -2270,7 +2292,19 @@ static int qcom_scm_probe(struct platform_device *pdev)
 	if (ret < 0)
 		return ret;
 
-	init_completion(&scm->waitq_comp);
+	ret = qcom_scm_query_waitq_count(scm);
+	if (ret < 0)
+		return ret;
+
+	scm->wq_cnt = ret;
+
+	scm->waitq = devm_kcalloc(&pdev->dev, scm->wq_cnt, sizeof(*scm->waitq), GFP_KERNEL);
+	if (!scm->waitq)
+		return -ENOMEM;
+
+	for (i = 0; i < scm->wq_cnt; i++)
+		init_completion(&scm->waitq[i]);
+
 	mutex_init(&scm->scm_bw_lock);
 
 	scm->path = devm_of_icc_get(&pdev->dev, NULL);

-- 
2.34.1


