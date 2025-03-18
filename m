Return-Path: <linux-arm-msm+bounces-51700-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A6794A67018
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Mar 2025 10:44:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EF464188E792
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Mar 2025 09:44:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8C63207A0D;
	Tue, 18 Mar 2025 09:44:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="GAV+Q6NI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D0481F4C90;
	Tue, 18 Mar 2025 09:44:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742291048; cv=none; b=h5OLYkfHJJyGIltjbBpWu7Lm/U9EIVPImnmcqdFO1YMYfKlQzHo/btEEFYCxrfPtX9r82bqWCtKj5KhIqUa5OpkvJTNvTuoyqUn0zjV9H05FyGnsCpzA9+hbSHUP3uX6/BxlXy61Y41Dmkf2/E9JRFNdn2Lj5y++iR4ayL2SH+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742291048; c=relaxed/simple;
	bh=JjVAJWfNcUmUHfZDuG775cDyTvwRyadV+Hxz6xa70C0=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=VKm1dOU6faHLibY3QbU1lxDJYj+mcVLPmorEDp268UKkVAnHupsdblgWcwmcdGXjKtgGKX7PnJhdBVDkaLl4MSob1YS8O1IAiCtqD5szcYmYwH80FsKGTpZdeFW3F8VE0K0kkUbejcGn0+dC7AmY38LdHABUw7+V/iBUgmxB2DY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=GAV+Q6NI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52I8pWub019356;
	Tue, 18 Mar 2025 09:43:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=hYUQroS/oLSOh5hulogfyJ
	nLYKTD2nX6fZSPa1jF3dQ=; b=GAV+Q6NIgXlo453i7qu23rK18IqCuyZuW6dfbY
	rGOrA+O5rb9TKb32hOIaUj5/IcRy4S6xIS39b4RkdxTH40npLyvcmGtKHpdjGIWb
	ATNlnWA4la763EsRUqHQd4rHoQCeiuW7e0eZqaozXwvFjmPL0o7LbmPuitCaKWde
	lnAJnK8aLiouNdad+lXgMxmtlbR3buqi1qoTt2ubdOx1493Qd+yoqSXdTmEDzXMM
	qt0tlM+N5YQnaAaCzx9DO4SCqUVj/p44a4+0kACeOdiWvCLT6wUvrj737AfvO6+R
	RONLNeYVXw2y083xNNtrRxJ5nYN8hfUsuyTtTOTcpTSX2bhg==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45d1utynfe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Mar 2025 09:43:54 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 52I9hrg2021680
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Mar 2025 09:43:53 GMT
Received: from hu-arakshit-hyd.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 18 Mar 2025 02:43:48 -0700
From: Abhinaba Rakshit <quic_arakshit@quicinc.com>
Subject: [PATCH v2 0/2] Enable Qualcomm Crypto Engine for QCS615
Date: Tue, 18 Mar 2025 15:13:22 +0530
Message-ID: <20250318-enable-qce-for-qcs615-v2-0-c5e05fe22572@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADpA2WcC/4WNQQ6CMBBFr0Jm7ZjSUjCuvIdhgdOpTKKttEo0h
 LtbuYCrn/eT//4CmZNwhmO1QOJZssRQQO8qoHEIV0ZxhUErbZXWDXIYLjfGiRh9TCVzW1t0bIY
 DGaus01C2j8Re3pv33BceJT9j+mw3c/1r/xnnGhVyR21rTdMx+9P0EpJAe4p36Nd1/QLREtryv
 AAAAA==
X-Change-ID: 20250224-enable-qce-for-qcs615-de3a8c3505d2
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
        "Konrad Dybcio" <konradybcio@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-crypto@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        "Abhinaba
 Rakshit" <quic_arakshit@quicinc.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=H8Pbw/Yi c=1 sm=1 tr=0 ts=67d9405a cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=mX54yU45kmd6GtLZQYwA:9
 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: GYs2seRQbdHK41dShdBuKuOjtj8NwW28
X-Proofpoint-ORIG-GUID: GYs2seRQbdHK41dShdBuKuOjtj8NwW28
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-18_04,2025-03-17_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=720
 lowpriorityscore=0 bulkscore=0 adultscore=0 spamscore=0 priorityscore=1501
 mlxscore=0 suspectscore=0 malwarescore=0 clxscore=1015 impostorscore=0
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503180070

Document QCS615 support for QCrypto driver and add QCE
and Crypto BAM DMA nodes.

This patch series depends on the below patch series:
https://lore.kernel.org/all/20241104-add_initial_support_for_qcs615-v5-0-9dde8d7b80b0@quicinc.com/ - Reviewed

Signed-off-by: Abhinaba Rakshit <quic_arakshit@quicinc.com>
---
Changes in v2:
- Remove additional entry for iommu.
- Align interconnects.
- Link to v1: https://lore.kernel.org/r/20250224-enable-qce-for-qcs615-v1-0-e7c665347eef@quicinc.com

---
Abhinaba Rakshit (2):
      dt-bindings: crypto: qcom-qce: document QCS615 crypto engine
      arm64: dts: qcom: qcs615: add QCrypto nodes

 .../devicetree/bindings/crypto/qcom-qce.yaml       |  1 +
 arch/arm64/boot/dts/qcom/qcs615.dtsi               | 23 ++++++++++++++++++++++
 2 files changed, 24 insertions(+)
---
base-commit: 50a0c754714aa3ea0b0e62f3765eb666a1579f24
change-id: 20250224-enable-qce-for-qcs615-de3a8c3505d2

Best regards,
-- 
Abhinaba Rakshit <quic_arakshit@quicinc.com>


