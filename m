Return-Path: <linux-arm-msm+bounces-33176-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 38FAB991718
	for <lists+linux-arm-msm@lfdr.de>; Sat,  5 Oct 2024 16:02:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6407C1C21378
	for <lists+linux-arm-msm@lfdr.de>; Sat,  5 Oct 2024 14:02:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 909CC17BD3;
	Sat,  5 Oct 2024 14:02:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Xkq0DNT4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D351F18E1F;
	Sat,  5 Oct 2024 14:02:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728136927; cv=none; b=OoSOOG0yXfvd1+e1WZ0ETfzue+zSkMTw0cGXE8WZNXO89AjdEi7Q99nzjRKwpC0xJShZwPmEEYQEpWyH89oS0Vi2OztVjF1oGaFExuh9XdeOCajk33oyOCfssVlZYd3md2ys/KTlqfddR4C86bWCpIkcQly0aqGuSlGO3V2n9Tc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728136927; c=relaxed/simple;
	bh=ZwEdWvwmmeUZlkYANQvSbV1RLphsFgz7ADp+O36WhSE=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=oUv4ngsfPQ74pBbf5ZmR2YY/mP2EAzQJ0VVhHL6WBHE+BdLD4J2qnTXp7c3BIWOc+kEMAjpnpMLe1L/ILGr7IaFpZhpSw1IZHG7pfeC3izM8/YGnsjKv23b3/CF1vLwpnr9D0HFWW6mboY79Eq0Bs+GlB0iOu57WXZjk6cLyH7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Xkq0DNT4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 495DfUJK005696;
	Sat, 5 Oct 2024 14:02:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=PFObZ7MzmBXjzrSE4Sk88i
	yNjUSTSZ+Hc7QFFDmiLks=; b=Xkq0DNT4+C8RS57QmchPUunFcwkzLNLIH7n/Kk
	Z/saF5eLFk4IQUuKI3W7yAsGbwHAlxIuhMrELGrn5FezVxZvSD8dAnTsfa5UZ9IF
	QTR3u9l5giKxYIGXLHENhLA6V6rW/YMwLKAPesdfhjoI/KW5W6Co7MCG8geMUwrP
	Vf2wluWU2Iad1WDtIxRtjdPLkDwY/Hq+5hRN/o8etHHShjt+3BkmrBffbsgKSszw
	kifi3oSXQ1tJo4clm4XwlTU7Tc1BTUfJPatgkI5lpaqiVC5SUYqvGFBV5W3xO2qz
	AN9KNl/UYLhZKv7uwBo5hPURbhXNvelF2YoJAJ0kLP6aGXmw==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 422xqnrn0w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 05 Oct 2024 14:02:01 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 495E20ej026859
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 5 Oct 2024 14:02:00 GMT
Received: from hu-kuldsing-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Sat, 5 Oct 2024 07:01:58 -0700
From: Kuldeep Singh <quic_kuldsing@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>,
        Bartosz Golaszewski
	<bartosz.golaszewski@linaro.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 0/2] qcom_tzmem: Enhance Error Handling for shmbridge
Date: Sat, 5 Oct 2024 19:31:48 +0530
Message-ID: <20241005140150.4109700-1-quic_kuldsing@quicinc.com>
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
X-Proofpoint-ORIG-GUID: MVaGRcVORSPhO2GE-IiF9E8LwtqI5q_L
X-Proofpoint-GUID: MVaGRcVORSPhO2GE-IiF9E8LwtqI5q_L
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 impostorscore=0
 malwarescore=0 mlxscore=0 phishscore=0 spamscore=0 suspectscore=0
 adultscore=0 mlxlogscore=778 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410050103

This patchset addresses the tzmem driver probe failure caused by
incorrect error handling. The qcom_scm_shm_bridge_enable() SCM call
captures SCM success/failure in a0 and E_NOT_SUPPORTED in a1.

Previously, qcom_scm returned values based solely on a0, without
capturing not_supported scenario. This patchset corrects that behavior.

Along with this, add sanity checks on input parameters passed to exposed
APIs as it is missing currently.

Kuldeep Singh (1):
  firmware: qcom: qcom_tzmem: Implement sanity checks

Qingqing Zhou (1):
  firmware: qcom: scm: Return -EOPNOTSUPP for unsupported SHM bridge
    enabling

 drivers/firmware/qcom/qcom_scm.c   | 12 +++++++++++-
 drivers/firmware/qcom/qcom_tzmem.c | 17 ++++++++++++++++-
 2 files changed, 27 insertions(+), 2 deletions(-)

-- 
2.34.1


