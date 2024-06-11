Return-Path: <linux-arm-msm+bounces-22306-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 71510903C01
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Jun 2024 14:34:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 267EE1F25D55
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Jun 2024 12:34:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CC4F17C7AD;
	Tue, 11 Jun 2024 12:34:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="oGvW1mBT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB9DD17C224;
	Tue, 11 Jun 2024 12:34:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718109258; cv=none; b=VPd2eN0cN1bKVG8a/0sK2rz95wTPtm/gtFNYtwLUeTEMSsMvwXk4X0NOm5HmL3ZFNfFFTjVpXqT490g27IqEMWFTwpyw3ilOap5xVUhY8xrURhCkAbxHvZNgapr4R7JMTGxtfVSnS9nemiBdKI/vkUILdXjmGe17zmYTTxFvgx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718109258; c=relaxed/simple;
	bh=AgGGJKMMX+hLPqQ7bZ6mhx8pDjnF4I0UKWHjNrSIUZI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tI0m+Pp0K1dFxRC5e2DHlJd+dWXOQDaUt8nf9ALsV1jKMBDWxjeQgHO3bYg1HiZp+1mN/OB8MfQR95lK4LiH0+QikdlTogLS795p3iDtk8utlGi35qpuprjt52bBOyjGwwgYfeAGvzgdDZWDjlO/fUyNqpumOrTKXRV8j4bPffk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=oGvW1mBT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45B4aGd5002353;
	Tue, 11 Jun 2024 12:34:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NTqnwk4am0NBAa7/xApgd9DzM2SpeGbBpvgXHrniTyg=; b=oGvW1mBT/NDEJJL6
	twqV7r2b9oifuHPKjfwdO7uT7/6MXB0GRkOGEgt//jwpi3NokD9V4B9yOuQx8TcS
	ArsnXaSrj1mxV2tF83Swdm9ycvObk68tWMumVXcoYK9UG2LYSZfWTfX8onQBeBi2
	uwvoicnIEQcNKotUHD4/8u3CvURk2oto+VX9j9gSD7MXf0iCaJRYBQALY0yDM0Sz
	DnCHqx1t9D6prk1oiXcr8ib0AQSmaHr6Zdj+4QY/HqMkbjeRUyhivNrZ70NBjcXS
	/Fwjjemf9yMrcQYCeAFFStmfDVFOj5Hds1GCHMtW5VGsUeq1iSYSvrIg/PhCc/Bg
	6kjcug==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ymevxed8a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Jun 2024 12:34:12 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA04.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45BCYB05001035
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Jun 2024 12:34:11 GMT
Received: from hu-sudeepgo-hyd.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 11 Jun 2024 05:34:08 -0700
From: Sudeepgoud Patil <quic_sudeepgo@quicinc.com>
To: <quic_bjorande@quicinc.com>, <andersson@kernel.org>,
        <quic_clew@quicinc.com>, <mathieu.poirier@linaro.org>
CC: <linux-kernel@vger.kernel.org>, <quic_deesin@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-remoteproc@vger.kernel.org>,
        "Konrad
 Dybcio" <konrad.dybcio@linaro.org>
Subject: [PATCH V2 1/2] soc: qcom: smp2p: Add remote name into smp2p irq devname
Date: Tue, 11 Jun 2024 18:03:50 +0530
Message-ID: <20240611123351.3813190-2-quic_sudeepgo@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240611123351.3813190-1-quic_sudeepgo@quicinc.com>
References: <20240611123351.3813190-1-quic_sudeepgo@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 530VhEHfgaLjmiK6wI8H6v2o667BS3li
X-Proofpoint-GUID: 530VhEHfgaLjmiK6wI8H6v2o667BS3li
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-11_07,2024-06-11_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=957 mlxscore=0
 impostorscore=0 adultscore=0 phishscore=0 malwarescore=0 clxscore=1011
 suspectscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406110093

Add smp2p irq devname which fetches remote name from respective
smp2p dtsi node, which makes the wakeup source distinguishable
in irq wakeup prints.

Signed-off-by: Sudeepgoud Patil <quic_sudeepgo@quicinc.com>
---
 drivers/soc/qcom/smp2p.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/qcom/smp2p.c b/drivers/soc/qcom/smp2p.c
index a21241cbeec7..a77fee048b38 100644
--- a/drivers/soc/qcom/smp2p.c
+++ b/drivers/soc/qcom/smp2p.c
@@ -122,6 +122,7 @@ struct smp2p_entry {
  * @ssr_ack_enabled: SMP2P_FEATURE_SSR_ACK feature is supported and was enabled
  * @ssr_ack: current cached state of the local ack bit
  * @negotiation_done: whether negotiating finished
+ * @irq_devname: poniter to the smp2p irq devname
  * @local_pid:	processor id of the inbound edge
  * @remote_pid:	processor id of the outbound edge
  * @ipc_regmap:	regmap for the outbound ipc
@@ -146,6 +147,7 @@ struct qcom_smp2p {
 	bool ssr_ack;
 	bool negotiation_done;
 
+	char *irq_devname;
 	unsigned local_pid;
 	unsigned remote_pid;
 
@@ -614,10 +616,16 @@ static int qcom_smp2p_probe(struct platform_device *pdev)
 	/* Kick the outgoing edge after allocating entries */
 	qcom_smp2p_kick(smp2p);
 
+	smp2p->irq_devname = kasprintf(GFP_KERNEL, "%s", pdev->dev.of_node->name);
+	if (!smp2p->irq_devname) {
+		ret = -ENOMEM;
+		goto unwind_interfaces;
+	}
+
 	ret = devm_request_threaded_irq(&pdev->dev, irq,
 					NULL, qcom_smp2p_intr,
 					IRQF_ONESHOT,
-					"smp2p", (void *)smp2p);
+					smp2p->irq_devname, (void *)smp2p);
 	if (ret) {
 		dev_err(&pdev->dev, "failed to request interrupt\n");
 		goto unwind_interfaces;
@@ -650,6 +658,8 @@ static int qcom_smp2p_probe(struct platform_device *pdev)
 	list_for_each_entry(entry, &smp2p->outbound, node)
 		qcom_smem_state_unregister(entry->state);
 
+	kfree(smp2p->irq_devname);
+
 	smp2p->out->valid_entries = 0;
 
 release_mbox:
@@ -677,6 +687,8 @@ static void qcom_smp2p_remove(struct platform_device *pdev)
 
 	mbox_free_channel(smp2p->mbox_chan);
 
+	kfree(smp2p->irq_devname);
+
 	smp2p->out->valid_entries = 0;
 }
 
-- 


