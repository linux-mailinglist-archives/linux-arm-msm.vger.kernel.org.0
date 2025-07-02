Return-Path: <linux-arm-msm+bounces-63349-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 95B9DAF0F09
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Jul 2025 11:08:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 260D0161E2D
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Jul 2025 09:08:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D608D24DD0A;
	Wed,  2 Jul 2025 09:06:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="CYKAM0Tx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BC4C2417F9;
	Wed,  2 Jul 2025 09:06:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751447161; cv=none; b=uVJc9Tp3O8FubnHSm2G7/b5NZkmgz19CLnBMbGC6kAWMfr1jykcQxBkyiAJ60To91AFVekPT0CW2fcrujkEgLgfEQtiSMe60KN1vxSWNKptzCXsnhOaFxMjr+/lLiEkjrmuvQk0W7LLQTcB9TMS7fGXtAmMGudC3+2QeSeYAczQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751447161; c=relaxed/simple;
	bh=VZX8FhOZn+A2VpoDlQnaJSm+6rFeBl/toi1Zd8pgfQI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=LsOwXMYKD0P2l0oZS4vROcYkwBeV09iip7TcyrYMgrJi/PTr6JJ4UVCA2hJIDLsbS+pjNvGPWRwfS5cmLznV9HyMPvDAjlfnUuSj7MgK8l2eQWh0jiouY74F7UKbNxhOnydys8hzQcIk3L4drdCv9HEf5s4KRCg47GCnOVG442w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=CYKAM0Tx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5626moFX007047;
	Wed, 2 Jul 2025 09:05:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4D5xBGxSr4jfA7P6+oNyoTxU2RBo4soyNKPqrCLRTt0=; b=CYKAM0TxVhnhi19M
	O7geWmNioAV9szXM1OF7QXjhogvDwO3+bGMbV0cpPmCqsCx/AjCV4lNWboU0E2V+
	5TSqbwWTRP3Ae/zIrxFJdS6FeCf9rfy5Rlh1/pa+/mhP2+TGzvh7YFHQ3BVj8i5X
	YMj/Z1U1l/UnBkVmLgYHajF84iNHIE2N289asF5Env++3o37ZmioA7BZvWswB5gD
	pdeuQw+D5WXY9LPaCQsPIJFmm7t/ObGIwoff/jW+b7QHp+uhr20kuvwG3uV7+UPG
	C5y0eIqSJ4+8DN1GyoYTe6k9PWBiQg+ezOFVJIifQvGAcAoNCaiF0p8dHgnCUmUK
	x+8o3Q==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47kn5jga7y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 02 Jul 2025 09:05:52 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 56295pBF003686
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 2 Jul 2025 09:05:51 GMT
Received: from hu-tdas-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Wed, 2 Jul 2025 02:05:46 -0700
From: Taniya Das <quic_tdas@quicinc.com>
Date: Wed, 2 Jul 2025 14:34:30 +0530
Subject: [PATCH v11 10/10] arm64: defconfig: Enable QCS615 clock
 controllers
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250702-qcs615-mm-v10-clock-controllers-v11-10-9c216e1615ab@quicinc.com>
References: <20250702-qcs615-mm-v10-clock-controllers-v11-0-9c216e1615ab@quicinc.com>
In-Reply-To: <20250702-qcs615-mm-v10-clock-controllers-v11-0-9c216e1615ab@quicinc.com>
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
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=KtJN2XWN c=1 sm=1 tr=0 ts=6864f670 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8
 a=COk6AnOGAAAA:8 a=AElZlkIX1ip-SmTVEvQA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: 8D4pnAOlKXlkEx_FIGcSy9WTl_Nh1zEQ
X-Proofpoint-GUID: 8D4pnAOlKXlkEx_FIGcSy9WTl_Nh1zEQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAyMDA3MyBTYWx0ZWRfX3M3UH9nqqUIF
 H5xn16PPDkApfsNNCgDz1W+jXuogtMdbj7x4nThsXMjT8uxuY+SZjRS0u7v6RdwT8BIujnoVGOW
 1tTXtLCodYiW2dTHXSbCDwrxyuB6ygPZ4fss8oUKLbwnkMqRkbUqEWohYiVuxBUTbYuQJjQiFWf
 n3ficY3r0z6plcZ2hBxzSCdJdyMjer68lirfMZuvkVVG2iyqK0jt9Z5VeiDVZLILZfvCGanxi/m
 tcPJ6gHLAHfZPpITyxJefxUOzhG3e3J5zepDz238kl8FG4tMpqesB4TVLc7lowrIGhlE2AqXBH5
 QGN0eNbNCQkH0N6OWdw7QwiA6930nrh7CDlHjJ9GA+Pn4xJd4gWZaOWnHZrM9BWbWCcXJDK8tsV
 I2mts978dJEWPg81F6z8dMci13Q5du5UEkzG51kdTtMLfKY3CyPc+CWfjFunsKuNkp5QqGcU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-02_01,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 mlxscore=0 spamscore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 clxscore=1015 mlxlogscore=763 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507020073

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


