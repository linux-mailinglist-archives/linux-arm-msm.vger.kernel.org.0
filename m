Return-Path: <linux-arm-msm+bounces-61342-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 90549ADA4ED
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Jun 2025 02:28:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5305116D1C5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Jun 2025 00:28:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 302C61552E0;
	Mon, 16 Jun 2025 00:28:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N6jM/syt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B879A13B59B
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Jun 2025 00:28:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750033711; cv=none; b=NCbJFV+8YOcj+PLGurRDjCxUfb/1gy12KdUec1Sgsf+gAORBQ2wYbxi4HmG02xdC6Hg8rr2l8rkcALeEXfSVn1y4o6X3vvvowsZ75uSPUWGDcZDVHaKtNY5FDx72ZoE9M6rdGKPpguDxVeJJ6zGhtgUGQUb0Ht60kJyLLH761no=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750033711; c=relaxed/simple;
	bh=CyevXooayJgTRHhip0Jc/dJHXf5dF8Ulyrh+9bR9yQI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VY9J0m9vjLlusrThHgRrp5RfBjrrokxQa0KzqVYLIaxv+l7VkWr4MUnsltUsdKcOgwgVa0f+9a5DMS1UIfA+A/P/Nz9pYoHrPFO6s9T/3y56vCwHATxNeI9yLd62saU958uH8vKn+HzSfHSfLZ5nJHoZzYVC83QktpsLb4Mjsk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N6jM/syt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55FMjLST021701
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Jun 2025 00:28:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dDGlOHr4NgcDVCXG2RQ6GCKnY1CV3e4EG2J6GhifJ9w=; b=N6jM/sytFMeGNTKD
	ARV7N7bz0CnHvGuwbMJWaCFnWsoosqBcivtvF9oegs3hu+bbzwNYCciHpWRzm8CT
	irW55+qQuZPZumhJgqPGs/dyVKicn7cW4Fd9Kw9YS6JTNeQZ9tz2vG+Znqq9iAno
	yUlRDKzvofSSG+DWoZCiIKFIie36AzovUgushf2aNuBELAEq8+k+J9pd+RE7T3s7
	C1coJw6RBJtV7hQTbXcuPhTP2X3zlNMaTmxU6n7kzMht7874e/KVv/YbFBjec9kh
	Ux1Gt4g8xL2tJ2/PIctCwHubaHSG/US7hpKd+UAlWDQwJ+P3irEmKAgVrdkx+iiU
	HOMb9Q==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4792c9thn1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Jun 2025 00:28:29 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6fb0e344e3eso32741696d6.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 15 Jun 2025 17:28:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750033708; x=1750638508;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dDGlOHr4NgcDVCXG2RQ6GCKnY1CV3e4EG2J6GhifJ9w=;
        b=SaGkDa265l/Da4Q/nH9RAd+B/wyqB2sVNfB/RtXT7nFPquWKlg4hFJOrVePwVrcYQ/
         +DuDvk3j4k7oiVa5WqrRna3o5IXxPLVGOOLxZ5jJ7bSiQNAa0s1GFLULsX26ZFDEES9t
         1sypPTyCq11CXK4ZjgyVUazBkRiSCwhThDZQRdjbkddvB1dt0d01HFnXpjGM6FUYMeuK
         BzR/p0JSdgJQC+VLJnBSJhC7b7djHDBsOp/mC8fxTk2qf3zwZpfZhrQ1eWbXdQpyfcwl
         X9APZE0WR0fj2M+BXTazhERkGm60dMv8GnT7y2FRShLOhrJXj1hajFIuITasxiowlq5P
         gb4g==
X-Gm-Message-State: AOJu0Yx9QEuxP2JfRDsI5DYiL8r9u2JfMfbJbKyxjM85QPInYYa8Kwnn
	dAANMcvtQouX9qh6ibzFv7VRylG9H4L+elOuvWcTZwqGP7D14oND3ZPdLvg8VdBpJjQG4JJBArg
	NBsTazXwDhi+kvngIGEQbkXoCB4/5nZTuIgYrAh9Llg6irRPoMAPNjWO/vmq4T5DJM4GW
X-Gm-Gg: ASbGnct/X3EOr5YiMr8Bx3nz0ItsXij+Kn9JYvr3yAjwoYh9FSdhZDnAfCfkUlQPCfr
	+dxSJXQZw4/rDhuIzUh41SO4UAGRvExYhaJD8sEVEPH4z/e0Nw6gdeI6KiMKfd35CW2PCJk8Rip
	FuIZB6Sxo20fbDMA9VUSrRE5/n1srSq8YXHxQShta/sE7iL+iCkzWF/1CPOTFp6Jf4iNPXjizZG
	cDo4gLgBTxA6pp2F0NdHGXGolOA0ef+wPkh3ErHqInH6d8SDlskW+IPbZ1gVesLZDWRGHoTC9be
	OkXLWcoqkkW1E7w3aGNTRyvKz3TcfB8QJTk3pn1ewXs39r06qSW6/FSCXPt1VYmOM3ZAzmUxbjv
	dTgWK2bg77UT8Hs1mGdO7hBwYlm26JTjSTJE=
X-Received: by 2002:a05:6214:470a:b0:6fb:4954:846a with SMTP id 6a1803df08f44-6fb4954886dmr91519696d6.3.1750033707808;
        Sun, 15 Jun 2025 17:28:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHt/JZjdIkRHjrhbfDSHfCFDPji9PWUnBm0HXDcW0iTYfjKMfPKMxD5XA4I6dTHJmHeuaSYxQ==
X-Received: by 2002:a05:6214:470a:b0:6fb:4954:846a with SMTP id 6a1803df08f44-6fb4954886dmr91519516d6.3.1750033707402;
        Sun, 15 Jun 2025 17:28:27 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553ac136104sm1334990e87.77.2025.06.15.17.28.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Jun 2025 17:28:25 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 16 Jun 2025 03:28:13 +0300
Subject: [PATCH 01/28] interconnect: qcom: sc8280xp: specify num_links for
 qnm_a1noc_cfg
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250616-rework-icc-v1-1-bc1326294d71@oss.qualcomm.com>
References: <20250616-rework-icc-v1-0-bc1326294d71@oss.qualcomm.com>
In-Reply-To: <20250616-rework-icc-v1-0-bc1326294d71@oss.qualcomm.com>
To: Georgi Djakov <djakov@kernel.org>, Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=814;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=CyevXooayJgTRHhip0Jc/dJHXf5dF8Ulyrh+9bR9yQI=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoT2UheJCO7+4KsyI6UefPVpkp7eVLHpsfkW/8Y
 gH6QLOIvVSJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaE9lIQAKCRCLPIo+Aiko
 1ScPB/0RAK0//iNxH/4+6HAe6bd22Av+Lttd13V1+oqzqJ+YtOIhBJSwlFRTpgY60SRhmWl3mdG
 QHkyMdPnQsVVdWn/IV5O6IH6lC9vB86u/mG4J45dwCFtXfw0F3ERMM3woOIDJeAXlIL/sLLUc/s
 SzG1/fcFTrZsrpPbV5yqHVpkwyBuTaHaIZsUyuakeF0Xa4ToMCFFbnzClf5nTCBOl6ml9rRwp1c
 Y7odSPsFlopOrEP40b/z7XnDx0uznUz6fbqpBCLVUdpCEM48QGcUlec2zF+ItRuGSX1nCwN2fsR
 zM0hX3g6NP7Ub2fhp0v+J4YUKw6GAmWxneORcdBI2GbQdlC0
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: wKaH2iWA0yVjeG_x7aaVwWVDFs3W-Gfh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE2MDAwMSBTYWx0ZWRfX6cmpHUqbePAN
 /DAQdqnKKya1vce/cIBb6ui9lUKRPt9hApqLk2mbUalznfRp1F3mU8+1wNXZu3kT8Vyj6vMbfYS
 wCHDCGJkzziKzKfifhHwioT3OZalLDVomRMj1k6048Lx8hL0XLPizZHWxOipodtIPwnBwHr+5jN
 yV7Vu0TrSIqv2+ayB3lUTbnIQpAenuG91R0tcONhber1E4k8+JFZ38yA2Y5GJIxpBVtTjmvAwZO
 gR9KOlkzBkKPRV/uePfVxVhOj5M/R9Rp57YOZQqKFYYrlAWUp1nDqotYGNz29eVuokfLppjZ57G
 w+exwJY9R+QMKpLn6kV0xVzSQ4m98BDYstPPlhNXJypvFLE9/TrKqsferCKjGzS1oDwhI22ypiu
 L2dG2iIhaaJ7glFhDQ8Qbdrdj+ZdTkxpRl2kwezJFYMU/SnMbf1Cn5OGrR696DaAp3ZYRU/A
X-Proofpoint-ORIG-GUID: wKaH2iWA0yVjeG_x7aaVwWVDFs3W-Gfh
X-Authority-Analysis: v=2.4 cv=etffzppX c=1 sm=1 tr=0 ts=684f652d cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=lLMxHPiN_djQrzgEttIA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-15_10,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 adultscore=0 spamscore=0 malwarescore=0
 priorityscore=1501 suspectscore=0 phishscore=0 mlxlogscore=999
 lowpriorityscore=0 bulkscore=0 mlxscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506160001

The qnm_a1noc_cfg declaration didn't include .num_links definition, fix
it.

Fixes: f29dabda7917 ("interconnect: qcom: Add SC8280XP interconnect provider")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/interconnect/qcom/sc8280xp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/interconnect/qcom/sc8280xp.c b/drivers/interconnect/qcom/sc8280xp.c
index 0270f6c64481a92149cb19556acdc6e2fead39c9..c646cdf8a19bf6f5a581cd9491b104259259fff3 100644
--- a/drivers/interconnect/qcom/sc8280xp.c
+++ b/drivers/interconnect/qcom/sc8280xp.c
@@ -48,6 +48,7 @@ static struct qcom_icc_node qnm_a1noc_cfg = {
 	.id = SC8280XP_MASTER_A1NOC_CFG,
 	.channels = 1,
 	.buswidth = 4,
+	.num_links = 1,
 	.links = { SC8280XP_SLAVE_SERVICE_A1NOC },
 };
 

-- 
2.39.5


