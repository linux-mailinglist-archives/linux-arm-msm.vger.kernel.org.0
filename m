Return-Path: <linux-arm-msm+bounces-50204-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B9DCEA4E3E5
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Mar 2025 16:43:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4B28719C50E8
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Mar 2025 15:33:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39B5A2686B8;
	Tue,  4 Mar 2025 15:22:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Oh4zShkx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A380326738D;
	Tue,  4 Mar 2025 15:22:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741101723; cv=none; b=UyCJ7ygEz1nRdKkkHaB3C45dL0DGDa9NahN8qo7gzj6Xmiee53XJZk8NsAS3+q2Mnq9uQgNJ87r1OmYvdm9vEf4KI6Gtk97fI+6epKxFTSLqxi+odEIfXyXR9DGTxnYLKnKkMq5O07wkJFa5F8pWWRkx157v8w9qaXm/t0rZkbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741101723; c=relaxed/simple;
	bh=F81PowR6sTnmuitnJ10Ri0uZKVplt0OjHyJEHqWjwg4=;
	h=Date:From:To:CC:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nKZ9+o+t4Sal/tXUO6QpZincOLgq8tadkJ6mgbl9UmJKhrc3kLUD0D0SexPWp4Z7muEmMOxBfFFYU6jX5LYsWSecmHNuu8pUZrGzQLMO4gYcc7i5ueBtw8j4IhKfQLABUZ8Onz7D52n6Yd7JgRNDrMVd0ezpuvogCdJzA9+x4Lg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Oh4zShkx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 524AJHfY024801;
	Tue, 4 Mar 2025 15:21:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:message-id:mime-version:subject:to; s=
	qcppdkim1; bh=ZcXd1JyQgP9h0Ejk9LgMatug1HZzggFfE1sUzObyScg=; b=Oh
	4zShkxrb5z89u1rwjJMpuIxkhWO27VQeQ9zO5aDRumBGjo5sIxLX8LUmD1dyCPqh
	9jiLKGDbenOucidVCJAqhtapfKSL9HO+S6Bqr9SmMkpLLy4P0xU7PeVE7F65nvHi
	Nh+K0f3GCpIehA1vJvQm6v8vyYhtbe+AYIk45u6gS3EoWLF+UQ02N5NS7DU2DfYv
	hmSu5ICWfAuXNio2cVAcHj8MdIXdwaSE4RkfO94alXk7tiIaenadgKRbhhefAxCn
	8rQhGeI/S1yKuagQduAu+jLKgD6KAFgj3UY3AokcxqLm6c/cwDfEB8OINirrnssb
	mty8gkKXGMRSdt1SAomg==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 455p9327qp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 04 Mar 2025 15:21:46 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 524FLkpx004267
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 4 Mar 2025 15:21:46 GMT
Received: from hu-kapandey-hyd.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 4 Mar 2025 07:21:42 -0800
Date: Tue, 4 Mar 2025 20:51:33 +0530
From: Kaustubh Pandey <quic_kapandey@quicinc.com>
To: <andersson@kernel.org>, <konradybcio@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC: <quic_rpavan@quicinc.com>, <quic_sharathv@quicinc.com>,
        <quic_sarata@quicinc.com>
Subject: [PATCH] arm64: dts: qcom: qcom6490-idp: Add IPA nodes
Message-ID: <20250304152133.GA2763820@hu-kapandey-hyd.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=Me2Wu4/f c=1 sm=1 tr=0 ts=67c71a8a cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=kj9zAlcOel0A:10 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8 a=6w_Dn63UQQp3T8FYcDMA:9 a=CjuIK1q_8ugA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: IIT9KV-VFE-Cr0T_OIb-zs_Vtn3Wuxlm
X-Proofpoint-ORIG-GUID: IIT9KV-VFE-Cr0T_OIb-zs_Vtn3Wuxlm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-04_06,2025-03-03_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 clxscore=1011
 suspectscore=0 mlxscore=0 malwarescore=0 phishscore=0 spamscore=0
 adultscore=0 lowpriorityscore=0 mlxlogscore=710 priorityscore=1501
 impostorscore=0 classifier=spam authscore=0 adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2502100000 definitions=main-2503040124

Add IPA nodes for Qualcomm qcm6490 board.

Signed-off-by: Kaustubh Pandey <quic_kapandey@quicinc.com>
---
 arch/arm64/boot/dts/qcom/qcm6490-idp.dts | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/qcm6490-idp.dts b/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
index 9209efcc49b5..ba47786d6474 100644
--- a/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
+++ b/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
@@ -19,7 +19,6 @@
 #include "pm8350c.dtsi"
 #include "pmk8350.dtsi"

-/delete-node/ &ipa_fw_mem;
 /delete-node/ &rmtfs_mem;
 /delete-node/ &adsp_mem;
 /delete-node/ &cdsp_mem;
@@ -515,6 +514,13 @@ &gpu_zap_shader {
 	firmware-name = "qcom/qcm6490/a660_zap.mbn";
 };

+&ipa {
+	qcom,gsi-loader = "self";
+	memory-region = <&ipa_fw_mem>;
+	firmware-name = "qcom/qcm6490/ipa_fws.mdt";
+	status = "okay";
+};
+
 &mdss {
 	status = "okay";
 };

