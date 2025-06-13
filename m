Return-Path: <linux-arm-msm+bounces-61162-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8102DAD8061
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Jun 2025 03:39:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 555F61894D05
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Jun 2025 01:39:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88EC21D8E07;
	Fri, 13 Jun 2025 01:39:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="dDCQFOOf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (mail-bn1nam02olkn2084.outbound.protection.outlook.com [40.92.15.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD2542F4317;
	Fri, 13 Jun 2025 01:39:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.92.15.84
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749778776; cv=fail; b=XYJ4VOyJW5gku6JtnZTci/hvXRHf8sMd7KXXiOu5YUH+i69Ue+qQg5frYla8EpqoSdkZMLaB9ozlEWfcQ716yCYmGw96DZAVq2jxprBsyhQ+QgZrO6cgmoBJ832y0V7Ttsk2PEgpafFpDoPoBF40yQbNfLpVUbaYFH+SGLMcjvs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749778776; c=relaxed/simple;
	bh=HpUQqiOexLqRTeBS8mjJRxKxNuoGPOjQvXS+VdFxS54=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=H7zkih4GB45hk8I+8dKsAjqnd86DTQ/2NHhf3o6KgVIg5W/0PML6+VFyg2h2ASxLoGm8K2D8s0YD5Jl+1bwjD7OhUWOy/OTek2HEgYLZafhWbvFG+BhfmQNSIudHb/dyW8t0rK3EKQx1fzJpIOJNm7yU1EBo+TzF6MsGxvlCLBY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=dDCQFOOf; arc=fail smtp.client-ip=40.92.15.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q/jLpkYOxleizXdAcFVVDV3urFq6Fjhc1dd1F4MZQgAmFinWu126qbEBmyM1mG36I+0dhl0h6JAYYtd43AStUP+Og1bj63P8GpuH43jtcKcmSYAL3ACa9dxbG7bpm4soN9Lo0ef8bBqTMIlm8BItzKi/aBEO22a21zQWwZXnxvVnig/zbwMsFsXuxG/HZmLvaMseFTRDOeK3mjYj3j/ATUp1zZdnp6GE8pfZsIDUW7ClpKEAfmoQsK3Eu3RlOY6SqoU4S2e9Xwk+kYxgqQ4LFjcw6kkPUiwb0BBsAGFe6ztzjyzrl+26w+xX6EeXR0BIxA8vxKl6wt51rcyRLzcATA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NwDeBGkd51FNKGGSA1v6aCA98cl0JZjG5EJ9X3fquds=;
 b=x1hRST9Fw8PdLk6D6k2nyVYPkEHX4jts3J2f859pbNTkMFCVI3z60/HXiL46n1vdKoFLYIenkukonkdiZYV7AAqiQ6bNSkP1J4/H78t2p5hod0/BMmQr2pqBIEM59oJ0xok/Ek2eUsdsvFy3bk7n69x5neJeBkhUQVvwZGuD8EyqIE6v31EXnaxTFfL8duioMFd1QAlFp5xh9hlusJSL5Y41VZTEXW4EphKunWj0ekhRk0C36c4JrrkVd6B65cXpROTEbKPzJqrRYDz7PPxlGzNpsIaaphJ8PHcCaVFNzEVda6Uvag9GdYmV1PMCt79a83RkHS7GmQl/yAZ4x5KGpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NwDeBGkd51FNKGGSA1v6aCA98cl0JZjG5EJ9X3fquds=;
 b=dDCQFOOfk6A9Mct0yIVoodmTTDRQ4jaaSMQKNowhjL77yHGEmVBQFIBY6wuMFWbL34/uVHaOYOcVJ3yJkohttB1HFzEyq9Q1wf4QjI7mqyssOj3FcIArTYxXKMg91eNX7UEfbo/nHtvx/RfbYo8Pwvu1KSbYWvI63+jjR0jAfeC851vxpQ2gdz/k2gAFPLNxm2QOQ0W1kmCqU5U5SBWRQOWs8qDPm8e9PjNAJ+4pekxS9UUllCgxhGVgYxruFOPqbZvOszRux1ivBH4nYSw+6UTIjGPOuf0RwHCwuWWFsQDD/ADYLB+SUDOW92tFP+26ETx8W55PJEgMjtsKN/zm/w==
Received: from DS7PR19MB8883.namprd19.prod.outlook.com (2603:10b6:8:253::16)
 by SJ2PR19MB8122.namprd19.prod.outlook.com (2603:10b6:a03:548::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.15; Fri, 13 Jun
 2025 01:39:31 +0000
Received: from DS7PR19MB8883.namprd19.prod.outlook.com
 ([fe80::e0c2:5b31:534:4305]) by DS7PR19MB8883.namprd19.prod.outlook.com
 ([fe80::e0c2:5b31:534:4305%6]) with mapi id 15.20.8835.012; Fri, 13 Jun 2025
 01:39:31 +0000
Message-ID:
 <DS7PR19MB8883DA8B81357B2E229798FC9D77A@DS7PR19MB8883.namprd19.prod.outlook.com>
Date: Fri, 13 Jun 2025 05:39:18 +0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v5 0/5] Add support for the IPQ5018 Internal GE
 PHY
To: Jakub Kicinski <kuba@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
 Heiner Kallweit <hkallweit1@gmail.com>, Russell King
 <linux@armlinux.org.uk>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Florian Fainelli <f.fainelli@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, devicetree@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <DS7PR19MB8883E05490D6A0BD48DE11909D74A@DS7PR19MB8883.namprd19.prod.outlook.com>
 <20250612182958.7e8c5bf0@kernel.org>
Content-Language: en-US
From: George Moussalem <george.moussalem@outlook.com>
In-Reply-To: <20250612182958.7e8c5bf0@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DX0P273CA0028.AREP273.PROD.OUTLOOK.COM
 (2603:1086:300:5b::10) To DS7PR19MB8883.namprd19.prod.outlook.com
 (2603:10b6:8:253::16)
X-Microsoft-Original-Message-ID:
 <ccb91286-378f-446e-843d-73e755eafc11@outlook.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR19MB8883:EE_|SJ2PR19MB8122:EE_
X-MS-Office365-Filtering-Correlation-Id: 3bf2650e-a0f2-4c55-dba6-08ddaa1b23dd
X-MS-Exchange-SLBlob-MailProps:
	znQPCv1HvwW4gkeWOyJlJSAnEZnWJBh4XfZZvNO88AmXPS1QaVoDUmh4tQmozRaZ7SfwMXHj2jOOFrQjuf9M7E44FQGIBiiuXhzXBSf7gSkxG0m1bo+sV8XzcXxMT8bwoX6M1f+7n108GIH95vT/F4P/vJOL3hHV3WlOJpxpXCjK7Hx80cvToAVxws5eknRefrqzfaqUfzb36uLKhAeyWVSfl5IbN0OV7A6qA3wkdVEIEKVssOEM1uh2CPPOOXrzZHl0oS0+pd4bw3V2QXyzxHlRd4OBjpI433ypgyNg636RR4CHpDuNGQ3ulcCVnx9CVG8PDfgG3BVhUu118UU8yRDGWbdz52zYMznXoz5Rf1Cpx5jHFEYotPyp8XzHn3vVBOVnULKJqp7JZZNHFg/4K3PBU7BZaXUmsh6UoZTXXsz7TjPWEr93B/ka8PByHjUTIQQZUNgQueRLzfCuIyawTg85ZFAJxMDUnfOaYr7JCLXaKQHZj7MzAjh3W0IzE0j9x7RlKMhdJGnB3tWmDEx806D74Yab8n3CK5DeiQNUCtsc9DDFwMdPXUKI5Hgmpzwjis4AHnZn8/15pDXyiQ3EqdNtAcvVaairwwz3uGnEbOLmIwl3+5ASs8F46Mbs70rQjexSJIK67UEIelQuZTaM6y3ceyb6SiuGXK9R1kniBWp77qKaSsXt91eeS1nyN/ujL6D7hIZtvkd48RKDAbr8RNEcfRd8sK1iE9lFes/pxHYuPM93rSAws8jBKYfABW5XvyCADmVPtbI=
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|5072599009|461199028|8060799009|15080799009|6090799003|7092599006|19110799006|40105399003|3412199025|440099028;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?c0dKYmxuWGZqOUN4NjhoRDRHSGdMNUVTQ052THB6c2pSWllsNXdqYzI5NXVp?=
 =?utf-8?B?N2k5NktzOUVFenArQk82RC9sYTkycUMwVHQyOUhIbjY3alBzRUpOTm1JZzBa?=
 =?utf-8?B?TDR5M1RvWCtKdFpocEQzaUtoZVByV3YxcUVSS2J1aXpiUXo1RlpxYXBvSndV?=
 =?utf-8?B?eEp0RUJDbkRUUVY2cEkyc1Bnb05ZRVlNb1QwUnVIUSsyWU5lNktSRFpiRjFD?=
 =?utf-8?B?NEdXSDF6WTBOS3l3UDhlc0lseVRhNm5qcHFiSkZTK1dzQjd1QkZOUlVEVDlk?=
 =?utf-8?B?NFhsWXRPMVdYZklTMk5jTCtXSWtqUnQzVDcyeVppeitqc1VFdVU2YnRwRmZk?=
 =?utf-8?B?QjVYSFZpTTNRVGdqOHFDaFl3SDR5UERuVEd6NE1GWEVLeDJuaXVmOHkwazZv?=
 =?utf-8?B?ODVTN05LcTVLSnVWaXRkamlkYXZSMS9rWXYwQXdHamxiY2V2MnpZa1ZoclRF?=
 =?utf-8?B?dm1odWs1R2c5QWZra3RqdURpck44NG9KWWlZUjNsUmd6bzNHWFphNTVyNnpG?=
 =?utf-8?B?TWZRZklFVVJNQkU0YzFaaUUzcTR5cXZYZFpyVmRQQ0Y5NFJoMEJxU3dURG85?=
 =?utf-8?B?cU1TNXRoUXFQQmtCMkFwclBEd2k3VG9MZ1NBZHI5dzhNbEtkcldONS94endk?=
 =?utf-8?B?MkErZmNDK2hhK2J2YjB0cWg1K0VibVdCK2NRVG5qR2grRURsekN3bFlYUG1N?=
 =?utf-8?B?bHB6cGFYcWlkMHNYc1dwdVUxV1ZiNDhyaW9UZlR0aVNyZkNhZ09tUytFcGM3?=
 =?utf-8?B?RlJIOWRpU1Q5YkJpSWszQzZWRWxVMUFVK2Q0Tnl6aW9oNHp3TXlkeE9aWDNV?=
 =?utf-8?B?SG9rV3E3WTJwVFlhTkdOS09FYTBjRHV1Wnp3U3cvZ3FBUDdsL1Aza2dWdEo2?=
 =?utf-8?B?aHU1MUpJUTVSK0NLaFVnYm56YVdkN3N1ei9aSkF0dkNOdXlmU0U3QmNFM2c3?=
 =?utf-8?B?ZWg4V2Q2UiswZW5IckV1bmVpNWYyZ3BOVm5ObWd1UzVvVStZalhEUmpjd21D?=
 =?utf-8?B?K2dHRHdheENCRVZSUHk2QitFeVp0cWE5dHl5YmVRWk10REtDK1FwdVFWMnQy?=
 =?utf-8?B?VVF6aDNBdHBHbzRIeERXL2lnV3RNYTRnbDZIay83YmQ1UlFZY2ZteVZ4eUor?=
 =?utf-8?B?dENzNDFCWWlxQndoQmVQd3ZLZ1piY2g3bERDNU1NZmJGODMvamIrb2kvOStq?=
 =?utf-8?B?R0ZPb1NlQ3didFJZSitoRC95Rmk1d1BOK0JSMnRiNTU4R2psZy9qUHVyZUpQ?=
 =?utf-8?B?S0V1Y3lhSzZ2Wlp4c01WY1FXdXZGWXJkMjFhdTlnNFRhcjRLem5PeDBpWTdm?=
 =?utf-8?B?dTRrcVJ2Z0NTUU50SVRyd1Vha1dpaTZhMkNCRm4yZFZNVUZVL016UUhlSjZa?=
 =?utf-8?B?dExpY0w4MlNUTzkxbTBRZ2c0cXAzZDhhdHlzdzVXOS96SitoRzIxUHk4S0xM?=
 =?utf-8?B?bzNITVg0OWVqeU5XUDJwcmVGVlFUUk9ZTlBUUWptS1ptVU5sc044clgvUjhY?=
 =?utf-8?B?WTlOQ1kySHJ1d2NCWGxGMFJNaGQxMkZqeFJ6WGpKb2g4dzUrSlc0QXg4aDg0?=
 =?utf-8?Q?N50kcJwIy8q0BmIECH7J3SZPA=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?a2E5Um1PN1RrVGlaRVNPVzdidHkwRUsvSmxlMGtlM1RoNzJBckxrS1NSYXIw?=
 =?utf-8?B?dGFNZG16a2VRdUlwZUNvV3B1eDgzNnFGYTh0ZXd0aWhpeENPWVN4dXJUNzZU?=
 =?utf-8?B?MWF6ZFZaeGtQQmkzdDFYcFh0LzcybVY3V2NkNnNrL3QraXZFZ0h3UnkvSVJx?=
 =?utf-8?B?K3hHVVBoOHljTzVUMlNEb29aaUJQTUhrd2VET1BVSEFHOXVkL1VDUTJOWTUx?=
 =?utf-8?B?VEVKNG5pYTU4MVplWEZuRTlvQWJ6YUxYRW5JTkF5c2ljTElodXNBa3FiVy9k?=
 =?utf-8?B?YXBTOW1WMld1aFU1R0gzNUN6TEpzbVAwakNRRExVVEJCRlpXK2R5cXZxUG9y?=
 =?utf-8?B?Z0doemFsV1RqcU5QOCtOMm5GVXdhQ29NYnNTLzIzRHJxdENKcEZXbVJqMTBU?=
 =?utf-8?B?UTZraVUrSkRqOWo0ejMyT0ptdDl4dkJGN1AyUHZiKzVhT3J2RThIUU1jQnJV?=
 =?utf-8?B?SG14SzF1b1NwYWhoNWhCaUZwWmtVRmpuUDlrRkxlNUVzV2VORVBNazdPVHVt?=
 =?utf-8?B?RXN1NHIrK2doaTFra3NWZkVxdEM5UG5QOTZmNDBrcXNzTk1MZ1A1d3AvZmYz?=
 =?utf-8?B?NEc2VjhiKzgyYnk2TVNvaXRIRy9kNzdaWUl0c3FBc2xPSDhtVC9iVERBQVhP?=
 =?utf-8?B?VzNRelBRRGgyd0dvRk1xYVBRZFVyWDMrNFBjN0VoVVREeEpITGFxSFV5L2N0?=
 =?utf-8?B?KzFyUUExTTB6ZHNNQnZBb2NRU0JZa09lR0xBUXdoNTRuVTNvVUdzS0tId0Zz?=
 =?utf-8?B?T0w3cVFwcHVCMC9QNGFlQjFDVTNCTTdVRG1NSko1amwxbzU5RVcxWkYxckZ4?=
 =?utf-8?B?ZTRUSHlGRUVTUlFzYmw5WjFqSGQzS0JnRlM3T0VzQjFZY0xIMkd1RGdMek5h?=
 =?utf-8?B?U3M3RUQ3dFNMdVhscUZtZ3JQNEFMdnNZdmpnbjVwVURsQjVNZFVXTHc3UXF2?=
 =?utf-8?B?aVZVUGFUOGRZWVhWQ2llem9xbnJlczlKcVpCQzBEWmZFbm1TaFZQbjdweWZs?=
 =?utf-8?B?Q3hzanc4NEpUakVZT1pzTkNINUQzK0Nuam5DckJuQ0lJQjRXaitkSmRCTGRH?=
 =?utf-8?B?WFNJS0RBbFRFZXpkQ2JOeGpIN2RMQ1pzM3FXSnVJYjNWOWZyeDFhZW5rU3Bs?=
 =?utf-8?B?Mk1UdHlTcXAycWhsQmdNT2JEZ0I5SDhjWXB3aHlhYmsrUTJIM3VYcThkeThl?=
 =?utf-8?B?UnhHYit2MlJVK3pnbkVMNVhvYWhSN2VHUEljYUVCTFdndm1LVElyaUd0eUNl?=
 =?utf-8?B?bjh3U29QMFZRb3VsQVNUYjJYNUlXNW5XdzBpWVJKRldjN1dmZ3pEK05UcFhQ?=
 =?utf-8?B?Zjhodm1RdG91OGZwdmxiYXgvR1EzSCtFditWbWdRdjVPSFlyZlM0OFJ0REZw?=
 =?utf-8?B?UkV0SFVvNng2T2hJY0R1T1pzNDh1VTZocWxjUWh2YWtMNkRzdWR3QkRLWnlj?=
 =?utf-8?B?TGxxbkdQcmJUVTJSc0hCb3VFZDlMVkdkM0JHaTB1WU15NWgvZG1GS3BNbnNS?=
 =?utf-8?B?Qy9Ic29nanJXVDlKZXdhZnJRVVJlaURUTU52aU5ITGlKTTdyeFZnOGhYZ2cv?=
 =?utf-8?B?bXJRV290c283QlpDZHlsdDZieHJSWVMreFhFMDMvK0xEY292WElCNTdMd0Fl?=
 =?utf-8?B?KzN3ZVNxUlg3dTZRSVpNMUNWYUpjaFIwVnoyZklZL1g4dmNkV0ZaZGFLMzNs?=
 =?utf-8?Q?RnL9S/i80kiBeR6INzqV?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3bf2650e-a0f2-4c55-dba6-08ddaa1b23dd
X-MS-Exchange-CrossTenant-AuthSource: DS7PR19MB8883.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2025 01:39:30.8808
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR19MB8122

Hi Jakub,

On 6/13/25 05:29, Jakub Kicinski wrote:
> On Thu, 12 Jun 2025 17:10:24 +0400 George Moussalem wrote:
>>  [PATCH net-next v5 0/5] 
> 
> I guess my explanation wasn't good enough :)
> This is not a correctly formatted series. It looks like a series with 5
> patches where patches 1 4 5 where lost. We need the cover letter to say
> 0/2 and patches to say 1/2 and 2/2.

got it, thanks for the guidance. Will send a new series shortly.

Best regards.
George


