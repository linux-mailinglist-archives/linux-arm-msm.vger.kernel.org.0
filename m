Return-Path: <linux-arm-msm+bounces-40271-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 42F149E3C65
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Dec 2024 15:15:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 09351283650
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Dec 2024 14:15:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35070205AAD;
	Wed,  4 Dec 2024 14:14:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="M47N3ymF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B106C202F86;
	Wed,  4 Dec 2024 14:14:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733321686; cv=none; b=VXcqmSU/rZ2Hto0z9XgFNcMWWdHhfhbup4yPUZSRhzV7FN5SrKGbpUMWc7Byz/QSJWcuBTzr66XWivIpjcZAJQGqdbSwv0r13cpodiQU7g/78mx7BGqb9lzQeXQje2PLYQXQTa95WDcN9oKwgn03HBYH5/ZhZi7fV+Q6cNi4eNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733321686; c=relaxed/simple;
	bh=VA+BXvf8ErhJkPbyIlChzT4pfaM2lYONkwQImVcEeuk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bW9RsiMT4WcLy8w0TgYWJstQLifKf9Dljek1dt7CJGNjuM2kyIx1Ypt5Hg7EAy/2n0XTz8Tl98Jnll2gV1hJ1KR+pxZSKtYHThIdz1IrpT02TX8sNB0GzcfS+ky1HrL9bwMKzVf0IKgZBvTxNp66WCs3JQbb3S5yVjxIo1qMIhc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=M47N3ymF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B47I4mK005907;
	Wed, 4 Dec 2024 14:14:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	apPBndfwKW2buNm5NMxwJqGJy6f2o6k80Vqke26Tr+k=; b=M47N3ymFmk99+HVG
	JIGKr0kts3YrciGbMIBZVQrB47s1EFKTbA1Eh+Zrrr5DHoD8/RgHT84jXzh8qSTi
	0bkx6E5NLbW1PUk3PvkDSdBlY+KLsxGdtu8e7cqbsaO0Ifj63s3PyFSsOWteveB+
	dgvJVoIFYYYiV47qe1+12pXLTdmoKd/x2OuCssw4x5zHloc1P3Lgvn3l8K00SYgN
	gR8zsaURSie0ebrGk03fmr40lOuerbfvzxXbUJX8R74d6cPfpYHONnTPxRVTnc18
	2IDDzu9uo9kFDmMbOJjnmLWVixJGZTZCIs/zJFJ7ZeMJZQWCcmAVYd1MeuWuOKi0
	K6vAqw==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 439w3emf1t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 04 Dec 2024 14:14:42 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B4EEfGt028128
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 4 Dec 2024 14:14:41 GMT
Received: from hu-mmanikan-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 4 Dec 2024 06:14:38 -0800
From: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
To: <lee@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <andersson@kernel.org>,
        <konradybcio@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <quic_srichara@quicinc.com>, <quic_varada@quicinc.com>
Subject: [PATCH 2/2] arm64: dts: qcom: ipq5424: enable the download mode support
Date: Wed, 4 Dec 2024 19:44:16 +0530
Message-ID: <20241204141416.1352545-3-quic_mmanikan@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241204141416.1352545-1-quic_mmanikan@quicinc.com>
References: <20241204141416.1352545-1-quic_mmanikan@quicinc.com>
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
X-Proofpoint-GUID: 33m--FNVv3uGTywejLd6ew4hez7PVLLf
X-Proofpoint-ORIG-GUID: 33m--FNVv3uGTywejLd6ew4hez7PVLLf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 impostorscore=0
 bulkscore=0 mlxscore=0 adultscore=0 priorityscore=1501 mlxlogscore=847
 spamscore=0 malwarescore=0 suspectscore=0 phishscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2412040108

Enable support for download mode to collect RAM dumps in case
of system crash, facilitating post mortem analysis.

Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
---
 arch/arm64/boot/dts/qcom/ipq5424.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq5424.dtsi b/arch/arm64/boot/dts/qcom/ipq5424.dtsi
index 2b9e91da72ac..6226576af155 100644
--- a/arch/arm64/boot/dts/qcom/ipq5424.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5424.dtsi
@@ -101,6 +101,7 @@ l2_300: l2-cache {
 	firmware {
 		scm {
 			compatible = "qcom,scm-ipq5424", "qcom,scm";
+			qcom,dload-mode = <&tcsr 0x25100>;
 		};
 	};
 
@@ -190,6 +191,11 @@ tcsr_mutex: hwlock@1905000 {
 			#hwlock-cells = <1>;
 		};
 
+		tcsr: syscon@1937000 {
+			compatible = "qcom,tcsr-ipq5424", "syscon";
+			reg = <0 0x01937000 0 0x2a000>;
+		};
+
 		qupv3: geniqup@1ac0000 {
 			compatible = "qcom,geni-se-qup";
 			reg = <0 0x01ac0000 0 0x2000>;
-- 
2.34.1


