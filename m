Return-Path: <linux-arm-msm+bounces-19857-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CFD818C5E3E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 May 2024 02:07:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0921F1C20EF8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 May 2024 00:07:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED3F2370;
	Wed, 15 May 2024 00:07:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="itfJn235"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 434B918E;
	Wed, 15 May 2024 00:07:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715731635; cv=none; b=LZVifuyawXCu84lwTok3oi3ExFPIlNjekZQuKIYUqiKopP0qBKimB98gfwBdxSiMLzdqAzXAQ+SdmBet460CT/j4uQAc8ffkV830l9hHlRvvKxUGoFD2RVYdqUWYbUC6vVMO43LSOkCMa96pHpecNWjhFsOB70ORioqRX2DVfFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715731635; c=relaxed/simple;
	bh=uZgigqWgMiMR7pb9ck+tWcg2jykVEv0lKxhnXO+Nfro=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=FwZb1QEYH+UTOOtFSOcQwd73KU4IPsELxpCRs6GBh/xNeqKaX9spuQ+a6Uri6+UszFOHRuxvSeqM3YK0cbtC5kyUI8TbsJxPhG12b7ebHKOz+5tlwHCOv290e02p0rQqkxb1j0A7t3m/Paf0sTBHvnOV51zv6c9fU/9Q9z/dX9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=itfJn235; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44EM8uKs025678;
	Wed, 15 May 2024 00:07:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding:to:cc; s=qcppdkim1; bh=86iQ0AJCZ895ZA
	iaUY0UrRJJ9zna1hvUruMWQpGm6yk=; b=itfJn235ahoxFbJXO0rSNrRlox2wAC
	X2UKMqscBmFzIRfmA7hrbV9/fUAM48znIbmO37U1HPO9DXErCnU3txnnXCnH5Ofu
	AdP4o8ikF2txAFqiVPX1lddJxExeVx+5MQYH0rpaUSdSeJfVpoCP3ZaKAgGJTdNA
	bqkKYp17cm9DJJbRa1OR1TmrUMHjsD4yovUw3vGyR2o/yTYPAqi79j4bVukjI4Ad
	QM27ERIcNdgxHfi3n2wtRwQ5q+O1yOCL5ZYuz950J4f4V54/U4QTZ0qgescmdKGd
	iGag5+cm88zxWIOA4HuL+Fbl4t+ef3L8XMM7jVfUFZv55my6ehIY07pA==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y3x51jq74-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 May 2024 00:07:05 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44F074ZG006235
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 May 2024 00:07:04 GMT
Received: from hu-scheluve-lv.qualcomm.com (10.49.16.6) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 14 May 2024 17:07:01 -0700
From: Sagar Cheluvegowda <quic_scheluve@quicinc.com>
Subject: [PATCH v4 0/2] Mark Ethernet devices on sa8775p as DMA-coherent
Date: Tue, 14 May 2024 17:06:50 -0700
Message-ID: <20240514-mark_ethernet_devices_dma_coherent-v4-0-04e1198858c5@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJr8Q2YC/5XNQQ6CMBQE0KuYrq35/bSgrryHMaS0H2kMRVskG
 sPdrWzUuMHlTDJvHixScBTZdvFggQYXXedTkMsFM432R+LOpswQUIJExVsdTiX1DQVPfWnTxFA
 sbatL06WSfM9zkwslq7UUuWIJOgeq3W062R9Sblzsu3CfPgfxav/iB8EF1xYKpUBKwnx3uTrjv
 FmZrmWvgwE/0AxmoZhQlHVVWbMBgfiLZm9UQTELzThwW1EBFmq9KcQ3Oo7jE325jJCAAQAA
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
X-Proofpoint-GUID: 6XDCpCsxfko5DjPyFjCAH0CSDR9sgPiA
X-Proofpoint-ORIG-GUID: 6XDCpCsxfko5DjPyFjCAH0CSDR9sgPiA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-14_15,2024-05-14_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 suspectscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 phishscore=0
 mlxscore=0 impostorscore=0 adultscore=0 clxscore=1015 mlxlogscore=736
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405010000 definitions=main-2405140175

To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
To: Andrew Halaney <ahalaney@redhat.com>
To: Vinod Koul <vkoul@kernel.org>
To: David S. Miller <davem@davemloft.net>
To: Eric Dumazet <edumazet@google.com>
To: Jakub Kicinski <kuba@kernel.org>
To: Paolo Abeni <pabeni@redhat.com>
To: Bhupesh Sharma <bhupesh.sharma@linaro.org>
Cc: kernel@quicinc.com
Cc: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: netdev@vger.kernel.org

Changes in v4:
Move "dma-coherent" property within qcom,ethqos.yaml file next to "iommu" property.
- Link to v3: https://lore.kernel.org/r/20240507-mark_ethernet_devices_dma_coherent-v3-0-dbe70d0fa971@quicinc.com

Changes in v3:
Update the schema to specify Ethernet devices as "dma-coherent".
- Link: https://lore.kernel.org/r/20240425-mark_ethernet_devices_dma_coherent-v1-1-ad0755044e26@quicinc.com

Changes in v2:
Remove internal change-id from commit message
- Link to v1: https://lore.kernel.org/r/20240425-mark_ethernet_devices_dma_coherent-v1-1-ad0755044e26@quicinc.com

---
---
Sagar Cheluvegowda (2):
      arm64: dts: qcom: sa8775p: mark ethernet devices as DMA-coherent
      dt-bindings: net: qcom: ethernet: Allow dma-coherent

 Documentation/devicetree/bindings/net/qcom,ethqos.yaml | 2 ++
 arch/arm64/boot/dts/qcom/sa8775p.dtsi                  | 2 ++
 2 files changed, 4 insertions(+)
---
base-commit: a93289b830ce783955b22fbe5d1274a464c05acf
change-id: 20240425-mark_ethernet_devices_dma_coherent-6c6154b84165

Best regards,
-- 
Sagar Cheluvegowda <quic_scheluve@quicinc.com>


