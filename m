Return-Path: <linux-arm-msm+bounces-48845-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F705A3F07A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Feb 2025 10:36:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A22E619C666A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Feb 2025 09:36:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCEFE204C34;
	Fri, 21 Feb 2025 09:35:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="dQVpaO9m"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 602D7204C18;
	Fri, 21 Feb 2025 09:35:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740130536; cv=none; b=i6+aKue5AGsVqEswlxierKmeza0/o+5MCC0XNHHoZrr/oQAdwUKAVLgZ8ptnHehu/EWLNAyEuOUyd2vnC1EJXj1xpBdGHM1ZswUDfVMDtZxkHloZE2HsJ58Z56kHWbpucOzJe32gDtP3GtiD9hrZJGHaAYXiSLYEsGpXeMYxVhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740130536; c=relaxed/simple;
	bh=dOJh+AzFcibpNRM/L1vpmncUZ/1bNwPgaU1jfAxE5HA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=BX+k9Jn7WVHdNZXQYhKY3fXWBaus7YtFZpzZw4nnuAnjNBqO9ckC2JYnkUKGz6T2/4FHk4VfUP+NXxMGXvyIQ4nSgLGsAVP2FgALCbDOsymsWACoTc1TS51rfR9EYoVOqZvaPvX3Ur5O0RzUmWZvjaLIr0TdYMTo9R4OyKn7sS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=dQVpaO9m; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51L8m9I3011928;
	Fri, 21 Feb 2025 09:35:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MmQM1jfj15E+koVZEwyXD9Y0IRR9ec9EjJqudGd8G+o=; b=dQVpaO9m59cXJVRA
	opd6akT+/5rEd7TYg6JSoUJOz5chVPdy56ldCkO/M8hy5SVSWncsBfkt/N5IjNLi
	39kg75szTxfI30C5ShYJSuScCfdcyJVXK4Wpf0Hj1Kzg0HypX27AzetkgA9QWz22
	hiczrO8vX+U62DX+XysdTjnT26jCLayrOiqePedrTB8QM880w4uYotci58RqUH/w
	PBMn/JABb5vtuKV+dSPIezhs+aTcAiguLo0i/g9EczAq4saikPKNMyUu760thh94
	N9l5Z/CBheWr9us6l1ehMS0DZUaPapsVjbmvwFUwu6PrVKA+z5i6pzjiDKse8jDZ
	ydJqTQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44x2xbbnbx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Feb 2025 09:35:31 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51L9ZU4f028692
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Feb 2025 09:35:30 GMT
Received: from hu-tdas-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 21 Feb 2025 01:35:25 -0800
From: Taniya Das <quic_tdas@quicinc.com>
Date: Fri, 21 Feb 2025 15:04:56 +0530
Subject: [PATCH v5 3/4] arm64: dts: qcom: qcm6490-idp: Update the LPASS
 audio node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250221-lpass_qcm6490_resets-v5-3-6be0c0949a83@quicinc.com>
References: <20250221-lpass_qcm6490_resets-v5-0-6be0c0949a83@quicinc.com>
In-Reply-To: <20250221-lpass_qcm6490_resets-v5-0-6be0c0949a83@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
CC: Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik
	<quic_imrashai@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Taniya Das
	<quic_tdas@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.15-dev-aa3f6
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: sHYX3RCvRgWpzFqzCJIskw5iUgVbhSsi
X-Proofpoint-ORIG-GUID: sHYX3RCvRgWpzFqzCJIskw5iUgVbhSsi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-21_01,2025-02-20_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 bulkscore=0
 malwarescore=0 lowpriorityscore=0 phishscore=0 impostorscore=0 spamscore=0
 mlxlogscore=976 clxscore=1015 priorityscore=1501 adultscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2502210073

Update the lpassaudio node to support the new compatible as the
lpassaudio needs to support the reset functionality on the
QCM6490 IDP board and the rest of the Audio functionality would be
provided from the LPASS firmware.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
---
 arch/arm64/boot/dts/qcom/qcm6490-idp.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcm6490-idp.dts b/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
index 9209efcc49b57a853c4dd55ac52cd4dc98d7fe86..86d58f625d0e16a1eccd9925609b496fbd066051 100644
--- a/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
+++ b/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
@@ -759,3 +759,8 @@ &wifi {
 
 	status = "okay";
 };
+
+&lpass_audiocc {
+	compatible = "qcom,qcm6490-lpassaudiocc";
+	/delete-property/ power-domains;
+};

-- 
2.48.1


