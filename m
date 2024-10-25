Return-Path: <linux-arm-msm+bounces-35770-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E0ABE9AF7EF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Oct 2024 05:08:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 54EF6B2180F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Oct 2024 03:08:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 735AC18C03C;
	Fri, 25 Oct 2024 03:08:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="jds/IBJq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93C5518B478;
	Fri, 25 Oct 2024 03:08:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729825711; cv=none; b=jW4t0bJ8DULYwCk+LNyp77Nr/yc4nMK+G4XyNStGEo6bxa7mYgrLCMiyohkZzPQJ7CaZERAlPQIDTI/0et6jG75bXTOQGpfvLdUT+o9zH63YiomWKMdXgdRb7KHuO8MGPUpgQLKg0OpdvlSMeSUevJZMkXT8/Q8NJ7IGOpMpfNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729825711; c=relaxed/simple;
	bh=nC8FciNiN3Dfqy58CPUQXdpnt60YHZOVeQ/0YubqLHk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Hi0X8BHQAe0IH/+7xHW3doRxT9kjOJAwN+HG0B4Cl1soJpyVx1z6va0QH8o1EtVj1xO7o1bRqZ7kI8kJ++2fRyZoOAAZpf4/SYh0969GjTaJp7IEuj5b+j0efzVZlT14fAU5P2+XFJy6XHmUFvXCwhSDg+Ld7bQbI3dxi6MqtZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=jds/IBJq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49OML7TT029391;
	Fri, 25 Oct 2024 03:08:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=8BtTNXkjvMiKVnqAsUXbO2J/
	NsnCrNk4H2wTEClBxPQ=; b=jds/IBJqtKT9mT9YcIE/9lT8fm8ftUOQ+TZSVK1M
	UfeEdzaRAzfE/uQ1bmf2UdHbBRMB+RnhAJPbitBEfXD2R8gxsovAU11jS8fnFBLJ
	qCdzu79hrZxNkrRJ0djIILID1jfqPA3yEhVdTxgjUmysIWPEbKkcRTBum7DU/dFW
	xntXU7bmMzaQ1/12gpb+TCZMuC48OhfeG7etNEfwluhfncd6WgUkkkfkBF0B6kDz
	/5s7+XbIUkXkm+D+pidSiHcfvNQTJ4YZT/4A/tYvQjkGGZuGlU4vSHxMJ+/6q8LU
	FLxLaePCatpzvL/MGV2iCFQ9VMzOb1zqDmBZ5m3R2VlxoQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42em3w7kk5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 25 Oct 2024 03:08:19 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49P38IFN000723
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 25 Oct 2024 03:08:18 GMT
Received: from hu-qqzhou-sha.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 24 Oct 2024 20:08:15 -0700
From: Qingqing Zhou <quic_qqzhou@quicinc.com>
To: <andersson@kernel.org>, <konradybcio@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <robimarko@gmail.com>,
        <will@kernel.org>, <robin.murphy@arm.com>, <joro@8bytes.org>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <iommu@lists.linux.dev>,
        Qingqing Zhou
	<quic_qqzhou@quicinc.com>
Subject: [PATCH v3 3/4] arm64: dts: qcom: qcs615: add the SCM node
Date: Fri, 25 Oct 2024 08:37:31 +0530
Message-ID: <20241025030732.29743-4-quic_qqzhou@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20241025030732.29743-1-quic_qqzhou@quicinc.com>
References: <20241025030732.29743-1-quic_qqzhou@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: W5pvat2RGPCSLT_ITu29nn1FqZIf17G9
X-Proofpoint-GUID: W5pvat2RGPCSLT_ITu29nn1FqZIf17G9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=999
 priorityscore=1501 impostorscore=0 bulkscore=0 lowpriorityscore=0
 clxscore=1015 suspectscore=0 spamscore=0 malwarescore=0 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410250021

Add the SCM node for QCS615 platform. It is an interface to
communicate to the secure firmware.

Signed-off-by: Qingqing Zhou <quic_qqzhou@quicinc.com>
---
 arch/arm64/boot/dts/qcom/qcs615.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs615.dtsi b/arch/arm64/boot/dts/qcom/qcs615.dtsi
index ac4c4c751da1..027c5125f36b 100644
--- a/arch/arm64/boot/dts/qcom/qcs615.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs615.dtsi
@@ -278,6 +278,13 @@
 		reg = <0 0x80000000 0 0>;
 	};
 
+	firmware {
+		scm {
+			compatible = "qcom,scm-qcs615", "qcom,scm";
+			qcom,dload-mode = <&tcsr 0x13000>;
+		};
+	};
+
 	camnoc_virt: interconnect-0 {
 		compatible = "qcom,qcs615-camnoc-virt";
 		#interconnect-cells = <2>;
-- 
2.17.1


