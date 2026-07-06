Return-Path: <linux-arm-msm+bounces-117025-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id B2DYFWcKTGr8fAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117025-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 22:04:55 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DFD6871544B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 22:04:54 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=outlook.com header.s=selector1 header.b="Qcjb/swc";
	dmarc=pass (policy=none) header.from=outlook.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117025-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117025-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3D3C83007885
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 20:04:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27A8333BBCB;
	Mon,  6 Jul 2026 20:04:52 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazolkn19010018.outbound.protection.outlook.com [52.103.7.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4AFC3890E7;
	Mon,  6 Jul 2026 20:04:50 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783368292; cv=fail; b=LQOny5zVt3AkR9oJZrieFXPkoHECKaC8QRinKp1x9eHLOPwzUl7LVTHBBy50fauPHQmad7UnXakKCG5L8dakZo1sOBpI4r/kxs+caMIsTi2CYwFbN7PgqP8/PIflTrp8SZH+iQ61WfcJM1OH2AW/f2ywbMPl//BYPquTHAX6kNM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783368292; c=relaxed/simple;
	bh=lIRh9DnRhg94GF8rHZr+50Yw3yNiWvvuSm5dcg3HwDQ=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Hg/uEm+0xFnZQWb4m9REEivC4crLt6hKj4quJPLYE7tm9OAOKg9SsVubF2h52uS3GGb7k7gelpOym7wd3ZK+6YohowYKhsgOJkfTjUnMI5CRg+SxrLnDhU/R/knCMJ3eiA6hxMcG8HEIGyoJ/zHOUYNPwKTgACwyaea15qYSbl0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=Qcjb/swc; arc=fail smtp.client-ip=52.103.7.18
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HnCCkMkB6taNMj0RGU0TyCkHs1LQhP1K7IRRFMbK4F/9DGTXfcSS7F8jNVxA68mcmLSXQQ7TUCGJFExtEN4FoV8lp6nhUyrmqc3FalNI0ZgB+gBYBJ8rD/tKmmjIllevXFTT6XbNN3qHwiZDkZgc+x+U2lQPFnRLzpreyDSrCwBloIJoZ3e1O7Hk84jh3Ty8y+WApiVQZvRfnh2SIpZYYxidrHvw0oOgyP+BlaFZ1S9jeteAonE15I1zQ5INHyfb5PG5AAfkYoGMcuMWqbPyDhwR10YjgFNFms55+GiUzL6XGvOvt/W4YhkheDdFcQxcjLVeW2DxyyJjmySRakXzGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AHYx13aZoRWuTFwlF20PZ5IU/gI1z12NmkTd5Bg1wfM=;
 b=M1VggNBCfcI7UPwVInWnovYvB27cHqETya2eAbm5+vcY63OFyeKhj2+25zyzj6NXyBhWMly7f3EVmy4ll3fT3OFClvJLMs0EswJFWvJYJJEH9Ry95DXOhNm3+tZHzxdDo+JmEGfa/GbEvs8U01Urg79fTXmi1O1OspJo7pYsJAQo/TBgqeyeQudZDpVtn5m6jxLwWyTNs2Q+kb7aEH4wqK1jDD/utyuha2/tAW0OtXhT1xQCiOo+Mz5Yl9pAbJ7BgSuOIgFh4dUB80IFe3kIAA5xEIb3PHn8BRzcS7sdJ5TS0RSR15oiEZErC9U9Rcp50FapXcZbyEXnExaiz1ddNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AHYx13aZoRWuTFwlF20PZ5IU/gI1z12NmkTd5Bg1wfM=;
 b=Qcjb/swcVUVfpoamcFK9mCoYsQdcf9MmmQ+CS8BKYNg5bbmnBXqWA15lCFVi5RigeohIB4+F7wsrHUCHbueToNsf2VSP1yk7cbNGQutNuWXQ9Rd+1T2KabOxqXpVWDWciGPQMbzXu387PRC38XpVS2BVI/dOQ1DiZKzhks62i/5C59bo4zflTX3lGMz8mXMITF59AQYKQmnL36a1FRI7LCoSnn36T43wj3SF4MbS1LLtGfY1yn3d+s+tkg7p4rGU7zx/hnklv6CmL0T0fYI1rY5q9tpYJjOd7aB8SgmsbBXHDju3rVj2e5ngB44+s3XuJ+gTIBnGx5acl4zqRZ85Ow==
Received: from SN7PR19MB6736.namprd19.prod.outlook.com (2603:10b6:806:263::12)
 by DS4PR19MB997333.namprd19.prod.outlook.com (2603:10b6:8:34a::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Mon, 6 Jul 2026
 20:04:49 +0000
Received: from SN7PR19MB6736.namprd19.prod.outlook.com
 ([fe80::4b6c:b84f:b71c:d0a]) by SN7PR19MB6736.namprd19.prod.outlook.com
 ([fe80::4b6c:b84f:b71c:d0a%3]) with mapi id 15.21.0181.009; Mon, 6 Jul 2026
 20:04:49 +0000
Message-ID:
 <SN7PR19MB67365F06A4CC7405BD68AE139DF12@SN7PR19MB6736.namprd19.prod.outlook.com>
Date: Tue, 7 Jul 2026 00:04:39 +0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 6/6] MAINTAINERS: Add entry for Qualcomm IPQ5018
 Bluetooth driver
To: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>,
 Marcel Holtmann <marcel@holtmann.org>, Rob Herring <robh@kernel.org>,
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
Content-Language: en-US
From: George Moussalem <george.moussalem@outlook.com>
In-Reply-To: <CABBYNZ+6BYa-CrC08piL++ysOomiWK2gbYAv3ecWwpE+RpsNOw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DX0P273CA0010.AREP273.PROD.OUTLOOK.COM
 (2603:1086:300:26::16) To SN7PR19MB6736.namprd19.prod.outlook.com
 (2603:10b6:806:263::12)
X-Microsoft-Original-Message-ID:
 <da925d57-fb32-486d-99f3-7e3f60c24453@outlook.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR19MB6736:EE_|DS4PR19MB997333:EE_
X-MS-Office365-Filtering-Correlation-Id: 6394e010-d625-4b4b-aacd-08dedb99d513
X-MS-Exchange-SLBlob-MailProps:
	Cq7lScuPrnrlC5lHdFGci+YUsdS3F/CI9BqgIEiqDhLztDlWOXothWqYFIEFXsS9f6jt1fZF+NCMXWqmNgnr+0QCfXG7pepr1Fse2rIkCJzpo3zmhyQWFRy+Zc7rOCFQQcdH5b1puAaioP+RdbQXDG7XZx/4uTCuWAClYRTk9MKuCPC0HW2VOq2KXNQXulbWMAY/Dgf1dt9yavScNBY9wQ6xPByNaGDZxEGDKbHit65owsu3xNNhHiH0aobiBOdQt1pdIbAfQDg0SgPqpx8CaY2q3Xp89za8tK0W1fmJaV0tviRBdIl6u0vPg9RwH6KehrHsXH4eV8dp3HyXh3NzWiQFzeX/ZS3e9+kA/38wLrOUgA0FudecHVigvyyph4jLrWK54RcQ1UNIZZeu9AYWktQQQCpE3wc9/V9GAPrTrrFRSGbDLKlAeXy8/KWrxvZXiGud7BUU9opQnNX4usXh76y1hTkbXrmQuH2krYsRjYViur3ndEFfpcGtBqFKXFEKL14bU/8ON4sTJodspjUePDAcu8PggomoTnwGALhFgFjbYPF9i/cizl+KUb+KPnoib2il9EvuIKs4UHSbvhutR3BRgtw7UqAeFEWe89xCpzOsy2kUi95mPLR5Z5u9UVbJASmLs4b2OwTvT3q0h9P76YMEhwdF5odKW8nMG326XosHF6mLfiBr8GO9AbReqfM4E3XG6/gge8/ZpSt3/x8KCm/2igQ91eZ9ZZb+2VDIzaRyd9UcorZWy3+LmlZz3FYew7RuTV5jFVQ=
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|4140399003|51005399006|23021999003|15080799012|37011999003|25010399006|5072599009|24021099003|8060799015|19110799012|6090799003|440099028|3412199025|40105399003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MlMraTNuRzNUL1Z2Sy9Dbk81cXpVZkdldGgxNGF3MXhLRHlsQis1V2Y3YnUv?=
 =?utf-8?B?S0pNNDBIaGxqS015WUw5a1kxdUp6VFord0p4M1lVYWdVOGl1ckV2UWY4aGo0?=
 =?utf-8?B?TnhuQUoweUlReU0zMVBJNGRYMmgvVkpib3ljYzVCRVVWaEVqTGtaa2l1anFm?=
 =?utf-8?B?TlZLekJoakt6UWNnU0YrZWdtTzFnZlBiM3lqNjBrUUd5d1pzaGtHd2VYUnVJ?=
 =?utf-8?B?NklaUW9ZQkZLbXVDMjAzNkowcU51M3J6ci9iUUpRSVhRTEJacDg0eUJnNVJE?=
 =?utf-8?B?ZzFRSiszbURnOGRFd3lTRkVhWk9PY2NQNVJiNGU1L2pZeExXVW9aTFZDcTlO?=
 =?utf-8?B?dW1pUTZjcXlsNWtnL2UvUEJwK1lYZkl0UVJUSTl0aHduaVE0TjEwYmZZSDF3?=
 =?utf-8?B?K3FHcVh2NFhGRVVldjVyV1JPRTRiL0lPTGtWS216NU1udG42RzBidmcrR2Ri?=
 =?utf-8?B?VEpzbkROZE5zczdjQkFqNXVhWFY0NXRIb2Z4d1hDZTBVRkNsNEk0d1Vuc0oy?=
 =?utf-8?B?MWxFcXcyeUt4U3hWSXZJOGhyczJVbzA1R3lvUmpqYU40Ly96WmF6aEg5bjZC?=
 =?utf-8?B?Q25IZ2xuYSt2TUYycGtxa3NlWlRqaW5GT1VxQWZ0V2VsSG5BSExqSTE5cHpF?=
 =?utf-8?B?Q2w4ZUpObm5oQVUxUTJEaThyVnUybTRwNDIwa1NTRXJyQ1g0REp1SjN0Wncz?=
 =?utf-8?B?N3hRb0wrODRMTSt3Z1NQNzErZmNhSnBZNTVUQ2hwdlEyN2lidGljak5mcmMv?=
 =?utf-8?B?NzRYeENnc28xSHIvbzJWQTNDbWFMeXF3TVRDMkwxSUNYaUVZL3RHYlBMUnM5?=
 =?utf-8?B?TzFSYUs0NTlNQ0VlWGZxU2YwdmlwM2YyL3B5eC9HNEVubDAwZmw5NmVTZWFw?=
 =?utf-8?B?U3JNUFFDZXB0OVU5a2RscWpGaG5SczZMYkFJVEx6M0JNa1kwTXd6cW1JeCtX?=
 =?utf-8?B?bk1SWWtiK09rWG5tSWh3ckdJL1hYMHp2YmhyVHozMkh1MkE3M0lTT1hlWWxM?=
 =?utf-8?B?d2FHN0poQ2N6WDRIRVAzTDF2amRkK3Jrai9IZnJOczJxVU1ZaHhwdzdvWUd4?=
 =?utf-8?B?Skk3R2ZNWGZva1lhSUIrVThpbURJNVdRNFhwbkYxRHVtZUNudmxSRkQvOHJU?=
 =?utf-8?B?bUhqcWRDV0pxTU9oNU9lNm1qMVUraUcxWFViZW5sMHE4cG1GMVJnM21DRFZ1?=
 =?utf-8?B?cEJ0SVU0Vlpsc2dpdFJGZUZYYUtzWDZqdUE5a1hNR2I0NFdabDdPenZLa2JV?=
 =?utf-8?B?RG41aWp5cDdseWpuTkRrbWJ2L0dBVE5nUVZ1VElGZVJNZ2VEaW5vRWp5aGdU?=
 =?utf-8?Q?SCKZOztl6PPiKJ3brd4zc+MyqqeFWLb6Hg?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?c2hNMHFyZnRncWhDeWtqOW9vdHpOdFdyMnhsWEZmNzBuTTFhbjEvcllQYWdS?=
 =?utf-8?B?amVsQ3pQdzRTMzJuWXJZK2dWS1p6ZTllU0M0YksvT1VsMFdrNktjQkdHTHd4?=
 =?utf-8?B?RXFobjc4b1dqNFFoWmtkTGZFSU14Q2xlN3ZKaGp4ZWlEd2ltcU9ad3laZk9K?=
 =?utf-8?B?MW9QSnVrS3M2L1JQUnRJWnRIMlNrY0RzaTZxb08xRjFZbjg2dExnd1VlVFNP?=
 =?utf-8?B?dklraGV6MmVEaXl2bnlUM2RpYTdwbWU1cE53d05rdlRCTkc4aVpWcGIvNTZi?=
 =?utf-8?B?SDFwY2YrUFp1b0drQnF2VmsrOFhrWGxLSjVjU0UvU1BvWXlWVDFpK1UxZGVr?=
 =?utf-8?B?RFlqTno3cnpyTHZCR1lTejh2UmJaQzhza1BlRnpSNGNXSFljOXJqSjlFS0Zi?=
 =?utf-8?B?ZjhZSlFsWWZJM2kvVDR6R2RaUUNoOStGcC9iZ0xPOFVkUDNINGlnaUZERTZy?=
 =?utf-8?B?ZVNBZHAwMFFnUW4xajJ6TS8vSzRHQmQ1cmU5eXpNR08zMlM0ZjlBeUFLYmV6?=
 =?utf-8?B?SW9kRFdqWDkyS0ZEN3JBNFpvZUZSbUlkRHM3UE5XZytuREZkMy90RjF5aXMv?=
 =?utf-8?B?V2QvdUZYL0hRbWRtNE5BWVg2YU40dTVucTlvck1aazBzT01hSWlEeFU5cmhR?=
 =?utf-8?B?RkZCOWFLK2VINDIxZGFvUVZGRFZMSzl1UFVHR083UjFaSUVEYVg3STRUQ1Nv?=
 =?utf-8?B?MXVzWG55aUQ0R050VU16bG5KbC9pZmQ0VmtyY0RZeHdtakl2eVRWVkdhNUZB?=
 =?utf-8?B?S3JuZ3hTL3ozQitvcW4rZWVxUGJVWjY3MUYwYzVDVnlPMEljVGQ2SDIvRW9Z?=
 =?utf-8?B?dU1kTnhCbVQ2a29uQnY1bzhoUW5ISThjUUNBYUlEdFEzdXB1L2ZGZ1pjRXBt?=
 =?utf-8?B?c2pwVldacjZsZzhocnhIcGhHZHY1SU50cUZLWWQvaVE2VDBLSVR6Rk1KYzV4?=
 =?utf-8?B?RXRIZE1FcTlNNTBscU9LRk9zYXU4OG9hN3dNdVF0SVN2MEJhZzNIZmFIRSt3?=
 =?utf-8?B?R0QrcEMwaEo2eUNkVyttbGV3bjJ1N3R4YUp0VE50aDduUE03cnhQVGErTEFZ?=
 =?utf-8?B?TmU2OGtQMWF3N3F5YVRtMTdsRkh3bU0wMjVNeFlKNzRMUUFKUlQ4QVRPQkhV?=
 =?utf-8?B?UnluNHlidDAraGVvL1hudnpOQ0VYV2V2VUdJcnhSdmY5RnJYOGZsMWsvVmt1?=
 =?utf-8?B?cXNXQTJaVUF3TTliVDl6MUp3dG1GQnBSSXhNd0JTRUowR3pHYXFKb0NLczht?=
 =?utf-8?B?cXEvQUJjWlQ2WFFMRWZJMmhHdmRoN25ZVi9ocG53Si9hU3pUa1FkclJhb0Jr?=
 =?utf-8?B?NXlxUjRGTE9DNGExSzZEZ3ZSaDlsSHJhVjNoVUJ5RU00cE5rNzdvc3ZHZW9w?=
 =?utf-8?B?K0szS2F4VHN5SWJtSldmK1ZRbEgzTkRNazJPS0JaZzR2cHl0aHNiUEY2c01K?=
 =?utf-8?B?MUdVWmZBeGVCeXFyNytoQjdCSkVOeUdLcjJSM09LME1SVVoyUE5TT0MyVGdz?=
 =?utf-8?B?Sy9YQndTTStjMmlzaldpakF0NEdsNC90d3JrU3psOTloaHozMks4alJxdi9v?=
 =?utf-8?B?Q2gvTis5RnA5MmFNT01yeGY5SzZ3VnEyY2xPSjZma3BhT01ubVFFU1c4UjNP?=
 =?utf-8?B?RldoNUdzMnRHbk5wOVRaYWZvQzZoOHNIYTNGZnZPMlhYejlYSGY3dVE2dXE5?=
 =?utf-8?B?ZDcxMXdhbENRNi8vM3FlS3hPdzhocW9GRlJSbk1ON3k0VDVwSlY3Uy80VUF1?=
 =?utf-8?B?UDEybFdyM0xqV0VUMHJyeDg3dEhxRWhicW9mZmdoMVJmK0g3SXplMmdrN3Nt?=
 =?utf-8?B?a0hLczNBNjdlTGoycjY5ditXOVZ6bDh2K1RCRWhKNmhUYVJFMlhVd3R4b0li?=
 =?utf-8?B?T3V5Y202anNPWHduRDQxVnc5SVdQQXorWEk1U1Q0WmVhSHc9PQ==?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6394e010-d625-4b4b-aacd-08dedb99d513
X-MS-Exchange-CrossTenant-AuthSource: SN7PR19MB6736.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2026 20:04:49.2157
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR19MB997333
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[outlook.com,none];
	R_DKIM_ALLOW(-0.20)[outlook.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_MUA_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:luiz.dentz@gmail.com,m:brgl@kernel.org,m:marcel@holtmann.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:p.zabel@pengutronix.de,m:linux-arm-msm@vger.kernel.org,m:linux-bluetooth@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:bartosz.golaszewski@oss.qualcomm.com,m:luizdentz@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[george.moussalem@outlook.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[outlook.com];
	FREEMAIL_TO(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-117025-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,vger.kernel.org:from_smtp,qualcomm.com:email,outlook.com:from_mime,outlook.com:email,outlook.com:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DFD6871544B

Hi Luis,

On 7/6/26 22:36, Luiz Augusto von Dentz wrote:
> Hi George,
> 
> On Mon, Jul 6, 2026 at 1:27 PM George Moussalem via B4 Relay
> <devnull+george.moussalem.outlook.com@kernel.org> wrote:
>>
>> From: George Moussalem <george.moussalem@outlook.com>
>>
>> Add maintainers entry for Qualcomm IPQ5018 Bluetooth driver.
>>
>> Acked-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
>> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
>> ---
>>  MAINTAINERS | 7 +++++++
>>  1 file changed, 7 insertions(+)
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 0b9d7c8276ac..60f7251d1a16 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -22289,6 +22289,13 @@ S:     Maintained
>>  F:     Documentation/devicetree/bindings/regulator/vqmmc-ipq4019-regulator.yaml
>>  F:     drivers/regulator/vqmmc-ipq4019-regulator.c
>>
>> +QUALCOMM IPQ5018 BLUETOOTH DRIVER
>> +M:     George Moussalem <george.moussalem@outlook.com>
> 
> Do you work for Qualcomm or have access to their specs?

No, I don't work for Qualcomm and don't have access to their specs either.

I'm purely contributing in the capacity of a volunteer.
> 
>> +L:     linux-bluetooth@vger.kernel.org
>> +S:     Maintained
>> +F:     Documentation/devicetree/bindings/net/bluetooth/qcom,ipq5018-bt.yaml
>> +F:     drivers/bluetooth/btqcomipc.c
>> +
>>  QUALCOMM IRIS VIDEO ACCELERATOR DRIVER
>>  M:     Vikash Garodia <vikash.garodia@oss.qualcomm.com>
>>  M:     Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
>>
>> --
>> 2.53.0
>>
>>
> 
> 
Best regards,
George


