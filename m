Return-Path: <linux-arm-msm+bounces-53758-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 44364A8382B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Apr 2025 07:19:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 00D457A46B0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Apr 2025 05:17:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 579C519E975;
	Thu, 10 Apr 2025 05:18:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com header.b="VtB7TNds"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05olkn2069.outbound.protection.outlook.com [40.92.90.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76C8217E;
	Thu, 10 Apr 2025 05:18:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.92.90.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744262286; cv=fail; b=C8ucw5yWFnLWd5Fn1jto+XDkiswNbA7W4llXrVpcU6AXlUIVxqbWzTi+rjJoXJvAKqvZyUpvSN9Rc9Yrc3zNCn6xNRnEDTTsZVWmSiM402LgPgHbMD2bPjSFfFRNbuYkqJJ1FHziSOVXwoOZ5Uw2rgUZZPAgQMzPaI+C1N319kA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744262286; c=relaxed/simple;
	bh=XOOkzS4xq3ZCwJuOaDeAYb2Gzj9haeTO6neoso5qJRU=;
	h=Message-ID:Date:To:Cc:References:Subject:From:In-Reply-To:
	 Content-Type:MIME-Version; b=nAd5wdqBP8z1WFzV2ONNwlKjvQTZA/jeJzcw5m9OIPsJ7rYcwWWSZodG3IkUQaWxaQC/12Bx3dMhooHD4FqsYrj/1wYI1vzPfGm2OLG8jDf1TdQm26WsGNU2O5sjElTNkIbeehGO3OZKAiJKNd3O1ySTMUxy9D9XowrIZDX1Ztg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hotmail.com; spf=pass smtp.mailfrom=hotmail.com; dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com header.b=VtB7TNds; arc=fail smtp.client-ip=40.92.90.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hotmail.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nJ1M3edN9s6sLgxJg+U6m+g9bU68lzPVZkybl2gdvpSXC9U4fcrYlDgpnCZfbGcOqbXJLz+GRZg6FT/eM2UZFmq1GFW+7KHRSAkG/U3lDGbyTEg2Nx3VTetiudpsZsJh0H+lAR4gkyTpkNfz2ZxIdyAcTJho5cpclMAfvaWtMZtNneWTtU/gVZ9wFsZygnWk2qeuglkg3I+QNOgnUNBreeRfVMYtBsG89qcEpNV2EhP6WHqnWdu5IZEeWGlqJjus176mpB62QXypE2SWytFrqthT7sCh67k1f9PM+UNuhL1l/VpO1t+zldggmIGysU3k+8y7ttJIyfoi9t0UPUYVUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9cLZQXr70KQjZZhkVP72fOkaJaZuqhAgM9fKrMjEL6Y=;
 b=UOFNMv/g1ZZHu3sUGqEFpuBtUTvk5wV6sFqCuSw7C8FCtAXB0PJc/C/KzfR1DytyIiU9LqT9PNI78q6OK7cezNxO2m+46dgVKV/gT5Gf1YC18bsyxqqdGOQ4yCLXUNz8v2/3rsjgjPCr4/OZLWQ5yBWhiMIzyuX6aKzv6f8kCdZemWF7FaoOKB4XJZpdVIumic6Ilh7AGImbPCpsX2KL7jMJiAJLtNvn1HGtveKnWSiubMp58Own+FqKbHgBNqzS6Y6bDCTykNtWfrZGzUIFFCqMi8ENcOYfDwdMcY60fjszw3UpeuNFG2dueDrVDbcCu5EB5SnbL1QfC7HIqJkUKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9cLZQXr70KQjZZhkVP72fOkaJaZuqhAgM9fKrMjEL6Y=;
 b=VtB7TNdsjRv4GPV2IM9Es95P6V/kBXOYR+ixa8lMJ1NwLOUrm8v5iPctW9p9rJBBxx76v75Puc1IK2IIXF1Bc5knVDVbFaFXgCe+McdwzxaB+Z1CMukVVsMvH985N9Yy1YbREQ1ZrWjIwkK7Lv/ba0R55rOYhM8iiv5XjYsgiqnju+wW26SVpZWZqlQs30zTmlPL9dEUh/UT+pjeGjFkEN1RP6YT3DLvrBuvSe6Lr/N1+4XBAY3NGuosVr7ooex9xukhtPTQijhCmr/PPHcmYr7JxHVNEiDpfJtnL67NTNPMRNt1RNH+SpvTpb4L/12yHbmLWHMCGdA2tJbwM7lt6Q==
Received: from AM7P189MB1009.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:175::17)
 by DU0P189MB2614.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:475::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.32; Thu, 10 Apr
 2025 05:18:01 +0000
Received: from AM7P189MB1009.EURP189.PROD.OUTLOOK.COM
 ([fe80::e9f1:a878:e797:ee1a]) by AM7P189MB1009.EURP189.PROD.OUTLOOK.COM
 ([fe80::e9f1:a878:e797:ee1a%5]) with mapi id 15.20.8632.024; Thu, 10 Apr 2025
 05:18:01 +0000
Message-ID:
 <AM7P189MB1009B07E5A67B1B16298B3EFE3B72@AM7P189MB1009.EURP189.PROD.OUTLOOK.COM>
Date: Thu, 10 Apr 2025 07:17:53 +0200
User-Agent: Mozilla Thunderbird
To: juerg.haefliger@canonical.com
Cc: andersson@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org,
 konradybcio@kernel.org, krzk+dt@kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, robh@kernel.org
References: <20250408145252.581060-2-juerg.haefliger@canonical.com>
Subject: Re: [PATCH v2 1/3] arm64: dts: qcom: x1e80100-hp-omnibook-x14: add
 sound label and pull out the model
Content-Language: en-US
From: Maud Spierings <maud_spierings@hotmail.com>
In-Reply-To: <20250408145252.581060-2-juerg.haefliger@canonical.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS4P190CA0031.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d1::6) To AM7P189MB1009.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:175::17)
X-Microsoft-Original-Message-ID:
 <37a8cd62-9d00-4f97-a7de-4aedd2b7e05c@hotmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7P189MB1009:EE_|DU0P189MB2614:EE_
X-MS-Office365-Filtering-Correlation-Id: 4828f98c-102c-4363-a9c3-08dd77ef0ee1
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|5072599009|6090799003|461199028|19110799003|8060799006|8022599003|15080799006|440099028|3412199025|13041999003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Q01Fd3ZGRlVrWXRKQzkrL2FnOWgzT0h3WmJLWmQzNk9idEJrWnVRSWxjRWxo?=
 =?utf-8?B?ZmUyOUQ2aVljeTRvRlpmcW9kTkRDckdhL21DQ2FoY0dDMEQwR2d0MlNtbFVy?=
 =?utf-8?B?R0NlLzdlVVpjUnZlTmtzTCtKZGd2T2NnM24zcWlNazlENExWZWVsSjJwWTFK?=
 =?utf-8?B?czBSSWRUc3cxbXNyZXIzaUpPaVc0UVk1UUZQUEJtY2d2QXYxSGplUjNQeW0r?=
 =?utf-8?B?NEdlZTRFd3NlUTZqYVkxSlk3c3k3RDRFT0ZwcVE0Lzc0UW1ZVXRyUzV3WE90?=
 =?utf-8?B?RmkyTlowQjh0U2gvNUsyRHZhK2M4Z1k3SHZ6U0NBUHA1RDFSNFlYNXJ0a1RU?=
 =?utf-8?B?c1c3UGpPREd6VkJTRU11MnEwakU0MCtHaUJ0b0F4UEdIUWdBcVhkU1VhWGdT?=
 =?utf-8?B?Y2ZyQWpjRXFRVnhKODcvOXp3SXI2Z1ZEMUhuaHRQRVFpVmxWejZPVjcxcmJi?=
 =?utf-8?B?UjZDcjIxUXdDaGcxS2NDVGlyRkJ1aysyanRlMHl4Sng4bnp3ZFU2S1pvd2ww?=
 =?utf-8?B?YmErcEJFVnBMK1M0VWNVMmxWWWhlZGRaMWkxQ0gycTRRRG1BTjY2VWJ4OXRO?=
 =?utf-8?B?TjV4MS9FSnBGenZEblFjMGNKb0lrazVFT0JzMUZQMzgxT09BdEl6REI1NHp3?=
 =?utf-8?B?d0MzK204Q0FTcHRqbm5jaGZHNDVZakQyN054K3N1RHJEOXdxZHVRejI4RnJV?=
 =?utf-8?B?c1N2a3JNdDl6Y3RQY0czTksxbS9QTnhHS1ZBNnROQWZzbGpqTDI5STkrYVln?=
 =?utf-8?B?NFVtSGdOZVBDRnJ6UUE2dGh3L1JCT0NlNjBBdkMrT0M4eEJXQ3pCVXNEa1Fz?=
 =?utf-8?B?TXZqUk9Uek5vSDRkZUk3bmF4OERTdUNCcDdMeUMvanVCOFdRc20yWktQcndH?=
 =?utf-8?B?OTlGc1JVbEs4TUlBclJzM0kzdm93VHo5QjJTYzliRWh2dmVSMjFaQWI2d045?=
 =?utf-8?B?VkJ4Y1c0dnhxeVpCN2s0ZUNlejZnSXNoUkt2Ky9tc3hQWmMzWFdIVUl0RGtz?=
 =?utf-8?B?U2dqUHpQNlJTb2pyZGc1WDVyL1JOT0JiQ2JUbjdpVWtBWFZ4UVVQMFBaNHU2?=
 =?utf-8?B?cmF6aGhCVklNcDBMYWN5MVEraGhXK25KQXdHUGlUTDI0TW12eHdSV09uNktB?=
 =?utf-8?B?ck1Qak1xeDhEY0NicTNHWHZjSDRXbktUNkd5YVhGdENlVElQU3V3NnJtNUtP?=
 =?utf-8?B?djhwYXU3MlkxZ0hyNVVDdXJ6VWFld1VYWEk0VTBJa0tWMlRUelBtN3ZwZzlz?=
 =?utf-8?B?am5WTjV2cjJiZVF4L05aclJzenFhZVk4ZzlQdnFtbzd1ckdPVlpQdjVOb3Bk?=
 =?utf-8?B?aVNITGxReUtKVEtTTnFmQkFQYkZnSmYxZU1QUEJodzYvcWFjaTkvTFR2QnRq?=
 =?utf-8?B?NHF2TUZHK1pDYm5EQ1VGUG9YWjh6WVh5ZWlmay9NbG1lM0VyQ1pmOHpaSzhs?=
 =?utf-8?B?WkNQMTdXSFVMeFZrRGcxT3dTODJJT25odkIrS0pTY1dPYlNEeDFlZ29WbUFx?=
 =?utf-8?B?VGVtNkRrbnltcVhRRHRQV1Y1d2lZTitXSW1KQ01LbTNHSUNrZkE2Qit5YTd5?=
 =?utf-8?Q?88UZCTVcPRp31ziLNoFrEdkDI=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?amY5MDVvRTF4T3FCa3FzeCtDQ3lvVDl4UWZVV0RhRU1qaW5Zc05jbFlFRmFS?=
 =?utf-8?B?bk1YcHlsOGw2WU1IVDlWeHZraGJLK2lKa3JjYlRmRWNMdURYb3ZWSVFKdHFa?=
 =?utf-8?B?Q25ZaDJPYmlsa3g1MjNmZlFwK3d3Yzh1WjFyM1orc0h3OGJwQkNEMC9zWjlC?=
 =?utf-8?B?QytXT3BZaFNrR3M3cE9xTU44ZXpobzBSVUo0S21LbmptWjJabEJjT0lWT0dZ?=
 =?utf-8?B?RENudXkwbms3bXlYUmV0T0lyVUZLcmVWUUlSUmdqK0FCUEEybE9hWVpqZDNJ?=
 =?utf-8?B?UzNlZ1JvRE9xbWoxM1J3eDJVaUdmSUtIbTVaR0RiT0ptTU4wSXkyTGxJQm02?=
 =?utf-8?B?a0xZQmVQLzVPVDBESDg0bGNCR0dES2Z1eW91NE83bWV4VUZyMk15cS9jMkZy?=
 =?utf-8?B?N3pFdU81WTQ5Z0YwU1ExdDJ2V2NaZFZxUUVZSmQwVGdWbFpGVDNJVG9yOHYy?=
 =?utf-8?B?a3FKQjcybEJUUjhzcXR3RHhpS25QMlhPREZrcTJXN0ZyM1B3cllVWnBxR1RJ?=
 =?utf-8?B?OVZCSGh0YmRnSUNKZE0zS2w5WW5PR1hzVGFPMnZWbXJPNXB2b1FOOFYwNHF2?=
 =?utf-8?B?MEU3OVpFWDVUVklkYUQwVndtS3NYQW1CeG5veXlJbkhwanl1OE1aTDBtZWRu?=
 =?utf-8?B?c3BDMDdvYUtKdzBBVHd3T3lVMVJBU2F6eEJJWlRHc0w2MGlTZ2JZb05BLzBi?=
 =?utf-8?B?NjE0UktnV3lMTkRucUcyMFQyNTEvT240ZFViak4wbEUyYnFKaVc5V3hDb2xm?=
 =?utf-8?B?WE9zeUNYdGkxRDVRUlZERVZQUnNRc2FrVUNYdkNuSXJwOUVTbG5qZlBXV21j?=
 =?utf-8?B?ZE9zZDZTd2wzVDRUUGNJUUg3dTlxWjkySldCK1JIKzFhbkVmd0lHSzN4aEJk?=
 =?utf-8?B?VkdxaXdFaDdPWkUyZW0yUVNMcXdZVERrbU9NMkpmbUw1M1dxV3VDZW5yL1Va?=
 =?utf-8?B?NldSMkhmOUNCWjkwUVkvRmQ0YWZVZkJiYkZ5eGlXbHNPNmdWUzd6OHg3WDVp?=
 =?utf-8?B?NzdJaXNjd2ZrTGM0eWxtak9vVjVPODhTVC94NnY4MDJUOTRVbDEvRDJPUldH?=
 =?utf-8?B?Q3ZCWW9kTU9MZWp0eHhDYnBXUGhkLzhtNzZLZFM3KzlsTWZaL3BLb1lxWTN6?=
 =?utf-8?B?Vi9HQStVU1hqU25XKzFFMlBnVDUxMG54bDMveCtiVlE0RzcvUDNjeEZ4VE5k?=
 =?utf-8?B?QU5YNWl3YlVsQkRJMmNLdG01VGpKRWdIY0JiYmJLZnZmUWJLTVhHU1I3ZWY4?=
 =?utf-8?B?UDJ5eGZNNmFNaHFMcnpBdVJKK3V5RkY1QmJMZTkya2JBQmh5RU1kSFpZZ3kz?=
 =?utf-8?B?cEMwYzc5NjcrRkFkSU14eXdaRUhyZjZSWE05TWtoU1I1alFWL2JRWVgvOEFn?=
 =?utf-8?B?dXpxSzVNUXhQNnJ0b3gyM2NiQ01JK1VQOEl5VjA1R3ZDNERxWWJWb0owUlBk?=
 =?utf-8?B?bWw4S0FiWm9UdlY1UG8yOXpwTyt2cVFuTUQ5MGtPWkpRb2kxN2o0cTNIMDBD?=
 =?utf-8?B?em0wNi9HYTNEZWwvcGN2R2ZzVXZ3emVqVCs4NnFOd1B6ejY5V0E0REtpRkpa?=
 =?utf-8?B?RHJXRVhZKy8zQWVSYUhSdXFMSi9qcW02YnltdG5rWnNKSit6ZWVzV3NGZ0ZX?=
 =?utf-8?B?STE4S293eldHRmg2ckx4N0NYYXNHbXBGa2RjM0RpWk5OQThxczV1bUw1RHlo?=
 =?utf-8?B?aTBmcGxoTXBWZnZ2VHNCMm9mLzRqTkNjVFNDdXY3elFSUUVEUjhkM1ozb3cv?=
 =?utf-8?Q?7NPbX3YaUc2Xo33zCxNSxC+b+ftb2sSPgkFoeGL?=
X-OriginatorOrg: sct-15-20-7719-19-msonline-outlook-3b3e0.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 4828f98c-102c-4363-a9c3-08dd77ef0ee1
X-MS-Exchange-CrossTenant-AuthSource: AM7P189MB1009.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2025 05:18:01.2367
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0P189MB2614

> Introduce a device tree for the HP EliteBook Ultra G1q 14" AI laptop. It
> seems to be using the same baseboard as the HP OmniBook X 14 so just use
> that for now.
> 
> Signed-off-by: Juerg Haefliger <juerg.haefliger@canonical.com>
> ---
>  arch/arm64/boot/dts/qcom/Makefile             |  1 +
>  .../qcom/x1e80100-hp-elitebook-ultra-g1q.dts  | 36 +++++++++++++++++++
>  drivers/firmware/qcom/qcom_scm.c              |  1 +
>  3 files changed, 38 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/x1e80100-hp-elitebook-ultra-g1q.dts
> 
> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> index 710879d94c00..3d98bb95e8b1 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -294,6 +294,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= x1e78100-lenovo-thinkpad-t14s-oled.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= x1e80100-asus-vivobook-s15.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= x1e80100-crd.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= x1e80100-dell-xps13-9345.dtb
> +dtb-$(CONFIG_ARCH_QCOM)	+= x1e80100-hp-elitebook-ultra-g1q.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= x1e80100-hp-omnibook-x14.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= x1e80100-lenovo-yoga-slim7x.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= x1e80100-microsoft-romulus13.dtb
> diff --git a/arch/arm64/boot/dts/qcom/x1e80100-hp-elitebook-ultra-g1q.dts b/arch/arm64/boot/dts/qcom/x1e80100-hp-elitebook-ultra-g1q.dts
> new file mode 100644
> index 000000000000..9f3aac1a83fd
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/x1e80100-hp-elitebook-ultra-g1q.dts
> @@ -0,0 +1,36 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +
> +/dts-v1/;
> +
> +#include "x1e80100-hp-omnibook-x14.dts"
> +
> +/ {
> +	model = "HP EliteBook Ultra G1q";
> +	compatible = "hp,elitebook-ultra-g1q", "qcom,x1e80100";
> +};
> +
> +&gpu {
> +	status = "okay";

status should not be needed as it is already set in the omnibook dts

> +
> +	zap-shader {
> +		firmware-name = "qcom/x1e80100/hp/elitebook-ultra-g1q/qcdxkmsuc8380.mbn";
> +	};
> +};
> +
> +&remoteproc_adsp {
> +	firmware-name = "qcom/x1e80100/hp/elitebook-ultra-g1q/qcadsp8380.mbn",
> +			"qcom/x1e80100/hp/elitebook-ultra-g1q/adsp_dtbs.elf";
> +
> +	status = "okay";

same here

> +};
> +
> +&remoteproc_cdsp {
> +	firmware-name = "qcom/x1e80100/hp/elitebook-ultra-g1q/qccdsp8380.mbn",
> +			"qcom/x1e80100/hp/elitebook-ultra-g1q/cdsp_dtbs.elf";
> +
> +	status = "okay";

same here

Kind regards,
Maud

> +};
> +
> +&sound {
> +	model = "X1E80100-HP-ELITEBOOK-ULTRA-G1Q";
> +};
> diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
> index fc4d67e4c4a6..e7262ad11509 100644
> --- a/drivers/firmware/qcom/qcom_scm.c
> +++ b/drivers/firmware/qcom/qcom_scm.c
> @@ -1987,6 +1987,7 @@ EXPORT_SYMBOL_GPL(qcom_scm_qseecom_app_send);
>  static const struct of_device_id qcom_scm_qseecom_allowlist[] __maybe_unused = {
>  	{ .compatible = "asus,vivobook-s15" },
>  	{ .compatible = "dell,xps13-9345" },
> +	{ .compatible = "hp,elitebook-ultra-g1q" },
>  	{ .compatible = "hp,omnibook-x14" },
>  	{ .compatible = "huawei,gaokun3" },
>  	{ .compatible = "lenovo,flex-5g" },
> -- 
> 2.43.0



