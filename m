Return-Path: <linux-arm-msm+bounces-34748-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AA6E89A2311
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Oct 2024 15:08:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DC2181C24887
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Oct 2024 13:08:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E42311DE3B8;
	Thu, 17 Oct 2024 13:07:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ChGbE5UU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC3661DE3AB;
	Thu, 17 Oct 2024 13:07:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729170475; cv=none; b=mj2M8gtuFFvbyOWJtPDxNJ9Xpnc4s8fKO2odPVJfLFcToZs6uP5iTF+ygJFoA+xdhpsx9aPfpzPPkty4EgsENEZnKgchFxoLqMq0ICnzry9XwNhhX7TOH/remQPy3km6WlLs1jJIGVNEx8yDECAyHKpOMOETsfAPkJNPCIIHAyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729170475; c=relaxed/simple;
	bh=MhVTg5KxwCwzqyeJahpO61b0ovtNsDUc+hzw+UMI2RA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bWrgx4b+4VKOwD3Q3FrgYPPJOWgHU6HcIetug9iS1mwYdG9k5Cwx2hTTLg/fEJ36jVfRkXjKZaRIpsLkgediX42f0JWQeRm9DeA5mEV90CxPMBFilol1iT7ax4bsYh7z2zqeoeV+69sfmpvgUxHgVwhPqhMXMBotTxnpCRLQVLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ChGbE5UU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49HB7qm9009851;
	Thu, 17 Oct 2024 13:07:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	c0KYl4wEXxX/poDmDQa25b6Jx9ZOd3qoKvCQ16HM/g0=; b=ChGbE5UUk/jJ0TXN
	ed39UiteNqoGoMNPUqTCmYK1alaDsoBKUAbbIy8TZ1r+eWxUVZlIpveuy25MMQY+
	+6JcfZR/nVBjldEE7oX/FQgNlYdb4O2Vu7kn6GofxLDlZ8n0ibRZMIgcm9VBT8/u
	uyVYQrMc2hFUiWREzbCFKKpXBWIMs1E3w+LhtQuEvNxZYTsDX5mSwkPZ0aTWvyuD
	jPSSONiAtqQnP5XbReK9BICwQjOJaaUAeZLpbu65/LEVaSrOfIdOWY29vIJgBRfU
	Svz0OFWUch7fc5mFn0BpsQxoGRYMRrI3iyxeNzth4MrzgwQqFoY2x/HtS07fXYc6
	yZRk6A==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42ar051uu0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 17 Oct 2024 13:07:40 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49HD7dfn019807
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 17 Oct 2024 13:07:39 GMT
Received: from hu-kriskura-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 17 Oct 2024 06:07:33 -0700
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
        <quic_jackp@quicinc.com>, Krishna Kurapati <quic_kriskura@quicinc.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 3/5] dt-bindings: phy: qcom,msm8998-qmp-usb3-phy: Add support for QCS615
Date: Thu, 17 Oct 2024 18:36:59 +0530
Message-ID: <20241017130701.3301785-4-quic_kriskura@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241017130701.3301785-1-quic_kriskura@quicinc.com>
References: <20241017130701.3301785-1-quic_kriskura@quicinc.com>
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
X-Proofpoint-GUID: vNFtJbibaXwB4DzX4NpfsauhhU-fWGY4
X-Proofpoint-ORIG-GUID: vNFtJbibaXwB4DzX4NpfsauhhU-fWGY4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=876
 clxscore=1015 spamscore=0 suspectscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 mlxscore=0 lowpriorityscore=0 malwarescore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410170090

Update dt-bindings to add QCS615 to QMP Phy list.

Signed-off-by: Krishna Kurapati <quic_kriskura@quicinc.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/phy/qcom,msm8998-qmp-usb3-phy.yaml      | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,msm8998-qmp-usb3-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,msm8998-qmp-usb3-phy.yaml
index f1f4e4f83352..1636285fbe53 100644
--- a/Documentation/devicetree/bindings/phy/qcom,msm8998-qmp-usb3-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,msm8998-qmp-usb3-phy.yaml
@@ -18,6 +18,7 @@ properties:
     enum:
       - qcom,msm8998-qmp-usb3-phy
       - qcom,qcm2290-qmp-usb3-phy
+      - qcom,qcs615-qmp-usb3-phy
       - qcom,sdm660-qmp-usb3-phy
       - qcom,sm6115-qmp-usb3-phy
 
@@ -96,6 +97,7 @@ allOf:
           contains:
             enum:
               - qcom,msm8998-qmp-usb3-phy
+              - qcom,qcs615-qmp-usb3-phy
               - qcom,sdm660-qmp-usb3-phy
     then:
       properties:
-- 
2.34.1


