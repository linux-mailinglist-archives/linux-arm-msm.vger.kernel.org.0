Return-Path: <linux-arm-msm+bounces-43106-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AC7BD9FACEC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Dec 2024 11:01:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3584C164BFA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Dec 2024 10:01:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 586D53D561;
	Mon, 23 Dec 2024 10:01:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="aV3chsP4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB50323AD;
	Mon, 23 Dec 2024 10:01:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734948087; cv=none; b=iXUZ7nG5UH/j3Znn3iltZFaqhXVq18pLZu9iLlwM6B3QQaC+rlV4Jym+AX8ao2naFQAw06E6iXX0VukmNWrkFTYYlSSTBsa3lVRDtEv/dvCFRIx0ANe07NPJL8rnjsKy6VQg62V46QzR21aOlKJsoNv4bG+DvWk8287b0APQ95s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734948087; c=relaxed/simple;
	bh=fVnHvW3m1k7WN9Mr0ioMVq7AzXZX1nTVFqn6cTUZhP8=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ggmXDjTdUTRRaNalE1UkpN4u14HxOk/aUuzShWbUj+S/Zm4FC5zR5Hgm5IUGcItP0hSl3SSc5f9EjxCpUdBtLi0ATPCA1DOksy76dL9QARebepvhJvQsD7z0qfIiC0d+56buIyQjQR398xiOJ/zomr7Mmdb2qLhSWdrRxk3BDCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=aV3chsP4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BN5rSF7018251;
	Mon, 23 Dec 2024 10:01:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:message-id:mime-version:subject:to; s=
	qcppdkim1; bh=8opkqR/+gDduH6gbQoVTIGteGmhTVRqyoLxNdDXheqI=; b=aV
	3chsP4ppsbr2TQ9zPpGTIJJVHMniBijugAftEzWU2FhkaVNHrpSaSZPBEAx8YaJ7
	BkeF7Gb9vuURg0iTezbmhfGBY8Od9B+3VtfTSxYMf1elUZ62kJ5E6Kce976ZiOp8
	3LE/kLaoPTVzcGa+e9k/V1DQ/WKRqu8nTUWQYbwwyPsPnq8q8TOBxzzu7twruVkT
	/R+qrVqO0pIqEebpOjqaDoqp4GuPue4ImyCtzruKexUn4Ur+quVEbt+o/dsBo0yn
	2UcSXGOPe8ghxezZZkaAbg4tMkhQFtDQfJl6Qjxkw4dpk11C3/gVr472uJ+jwqM6
	pbamWWjHYQJRBPCw5A3A==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43q2458x0r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 23 Dec 2024 10:01:20 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BNA1JVd028491
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 23 Dec 2024 10:01:20 GMT
Received: from hu-anane-hyd.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 23 Dec 2024 02:01:17 -0800
From: Anandu Krishnan E <quic_anane@quicinc.com>
To: <srinivas.kandagatla@linaro.org>, <linux-arm-msm@vger.kernel.org>
CC: <gregkh@linuxfoundation.org>, <quic_bkumar@quicinc.com>,
        <linux-kernel@vger.kernel.org>, <quic_chennak@quicinc.com>,
        <dri-devel@lists.freedesktop.org>, <arnd@arndb.de>
Subject: [PATCH v2 0/2] Improve error handling in fastrpc_rpmsg_probe
Date: Mon, 23 Dec 2024 15:30:59 +0530
Message-ID: <20241223100101.29844-1-quic_anane@quicinc.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: Ycw7uP00-CyRnLnzS39LZaxNw66-aKIo
X-Proofpoint-GUID: Ycw7uP00-CyRnLnzS39LZaxNw66-aKIo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 adultscore=0
 mlxlogscore=529 priorityscore=1501 malwarescore=0 mlxscore=0 spamscore=0
 suspectscore=0 impostorscore=0 clxscore=1015 lowpriorityscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412230090

Following changes are getting added as part of this patch series:
 - Add proper exit path label to handle deregister of device node
   properly in error scenarios.
 - Add meaningful labels for exit paths in fastrpc_rpmsg_probe
   function to make it intuitive.
Patch [v1] : https://lore.kernel.org/all/20241220061854.24428-1-quic_anane@quicinc.com/

Changes in v2:
 - Added Fixes: tag and cc:stable.
 - Fixed author name.

Anandu Krishnan E (2):
  misc: fastrpc: Deregister device nodes properly in error scenarios
  misc: fastrpc: Add meaningful labels for exit paths

 drivers/misc/fastrpc.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

-- 
2.17.1


