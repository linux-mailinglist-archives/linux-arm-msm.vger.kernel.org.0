Return-Path: <linux-arm-msm+bounces-105259-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6OQkE8g58mlopAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105259-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 19:03:04 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 17331497EB3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 19:03:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 65F92301E668
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 17:02:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB3FB410D3E;
	Wed, 29 Apr 2026 17:02:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZCAbOsSh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HFmrMLOa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61350410D1B
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 17:02:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777482126; cv=none; b=mAvp7/malIvYnchm6Jsf0udX5w0XrHnkQtVIyxL8I6kYCZ2qwthT1mGIAIzzT9kp0wIAtYmd1reV7rz8uojBNFDJ/ml2chLdnHjilIbCHDuzGjgnjvWEq3hkZpUJSxAE0Lr9bXhVIo8maoDdxXvjmlKnuGeFMAy8yNlDV7/zL/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777482126; c=relaxed/simple;
	bh=ovZTqUF5/g2sWp/btJDRSg/I1HuohA0bLfF+dYDDAN4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LdMD0nU/Bpt99/Y0jvZ5esXkXlqFtyHDURZgOp7vX29763y9/cTAFmmnmLZyeTIjK8ZS9xb6Zt4U0j/UaUQLQRek5708QxEw8K6R/ekYpxPX20+BVi/wzYBtiHnRaqN6PFHjHvdsc4uvDwrkbZvBYbUF210FIzigKL00IGfKPmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZCAbOsSh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HFmrMLOa; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63TFcisG1729747
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 17:02:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	j2Ivexwz+aHyP4Wah8ZSNwaKmGZD+PrFeXoflq99gDE=; b=ZCAbOsSh7jJfTWXJ
	YLq4yNxSyUKwYAnssN7pkdn5VXZlAxirYKuC/baaSghDv+96VC4QYsDXFx5ccyVy
	Z8WxtVSL74b/Ik2c7m165qfS8EHCNpbD91BBuG9X5qRpF0U3MEQ+r8zhukvcCZEM
	XULEqcO8TExlQdzL7vIqcUpU8eU5fYqdXBwkAqp1ti+U3uLz0NKOHIOUIVR9y4NT
	q8mzDTgRVdM4feTpL2CBrFTdgjIt2oJ38spRr3ueuc93gGXHtiZ+LY0mp0XODbsp
	Px5UGPqVuJZKKUICNciraysJTPrAzhnt9AAJf4bE0xiBiZnoAkmdhyqAGrq3Jyxp
	AFsNAQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4due5kt4me-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 17:02:00 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2b249975139so312465ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 10:02:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777482119; x=1778086919; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j2Ivexwz+aHyP4Wah8ZSNwaKmGZD+PrFeXoflq99gDE=;
        b=HFmrMLOakOPIvIXrZZ7Yh6XHNKhLLkLjE3xXKe+F5jp4U1qbDls/9f6mxCe/Ysic9F
         /YKocdh6+dXqGEHDP0VqP3iBouH6kAp3VM4F1v7ZOtuOSOqC41i0Z3qGtYIH4XTpsAvM
         6QeGDxzu30Psn2I2CZLB7XRUwddBUNLck6wPkT4RQkQZVleIZ9cPqyIEAqIjeJbT52GZ
         dMFrOC+RC+mqXjupJ7I8U5cKVTnkR4x9WMqQhAssPaj0bke/5ongYVWhOOODsG+4O06c
         fmeyV/lDtnnPlQ774/pxfkYzF75RocdijdBK7q4v8aSkZctWLEjtc2hzq6OHMub7++gT
         o5Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777482119; x=1778086919;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=j2Ivexwz+aHyP4Wah8ZSNwaKmGZD+PrFeXoflq99gDE=;
        b=m3N++sy7ne0Q0mx+k93QSk+ojVXOXeMdA9+V8UOajxrCfjbCxnDGN+0xkJxtktYWb9
         i/SSOrwmNJ1innaIAviQX09Mycw2y7hNngrXAKISfD8/jjeUa5mAflD7rp3avxjcaRXz
         hknIz3oxPqxhbWvVGFCdCzIpg2BA0c3INwM6bXwTn/ISbGhbDhFApls5QLy4VEhtbNVS
         6x4osdNkznhCprKq2+2tvjuu+M/ya6Psj1h0teK5WTmQ+wxBp3nRjb7Klc22AMaQJfxR
         9sO0dt/XT/xUz8Q/vWlOgrJtdb4Gat/k3veh0zpqFok3X4Q5FRdfFmmt4jnQgUlZU/r7
         IkOQ==
X-Gm-Message-State: AOJu0YzmSzu75NCCTqX2UbsjSpbnqTj56SMrZFMt+aH5zisws/eGpn6H
	FW/AlnaKzHY+ldEbjcBO02U9R7Z3JqErXmBehGcgrgE2v+7jlrEropeH7a/Hs1+6+Bm9MY811MJ
	Q7MeulUEnLYDLoZO6pJM2xcDAHVwOUc/RPFAplks/AIVvYB9tGhUICU986VaQDZNmyZYb
X-Gm-Gg: AeBDiet11IX0WQg3A2gzsgBHpu3pPd58tdSnxMj4TxKM+Ok0kuktrr6SWYlHVZ2/8GG
	akIiLMJTe/uZzcHtPfMOXoM/YIAJRy70J31Ti67dTTnuyfO9xk/Pp5jVtuhelQs+yrYH8m5vau7
	mQM6OF9zEyJpQ3ysP6JLptkRRVKMuIzj7kv8qZJWS3NBMzZ2k01n0xyezt/dXcI9coUwGlR/CKr
	j+iIl059Y+HM6qAnekrx0tTCvTcPUCb6yVvzN1at+1RPGRXD5ijjxOW/M5y9+vee+lKt8/A8R66
	tdfSKiLpxUt0hPOkr/XzzZeTMIukyso8phthW0WsM8HIy365Ark/pi3adwbrp+8CXHr2ZsmfM37
	khvbPNFerNVSm2vZ2Ngv7DFZuBEoqx9euJTI1kZAs49LrXOa+nrGaLLRtNxhcXksWX82a
X-Received: by 2002:a17:902:c407:b0:2b4:5dad:2523 with SMTP id d9443c01a7336-2b9874c7e78mr50152465ad.35.1777482119115;
        Wed, 29 Apr 2026 10:01:59 -0700 (PDT)
X-Received: by 2002:a17:902:c407:b0:2b4:5dad:2523 with SMTP id d9443c01a7336-2b9874c7e78mr50151905ad.35.1777482118618;
        Wed, 29 Apr 2026 10:01:58 -0700 (PDT)
Received: from hu-vdadhani-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b9887853a2sm29530195ad.18.2026.04.29.10.01.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 10:01:58 -0700 (PDT)
From: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Date: Wed, 29 Apr 2026 22:31:38 +0530
Subject: [PATCH v5 3/7] spi: spi-qcom-qspi: Add interconnect support for
 memory path
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260429-spi-nor-v5-3-993016c9711e@oss.qualcomm.com>
References: <20260429-spi-nor-v5-0-993016c9711e@oss.qualcomm.com>
In-Reply-To: <20260429-spi-nor-v5-0-993016c9711e@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, linux-spi@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777482100; l=4235;
 i=viken.dadhaniya@oss.qualcomm.com; s=20260324; h=from:subject:message-id;
 bh=ovZTqUF5/g2sWp/btJDRSg/I1HuohA0bLfF+dYDDAN4=;
 b=gxL6mgFY9dV5rNFOJLIQhaOWze1XUs8hM9+PuUYaer8dRy2UUpam/lQMrxLEUEJ6cbpTjMR7a
 q5PyTtqplVICwNR4yie4D4+2ZKbrF18vn6OuOlJXU5aBvkJaUThiPAq
X-Developer-Key: i=viken.dadhaniya@oss.qualcomm.com; a=ed25519;
 pk=C39f+LOIGhh/02LQpT46TsUSXRvBn9qXC8Xb26KJ44Y=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDE3MSBTYWx0ZWRfX/fObE8xQJes/
 v6mMuDHrIa3IRhUgQj+xWhRSAPL87/eZOu/VLzd0bhy9Q6B0g0OFlRO9ZURHJtDwFmavEPnJlxF
 jwf5Pwfwld8LjAUr8ykfUHQZvLftr9wAxAfd4hx7T7YepZlBA3Xh0apm/Y4PDt5I0BvnYBUMWZa
 DmHQxRoWx/y0ZzoviNmWKQkm4Vosetwg8yZK7KZT/32NWjO2cbzp2ZDbg/li+sQpyHO+hjsIZcU
 icMy+JfXhndBo2G4VcMkSFGxYZ6tnuumtSsyxtvKs8qr7RUBdVsTq8MGp9ReU44k6xlFL9RQ3Uy
 EN6mzNjzQVNyfI55qR6W6jJAf5CMmtdizfdivGSCyyhhPuu/5KLWU5tyH5xxrau0V7vZotT/gfO
 ieD1xomYGU/e7hHfHHldwre57UJHZisfTfCiaMm6/kKRnb5Te45B+RtEZVea7FewUemljYv9hwT
 QSim61it1LTXBAL7WYA==
X-Proofpoint-GUID: uyDmZ97FaWRgPCyP1t8yKJ7v4GIKaHl6
X-Proofpoint-ORIG-GUID: uyDmZ97FaWRgPCyP1t8yKJ7v4GIKaHl6
X-Authority-Analysis: v=2.4 cv=CL4amxrD c=1 sm=1 tr=0 ts=69f23988 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=S70kITjG2mzSNXz8RO8A:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-29_01,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 adultscore=0 suspectscore=0
 lowpriorityscore=0 impostorscore=0 spamscore=0 clxscore=1015 malwarescore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604290171
X-Rspamd-Queue-Id: 17331497EB3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-105259-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[viken.dadhaniya@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

The QSPI controller has two interconnect paths:
1. qspi-config: CPU to QSPI controller for register access
2. qspi-memory: QSPI controller to memory for DMA operations

Currently, the driver only manages the qspi-config path. Add support for
the qspi-memory path to ensure proper bandwidth allocation for QSPI data
transfers to/from memory. Enable and disable both paths during runtime PM
transitions.

Signed-off-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
---
 drivers/spi/spi-qcom-qspi.c | 44 ++++++++++++++++++++++++++++++++++++++------
 1 file changed, 38 insertions(+), 6 deletions(-)

diff --git a/drivers/spi/spi-qcom-qspi.c b/drivers/spi/spi-qcom-qspi.c
index edfbf0b5d1fa..caf55a6f70b3 100644
--- a/drivers/spi/spi-qcom-qspi.c
+++ b/drivers/spi/spi-qcom-qspi.c
@@ -174,6 +174,7 @@ struct qcom_qspi {
 	void *virt_cmd_desc[QSPI_MAX_SG];
 	unsigned int n_cmd_desc;
 	struct icc_path *icc_path_cpu_to_qspi;
+	struct icc_path *icc_path_mem;
 	unsigned long last_speed;
 	/* Lock to protect data accessed by IRQs */
 	spinlock_t lock;
@@ -272,7 +273,7 @@ static void qcom_qspi_handle_err(struct spi_controller *host,
 static int qcom_qspi_set_speed(struct qcom_qspi *ctrl, unsigned long speed_hz)
 {
 	int ret;
-	unsigned int avg_bw_cpu;
+	unsigned int avg_bw_cpu, avg_bw_mem;
 
 	if (speed_hz == ctrl->last_speed)
 		return 0;
@@ -285,7 +286,7 @@ static int qcom_qspi_set_speed(struct qcom_qspi *ctrl, unsigned long speed_hz)
 	}
 
 	/*
-	 * Set BW quota for CPU.
+	 * Set BW quota for CPU and memory paths.
 	 * We don't have explicit peak requirement so keep it equal to avg_bw.
 	 */
 	avg_bw_cpu = Bps_to_icc(speed_hz);
@@ -296,6 +297,13 @@ static int qcom_qspi_set_speed(struct qcom_qspi *ctrl, unsigned long speed_hz)
 		return ret;
 	}
 
+	avg_bw_mem = Bps_to_icc(speed_hz);
+	ret = icc_set_bw(ctrl->icc_path_mem, avg_bw_mem, avg_bw_mem);
+	if (ret) {
+		dev_err(ctrl->dev, "ICC BW voting failed for memory: %d\n", ret);
+		return ret;
+	}
+
 	ctrl->last_speed = speed_hz;
 
 	return 0;
@@ -729,6 +737,14 @@ static int qcom_qspi_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, PTR_ERR(ctrl->icc_path_cpu_to_qspi),
 				     "Failed to get cpu path\n");
 
+	ctrl->icc_path_mem = devm_of_icc_get(dev, "qspi-memory");
+	if (IS_ERR(ctrl->icc_path_mem)) {
+		if (PTR_ERR(ctrl->icc_path_mem) != -ENODATA)
+			return dev_err_probe(dev, PTR_ERR(ctrl->icc_path_mem),
+					     "Failed to get memory path\n");
+		ctrl->icc_path_mem = NULL;
+	}
+
 	/* Set BW vote for register access */
 	ret = icc_set_bw(ctrl->icc_path_cpu_to_qspi, Bps_to_icc(1000),
 				Bps_to_icc(1000));
@@ -827,9 +843,15 @@ static int __maybe_unused qcom_qspi_runtime_suspend(struct device *dev)
 		goto err_enable_clk;
 	}
 
+	ret = icc_disable(ctrl->icc_path_mem);
+	if (ret) {
+		dev_err_ratelimited(ctrl->dev, "ICC disable failed for memory: %d\n", ret);
+		goto err_enable_icc_cpu;
+	}
+
 	ret = pinctrl_pm_select_sleep_state(dev);
 	if (ret)
-		goto err_enable_icc;
+		goto err_enable_icc_mem;
 
 	/* Drop the performance state vote */
 	ret = dev_pm_opp_set_rate(dev, 0);
@@ -840,7 +862,9 @@ static int __maybe_unused qcom_qspi_runtime_suspend(struct device *dev)
 
 err_select_default_state:
 	pinctrl_pm_select_default_state(dev);
-err_enable_icc:
+err_enable_icc_mem:
+	icc_enable(ctrl->icc_path_mem);
+err_enable_icc_cpu:
 	icc_enable(ctrl->icc_path_cpu_to_qspi);
 err_enable_clk:
 	if (clk_bulk_prepare_enable(QSPI_NUM_CLKS, ctrl->clks))
@@ -869,13 +893,21 @@ static int __maybe_unused qcom_qspi_runtime_resume(struct device *dev)
 		goto err_select_sleep_state;
 	}
 
+	ret = icc_enable(ctrl->icc_path_mem);
+	if (ret) {
+		dev_err_ratelimited(ctrl->dev, "ICC enable failed for memory: %d\n", ret);
+		goto err_disable_icc_cpu;
+	}
+
 	ret = clk_bulk_prepare_enable(QSPI_NUM_CLKS, ctrl->clks);
 	if (ret)
-		goto err_disable_icc;
+		goto err_disable_icc_mem;
 
 	return 0;
 
-err_disable_icc:
+err_disable_icc_mem:
+	icc_disable(ctrl->icc_path_mem);
+err_disable_icc_cpu:
 	icc_disable(ctrl->icc_path_cpu_to_qspi);
 err_select_sleep_state:
 	pinctrl_pm_select_sleep_state(dev);

-- 
2.34.1


