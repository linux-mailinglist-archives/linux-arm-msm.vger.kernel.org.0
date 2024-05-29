Return-Path: <linux-arm-msm+bounces-20910-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A4868D33F1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 May 2024 12:03:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9F9B11C21FAE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 May 2024 10:03:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 414BA179658;
	Wed, 29 May 2024 10:03:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Hrw8qRLH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8CE231A60;
	Wed, 29 May 2024 10:03:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716977033; cv=none; b=H6/gfdHu1bQ275ScdjpoN9K9B0MnHb6saeWsOt0Ha5jgZK1NEle0LUmGkPTc569gOuarNVKF+LtCu+RlslNjuW8gqf0RLX4HzM1DswpEy2hfWwQW32NRUWTZBoU6clfRlj674M+Y4Cu4s7FWLX4b/6a0oa7wGq14HKMQ2jUmGUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716977033; c=relaxed/simple;
	bh=NJpAF6QFUxlk0MavKXR0ryC/gmNuSQVWCAV1AOyOdDc=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Ve/OQjYkzkrwWvZGqfWUt4UqyOTmUmY/EMevd1dYvpm6bTga17IT+YAKpdbPg7XwuF819G+WlA5RkL/O1VKy1zY2ewnfjgsD2SqzB1r4ZPw6tlf8dIiAxHlPkSNJsSE4sVWRAAdIqjIOtD0Pl0onopD6xswyIVbrODDO7wNEL9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Hrw8qRLH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44T7MING015684;
	Wed, 29 May 2024 10:03:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=90voEcY5RKzH2Ai3yNSH8J
	R9TUrfx1YU3v2z/zT5j58=; b=Hrw8qRLH8CNkh8ecZM90yORb1IXclZnxP8EkD9
	xlacHCYhdb67mnEZBTd/ruyiYb/00oGEBQyZzb4bhP61YfCFDSzzKPOZKrNp6Gy9
	xqQc8CI1djZbZCAkbjla8jT5Kpvmf2LrmMd6WQkcoeo+qxg9d/auvmSoegwNzkRh
	Kc/6v80oN7okYuxVaJgRkSUvDqrMIQiWiKiKgQV9VA9PGGYg3gdaZtpAxtITsmUV
	h6V7roYcD/LLSAxR/qgvxnmTafzOQZLzKi9NxQrlgG3XHzcstSoC6BFznn+0+G9J
	FlCCClW3REA4QS5oOBrGZNsaPAp07jZwpZcYfv6lIlqpy7hA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ydyws0a8u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 May 2024 10:03:47 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44TA3keY009633
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 May 2024 10:03:46 GMT
Received: from tengfan-gv.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 29 May 2024 03:03:40 -0700
From: Tengfei Fan <quic_tengfan@quicinc.com>
To: <andersson@kernel.org>, <konrad.dybcio@linaro.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <kernel@quicinc.com>,
        Tengfei Fan
	<quic_tengfan@quicinc.com>
Subject: [PATCH v2 0/2] arm64: dts: qcom: sm8550: Update some
Date: Wed, 29 May 2024 18:02:54 +0800
Message-ID: <20240529100256.3158447-1-quic_tengfan@quicinc.com>
X-Mailer: git-send-email 2.25.1
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
X-Proofpoint-ORIG-GUID: VnTHfA7z6y2s3YwHoRzvvs7eXjBhgq1N
X-Proofpoint-GUID: VnTHfA7z6y2s3YwHoRzvvs7eXjBhgq1N
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-29_06,2024-05-28_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 phishscore=0
 malwarescore=0 impostorscore=0 suspectscore=0 mlxscore=0 mlxlogscore=285
 priorityscore=1501 spamscore=0 lowpriorityscore=0 bulkscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2405290067

Move usb-role-switch to SoC dtsi, and remove usb default dr_mode.

Signed-off-by: Tengfei Fan <quic_tengfan@quicinc.com>
---

v1 -> v2:
  - Splitting a patch into two patches based on functionality
  - Remove some changes that have already been mainlined
  - Update patch commit message

previous discussion here:
[1] v1: https://lore.kernel.org/linux-arm-msm/20240513084701.1658826-1-quic_tengfan@quicinc.com

Tengfei Fan (2):
  arm64: dts: qcom: sm8550: Move usb-role-switch to SoC dtsi
  arm64: dts: qcom: sm8550: Remove usb default dr_mode

 arch/arm64/boot/dts/qcom/sm8550-hdk.dts                     | 5 -----
 arch/arm64/boot/dts/qcom/sm8550-mtp.dts                     | 5 -----
 arch/arm64/boot/dts/qcom/sm8550-qrd.dts                     | 5 -----
 arch/arm64/boot/dts/qcom/sm8550-sony-xperia-yodo-pdx234.dts | 5 -----
 arch/arm64/boot/dts/qcom/sm8550.dtsi                        | 1 +
 5 files changed, 1 insertion(+), 20 deletions(-)


base-commit: 9d99040b1bc8dbf385a8aa535e9efcdf94466e19
-- 
2.25.1


