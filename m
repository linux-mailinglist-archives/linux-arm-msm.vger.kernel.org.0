Return-Path: <linux-arm-msm+bounces-80523-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C1AE0C39546
	for <lists+linux-arm-msm@lfdr.de>; Thu, 06 Nov 2025 08:06:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D55BA18C7C11
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Nov 2025 07:04:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 118E127B4FB;
	Thu,  6 Nov 2025 07:04:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com header.b="n1EmMPqu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazolkn19012042.outbound.protection.outlook.com [52.103.32.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7FDE27A900;
	Thu,  6 Nov 2025 07:04:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.32.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762412650; cv=fail; b=Qhpk63F1blR5shS5KQp+KTKsNwRjHYOb/nlCXkwgV9Qd/zlbD4+aSG+/mrdygx3wo7BMQ7g7nWPJ6R+pe27wnQHtPAYJ6nC3atuV8JyDOTiUkI4tbJ3ng2tkCiZ7KK00+aVJtESTO3fvsMbL1+0QNs/agOvEICIcrHDx3DBJ43E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762412650; c=relaxed/simple;
	bh=fOzkWk8luGGkBUXCWyWwFE/IzZujXsqxY11U6DBcg0U=;
	h=Message-ID:Date:To:Cc:References:Subject:From:In-Reply-To:
	 Content-Type:MIME-Version; b=hBhioIQ3eA1gKvjAxYrB+tacBxWgyDvcpCPCMc3ZYimEF2K+U6o1om4Xkd9xgjgWNaOZDYktHHt6eL9D+A7A0IBjPvr/JI+76hvgG/1DU7FM502kJf00ZOp8OHiYTGuJ6OGH1931/42XdGkqyqcHh7Uuq5gGOOinGr0mSDG5qmA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hotmail.com; spf=pass smtp.mailfrom=hotmail.com; dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com header.b=n1EmMPqu; arc=fail smtp.client-ip=52.103.32.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hotmail.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g/MQgU0M5tSeY9eJ2B+qV8t2MNnrbJjhaPc/ph4gQ8l/LJQgcw98mZ0b4IN5vaOkQ5Czt8quCo0N6PTHckAS2EOmdFbQC4bdxM2ucLBGZN/X5MT7ILe6mgUS9oL8PIYMnO9BGtbiJhJhCsaPGdiPhVRqJ+lL6DWNjRDhRFUlFeKidtN6f0YVUIPVSQ/y63mKuPfs6hQoVY38rlr73v4MikeM27qmNoqm8r6hbHMqowFzA50DktM29kmvdwztiSOGjoZhCZD3m6S02YDJ+io38Av3sFy+VqHoIF0xG+6Zm2o3Ct+yv10GM/Yc9f/mVXrW+mpSnxaETEmyFKdlkvszcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/dj96Q/kSADz796P0zgiep4LXtJwMtdkuklb+vDTibk=;
 b=DwFJf/2iYQFIwq1522vw3RANnXlXgu6Zca+SQ+MgR7cjLvpryUVkO2GYACcpHj44AMaOXQhLW95P+dmCt2yLG+NkC7t9TMh8mhc3iDuZYrunrDo3vZ/RTbH04vCfcH1qoNTbKOHvRg6ba6a2spAchyIrCm/0W4HXTrvwx+o4Y326hzWZuPe8cHvpMYxFqXGX6H91bgEEpxMermKtIHO2KcLkTNG9mFXqsnL4jceuPN+DaslsRthxOKUS/0zp1HMMExKH8QpS1D1iUEH4eKySBRSz5He+ZSP1Lb+huIoSidjnXypOJogy/1JSSdfuR8n1gvv6ljGpcxnuHpGHthHOGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/dj96Q/kSADz796P0zgiep4LXtJwMtdkuklb+vDTibk=;
 b=n1EmMPquuZAaHErhigkAGqd6AqHwo+K7kzmX7Dp2H1fvALtEDWvw1HWv3cVZBR+bCRQuh2JnPHscgz2bvqqP+k0jKLsgtdgiw6/euoRhlICMGDLaU/OdH5C/AXk9gAKHKKLeGutItl7psQlQit/iUnkGqJOULUrlIaCT6uTkKUHYvcEHpTrP8GFUDaDzpqT8oqGGi8zYbzZWNBjd6rI2hhj0cg53kO+ubb4Ey0D6VwijN+4nElir/9+kDZ8fHSvoZ3J/nsvADzEPM2pPEhgIQSjkUXz/3S02PkVK3AkuF/SCNEcyvB8l9LCAdy8UXkZ4mKS/SJdza9lEpCtWJQtraA==
Received: from AM7P189MB1009.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:175::17)
 by DB8P189MB0999.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:160::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.12; Thu, 6 Nov
 2025 07:04:03 +0000
Received: from AM7P189MB1009.EURP189.PROD.OUTLOOK.COM
 ([fe80::5756:694d:1641:3b13]) by AM7P189MB1009.EURP189.PROD.OUTLOOK.COM
 ([fe80::5756:694d:1641:3b13%5]) with mapi id 15.20.9298.007; Thu, 6 Nov 2025
 07:04:03 +0000
Message-ID:
 <AM7P189MB1009AB38D027DF8A77E86756E3C2A@AM7P189MB1009.EURP189.PROD.OUTLOOK.COM>
Date: Thu, 6 Nov 2025 08:03:59 +0100
User-Agent: Mozilla Thunderbird
To: ggo@tuxedocomputers.com
Cc: andersson@kernel.org, conor+dt@kernel.org, cs@tuxedo.de,
 devicetree@vger.kernel.org, ettore.chimenti@linaro.org,
 konradybcio@kernel.org, krzk+dt@kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, robh@kernel.org, srini@kernel.org,
 stefan.schmidt@linaro.org, stephan.gerhold@linaro.org,
 wse@tuxedocomputers.com
References: <20251105154107.148187-7-ggo@tuxedocomputers.com>
Subject: Re: [PATCH v2 6/7] arm64: dts: qcom: Add device tree for TUXEDO Elite
 14 Gen1
Content-Language: en-US
From: Maud Spierings <maud_spierings@hotmail.com>
In-Reply-To: <20251105154107.148187-7-ggo@tuxedocomputers.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS4P191CA0028.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d9::20) To AM7P189MB1009.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:175::17)
X-Microsoft-Original-Message-ID:
 <bbe5642d-bb80-4a51-90a8-73174a3340a9@hotmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7P189MB1009:EE_|DB8P189MB0999:EE_
X-MS-Office365-Filtering-Correlation-Id: 653460b6-fca9-490f-d6ac-08de1d02aa7a
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|19110799012|8060799015|41001999006|6090799003|5072599009|461199028|12121999013|15080799012|10092599007|23021999003|440099028|3412199025|4302099013|52005399003|40105399003|10035399007|1602099012;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UFBaMjBrTVp1R01Rd0xhRWF2cVVxMnpKQnJnVTdJWlNFZFZjNEFnaWQyQTJ2?=
 =?utf-8?B?bmlITUlyV3hmQi9OeUZyN1huRjhwWUVTYWp1V2tuaUN3Z2V1OXFpaWh0NHRY?=
 =?utf-8?B?clUvUkxUSzBjQmZBL1VXYTVENFNrTDN4NkNhV2d2V21VYk9Rc0hCaVByR1A1?=
 =?utf-8?B?eTk5ZlN1NTJaaFIxNXgwUVN6TUszbkpXWUZNTUc1RzlPODJMR3lIVk9qbkZN?=
 =?utf-8?B?TDJhYmNMYm0ycURBNU1GbGVtMTYyYXpGdVhiNmFtdFlOcjZTcVZyNWdBamkw?=
 =?utf-8?B?aVVIa205Qk5aL3RkN1ZGUVRZMEU1YVhuNGM4RURjOTI3UVBPeEI5QURGUnJL?=
 =?utf-8?B?dUE1alI2aitEVmt2WUREOFFWdUFGNUpBajlabndINVFlR3g0Tm5jelB3WTlT?=
 =?utf-8?B?bkt1OHdKWnJMNjN6Z3Mxd1c4cnpxMmQvWGFzekxwV2pFSDBpbWJWeFRyU1NP?=
 =?utf-8?B?K1dlS2VacENkVTZqNXM1UWNpdFNjb0drcUptVkVTOXZaM3diZ3JBNmJYaWhz?=
 =?utf-8?B?bDNuRXBVWWUvTWxOS1dwb2hERzAvOHJucXhzQmtlMUhINUtTQlRFWWhkdUtr?=
 =?utf-8?B?Z28vUGQrMGRXcnVZbjdpczNIOFVBZjFyMXlpNVR3ZjhsV2pldFI2LzRydE5Y?=
 =?utf-8?B?dTVHQmY0U1pHVEFWVEdud0VKV3QyblBTSVd4TFRwYXlsb3l6NFNSbXh0LzBN?=
 =?utf-8?B?SVFXaDBsZ01OZi8yZzR4S3orUzdwckhMR2hVN0tVVHFBWjhHRmV0QjN6alpT?=
 =?utf-8?B?WFNjNHNCam52bHZRdC93dFRkYnJUZGV3VjVwZkdSR1JPeTBMajFONmFPS0RC?=
 =?utf-8?B?Uk9Uam1vbzd4cSt0TDlXbXcwd3VrZ0NXWHBsTStDVlVmSnFyaExSZEVMSGJN?=
 =?utf-8?B?dExTelZTd3F6ZFV2MDhNLzlsSjgycWxlcVJjaWRPRlhGV1hVWnFmdTNZTW01?=
 =?utf-8?B?OXlXN1EyV1FOc1RrQjB4bFhJMitJZUEwZ09pVTNpWkt0dTJmWldOZkhBOWdH?=
 =?utf-8?B?KytSL0lUV2sxbDgzbWkzbUhnOUVsU1RhM1ZveTJIMzArS1ZpYjg3Qy9WUmF2?=
 =?utf-8?B?NjBHeGJWVy9aQmdmSURublJtUzFTR1VxbUh3YXlQQUJXYUdMekQyRDBWOGJa?=
 =?utf-8?B?aklqdUp3eENrMGZzdklUTkxiR1FVbXpDSGk5NTlIYTQ5TTMvNFpTcWVlM2RG?=
 =?utf-8?B?aFRyUktNeWdwSXBOblVpbUlLa0pwckZadVhLZXkvWENieTJxdkl4N1FMNElY?=
 =?utf-8?B?VWlISTg0YnlYa3Mxam9zQkozOTZZMWhqOTZrcFdxTUxjb2djQlcreXdwVjBk?=
 =?utf-8?B?djZUdS82VGtzdWR4VGF4a21KL1E3T2hWVGNKZDFTeVBZRnJ2VlNQWkluS1Bs?=
 =?utf-8?B?UE9CQ3M3d28yZVpoNTRITUhYblc5WlpNV0tHM2lnZnVqNWkxYzA3SkdZZTlG?=
 =?utf-8?B?RDJQcjhKNVZCUGhnM280VmROYmorazhydzBoMHE5L3hDM1ZuR2Vlc3ZnRitK?=
 =?utf-8?B?SzVGMmR1QlJvK2Y0NmRjZWM5KzB1TDZZT1BkeUxGWlpGbGpLTkFEdmFSbU5W?=
 =?utf-8?B?MmxpZzRBRC9Damg5M29qUXN2LzVvU1ZOTC82T3hkaDNkM2k4TWZZU2ZYdXp0?=
 =?utf-8?B?dlNQWURZL3B0em5kYmY1dXNvWXBBV015bXdQb3lqSGxRMExEZ3VGeHpmRmhW?=
 =?utf-8?B?c3JpVm5vdWlVL2NqWmpucTJnZXU1VW9XWko2bUhJUkNOb3pUdC8rYnhIU0R6?=
 =?utf-8?B?WG1HbkxiNzlYQmhTZytxMTd6ODIxNkNNTXZpMExqYWdwUmd1ZmYrbm5TNG5L?=
 =?utf-8?B?dmNQYjFwSEllZjMxLzhKY3RGOFhWVWJHZGJYWmxRMUdseDRUaENtd3lGTUdT?=
 =?utf-8?B?VkhtaXh0SXZsVjR3NVdIOVZrWWtNcG9lQzhaZGNYV3FhdFVoVHBHSkZoQ2tz?=
 =?utf-8?Q?saQxRUIafSTRetj07sYkMzU1uBJrmriY?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZWQvczZITEEwSDhwcXcwN09HajR4ZlpBT3JYWWVuejQ3TDhhRmIzNWRLYnQx?=
 =?utf-8?B?VkJLZG51VzVhSzgzUFozTld2QnJvQXJ5THdxSHlrMDlQdXM5OHZLei9SYXhN?=
 =?utf-8?B?OHdVTys4d200TGpLOTF2SDZVeXFBRGxYWHVlTldvVENqd1h5NWc0VWRGd2R2?=
 =?utf-8?B?UDBKY0c3NmJFejU4UStoUlJjUkFzYzJneEJ2YjlBcitDSHBFTm9ObS9BN0Ur?=
 =?utf-8?B?a2k1RFlXQnE5ZDROZHFzTE1KeGJENVJncXFsaXkwTjBIQW1Qc2N2UnI1b0Ux?=
 =?utf-8?B?WEpWcWthL0l1WmxIRGFvUWdRSnFhdWdpOFhDY2QzOVVraWpRNjIzNVA0ZXNz?=
 =?utf-8?B?QW1GRm94MTJMdTFOWVFiSkJQR0tCWXNHaE5mNVh5TEc5K0syNGRTZ3M3Ynpn?=
 =?utf-8?B?NU8xNUFuZEEzVzZyUCt4RXgycEYyb3FFQVBuWTlsdFc0N0llQ09vZTBiczRN?=
 =?utf-8?B?ZXR0TUlUbnRtUjczUlNVRFZJM0hrbFh5QjZ2TDZKaDRDV3NFVmRFVUthRHNn?=
 =?utf-8?B?a2NzaEl2OVErclVqS0huWmg2YXE3dWViLzJaVitIbVg1NHYzVTdvVjA0b0NM?=
 =?utf-8?B?OUtOeGFiYXR2MEZVWDdnNjJsUUkreUNPbGU5N0VXSndxcWplbTV3cTVndUd4?=
 =?utf-8?B?VDhXd3lNYVF6ZUkvcU1XYTRlTTN1OXRySWlid2xuSkVDZ0ptYVdETXB2d3FG?=
 =?utf-8?B?T0YvNllhTDI4Rmxma0oybGhhWHhTRE9YL01LMFpZWEY4YUZVSU5ldGN5TFpW?=
 =?utf-8?B?MG5mVTUxb0owT3E4RkNVRWhRZGxIaGxTK1d5a0xldW93VFJBaldSV3dIVG5V?=
 =?utf-8?B?Q05ZQ2lmNVJHMjBHbi8zSmNjKzJ2TFNPZmppTnBQblNlaHRsaktRVkR4ZmZQ?=
 =?utf-8?B?Wm9YLzQrNVBhN0ZCS2FFRHZHc0tnVmhVR1V2azJzQzlCMUFzTzQvR09rTlRp?=
 =?utf-8?B?ZlJieVJLdDBTY29zT1FYRkNKTkZIMFVyT3p2cm9UcmZsdFVCODM0OVJNZXV1?=
 =?utf-8?B?NVVOVXFCdk5XL1VHY2NnVGVZbmFtejlVajRFQXJ3RHltaE9oUk92NElDLyt0?=
 =?utf-8?B?Q09vTXFzNndweVJIUlozSVFmZWx6WUZvdHVvdTg1bUtOUTVRSDlCYkxnM3VM?=
 =?utf-8?B?T0dRVjVCWjVBVzVPTFJEdVZoM1l2VXNZRDV4bE9vS25adjdSQ1ZMelVQVUJs?=
 =?utf-8?B?TDJVa2RscjlHcGVOcGtkeVJzUTNXcVZIVTJ5eHdMSFhOWWtrWkg0NWpEMTJ3?=
 =?utf-8?B?YVRUNjRvWC82NDR2VUN3c3pwaHdSSFErN0lKRWxQeUhIdkhPYno1WEtWaC8x?=
 =?utf-8?B?Z3JwNzNHSmV2VmxsRVFzaVpELzBhWVQzWUZKL3N4emNiY0xPOWJiMnBldGF5?=
 =?utf-8?B?M0x3SkVtRlVvMFNnNGlUSUhPSlZ3N0hJYmJWZTVJK1B0WXdPSUg3ZGxNSDc5?=
 =?utf-8?B?dEhKT29IVmFOZklwUStPb2ZhT1BBWG1VN2xXRjYxcjFUY2FLdEcxT3NVSFJM?=
 =?utf-8?B?eWo0S0tDTFFLRjAwL2lOOVZtYjVEMnY5ekRRLzY5ckdrOXEwOUppZk5uc1Ry?=
 =?utf-8?B?c0lqRTVQN3o1M1c1OTBKRDZEZU5sN1g4ZU9XTUFRcEZlRHV1anRIQ0pCTFRz?=
 =?utf-8?B?Q08xWmFEVU40aEcyZWtqQmpXanpBWURNeFlYSVh5M1lFMVBYSWszV2lwUnB5?=
 =?utf-8?B?c09hWmQzVHA3U2dVSFcwTnhtSUM2b2t6bTY2djN5Y0g1NW1hMTRSQ2VZaTF4?=
 =?utf-8?Q?gCZgG13Nxh648l1lWUyf10HuoKcSwN5vU9anzA8?=
X-OriginatorOrg: sct-15-20-8534-20-msonline-outlook-2ef4d.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 653460b6-fca9-490f-d6ac-08de1d02aa7a
X-MS-Exchange-CrossTenant-AuthSource: AM7P189MB1009.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2025 07:04:03.2301
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8P189MB0999

Hello Georg,
Great to see another version of this land!

> Initial support for TUXEDO Elite 14 Gen1 based on Qualcomm Snapdragon X
> Elite SoC (X1E78100).
> 
> Working:
> * Touchpad
> * Keyboard
> * eDP (no brightness control yet)
> * NVMe
> * USB Type-C port
> * USB-C DP altmode
> * HDMI-A port
> * WiFi (WiFi 7 untested)
> * Bluetooth
> * GPU
> * Video decoding
> * USB Type-A
> * Audio, speakers, microphones
> 	- 4x speakers.
> 	- 4x dmic
> 	- headset
> * Camera
> * Fingerprint reader
> 
> Signed-off-by: Georg Gottleuber <ggo@tuxedocomputers.com>
> Signed-off-by: Srinivas Kandagatla <srini@kernel.org>
> Signed-off-by: Ettore Chimenti <ettore.chimenti@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/Makefile             |    2 +
>  .../qcom/x1e80100-tuxedo-elite-14-gen1.dts    | 1486 +++++++++++++++++
>  2 files changed, 1488 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/x1e80100-tuxedo-elite-14-gen1.dts
> 
> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> index 296688f7cb26..598bf4c6e84a 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -350,3 +350,5 @@ x1p42100-hp-omnibook-x14-el2-dtbs := x1p42100-hp-omnibook-x14.dtb x1-el2.dtbo
>  dtb-$(CONFIG_ARCH_QCOM)	+= x1p42100-hp-omnibook-x14.dtb x1p42100-hp-omnibook-x14-el2.dtb
>  x1p42100-lenovo-thinkbook-16-el2-dtbs	:= x1p42100-lenovo-thinkbook-16.dtb x1-el2.dtbo
>  dtb-$(CONFIG_ARCH_QCOM)	+= x1p42100-lenovo-thinkbook-16.dtb x1p42100-lenovo-thinkbook-16-el2.dtb
> +x1e80100-tuxedo-elite-14-gen1-el2-dtbs	:=  x1e80100-tuxedo-elite-14-gen1.dtb x1-el2.dtbo
> +dtb-$(CONFIG_ARCH_QCOM)	+= x1e80100-tuxedo-elite-14-gen1.dtb
> diff --git a/arch/arm64/boot/dts/qcom/x1e80100-tuxedo-elite-14-gen1.dts b/arch/arm64/boot/dts/qcom/x1e80100-tuxedo-elite-14-gen1.dts
> new file mode 100644
> index 000000000000..0bfe5931434e
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/x1e80100-tuxedo-elite-14-gen1.dts
> @@ -0,0 +1,1486 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) 2023 Qualcomm Innovation Center, Inc. All rights reserved.
> + * Copyright (c) 2025 TUXEDO Computers GmbH
> + */
> +
> +/dts-v1/;
> +
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/regulator/qcom,rpmh-regulator.h>
> +
> +#include "x1e80100.dtsi"
> +#include "x1e80100-pmics.dtsi"
> +
> +/ {
> +	model = "TUXEDO Elite 14 Gen1";
> +	compatible = "tuxedo,elite14gen1", "qcom,x1e80100";
> +
> +	aliases {
> +		serial0 = &uart21;
> +		serial1 = &uart14;
> +	};
> +
> +	wcd938x: audio-codec {
> +		compatible = "qcom,wcd9385-codec";
> +
> +		pinctrl-0 = <&wcd_default>;
> +		pinctrl-names = "default";
> +
> +		qcom,micbias1-microvolt = <1800000>;
> +		qcom,micbias2-microvolt = <1800000>;
> +		qcom,micbias3-microvolt = <1800000>;
> +		qcom,micbias4-microvolt = <1800000>;
> +		qcom,mbhc-buttons-vthreshold-microvolt = <75000 150000 237000 500000 500000 500000 500000 500000>;
> +		qcom,mbhc-headset-vthreshold-microvolt = <1700000>;
> +		qcom,mbhc-headphone-vthreshold-microvolt = <50000>;
> +		qcom,rx-device = <&wcd_rx>;
> +		qcom,tx-device = <&wcd_tx>;
> +
> +		reset-gpios = <&tlmm 191 GPIO_ACTIVE_LOW>;
> +
> +		vdd-buck-supply = <&vreg_l15b_1p8>;
> +		vdd-rxtx-supply = <&vreg_l15b_1p8>;
> +		vdd-io-supply = <&vreg_l15b_1p8>;
> +		vdd-mic-bias-supply = <&vreg_bob1>;
> +
> +		#sound-dai-cells = <1>;
> +	};
> +
> +	chosen {
> +		stdout-path = "serial0:115200n8";
> +	};
> +
> +	gpio-keys {
> +		compatible = "gpio-keys";
> +
> +		pinctrl-0 = <&hall_int_n_default>;
> +		pinctrl-names = "default";
> +
> +		switch-lid {
> +			gpios = <&tlmm 92 GPIO_ACTIVE_LOW>;
> +			linux,input-type = <EV_SW>;
> +			linux,code = <SW_LID>;
> +			wakeup-source;
> +		};
> +	};
> +
> +	hdmi-bridge {
> +		compatible = "asl,cs5263";
> +
> +		pinctrl-0 = <&hdmi_hpd_default>;
> +		pinctrl-names = "default";
> +
> +		ports {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			port@0 {
> +				reg = <0>;
> +
> +				hdmi_bridge_dp_in: endpoint {
> +					remote-endpoint = <&usb_1_ss2_qmpphy_out_dp>;
> +				};
> +			};
> +
> +			port@1 {
> +				reg = <1>;
> +
> +				hdmi_bridge_tmds_out: endpoint {
> +					remote-endpoint = <&hdmi_con>;
> +				};
> +			};
> +		};
> +	};
> +
> +	hdmi-connector {
> +		compatible = "hdmi-connector";
> +		type = "a";
> +
> +		port {
> +			hdmi_con: endpoint {
> +				remote-endpoint = <&hdmi_bridge_tmds_out>;
> +			};
> +		};
> +	};
> +
> +	pmic-glink {
> +		compatible = "qcom,x1e80100-pmic-glink",
> +			     "qcom,sm8550-pmic-glink",
> +			     "qcom,pmic-glink";
> +		orientation-gpios = <&tlmm 121 GPIO_ACTIVE_HIGH>;
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		connector@0 {
> +			compatible = "usb-c-connector";
> +			reg = <0>;
> +			power-role = "dual";
> +			data-role = "dual";
> +
> +			ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@0 {
> +					reg = <0>;
> +
> +					pmic_glink_ss0_hs_in: endpoint {
> +						remote-endpoint = <&usb_1_ss0_dwc3_hs>;
> +					};
> +				};
> +
> +				port@1 {
> +					reg = <1>;
> +
> +					pmic_glink_ss0_ss_in: endpoint {
> +						remote-endpoint = <&retimer_ss0_ss_out>;
> +					};
> +				};
> +				port@2 {
> +					reg = <2>;
> +
> +					pmic_glink_ss0_con_sbu_in: endpoint {
> +						remote-endpoint = <&retimer_ss0_con_sbu_out>;
> +					};
> +				};
> +			};
> +		};
> +	};

Have you seen the new charge limit properties? Might be a nice thing to 
check out for a next version, see [1].

Link: 
https://lore.kernel.org/all/20250919-qcom_battmgr_update_new-v6-1-ed5c38867614@oss.qualcomm.com/ 
[1]

Kind regards,
Maud

