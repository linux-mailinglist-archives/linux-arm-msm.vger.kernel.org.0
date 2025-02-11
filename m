Return-Path: <linux-arm-msm+bounces-47520-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B07ACA30571
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Feb 2025 09:14:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 54B86161D26
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Feb 2025 08:14:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 727E61EEA48;
	Tue, 11 Feb 2025 08:14:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="AG0RVByE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A62B61EE7D9;
	Tue, 11 Feb 2025 08:14:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739261680; cv=none; b=L2CChBB8ko8vEp244jHUht0baQgj1iAlYKEw8nVHqp7wxkh/NlJHAlrRbEyYoD3iJfROvbHpwX1o0zsS+BgugiIyPIpxjalwAClWnO3OJwgDd00TIqscfKWRT9XpmP3+GD97WvWC2R7FvUmQ5nUAkNS8aQG+mHzCxEnrsd79pt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739261680; c=relaxed/simple;
	bh=62W3mbpetrA1Zocgyi1pXrvbLI2Fhhpcf7t8kTpG1Ik=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=LCgAHQDLouakBWTn0V9r7pGs0dMk7XlJIWfo838vJ9nWh874uTKj+7gwDE3/vLkZ0VOTNDkdGZjfRmSUSqFc4KHgGU77aB0josBSSKIwrosH/4eUBG10ZhtSYdCpjsEINVMJaa4lvySJHog5AE80O2rqAq+zF2cAEBaEuc/xe94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=AG0RVByE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51AJwABS008318;
	Tue, 11 Feb 2025 08:14:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=3qoC9Qq7X2Pkf9J8dCvnL+
	IeYhDMYBmfHX7H7/sbBGE=; b=AG0RVByEKVUV1b7aNecb0UP5vb/9fFms3LZV7f
	doZijUFTB1jQ7l6yEpIhCXwdfLVx6s/RC3D4rAj3bK4ER5QspsGU2AJRf+KgSKtB
	da+VPAu9joU5hQ/qmh8yc1X8xtQ1mZh3PtECwSW8PIndg+DdHwa1NCjlcKTGSue8
	SojgFgRzOeuDMtjxshB4Uf72hxwWaN8LJvMVzupKqzNV0LFaqXhlvsAjRMQwCj8S
	aUgea3qYhgsHHFg55ZIMTRujR0Wb0ZM2+0nT4tRt1iWIUYPkVp0dMnt49IuWul/D
	xwqPoImrIAINivlANcKLLLqosFHuFlBuBK9Sw3Z3GpdIPj8Q==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44qewh3889-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Feb 2025 08:14:35 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51B8EZZh020259
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Feb 2025 08:14:35 GMT
Received: from hu-lxu5-sha.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 11 Feb 2025 00:14:29 -0800
From: Ling Xu <quic_lxu5@quicinc.com>
To: <andersson@kernel.org>, <konradybcio@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <quic_kuiw@quicinc.com>, <quic_ekangupt@quicinc.com>,
        <quic_kartsana@quicinc.com>, <kernel@quicinc.com>,
        <quic_lxu5@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 0/2] arm64: dts: qcom: sa8775p: modify compute-cb nodes
Date: Tue, 11 Feb 2025 13:44:13 +0530
Message-ID: <cover.1739260973.git.quic_lxu5@quicinc.com>
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
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 3qTjF944cju5Ww47RtS9PiSRmeMev-iX
X-Proofpoint-GUID: 3qTjF944cju5Ww47RtS9PiSRmeMev-iX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-11_03,2025-02-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 spamscore=0
 impostorscore=0 mlxlogscore=365 phishscore=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502110049

This patch series remove extra entries from the iommus property and
remove cdsp compute-cb@10.
Patch [v2]: https://lore.kernel.org/all/cover.1737615222.git.quic_lxu5@quicinc.com/

Changes in v3:
  - Update some commit messages.
Changes in v2:
  - Update some commit messages.

Ling Xu (2):
  arm64: dts: qcom: sa8775p: Remove extra entries from the iommus
    property
  arm64: dts: qcom: sa8775p: Remove cdsp compute-cb@10

 arch/arm64/boot/dts/qcom/sa8775p.dtsi | 246 +++-----------------------
 1 file changed, 23 insertions(+), 223 deletions(-)

-- 
2.34.1


