Return-Path: <linux-arm-msm+bounces-31461-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AC5B974C13
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Sep 2024 10:04:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 61F651C25C3D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Sep 2024 08:04:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60E161547CA;
	Wed, 11 Sep 2024 08:04:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="iW+18ofi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3D871531C0;
	Wed, 11 Sep 2024 08:04:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726041845; cv=none; b=rWw+ItHI9PDniIAmcNhkTeaP/AQjzbouir0krxrRDDqgDpSfD9jspDbbZ7K+g6za5pjkK6+OI0dx98thVlv8EkThNwDs68bwdRE0+s57/t4zGxgMHLxpv7k1JZ5Erq5QlMpf4oMCjJ/+GdZRc5YojQf4PVS4/50fH8eL14N5k0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726041845; c=relaxed/simple;
	bh=9LMPBFHBmI2pNsDc7zTQIx2uOLxBF/cUr6rQIxaHPfk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=fsTBqBruZgERlHUT4BmWhUVauUPtG/p03BXr7BDOaw3YSPa8gxikJZ2QMqaqQtuu65ZLcxqr+olKs6+KNARJwHiVg/TWbBY2ukrNANyni28rxKk4qc0gG42CS4ZrqcPJ8ZSCLG4rcpXwzfv+rnRTCmZY4NAkcLauoHjZ/7OZT4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=iW+18ofi; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48B3YqDX009985;
	Wed, 11 Sep 2024 08:03:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NxlQ+Hq3hVqGI9HW/vC4wp2VYNEZtbj7JnSa9ge4xIM=; b=iW+18ofi72VwxmcT
	NqLEp6B9ScpZi8Vze3uj7DLRm6ekdTm0pfu0fyCRdSbWeuSnNd8RBGNSkVgR7WEW
	iLPQoIWUmX1T/CVVqagcnEkNIIsT9xW0CjipexwjNUD5SqoLAbHgLxVXNw7eb+vY
	QE4dGJA7qd0A9eBNuoUMctmwOYgHPenOO8xqHMj6vQCakNtv0mv1/4yIdjtb4H4A
	oV6QVqbx7Y43FrN8kZhtsCH3zsHjYULQJpFyLt3ySq2xaSgF6iiCvfRlvi6ENSd7
	P8COn75UsBTQ6bJimvnthOoAksZofdBQDzJEvVYZ6AQ1vpsJeNaWNpIOa4iUvxJC
	SXap0g==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41gy5nrtet-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Sep 2024 08:03:58 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48B83udu002666
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Sep 2024 08:03:56 GMT
Received: from jingyw-gv.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 11 Sep 2024 01:03:52 -0700
From: Jingyi Wang <quic_jingyw@quicinc.com>
Date: Wed, 11 Sep 2024 16:03:18 +0800
Subject: [PATCH v2 4/4] dt-bindings: soc: qcom,aoss-qmp: Document the
 QCS8300 AOSS channel
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240911-qcs8300_binding-v2-4-de8641b3eaa1@quicinc.com>
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
	<quic_jingyw@quicinc.com>,
        Kyle Deng <quic_chunkaid@quicinc.com>
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1726041817; l=923;
 i=quic_jingyw@quicinc.com; s=20240910; h=from:subject:message-id;
 bh=QeU1ZLPa1r4D33EohTZDFi9CbLL8pYsC6S/b8s2r2s0=;
 b=RF5Iv0KIcWAAQXWlno4rikHsmMjSf4ZDQDyg9mqw/sywAwNX9RDRF6hdQFJ5sXj2zbS+TZECW
 RAhEP47gHfGD5LRViK+hzMjCh/LXCc06sau+vKjb5vBgQLsoEB5apEx
X-Developer-Key: i=quic_jingyw@quicinc.com; a=ed25519;
 pk=ZRP1KgWMhlXXWlSYLoO7TSfwKgt6ke8hw5xWcSY+wLQ=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: ImOvviEPZo0EvaqJXQpTE38b-E4DYred
X-Proofpoint-ORIG-GUID: ImOvviEPZo0EvaqJXQpTE38b-E4DYred
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501 mlxscore=0
 mlxlogscore=999 bulkscore=0 clxscore=1015 impostorscore=0 phishscore=0
 spamscore=0 malwarescore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2408220000
 definitions=main-2409110060

From: Kyle Deng <quic_chunkaid@quicinc.com>

Document the Always-On Subsystem side channel on the Qualcomm QCS8300
platform for communication with client found on the SoC such as
remoteprocs.

Signed-off-by: Kyle Deng <quic_chunkaid@quicinc.com>
Signed-off-by: Jingyi Wang <quic_jingyw@quicinc.com>
---
 Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml
index 7afdb60edb22..6f5c2609e82a 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml
@@ -25,6 +25,7 @@ properties:
   compatible:
     items:
       - enum:
+          - qcom,qcs8300-aoss-qmp
           - qcom,qdu1000-aoss-qmp
           - qcom,sa8775p-aoss-qmp
           - qcom,sc7180-aoss-qmp

-- 
2.25.1


