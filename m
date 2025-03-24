Return-Path: <linux-arm-msm+bounces-52364-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A2B0EA6DFD3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Mar 2025 17:35:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EB129188CD81
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Mar 2025 16:34:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDED5263C9E;
	Mon, 24 Mar 2025 16:34:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=axentia.se header.i=@axentia.se header.b="gM9s+B2c"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (mail-vi1eur02on2127.outbound.protection.outlook.com [40.107.241.127])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44F0E261577;
	Mon, 24 Mar 2025 16:34:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.241.127
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742834049; cv=fail; b=T9D94wtbM0RXv3vB8sz9LUibx7AEQrPJopKNBBXOkc/ynX/tsZT1taEg9XmfiVQYqWKtlgGYG0nvhZX8Hho8XMpiWSO9b1dATgfYCXcXQOCIlNGmO3D5sxxRJwOhe4hv9pGl0yXzvwfCqSliwa/zpBrCu5z02WssM2b3VNyuUD0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742834049; c=relaxed/simple;
	bh=wyGs2Aq6jUxLzbYwdxV7gTbauqzyeOPHdMGKtPkVC58=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=VP0Sms49Rg9j+bVLS9kHHHr1NDBz72duHfJNUhvlorGJx979yD3tv4lT7LcgrORU6ZYVd+QSfM3mKnICoI0v+8HOqH4TynXr9yCLR3HxW0TkWOLIS0g73YCReTsVKXdlSW6MnS5dgmJ/bdB5dZnOLlGjS3N1Mah8C0MS4xIH/jw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axentia.se; spf=pass smtp.mailfrom=axentia.se; dkim=pass (1024-bit key) header.d=axentia.se header.i=@axentia.se header.b=gM9s+B2c; arc=fail smtp.client-ip=40.107.241.127
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axentia.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axentia.se
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SkIE3Rx037hPfUB6l08FIKZu4t0NGCjbnUCdP2QfxPmqnq6Z5nTBYP7qnoERMkhDVbt1E++5hvb3kewIio8/7b2oQwlh3wZlkXDYvE0F51TwE7wULbUUhLT2nC4UCJ1rXZfXIdvjGFx83UaDembUPnJVWu0jRdR7xFfT9+Lan9Ta+jAQ0DLTrOEN4L1/9JQQKq8IedytvItCc3HE440T2J8fcffBIwUtrM5mEcltsAiBhGSMFeWiaeewSvNGvEwzFaxxvsMbtEkBUrPgDfFp9u/LgFexP+2hQ5GJgx6jsz9DRSvOm+72JSOG6/q7DvLTqX4sbvOyF0M5qQoDmj8Beg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ysZq/INtBcerPCWd1DG1tWjGZmmvUhNOkdIHMbY8YE4=;
 b=NF/21DqV8gpuTekkfZwva97BMFpEc56BXaoiet76xe+W7B16q3OuGQpYDcEBWYLCz4P2w62erFQQZ/jS+XuJ5XuMjWmz5MBqa+Pu6VMhmuicgZVONnpPWn2Sk5ZB4xBq9BUfIlq47axHmowh2nsijho/b+FW7g8PYU3197iOMWIM+cGPFBxFLx+tz8ShOQQX0kytjTxgiHDeKxmYxFgWUXcYvJOCBysRgtnSCJ+NyZ2amHQ//r1hYxmnpZrvr+TvFeCGBn3+uipYl8Ic2bI9bu9Zxfd86LkKyVg/ZJ2+G+l0khH8M9hlMjx46AHAQiJZnWGJJPdef1b4EdxELmHduA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axentia.se; dmarc=pass action=none header.from=axentia.se;
 dkim=pass header.d=axentia.se; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ysZq/INtBcerPCWd1DG1tWjGZmmvUhNOkdIHMbY8YE4=;
 b=gM9s+B2cLlxCWpQ39F79A0e3Xf7SmVG2j+dRqRbQttJFqW8zpVZnTQNsd+nL2ivZyq1gyausnORgHpNKHMre1KF1HLWUVyghcOuueISBh8mvjvo4Fh2uPgfAmVCn6VBCF9AYMce8afv74RQB7U2mTh8z/U4bdapqxrd7AxLFwM4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axentia.se;
Received: from DU0PR02MB8500.eurprd02.prod.outlook.com (2603:10a6:10:3e3::8)
 by AS2PR02MB10429.eurprd02.prod.outlook.com (2603:10a6:20b:5f4::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.42; Mon, 24 Mar
 2025 16:34:02 +0000
Received: from DU0PR02MB8500.eurprd02.prod.outlook.com
 ([fe80::aff4:cbc7:ff18:b827]) by DU0PR02MB8500.eurprd02.prod.outlook.com
 ([fe80::aff4:cbc7:ff18:b827%3]) with mapi id 15.20.8534.040; Mon, 24 Mar 2025
 16:34:02 +0000
Message-ID: <8fbc8cd7-f8e7-e33b-74df-cdea389ac9a4@axentia.se>
Date: Mon, 24 Mar 2025 17:33:59 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v4 5/6] ASoC: codecs: wcd938x: add mux control support for
 hp audio mux
Content-Language: sv-SE
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: broonie@kernel.org, andersson@kernel.org, krzk+dt@kernel.org,
 ivprusov@salutedevices.com, luca.ceresoli@bootlin.com,
 zhoubinbin@loongson.cn, paulha@opensource.cirrus.com, lgirdwood@gmail.com,
 robh@kernel.org, conor+dt@kernel.org, konradybcio@kernel.org,
 perex@perex.cz, tiwai@suse.com, linux-sound@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, johan+linaro@kernel.org,
 Christopher Obbard <christopher.obbard@linaro.org>
References: <20250324130057.4855-1-srinivas.kandagatla@linaro.org>
 <20250324130057.4855-6-srinivas.kandagatla@linaro.org>
 <CAO9ioeX9RTBAeL3+9STn+=oEYR0wtaF6yoa=esNddEvqLQyO9Q@mail.gmail.com>
 <e4e94fbf-172f-4cfd-becc-cb2836ac1fb1@linaro.org>
 <ctcqkdbv6zh2rabkkr7tlhxlcfsn5nazjfbsnbbu4l4blyakft@pejdsvnazfh6>
 <324d5789-6309-4a64-bbfa-3afa0632e7ff@linaro.org>
From: Peter Rosin <peda@axentia.se>
In-Reply-To: <324d5789-6309-4a64-bbfa-3afa0632e7ff@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: GVZP280CA0093.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:275::7) To DU0PR02MB8500.eurprd02.prod.outlook.com
 (2603:10a6:10:3e3::8)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR02MB8500:EE_|AS2PR02MB10429:EE_
X-MS-Office365-Filtering-Correlation-Id: 0018ad56-a400-41f5-3db5-08dd6af1af4e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?c09WNmgreGZRY1pPdWI4NlQwdHN3L1F3M2xveXFPZzd3YTBDdXpmVTBGWGNE?=
 =?utf-8?B?VDN2Tkh0aVdWZVFFbDFyUDNBWFV5UjZtWmp2N3pqaWNYY3pxUWxmc3U4cmwv?=
 =?utf-8?B?NThzMHJSQnNzb2VBSXJQYUhKbFhOVDJEZ2RVbWYvWXNHYUlBeVBYSjh6NWxo?=
 =?utf-8?B?UGJSTThpdm14aElVdE9UbjJVeVRReUd1dDAvVmYrTy9tQWZMYnRlOWRIdUIr?=
 =?utf-8?B?M3VZNHlONEVlcklLOEN1RFlIMmFMTW93bnVHbTBRWHdPUW53Y3pBR1Q4TlJR?=
 =?utf-8?B?MnduWVZnL0U4eVArS0VNN0gvRENqcUpoTUlPbklyNDdsUjlwWDh3MkFHakpW?=
 =?utf-8?B?R1lYTnRCeHhuQ29LOXdtckNVRzhhWW9IcUFYTnJjWmhkVFpqbE1yb1Avd0Rv?=
 =?utf-8?B?U3dBMkhwb2grc2xEellaempORnQyN3MrT20rMG9NK09xb3B4SUxoanZWMlJv?=
 =?utf-8?B?ZjhPUVdoTlA4MnpJcEhKL0swS1FqS1YxRS9ZZnRsS2hlVDkyTmtqMTMrRklt?=
 =?utf-8?B?bWJRWkVPa1QreEsxUzZIVmtQNEU0ZGZObHdKV0g2OTNCSGlWbDUxcVpYZVZr?=
 =?utf-8?B?U0taSkwxcEo4R3JxZzdvM3ZFbE1ZYUZvNUNZTnNHYStoMjdCVHhPRmVKbTJu?=
 =?utf-8?B?TTRlbnB6VVZBOXNJajFDL1BMZGFrcU5kdTZrbXZLZk5pN3k5WHUyazJlQ2V6?=
 =?utf-8?B?R0kyZmxuZ1RwTGU1bFdna1hOektCSWZNTEJOYnF2Vnh4dXRjQjdxcDJmTXVJ?=
 =?utf-8?B?MFNOaElRKzN6V1lYS3pOcVczWUlEQTN1cjMxSU4rcEViNGRmRzRqTU1wbktL?=
 =?utf-8?B?dVlQVkdWZmZFRk1aTEZaTWYrRG8rMEVzVlloQjdPZlNaUW5sTVVDeWVIdmQz?=
 =?utf-8?B?NWxna1FJM2hJQ1BkSEVHeHJyMTRKZEdHUHZuRUlZOXA5dGxuRGErRWg4by9L?=
 =?utf-8?B?K2J5bEcwQXovd1ZUdk9qelF5YkZQMXB1bEw2RUZMbmFLeXBDNkRXRmZ0Szhx?=
 =?utf-8?B?bFZhaWpPSmVXekk5MmtOSlR4c2w3YkNiUzV3T01QaUdGZnRTMzZjenRGOE9C?=
 =?utf-8?B?ODh2aytMcWQ2RUFGTHczcHdPRXZwUTlydC9NMkFpR2k0VGRTLy9LTHRCeVp0?=
 =?utf-8?B?QTRtemRkdlNjVHVNRnhGWmxWN2xuSlQ1QVVjQTJZaGhkTVJpQzNpOVFwYTh6?=
 =?utf-8?B?OXV5eXRwQlJSblN6a2gza1dKamdydzI2MS9wRHA2Sk1UVThOblE2VHprVjk4?=
 =?utf-8?B?NERQNzJCS05VZVJoZWxSMGNJeENiUzhLT1J3NlNFVFhYbndNcnlRcEU4TFJr?=
 =?utf-8?B?azIwNWFWbEU2WXoyYldjUC9xZHJjNXBTZC9JNVMyRXRtQzJSRFFmSkdhNElP?=
 =?utf-8?B?OEthanM1THFMeFBWN25ONDN6SXI0Z0ZReUV1UXVsb25SRFRmWWUzWGwzQW1E?=
 =?utf-8?B?VmxoMDBEWDg3NXRTeXFxcW10azNmOXM3TjBvUTdmMzZPS1hJRVVteTVtUUc1?=
 =?utf-8?B?U0E1V3VGUXEzSnVhN2xxQUcxakpHVUJUZVZxUW40WlNOUnV1Y1pDb1hDaEdu?=
 =?utf-8?B?S0VJNHRFcHJSR0trUkVVOXJaeC9tc09MMWlSZ002T3Vvd0VUbVliaU9KTUM5?=
 =?utf-8?B?MDA2S2QvVjR6c0xJMWsyeXg1Y3U2b0FUODJPZnlPaGlFUnBaaUcxZlp4Z2ZV?=
 =?utf-8?B?Mm1CM21WQnNzZWdrVGNyejRIR2RuNVk0WWd3N2ZqcE1sVUtjTVludXJ6U0cy?=
 =?utf-8?B?SWdLVFJhTjdYRlFNWmU4U0NVRFJ0V1g3aS9jdlFzSXdmRzU0Y25KMWdzTVZh?=
 =?utf-8?B?MzRBZ0F6MS9uOGZPYTQ4ajBPRmJkekx5RzF1THoxWitVZEpIemRXaDJiZTk4?=
 =?utf-8?Q?0YOyBfdiWJNqA?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR02MB8500.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?a0ZzTW9CMGJUeW9aN0NqQ3lHREVCZ01OVkdzeGw4a0cvcmZreXFDNitHNFhr?=
 =?utf-8?B?TEt5c3VML2VmbnhJWUVzZEFkSnZyamNSS1NsL0UzNGU5WHoyWWwvOTBxMzRh?=
 =?utf-8?B?d3hBdWhMck5hYy81UFVNV3VFaDQ3eDRhV3lGL3A3Mi81bUJTZjZyUHJrUUVh?=
 =?utf-8?B?Uk5ERzNWMTdRSGlSdm9qbG15MEE2WTFYUXVXZDVpQlB4T3loQTc2SmpWMWFq?=
 =?utf-8?B?ZWZBTkUxd0ZPaTZvQ1RkdUlod0hUa1orSmRnNnhDbmFrM0QrYU54ay9kVzEw?=
 =?utf-8?B?OUx0TE5YTHR4WjFUTEtPekYyUHVqMFdxZm5tZ0p0c05FNDJUSmRqdTVXdXZ3?=
 =?utf-8?B?eU5mSndUaFI1RW1lV1FBYlJLRk5oMEdmcGFtbFFpZDNxTmsyejZNY29xZjEr?=
 =?utf-8?B?NStieFZTTnRsMjMweERkTGRGSTBPUkN3WGY4dFA3V3h5ZkZ5T0VZVnpDQk5F?=
 =?utf-8?B?ZGdXMStqNVhjdnRKNG13Sk5NdGJidkk1S1VhcyttUlVXNUpoYk5sYlZyYUFr?=
 =?utf-8?B?Ni9XdWtWRjlWcXJSZ2ZCanNzRFhWcGQ1SHV3Z3BFU3NFU1JKOERQZzNKZW85?=
 =?utf-8?B?YllIZlVTNk5CMHIrdk9QQjd0Yk5mQVJILzF3alMzRWlNYmpJcjhQaTJWc2I3?=
 =?utf-8?B?aWxWWkhDb2FidFZmVmJpSThSWGRjY0FsTU4xOXlkRUhJMWpnanhxcWNYYkJl?=
 =?utf-8?B?dFduM1B3S1NQbkJVZ2YzMUp1Z0EzZ2tZWk5reXQrSjYzUjIvdlIrMVFka2ha?=
 =?utf-8?B?aGI2dmtSeWhRUHdjYktXMFVvQjlaWFdCZjlVZVhUdzBJN2hPRUIvR29QU3kr?=
 =?utf-8?B?c2tVck10TVJqeUJadEtYWHVkUVh0U0c5Y0gwR2hJQ2w5aENEUElVYnR5WWEw?=
 =?utf-8?B?QTNMWUNNMEpoQjQyYXFRM3VhU1dUdUdQWERockplb0UrMndFRmVFMzhlTjE0?=
 =?utf-8?B?eG5QaVo2NFJWd1R0MGxxa0NMTFBlcXc1Wi9zUDNsUDFQWTQrZkpscGlnMVhr?=
 =?utf-8?B?M3NacS9hZW1JdlZ0Zm12L0xoYll4K1dyMmJjcWhqYWJyRkYyMHEzWW9SMVVx?=
 =?utf-8?B?N1ZDMGE3dUlTaWNtVHkrMHJFemFNeVViVnkrWEVIcnlpelJqakhXYUxrdTFO?=
 =?utf-8?B?TG1XWkdmM0FBZFRrTU5zVnlRUXFWdWNTYmR0VWxOVkFBUU0zVWkxcXUzcllk?=
 =?utf-8?B?cUU3ZkQyWEtXWEtabmFUWHNnUkdialVxbFRRdHo0bmJlZWpIc05uQlpLLzEy?=
 =?utf-8?B?dGY3S2E2QXJpNTRkREx5bEVwNHJoayszVm5xb3NRTHVnQ1JscmsxN3ZEVVBQ?=
 =?utf-8?B?b1BzanpIbDQyUndlT3BpemtPRWdsVVhBSGFLQ01lS2pCcXNNdTFLL3dXOHQ4?=
 =?utf-8?B?bTU0QUw1K0Q0SHFsaXlSbFQrTzduTGFCcHFMcFJJZDRNY3JKR252anIzeUla?=
 =?utf-8?B?Wml5YTdLL0ZkUVhya3VzZWJOd0xMMzJNdmZFU0t6eGpWbWJUVjMwWCsrR1R4?=
 =?utf-8?B?TStjWVkwWG5nS1MwN0NLcUg2VUV0YlF0Y2NSN1hOdVJyL0pLWlp5NEwzS0h4?=
 =?utf-8?B?YzRHVXZ0ZGZGR04yemtRTG5GTjBySmdRWEtPcXFhMzV6TlNkQUxqcVJhNEJ1?=
 =?utf-8?B?b3dRendNMUMycVlVLzN5UDFjOVJScWJVTTIwc01iZXFyZ0ZUY056NFRTUkZs?=
 =?utf-8?B?aE81MnNwYXJrYTJFdG5FUFM0ajhORzh3Umo4dUZQUDZxdE03aDdTdGhXOUEr?=
 =?utf-8?B?UCsvdURUWUxqV0lFaHU4Nlg4bkVJMFVKRlEreDAyWGYxc2xzNS9TWlpGRTJD?=
 =?utf-8?B?M21FZHR2ZjRsbFphdjg3R0UrV3hBZGhXMWhlQ3pkekVROEZobHJZTytkcnJH?=
 =?utf-8?B?bk9kZEJGSnY5NmM1dmpwMlNLS2haVmxubEZpYllBMUJqek5JTVdXQW5iMkJF?=
 =?utf-8?B?aGl5dHNYNXdCOVZxRW01Rk1zWGtQcS9iSmY2UVRGNmJyeG0vazhFT1JJQVBz?=
 =?utf-8?B?M3F2bHRsdmF1aGlTVGVkVUFTaEhEUGtYVU56YnVDMFJzblRET3lnS1E3aDZn?=
 =?utf-8?B?L0ZJd1lCZkFTQjlyWHc3UmtyOE1ncGlZNUllNGRML1JPa1pHekN6cDNXSVV2?=
 =?utf-8?Q?TSAu9/uoCs1855orR5P1U/5y9?=
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: 0018ad56-a400-41f5-3db5-08dd6af1af4e
X-MS-Exchange-CrossTenant-AuthSource: DU0PR02MB8500.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2025 16:34:01.9867
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vj1nW5LX4y8K6XIMLuU9mKVmip81UGAbb7x4KAxbf62j4i9PfkgWDmJS9h57ggfy
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR02MB10429

Hi!

2025-03-24 at 16:58, Srinivas Kandagatla wrote:
> 
> 
> On 24/03/2025 15:18, Dmitry Baryshkov wrote:
>> On Mon, Mar 24, 2025 at 01:58:06PM +0000, Srinivas Kandagatla wrote:
>>>
>>>
>>> On 24/03/2025 13:50, Dmitry Baryshkov wrote:
>>>> On Mon, 24 Mar 2025 at 15:01, <srinivas.kandagatla@linaro.org> wrote:
>>>>>
>>>>> From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

*snip*

>>>>> +       int ret = mux_control_try_select(wcd938x->us_euro_mux, state);
>>>>
>>>> Hmm. Does this really work? You have selected the mux in probe
>>>> function, now you are trying to select it again. If I'm reading the
>>>> code correctly, you will get -EBUSY here.
>>>
>>> On successful selection of mux state, the mux will be kept available
>>> (mux_control_deselect) for any new callers.
>>>
>>> So we will not get EBUSY for the second caller.
>>
>> No. wcd938x_populate_dt_data() selects the state by calling
>> wcd938x_select_mux_state().
> 
> At this point we also released it (both in success and error case).
> 
> This will hold on to the previous state unless we have defined a fallback idle-state.
> 
> 
>  Then you call mux_control_try_select() here.
>> As far as I understand, it will return -EBUSY as the sempahore is > already taken. Moreover, this is not how the MUX API is supposed to be
>> used. The driver is supposed to hold a state while it is still in use.

Dmitry is correct. A mux consumer is supposed to keep the mux selected
while it needs the mux to remain in a certain state. Relying on details
such as idle as-is and that no other consumer butts in and clobbers the
state is fragile. Mux access is not exclusive, at least not until a
mux state is selected.

Cheers,
Peter

