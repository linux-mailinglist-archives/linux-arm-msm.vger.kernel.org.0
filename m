Return-Path: <linux-arm-msm+bounces-21517-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 920358D8B2B
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Jun 2024 23:00:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4A2A9283823
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Jun 2024 21:00:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B03D313B7AE;
	Mon,  3 Jun 2024 20:59:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="LiUts5ct"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3440413B7A1;
	Mon,  3 Jun 2024 20:59:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717448393; cv=none; b=NVK0KunHov0xsPwZApI7IAMWAbW42uM4ZYEUUXavJjrjmF/JxkCFq/LhDZ8jFDKyKkayzejl2hdzwxwkQIxArmWczrHaCq0E3XWj/EjUtVZ2naqdrPfHgiTK6Y89bWTgUrfTaUrPSI3HPHCxj/ILIom89r9ukmpssVKykjoSXDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717448393; c=relaxed/simple;
	bh=79lI7y45AFb/8pz18wznsrFWE3kFuIyOqtMdyaYcUEo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MHDcj9cRHtpZrsgs/9uvIId6LZRdNdSbffZuyzEbxKXGE2YgVlLxgcvJWe/Drhm7lf3hfy9gFYxoyIZAgApZi0GRnu0G+45lx0k3nOs73f8GSs23x2yGcsPdQjsbvkME5MN/psvrT1M4MftlaUDF1lX+FQn0Xi9TNnbCUJWUv4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=LiUts5ct; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 453HxYjl032193;
	Mon, 3 Jun 2024 20:59:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dIeBFOoIqVfXnxNM6S+vqDMhIDPiRyl61dtSrWNzsnk=; b=LiUts5ct7bn3556u
	dNebxm/Dm65vcP8beKgLpglTdmtTe0A1axfDV9bQ4jwKhFbb0SjxIn8tRGQdb+4j
	oajCAMFuQgB9Uzot4GXT2OQcg1gZrf++vtv3Vc9w0uZ15xovvvKd8xHt4kzoNAUl
	yFeUlkKVQM573MSrfI7f+sIxWecWGk5emZlRQUKGAVRodVMtfC0AhXulr5MM6dJO
	Kloc+jLzYtdKLlzYMv/3+75QNz92V/J5xrtBZhgXQp5LV13DyZXhK+XhuOs7vTlt
	flBijPMbkNbpe35EjINx9FvPLTbeLOlyoMEB/IYRYoTWfX7OcffGvfK3wMkstvS9
	SF8TnA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yfw4an81h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 03 Jun 2024 20:59:44 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 453KxhGf028445
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 3 Jun 2024 20:59:43 GMT
Received: from hu-sibis-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 3 Jun 2024 13:59:37 -0700
From: Sibi Sankar <quic_sibis@quicinc.com>
To: <sudeep.holla@arm.com>, <cristian.marussi@arm.com>, <andersson@kernel.org>,
        <konrad.dybcio@linaro.org>, <jassisinghbrar@gmail.com>,
        <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
        <dmitry.baryshkov@linaro.org>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <quic_rgottimu@quicinc.com>,
        <quic_kshivnan@quicinc.com>, <quic_sibis@quicinc.com>,
        <conor+dt@kernel.org>, <quic_nkela@quicinc.com>,
        <quic_psodagud@quicinc.com>, <abel.vesa@linaro.org>
Subject: [PATCH V5 4/5] arm64: dts: qcom: x1e80100: Add cpucp mailbox and sram nodes
Date: Tue, 4 Jun 2024 02:28:58 +0530
Message-ID: <20240603205859.2212225-5-quic_sibis@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240603205859.2212225-1-quic_sibis@quicinc.com>
References: <20240603205859.2212225-1-quic_sibis@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: IbdOVJG5KdaXIMtWxv_fLMY2KlZIeMK6
X-Proofpoint-ORIG-GUID: IbdOVJG5KdaXIMtWxv_fLMY2KlZIeMK6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-06-03_17,2024-05-30_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 mlxlogscore=970 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 suspectscore=0 mlxscore=0 bulkscore=0 spamscore=0 adultscore=0
 clxscore=1015 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406030169

Add the cpucp mailbox and sram nodes required by SCMI perf protocol
on X1E80100 SoCs.

Signed-off-by: Sibi Sankar <quic_sibis@quicinc.com>
---
 arch/arm64/boot/dts/qcom/x1e80100.dtsi | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
index a537f3117c9d..df31ca0f497c 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
@@ -5105,6 +5105,13 @@ gic_its: msi-controller@17040000 {
 			};
 		};
 
+		cpucp_mbox: mailbox@17430000 {
+			compatible = "qcom,x1e80100-cpucp-mbox";
+			reg = <0 0x17430000 0 0x10000>, <0 0x18830000 0 0x10000>;
+			interrupts = <GIC_SPI 28 IRQ_TYPE_LEVEL_HIGH>;
+			#mbox-cells = <1>;
+		};
+
 		apps_rsc: rsc@17500000 {
 			compatible = "qcom,rpmh-rsc";
 			reg = <0 0x17500000 0 0x10000>,
@@ -5288,6 +5295,25 @@ frame@1780d000 {
 			};
 		};
 
+		sram: sram@18b4e000 {
+			compatible = "mmio-sram";
+			reg = <0x0 0x18b4e000 0x0 0x400>;
+
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges = <0x0 0x0 0x18b4e000 0x400>;
+
+			cpu_scp_lpri0: scp-sram-section@0 {
+				compatible = "arm,scmi-shmem";
+				reg = <0x0 0x200>;
+			};
+
+			cpu_scp_lpri1: scp-sram-section@200 {
+				compatible = "arm,scmi-shmem";
+				reg = <0x200 0x200>;
+			};
+		};
+
 		system-cache-controller@25000000 {
 			compatible = "qcom,x1e80100-llcc";
 			reg = <0 0x25000000 0 0x200000>,
-- 
2.34.1


