Return-Path: <linux-arm-msm+bounces-57138-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 426B0AADC7E
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 May 2025 12:28:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2D9091C2291F
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 May 2025 10:28:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 370E2231C8D;
	Wed,  7 May 2025 10:27:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ZYKFFUX1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86D79230BC2;
	Wed,  7 May 2025 10:27:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746613635; cv=none; b=M74icH8m8v9o1w5H/2eqADjXvWvswR3AgRgRVhBfb0Dz8MzTNvPODFzZo++uftnvnZWjCrz51uDaT/IOTH5+yOuoDdYyVhUqlVazGRhi48HwnHGNMKY/m786ZNZ6ObdglqLh8iNTjD9IC4fHaLlz7dq/x+6vrHzvz1pTTnXs8Vw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746613635; c=relaxed/simple;
	bh=YNJbihFXEQTt6TsSXi0wyo1LvabLzTl5hIf5/mOQ0eE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=oWxOIAygD0h1ELjSPgfiDZFLvx5nshdw+e9p4h7KVxgpiHa4chKteecQk+Fs8Yvx6s4kcc8HNE6eOBWjW9xuJT2Xq+Jy0gcGkDtbkOw3PDJUHICSrQUjA3iuetEydWR98y6k3n4iciIQGduP9HgRZnPCJBsqMwtJTO1bGJm7jdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ZYKFFUX1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5471HxcS023412;
	Wed, 7 May 2025 10:27:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	onlgBDApA9XnHotXxps33bpN4PvZ6Vj5OVrL++N2DZg=; b=ZYKFFUX1iby7CwWX
	4Ix9+y5OdAi1vglkmNXE1WtYmVCE3S5H4fbWUFD9j2SpIpZvKYEIxmYuJ6Oj9dIf
	MQLTSDaVAAEIyca3q+sfUyoXGs09/etC0Kmq9rFMfba8Brbmm15+H9frFbK7dWfk
	jMIxjBlFCZ9tFBl5e9+kKmDKNfqzyVpdDI+BRSXhRvDH7DhtZWSbcubEDUj7FNdr
	+1CI3OyT9EhObPzIOxekeo/b7PPTOTIEJ7HQCMhioAtNksgh+bx/rxkT0EEYvRxF
	wrp61TZfXr1RWOEMz3m156XLEPKsVWo5iBj6k9Rgm52fcRyHfBSJPsuNgoSj5tSg
	/fwWTw==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46f5uuweu6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 07 May 2025 10:27:09 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 547AR8bG024474
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 7 May 2025 10:27:08 GMT
Received: from lijuang2-gv.ap.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 7 May 2025 03:27:01 -0700
From: Lijuan Gao <quic_lijuang@quicinc.com>
Date: Wed, 7 May 2025 18:26:14 +0800
Subject: [PATCH v2 4/6] arm64: dts: qcom: qcs615: Add IMEM and PIL info
 region
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250507-add_qcs615_remoteproc_support-v2-4-52ac6cb43a39@quicinc.com>
References: <20250507-add_qcs615_remoteproc_support-v2-0-52ac6cb43a39@quicinc.com>
In-Reply-To: <20250507-add_qcs615_remoteproc_support-v2-0-52ac6cb43a39@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier
	<mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>
CC: <kernel@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <linux-remoteproc@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Lijuan Gao <quic_lijuang@quicinc.com>
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746613605; l=1201;
 i=quic_lijuang@quicinc.com; s=20240827; h=from:subject:message-id;
 bh=YNJbihFXEQTt6TsSXi0wyo1LvabLzTl5hIf5/mOQ0eE=;
 b=NuTCnujpvqH52ZOgcQqSAgFrJkZT3rGfdWo/kNtIXZDDUHIvV3Foh6PAeK/1jCXfkP+YNEYco
 wUBZHR4ZXxxBdIOVmUeR55kONBKF8NKoS4norq/aejlmIHT2vhaw32s
X-Developer-Key: i=quic_lijuang@quicinc.com; a=ed25519;
 pk=1zeM8FpQK/J1jSFHn8iXHeb3xt7F/3GvHv7ET2RNJxE=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=L9cdQ/T8 c=1 sm=1 tr=0 ts=681b357d cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8
 a=o6DZoYGZzlVHET9aO3MA:9 a=dYfqM7xYZjPnao7u:21 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: A2ruI4RDUQiQ0sPvJCsEEj8F1CJPsrcl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA3MDA5NyBTYWx0ZWRfX+ERGXFXU1hK1
 ViRXH5JVpedaGIGywe2xTeT94M5v5vjI/0KVD1aBGM1XiOT5ZHdf+S44r46xXEjRmQo3UxU4o6z
 kc1Qu39FDAWJ6b50ADbIqr9UGI4Odh1zAbzKprejPI2hwhnIJGLv7v7/k/YkSPWlujYaLsvFfcw
 U6K9Ca2ePqHl8jy0hKz5HVCSpJ8Fx4/DTwoePtPy3Cm+lUXmfCh+xXKyu/wBccaPPP+ssdRQ7YB
 +mdAh3x6otuRTr09/wI6DbL+cBJU4gwhDEl/YI7rKHJMgV5uiEHYwj8qVGSuFn++3yVqhs8GfrT
 8y3yXUghfs7N51CJ1lw7duzkm06MYEiT2/4OJHqV0Lr5FwJaxbp04qn5jHQIRKCQHzCbnBG37hd
 X/fRTHsO5DsOsSit0aVBR1Frwoxv10X3OKfb/ADHEEgEDCOFyRxze1gXyobRVXfCN+cL8lOK
X-Proofpoint-ORIG-GUID: A2ruI4RDUQiQ0sPvJCsEEj8F1CJPsrcl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-07_03,2025-05-06_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxlogscore=694 spamscore=0 suspectscore=0 impostorscore=0
 mlxscore=0 priorityscore=1501 clxscore=1015 bulkscore=0 lowpriorityscore=0
 adultscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505070097

Add a simple-mfd representing IMEM on QCS615 and define the PIL
relocation info region as its child. The PIL region in IMEM is used to
communicate load addresses of remoteproc to post mortem debug tools, so
that these tools can collect ramdumps.

Signed-off-by: Lijuan Gao <quic_lijuang@quicinc.com>
---
 arch/arm64/boot/dts/qcom/qcs615.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs615.dtsi b/arch/arm64/boot/dts/qcom/qcs615.dtsi
index 53661e3a852e..fefdb0fd66f7 100644
--- a/arch/arm64/boot/dts/qcom/qcs615.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs615.dtsi
@@ -3266,6 +3266,20 @@ sram@c3f0000 {
 			reg = <0x0 0x0c3f0000 0x0 0x400>;
 		};
 
+		sram@146aa000 {
+			compatible = "qcom,qcs615-imem", "syscon", "simple-mfd";
+			reg = <0x0 0x146aa000 0x0 0x1000>;
+			ranges = <0 0 0x146aa000 0x1000>;
+
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			pil-reloc@94c {
+				compatible = "qcom,pil-reloc-info";
+				reg = <0x94c 0xc8>;
+			};
+		};
+
 		apps_smmu: iommu@15000000 {
 			compatible = "qcom,qcs615-smmu-500", "qcom,smmu-500", "arm,mmu-500";
 			reg = <0x0 0x15000000 0x0 0x80000>;

-- 
2.46.0


