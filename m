Return-Path: <linux-arm-msm+bounces-30609-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D76096AEED
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Sep 2024 05:14:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 803E51C21BF8
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Sep 2024 03:14:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A953146450;
	Wed,  4 Sep 2024 03:14:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="DAEECgvZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1668F44376;
	Wed,  4 Sep 2024 03:14:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725419652; cv=none; b=XQ9uJOa9jms22hi7snnviZ2JDTpuFs3YdT1hldoeWALlH6x3c53klndlD8PtJe8o92NlYG3VGMAKxpGW7aB8ntKHnIpF/Pp0InVeRbRB9zJHScY1HUQgAak3BQAH0HsgjgvmbUJ2B6lFB94MR6OdtlJN1kKQeEbZBLTqMUV6ctE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725419652; c=relaxed/simple;
	bh=z6T3uj9S2hkRxDxkKdsAyCx06x8HiMo2ZXpBW1azHJk=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=njqgi+zjRuP8Z1SS4Nc6yT8NIFeXYgDkDmhh3wsQn2wstaJqK0tJmWbu6A1aoQW/6gWrHV6t/sjGWVjxM6Fc7rSCVP02lNKcSN3q33QWZDy7sDn5Ql/CQQx/Cu330nF0dvKifKpOGABDWfti6igeZKgK3OqAQOCGvT18tvgLwBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=DAEECgvZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 483LYgM8032298;
	Wed, 4 Sep 2024 03:14:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=p0p3mrIyNtI+cSSSwYLOPw
	qjUVw7xDUfKE1j1PtrrJs=; b=DAEECgvZmZatNwQ6h8EMjD8Bz/D+uQYO7vz2Bh
	9GEj7JDElzmURR3GGR6rlHte5BHRG6r4s/E2qTYjkPTb3RxKPWhPULeR8oTLHMKd
	KXb1eGMy+ueWU0ylDBeZ7DKK/51Y9+ciXKWuGzEwDhGMGJKcPTZtIQFEHcJn4lvX
	TBSbVsVyg32NHAoGnSOLZepInfQZvhAM90jwx4GKQRm3XDRNEFXwa9OwQv0FVG5C
	9Mz7o7ltvp4RVElKoH2UNP0Sn9ri79syDk0O9eSx5Z5hCyGiI2QuJ2Wq3K7F8pY6
	CjVgu7/EboG/sQCadOC7IC+TSjxSvLbY+fFkccq6pfrajpHw==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41buxf97cr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 04 Sep 2024 03:14:00 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4843Dxho004531
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 4 Sep 2024 03:13:59 GMT
Received: from hu-sibis-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 3 Sep 2024 20:13:56 -0700
From: Sibi Sankar <quic_sibis@quicinc.com>
To: <sudeep.holla@arm.com>, <cristian.marussi@arm.com>
CC: <linux-kernel@vger.kernel.org>, <arm-scmi@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-arm-msm@vger.kernel.org>, <quic_sibis@quicinc.com>,
        <johan@kernel.org>, <konradybcio@kernel.org>
Subject: [PATCH V2 0/2] firmware: arm_scmi: Misc Fixes
Date: Wed, 4 Sep 2024 08:43:22 +0530
Message-ID: <20240904031324.2901114-1-quic_sibis@quicinc.com>
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
X-Proofpoint-GUID: 3optl2gflhvMaeSm-vpRaecqybq2S-uz
X-Proofpoint-ORIG-GUID: 3optl2gflhvMaeSm-vpRaecqybq2S-uz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-04_01,2024-09-03_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 malwarescore=0
 adultscore=0 clxscore=1015 mlxlogscore=668 lowpriorityscore=0 phishscore=0
 bulkscore=0 mlxscore=0 impostorscore=0 priorityscore=1501 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2407110000
 definitions=main-2409040022

The series addresses a couple of kernel warnings that are required to [1]
to land.

[1] - https://lore.kernel.org/lkml/20240612124056.39230-1-quic_sibis@quicinc.com/

V1:
* add missing MSG_SUPPORTS_FASTCHANNEL definition.

Base branch: next-20240903

Sibi Sankar (2):
  firmware: arm_scmi: Ensure that the message-id supports fastchannel
  firmware: arm_scmi: Skip adding bad duplicates

 drivers/firmware/arm_scmi/driver.c    |  9 +++++++++
 drivers/firmware/arm_scmi/perf.c      | 13 +++++++++++--
 drivers/firmware/arm_scmi/protocols.h |  2 ++
 3 files changed, 22 insertions(+), 2 deletions(-)

-- 
2.34.1


