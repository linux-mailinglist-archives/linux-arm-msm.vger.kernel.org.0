Return-Path: <linux-arm-msm+bounces-43583-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 62E969FDFAD
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Dec 2024 16:24:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 428591882208
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Dec 2024 15:24:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4ED081991CA;
	Sun, 29 Dec 2024 15:24:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="GINIoZTI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 757A6198822;
	Sun, 29 Dec 2024 15:23:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735485840; cv=none; b=aUrEmRVNyYSA4YFmm843+AZ83GFTHn3+dceGqwowgZy5YhQLma4QKrml1GDVku7nxZvT3jJ70F/a+GvPbbbIBGZOObPOWaCTiU5/Me7Cau5zuipgG7CO3bBHXmUgYoDmrVKsRQxotXQ5GBGhxmwGS4cnHyjzHP4oN1X5fra6Ta8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735485840; c=relaxed/simple;
	bh=DlM31QpFRDoiQX/MKare8OBofU8mu50iw5DgWQKsDGk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kNaMWzj0G3KGQ/FWstdr2G52gmE9P0EtmnPHQHHx7WQ3oiJac+3mBsD9wVoP8G+SV4VrgafQaqp0DbTszho6Nf/+8nFtJYVlrNo7gB2tQODDUr6chYyVDGGDIeclT17PTKmwr4T88DsL/gQr9vTQUf5/bW4a+N0/15WgnC23nwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=GINIoZTI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BTFGDQ3004502;
	Sun, 29 Dec 2024 15:23:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=D7VrQHP03Ko
	sO8TfO9a1+cRPMeJr8Z2/vRw7wFVMcEA=; b=GINIoZTIEhqPKhjqH2SNT9Vmkxn
	+3GEbtp2gCDO0kkRo3djlOJ0hBJElTpS/Qfvj0AVwJsEwOObIekh2Ksn0/8KgrU+
	4U+DC+4AadsUilqC4NEtsnm2i4MnTcx6DtlieTCYiLKwf8PFlFETwfV7+oMiCoF+
	Wz1laXWH7B08ZUQa1lqTuNxrdFMWI0GTzlGejxZx9wUAq6VxJT4j69OLHFUmPVWb
	N1CAkJLKUD7e8JPbtZw7Q4nGfXc5irLBe889hpXM66kLbVDH2IQP2wSM3+Z8UoQF
	BkDDMuLuipwvtDLFSI2NCaG9kyAvjKT6voTgKJ6J/hQgEcY6ZN7ItLVT3Rw==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43t71e1ju3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 29 Dec 2024 15:23:40 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 4BTFNaxx004491;
	Sun, 29 Dec 2024 15:23:36 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 43tadkk58b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 29 Dec 2024 15:23:36 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 4BTFNajN004463;
	Sun, 29 Dec 2024 15:23:36 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-wasimn-hyd.qualcomm.com [10.147.246.180])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 4BTFNamc004457
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 29 Dec 2024 15:23:36 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 3944840)
	id 1C054662; Sun, 29 Dec 2024 20:53:35 +0530 (+0530)
From: Wasim Nazir <quic_wasimn@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@quicinc.com,
        Wasim Nazir <quic_wasimn@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v5 2/6] soc: qcom: socinfo: add QCS9075 SoC ID
Date: Sun, 29 Dec 2024 20:53:28 +0530
Message-ID: <20241229152332.3068172-3-quic_wasimn@quicinc.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241229152332.3068172-1-quic_wasimn@quicinc.com>
References: <20241229152332.3068172-1-quic_wasimn@quicinc.com>
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
X-Proofpoint-ORIG-GUID: PpwdTSwNf_4VrlXh-sT_hrkDtOjmYY58
X-Proofpoint-GUID: PpwdTSwNf_4VrlXh-sT_hrkDtOjmYY58
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 phishscore=0 adultscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 suspectscore=0 malwarescore=0 mlxscore=0 mlxlogscore=964 impostorscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412290137

Update soc_id table for the Qualcomm QCS9075 SoC
to represent qcs9075 machine.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Wasim Nazir <quic_wasimn@quicinc.com>
---
 drivers/soc/qcom/socinfo.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/qcom/socinfo.c b/drivers/soc/qcom/socinfo.c
index 62fadfe44a09..174210f3467b 100644
--- a/drivers/soc/qcom/socinfo.c
+++ b/drivers/soc/qcom/socinfo.c
@@ -451,6 +451,7 @@ static const struct soc_id soc_id[] = {
 	{ qcom_board_id(QCS9100) },
 	{ qcom_board_id(QCS8300) },
 	{ qcom_board_id(QCS8275) },
+	{ qcom_board_id(QCS9075) },
 	{ qcom_board_id(QCS615) },
 };

--
2.47.0


