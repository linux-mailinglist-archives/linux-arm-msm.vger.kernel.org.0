Return-Path: <linux-arm-msm+bounces-71761-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C673B418D1
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Sep 2025 10:40:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 18B523BC10F
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Sep 2025 08:40:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 152B62DAFC3;
	Wed,  3 Sep 2025 08:40:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="P/g+Xawq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85D6019047F;
	Wed,  3 Sep 2025 08:40:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756888848; cv=none; b=XvV3XbQ58UITyP6bhDnV9nK3UX1EJJSUvHXHsEAQiJL2+1dBEMcYpcISgEYWk697NcN4OqJCXousR8wkP2N9iyCF3wMnsCISyaSFi9AwUGH0Mtm5VwpkQ5Q2Mvs7fUoNjPBPvmwuzXCHP8tE35Q7VY/v2AB88GHYrJIkPDoP7ZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756888848; c=relaxed/simple;
	bh=0pqTC8S1bYMtGJhqAycGCwDGvWkr1nvCHbVplLnRa7k=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=go6s5m66V+JIaJXnenl3D8n9DmaMqiMV/NcSMDN8LBDRGqZzs1ZXhauA/YlLDMjw1U6956u/iWlOuariN68a6KUtS6PmwYIm75fapdWI+Hp2UW9WOHtNa61WNh8NYnJrImhGv8zfJL7bnCWY2qOEWMe+MghvoxDfa9voinb8zpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=P/g+Xawq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5832E2kL018246;
	Wed, 3 Sep 2025 08:40:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=HiOhiYC05D8S8ZKqs8uG6j
	bzqYinykxPGYhDXKwpPl4=; b=P/g+XawqO7XEe/zOfNAsgjJexEAi6Dym+j7Ha3
	u2zD110pa9yKZ14W7wclbdO6dkrHHxeBmb2je/dXge59OUdq5dabGWXTfCEabK6Z
	C7t8YMSMn8mjW6uwF0LKp0qyYm+1/WcEeivH4WrQl5/uKAw7+Jf7EqoIk1Gi7nz1
	VMVshlUhjaGjsD+IfYwgiNNuo+ludSlxTyCoT2nN1/BxFKq9Fp0T6SEjx5oqi93t
	GOm3vrfmWytJlq2yQrA2r+zVb6XlMRpppJVshNZP+goK3zlMd5fvt2X76M1AS19k
	dqkFTU8SMTcJ+T5B31JpcURLj9ZEQCNgucmXhDQ5OE6ydSNg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48wqvwck10-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 03 Sep 2025 08:40:44 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5838ehtD003022
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 3 Sep 2025 08:40:43 GMT
Received: from cse-cd01-lnx.ap.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.24; Wed, 3 Sep 2025 01:40:39 -0700
From: Wangao Wang <quic_wangaow@quicinc.com>
Subject: [PATCH 0/3] media: qcom: iris: add support for X1E80100
Date: Wed, 3 Sep 2025 16:27:33 +0800
Message-ID: <20250903-add_iris_for_x1e80100-v1-0-410e9e6c79f0@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAL8t2gC/12O0YrDIBBFfyX4vMKoUWN+ZSlhOup2YJPsajYUS
 v+9Nn0o7Nuc4d7DvYmaCqcqxu4mStq58ro0UB+doAsuX0lybCw0aAsBjMQYJy5cp7yW6arSAAp
 ABkdoh2gAh0G07k9Jma+H9/P04pJ+/5p+ez3f9rE73A56ecF5xYkX3hi/JVD0YFz02qtxP7T/S
 76V2gb5HCR7tBGMyT3qOO7qmT9jTZLWeeZt7Gy0QDlkT1kDKo/Uu0Dt1Ak86UAqO8SzF6f7/QH
 KbrX8GAEAAA==
X-Change-ID: 20250903-add_iris_for_x1e80100-96ca58d30a88
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756888839; l=1082;
 i=quic_wangaow@quicinc.com; s=20250814; h=from:subject:message-id;
 bh=0pqTC8S1bYMtGJhqAycGCwDGvWkr1nvCHbVplLnRa7k=;
 b=rAzHCF3t3/sOaR8fCC/T5z8eBNZhnh3xe8wvEHrWrWXg4n0twEhpTIBxZmqCCQNSJDFqlsEM2
 WAOLR6K7O9xBGmqcWaELPK34AYKcihdVA8+HtaYurYsJUSfwl8ejuSC
X-Developer-Key: i=quic_wangaow@quicinc.com; a=ed25519;
 pk=w32d+heQorY/WMv2MAjQHXfwz5WLNqBlarTPtMmAk3k=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTAyMDAyNCBTYWx0ZWRfXyRQNqqHX+9nF
 yxnjJZ1CZnZn65So+ZMmmz7Hh4FTarBig7sQ/8JyzAz4x+2WzV8w3VRMgkR2/hHBH+3fGYl3Mip
 FuPpF+rGKxMaOw/xL8MzLnRvSUGOCkK84e9tYQWDmsplamcoqMyEPJpZrlNXBtiRhWYkM/pYsOr
 Sl06ATW3tJNAZE04P3OIHNXIBqWjbC9Q2Rp7s0DQeKd2ld3hV+4d1npJYinIuD8t8v2yBVWMvIK
 vNoPo4B67ACaAwzeBJ9Zn39Qaizp6qaUK4YWrYhrSB/J2RJfamFrAHtd6sc2wN2yqt7FUhmFX8A
 UYTVn8W58UfqSjl+P8vnbugbI579Qu3XO4BZiV31cjNe1t0yMge6j0dL24CwYIECRWKb7LckfK4
 20x0eCyO
X-Authority-Analysis: v=2.4 cv=WKh/XmsR c=1 sm=1 tr=0 ts=68b7ff0c cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8
 a=kWYTZXGv_XluHl3EyoMA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: mzUKh0u7IHWrQjI5hb1nP0sSJUr0RjFz
X-Proofpoint-ORIG-GUID: mzUKh0u7IHWrQjI5hb1nP0sSJUr0RjFz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-03_05,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 suspectscore=0 bulkscore=0 phishscore=0 adultscore=0
 spamscore=0 malwarescore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509020024

Add support for video hardware acceleration on X1E80100 platform.

Signed-off-by: Wangao Wang <quic_wangaow@quicinc.com>
---
Wangao Wang (3):
      arm64: dts: qcom: x1e80100: add video node
      arm64: dts: qcom: x1-crd: enable video
      arm64: dts: qcom: hamoa-iot-evk: enable video

 arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts |  4 ++
 arch/arm64/boot/dts/qcom/x1-crd.dtsi       |  4 ++
 arch/arm64/boot/dts/qcom/x1e80100.dtsi     | 82 ++++++++++++++++++++++++++++++
 3 files changed, 90 insertions(+)
---
base-commit: 5d50cf9f7cf20a17ac469c20a2e07c29c1f6aab7
change-id: 20250903-add_iris_for_x1e80100-96ca58d30a88
prerequisite-change-id: 20250604-hamoa_initial-0cd7036d7271:v8
prerequisite-patch-id: 707f3a7f2b7ea216a87cdd2ee93d157447a5f4b8
prerequisite-patch-id: 722456df5f851b37a01de416c13f75a519296480
prerequisite-patch-id: f380520f40a786d736810d8cd6b4ed157506821c
prerequisite-change-id: 20250704-x1e-iris-4a5d033f4a2d:v1
prerequisite-patch-id: 037bb113706198fca6a87000e46907bc23f9d7e2

Best regards,
-- 
Wangao Wang <quic_wangaow@quicinc.com>


