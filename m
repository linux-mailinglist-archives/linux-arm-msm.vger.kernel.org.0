Return-Path: <linux-arm-msm+bounces-27973-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B570948840
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Aug 2024 06:20:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BC5EDB22CE1
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Aug 2024 04:20:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2753814D6F7;
	Tue,  6 Aug 2024 04:20:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="l4heRKps"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A021B5A117;
	Tue,  6 Aug 2024 04:20:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722918002; cv=none; b=rEJyFBoP4al+3C8bcCwW8l2Yq/QMtO+A77DmOJu08rG1fBvKZ0NfsxVRqzsBam3fc7M7vgWeOjfDBeJhSIC1K1Hxe4FLwTcgo/PsPF1ARvw3sA4kVJ0QSJoJV2ObBsjTkwJiSrG8hETt2+wAdRjC6ZDSj2O96l+GebIgx9uWj0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722918002; c=relaxed/simple;
	bh=szFWh1yYAG9fLc6mStdumc+iJZFqeRMDNLOQus4+PEY=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=SBfbiEq2l0YsnZmfapDyKy5rmhnvYwi7SFwldJQL7Z9Agp1d5IgM+242alddeCb207rfHNjzDLhP1b390ZKvrocoyNTKV2ElcFgm1lCB0xfuCdQaxell/5xLGCk6DXTCp1El4RxVHP/xqXRouVr/Msa7pYVBud4A8zYKU1MN3bo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=l4heRKps; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4762br2h028209;
	Tue, 6 Aug 2024 04:19:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=uzQJRNFFPiJ43vpJgYbSGr
	OQ9dOPVKYODShwfwyIFJI=; b=l4heRKpsIYpgfOMtC2ZbxBXb28iyyRSqykGoS3
	h6HWQnWxNB2JOUZNstIvVJYqLFEGEoz0lq7NzXr2xI+SnBwg+X8ZC+x4JfxEqVww
	ordlaeAQ+JJBfDLdcE4ATAiCSSpUeoH8gzpsNF7ulFPnoDnlJaZSHO1ljLHoQAy6
	XIpUJ/Tle9DmHGRJAdsVU4YnToLsLO83gz+4aQhQrwi2DfiIfReDtBgkwNDez04Q
	alRQog9HuVPuLMkdNkjP0A0buBF3wx3XbG0Ht+8y0QEOBtgffDqzMPnJjUtIZ10E
	lmrzcw9G6K0YgPIJL6/ChCFzWbflNdKxOAFw/ggCdhn7MKEw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40sdae5wqq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 06 Aug 2024 04:19:57 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 4764Ju4P010127
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 6 Aug 2024 04:19:56 GMT
Received: from tengfan-gv.ap.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 5 Aug 2024 21:19:51 -0700
From: Tengfei Fan <quic_tengfan@quicinc.com>
Subject: [PATCH 0/4] soc: qcom: Add QCS9100 SoC ID and compatible support
Date: Tue, 6 Aug 2024 12:19:26 +0800
Message-ID: <20240806-add_qcs9100_soc_id-v1-0-04d14081f304@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAE+ksWYC/x3MSwqAMAwA0atI1hZiEa1eRaSUJmo2fhoQoXh3i
 8u3mMmgnIQVxipD4ltUjr2gqSuIW9hXNkLFYNG26LAzgchfUYcG0esRvZAhi5Ft6HocHJTwTLz
 I80+n+X0/dHjfemQAAAA=
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konrad.dybcio@linaro.org>,
        Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <kernel@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Tengfei Fan
	<quic_tengfan@quicinc.com>
X-Mailer: b4 0.15-dev-a66ce
X-Developer-Signature: v=1; a=ed25519-sha256; t=1722917990; l=981;
 i=quic_tengfan@quicinc.com; s=20240709; h=from:subject:message-id;
 bh=szFWh1yYAG9fLc6mStdumc+iJZFqeRMDNLOQus4+PEY=;
 b=XCsrtWUPQ54yYLqqi3ybRDxG7eG0DeAsmyMir70kjf/TRdykHyu8AuY6IgIBZo02WjpTQATIL
 EJYdUyl0A5gBExXSoyfCMwQtsB8NVPVarpCVfrtrXOFHbxOGR8yHry5
X-Developer-Key: i=quic_tengfan@quicinc.com; a=ed25519;
 pk=4VjoTogHXJhZUM9XlxbCAcZ4zmrLeuep4dfOeKqQD0c=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: _iB9lqrm2aolV8arueeP_YTSVMht8q35
X-Proofpoint-GUID: _iB9lqrm2aolV8arueeP_YTSVMht8q35
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-06_02,2024-08-02_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxlogscore=435
 spamscore=0 adultscore=0 bulkscore=0 phishscore=0 mlxscore=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 impostorscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408060029

Add QCS9100 SoC ID and compatible support. The QCS9100, referencing the
SA8775p, shares the same SoC DTSI and board DTS. The distinction lies in
their unique SoC ID.

Signed-off-by: Tengfei Fan <quic_tengfan@quicinc.com>
---
Tengfei Fan (4):
      dt-bindings: arm: qcom,ids: add SoC ID for QCS9100
      soc: qcom: socinfo: add QCS9100 ID
      dt-bindings: arm: qcom: Document QCS9100 compatible
      arm64: dts: qcom: sa8775p-ride: Add QCS9100 compatible

 Documentation/devicetree/bindings/arm/qcom.yaml | 2 ++
 arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dts    | 2 +-
 arch/arm64/boot/dts/qcom/sa8775p-ride.dts       | 2 +-
 drivers/soc/qcom/socinfo.c                      | 1 +
 include/dt-bindings/arm/qcom,ids.h              | 1 +
 5 files changed, 6 insertions(+), 2 deletions(-)
---
base-commit: d6dbc9f56c3a70e915625b6f1887882c23dc5c91
change-id: 20240806-add_qcs9100_soc_id-d20ce2a67098

Best regards,
-- 
Tengfei Fan <quic_tengfan@quicinc.com>


