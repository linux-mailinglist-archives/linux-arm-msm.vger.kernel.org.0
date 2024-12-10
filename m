Return-Path: <linux-arm-msm+bounces-41353-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D4AB9EB9DD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Dec 2024 20:13:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4016D1888536
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Dec 2024 19:13:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2FF321420F;
	Tue, 10 Dec 2024 19:13:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com header.b="LJVfFRJn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05olkn2102.outbound.protection.outlook.com [40.92.90.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E62421420E;
	Tue, 10 Dec 2024 19:13:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.92.90.102
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733857996; cv=fail; b=BwkVALiIOYu7pgsbw4UymOe0n6ElU55axcUkOl8TD1ZNSbsyQTLs4lozs05tSQTTT0lN3+/k/xc1YW1tdMa24Km5kW3w6r1BXo0Zt8hqw4tLd+gYZ7fD33lnYJbCiq2PJ/35vqyYcVr7FEPN2KQS2l02kZabrnvVcZFKqfZaNQc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733857996; c=relaxed/simple;
	bh=1fwjhauCeKa6ZTrqL1OHm3GuCYtqyf2dSABgxXOinTg=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Owb7YzSDBRLOgSZLDhXq8JyJS2sz5C9RpUi2tlEdlmWPlCMC8KNnWhS2ZAFq1y0vBiK5MnIBzwGlS/6KpjvBspZK3ov592HR4b23IYkJKp+tQnon5Hgw9U94t2V7avrEaU61RXcezekhq1VxHzebu4Za7+sXF1EuD1TCtkAmh8Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hotmail.com; spf=pass smtp.mailfrom=hotmail.com; dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com header.b=LJVfFRJn; arc=fail smtp.client-ip=40.92.90.102
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hotmail.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ivdcmVcE0BQzjSppOfHL4O2+nzEJMdF6xOZsZ3KBPIg0dSLLp9Rf1MIiOxl0+XcOHZexQ6g+gPE8w8tn4ljVgWUCgxSYTdhEIua8Cqr7VGQ0ptOiB6+G5XjnxZHIQccv/gD5RSo4p0WVvVWmidZdjgPe1aLrtxNjPBYkwguonrTx5AeD/W1zgUSoX7LT/ZSIv7IRoZjiAKLyEg7oim9YPc3xXLLOoohwN5zl9vjY1FcRoGaL4qFTi84GZJ0lODXz/qE84HBmK0YSex3amYETz4fBgdeCwgzx4lRmz7Q8u7SaqOj8f5foyuFjbjly3xNFFt4fmnBCVQLVO83vwiGQ2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CF1KrpCjNIHcVR2LTXdt/428XEbLQGGADtFw/7lUomo=;
 b=VpWjgCWTuPf9RPwst00rxoUg38zwLHmYvtVNoiPKyFQGBA9wk0raFI9kto3GgjeW+Ik6r/asx27WmGNQWpzqSrkTXwyuCuWAd8ksEF7OgjFtnuNTlS2VajPI/WGi2UkRAYCf+TUjHxL3fyIxXRcVVWraOOjBGcTyuT4pCFrTtVKCq7reiPNderTgxMyIC3jbvY+ROVgCPvXB/gq8Yr2+4lM8bo/t7rA6hk7jRw5UiGm/LkFsArSgdEJaSJoOoMmJutsFOgbbQkRp6xywTNzQf07rSs4XWEWyv+IPRDKsguMBn8988q5rMNpQLFZZEurDOUVN4i7AQlTFwIFbgaf8Rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CF1KrpCjNIHcVR2LTXdt/428XEbLQGGADtFw/7lUomo=;
 b=LJVfFRJnlByqfDol1l+GHsIpc0HWW/mZ9ISbLea+VKW+oFq/EKcVOK68lgQzhsa0KVW4a7oTHzZ+lE/eEilyfnxeAUAf5Y3nKPRhepcij2IWxPtxZnoYx0T9XPezr3hopY0x2tlWQcCxiDKZg9VYCM2m75X5KaCYYUOoIWxnBtteIgJCTZ8xKJX6iMnAJ0K+LQp3QTM3f7JpbTk3RFzOXdqTRQxw5wtm49PwWWUh3XHDfHHdclwJ4R4VuMkLw/02PepBuuG90vwZhaRDsQcivvPRd/nX16LJBX/hG98rFMSwXpCn21+KxIs/aeQC9hqG9lss2lnCyGaKfphtAnrMaQ==
Received: from AM7P189MB1009.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:175::17)
 by PAXP189MB1975.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:281::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.17; Tue, 10 Dec
 2024 19:13:12 +0000
Received: from AM7P189MB1009.EURP189.PROD.OUTLOOK.COM
 ([fe80::e9f1:a878:e797:ee1a]) by AM7P189MB1009.EURP189.PROD.OUTLOOK.COM
 ([fe80::e9f1:a878:e797:ee1a%5]) with mapi id 15.20.8230.016; Tue, 10 Dec 2024
 19:13:12 +0000
Message-ID:
 <AM7P189MB10099F929FCE7AE7B348399DE33D2@AM7P189MB1009.EURP189.PROD.OUTLOOK.COM>
Date: Tue, 10 Dec 2024 20:13:10 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] firmware: qcom: scm: Allow QSEECOM on the asus vivobook
 s15
To: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20241116-add_asus_qcom_scm-v1-1-5aa2b0fb52bd@hotmail.com>
Content-Language: en-US
From: Maud Spierings <maud_spierings@hotmail.com>
In-Reply-To: <20241116-add_asus_qcom_scm-v1-1-5aa2b0fb52bd@hotmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM9P250CA0018.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:20b:21c::23) To AM7P189MB1009.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:175::17)
X-Microsoft-Original-Message-ID:
 <94251344-4d9f-4fa4-9bc9-2ed1d8002acc@hotmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7P189MB1009:EE_|PAXP189MB1975:EE_
X-MS-Office365-Filtering-Correlation-Id: d784ac96-bf96-40a7-b061-08dd194eb059
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|461199028|6090799003|5072599009|8060799006|19110799003|15080799006|10035399004|440099028|3412199025|4302099013|1602099012;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RTY4Y1Fod2tCRzNVYmlDRW5TZm9HYzhEbytOR3Zibm1lQ3l0Qk10M0xacUJ5?=
 =?utf-8?B?bEVweWVYRWl1dVpaZ0dHUU1PWUZQNEd4dTdOM2ZkSDRwanRYRkVKakNmZ1o5?=
 =?utf-8?B?bjd1YTJEcmhmM1pxaEFpY3BLWjdDSW5KckE2dUV6TzJpMytkY0ZKM2EzQXN3?=
 =?utf-8?B?Y0h1VVgxY0lYVHprYk9qbG8xOXJSSHZHbk1YUEN2TUZPSE5IekR4Yzk0SjZN?=
 =?utf-8?B?eGh3dUlIbDE4cElJWlp5SEFGbTdRS1VpeUlIRXViR3JPUlIwNWRWbmhkZ3ZL?=
 =?utf-8?B?RmNxN3cvRUZlZXlMV0pSRkJSUXRmbWFsU0g2aE1kRFdIbUZrUXFyOCtTcjgy?=
 =?utf-8?B?ajRIb2RUUS9QeUpVaEdmMlgwVVc0TGZuaG5URTVkeVQybWFMRVJNSFJicGhJ?=
 =?utf-8?B?TFJVaW1FdXh5Tlp0djN4OXptZkpvcUdNQndJOTZnQjViSWQydmZOOEJKc1dw?=
 =?utf-8?B?ZE9VWHZ5NlhhaVlLS2dCNFQrbVlXRFMzbDcyd2E5TnZ2TDBNcFU5NU1GenR2?=
 =?utf-8?B?Rk5USTZnZzZEZVpwM21KWXlKdnNKR1dsQTk3SVgrbUhUYlBMYms5d2pTS2Ru?=
 =?utf-8?B?ZmlGNDR0TlV0bFY4YlVhYlVFMDJPKzM1czBvMEFhVmFoZ24vbURaUXhYL09O?=
 =?utf-8?B?RHRCOWtzZFNHTXJtaGdtMkxwdXNoMXZQYXFqUmROcnc2bncyeG5nQnoxc2Vm?=
 =?utf-8?B?SGU3VXpIWGhzY2EycitaOFJxNlIwbXQxSW5qUjZYd2V3MnVER3dGbm4yYXhP?=
 =?utf-8?B?WjMvN0hjcVd5UWxLR0J2d1lkRk8zMk9TZ0YrcDQrUkMyWWJiSXV5RmFiUmsr?=
 =?utf-8?B?ZWZnZWJtVnlkdHRZS21kVDRBRjlIQUI3aVJ0THlRVjRQTmxEazB5U0JOVCt6?=
 =?utf-8?B?WnhjOGZsdjhwb0xHZGQ3Mi9pRldWL2tCNW52Vis0OFFuejB1YXBjK0h0aDJu?=
 =?utf-8?B?ZjlwbUNWdjhoaUltdTdHSXNBdUFYeS9CSHpxTkZLS0txM2pkekJnek9wa1FV?=
 =?utf-8?B?VzlFNHU4cGZQc1FaNEtETHV4UStNUThSZ1BqRGk1YXoyakNrTUo3N1VmZFBw?=
 =?utf-8?B?QkM3dG9FY0xMRWhCaWp3SGVYbjBWMmdSeGNHSFNuNVZ4cWY3OFIwVmR3a3JG?=
 =?utf-8?B?aVlkZzdoZm5GRmlsT0paM3FvcjZueWd1ZWhnMlF1SU1xMG4wbEV3VFpOOFdz?=
 =?utf-8?B?WkNYcUZTZzYycWNxQXo4ZnJVS2FXY1hhWkhwWTg2d0VHNHB0bjhUMnVxbHNV?=
 =?utf-8?B?S3FIVzlrbFFOS1Btbk9HSmFhUHZqTmc4RlpMVkxTNGx3aERtRzBRczBrZlJQ?=
 =?utf-8?B?WXhVcUNDdHhTRVk3WjFjSXJuVG1DaVVPaGhwRHBlenE5U0lYSjRkdVZ0N1Z0?=
 =?utf-8?B?K0RuTkphandldXRiYWtoYnVNazNaMlNFWkp4eDV4b3UzTVlmcVZVNEVjYVpk?=
 =?utf-8?B?SmJEanpvaGs1bldRMWFpTHhLSDhWWXRKNEtwNEVlelp3N2padW15aU4yNEh4?=
 =?utf-8?B?a0ZQMXVncXJCVEk0R0dtU0pJd3RveFR2aGdlUGFVMlJyd3VoWGxIRFBCQXhK?=
 =?utf-8?B?cWpDTzJOM1lyQ3Q3Uitwa0F4blZUV3JFcklKVDN4NjBNTEFZL1hsZ1UrR2Jm?=
 =?utf-8?B?ek5nUWs2S3o3bFBvcGtrdGFnVThMOEE9PQ==?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T3BaaFZPMjFmUXFtRG5Hc3dGdWNaRHpQMUx3THBhSVdnQXlMTEtncUVzMlNJ?=
 =?utf-8?B?SUMrTUtoT1FQZHVHMDljaUFpL1BWR2wyUm1KZXBhRFloVVhTekNCUm9JS0Np?=
 =?utf-8?B?eTZQaFBxa2xVZ0dVSVE5V3ZscDlhTEUvd0piZlBxL083S2JNalFuMVQzRndr?=
 =?utf-8?B?NWRFUEpSV1Yva080aEpjdnQ4V3EwWDBqQUhXTkRnc0FLUWdFbjN2NFpYQkp3?=
 =?utf-8?B?ZW5nTmp1V3Vld0o5YUQ4YVZObEE5MzFPZ1k2eFl2TlRZSy9ZeXhzSVd1RTV2?=
 =?utf-8?B?RVo2Y0pjRnJVTXk4QzlxMTNQeFV1bERrK2RGU3FnSlVackp5dnFydG10Q0h3?=
 =?utf-8?B?UEV0Y2l5QmNBOUZFNGxjWDBsK0RYRWZERkh6cW1XNjRjbFpQTmJ2YWtXU3lT?=
 =?utf-8?B?UjZNeHFDQkY5Z3VJdkk0MWsyZno3UGp0UUg1eEpaMXRqaDhJZU5xcXhtaHZM?=
 =?utf-8?B?aktuLzdCYm9YQzVHaGttTjJsaGRFbXpPUHNna041SDFWb1AyNEVTSFhzcXQ1?=
 =?utf-8?B?cS9TeWRTdmhydWJRWHNXbzNaSVJnMVVyTFc5UzBsWnFwWEx5U29jeWd2MGlJ?=
 =?utf-8?B?UTYxMlRIZ2Y1eGFzVzNjeGUrc04vZHlhdkVvMmxkc2NSbTM2SmRRcEJHTy9x?=
 =?utf-8?B?UmR4bmpOc3AySXZpdkNNaStFWEp3RHlmVHk0bE9aSmlZLzdRNHdnVXYrUjYx?=
 =?utf-8?B?OHR3a25OM0NDTHBMRCsxYWRnZi83OS9vcmpaN2gxVVZsM3BlblZIMFA3Qm5x?=
 =?utf-8?B?eWQvSU9QTUxOYXRvMEpGTUd4SDFqVDNCRzJ0Vi9MMStJdm82d3BBMFpwVlBs?=
 =?utf-8?B?dHpHRlZaeGdJcUZ6TUxCSCsrbHZJYjdkSmw2T2w5dTU3MStxcGp3bTlzZ2JY?=
 =?utf-8?B?NjlxZHMrdGRuYXFUbkNaenE3dGJSNitlMzNCZFdQSjRSVExGaGZVdHg5ZVAx?=
 =?utf-8?B?RW5tSlhNLzY3UktsNmpBbzBzWWFTZk9BdHk3eDJOMi9acldOaXJHMERoQUxQ?=
 =?utf-8?B?aTI2RVc3ajVaVTFMNEVmYmtkbG1WbTVYTHlmeXNKYW90eVZjOUVoRGdZc25h?=
 =?utf-8?B?cUxnY2hSNXhOZDJaVU5HL1lZd3hpYzdRQXlIWkxqQkVtdVJMaGRMSWpOcFFV?=
 =?utf-8?B?UWZEUk1Ka1JyS01WQ1pGMFArSExZbEgwOWVzNUttSkREci9OUDVYTGdPR05L?=
 =?utf-8?B?aTZJclNCeEJ5UTlIb0ZLdUhJTTNoWEFVZFhmRFdiaVNTZWZ1ZGs0M0NFc2ZE?=
 =?utf-8?B?cEpveW1zSm0yVHB6Y0ErbEhMY0I1bFVQVUMxYjdiRWpVQ0ZoblRBdzY3ejhJ?=
 =?utf-8?B?TEtJZ0dMYkpuNXdjS1lsMWpkdzJOaTNxQjRCeUFqZUc1U1VwTnM3cFlPYXZi?=
 =?utf-8?B?RE54d1FjTGYwbEZWSTNnZGtXME5STmMxZi92aXRubjlHaHkrV2RGZnB2eEtk?=
 =?utf-8?B?QXR0d29GdEZVTlhvSlBQM3JRc056SVhPRlVJSE1jTUViZTRCa1VFRkNSZjRj?=
 =?utf-8?B?clVnbU0wekFsbWJOZHYwcUU3RG1nSjlueHBMcDZ1K3ZWaWJYelVVR2xYTm1w?=
 =?utf-8?B?c1FUNk1ZaDNubWs2ZHdpYXNrdlhtMk8vZ3lManNON3E3dk9COFVjZHdZMUtx?=
 =?utf-8?B?N1o4dEpNdHVRblRRS1l3cEUzdG10YWlzWFB2dTk4RDFVWTFESkhmOUg4Y0xl?=
 =?utf-8?B?d0NNQ3MvWFgwTHRkbEJzWmpRYUwwR0VtVERnanBZZTBwZ21kdklVS2NiT3lE?=
 =?utf-8?Q?L/1WSIgNkoVesKu7ssU+XY5csqQS4Yy30kT+QUj?=
X-OriginatorOrg: sct-15-20-7719-19-msonline-outlook-3b3e0.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: d784ac96-bf96-40a7-b061-08dd194eb059
X-MS-Exchange-CrossTenant-AuthSource: AM7P189MB1009.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2024 19:13:12.4127
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXP189MB1975

I fear this may have slipped through the cracks as it has not yet gotten 
a response.

or does it have to do with [1]?

[1]: 
https://lore.kernel.org/all/20241103-rework-qseecom-v1-0-1d75d4eedc1e@linaro.org/

kind regards,
Maud



