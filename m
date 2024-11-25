Return-Path: <linux-arm-msm+bounces-39049-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 86B819D7B9E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Nov 2024 07:44:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 13049B2173B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Nov 2024 06:43:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C430E17BB1A;
	Mon, 25 Nov 2024 06:43:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="LuLDsLlQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7AE216FF37;
	Mon, 25 Nov 2024 06:43:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732517034; cv=none; b=fE7kZ/eQmAK9rUCtcUEXg88L8vQfHxQBkTr6z4C8wq2b8PYL9meLoKXuO68+ElivxMv1DWC68sXDmuYbJwoH0hgtbBsBzorQmYsTT82373+lCc1xKCLtW+0fZHvg6HWayEtI1LWrWS74EktBPwtGMtrVaUogwSiKv2TuQ7/EOiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732517034; c=relaxed/simple;
	bh=dWyWToLbYLFj6bARx0JGVSujunpFShjO9Au0BNa6nI0=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=B9C5Y6b71R7CR5X36vWx+5bP5iKXwF/4zN3IdxfJcAUeVWNvFL7CzYYfqU7r850hK3RzR7mQTTmHpJPcp4AEj45LLReRASv4Na/FKg2bsgtj3Wx4PrlGNGdDwiaF8kO2uA9W6Rns0D5N36omycv0aHcD1TBpdyiD3e+6x3O/1Ks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=LuLDsLlQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AONji9w019665;
	Mon, 25 Nov 2024 06:43:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=d23LlqCY+leeCGC3PRJArL
	py8cEgDgIjY+mThSlf8us=; b=LuLDsLlQERrXGSJSVfp0e93/eWo4XUDl0yqc1c
	X6mrAGrLpDfVnpLTez2EEJDrxFvtH4zEKYNo0/VouP4/98lCMwPoMR+IqiHdw2V7
	EdRxaor+KRByl6Kgw3zNQqsztFXHgm+XqLrA7nMIU7yXjdNvMsQRBsW2DT4PP1uY
	62flCMPwH8EhQFHNkesdIyv4cryZ7M4dyoxl3zY4gUtiWe2/WXQPzWY3EVV4R6EP
	Zrkes7DVKWQXh4AiIGwCcWYmUQZWJzExhKHoyXmaSgpCJKS6UEzS3WqhQJ4Bdf0m
	jCWSup6TKYOs6SvHzOwUZAUGvid4gtaNQrXTRGnhh876o2nw==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 433626bq0n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Nov 2024 06:43:43 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AP6hg9m001165
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Nov 2024 06:43:42 GMT
Received: from hu-yrangana-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Sun, 24 Nov 2024 22:43:38 -0800
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
        <quic_yrangana@quicinc.com>
Subject: [PATCH V5 0/2] Enable TRNG for QCS8300
Date: Mon, 25 Nov 2024 12:13:15 +0530
Message-ID: <20241125064317.1748451-1-quic_yrangana@quicinc.com>
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
X-Proofpoint-GUID: zpGUDJDXdu8tKhFQhyT62TG0z8FiKVzJ
X-Proofpoint-ORIG-GUID: zpGUDJDXdu8tKhFQhyT62TG0z8FiKVzJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 priorityscore=1501 clxscore=1015 phishscore=0 spamscore=0 adultscore=0
 impostorscore=0 mlxscore=0 malwarescore=0 suspectscore=0 mlxlogscore=557
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411250055

Add device-tree nodes to enable TRNG for QCS8300

This series depends on below patch series:
https://lore.kernel.org/all/20240925-qcs8300_initial_dtsi-v2-0-494c40fa2a42@quicinc.com/ - Reviewed

Signed-off-by: Yuvaraj Ranganathan <quic_yrangana@quicinc.com>
---
Changes in v5:
 - Remove "Reviewed-by" tag added incorrectly
 - Link to v4: https://lore.kernel.org/all/20241122074346.4084606-1-quic_yrangana@quicinc.com/

Changes in v4:
 - Address the reg entry style
 - Link to v3: https://lore.kernel.org/all/20241113021819.2616961-1-quic_yrangana@quicinc.com/

Changes in v3:
 - Drop DT label as per review comments
 - Link to v2: https://lore.kernel.org/all/20241107121513.641281-1-quic_yrangana@quicinc.com/

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


