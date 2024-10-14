Return-Path: <linux-arm-msm+bounces-34257-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BE69299C3DE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Oct 2024 10:45:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 21A8AB24F17
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Oct 2024 08:45:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8EFB5156C5F;
	Mon, 14 Oct 2024 08:45:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="e6r9UL8s"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBADB1553AF;
	Mon, 14 Oct 2024 08:45:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728895507; cv=none; b=hZ7tKmlR/0UpnWLNZELqU8m7iyCCvzxcYBSA4y0k49k5tYd4Bqhoz8a+Or7EebKSwHsHmAAb8UzAN4KtEYV7nUQb4TYuTu6Bo/UZOSNcJYBbn1qfoCwZE4ftV1wic1a1coitK9hfKql56VSZl8HlGQT5uXXMhr9LFvatG8yxdRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728895507; c=relaxed/simple;
	bh=2S923G/Y8yOABmolgremB8IdwnAkYpD7bdg9uCkyBmU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eCiRhKYYD/9GicpyYJ1RIFF39XcqDeiGTDCqcILcBxeswHjLH5QdTNcEcjTwuMdyiqKoj8gVvHYtgp/2Dk45iCvG4ohKG9GuLWZojLPH2RefV3QSW5Q6tqifWM6MzSwFqvTjXgLRmfjXEzNo/bYV+PQ4ei8h7839H8+Zo2nhA+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=e6r9UL8s; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49DN52KP032568;
	Mon, 14 Oct 2024 08:44:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LG8ZnoZ2WF6hQExUSwM1I/ltIow0xA7vHdQQv8f3ILc=; b=e6r9UL8smwVoX67j
	V9SJMs0JG5KkU45rotBf3/2Tx7Dyyxvy0WJelANQ5pKKtfcKz/SqZTLA2QNm07ni
	eY9w6f7QpkIT/uu7odMe44sMNT6aqLsznSwEG9WCqh4gT3xfQveakJJFJeJfi5rE
	4AerPkNVVrdkBCRLmdOXvjlHqu4kG9xWXihvyLVQr4Kkl1+nfatX+y+DSILRY6iz
	c84m3adrN6nyVxY8dDdOFsqHCEijhbqvOeGopTIsgR6gHbzrC2lJilo+P4fjAG4R
	kkaXYJy1iaeEE/nKOOePqizoLn2J7p99cJEpTKSLn09h10pQABO2XEH8OK+zefAz
	XOqoLg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 427g2rkvmr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 14 Oct 2024 08:44:56 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49E8iudN029181
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 14 Oct 2024 08:44:56 GMT
Received: from hu-kriskura-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 14 Oct 2024 01:44:50 -0700
From: Krishna Kurapati <quic_kriskura@quicinc.com>
To: Vinod Koul <vkoul@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Bjorn Andersson <quic_bjorande@quicinc.com>,
        Wesley Cheng
	<quic_wcheng@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        "Dmitry
 Baryshkov" <dmitry.baryshkov@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Manivannan Sadhasivam
	<manivannan.sadhasivam@linaro.org>
CC: <linux-usb@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-phy@lists.infradead.org>, <quic_ppratap@quicinc.com>,
        <quic_jackp@quicinc.com>, Krishna Kurapati <quic_kriskura@quicinc.com>
Subject: [PATCH 1/5] dt-bindings: usb: qcom,dwc3: Add QCS615 to USB DWC3 bindings
Date: Mon, 14 Oct 2024 14:14:28 +0530
Message-ID: <20241014084432.3310114-2-quic_kriskura@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241014084432.3310114-1-quic_kriskura@quicinc.com>
References: <20241014084432.3310114-1-quic_kriskura@quicinc.com>
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
X-Proofpoint-ORIG-GUID: GU6NZIoBMc2ZHQdxcQFJhtbuXDfwyJ3U
X-Proofpoint-GUID: GU6NZIoBMc2ZHQdxcQFJhtbuXDfwyJ3U
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 phishscore=0 malwarescore=0
 clxscore=1015 spamscore=0 adultscore=0 mlxlogscore=420 impostorscore=0
 mlxscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410140063

Update dt-bindings to add primary controller of QCS615 to USB
DWC3 controller list.

Although this controller has a QUSB2 Phy, it belongs to a
generation of SoCs like SDM670/SDM845/SM6350 where DP/DM is
used for wakeup instead of qusb2_phy interrupt.

Signed-off-by: Krishna Kurapati <quic_kriskura@quicinc.com>
---
Patch rebased on top of [1] to avoid conflict:
https://lore.kernel.org/all/20241009195348.2649368-2-quic_kriskura@quicinc.com/

 Documentation/devicetree/bindings/usb/qcom,dwc3.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml b/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
index f7be05641930..76f78ed6ac9b 100644
--- a/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
@@ -26,6 +26,7 @@ properties:
           - qcom,msm8998-dwc3
           - qcom,qcm2290-dwc3
           - qcom,qcs404-dwc3
+          - qcom,qcs615-dwc3
           - qcom,qcs8300-dwc3
           - qcom,qdu1000-dwc3
           - qcom,sa8775p-dwc3
@@ -340,6 +341,7 @@ allOf:
           contains:
             enum:
               - qcom,qcm2290-dwc3
+              - qcom,qcs615-dwc3
               - qcom,sc8180x-dwc3
               - qcom,sc8180x-dwc3-mp
               - qcom,sm6115-dwc3
@@ -467,6 +469,7 @@ allOf:
               - qcom,ipq4019-dwc3
               - qcom,ipq8064-dwc3
               - qcom,msm8994-dwc3
+              - qcom,qcs615-dwc3
               - qcom,qcs8300-dwc3
               - qcom,qdu1000-dwc3
               - qcom,sa8775p-dwc3
-- 
2.34.1


