Return-Path: <linux-arm-msm+bounces-44921-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 14432A0C39D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jan 2025 22:26:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AAA677A3C27
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jan 2025 21:26:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A811E1D4339;
	Mon, 13 Jan 2025 21:26:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="V8wzK5Gm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3651C1CF5EE;
	Mon, 13 Jan 2025 21:26:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736803609; cv=none; b=UkKq3qebYh+8YhKYv3DwRrP/ZuF1hL+liEe6M0JyaVECbUMbfRhBtQ6Se8nopJPsGw6vkABJkUTf0l1ZQj1q0uhuweZYs2rnMn17kA7pieAem4qO9V/vJeD5q/ixy8flYSQ9A3xQ0wQkOLDxD3H5/o8EdhLW/na093xguIx8H98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736803609; c=relaxed/simple;
	bh=wbVv5F1OXFNArB1Rcr+nBhDP92EwTcpHb0viGzBeyCE=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=N13Al5XwYGEDf81zdwVwHMEUnHLI252FPskDU5zZcQqcum8t5lT9ynY8pbbGoGbCSqZoOU9BXRMSIDO+2fMzK2Ph6tQWcNDUDQB4mrg3otJ6apiLSh8OimJu+MifKaOadykeVyQjpsJQs3hM3zC07SJQoEssuF19WrWknp3vNGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=V8wzK5Gm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50DJLZPZ002875;
	Mon, 13 Jan 2025 21:26:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=ep6hgntlXIGlRCjKRbWc7k
	/4yXJBPImd6M0C5Njtb1A=; b=V8wzK5GmNYwmAikNzdfPJjWhujf0t0+DcKtsUS
	nRO/iG+YI0Zpkr3Ce/4QjUNQs7i/xANS58bNef0TjOiuuP7eJ6xh3uj3LkR+frZn
	5HNG6CxBpZ68APjLP6ZmXenRMSnE45+6urdK1k/GdU6zR8NC8l8P3OJVFmqsPAVQ
	wuNEt7WBf06SD1ouu2s7TNuo4LLSxfdti8z4aZBYw8mGLzD33b1HME0SzwFAAgld
	K5LC0CaMd9EdhML6mIFBbLgUKLwnQoeAXGVy+8MQGXvrVTBArfwvCJryM43o2Fiy
	TYx43h703h7XhcwQU/wfOk5O5vvG+0v2RxlosJWwvhPKIhXA==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4458ww87av-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Jan 2025 21:26:45 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50DLQjr9003454
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Jan 2025 21:26:45 GMT
Received: from hu-molvera-lv.qualcomm.com (10.49.16.6) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 13 Jan 2025 13:26:44 -0800
From: Melody Olvera <quic_molvera@quicinc.com>
Subject: [PATCH 0/4] Introduce LLCC v6 used on the SM8750 SoCs
Date: Mon, 13 Jan 2025 13:26:39 -0800
Message-ID: <20250113-sm8750_llcc_master-v1-0-5389b92e2d7a@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAA+FhWcC/x3MSwqAMAwA0atI1haitiheRaS0NWrAH42IIN7d4
 vItZh4QikwCbfZApIuF9y2hyDMIs9smUjwkQ4mlwQJrJWtTG7TLEoJdnZwUlXeuGkhrj5WHFB6
 RRr7/ade/7we9ZZmhZAAAAA==
X-Change-ID: 20250107-sm8750_llcc_master-baa3de44b03b
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>,
        Conor Dooley <conor@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Satya Durga Srinivasu Prabhala
	<quic_satyap@quicinc.com>,
        Trilok Soni <quic_tsoni@quicinc.com>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Melody Olvera <quic_molvera@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1736803604; l=1017;
 i=quic_molvera@quicinc.com; s=20241204; h=from:subject:message-id;
 bh=wbVv5F1OXFNArB1Rcr+nBhDP92EwTcpHb0viGzBeyCE=;
 b=JjyngSWfb5NyQ8xcSYSeOAjWF2Ufh3av7ikS00A3aB6mCGGFO6VRXD5Cv5Sl5/Eg1JYtLmcOq
 IHnsP5mBsI6A2YUsQp7KuLeD5u6r71NGVbG49DuEWBlXwH2WQ+jUeQ5
X-Developer-Key: i=quic_molvera@quicinc.com; a=ed25519;
 pk=1DGLp3zVYsHAWipMaNZZTHR321e8xK52C9vuAoeca5c=
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: b0m0yqoD2t6ZhL2R-Hl0sdzR_NSKtSF2
X-Proofpoint-ORIG-GUID: b0m0yqoD2t6ZhL2R-Hl0sdzR_NSKtSF2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 spamscore=0 mlxlogscore=592 mlxscore=0 clxscore=1011 impostorscore=0
 malwarescore=0 adultscore=0 bulkscore=0 phishscore=0 suspectscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501130170

Add documentation and functionality for LLCC v6 used on
the SM8750 SoCs. LLCC v6 rearranges several registers and offsets
and supports slice IDs over 31, so new functionality is necessary
to program and use LLCC v6.

Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
---
Melody Olvera (4):
      dt-bindings: cache: qcom,llcc: Document SM8750 LLCC block
      soc: qcom: llcc-qcom: Add support for LLCC V6
      soc: qcom: llcc-qcom: Add support for SM8750
      arm64: dts: qcom: sm8750: Add LLCC node

 .../devicetree/bindings/cache/qcom,llcc.yaml       |   2 +
 arch/arm64/boot/dts/qcom/sm8750.dtsi               |  11 +
 drivers/soc/qcom/llcc-qcom.c                       | 263 ++++++++++++++++++++-
 include/linux/soc/qcom/llcc-qcom.h                 |   8 +
 4 files changed, 280 insertions(+), 4 deletions(-)
---
base-commit: 37136bf5c3a6f6b686d74f41837a6406bec6b7bc
change-id: 20250107-sm8750_llcc_master-baa3de44b03b

Best regards,
-- 
Melody Olvera <quic_molvera@quicinc.com>


