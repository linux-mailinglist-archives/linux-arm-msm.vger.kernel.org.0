Return-Path: <linux-arm-msm+bounces-62610-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FEABAE9A03
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Jun 2025 11:31:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4C74C6A2ED2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Jun 2025 09:30:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 070B92C08CD;
	Thu, 26 Jun 2025 09:30:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="jvVnVnRp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BDBB294A1F;
	Thu, 26 Jun 2025 09:30:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750930249; cv=none; b=c/FgtAc2vysKXElFGiwz+s67nR5cHROwOXNlHvatSIMg7Ks2hdnr+W2vVVwbzm5mQKiHElAZDG7bLMk6Tk0P5PZ3RmW/5s3XW21NlC4v6LzqHRka8SsHoVnNpkdKAQ3YdgQzsR/ttUCRFgQ/aBJwfcUVMtftaZIms3DOt1Knsxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750930249; c=relaxed/simple;
	bh=b2zKE+3uvG9154wnTmlIeG4TDkyOVnLiWNKWhGf4okc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jzNPqpRaxVEAg4rJXEODsUMgqroC+d4AnIwUuMTRdXzM7a3ngvY0wOrX/Uu2ixwd65Ah8GsHYTmJesh9T1yPAnxUgV7xjwKy7D6aXVMUbLPwSzvBFAUD2GRhMY0g1VDOqxeg409k8s1iQ/w/ELjagqUlsygMfGPdm0IBpu0wW70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=jvVnVnRp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55Q0Dqds013214;
	Thu, 26 Jun 2025 09:30:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XeW6mDR5BeE3PJu6JD3SaAbWNzpRa9O4lAF+yvP8MKM=; b=jvVnVnRprFf1aZUb
	AdcBxs9qoKvdLZlDAayIC94MsdwP8M3M/yxWCxzN1JGS/wXzwAlETlPN8N2DAnvI
	oMNC2Qj9k5DS94rpW+7zloI9wLsy9djVzLQVkzthXeb7CNuDj7+wayLlpaaxDeBE
	o5f3Juc9hIXa/2MpVecxGiJVbx15mOmvo6CKjtgZ6Xh8+F4gS4c5QewCXhg6NOl2
	nOqUJlRLTfkTHi7u5yD75qPEGctDh571UqjbsO9Sw1JUq/A+gAZ17wmKIMCAHoi8
	kV/7Iz8eqW0dSXThq+NyzCqAUX3k4zGL22uTB7hMtzbiMtSWekyfRDDz+y+urWUq
	l+osSg==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47fbm21bru-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 26 Jun 2025 09:30:44 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 55Q9Uh3E022600
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 26 Jun 2025 09:30:43 GMT
Received: from hu-lxu5-sha.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 26 Jun 2025 02:30:32 -0700
From: Ling Xu <quic_lxu5@quicinc.com>
To: <cros-qcom-dts-watchers@chromium.org>, <andersson@kernel.org>,
        <konradybcio@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>
CC: <quic_kuiw@quicinc.com>, <ekansh.gupta@oss.qualcomm.com>,
        <devicetree@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Ling Xu <quic_lxu5@quicinc.com>
Subject: [PATCH v3 1/2] arm64: dts: qcom: sc7280: Add memory region for audiopd
Date: Thu, 26 Jun 2025 14:59:51 +0530
Message-ID: <20250626092952.847393-2-quic_lxu5@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250626092952.847393-1-quic_lxu5@quicinc.com>
References: <20250626092952.847393-1-quic_lxu5@quicinc.com>
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
X-Authority-Analysis: v=2.4 cv=YYu95xRf c=1 sm=1 tr=0 ts=685d1344 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=JFHFcrwICz0D0NJ76h4A:9 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 3XO4jYupYb1BanW6YruUlIhalEfQoj_C
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI2MDA3OCBTYWx0ZWRfX7vT59Abx1WGc
 t5IH/jRm+ddGi4cdxgFM4yWtEGiraCJHbePtWkd7AgQkSlA1wuj5JCIc03L85JaZJvRJ5a/abO6
 LnuYBKWS89d5PiZWGmW8wZFyuNHivpOWd+GSCA6dgGfl/35bIhUO99ANgkWy0DvdwQKxDh0+q8C
 XlXBgJuQTJQwgUIyOlpo2DwSG5l016m8QUG8kcrW1mUVUyTIcUyD4s1tp7h1Ha9nURM28FfuZ9d
 1jLeFEOOlt0h4rq7bPQNfpFVA8iM86JgRK6HQE/fWZI2R1g6TQ/W2Wa25mG5V8LApJwRum/Hq6a
 p1fhUE3saeY9z3S67Cu0/J+avrRA+nQCTboNLdW/Q/R6W3XCRkKxCY4MYjkrv/z1Jg2RhDGIq7u
 oLYB2fOBmPqrFft/JO+0r8gOEMtIzk+JNEv+EmGPvam9uEnh9Yj+VY9TZMeP+9LstrH65Mvw
X-Proofpoint-ORIG-GUID: 3XO4jYupYb1BanW6YruUlIhalEfQoj_C
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-26_04,2025-06-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 spamscore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 priorityscore=1501 phishscore=0 mlxlogscore=564
 clxscore=1015 mlxscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506260078

Add reserved memory region and VMIDs for audio PD dynamic loading and
remote heap memory requirements.

Co-developed-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Signed-off-by: Ling Xu <quic_lxu5@quicinc.com>
---
 arch/arm64/boot/dts/qcom/sc7280.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
index b1cc3bc1aec8..982f120511a0 100644
--- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
@@ -189,6 +189,14 @@ rmtfs_mem: rmtfs@9c900000 {
 			qcom,client-id = <1>;
 			qcom,vmid = <QCOM_SCM_VMID_MSS_MSA>;
 		};
+
+		adsp_rpc_remote_heap_mem: adsp-rpc-remote-heap {
+			compatible = "shared-dma-pool";
+			size = <0x0 0x800000>;
+			alignment = <0x0 0x100000>;
+			alloc-ranges = <0x0 0x80000000 0x0 0x40000000>;
+			no-map;
+		};
 	};
 
 	cpus {
@@ -3899,6 +3907,9 @@ fastrpc {
 					qcom,glink-channels = "fastrpcglink-apps-dsp";
 					label = "adsp";
 					qcom,non-secure-domain;
+					memory-region = <&adsp_rpc_remote_heap_mem>;
+					qcom,vmids = <QCOM_SCM_VMID_LPASS>,
+						     <QCOM_SCM_VMID_ADSP_HEAP>;
 					#address-cells = <1>;
 					#size-cells = <0>;
 
-- 
2.34.1


