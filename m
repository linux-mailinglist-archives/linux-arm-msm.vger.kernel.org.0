Return-Path: <linux-arm-msm+bounces-35368-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 199F59A9D85
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Oct 2024 10:55:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BD1841F24068
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Oct 2024 08:55:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7068D1946B8;
	Tue, 22 Oct 2024 08:55:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="fGRvY1oZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 027B3155330;
	Tue, 22 Oct 2024 08:55:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729587311; cv=none; b=Pmk83o8ero0TTUWhAp+NOGvafe2+eiVJHOmZa4kB00wvx1QWNJXUSg3M4YEnyNnuspQbJ5InrICOz5pBz6BONKZu1Qb+DZTXVY49lyJGPJlC9U3xFgKZ0/jrBfqckauZfauGuJFHr0D0xHQ79lt28LNfFsUmnzQrJG34f7BjQ68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729587311; c=relaxed/simple;
	bh=gIP0/TCZdf9SS0xaxin/HqkuUE20HR2NpxJlMV7qgmE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=WT9zzp/tXTucWx7/TyCV4fO8xEVDcPQRGuqrRarR4BRBiEF6uUgVzbclAgbT46wCCgs131plhEBUFDah5wWBEW1opGZAbw0kQ4V/n9l3VYoA9ZrqEnXCud4ErtyVDSqoGhzO+5sufDyE4wRFgK2NMeRhSudNijgBaoW/qHrJL8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=fGRvY1oZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49M8aHiM028248;
	Tue, 22 Oct 2024 08:54:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yqm2LjLXE/r1TJLp2pEnHWxRn3Y+3lElNlsr2cs//dg=; b=fGRvY1oZ2NGQNgfg
	QzdbFEecNBRuddg+ScHJsxm0Kk2JJ4sG7Q9tBFgdrGkRzox6V0QY7Nm2/r5SBZsr
	AutVfbYumygnLhEnX1ZoGgAt9XOICABYwksA8eqz/PWAQWV0IM0h9IjJH0pc1bGd
	5UpY4b23mPVSYsz9WT/qUFyNPj/qZMQn6TKTr034l+iAlxk3UqYDbepOZL/sYRvb
	0JZksckXsSOtUVLQUIyTd2RR/I3QStyzvsG6VSgy9PIgOpQRqYsEdmFR4u88F1VX
	vqTydmb+NsKDW2r3M2OoqSQXlHoSJD629Pa5+aIEQ+aIH25cdB5886dpb7+cKTLR
	2n7v1A==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42c6vc7ph3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Oct 2024 08:54:59 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49M8swk8001893
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Oct 2024 08:54:58 GMT
Received: from lijuang2-gv.ap.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 22 Oct 2024 01:54:52 -0700
From: Lijuan Gao <quic_lijuang@quicinc.com>
Date: Tue, 22 Oct 2024 16:54:30 +0800
Subject: [PATCH v4 2/7] dt-bindings: arm: qcom,ids: add SoC ID for QCS615
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241022-add_initial_support_for_qcs615-v4-2-0a551c6dd342@quicinc.com>
References: <20241022-add_initial_support_for_qcs615-v4-0-0a551c6dd342@quicinc.com>
In-Reply-To: <20241022-add_initial_support_for_qcs615-v4-0-0a551c6dd342@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Thomas Gleixner
	<tglx@linutronix.de>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon
	<will@kernel.org>
CC: <kernel@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        Lijuan Gao
	<quic_lijuang@quicinc.com>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1729587284; l=708;
 i=quic_lijuang@quicinc.com; s=20240827; h=from:subject:message-id;
 bh=gIP0/TCZdf9SS0xaxin/HqkuUE20HR2NpxJlMV7qgmE=;
 b=TgPxRBCXM1mQhs2r8N/8heuw260PZGItTL52MyLhBzkKbg7bA5YmD5PL/dhZcqRDc05sChbzv
 36KA2NBOOD0BYM/6z3gBuDpLRtJzaWUo3iyELSNqYzRH4vfMTIPTLtu
X-Developer-Key: i=quic_lijuang@quicinc.com; a=ed25519;
 pk=1zeM8FpQK/J1jSFHn8iXHeb3xt7F/3GvHv7ET2RNJxE=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: hZH_gEChiuMjoCP-hE-Yt-QczNlySnGg
X-Proofpoint-ORIG-GUID: hZH_gEChiuMjoCP-hE-Yt-QczNlySnGg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 suspectscore=0
 spamscore=0 phishscore=0 bulkscore=0 mlxscore=0 adultscore=0
 mlxlogscore=732 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410220057

Add the ID for the Qualcomm QCS615 SoC.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Lijuan Gao <quic_lijuang@quicinc.com>
---
 include/dt-bindings/arm/qcom,ids.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/dt-bindings/arm/qcom,ids.h b/include/dt-bindings/arm/qcom,ids.h
index 8332f8d82f96..73a69fc535f6 100644
--- a/include/dt-bindings/arm/qcom,ids.h
+++ b/include/dt-bindings/arm/qcom,ids.h
@@ -278,6 +278,7 @@
 #define QCOM_ID_IPQ5321			650
 #define QCOM_ID_QCS8300			674
 #define QCOM_ID_QCS8275			675
+#define QCOM_ID_QCS615			680
 
 /*
  * The board type and revision information, used by Qualcomm bootloaders and

-- 
2.46.0


