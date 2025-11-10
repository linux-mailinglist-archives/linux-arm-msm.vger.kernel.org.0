Return-Path: <linux-arm-msm+bounces-81000-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 49A24C4669F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Nov 2025 12:58:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 49BCD4E5CF7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Nov 2025 11:58:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 688FD30C609;
	Mon, 10 Nov 2025 11:58:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="fCNdzsY5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4852306B20;
	Mon, 10 Nov 2025 11:58:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762775907; cv=none; b=r285kuUgWYqWU09zGGqBgaUWZnZIFhS7frAjjL/wGY97CswbDaBhhNExgv5v2g22c9kemF54TCsV92GOiaEjiVtTe69uWYmf/vIwaM6rh2vCRn7nrM7UlXWmMQD9f5mFT7c9KYh/NmKLzzWqt/wXa0mBnywdSiw5x0dhNXHpmjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762775907; c=relaxed/simple;
	bh=lDww4Mnlv3WJnSTL8qGStuWtMofjM/ACCSeJGbN3x+g=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VTCaqjp/F3dU9qPHw5GXkvkGTOS+85+kqMMHxc1zLA6+rHuWftoXtek6iCy0DGmMdOCCTIs2HiBswfJ+wVZninWes3RawRLAF0G5KfbVFxwhfApL8SXPzevCAocXbYX8LZgZ3zAXbf7tO/Jm+c3BhusWf3kQHCoHk0I+//mMso4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=fCNdzsY5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AA7hKeN2861400;
	Mon, 10 Nov 2025 11:58:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QOsuzTkcwCc31WhhHIsQvafQymL7TXCGhP58LqW2jIA=; b=fCNdzsY57ewGXTie
	6KlTIkhOim/P9/t6lFGY3XkD+RqPNgToBfg7RsP6egNDlWzaWjE8Z6UESJ+iAS80
	mu1QPMhjVKegfD2jwfaaZ46r5U2eT06PTThRs0/ljyx4emXl+GpmX7PGk0f4SDyX
	o1LDg0CLNre00lkRfNz/2zjEsJHloA3AiS0TGHDRzdy6b8cl+B9Pnhi91ImxbuF9
	dIWScYYiMHUI52NVhgJYVpHmYKAoBIg9XKiq6TASjP4PjRr2UK8U3jxbePfBxyE2
	meJaYXVO41r1FrOnypczWS/eOllqbiis36tgGNa4d1jr9rsxQw4rSPG4O6u0B4ul
	RaG6iA==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4abbwe0u90-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Nov 2025 11:58:20 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 5AABwHIw023617;
	Mon, 10 Nov 2025 11:58:17 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 4a9xxkqehn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Nov 2025 11:58:16 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 5AABwGx8023611;
	Mon, 10 Nov 2025 11:58:16 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-amitsi-hyd.qualcomm.com [10.213.97.115])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 5AABwGcW023610
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Nov 2025 11:58:16 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 4648853)
	id 1653E5A8; Mon, 10 Nov 2025 17:28:16 +0530 (+0530)
From: Amit Singh <quic_amitsi@quicinc.com>
To: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, vkoul@kernel.org,
        kishon@kernel.org, lumag@kernel.org, neil.armstrong@linaro.org,
        quic_wcheng@quicinc.com
Cc: Amit Singh <quic_amitsi@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_riteshk@quicinc.com,
        quic_rajeevny@quicinc.com, quic_vproddut@quicinc.com
Subject: [PATCH 1/3] dt-bindings: phy: qcom: qmp-combo: add support for vdda-aux regulator
Date: Mon, 10 Nov 2025 17:28:04 +0530
Message-Id: <20251110115806.2379442-2-quic_amitsi@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251110115806.2379442-1-quic_amitsi@quicinc.com>
References: <20251110115806.2379442-1-quic_amitsi@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: XHMpZY9qKoYTVJeDZLIVaJVH__iwJjFl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEwMDEwNCBTYWx0ZWRfX+vl8MbgflgeU
 vtbYMpzUUWuwR6Fhc4VIIjdxk4iXOcnEAVUI32EZJPm7VcIXdWj0xOZzf6ty/t7xWySRgd1TKjw
 WiR43ZBEzQGRHe6T8jRjoNUjeAp9xZTWzPl/0yzbDMWWfJJv6CPARGCmttVzJ3cEYHOWUG11f1k
 WT4VBEGiORzson/AhHg0ppF6oTwKvsHBXsHZNesuDzoFPvLN+60t1iEPsf1h4HhJ0TfqfWo6Ymo
 It7P/RZQkNhaNw+xS9xPWfqgwrcvJsMDxGwaR02WozcDIOKoHksYtpNfj9Z48js+jfuf3TeiaHx
 X3QHdhhCi6Ug532EyAmQE7I67WVLrGVlstBbX+URCQFFavoqoH/rbHCv5cIAmfB2Ni8AoCx903h
 /aDDe433LC5UPVYetH34zLjFJi20og==
X-Authority-Analysis: v=2.4 cv=GbEaXAXL c=1 sm=1 tr=0 ts=6911d35c cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=COk6AnOGAAAA:8 a=8IMiPDtIn6OAJiDpRukA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-ORIG-GUID: XHMpZY9qKoYTVJeDZLIVaJVH__iwJjFl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-10_04,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 malwarescore=0 priorityscore=1501 phishscore=0 bulkscore=0
 spamscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511100104

Add support for the "vdda-aux" regulator in the QMP PHY binding, with
an enable_load of 36000 µA. Managing this auxiliary rail in the driver
allows proper power configuration on platforms that provide the supply,
improving PHY stability.

This change is a no-op on platforms that do not define the "vdda-aux"
regulator.

Signed-off-by: Amit Singh <quic_amitsi@quicinc.com>
---
 .../devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml  | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
index c8bc512df08b..9a9051735314 100644
--- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
@@ -59,6 +59,8 @@ properties:
       - const: phy
       - const: common
 
+  vdda-aux-supply: true
+
   vdda-phy-supply: true
 
   vdda-pll-supply: true
-- 
2.34.1


