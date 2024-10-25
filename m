Return-Path: <linux-arm-msm+bounces-35871-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CB8259B027D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Oct 2024 14:36:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 834841F21278
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Oct 2024 12:36:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37D60231C9E;
	Fri, 25 Oct 2024 12:36:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="n3pIgH+4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48897231C8E;
	Fri, 25 Oct 2024 12:36:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729859779; cv=none; b=eHnJeZyHRgqIs5+7wvV/6mnSOFb8bE6Q1eeHOuIUJnGCUE/x7RU6ibx/irRDMQtlsOpo2NWD7klVzoRZghFPAyZ852DG41Hmu7zb0U4PW8wd0Ah0jE8SjhR6IY/wJAAsv0BFBSc8wTLWBV+Bw9fTVKOquv86j0i7h6/mlf4VDZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729859779; c=relaxed/simple;
	bh=GmcGqmnPraocEH/ha7w3wgVC/IF11Mm5fSFxD2H3Ac4=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=s414M5zsiwQYwIJkckQZAGvMwXRpBAbY1hSMKr3o8Q1mlozW15qkd6GZZeNTT57GWUblo5szD8VG8/cUlfnnmz7yLK+7+2myzIAXWYd4bsCG/m045xPlwxH6UN645IQEFz2bpcF7gTO7oNi//P8CT9KXd+IeU0dksIWA6mcbUwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=n3pIgH+4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49PB626s016075;
	Fri, 25 Oct 2024 12:36:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=I2CWN9HsdqMKsMw9IXDX0/
	+ahCUck4SHWrVYwQ7YxJM=; b=n3pIgH+4zPQWHaDGymFG+VG8K/tDAkv68ffhnn
	1h1+aN4eC5s5Q3/wzUgqesltYlD/9fJz93MR5DZk5+/Nk2b7HvOs0MhyVijQwJzU
	5FlXVWk+uyx0ZLuVhbiWUp/8+rKsa2bDOKlwhi1d4Pefwasy5ou0oXlkJu7pwZUh
	xihHc4b/BD0qVgU2BvVLz8kEM4t8uJJLig1q4bhlI1iCUYIp2uo55X/am9boFl27
	GygBzH6O+LoHV//OmYWBPguBiNOY3MlJc9CeqMcgFFegqBPVlBks9v+zAwL2VlDT
	x4/jF7YM8qVE7shhGobPBtEgDS3OGQRkt+xj8Af5FLcUjqhA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42ga5jr89k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 25 Oct 2024 12:36:10 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49PCa9h4032435
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 25 Oct 2024 12:36:09 GMT
Received: from hu-sibis-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 25 Oct 2024 05:36:05 -0700
From: Sibi Sankar <quic_sibis@quicinc.com>
To: <andersson@kernel.org>, <konradybcio@kernel.org>, <krzk+dt@kernel.org>,
        <robh+dt@kernel.org>, <dmitry.baryshkov@linaro.org>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <quic_sibis@quicinc.com>,
        <conor+dt@kernel.org>, <abel.vesa@linaro.org>,
        <srinivas.kandagatla@linaro.org>, <quic_jjohnson@quicinc.com>,
        <maz@kernel.org>, <jens.glathe@oldschoolsolutions.biz>
Subject: [PATCH V1 0/3] X1E001DE Devkit remaining features
Date: Fri, 25 Oct 2024 18:05:48 +0530
Message-ID: <20241025123551.3528206-1-quic_sibis@quicinc.com>
X-Mailer: git-send-email 2.34.1
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
X-Proofpoint-ORIG-GUID: CUavjvf0-am62_hdqGjkfj_fJhRA2rsr
X-Proofpoint-GUID: CUavjvf0-am62_hdqGjkfj_fJhRA2rsr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 impostorscore=0 mlxlogscore=590 malwarescore=0 clxscore=1015
 priorityscore=1501 adultscore=0 mlxscore=0 spamscore=0 suspectscore=0
 phishscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410250097

This series adds 3.5mm jack, sd-card and external display support to the
X1E001DE Devkit.

PS: The ext display patch 3 needs pin-conf and updates from comments on
    the list. Just included it in the series so that people can get
    display up. Type c to DP was tested on all ports with [1] as the
    base branch.

[1] https://git.codelinaro.org/abel.vesa/linux/-/commits/x1e-next-20240930

Sibi Sankar (3):
  arm64: dts: qcom: x1e001de-devkit: Add audio related nodes
  arm64: dts: qcom: x1e001de-devkit: Enable SD card support
  arm64: dts: qcom: x1e001de-devkit: Enable external DP support

 arch/arm64/boot/dts/qcom/x1e001de-devkit.dts | 561 ++++++++++++++++++-
 1 file changed, 555 insertions(+), 6 deletions(-)

-- 
2.34.1


