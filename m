Return-Path: <linux-arm-msm+bounces-103185-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wKNdNDd23ml3EgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103185-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 19:15:35 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 17FB83FCEF1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 19:15:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3392C30CFBBF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 17:08:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A82F22F12CE;
	Tue, 14 Apr 2026 17:08:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="obdR7SFb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hrvpLG+t"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07E1627A907
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 17:08:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776186537; cv=none; b=PxoqZvjijOg2Ou4S/cwT8wK4WG7pdvjfgA/6KyaoxW0C/k9pl68MWwgIciG1y5ew7aJJIC0Rq/FFO0/JP5AssF9Mh6XS+m4PMRYsNgdn5ocLaVG/h+vGh56SsJL7SKIbyNYqYOanTLUdDTalEcyYxIyfrOwewbIezuaBYECbMFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776186537; c=relaxed/simple;
	bh=giVYQbZ3mh3S8oI+9IBZ3fGJ5muN4sGFK18wlU97hJQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HJUcxJhMES0f29J9saX3Yha1UTu1YpdtXTaDpXpJKpxMh3aFBdvNLOgVVjQdg0WnCzn5bQdSR8dTImZbPZjUCnr/cLyzxYrbfwtj+4FSoC32RRNGyJy7sJphDFKkruKl7IPqCy1395r3YFwr23zH8pztGMLeC5ne9EoK5b79+zk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=obdR7SFb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hrvpLG+t; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63EGBprM1779160
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 17:08:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	as9+0KYxE7ralBTHQ6IymqjzxFcbYhhm7JSJz7ngJ00=; b=obdR7SFbc3pgQqsn
	zpiT6LsAYY3yaiCcPz4lnvuaa60IK4LGYq8JWvOjyeOh1bpd8hjEv0NGw4TQTICI
	KKyVnfZ+osqpYysVweIZAnAoRaGoWsJxlL0kkOeL7uPtd9SelGAORw+xjsolyp40
	P5NoaS8dYHaLjHgGxjvLrrspk2KYC7rvDGGSw85n2Q+wk0H5erykMjSJp1fbGRxw
	PqE62AD99D8JuRL9cprn9zB+Tz73V05OFVUyI6kfJXSNbGruo0mhWU4vPCK5LN7n
	Cm7CSKhZEtAZD+OQs7rZKUE3N1giYrcwk/fGyPHMEodmZ2sDrGSgrPxajs3EFOPh
	9LlX9A==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dhrw007nh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 17:08:55 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b2ecc96a9aso28937745ad.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 10:08:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776186535; x=1776791335; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=as9+0KYxE7ralBTHQ6IymqjzxFcbYhhm7JSJz7ngJ00=;
        b=hrvpLG+tROQ4Ph5Ih88q9eFPqcO1Me1QvRyChWAQq6loIR/FiI32UBobnXZJZD1RmA
         lNlI5j8Yj3a0s4aCUWSZFpCetmLYf+7ieNblp+9lX12glG04KRM6zRZyByFIh3MHuPT3
         uVflvLwnPxgIQA7VVFaRBkJHyRxTpHAwTe9O0xjp3vG+SC8XKreVcFK22y/N8cNoN5oM
         AdgmYYuSfFHbuRZTA8JszkC6iouEkVnOX+3HWk8PMYIvKj0ydK21G2Hny4BYboakvUZg
         faHpKx5XKIkFsyzcdA71fKyEUIIXGVHaImwWq2eyMIPsGftLU0Nu+kyRQW9WsGUNUgYt
         Hbww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776186535; x=1776791335;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=as9+0KYxE7ralBTHQ6IymqjzxFcbYhhm7JSJz7ngJ00=;
        b=aUaE8pxpr5RmiO/Cfj8FN67VcDpkHK4fqFgrkZOC2bGxemrOTLktgTyt3FgRCI7K2a
         s2qDawSEIpawdd3IdwIRsgZdcGCS3AZ67HqCMMbiE4N1fNHF3iQl2dgDCCx0A4Cgi3ok
         se4UqAXnVvidf7hJ+ElS6NWTOC/GXmtL2op2bsK7MysWrhgNf500kYBivQbmxG2Ad9L+
         sRI9XhAMC9oGORo5V+7UJaOVkx6i0MLPzSuL4FvmqyjUOtkoTahKJYDITeGQRq2F7Kam
         kQusWBfxl1fJ6zhu2sBI2k8/18kny4ZwDyQ8bsx080qQXFPDmuw2IaK+I0TVmtlr/FPy
         3Pjw==
X-Gm-Message-State: AOJu0YypExvC+E2b3K5GzyT/2P8cu4jLb12EPjSgJwlT9Dqr2bDLk8zv
	aRfP9pE8XJVWaAwImnktDwlCKOjX45iwGhsIL/7qyPmDiYJapTs0rHSE1PLPxfw3jhP1p+TGH+O
	/WL+N3cxm0+cmivXaKNWSXpxW91rKGE0cd1mHxCA+XMyNQ5NMjfsaryuyIEUzaTIGM3NF
X-Gm-Gg: AeBDiesveEWxwInhv4mjMagIBxxyMmYyVSFxS898w+RpLph2iBqxo4Kl4+jvNNXlkEq
	Q06eiYC3zlfN6rlfgcQhwCJHPboejsoJmi+ELFfQYg4QDz7LkqlhHTIVRBQB1rQgmhjc8aaA27W
	j+N5jBDxoUcPcOMiAJ/T5FpEb6QGoeoQiy+il0auqa9BsdURxtNpTCDVzrt6xkzeQQ1Ix6HHbwQ
	10iSZQ/jDslPY9Czpo9lZ+ipAYnepqproJEFkuDxMBvsn4kUpF2mwpbQ52+jvuLAuaGyr67LNvJ
	1MXnXQET16FeMmX5kqEiPtmSGP2wcqPsK+HDM7rM54Qy9kNu6339kKq/le22I82HY+xxppe5wUz
	uEJUZXcE9EeOYkMO2dfsiXWOUm3mK43xswwkF1fjcmHhcaEGBAVH58OCqLcrG44qlDuff
X-Received: by 2002:a17:903:fa5:b0:2b2:5857:6011 with SMTP id d9443c01a7336-2b2d59e0f95mr192514985ad.19.1776186529788;
        Tue, 14 Apr 2026 10:08:49 -0700 (PDT)
X-Received: by 2002:a17:903:fa5:b0:2b2:5857:6011 with SMTP id d9443c01a7336-2b2d59e0f95mr192514525ad.19.1776186529205;
        Tue, 14 Apr 2026 10:08:49 -0700 (PDT)
Received: from hu-vdadhani-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b45d1ab540sm97535225ad.40.2026.04.14.10.08.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2026 10:08:48 -0700 (PDT)
From: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Date: Tue, 14 Apr 2026 22:38:21 +0530
Subject: [PATCH v2 3/7] spi: qcom-qspi: Add interconnect support for memory
 path
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260414-spi-nor-v2-3-bcca40de4b5f@oss.qualcomm.com>
References: <20260414-spi-nor-v2-0-bcca40de4b5f@oss.qualcomm.com>
In-Reply-To: <20260414-spi-nor-v2-0-bcca40de4b5f@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776186510; l=4136;
 i=viken.dadhaniya@oss.qualcomm.com; s=20260324; h=from:subject:message-id;
 bh=giVYQbZ3mh3S8oI+9IBZ3fGJ5muN4sGFK18wlU97hJQ=;
 b=CtqfqCZbGAhjUNnMk7Dy6KV1IIkNZkWmoudLduXchb1c27DT8VjF+TWBXYWuWyz/MzYQRx9D5
 7a/2+mujXywDof0n8isbDlhagmRr2dRRYHU+5td7jul7GgVSJgbbQ8p
X-Developer-Key: i=viken.dadhaniya@oss.qualcomm.com; a=ed25519;
 pk=C39f+LOIGhh/02LQpT46TsUSXRvBn9qXC8Xb26KJ44Y=
X-Proofpoint-GUID: L7ZbA2uJzOXCzlD6tSBzvcOJm-hfzXFi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDE2MCBTYWx0ZWRfX9PjFxtteZOwD
 XK6MooVp+Evaji50YURqbGP9JguFaWCX6m6SADDXbMwyFWl8mLcP0bz5z9rI/0umyC1Qiw7rU2G
 oTc0LEqHXMODp5zYiNPdESqSo7UTCy4+bau4lMSN+b4fSQ7tQ1cNwvki71OqzmlyZITcJATJXnN
 Fw7IgejenKmPj8jJnPjlziQftYoFvT9w5TDeiK+XkOTcvPygbTS5QawrJ7rvCN86r4RsSbnqH6u
 OCRsKvksSLqWfQYg+gFobSvaH3biCaUC4Nz8yuZrURNwj6R+ZMelF3yIdTg9OqlDkJx8pBVd0Il
 ahFM6eJcXQ1xg28q8Klb+d64lVlHXS9avs2mE6D0J6KUNeHyvO0Bo5x5Q/wgNXZe/g3BEJ2GZTO
 jsKL/HXC4+hBtsGvZ8SxCUECV669POUCagueoRlWxERsa7wBwVYHL9O3b8XaVjGQecbqBhQdbTP
 hz9FGuH2ePtoDVOqLyQ==
X-Proofpoint-ORIG-GUID: L7ZbA2uJzOXCzlD6tSBzvcOJm-hfzXFi
X-Authority-Analysis: v=2.4 cv=YMGvDxGx c=1 sm=1 tr=0 ts=69de74a7 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=S70kITjG2mzSNXz8RO8A:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_03,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 phishscore=0 bulkscore=0 spamscore=0
 suspectscore=0 clxscore=1015 malwarescore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604140160
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103185-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[viken.dadhaniya@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 17FB83FCEF1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The QSPI controller has two interconnect paths:
1. qspi-config: CPU to QSPI controller for register access
2. qspi-memory: QSPI controller to memory for DMA operations

Currently, the driver only manages the qspi-config path. Add support for
the qspi-memory path to ensure proper bandwidth allocation for QSPI data
transfers to/from memory. Enable and disable both paths during runtime PM
transitions.

Signed-off-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
---
 drivers/spi/spi-qcom-qspi.c | 41 +++++++++++++++++++++++++++++++++++------
 1 file changed, 35 insertions(+), 6 deletions(-)

diff --git a/drivers/spi/spi-qcom-qspi.c b/drivers/spi/spi-qcom-qspi.c
index 38af859713a7..c89d50d67dd2 100644
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
@@ -729,6 +737,11 @@ static int qcom_qspi_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, PTR_ERR(ctrl->icc_path_cpu_to_qspi),
 				     "Failed to get cpu path\n");
 
+	ctrl->icc_path_mem = devm_of_icc_get(dev, "qspi-memory");
+	if (IS_ERR(ctrl->icc_path_mem))
+		return dev_err_probe(dev, PTR_ERR(ctrl->icc_path_mem),
+				     "Failed to get memory path\n");
+
 	/* Set BW vote for register access */
 	ret = icc_set_bw(ctrl->icc_path_cpu_to_qspi, Bps_to_icc(1000),
 				Bps_to_icc(1000));
@@ -832,13 +845,21 @@ static int __maybe_unused qcom_qspi_runtime_suspend(struct device *dev)
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
 
 	return 0;
 
-err_enable_icc:
+err_enable_icc_mem:
+	icc_enable(ctrl->icc_path_mem);
+err_enable_icc_cpu:
 	icc_enable(ctrl->icc_path_cpu_to_qspi);
 err_enable_clk:
 	clk_bulk_prepare_enable(QSPI_NUM_CLKS, ctrl->clks);
@@ -863,9 +884,15 @@ static int __maybe_unused qcom_qspi_runtime_resume(struct device *dev)
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
 
 	ret = dev_pm_opp_set_rate(dev, ctrl->last_speed * 4);
 	if (ret)
@@ -875,7 +902,9 @@ static int __maybe_unused qcom_qspi_runtime_resume(struct device *dev)
 
 err_disable_clk:
 	clk_bulk_disable_unprepare(QSPI_NUM_CLKS, ctrl->clks);
-err_disable_icc:
+err_disable_icc_mem:
+	icc_disable(ctrl->icc_path_mem);
+err_disable_icc_cpu:
 	icc_disable(ctrl->icc_path_cpu_to_qspi);
 err_select_sleep_state:
 	pinctrl_pm_select_sleep_state(dev);

-- 
2.34.1


