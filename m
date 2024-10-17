Return-Path: <linux-arm-msm+bounces-34690-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 671AC9A19AB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Oct 2024 06:24:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1D2551F25070
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Oct 2024 04:24:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFAD21779BA;
	Thu, 17 Oct 2024 04:24:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="CobKt4e/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 561C17346F;
	Thu, 17 Oct 2024 04:24:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729139043; cv=none; b=DWTEtFoaq5YyRaKjJFB492Jg+Pa1QUdwemsw4rYXrj6dlUSGzswjtHWU4/uKnEZnF3OyooGXFJWKnW/HlxX7MUBZ5Qll0D6tgLunYF4G1xm+Fjzm4p7hJ/HiMtRWfjCgTHtHNuGVPSurZru22zhDggRTHL7fBe1S7CgFlozkbWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729139043; c=relaxed/simple;
	bh=CXUDrA4E0TtVKt3mB1wwaR5M7UiuJ+LpVifebbI1aUU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BOQeEhg9Z8uN6viv1oPcarRGARsWaa89T4iu0OFcc8HynGkDfY0N3Rts1mvxbcxQp6LXRlmMt3ezuDxUBOz3rKXYS8MPr7W9RSrP+iCxZBjYLzlOsv6ccEgqPryGFDzKaH8ZY7aGUljzVY3HjX6jgjFSHeA2SSI8byWs0gBHY6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=CobKt4e/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49GFQ51p024266;
	Thu, 17 Oct 2024 04:23:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yusSvMeUgk17n7+pYAaRUtT07O+8JgiNlU00MmOBmTU=; b=CobKt4e/5qSOdHHe
	IVnUIg74+ptYls759O1CnDXqcYlDhOKpqRZL77w0yk1hwCcNnSQUVMOsVLk7z5kO
	DAh9iiIOAG0xnYH1XoD6SiL+YHcg24DQCvod0LpTAUqxX8YUbeyGoIowBY70bi+g
	/+uOGhvKjDFFLaKk6u2NSTqRCAnaOj6dT6ERFJ+9sKyW/LZd+4RSi1JBujAkc88z
	OFfBSdcxWcqho17s8fP31dTtBdkeAu+9unY4OiNJZ18THHI1D2LDmehBdnC6QRlc
	lHbxKp0c4NOJljFUFpp5BcwbkU48fR0j6+lvilxrp/Wv3sphh8iKOZK18gxcCSqB
	ra7SDg==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 429xdbd1dc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 17 Oct 2024 04:23:50 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49H4NnOM004757
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 17 Oct 2024 04:23:49 GMT
Received: from liuxin-gv.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 16 Oct 2024 21:23:43 -0700
From: Xin Liu <quic_liuxin@quicinc.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam
	<manivannan.sadhasivam@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
CC: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        Bart Van Assche <bvanassche@acm.org>, Andy Gross <agross@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-phy@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-scsi@vger.kernel.org>, <quic_jiegan@quicinc.com>,
        <quic_aiquny@quicinc.com>, <quic_tingweiz@quicinc.com>,
        <quic_sayalil@quicinc.com>
Subject: [PATCH v1 2/4] dt-bindings: ufs: qcom: Add UFS Host Controller for QCS615
Date: Thu, 17 Oct 2024 12:22:58 +0800
Message-ID: <20241017042300.872963-3-quic_liuxin@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241017042300.872963-1-quic_liuxin@quicinc.com>
References: <20241017042300.872963-1-quic_liuxin@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: IIznx4vubjnm93RoztwDlXrTuvFkWBSs
X-Proofpoint-GUID: IIznx4vubjnm93RoztwDlXrTuvFkWBSs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 priorityscore=1501 lowpriorityscore=0 mlxlogscore=946 impostorscore=0
 phishscore=0 clxscore=1015 adultscore=0 mlxscore=0 malwarescore=0
 bulkscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410170028

From: Sayali Lokhande <quic_sayalil@quicinc.com>	
	
Document the Universal Flash Storage(UFS) Host Controller on the Qualcomm
QCS615 Platform.

Signed-off-by: Sayali Lokhande <quic_sayalil@quicinc.com>
Co-developed-by: Xin Liu <quic_liuxin@quicinc.com>
Signed-off-by: Xin Liu <quic_liuxin@quicinc.com>
---
 Documentation/devicetree/bindings/ufs/qcom,ufs.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/ufs/qcom,ufs.yaml b/Documentation/devicetree/bindings/ufs/qcom,ufs.yaml
index cde334e3206b..a03fff5df5ef 100644
--- a/Documentation/devicetree/bindings/ufs/qcom,ufs.yaml
+++ b/Documentation/devicetree/bindings/ufs/qcom,ufs.yaml
@@ -26,6 +26,7 @@ properties:
           - qcom,msm8994-ufshc
           - qcom,msm8996-ufshc
           - qcom,msm8998-ufshc
+          - qcom,qcs615-ufshc
           - qcom,qcs8300-ufshc
           - qcom,sa8775p-ufshc
           - qcom,sc7180-ufshc
@@ -243,6 +244,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,qcs615-ufshc
               - qcom,sm6115-ufshc
               - qcom,sm6125-ufshc
     then:
-- 
2.34.1


