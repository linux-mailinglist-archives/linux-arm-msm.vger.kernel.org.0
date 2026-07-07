Return-Path: <linux-arm-msm+bounces-117182-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 6OjKHsK2TGpNogEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117182-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 10:20:18 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 329C6719028
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 10:20:18 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=outlook.com header.s=selector1 header.b=nUeBu4LV;
	dmarc=pass (policy=none) header.from=outlook.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117182-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117182-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EB54E300957E
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jul 2026 08:15:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E142830C14E;
	Tue,  7 Jul 2026 08:15:53 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azolkn19010029.outbound.protection.outlook.com [52.103.23.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 759D51F4181;
	Tue,  7 Jul 2026 08:15:52 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783412153; cv=fail; b=jgwfoEUZuP4JBBFZCnY9087WqZAXko02Ebvk30mKKyI/8g5lMB5LaDGkvFlW9oTf2nIezV45ujZRIenOLQW1YpsZ5PqcdWsny+PxYSVBsP6XSZfzuns68OnNrT5VCUrLvEkxTQO6fgKSJ/Abtn6zfF978xViMzxYMX/Ic4hzzc8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783412153; c=relaxed/simple;
	bh=ggPFDVpy9jcWbUZ/wdhXhCeqmLkrp5sesX2LBJp/y2Y=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=UAYwOtQVVlkNhb+0S84DJeA1IWYvjQxnnnumjJ5FaWmzQrPgk8MOvPCbl18RExxYwMXI4GQyUZ1ZDgvIHyhePEjjV+cabRsY/czWPdzd254+iFgnS20GJzbi/nmfs6rJz9aIB8ZFi5eajwXM88I3wGAyNQK5EwmCDu1F3k5yaVY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=nUeBu4LV; arc=fail smtp.client-ip=52.103.23.29
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wpkehWEgabDNALwzxYd3+ooihb26itpwc/b536BEPCjFoZb+JTrVbBVv5yjitClrX8RtYoofemUxDpulHuaKNiVn08JUPrWoPpJSQNgkjWuKVx6iGYhnK0zX1XXh8r7cackm2q2JrpKbxsYeyE0qnYN45X0Ip7HgE2B+f4/xgk1FN0xfTxJF1tDSqPMD4psBVxi4SgNI30vyQDQvqxexi7Ek6QC99k8IdS3spl7vxNeWQONxrj+qbSlSWG/zSesW1ck0Hzy8Jm1/67N6KKIrr64/1f4ps9bydXIgqh3Wst/cgUR3YZkIr0+MWh/U1k3hdp5fSV5B3zUXlN6q+lu+8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a3sMzpI6Z5KXdUeQFXZ5Fk4Lr3mFt5jQ6HoAwdZuuI0=;
 b=eobi3ONtmZgwtrRy/DZVujjAnPtR0CzSnZB2SuxvNw25P1lc0hem+Q2jc3z9NVPx1aLsnYeSh6HUw2tdGmO6hystgwElJZjYnYLgUcRCWBN5nb8nw++B5DYqr4DpXh4XjriivWm5+NbVigNO+BHCstgQ7qIIJN7/FV5f2fG++qSE09Wa0ig+H80VU+cMPgjb5BklDt/Owd678piqGOkYRK/GhOdUbPbrTx5+9+edaQ5y1BKZbDzThbaoP21WJjmetZoM2zAHFWiV7TSIfZasCynY9kju6vTtRrUZbDO2UOZieo1O4uCI4wzoiaXN37cirERJcaLg+AuCP6jye+7fZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a3sMzpI6Z5KXdUeQFXZ5Fk4Lr3mFt5jQ6HoAwdZuuI0=;
 b=nUeBu4LVUBUTS9bFazAmTBnotIu2QPCrgZF3qc8lJoOrSL9B6p5/3ZuApuQDJpzIMDFpsEPaCzcDlLR0/OjZqpB6rk0lg05V4eqdfTJ2Edc/zPFGF01Pol20upFbqrQMv67zuZWRaxlOdzBWpmR527tXHPCzXGzMkx48sNZgNZ10FPhyzpDPT85w+grluKPEVsl+0/OlkaO6zaRgGwGf+TkhaVMnt3DCAkNFx5R9gMovbbUE4xLo3hhL8WKZjrYjARSNT56IXo0mxXPRlVEp4dOXyYgUI8fOv7mACHPUqNs5mwjrAomBNolxy3lmWfa0wN2VRODNjxBBg1vdI6CKHA==
Received: from SN7PR19MB6736.namprd19.prod.outlook.com (2603:10b6:806:263::12)
 by PH3PPF5A0A43913.namprd19.prod.outlook.com (2603:10b6:518:1::c22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.13; Tue, 7 Jul
 2026 08:15:49 +0000
Received: from SN7PR19MB6736.namprd19.prod.outlook.com
 ([fe80::4b6c:b84f:b71c:d0a]) by SN7PR19MB6736.namprd19.prod.outlook.com
 ([fe80::4b6c:b84f:b71c:d0a%3]) with mapi id 15.21.0181.009; Tue, 7 Jul 2026
 08:15:49 +0000
Message-ID:
 <SN7PR19MB673684C528B9276CF0A828A29DF02@SN7PR19MB6736.namprd19.prod.outlook.com>
Date: Tue, 7 Jul 2026 12:15:40 +0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 6/6] MAINTAINERS: Add entry for Qualcomm IPQ5018
 Bluetooth driver
To: Bartosz Golaszewski <brgl@kernel.org>,
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: Marcel Holtmann <marcel@holtmann.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, linux-arm-msm@vger.kernel.org,
 linux-bluetooth@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
References: <20260706-ipq5018-bluetooth-v4-0-350262a30959@outlook.com>
 <20260706-ipq5018-bluetooth-v4-6-350262a30959@outlook.com>
 <CABBYNZ+6BYa-CrC08piL++ysOomiWK2gbYAv3ecWwpE+RpsNOw@mail.gmail.com>
 <SN7PR19MB67365F06A4CC7405BD68AE139DF12@SN7PR19MB6736.namprd19.prod.outlook.com>
 <CABBYNZLLDMU1agbQJfL4T4GOTinkRyM76NDqiVHk_4+9KFohQA@mail.gmail.com>
 <CAMRc=MeBgKtsEvUC4gAd1qLgt_j3_AUZjU2H2tWj0RXuhARxiw@mail.gmail.com>
Content-Language: en-US
From: George Moussalem <george.moussalem@outlook.com>
In-Reply-To: <CAMRc=MeBgKtsEvUC4gAd1qLgt_j3_AUZjU2H2tWj0RXuhARxiw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DX0P273CA0013.AREP273.PROD.OUTLOOK.COM
 (2603:1086:300:26::18) To SN7PR19MB6736.namprd19.prod.outlook.com
 (2603:10b6:806:263::12)
X-Microsoft-Original-Message-ID:
 <b6e14dfc-5b9c-47b9-bec1-07494a0b506e@outlook.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR19MB6736:EE_|PH3PPF5A0A43913:EE_
X-MS-Office365-Filtering-Correlation-Id: 46ab4ac8-050b-4c3e-7f94-08dedbfff3e0
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|5072599009|15080799012|25010399006|23021999003|37011999003|51005399006|8060799015|19110799012|6090799003|24021099003|12091999003|3412199025|440099028|40105399003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bzNkK2FRWDd0Mm9qZzBTU1lSc04vUk1iSDN2TW43RkVqcjZ0bE14cFhGMGta?=
 =?utf-8?B?bnhvS3NZek9OUTFJa1QzbEcyaWxTMzhXUGdpTzFybEIyOFZxVHo3Y3dtMWpm?=
 =?utf-8?B?dkJHaHpNR1U3NXFXWU84dXRaWUw2ZGk4WklkSmRvMzFqYVU1ejQvMWZGbmdm?=
 =?utf-8?B?L3ZpNVMxRFVpK25tQTJPQllFSzc5am94VGdiOTJGejh3UjFPUHVkMlBPNUpP?=
 =?utf-8?B?dTZlRTQvN1JhQ0RmWTExY3Roc2xYNG1KeEJ5dzJ3NVdXdE1Md1NkUEJVWHFo?=
 =?utf-8?B?bTRTOXp6RFBVTEZSZklrVHl4RHM2Yk9xNTNRSjI5ZHNGWmNURmlYVFJoanNW?=
 =?utf-8?B?Ung5clltNURSbnlISisyb0F4Tmd1V1JjS2pRTGFTL2NEOHNFb2UzUFlMdC9u?=
 =?utf-8?B?bG1WbFd1UngxcFh5ZGIvLzVMN0taUURRR1BPd1ZuT3poWlE2dUtndWJJKzB1?=
 =?utf-8?B?T2VFckkyWHF1bHRTWEdQS2MrNkVyTkRNQmpWcDRySjh6MlNjUFlCNDUrVXdT?=
 =?utf-8?B?VlhJLzFtTHZnN2xndTgzOUs2Si9WRDEwaHFFZHhTV1NhVzdwQmFsQkNjVnZF?=
 =?utf-8?B?alFnZXdDNlZzbjlUTWNLQlBqSGwxZEZDd0YxYmR5bXFVd0tObm9nU3YxTW9i?=
 =?utf-8?B?RDhkc2x1QmtzTFlEOTFRSGJicE9zUWJzVEluWDkwU0NZeHdrMXN5YWRWVlov?=
 =?utf-8?B?RWdya2lXQzVEdkZoZEdkUm9aS3R4aFdzVUsyKzN4TTRLWHM1RUJwZVc1NVZS?=
 =?utf-8?B?MGprZzJXcjRhdWRsRXowZHlCWDEwczRMb05FVGZUYnhEYXJjRFhyZmh4SjNj?=
 =?utf-8?B?bW1zbVJtWmxObEo5U2haRXBOckVDd2FiSm9KYWU0amFETkVTWXNERFFZM29W?=
 =?utf-8?B?TlZzcVh4UXBlbjg3cXhNYU1MNUNDVXF5emNPamtYL0NwYnVKMVdNbzJNY0Yw?=
 =?utf-8?B?UWt2a1hlbnBGSFlTc09wR1A5OUJrTnowaU9UeE5kNE5rTjZYL21sNEU2S2dO?=
 =?utf-8?B?eTQ4ZEJDS0dKd2NBRmZVSlFOdnloZUxQZXNsaVFxQ1JnbnViTHVqdHhTLzVk?=
 =?utf-8?B?QjlvUHY0dkZmV1prZlFyN00zblNCNUt1bmtGdmgwN2VPVEpLUFdFWkZ1ZXBz?=
 =?utf-8?B?U1NSS0hEem5iVFNjMjR0bGxrck9vWHpnSU1uTUJpdGNraHdXMXp0UXNIeCt3?=
 =?utf-8?B?aHA5YklET0s3WEpvZjJac2hncUViRndaMmNRNjB5Vm4rMnVCZjVXUWszTDdy?=
 =?utf-8?B?MzR6cmhlNE5yTC9JKzlRdVkySHArQjJGbVFHbG1uV3ZCb0ljM08yRThTYnZu?=
 =?utf-8?B?eWpGTUk2NlprNk9IVXJJd2FhNkJZK2JvZ0I3clJiaGhIRGlMSmNDOUNlVWRN?=
 =?utf-8?Q?s54loQxfrVkYYWY5Y0bFen4tg1HCw/So=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UjM3eHYvZjJrNmlDOUhzSFFOc1JiSHkyb2w0dUdTbUdHaWZ6NXhnQUN1TE1n?=
 =?utf-8?B?Y1k2UTUvNmRLZSs5MTIrbzErR3VaUW00NkkvTHczcVR2b1JsWXpIbi9kWURQ?=
 =?utf-8?B?OHJyOHRZc1V5SWN3L0lNeDdEbGlZZFRmYzRMa1FVOHRQWUN6YTlPSXc2SDJj?=
 =?utf-8?B?TE4yUGQwLzZLN0N1dXZ6cXZxc1pmV2tQU3V3L0xZNDVER0JnZDR1cGNMellT?=
 =?utf-8?B?Y3VXL1BSQXVuTHo4aDJ0cW1sWDlUMTE3ajdzR1ZuOW1zLytjR2VmRW5hYjJw?=
 =?utf-8?B?QzhRSWU5SHFBZG1SODU5TzNicTlESEIwZ0NlQm1FaU9NaDlUZitYMWVZeTR0?=
 =?utf-8?B?M3EwWnJ5ajJ1NXJPQ0pabmlid0ppR2NUZkxZNWdIZmNHbCtuSW9JSjZTbEFl?=
 =?utf-8?B?dkgxRGxPL21CNEphUThKYkpmbjZzeHhEdk5TakxqWFFoV3M5Um42Tm51WnMy?=
 =?utf-8?B?QXYyWGZUV3ZqQ0RmR0JOcVZ6WmQ5VGNENDR1Sy91K09nR3pXdUNFbGNsaVVO?=
 =?utf-8?B?K3lETFFjSFlrWU5RcHFKT1FPdHNaSG9JTG1tVm9YSGt6aE1BelZjODEwTndW?=
 =?utf-8?B?RzBxczhRWmxITStKWWJMWUdmWmRXSjZkcCs2UGhZdmhuSzduMVB2ZWlLQXM0?=
 =?utf-8?B?aXUzUU51bjl2T1hpQ0I2MnF0ZVFjaWNvT2F1emlESHR3d2JVN0RZUVUyVmFx?=
 =?utf-8?B?bStpY3BHZjZOTG1uQmN0Z0NaeVQ0Y1I0cXJaU1g0SmxpMUVBem5lYmRkNmQ3?=
 =?utf-8?B?Y21zMUNJejNCTmhsWnVPaGpqa0dPK0s2NXJPWFV0YjIyRzY2b3o1bGlVQWhh?=
 =?utf-8?B?L1oyNWsySEs0T2lSejBYUE9KY0pyc0tYS0JmVW5rRlpkM2I2S29iT1pweTI5?=
 =?utf-8?B?Z1VXK1hqQldyQnpBUzFXMXE1ZUpHZk9qR3kwS2FvdlpQRmdaUnhkNGVrYTh1?=
 =?utf-8?B?V09ZY3lxa0pLcFZyOFRSelhWR1ZVRFF1c2RYa0RzRXQ3OTZLQVJGaEtyVXNX?=
 =?utf-8?B?eFlBNlR0dDB4MVdXMzY1RldqOUYvOTdMNG1oUTQ4bm5IU094VjJrYWR0ODlz?=
 =?utf-8?B?VjF4QWJzanFNMlhTVkIydUxialJSQ1lTRkY4M0FDQW02UFRtbXQxMXRXUWNQ?=
 =?utf-8?B?MHVGRjhodDZHUDNiT0FFeXhOVDBFLzc1WURhbVpVdERuVWRrMlp1Q1JHMWlN?=
 =?utf-8?B?T2pkUTQvWmc3cVFZeFZlRjBZMGJpUW1VZkJxYWlwTWYxZDJoM0x2elArVkJX?=
 =?utf-8?B?OXZna2pPOW5nb20wN3ZLa0VnM2cvR2Y4UVdYUmIwU2l1M2lCK09FckY0S0pj?=
 =?utf-8?B?U2dCUGNVZUNCZk1ZVERQd211RVM4QjVXaHErcXBTVXZjL1k0TEtFZ2lTYURL?=
 =?utf-8?B?emdDdnZsditvdTUzbmtiVWhKN0VXOHFOYWd0ODV6a0k5SzZaTzFKSUE5QW9p?=
 =?utf-8?B?eVMzWnVqbk4xdkRXUGh0cEI0ZHBQaUV1Q0R5L29nY1BpVk5tN2dTclJrbmda?=
 =?utf-8?B?VDZkbDdOQjlMd1NiemVhRGhDc282RGt3TDJNejhXQVlqdllaZFdrTlhXTFY2?=
 =?utf-8?B?czdxMzF1NW1WOGwrUWlGbjRJNHR3Uks0VkxmQkRybzJUR2lIOXRQTzhxMy9i?=
 =?utf-8?B?NkhzL1QvS2xnYld1WUdRcDMxNjBoNWxGZnFMN3hoRnh3SUVqVzVicFJNVG9I?=
 =?utf-8?B?bTl5S1ZJTWxTQVE5QmJyQmoraW41S0I2OWdOZHhnckIvNitqZGFDNWNYMVN5?=
 =?utf-8?B?WFR2d1FrMGdYV2wyTEZ2MVp2bzh0L0hKM1dyODZUSFFCZHFqOTV5elIrTU56?=
 =?utf-8?B?OEdRaG9jdytvN2Fyak5LQWs0Zm9CNk16T2RRVlY0c2NyVU9wblRPeFRITTdz?=
 =?utf-8?B?SlMybnZaZTl1Wk03V0lubnBMUjV2WU5qdlJIczBVZ2dOT0E9PQ==?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 46ab4ac8-050b-4c3e-7f94-08dedbfff3e0
X-MS-Exchange-CrossTenant-AuthSource: SN7PR19MB6736.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2026 08:15:49.6826
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF5A0A43913
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
	FORGED_MUA_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:brgl@kernel.org,m:luiz.dentz@gmail.com,m:marcel@holtmann.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:p.zabel@pengutronix.de,m:linux-arm-msm@vger.kernel.org,m:linux-bluetooth@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:bartosz.golaszewski@oss.qualcomm.com,m:luizdentz@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[george.moussalem@outlook.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[outlook.com];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-117182-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,vger.kernel.org:from_smtp,SN7PR19MB6736.namprd19.prod.outlook.com:mid,outlook.com:from_mime,outlook.com:email,outlook.com:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 329C6719028

On 7/7/26 12:04, Bartosz Golaszewski wrote:
> On Mon, 6 Jul 2026 22:20:45 +0200, Luiz Augusto von Dentz
> <luiz.dentz@gmail.com> said:
>> Hi George,
>>
>> On Mon, Jul 6, 2026 at 4:04 PM George Moussalem
>> <george.moussalem@outlook.com> wrote:
>>>
>>> Hi Luis,
>>>
>>> On 7/6/26 22:36, Luiz Augusto von Dentz wrote:
>>>> Hi George,
>>>>
>>>> On Mon, Jul 6, 2026 at 1:27 PM George Moussalem via B4 Relay
>>>> <devnull+george.moussalem.outlook.com@kernel.org> wrote:
>>>>>
>>>>> From: George Moussalem <george.moussalem@outlook.com>
>>>>>
>>>>> Add maintainers entry for Qualcomm IPQ5018 Bluetooth driver.
>>>>>
>>>>> Acked-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
>>>>> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
>>>>> ---
>>>>>  MAINTAINERS | 7 +++++++
>>>>>  1 file changed, 7 insertions(+)
>>>>>
>>>>> diff --git a/MAINTAINERS b/MAINTAINERS
>>>>> index 0b9d7c8276ac..60f7251d1a16 100644
>>>>> --- a/MAINTAINERS
>>>>> +++ b/MAINTAINERS
>>>>> @@ -22289,6 +22289,13 @@ S:     Maintained
>>>>>  F:     Documentation/devicetree/bindings/regulator/vqmmc-ipq4019-regulator.yaml
>>>>>  F:     drivers/regulator/vqmmc-ipq4019-regulator.c
>>>>>
>>>>> +QUALCOMM IPQ5018 BLUETOOTH DRIVER
>>>>> +M:     George Moussalem <george.moussalem@outlook.com>
>>>>
>>>> Do you work for Qualcomm or have access to their specs?
>>>
>>> No, I don't work for Qualcomm and don't have access to their specs either.
>>>
>>> I'm purely contributing in the capacity of a volunteer.
>>
>> I appreciate the initiative, but we still need ACKs from Qualcomm for
>> code directly related to their hardware design. This is especially
>> true nowadays, as people seem confident enough to send code changes
>> done by an AI agent for hardware they don't have so they are never
>> tested.
>>
> 
> Georde: feel free to fold this driver under the existing entry for Qualcomm
> bluetooth drivers. You can add yourself as a reviewer if you want to be Cc'ed
> on future patches.

Thanks, will add a file entry into the existing entry. The bindings are
already covered by:
F:	Documentation/devicetree/bindings/net/bluetooth/qcom,*

> 
> Bartosz

Cheers,
George

