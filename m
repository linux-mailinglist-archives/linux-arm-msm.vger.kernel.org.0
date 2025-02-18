Return-Path: <linux-arm-msm+bounces-48378-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A04CA39FD8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Feb 2025 15:31:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 531CB1731E1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Feb 2025 14:28:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 349F326B2BB;
	Tue, 18 Feb 2025 14:27:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Xncr/0tL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DAFA26A0D7;
	Tue, 18 Feb 2025 14:27:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739888860; cv=none; b=n5GrDuALN0xVpN41MVZOzW681e40gqTgfW4sfL+xCbUsZXRjPwG8BT7luKL1GxIjG0YSqz2agL6WEqeAtCrkDWkiu8TxvmCOKYrhFU63ehkvlTk4OW7dE7Y8Mzu+ofrDqymIsOskGue+HcV3VXH1tq83y6VXDdIzOnGu7vx7FVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739888860; c=relaxed/simple;
	bh=kuYeVDvp8hjTH1IgHmrJLXlU+/zQ4sez4XzYxhySnak=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=GsdvebW7+TKuSJSMUnYT9f4nnfx0smqLv3AODAe13j7+f16kknowRXvsWsuyKpDKre3w7jPIiOIfd/NCCYgqWtJUJSa6wdPHvTwPoKEDNxFJT4vMeD8NjGNKjsNepXXNZyLVHWzWgo/R+d5rQjp/xk+sQr+lFTe6yCRI2OguZGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Xncr/0tL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51ICKq8h026146;
	Tue, 18 Feb 2025 14:27:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	A4Ugt8JGI4OW7ptZ0h9gm3LgnfhkSdadEhp94FwH8bg=; b=Xncr/0tLUz+DlwV7
	vj9AZhjNaQWABt9Ac+StUG7jAhYFrJBaCwAKpulJPxF3z/XygU0uMM/z6ozLU3h8
	+uRSyD8SiP50+6g5Z/UtsMx9zvZZ/Wx5An/6TlKjTmSbkyIh7EBlFkCh+kMWLzRl
	pyn8yHbY+icDCwzGZVq4MiqEECGLJJxJt7FxHPw818c09BrWNs2LoBaKHD5xg1vG
	1zFrroKNnyLO9LWYDByxiyevhA1oICSHA2HmiYlQfrDuU2KUCkZb5fFsYt1pdswJ
	u4Q/8APgXz4nUR9PwA/ix47isSegv/Pw4ad5Pl+SSTHW573omaPWRWCMjZ4i/Mru
	Y/aBOQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44ut7sn54m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Feb 2025 14:27:35 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51IERIL7026418
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Feb 2025 14:27:18 GMT
Received: from [10.213.98.28] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 18 Feb
 2025 06:27:14 -0800
From: Jagadeesh Kona <quic_jkona@quicinc.com>
Date: Tue, 18 Feb 2025 19:56:46 +0530
Subject: [PATCH 1/5] dt-bindings: clock: qcom,sm8450-videocc: Add MXC power
 domain
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250218-videocc-pll-multi-pd-voting-v1-1-cfe6289ea29b@quicinc.com>
References: <20250218-videocc-pll-multi-pd-voting-v1-0-cfe6289ea29b@quicinc.com>
In-Reply-To: <20250218-videocc-pll-multi-pd-voting-v1-0-cfe6289ea29b@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
CC: Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik
	<quic_imrashai@quicinc.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        "Satya Priya
 Kakitapalli" <quic_skakitap@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: MEEqWaH-x2NGqmWo_fbFXmNhgYZJR9b7
X-Proofpoint-ORIG-GUID: MEEqWaH-x2NGqmWo_fbFXmNhgYZJR9b7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-18_07,2025-02-18_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxlogscore=832
 clxscore=1015 priorityscore=1501 adultscore=0 spamscore=0 malwarescore=0
 impostorscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2501170000
 definitions=main-2502180109

To configure the video PLLs and enable the video GDSCs on SM8450,
SM8475, SM8550 and SM8650 platforms, the MXC rail must be ON along
with MMCX. Therefore, update the videocc bindings to include
the MXC power domain on these platforms.

Fixes: 1e910b2ba0ed ("dt-bindings: clock: qcom: Add SM8450 video clock controller")
Signed-off-by: Jagadeesh Kona <quic_jkona@quicinc.com>
---
 Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
index 62714fa54db82491a7a108f7f18a253d737f8d61..737efc4b46564c1e475b02873d2dc124329fb775 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
@@ -32,9 +32,11 @@ properties:
       - description: Video AHB clock from GCC
 
   power-domains:
-    maxItems: 1
     description:
-      MMCX power domain.
+      Power domains required for the clock controller to operate
+    items:
+      - description: MMCX power domain
+      - description: MXC power domain
 
   required-opps:
     maxItems: 1
@@ -72,7 +74,8 @@ examples:
       reg = <0x0aaf0000 0x10000>;
       clocks = <&rpmhcc RPMH_CXO_CLK>,
                <&gcc GCC_VIDEO_AHB_CLK>;
-      power-domains = <&rpmhpd RPMHPD_MMCX>;
+      power-domains = <&rpmhpd RPMHPD_MMCX>,
+                      <&rpmhpd RPMHPD_MXC>;
       required-opps = <&rpmhpd_opp_low_svs>;
       #clock-cells = <1>;
       #reset-cells = <1>;

-- 
2.34.1


