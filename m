Return-Path: <linux-arm-msm+bounces-33836-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E1AB99832D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Oct 2024 12:09:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 859D12835A4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Oct 2024 10:09:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C3B618C03D;
	Thu, 10 Oct 2024 10:09:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="gdRBwdvz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC8241BE236;
	Thu, 10 Oct 2024 10:09:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728554973; cv=none; b=cg5l2ztPwKHL+AOXihWf2ZZrGQSgdQYd/HWpNVuddtUwbE341wUwV52TEAi/RU+QZc7atcyLJ5PZv57J3Xs7qoG9p5lpiSUO3QNMnFuxjLGRBdgcMprlIGNyI3bh2MX8cWZvnKO1Kw+QdnGtdl0n8WeedORHymOkZenRbKBQ/qU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728554973; c=relaxed/simple;
	bh=cR/MMSF4kGoSo2AihCSgWkCP3y4gaCXmbPEC2y9PbDA=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=HKejO0enbfQJ0OtUpqQt3+w8A36IA3s9aMyF8T3npEBpGUc6CSC8WIUfCrcPC6VZid5fnkHtCj8F1ZG4nxIKJT957CS+E2SQE3ibAwvRf5EBEgYEPLck54g0dXYU48SjqOF6LVzz4eDMsxBN3K16I9o55WZIWea7i4f40nmElwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=gdRBwdvz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49A1b5k9023566;
	Thu, 10 Oct 2024 10:09:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=hnOJuM5HK8tldySVmPF0NH
	ZhxdG2qAKpDiNzCMb3HZE=; b=gdRBwdvz78uRAEha9GmL/uEkuzuSRPIU0k5siq
	coQhiWxoyzj6MRaK503U2vdVBLimy7kzaLe1/+s+ZAotz3sZXf3g89EDD+i5+xvD
	cd78yugoC4CR+ilfJCRETqcMNrFE/Ek+hWAAL6Ngue4FgOkJ+Xwxa57p8apiG2Rr
	3KVCuRu/v6JdYMQ8vwedUyudfvKGuwSVMPigi+sZD8kIHzDbVXGqSHNgOnuQP+S2
	Ql1+cB3pdUf60um9ThsFiA5cU1/UzM//hQ1Q1sVdHuGcx1F7zf4YTeDhUaErJlLH
	NyctHu2TLGZ01DOCmaYwBh5VO7YR5HmUavOlJFY6hWB9y0xg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 424ndyh1nm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Oct 2024 10:09:27 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49AA9QZi015872
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Oct 2024 10:09:26 GMT
Received: from jingyw-gv.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 10 Oct 2024 03:09:22 -0700
From: Jingyi Wang <quic_jingyw@quicinc.com>
Subject: [PATCH v2 0/3] soc: qcom: llcc: Add LLCC support for the QCS8300
 platform
Date: Thu, 10 Oct 2024 18:08:45 +0800
Message-ID: <20241010-qcs8300_llcc-v2-0-d4123a241db2@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAK6nB2cC/1WPzWrDMBCEX8XoXJXVb2yf+h4lGGm9bhYcO5Fc0
 xL87lVsaOlpmYX5ZuYhMiWmLNrqIRKtnHmeitAvlcBLmD5Icl+00KCtAgXyjrk2AN04IkptbET
 vtDo1KIrllmjgrx33fj50ovtnoS7H8w9aMgoSGu1+kTzxwmHs+iWzpOCVHcg6Y1W76ic9hkwS5
 +uVl7YyBknbUmDAYBFqQ97XLqg6Wg/lUIyud6jEs8eF8zKn733lqvYiRzqYf4O6PvFKSa5KgtS
 69q6J/QD+9FZGIE/4WuLFedu2H7NOImw5AQAA
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>,
        Conor Dooley <conor@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>
CC: <quic_tengfan@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <quic_tingweiz@quicinc.com>, <quic_aiquny@quicinc.com>,
        Jingyi Wang
	<quic_jingyw@quicinc.com>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1728554962; l=1730;
 i=quic_jingyw@quicinc.com; s=20240910; h=from:subject:message-id;
 bh=cR/MMSF4kGoSo2AihCSgWkCP3y4gaCXmbPEC2y9PbDA=;
 b=511oGlx/cZzZ/3c1AukDYIqYoccRv5TXCa68X4bGKI0BRxD0raB8dO26xMa4SZv94v/rboKOp
 cUugVvfZGeoDQFf+BpciEynlrU/4C8fGGWoXpcZMJPsUndfJv0ZqHUE
X-Developer-Key: i=quic_jingyw@quicinc.com; a=ed25519;
 pk=ZRP1KgWMhlXXWlSYLoO7TSfwKgt6ke8hw5xWcSY+wLQ=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: YYmMl9ogOcDDz5GTlIhvMANBU9-M8s9B
X-Proofpoint-ORIG-GUID: YYmMl9ogOcDDz5GTlIhvMANBU9-M8s9B
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 mlxscore=0
 bulkscore=0 adultscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 mlxlogscore=780 spamscore=0 suspectscore=0 impostorscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410100067

The QCS8300 platform has LLCC(Last Level Cache Controller) as the system
cache controller. Add binding, configuration and device tree node to
support this. There is an errata to get the number of the banks of the
LLCC on QCS8300 platform, hardcode it as a workaround.

Patch3 depends on below patch series:
https://lore.kernel.org/all/20240925-qcs8300_initial_dtsi-v2-0-494c40fa2a42@quicinc.com/

Signed-off-by: Jingyi Wang <quic_jingyw@quicinc.com>
---
Changes in v2:
- Hardcoding instead of adding property in dt node and remove related patches
- Add LLCC deivcetree node
- Add reviewed-by tag
- Patch rebased for LLCC configuration format change
- Link to v1: https://lore.kernel.org/r/20240903-qcs8300_llcc_driver-v1-0-228659bdf067@quicinc.com

---
Jingyi Wang (3):
      dt-bindings: cache: qcom,llcc: Document the QCS8300 LLCC
      soc: qcom: llcc: Add LLCC configuration for the QCS8300 platform
      arm64: dts: qcom: qcs8300: Add LLCC support for QCS8300

 .../devicetree/bindings/cache/qcom,llcc.yaml       |  2 +
 arch/arm64/boot/dts/qcom/qcs8300.dtsi              | 15 +++++
 drivers/soc/qcom/llcc-qcom.c                       | 72 ++++++++++++++++++++++
 3 files changed, 89 insertions(+)
---
base-commit: 33ce24234fca4c083e6685a18b460a18ebb5d5c1
change-id: 20241010-qcs8300_llcc-234bc652179c
prerequisite-change-id: 20240925-qcs8300_initial_dtsi-ea614fe45341:v2
prerequisite-patch-id: 73c78f31fa1d504124d4a82b578a6a14126cccd8
prerequisite-patch-id: 5a01283c8654ae7c696d9c69cb21505b71c5ca27
prerequisite-patch-id: dc633d5aaac790776a8a213ea2faa4890a3f665d
prerequisite-patch-id: 9ecf4cb8b5842ac64e51d6baa0e6c1fbe449ee66

Best regards,
-- 
Jingyi Wang <quic_jingyw@quicinc.com>


