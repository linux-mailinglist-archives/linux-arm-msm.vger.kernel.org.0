Return-Path: <linux-arm-msm+bounces-71764-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B9553B418DB
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Sep 2025 10:41:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 89B1C7A9EC2
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Sep 2025 08:39:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8294B2ED17C;
	Wed,  3 Sep 2025 08:41:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="oNCrr+qG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE34E2ED143;
	Wed,  3 Sep 2025 08:40:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756888860; cv=none; b=pMUB0JY1fX+M/xkK4I9YuRQQe83KctVn99hEtN/xeX/t8/6J/sfCyyT2S3zUlSehr1fbg8eh9hp6O6jDxChUiNvttf2qLitflVhX/6JcqVXQN3dzMUD0cxsh8WL5MLzLMSZXpAMzfR/WOlhCkZd4BSIF7f1Hlu+96IHVe2v9AXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756888860; c=relaxed/simple;
	bh=trM5lFVfJuLcskWsRDQBJ66zbapfjUGwwbelYAOZpM8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=m4td2aKB1/xg7Eyjs6Fr6YboJNpNAjgLHKXmaSlCJWHxA0BdqJIqRNRmAHHQeteiItrBjQn48Mj/hiCq3+04XYoYlxt3f4R83P7hdVeWVaLyCL/B/Q0bYIyjbae5k2VQHvm7HOFKvk3gy44E+cJeE7wzb0IsWj6i0N9ZZvb5e7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=oNCrr+qG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5832KugB004319;
	Wed, 3 Sep 2025 08:40:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Wvs97rc9cQ08wzIx7xGYW5zcX2wFFMyRXHrlsibY/sM=; b=oNCrr+qGWEQZ1g/+
	EPeESY9LrNQFh6sh2HDDyi+KvvTL4z/fbOc1G2RNyoeQOQy+oz4Kc9hbZ6x9G6g0
	fyjSkWnv3l2dY027ArMB+VPhCusFEAK+WAYSwBaZtrWNnIDhkzjgHX9UpHyqwUaS
	XW2oug33tph8jMb4n+c/5XXvseb0qgNk0GGH3l97YsRE650oivxCru4pDfQb5nnD
	NGP8T+KoAQBq88X4d1TgTfgk9re2BhJ9n+6fA8+aYiaQDvTgk52p45XoPo1x6qDM
	2lpyHV4ItiKK/MGJuUz2sUr6hp9L0rPG9TdOqYiqVy5yNQ7hJh3cl44AE3tVuR8v
	6soypA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48urmjjtmv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 03 Sep 2025 08:40:56 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5838etOm025499
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 3 Sep 2025 08:40:55 GMT
Received: from cse-cd01-lnx.ap.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.24; Wed, 3 Sep 2025 01:40:51 -0700
From: Wangao Wang <quic_wangaow@quicinc.com>
Date: Wed, 3 Sep 2025 16:27:36 +0800
Subject: [PATCH 3/3] arm64: dts: qcom: hamoa-iot-evk: enable video
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250903-add_iris_for_x1e80100-v1-3-410e9e6c79f0@quicinc.com>
References: <20250903-add_iris_for_x1e80100-v1-0-410e9e6c79f0@quicinc.com>
In-Reply-To: <20250903-add_iris_for_x1e80100-v1-0-410e9e6c79f0@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vikash Garodia
	<quic_vgarodia@quicinc.com>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Qiwei Liu <quic_qiweil@quicinc.com>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Wangao Wang <quic_wangaow@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756888839; l=718;
 i=quic_wangaow@quicinc.com; s=20250814; h=from:subject:message-id;
 bh=trM5lFVfJuLcskWsRDQBJ66zbapfjUGwwbelYAOZpM8=;
 b=fFTerCoD5skuEV5/Ax/uYZN1LBocMCUuD+R221LSxbNUpA7Xe85SDBTRq9YxEe5w4JIeFPU/i
 beaoyyQkWdtCF61brGLTt/NFJYG9ZSuNeKL10sKsRONpTAyIvEcOzpf
X-Developer-Key: i=quic_wangaow@quicinc.com; a=ed25519;
 pk=w32d+heQorY/WMv2MAjQHXfwz5WLNqBlarTPtMmAk3k=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=OemYDgTY c=1 sm=1 tr=0 ts=68b7ff18 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8
 a=uXrqIlmy1enw5aUSuQwA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: CCMyFpFqezx27Go31frST4wB_jC2srfE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAyNCBTYWx0ZWRfX1DwZYF9obIkI
 7rpE8pGJnrFNyuKi5C71mMhiv/oeJuF92DHw4ejazL5pkQN/VUmYtBl1pN9dQnWvZcnhd4SmRdh
 hETRV5bge7xVpqeC1G1iFNo9/EZCP7hKzl0ZLgeQxbOvX2zaquWO3pdK0/K3erwqXHYJMMfr/tc
 0daQloHScwWEvYL0JPD9If8fBOQ9LCTTzad+33vOPJlJbSmGVCfObGk99OrTFJnWn2T1Ut95vz9
 iNODZdAaij3KalC0ENN8FZVhU4GvCTQt4Ip9PKdNNUjT4ZO2oUMJLTHzUXi5PF4UW6JQubaQ/oT
 Q2HPlc8qG7HISFd+JqP2AIzfSOIMXQMewWutSh4/VSjh3VblUgU/wPwDmIQ7T9WIGHuEDCD7OhV
 X/fCGusR
X-Proofpoint-ORIG-GUID: CCMyFpFqezx27Go31frST4wB_jC2srfE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-03_05,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 clxscore=1015 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300024

Enable Iris video codec on the hamoa-iot-evk board.

Signed-off-by: Wangao Wang <quic_wangaow@quicinc.com>
---
 arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts b/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
index b1a8380d6639778b0201b49f217459da496883ea..8eafc6ae60bf77e34e8ca0586d86e69e3a190e9d 100644
--- a/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
+++ b/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
@@ -767,6 +767,10 @@ retimer_ss1_con_sbu_out: endpoint {
 	};
 };
 
+&iris {
+	status = "okay";
+};
+
 &lpass_tlmm {
 	spkr_01_sd_n_active: spkr-01-sd-n-active-state {
 		pins = "gpio12";

-- 
2.34.1


