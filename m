Return-Path: <linux-arm-msm+bounces-60191-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 690F1ACD93D
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Jun 2025 10:06:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D9C3C3A70B8
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Jun 2025 08:02:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17B8B28B510;
	Wed,  4 Jun 2025 08:03:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ESUGD/pU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 850FC280318;
	Wed,  4 Jun 2025 08:03:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749024183; cv=none; b=tAywn9VfQw+Ve0Vnv0vtCQhGwANvYC8QYIzwvkHLuUlLvHgYObcP4NcWsox4tLS8nw3sGOHhilrcUAGFDv1anrtwA7hm/iH+7IbAhundcxpx5LHE/owwGOddVFp+Qd6aCyrtnQTxk8CPMaTHTAMeOg+wVx0KkvP4Mkw74BP6bpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749024183; c=relaxed/simple;
	bh=ARzsw3DVFJI/KaBVV9iAx3tCbPwv0HsIM0Gn+bEYd3o=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=UtM26E4wa5/2zl+SA59ANjh1NPF94pntvcy+ggAcrltSRObftAymlqrKKITHQrFYixI7ob4NTNbzTiCw7iyX1etSExNVJLscntVYfIPWVn42FGXmkKtzTd8pgM0QxmM/L74fGbBKofkcYhefYVftUaSu06fyLioX2eXPRCG59JA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ESUGD/pU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 553KpFxF006543;
	Wed, 4 Jun 2025 08:02:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=lQHwoMaMS3p
	BddPuGOSS8QoVRj/CJIKqPEmiKPR9kwM=; b=ESUGD/pUVt9p2Fd1+JnPE8DSvTp
	z1Ly/GEHwN/Vlo+k9uEXXexBLGXSRQICsV5ax10u//6J96REJoqZKVd8Y3fQ7YFM
	zwrL3OEFjJx7DxXOq4skKGDXfS1yBZ2AKw2oFp8nb8XTNBNF7kKthcF604MtvzdK
	mzyB4ZWqoWDUuciRPS5aSGuYhNo0v6S7UUGuHvEzpfO11l2atOvbdCxh6VrcySlf
	zcIsHLPvHK1m5obSIJnZTAkIS/uOZGy7t16dV+55pcX/A7LvEkOZIvAi+/WuBHn1
	mVS0X1mmlcOs4GURBjhgJAuKmzfzgTDuCps0SE9Myr9dg3tSByYto91E7rw==
Received: from aptaippmta02.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 471g8swa7x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 04 Jun 2025 08:02:47 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 55482jWh003948;
	Wed, 4 Jun 2025 08:02:45 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 46ytumens1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 04 Jun 2025 08:02:45 +0000
Received: from APTAIPPMTA02.qualcomm.com (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 55482iRl003943;
	Wed, 4 Jun 2025 08:02:44 GMT
Received: from cbsp-sh-gv.ap.qualcomm.com (CBSP-SH-gv.ap.qualcomm.com [10.231.249.68])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 55482hB7003916
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 04 Jun 2025 08:02:44 +0000
Received: by cbsp-sh-gv.ap.qualcomm.com (Postfix, from userid 4635958)
	id 7AC4340D26; Wed,  4 Jun 2025 16:02:42 +0800 (CST)
From: Wenbin Yao <quic_wenbyao@quicinc.com>
To: catalin.marinas@arm.com, will@kernel.org,
        linux-arm-kernel@lists.infradead.org, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        vkoul@kernel.org, kishon@kernel.org, sfr@canb.auug.org.au,
        linux-phy@lists.infradead.org
Cc: krishna.chundru@oss.qualcomm.com, quic_vbadigan@quicinc.com,
        quic_mrana@quicinc.com, quic_cang@quicinc.com,
        qiang.yu@oss.qualcomm.com, quic_wenbyao@quicinc.com,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v4 2/5] arm64: dts: qcom: x1e80100: add bus topology for PCIe domain 3
Date: Wed,  4 Jun 2025 16:02:34 +0800
Message-Id: <20250604080237.494014-3-quic_wenbyao@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250604080237.494014-1-quic_wenbyao@quicinc.com>
References: <20250604080237.494014-1-quic_wenbyao@quicinc.com>
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
X-Proofpoint-ORIG-GUID: dSNcxvieKdWve-Kt8ZH-TWmqtoHavTOg
X-Authority-Analysis: v=2.4 cv=EPcG00ZC c=1 sm=1 tr=0 ts=683ffda7 cx=c_pps
 a=nuhDOHQX5FNHPW3J6Bj6AA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=ZDVFxM84AbWdf4itxYgA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: dSNcxvieKdWve-Kt8ZH-TWmqtoHavTOg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA0MDA2MyBTYWx0ZWRfX9VAlZbggzGFK
 EcqjROSaieZ7UawfipqoPHwU099pTj90FiOolb1UedeMEuBO/+Y6Hrak9Rvxt2YzDYhz3kzTlZO
 wIOkK7PuMmKjgEL23y1ETTmF3PmcXhmlJfH+WN9wQj4PPVZmAHNRErGnBOnAUlr8m/EtD97Vkt7
 gHxMb06RZr4UpZbbdGdyZiY3RkaIJKaAqT87E85uttH0RQAJG4ehiUOEsldmQNp6HS07VCj3FYz
 jK3aKBjl+jmyH9SWNqNJ3CaUfX1vpmI7hhIjNxAw2bCmibjuI4gaRlhOx6BHoJpRnwqaqbqJsE2
 bK1yZ/aPRUsxtCbgk9f/AKO3V7b0y7u8ZcRhxGATjvsSawfGOjsMxa4/XhZQrtqWn7f9jawYUK4
 pOKzOf1kSAFaBvtl/9G3AEUhqffBRpMp0ZfzTIbyMBX6uMom8JCodIU922vWfoHfVGkSKt8b
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-04_02,2025-06-03_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 bulkscore=0 priorityscore=1501 phishscore=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0 mlxscore=0
 clxscore=1015 mlxlogscore=942 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506040063

From: Qiang Yu <qiang.yu@oss.qualcomm.com>

Add pcie3_port node to represent the PCIe bridge of PCIe3 so that PCI slot
voltage rails can be described under this node in the board's dts.

Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
Signed-off-by: Wenbin Yao <quic_wenbyao@quicinc.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/x1e80100.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
index a8eb4c5fe..195404ccf 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
@@ -3306,6 +3306,17 @@ opp-128000000 {
 					opp-peak-kBps = <15753000 1>;
 				};
 			};
+
+			pcie3_port: pcie@0 {
+				device_type = "pci";
+				compatible = "pciclass,0604";
+				reg = <0x0 0x0 0x0 0x0 0x0>;
+				bus-range = <0x01 0xff>;
+
+				#address-cells = <3>;
+				#size-cells = <2>;
+				ranges;
+			};
 		};
 
 		pcie3_phy: phy@1be0000 {
-- 
2.34.1


