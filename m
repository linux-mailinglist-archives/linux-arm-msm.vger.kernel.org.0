Return-Path: <linux-arm-msm+bounces-4152-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E4E480C171
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Dec 2023 07:43:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B6FA71C20840
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Dec 2023 06:43:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DCF61F606;
	Mon, 11 Dec 2023 06:43:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="meBN3Vtn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 672E5B5;
	Sun, 10 Dec 2023 22:43:09 -0800 (PST)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3BB5kZCJ028438;
	Mon, 11 Dec 2023 06:42:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id; s=qcppdkim1; bh=gDmF3Z8bpvyT
	2isGQR96C4xl9uFFMECarS08e0Gntcs=; b=meBN3VtnBit3X/I56N8Mulby2qUZ
	60VL2VBdetWqFQsffLIArcxS9LWuIl/R1hkO5ZDQBhPYnOzORVlASlrn/03WaxcM
	m4p0b653azm1MffIPcHn6wTUrny1wCXmaFECl2aukrNpOVvZX4pK3mhagUT8nZq1
	mzn+J/5QtGrYZz/4UovCYx5NUeb4PxderLl6Lknb4dOBZUsJQt8u+W91XOUt01t8
	q5K9B8TBSxaYiYYhSNvEwL14Om27r35HS5CqXpvrFWp5pHF4kguwIqq13DzmpiWB
	J13v33o9YQgLgZeWdXuEbtngNsKsTR+EkXkuwK1Lg09vvS/fQ6kPqulqsA==
Received: from aptaippmta02.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3uvney2gkg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 11 Dec 2023 06:42:57 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 3BB6gtkt026134;
	Mon, 11 Dec 2023 06:42:55 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTP id 3uvhak8ycp-1;
	Mon, 11 Dec 2023 06:42:55 +0000
Received: from APTAIPPMTA02.qualcomm.com (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3BB6gtsb026128;
	Mon, 11 Dec 2023 06:42:55 GMT
Received: from cbsp-sh-gv.qualcomm.com (CBSP-SH-gv.ap.qualcomm.com [10.231.249.68])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTP id 3BB6gtG5026127;
	Mon, 11 Dec 2023 06:42:55 +0000
Received: by cbsp-sh-gv.qualcomm.com (Postfix, from userid 4098150)
	id 016C355E7; Mon, 11 Dec 2023 14:42:53 +0800 (CST)
From: Qiang Yu <quic_qianyu@quicinc.com>
To: mani@kernel.org, quic_jhugo@quicinc.com
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_cang@quicinc.com,
        quic_mrana@quicinc.com, Qiang Yu <quic_qianyu@quicinc.com>
Subject: [PATCH v5 0/2] bus: mhi: host: Add lock to avoid race when ringing channel DB
Date: Mon, 11 Dec 2023 14:42:50 +0800
Message-Id: <1702276972-41296-1-git-send-email-quic_qianyu@quicinc.com>
X-Mailer: git-send-email 2.7.4
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: SS15zwtudvQ1jNPVx9kJqxPv_KROnGsh
X-Proofpoint-ORIG-GUID: SS15zwtudvQ1jNPVx9kJqxPv_KROnGsh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_01,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 bulkscore=0
 impostorscore=0 mlxlogscore=536 mlxscore=0 phishscore=0 spamscore=0
 malwarescore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2312110054
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>


1. We need a write lock in mhi_gen_tre otherwise there is race of the WP
used for ringing channel DB between mhi_queue and M0 transition.
2. We can not invoke local_bh_enable() when irqs are disabled, so move
read_lock_irqsave() under the mhi_gen_tre() since we add write_lock_bh() in
mhi_gen_tre().
3. Unlock xfer_cb to prevent potential lockup

v1 -> v2:
Added write_unlock_bh(&mhi_chan->lock) in mhi_gen_tre() before return
because of error process.

v2 -> v3:
1. split protecting WP and unlocking xfer_cb into two patches
2. Add a new patch to stop processing buffer and eventof a disabled or
stopped channel.

v3 -> v4:
1. Modify commit message
2. Add unlock operation before return error

v4 -> v5:
1. Squash "protecting WP" and "Take irqsave lock" into one patch
2. Drop patch 3/4 of patch v4

Bhaumik Bhatt (1):
  bus: mhi: host: Add spinlock to protect WP access when queueing TREs

Qiang Yu (1):
  bus: mhi: host: Drop chan lock before queuing buffers

 drivers/bus/mhi/host/main.c | 26 +++++++++++++++++---------
 1 file changed, 17 insertions(+), 9 deletions(-)

-- 
2.7.4


