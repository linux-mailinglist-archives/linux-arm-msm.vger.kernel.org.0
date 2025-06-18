Return-Path: <linux-arm-msm+bounces-61709-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EB2D9ADE817
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Jun 2025 12:09:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B28167A284C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Jun 2025 10:07:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5AB1F28C03B;
	Wed, 18 Jun 2025 10:03:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="YhqGn9EV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10olkn2076.outbound.protection.outlook.com [40.92.42.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D2AC28541A;
	Wed, 18 Jun 2025 10:03:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.92.42.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750241018; cv=fail; b=dfnTAb+/DHG9XbiEokekF7fLgdki6HlyrSdBl0qTNpZPXY3JXmRYVBBWFC8o8FtzNZX23q4wAZ86eUVeDJYkihMz7R0fAIk8T6rEkG3WgVEhJQWeXXNiPwQK44cFG+yaE1+bVnkkZjOGiQiwNrqI08t1DJwOcaYkbHAgcRX0llg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750241018; c=relaxed/simple;
	bh=JPihzxpGXTZ0ZT5lVuD/DGlzvjKy2kQi+MTu6n17Cbk=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=BEt+c6r/VMcNAwU8Eup60u+UrkEKCA16vKPIfSpDQZAAYPsfbQBF9SWB/lvOzDpNossl/Cx4DHnKvRRpejpqXrOoFsTQ5w9FWQQeVwKcU0/NT/0Y7Uonp982Eossjxz2l1qiHfhMh+A4nCZt/un/OAVy+VEpYWTVT7y9ozdBYvA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=YhqGn9EV; arc=fail smtp.client-ip=40.92.42.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LzA/VeP9GKt1HwKHDige0tRE2I7jRkmAwaz7O6hK6VywfR7e9CBjYtja35+wq4+c1ZbAmTjzx3okMruIZBGtTDrhfNEbYpKK6LPZu0t1/mLhO6Y8vmved4SM1y1HFEKEK2YrHISudI0k8WkqfVdVeTpOHKet1A6cOD7eTn4/UWPn9+AZN1FPKRYaS4660XvUgSd2OEIp6gTKSYx9r/JB67WfWqyiz8ckAb/+CFeAKejA7MH9u0DPavujsosxOyZ7nllvA9ruP43KUptxo6Y5RPFV9C8o5Hm3rpSGHC2tyd+2aVGmpe4J+NQ4s2gQtFKsSu152XKXrOUJfJuASQhHAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oglveZlBinOEXw0Ye8sTATaiQy/gqwQfBApCw4tvr5w=;
 b=VBh2so3ut9/AYHZ7U2kdRwCSsxU9NZYhUPsfxO+YgvRx2INdAtBa9wf0NKpNbN1TcPhKd/dItI+b3cW0UCZUj2IptKfv7m+/ydAVSFYh3X3z/0uNTzYsvRhVMt6050kV25fEUVSWWk+saPKJsuRhu0KUUEGl85OsckIvCHthL/xo9xFANQzCni/ANlV7NCUNa6qNiSw+Zv6yRriI8Q/dpeMP8Bma9+1dboXp4GPJfe5ssmqM/IOGaw+k8cUxzzhOTNDMah2JJXzWCEH9EpqqhoPG8EQ63f4ojY32YXNjN9C767DbekJ5DzW0QB+tRTNSkXfouk/YnWTr5ydiTIl2cQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oglveZlBinOEXw0Ye8sTATaiQy/gqwQfBApCw4tvr5w=;
 b=YhqGn9EVUzAmjGpKBZIUfCBrpX8PGx0LoCPEMExLf1h/A4T8QbN3k2AUVaOBkcF/9AQEvSSoDcRWuBZgZgPsZyEMkB20Ox0AavtE0aPF18807WeDqQTfGqFmJfrSDm8G++CorLepuliwvCUq6ejhOSmx4bM9sGwE+4yggItM4slM7KIXZaTKA7384lnsTwewdPRyFvhhKV4rIoVuqIvZXE0vTtFnvkvMIiaV/VQrDTJ1is6eerhk8MtrwQgaiHQJp7rS+m9JMkLdKbD2u8ylFjbIebkUrpjzCxfOWdmivBnBVBY/+Vyo4MgX/YWvqDuLzabfPsvAyD5vn3XgEJoxTw==
Received: from BL4PR19MB8902.namprd19.prod.outlook.com (2603:10b6:208:5aa::11)
 by DS7PR19MB5853.namprd19.prod.outlook.com (2603:10b6:8:78::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.18; Wed, 18 Jun
 2025 10:03:32 +0000
Received: from BL4PR19MB8902.namprd19.prod.outlook.com
 ([fe80::b62f:534e:cf19:51f4]) by BL4PR19MB8902.namprd19.prod.outlook.com
 ([fe80::b62f:534e:cf19:51f4%4]) with mapi id 15.20.8857.016; Wed, 18 Jun 2025
 10:03:31 +0000
Message-ID:
 <BL4PR19MB8902AFEA7DCC8C41B7C2C6569D72A@BL4PR19MB8902.namprd19.prod.outlook.com>
Date: Wed, 18 Jun 2025 14:03:24 +0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/5] clk: qcom: ipq5018: keep XO clock always on
To: Bjorn Andersson <andersson@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Luo Jie <quic_luoj@quicinc.com>,
 Lee Jones <lee@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, linux-arm-msm@vger.kernel.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250516-ipq5018-cmn-pll-v4-0-389a6b30e504@outlook.com>
 <20250516-ipq5018-cmn-pll-v4-1-389a6b30e504@outlook.com>
 <wao5fe7nbupujho3ql46ctvbqhe6y2adzqrtbyxqgfja6oriwt@nekluv75lcze>
Content-Language: en-US
From: George Moussalem <george.moussalem@outlook.com>
In-Reply-To: <wao5fe7nbupujho3ql46ctvbqhe6y2adzqrtbyxqgfja6oriwt@nekluv75lcze>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MR2P264CA0154.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:1::17) To BL4PR19MB8902.namprd19.prod.outlook.com
 (2603:10b6:208:5aa::11)
X-Microsoft-Original-Message-ID:
 <530cf5f8-6c2e-4265-a449-415c6d6bf834@outlook.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL4PR19MB8902:EE_|DS7PR19MB5853:EE_
X-MS-Office365-Filtering-Correlation-Id: 093a60ce-fdd0-4a90-133c-08ddae4f6115
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|7092599006|6090799003|15080799009|8060799009|19110799006|461199028|5072599009|440099028|4302099013|3412199025|40105399003|10035399007|1602099012;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ejFIcTIrejZKRi9kTGVTUk1wYURvbG95TGx4cmxYQmpOaTUyQUlxZHl4NzZF?=
 =?utf-8?B?L284UENCYmdwelF2bDY1MkxhcUVFSmhhRE5FYkpTbU9yK3JnRGkyOUxRV3lU?=
 =?utf-8?B?V2VvV08rY0Q4MWxOVk9LOTBIWkdFaHhnMVlPQ1R0MXVJRnZ4aFgxcHZhc2Fi?=
 =?utf-8?B?b0FyVmVCMFp4dzF1ems5Y2VLRlJhTWxhbTlXSUtsL1kwbHg2aEczaXZMc05S?=
 =?utf-8?B?M3E5N05Fa2NiVjh2OHczcDZnejdJN2xYd0tUQW9MQ1RtdGNsMzVWeU5xd2l3?=
 =?utf-8?B?T1h2TzhseXFlWWl5cDBoVjl3OUhqTjFucTIrTkRQdW9abmNzUGhscTIwNjZu?=
 =?utf-8?B?MVhkNkNDUzdzNU9NUzhGZTRrK1QwWHA2Mis1Wmk0dXJ0VGI3SXV6MWpHUXVF?=
 =?utf-8?B?WUJadTAzTklJd3dJeThSUi9qaU1WOC85M3J1ZWhpL2pEZlQ5YVRoRktiWU5o?=
 =?utf-8?B?aS9tZU00R2FZbitpMldNcjFNSWtYb2M1NnNJR3BDbG16T3NENDU2RlUzN1pN?=
 =?utf-8?B?RFhLTS9MdWhacFNIakZWbTBGUW5GVmdaek1rZTZrRGZ5YUxsR2dvZWtxSVFz?=
 =?utf-8?B?NlU0MU1qNytrNVNBbzZGWGk0MEczdnZ1VFpRZ2hKNi9pTlZSbEFWT1dMczJK?=
 =?utf-8?B?UFg3bmNtU012MWlaSEpWcTBKb2JCVmQ2TlEwRDV5dE14c2NjUk1NNzhqSkJa?=
 =?utf-8?B?dm1zbGxxYnhNK05SNExEREV4T2k5dEJDZ1dnRUg0WjZVL29MMytDY2tKRVQz?=
 =?utf-8?B?UzQxdnNJWDFsanVsS3dvSUdXUjZON0tFTU1yWWU5OGV0Q0dKN3hKWGN2dldH?=
 =?utf-8?B?Tkhrb3BEQXlJUXhpWEE1SVJueVRMRnlvdE5OV29hY0VDbHkyK29YRWk4UUty?=
 =?utf-8?B?V0RTS29QRGpkRk1JM2dnb0dTaE80TmN3a2VVQnRDVEQ0bXNjUmFJSUl5RmRw?=
 =?utf-8?B?WjZCWkVzY2VBb3U2OHlrSk5aWTVQMUxGM0VkVHR5TkJmUW02NStGQ3dmSHR2?=
 =?utf-8?B?cmlzZVQ0T3c2d2lDbXFnZzlidGtUT3J1ZU9PNUVnL1B0S0I0Q0w2MnB1Q2Z0?=
 =?utf-8?B?T1VVcHowY0s5NHRERmg1UXQ5T0Y0OVlwcVY5ZG9OeUp3OEgzcjEwK05ad3Bn?=
 =?utf-8?B?MmxkUHNLVENOSVZTZE1OK3ZFbi9MU1lIWVpwK1BoYWJDbHExa05KYmhsVmZw?=
 =?utf-8?B?ZVNKcmRZRmlZcFl4R1NLblU2RU42SzhtRzNuNTRPR3htYmlEUG45RXEvSTVT?=
 =?utf-8?B?b3dGazNBNUZoRDMyYWpDNlpKTGNTd09KM0R3RkxWZk5Kd2xTczR4WWZJaFRO?=
 =?utf-8?B?V2ZkajN0TndHdGgydVZWSVk2Z2s2K3FidGlNUENyYTJCTFRBQTdYRlM0L1RG?=
 =?utf-8?B?RXE1YUloTXdlaDd3NmpxMkZIdk84SnNQM2JzVmxrRjBXYkg2Zm81THhOcnFE?=
 =?utf-8?B?Rjg2TmJXTDVDUWdtRE54b084TkRpQWZLVlpkaDBzbEI5Ymhxb2xTQmJUWUdX?=
 =?utf-8?B?b2gxMnpPVkpnY0M1VkUwajlFNUhlcWczNnhGb24rU0xFUVlOZGtvYllyTFhu?=
 =?utf-8?B?eEhlbUZzZnlPaytEQ0Ixdk9EM24zNUxGYUE2WUVXN3JqL0MyZWZaa0puNjJQ?=
 =?utf-8?B?NWphTHA5SVJWcUppZTZZNzVvUDhwMmk5YitCQUNRblgxcjVuZ2RYV05va0kv?=
 =?utf-8?B?ZVJmb0VTNnBkTmpwWUREaUppUFE3TTR2ckRNNWhhRithb2syZGVkczB6OWQ5?=
 =?utf-8?B?TlE1cU9USWdzLytHcjczeTQ5UGxSaERBR3lEOTZFa3dvdDgwZitEMzVnemhy?=
 =?utf-8?B?ZlRTSUtER3ZkZndaMk02Zz09?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aWhQRlF2WHFtZFRrVnZzL2dXQnQxUENMV1VJUXVua0tFc3J5RFhNMmxqeTUy?=
 =?utf-8?B?NUx3UkU2WFBWYkdsUXZ0c2wwSlh4VjRqMHVnLzlnQ0UrSEhJYU5HWXQxVDBB?=
 =?utf-8?B?dnVUOVN3K2RONkpGVEw4QzFKVVFyWjBCeTRVZU1vYUFCc2ExQVBjVng2NGc0?=
 =?utf-8?B?NC9hRFRBVWJvOU5pdk81SWxHYitCQVc0OW5iZlZ4NGc1WmM1bWhKY3crMGky?=
 =?utf-8?B?emNOeGJwc04yUDJhTUFoc0tsaVRsYklMUmEyZnpUblE3T3lkZ3FMUzVxaitw?=
 =?utf-8?B?Z0FRay9SQlNHRCs0RlNKQklIZllGSXYvMitJcHJCd0NtVm5vOS84a0Nqai9q?=
 =?utf-8?B?QmtvcWVtNENXeHlCSlZYNE1qSmVXaElHbnNpb1ZGd2tkaHV5ZFR6UlVvNDZM?=
 =?utf-8?B?KzlqRGtWU2kxcjdHM0RRRHIvdWdqNlBNbVVPT2FhTGs2QzB2SDJ5bENRM20w?=
 =?utf-8?B?TjlQZktaZFh0OGhUSHRVUUY4UjVOZTBxU0ZGVWJ4dVFvVENhZzUrSE5kOWdh?=
 =?utf-8?B?OGx4NGF3enpaVWREYTRzZ2tlZ0ROUXlzbFdYU1cvbldCUzN2T3ZaZDJOY1hn?=
 =?utf-8?B?Z0NOcTBWYUdveHN3eGlzM2VwT2JkQ0VaR0UraXVMY3FSUkYwNXVqWktsbVBx?=
 =?utf-8?B?eTdEM0NMZDFzVzZFckREYzNoQ2NVYzVkV29oZ2tNMU1qR3prK0ppSjRnOXQr?=
 =?utf-8?B?L0hjNGxUMEtvbVAyRDRWZXJmRmkyTUE4N3U5WkdBRW4yZXZkZW5sRnRSTHBv?=
 =?utf-8?B?eW9OSHF3M2Jyc0NNUGFpMDA0d0ZhMlk1Z3EwQU1iUWNyNGlMNDdNRjNuaitt?=
 =?utf-8?B?SWt3TUs4Y1NzZTBQM3ZmNWtYem15NGJaaGw5SG9xd0lnSldYTGlSbDhvUE9o?=
 =?utf-8?B?djB6ckF0YXJUSDNSTEtYazlYVEdKMEhnUzFYMmZtVTRXTW12Q3FxWU14WDll?=
 =?utf-8?B?dTZIM3VjdFNnQUUyd1dWak8xd0llQmJHRTk3dytGQUIrdFUzRTVyWTl0R3hy?=
 =?utf-8?B?K1JWMVRkbml6OUFNUjhEalBhenBCOXdwY3Ztb2pTbERvYnFjQ0dDWlhyS1JL?=
 =?utf-8?B?cTVLWmk5YVk4TTQ4Z1JSaFF4dEkyVDVqWEt6MHlHa1FWUTV6amozMlYyVllz?=
 =?utf-8?B?aE5mN1ZXcXV0cUZDWUQyaVlRUytnVVpYcjZMVUxmUUE3VlpIbWlMbmVBRjM1?=
 =?utf-8?B?dDhDNmtkNmFpT2VTcVpzK21ON1J4L2VjNi9CWXN6Y1BxY3dyWnBhTGVIMDRF?=
 =?utf-8?B?bHoxLzZLOWZ2eHZNM3pweFpkeG5pWGswWDYzdjFJelZNRDZZWEhBVnJXSStp?=
 =?utf-8?B?eWhzdG1oU0FnOXZhSVNkVmVYZlBhRTQ5M3k3aW1WQVNaWTN3TUhPelVGQ09h?=
 =?utf-8?B?OUlKUS9odGVGZk9YVUx4S2RUaGV3VkNma1RyQ0h0SlBWejYxcUxTS0twclhx?=
 =?utf-8?B?SUxKUjZUenF1K3JWN2o4ZHNTMVBWb1J5WXdlQVdGVXd6MHcvUnREUGZwZFdF?=
 =?utf-8?B?VGxYKzJJNWFuQWR5OFRCcVZXUEsvdnhRbkh3ckhKbUd0VnBQUnFTVjVNZm1T?=
 =?utf-8?B?eTREL0swalYzUUdsMVB2ek5jKzgya3QrR0pXN0ZwVGRHSGZ5OG1HNzl6eFNm?=
 =?utf-8?B?UnVxT0ZTMmxmWVRKY0ZLcFJSVFBVVWdGZWlRZDUydkFJdlB3bHB1cnBZV1Zw?=
 =?utf-8?Q?cfwxZxePnCmi50KJQQVi?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 093a60ce-fdd0-4a90-133c-08ddae4f6115
X-MS-Exchange-CrossTenant-AuthSource: BL4PR19MB8902.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2025 10:03:31.8175
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR19MB5853

Hi Bjorn,

On 6/18/25 07:33, Bjorn Andersson wrote:
> On Fri, May 16, 2025 at 04:36:08PM +0400, George Moussalem via B4 Relay wrote:
>> From: George Moussalem <george.moussalem@outlook.com>
>>
>> The XO clock must not be disabled to avoid the kernel trying to disable
>> the it. As such, keep the XO clock always on by flagging it as critical.
>>
> 
> Is there any reason for us to model this clock in Linux, if we're not
> allowed to touch it?
> 
> CLK_IS_CRITICAL has side effect on the runtime PM state of the clock
> controller, so would be nice if we can avoid that.

see discussion here in v2:
https://patchwork.kernel.org/project/linux-arm-msm/patch/20250506-ipq5018-cmn-pll-v2-1-c0a9fcced114@outlook.com/

we explored removing the structs for xo and xo_src and updating the
parent clocks that relied on them, which worked. But the recommendation
eventually was to go for this flag.

> 
> Regards,
> Bjorn
> 
>> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
>> ---
>> The kernel will panic when parenting it under the CMN PLL reference
>> clock and the below message will appear in the kernel logs.
>>
>> [    0.916515] ------------[ cut here ]------------
>> [    0.918890] gcc_xo_clk_src status stuck at 'on'
>> [    0.918944] WARNING: CPU: 0 PID: 8 at drivers/clk/qcom/clk-branch.c:86 clk_branch_wait+0x114/0x124
>> [    0.927926] Modules linked in:
>> [    0.936945] CPU: 0 PID: 8 Comm: kworker/0:0 Not tainted 6.6.74 #0
>> [    0.939982] Hardware name: Linksys MX2000 (DT)
>> [    0.946151] Workqueue: pm pm_runtime_work
>> [    0.950489] pstate: 604000c5 (nZCv daIF +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
>> [    0.954566] pc : clk_branch_wait+0x114/0x124
>> [    0.961335] lr : clk_branch_wait+0x114/0x124
>> [    0.965849] sp : ffffffc08181bb50
>> [    0.970101] x29: ffffffc08181bb50 x28: 0000000000000000 x27: 61c8864680b583eb
>> [    0.973317] x26: ffffff801fec2168 x25: ffffff800000abc0 x24: 0000000000000002
>> [    0.980437] x23: ffffffc0809f6fd8 x22: 0000000000000000 x21: ffffffc08044193c
>> [    0.985276] loop: module loaded
>> [    0.987554] x20: 0000000000000000 x19: ffffffc081749278 x18: 000000000000007c
>> [    0.987573] x17: 0000000091706274 x16: 000000001985c4f7 x15: ffffffc0816bbdf0
>> [    0.987587] x14: 0000000000000174 x13: 000000000000007c x12: 00000000ffffffea
>> [    0.987601] x11: 00000000ffffefff x10: ffffffc081713df0 x9 : ffffffc0816bbd98
>> [    0.987615] x8 : 0000000000017fe8 x7 : c0000000ffffefff x6 : 0000000000057fa8
>> [    1.026268] x5 : 0000000000000fff x4 : 0000000000000000 x3 : ffffffc08181b950
>> [    1.033385] x2 : ffffffc0816bbd30 x1 : ffffffc0816bbd30 x0 : 0000000000000023
>> [    1.040507] Call trace:
>> [    1.047618]  clk_branch_wait+0x114/0x124
>> [    1.049875]  clk_branch2_disable+0x2c/0x3c
>> [    1.054043]  clk_core_disable+0x60/0xac
>> [    1.057948]  clk_core_disable+0x68/0xac
>> [    1.061681]  clk_disable+0x30/0x4c
>> [    1.065499]  pm_clk_suspend+0xd4/0xfc
>> [    1.068971]  pm_generic_runtime_suspend+0x2c/0x44
>> [    1.072705]  __rpm_callback+0x40/0x1bc
>> [    1.077392]  rpm_callback+0x6c/0x78
>> [    1.081038]  rpm_suspend+0xf0/0x5c0
>> [    1.084423]  pm_runtime_work+0xf0/0xfc
>> [    1.087895]  process_one_work+0x17c/0x2f8
>> [    1.091716]  worker_thread+0x2e8/0x4d4
>> [    1.095795]  kthread+0xdc/0xe0
>> [    1.099440]  ret_from_fork+0x10/0x20
>> [    1.102480] ---[ end trace 0000000000000000 ]---
>> ---
>>  drivers/clk/qcom/gcc-ipq5018.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/clk/qcom/gcc-ipq5018.c b/drivers/clk/qcom/gcc-ipq5018.c
>> index 70f5dcb96700f55da1fb19fc893d22350a7e63bf..24eb4c40da63462077ee2e5714e838aa30ced2e3 100644
>> --- a/drivers/clk/qcom/gcc-ipq5018.c
>> +++ b/drivers/clk/qcom/gcc-ipq5018.c
>> @@ -1371,7 +1371,7 @@ static struct clk_branch gcc_xo_clk = {
>>  				&gcc_xo_clk_src.clkr.hw,
>>  			},
>>  			.num_parents = 1,
>> -			.flags = CLK_SET_RATE_PARENT,
>> +			.flags = CLK_SET_RATE_PARENT | CLK_IS_CRITICAL,
>>  			.ops = &clk_branch2_ops,
>>  		},
>>  	},
>>
>> -- 
>> 2.49.0
>>
>>

Best regards,
George

