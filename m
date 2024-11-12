Return-Path: <linux-arm-msm+bounces-37582-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0971F9C5313
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Nov 2024 11:21:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AAE521F26364
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Nov 2024 10:21:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BA202123D2;
	Tue, 12 Nov 2024 10:18:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="lqmgxqyh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E6992123D0
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 Nov 2024 10:18:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731406722; cv=none; b=mBOFcRCvPWBTQJ4i684kx6geU6sw1mZm0gVHlMvmfoX8BksJp0WT3nAhBL5zs50RLhP0148+3MCo/enDb0o8OYkSgT8mrD0xEWS18fl/HpJ9sJGyaQbCWhHKhllNX6NPN1yjRIsP0qRrUbMUFPWFFjrUDubH1ITW5morrMpLMIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731406722; c=relaxed/simple;
	bh=fJvduDh6IodBLf1UrFin7xAFtY/kjx88K6bKwEurPhE=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Content-Type; b=TKMIaoFd/2gd5/sqm+X0AwqByag/ogM0Wh3L09RxiqomFQryBTHmsJJVE09OkhbaygQGHXDSAMAmKEbbTlZEQFlpCsmYsnGYlTQ59YIDXrAJ+qJg2RLohMaEWnS/D0MkX+h9EHe4UBB2wWVMqyozWSj/6crRM9l4bbiJSgGPA8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=lqmgxqyh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AC38RRR007661;
	Tue, 12 Nov 2024 10:18:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=fJvduDh6IodBLf1UrFin7x
	AFtY/kjx88K6bKwEurPhE=; b=lqmgxqyh5c8ZMeTnQ4H0hdSkM80e3Q/myM3AsR
	GnXDhYcy2WGwpvgdBxyV1OrGibfGa2JflSkBKfO4Y0u8qeuNA+hu7kWkO4lTjs63
	0v88VCIjiFDuAgYVzdd7spY/78rFKnSd5ANdJuEhVJVsD9m2xGP8eNmw0qCyqRYy
	xdH4f2YsCKppVOsMcMBxD4h6KLHUUDxq0vhpQgjAXzaRi29YaNr+Br82Bw52wQWI
	v3Ih5Ye6IZOqGNqkj0XkzKGsEruI2pT1I0B3D7OPCvP3Utp6ULxHV3o17xb7f064
	3bHbiV+R3ZMNqX3hN9Ru8anolwqTkOeSQA3bI40cDi2D4O8Q==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42t0466wa2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Nov 2024 10:18:32 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4ACAIVMl027607
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Nov 2024 10:18:31 GMT
Received: from [10.217.218.60] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 12 Nov
 2024 02:18:30 -0800
Message-ID: <a16c9d20-fddf-41ac-b04b-460b38db7d10@quicinc.com>
Date: Tue, 12 Nov 2024 15:48:27 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
From: Kishore Batta <quic_batta@quicinc.com>
Subject: [PULL]: Add firmware for Qualcomm QDU100
To: <linux-firmware@kernel.org>, <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: RinfnRBx8oy1iR3wYu7jKLMJzqW_TOIN
X-Proofpoint-ORIG-GUID: RinfnRBx8oy1iR3wYu7jKLMJzqW_TOIN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 bulkscore=0 clxscore=1011 priorityscore=1501 spamscore=0 suspectscore=0
 mlxlogscore=908 impostorscore=0 adultscore=0 phishscore=0 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411120084

The following changes since commit 6482750d396980a31f76edd5a84b03a96bbdf3fe:

  Merge branch 'verb' into 'main' (2024-11-11 20:01:00 +0000)

are available in the Git repository at:

  https://github.com/quic-batta/linux-firmware/tree/qdu100_xbl_s_melf

for you to fetch changes up to 01842da45df0a9f862098d1597f6ae5774b3e48a:

  qcom: Add QDU100 firmware image files. (2024-11-12 15:23:11 +0530)

----------------------------------------------------------------
Kishore Batta (1):
      qcom: Add QDU100 firmware image files.

 WHENCE                 |   7 +++++++
 qcom/qdu100/xbl_s.melf | Bin 0 -> 1424292 bytes
 2 files changed, 7 insertions(+)
 create mode 100644 qcom/qdu100/xbl_s.melf


