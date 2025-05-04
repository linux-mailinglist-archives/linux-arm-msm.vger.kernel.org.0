Return-Path: <linux-arm-msm+bounces-56677-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FBBFAA8471
	for <lists+linux-arm-msm@lfdr.de>; Sun,  4 May 2025 09:04:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ADAD83BC6FB
	for <lists+linux-arm-msm@lfdr.de>; Sun,  4 May 2025 07:03:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A583F18BB8E;
	Sun,  4 May 2025 07:04:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="lqTspYDq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10olkn2053.outbound.protection.outlook.com [40.92.42.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1970211C;
	Sun,  4 May 2025 07:04:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.92.42.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746342243; cv=fail; b=Mm6UA5gnqpraad1bQFR4ne6sf8gXea7CdDEBJXnFaCHSrSUKI1UX8EHRC1AK/7A0CPnyLyTSNRNFONqanHKz7thFpoxyYGliOGG9XRTvg36cfBvuj0s7jewa7w4z0dggQ/FyjidOuZsd2gRrAJiPDV5uT1uWmJLp/IPWeYyaeAw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746342243; c=relaxed/simple;
	bh=Xmp8Ej2IGIGf/MCOhdQHyHVsWA6GcilB4wKDMDvIv4Y=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=cTIc6hbJ8oGG+wODpKDOqd9mH/mT8jlpVZa6LB4smVWBWdJv/VoUxejbZRlY4VgbxtHcLMFYySpqgoK1URMuja1NUFiUieD2To6VvIFCoPtIhS5+rHnlHaub48QrGPoZC/S3goq22Wc+gW+bBKHqBG4UfD3arRLu9f0v7TpffRU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=lqTspYDq; arc=fail smtp.client-ip=40.92.42.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dtEUij1sI11UfG+p4z15ehYTRnD8Z9cs0eYcNfmrLyCenQ4Icmc5jeZQs9TCDX+cBgv2Z3QbiR4fbFqwXWgZ07Zvys1C/1sDaqGpZJRYK/TL2Xd8I1TwkyUCNaqCLylFfUM1rx/E+aA6xtow6bPN2IoezyR2VLmdS1YeXKTjg1Ji62Ekz87zugsm63qQ0ILwpmP2jjoRT3RK2j13Pa1mTwcYvIeYPgeovdeoQyXOWSs24bilJkJa8ggITinUgg2qG0JLNW+QEL3A+Ldw0ZuVEgKfDsWFul7GqsxVkpijzrEXQqhjpBNDEOM4mN5brSSpMzf0QkcAPJN4IVEUNpb5hQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TLpsfUclZkIcAAwAz2NiyF5ElAAzS9TkTto9fl6MVSY=;
 b=dryTTLaoHwahu+ObA2shbeqZCVlKz+4WiYH04Xy2ZspLHElaa9BFRCgTpOHmFtw7PJ9gbxBj/lCHD/cIRxzvGT0N9wFrFxGf1qCTFG6imjblER7WijMcXlzhfJZIpN600pfOq/jlPlbo/EKw33Aub3sjnas8+KBBKSr3fyeFUtXA+hNq0Cct0WPTAo4GYTcreJfoK53LOBifnlbWf2XQLjPBTvJXr1zflbntWcjMnxSYnttePMbEKal+SD2XBF0fhyavPjQNKV7i1wfHwkeI2zxar0lzLhdurA+9Q6xINTYSAQ80HQNeXWoZB1WFO4DYw936nXijNAQyad6C4raqBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TLpsfUclZkIcAAwAz2NiyF5ElAAzS9TkTto9fl6MVSY=;
 b=lqTspYDqBXHKIhxYSPC73Zf9AFwRRg014o16VQL+7gNrNVKQPq9hISEUAW+d0LdGe9ZMQULWNsvaWhpjXq5nvprzmKY5KuWJhetYYOtPuVjwwxYw+EmHc3+4cr3y/F/o2LIhFqOuop6w9ZTqm+Iv35KWvQi2cMxkeRS7Xf9RYTcd/gxC6vnuCBTELIxdp1rJxHTPsE1N+Xe+o4bUHedlQIDYXvAARG90wOEPznz8JoMeQJdJfhsQt8NLeETIajdlbfRYUZyIDkNXMv8FQWK8I3hN9hoHs9kH0p09qgpDsIb71c5bx6AHkfQ/fgZgxOPLd5znrYrqlqrYkVrhsqA5GA==
Received: from DS7PR19MB8883.namprd19.prod.outlook.com (2603:10b6:8:253::16)
 by BLAPR19MB4609.namprd19.prod.outlook.com (2603:10b6:208:293::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.20; Sun, 4 May
 2025 07:03:58 +0000
Received: from DS7PR19MB8883.namprd19.prod.outlook.com
 ([fe80::e0c2:5b31:534:4305]) by DS7PR19MB8883.namprd19.prod.outlook.com
 ([fe80::e0c2:5b31:534:4305%4]) with mapi id 15.20.8699.026; Sun, 4 May 2025
 07:03:58 +0000
Message-ID:
 <DS7PR19MB888331536B4AD7BA18EA106C9D8F2@DS7PR19MB8883.namprd19.prod.outlook.com>
Date: Sun, 4 May 2025 11:03:49 +0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] dt-bindings: clock: qcom: Add CMN PLL support for
 IPQ5018 SoC
To: Jie Luo <quic_luoj@quicinc.com>, Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250502-ipq5018-cmn-pll-v1-0-27902c1c4071@outlook.com>
 <20250502-ipq5018-cmn-pll-v1-1-27902c1c4071@outlook.com>
 <8f11c588-aba8-4550-9066-c6bdda0416d1@quicinc.com>
Content-Language: en-US
From: George Moussalem <george.moussalem@outlook.com>
In-Reply-To: <8f11c588-aba8-4550-9066-c6bdda0416d1@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DX1P273CA0029.AREP273.PROD.OUTLOOK.COM
 (2603:1086:300:20::16) To DS7PR19MB8883.namprd19.prod.outlook.com
 (2603:10b6:8:253::16)
X-Microsoft-Original-Message-ID:
 <ffdab2ed-1c30-49db-905b-3af5ee5cd037@outlook.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR19MB8883:EE_|BLAPR19MB4609:EE_
X-MS-Office365-Filtering-Correlation-Id: f29d40f5-21b6-4ad5-0486-08dd8ad9d69d
X-MS-Exchange-SLBlob-MailProps:
	Vs63Iqe4sQlVobdhjoRt/HQUSkoYJhJh1b3RoHk4UqbxedYZeyNhjk4wTeDkgUWWw3YAGywnbaJrPjmtQtf6OQs2HA3ANJfjofo7GG4ZczSyYt13AJXH7O+B6WBM29boT8+uRdv/aqWtmRocJQQMZKJ+wVukpSE6FYmwprI52CIeDs5RcCmcGvevIR7SW22LUdVZyXaA3FPQ/kJQP2i6UQjnt0XyC591Y8D7yIUEgTGLV+o4c+u7r+k8CbzoVE6C2K35XpNaAqoYM4BPobaLrxqRVUqdTfzWO9bGwVz1+dFCoci0YiVm3K6ubs+OJNH6+Rr8Ipxn8HkjUcbsfi+j7iWLgAagO1btuQZ5o/OO9Cu9ZpZ6NHllwX9rIPn6RjczGHZIy/SeKhtYBYFWLy6Z/G864TWcmX3Q5HgQFRsyjUkFgC/OUfg5JDVzmYSIzWAnrZ26oKLEW3VvaMltX0ynir3DI5+dAXbRtWhiJ6e3NIvCGAJ/bxdwQMC1CumLDa5y9TfgUyDxWqvjdHTEyRa421xW28Uo66odPsDz8WwmF/iG2zli2Lp+I+VNk2sdARWdDoTCqnTQ9ocMmMrrya8yid9wF8m9woV/Z8GsbU2uEHHqyCVAm9acsmtmGldKBFPkgKXPynKsAyP5ysOUbF2cQSBBbKZqDF3yS5tJm0bVGJ5OGQpeaVOLoCd6JyzdI1QYZT9T4CkUucJ+r0qmrwgEQPEbiI+9uwJPvZ3jWRwp8eY=
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|19110799003|8060799006|5072599009|6090799003|461199028|7092599003|15080799006|3412199025|440099028;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?U2MrVmx0ZHZFRUJBTTJINForeko2cFVmTGpIZFptaUFqY2RCMmFXQ2lyWVoz?=
 =?utf-8?B?UWwxQlRkZHpCbUhMUlBCdVoyd2pGTEpmbFZDZEdXUjJlcmV4UXBobmZ3b2dL?=
 =?utf-8?B?ZUVYOUY0NG51U1JtSEFsSnIzRFpmQXY4Z2I0T0dHT2d6VXdKbTdBcEwzYTZz?=
 =?utf-8?B?TEpEdGZ2R2pLMkZoRFIvekxHUmlSSGgxSlFNbDhkTXNHdnQxNmk1eTlqMUZD?=
 =?utf-8?B?ZFo3NWVKNCs5Wm02Zi9LeitKWHBJbU1tM3pYTHhnbHVLeTRiWERlK2tPb0FO?=
 =?utf-8?B?K3hJLzh2czh1Y0xOOWtNbWVVeS9TMmFpV1c1YkFpRExiZU9wcUhNZW8waGNk?=
 =?utf-8?B?YllLcEdSd1U0VVJjU2RtTm0rZ0dzcVVSMVJ6UXA1TUNoTmxYZDA2c1FSenZa?=
 =?utf-8?B?Sm9jRjdxaEF0UlN4SHdwN1piUWRoZW1JQlp3djZtOEdDWkdLZGpWbEsrUkdC?=
 =?utf-8?B?NTlUZW1zL2dMdVUvSnNqem5jS2IvNUR2blBaU1J2N3ovR0dxb1NMZGdDUEU0?=
 =?utf-8?B?K2pPTnFXcEtLZ215Qkk5WlFVS3QxRUwwR1RtQ0ZKSzR0RjY3Q3VKeWYrSW45?=
 =?utf-8?B?eEJtbVN0V053NWV5M2trS2RJK0ZaSHpVM3hzbnpwTjdPbjRIcmt6YkdXdlJI?=
 =?utf-8?B?MTBqNksyT2xZdXUwZFNVNVdZcUYyanI1QVBEODZmdWk4dWtPT2MyRTZnNjJP?=
 =?utf-8?B?TzY3VGVsOHdYNHF2dlVZcWk0T1p2UUxJNjJRS2RwWVBoN3lNeU1GdjdYSzN6?=
 =?utf-8?B?NEUybjFEY1VkaXdBVTRrVS9JZUVFSTljTllNTG5VWWFFNkJxSW4vd3hDZUNP?=
 =?utf-8?B?Wjgxb2R6R3RhdlZ4dWVJV0s5d1B6MnhVK0t1UkNlRjRaZ0hzb2VzMCs0NUlG?=
 =?utf-8?B?Q1lLZlB4MDNWekdxQVdHWEYvcFYzSXNnZHM0cHZLc0d2V1AzZHRkbWxTTDV5?=
 =?utf-8?B?S3ppUkx0WDZZeHY4U25TaUNNQk5DbFA3R0o3SkhPRzkvYnF3QWpadWZ2cEFP?=
 =?utf-8?B?UUZqYU1vWDI2L3pJeFQ4bUFUSWRVZ3pLTXNvVWdpdFdKcjBRY2V5cGhPRHVh?=
 =?utf-8?B?Y3dPa3pqSWZCYzNrQlpkOVA2ak90YUhQa2EreEJOTUdNUmtYQVpwa01hN3J6?=
 =?utf-8?B?aUFqRE1MQ29xQ1pIR3JDa3RSMTViZzhUWithT3ByT3Nkcm5yOVNzVy85WGFT?=
 =?utf-8?B?MXIvSXBFWXQvYm5EZ3krajNPWVI2Q29FWGF5ZlhUMEp6V1dzbFY1K2NTckVB?=
 =?utf-8?B?cEhOSktFTUViL0U3YlQxeVBGQzlKZzE0MXpYMXNMZ3U4R3pZdHpkd3htc2Rw?=
 =?utf-8?B?TFRIK1dGN0djZ0N5UlBNSVB2ajRKYzBHTW5ZU3hFc2VGOUJpL01vK3VxQVhV?=
 =?utf-8?B?dE4xN1l6Rk9NQTFLYXFDNEJtc1g2Wnp6dkU4dVpmbFJ3SGJVaS9FZGdWUGVL?=
 =?utf-8?B?NDdiQU5hZVVmR2RJVG92MXAwOVREQnZPV01YVExUU3RmVitoR0dzWTNhaUtS?=
 =?utf-8?B?ZkNLNlREbk8xS3Z3N0lIb1NYakhib3lHcFRISVIvYmxsZk56S29BNy9odGRl?=
 =?utf-8?B?UlJLQT09?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dHcyVXZUY2JiakVsTnkzb2FGWEtweU05eERmMURKaFdUSmpSVWIwTVFlMzNX?=
 =?utf-8?B?bjJ3aTluOWZFbld3N2QwTUNpbHpqUS9kenN5ZmRwQk52eXVLM0FKVmVrM3o1?=
 =?utf-8?B?dDFqSXVpMXBINTdLVzdxUkg3MnZYOTZBTVlGUkVXRXYzeEV6VGY4Rk5DVkp1?=
 =?utf-8?B?aDQ5eDdGM1B0R0Q0NWQ0OGM0L2FVdWowbFd3Mm50M3NUR3UyUk1jUVhYcTl6?=
 =?utf-8?B?b05IRkRESjVJV2RzbGhxVXBnYndCczFWQWVFUVFUOTFyYzI0VjFHQzRuMjFV?=
 =?utf-8?B?b1B6enROTmV0MU9ScVZtajJFOVlUZUJZUVJHSVVkb1M4UjhCUUd1QzhGMGY4?=
 =?utf-8?B?T1JvV1M0ZFliOTBNMjYwbmZkdHE1WHFOeVlKNDhnUmRZRzJiUklwRjd6K3JT?=
 =?utf-8?B?ZUNIY0dYOEdUbWcwTFh6Mm0yemJkcEo2S21CbTA4Yk9Ycm8vZThZVjRjRGxr?=
 =?utf-8?B?WUhINU1ORWZoekxOTkRIOWNBMncxcnhDWGg4WERKSlhiZnVqazEvTmJ0RGt2?=
 =?utf-8?B?MngwWWxCS3B0MVloRkQ4Z0hERHJ3YUFJbmJuUFhDZHFMN3psNnhYQStVVUsv?=
 =?utf-8?B?YWNVaWRzQjcxQjR6QUZjbVFpQXIzZzN4L1FiT2ZTakYyeVEzNVVxMVlXWHFP?=
 =?utf-8?B?OEJ0ZFIvMVJVWnRqS1NhQ2NJdE8yWDB0aWdLOEtDeVRzRW8rNmk2MnNDc0RN?=
 =?utf-8?B?cmdkMUVLZTliVlpiSlJiTmJ0YkVYQWQ0SmRobnM0TGEvZyt4UWRnaEs2TWRv?=
 =?utf-8?B?RlE0OHpyb1FrS2xJKzRQcW1adkdJeTFFdmt0VlYzMTNiT2VJMDd2Y0NhQWxl?=
 =?utf-8?B?Y0V0Wnp6R0V3WURtVFI2ZWpZMWZkSTZxbklZR3FiNll6QXhkVjdmRlB4aTl4?=
 =?utf-8?B?clhCT1pHUmlxNk5YYkJyR1pqNzhuaS9pMkIrSjd6YnFLbW1ycFdEQ0Jvd29I?=
 =?utf-8?B?N3liRDBaQUowNWZBQ3JEOUZQamJCcjZXeWNDY290NjNMUzZZcTJjeFZYMnNn?=
 =?utf-8?B?OUhnaTR1TmltUlk3ZXIvdDh1MU1jMFE2aE5EYW9PTHhHQXU5OVJ0WkVVMnVj?=
 =?utf-8?B?THhhNHNONG5PN2xNNWl2WVN3M0xPK2dxcmZVWlZDazM1UWI3N1EwM21aV0JD?=
 =?utf-8?B?em15UmhXUzI2OHB3SzFaYU9MYXNieE9VZmtvSjFmZ2ZtOUNqLzZJek82ZGNN?=
 =?utf-8?B?UGU2eGwyM2xtSkYrc0lGaVNjanl5TmIvV1krNmdEbnp6Yk5ndjV2eWpza3J1?=
 =?utf-8?B?RnZIenB6aFgzLzhGMW1mcGtJZ3BiV3l3ZmQyK1RxclBZR3RXSXdSNHdiWTNM?=
 =?utf-8?B?Szg0OFh2bTVic09MZUpMUFJxMHVsWVgyVnFnNnRZZTdCNzgvTHAyUTRvWUlx?=
 =?utf-8?B?ZjB0MFdSQmNTaUdONFZYdVJteUc3cm5XcXZvK1QyODFyUEFmakVyNjlCQm9z?=
 =?utf-8?B?V29kOHduSUlRVVBqRkx1NlVHTlFUdWNyYnJseXlCRFRNb3ZNeEtjdXlkc1li?=
 =?utf-8?B?NUI5QkNnZzA1Q2xMU3lNcU41QU5tTEQ2WDdJZWdlbkgva1A4cVgzNEpVSzg2?=
 =?utf-8?B?R2hNZzVlc1VGTGZFUVlva0kvZE9UemtZbkUyQ2ZaQzhVSjhYQkhXTmViZnF3?=
 =?utf-8?B?R3JxaDVuZTF6UGFENUR3TDhIWU9PYmFXMTM0SWxrSWtmbktNNUdNUHlkazdx?=
 =?utf-8?Q?5liwWbQ873TJs9ebDQ1a?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f29d40f5-21b6-4ad5-0486-08dd8ad9d69d
X-MS-Exchange-CrossTenant-AuthSource: DS7PR19MB8883.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2025 07:03:57.8152
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR19MB4609



On 5/4/25 05:49, Jie Luo wrote:
> 
> 
> On 5/2/2025 6:15 PM, George Moussalem via B4 Relay wrote:
>> From: George Moussalem <george.moussalem@outlook.com>
>>
>> The CMN PLL block in the IPQ5018 SoC takes 96 MHZ as the reference
>> input clock. Its output clocks are the XO (24Mhz), sleep (32Khz), and
>> ethernet (50Mhz) clocks.
>>
>> Unlike IPQ9574, the CMN PLL to the ethernet block needs to be enabled
>> first in IPQ5018. Hence, add optional phandle to TCSR register space
>> and offset to do so.
>>
>> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
>> ---
>>    .../devicetree/bindings/clock/qcom,ipq9574-cmn-pll.yaml  | 11 ++++++++---
>>    include/dt-bindings/clock/qcom,ipq5018-cmn-pll.h         | 16 ++++++++++++++++
>>    2 files changed, 24 insertions(+), 3 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/clock/qcom,ipq9574-cmn-pll.yaml b/Documentation/devicetree/bindings/clock/qcom,ipq9574-cmn-pll.yaml
>> index cb6e09f4247f4b25105b25f4ae746c0b3ef47616..25006d65d30e20ef8e1f43537bcf3dca65bae73d 100644
>> --- a/Documentation/devicetree/bindings/clock/qcom,ipq9574-cmn-pll.yaml
>> +++ b/Documentation/devicetree/bindings/clock/qcom,ipq9574-cmn-pll.yaml
>> @@ -24,12 +24,10 @@ description:
>>    properties:
>>      compatible:
>>        enum:
>> +      - qcom,ipq5018-cmn-pll
>>          - qcom,ipq5424-cmn-pll
>>          - qcom,ipq9574-cmn-pll
>>    
>> -  reg:
>> -    maxItems: 1
>> -
> 
> The property 'reg' should not be removed.

Moved it back, I unintentionally removed it. Thanks!

> 
>>      clocks:
>>        items:
>>          - description: The reference clock. The supported clock rates include
>> @@ -50,6 +48,13 @@ properties:
>>      "#clock-cells":
>>        const: 1
>>    
>> +  qcom,cmn-pll-eth-enable:
>> +    description: Register in TCSR to enable CMN PLL to ethernet
>> +    $ref: /schemas/types.yaml#/definitions/phandle-array
>> +    items:
>> +        - description: phandle of TCSR syscon
>> +        - description: offset of TCSR register to enable CMN PLL to ethernet
>> +
> 
> This TCSR should not be a part of CMN PLL, it is the LDO controller for
> the internal GEPHY in IPQ5018 SoC, which can be moved to a part of GEPHY
> device.

I'm preparing a patch for the ipq5018 GE PHY too so can move it there. 
Can you confirm the uniphy isn't dependent on this too? There are boards 
out there which don't use the GE PHY at all, so if the uniphy depends on 
it for SGMII/SGMII+, this approach wouldn't work.

> 
>>    required:
>>      - compatible
>>      - reg
>> diff --git a/include/dt-bindings/clock/qcom,ipq5018-cmn-pll.h b/include/dt-bindings/clock/qcom,ipq5018-cmn-pll.h
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..586d1c9b33b374331bef413f543c526212c18494
>> --- /dev/null
>> +++ b/include/dt-bindings/clock/qcom,ipq5018-cmn-pll.h
>> @@ -0,0 +1,16 @@
>> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
>> +/*
>> + * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
>> + */
>> +
>> +#ifndef _DT_BINDINGS_CLK_QCOM_IPQ5018_CMN_PLL_H
>> +#define _DT_BINDINGS_CLK_QCOM_IPQ5018_CMN_PLL_H
>> +
>> +/* CMN PLL core clock. */
>> +#define IPQ5018_CMN_PLL_CLK			0
>> +
>> +/* The output clocks from CMN PLL of IPQ5018. */
>> +#define IPQ5018_XO_24MHZ_CLK			1
>> +#define IPQ5018_SLEEP_32KHZ_CLK			2
>> +#define IPQ5018_ETH_50MHZ_CLK			3
>> +#endif
>>
> 

Best regards,
George

