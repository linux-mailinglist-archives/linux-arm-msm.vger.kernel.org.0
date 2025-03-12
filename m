Return-Path: <linux-arm-msm+bounces-51124-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9328BA5D9DC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Mar 2025 10:50:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5E1501897788
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Mar 2025 09:50:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BA3423BD0F;
	Wed, 12 Mar 2025 09:50:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="W9dF3Z/2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9989222E402;
	Wed, 12 Mar 2025 09:50:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741773005; cv=none; b=WdekgeFO97mAMj888twyho65yzyVvDHK04jLcZ3b5oNeN4cinPU27MurkDmToQmzqwSynxbgWl5fuZRhCFKdA1CIA5fojELNd74xoFCGZmni/XCV56nkXWcLpATqZtlVUZOHR8/ESVugaIWSKfA+/9PnN8T0UMhbnsx7BlEf72Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741773005; c=relaxed/simple;
	bh=MI8AoERqihUYmL4TjIkwjFUKRnq/VTLzWRTXWKupLf0=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=lR7gJ4fbxJC732w1w+bt3dW73HvuduxUQROZ63pUqSJ4OkboJiqesSsMuaSsOZPiBk3KvMNeEgcD5Za2saSDkEhoiBudn4tAsOUKF9WxCoNwUwHrgn9DwmcqCuG+/oxaRW8TzDZ/1HIMdP41BwToRJQ0qjxInjz7XJt6SMbOi+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=W9dF3Z/2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52BMHA0R013950;
	Wed, 12 Mar 2025 09:50:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=kgideWmWyJcC3sljKVJ0uN
	4O1r1uSFuIk7vp+zHSawA=; b=W9dF3Z/2CoMGkkmK6GZHztRN6Gv+0Im67Flox2
	Va25gqsMipJOkmP8HyVGNdgvTcnCXNZo4WnbEH7Ca5RkTh555gc2n5zNtxcOOuFd
	ADmIxMbkzVZm7MzSzyYA7naMA71JTwjtMHwl+iVdOAHLxXHNSB2s4xsqvCnpXXR8
	62Hjljp5zTSoQICgA8F7grgDEiYuW+DHUh1foB3kTd8cU7NGcuvXlKj+QlXrnR3h
	frqj8RuTVubwkUI9do8/qy845oyeIQg70pCkAueL0P9DaCOz0t+VXraIRLjc9zRM
	aqCqybJdIBE6sO5cW5zcOxfKlj0P7P+eQQX/Vr/61OHdxomw==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45au2p1wry-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Mar 2025 09:50:01 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 52C9o1Nc009451
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Mar 2025 09:50:01 GMT
Received: from hu-mmanikan-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 12 Mar 2025 02:49:57 -0700
From: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
To: <andersson@kernel.org>, <konradybcio@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC: <quic_varada@quicinc.com>, <quic_srichara@quicinc.com>
Subject: [PATCH v1] arm64: dts: qcom: ipq5424: add reserved memory region for bootloader
Date: Wed, 12 Mar 2025 15:19:48 +0530
Message-ID: <20250312094948.3376126-1-quic_mmanikan@quicinc.com>
X-Mailer: git-send-email 2.34.1
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
X-Authority-Analysis: v=2.4 cv=ePkTjGp1 c=1 sm=1 tr=0 ts=67d158c9 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8 a=XM-gT74EAUeGg6Fp4qoA:9 a=JrUbwKUKoRM7SNILlDhP:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: Gw2olqtuWYpcGzeNARle7bQZYszV-az8
X-Proofpoint-GUID: Gw2olqtuWYpcGzeNARle7bQZYszV-az8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-12_03,2025-03-11_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=544 phishscore=0
 mlxscore=0 malwarescore=0 suspectscore=0 impostorscore=0 bulkscore=0
 clxscore=1015 lowpriorityscore=0 spamscore=0 priorityscore=1501
 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503120066

In IPQ5424, the bootloader collects the system RAM contents upon a crash
for post-morterm analysis. If we don't reserve the memory region used by
the bootloader, linux will consume it. Upon the next boot after a crash,
the bootloader will be loaded in the same region, which could lead to the
loss of some data. sometimes, we may miss out critical information.
Therefore, let's reserve the region used by the bootloader.

Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
---
 arch/arm64/boot/dts/qcom/ipq5424.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq5424.dtsi b/arch/arm64/boot/dts/qcom/ipq5424.dtsi
index 7a7ad700a382..cd1acf3898ac 100644
--- a/arch/arm64/boot/dts/qcom/ipq5424.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5424.dtsi
@@ -132,6 +132,11 @@ reserved-memory {
 		#size-cells = <2>;
 		ranges;
 
+		bootloader@8a200000 {
+			reg = <0x0 0x8a200000 0x0 0x400000>;
+			no-map;
+		};
+
 		tz@8a600000 {
 			reg = <0x0 0x8a600000 0x0 0x200000>;
 			no-map;

base-commit: 0a2f889128969dab41861b6e40111aa03dc57014
-- 
2.34.1


