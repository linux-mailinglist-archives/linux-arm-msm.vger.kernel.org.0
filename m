Return-Path: <linux-arm-msm+bounces-34022-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C84E999CB7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Oct 2024 08:33:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1E191B2247B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Oct 2024 06:33:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12EAE20A5C1;
	Fri, 11 Oct 2024 06:32:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="lDnEQoY0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5453E209F56;
	Fri, 11 Oct 2024 06:32:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728628325; cv=none; b=gDLdZtN/O7aUf5gtYt5Gz7/D4gsTuLtK4lqiXnfyLmEbJpQ9i79YQi7BYxAtevdMo6ffi6VU/hgwROnvuWKzTg81H0+V2Ksjp+pDKRECKrgQZH5MEe55nGx1SHrVJfw56LpeqeWGCT1a4+Rqc//e884UyWARVWFbY+aP6AD/9GQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728628325; c=relaxed/simple;
	bh=CmlCWw3ElW5UexdSvCDRn+qtYgpETyaR+zqI9E5VlmY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FiUv82XQSwAiRfKI3YIgVhRjhCqMnsu0lglYZZW4dW9EAjSNvPoZHAZFO16LCSl3gZtMYQrdWMwo49ydSeMnKX713wEEFM0t5zR6b6Zg5DiVOxnzPJH3AgPUOkHeAXbmJ+SrKY9srWS9WYUyddoxyG3SB8AFu/fKZKn5jUBmips=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=lDnEQoY0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49B4nQW1008279;
	Fri, 11 Oct 2024 06:31:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=wSg4NZ4u95Al1EqHH7HO18rK
	z3muiRjuQuubeCR9dGQ=; b=lDnEQoY0L1pBTx4M8RTmMVw7oblPhTyoe2iV8hDU
	fyLpgZ6Q0F9sGpmKiZsjq2prWGQ8kFqv5RT5SD8fc8tAHhSemVhOD4Q6dDRF+8zK
	2mQZGWydL1x58lwLF8EdYi3XAlEsCQdcf33WCGCrcCKIDXeHv9Ud/cYTA+5IFSDE
	BaLg0y1WeH36MPJZqmeymUHadyPzfZnNZTskNNViznfPqXpAqTCIEmUIm5yCDIa4
	VJU08KuTeylduoC0bVVXKmXzHBb61XnekP76UwJT1xhgnnvw7FQOvpiqUY9vDsRj
	hXLrZhiYsVtaKKivaoWyxeHuY4b3opaTgbgIe1UE1y4a3A==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 426gw2j0wa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 11 Oct 2024 06:31:53 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49B6VqFe007190
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 11 Oct 2024 06:31:52 GMT
Received: from hu-qqzhou-sha.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 10 Oct 2024 23:31:49 -0700
From: Qingqing Zhou <quic_qqzhou@quicinc.com>
To: <andersson@kernel.org>, <konradybcio@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <robimarko@gmail.com>,
        <quic_gurus@quicinc.com>, <will@kernel.org>, <robin.murphy@arm.com>,
        <joro@8bytes.org>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <iommu@lists.linux.dev>,
        Qingqing Zhou
	<quic_qqzhou@quicinc.com>
Subject: [PATCH 3/4] arm64: dts: qcom: qcs615: add scm node
Date: Fri, 11 Oct 2024 12:01:11 +0530
Message-ID: <20241011063112.19087-4-quic_qqzhou@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20241011063112.19087-1-quic_qqzhou@quicinc.com>
References: <20241011063112.19087-1-quic_qqzhou@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Pz8rCc4xKgpJbRc8PIs8XcOqLOCHl-J7
X-Proofpoint-ORIG-GUID: Pz8rCc4xKgpJbRc8PIs8XcOqLOCHl-J7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 suspectscore=0
 mlxlogscore=999 bulkscore=0 malwarescore=0 lowpriorityscore=0
 impostorscore=0 adultscore=0 phishscore=0 priorityscore=1501 clxscore=1015
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410110042

Add the scm node for QCS615 platform. It is an interface to
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


