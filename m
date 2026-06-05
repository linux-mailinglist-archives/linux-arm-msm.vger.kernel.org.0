Return-Path: <linux-arm-msm+bounces-111354-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id tP0LEHKhImrrbAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111354-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 05 Jun 2026 12:14:10 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id D365B64736D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 05 Jun 2026 12:14:09 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=outlook.com header.s=selector1 header.b=kC492UT7;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111354-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111354-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=outlook.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 80D83301911D
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Jun 2026 10:12:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C45DD3F1AA1;
	Fri,  5 Jun 2026 10:12:18 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azolkn19010035.outbound.protection.outlook.com [52.103.10.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68C8A3D9695;
	Fri,  5 Jun 2026 10:12:17 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780654338; cv=fail; b=jo+lESTh9X/2zvvKN3/Pt1415L4oIwbzs8jw1PVOlfud5qBPs1yPARFlAyMNo7waa9rn94/DeaDmQgnvDzT1x3LLcWEY+78oRO/SRJ57/4LArVhUSc9mgTAtZmsLgkoSbkL0n7StrVyVA9gTDGigoj1wSbOBulmyhkD2Xjz3zxE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780654338; c=relaxed/simple;
	bh=gzQ8R3HIKm7zQKaKy853uHJ0UWqzpGcltqgy3QG/FdY=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=sQxoa7UOLEeAS6wa73UG9EW3+W9rris8yQ4dKmaw7G0NL781bhD2eHbzH0BqiqB2cI8Up5k3LV0OSFFNJSouiPflxvsoIwf5f+fsDWWDXL2NuuHbE4YQt0f3XP/nawLfRoFqKN0rg/jGk8uoFhG0y3tkHZg6c0Al6ZfI52BIwKo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=kC492UT7; arc=fail smtp.client-ip=52.103.10.35
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VLt+I1j8dmRF5O3VSZPHaQCJDDDIbm1JDH6dTMI84u2NSfpeoXcv5ZIR/4fHAQ23lW5EdIln+ttjPNtH7dQH1IFllQeTV9htQahey9nOAindPbU4gu2y6TNQIVF8W6jCOMHQOb4RMg1M2/Rj17/I6q4tE86jahnYz9/eHDLwJTeaEDyKLeZltUilNTB7cPFz0epOQzDS9KjxsfJkqQgrjIrJe5nwyTdw7aHQdBU1H4ZFuRaIxjapeWR5cF5CB6fXVGgTzK+ED6nv4E/tq2KfREmMWILcjkGSiVQM3MfageaSGFfI4UscwS0e8nk7y/ZoN6enkPbFbgJP60cT0XUhsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EoX3o0RhLR+O8iCH+eyxRyKZeWD7IfHY9Zx844G//Fs=;
 b=S9930iaygLHpk3nWdrbjZxoh2SgMgq+PNuQAxvy3n5s4mEI5c96WRS0WAiXM3Pj+eWTryNaEmJBQiW1vRAl9q/gwHiySOujR7wO+OHUXqYJLnDGU/4JoIiWdx+dn+vV7Jc46+8ob8lT9cjTbTgFajEuVKpOLn69nK7AxN3TmYOP7JmNfThzfRLj2hXw2b9TdhBKy9HAsxTLlxMGa1A/2VgirChDbJj7WRIkZJeU3BCz2VTPqU6ZEDDlZSYfaTb+rJdmxOUpSWbuDZ8V1vHYZYs6c451iExcz95FymvQtYY6W/e6yyqnk2azRqH/hC5HrefukAwrNzk7WfEOuS+Z94Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EoX3o0RhLR+O8iCH+eyxRyKZeWD7IfHY9Zx844G//Fs=;
 b=kC492UT70TvZS0bXjfsszoTgHIh5+shH43mczOPPZLNwH1usxI/6TRgl1z+N+JgP/PpUN0MzDFZCThdCf4OKrV/2U6PYn/nV2rga6u+EAow4SlIp5y8IjPXCPHEGTLbungUlh9z6gq5ILbAL/gV6/8KUptE7PcI+N8JWw+GBCcjAR0DngiTJ/XFX6aMb61lAZpYbpGl9U78zPkveDfnNGStrZkW78EqOnFARkRoohfw/Ky1/Z2sFfBwmb9NYjsKk0LCSnZcKtD5QofVUNlrhXx99qBOFh6jK4GXD1ST1OSi39VOOjL6ezW4MDylpXBFR4PZYz5n7dR/Ao/KZRgSGfA==
Received: from SN7PR19MB6736.namprd19.prod.outlook.com (2603:10b6:806:263::12)
 by SN7PR19MB6566.namprd19.prod.outlook.com (2603:10b6:806:26e::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.8; Fri, 5 Jun 2026
 10:12:15 +0000
Received: from SN7PR19MB6736.namprd19.prod.outlook.com
 ([fe80::4b6c:b84f:b71c:d0a]) by SN7PR19MB6736.namprd19.prod.outlook.com
 ([fe80::4b6c:b84f:b71c:d0a%3]) with mapi id 15.21.0092.007; Fri, 5 Jun 2026
 10:12:15 +0000
Message-ID:
 <SN7PR19MB6736654AFA46A76AA351D2609D112@SN7PR19MB6736.namprd19.prod.outlook.com>
Date: Fri, 5 Jun 2026 14:12:04 +0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] dt-bindings: net: ethernet-phy: move clocks
 property to invidivual PHY bindings
To: Rob Herring <robh@kernel.org>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
 Russell King <linux@armlinux.org.uk>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Florian Fainelli <f.fainelli@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org
References: <20260602-ipq5018-gephy-clocks-v2-0-65a1f1d881f3@outlook.com>
 <20260602-ipq5018-gephy-clocks-v2-1-65a1f1d881f3@outlook.com>
 <20260604213948.GA1223636-robh@kernel.org>
Content-Language: en-US
From: George Moussalem <george.moussalem@outlook.com>
In-Reply-To: <20260604213948.GA1223636-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DX0P273CA0036.AREP273.PROD.OUTLOOK.COM
 (2603:1086:300:58::14) To SN7PR19MB6736.namprd19.prod.outlook.com
 (2603:10b6:806:263::12)
X-Microsoft-Original-Message-ID:
 <d0e39fc2-7b7b-4ae6-a33c-908f181f8c13@outlook.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR19MB6736:EE_|SN7PR19MB6566:EE_
X-MS-Office365-Filtering-Correlation-Id: a0a53a6e-b5de-4ed2-df20-08dec2eaea3f
X-MS-Exchange-SLBlob-MailProps:
	Z68gl6A5j2981iOqa3TIFE7v3cGH1r/4iyR0FNVF1LsrxI+Jk4tOuByvlPjLR0kQjAdm0bOm9hTsGSYkRF6ANCN5bwnLy6SuhafPKIs5ad4Ju2VtXHe7E4yX1BMr8K7yPA9r4qRJMRPmgxXTCQ7Kg1pGkLJVhhLFGkxBHkIQSXG5jk5wDnMTuc4PryozoCcIfV1wtZFB/A6RwtrEv3VHJqYc0nzhMbDhWaSM8YrqMLdJ5vICNKL/iIoKHYPfCfMKnqG8eeIo2uTmg5l6UfdEGpLykP6ZfNMU0eFIc0jVwd2bnF1/Tm7tARCIJmxIDUZWuMj5HMn+wpNTNfenfYHaIE7LRKXoufE1vr8lKP++zaVc44/hON2GCDH7bnH39ovkhqHtr783AFt3V+kRImfnLL9ViRrutHUTAvk+eol2RmgR32kXAa9zZsL8yodOksrh5ERvMxbX39EIQOXItdD4BbtDrdnzi7QLUWjE8euRCZtRsFhMFm1oQqzqpQwLK563O9YSrj8QLZvwdCmyWer1d6kGzKFPf5tqfxs0kHY0Fomyi5KJpvkd3TESBV5a8F+zowOS3XXF7ipZZMpD2BlfTy038BgTpaARsVZprIDQg68V+tnpcdATLLqzqw7oRA3O0EebWlVn9qTzPTQRaK/GylVeLU2WnSzqlFyfFAxlR4aessTJNqc+hbzTtm8UbhJbyE+ka4aTAJPiC36ozwfbGis/9mdnO3rsGmFDiJ3WhvPVxq0/GsP4j62hyjHGKLCAO6ZlzIZrf4Jy4Lkxhuif+jU49VZPIb4egxCrXUDeCylgPiGzKExD+aBNz49u61DA
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|24021099003|55001999006|51005399006|37011999003|19110799012|8060799015|5072599009|23021999003|6090799003|15080799012|1602099012|40105399003|4302099013|440099028|3412199025|10035399007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SGRuSit4d0Vqb2dRMmJrS05XRUFTMEhTMFU5S3gyMmk1Wi9odHJic1FJU2V2?=
 =?utf-8?B?bHFDUXBad0hCYldUc3ovOXcyaHVOK3AyQlVGNXVud0tlNmh3REZobXZHT3lT?=
 =?utf-8?B?ZXBSSytHdDBJeFprNDJWR3NTQ1hsWWVyQythL1NoMGJmU0tLMVZFVXYyaXo1?=
 =?utf-8?B?cnBjTWcrd0l4MG5Sd0Z5S1l2SE5sdm9nV2MxcUhXNmZaQ0pMQ29HZFdndzNN?=
 =?utf-8?B?d053NkVqVVJKblN3Ujc1cUxqZTB6Q2tndDE5OU1EZ0lKWGVPTVJsTW9HREo4?=
 =?utf-8?B?YWFNeXhrSjF6TXN6L0N5S0doeDllTllLN09CaWgrT256NTRQNytuMEVZL251?=
 =?utf-8?B?bUtPQnBHdGxKa3V6NTQ1ajJGWkxiZ0xERGwzNHBTTGhXRDRqYklkcHVBOU84?=
 =?utf-8?B?ZDByWmFRS0JjRXJIYkl3WW5xS0xwQU1zSXhLTjh1T1V6OU82OE5Wd1ppdnBG?=
 =?utf-8?B?ZlRGZnM0UGpFd2RscGpZbjd1K3pEMHA3WFhheHBLNTRKWWdKUzMyYVJMemVC?=
 =?utf-8?B?c09TTWM1anN5ZE4vajZxVkVuc1R4UC9jTy8yRHB1OTkzUGJiTDBDNmtRMXFX?=
 =?utf-8?B?eCtyNTRNZ0c5dEdCWkdDYVRLbzhSRTlQdkd0dGhRbjNHZ1M5WWVrVGg4Ymth?=
 =?utf-8?B?VUltd3Q0eEZ2SGs2OGtwR1BtYWNIVDNsOFVZbGFycUdrTEJZaExkUXduMTVC?=
 =?utf-8?B?d3orbk9zUGd1RzMvS0hhZ3BCUlB1dm93d3pYYjEyWE50KzZTV00yR21pOUdE?=
 =?utf-8?B?SVJVWUlnaUhZMGFwOThzV2JBZUIyS1lzaVVrcXFrMHR0QnQxWC9PTnhQbnYx?=
 =?utf-8?B?SXFiOFR2aEhWMnhUOUliS1hIbU9sMnIrRFpTRlJwSVhER0JnVnZmMVE4dVcv?=
 =?utf-8?B?dHVHZmJSQzhuYUZNeGlNb005U2FPSitoZzdMeXhNcndmbTgwK3JVQm1HODlW?=
 =?utf-8?B?VEhQYnFadG9FZ1JvckpxcTc1OCtkdFd0UVlkTGtSVC9QMWlQazh2SXR3VWFq?=
 =?utf-8?B?Zk9zTFVCMGU3eHZLUU1CcGJ1ejhhNDIwMitQNEFtU1kyajM3UmQ0ampSUCtD?=
 =?utf-8?B?TDhLZVhYcjY5d1o2WjBESVRpQW9VbEw1N2tTNFgxcmgxNHhMUm9ZbTQ3NGdE?=
 =?utf-8?B?cWdHbTdMVmhucVlKRFJNRHVvczZCOUhRMzZyU2NvUllZdG4zNGgrN05tYzNO?=
 =?utf-8?B?TnROakM2S0pWYVVwWnlIZnNxOFg5b2tVbVptWFN4NEs2WUMwUkcvMnNvQ2Zk?=
 =?utf-8?B?bHcvalMwdDVaMVA3NGloN0NUMU80OWhObVdqam1ROSttQnl4cS9EU1NPVzU5?=
 =?utf-8?B?N2Fpb2UrNHkvZ0c1a2pWZmF5VThLRmpJaTVzWlFpcDkwOXdYUzR3ajZ6cklk?=
 =?utf-8?B?ZHFxMmZQMy9scEVaWTVoNE9NSndBMjg2ZHk1ZFFOQm9jMjVGSmVGcmMyR3Fn?=
 =?utf-8?B?TlVTeDdwZ2R2dzdwazRJTXJDanc5cnFwWERnSkRUckJZdVB4d0djRVhIK3dJ?=
 =?utf-8?Q?6gX3xSaR5cU6h6zumBqSWj6XxpB?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eEcxdjVLZTlBM0FjcU5Xa3p4a0NVWk9SVDNsRnRJY3ovNVM2MTBLM1g1MDZy?=
 =?utf-8?B?MnBTUTBJRWVsbnMyYlJRME1DTEpQcDh0RWdQcmNSdzBRbjZ0UlRVd0ZvNUhk?=
 =?utf-8?B?SXpEMlFqWEtadk14UmlUUUVJZE0wT3RtRmgyQ204SU9URXRRR0FibmxsVWVk?=
 =?utf-8?B?eHRpUnlnVktLWXdjUHpwb3pqcUlZS3BQWHc3TjhLN2dXVFZ2UEVmUGp0SkNq?=
 =?utf-8?B?dEJFck8xWEhIclJ2Z2Z3THNtSkt2SXlhOEhxdm9pSUpDMkxlNllSUEF0UUxs?=
 =?utf-8?B?SzlhVzVFdU51K3hRczF3UkJpSGR1TVgxZHZXdG9NdFljazZaa21EZDJsdlhl?=
 =?utf-8?B?cWV1a1kxRXpZREVRUHZhdlFsdnVyOWk0bXJkUGtzU002T1JkQjdBUGd6OHEy?=
 =?utf-8?B?dkR0Nis2M01JdmFlL2M5NjB2UG1PTnlMK2FXeDdyUjExWjJIdXkzSFJ5N2Uy?=
 =?utf-8?B?bU1BNUQwdEdnTnk2RjZlaFRTNDhRcEVmcC81eXZudUxyaGkrQnlQcU9OeUh6?=
 =?utf-8?B?UWFuS2FoTGc5QXl5NTlJNE1yRWhpelNGRjVXbTc5RGtKRFhiVDUwc2FDdE5E?=
 =?utf-8?B?dHVNVnUrR2Q4MmI1NlluVXF6bENteHRwbzYweU9YMUczenNBQXhOZWowS3o3?=
 =?utf-8?B?aXFXU3RjMGtmZiszVjVRT2hNRzdJOFNQdUtGYi9MWVFVaTBFZnpSaVg5SkVi?=
 =?utf-8?B?eVo4NU1BN0lZeTdpZUhweWhZUFU0L0s0MVQ2S2NrNW5STTFxYzZMQjZ1eDg2?=
 =?utf-8?B?cmZGMFdqSlVVdnJZNEh1NW56TmU2NU1IbldKR0FrL1c5UXJlUEZtWUdxaHdo?=
 =?utf-8?B?aUwrQzBHSXlha2MzT3VoWmkveTl0UVQxK3hjMG1jM2JOOUNaR3VpSjY3emVj?=
 =?utf-8?B?VWpqZXNxNzNPVE5xTmpaYXRDdjJxWjJ5L3pXbWZiVnFIN3NERnpuVjVWUU1k?=
 =?utf-8?B?Z0V4OTVBS25HbGdWVmdnblRTTS93cE5YZlVpbXJtYkUrazhMYVI3NEZpa3NC?=
 =?utf-8?B?OEV0ZCt3NytheXlDRHFtOWg5U05CeTRoMWlRamgrZExLQ0NJNEdhVGtYSkpE?=
 =?utf-8?B?UE9MeWYveE5lajkyTzlLU0E4a3l0NmpSUDIxb0NMQ3lxQS9XWFdBTENGQnF5?=
 =?utf-8?B?aHl1QzdtZ25EM2V5aTNaQmhlUXN3eDhMTHVNMnVIWmZNZnB3NXk3WlROa3hO?=
 =?utf-8?B?TDRubkZGdWRNUUlMUEljUGp3OTNCWWR4N1VCUExmMjFyM01xRFVQK2poNTBU?=
 =?utf-8?B?M3VqSVY2MjE5bnRaMUovSUZvVTZld25seFRWUjhJakRyQXJEU3dRM1o2T3pU?=
 =?utf-8?B?QlQ3cURnczlrMWFwenlRZjBvbGR6RnZ3MVVram4rdDVGcllseWJycXJBYVRk?=
 =?utf-8?B?QWM1UE1pdnVTdURBenJjT2NiMVVwenhWblhZdURUbkxKNkQveWQvTU45VlJn?=
 =?utf-8?B?VDlPMGVpcVpCcVptNWNQcGkvNW9JczV3SmNIZWxQK0J2S245bjVDNHRYQ05w?=
 =?utf-8?B?Mk5CSVRzZjFCUXRKdUMrWWJGNXp6c0FhNEVNMjQ2YkhjVytqdmxNMlBwZUZq?=
 =?utf-8?B?YVNPUmNHbUJ2d2FyT3V1eGh6VFdhaVRaaEJ1d0tLTzlMQnpreTcxa1VaQnl5?=
 =?utf-8?B?NGdtaEw1RHIvdCt6Zmc3dTh3cEU2ekRKMVNrUUcybVVOMGtKT2MxN2t1ZFda?=
 =?utf-8?B?UFZNMlJmcEc3b1hwNVdxaTB2RlJSc09OYlJvSjk3cytTTVpadVlyZTdDaTZq?=
 =?utf-8?B?SkxtaDFDY01tNWIybzRkMWNOK2doM3k0WHJhZ2dGWTFFT1NKMVJFQ1h3enMy?=
 =?utf-8?B?QXU2RDJFMXpQVG03emFIOStlMDBwRDNNamZ5OTh0SjRuckJJNmlRdTBGazJN?=
 =?utf-8?B?cnhydHF1bndEYkJyNGN1eUpLdmZURWVuaG53RjAwd291bkE9PQ==?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a0a53a6e-b5de-4ed2-df20-08dec2eaea3f
X-MS-Exchange-CrossTenant-AuthSource: SN7PR19MB6736.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2026 10:12:14.9020
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR19MB6566
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[outlook.com,none];
	R_DKIM_ALLOW(-0.20)[outlook.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:robh@kernel.org,m:andrew@lunn.ch,m:hkallweit1@gmail.com,m:linux@armlinux.org.uk,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:f.fainelli@gmail.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:netdev@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:konrad.dybcio@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,m:ffainelli@gmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[george.moussalem@outlook.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[outlook.com];
	FORGED_MUA_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-111354-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[lunn.ch,gmail.com,armlinux.org.uk,davemloft.net,google.com,kernel.org,redhat.com,vger.kernel.org,oss.qualcomm.com];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,vger.kernel.org:from_smtp,outlook.com:dkim,outlook.com:from_mime,outlook.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D365B64736D

On 6/5/26 01:39, Rob Herring wrote:
> On Tue, Jun 02, 2026 at 10:50:37AM +0400, George Moussalem wrote:
>> Move the clock property and restriction from the ethernet-phy.yaml file
>> to the individual PHY binding files. This allows each PHY to manage its
>> own clock requirements.
>>
>> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
>> ---
>> Commit 350b7a258f20 introduced the clocks property with a restriction to
>> maximum 1 to the main ethernet-phy.yaml binding for Realtek to add an
>> optional external clock source. This is restrictive to all PHY bindings,
>> as some PHYs may require more than 1 clock such as the IPQ5018 PHY which
>> requires 2 clocks (for RX and TX).
>>
>> There are three other PHY drivers that require clock management:
>> - Micrel: requires 1 optional clock and the micrel.yaml file already
>> accomodates for the clock property.
> 
> It does? Where?

apologies, I see it's clock-names only:
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/Documentation/devicetree/bindings/net/micrel.yaml#n103

> 
>> - SMSC: requires an optional clock and the legacy bindings file
>> (smsc-lan87xx.txt) already accomodates for the clock property.
>> - BCM7xxx: requires an optional clock. I could not find a bindings file
>> for this PHY family.
> 
> Because it only uses what is defined in ethernet-phy.yaml. The only way 
> to enforce 1 clock in this case is split ethernet-phy.yaml into common 
> properties (removing the 'select') and a 'generic' phy schema that 
> selects nodes with name 'ethernet-phy' and also have no 'compatible' 
> property. Not sure if that's really worth doing. We generally try to 
> require compatible for any new phys, but that's only if they try to add 
> something to ethernet-phy.yaml so we see it.
> 
> The simple solution is you need to keep 'clocks' and make it 1-2 
> clocks. It's been how many years until we needed 2 clocks? So probably 
> some time before needing more if ever.

I'll update in next version, thanks.

> 
> Rob

thanks,
George

