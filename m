Return-Path: <linux-arm-msm+bounces-35408-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D9DD9AA16A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Oct 2024 13:53:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 999171F23EB4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Oct 2024 11:53:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AAF7C19D06B;
	Tue, 22 Oct 2024 11:53:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="iaiUvBUM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BE1719CCF5;
	Tue, 22 Oct 2024 11:53:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729597993; cv=none; b=dkqjn/kBFegi+5zXyPySaVhVXBOHJ/fc/tLTjTHpO3Z9w0/dQEV1/YLPntx1pf3e+ujf854j7Tbz6PvxXqGMZLcd+fOwwAIDxU4rRFWT4EFGOYuhCIpY3xZxfwseuAgiFhnuabGCxOOU2MPTE86JADZU04VMJ1Fjl7eeo9LAgV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729597993; c=relaxed/simple;
	bh=ejLKEiy/NiR8AvhLuaEc1l2G7oouPhnfvnVJZZyh9Ms=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=esH9GTPN7hM3cF+vsiFTqHGXn6GGNUko0LNCvy7n+EY+mmPJw21qS33flvTk+XD1oyW3DGJ/CiNo+K9T++wm5U9l7Pxkk1gU/x63292liInasvGhgTvhmeCOIZkTXNM/nMuAFTG5T0N2zJEr1EeRyKzDNKE/aS8sN+s8KHlaGGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=iaiUvBUM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49M2Xo6g023944;
	Tue, 22 Oct 2024 11:53:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2xR2hEuf7yeBWUseFca5S7AmgeQZEQlnwf23o9RpPF4=; b=iaiUvBUMHjilPE+j
	wvpPstIoU9C4oF2t1NdBQMXmBK0+0cTGL4UhCEZh7mUYrM12MUGZuYyjMNesQAr8
	ASdJAe1709vuQC0HGBgPCuw6hJVMpFY9olwOzjvLyzFTAOSlJTCCYrB+ofrT3A5x
	mEFpSKsbEnp32ZIYy4Cwg6+4q8th0bZ1Pt+vqFYkT0TDyONZ3xL6yC3F4lvAmgjv
	x0bI9NDEtqZOzCCJsuEwrZcYE3yyv18m+LxLy9GPue5drobNEna83Vb6l42lX0bO
	EFOOdc2wjSaqP5D/liswiBIHWctQSWK3xoITWmecZJJMsyHD2kBsiiuuyQRqFd8u
	gfnQ/A==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42e3cghft2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Oct 2024 11:53:06 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49MBr5ht014760
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Oct 2024 11:53:05 GMT
Received: from hu-tdas-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 22 Oct 2024 04:53:00 -0700
From: Taniya Das <quic_tdas@quicinc.com>
Date: Tue, 22 Oct 2024 17:22:50 +0530
Subject: [PATCH v4 1/4] dt-bindings: clock: qcom-rpmhcc: Add RPMHCC
 bindings for QCS615
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241022-qcs615-clock-driver-v4-1-3d716ad0d987@quicinc.com>
References: <20241022-qcs615-clock-driver-v4-0-3d716ad0d987@quicinc.com>
In-Reply-To: <20241022-qcs615-clock-driver-v4-0-3d716ad0d987@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Taniya Das <quic_tdas@quicinc.com>,
        Richard Cochran
	<richardcochran@gmail.com>
CC: Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik
	<quic_imrashai@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        "Krzysztof
 Kozlowski" <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.15-dev-aa3f6
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: jZMumxyIGW9_7wQ6vmm_LaJ8_aD0ywmT
X-Proofpoint-ORIG-GUID: jZMumxyIGW9_7wQ6vmm_LaJ8_aD0ywmT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 mlxlogscore=841
 spamscore=0 malwarescore=0 priorityscore=1501 lowpriorityscore=0
 phishscore=0 clxscore=1015 impostorscore=0 suspectscore=0 adultscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410220075

Add bindings and update documentation for clock rpmh driver on QCS615
SoCs.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
---
 Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml b/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
index ca857942ed6c08cd4b906f18f6a48631da59ce9a..6ace0fa585af5aaf55ed79038b1e9e1770079563 100644
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


