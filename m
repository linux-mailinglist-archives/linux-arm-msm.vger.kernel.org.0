Return-Path: <linux-arm-msm+bounces-19450-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 183268BF418
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 May 2024 03:31:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B6241282714
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 May 2024 01:31:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8147ABA38;
	Wed,  8 May 2024 01:31:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="TkLlv5Ep"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8270DDB3;
	Wed,  8 May 2024 01:31:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715131893; cv=none; b=nx9gZUybqmpUsHUsr1j5In6/3MkGFST8t6LJMHf83S66wesRzYsYfIFC9OLQ2XPa9b7KF/mpaJO+YTP8fEYzR7wnZOBKi7m9GrRZBuA8dnFMtePrx1RUf5zy1T3RB8S9+GDv4PXxI1rbOFKChMtiKy8EyD1OLJerccGKmnKY+Qg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715131893; c=relaxed/simple;
	bh=bgJe8CD5Cy5YFMk2bifAmaRqq6gFsp2lDEFW1Q52+gw=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=lT4fnUVxX9p1Bf9xlqb+kbufIqAS0e7cl6mnCiiM6Y6xIjAH4pXBwPfdLYl/K2YboE66kIHT2E92euh4tgDJPF2FBj/FEwIhFl89UblZyO5eNZe3GpQZhPB8ci3HJTg+lXEa+OWwqAOhbxVIbeNrXBr25H5TVlbIACn1lYcJLTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=TkLlv5Ep; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 447LSBS8010568;
	Wed, 8 May 2024 01:31:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding:to:cc; s=qcppdkim1; bh=vuoaFeUU6XssIK
	wTd1WsnfAeKzA349xSXCu9bfOdhjk=; b=TkLlv5EpnI6r73AF6uc74TrSWgTPi6
	qzGwsgmg8+5a4kl6luSrnv7H8bXD7YegMoIU+qOGPfIoXQzVT5rCeC9Ezy451i8E
	bljzC8iMIdT72QXiJgbW5hlHcxzXzzE/YpD84ExknYSCVyXwf0FNuJp5ucdGOM+1
	oKW6i8u6faThBjJ+tJy0oSNHNTGfdoSk92m/iXPe1B1tDYsYYV89W4c8X9wFa9JK
	RvVuHtSXgxjiw62VaYzXKARIRqcK2oDj2AreHfpDEw+z3CBpKgahd3VMG4iE4Vbl
	ZcYBBTbxEB/rwP0g5AF1rV0UOu+cedt9SYVaA5yCDpkFhZQJosKT6aJQ==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xyspggnkx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 08 May 2024 01:31:21 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 4481VKlx024746
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 8 May 2024 01:31:20 GMT
Received: from hu-scheluve-lv.qualcomm.com (10.49.16.6) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 7 May 2024 18:31:11 -0700
From: Sagar Cheluvegowda <quic_scheluve@quicinc.com>
Subject: [PATCH v3 0/2] Mark Ethernet devices on sa8775p as DMA-coherent
Date: Tue, 7 May 2024 18:30:59 -0700
Message-ID: <20240507-mark_ethernet_devices_dma_coherent-v3-0-dbe70d0fa971@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANPVOmYC/5WNyw7CIBQFf8WwFgO3gI+V/2EMoXBriSlVqETT9
 N+lXelOl3OSMzOShNFjIofVSCJmn3wfClTrFbGtCRek3hUmwEAwAZJ2Jl41Di3GgIN25WIxadc
 ZbfsyYhiosopLUe8EV5IU0S1i459L5HQu3Po09PG1NDOf17/0mVNOjWNbKZkQCOp4f3jrg93Yv
 iNzIMOHtGI/SaFIQTR17eyecYBv6TRNb/YNf8ErAQAA
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
X-Proofpoint-GUID: LCz7ZCAEwpLmpQFW6rFbGceAJYCWQs5L
X-Proofpoint-ORIG-GUID: LCz7ZCAEwpLmpQFW6rFbGceAJYCWQs5L
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-07_16,2024-05-06_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 lowpriorityscore=0
 phishscore=0 suspectscore=0 clxscore=1015 bulkscore=0 mlxlogscore=740
 adultscore=0 spamscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2405010000
 definitions=main-2405080009

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

Patch 1 :- This patch marks Ethernet devices on Sa8775p as DMA-coherent
as both the devices are cache coherent.

Patch 2 :- Update the schema of qcom,ethqos to allow specifying Ethernet
devices as "dma-coherent".

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


