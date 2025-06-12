Return-Path: <linux-arm-msm+bounces-61126-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 53B83AD7162
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Jun 2025 15:15:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CFDCC1C20727
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Jun 2025 13:11:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 099D023D290;
	Thu, 12 Jun 2025 13:11:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="edNGQLg1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12olkn2101.outbound.protection.outlook.com [40.92.21.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D48212F431E;
	Thu, 12 Jun 2025 13:11:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.92.21.101
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749733883; cv=fail; b=kyt6g6DfQlzDzkAl6dUXZrjHC9sQzVyJg6gUB/Tirq7D4796NsXQB3S8SacZWWQG8hh3Di9M7abvzqCXBlNoTZF5E0hwOy4cnRv453RSERGqRWK9HzDXf0EnGiWp3TNc1V4yfJcvhdd2kHmWiDpDqt/5XESf5+a2hh0+IZBkWKs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749733883; c=relaxed/simple;
	bh=LLaUOkML98/X7EbLgdB3L5q7J3Kc0PDmLb1AVTCEvYw=;
	h=Message-ID:Date:From:Subject:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=KxCTl4Yo0HewPppQXPoQnRQs2z3Clj2Gme92wpwh5cB2HJWS5b34fEpwQqqub3xDlMz56kLY0Mc/7KX33HleEUFH/uh+oYpSDi9egJ14LwFqtcvjmPiYoE8TXLd6rkNS+NVrO92ODDvn1sxGfzqtkA7xTEpbC2ylV3ZclJxGu7s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=edNGQLg1; arc=fail smtp.client-ip=40.92.21.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oPSi19JHuPQNvvX5otMAvI8knRFt61Yk0P2XMUpmaDI6LgycXC3/ecLrzTVQr76Y6koFr2InZL5TH2HeFwDzjhY6zy1zCjCpR+hYtaQXLrXGtvJEYPK9WGKtFuaOFmyW3bCtACfiwE3oOi7brpz1NmBlE2145tPoaseU2aEOIKz1bzLpO+0KM7knabTnpbOZK9fZzcvkJoDDNZ0OnQ2S6qiLRZEn1TjYqu8yiLqmh0TNiqse/wyCSv8pO2Wocd4ksJRoD87vErAYb8SCiWxgKZ83/okAjUCM3xOZ6oTnwCSVkUlFechQtQMhsZVtf9qyHTA9JbyG1hLfmcIhlCXiIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lel3R+bKh+xNLzzmNU53jQfPmfAluAP/XpaH/lDwXaM=;
 b=PLSb2SK5CTsKFPpweaaGIAzc7pIKdumko64NaUisSzib7iqWxfQoGL36f5dKpugDXfbXUSQvhljJ/ZWIlsOwrqusR0/w6RmE/lFolZuwTXKcTfWVYvRha6LNMvhXK7wRxpeX6bb9H8aPMbMjnvie4NkA6FoP5VT8LbKqZJKjfcu9se2j4aRsATgMjvT2+LAGSPP6ug0suGzytiSjxERp+snSGRw+jwX2tJsKaFuSCYavuLboE4wzW5Z7p2muEQLqOYpVTV4uf3/I68izn7ve5V5/9SOmgHdFLt8R4/MS5rHzy23t7oiCyBE2q7baFtsqWsQrrbkgV4ZBPHGeIdV2iQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lel3R+bKh+xNLzzmNU53jQfPmfAluAP/XpaH/lDwXaM=;
 b=edNGQLg1seoIc+iQpfds2+7c3CZKjQORSPWKyLb8//cZBm/7imE4A7hJG+OAgicDda19jFgxvN6nSQW1s2XKC5tKzm7sk0LBwk+PCnaIaPgTEiRUqTyERjaCUFtjZACAYgFzXeY/5SabSDR6SoWtSuLmxesUHyTs8jJ0xCdi2UJN8C2YxY/eOqREMRzi+LXC7Q/6VCwKrUElQaSoPs2ZRHU7KSNjGc/YLBn9BTybq56/NoOAEuZGryZ0M/beWTKLOmBSCYI/zbc4w/OjOgGlC41ANiuj3NHLgSjLRbqnaFyNSmSgWE4KwUGopzAZ1Q9UTaC4bWXgHz2f96lurKdEdQ==
Received: from DS7PR19MB8883.namprd19.prod.outlook.com (2603:10b6:8:253::16)
 by DS0PR19MB7396.namprd19.prod.outlook.com (2603:10b6:8:148::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.13; Thu, 12 Jun
 2025 13:11:19 +0000
Received: from DS7PR19MB8883.namprd19.prod.outlook.com
 ([fe80::e0c2:5b31:534:4305]) by DS7PR19MB8883.namprd19.prod.outlook.com
 ([fe80::e0c2:5b31:534:4305%6]) with mapi id 15.20.8835.012; Thu, 12 Jun 2025
 13:11:19 +0000
Message-ID:
 <DS7PR19MB88833EF18DC634F4D7F037439D74A@DS7PR19MB8883.namprd19.prod.outlook.com>
Date: Thu, 12 Jun 2025 17:11:07 +0400
User-Agent: Mozilla Thunderbird
From: George Moussalem <george.moussalem@outlook.com>
Subject: [PATCH net-next v5 3/5] net: phy: qcom: at803x: Add Qualcomm IPQ5018
 Internal PHY support
To: Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
 Heiner Kallweit <hkallweit1@gmail.com>, Russell King
 <linux@armlinux.org.uk>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Florian Fainelli <f.fainelli@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, George Moussalem <george.moussalem@outlook.com>
References: <20250612-ipq5018-ge-phy-v5-0-b5baf36705b0@outlook.com>
Content-Language: en-US
In-Reply-To: <20250612-ipq5018-ge-phy-v5-0-b5baf36705b0@outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DX0P273CA0031.AREP273.PROD.OUTLOOK.COM
 (2603:1086:300:58::9) To DS7PR19MB8883.namprd19.prod.outlook.com
 (2603:10b6:8:253::16)
X-Microsoft-Original-Message-ID:
 <78aa087c-89da-4d98-8eac-54ec094cd96c@outlook.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR19MB8883:EE_|DS0PR19MB7396:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d98143f-544b-423d-54c0-08dda9b29e69
X-MS-Exchange-SLBlob-MailProps:
	znQPCv1HvwXdA/joONLFXTlfxj2poQ4Oyte8+9yH4t1HkgqzjjXxDSlBkiVBgUMaJX3n50kOjlJbxL01vVYoestIpMTrWauFSlVBNMUblNWUVYdc7uBKFHb+12pYfGL8+wdwg4Lrx4MbDRFVS04kZVYx/dMg2uQYkZvaE7SSQCQhrXWpeMeAJNhz7fGO4TUGudAeprGaUtBirjypHK/JKqFB1i0ss5vC4xIJq8YO+jjErVPbJhP/k9WkHz0UV29KXUpKFw+MewC3Q88lGMANyCiHlj+s1KnSerG9qheY4Kc9m0CfBExf+kJNWslzqU9OSUFnBT/wAeavPHKZd7djCzv17mTfFX9ZfRZlGpMTXe/0mR9izPH7DkRI5XBOBre3Cn+3V4gw/QJmXStK69EguAGJupkakvLq4Q70uhiqpOgw0v+7JHbdPekeioSzES4Qn8jBzHCikv3Ry8V8JkJPNtkNRRptdFuH7kfX0tCEc7t0vc2vZl0L+tI+zh+vHQ2Yh/nvmej4bAoRMToqwSAgC1rqdAOqbhRR8EJ8EhE6ksZtcRC9ttHcmU9dSzFdU2+GJbO/6uNTmh80aqZWpcXEYOFx2BcBrKvrONCQz9JO3BYuVeKTZ7dr1q9jNuofJIdSw9pNP6mRKssm6dbeC+l1f/dnSugYBTlLd9Qo413POKlkcABqXLkpze9NVMl60Vig3Ejegbeb1SWIP40NAYl64N84Cyhppa5pVyols9i1wxLlxOTGBH56Hs1ZDHya/5qiraynSVAr9FQ=
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|6090799003|5072599009|7092599006|15080799009|41001999006|461199028|8060799009|19110799006|40105399003|440099028|3412199025|12091999003|1710799026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RDhuRS9qQm83ODdxdnh2OTg3bk5NNHVXUnpBdUtQVU5IWUxmU21YbEY2ZHB0?=
 =?utf-8?B?bFN2eEVHTERFODI4UzIwUVlpQWZjbVRWTzdTZ3BtQTlQUE5tYU1KRGZLMEc5?=
 =?utf-8?B?THdUakxJMmNaRDhqZE1pOUpZQ1hOMkp1clpsL0VPcHI1TXRBT0k4K0lDb3RR?=
 =?utf-8?B?a2lGcFhITGJNN3pTRGxad25oVDYwV3ZBZjduY0IvSFpQTysrL1Yxak91MGRY?=
 =?utf-8?B?bXdUbnN2c2g0aldUZGdzcWdiLytrckdMUUxFcnRmakVPeTJIcW9xV051eXZ5?=
 =?utf-8?B?M0VCenl0ZjlVVUExaWZnTUYwU0I4NlQ1R0JlZ05JRWgvMDVScTFSOEdoMnZK?=
 =?utf-8?B?bGppQkZVYVpzQjQ1dGJiRytZVHpCdktPNG5RTUp4aFdkV09nRWJCVVNQQzZ3?=
 =?utf-8?B?dW1YTVVVMWJHbGhIcXhDeVFMcm1TWE0wUXk3MFVnM1R3TXZ5YWpRMnRqMGsv?=
 =?utf-8?B?b3dJYnI2TndPZHJCdVVvbmJpR1JEazlrcDZvZlVDZVd0Qi9aTm5JQWJqT1pB?=
 =?utf-8?B?cEIwU29KbWtyT3RUVXV0YzZacEoyQVloS1JpWFc2TzkydjZ5Um1nVTZ4Rm04?=
 =?utf-8?B?czFZS1V2WlB4bzVEdzJQUGdTa3lTUmRpVmtVZTdmRHhBbDJ2QjlrRnB2SUFB?=
 =?utf-8?B?YmdZdytUNDRMbkdNbytzYUEyTVRNZjVWbzNWSWtlWmtvZFA1RzUxOUh3K3gy?=
 =?utf-8?B?SE83NFVoanVDSEFqKzdwNjlQU29TTmJnR01XK0htcDZ0dzhKcXoranBmbGVI?=
 =?utf-8?B?SnVjSVliWjI0MDkwM29XOFlQOGRLTHRJYnZPaUxVVTgrdUJBbnpCQWViSTk2?=
 =?utf-8?B?VC9kdDBqTEpEZTVpYUhrVnNKdmpnaEZCT3cwTTdkNFFQT3RCR3dGeWFqRjU2?=
 =?utf-8?B?MVR2MER4T3B0amJmV0t0NlFYWnRSRGs4cHkxRmdoeDc4VmlRbjJ1RzlzQU9W?=
 =?utf-8?B?TS92ZmdidUJaK3prUVFLb3gxNzNPMjJjQVQ0SElDYUpuQ250WlEwSnRJSUh0?=
 =?utf-8?B?ZmJlTmgrNnB1NlQ0ZU5XeVd6SjErd1d6ek1JS3pHb0pUckFQSlJZdWR5WlZE?=
 =?utf-8?B?UmFJbHJMRnhEMHhLYnA4Uk5FQ1o3Zmx2UE1PN1Z0SGNKVlU5aTJJNzFSSDMw?=
 =?utf-8?B?ZjVXRTE4b0JrbmpZemtyNUQ0Z1FyZy9iQ2ZEUkxqTDlzbFpiY3BtQXJaZWJn?=
 =?utf-8?B?b3h1S1ZTLzd0RUlmUHZFL1VWU2xOMlAycisxUnQ2RjJrNjgzeHhTQlRzTk9Q?=
 =?utf-8?B?cVRXaHplcFo3UzdySHBDNDgzNmUwUVQxSVlNc05Xd2J1R0N1VWRWeTRwVzJU?=
 =?utf-8?B?ekwreldXcTlRUEZUTG00Q0prK2J2VWRLTXd5b0lwTDArZjNKbmo0SWRudmlT?=
 =?utf-8?B?dGR4Mkt2NzJMY1hhUXBpdlF4b1RWN3dUMEQ5RWVtYkhoK2lOdXYzRFhSMXcx?=
 =?utf-8?B?K3J0MG4vYjU0NHA1cWI3R0x4WUlmYUtmSUIxQ3BmZmdPNFVGK0FwblI1Umpw?=
 =?utf-8?B?V2ptNmZFajA1eVYwcTlxNXBEbEh1WGd5SnhMaCtmM1NxMHU4SEp4UG5lSWdM?=
 =?utf-8?B?MHExejB6RDArVFF3WjJ2bVNyYnh5U0M1VHArZ3RCemZXUXhYc25QbGNnNXpT?=
 =?utf-8?B?ZEdibkU2a1lsVEs5dVVicXRjeDZDeHZTejRnZjhlSEsvaXlaM3NrbFdCcFZ5?=
 =?utf-8?B?aTZLQi83cDBqWTVWTkY2NXZmdllsREtXZ01GQUhtbGNUNnhGa3IwWlZnPT0=?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Z0ZpbVNDRHU1MzhnRWYyN2tkNG9jQmFlYzlsaWQxTkFOeGhWOE9UWnkxeGZ0?=
 =?utf-8?B?TU8zL3BCdGtqWW9uVHhTbGwzUkVPVUM3YVlwbWJRbElNU3VmRDM0NzZMK1BM?=
 =?utf-8?B?em84NXdiUjF3Z2IzM3lScEZMcTRyRytZYUFKS2tJZU1kZnFwYVY2U1BqOUFa?=
 =?utf-8?B?SGhldWR5S3dGelV1MG5yRklmS281ektxdHVQbXFkYThqSlk5d05VS2RsY3lK?=
 =?utf-8?B?Y3I5Q3Q5YXQwRktrT0krU1JCaFNiTURWOEVrdDlmTjBTTzZ1TFY3bGh5MWly?=
 =?utf-8?B?Njh0Vm1lTU84Uy9SbURmaG1oM0JhWWYxblR5dDVnMVFTdmVmL0p4Rzc2Y1dz?=
 =?utf-8?B?MHlKRmJSalBsSksvWHNwVk00ZTZSYkxNZzNaZHpaQWg0QjFkb240ekNxUEVj?=
 =?utf-8?B?UzdINElmY2Y4eCtUTUUwZHI2cGN0SEQ3SEUwN0J5M1U3NWpHY2xSdHhnOVJF?=
 =?utf-8?B?N1NYemJROStzcHhwNnUwZmhJZDhXNjRlcTBMVkQ4UnJnNW0wMXNzUVRodkhl?=
 =?utf-8?B?QjdGZlNQcEI0YUR3UXFrdjQrTUd6RC90QnNVR1RPZTU1QkNlSHFiQUpCLzZ1?=
 =?utf-8?B?SEZ5c2NtYzdVT0YxMGJhOCt3ZFR5UHgyRWdFSXREQ1krOUZuT0VVMzJqYzZp?=
 =?utf-8?B?Q01rdFhlV3ZCVVRqTExtdnNGMkRzaGtXZzZUaDM3V2RsOUtIcGF0T2RFa01k?=
 =?utf-8?B?aXlVcjBqcU5nRFlXdzY2Vk5tYzdCZlp0SldBS2Y1Znd0QVhvMG1TVzhCUUVU?=
 =?utf-8?B?ZmNhNlBGV0VxNkNFc0hudThreENPYW5Xazl2WTlGTENhS01YVlZkMEVuN3N3?=
 =?utf-8?B?eFpxa1ZSYk9TRkhMZ2FNWUkrRm1oWEZXQXBZSFljbzJBRTRRZ05yU05OTEtx?=
 =?utf-8?B?aU10bXgwbWRwdmhORVhKZGRLeVFxZ1hqQndyamc4cnJ2bXNxaW5vM3VCR3FU?=
 =?utf-8?B?RUxTdTZPSWI0cjZoWXo1eG4xSmNscHlxVVZ0bWN4MTBBSzc5VnJDM2lsSUdi?=
 =?utf-8?B?bVdQcWtWOG1tN3h6bU1pcks3aDIyNSs5YXVYT0tqMWVYS3hVMWZDQ2ZrUGkz?=
 =?utf-8?B?ZVZkSHBJbS9yc25JankweGVnWEJ1WXdBVEhjRlZmQkU0TGUvdzE3THpxUkta?=
 =?utf-8?B?bHVQemR2SnJNMTc1Tk9mMEJOUmpFOTBYcXpKYXIyOHptL3RibXNrTVZFbUlS?=
 =?utf-8?B?Rzk3VnNBODRoaVh3VGVJdUJzUTlRTnkwM0lKY3RDTFUvZ0JNRjdBdW4rSnA3?=
 =?utf-8?B?UWo5N2ZFdXdZTmc4MFR0NzRIZjArdWlHZjZDT3BNZWJ4enhjRE5OWFlucmU3?=
 =?utf-8?B?VHNYTXdaOEZBb3NOcVZrVG1Sbm5YNXZRR2p4RmV3TXNMNU9pRml6T1FiSGRn?=
 =?utf-8?B?Zlh0dXYxbURsM21TR0pVSm1Bb2NEd0hTWlZidGlkelZNcklyTHIvNlUwOWRx?=
 =?utf-8?B?OERNSGxIMjFaclBRLzdWSHNHRUVibklEZ2lOeWFHTEJmYmwvTFo5OHlNVzdT?=
 =?utf-8?B?KzBVQkhiU3JtRFQ3MTBORTFSbWE1c0YxN2djZ3BqWWNRejNUMUQyckFZUkJu?=
 =?utf-8?B?YWhKcVhhemtvNWQzSGxORElmNGNQRTQxdURjK29mZHBUWGtuUkVObHJQdHFL?=
 =?utf-8?B?aElCd2ZRa1RnUTlSQWZ1VHAzclVRYzhtT1lQNitYNWFyZDlycU5XZEM3Zmw2?=
 =?utf-8?Q?L3k675LeB/17evIL+pWN?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d98143f-544b-423d-54c0-08dda9b29e69
X-MS-Exchange-CrossTenant-AuthSource: DS7PR19MB8883.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2025 13:11:19.2607
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR19MB7396

The IPQ5018 SoC contains a single internal Gigabit Ethernet PHY which
provides an MDI interface directly to an RJ45 connector or an external
switch over a PHY to PHY link.

The PHY supports 10BASE-T/100BASE-TX/1000BASE-T link modes in SGMII
interface mode, CDT, auto-negotiation and 802.3az EEE.

Let's add support for this PHY in the at803x driver as it falls within
the Qualcomm Atheros OUI.

Signed-off-by: George Moussalem <george.moussalem@outlook.com>
---
 drivers/net/phy/qcom/Kconfig  |   2 +-
 drivers/net/phy/qcom/at803x.c | 167 ++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 168 insertions(+), 1 deletion(-)

diff --git a/drivers/net/phy/qcom/Kconfig b/drivers/net/phy/qcom/Kconfig
index 570626cc8e14d3e6615f74a6377f0f7c9f723e89..84239e08a8dfa466b0a7b2a5ec724a168b692cd2 100644
--- a/drivers/net/phy/qcom/Kconfig
+++ b/drivers/net/phy/qcom/Kconfig
@@ -7,7 +7,7 @@ config AT803X_PHY
 	select QCOM_NET_PHYLIB
 	depends on REGULATOR
 	help
-	  Currently supports the AR8030, AR8031, AR8033, AR8035 model
+	  Currently supports the AR8030, AR8031, AR8033, AR8035, IPQ5018 model
 
 config QCA83XX_PHY
 	tristate "Qualcomm Atheros QCA833x PHYs"
diff --git a/drivers/net/phy/qcom/at803x.c b/drivers/net/phy/qcom/at803x.c
index 26350b962890b0321153d74758b13d817407d094..43e604171828ce35d5950e02b1d08ee3e4523fdc 100644
--- a/drivers/net/phy/qcom/at803x.c
+++ b/drivers/net/phy/qcom/at803x.c
@@ -19,6 +19,7 @@
 #include <linux/regulator/consumer.h>
 #include <linux/of.h>
 #include <linux/phylink.h>
+#include <linux/reset.h>
 #include <linux/sfp.h>
 #include <dt-bindings/net/qca-ar803x.h>
 
@@ -96,6 +97,8 @@
 #define ATH8035_PHY_ID				0x004dd072
 #define AT8030_PHY_ID_MASK			0xffffffef
 
+#define IPQ5018_PHY_ID				0x004dd0c0
+
 #define QCA9561_PHY_ID				0x004dd042
 
 #define AT803X_PAGE_FIBER			0
@@ -108,6 +111,48 @@
 /* disable hibernation mode */
 #define AT803X_DISABLE_HIBERNATION_MODE		BIT(2)
 
+#define IPQ5018_PHY_FIFO_CONTROL		0x19
+#define IPQ5018_PHY_FIFO_RESET			GENMASK(1, 0)
+
+#define IPQ5018_PHY_DEBUG_EDAC			0x4380
+#define IPQ5018_PHY_MMD1_MDAC			0x8100
+#define IPQ5018_PHY_DAC_MASK			GENMASK(15, 8)
+
+/* MDAC and EDAC values for short cable length */
+#define IPQ5018_PHY_DEBUG_EDAC_VAL		0x10
+#define IPQ5018_PHY_MMD1_MDAC_VAL		0x10
+
+#define IPQ5018_PHY_MMD1_MSE_THRESH1		0x1000
+#define IPQ5018_PHY_MMD1_MSE_THRESH2		0x1001
+#define IPQ5018_PHY_PCS_EEE_TX_TIMER		0x8008
+#define IPQ5018_PHY_PCS_EEE_RX_TIMER		0x8009
+#define IPQ5018_PHY_PCS_CDT_THRESH_CTRL3	0x8074
+#define IPQ5018_PHY_PCS_CDT_THRESH_CTRL4	0x8075
+#define IPQ5018_PHY_PCS_CDT_THRESH_CTRL5	0x8076
+#define IPQ5018_PHY_PCS_CDT_THRESH_CTRL6	0x8077
+#define IPQ5018_PHY_PCS_CDT_THRESH_CTRL7	0x8078
+#define IPQ5018_PHY_PCS_CDT_THRESH_CTRL9	0x807a
+#define IPQ5018_PHY_PCS_CDT_THRESH_CTRL13	0x807e
+#define IPQ5018_PHY_PCS_CDT_THRESH_CTRL14	0x807f
+
+#define IPQ5018_PHY_MMD1_MSE_THRESH1_VAL	0xf1
+#define IPQ5018_PHY_MMD1_MSE_THRESH2_VAL	0x1f6
+#define IPQ5018_PHY_PCS_EEE_TX_TIMER_VAL	0x7880
+#define IPQ5018_PHY_PCS_EEE_RX_TIMER_VAL	0xc8
+#define IPQ5018_PHY_PCS_CDT_THRESH_CTRL3_VAL	0xc040
+#define IPQ5018_PHY_PCS_CDT_THRESH_CTRL4_VAL	0xa060
+#define IPQ5018_PHY_PCS_CDT_THRESH_CTRL5_VAL	0xc040
+#define IPQ5018_PHY_PCS_CDT_THRESH_CTRL6_VAL	0xa060
+#define IPQ5018_PHY_PCS_CDT_THRESH_CTRL7_VAL	0xc24c
+#define IPQ5018_PHY_PCS_CDT_THRESH_CTRL9_VAL	0xc060
+#define IPQ5018_PHY_PCS_CDT_THRESH_CTRL13_VAL	0xb060
+#define IPQ5018_PHY_PCS_NEAR_ECHO_THRESH_VAL	0x90b0
+
+#define IPQ5018_PHY_DEBUG_ANA_LDO_EFUSE		0x1
+#define IPQ5018_PHY_DEBUG_ANA_LDO_EFUSE_MASK	GENMASK(7, 4)
+#define IPQ5018_PHY_DEBUG_ANA_LDO_EFUSE_DEFAULT	0x50
+#define IPQ5018_PHY_DEBUG_ANA_DAC_FILTER	0xa080
+
 MODULE_DESCRIPTION("Qualcomm Atheros AR803x PHY driver");
 MODULE_AUTHOR("Matus Ujhelyi");
 MODULE_LICENSE("GPL");
@@ -133,6 +178,11 @@ struct at803x_context {
 	u16 led_control;
 };
 
+struct ipq5018_priv {
+	struct reset_control *rst;
+	bool set_short_cable_dac;
+};
+
 static int at803x_write_page(struct phy_device *phydev, int page)
 {
 	int mask;
@@ -987,6 +1037,109 @@ static int at8035_probe(struct phy_device *phydev)
 	return at8035_parse_dt(phydev);
 }
 
+static int ipq5018_cable_test_start(struct phy_device *phydev)
+{
+	phy_write_mmd(phydev, MDIO_MMD_PCS, IPQ5018_PHY_PCS_CDT_THRESH_CTRL3,
+		      IPQ5018_PHY_PCS_CDT_THRESH_CTRL3_VAL);
+	phy_write_mmd(phydev, MDIO_MMD_PCS, IPQ5018_PHY_PCS_CDT_THRESH_CTRL4,
+		      IPQ5018_PHY_PCS_CDT_THRESH_CTRL4_VAL);
+	phy_write_mmd(phydev, MDIO_MMD_PCS, IPQ5018_PHY_PCS_CDT_THRESH_CTRL5,
+		      IPQ5018_PHY_PCS_CDT_THRESH_CTRL5_VAL);
+	phy_write_mmd(phydev, MDIO_MMD_PCS, IPQ5018_PHY_PCS_CDT_THRESH_CTRL6,
+		      IPQ5018_PHY_PCS_CDT_THRESH_CTRL6_VAL);
+	phy_write_mmd(phydev, MDIO_MMD_PCS, IPQ5018_PHY_PCS_CDT_THRESH_CTRL7,
+		      IPQ5018_PHY_PCS_CDT_THRESH_CTRL7_VAL);
+	phy_write_mmd(phydev, MDIO_MMD_PCS, IPQ5018_PHY_PCS_CDT_THRESH_CTRL9,
+		      IPQ5018_PHY_PCS_CDT_THRESH_CTRL9_VAL);
+	phy_write_mmd(phydev, MDIO_MMD_PCS, IPQ5018_PHY_PCS_CDT_THRESH_CTRL13,
+		      IPQ5018_PHY_PCS_CDT_THRESH_CTRL13_VAL);
+	phy_write_mmd(phydev, MDIO_MMD_PCS, IPQ5018_PHY_PCS_CDT_THRESH_CTRL3,
+		      IPQ5018_PHY_PCS_NEAR_ECHO_THRESH_VAL);
+
+	/* we do all the (time consuming) work later */
+	return 0;
+}
+
+static int ipq5018_config_init(struct phy_device *phydev)
+{
+	struct ipq5018_priv *priv = phydev->priv;
+	u16 val;
+
+	/*
+	 * set LDO efuse: first temporarily store ANA_DAC_FILTER value from
+	 * debug register as it will be reset once the ANA_LDO_EFUSE register
+	 * is written to
+	 */
+	val = at803x_debug_reg_read(phydev, IPQ5018_PHY_DEBUG_ANA_DAC_FILTER);
+	at803x_debug_reg_mask(phydev, IPQ5018_PHY_DEBUG_ANA_LDO_EFUSE,
+			      IPQ5018_PHY_DEBUG_ANA_LDO_EFUSE_MASK,
+			      IPQ5018_PHY_DEBUG_ANA_LDO_EFUSE_DEFAULT);
+	at803x_debug_reg_write(phydev, IPQ5018_PHY_DEBUG_ANA_DAC_FILTER, val);
+
+	/* set 8023AZ EEE TX and RX timer values */
+	phy_write_mmd(phydev, MDIO_MMD_PCS, IPQ5018_PHY_PCS_EEE_TX_TIMER,
+		      IPQ5018_PHY_PCS_EEE_TX_TIMER_VAL);
+	phy_write_mmd(phydev, MDIO_MMD_PCS, IPQ5018_PHY_PCS_EEE_RX_TIMER,
+		      IPQ5018_PHY_PCS_EEE_RX_TIMER_VAL);
+
+	/* set MSE threshold values */
+	phy_write_mmd(phydev, MDIO_MMD_PMAPMD, IPQ5018_PHY_MMD1_MSE_THRESH1,
+		      IPQ5018_PHY_MMD1_MSE_THRESH1_VAL);
+	phy_write_mmd(phydev, MDIO_MMD_PMAPMD, IPQ5018_PHY_MMD1_MSE_THRESH2,
+		      IPQ5018_PHY_MMD1_MSE_THRESH2_VAL);
+
+	/* PHY DAC values are optional and only set in a PHY to PHY link architecture */
+	if (priv->set_short_cable_dac) {
+		/* setting MDAC (Multi-level Digital-to-Analog Converter) in MMD1 */
+		phy_modify_mmd(phydev, MDIO_MMD_PMAPMD, IPQ5018_PHY_MMD1_MDAC,
+			       IPQ5018_PHY_DAC_MASK, IPQ5018_PHY_MMD1_MDAC_VAL);
+
+		/* setting EDAC (Error-detection and Correction) in debug register */
+		at803x_debug_reg_mask(phydev, IPQ5018_PHY_DEBUG_EDAC,
+				      IPQ5018_PHY_DAC_MASK, IPQ5018_PHY_DEBUG_EDAC_VAL);
+	}
+
+	return 0;
+}
+
+static void ipq5018_link_change_notify(struct phy_device *phydev)
+{
+	/*
+	 * Reset the FIFO buffer upon link disconnects to clear any residual data
+	 * which may cause issues with the FIFO which it cannot recover from.
+	 */
+	mdiobus_modify_changed(phydev->mdio.bus, phydev->mdio.addr,
+			       IPQ5018_PHY_FIFO_CONTROL, IPQ5018_PHY_FIFO_RESET,
+			       phydev->link ? IPQ5018_PHY_FIFO_RESET : 0);
+}
+
+static int ipq5018_probe(struct phy_device *phydev)
+{
+	struct device *dev = &phydev->mdio.dev;
+	struct ipq5018_priv *priv;
+	int ret;
+
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	priv->set_short_cable_dac = of_property_read_bool(dev->of_node,
+							  "qcom,dac-preset-short-cable");
+
+	priv->rst = devm_reset_control_array_get_exclusive(dev);
+	if (IS_ERR(priv->rst))
+		return dev_err_probe(dev, PTR_ERR(priv->rst),
+				     "failed to acquire reset\n");
+
+	ret = reset_control_reset(priv->rst);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to reset\n");
+
+	phydev->priv = priv;
+
+	return 0;
+}
+
 static struct phy_driver at803x_driver[] = {
 {
 	/* Qualcomm Atheros AR8035 */
@@ -1078,6 +1231,19 @@ static struct phy_driver at803x_driver[] = {
 	.read_status		= at803x_read_status,
 	.soft_reset		= genphy_soft_reset,
 	.config_aneg		= at803x_config_aneg,
+}, {
+	PHY_ID_MATCH_EXACT(IPQ5018_PHY_ID),
+	.name			= "Qualcomm Atheros IPQ5018 internal PHY",
+	.flags			= PHY_IS_INTERNAL | PHY_POLL_CABLE_TEST,
+	.probe			= ipq5018_probe,
+	.config_init		= ipq5018_config_init,
+	.link_change_notify	= ipq5018_link_change_notify,
+	.read_status		= at803x_read_status,
+	.config_intr		= at803x_config_intr,
+	.handle_interrupt	= at803x_handle_interrupt,
+	.cable_test_start	= ipq5018_cable_test_start,
+	.cable_test_get_status	= qca808x_cable_test_get_status,
+	.soft_reset		= genphy_soft_reset,
 }, {
 	/* Qualcomm Atheros QCA9561 */
 	PHY_ID_MATCH_EXACT(QCA9561_PHY_ID),
@@ -1104,6 +1270,7 @@ static const struct mdio_device_id __maybe_unused atheros_tbl[] = {
 	{ PHY_ID_MATCH_EXACT(ATH8032_PHY_ID) },
 	{ PHY_ID_MATCH_EXACT(ATH8035_PHY_ID) },
 	{ PHY_ID_MATCH_EXACT(ATH9331_PHY_ID) },
+	{ PHY_ID_MATCH_EXACT(IPQ5018_PHY_ID) },
 	{ PHY_ID_MATCH_EXACT(QCA9561_PHY_ID) },
 	{ }
 };

-- 
2.49.0


