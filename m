Return-Path: <linux-arm-msm+bounces-31441-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C07629747B8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Sep 2024 03:23:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 78A301F26ADE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Sep 2024 01:23:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B68418C0C;
	Wed, 11 Sep 2024 01:23:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="dWeyKDWx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0DF322066;
	Wed, 11 Sep 2024 01:23:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726017803; cv=none; b=KLpqeXwix6IKdi+H5s4fIp5z4NB5vxQzxtZssmkK8y2U3DB9TCXzLTJ0UOcwiGGjI7lstSUnwksz2JtaziyFSxsrkTad9KgklMWIY/axpOpeKkZmmfodOHiUGy73MTcx1CApXA7LnmL6qOIvzMxG8CHJdPFtXNM9cQpCTG6a6rU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726017803; c=relaxed/simple;
	bh=GWr1APE3OKHNDJ8KWun788EsfhIPmqbACTws0TsCJ6w=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=LsbefkR4vlJPRgzp7yoMDerzU6A0BHfuJkGRmJz5o1U2A3dnP0Z4jqsGDklZSB5GvoGeVyZyAw87i4H0Dm+7OlIxuXCubxntnqUl7KW7kfbE6y5aiaKZJj+4+OJk1CDKRKAQ1H/AYuAtQ64A/zwJno6NIHtP9JOz9wnG8nDunaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=dWeyKDWx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48AEwfEd031364;
	Wed, 11 Sep 2024 01:23:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=FBe+iw4+aUVovaCbM6zF6r
	crhWc3B9d03B5Xg5mwDBk=; b=dWeyKDWx4m7S80899UdjSXID0jIk6rNmuaD51s
	zDkr97KZCjvuuGs2AG/ESyCEIO+9zZ+Rk0AMhunovvr1v3m8j3aywriVuTlLpgZ9
	5eSbjZi32DWSIulxMhDhpYKS7JuxXm+m63MzuYF6f2ZU7CE3tnTXMa18LIE9jQpE
	tRet0VtqlS0gB3R5CajmN7/8jofxRgnnfrCb8hfpgsHm6KxmepNcJ8FnyBUdr9E7
	YPlzAcWXUHqSPs+FAXgnI5wcvw5Ca1MpBO+S6El14aaaK6fAoAPz/2NQPP+i4pM5
	pr8JPEq0DRedxXuR/2ebjfu5sj0Gan4qOJJ0GxasgCe71ZwQ==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41gy517s2a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Sep 2024 01:23:17 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48B1NGkw012848
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Sep 2024 01:23:16 GMT
Received: from jiegan-gv.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 10 Sep 2024 18:23:12 -0700
From: Jie Gan <quic_jiegan@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Tingwei Zhang <quic_tingweiz@quicinc.com>,
        Jinlong Mao <quic_jinlmao@quicinc.com>,
        Tao Zhang <quic_taozha@quicinc.com>,
        Yuanfang Zhang <quic_yuanfang@quicinc.com>,
        Song Chai
	<quic_songchai@quicinc.com>,
        Yushan Li <quic_yushli@quicinc.com>
Subject: [PATCH v4 0/1] arm64: dts: qcom: Add coresight components for x1e80100
Date: Wed, 11 Sep 2024 09:22:53 +0800
Message-ID: <20240911012254.2198067-1-quic_jiegan@quicinc.com>
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
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: ztFUuv6KZJQxhynGH061Ov0nQHSyN3uZ
X-Proofpoint-GUID: ztFUuv6KZJQxhynGH061Ov0nQHSyN3uZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 impostorscore=0
 mlxscore=0 bulkscore=0 mlxlogscore=579 priorityscore=1501
 lowpriorityscore=0 malwarescore=0 clxscore=1015 phishscore=0
 suspectscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2408220000 definitions=main-2409110009

Add coresight components for x1e80100. This change includes CTI,
dummy sink, dynamic Funnel, Replicator, STM, TPDM, TPDA and TMC ETF.

Change in V2:
Check the dtb with dtbs_check W=1, and fix the warnings for
the change.

https://lore.kernel.org/linux-arm-msm/20240827072724.2585859-1-quic_jiegan@quicinc.com/

Change in V3:
Disable two TPDM devices, that will break the booting of the secure device.
Tested with commercial product.

https://lore.kernel.org/linux-arm-msm/20240905103825.2154633-1-quic_jiegan@quicinc.com/

Changes in V4:
1. Sort the properties with alphabet order.
2. Fix format issue(add a new line between last property and the
following subnode).

Jie Gan (1):
  arm64: dts: qcom: Add coresight nodes for x1e80100

 arch/arm64/boot/dts/qcom/x1e80100.dtsi | 1456 ++++++++++++++++++++++++
 1 file changed, 1456 insertions(+)

-- 
2.34.1


