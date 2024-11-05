Return-Path: <linux-arm-msm+bounces-37039-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 08E389BCA57
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Nov 2024 11:22:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B4C911F22CE9
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Nov 2024 10:22:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C0171D1F7B;
	Tue,  5 Nov 2024 10:22:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="PiOONlz6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBA841CC881;
	Tue,  5 Nov 2024 10:22:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730802168; cv=none; b=DItJRIiWdH+d39pZzeXhiu9pNe3iyQeKSAK5J+gvpidVSdobHRsem4DIZCNiBLjPA7BjDKWFwqtF5uLPCF2ls9WwuYVXoNE47SNW2ldXZuI5IDMYmIop4B3Z3LpVMNYdxNvTJ+R/KTl+7+coPNCgUxtZ81O9q0q3GD5HXC+ff9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730802168; c=relaxed/simple;
	bh=PdeXOAunfb5v59d7LGgF+JdvETH1pIsFovNBsf565kY=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=IOmEb2UP+npxWxTYjcPj06VpLR1hHQecIYGvh8VybDGowhhG7+cnW/RoRIqebdavm8ho5v/DvGqDvyCktDGEPqyPKmrx1068e6Z30CDhsLvUsprITsaes/Za5Yi04ZFvPVJlhCLtc9AXVq/xko3SRI2H8/sa62dkUrsEhLLYqhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=PiOONlz6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A57vDfQ004743;
	Tue, 5 Nov 2024 10:22:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=5kWhuYcNaaXuoJhUi1wBrW
	YMY1+c3qKie7gOlm7FvBI=; b=PiOONlz67flRAaQLVTNky9yRb+1RF2Es43txP4
	qNGuw+EObt5jq3coym64X025rSmCtLYzXau6UPO1kTF5hSDFoe2h1vqrgnGr/Dwu
	ikiom5krlnx/ml8J9b4364iF+Me9BC9ksoEiSBHhgoPW+M+uKKtxZsgXkPS6jITm
	UX1l445HjtUUzKxkuGuWEB8GnP9vKYS7mxpjqXrJrt7dQzuSbokHBnIUkStKl2sJ
	/cKmVxCKEn7oXkhQHdNxucNYVwGNz+cFxq//7x5nNumqIDRpoYCmRKG8YHuqI6HJ
	O2WxYQOgTlsdUi/ztDKXIYXGv5tg3+n13dV9jNI+Q0WqFKLQ==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42qfdx0d11-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 05 Nov 2024 10:22:43 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4A5AMgrJ016685
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 5 Nov 2024 10:22:42 GMT
Received: from hu-varada-blr.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 5 Nov 2024 02:22:39 -0800
From: Varadarajan Narayanan <quic_varada@quicinc.com>
To: <andersson@kernel.org>, <konradybcio@kernel.org>, <conor@kernel.org>,
        <robh@kernel.org>, <krzk+dt@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC: Varadarajan Narayanan <quic_varada@quicinc.com>
Subject: [PATCH v2 0/3] qcom: ipq5424: Add LLCC/system-cache-controller
Date: Tue, 5 Nov 2024 15:52:07 +0530
Message-ID: <20241105102210.510025-1-quic_varada@quicinc.com>
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
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: CYszkoH1_bUT2L2YrISxgXvgol56JW4B
X-Proofpoint-ORIG-GUID: CYszkoH1_bUT2L2YrISxgXvgol56JW4B
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 malwarescore=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 priorityscore=1501
 impostorscore=0 mlxscore=0 bulkscore=0 spamscore=0 mlxlogscore=871
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411050078

Unlike other Qcom SoCs, IPQ5424 doesn't have multiple instances
of LLCC IP and hence doesn't have a LLCC_BROADCAST register
space, and the LLCC & LLCC_BROADCAST point to the same register
space.

Alter the driver accordingly and add the relevant entries for
enabling LLCC/system-cache-controller on the Qcom IPQ5424 SoC.

Depends On:
https://lore.kernel.org/linux-arm-msm/20241028060506.246606-1-quic_srichara@quicinc.com/

---
v2:	Add reviewed-by for dt-bindings and dts patches
	Add 'no_broadcast_register' to identify SoC without LLCC_BROADCAST register space

v1:	https://lore.kernel.org/linux-arm-msm/20241104073840.3686674-1-quic_varada@quicinc.com/

Varadarajan Narayanan (3):
  dt-bindings: cache: qcom,llcc: Add IPQ5424 compatible
  soc: qcom: llcc: Update configuration data for IPQ5424
  arm64: dts: qcom: ipq5424: Add LLCC/system-cache-controller

 .../devicetree/bindings/cache/qcom,llcc.yaml  | 20 ++++++-
 arch/arm64/boot/dts/qcom/ipq5424.dtsi         |  7 +++
 drivers/soc/qcom/llcc-qcom.c                  | 58 ++++++++++++++++++-
 3 files changed, 81 insertions(+), 4 deletions(-)


base-commit: 1ffec08567f426a1c593e038cadc61bdc38cb467
prerequisite-patch-id: 1090fe9cee19a52dc8595e2fecef659199828246
prerequisite-patch-id: 491c9f6c32738c4eb4398962c1ae7c625cd43238
prerequisite-patch-id: 1651c75547b539eb46eb4d02630e364f262860bf
prerequisite-patch-id: 7ce54f0af6083e897067a7e5cd9561198f3d4d41
prerequisite-patch-id: 0a04fdee4b5b76cd5b734c666f7c8f5561e3e9d8
prerequisite-patch-id: 084f6dced27c39b600711dde2f797b43393cde73
-- 
2.34.1


