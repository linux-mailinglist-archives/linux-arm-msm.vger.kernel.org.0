Return-Path: <linux-arm-msm+bounces-27663-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AB479444A8
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Aug 2024 08:46:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A89CC1F2304A
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Aug 2024 06:46:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14E51157A61;
	Thu,  1 Aug 2024 06:46:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="FgGauOKX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 688A01BDC3;
	Thu,  1 Aug 2024 06:46:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722494769; cv=none; b=ns7cJd7LTRUmePyJM9ARIUkDqIRvv7E4VDEEYj+XqXaZIBextFkOX5btIV0Ot2yMN03DiJrg5nPGfX7WrOtfMl6hGMs0mZS4v9n2v+mKfXTsCM4jO8pKzkKvwb13FdvI3tq8z+l5NWOoczbiUB9kYiGs72vAr8YmSv9FKQNjVtc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722494769; c=relaxed/simple;
	bh=VbW5w+3aCtovoUT3qQI/sK2HjrOEVa1Nj7K7tREcv3E=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=F741nmzcJSPkwv3Jy4jR9gKBVowQvsCJVlq4po24/NVecA6Cz2dNZfLYbuXuIpydoicrXeWJvg+kppRGnykUbh5LV86/8mG9GrXHAL80IOgAIfS5MbrUg/Glgp0S/wTktLBuMLhNXiBTFfGjuzjgkUD2sN+JsDCNLsk08aVFt5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=FgGauOKX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4710OTmJ010012;
	Thu, 1 Aug 2024 06:46:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=zoY2RHLYi/ZxAjNt+Fbrbl
	NGCu3+edYxbP8eSb+FDEM=; b=FgGauOKXttOPrHiUkmgIG55FnRFklNyrYue285
	VuXSs3BsmwPMX/WrmVV1kL+S8PV65DF6k86ZD3g2JlobjltGHbL0+dsA0VY9YfFA
	qx0ZlnUg3BuS9LtzWnbawIYC8OGBI+RoezK2P8IyRK2jhm0kxeWK57JG7b0QtFiC
	Y+CKlLVS4tWFlsN6WKtTfzhZJe5+L2W4Oj1Hf2KxT1WrE7EyzpdEBL+eLDhlN14S
	Jq7ONNm6vR045qVAHKyyv7mX6wFnml6c3VEo8GKjfz8loNlzYsS+DlgnSBaI/uWW
	SuX82adBorJ1DVDYrr8vVnPkmcr21afMopWWxhrtrUjTDVQg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40qnbaarw5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 01 Aug 2024 06:46:02 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 4716k0pI025938
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 1 Aug 2024 06:46:00 GMT
Received: from hu-jkona-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 31 Jul 2024 23:45:55 -0700
From: Jagadeesh Kona <quic_jkona@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring
	<robh+dt@kernel.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Bryan O'Donoghue
	<bryan.odonoghue@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Taniya Das
	<quic_tdas@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        "Satya
 Priya Kakitapalli" <quic_skakitap@quicinc.com>,
        Imran Shaik
	<quic_imrashai@quicinc.com>,
        Ajit Pandey <quic_ajipan@quicinc.com>
Subject: [PATCH V4 0/2] Drop required-opps from required list on SM8650 videocc, camcc
Date: Thu, 1 Aug 2024 12:14:46 +0530
Message-ID: <20240801064448.29626-1-quic_jkona@quicinc.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: UJoF6XGrZbnvpna3IeeLzELG5oL7pYKm
X-Proofpoint-GUID: UJoF6XGrZbnvpna3IeeLzELG5oL7pYKm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-01_04,2024-07-31_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 bulkscore=0 lowpriorityscore=0 mlxlogscore=790 phishscore=0 mlxscore=0
 impostorscore=0 clxscore=1015 suspectscore=0 adultscore=0 spamscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408010037

On SM8650, the minimum voltage corner supported on MMCX from cmd-db is
sufficient for clock controllers to operate and there is no need to specify
the required-opps. Hence remove the required-opps property from the list of
required properties for SM8650 camcc and videocc bindings.

Changes in V4:
 - Dropped change to disallow required-opps on variants that don't need it
 - Split the change into separate commits for videocc and camcc
 - Link to V3: https://lore.kernel.org/all/20240730034552.31271-1-quic_jkona@quicinc.com/
Changes in V3:
 - Made only required-opps property conditional and added it based on the variant
 - Link to V2: https://lore.kernel.org/all/20240720052818.26441-1-quic_jkona@quicinc.com/
Changes in V2:
 - Made required: conditional and dropped required-opps from it only for SM8650 platform
 - Dropped Krzysztof Acked-by tag due to above changes
 - Link to V1: https://lore.kernel.org/all/20240708130836.19273-1-quic_jkona@quicinc.com/

Jagadeesh Kona (2):
  dt-bindings: clock: qcom: Drop required-opps in required on sm8650
    videocc
  dt-bindings: clock: qcom: Drop required-opps in required on SM8650
    camcc

 .../bindings/clock/qcom,sm8450-camcc.yaml     | 19 +++++++++++++++----
 .../bindings/clock/qcom,sm8450-videocc.yaml   | 11 ++++++++++-
 2 files changed, 25 insertions(+), 5 deletions(-)

-- 
2.45.2


