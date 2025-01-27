Return-Path: <linux-arm-msm+bounces-46187-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C2C2A1D102
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Jan 2025 07:51:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5F101163F05
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Jan 2025 06:51:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC46B1FCCF3;
	Mon, 27 Jan 2025 06:50:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Wf5vhZf2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ABFA1FCCE7;
	Mon, 27 Jan 2025 06:50:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737960630; cv=none; b=rlmRBgSGinvsw02S5IYZw2GenXmg+DG3abCCwUnfp47KRTeiptOq5PsDQ+Zc2F26wtq0TzhznofqF83deqQuqSdHkjKTEGN5bN1GM3DjX/+srK7b1xLCzE6t34VybkYc+nDKYzXtYcU565ZiabchkUIHatiY+ZLWWq7SjNbeI2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737960630; c=relaxed/simple;
	bh=72ypbfAx4aTzaSq8RsBOyaCCNNmiJx6es43r+SBSDig=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=n82KAS4ru6Ole5lhPnMmqD5JHqd22+P1P66ibRgczRrmze8NMeJs8y54985S+izj1Pbwdg4YeNt/E0XMvS48gyKNy4nYFC5MbIJnZDYTfYJg9WsUWJj/K7NCJAi9IruDVfuYzm26CoGJ7duOgL2C/W1ck0jGhW+TEZvq7hIAEq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Wf5vhZf2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50R4t0S3024780;
	Mon, 27 Jan 2025 06:50:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QjehGn6pM3+5o3M2ZHJw+kez+uzfsB/kjouEUHNTGOg=; b=Wf5vhZf2wusBqGTN
	qsNaU31ma0W6vy+RAiplaZzRlxbAjTHcssx1W983uNZQS6D5RVEvJhwOKhFAkxxI
	yGLcV9PGgZnD7Ix07GXB4rmIckjmFTF9BX7+1Q8RB4NvmKCEJ9f271Co1qGne86K
	9CEgjw7FgpW7FJkMQ1J0jXOjL5rIhJB2NxH0+RiZRbYkAQ589mxocrM4a8pHh08x
	OXRacgfyBiNjKBH8EjPwAt+JOTTlHq6+VdwvZftvhHsG1nfMERVYetqa60W8ELa/
	P+NlkLYt7ISTm2V/V6Lu5u0IRpndNmp2PsZgc0y3lmwGG41CywgYcsXlObSpW0Za
	dJhKMQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44e3h2r7c6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 27 Jan 2025 06:50:23 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50R6oMQt006080
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 27 Jan 2025 06:50:22 GMT
Received: from hu-janathot-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Sun, 26 Jan 2025 22:50:17 -0800
From: Janaki Ramaiah Thota <quic_janathot@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Marcel Holtmann
	<marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>
CC: <quic_mohamull@quicinc.com>, <quic_hbandi@quicinc.com>,
        <quic_anubhavg@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-bluetooth@vger.kernel.org>,
        Dmitry Baryshkov
	<dmitry.baryshkov@linaro.org>
Subject: [PATCH v8 2/2] Bluetooth: hci_qca: use the power sequencer for wcn6750
Date: Mon, 27 Jan 2025 12:19:40 +0530
Message-ID: <20250127064940.1360404-3-quic_janathot@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250127064940.1360404-1-quic_janathot@quicinc.com>
References: <20250127064940.1360404-1-quic_janathot@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: fLCRApYDpx4g_DKneFfZDGyAWl8-CC59
X-Proofpoint-ORIG-GUID: fLCRApYDpx4g_DKneFfZDGyAWl8-CC59
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-27_02,2025-01-27_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 clxscore=1015
 phishscore=0 lowpriorityscore=0 adultscore=0 spamscore=0 mlxscore=0
 bulkscore=0 priorityscore=1501 mlxlogscore=999 suspectscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501270053

Older boards are having entry "enable-gpios" in dts, we can safely assume
latest boards which are supporting PMU node enrty will support power
sequencer.

Signed-off-by: Janaki Ramaiah Thota <quic_janathot@quicinc.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/bluetooth/hci_qca.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
index 0ac2168f1dc4..d2fd08aceb17 100644
--- a/drivers/bluetooth/hci_qca.c
+++ b/drivers/bluetooth/hci_qca.c
@@ -2359,6 +2359,7 @@ static int qca_serdev_probe(struct serdev_device *serdev)
 	switch (qcadev->btsoc_type) {
 	case QCA_WCN6855:
 	case QCA_WCN7850:
+	case QCA_WCN6750:
 		if (!device_property_present(&serdev->dev, "enable-gpios")) {
 			/*
 			 * Backward compatibility with old DT sources. If the
@@ -2378,7 +2379,6 @@ static int qca_serdev_probe(struct serdev_device *serdev)
 	case QCA_WCN3990:
 	case QCA_WCN3991:
 	case QCA_WCN3998:
-	case QCA_WCN6750:
 		qcadev->bt_power->dev = &serdev->dev;
 		err = qca_init_regulators(qcadev->bt_power, data->vregs,
 					  data->num_vregs);
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project


