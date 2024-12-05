Return-Path: <linux-arm-msm+bounces-40434-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E6A89E4DA8
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Dec 2024 07:41:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B6E4F284B83
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Dec 2024 06:41:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B05C5193425;
	Thu,  5 Dec 2024 06:41:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="RRjppkpl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFEE7391;
	Thu,  5 Dec 2024 06:41:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733380872; cv=none; b=Mk7lU6jIDjXRIQgqCM1ICsXa58+eJ5Oy/VzLPQARW2TCuHO1Va1aknZHKHuY0Q/zrv7qkofznXSJUohWsocLHsmgeyyT/HQQVEG8tJVJ1Ihcbvf971l4Yi+WCZ6wc1JJxx55DTxSmaAI4019jfWZypdEIkY94XsnUHBkQ6LFM5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733380872; c=relaxed/simple;
	bh=Dqkdvnm03vD0lCI3NxYEQ5X8NT4p6hbjjuwVB14daJI=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ubY1GRRa6/aLvV2yyNGvVToaDnfSvys0lTtjxT4rp9iNehS/57RNl4KfH7Venp8IyqoL61345kmHx0SmVmOMiBp6UAi1z0ABoaCCWtLCDu2jtXMTK/by6BspzReAdnTKtbQY9enf0etg216xwuiPYO0oiEdpZTaXxDXMr5cIOCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=RRjppkpl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B55QxdA023234;
	Thu, 5 Dec 2024 06:41:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=t36ygrej6jgMDzOrzS0dsR
	3EHkr7lmRn/JernSc8QT4=; b=RRjppkpl0GXNBoKTTd+CgvvpUa1Cd/Wh0guVe2
	XBXrSBNfFwh3l4ANu6YJa7IoItzUeAq7A1b7jPBOjEz/4b/0CpMbTPg1johVo5uL
	3J8ODMktQmMeO+K5/Oh14Grhp1cTqUeiLe0MOlF9qrsO6sIljfiBDlIiVotf/1QC
	u4lcqHS0HtKR5GN7rxbVUA5q77syFfgtogJ2VYQIlazrxV351RNopDgl6+/0137Q
	Qz8FpZX5uYBosttQhIIx3xFC2B55DHTWdBhnW6OFxSYPCPz9imQcacsAC9VjxlcH
	W3ECh52CDdjnv1EKx/Vln5N4G1x4WZRq+wc0EYk9kckadzXA==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43aj42b9um-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 05 Dec 2024 06:41:04 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B56f3rh024843
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 5 Dec 2024 06:41:03 GMT
Received: from hu-mmanikan-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 4 Dec 2024 22:40:59 -0800
From: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
To: <andersson@kernel.org>, <mturquette@baylibre.com>, <sboyd@kernel.org>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>
CC: <quic_srichara@quicinc.com>, <quic_varada@quicinc.com>
Subject: [PATCH 0/2] Remove apss_dbg clock from IPQ5424 gcc driver
Date: Thu, 5 Dec 2024 12:10:35 +0530
Message-ID: <20241205064037.1960323-1-quic_mmanikan@quicinc.com>
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
X-Proofpoint-GUID: pCPFusxrgdlg6OfiMAQ3zwOYpnHbXLTc
X-Proofpoint-ORIG-GUID: pCPFusxrgdlg6OfiMAQ3zwOYpnHbXLTc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 bulkscore=0
 mlxscore=0 mlxlogscore=759 lowpriorityscore=0 clxscore=1015 malwarescore=0
 priorityscore=1501 spamscore=0 adultscore=0 suspectscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2412050049

Since gcc_apss_dbg_clk has no consumers, the linux kernel will turn it
off. This causes a kernel crash because this clock is access protected
by trust zone. Therefore remove this clock from the gcc driver and dt
bindings.

Manikanta Mylavarapu (2):
  dt-bindings: clock: qcom: gcc-ipq5424: remove apss_dbg clock macro
  clk: qcom: ipq5424: remove apss_dbg clock

 drivers/clk/qcom/gcc-ipq5424.c               | 19 -------------------
 include/dt-bindings/clock/qcom,ipq5424-gcc.h |  1 -
 2 files changed, 20 deletions(-)

-- 
2.34.1


