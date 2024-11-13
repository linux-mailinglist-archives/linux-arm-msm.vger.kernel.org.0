Return-Path: <linux-arm-msm+bounces-37720-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 325769C6853
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Nov 2024 06:01:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EBCB828521D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Nov 2024 05:01:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B65B116D9C2;
	Wed, 13 Nov 2024 05:01:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="d0sF1bde"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AB2B433CE;
	Wed, 13 Nov 2024 05:01:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731474076; cv=none; b=eATtO0LIoLQ9YjFPSE3LAcKmI945UOzr2BvidXhMGSuyWQPIir7CdE9Iz7j2uCDco8HuKmJ8KzyHDCYpCioH08edtJZcsz37Z5ykYluZwGfT6kjST2QqbSRO89rG6M55c/a8Ru5Gd/OhPuDoUSv/b8M2Qmc/NPYUYxsjo5/mFXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731474076; c=relaxed/simple;
	bh=7RZbSUNJYmiCyNvPKrxt/qSagu+0g7i70PCb6Lm2Njk=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=mnO+Bz3h1D+rJZNuFlsVTIFNrMWjk2itaIwwIisaS+7vtPhAZhRX6NRUGcQb6GxhyrLXQBTeGrLgMNXK0xgXUekkYTZcexxn1oeUmwMkoPqV3HqxG2GtLEJdbWqwqRjuPpE9zXH5BBcvCYo0gZlv68+fmhdSZ0s0me3ehSUwfZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=d0sF1bde; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AD347L6030376;
	Wed, 13 Nov 2024 05:00:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=rY13K06FSCcBsRVMJOJVfO
	SfUcDlI6kDbguOhqTGa7k=; b=d0sF1bdeBS4875GB9LS+r8/oVTFWILNGb+aXoI
	euU0vS7PJFCboQquoM/86G3FOQHBZ4kNVXiO9AZ7S2ZlyQKkr+yYFiKmi/qsGwQU
	lnd6LDYj7goeY2VtsdrdeclT3ChW72xc+rS3A79de+5plc+HEr3O7VatRNFTHUTj
	1rvai8s81ewLpYrKcQKTbfCe1jopP/mh5fad7sR1kW7UEgHKuVJUjbwXhkD0SmAu
	p5vJeJ2LAgEkRSLsrdBcovpqWJdIK7zNzyeZykYEjWmFkC8kHO8+iD6fqvm2EGru
	Que25e/Qyy+uniQVknN6eS9f9nY0m1QwaA6QWsCeXzj70IXg==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42vkvr87xx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Nov 2024 05:00:54 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AD50sZb020838
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Nov 2024 05:00:54 GMT
Received: from hu-ekangupt-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 12 Nov 2024 21:00:50 -0800
From: Ekansh Gupta <quic_ekangupt@quicinc.com>
To: <andersson@kernel.org>, <konradybcio@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <cros-qcom-dts-watchers@chromium.org>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <srinivas.kandagatla@linaro.org>,
        <quic_bkumar@quicinc.com>, <quic_chennak@quicinc.com>
Subject: [PATCH v1] arm64: dts: qcom: sc7280: Make ADSP a secure fastrpc domain
Date: Wed, 13 Nov 2024 10:30:42 +0530
Message-ID: <20241113050042.181028-1-quic_ekangupt@quicinc.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: I8TiR6SqlSEvYqdYSd2Ib87aJlxVoMKf
X-Proofpoint-GUID: I8TiR6SqlSEvYqdYSd2Ib87aJlxVoMKf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 adultscore=0
 phishscore=0 suspectscore=0 spamscore=0 mlxlogscore=496 priorityscore=1501
 bulkscore=0 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2411130043

FastRPC framework treats ADSP as a secure domain on sc7280 SoC
which means that only secure fastrpc device node should be
created for ADSP remoteproc. Remove the non-secure-domain
property from ADSP fastrpc node.

Signed-off-by: Ekansh Gupta <quic_ekangupt@quicinc.com>
---
 arch/arm64/boot/dts/qcom/sc7280.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
index 3d8410683402..c633926c0f33 100644
--- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
@@ -3852,7 +3852,6 @@ fastrpc {
 					compatible = "qcom,fastrpc";
 					qcom,glink-channels = "fastrpcglink-apps-dsp";
 					label = "adsp";
-					qcom,non-secure-domain;
 					#address-cells = <1>;
 					#size-cells = <0>;
 
-- 
2.34.1


