Return-Path: <linux-arm-msm+bounces-22292-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 820659038FD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Jun 2024 12:36:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 36A761F232C7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Jun 2024 10:36:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE9B317B509;
	Tue, 11 Jun 2024 10:35:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="SIahFcbe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 783C117B4FA;
	Tue, 11 Jun 2024 10:35:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718102115; cv=none; b=F86POzK1k8eduQBLfiYfkmCyrPb2ej5P13jaa/68Om+1Vef4t9hekKrDxF3RH3U7ikSYLaWN+eGJ/MfRHG4HFXNHPXWGDxNHNCNsHPHDvp4iyeNsUlwHgq2XLBxp4ByqrPCnTdn+wfYrU+tLI9gax7wmI6l8h2wOzBQYGT3/psY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718102115; c=relaxed/simple;
	bh=bYGgHG4oyRUEuGjdFPwWZutTlGFzu9y8RVgI/M0Ywtw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fXdY2VyIbSkroCoVjh+gUbM+liqpdUTAzEtXNE0VoWs32WLqBvMqlmSrRwMGFf6/HCaJhi3sTacO1FQEl5ufa06eNsrPyl8Y9aw6z0PvdeqTtmA5k0Y060UERD06AzB8m1hvuM1OLO7SDZo8GUhupgEwD96jWz9zQQwJsNoie9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=SIahFcbe; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45B9cFP2013675;
	Tue, 11 Jun 2024 10:35:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AjsVIz967nMLKj4Q+hnap8FVCEW1P1h6rFx0SeICFEg=; b=SIahFcbeE+rkdpZp
	9eUyaPNuT/lBI0DDyFFuOXG09U99dLLksWUT1fOT4HFEGKmaFk34QiDYN2ot11PL
	uoCXHksqXSQYFRnkBTvLwYZLGhjOl8ICObe4wQNoc9Nr8hNvvfNTBvmfdVZz18J7
	3cBVlHJjpF9gZRqPLxS4+nVBoLIiw5OdwU/gBhdzSj9jaiA/oeufjyu3bvEnO3WO
	A+76IIgsGfgnnlj46iuuM0ORcSkczbxNzg/8DDUABMyYdQaZvxdQI3y6Bnkc9zin
	nm6446HGw8xZnjquLxt0LPP5zJ7p1lCw4sN71FRm4eA91wzEamYuBSGG4kvkHDfK
	WuHimg==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ypm458483-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Jun 2024 10:35:09 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45BAZ8QS003127
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Jun 2024 10:35:08 GMT
Received: from hu-ekangupt-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 11 Jun 2024 03:35:05 -0700
From: Ekansh Gupta <quic_ekangupt@quicinc.com>
To: <srinivas.kandagatla@linaro.org>, <linux-arm-msm@vger.kernel.org>
CC: <gregkh@linuxfoundation.org>, <quic_bkumar@quicinc.com>,
        <linux-kernel@vger.kernel.org>, <quic_chennak@quicinc.com>,
        stable
	<stable@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v5 5/7] misc: fastrpc: Fix memory leak in audio daemon attach operation
Date: Tue, 11 Jun 2024 16:04:38 +0530
Message-ID: <20240611103442.27198-6-quic_ekangupt@quicinc.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240611103442.27198-1-quic_ekangupt@quicinc.com>
References: <20240611103442.27198-1-quic_ekangupt@quicinc.com>
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
X-Proofpoint-GUID: LtLN2xPk5QBgrEbDieJ1Iw1xNddgkm5B
X-Proofpoint-ORIG-GUID: LtLN2xPk5QBgrEbDieJ1Iw1xNddgkm5B
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-11_06,2024-06-11_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 impostorscore=0 mlxlogscore=999 phishscore=0 malwarescore=0 suspectscore=0
 bulkscore=0 spamscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406110080

Audio PD daemon send the name as part of the init IOCTL call. This
name needs to be copied to kernel for which memory is allocated.
This memory is never freed which might result in memory leak. Free
the memory when it is not needed.

Fixes: 0871561055e6 ("misc: fastrpc: Add support for audiopd")
Cc: stable <stable@kernel.org>
Signed-off-by: Ekansh Gupta <quic_ekangupt@quicinc.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/misc/fastrpc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index 96c19f4919fe..1ba85c70e3ff 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -1320,6 +1320,7 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
 		goto err_invoke;
 
 	kfree(args);
+	kfree(name);
 
 	return 0;
 err_invoke:
-- 
2.43.0


