Return-Path: <linux-arm-msm+bounces-11243-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B40648572FC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Feb 2024 02:00:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E70911C23E11
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Feb 2024 01:00:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89817FC02;
	Fri, 16 Feb 2024 00:58:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="g8JoSU3v"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6A92101F2;
	Fri, 16 Feb 2024 00:58:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708045106; cv=none; b=mSjfxOyMc7gbd91885keJTL5ui4aLSKHV8802eqPK8GXRzMqFUfwkpW4o0cECOY6XDvhkzs+ePKIV2C7AUP8WnRXpr0CzNzwSE9jAHSnUwtk6Nb7xhB1aYPD9bPbRIm+rIMprfOVH6HArCnN1OTv9s/tPJvxVDoQVaavSpQs8IQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708045106; c=relaxed/simple;
	bh=+FHTzMPvcBFqv6hXNbrLYRqf9gzczSAiwGKhskbBq4g=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OxIIEQiUKRkVVmyCeqBztHXB9b/5A/hD454YRVjlNIilJ9QC6HzyCqhgl+aAi3K0hzKPeFDjoun3UieXPNinkTUdoXg67smJULV0RmM6s3eZdcYKn1qvyTVGQvtn6deP3Za/eNK2GIKoqBmVV0ewPIhUOmk9Cnk+IILHtb8oFHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=g8JoSU3v; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 41G0qqwI028571;
	Fri, 16 Feb 2024 00:58:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	qcppdkim1; bh=Jh7LJPtX8sh+l/GamBSdN8eW6DrgVzRQ8J5c8odtMNA=; b=g8
	JoSU3vQEW7Dho0YDaH21lmWrwJTY0hQgwXemlxj5Phw6q2MiuGVl09/v/uaRVnuI
	2EXFUy1Z69yr36hXL9H70Wv9qrU+MD3n6hHUGut8DwuHj3iZPN/F+qnG4ovo1YCY
	AVcgQ9F0ExxLzE1pgOxltx8L9ydx5Xn+F765NNHLrfOlBUVo1D+R3mr3qk/pn92l
	nthkjqX67fIp+nds+6zyWNMRYhDCaLGS5DHUOozNUFskRaJ9SPKlt3rxpMkTv9QB
	rcs8rr4A8bIeYsI2fLMqIMo9aEajrK9CfovJ+At2nYf3SpoAYK3cNrWRUrr4vw3e
	zQBMCq77Sd3hhH4VLBpQ==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3w9qbc0vkm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 Feb 2024 00:58:19 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 41G0wJbm019307
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 Feb 2024 00:58:19 GMT
Received: from hu-kriskura-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Thu, 15 Feb 2024 16:58:14 -0800
From: Krishna Kurapati <quic_kriskura@quicinc.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring
	<robh+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Wesley Cheng
	<quic_wcheng@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        "Greg
 Kroah-Hartman" <gregkh@linuxfoundation.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Felipe Balbi
	<balbi@kernel.org>, Johan Hovold <johan@kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-usb@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <quic_ppratap@quicinc.com>, <quic_jackp@quicinc.com>,
        Krishna Kurapati
	<quic_kriskura@quicinc.com>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v15 1/9] dt-bindings: usb: Add bindings for multiport properties on DWC3 controller
Date: Fri, 16 Feb 2024 06:27:48 +0530
Message-ID: <20240216005756.762712-2-quic_kriskura@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240216005756.762712-1-quic_kriskura@quicinc.com>
References: <20240216005756.762712-1-quic_kriskura@quicinc.com>
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
X-Proofpoint-GUID: gUx38HbSIx0XdlIbx4i6N6RxVLCJIGju
X-Proofpoint-ORIG-GUID: gUx38HbSIx0XdlIbx4i6N6RxVLCJIGju
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-15_24,2024-02-14_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxlogscore=999
 spamscore=0 adultscore=0 impostorscore=0 suspectscore=0 bulkscore=0
 malwarescore=0 phishscore=0 mlxscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401310000 definitions=main-2402160006

Add bindings to indicate properties required to support multiport
on Synopsys DWC3 controller.

Signed-off-by: Krishna Kurapati <quic_kriskura@quicinc.com>
Reviewed-by: Bjorn Andersson <andersson@kernel.org>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/usb/snps,dwc3.yaml          | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/snps,dwc3.yaml b/Documentation/devicetree/bindings/usb/snps,dwc3.yaml
index 8f5d250070c7..9227e200bcab 100644
--- a/Documentation/devicetree/bindings/usb/snps,dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/snps,dwc3.yaml
@@ -85,15 +85,16 @@ properties:
 
   phys:
     minItems: 1
-    maxItems: 2
+    maxItems: 8
 
   phy-names:
     minItems: 1
-    maxItems: 2
-    items:
-      enum:
-        - usb2-phy
-        - usb3-phy
+    maxItems: 8
+    oneOf:
+      - items:
+          enum: [ usb2-phy, usb3-phy ]
+      - items:
+          pattern: "^usb[23]-[0-3]$"
 
   power-domains:
     description:
-- 
2.34.1


