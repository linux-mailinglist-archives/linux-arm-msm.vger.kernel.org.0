Return-Path: <linux-arm-msm+bounces-23176-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 357C090E337
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Jun 2024 08:17:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D5CA21F2287D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Jun 2024 06:17:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCCAA2C19E;
	Wed, 19 Jun 2024 06:17:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="cijBT0qG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 637AC4A1D;
	Wed, 19 Jun 2024 06:17:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718777826; cv=none; b=SvuzeXOe9pVqUqJiXxvR1fPRo3E1ssXG/K6NtWI7SRx+C2lCh8TZXSG4D86QhXjVTC3rUX8SoKfE4I5+7i57o43LycPoiduT575OivzGCEHu6iBVyTj0Aw8MQATn+Z0A3zDG2aiM42vo/OCGn0+jlrLULhCmuIfhcpw1Itexc98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718777826; c=relaxed/simple;
	bh=yD4FfZXX84m775E4Ws+FyjGG/Ea7T5l43Asjc+1l2dQ=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Bf7RbdIt+lUiSlF7SYHRcAh5k+CB1d+2LxLG011wAkL3U4kCgHvncq6tttfIPb0wEhzyEF8aw4teBqW+Ec6VSNNpkIe0AAyV3e4UbBNjZY17QdGjisUmAcT5KBuXzviwqc3lt463XEyvO6FYu4AhMKsMAjHCJridRbL5DEn5ql8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=cijBT0qG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45ILf2wo027345;
	Wed, 19 Jun 2024 06:17:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=iBwk78l4cuhKUDHKjTF4d0
	sIhM0QgmorwYte40IDdnA=; b=cijBT0qGTx1Ouz5LQqWkgYTFzaQdm5ty75oK7w
	BHW7aQQvDHjWXv8r5qBFLJ9VQmcOe0xTxG81DxrSIMZxBxFfIEQzYKed26dqFK7t
	GmZo/dyMhOxdxhC9C9CWJnpS0UK74AghvFz7EmMJVLzzhm833qDZxj/TfJHak3E4
	r3cLpyueEU15onYdYybJTNxGB9mEdOAYncAGtNHxC5iPJUSdgRQEjgIM0dILRRcY
	bzNTGhUkGGvoW2UHqPOnO0IRnTN6mUwYyBeob5fPcoa0st7SO9Ldl3ELefsGGIna
	CnIQT4gQpEMFSLzOSXXEV8QBMkSyBYCT22lTThQsdJGQXL9g==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yujc4gtm3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Jun 2024 06:17:02 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45J6H1mR013048
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Jun 2024 06:17:01 GMT
Received: from hu-kbajaj-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 18 Jun 2024 23:16:57 -0700
From: Komal Bajaj <quic_kbajaj@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konrad.dybcio@linaro.org>,
        Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Mukesh Ojha <quic_mojha@quicinc.com>,
        "Komal
 Bajaj" <quic_kbajaj@quicinc.com>
Subject: [PATCH v2 0/2] qdu1000: Fix LLCC reg property
Date: Wed, 19 Jun 2024 11:46:39 +0530
Message-ID: <20240619061641.5261-1-quic_kbajaj@quicinc.com>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: eJWHoC6z7ipe62MlKBP6cKXhcYDg-KBX
X-Proofpoint-GUID: eJWHoC6z7ipe62MlKBP6cKXhcYDg-KBX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-19_02,2024-06-17_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 clxscore=1015
 priorityscore=1501 mlxlogscore=691 malwarescore=0 lowpriorityscore=0
 mlxscore=0 bulkscore=0 impostorscore=0 spamscore=0 phishscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406190044

The LLCC binding and driver was corrected to handle the stride
varying between platforms. Switch to the new format to obtain
the base address of each LLCC bank from devicetree.

-----
Changes in v2:
* Updated the commit message for bindings, marking the change as revert
* Link to v1: https://lore.kernel.org/linux-arm-msm/20240612062719.31724-1-quic_kbajaj@quicinc.com/

Komal Bajaj (2):
  arm64: dts: qcom: qdu1000: Fix LLCC reg property
  Revert "dt-bindings: cache: qcom,llcc: correct QDU1000 reg entries"

 .../devicetree/bindings/cache/qcom,llcc.yaml     |  2 +-
 arch/arm64/boot/dts/qcom/qdu1000.dtsi            | 16 +++++++++++++++-
 2 files changed, 16 insertions(+), 2 deletions(-)

--
2.42.0


