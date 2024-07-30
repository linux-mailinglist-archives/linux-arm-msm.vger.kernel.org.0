Return-Path: <linux-arm-msm+bounces-27439-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C76F19422BF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Jul 2024 00:25:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 23A54B24B9A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jul 2024 22:25:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B6C21917D2;
	Tue, 30 Jul 2024 22:24:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="YE2Wx0hv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F389190473;
	Tue, 30 Jul 2024 22:24:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722378290; cv=none; b=poNh84Y8c8YluctE345DTkxTA4dCUUWVZ55G9sQkze2VlWnMMgFMMFQ3wLiU2uPTrqBJlNSw6mnL2WAvoYuFxu7moIwUgdV+65c6ROdugZUBkb7lrzQSmRqvG8/bpPem67+G504GFOE/UnIgOM2D8ldFhF2UdcY1CTlA4rHx3Mw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722378290; c=relaxed/simple;
	bh=0Gj6H1jOlOfU5UVOS1YT+FMw9OJ5sKI01pvc4Z2DW1s=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=AenDpqOBpDbeiSu2+AY5Jiscr7EdNU8qQjyx48KyKTv2/lvcEyZKRPgjv/1a+nd1RYWCesiRGyqDHNBWAMILk2vIlGQopij39j4URZA36yjUdB2bLkfoRoRx3cnr71fhcDoD0mN4rGal2uWSl7NB/HL9FJULYZ7jzZ8j1PlzO10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=YE2Wx0hv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46UG4rMp030486;
	Tue, 30 Jul 2024 22:24:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:date:from:in-reply-to:message-id:references:subject:to; s=
	qcppdkim1; bh=xDPdkuyTGvyNl4qFhebrGhY4p1c5X1GNl439JhdPb9U=; b=YE
	2Wx0hvtp4lrGg0sjKNBQwNBn43ko0Aal1m79sNXDE94EAPFqguHCNXazNH8SJt16
	z6eSP6bIHlJeuzRlXk5Ww2fSaHTu2sqg6TmR0BuDCkGHD32R6L4MHgdOzHLHKyVL
	mDB7qFnHyNSY6CB/y8FxEXkUIxp0Q8Ehd8XWkFr150v+1rcDohB20E+inUEbtxAL
	Z7vNGcVZVK5pxIb7Cmmv0tqzDr6xrBPxsg1SJKcKgZ2BXUROYVZGfhTOydDibVNV
	pwM02AKlUtlEToQ76Ro39Zc9a0/BcMyGph/eFuppOkT4lT8Bny8NRLO77rQlDstD
	Q2ETpfk0giIRu+uEBLOw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40pw442bm5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 30 Jul 2024 22:24:44 +0000 (GMT)
Received: from pps.filterd (NALASPPMTA03.qualcomm.com [127.0.0.1])
	by NALASPPMTA03.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTP id 46UMIaQY016176;
	Tue, 30 Jul 2024 22:24:42 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by NALASPPMTA03.qualcomm.com (PPS) with ESMTPS id 40pghqm6yu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Tue, 30 Jul 2024 22:24:42 +0000
Received: from NALASPPMTA03.qualcomm.com (NALASPPMTA03.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 46UMOgj1025851;
	Tue, 30 Jul 2024 22:24:42 GMT
Received: from hu-devc-lv-u18-c.qualcomm.com (hu-eserrao-lv.qualcomm.com [10.47.235.27])
	by NALASPPMTA03.qualcomm.com (PPS) with ESMTP id 46UMOg6l025849;
	Tue, 30 Jul 2024 22:24:42 +0000
Received: by hu-devc-lv-u18-c.qualcomm.com (Postfix, from userid 464172)
	id BE36E500592; Tue, 30 Jul 2024 15:24:41 -0700 (PDT)
From: Elson Roy Serrao <quic_eserrao@quicinc.com>
To: andersson@kernel.org, konrad.dybcio@linaro.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, gregkh@linuxfoundation.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        Elson Roy Serrao <quic_eserrao@quicinc.com>
Subject: [PATCH 8/8] usb: misc: eud: Add compatible for sm8450
Date: Tue, 30 Jul 2024 15:24:39 -0700
Message-Id: <20240730222439.3469-9-quic_eserrao@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240730222439.3469-1-quic_eserrao@quicinc.com>
References: <20240730222439.3469-1-quic_eserrao@quicinc.com>
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 3P7LFDZQ8AEaOxgFE5-A4N2y2gNvjRfN
X-Proofpoint-ORIG-GUID: 3P7LFDZQ8AEaOxgFE5-A4N2y2gNvjRfN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-30_18,2024-07-30_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxscore=0
 priorityscore=1501 adultscore=0 mlxlogscore=950 clxscore=1015
 impostorscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2407300154
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>

Add compatible string to enable EUD on sm8450 SoC.

Signed-off-by: Elson Roy Serrao <quic_eserrao@quicinc.com>
---
 drivers/usb/misc/qcom_eud.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/misc/qcom_eud.c b/drivers/usb/misc/qcom_eud.c
index 9a49c934e8cf..465d57c05c3c 100644
--- a/drivers/usb/misc/qcom_eud.c
+++ b/drivers/usb/misc/qcom_eud.c
@@ -315,6 +315,7 @@ static void eud_remove(struct platform_device *pdev)
 
 static const struct of_device_id eud_dt_match[] = {
 	{ .compatible = "qcom,sc7280-eud" },
+	{ .compatible = "qcom,sm8450-eud" },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, eud_dt_match);
-- 
2.17.1


