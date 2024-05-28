Return-Path: <linux-arm-msm+bounces-20721-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FDE38D197D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 May 2024 13:31:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2AB6F288901
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 May 2024 11:31:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3289216D4D4;
	Tue, 28 May 2024 11:30:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="lvR7eKBe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A5AB16D325;
	Tue, 28 May 2024 11:30:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716895833; cv=none; b=hherpvBQ7plBpujuhiW7elnM5/EcusBmdYJMoo55EhtTGZYSuqYQGyaoidtPoeYUDS+5MpK3BJhRSV81wBVoITTN5wfMGVsuRhqTF+rBr4XGRIr0i4f/5IJh6gv1XuflkrOTEZYPJK2asHQNCpEIYdv34ZrCZMUR3Kq5aNgZTFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716895833; c=relaxed/simple;
	bh=fjjpE12LjCmk3/T8wmL+f/dwb1qT0VhKARo8RUH1uTk=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=jkGhFMziCz2MFGuu790RHS/V+Cly++PgZ5OV4iXggKCYkQjK5qbM1iF6vghLsxQoLbXrn71qSDePmrrFYpE2THfFFBB5XaTUHj/IsHEJtMClhuYcNJyfFTnYxueaO79Og4CnplaFyvJzdQKLmoK2aT1vIYqEKn7RPdVxuwyMKxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=lvR7eKBe; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44RNA26G026579;
	Tue, 28 May 2024 11:30:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=mZuJ0aTjAFLe34q5/lGkcL
	bx1XKfaYi9iuocaPLtFV8=; b=lvR7eKBemrr1aUEmaJVpv9rz/ciyozw+quZlNM
	z/S3xTV8hO0ur6PsX7qbnzBF3AwgF5GLiBsHpftq0iJgUbk9N2EASqELXaWo9b1d
	eoXMWN4fAY1Mx484bq1qARipqiYl8NKuUtbapRd7NGcUj3/lqkP4rswkhG9VM8Dn
	brSvRvHo8jSUYnxN7yqUes053AAxria+GLi6CV9kBlyfR3ttcqwuFjO+h9z/5agC
	F5Et5Ke8nAOaYBKH24SiJDcih7jqMO7xAiPkSm12H1k/GbLq1cxf8BlZHYcEsZDh
	o8cRy4h8J0qrDHIh9uXmhwM1Fg0RzPqUrT+Zvej3Gnj81/4g==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yba0qduhu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 May 2024 11:30:28 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44SBU8jg027739
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 May 2024 11:30:08 GMT
Received: from hu-ekangupt-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 28 May 2024 04:30:05 -0700
From: Ekansh Gupta <quic_ekangupt@quicinc.com>
To: <srinivas.kandagatla@linaro.org>, <linux-arm-msm@vger.kernel.org>
CC: <gregkh@linuxfoundation.org>, <quic_bkumar@quicinc.com>,
        <linux-kernel@vger.kernel.org>, <quic_chennak@quicinc.com>
Subject: [PATCH v2 0/8] Add missing features to FastRPC driver
Date: Tue, 28 May 2024 16:59:46 +0530
Message-ID: <20240528112956.5979-1-quic_ekangupt@quicinc.com>
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
X-Proofpoint-GUID: 0DjslDngQNQHDd3NnMfzDsxdwP-rI2a0
X-Proofpoint-ORIG-GUID: 0DjslDngQNQHDd3NnMfzDsxdwP-rI2a0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-28_07,2024-05-28_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 suspectscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015 mlxscore=0
 mlxlogscore=660 malwarescore=0 spamscore=0 adultscore=0 bulkscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2405280087

This patch series adds the listed features that have been missing
in upstream fastRPC driver.
- Add missing bug fixes.
- Add support for interrupted context.
- Add static PD restart support for audio and sensors PD using
  PDR framework.
- Redesign and improve remote heap management.
- Add change to support unsigned PD. Unsigned PD can be enabled
  using userspace API:
  https://git.codelinaro.org/linaro/qcomlt/fastrpc/-/blob/master/src/fastrpc_apps_user.c?ref_type=heads#L1173
- Add check for untrusted applications and allow trusted processed to
  offload to system unsigned PD.
  https://git.codelinaro.org/srinivas.kandagatla/fastrpc-qcom/-/commit/dfd073681d6a02efa080c5066546ff80c609668a

Changes in v2:
- Added separate patch to add newlines in dev_err.
- Added a bug fix in fastrpc capability function.
- Added a new patch to save and restore interrupted context.
- Fixed config dependency for PDR support.

Ekansh Gupta (8):
  misc: fastrpc: Add missing dev_err newlines
  misc: fastrpc: Fix DSP capabilities request
  misc: fastrpc: Add support to save and restore
  misc: fastrpc: Add static PD restart support
  misc: fastrpc: Redesign remote heap management
  misc: fastrpc: Add support for unsigned PD
  misc: fastrpc: Restrict untrusted apk to spawn
  misc: fastrpc: Add system unsigned PD support

 drivers/misc/Kconfig        |   2 +
 drivers/misc/fastrpc.c      | 742 ++++++++++++++++++++++++++++--------
 include/uapi/misc/fastrpc.h |   2 +
 3 files changed, 596 insertions(+), 150 deletions(-)

-- 
2.43.0


