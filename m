Return-Path: <linux-arm-msm+bounces-30803-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0151B96C988
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Sep 2024 23:26:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7A4211F2661D
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Sep 2024 21:26:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8512156231;
	Wed,  4 Sep 2024 21:26:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="X6AGDguY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2041.outbound.protection.outlook.com [40.107.92.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D57921514F8;
	Wed,  4 Sep 2024 21:26:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725485184; cv=fail; b=gtZXfmPm8joYZektHyGG868geX0KQfHojr/TL8oUO0F47mPluBk5sHYn0sPVU1Re7MTZS2cqoK0V5aAz0sRStewbMXZsy6ccKtmbSqeqPS0VQgt9DIFalGKkqkZKrFUrYFBqpNRgh7xZJwmkPhRTBQmCEXBRlNPwpn4GM1y0rMg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725485184; c=relaxed/simple;
	bh=T7ZsuG5N4+Y58HmuhVKHe1Dl1bYXxxCiQ7xBRlNJY3Y=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=LdPvpENSjQH9b20v5aQSFViySHbOqX6CXuCfyoXdm45ZaIHSGdhHDQcqhMRo128fdMMwxhQx3K5lLH/vwUWGwiOLICi5urwnBDO1W4h1q34uY0MRk1W6hZnHNAfEbT3hS1ayw6/kyIoTD34PQw7RcZ9nXakH5qujfqotMmG3+/w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=X6AGDguY; arc=fail smtp.client-ip=40.107.92.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PQa9Mc39a1ZwydlQFDs5wQewmqQ4Isn2G/CXDImm/keef2k3/KwEIalU9TPvv/7oDZMDqXR99UTtNJbsF6izcK2G+DXzZ0WJRylEBwSaMjqIa1T6Ni0yOlp1KxjUzE7JRtn/c5HZEQAqUmn4UmogLWszMdVmGUiyGAXaNpy3MmG+6AR9my4OodTatPT1v5F+OvySKqUGqTlb6/9bWYN5r8X9XQ9W8xg12TO2TYjMgS6ZOK574PO/jdbrSO2D6CrAORpjSyE2f/daq6NZHLVkaVXZgm/+/vFBh6JxIR1TXGHFbpP/jbJmiqYwy5UnkG/en8CoapLUJeTkcJ60jV+Tsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zRceWJIKsJ1On1IWVcFs4q78O0vP5BAhlyiQq1i28dk=;
 b=kevtC34gr9I8R+yhkCeBSh03vcnkPD/khFB8LyYqfJRCGDnd3DNLbxZW60/MBwiVFk3YD0sKXxgxz9g9EUp+x/mlanH4LvLPqVgCHFZPKiAoMwj8vNpYUuufiCrwGSRALEbvff74zwOZz4IOUD1fa5LJZFC7fIMahzkc0mEn76bpsEBYOdEX5mTuRemNaPz43dSZwTXskBvbEgas1eavvdjGg0+wXNLXJ/tpNp2F6gKHM5IFpQr83j9KkCt15NnSdedzR7EBtHRvtL4NFKgQ9xuxqmFU0Deq4IihsN2JYzIQyr4Q5zrpdnL2l+EXo3Rch6nEdn83F7brjjDlShlCYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zRceWJIKsJ1On1IWVcFs4q78O0vP5BAhlyiQq1i28dk=;
 b=X6AGDguYQEVuzIFozafBLGhxPPfuJ/u8HbwWZ7kIeyjxF79c62ZAGzsVnImCmivz21uZQuI4QJADnnWg6w04mJryI4g4wYENHmFvMXQbuY5unMeDfDSGButLRalj9+bIAdAnp8HHx1m3Wo1EUEpDzXVOOEU/Kn7YyC9w7ST2WH/ioTnSIShkCL7n6ZdTzxpGzxZq83X8JSUeLPDJ4SYuJwvwD/vQ26zXPkEt2qKY2dzx57nsQo6t5paeFlpKQYIGlD2wnTBEAncRjQWDpuGAWq5F6rnxIMYq2q74DrXohRTez9byKVh9c3bvdyICEAKXb/Td98WTOCoE52QNRDnyQQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM8PR12MB5447.namprd12.prod.outlook.com (2603:10b6:8:36::7) by
 SA1PR12MB6995.namprd12.prod.outlook.com (2603:10b6:806:24e::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.27; Wed, 4 Sep
 2024 21:26:14 +0000
Received: from DM8PR12MB5447.namprd12.prod.outlook.com
 ([fe80::5f8:82ee:7da9:219b]) by DM8PR12MB5447.namprd12.prod.outlook.com
 ([fe80::5f8:82ee:7da9:219b%4]) with mapi id 15.20.7918.024; Wed, 4 Sep 2024
 21:26:14 +0000
Message-ID: <5b24f86a-b2cc-4c36-aa2f-2a01cbae12fa@nvidia.com>
Date: Wed, 4 Sep 2024 22:26:09 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: clk-alpha-pll: Replace divide operator with
 comparison
To: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, Ajit Pandey <quic_ajipan@quicinc.com>,
 Imran Shaik <quic_imrashai@quicinc.com>, Taniya Das <quic_tdas@quicinc.com>,
 Jagadeesh Kona <quic_jkona@quicinc.com>, kernel test robot <lkp@intel.com>,
 Dan Carpenter <dan.carpenter@linaro.org>,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
References: <20240813094035.974317-1-quic_skakitap@quicinc.com>
 <4d314b61-7483-4ceb-ac72-10dbd7e4522a@linaro.org>
 <7733a4ca-330b-4127-af12-33f376fbbc47@nvidia.com>
 <a995743c-f208-4afc-95da-449fdc7fab2b@quicinc.com>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <a995743c-f208-4afc-95da-449fdc7fab2b@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0628.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:294::6) To DM8PR12MB5447.namprd12.prod.outlook.com
 (2603:10b6:8:36::7)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR12MB5447:EE_|SA1PR12MB6995:EE_
X-MS-Office365-Filtering-Correlation-Id: d444ddb2-65c9-4757-ebbf-08dccd283497
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?N0V1T1RBWTVialB5VXhnSXVsVlJXT0NiWEVVZHlZdHdzMSsvczR2UktqTUg3?=
 =?utf-8?B?YzVuU3c5WTlKOVJUSFJiSmxEdzZrQ3Bac3oweVJjTzNvV1g0dHk3czlnTXdE?=
 =?utf-8?B?NTJJa0gxWGtIZ3hLVmw4VXd6bHYySGpja3lWNnNDaFhXb0gxc1A2UDFvQnk4?=
 =?utf-8?B?aFl3NkhMZWRLdyt5a280cUZXL0tXaldxZnpMNGhRNThleERuNHI2VFhFcklk?=
 =?utf-8?B?a1NXSnJkK2ZiOHVLelFVYUsxRXFLUlpDbFI3Y1RSMmt4dkNxamgzYStBTmMv?=
 =?utf-8?B?NGZnT1JDWVIyczBSZFdabGdZcmtibnIwd2JuRFNVTDRuR3ZkeWw1ekp6ejVy?=
 =?utf-8?B?K2NLd05UeHpqQnlyUWp2R1NRUkR2UXpvMGcrbGpscTlaQVEra3hwcFkrYkFT?=
 =?utf-8?B?RWNTMGtyMEUzQXVpQ2hEbmpROFAyd1JFRVMzNm43OTA0WVRJMWgraStGWDQw?=
 =?utf-8?B?QjcvZjJKNmlkVlMwazFkOWpWTVBTL0NtQkduYjFwS2NGSGdDKy9Tdi9NS0hW?=
 =?utf-8?B?WlBOM3V6anlaZitXVnJBb1ZVZDk0bW40TnpYUWJ0Qm1DMkp5bkdHbkNPUHNt?=
 =?utf-8?B?S2haazVCR1ptLy9VUS9CeXlJaTVtckhmMlR3VW5pRHo0TlBuTGkyaFlYYllm?=
 =?utf-8?B?V2RRcGJ4RlljOFBsK29uazVvTXMzRURoUS9zQUZVNlB1SXkzK0JMdVJHVjFk?=
 =?utf-8?B?RUNZTjBZSnJjeXpDUFFCcmdQUjFmRG1UMmlublFRVVlOaHdFODNmVnd0LzUw?=
 =?utf-8?B?OFowcjBTSkxoMG5ad1h2U2VKMmUzMlE1TVBaYzJ3Um8wQVk5Zk1zNEl5NWdx?=
 =?utf-8?B?ZUF2SThLalNDSWZRazUrZlI3c0JmTStsQzFIdzM5RzlNTXBTOHJ2TGoyWTlL?=
 =?utf-8?B?Zi9DS3ZmeHRNVzB3QnZKakZqZkhucEMxYm1XM2QwRkdoK0szS2dOdjVOZGNq?=
 =?utf-8?B?ekpKRVJRZE9iTm1Lb1NjejhYOXlEOGl0OElrM1NnSGpIeDB6OTFRUGNPNThU?=
 =?utf-8?B?NDVhek9qMVhPbVNTUVFLZUpwMUtZTUJ5YzlMOXZ4Q1dNZlVjS3dZS25CY1Uy?=
 =?utf-8?B?em14eTdtYzMxamVZQ1Zna0ZWaUQ3MTRxeVRRVStTbTRzV0x0VEVmakFTUEFF?=
 =?utf-8?B?aTdGVWdKQnhKdERpSmt3eHNRZDVndUNGV21kTHZFQ2VpOUtrL0E1YWhIamk2?=
 =?utf-8?B?UTEzekhiRkoySnpmREhwdmhxSm5UV1pSWjRiV1UzS2FtM3BZZmdCQXFnRzhY?=
 =?utf-8?B?dTd0M1lzMGJ3bzAxdnpKUy9jQWoraHdqb2cvbk85Yi9xcHlkRFg1dTJ1emJV?=
 =?utf-8?B?NVUvNmUxTi9EZGpDWUNpNzB5Q0FaL0VQbWVVWjFLUHdQNzRqOE1BaGN2QWpL?=
 =?utf-8?B?ZlpwVzY2MzRjTHFiU3RWbEM1cDAzVERiQWlHRUNqeGM5SWlqbmF3cy9FRzNF?=
 =?utf-8?B?MzIrRHFkWWFCYkVlVDNwVnVYYlJYUVpUZWc3NnJqZ2FDejBaT0toT2xOZzYy?=
 =?utf-8?B?WVpZdlB3L3dxcUtSaEdBVHo3Q096dFdRS1J6d2tTaU9yTmROOXJta3VDZ0hw?=
 =?utf-8?B?Z2VHSkMwdFJBZDFnREUxZjYzOFhuZGtlSklBNEF5enN3UVpaaDIrT01UalRo?=
 =?utf-8?B?M0ZxTGtpeXU1c2hJeW5wRzZ0UVVWVU9lVXpEa2tUcnMwQTQwLzl4d2ZkVVpQ?=
 =?utf-8?B?OFBwdGRYRVFVVFhiRndVOWIrZTJBS2lqL1BtbDIxRTlyMFQ0aFBHRE15VlFN?=
 =?utf-8?B?UE5uU1R3SkQyT2VodFhEOG1BM0RrQ25PZVUyV3VTYXhVUk9JQVVrKzhlY0Rw?=
 =?utf-8?Q?Iz2IovyiN3/hU+00Qzb7BL5Acl7GwjrJGoUGI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR12MB5447.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?emRjdVVka3k5TW8vb3lHa2IzVUJNUXFxRzhCYXFhWnpkM1lWVkRQZ2JDVzBN?=
 =?utf-8?B?bEhRSXV2bTdtRy9qekFQYVBBdHZMRjN1U0F1MjFVZzFRTUxiWHVTMWhuV0RL?=
 =?utf-8?B?THFhTlZFTStSSkF0TDBKczJ4NHlqbG8rQVgzWFFjeGNtbGF5U244Q2RiSnV4?=
 =?utf-8?B?aTJhUmJCWUoyeGVHSEtzODBPQ0YzS2Vlb2JGMkZFMFhLODd2UE9CSWM1YnZv?=
 =?utf-8?B?MjlhZk1RM3VCK0FOejNOaFVFTVZHT2lIekhYbmM5TE1EeWd2eWd2eTZTVlZ4?=
 =?utf-8?B?c2tmUnRrRDl1MkhOM0I1Z3BpUXQ3dkpmdjBvTm5QRDlDbHdISTFOVnM2OUFy?=
 =?utf-8?B?M0NubE5wSnVlTjBTaHVueU1XaXRLQjhkSitmcGpoUVJpamRJSy9tVlFxMytO?=
 =?utf-8?B?QTc1eFNMK2czeC9JdGJyM0k3VWlTWVl0eDBmKzhVUFlBUVFoUjhSbTgrdWx0?=
 =?utf-8?B?MDZDa2tUUC9vTlluUFB4eW5adjJZRGNFM3VGR1FITWpGTHhZazVOcXYyZHdy?=
 =?utf-8?B?b1M3eUYzdU1BdGZiRGdGWUpzL2tzQWlkZlpFKzZybDhHOWhidXJIU3B2Yzk5?=
 =?utf-8?B?ZDRLaUxTZ25LTFh3cEhndjdxcmZtU2xucFNFVnU4NSt5RW9leW0rb2s1bWZs?=
 =?utf-8?B?WUt5NC84UkJjLzlVY0xoSmx6RDQyRy8wVlFlaTY3aklnVVZMV3NpUXZOZlN1?=
 =?utf-8?B?MHRoWEJNNmlWRS9Bck9DdkVZV2M4cEd1YWF4RXhVS1JyR1ptSy9pSGhQc240?=
 =?utf-8?B?QWpYUklEc3g3VXJmNWtHVlJ1Nnl6aXJwbW9aQTVLWnpCcDZ0QXQ4Tmdjc3hq?=
 =?utf-8?B?QzM1VFMvQTl6RmF6b21nQlo5UUcrZzQwMitWRFZoTDUveVJtNFV6aUpHYVAy?=
 =?utf-8?B?bGNBWVZJOFltWmpQa211dVNzOVpNc1UvTlNlWlVKVG14dXhWbis4SFc1Skdl?=
 =?utf-8?B?dnJKVjA3ZHhiOFZ2aEI0QitrbVpyWXRwRkt0OGkydi9kRVhJYnhDd0Nlajky?=
 =?utf-8?B?bUo1cGY4YUF5VjFLeTIyUGpwSk50SjZBQUJOYm5vZWZzZDZ0R0JqOHdOaDk2?=
 =?utf-8?B?SWFla3lhakx0OTk1bzhvL3M0ZnkrL2Rnc2tTVjJ5aXREVUUxamQ0VzJKUllQ?=
 =?utf-8?B?a3FrRHZjK25PMFEraFptQk8yV1VXUFlZWmtYOFZ4d2RRTUZtTmxGeHVpaDg3?=
 =?utf-8?B?NE1pVlN5NG50Rk0xdmVzeUZsdDJjQWJLdC9iK2d5K3gvdHdSQitIRi9YWDNJ?=
 =?utf-8?B?STJ5SW5pNVVJcm5sbDhZL3Joc3UwUml1OVJkUC9aMmZzV2pQd2RuVnNPUmxQ?=
 =?utf-8?B?TDVqYzA0b2J6cmhzbkRlMXIzQ3FFQy81N2dITVYzMnI4aFA1eFMza2tXY0hK?=
 =?utf-8?B?QnMrejdOVHVPRm9Kc0RBK25GRkxOb1F5L3hlSFVTeStxS1J3SklaSUNRbEhM?=
 =?utf-8?B?VHVmeEtIRnIxdC84VDg3U2ZMbllKalZuTklRbFZtVnFFRlFuT1djYk5IanFT?=
 =?utf-8?B?WVNQV3hTK1FDSlhHUjFDT2hxelp6NXkvRE04MlhJYk1SL2RsSDk4enAxOUpC?=
 =?utf-8?B?MWZ1ODVYcXNpVEMrWXFRb2tmajA5MFdkZE1pT3RRb3VwWFV0Y3pNanh2TVk0?=
 =?utf-8?B?a2xrYXozY3VpSnRrTkxFS2pJR205NlhHcjVNKzlzdldpMTgvYkdlMXM2d3NO?=
 =?utf-8?B?ZW11UUlpZEN6Y2h2MDJvakZaOEpHMmFDbHk2T0NUZk5kU0IzeFFReHpBZGhk?=
 =?utf-8?B?T2VjZ2EwUnJlblJBNVNrSDVPKytPMEFMdGJGR2tSYnRpWTB0QTlrYlYwV3Jl?=
 =?utf-8?B?aWRUSUY1TTVheEhBZFpuVWtMYXp0SXYrbUp5T3NQU1BDVEZrMUlsL25RaE9x?=
 =?utf-8?B?MG5sVEFpeXRvcUFmZVlMVElQRitacGMxd3ZXYjRSMk42dmZYcmRiRmhHeXZw?=
 =?utf-8?B?ZitKb3lZNEsvay8ydm1wYmZ4bXZCS2FPNUtzT0IrbmcraGkvOTVEak85VWN6?=
 =?utf-8?B?UXZCWHhlQzJyN3hPaGo4MG1SOEJFeGdHMS9kYnN1RXdJMmpBakZjaDF6dFJ1?=
 =?utf-8?B?NFYwWkFoanhEWUc3N1hUYzhTS1ZqcWo4OUhVeXh2U0FsdmUvaXhDTXpoUEVz?=
 =?utf-8?B?aVhlejdtQ1pGSTlYYm1IVlBXRXdqZ1krVE81N2NnQUpMRXJTc2ZBd2xQemNR?=
 =?utf-8?B?eXIwUW15Q0ZKODhWR3lsNm1SdHYzcUZPRklsWjY5NDQ0ZnYrYTlPWERhRnU1?=
 =?utf-8?B?TDBVMk1sNXRrNFB2SXRKQ0pTeHFBPT0=?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d444ddb2-65c9-4757-ebbf-08dccd283497
X-MS-Exchange-CrossTenant-AuthSource: DM8PR12MB5447.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2024 21:26:14.6754
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IKY8tiSXMAhgUSzohEqk4WQGrf14mEsWQNYlfMtJWRSkUPSX/SZtHoHbS6QsR7atk8ZnK1Zd+YDhnrkrZjf8bg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6995

Hi Satya,

On 30/08/2024 06:33, Satya Priya Kakitapalli wrote:
> Hi Jon,
> 
> 
> On 8/28/2024 7:17 PM, Jon Hunter wrote:
>> Hi Satya, Vladimir,
>>
>> On 13/08/2024 21:01, Vladimir Zapolskiy wrote:
>>> On 8/13/24 12:40, Satya Priya Kakitapalli wrote:
>>>> In zonda_pll_adjust_l_val() replace the divide operator with comparison
>>>> operator since comparisons are faster than divisions.
>>>>
>>>> Fixes: f4973130d255 ("clk: qcom: clk-alpha-pll: Update set_rate for 
>>>> Zonda PLL")
>>>
>>> Apparently the change is not a fix, therefore I believe the Fixes tag
>>> shall be removed.
>>
>>
>> From the commit message it is not clear that this is a fix, but I
>> believe that it is. With the current -next I am seeing the following
>> build error (with GCC 7.3.1) on ARM ...
>>
>> drivers/clk/qcom/clk-alpha-pll.o: In function `clk_zonda_pll_set_rate':
>> clk-alpha-pll.c:(.text+0x45dc): undefined reference to `__aeabi_uldivmod'
>>
>>>> Reported-by: kernel test robot <lkp@intel.com>
>>>> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
>>>> Closes: https://lore.kernel.org/r/202408110724.8pqbpDiD-lkp@intel.com/
>>
>> There is also the above smatch warning that was reported.
>>
>>>> Signed-off-by: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
>>>> ---
>>>>   drivers/clk/qcom/clk-alpha-pll.c | 2 +-
>>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/clk/qcom/clk-alpha-pll.c 
>>>> b/drivers/clk/qcom/clk-alpha-pll.c
>>>> index 2f620ccb41cb..fd8a82bb3690 100644
>>>> --- a/drivers/clk/qcom/clk-alpha-pll.c
>>>> +++ b/drivers/clk/qcom/clk-alpha-pll.c
>>>> @@ -2126,7 +2126,7 @@ static void zonda_pll_adjust_l_val(unsigned 
>>>> long rate, unsigned long prate, u32
>>>>       remainder = do_div(quotient, prate);
>>>>       *l = quotient;
>>>
>>> Since it's not a fix, but a simplification, you may wish to remove
>>> an unnecessary 'quotient' local variable:
>>>
>>> remainder = do_div(rate, prate);
>>>
>>>> -    if ((remainder * 2) / prate)
>>>> +    if ((remainder * 2) >= prate)
>>>>           *l = *l + 1;
>>>
>>> *l = rate + (u32)(remainder * 2 >= prate);
>>
>>
>> The above change does fix this build error for me.
>>
>> Satya, did you intend this to be a fix? Can we get this into -next?
>>
> 
> Yes, I have posted a v2 for this last week, but there are few open 
> comments on that, I'll address them and post V3 including the build 
> error you reported in commit-text.
> 
> 
> [v2] 
> https://lore.kernel.org/linux-clk/20240814102005.33493-1-quic_skakitap@quicinc.com/


Have you push a V3 yet?

Thanks
Jon

-- 
nvpublic

