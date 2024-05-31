Return-Path: <linux-arm-msm+bounces-21223-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 51AFE8D5DB5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 May 2024 11:08:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DAD4E1F241B5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 May 2024 09:08:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B9F21586F4;
	Fri, 31 May 2024 09:05:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="aGvPsU60"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92D57156980;
	Fri, 31 May 2024 09:05:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717146311; cv=none; b=LobLQiudN9haiZLSkkfj796v8lHztKqhg7vvalW0Lpp3neJobkw0GCqzKMwEMKXq29XfL41fYUGoh0Mt3+KbdE6+iQkxYAMKBwRHE1jJyFhOLJc+Te4WK4P1aRST2md52TdcXnsE/AAwfEiUy4cJM430Ba7KugaQu90uDMDi3i4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717146311; c=relaxed/simple;
	bh=ZQPGyWk58dtkH8TyKhLhlGonzK2+ErMUnyPwNu2UZao=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Ip6/AbOzmxYRvMK1z/hO+5TEQ66w0PPoqNN+Ki7KKdcRUTPlvEvu89PXSR5WwHv+okwA61mSbLHDEzGTGBVFQE4O3E6RIS6DNhmbsBXP7WN8CeICMsOgF9VA+NcRgcHd2OkNa9eNT01Ei5V9hqnxxixz1e56aQfgRGh+3s4lq4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=aGvPsU60; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44V23uh0003481;
	Fri, 31 May 2024 09:04:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=EcnyoOtoHZV8gKifoNOhF6
	6xLuIhNpDLaEP7oKF8kUY=; b=aGvPsU60hEzCny7k8jis+43xnRhtUBIkA18AJy
	tFf3E8aVYK9DM8P0DcQ0Tsbx84PxQMVC0FYkV2v9HMa0h6N7gMVYyXgEWsTyXJmP
	gBo2nddnDziR4SW1Y89BWkD76q3VYMO+X7J8kyMqrxT3DAkkW11XfWKH+mm7SxzA
	XH0gm1RgYPA0HfwuXh8lqG3ZeMVOueO4PQ+GtPgtKJH5BJV52KX3FaI7pxa8GsH+
	XG7ci1MUBoXwt/VR6MY+L5JZ5EcdA+IHdkSvkpkM2MfOIrwQfpNalOCRP21kWM+V
	UlvpH4A+gy0+AbHQ3AIo5VXCW2+74FbALrtrK304fRBTuqrw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yesw5jd56-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 31 May 2024 09:04:43 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44V94g22005283
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 31 May 2024 09:04:42 GMT
Received: from tengfan-gv.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 31 May 2024 02:04:35 -0700
From: Tengfei Fan <quic_tengfan@quicinc.com>
To: <andersson@kernel.org>, <konrad.dybcio@linaro.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <dmitry.baryshkov@linaro.org>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <kernel@quicinc.com>,
        Tengfei Fan
	<quic_tengfan@quicinc.com>
Subject: [PATCH v3 0/2] [PATCH v2 0/2] arm64: dts: qcom: sm8550: Update some usb properties
Date: Fri, 31 May 2024 17:04:20 +0800
Message-ID: <20240531090422.158813-1-quic_tengfan@quicinc.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: dqyrzse_ON5vLNjML5e0Rx0Dws593Bug
X-Proofpoint-GUID: dqyrzse_ON5vLNjML5e0Rx0Dws593Bug
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-31_05,2024-05-30_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=1 lowpriorityscore=0
 mlxlogscore=220 phishscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 suspectscore=0 priorityscore=1501 clxscore=1015 spamscore=1 mlxscore=1
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2405310066

Move usb-role-switch to SoC dtsi, and remove usb default dr_mode.

Signed-off-by: Tengfei Fan <quic_tengfan@quicinc.com>
---

v2 -> v3:
  - Update comment message
v1 -> v2:
  - Splitting a patch into two patches based on functionality
  - Remove some changes that have already been mainlined
  - Update patch commit message

previous discussion here:
[1] v2: https://lore.kernel.org/linux-arm-msm/20240529100256.3158447-1-quic_tengfan@quicinc.com
[2] v1: https://lore.kernel.org/linux-arm-msm/20240513084701.1658826-1-quic_tengfan@quicinc.com

Tengfei Fan (2):

Tengfei Fan (2):
  arm64: dts: qcom: sm8550: Move usb-role-switch to SoC dtsi
  arm64: dts: qcom: sm8550: Remove usb default dr_mode

 arch/arm64/boot/dts/qcom/sm8550-hdk.dts                     | 5 -----
 arch/arm64/boot/dts/qcom/sm8550-mtp.dts                     | 5 -----
 arch/arm64/boot/dts/qcom/sm8550-qrd.dts                     | 5 -----
 arch/arm64/boot/dts/qcom/sm8550-sony-xperia-yodo-pdx234.dts | 5 -----
 arch/arm64/boot/dts/qcom/sm8550.dtsi                        | 1 +
 5 files changed, 1 insertion(+), 20 deletions(-)


base-commit: 0e1980c40b6edfa68b6acf926bab22448a6e40c9
-- 
2.25.1


