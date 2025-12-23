Return-Path: <linux-arm-msm+bounces-86301-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 270DCCD8883
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Dec 2025 10:14:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6270E3002FFC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Dec 2025 09:14:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E31B532827E;
	Tue, 23 Dec 2025 09:14:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iD7XO4vK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JxRuN9Vs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B600A32572F
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 09:14:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766481267; cv=none; b=mBB0y0X1fWCG69ZOxDKt9n49qD5ywy8l52zCTGNESW6lrYvrnHzadR1YFv/TO9fwSKMXFF/dxbpBa3JfdhW5kQqIe94FtBVxqL66NAwQDas2Ejlr5ic5v0gsBBMqBOO0ysl5aBGmSIjdpWEQkUGy5eH/MQJOW0QSUQUimw+2AgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766481267; c=relaxed/simple;
	bh=Z9QJNhY+mYwzlzBieDqkxxHl6MsI+iCoGg5mCTi2KUk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=M9VdOkyhn9YJgimCZKS8Z42CRkS5Qa8XwO8urSN/NaLGWuFhFT971CnD3S/SdDAZUP/yXnu30BPJN8o7lXdLZKlSeDIz7uyRKeTKr6jYlFSb/wFhkU1se5awb6/2inZPGSu2FUg7JlD1vpUOA4fus/qNvPcMrDcyk7/TJzi578M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iD7XO4vK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JxRuN9Vs; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BN7FdTa2115304
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 09:14:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eJcDNjDK63/A97p8z3UKsfq/z6EEgXQi+po2E47PTPU=; b=iD7XO4vKiHApJgKN
	VnRq7OCGCp7kqeI4iwE0FjnT7OtTOfRm0PszRZMHs0tcdjZtPW4Cbp/cdO9fd2Em
	Zj9pgHNBt7k7svvFQuXeG2UKAk9YbepI8mYNlZAVg/ApOWFFTRnGR3x8wIoA29oz
	JIxS+KnvQ2MDe1K+yUC5z3QOLmRPkfRk375fhNg+DC1Znq4UYlXXuz7x7in0xMAV
	ND3kJE6qVsG3+P9gM3mb7cPuFyxtE+xvDcFBB7rdze81xU4IFYwHKfC3W07JCgvD
	u1WXap5UxrUMUMg8wbIci/zEgcCnLIvxBcPPLfVtqg/Vn1JDdraPZjrn0huy4Cb4
	3HgQdw==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7cudj28j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 09:14:23 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-11bd7a827fdso10274825c88.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 01:14:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766481262; x=1767086062; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eJcDNjDK63/A97p8z3UKsfq/z6EEgXQi+po2E47PTPU=;
        b=JxRuN9Vs/fzzpiBTw6FSKUHJ/M0xV8/aO9mqfkFLycWJdgHPiXN7Hp9NGuHt3iCivs
         oaWx1K8Ze595pBcWecNZE2kuVzD3JhDYBXids01WWRXRE1uSbw5QWbNOboj3L7eR9VO8
         R4xyTctmWZITnbXBpiciE3+CW+E4ukHAPpMfyJU8i3MtzV9+rIKD081HkxyJ/fvssuPS
         DuA3v9jSV5nwqHmKhHuxrvtrWDREXWTmWLGDTxmMjiqokWJT+8wsW41ye4b7lNUpQemu
         EJj8GpRCkWoe+K+Gt0+qod57zvtR7y0GWMGWoHQX0STt93wxjK2PFIOrmhp8hEXSu9Mo
         3CQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766481262; x=1767086062;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=eJcDNjDK63/A97p8z3UKsfq/z6EEgXQi+po2E47PTPU=;
        b=k5Rtq+h7NrxGo6DwGEqKJioiGqKy7MnlC5j3QxOsI5WJt+KXeLU2jXMnUGyC4SNonS
         K4c6KbsQFbJevPttRtbCaWcfx5HDtZhlu0ySYNXZXrQb/OUZJbiT62dcG5iXl44R/EjI
         dxXgVZLVrf0nRWp4pgHxgOHVDeSpnocyYx0Oys4jT7ZXnAu4tTs4GhzZNqy5Dmcc6h/d
         l1ltCMVbqwVtoXa8/N2LUqv1aNb65Pc6gpIIEv2eR0p2rA2b89W2dxqMw8aSi+Uf8YDw
         gSB3+n4bW4Ro1FI2jSwElIwd2pt24s4QJpchwgCEaNvXexPInjCo2nTgB6A56dM0fJik
         UPAg==
X-Forwarded-Encrypted: i=1; AJvYcCU5D92644V/gh1zThNoc5v92rKlyCy3EPNuQin1QiOFp8isE3pXPdQMuY6POYyYZKeMJeFSSNOu/JMQcGv5@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9r3ySfAWnM7Q7XLFn+jl0WoKDeZwK4n6i+CSpmhQiXUuJg5YC
	dQCyQA4GnVJl3U6ZctCUBqStaTCO/caDoRrvpwUbQe0xG4Xoq8O7CyqRp8y6Tv+nGQctH9NL7NY
	iy5A3u3UqP+gAuKix9y3Wx/DiPAUv40nAlqApHNz8vC3+qbnGNhRMAzF0PlBfTR+BUXzt
X-Gm-Gg: AY/fxX6QdaZ9sDbR1JcR9U8hX1DZwWZMsFJ0CAn0mJW4qZMT81AJ/Ob2tUBpuG97o4E
	xf9f9G4f/L7C8N9HFBJLlMbYTFxqeNoWKbtJjJ+McdpZUNC2YQBj8kyduJHgRR9azM2PvPukWfl
	eIx7Na+v/o1zdHm6nk336XEpbfT8lgK16TRyuwT1QubMbgwzUDZKVyCTch1fHs5dbo3BcUdDiaV
	EVF9HVOe8o//YPsGnBScHnfKfTR4aSRM5OgunhkQCKicFokP8VjTHtPoyMzyq+BhfLinmFIWXIi
	gWNw8htjlOTvaqPPnH9hHGn3nEQsCARE/lkq+zxYvipI1fxFzZmlNcP9YPUsbNRCD8a8wI6WCR1
	ACACy6wIB1RPkzHIt8QE9SMdUfxC4YFVmCLjF+IA9lNAY4chI8wwEuqJBVFJM
X-Received: by 2002:a05:7022:504:b0:119:e569:f873 with SMTP id a92af1059eb24-12171aca67dmr13556848c88.16.1766481261963;
        Tue, 23 Dec 2025 01:14:21 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFTP0/AwBUYd6P7PP+1p6xTFQSi83JRp1lMYYpbdk+VVLXwcuth5TftVz9La6cVPPcIwSk5iQ==
X-Received: by 2002:a05:7022:504:b0:119:e569:f873 with SMTP id a92af1059eb24-12171aca67dmr13556807c88.16.1766481261290;
        Tue, 23 Dec 2025 01:14:21 -0800 (PST)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1217254cd77sm56931833c88.14.2025.12.23.01.14.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 01:14:20 -0800 (PST)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Tue, 23 Dec 2025 01:13:50 -0800
Subject: [PATCH v3 4/5] remoteproc: qcom: pas: Add late attach support for
 subsystems
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251223-knp-remoteproc-v3-4-5b09885c55a5@oss.qualcomm.com>
References: <20251223-knp-remoteproc-v3-0-5b09885c55a5@oss.qualcomm.com>
In-Reply-To: <20251223-knp-remoteproc-v3-0-5b09885c55a5@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Gokul krishna Krishnakumar <gokul.krishnakumar@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766481257; l=13613;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=ah4BRBCJ3psBdbQurF6akJP6Z/Tu+W9Jy9iuU9xu4NQ=;
 b=Vz3zYF76QnjqHTWD4igQMv2JhZFNCZ4kQmodYeOX3UNOJRTlOdNx7TKgkcU/OJzSmul8j1en1
 BP1grt856xaDfE+JW7CCVRWh2sxRnnlHGv0HQEiN7/lT0dp4enuuz1S
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Authority-Analysis: v=2.4 cv=ebkwvrEH c=1 sm=1 tr=0 ts=694a5d6f cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=x8meLMyhUKYFESlZP2wA:9
 a=QEXdDO2ut3YA:10 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-GUID: 84txB8Bw822sjHiUhqglH9otwoT6bDvr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDA3NCBTYWx0ZWRfX8Mehaq0h+PMs
 gBimPj/z4qB58l3mOqCf2Kk7d6z9/vtzhk/3cEkVyavsxmI/jmhEYx/Jo98GDZkJOXhyqJEW4/W
 pH/c3EJTnRdKQzkuo822PH+N6Sz/+GeUX7xcSJigCCOycJDveE+NYPBfBTfzOvEipecNB9k9G52
 /20Pytulb/2wxxjehHoxZlXmLEBpqTqpxmzyZk4G9rngdegcflkph0kU8V7mUc9WWTpC04bbrya
 orXYPb72YWOTCeY7DfF+MvFwzHYmSrYzuIQpoWpSCAUk3DPjViYbpva7w3+Z02LOXpvx7hXx2rw
 p1++Q2YvVK5cmW9tR1PfUZqTeWuqtCjw27BTH7oAkaDIoWlo8NQ3huekV0IsIn+kknTeMRoW3k+
 UE2XFJinPrgNgZobTFd0FzCjg/d1EGBA7sIdznRQjVLOpSzxIV9H/lBvCqISSsZiQl6IS78GFs3
 BhH1JXj4mVCWPcKOrLw==
X-Proofpoint-ORIG-GUID: 84txB8Bw822sjHiUhqglH9otwoT6bDvr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_02,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 adultscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 bulkscore=0 spamscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512230074

From: Gokul krishna Krishnakumar <gokul.krishnakumar@oss.qualcomm.com>

Subsystems can be brought out of reset by entities such as bootloaders.
As the irq enablement could be later than subsystem bring up, the state
of subsystem should be checked by reading SMP2P bits and performing ping
test.

A new qcom_pas_attach() function is introduced. if a crash state is
detected for the subsystem, rproc_report_crash() is called. If the
subsystem is ready either at the first check or within a 5-second timeout
and the ping is successful, it will be marked as "attached". The ready
state could be set by either ready interrupt or handover interrupt.

If "early_boot" is set by kernel but "subsys_booted" is not completed
within the timeout, It could be the early boot feature is not supported
by other entities. In this case, the state will be marked as RPROC_OFFLINE
so that the PAS driver can load the firmware and start the remoteproc. As
the running state is set once attach function is called, the watchdog or
fatal interrupt received can be handled correctly.

Signed-off-by: Gokul krishna Krishnakumar <gokul.krishnakumar@oss.qualcomm.com>
Co-developed-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
 drivers/remoteproc/qcom_q6v5.c      | 87 ++++++++++++++++++++++++++++++++-
 drivers/remoteproc/qcom_q6v5.h      | 11 ++++-
 drivers/remoteproc/qcom_q6v5_adsp.c |  2 +-
 drivers/remoteproc/qcom_q6v5_mss.c  |  2 +-
 drivers/remoteproc/qcom_q6v5_pas.c  | 97 ++++++++++++++++++++++++++++++++++++-
 drivers/remoteproc/qcom_q6v5_wcss.c |  2 +-
 6 files changed, 195 insertions(+), 6 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5.c b/drivers/remoteproc/qcom_q6v5.c
index 58d5b85e58cd..3f451e5db381 100644
--- a/drivers/remoteproc/qcom_q6v5.c
+++ b/drivers/remoteproc/qcom_q6v5.c
@@ -20,6 +20,7 @@
 
 #define Q6V5_LOAD_STATE_MSG_LEN	64
 #define Q6V5_PANIC_DELAY_MS	200
+#define Q6V5_PING_TIMEOUT_MS	500
 
 static int q6v5_load_state_toggle(struct qcom_q6v5 *q6v5, bool enable)
 {
@@ -94,6 +95,9 @@ static irqreturn_t q6v5_wdog_interrupt(int irq, void *data)
 	size_t len;
 	char *msg;
 
+	if (q6v5->early_boot)
+		complete(&q6v5->subsys_booted);
+
 	/* Sometimes the stop triggers a watchdog rather than a stop-ack */
 	if (!q6v5->running) {
 		complete(&q6v5->stop_done);
@@ -118,6 +122,9 @@ static irqreturn_t q6v5_fatal_interrupt(int irq, void *data)
 	size_t len;
 	char *msg;
 
+	if (q6v5->early_boot)
+		complete(&q6v5->subsys_booted);
+
 	if (!q6v5->running)
 		return IRQ_HANDLED;
 
@@ -139,6 +146,9 @@ static irqreturn_t q6v5_ready_interrupt(int irq, void *data)
 
 	complete(&q6v5->start_done);
 
+	if (q6v5->early_boot)
+		complete(&q6v5->subsys_booted);
+
 	return IRQ_HANDLED;
 }
 
@@ -172,6 +182,9 @@ static irqreturn_t q6v5_handover_interrupt(int irq, void *data)
 	if (q6v5->handover)
 		q6v5->handover(q6v5);
 
+	if (q6v5->early_boot)
+		complete(&q6v5->subsys_booted);
+
 	icc_set_bw(q6v5->path, 0, 0);
 
 	q6v5->handover_issued = true;
@@ -234,6 +247,74 @@ unsigned long qcom_q6v5_panic(struct qcom_q6v5 *q6v5)
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
+	ret = wait_for_completion_timeout(&q6v5->ping_done, msecs_to_jiffies(Q6V5_PING_TIMEOUT_MS));
+	if (!ret) {
+		ping_failed = -ETIMEDOUT;
+		dev_err(q6v5->dev, "Failed to get back pong\n");
+	}
+
+	/* Clear ping bit master kernel */
+	ret = qcom_smem_state_update_bits(q6v5->ping_state, BIT(q6v5->ping_bit), 0);
+	if (ret) {
+		dev_err(q6v5->dev, "Failed to clear master kernel bits\n");
+		return ret;
+	}
+
+	return ping_failed;
+}
+EXPORT_SYMBOL_GPL(qcom_q6v5_ping_subsystem);
+
+int qcom_q6v5_ping_subsystem_init(struct qcom_q6v5 *q6v5, struct platform_device *pdev)
+{
+	int ret = -ENODEV;
+
+	q6v5->ping_state = devm_qcom_smem_state_get(&pdev->dev, "ping", &q6v5->ping_bit);
+	if (IS_ERR(q6v5->ping_state)) {
+		dev_err(&pdev->dev, "Failed to acquire smem state %ld\n",
+			PTR_ERR(q6v5->ping_state));
+		return PTR_ERR(q6v5->ping_state);
+	}
+
+	init_completion(&q6v5->ping_done);
+
+	q6v5->pong_irq = platform_get_irq_byname(pdev, "pong");
+	if (q6v5->pong_irq < 0)
+		return q6v5->pong_irq;
+
+	ret = devm_request_threaded_irq(&pdev->dev, q6v5->pong_irq, NULL,
+					q6v5_pong_interrupt, IRQF_TRIGGER_RISING | IRQF_ONESHOT,
+					"q6v5 pong", q6v5);
+	if (ret)
+		dev_err(&pdev->dev, "Failed to acquire pong IRQ\n");
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(qcom_q6v5_ping_subsystem_init);
+
 /**
  * qcom_q6v5_init() - initializer of the q6v5 common struct
  * @q6v5:	handle to be initialized
@@ -247,7 +328,7 @@ EXPORT_SYMBOL_GPL(qcom_q6v5_panic);
  */
 int qcom_q6v5_init(struct qcom_q6v5 *q6v5, struct platform_device *pdev,
 		   struct rproc *rproc, int crash_reason, const char *load_state,
-		   void (*handover)(struct qcom_q6v5 *q6v5))
+		   bool early_boot, void (*handover)(struct qcom_q6v5 *q6v5))
 {
 	int ret;
 
@@ -255,10 +336,14 @@ int qcom_q6v5_init(struct qcom_q6v5 *q6v5, struct platform_device *pdev,
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
index 5a859c41896e..f500518136ae 100644
--- a/drivers/remoteproc/qcom_q6v5.h
+++ b/drivers/remoteproc/qcom_q6v5.h
@@ -17,22 +17,27 @@ struct qcom_q6v5 {
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
 
@@ -40,11 +45,13 @@ struct qcom_q6v5 {
 
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
@@ -52,5 +59,7 @@ int qcom_q6v5_unprepare(struct qcom_q6v5 *q6v5);
 int qcom_q6v5_request_stop(struct qcom_q6v5 *q6v5, struct qcom_sysmon *sysmon);
 int qcom_q6v5_wait_for_start(struct qcom_q6v5 *q6v5, int timeout);
 unsigned long qcom_q6v5_panic(struct qcom_q6v5 *q6v5);
+int qcom_q6v5_ping_subsystem(struct qcom_q6v5 *q6v5);
+int qcom_q6v5_ping_subsystem_init(struct qcom_q6v5 *q6v5, struct platform_device *pdev);
 
 #endif
diff --git a/drivers/remoteproc/qcom_q6v5_adsp.c b/drivers/remoteproc/qcom_q6v5_adsp.c
index b5c8d6d38c9c..15b3cdf8c157 100644
--- a/drivers/remoteproc/qcom_q6v5_adsp.c
+++ b/drivers/remoteproc/qcom_q6v5_adsp.c
@@ -712,7 +712,7 @@ static int adsp_probe(struct platform_device *pdev)
 		goto disable_pm;
 
 	ret = qcom_q6v5_init(&adsp->q6v5, pdev, rproc, desc->crash_reason_smem,
-			     desc->load_state, qcom_adsp_pil_handover);
+			     desc->load_state, false, qcom_adsp_pil_handover);
 	if (ret)
 		goto disable_pm;
 
diff --git a/drivers/remoteproc/qcom_q6v5_mss.c b/drivers/remoteproc/qcom_q6v5_mss.c
index 91940977ca89..2129064147d6 100644
--- a/drivers/remoteproc/qcom_q6v5_mss.c
+++ b/drivers/remoteproc/qcom_q6v5_mss.c
@@ -2143,7 +2143,7 @@ static int q6v5_probe(struct platform_device *pdev)
 	qproc->has_mba_logs = desc->has_mba_logs;
 
 	ret = qcom_q6v5_init(&qproc->q6v5, pdev, rproc, MPSS_CRASH_REASON_SMEM, "modem",
-			     qcom_msa_handover);
+			     false, qcom_msa_handover);
 	if (ret)
 		goto detach_proxy_pds;
 
diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index 52680ac99589..7e890e18dd82 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -35,6 +35,8 @@
 
 #define MAX_ASSIGN_COUNT 3
 
+#define EARLY_ATTACH_TIMEOUT_MS 5000
+
 struct qcom_pas_data {
 	int crash_reason_smem;
 	const char *firmware_name;
@@ -59,6 +61,7 @@ struct qcom_pas_data {
 	int region_assign_count;
 	bool region_assign_shared;
 	int region_assign_vmid;
+	bool early_boot;
 };
 
 struct qcom_pas {
@@ -326,6 +329,7 @@ static int qcom_pas_start(struct rproc *rproc)
 	}
 
 	ret = qcom_q6v5_wait_for_start(&pas->q6v5, msecs_to_jiffies(5000));
+
 	if (ret == -ETIMEDOUT) {
 		dev_err(pas->dev, "start timed out\n");
 		qcom_scm_pas_shutdown(pas->pas_id);
@@ -409,6 +413,8 @@ static int qcom_pas_stop(struct rproc *rproc)
 	if (pas->smem_host_id)
 		ret = qcom_smem_bust_hwspin_lock_by_host(pas->smem_host_id);
 
+	pas->q6v5.early_boot = false;
+
 	return ret;
 }
 
@@ -434,6 +440,85 @@ static unsigned long qcom_pas_panic(struct rproc *rproc)
 	return qcom_q6v5_panic(&pas->q6v5);
 }
 
+static int qcom_pas_attach(struct rproc *rproc)
+{
+	int ret;
+	struct qcom_pas *pas = rproc->priv;
+	bool ready_state;
+	bool crash_state;
+
+	pas->q6v5.running = true;
+	ret = irq_get_irqchip_state(pas->q6v5.fatal_irq,
+				    IRQCHIP_STATE_LINE_LEVEL, &crash_state);
+
+	if (ret)
+		goto disable_running;
+
+	if (crash_state) {
+		dev_err(pas->dev, "Sub system has crashed before driver probe\n");
+		rproc_report_crash(rproc, RPROC_FATAL_ERROR);
+		ret = -EINVAL;
+		goto disable_running;
+	}
+
+	ret = irq_get_irqchip_state(pas->q6v5.ready_irq,
+				    IRQCHIP_STATE_LINE_LEVEL, &ready_state);
+
+	if (ret)
+		goto disable_running;
+
+	enable_irq(pas->q6v5.handover_irq);
+
+	if (unlikely(!ready_state)) {
+		/* Set a 5 seconds timeout in case the early boot is delayed */
+		ret = wait_for_completion_timeout(&pas->q6v5.subsys_booted,
+						  msecs_to_jiffies(EARLY_ATTACH_TIMEOUT_MS));
+
+		/*
+		 * The bootloader may not support early boot, mark the state as
+		 * RPROC_OFFLINE so that the PAS driver can load the firmware and
+		 * start the remoteproc.
+		 */
+		if (!ret) {
+			dev_err(pas->dev, "Timeout on waiting for subsystem interrupt\n");
+			pas->rproc->state = RPROC_OFFLINE;
+			ret = -ETIMEDOUT;
+			goto disable_handover;
+		}
+
+		/* Only ping the subsystem if ready_state is set */
+		ret = irq_get_irqchip_state(pas->q6v5.ready_irq,
+					    IRQCHIP_STATE_LINE_LEVEL, &ready_state);
+
+		if (ret)
+			goto disable_handover;
+
+		if (!ready_state) {
+			ret = -EINVAL;
+			goto disable_handover;
+		}
+	}
+
+	ret = qcom_q6v5_ping_subsystem(&pas->q6v5);
+
+	if (ret) {
+		dev_err(pas->dev, "Failed to ping subsystem, assuming device crashed\n");
+		rproc_report_crash(rproc, RPROC_FATAL_ERROR);
+		goto disable_handover;
+	}
+
+	pas->q6v5.handover_issued = true;
+
+	return 0;
+
+disable_handover:
+	disable_irq(pas->q6v5.handover_irq);
+disable_running:
+	pas->q6v5.running = false;
+
+	return ret;
+}
+
 static const struct rproc_ops qcom_pas_ops = {
 	.unprepare = qcom_pas_unprepare,
 	.start = qcom_pas_start,
@@ -442,6 +527,7 @@ static const struct rproc_ops qcom_pas_ops = {
 	.parse_fw = qcom_register_dump_segments,
 	.load = qcom_pas_load,
 	.panic = qcom_pas_panic,
+	.attach = qcom_pas_attach,
 };
 
 static const struct rproc_ops qcom_pas_minidump_ops = {
@@ -746,7 +832,7 @@ static int qcom_pas_probe(struct platform_device *pdev)
 	pas->proxy_pd_count = ret;
 
 	ret = qcom_q6v5_init(&pas->q6v5, pdev, rproc, desc->crash_reason_smem,
-			     desc->load_state, qcom_pas_handover);
+			     desc->load_state, desc->early_boot, qcom_pas_handover);
 	if (ret)
 		goto detach_proxy_pds;
 
@@ -760,6 +846,15 @@ static int qcom_pas_probe(struct platform_device *pdev)
 	}
 
 	qcom_add_ssr_subdev(rproc, &pas->ssr_subdev, desc->ssr_name);
+
+	if (pas->q6v5.early_boot) {
+		ret = qcom_q6v5_ping_subsystem_init(&pas->q6v5, pdev);
+		if (ret)
+			dev_warn(&pdev->dev, "Falling back to firmware load\n");
+		else
+			pas->rproc->state = RPROC_DETACHED;
+	}
+
 	ret = rproc_add(rproc);
 	if (ret)
 		goto remove_ssr_sysmon;
diff --git a/drivers/remoteproc/qcom_q6v5_wcss.c b/drivers/remoteproc/qcom_q6v5_wcss.c
index c27200159a88..859141589ed7 100644
--- a/drivers/remoteproc/qcom_q6v5_wcss.c
+++ b/drivers/remoteproc/qcom_q6v5_wcss.c
@@ -1011,7 +1011,7 @@ static int q6v5_wcss_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	ret = qcom_q6v5_init(&wcss->q6v5, pdev, rproc, desc->crash_reason_smem, NULL, NULL);
+	ret = qcom_q6v5_init(&wcss->q6v5, pdev, rproc, desc->crash_reason_smem, NULL, false, NULL);
 	if (ret)
 		return ret;
 

-- 
2.25.1


