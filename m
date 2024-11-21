Return-Path: <linux-arm-msm+bounces-38630-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A6209D4927
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Nov 2024 09:47:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4F25F282B21
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Nov 2024 08:47:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB3D713BC3F;
	Thu, 21 Nov 2024 08:47:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="MdTE5Fe7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0534E230983;
	Thu, 21 Nov 2024 08:47:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732178853; cv=none; b=gQWetefA1ePlnhbtgVOEe/BIWhflpr11t172mVFh7o4DysJFc+ZHzq3C/8OxvQHPb+IYhbozXEroQg5jN0Ff8LTPEwNTpmQLG+r8g4zXZqr86dj30+NA19rXrsFZPz7+Nh3cVFxCkqn9hwAzzWh04yhN4AKE65nsEik9GjaVF4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732178853; c=relaxed/simple;
	bh=P+DEEWV7wpcPXcZOQIRy/GDTFJ+9SPJ+Awof+SdrZ0c=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ELYNV5Hql5JzAc+toTRVOWccpeOVlQdIhuDzuQkN3cVUbNU+vh1aFf2pdV6UE1pDPs6G3NSZIC5IyLuas7TOKp91A6mlFlgPMGS3FjPFtTsLcIexyF/rDRaLQ683WJ3Vr8W8jZQBxoTWx9RqRgbbVKf5RibWWZMFE8XhB4q/m+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=MdTE5Fe7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AKK0D42007592;
	Thu, 21 Nov 2024 08:47:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=cVw8DRemM26GgC3mNCihCe
	sQFkVPhAJEylz8ayd0rNM=; b=MdTE5Fe7sreMKvagh2Ci4bVFGqDSwbm8rhEr3S
	xDw9DaaTU9ihPTFZw7SlRRjMhuzTUdBoIKj5qyWOKKyJ1SrFodaXqSjZH4Hq8ynT
	woGIpSAlz2vx4yHxREtc6/jQbXPPDOFwGGqkVySlvtw4a+LVNmyheTy1ObeDfMpC
	lorcHRmgYo75LpqU2hF6ZeGZxdVbAe/q1RC3BCfj5X50+0WuESfGij4I63OUkA8y
	USZb3ZBTpBZE+LjXT9269WeD9XaKjw6fatTpxqKzzWpelrs7aCWSsVgAYiPHY/Bw
	V0OCU2s1saqVS8ZFd6ODCnDqu8FfzVSm+HAr9QYp8bGIaEaQ==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4318uvkvfk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Nov 2024 08:47:27 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AL8lQr4012489
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Nov 2024 08:47:26 GMT
Received: from hu-ekangupt-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 21 Nov 2024 00:47:22 -0800
From: Ekansh Gupta <quic_ekangupt@quicinc.com>
To: <srinivas.kandagatla@linaro.org>, <linux-arm-msm@vger.kernel.org>
CC: <gregkh@linuxfoundation.org>, <quic_bkumar@quicinc.com>,
        <linux-kernel@vger.kernel.org>, <quic_chennak@quicinc.com>,
        <dri-devel@lists.freedesktop.org>, <arnd@arndb.de>
Subject: [PATCH v4 0/2] Add changes to use session index as identifier
Date: Thu, 21 Nov 2024 14:17:11 +0530
Message-ID: <20241121084713.2599904-1-quic_ekangupt@quicinc.com>
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
X-Proofpoint-ORIG-GUID: whCOzTTYfGcXfB7MstqubXanpEbhyQ-F
X-Proofpoint-GUID: whCOzTTYfGcXfB7MstqubXanpEbhyQ-F
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 bulkscore=0
 priorityscore=1501 phishscore=0 adultscore=0 malwarescore=0 mlxscore=0
 lowpriorityscore=0 mlxlogscore=801 spamscore=0 suspectscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411210068

This patch series carries changes to use a masked session index
as an identifier instead of process tgid to support mutiple PDs
from same process.
Previous single patch[v3]: https://lore.kernel.org/all/20240808104228.839629-1-quic_ekangupt@quicinc.com/

Changes in v2:
  - Reformatted commit text.
  - Moved from ida to idr.
  - Changed dsp_pgid data type.
  - Resolved memory leak.
Changes in v3:
  - Modified commit text.
  - Removed idr implementation.
  - Using session index for client id.
Changes in v4:
  - Use GENMASK for client ID mask
  - Add a new patch to rename tid and pgid as client ID.

Ekansh Gupta (2):
  misc: fastrpc: Add support for multiple PD from one process
  misc: fastrpc: Rename tgid and pid to client_id

 drivers/misc/fastrpc.c | 58 ++++++++++++++++++++++--------------------
 1 file changed, 30 insertions(+), 28 deletions(-)

-- 
2.34.1


