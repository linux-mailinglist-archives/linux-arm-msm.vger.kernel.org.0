Return-Path: <linux-arm-msm+bounces-37236-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BCFEB9C0573
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Nov 2024 13:16:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4B84BB21382
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Nov 2024 12:16:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D31331DE4E9;
	Thu,  7 Nov 2024 12:16:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="pANnkzLJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 802F817BB0D;
	Thu,  7 Nov 2024 12:16:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730981764; cv=none; b=IHYEFIYJaWE/Y8S9JyrEtW1j4oWLhl+vjkSj0PY6dmk61yHHMbcRpDQZ8ZjQNK3GnDUI5dSqDBRyCgeknPTjfPAfgl5hfLjvyrFFU/bIGb0OEi8XaCK7ZxviZAI35uDSO46dIeydv7LFjD18o9GWOfwgqKHIKMRqBZFxq9P+s9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730981764; c=relaxed/simple;
	bh=yQELxanxVcjoUm19DQz0uZkwhEBWG3s8T1Wrw+wjpGo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=R9r/nk7G3AelpubczZHiNsG4IQwf72kj0oRc1D2WlxkEEasxHDiOOMtIhzZ+yd3C+56qngsQFalt9nhY4Brv+4F5IIBcdxk1dJ4fcNaCI/tyzM6W13RlxC+EJBc9jy9AmhafynZFs3Kdjy3Yz0W9FecvpGhMOCyV+WXR7bh5sTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=pANnkzLJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A7BY7lE017647;
	Thu, 7 Nov 2024 12:15:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MNgnJlVQVW0AWAd1yOFKsW2LkGUrXXEqr3Pk/u86i/Q=; b=pANnkzLJMg39zUZj
	/l/0g35g/PphkV7jd7ajrBTegqOs2bdPKhDLD3LHHRNzHPp/B4nCkboAjHtY2VLj
	bBrmrqwDfo2SlrHtiobjwYosLSgtMxIvHo8bHm1w202tZL799z020ElfNqOJ3gCB
	+eMM6ZoLLiVId3eruSmEje6XPPoI5/a338f/2D34SvoMEBbr6S0uscLR8PZpM7vq
	FxNxQU0jJhdqnbit900uOI2UmTK7xT7oESypNZS+5da/VgKNJhZGSQS8XatuTYnj
	1wOEx7Lfzov6q3FC8wOJQgc+/bqJdi0greaEElKGTagCo1KuLkoGjoLAfY8bZLD5
	1j9Jkg==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42q5n8rwh2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 07 Nov 2024 12:15:56 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4A7CFta7024154
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 7 Nov 2024 12:15:55 GMT
Received: from hu-yrangana-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 7 Nov 2024 04:15:51 -0800
From: Yuvaraj Ranganathan <quic_yrangana@quicinc.com>
To: Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller"
	<davem@davemloft.net>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Vinod Koul
	<vkoul@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-crypto@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <quic_yrangana@quicinc.com>, <quic_sravank@quicinc.com>
Subject: [PATCH V2 2/2] arm64: dts: qcom: qcs8300: add TRNG node
Date: Thu, 7 Nov 2024 17:45:13 +0530
Message-ID: <20241107121513.641281-3-quic_yrangana@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241107121513.641281-1-quic_yrangana@quicinc.com>
References: <20241107121513.641281-1-quic_yrangana@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 0-alHb-NijgxRRQOuJZ4zJxryyaXYQR-
X-Proofpoint-ORIG-GUID: 0-alHb-NijgxRRQOuJZ4zJxryyaXYQR-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 impostorscore=0
 suspectscore=0 lowpriorityscore=0 mlxlogscore=900 mlxscore=0
 priorityscore=1501 bulkscore=0 adultscore=0 malwarescore=0 phishscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411070094

The qcs8300 SoC has a True Random Number Generator, add the node with
the correct compatible set.

Signed-off-by: Yuvaraj Ranganathan <quic_yrangana@quicinc.com>
---
 arch/arm64/boot/dts/qcom/qcs8300.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs8300.dtsi b/arch/arm64/boot/dts/qcom/qcs8300.dtsi
index 2c35f96c3f28..39c0c6b8516d 100644
--- a/arch/arm64/boot/dts/qcom/qcs8300.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs8300.dtsi
@@ -588,6 +588,11 @@ &clk_virt SLAVE_QUP_CORE_0 0>,
 			};
 		};

+		rng: rng@10d2000 {
+			compatible = "qcom,qcs8300-trng", "qcom,trng";
+			reg = <0 0x010d2000 0 0x1000>;
+		};
+
 		config_noc: interconnect@14c0000 {
 			compatible = "qcom,qcs8300-config-noc";
 			reg = <0x0 0x014c0000 0x0 0x13080>;
--
2.34.1


