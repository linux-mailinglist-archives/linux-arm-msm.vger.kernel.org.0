Return-Path: <linux-arm-msm+bounces-37235-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D009F9C056E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Nov 2024 13:16:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0B2AD1C225FB
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Nov 2024 12:16:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB1261DE4E9;
	Thu,  7 Nov 2024 12:15:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ITMo0qLk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 110EC17BB0D;
	Thu,  7 Nov 2024 12:15:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730981756; cv=none; b=WRpQqVse/nSc+DALOo0SQomA1EE3zkU4BoRVFFbtndw9YM3WDpcF2GIkZCxllOM8zDqRW/52BG60OL/RndmXYKm+lgWW2QQWUtgFgcp/uFoasJXVzDx7r1Rv6CSCybtB5Jrh4IZcuoISzlK9JniCzuw78TJaKPUcaewZFSF/sP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730981756; c=relaxed/simple;
	bh=n7pEQxm9nHm8Xp1fePJ9/f0NUtLKJaUKPTVa1Cz5YIA=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=B35LHm8qbnSz7ZDcssCY+GSYmWGrkOHZmybBKo1XYJ8XaXdfhz/vOEA3HvOdgxGqXGpVcU3kjpjKv1p4L8DixPjzbf944nIv0SuHV7q5ZddzWcwQrvdo1xdidDAT9OkOCiDTnqrOhCxKEAZBQCVJFj6fqZwZGvDpc6xcvlUT5hg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ITMo0qLk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A77FcWM013156;
	Thu, 7 Nov 2024 12:15:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=WG0D7fYtOtvxiR6D6EXmdj
	Bys1UsHJB+sn1lWPqxWW8=; b=ITMo0qLklC6Oce97euSK5TLszsaIFKhpr7jLL8
	UFhsPvA2NQPNjkUM44ZPySVZuP5MTjT1CNiDHZZExi5VCIzBDtljYj5+dg/NX2A6
	78bRMu33Eb5Jgr2ejosWfI7MDVwfuI2TuZ977NNaAY1CtZ7meD0LBG0NHAa5yG98
	sV0gPDxX76bJBLeTHJgpbHaT5mm59OkA17STBFm1Jm63mY533piXLKFmDNuPMO7/
	FPjpR3EsVmje7+g88hYhCiPcJBndztcsahECyfk0PFTuv/WsUOQMGfg7N6ZcrGsz
	TRYCKNcLhUr6btljwtEkUGF+VvBKtlwRZYKIQDtAAi/xYrHw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42qp2rx88h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 07 Nov 2024 12:15:47 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4A7CFkGl024064
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 7 Nov 2024 12:15:46 GMT
Received: from hu-yrangana-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 7 Nov 2024 04:15:42 -0800
From: Yuvaraj Ranganathan <quic_yrangana@quicinc.com>
To: Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller"
	<davem@davemloft.net>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Vinod Koul
	<vkoul@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-crypto@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <quic_yrangana@quicinc.com>, <quic_sravank@quicinc.com>
Subject: [PATCH V2 0/2] Enable TRNG for QCS8300
Date: Thu, 7 Nov 2024 17:45:11 +0530
Message-ID: <20241107121513.641281-1-quic_yrangana@quicinc.com>
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
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: r4xyFKukDDjVFl0CQbseadJtKpzWtS04
X-Proofpoint-ORIG-GUID: r4xyFKukDDjVFl0CQbseadJtKpzWtS04
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 clxscore=1015
 bulkscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 mlxlogscore=572 suspectscore=0 spamscore=0 mlxscore=0 phishscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411070094

Add device-tree nodes to enable TRNG for QCS8300

This series depends on below patch series:
https://lore.kernel.org/all/20240925-qcs8300_initial_dtsi-v2-0-494c40fa2a42@quicinc.com/ - Reviewed

Signed-off-by: Yuvaraj Ranganathan <quic_yrangana@quicinc.com>
---
Changes in v2:
 - Mistakenly uploaded the base dtsi change instead of marking dependency
 - Link to v1: https://lore.kernel.org/all/20241106110002.3054839-1-quic_yrangana@quicinc.com/

---
Yuvaraj Ranganathan (2):
  dt-bindings: crypto: qcom,prng: document QCS8300
  arm64: dts: qcom: qcs8300: add TRNG node

 Documentation/devicetree/bindings/crypto/qcom,prng.yaml | 1 +
 arch/arm64/boot/dts/qcom/qcs8300.dtsi                   | 5 +++++
 2 files changed, 6 insertions(+)

--
2.34.1


