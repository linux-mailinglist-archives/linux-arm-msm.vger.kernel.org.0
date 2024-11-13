Return-Path: <linux-arm-msm+bounces-37748-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C14C99C6A46
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Nov 2024 09:05:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 437C71F240E3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Nov 2024 08:05:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B622218595E;
	Wed, 13 Nov 2024 08:05:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="dkesitUQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03CF212C484;
	Wed, 13 Nov 2024 08:05:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731485121; cv=none; b=hLTyMRXIflJmjPiYIFvt5XCRAdz05hPQJLZ9ZlgibVQsCu+mU7sQR2tv6hEDm6klZpYVJUHQd+ZHTSAqwC4Tl1bpyVtmyHrfDiP1CZC/p7h8N3CUyXishVPEG1vEus144o4C0a6yfmtYCX6+2p3FeH+GiJKsj6vle0fJgkeNgSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731485121; c=relaxed/simple;
	bh=BbYlp+HJymN34nOHTwQ5tcq4uE81eUVPohJV/y5A3EA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=j65hc7ATXZpmwY2HOs0yO5D2zZl6drjXVSc4eo8jGiyBRKAHsM9Q6RZnyOegpysem62dBEqKK5feotdJitDHcgF5Y0ezsKrkcV7zr4/LlqQC0jbO2F+iw5yjTTAk+oRZ6d/i8P4cuhhQwDeCiWB1vbeTn3/NxKdU5Jag7PIF4Xg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=dkesitUQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AD7ut4H030544;
	Wed, 13 Nov 2024 08:05:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=lQxanDluSxqvmWm5O14ZZnAStn6c0dPWysX
	MECpRP7E=; b=dkesitUQYhlreY1+gaw5DMMl/m6pJhBUeQD2OOz5OG285MpBhgs
	pfAcoJZTH5RqLKMbZMWUqdjy/EZEgBAMcJmonX1kHofEZ+BCW3UqG97r4kRL8Kk8
	YYk1qVK/fghRn39eI2jSRO0m+ehwR18F1TEG7Ecat26ancM4aAsuYI4Gjocer/BL
	8km9m39dIS/ZKhenY/rKeecdtk0Do0w+tvJ9WdnZN2qIwuQGBRBQ82WlZUV34pIP
	RDSTsQWcMVKtWhZEf5W2OR8yy1tVs+ifi7YNhSLCRuUgRJPhHshN16rVa4Tuh7HU
	se6bdjjh2MMjcKww7JX0sgrIpMvkzf5FVOA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42vr5y00s8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Nov 2024 08:05:17 +0000 (GMT)
Received: from pps.filterd (NALASPPMTA05.qualcomm.com [127.0.0.1])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 4AD7gOwE022588;
	Wed, 13 Nov 2024 08:05:16 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by NALASPPMTA05.qualcomm.com (PPS) with ESMTPS id 42v63mr33h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Nov 2024 08:05:16 +0000
Received: from NALASPPMTA05.qualcomm.com (NALASPPMTA05.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 4AD80sK2018232;
	Wed, 13 Nov 2024 08:05:16 GMT
Received: from hu-devc-lv-u22-c.qualcomm.com (hu-qianyu-lv.qualcomm.com [10.81.25.114])
	by NALASPPMTA05.qualcomm.com (PPS) with ESMTPS id 4AD85Gvl024923
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Nov 2024 08:05:16 +0000
Received: by hu-devc-lv-u22-c.qualcomm.com (Postfix, from userid 4098150)
	id D44DA4CE; Wed, 13 Nov 2024 00:05:15 -0800 (PST)
From: Qiang Yu <quic_qianyu@quicinc.com>
To: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org
Cc: johan@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        quic_cang@quicinc.com, quic_mrana@quicinc.com, quic_qianyu@quicinc.com,
        stable@vger.kernel.org
Subject: [PATCH 1/1] arm64: dts: qcom: x1e80100: Fix up BAR space size for PCIe6a
Date: Wed, 13 Nov 2024 00:05:08 -0800
Message-Id: <20241113080508.3458849-1-quic_qianyu@quicinc.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 0wgi4zb_2IACUWpJ_d6C8sRH3twDIntb
X-Proofpoint-GUID: 0wgi4zb_2IACUWpJ_d6C8sRH3twDIntb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 priorityscore=1501
 adultscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0 bulkscore=0
 mlxlogscore=665 malwarescore=0 spamscore=0 impostorscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2411130070

As per memory map table, the region for PCIe6a is 64MByte. Hence, set the
size of 32 bit non-prefetchable memory region beginning on address
0x70300000 as 0x3d00000 so that BAR space assigned to BAR registers can be
allocated from 0x70300000 to 0x74000000.

Fixes: 7af141850012 ("arm64: dts: qcom: x1e80100: Fix up BAR spaces")
Cc: stable@vger.kernel.org
Signed-off-by: Qiang Yu <quic_qianyu@quicinc.com>
---
 arch/arm64/boot/dts/qcom/x1e80100.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
index f044921457d0..90ddac606719 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
@@ -3126,7 +3126,7 @@ pcie6a: pci@1bf8000 {
 			#address-cells = <3>;
 			#size-cells = <2>;
 			ranges = <0x01000000 0x0 0x00000000 0x0 0x70200000 0x0 0x100000>,
-				 <0x02000000 0x0 0x70300000 0x0 0x70300000 0x0 0x1d00000>;
+				 <0x02000000 0x0 0x70300000 0x0 0x70300000 0x0 0x3d00000>;
 			bus-range = <0x00 0xff>;
 
 			dma-coherent;
-- 
2.34.1


