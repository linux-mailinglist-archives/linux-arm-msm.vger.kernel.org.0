Return-Path: <linux-arm-msm+bounces-49821-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 150C4A49245
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Feb 2025 08:35:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0960216BFF9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Feb 2025 07:35:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86BAA1C5D69;
	Fri, 28 Feb 2025 07:35:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com header.b="duuH0Emb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (mail-vi1eur02olkn2051.outbound.protection.outlook.com [40.92.48.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8E011C3BE8;
	Fri, 28 Feb 2025 07:35:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.92.48.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740728130; cv=fail; b=pPvoCc2gsjrWuiqeyb/ApM6i/xgDyRpE0mH/Ro/EpwNYCd3CIwF00SbqNiGy5WdpJK1+3ui68nWgL9fTethvy9uv88J+h8mwyhNtwC+WYaMo6bq+eXvnq6FQXUNm/ejdw+uvh+6616vJ7D4Cv6n448d/9ZEki6M6LTsGuwCl7w8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740728130; c=relaxed/simple;
	bh=Ih4ZxoIdH2jn5HlB5hmQyBKkYOJapW7/94W/OHycgzg=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=dCnXJz4D5THfRaUdM69hjS+3l1eegWoSjOsleRC0+LRbCZtjW6aiO/sIA/Gvgw/55eP85v6c5K6eh3nRViHPDFJfBdBNDNFndHmt9KjjPP14HujAdWMw/fNLRnHIbjy9mfwj28OHEF/j6p8cVQSaRIvPA3Zy+zmVXC9Nfb03x4Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hotmail.com; spf=pass smtp.mailfrom=hotmail.com; dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com header.b=duuH0Emb; arc=fail smtp.client-ip=40.92.48.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hotmail.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HqrlHV1tfEtliuCyfsgmzdzr8mP42cE6i0UhBHHNYS0mwir/3ecETBApsoRWvANaRBCByqHXw/I/ypJzLX1e5jgN6NBdjCErLghB9eA1/nL9Jty5O0Ghxv0kMws0QNjODKwtAJcvwhRLu25EQBwEx+4yIvR5XlMSsOB5tk8cHWHD21SzBKIpifXSguXHbREbSNVI3DfiCbT6VvYQXlpi2bUhdvfAS5FoLu7yNWnwV4VPnDGXcmCFy7Jy+Iq0o3R+Eofq61Bx+5C2WB69mZJOhxhXA+8VYygOo5wrqZvqNHGM4v79bIOc5Ttdxh8+18q0uG+p/WgRDdNH3mAmWlvV6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vg/JXpeEW50/BTtb5ADxOjD3+vNLPcDgfA9LflwBCRQ=;
 b=ftqcKj48OJW1VeAbRqPlqcHl2xgln121RjDHxUyu6drWbPcMeH0d1hYx8diI415sUL/evG+akyXScb04caySd07b3w9s9283oNrxabXct+r9PDKjVFvh5ZogT8So7mf74BE7eS8V/MpElJr7rUT6rAktFmc2Zv3KZD+Odcb1H3bNpR3JKQvMK0Oq7zBGnuZq5vyGa18dGB6Hej+lZWMiuP+1o6ggG6kHBjG3flHmW4tuPd3JQLE/uLIcsauXZiUyHRSaX3mX00EGVLH0pEj6S6de4g/FFpYsW1YxEO4Vjepc2P+S3BZoLy4+mIKzk/JymTx5G5fu7ARCof548uShYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vg/JXpeEW50/BTtb5ADxOjD3+vNLPcDgfA9LflwBCRQ=;
 b=duuH0EmbVNvA2inTTxH3u+MDL/so+MjyQlbkdvPYomTnt0LCDuetTLqaw/Pvv8gq+jRMHnQHStC3rRFikaBWNDW6R+G4fpYxG/vvnFBYCoVlv7FLttDK5ItRnDBJCGMI4TNYfA5lgXC8IvByOFnHQ+uIY8FQhuFCFs2RKV3LmDwIEjOuCmXZmV6jOlDuUutf56Yz6Y+FIWshdzjcndyDbpFrI5oqPG/CCwFi8bSQdHXsTBtu0kN0X2gYUiEc7WQR9TgCpsDR22pKtFTKhnqaCGWscs1mRrVvB6iI/cRUUenmPAxEzj1p+bPl977NG0kYuJZ4yOck+Y9wy32CJNyiLg==
Received: from AM7P189MB1009.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:175::17)
 by GV1P189MB2835.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:1f0::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.20; Fri, 28 Feb
 2025 07:35:25 +0000
Received: from AM7P189MB1009.EURP189.PROD.OUTLOOK.COM
 ([fe80::e9f1:a878:e797:ee1a]) by AM7P189MB1009.EURP189.PROD.OUTLOOK.COM
 ([fe80::e9f1:a878:e797:ee1a%2]) with mapi id 15.20.8489.021; Fri, 28 Feb 2025
 07:35:25 +0000
Message-ID:
 <AM7P189MB1009F54A7B6E0D07586FBFFCE3CC2@AM7P189MB1009.EURP189.PROD.OUTLOOK.COM>
Date: Fri, 28 Feb 2025 08:35:24 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] arm64: dts: qcom: x1e80100-vivobook-s15: Add usb a
 and sd-card reader
To: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250119-usb_a_micro_sd-v1-0-01eb7502ae05@hotmail.com>
Content-Language: en-US
From: Maud Spierings <maud_spierings@hotmail.com>
In-Reply-To: <20250119-usb_a_micro_sd-v1-0-01eb7502ae05@hotmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS4P190CA0055.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:20b:656::19) To AM7P189MB1009.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:175::17)
X-Microsoft-Original-Message-ID:
 <62784cf4-7ef3-4cf0-b4ef-043e9127de27@hotmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7P189MB1009:EE_|GV1P189MB2835:EE_
X-MS-Office365-Filtering-Correlation-Id: b2544fd4-7dcd-42e2-b727-08dd57ca772b
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|5072599009|19110799003|15080799006|8060799006|13031999003|461199028|6090799003|440099028|3412199025|18061999006|12091999003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aEVOeHhKaHlpanE3OUE2RWVXMkhJT0hiNmNYRnR2WEcwWmVud1lnNDQzRFI4?=
 =?utf-8?B?Q1FqVzllaFJaYnRBVUQ1b2RGNFZtOGRJYzJ6UE5LR2krV3c0WldQOHFaTStp?=
 =?utf-8?B?d2hSNHowa1JadzlnZHlkSG1HOFdxVEE0SEs3QVpNRUNEUzU2R21QZ0tra25D?=
 =?utf-8?B?cGg5a2gvNjByeXZWK1VSYk43d3ljN3RyY2kvZHFqcHhwL2ZjQjNmSGkwWENp?=
 =?utf-8?B?bm9MWm1ONzU3dm9hMnZLTm5Saml2U3g5RXpqTVhVL1l4WUgxV2t4VFF3Zk05?=
 =?utf-8?B?ZVVFV0pBVUxCenlHdzBXTHNXdVpocmZBdHg5OUZqSWdlakgvYzdNRWdtdkJW?=
 =?utf-8?B?K040eEZta3Izb1UzbkZlZnE2K0M0ZHYzZFpUV0J2bjBxdFBsTTBpNFJYdlF6?=
 =?utf-8?B?L3NKUFFOcm9hOGZFRTJqMzBvYzdxd2loYVV2NSszMjFFcjVKYjQ0dk15OEow?=
 =?utf-8?B?UUJhTjRuQzkzREdoK3FtYXdXdTR1aS9mcitqWTdPcUFXYlNIZkc1UEMyRHJt?=
 =?utf-8?B?ekFTaDlZcW95VCsyeUM2MGsvZHNSK2M2T0dvSVluS1NnS0s0bmlqWCtsN1h1?=
 =?utf-8?B?aXNQM05zQTM3OTdEQUtYVXpEOGZjU25JS2s0b1JyTXJzVXdWcFFNZWR1ZlN2?=
 =?utf-8?B?TlJveVhEWGJ0ZWtPN0dNZGs3RXkxWUlHK3Q0bkladmg0ZEU2ejQ4dEREejFu?=
 =?utf-8?B?UTdYdkIvNmlZdm9nZkJDcS9YOHc1ZnRFL0ZiWWxHbWhMSlNVR1h5MXVMQTdS?=
 =?utf-8?B?VlQzMzZFdkVDWW4zclZrS2V5U1orY1VTcWMyNHRKWWlCdXlzWko4VGRCSVVi?=
 =?utf-8?B?aWpEQmxSRUVTaXFpVjRxL3U3TlFGaUtZR1JBUS8yMGxpOWVHSmFVenRKbXU4?=
 =?utf-8?B?UFNlRE5TdXdZT0lBNFF3Y3NGT3VYQTRXV0N3WEVTU3U2Sy9HdWE0Q2o4cTEz?=
 =?utf-8?B?R1JmdERERTdWWlI1VS95Njc0czdsNVE4Vi8yV3NYZm82OGo1TmZiSTkrQzg2?=
 =?utf-8?B?em41c3pWakV6Zkxsa3oxRWRZakQ1bTZkbmprOTFpejdJWktIK0R2SUQ1L0pG?=
 =?utf-8?B?V0doS2ZtSzFyZTQwRlVUV2xNMHR4ZXBHTng3MHJST1EzeXRFajA2bjUza3cx?=
 =?utf-8?B?VlFVL3JkUk9LMnB3OTFsUXlkdGY3UFdYOHBRZzVjNkNLNXVJUGs3cXV2eDVj?=
 =?utf-8?B?dXZpQ0w3NmxSQ1N0Z08wd2h0K2VKMXNJUkZNbTN2MnBvdVpEc0ZsWFBMd0R6?=
 =?utf-8?B?OGhXc0ZZK3NiOEN3TmNmU1UyOXpmMVVQZ250enBLN2J4TTJRcGVERjJSWDZX?=
 =?utf-8?B?TlpFT0FNcWJEUXZ6OWt3MTkrcTJLbFNGTUhVNVgzVE9UQXNUMnRTSkxmdSsv?=
 =?utf-8?B?TUhQNitGNnNhMmtrbXFBUG1EQUV1c1owb1NqUU5aUEw5MWkxSDNEaUdMb3d5?=
 =?utf-8?B?YUxiYTFjaWh1YnBqMjRVUFA0S01JOEh4RXVnRmNPK2I1dzZhS0hNNFE3NTU1?=
 =?utf-8?B?UHJIaEYvRVdDSUJUbTFBbTNBcjYzK2RULytwNHk5NEhMM09ua2pvakxkRVNx?=
 =?utf-8?Q?vxCbby72UGSX30agdElVvq390=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U3JOSnpLTldnbmVFTE16T2J0azdnaGdOeUdmdG8zMC9SSUVjc0h2S3h1MnBs?=
 =?utf-8?B?a2FwY09XSzNOMVlQSUhDbTJUUFh5cjFicStoRUNZSkc3Q2NrQVRSbVBDUXF5?=
 =?utf-8?B?UlNGejZiV05PNVFmanZucUE2ZEVLMUN0cjNjS1hxblZseWdvWDlQMCsweisw?=
 =?utf-8?B?Rmx6YU04K1FKWXFQUTc2eVI4b2FJTVR0TFlaUFFUalAxRkwxM1Bzd2grTkdY?=
 =?utf-8?B?UHYyeEtIUFEyNTFsOUdwQkFWMjhKNmhWU1BOVkpKYjM5cjhESWtjMkEzV1J2?=
 =?utf-8?B?a00wa0JIdzRVOTl3dmNjR1I5V2Jnb3l0SXJKT2srcU1iQVlGaGs4WHFpdDdm?=
 =?utf-8?B?TThodi9udGNUK1JQWGpaYXRWT0tRL2o3Zk9VWGVNeEZtSHpTR0lhV21XYTd0?=
 =?utf-8?B?eENxMm8rSHNYMUorSy9TcVFIclpUY3lVS2J0dG9FZTBCeTRqbm1uM2pEdEZi?=
 =?utf-8?B?RHZ5SnV2UHd3Q3Z3dmp2ZWJVTHdrTW0zekZuRGRnZm5SOGVLeGdLM2dNN0RK?=
 =?utf-8?B?a1hoZTY1dENMVlh2b0ljWWpRTmFxblltUWxVNjZhUWNyVEljRGs3YWhhQWVn?=
 =?utf-8?B?VS9nLzFLSWROYzdxNllteTJNK3hxOEl0Z3d0VXBiZENJQW9ZWnFPQXJZUzQ2?=
 =?utf-8?B?aG9pS3JnODRmanVlcHhvNEhDMFdYdlZzZnByNFRycmtMZ2h4NVhVMXh4L1RE?=
 =?utf-8?B?RTBUR0dMc08xZEV0VTBqMzhPY2tRNStzNUU1Y01wS0pXd0VIVU9yeXRZWG5N?=
 =?utf-8?B?ZGd0d0pFbVp2M1NTeEJoQU5jUmJqYWt0SFRKK0hJSzV5ZytlNEJ4dHZCTUYy?=
 =?utf-8?B?YlNPTlRLbGs3bmlZY2ZsSDd5OVpjbnZlcFRpbTFqZkQwcEx2OGppQy9KSlR1?=
 =?utf-8?B?QzJZZm15VUk2TXdnWERxUHErSFNOUGxrbFVqTDQvZVJEQSswQ1I0cGdPWkxi?=
 =?utf-8?B?aTRxVGtZVm5SNnE5N2RySW5PSldzSWZuMWpMb1YxK1FQWWRNQkxJUTl3NWNO?=
 =?utf-8?B?T1hCZ25HTGpMN0U3b2t1NkU4QkJ4bzFhdkhPQWhXVzJ6RmZqbWNQRWFkUjky?=
 =?utf-8?B?ZHVZSjUyc2NDY01IdEc4LzJvRmNSUTVhZjZUSnVqVldJR3dXYVJteTdnZGZn?=
 =?utf-8?B?b3Z0aERjTWN4RVZDZytObzk4VGhscHJHUjg0UEc4OGZJVldSUzYzSmlDQ25M?=
 =?utf-8?B?R0Q1WSsra0hDN3MzR2VOb0dBZWRMZWwzdG8rSDFLdXdQVXA1bXlicXNKeWsz?=
 =?utf-8?B?MTlydUVhOTJWdjBuUjRJT09rVG9hSU44UTl4SVBtS1NCdjdicmNUeTljM0xL?=
 =?utf-8?B?N0VjS0dKcm9MSmpqMW1uaUptM0JHN1p6cVZUU0MwV3lzNHJ5MlBFYVJXTkZj?=
 =?utf-8?B?VzhPU0N2WVZCZG1URGloSDNlc2YrcUNSMUttNkxUYndnL1ZxdU95YVo1ODJH?=
 =?utf-8?B?RkgvWmNTRG1YODVFK0kwdmlKSHRHa1ErSUszb0ZMdVNjeWtPckN3WUNmRzc5?=
 =?utf-8?B?L2ZYZ0ZLZElDVXB1ZVJUWmx6NHB0RmdiRHR3THloQW9LSC9QOWl3SEcwY2pp?=
 =?utf-8?B?WjZhc1UyckdaVGhSaWcvdGNDdGVuNXpIeGl2TUVINzcrNGJBUjN3ZEJSNXBO?=
 =?utf-8?B?ZnpTVExVRzZleVprQUpjNmxIeVE1bndHZXdlNU9GNlQzeitlMTZFMGRNc2Zl?=
 =?utf-8?B?dWxsOWIvUG5XUnZ6V1Z6UlJHUWZlMHhZdC9yZmt0dHNUeE42K1FPRWhTRzNh?=
 =?utf-8?Q?XoHK8wHnDKDoyqM03SQ4L5ZJ4vPV/r6mp3YC/Z0?=
X-OriginatorOrg: sct-15-20-4734-24-msonline-outlook-c54b5.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: b2544fd4-7dcd-42e2-b727-08dd57ca772b
X-MS-Exchange-CrossTenant-AuthSource: AM7P189MB1009.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2025 07:35:25.5484
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1P189MB2835

On 1/19/25 3:50 PM, Maud Spierings via B4 Relay wrote:
> The Asus Vivobook s15 has 2 5gbps usb A ports on the right side which
> are controlled by the usb_mp controller enable them and the retimers
> required.
>
> There is also a micro sd-card reader on the left side below the two
> usb-c ports, this one is attached to the usb_2 controller. Enable it and
> the retimer to enable the micro sd-card reader.
>
> The micro sd-card reader seems to have so interesting behaviour, on my
> machine and someone elses it kind of half works, but not really, the
> same under windows, unusable. Either we both got unlucky with a hardware
> defect or there is something else going on, however two other people did
> succesfully test it, one of which on (free?)bsd instead of linux even.
> One hypothesis is that this area is where the charging circuitry is,
> which gets *very* hot while charging and might damage this bit of
> hardware. However this is very much speculation and not based on
> anything concrete.
>
> Symptoms of dysfunctional sd-card reader:
> The sd card will get detected, a usb device will appear as "Genesys Logic
> STORAGE DEVICE" 05e3:0747
>
> log:
> [ 2456.648075] usb 1-1: new high-speed USB device number 3 using xhci-hcd
> [ 2456.792703] usb-storage 1-1:1.0: USB Mass Storage device detected
> [ 2456.795530] scsi host0: usb-storage 1-1:1.0
> [ 2457.840518] scsi 0:0:0:0: Direct-Access     Generic  MassStorageClass
> 2402 PQ: 0 ANSI: 6
> [ 2458.072281] sd 0:0:0:0: [sda] Media removed, stopped polling
> [ 2458.073001] sd 0:0:0:0: [sda] Attached SCSI removable disk
>
> /dev/sda will appear, but it will not do anything, fdisk rejects it etc
>
> Signed-off-by: Maud Spierings <maud_spierings@hotmail.com>
> ---
> Maud Spierings (2):
>        arm64: dts: qcom: x1e80100-vivobook-s15: Enable USB-A ports
>        arm64: dts: qcom: x1e80100-vivobook-s15: Enable micro-sd card reader
>
>   .../boot/dts/qcom/x1e80100-asus-vivobook-s15.dts   | 142 ++++++++++++++++++++-
>   1 file changed, 141 insertions(+), 1 deletion(-)
> ---
> base-commit: 0907e7fb35756464aa34c35d6abb02998418164b
> change-id: 20250119-usb_a_micro_sd-4c476ea769b1
>
> Best regards,

Gentle ping, would be nice to get this into 6.15

Kind regards,
Maud


