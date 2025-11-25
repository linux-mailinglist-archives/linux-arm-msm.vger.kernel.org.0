Return-Path: <linux-arm-msm+bounces-83332-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F768C876F9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Nov 2025 00:14:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id E9E57353AF8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Nov 2025 23:14:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8D1B2D9EC9;
	Tue, 25 Nov 2025 23:14:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YbuVlDOF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KCUs5o6V"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC4BA2C327E
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Nov 2025 23:14:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764112447; cv=none; b=fPvLF6mZ2TPjbduMCSEl6lQIeLgBu4V8B/AM7GcAASgFfZGOyNXhsS7Hzi6X8tyVkcJ8POQFFrst1aTsuwZcbyU1dbMdkHLuUBSbtnQtzZmEYgGH4mV6+cstFpr1IhxGovfDmgn0Czc2x1TasDGijSeirV2v2xYg304pQQtUJ1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764112447; c=relaxed/simple;
	bh=BsXXOczt0oXY0VIdhfNgrA7ysx8+zsvMk71Qc9L38PQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ThBtHL2d4FwDdU62btB2ruRQ7Ibw1FcPKwL9Q9Herw5Csd6Tgs5vn7EZxpwiiioDpEeYbz7I+aKKfvuAm91xtTT0UjKnMUWpiR7yTirl1s9kbPVX3Phq+VB0pa3aWvqOGp1cOTT4wMK8I5DAcskog13fyoyoNnXMmjeyFLIvEhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YbuVlDOF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KCUs5o6V; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5APHAf8h3890204
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Nov 2025 23:14:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PtAZGpu9f7p3Dg2cD3LxIDZLbgJSww8TCf5/UxdIrbg=; b=YbuVlDOFunrzqizI
	Eu/pN8wGCSn+SUYTIHuOdDGzZaP+i8cPuWMstVprt2SkBTQYc4Y62qpxlyemG3mW
	beG/BGmMA5DU0KH4C8LtPQ1XZSEWoQQ2SYt/fMqImBSqwI0v06gsbAcY2WW5U2zh
	wv8BeIN/dInkko20GQB8nzBYiWZK6YTrQI6uPoah1aUsZZPbY3Lub+YUOMZgKtOJ
	qjlNcKFqFifNRG+xrAW5LXcSRMzBeh0I8cw5qwWE8La6evK4zO8pMwkHSJuhGWXU
	0I0fg5oG9OLRamc5OmjRLZ0p7xjSRYMuouXitoUXafcK3NcSnoopB0QCqd+899ZI
	dETJcA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4angme8u3a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Nov 2025 23:14:03 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8b29da49583so61485785a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Nov 2025 15:14:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764112443; x=1764717243; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PtAZGpu9f7p3Dg2cD3LxIDZLbgJSww8TCf5/UxdIrbg=;
        b=KCUs5o6VPxLzlpS7V3YZU8bag1EZ9I2X2nl8mc4jxxeywUxhHRBSQXe7HbJ1fL9tMZ
         ntAg87lRJZ3laE305hBkWWJmFNHIzupIOsLnRBXDMo5BpZBigBbw+dr78MzoDJgmtF/R
         VM0CqDIURjre3Dnq/KahBjE5Gc7DI6eT6xyRAa9uN///YyT9WQXms+xYpsAByNQjqkog
         dDYpb1mev+30UScrKfWT53TOtu8yPjzPM1e79xZpT/yojPmmLdBDirBTMYvTGKOwh8e5
         p7UjZgldTAnEZ/TaOxBuz2lQghwL53wY31pCw1RjZ6I0Hbg+qMD54jmGIDRHvkGoB4rA
         z/BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764112443; x=1764717243;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PtAZGpu9f7p3Dg2cD3LxIDZLbgJSww8TCf5/UxdIrbg=;
        b=f/Fmew61MRGlRN0Yqy5BrBfhKuI5I1P0AFAEln1xsH+wsL39at9y0R2zJoMk8siCBb
         ph0phXPggRea+E4FVXrCZXEDrEQBHBbtLPeU4w2IRhn/znhxK1N30oZBPW8WyPQ6RrQm
         Os0hXOXoKeQB6aQprLQCj4RmKB8Kwsqp8pnGf+BbuQQ8gJSL6r5+JuTx1KwFQnMjxouq
         4n94/mD5G6eH0buPMp+WA09/3fOkwGMXBIhWHyx+5Rlb1eSG9wrbl80e8o3dHh1HSLri
         mtsM3L0ONiGt4HM0z7DLeH2GxcGaEXeVSCPqeqg9OUr5TjymBftYqPX8ZR2y8z6uG541
         WeGg==
X-Forwarded-Encrypted: i=1; AJvYcCXDI8OyyKjtMHDLDBRL63gW4ivtcnIowkNPm67OQKzsjec/A0g4VQIPCUA04J30tWgxXJPKtUOd0hEixHuf@vger.kernel.org
X-Gm-Message-State: AOJu0YyUo9eu1JKzIIlOpZBOCSRWIlvX4ksmN0PvYP4zCs7JiFTc3erN
	ww+IPyP6EH1555IAjgfkJRH/IUYPLZyZTmuSBb0jb4D/pTjeQgz6jSR5agKoHFOTI1GhY2YwDc7
	/VMpm86AYRkuWIxeKbRumEeLko5Hlc+OhUIQPcyTUJt2fMcefgvbhMvlMh2ROQ4hAtfOQ
X-Gm-Gg: ASbGnctEzdAV90kJ5EFRfY7SWiL/9xrz/4RGg8EY9WzRYMr6s3fhwZAzumzXI1uGQcg
	etndmIndIls08Jg98ByTBtsyoSmNna2S+T5rJ4lqG81hbvlIaJTnTMtcapbFxfBb2Js38uma/jV
	LgGTgQVrNRT0cvd1Hr70j/Ai8qtX6VoxekK+Js9zj3mHOjbAfmgkgpal5Cy4D6tGMh6zWJHiRiu
	aQSRE3WJsxf451A7FOSuhymQ9Z29UFfNUuQyVhnS9zkzD+lFsnqoyM8hJduBM2w6HDvtvrvmO1s
	4LiojOjzkAlIvqiZ+54cLDy+Y0Fto8VpWAGWpYTf/oFAXfNQna23M5MIDISaNtrFWw7nT8DLVp2
	4E1MELadA4LxrtN6+1mZ10AzGmPD7Ifel7QZVqcLB72ouXk6n37bxbZQ+V2s3CJQl6maXu2lOhF
	Dp75t9mjH68eDiSqaEddvMO38=
X-Received: by 2002:a05:620a:178c:b0:8b2:ea3f:2fa4 with SMTP id af79cd13be357-8b32ab88726mr2814544585a.6.1764112442605;
        Tue, 25 Nov 2025 15:14:02 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEljCGFZesnwUMs7lJgVRRykQWljDo8ioqQRW0kjhl+YktLGJ7LVhnpkdO9ykbxNat+JRaooA==
X-Received: by 2002:a05:620a:178c:b0:8b2:ea3f:2fa4 with SMTP id af79cd13be357-8b32ab88726mr2814538885a.6.1764112441967;
        Tue, 25 Nov 2025 15:14:01 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-37cc6b59f01sm35052291fa.17.2025.11.25.15.14.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Nov 2025 15:14:01 -0800 (PST)
Date: Wed, 26 Nov 2025 01:13:59 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: david@ixit.cz
Cc: Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Casey Connolly <casey.connolly@linaro.org>,
        Casey Connolly <casey@connolly.tech>,
        Joel Selvaraj <foss@joelselvaraj.com>,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Alexander Martinz <amartinz@shiftphones.com>,
        =?utf-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>,
        Richard Acayan <mailingradian@gmail.com>,
        Alexey Minnekhanov <alexeymin@postmarketos.org>,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        phone-devel@vger.kernel.org
Subject: Re: [PATCH RFC 2/8] power: supply: Add driver for Qualcomm PMI8998
 fuel gauge
Message-ID: <jddpwqo4f4irukwc725b3c5dmsitjgupcvupvbe7fom7vx2p6r@ilfmls4fzrn7>
References: <20251124-pmi8998_fuel_gauge-v1-0-dd3791f61478@ixit.cz>
 <20251124-pmi8998_fuel_gauge-v1-2-dd3791f61478@ixit.cz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251124-pmi8998_fuel_gauge-v1-2-dd3791f61478@ixit.cz>
X-Authority-Analysis: v=2.4 cv=PJgCOPqC c=1 sm=1 tr=0 ts=6926383b cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=WFa1dZBpAAAA:8 a=OuZLqq7tAAAA:8 a=sfOm8-O8AAAA:8 a=23Kvwp-Q3Ddmxr0FBjgA:9
 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=MZguhEFr_PtxzKXayD1K:22 a=AKGiAy9iJ-JzxKVHQNES:22 a=TvTJqdcANYtsRzA46cdi:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI1MDE5MyBTYWx0ZWRfX49yCBPEOfXzZ
 ZS7eZ1fZtETc7KkkoXeWMyiN+CjYbHMKfiHTedaD8jeLWUbQcZSYQDxdge7O0fGHMMiJQByw9aW
 hOZC2mNifuntUw64DA/IVyhEuef9yHY//hAxyQh4f0+MHTNr7OInvy6VSwTtoy1bPdOMHx6ulF7
 wOxvVMDKiA/kLBM9y1VPLl3CtB9gj0kMIsQqduV7K51IoiQwcIU6bM2OkA/1nEKCcCVzoKTudHK
 MdLtZJqncbHcPqB99CMq1NCmzg+UcgFClyO7aBtlaXS8gnw7FPSURsUOz3rWEDBEmoo+VBRZo0l
 Lqqz/NeJeL01VGodea0rtxiWr8stGF29TaH+jYb9h9n41WrWCFXBB1cyrsSiVB1eN2h9MikXdxy
 yQOA9Ksrkpokvixx5mhGXMJmQSguZA==
X-Proofpoint-GUID: GRVLl5ongJcc8kZ3vpR0TN5xmWB6ZsHA
X-Proofpoint-ORIG-GUID: GRVLl5ongJcc8kZ3vpR0TN5xmWB6ZsHA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 suspectscore=0
 adultscore=0 spamscore=0 malwarescore=0 clxscore=1015 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511250193

On Mon, Nov 24, 2025 at 10:53:35PM +0100, David Heidelberg via B4 Relay wrote:
> From: Joel Selvaraj <foss@joelselvaraj.com>
> 
> Ths driver supports the fuel gauge hardware available on PMICs known as
> 3rd generation fuel gauge hardware available on PMI8998.
> 
> Co-developed-by: Casey Connolly <casey@connolly.tech>
> Co-developed-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
> Co-developed-by: Yassine Oudjana <y.oudjana@protonmail.com>
> Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
> Signed-off-by: David Heidelberg <david@ixit.cz>

This can't be applied, there is no author's (Joel Selvaraj) SoB.

> ---
>  drivers/power/supply/Kconfig      |   8 +
>  drivers/power/supply/Makefile     |   1 +
>  drivers/power/supply/pmi8998_fg.c | 687 ++++++++++++++++++++++++++++++++++++++
>  3 files changed, 696 insertions(+)
> 
> diff --git a/drivers/power/supply/Kconfig b/drivers/power/supply/Kconfig
> index 92f9f7aae92f2..4024c6fe3fef2 100644
> --- a/drivers/power/supply/Kconfig
> +++ b/drivers/power/supply/Kconfig
> @@ -746,6 +746,14 @@ config CHARGER_PM8916_LBC
>  	  To compile this driver as module, choose M here: the
>  	  module will be called pm8916_lbc.
>  
> +config BATTERY_PMI8998_FG
> +	tristate "Qualcomm PMI8998 PMIC fuel gauge driver"
> +	depends on MFD_SPMI_PMIC
> +	help
> +	  Say Y here to enable the Qualcomm PMI8998 PMIC Fuel Gauge driver.
> +	  This adds support for battery fuel gauging and state of charge of
> +	  battery connected to the fuel gauge.
> +
>  config CHARGER_BQ2415X
>  	tristate "TI BQ2415x battery charger driver"
>  	depends on I2C
> diff --git a/drivers/power/supply/Makefile b/drivers/power/supply/Makefile
> index 4b79d5abc49a7..03584efa2b1b0 100644
> --- a/drivers/power/supply/Makefile
> +++ b/drivers/power/supply/Makefile
> @@ -96,6 +96,7 @@ obj-$(CONFIG_CHARGER_MT6370)	+= mt6370-charger.o
>  obj-$(CONFIG_CHARGER_QCOM_SMBB)	+= qcom_smbb.o
>  obj-$(CONFIG_BATTERY_PM8916_BMS_VM)	+= pm8916_bms_vm.o
>  obj-$(CONFIG_CHARGER_PM8916_LBC)	+= pm8916_lbc.o
> +obj-$(CONFIG_BATTERY_PMI8998_FG)	+= pmi8998_fg.o
>  obj-$(CONFIG_CHARGER_BQ2415X)	+= bq2415x_charger.o
>  obj-$(CONFIG_CHARGER_BQ24190)	+= bq24190_charger.o
>  obj-$(CONFIG_CHARGER_BQ24257)	+= bq24257_charger.o
> diff --git a/drivers/power/supply/pmi8998_fg.c b/drivers/power/supply/pmi8998_fg.c
> new file mode 100644
> index 0000000000000..d5fccd16a013b
> --- /dev/null
> +++ b/drivers/power/supply/pmi8998_fg.c
> @@ -0,0 +1,687 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/* Copyright (c) 2020, The Linux Foundation. All rights reserved. */
> +
> +#include <linux/device.h>
> +#include <linux/interrupt.h>
> +#include <linux/kernel.h>
> +#include <linux/math64.h>
> +#include <linux/module.h>
> +#include <linux/of_address.h>
> +#include <linux/of_device.h>
> +#include <linux/of_irq.h>
> +#include <linux/platform_device.h>
> +#include <linux/power_supply.h>
> +#include <linux/regmap.h>
> +#include <linux/types.h>
> +#include <linux/workqueue.h>
> +
> +/* SOC */
> +#define BATT_MONOTONIC_SOC		0x009
> +
> +/* BATT */
> +#define PARAM_ADDR_BATT_TEMP		0x150
> +#define BATT_INFO_JEITA_COLD		0x162
> +#define BATT_INFO_JEITA_COOL		0x163
> +#define BATT_INFO_JEITA_WARM		0x164
> +#define BATT_INFO_JEITA_HOT		0x165
> +#define PARAM_ADDR_BATT_VOLTAGE		0x1a0
> +#define PARAM_ADDR_BATT_CURRENT		0x1a2
> +
> +/* MEMIF */
> +#define MEM_INTF_IMA_CFG		0x452
> +#define MEM_INTF_IMA_EXP_STS		0x455
> +#define MEM_INTF_IMA_HW_STS		0x456
> +#define MEM_INTF_IMA_ERR_STS		0x45f
> +#define MEM_INTF_ADDR_LSB		0x461
> +#define MEM_INTF_RD_DATA0		0x467
> +#define MEM_INTF_WR_DATA0		0x463
> +#define MEM_IF_DMA_STS			0x470
> +#define MEM_IF_DMA_CTL			0x471
> +
> +#define BATT_TEMP_LSB_MASK		GENMASK(7, 0)
> +#define BATT_TEMP_MSB_MASK		GENMASK(2, 0)
> +
> +struct pmi8998_fg_chip {
> +	struct device *dev;
> +	unsigned int base;
> +	struct regmap *regmap;
> +	struct notifier_block nb;
> +
> +	struct power_supply *batt_psy;
> +	struct power_supply *chg_psy;
> +	int status;
> +	struct delayed_work status_changed_work;
> +};
> +
> +/*
> + * IO functions
> + */
> +
> +/**
> + * @brief pmi8998_fg_read() - Read multiple registers with regmap_bulk_read

Please see Documentation/doc-guide and reforman kerneldoc
appropriately.

> + *
> + * @param chip Pointer to chip
> + * @param val Pointer to read values into
> + * @param addr Address to read from
> + * @param len Number of registers (bytes) to read
> + * @return int 0 on success, negative errno on error
> + */
> +static int pmi8998_fg_read(struct pmi8998_fg_chip *chip, u8 *val, u16 addr, int len)
> +{
> +	if (((chip->base + addr) & 0xff00) == 0)
> +		return -EINVAL;

A comment would be apprciated

> +
> +	dev_vdbg(chip->dev, "%s: Reading 0x%x bytes from 0x%x", __func__, len, addr);

No need to, regmap already has debugging / tracing functionality.

> +
> +	return regmap_bulk_read(chip->regmap, chip->base + addr, val, len);
> +}
> +
> +/**
> + * @brief pmi8998_fg_write() - Write multiple registers with regmap_bulk_write
> + *
> + * @param chip Pointer to chip
> + * @param val Pointer to write values from
> + * @param addr Address to write to
> + * @param len Number of registers (bytes) to write
> + * @return int 0 on success, negative errno on error
> + */
> +static int pmi8998_fg_write(struct pmi8998_fg_chip *chip, u8 *val, u16 addr, int len)
> +{
> +	bool sec_access = (addr & 0xff) > 0xd0;
> +	u8 sec_addr_val = 0xa5;
> +	int ret;
> +
> +	if (((chip->base + addr) & 0xff00) == 0)
> +		return -EINVAL;
> +
> +	dev_vdbg(chip->dev, "%s: Writing 0x%x to 0x%x", __func__, *val, addr);
> +
> +	if (sec_access) {
> +		ret = regmap_bulk_write(chip->regmap,
> +					((chip->base + addr) & 0xff00) | 0xd0,
> +				&sec_addr_val, 1);

Isn't it required to lock it again?

> +		if (ret)
> +			return ret;
> +	}
> +
> +	return regmap_bulk_write(chip->regmap, chip->base + addr, val, len);
> +}
> +
> +/**
> + * @brief pmi8998_fg_masked_write() - like pmi8998_fg_write but applies
> + * a mask first.
> + *
> + * @param chip Pointer to chip
> + * @param val Pointer to write values from
> + * @param addr Address to write to
> + * @param len Number of registers (bytes) to write
> + * @return int 0 on success, negative errno on error
> + */
> +static int pmi8998_fg_masked_write(struct pmi8998_fg_chip *chip, u16 addr, u8 mask, u8 val)
> +{
> +	u8 reg;
> +	int ret;
> +
> +	ret = pmi8998_fg_read(chip, &reg, addr, 1);
> +	if (ret)
> +		return ret;
> +
> +	reg &= ~mask;
> +	reg |= val & mask;
> +
> +	return pmi8998_fg_write(chip, &reg, addr, 1);

regmap_update_bits? Or at least a lock around?

> +}
> +
> +/*
> + * Battery status
> + */
> +
> +/**
> + * @brief pmi8998_fg_get_capacity() - Get remaining capacity of battery
> + *
> + * @param chip Pointer to chip
> + * @param val Pointer to store value at
> + * @return int 0 on success, negative errno on error
> + */
> +static int pmi8998_fg_get_capacity(struct pmi8998_fg_chip *chip, int *val)
> +{
> +	u8 cap[2];
> +	int ret;
> +
> +	ret = pmi8998_fg_read(chip, cap, BATT_MONOTONIC_SOC, 2);
> +	if (ret) {
> +		dev_err(chip->dev, "Failed to read capacity: %d", ret);
> +		return ret;
> +	}
> +
> +	if (cap[0] != cap[1])
> +		cap[0] = cap[0] < cap[1] ? cap[0] : cap[1];
> +
> +	*val = DIV_ROUND_CLOSEST((cap[0] - 1) * 98, 0xff - 2) + 1;
> +
> +	return 0;
> +}
> +
> +/**
> + * @brief pmi8998_fg_get_temperature() - Get temperature of battery
> + *
> + * @param chip Pointer to chip
> + * @param val Pointer to store value at
> + * @return int 0 on success, negative errno on error
> + */
> +static int pmi8998_fg_get_temperature(struct pmi8998_fg_chip *chip, int *val)
> +{
> +	int ret, temp;
> +	u8 readval[2];
> +
> +	ret = pmi8998_fg_read(chip, readval, PARAM_ADDR_BATT_TEMP, 2);
> +	if (ret) {
> +		dev_err(chip->dev, "Failed to read temperature: %d\n", ret);
> +		return ret;
> +	}
> +
> +	temp = ((readval[1] & BATT_TEMP_MSB_MASK) << 8) |
> +		(readval[0] & BATT_TEMP_LSB_MASK);
> +	temp = DIV_ROUND_CLOSEST(temp * 10, 4);
> +
> +	*val = temp - 2730;
> +
> +	return 0;
> +}
> +
> +/**
> + * @brief pmi8998_fg_get_current() - Get current being drawn from battery
> + *
> + * @param chip Pointer to chip
> + * @param val Pointer to store value at
> + * @return int 0 on success, negative errno on error
> + */
> +static int pmi8998_fg_get_current(struct pmi8998_fg_chip *chip, int *val)
> +{
> +	s16 temp;
> +	u8 readval[2];
> +	int ret;
> +
> +	ret = pmi8998_fg_read(chip, readval, PARAM_ADDR_BATT_CURRENT, 2);
> +	if (ret) {
> +		dev_err(chip->dev, "Failed to read current: %d\n", ret);
> +		return ret;
> +	}
> +
> +	/* handle rev 1 too */
> +	temp = (s16)(readval[1] << 8 | readval[0]);
> +	*val = div_s64((s64)temp * 488281, 1000);
> +
> +	/*
> +	 * PSY API expects charging batteries to report a positive current, which is inverted
> +	 * to what the PMIC reports.
> +	 */
> +	*val = -*val;
> +
> +	return 0;
> +}
> +
> +/**
> + * @brief pmi8998_fg_get_voltage() - Get voltage of battery
> + *
> + * @param chip Pointer to chip
> + * @param val Pointer to store value at
> + * @return int 0 on success, negative errno on error
> + */
> +static int pmi8998_fg_get_voltage(struct pmi8998_fg_chip *chip, int *val)
> +{
> +	int temp;
> +	u8 readval[2];
> +	int ret;
> +
> +	ret = pmi8998_fg_read(chip, readval, PARAM_ADDR_BATT_VOLTAGE, 2);
> +	if (ret) {
> +		dev_err(chip->dev, "Failed to read voltage: %d\n", ret);
> +		return ret;
> +	}
> +
> +	/* handle rev 1 too */
> +	temp = readval[1] << 8 | readval[0];
> +	*val = div_u64((u64)temp * 122070, 1000);
> +
> +	return 0;
> +}
> +
> +/**
> + * @brief pmi8998_fg_get_temp_threshold() - Get configured temperature thresholds
> + *
> + * @param chip Pointer to chip
> + * @param psp Power supply property of temperature limit
> + * @param val Pointer to store value at
> + * @return int 0 on success, negative errno on error
> + */
> +static int pmi8998_fg_get_temp_threshold(struct pmi8998_fg_chip *chip,
> +					 enum power_supply_property psp, int *val)
> +{
> +	u8 temp;
> +	u16 reg;
> +	int ret;
> +
> +	switch (psp) {
> +	case POWER_SUPPLY_PROP_TEMP_MIN:
> +		reg = BATT_INFO_JEITA_COLD;
> +		break;
> +	case POWER_SUPPLY_PROP_TEMP_MAX:
> +		reg = BATT_INFO_JEITA_HOT;
> +		break;
> +	case POWER_SUPPLY_PROP_TEMP_ALERT_MIN:
> +		reg = BATT_INFO_JEITA_COOL;
> +		break;
> +	case POWER_SUPPLY_PROP_TEMP_ALERT_MAX:
> +		reg = BATT_INFO_JEITA_WARM;
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	ret = pmi8998_fg_read(chip, &temp, reg, 1);
> +	if (ret < 0) {
> +		dev_err(chip->dev, "Failed to read JEITA property %d level: %d\n", psp, ret);
> +		return ret;
> +	}
> +
> +	/* Resolution is 0.5C. Base is -30C. */
> +	*val = (((5 * temp) / 10) - 30) * 10;
> +
> +	return 0;
> +}
> +
> +/*
> + * Battery power supply
> + */
> +
> +static enum power_supply_property pmi8998_fg_props[] = {
> +	POWER_SUPPLY_PROP_STATUS,
> +	POWER_SUPPLY_PROP_TECHNOLOGY,
> +	POWER_SUPPLY_PROP_CAPACITY,
> +	POWER_SUPPLY_PROP_CURRENT_NOW,
> +	POWER_SUPPLY_PROP_VOLTAGE_NOW,
> +	POWER_SUPPLY_PROP_PRESENT,
> +	POWER_SUPPLY_PROP_TEMP,
> +	POWER_SUPPLY_PROP_TEMP_MIN,
> +	POWER_SUPPLY_PROP_TEMP_MAX,
> +	POWER_SUPPLY_PROP_TEMP_ALERT_MIN,
> +	POWER_SUPPLY_PROP_TEMP_ALERT_MAX,
> +};
> +
> +static int pmi8998_fg_get_property(struct power_supply *psy,
> +				   enum power_supply_property psp,
> +				   union power_supply_propval *val)
> +{
> +	struct pmi8998_fg_chip *chip = power_supply_get_drvdata(psy);
> +	int temp, ret = 0;
> +
> +	dev_dbg(chip->dev, "Getting property: %d", psp);
> +
> +	switch (psp) {
> +	case POWER_SUPPLY_PROP_STATUS:
> +		/* Get status from charger if available */
> +		if (chip->chg_psy &&
> +		    chip->status != POWER_SUPPLY_STATUS_UNKNOWN) {
> +			val->intval = chip->status;

return 0;

drop else

> +		} else {
> +			/*
> +			 * Fall back to capacity and current-based
> +			 * status checking
> +			 */
> +			ret = pmi8998_fg_get_capacity(chip, &temp);
> +			if (ret) {
> +				val->intval = POWER_SUPPLY_STATUS_UNKNOWN;
> +				break;
> +			}
> +			if (temp == 100) {
> +				val->intval = POWER_SUPPLY_STATUS_FULL;
> +				break;
> +			}
> +
> +			ret = pmi8998_fg_get_current(chip, &temp);
> +			if (ret) {
> +				val->intval = POWER_SUPPLY_STATUS_UNKNOWN;
> +				break;
> +			}
> +			if (temp < 0)
> +				val->intval = POWER_SUPPLY_STATUS_CHARGING;
> +			else if (temp > 0)
> +				val->intval = POWER_SUPPLY_STATUS_DISCHARGING;
> +			else
> +				val->intval = POWER_SUPPLY_STATUS_NOT_CHARGING;
> +		}
> +
> +		break;
> +	case POWER_SUPPLY_PROP_TECHNOLOGY:
> +		val->intval = POWER_SUPPLY_TECHNOLOGY_LION;
> +		break;
> +	case POWER_SUPPLY_PROP_CAPACITY:
> +		ret = pmi8998_fg_get_capacity(chip, &val->intval);

return pmi8998_fg_get_capacity();


etc.

> +		break;
> +	case POWER_SUPPLY_PROP_CURRENT_NOW:
> +		ret = pmi8998_fg_get_current(chip, &val->intval);
> +		break;
> +	case POWER_SUPPLY_PROP_VOLTAGE_NOW:
> +		ret = pmi8998_fg_get_voltage(chip, &val->intval);
> +		break;
> +	case POWER_SUPPLY_PROP_PRESENT:
> +		val->intval = 1;
> +		break;
> +	case POWER_SUPPLY_PROP_TEMP:
> +		ret = pmi8998_fg_get_temperature(chip, &val->intval);
> +		break;
> +	case POWER_SUPPLY_PROP_TEMP_MIN:
> +	case POWER_SUPPLY_PROP_TEMP_MAX:
> +	case POWER_SUPPLY_PROP_TEMP_ALERT_MIN:
> +	case POWER_SUPPLY_PROP_TEMP_ALERT_MAX:
> +		ret = pmi8998_fg_get_temp_threshold(chip, psp, &val->intval);
> +		break;
> +	default:
> +		dev_err(chip->dev, "invalid property: %d\n", psp);
> +		return -EINVAL;
> +	}
> +
> +	return ret;
> +}
> +
> +static const struct power_supply_desc batt_psy_desc = {
> +	.name = "qcom-battery",
> +	.type = POWER_SUPPLY_TYPE_BATTERY,
> +	.properties = pmi8998_fg_props,
> +	.num_properties = ARRAY_SIZE(pmi8998_fg_props),
> +	.get_property = pmi8998_fg_get_property,
> +};
> +
> +/*
> + * Init functions
> + */
> +
> +static int pmi8998_fg_iacs_clear_sequence(struct pmi8998_fg_chip *chip)
> +{
> +	u8 temp;
> +	int ret;
> +
> +	/* clear the error */
> +	ret = pmi8998_fg_masked_write(chip, MEM_INTF_IMA_CFG, BIT(2), BIT(2));
> +	if (ret) {
> +		dev_err(chip->dev, "Failed to write IMA_CFG: %d\n", ret);
> +		return ret;
> +	}
> +
> +	temp = 0x4;
> +	ret = pmi8998_fg_write(chip, &temp, MEM_INTF_ADDR_LSB + 1, 1);
> +	if (ret) {
> +		dev_err(chip->dev, "Failed to write MEM_INTF_ADDR_MSB: %d\n", ret);
> +		return ret;
> +	}
> +
> +	temp = 0x0;
> +	ret = pmi8998_fg_write(chip, &temp, MEM_INTF_WR_DATA0 + 3, 1);
> +	if (ret) {
> +		dev_err(chip->dev, "Failed to write WR_DATA3: %d\n", ret);
> +		return ret;
> +	}
> +
> +	ret = pmi8998_fg_read(chip, &temp, MEM_INTF_RD_DATA0 + 3, 1);
> +	if (ret) {
> +		dev_err(chip->dev, "Failed to write RD_DATA3: %d\n", ret);
> +		return ret;
> +	}
> +
> +	ret = pmi8998_fg_masked_write(chip, MEM_INTF_IMA_CFG, BIT(2), 0);
> +	if (ret) {
> +		dev_err(chip->dev, "Failed to write IMA_CFG: %d\n", ret);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static int pmi8998_fg_clear_ima(struct pmi8998_fg_chip *chip, bool check_hw_sts)
> +{
> +	u8 err_sts, exp_sts, hw_sts;
> +	bool run_err_clr_seq = false;
> +	int ret;
> +
> +	ret = pmi8998_fg_read(chip, &err_sts, MEM_INTF_IMA_ERR_STS, 1);
> +	if (ret) {
> +		dev_err(chip->dev, "Failed to read IMA_ERR_STS: %d\n", ret);
> +		return ret;
> +	}
> +
> +	ret = pmi8998_fg_read(chip, &exp_sts,
> +			      MEM_INTF_IMA_EXP_STS, 1);
> +	if (ret) {
> +		dev_err(chip->dev, "Failed to read IMA_EXP_STS: %d\n", ret);
> +		return ret;
> +	}
> +
> +	if (check_hw_sts) {
> +		ret = pmi8998_fg_read(chip, &hw_sts,
> +				      MEM_INTF_IMA_HW_STS, 1);
> +		if (ret) {
> +			dev_err(chip->dev, "Failed to read IMA_HW_STS: %d\n", ret);
> +			return ret;
> +		}
> +		/*
> +		 * Lower nibble should be equal to upper nibble before SRAM
> +		 * transactions begins from SW side.
> +		 */
> +		if ((hw_sts & 0x0f) != hw_sts >> 4) {
> +			dev_dbg(chip->dev, "IMA HW not in correct state, hw_sts=%x\n",
> +				hw_sts);
> +			run_err_clr_seq = true;
> +		}
> +	}
> +
> +	if (exp_sts & (BIT(0) | BIT(1) | BIT(3) |
> +		BIT(4) | BIT(5) | BIT(6) |
> +		BIT(7))) {

Wrong indentation. Please #define the mask if possible.

> +		dev_dbg(chip->dev, "IMA exception bit set, exp_sts=%x\n", exp_sts);
> +		run_err_clr_seq = true;
> +	}
> +
> +	if (run_err_clr_seq) {
> +		ret = pmi8998_fg_iacs_clear_sequence(chip);
> +		if (!ret)
> +			return -EAGAIN;
> +	}
> +
> +	return 0;
> +}
> +
> +static irqreturn_t pmi8998_fg_handle_soc_delta(int irq, void *data)
> +{
> +	struct pmi8998_fg_chip *chip = data;
> +
> +	/* Signal change in state of charge */
> +	power_supply_changed(chip->batt_psy);
> +	dev_dbg(chip->dev, "SOC changed");
> +
> +	return IRQ_HANDLED;
> +}
> +
> +static void pmi8998_fg_status_changed_worker(struct work_struct *work)
> +{
> +	struct pmi8998_fg_chip *chip = container_of(work, struct pmi8998_fg_chip,
> +						    status_changed_work.work);
> +
> +	power_supply_changed(chip->batt_psy);
> +}
> +
> +static int pmi8998_fg_notifier_call(struct notifier_block *nb, unsigned long val, void *v)
> +{
> +	struct pmi8998_fg_chip *chip = container_of(nb, struct pmi8998_fg_chip, nb);
> +	struct power_supply *psy = v;
> +	union power_supply_propval propval;
> +	int ret;
> +
> +	if (psy == chip->chg_psy) {
> +		ret = power_supply_get_property(psy,
> +						POWER_SUPPLY_PROP_STATUS, &propval);
> +		if (ret)
> +			chip->status = POWER_SUPPLY_STATUS_UNKNOWN;
> +
> +		chip->status = propval.intval;
> +
> +		power_supply_changed(chip->batt_psy);
> +
> +		if (chip->status == POWER_SUPPLY_STATUS_UNKNOWN) {
> +			/*
> +			 * REVISIT: Find better solution or remove current-based
> +			 * status checking once checking is properly implemented
> +			 * in charger drivers
> +
> +			 * Sometimes it take a while for current to stabilize,
> +			 * so signal property change again later to make sure
> +			 * current-based status is properly detected.
> +			 */
> +			cancel_delayed_work_sync(&chip->status_changed_work);
> +			schedule_delayed_work(&chip->status_changed_work,
> +					      msecs_to_jiffies(1000));
> +		}
> +	}
> +
> +	return NOTIFY_OK;
> +}
> +
> +static int pmi8998_fg_probe(struct platform_device *pdev)
> +{
> +	struct power_supply_config supply_config = {};
> +	struct pmi8998_fg_chip *chip;
> +	const __be32 *prop_addr;
> +	int irq;
> +	u8 dma_status;
> +	bool error_present;
> +	int ret;
> +
> +	chip = devm_kzalloc(&pdev->dev, sizeof(*chip), GFP_KERNEL);
> +	if (!chip)
> +		return -ENOMEM;
> +
> +	chip->dev = &pdev->dev;
> +
> +	chip->regmap = dev_get_regmap(pdev->dev.parent, NULL);
> +	if (!chip->regmap) {
> +		dev_err(chip->dev, "Failed to locate the regmap\n");
> +		return -ENODEV;
> +	}
> +
> +	/* Get base address */
> +	prop_addr = of_get_address(pdev->dev.of_node, 0, NULL, NULL);
> +	if (!prop_addr) {
> +		dev_err(chip->dev, "Failed to read SOC base address from dt\n");
> +		return -EINVAL;
> +	}
> +	chip->base = be32_to_cpu(*prop_addr);
> +
> +	/*
> +	 * Change the FG_MEM_INT interrupt to track IACS_READY
> +	 * condition instead of end-of-transaction. This makes sure
> +	 * that the next transaction starts only after the hw is ready.
> +	 * IACS_INTR_SRC_SLCT is BIT(3)
> +	 */
> +	ret = pmi8998_fg_masked_write(chip, MEM_INTF_IMA_CFG, BIT(3), BIT(3));
> +	if (ret) {
> +		dev_err(chip->dev,
> +			"Failed to configure interrupt sourete: %d\n", ret);
> +		return ret;
> +	}
> +
> +	ret = pmi8998_fg_clear_ima(chip, true);
> +	if (ret && ret != -EAGAIN) {
> +		dev_err(chip->dev, "Failed to clear IMA exception: %d\n", ret);
> +		return ret;
> +	}
> +
> +	/* Check and clear DMA errors */

DMA?

> +	ret = pmi8998_fg_read(chip, &dma_status, MEM_IF_DMA_STS, 1);
> +	if (ret < 0) {
> +		dev_err(chip->dev, "Failed to read dma_status: %d\n", ret);
> +		return ret;
> +	}
> +
> +	error_present = dma_status & (BIT(1) | BIT(2));
> +	ret = pmi8998_fg_masked_write(chip, MEM_IF_DMA_CTL, BIT(0),
> +				      error_present ? BIT(0) : 0);
> +	if (ret < 0) {
> +		dev_err(chip->dev, "Failed to write dma_ctl: %d\n", ret);
> +		return ret;
> +	}
> +
> +	supply_config.drv_data = chip;
> +	supply_config.fwnode = dev_fwnode(&pdev->dev);
> +
> +	chip->batt_psy = devm_power_supply_register(chip->dev,
> +						    &batt_psy_desc, &supply_config);
> +	if (IS_ERR(chip->batt_psy)) {
> +		if (PTR_ERR(chip->batt_psy) != -EPROBE_DEFER)
> +			dev_err(&pdev->dev, "Failed to register battery\n");
> +		return PTR_ERR(chip->batt_psy);
> +	}
> +
> +	platform_set_drvdata(pdev, chip);
> +
> +	/* Get soc-delta IRQ */
> +	irq = of_irq_get_byname(pdev->dev.of_node, "soc-delta");
> +	if (irq < 0) {
> +		dev_err(&pdev->dev, "Failed to get irq soc-delta byname: %d\n",
> +			irq);
> +		return irq;
> +	}
> +
> +	ret = devm_request_threaded_irq(chip->dev, irq, NULL,
> +					pmi8998_fg_handle_soc_delta,
> +					IRQF_ONESHOT, "soc-delta", chip);
> +	if (ret < 0) {
> +		dev_err(&pdev->dev, "Failed to request soc-delta IRQ: %d\n", ret);
> +		return ret;
> +	}
> +
> +	/* Optional: Get charger power supply for status checking */
> +	chip->chg_psy = power_supply_get_by_reference(of_fwnode_handle(chip->dev->of_node),
> +						      "power-supplies");
> +	if (IS_ERR(chip->chg_psy)) {
> +		ret = PTR_ERR(chip->chg_psy);
> +		dev_warn(chip->dev, "Failed to get charger supply: %d\n", ret);
> +		chip->chg_psy = NULL;
> +	}
> +
> +	if (chip->chg_psy) {
> +		INIT_DELAYED_WORK(&chip->status_changed_work,
> +				  pmi8998_fg_status_changed_worker);
> +
> +		chip->nb.notifier_call = pmi8998_fg_notifier_call;
> +		ret = power_supply_reg_notifier(&chip->nb);
> +		if (ret) {
> +			dev_err(chip->dev,
> +				"Failed to register notifier: %d\n", ret);
> +			return ret;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +static const struct of_device_id fg_match_id_table[] = {
> +	{ .compatible = "qcom,pmi8998-fg" },
> +	{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, fg_match_id_table);
> +
> +static struct platform_driver pmi8998_fg_driver = {
> +	.probe = pmi8998_fg_probe,
> +	.driver = {
> +		.name = "pmi8998-fg",
> +		.of_match_table = fg_match_id_table,
> +	},
> +};
> +
> +module_platform_driver(pmi8998_fg_driver);
> +
> +MODULE_AUTHOR("Casey Connolly <casey@connolly.tech>");
> +MODULE_AUTHOR("Joel Selvaraj <foss@joelselvaraj.com>");
> +MODULE_AUTHOR("Yassine Oudjana <y.oudjana@protonmail.com>");
> +MODULE_DESCRIPTION("Qualcomm PMI8998 Fuel Gauge Driver");
> +MODULE_LICENSE("GPL");
> 
> -- 
> 2.51.0
> 
> 

-- 
With best wishes
Dmitry

