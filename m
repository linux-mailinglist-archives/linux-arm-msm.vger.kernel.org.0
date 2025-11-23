Return-Path: <linux-arm-msm+bounces-83000-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F72CC7E1D1
	for <lists+linux-arm-msm@lfdr.de>; Sun, 23 Nov 2025 15:20:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0F2D33AC249
	for <lists+linux-arm-msm@lfdr.de>; Sun, 23 Nov 2025 14:20:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FE372D8391;
	Sun, 23 Nov 2025 14:19:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="K8Kp3vqO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ARIYhOQd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 417BF2D7DEC
	for <linux-arm-msm@vger.kernel.org>; Sun, 23 Nov 2025 14:19:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763907589; cv=none; b=DySOQf5r235G5Qgx5DWfxKTtCnuSxe04zIoqfkL9D+pkxSh3ZbFUCm5jbqM0Fv+FODPbvHQnUCApIJoBlkN1TjecKmxwflrvB4MKa2R5EONaMiBZ/HmtwTfnUAqu89CSyNoeNxbqnjHuvTCzUuj6lVoM5bEGoVIl714TTf6zKnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763907589; c=relaxed/simple;
	bh=VWfQc5BZbIwnD7HFRfx9d6Vuelk597XYQ25h6fQm2O8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PM4NlXBphTx1iXAsB7Gr5sVHjVhNc1+1+Kozqy3S02KzloaT0Ngltslz6oEyiIVJNAWMOyuFF4QDY02mXZHeJBYu9+T5Lw88ECbSY8vuKfMNKKU/SlIM3eNsm7gL2rjwHplIqOtfogQpDP0V9TpubjRsP0xczCN2YZjSIuXe1xU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=K8Kp3vqO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ARIYhOQd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ANBb5wm1441187
	for <linux-arm-msm@vger.kernel.org>; Sun, 23 Nov 2025 14:19:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cI76CvmHHMELmH2oLlkSsdIIMgj/IOI288biHSI0Pxg=; b=K8Kp3vqOf6Q/Wi7o
	j/7e4cvLjAfePEHHnSKTOWR6nCs1v9sdiJXiSAQtg4SmF6I1E/7yiGBrdwqoOF9S
	8/PvOZ2U9mcw7xVtFuZX1JZNFI3j8CijZeycjsnIF3fxzXhuEJGycBnfS8F+qvPv
	lPWki36DZNZmqfw8f/9VcgQUxEHnzkV+p6LIXeBC4R3TTngQkx995Q0DOd7KvLAj
	6r2Bxbpt+JvBQP7O8GyyC1yL+oxjtJJ/Zu6g7arcZ8gtuU1AXFRbwrZFQjY/AwKj
	Y4/e0NMD92ATaYfMXo9xCn+I/AA+lxZhnVkKykL7fKAXLY9nLT1nJxg1yAJw4rEO
	SjFwGw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ak6ffaft2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 23 Nov 2025 14:19:45 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3438b1220bcso3886809a91.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 23 Nov 2025 06:19:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763907585; x=1764512385; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cI76CvmHHMELmH2oLlkSsdIIMgj/IOI288biHSI0Pxg=;
        b=ARIYhOQd+BiRTaC2SQHzlRUOFH20JGMpj1Ael3QByBiNfpctbwJZuHaAgNgz1K99/6
         UaeOOwDzjETh/o4/6tmmdbHy0nujzanEizefOnLtpMYSz9LDMRRNEjU75+2/ZremqPs9
         ZszKl98ZafZA25G/fnYrS5MjFbXNSDjwp1Dd63oj7pZ71S2J/DYJlj45m0UchLK6sVee
         JcpehAay+HdL28qhb23ynKAEIEjGzeCknVZ8Fc39DdpZz2iZu8B+aZw4qu0So0Be3YCm
         JrAR6Gw4DnzDgjVLNJDEa5qUhG2SMACn7XkixLdH0CGi8Pk2/uUHZ1x/V+Mb7jnKp5cr
         pBrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763907585; x=1764512385;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cI76CvmHHMELmH2oLlkSsdIIMgj/IOI288biHSI0Pxg=;
        b=EzpgbeuRDNinGdOqMco4to0LwzRBsv7UmHMsX35xl5wL5gQlgPNAhOzLSG7izusm2J
         vPv/9PkubBOg/IkSEV0wP2Le8cQfz4FoH3vOPQj5BkjX536UZWd3JN16Xy3eqFdUGNXI
         91Qm2Exefm7fb1CdNPT07w8atY3ye8HrOOnRebZyaCX+1Eia/zhUGmWjh5U04ISLk5KV
         RA9Bn6yn0NfJLICuhQs4YAoYSm9SW7dv+VwJkYhH834q5W5s8oAOPwYDecdStCSNYXxi
         fvMKgOFW1LjnNU7Z84HnWdMIqE+yr/CK3ouhkVG0xFHw0YW/bY+/eceuLP9U89RFOZCi
         +7xg==
X-Gm-Message-State: AOJu0YwTWLR71QogUfstXsC914lX+LrLvxXDdHPw/FUg/lYpaXr7I8SK
	qd2ePGptHQvpucm/MKj5Fr2Q0IqxI3flWfdTWU5iAIt9Y5E3JUARP6x7bkGrq9W3Y9t3XscQ5sO
	FbfZZOglLgbve5E/nIOwsgWxKWcfL0+mfYT5+qh5Ep5JBAEX/jHqe+fXgAXbKNtH6rHihOxFNx8
	6U
X-Gm-Gg: ASbGncvXS25VWACJrbE19ZmtEKeVNDVuJrY+Rt9G+mtsseI6VDwLYh/bcidiP4WN8aT
	cBI/R+Z0UxC0Ss4Z4x+qCPjoLppwnupIa8RulsyUJE/OJKoYH+pnIkQuoabvloiSpMFk+M0WuzR
	lIUVBTtgO/Bi5i6Y+OwjR92KgFKM/8brTFHvE1hSLcmfFSyJEK42bWFxHSr+30eOf6korkHFNoN
	FTbhVfyOwkpXqriz50d7YS2iZce4ONZxLDi+NThboil0EQ4zIsZKK0jxy37jRTaOgtx4GZe8CKk
	gB711AQi6oAJVLd2QqmNAfXqKTkvtN+C5oa/ol5NZ15KncIODoQF5G646Rj4eY3J8338zwPO4vd
	tUD5scwgkR3nFTVlmyyG42cDWvO41IzdhJQM/MMLuLgoskw==
X-Received: by 2002:a17:90b:3841:b0:32e:a8b7:e9c with SMTP id 98e67ed59e1d1-34733f3d1ffmr8017758a91.29.1763907584754;
        Sun, 23 Nov 2025 06:19:44 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHa7GoWiQzcPIOP1Al9nvBo7LmLvBsNdSNsbET1/efKSwpai3tKC85VypYSqMq2KwEYy6/LgQ==
X-Received: by 2002:a17:90b:3841:b0:32e:a8b7:e9c with SMTP id 98e67ed59e1d1-34733f3d1ffmr8017738a91.29.1763907584197;
        Sun, 23 Nov 2025 06:19:44 -0800 (PST)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-345af0ca952sm10135992a91.0.2025.11.23.06.19.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Nov 2025 06:19:43 -0800 (PST)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Sun, 23 Nov 2025 19:49:31 +0530
Subject: [PATCH v9 2/3] firmware: qcom_scm: Support multiple waitq contexts
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251123-multi_waitq_scm-v9-2-0080fc259d4d@oss.qualcomm.com>
References: <20251123-multi_waitq_scm-v9-0-0080fc259d4d@oss.qualcomm.com>
In-Reply-To: <20251123-multi_waitq_scm-v9-0-0080fc259d4d@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Unnathi Chalicheemala <unnathi.chalicheemala@oss.qualcomm.com>,
        Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763907576; l=5927;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=MTXV4biGU2m/VveAT3FCxiawD238PKh6quPNNW4oQ/0=;
 b=r0K+uUCt9prvD89u74QQb4pqmbw/Wt2eZG/ok1/ukzrg/8MfzQCK/U39LmJ2WrDazpnOhH8N+
 veig/hOeJtrCZwl8xQaMM7ghWdx1oJPCsBxnoIJDtacGdnjKyuQ9TbC
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Proofpoint-GUID: singv92_AOyTUqowe10wdBMhqHq1D9gl
X-Proofpoint-ORIG-GUID: singv92_AOyTUqowe10wdBMhqHq1D9gl
X-Authority-Analysis: v=2.4 cv=OsxCCi/t c=1 sm=1 tr=0 ts=69231802 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=QwukUx79tW4PgYOutgUA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIzMDEyOSBTYWx0ZWRfX8OOVU6ShisMv
 gzIEV1Fqy+NSPC3+nvYuM1TOnB1rRlVBliHAHA91sfOVHbjnotxnoBfUvT75rlDO3pEduJO839a
 sQ+yuAsy5TNQWMSeKVlEQC/ghzOeqUvBEDj8pRM0AVkrv2E3Xt85vP8RkCeVoRBCwnB0f52zx1Q
 BDyG238ue6QCp3t3de9fOMX91OijsAoJFgMb1QM3M8SOLsYxcR0clSIss1Zs+QJ0elTQrVAhD0N
 Xctqnkxk6fYWjEH671Rlwtw9AWIpimSViW/7uRmLTjgO6rl1ImLTKdr/jDlv3lhK3GitIaRH1QJ
 TRc8rz00Efz8773sGFB8WrY9lyJ484hN1hcxbVirb4gZprddPzVvSiQWacqHTnzi79xZrTtLKW8
 cX4hYXCCWztft5aZjbmkv6n7SX9Pkg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-23_05,2025-11-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 suspectscore=0 adultscore=0 bulkscore=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511230129

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

Signed-off-by: Unnathi Chalicheemala <unnathi.chalicheemala@oss.qualcomm.com>
Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
---
 drivers/firmware/qcom/qcom_scm.c | 76 ++++++++++++++++++++++++++++------------
 1 file changed, 54 insertions(+), 22 deletions(-)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 28979f95e51fbee94b84c1570a4d88a76f72db4e..149c2ccec2a5ff77054178fa021fd0b721d9f8d7 100644
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
@@ -2247,6 +2248,25 @@ static int qcom_scm_fill_irq_fwspec_params(struct irq_fwspec *fwspec, u32 virq)
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
+	if (ret) {
+		dev_info(scm->dev, "Multi-waitqueue support unavailable\n");
+		return ret;
+	}
+
+	return res.result[0] & GENMASK(7, 0);
+}
+
 static int qcom_scm_get_waitq_irq(struct qcom_scm *scm)
 {
 	int ret;
@@ -2280,42 +2300,40 @@ static int qcom_scm_get_waitq_irq(struct qcom_scm *scm)
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
@@ -2391,6 +2409,7 @@ static int qcom_scm_probe(struct platform_device *pdev)
 	struct qcom_tzmem_pool_config pool_config;
 	struct qcom_scm *scm;
 	int irq, ret;
+	int i;
 
 	scm = devm_kzalloc(&pdev->dev, sizeof(*scm), GFP_KERNEL);
 	if (!scm)
@@ -2401,7 +2420,6 @@ static int qcom_scm_probe(struct platform_device *pdev)
 	if (ret < 0)
 		return ret;
 
-	init_completion(&scm->waitq_comp);
 	mutex_init(&scm->scm_bw_lock);
 
 	scm->path = devm_of_icc_get(&pdev->dev, NULL);
@@ -2453,6 +2471,20 @@ static int qcom_scm_probe(struct platform_device *pdev)
 		return dev_err_probe(scm->dev, PTR_ERR(scm->mempool),
 				     "Failed to create the SCM memory pool\n");
 
+	ret = qcom_scm_query_waitq_count(scm);
+	if (ret <= 0)
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


