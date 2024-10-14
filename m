Return-Path: <linux-arm-msm+bounces-34316-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 37B2699C8FA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Oct 2024 13:33:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D4645B2C327
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Oct 2024 11:19:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BD901586CF;
	Mon, 14 Oct 2024 11:15:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="oGwxV2jj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72C541A7ADD;
	Mon, 14 Oct 2024 11:15:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728904545; cv=none; b=SQnjLpU8m69jB4fNz+EYCp56RtA/qyn8oRcCbKDxQ5/vpV43efcMVueY29/AfS91BC8kmOjYbKE9WLB4d0BH61uTfeWi4zT6CtleLZbIL+oSMUBNt1MrXb9Rc3eoiubBei7Ouo27tTJgkwyCnWY1qO+VMFqn/12l9yM5P46IN/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728904545; c=relaxed/simple;
	bh=iNLMQZO6bZsxA1tSNAV1nnQE5LyCACHgn30md8y1gUM=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=FYSnJcIVfI2qLQtGMKQzf7J8RIqg359qqOJHsHfJey4UpzvaQslAYyaKK6wrfahi7d2VtPcdM+xm+woayZZHRDpmQ+4DMn5JpJluhBfwfZXY9dXysMzXT8RqoV8P1orUVwuKC2QpK7CV6z+nqqoX8r1gRzC/Gdid3fn5ia8d3po=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=oGwxV2jj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49EB7UiP005267;
	Mon, 14 Oct 2024 11:15:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=PPMS2/X2JNdkNmpzmkO8kJ
	/zlOtnCL9SD4cAwsJqGIg=; b=oGwxV2jjdJceH0Nx+TEC4ar3jzh7XQzgc7BPCq
	0xGpuYxfrePXG28igQ7zW5+Q13NGsbJ82gYF1rElqooOIgcA0IJNE5aFhyXTKZMt
	LOegkgdHGdyRBvpLd5GHAj7c58u9zfzdmSdX3QsM2wFU5d0s51OU/iND2dv6nx21
	b+8mBTYTbMPhVlDKwkgLWtPrlHkYUPlWakTFyD9QDl9Eo1P2IM+89lNVvFm8D6er
	IQ6XRBskJcZwfxr6CQye+Q61bxQe6I6VFR6wDMNhxc7i7XNSDFZ/WEr2uxKHs1Ox
	RGYAZgkE3pYX2h2jgd/82oe9wXmuBPQwRowAVVZ6qI8/eVMQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 427hg745hm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 14 Oct 2024 11:15:38 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49EBFbeN031327
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 14 Oct 2024 11:15:37 GMT
Received: from hu-kuldsing-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 14 Oct 2024 04:15:35 -0700
From: Kuldeep Singh <quic_kuldsing@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>,
        Bartosz Golaszewski
	<bartosz.golaszewski@linaro.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 0/2] qcom_tzmem: Enhance Error Handling for shmbridge
Date: Mon, 14 Oct 2024 16:45:25 +0530
Message-ID: <20241014111527.2272428-1-quic_kuldsing@quicinc.com>
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
X-Proofpoint-ORIG-GUID: EmdLiybwNc8wBPEcqOkiowuW2Bn70Urg
X-Proofpoint-GUID: EmdLiybwNc8wBPEcqOkiowuW2Bn70Urg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=623
 lowpriorityscore=0 spamscore=0 adultscore=0 priorityscore=1501
 suspectscore=0 bulkscore=0 phishscore=0 malwarescore=0 impostorscore=0
 mlxscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410140081

This patchset addresses the tzmem driver probe failure caused by
incorrect error handling. The qcom_scm_shm_bridge_enable() SCM call
captures SCM success/failure in a0 and E_NOT_SUPPORTED in a1.

Previously, qcom_scm returned values based solely on a0, without
capturing not_supported scenario. This patchset corrects that behavior.

Along with this, add sanity checks on input parameters passed to exposed
APIs as it is missing currently.

Changes in v2:
- Restructure qcom_scm_shm_bridge_enable scm return value
- Update commit message
- Keep relevant sanity in qcom_tzmem

v1:
Link: https://lore.kernel.org/linux-arm-msm/20241005140150.4109700-1-quic_kuldsing@quicinc.com/

Kuldeep Singh (1):
  firmware: qcom: qcom_tzmem: Implement sanity checks

Qingqing Zhou (1):
  firmware: qcom: scm: Return -EOPNOTSUPP for unsupported SHM bridge
    enabling

 drivers/firmware/qcom/qcom_scm.c   | 13 ++++++++++++-
 drivers/firmware/qcom/qcom_tzmem.c |  6 ++++++
 2 files changed, 18 insertions(+), 1 deletion(-)

-- 
2.34.1


