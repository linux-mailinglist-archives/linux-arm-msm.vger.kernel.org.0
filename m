Return-Path: <linux-arm-msm+bounces-19859-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C9A68C5E46
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 May 2024 02:07:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9FB6B1C2109E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 May 2024 00:07:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4A1F6FC3;
	Wed, 15 May 2024 00:07:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="j/YJOIOG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EF298820;
	Wed, 15 May 2024 00:07:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715731645; cv=none; b=upwhQT0fE3qE9HUYug9jPxHjskat0mJxHUiAzRwVvBSOmKau+BovXL0nX+Y6cAv2cCi9k7XyJkU9oKyFQcMlXUqUgz5qv9N23YXz7eQQ0HJL+95GdFtY+FdvZ4FRecvgbJQfyyptmp7bhSli7dMoWVXdQRprIYl72PoE638yUq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715731645; c=relaxed/simple;
	bh=1OXOg34L1azrrCqbLWpmksyjolrQtUwvDXNTDqYdfuk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=gewJNoxTGYwuqc3Jv5YaDyshNjAdl+264udwaVw1ZsCdLom4lcdzyX3Z7BGdy4vV9liuXmUF/talLS/AcywzA03/BfGUKbIqA9azlIv7P3rLJpTLpn6wETAmIpjOZ+1Zxxu2pN2ZYX/32jDDonXfgy/Nq+OmXiC7kpTrGqufxCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=j/YJOIOG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44EIAKL5018893;
	Wed, 15 May 2024 00:07:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:date:subject:mime-version:content-type
	:content-transfer-encoding:message-id:references:in-reply-to:to
	:cc; s=qcppdkim1; bh=Zuf8MeB0YgEfccokVdG68chZuS0XsWWwWk0xbLYUaAU
	=; b=j/YJOIOGuKkXWvPToSAOhR6gyo32AtPODjqPyJC9U1FG29VhDNh3WGc/HfH
	/9XpjD22y03mELeorU+PWVtYb5u01PYSCRtwJFfSrg5ODiAqZs2LFF1BS4RtFAD4
	2aiDcqYdZf9gKgWXeDZjyXNyr0FHwzEmTbM7o6S+7w4MUFaC3i7J8D4wMXMRRAX6
	NQR0dAGGs/Q6w5O4+J5wzg6aeAQfvG9D+Csq5VLDaxpv0zqOe1DNxDmrevgCeGq1
	xyqMlkuYmSBJdsobQq3NmU4T5L68sVGwlyGoxq9xE+FdxdybZNMQ0VC9lZSzK8G4
	BFTz5e9bGHQFlxO9mSgUfdbTVHA==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y20w1yng3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 May 2024 00:07:06 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44F075Qm009777
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 May 2024 00:07:05 GMT
Received: from hu-scheluve-lv.qualcomm.com (10.49.16.6) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 14 May 2024 17:07:02 -0700
From: Sagar Cheluvegowda <quic_scheluve@quicinc.com>
Date: Tue, 14 May 2024 17:06:52 -0700
Subject: [PATCH v4 2/2] dt-bindings: net: qcom: ethernet: Allow
 dma-coherent
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240514-mark_ethernet_devices_dma_coherent-v4-2-04e1198858c5@quicinc.com>
References: <20240514-mark_ethernet_devices_dma_coherent-v4-0-04e1198858c5@quicinc.com>
In-Reply-To: <20240514-mark_ethernet_devices_dma_coherent-v4-0-04e1198858c5@quicinc.com>
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
X-Proofpoint-ORIG-GUID: y4JzAQlR35ZrEb5eEIfrtZDkBKHyEwvg
X-Proofpoint-GUID: y4JzAQlR35ZrEb5eEIfrtZDkBKHyEwvg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-14_15,2024-05-14_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 mlxlogscore=702 mlxscore=0 phishscore=0 adultscore=0 suspectscore=0
 clxscore=1015 priorityscore=1501 bulkscore=0 spamscore=0
 lowpriorityscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2405010000 definitions=main-2405140175

On SA8775P, Ethernet DMA controller is coherent with the CPU.
allow specifying that.

Signed-off-by: Sagar Cheluvegowda <quic_scheluve@quicinc.com>
---
 Documentation/devicetree/bindings/net/qcom,ethqos.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/qcom,ethqos.yaml b/Documentation/devicetree/bindings/net/qcom,ethqos.yaml
index 69a337c7e345..6672327358bc 100644
--- a/Documentation/devicetree/bindings/net/qcom,ethqos.yaml
+++ b/Documentation/devicetree/bindings/net/qcom,ethqos.yaml
@@ -61,6 +61,8 @@ properties:
   iommus:
     maxItems: 1
 
+  dma-coherent: true
+
   phys: true
 
   phy-names:

-- 
2.34.1


