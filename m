Return-Path: <linux-arm-msm+bounces-58623-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C9B37ABD0DD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 May 2025 09:48:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5D7421BA1131
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 May 2025 07:48:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0AED725DAF0;
	Tue, 20 May 2025 07:48:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="JM9lkLgq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B3D01F180C;
	Tue, 20 May 2025 07:48:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747727282; cv=none; b=JxzXS1f6X1bNsdD5rDBvFGX+J2jjl1c5ygqGaKjE0FPjlXE4Sv3FIbRaK44GK6aWckslq0fCQDgDTiWPl4BpDje1B9ii8rXbVnfWQJ/t8FTWKgyKVv1Of1em3XeszVwCrj/dJqNPvfQwqLQEIjld/6aw9tnKQQ0lFlsiPLdhOYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747727282; c=relaxed/simple;
	bh=gPYV3xKys3J+Ylw6wmUX3rrZsWLslVt/Edq9dYvP1uY=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Kp1/qyJ6q2+3KH04pdyPos6vmuWyyUlM7YZxMldc9al22oKBIiERwG3VQj8Lffhge3pSMZKniqGaPRtFG5JRVHSiCvseq2BtFmAHoLhEr7TahEtFxnyQK6Pc2NreXY8T2VwnNqa5Lw2BRAZJDLD5T/tuHuliOjDAPC2RP/tLqVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=JM9lkLgq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54JLZdrt024198;
	Tue, 20 May 2025 07:47:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=vZE0BfOMnYp1HUbbhbvQj5
	Vc1IeNb9h34bBtsIplRe4=; b=JM9lkLgqgm9Joz/QDB35Lu6bA5NqY4QNUu1rgG
	BO7UWjBd0HDWNkg0rFjrWx1VyQ6FjfB22656vMl3QhOR0CD5bii5bkyspzax8ZQ/
	5fywLiTOBt36ThP6Pryj6OH4qJEVFbiG6y5qTdh7KpxPXPrGF7phVkIGkjGFjssG
	+etWFKhcyyozc6Gz8vHvnJcDVju+5GUZHttzYmIAR1M/eSmBvLoN+D7tYaQCiAxL
	cMNVRNJhcQWKRHz8LMy7YZLpmpvpHf/EbDUhiSbNDYJAVXfVsNYR4WhnMKAJYkGi
	iOedfgpqai6CO30LImvQLYo+dM/vWSjGCZ50H4DSofLJYvSg==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46r29d33as-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 20 May 2025 07:47:57 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 54K7lurO003342
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 20 May 2025 07:47:56 GMT
Received: from hu-lxu5-sha.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 20 May 2025 00:47:53 -0700
From: Ling Xu <quic_lxu5@quicinc.com>
To: <cros-qcom-dts-watchers@chromium.org>, <andersson@kernel.org>,
        <konradybcio@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <quic_lxu5@quicinc.com>, <ekansh.gupta@oss.qualcomm.com>
Subject: [PATCH v3 0/3] arm64: dts: qcom: sc7280: Add property for sc7280
Date: Tue, 20 May 2025 13:17:34 +0530
Message-ID: <20250520074737.1883495-1-quic_lxu5@quicinc.com>
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
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIwMDA2MiBTYWx0ZWRfX8RioOOB5D4bY
 4yHijJQF3+KG8tKH/tzMCp1cvndA3H7iMm6LTxoYPE2Kp/lVMRqQMMshmL8nMyFVV2OyfInSlZ6
 Mykaf2+LIeUBoXrZpIhvDMPC7853Q6oHBDKhiBTB009DHL2QUi7XKFE2i+QuJOaRFye9GZs7Mj4
 v+H5G8GertX+X36q2db30fzDsBmBJCyw1BuM7qrVPcItpP/JQq7p8LeSSBnkKV+cRVgXKSTfHlR
 3bT94q8tt5DTZpY6JxnxMjwUe3vXOo/K7KD4VXO2ul885IZd001CmbmiZpOiK/maaOCsAmvs8sW
 2cc6LaQrkTRJi8OnHbCPyFm74bmXGSCqLVYGvJAbzf/ZcECM4btKBVTz6QvNXRnI9R0DlOQh6nl
 gIx88Tcm5FBuDjreibVeUnh0/4qnXD1ADuIfDSi4honMoJEbwEUqGjIT5WG6WGwp6ckEuQ0W
X-Proofpoint-GUID: KGyrU-TpsihOB4ZTRuJA_Et51t3GkjIm
X-Authority-Analysis: v=2.4 cv=KLdaDEFo c=1 sm=1 tr=0 ts=682c33ad cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8
 a=TYzcpxOFXHH1V9hIGsIA:9 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: KGyrU-TpsihOB4ZTRuJA_Et51t3GkjIm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-20_03,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 clxscore=1015 malwarescore=0 spamscore=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 mlxlogscore=384 mlxscore=0
 suspectscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505200062

This patch series add memory region, nsessions and dma-coherent property
for sc7280.
Patch [v2]:https://lore.kernel.org/linux-arm-msm/20250516110029.1637270-1-quic_lxu5@quicinc.com/

Changes in v3:
  - Modify indentation.
Changes in v2:
  - Add compatible.

Ling Xu (3):
  arm64: dts: qcom: sc7280: Add memory region for audiopd
  arm64: dts: qcom: sc7280: Add nsessions property for adsp
  arm64: dts: qcom: sc7280: Add dma-coherent property for fastrpc nodes

 arch/arm64/boot/dts/qcom/sc7280.dtsi | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

-- 
2.34.1


