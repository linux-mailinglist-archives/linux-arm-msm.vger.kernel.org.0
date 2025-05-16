Return-Path: <linux-arm-msm+bounces-58198-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BF035AB9ABA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 May 2025 13:01:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 222D43A5589
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 May 2025 11:00:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43693231A55;
	Fri, 16 May 2025 11:00:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="EQ3D4XMp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 992622356C9;
	Fri, 16 May 2025 11:00:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747393252; cv=none; b=lFUIS4AvaHPtxHnDkxENJsQAIplf5fDGg1fKto0HZOBEo6xS3nkFm0X/lWc9rVzmiuvhwy7l9SUWBBDa5kS6B2mh1WkHf2iycvjs1PHX5jkp9cWYGF9X3tXjQ4QyrngCAc7UHIHN+GDAmRCdGm3St5D8opYfs03rLr9vR1TsCfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747393252; c=relaxed/simple;
	bh=5WBb6FvHxcBYQj5SA/ASw0oVTZcMi1QG88s7SA647j0=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ZmPk+gfacLpbYwB4lg78WkPXlk910VuKziKR0re06dSWVkMN8T1GsTpOxuehfUglCobeIFIpBk4UKnqllo7U8ZKriMwkwYXjZB93qdEqtB4EzsU35QqdgAMqkfFju1H2BM3+lPh7PGt9xfoh93ccU25z+PhZ+HV2yrSIQl1gVtY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=EQ3D4XMp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54G3SsPB014558;
	Fri, 16 May 2025 11:00:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=26uNGGKryLgcR9KilVRtth
	HZwkA3P6xWtbD7ty/wHMM=; b=EQ3D4XMpwB6GeNv52bG/2QFJuQc0Ww9DxT+P/f
	ZA+IbEbhjEC3QJcyrRmP9nnl9H5J70g9dLhxHPrLk6HudOOTSJzHTGMm5B1O8kGs
	duf1oKGj8RDrWbQdXLlz27AMYRjbeBRi9zWat1IQVtDKcpNHqsuJmscrmNnq1BIu
	Knf3o1VqbE8Zs5EvpyfS/TBWTNieMRFSU35aIXuESTDldaWt9o8PDrhzvMnLxuqh
	ir3MzejYWt8GSyinZiaAOAeXNRj672tn1ORwB+Qlu3yeKI9ilEjaomXbLWSOhpna
	aPqEHwFHWqdFyYIi+1O8ljvC7B3tcdKKgu35h3HpzUbO3ngg==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcphtn0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 May 2025 11:00:47 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 54GB0khC010881
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 May 2025 11:00:46 GMT
Received: from hu-lxu5-sha.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 16 May 2025 04:00:43 -0700
From: Ling Xu <quic_lxu5@quicinc.com>
To: <cros-qcom-dts-watchers@chromium.org>, <andersson@kernel.org>,
        <konradybcio@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <quic_lxu5@quicinc.com>, <ekansh.gupta@oss.qualcomm.com>
Subject: [PATCH v2 0/3] arm64: dts: qcom: sc7280: Add property for sc7280
Date: Fri, 16 May 2025 16:30:26 +0530
Message-ID: <20250516110029.1637270-1-quic_lxu5@quicinc.com>
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
X-Proofpoint-GUID: FAzZpG_Gx-c26oDsM3AYFxVwGe83j7tJ
X-Proofpoint-ORIG-GUID: FAzZpG_Gx-c26oDsM3AYFxVwGe83j7tJ
X-Authority-Analysis: v=2.4 cv=cO7gskeN c=1 sm=1 tr=0 ts=68271adf cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8
 a=TYzcpxOFXHH1V9hIGsIA:9 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE2MDEwNCBTYWx0ZWRfX8AlONAZV9Zek
 Zha/7wtVWZj4ZKl8ZVz9jCgo71sJ0Xs6VVDjJ/qpMAF7unuN3wsPf6zZ6qPQLNGuJTmkBtvza6p
 4o/6Ob3/IX7/fptaJH0DW6pzOwWRWHmivXN5z5Fg7rtHSgYavCDx8wQJAJIR1exhqrqeXIk8R+S
 //+G3VTd+FhGboRPJ2nLBo15TSSJ4W1TG2V3Y44pD/ZNANK78EMAOutESnRHkZUwbN8S4NXgCJx
 WsuUD/hRSybM8RNENklISUh3l21uKCuJdv5DBqHQaTPPAxvYDKdzkTAgFjYZiyBp3vrbOzj0cGx
 hdqAO80ry9v4oHUmRlFwNL3MCFS3nK/yVgi/agf9ffbCLGrTqiw1B2yBJDlE+BLzK+mYMqVUleW
 levmUCeLI9lRj6e9WHFk8z9Ngnhhh90I60dTdFTXvMyJVYcUTxe0afJqglKmWFsKXSKpMKdj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-16_04,2025-05-16_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=363 spamscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0
 adultscore=0 bulkscore=0 malwarescore=0 impostorscore=0 clxscore=1015
 priorityscore=1501 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505160104

This patch series add memory region, nsessions and dma-coherent property
for sc7280.
Patch [v1]:https://lore.kernel.org/linux-arm-msm/20250514052323.3881600-1-quic_lxu5@quicinc.com/

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


