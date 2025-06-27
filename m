Return-Path: <linux-arm-msm+bounces-62751-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E0199AEB509
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Jun 2025 12:35:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8254F174920
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Jun 2025 10:34:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD9B0298994;
	Fri, 27 Jun 2025 10:34:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Za+ouAsz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56A3F29827B;
	Fri, 27 Jun 2025 10:34:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751020441; cv=none; b=DGjslpl1fEhe6N3HYlD9eiiVQrPBEOuNQavzzu5EJqPOKgBkqTcpnzyMqe6YJidBQ4VAyePqZCGG0aR0AC9gjgLuQ804xV9cwfaCb42eaTZ/BgTpKlKty0Jc6ek1aNEj/kIeizpNQk1BgAVh/+/I1feRniEnBXgJTBh4GUKq/hc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751020441; c=relaxed/simple;
	bh=H8B0Bm7S0ihb8Igkgk3H3hpxhA279MOHTv/twPaqI8U=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CY2w8V6gKH4dBBu7lkjEjtW1zgcuTwYRs1Y32AH/9c5y3R2AuJzYU0AkMY+KpJLHXtr0rsnLOaF+mdtOETLdT5L4bY6jmfpHLVOk7uxBTrUpmJ5P798lEw5sfGIeQtOnUEKRDxRe79zYFg5MTWsW585E6WLiRB15MKPQ+9ywSxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Za+ouAsz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55R4DB5h007184;
	Fri, 27 Jun 2025 10:33:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2JlfH29hZDylzSICiUbOaeWEvc0XKRrUMii7SvyAoVo=; b=Za+ouAsz699cdjM3
	YchLRpc8zA9PJEehYMVvLyw6wGcfO6+qvy/pSRItS7PJz1rSmxT7qgG4P9oSsxTb
	LxZjiLYx/IUHvdE9D35elTjYETzrTP7s5oJLtGQJJjHIggC9uKCsSELuk32W4Lhe
	g2JXSo3IcnZoTUZF0mIcoAaGfxJmfdbGREc0L7L2ad1CHgoSYRj7HDG8lor9k8sC
	pFpD/J6Gtfnm0Z24is2A9T2j+Kz6sHlfq4h3027iTLpYdu2FQ4usH94vrWtGUVSD
	KZgNMtSQIl3MqzptDQcUN6lPBizXVv/9Mg9uIG2tS24mEltmsehEq/BITEJAOAHb
	j7PPbA==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47evc5yp1x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 27 Jun 2025 10:33:54 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 55RAXrBC032061
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 27 Jun 2025 10:33:53 GMT
Received: from hu-lxu5-sha.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Fri, 27 Jun 2025 03:33:50 -0700
From: Ling Xu <quic_lxu5@quicinc.com>
To: <srini@kernel.org>, <amahesh@qti.qualcomm.com>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <andersson@kernel.org>,
        <konradybcio@kernel.org>, <arnd@arndb.de>,
        <gregkh@linuxfoundation.org>
CC: <quic_kuiw@quicinc.com>, <ekansh.gupta@oss.qualcomm.com>,
        <devicetree@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
        Ling Xu
	<quic_lxu5@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v4 2/4] arm64: dts: qcom: sa8775p: add GDSP fastrpc-compute-cb nodes
Date: Fri, 27 Jun 2025 16:03:17 +0530
Message-ID: <20250627103319.2883613-3-quic_lxu5@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250627103319.2883613-1-quic_lxu5@quicinc.com>
References: <20250627103319.2883613-1-quic_lxu5@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: o1XsFLd7fZ031VVpINT-9CW9zYUysXjJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI3MDA4NSBTYWx0ZWRfXzJ+nbxVueRYm
 FoQTQUtHWt3Nr1ikk+zcc94tgPonGEQV+K6WvjbE1DoX+m/IoGcHdh0um23R0E6bg/6+qjCUJU2
 toMLrsFqtLUKfLoe8R2Ltta7JuxIKY+ZGp+e21rL2HVzHNOOcZXg1KdWSlChTZSjvSp/d/hYFwn
 Gt1ehoJdmyn3bD4U3ofU3szq2ZHR2AE4vwKRKWdI76dFrkr+wE1jOloFwuRBA8xB6GquDF2WAFq
 45Y/bdL8mL0t/WGF3BFclTyf7u362oFXOWC43WIgLBQBmFUKM9qfeSaWlI5+qb1uQzTfoB+IRb4
 uo/4FnxO+WiNe9BItKQYAsXKpQQvQsVCjtraDA7XmvKtZjYJ2oRjTS/N/pEdHMIQ6mpBCvzxBPD
 huIenJDS584YMxauWpOG01VRmDhkWWQQOJgRV4Kt9XP70r4IKsarnV1hPkPfYbu5/nz2RpAe
X-Authority-Analysis: v=2.4 cv=caHSrmDM c=1 sm=1 tr=0 ts=685e7392 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=CfRyy-KmkZQ3OiQjKWoA:9 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: o1XsFLd7fZ031VVpINT-9CW9zYUysXjJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_04,2025-06-26_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxlogscore=834 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 adultscore=0 mlxscore=0 spamscore=0
 malwarescore=0 phishscore=0 clxscore=1015 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506270085

Add GDSP0 and GDSP1 fastrpc compute-cb nodes for sa8775p SoC.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Ling Xu <quic_lxu5@quicinc.com>
---
 arch/arm64/boot/dts/qcom/sa8775p.dtsi | 57 +++++++++++++++++++++++++++
 1 file changed, 57 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sa8775p.dtsi b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
index 45f536633f64..f69fb1d05a0d 100644
--- a/arch/arm64/boot/dts/qcom/sa8775p.dtsi
+++ b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
@@ -5605,6 +5605,34 @@ IPCC_MPROC_SIGNAL_GLINK_QMP
 
 				label = "gpdsp0";
 				qcom,remote-pid = <17>;
+
+				fastrpc {
+					compatible = "qcom,fastrpc";
+					qcom,glink-channels = "fastrpcglink-apps-dsp";
+					label = "gdsp0";
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					compute-cb@1 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <1>;
+						iommus = <&apps_smmu 0x38a1 0x0>;
+						dma-coherent;
+					};
+
+					compute-cb@2 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <2>;
+						iommus = <&apps_smmu 0x38a2 0x0>;
+						dma-coherent;
+					};
+					compute-cb@3 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <3>;
+						iommus = <&apps_smmu 0x38a3 0x0>;
+						dma-coherent;
+					};
+				};
 			};
 		};
 
@@ -5648,6 +5676,35 @@ IPCC_MPROC_SIGNAL_GLINK_QMP
 
 				label = "gpdsp1";
 				qcom,remote-pid = <18>;
+
+				fastrpc {
+					compatible = "qcom,fastrpc";
+					qcom,glink-channels = "fastrpcglink-apps-dsp";
+					label = "gdsp1";
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					compute-cb@1 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <1>;
+						iommus = <&apps_smmu 0x38c1 0x0>;
+						dma-coherent;
+					};
+
+					compute-cb@2 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <2>;
+						iommus = <&apps_smmu 0x38c2 0x0>;
+						dma-coherent;
+					};
+
+					compute-cb@3 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <3>;
+						iommus = <&apps_smmu 0x38c3 0x0>;
+						dma-coherent;
+					};
+				};
 			};
 		};
 
-- 
2.34.1


