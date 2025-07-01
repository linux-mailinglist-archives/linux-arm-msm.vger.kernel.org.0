Return-Path: <linux-arm-msm+bounces-63162-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 62EB6AEF1C4
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Jul 2025 10:50:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 509447AB975
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Jul 2025 08:48:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13D6526CE39;
	Tue,  1 Jul 2025 08:49:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="TByWK73g"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 756F526C3A8;
	Tue,  1 Jul 2025 08:49:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751359776; cv=none; b=IqVJNYqa1hOBFepxkTGuUiiFyhrknpr5Oi3yJQt5npiGoOZlMpueiqUk0z533ESGrQnxPIT9miPFAzMncY5YoaRax38pkpqy0Rv2sGsup6/h7o2VVbsr4PR0uT2UJuPz9YROcDHm9OUFSzaV8CNEt4viBD9EzraEHU7e/9cZwcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751359776; c=relaxed/simple;
	bh=qLXjXoxySGk5pUYlK/3Skf+YEMn+qccBHOoz+KmtlVM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lEDRN3c2MUjSTPECtxacdCtrEVhRn2LTeKwn4fg8NzZ6lSbtDAobXORJ+P+AxMgbSa3BJ12TuVlY7PPBMxbgOGeTwwFaJ/z3yGMbCoUCoBuGMCjwOsog4aEFkTe4OO3rhlLuzLxEe+CAORRz967H6gCGyv7upjWCQ0FOqgRhT3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=TByWK73g; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 561335kY028616;
	Tue, 1 Jul 2025 08:49:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XriVdzbvQoNBy6XPDdjSm8kezTvk4/n4mf9gc6rsfAw=; b=TByWK73go4+kR086
	z/e1pk1+gn86THOGRgIFkDy1+KRts+RIqtX2X5PG/62PmqSVtFMEQYDQNtwzMEqD
	xqg6dD/Z3m1Wq6ZNf+SSDs0ss9X0vyhxlMljXmfC5KhXcjYuCb6S6J0Y5U4LS9ys
	xxh+jf5EqFuk0jYwgZazcOrqt5rb/iJyH74fY205FfgOeY8vz3vW4oSdtTu1uDtv
	BLGFKJIZIxBzCUmQgs99mdae3hBJOlm2Tds7NLkGzwjxQ7a3OBKxD/F1tyxzFJuh
	p65sB4nKfHtAQV6VbtOr354ZQB/LZcR7w7elDlL4Ry5G97uJTN6twxcemZ3UDYp+
	VGApKQ==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j7bvqvhx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 01 Jul 2025 08:49:31 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5618nUM9015527
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 1 Jul 2025 08:49:30 GMT
Received: from hu-lxu5-sha.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Tue, 1 Jul 2025 01:49:27 -0700
From: Ling Xu <quic_lxu5@quicinc.com>
To: <cros-qcom-dts-watchers@chromium.org>, <andersson@kernel.org>,
        <konradybcio@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>
CC: <quic_kuiw@quicinc.com>, <ekansh.gupta@oss.qualcomm.com>,
        <devicetree@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Ling Xu <quic_lxu5@quicinc.com>
Subject: [PATCH v4 1/2] arm64: dts: qcom: sc7280: Add memory region for audiopd
Date: Tue, 1 Jul 2025 14:19:04 +0530
Message-ID: <20250701084905.872519-2-quic_lxu5@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250701084905.872519-1-quic_lxu5@quicinc.com>
References: <20250701084905.872519-1-quic_lxu5@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: HtqxOk7Rtyej8UUKcLRai64jwKxsoN8J
X-Authority-Analysis: v=2.4 cv=RJCzH5i+ c=1 sm=1 tr=0 ts=6863a11b cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=JFHFcrwICz0D0NJ76h4A:9 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: HtqxOk7Rtyej8UUKcLRai64jwKxsoN8J
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAxMDA1MSBTYWx0ZWRfX17YMbI7ujJK1
 ymnyz+Hv2TE/CFKZrVmA3qjr4mWlH4KZBhYTaHyRnsiox6OK2E6MeQAoRzuASe463QI15ty1OII
 neUH9MizCFXzemLgdhre+reNd0kSudtdBeWZIWHUnFDDaUCpxtUOB/wrZQqeK4Krs7QAXQJsEci
 JAmj4V1iyXESsB8XPSV2k3ezfz0N3MbDMLgwhEwAExP7fMDgRJzO2YnZnkQPS1KbBB7om88/DGa
 zRPYiWWOVfAi2CDoYe6mxYZtEXItTvRwYFN6zfR7ZBecP7FgrdbDotPM02slL0tZ8W+kOSKkYRT
 BgY1xQgr7yQiUtoXMDpDY0F2Pi30ni7pmQLOE48JsEBXI0gCdAxJuEML/rCUleYbsn3bagKJLGC
 7MJxxg375w5j61c5LptP8H02tj8kaerMg2kp5HXX3PVcJkXAvuJuzt/uL6GxX3xCuD/NFWBv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-01_01,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 priorityscore=1501 mlxlogscore=622 adultscore=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0 phishscore=0
 bulkscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507010051

Add reserved memory region and VMIDs for audio PD dynamic loading and
remote heap memory requirements. This is required in use cases such as
audio compressed offload. For example, playback of compressed formats
like MP3 need audio PD support.

Co-developed-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Signed-off-by: Ling Xu <quic_lxu5@quicinc.com>
---
 arch/arm64/boot/dts/qcom/sc7280.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
index 64a2abd30100..b1def5611764 100644
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
@@ -3907,6 +3915,9 @@ fastrpc {
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


