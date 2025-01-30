Return-Path: <linux-arm-msm+bounces-46586-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 123A7A233DA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Jan 2025 19:36:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A05D47A1F44
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Jan 2025 18:35:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CE9B1F152B;
	Thu, 30 Jan 2025 18:35:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Yroobcci"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7434D1F1511;
	Thu, 30 Jan 2025 18:35:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738262136; cv=none; b=QJGf0weeFadfwACJu2CQml9or84kqIQHJq6pTnF80kcdMPLslsh9gOBtBYwj2Jqt7HDjnL7HApQbIWAcRNVBVS1OGoGNRjQIgdZhErYwhW3mhJte6CEfXsGbFNCt0Q50nrq9S8aywUD584htAW92rTkJC34gOOcJoWRC/Kmo/Xs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738262136; c=relaxed/simple;
	bh=72ypbfAx4aTzaSq8RsBOyaCCNNmiJx6es43r+SBSDig=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WAHStPTpUgWe2dLy9MuMR3XhM8ZvW8azKA/DKGdrz4zTaFxUlPxLZdtX5zqDWbdxsS00xpvny5QwiVOlH9g4VO+smnsST3K4iGTLYj8XCJiDPnrz9M1kY4knMjfWYqAmbb5+czV253mkVpAEcOSZi9Eh8BTaA+KcdGbdplss8Nc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Yroobcci; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50UHovF9008483;
	Thu, 30 Jan 2025 18:35:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QjehGn6pM3+5o3M2ZHJw+kez+uzfsB/kjouEUHNTGOg=; b=YroobcciUXp7R+eW
	5G6kDDwGxrNmB7nM2E5aoiUyBh+RUjGajdgl4J1vz78YGJM8DEc7GdALq3swFSgj
	dUNFhM8jcN9YNGFDPrM+hTNNqM69WGLUjiV9l6bE/iLCuMiqNYF7USpW6CeHm+In
	aGcfj1c1WooaQ2t0zI3Go86wSkm050w2RZRhc+tpypEObrcOxu7DAqFWfw+jzRwG
	BckYrHYzF9OVXr7Oijw0mUumLEUHWYoooBAPfbXS/PeQHqIGQPoE7BffTFc380/W
	HwWFh/eujz6hlNrazukaUSiCLyB7QPZg0WCvOH8njZonHMnobK8DK0UVXU4MmJF8
	ta34kw==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44ge6b042d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 30 Jan 2025 18:35:28 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50UIZRlo017739
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 30 Jan 2025 18:35:27 GMT
Received: from hu-janathot-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 30 Jan 2025 10:35:22 -0800
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
Subject: [PATCH v9 2/2] Bluetooth: hci_qca: use the power sequencer for wcn6750
Date: Fri, 31 Jan 2025 00:04:34 +0530
Message-ID: <20250130183434.2394058-3-quic_janathot@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250130183434.2394058-1-quic_janathot@quicinc.com>
References: <20250130183434.2394058-1-quic_janathot@quicinc.com>
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
X-Proofpoint-GUID: HiTambVLdqiiwk_F7qhUEYCxzx8QdonO
X-Proofpoint-ORIG-GUID: HiTambVLdqiiwk_F7qhUEYCxzx8QdonO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-30_08,2025-01-30_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 adultscore=0
 lowpriorityscore=0 bulkscore=0 mlxscore=0 phishscore=0 suspectscore=0
 clxscore=1015 impostorscore=0 priorityscore=1501 mlxlogscore=999
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501300141

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


