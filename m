Return-Path: <linux-arm-msm+bounces-37545-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E61FB9C4D89
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Nov 2024 04:58:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 71DBDB21AE2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Nov 2024 03:58:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4866F19E7FA;
	Tue, 12 Nov 2024 03:58:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="cKah/4Ti"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FF5E4C91
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 Nov 2024 03:58:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731383899; cv=none; b=PzQ2j6sXepoWU+rUsLSbQAVArUeI6LNAXGaZJyCqGqYB12SHOHNspPOWsWitHh3Kfh15Jlw9c0DGCmf/S0wt/EVSZUkbnmKct5viRe7Vnpfrk62Ev80KGBIUVVgf3XCHCGQXz62jefanPeySNwkJTGt+UiJ89ZYluSVTRzzNBvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731383899; c=relaxed/simple;
	bh=p245+k+MoW2zsHwY31lu1ximjXuneP9gUOxvkI6VzA8=;
	h=Message-ID:Date:MIME-Version:To:CC:From:Subject:Content-Type; b=eBkI7c2jQWkjRA0RHi+hRV203hLap9WcjKU6hKBMvtXkiu5ZIgPj7e7cJBhImo/pDNhqdJMQix4PlJU+wVSlYWHdCDZ3JYCs3h3oolzCl7gMeUTrTwUt+qJ0ibnRWuhsn+zohfOPgQibY/tUGP8nSVL/6qrCmoyHFsjUJes+Qz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=cKah/4Ti; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AC3TgpJ025360;
	Tue, 12 Nov 2024 03:58:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=bYy63dsumA698v4p9/TgRL
	s+bXu6YA8P4yHJhsCfBbA=; b=cKah/4Tin1AG6Bd3HQ4VwsHyN7JwJfy0Noqaxj
	2O9l8OrWfjRWakbqrSlQ8TOlp8Ftd2B1JsO147A+fJP3O22uDwOGgfahzqErjnSy
	/x3+RE1k9063s/KYSTYkJQ13ymJBf8JGu1ez0InHxHjnvyDU3AauLPZJjdoujMLe
	qmO0PeQyJbc79R9OOtRNtwDK7wiQTlIJLgbhhCNbpHdTfcXuxD81DQ4kTzu3QcxX
	qwLMlaGmK4SBJEoQv5UK7V0/REX+eZY6vSmBgNTdttgR3fmbVdJOm8aFuXF516XQ
	xOnJrLwYuYD3TgKZeG+4DsksbPpNuYUPzLhQbR4zs7dvcggA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42sytsp1ux-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Nov 2024 03:58:12 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AC3wB0k018899
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Nov 2024 03:58:11 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 11 Nov
 2024 19:58:11 -0800
Message-ID: <9282f078-6e81-1854-8b8f-fc8ced869ad4@quicinc.com>
Date: Mon, 11 Nov 2024 20:58:10 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Content-Language: en-US
To: <linux-firmware@kernel.org>
CC: linux-arm-msm <linux-arm-msm@vger.kernel.org>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
Subject: [PULL]: Update firmware for Qualcomm AIC100
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: ys8aMcRh9L2tmnLQEw4jLfYMuiF-nnXK
X-Proofpoint-ORIG-GUID: ys8aMcRh9L2tmnLQEw4jLfYMuiF-nnXK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011
 priorityscore=1501 suspectscore=0 bulkscore=0 impostorscore=0 phishscore=0
 mlxlogscore=772 lowpriorityscore=0 malwarescore=0 spamscore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411120031

The following changes since commit 6482750d396980a31f76edd5a84b03a96bbdf3fe:

   Merge branch 'verb' into 'main' (2024-11-11 20:01:00 +0000)

are available in the Git repository at:

   https://github.com/quic-jhugo/linux-firmware aic100_1_18_2_0

for you to fetch changes up to af7f6e4f72a11e8b2604ec476a1fea087b33d27b:

   qcom: Update aic100 firmware files (2024-11-11 20:47:16 -0700)

----------------------------------------------------------------
Jeffrey Hugo (1):
       qcom: Update aic100 firmware files

  qcom/aic100/fw1.bin  | Bin 1571360 -> 2135752 bytes
  qcom/aic100/fw10.bin | Bin 249439 -> 249439 bytes
  qcom/aic100/fw2.bin  | Bin 771016 -> 783512 bytes
  qcom/aic100/fw5.bin  | Bin 24576 -> 24576 bytes
  qcom/aic100/fw9.bin  | Bin 750416 -> 762704 bytes
  qcom/aic100/sbl.bin  | Bin 805808 -> 1048576 bytes
  6 files changed, 0 insertions(+), 0 deletions(-)

