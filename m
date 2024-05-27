Return-Path: <linux-arm-msm+bounces-20532-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D42E8CF9DE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 May 2024 09:20:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3110F1C20D74
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 May 2024 07:20:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 234A317BD5;
	Mon, 27 May 2024 07:20:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="hYKU6sAM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2043.outbound.protection.outlook.com [40.107.94.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60FC817BA9;
	Mon, 27 May 2024 07:20:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716794429; cv=fail; b=JEWfelqGjpa7I3etxq9xzfNZacHKRcN8T+GnjT4+ZozaYBzaxqlLyXsdmcOt14tsceLANd6Un/aMoyKw/H8gC82O078wvlMQnkmRPXn7tmV4eY7uTc4J9OqVBWEq7WWr1D/DVv5mzOQ+xtPzNHAj5DvN+KD9ENJUl3AV3nVRM2A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716794429; c=relaxed/simple;
	bh=vYT33pzPu/2fGRjbQDeJEqj93yK2lCn6SjSdBhDJ+Xo=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=k/qIH3MwBiQoo/HdW1SByv8LaYFQNYWaE5Jculp5CyDKYZJGUTKTsomijil9Ox5AZUz6rsIiGGMkX6RvbXArq+PPasM+ASOzatZKmeF/y7xMh5ZSyQmWWE0QPJu7G8u18BF70vwJSGGA63DKMlli/HGt0ma3BIndSSyQYpz0ryo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=hYKU6sAM; arc=fail smtp.client-ip=40.107.94.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CXH9K+8A+rkcLlmXmUwABq4z24dez8jBBoS0LGAHYWaTe8x8uGuifkZ+n3i214bvUX1zbZLzfUOt9pVZiHize7bNjoVY0Ssg8mej8bVutCwjxh5TGP5VtfPYIUyVQiAa+ZR882quf37qo/ydYO/daloXbARubARsBLvPae5O06lniaZRnLE3qSeW+OhTalyrwRroZMCQbVKDXlf4cEZWMvhVJDFahZriV0zbjWKRa8YxPTwSv7SnwHrLTP1rsjkByfYC3SuCADVQz6j6OU0ojKn7d5Cr95Lb/PCkkbzxZIvaiXSMdQH9IrtewkC9fLbHjUlNfBXS1ixTcJM4pZX2lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NdVB0wPmsg/46e1f0geVOd4ny0kVfpTYMkvdpxKVWzo=;
 b=PbfulkRf5ROpay1km6FPulCfkYx9DhHGONH6m2q3NvEi/hi+p1WhLGP9sybGEmzA+ST4OI+vXgOakIf1rjkwjpmTNohRp6uLw3nZSeNcJWZvKe9SaQq5vWXow+23I+ysQ+MJ56j5ZoQ0zqscyOYM2+95Bi6ZGyP3BF7CqieqrqsMRWkPNYgcjOdYhWSk8ZVpc6Wvex4VAQyhFrCLrAtna4xVKSL1wC48AhXJwR8aPrGmexqvYruH9cMyfG7XQAx7Q/G81ekmFt4r2j6fcX4ilG+ARa8CRy40wKwD5HQSDHQPfql+E8Riqt0AGDWNeQgHq6lz4k6zENXTyPRUrLpdVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NdVB0wPmsg/46e1f0geVOd4ny0kVfpTYMkvdpxKVWzo=;
 b=hYKU6sAMGNtjWW6bCZ1VgcMK7Vv7vbatUeabN6H/xI4Go6BS36ghgpCIISN5ZTTab6WoWG4Kgf31c5hjRJBCrt63DFFpiUpBeCId8IxbDeuQba792t/mE5/1m/ICt/MNJ7XFKIg3UtMkQlDpJCb3qJipccfYXosbvHO4EBANPdI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SJ2PR12MB8109.namprd12.prod.outlook.com (2603:10b6:a03:4f5::8)
 by CH3PR12MB8534.namprd12.prod.outlook.com (2603:10b6:610:15a::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.29; Mon, 27 May
 2024 07:20:24 +0000
Received: from SJ2PR12MB8109.namprd12.prod.outlook.com
 ([fe80::7f35:efe7:5e82:5e30]) by SJ2PR12MB8109.namprd12.prod.outlook.com
 ([fe80::7f35:efe7:5e82:5e30%6]) with mapi id 15.20.7611.016; Mon, 27 May 2024
 07:20:24 +0000
Message-ID: <218c63fa-5582-4f1b-8a02-da7ec66a45f9@amd.com>
Date: Mon, 27 May 2024 09:19:59 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v3 0/9] dt-bindings: hwinfo: Introduce board-id
To: Konrad Dybcio <konrad.dybcio@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Elliot Berman <quic_eberman@quicinc.com>
Cc: Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Amrit Anand <quic_amrianan@quicinc.com>,
 Peter Griffin <peter.griffin@linaro.org>,
 Caleb Connolly <caleb.connolly@linaro.org>, Andy Gross <agross@kernel.org>,
 Doug Anderson <dianders@chromium.org>, Simon Glass <sjg@chromium.org>,
 Chen-Yu Tsai <wenst@chromium.org>, Julius Werner <jwerner@chromium.org>,
 "Humphreys, Jonathan" <j-humphreys@ti.com>,
 Sumit Garg <sumit.garg@linaro.org>, Jon Hunter <jonathanh@nvidia.org>,
 boot-architecture@lists.linaro.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-arm-msm@vger.kernel.org,
 "Skeffington, Wesley" <wesley.skeffington@amd.com>
References: <20240521-board-ids-v3-0-e6c71d05f4d2@quicinc.com>
 <CAA8EJppYmVMmhgLSiSEGA_r4hFbQYriOLjNK9b6VXUYEYiZ6Zg@mail.gmail.com>
 <c875cd34-d09f-401a-8c57-45deddf65c9a@linaro.org>
Content-Language: en-US
From: Michal Simek <michal.simek@amd.com>
Autocrypt: addr=michal.simek@amd.com; keydata=
 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
 3i3l5DA=
In-Reply-To: <c875cd34-d09f-401a-8c57-45deddf65c9a@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR0102CA0034.eurprd01.prod.exchangelabs.com
 (2603:10a6:802::47) To SJ2PR12MB8109.namprd12.prod.outlook.com
 (2603:10b6:a03:4f5::8)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8109:EE_|CH3PR12MB8534:EE_
X-MS-Office365-Filtering-Correlation-Id: 8287a811-1ad3-43ea-aacb-08dc7e1d7a00
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|7416005|366007|376005;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dzFQYVhCbkxTS3VmZ21ENGJPWU1nOGxRcTVoTktoRDREVVNyWDJBcjk5QVlF?=
 =?utf-8?B?aHdUN1NpMHpjTzBvQ2VucDZ0L2JETUV3UCtvVi9TYUNRV2lUek5ybldnK1h0?=
 =?utf-8?B?cE5HOFhlNXlEQlBFNXpIdVpOUGNCcTNQL1U5RDZWVWdJZ3RrVGk0cG9pTUph?=
 =?utf-8?B?OWVGV2xmREdJcmx6YXpHTVFXdU9zTmZGWXNKejYreXpMekVVVU9XLy80SXlP?=
 =?utf-8?B?U0wrN1k5czhnSzdRUGNtY1loUzdEc0FyRjJwQlF5b3RBd3I4WmRzR2N1MlFC?=
 =?utf-8?B?d1F2SHZYZ2ZIdnl2YzlZSXB3NklNQjJ6aVFsZ25vM2FBVTJOV2o4MzJjNmNU?=
 =?utf-8?B?YWgvQWNQdStpN2JiT1R3SEc2anVRcDhiU3BqWXFWVUpMT1h2WkZHMVRXcTJF?=
 =?utf-8?B?WktSc3FxYTkvR0pNSEZud2ppNWtRaGEzUDgydzNQb2NaK3ZPV1lsWVpPT1dz?=
 =?utf-8?B?NXVPN0RyQzFvUjg2MnNhWjVJQmVydlMyT1BLcXl0OFpCdkFaWEI3REtPYS8z?=
 =?utf-8?B?dk00M05qY2FSOGtkZTZVWHhrZzlLSitjMzlIcDJmVzBkR0tlYUxTRHQzU2Nu?=
 =?utf-8?B?ZFY4OFNhaXJPWmxzUmlrVENMUkI3QkhMQndWTmJTaUNIYkk4b2srNm14eHBB?=
 =?utf-8?B?Vkt3cXROQk9veVl2MHN3ZlRadGIwSlFjWktScHdMT3RhWC8rdFNob1RTM28r?=
 =?utf-8?B?MTdXWW56UHl6UmZmRDhOSytGZkl5Z3B5ODJLRW5Ia3VNS1JvOTdJQWx2VUkr?=
 =?utf-8?B?cDhZaWVtZ3ZsbmJndWw4b0ppMlByNjQveUxzWXU5M20wK3ByeWdZSE4zWlBZ?=
 =?utf-8?B?K1cvdTdpV2hKc1J1OUVGK3cvbXp0K3ozakwwbnQ2UFJOaWJ4MGhjWVVJYmZF?=
 =?utf-8?B?bGpWdC96VWl6YW5Gcm1pQkNSb2hpeVpjRmdCd1AzdFF3YXZET0JadDZRakI1?=
 =?utf-8?B?ZHFMc056VnlBL2xnYSs3dm04REpTNDdsYXFuSjlrSm4xaTMvZ1RPY1c4UVZx?=
 =?utf-8?B?c2dDRFB6Tm84ZHR5YkkxZ00veXlLalQ2SHhXOVJQVzd4WGtlR2RINWVRT3RO?=
 =?utf-8?B?MTlDTGIxZk9rQWloRnRrSEMrMU5yZWJVR1pRZUlGRXZoZkxSV1l6djF5akhF?=
 =?utf-8?B?NGllemZPS1VsL1gvVVpYbVQ4cDBmZ2Q1TGZaRGtrZm54L2VBZldMRjdkdjJ5?=
 =?utf-8?B?LzlzMUJzek9aWkZSUHp1MnEvMVZXcTRBMTlvQ2c5L0tFYjgxREphNmFnRnhR?=
 =?utf-8?B?aVhaQjI5bCtFOUllWHc4djJvcnE4U0R1QlNOSkFoVkQrcXVFQTVrQXpQZHN3?=
 =?utf-8?B?M2NldUZCUmlZeENGdkwxQjJBeEtybWx0cGV4QjVrOTFyZUtZWGJ3OWlWNmY4?=
 =?utf-8?B?anJWZzNpRmd1KytKR3BuVi9Rd2NNZ2xxaEpRZm9PWDI4M21LRlV5U1FKd01l?=
 =?utf-8?B?aTRNMFhUeHN3dVJWT3J3TVFOVmhSZUdaV0FaQS9KWjNoNFhmTzJJbmZyRE5B?=
 =?utf-8?B?SVcxMko5ZCt0cnpIcEM2bWJ1WDBqaE42UkVrU1E1S2hRY0RxNTQ3VlFNUzdX?=
 =?utf-8?B?VUR2YXovREFQV0Y1SFdkb3g3S1haZldhYzVVRnIzUEQ3Y2pNWUZhUDA2K25q?=
 =?utf-8?Q?blBbDM7c3QZpwc9VPQRtfWN9gWeBCFAZ4sWjUKxsG1dQ=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8109.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(7416005)(366007)(376005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SHl2eGxxVGJkejM0VlNSOEdUL2luZTRJVGhLLzlMaFdFWWxQd1o3ZlREbGdD?=
 =?utf-8?B?bmpTanNGTlEzdUt1RmlCdUg0M2YyNVNpaXAzRDJOSjJIYjFqMm83N0VTQU81?=
 =?utf-8?B?TXJLVC82RXRVYm80K2EwTGtRQ3NqOGFwY2pBZUVDdUs2dEUxelREUWMxdEdo?=
 =?utf-8?B?R215VjU5NDFkVkx2bndzbHVHcDAwb25vcFo2MkZFNDdNU1pBWVhKK1VnazIw?=
 =?utf-8?B?NWM1MVBpOTdVREY1ZExiWkxnWE4xMzdpZXRNbzgrdFVOTlRnUEszUWFleWZH?=
 =?utf-8?B?QVBEN1dmYUljMGowZjltV3FaYjh0Y3ByWis5M0hmUzRwSDVvWVlTTktnN05U?=
 =?utf-8?B?cTlxZ2Q1K01hWUJJeDR5ZVY3Tkp2a0x2Y2tqRkpKSmwzZEtJTS9ZZlQ2d1Jy?=
 =?utf-8?B?NnNUV3BQaXdjOW5QZnB6cDhBU3NqTlpzVkszaUcvUEZxcFUxbUt0NEV4VHVC?=
 =?utf-8?B?RWUrMHBpN3lSTHRGd0FySFFEcGV0Ly9US2JoVjVNZzFaL0NvQlpvUFRmQUxh?=
 =?utf-8?B?K3VqWDJnREV5d2hPVnZYRVVEeTd3cUZ1a0xxSmV5S3l0aUZBdmxvYndZRGJs?=
 =?utf-8?B?Z2xuQUM0TFVpM2kvYTRXc3B0a0ZKaU5lbHZsM1lOdXkya0kwWndYU0J1Zmt1?=
 =?utf-8?B?bEVsR1o5WGdTSGhRUEhiblNyM1VGSEROVWpMR2NKaCt2V3kyV2hzZlA4QVFV?=
 =?utf-8?B?RXVqbTd4N0RYbHNuR0FUdjJ1UWlBMlU5a3dybkVjenI1Tmo5dkR4cU1lQjNK?=
 =?utf-8?B?emEwTmhBNlR1VmdqcFQxOFdzRU5rTEJ3cUdyb2xiTjlzOGU2cTlFeGhlb3ZM?=
 =?utf-8?B?a0YxQUdhc2NjdTFCYWpwZWZvYTVja0pPYm1UWjZsUEJBYUp6MWc4TXlBY0po?=
 =?utf-8?B?OUp2MG1PaUNmUWxKdGxGQjM0QXdMdnU2SVYyRnkyemRKK3lhdTBHT1d1MFkz?=
 =?utf-8?B?cjFQbmV6SkExN29Ma0Y2b2xMSm03dDZoSWN3WXNZa0FTYVpWU3M0d0VxV3hs?=
 =?utf-8?B?NGliTCtGRHRHZCtCM0xrd1VudDZCVnZYdmwvRDdNTUVoVk11SDFVZUFmbEJI?=
 =?utf-8?B?dnplaERaZDB5R1lRbThySFh6U212OU1uVHU1T0loWHdhU0NkcXBLTzJEOTlQ?=
 =?utf-8?B?V2VUWENkWmFwbmRSYzJPNHhDQ09nTkFTWnR0cmRhNHgvdE16NCt4VHBDdUVi?=
 =?utf-8?B?ekN0RkNYMVU0aVB6Zk5TcVhqKzg4SnUrUG5aWjdMWUxyWlMxaWhTZ1JaWnBW?=
 =?utf-8?B?QklQUVV1dCtpOTFHaUFDQytrQlVEdlRkREZGcGoxU3VGYXFqVE4zMmwxSXdV?=
 =?utf-8?B?ZzloNmswbmpJSTVJcjRtU0VUU29ER2pRQVZhNDFxR3pxV1NIeDJTS0ZFaExK?=
 =?utf-8?B?Ym9KL0pwRGZKWnB5MFFTTEdPa3BTbkh2ZWg1Q2RsUlVhM2Z6WnYzOGNOSGFM?=
 =?utf-8?B?ajBZMWxFbWNlN3pMWDVjaVZiUHExOTB3WmxmS2VSK0VuYnNvVUtZUVVJQzFH?=
 =?utf-8?B?QVNDT1dYS1JDdmhTeGUrZWhDeXZKbjVra0VNRzZtSVE2aHZiNUVEdCtETlVZ?=
 =?utf-8?B?Zkc0MEpGdjhWQXI1QlhSbldMS05KdjVQY0oxSXl1MFNDWEVCNTRtK2J6aWxM?=
 =?utf-8?B?bUJ4clJVYmJhNGt0a3h6S0dmL3NVWUJhODJWbmFNSlJra1d4aGJ0WHhMSzRJ?=
 =?utf-8?B?Y1Z6VktNRWRTWEptbitDZ0NjeXRMN0Q0QnZvMlhEeFR3L3FCei9SOHJvYUt2?=
 =?utf-8?B?Y0JUc01TM3NiUWJyY0IrN1FwQk9sY1lDMC8yeDFyTTdmL05jZUttNVdMcXpK?=
 =?utf-8?B?bDNqKzZrK3lXekczWUpQa1Fnb25kMk1PMEJIUm5HamV0WGtsNjcvNW9OcFpX?=
 =?utf-8?B?OWlPOG9sOEdrT1dRM3lzcVFGLzdSOHI1N0xVUDBFVlpzU2lidUdUcEVoUXQ3?=
 =?utf-8?B?NTN2ZWlTSkdoY3dKMUl5VzFCT1V5bFFCYUhSbEJIS3UxTVVjMDRyY1NqSFV2?=
 =?utf-8?B?UzRhbFlDUWdpRHlRc0toaE5wcHloTkgzVHk2bW1PUFVjdnFVR3pTNWl2ZCsr?=
 =?utf-8?B?UjhSVDFrN2Z3dzVnVGlFelNkcGZEVmhyY1pOUS85RWQ5SjJiWjNabmFldGt4?=
 =?utf-8?Q?/jJvQfsY+tHhbTkUTRsAUqp/G?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8287a811-1ad3-43ea-aacb-08dc7e1d7a00
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8109.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2024 07:20:24.8211
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xqY8y7JnTwE7qqXvVhZiiURhXmiYU5XHwvuOEahZBM7WHa8veRqBw7O2MLf1qHrQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8534

Hi,

thanks for CCing me.

On 5/24/24 17:51, Konrad Dybcio wrote:
> On 21.05.2024 9:00 PM, Dmitry Baryshkov wrote:
>> Hi Elliot,
>>
>> On Tue, 21 May 2024 at 21:41, Elliot Berman <quic_eberman@quicinc.com> wrote:
>>>
>>> Device manufacturers frequently ship multiple boards or SKUs under a
>>> single software package. These software packages will ship multiple
>>> devicetree blobs and require some mechanism to pick the correct DTB for
>>> the board the software package was deployed. Introduce a common
>>> definition for adding board identifiers to device trees. board-id
>>> provides a mechanism for bootloaders to select the appropriate DTB which
>>> is vendor/OEM-agnostic.
>>
>> This is a v3 of the RFC, however it is still a qcom-only series. Might
>> I suggest gaining an actual interest from any other hardware vendor
>> (in the form of the patches) before posting v4? Otherwise it might
>> still end up being a Qualcomm solution which is not supported and/or
>> used by other hardware vendors.
> 
> AMD should be onboard [1].
> 
> Konrad
> 
> [1] https://resources.linaro.org/en/resource/q7U3Rr7m3ZbZmXzYK7A9u3

I am trying to wrap my head around this and I have also looked at that EOSS 
presentation.
I don't think I fully understand your case.
There are multiple components which you need to detect. SOC - I expect reading 
by some regs, board - I expect you have any eeprom, OTP, adc, gpio, etc way how 
to detect board ID and revision.
And then you mentioned displays - how do you detect them?

In our Kria platform we have eeproms on SOM and CC cards (or FMC/extension 
cards) which we read and decode and based on information from it we are 
composing "unique" string. And then we are having DTBs in FIT image where 
description of configuration it taken as regular expression. That's why it is up 
to you how you want to combine them.
Currently we are merging them offline and we are not applying any DT overlay at 
run time but can be done (we are missing one missing piece in U-Boot for it).

In presentation you mentioned also that applying overlay can fail  but not sure 
how you can reach it. Because Linux kernel has the whole infrastructure to cover 
all combinations with base DT + overlays. It means if you cover all working 
combinations there you should see if they don't apply properly.

Also do you really need to detect everything from firmware side? Or isn't it 
enough to have just "some" devices and then load the rest where you are in OS?
I think that's pretty much another way to go to have bare minimum functionality 
provided by firmware and deal with the rest in OS.

Thanks,
Michal

