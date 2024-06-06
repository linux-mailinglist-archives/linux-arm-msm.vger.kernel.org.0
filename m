Return-Path: <linux-arm-msm+bounces-21959-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 804458FEFE1
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Jun 2024 17:05:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 931381C2320D
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Jun 2024 15:05:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 547AA1990BA;
	Thu,  6 Jun 2024 14:40:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="pnMQ/if2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0566196C75;
	Thu,  6 Jun 2024 14:40:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717684849; cv=none; b=BmLnZY4d5svDeO2jVCtDc7GyLuISdM2OY6JHfJZ7z3abNI4+MRGHKGCqIEWMZnG2HsJI8PyBKlkEZ7I1b22XXrCAoBTCak6XfrAfLpOiDmrUnKwzITzeQ+CGrkes8+y+HfARu4UgHSsbwJzJFqQkWcmd016k2snl7w0EqzwWp2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717684849; c=relaxed/simple;
	bh=SJ2SbVepOVSZTVKGpZ89FUkNLYbP1XaIie5uORXW7f0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UVn97dZ1jnuE3aIaHNdFxOSJe8hRDu7V0rSB9zeUvGzI46To9hm00nVi/rfeh4F2rxoGR1U8w+xtr5uutWcsGNNG88OfpwUg9XTaOxFsCaItsJ1KfS4rpBgJ7e/QwY+aARdM+SnaAt1mylnmGdVjwyihkeyunYD3Ip7VwqwFztQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=pnMQ/if2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4569aRWa026822;
	Thu, 6 Jun 2024 14:40:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=1cFsOi6okyJVCSq0+vaaGwP+
	ZMHpd08HnK0blr5U+nE=; b=pnMQ/if2wYvnHIMPRNJd/j0gA/0Xz838UBgXE7QD
	nWzEsTi/f3TyyYDzJ2zFp8CUXa9/EY9qpWo/KDtywqbrz0+5PUrd8DOAYAWsh0A8
	I+6e9uGZUgjR8ebm/4J/qAp2S72ZjchZwEMvAdKEodQiC48PMmV5T9MFZgT8G2iy
	pnLzoxqM31r0JiO10k82a46RHTR8d5AEYyNwfTNomY5UjN5dtyMG//FKIcotkEmL
	1B9y3IznY6nBIIKK1IT2cQTHd8DKfBQIPf3sgYbGwe3umWxDJyHKWS7rLBlvEfUN
	kPvdF7olySAQxTeb/KZgLv+380kR0p1MD9s6xmYewudClg==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yjq2tkapc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 06 Jun 2024 14:40:45 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 456Eeimo004147
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 6 Jun 2024 14:40:44 GMT
Received: from hyd-e160-a01-3-01.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 6 Jun 2024 07:40:40 -0700
From: Naina Mehta <quic_nainmeht@quicinc.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <konrad.dybcio@linaro.org>, <manivannan.sadhasivam@linaro.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-remoteproc@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <quic_nainmeht@quicinc.com>
Subject: [PATCH 5/5] arm64: dts: qcom: sdx75-idp: enable MPSS remoteproc node
Date: Thu, 6 Jun 2024 20:08:58 +0530
Message-ID: <20240606143858.4026-6-quic_nainmeht@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240606143858.4026-1-quic_nainmeht@quicinc.com>
References: <20240606143858.4026-1-quic_nainmeht@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: _ya4LprysvCrrqiQaPtcboviSKhFGcxC
X-Proofpoint-ORIG-GUID: _ya4LprysvCrrqiQaPtcboviSKhFGcxC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-06_01,2024-06-06_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 bulkscore=0 impostorscore=0 clxscore=1015 spamscore=0 malwarescore=0
 mlxlogscore=928 mlxscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406060105

Enable MPSS remoteproc node on sdx75-idp platform.

Signed-off-by: Naina Mehta <quic_nainmeht@quicinc.com>
---
 arch/arm64/boot/dts/qcom/sdx75-idp.dts | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdx75-idp.dts b/arch/arm64/boot/dts/qcom/sdx75-idp.dts
index fde16308c7e2..f1bbe7ab01ab 100644
--- a/arch/arm64/boot/dts/qcom/sdx75-idp.dts
+++ b/arch/arm64/boot/dts/qcom/sdx75-idp.dts
@@ -282,6 +282,12 @@
 	status = "okay";
 };
 
+&remoteproc_mpss {
+	firmware-name = "qcom/sdx75/modem.mbn",
+			"qcom/sdx75/modem_dtb.mbn";
+	status = "okay";
+};
+
 &sdhc {
 	cd-gpios = <&tlmm 103 GPIO_ACTIVE_LOW>;
 	vmmc-supply = <&reg_2v95_vdd>;
-- 
2.17.1


