Return-Path: <linux-arm-msm+bounces-57785-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B0A7AB6243
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 May 2025 07:24:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 95E981B446E9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 May 2025 05:24:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E9761F8691;
	Wed, 14 May 2025 05:23:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="g8NwRFJ8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF5A11F5847;
	Wed, 14 May 2025 05:23:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747200227; cv=none; b=Ur9bO7TjswWxknLI4rqRW0DtDNqeO6Mn5trIZCfc41WeuxtXC+8QGff9DyUyfO4OG9AL/ekXc1YZUXjQdesH8gI9Sy9Ba68a0T7wjaXEHTCjpn7fzexHDcB3qZbjq0+8i5HQGPCP2VvoO1AbIaMGcn+oPlrs22AA7QsKI/nDacU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747200227; c=relaxed/simple;
	bh=hj6p/9XjVqPnkOlvnul5ipzZo09E0/6ET2vgvj/a0xw=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RB7VcB4rsM3WVzM0yQS9jylPgvMAiAUuAk0HB4wrj3Rr6HogZvCiWDnEtBjOLEtXOubS52Q0BUOxUEFb7OlgedDmoEmoJE12ardhQafMv4tnW56oHR5qfy56IbEpJpxTyTmzRLz8mOtsNdIg/Wo2SKPCBZlvsq0wFOKpmqzvSEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=g8NwRFJ8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54E0edTM009946;
	Wed, 14 May 2025 05:23:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LPwCSahwj5jGugsPyNx5WkDUGlpC2Od1PAVVdx5EDe4=; b=g8NwRFJ8NHSR5qGQ
	epGpotnnhhcRdLwAGgfjU/x8uyACfp0jkDlALsv9mH8veq+NQe2bg9RjyOIZIRoV
	vX0z54ieM4P3iSu47KNjynFmflj0U8rFQ3ghsXYdyLpx1Sf287yaOpYPabOvmiPj
	j/9xZ7lRdQQ/J/9F6RZPXCQjVwQQ6uVIj6hcE+8g+aIU186KaTh5beMJAsptwHD+
	wO4CWna8DqEfGiGuDUrd7Taz7FoZmkDjhX0frAYkbjqLMfHALqaek9oPRpXmgygm
	YYcwBFNr6c/qCCCPKtieEsOj9TpzarDkUuk8GAnvJ3xKyUKV6tiqeaWjItwZSNAh
	WDuL4w==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcyhf2s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 May 2025 05:23:42 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 54E5Nf04030403
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 May 2025 05:23:41 GMT
Received: from hu-lxu5-sha.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 13 May 2025 22:23:39 -0700
From: Ling Xu <quic_lxu5@quicinc.com>
To: <cros-qcom-dts-watchers@chromium.org>, <andersson@kernel.org>,
        <konradybcio@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <quic_lxu5@quicinc.com>, <ekansh.gupta@oss.qualcomm.com>
Subject: [PATCH 1/3] arm64: dts: qcom: sc7280: Add memory region for audiopd
Date: Wed, 14 May 2025 10:53:21 +0530
Message-ID: <20250514052323.3881600-2-quic_lxu5@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250514052323.3881600-1-quic_lxu5@quicinc.com>
References: <20250514052323.3881600-1-quic_lxu5@quicinc.com>
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
X-Proofpoint-GUID: SatC2XDfdY5phCrozW3XSPqulAUjGWuE
X-Proofpoint-ORIG-GUID: SatC2XDfdY5phCrozW3XSPqulAUjGWuE
X-Authority-Analysis: v=2.4 cv=JszxrN4C c=1 sm=1 tr=0 ts=682428de cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=o7O2lQN-kgvADfYeIdcA:9
 a=wBcvOp6A19LE1pIB:21 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE0MDA0NSBTYWx0ZWRfX3fv7We15PXus
 P/RBkEbe4HOcym7mnxolresy9cnBZla2feU/BRXueipGJkPH/ScaZiMoLGWK2bzNfr1y4bTxmue
 ciKiv8eHlX7to1eLWEDjQ7nqmQxxNAvasmF1R7HQVmTwv1DzVat0n/IByZbhHHTdmAyrbLU0Lts
 Wuj83A6Pfbd2ZSahPkNgjm9xnKxnIJDd7BVlW4cfz+ev84n5lx1IWACV01xQHh4JB9DM2ZpOcCT
 bIWvj1WhDNNbK1rN4RLqwQenA9lA58GKksxI4l7X80SFQkL7q9Te1C0wi+Yrmm1aRaTZmYzKrSC
 OZUCjZRx/0cBdb4leu7eSr6nmrjRy55IHNkls+vSCT/qaclLaTdiJiWamL0MUV5QIXGerIyF3lZ
 2C7BTEeBOlOlTIFUoJ4gWwePujLgGnoMOHkm8MZoOuse0K5fAlxAO7KCmp9HaWn5BmYDEFgU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-14_01,2025-05-09_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 suspectscore=0 mlxlogscore=464 bulkscore=0
 malwarescore=0 mlxscore=0 adultscore=0 phishscore=0 spamscore=0
 lowpriorityscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505140045

Add reserved memory region and VMIDs for audio PD dynamic loading and
remote heap memory requirements.

Signed-off-by: Ling Xu <quic_lxu5@quicinc.com>
---
 arch/arm64/boot/dts/qcom/sc7280.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
index 8e86d75cc6b4..98c75b8428b0 100644
--- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
@@ -188,6 +188,13 @@ rmtfs_mem: rmtfs@9c900000 {
 			qcom,client-id = <1>;
 			qcom,vmid = <QCOM_SCM_VMID_MSS_MSA>;
 		};
+
+		adsp_rpc_remote_heap_mem: adsp-rpc-remote-heap {
+			size = <0x0 0x800000>;
+			alignment = <0x0 0x100000>;
+			alloc-ranges = <0x0 0x80000000 0x0 0x40000000>;
+			no-map;
+		};
 	};
 
 	cpus {
@@ -3863,6 +3870,9 @@ fastrpc {
 					qcom,glink-channels = "fastrpcglink-apps-dsp";
 					label = "adsp";
 					qcom,non-secure-domain;
+					memory-region = <&adsp_rpc_remote_heap_mem>;
+					qcom,vmids = <QCOM_SCM_VMID_LPASS>,
+							  <QCOM_SCM_VMID_ADSP_HEAP>;
 					#address-cells = <1>;
 					#size-cells = <0>;
 
-- 
2.34.1


