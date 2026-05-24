Return-Path: <linux-arm-msm+bounces-109528-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UISzGMFWE2oT+wYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109528-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 May 2026 21:51:29 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id CB58B5C3ECA
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 May 2026 21:51:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D90373025C68
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 May 2026 19:50:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92CBA3195FB;
	Sun, 24 May 2026 19:50:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="B8c+vD7S";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EKgcjHdR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E97F831F9BD
	for <linux-arm-msm@vger.kernel.org>; Sun, 24 May 2026 19:50:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779652208; cv=none; b=I/qTMFsZdFV/YmfRJ3JtMd0wfBv8BZgRPA7VRmQr7zfmbI1GhGEfW5GfgP2qY11hM82tRSB2NlqeymGsx1kdg1Bux42+RniRRK/1gsE6uci3gNoh1tRXhOEiWFkjgKN/uZDXpce/tlCzedDmXeyWxeeqPs+eHz+oiBBCL7nnwjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779652208; c=relaxed/simple;
	bh=1jrpv7TRgP3YtH5fUnO1l8HHlwq+9FoMbp2VVKV5w1I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ChwcjtjgNpV9lGDrrypf7Fj0bLDlQNdxiLTujszhnKq269yftVKVMrUiOrnW903bdn5Sy6sp8yOk7V6SHbGOPUtywRL7tZjcu2829LHBvcaWjje8KleK3G40q53O3e/SMY2XzavU4qbG/HNnBWCyzmrLmCjDWCO+8LYkVnGbe2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B8c+vD7S; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EKgcjHdR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64OICxvD281139
	for <linux-arm-msm@vger.kernel.org>; Sun, 24 May 2026 19:50:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+1GAOpqSy/JLYxABsdTD+MSUQsRlkDKW4JqVBEYmEVk=; b=B8c+vD7S5cYwfZKT
	AMNYTIX/5KuFyXPZZ6M3/GPCB7TQP/u6h6zhEHmbdTwfFkiKz5R/NadrHrHqtngX
	n3dbFU3ujG6Va7sHLEeLlwT8XSH/ou6OhmhnTiksDPZCS8Lw1nJaEviw2+KTuJdb
	nuwS0Cp+MFk63hiKMpNrAj6TDfWHtBdoKlQtVyjfv63Fm5E3upTvA/JfsOCi9RC5
	4mK8sQTFPE+h2c6ypGXKV3IcAv4Tdfve/4cUdsJuuX4NdabvSg6wSP7OXQ3EZOmW
	gT7aWikpyc9gC4jGP9BfWExa0Ltd0pZ1DZ0wltbb4XZALipJeHBa/e/L6SWL/Idm
	WUenPA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eb4f3bvek-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 24 May 2026 19:50:06 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-368b0dc7731so5135841a91.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 24 May 2026 12:50:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779652206; x=1780257006; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+1GAOpqSy/JLYxABsdTD+MSUQsRlkDKW4JqVBEYmEVk=;
        b=EKgcjHdRnmEb9r+q7mQpLbJPUBRcmhr8I/nCyHmSw4QgTXMgrhU7zgvqWUJ2twbH0+
         KazxiHrP+hCpsi/4njHK0mxVpLDx7ahvKGlJfUY87stP8xTsN2hf3eGzhT2h2OVV1vO4
         GiCsKZFsGGJQ4F64VjrpP/uxfMAe9PZOZWMfz9p+kL3v1HWvXqQvPiLAQdQ86iUTFkRA
         8VWAihIHSf+q77p+GEN+9XxeLihs3iRnJxmAbhhJ82uRN2JBOSB/VUJ2VMvT+JQQaekM
         Qil4lcA3eccIVD22raDmJ/CfPARZOlWRdayjCjTGW85Hx29hFvuQ1PAEoLSeZe1fUSKv
         4Igg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779652206; x=1780257006;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+1GAOpqSy/JLYxABsdTD+MSUQsRlkDKW4JqVBEYmEVk=;
        b=TrG6Z/ZLEmYJHQnayoa3FX/BgvWtwczGNZnXjxeRy9aWNStmUYjrQMHJAiDg/iyEMT
         kxB+ERBn5HZlKSsLq0ICBj6QEGm/zbuIxI0kRSwWhLeSx974wo3Y58oPzg9yTxA2PgFP
         ND8nkL2sk1+t66xbFBVO0QNUL5PoSkhbsY9YNRaK7NSBMGUqPmqRrFjFyeyFS1uMVlGf
         ANTAIb+vzyhlFROQ6wL2kFgxDiGi8bUwdFKXFZqkzoPvJr8801ihz8qIu1ZcCV4Us1CZ
         4YrfrGlfdUzZtdXgItw+i82B62jMyz6tP8Ld3uZ96zymsE3usLIqrw0/b1n3okL/SL6w
         iK1A==
X-Gm-Message-State: AOJu0Yy/GW5siVLeBVn8wga7ATq7AQZJJFkx0pDfqUhyAMyNAH/4djar
	wZhLMK5KWjZdXhXoJPmRrFA0QV4Oi9AhrST+2eZYR0OqAO56VYJOrQGAoVRYLQ6nl8kmJl9uWm2
	7NTiSNFh/6e8HjyN0VosoF9G++5qqr9XeJajVQNMquXmSvCIFulgTcwKgbbqcJmtHNa44
X-Gm-Gg: Acq92OFAGqD71l9KFgDl1lP/pHJoyQbtHLP4m7A9hdAjm7A3hrTVDyosbDzv2YSNFZg
	pI/an2ibqyp1QHi7m6d9nCiYfSHmFKT2v5IYuuSaYNURsmVL3L/+DvBU/wIyPS25oiU/xtorGLE
	t6IEHitw7tRd/873HydMguWwhBd8lRFe4I3bK0KxAuC7D0G8sdEITWPOPhGOeTResYWX7SxqVSQ
	DSOpQoyjev+BMzCzinr/1cllXu6R25pX5kKhaifiu3C7QBIS+rPO6jLENwpuRr0by4C96JHJQao
	S+mVicE9icc7hkyLYozYXXPWvb7SGA7VlmUR4jtqWmQW7NqJu77QHVvpfNVg2bNGFD8g6VUoBqL
	UOYT2Kt+kkX7Ql2O21V6ou2hXFMmUih8haXx5
X-Received: by 2002:a17:90b:3906:b0:368:b4a5:c4dd with SMTP id 98e67ed59e1d1-36a676f0275mr11474966a91.2.1779652205501;
        Sun, 24 May 2026 12:50:05 -0700 (PDT)
X-Received: by 2002:a17:90b:3906:b0:368:b4a5:c4dd with SMTP id 98e67ed59e1d1-36a676f0275mr11474937a91.2.1779652204868;
        Sun, 24 May 2026 12:50:04 -0700 (PDT)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36a6c21d4a2sm4725849a91.1.2026.05.24.12.50.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 May 2026 12:50:04 -0700 (PDT)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Date: Mon, 25 May 2026 01:19:11 +0530
Subject: [PATCH 07/16] arm64: dts: qcom: shikra: Add CPU OPP tables to
 scale DDR/L3
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260525-shikra-dt-m1-v1-7-f51a9838dbaa@oss.qualcomm.com>
References: <20260525-shikra-dt-m1-v1-0-f51a9838dbaa@oss.qualcomm.com>
In-Reply-To: <20260525-shikra-dt-m1-v1-0-f51a9838dbaa@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Georgi Djakov <djakov@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Sayantan Chakraborty <sayantan.chakraborty@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779652157; l=3982;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=iQFaTcU385uMezstExNkoozG8a0UndMZCSThcpHp83E=;
 b=PON3Dizzx46ZQQ5VJgOoBHEuQy1rR1kHnIsqcHLl0kNVPk+UXYFXfwMSfVTNSbOpVCtB9/WwJ
 ii9jhrh9EdgBreGG5xBBs8S9G+TMNTKKGVE0zJ1s0XCsPeXFNMnm6zM
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Proofpoint-ORIG-GUID: yz6Bl2z5qDt2n08EThv5NvvtzqkAeaRm
X-Authority-Analysis: v=2.4 cv=WvYb99fv c=1 sm=1 tr=0 ts=6a13566e cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=16CLMFVtXTx66dpeFkgA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI0MDE5OCBTYWx0ZWRfX1V/GdLmEpZEC
 z8XvS3TmaK1v2uE6XEuEtJvHtW8T05doURJQHdOaDqKtJ1JBxbuEmD1+IBnv8hEW7RVsr2PAo39
 rBWnEpv3IsmPJtlKp8Ub+4wKmUXufNeTPcPDXXfF+Bx56vHqKfH/nIbDkTvqaLOOYNRx/11cxoE
 GegZDk29QAY+/rJzpHuNu9mI98K0HZcDFtMDqrU1kgGuCKK5RiDx1IOOrx04YKgigMl4hdWdVqd
 EK0e5wOmeeY+MU17bYU8j7+Ln4471lto3z814dbn0U8vx3uZsirxgVVzkjOo7I5pNXKHfQXzHFI
 CPZZQx1V+TS2EVIw2ZIhLRKN/NGlgq2zs6A6z23G5rP+ITz/PzpcpOm8QG2x6XiPc/iFFKvZ8jj
 3wXppFhrNGuj9P/428lHTtHZQTsNEbVeLGe+b3jIZoSm1Nke35PlHZVHx1zxuKAzct8qGAiYOEF
 YHd5bdcR15ydLoDD9lA==
X-Proofpoint-GUID: yz6Bl2z5qDt2n08EThv5NvvtzqkAeaRm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-24_06,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 clxscore=1015 phishscore=0 adultscore=0 suspectscore=0 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605240198
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-109528-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,0.0.0.200:email];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[komal.bajaj@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_PROHIBIT(0.00)[0.0.0.0:email,0.0.0.100:email,4.196.180.0:email,0.0.1.44:email];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: CB58B5C3ECA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Sayantan Chakraborty <sayantan.chakraborty@oss.qualcomm.com>

Add OPP tables required to scale DDR and L3 per freq-domain on
Shikra SoC.

Signed-off-by: Sayantan Chakraborty <sayantan.chakraborty@oss.qualcomm.com>
Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 84 ++++++++++++++++++++++++++++++++++++
 1 file changed, 84 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index ebdb4bc15d76..bb1821e95248 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -48,6 +48,11 @@ cpu0: cpu@0 {
 			clocks = <&cpufreq_hw 0>;
 			qcom,freq-domain = <&cpufreq_hw 0>;
 			#cooling-cells = <2>;
+			operating-points-v2 = <&cpu0_opp_table>;
+			interconnects = <&mem_noc MASTER_AMPSS_M0 RPM_ACTIVE_TAG
+					 &mc_virt SLAVE_EBI_CH0 RPM_ACTIVE_TAG>,
+					<&epss_l3 MASTER_EPSS_L3_APPS
+					 &epss_l3 SLAVE_EPSS_L3_SHARED>;
 		};
 
 		cpu1: cpu@100 {
@@ -61,6 +66,11 @@ cpu1: cpu@100 {
 			clocks = <&cpufreq_hw 0>;
 			qcom,freq-domain = <&cpufreq_hw 0>;
 			#cooling-cells = <2>;
+			operating-points-v2 = <&cpu0_opp_table>;
+			interconnects = <&mem_noc MASTER_AMPSS_M0 RPM_ACTIVE_TAG
+					 &mc_virt SLAVE_EBI_CH0 RPM_ACTIVE_TAG>,
+					<&epss_l3 MASTER_EPSS_L3_APPS
+					 &epss_l3 SLAVE_EPSS_L3_SHARED>;
 		};
 
 		cpu2: cpu@200 {
@@ -74,6 +84,11 @@ cpu2: cpu@200 {
 			clocks = <&cpufreq_hw 0>;
 			qcom,freq-domain = <&cpufreq_hw 0>;
 			#cooling-cells = <2>;
+			operating-points-v2 = <&cpu0_opp_table>;
+			interconnects = <&mem_noc MASTER_AMPSS_M0 RPM_ACTIVE_TAG
+					 &mc_virt SLAVE_EBI_CH0 RPM_ACTIVE_TAG>,
+					<&epss_l3 MASTER_EPSS_L3_APPS
+					 &epss_l3 SLAVE_EPSS_L3_SHARED>;
 		};
 
 		cpu3: cpu@300 {
@@ -87,6 +102,11 @@ cpu3: cpu@300 {
 			clocks = <&cpufreq_hw 1>;
 			qcom,freq-domain = <&cpufreq_hw 1>;
 			#cooling-cells = <2>;
+			operating-points-v2 = <&cpu3_opp_table>;
+			interconnects = <&mem_noc MASTER_AMPSS_M0 RPM_ACTIVE_TAG
+					 &mc_virt SLAVE_EBI_CH0 RPM_ACTIVE_TAG>,
+					<&epss_l3 MASTER_EPSS_L3_APPS
+					 &epss_l3 SLAVE_EPSS_L3_SHARED>;
 
 			l2_3: l2-cache {
 				compatible = "cache";
@@ -144,6 +164,70 @@ memory@80000000 {
 		/* We expect the bootloader to fill in the size */
 		reg = <0x0 0x80000000 0x0 0x0>;
 	};
+	cpu0_opp_table: opp-table-cpu0 {
+		compatible = "operating-points-v2";
+		opp-shared;
+
+		cpu0_opp_768mhz: opp-768000000 {
+			opp-hz = /bits/ 64 <768000000>;
+			opp-peak-kBps = <1200000 17817600>;
+		};
+
+		cpu0_opp_1017mhz: opp-1017600000 {
+			opp-hz = /bits/ 64 <1017600000>;
+			opp-peak-kBps = <2188000 25804800>;
+		};
+
+		cpu0_opp_1094mhz: opp-1094400000 {
+			opp-hz = /bits/ 64 <1094400000>;
+			opp-peak-kBps = <3072000 30105600>;
+		};
+
+		cpu0_opp_1497mhz: opp-1497600000 {
+			opp-hz = /bits/ 64 <1497600000>;
+			opp-peak-kBps = <4068000 38707200>;
+		};
+
+		cpu0_opp_1612mhz: opp-1612800000 {
+			opp-hz = /bits/ 64 <1612800000>;
+			opp-peak-kBps = <6220000 43008000>;
+		};
+
+		cpu0_opp_1804mhz: opp-1804800000 {
+			opp-hz = /bits/ 64 <1804800000>;
+			opp-peak-kBps = <7216000 43622400>;
+		};
+	};
+
+	cpu3_opp_table: opp-table-cpu3 {
+		compatible = "operating-points-v2";
+		opp-shared;
+
+		cpu3_opp_1017mhz: opp-1017600000 {
+			opp-hz = /bits/ 64 <1017600000>;
+			opp-peak-kBps = <2188000 25804800>;
+		};
+
+		cpu3_opp_1190mhz: opp-1190400000 {
+			opp-hz = /bits/ 64 <1190400000>;
+			opp-peak-kBps = <3072000 30105600>;
+		};
+
+		cpu3_opp_1497mhz: opp-1497600000 {
+			opp-hz = /bits/ 64 <1497600000>;
+			opp-peak-kBps = <4068000 38707200>;
+		};
+
+		cpu3_opp_1708mhz: opp-1708800000 {
+			opp-hz = /bits/ 64 <1708800000>;
+			opp-peak-kBps = <6220000 43008000>;
+		};
+
+		cpu3_opp_1900mhz: opp-1900800000 {
+			opp-hz = /bits/ 64 <1900800000>;
+			opp-peak-kBps = <7216000 43622400>;
+		};
+	};
 
 	pmu-a55 {
 		compatible = "arm,cortex-a55-pmu";

-- 
2.34.1


