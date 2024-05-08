Return-Path: <linux-arm-msm+bounces-19449-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CA9938BF417
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 May 2024 03:31:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 35471B212A9
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 May 2024 01:31:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32AACAD51;
	Wed,  8 May 2024 01:31:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Z7tGFu29"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8392DDCB;
	Wed,  8 May 2024 01:31:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715131893; cv=none; b=X5BHhPY+hWjakorY31UXIuo4qusrU0EnSLiOlHQFpq5G3KLEUNoXA5x0Hi/MUMKegV1ymU/Rgw5zXXx5iltjrBA8RLivfnO79Afocq1tyW/qlbF7QACYRDCQfhBkbKE+qmhhOBhIXEGJ13TYrFCgzDFRdmGcm4Pttiguhp3fqOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715131893; c=relaxed/simple;
	bh=a85YE09jCnC4vp5a+eWmz0ilTRgT1T3FHBUWY9ktg3E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=eLRIKqbjW4wqgp5xjwBMZGopEYNg0ywsc2EVyKjECxZKh1P9/KrgiaRigtBNCQ/y1VcYYFjUJo+ohP1Ltj8QpjS7+H5VkZV+pNkifEzUOxBYMjyh6qNze64wHjc1uc2FA7U3p9UdtPp/tNyveZi6B/B1eNEkz2MA8BE3cqMiWbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Z7tGFu29; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4480WG5H003762;
	Wed, 8 May 2024 01:31:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:date:subject:mime-version:content-type
	:content-transfer-encoding:message-id:references:in-reply-to:to
	:cc; s=qcppdkim1; bh=Cm0GFSAT7Pj661XFsByeZeL4jp2pj7WY1d5NO7wgNBk
	=; b=Z7tGFu29pDdzxoOxNOhsOxBlwqyCHvPXgXH0lstGueQjzt26t8XAczTRRoP
	sYZAsUi43UTdUHNQHwl6fxYMsywezTvWLgR+0C53bBuftIs/QJl9a/28lZ0Seiv0
	l0c05VXB6DoxAXV2q2mTtNkorHAqmSyLL0t7Tj7Hvbl12d1huIC7LlQQjexrYxFM
	Z7ej1TPAcgqcN3917G/oj0OZTzZWJXOjxQP9jYCwzVgcVErFF8rpqlce3B86CjiE
	/s5lxXttNMDHfd72vRqWgKU0or6qvnOP+Erp3g1Y0ljPQ4+HiJLSXPj6/DaUzj8H
	WEJUxW/BeT2FQeVeN4Vub34FgEw==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xysph0nra-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 08 May 2024 01:31:21 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 4481VKm1024746
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 8 May 2024 01:31:20 GMT
Received: from hu-scheluve-lv.qualcomm.com (10.49.16.6) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 7 May 2024 18:31:12 -0700
From: Sagar Cheluvegowda <quic_scheluve@quicinc.com>
Date: Tue, 7 May 2024 18:31:01 -0700
Subject: [PATCH v3 2/2] dt-bindings: net: qcom: ethernet: Allow
 dma-coherent
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240507-mark_ethernet_devices_dma_coherent-v3-2-dbe70d0fa971@quicinc.com>
References: <20240507-mark_ethernet_devices_dma_coherent-v3-0-dbe70d0fa971@quicinc.com>
In-Reply-To: <20240507-mark_ethernet_devices_dma_coherent-v3-0-dbe70d0fa971@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konrad.dybcio@linaro.org>,
        Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Bartosz
 Golaszewski" <bartosz.golaszewski@linaro.org>,
        Andrew Halaney
	<ahalaney@redhat.com>, Vinod Koul <vkoul@kernel.org>,
        "David S. Miller"
	<davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski
	<kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Bhupesh Sharma
	<bhupesh.sharma@linaro.org>
CC: <kernel@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <netdev@vger.kernel.org>,
        Sagar Cheluvegowda <quic_scheluve@quicinc.com>
X-Mailer: b4 0.13.0
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: gDhp96LEdGblpd6Ze3irKuBAFf2ZBBK4
X-Proofpoint-GUID: gDhp96LEdGblpd6Ze3irKuBAFf2ZBBK4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-07_16,2024-05-06_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=731
 impostorscore=0 priorityscore=1501 bulkscore=0 phishscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 adultscore=0
 suspectscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405010000 definitions=main-2405080009

On SA8775P, Ethernet DMA controller is coherent with the CPU.
allow specifying that.

Signed-off-by: Sagar Cheluvegowda <quic_scheluve@quicinc.com>
---
 Documentation/devicetree/bindings/net/qcom,ethqos.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/qcom,ethqos.yaml b/Documentation/devicetree/bindings/net/qcom,ethqos.yaml
index 69a337c7e345..44028987ef92 100644
--- a/Documentation/devicetree/bindings/net/qcom,ethqos.yaml
+++ b/Documentation/devicetree/bindings/net/qcom,ethqos.yaml
@@ -66,6 +66,8 @@ properties:
   phy-names:
     const: serdes
 
+  dma-coherent: true
+
 required:
   - compatible
   - clocks

-- 
2.34.1


