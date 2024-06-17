Return-Path: <linux-arm-msm+bounces-22828-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A2B9B90A9C4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Jun 2024 11:37:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 403E1284E5D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Jun 2024 09:37:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 358DB1940B9;
	Mon, 17 Jun 2024 09:36:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="RA9g7i2x"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C343A194AF9;
	Mon, 17 Jun 2024 09:36:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718616965; cv=none; b=eX6Tp1QrY68hl0eMoVvNlHP/p3l82i8bLMqjRUafsL1l4EcTD3LVmnR7ZamI52cwKVL9spdvRIg+vBgVtcLl/Ut6TaOqV/qXvAbJ2yjYdoxa6t1RQoVCSnK4MbeQPTHgB/yYvE6a4hn/EZAvdv/MhvM2sc2GqzGllPVqRQnkDK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718616965; c=relaxed/simple;
	bh=vQqTvbivMs+MNtHTioR/qckxEhiqb5TTenbL4zuI1zQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kBXyv4HcaqZ2WVrqlmB9xp03hsFLXTpAuliwsOVtfcKpHtsjk+j1hnV/RwtiE2JWpwkrPY/H6AqNoG9m0ndL/G5Vo89bRlqJGRfW79WP+obUjYrGzfNB3hv2oE7ke1J8Gyskaw/WnryvGeVZSlwKjh5SY6mGd+3G6wvylvF/Xmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=RA9g7i2x; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45H0aCK0028294;
	Mon, 17 Jun 2024 09:36:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qlf8nNst8S52KWr/4lUQRbOdt7tnowKDVkaY8PGgG7A=; b=RA9g7i2xGIYeqcaw
	fiRuiq3a/ptDioN1hESxslZkEWBJg7p1kJ3t5ae3CrJp8Hg0WCh6W54h4bde9G/n
	jY242t1/cC/21u/aNDQxKpvBxmRgRwgpFGpPOnrSfMLLn44f9oVSDTOPPFX/2x77
	vKDapd8/14Uz8b5rfMIWXBsnqMKf8YE28Ddg4GdPWWbjN3J05lTE6IF48Jw6PuWA
	fntSgWIhup7NLIVEwpg0UvAgsyXI3Hjlbc5OWxY53Ayxj+qHN4ReHwc1tJQ8lgv3
	dSjHkxkomILD1wnLEW7gdx7dgZuuiVtTI0bVNwAJgPF7jRW6Z95Q3U51N2ezD9Fe
	FmJbsg==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ys2hxb8hr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Jun 2024 09:36:00 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA03.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45H9Zxgn003141
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Jun 2024 09:35:59 GMT
Received: from hu-nainmeht-hyd.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 17 Jun 2024 02:35:55 -0700
From: Naina Mehta <quic_nainmeht@quicinc.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <konrad.dybcio@linaro.org>, <manivannan.sadhasivam@linaro.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-remoteproc@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <quic_nainmeht@quicinc.com>
Subject: [PATCH v2 5/5] arm64: dts: qcom: sdx75-idp: enable MPSS remoteproc node
Date: Mon, 17 Jun 2024 15:04:28 +0530
Message-ID: <20240617093428.3616194-6-quic_nainmeht@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240617093428.3616194-1-quic_nainmeht@quicinc.com>
References: <20240617093428.3616194-1-quic_nainmeht@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: lEHMSu-eLMhLcOEggCjp1AIJpX6PKNyJ
X-Proofpoint-ORIG-GUID: lEHMSu-eLMhLcOEggCjp1AIJpX6PKNyJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-17_08,2024-06-14_03,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 mlxlogscore=928 clxscore=1015 priorityscore=1501 bulkscore=0 phishscore=0
 lowpriorityscore=0 spamscore=0 impostorscore=0 mlxscore=0 malwarescore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406170073

Enable MPSS remoteproc node on sdx75-idp platform.

Signed-off-by: Naina Mehta <quic_nainmeht@quicinc.com>
---
 arch/arm64/boot/dts/qcom/sdx75-idp.dts | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdx75-idp.dts b/arch/arm64/boot/dts/qcom/sdx75-idp.dts
index fde16308c7e2..f1bbe7ab01ab 100644
--- a/arch/arm64/boot/dts/qcom/sdx75-idp.dts
+++ b/arch/arm64/boot/dts/qcom/sdx75-idp.dts
@@ -282,6 +282,12 @@ &qupv3_id_0 {
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
2.34.1


