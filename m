Return-Path: <linux-arm-msm+bounces-92847-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AAJvJSI4kGlaXgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92847-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Feb 2026 09:53:54 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5682913B771
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Feb 2026 09:53:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4B2793016D14
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Feb 2026 08:53:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 560AE288522;
	Sat, 14 Feb 2026 08:53:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com header.b="BdRaiSZn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazolkn19011032.outbound.protection.outlook.com [52.103.33.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BE6330BB80;
	Sat, 14 Feb 2026 08:53:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.33.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771059230; cv=fail; b=Kpdp2I9SVddFZsdz3GztULAxjJqcpZj5qMkLHBbKrYIwIrBsgkslreXKDsq4xR+TPIrQLc8dcnSxBkAhk8Kn+dWsuVRV6KIlaKWsunLkoUvACoVvb6mhYTr5TS3eSC8861j07u19/CoFO3R2i5A/2qI0Af2TJUHi5Vv4GHHl1+k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771059230; c=relaxed/simple;
	bh=6Q5gTJFWz1KIsRCf+17kEy5KVMFBdbxrch7pDhmkIAw=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=eE4FhKdRG1zYgRhy8b6NzpwyeTYiFljj4BeA1Z+UI+GJpaUAeZx0J/UBqzdItWqkK/hzSXnZpIrasX55NUDFpRiufpnUjvYYbO/7aYf7WzeFDUsB7jmkQm+wa+nV7XgfXLidQc6iH5OMMGG4fcZ2gPJCpfo2MEJL+Vt6AETFEjo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hotmail.com; spf=pass smtp.mailfrom=hotmail.com; dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com header.b=BdRaiSZn; arc=fail smtp.client-ip=52.103.33.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hotmail.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EiR0uUzyeJeJRFCJIoJqxX0F9mrunFRBRYWEwK6wZw/uqFQR9Kmy3jYbmhx+GoNICWL4VHCnh0zr9k3shmWP36Muu+WWJi3sm7LY0lDXdIW4vFEozkZ6EEDnVy9Prv1+PdJjsdmByUkhQRtaNtqBSuASW8tuUioXGsB+9RjKq78aew9HHNvt2XEuv4BOyUFz+qgFFJkDaoR1Amw+JiWOLxcHpol2Bp69UuTKe5He3b+KceR7OyuQIkaTphCdOYX2NR5F3omfqIOLsaxzvjAbho7upvp9pvg0oAr+0XciH4azNrDjlvseFwHKp4mejPYyBpCsFH4226Gd/XgvRSyXxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zjMGCwPKrsAPrRID+oJyfBECpuab64aOFTZvj8mC7mY=;
 b=sEoLcbEP2uw9V3NIcACTz+ILayt0hGD6ljpHqWyLmy35rU+I65NalThr7/iiE4z119LAx1858i4GOvqVGWC/Wmck3hMiX2DsOyiK2KmirOJhRKTEO4qNH/BHMPYsFoME7VF3JHOS57OzRfrE6WwRhNz4MrKVBiA82tRK6Q/maYfCats8L5+km+Ns5Yvu3uzAcobDJrDBi/uswQc8Arm9qkCUIQHyPgeMQbw0P2pi0bQJzq29uOdn12+AiqeaeFpOsOi/dG6CWms/XLVhVIphe2TmxMOOZ9GHK1SFLqPOQpXrsTMMLXmqUJdNpXISf9v4tmeF4e0LGBYhNMLnDXYc/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zjMGCwPKrsAPrRID+oJyfBECpuab64aOFTZvj8mC7mY=;
 b=BdRaiSZnKbuH0L9nEz2cN06IMvNdrus+j9sYfP5zXXGxiM8K9sciZ3ZfjkNieNUKedbbJzvDw+9cDf22ncV4eL7rAGDnCcCKFSTnrKGiaixT7UERSTeQFRms0wWy2ZrmcKvoQUv/O53WJaHmCP5JVXcBNoz7lNOTswds+gSX6BbL5OBhbaDQNaKWaefCb7oj/zwhtysE9LRdHcvXaTAcSeYdqxXYLKIEDRlFid8dVY8z+ab0zMFYLVpdWikDy5irWa9gi5MA8t/OU7pNGRCjgtKF0hxdxQNg50H1Wibnll3B/prJUaIPRFzsLaw7MFYy2qMkVBp4TYF3X7gs0J/0Hg==
Received: from AM7P189MB1009.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:175::17)
 by DU0P189MB1937.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:34d::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.11; Sat, 14 Feb
 2026 08:53:43 +0000
Received: from AM7P189MB1009.EURP189.PROD.OUTLOOK.COM
 ([fe80::5756:694d:1641:3b13]) by AM7P189MB1009.EURP189.PROD.OUTLOOK.COM
 ([fe80::5756:694d:1641:3b13%4]) with mapi id 15.20.9611.013; Sat, 14 Feb 2026
 08:53:43 +0000
Message-ID:
 <AM7P189MB10098C9D6B470C171CCCCE35E36EA@AM7P189MB1009.EURP189.PROD.OUTLOOK.COM>
Date: Sat, 14 Feb 2026 09:53:36 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/4] arm64: dts: qcom: x1-vivobook-s15: create a common
 dtsi for Hamoa and Purwa variants
To: jens.glathe@oldschoolsolutions.biz, Bjorn Andersson
 <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, "Colin K. Williams" <colin@li-nk.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260214-b4-vivobook-v3-0-3c88065bbf77@oldschoolsolutions.biz>
 <20260214-b4-vivobook-v3-3-3c88065bbf77@oldschoolsolutions.biz>
Content-Language: en-US
From: Maud Spierings <maud_spierings@hotmail.com>
In-Reply-To: <20260214-b4-vivobook-v3-3-3c88065bbf77@oldschoolsolutions.biz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS4P189CA0022.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:5db::6) To AM7P189MB1009.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:175::17)
X-Microsoft-Original-Message-ID:
 <4127df2a-929d-4dec-b860-0b129b8a202c@hotmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7P189MB1009:EE_|DU0P189MB1937:EE_
X-MS-Office365-Filtering-Correlation-Id: 63beb9db-ab57-4582-d970-08de6ba68e74
X-MS-Exchange-SLBlob-MailProps:
	Cq7lScuPrnr9cOglUl1urTSFBsjx1OD0l5+UGPLmvIehiIvUOzB5Pw6JJuiQFePSJmbRYEY+a/UdGzGqNYHXAXAVwEKUYo8rGe5Z/BCTayS5oMp9TToBOYlb0vMb1TIpZz2f8yIdcgMRdXC14XsWmkop+/83pNAONnx2bZ4yAZppMyt2V54tQ7MSAiANDMUTV68AtEQMvHpHIEUA/FwSFyXY/vbiVzsQ5rYuW3Wz4tmXhf0HexjWHS5+6yvXcWxNu53abV1QIqoc4e7wrJTlbdVA/kD2NGKXrzioqTJPg6dSj1iBSb7b9otCEd2v5Ae6ENS254gIyK/iuCaqFs2BHo4a45vWAiN5XTOG2CBZY8jC91RO/lNFgredbRdG5sF7qm3KFuxaup50KMaBmgsdzdsK+Ks+ckU2c6aIVLWSrphMYISyR+ybtXf97rSTuNr9sWJKyRU2goc7OJ9S/SgQpwRgqvddGbHE7UWg1ds5hMX4YeYeKt1KahFauueW4i7onq3Z5X+u1fxaISbbGWdaAGYSWEGYoz08TgiPmkobKUoUDBHbPRrBC/IDKUWLIr/cmQq0HMlNBZ16xHB5W6XTMfD2bzi62tnEVD812MT7RFnZneExeiQYgKdOPNOD/opouYPPu5gvWEktxaxFKS5Jjo65FsxJbStEklTQllJvIKr1TQWK0kV/m3bfsZfrLf4gCmlxdVFsK7dJWFdgI/AjGjpg9SJszOX9N4E3Jv5xwhJ8IY0IbX/VtUmN1vlhbTZBTVCBZN9Ttno=
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|23021999003|15080799012|8060799015|19110799012|51005399006|6090799003|5072599009|461199028|40105399003|3412199025|440099028;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SnZtSjkwbkJFV0h0MkVjOFcrZENZYzBGVCtSOUt1VDBuQVE5R0p6NnB4WHl1?=
 =?utf-8?B?MjRRWWpGQnEyVy9NY0I2RHMrd3ZzU0dJRm9qNkhFSUtWaVhJSjRldzJndFpa?=
 =?utf-8?B?ZFMrelNNYllTd0dpUmRtNTVwQVBHN0ZCY0lSZVBjQlAyYURqUVBTTllhYkU4?=
 =?utf-8?B?TEtabEF4MktjclBieEpBVjBUampnYU91dURYQUtFYllXUHJoZzlUU0IzWitF?=
 =?utf-8?B?K2hoWmptY0MvSHhxTXpwN25wUlZUY2JWaTAzOEdLZ2FWMTZKUStsTXE2U3NL?=
 =?utf-8?B?NGRTYXFwRHUxTEUyc0cyQkhXY0k2ZXA2ZmUwYS9QQS9nVjRyRkhiWm1tdWxZ?=
 =?utf-8?B?a0dJdStNRHdGTFlaWkhPV3NuVVNISWNNZWNlTUVjRVlHS2wwY0tSRjlyUXBa?=
 =?utf-8?B?di91U2pOZ1V0cmtIcHhSVXljQTMrKzF5STYwVVBGWmdPOVM3cGt0cEw5VWZi?=
 =?utf-8?B?RVQrS1NRR2ZlcHQrNzcrRUtYNTArNTVVd0l1cmpZZ1hqTC9aMG1PQnBIRzI4?=
 =?utf-8?B?eWlia0JFLzlhcUZIcXUwaWpsaS9CemRMYWszT2JVclNVNXVBN1FJYlNZVjVk?=
 =?utf-8?B?aUlKVkx0aEZQaEQ5K2lsckJVdmVlcFZUdm5vKzRCakZ3RVZwTmxERHNtcWRX?=
 =?utf-8?B?VzBiL055dSswMTRySTVUYzdaREp2cExJZHlJTk9rMEozS0o1YWdvMS9jc2xR?=
 =?utf-8?B?U3dMODQ1YXVyWHlWLzFDVUZtczBUZ2pCLzhqVHZtbnBqNWFHY0c1QURJU1pB?=
 =?utf-8?B?WnRPZWZndWJ2RjNNem9ONERya1BETTJCckxlWUJvTW10Umo2aVlyNTlReGRz?=
 =?utf-8?B?eVdmZ2IwL3BibGtQWVlJMGhaNEZnOThvT05GK1RKN2RDRHByenVVbStlNDB0?=
 =?utf-8?B?MVlyd2RRdnJOZTlKdE00ZFF5TVJMSFJ4eUhxK0VZZzlqek01ZjBieGw1NXl5?=
 =?utf-8?B?djJjdGFHNDN2alNsanRqVkxhMldDWkdXK0pUcWMrZVJkaUJnc1VTNkJYV1lN?=
 =?utf-8?B?eUpsQk5SQzFGa3Q5WUxuQnNGQnN6SDdDN3ZIZzhLdWFhdzd3YVg2Mlc4cDRP?=
 =?utf-8?B?TGJza2VBcDZwZmZLRTdybGN1Q1VBUU1CdzhKQlY5cnVENXRxRDN2SGxHelBM?=
 =?utf-8?B?QU1GRzl4bjBVd0xscXNuYllUOTVrQUc1cXZpcmRGNC83WktMbjlmY2tJVXpJ?=
 =?utf-8?B?aTkxamRKejVpdC82SjhxWTlLUjIxSXNIMmo2MDlkZGVqeldFM0VMRHNMaTh6?=
 =?utf-8?B?Q1hEZzRWQnBJK1lNMitVNHNFYTlwMXVqZGt0MEswZ2hVSFNURTVwWVVwYTQw?=
 =?utf-8?B?ekYzTHc1Nm8xL05HZWxSRENLL0NhQW9mdkpsdkNJTUxMZUh4bG5BZEJxV2k3?=
 =?utf-8?B?UWtCWFcwdGRUUGE5ZkJyWWt0SVhlTHZadStzSnY3UDI0Y1gyRHpWM3BoVGht?=
 =?utf-8?B?VjJrUUpMcDUxOERkeERkbXY0QlZuQ1Y3MG9rcGJIT3g4dUhYOUhCVVNWdHpQ?=
 =?utf-8?B?NjdvMnZJd2kwR05zeThQS1FUNlk4a1F3V1JWUTFkWUZVZyt2czdOYjM1cVhs?=
 =?utf-8?B?MlFSMmk3V1dWYXJIajFQd1BXc1R1enJJRkl6ZWVaVllWcGxWZ2ltTWFqN05a?=
 =?utf-8?B?UjNsbFVqSktoM0hjRkc5cjVscldSVlE9PQ==?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TnJQZ2J4U0VuL2ZTQ2JlWStGZm1mT2kzTzZQQWdSaEFVNVY1Vk1HS2M5K1Yx?=
 =?utf-8?B?OG41a0tDUWtSZmdmYTNjVk5IVVU2N2dMRFp0aTFzaTdOTm4zaXRqWUUzcGZG?=
 =?utf-8?B?Mitta0JNN2FlMUR2RTZId0ZEQzR5ZGxJZXhJVkpFaldLeEh6QzIwWkxWSGZh?=
 =?utf-8?B?QWxNTFlvUWdtdGpVQmpvVjBKVGg1SlpncUpsM1lkSVRCalBQYmpJSDl6M0da?=
 =?utf-8?B?UjhVTXlxWjVJTk9GR09UTE5wbktFUFFXazhuZG81SkRlTlphbjBzWTV1dTdP?=
 =?utf-8?B?UTVST0FRVHNKRzZFV3hQOWZNWm0rZWY3TDhVQnFhZlp6QytaMkFheEVTY2I4?=
 =?utf-8?B?bXBhOFdqalVqQnlaUGJ4WnFuNUtWTnY5dVc1QWgrQjJaRHFZdTBWUXgxY3NU?=
 =?utf-8?B?T1B6OWpFU3Bhdk1GZlVkUFUxYnZzczRVNlpMZ21kbjNlQU02a092blBpYWFz?=
 =?utf-8?B?MTdneFhvSFpEeG9mN2drWTVqOGJQaURwM2dVSi9uK3pSa1h0L1pRRlNYMGpk?=
 =?utf-8?B?UmJQUXpkOUdpb3E5NjdkYjU0dzJiWnRpNG5qOElNc256Yzk4bSs3ZmxzMkpx?=
 =?utf-8?B?OGFyOWUrYUV2K2YyeUV2RkIvZDZOZUl2ZHltRWkwdEkrcTM2bFBDTzBSTE9l?=
 =?utf-8?B?ZFJQK2R0RmpVRWZzZVhXam5ZMjVTZGo3Rm9iUXNIb3ZRZmEwb04xVzJ4d2VO?=
 =?utf-8?B?OFpZeklKVkRSVFdBcERKOG4rTG95UGRLZjhVenNHZUF6L2p3emcvTlhySGJz?=
 =?utf-8?B?Sk8wSkgyZ2x4UlkrMXBCeFEwNDNYdWt6WUUvakI4RndCcHIwNmxMcXpBdksy?=
 =?utf-8?B?VERaaEcvd0JkV1lJaGJZdWdQMVdZSlphVEZxSEZBUUVSNy9TZGQ5aGsvWVBn?=
 =?utf-8?B?amV3UHlxdDBwTDQxYk9FQnhkZngwZm9XZEdtYnJrOXFVcE9sV2UvOGxBaExO?=
 =?utf-8?B?ZXRVUTgvYlpVdEh1dm1zRkdqRUt3dVlZcXZVL3YyV2p5MmE0bVdCb1M2TWJl?=
 =?utf-8?B?R2wzazFuMHd4c1dRUmV5NTRRRHYwMlkyTWR1WkpLamlNRzhWVmZaMzFCcnB2?=
 =?utf-8?B?Qmt3SXNScXlWQlE0Q0w4ZWVSVnQ5REZsbVd6WnQzVlplOEkrWERaNDFtR0tz?=
 =?utf-8?B?QjN4bTZRQXc1S2ZXR3BVSlpUdlhCU2ExRm5IVUZMNnRZdmpLcWdWL3YzRStq?=
 =?utf-8?B?bkpISEtqZHFEang4R052Y0g4M25xSUpUbWRQbms0ckZCd0RZb3B3MzlTbmpF?=
 =?utf-8?B?dkVwTUhNOUFrdnI0R1hETkdQS0lBNkk5M3JMQzFIZStFWDJjNWY5TUJCT2VV?=
 =?utf-8?B?YTUyQ1YwNzM4V3BZMC94bWE5OHc0S1pSL0M2VkpzbXJPZmIvd0dTZEY1V2Mr?=
 =?utf-8?B?OGhJTy9XVDlXTGpMS3E5N2MwcDJsVGV2Wlg0Z2lGOTFmdXpaSU9tVFBPK0R6?=
 =?utf-8?B?bHNNRGNZWFMwVW5ZQnlJak5INk5YMnVnYzZFUWw5WFRUb3FFYzdMeHRSdW5B?=
 =?utf-8?B?b1hwWU0vQTVHT3dNNGw3YXRkVVYxS0NjS09JUVA3cWZRQ0JhL2d6ajZGdnlq?=
 =?utf-8?B?RG1ldTdZak9lWVdlREI4V3l2UnNNVU5RYXdUY2FpQjJWSk9vd2ZqMjgwcDdH?=
 =?utf-8?B?bi9SNytzRnFlZDJQOEt2Z0RqUHYzWWIzSkhGbWFyQW5Bb2d3YUM0Y1lwMk1r?=
 =?utf-8?B?QnJ0Rkh5a2dERmU4VlV4aVJ6YjY5c0EzdlovbHpKYy9USVgrNmRWQjE3UVRy?=
 =?utf-8?B?NzJUVW8reUZZMzBlVGFFNDNKWjVoMHN0eGhhSVQwS0E2azMzWkFCdE5NZDJF?=
 =?utf-8?B?c1R3NGljckowK0xqMVJEaUEyK2FCc1BERGlyQjhzTmVBcnJHc2lBMnBGdzJn?=
 =?utf-8?B?Zm9QcGZXU1ZMcHlPZmdyNkNUQVFmYXlMN2RkMzhWYjBQMjVOcUVyampsazBw?=
 =?utf-8?B?OVNBK01lWWo0TEdtK2NiYmVFSGhOMGhUcmxYRDRxNTlPakoxbU0vQ2FoMUpF?=
 =?utf-8?B?TFJXR0laSVZ3PT0=?=
X-OriginatorOrg: sct-15-20-9412-4-msonline-outlook-645de.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 63beb9db-ab57-4582-d970-08de6ba68e74
X-MS-Exchange-CrossTenant-AuthSource: AM7P189MB1009.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2026 08:53:43.5744
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0P189MB1937
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[hotmail.com,none];
	R_DKIM_ALLOW(-0.20)[hotmail.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_MUA_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[hotmail.com];
	TAGGED_FROM(0.00)[bounces-92847-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[hotmail.com:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[maud_spierings@hotmail.com,linux-arm-msm@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,li-nk.org:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oldschoolsolutions.biz:email]
X-Rspamd-Queue-Id: 5682913B771
X-Rspamd-Action: no action

Hi Jens,

Again thank you for doing this!

Tested on my vivobook x elite machine, seems to still work fine.

Tested-by: Maud Spierings <maud_spierings@hotmail.com>

Kind regards,
Maud

On 2/14/26 09:32, Jens Glathe via B4 Relay wrote:
> From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
>
> The Asus VivoBook S15 S5507QA is sold with x1e-78-100 and x1p-42-100 SKUs.
> Put the common part into one dtsi file to be included for model-specific dts.
> Include the common part in the existing Vivobook S15 device tree.
>
> Tested-by: Colin K. Williams <colin@li-nk.org>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> ---
>   ...-vivobook-s15.dts => x1-asus-vivobook-s15.dtsi} |   33 +-
>   .../boot/dts/qcom/x1e80100-asus-vivobook-s15.dts   | 1426 +-------------------
>   2 files changed, 46 insertions(+), 1413 deletions(-)

