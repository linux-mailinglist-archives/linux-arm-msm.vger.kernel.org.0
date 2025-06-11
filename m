Return-Path: <linux-arm-msm+bounces-60913-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C247BAD4AAD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Jun 2025 08:05:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D04C7189DC44
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Jun 2025 06:05:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F01F4228CA3;
	Wed, 11 Jun 2025 06:04:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RIkT/zH+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5718422AE59
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Jun 2025 06:04:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749621869; cv=none; b=dkWp+Kzp7xfI073rshFWxOHcVtHD/1ASvL+Yi0Fj06JhG7dNdbjJveQMXftu4+dlnR90MchZYJ964mTKuMdcXhdsf/AzatHGRodLciRPlqFEuRyZNnANfMSnmxvEZYOVSKe5wx1d23ToeOPmBsgsjfAlxETfQc7RP17FEqhGv1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749621869; c=relaxed/simple;
	bh=QoWE5qzsIN231ymP8NOt+cwLglAC7WAj3m6Ww6hRwCA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iQj7k3OjFyrlq3/6sGIYosYF5ZOKCBT9zhJYYDSxUgX8bHRpvylB6UjLxaqfwPjqxenNNwJxCapSk6nT8vQ113bSazjXhFg46JD+TGTEMfTR7Sd8jYX4oaaeq1mrtco2YnbiaGJzM9wsRcCIpZr5Y9jAS1wSTmQfOLT4dgBj2Wg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RIkT/zH+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55AIPv6j027442
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Jun 2025 06:04:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tuc2uE9tPVejGW/SpGhtTl8SWFWWhJXDr0F/rXNvP2E=; b=RIkT/zH+VkJ6nL6E
	+ySs5yqgy9lR1YRJndtxeHzsf8jwOlXhywt5ZygS/011mzw1aKQOs7DA6esprFSk
	K1qCufP0X6Hj4f8t5R5WPVcpdp0h0FwpeLCIbhvQhvfWCs4sUkN5zhpb1YYV9UJl
	knwOdMM2mBpiVGxu0iye4y/tOkbISddtDtt2xWniUchNX5spUi8wN2p5MtK3DhvM
	S2C2LY/33+g2axsuKczQYwI8/6xneM3Vh0FjTFKoTI2FS86ZdW8k4GPpLhxiPSkm
	UIbEm+SSjNJzDgcqtwB7WWXxlwGl1giOBbpZmvLuGLmVXpGFkH4j2IiLd0oUXqEY
	oZPMng==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4766mcmhhx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Jun 2025 06:04:27 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-234fedd3e51so56337455ad.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jun 2025 23:04:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749621866; x=1750226666;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tuc2uE9tPVejGW/SpGhtTl8SWFWWhJXDr0F/rXNvP2E=;
        b=PXcyKR3DvvtJID0CTFIPcTdjgjVh0NFEh9cAYkoqwO+GeMwzROyJG/tJ3F1JQBzp4Y
         fmXGDo/q+e50zQaYkGJHBQNLvNF+BfIIWnoZCROrTUHy9x/FnWRf4e3Z479tVIY3H3AM
         q0V017moxaDrgyMTWfRK7OjeAJiJN92sRGv1+1g/ji+0nwFoDezCVwdtpVI2c7MEaain
         5D8J/rehCjq+xrWu9ygLMP+qSi3de/eoGmLSxeiagnIK+OyW+XEb/wFlUqos2aC0mvgN
         00ihLgMXHeKfoQRjBHpLkdvaTz7jotKTyKFuk/k8pOkavmab8g49XRoesfF59yCwA2Tt
         a6Bw==
X-Gm-Message-State: AOJu0YzU+DTvxYPMR5Hh6wOptr/8afoNNM/6w7K8gO/DkkDw41DpU6qw
	/64N9ryE2osckvEjECgJLh8aNTS+N9Fkam8KZ5oqFp6u1z+neBkGo4lr2zt2CWbax46/2lyPgFf
	n4RcI8T6F8OEXKBc06IdqkzXnFUPDKbGmkudu5fBsFL0XRiZ4qDqzBNoJQpdp9teIPRZWR22ODm
	qJ
X-Gm-Gg: ASbGncsU3L8Rca30TwNKD2zk1HS8nJUfuo0YRWRlci78mg6Xhz1RtXZ1F/33cVh5IHE
	awBaxGB9j8GUQa0jv8lgjY7TkEc5j1Ab5fCzn5oKp5DKcJ244fg6OF7M9Vx3lhuTlk+lX109Pk6
	2XjhjLR5MC8EGLO+dFGhXk8BR6T8w1EooQmNCzENLnxa5PjJJpfvr2l18W7x1s8Tt4B8PhPafRr
	FtsDyjO8yafLBKGzzzaZUix0q05w2iij9NQVWLQO2xr3QH+562dVghzn5LjFOtlVVn4IzZY0hvB
	KKqiD/+yrCCysCSJvfb8uh0YjXDraJ7z6YM8
X-Received: by 2002:a17:903:11cc:b0:235:225d:3083 with SMTP id d9443c01a7336-236425fe5ffmr17483395ad.6.1749621865889;
        Tue, 10 Jun 2025 23:04:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFjRlTU5O6GIFibdwvkIpsRe91SomzTqcoS6HqIebb/RbidfRMn3z/pQmVDsVnZTpzJOv4eLA==
X-Received: by 2002:a17:903:11cc:b0:235:225d:3083 with SMTP id d9443c01a7336-236425fe5ffmr17483015ad.6.1749621865460;
        Tue, 10 Jun 2025 23:04:25 -0700 (PDT)
Received: from [10.213.103.17] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-236032ff05esm79429685ad.135.2025.06.10.23.04.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 23:04:25 -0700 (PDT)
From: Maulik Shah <maulik.shah@oss.qualcomm.com>
Date: Wed, 11 Jun 2025 11:33:47 +0530
Subject: [PATCH v5 3/3] arm64: dts: qcom: Add QMP handle for qcom_stats
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250611-ddr_stats_-v5-3-24b16dd67c9c@oss.qualcomm.com>
References: <20250611-ddr_stats_-v5-0-24b16dd67c9c@oss.qualcomm.com>
In-Reply-To: <20250611-ddr_stats_-v5-0-24b16dd67c9c@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Doug Anderson <dianders@chromium.org>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749621850; l=2490;
 i=maulik.shah@oss.qualcomm.com; s=20240109; h=from:subject:message-id;
 bh=QoWE5qzsIN231ymP8NOt+cwLglAC7WAj3m6Ww6hRwCA=;
 b=w+819P08y+ZW2WR1u7wKMQcFAMBzs3arGunRn1pIv8y9QDhasVeQZQIxjX8fY4IKYFTj5Qex3
 88ItNnz1m4fAGCJYwZV1eh8IF6T000LKWoRgASHGVn3ugsCqVgreDPg
X-Developer-Key: i=maulik.shah@oss.qualcomm.com; a=ed25519;
 pk=bd9h5FIIliUddIk8p3BlQWBlzKEQ/YW5V+fe759hTWQ=
X-Authority-Analysis: v=2.4 cv=T8KMT+KQ c=1 sm=1 tr=0 ts=68491c6b cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=YfaFlAmDMIYh2TYAZrUA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: QkyUsx7_HSwR9mmAtdzlcMHqmz4KvI5B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjExMDA1MiBTYWx0ZWRfX1Si//l8hUjOU
 vDFL1VZma3WtLJSoPknt+bOnBfs+W9cLrClJy6lV6+bKaG3klrERmzGfzYkRKlEGufVz1aW6t65
 4lGXasLGuOwSqrmdv4G9rNTz3HZ5Qy5AdvFot7Pa9UFaZ5e+22xI3tWigyOn6+PQ/d9PU0LuISb
 5zZJsHKsBtv4JfCI9qOwMiPlxbIuekWf2Tn9/Vx7qXfaNhdzJYUczAYrqqiLJGxK6MgUgd+pJZR
 s9pKyJOfiwv3OR2gFiwDCGIMmPzq/KvhMY1DBkaJ2tVSkrLeUFq4yJYrkarg4VKEf4QC3c15ArR
 QNM03/gm6mtA/eiKEup4TqVB88Neqqzk66rTFcliqlSpXVMDxmpdGEnZA72vhg1PqwmcO2PQveK
 f94ZDTIC5TBpFsnM3qqCS5RExoCc6n4W4o/yhmlHOBbyAf/G/o3wUEhBFiC0VwLwcEE/WGp7
X-Proofpoint-GUID: QkyUsx7_HSwR9mmAtdzlcMHqmz4KvI5B
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-11_02,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 mlxscore=0 phishscore=0
 mlxlogscore=696 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506110052

Add QMP handle which is used to send QMP command to always on processor
to populate DDR stats. Add QMP handle for SM8450/SM8550/SM8650/SM8750.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8450.dtsi | 1 +
 arch/arm64/boot/dts/qcom/sm8550.dtsi | 1 +
 arch/arm64/boot/dts/qcom/sm8650.dtsi | 1 +
 arch/arm64/boot/dts/qcom/sm8750.dtsi | 1 +
 4 files changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
index 54c6d0fdb2afa51084c510eddc341d6087189611..33574ad706b915136546c7f92c7cd0b8a0d62b7e 100644
--- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
@@ -3739,6 +3739,7 @@ aoss_qmp: power-management@c300000 {
 		sram@c3f0000 {
 			compatible = "qcom,rpmh-stats";
 			reg = <0 0x0c3f0000 0 0x400>;
+			qcom,qmp = <&aoss_qmp>;
 		};
 
 		spmi_bus: spmi@c400000 {
diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
index 82cabf777cd2c1dc87457aeede913873e7322ec2..e8371a90b9b98fbc12a429def8f6246c6418540a 100644
--- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
@@ -3943,6 +3943,7 @@ aoss_qmp: power-management@c300000 {
 		sram@c3f0000 {
 			compatible = "qcom,rpmh-stats";
 			reg = <0 0x0c3f0000 0 0x400>;
+			qcom,qmp = <&aoss_qmp>;
 		};
 
 		spmi_bus: spmi@c400000 {
diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
index c2937f7217943c4ca91a91eadc8259b2d6a01372..875b5a89d2555f258665c881ee3d96965b6d7a6a 100644
--- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
@@ -5725,6 +5725,7 @@ aoss_qmp: power-management@c300000 {
 		sram@c3f0000 {
 			compatible = "qcom,rpmh-stats";
 			reg = <0 0x0c3f0000 0 0x400>;
+			qcom,qmp = <&aoss_qmp>;
 		};
 
 		spmi_bus: spmi@c400000 {
diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
index 149d2ed17641a085d510f3a8eab5a96304787f0c..4c54ed84e2d1ec836438448e2a02b6fe028f4c24 100644
--- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
@@ -2490,6 +2490,7 @@ aoss_qmp: power-management@c300000 {
 		sram@c3f0000 {
 			compatible = "qcom,rpmh-stats";
 			reg = <0x0 0x0c3f0000 0x0 0x400>;
+			qcom,qmp = <&aoss_qmp>;
 		};
 
 		spmi_bus: spmi@c400000 {

-- 
2.34.1


