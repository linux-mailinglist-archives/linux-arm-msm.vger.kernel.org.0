Return-Path: <linux-arm-msm+bounces-52993-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CF50CA7881E
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Apr 2025 08:30:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1F7CB1890566
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Apr 2025 06:30:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58A40232386;
	Wed,  2 Apr 2025 06:30:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com header.b="f12LftuR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (mail-db5eur02olkn2085.outbound.protection.outlook.com [40.92.50.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4240620E33E;
	Wed,  2 Apr 2025 06:30:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.92.50.85
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743575415; cv=fail; b=iPCC0m/gonVRHQCwnKJRDzQjbjQD2pUdMY1/IDBIcU86jG+Q9VW7SJgTtgEIcJeGQOzNP6cJqB8sViMSyY54qtqjL8PICjIRQdq2jz5EgdY3maUSQyhzDNDSt3JUgbvMsUx8IpoTKsTuJ024ECxO3dnsvhT4PPbj22kYsdIB8JM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743575415; c=relaxed/simple;
	bh=yJJVM/mBc65WG/s2W1DOMw9Q5+OkHxg/86a+306+2TI=;
	h=Message-ID:Date:To:Cc:References:Subject:From:In-Reply-To:
	 Content-Type:MIME-Version; b=IkhIcM31l4Ubejo/9TTOARb6HGO1KorVFCfnXy8uYj5NqvsFvBDi6QUpK6POYU2UdxY1bwbrWC9t9c2C3QysSjDA3nCHBaV+zpePtMP/gpZRwKQG9mQM1DMd7BAfPDhfubsNvv0QnTUxjNWCjydUxNydTuCZS62510RvzrTBvYE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hotmail.com; spf=pass smtp.mailfrom=hotmail.com; dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com header.b=f12LftuR; arc=fail smtp.client-ip=40.92.50.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hotmail.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X//c410IkeWk0gngibQKRm5hOwPyDNgCZomiaCzgMJdAEZjiKazijMsCj+WoKDkzgRQQyEP4rzR1DkHswLqQZgePS+GC+1hIG6eSmd8U4+wg6haS5SuS7ZAmWM0vgdjnXiaHch6TAvPWSkq6DpOmURvrFUBgTw5+hjWDrXBC0eFdfMIVyi0D5XQpDzM2kK7tWtIEZ85BAtincw+k2NaFoIz7vb494SXtjAM0EjeWoNmy2rFM7aQiXZKCGOut49KUff/6lGo/Re1mMbVBsME/+a8eWd5PsexOrYImJKQo7VQnlPNd/bGmexawCqSvBBWoo2uv0tpU9x7UTapy55zj3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PV8oiWqlnyKqadm5DWvoYSvpMY4DYCXfePLQI42JIyU=;
 b=B6hqFf0rR0CuBhdX+HPDKm3WBKpRu59CbuFivNORdwVxbPnRjz4FzlT2ZyaCsVyCTTkHTDgyZKhBC9C1A3S21/7h/z9CsTHDY4q2pyIpK53uNVL0fkNbLmoGvYBh1HQQNhDSTzuPtIb9AhDuLnZWW++BHA3WZwCv7NS9/cpOvKliT1xrdm2FT99ty4SERgWjTzVVhVj09L6CGt8CSOt3fVP42YlfzfTabZ0OH0ckNae9D5Iyi8HHurQHyZyRfDReb/KswnUYoR4wVOuxBOygMBtxI7/hDOxCJP01GskmuwJKmCMbq8yqki0fFgKwfT5IunII5VGnanSRk9Ch/gxEpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PV8oiWqlnyKqadm5DWvoYSvpMY4DYCXfePLQI42JIyU=;
 b=f12LftuRYegWtEuTqQIjlFecrR3Lda6hzqKRItl/QQ2RxTHK+bG8yOAFgNXJmrdPopVgRaw9+zZ5i2eqoaNZq3UoDs5usplRYMDYVZyIaWMMcCactPcnDzRU5cv2epZRMQLQD+OVGWXYMJfqyyFycRUqdZwHsVhKBGtH5KgED6Vd61GVQPxGUP9F9cmv+qBWFAiDeedlaGNoyjks/rDgkh2lPmOo8o4PIVABGxvN+U9AcwPHbt5pW4E6cbH/ZliqtUUrgi3AFORLxhSfzcYEniR9Pmjywzdw3a5yQvejnClcFYQ8H2y2neennot2fi3JuDciM8xsisj4JPKJ1XmXTA==
Received: from AM7P189MB1009.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:175::17)
 by AS8P189MB1272.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:2aa::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.54; Wed, 2 Apr
 2025 06:30:11 +0000
Received: from AM7P189MB1009.EURP189.PROD.OUTLOOK.COM
 ([fe80::e9f1:a878:e797:ee1a]) by AM7P189MB1009.EURP189.PROD.OUTLOOK.COM
 ([fe80::e9f1:a878:e797:ee1a%4]) with mapi id 15.20.8534.048; Wed, 2 Apr 2025
 06:30:11 +0000
Message-ID:
 <AM7P189MB100945E7C0850C7469739C81E3AF2@AM7P189MB1009.EURP189.PROD.OUTLOOK.COM>
Date: Wed, 2 Apr 2025 08:30:10 +0200
User-Agent: Mozilla Thunderbird
To: alex.vinarskis@gmail.com
Cc: abel.vesa@linaro.org, andersson@kernel.org, conor+dt@kernel.org,
 devicetree@vger.kernel.org, gregkh@linuxfoundation.org,
 heikki.krogerus@linux.intel.com, johan+linaro@kernel.org,
 konrad.dybcio@oss.qualcomm.com, konradybcio@kernel.org, krzk+dt@kernel.org,
 krzysztof.kozlowski@linaro.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, lumag@kernel.org,
 robh@kernel.org
References: <CAMcHhXqbQ-6SLotNfQDStr5B0KAMxFRuSiLnjdg+UrtqA1phXw@mail.gmail.com>
Subject: Re: [PATCH v1 6/6] arm64: dts: qcom: Add support for X1-based Asus
 Zenbook A14
Content-Language: en-US
From: Maud Spierings <maud_spierings@hotmail.com>
In-Reply-To: <CAMcHhXqbQ-6SLotNfQDStr5B0KAMxFRuSiLnjdg+UrtqA1phXw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM0PR10CA0039.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:150::19) To AM7P189MB1009.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:175::17)
X-Microsoft-Original-Message-ID:
 <15dae5f2-6af1-4fb6-8f08-2ec8f398a1aa@hotmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7P189MB1009:EE_|AS8P189MB1272:EE_
X-MS-Office365-Filtering-Correlation-Id: e06d0f37-2548-4e1c-1c54-08dd71afd18d
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|8060799006|5072599009|19110799003|15080799006|6090799003|461199028|1602099012|10035399004|4302099013|440099028|3412199025|18061999006;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eGFTRCs2SStvN0pwWk1DZTRzUEN1WVVBakhoYkJpenV2ZEdTSU0xK0xnaGkx?=
 =?utf-8?B?Z0s5YlBDWTdyem1HOWVvTDRXcnovNENTendXOUNWVU5ObjI3YTZkaTd6N05a?=
 =?utf-8?B?R1hmYXZuTkNWU0lQUkd1TGNKTW0wWGptU0t1cjI4bTBpNkZ3MjBXYjVYZkFr?=
 =?utf-8?B?b2hXTWZxRFU3VmlRcUdSdVhYMHNnVVVWSjl6clo1ZXFjTDVFTUxDTmc1b0RW?=
 =?utf-8?B?QnA4N1FDSXlwVFIybms5cG5IQXNXNE1BWnZidThTUG01S3IrUjQ0T1VvVE9D?=
 =?utf-8?B?NUtCSENiVXIzdFp0SWtOQU02a2pCNlVmSXI2NzBXREFUem80M3J5QUd2WUkw?=
 =?utf-8?B?NXl1MnJlaEtwS1R3dE1JZHNUajZ1WkIvVXpwODRiWHpQMjBZTmxFcW5YL2w5?=
 =?utf-8?B?emxrYk1DZThodzJqeFBWMTZML1ZEWXpZZjR1eU10OWVXUFhHaEZ1OWJjeW80?=
 =?utf-8?B?NmVDa0pSOURiaFF2ZG1LVjlYNVNRWDFPT0FteDJQZXkwSHdGVXZiTURXZzFy?=
 =?utf-8?B?MTVzL25IQVJZOE1sWm1IUmZVZUs5QnIvN2YramtJdUFVVVNpL2UxVnc1U1NZ?=
 =?utf-8?B?dk14TTQwcVE5b0NTL3VxcFlnOE8vdlpheFpnOUpXeVEyNy9zN05vNUtNaUFo?=
 =?utf-8?B?eVREcURrdzF6N3p4MTUvN0c4MndFS3NkeGs5dGp1K21SN2w1SEM4b0NwM0Q0?=
 =?utf-8?B?SUhIaDNEbWpteFpoSDRxRXBKR293T25KZHFhZ2UrS1BtSzZXbnN4VUdweW1x?=
 =?utf-8?B?M2N2TEVKN0h1cXVIRUtoQVVYVHFoM0JLMUxFekxhWW1CSndBUElYQjZacnBW?=
 =?utf-8?B?REVnVm1EVUdGVlNlaWxUcEhyZkVQNWpZaTcxNXR5OHY4RkhCcTRPUWNUVWFG?=
 =?utf-8?B?Y2wrK1hTaCt2KzBpMHJPZWRpYkpMc29FK090MjRCbGwweXQweDRNdGRhR2ZW?=
 =?utf-8?B?cUxSTTcxbDZIQjdoK0x0aUU3dWNqZ2pEMkkwTHlJNnVwNHNYTmtzaFgwbTJ1?=
 =?utf-8?B?bXh4MTBEZTlvVThaTDVNRmdtaVNxNGFNT0RBZm1Ya1lUY081V2t0RTRJL3Yw?=
 =?utf-8?B?M1lOKzAwaVRjdGJLdjZuVmtDandVcys4b0dqN3lrMXFyd2NsZWJOQ0d1VVAz?=
 =?utf-8?B?d0RZSlNaMVUvZmVWWFU5Wm1XeFpGQUMwQTNxNEg0VVhNQlkwcUVuN1pTckVi?=
 =?utf-8?B?L0Yxbk14aFJLbkE4VWhNNUFBanUxUzlKRTNoNUgwSGxhRjY3d214U2tiRCtL?=
 =?utf-8?B?UThxdHU1RXJLN0VRWjZNaDh4S2NuSkVPRWZMb3VFa2FPVXhLY28rbGJvNWh4?=
 =?utf-8?B?dmdXbDdmanlHdElqWHNQbVgzemF2VHdKYXZFQ3EzK00yeXlkbm00Z0dkaTZE?=
 =?utf-8?B?SEFiYm5JRm13YXJaTlNXMjJybjU5SmR6T3NlbFp4RGh6UGVJTGptTEtGNHRP?=
 =?utf-8?B?ZVlQOTFvekZYb2xZNUZ4Q0JBTzhqanFZRDNxYVN5RFozWlU2YzJEckhHVXhq?=
 =?utf-8?B?MHlPZEU2L3pmN0hZVWtQeUFGWmh1cE93YUZ5N3JzTGl0STI1ZzJ2MkUxVTFE?=
 =?utf-8?B?ei9NU0JtODF3Z2pESzVBalZncHdJRXc4Z3JpM0pMTWtINklEZ1h4YjY1VXFl?=
 =?utf-8?B?aWxCSnMxKytnMXZVeCt6RWdOUmR4UVpyTDNCVk01UDFTb2ExYnRycHJqb29p?=
 =?utf-8?Q?xr+eGHEvvrYf+S6bXnsx?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QmJZL25iNFJzcTJCMkMyckdBb0pzRjZpelBWUSs0elBaVnkvaTF4OUdqUGJi?=
 =?utf-8?B?ZWJqWHRpL3drbUZDQ0ZCbS9rbGFOOVF5NEpFM1hIV2pPcjZxYnlmc3hEaU5R?=
 =?utf-8?B?M1ZtRlZ6QW9lTVhCQ1lxSU5DWXZLdVUwUnhSQ3RpelhYMnp1KzRMaGxYb2pK?=
 =?utf-8?B?a2dERkE2azhUWDd6VnRseGlIRE5YbTVJT29jUHQ3V3FleXdYZ0hEZklTWm5m?=
 =?utf-8?B?YkdMZHoybitxVzlZMHhvV1N1SEtVQ0xBczAyc242empJRllpZndCVWMrN1hM?=
 =?utf-8?B?RjNtRU1MbHh2a25sNmJ1R1YyUWQ3b1JoT3hDci83eXJSa0xtd1NaZXNvaFcw?=
 =?utf-8?B?K290VGhBWVpxMkthcWxhcUc5OWJuSER4dWExcEY1OVVnalE0NDJPaFI4eVRK?=
 =?utf-8?B?RGZ3RW1mU1JjbE45QUVMYWV0dUxNSFB6Q01UMTBNNlYxaWlHaEFROFUwdkRz?=
 =?utf-8?B?VG5iVXR0NlZkV3FYcituNVVDMWpYTDdjVGtPcXdrTWhMeHNnajFDb1E3d2hT?=
 =?utf-8?B?NTlJQzExSEFhU2pUR1g3UnAxR3R5ZVhWazI0TnpWRXRxTThoeExGMitNL2hN?=
 =?utf-8?B?MEM3cjFLZi94UVRBa2FKc2czd0ltOHdYOTZRb0JWQkhHbzZ6L0JpQVo2THN6?=
 =?utf-8?B?MWhwMkdVdVNPSXViSWJ3MXNuVm9iVXlqY284NHVjR0huVXV5cHhzUjVNZWxj?=
 =?utf-8?B?TUFMc2QwaDBYMXV5Njh6OWpYSm5LQS9IQndJTU1QZzlMb2NWVzVGZUZpaUNV?=
 =?utf-8?B?RFFoZzM3cW9MdE9jUlpleE94RmNmUHNDTW9Rei92SnBrUXJFYlNzQ25PZ3Rm?=
 =?utf-8?B?OU5uNWJUQnEzclY4eUllUW1lYW9qUWx1N0xUTjZReVU1UzBqWm9YNWZhU05H?=
 =?utf-8?B?dFFDT2ZJOHBlTDBGWm95K2lkWjFVeHR2bVNPTnBZZlhGTTV4VXdOb1FEeS9x?=
 =?utf-8?B?ajh3c0VaVHFWVDBwV3Z6RUVqNWVlMTRVTi9NVDBsR3YwdTRXZVJITWEyZkFM?=
 =?utf-8?B?Z2xSRE90NCtjTjZXeGl3UysybGMyNVV4N0JRZlB4Ly9PbTZYcU1KRDNtMGpB?=
 =?utf-8?B?OUNVTXd1YnNyTVVzYUF3R1BrYlBISGwrRXhmV0J3U0hoVG5nU1VCVlZyek03?=
 =?utf-8?B?TUVtVHFFbnJxVFN2SVEwenJZa2Z0NnVaVmpwTFdoWkluRmdOSEV5ZjJQbk94?=
 =?utf-8?B?NFpMdGQwNmlpQzFPcWZ6NkJMRlM4aWRvR1laSitwY0l5djN3ZVpJS1VGbmdB?=
 =?utf-8?B?cU5mNk1EUi94WVAxOXMvUXRPZmZDOWM5cUMxbHlZcmVqK3FDb1k2TjJWSnZ4?=
 =?utf-8?B?YlpaT3VkVENRV25UU0xUOW56VlQxY1Z6bytwOFBXeWtCNndVRWJTdEljVmdM?=
 =?utf-8?B?ai8xSkl3QUZjUENxRlgrV203VlI0VUFrcXlwTnRabUM1TjVMOTRtejhTb29Y?=
 =?utf-8?B?MzdsUDV6Z0RWVzZaMlVNdXRNS2Zpb3U3QVE3ZkJ1K2RvbEtUbDRhd0Z0Z0FE?=
 =?utf-8?B?QjNCR1VJbDk1WGNIR0RkZmRmakxPOHlMclUraGhmM1VCRm0rOG11OVJra0l3?=
 =?utf-8?B?Q2JqSlFGSmlUckIzTWk1Ym1KdFBjSFB1OE4yV3JIbXliMTVjVTZTL0xqamwy?=
 =?utf-8?B?ODBTclB6b080OVFNNlh1aktiYk5XSGVvdncxSlJvZFpzZFFHZTNnbmw0ZWpZ?=
 =?utf-8?B?eGc3SGpURk1UM3B5MTc0MlV5enlzMGE3a04yMGlVS1ZLdXh1Z3Nra0hSMEJU?=
 =?utf-8?Q?zvFVtEeid0oO0FOdzyqMLDzkInzKCD73m8d3IIG?=
X-OriginatorOrg: sct-15-20-4734-24-msonline-outlook-c54b5.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: e06d0f37-2548-4e1c-1c54-08dd71afd18d
X-MS-Exchange-CrossTenant-AuthSource: AM7P189MB1009.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2025 06:30:10.9891
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8P189MB1272

> On Tue, 1 Apr 2025 at 23:15, Konrad Dybcio
> <konrad.dybcio@oss.qualcomm.com> wrote:
>>
>> On 4/1/25 8:05 PM, Aleksandrs Vinarskis wrote:
>> > On Tue, 1 Apr 2025 at 17:59, Konrad Dybcio
>> > <konrad.dybcio@oss.qualcomm.com> wrote:
>> >>
>> >> On 3/31/25 11:53 PM, Aleksandrs Vinarskis wrote:
>> >>> Initial support for Asus Zenbook A14. Particular moddel exists
>> >>> in X1-26-100, X1P-42-100 (UX3407QA) and X1E-78-100 (UX3407RA).
>> >>>
>> >>> Mostly similar to other X1-based laptops. Notable differences are:
>> >>> * Wifi/Bluetooth combo being Qualcomm FastConnect 6900 on UX3407QA
>> >>>   and Qualcomm FastConnect 7800 on UX3407RA
>> >>> * USB Type-C retimers are Parade PS8833, appear to behave identical
>> >>>   to Parade PS8830
>> >>> * gpio90 is TZ protected
>> >>
>>
>> [...]
>>
>> >>
>> >>> +&spi10 {
>> >>> +     status = "disabled";
>> >>> +
>> >>> +     /* Unknown device */
>> >>> +};
>> >>
>> >> Does the device crash if you enable this bus? Keeping it 'okay' would
>> >> make it easier for folks to poke at it
>> >
>> > It does boot just fine, but does not initialize:
>> > ```
>> > geni_spi a88000.spi: Invalid proto 9
>> > ...
>> > qnoc-x1e80100 interconnect-1: sync_state() pending due to a88000.spi
>> > ...
>> > ```
>> >
>> > I only quickly checked that 9 is indeed invalid state, iirc should've
>> > been 2. But haven't looked deeper into it, so left it disabled. So I
>> > thought best to leave it off for now. Unless you prefer to drop it
>> > altogether?
>>
>> That means this QUP is configured to work as a QSPI host, which is not yet
>> supported upstream. I looked at the DSDT you submitted to aa64-laptops, but
>> there doesn't seem to be anything connected there, perhaps it's loaded at
>> runtime. Since your keyboard and touchpad work, maybe it's a touchscreen?
>>
> 
> Indeed it is just defined without anything attached. I am suspecting
> it also may be just leftover, won't be the first one...
> No, this particular laptop doesn't have a touchscreen in any of the
> three screen configurations announced.
> 
> It also does not have a fingerprint reader, nor hardware TPM2.0 (yet
> SPI11 typically used for it is still TZ protected :). EC seems to be
> over i2c5. Asus's touchpad supports some fancy gesture controls, but
> there is in fact another 'extra' hidraw device 'hdtl', I assume that's
> the one. No sdcard reader.
> Only other still unsupported features are audio (i guess unlikely that
> they used different smart amp?), camera (ov02c01, pm8010, so also no)
> and DP-HDMI bridge PS185HDM, which from what I can guesstimate is i2c.

I actually managed to contact someone about the ps185hdm as it is also 
used in my asus vivobook s15. But from what they told me it is a dumb 
bridge that does not require any further configuration. I have tried 
getting it to work but I've had no luck yet. I did find a hpd gpio at 
tlmm 126.

I currently have just tried ignoring its existence and describing a non 
existent dp-connector with the hpd gpio hooked up to mdss_dp2_out but no 
luck. I get a timeout on the aux bus communication I think, so something 
is blocking that still.

I think it may just be some regulator or something required to actually 
power up the ps185hdm

from my correspondence:
`
Hi Maud,

There is no “enable pin” on the PS185 but there are several GPIO’s. The 
FW associated with the device is programmable so the manufacturer of the 
motherboard you are using may have requested a special feature (such as 
an enable pin on one of the GPIO) to be added by Parade. If that’s the 
case then you would need to contact the motherboard manufacturer to find 
out more details.

Hot plug events are normally routed through the DP_HPD pin but, as noted 
above, it’s possible that the motherboard manufacturer asked for this to 
be replicated on the GPIO pin.
`

some messing around of me in the dts can be found here: [1]

[...]

[1]: 
https://github.com/SpieringsAE/linux/blob/wip/x1e80100-6.14/arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dts

kind regards,
Maud

