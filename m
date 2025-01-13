Return-Path: <linux-arm-msm+bounces-44916-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 98BA4A0C378
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jan 2025 22:17:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2AA393A8166
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jan 2025 21:17:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 967B41F9A8E;
	Mon, 13 Jan 2025 21:16:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="f6iplkdT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B97251E0087;
	Mon, 13 Jan 2025 21:16:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736803003; cv=none; b=ceqO9EstAEQW5YCUNjEiwEs5eCLkBy8g4b5np9Viz8mUNOR5PUpfS/ANX46w0kPN7QxxFGktHTadP4/oCmeI5ao8tmo7Sm8USXA21+bIIBSXBPRMEzX4fkxo0lH0HlskRs1vo/i5SoBi3X7Uvqe9LPRkLGz5cMYaWDTa5wqK0Hk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736803003; c=relaxed/simple;
	bh=gS3HhlLDg2h+jEmFJcXx8eRwO7TS4hktSXo0dSoljtU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=JoIlcB9SFHtntjVG5qzhicfezjFl7pq4UXzc5gJ21/eiwHufqKz+7xPQt/04rgf8xK/wt4knYOaLnEeZOPDhcZK0u3SS4Z/PhUBJX0qS+yB9CzzbuOaldJuQPuHYqvnCt0x8TBtLZWIMfrbgtZEpnpOVHkbbLEqzX7glff2zDfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=f6iplkdT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50DBm9CW007359;
	Mon, 13 Jan 2025 21:16:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FU50mI+jopQqUBsUxyWC+XRlzgPC0mvFI15LzCKpqc4=; b=f6iplkdTeRf7HT0R
	pQVSMZPiSJ4DrzO5GggFq+kiVDPZ7U43fp1YL5dBBIQabJQgfzzdVqgsAagV3hCN
	BNVm8gIa7EJWyrwU97iLbZSjVu/1ZrtiFbfdUbZpuDabSzN99YR5lQca/1PyL7BG
	tqumLAW92WvjwHyqee3JlBGgkbspvXKj5uC93869gz8E+Mr3XvxfDicnjVFKSZjk
	b0FZlf0myhZc2De2MrL5ZQsf3iqiJomjX3ipHQSR7yGRoP45J6ceNVMlNcLbpRZw
	xnpYJAa7JgWJUDD3QvqGXyGgREUnCI4jaXaZq9HzQhevRB1VMuYg5HtOd+gj8I2T
	ewP2bw==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4452939hr6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Jan 2025 21:16:33 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50DLGWIZ025949
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Jan 2025 21:16:32 GMT
Received: from hu-molvera-lv.qualcomm.com (10.49.16.6) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 13 Jan 2025 13:16:31 -0800
From: Melody Olvera <quic_molvera@quicinc.com>
Date: Mon, 13 Jan 2025 13:16:24 -0800
Subject: [PATCH 4/6] arm64: dts: qcom: sm8750: Add TRNG nodes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250113-sm8750_crypto_master-v1-4-d8e265729848@quicinc.com>
References: <20250113-sm8750_crypto_master-v1-0-d8e265729848@quicinc.com>
In-Reply-To: <20250113-sm8750_crypto_master-v1-0-d8e265729848@quicinc.com>
To: Thara Gopinath <thara.gopinath@gmail.com>,
        Herbert Xu
	<herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        "Rob
 Herring" <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        "Conor
 Dooley" <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        "Konrad Dybcio" <konradybcio@kernel.org>,
        Vinod Koul <vkoul@kernel.org>,
        "Satya Durga Srinivasu Prabhala" <quic_satyap@quicinc.com>,
        Trilok Soni
	<quic_tsoni@quicinc.com>
CC: <linux-crypto@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Melody Olvera
	<quic_molvera@quicinc.com>,
        Gaurav Kashyap <quic_gaurkash@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1736802990; l=902;
 i=quic_molvera@quicinc.com; s=20241204; h=from:subject:message-id;
 bh=9HGSPyCdLJTFNynsf1No7ZWQHSGRzJNvn9eGwkO4pLg=;
 b=gyxBCX/CCSY0EEy//IpXSKbGdhAh4I+V+Kp35bEG/5jlMtiEAh3Qt9vqbzMI0U/Y9bZo0k/8q
 rEtUEgQG/PRC+xZE4tw7BSMxPf6y3HC2OdXK4qg9iw0WSIw4yh6QuhP
X-Developer-Key: i=quic_molvera@quicinc.com; a=ed25519;
 pk=1DGLp3zVYsHAWipMaNZZTHR321e8xK52C9vuAoeca5c=
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: PEb_KLrJT99j_kikO4x0VCTXZKSDqgKe
X-Proofpoint-ORIG-GUID: PEb_KLrJT99j_kikO4x0VCTXZKSDqgKe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 mlxscore=0 impostorscore=0
 malwarescore=0 priorityscore=1501 mlxlogscore=783 adultscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501130168

From: Gaurav Kashyap <quic_gaurkash@quicinc.com>

Add the SM8750 nodes for the True Random Number Generator (TRNG).

Signed-off-by: Gaurav Kashyap <quic_gaurkash@quicinc.com>
Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
---
 arch/arm64/boot/dts/qcom/sm8750.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
index 1ddb33ea83885e73bf15244c9cbd7067ae28cded..9b2ac8c30013b02ca78140eb4144b4530aba5d6a 100644
--- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
@@ -1883,6 +1883,11 @@ &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
 			};
 		};
 
+		rng: rng@10c3000 {
+			compatible = "qcom,sm8750-trng", "qcom,trng";
+			reg = <0x0 0x010c3000 0x0 0x1000>;
+		};
+
 		cnoc_main: interconnect@1500000 {
 			compatible = "qcom,sm8750-cnoc-main";
 			reg = <0x0 0x01500000 0x0 0x16080>;

-- 
2.46.1


