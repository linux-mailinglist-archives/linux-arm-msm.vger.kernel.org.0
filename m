Return-Path: <linux-arm-msm+bounces-118214-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id OEEjCYa9UGqg4QIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118214-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 11:38:14 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 924CD739260
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 11:38:13 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=outlook.com header.s=selector1 header.b=k0K5vRub;
	dmarc=pass (policy=none) header.from=outlook.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118214-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118214-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 69EBE3017BD8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 09:32:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2EBCE3F4DFE;
	Fri, 10 Jul 2026 09:32:27 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azolkn19012054.outbound.protection.outlook.com [52.103.10.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 987A03F1AC8;
	Fri, 10 Jul 2026 09:32:25 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783675947; cv=fail; b=Oz155CQ6PvTeQFUCN0nrkrhjKecSPU1/D38d1Cttj8grNvq6UDkyCTcJHCUf+CwmcQ5OziBIC35lCBflVfR5lR3GW1PL6QxgBpdfakwE70YMrejDUX9DVQQPiqVf1dKHTyLKE0ZUzh1joIR+0/ZzQRaNDyDcswMAmKPgk8NmjnY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783675947; c=relaxed/simple;
	bh=aWzXueH88SGkwIkGHX+eVWP8uaek/FR1CfhySoReIb4=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=brlCrL6ukBUPygSA56C7mjxc+AOeBeM6xEa10U5hIsJxeliTqpeWZKExnSMJm1PV4pRuMTtpei56WDvDCCybLhJ8YAhLnFvyYWEkhbNj6P7s9X2587MuJ4W24AikYJMLDzg7cxSZ47NtJAzpNMo5A1wu5phVHtK2rg/NQWDmWeA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=k0K5vRub; arc=fail smtp.client-ip=52.103.10.54
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HqvRqdyHnouWLOUbki5x+s9b21aILWO+jAVsZf1sva6av0F0/2G7yfTWYYaalFu7cY79sOYC8vmvoasai1xWwHmpgGMKRyPjugiwlkBcRgV6isWklXm7iesm/McqAgR7OxCJhlYy/lxJSX2mAxIPljxe/ozmMbu8God52CdBAD1Aa+gmoy2wI74fzn5epiTH3zCPnaOol2w9rqY0eceG8wX55dg6S5buF8Z3yVsFa6vqa38VsmaeZETBZSWVWGe1LEFlU3kMV/PCHgbbMyet8KobaLGgdYNYEBN86OhR3U2j83M6Wctl0ILJrG/R8OtxAmex9z5/+FkRoyZ6MTD3Jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/SXKAgYPp/Ql+gr8bMcDe0XB7G/ZuWFh/IjVNaGUHD8=;
 b=QQPtr5/5bY5Xeah6NPBGhgietQvpraey5sCiUVjNitBHC400ziesbla5+epLEaKcWJYwcwQpE6BpfpnMr2PnnrELvSUPGIOS8RAWRqOZz8ymvqOfVOjZmRgJukKreeQA5cWVeK7o5O2QdzHteDSBl5XU0r3NdpoJhApigI5llQXk8uKNH+yV3RO95/NXUNX1y5xGhT159f8YBP/3w2CROJAb4ZSR5454lQlVnW/i5buzDajNiluN3wbZKWlvrlEgyIvSQtCqB//Ijd2lgvFbmKOe7dby9pT7H16ZV7FhGwmplLZfAqNanwrop8B46m/MabHziYMr7XSvqSXUv7vh4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/SXKAgYPp/Ql+gr8bMcDe0XB7G/ZuWFh/IjVNaGUHD8=;
 b=k0K5vRubywNbjamyV0T4+HfpzHkvEP/OMPHPtWLoOfv7Kd2G+/ueSKMiSZKk2aIzHJK548AW6riVIX5TGnRrYjKeUXpZq9p676gSel54mr+worGGJA5z4EBaxcQ0SiQcdekPLus+A3w7089sTC8C6nKRvjYsODkeZ3nMqYqswo04EFgUykDksOtLZG8gPdvhlhGUQNLnKnLJx+/xeFTe3WuRjNjMOjVn8ZvDLEpi8qerpp7WgvGxw/AktGgMaSCbCUeH0bXxNM6ixyTBkTq52mSYczaT3lbpA16y1HP67TgWmiZLShOYVGy05/IlNYL9KZ8g9Fx+6RTsCdx2L7kx3Q==
Received: from SN7PR19MB6736.namprd19.prod.outlook.com (2603:10b6:806:263::12)
 by SA1PR19MB5230.namprd19.prod.outlook.com (2603:10b6:806:1a8::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.13; Fri, 10 Jul
 2026 09:32:21 +0000
Received: from SN7PR19MB6736.namprd19.prod.outlook.com
 ([fe80::4b6c:b84f:b71c:d0a]) by SN7PR19MB6736.namprd19.prod.outlook.com
 ([fe80::4b6c:b84f:b71c:d0a%3]) with mapi id 15.21.0181.009; Fri, 10 Jul 2026
 09:32:21 +0000
Message-ID:
 <SN7PR19MB6736D10971D569CC4F97F21C9DFD2@SN7PR19MB6736.namprd19.prod.outlook.com>
Date: Fri, 10 Jul 2026 13:32:11 +0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 5/6] arm64: dts: qcom: ipq5018: add node required for
 Bluetooth support
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
 Marcel Holtmann <marcel@holtmann.org>,
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Jeff Johnson <jeff.johnson@oss.qualcomm.com>
References: <20260709-ipq5018-bluetooth-v5-0-e476c41f03b8@outlook.com>
 <20260709-ipq5018-bluetooth-v5-5-e476c41f03b8@outlook.com>
 <11796dd7-11c8-45e3-8f9e-1dc27da0b229@oss.qualcomm.com>
 <SN7PR19MB673648D6C15A8E15D35F1E5E9DFE2@SN7PR19MB6736.namprd19.prod.outlook.com>
 <fab734fd-adfe-45b6-a10f-a8a25f7affb1@oss.qualcomm.com>
 <CAMRc=MccvtBxJaddbX0PjjMpV+6iwZeYf2ebq953msbMeVN=Aw@mail.gmail.com>
 <c75c88bc-3aba-44cb-a530-1d994bcd8954@oss.qualcomm.com>
Content-Language: en-US
From: George Moussalem <george.moussalem@outlook.com>
In-Reply-To: <c75c88bc-3aba-44cb-a530-1d994bcd8954@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
X-ClientProxiedBy: DX0P273CA0010.AREP273.PROD.OUTLOOK.COM
 (2603:1086:300:26::16) To SN7PR19MB6736.namprd19.prod.outlook.com
 (2603:10b6:806:263::12)
X-Microsoft-Original-Message-ID:
 <c7babae1-91e1-4666-9ad1-24f582a1f70e@outlook.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR19MB6736:EE_|SA1PR19MB5230:EE_
X-MS-Office365-Filtering-Correlation-Id: 247e9b9f-f9f1-4b7a-03a0-08dede6623f3
X-MS-Exchange-SLBlob-MailProps:
	Om8TgR6f4EDKwbHiBQa7ExePO6wqvFC1V6tSpLHNpEtyml6v3Tprz/IU3aYz/Niqmc8TMAi1NYweclbewc8hI+h2osAfWXlDLE3MBU8bZ+zkpsGB78PgJlYk0JcXlUxSfMeB3kd2xBHXqTGQTCLeucX/7G7EruWULSs2a0/bizpxItRON9ABNZ8A9cQinW+mXZC2mrlnQ0BcVfxNWU65IsTMibbj5OEYkb2BSkK51XRBmUwbtRtoIulteNlqXw+cas3MVDXcQtntu1AerTNQhO/scoQqdyAr/YWWA4DWmF/HS2vvZcX/xStjXR+vDJ4JeRsWrQHH06GqoaGLgthhGZN9+7jxhzMjQRTIYgTYb/i7vtj4ll4TRll7jhcAVRekStIaFhlW4DaJgqduob2jayztaXpXapK10uLANN5haOdpKgW1uXusdsLgogpQS79q0XmXLLaA6TnKjitb+sFwbmW2XBx9BBtoNAoU3ZnFhorvI2InGphMV+qDvGxIezDSHQgK3RFEJLAglLOFSN7SNzFLdrv2temNluRiv+qPFr1Oih7oH5r7PWrVp6s2sTn3CcMX2IYUh4X2LsZckZZz9wI3/TioeRn+V/vGIkTYQMRnCherc6C2LQgmURx1ulA1Z+JjaRs/jwUo7Xi03j5tSBKg3YI3TjKnbWEtYRe7jvpat/cSrvNOdz/Mf4MM5+XTdpAVgnzbKzEkr7kDsdKIppYIIEVh01y4thumrAARijwloarNTXSMN296LmcDVQhX/UALMPgOLr9SAkmqAd0eb4VABkP5TXHJRTzhY+L1rs7frIb9IAWzZjWPvpwKjnOHMls2tYilj8gwH6kkTVhjSVjHjS38wmiW
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|8060799015|24021099003|19110799012|6090799003|23021999003|25010399006|37011999003|5072599009|4140399003|15080799012|51005399006|10035399007|40105399003|1602099012|56899033|440099028|3412199025|4302099013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cjN1aHloNlFENlJDQWpvRGY5djI1VFZqTVJ2eHZQckdRVHJoZGhXYnNYL1BT?=
 =?utf-8?B?Q1lHaXdWMlVFbzliWTRlbkVMZ09JRktkazBTRHRMSWgxMmt4dVE4N0srVmlU?=
 =?utf-8?B?SWhZbGgyT3pRODRDQlhYQU9IaXdnL0xSWVc0TWVrTVAxdlRJWkJ5M1BWME9G?=
 =?utf-8?B?QTFLVXFnVGJITmlMWXZ0THd2KzJuMlVBVnVnQVEwbWZWUEFRT3ZJQ0xYTDFm?=
 =?utf-8?B?OWFySlZOTWg4V3dvdlNHaWw3QU5SbkNjYm9GNDFlNEVhSUVKVU03WFh4Rnd2?=
 =?utf-8?B?bHNKUU96MjRZNmx1YldLQkkxTittNHJtWG9wdWJUU1pvZUJiekQxdDRhcjh6?=
 =?utf-8?B?VUZzbndMekZ6aUwwV1pxZDVJNEllM0FQUkpLcUNMU1JRUUpLdzNuRkxjTTFC?=
 =?utf-8?B?bHRKQVFjNDJNc2RFMGFtdWlFTXJjQTdOOW9EYVR1NDU5UjBpb2NaVDR0ZGZz?=
 =?utf-8?B?U3MzQnhiaFBITmtoOWVMSFJZZzFYWUlxb2pNNlFjVmwvUndHREFSK2lCT1lF?=
 =?utf-8?B?VUJvQXM2QWN0VzhJTTgzQkY5emloTFlFMDdWSVZReENIanR6VUh4R2ZXbXNR?=
 =?utf-8?B?MDc0aDlNZG5Xclg3bXdSeU9LVCs3TWRzeFk5OVFzNEEwellWd0o3UkZmbzdq?=
 =?utf-8?B?S2g1VGI0R1ZHN3FvTFg4UTJlbXpZelNNM3RVNyszKzZvaXBPNUo3SmRCbm1p?=
 =?utf-8?B?NUVabmRrd2lkYXJpOXNJd1IrdEtHV1JhZzRTNy9mbzh4UFc4Z1FkZ05jUXZk?=
 =?utf-8?B?Z2kxU1NmNmNlQ2JTeFI3a2xXN1hzaHBNdGhCZXdxdU5LUFJLVGJHYkkvUHVQ?=
 =?utf-8?B?NUJQNVFRUS9rRGFDdk1vRVorTjNqUEdhVm1uL2JIcG9hL3N5RnAvNkl3ZDNC?=
 =?utf-8?B?ekNjN2szTko0di9hRVM1NFExTDRJaG1paVhRMDhRc3o1cG81WXlGdnJkTUdX?=
 =?utf-8?B?MzlGL2FlSWVIOW4yQXo3YTI0SndCQ0w2ZHphK0JxYzFOTkdUdnpiSUk4cG84?=
 =?utf-8?B?TC9ZbUFZZ0h6WUd5ZU0rYUtjY0YxcFB1VGYyZjlJaWZFOGZTVHl4M3hDNDhr?=
 =?utf-8?B?OXRRbVlqbGorcW5mbXRRVEcwU3pRL2dtbjlZd2F1OXh2U2xCYjN4dHhEWWZM?=
 =?utf-8?B?Qjh2dW5HaEpTLzdod1AzTXdjbkJaY1krek51ZWJBVUFwSmozbHNuM1FERjB5?=
 =?utf-8?B?d2RLdzdBdGMrZnBWRStDSTJpLy9OTy9lSlRJQVdabitOMDZKa2pscWc5em92?=
 =?utf-8?B?NUZGRDlMT0Y4YUNiM3cvZ1ptY2xxTmhwQ285T0RuVENnZm1sRDlpSEI2dEM4?=
 =?utf-8?B?eElVWFh5RG9QS1o0VFI5UW9HRUNkN3IvU1h5Nm1JUDZSQXhJRlJxbXJ1b1pY?=
 =?utf-8?Q?yzum/SSpoJ1LG/a7F+VAcF2nktJOHBHA=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cWR1WmJUT0VqV3QzMk1ZYWc1VkZKTTh5MXNQZ3VEUHViSlJ6azdDU1lqanoy?=
 =?utf-8?B?bEl2UlZRZDhYN2lYOXJjMTZteERyUEhhQnhLOThJZDBzRXhFbGNDRmhGVTZl?=
 =?utf-8?B?TW1BeWEzTm5LMVZYMzBMc3RQMUlkeU9yZ2FLaFFyOC8yc0NSbDl2U1MxL08z?=
 =?utf-8?B?VU0ydmN5d2FJbUZMamVpanBtc2Z1UnJUcEJWZ0QyMjdUSDlrYUlnM3VuaU1N?=
 =?utf-8?B?L1FxRU5ZRkRYaWZIOVdWY2hoQVVQQXQrYWxvZEdHc2lKMU1kSm5BRkRRR2Rl?=
 =?utf-8?B?OVhYTkdZSW9Ld1ltNnVrcHk5T05aaGUyaEhMZzJpUlIyclprRitmUkltZFE0?=
 =?utf-8?B?Y1R4dTU0MGRuWWlXNUFuejZ5Z0dWNHBrM2tqMkxVRy9MS1IrSDNndm1EbDJR?=
 =?utf-8?B?RUhOQlJLZHpoOTd0QVA2S2FPYUVXY1Z5aVpuVGZiQmU2SWtqUmY0a1lRSGlL?=
 =?utf-8?B?MVE1c0xudlBDenhCQVdSSjFLSDQxckxyTzJsNXcyM0xJT3JiTFlvRjZtdVRX?=
 =?utf-8?B?LzFnck90djdlb3pzQlAvQzdCbTNZSjRNNU00Y2V6NDRSS2dTSFJUZXBwSkJ0?=
 =?utf-8?B?cVFNeUNQUDNhTStwWktyVm5jQ0R4S3BBWElUbEN5ZDVCQjNWWmIycU5rNjUw?=
 =?utf-8?B?MitBUjMzc1VJck5DbzhPUkh3c1YwTXFGbXQrbUQ1TDBCZFVlS3BEQnRiUlEv?=
 =?utf-8?B?N001aWszWU9BWEhLVlAwcGQvL0xYcjJ6MEFkWm9EMmNaTTJ0b2FHTUFiNllW?=
 =?utf-8?B?cEJ1eXYyeDRaNnc5N2x1OHpNUUsxSVdnYVdDczhKK1J4L0Jtd1hDNU8rck5o?=
 =?utf-8?B?Mml2emlxa1ZHOVJ2VG5LYjRkTHFXK1hpYU41b1FscE5nc1M1SnJvK2VHWVVx?=
 =?utf-8?B?cCt4aXZDQ1VTMEhFanZKZnFGc3RSTnJMdkJtYk9OTFRRVWQxRVgwY2xjeWcw?=
 =?utf-8?B?L0FMaE9LU1VtTUxGc1piNDgvdWFNeVZSZy92S3VBelB0dW5OK2RXWGJXVS9B?=
 =?utf-8?B?N1NHSWk4SldtZDcyT0VhNlhkT3NpSVBmSWdvaldMUWhwKzlkTHc5VXRoZ0Uv?=
 =?utf-8?B?UklmMzNJWjgrTDlBV0kxNml5d0pTSkFybkp4Z2pjdHFITHpRY3plRHJrbVdL?=
 =?utf-8?B?L0l4Qnd1aGVSYzRUVGNOUWd5Q2djWEVGNDN1YTFscDBsYXlBSE9yckgxWWRa?=
 =?utf-8?B?VmVlaVNxeFFCeS9QcUIzL09LZWZPU2FmSHJib0o5Sk5TUEFxNklPcGg1OTVr?=
 =?utf-8?B?Nk1obTNFTm5laW4vTG5od2JQM0Q5Tkd6NFk3Kzg0TkROK1NCQTMwV21oODQ5?=
 =?utf-8?B?S2djK2FPOFhmTVdHelVEbGd0ZW5DL0t5VGdHYkkxWHBCSWY4bzY1ZjNOME9D?=
 =?utf-8?B?S3U0RWx6UHgxM2NHOVFCbW1ucXBjcTJTWnpHL1dWSHRCZHI4VGIvOEJDd3Uw?=
 =?utf-8?B?cEdFdW9nYjJEaHYyVE1FR1VDbmVlQ2xtU3k4ckl2aEFseWxXUnFjTVBwbDY3?=
 =?utf-8?B?UmxjTm45SW1ZWWRlS0s0VEpGV0ltZitqVk5mRUVzNTFKd1ZwQjVDTHFrSHQx?=
 =?utf-8?B?VjZnQm5HVkJyaTQ2UTQrUVBBRmZ4enZoOEtrNXI2b1dYM0l5NDBBTEo4Tnk5?=
 =?utf-8?B?NGNDNlgxU1UvL20zenozWEt4UGhIb09FZUM3SmxVSGhUZDIzb2toMUVTM2Ji?=
 =?utf-8?B?TlFDYXZEQkUrWTZFK3RQb2JFMmxnNmpEclkxalJ2ZFZ2STVVYjlCR0RXeXMx?=
 =?utf-8?B?RXVZaDEzYmdUWnZsSVZjek8vUXp6amJXQXhxUnVSTzZWdVNESHR5SS9qRHB5?=
 =?utf-8?B?cE5hY2Fib0tHdWN3RFVneHhnSG1hS0JKYklsc1dad1c5Vm5aQW1aM0k3MXlI?=
 =?utf-8?B?UGZ4c2pXQVRaMnZyRis5NzFzOWR0Rlp4OU5naTJQdWRqQlE9PQ==?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 247e9b9f-f9f1-4b7a-03a0-08dede6623f3
X-MS-Exchange-CrossTenant-AuthSource: SN7PR19MB6736.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2026 09:32:21.2729
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR19MB5230
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[outlook.com,none];
	R_DKIM_ALLOW(-0.20)[outlook.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:brgl@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-bluetooth@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:bartosz.golaszewski@oss.qualcomm.com,m:marcel@holtmann.org,m:luiz.dentz@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:p.zabel@pengutronix.de,m:jeff.johnson@oss.qualcomm.com,m:luizdentz@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[george.moussalem@outlook.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[outlook.com];
	FORGED_MUA_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-118214-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[vger.kernel.org,oss.qualcomm.com,holtmann.org,gmail.com,kernel.org,pengutronix.de];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,outlook.com:from_mime,outlook.com:email,outlook.com:dkim,qualcomm.com:url,qualcomm.com:email,SN7PR19MB6736.namprd19.prod.outlook.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 924CD739260

On 7/10/26 13:23, Konrad Dybcio wrote:
> On 7/10/26 11:14 AM, Bartosz Golaszewski wrote:
>> On Thu, 9 Jul 2026 20:40:04 +0200, Konrad Dybcio
>> <konrad.dybcio@oss.qualcomm.com> said:
>>> On 7/9/26 8:25 PM, George Moussalem wrote:
>>>> On 7/9/26 22:17, Konrad Dybcio wrote:
>>>>> On 7/9/26 11:18 AM, George Moussalem via B4 Relay wrote:
>>>>>> From: George Moussalem <george.moussalem@outlook.com>
>>>>>>
>>>>>> Add node to enable Bluetooth support on the IPQ5018 platform.
>>>>>>
>>>>>> Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
>>>>>> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
>>>>>> ---
>>>>>>  arch/arm64/boot/dts/qcom/ipq5018.dtsi | 16 ++++++++++++++++
>>>>>>  1 file changed, 16 insertions(+)
>>>>>>
>>>>>> diff --git a/arch/arm64/boot/dts/qcom/ipq5018.dtsi b/arch/arm64/boot/dts/qcom/ipq5018.dtsi
>>>>>> index 6f8004a22a1f..8c252fa3ff5b 100644
>>>>>> --- a/arch/arm64/boot/dts/qcom/ipq5018.dtsi
>>>>>> +++ b/arch/arm64/boot/dts/qcom/ipq5018.dtsi
>>>>>> @@ -453,6 +453,22 @@ tcsr: syscon@1937000 {
>>>>>>  			reg = <0x01937000 0x21000>;
>>>>>>  		};
>>>>>>
>>>>>> +		bluetooth: bluetooth@7000000 {
>>>>>> +			compatible = "qcom,ipq5018-bt";
>>>>>> +			reg = <0x07000000 0x58000>;
>>>>>> +
>>>>>> +			firmware-name = "qca/bt_fw_patch.mbn";
>>>>>
>>>>> Hm, rethinking this, it must have ipq5018 somewhere in the name
>>>>
>>>> I agree but all QCA BT firmware and rampatches are published in the
>>>> /lib/firmware/qca directory, see:
>>>> https://git.kernel.org/pub/scm/linux/kernel/git/ath/linux-firmware.git/tree/qca
>>>
>>> +Jeff, Bartosz?
>>>
>>
>> I'm not sure what the question is. This particular blob doesn't seem to exist
>> anywhere in linux-firmware yet. I agree, ideally the platform name should be in
>> the firmware name so let's upstream it to linux-firmware as such? Am I missing
>> something?
> 
> That's what I'd like to happen - just wanted to make sure you're in the
> loop, so that a platform-specific MBN doesn't end up with such a generic
> name in case that was the plan.

Perfect, kindly let me know what the name of the MBN that will be
upstreamed to linux-firmware will be and I'll adjust the name in the
next version. The current name was taken as-is from firmware images
distributed to vendors and as available in code.qualcomm.com.

If it will be provided as MBN format, shall I remove support for loading
MDT in the driver or leave as is?

> 
> Konrad

George

