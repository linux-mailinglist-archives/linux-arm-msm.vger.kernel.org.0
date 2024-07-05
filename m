Return-Path: <linux-arm-msm+bounces-25391-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B85FB928BBF
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Jul 2024 17:33:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E99BF1C214D5
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Jul 2024 15:33:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D359E16D302;
	Fri,  5 Jul 2024 15:33:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ZveL7eWh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6920F16C6AE;
	Fri,  5 Jul 2024 15:33:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720193605; cv=none; b=AweLrTMr27zbpiytF3KpuWqBXxVZ297C67smjYVk38M0WPq6p3c0Bm5p+fKTkSIGqZ9NKIKiDjW3ttkcuD/auihoJN7Z5TG7t6082xcekvvpXwCdcf1mwj2TP3Y8GtY1suhFNaOlW/jDKcialR1xJgaxFMxuIbfp54NbChM+0To=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720193605; c=relaxed/simple;
	bh=IM6Jslzn6iIt9JE7+HMKRD1xm1cEZQ9v/I7mj2clcBQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ahk/su/dEbU1PQ+49+twvwsRAy6kwDz3vZLJ+N17W0jonReyH8EqeY1rsxZglabSmguZHuIDhCc+JZY64Jtow1ejCqB4LsUZquNJVpd9aslst2CH+GOvwizvA2pWPYQqVnh4zs9XfdowZQqzalj61rHLvQPO24j63jmi4vBi94o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ZveL7eWh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4659mUHB000447;
	Fri, 5 Jul 2024 15:33:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QyaG8tnnBUJVRH0luMb/FZ4A84rWe60qAZCFcFgfXVk=; b=ZveL7eWhbAIgCmih
	3yd+EaO2yVPS+h6Vb/uQ2uzCmIFHjePzzho3vAny9JygImaavfMmApDYVDgTQQ2G
	42nxrE8kUAGno94fGob/kvHacr+Md2iCmoVpP/6TufIC0BTO5W3fQOiuLrUxu1j/
	dA1CKDEpMHgLP/MoqO6TaD6IYbePQKNR7ig/2CydsAjEmDmZA8CcZIKHfBOUDajF
	5xrGu81UN5+H5SDczRRSNDjLGyvOKOgyOU85VWy2N8Z0yIFSVrMhWe5YtXM6BZgN
	/v6bs6xfB5pTEjO/h5D68wINhD/QumpEgL17v8G2r5EtSqKd1mjuA1ThxH9n3BoJ
	chN7ww==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 405cg2d3kt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 05 Jul 2024 15:33:15 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA03.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 465FXFq8029589
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 5 Jul 2024 15:33:15 GMT
Received: from hu-mojha-hyd.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 5 Jul 2024 08:33:11 -0700
From: Mukesh Ojha <quic_mojha@quicinc.com>
To: <lee@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <andersson@kernel.org>,
        <konrad.dybcio@linaro.org>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Mukesh Ojha <quic_mojha@quicinc.com>
Subject: [PATCH 2/2] arm64: dts: qcom: sa8775p: Add TCSR halt register space
Date: Fri, 5 Jul 2024 21:02:52 +0530
Message-ID: <20240705153252.1571814-2-quic_mojha@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240705153252.1571814-1-quic_mojha@quicinc.com>
References: <20240705153252.1571814-1-quic_mojha@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: WzrANnNNPMxR2odFokrEOJoPxIdAqtbv
X-Proofpoint-ORIG-GUID: WzrANnNNPMxR2odFokrEOJoPxIdAqtbv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-05_11,2024-07-05_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 adultscore=0 spamscore=0 mlxscore=0 bulkscore=0 mlxlogscore=716
 malwarescore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 phishscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2407050112

Enable download mode for sa8775p which can help collect
ramdump for this SoC.

Signed-off-by: Mukesh Ojha <quic_mojha@quicinc.com>
---
 arch/arm64/boot/dts/qcom/sa8775p.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sa8775p.dtsi b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
index 23f1b2e5e624..a46d00b1ddda 100644
--- a/arch/arm64/boot/dts/qcom/sa8775p.dtsi
+++ b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
@@ -221,6 +221,7 @@ eud_in: endpoint {
 	firmware {
 		scm {
 			compatible = "qcom,scm-sa8775p", "qcom,scm";
+			qcom,dload-mode = <&tcsr 0x13000>;
 			memory-region = <&tz_ffi_mem>;
 		};
 	};
@@ -2824,6 +2825,11 @@ tcsr_mutex: hwlock@1f40000 {
 			#hwlock-cells = <1>;
 		};
 
+		tcsr: syscon@1fc0000 {
+			compatible = "qcom,sa8775p-tcsr", "syscon";
+			reg = <0x0 0x1fc0000 0x0 0x30000>;
+		};
+
 		gpucc: clock-controller@3d90000 {
 			compatible = "qcom,sa8775p-gpucc";
 			reg = <0x0 0x03d90000 0x0 0xa000>;
-- 
2.34.1


