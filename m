Return-Path: <linux-arm-msm+bounces-47169-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DB14AA2CACB
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Feb 2025 19:07:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AA0E43AB41D
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Feb 2025 18:07:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C246B19A28D;
	Fri,  7 Feb 2025 18:07:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="cxQrQ+GJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01olkn2058.outbound.protection.outlook.com [40.92.107.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE792175D5D;
	Fri,  7 Feb 2025 18:07:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.92.107.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738951651; cv=fail; b=B61WT/I6P/1A9pDF2JuNh0Pu0xNT+xEAxLtnnh40l2nnOdjUQy2g9wH7i4bYbuztDOtM5YdQF+9MIRUlf/IeycrnjXVTqsaDyySRwFt5F8c1psQ2I635A+ch1vAYuSjqP1d4PVm3qh/3WQNjvXOWwQKwsrTh7I6HkF4canjtHWA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738951651; c=relaxed/simple;
	bh=duZZBxDv6zPYP2QS6+Fc38S6y9rOVKJZRj+4Te0DcwE=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=lj745eM/itQ2qGhlpxU+IM3/Z4qmvbbffmazEac4cxEH1GMohLuRWbIpidG6+gqkqqHIw0zMUdUdGqtjpxNOm6AmxMj6WCE9Uzy+3gOR2o22SSma0eFFuUBkMnjQjopHSA/GjhZ9leKQCD/74gc0mlbIYAOrpbsTz6vSmivZm6I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=cxQrQ+GJ; arc=fail smtp.client-ip=40.92.107.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jlVhXkPjqLH0mzD0vBmbcWySX1KCqsvHT3T0yV6IIgkIzvr6GlJeGBEljlSj151V0QEHgcqkFS35eQ90XZt6lS5MNHita7Tg6D0o7rYkejwztufZGFDtgFaGkSH2GZk1U5WrdIvnfg3dSIllk/wUUHxRsGXIUOTX1k9NesNqkB33/JhzYAq0BYwtMh+9hoEMEM9w9OmgnWL3VYuzF9kAlvU3V2tXvlQwykbS1Pk2pNnVGCZr7ZGDi5HvrK64GFsNA2x+AwZYu6f10Gw4DxxltK79bA9h9zJiQo9DxVOXnrCILV8cHYu3ORzQ8O+538m1E5uxryDAV/8m7NP+80n8nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KBKF1KHZ1e0YJkE8jxZdgIiqFxEHX+1sPNqbvUosZPc=;
 b=glB+0FUfmQX6KQrDCJ0F9aSOCqPfa5L/FK1dcfYtvV0jONEz+bCGZ8clSMFamT/ivhHNefQy7WaPxDocrThrc0HBSgLKZlNfYaG1LP1QtqGC8Qt+Ebfr9B4KNrZU1R4HO95OQVruDPXO1zqtH3W41RSa2yaTwG/K/YCiju4YilKq87PXJKYPxfSn5O+XDB1/aqiLMbFsXBpe7+Mz/nCjSs14fGg4gda19gLAvvwY6hzeZrTsRTwNXZid4DiSGpOlNdxmL414KdGR9mT+9rIHHbfw1uon1IUOZz1qe/KIiPF43HD9CVD7rybtKOMOvr5EFT2a1mjjyev+Q9EcMY1o3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KBKF1KHZ1e0YJkE8jxZdgIiqFxEHX+1sPNqbvUosZPc=;
 b=cxQrQ+GJLWGqmLMgKttJ8PQnO36w20TgvIfUWq35SFsAYVFBWbwVFtCoz/nFj2XSkSsRxvULCLsxln61L1ILuD1ljrkXeN7XIlgVxevarPpHCe8C86o4u7j2Qek9QriRtzNt2AA1hn4gq/Or13xpf0SatHY83Mss+bCA0J46lrjpBtjSOgqYhiKWtZdvfFVKBUGQkSPaw11v5WIXra8BT9kpPjlzaAMoBMYW+fIE61vtGI8Q6k+fDXl4LDtCRhRoyb8k2rqhzICukPtfCofKuX5t5qjHvoJJy3ksDKFTBxrKA7n3R7JXbOQ7QB3wiktD34kmsE2tCDzlZRHgQ2QIXA==
Received: from SEZPR06MB6959.apcprd06.prod.outlook.com (2603:1096:101:1ed::14)
 by TYUPR06MB6219.apcprd06.prod.outlook.com (2603:1096:400:352::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.8; Fri, 7 Feb
 2025 18:07:25 +0000
Received: from SEZPR06MB6959.apcprd06.prod.outlook.com
 ([fe80::67f0:b5df:46f2:9f97]) by SEZPR06MB6959.apcprd06.prod.outlook.com
 ([fe80::67f0:b5df:46f2:9f97%5]) with mapi id 15.20.8445.005; Fri, 7 Feb 2025
 18:07:24 +0000
Message-ID:
 <SEZPR06MB695944BAA97636F61A25AC1796F12@SEZPR06MB6959.apcprd06.prod.outlook.com>
Date: Sat, 8 Feb 2025 02:07:20 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v2 0/3] arm64: dts: qcom:
 msm8916-xiaoxun-jz0145-v33: Add initial device tree
To: Ricky Cheung <rcheung844@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
References: <20250114-xiaoxun-jz0145-v33-v2-0-495e986579ce@gmail.com>
Content-Language: en-US
From: Yang Xiwen <forbidden405@outlook.com>
In-Reply-To: <20250114-xiaoxun-jz0145-v33-v2-0-495e986579ce@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: TYAPR01CA0181.jpnprd01.prod.outlook.com
 (2603:1096:404:ba::25) To SEZPR06MB6959.apcprd06.prod.outlook.com
 (2603:1096:101:1ed::14)
X-Microsoft-Original-Message-ID:
 <d094de3d-f636-4c0e-9855-98582b99ddec@outlook.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB6959:EE_|TYUPR06MB6219:EE_
X-MS-Office365-Filtering-Correlation-Id: b98251c5-3ae7-4408-a793-08dd47a24571
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|19110799003|5072599009|6090799003|8060799006|15080799006|461199028|10035399004|3412199025|440099028|4302099013|1602099012;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RWlkSGMwcnpNYU9PcDgyWnd3QXFGSXh2cnpzL2oxQkRaRGtSZ3VJSEFKMFRo?=
 =?utf-8?B?K1dGaUFQbTBSSHNza2ozbHZUbE0zam9TS1N1RjBoN01RRGRUNWtDVmFiOHNQ?=
 =?utf-8?B?VTB0Vkx3YjE0cHY1TGhuQkVQWXNrdE0rNHZaNlNPbnY1aDJ4SXdKTDVyYi9C?=
 =?utf-8?B?amxYRXo5Y1VrbTVhNzBUWVBVUktCYzNJbUVCVnhLTkZKUkdNT3YxTzZ1WWlO?=
 =?utf-8?B?ZThjS1FDLzBXZHpWc01sbUpWb0RuQnBBcUcxZXhmVXJNL3hHOXBCQ0V5K1Vy?=
 =?utf-8?B?dy9xMnc1VnlBbzhxUGpNZjdLZHNtVEZPRnYzcUFxVkJXMGtzb281SmtPVXJu?=
 =?utf-8?B?UVY1cWxHS1ZUMzNEclFmand6bC9rSHlVVWUvMXIzV3V4RkpWbzQ3Y0l2ZzB0?=
 =?utf-8?B?Zlg1bnBBY1RFVVEzRWllcmViOVJBbWxqVzYyYzh1WHBXUk84Z3hSOVcvL2xz?=
 =?utf-8?B?bzNCTDA1NGxTQS9xcFN6Nk80d1k3Q2x6b2hxRk1VZFhyN0VTS1NUamgyN2hW?=
 =?utf-8?B?VndnSFh0OHNHcmpCQUswWUxCYWFoMmFTaWF3S0hYZy9LSEJYQ3RIZnFQZDlJ?=
 =?utf-8?B?eVArR2xZYUtPTEJkSkhHT3NHODRBaVM0azhpUE04YjhTeS9sclFUWlR5OGRM?=
 =?utf-8?B?Q2VIRWNDdGxZcXNmclc0ck0zRG9BT3FtaExxMC91MktVZ0V2Y1R0bUhtWG9r?=
 =?utf-8?B?ZkhKRDdic0Jrd28vL2w2dllHdU9Bd1BDNllsNHRYVGJhdDl4eHZjcDhWOWtx?=
 =?utf-8?B?UlF0Y3pEbWc5L1dTVHdNcSt1OTRCRFpzbVh3UWNqcnVoNFNEL0hYQVNrbXd2?=
 =?utf-8?B?bHRoWnFwanVYcFcxbi9IclljbWxrTzdWM2VLcGtWaDY5bFZtaE1OUzIrVWFn?=
 =?utf-8?B?dmxEQ2x6bEtVc05VS3F0SUxsK0xlVGwwV3RJMUViTVpBWTJuZ2kxeCtBUll3?=
 =?utf-8?B?QVM5V0NlWHF1WDVwZkxqM1daeHFuVlgyNmhSdVVMODdBcVN5RnpPazBMOURq?=
 =?utf-8?B?S2lSbUtNRjJlRUE4OHlvYzc2cmRhb3FMNGlIMHl0LzBkc1ZLNnZRTmlqc0RI?=
 =?utf-8?B?R3lneEJSaXNrQzA3U3ZYN2FsNjVyanlzRS9USHE3UlJnVW41UHdJWnEySE1n?=
 =?utf-8?B?V2owVlFDT01iWHV2SFRVbitKM1NDeUdQRDc4WUxwbm53TE4rZWFWM2VlWncr?=
 =?utf-8?B?c1NVZFdIMEpranJzYVczVW9ETzg3bjBMSGk2RVhGMUxwdTJoSDhZck12czNx?=
 =?utf-8?B?OTlTWi9xNy9sSUhMNUxtS29wWDNMQk00TVRmMlkybExoSk1SSno3QXdrK0c4?=
 =?utf-8?B?SEhtanRYVGZQZURZdml4NEw0SGgrR1ZyRE9tWWNVRGgxQkI1ak94Z3NHZStZ?=
 =?utf-8?B?L01TdVZON0FoZGRXVkoyeWRLdTJiYkRUOVNnd09GaVE4KzR2ejdNTEhHWjBt?=
 =?utf-8?B?dnkvLzk3dWRNbmdTWFo1djZDNXlxODU4WlZKOW9hUHY1dk9DNXNQbHZoRnBt?=
 =?utf-8?B?WGNBVnQ4MXA4WVFka09sVXNoNVdRaGU4SXVpQUp0eEVOTEFLc2ZJNjZwWE55?=
 =?utf-8?B?MXJjRWQ1QTN3eEVZK1h1eldoQm5lOWE5a1JGSENHK24zOHByd0hvNTFSbUxD?=
 =?utf-8?B?VVZoL3lxZ1FadFVsQkEyb0lxWWNRRFJET1NaLzFIQStxNWU1bXNlUEdsOXdz?=
 =?utf-8?Q?nCwKeJamLJ3cIPQ6PxB1?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UlI0RHFjNE56REI1elJ3RkVTa1NJM0pzdE9RczQ1T016bDRMdXBtUXNCekdZ?=
 =?utf-8?B?blVEdlhFVFJPU1ZSWit6SjR3ZnVySlV2eHJLZ3ZSNUt3T0dDWm8ySytjSDVM?=
 =?utf-8?B?Q0EzN2VRcCtrb3RvQUxyUGpjdkFYcGJFRnhnOXl6NnV0N1hDd2hsZ0RrQmM2?=
 =?utf-8?B?czdMbnFoekVMYy91RDc3bk10d0FFTFNjSjRDZWVIcy90L1I4am90dlZhL2Zo?=
 =?utf-8?B?UFZLUVI1WXd6UzBGNmhvYzBWcnVaTXdKMFFqQVFkYnZsTVFabTNmV29oN2xR?=
 =?utf-8?B?M0xOQ2FHeDZuQjNxenFMeUIzZFFwa1RZbW13c3hsK2s2Q2tabVM4bzU2azVL?=
 =?utf-8?B?Z1RMVTkySGppMjRNekdLMW9YQkZlMVZGSHdpdmJva0E0YkYrakZiQUMrczRK?=
 =?utf-8?B?K1d3TW9Yb1R6MVliOUtzWllTUFMxS2NhLzNKUEFmQmZ0T2hIaGFuVlU4aUFR?=
 =?utf-8?B?TE40cmp3Mm1LRTdEakJiLzZEZk1rUG5wUnNtcUJIbmthYmlSeEo4ZHZ3bjBt?=
 =?utf-8?B?Q2RNNzdRYXYyOVZ6bWk2WWlManp2ZWdCeGNHYWRpQ3ZQOGRJQSszc0RiV1dE?=
 =?utf-8?B?YXFnYzRBWkZLVEFwR1BWMVgvR284SkVPWVpKVnZxRUlyVVhRd2grUjFsblBq?=
 =?utf-8?B?bFZSTjRyNGZnRTdiNStxZDdmU01GZG1FTkorMlY4SFlCcTBGNTlHZGI2QkJQ?=
 =?utf-8?B?Q25wTTcvUkVyRkhIYVJpcG1iN2F6ajBuVzN3VGN5SW5BbzNiZ0dOSHhrU3hR?=
 =?utf-8?B?VEdTeUlsU0R1dFAxbHlwSXlhUzE0OXhtTFhXNlM2Z2hJSEs3bU9KT3ljWFl4?=
 =?utf-8?B?MG5pWGUwZ01EMFFhVmpFc2hxQXlFcHJNa3lnTlozQ1lDWVRhdnZvemlFT1dm?=
 =?utf-8?B?S3hOaXYwSXcwMzhUQ1B3MktEejhPZG13T0NUNk1pblR5SC8zRmZMSzMzTzdY?=
 =?utf-8?B?cjFaNjJEbXRKMWFmSENERFZJVWpuZkRiZVhKRGdEdU1rN0ZwSDVzS3JaS0V1?=
 =?utf-8?B?bUNVd0tZdytMdzk2OUVBSVJaSUh0LzllMzNNdEQ2aStpR0VHVjMrUkJvaEhL?=
 =?utf-8?B?ZzRGYTNhMnJLSGpncWZlRXJZRGhZOEFEYytmUW1EZGdzeXp3TnNhMlI0VThB?=
 =?utf-8?B?ajY0UlhmUkxqV05admRzN29TWnREZG1pVVpLUXM0RHk0K1pOZ1lhcmV4alk2?=
 =?utf-8?B?VGYvK3NlV2hpRWNQZmNDbDg1THRvUFF2cjkxT01CejNHc2hiY1plS2pGdU5R?=
 =?utf-8?B?eGQ4dVVWRGlKK0dOZHlrNy9aU3FnT1g3bGZVL3NsRlVPWXpjNncyMWxFYnJi?=
 =?utf-8?B?U1d2NW1Oc1NGdFlwUjFndm1jRVY3Z3NBb1huTWZHK1d3SE1HRkJINjR4WmxL?=
 =?utf-8?B?SU8yV0hSNWg4NjBsK0gzWkZjaDNxRldkVnd1RksvQXQ3TGp0RU5EbEVSVnB6?=
 =?utf-8?B?QWYvOUxUMzd6Nk5BSmF1T2VYamJSR2JFeGloUDZaZCtxU05zR1FiVU5yVHNp?=
 =?utf-8?B?OWVPOE5oM0JBcTI5azdIQ05WWG1IN1VoRkUrY24vNUsrQ0FyM3dkZEt3bFVG?=
 =?utf-8?B?UnJCMndyRHIrcFljSkFzdGZsVmNHUTZpVUdCQjBpMm1uRDhHVzY3ck1GOGtp?=
 =?utf-8?B?Z0RHQ2hZUWJ4Uy93UW0vbkFBNnVERUpUZkpueG4vTWduVFhMVk5NYXYwc2ZO?=
 =?utf-8?Q?DlNnSC0maaBKH+1hXX/h?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b98251c5-3ae7-4408-a793-08dd47a24571
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB6959.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2025 18:07:24.0774
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYUPR06MB6219

On 1/14/2025 10:46 PM, Ricky Cheung wrote:
> Good evening.
> 
> This patch adds support for the XiaoXun JZ0145 v33 4G LTE WiFi modem
> based on the MSM8916 chipset by a new manufacturer / vendor for the
> Linux Kernel called called XiaoXun BiCheng Technology. Below is some
> information about these changes.

I'm glad to see another msm8916-ufi.dtsi user in mainline. But this 
patchset still contains some errors and needs to be fixed before getting 
applied.

> 
> Addition of a new vendor prefix
> ----------
> 
> XiaoXun BiCheng Technology is not well known in that they don't seem
> to have a presence in the Western world. I purchased my own modem
> on TaoBao, which requires stores to registered as businesses, so
> I believe it is justified to add it as a vendor prefix. Note that the
> company appears to have shut down just this month.

Be sure to know the real manufacturer rather than a random store. For 
example, we know most Xiaomi phones are actually manufactured and 
designed by Wingtech(闻泰) rather Xiaomi, so the dts for them are 
wingtech-msm8916-xxxx etc.. The same logic applies to the UFI dongles 
too. Try to get the box of your dongle and see if you can find the real 
vendor design the board rather than the company who just sells them.

> 
> Status of patch
> ----------
> 
> This device shares many similarities to pre-existing devices within
> arch/arm64/boot/dts/msm8916-ufi.dtsi, so I am sure most features would
> function with the correct firmware on this device.
> 
> However, due to the poor quality of these devices, my unit's EMMC has
> failed and I cannot conduct further tests. Previous, the modem was
> able to boot with devicetree of a UZ801, albeit with LED and Modem
> issues, which is addressed in this patch.
> 
> I have sent the code for testing to some kind folks on the Internet with
> good outcomes, so do consider this code as ready and functional.
> 
> This patch was also reviewed over at the msm8916-mainline organization
> and deemed ready by the maintainer:
> 
> 	https://github.com/msm8916-mainline/linux/pull/386
> 
> Note that this is my first patch to the LKML, so if there's something I
> did wrong / the patch is missing, please point it out.
> 
> Best Regards,
> Ricky Cheung
> Tipz Team
> 
> Signed-off-by: Ricky Cheung <rcheung844@gmail.com>
> ---
> Changes in v2:
> - EDITME: describe what is new in this series revision.
> - EDITME: use bulletpoints and terse descriptions.
> - Link to v1: https://lore.kernel.org/r/20250114-xiaoxun-jz0145-v33-v1-0-dc51f7ce3bd8@gmail.com
> 
> ---
> Ricky Cheung (3):
>        dt-bindings: vendor-prefixes: Add XiaoXun BiCheng Technology
>        dt-bindings: arm: qcom: Add XiaoXun JZ0145 v33
>        arm64: dts: qcom: msm8916-xiaoxun-jz0145-v33: Add initial device tree
> 
>   Documentation/devicetree/bindings/arm/qcom.yaml    |  1 +
>   .../devicetree/bindings/vendor-prefixes.yaml       |  2 +
>   arch/arm64/boot/dts/qcom/Makefile                  |  1 +
>   .../boot/dts/qcom/msm8916-xiaoxun-jz0145-v33.dts   | 66 ++++++++++++++++++++++
>   4 files changed, 70 insertions(+)
> ---
> base-commit: d390303b28dabbb91b2d32016a4f72da478733b9
> change-id: 20250114-xiaoxun-jz0145-v33-23dc006cf130
> 
> Best regards,

-- 
Regards,
Yang Xiwen


