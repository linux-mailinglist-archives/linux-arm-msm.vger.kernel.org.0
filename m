Return-Path: <linux-arm-msm+bounces-32063-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C2C897D44B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Sep 2024 12:38:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5F8CD1C21F16
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Sep 2024 10:38:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18B4013D8A0;
	Fri, 20 Sep 2024 10:38:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="IJHzgpAq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8700213D521;
	Fri, 20 Sep 2024 10:38:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726828717; cv=none; b=jTAVHGRtM/qtCUz83S9JnKQbNq69uaIiMHC2t4ltWQvtX3PuwZPU3mvvYVF6hiWHpFpUa/kFsL5AR0oKrtxdCJuVILIy76dZWqlSQehL/XT+y/OLt+CPcJ6StiX/z1sOEKGVVu9Ts4QpH+0V14yHrJl69u/ybsaV+nhJFieW3FI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726828717; c=relaxed/simple;
	bh=Hwtzbub2ntDdKEfbMPO5Ji3+Y5tNYxCuDBbUSwCrd2g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=UbdV2vCfI7TRu5/c/lwJFaF3Pwk87qMb+09CR1QpFcmtwnXQDCYQHp4LgVPbd1ripORW2KLoDXotIJeX5OuZmx4vBuP5IVPfVo3XvN7IwmdTOU0eYZ2ROCYz68+Nv8jUE/DDMRNqne3k+ycC1PZbB9z8hFySMkWbsRn95LHP3qU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=IJHzgpAq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48K84YkA005788;
	Fri, 20 Sep 2024 10:38:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6HLYNKxgBPo7ItrMnq41vWOp+tKN6sonc8ib2J4NcXY=; b=IJHzgpAq5i4fOR6V
	sIx+2rPoheXEl9EcpFGeaT31moDq+Dqc57ep3GkGdoMvE1K9v6FOKLTvg3YkG6lb
	FAZfsXQVHVdQTbenk9bt19q1zIjD0Xf3ujqne2HidEZLoudSTpGM5SNjHYfuu9yM
	+ptWZkL+PP+4b4BX/POoJZdJgFtQJ+7sC7REGWDPSHCiy6ucGJtvW0nysEmbMLQi
	W+eUGULC+KQGc53Pf2Xc8t4dANuazzBlKXtZ4FdI8Mg7pSI3xrpdG5Wi9B4XKvwb
	A+ydny21VHRn30B4mA5DewNO43hbb44WHziSoZrB9pr57GniLWAanX/mEcqdj7iU
	qLLY5w==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41n4jj0tj0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 20 Sep 2024 10:38:31 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48KAcTot006614
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 20 Sep 2024 10:38:29 GMT
Received: from hu-tdas-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 20 Sep 2024 03:38:26 -0700
From: Taniya Das <quic_tdas@quicinc.com>
Date: Fri, 20 Sep 2024 16:08:15 +0530
Subject: [PATCH v2 1/4] dt-bindings: clock: qcom-rpmhcc: Add RPMHCC
 bindings for QCS615
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240920-qcs615-clock-driver-v2-1-2f6de44eb2aa@quicinc.com>
References: <20240920-qcs615-clock-driver-v2-0-2f6de44eb2aa@quicinc.com>
In-Reply-To: <20240920-qcs615-clock-driver-v2-0-2f6de44eb2aa@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik
	<quic_imrashai@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>
CC: <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Taniya Das
	<quic_tdas@quicinc.com>
X-Mailer: b4 0.14-dev-f7c49
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: FSuOhZmIIG4Qp25MfQJ4v0YTRA2CWlNx
X-Proofpoint-GUID: FSuOhZmIIG4Qp25MfQJ4v0YTRA2CWlNx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 clxscore=1015 phishscore=0 impostorscore=0 bulkscore=0 adultscore=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0 mlxscore=0
 mlxlogscore=755 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409200076

Add bindings and update documentation for clock rpmh driver on QCS615
SoCs.

Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
---
 Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml b/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
index ca857942ed6c..6ace0fa585af 100644
--- a/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
@@ -17,6 +17,7 @@ description: |
 properties:
   compatible:
     enum:
+      - qcom,qcs615-rpmh-clk
       - qcom,qdu1000-rpmh-clk
       - qcom,sa8775p-rpmh-clk
       - qcom,sc7180-rpmh-clk

-- 
2.45.2


