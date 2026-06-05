Return-Path: <linux-arm-msm+bounces-111437-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id HvY+GDDjImpWewEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111437-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 05 Jun 2026 16:54:40 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C37E8649087
	for <lists+linux-arm-msm@lfdr.de>; Fri, 05 Jun 2026 16:54:39 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=outlook.com header.s=selector1 header.b=VAuA4EFC;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111437-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111437-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=outlook.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B917B3101E1D
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Jun 2026 14:47:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59CDB3C2B9B;
	Fri,  5 Jun 2026 14:45:26 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azolkn19012013.outbound.protection.outlook.com [52.103.23.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF5BE3D0908;
	Fri,  5 Jun 2026 14:45:24 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780670726; cv=fail; b=nfbHkVnd/fUEuP91EFSucmuKZEF9NE3ESoP4nKwW9SFazCbr1tpczl/8alBGk2IrqirYhazAiX3G2aIaOA5Am5DOD8RO/35ssMDUoDMZtkbZc1lEhvpcUrCFeg6LAwrsSDnYPj/uZqocgT14D6tLZHvNU1BQ1k9kf4tgHlvCuLc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780670726; c=relaxed/simple;
	bh=gSqCJYPJ9ha0bGZZCSBHd/1dV09jzguv97bmztmX2tU=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=dNYXqh1IR81CGa6Pq8fzJIVn2yCFwYZ61miV0FyUmiRkwgsaUj0QUghV4b4+B0z7kySSqaa/9xLAJC7LGu33oXIZu7AivR6PU8GUITRJJgLXinTaXZdVHYfXVuia6uJAwxfNRMx5pNj/uWKQjBIqfgkYDSaimDHo+FLikph+ENA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=VAuA4EFC; arc=fail smtp.client-ip=52.103.23.13
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QGdYzBWFV8Osn5Q3B7OCjYcyYkv/sYvLMRtd3WmutI8/6ZtJwrkwVXrS+TP3V9TbI4eK95+0tVLFNjxxiMXS/EyEvOIuqfwPPTlfp8ft1JZyg6jYe0gUHzUx6rUspDIeCsgLbmBGnlogE1mrj5hqCIhd0glkw6kx8VKfZ6OWOHbPmTX9Z9uNuXnDfEFfHmipj/bvTtPplQ5ByV72B1iXmfcsjz7fxqgGc8UhTFRPmqpmF2BEgyQJBpTiTcDnHwBReBFHfQZ2sXEx3ZlYaf8ycgflIKGoXJA4diQB9odCmi0P9yWWjMr82X7iiRwvn/Mfqh41F9fbqVOa/8v2ovCyqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kT5T+GOyaU+WKnbmBVZx8dXLwxSeCrKOIABJZ9zIjYM=;
 b=T4CvC7x6/YUh7/+nVcXys4vXrIePh5P4ut7VkjTaEbSO/77b7mW25rH1Bz3sLjzWKhsYMZyF0Inw6k7jK01h9nHWeibkraoJiZiB3mf6I8UF8vIXODkrEqbBADQfxjdL1z6iqNovCtNMT1R45PcwMDrvB9jWUekJz/TgB4xHSfLXMW4rNPCKTZjiYKAnKxVYngoFtPw+BhBfTduB9IlIkGrihNE10fh0FajCqMBcSO/B0kfs7E6uoHkmabGEuAEWT2Z7pqvIpHp5wetRmx1YRJM3hsAnNTvBQqm4/smLDhEcwmZrtukAEepJG31kDyVtwI8Cp2Vm6kAUTdygAArQeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kT5T+GOyaU+WKnbmBVZx8dXLwxSeCrKOIABJZ9zIjYM=;
 b=VAuA4EFCvjtLEmqhi0AyIAECcjkIzrRPB4Sw52PKbRvwQRB9/CgwwVAyN3cZH2rM7Hzh/okEwaa+rcdKdK39H7Z19Zf1UW58DyACbE0yPnq3Bz8+mRa1qbyGAqwltD2a/w+1+vzzeEFMHv66nTK9VRKbjrx8B+q7tQr1pu4DnMdQ5a2Owv6kVb3U5UShi9lohoCp/wuAjIKa3J3+1buBbiBnqqk0GChgmz4E8nf/bnUrm0rjKBD1inJg3dKtW0Tk3GGIcTi4ulupVA2Lh6Eh0TY/NhjFH+vDMNIvlfUvcVyhcKQ1DR1e474oIelvo/450jXz6wOlHr3cDGtyW5dZMw==
Received: from SN7PR19MB6736.namprd19.prod.outlook.com (2603:10b6:806:263::12)
 by DS4PPFA96D1C9B4.namprd19.prod.outlook.com (2603:10b6:f:fc00::a44) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Fri, 5 Jun 2026
 14:45:22 +0000
Received: from SN7PR19MB6736.namprd19.prod.outlook.com
 ([fe80::4b6c:b84f:b71c:d0a]) by SN7PR19MB6736.namprd19.prod.outlook.com
 ([fe80::4b6c:b84f:b71c:d0a%3]) with mapi id 15.21.0092.007; Fri, 5 Jun 2026
 14:45:19 +0000
Message-ID:
 <SN7PR19MB673634FEEF98FB8BCBBB15979D112@SN7PR19MB6736.namprd19.prod.outlook.com>
Date: Fri, 5 Jun 2026 18:45:09 +0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] net: phy: at803x: add RX and TX clock management
 for IPQ5018 PHY
To: Andrew Lunn <andrew@lunn.ch>
Cc: Heiner Kallweit <hkallweit1@gmail.com>,
 Russell King <linux@armlinux.org.uk>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Florian Fainelli <f.fainelli@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org
References: <20260605-ipq5018-gephy-clocks-v3-0-f232d9ca0966@outlook.com>
 <20260605-ipq5018-gephy-clocks-v3-4-f232d9ca0966@outlook.com>
 <36cd63f4-749e-4b09-b8a6-cbf6924dea88@lunn.ch>
Content-Language: en-US
From: George Moussalem <george.moussalem@outlook.com>
In-Reply-To: <36cd63f4-749e-4b09-b8a6-cbf6924dea88@lunn.ch>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR1P264CA0166.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:347::12) To SN7PR19MB6736.namprd19.prod.outlook.com
 (2603:10b6:806:263::12)
X-Microsoft-Original-Message-ID:
 <45169cd4-77c9-4153-9382-7e0565a4e460@outlook.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR19MB6736:EE_|DS4PPFA96D1C9B4:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b73c0fd-86f1-4497-0959-08dec3110ff9
X-MS-Exchange-SLBlob-MailProps:
	znQPCv1HvwUXBahuwteIkQeW30lJPuxOeUl1GXz9pBEczOX9FX++RYQv85sIraT8HVhxetZkowD5uePlnHIB3UAl4lvLynrZq/FYq+DTpg+NQkWoHrncZLdR3qGSmNjjs1gSt7N1EogHCr19DytyPJXrwh1LRTg2fCSAEx7F/+rCW4SqvRPHuLgohV24FZG5+fjr5X0Dw+nCJYK+LIgnALmDSSrpveXQ5z3LRvFoEeC/+ReeSUALUtxCCgBQXKcKgaU8tWmucvp3VOl6wkGhb/i2cgBOEMXob/hywE5NRcEgvV+IGyahowNJNS9jgy62ipsMuycKLD7DqcI3Yy+YJ7OgtonLqod75cvLBAS1rW1X1aPNnSUHxwShH+FJ/BaBk69SGFd410PToESIJJGEkxzEF+GWhYAkU2noIcp6O+er+MKztx5RNADCaWWPAyF2mKWSvU2q3/2zlDKONlaZ4r7IyIxZ+r7KaOi1L+HZPD6dv7tR12oivK436kJ2sZsh9/PRMgRp2PLjSBCD82jAdOtaTCQ22cpySPdSm5bqZDg6fdj6FGFeYtI2/09yZ/9CVLh7AVkSjBvAxh5cP/fXCjdM0Ra1HRh8GXoTmK4Ul0hiWgYcVfTpM1CQo7SIGxYgWTq3Vy6weCrH502s79Fo9g51kftav5nsNvYfxXUgaSY2j41abGVwrpZyU/3+8wEh5iQlGYCb3icICMrLWKs51HmnFaqjorDaIL03E2hSXeodqve5kvqTBCGUFFVUO2efvmi8n2JOAjs=
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|5072599009|19110799012|23021999003|8060799015|15080799012|51005399006|37011999003|55001999006|24021099003|6090799003|3412199025|440099028|40105399003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OXhzYjFJSm96dEttOUh5NnN0VUZNUEUvQzJRZTlTdWdtRW9jUHh0YWVKc1ln?=
 =?utf-8?B?Y3ZnK2pXUlR2MlRnOHBSeSszMWE3NjZZcmkrVlNuVlFsRko1K1RSdXZ1UStr?=
 =?utf-8?B?WXhYYzdDckh1cDVjZU9MWCtENEM2eVBUamtPZ3lSc0JrL3I4cHZLNXgxZ082?=
 =?utf-8?B?RlNxZldQYjNHQ2p5NXBReGx4NFcwcTdtcHhFK0t5TGl6TGo2enV3SlFvcTZk?=
 =?utf-8?B?aEcyUVdNOCtIZVlrMXNsUCtIOUkwSkZQVUhVNzZNUFFjSjJ1N05ua200bHN3?=
 =?utf-8?B?MGlCb2RNQzBHUFJrd3lVOEFRQnNTZmhHVHdFdk9xcHFsUkJtcDZFUkhwRGZv?=
 =?utf-8?B?akZGOUlsK0lOOEJSSndiTmZWSGx0S3NlZWFQeGJNeFU5TWRVRjhRRkVwRE8r?=
 =?utf-8?B?TXB1ZCsrekpsenBYeVBGRUkxaklHOEh0d1VMSHVzek9CdXB5KzR6c0RTVXll?=
 =?utf-8?B?Q0FtUHNzNk90VlhHbFQxTjE1Q3Z5aFlVRFdDcnBiL0JFYzVGL0o0VW5HT2lC?=
 =?utf-8?B?TTNKZVhUNzY2Q0dIWUc2b0RwSVJleFdQK1NVSFpWVkV1V1dWMStCZnNxU1F2?=
 =?utf-8?B?c3BySDhNdVl6NDZFNUxyOEVUWXBJdmt2SWkweGRqN2g4dzI1Zm5LdUlBUnQw?=
 =?utf-8?B?c1lKS25Ia05WMCt5U09CU2pGa0NLcVdnaThqS1Z6RVRFbWhDUmpqUUNoRTlG?=
 =?utf-8?B?b0dab1NrQXVrMmIxVlhrdDZsYUkvNGV2dkphb3BlNUZTTkNCdktCcFhvN1pC?=
 =?utf-8?B?alJROUd1Q082NTAxbndUVmxBR05pa2ZINk9PSHZKYkN3VU1KSTVmZXRKSXRW?=
 =?utf-8?B?VnVNMDdnUWVPQzhIUjJqamtsWFVndkZXN3BMWktpbFpkUENJaXNGQnJ5NVNz?=
 =?utf-8?B?SlhINGszMEUxaG10dWJrM2h1MGZQZ3YwTlNUZ0luTVlTa1F0UkFZOGJxY1VL?=
 =?utf-8?B?Ry91OWc4eU41Z2JNY1NKYlpWQlZVRE90S3ZiQlpVQmE3K2hFTEtQQllmalBx?=
 =?utf-8?B?ajRvQ2podmpKL1RqRTI5QTBrNUcwVFd3OXZKU0RjRWtJWFM4TlBvcnNrNVlE?=
 =?utf-8?B?MVRpMlZ2eWwxTS9veTVqS2lRNzNUL2g2RjFXYWZRS0lzcXpWOXBMQVlrSFV0?=
 =?utf-8?B?c1hFSy9SMVh5UFlkVUlrbGxscVB5aGN0Nk1KV24rMWtKMFpCd2hrMFNJYU5X?=
 =?utf-8?B?QWF2QlZHNUgwZWMzVUp5U25XRXVXcTRXeFVvcGZFb1FMdGJRUWk0Z0dZODB4?=
 =?utf-8?B?V1lsQzRJZjU1NHZWYlFNV0g1U3pVOUFUc1FZU2oyMVYvY1lXRHh2K09veXpP?=
 =?utf-8?B?NE0vSG5OVk8zd3RDTkVFRzlnWkRvcnE2eXFibDdpd2dKUStkcytnME1FeFN5?=
 =?utf-8?B?aGtCLzBUZmkwREE9PQ==?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RlJNeW5lSjBxaWJtdlpWa2twdHg3K3dSRnJkVlhSZGFvMnZzaU1TcXdXcVdY?=
 =?utf-8?B?cEhMN0xteUcrYzJBSUMybEpTdmRZYWVBSW9EYkpLcVhrWkxtdkl5RGdLb3Fy?=
 =?utf-8?B?QlhUajl0OVR5YW8yZnhHR0k3Uk5semhRRi9tVW95RVVocTZycnlZS2J0OXlD?=
 =?utf-8?B?eGpxUmEvc0gyelZHQ2tsMFUvSnVBdS9lYStuREpmUjFmYWdxemQweE9XN1VK?=
 =?utf-8?B?SVdZMGxsTjNNVzM0dkpaUHFFRGFRdTZkWXpTR2dubU9lOG1KSDRJMmFxN1Yv?=
 =?utf-8?B?NXNnSytwbVdwL0Z0SlF2ZXNESXhEc2d4QW13KzltTDYyZkRGb0JUZzJRbTZE?=
 =?utf-8?B?aEM4S05PTWF6OHNCR1Z6dXJUdVlrc2YrZjZSTVEzVWVsTFR2TndIdEVHd0oz?=
 =?utf-8?B?YkRLajBJcHg4NHdOb1kydWxUa3ZJQnQ5SzQwL0FWMHJNMm9jVXNqbTh4VnBJ?=
 =?utf-8?B?NHcwUzFhYUEwK1dEbHhsMWlZMkR3UEoxWnlUWmdobTdsU1dneGlSRE9RbVFP?=
 =?utf-8?B?OGVrb1hWSG44YmNYNlVuNUdiMk9OWHVwZlBuUXl3TDNaMUFpWjZ0NUlhUW90?=
 =?utf-8?B?TEcxYzA5eHVUbit6SnF6dTBKSlhLcEFnYjdrdFdReldOaGRsOFNGcnBud2Mw?=
 =?utf-8?B?RUN2UkpTR0ZFOWs5L1lVdkFPUnkvR0Mxc2RHRzZ6MVM4WHRROVdaWGhWMkMw?=
 =?utf-8?B?c2huaWlkejgvZng1UnFZY1BOMjl4YVdUZzVUT2VrVHg1SnVCTHljN0Z3RWFH?=
 =?utf-8?B?N0s0RkJFMUIxRzZFZU9qc0JlNS9BUFp4eHNNcFl0bUg3YTIwYlF1ak1GNlN0?=
 =?utf-8?B?RFh2QW85RTVFenNvUUlOV0RuZlNBZUkyMitMRlY1T3YwUFdKMFo5bm5ydm1h?=
 =?utf-8?B?cDM3WGVJamZTMTk1aG9MOTd6QVJPWHI5Y3MxZEF3MmtYUDNQWFF6SzI5Smkr?=
 =?utf-8?B?ZVBVenVEeEZzak44SDREMGxFVjRCcTZIRjBZR2gvbldtdXJtSVYyMHhVTTVB?=
 =?utf-8?B?OVo1VFBiYjFBVzNyeU9MNHlpQnp5UzNYa0RJdUFLYjQ2b2pIUkZteG9tUlBa?=
 =?utf-8?B?Y3ZKQ0V4cW1FU1hjRWM4a0p0SFBiUFZqcWlicnVFRHIwck9kMzNoeU5NdG1B?=
 =?utf-8?B?Z3VqRWtqSmR0cEdxaHJiS3MzOVE4Wlgrd1hLTnZiMVphR05XM0U4MXlBb2tS?=
 =?utf-8?B?d0hETzVSZUZ1dy9SbFUrckVjK24zTytJUlFQYkszais1d2k0TFZzS3Zaelhr?=
 =?utf-8?B?aXV5ZlJ5MHp2RGpwYy9VZDhONUFDclFYQitmUzhZWTZWMnFVZWd2MFhJbG81?=
 =?utf-8?B?a1NiamFVQVcwOUgvQ2lTWmMxZVZNQ2g2VERUN2lQS0dyT3pSQXIvSWk4Q0Zq?=
 =?utf-8?B?K0RJOWt2cVN3T25FYllpQS85T0g1MGkwNHppNWt0UlhjaEVRclBTWGM5OUFY?=
 =?utf-8?B?ZkdKUGk0cENGOHd4R0x5eGZYeUV5TTNmZGdtTXFLT1BKMnlwdXFkS21iSjh0?=
 =?utf-8?B?V3ZRVUl4Z3MzU1dHSHNReXdKazdXYUZEbUFJcVY3eWhKZ3VrN1RDczBrMlZr?=
 =?utf-8?B?dUJQUEZUc2NUUkdZZ0FBV21WSG9CNnFQbndDNXl3WlR1bHV1ZU4zcFFuc3B0?=
 =?utf-8?B?VXFrVU0wK1BpOWI4R0JxMG5lenE4ZVdBcFMybmZVL2t2MFIvZ1pFdDFTK0w3?=
 =?utf-8?B?MXpvSFk2TUV3c3RFMjZpZU5GS1ZUUFAvZVAwVzdrV0I0SFhNSndkUGUrZENT?=
 =?utf-8?B?MU1GRmtUR0ZGRUhocXYrcGQxRUdiemdRdkJ0STh1RFREYjNORVNRVFJNeFdC?=
 =?utf-8?B?LzhOYktjdWNOVFJOZzF5R1YzejFpR0FxNWdJOEZaaEVzU0FpYzFyM2hnK1hU?=
 =?utf-8?B?Q1BSYnN3QVlYc1g4eDNHdGM5clZSSWloNWpLU1B1TzBIWGc9PQ==?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b73c0fd-86f1-4497-0959-08dec3110ff9
X-MS-Exchange-CrossTenant-AuthSource: SN7PR19MB6736.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2026 14:45:19.3412
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPFA96D1C9B4
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
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew@lunn.ch,m:hkallweit1@gmail.com,m:linux@armlinux.org.uk,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:f.fainelli@gmail.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:netdev@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:konrad.dybcio@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,m:ffainelli@gmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[george.moussalem@outlook.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[outlook.com];
	FORGED_MUA_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-111437-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[gmail.com,armlinux.org.uk,davemloft.net,google.com,kernel.org,redhat.com,vger.kernel.org,oss.qualcomm.com];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,outlook.com:dkim,outlook.com:from_mime,outlook.com:email,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C37E8649087

On 6/5/26 18:23, Andrew Lunn wrote:
> On Fri, Jun 05, 2026 at 04:41:29PM +0400, George Moussalem via B4 Relay wrote:
>> From: George Moussalem <george.moussalem@outlook.com>
>>
>> Acquire and manage the RX and TX clocks for the IPQ5018 PHY.
>> These clocks are required for the PHY's datapath to function correctly.
>> Gate the clocks upon link state changes for improved power management.
> 
>>  static void ipq5018_link_change_notify(struct phy_device *phydev)
>>  {
>> +	struct ipq5018_priv *priv = phydev->priv;
>> +	int ret;
>> +
>> +	if (phydev->link) {
>> +		if (!__clk_is_enabled(priv->rx_clk)) {
> 
> Using __ methods is usually a bad sign.
> 
> The logical also seems a bit odd. In order to get link, you need to Rx
> and Tx. Or is this device able to perform autoneg, send link pulses,
> without these clocks?

No, RX and TX are critical and need to be enabled for any ethernet data
to pass. Link state detection works without these clocks though which
explains the approach to enabling/disabling them upon link state changes.

> 
> Maybe when we have a better understanding of the requirements, we can
> find a better way to use the CCF without needing to go to its insides.

This PHY is integrated into the IPQ5018 SoC, connected to the first GMAC
(GMAC0) and probed upon boot. However, this PHY is not used on all
boards because an external PHY or switch can be wired to the SoC's
second GMAC instead (through a PCS). So from a power management
perspective, it would be better if we can disable the clocks if there's
no link detected.

> 
>      Andrew

George

