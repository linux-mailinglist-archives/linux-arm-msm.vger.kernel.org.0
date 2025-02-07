Return-Path: <linux-arm-msm+bounces-47081-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 08AB9A2BC54
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Feb 2025 08:36:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1957A188A443
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Feb 2025 07:36:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5E6B1A2846;
	Fri,  7 Feb 2025 07:36:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="CbOKN8rP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AE631A2544;
	Fri,  7 Feb 2025 07:36:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738913769; cv=none; b=QK+QbJV5kPx+dQUQ++sS/dlzpyfOVCLAkNj9NDoND5enVp43/1MLpKZC5ZxTQIZzU5awixWRCBWKLZv+xU1CAuCa7F2g3auyfiTs9vobXmyAJT8OHhIdavtckqdLjK5jB1NZoMrmaaGQQDAMOXgzFgWrgWUDb85JqSAViw2MymU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738913769; c=relaxed/simple;
	bh=lRRvLjOjWz7k/Hrges3g7wd4SV2ewKBhzV0A11CrK+4=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=fNPy0hHwqjsBJvic0WYkJroGYtkwlkB1PVSaDrPZZNlFJlpoHbBGuH6DDibNltDo9EAj/VKFOXKtsjknk/sGx0vrJ/mrgTIKmgfgUNV4CpDgEbbDZsGT2fnV2vx7kAGN2Ox0eYS6R3ZQgbppbj5BiePyYDOLQppAIsgG10KmfVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=CbOKN8rP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5174KrI7008031;
	Fri, 7 Feb 2025 07:36:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=TElmkLpAeSRtWN2JQWnKor
	ZVjXpepyP+ED8zX2uO+wA=; b=CbOKN8rPswP1K97isQdRyhHtN/QjZA8fbdBX52
	hLAW9EQ51qHmb4+yTCS9DVW3/EgjuF2Gza9cfhx7prmQa90QldjbDHZRsfMqhNUr
	OpUumF8AAGXYoEfTThXMcfwafZKAHDdDoXP2/zXw+Q2D2NPT66V/QrZUacHuXIz8
	U4CUmnALXpt4mWMYnVmslnjW7SGJFlwJy6fQAVi2YiGJcG5o+mSlQIsqwzeQoT41
	Ci+u1EuAPpFhu8pM7ir+jlH0FcsMGHWdm415ilzvc5k1aEj6yadEageZFmpmSpL2
	8Od0tcIHd3VxkEvgBiIMqQQ/xT2mxyLh8MntgZ8JMyaMNibA==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44nb2m8eak-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 07 Feb 2025 07:36:04 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5177a3P4026898
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 7 Feb 2025 07:36:03 GMT
Received: from hu-varada-blr.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 6 Feb 2025 23:36:00 -0800
From: Varadarajan Narayanan <quic_varada@quicinc.com>
To: <andersson@kernel.org>, <konradybcio@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <dmitry.baryshkov@linaro.org>, <quic_varada@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 0/1] Fix USB vdd info for IPQ9574
Date: Fri, 7 Feb 2025 13:05:44 +0530
Message-ID: <20250207073545.1768990-1-quic_varada@quicinc.com>
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
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 5lz9yiNqETeXupsAH0LNfOxJ0JSKv0dU
X-Proofpoint-ORIG-GUID: 5lz9yiNqETeXupsAH0LNfOxJ0JSKv0dU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-07_03,2025-02-07_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=618
 suspectscore=0 bulkscore=0 phishscore=0 malwarescore=0 mlxscore=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 clxscore=1015 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2501170000 definitions=main-2502070057

Use correct regulator for USB phy.

v2: * Skip the first patch as it has been pulled in
    * Reword and fix commit message formatting for the remaining patch

v1: For some reason, the dt-bindings [1] patch posted and Acked long
    time back seems to have slipped through the cracks and hasn't been
    merged. Including it along with this patch as both are related.
    dt_binding_check & dtbs_check passed.

    1 - https://lore.kernel.org/linux-arm-msm/170266996013.286103.17303148912355511017.robh@kernel.org/

Varadarajan Narayanan (1):
  arm64: dts: qcom: ipq9574: Fix USB vdd info

 arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)


base-commit: 40b8e93e17bff4a4e0cc129e04f9fdf5daa5397e
prerequisite-patch-id: d3da55704446c2222b5c624d9bb3a738357cb2fc
-- 
2.34.1


