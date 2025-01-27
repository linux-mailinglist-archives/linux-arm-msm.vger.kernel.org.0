Return-Path: <linux-arm-msm+bounces-46176-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7731BA1D05B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Jan 2025 05:43:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D34AE164A94
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Jan 2025 04:43:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4038215ADB4;
	Mon, 27 Jan 2025 04:42:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="MMkINjnW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A0E1647;
	Mon, 27 Jan 2025 04:42:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737952979; cv=none; b=OyvfByte6Tpt5dMC08Wm3v3c3aR89GLjOrBktNrYLb9CJdAw9q3XetYjWLRtCQQ+69/taGPA96b4zmzwY59SIFtFxgvdPNU/HrItxOeyVzgqfByDKDS5bZr8bmgxMBmuVg9IxUVG5MMWhKYJ9atiwTaAk6RcE6mucn1Ztfsh07E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737952979; c=relaxed/simple;
	bh=ENAcb3aqmUuQ5hGIDmOhsqg1rt4V0Id/mDW3iaAOoqg=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=nImTTXrnRYn77oE7S7J+pcRJnN3dpNoFcFVOk2z75SIf4wKlpA7oU7RsrLIqHeNAHbOEqFw/Vg4ujj3ofltt2ZtJknii0ZTzV9s36DG2/9XBbMo9TdiDbppJT1ToEDk9yf7AkSnmH52POuaWlthwxKx8sN0Bi4tfOSZCWPNSjB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=MMkINjnW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50R1EjcH001366;
	Mon, 27 Jan 2025 04:42:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=t2gBuju/TY6AJqZaCtjnzX
	5EMHWU0cWxNqn2ncSmzeQ=; b=MMkINjnWJcRKfTfATFPTA0JCy3ehp2YFu4vhi7
	b+AAYNzwil9I8GnOvYiODq9/q+nM9fAt02BOZJjgx8Dj9dXEaBtxrwNTb9qa+eWA
	cTMbDr7GTlFvG2EukWyWlEPlvlSkZ/nrp3e81V/3aGZGljBvD0euvpp6i+5i0YBz
	W5ARMxJXWo8PkLh+/a9TIh9AiLd33br7AhUTuwhFBQ1jftdgEfG4nAZCl2IFrEZg
	cAWdqCpetvR2osw4I+go+iZg9xkQx6DFHdOhlVBI31dlrUwndD5U0JHfndugIu93
	2pMjdC/oKxl5HP3Lr86hLOOrHL1A+0zXeCj/DHCsbe0jH0FA==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44cs3ejrmb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 27 Jan 2025 04:42:50 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50R4go6Q002979
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 27 Jan 2025 04:42:50 GMT
Received: from hu-ekangupt-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Sun, 26 Jan 2025 20:42:47 -0800
From: Ekansh Gupta <quic_ekangupt@quicinc.com>
To: <srinivas.kandagatla@linaro.org>, <linux-arm-msm@vger.kernel.org>
CC: <gregkh@linuxfoundation.org>, <quic_bkumar@quicinc.com>,
        <linux-kernel@vger.kernel.org>, <quic_chennak@quicinc.com>,
        <dri-devel@lists.freedesktop.org>, <arnd@arndb.de>
Subject: [PATCH v2 0/5] misc: fastrpc: Add invokeV2 to support new features
Date: Mon, 27 Jan 2025 10:12:34 +0530
Message-ID: <20250127044239.578540-1-quic_ekangupt@quicinc.com>
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
X-Proofpoint-ORIG-GUID: ZNYQ3tQziwyCIqPsvcyWppg0TjVcLZlQ
X-Proofpoint-GUID: ZNYQ3tQziwyCIqPsvcyWppg0TjVcLZlQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-27_01,2025-01-27_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 suspectscore=0 adultscore=0 phishscore=0 bulkscore=0
 clxscore=1015 mlxscore=0 mlxlogscore=999 lowpriorityscore=0
 impostorscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2411120000 definitions=main-2501270036

This patch series adds the listed features that have been missing
in upstream fastRPC driver.

- Add changes to support new enhanced invocation ioctl request.
- Add support for CRC check.
- Add polling mode support.

Userspace change: https://github.com/quic/fastrpc/pull/134
Patch [v1]: https://lore.kernel.org/all/20241007084518.3649876-1-quic_ekangupt@quicinc.com/

Changes in v2:
  - Moved context specific pointers under invoke_ctx structure to avoid
    code duplicacy.
  - Separated userspace and kernel data structures.
  - Changed design to address existing problems.
  - Added checks for reserved bits.
  - Dropped performance counter changes for now. I will rework and
    rework and submit it separately.

Ekansh Gupta (5):
  misc: fastrpc: Move fdlist to invoke context structure
  misc: fastrpc: Introduce context params structure
  misc: fastrpc: Add CRC support using invokeV2 request
  misc: fastrpc: Add polling mode support for fastRPC driver
  misc: fastrpc: Modify context id mask to support polling mode

 drivers/misc/fastrpc.c      | 348 ++++++++++++++++++++++++++++++------
 include/uapi/misc/fastrpc.h |   8 +
 2 files changed, 302 insertions(+), 54 deletions(-)

-- 
2.34.1


