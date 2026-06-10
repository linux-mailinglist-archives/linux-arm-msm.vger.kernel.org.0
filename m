Return-Path: <linux-arm-msm+bounces-112350-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ABxoJc8iKWoqRQMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112350-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 10:39:43 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 33CBF667464
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 10:39:42 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=BLs94N5X;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=B0hGMiqQ;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112350-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112350-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7AD133275EE3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 08:32:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 590D6386453;
	Wed, 10 Jun 2026 08:32:24 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C00CF3AFAE6
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 08:32:22 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781080344; cv=none; b=UBJCjKtdf6D8xOsAvxr7OIfr0MSjG/TH+Ss4KxF4U1BhuJPB4KN5TDrDb38qN5ryja7ztynAHYKSVX6bySBEqLML6V6LWDL4+L7WHBH/jvrO0DYVOfoqaDeHYAn0fwBGMOPXeRNfhYfMtUTPGC1xf0OHjGjrCqWvv+3ea4ZLpWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781080344; c=relaxed/simple;
	bh=YBxDxpnUN0g1cyHe3+apDyMUfCheZu4o+Z6kfRRqcBM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uoy7+beGjCoXWk8UCg9uUPg49yieNTIiRacplrdU97X6xyO3W5BekuTwBS6MUOH6tssGlbwpoU8c1VB7/ilg5M1sTs/5AWp6+hJPtJ4gEBNeyqww2aovCpqOkYI+QuqYQhOAilOX85bjtiFDvGyw+XVVmTJvv1wOMvh/UcBaDiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BLs94N5X; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=B0hGMiqQ; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65A7i05G991008
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 08:32:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	c/yPWsrppuRTjv7KKH5PGwEYFWvJR5egD5gH9LtEMeY=; b=BLs94N5XMv/G+8L3
	X4nxNyk+lqKA6+DJ6oHvhpE/Y31jDGshbwY63J1uW0dDCsBvRfGzgsxIMA1ufled
	AMNUynN4SMtQM8YhqUuDpoGQudtp6fslebkY8VxE75AkVGLhwLtMjTiTVhbv31xD
	b7DTZjO5Ce4y6lFSNma2cci3Rd78ovfiR1BHWXxwMnjF0VBI5oD6p+PoCYdTubtH
	rEOT60+gB/J1hCUUTLgWH20QAk9mIKqfCzus3V9ccnhlApqoCLV45T5gwM2WqaR3
	Zf0PZdp8fiD86/AW87gviPH0dkRaSE3mziTh6RnQycAiWhfDPXJQsO4r8CAYw8Fc
	bnzUPw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eq1tg0nug-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 08:32:21 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-517c65e497eso9101371cf.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 01:32:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781080341; x=1781685141; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c/yPWsrppuRTjv7KKH5PGwEYFWvJR5egD5gH9LtEMeY=;
        b=B0hGMiqQfZpVWkSlv+iVdTIoS+sgisybbdb/DWBnyHKaXemoLcG1y16+LaG0rwoy5e
         TFktxxfAzmdlyNqErLxBuf9ovvosRLBcs8i83fYyr46QwdWYP5Co+m5zK9IUyEZNC8UW
         3MXdqSDNd+2ZihUWHABVBLEvJ/IaF1zDpVyKOl+g2hFKAMZrGj6be1/mkIvgy9DbpGxl
         KiEMI6KMGwFjhRTGCN6VdpU5l8bKolSYomeBOr5chZRrUdebUf2bZICMvBPcrg8ZxLVg
         qbQniylrEUZLhgkFtTQJULIjUU/RW4f/++POdDtzd8j6F6NqwLxLhySlBcMSUupbVl+5
         6fwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781080341; x=1781685141;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=c/yPWsrppuRTjv7KKH5PGwEYFWvJR5egD5gH9LtEMeY=;
        b=eNFzDbzCVw+bbSYlnfHBMTN/SNc+7NkdERHxHsjnfwGXiDZDzMGJj9fREUsjnDPkPT
         ELaOKj3moKfcA1H50uvpjfUEdwUDcGCxrAtzV3OgZso6hqzWhKfSjJ9CIff8KZ3DoG4Q
         uCCZ/zv3jQdEAn16GzXknAcY5uDWfvkHxsrFLXFLr2n7l/Ztx/pLCCned/ll7siXMdRC
         6nmCTVgRXG40s1NYhPf0GGL3SAJSuIPONLA9j4jCDE1iRDwjvFK0JJczsv1e6C/O0+/r
         FRCB+1LGV1QJ28sbs8xSqeP2fao8QOzVOGbRoi0CS0W44qmrdVCzSWUEp8ETzIgfpMIm
         +2ZA==
X-Forwarded-Encrypted: i=1; AFNElJ8/+m6w9szW8v3m46nxycoCTxa9g434xnLlYyq4nzb3rtVmbbHHD5sDXIWSIYIhPS2jG7OwafotSXivWpU4@vger.kernel.org
X-Gm-Message-State: AOJu0YyJ3igyrCqwZ4c8EGidOJqmrSZkaCpDPCm40rC3+5YXzl98Z5I4
	PM5PCwRQtBt3w7PvO+yOo/Dok3D/xw+1Vjpgoi6WSwSlqZVdXcff0Pz0bCk5lg97tQomaQNJxfe
	d8tZecIJBRp8sVhwn6SYyqJBd3gthOqevBZnXjraw9Fkfq3ZOfQRzufs1pfox0FqjHED7EAVujR
	vClmI=
X-Gm-Gg: Acq92OGIjpvg7g9GQpD06XCsnrOpoeI39FG+GcY56AavBpn6t9dEbysRFGLKqXF+H/D
	hySNBzuaMkPzC2ZANpLFdqznjSCX5JFZTJS1SumaqeBs9uOCTWUMpwq0O9t8nSGdr1qRZUhFOwD
	FGZyP0seuq6VBN8jRObChqw4o4MVV426uG4PC2sCw0tku97c/3CLzL8zBwiVVm9UAuNipz7g9Gf
	DZFl3VqGc9I2FTiF6EIHkyzhT+Si3RUbxi41kSUAZep5V+ha5KAS0qmizHWbW75P6Vwoz2QmP+Y
	54bR01rjOGWU26s9+BofpTPJC1UBj9XUwO1Zhn0UFHCktyrLfLioFa9XZ/Fnolf6PPFqqZk5zjG
	lYZYO+wx+OM/RFlFaOD8xwW6j32Xn9YXAfjSONg9tZdax50ipdiwRprjrIhZct5BONLbq4Fe4Po
	UzHgVeSox7R6wKhlfROtJn4K4Ge+EirXZBEogFTSAVv43xIauqL0Lphx56WNdxR/pFRBgwmz7cu
	uao1S9XULCX
X-Received: by 2002:a05:622a:1e8b:b0:517:6c6f:8ee6 with SMTP id d75a77b69052e-517ca517512mr93433081cf.6.1781080341115;
        Wed, 10 Jun 2026 01:32:21 -0700 (PDT)
X-Received: by 2002:a05:622a:1e8b:b0:517:6c6f:8ee6 with SMTP id d75a77b69052e-517ca517512mr93432831cf.6.1781080340709;
        Wed, 10 Jun 2026 01:32:20 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:cc96:22ae:323b:9eff])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68e6585154dsm9516218a12.15.2026.06.10.01.32.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 01:32:19 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 10 Jun 2026 10:32:14 +0200
Subject: [PATCH 2/3] hwmon: ina2xx: support ina232
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260610-monza-ina232-v1-2-925b0d12771b@oss.qualcomm.com>
References: <20260610-monza-ina232-v1-0-925b0d12771b@oss.qualcomm.com>
In-Reply-To: <20260610-monza-ina232-v1-0-925b0d12771b@oss.qualcomm.com>
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-hwmon@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Martino Facchin <m.facchin@arduino.cc>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: CwXBsAKGBGwq25q-7VeKLON8nDJt3BSe
X-Authority-Analysis: v=2.4 cv=dLmWXuZb c=1 sm=1 tr=0 ts=6a292115 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=4d72ej-57Oz9oLBfKlAA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDA3OCBTYWx0ZWRfX/prrD8sRoAsH
 a3IuvA3/Y9xQ5jZkCCGaeO4tmO6zBniruXni8zs8GsdN4zTpNEGP1YaHhsSNTVJjtJkl/aTW/aI
 YtKukQ13R9dawJhh6uo+1dxq4AlMHA6HZN2fuQ0TuY/5ws2ZpnFJ/96ajZdX4n3/Y7h96odf9kL
 1wuu/Yt7dc0dvydHc7iTFoUJ7UQEKQpgjIIqwmqJ5ENusGb+6pdLzGQ7KKl7r/R2rrEXyaeBmvc
 oGKn+WDzuNMG9hIZF7K+F2Es3slAC/UOJYlVotGYnqews6KuUDeUHHl8DNGGebg5y3aZjrN5T0l
 ilwYBYMkQJHCibT0rHrmA38P/KD13U4TTKM31CtWRiIlgx7YIqe2p7ybEEos9dRl7r1j5/ahuCL
 vkE4yEjno2b9rzt8QNxlJ4Pq6jOH4rEklMQYT2JNsiHNkD5uQDLmR4Al/AK8W9irjHZDmcO5BT7
 T71iq263Rf2zjN57+kA==
X-Proofpoint-ORIG-GUID: CwXBsAKGBGwq25q-7VeKLON8nDJt3BSe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0
 phishscore=0 adultscore=0 suspectscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606100078
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-112350-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,arduino.cc:email,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	FORGED_SENDER(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_RECIPIENTS(0.00)[m:linux@roeck-us.net,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:krzk@kernel.org,m:linux-hwmon@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:loic.poulain@oss.qualcomm.com,m:m.facchin@arduino.cc,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 33CBF667464

From: Martino Facchin <m.facchin@arduino.cc>

The INA232 is a current/power monitor. It shares the same register
layout as the INA2xx and uses the INA226 default configuration, but
differs in its electrical characteristics:

Signed-off-by: Martino Facchin <m.facchin@arduino.cc>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/hwmon/ina2xx.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/hwmon/ina2xx.c b/drivers/hwmon/ina2xx.c
index 613ffb622b7c42b8b6090d3b4ec7b2fa412e24a4..122e7aa4fdfffb5bac3d15ff0496fa862147f443 100644
--- a/drivers/hwmon/ina2xx.c
+++ b/drivers/hwmon/ina2xx.c
@@ -122,6 +122,7 @@ static const struct regmap_config ina2xx_regmap_config = {
 enum ina2xx_ids {
 	ina219,
 	ina226,
+	ina232,
 	ina234,
 	ina260,
 	sy24655
@@ -196,6 +197,17 @@ static const struct ina2xx_config ina2xx_config[] = {
 		.current_shift = 4,
 		.has_update_interval = true,
 	},
+	[ina232] = {
+		.config_default = INA226_CONFIG_DEFAULT,
+		.calibration_value = 2048,
+		.shunt_div = 400,
+		.bus_voltage_shift = 0,
+		.bus_voltage_lsb = 1600,
+		.power_lsb_factor = 32,
+		.has_alerts = true,
+		.has_ishunt = false,
+		.has_power_average = false,
+	},
 	[ina260] = {
 		.config_default = INA260_CONFIG_DEFAULT,
 		.shunt_div = 400,
@@ -1005,6 +1017,7 @@ static const struct i2c_device_id ina2xx_id[] = {
 	{ "ina226", ina226 },
 	{ "ina230", ina226 },
 	{ "ina231", ina226 },
+	{ "ina232", ina232 },
 	{ "ina234", ina234 },
 	{ "ina260", ina260 },
 	{ "sy24655", sy24655 },
@@ -1037,6 +1050,10 @@ static const struct of_device_id __maybe_unused ina2xx_of_match[] = {
 		.compatible = "ti,ina231",
 		.data = (void *)ina226
 	},
+	{
+		.compatible = "ti,ina232",
+		.data = (void *)ina232
+	},
 	{
 		.compatible = "ti,ina234",
 		.data = (void *)ina234

-- 
2.34.1


