Return-Path: <linux-arm-msm+bounces-37135-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 84C449BE52A
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Nov 2024 12:05:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2D275B23605
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Nov 2024 11:05:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93EAD1DE3CA;
	Wed,  6 Nov 2024 11:05:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="U3Kay2h5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18FEE1DDA33;
	Wed,  6 Nov 2024 11:05:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730891134; cv=none; b=oKWkbytZKHOSZGcH1DQUW8JlbnhMStiRnA+kRdforpw6Aq+IHSQlHuAhq6jgbCkVH1ilWo6EGvVaHwUv9hyxSc7EfGXzt20EV3E8VXmNODIROhAoIaYzKTcSDEemXdVTP0gYP9N2raUco1F5t6dkWTrAuG9aiGcL572g/DfG6w0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730891134; c=relaxed/simple;
	bh=4Bsu5YjIpw1KAW0JU6P4lrvTRJk+Fuqv6CJ3iJ7EH2k=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=CwW5+V8lz82CWpWq0SPH/tBUtCQFw6SGgk727bH+nCg3QXL9fSA+G2snbkGAK2n/yD5ITzQua5U5Y8IKDDDg8zGk1slmxIU/S/vKgWKpYNueDBdCdAX23y8vJqbhjThk/gHNAFxmAiN9Lkgjcd0UF/1I48rbmk5CYPRxE7uCHLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=U3Kay2h5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A69rnVc003788;
	Wed, 6 Nov 2024 11:00:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=S9scgmya5GtDLBM13J5M22
	nRp6d8MsHxfzgcy2Arw6U=; b=U3Kay2h5YkcXydZKIQ2X/r9WjIeEdPLYDRQZq8
	ksInu3vu7qCvIxrwrPJtq4Q4HTJMGYrFEyPYHSHESeMHWjw/sPVunslp464Gs9NZ
	rUrgW1C7x59cdzAb68JkOj4Q2K3CTePyA9M00i2Y9kcKfHEiJJ42bUCwMmiiDfY4
	hQmKcsHxViyACSv/190Dxl7PQ/tEwmerTUjZNWPOmcQIzCxSSDwmjIcu0B/6j/M5
	pdWXfQrS3bfkzQ2N3g7Mh5rdJY7IVEs8fYfCNhieFNw+wXn2ZNgjKU6G+cmbik8n
	ky+ExaQjXh25BIuPe7QnVNLu47LPA4vcSOBbNTdo901Mxkxw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42qhbubkn3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 06 Nov 2024 11:00:23 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4A6B0Mrb014465
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 6 Nov 2024 11:00:22 GMT
Received: from hu-yrangana-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 6 Nov 2024 03:00:17 -0800
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
Subject: [PATCH V1 0/2] Enable TRNG for QCS8300
Date: Wed, 6 Nov 2024 16:30:00 +0530
Message-ID: <20241106110002.3054839-1-quic_yrangana@quicinc.com>
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
X-Proofpoint-ORIG-GUID: gcSegp-zBUyOHcg7fM4FzIvrlPGhdyJv
X-Proofpoint-GUID: gcSegp-zBUyOHcg7fM4FzIvrlPGhdyJv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 mlxlogscore=602 clxscore=1011 priorityscore=1501 adultscore=0 bulkscore=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411060089

Add device-tree nodes to enable TRNG for QCS8300

Yuvaraj Ranganathan (2):
  dt-bindings: crypto: qcom,prng: document QCS8300
  arm64: dts: qcom: qcs8300: add TRNG node

 .../devicetree/bindings/crypto/qcom,prng.yaml |    1 +
 arch/arm64/boot/dts/qcom/qcs8300.dtsi         | 1380 +++++++++++++++++
 2 files changed, 1381 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/qcs8300.dtsi

-- 
2.34.1


