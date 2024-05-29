Return-Path: <linux-arm-msm+bounces-20923-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E1798D3468
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 May 2024 12:20:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 928391F25783
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 May 2024 10:20:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFEBE17F370;
	Wed, 29 May 2024 10:19:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="IKn8G9fl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7657015B138;
	Wed, 29 May 2024 10:19:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716977999; cv=none; b=a72+L6S7Mtc3mWdluBkyxUPIBvshMXASBSGL/e25eXQarL6KMKAqieV1KZSUsxNWySxOW3Neol3AEqKUtTkFVzl63UBmaKcWm10nEae/eQx48fRCPtrV/46fEgfiM45hEHE5Im10+d6o8zIS20OjASaRiWoFxUficXkZg4pwMtI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716977999; c=relaxed/simple;
	bh=yepmIr1KeJZ1adm9HItj40bp1twhYeU/zTob2IsWvtk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gZc8LZ8DFP/qnxkS+455Ch1vwVqf9s+yA1E1syaRLUzbkIAJxmaoExQjiNK5u2ziZlQ7lP3Um3IABrl6KMOmL7GR715M10mX4U27zGjOGnOePtxyjf/q5Z/GnzsfVTUMrkzgzY8tkJP1OxolaxCphEXKUhGIdF5LL2L+LYb+EC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=IKn8G9fl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44T0iCA7008944;
	Wed, 29 May 2024 10:19:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PJkv3N09Tygq4Nwf/+PGLGxoxsLkHYz3NVsF/c3ezhM=; b=IKn8G9flOEr2vVat
	SHfajcTGHZevi65BqEVkA0b5akSa3SCPdB/H5avnRfJE/D9h4z6ATV1iSEWZYVZH
	ZiRw0vs9uf3anyp+OzJRYEISXnxOGjaboXaiqybJ+TsilVPIDXyWgQ5LRevLyXSb
	3znbyrJsC2g4rYgVUSY9R59h40nx4KjOebYpHbkqO1g4EaRTk0Z1lNvTFPqPaUWj
	i3TZUnxtBcla2pQ0A0xLBTHALjW+VNf11nfOG2RW6DeeiBRH2Rt6QPBZcwCNurkN
	rmBuYgsiTXfBmbGuMoo+FKjKwzTb+dyD9OXM3feuQZORKx97iVgXu6/1/0o1rNRI
	lDos2Q==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yba0g8sht-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 May 2024 10:19:55 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44TAJrhF031636
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 May 2024 10:19:53 GMT
Received: from tengfan-gv.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 29 May 2024 03:19:49 -0700
From: Tengfei Fan <quic_tengfan@quicinc.com>
To: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <andersson@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <kernel@quicinc.com>,
        Tengfei Fan
	<quic_tengfan@quicinc.com>
Subject: [PATCH 2/2] arm64: dts: qcom: sa8775p: Add IMEM and PIL info region
Date: Wed, 29 May 2024 18:19:29 +0800
Message-ID: <20240529101929.3167610-3-quic_tengfan@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240529101929.3167610-1-quic_tengfan@quicinc.com>
References: <20240529101929.3167610-1-quic_tengfan@quicinc.com>
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
X-Proofpoint-GUID: rEYVgXhmJloULow4tfkAon55r5imnQQ0
X-Proofpoint-ORIG-GUID: rEYVgXhmJloULow4tfkAon55r5imnQQ0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-29_06,2024-05-28_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 suspectscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 adultscore=0 spamscore=0
 mlxlogscore=598 malwarescore=0 lowpriorityscore=0 clxscore=1015
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2405290068

Add a simple-mfd representing IMEM on SA8775p and define the PIL
relocation info region, so that post mortem tools will be able
to locate the loaded remoteprocs.

Signed-off-by: Tengfei Fan <quic_tengfan@quicinc.com>
---
 arch/arm64/boot/dts/qcom/sa8775p.dtsi | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sa8775p.dtsi b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
index 5632fa896b93..eb33b1587802 100644
--- a/arch/arm64/boot/dts/qcom/sa8775p.dtsi
+++ b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
@@ -3025,6 +3025,21 @@ tlmm: pinctrl@f000000 {
 			wakeup-parent = <&pdc>;
 		};
 
+		sram: sram@146d8000 {
+			compatible = "qcom,sa8775p-imem", "syscon", "simple-mfd";
+			reg = <0x0 0x146d8000 0x0 0x1000>;
+
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			ranges = <0x0 0x0 0x146d8000 0x1000>;
+
+			pil-reloc@94c {
+				compatible = "qcom,pil-reloc-info";
+				reg = <0x94c 0xc8>;
+			};
+		};
+
 		apps_smmu: iommu@15000000 {
 			compatible = "qcom,sa8775p-smmu-500", "qcom,smmu-500", "arm,mmu-500";
 			reg = <0x0 0x15000000 0x0 0x100000>;
-- 
2.25.1


