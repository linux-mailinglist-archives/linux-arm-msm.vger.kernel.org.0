Return-Path: <linux-arm-msm+bounces-35864-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 396AE9B0263
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Oct 2024 14:33:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F2C6E281284
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Oct 2024 12:32:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 646AA231C87;
	Fri, 25 Oct 2024 12:32:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="L6uL1n23"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6655120101A;
	Fri, 25 Oct 2024 12:32:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729859576; cv=none; b=g3ucxdJigh+hy2cO2rXgU4MXhvwxolO8VxjH/ZbTkNFuJvlDoO0JwR4BsUQml7DQMj2bYhbx9h5+YXOUEY+X0hEmnktzv3pRgSlcFaojZDAtk+lcdHEqJIKHabkPme48/1WizQCZsFnQC7HA7jfhhkwlKTekm94WNtKfjVGxV0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729859576; c=relaxed/simple;
	bh=c865IYE4UP0bnS8gtKCy6I772KiWUMKdivPy59qfz94=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=MI9DJy+2L4txldjc8X54l14kXnoKzD36Cbiev8JjBl96cNQBY0WsRABz5/5m5RnFbETYBHJl6uXbsBW/kUWfQHKWxdV37aROxxf53cVekU5Or6RcY5W8D60gzNUpDgPQXq6xwZ/4zOuHcryYKfnaho1oN9fIZYD9dKjiQ4VpC/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=L6uL1n23; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49P9wKEB007584;
	Fri, 25 Oct 2024 12:32:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=CuwqJW1zt1l8TaY9kSvCSs
	a7RElXblA/5vkl/3AYFEA=; b=L6uL1n238EpF4v0D/uZOm7h+kkYTo2xSEJbJbS
	P6KnPWeX87W8i7f9ZKA4YLtrBp6kMX72KZHk9N3blgiaEubsBYB/YRURK4l13cQn
	neUHJ99gihNIKEoxbWTdVW2HZVAI9vsy1r+yJaVjwbGklDgY1WLMYwVIEBjl6oBz
	hUxv14Sg2+Zo8ZSSVfJmOr1DcSb5h4qNbVvbz58kW/CsoJ9tHbPYNg7/WIq425bf
	rkkKMq6ZpRtZBFZoKWR60X2y5KWWP4H3yM+A7UpkqByqlOYRhOrvB06dTiUVb5f4
	DaKIRJRXt9uHHWhJX1vVylf6cktvFZCKQZpqnT4+pwlNF4/g==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42fk52kv39-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 25 Oct 2024 12:32:48 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49PCWlZB028164
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 25 Oct 2024 12:32:47 GMT
Received: from hu-sibis-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 25 Oct 2024 05:32:42 -0700
From: Sibi Sankar <quic_sibis@quicinc.com>
To: <andersson@kernel.org>, <konradybcio@kernel.org>, <krzk+dt@kernel.org>,
        <robh+dt@kernel.org>, <dmitry.baryshkov@linaro.org>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <quic_sibis@quicinc.com>,
        <conor+dt@kernel.org>, <abel.vesa@linaro.org>,
        <srinivas.kandagatla@linaro.org>, <quic_jjohnson@quicinc.com>,
        <maz@kernel.org>, <jens.glathe@oldschoolsolutions.biz>
Subject: [PATCH V3 0/3] X1E001DE Snapdragon Devkit for Windows
Date: Fri, 25 Oct 2024 18:02:24 +0530
Message-ID: <20241025123227.3527720-1-quic_sibis@quicinc.com>
X-Mailer: git-send-email 2.34.1
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
X-Proofpoint-GUID: EvsmMhDjbP785aJPr9K3jHEgcJD-2d40
X-Proofpoint-ORIG-GUID: EvsmMhDjbP785aJPr9K3jHEgcJD-2d40
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 mlxscore=0
 lowpriorityscore=0 malwarescore=0 impostorscore=0 phishscore=0
 adultscore=0 mlxlogscore=999 priorityscore=1501 spamscore=0 bulkscore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410250096

Add initial support for X1E001DE Snapdragon Devkit for Windows. X1E001DE
is the speed binned variant of X1E80100 that supports turbo boost up to
4.3 Ghz. The initial support includes the following:

-DSPs
-Ethernet (RTL8125BG) over the pcie 5 instance.
-NVme
-Wifi
-USB-C ports

V3:
* Asked around and looked at the firmware, couldn't find a codename so
  will keep it as DEVKIT. Will update it if someone from the community
  finds something else.
* Update type c roles as reported by ucsi. [Dmitry]
* Update THUNDERCOMM to Thundercomm. [Dmitry]
* Update regulator names and sort Order. [Dmitry]
* Add x1e001DE devkit to the safe list.
* Mark regulator-nmve as boot enabled.


V2:
* Fix Ghz -> GHz  [Jeff]
* Pick up Ab tag from Rob.
* Use Vendor in ADSP/CDSP firmware path [Dmitry]
* Fix reserved gpios [Dmitry]
* Only port0 supports DRD update the dt accordingly [Dmitry]

Sibi Sankar (3):
  dt-bindings: arm: qcom: Add Snapdragon Devkit for Windows
  firmware: qcom: uefisecapp: Allow X1E Devkit devices
  arm64: dts: qcom: Add X1E001DE Snapdragon Devkit for Windows

 .../devicetree/bindings/arm/qcom.yaml         |   6 +
 arch/arm64/boot/dts/qcom/Makefile             |   1 +
 arch/arm64/boot/dts/qcom/x1e001de-devkit.dts  | 814 ++++++++++++++++++
 drivers/firmware/qcom/qcom_scm.c              |   1 +
 4 files changed, 822 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/x1e001de-devkit.dts

-- 
2.34.1


