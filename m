Return-Path: <linux-arm-msm+bounces-31462-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B9C7974C18
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Sep 2024 10:04:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DB80E1F22863
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Sep 2024 08:04:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5F37155758;
	Wed, 11 Sep 2024 08:04:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="cNmYwViN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62AE0154C03;
	Wed, 11 Sep 2024 08:04:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726041847; cv=none; b=dne5D3rf6L//RJPQedF3yG5JJMYTQ4EWlUdbSz2DfyqF/1zDRO1sKEsppVxkTSURLsZcvXOpynBOd6vXZ0XqWglKkPQ+nbj9f30PFFsBVzK1nIG5RytGqb3Egot66fCf1iZTrGV+Nam4pz/ph7LVOxxMXnLDYNy/cn+LQyG3KWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726041847; c=relaxed/simple;
	bh=kMwqFrlOuN9XlBZGfzIvclzqhiKk6NDWNA6ekY8THeQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=uOarzB/TWCvpL8EDn+DWP5LByvGp0mvksTxu/VkARTQCvqmXW5HHIrmiWDzIpBY6Q+oMTNIGNoxtJ1iIySWD9LVetM+wo0fulY8IrehwqV5IjVJ7EK/bUMV+yCXW4RQH3UpvYhyCGzlxzpwLeYYbOOGEMVg9x59GaaSaOFiHkU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=cNmYwViN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48B3IfnQ020295;
	Wed, 11 Sep 2024 08:03:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Bi2+gWuxC3/DBE1+021Wq6DSrNxjaWd+VfAiVICd15w=; b=cNmYwViNHjf5Sy+c
	lzNtFx//nl8QkuHn0Xx6WjKdennnlABr4nxJyciuwGiaUAZZNWbhWmA1R7WQAGC4
	pK6EwdfS0YiHdRXyhDBEHDtw9ATtto2BL9gndYchtxmA1XbBytNU1tZe0URgN3lc
	1i8WfoNrljD6nltnrA4q2mQ2rvQKu5hZR190f7tt7aM4N+uqN5eZZccTEAxNvqQP
	Cxiqw8sdOAQZHt5ALgnEktNTvP0EtavyphNZFkjX39w+QFf2beVP29imPolZcCnW
	OWL/Veb3Us1REoMyvyeQkJsHPl9ArJ9THzS6hmdL9lvBBk7jHlygo/2B7UWc05ev
	hg2dtw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41he5e01ch-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Sep 2024 08:03:53 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48B83qdY013067
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Sep 2024 08:03:52 GMT
Received: from jingyw-gv.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 11 Sep 2024 01:03:49 -0700
From: Jingyi Wang <quic_jingyw@quicinc.com>
Date: Wed, 11 Sep 2024 16:03:17 +0800
Subject: [PATCH v2 3/4] dt-bindings: soc: qcom: add qcom,qcs8300-imem
 compatible
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240911-qcs8300_binding-v2-3-de8641b3eaa1@quicinc.com>
References: <20240911-qcs8300_binding-v2-0-de8641b3eaa1@quicinc.com>
In-Reply-To: <20240911-qcs8300_binding-v2-0-de8641b3eaa1@quicinc.com>
To: Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>,
        Robert Marko <robimarko@gmail.com>
CC: <quic_tengfan@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <quic_tingweiz@quicinc.com>, <quic_aiquny@quicinc.com>,
        Jingyi Wang
	<quic_jingyw@quicinc.com>
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1726041817; l=791;
 i=quic_jingyw@quicinc.com; s=20240910; h=from:subject:message-id;
 bh=kMwqFrlOuN9XlBZGfzIvclzqhiKk6NDWNA6ekY8THeQ=;
 b=+6Y+ZT4Uhuhss1G5OiLOZmkDgwav3iLmLD1z7IsQdxZHsoRMtNPFzxEjqh6ce1SrSienULxeX
 IiXf+oujS1rACToD/MVxf2FxIJINIWcvvJ762eECeWNMECd4fL+eF4F
X-Developer-Key: i=quic_jingyw@quicinc.com; a=ed25519;
 pk=ZRP1KgWMhlXXWlSYLoO7TSfwKgt6ke8hw5xWcSY+wLQ=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 9WwEwg9kRF0VlIypmnqnU-P2UPhlXLzg
X-Proofpoint-GUID: 9WwEwg9kRF0VlIypmnqnU-P2UPhlXLzg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 impostorscore=0
 malwarescore=0 mlxscore=0 phishscore=0 bulkscore=0 adultscore=0
 mlxlogscore=761 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409110060

Document qcom,qcs8300-imem compatible. It has child node for debug
purpose.

Signed-off-by: Jingyi Wang <quic_jingyw@quicinc.com>
---
 Documentation/devicetree/bindings/sram/qcom,imem.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/sram/qcom,imem.yaml b/Documentation/devicetree/bindings/sram/qcom,imem.yaml
index faef3d6e0a94..9b06bcd01957 100644
--- a/Documentation/devicetree/bindings/sram/qcom,imem.yaml
+++ b/Documentation/devicetree/bindings/sram/qcom,imem.yaml
@@ -21,6 +21,7 @@ properties:
           - qcom,msm8226-imem
           - qcom,msm8974-imem
           - qcom,qcs404-imem
+          - qcom,qcs8300-imem
           - qcom,qdu1000-imem
           - qcom,sa8775p-imem
           - qcom,sc7180-imem

-- 
2.25.1


