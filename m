Return-Path: <linux-arm-msm+bounces-33337-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 45B98992767
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Oct 2024 10:45:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DE23A281066
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Oct 2024 08:45:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B24ED1531CB;
	Mon,  7 Oct 2024 08:45:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="SAq2J+9Y"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 471C218BB99;
	Mon,  7 Oct 2024 08:45:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728290738; cv=none; b=ERuKH4QAmaqQYnzNVLtPcuisyE6+gfs3PE9CGoNbJMNiMLPJc4x6jHE6W3LdTPUZ6iYdEgjCx3KXMtUfiJ/ATKrV//xr9ZuHuM7QJVMLU/QACYWR/56NjAGBCA/7SZSjAZI1iO7V5MH3osT4gHpQ4IstHfvRlH62MksV6E3THo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728290738; c=relaxed/simple;
	bh=YB3PektQi3JpMhyWeixuMdsCvVCdtVbVwEUUecmBKek=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=toVOkDk0tpFIEqh07LwWV29Au9mGKyo84O3+jycnYUfXBtsECT600WD5L4AnKkoDgDGsjwjjTPFutPmPOxrosjJzCVoxcadW1VoEmCFrOEPCA1WnWBNnn/mMLpHWkmN1SicV1X520daMHCUhvAXzs1ddAzlLocarwmCiZbLXCc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=SAq2J+9Y; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4974TOdP021817;
	Mon, 7 Oct 2024 08:45:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=+ZgYl8T5ptwcFitlQ0hIY6
	OM8Ievj52yKKmQtqQSxzk=; b=SAq2J+9YOeBejqaNouuqAZ/tD8iHTwI7fmsELH
	zOzgdWAafeHmba4NB7CdeHfyFHz+uMhPw34pLN3t5tn7oiQ4lCTl2pWSMDEAYUJZ
	6MeIUZI+CUr/VMeqmzkARYxszZmrW27ysqOwdUYjJjsySxRJ984skYdO8yDgjVfV
	MEXps6/UPk001dqPeic+0ibF/sAuDraapDOpnXKgaTm+wjZIFL+5o1wG5owWIsXj
	98GxT91Vw+reqiRE6naRWqUaDZE2oMYu5q0u0DpRBuGWFhCq0ueZ614W9ehhNII4
	79YML7R+nZZK5z1GWG0ejzHJ7EXpkHnzjo/FYKLb4eIEWNlA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 422xr5kgj8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 07 Oct 2024 08:45:30 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4978jT46024703
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 7 Oct 2024 08:45:29 GMT
Received: from hu-ekangupt-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 7 Oct 2024 01:45:27 -0700
From: Ekansh Gupta <quic_ekangupt@quicinc.com>
To: <srinivas.kandagatla@linaro.org>, <linux-arm-msm@vger.kernel.org>
CC: <gregkh@linuxfoundation.org>, <quic_bkumar@quicinc.com>,
        <linux-kernel@vger.kernel.org>, <quic_chennak@quicinc.com>,
        <dri-devel@lists.freedesktop.org>, <arnd@arndb.de>
Subject: [PATCH v1 0/4] Add invokeV2 to support new features
Date: Mon, 7 Oct 2024 14:15:14 +0530
Message-ID: <20241007084518.3649876-1-quic_ekangupt@quicinc.com>
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
X-Proofpoint-GUID: B0ryBzcniQOwxEg3MCWdDvcZJWagyruh
X-Proofpoint-ORIG-GUID: B0ryBzcniQOwxEg3MCWdDvcZJWagyruh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 suspectscore=0
 clxscore=1011 mlxlogscore=896 priorityscore=1501 impostorscore=0
 adultscore=0 mlxscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410070061

This patch series adds the listed features that have been missing
in upstream fastRPC driver.

- Add changes to support new enhanced invocation ioctl request.
- Add support for CRC check.
- Add support for DSP and kernel performance counters.
- Add polling mode support.

Userspace change: https://github.com/quic/fastrpc/pull/73

Ekansh Gupta (4):
  misc: fastrpc: Add CRC support using invokeV2 request
  misc: fastrpc: Capture kernel and DSP performance counters
  misc: fastrpc: Modify context id calculation for poll mode
  misc: fastrpc: Add polling mode support for fastRPC driver

 drivers/misc/fastrpc.c      | 435 ++++++++++++++++++++++++++++++------
 include/uapi/misc/fastrpc.h |  10 +
 2 files changed, 376 insertions(+), 69 deletions(-)

-- 
2.34.1


