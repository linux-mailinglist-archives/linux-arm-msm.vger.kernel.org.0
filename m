Return-Path: <linux-arm-msm+bounces-22287-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CEF889038ED
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Jun 2024 12:35:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 804B91F233A8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Jun 2024 10:35:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB8281791EF;
	Tue, 11 Jun 2024 10:34:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="BefniOrG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACF5E7407C;
	Tue, 11 Jun 2024 10:34:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718102099; cv=none; b=gz4vQ6m544LZElHP0/ZXSv96XpdZZh5zZny4iW3Atvq0MNBcln+dc/xDx3SN5nA72m4VylJ7HivUxENsYGc0JttvtN9/J448Lh9cB8nB9gKuSbAsZjOhihybyB6KhBb+dOPNMdtBmfl0KCbA+o42gVvutqTZWe15bKInHMCZ6uc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718102099; c=relaxed/simple;
	bh=CAhk4/ZKjyN2nOCvdOqwpEapus9WeeMdkxzHYiQc//g=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=AOoILIzu9U+P/8vD889nVyoPZPtD6YvfkRUnM+k19+fH7QNFZol0QM9pr7LnVS45HgxyCJ7PwLR3J6rfwh4W0mKG0HwW7Xpkl5JVPWqK7RJl4rO3jtWWXHKIgeKCHUStTOdkK7lohiU1xSgmTw1vTRdNz5jGIJT6gxWUsWSrpXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=BefniOrG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45B9bhjV013157;
	Tue, 11 Jun 2024 10:34:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=6X5Iqp2hrw705B0jD83nQH
	KcOy/xHcrrfLBEq+DtWpE=; b=BefniOrG9ax2l2N3vxBj0W/mPXwQtqjGU3yUBX
	7xccsy+pKR16/iztCyAd6BhUsRfXWqV/uOtMkn2Bp9kZ1+B1SydYXc8a8o5eVlfl
	BryBYI83Z5+2Y4+UssGm3D7Eb4RlomS0sXi9lVQVGsG6eS67J5+MjwHbThxnJplO
	T2JmyFd6+/CGoyPtzkSKNYeI8P9PXSaoWXdercvjbnUcmOqsKuzuIY3jCi3K6sJq
	i6JwYpHAFa+RW9QV+yjYUeAA44z1YmkPktE0nhH6VrYEQY2ucFX7EobkXcE75USw
	1o9eR60On9L3JJ3TMEWDXd4ttvjMWeVroSW9YSkw4Ug+wtGg==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ypm45847c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Jun 2024 10:34:55 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45BAYrsV027611
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Jun 2024 10:34:53 GMT
Received: from hu-ekangupt-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 11 Jun 2024 03:34:51 -0700
From: Ekansh Gupta <quic_ekangupt@quicinc.com>
To: <srinivas.kandagatla@linaro.org>, <linux-arm-msm@vger.kernel.org>
CC: <gregkh@linuxfoundation.org>, <quic_bkumar@quicinc.com>,
        <linux-kernel@vger.kernel.org>, <quic_chennak@quicinc.com>
Subject: [PATCH v5 0/7] Add missing fixes to FastRPC driver
Date: Tue, 11 Jun 2024 16:04:33 +0530
Message-ID: <20240611103442.27198-1-quic_ekangupt@quicinc.com>
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
X-Proofpoint-GUID: l4jf8CtFOnQG_79S81aw8KM3wgvi0gHx
X-Proofpoint-ORIG-GUID: l4jf8CtFOnQG_79S81aw8KM3wgvi0gHx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-11_06,2024-06-11_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 impostorscore=0 mlxlogscore=801 phishscore=0 malwarescore=0 suspectscore=0
 bulkscore=0 spamscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406110080

This patch series adds the listed bug fixes that have been missing
in upstream fastRPC driver.
- Fix DSP capabilities request.
- Fix issues in audio daemon attach operation.
- Restrict untrusted app to attach to privilegeded PD.

Changes in v2:
- Added separate patch to add newlines in dev_err.
- Added a bug fix in fastrpc capability function.
- Added a new patch to save and restore interrupted context.
- Fixed config dependency for PDR support.

Changes in v3:
- Dropped interrupted context patch.
- Splitted few of the bug fix patches.
- Added Fixes tag wherever applicable.
- Updated proper commit message for few of the patches.

Changes in v4:
- Dropped untrusted process and system unsigned PD patches.
- Updated proper commit message for few of the patches.
- Splitted patches in more meaningful way.
- Added helped functions for fastrpc_req_mmap.

Changes in v5:
- Dropped PDR patch. It will be shared in a separate patch series.
- Dropped fastrpc_req_mmap and remote_heap specific changes from this
  series. These patches will be shared separately as a new patch series.
- Changed patch series subject as this series is no longer carrying any
  new feature changes.

Ekansh Gupta (7):
  misc: fastrpc: Add missing dev_err newlines
  misc: fastrpc: Fix DSP capabilities request
  misc: fastrpc: Copy the complete capability structure to user
  misc: fastrpc: Avoid updating PD type for capability request
  misc: fastrpc: Fix memory leak in audio daemon attach operation
  misc: fastrpc: Fix ownership reassignment of remote heap
  misc: fastrpc: Restrict untrusted app to attach to privileged PD

 drivers/misc/fastrpc.c      | 51 +++++++++++++++++++++++++++----------
 include/uapi/misc/fastrpc.h |  3 +++
 2 files changed, 40 insertions(+), 14 deletions(-)

-- 
2.43.0


