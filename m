Return-Path: <linux-arm-msm+bounces-38904-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2073F9D6835
	for <lists+linux-arm-msm@lfdr.de>; Sat, 23 Nov 2024 09:52:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BFA97281DAB
	for <lists+linux-arm-msm@lfdr.de>; Sat, 23 Nov 2024 08:52:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 327DE17332C;
	Sat, 23 Nov 2024 08:52:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="NnryBAPE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74D91F4FA;
	Sat, 23 Nov 2024 08:52:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732351965; cv=none; b=bZTWzPtAal9VEtGfZXyopiOv7+J1JJ2CmJCKnnGqQCheAr8LO4ev7/sK+FQTRR/Dgi18jKg+PHJtX0gesYP5NNdbsAbeJt0SAQzu42w2DOP/HppX4qRxQsmrDaITlX+fJ4FWKXsJwwHjClSNawJ6tpFPZ16Cgb/XUeYWrHIHLU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732351965; c=relaxed/simple;
	bh=MZxWfinBeB7iFkEeMpRVfcLMYXQwVcnWOwQQV02ZS4U=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=ZdpbfmQgR1WKT7jLUuy43zfOFvswP1bELwTfrnXoAc6nW7snh0es/vdkMtdE7JOiGKNUMykrXKUAzY6sgVM/8Y7G9yuRdnkY/JVmbtvIXy6Q6i4UfEU5SKoP/4XRcDutwSvifl+3L4x4UjnTkD3CwoZ5sftNEl32UTMf6S01oTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=NnryBAPE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AN7jwHP005461;
	Sat, 23 Nov 2024 08:52:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=hpqiryFom2ZEzj/TTyf1Xe
	AJH9WUqZKY2OH43LqeZR4=; b=NnryBAPE8PSbQlVjb0OtGpBbibANxRCj8X/xdc
	fBBAedVW2kq3lDwgz6NMqczB+8wvzLoh6HLyR1qlmtOqogdjXYKcIch5h9A3ssQC
	flW2J71KRVY8CY4vsgHNexhuB3+l0S5Oar3kZJWV1RnyxSgmiv+Uyzv9nqfYR66n
	vy8GrfRxtXUlcrMwS5khxR5/JWfou7GgvyFNKvWJyK0kdZWJ+owBYPC1pU7ZRplP
	vR5lD/KkWu9ZRGqeyOocCE/x4offoH5onTPT++jEkK7qEplXRRwFcMZp3nRSeqnJ
	gkL7H0MtvXmz+1WdSMSwE0GGuM4JjQZ0W+Vv2XAsjiv+4aOg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4337928fn3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 23 Nov 2024 08:52:32 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AN8qVmL031627
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 23 Nov 2024 08:52:31 GMT
Received: from yijiyang-gv.ap.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Sat, 23 Nov 2024 00:52:28 -0800
From: Yijie Yang <quic_yijiyang@quicinc.com>
Subject: [PATCH v4 0/2] Enable ethernet for qcs8300
Date: Sat, 23 Nov 2024 16:51:52 +0800
Message-ID: <20241123-dts_qcs8300-v4-0-b10b8ac634a9@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKmXQWcC/yWOQQ7CIBBFr9KwFgMUU3TlPYxpKg52jAUL2LQx3
 t2hZfeY/P/flyWICImdqi+LMGHC4An0rmK27/wDON6JmRJKS3r8nlM72mRqIbgztanBCXcAxyj
 xjuBwXtsuV+Jbl4DfYudtXzpe6D8z9zBnPgTf2VAyPaYc4rIKTLIkty0hGylUo8xeGa1Vo7nk4
 wdtu+ATFzI7F0Jv9zYM7Prb5iPQb8K8OWwCdB8wn6p1uHSLo9KU+P0B3xoFnf0AAAA=
X-Change-ID: 20241111-dts_qcs8300-f8383ef0f5ef
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran
	<richardcochran@gmail.com>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <netdev@vger.kernel.org>,
        Yijie Yang
	<quic_yijiyang@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1732351947; l=1249;
 i=quic_yijiyang@quicinc.com; s=20240408; h=from:subject:message-id;
 bh=MZxWfinBeB7iFkEeMpRVfcLMYXQwVcnWOwQQV02ZS4U=;
 b=1hS7okFdim/yaQIyujAudQPyUEidFewdaL3vkENokjlz+VRHCLNISyr7FxdBIZYedS0dk5MJg
 b2dSHgKdCTqCCv6cNebSOWKYx7TGxRtLHsOyrFZjtN/Plo651NuDNUu
X-Developer-Key: i=quic_yijiyang@quicinc.com; a=ed25519;
 pk=XvMv0rxjrXLYFdBXoFjTdOdAwDT5SPbQ5uAKGESDihk=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: P0P5LJDYYwGEDBLjig8EBhgTFVqEoVx0
X-Proofpoint-GUID: P0P5LJDYYwGEDBLjig8EBhgTFVqEoVx0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 mlxlogscore=522 clxscore=1015 impostorscore=0 mlxscore=0 phishscore=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 suspectscore=0
 adultscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411230073

Add dts nodes to enable ethernet interface on qcs8300-ride.
The EMAC, SerDes and EPHY version are the same as those in sa8775p.

Signed-off-by: Yijie Yang <quic_yijiyang@quicinc.com>
---
This patch series depends on below patch series:
https://lore.kernel.org/all/20240925-qcs8300_initial_dtsi-v2-0-494c40fa2a42@quicinc.com/ - Reviewed
https://lore.kernel.org/all/20241010-schema-v1-0-98b2d0a2f7a2@quicinc.com/ - Applied

Changes in v4:
- Remove the dts split and revision 2 changes, as the 1G PHY version is now obsolete.
- Enable 2.5G PHY in qcs8300-ride.dts.
- Replace spaces with indents as possible.
- Update the subject of the first change.
- Link to v3: https://lore.kernel.org/all/20241118071846.2964333-1-quic_yijiyang@quicinc.com/

---
Yijie Yang (2):
      arm64: dts: qcom: qcs8300: add the first 2.5G ethernet
      arm64: dts: qcom: qcs8300-ride: enable ethernet0

 arch/arm64/boot/dts/qcom/qcs8300-ride.dts | 112 ++++++++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/qcs8300.dtsi     |  43 ++++++++++++
 2 files changed, 155 insertions(+)
---
base-commit: c83f0b825741bcb9d8a7be67c63f6b9045d30f5a
change-id: 20241111-dts_qcs8300-f8383ef0f5ef

Best regards,
-- 
Yijie Yang <quic_yijiyang@quicinc.com>


