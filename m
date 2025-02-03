Return-Path: <linux-arm-msm+bounces-46684-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A4965A25148
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Feb 2025 03:44:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 30D041639E3
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Feb 2025 02:44:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E3E03594B;
	Mon,  3 Feb 2025 02:44:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="H645HdA1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D29029405;
	Mon,  3 Feb 2025 02:44:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738550683; cv=none; b=H+GMfZ56wG7CTYyDnmDWuJzh+JRM0b7PODIvIS5QltC0dtoTMz4ga61AI5QJHIjXQJs2pqTkG0LnFOOdnj0zvFCQfoDLKNsyEZhHm2I83I0euTylgiYMADI27sAFe80eqsnfy+vyNdiZNZIMNTg1h1LOk63jgHmuNsaxl1/asqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738550683; c=relaxed/simple;
	bh=mP85TRSOYJ68KUjP9bEbg6dGMH1vo4qmFD3Pw+bKql0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=cJOYTfuDbYFcaF7Uu68Sw8qLMydIHDFZQ10/YKnAQlDetSlAwgmeHwqEDtmu0gUsTU2ZiMgMMuWPs2uh8i3DKSSg59iP+b9X0X6ss5nBIke44xgrmJqJNTiFTqc85bpBxiv47294f8nKPfE81Y6jDrfmp0Sg1ohlSXlcdt6e1hY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=H645HdA1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51313eIb028271;
	Mon, 3 Feb 2025 02:44:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zFyZLn6SvxmCFmq/OoLwdSWtYoNkhVjWf28D0CGpVLU=; b=H645HdA1sXxZxD45
	xo6QfcW80xgjodU21Glbs0av5kw2BULE+yB4BUzwRTHAfVOkzEpVvfHut8HzPimv
	xRqlvGXWRBppS5zHFNiUH9SaQYQcBv3W0iop4W0RWl/bSvJXreGkOpXvu/r7VKUM
	hmFETiV9W5UPAP55TacX4iaU1UPfaNOAwYsbzb0cnHcjWPMugJlMmI6pFDSSJ7mT
	2whpXzk9mZUlGFsgergtW1Myy6ypysOxCOcsNyRpJSLRiHL+m4uBs3ZVLRZN3Y4t
	VT3+wFMfgVokSJOdYRj2yoOZPZJRCxTdpUM6f8fUZmFExzUJtp7UKr4AZD6XNcWX
	fxHaIw==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44jkt9g3dv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 03 Feb 2025 02:44:23 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5132iM8m020176
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 3 Feb 2025 02:44:22 GMT
Received: from hu-azarrabi-lv.qualcomm.com (10.49.16.6) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Sun, 2 Feb 2025 18:44:22 -0800
From: Amirreza Zarrabi <quic_azarrabi@quicinc.com>
Date: Sun, 2 Feb 2025 18:43:29 -0800
Subject: [PATCH v2 1/8] tee: allow a driver to allocate a tee_device
 without a pool
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250202-qcom-tee-using-tee-ss-without-mem-obj-v2-1-297eacd0d34f@quicinc.com>
References: <20250202-qcom-tee-using-tee-ss-without-mem-obj-v2-0-297eacd0d34f@quicinc.com>
In-Reply-To: <20250202-qcom-tee-using-tee-ss-without-mem-obj-v2-0-297eacd0d34f@quicinc.com>
To: Jens Wiklander <jens.wiklander@linaro.org>,
        Sumit Garg
	<sumit.garg@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        "Konrad
 Dybcio" <konradybcio@kernel.org>,
        Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Bartosz
 Golaszewski" <bartosz.golaszewski@linaro.org>,
        Srinivas Kandagatla
	<srinivas.kandagatla@linaro.org>
CC: <linux-arm-msm@vger.kernel.org>, <op-tee@lists.trustedfirmware.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-doc@vger.kernel.org>,
        Amirreza Zarrabi <quic_azarrabi@quicinc.com>
X-Mailer: b4 0.13.0
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: mfVEeAvDYsJ8WlIBWtTrzB0meYFWQ5BS
X-Proofpoint-GUID: mfVEeAvDYsJ8WlIBWtTrzB0meYFWQ5BS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-02_11,2025-01-31_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 bulkscore=0
 lowpriorityscore=0 malwarescore=0 mlxlogscore=999 adultscore=0
 clxscore=1011 priorityscore=1501 suspectscore=0 phishscore=0
 impostorscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2501170000 definitions=main-2502030021

A TEE driver doesn't always need to provide a pool if it doesn't
support memory sharing ioctls and can allocate memory for TEE
messages in another way. Although this is mentioned in the
documentation for tee_device_alloc(), it is not handled correctly.

Signed-off-by: Amirreza Zarrabi <quic_azarrabi@quicinc.com>
---
 drivers/tee/tee_core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/tee/tee_core.c b/drivers/tee/tee_core.c
index d113679b1e2d..24edce4cdbaa 100644
--- a/drivers/tee/tee_core.c
+++ b/drivers/tee/tee_core.c
@@ -888,7 +888,7 @@ struct tee_device *tee_device_alloc(const struct tee_desc *teedesc,
 
 	if (!teedesc || !teedesc->name || !teedesc->ops ||
 	    !teedesc->ops->get_version || !teedesc->ops->open ||
-	    !teedesc->ops->release || !pool)
+	    !teedesc->ops->release)
 		return ERR_PTR(-EINVAL);
 
 	teedev = kzalloc(sizeof(*teedev), GFP_KERNEL);

-- 
2.34.1


