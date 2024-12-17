Return-Path: <linux-arm-msm+bounces-42472-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C89F9F4478
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Dec 2024 07:55:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 167C9188EB3B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Dec 2024 06:55:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E54951E00BE;
	Tue, 17 Dec 2024 06:49:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="D1hA4CML"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 605C61990CD;
	Tue, 17 Dec 2024 06:49:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734418163; cv=none; b=tL5l5hPk0s7vWRrHF0In+sPyr49+TkMu2pRN3TRK/UbO9X2BccSdxZYcimdOWKuduUuNs3cBJQ1ETGb6Zbm45GI+J6NK7UYfHHkliP/WYqtg6F+agGFZ0gpZHnM7ZUN8Z2KMso3AqsAI2u3RUtaVh0C5xW/kZgaYY4ayeo1NVH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734418163; c=relaxed/simple;
	bh=DlM31QpFRDoiQX/MKare8OBofU8mu50iw5DgWQKsDGk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pti6NIAqqc63v+Nx/N3LYiytnMpZtUzfYuVH3tasP5G9G74hu1NZQPyeEvCCIbXZqmN89iOE1nYcTxa+4Ca+i6uaExnBKRX8Y76gzdFWoXnRs4arBHT6xfIa0j0lrHL/Fr4RB5RCZ+lUdfK7YZc9f6Pd8LBEwu/7QyYZxPxGSSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=D1hA4CML; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BH5flUb001374;
	Tue, 17 Dec 2024 06:49:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=D7VrQHP03Ko
	sO8TfO9a1+cRPMeJr8Z2/vRw7wFVMcEA=; b=D1hA4CML+wPL+LoAmNW5iwaUAfA
	IK0ioXSLWAFJSC4XNwjLwG3Apxl1h/Zfp9vs6IIG4EU944vp2vgoOxoUWAheJyTy
	VLbn3D3N3iv901gkd6T5UNVqwnFA/3fpoaTNcvUCbPx/WnCkN0aSnq2rToTSyiym
	cdfeiobeZD6+x10NbMw8HJJOlIOPZ8qcXcuQsogIqKrvCzlXs47wUjElqsRwxihJ
	FQezx4s8yDIN3GWbbTm+4ZJimtNG5xBw2BEqSYhTMvCzKYoth0BKzK1trjx27Ujr
	NIHP4IBpVFb3wE5XAZ9uk5fCW9tOlKivQ6ioeQmJeBkT0TgvlT0lYJ5lKtA==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43k3cgr5e3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Dec 2024 06:49:03 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 4BH6n0oq014906;
	Tue, 17 Dec 2024 06:49:00 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 43h33kx8y0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Dec 2024 06:49:00 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 4BH6n025014873;
	Tue, 17 Dec 2024 06:49:00 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-wasimn-hyd.qualcomm.com [10.147.246.180])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 4BH6mxUt014867
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Dec 2024 06:49:00 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 3944840)
	id F20185AB; Tue, 17 Dec 2024 12:18:58 +0530 (+0530)
From: Wasim Nazir <quic_wasimn@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        kernel@quicinc.com, Wasim Nazir <quic_wasimn@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v4 2/7] soc: qcom: socinfo: add QCS9075 SoC ID
Date: Tue, 17 Dec 2024 12:18:51 +0530
Message-ID: <20241217064856.2772305-3-quic_wasimn@quicinc.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241217064856.2772305-1-quic_wasimn@quicinc.com>
References: <20241217064856.2772305-1-quic_wasimn@quicinc.com>
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
X-Proofpoint-GUID: kVO4_xVpEukHpjaCZBqlKPg5nk_9pZM6
X-Proofpoint-ORIG-GUID: kVO4_xVpEukHpjaCZBqlKPg5nk_9pZM6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 adultscore=0
 impostorscore=0 spamscore=0 mlxscore=0 phishscore=0 mlxlogscore=999
 clxscore=1011 bulkscore=0 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412170054

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


