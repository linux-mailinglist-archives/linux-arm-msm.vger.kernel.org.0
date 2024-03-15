Return-Path: <linux-arm-msm+bounces-14255-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 35E8787CF77
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Mar 2024 15:51:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CBA541F234AD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Mar 2024 14:51:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67690374FC;
	Fri, 15 Mar 2024 14:51:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ZEL6GqBW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C43A73838C
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 Mar 2024 14:51:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710514287; cv=none; b=Fa+ZlYbiEh21ADb381DbN3RqYNyROiHZb3KeYcyI3In8tc6I4m0EED5sSX71Z8mslv1dTUL/Sqjg0IzZV3q/XLIgMpBlSaFCnyMbivTk9u9WNLDhcut5Za61u4Bp4Y9APugi8dLknDJV1LVTwT2DfYYfAO0hiI1AGSdXclWyXfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710514287; c=relaxed/simple;
	bh=3Oeo4n/KV2H7lMTKoiVG1im15ZeZGyazKF78EZY9hOQ=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=DbgR26OwJSpWrBGC3fpb/YkfLd1GWBeVCeAMyi9wRufNEY5iCqnjvDiUJzh9E24d+nwQJ5LTJsxbeDXvZLwBKQ8HF5zKt/FUz1qcyUYEYEA85A44oS8wGTpZfV2PjJ95yiKbWU2xKnGyNP4rWFALrGSF+UyxK4R0FaFtUPQcgwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ZEL6GqBW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 42FCrYnC009153;
	Fri, 15 Mar 2024 14:50:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=qcppdkim1; bh=TdBYzz9
	Aiu8H6fml6vrhyIEOauZI+DX0mxiVPF0VEbg=; b=ZEL6GqBWGweL514yPKfCzlO
	I/ZXtsL1Xcq3uDzMAKjFQ1mEA3rZhH4YmMzMQ6w/W4kaF5NxVzFspE0WRBXE0U0a
	5XrevTKKrafc6DHSUmAj5HIOn54xvjUhNbXyztInHibc3HQq2dMiHG2KWFLqLB43
	F37c+SsUFVMRlM1RfbMBkm2I/vMAZnVVVqlmn7Tecz/d9wYcOkMhxv0qeT5Vmeqj
	IAcu9vvZpNRSsO1Fuo6VSn87zeMMWcR2AxfNh/cRZ488QriJNIM1Us/M1qNn/OFW
	+knbr7FkyCuU2FdUII8UfP/venJoCkRJbmDfrC4gvwNV7c2rzjD9hU5xs8ZGOIA=
	=
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3wva081djg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 15 Mar 2024 14:50:53 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 42FEopFa017161
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 15 Mar 2024 14:50:51 GMT
Received: from jhugo-lnx.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Fri, 15 Mar 2024 07:50:50 -0700
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
To: <daniel@ffwll.ch>, <jiasheng@iscas.ac.cn>, <quic_carlv@quicinc.com>,
        <quic_pkanojiy@quicinc.com>, <stanislaw.gruszka@linux.intel.com>,
        <jacek.lawrynowicz@linux.intel.com>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <ogabbay@kernel.org>, Jeffrey Hugo <quic_jhugo@quicinc.com>
Subject: [PATCH 0/2] drm: Add DRM managed workqueues
Date: Fri, 15 Mar 2024 08:50:32 -0600
Message-ID: <20240315145034.3972749-1-quic_jhugo@quicinc.com>
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
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: uOmer71bkRCjl-1ZUteohymqAwl9-nON
X-Proofpoint-GUID: uOmer71bkRCjl-1ZUteohymqAwl9-nON
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-15_02,2024-03-13_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 clxscore=1011
 bulkscore=0 mlxlogscore=999 priorityscore=1501 mlxscore=0 spamscore=0
 malwarescore=0 impostorscore=0 phishscore=0 lowpriorityscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2403140001 definitions=main-2403150120

Based on work at https://lore.kernel.org/dri-devel/20230118032413.6496-1-jiasheng@iscas.ac.cn/

The API in the origional work seemed to have two issues:
1. The output parameter was not correctly defined
2. The allocating functions did not return the allocated object like the
other drmm functions

I tweaked the implementation to address both of these.

From what I can tell, the i915 change no longer applies to the code
base, likely due to refactoring from merging xe.  I dropped it.

Jeffrey Hugo (1):
  accel/qaic: Use drmm_alloc_workqueue()

Jiasheng Jiang (1):
  drm: Add DRM-managed alloc_workqueue() and alloc_ordered_workqueue()

 drivers/accel/qaic/qaic_drv.c | 30 ++-----------
 drivers/gpu/drm/drm_managed.c | 82 +++++++++++++++++++++++++++++++++++
 include/drm/drm_managed.h     |  8 ++++
 3 files changed, 94 insertions(+), 26 deletions(-)

-- 
2.34.1


