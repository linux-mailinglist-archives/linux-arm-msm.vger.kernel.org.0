Return-Path: <linux-arm-msm+bounces-42522-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AFD6D9F4A0E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Dec 2024 12:39:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 02B6A169A11
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Dec 2024 11:39:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D18E21EE7CD;
	Tue, 17 Dec 2024 11:39:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="lmQSkdOi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 325FC1EC4EE;
	Tue, 17 Dec 2024 11:39:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734435572; cv=none; b=mvIARCHH7xd2xGs60Q+C8xhijbW0yaOKLl2sOQaMWs7lbaIqm9GOlCuekqH7IdM2CyaMXdfNqM7TKEIF4Nu0dThZiY4yvVZ18pN7VIEYOAPxQUsQFiCXsJxg8EFy4Enr7i33ZMNGi3WBHYAxlN/ghyheyVsu5ZhrTSAUWO6D9Vg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734435572; c=relaxed/simple;
	bh=LEVddh7MPIP2VUhPlt4Qmb4JKUlk54HaOac25Ljp1Vw=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=tNf/TQORo5CSJGbNt/11yh++AE0clyt9Cny6jC2c9tShS9sNm/Zqgfeei0pdU7gpyaQ17SwW4txVoIsPgI97eAtvw6l4f5OZoiBKwJO5aTGUdR04U0FvM4Z83ehI4gHavSTWzRyJnwzi1XSmXuwVsK4JYa7La81u2n4jIf4ufoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=lmQSkdOi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BH96l9Z010098;
	Tue, 17 Dec 2024 11:39:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=HEhKoPJL1i2oUXPpYoNYT3
	5TQ/AQk3xfKxaoMLcLFhQ=; b=lmQSkdOilkxSiMiNMRgPN22QaYzYXX/sVMKgZr
	VKI6tIQVeXz93Y2lGn2QcRKgmQhkGj9U+K84kTyjV6Tpu/XoHjlGC5KAKWPeyZ36
	z6WQpmUHZ0NKD7T+S/UrSCTIDCGZ8qUfqD8n3pMfnSD4HvmhuPfQmJTTqfR9WVXW
	fSzVYY+mMJo8R1Qt0RxBx+9+Dl1m07GyZZteMPQ+QmavxA1aATciJHUR1d0pECXr
	axyWowi+9YcU4stMar462OE9X0eHku/9mxoMy+rzJwwRiaFYCMjbJtqeStTuO716
	yJnU6lgyWrwFIwmh6VlQLj+rt7U1z2uRVUu5aj+5nEwf+oYA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43k6cqgd8a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Dec 2024 11:39:27 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BHBdQ1M021521
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Dec 2024 11:39:26 GMT
Received: from hu-mmanikan-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 17 Dec 2024 03:39:22 -0800
From: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
To: <andersson@kernel.org>, <mturquette@baylibre.com>, <sboyd@kernel.org>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>
CC: <quic_srichara@quicinc.com>, <quic_varada@quicinc.com>
Subject: [PATCH v2 0/2] Remove apss_dbg clock from IPQ5424 gcc driver
Date: Tue, 17 Dec 2024 17:09:07 +0530
Message-ID: <20241217113909.3522305-1-quic_mmanikan@quicinc.com>
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
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 9GpQQOVarGDFXOc3rqPL68U4Yabnbesp
X-Proofpoint-GUID: 9GpQQOVarGDFXOc3rqPL68U4Yabnbesp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 clxscore=1015
 lowpriorityscore=0 suspectscore=0 priorityscore=1501 malwarescore=0
 impostorscore=0 mlxscore=0 mlxlogscore=667 phishscore=0 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412170096

The gcc_apss_dbg clk is access protected by trust zone, and accessing
it results in a kernel crash. Therefore remove the gcc_apss_dbg_clk
from gcc driver and dt-bindings.

Changes in V2:
	- Fixed all review comments from Krzysztof Kozlowski.
	- Patches were re-ordered to ensure each patch is bisectable.
	- Detailed change logs are added to the respective patches.

V1 can be found at:
https://lore.kernel.org/linux-arm-msm/20241205064037.1960323-1-quic_mmanikan@quicinc.com/

Manikanta Mylavarapu (2):
  clk: qcom: ipq5424: remove apss_dbg clock
  dt-bindings: clock: qcom: gcc-ipq5424: remove apss_dbg clock macro

 drivers/clk/qcom/gcc-ipq5424.c               | 19 -------------------
 include/dt-bindings/clock/qcom,ipq5424-gcc.h |  1 -
 2 files changed, 20 deletions(-)


base-commit: e25c8d66f6786300b680866c0e0139981273feba
-- 
2.34.1


