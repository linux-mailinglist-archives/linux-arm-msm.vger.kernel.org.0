Return-Path: <linux-arm-msm+bounces-62429-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 19FE6AE8004
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 12:47:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 33E187AC8A7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 10:46:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49CD32D6620;
	Wed, 25 Jun 2025 10:45:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="L3RxeuIV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC2162D5C79;
	Wed, 25 Jun 2025 10:45:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750848333; cv=none; b=Hhu08L6vAhVlzr9kJa1CrTPu9ccP55u4Ecb4xEkqzoYUkk3Ti71lB1pg2BkY96LwWsi1h5TCQDpxssyGeHhwHZ6vTafdQxzVuqSuEeHfOADN3LQBP9Kg71m/lKTXSng0Za4TOixloacs5HvHRJst+hyxTe8tlvmsyW+1xnGQPFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750848333; c=relaxed/simple;
	bh=VZX8FhOZn+A2VpoDlQnaJSm+6rFeBl/toi1Zd8pgfQI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=lATiJChrkv4HyJgTVPSZ1MmyFfx+iXLkhintN1W0dQ3ccWstsuF9g4skMOZLtNP/kDtXiWHKp4Ebx1/IrMNytfa2rsUjOqVmjjzfCX0sk137S0XbV6QteG0EB0aIdmTpZr+y06XuPEPXUhetnuO2J8jmuFARdbUcIqbfMr9zWPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=L3RxeuIV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55PAfEYF000685;
	Wed, 25 Jun 2025 10:45:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4D5xBGxSr4jfA7P6+oNyoTxU2RBo4soyNKPqrCLRTt0=; b=L3RxeuIVxh5uFPnw
	7S2T3NACZcmdWobfvAGeAC93XFllG1i3oqG65rTdVcnKCdziZpdipIMKhmb0gGQj
	gM8knIhPbZhPbzdeLlbxBBh4MFLsW+I+VMDEqBws0umh+6j089UwCHwkSLzTW17e
	YDdyit57lm04jsXvZC67mJxtXQ8bxl3GbFhaMrXFj99tdJ+BBxKmdL+uZ6eeUzov
	mlF4H5JP4zrv4qseXcOv7FYrZ9dD40mjZtwGME0zd58D+9pYPLQov3VMN2KtjaFb
	lNzZNA64UiAXLJPHICWprJjODASAFBfZDJfBivzL2nwMGvUDEglsS4sS5mT8txeA
	95qRRw==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47g7td9d6f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Jun 2025 10:45:21 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 55PAjKG0000741
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Jun 2025 10:45:20 GMT
Received: from hu-tdas-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 25 Jun 2025 03:45:15 -0700
From: Taniya Das <quic_tdas@quicinc.com>
Date: Wed, 25 Jun 2025 16:13:35 +0530
Subject: [PATCH v10 10/10] arm64: defconfig: Enable QCS615 clock
 controllers
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250625-qcs615-mm-v10-clock-controllers-v10-10-ec48255f90d8@quicinc.com>
References: <20250625-qcs615-mm-v10-clock-controllers-v10-0-ec48255f90d8@quicinc.com>
In-Reply-To: <20250625-qcs615-mm-v10-clock-controllers-v10-0-ec48255f90d8@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        "Catalin
 Marinas" <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
CC: Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik
	<quic_imrashai@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        Taniya Das <quic_tdas@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=CPYqXQrD c=1 sm=1 tr=0 ts=685bd341 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8
 a=COk6AnOGAAAA:8 a=AElZlkIX1ip-SmTVEvQA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDA4MCBTYWx0ZWRfXzA66QZK+FjFN
 eKCKEtsChPGESg+DIWZgLI+rFXVT53hvpyWJ9m3YJTEVOU4hUk5eRrCx5VyF5EI6ZWnYhROaBbe
 RBlW2E4/DFF4MpuevYSuy6I0QGlYBsfVGvpYfLryAhAwJf/kxCXhP8ZNeZycLm7zMMwxk+PmaVH
 mp88zl98QhmLg9wy028g7Gf02l+McigJ6qjKpBYtIt35J6tmkUKDkM9VXt2FQlXMPPSBglyXgH0
 zUcXgnxY2PHq8D4HEk4katJ+xfd5W7QyFZe5McPYK0cg3+MwkoefyMa/HbJvTLfjTITYXxoBuvO
 /wqHKt62nU7MhJgiWXeb3ANaQrtpH+UOcvzzDX2d43Ws2op2xHbQh+5mc/Wdgwm1lbEIxnojAp6
 V6Lh9YJuux6dMk3tkUp6BQ6AfZbJMY9rCa+Ji77rnU9/lDUg9hDt69OQNT0CbHlGUCzpR8oc
X-Proofpoint-GUID: CiLf5sYbP2_7lyylUu7L9_5nDRq3Ho-S
X-Proofpoint-ORIG-GUID: CiLf5sYbP2_7lyylUu7L9_5nDRq3Ho-S
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_03,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 mlxlogscore=760 lowpriorityscore=0 malwarescore=0
 impostorscore=0 suspectscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 adultscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506250080

Enable the QCS615 display, video, camera and graphics clock controller
for their respective functionalities on the Qualcomm QCS615 ride
platform.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
---
 arch/arm64/configs/defconfig | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index e071f8f45607dbfd8e00b915b27999949ee0fc88..3c5c1901ca5670d1bfd0a6edd73f0591ccb9c76f 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1375,11 +1375,15 @@ CONFIG_MSM_GCC_8998=y
 CONFIG_MSM_MMCC_8998=m
 CONFIG_QCM_GCC_2290=y
 CONFIG_QCM_DISPCC_2290=m
+CONFIG_QCS_DISPCC_615=m
+CONFIG_QCS_CAMCC_615=m
 CONFIG_QCS_GCC_404=y
 CONFIG_QCS_GCC_615=y
 CONFIG_QCS_GCC_8300=y
 CONFIG_SC_CAMCC_7280=m
 CONFIG_SA_CAMCC_8775P=m
+CONFIG_QCS_GPUCC_615=m
+CONFIG_QCS_VIDEOCC_615=m
 CONFIG_QDU_GCC_1000=y
 CONFIG_SC_CAMCC_8280XP=m
 CONFIG_SC_DISPCC_7280=m

-- 
2.34.1


