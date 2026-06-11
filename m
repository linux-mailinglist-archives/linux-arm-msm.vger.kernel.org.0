Return-Path: <linux-arm-msm+bounces-112771-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 0cG0IsTAKmruwAMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112771-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 16:05:56 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 62F366728F3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 16:05:56 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=KbBUePmB;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=aPMRaDnz;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112771-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112771-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 840EC301F806
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 14:05:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2EADC411667;
	Thu, 11 Jun 2026 14:05:38 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E07EE410D38
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 14:05:36 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781186738; cv=none; b=R8tfY2iS4CSUzzo12WMs32721aHMfT+2GpZVYf9WQni/XCiFXZLOdL+IUnon9MjK9o16gx0BWAtG5Uy7k141wHQNj/zZPApmbcE8WwBIL0/Zs07jKWfn58saOVadxMdyc70s8lPUhOXnTOai3IevkFe7TgJP5hzBdZw7ByG9qJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781186738; c=relaxed/simple;
	bh=6T0vT8ns73GyAYOqdvKVFt6Kkovh5R/AEwLiJpspPNw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CbEM3LFpLq0C05LpKybe+swRWxuzS3jGDxms3Bd4/ecyvHKkqPQUgbGUREOu1eETFQ7yW6Zrlue5haUJg1LWtEmDAxUUyfP37RETtEbPXb9SFfovoN8WRQATUQ5+wlOpazoMlQpHc6O0VjRORDe+7lHh2DyVvQLSVVXMAxA0X+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KbBUePmB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aPMRaDnz; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65BCSm6D600115
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 14:05:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uwOZ8TEedBeQG/0JLrZLUHUec20rih8wIjEdZL6yjZw=; b=KbBUePmBhAxz9/S9
	NP5KFQuImqdu0GhxAo3pHqE9g6gTLtzXQK5kTRNwHv/FVMZ8PvbeXHYiTFRcZ9L9
	RM/C8ce7yLqozl4cioJ/hMRvhhxLQHIjJw7Kgp1QYXad3PuWbF6simLqbjqXUT9J
	+GsP8xkFlmjWZH5gaUR1mJ8ebILlRPZKiXh6inCKmpQuF7O/lSwWKPtISt5ixrp3
	kAF/iGWHfFB0eyFtz7+HDqmGMJtzFpJb6gxedqeaMVrtyOZw2KytNU7gHzYEGGac
	HpfpZStZboifJeWClnDFZNLZurjoZdAQ3zXpgal9AfCUExFaQRFaoFuLVjdPe6zD
	iHsKKQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe6u3ruq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 14:05:36 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-36b7f696b40so4977497a91.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 07:05:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781186735; x=1781791535; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uwOZ8TEedBeQG/0JLrZLUHUec20rih8wIjEdZL6yjZw=;
        b=aPMRaDnzQ9HgawKHC8dGLHGRlNzKYX8UxoyYPOSguis8K0dwmLYcMFIq8vI/HNDQ/Q
         R1hzdvKTyU9advGNV4t48534F6+nPQGhepcq6ksrHExW38bv+kc0dpXjOInVsAj2A4jx
         DG1t3JI73Wc0ts8dIDr6yrC/M8tcaIG2EskzyZqCXYXQY7u+Y5XuXo+hfIclafFThMXq
         eJ8NH2w2GBgieGNqiekFG56cTbayB1rNrq00xEvDgkj5qPkoUrKafwInFha870oyRk20
         WpacZPFe1JEXmDTojS8QzCWUJntVMq+0oPI4hm5xXfC/J/tuTr7a3EcOF1GJ4dsTigsw
         29fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781186735; x=1781791535;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uwOZ8TEedBeQG/0JLrZLUHUec20rih8wIjEdZL6yjZw=;
        b=ZVEYPiVpFlXBw4guOSQgicdx6STJPV7rP27eCUQ7QLVFQLVW7ZLDpvETDOjdCPVfYi
         n3N4nGfADoDjehXM+996+F2ym6ev1cwqKKaG9gBEIarPZ+afMMn/4YjZx7iYqhLP4lfX
         RjjS3PPJanC3Iu68AGVh6tj9al8wzse5t9KPsqh9DJyBLcNB9Qzvh1vnGO8XiJkLlN+Q
         xDYu9hYdbW1dXiXSdC/ELRk9B0zVOuMj8VqcSSOyzH1H4a9dIUP5DNX4z4mTopqWM8h5
         4QmzzL8dTHodrSg40PHBMFpgkRcEeo42txytjualqzX2A6SDMavwFBKixZFcOdDTNHzk
         953g==
X-Forwarded-Encrypted: i=1; AFNElJ9Phsp6X9dWIn4iuosKPvOfYYyTUBPZlQ8/CP0Ra5eiUBKaUHN0uYFlXHiGegFI8ZiODvwr2/q5dMqqf11Z@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/wZGiYURz54Y2aizGHUrVR0Wp3ZUEtAWmpQK+07/0IpZPLXse
	qfB+8kqIYw8QGRgqKU97qpfB1DI4g3Hcb4oE9gAoy7SUXKdOnplNziM9e1rWWWZ7XnpU/Qlp7CM
	mExLz/0WsLyV/HeOBiH/Vxq8Lw5QrFQEBZ9K6dE6++g/14FqJlxfwBkw/TX0UiGiI7Xss
X-Gm-Gg: Acq92OHkU+Of3ccmW9pc1hYZD0ByQ7HqvIwspwwBUlB2DYlTSAyjdKQHzLt8WBfTVfb
	MPjbd+bQcq97zV+RJZr0nsQso51esv8f4uedOUWtuJCuGZV2WHE+YBU2i+8gDAuXNABgfqrXZG8
	rd56pkAU29V2990/yGlrB4Ml5C63QKQHLqM9poyxlSxlyB7iViYHrrwWZquXqdNd9KQ6rQQ58Dz
	PjeCHpdPPMnUkr3zWVPZejugbrGy+AEeccB8VtZYrQazbvV3+Ro92sxdPqo+v/7YBAox3Em9fGi
	KTwgswLXdn3tXwuN/nxXL7NulroDPGUJ97OsjZe69pM6qs3lfFsAJmrDat4RofkCd4Aezgo2b3K
	FD0rfhYGjWPL0wOetN7mR4yFnHd/BOOif2YRe0eha0HYLNESAm22aCaC+IdB5W8wePSGi+68LSj
	xB7+bBBi9eKZzyOdss2dwASoAvO+JkHLJME1Rjr3DftTpttRRIauDJDRIEvz1FTxonsvy9eriEd
	alcW9CV/UcS
X-Received: by 2002:a17:90b:5708:b0:368:9da3:c496 with SMTP id 98e67ed59e1d1-377a9289941mr2997853a91.24.1781186735489;
        Thu, 11 Jun 2026 07:05:35 -0700 (PDT)
X-Received: by 2002:a17:90b:5708:b0:368:9da3:c496 with SMTP id 98e67ed59e1d1-377a9289941mr2997809a91.24.1781186734930;
        Thu, 11 Jun 2026 07:05:34 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:cc96:22ae:323b:9eff])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68e64e2c810sm11133831a12.9.2026.06.11.07.05.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 07:05:33 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Thu, 11 Jun 2026 16:05:25 +0200
Subject: [PATCH v2 2/3] hwmon: ina2xx: support ina232
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260611-monza-ina232-v2-2-e4375ce652d0@oss.qualcomm.com>
References: <20260611-monza-ina232-v2-0-e4375ce652d0@oss.qualcomm.com>
In-Reply-To: <20260611-monza-ina232-v2-0-e4375ce652d0@oss.qualcomm.com>
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
X-Proofpoint-GUID: DI2QA9UlOgs8ekO5Yef8vHCNFtEMEMDf
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDE0MSBTYWx0ZWRfX/uj/qwwWeT74
 zlNmDT17uCy5W5KNNnOold2mpzPjTTy93plPt+8tb/MLNQ+wFBZnOVCPz80B/E3VwIOkNIC41bS
 pOlgTGoffMlOfuyAoK16nVXJuU3jyoI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDE0MSBTYWx0ZWRfX3pM1gmTpLhQ9
 MH2pC04BVf6yl+mitNeegT/+TXB5PKsP7U7MNpit59lu4dUq+Aq+KIeKoO9JCXhcpVL+pMkGzZi
 lLTs6wYu40WLwFUVi+ePzqqu4oT1LvlIItZa5pzyiPZRDXko/7LbldK557yM6Hw+LJWtPCjBgzT
 vmp6DIcC0SfYlzEgWudlQaQGpx+5KkOtbdqKBuuk4tBZ92lZjTAHggCG3qg6YOehp7Cq1yGUWqY
 cPgJfscYzBTLYRNnjdQjzACLz/YaV3m2rIdSMn11gyMO/ZRbNB03ElrHNq2eSd95emTbYhYGHKJ
 pOIqzuvTJ692hfN92Rcdm2RZv3C3wzqtPuPEIfTDOinPDP7cbbFFZ/dIDyIr+DDjrmN/3xd6W3m
 ABmZR9jEBKSRf/eYRNBXF+gPFJiVqdnGDPujTZE1gS7uCkwT/o86FuEA5daJ3hTtdLrhpyK3USI
 9roev/7HF3bZXpPhOEg==
X-Authority-Analysis: v=2.4 cv=F5lnsKhN c=1 sm=1 tr=0 ts=6a2ac0b0 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=4d72ej-57Oz9oLBfKlAA:9 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: DI2QA9UlOgs8ekO5Yef8vHCNFtEMEMDf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_02,2026-06-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 clxscore=1015 adultscore=0 bulkscore=0
 suspectscore=0 impostorscore=0 priorityscore=1501 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606110141
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-112771-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,arduino.cc:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo];
	FORGED_SENDER(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_RECIPIENTS(0.00)[m:linux@roeck-us.net,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:krzk@kernel.org,m:linux-hwmon@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:loic.poulain@oss.qualcomm.com,m:m.facchin@arduino.cc,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
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
X-Rspamd-Queue-Id: 62F366728F3

From: Martino Facchin <m.facchin@arduino.cc>

The INA232 is a current/power monitor. It shares the same register
layout as the INA2xx and uses the INA226 default configuration, but
differs in its electrical characteristics:

Signed-off-by: Martino Facchin <m.facchin@arduino.cc>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/hwmon/ina2xx.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/hwmon/ina2xx.c b/drivers/hwmon/ina2xx.c
index 613ffb622b7c42b8b6090d3b4ec7b2fa412e24a4..fc2319ad99fc398a50e97ee617f67255bd0b3038 100644
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
@@ -196,6 +197,20 @@ static const struct ina2xx_config ina2xx_config[] = {
 		.current_shift = 4,
 		.has_update_interval = true,
 	},
+	[ina232] = {
+		.config_default = INA226_CONFIG_DEFAULT,
+		.calibration_value = 2048,
+		.shunt_div = 400,
+		.shunt_voltage_shift = 0,
+		.bus_voltage_shift = 0,
+		.bus_voltage_lsb = 1600,
+		.power_lsb_factor = 32,
+		.has_alerts = true,
+		.has_ishunt = false,
+		.has_power_average = false,
+		.current_shift = 0,
+		.has_update_interval = true,
+	},
 	[ina260] = {
 		.config_default = INA260_CONFIG_DEFAULT,
 		.shunt_div = 400,
@@ -1005,6 +1020,7 @@ static const struct i2c_device_id ina2xx_id[] = {
 	{ "ina226", ina226 },
 	{ "ina230", ina226 },
 	{ "ina231", ina226 },
+	{ "ina232", ina232 },
 	{ "ina234", ina234 },
 	{ "ina260", ina260 },
 	{ "sy24655", sy24655 },
@@ -1037,6 +1053,10 @@ static const struct of_device_id __maybe_unused ina2xx_of_match[] = {
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


