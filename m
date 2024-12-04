Return-Path: <linux-arm-msm+bounces-40207-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id BC6159E382B
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Dec 2024 12:03:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0B333B2C7ED
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Dec 2024 10:53:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F7241B0F33;
	Wed,  4 Dec 2024 10:53:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="prFziFC7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87AC51B0F3E;
	Wed,  4 Dec 2024 10:53:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733309586; cv=none; b=arOVDnO3g0NohG1nyrjJPO1CaZwdXX37h/LgUGpaGfzuDHZJ8CRSsm8MbNb+DASzypXpA3z1fsFb9wbZ9zkXvM7jRZLyg8JPm+AE2m46cRzRbFRw0NvY7MW0eFNCZNUH3a7vZB97M+ddf+dZE4GHGEkXzdFwz6HnHI/AWfjjPu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733309586; c=relaxed/simple;
	bh=2XqCUZntP3GVMOu4F+3n1qsClWWAox0bQmcBQ7SAGdw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=pNW7nPK+2TOHQBuyu8O4nkP9/u36eM1gEGlZk42ll/2jvHVJTJfnjt69hzDPZTUECUI+EklZSnz0GJbJjVkEUMIISvmQveFt5x0BS2f2xuhmRpv4Rb2EixN0NYZUvdfnvMWeAYAe1Evt8pitOXSRk+6UlzK8HT5ko/RizvvAn/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=prFziFC7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B46k3nr005923;
	Wed, 4 Dec 2024 10:52:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=27nhlilwqiE
	Waw/RZVDI8NiNZslOiFH8bwBpvz74TPc=; b=prFziFC7CUdI35/2zSQF1ufcHyi
	zSPSe58y5EXfsrsTsT00WJ2j76EAc8z1GY9Yuvl08BTBJ/zuNZhbCwdJUAiRLUMR
	+CUn9YEDSadLc65cDgyvONBTbYsv0apl1FX5oQ/qM/a7hXFyeDaydtAyN/new3dq
	uQyPeilvgs1JWCpqnN/VhUf5boOBEPkBewxv4ekeAxDNqgTNdmAEomHi5glsTUnM
	Zg0LDxSPyyvXJz8xb3XLWRM3l0DEiPRGzKncZWsSQmNAdCHfBym9n4m2rbQaaHak
	8NqiLrzVmxRZ8YQMZjjmmTqMy805xLn4dJzfUNO1GASpw4r54sw4COgxiWw==
Received: from aptaippmta02.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 439w3ekxmm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 04 Dec 2024 10:52:58 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 4B4AqupG009212;
	Wed, 4 Dec 2024 10:52:56 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 437uskmrtx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 04 Dec 2024 10:52:56 +0000
Received: from APTAIPPMTA02.qualcomm.com (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 4B4Aquwg009146;
	Wed, 4 Dec 2024 10:52:56 GMT
Received: from cse-cd02-lnx.ap.qualcomm.com (cse-cd02-lnx.qualcomm.com [10.64.75.246])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 4B4Aqtag008997
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 04 Dec 2024 10:52:56 +0000
Received: by cse-cd02-lnx.ap.qualcomm.com (Postfix, from userid 4438065)
	id D84BB19E3; Wed,  4 Dec 2024 18:52:54 +0800 (CST)
From: Ziyue Zhang <quic_ziyuzhan@quicinc.com>
To: vkoul@kernel.org, kishon@kernel.org, dmitry.baryshkov@linaro.org,
        abel.vesa@linaro.org, neil.armstrong@linaro.org,
        manivannan.sadhasivam@linaro.org, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Ziyue Zhang <quic_ziyuzhan@quicinc.com>
Subject: [PATCH 3/3] arm64: dts: qcom: qcs615: add pcie phy max current property
Date: Wed,  4 Dec 2024 18:52:49 +0800
Message-Id: <20241204105249.3544114-4-quic_ziyuzhan@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241204105249.3544114-1-quic_ziyuzhan@quicinc.com>
References: <20241204105249.3544114-1-quic_ziyuzhan@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: jIcWJVyQ7X0Wsb1_SJD_gOOtJWpwQOi2
X-Proofpoint-ORIG-GUID: jIcWJVyQ7X0Wsb1_SJD_gOOtJWpwQOi2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 impostorscore=0
 bulkscore=0 mlxscore=0 adultscore=0 priorityscore=1501 mlxlogscore=954
 spamscore=0 malwarescore=0 suspectscore=0 phishscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2412040084

Add vdda-pll-max-microamp for vdda-pll-supply. The value of this property
is from the power grid guide. It is the maximum current the regulator can
provide. The property will be parsed by PCIe PHY driver to set the current
load.

Signed-off-by: Ziyue Zhang <quic_ziyuzhan@quicinc.com>
---
 arch/arm64/boot/dts/qcom/qcs615-ride.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs615-ride.dts b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
index 18f131ae9e07..6d93ef0d886b 100644
--- a/arch/arm64/boot/dts/qcom/qcs615-ride.dts
+++ b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
@@ -215,6 +215,7 @@ &pcie {
 &pcie_phy {
 	vdda-phy-supply = <&vreg_l5a>;
 	vdda-pll-supply = <&vreg_l12a>;
+	vdda-pll-max-microamp = <165000>;
 
 	status = "okay";
 };
-- 
2.34.1


