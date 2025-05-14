Return-Path: <linux-arm-msm+bounces-57949-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C0416AB7531
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 May 2025 21:09:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DFA053A948F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 May 2025 19:09:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E41CB28D845;
	Wed, 14 May 2025 19:09:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="MlQsKW2c"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BF3428CF79;
	Wed, 14 May 2025 19:09:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747249766; cv=none; b=K2KfEn8bX1xYjKQOJM2sG3TMA9jMbZM1nPwKFD65DNG36/93t9q4FDzQtyNFpjjownPaCDdjl5Pv+2GGpGAbwvhXET0lP/uyu10JN/y3C/HOsDD2ZihR40XT8kKL52Mph5Gw7PVa9jXjO7EnkrD5kM53SN038MuaGYnppvLASGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747249766; c=relaxed/simple;
	bh=02e9NjVrKr0p5lv0XRTtSIaSmEjAp5gGx3kkZVJjiUk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=o/srhK34J5gYQ2OALk2VJ8l2xRBuKh/kyjGyl2csPjFkCcUzyLR3udrIyFw7aSj/Fnn+fKSuMZwd9ZFU/k4lNVFTLMut76joCPuEEIdE7RFl1uDDbWshMINqVJRHRMzTq7TE8VInGZPuxbLQoCIs/51me+BWtyXNTaYlbWWvjFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=MlQsKW2c; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54EAuv1w015942;
	Wed, 14 May 2025 19:09:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OU+wTIryrsNnj6BieoMWjBh9/0Mr0VkKaCV97QKe4Xw=; b=MlQsKW2coExnfT8I
	5NzbZtwlMVrOSGAZuHOFHj4qgWjdFV5PzE4u1IHOB6SWsv0v54BP0I2rGZIK6Vyy
	xV2lxdwXSYpCOTJdECOeReeKBMsb+HiC0JYMHS8w3T9tF07LTjQBIj144FJtbxBt
	b07z8gORaoiH+cFn3bf+sC6n1kI4/5Hwxi9ZvzTUCAu037PjuBKwCs0lPAnJBw38
	I5Rr37fJiWbeoSBnsypfBe8Lnq+/hfiwSpBXJ90q1yInefdvi0vpvFRcuivQ0uMZ
	Jd/01f7cUhrgM6zNPennlDFsIIHU+2g9ellrciE3gzt5UMY4Sdi+NxZ3dkz2OJJn
	9eXBhw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcmuw4q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 May 2025 19:09:21 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 54EJ9KbZ010438
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 May 2025 19:09:20 GMT
Received: from [10.213.98.28] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 14 May
 2025 12:09:14 -0700
From: Jagadeesh Kona <quic_jkona@quicinc.com>
Date: Thu, 15 May 2025 00:38:46 +0530
Subject: [PATCH v4 01/18] dt-bindings: clock: qcom,sm8450-videocc: Add MXC
 power domain
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250515-videocc-pll-multi-pd-voting-v4-1-571c63297d01@quicinc.com>
References: <20250515-videocc-pll-multi-pd-voting-v4-0-571c63297d01@quicinc.com>
In-Reply-To: <20250515-videocc-pll-multi-pd-voting-v4-0-571c63297d01@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        "Vladimir
 Zapolskiy" <vladimir.zapolskiy@linaro.org>,
        Dmitry Baryshkov
	<lumag@kernel.org>
CC: Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik
	<quic_imrashai@quicinc.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        "Satya Priya
 Kakitapalli" <quic_skakitap@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: SWL4503BsVpqlkn3s9OUTfHT_KLF0k9M
X-Authority-Analysis: v=2.4 cv=HZ4UTjE8 c=1 sm=1 tr=0 ts=6824ea61 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8
 a=KKAkSRfTAAAA:8 a=VwQbUJbxAAAA:8 a=Nwh09rWfvR_xP5f7LFwA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: SWL4503BsVpqlkn3s9OUTfHT_KLF0k9M
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE0MDE3NCBTYWx0ZWRfX1d14hfWS0iWR
 Gzdo10RkkDAQosBNDZrtas9V3nyo0DrXMFanLL4BZFs6O0433Tgt1DVx67HYqCfw3LynN9V7Ajv
 OcvBOWAnRzEBuIO9P4WaYownREdy25dxn7MHxrMxbZFVe/NVEX/CPzaZWScPWmidPRWcIgt4LJr
 xJGRFVYPRGllURjJqniKJNHD0BPv4Qyv6A24fmX7WsPj+I7rKJtJ3ub4KRJhY+CkMUJL5fGFsNa
 yjBqzvEJhOeAqMpCzzaX+3wkCEzgUhuxo6he8sFToKJF3TKVixtlQhf3L9QFo7ubjmn0U4Hpz1M
 Se1CH4gvQZza9Sa3uumt8sOaMzL4cteYEyc+5+aKsr7b2se1spjweGzZS63FybbAj1pHxE3Dt3v
 bFNpxniBFhEp3UrO2DS9/oVV7KWl/YbGyEYjbCIniYDoLEo1BInZHJOAVBFuUURdXNREYgul
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-14_04,2025-05-14_03,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 suspectscore=0 mlxscore=0 mlxlogscore=999 lowpriorityscore=0 malwarescore=0
 bulkscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505140174

To configure the video PLLs and enable the video GDSCs on SM8450,
SM8475, SM8550 and SM8650 platforms, the MXC rail must be ON along
with MMCX. Therefore, update the videocc bindings to include
the MXC power domain on these platforms.

Fixes: 1e910b2ba0ed ("dt-bindings: clock: qcom: Add SM8450 video clock controller")
Signed-off-by: Jagadeesh Kona <quic_jkona@quicinc.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../devicetree/bindings/clock/qcom,sm8450-videocc.yaml | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
index 62714fa54db82491a7a108f7f18a253d737f8d61..0d99178332cb99d3f02f50605e19b9b26e3ec807 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
@@ -32,14 +32,18 @@ properties:
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
-    maxItems: 1
     description:
-      A phandle to an OPP node describing required MMCX performance point.
+      OPP nodes that describe required performance points on power domains
+    items:
+      - description: MMCX performance point
+      - description: MXC performance point
 
 required:
   - compatible
@@ -72,8 +76,10 @@ examples:
       reg = <0x0aaf0000 0x10000>;
       clocks = <&rpmhcc RPMH_CXO_CLK>,
                <&gcc GCC_VIDEO_AHB_CLK>;
-      power-domains = <&rpmhpd RPMHPD_MMCX>;
-      required-opps = <&rpmhpd_opp_low_svs>;
+      power-domains = <&rpmhpd RPMHPD_MMCX>,
+                      <&rpmhpd RPMHPD_MXC>;
+      required-opps = <&rpmhpd_opp_low_svs>,
+                      <&rpmhpd_opp_low_svs>;
       #clock-cells = <1>;
       #reset-cells = <1>;
       #power-domain-cells = <1>;

-- 
2.34.1


