Return-Path: <linux-arm-msm+bounces-74765-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EC80B9CA4E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 01:38:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7C444322123
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Sep 2025 23:38:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFDD62D1319;
	Wed, 24 Sep 2025 23:37:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="laFzRrjN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F5662C324E
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 23:37:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758757059; cv=none; b=S6k1wVRRk8JhD7Ye1D0jD7lZWab+0jRctEfPWMm3o0PC1V16++m/kDf3HdGHhLzkv0o63HgyiDz6q8Y4SyGmrx79HjVqGMruiKaBsQgQERpQzwpRhBxcXs+c6hWHYGvweoWVOTNdIHbi9JDFTqU9E1v9QKUKk2WeCUrkVSGFD+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758757059; c=relaxed/simple;
	bh=s6ENUbkIzr9ZrP+3bkvo8G2iMnrCgLuJzJ4D7Kp7viM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AS38Vw4BzdkqijsOqPZyHQ6Jlc/+T3LDrSRyfI7/sIA3I2eFNiU8C00Sa51rWVCi/eA3rkphNgk0PBEc4WlTNpEbecxka7vdpITkdnMBtWhEIfitgUIg3OGzX29fgmGTG9ZpdRBFdo8tQDIDuQkkBqzjQmabT/huVcQytr6NzLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=laFzRrjN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58OCpFO3020144
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 23:37:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/hxIXVGs6LM0VW0ZEZkI8RNadGokWcO+uGIcfsPqXsE=; b=laFzRrjNzQcVBBth
	3Z3yKKC/z7XG02ap488AeOOlIVRZnMU7cWw5AiuLVjnrw0akIKlqq4zCFVZia0rf
	ogKgykvD1wTQCzDNMUyNfVPnNetnPmfqtoOrGDV2hQ1FmgJak+uuxn8xCJUzBfHj
	Wb8fbuNImMcOD1o5fqCQoz3bMHDM7DuztVmOEiWl4nc5K9/5xKj72NAauTNDwQwc
	SibNW4mHSdFH0WBXpPUjpOYcllDEuXVf64RKU6nmtpAOVk5Yw4ZQ48+ebudQgYyA
	nlETB0Z0A23C+8IAUEDhhrgQzZdkxSQPtjiTJzKMYtb9dLHrKRbtBEPlOBet6a86
	dKpdfw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49bjpdy97h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 23:37:36 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-33428befbbaso390626a91.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 16:37:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758757056; x=1759361856;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/hxIXVGs6LM0VW0ZEZkI8RNadGokWcO+uGIcfsPqXsE=;
        b=Z+Kb3Erg6tTZh2mYv2BjAcFEpcqHPXfLIUzURnZZ30fXwkvndivPtfnmwNtiSoR2TW
         QuacFOozGtjwbpubD3HiTnmLGHoWkzXwswlOwR03swBUMhQ4E3Qul9tdJTRqlmEZf+1q
         BRDadkY2sQZckibwfBoNesl9W2MVJNDYbf5S7+1XXHI5QIs4mc/YDbktGpKzzvxSdfHP
         a2hKoD6Paejwz54o7O3BUYt87uFFM4R6Ftz+yZtWz9eQoo/YWXbC6K4IhSuzNw60jXZn
         ngqnvBX1qGVPP4bv8APrhVPU4IfXkTqBOCUBp3tJeOyWugcs1CPZHXCm8a9jeM2rB1LL
         EHiQ==
X-Gm-Message-State: AOJu0YxkeVnOQwKfPAXIfTNk9Suozgr9CqXOhFHoRVe/FtrzE9J1IcyZ
	j/pBsbHpuU5ATzLyLkKWp84X9gCsQN7n/AsCfc0NNbbXtffVEooFoI08wKpqcbxlJFIOf1rCzgT
	b7sAxKJPtcEmI8/zmNSbS5t0oeGDj+ZbwVMMsY08e0jc6wIUi6EsfMyx4rJmYxpUs4WsF
X-Gm-Gg: ASbGncutuSfwhCQ5Rx0MucufXskt52KKq/xVx5Q9ulIYSo58yzeKkKjvl2dH0P0c2Mt
	BxYCiKrCeJtDBhzLXNLDm5WIWvO3725no53g8JIrOBDoTTRpzZRhQOATqaJnJYrVw+g626CknhT
	/lXySRK170g31Nf3YX7SOaFcgyzWkJJKz60wkjbmDJlRgxrMWEQI+IowSDC6Y+ZD6YBxjLX6nrh
	ASO3gRqCxrNh85Yr+6EBBMi5kz7Nd1wWehWP5auOJPWuzuXJg/WLm7HR+gKh8n0htypxloWsgB/
	nnYh6vBqCjn4JKx4n+Kqfw8Konvi2DBl1ibc+U6ifJD5rdrj69NUa8kV1XNdclB613sJzexW5Oy
	LZwEJ+ChPo8khx6A=
X-Received: by 2002:a17:90b:548e:b0:32e:3837:284e with SMTP id 98e67ed59e1d1-3342a260f6amr1582187a91.10.1758757055742;
        Wed, 24 Sep 2025 16:37:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFrv9xNY68rKU5QRmHd2W39HdQETuTK/2DvSoLzjr+eZ9C+WtecfXCqC3jKD+McZ/rRuAnJpw==
X-Received: by 2002:a17:90b:548e:b0:32e:3837:284e with SMTP id 98e67ed59e1d1-3342a260f6amr1582137a91.10.1758757055196;
        Wed, 24 Sep 2025 16:37:35 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33471d73550sm227187a91.3.2025.09.24.16.37.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 16:37:34 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Wed, 24 Sep 2025 16:37:26 -0700
Subject: [PATCH 5/6] remoteproc: qcom: pas: Add late attach support for
 subsystems
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250924-knp-remoteproc-v1-5-611bf7be8329@oss.qualcomm.com>
References: <20250924-knp-remoteproc-v1-0-611bf7be8329@oss.qualcomm.com>
In-Reply-To: <20250924-knp-remoteproc-v1-0-611bf7be8329@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Gokul krishna Krishnakumar <Gokul.krishnakumar@oss.qualcomm>
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758757046; l=11080;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=WGgbMhXTA/LJAW/sZuOjDZRXsaOqF+XvYSvxn/GDEOs=;
 b=6T/bdgIiQkytA9ZJ8MrLtVs6KYXHEB2PKNQyI19cMCb6kBK96Elg9upwjjmSu9bJSYpE82Wca
 brcMmma7IcRDxmY64atoTcyPX66jPiXekx1OtISaB6S/8jENBZunKWZ
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-ORIG-GUID: i9JCXI8QgUNHowKPfFzT4RZ-sPgAW_w7
X-Authority-Analysis: v=2.4 cv=Pc//hjhd c=1 sm=1 tr=0 ts=68d480c0 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=pkFH-dftJZDyodMaESMA:9
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: i9JCXI8QgUNHowKPfFzT4RZ-sPgAW_w7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIzMDAyMCBTYWx0ZWRfX0ebKpvasULzo
 CDXkf+f8YNa9h87jFUL3jiu3Cd/9gEoTbLieoETmT7D+rm3az6ZGWOesKxFvUpvW17VaoE3q9tV
 8ArVjBoO7QDjdlwhhRz/yMMNEbF9vX3z3I2/6SrKG3O9/sYmGBiaCyZuny+2iWivqH4Azh53vuG
 5L5q+Uy4e9gVOqHRylDiAsla8bx76MmCMfioT0dBGCfSug482LcC4LHlLKVLkhvEB9ZQEs5env7
 daM+4Z4Bb9Bc4Xrf+OzZulwcVwNBV+alTmeP9VA8uSSECCw4BmvSbzUKxZgTZDvkUJxVTFRHKQV
 +TPxPZG2qDUyhhy8bpWVA0KwqOt9rzKMpVfYT/y9LUs4FgtBekVVcJifOsmyPtUm5T6wGwkrZQL
 t1u/AIdf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 malwarescore=0 impostorscore=0
 spamscore=0 suspectscore=0 clxscore=1015 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509230020

From: Gokul krishna Krishnakumar <Gokul.krishnakumar@oss.qualcomm>

Subsystems can be brought out of reset by entities such as
bootloaders. Before attaching such subsystems, it is important to
check the state of the subsystem. This patch adds support to attach
to a subsystem by ensuring that the subsystem is in a sane state by
reading SMP2P bits and pinging the subsystem.

Signed-off-by: Gokul krishna Krishnakumar <Gokul.krishnakumar@oss.qualcomm>
Co-developed-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
 drivers/remoteproc/qcom_q6v5.c      | 89 ++++++++++++++++++++++++++++++++++++-
 drivers/remoteproc/qcom_q6v5.h      | 14 +++++-
 drivers/remoteproc/qcom_q6v5_adsp.c |  2 +-
 drivers/remoteproc/qcom_q6v5_mss.c  |  2 +-
 drivers/remoteproc/qcom_q6v5_pas.c  | 61 ++++++++++++++++++++++++-
 5 files changed, 163 insertions(+), 5 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5.c b/drivers/remoteproc/qcom_q6v5.c
index 4ee5e67a9f03..cba05e1d6d52 100644
--- a/drivers/remoteproc/qcom_q6v5.c
+++ b/drivers/remoteproc/qcom_q6v5.c
@@ -94,6 +94,9 @@ static irqreturn_t q6v5_wdog_interrupt(int irq, void *data)
 	size_t len;
 	char *msg;
 
+	if (q6v5->early_boot)
+		complete(&q6v5->subsys_booted);
+
 	/* Sometimes the stop triggers a watchdog rather than a stop-ack */
 	if (!q6v5->running) {
 		complete(&q6v5->stop_done);
@@ -118,6 +121,9 @@ static irqreturn_t q6v5_fatal_interrupt(int irq, void *data)
 	size_t len;
 	char *msg;
 
+	if (q6v5->early_boot)
+		complete(&q6v5->subsys_booted);
+
 	if (!q6v5->running)
 		return IRQ_HANDLED;
 
@@ -139,6 +145,9 @@ static irqreturn_t q6v5_ready_interrupt(int irq, void *data)
 
 	complete(&q6v5->start_done);
 
+	if (q6v5->early_boot)
+		complete(&q6v5->subsys_booted);
+
 	return IRQ_HANDLED;
 }
 
@@ -170,6 +179,9 @@ static irqreturn_t q6v5_handover_interrupt(int irq, void *data)
 	if (q6v5->handover)
 		q6v5->handover(q6v5);
 
+	if (q6v5->early_boot)
+		complete(&q6v5->subsys_booted);
+
 	icc_set_bw(q6v5->path, 0, 0);
 
 	q6v5->handover_issued = true;
@@ -232,6 +244,77 @@ unsigned long qcom_q6v5_panic(struct qcom_q6v5 *q6v5)
 }
 EXPORT_SYMBOL_GPL(qcom_q6v5_panic);
 
+static irqreturn_t q6v5_pong_interrupt(int irq, void *data)
+{
+	struct qcom_q6v5 *q6v5 = data;
+
+	complete(&q6v5->ping_done);
+
+	return IRQ_HANDLED;
+}
+
+int qcom_q6v5_ping_subsystem(struct qcom_q6v5 *q6v5)
+{
+	int ret;
+	int ping_failed = 0;
+
+	reinit_completion(&q6v5->ping_done);
+
+	/* Set master kernel Ping bit */
+	ret = qcom_smem_state_update_bits(q6v5->ping_state,
+					  BIT(q6v5->ping_bit), BIT(q6v5->ping_bit));
+	if (ret) {
+		dev_err(q6v5->dev, "Failed to update ping bits\n");
+		return ret;
+	}
+
+	ret = wait_for_completion_timeout(&q6v5->ping_done, msecs_to_jiffies(PING_TIMEOUT));
+	if (!ret) {
+		ping_failed = -ETIMEDOUT;
+		dev_err(q6v5->dev, "Failed to get back pong\n");
+	}
+
+	/* Clear ping bit master kernel */
+	ret = qcom_smem_state_update_bits(q6v5->ping_state, BIT(q6v5->ping_bit), 0);
+	if (ret) {
+		pr_err("Failed to clear master kernel bits\n");
+		return ret;
+	}
+
+	if (ping_failed)
+		return ping_failed;
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(qcom_q6v5_ping_subsystem);
+
+int qcom_q6v5_ping_subsystem_init(struct qcom_q6v5 *q6v5, struct platform_device *pdev)
+{
+	int ret = -ENODEV;
+
+	q6v5->ping_state = devm_qcom_smem_state_get(&pdev->dev, "ping", &q6v5->ping_bit);
+	if (IS_ERR(q6v5->ping_state)) {
+		dev_err(&pdev->dev, "failed to acquire smem state %ld\n",
+			PTR_ERR(q6v5->ping_state));
+		return ret;
+	}
+
+	q6v5->pong_irq = platform_get_irq_byname(pdev, "pong");
+	if (q6v5->pong_irq < 0)
+		return q6v5->pong_irq;
+
+	ret = devm_request_threaded_irq(&pdev->dev, q6v5->pong_irq, NULL,
+					q6v5_pong_interrupt, IRQF_TRIGGER_RISING | IRQF_ONESHOT,
+					"q6v5 pong", q6v5);
+	if (ret)
+		dev_err(&pdev->dev, "failed to acquire pong IRQ\n");
+
+	init_completion(&q6v5->ping_done);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(qcom_q6v5_ping_subsystem_init);
+
 /**
  * qcom_q6v5_init() - initializer of the q6v5 common struct
  * @q6v5:	handle to be initialized
@@ -245,7 +328,7 @@ EXPORT_SYMBOL_GPL(qcom_q6v5_panic);
  */
 int qcom_q6v5_init(struct qcom_q6v5 *q6v5, struct platform_device *pdev,
 		   struct rproc *rproc, int crash_reason, const char *load_state,
-		   void (*handover)(struct qcom_q6v5 *q6v5))
+		   bool early_boot, void (*handover)(struct qcom_q6v5 *q6v5))
 {
 	int ret;
 
@@ -253,10 +336,14 @@ int qcom_q6v5_init(struct qcom_q6v5 *q6v5, struct platform_device *pdev,
 	q6v5->dev = &pdev->dev;
 	q6v5->crash_reason = crash_reason;
 	q6v5->handover = handover;
+	q6v5->early_boot = early_boot;
 
 	init_completion(&q6v5->start_done);
 	init_completion(&q6v5->stop_done);
 
+	if (early_boot)
+		init_completion(&q6v5->subsys_booted);
+
 	q6v5->wdog_irq = platform_get_irq_byname(pdev, "wdog");
 	if (q6v5->wdog_irq < 0)
 		return q6v5->wdog_irq;
diff --git a/drivers/remoteproc/qcom_q6v5.h b/drivers/remoteproc/qcom_q6v5.h
index 5a859c41896e..8a227bf70d7e 100644
--- a/drivers/remoteproc/qcom_q6v5.h
+++ b/drivers/remoteproc/qcom_q6v5.h
@@ -12,27 +12,35 @@ struct rproc;
 struct qcom_smem_state;
 struct qcom_sysmon;
 
+#define PING_TIMEOUT 500 /* in milliseconds */
+#define PING_TEST_WAIT 500 /* in milliseconds */
+
 struct qcom_q6v5 {
 	struct device *dev;
 	struct rproc *rproc;
 
 	struct qcom_smem_state *state;
+	struct qcom_smem_state *ping_state;
 	struct qmp *qmp;
 
 	struct icc_path *path;
 
 	unsigned stop_bit;
+	unsigned int ping_bit;
 
 	int wdog_irq;
 	int fatal_irq;
 	int ready_irq;
 	int handover_irq;
 	int stop_irq;
+	int pong_irq;
 
 	bool handover_issued;
 
 	struct completion start_done;
 	struct completion stop_done;
+	struct completion subsys_booted;
+	struct completion ping_done;
 
 	int crash_reason;
 
@@ -40,11 +48,13 @@ struct qcom_q6v5 {
 
 	const char *load_state;
 	void (*handover)(struct qcom_q6v5 *q6v5);
+
+	bool early_boot;
 };
 
 int qcom_q6v5_init(struct qcom_q6v5 *q6v5, struct platform_device *pdev,
 		   struct rproc *rproc, int crash_reason, const char *load_state,
-		   void (*handover)(struct qcom_q6v5 *q6v5));
+		   bool early_boot, void (*handover)(struct qcom_q6v5 *q6v5));
 void qcom_q6v5_deinit(struct qcom_q6v5 *q6v5);
 
 int qcom_q6v5_prepare(struct qcom_q6v5 *q6v5);
@@ -52,5 +62,7 @@ int qcom_q6v5_unprepare(struct qcom_q6v5 *q6v5);
 int qcom_q6v5_request_stop(struct qcom_q6v5 *q6v5, struct qcom_sysmon *sysmon);
 int qcom_q6v5_wait_for_start(struct qcom_q6v5 *q6v5, int timeout);
 unsigned long qcom_q6v5_panic(struct qcom_q6v5 *q6v5);
+int qcom_q6v5_ping_subsystem(struct qcom_q6v5 *q6v5);
+int qcom_q6v5_ping_subsystem_init(struct qcom_q6v5 *q6v5, struct platform_device *pdev);
 
 #endif
diff --git a/drivers/remoteproc/qcom_q6v5_adsp.c b/drivers/remoteproc/qcom_q6v5_adsp.c
index e98b7e03162c..1576b435b921 100644
--- a/drivers/remoteproc/qcom_q6v5_adsp.c
+++ b/drivers/remoteproc/qcom_q6v5_adsp.c
@@ -717,7 +717,7 @@ static int adsp_probe(struct platform_device *pdev)
 		goto disable_pm;
 
 	ret = qcom_q6v5_init(&adsp->q6v5, pdev, rproc, desc->crash_reason_smem,
-			     desc->load_state, qcom_adsp_pil_handover);
+			     desc->load_state, false, qcom_adsp_pil_handover);
 	if (ret)
 		goto disable_pm;
 
diff --git a/drivers/remoteproc/qcom_q6v5_mss.c b/drivers/remoteproc/qcom_q6v5_mss.c
index 0c0199fb0e68..04e577541c8f 100644
--- a/drivers/remoteproc/qcom_q6v5_mss.c
+++ b/drivers/remoteproc/qcom_q6v5_mss.c
@@ -2156,7 +2156,7 @@ static int q6v5_probe(struct platform_device *pdev)
 	qproc->has_mba_logs = desc->has_mba_logs;
 
 	ret = qcom_q6v5_init(&qproc->q6v5, pdev, rproc, MPSS_CRASH_REASON_SMEM, "modem",
-			     qcom_msa_handover);
+			     false, qcom_msa_handover);
 	if (ret)
 		goto detach_proxy_pds;
 
diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index 55a7da801183..99163e48a76a 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -35,6 +35,8 @@
 
 #define MAX_ASSIGN_COUNT 3
 
+#define EARLY_BOOT_RETRY_INTERVAL_MS 5000
+
 struct qcom_pas_data {
 	int crash_reason_smem;
 	const char *firmware_name;
@@ -58,6 +60,7 @@ struct qcom_pas_data {
 	int region_assign_count;
 	bool region_assign_shared;
 	int region_assign_vmid;
+	bool early_boot;
 };
 
 struct qcom_pas {
@@ -430,6 +433,51 @@ static unsigned long qcom_pas_panic(struct rproc *rproc)
 	return qcom_q6v5_panic(&pas->q6v5);
 }
 
+static int qcom_pas_attach(struct rproc *rproc)
+{
+	int ret;
+	struct qcom_pas *adsp = rproc->priv;
+	bool ready_state;
+	bool crash_state;
+
+	if (!adsp->q6v5.early_boot)
+		return -EINVAL;
+
+	ret = irq_get_irqchip_state(adsp->q6v5.fatal_irq,
+				    IRQCHIP_STATE_LINE_LEVEL, &crash_state);
+
+	if (crash_state) {
+		dev_err(adsp->dev, "Sub system has crashed before driver probe\n");
+		adsp->rproc->state = RPROC_CRASHED;
+		return -EINVAL;
+	}
+
+	ret = irq_get_irqchip_state(adsp->q6v5.ready_irq,
+				    IRQCHIP_STATE_LINE_LEVEL, &ready_state);
+
+	if (ready_state) {
+		dev_info(adsp->dev, "Sub system has boot-up before driver probe\n");
+		adsp->rproc->state = RPROC_DETACHED;
+	} else {
+		ret = wait_for_completion_timeout(&adsp->q6v5.subsys_booted,
+						  msecs_to_jiffies(EARLY_BOOT_RETRY_INTERVAL_MS));
+		if (!ret) {
+			dev_err(adsp->dev, "Timeout on waiting for subsystem interrupt\n");
+			return -ETIMEDOUT;
+		}
+	}
+
+	ret = qcom_q6v5_ping_subsystem(&adsp->q6v5);
+	if (ret) {
+		dev_err(adsp->dev, "Failed to ping subsystem, assuming device crashed\n");
+		rproc->state = RPROC_CRASHED;
+		return ret;
+	}
+
+	adsp->q6v5.running = true;
+	return ret;
+}
+
 static const struct rproc_ops qcom_pas_ops = {
 	.unprepare = qcom_pas_unprepare,
 	.start = qcom_pas_start,
@@ -438,6 +486,7 @@ static const struct rproc_ops qcom_pas_ops = {
 	.parse_fw = qcom_register_dump_segments,
 	.load = qcom_pas_load,
 	.panic = qcom_pas_panic,
+	.attach = qcom_pas_attach,
 };
 
 static const struct rproc_ops qcom_pas_minidump_ops = {
@@ -760,7 +809,7 @@ static int qcom_pas_probe(struct platform_device *pdev)
 	pas->proxy_pd_count = ret;
 
 	ret = qcom_q6v5_init(&pas->q6v5, pdev, rproc, desc->crash_reason_smem,
-			     desc->load_state, qcom_pas_handover);
+			     desc->load_state, desc->early_boot, qcom_pas_handover);
 	if (ret)
 		goto detach_proxy_pds;
 
@@ -774,6 +823,16 @@ static int qcom_pas_probe(struct platform_device *pdev)
 	}
 
 	qcom_add_ssr_subdev(rproc, &pas->ssr_subdev, desc->ssr_name);
+
+	if (pas->q6v5.early_boot) {
+		ret = qcom_q6v5_ping_subsystem_init(&pas->q6v5, pdev);
+		if (ret)
+			dev_err(&pdev->dev,
+				"Unable to find ping/pong bits, falling back to firmware load\n");
+		else
+			pas->rproc->state = RPROC_DETACHED;
+	}
+
 	ret = rproc_add(rproc);
 	if (ret)
 		goto remove_ssr_sysmon;

-- 
2.25.1


