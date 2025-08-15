Return-Path: <linux-arm-msm+bounces-69312-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 87165B27926
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Aug 2025 08:27:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B465AAA3900
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Aug 2025 06:24:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9AFDC287268;
	Fri, 15 Aug 2025 06:24:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com header.b="R5gE+b+q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazolkn19013082.outbound.protection.outlook.com [52.103.35.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A651A1EE03B;
	Fri, 15 Aug 2025 06:24:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.35.82
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755239067; cv=fail; b=REymrkZf4t8b+3NEmzdVEL4FnDwuI8rUpiUHxA2T/wPUa3772wMU0kOHmhbVDjxcWaw/cb3ih7YJ8OmWjsCxyueT0kmK7BdGiFRfTqMvNUIsoxdG9PXPdFWuKDDJpRNLdmaGrDLPAa9STkO7/b3GDTdUmXGaGkqd1IIvH9dmrb8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755239067; c=relaxed/simple;
	bh=KWAHbxVGZzvaH6AvMkY9jxe+moqN5aVnLTY4AFGYYXU=;
	h=Message-ID:Date:To:Cc:References:Subject:From:In-Reply-To:
	 Content-Type:MIME-Version; b=bQZNEmvwvCDS+B05f6eb4fQnskjTo+Ujrxk3ofrTyVlKcU10tr4q9MO+3yVWlEs4FmC0a/K5cZxTRaW29pvMmN6/u5dFmysx5SBi7cqEA+m8NzUsXHQXJnsq4AkwTmOidDjheI2bz8fjAM3Q9f264k+QZ8medN9hAMRVuatlyc8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hotmail.com; spf=pass smtp.mailfrom=hotmail.com; dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com header.b=R5gE+b+q; arc=fail smtp.client-ip=52.103.35.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hotmail.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sTHjvc0RHdo4vyNWXB+b1838k+RyqW5Ia01ET8j70zOSMukvovdtSyHY0zzSNqdaOxCrWxM48hAYyvdBqiy3nOcI6l5/JdChsGbWOSjMQ5DwHTiklaHhS6av7Z9xyR/jt9kAHKnhztMJ0XPhHAbMD8njj2kNiUYAeUIklwgfpHEtHv/v/r14qu9TFKRqjB9WFxb0kCGol0EYG4EczA8ndLyJ/u7654PxszokEVUBDq/KvDRTYocMIzDSFokHgyZUNL1X/1BdZ+YAwKUfjsDUDPTIfF3TFo6Z9DN68wyn2nEfWzOyKsWQBA2LmbzochpqAOrIvAljYoNQxJ0uAEvoFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v3NXaY5U2VScmWaLDxqpvCZ2T6yktsy9JCQGsBGCMQw=;
 b=TFJVRBnOHK9yvajdQJPXjFmgg/imX6vSd6p7AxGBHnCRRwqUCAMM1LWQydOYWqEdcWTtxPnmVaUz7dCqZws2DUODPwNdtoHPu1RvfpYT3L0YM8mXKWU/mhuuYZedR2t7pHU1gNStADMG36KcOryDe7V+OTqq3B1cxVoG6G9PqG0rRUkhE13eETVW/uYzgt1xFAZ/4b4ntiq3SHC6lXH/X4o1nA+9RznsgsLlQRN6ouyp0rtIFpgAhG/7YePHlK7z2dMpCXl/M1AtM09E628Oyka1N+rXCR/QtwHDKXAQr8uQNQdNzsI24zObtyUuLx5lC1rrqIoxufaSXwRQeVRnAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v3NXaY5U2VScmWaLDxqpvCZ2T6yktsy9JCQGsBGCMQw=;
 b=R5gE+b+q3zPBhGpQD2NheRHp8BQIKkCXdrT3cEIfmYqfHhpJ0sbx3pDq1VwhDH6gcxUZWrRg9Os3hcgqZZjgSlmPw37F+MsyjEu3k+X14aYdNmDXLpd+sy8T2VnBil64z8durdivZJEWmUfwXVH5thN+5twdXTe57xaKchHx0G3jlbBnY6bIOFmyBy6Fp3VHTUWDoWrlI+iyBYOOC8+Nv1nQPo9FJxk2j3IsFoinCWAztuD18bqV1F+HrmEndIDgUZRmN3Gl+bPCQs//yFrV8TFpx6Ev2FO2Je/Z1JV0yW/XfzP0yPiC688PTKR7xc9RUiWbYF/3D1ZopuIw7tgegg==
Received: from AM7P189MB1009.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:175::17)
 by AS2P189MB2605.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:5e5::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.18; Fri, 15 Aug
 2025 06:24:23 +0000
Received: from AM7P189MB1009.EURP189.PROD.OUTLOOK.COM
 ([fe80::5756:694d:1641:3b13]) by AM7P189MB1009.EURP189.PROD.OUTLOOK.COM
 ([fe80::5756:694d:1641:3b13%4]) with mapi id 15.20.9009.018; Fri, 15 Aug 2025
 06:24:23 +0000
Message-ID:
 <AM7P189MB1009D309CC3B36B4A4082BA1E334A@AM7P189MB1009.EURP189.PROD.OUTLOOK.COM>
Date: Fri, 15 Aug 2025 08:24:21 +0200
User-Agent: Mozilla Thunderbird
To: stephan.gerhold@linaro.org
Cc: abel.vesa@linaro.org, alex.vinarskis@gmail.com, andersson@kernel.org,
 christopher.obbard@linaro.org, devicetree@vger.kernel.org,
 jens.glathe@oldschoolsolutions.biz, johan@kernel.org,
 konradybcio@kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, quic_rjendra@quicinc.com,
 quic_sibis@quicinc.com, srini@kernel.org, wuxilin123@gmail.com
References: <20250814-x1e80100-add-edp-hpd-v1-4-a52804db53f6@linaro.org>
Subject: Re: [PATCH 4/9] arm64: dts: qcom: x1e80100-asus-vivobook-s15: Add
 missing pinctrl for eDP HPD
Content-Language: en-US
From: Maud Spierings <maud_spierings@hotmail.com>
In-Reply-To: <20250814-x1e80100-add-edp-hpd-v1-4-a52804db53f6@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS4P190CA0005.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:20b:5de::17) To AM7P189MB1009.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:175::17)
X-Microsoft-Original-Message-ID:
 <f25fb8b4-d6a4-42a3-9d35-18139f4c34f2@hotmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7P189MB1009:EE_|AS2P189MB2605:EE_
X-MS-Office365-Filtering-Correlation-Id: 2352a417-0e74-4ddc-157e-08dddbc45f76
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|5072599009|6090799003|461199028|21061999006|19110799012|8060799015|15080799012|23021999003|3412199025|440099028|52005399003|40105399003|18061999006;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dkhzZ3A1WHFqUWxETnVjbTBtaXl1VGhkQmwxb1ZnNkQxSy9reks0WFBxT0l4?=
 =?utf-8?B?UFBoblcyL05laVVFck9CY2s5VVc2VmxQTGxzNmZlNGZPbmZsSTZVMU5TelBB?=
 =?utf-8?B?Q2xmS0NFWW9xdjQ3Ylg0UXE5VjkrTDVUcWRoMmV0THhteVgwWCt3T2QrTXhF?=
 =?utf-8?B?QWo2K3dHYjRDblFuUktRTDhDcVMvT0NTM3d0a0cvYTJsUkNIN2NyN3NwUWRl?=
 =?utf-8?B?cGFRMWJWeW45UWk5NXRYOEpkc1J2OGxIWTZxeWFJeURrNytKaGh4dGg0MStU?=
 =?utf-8?B?Kzk0em5ETG04LzR3WDFDSW9QZE1wdXR0cDloRmdJbTVVN3NRakZmQ0FRSHJ5?=
 =?utf-8?B?MzJPM1FQQW1aUHJyc0YreGVwSDFTdEhNdk9jM0JDN1lWOU1OQStvQTc5S1lJ?=
 =?utf-8?B?MlppVXMzamVrUXRmTlFtQUxRYUlxT3J2blVIemF1RFEwajRqUXhyTFNrK3pr?=
 =?utf-8?B?SGlkdDM1L2ZLMWd1SXh6bE1vZHJ6RE9mVjlSQmhYUGUvUlJyWXROQnk1cFN0?=
 =?utf-8?B?eEdPMlJxY2FlUlhVTUZFOU90cEUzdUgvVkltODJoNG5WUkRNNk93Y2FUazlY?=
 =?utf-8?B?YnkzdXlNM0lYam5ISDNmVXd5WkpOallXWlgrZnlOdmVjYi95djZSVmdhRERw?=
 =?utf-8?B?NG1yaFVWUTBCd1ZoUy9EbDZHOHlIZ3Q5aHE5ZUdpSnIzOGF5M3laQTBnN1c5?=
 =?utf-8?B?ZlFmNEpDWTh5VDduZVd1eHFwcStNUEVxWTVEZ0dqUjgxeHNTbm0yeVVwTGxk?=
 =?utf-8?B?QVc1R2hEOXZxZS9wTHN3Sk5TS2pEUXQxQkpLNTFPN3RIOHhNb0t4U1pwNmNq?=
 =?utf-8?B?Y0dSS2tJNlE3YlAyY0M2ZWZBVGZ0bkJIMm5HVzJRR3A3WDY1VmpZOW4vc0JL?=
 =?utf-8?B?QmR6TVViNllscVBIcGdUeDYyRVhQOC9DMlpBNU5CTitSZmp4S0pZNlV1K29s?=
 =?utf-8?B?R2R1NVdWVGVQU1NPeUtxNngyMEx4c3RHbkw0RlNUc0JFTERJWVA0NmVyL0lN?=
 =?utf-8?B?NnRvbzM0MjlUcWEvNG9hRzl1cGVGdVdVRmlsbFhxWWtrd3ZVbm1HemgvSXZL?=
 =?utf-8?B?OVFyd01OclpkWlB0VkduR0pRUFVQSFlOVVlWSUpQbmFnZlBJZlRDczdqbjlI?=
 =?utf-8?B?Y09aaUMyRUVGdTJOcmkvTEJQeklDVHhuNDlGZERYMWVXTXErdUVJR1g1K3pp?=
 =?utf-8?B?M2dIMDdhcEF1WHozZ2dydmlCZHNZVVl2cGRHTEk2S0NlYUpuZ0JUUWhpUnBu?=
 =?utf-8?B?dXd3QnhrUU54L0Yxdkx2V1Ywa1RyTWQvR21ObDRQdFVZNlVYemg4YWtXMlc2?=
 =?utf-8?B?SjNWRXJyR0NrSkR0OUt4UHpDQ2h0WC9wcGx5eUcxQ2xVTFIwVlhHaVNUY1BN?=
 =?utf-8?B?SE5CYUVQaXZ5dGU2d2FPcWRqdVR4OFBkSkVjdDVkY0NmK09wMDBXRUFJTTk2?=
 =?utf-8?B?RUNZcUhKSmRwZkZ1SjcycWJ2bm1IWjVkcThrQWNicmhIWTJQY2RxNytoTDhx?=
 =?utf-8?B?SXl0MGIxUzRSMTlmcVlnb3lFblQ5QVRscDAxbXlEN3VRWWY0ZHZyNUU4Qisw?=
 =?utf-8?B?MUlTakhHSXhHWkVncm42VkVhU2ZUZ05VZTJoakRGd3RLdnRuUHZlM003S2Mv?=
 =?utf-8?B?WVFNU3JDa0s1N2R3MllpWGlNNlUvWS8vbjdHa3dsNWJUM25WcW9IYmlrWFdS?=
 =?utf-8?B?Yi9TMG1wbW8xWS82VjdCRmhCbm1ZK1R2SkpEVk5OOEE0UTgvRXc5K3VRPT0=?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eFB5WDhHSmZVNEU4NFp6SDRKR2ZSU3pQVkZ4VEErRUNVSnRQV3A1dk5jc0k5?=
 =?utf-8?B?YytFY3VlWnYzb3NxSTd3SFQzT0cwWXVSNTdiS2tWWXJWQ1d4ZU9MUTBIVUdH?=
 =?utf-8?B?Q05qZ1NGSG5PQUxXbEJQVjlIM2MyS09TazkrVWZJbnBYMjdlMGRWNWZZUjg2?=
 =?utf-8?B?b3VNZXV5MU01Rk5yS1BZcStoOUFZNno5ckdSYU5ybjBnTjVNK1V2cmxGb201?=
 =?utf-8?B?WDFzV1A3VC9KVDNaZjEvbHo3UU5tbEhNVytrRkxNdlljYjNOV1poTXF5ejdD?=
 =?utf-8?B?anpaSktwZDg4S0hNVGE4azFib0Jkdm1yM0l6NjJPQVdjeVozRTc3ZU12WEM1?=
 =?utf-8?B?dEo2ZGpjV3V6ZGpxY3ppdzc1TzlBMWpuR1M4Z1ZkUVFYTGovNGNBaHM0SStG?=
 =?utf-8?B?RW9TOEtIM2gyOUVTVGVMNGpRV2pPcDNjTzd3QmZQeUNNM0cwalRRZkZEdzNw?=
 =?utf-8?B?NUtIT1VPcTlQNHN1K2Q0OFdPcWpmbXNaLzJzakd2SmtKc2oyNGRLR0p4YStp?=
 =?utf-8?B?bFlETFR5QldBcFhYM0ZhSkhHU3YxOWNucUJibldnVU9jMUlJUzJOcmtBTVBH?=
 =?utf-8?B?KzdkZ1UvMmxVVE8yRjBXSTAzZVhNWXhLZDJoNzVIcFhKK054d3Zyc2d0MjBE?=
 =?utf-8?B?RGtPbXRUSHl6b1lEbFFEYXpXWjlDRjlFSnpGQW5ucFZyN2hGUDB1YmVIU3Za?=
 =?utf-8?B?aHFDYTlWTGRrcjFTMkgyOFdzOGc4NkRBY3BDdDZUcVBZWk5nUWJGcHBvdmR1?=
 =?utf-8?B?UDFmaXZkVTJ0NFhlYUVmczFkcVd2NDV3c2U5V2lwYnN2b3ROR05YTnhIK1dL?=
 =?utf-8?B?c0VhMUs3N0xvTHdjaklxU0JCdXlkMzNPQTkzMERYeE9wWXE0L0pyQmpLSjlR?=
 =?utf-8?B?OFFxQkhQTlhRUE04TXlUTHlmelBNOE9jR1pTRWhaQmtuVlhmVTVvK1NDVzl2?=
 =?utf-8?B?WEppM0p6UUFzeVhpVndFaG5GS05kQ05MWDZiMTJtZC9EOTVsNEcya2JZL1RM?=
 =?utf-8?B?Yi9wUnhPZzdSYUQ4MWE4cDZVcGZXVzFLekpHV3F2aWdDZmtzdHYyOHV0aktX?=
 =?utf-8?B?SXlqOGtIeFdXSHVSYWEzQXYvcUw3a0dGclZTRklDQ2xEbVd5Y0RqK0ZZVUpW?=
 =?utf-8?B?Ymo2T2pJOEdyNTAzemRSMGJEajRyUUJOOXQ5YVZLR3hnVGdxcEMvTURaU09Y?=
 =?utf-8?B?OHBIY3VyQUhaL3E4OWJvYSs0bmRGTGNSZUZURkpSdDlhTGNNc0pOczV6ai94?=
 =?utf-8?B?SHBLVmlHYzVMZ09oTHNaaEdFTUsvV01tM1kwdkxpK0xtbGtEc0JCd3NIVUQx?=
 =?utf-8?B?WnNxQkxQZ25mbk5nMTBPNjVYeWVBM01zY3VuejJJRllEdEdmVlRkVEp3VFAz?=
 =?utf-8?B?STdyYktVQlE5RWhXbGZWUnZEM2pMOGJnVzl2OEZzMzZRQnByeGczemhKUnFk?=
 =?utf-8?B?b2hEMHc0SnJqNjg1ek45WkpuSXhWOEFQNXZ2M1UweEl5VUNqQnpGdUJwTTFP?=
 =?utf-8?B?aWRyQXVUd3c4V3UzKy9hRDBLeUZFb1J0bkJNcGRKUm4xMlVsMUJlYVgvZ0VD?=
 =?utf-8?B?M3kyUjV0QXoyVVY3VGhuMnVBM0pZK25UQWd1ZTFGOTlnRG5CQUdSU0tkYXNJ?=
 =?utf-8?B?NlppUGI4OFZRcnNtc1pSTUFTSmsxd0g0N01aVFV6YXM4a1dUL0lNZVQ4KzEr?=
 =?utf-8?B?TGNWTEpHeWM2UEhrTFFDQ0Nvb1AyVTFDbTZTU0ttcEVlaEZDeXVUWVRma1l6?=
 =?utf-8?Q?hs0ze8ROmIjSXwb9EMjeI+SBUzj+hRk6p3eRECC?=
X-OriginatorOrg: sct-15-20-8534-20-msonline-outlook-2ef4d.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 2352a417-0e74-4ddc-157e-08dddbc45f76
X-MS-Exchange-CrossTenant-AuthSource: AM7P189MB1009.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2025 06:24:22.9718
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2P189MB2605

> At the moment, we indirectly rely on the boot firmware to set up the
> pinctrl for the eDP HPD line coming from the internal display. If the boot
> firmware does not configure the display (e.g. because a different display
> is selected for output in the UEFI settings), then the display fails to
> come up and there are several errors in the kernel log:
> 
>  [drm:dpu_encoder_phys_vid_wait_for_commit_done:544] [dpu error]vblank timeout: 80020041
>  [drm:dpu_kms_wait_for_commit_done:524] [dpu error]wait for commit done returned -110
>  [drm:dpu_encoder_frame_done_timeout:2715] [dpu error]enc40 frame done timeout
>  ...
> 
> Fix this by adding the missing pinctrl for gpio119 (func1/edp0_hot and
> bias-disable according to the ACPI DSDT).
> 
> Fixes: d0e2f8f62dff ("arm64: dts: qcom: Add device tree for ASUS Vivobook S 15")
> Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>

Tested-by: Maud Spierings <maud_spierings@hotmail.com>

> ---
>  arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dts | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dts b/arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dts
> index 62eba17cdc87c088ca471b4cbf5b44af06400fe4..312d754df18cc71aede13f77b07846ad04d06eaa 100644
> --- a/arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dts
> +++ b/arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dts
> @@ -593,6 +593,9 @@ &mdss {
>  &mdss_dp3 {
>  	/delete-property/ #sound-dai-cells;
>  
> +	pinctrl-0 = <&edp_hpd_default>;
> +	pinctrl-names = "default";
> +
>  	status = "okay";
>  
>  	aux-bus {
> @@ -741,6 +744,12 @@ &tlmm {
>  			       <44 4>, /* SPI (TPM) */
>  			       <238 1>; /* UFS Reset */
>  
> +	edp_hpd_default: edp-hpd-default-state {
> +		pins = "gpio119";
> +		function = "edp0_hot";
> +		bias-disable;
> +	};
> +
>  	edp_reg_en: edp-reg-en-state {
>  		pins = "gpio70";
>  		function = "gpio";
> 
> -- 
> 2.50.1


