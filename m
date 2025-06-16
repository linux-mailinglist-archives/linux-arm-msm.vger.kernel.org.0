Return-Path: <linux-arm-msm+bounces-61436-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B27E9ADB063
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Jun 2025 14:38:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E1F24171222
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Jun 2025 12:38:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AFEA285CAB;
	Mon, 16 Jun 2025 12:38:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="al39UFO1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12olkn2105.outbound.protection.outlook.com [40.92.21.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45A5B21348;
	Mon, 16 Jun 2025 12:38:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.92.21.105
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750077498; cv=fail; b=WvjSV+bK/b9IHJMDmcWy/wMG2QxGdwZvCujibkpQFNn76S4KSaSHsRYP1wslQ1uM5yGdIg8kxmPxlpch7H6mSp3mnLxkwnKT0wc/7Kgv+xxjzqWkb0GXKY85krMbFoAW/0xXfUQEbG7zLuG0p8Jby9RVzAUCi8OFKp/Jo0z75Hs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750077498; c=relaxed/simple;
	bh=1KSFUAaWQGPZkG4VOZyb1v+djhmJL14dpwiNbBpxHQQ=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=HIAGU5pPvDLsCd4w7/++5FY4Tag56Bc4BE+Dv4uJHbtez390L8gOXXGzBy+wrx+vc1SeEHpH3SwA2eNXPdzrVEbifz3Bvbdqq1iyZMWodrNDVvFOb8R80J3U2D7RijZu/ZJQXffO6+54C1eYHHfnsNdC9QIAW9CDw9KPBLXllSg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=al39UFO1; arc=fail smtp.client-ip=40.92.21.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CrFf8Nma8vC+ov2i3JT2oX3D+EZzbp2PBK1TYXdiZx/A/nEIFlr67K0CsObkHaT2MvBzsVJfNMMQ/bm5fN+ZMu+jy6loaFVbED/kizZjhkbI1ZPWiOa2Nk0jETiHD7MKEeW1/oOKYHJJ+DGrf9kk58xveFnYZVbXwFhrYcjkH9hUcqtxK8u/kDjT4EpC4+RCuyQxyLJZYQauXZPNAAJxJCeBP/0qGT415Kx6J17ENYbwXKcFWJGaNSERYKUfG4zLY0T9wdbT3PDlsYEG0aPNxuuSDFJqpbG/b2VaK19r6rpes/+sUXF7izYtKHAtOU6enMd4jWB4RaZDQEN4Kkdiag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3kEr0FccqFRH6oyqq5eUiIjafnQkLAvQlhFhMITJAJY=;
 b=doNO445PrWoM/HELKXLE2pxHAgPQDm6P6B+UowoMRCz+phnkHc5AlIymPVi+0PZwUaDUHpoB4BfPnuTyL8nQUebfXMCntxMVKhBu+rerrYY13l1Vf609/2RqNqKZAVvyV+3w14AykMMbxEeIejwhe4c6MLnZWSo8m6Z9p1rJqS7MvBe19neEj4/7+ugJEC5tH0DlPpI5+pMehFRbigeUMvy1RQpiWwm0qJztLSKFngpTV4osnbSVDM7+N8huz/xc0PNU1kDVnPsNPcdFZ9DDnROQ+DuqztW47UcMGaARxyKkrfAMQ5ii8enst9/v7zkfnogpcvkYyhz82IIrp+YWZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3kEr0FccqFRH6oyqq5eUiIjafnQkLAvQlhFhMITJAJY=;
 b=al39UFO1rllykVJZtWC0i0vse9O6FBpFvlTlnH8TVTfphDXGBt615s0XSzw+jY6nSt9R/PScFgbChGLZ3Cb4UYxXqrvgfcAxzB/4uaCwummI0bbaIjoeTsMCYSVVQWNgx75X/Q6iSs3JhjfrQPyEIhRBJyOAipo503ljcGXM5Qs9ncZu6urck6jx9UQDKL9QKWJDNxxv26kIQx2BO3niKAL4F/BaOVDhpaZrwv41HF7fZk7NSTPqYbw64Ed0yiS38nG3/B/B0GjCHfE52K2Le54+flQF8vbIeG/ZPcOGdYmtGp/e7AMrX96rkTxt2eJWo5G03IwMXJ+x4BmkQeRtpQ==
Received: from DS7PR19MB8883.namprd19.prod.outlook.com (2603:10b6:8:253::16)
 by BL4PR19MB8957.namprd19.prod.outlook.com (2603:10b6:208:58f::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.16; Mon, 16 Jun
 2025 12:38:12 +0000
Received: from DS7PR19MB8883.namprd19.prod.outlook.com
 ([fe80::5880:19f:c819:c921]) by DS7PR19MB8883.namprd19.prod.outlook.com
 ([fe80::5880:19f:c819:c921%5]) with mapi id 15.20.8857.015; Mon, 16 Jun 2025
 12:38:12 +0000
Message-ID:
 <DS7PR19MB888343C4F91D35F3BE048B6C9D70A@DS7PR19MB8883.namprd19.prod.outlook.com>
Date: Mon, 16 Jun 2025 16:38:00 +0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/5] net: phy: qcom: at803x: Add Qualcomm IPQ5018
 Internal PHY support
To: Philipp Zabel <p.zabel@pengutronix.de>, Andrew Lunn <andrew@lunn.ch>,
 Heiner Kallweit <hkallweit1@gmail.com>, Russell King
 <linux@armlinux.org.uk>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Florian Fainelli <f.fainelli@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-clk@vger.kernel.org
References: <20250602-ipq5018-ge-phy-v3-0-421337a031b2@outlook.com>
 <20250602-ipq5018-ge-phy-v3-3-421337a031b2@outlook.com>
 <0444ceee9743a349bb7155dac6ca7ea25f5adb18.camel@pengutronix.de>
Content-Language: en-US
From: George Moussalem <george.moussalem@outlook.com>
In-Reply-To: <0444ceee9743a349bb7155dac6ca7ea25f5adb18.camel@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DX0P273CA0058.AREP273.PROD.OUTLOOK.COM
 (2603:1086:300:5a::15) To DS7PR19MB8883.namprd19.prod.outlook.com
 (2603:10b6:8:253::16)
X-Microsoft-Original-Message-ID:
 <72a46f7c-0119-4eb2-91d2-58d5d74da271@outlook.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR19MB8883:EE_|BL4PR19MB8957:EE_
X-MS-Office365-Filtering-Correlation-Id: 61ed3f61-8426-4651-ba95-08ddacd2a786
X-MS-Exchange-SLBlob-MailProps:
	znQPCv1HvwXEkPgdKd+m+H2U2+elLz1chLmeu772j8bWNTDDGCTQumpyKIzynpoRsAc51stHLZ9ZrU8AiPNpEHOkmzlWvZqxsPknytewqMYgv/o+TMdVnI/ny/MzP2QqBe5j+Tma33uleF+wTe/TRsKdd/SDmn1xSpbO+ddYRRwbVLjriucEbdOkAttUgQzKyAjwIHucHPcEVZfdPe+9bgemoJV5bD+RxHA8/CgpAEIk0i+fL4W2h7PkbIg8DJUnMGKRWx9fMnZR8FJ5KP0VUpwGiD4qrQk2GGdOZufdLN1d+RP+MBEUIm8zZ9jBf3adA7SWT4FhFf7kUXdHgJeAbIj2GQCunvIQNZVPB1Ne+c3eaBoi0QKeKVXaGCNKeOiOUEB0AY0ishpWTWDXKrttnYFUtY1uh3OWdkwC6j75nxI3PIy/S07invCMCwyczYyE8cz6pvl5Hw+uIB4MUExH/Ym70HbQ+4N3ZjfLexo8fr7JXrIcNvHGpO8OR7R51jEQpO7Zn9rCsIsG4dxSRiI839uas1lK75EOcD/Gnrvnw0cZ/72N1onb1824azwpTN/ambd/hMA4S9BsAPnxcsuotpGh45LZ8Eu0BNj6hol4AaMEG0j6oiTMGwAVGjKRF81R3D7D2N0CXaKSH9Rtz1Ugf1k5Wefixez6j/eXnFMcG5QFRgy6SNuvnmV+7to9ScpAGc+7ZcAsT2lZX68cZi1VDYRTQ/1G+4UgdlJnoZzHKOPih8esFCP1z9SMsbb5GR1tPD5ZiA+8VM4=
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|6090799003|461199028|41001999006|8060799009|19110799006|5072599009|7092599006|15080799009|440099028|3412199025|12091999003|40105399003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NGgzZjVrVFRnQ3EzdDMvZndvakh4eDVRYTNNVjg0RzRnak5NR3Z3UUZRcHdE?=
 =?utf-8?B?QktMMVlUUVRIQ2tEWGFscmFyUTJvclErRkhSY0tBeHJVSjJpYm5Gek43R0do?=
 =?utf-8?B?UXJlV25jclBmLy9ZYmJZZHdvNE1KY1ZtYTloQTBNZmVQRExUamNPUDRZTXBT?=
 =?utf-8?B?UEFxemRCZSs3N1d5Rzl1TVBFZ080V2wrQ0tKdnE0SFo2dWI2NlZtQTROZWFC?=
 =?utf-8?B?ejdlUFc3SmxBTnh0UUphbm5FOUhha3VKVVpQenFLSzV6NWZuaVRSZ2ZOK3VI?=
 =?utf-8?B?dHd5eDZQcEpVY0VsSjE0TzUzYlAzd0NUMlhHSm5pQjJBZHdnVVRiYkNUVTFi?=
 =?utf-8?B?YmYrRk1VODZ0cDRlWjJNMDNXVW1VSkkrQ2lxVmlvRDkxZ2VZdGJHZTd6aERN?=
 =?utf-8?B?QlhLVk5RdjlUazRhang1SnhzQXJXODh2NGNYTUVqTnFKa1VjWmpBMTFkZSs0?=
 =?utf-8?B?Nm5ZUVpXUEFmVTlQZzVHOU4wRDJwODVyZ3hBb1l2Sm9VR0FZL014c25lYWoz?=
 =?utf-8?B?NklaNFcwc3hHb3lTS09CYkVXU3RIM0Y0bDlTM2NhQ1JRQmlJUmc0UElNWnlp?=
 =?utf-8?B?a2lSUUorYlFIaVhCb3pmNEw1TVB0RWo5Q1R2aDk0ekFCRjNuRTdqTDMzVzkw?=
 =?utf-8?B?VUN2SFJTcy9OdHRCTzQyUVJNcHlIWi9FMVpiTW5XRmV6d2liTjZUWHRsc1BK?=
 =?utf-8?B?dUYreUNPSWxpRXBUSWpnVHNvUUphQW1KQmdQb1hYeWNjT2VmWU9pWEhpM29l?=
 =?utf-8?B?ckE2bUphRkdONE14SVpSckp6ZERxZ1VFTU1KVzBoNXFteUdHSW1DUksrZEhT?=
 =?utf-8?B?enhLaEwxUDVpTHlFU3BGQVg5WERPZzhDb2k3bG81bkQyaGxvT3k5WXlMa0Rm?=
 =?utf-8?B?aEdIcHBmU2ptWnRMb25wREVMN0VOTG9rSUplMHBFck95azFmdUJHQVlzMS9z?=
 =?utf-8?B?WCt4ZVdtczZDK2ppQjluaTEvUzZsY1FQbTE5TFV6ZGMyUjlMcnVwNUF4WkVx?=
 =?utf-8?B?aXR3YVY3VkpZakw5citodks5a0JWN0E4b0dJRHZybXhHU3lRaityNzdrbi9q?=
 =?utf-8?B?d3F4eVlZbTlJZWF3WlVGeElteGpEWEZqck91Uzhac256WHVYZ2NCL0J0N1Nh?=
 =?utf-8?B?NktsSCtpMExHRlNSbjRVQWZ2c0M3dGxyZWNDZkt3RUdLaHNSdHQwcHp3OHQ3?=
 =?utf-8?B?ZmFHSjRoQ3JQb3o3SnNhRVdZRFZBdzQweGgzTFJlWktQUUV2QVhjVk1Idm1Q?=
 =?utf-8?B?dTQ5UUR1NDFNd3hkZTdqSVprVUJZaHlRT2tWQ29hMHJWamJPR0dtMzBqa0Fx?=
 =?utf-8?B?VWFJcUVNc3ZaZy9mZm9rNHlYeWprYitkZ0NadXlkbjgraDlmK051THNld1hr?=
 =?utf-8?B?M3ZIeTZHUXNEVnlJOVI0Y09sUVZ2R1ZJUEM0ekNUcHY2TEhLUXdzM1Y4M0d2?=
 =?utf-8?B?aUpmM1lheFp5Y2Z4Z0Z1THVBdkdGYXp5N01Bd1orcDdTVHNpTzFHQmo0cDJD?=
 =?utf-8?B?TS9IZ0ZXT01NN2V6MlJvSUVLYnFrVWpCUHNSWEt1d0dEdThYSFl5L1NFS09Z?=
 =?utf-8?B?Ukl5TUpYMEhOZ2VaK3pzSUM1b1NDdDV4cXhkeExqS2lmbWlKL3g4cERBVG5X?=
 =?utf-8?Q?RvKhKVLdqbpOBiZUDjGmp3GNoQSFA4XuHiFWsClsWX4E=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WUg2TVc3L2VJdEJhWDBQSEl0YlRrSTFiS1Q4dEVvQ2lMSnFsY2VNWEozeFEx?=
 =?utf-8?B?c09rdHJxQUUvdzhOazV4UTVzd1lnT0VvQytZczZFSXRsS2MvaVFCdTVmTEdH?=
 =?utf-8?B?a3J3WXJOdllLRFBqZjZ1K28xM3dsaE43SXRqN0lsR3k4OVZ3ZGk1bmdIMDRT?=
 =?utf-8?B?S0ZmcTFIanRQdE14cTJMT3hvQ0VrY0s4cmhJa3ZKVG00WDliSCttOHQ2OG4x?=
 =?utf-8?B?Rm5tUzZKRnNQRElvSzIrMjRtNXVuYjJUM0FWYk1XZkpDb2VYRE4rUXZvY0xO?=
 =?utf-8?B?Z0I2T3hLQno5Kyt4NjA3YXdzVUN3NDArNU0zcVIyVmFwR1FicjZHYWt6NjlL?=
 =?utf-8?B?ZGo1K0FLRVBkMUtiRlF4UmE4MVlBNGVPWFlIY1BUSFZuM2diNDZhSm9VQ1Zk?=
 =?utf-8?B?U2tNMFI4ampuWU4zWHNydXVBVDJaeFgvRkt0SXFGbmlSZUsxTDhkM2hhaE9M?=
 =?utf-8?B?NDFVL3N0RlFjQW1IWmduZE15WFBubkFNdDBzOEJLeXYxdXRGUStrQ1lpYlhT?=
 =?utf-8?B?c2tuUFNrU2JOeTllOWZrQWxSNDZrWnVXM0lweG5VNGptcGRVcFpTdVJHYVVS?=
 =?utf-8?B?N3BMcFNvQzhWUDVoUG1BakppRlo4NGo1L0RiL2JTQVNDU1RsdzkvT3dwYXZs?=
 =?utf-8?B?RnZ3S29JWHBvVlI1TUZpYVRhSFpndUFaKzRTNlVQbjh5ZVVKUzUyY01Wb1Fh?=
 =?utf-8?B?dUF5N1hyVWlFYTI0K2RwYXhCdDVteHhidWpST2hxMzdoWi9XbUZybWtIakYw?=
 =?utf-8?B?K25VOFpIQXg5UmxDUTh6QzNncWI0U0VjMkN5UVVFQitUTkZjZkhKWC8wV0hQ?=
 =?utf-8?B?Rk5nanhJY29MUmV1S2tGZHNCaHJRNlJGT0xXM3BTODJBaFNOSHUwZ3hZekNw?=
 =?utf-8?B?U1FIOENESDQ1bHJLdnVtdnJzSEJQNmIxcHowcWhlQkdTTVRpTFp5RmxQTUpt?=
 =?utf-8?B?TFg4Snd1MDA1UlpjKzM2TUdRQURsT0lBR05DMUdhZW15aVkxUGY3MkdIb2tM?=
 =?utf-8?B?ejVLdXlCTUN0aGFOWGkrY0l2WFl0WDMrbjBjOWVYMVdDSHBjaTc3SVFvWnBD?=
 =?utf-8?B?dVV5Y1k0QnBmNmxONUdTN2Z6MkdKeXZvZEREczRxOWRBeloySW0rd2QzT2Nl?=
 =?utf-8?B?SUN1Z3hEa0MyMUZjOXBUMTdFMWNzdytkd3FhSkVOVzB1VkZpZW1tNWM4T0Vw?=
 =?utf-8?B?WGwzRWxzTGFUVmFEbTV2cThPKzFubnp0VkZxSkQwTU9vbkhLN1cyN3ByTGhq?=
 =?utf-8?B?d3ZjWTcxZ0NTMzQ3M2F4NEI3ZTU5Q0d3dzFTTkRRenZ4NDc4dDlhaE8xT05T?=
 =?utf-8?B?RTdCbmh6MG5MTVh6MWFJN1hjOXFUU01kUTNrcEQwY3NwOUk5Rndyb2VaRkI4?=
 =?utf-8?B?MFVSVnRYQTNCNXIxU0Z2MVlFZmNqczNjeStaYkFPN2FzemI0Wi9QZkJDTCs5?=
 =?utf-8?B?ME5XWHFWR3NoU0JROVdHKzB6ZFhmdEp4SVdCVjA2VXpydnBuRHBtRHN4RVVU?=
 =?utf-8?B?c3JoTTZtbVFzcDVrTkRRQXdZK2VJSzBWOUI0SnFWZlNHLzRGMmFSTTdEbXh1?=
 =?utf-8?B?NG5LU3N0ME8rYUdZQnExZ1pJQWJ2MjY0MnV3MDkrSzJmeXExQ2JSeTdITGpH?=
 =?utf-8?B?MGFvSDJKaXpxWVQ0SFhuNzB4ZXRpRTdETGJoWUh6MUxHR2J2dUF5bXlBUHNW?=
 =?utf-8?Q?jORd0B1OIjMZXr55K4Bf?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 61ed3f61-8426-4651-ba95-08ddacd2a786
X-MS-Exchange-CrossTenant-AuthSource: DS7PR19MB8883.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2025 12:38:11.9851
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL4PR19MB8957

Hi Philipp,

On 6/16/25 15:01, Philipp Zabel wrote:
> On Mo, 2025-06-02 at 13:53 +0400, George Moussalem via B4 Relay wrote:
>> From: George Moussalem <george.moussalem@outlook.com>
>>
>> The IPQ5018 SoC contains a single internal Gigabit Ethernet PHY which
>> provides an MDI interface directly to an RJ45 connector or an external
>> switch over a PHY to PHY link.
>>
>> The PHY supports 10/100/1000 mbps link modes, CDT, auto-negotiation and
>> 802.3az EEE.
>>
>> Let's add support for this PHY in the at803x driver as it falls within
>> the Qualcomm Atheros OUI.
>>
>> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
>> ---
>>  drivers/net/phy/qcom/Kconfig  |   2 +-
>>  drivers/net/phy/qcom/at803x.c | 185 ++++++++++++++++++++++++++++++++++++++++--
>>  2 files changed, 178 insertions(+), 9 deletions(-)
>>
> [...]
>> diff --git a/drivers/net/phy/qcom/at803x.c b/drivers/net/phy/qcom/at803x.c
>> index 26350b962890b0321153d74758b13d817407d094..c148e245b5391c5da374ace8609dcdfd8284732d 100644
>> --- a/drivers/net/phy/qcom/at803x.c
>> +++ b/drivers/net/phy/qcom/at803x.c
>> @@ -7,19 +7,24 @@
> [...]
>> +static int ipq5018_probe(struct phy_device *phydev)
>> +{
>> +	struct device *dev = &phydev->mdio.dev;
>> +	struct ipq5018_priv *priv;
>> +	int ret;
>> +
>> +	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
>> +	if (!priv)
>> +		return -ENOMEM;
>> +
>> +	priv->set_short_cable_dac = of_property_read_bool(dev->of_node,
>> +							  "qcom,dac-preset-short-cable");
>> +
>> +	priv->rst = devm_reset_control_array_get_exclusive(dev);
> 
> Both dt-bindings and dts patch only show a single reset. Is there a
> reason this is a reset_control_array?

The series started with multiple resets, but due to patch 1 (using a
bitmask to trigger multiple resets) and the restriction of max 1 reset
in ethernet-phy.yaml, there's no need for calling the array function
anymore. Need me to change to devm_reset_control_get_exclusive?

If so, don't mind me asking, do I send 2 patch sets? (complete set of 5
and a separate set of 2 to net-next as requested by Yakub)? Or just the
entire patch set to net-next?

> 
> regards
> Philipp

Best regards,
George


