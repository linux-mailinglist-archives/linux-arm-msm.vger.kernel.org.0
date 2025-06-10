Return-Path: <linux-arm-msm+bounces-60715-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 54729AD2EBA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Jun 2025 09:32:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0762E171657
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Jun 2025 07:32:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C76C27A93A;
	Tue, 10 Jun 2025 07:32:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="oCXRy/U8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11olkn2063.outbound.protection.outlook.com [40.92.18.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56FA221D5AF;
	Tue, 10 Jun 2025 07:32:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.92.18.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749540724; cv=fail; b=TfXuJ6oFY/6SRZdlwA7DY6tXExtFs+PVa/bJnJ+nYbwl7vg/FPtEOQSGWK2PlNrQvIYBaaokb0Gxw+tF/GlFJ/iKgEK0RHhPYp4uewGog/caq5ZDzLf+7L/8CsQGoLsaTBxFoHtgbzLni+IWdZMjoxxsWzP6TVxbnuL/NnGGotI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749540724; c=relaxed/simple;
	bh=I/aWZjGKmDxsV+Q1xc9BLNp5+RsmeFc60PfOgUA1Jd4=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ANvYgG0nh4M+K9Uy33mTKpO2aji03LI0WsmmUDgczEMii2BWXmdEqPbC5Aybv1H1xri/Cgz0gpSXhEUUMg2WJj5xhTqOce9R7yxEnVZCCFgWnW3DFPbxJe+IrVRPbJtnKWYw8x6rE2SOMqFzgn9UDcsG1Bq9NhSxm3AINaiCfrY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=oCXRy/U8; arc=fail smtp.client-ip=40.92.18.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NRm+6/EirXsBp4mFhcEKh0isBNnXRrdfIiGfJzL13a40Zm9P+3mGzweTOGG5fBaM5yBh1eGX4zCS5Ift4zhNVYqZeswr6M2907Hy/OOdPNYh2m+7bJWe/fipowWzFl6rTSSHjyKVidPGH2vP+4OC5FdWLZfb2p196FP/k6JTc6UrIZn9JDWUT/ORDeg6I0Z13em/0wXRGjhKJ3voVlnkJI5mrPglEpX8nws8nJuPz8Y2vrWh8s9sW8duivJKR2H82QKZPKXWh7c016FfFcnzcBv0/XgJyjytRMaA/pea7Mgh1WyLWzNlf/fS104ehwKIwRcrJNifc3XfEvw/gqJAYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rPUsiljrq85Qr+SKbgWwMr1HCsPdKPzRmtnf/tpoUoU=;
 b=gQELTSgv/wvh8xSZ5EKcemTlrh3afsG7GS97gtWTnqh3fvzNBGKJdiL0/G0fAMwTfBNggly52qngyVLZDFmN9tleHnoatc3PXdrBArSsuUY4K7IQbY74+NGjgbJ9Ci11VD4owMpnsPIiTO+n3/xNgwSqABTb50f9IIMUlPj2WWS1IF5zmixgLEvMKj1+NMVwf6l4N9wQ1MT018zJNPRIfn9oJzxA8KAGIfsPt8vY+D8oI/bq3BZi9cgG/Yvu2f0Neh8DvX2CMidlaQYx8jV8ybU0sHxcZppee5AXa8hh9L07GwjfQLw4/tWeK3UIg8cSKn9N7gf7rTaTTXVL0JOJDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rPUsiljrq85Qr+SKbgWwMr1HCsPdKPzRmtnf/tpoUoU=;
 b=oCXRy/U89vYx1wU6d2J2oNbMNA8E6Nm4XL47S358P1YUk+dlshcl9optPnFLcIJ+oqkQpji5JT/HlaQo1HhgCQ8ucao/OiSw9c1AV+DhnQ548FyBgSyvmzhk9REFzGUrh4r7m7a7p5/YFwzyPrnhnLIUNlFjEcDMw6Q9vAh89G9IpD3ShCAIat/b9edKyUwSbE1r9hnj/JheThK3P5dZxtyXYDFot0UD07X7a2tgUrgXLDn79FkCN20MYEdV1CbpKomBezmEPXh4UW6pHBG20JPrcgocQuSAlwwjwKCdJqU54w7ROhieqyhZNjd3MfL2mgno+tN1R2HbaTpQVOfUpA==
Received: from DS7PR19MB8883.namprd19.prod.outlook.com (2603:10b6:8:253::16)
 by MW6PR19MB8136.namprd19.prod.outlook.com (2603:10b6:303:247::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.14; Tue, 10 Jun
 2025 07:31:59 +0000
Received: from DS7PR19MB8883.namprd19.prod.outlook.com
 ([fe80::e0c2:5b31:534:4305]) by DS7PR19MB8883.namprd19.prod.outlook.com
 ([fe80::e0c2:5b31:534:4305%6]) with mapi id 15.20.8835.012; Tue, 10 Jun 2025
 07:31:58 +0000
Message-ID:
 <BL4PR19MB8902726DC9C0E8C8FE8155F79D6AA@BL4PR19MB8902.namprd19.prod.outlook.com>
Date: Tue, 10 Jun 2025 11:31:46 +0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/5] net: phy: qcom: at803x: Add Qualcomm IPQ5018
 Internal PHY support
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Florian Fainelli <f.fainelli@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-clk@vger.kernel.org
References: <20250609-ipq5018-ge-phy-v4-0-1d3a125282c3@outlook.com>
 <20250609-ipq5018-ge-phy-v4-3-1d3a125282c3@outlook.com>
 <aEbqQYDi8_LN7lDj@shell.armlinux.org.uk>
Content-Language: en-US
From: George Moussalem <george.moussalem@outlook.com>
In-Reply-To: <aEbqQYDi8_LN7lDj@shell.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DX1P273CA0033.AREP273.PROD.OUTLOOK.COM
 (2603:1086:300:20::20) To BL4PR19MB8902.namprd19.prod.outlook.com
 (2603:10b6:208:5aa::11)
X-Microsoft-Original-Message-ID:
 <bd436df5-e540-456e-a40e-c2159b327fb4@outlook.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR19MB8883:EE_|MW6PR19MB8136:EE_
X-MS-Office365-Filtering-Correlation-Id: 906b1b83-0cea-46d1-c672-08dda7f0e09d
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|7092599006|8060799009|41001999006|19110799006|6090799003|461199028|5072599009|15080799009|12121999007|440099028|3412199025|12091999003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?L0FySkZ4VVFBSU1ESG9UdFp1WFRRUFZkQjFvc3Rxc09aM1FpM09YS1MzODMz?=
 =?utf-8?B?TjVpUEZuZDEyaUFYRDVQQVRhRDhWSktUdFdvenptNnNlL0wyTWVPWVZaTnJ5?=
 =?utf-8?B?amVDa1RidGdNYUFtWjZSUkRuV3dSZlg0VTNtb1hPL0U1ckJXZ3llZndHWlBY?=
 =?utf-8?B?Yng5MW1aMllRSzNoQ3VEVnd0WHBwL2VOaDRkR1hkSWVhMGtabUlaWU1wSnpX?=
 =?utf-8?B?MzB2SE9jZEVVRHlCd3ByUVU4L21yYXh4VWlnTjMxcngveGRGK1lRamgwUTJV?=
 =?utf-8?B?K2VjY2dkWklqWFVjZzZEM290TXZwV3VMbVQvMnN0Y1NTT3FQTGdvRXBvcS94?=
 =?utf-8?B?VFUzKzN6YVVtaEhCaTk2UkVzak9HMWFtK0l3TTNneDB5YlovTDhCQ1pNRngw?=
 =?utf-8?B?cEZWSjRUOTIybTZxcHpnM3ZzandlSTI3TG9xdWV5ckNlenVrVG51SzljaFpy?=
 =?utf-8?B?MVF2V2hkcUxmaGpSMmZLQkdSNll0WHhnUXFGNEllOXlVeDhWaEtCWTlPT3NQ?=
 =?utf-8?B?UjJOUWE3bHRMemM0Zk1ua3FpZVJFbkJpY3I5dTVKRzhsaHJBS21yRU5OWi9C?=
 =?utf-8?B?aWJzY1B4azRrZDdPVVh6Um9FSXF2Yi9nUkdDS1FIbEdhTnF4UmpsVUw1ZCtz?=
 =?utf-8?B?VHpoM3JZSW5MNEgzdm9DRnBWSC9BN0ZLc1I2QUJUdTBOV0taYk5aNHozQW1m?=
 =?utf-8?B?Tnc3RlRpWHZpSENJbEtudlc3N01RamV4alpMTmJVTHV1SjgybGJzSklOYlFP?=
 =?utf-8?B?bksyTFlpQ2pPcXppWEtlTDhLSU83NGNLT2htTXN6RGRreVprQk1XVDEwdG1E?=
 =?utf-8?B?QnRPRUVkekZ2elA5SzlCTjFSdkh5a25QV2xhdnRQdUFqWjk3TldMb2pIOXZa?=
 =?utf-8?B?SC9DTnZLdHRGTmU4Mmt2TmRXcWlIMkxnaHdFQ3ZUanZiS0dnZm11STVpQVdI?=
 =?utf-8?B?b3NXQ2haKzBaaDBNSng4bnhMY05nUVdYRHJ4U011VTQraHhJeXVyL052b0oy?=
 =?utf-8?B?VEk0S3hUY3NLN3dBaEk1ZlF3RE5telJhZGYva0FaK2p6VGw5ODFkM0hrdDhP?=
 =?utf-8?B?eDFwVnNGcGJWWWdRQmdpT0RqK3cxajFEUUVwMjlESHgxOVZhYlJ6b0dyYWFs?=
 =?utf-8?B?a1hSb0pUVlRUaDlrZUs5VEMvQlNlWXlGUDdrMmI3cjFtQTdjRTRsK3ptY3VJ?=
 =?utf-8?B?OEJwbmJSeElzQ2V2WHZFcFd4T1o3U1ZPQ1BJcXJpSlB2RHg4QnlnZS9ndjA5?=
 =?utf-8?B?NGwvQkFpQW5wcHNlVHdkS1FzdkZEN0EwSjlieEM3NGFKTklyYVYxTFhHazRz?=
 =?utf-8?B?MEMrQ1hGazdkdjUrT3NoQjZMRW8rcndRZkZzZW9JdUkvaFhSelNTeFBXNTdr?=
 =?utf-8?B?QmlQUG1ES3AxaE9EbzhPN0ZoWmxlUVRUaUN2U1dCb1pNT3dFZlJaSW82Y0Ir?=
 =?utf-8?B?TElBMjFIMGNvZ0pIK0ExQ3hPcEhGN0szajgzWVg4SndPSER6U3ZyQ2VnUjBR?=
 =?utf-8?B?b2NmV1JWVTlqL3lnb0d0ZEJ6L1B5VStYYWNYcmlxbVBnVDM2b0gyR20vWGM5?=
 =?utf-8?B?MVlVS1RLQndlNFpzZkhzWUFwRVRvTTRRd2cwR2c4MURPNGlrKzhIRGhZUzZY?=
 =?utf-8?Q?ZUzzqW583iS5kJsy3rBGiveXqs4PBaDRef4nIYNTPnHE=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WFhxeHlyb2JxY0ZkQ21NRmFpMFZpRDV6N29XNGtQU0U1ejZzbkVlRWhqYlNU?=
 =?utf-8?B?UFJRWDZjNFI3Tjh2QUV6bGc4TTQ4YU83b3NvWXlBYWE1cXFCTWVZQWtpeDVy?=
 =?utf-8?B?cFVrU1IzT1lYVGdwcUp6RnVnbEZYK0k4L2hSTXBnOUcyT1d6U1MvaDhzVTRR?=
 =?utf-8?B?bU93YnZXcEgyTzYzN2pxNWtBYXZaM1RjT0ZmTDRPSkp5VmZBejMvYjhpNVU0?=
 =?utf-8?B?UWJiekhKcUlxekt0QkpaKzg4Y2RCUDFrZnZsNlAxdC9oMndhNDRiVXpjRVNI?=
 =?utf-8?B?ZC92Uk1CWlZqdUx3cldsWndQTWdBdmJDOW9qODByb1BkeS9ueVBqYnpvbnN3?=
 =?utf-8?B?a1NNeUFTVEtnUzhxUDViR0RZa0xscWJZVGI5YTdkNGZFZSsvUkRxVXhLbGxU?=
 =?utf-8?B?Y1luak1tcGtKZTRVQmp6dHRob0FHbEJhZlBtZXBvQ09uRXFVa0JhdVBKclV0?=
 =?utf-8?B?UjFCYUxKRlJtWHdqYUlYQUg3M3RpNlpDbS9QdHl4eCt4eHVBNzlDaytEUjE2?=
 =?utf-8?B?Ui9ucmxRUERRSWpvVjltRVVQOEd5NUQyOUFFaDE3dmk2M0ZQYytvc3RreGd4?=
 =?utf-8?B?OHo5Q2hXeFJqSGtTVkQwa0s1ZU5wVDE5WjUyczd2eDI5QktnMkZyNzlRL2hL?=
 =?utf-8?B?bmNTbklBdytORHF6WmZmYTdGQnhxdFg5ZEg1T1k2K3Vva09zOEsyNk9VdXYx?=
 =?utf-8?B?TXRBTTRWbDJSemwvSVlzN1g0Tk5SVDlxVHkzTVlUUWhpYmdyMEZCdFpaTXlW?=
 =?utf-8?B?NXkvR1BSQ2V3KytKMHBqVW9xcmxick12VUdLeklOdTRLN0tTbzVmMzhiK3Bt?=
 =?utf-8?B?MXZiaUtwQnBEREF0Mll5bktHTXI2WVlieGFYQnBjQXY1RU8wdzlWZEhjRE4r?=
 =?utf-8?B?SEtjclc2Uy9IeERqV3VVVVJxTmQ4Q2NlVWhlTmd5T0hwY0RnTU80VUdhR2tB?=
 =?utf-8?B?WjdGWGRHMGJPYTdCaXJWcFpZQmRKR25sVUNGcnZsZTRnbVBlSHo4VHB1QjR4?=
 =?utf-8?B?bjB1Ti9pTUtHdk05Q3hPVW91TTc3eWZjSnl6L0JoOEhOVTNJUGJnaFlnUkIr?=
 =?utf-8?B?bzU1b2pQNmlZV1VISlI2WTRscW85QVl2OVRCZlk3elV6WmF1a0M4clV3aUM1?=
 =?utf-8?B?L2VrNDlmbFRUQXBqdXhTYTRrYVNjZnpQS3lGRk5VK1kxWDhWQmYxekZDRXl1?=
 =?utf-8?B?cFlJeHFUMzFkMWIvMkNIS3piQnVQbzhObnppaHI4cVZqWDQ5ZmlsMm5ueDI1?=
 =?utf-8?B?TS9ZUHpObU5hK2RYNm9aY1Zacm95YzcyWVRvOWFPLzl6SmYwMmtPSHFEYkdi?=
 =?utf-8?B?VWJmaEc3VnYrS2Y5L0FlQXB6MTdEdWdSak5UeG5CNTV1ZjZJdlp5VlE5SHow?=
 =?utf-8?B?NldRS3djcDVsVWc3b2s3M1FNTU1DK1BSaXovUllrdnY0WUFOTUNMemluYWdR?=
 =?utf-8?B?OXhvZk5BV2Rubnk1ckg4N3FNc0dtYkZITnYvUmt0Yzl6MmFoZmJTUUFzTlky?=
 =?utf-8?B?NkZ6WElhdW9KTWttTHpEblhKL0pRanFBekY3UVNJYllMVUIrN0IvM0JqTkJT?=
 =?utf-8?B?MTFzSVJpQXo4b1dqeHpCNWpZTWxQcGxVY1NXUzdEVjJ3MTRYZjVSaWdjT1E2?=
 =?utf-8?B?SU5wbzI4R3lKam9tL3pCT0t3U01yREREWkx5NXZGZGhHNHlaLzJyZldaZExQ?=
 =?utf-8?Q?6uvIsiO7u8sErjrlEl9c?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 906b1b83-0cea-46d1-c672-08dda7f0e09d
X-MS-Exchange-CrossTenant-AuthSource: BL4PR19MB8902.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2025 07:31:58.3577
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR19MB8136



On 6/9/25 18:05, Russell King (Oracle) wrote:
> On Mon, Jun 09, 2025 at 03:44:36PM +0400, George Moussalem via B4 Relay wrote:
>> +static int ipq5018_config_init(struct phy_device *phydev)
>> +{
>> +	struct ipq5018_priv *priv = phydev->priv;
>> +	u16 val = 0;
> 
> Useless initialisation. See the first statement below which immediately
> assigns a value to val. I've no idea why people think local variables
> need initialising in cases like this, but it seems to have become a
> common pattern. I can only guess that someone is teaching this IMHO bad
> practice.
> 

val is not initialized in v5.

>> +
>> +	/*
>> +	 * set LDO efuse: first temporarily store ANA_DAC_FILTER value from
>> +	 * debug register as it will be reset once the ANA_LDO_EFUSE register
>> +	 * is written to
>> +	 */
>> +	val = at803x_debug_reg_read(phydev, IPQ5018_PHY_DEBUG_ANA_DAC_FILTER);
>> +	at803x_debug_reg_mask(phydev, IPQ5018_PHY_DEBUG_ANA_LDO_EFUSE,
>> +			      IPQ5018_PHY_DEBUG_ANA_LDO_EFUSE_MASK,
>> +			      IPQ5018_PHY_DEBUG_ANA_LDO_EFUSE_DEFAULT);
>> +	at803x_debug_reg_write(phydev, IPQ5018_PHY_DEBUG_ANA_DAC_FILTER, val);
>> +
>> +	/* set 8023AZ CTRL values */
>> +	phy_write_mmd(phydev, MDIO_MMD_PCS, IPQ5018_PHY_PCS_AZ_CTRL1,
>> +		      IPQ5018_PHY_PCS_AZ_CTRL1_VAL);
>> +	phy_write_mmd(phydev, MDIO_MMD_PCS, IPQ5018_PHY_PCS_AZ_CTRL2,
>> +		      IPQ5018_PHY_PCS_AZ_CTRL2_VAL);
> 
> The comment doesn't help understand what's going on here, neither do the
> register definition names.

These are the EEE TX and RX timer values. Will update the macro 
definitions accordingly.

> 
> Also, what interface modes on the host side does this PHY actually
> support?

Based on the QCA-SSDK and the reference boards, the PHY supports SGMII 
mode. I can't speak with 100% certainty, but SGMII is the only mode used 
so I can't rule out whether GMII, MII, or other modes are supported. 
I'll add it to the commit message.

> 
>> +	priv->rst = devm_reset_control_array_get_exclusive(dev);
>> +	if (IS_ERR_OR_NULL(priv->rst))
>> +		return dev_err_probe(dev, PTR_ERR(priv->rst),
>> +				     "failed to acquire reset\n");
> 
> Why IS_ERR_OR_NULL() ? What error do you think will be returned by this
> if priv->rst is NULL? (Hint: PTR_ERR(NULL) is 0.)
> 

Changed to IS_ERR in v5.

Thanks,
George


