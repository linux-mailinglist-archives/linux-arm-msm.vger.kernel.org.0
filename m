Return-Path: <linux-arm-msm+bounces-83901-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 70745C95069
	for <lists+linux-arm-msm@lfdr.de>; Sun, 30 Nov 2025 15:41:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 529884E1919
	for <lists+linux-arm-msm@lfdr.de>; Sun, 30 Nov 2025 14:41:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 795FB24111D;
	Sun, 30 Nov 2025 14:41:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o5bO2n2L";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GwYhC7jU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 918A527F01B
	for <linux-arm-msm@vger.kernel.org>; Sun, 30 Nov 2025 14:41:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764513680; cv=none; b=FpNEmyKdOF45KZsXhNFDn41TgN8pdz7f88ZjfxK37dUqz311SZ93uqrQzbkxKE4k5m9qRDkZhI81edGBQXIp1mBVGqTiv1Mw8s0EYkFh2EEAngathCh3mprmxn3owdUJh9l7CI/+VGwbBnOeH/BUsDzKbDpA1LaweawZxDIs9LI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764513680; c=relaxed/simple;
	bh=LePUQ8ME3FKvLmh/muRRq0EuwzJxHLZEsiBmHc85nx0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Vgl505/xBv/UNfqhx9sZNzaI42s9tW8N3HbSeBIZUuTNGBcVIzhn8hWv0XeFauDUR+f+i/u2C3J6/gxbmvtBNzLWIfDVGvUeVvas12iZiOOto9cm9MFIeJGRRn6KyEJ1h+JCOvmc6Hnh3khNSlIvtdHWlLmQerVCqxwCYb0bJ4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o5bO2n2L; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GwYhC7jU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AUD8qj61715248
	for <linux-arm-msm@vger.kernel.org>; Sun, 30 Nov 2025 14:41:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6F5kQGXL7oxe+UU3twPOQhhoKB8f5LIFPh3+J/gy88k=; b=o5bO2n2LVIz3c1Cf
	LG+sLkh0zLi9qTy+HTvf1tlaKdemN2Glr7qV5O14uiozkf92PGP1fSGtAmctDUHk
	xBndE1Tx/rv2uOCaPvjna7yf4/nB553bPH4D8MgLk2AUraqqvZaNUIOgDr2+jMPx
	1snIjysa8pwh3PR0b9rRFxNbRpMkFjhjdqpFzHanea6otVd8+chX8Ad7XzoPdX1I
	ZnHwFX8UDAswN2O08nGQ8IG+C+ai0fofCeAqGnRL8tj/to+t1zz4/jnBRLmE+FOA
	gu+gCq+in4/5zE+M8UXR2vtmOyroYAo3L/ztNx5Uafb+pYtT9xaqtg2pbYEb8PFI
	pH3ddw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aqyw5hqkr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 30 Nov 2025 14:41:17 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-7b8973c4608so8717799b3a.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 30 Nov 2025 06:41:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764513676; x=1765118476; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6F5kQGXL7oxe+UU3twPOQhhoKB8f5LIFPh3+J/gy88k=;
        b=GwYhC7jUntP1K/mUBMFmQqi8HZ5hqUAxYpZK/S11Fa2GoYN3i03PozqGjqzuxS0s2C
         A91Uf/f7g9ndLFG8rK3DPFjBrG2usxI54OWH+j+bAOfYAYArerdLKs+OBoTLVknQ1AOa
         m/J4Xp02FHEr6e5yZrYLdq2T6VglRia3+PmouMkNXjaibHcyclbVlIRJeXDezvFhjGrD
         jNe32iGPTqo61rRsw0qh0t7XCMK3sgsmVD3roYJ0FwEFuc4Qd9iogCewKcMiXpvbiin+
         gy9PQfU2udE4J3bbOscyhW70MntExI8JtqLlD/giw16A+VTQ9Jty3REC5hgBNsdW7evC
         2tWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764513676; x=1765118476;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6F5kQGXL7oxe+UU3twPOQhhoKB8f5LIFPh3+J/gy88k=;
        b=qNSkP2OSw7Bz0Qr+NataDZjNVpilZ1/L8v6LNQl8Dcg55wTfiZnAqnMMBv2RUp/pZS
         J2KqqjTc2LJ9ZIO+dvC0egycrme5+kWlDYtcpJPfZ4bFT+8QEmIRNs9MBxYlNEhkfKzq
         oBwACSGyHlHeUb66maX0GOIJXwUBZ0c/RWuQTdL2tX+Wjqtp0KCipOoeOpB9jzvlU7iD
         ku9QM06cXBJ1M+oWrISWqUsU5cfgyG+ZQYtYjlw8laHucCZ5JliH0xbZeey+gNxTuJT0
         WEnHkweWbIf62GwnoIaXUec24O7TSVSbo9GhvZJX0z8MTSEPXrx8mmokith5LkmMAkyH
         DLaQ==
X-Gm-Message-State: AOJu0YyLRGqbZrHsBua0UGbxiFSfbDSOILIr3UVsLIXkx06oNZs12IHn
	itcM2fWzMMHEmrE8VdskJ0Wnh9tBv4FGraa55/24vT+Jr8UbWqBMSNJI1CB4yXj7rZD3evCzqxR
	LBjYclIwGIW2AuJ3TyZDE9NVpNK1V15k/20c7zMpuRCoI6XlMhyiJGV+L+IAM+CgWO7iW
X-Gm-Gg: ASbGnctiGEQXR7d2HcsNboq0NMgQsUMyPXdURD9YB1vtzrSX2wWc2S46LN7qFwPQQFh
	SmSec/sX70wtub5BUVDqZkxSxdQZM8f6PN8pZsEd6Sw/lUPX7kqvZifQyCvHkaPIF1DE4cUFqj2
	7ecCN0MIZPtO+9TLnF44t8i87E91xL5mFIj3PxlE+nMomnMYQk4iznX6rJ1ll+7qc4iaRjgokMu
	yfBEZLXVtnRBoVK0UzKRnadXv3QuaUX+kkvICei9dCEd9GcNa7IehdSxFD0b5dm2xVzKa+PePWP
	dJXjVIh9vfap2qjRnsO+dB4EK49InmcevioYHsIV04no45wjOOKREtS0gQ6CF6ABPHzRtI88WrY
	NcobBObU+VnyvV9vse/77MrZLZTEcx0bkl35gElQYYq8Kmw==
X-Received: by 2002:a05:6a00:a05:b0:7ac:edc4:fb92 with SMTP id d2e1a72fcca58-7ca87dd5677mr21596736b3a.11.1764513676160;
        Sun, 30 Nov 2025 06:41:16 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGOFcQtjx9M7v8B2u+sHSL8EvcAHDdy5PUWxM6DZRnU39bp8nnScYEhw+pTWRpeevkOgCmO0g==
X-Received: by 2002:a05:6a00:a05:b0:7ac:edc4:fb92 with SMTP id d2e1a72fcca58-7ca87dd5677mr21596718b3a.11.1764513675650;
        Sun, 30 Nov 2025 06:41:15 -0800 (PST)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7d54b003177sm5240065b3a.14.2025.11.30.06.41.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Nov 2025 06:41:15 -0800 (PST)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Sun, 30 Nov 2025 20:11:03 +0530
Subject: [PATCH v10 2/3] firmware: qcom_scm: Support multiple waitq
 contexts
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251130-multi_waitq_scm-v10-2-5a5f2f05a417@oss.qualcomm.com>
References: <20251130-multi_waitq_scm-v10-0-5a5f2f05a417@oss.qualcomm.com>
In-Reply-To: <20251130-multi_waitq_scm-v10-0-5a5f2f05a417@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Unnathi Chalicheemala <unnathi.chalicheemala@oss.qualcomm.com>,
        Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764513668; l=5981;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=/M4m1BOaVqqodTh3sK6zER8MxMbwYfx/S4aiwEEilzc=;
 b=bZHvyh5+IT64WwAGI/CtcDzrIdRUCBOhFeB/N7m5g9F6bYRq1VNX0+PHfmIJuYDXk1A6mwdb2
 NxNcH4fML2PBlCDJCZXFJwemWpmUIpqU/TMm212XNyMBofdVlMSbXF3
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Proofpoint-ORIG-GUID: eI4zknXHSAkRgueYJTs4Ndku0HaHTtRA
X-Proofpoint-GUID: eI4zknXHSAkRgueYJTs4Ndku0HaHTtRA
X-Authority-Analysis: v=2.4 cv=SoKdKfO0 c=1 sm=1 tr=0 ts=692c578d cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=QwukUx79tW4PgYOutgUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTMwMDEyNiBTYWx0ZWRfX4ClatK9OdJ0p
 gdu/ad8oSeHtwg3pRvZ4urTdqfdJ22DftOGVccD3V05DSfycL9NaluSxGjvqk6JZHBHwJfKoJWz
 QaGRq+DMpeVICxqXkxWgQni7DrQeS0BelIlnKccH1BcXxyTtB6EKTInXcMBcvVC15lWVytcB4kd
 yhyydGAXRKvhhh0L19E7BJVPJ4qpXgTXm3oEijOqAUM2qEuNEgDOE3n0U8xoAFAc6FhQ9DUsWj/
 KxcTyYK/vZe0TKCoUaTtB1io0GVAbl1+usD9/0dMqB4pBJO4wP7iP7hMuoccw6cz+VLmNAn50Nj
 o2fYXpqNCCqnE2Pn5aBYLTOPjC0HDvCJ2kVA3m0wVmpyEZQqSfW+eDjouMupyAp+49gCqUSu7J+
 77QUV2/bQU1/Fq3wCXsy1hcs5gmniw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_08,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 bulkscore=0 lowpriorityscore=0 adultscore=0
 phishscore=0 priorityscore=1501 suspectscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511300126

From: Unnathi Chalicheemala <unnathi.chalicheemala@oss.qualcomm.com>

Currently, only a single waitqueue context exists in the driver.
Multi-waitqueue mechanism is added in firmware to support the case,
when multiple VMs make SMC calls or single VM making multiple calls on
same CPU. Enhance the driver to support multiple waitqueue when
support is present in the firmware.

When VMs make a SMC call, firmware allocates a waitqueue context,
assuming the SMC call to be a blocking call. The SMC calls that cannot
acquire resources, while execution in firmware, are returned to sleep
in the calling VM. When the resource becomes available in the
firmware, the VM gets notified to wake the sleeping thread and resume
SMC call. The current qcom_scm driver supports single waitqueue as the
old firmwares support only single waitqueue with waitqueue id zero.
Multi-waitqueue mechanism is added in firmware starting SM8650 to
support the case when multiple VMs make SMC calls or single VM making
multiple calls on same CPU. To enable this support in qcom_scm driver,
add support for handling multiple waitqueues. For instance, SM8650
firmware can allocate two such waitq contexts, so the driver needs to
implement two waitqueue contexts. For a generalized approach, the
number of supported waitqueues can be queried from the firmware using
a SMC call.

Introduce qcom_scm_query_waitq_count to get the number of waitqueue
contexts supported by the firmware and allocate “N” unique waitqueue
contexts with a dynamic sized array where each unique wq_ctx is
associated with a struct completion variable for easy lookup. Older
targets which support only a single waitqueue, may return an error for
qcom_scm_query_waitq_count, set the wq_cnt to one for such failures.

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Signed-off-by: Unnathi Chalicheemala <unnathi.chalicheemala@oss.qualcomm.com>
Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
---
 drivers/firmware/qcom/qcom_scm.c | 74 ++++++++++++++++++++++++++++------------
 1 file changed, 52 insertions(+), 22 deletions(-)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 79ab1707f71b0157835deaea6309f33016e3de8c..ef3d81a5340512a79c252430db5f09cd8c253173 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -47,7 +47,7 @@ struct qcom_scm {
 	struct clk *iface_clk;
 	struct clk *bus_clk;
 	struct icc_path *path;
-	struct completion waitq_comp;
+	struct completion *waitq_comps;
 	struct reset_controller_dev reset;
 
 	/* control access to the interconnect path */
@@ -57,6 +57,7 @@ struct qcom_scm {
 	u64 dload_mode_addr;
 
 	struct qcom_tzmem_pool *mempool;
+	unsigned int wq_cnt;
 };
 
 struct qcom_scm_current_perm_info {
@@ -2247,6 +2248,23 @@ static int qcom_scm_fill_irq_fwspec_params(struct irq_fwspec *fwspec, u32 hwirq)
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
+	ret = qcom_scm_call_atomic(scm->dev, &desc, &res);
+	if (ret)
+		return ret;
+
+	return res.result[0] & GENMASK(7, 0);
+}
+
 static int qcom_scm_get_waitq_irq(struct qcom_scm *scm)
 {
 	struct device_node *parent_irq_node;
@@ -2278,42 +2296,40 @@ static int qcom_scm_get_waitq_irq(struct qcom_scm *scm)
 	return irq_create_fwspec_mapping(&fwspec);
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
+	wq = &__scm->waitq_comps[wq_ctx];
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
@@ -2389,6 +2405,7 @@ static int qcom_scm_probe(struct platform_device *pdev)
 	struct qcom_tzmem_pool_config pool_config;
 	struct qcom_scm *scm;
 	int irq, ret;
+	int i;
 
 	scm = devm_kzalloc(&pdev->dev, sizeof(*scm), GFP_KERNEL);
 	if (!scm)
@@ -2399,7 +2416,6 @@ static int qcom_scm_probe(struct platform_device *pdev)
 	if (ret < 0)
 		return ret;
 
-	init_completion(&scm->waitq_comp);
 	mutex_init(&scm->scm_bw_lock);
 
 	scm->path = devm_of_icc_get(&pdev->dev, NULL);
@@ -2451,6 +2467,20 @@ static int qcom_scm_probe(struct platform_device *pdev)
 		return dev_err_probe(scm->dev, PTR_ERR(scm->mempool),
 				     "Failed to create the SCM memory pool\n");
 
+	ret = qcom_scm_query_waitq_count(scm);
+	if (ret < 0)
+		scm->wq_cnt = 1;
+	else
+		scm->wq_cnt = ret;
+
+	scm->waitq_comps = devm_kcalloc(&pdev->dev, scm->wq_cnt, sizeof(*scm->waitq_comps),
+					GFP_KERNEL);
+	if (!scm->waitq_comps)
+		return -ENOMEM;
+
+	for (i = 0; i < scm->wq_cnt; i++)
+		init_completion(&scm->waitq_comps[i]);
+
 	irq = qcom_scm_get_waitq_irq(scm);
 	if (irq < 0)
 		irq = platform_get_irq_optional(pdev, 0);

-- 
2.34.1


