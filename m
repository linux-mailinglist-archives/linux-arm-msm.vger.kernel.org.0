Return-Path: <linux-arm-msm+bounces-36398-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CD5779B6047
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Oct 2024 11:35:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F0B681C21A56
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Oct 2024 10:35:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D0411E32C8;
	Wed, 30 Oct 2024 10:35:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jaguarmicro.com header.i=@jaguarmicro.com header.b="I/bCQccQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01on2129.outbound.protection.outlook.com [40.107.117.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B08B91E2016;
	Wed, 30 Oct 2024 10:35:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.117.129
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730284548; cv=fail; b=d96PfIXc73Dw1/8BBUM2iSed2FlZdUVPK4i+9wOXt5MfXVDF8F4quiLGF1s/EiRuWKzhdNiBZo0yXY4qIvprKOjFKc4W+HbATgc/Ro7Wj7PuqgHOgzk0sfop7v4i5KuY6GV50aLU8aG4rNR6VUIROf16XHu0CoLGa2za/05sV2o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730284548; c=relaxed/simple;
	bh=HRUokfcDIVIu9ztK9QvgMvBrt4cQOWXVfYhmHBPKTjk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=mMsgp9Peevz0O2UpEOc6XqSuZbtMjR7oV+c6e29DpJzlXj0RlncHq+uGmW/THAFRNselHmUA0fxAXd6sp+FIOFgXgzqbYfQuGQh/3poK2epPhxyIIzOGkMYElqL3n6ve2IbQ2WGEYUrQa7RT3minTSyPZjZJD3LNHGYkDFs7s78=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=jaguarmicro.com; spf=pass smtp.mailfrom=jaguarmicro.com; dkim=pass (2048-bit key) header.d=jaguarmicro.com header.i=@jaguarmicro.com header.b=I/bCQccQ; arc=fail smtp.client-ip=40.107.117.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=jaguarmicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jaguarmicro.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o8vn7UGIrBxv77pKOWRXlW1oeEUdRFmK33srI5CBdP1ALFmUe9vNQwnrJTmRUyEKzn5Iv++qsVYszQ7g5EjF7B6R9hqe8DAZoTvaaEnGCMrK4ffBPxyr3FNa2lo0msq8Dx8jOm9aDZMh4P+RZK7/7hgpletk3OTLzxMqNA8maYKJ8N3yHg3KX8ZG6cFvPk0VBiM9qGLMpy0rENk/qh8QVi1+ekjXfAaQiHv6YGweQ7EGa71A1SYHkota9JjTHfq31xCT58b2lvJy419ygUBjhShfNZikUxAIaARzZZjLuBVlPwfe9r6hiXL2eWEoTZRSusJt5lqrhrQ15Jrswk6XRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HRUokfcDIVIu9ztK9QvgMvBrt4cQOWXVfYhmHBPKTjk=;
 b=KcJ7cFsHJ4SvVi9Y7dS+8aqlqRhjy0k7hNw4TevM/nhphnlA64AAoL+3PHoGg/UVKCtwSRjewPDoh2i+q00/P+fvpjhH4CE+lgfi8Sx5FU7C30ACkJamaO5doUQICJhM+ru3XqICPfKj5F4/4GpwZPQtxXnTyoax+WnWK1wyQHwuakhK6KSTHh2n821lLWYa2jxWQevmjBfk8b4ZsCQuzG4NiBjX6eq7/vpr1oOBO2YLIsAPWlNCBRGCXlzvkaFLZ5sfnzpu/6EJtn4oJftPbiVSSMdUYvz0vDQZ+cLmmxFWOut05Sr6ocgWcTsrXi/zpE8bJPEFv+ofr2/xtbhF2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=jaguarmicro.com; dmarc=pass action=none
 header.from=jaguarmicro.com; dkim=pass header.d=jaguarmicro.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jaguarmicro.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HRUokfcDIVIu9ztK9QvgMvBrt4cQOWXVfYhmHBPKTjk=;
 b=I/bCQccQ1BD4WaDQnu2xPyuT66GxbbE+Qq+eZ94y+gqO1y4g+kgI/GNfd0U2vlEADCOOlqJWy4iwbiFH3iorG8mQ7+hNG4qmpfxS17gUxSZ4uSJ904TPqt7UB+7PvC7Hx4SiDvGaG72ygL8wnH3VW2cL9tihUop9V5TEFyGRzf37B8946DBzOar2wkoqkE38Ct3VCU/U7yEA+IIA81ckOgW6ZGNXTv7wXHn4HXc+eUrt8a9hTqnyZF7AeGDRbFbajqb8DuJMIvh6O+BL/QUoUVHVcTwtBMqg78EZY91vlijzXqlNOPSC+pLcU5DA+3WHQQIQLVyuLdA+WuWreqRBFA==
Received: from KL1PR0601MB5773.apcprd06.prod.outlook.com
 (2603:1096:820:b1::13) by SEYPR06MB7041.apcprd06.prod.outlook.com
 (2603:1096:101:1d6::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.12; Wed, 30 Oct
 2024 10:35:41 +0000
Received: from KL1PR0601MB5773.apcprd06.prod.outlook.com
 ([fe80::b56a:3ef:aa9d:c82]) by KL1PR0601MB5773.apcprd06.prod.outlook.com
 ([fe80::b56a:3ef:aa9d:c82%4]) with mapi id 15.20.8114.015; Wed, 30 Oct 2024
 10:35:41 +0000
From: Rex Nie <rex.nie@jaguarmicro.com>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
CC: "bryan.odonoghue@linaro.org" <bryan.odonoghue@linaro.org>,
	"gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
	"linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Angus Chen
	<angus.chen@jaguarmicro.com>
Subject:
 =?gb2312?B?tPC4tDogW1BBVENIIHYyXSB1c2I6IHR5cGVjOiBxY29tLXBtaWM6IGluaXQg?=
 =?gb2312?B?dmFsdWUgb2YgaGRyX2xlbi90eGJ1Zl9sZW4gZWFybGllcg==?=
Thread-Topic: [PATCH v2] usb: typec: qcom-pmic: init value of
 hdr_len/txbuf_len earlier
Thread-Index: AQHbKnOFlytHOXGLSkmMikyOKWgPUrKe+X2AgAAgHEA=
Date: Wed, 30 Oct 2024 10:35:41 +0000
Message-ID:
 <KL1PR0601MB57733B7B2B6DE5CC57AF074AE6542@KL1PR0601MB5773.apcprd06.prod.outlook.com>
References: <20241029021823.1978-1-rex.nie@jaguarmicro.com>
 <20241030022753.2045-1-rex.nie@jaguarmicro.com>
 <ZyHwscXdDl-ui7CK@kuha.fi.intel.com>
In-Reply-To: <ZyHwscXdDl-ui7CK@kuha.fi.intel.com>
Accept-Language: en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=jaguarmicro.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: KL1PR0601MB5773:EE_|SEYPR06MB7041:EE_
x-ms-office365-filtering-correlation-id: 2361959e-1309-4e5a-ed42-08dcf8ce9a61
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?gb2312?B?cUNQMS9vYmRtMFZucU02bm82bUlPVVN5YkpUTFJTYjAvNmY2MW84Rmc3OFZy?=
 =?gb2312?B?RFY5ZWNRQXNJMDdkSzJMUUU5cUZmK3h2WVoxVWxYaFN0VFhYNnBlaEVuMFRw?=
 =?gb2312?B?c21wY3B5cG1EVERGei9ZUWVaL0FsYWFxT2VNVEdzRTRTbjBjbVk5alFXZTk5?=
 =?gb2312?B?cGJQOTIrK3ppamExM0szMUhrM3I5M285QjRXUmhEUVJpRDIvNnNaZ1NFR2pz?=
 =?gb2312?B?Q2FZYnN1bWVHcndlNmM0SThqVGQzay9HMUl0K1NvYlpLRjVtU1Q4RktqQk50?=
 =?gb2312?B?MVRjSVVYbW81NEltYkxML2hwc1l2c05seGNML01aNXFscE80R0Y2TDNIam9a?=
 =?gb2312?B?RGI3NTdRZmJaRmJiVDFiRWpMWFpwSUM4b0RSaXdOeDlrVXFVS0FwS2oxb0hW?=
 =?gb2312?B?WHpQRkJLTTAvYXZhZTFHQVB0YzZpd1NzL2M1OWw1L0NuUkRtNmZBY2MxdEFj?=
 =?gb2312?B?SGw5YW1qbEtUeFRGaktLUEY4bDBDaXdNZG1xS1JWelAyRC9KOEx3WThZQWI1?=
 =?gb2312?B?blNlbnlDd1BtSDRFSHJLNTJQVUQrMmhJR0JGdk5LOGNmbXFXTFVVdGFVVkc4?=
 =?gb2312?B?UFhBRVdDa1F6UVJObDBBeDhtd2FhNUcwcGRSZmxwTDlzbFNhSm8wMUdmekha?=
 =?gb2312?B?NExtRnRwczdxTmVXNDhYbXdibklzcXVUTXZZaktOb0hMekF5d1lGMWUrekFZ?=
 =?gb2312?B?SWYzYi9GeHNic0ZlSVdOWjBod2paSFR5dE1MZ1M1UElDSnV0ZUY1bHBqbTBL?=
 =?gb2312?B?NjFWb1pncllXNWlMRVVhNmRxRVVrdWNKWVJMcHNDV3FMaGVQNUZ4RmFrd1Jr?=
 =?gb2312?B?WnRtMGJQQ2Fod3RITUExUldiZE1pSmlHM3ZGcitYVFI2RCtJbTAvRE4yWFE3?=
 =?gb2312?B?dFdZM1pjTzFDTTB4ci9hUHNucURYZGRNdFpRWFl3MlIzM2tkMm03NERWRXhw?=
 =?gb2312?B?VlNLMytkZUtMRTR1VldXWkxobFE5Sm9ObFRSYkQvcXdlQVgyaTM3Qll0d3pD?=
 =?gb2312?B?MzZTM3RtYUxIcWdZK1pJdXpWN3ZPQlFVYjYyd245cmhMdFBCdjk3eG1RZHFo?=
 =?gb2312?B?Zlo1eWdQMFYycmVsdW9lZktJaHZRbUw1eDJlNjk1a0ZOSllIZ2J3YjRuS3Ru?=
 =?gb2312?B?Uk5xcUVyUnJjaUVNOUk5S1U1R0lRd2plOWt1OXM0MEhvVUV1eWt0bjlLYTB4?=
 =?gb2312?B?NFBzZTB6UHdzeUp2dXZ3WG1SUkhIRURuRUpFTTNsSG5zWk54ZmhBZmhMdVRz?=
 =?gb2312?B?a0RBNEJLaVZobWZCQ1ppYVc3YVh2VE41SXErYzBGWWoxL2hCazNiVkJ3bVYz?=
 =?gb2312?B?MTlmc0dwS3Z6YjZNeFNJdmdub3lwRUZHa21jMGtFTzhJRzd1WTIyMjRuMk55?=
 =?gb2312?B?T2NKVXNrL2N3dVVIaDVxOTViZ0RqMVkwK1gyLzIzRS9RRnJXSFVhTGtCRXl2?=
 =?gb2312?B?SjdBSkVyWHpaQnBRc3NURCtwa20yczdxVzVJN3RwUWFHUEY0UGUzZzRyZm1C?=
 =?gb2312?B?VkVIcWltNXJsVWxRU1praEFHTTNJeXZwaXFjdDdZNTF6Vk1udmdLWi9wMGNO?=
 =?gb2312?B?OWNpQUdHUmdzdVB1cEFPbTlobkhQWk9PNGNNV2FleUkyRUdNQWE4WENwbzNW?=
 =?gb2312?B?VW9xUnBCUGEwdXp4dkdBdGVQcGhjbTd1RkpFbWJtUDV0bmxWdXExakVRdWZD?=
 =?gb2312?B?blRUb2hBN05BM0FTcVR6OVlZM1hNVDVtcDZBemlzVWN5RW5Od1lBZExkM1dT?=
 =?gb2312?B?RWMxQjAvQ1R6MkZkcTUwRW1jOE9sakNtOFpJZkF4UXhmbndBbmJ5MFBQSU0r?=
 =?gb2312?B?Q1h2R1ZQcnRiNzJlV2RDd0IwSXFEcnBSODFNUzFqUkFHK2kveEx1M2Frbmpz?=
 =?gb2312?Q?nVGv2qyT67ulL?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR0601MB5773.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?gb2312?B?NndiMDJqVG04Q0poRHg2Q1FHMCtjZ0dOWDRBN053ekpVYmYrZzJEcG9PTHdB?=
 =?gb2312?B?ME9xeDBFbFpubzBEb0hoeTJyU0ZMa0Z2dTRET1NmU3hTa3FUSWV5dFRESDRE?=
 =?gb2312?B?RjdiS3JLZXFZUnAzZmNOVnRSQUxJQ3pTSWt0MlQyQ0JXSnpiNjdhbUkzOGFx?=
 =?gb2312?B?ejVGQ0kwcDdGZmFKSlhOZzE4RlJkVlkxa3dqUjlLaS9LUGFYSHV0ZkFobE12?=
 =?gb2312?B?KzhSV1N2WXh6ZFhQNkVSZk81YkNlQW5sT2NBRmlDNXhDYWg2TytUQ0Jvb3Rp?=
 =?gb2312?B?Ry9aMXZuR01jZzF4aEdrTjFrYW5WNTNtK1RzNWlKUGpucGN6ekhHejZ0NDl1?=
 =?gb2312?B?YzIweWNjTnVhdzNGR3Q4Mno1RnRlWEM1QThUeEhIQWZ2UGVxTENxM3Fsb3Nw?=
 =?gb2312?B?RTcyeEd0RzFHN3ExRjZVanNoSDJiSlBxUERuMHlEbGxzRGliL2dFb3lKZGpC?=
 =?gb2312?B?RGhMdlQ4d1pkMWpIVkx4Q29vbllOY2NIUlVodFVidTFldkRLUWVMN1dUMSt4?=
 =?gb2312?B?dCtyQVZQTW1hSU9UU3QrTndIQlZrM1d3S3djdTlXR0dmWjh4SzhxWXRtdklo?=
 =?gb2312?B?MllxRWw0aCt5Z3ltVlB5cVlBQVlpVW5Cd1JWR0NNTXhiU0U1MWxmdHExU2Rt?=
 =?gb2312?B?Z1pxUFZ1MmhKTjdEVmNOelBFRTlhR0swQ1c4UEZCcjZqemNITDF0UVdnNHFt?=
 =?gb2312?B?OHRZQ2dydWphaXBUdkdweU50Q3pwWGhUWlFTbmdnU3ZvSS8ybUJEaVVOemdl?=
 =?gb2312?B?MkhZdTduU3pvTFM4a21GbklyYnp0WDNRTWdYN2I3SytmOFl2TmhTUGhSUUxz?=
 =?gb2312?B?K3FRUmNkeWl2OUdpRDVPZHhIUlhqZzhFVm8xNUtFVnlMUFc5ZGcveEYvSk5v?=
 =?gb2312?B?cVNKcC9ZZ0xNcXY2ZUJiUlMzeUlnd1lDU2gzZklET0hJTmNqc2NNbEdMclhI?=
 =?gb2312?B?aTFNd3ppbmpWZTZlbDk2cGlCYkI4Wll1cnhwK1VVcTRLOWtyNzBMbUl4OWdZ?=
 =?gb2312?B?bDVUOGJnSmVqOGs0MVB2cENYaDNIcE1EM3UzVzBpS1FaU1F1YnRNdW1NdFA4?=
 =?gb2312?B?c2poNXRLeDBWRHFkaTIrQXJlTmRQRElXNlR6WlpXeXVwVUtSeHhMdSs2OTYz?=
 =?gb2312?B?TldYSi8yUjIyM09KRXlwcDJkNVBmdzAwbVZtcWR4Zzl0OGlzV1JkcU1nQzBt?=
 =?gb2312?B?MHh3ay9UY3ZTdHhGL00xVVZvSllpVmZCMm5pVVJXc0FLOVNOWlRScmc3eGJR?=
 =?gb2312?B?eHNYaE5DeGZpOHIxdHNxR0xDVkZLanlDTjRDaFRrbFFxL1VhQ2lCWVBESFdp?=
 =?gb2312?B?NFlwNXlnZDVKWXFhZklUaUlQRVNabllTdk9LZlFyYWJWN1gwUWI0K2lWR0NR?=
 =?gb2312?B?bGdNTmlKdjQyRU9LRU15MCtKeWFRUnVGNGlPU2ZIZzU1VWxUZUhOMmFzcTNW?=
 =?gb2312?B?MnhPeGpvckQzYnRyV3hnb1F1ZHRobnRMR1ZVVkNObHVuVUFMS3R3emFEZUlM?=
 =?gb2312?B?ZXNJdUlzSmQrR3lKMmNvZmRVd0xLRk9hMzdQck1RdmRGTG5ra0l6aG0vZ3hE?=
 =?gb2312?B?eW91akxNUWdiMlFCQjhGV2pyU3pYek9ZM2s2K2RJMGRHVWdQUVhySkpHSDBK?=
 =?gb2312?B?K1lpQTNoYnVXT2l5YXBjZzVSWGxwNU1oaDg5b0toRzlqSzU5Z0VjTEJuTEIy?=
 =?gb2312?B?UzFUQk9tRzc0dXNRV1ZrMUZGcysrQXpiSkhobitSVEtuRjRWMk4wMnRIQ1Zz?=
 =?gb2312?B?eFNLWVR4YkV6SXJvOTVqa25WLzdSU3lJMExKRG5DOXhGd241cVoyODhMYVo5?=
 =?gb2312?B?ak9XQmpnNUF0VFQvZFhlbU9mREpyVFM0OTJwUUxSTS9qTzJRbjB2MUlYZE5y?=
 =?gb2312?B?ZFBkZFFZc2RYTzVVcUtzY251MGNUa2tyMXRuNnppaUVQQ3NNWWxyeFVjaHox?=
 =?gb2312?B?Z21VZExHeW1QdlMwZnpVc1RWQmRrbHB5aDNDdGY2U3paQTlIS1QwL3YrYThS?=
 =?gb2312?B?VFJLcHRVYzVnN3dNb3d1eXBZeFhDT2ltd21IOUJEdXNhN3IzZ240REViQ1ph?=
 =?gb2312?B?THpJOFRxUnBnMytRWGRoeEtXeDFiREJQOFlpTVZsMk01R0FJVU1vMlJWSlFu?=
 =?gb2312?Q?TGMtN1y4/o2//hfBE1K3ye7z1?=
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: jaguarmicro.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: KL1PR0601MB5773.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2361959e-1309-4e5a-ed42-08dcf8ce9a61
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Oct 2024 10:35:41.6485
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 1e45a5c2-d3e1-46b3-a0e6-c5ebf6d8ba7b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fWC4QZlOWWpxHRitN21OHQ69K1j/1s8gwk5pjyiyozdaMUpO0CC3vke/P6tNzcE2fNo8BLo0TY8NKzIutWO8lg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB7041

SEkgaGVpa2tpLA0KCVRoYW5rcy4gSSB3aWxsIHNlbmQgcGF0Y2ggdjMgc29vbi4NCkJScw0KUmV4
DQoNCj4gLS0tLS3Tyrz+1K28/i0tLS0tDQo+ILeivP7IyzogSGVpa2tpIEtyb2dlcnVzIDxoZWlr
a2kua3JvZ2VydXNAbGludXguaW50ZWwuY29tPg0KPiC3osvNyrG85DogMjAyNMTqMTDUwjMwyNUg
MTY6MzkNCj4gytW8/sjLOiBSZXggTmllIDxyZXgubmllQGphZ3Vhcm1pY3JvLmNvbT4NCj4gs63L
zTogYnJ5YW4ub2Rvbm9naHVlQGxpbmFyby5vcmc7IGdyZWdraEBsaW51eGZvdW5kYXRpb24ub3Jn
Ow0KPiBsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZzsgbGludXgtdXNiQHZnZXIua2VybmVs
Lm9yZzsNCj4gbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZzsgQW5ndXMgQ2hlbiA8YW5ndXMu
Y2hlbkBqYWd1YXJtaWNyby5jb20+DQo+INb3zOI6IFJlOiBbUEFUQ0ggdjJdIHVzYjogdHlwZWM6
IHFjb20tcG1pYzogaW5pdCB2YWx1ZSBvZiBoZHJfbGVuL3R4YnVmX2xlbg0KPiBlYXJsaWVyDQo+
IA0KPiBFeHRlcm5hbCBNYWlsOiBUaGlzIGVtYWlsIG9yaWdpbmF0ZWQgZnJvbSBPVVRTSURFIG9m
IHRoZSBvcmdhbml6YXRpb24hDQo+IERvIG5vdCBjbGljayBsaW5rcywgb3BlbiBhdHRhY2htZW50
cyBvciBwcm92aWRlIEFOWSBpbmZvcm1hdGlvbiB1bmxlc3MgeW91DQo+IHJlY29nbml6ZSB0aGUg
c2VuZGVyIGFuZCBrbm93IHRoZSBjb250ZW50IGlzIHNhZmUuDQo+IA0KPiANCj4gSGksDQo+IA0K
PiBPbiBXZWQsIE9jdCAzMCwgMjAyNCBhdCAxMDoyNzo1NEFNICswODAwLCBSZXggTmllIHdyb3Rl
Og0KPiA+IElmIHRoZSByZWFkIG9mIFVTQl9QRFBIWV9SWF9BQ0tOT1dMRURHRV9SRUcgZmFpbGVk
LCB0aGVuIGhkcl9sZW4gYW5kDQo+ID4gdHhidWZfbGVuIGFyZSB1bmluaXRpYWxpemVkLiBUaGlz
IGNvbW1pdCBzdG9wcyB0byBwcmludCB1bmluaXRpYWxpemVkDQo+ID4gdmFsdWUgYW5kIG1pc2xl
YWRpbmcvZmFsc2UgZGF0YS4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IFJleCBOaWUgPHJleC5u
aWVAamFndWFybWljcm8uY29tPg0KPiA+IC0tLQ0KPiANCj4gWW91IG5lZWQgdG8gaW5jbHVkZSBh
IGNoYW5nZWxvZyBhbHNvIGZvciB0aGUgcGF0Y2ggaXRzZWxmIGhlcmUsIGFmdGVyIHRoYXQgIi0t
LSINCj4gc2VwYXJhdG9yLiBUaGlzIHBhdGNoIGlzIGFsc28gc3RpbGwgbWlzc2luZyB0aGUgRml4
ZXMgdGFnLg0KPiANCj4gWW91IGNhbiByZWFkIG1vcmUgYWJvdXQgaG93IHRvIHNlbmQgdGhlIHBh
dGNoZXMgZnJvbSB0aGUgZG9jdW1lbnRhdGlvbjoNCj4gaHR0cHM6Ly93d3cua2VybmVsLm9yZy9k
b2MvaHRtbC9sYXRlc3QvcHJvY2Vzcy9zdWJtaXR0aW5nLXBhdGNoZXMuaHRtbA0KPiANCj4gU28g
cGxlYXNlIHNlbmQgdjMgd2l0aCB0aG9zZSBmaXhlZC4gRG9uJ3QgZm9yZ2V0IHRvIENjIHRoZSBz
dGFibGUgbWwuOg0KPiBodHRwczovL3d3dy5rZXJuZWwub3JnL2RvYy9odG1sL2xhdGVzdC9wcm9j
ZXNzL3N1Ym1pdHRpbmctcGF0Y2hlcy5odG1sI3MNCj4gZWxlY3QtdGhlLXJlY2lwaWVudHMtZm9y
LXlvdXItcGF0Y2gNCj4gDQo+IHRoYW5rcywNCj4gDQo+ID4gIGRyaXZlcnMvdXNiL3R5cGVjL3Rj
cG0vcWNvbS9xY29tX3BtaWNfdHlwZWNfcGRwaHkuYyB8IDggKysrKy0tLS0NCj4gPiAgMSBmaWxl
IGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkNCj4gPg0KPiA+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL3VzYi90eXBlYy90Y3BtL3Fjb20vcWNvbV9wbWljX3R5cGVjX3BkcGh5
LmMNCj4gPiBiL2RyaXZlcnMvdXNiL3R5cGVjL3RjcG0vcWNvbS9xY29tX3BtaWNfdHlwZWNfcGRw
aHkuYw0KPiA+IGluZGV4IDViN2Y1MmI3NGE0MC4uNzI2NDIzNjg0YmFlIDEwMDY0NA0KPiA+IC0t
LSBhL2RyaXZlcnMvdXNiL3R5cGVjL3RjcG0vcWNvbS9xY29tX3BtaWNfdHlwZWNfcGRwaHkuYw0K
PiA+ICsrKyBiL2RyaXZlcnMvdXNiL3R5cGVjL3RjcG0vcWNvbS9xY29tX3BtaWNfdHlwZWNfcGRw
aHkuYw0KPiA+IEBAIC0yMjcsNiArMjI3LDEwIEBADQo+IHFjb21fcG1pY190eXBlY19wZHBoeV9w
ZF90cmFuc21pdF9wYXlsb2FkKHN0cnVjdA0KPiA+IHBtaWNfdHlwZWNfcGRwaHkgKnBtaWNfdHlw
ZWNfcGQNCj4gPg0KPiA+ICAgICAgIHNwaW5fbG9ja19pcnFzYXZlKCZwbWljX3R5cGVjX3BkcGh5
LT5sb2NrLCBmbGFncyk7DQo+ID4NCj4gPiArICAgICBoZHJfbGVuID0gc2l6ZW9mKG1zZy0+aGVh
ZGVyKTsNCj4gPiArICAgICB0eGJ1Zl9sZW4gPSBwZF9oZWFkZXJfY250X2xlKG1zZy0+aGVhZGVy
KSAqIDQ7DQo+ID4gKyAgICAgdHhzaXplX2xlbiA9IGhkcl9sZW4gKyB0eGJ1Zl9sZW4gLSAxOw0K
PiA+ICsNCj4gPiAgICAgICByZXQgPSByZWdtYXBfcmVhZChwbWljX3R5cGVjX3BkcGh5LT5yZWdt
YXAsDQo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgcG1pY190eXBlY19wZHBoeS0+YmFzZSAr
DQo+IFVTQl9QRFBIWV9SWF9BQ0tOT1dMRURHRV9SRUcsDQo+ID4gICAgICAgICAgICAgICAgICAg
ICAgICAgJnZhbCk7DQo+ID4gQEAgLTI0NCwxMCArMjQ4LDYgQEANCj4gcWNvbV9wbWljX3R5cGVj
X3BkcGh5X3BkX3RyYW5zbWl0X3BheWxvYWQoc3RydWN0IHBtaWNfdHlwZWNfcGRwaHkNCj4gKnBt
aWNfdHlwZWNfcGQNCj4gPiAgICAgICBpZiAocmV0KQ0KPiA+ICAgICAgICAgICAgICAgZ290byBk
b25lOw0KPiA+DQo+ID4gLSAgICAgaGRyX2xlbiA9IHNpemVvZihtc2ctPmhlYWRlcik7DQo+ID4g
LSAgICAgdHhidWZfbGVuID0gcGRfaGVhZGVyX2NudF9sZShtc2ctPmhlYWRlcikgKiA0Ow0KPiA+
IC0gICAgIHR4c2l6ZV9sZW4gPSBoZHJfbGVuICsgdHhidWZfbGVuIC0gMTsNCj4gPiAtDQo+ID4g
ICAgICAgLyogV3JpdGUgbWVzc2FnZSBoZWFkZXIgc2l6ZW9mKHUxNikgdG8NCj4gVVNCX1BEUEhZ
X1RYX0JVRkZFUl9IRFJfUkVHICovDQo+ID4gICAgICAgcmV0ID0gcmVnbWFwX2J1bGtfd3JpdGUo
cG1pY190eXBlY19wZHBoeS0+cmVnbWFwLA0KPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHBtaWNfdHlwZWNfcGRwaHktPmJhc2UgKw0KPiA+IFVTQl9QRFBIWV9UWF9CVUZGRVJfSERS
X1JFRywNCj4gPiAtLQ0KPiA+IDIuMTcuMQ0KPiANCj4gLS0NCj4gaGVpa2tpDQo=

