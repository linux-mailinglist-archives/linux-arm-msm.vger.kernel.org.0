Return-Path: <linux-arm-msm+bounces-58165-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D3693AB94B5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 May 2025 05:28:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 863F91BA8445
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 May 2025 03:29:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98F1422D4C7;
	Fri, 16 May 2025 03:28:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="OAbRp6Ox"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 088CE2206AF;
	Fri, 16 May 2025 03:28:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747366084; cv=none; b=rTlJEECxnImVxLPLxwquUkbFldCbG1A3Nq9eEEgOtQ4QytzWBfK7ZBHtWXBYmKMhEYDVRVprT8KVc8Nr5PkaO6UFhF1pDVNFUEdnxT8B3lffOFAxeS53tfTcBItayUvd4P9d1cSLieFykbb2oyT0KN21UAtk3B0opeBv1FJijSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747366084; c=relaxed/simple;
	bh=0RqBW5sW83mx/JQGL40K42n7y3CsEK4L2JZxfvI3UAA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=SyTvVZSt5fOY3kIJCqtquBpdu529d13W+mdrMWnerlCexim04IHzOGDLkerKx626UIvMktig86rxQd0cqs7PkM8A43dcyMtLp/c0VliOMvndlN5nvoGom5MRoQ0RSn4fEmjJFIDicsmf75rtvWRCUHFC+r2qyLnrjfAHtfcWxzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=OAbRp6Ox; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54G3Ol7i014961;
	Fri, 16 May 2025 03:27:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cV0gAquJNzDhmIcfnAktEfmHMxX7iDaorBetebklMls=; b=OAbRp6Ox0D4CnnCt
	UEB4arkwOs2gB9nBd4Q4VKNyd8otyF3NWiiAFaerNTSewpG8HXvi/b9WJHeq0OQV
	AstnGe/Fl3C5c7fOUXKEAy/Csj4gb3qbAf89LO85Q++df25BehyZtGIlyp65zQeC
	XmMGrW3iCd/P3M/hSHB5pe1rLi4BZi1+Rxg8KvLMR0X833msuEEg0QNE0MnVjRRr
	FOhjZf4oP6JHuTPqBxNv1ZqUH2SmNwVy2cqoDws7VrT0qJ2VeuND5tLOe4PI6ehc
	7PHvBuZ6zsKSMa9EffMK5EgSDYL5BgbQW7wGvN7q70paw4428Q0+uEj3uI1bK+0b
	nIEMxg==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcpghq1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 May 2025 03:27:59 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 54G3RwX6024599
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 May 2025 03:27:58 GMT
Received: from lijuang3-gv.ap.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 15 May 2025 20:27:53 -0700
From: Lijuan Gao <quic_lijuang@quicinc.com>
Date: Fri, 16 May 2025 11:27:05 +0800
Subject: [PATCH v3 4/6] arm64: dts: qcom: qcs615: Add IMEM and PIL info
 region
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250516-add_qcs615_remoteproc_support-v3-4-ad12ceeafdd0@quicinc.com>
References: <20250516-add_qcs615_remoteproc_support-v3-0-ad12ceeafdd0@quicinc.com>
In-Reply-To: <20250516-add_qcs615_remoteproc_support-v3-0-ad12ceeafdd0@quicinc.com>
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
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747366059; l=1263;
 i=quic_lijuang@quicinc.com; s=20240827; h=from:subject:message-id;
 bh=0RqBW5sW83mx/JQGL40K42n7y3CsEK4L2JZxfvI3UAA=;
 b=/rQsd6dJIs2qvATBmUZIkXCkOX8jQ+OwcQ9sfFlPkbtxIa+h2OyKyOeD19iZ0TrhHTmlhQWAA
 R9CPHdoAE3OA6MTaCg0UPr1R+yL3LkBbMIWSbxGE+vS4XJ5xPwHsbY6
X-Developer-Key: i=quic_lijuang@quicinc.com; a=ed25519;
 pk=1zeM8FpQK/J1jSFHn8iXHeb3xt7F/3GvHv7ET2RNJxE=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: qvEVXPFecJMwd0tyHfk3BWkRDj_xusil
X-Proofpoint-ORIG-GUID: qvEVXPFecJMwd0tyHfk3BWkRDj_xusil
X-Authority-Analysis: v=2.4 cv=cO7gskeN c=1 sm=1 tr=0 ts=6826b0bf cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8
 a=7w6Y4NPPTjXLb_l0MjYA:9 a=bP2nHhwNBwgAC3Jb:21 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE2MDAzMSBTYWx0ZWRfX0Ms9sIXlnJlW
 G5HgPQQGjFPmNBTfVSnOWvR6i3XGP38UnXwwLGChqmOXPL+XYF7+7uj1OGBcWcsfZUHaydJjAHl
 zSweACtf2nO4YZ4wKfcMAOEKWP4sp26pBdJskcnRzqercxPBLoKRc9Rmd7Ls0ziddeOMGipjeYh
 pEM/w4awwvetOQmX1ao3qSDdJgvFfpMVfCOlB9DmiQinNb8SHiknczObkncJN/Wdt39GiRU3rQz
 fU1ZTYVYFnDH5O2IaNWHUq6lCRlbNjXU3QblkqiwUfZPwd0ZCgXrUjRAyT+LEozwIeBPsnptU5s
 qW4O9Sf+gzEtm/8Sj4oNNg38viNRNGPKIUtbgwroudrZifYfzRM3tS1gulJALUYtUiukxcvOeEQ
 ZrvZwtQICwB2yCk3dE0IGp8zPEfMUqPB5h1FUVlSX2hK1gdJQEBDDMcSYnC3Y+Z0fhJ8MGtA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-16_01,2025-05-15_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=695 spamscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0
 adultscore=0 bulkscore=0 malwarescore=0 impostorscore=0 clxscore=1015
 priorityscore=1501 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505160031

Add a simple-mfd representing IMEM on QCS615 and define the PIL
relocation info region as its child. The PIL region in IMEM is used to
communicate load addresses of remoteproc to post mortem debug tools, so
that these tools can collect ramdumps.

Signed-off-by: Lijuan Gao <quic_lijuang@quicinc.com>
---
 arch/arm64/boot/dts/qcom/qcs615.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs615.dtsi b/arch/arm64/boot/dts/qcom/qcs615.dtsi
index f922349758d11ec7fda1c43736a4bf290916e67f..dd54cfe7b7a6f03c1aa658ce3014d50478df5931 100644
--- a/arch/arm64/boot/dts/qcom/qcs615.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs615.dtsi
@@ -3290,6 +3290,20 @@ sram@c3f0000 {
 			reg = <0x0 0x0c3f0000 0x0 0x400>;
 		};
 
+		sram@146aa000 {
+			compatible = "qcom,qcs615-imem", "syscon", "simple-mfd";
+			reg = <0x0 0x14680000 0x0 0x2c000>;
+			ranges = <0 0 0x14680000 0x2c000>;
+
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			pil-reloc@2a94c {
+				compatible = "qcom,pil-reloc-info";
+				reg = <0x2a94c 0xc8>;
+			};
+		};
+
 		apps_smmu: iommu@15000000 {
 			compatible = "qcom,qcs615-smmu-500", "qcom,smmu-500", "arm,mmu-500";
 			reg = <0x0 0x15000000 0x0 0x80000>;

-- 
2.34.1


