Return-Path: <linux-arm-msm+bounces-55583-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6443DA9C376
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 11:30:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 38CC27AF60E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 09:29:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E473A2367A0;
	Fri, 25 Apr 2025 09:30:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Cn3OYWLb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58C182367BB;
	Fri, 25 Apr 2025 09:30:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745573412; cv=none; b=bYTrktN39NY39BbOyGy41yCNR2sYy3yltn+pHd7Co35ExrhH5Qw6RoDxx6I4NOE4T0ylqyfeZhCk9QiMdjEtnFnhoElNXp7qlB9mv9Dz//Jss92AIuYBKJTmF7Rsin42TcPaZPHlAD4PjM4jlTqQbP/qvggZTlaykEDexhen5Ds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745573412; c=relaxed/simple;
	bh=FtMUst/sKqBZ4kcU+NXPA2kOVF4+wLduosgfI18moeQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=iyDgtSJjHWse6pK285qI79D00ZMZJuPh2CrH4KNuU9ggFMWScAL/ntS+8lWOjV/iNLOxEeWnHCdFzatjNIhIyfBUllZm3AMpDz4W0fbB3kXPyNHjnGb9ewDs6z+8y+Z2xlJ9D93qqr+2LJLzycicznI9DNT3ObzUyYfJ0MipN5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Cn3OYWLb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53P8TN7a015932;
	Fri, 25 Apr 2025 09:30:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=F8R5L9aakpm
	2jVBnWr557mhK6/T+rfwUGBzGcgDrYr4=; b=Cn3OYWLbzlZq3yU8ptl3DCFO8fN
	apv9OdPBoLz6629U4ojzPbrNDuxXyHXGUKv1X25AdURWavEnjdGlFfiJbFVqAU6X
	plz3vZSnhydeg+xWCvXu1MKzsRME+xuyT0aFUkrKB4Db5za2yhZMIqmqRT5V3uQD
	1Q3EfZYgijFKOmxemhtRmvI971M7BkEhVk/l/eFl34RRXlQhzUjdmC6xF0V6LbRH
	8GxBACX5o87KulvCPtKFSSxmUPJI2PnGYm66A8pM+aV6P+/L5ERrOAiElWeIUDlW
	zvkUTje14+sJRKw8cSBpDWreBQu4q+ReEs0dFrqTmk4oF8hhpgcqjpTARnw==
Received: from aptaippmta01.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh3gg5y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 25 Apr 2025 09:30:03 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 53P9U1VL022154;
	Fri, 25 Apr 2025 09:30:01 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 4644wnf738-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 25 Apr 2025 09:30:01 +0000
Received: from APTAIPPMTA01.qualcomm.com (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 53P9U13R022151;
	Fri, 25 Apr 2025 09:30:01 GMT
Received: from cbsp-sh-gv.ap.qualcomm.com (CBSP-SH-gv.ap.qualcomm.com [10.231.249.68])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 53P9U1gv022143
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 25 Apr 2025 09:30:01 +0000
Received: by cbsp-sh-gv.ap.qualcomm.com (Postfix, from userid 4635958)
	id 1D44340D6C; Fri, 25 Apr 2025 17:30:00 +0800 (CST)
From: Wenbin Yao <quic_wenbyao@quicinc.com>
To: catalin.marinas@arm.com, will@kernel.org,
        linux-arm-kernel@lists.infradead.org, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: krishna.chundru@oss.qualcomm.com, quic_vbadigan@quicinc.com,
        quic_mrana@quicinc.com, quic_cang@quicinc.com, quic_qianyu@quicinc.com,
        quic_wenbyao@quicinc.com
Subject: [PATCH v2 1/4] arm64: Kconfig: enable PCI Power Control Slot driver for QCOM
Date: Fri, 25 Apr 2025 17:29:52 +0800
Message-Id: <20250425092955.4099677-2-quic_wenbyao@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250425092955.4099677-1-quic_wenbyao@quicinc.com>
References: <20250425092955.4099677-1-quic_wenbyao@quicinc.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDA2OCBTYWx0ZWRfXwxM3kTIXWh/C pZ8bDy+xaFkp8PyRnnJRULeL2URuXLLm1KnBd3F2MGL4lzBnleJRwBaU532LpDk2TLmpOaih2cL sb7pOitoG586881A0TIblmjPScpsZEId+O1QnyyF7RAsKg6TYupwxxjQojol9Mq2axzcdmBzN9H
 LhpM9j21DdJRPQjWhuh5XW+edydyWBa413u55fzLUGrarxSC417jv1ug/Tor67k1G4tg1hLUizE yZ+Z45h03iHNXKctG6MQbArmTwwytUA1QhFgh5bmxtroFc3up+eImWgX3agFhgiFxeQWdxqZn1d JIO/iR4+90JiPzc+F8j0jtFrzXnDU+rMEhS+aXFZMVkg1xcV2qKLXr+IaYeW9sRIpcpuYARkskX
 bfNKze3iIGLQyEJ+7nb65tRQ+/5vHy3bdmHV3Uj29cWJKoyqoGnVoO6Kp8V7NfDRZ0xTEfyJ
X-Authority-Analysis: v=2.4 cv=bs1MBFai c=1 sm=1 tr=0 ts=680b561b cx=c_pps a=nuhDOHQX5FNHPW3J6Bj6AA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=8J9pHfFvgnT8GwhQ4KkA:9 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: B6VPWns6vBRazbkQyXJZmCekCoKGNGIK
X-Proofpoint-GUID: B6VPWns6vBRazbkQyXJZmCekCoKGNGIK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_02,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 priorityscore=1501 suspectscore=0 mlxlogscore=798 mlxscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 impostorscore=0 malwarescore=0
 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250068

From: Qiang Yu <quic_qianyu@quicinc.com>

Enable the pwrctrl driver, which is utilized to manage the power supplies
of the devices connected to the PCI slots. This ensures that the voltage
rails of the standard PCI slots on some platforms eg. X1E80100-QCP can be
correctly turned on/off if they are described under PCIe port device tree
node.

Signed-off-by: Qiang Yu <quic_qianyu@quicinc.com>
Signed-off-by: Wenbin Yao <quic_wenbyao@quicinc.com>
---
 arch/arm64/Kconfig.platforms | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
index 8b76821f1..14d2742c8 100644
--- a/arch/arm64/Kconfig.platforms
+++ b/arch/arm64/Kconfig.platforms
@@ -270,6 +270,7 @@ config ARCH_QCOM
 	select GPIOLIB
 	select PINCTRL
 	select HAVE_PWRCTL if PCI
+	select PCI_PWRCTL_SLOT if PCI
 	help
 	  This enables support for the ARMv8 based Qualcomm chipsets.
 
-- 
2.34.1


