Return-Path: <linux-arm-msm+bounces-59560-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DEB2DAC5000
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 May 2025 15:38:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F2E673B9E67
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 May 2025 13:36:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05D8027467B;
	Tue, 27 May 2025 13:37:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="K2bHiL4H"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10olkn2050.outbound.protection.outlook.com [40.92.40.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BA0B267AED;
	Tue, 27 May 2025 13:37:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.92.40.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748353032; cv=fail; b=EFk3ElEr+gQAChopQ1cxYJ0TRI7oXfnfOwC1p56wvQifrHc56GX1r6zNq5gPhsbOCCOJHP/pxCzaPrCuVYnmoWOoJ1T4fnzE9Zsn1gaVnl/2lyko507Hhd/9gTV6JbjolJqAksI+Vo7nJPvoZe4EEAlyU1ITBZ70mWsuHKid+Y4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748353032; c=relaxed/simple;
	bh=5TlbL5olyAYpVF2yS7BRAbvLPfGLmZx9mowVMiC/d0M=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=DHlwgzy0Uu7LZU4vKcMimNnYg5CcDIb00Bo4XnLGWKEF47OXAa0lMpqJJHd2VKSolL4x1kCENg886TLrAOrLLXTQjiL8TKBAf0AnhBfAwhc3ZkirjRF+Ru4v2OMzn/5dBRszG2PMyFA2DLhmOUKayYjOxwvxb0mGQ/ASiOhJS84=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=K2bHiL4H; arc=fail smtp.client-ip=40.92.40.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k0Jx1J79U/UAluhbwFCnJI2giSJ+bp2jqpGShFdtPe7PJYGLq7RVE5MXAjlaUApFE0utm4NM4mVvO5yT8qdRHYYcrCYnh1NLM8YrLEFpWBM49RGIeiIwaa1h0ITxkcj8dPAXf8AxMpsCakoerBZhW/cVyr8dTdC8o4qkP9nhWA/DLX+sN8/GWPFb8wthr+kEhz8lXMYXr8zIpvSa8K1C+E6U9AM9xGvAnqJNsF5saoU9fJG2S0XZ6QM2QWHeEvZIDiqeCLobUVQx89j7Iy79IRSVJa/6+UGQeIMP9RGLsLrTkbFOqFJMBoIK0swUzwDN7BTDqhznxhjP3MBe7L9MCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h3AUwD+fjEXVto8ybIjyoCiWoXrSNrClVBhMV7rAHUc=;
 b=xxRptm81G+knzm/a37yEz1aDPTU2fBfaksKJhSWtZFEN1POOKtgBDA5yNstnG0yuTWFMYyN2PYcx3IbC7b3K8y5aXV7BfgctIJgCYtYJm2iuAFXusliSgi81zirQQItDvLQtnZim5AwXp1C+febHj8RaA4hFMaFWTsneVF5Ut3NhvUzzIrYwWpimOcsJfEz0mWJeIagrDDwExamAG7WuvvLccUwOUAUHJziDiJEiykztDBDjDbkZfu+jXSa3rFpN7H2hVzDniLLLbRyGTkXw7BhDlqiQgQLBfVGJ57WzDcIBTQ92mrqK/HVWQ7dx7RGZcwnF8630psfdmmHH7Z0Rdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h3AUwD+fjEXVto8ybIjyoCiWoXrSNrClVBhMV7rAHUc=;
 b=K2bHiL4HHR5TN4uU/rafmXBlezKSU9IS5uMnzY/U4cqWNZ6z1Qzk0q/QBm7odpI2u6byPq2wukSZl3CxK98wtlfn9VoOZrY3U8BqINiYoSWN5Y98mHU7kTyMyyOIiscgF5wMMKHn59Eqf1w0DONw2izQYzsU3bUc4J+OidtjFSvZULNsDRIWjTic8Z1yQSxzF3FicMaJ20+3Mi2sqAvEKeI4sq4PLhFCHYheXono/3qwWSAZaWjg7KnlzphmsFd0l/EeFDR1VQe+b7lmwQRnf5OOGlnsYcuL2Hl4o4mgqY/R5daldaCJU+O6dniais6vjj0eaLyOPtdfrch1M9X16w==
Received: from BL4PR19MB8902.namprd19.prod.outlook.com (2603:10b6:208:5aa::11)
 by CH3PR19MB8327.namprd19.prod.outlook.com (2603:10b6:610:1cd::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.22; Tue, 27 May
 2025 13:37:08 +0000
Received: from BL4PR19MB8902.namprd19.prod.outlook.com
 ([fe80::b62f:534e:cf19:51f4]) by BL4PR19MB8902.namprd19.prod.outlook.com
 ([fe80::b62f:534e:cf19:51f4%4]) with mapi id 15.20.8769.025; Tue, 27 May 2025
 13:37:08 +0000
Message-ID:
 <BL4PR19MB890259E73077C4B20BEDF6CC9D64A@BL4PR19MB8902.namprd19.prod.outlook.com>
Date: Tue, 27 May 2025 17:36:59 +0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] arm64: dts: qcom: ipq5018: Add GE PHY to internal
 mdio bus
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
 Russell King <linux@armlinux.org.uk>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Florian Fainelli <f.fainelli@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-clk@vger.kernel.org
References: <20250525-ipq5018-ge-phy-v1-0-ddab8854e253@outlook.com>
 <20250525-ipq5018-ge-phy-v1-5-ddab8854e253@outlook.com>
 <f2732e5a-7ba9-4ed3-8d33-bd2b996f9a1d@oss.qualcomm.com>
Content-Language: en-US
From: George Moussalem <george.moussalem@outlook.com>
In-Reply-To: <f2732e5a-7ba9-4ed3-8d33-bd2b996f9a1d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DX2P273CA0007.AREP273.PROD.OUTLOOK.COM
 (2603:1086:300:8::19) To BL4PR19MB8902.namprd19.prod.outlook.com
 (2603:10b6:208:5aa::11)
X-Microsoft-Original-Message-ID:
 <08f68318-690b-4ff9-b981-e989ad506035@outlook.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL4PR19MB8902:EE_|CH3PR19MB8327:EE_
X-MS-Office365-Filtering-Correlation-Id: c0401402-026c-469e-339e-08dd9d23931c
X-MS-Exchange-SLBlob-MailProps:
	znQPCv1HvwVu6ov8hlKZu5ytU8AWxKlxAuwQl+rHZSMVrqbD9rfYAmutKMougDqL67qUpbVZ/UIciyjRenZxQklFc01+i4tRZyAJcHtxUKY6SWo1Ro3aR+HQplV13JPHZySHspPsz4T750jTNY6I1F66KuF9OowJStiBaMWO0KuCyqOe/T5ytX0ytyk1HlkwyQy4qXatVRecPx/bnb/tUFd9ZXTcGDEevJPOCZSZAm+JJj84qSwMIeN09q/fNEaYDGTDB8W7FSw0IHX1jJ64vmrwGjxTIGyPmhhUG8gqGABexrzw1ZsXjModNsscP6nJ/+wALf1/4L2PxU1W8rYa6gpnThdGiDYCU0BhkJprC7Cc8YuHvA0iy5Lx2TjZYQoJGNF3I/WMQMNw7pIxQfubxvQPyL/rxI5NsGRGSHB7yhT2c7ekbRYAY4XFl3I41ropw94v4aGqmPjpXYxjtOFo1P8oRA5vfiuFmrm7kMsNMot7eRviKO8GQVQRVfbJ/nqVdRmH80JmPO1fvC+0SpAxyeskJkYrSsrKXubGc2SirBVUcn+3H/K5q378OgTONW0d3awOzRRm3ZZOgemRWo796csCFeoIeqYGnEccNtXty8Gw4ZcKkn62f9edOUn/TjUji/okUK3XOlPyHQaNq6ohV9YznmzQam8NhrdqXnDdLfcN6D5QLWd7xMAghoE7E1JrQdHAd/bKwsVqfNEL0FUq3idyM+QdPZP1Nc5NWqAb3hCFO/SZ4flSGbaFwiWodecPTebC3XEeFN0=
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|7092599006|19110799006|15080799009|461199028|41001999006|8060799009|6090799003|5072599009|3412199025|440099028;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MityUFNaK0k1azdjMjBNT2NxUUNOV2FSVHVzK2tGOXVoZUxQajJPYnIvNVgz?=
 =?utf-8?B?YlNXUWhOdXAwU2hweEhzK2R2QXRnS1pxWGQ1OVMvRlhBOVBLQ25JL01MR3JN?=
 =?utf-8?B?MTJac1hLWlZMQndYUGpweDFGZjFGTEU5S1ZhWXJQN1hXdTIyL0Yvb3Jsc1o0?=
 =?utf-8?B?WGU5L2h1VkszYWlYNEdCTmErRVdudmhMd2pBU1F6ZFllZnZWRmdmblYxUnl1?=
 =?utf-8?B?N3MxYS8xamhIRzc3aGZBZHpwa2FSS2lJTFU2ZmhtbGJacDFacm5YWUtHbk1T?=
 =?utf-8?B?a2Y2TjZDbUdkOXFnQWFEbG95SmpYRkh5RFRreXFnMGZOVHZaYnNCOFVjOVhk?=
 =?utf-8?B?YW92ZHM0WkppRmVqeG5sTVJIbzZhYm5UQW5Rdk9kUDE0bXdQM0dFWWw2NlQr?=
 =?utf-8?B?TUtIZkRDMzhtL2xCVG00K2RsdG1jOGFBR3VOTU9Zc0pEUDh3TGhwZDNpS1E5?=
 =?utf-8?B?NGxvWnZWa0N5L1ZnOXc1VHBLRjYyOHhzZlZrUlVWU0t5ZmRRMXR4NFBuNSs3?=
 =?utf-8?B?YnRxclVLWXdSU1BZN2p3YjN3NkcxT0NJY0N3aEZZSEQ3SlFtcFdiUEkrN1Bx?=
 =?utf-8?B?TmxqblRUaFVzdzgwbnNHNlF3cHVlVy9kV1NONjJIcWRjZDhSQWl0VVdROFVV?=
 =?utf-8?B?VG5jQUZwMTRqS2UrQlBoZ0pwSllCMGd4dUNiRmJ6aW5xd3g4YnRvVFhwQjQ5?=
 =?utf-8?B?ZkdBNWVaWnJmTkNWQkxFc2E1NlJUdWRXOERia3hTVnJsQ1phdjd3blhmbjdK?=
 =?utf-8?B?MXpkN1JsMWEyR1BDdkZaRVdiNmxSMkpLZmhwWXBVbEd2R0dKTjhyb2lacVVu?=
 =?utf-8?B?ZXUzcHNxZi85ak1EenZUemRmeVJsbTFXT3dCRHRiaU51b05NVGdzRFR0L3B5?=
 =?utf-8?B?c2l2a01oN1EvZ2dGMTFpV3U3Ny96OG9TRFJUSk1TVUFSZk5EOE05eThHUm9y?=
 =?utf-8?B?OUgxRTdTS1VrdjhQZ3FWV3ZzVjI3eWlpTS8weGQyUy9GQ0JYUEozblZNWXg1?=
 =?utf-8?B?cFByazVMSjFpWVloZmdDZ1RpMWY2citNR2VubWppYzh1MzFBeVY3QWxib00y?=
 =?utf-8?B?eTlLM1FSaDUzTFVNL1BnN2Ftc2ljOWdtOFY3b1dVMEZkcVd0V2MwdEVRMVpm?=
 =?utf-8?B?VUdWMXFXazlIWlBQMFJDMlRETkpna3J3UWhCVmhDMGNWalo0SEMzN1FlOXA5?=
 =?utf-8?B?Ni9BbElLbnVvdlRrdGozYm9HK3ptOG9wdEExOU9GK0hFRzJVSy9lZDNFd1FE?=
 =?utf-8?B?S2FzYXNjNllOSjVLRW5JN3EwNnpZVGZEUTZ5ZFZTQkpySWJEQVFseHN4emI2?=
 =?utf-8?B?S0hxR0hNS2NzUTZ3bDB3SStabXFzY3V3RWdSZE52SENjamVtaTJZeXBhRm1Y?=
 =?utf-8?B?eDlsWGtobnhDRlpEVTB4czlYNWY2amdUL3FmcDZkSHRnREwzcDdERXh2Ri9F?=
 =?utf-8?B?MUl2QmxQaDlZcGE1MXBjazFWTVlXQmNkMTM0dkU3eWdoOHdBSFRTWjNOV0c0?=
 =?utf-8?B?RU5MNGpxSzd4bHhsQ1JYbmdZYWcvY1QvM1JSYTVUY3ZxMGR1cSswNlFEZ0RM?=
 =?utf-8?Q?h1U4oHo418ZmcOG/Mlqpuxljo=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y29kcWpQejdJcHc1NkJ2c1dPVlZlVEJFczJNcXZLT3FYQWV6R0VzeHRVemNi?=
 =?utf-8?B?U2lhd01md2tMNUM2cU5OWEdHU1QzT2ljc0YwTnI4Sk13Wmlva0dSOHQydHJG?=
 =?utf-8?B?NXFpZ3JlaDJGTDFkdm5ncUlzS3dLU1QrSlErcGRSbmsxVVpQb0V2cDhncWZz?=
 =?utf-8?B?bXRNZDhJUHgxMU1NSGNOeDJpTE9FbXNXdWQ4aXNVY3dtNk5LN0piaTJZaHZ6?=
 =?utf-8?B?czEyRTVmeTR5Ylp2ejNhTnFyVHU3NG9OMk9ZakFid1FmbjgrYi96c0tOSFpi?=
 =?utf-8?B?VlNmYmoySGtMZ0hrTkFMYnJ1UHg4WWJrSnRlSVpMNVhyUUJWMXBmZEZ5UUgv?=
 =?utf-8?B?T0NiQ1l2V2Uwcnd3YnZ4UFFlOE9VM2lZaVRvMi94NkcySlQ1bTkzakN4ODZx?=
 =?utf-8?B?TGNNWXVPTUt6NXBOVDV4ai9QS2NubnkrWCtEYXNWL2dQWGRwc0xMSE95ODg5?=
 =?utf-8?B?UVV1ZjFKczVUVk51UFd3WmsvSkdLcExla1NOMk90WFhiWlg0YmNjTmRNc0Fh?=
 =?utf-8?B?L1dYVktBSTFaaDdpbm8xRnZYeGdsVVlQbkFvY0VrNnZ2TkYrWjFOcWNPcERU?=
 =?utf-8?B?ejhCOHQ4aHcwWnNnS2liVVNuc0dTVDVkRDZiRXZYTzh1SlBiSjA1c3BtSndk?=
 =?utf-8?B?clF2NkJWbE1pMDlJYWNCbDRPSEFGYUxPdnhYWjRvRGpEeXdQKzU1MUs3eHp1?=
 =?utf-8?B?YWlqdGlrV3hZMDR1NlNWdXZObzZWelVaT1dSL3RNeE9IR1ZqSVpZK1FaWDMz?=
 =?utf-8?B?ZlFYdFN0L3YzVEhKRk9yNk5MRzQwbHlVRzd0bk5HWHdaNU1aU3JPTFlMM1pZ?=
 =?utf-8?B?MlphR20vaXR4TXVWaWZjdmg4bVYxNXYrbGdNR2d0Rzh1RjFVSXFkdGJzeG8x?=
 =?utf-8?B?bmFXcXBGaW5RNitsMTVvRCtFblc0SS9aemtoUmhwTnp2WnF4SC81RXh4WUhp?=
 =?utf-8?B?enJoL1U4TEpIZktSdWlkOUhQb1RPRGJ2Si9wa3pKY0tabzh5b2MxNFFSNzJU?=
 =?utf-8?B?VUZpOUNoTmJRYTJOcThtUXoxa21Hek9maUROdkRXS01CeFhoWmJTRkNFYTM3?=
 =?utf-8?B?a0w4V0pXOTlOVUQzc2ZCdXhEV3Rxc1F5Vld5VmJ0QTB6aEozSlVCUVZrR3Rp?=
 =?utf-8?B?eFhrVEJveEY3RnlBb3N4amNhZ0UzcjVmRzU3VFphem9TT3Jwd3o5eW9Jd2E5?=
 =?utf-8?B?Z05GTHdyR3lhbDVUNmhORFFieDdEOWFnbVRxeUhwcW01SFRseW9qQ3hqRG94?=
 =?utf-8?B?aVlEWFRYNDJubmpXWDBFZHlzWlUxWWlyVzhFenV1Y01zdjRNNmxwcUc4T2FO?=
 =?utf-8?B?M3lGbzJlSkwxMldzZDVhUnF2Sk1jWlN3c3F6b1hBSzJlc0orNTJWVDFxdXVB?=
 =?utf-8?B?Y0VvT2pobmFoelg4bW1GUmZENzBIN1ZPY0d6MTY0KzcwU01JQ1pvcEwzWEpp?=
 =?utf-8?B?UjN2M3ZGTXl4YUxKczJJbTV6UE05N1NhcGFHK2tobjZjczV4Mnp3UEl2RndM?=
 =?utf-8?B?YitKdllIWnBZZUt0cnR1UzBVWTgraGo3eEpKWFBwUyt0VU02QkFxOXVQaEdj?=
 =?utf-8?B?UDJWb1VKK3YrelZ0VVRWYWpaYjRVb3JJRXNtYzlHMm5qcWpSR0dhZ3FUM1M1?=
 =?utf-8?B?U0R3eGJVZ0V3R0FjaksrMmxjWjQveEQxTHA5RENBempTei9JZFJ5c2l2bzFt?=
 =?utf-8?Q?vvgEimSeS0OAKsTtewG/?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c0401402-026c-469e-339e-08dd9d23931c
X-MS-Exchange-CrossTenant-AuthSource: BL4PR19MB8902.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2025 13:37:08.0953
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR19MB8327



On 5/27/25 17:34, Konrad Dybcio wrote:
> On 5/25/25 7:56 PM, George Moussalem via B4 Relay wrote:
>> From: George Moussalem <george.moussalem@outlook.com>
>>
>> The IPQ5018 SoC contains an internal GE PHY, always at phy address 7.
>> As such, let's add the GE PHY node to the SoC dtsi.
>>
>> In addition, the GE PHY outputs both the RX and TX clocks to the GCC
>> which gate controls them and routes them back to the PHY itself.
>> So let's create two DT fixed clocks and register them in the GCC node.
>>
>> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
>> ---
>>   arch/arm64/boot/dts/qcom/ipq5018.dtsi | 27 +++++++++++++++++++++++++--
>>   1 file changed, 25 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/ipq5018.dtsi b/arch/arm64/boot/dts/qcom/ipq5018.dtsi
>> index 03ebc3e305b267c98a034c41ce47a39269afce75..ff2de44f9b85993fb2d426f85676f7d54c5cf637 100644
>> --- a/arch/arm64/boot/dts/qcom/ipq5018.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/ipq5018.dtsi
>> @@ -16,6 +16,18 @@ / {
>>   	#size-cells = <2>;
>>   
>>   	clocks {
>> +		gephy_rx_clk: gephy-rx-clk {
>> +			compatible = "fixed-clock";
>> +			clock-frequency = <125000000>;
>> +			#clock-cells = <0>;
>> +		};
>> +
>> +		gephy_tx_clk: gephy-tx-clk {
>> +			compatible = "fixed-clock";
>> +			clock-frequency = <125000000>;
>> +			#clock-cells = <0>;
>> +		};
>> +
>>   		sleep_clk: sleep-clk {
>>   			compatible = "fixed-clock";
>>   			#clock-cells = <0>;
>> @@ -192,6 +204,17 @@ mdio0: mdio@88000 {
>>   			clock-names = "gcc_mdio_ahb_clk";
>>   
>>   			status = "disabled";
>> +
>> +			ge_phy: ethernet-phy@7 {
> 
> drop the label unless it needs to be passed somewhere

it is needed for boards where the qcom,dac-preset-short-cable property 
needs to be set. Thanks for the quick review!

> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Konrad

George

