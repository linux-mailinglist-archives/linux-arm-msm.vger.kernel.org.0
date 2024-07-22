Return-Path: <linux-arm-msm+bounces-26683-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id BC48C93887F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jul 2024 07:55:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 40155B20BF7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jul 2024 05:55:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85D87175AB;
	Mon, 22 Jul 2024 05:54:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="EOkVp5V5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C196C16426;
	Mon, 22 Jul 2024 05:54:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721627698; cv=none; b=Gb8dqkakgCvcIAC8IWZgnmgS6MTEzm3lbQyG8/KFkn+F8oAg17q30KsYg5a0x4Wcoyg7+1GJvCkuS83TEEkr59/ZBIwh8ERHKcZ7NwnzVPxwvt1FPE7nNMZUneu0ir1CS+MTfm7TV3GQcQGm2ThSzMK7PrUYiETWxqZVghs93xA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721627698; c=relaxed/simple;
	bh=zklqt9s0L9pVMavS8vu6VFaY6MxUmKbwhdHetxTIrsA=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Xyk0UtlKOEJjXUoqMksYyvbD9bckm1do6YIRTpiuSR2RapPcV2spmar9BI+EiffGdsI5Tm9Gg+q0Hj7yIBQYR+4+se3hHQvh8jwwTYpuoxBb94p5WQ8im6QAbCu7k/S6E1pbo54hDVfbMMQM82baTBRHdvK3lAtbj9XszSWJC8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=EOkVp5V5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46LNDIi6018291;
	Mon, 22 Jul 2024 05:54:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=9JA2voW1vc4ikn9EpySFYR
	vlEEWaKjS61TLnTd9jyEg=; b=EOkVp5V537BK//0UzmpCA89b7+2+XlCuLfSWR3
	JDo3Yas9LXeUJbcu3CXigtFHjj5okI+cvMTqJ0OL6E6W8ch91n/qT2061v1CRtHp
	xDQpYxtxX6a9Kwtq1acuxypS2mO2p8eQqbeaoCC0mB2eEqfjEtcxloDvyZa5c1Lw
	pHZsaP6PZwBJUOB40Zn8IZZyDAUw36vOg5E1g+RSh50JODwvUHPbJUXHOaG8RHlS
	YfWLNHOV4KQ/91g1B+Fr8Ju3kXpvDfaZ2YsuQUX6K+oZKzSV3nMx7BSBXuMPVCmr
	jto9Y9Nk4YOEH/0mrwoSrGIAy3lMDi/QllefRbWKJf6AdtWA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40g2xeavfc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 22 Jul 2024 05:54:49 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 46M5snT7030337
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 22 Jul 2024 05:54:49 GMT
Received: from hu-ekangupt-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Sun, 21 Jul 2024 22:54:46 -0700
From: Ekansh Gupta <quic_ekangupt@quicinc.com>
To: <srinivas.kandagatla@linaro.org>, <linux-arm-msm@vger.kernel.org>
CC: <gregkh@linuxfoundation.org>, <quic_bkumar@quicinc.com>,
        <linux-kernel@vger.kernel.org>, <quic_chennak@quicinc.com>,
        <dri-devel@lists.freedesktop.org>, <arnd@arndb.de>
Subject: [PATCH v5 0/2] Fix user PD inimem requirements
Date: Mon, 22 Jul 2024 11:24:35 +0530
Message-ID: <20240722055437.3467900-1-quic_ekangupt@quicinc.com>
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
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Mhrre0FD3ZY_5XTKs1k2Ry-5Qg5mxv8O
X-Proofpoint-ORIG-GUID: Mhrre0FD3ZY_5XTKs1k2Ry-5Qg5mxv8O
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-22_02,2024-07-18_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 spamscore=0
 lowpriorityscore=0 bulkscore=0 mlxlogscore=653 mlxscore=0 adultscore=0
 phishscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2407220044

This patch series fixes the incorrect initmem size assumptions for
signed and unsigned user PD.
Previous patch: https://lore.kernel.org/all/20240719085708.1764952-1-quic_ekangupt@quicinc.com/

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

Ekansh Gupta (2):
  misc: fastrpc: Define a new initmem size for user PD
  misc: fastrpc: Increase unsigned PD initmem size

 drivers/misc/fastrpc.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

-- 
2.34.1


