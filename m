Return-Path: <linux-arm-msm+bounces-62410-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 147C1AE7F2F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 12:26:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0AA0A7A95F3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 10:23:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F046829ACF1;
	Wed, 25 Jun 2025 10:25:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="g4wtkL0X"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12olkn2094.outbound.protection.outlook.com [40.92.21.94])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E394DF50F;
	Wed, 25 Jun 2025 10:25:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.92.21.94
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750847111; cv=fail; b=Ku1h9am1Y0QV5MTcu9lykfmFh6L4/6UNf3OgKgocjdArY/aF9gWtgIr5W2tYtjb6fL4AvZ8RfHPOz+rmv8O5t13JOkviMRPdCBHr0MoLVNGsRrpD51jY8saa/B46RAXSKOXaGv1bZcrbxeHu5KokMrSkzh54KKjWfPGTxOCgvWI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750847111; c=relaxed/simple;
	bh=35eqYO8NKG37rIFAtWSn5aHVAur0X7nGNEtRPM6HbBY=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=WW69IfpZ5JHAS2zmORoUr9Yin8w2xNd4fYY4kAOAJC2+h9oxhtnHQKpFXhPkDLsgH28KEOFKJHGJ0bxq4Vd3+YYxo1gTKmOQn9QCHcrVBX+juO++s2KxtDRd5qBOszvrnSkx8lAcfNFiJCyAj9ZYy78G57v25icKiCipKUs9XYs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=g4wtkL0X; arc=fail smtp.client-ip=40.92.21.94
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l/1csfKEHXah3qbTlGpETS+ud4yLWPJ3sfYnKFUWiBJ3l/3iCKqEm7sUacvOIsw6Z/M1PH8JXtJHl4/IBNjaKbKi6LeijD97D7sjqhzr31aHpU94/U8HSjgrH0lMqgn0lIwB3LO0S7UKw6fBL0heWiF9nsgUz815daRM9NaieisHz+XOiFeSDsFQPi4op75J/+3dn5vHHhEFyjpRhVn6bQEQ/KhOwF9jbBQVLet+YYFtDShojdaiGmY80mEpgtkHf/kMyWM+jek+dqwJRhFLMdWlal1T7ds7MFiKdCw9R4aUPEfzMeRUlvPBBIs4hwIbPhHaQ3umYvDEhHw5lhAZ5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CpBRpttXiR9DQiOaFPWh3dXmBZrp1zHAZTlnomeHezM=;
 b=sKwJGKrnmrOu5AHQSUpu+0/sXqCpvOou9hk4cw13XTvliz9OTrpC4DzUr/ppJMqbytk7WGHglUleBiJ+A9z/xGoRp/1RlDTZ8vuUTG3KOiSJW6Gi1s5Y/fxjKow3l3pnFwrYcpaqko8z3WlHpHfTr1SPZAtPMKivjPwDHRW/xNhk3ixWWFpxAxWYoIxV4svzW3jUB0KDYmTTPLPn84AXpoHd4vO4ibJ7b7nf9r2s6qz7qX3gsGErFwGAucRkJSdGDhpH5bpeueOXECkQqDUUqbBQ6fmsgvu9ulBuXSj5N7nduY8nUybgbwMMF19Xw+CHKddg20NVSf6aLWC1f6APvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CpBRpttXiR9DQiOaFPWh3dXmBZrp1zHAZTlnomeHezM=;
 b=g4wtkL0Xar4O2zFh2GOfqwKc98MijtQ1vtYUsKOndTHmW0v71ttVCJrD9QofJX9+ykl4boijXAI8sf3bXwBK1fQbBvBPcM/ohPk2p7BXv113JHkKvCQ14gnYJjodaONdJodO3H8C631Bubu6AroDyXoCqhcjQVVw8SRQTefTWdsjRCcTvA6uCptDen6zpeUPefK6VFq1qY2oFw089s8GPuPttC9kov0zfPtowyy4Cpo2zIHnY/PouzrIVEIrMc3nIvAv9xdP6rslHAfM6MS4Tt5wvx5Lrk3maVqSGERpV6fdX8jo7p6UWhohZe5f+vHqUPm74PTCd3JtT/EqhFBnYw==
Received: from DS7PR19MB8883.namprd19.prod.outlook.com (2603:10b6:8:253::16)
 by DS0PR19MB7247.namprd19.prod.outlook.com (2603:10b6:8:13f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.22; Wed, 25 Jun
 2025 10:25:07 +0000
Received: from DS7PR19MB8883.namprd19.prod.outlook.com
 ([fe80::5880:19f:c819:c921]) by DS7PR19MB8883.namprd19.prod.outlook.com
 ([fe80::5880:19f:c819:c921%5]) with mapi id 15.20.8857.022; Wed, 25 Jun 2025
 10:25:07 +0000
Message-ID:
 <DS7PR19MB888396A80C1A81792185630A9D7BA@DS7PR19MB8883.namprd19.prod.outlook.com>
Date: Wed, 25 Jun 2025 14:24:56 +0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/5] Add support for the IPQ5018 Internal GE PHY
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
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
 linux-clk@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20250610-ipq5018-ge-phy-v5-0-daa9694bdbd1@outlook.com>
Content-Language: en-US
From: George Moussalem <george.moussalem@outlook.com>
In-Reply-To: <20250610-ipq5018-ge-phy-v5-0-daa9694bdbd1@outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MR1P264CA0198.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:57::16) To DS7PR19MB8883.namprd19.prod.outlook.com
 (2603:10b6:8:253::16)
X-Microsoft-Original-Message-ID:
 <44e7c5aa-b7f0-4592-b0c6-1cc171635568@outlook.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR19MB8883:EE_|DS0PR19MB7247:EE_
X-MS-Office365-Filtering-Correlation-Id: 51f44370-fbbe-4664-ebf0-08ddb3d28e39
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|7092599006|41001999006|19110799006|8060799009|6090799003|5072599009|461199028|15080799009|3412199025|440099028|4302099013|40105399003|10035399007|1602099012;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MEFScWM0OEl2blEydWtObXBjQnRRYWtuamdWS05WeDhjWExla0ZIQWdGejhH?=
 =?utf-8?B?WmxQQnNLVmJoL3pIOVJTbFNWWWRiRGRzbGJSNHQ2VU55ekhpQ2NzOGZ0ckpx?=
 =?utf-8?B?NFg4eGtZL2xVeG54WVdycTltVjNEMFJxUVhhRExnVml4QkxqWjUyUGV2NEVH?=
 =?utf-8?B?Sm9xOXovUlZHV2VTR2F5RUxYbXF4OTJaUm1rOGVjWXZqYTREcDNvMXNrT0Zy?=
 =?utf-8?B?MEpSTWo2NnlKaStIeTBSeEJtVGJvdm53STZsL2xUYVA5M2JtR3BMT0U1YVdz?=
 =?utf-8?B?Mm1memY0LzFjYlN3LytWb1pWNkQ1T2FJQ0NnbE1kUWtkVFNwZkVjV1NlMWh2?=
 =?utf-8?B?Y0Erc3ZKdnVmMjE4TXpIRHJkYTVPZlNVT2ZHdWMrT0JscDBiZUlmSlJyL3A1?=
 =?utf-8?B?S3ZWYWM0ZkxaYlhsYlp3M2o1ZUFQYXQ2ckQ0RERCUlFvYy9lL3FiQmdqUmta?=
 =?utf-8?B?NmJyWXFlVXd4OTE4cVpXdzBVMEsxVUp6YXhiYkNXM2JHcCsvUzA5R3psUkk3?=
 =?utf-8?B?QXpUdHM4elpGY0txalBxOHV4ek9XbFI5d3h6MEkvSU96ZVhsQTlvMUtCOUpD?=
 =?utf-8?B?b29rS0R1WEZYOFF5UmE4T29qTzhSaGtQQnN3UVk0dUlDbDZPS1Znck9CRFk2?=
 =?utf-8?B?RTkyU3VldUpSMjRwem9aNWJ3ZkRuODdZMSttMmZZdCsrVE1TZ2dRWmVEblJx?=
 =?utf-8?B?cS80ZlF2Vk9RNUlObzFpWGJQWkRSZmo1RzJBdVZ2QjdUd2lkQ0h6SkM0d1Fn?=
 =?utf-8?B?aWZxQUl0eUhvRWFyL0lGc3hkeGIvRXdGZ2EydVlqUkplKzZaM1hNYS9NSVMr?=
 =?utf-8?B?QkdTWFZUS0p0cDBkZDJYTVpBR0t0bWh5TXlnMEZQSFBJYUdscmp2bEU0VGd4?=
 =?utf-8?B?SkcyNFdlZzhWWkRFeksyWTNFazJUV1BhTHlYUkhLWHkzZDNIU3VzMGh1U1V4?=
 =?utf-8?B?RjZpODhLR3ArNExvMitaOC9VU0pmQkNmTEZhU212ZVZXc0tTZ2llTzgrU1VZ?=
 =?utf-8?B?VlR0a2twZzVCdmE3M1NXWi94cU5USjBpdnFVTm1KSEN3SllZcGk2NENjM1BN?=
 =?utf-8?B?YU15dXlJbmNMUE1BTTU3bFJneTVjenZJeTdrQkNkL1ltVklFL2c1RWpEenhO?=
 =?utf-8?B?N1Y3aDdCcGpHTzRPdmdBQmZjVzJZb2hsVmtMTWM3eGY5RUJiOTN5KzFiTi9k?=
 =?utf-8?B?aWtsV1hMZW03a1MxRkkzQmUxVlRqdi9aZnp4TXlLUSt5dEcreUxkNFJVRDUw?=
 =?utf-8?B?UmlWM240N3VKYmJwd25JZzkrcmxueHNzSEE2cEc0aXI5MWZLMVFEZXVoZVgv?=
 =?utf-8?B?cVQ0UHJyd3RNY0tBZXdqSjVtM0tLVmdDdmUyb2hVZ0RNNzRWMDNPYmIwREhG?=
 =?utf-8?B?Uk9BbSszd1pYWFdPN0ZQMTY1RUtFQU5RbFFBeFJDNm93elVnY2ZLbjNEVml0?=
 =?utf-8?B?Y2RhelQ3TDRpSTJpWHdLdkNTTFFaOFcwcWhvcndNZmszeW55eWYwT21raEhF?=
 =?utf-8?B?cXdpSGYyaHY4SHBQWFk3dFc5Z2NwVFQwOW5wYUZiZ2c1dGZiOEVaYmx4Rk1h?=
 =?utf-8?B?SlhJUkc5MDZ6b25jb2loYmlsQisrYnViOFdBdk83YjVDdUp4bUhVSFdraDlU?=
 =?utf-8?B?OGtoa0V6OU1hU25wMFZXaUtUekttWWl5U3ZaOFozOGRCTnNIOTA5QXMycUFj?=
 =?utf-8?B?cW9zeDYrNndER3RQenp5eFdPeU8wOFV1Sk90dFdoTk04MjVobW50anlDRGFC?=
 =?utf-8?B?K1o4MkFmd1BqVGU1enRPRjJZaHRqZ0plSkp2Y01XcXF0YzFzQlhXMi9KZ29Q?=
 =?utf-8?B?MnhGMlRxcXpGT09iaHRyekxKa1RYb0JEL1MwYVBnRDc2WlV5dW55TzdMQ0di?=
 =?utf-8?Q?2lJH2KNRFGptO?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RlpnTW9vS3N5MjRaNWZpbytQN1RXSDdKbEFpbk1IZXlWMm9LWWxMcHQ1MWh3?=
 =?utf-8?B?SUZUNTEyd1ZIdHg4SEpqOHk3RXE1YTVndkc0Mm9iQXlDaG5YVHhDVkdCK2Z4?=
 =?utf-8?B?VTVJYzB0NlpDcGxaL1h3YU9rNzZ3eEYrOWk1WkRBZWJibVVqT0xObmU3LzZ3?=
 =?utf-8?B?Tk53elVtWFd6Y0tWamU1dXVKemhCdTR1YlJlRmhaZy8rZWNiYklHNlJwNFk2?=
 =?utf-8?B?MnkvV1ZIODdIaFlZR2l6MVY0RHRoQkZ2cVdOcmtldVhFdWhleFN6TVRZS0NO?=
 =?utf-8?B?b1BzdkZkVlBabURpNXk5Uk1tWWFOQWJpaUJJdVlvSUVuNTdUMHNFOTNWdUJT?=
 =?utf-8?B?MlRITExLcStGMWZlUGNMa1Z1Z1loY0ZNZ0NHRFB1Q3VhZmtHakRwaHArcThq?=
 =?utf-8?B?TXdwaU40TE9wc2dyc21QYmplL1R1Mjk4Zm1PclY1aHhGYWxVOHU0cTJJaGRi?=
 =?utf-8?B?V016U2t2VW8zR3IrTThocGF4MC8xbUllcFlSSmNjNmpWRzVYTjY5WHFqNnha?=
 =?utf-8?B?ak1vbWtNbTF6NDBzRjdDbTB6YnVaK21oemdKay9MaGsyTG9NRFJmWGwzaTBr?=
 =?utf-8?B?SkFNbFQ1ODZEK2k2ejBiSGowNnFFK0VFTEI1OE8yNEpORTVBYmRIZUtreUFH?=
 =?utf-8?B?K1BxWGdnTkxJaWxvRWQzL1FGYXBZOWpqUUVkTUNsSERvWlQwZHZ1K2ZPNmlG?=
 =?utf-8?B?MWk2U1JkcHhHWkl0aHo5R0lhWk0yUU9qcE9EKzhMZXlwM1R5Wk1iVFdxTmFE?=
 =?utf-8?B?SkNWVzZNUVY0WTdxc1N2UkpPUENUWjV4YXVia2YvVTV2elFsMmVtZUJhY25u?=
 =?utf-8?B?dHMzeHdzQ1B6RGN0dGg0c2l4eTRlcTc2ZUl4UHN2UVE1dkNLSjdXNmlkM3lN?=
 =?utf-8?B?czA4NGtCYWFSWFlzMXQ5cGp1SlUxQWlLMUVWTjc3cVIrdjMvamtkTXdjNzRx?=
 =?utf-8?B?a1JNcFY3Uk8yQW4wNnZubkFQajJvUGZJT3lvNCtBbUFMc1pDeWQ5Mkw5bTZV?=
 =?utf-8?B?cGF6YzZldGJIRnYzNUR6Nzd6N3RRYmV0ZmtDS0tCbk5peWQ0ejJ5TFRIK0c2?=
 =?utf-8?B?bjhYS3h1RDFYeWhvUDVXeUJ6N3JSZFVOOEl6NmlocjJKSGg0WDBtQ2VaWVlv?=
 =?utf-8?B?aDhSNnN2b2s0YlJDNFlwRmRtUFEvNDBjc1RURTNONlovRHRwYlZpOW1CelVJ?=
 =?utf-8?B?cDRvdDJvOUVPeXBma3ZFMXRtcC9qNjdvZ2NXZldZV1BvYzdBU0FrS1hLeFd4?=
 =?utf-8?B?RG0rczJkakNGUWhJOTRtNTdpa3BNeUtwRisvdWRjRUF2NEdTRzl2TjZXMHJV?=
 =?utf-8?B?b0NCMFRZR21SMWF4cTdPTm9KazlaekNGbGwrenh6dzNNL3ZPM084NnRUeUlr?=
 =?utf-8?B?dUlDb2ppVmtoVER6ZkNWbkxqa0ZBU00zTTNaRVAyQ3VqV1dUV1c4bGR2cVpu?=
 =?utf-8?B?WlBpeXdIWjdYdVFDb3dEOWZkQW1iZW9nWHdENThBZU1hODYvRWNIeGtRT0NY?=
 =?utf-8?B?MFdvMFhxMk5TdTFWVjJYT2JkTXNvV3FESmVOZ1pWNndDZlg5MENwU0hXdFFI?=
 =?utf-8?B?WlVVT1NRSHU3K0lmTUFlRWhqYlhZdkh0NkI4cHNDZ2svQkpIKzlsaWwzeTlB?=
 =?utf-8?B?cWRjWlRzR0hJcGRnSWt3aFpwRG80b1J3R2g1NUpUMnR3YU1ESWwvdkV5QjNF?=
 =?utf-8?Q?PWt6VRiuUvfdMYt22MDC?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 51f44370-fbbe-4664-ebf0-08ddb3d28e39
X-MS-Exchange-CrossTenant-AuthSource: DS7PR19MB8883.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2025 10:25:07.3870
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR19MB7247

Hi,

I've reopened this series and changed status to New for patch 1, 4, and 5
as this series was marked as Superseded to continue the review. 
Jakub requested me to send 2 patches (2 and 3) separately to net-next
which have been merged (thanks!):

Here is the summary with links:
  - [RESEND,net-next,v5,1/2] dt-bindings: net: qca,ar803x: Add IPQ5018 Internal GE PHY support
    https://git.kernel.org/netdev/net-next/c/82eaf94d69fc
  - [RESEND,net-next,v5,2/2] net: phy: qcom: at803x: Add Qualcomm IPQ5018 Internal PHY support
    https://git.kernel.org/netdev/net-next/c/d46502279a11

Patch 1, 4, 5 of this series still need merging.

Thanks,
George 

On 6/10/25 12:37, George Moussalem via B4 Relay wrote:
> The IPQ5018 SoC contains an internal Gigabit Ethernet PHY with its
> output pins that provide an MDI interface to either an external switch
> in a PHY to PHY link architecture or directly to an attached RJ45
> connector.
> 
> The PHY supports 10BASE-T/100BASE-TX/1000BASE-T link modes in SGMII
> interface mode, CDT, auto-negotiation and 802.3az EEE.
> 
> The LDO controller found in the IPQ5018 SoC needs to be enabled to drive
> power to the CMN Ethernet Block (CMN BLK) which the GE PHY depends on.
> The LDO must be enabled in TCSR by writing to a specific register.
> 
> In a phy to phy architecture, DAC values need to be set to accommodate
> for the short cable length.
> 
> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
> ---
> Changes in v5:
> - Removed unused macro definition (IPQ5018_TCSR_ETH_LDO_READY)
> - Reverted sorting of header files for which a separate patch can be
>   submitted
> - Added a comment to explain why the FIFO buffer needs to be reset
> - Do not initialize local variable as caught by Russell
> - Updated macro definition names to more accurately describe the PHY
>   registers and their functions
> - Include SGMII as supported interface mode in driver commit message
> - Changed error handling of acquirement of PHY reset to use IR_ERR
>   instead of IS_ERR_OR_NULL
> - Link to v4: https://lore.kernel.org/r/20250609-ipq5018-ge-phy-v4-0-1d3a125282c3@outlook.com
> 
> Changes in v4:
> - Updated description of qcom,dac-preset-short-cable property in
>   accordance with Andrew's recommendation to indicate that if the
>   property is not set, no DAC values will be modified.
> - Added newlines between properties
> - Added PHY ID as compatible in DT bindings for conditional check to
>   evaluate correctly. Did a 'git grep' on all other PHY IDs defined in
>   the driver but none are explicitly referenced so I haven't added them
> - Link to v3: https://lore.kernel.org/r/20250602-ipq5018-ge-phy-v3-0-421337a031b2@outlook.com
> 
> Changes in v3:
> - Replace bitmask of GEPHY_MISC_ARES with GENMASK as suggested by Konrad
> - Removed references to RX and TX clocks as the driver need not
>   explicitly enable them. The GCC gatecontrols and routes the PHY's
>   output clocks, registered in the DT as fixed clocks, back to the PHY.
>   The bindings file has been updated accordingly.
> - Removed acquisition and enablement of RX and TX clocks from the driver
> - Link to v2: https://lore.kernel.org/r/20250528-ipq5018-ge-phy-v2-0-dd063674c71c@outlook.com
> 
> Changes in v2:
> - Moved values for MDAC and EDAC into the driver and converted DT
>   property qca,dac to a new boolean: qcom,dac-preset-short-cable as per
>   discussion.
> - Added compatible string along with a condition with a description of
>   properties including clocks, resets, and qcom,dac-preset-short-cable
>   in the bindings to address bindings issues reported by Rob and to
>   bypass restrictions on nr of clocks and resets in ethernet-phy.yaml
> - Added example to bindings file
> - Renamed all instances of IPQ5018_PHY_MMD3* macros to IPQ5018_PHY_PCS*
> - Removed qca,eth-ldo-ready property and moved the TCSR register to the
>   mdio bus the phy is on as there's already support for setting this reg
>   property in the mdio-ipq4019 driver as per commit:
>   23a890d493e3ec1e957bc925fabb120962ae90a7
> - Explicitly probe on PHY ID as otherwise the PHY wouldn't come up and
>   initialize as found during further testing when the kernel is flashed
>   to NAND
> - Link to v1: https://lore.kernel.org/r/20250525-ipq5018-ge-phy-v1-0-ddab8854e253@outlook.com
> 
> ---
> George Moussalem (5):
>       clk: qcom: gcc-ipq5018: fix GE PHY reset
>       dt-bindings: net: qca,ar803x: Add IPQ5018 Internal GE PHY support
>       net: phy: qcom: at803x: Add Qualcomm IPQ5018 Internal PHY support
>       arm64: dts: qcom: ipq5018: Add MDIO buses
>       arm64: dts: qcom: ipq5018: Add GE PHY to internal mdio bus
> 
>  .../devicetree/bindings/net/qca,ar803x.yaml        |  43 ++++++
>  arch/arm64/boot/dts/qcom/ipq5018.dtsi              |  48 +++++-
>  drivers/clk/qcom/gcc-ipq5018.c                     |   2 +-
>  drivers/net/phy/qcom/Kconfig                       |   2 +-
>  drivers/net/phy/qcom/at803x.c                      | 167 +++++++++++++++++++++
>  5 files changed, 258 insertions(+), 4 deletions(-)
> ---
> base-commit: ebfff09f63e3efb6b75b0328b3536d3ce0e26565
> change-id: 20250430-ipq5018-ge-phy-db654afa4ced
> 
> Best regards,


