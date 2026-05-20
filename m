Return-Path: <linux-arm-msm+bounces-108831-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cGDqEkLfDWrb4QUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108831-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 18:20:18 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B6911591BF4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 18:20:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D94FF30475F4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 15:58:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D1773403F0;
	Wed, 20 May 2026 15:57:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZFBG2bGv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GyJgx65J"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAF3133F39C
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 15:57:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779292637; cv=none; b=MqNce8ay+jDHfDEOL/OsxAKO8IhiakaKZgMF1LcC3QyO/6CpAm4jXieY+DJupPQVHhyDc57ODIgg/8gK9i5ECWEKGPpJ3FFqy6kaOk5HIEUUO1mw8h4sjg2CBA/sSgE+l2qPvDfoxG0S2B9W6uT5sTXv4Gve2N1f7vQ9Pt4lgYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779292637; c=relaxed/simple;
	bh=rqyRx5gO71Dktn8ezRmaXkqLcnP7Er+WU3nc/ne/gNw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fBrBFD49IJlUgr0Qyv9/oJc1C7CG7wMfZNrfjGBwdsNhwTFE51v/54beMYbIm+T0Pn3pXVkRy2z4Pvvt4HBTUQez4clt9eEpev90uiH71kIFBF0G2D5X/kF5qg4s24UfPp6LG25bP9SB+66V5dWYBBWjPiOhEsDgRjtYt92s4qk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZFBG2bGv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GyJgx65J; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64KCe2BK316427
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 15:57:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=adYT/N5M5dNlxa9BWmKih7rxkcOkwwxxkH5
	7o6+h97A=; b=ZFBG2bGvIVn/ggym+QDhL+e5G5+lCF/9bArEyg21gkvQkB5YL6b
	Mr+y59+1KU0XE2HWa8ppQavCSn0djstQMXpDEvwBQYQ/5sqHCVlBU2c6wOwDWX13
	AO0lZih/3DY9VudmDI0YaVwhFcDOM4WQprmzCDETGJbA0a+9WCbJKQGkeAj9Cbp4
	rl5bf7QpIw9OM2BFY7qto4O4KnYxDn1gCxMjj+QGbiYaK3pUn9nwTfssTf44CDW1
	PWR1YiJLZLe4gxSf4/IIVTIuY8UMYSt5sE7EOFoPAvo+vEucLri/VBZyiXREUJWd
	8ZSqdfNEQeG9ZarPm8WRMjscxLVFFXrhdjQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9d5qrt0r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 15:57:12 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2bd1dbcccf6so77621125ad.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 08:57:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779292632; x=1779897432; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=adYT/N5M5dNlxa9BWmKih7rxkcOkwwxxkH57o6+h97A=;
        b=GyJgx65Ju6ZbMInIXwWAdO5Yq0j324UWs/pZf1yvsNEvdss2Z5nejCsdwrjRsKf1Hr
         Pzd0ZT1ySPKpc1vmXaAw5m1h96vtWlMZYXH5q8j4SK+Dyvp5wHnOqcELWRYor+CypEDY
         SuEIHt6BHNWPa8RpDUsAe8BqwQlc1SBo7CxZrCgIgCOWIggHC8NfFYrfZgyoUzglx7AU
         Jpbka9g8M18wO0f4XflsZa6J/aChHRQB69qVaS4Ya6V3CSM/bAL96U4LsSvPz6/5/t/4
         5/i2oSyv9h8iF1yB2snge62B9D8HoqrntGaHv5MUJPIGa2fsQ+GeFFQxzb9OJ5Y1oNPz
         DAUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779292632; x=1779897432;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=adYT/N5M5dNlxa9BWmKih7rxkcOkwwxxkH57o6+h97A=;
        b=UBCc4ym+KrONd3ohxqvqZ7G4sUs3eQMKsv6AbJx9mQ+Un4e0F+18SJpYYEoo389Imn
         +hY7MDqGt3+OQiHkTugaQKfJBKKQ/vcNM0S1tbT1tsJuDoSErmLwzUmGWJYTDm6gnnZN
         qAPdaJ99OpHNM1AA8Q5NWrIJym3R0W+oKmreDSqNlX6Yjb5Nq/sO4t3QeGIgeNrh0mPy
         WhIwsMAwUSFCJ68K0tOoYKW3LelBC+yVcmoz7og5gtvorfyRo4vAPWamdDQzF+mXac+J
         6uI77BcUBknr2hvZvKuivp8a5ZT2jkIuusaEyNkiyTJ1whU61A3CF+AZFvUdBdEP2sCx
         iVpw==
X-Forwarded-Encrypted: i=1; AFNElJ8O/EMsvmByeLXq8x4a5EY4S9ojKyK0VUqQ4XxH/E/7rwSVQctpH6c2h3+mV9Ovcwb+bLMa4FWYGem5kyjH@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2zdgsI01++mSvvBvqSKLF9dpndVAoRREdGPQGfcova5V3SYtC
	av6mNM6II+MHCMQQwxXuBkATwh8dyyqWGUYehIxxLCJ8KwsIB+kXVYskoy/y50aK0GQd5ewEkLH
	YmVni7Kz91gzMx1f4mFN8dOdGlNgEHz0JNnU1Gr6knIS5eeD+vztnJs58TicLSxw/wmqR
X-Gm-Gg: Acq92OEDNsyZ4czLdYbDxGdYwsyLhxiIat5pP0JmXjlZguVsBW8J5DCL/CXVcPP10Jw
	+s1Wz2Hj47wf+cSVNrd3Sw4IwJKpJKmGcEy2tTs4kMyMxQwYABiBoGbGLVcCpQnx7kY3DfsDKHH
	KktDUaVUN9oZN41RqahZ/XttvpQvcDrndxSZBtTFzks/GmV9qKzIkJFb3rkf7WcIoz4DlHXs6+e
	iwn7mSz9sC/ZsxkRSLmqs7itCqY2ryUspXxGFaGPglqP6JXyO4d3PIbJ1Aw/APP0402PEDcffqq
	caaVVltktE6n2rkBCZiZtzkThyc7GqjEFDNCqY2OA/s5CRWvYeNclnX9DSsauAy7WteQm0lIpyd
	liTfzGzF8owpMnwDTGi+eIZqJcufNUKpZ6gt1D114w/q6Qg==
X-Received: by 2002:a17:902:c943:b0:2b9:7ad1:bf2b with SMTP id d9443c01a7336-2bd7e927ae1mr277089205ad.29.1779292631573;
        Wed, 20 May 2026 08:57:11 -0700 (PDT)
X-Received: by 2002:a17:902:c943:b0:2b9:7ad1:bf2b with SMTP id d9443c01a7336-2bd7e927ae1mr277088825ad.29.1779292630975;
        Wed, 20 May 2026 08:57:10 -0700 (PDT)
Received: from work.lan ([2409:4091:a0f4:6806:bdc1:b9f2:288:db46])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5d0fd279sm224915175ad.62.2026.05.20.08.57.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 08:57:10 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org
Cc: mani@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH] soc: qcom: ice: Fix the error code when 'qcom,ice' property is not found
Date: Wed, 20 May 2026 21:27:04 +0530
Message-ID: <20260520155704.130803-1-manivannan.sadhasivam@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDE1NSBTYWx0ZWRfX8B6cESKtKO7Q
 LRYWbry5LFvGPcJN9Z/MyeVBfPgQFfnTLdEAk+zVW2qeHtPvrjhxMgHzYyWFx2xv9jxCElJReD9
 oZ60/1oTBm3amD7MFauiQuCvLlPZF5lISz3zGPaD7Gw9NzroA1aX1CWwtlrbUZHEGWejYJI9mgX
 b8RlaAXlpqou5d+TWMNWMAFvsfhGTbqVBGq2iAUjlguF/BUeCAW0OVmCH+HJSbfu62LFFIr/3Ok
 nuTjR44QnobvLdVg6ngnuzXQkfGQ8W3NCYsS2Re8p4kYu2ZTc/DZAkEUtMvFEZsFdafNgs152TV
 gSU50+2Y7m+2cWMwn8OrORJdo7hdQi/T6rd0Uzqks5PN6Vau6kwZtzGUkipC3Hg+M4/PEnQx8oC
 Jz9mlbv9bL5Xsh+em9awt12koz2QcCnTgSgmAYLs0nmkMpoPOP4ZD8vB5p5T8xEUqLvYwFH4In6
 GWt3ZlS4ulldM9RUuHw==
X-Authority-Analysis: v=2.4 cv=QshuG1yd c=1 sm=1 tr=0 ts=6a0dd9d8 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8 a=hD80L64hAAAA:8 a=EUspDBNiAAAA:8
 a=vOGu-D3ClsUDJ8L96bsA:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: WI8JvL787IBNB_hKGMZulCPMg-ghsDLG
X-Proofpoint-ORIG-GUID: WI8JvL787IBNB_hKGMZulCPMg-ghsDLG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 clxscore=1015 phishscore=0 spamscore=0
 suspectscore=0 bulkscore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605200155
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_NEQ_ENVFROM(0.00)[manivannan.sadhasivam@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-108831-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B6911591BF4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

When both 'ice' reg entry and 'qcom,ice' property are not found in DT, then
it implies that ICE is not supported. So return -EOPNOTSUPP instead of
-ENODEV to client drivers to specify ICE functionality is not supported.

Fixes: b9ab7217dd7d ("soc: qcom: ice: Return proper error codes from devm_of_qcom_ice_get() instead of NULL")
Reported-by: Marek Szyprowski <m.szyprowski@samsung.com>
Closes: https://lore.kernel.org/linux-arm-msm/8bac0358-9da0-4cbb-98ee-333b85ba4908@samsung.com
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
---

Bjorn: Please squash this fix with the offending commit.

 drivers/soc/qcom/ice.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/qcom/ice.c b/drivers/soc/qcom/ice.c
index e26d5a64763c..5f20108aa03e 100644
--- a/drivers/soc/qcom/ice.c
+++ b/drivers/soc/qcom/ice.c
@@ -658,7 +658,7 @@ static struct qcom_ice *of_qcom_ice_get(struct device *dev)
 	struct device_node *node __free(device_node) = of_parse_phandle(dev->of_node,
 									"qcom,ice", 0);
 	if (!node)
-		return ERR_PTR(-ENODEV);
+		return ERR_PTR(-EOPNOTSUPP);
 
 	pdev = of_find_device_by_node(node);
 	if (!pdev) {
-- 
2.51.0


