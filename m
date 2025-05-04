Return-Path: <linux-arm-msm+bounces-56678-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 14F87AA8478
	for <lists+linux-arm-msm@lfdr.de>; Sun,  4 May 2025 09:10:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 71CFC1753CA
	for <lists+linux-arm-msm@lfdr.de>; Sun,  4 May 2025 07:10:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E02501494D9;
	Sun,  4 May 2025 07:10:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="ODRUePzl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10olkn2011.outbound.protection.outlook.com [40.92.42.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A5E828F4;
	Sun,  4 May 2025 07:10:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.92.42.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746342627; cv=fail; b=H7l7zPEuDz2GFnbyOd5k/eV+zzIr0jDRhfNW2iWF64LYvV5tDulUpN4pXE/vwIG20SKKKL0STxjk+fZcWP9UMM1lMhQR6IgyhwarjjLKBEufr/s1ADL1p1OGfE3ierHvL6yXV5ZhcyLWqMY+rtf39nYQmYhNV8A7+P90m9QZBc0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746342627; c=relaxed/simple;
	bh=nha/vNVE5Gf3qIM6tfBkQrFXOgI73aIB16+WFS6d4NA=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=W/REOK0npr8YjQKYocjhmfj8/39LsZdOm6Jqi3O16b+1n9uqizYuBeiqVDlIGs3tQu6aLe1AOXQrkBAS5Yd/h5SeW1vCRXIdht8w9sj5m5l3yiUl3lM/hsXYolNDs24rt/3rS5yQj/d/lYl3ZZYEIA+lpnKiL+aLrlG0kYWPxy8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=ODRUePzl; arc=fail smtp.client-ip=40.92.42.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R5exNxcpaFVkCTXJ6uhAAZtLfluYoTLPQtU9+aMtYCPoduss8wbDUsGQc/LG2zaHYQV5ql+abtwwSQxTWXSoFsErRiN3JsbbjiN/+wxO6IIzq3ndbueEesURQs0MJeAaLguil+QTirXegoHd63hejcZ9Z56X4AUgzsE6/tfCWYvy9k0C0HQb8TblYjiZe7bKDQqJZKlpzlibcDdbQmmN0U4uP2EgndX9JTxLnUHYmO4iYldrqjDll+n2wd7bXQMQdWoXiXZ/uZjwHmA3W+f4e3Qu+Et70gFBXrARC+LFVSOhvpD79/gh3j3hSwLeIuPH2xGnys20d0BNV1QQWCkmLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i3BiqKV9zNOxI224OSvXxguzC2L/T+dwp9wEW6MszpU=;
 b=g7UKoPfTZoku05S56hDPEgSFnsB37ybPWcQ85j6/sJMiqSdfj/wESPP8yRiYYDcf3156uSDDmSbL1yYLzXUmjQcqMS7U/0B26i3SwGga/o6ZwStkP1Smuddgb/Pb88OVb6JBoJ6UIAVmHn3RLgU6C/SxuJlSibMkZ6PxqgHKtKGGsu0IRwn/wCiTCh+yRp9QjN5Ihq0Pe9P1IdLRic93TblPeHJDcDGeDWUrjftZQqIzIkpf1Un+IP1P6FtCIYtWi2reL17c/4iP8jbWP1XU4jsLoiddBilos2zOmw1FVrc1oiXBqrC7RXOdcbY3Zn2uM7RhLPAQjvq7Tvgs8Lz0Hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i3BiqKV9zNOxI224OSvXxguzC2L/T+dwp9wEW6MszpU=;
 b=ODRUePzlbgoIYFHwu8Z7z/DwcToVEq5OW5cXrXUew1AI9VhRWD1Gh6QQx+fqnMWFN//Od11muJOmcnibf0szqubM2XIpUVHdS96MMpcrY/msBsscCU0cj17KMAHZ2/0yNBhWWIU6SjoNmDwOY9F1p5x6bahQRg4QsHZTi6+Wcv8jnT3WryJ/iKKe+he/pCU0PE3A4SYdkwIuimrsKscqd3sr8duiXbeeuWQFCKaDsu+F3oqhJcjkVZqyoC+ONlSSEA0EjxLYghUmKkrWlwivy0iefkTfxoeIrGKCIjta08I4I5T5U7Fo+6aP3PwQHZ8WRrXwe+s1/QYraWJGD5fTxA==
Received: from DS7PR19MB8883.namprd19.prod.outlook.com (2603:10b6:8:253::16)
 by BLAPR19MB4609.namprd19.prod.outlook.com (2603:10b6:208:293::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.20; Sun, 4 May
 2025 07:10:23 +0000
Received: from DS7PR19MB8883.namprd19.prod.outlook.com
 ([fe80::e0c2:5b31:534:4305]) by DS7PR19MB8883.namprd19.prod.outlook.com
 ([fe80::e0c2:5b31:534:4305%4]) with mapi id 15.20.8699.026; Sun, 4 May 2025
 07:10:23 +0000
Message-ID:
 <DS7PR19MB8883C03A77432322A7CC6C629D8F2@DS7PR19MB8883.namprd19.prod.outlook.com>
Date: Sun, 4 May 2025 11:10:11 +0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/6] arm64: dts: ipq5018: Add CMN PLL node
To: Jie Luo <quic_luoj@quicinc.com>, Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250502-ipq5018-cmn-pll-v1-0-27902c1c4071@outlook.com>
 <20250502-ipq5018-cmn-pll-v1-5-27902c1c4071@outlook.com>
 <e88528d7-2fc6-4b4d-a0bf-677834c7b582@quicinc.com>
Content-Language: en-US
From: George Moussalem <george.moussalem@outlook.com>
In-Reply-To: <e88528d7-2fc6-4b4d-a0bf-677834c7b582@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DX2P273CA0018.AREP273.PROD.OUTLOOK.COM
 (2603:1086:300:8::30) To DS7PR19MB8883.namprd19.prod.outlook.com
 (2603:10b6:8:253::16)
X-Microsoft-Original-Message-ID:
 <070e2d96-3a38-42ac-8385-56b0596271d3@outlook.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR19MB8883:EE_|BLAPR19MB4609:EE_
X-MS-Office365-Filtering-Correlation-Id: 5165d309-0858-4a7a-1d3d-08dd8adabcb3
X-MS-Exchange-SLBlob-MailProps:
	Vs63Iqe4sQlVobdhjoRt/HQUSkoYJhJhfGFVxzF97wLbl/SG0+DmmJeqeaWce9DInx0xs428pLfJiYBwMNZzmI7AfiFLPc400EoYCMeLuDi04+nvFG9kK4jsj9gG2VfxKCmVZIiGJO7UKmJPv+Gtq3QWD9ORyo9JurmHUh0vMEGhsPXhm18k58TYNEaHMl2+T48dlOhMXTCOgOdmFSZL9BH0no2hp4kXAGrHF+t9NiQ2OfA2YujqaHR5N3myRbtXTSgdcfJ9tC5/n7iEBNeBHjEYwsme8Qes0mhTRsvsjlJTQxwBBTv/ZLPc/C+74JVe7RLnXADzqdsltrftHbJAbLhZn97ZVgrf8EJN0z7+YkpLDnyzzpxsmACUvoMKnMvU35VKIc8J8nZa4yO2VSOQvJIA88URqLXdt3wRGt+PaTZUrjhF/XJWKFAGLbCnAtIC1/N4o9HPb8pBmJWBUQxktX41NS+6GoSsat5i0D/+ZaKIX2Cj6RUzSnt28E7ji/W80+g82GAnjiXuDN7QCAUvevx9flNMWHC+yPLz6VaNhoezHmYKMCTm0ywgqYRYpI04aV2r9NvAeOM7N/P3Kxun1XRJ85Tv9ovDlYJCHjf7JiqFSeWf49tvAVcmmEtFxhIISjcWNSwNDSHmhZVwiulQw4GpGUmLHVfU2ltlOTKYUN7bb/6RQI8Za6mWTjZrCHSk3AOv4wzlXw+BNlNh5cEk5wYeEVtny/CmBTmKLeczE1I=
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|19110799003|8060799006|5072599009|6090799003|461199028|7092599003|15080799006|3412199025|440099028;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?alZOSkFENEtQb1RTWml3OGNrTlJPdldTU2ZoZXpMVWZRTURBUnZaUFc5c0FZ?=
 =?utf-8?B?aFhtdDE1SDh5dEwxT0JWM2hDQ0UrMEpzbVpKa1RSdzBDeXMyakxKUFBUR2Rl?=
 =?utf-8?B?M01ISjdLZk1NUTVoUzZPblFQQmoyYTBMVk5zUXd2VzJDNjRDMFdYVHN0REhi?=
 =?utf-8?B?WG9UTW81d01VM1EwUjN0dE9nYmlKeXVVK2dodG5JUjdTVzJPRmQ1QXBmekc5?=
 =?utf-8?B?cXZtMUhyM29BYkNQUjlmVFd6ckQxUXRscFZIZmw2d2NwazFqZHNCYXVZZnZG?=
 =?utf-8?B?OFNiT3dKeGloWG1jd095U2Eya0lwMmRCazArUW1sSlJmb0NrRXdxZzJtWkh4?=
 =?utf-8?B?NUh5dXNscFVzYWNGWi80NjNNMks3cnowMUtiWUJkZExLU3EvZ2RUZ01uK3Q5?=
 =?utf-8?B?YUsxdUtkV1YvWUY5UlcxRFdrTjNwNlR6WU9JYUhnTGNtN2JkQ25iNW1Ca1Jo?=
 =?utf-8?B?Zi9pVlVMSENQdkUrV1dXaVo5R3daR0JBOVZUT213QjZIaEpPM1VMKzZzTzVk?=
 =?utf-8?B?UDFwTUs5UnRqcWxOUnU0YVJjblNFU1VGRlJ3ZXhpSzUzMHdxaWdlaU1IMk1L?=
 =?utf-8?B?THRSNHVaa2ZkUmJseDBMcDlTNXFWWUdGM0hwdmM4TE41RGlxcStHNkp0LzNu?=
 =?utf-8?B?d0NtQ0gxMklyVVlvSG5weGs3ckN6VGFpaDRuNTRNTDdVM2hwQzRTSzMzYitG?=
 =?utf-8?B?LytQN1ZJMWJPUG05dGhSTHFibGlYWWJTVHhOUitRSTRxUFY3SWRMVVpvK2dV?=
 =?utf-8?B?R3BJWVdpcktvQnNnWkl0c2s4NzQ5cGVTNGdNMUNVRnV4dWNHRHNtUk12SVpU?=
 =?utf-8?B?NTZna0hJL3JvWTVzQ3ArVkNiT2JzZXNWYnhpU05DNEMweDBvRWhiZzVaR093?=
 =?utf-8?B?aEZzQjUyWkF5MDVwRVRqRXRRMzYrbnUzZUVwYTdQSjFqTkIwZkRTVllTMUFm?=
 =?utf-8?B?bVMrL3VPcDRCOFJzUE11NFUrNm1mdzlDWEl3eXFhaXptQmhpTGtHSldISkt2?=
 =?utf-8?B?MWRzVUlQamJsbm9zUGQ3SSt5REVJZnQwMFNrb2tIbldRV2pPRCtWTmlwSVZa?=
 =?utf-8?B?dWU4NjNKazNNT0xTb0NqTldmc2J6MGlxL09Ca2hGb21LVWtnTUNhYVNRVkJE?=
 =?utf-8?B?UlZsVDZydW9OTVBNUlBHYnQ1M2s2UDZEVDdLKy9odis4VTIyWHN5VlQvN0Nu?=
 =?utf-8?B?VWdmZHllcTc3cFJqQ2VsSkl1Rm9OMllkRi94aGVXS0ZkQURnTS93c1BKWThN?=
 =?utf-8?B?cGNTMS81SUY4dGR4YXBzRlVkQTllK2hZTE02U2hrdUQreXR6WVVhbXJhN0h3?=
 =?utf-8?B?cGUrNnhoYjVZMS9nYzdXMWxCREdKNHVnbXJheDhoMTRlWnpETCs1N092QzZi?=
 =?utf-8?B?WWJld1FBNllnQ2ZDd1ZSNXRaaVVKQzUremkwei93VEtzVlQrOWp0dHUzZDNQ?=
 =?utf-8?B?K1hGQ2hvcXJxK2loMnUvdVd3ZlJaVlA0TkltOTVFZjZUOGI3a1ZIdG52S3Q0?=
 =?utf-8?B?YUl3NWRVMHJqaVRhcW5UYkZkNzVod2FLNXFEdmphZk9HcTNpMnFFeUNuNnMx?=
 =?utf-8?B?VHZqQT09?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?c0JhU1p1OFJYRWVCcmtBT1ZPSHBxd0VVcXhRUFp4NnM2cGxDTGx4MzJNWTJw?=
 =?utf-8?B?SGljeW9PbEl1QXNEeWlPWTFiRDBTalRKL2EvTkdKRkRTeEJIeTlnMHhnWDdR?=
 =?utf-8?B?SktSd3dNMVRTM1Z3ay9NaUZYcUFUWUVCek96VEdrT2psdlJZRjRJeGhPb0FR?=
 =?utf-8?B?VEU4RTQzVjZPU0ZnZEU0Ny9GYm53cGRSZVIzUlN6M3ZRUlRaK2dNdk5nZFJZ?=
 =?utf-8?B?OFNBYzBVd1RKTERMcFZMNVJvK2wyT1dGRlcxSzZsbVg5Sy9ydWNodEJldndM?=
 =?utf-8?B?bDcrTWhlOStmSWNhU1doZjhNMEtzSUpILzNraXF4STMwSkJ0RHhWcUVIdTdw?=
 =?utf-8?B?V2hiekZPaDVBQm5JSCs1U05jS05iQzNYVkx0elZYR083NlU4LzQrZkh5UGV3?=
 =?utf-8?B?ZmVhNnFsMkZORUplYnRhTUFBcFYxTWkwcWNxeHJNQ0x3aDluVDhzRnM2MlpN?=
 =?utf-8?B?cG5YVkdBc2oxTENWUlFidm1pN3JjSnk5QVhOZVRGWWZQUlBDWGg4ZjJqUS9P?=
 =?utf-8?B?ZGJqRUVqaVgvYUk2Rllmcm5PR2VZdGNkVlI5TlZnQ3YwRmRiODBTZndGUWpS?=
 =?utf-8?B?WGZGa3NqVDJ5V2NmWnVFd2QzM1hSbHorWFBidnpzVjZsMGR0amZRN0VPT2hh?=
 =?utf-8?B?Nk96ZTh0QjZ4WUEwSlU0VStnWlYyNlhOdzlhRExJUmZ0ZER2TlpDMkFtVGZ1?=
 =?utf-8?B?a1FwYXFhc0FDd0JHaVdlTWcwUkYrMTlKT21jQTVrVlQ2cy9RRUVPTVJMeS8w?=
 =?utf-8?B?Qm1iSllwcGgyZm50VFFHNk4yN2NoOHFCcm9zeDJhbnR0MWkvMk5wRURFcFIx?=
 =?utf-8?B?aE1Hczd6N3h1eUg0QXVhU2tzZDJRNENDNzJ1YWxlTVJYODd5ODJxeEk3NDZR?=
 =?utf-8?B?OVZQb0N5NXd6aVpjVjA1MkpuMG5TdjlHeStqWGxVRHVSOGo1RCswMFNTZWlK?=
 =?utf-8?B?TUN6SWdrdnlXaFRVUTJhdlFHUHZFeHpDV3N2Z1k3ZGxCUjFSK3podG1zZXk4?=
 =?utf-8?B?V1Z2N3ZxSVI2L2Vpa3RRNTVyNXVCY2hQY0ZIMFdNeFZ4dGtCN0hLZHY5UlpC?=
 =?utf-8?B?bkxKQXB4ZzJXbjRjcWJpK3ZHcklUSmtDT0IrYTIwZ3JVRnRCYWthNnBxa1lS?=
 =?utf-8?B?VFBiYzA3WW1zUkRyeVJzL0x6d3d0bXJNNHkxTXNTSWdYUWp0aEVBNHRwK0NU?=
 =?utf-8?B?K20zM2N3OTJNd0orTWtWRzFPcnpKSkNlWVRiMGtkMjNDSjB0NVpWTVJzVS9P?=
 =?utf-8?B?WWI0V1ZSVzdPb2MzWjhMVUMrY1FjaEtqQnFCTlZnelBQZzJWR3dIaWh5RlFs?=
 =?utf-8?B?ZG5wb1VlbjhtbUtIWXNIT2x6NGFyemgyZ2s4OStQdG9wcEZrQ2owemV2S1Uz?=
 =?utf-8?B?NXpMa0lPQkg1ZklmOXEyWEdZbDUvTmlVK0p2Zk9kRnd5Ym5nWmVnOUJhVCs2?=
 =?utf-8?B?aTB6bENwZzZ6WEJnbndTS2ZUZmptSUVwdzBlVm9OR2VaaXBaN0hRY2tBbUhz?=
 =?utf-8?B?VldWTTZ4azBSM09zR2RlNUZXWXNwcTlOVUNvUmlDbkJScXVKcjNiajFSbkdx?=
 =?utf-8?B?N1U5TEt5UVdpZzVNMzBIajZNYkFZLzBqaVJhWVRwUUxkbEFjVzdLMlJGaXp2?=
 =?utf-8?B?UzNmdlNQalg0VC9WUnd0TlQvbmRxMVNaS3Z1a244MUhtaG4zbGFISGVOTnpr?=
 =?utf-8?Q?3cPL5fiNQFYC8/vdzGrS?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5165d309-0858-4a7a-1d3d-08dd8adabcb3
X-MS-Exchange-CrossTenant-AuthSource: DS7PR19MB8883.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2025 07:10:23.5703
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR19MB4609



On 5/4/25 05:53, Jie Luo wrote:
> 
> 
> On 5/2/2025 6:15 PM, George Moussalem via B4 Relay wrote:
>> From: George Moussalem<george.moussalem@outlook.com>
>>
>> Add CMN PLL node for enabling output clocks to the networking
>> hardware blocks on IPQ5018 devices.
>>
>> The reference clock of CMN PLL is routed from XO to the CMN PLL
>> through the internal WiFi block.
>> .XO (96 MHZ)-->WiFi (multiplier/divider)--> 48 MHZ to CMN PLL.
> 
> The clock tree: .XO (48 MHZ)-->WiFi (multiplier/divider)--> 96 MHZ
> to CMN PLL.

Noted, thanks!

> 


