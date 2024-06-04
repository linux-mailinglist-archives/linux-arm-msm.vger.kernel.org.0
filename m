Return-Path: <linux-arm-msm+bounces-21535-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A7EA78FA6C7
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Jun 2024 02:06:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D8D551C20CBB
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Jun 2024 00:06:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94A4E384;
	Tue,  4 Jun 2024 00:06:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Q3lZ9Yfk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F282182;
	Tue,  4 Jun 2024 00:05:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717459560; cv=none; b=dPggZF+j02yBduPrIlKsoF/JQL9r4LBaJm7xuatLo7h9EmuzNyz7TK9QzSPYsMNQy9+8yz/JI3k1KwE068M0pcXt9N8SA1Bi+8v386FJN5o3HKjuzdELxaS/hJmYxeZ9O6Z9SXWqnZKolMMkJaov+CtZ8V5o6irBUfKggaZlIi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717459560; c=relaxed/simple;
	bh=j0nF7ADODImM9Cfnq5GgJqbOHUZoLRsYTxdfwFz1U60=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:To:CC; b=YKhjdpobT1H5MVszrLhAyf7oRUq7Fc10tVWHv4+ZAQDqyCJoNfqiIjGd/tgO+DRC2h9Rjt72QEFb8M0nt88dEGiTQTYBSQsZvWPY0HsKWP1wTFS1eWIGaOBSAIYc7ja4cFybjB9rVpg0UKVOgv8Zhc5V3Y5TVDK03COWxv0xK0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Q3lZ9Yfk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 453Al0j5028503;
	Tue, 4 Jun 2024 00:05:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=EG/QHkE24sHkuSw4V9knlw
	9CucxtvaMSyy5jjsq1/HU=; b=Q3lZ9YfkHdN7gwdRrfkkGQFPznH8aiqmNQCVSu
	MmeyzQ0wdOndl1UUTStTFjC8mXNTxNGkAtg+1oddJ6cwZYQ9EOKYH3mqx7l3cRMM
	//kwHuZw80BQ9MijkIx1U6pHjElEMmAKtsvOGnPd4gwJ6oLUp4HPSbOxJ/0KoJ/l
	w3WSKQqYizafARaTTGzNjpnK5PBCo2mA8ufbgWlM/b4oymBoeF7QIYCaiW/sJqdm
	WobRjykUH20kkGYTilwN6lDAgfrJCAVahPK+62w3H8dH8pGvtVC3xJoROoV7tRF7
	0bS72FsXFmnNBz64c0XSo8i30WaLccSmCve45PbyOnNCvZHA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yfw4d5fem-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 04 Jun 2024 00:05:55 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 45405sV0023357
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 4 Jun 2024 00:05:54 GMT
Received: from [169.254.0.1] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 3 Jun 2024
 17:05:48 -0700
From: Jeff Johnson <quic_jjohnson@quicinc.com>
Date: Mon, 3 Jun 2024 17:05:44 -0700
Subject: [PATCH] mfd: qcom-pm8008: add missing MODULE_DESCRIPTION() macro
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240603-md-drivers-mfd-qcom-v1-1-88e48013eccc@quicinc.com>
X-B4-Tracking: v=1; b=H4sIAFdaXmYC/32OSw6CMBCGr0K6dkxbFNCV9zAsynSQSaRICw2Gc
 HcLB3D55X+uIpBnCuKercJT5MCDS6BOmcDOuBcB28RCS32RhVTQW7CeI/kAfWthxKEHmZdo9K2
 oJJJIyY+nlpej9VknbkwgaLxx2O1db3bzAr0JE/nd3nGYBv89PkS1h/7PRQUK0FY56Ss2ZWEf4
 8zIDs9JFfW2bT+JUvSl1wAAAA==
To: Lee Jones <lee@kernel.org>, <kernel@quicinc.com>
CC: <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <kernel-janitors@vger.kernel.org>,
        Jeff Johnson <quic_jjohnson@quicinc.com>
X-Mailer: b4 0.13.0
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: vpGSJGNQIUTUM6q87W-1fn9GAS2ZrjFs
X-Proofpoint-GUID: vpGSJGNQIUTUM6q87W-1fn9GAS2ZrjFs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-06-03_17,2024-05-30_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 mlxscore=0 adultscore=0 impostorscore=0 bulkscore=0
 spamscore=0 phishscore=0 clxscore=1015 mlxlogscore=999 suspectscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406030195

make allmodconfig && make W=1 C=1 reports:
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/mfd/qcom-pm8008.o

Add the missing invocation of the MODULE_DESCRIPTION() macro.

Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>
---
 drivers/mfd/qcom-pm8008.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mfd/qcom-pm8008.c b/drivers/mfd/qcom-pm8008.c
index 3ac3742f438b..4aadf2ba8194 100644
--- a/drivers/mfd/qcom-pm8008.c
+++ b/drivers/mfd/qcom-pm8008.c
@@ -210,4 +210,5 @@ static struct i2c_driver pm8008_mfd_driver = {
 };
 module_i2c_driver(pm8008_mfd_driver);
 
+MODULE_DESCRIPTION("QCOM PM8008 Power Management IC driver");
 MODULE_LICENSE("GPL v2");

---
base-commit: 83814698cf48ce3aadc5d88a3f577f04482ff92a
change-id: 20240601-md-drivers-mfd-qcom-037ca29680ce


