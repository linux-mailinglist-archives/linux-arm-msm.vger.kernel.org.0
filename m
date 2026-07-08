Return-Path: <linux-arm-msm+bounces-117463-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id aaTdLNfCTWqr9wEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117463-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 05:24:07 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 498547215D4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 05:24:07 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=outlook.com header.s=selector1 header.b=DgB4NuTY;
	dmarc=pass (policy=none) header.from=outlook.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117463-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117463-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B8A16301ABAC
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jul 2026 03:24:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB02636DA00;
	Wed,  8 Jul 2026 03:24:03 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azolkn19010024.outbound.protection.outlook.com [52.103.23.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 337082147F9;
	Wed,  8 Jul 2026 03:24:01 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783481043; cv=fail; b=mLvE/EruZS1ZEX+d3VEDL1fbqxf1VsMLZoqBvsusYimAAOybb4aBtXImyistuUWpZGPKx/uyG7586SEsEh03HpblnOwMqItZ7E5w1IcSzf0TCLhCTZt+Sqin4vjDiYAUa0BEPRqxIZdzkeHnCK6QEMDuo9zrcJel0amFlouoi+w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783481043; c=relaxed/simple;
	bh=CpNYBKCBQK687099pwj3bQWJNjwxw7GofYRvulnFMXA=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=UND0stOJzEWShb0UY8Hc0wvXDYxBASjvjS0bYsqyOChB4fw1FxpFOVDHC0Z1jBidDcWwbWi+7bEoOavkMagw+vR/1/Rg8eOs7W+9E1BASxTH9ZcPb0nJ+fohF9WQNKT2HVYZ4g0tqi0x1joIhD2tdr2LNTtWMjByPgpB+siCLws=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=DgB4NuTY; arc=fail smtp.client-ip=52.103.23.24
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L1LKSLh8tQQVLnXE0O3LIsnVxYFEHIorE48dCBPu+wjVc+dt9P/3eMIIFA/grs1THF52f2xzbGx6sqHFlk/ayBURSOhCJJRJjH1TWCEXFe+MEyvHYtIaZd2m7AooKlwa8ftJ8JIS/NRU+v4FnrBebToQfA+OBQOPuByenpMA4Ytpaokq+MYjOcIGBrXAxoQ4nvTuNT16JsRpIwkJ2a83T53bfDezyJ5XiHRu5G97fRzMbYDXFobyRHUBm2MxB29Q9ZOkjNfwNyK3iT8POEQAf2fnMR3t5iYOGlbgkEje9OF9mNbhsXK1ifO6mA9C5yqF7mB9qhwV8m0KA2sgEDB8qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0VeN0OnQR2C87CmZkRCN9bd+kyetAzDlRyCjM4cQjNg=;
 b=QBNBprND22bLLojeuDs7GNYcpHzH5vvbjj5YSrMWYXIWVZUUBNBW20etIrmX2tjQqA+VwaxYxfP9nr2SZyJgHDU8TNdJkV+6ZgtS6+l5+YZV7MvCl0KlMoYI/8b0zy5udo4qEI1BNLb3YrpOazE/GClSl5HqUvm+mctY0Brr8d52OdGgqOyw9Era7F2Kk4OQZiCybgSYvPhgBama5IY72KSrS9u3ZBTHUCOI6fLurud9m481XtZFL9fy7SS/GZobNcr8yJc0FInQLHs47S0jXM9RRf5N25S7GfhL3qn16+z9zm7hmYFdUQ/6vE6aTMDulNuK8ef/0fSOpzrF4NdeMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0VeN0OnQR2C87CmZkRCN9bd+kyetAzDlRyCjM4cQjNg=;
 b=DgB4NuTYP7bzIrISRwQmSGkNkVCnGrfC6C/F/PqNSIhpXTDFrL5L0MYfRYsseUkWUBc+EnRgL0/Qtg2egL3WmM2jZt8X1Lm6cLZQ9ai3tAgZYr/coPzO0NXdrl0kXCJtqZHUkLD4qONIC3k2/Wow8aMH21CuXy3cwuhw6uMPrZoRCSVQUFAdyIMLnUsTxNAW4TOLGtZGDcqkmuhymEsL+cqFtAjHl1nCRcpdbXHPakUZPc4TyXW5BccP69vCFlDLPWVWHSnJeAx8l7Q8oXcatZuFF2Q0vndc5gR2Rq5+U2mjYXcrbFW5UvRzxt2WRVLoMzPegm7K1z19AB4Uo6PdjA==
Received: from SN7PR19MB6736.namprd19.prod.outlook.com (2603:10b6:806:263::12)
 by IA0PPFD8D997F51.namprd19.prod.outlook.com (2603:10b6:20f:fc04::cd2) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.13; Wed, 8 Jul
 2026 03:23:58 +0000
Received: from SN7PR19MB6736.namprd19.prod.outlook.com
 ([fe80::4b6c:b84f:b71c:d0a]) by SN7PR19MB6736.namprd19.prod.outlook.com
 ([fe80::4b6c:b84f:b71c:d0a%3]) with mapi id 15.21.0181.009; Wed, 8 Jul 2026
 03:23:58 +0000
Message-ID:
 <SN7PR19MB67368589F80FCD452BB3BFB89DFF2@SN7PR19MB6736.namprd19.prod.outlook.com>
Date: Wed, 8 Jul 2026 07:23:49 +0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/6] arm64: dts: qcom: ipq5018: add nodes required for
 Bluetooth support
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Bartosz Golaszewski <brgl@kernel.org>, Marcel Holtmann
 <marcel@holtmann.org>, Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
References: <20260706-ipq5018-bluetooth-v4-0-350262a30959@outlook.com>
 <20260706-ipq5018-bluetooth-v4-5-350262a30959@outlook.com>
 <6d8c0326-1b3e-4eae-b528-22ca77dbaf6d@oss.qualcomm.com>
 <6a312986-49b7-483b-8253-5bb3b842ac34@oss.qualcomm.com>
 <SN7PR19MB6736F66FB96D6A43C128AD719DF02@SN7PR19MB6736.namprd19.prod.outlook.com>
 <edb2a1ad-4213-420e-b494-af71da00a213@oss.qualcomm.com>
Content-Language: en-US
From: George Moussalem <george.moussalem@outlook.com>
In-Reply-To: <edb2a1ad-4213-420e-b494-af71da00a213@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DX0P273CA0015.AREP273.PROD.OUTLOOK.COM
 (2603:1086:300:26::20) To SN7PR19MB6736.namprd19.prod.outlook.com
 (2603:10b6:806:263::12)
X-Microsoft-Original-Message-ID:
 <6841360a-b860-4caa-8a2a-f2bad6a17358@outlook.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR19MB6736:EE_|IA0PPFD8D997F51:EE_
X-MS-Office365-Filtering-Correlation-Id: 0167e368-f07d-48d7-bb4b-08dedca05909
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|5072599009|24021099003|37011999003|51005399006|25010399006|23021999003|15080799012|6090799003|19110799012|41001999006|8060799015|440099028|3412199025|40105399003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bDMzOGtsY1V6TXVPendyMWREemg3K0tQQmhFNGF5SUF1RUdzaVZFMU16blhp?=
 =?utf-8?B?NzJRdDJPa1IvcCtId3AvM0xOQk5jKzNTclA1MXNFbjlBRHFvdlQxU05ndWZU?=
 =?utf-8?B?UGJYazdWejhFRmJVeDhZK1hKSmQzaFg0VUxGR0NUdzkzWUhwTG1qQmNmUVpL?=
 =?utf-8?B?NmpjMHpnUisxb0xkTEEzRjcwRTN0ekQwc0J1akV0QW5xNmNnSVF3Y3ZXZHNv?=
 =?utf-8?B?cFoxNGgrUU8rZStBRkJSYndKQjZtL21vSFdLUzlpandlM2RBU0RpV0lubnVi?=
 =?utf-8?B?eHVGZmJjTUVQSzJhUy9XaUtIeGVjSzA5cG82cVZEYlhJSHlENE8vLzlGV3Ja?=
 =?utf-8?B?L0RPSzZDWTlGZnJMblYweFBzVkIwN1NDRjZ5cjU3Vm5Qei9SL0Z0OVdMZGlI?=
 =?utf-8?B?MlowbmZ1QWhXQzRaWXhCRXd6R29wOTBiRkpYeG9sbU90VkVWK29kc3JhdnBu?=
 =?utf-8?B?dzY3QnNGc1dSbjNWSy9pMnluUUd6WDArRDNJc1F4U21hdjVrNXVoSTFqdVpZ?=
 =?utf-8?B?V3lIMEhsYTJia05vc1RzT1gvbWxIVzc4RmZhUGFxYmxDKzZXWUFNTlh1RW1Y?=
 =?utf-8?B?VjNmY3lyclZSdmdPS2JPWDN5TU12VFZreTNwY0xpeEU1VjJXNEplVmFSajFl?=
 =?utf-8?B?ekNoYWNIaFZoUEZ5TjNUZXVXdkNRdTd1eFBxaEVxdlBaNEQrdkNmMm4vT21U?=
 =?utf-8?B?MFRsMWNaQUthT0FIZjJRRGhDd2VKV3RSS05MSWNnbGppS3ZaSVZLVTRNbUhO?=
 =?utf-8?B?YUF2Zm1lS3A1eTZyRFFuak43QlZEWmJYL2RwNmk5Z2VKbHVnVC9zOFhKdU1z?=
 =?utf-8?B?NndUVitoZVJ3Q0xkZ3dzT3luNTRCNkRxMjFJVVlLRW9DQXhmSG1HdXdiVnQy?=
 =?utf-8?B?YlExS24rUTd0T3FQQTk5T0QrdnJ1bm5YM3RTM0Y4OC9UOWh5bGQxS2dlTDdI?=
 =?utf-8?B?TExDMVBoWXUrMWhIL3RBT1NMeEpWdFBBa2VPbVJLVUx0QWh1a3FDSmtpb3hI?=
 =?utf-8?B?dW05QTNteFRKeVhwQkpkZjFUVVo4SUlaclVaak00SWd4cWRXZHExM1p5c3ZB?=
 =?utf-8?B?c3U2N3ViK2srQitTdUUrbkZOVUhQdFdkTG9FSjBDclNwVXl4bDQydk9jWFhZ?=
 =?utf-8?B?UEJxbE5UQSs1RjNSQWlpN25SaVZVRTJvNTNCR3ZPVU80Yi9LY0RrVyt4Mngy?=
 =?utf-8?B?b0VUcERNU0Y2VStmMmFhZENTZC9sS1p4cHNDd2tZOGpNSWd5YTlLbWdUQk9U?=
 =?utf-8?B?V2hIUW5GR0NTZTlWVjN1S1drcVhwL1Y4N0thWTdhUGQrK29FSVlyNm0zbzdo?=
 =?utf-8?B?MmpsanhqL0RIWElCdkszNmdVSWZ4NWhsUW1xSkZQSmZJc0J4ZUtTMWk4YTBz?=
 =?utf-8?Q?mcAEU+5giprANxoBsJo/uEKABHeW6J2U=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MFk1cnYyemVWOG9WaWtqaUZjWG5Qbnp4WFZsMG1YOC9uY0hTS2hrU2EvVGNU?=
 =?utf-8?B?eDJrQTY2Y2RLUXhHZzF0SGJPajhVaDJCZGVwWE85NFV1d0xOZVJ5RHkvSG1n?=
 =?utf-8?B?MG1hS09vditMNkZTWGgxNG00VVdjckhOcXRKRVNubU9NSXhQSHFIeVBXSCt6?=
 =?utf-8?B?Um5rb0xUWElla3JKVkgxNTBOTkhRK3FjUWJTUUVWMVlWRmF3OWxQU0tRdHFk?=
 =?utf-8?B?ZEF2UXVtZDJsWUxCaG5NaE54aFovUm4zbHZ3emVpdU9WNHBsTWJOUVc5VEQx?=
 =?utf-8?B?cWFkMk8yUDdDRVFrWmJLbGFpdlB1Z0Q0cVduZFVFK0h2WHZRZlZGVVVhUnJL?=
 =?utf-8?B?NytWZFJhaGUyenhHY3Juc0hrVnAyVUd2RFBkVElOTXYybFMzamlsNkUzNFRX?=
 =?utf-8?B?ZS90WUhWbjlHanpSYnhiZjFBUVlXRktaZWdVK0k5STZML1dxYXdwZW12NS90?=
 =?utf-8?B?L1NuNnhNbmRId2I0Y2RhNCtLN2R1ckRkVFEraExybVFhM3crTmZSR0hRUC9P?=
 =?utf-8?B?QmN4TUcvaExNQTJmVWdCeUZBbkdtc0hwbHdvdGs0b0FlUWljUVlkcFJGS1M3?=
 =?utf-8?B?TSt2UmNPVDFRU3ZZT20wMjFOaGhBbFliSmtaN0VEeTFtbkhQaTJKZmpPc1lI?=
 =?utf-8?B?cTlpUEltYWpTMWgza2lOdlBGQm5aQnhNRHpISUpoMkRyRW95MVcrTnpWc1N2?=
 =?utf-8?B?VFI3QVhLbWxETVA1V0UwSktnWXdnV3NDVHdtdi9kaFRYOW1Rcms2SWw0REc2?=
 =?utf-8?B?eElKSTdUVTRMckRmQjRwekdvWGRITEY1cUU2YnJwNEJOUi9uaE0wZkw5YzZT?=
 =?utf-8?B?Q25raTluRnNMN3c3ajFsTTB0T0dwYjFxeWIyUTZpZDdyWndobzB4NzNKbiti?=
 =?utf-8?B?NDJoUnBkakNxbmZ6cEorMlVNYVF1U2M2TzVPaEIzYlNKM2VqelJUd3pTL1Vl?=
 =?utf-8?B?MGg3QjllMG1oQWZmWmc1S0ViYzFQMXhXVHpBcHJzTEdjNkNTeGYyR2VGem1u?=
 =?utf-8?B?TTgzcTNEYTZMellFQjgySzQyUFhtNUc5bVJRSytyY09RaFlOUkdMS1F5dGV0?=
 =?utf-8?B?dy8ra3dtbmM5c1BvVFpMc09PL1lNTkZtMWdtbGYxcEp3WUI1dmJIT2pSbllv?=
 =?utf-8?B?U3NscU41YWxjN3VrbUY5TzliQkgyS1R0b2FlTklrNjVML3FPZk1SZTJ0dGRD?=
 =?utf-8?B?UENoZis3dExTbmMvcTRRK2N1NGdxZHhPTEdNNjJubU1VMGdZU28xK3JKVmJr?=
 =?utf-8?B?UU1pVnIwOWNjaC9iek53ZHlMemlMdVZsSzhUSnd2Syt5bVBnVnFUdFVRRzM0?=
 =?utf-8?B?QngzbUV1V1JsQ3p2QUFCYnljTVpBK1RwcVhwRWFCYVFrUXduS0RMNzJWVFRW?=
 =?utf-8?B?REJGVER4dnlZRHd2ZjMzRWxVUHYwZnovMHd4ZGtvSzdqWkE5RTU0OUprd3Rv?=
 =?utf-8?B?blRyRWJNSEcySmlTa3pDRkI4aGRKa3hwQWY5bHlKRGNWaml1UUVzcnQ3Nk1k?=
 =?utf-8?B?ODRneDgvVjJWcVdveU5KRUY4bmhCL3F1bWQwN1BoTzVyN3pMYjkyQ2J6KzBR?=
 =?utf-8?B?SVJvV0o5enpBSXRpMGZGdWV3REJlNTBsSWI4MXFUeVM3UlVTSWpEMEI0d05O?=
 =?utf-8?B?R3RtVWVOcjlONGdWM016cHRIS0x1SmluV2Z5T1RkKzAyWWRYc2RSNTlyL2Rx?=
 =?utf-8?B?ZS9venk3bitMUE45bUVRRGtYWmk4M21KN29qN1p1d1QrU1FvWFdUMUwxaktN?=
 =?utf-8?B?eHRLZDdVRjFWYmQvdXdKcFBQOGY3d3RUZkVtZENMRmh1Y3VBNG9YUnhzVWth?=
 =?utf-8?B?b2xhNHVpalFFbHJkSEpyR1dHV2ppd09JNHhSNVBLL3ZWaU1Oei9sdmZZaVpG?=
 =?utf-8?B?TlVFMUFhUDEvaEtLOGNiNzBCaURRd2o3Mm1MM0c2UmY2YkE9PQ==?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0167e368-f07d-48d7-bb4b-08dedca05909
X-MS-Exchange-CrossTenant-AuthSource: SN7PR19MB6736.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2026 03:23:58.5205
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PPFD8D997F51
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[outlook.com,none];
	R_DKIM_ALLOW(-0.20)[outlook.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_MUA_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:brgl@kernel.org,m:marcel@holtmann.org,m:luiz.dentz@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:p.zabel@pengutronix.de,m:linux-arm-msm@vger.kernel.org,m:linux-bluetooth@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:bartosz.golaszewski@oss.qualcomm.com,m:luizdentz@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[george.moussalem@outlook.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[outlook.com];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,holtmann.org,gmail.com,pengutronix.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-117463-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[outlook.com:+];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[george.moussalem@outlook.com,linux-arm-msm@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,outlook.com:from_mime,outlook.com:email,outlook.com:dkim,qualcomm.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 498547215D4

On 7/7/26 12:27, Konrad Dybcio wrote:
> On 7/7/26 10:12 AM, George Moussalem wrote:
>> On 7/7/26 11:51, Konrad Dybcio wrote:
>>> On 7/7/26 9:51 AM, Konrad Dybcio wrote:
>>>> On 7/6/26 7:26 PM, George Moussalem via B4 Relay wrote:
>>>>> From: George Moussalem <george.moussalem@outlook.com>
>>>>>
>>>>> Add nodes for the reserved memory carveout and Bluetooth.
>>>>>
>>>>> Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
>>>>> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
>>>>> ---
>>>>
>>>> [...]
>>>>
>>>>> @@ -136,6 +153,11 @@ reserved-memory {
>>>>>  		#size-cells = <2>;
>>>>>  		ranges;
>>>>>  
>>>>> +		btss_region: bluetooth@7000000 {
>>>>> +			reg = <0x0 0x07000000 0x0 0x58000>;
>>>>
>>>> FWIW RAM starts at 0x4000_0000 - I'm thinking whether this should
>>>> just be the 'reg' value of the bluetooth node. This makes even more
>>>> sense as you write to this region using I/O accessors
>>
>> I wasn't sure whether setting the unit address to the memory region it
>> uses and write to. Perhaps Bjorn/Krzysztof can provide guidance?
>> So essentially, the proposal would be for the bluetooth node without a
>> reg property to look like:
>>
>> bluetooth@7000000 {
>> ...
>> 	memory-region = <&btss_region>	--> which starts at 0x07000000
> 
> I was proposing that we remove the reserved-memory region and define
> this register range only through the 'reg' property.

Got it. Will update the driver, bindings, and dt node accordingly.

> 
>> };
>>  > FWIW2: The region is called "BT_RAM"
>>>
>>> Konrad
>>
>> Thanks, I'll update the node name of the memory region to bt_ram@7000000
> 
> Node names (between ':' and '@') must not contain underscores, use a
> hyphen there.
> 
> Konrad

Best regards,
George


