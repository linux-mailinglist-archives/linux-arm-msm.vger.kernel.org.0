Return-Path: <linux-arm-msm+bounces-36893-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 66C819BAF47
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Nov 2024 10:12:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9916F1C2196D
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Nov 2024 09:12:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB5CA1B1D65;
	Mon,  4 Nov 2024 09:11:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="WlWsvIzg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1C6C1AAE30;
	Mon,  4 Nov 2024 09:10:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730711461; cv=none; b=bSb+Vl8B0wfnC6uHmPqhytKr8TKHFUFWKn2EtdYFu5D83HixnBhpVlQ0L8UWVbAf4l930wEJ0u0CQ4EUraHO5KkgCXwkYuOvX4PYHKslzgE204Iq8ijfQhyGz2e98UgpCO7sN56ivdqTP6XS1l7OArovAhQe9EnhdEBynrolznM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730711461; c=relaxed/simple;
	bh=FgpXDPvdyW2dkMmK3mzQApvR0QrH4RUH1uGBl0DZJ1o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=Qyxd6NzS03rKK6LV7VY3JIaS9+49K5Zu7dZ4uT6j6FPpsz8dCmVEcOhBJarESF7qUAIP8ypxsxPo3yndsODl25vHtfr7adOBv3KNvFx/HnQO74F7jG++bTxRo2KRpBU0OGV8Ct0AkYkdQ99HRPKKzU6zDceILyp/Nj+E7LrZOao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=WlWsvIzg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A3NUtHo009787;
	Mon, 4 Nov 2024 09:10:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	c8sfF3aQIGAzzyH12al7kJgk95PmqEJkNqA3sTHiJfs=; b=WlWsvIzgxRwXYqXP
	BhvgDQ0jaQahpTPfr+6qFkOwT92LwO/k+7xEY6JllzPTAE8Oe4dKUqGXAuHds/we
	DtYLXK9/c0X6ABbqC7HjDJviV8WmIvEXCxNVpvl4nPzTllwoIEgldvdATC/oLk+r
	NBlxbSb9SWzo4Y8RRteCgiOdIvC5LAZP97ygois+Yy2gCb7tE5HUDyYT6BulaaVc
	NJKduQWGRWIsvMN1mtFQY4FYEFgPWrGzu5Ry7fmTrgwh5xgCMsTxx7m4mY1K/ACb
	dLpcTNgTLgka5c7yKZHvVt80R65rQy+e/rGa7gSoBfcsYqTj/IVusUGNxeCvYFn+
	eo3icg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42nd2s3me6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 04 Nov 2024 09:10:48 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4A49AkYG015641
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 4 Nov 2024 09:10:46 GMT
Received: from lijuang2-gv.ap.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 4 Nov 2024 01:10:40 -0800
From: Lijuan Gao <quic_lijuang@quicinc.com>
Date: Mon, 4 Nov 2024 17:10:12 +0800
Subject: [PATCH v5 5/5] arm64: defconfig: enable clock controller,
 interconnect and pinctrl for QCS615
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241104-add_initial_support_for_qcs615-v5-5-9dde8d7b80b0@quicinc.com>
References: <20241104-add_initial_support_for_qcs615-v5-0-9dde8d7b80b0@quicinc.com>
In-Reply-To: <20241104-add_initial_support_for_qcs615-v5-0-9dde8d7b80b0@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Thomas Gleixner
	<tglx@linutronix.de>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon
	<will@kernel.org>
CC: <kernel@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        lijuang <quic_lijuang@quicinc.com>
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1730711423; l=1627;
 i=quic_lijuang@quicinc.com; s=20240827; h=from:subject:message-id;
 bh=FgpXDPvdyW2dkMmK3mzQApvR0QrH4RUH1uGBl0DZJ1o=;
 b=Rg8WD7r+VrYxZQmdJwA5Oe0TtpmqIOZUaiMwOvQ6s+kfDJ5ckl4EjOte9WKXSn334XPAqZwVZ
 0OFOsT3Xj3JCiZLgivLvY38h4WmG0O1Yr79D7snR9l+0OhzfHJCn3Kj
X-Developer-Key: i=quic_lijuang@quicinc.com; a=ed25519;
 pk=1zeM8FpQK/J1jSFHn8iXHeb3xt7F/3GvHv7ET2RNJxE=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: _Emm3XKn0M6nqgtGk87m6R9Wi0RMKQFu
X-Proofpoint-GUID: _Emm3XKn0M6nqgtGk87m6R9Wi0RMKQFu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0
 lowpriorityscore=0 mlxlogscore=913 clxscore=1015 suspectscore=0
 adultscore=0 priorityscore=1501 bulkscore=0 mlxscore=0 malwarescore=0
 spamscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2409260000 definitions=main-2411040081

Enable clock controller, interconnect and pinctrl for Qualcomm QCS615
platform to boot to UART console.

The serial engine depends on GCC, interconnect, and pinctrl. It is
necessary to build them as built-in modules because the debug console
must be registered before userspace is launched. The primary reason for
this is that, for example, systemd opens /dev/console at launch (i.e.,
when the init process starts). Therefore, if we register the console after
this, we will not receive console output from systemd.

Signed-off-by: Lijuan Gao <quic_lijuang@quicinc.com>
---
 arch/arm64/configs/defconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 0fad83642034..4657540d0c65 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -607,6 +607,7 @@ CONFIG_PINCTRL_MSM8996=y
 CONFIG_PINCTRL_MSM8998=y
 CONFIG_PINCTRL_QCM2290=y
 CONFIG_PINCTRL_QCS404=y
+CONFIG_PINCTRL_QCS615=y
 CONFIG_PINCTRL_QDF2XXX=y
 CONFIG_PINCTRL_QDU1000=y
 CONFIG_PINCTRL_SA8775P=y
@@ -1324,6 +1325,7 @@ CONFIG_MSM_MMCC_8998=m
 CONFIG_QCM_GCC_2290=y
 CONFIG_QCM_DISPCC_2290=m
 CONFIG_QCS_GCC_404=y
+CONFIG_QCS_GCC_615=y
 CONFIG_SC_CAMCC_7280=m
 CONFIG_QDU_GCC_1000=y
 CONFIG_SC_CAMCC_8280XP=m
@@ -1630,6 +1632,7 @@ CONFIG_INTERCONNECT_QCOM_MSM8996=y
 CONFIG_INTERCONNECT_QCOM_OSM_L3=m
 CONFIG_INTERCONNECT_QCOM_QCM2290=y
 CONFIG_INTERCONNECT_QCOM_QCS404=m
+CONFIG_INTERCONNECT_QCOM_QCS615=y
 CONFIG_INTERCONNECT_QCOM_QDU1000=y
 CONFIG_INTERCONNECT_QCOM_SA8775P=y
 CONFIG_INTERCONNECT_QCOM_SC7180=y

-- 
2.46.0


