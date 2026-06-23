Return-Path: <linux-arm-msm+bounces-114232-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id oe3kAHGeOmpfBwgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114232-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 16:55:45 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 56FD76B814F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 16:55:44 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=l0q4Y1R3;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=XU3cEllK;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114232-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114232-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A0F0A3121EB8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 14:52:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E8333D5227;
	Tue, 23 Jun 2026 14:52:54 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D4073D47B5
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 14:52:53 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782226374; cv=none; b=Afxwm/+5ypC+KZosV6+qtZcvqFfMc32T/IA6+4chHp6v9YEJOjDq2wZp7idhZ1S1IJniYBhxuMFRws6I+rYJGcqwIhCA+cf6+0i86IJhYvYeHr3YF2U2gqYpa16TaVzgCWmHwmfcyz4rsR6Fo2DSTBsLScYcC9e34IvfELVkTgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782226374; c=relaxed/simple;
	bh=qz1R0fc4ZtSZbGixQFSfsZn1O76p2On6dZ7J6oiFRY4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZnIpoyU89yfhhr9PaetS2LWDEWD//SYDBw8QFsJd8TjF5VsvPrXg4HVh3hKjPdJ8UZ4e5RTF/uEWKTrArplYKIgEQLj2G0ALp6pHB1OWnsx9D+/VRXpC4a8Fx2p9ywSH4WJhsfxsmSSs1VprBuanJ4l42imeoJt8pz4K5qjvKik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=l0q4Y1R3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XU3cEllK; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65NBZRSN4017477
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 14:52:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=zCrxoN3Ecrt
	yDTN0qwQ7dQRoeDYaqf80JwfgO7XBFYc=; b=l0q4Y1R3SlUmadE6Rar184Lg7iM
	xNrKLYtAbLZ2A0VD/jsRZj1e0r8OZTbJTiyAmqv1VigaPZrf+x5jj50r6dVMShH1
	sfBDEncV1S8ybsvKZgZAP0PdAwvVGLwHkRr3nZ3YbB/+q3w9wcLHKd4LuKwbfaNz
	HqXYDhlZ+kNlLC4xIW/NVf2TAH7/ZzrueOH6EbyLVlvHgyQEjzTEzaFyHhxIe3al
	JMfWvJVIsORxN2GAEAeAgn8GwuEA5fNyYWgpg4eVXoxeOtaq61od6QSlPI19eqx7
	PXxTR1nl6LVyEjDUGwQ5rNV0VliIExUosErpP887k4Pas+Sptxil9OxAFJg==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eygkjjw22-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 14:52:52 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-963b07e2003so6726062241.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 07:52:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782226371; x=1782831171; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zCrxoN3EcrtyDTN0qwQ7dQRoeDYaqf80JwfgO7XBFYc=;
        b=XU3cEllKSBsU9bZ69z0cftaCGYgrTMV0qJanOEdkYBMIcQvVTTVnYjUBAMKIp2Uhd3
         Tqv/QEzBYYQ05FgkR+oBSXipTNTeyW9exfNaHBUncAgUTkCmFv5l6gZmPu/gCG3y0i58
         VspxhVVwCnPB/cZtOUPAE8LEXPnedWp6vW4glFmL6FKeoWp+PBZ9U86SB3Ulhhqp83Wl
         i0UwGsq3iNa5jraLUeyGQzhqSMfSpfUA8iLCvn4qXJD9AaNS0yuvkJ7Yyr4LOaVRRFNC
         MVNdhUqRVHSWiaiin6WBgPzQq8t6WGF2/9ZdX7SDTfnLBYvMSBftdSWJh5/NdBq6OZWt
         OSfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782226371; x=1782831171;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zCrxoN3EcrtyDTN0qwQ7dQRoeDYaqf80JwfgO7XBFYc=;
        b=GulO5FPyFwNrD0G88SgbXDhT1gvjtTVYkfM/B4fWsFg/WUIig8VIFoP59coceji9Ac
         aafveqNlCF6NDuLzMWV4MUDuHHneshP40MKMPwOrmB+ayNaAtcVwcbX9HHKnLY99Eipn
         2Ea8JFoaTTrsURh7TpVaGS8toswL52+ZIKiFr7sWWM6NnRK5jS3FacDy93y1VNoZWOyt
         eFr1OjqV6+UEFZjb5XqgexMhbIBn31lCsSVr2JJdwJVYs1rSb1b2vMBcAfmsvs5armKq
         LItY5DUp3CrVB++rOdijDDfg6M3Loe3+mOe8558aETaU4SnCWr4Y0nMmyv9zhogQczT1
         NhmA==
X-Forwarded-Encrypted: i=1; AFNElJ/DqTSslG/Sl1p+QaFBAcdowcF2W01ROoRzu/qlVSl2FVVfwDINjS3vn9NwISCK4CD9WpueJ17wPYFN07Uu@vger.kernel.org
X-Gm-Message-State: AOJu0YxXeyo4XB2J71cTJdU12zgPb5SUcxvy3oVpXiJvJIQqeBnSFOJ7
	+4AmEiAd9T0MU4Uj+R50B6N3mQ7c2m8/jT6+Urr58f5w0OXsKsfFIcUeihU+smOx9s65/UhIOsG
	8byo/d36kGJWlQEG+Rg/iltl7AYwBnRj/XDJwocLPjm1t/vXKP8Qm0u85Nd9wH4HAHb4u
X-Gm-Gg: AfdE7cnYIXb6Qsx6sGN9me3Mm9i7i549A/SOxpvc3CcOrYJO8tRX9XzQetFFOE/qyVB
	rNgU2F22QduDUh6dzFeZ5rx7CXTRzlMYOmB5zPm1c68TLGBXZNbhhf30R1FRi3PbKhoDEGWs7DX
	ceqPegAw2HJ06rxvz/Ghc5Sjgn81OAyfZ+h+eGqGP3NrljJCB+Hq/YzRgO7SbH+N1x4thE49G8t
	1+byZzAYinK6N4t4OM86tchIslRNrKKKRFTK4Bi+hL/8kwFJzcATpRxeyD7LeMGvibLiDsmSr/m
	eHI1T2ZG6e+nVkfph927WUuF49JY7SMg7sFhsJFoZIFKl7kg7j5zDbz7yXViYv05N2QU/OAmHoJ
	tpe+1QGIQsr+GQhoHisrWs6nw0I/cL3OeYAS5ltOGsljyaI9FXu34+ka51grM8ceS9ewNzgPYKx
	MdYhvAQlQ9t8Y1qSklxK9EzwzgCw==
X-Received: by 2002:a05:6102:3ec4:b0:6c5:d55d:c093 with SMTP id ada2fe7eead31-72ff3f837f9mr1545474137.8.1782226371508;
        Tue, 23 Jun 2026 07:52:51 -0700 (PDT)
X-Received: by 2002:a05:6102:3ec4:b0:6c5:d55d:c093 with SMTP id ada2fe7eead31-72ff3f837f9mr1545276137.8.1782226366816;
        Tue, 23 Jun 2026 07:52:46 -0700 (PDT)
Received: from shalem (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c0c60aca46csm534042666b.36.2026.06.23.07.52.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 07:52:45 -0700 (PDT)
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
Subject: [RFC 10/12] i2c: acpi: Also register ACPI i2c_clients for adapters with a secondary ACPI fwnode
Date: Tue, 23 Jun 2026 16:52:23 +0200
Message-ID: <20260623145225.143218-11-johannes.goede@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDEyMiBTYWx0ZWRfXzgdlVDEVdDuX
 kWWgxoTjaJAy+IT4hp2BQ0WqPPVqOaatIsDlSMSdCXKVT7ajQNEVEO9cjbMqgf+QyiGf6N5kM68
 x4+aMTx7C+BFDYE1gdloR5erd9JXyeS85sWKfl/KhWdCFnJpicv2+hd4ZP/Xf2IwHIqj6yN9bv+
 hEfg6PeO7evcerMstqa6NCxoEpZ4WVVUPLfs1qyLDsfCuv+DGAh2tpuIJ1uzVuVcIv9HPbwfyIN
 XbERlGMdhAdwsBttKqNhDDZrkT+JKFjfdDWyRh7YjA3/b5898b1Y+2F46lg5fyCwjxDUVddzyWD
 mJm/QrXVhxiZK1h8EnXzm2/YIfMVVr4F60WppDUO03AnjLsqgXduBjSrQtIl0d0HpPElrHr16pr
 dTMmGssdDL5k4jt8xcKyxLaSSmgLGMbwl3plVuz+goTpFS0+f/ywHdu/ilHhXxFMpQDZJEk8oOJ
 T3NQ1R/ONByxC8yelXw==
X-Proofpoint-GUID: nXtUpPPx4bUUk687iwOpTJeC8rEpjuMW
X-Authority-Analysis: v=2.4 cv=SoKgLvO0 c=1 sm=1 tr=0 ts=6a3a9dc4 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=xqWC_Br6kY4A:10 a=FelO9ux0wxsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8 a=6UeluGelAAAA:8
 a=EkjFkVpK6-r5im3n5xMA:9 a=TD8TdBvy0hsOASGTdmB-:22 a=4zb3YkFaRy81KIeUJMwT:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDEyMiBTYWx0ZWRfX8cFTUH+4fNrS
 8HSE2sVMeYD4AVYArib/m2AdaVpeH16TIjIrm3CgpfY7QRu7mkuSoYro5iIbDVY8+YY0/WnQ3yI
 nxyJFvBc70BzZD6ME0hxxQam+fb1ZcI=
X-Proofpoint-ORIG-GUID: nXtUpPPx4bUUk687iwOpTJeC8rEpjuMW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_03,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 malwarescore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 adultscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606230122
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-114232-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:rafael@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:johannes.goede@oss.qualcomm.com,m:srini@kernel.org,m:krzk+dt@kernel.org,m:lumag@kernel.org,m:bartosz.golaszewski@oss.qualcomm.com,m:abel.vesa@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-acpi@vger.kernel.org,m:krzk@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER(0.00)[johannes.goede@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[johannes.goede@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 56FD76B814F

In DT-ACPI hybrid mode the primary fwnode of an i2c_adapter will be a DT/of
node and the secondary fwnode may point to an ACPI fwnode.

i2c_acpi_register_devices() exits early if has_acpi_companion() returns
false and has_acpi_companion() only checks the primary fwnode. Switch to
is_acpi_device_node_any() to also check the secondary.

The rest of the code to register ACPI i2c_clients uses
device_match_acpi_handle() which already handles this correctly.

Also adjust i2c_acpi_find_bus_speed() to use to_acpi_device_node_any()
to als make it work in DT-ACPI hybrid mode.

Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
---
 drivers/i2c/i2c-core-acpi.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/i2c-core-acpi.c b/drivers/i2c/i2c-core-acpi.c
index 28c0e4884a7f..995bd88ad09f 100644
--- a/drivers/i2c/i2c-core-acpi.c
+++ b/drivers/i2c/i2c-core-acpi.c
@@ -322,7 +322,7 @@ void i2c_acpi_register_devices(struct i2c_adapter *adap)
 	struct acpi_device *adev;
 	acpi_status status;
 
-	if (!has_acpi_companion(&adap->dev))
+	if (!is_acpi_device_node_any(adap->dev.fwnode))
 		return;
 
 	status = acpi_walk_namespace(ACPI_TYPE_DEVICE, ACPI_ROOT_OBJECT,
@@ -413,13 +413,15 @@ u32 i2c_acpi_find_bus_speed(struct device *dev)
 {
 	struct i2c_acpi_lookup lookup;
 	struct i2c_board_info dummy;
+	struct acpi_device *adev;
 	acpi_status status;
 
-	if (!has_acpi_companion(dev))
+	adev = to_acpi_device_node_any(dev->fwnode);
+	if (!adev)
 		return 0;
 
 	memset(&lookup, 0, sizeof(lookup));
-	lookup.search_handle = ACPI_HANDLE(dev);
+	lookup.search_handle = adev->handle;
 	lookup.min_speed = UINT_MAX;
 	lookup.info = &dummy;
 	lookup.index = -1;
-- 
2.54.0


