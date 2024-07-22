Return-Path: <linux-arm-msm+bounces-26718-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F2199938AA4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jul 2024 10:02:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2E1441C211AD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jul 2024 08:02:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 450B42BD19;
	Mon, 22 Jul 2024 08:02:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="KcWruL/n"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90FB518E1F;
	Mon, 22 Jul 2024 08:02:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721635343; cv=none; b=boMZjnc8+SqE1qOXZgpIhvaM6nnk+l7WyWDTxt6fi9zcfmE6yzgtk1JNINpPZ+dxDCfCd9MkSee94uiVLPqO9+Vfgldqwe1N5AvjCLe9X5hvuY4JtT+EGCQ+P+nA0crBJR/JG0UgtCrppSqVrFIBwL3BxmL7B+N+9Pmarq9cZPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721635343; c=relaxed/simple;
	bh=hLXUeaB36i3pNA0pGyyc565WFf3Y9mscaVcCB4oLuQc=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=DbA84xB4ZrbRR6QZ5Gqy76XJGiB3TYPbHEpO+43TxQH1RDgukgcjLX6ufjx8BbBM19zIQkJnchjcOs+wGUBEsbdt8S/d1/zhaFE/aNRydWDB6OUIVXXX+Ojc1KAKuMQSQdntvbwNiI8LmNolp54dgNbHmHKo4vFn0XHF+mDl0As=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=KcWruL/n; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46LN8Vt9010739;
	Mon, 22 Jul 2024 08:02:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=2eyP4sRbVVroVRA32CWP7I
	LpEu/jQmEIcmRb8dnHgM8=; b=KcWruL/niVgKvFFmudCBYfv1M3Hncm4c1bF1NI
	y8BDYqoKeRwBBe1EIfNokOpREDSVhVG88ZLx215xyz5ET42GwERfyfdEMt65U21x
	CmDRSh6spdT+aKGZEwMTlm3sYNb63/G3tF7/weVDTJw171wwW0HuqBjQ2oHjZItZ
	mL+KaoEfROkpyT+fAvOs1SrHWULCg96izc7nSYj9Lort7OWXv1cHy6Md17alCu9F
	uEy9hgcbf7LThFCeI1CWSG109L5BSBMbCEw3BoGHBvxBbMBK6y7UTtetP8Pl9mJG
	53ofGdSl/UzQFmD3AhOd5DqeLzvqYOzWkRvogqH3+QoGOOFQ==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40g4jgu14y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 22 Jul 2024 08:02:13 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 46M82CIm008389
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 22 Jul 2024 08:02:12 GMT
Received: from hu-ekangupt-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 22 Jul 2024 01:02:09 -0700
From: Ekansh Gupta <quic_ekangupt@quicinc.com>
To: <srinivas.kandagatla@linaro.org>, <linux-arm-msm@vger.kernel.org>
CC: <gregkh@linuxfoundation.org>, <quic_bkumar@quicinc.com>,
        <linux-kernel@vger.kernel.org>, <quic_chennak@quicinc.com>,
        <dri-devel@lists.freedesktop.org>, <arnd@arndb.de>
Subject: [PATCH v6 0/2] Fix user PD inimem requirements
Date: Mon, 22 Jul 2024 13:31:58 +0530
Message-ID: <20240722080200.3530850-1-quic_ekangupt@quicinc.com>
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
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: VNNRwTWudnOiOoGXLteWK6nNioWaXMP_
X-Proofpoint-GUID: VNNRwTWudnOiOoGXLteWK6nNioWaXMP_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-22_04,2024-07-18_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 adultscore=0
 malwarescore=0 impostorscore=0 mlxscore=0 lowpriorityscore=0
 priorityscore=1501 phishscore=0 spamscore=0 bulkscore=0 mlxlogscore=603
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2407220061

This patch series fixes the incorrect initmem size assumptions for
signed and unsigned user PD.
Previous single patch[v4]: https://lore.kernel.org/all/20240719085708.1764952-1-quic_ekangupt@quicinc.com/

Changes in v2:
  - Modified commit text.
  - Removed size check instead of updating max file size.
Changes in v3:
  - Added bound check again with a higher max size definition.
  - Modified commit text accordingly.
Changes in v4:
  - Defined new initmem specific MACROs.
  - Adding extra memory for unsigned PD.
  - Added comment suggesting the reason for this change.
  - Modified commit text.
Changes in v5:
  - Splitted the change into separate patches.
Changes in v6:
  - Changed Unsigned extra length macro name.
  - Add comment in proper format.

Ekansh Gupta (2):
  misc: fastrpc: Define a new initmem size for user PD
  misc: fastrpc: Increase unsigned PD initmem size

 drivers/misc/fastrpc.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

-- 
2.34.1


