Return-Path: <linux-arm-msm+bounces-61627-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C570ADDC0A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Jun 2025 21:09:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 48B9F194085E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Jun 2025 19:09:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 753F12EAB77;
	Tue, 17 Jun 2025 19:08:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="nKrdj2ea"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 983582EAB64;
	Tue, 17 Jun 2025 19:08:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750187324; cv=none; b=AwmbHfHm98OYHMw6RxpskjiQr3ULol5vZr4qQmNElIaj7+Ed/4Zq1tn6ymwFniIovQqgj8UP2OV2VnUQnKz3/4jeC3d4HS+qmyKkqpNmmkXS8sl7QaMZRqmMpOW1kZ3/BN+eNZ7+kP4YH0GiVFKyaR+ig7WqSibcT3IzntNuguA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750187324; c=relaxed/simple;
	bh=OwIqtGRlm94y/z5Oy27tYW4wEqv2iguuowbECB54NcM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=JvVpDl36NgYJtEsJHOrH7Bo753aJvYCd0ONoZnJYj7KhVt831KVhKHNE7kBmLCw0cvzt0JZoLvFb/klcMjXMi1K92quNrG5AcAgFp0sScbxLkKBR3YmD0AMIZgD7MboojYgew300RUWqiUG18LIffpT2xwgTN9qFA817Fe1/U5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=nKrdj2ea; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55HDOGiS010256;
	Tue, 17 Jun 2025 19:08:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7VjKIEf8m14v5eoTuU+sA6xMMziwpcbGBmJy1MwZ634=; b=nKrdj2eattqHMHpS
	qVQW2YHATncDfPMTyi2fM2jDKFHIkb9JQ/b4A13dE6Dga/rcH1/bU9G8zRvNdnxj
	GMgix8Ya7TeBdEOHxRTHw0cruGvEgkraffNPiMluc5vbVJ7Tpupp5uhXu2ut1KGv
	EeR+cuquzZ7Q0bb91xZ8UtSPiYFl7FjFKTaaSfAXb5IlkERd2v8vH+n39Y5QPmox
	A51nhatjh2Rb5uaqlnjDi8ttEVPd7IM7V1Cs/dThqwxxgia1snnRo7I9olBylvRi
	TxAa0T8d/7Sc8FAS9XAfJgAK0KDpReq6RGSJC4VEE+IhX0UakY4cx0EXGECCTE0I
	K+mwDw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4791f79ep9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Jun 2025 19:08:35 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 55HJ8YNc027805
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Jun 2025 19:08:34 GMT
Received: from [10.213.98.28] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 17 Jun
 2025 12:08:29 -0700
From: Jagadeesh Kona <quic_jkona@quicinc.com>
Date: Wed, 18 Jun 2025 00:37:26 +0530
Subject: [PATCH 1/2] dt-bindings: clock: qcom,sm8450-videocc: Add minItems
 property
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250618-sm8450-videocc-camcc-bindings-single-pd-fix-v1-1-02e83aeba280@quicinc.com>
References: <20250618-sm8450-videocc-camcc-bindings-single-pd-fix-v1-0-02e83aeba280@quicinc.com>
In-Reply-To: <20250618-sm8450-videocc-camcc-bindings-single-pd-fix-v1-0-02e83aeba280@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
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
        kernel test robot <lkp@intel.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE3MDE1MyBTYWx0ZWRfX0680tJlJOLNn
 RfiNG4x4L+VTpX+2qywBIP+JtmcsHclq+ddqGSAYsDXBp5gNj2TCauXYVyhThsTsznX4sBl7fGh
 B/MQNEsZSW/ur09mtGBuN+BHn3e5Les+psfxr0eK0viA3mRtbuWklJWKs4MZG8hkHzfceX4iSBD
 URJBM9N+7zxMeSjXUW7grfTVFXNHZ+M4IUgM7GkasUaziXDg7BvX7gCaLb2sjhFy+wdUFk9M8WU
 ZbMcYh1k/lIC6ho3fNX/HrH/8oil4YliQwcPXO46ON9P2fFbpLp1UAbTcEPjgW9efRXkqg/OZHE
 FUnC4b2vuMclYlnLzSoa7cYc2nBtTKIp/XvP91vtY8bLSgA0DEWrBsNVyGm4R9PKMPySgy3I0tU
 T77QyNK9qaoePu5Dd/8dkyjhEia+a4cS8zLCoo2NcC0PGuXjsjqqyG8kpxnDzqYi7/ss3anK
X-Proofpoint-GUID: 9Qrr70tdsoYYbqEJy8LdwJiOueiXlhxd
X-Proofpoint-ORIG-GUID: 9Qrr70tdsoYYbqEJy8LdwJiOueiXlhxd
X-Authority-Analysis: v=2.4 cv=FrIF/3rq c=1 sm=1 tr=0 ts=6851bd33 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8
 a=QyXUC8HyAAAA:8 a=COk6AnOGAAAA:8 a=-4hpY4AvdCWQGMI6cJkA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-17_08,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 mlxlogscore=955 bulkscore=0 impostorscore=0
 malwarescore=0 phishscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506170153

Add minItems as 1 for power-domains and required-opps properties
to allow this binding to be compatible with both single and multiple
power domains.

This fixes:

arch/arm64/boot/dts/qcom/sm8450-hdk.dtb: clock-controller@aaf0000
(qcom,sm8450-videocc): power-domains: [[106, 6]] is too short

arch/arm64/boot/dts/qcom/sm8450-hdk.dtb: clock-controller@aaf0000
(qcom,sm8450-videocc): required-opps: [[55]] is too short

Fixes: 1a42f4d4bb92 ("dt-bindings: clock: qcom,sm8450-videocc: Add MXC power domain")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202506141133.AEQRFOWe-lkp@intel.com/
Closes: https://lore.kernel.org/oe-kbuild-all/202506151907.LcLf1RIB-lkp@intel.com/
Signed-off-by: Jagadeesh Kona <quic_jkona@quicinc.com>
---
 Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
index 0d99178332cb99d3f02f50605e19b9b26e3ec807..e9143887c1739c28d3cfc97e6678ab12231472a6 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
@@ -32,6 +32,7 @@ properties:
       - description: Video AHB clock from GCC
 
   power-domains:
+    minItems: 1
     description:
       Power domains required for the clock controller to operate
     items:
@@ -39,6 +40,7 @@ properties:
       - description: MXC power domain
 
   required-opps:
+    minItems: 1
     description:
       OPP nodes that describe required performance points on power domains
     items:

-- 
2.34.1


