Return-Path: <linux-arm-msm+bounces-110904-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id AwT+HCvNH2o8qAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110904-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Jun 2026 08:43:55 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 10D69634BE8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Jun 2026 08:43:55 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=outlook.com header.s=selector1 header.b=nKulzzeb;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-110904-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-110904-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=outlook.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id AFA07304ACD3
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jun 2026 06:43:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50F5238399B;
	Wed,  3 Jun 2026 06:43:14 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azolkn19010027.outbound.protection.outlook.com [52.103.23.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C68413803D2;
	Wed,  3 Jun 2026 06:43:12 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780468994; cv=fail; b=bwS853Ff0Y6izYH+9VY5+vfS6HuzNUXpDxcDPWffiqKDMLcfaJzaBFHLNdnVsfNQiFHuembhuN+9WGfTuNcYJ6Q0C32ApdfdnVFODnGUtAN4ck4p+kRo/vry97ydNPzgs+F8SOP1vr/ifq5awsuajIKMdRc5FYoTvLLRW3z02jg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780468994; c=relaxed/simple;
	bh=mRsCH8qz/OQ9Chz61CfaIHJWapu7QOaaZM9F86ZqQho=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=bqNtVgtbnkZi2TobA06IvFo4ZXousp1UMxJRYpZl0LyJSt3eVuffpwMn25OVZ04clPrKVoc+JJzp0DCE/qtRbWZwo4Cle5hyYHH6jKr9C/9A4m5J9aEUMcfHdbCMWsAyQL5BrdqhEnDAyzAVAhEZNjs2O4FilRR0U242anfqUlg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=nKulzzeb; arc=fail smtp.client-ip=52.103.23.27
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ym8kq1kHV0P03tPr40S3r8dO7sdEkNNzW2cjsLwXyuFmZTBVQOZcAxQI+rAe2o+xMJqJ2saMsulW4huqCrWJfccEI8O764HghXpBrNwsk2+M+CEh05iWnY98R+a4T3f1rB8xHhtOhG/k8eT9xilgVYCIfBR7vqnmg8XzWfjH2gs0wSqoRUT6GMxWSbXIrqac+2T0iorvYz/jCxioLXFB4Zf3t8gAgOrSXFI78dSeD1eyiJYJirJxL6gpP3ibxL5W3erDsphszcA2TDrLTNbDZeZRbt8J6TbDGLwtMtCF10jEgaEoBt7mcjp7qNjBpM1bSLxk/S8MKUjFtATyLhjU7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C3Q0SFFvSt7o4fKKodrZPkHhB9oeNfziNErf01jd1Qk=;
 b=FKYrvmGO+89Wes9MiFMFQhoc9e0z6YUpGR5RH8cIpo2SriYbo0Fh6NfEKrVawBBiFIC2paXQ262qS2bwn2xzhev9STR3Ox31fKVLD4YxYpmDzpimJMsXIAAhKxgKm04J0Xkw4wYpgzyxc3o1t++KAmCdrC7A7b+aYXUnIyylwlKvA5h4784UfggO/iQJTMsXCGA1WOEJbwr/pKWeIaVdQyA2nl0q3uPxG82QVKq+oQvzcdgAdD87ttFYqp5iKAoLXQDIjNXKALN1zLIdX0fkLyGg/A+uvyKgeDJBoC1IGO0quQBr7d6LVE7O3fO6Xzr/woiOyKN5qlS3NP81J85pbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C3Q0SFFvSt7o4fKKodrZPkHhB9oeNfziNErf01jd1Qk=;
 b=nKulzzebuwjqibyzRwmfpHZzQLbpCp8lGeewsxCBhh+5+BWstGMyOG7XnNytss+1AYIx3jVodumcFb4JTb8Y4mUbwoQeXyRIYjG+uOjx1M1qEGFk9iDATl3m9Y5PmDkvNXw8pOpKp9psKQhIZpZ9aVQMu8ZY7leS5GBrvfbM8IwYqnvkMxuJZJfc1FuCZ7O1IuxPFLLA7yqOi3MNnz6HlNZhqfPkr19HVNY4xasdmGxWZm6o1imQAvR+abmjPSzGSV9ADx+nGRAnP+kWL20bblK6c3g0ena74a9+xfBDLy90veV63IvKx+xTPQZP4tX6iksK4O3lkevYAsIA1qYNsg==
Received: from SN7PR19MB6736.namprd19.prod.outlook.com (2603:10b6:806:263::12)
 by PH0PR19MB5132.namprd19.prod.outlook.com (2603:10b6:510:90::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.17; Wed, 3 Jun 2026
 06:43:09 +0000
Received: from SN7PR19MB6736.namprd19.prod.outlook.com
 ([fe80::4b6c:b84f:b71c:d0a]) by SN7PR19MB6736.namprd19.prod.outlook.com
 ([fe80::4b6c:b84f:b71c:d0a%3]) with mapi id 15.21.0092.006; Wed, 3 Jun 2026
 06:43:09 +0000
Message-ID:
 <SN7PR19MB6736D1AF2EA0ED8ADA4A72E79D132@SN7PR19MB6736.namprd19.prod.outlook.com>
Date: Wed, 3 Jun 2026 10:42:53 +0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] dt-bindings: net: ethernet-phy: move clocks
 property to invidivual PHY bindings
To: Conor Dooley <conor@kernel.org>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
 Russell King <linux@armlinux.org.uk>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Florian Fainelli <f.fainelli@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org
References: <20260602-ipq5018-gephy-clocks-v2-0-65a1f1d881f3@outlook.com>
 <20260602-ipq5018-gephy-clocks-v2-1-65a1f1d881f3@outlook.com>
 <20260602-defense-diabetic-8a8e8e03a536@spud>
Content-Language: en-US
From: George Moussalem <george.moussalem@outlook.com>
In-Reply-To: <20260602-defense-diabetic-8a8e8e03a536@spud>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DX0P273CA0040.AREP273.PROD.OUTLOOK.COM
 (2603:1086:300:58::10) To SN7PR19MB6736.namprd19.prod.outlook.com
 (2603:10b6:806:263::12)
X-Microsoft-Original-Message-ID:
 <39f57a9c-ba0c-4124-b3fe-3d7e1327e1dd@outlook.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR19MB6736:EE_|PH0PR19MB5132:EE_
X-MS-Office365-Filtering-Correlation-Id: bea12255-4461-4c90-2767-08dec13b6003
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|37011999003|24021099003|55001999006|6090799003|51005399006|12121999013|5072599009|23021999003|8060799015|15080799012|19110799012|40105399003|3412199025|440099028|10035399007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZXlGckd3UzRYOFpTUElZSXUrck1nY2pIVWRJcmlOeWlVaXpSQ0FMV01xM2o5?=
 =?utf-8?B?Q2N3TjA4ejdYc3FkNkRZOWhnOFNPNGF1NHJkYlU4RFZHcWxkcTUrRWhrL3BK?=
 =?utf-8?B?MHR0K3FzbE9sd2FZWnl3VzQ1YTFldGlOdmlDdVdMR1MzODZVd3ZhNzVzZTc2?=
 =?utf-8?B?WHB2U04zMnJaZVp2RFlRM0JLLzVmWUlVcitIeitiVXovR0NWTC9HMmtjdkpQ?=
 =?utf-8?B?Z2FkUytIWGlPaVdrN01PeEZWbk11Y1pHZHh6aXFOa3hOMWxETzh1bTQ5WThk?=
 =?utf-8?B?RGpzNjRxL3BXaGIrS0ZLc3RGVUJuMmdXd2toNjU0dzdwTXhNQzdhWnNJYkhP?=
 =?utf-8?B?dHFSU3RMNGF2TUlXcUhDWWVya1BiVFNWUkpLZ1kyOHFKcGxobmI3UUpmMkEy?=
 =?utf-8?B?MHdoYmdCL2J4dUNyUUdKYWhnOHV0RTlzVUdJNWR0YjFWelVzUEVYZUFNZzVS?=
 =?utf-8?B?dWxPN3FxeElvNktPd0FXQmlHUVRSSGRYTFN0SHd2VTVnbWFnWmluRXJ0ZVpC?=
 =?utf-8?B?bXh6SjhiWWpGYS9MbldXV012ckdTT3JHQ0l0Vmhud1cwaWF3WXorQTlOL3d1?=
 =?utf-8?B?L1pCWVgyYUJ1WUlFMUNRcTdwME41eHY3Vm1rVG45WmJMY1E4ZWFxeG1jZFVG?=
 =?utf-8?B?K21rNFlNMG9qRittaHlJdWlpVmlrZ3dWSVN5TWhVTERvQk1sQXdDK3NXdnpD?=
 =?utf-8?B?VU9sOE9rK3drbm5xVGlzblNTQy9VZS9tWDBhWTkzaHNiQXhrZjhhVkorVk5s?=
 =?utf-8?B?YW90WnR1UitkZVNLd0NXWGNxcFJ0ZTBZTTdjSFlBenpPNFNyd0hEblNrdnps?=
 =?utf-8?B?OTR0bUVUWTlDeWd4c0YxS05UcEVjZGYrUklRUGhTMmRSNFRFNndsMlMvVUxl?=
 =?utf-8?B?NDcyTDZvVWRyU29KRmlWSmdJYzhlUS9GaXR6UXZJSjBXWEExTjNrQjNtM0wx?=
 =?utf-8?B?bmdsdTcvN0MzNk1LZFJmamI2ZUZSOXZxcG0vZ0RsY1h2TmhHbEcxMEpmQXlZ?=
 =?utf-8?B?cUNnek9uQVpqTmZrdEpSdS8zMURDWjgzYXJhRVVkYkkrcU1VZ25OdDBKTW9G?=
 =?utf-8?B?WnE4dXEwcUVWd2VpcktHRG1pRlVheU9BUEFxS25sWm00VEFTY24vRlJvU240?=
 =?utf-8?B?STkwUjVkTElNMm5reVc3VnpMS1VCNDBEN1pvZXVxRjh2YlhNUjgzaVc1cnBh?=
 =?utf-8?B?bVEwL2djbUVHRHprR1ZlR2gvTXRUV3Y2WnEwSlZwVUg4S1NRREhkREpCNjBO?=
 =?utf-8?B?aHFRS21Va1l2ai94RWdMMnZjVHJWTFBjZDRId3pnbHNBSndpdyttRlovWjhE?=
 =?utf-8?B?R3VzM3gwSEQwSHA0UTBhR29XRDd5ZFlWd21oVUk2R1l4MTNTWkxiM2gyNkJU?=
 =?utf-8?Q?O6B/elwJRLBl6/xgC4OOuOkTuQpqCvs0=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WUFaRkVZTnpWSEkvZk9VV3VQNFhyVDhrWUxSZ1dUZzFYUjhjL281aVpSRTJQ?=
 =?utf-8?B?UW5xcmY4b29GZzIrellaL0Q4ZDE1b3VKUUw3d0xpbDhzWk1PRHRJZThjRldp?=
 =?utf-8?B?T09OY2pveXJjenBEK202WU5NcExabGltRGZjMTMyKzRUV0hMenhwd3JIYTlG?=
 =?utf-8?B?b1lBS25uYktnNUlGMTdGTDJzM3lsWTE5Y1lWMndEQ25QMThrWGFJWmoza1pR?=
 =?utf-8?B?SVhlV0FzdGxwN0I1YnBIbkVkaWMwTTN3anhtbHFkQmFNL2xwcnNhdlM4emdR?=
 =?utf-8?B?R2F3OE95UThrdzg0VUNnQytHWWRXS3l0aE1VSERQd3ZMNExHV2d2NlNPU2RD?=
 =?utf-8?B?eGFzREQxcUFJWUR4bW5KU0V6dnhod28vcVZPTzRTTXhEWnFqTjJoQkZwK2tW?=
 =?utf-8?B?eXlDMWltMzRMUlF6em4yZ0tpM3hZdUsvWmM4MUJ2SFExdE1NNWVLdk5iMkdB?=
 =?utf-8?B?eTRDT3VMUk9JcEh6eDNMbE1yeGdWWlZ3TVZCVloxWnNZMjkrVWFJdG8vQUNM?=
 =?utf-8?B?alprM1BSQzNKQlJ0aktQeStXdDVKRG9vdFZvREFKMytkUHBISGlvM3c4NHJG?=
 =?utf-8?B?VlRQZTNldVU5eWREVDhzTFMwVldHTzdwMXBJSmV6Nloyd0F6TDVQT2JxL3hT?=
 =?utf-8?B?Q243ckUzK3RHMGtqaE1FaXVpWEVjV0ptamZGd3JGNVVjRzBrc2ovK2FQYUJY?=
 =?utf-8?B?QTNkSjMxVlovdGt1c0xMVzFsVEFPdDdvQVVRMVFnbzBZWm9wd2twWUVvUUVs?=
 =?utf-8?B?NXR6S014SUdpZENhU3hKMEJFZXlRUVE4bEhiTlltQlNuRnBOWXJIRGtoRnpD?=
 =?utf-8?B?ZFpsbVNXUG1mcjlXNnVVSlZnN3ArajZpYlZBOE9LNTZIaWMrbDRoOXFabFdH?=
 =?utf-8?B?KzEvbldpenp3bFhyK1h3OFYzWmdsVzNITEZ1TXdmT094eXRON3lVNUFyWE4x?=
 =?utf-8?B?aTNaU1lpR01tVTdTOURjcU55ZVpCbDdQT000ajF4ejdEMmJwemxWYVJIbG8x?=
 =?utf-8?B?YXRMUE9SQXIzR3hkWk1tOXU2N1JDYlB3K21FSWQ5Y0ZUK04vY2lzQTNEYjNP?=
 =?utf-8?B?c09tUWRuVU9Ed1R2WVB5L2xjbnppUmd3ZXU2YlhGQnBrb09TTE0zRkFvMWxw?=
 =?utf-8?B?cnJaQ0tCbHRoNWlyTVdtS2ovbzNFaTE3NE9zUlNtcVczcHdtUHU0dHllUmgw?=
 =?utf-8?B?OFN2OE01clg2ZTUxdUtVaEdEWFVzRkx4Qkd2b0xKSkgzQ1BaNzdCVlF2V2Z3?=
 =?utf-8?B?UXZLUXdQMWFUVG15cnB2Wi9lbTRCN3FrcDJUWTc3eHdjcmgvUFd2ZUVvdk5C?=
 =?utf-8?B?dFYwbk1FbHFPWjdEZzdDYzJaL0cycjFmZTlxL1NRdzY1NzIrd2xyQWZuQXZN?=
 =?utf-8?B?OUo1SmZKTjJoQjhLbVFLRFduUG1CSTBCRHB4R0VRTUpkRVkzb1U4N1U3Y0ls?=
 =?utf-8?B?Qk8zcllwd2NvTW1zOU8yTUxzc08zS0F5VnY4ZGhZN1NlVjJFWmhPZGt4TXF2?=
 =?utf-8?B?RGNvQ3A0MnFPUUVBWEhjUzlwN3ZhQXNZQTk5cWRMUkxhbmFxb1ZIUVdCdTlJ?=
 =?utf-8?B?WXJSUGRrTG9VTjd4TnVBVjJia3dtNTFoZnV5N0pMTTdrRzQyb09MMmtkRVd1?=
 =?utf-8?B?RUMyY1ZQSzRwUHZDeGY2MUdMcVEwWjNMdWhPcjYwZ25GVUVwa0RMMWdEVHlI?=
 =?utf-8?B?VG1HdkJQNWVGZml3QmtsQnpaY0U3YVBUeEJyRVFKMnRBYUpwTlNhSVdLUjNr?=
 =?utf-8?B?ZElnMjFMcm9iT1R2Z2VFbSt0RUhlMlU0WUJVVlE2RlRCWThiUGZTK0JrdXhr?=
 =?utf-8?B?ZGJWRVBSeGREM09oa29NcUYxMVE2S2hkZXlqVnFLdTBUME14OWkxRnZpTHM4?=
 =?utf-8?B?d01taTZDdkgyNjFjVW55djdYZWZkZkd1Ynh2RHJGZ3gwclE9PQ==?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bea12255-4461-4c90-2767-08dec13b6003
X-MS-Exchange-CrossTenant-AuthSource: SN7PR19MB6736.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2026 06:43:09.6540
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR19MB5132
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
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:conor@kernel.org,m:andrew@lunn.ch,m:hkallweit1@gmail.com,m:linux@armlinux.org.uk,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:f.fainelli@gmail.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:netdev@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:konrad.dybcio@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:krzk@kernel.org,m:ffainelli@gmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[george.moussalem@outlook.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[outlook.com];
	FORGED_MUA_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-110904-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[lunn.ch,gmail.com,armlinux.org.uk,davemloft.net,google.com,kernel.org,redhat.com,vger.kernel.org,oss.qualcomm.com];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,vger.kernel.org:from_smtp,outlook.com:dkim,outlook.com:from_mime,outlook.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 10D69634BE8

On 6/2/26 20:34, Conor Dooley wrote:
> On Tue, Jun 02, 2026 at 10:50:37AM +0400, George Moussalem via B4 Relay wrote:
>> From: George Moussalem <george.moussalem@outlook.com>
>>
>> Move the clock property and restriction from the ethernet-phy.yaml file
>> to the individual PHY binding files. This allows each PHY to manage its
>> own clock requirements.
>>
>> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
>> ---
>> Commit 350b7a258f20 introduced the clocks property with a restriction to
>> maximum 1 to the main ethernet-phy.yaml binding for Realtek to add an
>> optional external clock source. This is restrictive to all PHY bindings,
>> as some PHYs may require more than 1 clock such as the IPQ5018 PHY which
>> requires 2 clocks (for RX and TX).
>>
>> There are three other PHY drivers that require clock management:
>> - Micrel: requires 1 optional clock and the micrel.yaml file already
>> accomodates for the clock property.
>> - SMSC: requires an optional clock and the legacy bindings file
>> (smsc-lan87xx.txt) already accomodates for the clock property.
>> - BCM7xxx: requires an optional clock. I could not find a bindings file
>> for this PHY family.
> 
> Have you done a large-scale dtbs_check run with this patch applied and
> checked that it does not ban having a clock for phys with no dedicated
> bindings?

I've ran: make V=s CHECK_DTBS=y DT_SCHEMA_FILES=/net/ ARCH=arm64

There were a whole lot of errors, mostly related to missing required
regulator/power-supply properties, but none related to clocks.

Also ran: make dt_binding_check DT_SCHEMA_FILES=/net/

This ran successfully apart from the one error I highlighted in my reply
to Rob on v1:

  DTC [C] Documentation/devicetree/bindings/net/renesas,ether.example.dtb
/home/george/src/linux-next/out/Documentation/devicetree/bindings/net/renesas,ether.example.dtb:
ethernet-phy@1 (ethernet-phy-id0022.1537): compatible:
['ethernet-phy-id0022.1537', 'ethernet-phy-ieee802.3-c22'] is too long
	from schema $id: http://devicetree.org/schemas/net/micrel.yaml

In addition, I ran `grep -r '#include <linux/clk.h>' drivers/net/phy` to
identify all phy drivers that manage clocks which I've reported above.
There's one more: xlnx_gmii2rgmii.c which acquires and enables 1 clock
which is also accounted for in its schema.

None of the phy-core files manage clocks.

> I feel like weakening the limit of a single clock is probably more
> accurate than outright banning clocks for ethernet phys without a
> dedicated binding?

If you think increasing the restriction is a better solution, I can
submit an updated version. Kindly let me know.

> 
> Cheers,
> Conor.
> 
>> ---
>>  Documentation/devicetree/bindings/net/ethernet-phy.yaml    | 6 ------
>>  Documentation/devicetree/bindings/net/realtek,rtl82xx.yaml | 6 ++++++
>>  2 files changed, 6 insertions(+), 6 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/net/ethernet-phy.yaml b/Documentation/devicetree/bindings/net/ethernet-phy.yaml
>> index 21a1a63506f0..709ea976ef79 100644
>> --- a/Documentation/devicetree/bindings/net/ethernet-phy.yaml
>> +++ b/Documentation/devicetree/bindings/net/ethernet-phy.yaml
>> @@ -105,12 +105,6 @@ properties:
>>        1BR-10 names. The PHY must be configured to operate in BroadR-Reach mode
>>        by software.
>>  
>> -  clocks:
>> -    maxItems: 1
>> -    description:
>> -      External clock connected to the PHY. If not specified it is assumed
>> -      that the PHY uses a fixed crystal or an internal oscillator.
>> -
>>    enet-phy-lane-swap:
>>      $ref: /schemas/types.yaml#/definitions/flag
>>      description:
>> diff --git a/Documentation/devicetree/bindings/net/realtek,rtl82xx.yaml b/Documentation/devicetree/bindings/net/realtek,rtl82xx.yaml
>> index 45033c31a2d5..8a26f6941dc4 100644
>> --- a/Documentation/devicetree/bindings/net/realtek,rtl82xx.yaml
>> +++ b/Documentation/devicetree/bindings/net/realtek,rtl82xx.yaml
>> @@ -38,6 +38,12 @@ properties:
>>        - ethernet-phy-id001c.cad0
>>        - ethernet-phy-id001c.cb00
>>  
>> +  clocks:
>> +    maxItems: 1
>> +    description:
>> +      External clock connected to the PHY. If not specified it is assumed
>> +      that the PHY uses a fixed crystal or an internal oscillator.
>> +
>>    leds: true
>>  
>>    realtek,aldps-enable:
>>
>> -- 
>> 2.53.0
>>
>>

Best regards,
George


