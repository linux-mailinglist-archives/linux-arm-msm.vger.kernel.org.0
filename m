Return-Path: <linux-arm-msm+bounces-58199-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B9B3CAB9ABD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 May 2025 13:01:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3D8233B6B31
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 May 2025 11:00:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFA0A238C1F;
	Fri, 16 May 2025 11:00:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="VxIyxAKe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A07E2356C9;
	Fri, 16 May 2025 11:00:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747393256; cv=none; b=MN/8MKL3Vwnmehurfup542Wz9wDRlzAOwwxgEzDGMaA51T0Lb43bl6oXLxp77Lgt8vqgJi8IM0mwvPZcujVp1y4gJ/T++ltntHMJ6H3c40XqSoWUe/aWcKMMgvbvqg1fnd16OorC//G6SJz68HrzS8G6EoXTDoLur7n58KWf+Jw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747393256; c=relaxed/simple;
	bh=wDONQ+GI3wD7e6uYt8ZmdG6SVnuoyzTQtwkifPAWDt0=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=G9SzOCa5IvptKgVgh6msuR5FtJiLWqJdcnaO0ydO9DfuRvt9lURoVnim1Fwld2P74Ur1Gp6nW6+03U0mnB5CNQokpWinrEsaP1d8MnM0YaYenSp1vqvJCT8hG7+l4MnDyba1aEZoAwUs39K6tQi5Y0RUQq8RdDSHTpP8kO1Q2IQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=VxIyxAKe; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54G3gues024573;
	Fri, 16 May 2025 11:00:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iefrQ1d8rmCaKdyYz9qEwTftr7Kp21JP81PYZYHM01g=; b=VxIyxAKejzewsQ0X
	RvmI/hoP16Rah9iOpKBdL/ULl66u/kFw+f5qruB9a0C0nov7i6SYXJhffyOB62Zb
	uUces4zrWKO7/+j3ijww3+XEu0dNQBwLxpYayg5+3NT8JZPtrhoG8taZQThT5nBQ
	ms0n3ZtheBiPfKdhyGCIjbIuGtOKL8iuz2PnzK9KHJ0f5AQ+tB5CB+ekqLR1QqRs
	uJLoeulEfmmNZYcvcrjN6wH5gU8orbeandZ0PwRDqj3pmTKEkcgzQSxJwI1sYqKk
	m5vIXQRyOkdK8vLpfU0xbXbXhUKdBLcIJJ2UwsgWOFjOJMyhyQJEtBtM/ndlF9Tn
	1jSZsg==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcp1q36-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 May 2025 11:00:52 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 54GB0psh010981
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 May 2025 11:00:51 GMT
Received: from hu-lxu5-sha.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 16 May 2025 04:00:48 -0700
From: Ling Xu <quic_lxu5@quicinc.com>
To: <cros-qcom-dts-watchers@chromium.org>, <andersson@kernel.org>,
        <konradybcio@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <quic_lxu5@quicinc.com>, <ekansh.gupta@oss.qualcomm.com>
Subject: [PATCH v2 1/3] arm64: dts: qcom: sc7280: Add memory region for audiopd
Date: Fri, 16 May 2025 16:30:27 +0530
Message-ID: <20250516110029.1637270-2-quic_lxu5@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250516110029.1637270-1-quic_lxu5@quicinc.com>
References: <20250516110029.1637270-1-quic_lxu5@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: AaZnJitpcU2YiJTu8tobTUmOg13qx9ly
X-Authority-Analysis: v=2.4 cv=D8dHKuRj c=1 sm=1 tr=0 ts=68271ae4 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=o7O2lQN-kgvADfYeIdcA:9
 a=TVi5PsLu-Zlr5RWK:21 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE2MDEwNCBTYWx0ZWRfX9waPQn3WlO3L
 O6FFbX+GeN7phMoUf6+wfGOtmYwyrjoX1f+fKzJSKI/ZhAqNhbp7w/6/X9sllMgK5PjWL613dMF
 Qu0hv7gm82D/xZZxsqZaql3RTuZhUWb8Zbwc+Y9/bGa0kdu7HJg8ACydT21r4px8PngmVSkYkar
 IjUvgjbEwjyhYF/pCijWlVz374knHXqVtrRGxwMVA1xijGFG+IQKIQyMspS6evHrUcjl2SDXyjj
 DjLEHwx12WyXmFvMSagaO8OAcEIvu8zgsQVBh8MctjqGeMYLIe4EKTU2cqS+TbSpeqV+5+5PL4R
 MA6zip7oXA2NZl5GDqTGzdCu6KpZNJ74KpsKWoig2mNonDOQlNMbhiZQ1DoZUVWqMlH8EaTw1rw
 P5CDrEbsWIxEqX+U1f56gROQp2sPBI5Xe7LOL4uZCFSy+Tq74RgugnDZdKPyx45MsyqQhtM3
X-Proofpoint-GUID: AaZnJitpcU2YiJTu8tobTUmOg13qx9ly
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-16_04,2025-05-16_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=525 spamscore=0 impostorscore=0 bulkscore=0 priorityscore=1501
 suspectscore=0 malwarescore=0 mlxscore=0 adultscore=0 phishscore=0
 clxscore=1015 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505160104

Add reserved memory region and VMIDs for audio PD dynamic loading and
remote heap memory requirements.

Signed-off-by: Ling Xu <quic_lxu5@quicinc.com>
---
 arch/arm64/boot/dts/qcom/sc7280.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
index 8e86d75cc6b4..d9af79ff8c4e 100644
--- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
@@ -188,6 +188,14 @@ rmtfs_mem: rmtfs@9c900000 {
 			qcom,client-id = <1>;
 			qcom,vmid = <QCOM_SCM_VMID_MSS_MSA>;
 		};
+
+		adsp_rpc_remote_heap_mem: adsp-rpc-remote-heap {
+			compatible = "shared-dma-pool";
+			size = <0x0 0x800000>;
+			alignment = <0x0 0x100000>;
+			alloc-ranges = <0x0 0x80000000 0x0 0x40000000>;
+			no-map;
+		};
 	};
 
 	cpus {
@@ -3863,6 +3871,9 @@ fastrpc {
 					qcom,glink-channels = "fastrpcglink-apps-dsp";
 					label = "adsp";
 					qcom,non-secure-domain;
+					memory-region = <&adsp_rpc_remote_heap_mem>;
+					qcom,vmids = <QCOM_SCM_VMID_LPASS>,
+							  <QCOM_SCM_VMID_ADSP_HEAP>;
 					#address-cells = <1>;
 					#size-cells = <0>;
 
-- 
2.34.1


