Return-Path: <linux-arm-msm+bounces-59366-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 98042AC388D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 May 2025 06:27:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B47EF18915E2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 May 2025 04:28:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 167981A23AD;
	Mon, 26 May 2025 04:27:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="tBqepzgc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10olkn2015.outbound.protection.outlook.com [40.92.40.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D38419DF99;
	Mon, 26 May 2025 04:27:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.92.40.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748233660; cv=fail; b=dXCwyNGSssjIBUqhQHraz/PaZo2WVI6iBn0aTggT+F38c/CgNFuUnyNWU3aeNekBo78lBpC53lfC9Y/h2bRMfDyx5oh4fpXTLR5uwP9Etg3vKa3pJkXCpKAecmAGGU4jeYk5JAe3EE93azVesGhV9Rq/PRjumkKH1MWACXcefWk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748233660; c=relaxed/simple;
	bh=CojLTTkz39DbBLhgt2GEzB/g/fS123wmx1+ojgChZd0=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=oJPZUzwbp60Ndpk6on7yuRhl7XLY4Rodr9+ZkHl978bCMrmlmbA+RWKWkePa+YVPg2Y1rIew1Hg2nQ6XQ0pDRFb+8xv6EleOfDBaHCWmnfidSAa6fr0/2Q0lUxkwlK5RLBFbrmdLx1NWar2xJD/EwNoURt5f/c+YHN+C8wAjiiU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=tBqepzgc; arc=fail smtp.client-ip=40.92.40.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GVTjHZn3KoFw/H/itQeDNxgLZy3vDH0Dft1C+8lIfIZ6LY1/V5xlFTrsspH1rnHJyQiqxumgIt1oq2Ki3S+EY8414kXWxuxCS8iuBYkUNi2j0HNDDEpMY9UorFu5dTKuwqqLMHFMMhrV1ljAQrrFp5F0GtbR5FUvnFtgOCc9nISYoQuvqmhwj1rbdG081+FFZ/Js4jWW36qIJaVF9uasA9UL8qkixrCiJNxoIpf6LVmti/hZGHtNW8+0Ou9EPEBbdcoEA1OMOyeXrVE+LOdW8NS5s/DRbYn+I4hAoqjcBMDxbOyZ99nPloykwWWBZz64MgNAjEjCIRZFOlhWtWilqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wsRZUcMO9qvNyKBof52DfgsrrcsM0qlMkTKql/kHXvE=;
 b=wo791kRPjBKJZrmUdEAVMf0xoRPM03kmczbv+wGAobE4i8h3thera8WlKNOxMXrHHUHWzOxvMkIIIXATwvH2IuUMoj91PqTrED+dx6l8JpbMRbGp9yyFCXPVqitivvd6Zso2W8O19TarO1ldAJi3LTmO/hzR9EYfkL4Gnv0XoyKy3V4Z5o6PJFEARDyH/rSQeByAZk5LreqGkMxfcTyJ8JLZa7L/QSpuD6MvQuVmfYxbKaYaxsxoPEFh6CeamCeJeC9NYDtFKWrA9DVqN3lQejr5CnQus+c7Pw/bi1qx8u/LpCN9C/JnJpgzeNuju3Qg8wUE+cQXXJws5Tv2JOgBtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wsRZUcMO9qvNyKBof52DfgsrrcsM0qlMkTKql/kHXvE=;
 b=tBqepzgc/rDgpWQNseRpKNwDrA29lf+VoQMMVzXUEgI7JajUdcqGGD+fojpKp6+v8xjBLZt4jbz7CSNqGYgRzj0sEnjFdnthziITXJ3vPxOTXMJHCNHmpXnjARFbqHv1dOekFcocIXTgeuuY+AnUUPYQxbm81UwfH1aP7G+HhoGLvYis86OP1FQaTJu0COB1sYqRouzri0VIt3tXMmACHzr45a/8uNDgPOzQ2KoxXmn38KUTxsUO8tCLbJ7Iy1tSf2EhwT3jbAJThtmoN6qKK3FKd5S66JSgY/ugcgL1uJOsTLa3UjwLr8YPWMvINGgaL+ymK+TuDkqLFL88/aqHUQ==
Received: from DS7PR19MB8883.namprd19.prod.outlook.com (2603:10b6:8:253::16)
 by SA3PR19MB8260.namprd19.prod.outlook.com (2603:10b6:806:39c::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.26; Mon, 26 May
 2025 04:27:35 +0000
Received: from DS7PR19MB8883.namprd19.prod.outlook.com
 ([fe80::e0c2:5b31:534:4305]) by DS7PR19MB8883.namprd19.prod.outlook.com
 ([fe80::e0c2:5b31:534:4305%4]) with mapi id 15.20.8769.025; Mon, 26 May 2025
 04:27:34 +0000
Message-ID:
 <DS7PR19MB888348A90F59D8FEEBB0A9509D65A@DS7PR19MB8883.namprd19.prod.outlook.com>
Date: Mon, 26 May 2025 08:27:22 +0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] dt-bindings: net: qca,ar803x: Add IPQ5018 Internal GE
 PHY support
To: Andrew Lunn <andrew@lunn.ch>
Cc: Heiner Kallweit <hkallweit1@gmail.com>,
 Russell King <linux@armlinux.org.uk>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Florian Fainelli <f.fainelli@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-clk@vger.kernel.org
References: <20250525-ipq5018-ge-phy-v1-0-ddab8854e253@outlook.com>
 <20250525-ipq5018-ge-phy-v1-1-ddab8854e253@outlook.com>
 <579b0db7-523c-46fd-897b-58fa0af2a613@lunn.ch>
Content-Language: en-US
From: George Moussalem <george.moussalem@outlook.com>
In-Reply-To: <579b0db7-523c-46fd-897b-58fa0af2a613@lunn.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DX0P273CA0067.AREP273.PROD.OUTLOOK.COM
 (2603:1086:300:59::8) To DS7PR19MB8883.namprd19.prod.outlook.com
 (2603:10b6:8:253::16)
X-Microsoft-Original-Message-ID:
 <c376b7b4-350a-4047-b48d-9bc4dac5685b@outlook.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR19MB8883:EE_|SA3PR19MB8260:EE_
X-MS-Office365-Filtering-Correlation-Id: ac88f9fb-9064-4144-af34-08dd9c0da26b
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|19110799006|461199028|15080799009|7092599006|8060799009|6090799003|5072599009|3412199025|440099028;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZmRCY04zSi9hZGZZRHlXWTBMaTVzajZQSi9GY1JKR1YyQ1Iwc1NWejZBSEF2?=
 =?utf-8?B?Q2lsSXY5MzBIWEpIblZOaFo5ZjBXVjFhTHIrVVd3enl0d3pXam5maC9mdFYx?=
 =?utf-8?B?WTJXeFlBQkNDdGZzY1kvQllrZmFTaC9YczhNLzdUZGREc2wxZVZBSzlmNHhX?=
 =?utf-8?B?d3FmOGVJOHp1MlE3WVd0NzNnOVYwSVhkMFdWQVZDZ3JGQUxNRXUrZzZsalYv?=
 =?utf-8?B?akZmcEdKV3A0VGVBNzZ5cnJpdW5YL2hNcC8za1hoYUU4azFCOU8wT0NXeTRS?=
 =?utf-8?B?TXY4dEp3UXNNUGZLRmhRQld3UWt0MmtsZndhNFdlQ0gzaXBycEw5U1dwbHYv?=
 =?utf-8?B?WVhTY2dWaFI2S0czdlN5SXVuYmdDT3hQUk5rYndsSFRITVdzVlBkZGw5UlAy?=
 =?utf-8?B?djlUTkpLV1JXZStxSUNhb1F5YVczU0tKa29NN1dYM0dleG1BTURyeXp6bTBP?=
 =?utf-8?B?WXNlT3lmYTdqMFhBZU9jRmdGcHFDTncwVlBBcUxqanVPS2k2SW9GNEltU28v?=
 =?utf-8?B?ekh2VEx3WW9Xbmt4Vk1MQ0ZjZVNacFRHczlpLzk5QmtnZFJuUk8rVFBuRkVU?=
 =?utf-8?B?NFRWOXB0WjRKd2RxVXdVbjVZZHlXbUYyckJSbk4vSmZFSkRiRml6TUZmV05m?=
 =?utf-8?B?Yk5IQm5Yd1dpTHBHaXZuanBUUklVeFhPTmJUeE56cjEwTDZLQkV0dm96eDlS?=
 =?utf-8?B?dE5zMkI3MW4zZ2oyaHRTbjZIdHlsS1ozdmNkQk9HNXNQMjJML0pVWGVDdjdp?=
 =?utf-8?B?UURjMGFRcDBtUStwZjhQV2x5VjgrdUM5aGdXQ29ENThnbTJwRy9SeXJ4ZnAy?=
 =?utf-8?B?eE1YNkhwMWRuWm11VitDVHJ1N21TWmdqYTA2THozOHY5UnBiNHd0ZnNBeXFy?=
 =?utf-8?B?aWE5Ukw4eVZ0amNLT0xQdWdNSDd6dC9la3JtN256cVBNMWJEWE16aXpZTDho?=
 =?utf-8?B?NGF1WDN6SGxJdkhQbGwvTWdmSDV6MmU1NjJnOHZIckU1MHRDSDhvQmY0L2hK?=
 =?utf-8?B?OVRTV1U5NGlxOStnNDhXcjY1SmhmcGlMOEdPeXhIK2oyNS8yTHFjaXBtU016?=
 =?utf-8?B?aFBjU2VMTitIOXBCb2xwdXYrSWlheTdOWTBtN3B1RHg0dW16bW95ZE5tZmt0?=
 =?utf-8?B?WDBZc1FETHlscjEwYXJwRDQxUm11NXl1M2dRakpYMko2T2lMVVhhNnAydUxI?=
 =?utf-8?B?L3BOUlU0dmlIR2g4cmlrYnhXRHRxRkgzNTJUL0xxOHNOZklKWHU0RUJ1bXYw?=
 =?utf-8?B?U0pjUHFDTmR6OW93eGRoRnQraTdNQ2Q0OWxQZER2TlJvR0lTRzFYbWUrbWZV?=
 =?utf-8?B?WmlBeEJhZ0dOVWtDTjNjclJQU3ZDd3U3dDBjR0lCcUM3RWo4dTRHZ2hyOFpv?=
 =?utf-8?B?bEdCYW5uQ2s5L3RtNDVuV1RGMDhPODRSeVNVc0xnVkpnQk1tQmViTm83VUdL?=
 =?utf-8?B?MmNMbS9ZTkdBWWJtVjZ5djhpU3pVcVR5TDZ1SVRGcFJWUHlWRStGVFJ6YTZs?=
 =?utf-8?B?dVFwVyt5OXBITm9UenUycTRNaytVM0owYitYZUZxZWwzODlLekFJTHBsTXpB?=
 =?utf-8?B?NnFBQT09?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NjFJcjRTZ1NyZ0ROR1VONUVmTXdhb1Z2cVhlMnpFaEZ5U1pWTXd6TGJZNDRK?=
 =?utf-8?B?VGlzckJGdE5ZQ1g5dmliVHkxcTNXOHkvb3oxZHBycDRZSWNDa2RGbDJxblZZ?=
 =?utf-8?B?L0NzT1dxQ1pxTEM5eit2TXB6QVdIb1JiaTc4OW8rbDdacXUyK2VzOEc4dy9N?=
 =?utf-8?B?Q1dQaUwvcGtjUnBURmY1Qy9ZRWJ1Z1N5V240YlROZ1VSYWJ5RzRVaGQyOXph?=
 =?utf-8?B?M21qd3lpY0x0V3dXT0tiZ0JhTXRvNkhWdkd6R1oraUZCU0NobDBGVnlmcVVR?=
 =?utf-8?B?N0V3Q3BwZ3J5eTFjdmZLR3ZRS0N4UnhmYTVCQ2EvcUVBMGZwL29Za1pmVXJP?=
 =?utf-8?B?RDdaVGdmdjNZSGNIZC9rMWVlN2w1ZlFmMmhWbFQwU1FJa0J3cDZhZzhXK1J3?=
 =?utf-8?B?QzYxUGE5UXR0SHc5elBUMjFLVjNDbTdWSEE1MitJbmx0cmZ4VlA0cTBtY3BE?=
 =?utf-8?B?NHI2andmM0xpMTFmbDV5SjdVeXZyME5HTjBINmQzTjJldGx0aXg2aTR3aXRy?=
 =?utf-8?B?bFpQR2VvdmRLL3lVK1l6S04wT0VlVTNuSnY5UUZWRGdLb3J3dGZaUCtROS9H?=
 =?utf-8?B?MWFSWVp4cEJWbUdweGo3UEtuTUJLWWlNWmxoWkNLNW93QVM5TWJORkVjTWp0?=
 =?utf-8?B?RURaUHIzNkNzRGdYSGsxalZHbU1wOE5XRWVEZnhiQTlVZ2lwMVJKUkpBZWxX?=
 =?utf-8?B?NTd6RHhHMFpSak4rSEJ4cE5QWHQ0bDVPZXMzTnBuVVdLcVllbk4wRW5EaE9y?=
 =?utf-8?B?bXJIN2pnSWswQnFJM1REbnVwcnNMNklEOFArTnd3WFA5NlgvdHBUNjhneGJT?=
 =?utf-8?B?VjdORTBGd3o3ZW1lbTBCRitseDFjbW05T3A5KzFFa2V0TlkxQ2xmamNaZW9z?=
 =?utf-8?B?NGFoSmZ0Zzc0WWpLUnV5SWpzRUU0VXR4OXJoTnEvK3JSS3pPQ01TWHNyMlU0?=
 =?utf-8?B?NDk5VGJuMVZCN1ppSGJNbzdzd09ZN3VyOE1vbWVubXJlUEJEd0xHSEJxeGVu?=
 =?utf-8?B?Yk9zcCtFTWlETXRGdy9KNXpEbUxjSmIzdUZ0a3lkR1ZPUlUxbFM5cEpJdVFv?=
 =?utf-8?B?VW5wZmFmUFdXRGRaOGhJVzFYREswOU1MeFE4Y2Z5RVVvbGR0eXFaUjRyUHls?=
 =?utf-8?B?dFIxcVVDZzY2cjRtYnBuL0piNzQ0Uy8vVFhXZ3lYTGViaHlNakZtRnhlRE1W?=
 =?utf-8?B?Q0xGNEpZMlZWTEttUTJyNlVxNXd4OXF0OW9SOWl1aGxKbm1TcWJjMmJsamlh?=
 =?utf-8?B?dzI5WVFQSWt0Y0pZM0NGS0tlUUFvR1dPeGxrQmNXS3lHMG9SNFdPWFN2YnV5?=
 =?utf-8?B?aW1iSUtHZWt6UzczVndtaWNURk9wNXdGN3hXWHJDWWtvWjB2M09nR1Y1V3Y1?=
 =?utf-8?B?UGtOZGpRWVlwWUhwTFRSUFBITU95ejhNY2doc21JQllER0NrSHN0b053REpq?=
 =?utf-8?B?eWFTOGNzbDdiREJwQlVMaWZ3ZEFlQVo5ZE8xalI1ODdYSzBDV2lpZDBlNlB5?=
 =?utf-8?B?Z2JUaHVhNUg2a1NCcm1MSHorRHZqNlliVDYwWUxUWHZTaEdPSHcxdldPMVpF?=
 =?utf-8?B?ZTVBd0lUSnhXbzUwblkxRVl5QjdNM0tUT2h0UHFIZ2VSYUxxMDdhNVJQZ3JO?=
 =?utf-8?B?OUJ6OTI1M0RUU2VrV3pwM21YN0NmcENwcVRHNmdnT0YxT2UrVE1SS28wK2tP?=
 =?utf-8?Q?WkjQyJ50xg7TLIqCOVAz?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac88f9fb-9064-4144-af34-08dd9c0da26b
X-MS-Exchange-CrossTenant-AuthSource: DS7PR19MB8883.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2025 04:27:34.8004
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR19MB8260

Hi Andrew,

On 5/25/25 23:35, Andrew Lunn wrote:
> On Sun, May 25, 2025 at 09:56:04PM +0400, George Moussalem via B4 Relay wrote:
>> From: George Moussalem <george.moussalem@outlook.com>
>>
>> Document the IPQ5018 Internal Gigabit Ethernet PHY found in the IPQ5018
>> SoC. Its output pins provide an MDI interface to either an external
>> switch in a PHY to PHY link scenario or is directly attached to an RJ45
>> connector.
>>
>> In a phy to phy architecture, DAC values need to be set to accommodate
>> for the short cable length. As such, add an optional property to do so.
>>
>> In addition, the LDO controller found in the IPQ5018 SoC needs to be
>> enabled to driver low voltages to the CMN Ethernet Block (CMN BLK) which
>> the GE PHY depends on. The LDO must be enabled in TCSR by writing to a
>> specific register. So, adding a property that takes a phandle to the
>> TCSR node and the register offset.
>>
>> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
>> ---
>>   .../devicetree/bindings/net/qca,ar803x.yaml        | 23 ++++++++++++++++++++++
>>   1 file changed, 23 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/net/qca,ar803x.yaml b/Documentation/devicetree/bindings/net/qca,ar803x.yaml
>> index 3acd09f0da863137f8a05e435a1fd28a536c2acd..a9e94666ff0af107db4f358b144bf8644c6597e8 100644
>> --- a/Documentation/devicetree/bindings/net/qca,ar803x.yaml
>> +++ b/Documentation/devicetree/bindings/net/qca,ar803x.yaml
>> @@ -60,6 +60,29 @@ properties:
>>       minimum: 1
>>       maximum: 255
>>   
>> +  qca,dac:
>> +    description:
>> +      Values for MDAC and EDAC to adjust amplitude, bias current settings,
>> +      and error detection and correction algorithm. Only set in a PHY to PHY
>> +      link architecture to accommodate for short cable length.
>> +    $ref: /schemas/types.yaml#/definitions/uint32-array
>> +    items:
>> +      - items:
>> +          - description: value for MDAC. Expected 0x10, if set
>> +          - description: value for EDAC. Expected 0x10, if set
> 
> DT is not a collection of magic values to be poked into registers.
> 
> A bias current should be mA, amplitude probably in mV, and error
> detection as an algorithm.

I couldn't agree more but I just don't know what these values are 
exactly as they aren't documented anywhere. I'm working off the 
downstream QCA-SSDK codelinaro repo. My *best guess* for the MDAC value 
is that it halves the amplitude and current for short cable length, but 
I don't know what algorithm is used for error detection and correction.

What I do know is that values must be written in a phy to phy link 
architecture as the 'cable length' is short, a few cm at most. Without 
setting these values, the link doesn't work.

With the lack of proper documentation, I could move the values to the 
driver itself and convert it to a boolean property such as 
qca,phy-to-phy-dac or something..

Any suggestions?

> 
> 	Andrew

Best regards,
George

