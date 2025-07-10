Return-Path: <linux-arm-msm+bounces-64379-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AE19B002C3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Jul 2025 15:01:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 537917A671D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Jul 2025 12:59:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5830E26B096;
	Thu, 10 Jul 2025 13:01:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="JdhAioSf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A3472561C2;
	Thu, 10 Jul 2025 13:01:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752152465; cv=none; b=mjb6hJhnNmw6YQ/VlaSF6Xgu6AdnjHP1nC4YQTmk+UHmS+EMDe9uxm7sghUaOHnWz21h7F/oHULvIDUTv1Y3Zo6eZ2p/mEH3CfWeO7J9MxdwpKqIkquOsADsd5/49zbKBVaGCC/w56hUSwHhmCdU7wS+hgTv0xZiteqYEch+Fb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752152465; c=relaxed/simple;
	bh=wGEqQWA62p5nV7uB7ZoxfjLXbRLMiAil2CE47Jfw+Rk=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=dGRm1GNSAI2DGfDaygpvkp+SnpPMDpIgZi3otIt0jlxjOE8Jq4w7iz2Cz67W0u85xWxorLd/6F6d7juEGjzzvcarx4rT32XMkcTNraNXktvFN+yueXuERW2bhxseiy5nIprOFcfCiEeq4amfFPxCB/Ip2MhZ9yjq43Cx7/Sfh68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=JdhAioSf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56A8ntnw031906;
	Thu, 10 Jul 2025 13:00:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Xx5gNTNCdTTUgrZFfRwKqu
	3OzTK6EmAIpqkDvcmqi80=; b=JdhAioSfgjf9nwPEKri53hqeou4ndWPn/tEn3m
	QB3zEjjCVPA3NhQl4WO6wDWYuE6vpHYnbNYF+cg0Wh8be2T8zmRDIuzDEAUHL5b2
	PoEQYC+O6WMQm9zncjVm0jhSHKqa5voc1BsZCQEVy+9xh/XbKw/U5ziV56BgiDU/
	7pBPIUHGPucKPDxL7ame65WdFV9f7pQYKKsHB29D3+tSZJjiK3IlJ8SwP+PMASAz
	2OT+019y2c+R7wyRQIP774jIuN5j63TnsId4K4L63QmNBaVv+ynmGcHKj415DyL4
	lm04Wb7+tKYa0f0FtCoyZXHzI4y20Psk7ShpxhnbJCriksSw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pw7qymas-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Jul 2025 13:00:57 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 56AD0uWo001669
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Jul 2025 13:00:56 GMT
Received: from hu-skakitap-hyd.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Thu, 10 Jul 2025 06:00:51 -0700
From: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
Subject: [PATCH v4 0/2] Add video clock controller DT support for sc8180x
Date: Thu, 10 Jul 2025 18:30:38 +0530
Message-ID: <20250710-sc8180x-videocc-dt-v4-0-07a9d9d5e0e6@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHa5b2gC/33NwQ4BMRDG8VeRno3MtFXl5D3EwU67zMEu29WQz
 b67ckGI4/9L5jeDSrGTmNRqMqguZknSNiXsdKL4sGv2ESSUVhr1HJ02kNiTxytkCbFlhtCDjWw
 YF45qH1Q5PHWxlusT3WxLHyT1bXd7/sj0WP9ymYBgGTQhk0WHuD5fhKXhGbdH9QCzfiELpJ+IB
 oQK56Fyjplq942Yd0T/RExBluSCtSb4nfGfyDiOdzobcpdAAQAA
X-Change-ID: 20250623-sc8180x-videocc-dt-4ec3c0761f8d
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
CC: Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik
	<quic_imrashai@quicinc.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        "Jagadeesh
 Kona" <quic_jkona@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        Satya Priya Kakitapalli
	<quic_skakitap@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzEwMDExMSBTYWx0ZWRfX7XZhWDWyjB63
 PmRArCswdf86hlzFaFyA9s7rohnblgICBcq5sLE/2JttR2YpFv98kzo8P8Y3qk9H98G9Vp1Y/cp
 Ee0nkXNXaaKDcwcoUQF8uz2xWTpefZ92eKDn6ldKwKRyVPMC7Di7Mkb+gUhBfB2+6enDN1b6r1T
 8qQ+tl/i14RbJKwdEXQpTi05G2eZCAYrq24EIK/dta8nb8vEX4Vb2XyvkAfLGBSpKiqyEmL49L1
 MjjhggT0pD6Xi9B6is5FKLVek9iDA6QTZLDtpmVUQw1PLItvA6y4cmOY1rlC7GU5GXU698+U2r5
 OwMD6oyLBHLlMIQmLI2bwieY0JLwPC0wK6ST8vcndsIhpb8grB1I8muskQq77aEc9xD8IBWQOTX
 D79HzzuX30y60eNuDso7r7FFnDln2NSTIevQ10sAuJA9rBCj0uOJ/ek/XNXQmrMz5FfaRTpO
X-Proofpoint-GUID: 1a5FCGMJXsypirSVlOl45asG7HPcllt5
X-Proofpoint-ORIG-GUID: 1a5FCGMJXsypirSVlOl45asG7HPcllt5
X-Authority-Analysis: v=2.4 cv=SOBCVPvH c=1 sm=1 tr=0 ts=686fb989 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8
 a=COk6AnOGAAAA:8 a=yiBUYm-Hlfb03F32K2EA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-10_03,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 impostorscore=0 mlxlogscore=813 mlxscore=0 phishscore=0 malwarescore=0
 adultscore=0 suspectscore=0 spamscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507100111

Signed-off-by: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
---
Changes in v4:
- [1/2] Add 'contains' in order to match the compatible properly for
  sc8180x.
- Link to v3: https://lore.kernel.org/r/20250702-sc8180x-videocc-dt-v3-0-916d443d8a38@quicinc.com

Changes in v3:
- Fix the yaml binding indentation warnings.
- Link to v2: https://lore.kernel.org/r/20250701-sc8180x-videocc-dt-v2-0-b05db66cc1f6@quicinc.com

Changes in v2:
- Introduce new compatible for sc8180x videocc and use sm8150 as
  fallback. 
- Add new patch to update the bindings accordingly.
- Link to v1: https://lore.kernel.org/r/20250623-sc8180x-videocc-dt-v1-1-9d210c140600@quicinc.com

---
Satya Priya Kakitapalli (2):
      dt-bindings: clock: qcom,videocc: Add sc8180x compatible
      arm64: dts: qcom: sc8180x: Add video clock controller node

 .../devicetree/bindings/clock/qcom,videocc.yaml    | 23 +++++++++++++---------
 arch/arm64/boot/dts/qcom/sc8180x.dtsi              | 15 ++++++++++++++
 2 files changed, 29 insertions(+), 9 deletions(-)
---
base-commit: 5d4809e25903ab8e74034c1f23c787fd26d52934
change-id: 20250623-sc8180x-videocc-dt-4ec3c0761f8d

Best regards,
-- 
Satya Priya Kakitapalli <quic_skakitap@quicinc.com>


