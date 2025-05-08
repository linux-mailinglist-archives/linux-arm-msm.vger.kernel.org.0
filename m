Return-Path: <linux-arm-msm+bounces-57226-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CD1B1AAF54D
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 May 2025 10:16:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9BE583AB079
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 May 2025 08:16:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DBA1221FAE;
	Thu,  8 May 2025 08:15:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="To8Mi28Y"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5659721D596;
	Thu,  8 May 2025 08:15:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746692154; cv=none; b=WIC2vgBeLuk8GFyVYuMusnwjQA7l/7X/+IZ/FWGzYkFrEl9wDQWbz7RVyGZPMsuNXul3NHffw7v/gTG+Su+/vZd3ejMD8O9MgsAiXiwMQZVzDYe35g6f7FFj60r431DxCsVlnq+q1JtWwSrmaKqMuEItD0oBK0qr4tPziWrEvyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746692154; c=relaxed/simple;
	bh=qDHKqdI2kzge4E963zXMYiyfXzDTjL1j/9kQS9Q7VvE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=gFuErwpVqtTT2esvghENusm0CsFNkrTLJZu4JstPPizEXS22gYoDowVxvQmv0cemiNayyxhkUCirpnAdK4OtbOs/PLi7suUCoRd9qNvJ1Sx6iU3w19jG3+CbtK9TDc3C+0FqCL6ySWO0617h2j1+ASuoBXtSeZeVvmIvBHwaBVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=To8Mi28Y; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5484WRl2014286;
	Thu, 8 May 2025 08:15:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=wZqZjfKKEL4
	gHkQeDdNNEMxYXCbXJUyz/t43Fq384O0=; b=To8Mi28YvOI7dXM4K12Ul1pF4wv
	Yuqnm9mjIzojlnY8RVLn14gglk1ifzGu+Ur/5W0DRgEC1QHuLoTqkTv9Q3kpQ9vO
	pSI1SXciTXmPpzIrxwuHPQWM9RTU93CebCpO3VCIvuNxSajkkrybT9FS279bhEyk
	5/JoF1fe+EHDDAQCgcNSlFXRUjfVFG2Cmg3pQNkED0q8AiplffqCrW7QuggsD0u7
	LPkbdPIrbvJEV2CpsETww4TA080Tv1oUoI0Z8l8GtNb/ybMWwbhSoiyK6Fjbc54O
	+prKqNqd+enz8IxNfzzjCkpXlp9CQTr4xcb7wLQM6hd7jGubuYafvXKjneQ==
Received: from aptaippmta02.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46gnp4ghns-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 08 May 2025 08:15:35 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 5488FX39006376;
	Thu, 8 May 2025 08:15:33 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 46dc7mf84j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 08 May 2025 08:15:33 +0000
Received: from APTAIPPMTA02.qualcomm.com (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 5488FWRb006369;
	Thu, 8 May 2025 08:15:32 GMT
Received: from cbsp-sh-gv.ap.qualcomm.com (CBSP-SH-gv.ap.qualcomm.com [10.231.249.68])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 5488FWbQ006367
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 08 May 2025 08:15:32 +0000
Received: by cbsp-sh-gv.ap.qualcomm.com (Postfix, from userid 4635958)
	id 4234340D09; Thu,  8 May 2025 16:15:31 +0800 (CST)
From: Wenbin Yao <quic_wenbyao@quicinc.com>
To: catalin.marinas@arm.com, will@kernel.org,
        linux-arm-kernel@lists.infradead.org, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        vkoul@kernel.org, kishon@kernel.org, sfr@canb.auug.org.au,
        linux-phy@lists.infradead.org
Cc: krishna.chundru@oss.qualcomm.com, quic_vbadigan@quicinc.com,
        quic_mrana@quicinc.com, quic_cang@quicinc.com, quic_qianyu@quicinc.com,
        quic_wenbyao@quicinc.com
Subject: [PATCH v3 1/5] arm64: Kconfig: enable PCI Power Control Slot driver for QCOM
Date: Thu,  8 May 2025 16:15:10 +0800
Message-Id: <20250508081514.3227956-2-quic_wenbyao@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250508081514.3227956-1-quic_wenbyao@quicinc.com>
References: <20250508081514.3227956-1-quic_wenbyao@quicinc.com>
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
X-Proofpoint-GUID: 481nWpG-Z0Tf3w32Kn2NujcWXhWrDIJB
X-Authority-Analysis: v=2.4 cv=E5XNpbdl c=1 sm=1 tr=0 ts=681c6827 cx=c_pps
 a=nuhDOHQX5FNHPW3J6Bj6AA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=8J9pHfFvgnT8GwhQ4KkA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA4MDA3MiBTYWx0ZWRfXyXndZstS/ke/
 pFeu7nnsC1ZpIGX+PFI21xntAs99z1S3b8TxeRjv+U0p8XibS/4weIKThXs5JJ6wA3Z7PlyOPcG
 LHbXHhcMA1JQke/9ha52f7SKcHPlpXvQRiFMfVJPD4nIv11ybAZdPcROBDu7h9VRT6o+wahAbLB
 bQwNCENcWcgLsy158HqIYBIXFs72y8gugp6DcxP9X8CPKC/vLKnEmVQBTQ1hUuWg/L7DIwC/bRb
 SZQxrp/fDSHc/VpmK9GpL0FmfXeqNvjmnvFbSHyHfzoteNbzMcvTVlnV/JMx69ivAup8Cm0AkD3
 RuOYDWmk8PlZfuQ07SomAJfHN9VQksfYfF7Joix8TQl4uVbDoYxivsfPkfzqTBjUapBGwfEC88s
 aREqr7d2XSxbrKLT5b7NUG/DbySC5ezfMeZrWvWvAZVIuDSock4PGj3OJ63DLd2wBWLSYieR
X-Proofpoint-ORIG-GUID: 481nWpG-Z0Tf3w32Kn2NujcWXhWrDIJB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-08_02,2025-05-07_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 adultscore=0 mlxscore=0 malwarescore=0
 bulkscore=0 phishscore=0 spamscore=0 priorityscore=1501 mlxlogscore=797
 lowpriorityscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505080072

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
index a541bb029..0ffd65e36 100644
--- a/arch/arm64/Kconfig.platforms
+++ b/arch/arm64/Kconfig.platforms
@@ -270,6 +270,7 @@ config ARCH_QCOM
 	select GPIOLIB
 	select PINCTRL
 	select HAVE_PWRCTRL if PCI
+	select PCI_PWRCTRL_SLOT if PCI
 	help
 	  This enables support for the ARMv8 based Qualcomm chipsets.
 
-- 
2.34.1


