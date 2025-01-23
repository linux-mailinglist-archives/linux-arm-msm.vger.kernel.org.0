Return-Path: <linux-arm-msm+bounces-45917-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 398ABA1A0BB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Jan 2025 10:20:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 096543AB9BF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Jan 2025 09:20:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4871820B7E8;
	Thu, 23 Jan 2025 09:20:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="JwglmI+d"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C06C01537D4;
	Thu, 23 Jan 2025 09:20:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737624022; cv=none; b=otHpnMDDeodNPd+0WSwSOK20LuVceh5g3SNBPaw36Q7DPfGm7OeL+EfFInymjy3zcHQpXeudLQZpkD7bwkDhuKkHyhAT3gq0Wfl1gyvHfaMueHYp1lAxeKkvLKxHT3IPy/prhaCQYg8Q1HCcIYbhLgQ8OyTeqyTI+ymn3clghdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737624022; c=relaxed/simple;
	bh=QztljzXhpxYT0b49q5gqLS4V8FpUrqaVEu1MvXNEmYo=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=l5PKsHDk5Pu6gGynISFSizo/WvqnQvMYTY13kQsCsukKwBDop5XC4nV4rxJhGSQUEpvpMxftEwSmRKcoubSmtnsMEmAGx00ON1desf4qpPOzGssMuS2DT1tgbsXazoWEou3xeihALx6op2XGHYYEOPMTvbDTk9kNJrBcCnsgBT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=JwglmI+d; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50N4rRii023105;
	Thu, 23 Jan 2025 09:20:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=7ZKzR0mJjW+WoqSxRbygKE
	WcPx8z2gKW4tUHa7fbBbw=; b=JwglmI+deCPUsd92cmqpEHr6xdAgw3w8YK1Gb2
	ulwAp83ZxKOE5+vwKRkAk0Z5C4YaxRzsrTZDNtQPpWno6f1B0tQUIQb7OCowtmE0
	zI4C24GSyJiv3hmGs0ez+bkRNBth037F8uUt5TMU3LgMRWUjHhiRaTVFkw6pjpO7
	3v1oyE9fiV696SA2qFf8D/IlBSjYA2+zTamFRko8KxWbDlphz+5LQdfwYHu+/qjY
	3ZyL3jUnWFcjzU3IrUNzZE7O4bg7OsUShN0HivHa5sjTiCblLGVCPKNFg1vRo2wF
	ECH6zAFYJoHboHo92T4E2P0BFSLtp/gXmnuiMjPCOxFGUnSQ==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44bf518jf4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 Jan 2025 09:20:17 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50N9KHTd020416
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 Jan 2025 09:20:17 GMT
Received: from hu-lxu5-sha.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 23 Jan 2025 01:20:10 -0800
From: Ling Xu <quic_lxu5@quicinc.com>
To: <andersson@kernel.org>, <konradybcio@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <quic_kuiw@quicinc.com>, <quic_ekangupt@quicinc.com>,
        <quic_kartsana@quicinc.com>, <kernel@quicinc.com>,
        <quic_lxu5@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 0/2] arm64: dts: qcom: sa8775p: modify compute-cb nodes
Date: Thu, 23 Jan 2025 14:49:26 +0530
Message-ID: <cover.1737615222.git.quic_lxu5@quicinc.com>
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
X-Proofpoint-ORIG-GUID: GS58hDQRRA_oq5-K--RX6m9XP4gTBcF3
X-Proofpoint-GUID: GS58hDQRRA_oq5-K--RX6m9XP4gTBcF3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-23_04,2025-01-22_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 clxscore=1015
 lowpriorityscore=0 bulkscore=0 phishscore=0 priorityscore=1501 spamscore=0
 impostorscore=0 suspectscore=0 mlxlogscore=368 mlxscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2501230070

This patch series remove extra entries from the iommus property and
remove cdsp compute-cb@10.
Patch [v1]: https://lore.kernel.org/all/cover.1737459414.git.quic_lxu5@quicinc.com/

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


