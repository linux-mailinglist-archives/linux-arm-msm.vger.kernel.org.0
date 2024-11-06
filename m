Return-Path: <linux-arm-msm+bounces-37107-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 913A59BDF54
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Nov 2024 08:24:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 184DBB21D78
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Nov 2024 07:24:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76B731CC14B;
	Wed,  6 Nov 2024 07:24:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="C6Qo8LJX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDFFB192580;
	Wed,  6 Nov 2024 07:24:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730877859; cv=none; b=MpD7ECtOi8lbp50q41bxbx8gBiiD8K6F2zFNqtpGPSW8tT0v1V5wPk8FmAr2WU8vin//LsPmIrQjb1xMZIXSGpRxYX8XB2YFpcHxEJvoi2nJz21Nob4DbJhFCx9SP0QxMu/gE8BFvpTvzDQzD1KeBKeEN2Dukfw6bRtV89VcUOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730877859; c=relaxed/simple;
	bh=ICkU33ZuvTHMbJPuStnFSL5tudikUcEnea5QF+5Ao2Y=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=KLqw+Ixvcz+AZcQX6bggBs8LNfOVK5M1GDyAgB2/t2Iyn3/CWImdWtSP9ipQV0ABujQ7sbcJY3CbDqdoTkMtFqh0aTMSGE+j9s9GZMbX3fEUbV5YnKKSgYZeuj1mEn7ooseJkXYW1ugOH4RSDnirZBloBKa9bpQRAF1jzbN4RTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=C6Qo8LJX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A662pIj024488;
	Wed, 6 Nov 2024 07:24:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=itJYgGhc6H+lPelkky49wCyjosmLYrewr5s
	RFxv5M3o=; b=C6Qo8LJXGvoQRVQqaGfWOJ6zB6Su+vxiJs/2EOJaSOqJlcq/p4f
	ocXyYnJbVkESojmEmPOTHhonERkNeiF2SVbCh00CGkoCeG/GOSY918j3DTTwwNeB
	wLLjerhUdU2BX0JdtMCXo7jU6FKSqlZ6ssfEVjsqx5shyCFKwMBokYqP39nFo2jO
	y66LNA//S4MpqT+Q+5LH4gPr/SsqUsWxoS9jK2YWi+pbxFe6MeGZNUTlWajq8FvC
	/K25qX8v6HeHO7Y7pLSKfzwvwPQuMurimnfmyWdSXxyugq3k/1sPSCfhGCLCBk6x
	Z2WagcYRr10zvE4Lo8wZE+BZ0tbpj1w+HAw==
Received: from aptaippmta01.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42r2ugr7fj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 06 Nov 2024 07:24:13 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 4A67OAwU025643;
	Wed, 6 Nov 2024 07:24:10 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 42nd5ktsg7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 06 Nov 2024 07:24:10 +0000
Received: from APTAIPPMTA01.qualcomm.com (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 4A67OAZ9025627;
	Wed, 6 Nov 2024 07:24:10 GMT
Received: from cse-cd02-lnx.ap.qualcomm.com (cse-cd02-lnx.qualcomm.com [10.64.75.246])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 4A67O9Ta025622
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 06 Nov 2024 07:24:10 +0000
Received: by cse-cd02-lnx.ap.qualcomm.com (Postfix, from userid 4571896)
	id 3A561159C; Wed,  6 Nov 2024 15:24:08 +0800 (CST)
From: Yuanjie Yang <quic_yuanjiey@quicinc.com>
To: ulf.hansson@linaro.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, bhupesh.sharma@linaro.org, andersson@kernel.org,
        konradybcio@kernel.org
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        quic_tingweiz@quicinc.com, quic_yuanjiey@quicinc.com
Subject: [PATCH v2 0/2] Enable emmc and SD on QCS615
Date: Wed,  6 Nov 2024 15:23:41 +0800
Message-Id: <20241106072343.2070933-1-quic_yuanjiey@quicinc.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: j22MSu0qUuoGf_BdjosQz7h0rJyI9vVh
X-Proofpoint-GUID: j22MSu0qUuoGf_BdjosQz7h0rJyI9vVh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 adultscore=0 mlxscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 clxscore=1015 impostorscore=0 malwarescore=0 bulkscore=0 mlxlogscore=999
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411060059

Add SDHC1 and SDHC2 support to the QCS615 Ride platform. The SDHC1
and SDHC2 of QCS615 are derived from SM6115. Include the relevant
binding documents accordingly. Additionally, configure SDHC1-related
and SDHC2-related opp, power, and interconnect settings in the device
tree.

Signed-off-by: Yuanjie Yang <quic_yuanjiey@quicinc.com>
---
This patch series depends on below patch series:
https://lore.kernel.org/all/20241104-add_initial_support_for_qcs615-v5-0-9dde8d7b80b0@quicinc.com/
https://lore.kernel.org/all/20241105032107.9552-1-quic_qqzhou@quicinc.com/

Changes in v2:
- Improve the commit messages and cover letter
- Remove applied patches 1
- Pad sdhc_1 node and sdhc_2 node register addresses to 8 hex digits
- Adjust sdhc_1 node and sdhc_2 node register addresses to hexadecimal
- Modify sdhc_2 vqmmc-supply incorrect power configuration
- Link to v1: https://lore.kernel.org/all/20241023092708.604195-1-quic_yuanjiey@quicinc.com/

---
Yuanjie Yang (2):
  arm64: dts: qcom: qcs615: add SDHC1 and SDHC2
  arm64: dts: qcom: qcs615-ride: Enable SDHC1 and SDHC2

 arch/arm64/boot/dts/qcom/qcs615-ride.dts |  31 ++++
 arch/arm64/boot/dts/qcom/qcs615.dtsi     | 198 +++++++++++++++++++++++
 2 files changed, 229 insertions(+)

-- 
2.34.1


