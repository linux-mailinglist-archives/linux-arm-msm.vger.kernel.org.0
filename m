Return-Path: <linux-arm-msm+bounces-85229-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 42705CBDB90
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Dec 2025 13:11:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 536013067303
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Dec 2025 12:00:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFBDF32F765;
	Mon, 15 Dec 2025 12:00:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="cD/R/DES"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EFFE3271F8;
	Mon, 15 Dec 2025 12:00:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765800030; cv=none; b=mqUpn0bVS4AOizxDU7wg5oOJV+dq6auyU81OgSnoGW6WYX5GdlhmUDH10Gwp45Rho6B6Ar0hIgVZGBZsGIJ8vteiUML0HGiCLHv/k3B3ShMbfsbEdV0ZRBEE9QgbFa0DgiDYP9eoAwdZ/wGWHQH4hOth8fz35wvbBbPlZlhoJc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765800030; c=relaxed/simple;
	bh=k0tbjB2UMIH2CUOVcg0ZdBs1HGpAqF+RzYZ1Xd7fras=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=K0pepT2a28OhoTIxulab7PUlrywNiDd2s8jGkiPNqm1hx1ywwcLj0+LO/EtYVn8FyIhamo5YKxdHHWzF3hsP/QHncI5kYasXYXdTI/DJcMyq+loK/pG+m9jGUar19rWZYF3nZri0EEkhkmQmvhJpsDMVpi8C5EqN4w8e+Y/qDiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=cD/R/DES; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BFAOB8r3698095;
	Mon, 15 Dec 2025 12:00:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=nlCZVGg2oKl
	f5/i0EJK6cBO0sHaOFSxWAM0XP4tym2g=; b=cD/R/DESN8dbA+J4OfvwA7tbEd7
	c6CNMFs2SV5gO4P71kS8it86GuIrOHwpAGLw7k6nXGAQISIUPuNsDyXkDrBt3zTt
	fms7P9Vrixur0u141v5OsnnUbBTig0UJ6GQZrkWY7GR5PDneACbJTXo+h5Hvd5c+
	0IJebq/ic1Vkzs3smSEfDOD83E+tRUgDA9xk+gUOhN+hf+wnjzxQxDtoOL6Hy/Xn
	RxJPxU6fgJA2Y7IQrKN085F7WyMuPpGiFTKt5AHy6oIQ9X7jptkUqCvT5YYbDA5n
	IBPL0oN1OcHF12QFseoxQ0/QWiIXfPc+AfriJ7wW3qTNda3KeXAPDXOe1Iw==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b11afcf3a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 15 Dec 2025 12:00:21 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 5BFC0IDw029053;
	Mon, 15 Dec 2025 12:00:18 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 4b117kxe1x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 15 Dec 2025 12:00:18 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 5BFC0HT6029045;
	Mon, 15 Dec 2025 12:00:17 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-rampraka-hyd.qualcomm.com [10.147.247.88])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 5BFC0HYk029044
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 15 Dec 2025 12:00:17 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 2305851)
	id 912C45CE; Mon, 15 Dec 2025 17:30:16 +0530 (+0530)
From: Ram Prakash Gupta <quic_rampraka@quicinc.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Adrian Hunter <adrian.hunter@intel.com>
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, quic_rampraka@quicinc.com,
        quic_pragalla@quicinc.com, quic_sayalil@quicinc.com,
        quic_nitirawa@quicinc.com, quic_bhaskarv@quicinc.com,
        kernel@oss.qualcomm.com, Sachin Gupta <quic_sachgupt@quicinc.com>
Subject: [PATCH v6 1/5] dt-bindings: mmc: Add dll-presets values for HS400 and HS200 modes
Date: Mon, 15 Dec 2025 17:30:05 +0530
Message-Id: <20251215120009.3877889-2-quic_rampraka@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251215120009.3877889-1-quic_rampraka@quicinc.com>
References: <20251215120009.3877889-1-quic_rampraka@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=TtDrRTXh c=1 sm=1 tr=0 ts=693ff856 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=COk6AnOGAAAA:8
 a=xWJhKr_AvhuFiuhVdFkA:9 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE1MDEwNCBTYWx0ZWRfX+VJd/3FQoY8v
 wZke8LuvmfwuV3gPLpYaClvpei894g1uZpsILPAKAiZtZ8oQGtcChH2VtYGgdPk2FOgOZW9WkDn
 lixC60nohlgT64eoWIpQ3O5pK05uwdODz+x8+RiY1akTTWy+oEjCn6OfVqYra1Q/tkWftx10mQu
 Kw6rcynIX2dW7XhyJXTvra/BLI553/Z0wi+MpKAdv+1kyTN8sJKHO9YexvKEYCVqoqpDuZAplAy
 ZnByJDdEw9bO1slj79SZFEbjYYOjOh9d7NFXATKAtv/UwNTqLDP37JgzQizSy6igG/c8uP+Zds3
 I6TVydP7UHrzfM8t2ksGmSY79DEpK9iTJHpVgsxInELUwTYrSkOqb33KgxSNMauCF/C8HrrNJ7n
 0SZBM/aMD79v9rXcrD/00vQys4v9SA==
X-Proofpoint-GUID: n7quUXZqolJpgv3QgBWlpKG5qcYb44IJ
X-Proofpoint-ORIG-GUID: n7quUXZqolJpgv3QgBWlpKG5qcYb44IJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-15_02,2025-12-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1011 priorityscore=1501 bulkscore=0 adultscore=0
 impostorscore=0 malwarescore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512150104

From: Sachin Gupta <quic_sachgupt@quicinc.com>

Document the 'dll-presets' property for MMC device tree bindings.
The 'dll-presets' property defines the DLL configurations for HS400
and HS200 modes.

QC SoCs can have 0 to 4 SDHCI instances, and each one may need
different tuning.

Signed-off-by: Sachin Gupta <quic_sachgupt@quicinc.com>
Signed-off-by: Ram Prakash Gupta <quic_rampraka@quicinc.com>
---
 Documentation/devicetree/bindings/mmc/sdhci-msm.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml b/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml
index 938be8228d66..a1a16e6e12ce 100644
--- a/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml
+++ b/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml
@@ -140,6 +140,11 @@ properties:
     $ref: /schemas/types.yaml#/definitions/uint32
     description: platform specific settings for DLL_CONFIG reg.
 
+  qcom,dll-presets:
+    maxItems: 10
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    description: platform specific settings for DLL registers.
+
   iommus:
     minItems: 1
     maxItems: 8
-- 
2.34.1


