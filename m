Return-Path: <linux-arm-msm+bounces-43016-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 602059F99C3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Dec 2024 19:50:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4DEE21887C51
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Dec 2024 18:47:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A55D021D009;
	Fri, 20 Dec 2024 18:46:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com header.b="DJj/h1Yo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05olkn2038.outbound.protection.outlook.com [40.92.89.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8797221D5BF;
	Fri, 20 Dec 2024 18:46:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.92.89.38
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734720411; cv=fail; b=ibMfae4yuOZCAW9WWNvRatvqQ2m6hH455g+XhHWJ3u7ZrKJMHK0Kle5dV+gZo4tAvOK8LlpffVg+fnDci+10WTeYBXzSp05qQkaZUX10TrhEb4rmSRgRGtuoZXC55WPIJdv1hn6YMiZAMPHCxoWmt6o2cYTytnvZa/pIP/AXkPc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734720411; c=relaxed/simple;
	bh=5rMPAFkZWt3tSUhak09Rht+ozM/DEXkuYZl2o8CXIh8=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=XCKlW6JFHfoO3E2Ombgo2iTazw5sIu5bm2oUGjFvf1nXpmYY/Qb5aW+SCcOb+ia89UWxIcTUWpfamnXXYZC8zRBMQRiqaHbtoyAOI78Z6/eGpqbOTsfFUFnm+Qz/Ltg0mkCVRgJKiO16OBrf0krzl1nrqTK6dXg5EtHpb5lxgus=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hotmail.com; spf=pass smtp.mailfrom=hotmail.com; dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com header.b=DJj/h1Yo; arc=fail smtp.client-ip=40.92.89.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hotmail.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rGftPnT32TvKzb8SzgyMjNCEx41MyG08NbP2AzKUOH7wqhyc5O7FsDqvf/wwZGAb6d2Yvg1R+ANDEZeJd8tMMGj5h4COlRvnLy9SsNUb6VoHYqncP0b8E1t8hny+Hmxuljb+ghGjagGoRZXvqSPv+ldo+kNKpPhK3S7woHZJgu5zj1ZlLXTnK+pRDG2PTX1nvu0XOckaCM4YXSfZxRqnRav7TYJbtg+JB7gAke00z+h6lTd65rWdekfMJk9xq5M3qPbTdkgI5JyuCdidFBaAHtqQlQJaYQu3mum8odgqKQePlmO4AsA3qU5Z6RCvRXBmBCPhRERhts+M/3oaIPenmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wlecf5lFFk1JI5+b6l3UMuxfolumPO5UUkV8w5C+Dww=;
 b=wpj7T9JqXmd0tXZd2iDygEWMPRDV7OIwQE7tJA4B7DSeAC/Y/KwlsHy+OptxINYYKsR9wb2VvN8uH9ooIYZr5o07HMgE3XcUIObUGCJH+OBOyQbtIPJSEdGxK2gW4oA8rBm8ZadFSvdZrIbGipNaVCR5O7qmJr9K6UTZ28TPt4pph5IvTdQY1+vtgi9w72Ss6Ogm4WkMGyOzh8KCXpzvpobsLDeiiE3e3t7uO98b0GBIwx90wG8GZT0j2XYLCouweV40Q+WFRVKcBpfWC5i77pauC+M4Byz8vUiwvcyCRJINBggYNbVr71JYM9e+GcWCEwg9Ck+f6zxYBCKyXZI4tA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wlecf5lFFk1JI5+b6l3UMuxfolumPO5UUkV8w5C+Dww=;
 b=DJj/h1Yo+QkX2Gqgzr12PtG3nW39i8LxxcsCrqJR+n17qq+RokymAPE/MsYFgDl/3hcissCiiAI4ay2g8AGrkrqV+9YGb4wV0jVCOhW/6eLtP5M8x/reYWiXFr55ZNMuHQeUFX6N1Unz2RX3cJh9OuMUq4uzKWz6QF4D/+oeEm9hjywDKXPksPoAO2K/Ji2Lyim+PsbjFHj+UY/IA0zj4nypwJCOBHXLkg2Vu22eAlp0sB4GiFcVJZEqZhyoK1GluaxK/Q0SmMXS6npMpGCk8j6GuDSvec76HPWdoncPLVcnRPdHpIhB0jOHnaDpBMv6bwnrVvdc+N9K/RB5D5MH0g==
Received: from AM7P189MB1009.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:175::17)
 by AS8P189MB2420.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:5a0::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.16; Fri, 20 Dec
 2024 18:46:46 +0000
Received: from AM7P189MB1009.EURP189.PROD.OUTLOOK.COM
 ([fe80::e9f1:a878:e797:ee1a]) by AM7P189MB1009.EURP189.PROD.OUTLOOK.COM
 ([fe80::e9f1:a878:e797:ee1a%5]) with mapi id 15.20.8272.013; Fri, 20 Dec 2024
 18:46:46 +0000
Message-ID:
 <AM7P189MB1009DBCC9F40EDC3852E14D2E3072@AM7P189MB1009.EURP189.PROD.OUTLOOK.COM>
Date: Fri, 20 Dec 2024 19:46:39 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/3] arm64: dts: qcom: x1e80100-vivobook-s15: Add
 bluetooth
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Johan Hovold <johan@kernel.org>,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20241204-asus_qcom_display-v6-0-91079cd8234e@hotmail.com>
 <20241204-asus_qcom_display-v6-3-91079cd8234e@hotmail.com>
 <Z2WucXuxJ5bKzifa@linaro.org>
Content-Language: en-US
From: Maud Spierings <maud_spierings@hotmail.com>
In-Reply-To: <Z2WucXuxJ5bKzifa@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS4P251CA0019.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d3::7) To AM7P189MB1009.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:175::17)
X-Microsoft-Original-Message-ID:
 <a832e8f1-4ca7-4f68-a70a-39fe1e84fec4@hotmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7P189MB1009:EE_|AS8P189MB2420:EE_
X-MS-Office365-Filtering-Correlation-Id: ad1cf28d-ee12-4ae9-bd64-08dd2126a407
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|6090799003|19110799003|461199028|15080799006|5072599009|8060799006|10035399004|440099028|3412199025;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cTRXaXowTy9NQWVjKzZsQWVHWGlicEs3cVNITlpjeDRZYlJQdEY0VmFPTDkw?=
 =?utf-8?B?b3BqVUYyQXltMXJuK2JITlcybTRxWW5nWE5GQmV0THNSSjNQVGhqQmZ4MmZl?=
 =?utf-8?B?bnFlVzhjUW1ibFRyN1MyY3BnV0ZFQ3BJZ3k5R1NPak1peXFHQ0JwTFVrVk1T?=
 =?utf-8?B?VXBZcUxRUThSUUFUaW54UlRyUWhhd1NMbEMvUVdNK0h0NGNJVGJsSC80YVZM?=
 =?utf-8?B?UTdTZVIxTm1FVG1SWW9JOUc5OXg3TUpRYnlGVXpFanFidUhIUFlHR3R3c05h?=
 =?utf-8?B?WUZVRjRRV0xKNkNpWUxiWXQrdElUeTRvdFo1Tm95MXpaZDZ1M1BzTFU5dXpJ?=
 =?utf-8?B?NlVQMW8xUXRJWnJvbWp2eUJuN0RuUGdmZXJnNDVmcElKMnI4ejhLS2ErUEcz?=
 =?utf-8?B?NHNRMDJ3b2QvenEyZXNuRWNHcGxzVjMvZ3crS0JwbmdKeXJTUDM5dkpaZmVY?=
 =?utf-8?B?empYZkR4a1ZHeHJKRmlzblZuNmgzQldzK016clo0RnpoTDNaU1ZRNnl6UnRG?=
 =?utf-8?B?N3VraGpTcVF2VGdHcTNRaFgwdnJOYVBVWGxON3FFMTNkVHhGNXZmWVltNFRQ?=
 =?utf-8?B?SFVEdmVvQ3BBNWh5dmc0MlU1VTg1eS9UcnhqOVNycGR6bURqb0tITVV1R280?=
 =?utf-8?B?NHBIQ2tDeEViU1h2SGtLLzllQ0Y1ZjkyYjc5UXlUQXlJa3hYOFlMTE1yRnBn?=
 =?utf-8?B?dC8zSzFKUncxV0w1NW45Z1dqNS9icGpBTkdpZ24vOHAwZlVSOTZQaG9XcmVr?=
 =?utf-8?B?ZXI2aHl6WDhVZVZsNUdPOVUrNTZmRzZ4aGRrV2x0L0l4ODFZWU5iTi9GQjZS?=
 =?utf-8?B?c0hrUENVQ0UyeFNSdmRvRVl2NElVSVhsL1Z0WW5qQ2dmQ0xWZExrWi82SnZS?=
 =?utf-8?B?M0xiaUlQQ1k3OVlQOWQvL3I2NFhzNG1KWHdmZ1FkRDVCb1JqTjJxWWRMa3hV?=
 =?utf-8?B?WGkvQ0JkNCtUTnQyT0JMVW1nYktLdyt4aFFIRWJBWXhvL2VtU3VXMVRKUnBt?=
 =?utf-8?B?UkRDQVRZTWxQOXBmdHluTHV3cTJQZjNkQ2ZoUWFBcS8raHFTUlMxNXhpcFNt?=
 =?utf-8?B?QjlpWkl3dnYzMjZYSnNEUHROZ1BhRXdtTVMrWnhsU1J4V2RXWW9Xc3laZWxr?=
 =?utf-8?B?cjliNHljNjlReTc5cldFbVowR3R2QTFpOFgwMUhNU09NanFtMVJZV0oySkFC?=
 =?utf-8?B?RUovT0FvVkVqMTNhWmVyU3FjSHdQdGFDVHkzWkE4SjBPNnJjUE9MeE5DVTBV?=
 =?utf-8?B?QzNPRTh1K3U3MXJrcVU0bDhuWWdRVnBKSk12WW1tMm1SQ0JLam1ITTkrVXJs?=
 =?utf-8?B?eDRiRXE3VC84RHQ1MTFmdmh4QjREdUFpdHJ2VmUyWmZCejlVR0pmUkhDSGVK?=
 =?utf-8?B?RkFDK1ZjNSsvVlR1QmNjdmxESXRYSXZ0VG1pa2g0R3l5Rk5tOWtXSHl2UC9O?=
 =?utf-8?B?VmxZZCtWM2xSSDJwbkluVkVJcFRlOEg0WHdUcmlQNTJFOTZ1Ti85L3R6TmI0?=
 =?utf-8?B?WmhTT2V1bVZROUN0dkdBV3pWc0hPL1hCR0hob0ZCRXpwZTVLbTZ6T1M1RldH?=
 =?utf-8?B?aTlCdz09?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?V3IyL01obWRPWkV4ZnVwVEVCNEdFOUxiUWhuZFB5c3NYdXNCSkM1VUJlMTlB?=
 =?utf-8?B?VldKUjRCdElzNTRTa3FtanR3Y2g4TW02bHl3VGV4Q3VPL1prdGtpS29hU2dY?=
 =?utf-8?B?eXhRaEppd1diRE9XWENTcFg1WlBycmp1MnZla1BGd3k1VkszUEtXbStFYlpP?=
 =?utf-8?B?eVNjRzR2b2NrN2p3TVovdUloTGFkN00wNC9KRGliLzNoeURaTHRkWjBoK2E1?=
 =?utf-8?B?Q0RkYThGVlNubW1tc2FTWVR0bG4vc3RQYmx6eDJrWisxbW1EWEwxY0lGRXk0?=
 =?utf-8?B?a0dsQzBaS2tDY1ZWR2ZCZ0FObWVHTWVmUlM3cll1WHJZaGtMdFk1VWFDQnBH?=
 =?utf-8?B?L1J0cWlzT2F0eE9vT2xoL3RRT0xQWHRvZi8yMStaRFk0TVZOZmFtS3hnaUJT?=
 =?utf-8?B?ZGRGdlZCRmFZS092SE9nbWdvNnVYZ1gzRHlINUFhR2M2M09Xb3ZXQ24vQkdh?=
 =?utf-8?B?UlFGNHpXTll1RUhKUzlEU0RGWlM0UmluUlkvYzFwZ1FUNTRkYWhWYmZwcGRj?=
 =?utf-8?B?SXEvbVlXcUJ1S3hSZ3FnZDhDRXJENVZpRFZWV3BmTmJLUldRRmoyTFp6K0hy?=
 =?utf-8?B?Ym1WSFZtU0o4Rk93RkR1N2pnTEhGbUlDdUlnclIzTmx1SmtWcitjSTQ0NHJo?=
 =?utf-8?B?dzVPY1NubnpCUThhRnJkaWFOSktidkFFeTFxbmttU08xeDdDK2NjdzRRcnhi?=
 =?utf-8?B?WnhKMnNCQSs0RGQ3ZjBFVVhpRjEwT0c5OEwrL2lOT0dTK3NBNktWSFJKbkJV?=
 =?utf-8?B?dTUyaDAwenBMNWdpK3BjOWMwQjZUb24wQkRTVGdjUzYyd2R4ZXZ5TjRXdHJC?=
 =?utf-8?B?UXNJOGprbnFhY3Z1UkNySWIvbVdMTmZsRDIyVE5sWjVJeEdUWnd4aWdsTmhp?=
 =?utf-8?B?ay9XUFY4NjhYTVpxQ28wYUFydnhmUU5HUlZvN0Y3Q3V1UkhZTG1IRlVoMXZL?=
 =?utf-8?B?ZlpETlU4VVMva2ZjMU1ZTGNPcm1IYmVrVkU3Q09vaDdpcEdPN0JDUEJ0NzBX?=
 =?utf-8?B?QUswYys2ZFRBTk8wZlRYMVYwVEZWN1Zsa214SmlUUEFTaDltdm44M2I1ci9u?=
 =?utf-8?B?bmdtVjAwNDEvQm1hN2xZalc1ZGNvdktadnRpSE12ZDA1ZTcyWUJIK2Z4ZDZV?=
 =?utf-8?B?Nmt2dWoySkhBRFR4UzJPRFltTEQveWVvUmJIdTZpZm8vcWQxbXdQQ3VYRWdm?=
 =?utf-8?B?RkJ1eHFrd3dSekdDU1dpWW1ERTBaemRKa2RJUUtqMGxqbW5ySWx6Y1N4SUxV?=
 =?utf-8?B?LzRZWkdBVFpZQkpyU0pjNmZ4c2lJR3NFRU5qMmpMeHZRSmx3Um05OU02UzF2?=
 =?utf-8?B?QXhWcDQvalBSN1N2ZjdIQ2RmbC9SZkR3U09TM3VWRXJiLzU5NkExYUREbTRB?=
 =?utf-8?B?V1Q1b3haWFhoZmhIOWRVZzdNcUpKTjFBaWZMVnFiNUptWkZjcUVVZ3c5OGNw?=
 =?utf-8?B?Rm5tNnJjcXRGOGRjcUZNb2tEMmw5NVdRYkNJK2tUYndSTkFhS25xUisyQldB?=
 =?utf-8?B?UDdiZnBLZ3R5TnRXTUg1b25YdXdQNDJPM1ZGSm9OeS91bWNCQmE3OEVIQURU?=
 =?utf-8?B?akNuU2U1OENqT1JqMXRyTTFLdDFodkp0MjBWTUJzYjY1Vk10cENYZTFjaElD?=
 =?utf-8?B?azZ2QXFjaFVPd1F6QndsU25MaFdKQVZ3bU4zSmJ4Ui93WEdibE9ubFNIQ0RE?=
 =?utf-8?B?OVBQRDRwaGZacVFDNWQyOVIxcmo2NzNMVURsU2RTczhKUEh2eDZYSWdmK1Fi?=
 =?utf-8?Q?L83b5GElSHpQBNn7SWbNkJLLyhESXtH1AJuEl19?=
X-OriginatorOrg: sct-15-20-7719-19-msonline-outlook-3b3e0.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: ad1cf28d-ee12-4ae9-bd64-08dd2126a407
X-MS-Exchange-CrossTenant-AuthSource: AM7P189MB1009.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2024 18:46:46.5983
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8P189MB2420

On 12/20/24 6:50 PM, Stephan Gerhold wrote:
> On Wed, Dec 04, 2024 at 01:26:39PM +0100, Maud Spierings via B4 Relay wrote:
>> From: Maud Spierings <maud_spierings@hotmail.com>
>>
>> Add bluetooth for the asus vivobook s15
>> Describe wlan configuration
>>
>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> Signed-off-by: Maud Spierings <maud_spierings@hotmail.com>
>> ---
>>   .../boot/dts/qcom/x1e80100-asus-vivobook-s15.dts   | 161 +++++++++++++++++++++
>>   1 file changed, 161 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dts b/arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dts
>> index ba52c0eef4e32019f6eb7c7ae3c4cd727df23490..6564386e92e5c8c08ae2807ba512f83537358cf5 100644
>> --- a/arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dts
>> +++ b/arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dts
>> @@ -19,6 +19,10 @@ / {
>>   	compatible = "asus,vivobook-s15", "qcom,x1e80100";
>>   	chassis-type = "laptop";
>>   
>> +	aliases {
>> +		serial1 = &uart14;
>> +	};
>> +
>>   	gpio-keys {
>>   		compatible = "gpio-keys";
>>   		pinctrl-0 = <&hall_int_n_default>;
>> @@ -153,6 +157,101 @@ vph_pwr: regulator-vph-pwr {
>>   		regulator-always-on;
>>   		regulator-boot-on;
>>   	};
>> +
>> +	vreg_wcn_0p95: regulator-wcn-0p95 {
>> +		compatible = "regulator-fixed";
>> +
>> +		regulator-name = "VREG_WCN_0P95";
>> +		regulator-min-microvolt = <950000>;
>> +		regulator-max-microvolt = <950000>;
>> +
>> +		vin-supply = <&vreg_wcn_3p3>;
>> +	};
>> +
>> +	vreg_wcn_1p9: regulator-wcn-1p9 {
>> +		compatible = "regulator-fixed";
>> +
>> +		regulator-name = "VREG_WCN_1P9";
>> +		regulator-min-microvolt = <1900000>;
>> +		regulator-max-microvolt = <1900000>;
>> +
>> +		vin-supply = <&vreg_wcn_3p3>;
>> +	};
> The reason we haven't pushed these patches for CRD, T14s etc is that
> unlike for QCP these two regulators are not actually present on the
> mainboard, they are part of a soldered or removable M.2 card. You can
> find this TODO in the commit message/patch on Johan's kernel tree:
>
> https://github.com/jhovold/linux/commit/32cfeff737b0f9a2f8787d21a875e549a22e9e8b
> https://github.com/jhovold/linux/commit/2a7fee4007670e2f0f7696eb9e992e74d3be460f
>
> We haven't come to a conclusion yet how to model these M.2 cards
> properly. Perhaps we should stop blocking this and merge this for all
> the laptops as temporary solution to get Bluetooth running, but then we
> should at least preserve the TODO comment block to make that clear:
>
> 	/*
> 	 * TODO: These two regulators are actually part of the removable M.2
> 	 * card and not the CRD mainboard. Need to describe this differently.
> 	 * Functionally it works correctly, because all we need to do is to
> 	 * turn on the actual 3.3V supply above.
> 	 */
>
> @Konrad: Given that you acked this patch, do you have any opinion if we
> should merge these with this open question?
>
> Thanks,
> Stephan
It is soldered down in the case of the asus vivobook s15 see:
https://laptopmedia.com/wp-content/uploads/2024/06/IMG_20240618_161453_1-scaled.jpg

I don't know if this regulator is underneath this metal shield or if it 
is actually separate on the board in this case.

But given that it is not a replaceable m.2 module isn't it kind of part 
of the mainboard anyway?

Anyways if it does come to having to add the TODO comment I'll fix it up 
in a v7

kind regards,
Maud Spierings

