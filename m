Return-Path: <linux-arm-msm+bounces-34607-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C18F9A0DCD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Oct 2024 17:16:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 668DD1C23B14
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Oct 2024 15:16:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 004FF2071ED;
	Wed, 16 Oct 2024 15:16:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="EKAlv8js"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB8E315CD58;
	Wed, 16 Oct 2024 15:16:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729091764; cv=none; b=pliDl1UW/y3O9UUbj3klDdHWZ4rybYai/61oBOJgjJKrGclfVxd5WItmA+uhwFWOPpHtf9uHLlMO4acmRArcF84VHcQmVlvJVSCG87Wa/0nm2f5kQ+Rlyb6wPGV2+oLyLpd+yp7ZuUEtuBWw9COk6AFvE/DNq1kuVYlvAs8327E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729091764; c=relaxed/simple;
	bh=BFntaTSzJzGmmI/RSXtLcqodcmndVEmshHLzINQvQwU=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=f9nuH63ay+zUlrmOzouZtWTP+cFUbgpI3GMKDWfIp8b4eUC83Jok1Aym6lRO+xU5mWPpm9Opc/UjX1bPgLbFbLFAst77ddyW1wDKdLkfg6RwbMY6/tilZSyrh4/mmHEBYzvTjFeBMRg/MzqWAsm8KVlbGUbi8x7IKOJJ8kelUbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=EKAlv8js; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49G8Pv1s002358;
	Wed, 16 Oct 2024 15:15:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=WHRdxFh2Jk2Nzc9kyvj/FP
	/5SzamkPk6ZEIKUZ6GQvc=; b=EKAlv8jsI4hgZa9GujnrFaoB4190ycGa3GnKeH
	8JA3jrl1z0KrnuKuo3cG0gb3AFN2HfewhRqxFLG7DrIM7FFXBbohl0c32c4U5E25
	yxRZsU/bIseYnOo1V7potQi6hmADARJoNcVFsZ+3rjrMtchiINrUMRLjT8s9/+8m
	ELYBqGiOsLQDF0yaErrQvgbJPGhrhFsqwY+Gyf9jFy/B6+Hlp/lVZBC6YvbV7sk2
	cR5vfwJJVZz/BhmfraPOPPUBTznAP5OWE2p/9gLsR7ysnXRTaIMlwCAbQAbKSsBJ
	+bujW5dtvCeY/fxoDg1MNWzwK6LLmPHURRMZQpv7pGMh/p4g==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42a5xyj1vs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 16 Oct 2024 15:15:58 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49GFFvFr009734
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 16 Oct 2024 15:15:57 GMT
Received: from hu-mmanikan-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 16 Oct 2024 08:15:54 -0700
From: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
To: <andersson@kernel.org>, <konradybcio@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC: <quic_srichara@quicinc.com>, <quic_varada@quicinc.com>
Subject: [PATCH 0/3] Add IPQ5424 and IPQ5404 SOC IDs
Date: Wed, 16 Oct 2024 20:45:25 +0530
Message-ID: <20241016151528.2893599-1-quic_mmanikan@quicinc.com>
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
X-Proofpoint-GUID: p_R5amGkFUF6l32CeBahcikzCRniQ0ds
X-Proofpoint-ORIG-GUID: p_R5amGkFUF6l32CeBahcikzCRniQ0ds
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 mlxlogscore=409 lowpriorityscore=0 mlxscore=0 bulkscore=0 malwarescore=0
 suspectscore=0 priorityscore=1501 phishscore=0 clxscore=1015 adultscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410160095

Add SOC IDs for IPQ5424 and IPQ5404, and add smem, tcsr_mutex nodes
for the socinfo driver probe to execute.

This series depends on the following patches
https://lore.kernel.org/linux-arm-msm/20241004102342.2414317-1-quic_srichara@quicinc.com/
https://lore.kernel.org/linux-arm-msm/20241016144852.2888679-1-quic_mmanikan@quicinc.com/

Manikanta Mylavarapu (3):
  dt-bindings: arm: qcom,ids: add SoC ID for IPQ5424/IPQ5404
  soc: qcom: socinfo: add IPQ5424/IPQ5404 SoC ID
  arm64: dts: qcom: ipq5424: Add smem and tcsr_mutex nodes

 arch/arm64/boot/dts/qcom/ipq5424.dtsi | 14 ++++++++++++++
 drivers/soc/qcom/socinfo.c            |  2 ++
 include/dt-bindings/arm/qcom,ids.h    |  2 ++
 3 files changed, 18 insertions(+)

-- 
2.34.1


