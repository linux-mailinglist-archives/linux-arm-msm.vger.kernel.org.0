Return-Path: <linux-arm-msm+bounces-116334-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 0/YmHiLDR2qdewAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116334-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 16:11:46 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B8F070349F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 16:11:46 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=outlook.com header.s=selector1 header.b=MWS150gF;
	dmarc=pass (policy=none) header.from=outlook.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116334-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116334-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5418F3010630
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jul 2026 14:11:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4D603D9DDF;
	Fri,  3 Jul 2026 14:11:22 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azolkn19010088.outbound.protection.outlook.com [52.103.10.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 702273DA5DE;
	Fri,  3 Jul 2026 14:11:21 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783087882; cv=fail; b=ifM3a+wlWTEYrRSQQVDtGQH8ArFkV1tFIukovpaWpazhJfwZgukpp7NmPBKaMuEHWIotld76v3kv+rKEAKx/1WvFmWSIldPRfBXxlBOuM8sHFMAKaA7Zv8pDUfWey2YI9Y589KU6ihHR9AJTrKcWWDnPdYSIZjuIym9fJhHedqo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783087882; c=relaxed/simple;
	bh=UOYoCkUmgx+3urBR8chf4MqpX+110ar5kY0A7a18ylo=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=oA4sbI8v3ZpX+iWPSxDA0AE0+Ll8RIAXzWzS7hXnXzGK7+vZgCb3axn8kuFC1GsLMKp2RjJhH+ZNDzxvTscrYQcZkLucIdTZD/UoLk1ru6LoXfLuKKIeJT2En67+/pflHRyoGscbuLHC2BevRTAA+gpuONAsLe9rQgCQoiNGI0Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=MWS150gF; arc=fail smtp.client-ip=52.103.10.88
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lnizsCLVZtZexSWWM5TBrU4AJZ5QqTwDHQfdR56ntj6E/YAqhCFMQ1lXVbr3fT8kibWMRa0lNjpNpYWrfSRRmWMKNjnfKhJptzumqNWTjag5N0jC6lBWewv8H7vhRmVhpTz8fUm3aKHLC3v7KhJHWDgptXVv/wnxaOzfI/d6zE7hBUO3pRJt40KySVWBCtK+Tsrzl4clbqpVsVYcVpb6GL17JsczVgUtOkPSECNXiHHNy5oP8dD5XSJkv0PfVdkrbZZxsOKLjCtUbtJUFf1P5pTpAMkVhB7eBTr/ur4tz/mPiw+xKzEEg/P9hJcxpue9QepA5FdDydSajOaJWwZ1iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M2Ucs6RL0gQdkTR+amLftePQ9jP0Idpi9WJIa40G5WQ=;
 b=vBhXncz9S4gPE9t/CgzESHRJYQdzXGsaNw+YM7oOhgeqx0UYxKmRR5aFnygzRphr+HB1Bg3ncUHC0BMgQtv6XrgL4ISYe+PJmASR86b8yvANXDOxp1Zj+Wp5LighXO1/1b/KyLsitnRSsu1Ukm85xUVvFvSI30rZomSVxCBszT+g4d/kilC9Empk9tPAOlRgXaANwjdDdKkwArJhCApORwqMGqbfwHv7+gOfzmd9ML7CqyEEv7UX69xbJP4unV1oyozxD23917bSP/Jw/DT1vQV3yajnZSCgKTwLDe74ri0Nk6NSn0vAESIr/p2PDDW3gbLutpb55U5W/uH6qebuzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M2Ucs6RL0gQdkTR+amLftePQ9jP0Idpi9WJIa40G5WQ=;
 b=MWS150gFDcQsiVjfRVmoFQtomEMQzleWZvG43oBRduVzKSlfiNayLo7DEhazXHsIofAE0fHsr15SWGzMHCKoKtg0q/ej9YMQuVM9X/AMu3TT0C8VMgT7yPzJkP4b0zrp1Fr5ijzPRQpBljZfI8MrhajwGUXSxyQ4NdW5mXA9vtRCjc7rwwOtziFnBs4eKEVX8/VbAjrwhxwO+Nb4hMvJ9DaoORyxk+jZ4xBBY7Ht6ZQRyOB2L8KWCDFk89t9AZCpuHAWvypBb3fgZdXKijnyltG6WCTpZqEojJbNq8MrWHFKfOpczFrI/m9M57OMZfOtgZdvwufNTKR+2fWGLnZxBg==
Received: from SN7PR19MB6736.namprd19.prod.outlook.com (2603:10b6:806:263::12)
 by CH0PR19MB7935.namprd19.prod.outlook.com (2603:10b6:610:191::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Fri, 3 Jul
 2026 14:11:18 +0000
Received: from SN7PR19MB6736.namprd19.prod.outlook.com
 ([fe80::4b6c:b84f:b71c:d0a]) by SN7PR19MB6736.namprd19.prod.outlook.com
 ([fe80::4b6c:b84f:b71c:d0a%3]) with mapi id 15.21.0181.009; Fri, 3 Jul 2026
 14:11:17 +0000
Message-ID:
 <SN7PR19MB67366E5E500814687AE19A939DF42@SN7PR19MB6736.namprd19.prod.outlook.com>
Date: Fri, 3 Jul 2026 18:11:09 +0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/6] arm64: dts: qcom: ipq5018: add nodes required for
 Bluetooth support
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Bartosz Golaszewski <brgl@kernel.org>, Marcel Holtmann
 <marcel@holtmann.org>, Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260703-ipq5018-bluetooth-v3-0-62da72818ab3@outlook.com>
 <20260703-ipq5018-bluetooth-v3-5-62da72818ab3@outlook.com>
 <bfd5b522-da85-499e-a36e-b303bde791ef@oss.qualcomm.com>
Content-Language: en-US
From: George Moussalem <george.moussalem@outlook.com>
In-Reply-To: <bfd5b522-da85-499e-a36e-b303bde791ef@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MR1P264CA0211.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:56::13) To SN7PR19MB6736.namprd19.prod.outlook.com
 (2603:10b6:806:263::12)
X-Microsoft-Original-Message-ID:
 <77d2c2c0-b928-4f34-a63f-5f0b4ba1dc81@outlook.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR19MB6736:EE_|CH0PR19MB7935:EE_
X-MS-Office365-Filtering-Correlation-Id: c930b192-84a8-4a6e-3811-08ded90cf2c7
X-MS-Exchange-SLBlob-MailProps:
	znQPCv1HvwUXBahuwteIkQeW30lJPuxOacXavKdOD39ofk/1WvEkuGNH7B/hB81TV3CwsX6pxC0vtlO5KJtMOWUHoUj3qqkxCwJnX2mgm9XQD61KogSC4UF4QT4q2Nm2gzgf0saMb8aMyGSiPSAejOjUZTH6tvFbZ95HqetlgZInP6l+mn5c/mt4FZWZbQtHlDgGObKxghKuUlWyKcsp6jZyCzUPdfZ3Q7eM9x3ZuWV/pFFb8T5LkFcHbvCDKHdQzfsmKBFUiFkpBFS+G7vFiL89D1OvJ5I0KMjFkGn7JYKVLFMTlQpCQd7o/URx7SQ27k2OCuI4ENBgFsD/OHsrYtedIuBifaczT2WOMq0mGI5l4+so5UL27/YLwSM8t5bDTi8AmoNplG+O9UEdqGZMZPakn8+T/SWy0dQuGPLXRM61GU4tquIdXzJgT+ROKNyMM7oA/4FkEl2UNffjPiQV5kQWouxHEcMv2k1CftV3FugaQUUMpHK2DljER6T9jf+zv0vc1krxBqLmgGb7shnIkKYKlH1j4AIjiGzNs9lHRwYWZZmOx4whnNXZMLO3nK+zP1OYQEQyZNJ3J6Y49Hq0zMFs+WyZyMd2sHIeVmx3KF4OhXF6+oF8guilsHieqe+zEmuHJTCHX5tsxhV9XrFehqAguPGqq7u6+mg5Cwog691UsINSfN8nguHuVyV3eJ4KcLxHIt7DngbtP9UwWRXHS+nzn4V9pjkT0S0aQ1ugIlChWlRXQboC4VNIM+LcvXcntOYQ8KjNdj4=
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|37011999003|25010399006|15080799012|23021999003|5072599009|24021099003|6090799003|19110799012|51005399006|8060799015|3412199025|440099028|40105399003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eE5DeVhWdERQTFhnWEFQUHA3OFNvb3JZZVY3aS9oTkZWaVhQTjYzRkVGbHV0?=
 =?utf-8?B?U3ZXSWJEeGx2U0RtR1UwdE9sZzdTYnVFU2tnM2VQZWtVcEpMRnhSeHVDbDZY?=
 =?utf-8?B?Z0JFd2k2VEc2eWVubXpZemJqZEw0Q3IwMGFlNEE4MURWaTFHTFIvQXcwa2Fi?=
 =?utf-8?B?MHVIMkdUOHZDVFpCVGdQNmJaWXk1b1JWSFE0V0tFWHIxeFRYVWhJOTd6Sm9T?=
 =?utf-8?B?ekF2UVNoZTZYWjZvaVprejFkSi9GczZMVUl6RXMwRnBveUUyQWlZUjl3NGtm?=
 =?utf-8?B?ZzhmYmZPQS9TV3FLNWZTakNsRTNNalByZ1k3SkRTaHpvWjc3USs4b2twcldq?=
 =?utf-8?B?NWp0T2dnZm5qZnM4SVYwS2w3MVplOHRZOHVoQUdQU3Urc2RIT3ZhYS8rYW5J?=
 =?utf-8?B?SDJuZ3hQSzJTZ2RqV2Q3dWQwNVN1V0Qxcmw4Z3VPOTJ2eUtwQzBuVGZoYzk4?=
 =?utf-8?B?RFhDNThKOEVVUGpQdXU0dHdCVEhlN0ZHcVlqb2dRblZNYXFpSGx2ODhMRzhI?=
 =?utf-8?B?Z3pjVWcxb1hDTzJWYWh6cG9XeWRONlJkUXlJdURJKzd3bWZFcjhSSFFQaXdZ?=
 =?utf-8?B?eFNBWmdvTXQvcGNiNWhKeHNsaVpvOHd3eHhzZFVWNkw3cjV2N3FqRlZ1VkFI?=
 =?utf-8?B?d2Z5TjJ2Ly9CNGlvY20ybjU2QjNGYmFkdzQ1RWRlaTZGWE1handmUVJGVlJP?=
 =?utf-8?B?d1p4ck94VXk5b3ltL25RcmlXdDlrSlJHL1BNeVVvclJTcmpyWEtjYk05UVFX?=
 =?utf-8?B?ZzEweTVtbDBReVZmR1ZnUVhBWVlGOE5ldXFWaDhldGdZSWlRSkFxdWxrbThN?=
 =?utf-8?B?NVk5U3hHSzB4cVpsWUsxaG5odzRjalRab2NGd08wVGY3SW1rckNCQWdHZnRF?=
 =?utf-8?B?MmZXNFBtdUJtNGptenpsSWhNTm16SFhVeC9qdU5uNzd2RTJ6YlRrcVd6cjhI?=
 =?utf-8?B?SDFlWFpwcTArZ1cvRzNVdHJpQkJMK1QyR2I0YnJSZis5T1BDSDVIVndzQldS?=
 =?utf-8?B?L20yaU5MazZ5eVhIR1BsQnZSOGtNUkdaMkwxUUJEMmdaemlJVUR1aW5VZktY?=
 =?utf-8?B?emF1ZjVYRkpOZlZLalJPZzBHNUswZkdveWUzTVIvSEkwUzlFb3p5Y1V4MUUv?=
 =?utf-8?B?elY4TUorWkNyNjM2enRQQ2RST3dKNFhxdWZIR3F4QysrSDkxVHNiZEYrSEpX?=
 =?utf-8?B?NEYxYktqWmppNTJUZWtMT3ZqTktmYWtXOXZITjB5Sysyenp4eHd4bGhHMFho?=
 =?utf-8?B?NVNSZ0dyR3pZMnFHQnJzY2JDYmx0cmpYMVF5RVQ1dmlpcm1yenZPSXNpbVNi?=
 =?utf-8?Q?bqZh1umqwitIRB84WeET777vxgbcmUSytb?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YzVhbERYcXREdGlzd3U1b3pzcVFBV3JuNy9NckpldCtWeVlPLyt2Ymxzek9O?=
 =?utf-8?B?QjVUOEJGRHM2a2dJQzRKOWVCNzVHY2FRUlRWN0k4aytvem1IdlBIZmtFZmQ2?=
 =?utf-8?B?VW9EckI1RHByN3g1SnN4cFZpdFVXTGZVdHFhNWlQcHdJWmU5aEUwOGxNR1Nh?=
 =?utf-8?B?ZXBSMitlL1dHU0NOSnd5ZURsUXErdnRJVGpzVXNuelZLK1ZLc1VYQmdNT0Fu?=
 =?utf-8?B?NFNJVUU1bFVpUlFpeGU2TUovRmJ4YjZSbEdKRzlwNkkxanBZODUyZG96QjQ0?=
 =?utf-8?B?Uk4rVWpYaGVMcGw5OUtYLytRckJuK0dtMi9JNGRqdVRHMnBZVlR1Z3lkSFZZ?=
 =?utf-8?B?SlFBdWpHbnVSUEJJV1VIWFZuQTVOSXQ3ang3YVdKMng1cE5sbUFGRWY4bCtx?=
 =?utf-8?B?aCttU0w4WUlncFZtMVY4d1N2Yk4vd01YR2Rab1gyUGp0S1lTTHZHK3A2YTA0?=
 =?utf-8?B?a0UxbTQvTlNRRXRhb0FFcHFCUjQwNGtzdURsbE1TMkhCWGlBT0hhWlphMndP?=
 =?utf-8?B?VnJBOHlBQlpQcWEyRkNoWEkrVGdPdEVjcWRYN0ZITXQ4enBYTUxRRE9EMUlt?=
 =?utf-8?B?VFBGby9SYWpiRFFZZWh2RFhocmtHYlhrSTBXbXBoOUhjTWt5OWRRVWJJRzBu?=
 =?utf-8?B?RWFkbndtam9YVVFXUDFObDFFaW5aaWFlSEhqcXpRQnpzQzdXRXFmaHpVRmdq?=
 =?utf-8?B?dGJzZTNqTEJNMWpJNythRjV5MVNDWmVvSWU1VUlndG51TkkwUlN5Ym4yT2wv?=
 =?utf-8?B?QklTcmxQc2xsbFpTOEMxU0J3a1MvYk9NZm45VDdsdEsrY3pFak5oR2hXWWo2?=
 =?utf-8?B?VHVDdi9MTkY4ak9pOGJNR01uSGZUVFpWMEcya3FoOGk2YjdIOXA3ZGdqUkJ1?=
 =?utf-8?B?dW4zNTQxejFNQldqSWp6UktCcUpGdXZRRThLOE9aWFdobDZwRHl3S0ZuOU4x?=
 =?utf-8?B?c0tveEhHa2k0TWxiZmcxT3kxa2NDTjB6NU0ybkhDRHZMVGRFVHNBdkszWlY0?=
 =?utf-8?B?anpVM3Z5NTBQcWhSM3NXMmh5TWROUmlIckpzOElvdzNWSFhNL1dSbFR1bVoy?=
 =?utf-8?B?RWNxNjNuUmpsSGxoTmR0LzhtTHVBNU5TUlBrSW4waS9oL3VwN0Z3Y0NGQzE3?=
 =?utf-8?B?d1Rtb05BRlVpcEFUM0hEOXViN1RyejhzNWR6a3g3SVZWcWhFeW84bFNiQndk?=
 =?utf-8?B?d3NYYmtMZVhDT2swOWg4bmQvT1pUTTllc2UzbytUT2RlejlBUXRRUGZUendN?=
 =?utf-8?B?b2Q5eDl6RGh2S2NDRlhkMGVZRjFiaWJqQlltOWY2dVpUVGJ0cWQ3a3RZdHpR?=
 =?utf-8?B?b0FjQ25LN0dlQzFSdzhxcW9lblU0TC9FbHdwRlFRVzZaYWFFQ1pkb1l3VHNI?=
 =?utf-8?B?bGpMNjFCdUE4aitHcWJxMjlLNHdUM2VpT3doWGZaQUZPdlppVVdRSXF3Y244?=
 =?utf-8?B?UUhXdmdTck10dDArWjdBMEVGdDFTRzNoYnplMldJc1RWRURFUVhjNmtCZHgx?=
 =?utf-8?B?U1lWd05tNDdZSlBQdmpZTDBjWjdSckZzZzZkalgvelFHdDlPK24rU055OVNa?=
 =?utf-8?B?bXdscWxtOGlCd25zSnlWN3lFaXF3MmQ2cEFZYXZaSVd3OU1Za0JkOGsxRUVD?=
 =?utf-8?B?V2RIOS9KTnJMSDd2TU8yWUVRQWRmK1h5eDdSbXBudFVVRlprREgwa1FJZDEz?=
 =?utf-8?B?Rm1tSFpsRThKVWdOaEZacldpRVpZaUd6alQ0SFZNVVZoOXQrekJ0YWw4SGFW?=
 =?utf-8?B?MVFRSUZUMGRiWVhzV3dMeE02Qk9wTXlFc0w4Uk5qZEdmYmRVRTZLeFR2dzNh?=
 =?utf-8?B?MUZXUnNmZGhJN2ZYL1FjMjR5MHpaQ25YalYzQlk1UXNvUEw5UHV6RXpMTFJS?=
 =?utf-8?B?QUFTZEFoRVdWSEVYUHY0d1R0dmdVUUpoSitRSkIwWEQ1T2c9PQ==?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c930b192-84a8-4a6e-3811-08ded90cf2c7
X-MS-Exchange-CrossTenant-AuthSource: SN7PR19MB6736.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2026 14:11:17.7257
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR19MB7935
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
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:brgl@kernel.org,m:marcel@holtmann.org,m:luiz.dentz@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:p.zabel@pengutronix.de,m:linux-arm-msm@vger.kernel.org,m:linux-bluetooth@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:luizdentz@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[george.moussalem@outlook.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[outlook.com];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,holtmann.org,gmail.com,pengutronix.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-116334-lists,linux-arm-msm=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,outlook.com:from_mime,outlook.com:email,outlook.com:dkim,vger.kernel.org:from_smtp,SN7PR19MB6736.namprd19.prod.outlook.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0B8F070349F

On 7/3/26 14:38, Konrad Dybcio wrote:
> On 7/3/26 7:01 AM, George Moussalem via B4 Relay wrote:
>> From: George Moussalem <george.moussalem@outlook.com>
>>
>> Add nodes for the reserved memory carveout and Bluetooth.
>>
>> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
>> ---
> 
> [...]
> 
>>  		apcs_glb: mailbox@b111000 {
>>  			compatible = "qcom,ipq5018-apcs-apps-global",
>> -				     "qcom,ipq6018-apcs-apps-global";
>> +				     "qcom,ipq6018-apcs-apps-global",
>> +				     "syscon";
> 
> You'd have to alter dt-bindings for this to be allowed. But I
> don't think it is. The functions to grab a regmap from an OF
> node create one on the fly

got it, will remove in the next version and adjust parsing the syscon in
the driver probe accordingly.

> 
> Konrad

Thanks,
George


