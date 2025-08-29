Return-Path: <linux-arm-msm+bounces-71212-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C3F1BB3B180
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Aug 2025 05:11:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7A4CC3A7883
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Aug 2025 03:11:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8AD1A2222A9;
	Fri, 29 Aug 2025 03:11:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="g/s4TvVp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from MA0PR01CU009.outbound.protection.outlook.com (mail-southindiaazolkn19010009.outbound.protection.outlook.com [52.103.67.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C7C1221FBA;
	Fri, 29 Aug 2025 03:11:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.67.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756437108; cv=fail; b=LlgcfEFIJcj9ZGtbi2WJXkdyN9FXoC9LHm8A6VKD0Bom+7/++H1sZArmF2hfgKdhhRtWpQvmZsHWIw7tBk7jz+nvgT6ItclS3BORQGmrlmWrV3aNXunSJS4gQVJdRWYtkp0B/va12AKzgEsM2QC2ETlxvCi+YjTau5oKv+YXj7E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756437108; c=relaxed/simple;
	bh=3Jy3a0PMHuF+mWtZWFfARk+lO7KH3HJxOMKtDrlh5L4=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=gGqegkJjKoyfLTHDTggLMsVsAaXqA9zhUaQJNjBImuPRhJXS0ygQxuUR/s/9HHzFThHPZtddvLHbiwg+ao8zwVRpwsN6Gxr3D0ZB4AlIGIoXFadVUSpTzXiGLNNWJ0EDOG93oQ/lmO7MiHFTtIiY9ewyfTI0HWxmnUx/faQQrZc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=g/s4TvVp; arc=fail smtp.client-ip=52.103.67.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FtdRz2sSa2Xos+3ECSWJYQUAy2j4mAOWT1xsKuPCHtKxAGrZu1iary9mjnX2FrJHA2tIWHkyaosr46/4QJt8gEaF4kaJYPe6HBVoweBeSO9XOKeDg1v89ns66p4RaESBM4cqtp03ogGluhA6sGsCvAci862sBedZOv6p9MSgwujfM0pWm/qmIpLCn2GX9TYUJHGR8ksYM5jczNiEcec/lpX39uVdPXxAWnG218jpeKNJCC9M5plpjK89jajJs9xVfqxezdQBpC5kXpUh1cP3wM4tZq00IRf7uAJgz+gcqZ3LiDj8HASDWd3nGN/WvtkMz0pHLEjrcybndNVma3BS/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5PifqUiL24JNFj+b/ZzKHBEp+KMJcG89xMWPBkx9A3I=;
 b=WUIb+c0llaDG8TgdGtYxl+gQXaODBnZ+dpiaDccvJXYAv6+pu9CSJZYSlMmaTK7vuwc6YGCMW0G2XPNjzUqsiNpGIq66jnycKgz+o8H9t8CWI4yBzk7NNh8khus59ZTLTrMOiVjBuu16t5K4XVqWJToI0FLZbdlKlx6PRy42DM0d1i1UOkQJ0ZcPO+NYojrPDGaCVpMEsw0FN6Ia3zGVrWUAXzvU+5daxc2b51g2j78drgZ6UexJFxUlGyjOICH0sBYdEa9N5hJYpuhmWhPNmJ/oK0+nv0lqepLEe2J9l9nwnGR0zsbtmHD7rbWtEmKy5qBl85fAqk/cknVDJ4aHcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5PifqUiL24JNFj+b/ZzKHBEp+KMJcG89xMWPBkx9A3I=;
 b=g/s4TvVpPp4/zkDRCnaPp3v6eB14YSY2TXQEfnDBIVAh6cDFpQPPlD6LhwEudAJBOig9RcG+Z54cqKb/okyVAc2pamRGxdBayDRaeYV9rFPqsXMh0uU9RBc9TG5sB0rmPXtMEMXkJLxG5Y9jPpoouGucC8aW8bFow3m6tUN8IjVUduDIu66QTkRrimXWT28y7oktpyENDXjx74aKGMg+p3a7L1S2Gl0H7WY9PR5sWFynEToxMPi68gOs6I4SDkiQAWfX/xNlEMq87OnKo70w3OvTvel0X6PCbvdK1wVqFvGq5g1RTRErAwGAXzPz3Yv6mJ5dLqrjItrrJOr28B/vTA==
Received: from MAUPR01MB11072.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:16f::16) by MAYPR01MB10446.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:158::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.14; Fri, 29 Aug
 2025 03:11:38 +0000
Received: from MAUPR01MB11072.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::5dff:3ee7:86ee:6e4b]) by MAUPR01MB11072.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::5dff:3ee7:86ee:6e4b%4]) with mapi id 15.20.9052.019; Fri, 29 Aug 2025
 03:11:38 +0000
Message-ID:
 <MAUPR01MB11072A23DEEA6F37D43DF0AFDFE3AA@MAUPR01MB11072.INDPRD01.PROD.OUTLOOK.COM>
Date: Fri, 29 Aug 2025 11:11:33 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/8] clk: sophgo: sg2042-pll: remove round_rate() in favor
 of determine_rate()
To: Brian Masney <bmasney@redhat.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Vladimir Zapolskiy <vz@mleia.com>,
 Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
 Inochi Amaoto <inochiama@gmail.com>, Michal Simek <michal.simek@amd.com>,
 Bjorn Andersson <andersson@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Andrea della Porta <andrea.porta@suse.com>,
 Maxime Ripard <mripard@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, sophgo@lists.linux.dev,
 linux-arm-msm@vger.kernel.org, linux-rockchip@lists.infradead.org
References: <20250828-clk-round-rate-v2-v1-0-b97ec8ba6cc4@redhat.com>
 <20250828-clk-round-rate-v2-v1-6-b97ec8ba6cc4@redhat.com>
From: Chen Wang <unicorn_wang@outlook.com>
In-Reply-To: <20250828-clk-round-rate-v2-v1-6-b97ec8ba6cc4@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TYCP286CA0021.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:263::11) To MAUPR01MB11072.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:16f::16)
X-Microsoft-Original-Message-ID:
 <d698f04a-d60b-42bb-9692-2d3088a6c77b@outlook.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MAUPR01MB11072:EE_|MAYPR01MB10446:EE_
X-MS-Office365-Filtering-Correlation-Id: f3f7eeb2-03d6-48e0-2797-08dde6a9c4cd
X-MS-Exchange-SLBlob-MailProps:
	dx7TrgQSB6fOgpu0AmRux6KMzGkolm4jvkjiR1GM6lqFmvShxAYPC6EwqCw9Qts0w+uWnx/uvGyHxmwP0P1erJpxafpfdVhfp8o9PoIjGBUM3oDKjuoxoYPNIH0i4SE2OI5VL2G/VZH0zwzcapUaVjnczE5oDVfsZ6C2Oyva42vnSzipslWa/+m8v3XCA6J8XKSV5JnMrpw6bV42CkqNzc9MGEeGRPc5lh95fcEwCWUyLclFGzR0OHVDg8C+7i10ZIVgyaZn75T/sYgF5Y5WiossrTBqEgxJIYxyZtDDOMunSmYQRoYR2cpN9y21x8JacKsJUDW44zwgqMiBFZjKmJIyNolXoXbOdm8+IuLeatCWBxTFL0xpXJivaHypKGFaKet/HAHkeP7P7RefDNAGA/LfNqIaIKeO2cYsA1kkk5YvbDwiHEwpCL0CtW5CRNy1DX1qkCRMbUDEdiByayKucA3nhM1YKquSJ+teN5WhtcC64WVlkR9ouK6QrlSrEHhwoKEl3zdMrc1jzw2lrNT1icEfW0bP0JHn5+E2LHje8TtrncmSqwfYYoQg2pygH/kvP0YgfX7qWVmhKD1e+NdKsbV1OKv2PWKwZW6Nq9cL6Co8bw2YTcPq7e2lCtqs90RtmoHW8J7VqSmmgPADktP+EIqcIU7FF5mI5crHbrXmqZjL0/6k66I1OO2SAjsEGbzceQT4iREat2FCCwkKLGfFK45tWCDNHBhwmhrBi/NLmNmZmNIdB60dKQnb2Mexhim1dYwGV8DWGAI=
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|23021999003|461199028|15080799012|5072599009|19110799012|8060799015|6090799003|41001999006|40105399003|440099028|51005399003|3412199025;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Y0FVMG5EYmFoV1A0Qkw0TTNERzJNRkVZL2swQVdNZENKMEo1QzF0TFF3R1pK?=
 =?utf-8?B?ZnhrWVlHQkVCTVBDNkM3Y05qWEJLTk9aRWRvbmtYcXlPOU56bzNuVVozS2FB?=
 =?utf-8?B?NFpjQlM5MzMrL2hCbTYxQ3BrM21mb3ZpMWJjNXJHOHlBeDRGMDJ0eElCZmZN?=
 =?utf-8?B?UVVPTXhpNEh4UjcvMk5wTUdIOWVabG5JbWNYdklFSEpvN3k0MTVJQVYyeDM2?=
 =?utf-8?B?Y1JHZ2F0NTZ1anRTcEFBeUVFOFZxSVV2VjhIQXVWWUhXbmNzRFVyTEQrMHV4?=
 =?utf-8?B?SVR2dTAwd0xvdDNXYzRndHlSVm1scGd4dmRaamlSV0pEOUFOWHhFTmJ2cmJE?=
 =?utf-8?B?b0pQVEtoMXV2NUFBMVNHcnlpQm1WNFpFZGE2dVpKZXkrU1d6VFZ5TUJaMmti?=
 =?utf-8?B?UXVZbXlWQlFWUmpRVXZBMlRUOWdMSDZ1TDBOa2xLOUNmNlFUMlhkVU0vUmhl?=
 =?utf-8?B?dTl0NW9iK2ZPZzZpMzhTYTdZK2ZtMjFVWXM5NWNTbGY4NmFkNEN4YWc5ZFcy?=
 =?utf-8?B?TU5MRzRwMDFab1AyTW94MWIzMXAyeHlkT1dYUTJDek5JWUhqRlBxcmZ2V0Yr?=
 =?utf-8?B?OFZvU1Q3Y1RxOURDRVdjLzhJdVpRV1NnT0NOUXNuM3NPMVdsUnRWTnNUMXdO?=
 =?utf-8?B?NlE2eWFZMFJ5cm1nMWNBbDBoT1YyTWNMeWFZMHh5ZkJ1dWs5emd2ZElUT21x?=
 =?utf-8?B?NlNqaVhJdGI2ZDdMVXh4bkFxY05ISnhIMXVCUTlZbWxGRGJ3VFcxNkxaeWFl?=
 =?utf-8?B?SkpCb0FkdGlWc2ZoRFFhZlBvVHY3cjhQelE2MWFqeWd6MG40emo3VnNpOEU0?=
 =?utf-8?B?cndvZHZadDZ0RnNPNS9hL2s0a0UrQVRrbmdKMXZWQW44bTVsazh5MVhoT3pW?=
 =?utf-8?B?RVpLS1MzOG9aWld6ZGVKWEdUZHk1dVpxQ1NzSU8yanJ2SjdCanpXZVRTNXpw?=
 =?utf-8?B?dnVLc2Q4NzN2V1pSYU1JNWdNZCtGQ3B2VDRQQ1NSaEsra09WdDFFV0VaZ1JO?=
 =?utf-8?B?RVBrVlNmdUZweXFTbjk5VVQ0N3BReHVWTXZ1UXAxa0hZUmNMWitTVnV3TTJx?=
 =?utf-8?B?UVJ2NWhJLzVmWmpyODhPb05SU0VybXJQMXhwdll6NnluT2xoTjlwSzBzUXFi?=
 =?utf-8?B?c1RudStOSGlqL1JxNFZ3djREMmt0aGRxOXFGTjBIckFWTC9hdnhZRjdBNWdn?=
 =?utf-8?B?RkU5MldaU1gwODZjNy8wS3ZHckNJVXI4bURhTTJVeWhqdVRkOHpvbFNpbG0r?=
 =?utf-8?B?NmQzeC9iLzZmTkRZcXBTVE4wQk9UYlkyQU1iSjdxbVZFWmlzWXgyelordDI5?=
 =?utf-8?B?bUhFYm9NK0pxS3dKUCtIY1IvMG94Tk5nc0N3QXN3TlJNLzFzODlTL3JMSHUz?=
 =?utf-8?B?S1NaRGtpZEU5WWZmaTVid3lqK3hxKzRZWi9WM1Y4SzJyczdValVvMXg3NmJZ?=
 =?utf-8?B?OHgxQ2JkT1JOeWUrTCt4cnoyVklJWlRuRjM1K2gva2kvQVhBd3BuRVlmbzhT?=
 =?utf-8?B?QUZGMlpuT0hzSmc4Yy9OelBLa05CVnhSR0dzb1dIZkhPR2JnYS95RnBmUURp?=
 =?utf-8?B?cmV6NzJVZDc3V2loRkJpV2RMeUpKeVlaYkZHbWdUbFZoU2doQVVGZ3g2WXRq?=
 =?utf-8?Q?5XJ9l38TO17z0CxLlOksKxmmWajWv6x4jaKGYP8P89jA=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b1BjamJZTDVoZzY0Y2E2RFlsbVBROWtVT1plR2RCUG1TUVViam8yWHJjVVRQ?=
 =?utf-8?B?SEVsM2s0QW9FTUVob1ZoSlRkcmhJOHpsaFFFekFFcVpLamlJdWJsVC9oVFRD?=
 =?utf-8?B?clRycjVXWHhCMy9VZ243RjZrcG9RY1Bwc09ZSlc1UWgxT3lzTlVpNVNpVFFx?=
 =?utf-8?B?ejEzTExQaTdPdUc1WW9iL3BROVhlYkVFK1pnUlMvNmtlSG1JS1U0Z2dmWFlp?=
 =?utf-8?B?S0hkRkQ0QmJPYzBtUXVSRlVVSE9rYWY5NWR4VldyWGRBeHloNFQzOXora0d4?=
 =?utf-8?B?QzNJSnhLcFQ0bFdOTWxPd3dZSVNuQ2swRjFjS0xrVWlJdEJTd2N3eXhYdmZK?=
 =?utf-8?B?alJJWkpjYWVCdFJ2NnpOUThJaDlGRWkxL2tnMHpIWldhRjN6MVlqSkxqRnZw?=
 =?utf-8?B?VG9QTyt3MHQzb0xtZGNjVC9nbHhvV3VOWU1haTRYK3h3VXVCNy80VFpaY3Vp?=
 =?utf-8?B?QytQZW90cVFKQkgvZDB5Y2lmK0NXYU1VOXhWWHNCWkppbWl0Mi9GcERtWlNn?=
 =?utf-8?B?dVRIMUVIOUh0bHVqOXpaeFk3KzIzclA5NkNVMU1tWnRsN29GTlptYnNZSzN3?=
 =?utf-8?B?Z3FXVG9TeG1CcjVKRXJVMWNCNmQrOGFlVEo2UGdyWnJReUJ5bHUzYkI3ZzRi?=
 =?utf-8?B?YWNxNWl6VmtrWm1JRDRwRUdPanloSWZhSTRuZHdpa0lidHVVTHNyclduNVYz?=
 =?utf-8?B?QUJIQXAzUFp1WkJMRWhJWW9POVBmRkxCVGdwb0lvS2Q5S2MzSmVXVHdmUGF1?=
 =?utf-8?B?bExzSFg0SkxkeHpMK0JaanllUzFmMi9tTWJseHo0aDRXU0ZKeU9FMGRsTlJL?=
 =?utf-8?B?c1c1Q3FWNHdQeHd5UXVyeEtUb1VuMWw3cXg5WE9Xb2hXZysxWFlmbmc0R2w1?=
 =?utf-8?B?bjF6Z0h5M2ZmMTBETTdTeCtIZFNTWXh4WVpETXNKUjR5TXhiYzljbUFCS1d1?=
 =?utf-8?B?bnR6VWc2ZEx6SFQvSjVxellOcm9JYlNNU09rOEZJYVd0V20yYWlPUzA5WCtp?=
 =?utf-8?B?bXJrNXc2Z0pyc2pVb2xheXErOEZ6eCtwaWtuREQ4WG5sc1c0WkhRMnhVRFln?=
 =?utf-8?B?dWxldk5mSUJiKzBseWc0WWdwM2c4bjNSbUtqR3R2UExrWVVSbTkxamtsVjRB?=
 =?utf-8?B?aWRYd2R6QkkwY3VqN0xxQXhsSkYvMGVva1BPYU80cUt6UkRTTHlTYkhkbnhl?=
 =?utf-8?B?M1dKQlRxVXRRWXUyYVplaDd4am1Ga2dGa0dMUkhabllEeERrTjZ4anpIUVRN?=
 =?utf-8?B?K2FkS0Rmb0dEVlh1Mkw4TGlpWkd1RGV0dzM1QjNQYjdIRzNlNWNUTThYNE9B?=
 =?utf-8?B?bTIxejJjV2VISWpwYUVKZTlUT0tEcm1HRlFpRnF0UXdyNmxrZjIrcDBnR0d5?=
 =?utf-8?B?NXpROEd4Qkc3M285cW5GZ0RWS01ZekxJekgxTlpSRlRYL0YrdlJOWGZ0bW5j?=
 =?utf-8?B?SzRFTUJycHFlZGlnNUVOSDkrT1NOQUpTMWlEUHQ4aXVoRkM1MmE5NjdOUlhx?=
 =?utf-8?B?N09nMlhlV2hCY2JleStKVEY5MjlBUHdSYTJOaEFpSTVCbUtic1BLOEFod1pj?=
 =?utf-8?B?ZElOWFNyYmlRQXZFVFgwWjAra0NlcWU0cEdUY1E1UDVzaDQzQjliOG1xMXJ0?=
 =?utf-8?B?SW11UHJySDFFc2RBNHR0azdqNXZJblkzTGdSWElPaFhQMmhPeVV5N05HNmJN?=
 =?utf-8?B?aGh3eUtRZWQrVnBtcXV4eStra1FUUksyV3NnRCtxdjBWckl2YVdYeVdqSEV6?=
 =?utf-8?Q?IFLWfIrsVUU5csfldM=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f3f7eeb2-03d6-48e0-2797-08dde6a9c4cd
X-MS-Exchange-CrossTenant-AuthSource: MAUPR01MB11072.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2025 03:11:38.5436
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MAYPR01MB10446


On 8/29/2025 8:38 AM, Brian Masney wrote:
> This driver implements both the determine_rate() and round_rate() clk
> ops, and the round_rate() clk ops is deprecated. When both are defined,
> clk_core_determine_round_nolock() from the clk core will only use the
> determine_rate() clk ops, so let's remove the round_rate() clk ops since
> it's unused.
>
> The implementation of sg2042_clk_pll_determine_rate() calls
> sg2042_clk_pll_round_rate(), so this folds the two into a single
> function.
>
> Reviewed-by: Chen Wang <unicorn_wang@outlook.com>
> Signed-off-by: Brian Masney <bmasney@redhat.com>

Tested-by: Chen Wang <unicorn_wang@outlook.com> # Pioneerbox

Thanks,

Chen

> ---
>   drivers/clk/sophgo/clk-sg2042-pll.c | 26 +++++++++-----------------
>   1 file changed, 9 insertions(+), 17 deletions(-)
>
> diff --git a/drivers/clk/sophgo/clk-sg2042-pll.c b/drivers/clk/sophgo/clk-sg2042-pll.c
> index e5fb0bb7ac4f97616f3b472fcab45e5729eb653e..110b6ee06fe4b61e89f3cbf2ce00eb03c078afb6 100644
> --- a/drivers/clk/sophgo/clk-sg2042-pll.c
> +++ b/drivers/clk/sophgo/clk-sg2042-pll.c
> @@ -346,37 +346,30 @@ static unsigned long sg2042_clk_pll_recalc_rate(struct clk_hw *hw,
>   	return rate;
>   }
>   
> -static long sg2042_clk_pll_round_rate(struct clk_hw *hw,
> -				      unsigned long req_rate,
> -				      unsigned long *prate)
> +static int sg2042_clk_pll_determine_rate(struct clk_hw *hw,
> +					 struct clk_rate_request *req)
>   {
>   	struct sg2042_pll_ctrl pctrl_table;
>   	unsigned int value;
>   	long proper_rate;
>   	int ret;
>   
> -	ret = sg2042_get_pll_ctl_setting(&pctrl_table, req_rate, *prate);
> +	ret = sg2042_get_pll_ctl_setting(&pctrl_table,
> +					 min(req->rate, req->max_rate),
> +					 req->best_parent_rate);
>   	if (ret) {
>   		proper_rate = 0;
>   		goto out;
>   	}
>   
>   	value = sg2042_pll_ctrl_encode(&pctrl_table);
> -	proper_rate = (long)sg2042_pll_recalc_rate(value, *prate);
> +	proper_rate = (long)sg2042_pll_recalc_rate(value, req->best_parent_rate);
>   
>   out:
> -	pr_debug("--> %s: pll_round_rate: val = %ld\n",
> +	pr_debug("--> %s: pll_determine_rate: val = %ld\n",
>   		 clk_hw_get_name(hw), proper_rate);
> -	return proper_rate;
> -}
> +	req->rate = proper_rate;
>   
> -static int sg2042_clk_pll_determine_rate(struct clk_hw *hw,
> -					 struct clk_rate_request *req)
> -{
> -	req->rate = sg2042_clk_pll_round_rate(hw, min(req->rate, req->max_rate),
> -					      &req->best_parent_rate);
> -	pr_debug("--> %s: pll_determine_rate: val = %ld\n",
> -		 clk_hw_get_name(hw), req->rate);
>   	return 0;
>   }
>   
> @@ -417,14 +410,13 @@ static int sg2042_clk_pll_set_rate(struct clk_hw *hw,
>   
>   static const struct clk_ops sg2042_clk_pll_ops = {
>   	.recalc_rate = sg2042_clk_pll_recalc_rate,
> -	.round_rate = sg2042_clk_pll_round_rate,
>   	.determine_rate = sg2042_clk_pll_determine_rate,
>   	.set_rate = sg2042_clk_pll_set_rate,
>   };
>   
>   static const struct clk_ops sg2042_clk_pll_ro_ops = {
>   	.recalc_rate = sg2042_clk_pll_recalc_rate,
> -	.round_rate = sg2042_clk_pll_round_rate,
> +	.determine_rate = sg2042_clk_pll_determine_rate,
>   };
>   
>   /*
>

