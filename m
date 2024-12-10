Return-Path: <linux-arm-msm+bounces-41214-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DD6E19EA8D9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Dec 2024 07:42:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E32F2167DAF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Dec 2024 06:41:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F23D22CBD1;
	Tue, 10 Dec 2024 06:42:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Kex2sXsA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7812222617C;
	Tue, 10 Dec 2024 06:41:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733812920; cv=none; b=qjfWnkwpEOzz2UH6uTkUYnrfvxki2MY8CsV448Kp/RAJNbhbHFacsEa93rRrk0KusurYRJsize3u1IqdKHSgkQVfAsHkUGCEcrWrx5uTnsg8tkFx7QJtk3T+1eCW4hoQyo11UXX9ZFYWbVpNh6G/T4mx0axMz5L5gy1By25oHjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733812920; c=relaxed/simple;
	bh=e9OTnPLB2umO0k7QnLuiEOZBUnwpjq7GIwOI1trdZ6A=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=nX5civv+rw5+CU2fOcXWieUox46XMpbr02nbqmH/qQRYBjh29Zi9JWUcJMZ7Lc7q+T5BiztMWa4c+rBBN+8EaVZRmxFDkQC7rYi3470IUlzGW0TK6T1MK5WObJXhRWgyxN48wQWp2hPR/ctrzzORzh7hpjJokKRTxZoFnWgWDb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Kex2sXsA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B9NpUEk018822;
	Tue, 10 Dec 2024 06:41:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=6jkjtLvNTflzzjXdpuM4sY
	Tezia6xxDBrhHzxR5gS8Y=; b=Kex2sXsADUJXYrRT3J+RiwG0/sc232ksgspnZw
	TFgrG1By/dITp9X9/8Lj5u+1oK9SvYy9Zeuard4/El48PRquwot0fOykldcXiy0b
	UUwr5VBElUXf2j+9wP34Wf25nvPjs/2mrHbt4nGUAGKt8nfji14q7eQGUhPOsK6U
	3Ya2RVqtxm4bg3INAr61sujt7F0L6QoDoJoB1xv++8XqQmYYKBBgV9y1l4UvgdaE
	Dxaol1EXsii4KI/dXU7mSGb4NTdCXW4x3njcZLVO1NgOi1Of7NCorZwn1p3A7lkr
	zyOC1q3n0J//isvP0PK+u0Lb+NpViplG7p6gyfTiKDu8VugA==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43eak38uxj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Dec 2024 06:41:53 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BA6fqqH029895
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Dec 2024 06:41:52 GMT
Received: from hu-mmanikan-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 9 Dec 2024 22:41:48 -0800
From: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
To: <andersson@kernel.org>, <mturquette@baylibre.com>, <sboyd@kernel.org>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <quic_srichara@quicinc.com>, <quic_varada@quicinc.com>
Subject: [PATCH 0/2] Add gcc_xo_clk for IPQ5424 
Date: Tue, 10 Dec 2024 12:11:08 +0530
Message-ID: <20241210064110.130466-1-quic_mmanikan@quicinc.com>
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
X-Proofpoint-ORIG-GUID: D7AbsbtbH4CSBV4s4oxGbAlRgwsOIIhL
X-Proofpoint-GUID: D7AbsbtbH4CSBV4s4oxGbAlRgwsOIIhL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 mlxlogscore=646 clxscore=1015 spamscore=0 mlxscore=0 impostorscore=0
 malwarescore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 bulkscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412100050

The gcc_xo_clk is essential for the functionality of the WiFi
copy engine block. Therefore, add the gcc_xo_clk in dt-bindings
and gcc driver.

Manikanta Mylavarapu (2):
  dt-bindings: clock: qcom: gcc-ipq5424: add gcc_xo_clk macro
  clk: qcom: ipq5424: add gcc_xo_clk

 drivers/clk/qcom/gcc-ipq5424.c               | 19 +++++++++++++++++++
 include/dt-bindings/clock/qcom,ipq5424-gcc.h |  1 +
 2 files changed, 20 insertions(+)

-- 
2.34.1


