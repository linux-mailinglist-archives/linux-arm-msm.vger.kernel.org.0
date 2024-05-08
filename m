Return-Path: <linux-arm-msm+bounces-19460-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 222798BF5A2
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 May 2024 07:43:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D270928573A
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 May 2024 05:43:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E864D17BCA;
	Wed,  8 May 2024 05:43:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="hurqW07R"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15B9222324;
	Wed,  8 May 2024 05:43:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715146986; cv=none; b=QFpX0goh1jM7kCXtSCGg3Or/fzWssUutefubldq4WrNi6RG4aZb+Q+skMQDxkOVHtziYjR6pQozVSc0zGBgd+CheZ0si3w95E4mjM8+Tyf+/p0zhGzmxS7f5NldRK5ZlS2jI8FtUIXht3PJ+/Nd4zRdMbR02jSj67YQI/oM0W+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715146986; c=relaxed/simple;
	bh=9i+NqIGo7kzjRxvqTqjq200CuyPCEflocMqbaDuREtg=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=aTodPcZv0UhfWPkqC+rHIQbHwnGYUFe5r6wArv6wHvJMio2qCWaBOWqOFuTusAbrB1kQu/Sp1G8mzA01BaK4TESLBIY1+ph49kEbkXsdLpGfODMrvPRG2a/KOwTB4v7mAr74EbI0Ulwgs/iskpgZ3gTBNq4uvYF/Sip5Y1WnMb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=hurqW07R; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4484ftXO016309;
	Wed, 8 May 2024 05:43:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=qcppdkim1; bh=Y0o0ERh
	4r6DVUsthnNfeeX5HJMGS2kcD4LBvFXz5Oi8=; b=hurqW07RbiMJX/OjRD6y3wg
	KYw/HiJ7cqLSzLBOmyNsBZcj1DuR7Wo0V8XaxfK3IsVy7jMbeY6n9TjkbRbXMbPE
	2YMZhw092k/xpxWZGD6gS/Bwj2KZXw1EtkRqaNbbSJ7cXdOasa/99DH1SszdbmfA
	Y+I1kHqJPNam2C75k7sLC2QSXQGYDYhPtgh1DEtI5i2QL14Q/QMPxUezsDhWzmWX
	rC1I/HdXqijfil5mtQvSYIWuFQol1qs3H/MnSfffJLQIWuVWyA2GeEnD8Eyxv5ts
	Ap/84J30bZnYY24Fz4n9I+fWv2cMmjA31BEPFOAMQYR3/8zHB2p5jft7MGkJ4Ng=
	=
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xyspr10yx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 08 May 2024 05:43:02 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 4485h0J9012567
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 8 May 2024 05:43:00 GMT
Received: from hu-ekangupt-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 7 May 2024 22:42:58 -0700
From: Ekansh Gupta <quic_ekangupt@quicinc.com>
To: <srinivas.kandagatla@linaro.org>, <linux-arm-msm@vger.kernel.org>
CC: <gregkh@linuxfoundation.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v1 0/5] Add missing features to FastRPC driver
Date: Wed, 8 May 2024 11:12:43 +0530
Message-ID: <20240508054250.2922-1-quic_ekangupt@quicinc.com>
X-Mailer: git-send-email 2.43.2
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
X-Proofpoint-ORIG-GUID: _Ehy7-ixZ4dNqwjw_iXm5JH488-CcRGx
X-Proofpoint-GUID: _Ehy7-ixZ4dNqwjw_iXm5JH488-CcRGx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-08_02,2024-05-06_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 spamscore=0 clxscore=1011 malwarescore=0 suspectscore=0 priorityscore=1501
 mlxscore=0 impostorscore=0 mlxlogscore=547 bulkscore=0 adultscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405010000 definitions=main-2405080040

This patch series adds the listed features that have been missing
in upstream fastRPC driver.

- Redesign and improve remote heap management.
- Add static PD restart support for audio and sensors PD using
  PDR framework.
- Add change to support unsigned PD. Unsigned PD can be enabled
  using userspace API:
  https://git.codelinaro.org/linaro/qcomlt/fastrpc/-/blob/master/src/fastrpc_apps_user.c?ref_type=heads#L1173
- Add check for untrusted applications and allow trusted processed to
  offload to system unsigned PD.

Ekansh Gupta (5):
  misc: fastrpc: Redesign remote heap management
  misc: fastrpc: Add support for unsigned PD
  misc: fastrpc: Restrict untrusted apk to spawn
  misc: fastrpc: Add system unsigned PD support
  misc: fastrpc: Add static PD restart support

 drivers/misc/Kconfig        |   1 +
 drivers/misc/fastrpc.c      | 631 +++++++++++++++++++++++++++++-------
 include/uapi/misc/fastrpc.h |   2 +
 3 files changed, 514 insertions(+), 120 deletions(-)

-- 
2.43.0


