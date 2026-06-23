Return-Path: <linux-arm-msm+bounces-114231-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 6t3jNWaeOmpbBwgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114231-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 16:55:34 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C6CA6B8147
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 16:55:34 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=o2z7e8J9;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=c7wOrpxV;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114231-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114231-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 19834307FAB2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 14:52:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C132F3D4119;
	Tue, 23 Jun 2026 14:52:52 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82EC63D47B5
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 14:52:51 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782226372; cv=none; b=iERpK4pUPLAFAyONrMHXF+YrbmKeBmDZo4nSij3PJJuxw1SisrzjbmYtMUkMsKNfTP/8rmrKanKqKIFnEw8Z9DEUO0B46iMiCOXZi2q1KCvYVJO1FBW8kiyDi/tAunXw8mVbYyTS9+ahBQQviQkoxlWW7+drsRWeb+zOTP/gkxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782226372; c=relaxed/simple;
	bh=jk4R28uvXSQqop1k+QCaNKg5KB45fYcvAdlsM/pEbt0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pHebLloybegkQGU/kui8q2kf2dsBJJkGDA+GUZfX0RiI0ERTBh5SQ/CNwwzRiSA3J/nZfLXWBbClSTYzlsiSyi/21eCieaaHqL34LfGu5EHsrkFrzZfcFiDhwyeHVEtK6/l/HAtC5IDLxOVjccvRQu9/udY7m8D/oDxC6sEZ0is=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o2z7e8J9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=c7wOrpxV; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65NBZJJt031413
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 14:52:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=1zp4v9I3As9
	YSSPlxKI4iiJuA8JmYN0Hz1Nxzf/1u0c=; b=o2z7e8J9azfbhqDRSzGPXA5q9hT
	kCTUoPNbFevxPnpU8jxf/J8tahuGILguBwg89f211D6D6cItyC4icbmPL46Ua9R6
	jRUSv61iZyTwmIyF9Ag+B+UqFeBCB/ufd3yy4eNCnav832o3TJZG0vj/zOEETzRt
	tTL8SfWR3zPnL3EmvAX63TbfenHPo9T4Dkl7TylhpTGRCiCs68uuabmnO8Uj9Exs
	eh17kky2w+0n0aiWQPLrACWfIDZz95ARMhNDvHg4nVve1i97nOBLf0HMOAoHU2SV
	J40PIZPxFjYLdfaM48es1XZ8XbBzz/7WPS5IpO6y+i2oj1wPdh53vH9y9RA==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eyqe69cjx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 14:52:49 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-963d7c11611so2090585241.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 07:52:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782226369; x=1782831169; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1zp4v9I3As9YSSPlxKI4iiJuA8JmYN0Hz1Nxzf/1u0c=;
        b=c7wOrpxVhFFl5W/VLMCdPeGnZD0Hu0fkyNaPVfGiwZHrsLBWjrciG9cOwHCtofk0af
         uExqhlpFFH2fZLLlvAqY4RKFU+HhSXiOeq/1bgIXoMgoHjKm8HHa9E/ZZqh3Wbyoi4qR
         uyPS3puWkttiIiga4uaG/XpAGDvpnG4RaHgGwU4TX00BAQ5Teo2yS5Lfz3jEZCa7LlYQ
         3TBek4rmjKc4Edn8RVUYsFI4sqZBclt/a7V8SRA1POMiGBzpLHt8g2FkkWcbr1fA6sye
         F2NgNGXlrYeYxF4OsxbOY08AiogTA7f4ykdQg5VMnHfx1MM+r5gZMXYsItiTd0i/IUpq
         gllA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782226369; x=1782831169;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1zp4v9I3As9YSSPlxKI4iiJuA8JmYN0Hz1Nxzf/1u0c=;
        b=FUkZDQiFExUYaLn660lFLZ91hwvjt+LYexbfV4BXryHroU3llLXedAOV3FA6Uk1vqC
         kTF8lEpo5pxNZ3YhvlEk7xg5TuoOYxbLTp1eh8MW3aUkqmIAWRNrUEGg6emJ01vZZsbF
         8H/n07L0nu1OrqRtaodXM2lQdXlOkzTj5VrFqlgl51J9BD9UaWxNVEOcDsZybDOi5D/h
         AsEyCzcPknpOSzX0RZcVa4H1oNT8zof+gotJZQ8z4ihvCXHYRcPxfXms5goAdCp25LK+
         elPfR7yMb4wrx/BnOTO0A6MiWwLI7EJNK1ssqiAKbNOBXdGQ+Zi9WVh6Ab4U/Vfp8TxP
         bDjw==
X-Forwarded-Encrypted: i=1; AFNElJ9WWBZVrr/GUPxgKy+0X57TkXmS9HiJT+F1anMw2dC113Qwsay4c0jpnQr5WOheHhB/j6aiHVYgIwNK83/u@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0DHb3HQkDaN1/wgfCl2m/++A5bzpXzkYK8vj1e8z2Ru2iHnEg
	ea9EDqF5+OXjPe3nO0aG9DUEU0QfhRW348pwBaWEfMXEoqr000WhSZKU8+shpmA554DeR34fupt
	QFScVIf+qHIKVFirGf1pIkefSfXPiR5WjqqXqM6RYgDl7/AqDJWuMOr7FI5hpT6OXfnS3
X-Gm-Gg: AfdE7ckF6roIMDcHKjRqfrI9h1hl6fioZTEZ+UXF1TbYOm8MKzE0GGH8JiIRjVXl4UY
	kdIvGp0gIG5de7qOacP3rAAaXHEg2No+m58X70yWnH9USr2N9HPXj7FaJdMFxlTFEBsPKrj2jsX
	DbK1r6rk4uGzKLG3rfHPuYm/0YfgLw1Syq5HkcTnyd7+Ig0GpkxweNGvk8Q2+YnCuzaeq3PfW3x
	SIeK7V8LXRfx1oAiYpGVHlOuf3s8n2n77COn7srDg+p/m0ziRPB6wqcNKAFfqSuKGRxCK1MQ6cp
	GNjGzePmqTHkYiPBcemWvQvXBJGje72cRRSjxhYnLmdEvLCD1KCJJh47PNoQO95FTfemU6s5dyr
	2+qOFyImh8VvPh4NrsdmaHf0Y83ZHTSvuYIfi3lD7g5WlNuYMS3mBtS/zo0n54ZvDf5hGumE+LD
	Ct/OvY9dP1issIA6PVJd1jn1YzRw==
X-Received: by 2002:a05:6102:e09:b0:631:26f6:7016 with SMTP id ada2fe7eead31-72ff5b88ac9mr1736721137.28.1782226369125;
        Tue, 23 Jun 2026 07:52:49 -0700 (PDT)
X-Received: by 2002:a05:6102:e09:b0:631:26f6:7016 with SMTP id ada2fe7eead31-72ff5b88ac9mr1736696137.28.1782226368762;
        Tue, 23 Jun 2026 07:52:48 -0700 (PDT)
Received: from shalem (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c0c60aca46csm534042666b.36.2026.06.23.07.52.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 07:52:47 -0700 (PDT)
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
To: "Rafael J . Wysocki" <rafael@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Hans de Goede <johannes.goede@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-acpi@vger.kernel.org
Subject: [RFC 11/12] i2c: qcom-geni: Fall back to i2c_acpi_find_bus_speed()
Date: Tue, 23 Jun 2026 16:52:24 +0200
Message-ID: <20260623145225.143218-12-johannes.goede@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260623145225.143218-1-johannes.goede@oss.qualcomm.com>
References: <20260623145225.143218-1-johannes.goede@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 62HJkLybSmSxfLNLOGXor511yRwH3H2L
X-Proofpoint-ORIG-GUID: 62HJkLybSmSxfLNLOGXor511yRwH3H2L
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDEyMiBTYWx0ZWRfX287oj4O87wLV
 TQcuPkRLZHeh+2zLKic+ZnpqopUExbJqI8RA/mTTC+kB4vXLqCqyjokLoMc2LemUppKv0fGau8i
 PHgbLoyqkga257nbXUnM/Uq8aqPqa6w=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDEyMiBTYWx0ZWRfX7TQpb1Mwx9M3
 VcWYUgpBz0xob+1qLZR3t2yaXCNgSnXKDzQTRFZ+mTMIFnedw85D7VD6s9Nj/Snd6NV9C8l7qFE
 nehQHYH94Zht+2ApjXFeFmebbAYCcLzU28zvSMD7AJ0dxF4vM81boTJN80KwIlGzZosmL78klzC
 NikKXhb5CYP5bbnAtivuu2kMfkEkANJ4L0flFwCOq+o6U7EOlGmKq6uuRu75Vur5PttubRPXRm7
 2Nb2B7tmLtzOHUkFAw9g5UR+DsYFzyJLAX81PwtyaiB+RsMgEXssKX2q4+uDDm8ZH9zJC4+7alv
 gxhN6nHKFo/dAdOuiXqORZg4T9Qkgb4cVd9vUBFSQ8Ozg7wsHpP5BBQWREV5GTYfKKl21lgqhSj
 By5cg1H8mEw2lVqLWi2h8ATe/hmclg==
X-Authority-Analysis: v=2.4 cv=OeKoyBTY c=1 sm=1 tr=0 ts=6a3a9dc1 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=xqWC_Br6kY4A:10 a=FelO9ux0wxsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8 a=ebSNtY053JYnNN3LUkkA:9
 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_03,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 malwarescore=0 adultscore=0 suspectscore=0
 lowpriorityscore=0 bulkscore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2606150000 definitions=main-2606230122
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-114231-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:rafael@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:johannes.goede@oss.qualcomm.com,m:srini@kernel.org,m:krzk+dt@kernel.org,m:lumag@kernel.org,m:bartosz.golaszewski@oss.qualcomm.com,m:abel.vesa@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-acpi@vger.kernel.org,m:krzk@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER(0.00)[johannes.goede@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[johannes.goede@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7C6CA6B8147

Fall back to i2c_acpi_find_bus_speed() to get the bus-frequency if there
is no "clock-frequency" property to get the bus-frequency from ACPI if
available there.

Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
---
 drivers/i2c/busses/i2c-qcom-geni.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
index 2138fcffdaf3..97a538cd9455 100644
--- a/drivers/i2c/busses/i2c-qcom-geni.c
+++ b/drivers/i2c/busses/i2c-qcom-geni.c
@@ -1024,8 +1024,14 @@ static int geni_i2c_probe(struct platform_device *pdev)
 	ret = device_property_read_u32(dev, "clock-frequency",
 				       &gi2c->clk_freq_out);
 	if (ret) {
-		dev_info(dev, "Bus frequency not specified, default to 100kHz.\n");
-		gi2c->clk_freq_out = I2C_MAX_STANDARD_MODE_FREQ;
+		ret = i2c_acpi_find_bus_speed(dev);
+		if (ret) {
+			dev_info(dev, "Using ACPI Bus frequency: %d\n", ret);
+			gi2c->clk_freq_out = ret;
+		} else {
+			dev_info(dev, "Bus frequency not specified, default to 100kHz.\n");
+			gi2c->clk_freq_out = I2C_MAX_STANDARD_MODE_FREQ;
+		}
 	}
 
 	gi2c->irq = platform_get_irq(pdev, 0);
-- 
2.54.0


