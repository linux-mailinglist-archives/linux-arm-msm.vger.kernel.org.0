Return-Path: <linux-arm-msm+bounces-113677-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 9MU+L8/bMmrv6AUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113677-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 19:39:27 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 78E5069BBCD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 19:39:27 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=XqF0m1iS;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=T8kAmCgk;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113677-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113677-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5DDFF30C0DFD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 17:39:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38A7E376494;
	Wed, 17 Jun 2026 17:39:01 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 101DC375F8B
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 17:38:59 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781717941; cv=none; b=Ob+kv6yW2uWldSiYiqzpNdkqxQm75FGv3AScJZQiE9+rC/6gW2q837LVq7w3+2eX/7LE5woswvbeDK87lrzQf94MjlzwyaE1N0n+yQm6dGcRycMCZosMZ9raNWTyLEGD2YPeoWEnSYyidbLE0+0M4X+OMpYx4qebdh54oTtj0LE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781717941; c=relaxed/simple;
	bh=hBDK+t7sZBnTDtOjkj84KsZOBvFHMonhdCwtWPz4c5M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=k6oepFwzYczranqFqkBtrMI6F3VkjsmrKiYSrjSHPyT7RiHFHLyGrKYrXgBOo34ZyYKEXxAqWJtB/DGtr4rdtYZg9046YIjOfi1cRiCGqaW+C/yNCn08prxJ+MnGN9lk0qEW43UaZp/qi/7iv8DZR4omADgprp616Pz4tgNdKaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XqF0m1iS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=T8kAmCgk; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65HFofME083492
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 17:38:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Q+gZ8mY+aqE/4HNVT63SJJoWIum6T+x00lgzmR2pD3I=; b=XqF0m1iS9OKyQs/s
	WqknmmB7Crgy76gSDBTL/Tjaqzn/BWNN6ccvZ1bgQs8KiAIArnkZZZt8mEayu5us
	XI6MBrzjtn2l4LMQGmSYrrfE1c75v9WG7HEumjIkG3cCHDDG5zLhMckIrHFh361w
	ntumBI+K0yJCAGeMiwObd4c/71YvlYaTmD4cnwBqPwkWFczHwex4HH2QgfH3zsfA
	63TY1uCaK6IecUOEwQeu3hgBzjb3XMD3xaOxeI/TFjwVKAqrd1LLCCD30RQ/BMCT
	PXrhSjp55F3TmyAQ/UtMzDAOdjAzNMv4BlIIhTA1QoEsdzRo5N9f/sV8p+Z9+TU8
	KJQRdA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4euw9vh57q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 17:38:59 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2c6a20348ceso994235ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 10:38:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781717938; x=1782322738; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q+gZ8mY+aqE/4HNVT63SJJoWIum6T+x00lgzmR2pD3I=;
        b=T8kAmCgkaG9Aa3EKuhrjG/s3+Agbfalqcxe/l8u9K46BaoxMKjSZxbnE4ilsaTAokj
         uGatXLt6y80nsdr50zzjVWj/9wJIJ/trvKEkotCCMx7UXD4y6gJPWFczCkvra5vBfbNg
         FJlZeTRqrYaHUz+GHMXSMyAN5ylkDfn7EBGOfcPmlOD8BapcQDMZKZC2bfw507fu3TJl
         VMaqbmpexVfDqGX7dziq/tz/9lNiJUGO/xb8ztx4NEOQh+FQ9Nmf7udCsn+RRlouUa3s
         +DOxpUntJoBcXa1uaY4wWRyQcIB1cCRiDvHLydWhTgqoreONBKp13mQxxeG9O3rHGvDO
         xESw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781717938; x=1782322738;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Q+gZ8mY+aqE/4HNVT63SJJoWIum6T+x00lgzmR2pD3I=;
        b=SAjSVsEX1q6N8MTbftgu74l7ic5jr5rwYxRziKT5Bh5n93rpN2r2Dd/Fukjw/6M5q4
         q49943xPzeVeE0hVKp0Ycoqh3VqhQquCY6NJ7aHZSLMOECcnXqTEXezWL8MmzbBTvoaH
         fw3D2oGx/NUj61tbZub+FnMzhfRk5kxOKuX3bV9g/bjCeECKletsBbm9vC+Vk7+bmqVR
         SqRzxctvXCPJXwUFW/POXqMQiAaX2ikoavzNvtrVtE4vRMT9smoZGWWR4xnbX7sl2grF
         1FtQRKFa0e1CiwLRy+jtBanN9jbFeWkHCVbSVl3Xf/Dq0DWU79lhoOmEQIj3k2oDvli1
         f/+Q==
X-Gm-Message-State: AOJu0YwvqJZOpvpux61VtByjvfeXHVZbtcqZVHb8jNQ6LBV1PI2cnTdn
	nHT5gVWpJiVTJLHa9mOldZXSat5qXxfUAnlfu7RtbdXBhu9w27GOn4vgRutpOnJqVEr7DRaVxlR
	iJIR3be3AwA1aaG3izeSDjlGOcS9jFxFFDD+BOohiMkv79DA9zYAj6x8jOjTAnjeWrEvP
X-Gm-Gg: AfdE7clgi5FF4vZKV8kKWO3o1TAwVJIA3mp+Cil4HOJxby/GRAoOes6G+E2H3s1hdfS
	QDoOBVM6OP5LBKdxo6eXwualpTkkqkE4RaiMe6pyXdxvli4Ee/QoLyxOSm1ZGbNHRgFlSsmD9zw
	YdW1Gb9CuQQ1G1uOppdm22E1WPujVBtuoh68kfi3PhtZdpa7pGcAUdrqKCyXls42Q7ifjipCsBt
	O9UOKJQWWZg8Pxfk9pgeSSTV2oqbaQQHoWnB+8zw8nbFWPaRThZyD+dMyAyxKHw8okOqjcbhsyW
	8+V/EFRAHtQywzFA1uEf6l+IYGxeqQr4b20ptd4XctxlWNecHjmFJYDMLXRE4PqJfunsaLOPM3H
	0Jg+jg9Hjof3gqkzPZNGzscCYtAMju6HWEfDlSF/XPwXm2M7FjD8EVBBW1nvxXUVOsAlZ5TKKCF
	qHySPg425v1NWBqS4wOGmlB1gAb2x6lUsIimGmbTFbKzlwDw==
X-Received: by 2002:a17:903:2306:b0:2c2:75c4:4b0f with SMTP id d9443c01a7336-2c6bbf99275mr59061715ad.2.1781717938516;
        Wed, 17 Jun 2026 10:38:58 -0700 (PDT)
X-Received: by 2002:a17:903:2306:b0:2c2:75c4:4b0f with SMTP id d9443c01a7336-2c6bbf99275mr59061565ad.2.1781717938092;
        Wed, 17 Jun 2026 10:38:58 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c433369c8asm173973215ad.73.2026.06.17.10.38.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 10:38:57 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Wed, 17 Jun 2026 23:08:43 +0530
Subject: [PATCH v4 1/3] regulator: qcom-refgen: correct the regulator type
 to CURRENT
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260617-ipq9650_refgen-v4-1-c505ea6c6661@oss.qualcomm.com>
References: <20260617-ipq9650_refgen-v4-0-c505ea6c6661@oss.qualcomm.com>
In-Reply-To: <20260617-ipq9650_refgen-v4-0-c505ea6c6661@oss.qualcomm.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        stable@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-ORIG-GUID: EILfsAKwocdRGdIc_lxzmGfZL-7-4UcV
X-Proofpoint-GUID: EILfsAKwocdRGdIc_lxzmGfZL-7-4UcV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE3MDE2OSBTYWx0ZWRfX9alLfwOVLxWq
 2rlMN3aLAtCI7gQ5hPsIbR10VSmSEkwzvT6lA1XOswTqwVLXcl2Bax6QZiQat2tq0rVKkqDCLIw
 AAQ6heWDyZoZsQ87YiOKIcmzTW2YbDmatfZbLPf3J8PszcFG7J1mX76sw2b8nBY5mZzhUOidFPs
 R+fVF6pdJpAsC4ve4+cissneY92YPUgTBLe+ugA79GNzXlxBS8VkEjmo2Pm7Qpmc9fxz+SWZRSj
 zV8YakRhd4WYXNCiYp2SU32gEkr6TbW+Xf0Obc9Em+uQvyMIbr88SdmfFeGo5oKvqOIT96fG63z
 4w8+ii/UN95VH4qEcgnLaHT1hpMpQR51paJRzHJ5+rUZoBiG9kjv8r17IfJ22ikaHyObyzgfYBM
 D6SDvY91fOeeiKC6QP72Fb3OHU4bXAAcW7Xka24urOiOhx5lhdPj2MDE8E/HLNF9ya8LG74W4pY
 SoqOvnK0KhADm/94crA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE3MDE2OSBTYWx0ZWRfX4FsKPAsjJFr2
 yiRUyJqdwhC3r3Cr6qO/e6TgiNDtKpFwiHmTntaL/RzBG9B27kElZv0PGXWhWS74hvWpcZnim9E
 vYuPiXNgumf+kIiXZaR2ODQHO6F3fNU=
X-Authority-Analysis: v=2.4 cv=YJKvDxGx c=1 sm=1 tr=0 ts=6a32dbb3 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=VkQhxhI6jZxeKeB4iE0A:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-17_02,2026-06-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 adultscore=0 impostorscore=0 clxscore=1015
 suspectscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606170169
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-113677-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:lgirdwood@gmail.com,m:broonie@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:kathiravan.thirumoorthy@oss.qualcomm.com,m:stable@vger.kernel.org,m:konrad.dybcio@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	FORGED_SENDER(0.00)[kathiravan.thirumoorthy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kathiravan.thirumoorthy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 78E5069BBCD

As per the REFGEN IP team, this block supplies the reference current to
the PHYs in the SoC. So, correct the regulator type to REGULATOR_CURRENT
to match with the HW behavior.

Fixes: 7cbfbe237960 ("regulator: Introduce Qualcomm REFGEN regulator driver")
Cc: stable@vger.kernel.org
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 drivers/regulator/qcom-refgen-regulator.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/regulator/qcom-refgen-regulator.c b/drivers/regulator/qcom-refgen-regulator.c
index 299ac3c8c3bc..6a3795469927 100644
--- a/drivers/regulator/qcom-refgen-regulator.c
+++ b/drivers/regulator/qcom-refgen-regulator.c
@@ -66,7 +66,7 @@ static const struct regulator_desc sdm845_refgen_desc = {
 	.enable_time = 5,
 	.name = "refgen",
 	.owner = THIS_MODULE,
-	.type = REGULATOR_VOLTAGE,
+	.type = REGULATOR_CURRENT,
 	.ops = &(const struct regulator_ops) {
 		.enable		= qcom_sdm845_refgen_enable,
 		.disable	= qcom_sdm845_refgen_disable,
@@ -82,7 +82,7 @@ static const struct regulator_desc sm8250_refgen_desc = {
 	.enable_time = 5,
 	.name = "refgen",
 	.owner = THIS_MODULE,
-	.type = REGULATOR_VOLTAGE,
+	.type = REGULATOR_CURRENT,
 	.ops = &(const struct regulator_ops) {
 		.enable		= regulator_enable_regmap,
 		.disable	= regulator_disable_regmap,

-- 
2.34.1


