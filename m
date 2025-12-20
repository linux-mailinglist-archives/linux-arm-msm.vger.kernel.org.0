Return-Path: <linux-arm-msm+bounces-85998-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AFB69CD28B8
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Dec 2025 07:36:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 41968300FE0A
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Dec 2025 06:36:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B1D329AAF3;
	Sat, 20 Dec 2025 06:36:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SK9HEyo9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LYa05sco"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0D052236FC
	for <linux-arm-msm@vger.kernel.org>; Sat, 20 Dec 2025 06:36:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766212569; cv=none; b=oxzLl6967wpuOFhNqRl4/yhf1Cq6/eQm2AcnvMBlNSmNYJ38OlccRsW/VY1wDVKiYyvsdDY019/lOnEcWtmxU5CTfbZKffboRx4A5/4+ymlkhtu8A5L9ox9WAQiiUDOCj3wVnnPxum9xzIOHo2YZ89tqTvhWbWulePeqlwT5Fpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766212569; c=relaxed/simple;
	bh=G1gWv8618a7rqJzvKhye4h/vsqybaxCNL//qIdBIfmc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=jfbWn6Tbs7lO+8sdxWj2i6tLq9xoqsK5/cYqlp3FQAw723VlItAfpzppVwwmOb5ShDvEFrOz8xNtIM+xhQhjlWqEPgotKIOfInIT5Ka0ibyAHSvQOt52y7GRtCmj+KTJnuR/RxaAYQzJn7x6XOG1hR8mShyBP9BgQbkyhScAfT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SK9HEyo9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LYa05sco; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BK4PwfY2982898
	for <linux-arm-msm@vger.kernel.org>; Sat, 20 Dec 2025 06:36:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=dzx7C+q//Ee
	3OcHfJVXO31JMgk+3QiczRw+McarTXGM=; b=SK9HEyo9gk9DstMZfNsuVEFBeiX
	iuW12bfJkv1qqOMWsCoMKRH+mjI+o9uOiazES3FVe4hlQ9WE4XuAV7H/YZav5bT4
	jajcXpoGi3+gTLqFUcY/PLSmReZM4oHPGmJg9tjCEx22Vd6Bv4hRvNEri1ME6jYc
	zDGDDzDDNKp7TfKGfZxTD9DglrmedV2U4mF2Ajg+ActUSMtyX8NPzXQ98sBRWS7+
	F0udNRhYBNvkf/mhBmIa19EL0V4I1+5DMlNNo6Cgqx/us8xzJj5sVIuQyLWSG2Ad
	gHVJ2eV9g6k3Mr9ycF9qe0cEQuBgXEYHzb12qlvBvq/w5l4lFMEeixoWchw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b5mru06a5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 20 Dec 2025 06:36:07 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-34c93f0849dso2390254a91.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 22:36:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766212566; x=1766817366; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dzx7C+q//Ee3OcHfJVXO31JMgk+3QiczRw+McarTXGM=;
        b=LYa05scoK2BJJOL02tuS/5YQfvJIjiFZJek6t6DaJ1rc7XdE91iCmKmytaUg51bVh8
         d8vbx+ECDEneCw2e5opX0XWqF6q7hZcCIUdsxpQNFqQLVrQx/gDcfOSZqQg2lWx0UukV
         5has1M14DQAk6gIHju47+bGkMVzjiRy8Ti4tPud8PWz/KLDPDUoa6naSBHW3nCHnvbPS
         r3h0ffPye1AjnkNC6dgD9vUu1cTW0eS+ijcFVLr5CjZIX2gr1zgyFqEtnJvSRt5q8JkK
         WbCwslBqvifF9PC63X4iavrR+SMW49zl2eOofsbQKsm027JNVVunUYRRE2166ADXtA8Z
         thKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766212566; x=1766817366;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dzx7C+q//Ee3OcHfJVXO31JMgk+3QiczRw+McarTXGM=;
        b=wHqU7p+ngt+gkcVxnN3/WywRdUcaFUNFeApPdlD9U0I2YSCLshUSI1Z1cRIwptV1sI
         whKyEX2IX8ztFDWdzQY/ByyUndSXfjR5Yj7DXqxf9z44YR/OD+4iwEdcRQ9XH2uT+xqS
         RZFm4PKej8GDGTRB7k9djyo533li1VuXKzjhaDmC+eZl23UAWd1eb98haF/NcLg6PJ6g
         jWdJUIeFTYO6WUQX9o05iG7Fq0lw4T3vwYRdG9d8V4+cacymXhJe7Ehc9hfIXdmBokn6
         H7W60jI34nb8D0Lmd4NxS83QLv921tpW9zQ6fm4Cle3Gro24ypwkmOx2ji2c8UnalATN
         F4dA==
X-Forwarded-Encrypted: i=1; AJvYcCXboWwR1fstQ34HuUNN2LyeKAOHzvEnQWCVX2dwOxRzWv85Wh7lJzWWXtg2H1q10XPnteZy4T2vilOLDBZV@vger.kernel.org
X-Gm-Message-State: AOJu0YynANJM4F2s9sC6XLPxs6GNLI1QyQIUaH/YywRKqY3g/EE0pdqr
	ZEDXK9f9sqlLUoch/acFADLL9/9i1naSVNJYR+TwNLz+MfMN1UXSFx1CX/4m7o+DlUVpBU3Qc+H
	7fIGY6ZaDlSwnrrVLWWd7VBzYA/ln6uXwHJHv9muS/Px3Yw9bczQMe+tF69yhvWm30oMs
X-Gm-Gg: AY/fxX4NM9R2/CO9giOo90VvVzYVsET+nFGh68m9G8nKKXAdhP/nqXGAjL8T8hn1l+Z
	Ztszwit7NCUoj0I/v/SagVImx3EBzSSIZ7DV4OEANCmCSVDxSM0ZPEgG9LDEHZlG8eOOYpIdsMi
	JBFzNXfkHpLh5ZtlmeLFpgOG1qNp4YT2p1VpiAyqmFd+O2hnvQQ4bCFh82e+ZD8mjOOyLaw16ys
	eiLZOaUFC0XJlH6wxk0Mq09/laFNDyDbmDCQGWHYJUZGqT4GhX95vKk3mst5DScRgzcZewTkeRj
	wqVkTVZXq1NHa04oiPoIj0N0X2SGtvuHLoc02159guXaGmtoznaz5iKeNCulINLNBMqR3IMEXCY
	5mZtcy0oFHbTEq0sBQKMC5/HQsvUjP22SKAhsBakt+2g=
X-Received: by 2002:a17:90b:3843:b0:32e:4716:d551 with SMTP id 98e67ed59e1d1-34e90d6a42cmr4876263a91.6.1766212566517;
        Fri, 19 Dec 2025 22:36:06 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFYBs2yDuHgDxwYW9beNVaEliIpFPtjmvVWuWEZ7C6xUwl7d8HnoyXdKA7TYDgRuBYV3SKxvw==
X-Received: by 2002:a17:90b:3843:b0:32e:4716:d551 with SMTP id 98e67ed59e1d1-34e90d6a42cmr4876235a91.6.1766212565931;
        Fri, 19 Dec 2025 22:36:05 -0800 (PST)
Received: from hu-swatagar-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34e7723b3a8sm2847143a91.3.2025.12.19.22.36.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Dec 2025 22:36:05 -0800 (PST)
From: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Icenowy Zheng <uwu@icenowy.me>,
        Matthias Kaehlcke <mka@chromium.org>,
        =?UTF-8?q?J=20=2E=20Neusch=C3=A4fer?= <j.ne@posteo.net>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
        Mike Looijmans <mike.looijmans@topic.nl>,
        Catalin Popescu <catalin.popescu@leica-geosystems.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Pin-yen Lin <treapking@chromium.org>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Swati Agarwal <swati.agarwal@oss.qualcomm.com>
Subject: [PATCH v3 2/4] usb: misc: onboard_usb_hub: Add Genesys Logic GL3590 hub support
Date: Sat, 20 Dec 2025 12:05:35 +0530
Message-Id: <20251220063537.3639535-3-swati.agarwal@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251220063537.3639535-1-swati.agarwal@oss.qualcomm.com>
References: <20251220063537.3639535-1-swati.agarwal@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIwMDA1MCBTYWx0ZWRfX24gJZY7prjHO
 k1y2FcNGtOGxrGLSpdMeh+K2QyhHXKiorPltkWzb48hfUbpDEE+BjDqAeO54V7KrKrqukhwBlTd
 P8uHskPIIujGh9VWIYPe8XoEuH7hJ3NH4kqJDFJFCWlmXhxtjw/fXcrn8HG56RhsGOHBz1gC3rl
 eeLyWpUa3CZd0VrBJ4h+JW9GbY5fsUb0wLF2UjVPmugYnKpky/9nIgik9hFz4zahT/eOzmtuQG0
 Cg/lomB1HIJY5I4ZrEYSQGd0yakI+2se6eHccCsn7OvxEHd61WJ/StbaoB7wGN6TvEEoG26fUvs
 24bdO/9tHcePATlKMyKVez4f0p7r9WOCNaK7zzLxRPYmmXOnCuhNegQlTQaruDHD4qEDk1RMc5n
 KZpnXceQ/DKMZuSQh1VSaRmeKuTW+u6Ec+bpP3SYmUK64jceebCqdyPXlVGb8lMbv+Q6oJWUt9M
 79ZrPKs8cIQB3UIssSw==
X-Authority-Analysis: v=2.4 cv=VMnQXtPX c=1 sm=1 tr=0 ts=694643d7 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=dwk_HVr8QTvVkdqdSRoA:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: 6MUCYPZRBYsWF2wh7pA-AFoc6V2uwBcj
X-Proofpoint-GUID: 6MUCYPZRBYsWF2wh7pA-AFoc6V2uwBcj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-20_01,2025-12-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 phishscore=0 suspectscore=0 lowpriorityscore=0
 spamscore=0 adultscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512200050

Add support for the GL3590 4 ports USB3.2 hub. This allows to control its
reset pins with a gpio.

Signed-off-by: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
---
 drivers/usb/misc/onboard_usb_dev.c | 1 +
 drivers/usb/misc/onboard_usb_dev.h | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/usb/misc/onboard_usb_dev.c b/drivers/usb/misc/onboard_usb_dev.c
index 41360a7591e5..bde303b820d7 100644
--- a/drivers/usb/misc/onboard_usb_dev.c
+++ b/drivers/usb/misc/onboard_usb_dev.c
@@ -661,6 +661,7 @@ static const struct usb_device_id onboard_dev_id_table[] = {
 	{ USB_DEVICE(VENDOR_ID_GENESYS, 0x0608) }, /* Genesys Logic GL850G USB 2.0 HUB */
 	{ USB_DEVICE(VENDOR_ID_GENESYS, 0x0610) }, /* Genesys Logic GL852G USB 2.0 HUB */
 	{ USB_DEVICE(VENDOR_ID_GENESYS, 0x0620) }, /* Genesys Logic GL3523 USB 3.1 HUB */
+	{ USB_DEVICE(VENDOR_ID_GENESYS, 0x0625) }, /* Genesys Logic GL3590 USB 3.2 HUB */
 	{ USB_DEVICE(VENDOR_ID_MICROCHIP, 0x2412) }, /* USB2412 USB 2.0 HUB */
 	{ USB_DEVICE(VENDOR_ID_MICROCHIP, 0x2514) }, /* USB2514B USB 2.0 HUB */
 	{ USB_DEVICE(VENDOR_ID_MICROCHIP, 0x2517) }, /* USB2517 USB 2.0 HUB */
diff --git a/drivers/usb/misc/onboard_usb_dev.h b/drivers/usb/misc/onboard_usb_dev.h
index c1462be5526d..7706a04f2630 100644
--- a/drivers/usb/misc/onboard_usb_dev.h
+++ b/drivers/usb/misc/onboard_usb_dev.h
@@ -140,6 +140,7 @@ static const struct of_device_id onboard_dev_match[] = {
 	{ .compatible = "usb5e3,608", .data = &genesys_gl850g_data, },
 	{ .compatible = "usb5e3,610", .data = &genesys_gl852g_data, },
 	{ .compatible = "usb5e3,620", .data = &genesys_gl852g_data, },
+	{ .compatible = "usb5e3,625", .data = &genesys_gl852g_data, },
 	{ .compatible = "usb5e3,626", .data = &genesys_gl852g_data, },
 	{ .compatible = "usbbda,179", .data = &realtek_rtl8188etv_data, },
 	{ .compatible = "usbbda,411", .data = &realtek_rts5411_data, },
-- 
2.34.1


