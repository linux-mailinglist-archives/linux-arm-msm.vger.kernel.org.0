Return-Path: <linux-arm-msm+bounces-23345-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C0213910284
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Jun 2024 13:28:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A8AC21C20AB1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Jun 2024 11:28:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DECD71AB8E0;
	Thu, 20 Jun 2024 11:28:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="BQ0Pt91t"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4777821A19;
	Thu, 20 Jun 2024 11:27:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718882880; cv=none; b=REQFnCPxXXGBHr4/hGLOIcik/QZIPmpoVAAQ6mCNBdAXDN4c2yNwC6haoUOwx9/y67pHI5uh2MtzQ+uRQ6YYkOMd+YLmm2CuqLjrjtOhUdH6bWadDCyw01C3lCXlMf/j3V3An9QIl43pt4cbYlF7LzKo3bhG2EHEqdh+iF1Lrcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718882880; c=relaxed/simple;
	bh=N7VLxM5t+CIQt6m++a1ea9Ploo5fC/7kJqS0HoGv4Mc=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=jiIVlx9KRVpImNrkHhIYafcKocpL5kUVIxrMGzYB2R4MTEek2dec80ehup5HU79jlAT1aq5bhhyjP72S3qjactnJo2ZRRx3GAgAJa9Pycdwk/PitC9/LDQduNlVtCLYjcHdY437xzKkx8FBs7txe2XJllVwuGaziw8ys+oRBuRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=BQ0Pt91t; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45K9v5l1030590;
	Thu, 20 Jun 2024 11:27:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=N7VLxM5t+CIQt6m++a1ea9
	Ploo5fC/7kJqS0HoGv4Mc=; b=BQ0Pt91th1kh2tj/K5pnR49vzZ1HuDqsJyxe4h
	HEnR6L6RexG10ATq7C8v3jHpLc6GaYG8YwZBZ2mEt1YCkTH8kn+zsvF+L3fFV2qN
	FhwIxSoGQ1upnoeMtcy6eiqZJI82337zRrY9TtLyqVEfyb4E0O77k+66THerOa26
	8UkGejsCUdGBfIBkv0OBZGJ+yCv3A60RBPF8nSi85LXOs0qj6CDslvFmIpm4Nx0U
	wD3ju+aZ+TqmeaBMLjL1IvvJdP3sBGsMk5Q9ZjF2SCgITS+3cPA7pdTJxdrGSiVK
	mAFcKq7rKLDsc5p60hO6oQrkwLMn0KiTkiNKGqGH/g0wINMQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yv6hn1n2r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Jun 2024 11:27:41 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45KBReUA020527
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Jun 2024 11:27:40 GMT
Received: from hu-kbajaj-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 20 Jun 2024 04:27:35 -0700
From: Komal Bajaj <quic_kbajaj@quicinc.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
        Bjorn Andersson <quic_bjorande@quicinc.com>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>,
        Dmitry Baryshkov
	<dmitry.baryshkov@linaro.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <quic_mojha@quicinc.com>,
        Komal Bajaj
	<quic_kbajaj@quicinc.com>
Subject: [PATCH v2] arm64: defconfig: Enable secure QFPROM driver
Date: Thu, 20 Jun 2024 16:57:16 +0530
Message-ID: <20240620112716.1339-1-quic_kbajaj@quicinc.com>
X-Mailer: git-send-email 2.42.0
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
X-Proofpoint-ORIG-GUID: 1mtQuxNnR0zAtqkB1TFwj7Dd_046U3Cu
X-Proofpoint-GUID: 1mtQuxNnR0zAtqkB1TFwj7Dd_046U3Cu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-20_07,2024-06-20_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 clxscore=1015
 mlxlogscore=994 impostorscore=0 suspectscore=0 mlxscore=0 malwarescore=0
 adultscore=0 priorityscore=1501 spamscore=0 phishscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406200082

Enable the secure QFPROM driver used by Qualcomm QDU1000
platform to read the secure qfprom region allowing LLCC driver
to get the DDR channel configuration.

Currently, LLCC is the only user of secure QFPROM, and hence
setting CONFIG_NVMEM_QCOM_SEC_QFPROM as module to the convenience
of LLCC module.

Signed-off-by: Komal Bajaj <quic_kbajaj@quicinc.com>
---
Changes in v2:
* Setting the CONFIG_NVMEM_QCOM_SEC_QFPROM as module
* Modified the commit message to mention the need for driver enablement
* Link to v1: https://lore.kernel.org/all/20240619105642.18947-1-quic_kbajaj@quicinc.com/
---

 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 838b4466d6f6..2f280d7f5a79 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1575,6 +1575,7 @@ CONFIG_NVMEM_LAYERSCAPE_SFP=m
 CONFIG_NVMEM_MESON_EFUSE=m
 CONFIG_NVMEM_MTK_EFUSE=y
 CONFIG_NVMEM_QCOM_QFPROM=y
+CONFIG_NVMEM_QCOM_SEC_QFPROM=m
 CONFIG_NVMEM_RMEM=m
 CONFIG_NVMEM_ROCKCHIP_EFUSE=y
 CONFIG_NVMEM_ROCKCHIP_OTP=y
--
2.42.0


