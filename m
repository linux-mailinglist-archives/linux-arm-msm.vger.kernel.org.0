Return-Path: <linux-arm-msm+bounces-37729-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 28DE39C68F6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Nov 2024 06:59:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 19D371F25484
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Nov 2024 05:59:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CDDB173357;
	Wed, 13 Nov 2024 05:58:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="MvsABUAs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 132192309AE;
	Wed, 13 Nov 2024 05:58:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731477537; cv=none; b=qxFYjRLmy6+CGe0G5S5Goc75op4dlRUnlTvBtEaTbkJTr1xQdi79uslLsyd7q/JiUwjIJ++CAJ6CdFiHq3FqzxGZrYdZWi8jXsv3JfGPZ1vdTMQedLjIHhkotNLaYBmCspQ+o+p9mz99a/CCqTQTbWvSd+HBKewmUS2PaoijB/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731477537; c=relaxed/simple;
	bh=58Zj/RAabUtlTwQAkz0Hk2Kt2oHJm3YHHdI2Vc0TYpg=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=WTrI9eAhm5KU/5FcTGdHi/J6QPe0QDKLQMYWnbXf3kWH1C0ahNFXXYv6v9JSby8Gd46kSpVUQdP3ILR14m+mR3+kDpBmeX8XOQmw3VLOHDbipBT58KFh+3LO8U/MJrvGep4phdq3CQncQlQ5a2kNbVcnlrrgcPMB/jIxQJxX0gc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=MvsABUAs; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4ACMRRxV006676;
	Wed, 13 Nov 2024 05:58:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=KRFLN7x7+/IRW3WHkmAvrU
	EiFbKLPpwQofXSAgkWA6A=; b=MvsABUAsl6fYnEdttvZQGfC4xexlLT3/ydGZk+
	Vs5JYtVO0sDVAITCg/p2ustCMR5AYNzD1d6MSCPjpMTwyK4fW2BM6PwitR1y95JX
	qYTTPfnHyFdgfcdzJAvII7l51/7DEQcg3BtU4zA7rGVEux6v5U+KBqBSfahHwPl3
	S7Wrxn9ClBOHP+3J8KoweqflVmHnbVTOOk0aqIGNleGSYhr6j028CXHFMS2zy56h
	T3Xl29O71zEbq6cRbrqR5nH7vZOxkkB/3iD9EpnW4prZjgB8R3vy1XR6BNeieQVZ
	1IzSE973JyV4CAepfLnMRS1le3nRyYzDNXS0Jc34Kz4+x5ug==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42sxpqht81-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Nov 2024 05:58:47 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AD5wloq020624
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Nov 2024 05:58:47 GMT
Received: from hu-yrangana-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 12 Nov 2024 21:58:42 -0800
From: Yuvaraj Ranganathan <quic_yrangana@quicinc.com>
To: Thara Gopinath <thara.gopinath@gmail.com>,
        Herbert Xu
	<herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        "Rob
 Herring" <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        "Conor
 Dooley" <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        "Konrad Dybcio" <konradybcio@kernel.org>,
        Bhupesh Sharma
	<bhupesh.sharma@linaro.org>
CC: <linux-crypto@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <quic_yrangana@quicinc.com>
Subject: [PATCH 0/2] Add QCrypto support for QCS8300
Date: Wed, 13 Nov 2024 11:28:28 +0530
Message-ID: <20241113055830.2918347-1-quic_yrangana@quicinc.com>
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
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: lrTpJWwPz32wdtsmGPbhJdUIL9nMs6-s
X-Proofpoint-ORIG-GUID: lrTpJWwPz32wdtsmGPbhJdUIL9nMs6-s
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 bulkscore=0
 lowpriorityscore=0 malwarescore=0 spamscore=0 mlxlogscore=726 phishscore=0
 suspectscore=0 impostorscore=0 mlxscore=0 priorityscore=1501 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2411130051

Document QCS8300 support for QCrypto driver and add QCE 
and Crypto BAM DMA nodes.

This series depends on below patch series:
https://lore.kernel.org/all/20240925-qcs8300_initial_dtsi-v2-0-494c40fa2a42@quicinc.com/ - Reviewed

Signed-off-by: Yuvaraj Ranganathan <quic_yrangana@quicinc.com>
---
Yuvaraj Ranganathan (2):
  dt-bindings: crypto: qcom-qce: document the QCS8300 crypto engine
  arm64: dts: qcom: qcs8300: add QCrypto nodes

 .../devicetree/bindings/crypto/qcom-qce.yaml  |  1 +
 arch/arm64/boot/dts/qcom/qcs8300.dtsi         | 24 +++++++++++++++++++
 2 files changed, 25 insertions(+)

-- 
2.34.1


