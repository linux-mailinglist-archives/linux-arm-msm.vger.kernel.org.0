Return-Path: <linux-arm-msm+bounces-23352-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 42BFD9103B8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Jun 2024 14:08:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2F0831C21B7E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Jun 2024 12:08:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 345F61AD3E8;
	Thu, 20 Jun 2024 12:06:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="jESpCHHS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3E1C1AC79E;
	Thu, 20 Jun 2024 12:06:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718885218; cv=none; b=mXLsNM9U8YK+tPTpt4K7mFlitYMy+U+pwE68gQRuvMbb3CW+GzJbKUpXcfgF7seBFPGVr+CupXJ9nBVCuLah/bpPKWmQDe8AZwQCfAsXvJ2ObAvuKWDnVaVXmPWE2wdo3p+6McS/HEo4sAH2aa4Ez9p7DRz6iRICZrpnXGZcuGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718885218; c=relaxed/simple;
	bh=b4e1kqTwwhq/jRaVxVe0ixBFQ4rgh7URJ05Qwo4UlLA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mPtMUJbXOEzYKw6tCRoHlO6lynh4X8FHOHMkP0bXT8bgdoQqbGrgEywNIIN48YfOz0dMM2JA/1V1Y7EgTNv600pp/jMMTUnQ7zeFVgZwVYmTGhDUkvrGhBZ3ctKYELBk5o/UYzA7J7GiP5Jxu6Z1mvSqEr8M0VzD+YrENgzgnOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=jESpCHHS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45K9v0nA003888;
	Thu, 20 Jun 2024 12:06:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KRxlnbaVeHgObdEQDhYUBNSVOR56ZttPp/9zM1X5M4g=; b=jESpCHHSAElx5IX+
	qFXQkCnKoSSlvuYwU6bV52rJFQ+UP07Vae4tSHvjG914RL2YFXqGTp1TOJTfh0KW
	Fe2IKsw9et5zmUW4SzGLFG674mlgxcYZcnj512hc021DYZcvEAJz6XKO9wzphUv4
	SVrkYQw+8zxy3h+UFdFimBuo5ejoGcTL3wSMfKWszIsN0ktl+01U1Zb3Ye63fPP3
	xu389lRkg44pw5PDJQmRYjwQB+6wefkYIyPPGLS4O5lDJUALcMtBL/RJ+aTcSB20
	yiO8PGK28G1D6KBub9cn0PQmI+xe0GrKJFaeMDKpwVx8jqR6uQXibaOg1yG7+ziu
	ld2LEg==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yve5d8vay-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Jun 2024 12:06:52 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45KC6pcm022366
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Jun 2024 12:06:51 GMT
Received: from hu-kbajaj-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 20 Jun 2024 05:06:47 -0700
From: Komal Bajaj <quic_kbajaj@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier
	<mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-remoteproc@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Melody Olvera
	<quic_molvera@quicinc.com>,
        Komal Bajaj <quic_kbajaj@quicinc.com>
Subject: [PATCH v3 3/4] remoteproc: qcom_q6v5_pas: Add support to attach a DSP
Date: Thu, 20 Jun 2024 17:31:42 +0530
Message-ID: <20240620120143.12375-4-quic_kbajaj@quicinc.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240620120143.12375-1-quic_kbajaj@quicinc.com>
References: <20240620120143.12375-1-quic_kbajaj@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: p_PohCwMGe9Gv3U7DkX05K6Hp43cnmTD
X-Proofpoint-GUID: p_PohCwMGe9Gv3U7DkX05K6Hp43cnmTD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-20_07,2024-06-20_03,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 clxscore=1015
 suspectscore=0 priorityscore=1501 phishscore=0 mlxlogscore=841 mlxscore=0
 malwarescore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2405170001
 definitions=main-2406200087

From: Melody Olvera <quic_molvera@quicinc.com>

Some chipsets will have DSPs which will have begun running prior
to linux booting, so add support to late attach these DSPs by
adding support for:
- run-time checking of an offline or running DSP via rmb register
- a late attach framework to attach to the running DSP
- a handshake mechanism to ensure full and proper booting via rmb

Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
Signed-off-by: Komal Bajaj <quic_kbajaj@quicinc.com>
---
 drivers/remoteproc/qcom_q6v5_pas.c | 102 +++++++++++++++++++++++++++++
 1 file changed, 102 insertions(+)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index b9759f6b2283..32d45c18e15e 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -11,6 +11,7 @@
 #include <linux/delay.h>
 #include <linux/firmware.h>
 #include <linux/interrupt.h>
+#include <linux/iopoll.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/of.h>
@@ -258,6 +259,94 @@ static int adsp_load(struct rproc *rproc, const struct firmware *fw)
 	return ret;
 }

+static int adsp_signal_q6v5(struct qcom_adsp *adsp)
+{
+	unsigned int val;
+	int ret;
+
+	if (adsp->q6v5.rmb_base) {
+		ret = readl_poll_timeout(adsp->q6v5.rmb_base + RMB_BOOT_WAIT_REG,
+					 val, val, 20000,
+					 RMB_POLL_MAX_TIMES * 20000);
+		if (ret < 0)
+			return ret;
+
+		writel_relaxed(1, adsp->q6v5.rmb_base + RMB_BOOT_CONT_REG);
+	}
+
+	return 0;
+}
+
+static int adsp_attach(struct rproc *rproc)
+{
+	struct qcom_adsp *adsp = (struct qcom_adsp *)rproc->priv;
+	int ret;
+
+	ret = qcom_q6v5_prepare(&adsp->q6v5);
+	if (ret)
+		return ret;
+
+	ret = adsp_pds_enable(adsp, adsp->proxy_pds, adsp->proxy_pd_count);
+	if (ret < 0)
+		goto disable_irqs;
+
+	ret = clk_prepare_enable(adsp->xo);
+	if (ret)
+		goto disable_proxy_pds;
+
+	ret = clk_prepare_enable(adsp->aggre2_clk);
+	if (ret)
+		goto disable_xo_clk;
+
+	if (adsp->cx_supply) {
+		ret = regulator_enable(adsp->cx_supply);
+		if (ret)
+			goto disable_aggre2_clk;
+	}
+
+	if (adsp->px_supply) {
+		ret = regulator_enable(adsp->px_supply);
+		if (ret)
+			goto disable_cx_supply;
+	}
+
+	/* if needed, signal Q6 to continute booting */
+	ret = adsp_signal_q6v5(adsp);
+	if (ret < 0) {
+		dev_err(adsp->dev, "Didn't get rmb signal from  %s\n", rproc->name);
+		goto disable_px_supply;
+	};
+
+	ret = qcom_q6v5_wait_for_start(&adsp->q6v5, msecs_to_jiffies(5000));
+	if (ret == -ETIMEDOUT) {
+		dev_err(adsp->dev, "start timed out\n");
+		qcom_scm_pas_shutdown(adsp->pas_id);
+		goto disable_px_supply;
+	}
+
+	return 0;
+
+disable_px_supply:
+	if (adsp->px_supply)
+		regulator_disable(adsp->px_supply);
+disable_cx_supply:
+	if (adsp->cx_supply)
+		regulator_disable(adsp->cx_supply);
+disable_aggre2_clk:
+	clk_disable_unprepare(adsp->aggre2_clk);
+disable_xo_clk:
+	clk_disable_unprepare(adsp->xo);
+disable_proxy_pds:
+	adsp_pds_disable(adsp, adsp->proxy_pds, adsp->proxy_pd_count);
+disable_irqs:
+	qcom_q6v5_unprepare(&adsp->q6v5);
+
+	/* Remove pointer to the loaded firmware, only valid in adsp_load() & adsp_start() */
+	adsp->firmware = NULL;
+
+	return ret;
+}
+
 static int adsp_start(struct rproc *rproc)
 {
 	struct qcom_adsp *adsp = rproc->priv;
@@ -320,6 +409,13 @@ static int adsp_start(struct rproc *rproc)
 		goto release_pas_metadata;
 	}

+	/* if needed, signal Q6 to continute booting */
+	ret = adsp_signal_q6v5(adsp);
+	if (ret < 0) {
+		dev_err(adsp->dev, "Didn't get rmb signal from  %s\n", rproc->name);
+		goto release_pas_metadata;
+	}
+
 	ret = qcom_q6v5_wait_for_start(&adsp->q6v5, msecs_to_jiffies(5000));
 	if (ret == -ETIMEDOUT) {
 		dev_err(adsp->dev, "start timed out\n");
@@ -432,6 +528,7 @@ static unsigned long adsp_panic(struct rproc *rproc)
 static const struct rproc_ops adsp_ops = {
 	.unprepare = adsp_unprepare,
 	.start = adsp_start,
+	.attach = adsp_attach,
 	.stop = adsp_stop,
 	.da_to_va = adsp_da_to_va,
 	.parse_fw = qcom_register_dump_segments,
@@ -442,6 +539,7 @@ static const struct rproc_ops adsp_ops = {
 static const struct rproc_ops adsp_minidump_ops = {
 	.unprepare = adsp_unprepare,
 	.start = adsp_start,
+	.attach = adsp_attach,
 	.stop = adsp_stop,
 	.da_to_va = adsp_da_to_va,
 	.parse_fw = qcom_register_dump_segments,
@@ -779,6 +877,10 @@ static int adsp_probe(struct platform_device *pdev)
 	if (ret)
 		goto detach_proxy_pds;

+	if (adsp->q6v5.rmb_base &&
+			readl_relaxed(adsp->q6v5.rmb_base + RMB_Q6_BOOT_STATUS_REG))
+		rproc->state = RPROC_DETACHED;
+
 	qcom_add_glink_subdev(rproc, &adsp->glink_subdev, desc->ssr_name);
 	qcom_add_smd_subdev(rproc, &adsp->smd_subdev);
 	adsp->sysmon = qcom_add_sysmon_subdev(rproc,
--
2.42.0


