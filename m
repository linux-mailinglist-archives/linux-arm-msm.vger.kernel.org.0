Return-Path: <linux-arm-msm+bounces-60120-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AF4A2ACC267
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Jun 2025 10:49:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 70826171B9B
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Jun 2025 08:49:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A3C71AA1E4;
	Tue,  3 Jun 2025 08:49:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="aUa2Orju"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12olkn2093.outbound.protection.outlook.com [40.92.22.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D42AE1AF0AF
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Jun 2025 08:49:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.92.22.93
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748940560; cv=fail; b=ugRs83+NJgf0a3h34Aiu4mjJciMXaQL6F86Npu6y2BAYGnA9hN5GgvXY+V/dutkP2aAaBI5g9N9o6F+wBbISrefqh5wT4XzhIxJhEysv8iooh0RYO9YZJvmlSpQzWpOmhljlPthD3mqur7lGsDJOKOid295YogBMIPWElJ9u6Zc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748940560; c=relaxed/simple;
	bh=rTe7oG5zBAcrJJnKq9fhg1IyPGSc+hJ8sR2AYI3A42k=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=VFk6h0Hc5tHkjqCNgWCVI/YNYFc7vRui/ZIHYlOpgBxC8L03AObFs2lKHg1KRSHPYb5Yj+1Sx89FBB5K29WeY2U6Veee75ESquvPTI9EIIWuDxzH3B4G4h2k2W+6zVZH2lWj0rC9GhLKgDKxhZqMsUOXnbXttNjiK3vD/qq324A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=aUa2Orju; arc=fail smtp.client-ip=40.92.22.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=modGRj+FA4BRJKCJk7rW7WAMnaZIxpd8/5mfTX4pIPg2n02MHcFZlN7tNMiQaLhc332XNr8HzinUFYzanYfz/xjxkJGtjPyg4uVVEGTKIygBwSxJVlo7tSIDkVM5+8Am0fpUifJPq3e7+ygBtm31tT/1lqX3Hc0DMcEOc4eq/zoPt1hpDlVihGKjD2lGexCdt/CH5+Gb6NKDDPkUpDjRWsLTimp9AsWPkWgskxsINVp72pVddnrm0hTpRWidkI/0hjBUhm9ewKoej8eGxsub3E5a1dILjj4Thl7XxLek/RnBQHHdGznXGUwUZ7Ypgj1uG3jyS5MECoSZmhFCtIZgdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tQWEujVUVDYb7vao2fF2RvYGjCo+GLb4bbQNbVb+Haw=;
 b=xsMrmIYFstc1O0Z7FpTx5DP/viTl2scRs9kRg30ZpzS+0sALPnocHo7W0PY/k98P59coNITOvdBujclJmD9FZ8l20QQPTz+isxoYPMdAUFDQF+3IuJ9uE3EQWQD9HVjuNM9FrtXaEKaPsGfyrfxdVa1aPpnlZaQgR1fvrI3j6cyLQovP2wVNcrLrUsqPAW6ZGaHFPbemw7azm36MOKEIDnWBuyRdhhSkBBVFsqKM1JcbTeng9BJSvsfMeR4yreG4QSfWxAShMZD6LKC+zTe426QaeP7tfn4f8v15PjgG3abmCELxEj4sqiYAEtGW77ROSVUe6e2o+yPJCTPWQAYQtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tQWEujVUVDYb7vao2fF2RvYGjCo+GLb4bbQNbVb+Haw=;
 b=aUa2OrjumX5w+q6iniWw4jAibGRLRhXBZwv6Xr4Qk6D0+ZI+NOr7VfAtPsPocby0TivqzffyRiS6qqgOcjpJ2B2TlfsJU8YOmRKfDjba9P1icaJRAwsANANUDmRhLnaqRlzJPg8AgD+vX7+Drh6RLeA9WC3afWIxWaFrKeQvBRTcworx6qx4KMSgA4kGga0oELImqd8Gxcm0DaGFVtTpmUrRXIZso1x97K2DyNPsHiLxC1ItXxgKxSpaN2I5onVoovJBboFonmq+GZGcD0j/WlGSyGzIbq/UiAvyI7us2oaYP1Bxz6EG9wWIhwceTYUlkd3ehVet4OzejMQFAWjINg==
Received: from DS7PR19MB8883.namprd19.prod.outlook.com (2603:10b6:8:253::16)
 by SN7PR19MB8001.namprd19.prod.outlook.com (2603:10b6:806:2e7::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Tue, 3 Jun
 2025 08:49:14 +0000
Received: from DS7PR19MB8883.namprd19.prod.outlook.com
 ([fe80::e0c2:5b31:534:4305]) by DS7PR19MB8883.namprd19.prod.outlook.com
 ([fe80::e0c2:5b31:534:4305%5]) with mapi id 15.20.8769.037; Tue, 3 Jun 2025
 08:49:14 +0000
Message-ID:
 <DS7PR19MB8883BFF2E80F50F4F6CCC5E09D6DA@DS7PR19MB8883.namprd19.prod.outlook.com>
Date: Tue, 3 Jun 2025 12:49:07 +0400
User-Agent: Mozilla Thunderbird
Subject: Re: [GIT PULL] More Qualcomm driver updates for v6.16
To: Lee Jones <lee@kernel.org>, Bjorn Andersson <andersson@kernel.org>
Cc: arm@kernel.org, soc@kernel.org, linux-arm-msm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>,
 Juerg Haefliger <juerg.haefliger@canonical.com>,
 Unnathi Chalicheemala <unnathi.chalicheemala@oss.qualcomm.com>
References: <20250520024916.39712-1-andersson@kernel.org>
 <20250603084615.GA1728274@google.com>
Content-Language: en-US
From: George Moussalem <george.moussalem@outlook.com>
In-Reply-To: <20250603084615.GA1728274@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: MR1P264CA0140.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:51::6) To DS7PR19MB8883.namprd19.prod.outlook.com
 (2603:10b6:8:253::16)
X-Microsoft-Original-Message-ID:
 <a98aab80-c353-44e8-93ef-dcdd3c5fab7e@outlook.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR19MB8883:EE_|SN7PR19MB8001:EE_
X-MS-Office365-Filtering-Correlation-Id: aa81d68f-0401-400e-67a4-08dda27b83e9
X-MS-Exchange-SLBlob-MailProps:
	Om8TgR6f4EBtFSu7R1+O6JyunUSCiMMP5NPQUaEPRBtDd6NIFGyAqEusN2boxkZ3+czhasiv3Wz6U8LTPAy6AMs72/d8IO5Vef1oS11hM3YB1XGz5Pk620/w4g/72F+Rufh9LVVjMpTec67cAO9pykYUbCmQ0D9JCeDLUKryp5Kkzn2uHSgX9oiHUoxV1bzvgzEdD6QOvTdB2b7qW+gMRkA6t5+g6HQgOLJPBb8GjVWA1CfvGSZzgNJHF98czN77QYYzNUpdHeRHFlsxNICqUGErTfTwPnkC4VF5yGKPWkiCDprMIQgkFQ3uHVDjTHl3P1X4lrO6KV+Qo+nP6nLRlJi821/gktIC4aideAeAqQspgrdNiF9zCB1CP3Qef4IlYWOXWamDKrq1VwFcTRIILEnOOVUZlzBwiD/H4zmRcGbNSvO2S8ZJHr8ByF9eFMPYShOnJ6Btc3Tm9+NsL8ev5yiKOLhJERUextejR0TCE2urQWwWUPTI+m4WIsmBrLjT4o2SsHIqXsAafXn/qdQjCBo5Lt689Li5vWSqjV+uZYLv/oR6+INJD+i+Gi7oLQajZfXzWJYz1VlyKH/VLm6xYPqoamyILWLJx4wYP17hVLAxMqPlyF4CDFN0sX6NDcHA5dHgP73VVyuGL4MRCkVvsl6Ikphay7lkIBm5PV8z2mLDLmRdha/V5/BXf+sOlv3TcrN0tdDq3mYzkqMGLEcNLfX8K3Mj/eENa5GWt/oa68xx+DWWUOg7A6ub7cqeso6qtZEvrpeSmNf5MTo/mWoqgbRNL7L2zPGnbmOc3S6+yf2UFY+ekpnJV9GIx0Yqd7EhR8tqZXuOCUPXpDRG1vvrI6G+5kJ30jl9
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|7092599006|19110799006|8060799009|5072599009|15080799009|6090799003|461199028|440099028|4302099013|3412199025|10035399007|1602099012;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OUExeGJmd2FnY2ZaWHpIUG1Pek9JQWs0STB0OWRDalJqZjFrZXNuQmR2YlE3?=
 =?utf-8?B?OXJ0ZUtTb1psdWcyZ21vQzlBaVl3V1Q4aDFuRy93U0pxb0VXeExrUUQ0L1h3?=
 =?utf-8?B?QzNwdS92c2ZnOUlpbGV6eEhzKzFUbyt4dGFYV2VOUXludmJBbldWVTZsN0RG?=
 =?utf-8?B?N1dNazJidDFraldOMTAyd1E2VThFVHRXWU9wRzJIN0tyZlFELzRlVit6cGJ5?=
 =?utf-8?B?c0x0ZkJ3NFVJUjZpRHY2ejJrSlJjOEVZOHNoUE1BK0wyUWVNN2hoMDMzT2tq?=
 =?utf-8?B?WXZtMDNxcm8vT3RheEVFUlZvT0g3ZTJJeDRCRlpmdmFuWU1Ta1ErVXo3c1h5?=
 =?utf-8?B?emdtaVAwUlY5WkU2aGxJRmFqN0VNOHliUWZYSC9zWDF6MnFEU0lMUFpmaE1w?=
 =?utf-8?B?dXdJNWgzU3NqdUE5VmQ4Z2M1ajBsWHc0ZG1BOE9kL0ZReFB2bDVjdjlXei92?=
 =?utf-8?B?Sk9lQW8xNVFucjA2VDJrcnM4dDBaUkxNOGlsdVh6R0lkNU5ldHl2U2ZBNWd3?=
 =?utf-8?B?U0dYNjRaQ0pFNTdPSDBZSXlwMGVwalVwbkx1NStRZUlkVUtpQnFtZEtERWJW?=
 =?utf-8?B?MGhGbFM5Z3ROSUpWOFZ0QS9rUURKcUxmNUpjVTIxV1U3VXcxNmQ1bUIrSWMz?=
 =?utf-8?B?enRqakw5eWQ0THlEbGFwRlJ1RGhPdjkwR2JJUmFVNGNVSUVzRjlBMGdwYitW?=
 =?utf-8?B?YVh6SHlMVVBRRVRIWU94M1ZPYktINzA2TU4yWi9FakJYZG5LWkgxK1o3NXFK?=
 =?utf-8?B?WnFOSVV6U0J1OHZaVFBGbEhIZWxQTWQxbktBbHd2azNVRVEwTml1RWIyT2N0?=
 =?utf-8?B?NlNsQmJsUGNpZ1pFMXI4K01TM2NsNmVFVzRlTno5S2NoVmltUEZyc0xGNjZj?=
 =?utf-8?B?cmtibEFiNGVZSkk1RFBhNFpRZmdFcXVXM0NicHJPOGpIeTBXOS9YTkdIMStp?=
 =?utf-8?B?NWFIck9CU0VRTGJEd0lIU01vWVkvejkyd1A1eW9ja2RSQTlrU2Rmb1NhQjBF?=
 =?utf-8?B?aklPVEt6NkVxRGFUNmNPT0ZpSGYrWlR5dmtpdDlUbGhlODdLUUwySlN1bGpr?=
 =?utf-8?B?akZqa0tSS21VNHUxQnd4Mm1GdjJGNUZCN2h5QVJ6alRCeWJ0bHFDWlhobDVv?=
 =?utf-8?B?VE5zN0UyNnRVT1RBN3ZjNHBucFdBd3pJN1pjalBpL3RCMnNweHVmMjFLSUdR?=
 =?utf-8?B?MmpFOWVmcnJOTkYrdWxnQ1FhQXpHc3RtVHRMbjZIdG5vL0hSd3h5VnpTNmpZ?=
 =?utf-8?B?WWpOZVZGaHlPMUsydXl6cjBoYTczRnRmWVFDck5UQlJ4U05Bek1xZEhzY1VS?=
 =?utf-8?B?MUdhQ3liL1l0TFg3NnlPVmlnSWxob25VUGl1R3dtUVM4N3BtS1JyU0hvK3FH?=
 =?utf-8?B?Yk8yQ1VidnhSL3A0cHp1S0J5SWFSTW4yaHFFQndVUEZoa0RsdlRYdG5BTGF2?=
 =?utf-8?B?SSs1Yy8xbmxhTkxNdnB0SmNjR2tqTVU0b1hzV3QxUUZLWnRnSVZkNnFHQmo4?=
 =?utf-8?B?TnRxajUxL3pveE1XeHgycGdVKzdkdXNQYVFhLzFKck81ZStqMGNlNWlvbkpF?=
 =?utf-8?B?RFJnait0UWordGVDaUw5ZFJqTVhnUGlRQTRmTitnRG9LbE51UkI3S2dLdzhR?=
 =?utf-8?B?MGtBRzZDZ2JwRFdGRWJOTytneCtiZ2tXV0ErTUdaaXVlcFVTZklRMXBKaDA4?=
 =?utf-8?B?cVZpQnBXOWpySENtemNwd2NlN04xdzhDVEp5UFE3ZjZoME5QWkRucUU5UVF0?=
 =?utf-8?Q?MyJdogKS8hsQZqfuRM=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S2lKVGpyOHRBMW1rR2tNTS9xZDg0R0lQbDNsN2RoT0xYTGg4RFFrbm9mcnI3?=
 =?utf-8?B?bWt5d0FxMTNLaGRwTEcrS3g4SmZNaE1WVmdwenRJQ2RhajlpMG84aVRkOEc2?=
 =?utf-8?B?YzVrbWJlbmU2N0RhZjhEcWZCc1dHa0U3YVJ4SUpFbERaSHArbThFV3RKWmJv?=
 =?utf-8?B?Y2xxUkJXbkJsZzcweFovS2U0dnV1ZER5RHBCRXpybDRrSUNNTHpUOXhlQkh2?=
 =?utf-8?B?bDNKTW5DZ3ZuZkpQdE90eWZ0eVA1OXBtVmpZWlMzVWJmL0lrcSt2TDkyN2x5?=
 =?utf-8?B?UXcxQ29nbDhQcllkU3RKdmdxWkU0aXMrc3V3cjdVNkdneTlTU2QrWlRDZnJX?=
 =?utf-8?B?RWY5OFUzb1N5SEp0UHhTS3I3Q3Z2VnBVYTBiZlNQVVE2TWVld2tzKys4TXkr?=
 =?utf-8?B?aU9oUXByL1c4TjNVNFZrQXJ2RlpuS3hHZStiNHQ1NGpwczAxUmFqQlBhVVR6?=
 =?utf-8?B?SFo0RFB2U0hwN2svdHQxa0xpVlp5Q0Y4bXNpbzZjZnJLcEtCSmtYZlg4blVh?=
 =?utf-8?B?NWdoNFNzM3ZmNGptNjBZMHB1QjdJSjU3aUx1aVhDNkQvS01oMFJqOGFxS1dU?=
 =?utf-8?B?K1V3NGltdWtxbGJEaGFoRndYbTBBOFYzaUQwUFJmZWVHN1lzcVBvdjNoZ1JM?=
 =?utf-8?B?WnpWQlo3ZnMxUTlseCtZcEdyRnFKRFhXOWYxSmNsRHE4S2ZIRGNaL01jY0xk?=
 =?utf-8?B?eFFUbmpPbUlmUmdTVXozTkFndWhtWS9tbTIzenVYL1NRaFhpZk9SWVRtRWUw?=
 =?utf-8?B?ejRMTmx1NmRUZkRHUkI0MmFzK3VDS0hwOW5JSTF6YytMRkwzcnZkT0UrRGRy?=
 =?utf-8?B?dWFCRGNJR3htbSttbHVDNDlFMnEwMVRYamRtNmptdTFOWXVPMlFnRDZWMVNm?=
 =?utf-8?B?bmVER2p4VkEzWHRmYUxrbE50bkpxNG1ORXVrQWcwQlZPc3JkbTc5Qms0QU96?=
 =?utf-8?B?ZmMwVkJqUXpxYUxYOWNmd1VSRDJoMTZ3djMyTjVYL2RrNzZONmNRMVIzU09S?=
 =?utf-8?B?bThyUG92QmF4RHZQUEplMFJqMlE5SDJLQmUvb2FvRXlpREhXQnh4UXJBQkV5?=
 =?utf-8?B?T0pxQi9CeXhQYVJMODZvdjFCZWpIa2MzV2NVTTNEMll2aUtoQWg4LzMrYWdj?=
 =?utf-8?B?dEZmWXVkNEk4SHNWMW1Wb1VIa0MxL2RWWWpQSzArOU85VjhTZzBnTjdkZ2FB?=
 =?utf-8?B?bmpmY3RmcHNmZ3BYbVROalUxbXVkS2VWdzNaTGdJaG9ESSt1QnF1NC9YclJC?=
 =?utf-8?B?UGovdjhjV1I4dllGajkrTHlIOFUxRG5CYlpHS2FvN2VIOVlmOWs1UCtVUDEz?=
 =?utf-8?B?cm12Rnd3c2dEajQrcFNYcEJiUzllaThOU3IzT0JOcHJES0dsaXhjUWNOcEtw?=
 =?utf-8?B?VjlKUVFoOFdLc2tZemo5ckt6WnlnaVZSc0lNRkp2MEtmREF5U2JCWHFRdnYv?=
 =?utf-8?B?S2RUODVZVlpnVU8wNlBIYTB6bXJCSXRpckZkZ2F2RTVpUE4wSW1PWjBTSTFP?=
 =?utf-8?B?ZVY2SHZGWnBjbUU3aE9DU0xPbWI0b1BqWjI2QUsyaDNFVHRBWFM0ZjVqRnBY?=
 =?utf-8?B?empaZjI4TzFOdHNKNHR4SDJCdUpEU3kvT3poVWh6MmR5VzZENHNaMTV6K2p2?=
 =?utf-8?B?cFRoU3VoUVVUTXFvTFdVK1JYNlR5Q3BuelFwTG5FZytZaEpsLzV1OEkxeUNT?=
 =?utf-8?Q?c1mk/Jz0OcQwqcj7NdTK?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa81d68f-0401-400e-67a4-08dda27b83e9
X-MS-Exchange-CrossTenant-AuthSource: DS7PR19MB8883.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2025 08:49:14.2299
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR19MB8001

Hi Lee, please see inline.

On 6/3/25 12:46, Lee Jones wrote:
> On Mon, 19 May 2025, Bjorn Andersson wrote:
> 
>>
>> The following changes since commit 2c04e58e30ce858cc2be531298312c67c7d55fc3:
>>
>>    soc: qcom: llcc-qcom: Add support for SM8750 (2025-05-12 22:26:21 +0100)
>>
>> are available in the Git repository at:
>>
>>    https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-drivers-for-6.16-2
>>
>> for you to fetch changes up to 936badf282388be78094e55bd5e2c96f86635e48:
>>
>>    docs: firmware: qcom_scm: Fix kernel-doc warning (2025-05-19 18:04:28 -0500)
>>
>> ----------------------------------------------------------------
>> More Qualcomm driver updates for v6.16
>>
>> Allow HP EliteBook Ultra G1q to use QSSECOM for UEFI variable acecss.
>> Add missing compatible for IPQ5018 TCSR block. Fix a kernel-doc warning
>> in SCM driver.
>>
>> ----------------------------------------------------------------
>> George Moussalem (1):
>>        dt-bindings: mfd: qcom,tcsr: Add compatible for ipq5018
> 
> Why is this commit in here?
> 
> Where and when did you pick this up?  I don't see anything in LORE.

https://lore.kernel.org/all/20250512-ipq5018-syscon-v1-1-eb1ad2414c3c@outlook.com/

> 
>> Juerg Haefliger (1):
>>        firmware: qcom: scm: Allow QSEECOM for HP EliteBook Ultra G1q
>>
>> Unnathi Chalicheemala (1):
>>        docs: firmware: qcom_scm: Fix kernel-doc warning
>>
>>   Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml | 1 +
>>   drivers/firmware/qcom/qcom_scm.c                     | 1 +
>>   drivers/firmware/qcom/qcom_scm.h                     | 3 +++
>>   3 files changed, 5 insertions(+)
> 


