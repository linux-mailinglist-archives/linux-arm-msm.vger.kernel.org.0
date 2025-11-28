Return-Path: <linux-arm-msm+bounces-83780-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 315E6C9211E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Nov 2025 14:07:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 10AD84E15FD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Nov 2025 13:07:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7161132C31C;
	Fri, 28 Nov 2025 13:07:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.b="RjFB40Ap"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com [67.231.153.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9B8332C30A;
	Fri, 28 Nov 2025 13:07:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.153.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764335224; cv=fail; b=ldysRo1zaOcLi5WmZrrw4GyY9Jqf9s3ncDaeezqOEtIElWceNowh3x1GRmRO+QTyTFEBOh1Y2yxJhUxr7rnkA/UPw2saO2pwaJhKaV08TeY/rrGKgLxrFX/JKi+dZaKcqhGwp2VtrEtLlRugG7p48+Lbd/TeDKJj/0KKr8Uw6oQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764335224; c=relaxed/simple;
	bh=ZWscVtzjmrLyuZzM6frg9lfMSd/Fu6IdFU2s88sVges=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=NYoxU8g4FnesHQPfYteB1CL6n/LveW+h97w/j2t1W7L+RiWUDOf+gOkTOTIvy09rus62pLcAekYk9uUlsrR00U3LAGNnhjtW3QpitlY36V1SAO4XP5YV+QKrD3PSAoA38U3KMXS9sKHSc2BUsGsuJgNmwjjXWkl+H6Y7vVLrgzQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com; spf=pass smtp.mailfrom=meta.com; dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.b=RjFB40Ap; arc=fail smtp.client-ip=67.231.153.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Received: from pps.filterd (m0109332.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ASB1XCc2624573;
	Fri, 28 Nov 2025 05:06:32 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=s2048-2025-q2;
	 bh=nXyzlFHJ4kK4VHadMDHjwlOyZRwlzyzLNr0yydHbkRs=; b=RjFB40Apxrf3
	ZdEAGkHpi8Beqw08R03ZGMQSpi6CE/96tZprBaFEyUqkWllVXZOM6dOu1woGDrkT
	67h282TFJrUgzOiH2Mq5kRty/NnxudaTDGHiANlJK3XQ3ur3Q5FAPC39LrDNpsMn
	O4uTiC1SobbCCpd1vBwDWqh+d0N7QDsDpdnO9l9D61YaA6Sek0dwK74XJmA+E3qj
	StprB9rWeg3vtWY4r9LjoDtx5oWRgRW3+faOekLpmKpboL/vTaTHDeBdMPEiltRc
	cBsD0C3Z41Rgs+j7zqyVrJEHNcnNDanGYiuaZ0xWKNlpHPCgJEAQsJVcOuO3hVXo
	VasDmM+g0w==
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11011030.outbound.protection.outlook.com [40.107.208.30])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4aq4002921-2
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 28 Nov 2025 05:06:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=du9Y5WfWBj+LHzRtDGvkxcq9HVJV8mRd7cGCYE8e0LDogYxGsQ7gIkj4JyeQXV81JzBowMpH//uDE6ta9iRMWpti7FOTgoqsLfinc13klW/R/skSznR+F6J9ZLKkYRx/eIlPesEXUs7SgMIwLxQT5BvnUFKXWrMl97FdK9/kgheBVoZEYvZjyQs8dqbH79KGuXXryiyWkKfcOspsz/YF4BHoMj+4J56J7KjTprJbLjwAvmOqwfE0cxWgi99AA45kZpBdnjySQ4JTvyHJrE9fhAHNvAd8/1D/eNBCP6Zl3ZSzi6QKuFt5nhynI67u3Ywk7aGc8wlGMELcU2Q7Nf5oWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nXyzlFHJ4kK4VHadMDHjwlOyZRwlzyzLNr0yydHbkRs=;
 b=OHoFAwjwFNQIBdoDaCkHnu+no+btfNczkxvQrqVa8VF9Twaqa+IoXy1aQaqeQSs+kHxbRDy1yCmUxAiYlqJ4ir7pLnE905ByNUxt16ahspAkMByTsFv/jyUu/u7AY1BOWA0qBNs+Q4RrYZe4KXms8o7tEXfMGxnxwgELOau0gb4jbKyqd3M6vKTow2P8nHsfPjZeonPhtCHwIQEJz1u5IJ8A80z5p7U/zLBTmZ0EssS6tap8eX6UXVH74GIWlOhO1HjDIBeVE8VbWML/RY80WJ5tfYLBzuWk2Penu2A5/DaX62BgJGMd4jfbcSfLsIlBRHcH3yF7wlUVv3MlWdjcTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=meta.com; dmarc=pass action=none header.from=meta.com;
 dkim=pass header.d=meta.com; arc=none
Received: from LV3PR15MB6455.namprd15.prod.outlook.com (2603:10b6:408:1ad::10)
 by DS0PR15MB6144.namprd15.prod.outlook.com (2603:10b6:8:117::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Fri, 28 Nov
 2025 13:06:29 +0000
Received: from LV3PR15MB6455.namprd15.prod.outlook.com
 ([fe80::8102:bfca:2805:316e]) by LV3PR15MB6455.namprd15.prod.outlook.com
 ([fe80::8102:bfca:2805:316e%5]) with mapi id 15.20.9366.009; Fri, 28 Nov 2025
 13:06:29 +0000
Message-ID: <4910c9a6-0586-474c-b2e2-4c599e44272f@meta.com>
Date: Fri, 28 Nov 2025 08:06:12 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v19 00/15] net: phy: Introduce PHY ports
 representation
To: Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: davem@davemloft.net, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, thomas.petazzoni@bootlin.com,
        Andrew Lunn <andrew@lunn.ch>, Eric Dumazet <edumazet@google.com>,
        Russell King <linux@armlinux.org.uk>,
        linux-arm-kernel@lists.infradead.org,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Herve Codina <herve.codina@bootlin.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Vladimir Oltean <vladimir.oltean@nxp.com>,
        =?UTF-8?Q?K=C3=B6ry_Maincent?= <kory.maincent@bootlin.com>,
        =?UTF-8?Q?Marek_Beh=C3=BAn?= <kabel@kernel.org>,
        Oleksij Rempel <o.rempel@pengutronix.de>,
        =?UTF-8?Q?Nicol=C3=B2_Veronese?= <nicveronese@gmail.com>,
        Simon Horman <horms@kernel.org>, mwojtas@chromium.org,
        Antoine Tenart <atenart@kernel.org>, devicetree@vger.kernel.org,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski
 <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Romain Gantois <romain.gantois@bootlin.com>,
        Daniel Golle <daniel@makrotopia.org>,
        Dimitri Fedrau <dimitri.fedrau@liebherr.com>,
        Tariq Toukan <tariqt@nvidia.com>
References: <20251122124317.92346-1-maxime.chevallier@bootlin.com>
 <20251126190035.2a4e0558@kernel.org>
 <f753719e-2370-401d-a001-821bdd5ee838@bootlin.com>
From: Chris Mason <clm@meta.com>
Content-Language: en-US
In-Reply-To: <f753719e-2370-401d-a001-821bdd5ee838@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BL0PR05CA0011.namprd05.prod.outlook.com
 (2603:10b6:208:91::21) To LV3PR15MB6455.namprd15.prod.outlook.com
 (2603:10b6:408:1ad::10)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR15MB6455:EE_|DS0PR15MB6144:EE_
X-MS-Office365-Filtering-Correlation-Id: 40c21d40-6e8f-49fd-3375-08de2e7ef1e0
X-LD-Processed: 8ae927fe-1255-47a7-a2af-5f3a069daaa2,ExtAddr
X-FB-Source: Internal
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?WnVQM1M2T0ttRUNJbCtZNTJHVnZLRjNvY01RSTV6SWtUenM2bGJjRlpYK1hR?=
 =?utf-8?B?N2Y3NzAwWllGQmpDRnVzUHQ1aHVZT2N4OHh6dnZad3ZBUmhxek1sWkVDOHF6?=
 =?utf-8?B?N2lYZVFVUFNaQmFCd2RsV3NpUXZLOFFYWGVkV1pkWUZzUVJjaU5IbXMyYlRR?=
 =?utf-8?B?Zlp1VThhTk1YUG9SUmlBWWpRU3o2Nlh1T0VXdWc0eFMzcnpSU2Y3TnZvNVJj?=
 =?utf-8?B?dktMbnFJaHlyaVZ5bnJaYUhYN2s1RkZlZWx2ZXNYREZtelVPUEJ5d1dJeDdD?=
 =?utf-8?B?b3ZmaWlMRWtzSm45R3BWbnQyb1V1TXJidDJ4dnV6cndYL0Z3WVIxRS92VUp5?=
 =?utf-8?B?RVBlQlVKQ0FDODgzeDl2TlpyQmk2SWU2ejlldlluQ0pSMW1PY0MvdnNXaFRC?=
 =?utf-8?B?elREb0xCbVlzeVdhZlRxSXF4MG1sSXNxY1FSMk5NcFJrR0lSeGFLOGpuR05h?=
 =?utf-8?B?RTZSVXFXZUhwSWxaZU9KaXJ3a2pZSXpQMmFZbTNUQ25vdVVEUUlOck1nc1Fv?=
 =?utf-8?B?RjZCV3lqcVBHQ1N3ZzZJQmdGUWVDNU5UUDdxNzdWTkZqd1ZXSnFpQUU2Wld6?=
 =?utf-8?B?RHUrTkVDYWR6dHNHQjlHVEFYcng1Qkk2dXh5czUweHZvcXZyZ0s2SGNMeHg0?=
 =?utf-8?B?a0UzQTZuUUYxZThaQnRBWERzb1RNQ3NNNU1aSXhadXZyc1VpMmNobnRwK0lU?=
 =?utf-8?B?aDFaRHZVblovZlJIMjh6NENZSjFiajA4TDZxb1BESExuUUpyTFlQaExuVXJs?=
 =?utf-8?B?aGlKSU5KMCtHVndQcVNmUjhjOS80b3R3QlhLNUsxbHczWWkwSzl5WFJpQUN2?=
 =?utf-8?B?NjVFWkF3dmFha0xzR3VJaWc4RHVYT1QwU2hkQU5ZYjk5c0k0ZDl4QmlWam1P?=
 =?utf-8?B?eUxGZFJPZVlpWmlSbjE0RE1taHBTSDNPb0dMaGlxQ0k4Kzg2WFRmOUZ6T0xX?=
 =?utf-8?B?SlorK1RmYnB4YUlSRVdxRTNBZWVkL25pL2wvaXEyeFJnS3RZM2pSVzl6T0JF?=
 =?utf-8?B?d01DQ1lDbHdlN0J4NUhXcWxnK2Q0ZHJuQnZsa3UzOXovNzJnNWdJTXEzbDRm?=
 =?utf-8?B?NStSVjgxYW9KUUtvM1JnNzFOaDdKdXg2SnpQUmwxb2ROd1MwU3ZlUGxjTE1J?=
 =?utf-8?B?Wm01dU1weXZNQTBnYzhoT0dyaVJXdXBObkt4c0lqS1JvTXB2b1dRVDdQVWRm?=
 =?utf-8?B?QWVHdVQwSUNYY2tGZHJJVWZYYXkzN21lUXZXVGFFY2F4N25LRW1PNXFid0VS?=
 =?utf-8?B?OVUwWlQrcGVjeUgwQWpoS1RQVVJrYmJyWTRRS3lzRFdsWllPbEN2Yllkd2dI?=
 =?utf-8?B?Nm5QUm8vdnJ5cWpacVlHbUFBTC9OSC92dFhBTWlBWFRnTk9FaUxQb0JNd1U1?=
 =?utf-8?B?UHBrb2s0dUgvM2JpTXYvdkRNekdZMk5uWlFHQmtaVUphWU9qYUkzTFk3OWdj?=
 =?utf-8?B?b1o4YUNGcFRxSXVjemQ3bjhpYnMwWEhrWnkzRXowZXJTeXJFYXdVZXdlWHRm?=
 =?utf-8?B?clpvN2N2VVo2bE9GeS9OK0RvbWtnUU1vamlHcDdjS1QzSHhiUy9RUzR3M016?=
 =?utf-8?B?T0NXNEYxUDVGbXVoejIrV1E3NlE1N09BTUtKVXJTYmh5Wlk5bGh1K1lqWEY0?=
 =?utf-8?B?V0hwKzROaFdzdjdrWEc4OXVuSzg3dFhGRWhOZDN4UFVOVm56NXZTRDBSTnBT?=
 =?utf-8?B?OFhRcFg0Zk51UUVCeDBjaHdvSXpMVG5jVVN0aFpzcHE2VC9GK1l0SDRiR0lM?=
 =?utf-8?B?VUVpV0ZBT2VmampDQ1E3NnFxMlFyaU56VjdRTm1oWURsUGhlOG04aE1PekFz?=
 =?utf-8?B?SU1XdnhBcE5tYUNVQURNTURLT1N6VERtUUJtMWs1SC9WRkhGcG8wSFZuQ0NO?=
 =?utf-8?B?ZmZuNTkvYWxNdkZyRHlVK2pFcTRYb0dlOWlMSzR6TTZDQzh4MGRtSGpQWDda?=
 =?utf-8?Q?Kv9V21rtFfH49I8BEbp2u+4F+eIOCWBw?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR15MB6455.namprd15.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?VzlrWlU0RWJDbWpyVThQbFRWcHJ2YWIyTzdHTzdVMDA1bDBQQVJ3L2dPVW0r?=
 =?utf-8?B?dlM5dnNXeVRkZmJjVXVMcDhVZmNBbUxTOHdQaGJsNlphdW9KSUZWY2F1NkN0?=
 =?utf-8?B?R0NnTkhKRzNwUFozeTFad3FQVGhiWDNoemNIakk1Q0s4Z3VwS3pLL1ZCWmx1?=
 =?utf-8?B?cWw4YmxMWHFpdzlUcml6cHVoSklBdGRjWWN2R0xheG5MM09ubjhRaVNrWjRP?=
 =?utf-8?B?alg5YkRMTDhjQ2hqZ1RhU2VBMzJSWmlPL0NKWng2QUlpOURTbDRrUldkL2xq?=
 =?utf-8?B?RFgrTWovT2ZKbm50Q0s0cUhOYXJvTVljTm95SlBNZkZVeFNZNmpWSU1ocGRk?=
 =?utf-8?B?V20vSUhoOS9UL1RzQnRwVEtQdkd1UE5PUjlCeUVpeFYzY2hmUFZlVXUzSFBh?=
 =?utf-8?B?ZlEveUdkZ081ZHZaeHp1MVBpelk0NzlMWlEyTThXVzlRQXZKM1BYQjFzempa?=
 =?utf-8?B?anQyRnUzaHlhd2FaUlNwVXNBK0Q4aDg1dDBRcFhEcjlKRWFkYWo3YkxHVmEw?=
 =?utf-8?B?VWE1d1kzTHI5N3JyU2FFZXA0TWFOMXdZRjN6ZUpwR01Sa3UrTm9OOUtIcXg1?=
 =?utf-8?B?MlEybFhQQmlJZnppK2RTYko0OUx3SU5YNzFCNUJveTdZOENNd2MyTXRvRGFE?=
 =?utf-8?B?QWhSWStzRnNRYWd5NjF0bzhCcnZraXZ3WjJLeTlmY1dERHBiMHduMW8rcDk3?=
 =?utf-8?B?Q3BiSUVhSDZhc0lLSEloM2dVQ0ZyVTcvMm5mK2NXaTNXS3hHY2FQQmNTUWx1?=
 =?utf-8?B?Z1ErTWJySUdieHI4ZXQrMkxiRVhIU0FpcnBMUEh5bTNYZWFKbmpTcnN2STNk?=
 =?utf-8?B?QWF2bXgvbmIwTWFieHVuMWlmcWV6QmMxOHJpVVpkRmx3RHpqbGxiUmM4ZnpO?=
 =?utf-8?B?N1poVFE1OUVVcm1qRkpmbTQyQTVrR2hQdHdGQW13eTRvUDZhWk5KUFdUVHRX?=
 =?utf-8?B?Yk4rYklnZzJpVXR0RU0vZStXSXlFZmNMU2VLK3owdEFZaXBKZmFpVkNzNmVh?=
 =?utf-8?B?ZEc1OUhXSEJvOWhlWm5Rc2Q5NmYraXJFd0FUWXZmU1NOM3VNbEVGZzdXK0FF?=
 =?utf-8?B?OG56bDhzK08wWEJMMFppbmV3WU04MitTZG1jOWxtM1h1ZVY2NXRUVWFvenNO?=
 =?utf-8?B?bGFxNmpOUm1BSlBHd3lXVlRSSk9VZGpZN1Q4NDgvTDlUS1hVKzZqQkNlVWcw?=
 =?utf-8?B?eHIrODhWTEJkZGtCQTRkWWNEVHBrdUlINTBVcmw2ZjNMS2taNmVrRjNNQnNE?=
 =?utf-8?B?RDhRSTE0ZTR1NGZJbGYwOGpucnZLTm5aQVA1TEYrdmFuTnRwWUdRU295M2ZC?=
 =?utf-8?B?aThBK2JYT3pSQjFYbmdEUEJFeHJDTnlUKzhzR3h2OUtTUWxITndza3J1T3hi?=
 =?utf-8?B?UEF0SkxsTjkwMndrQUwyczFoa0JmNUZIVU1mSGd6Y0szZGtaYmMwUzg1c3RO?=
 =?utf-8?B?R1pRVHNOald6N1JEc0loVERobmV2dmFHMk1HUkNlazRLa1gwUWtaZkp0VW9x?=
 =?utf-8?B?WDJRQlpTOVdhSyt4a2JmWHpLNUlXWWFxeTd1YWRpaGhPaHBMV0lTRVZPeDg5?=
 =?utf-8?B?cHI3ODJtL25lUzcwTlhGaEpBN05MYWZ3VUc1OW1DREppOStJWmV6eFB2WjE2?=
 =?utf-8?B?Z1dKby9RNE5pZXpLOVFERkFDd3A1Y3BoOUZydWNlcVBnUTVtSE9JZVdrWFFN?=
 =?utf-8?B?OTBJWFdoVnFUTVo2SmNmUEd5Q3VXT1hwb3BFbTdNRTV2YnhpNFRVb3h3Mkxi?=
 =?utf-8?B?bHNJTm03MWNJOVpPdDBiczdqYW5aU0VqVUc5NTFyTUx2RkNqZnh1ZTdzT1Ev?=
 =?utf-8?B?VlVncWhIZFgrZmNkeVdwUitrNUN4NFhrYlJjeURmT1FRTG9raUtXbkRnWUFw?=
 =?utf-8?B?L0hMak84bHdZV1cxVE4xT09HL0FWQTlVSDNVWTNDd2x3Uk5TKzVyR0k5bWJT?=
 =?utf-8?B?ZFovYUJZZGJCV2Vabm9pL0ZrQzhud3pubDk2cGxoZzBGTnd2VnNEd0pNZy80?=
 =?utf-8?B?M2VQSHE3Ym9SR0E4UFNQTlQzK2ZLME1MWVp5SjJPL09BK2lGaXZUNlI1b0Jo?=
 =?utf-8?B?ZGpmaHJvVHFIbWhydkpOeGRWZVAvYXJ0RDRmazRPdHVzMFBYU0xmL05GWkRw?=
 =?utf-8?Q?cPmY=3D?=
X-OriginatorOrg: meta.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 40c21d40-6e8f-49fd-3375-08de2e7ef1e0
X-MS-Exchange-CrossTenant-AuthSource: LV3PR15MB6455.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2025 13:06:29.3967
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W8Vqu9RoGamQGEOwiUPjudR34wK2XuHRpmM3YDOcAGaUZ3munEn2z32+471MtsMA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR15MB6144
X-Proofpoint-ORIG-GUID: y6Xc4jBhefYJAboQa8aasH_xFEHrG-mz
X-Proofpoint-GUID: y6Xc4jBhefYJAboQa8aasH_xFEHrG-mz
X-Authority-Analysis: v=2.4 cv=bI4b4f+Z c=1 sm=1 tr=0 ts=69299e58 cx=c_pps
 a=ysgzExocFkmHQmNOaQPFvQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=CjCV1Wvz5ey77DIHvEEA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI4MDA5NCBTYWx0ZWRfX7Y3OAOZyJFKl
 BZtcOcLV8g95cbnARumdsMU57ov/3z2Ice8DHBWVyoEYhPUq7ba69wst6xRnEk01t46GsroG7SM
 TK9kto/Qd7vldJ+C9ObJS4shhezkVV+nCsqanRJMXWhbxdO4XWjZ27jqAxayWoH7z44qZPDb3hC
 zZjpts7n2yloNzVoL7H2iqR8AsaM/KO7sFqwxTjbcevSLJtKlDpBxZmeIrrnY3wguo7eqsY6/+z
 WIB6bM/F88GAqcBxPvfFY6f5Qc+QvdlJc5ZN8TR39p/IIythH+cJHzo/5fT1YexG+w1pTpgg6y6
 +vfsV9WJ7s/8bB3hB5x1tsBwufwqvkbYgZH8UTPCR6eLSokGwJGum92xP3YQ5cF5ONvm0Nkx8+l
 PWR7xUR3ScnJeN7OreY4YZ6i5kbbKQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_03,2025-11-27_02,2025-10-01_01

On 11/27/25 10:53 AM, Maxime Chevallier wrote:
> Hi Chris,
> 
> On 27/11/2025 04:00, Jakub Kicinski wrote:
>> On Sat, 22 Nov 2025 13:42:59 +0100 Maxime Chevallier wrote:
>>> This is v19 of the phy_port work. Patches 2 and 3 lack PHY maintainers reviews.
>>>
>>> This v19 has no changes compared to v18, but patch 2 was rebased on top
>>> of the recent 1.6T linkmodes.
>>>
>>> Thanks for everyone's patience and reviews on that work ! Now, the
>>> usual blurb for the series description.
>>
>> Hopefully we can still make v6.19, but we hooked up Claude Code review
>> to patchwork this week, and it points out some legit issues here :(
>> Some look transient but others are definitely legit, please look thru
>> this:
>>

[ ... urls mangled by meta email ... ]

> I was told by Paolo to reach out with any feedback on the LLM reviews :
>

Thanks for sending these along, it really helps me fix up the prompts.

[ ... ]

> 
> Does priv->line_interface need to be reset when enable is false? The
> old mv2222_sfp_remove() explicitly set it to PHY_INTERFACE_MODE_NA,
> but the new code leaves it at whatever value was set during the last
> module insertion. Functions like mv2222_config_aneg() check whether
> priv->line_interface equals PHY_INTERFACE_MODE_NA to determine if a
> module is present.
> 
> --------x8----------------------------------------------------------------------
> 
> 
> Looking at the call-sites, we can see that when the .configure_mii port ops is
> called with enabled = false, the interface is always PHY_INTERFACE_MODE_NA.
> 
> Looks like the potential problem was identified correctly, but it failed to see
> that this can't ever happen.

This is also a problem for bpf reviews, where claude finds a pretty
detailed path to a bug that can never happen in practice.  I'll use this
and a few similar false positive reports to try and improve the
elimination of impossible bugs.

> It's a bit tricky I guess, as the call-site in question
> is introduced by a previous patch in the same series though.

This part shouldn't be a factor (I hope), but I'll check.

-chris


