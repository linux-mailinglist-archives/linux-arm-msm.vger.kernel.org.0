Return-Path: <linux-arm-msm+bounces-93428-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SGSlEsJLl2m2wQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93428-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Feb 2026 18:43:30 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E76AA1615BA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Feb 2026 18:43:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A50773013267
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Feb 2026 17:42:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3226634FF44;
	Thu, 19 Feb 2026 17:42:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="pjwbUfzD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012034.outbound.protection.outlook.com [52.101.53.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D67DB262808;
	Thu, 19 Feb 2026 17:42:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.34
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771522972; cv=fail; b=dYWA4mwJt7K8GjF7j/GxeVkfyMhgODK6iEafh9aLwTfmsHW7gMx7/WXSPhdbdjQmioGL8yWoMbsYSq/TL3+7u7R3AkXcsRTScVj403GCbFyTllolMJSqLFD0Ex7nU6yviNfllHJuzSSGWZB6Ru6q2PFNcS2HElXo7OWw8LLQ5Jk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771522972; c=relaxed/simple;
	bh=KGMeD3H4QONYT3FsEF8o8w4P93sgjZcIOoKZITFVY20=;
	h=Message-ID:Date:Subject:From:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=iAZlXDKGJrbUERXeJM8tKYYzalsVn2uvD6893d9GcVdMWe5YDjixGmzrCbAZd4MD1QgmuLdOBUmLLpBetHfQ0G/acBQ+BUOaL7GBCrRe4UjJcOT0x1EsnzbpJD/tt39JQkxsnRkI9wG+gZP5Q4W74mMYWwOBGUIsmgRoCVMk8D4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=pjwbUfzD; arc=fail smtp.client-ip=52.101.53.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cM0MmH9wHlhStNojzVTTCPQH7jchvRrZWu33pzDS4Hpjw92ay7PyuFwsNJ9I83EbzE89XZJb8F+U476D4F8ej7W2EkAAbwLy6zBl168QhHd1PxKumNK/nQpfiBe6K7TL3nSgwPxN8/Hp4BYdEagWxqUEIF717gqmMZ8RSTj2OAIZS8NleyvSVK1H7/lNG5cqB8kgSy/VjIH5GJbDASrt+HxCB2udnGb99+9oEek3jFlanHy+xZWaTM3jbNxmFa4j+zd7bt1PR1IE8pv8hBUbdmhK8JAIVWSIxnMdIkf+6XSyNJ4zbeneha8RiuUFrvF6mM6OiriROr9/izq48QeTZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y/kZabprSJeXpovLoHk81MrRkr/7R6ZzIuO9xD7v0sc=;
 b=N5Ml90E+wyyDuP6flVBSOlysk76Op/BWxKhWiHyAcHpNm5Cz7552IpaG5p9X+wwj770UKJu05pmeYpZzaRtKwWqKjA8XuEBnPhl0RPVSY0mR1tZb/sXLwZCnF/bXDlzXEg93Qd2CgxlHWeVX6xw3/+bmeDkt+Dd1id8w2nycNH1jJim53paitRDK0xpj1VbQfOkwzzyFe4I9U7F/EOu5MOOb92y5GCTCc4Q8DuM/+LOHOPVGh5QmmQj06HLSzKsDl+kRMXH/tsKZ+2hc1tu0xC2xMOU9DArrXosP9dJl/N9wTvAc7V4Ms6d9Pwsl0Dd3q8varkkjkl2sPei69DFjqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y/kZabprSJeXpovLoHk81MrRkr/7R6ZzIuO9xD7v0sc=;
 b=pjwbUfzDmYB8rh9981RvWCEPnPJ9rdcrhPvkyylr+JO1HBgZHDmeupu9HNx3OvG3DGAcTO0K/mXa0dWTFscJXoQlqxttTevs7TGfSiagEFADw286w38tKPxsiopGnHYnutgDSbveZx+vAQ5YvhYINfBk6hgmzUEea1VBOIAqL7UawkSokahil6ZvscbgnbqmRFNeOcGo7CiDs2qkbYFu86mYn+1hR3UqCRfR5HlEKVDvp3CGBLZep9K86N+MzgZ+WpN6zCEo3iijZqeFfVJtQJrqCHH1kND1jYNamNJgiFAu7lruSgTEUHzfvly363LWQec2YWQ9gi1PJvadFC0F6Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS2PR12MB9750.namprd12.prod.outlook.com (2603:10b6:8:2b0::12)
 by CYXPR12MB9427.namprd12.prod.outlook.com (2603:10b6:930:d6::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.15; Thu, 19 Feb
 2026 17:42:45 +0000
Received: from DS2PR12MB9750.namprd12.prod.outlook.com
 ([fe80::56a8:d6bf:e24c:b391]) by DS2PR12MB9750.namprd12.prod.outlook.com
 ([fe80::56a8:d6bf:e24c:b391%5]) with mapi id 15.20.9632.015; Thu, 19 Feb 2026
 17:42:44 +0000
Message-ID: <cf1e685a-a1cb-45ec-bdc3-1ef1a3d1044e@nvidia.com>
Date: Thu, 19 Feb 2026 17:42:37 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] PCI/ASPM: Override the ASPM and Clock PM states
 set by BIOS for devicetree platforms
From: Jon Hunter <jonathanh@nvidia.com>
To: Manivannan Sadhasivam <mani@kernel.org>,
 Manikanta Maddireddy <mmaddireddy@nvidia.com>
Cc: krishna.chundru@oss.qualcomm.com, Bjorn Helgaas <helgaas@kernel.org>,
 manivannan.sadhasivam@oss.qualcomm.com, Bjorn Helgaas <bhelgaas@google.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Rob Herring <robh@kernel.org>, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 "David E. Box" <david.e.box@linux.intel.com>,
 Kai-Heng Feng <kai.heng.feng@canonical.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Heiner Kallweit <hkallweit1@gmail.com>,
 Chia-Lin Kao <acelan.kao@canonical.com>,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
 Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@kernel.dk>,
 Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>,
 linux-nvme@lists.infradead.org
References: <7306256a-b380-489b-8248-b774e6d3d80e@nvidia.com>
 <20260122152903.GA1247682@bhelgaas>
 <5z7c25nkb35prvax6vq6ud7eaeuhzsswbf7fqvmlgys3xftgwb@odocboejrdrv>
 <e44c330b-778b-4fa1-b678-fa909cc05b03@nvidia.com>
 <bf37b6a5-268d-4c07-a536-a826b3d5953b@nvidia.com>
 <unc5zefwndgcv7wufaezz3gkg3qtaymkjlmymhyqdqwzn3wybl@ow2rhbyt772h>
 <f9ac8c8f-8959-416b-ba90-14f0886c5bc0@nvidia.com>
 <a5m4pqtiaxsq5lmq64roro633ganbeq7mypa5ojuuqy4npkvok@wcogdbzaq6xe>
 <7157c68e-97f3-43b0-bfb5-e271a8f2a4b8@nvidia.com>
Content-Language: en-US
In-Reply-To: <7157c68e-97f3-43b0-bfb5-e271a8f2a4b8@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P265CA0179.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:311::7) To DS2PR12MB9750.namprd12.prod.outlook.com
 (2603:10b6:8:2b0::12)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PR12MB9750:EE_|CYXPR12MB9427:EE_
X-MS-Office365-Filtering-Correlation-Id: 6261c227-f49c-4596-af93-08de6fde49b6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?emhIWEZteXlpVG1mYnRtcHJHblNBRnZZRDJtSTFKMkljMWlVeU1Ka3VSb3BJ?=
 =?utf-8?B?RThieHJqTGZPQmwyUmZTUHdGOEFyT3R5Q1FKTW9hTkt1SEJEcHlNUnpUVUFl?=
 =?utf-8?B?cW4yQWEwQ01UTlRrSFc5WXVRMXlKU1FkR05nWDQ2anVSVUZLN0o5MnlMQWth?=
 =?utf-8?B?WmFncGlFZ28yYzgxdE5ublg1TmRGdlF0dmhEekNiTndKVmVoN2QrYnVkVWNS?=
 =?utf-8?B?Y0hoSUxwVHJzQnJWUUVKMUlOaUllUjlXdHV1emt4dnQydE5NNVhxdmY1dUM1?=
 =?utf-8?B?RStUUmVyMXpUVkpYWVZmd0xlQmUyQVcxUmJlVzBjQTNWOTdtSjN5WUVmSnp0?=
 =?utf-8?B?SHF4eGQ0YlVub1NWRFRCckN0ZThabDlHNmlYVk1JVUhsMFhLMlc2c21wOC9t?=
 =?utf-8?B?ZHk0N3lBcnJPOHR0SE1MUUNWc2JrQk01Sm4wV3dOYk1jZmlHTzlDN1I3dStm?=
 =?utf-8?B?K3ZGUXpHY0JKZVZ5MHkvZFhyMjFVV2hGRHAzMURCTkxFV0hsNThwZjZwQ0xo?=
 =?utf-8?B?N0czY0VSMzM3YXpJWlJlMXd6dzBNaDdxSFQyMlEyd1ZqTWxpV3d3N0w2dG02?=
 =?utf-8?B?Mmx2V0g1djBJZy9DL2FNdUl0QnNGYzVLd3RxaEdxakFzaDNtZlBOdkhaWnBj?=
 =?utf-8?B?ZlBJS2JGK2ZGVjFuVk94U1NTV0ZXVnllNHpibXJZKzE0YklNVXU4eHBzajhw?=
 =?utf-8?B?UklwNUZJMWJmMUpNWVlJMlJDdmxYMzAwczJqQWtWd1puUUMwYzVlVm9BVlJH?=
 =?utf-8?B?c2UyQmp2bFhIZkxSeklRVmJkbEJ2Y21wb3gwamZGTEpReUdQb3hKeCtKSnRy?=
 =?utf-8?B?TVVaVEc2aGYzc3piWk1sY1BXNU5EVlV6WEJrSW5XeHVCSXhJOGFPVlJmQ21J?=
 =?utf-8?B?dmFZSGcwZUNFeWpNUllIdWRrM3JsU0Exb3JoQk9Rb1EvbUhlQ24wczNPeEVj?=
 =?utf-8?B?NXpueG9NRHJxNmNyUmRabTNVUHBZeVVRMTBQNGdvdVA2bkhUdERLSVdCR2FU?=
 =?utf-8?B?WC93aHRFYkcxQUlhYzBOczRVWmg1QU81Ulh6cC9vcXB0RWdVNndQNW9xc2ha?=
 =?utf-8?B?SHBSQVBuVzdIY3dXR3RBRVdmaHNoUEF2cXlCUmRna0xqblFLWWVub0gvU1Ez?=
 =?utf-8?B?Vm1sRTR0QmpzTXBOUnIzdG9KVzdMZnlLV1lqY1RmWUFmSFYvMFFTclNHZEdP?=
 =?utf-8?B?ZExGTDhPdW5ZMDZKQzM0blRvSnVrTXlnemhOejZMNnVwZUdiLzlUMGgvSUsx?=
 =?utf-8?B?Q1ZaOE12anNwTkhScUM4RHVtMGl2QkdVQ0l0RXgzaVBlZmJ5ekZ0NDBSVE5I?=
 =?utf-8?B?cXB3N2hKUGM2N1U1b0NwakJLY05ZdFBQY3JuenBsUnh4bkdDUEdzZEwrWnZh?=
 =?utf-8?B?UlFKeXV3RjNqMXliTGNiOVBCdThrOXdVaWd4OTJ5eTV2K1c2VklweTFPOHJX?=
 =?utf-8?B?NlR4M29FYjE4b0grQWpnWXlWWGJ5MzFWV010cXdsVy9UQlIrQjRobS9ocVYv?=
 =?utf-8?B?OUN5S25oVmd3VzFoYzBkNVNaMjRxRGNsM2l0MHBMVDNEbW9sT2RSWWZuOEJT?=
 =?utf-8?B?ZkFKN0ZUKy9qSmcvUFlHMDh0RlhKK1d6ZVZoNVQ5emk1OGs3aGtKZ2NMZURa?=
 =?utf-8?B?NWdqbFE1cWNZWkl4WDY1eXBOb2VzTE84SVVDeXZRQWZETGtMQ0J0U0tZTjh0?=
 =?utf-8?B?RFhZWlBsR0xZaWxyT0l0dG1yRFZQeWMxYVdkKzZxbEpkQm5wSmR4c2w0T3J2?=
 =?utf-8?B?OSs1cFJta3pFL2xnRW5taFdUeU8yRmJ3OUMzYm16Nk9BeDBPUEpDZFRubG5n?=
 =?utf-8?B?bk5kbGtGbjArTGhHeWJRc1FOTFJDRzYzNEd3Y29rQTVOWkZCMGY1bUVueWNt?=
 =?utf-8?B?emhrVXEzZ2ZnakVwRzNiTTg3djhHMlJpc0N6WTdjMXE3Rks5cWZYbS9Mck5r?=
 =?utf-8?B?bUhzYUd1aXZnL2RmQ0RnU1BjM0Nzb0JrS2xFSVpubFlhUmZudzdLV3lpRkxn?=
 =?utf-8?B?QU1LNlhXeENHQzN3OVRXR1NITDJhcDVySWVwVHY4Tk8zdGgrNHFFSkFjekNP?=
 =?utf-8?B?M1d5M1hlTm9RRnpia3dPZG5Fa0UxVjBoQmN5c2ErMGQxVXhoMjhRMnFrSFRv?=
 =?utf-8?Q?8CNs=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS2PR12MB9750.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ck1wTURYYzBYWU9rb3VzeW5pQUl5ZnpNZVNlajlzczgydTdZdkthWW9sVWNr?=
 =?utf-8?B?eXlveER6NFkrbU9aeVpFaUMxWW4vQ3pSNW9HSGxjT1NadFJLSVhLNWNzU0hO?=
 =?utf-8?B?YXNvU1l1Y2d3OFI2SU5KRzMwRkNwdklRWDhMMUtIMkhDQTNXcWhHWVloRFBQ?=
 =?utf-8?B?L3hTaVBSQjlYSEVqblp1ZmFScG1LTSs5MnU5TzJTaHdXcmZUdDZXQk9WY0JY?=
 =?utf-8?B?UFFBMFNDcjdyQ1c4ZEV6MHFBTVVoNGNHUVJEZkxxRUZwZ21NK1dVZDF3dzYw?=
 =?utf-8?B?Q0NIR3ZOT3p6a1FxeDNqT2FudHhNV1hYNThOZW84bU4zRDh6Sm0rN1JJc2oz?=
 =?utf-8?B?Szd0ejZBUU5pcGtMZjZ0bmZYV0ZDQVNLanhVbHgxMm9JalQ1YkxaYlNBUkw4?=
 =?utf-8?B?ME10dFAvS0FJRnczVklUT2tockhqQ2Z6RWlNSmZmV0VmV3BpS3VnUEoyMFRW?=
 =?utf-8?B?NzBnMDhjbHJkNzBBRnFiNmg4Y1IwNXFLdml6cVoxQVVFYzRIdXFqeUJCZlVY?=
 =?utf-8?B?bzJLWWRsTGZCWVVmTGVqWWFwMC90ZGdob09ER2lhdHo4a3hJQmhZQWNKVnRW?=
 =?utf-8?B?SG9rMURBUjRBTXlsYURVNWQrRC9TbXBuQ1ZqSXdVRUZjS1MxbEdlL1pTNDkv?=
 =?utf-8?B?aVdYUjB3UGlnb1krZW84cFM1UkNXdW5aM0dRZURndXVtSzFMNGpvcWtKRklZ?=
 =?utf-8?B?aWlLN3dtQnV1SHNKaFlLV25RL3I1bVZaMC9oUUY3b2JNZE5MMUZsWGxFZ3ll?=
 =?utf-8?B?MVlGQ2lSOFNYNVBDd1dTQmYwUXlVSkdONkRZR013amlwbjlYMUd5bzJ5OXMx?=
 =?utf-8?B?RXFxKzNZTzVzeXdtK2pmditZbzB1ell4Q0MxSUV2MVdTNERhbm9ITG9iNEhu?=
 =?utf-8?B?Y3hKNDRpM2ZvaTl0UFRqK25iNk5hK2FvSnV0U0VuVW8zaGZDMzVyRVQ5SjY0?=
 =?utf-8?B?QkY2TnhKczkxM3ZFMFVjQWRSY0hnbHRVQVVyUG5kNmtGVFZyNFRhVjRkYkZm?=
 =?utf-8?B?TnpreDNtYmwvQ2ZVZzhhTWNCWUQ3VjkwQ201UWRrOW5mNkI0N2o1SzlkeXdW?=
 =?utf-8?B?WVRXNG1hQ0l4L0VhK2FHR3NoTWdtZGlqR1o3bVQ4VUduK0dUUUVwdFF2aCts?=
 =?utf-8?B?WE94ckdMd3dxajMvRXFrZzJ3QkNjSGdUTXVjNFJtaTNmNWFqa1pPdEFDdHF6?=
 =?utf-8?B?K1JxL2Z0SzVtRlNnYUJQU041b3U1ejlSYzBnOHFJc2ZSam9ra1liRHFqYlFL?=
 =?utf-8?B?djdvSDJCYXhPMmhDSkY5T3hsWmJIc2lSZUtxbFVsWGZiYndHNzlGQkxMdld0?=
 =?utf-8?B?b3Z0OEFzYWhKUTNGYk9LMUdJOWUrMmhyWHhnS042WEpGUStBUTBDQmxHbGpG?=
 =?utf-8?B?UDJFd3dCNURqbE1NMWdKcVk0SXQ1emF2bkh4bFY2S3hnQ3lyZ0QvRllFZFJ0?=
 =?utf-8?B?ZDB4UnFZbnlpOHRLMmRyNnlZdk9wV21oNEVaQnRlVCtuaHA4NTdxZ0c2TlJk?=
 =?utf-8?B?dFBSYWlUbEc5Y1lRNVFYUW5KVGJqNXZvYUJKako2ZC9heDVPUS9Sc0V4d0ZP?=
 =?utf-8?B?R204bkptbjJEc3VGOTZYNmVHVVkxRi90RXFoWkVDY1hlN01yWS96T2NseDNv?=
 =?utf-8?B?ckpCOVo4aFY3NGFNaGNjQm1ONFFwR2pYQ1FGdHFUOEM4WnRKeXNlUllTWFJG?=
 =?utf-8?B?ZEl0Z0UzNXh6bDNBcUpVWWlPVTVvc2JQYi9XVXBRZzJpRytKTU5hY0JYK3ow?=
 =?utf-8?B?U3ZRekxGd25DWjdacWFNRXdtQ3ZoQ1RpQlk1U3FiUCtnWlBrT0piWFRzbXRi?=
 =?utf-8?B?UjJZb3lUNFhvNmRVejJhLzBOMFNFQnBKM3hOckxBY2licTNYMzA0UFBiQVZR?=
 =?utf-8?B?L25sOWd3dHhsNGdDVWRNZU13RUdzaGpWR053bmZFb1NBN1FadUllU3JabjZ4?=
 =?utf-8?B?M1JYejE5ajRmazlzbGIzc084aTh2WjhjT0tmL00zZzdiUGh2VEd6TW91MFdt?=
 =?utf-8?B?Ykp5YXpXQWNwaDZrcWk3cDBDYzhMaURZQU5Qb3dOb1JtYXdNNk1RWEV3MUJr?=
 =?utf-8?B?SGo2anhvK0tCUXZnRWJxQ1NFNlNKTTJMVmpxQWVOMlFHMFI4TloxK2w4ekxl?=
 =?utf-8?B?b1gyWkYrM3hLb2ZoU1RGSm5ydVROc1BheVRZVDYyTWpZalRKU2c2cEZpWUNB?=
 =?utf-8?B?VFcyN20wbEtaZ29FeVdvUmtpcEc4Q1ZiLytMTmYzNWhKVmpCdmZxaFpWd0dL?=
 =?utf-8?B?eTczTlZJeVpnemR1bmRGR2VYbW1CUjZuM3ZraW5zUnhmekM3Y2pWYVY2ODQ5?=
 =?utf-8?B?cDJoUEh3NEIwRHJIZlhIbmtQSG1ETElpa2Urdk0ybjNkMUI2SEp2QT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6261c227-f49c-4596-af93-08de6fde49b6
X-MS-Exchange-CrossTenant-AuthSource: DS2PR12MB9750.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2026 17:42:44.4848
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C4GEEpHP+syuVyvQycElpQmGdOyUdzOVyDU5NOjbVEq0ry3Z933Rwmoc+tJ8Ewpa+2cfXkhzdiZoSOuUE4nj9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR12MB9427
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,google.com,vger.kernel.org,linux.intel.com,canonical.com,gmail.com,kernel.dk,lst.de,grimberg.me,lists.infradead.org];
	TAGGED_FROM(0.00)[bounces-93428-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jonathanh@nvidia.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[Nvidia.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,nvidia.com:mid]
X-Rspamd-Queue-Id: E76AA1615BA
X-Rspamd-Action: no action

Hi Mani,

On 16/02/2026 14:35, Jon Hunter wrote:

...

>> Krishna posted the series a couple of weeks before but forgot to CC you:
>> https://lore.kernel.org/linux-pci/20260128-d3cold-v1-0- 
>> dd8f3f0ce824@oss.qualcomm.com/
>>
>> You are expected to use the helper pci_host_common_can_enter_d3cold() 
>> in the
>> suspend path.


I have been playing around with this, but so far I have not got anything
to work. Right now I have just made the following change (note that this
is based upon Manikanta's fixes series [0]) ...

diff --git a/drivers/pci/controller/dwc/pcie-tegra194.c b/drivers/pci/controller/dwc/pcie-tegra194.c
index 9883d14f7f97..9f88e4c1db08 100644
--- a/drivers/pci/controller/dwc/pcie-tegra194.c
+++ b/drivers/pci/controller/dwc/pcie-tegra194.c
@@ -2311,6 +2311,7 @@ static int tegra_pcie_dw_suspend_late(struct device *dev)
  static int tegra_pcie_dw_suspend_noirq(struct device *dev)
  {
         struct tegra_pcie_dw *pcie = dev_get_drvdata(dev);
+       struct dw_pcie *pci = &pcie->pci;
  
         if (pcie->of_data->mode == DW_PCIE_EP_TYPE)
                 return 0;
@@ -2318,6 +2319,9 @@ static int tegra_pcie_dw_suspend_noirq(struct device *dev)
         if (!pcie->link_state)
                 return 0;
  
+       if (!pci_host_common_can_enter_d3cold(pci->pp.bridge))
+               return 0;
+
         tegra_pcie_dw_pme_turnoff(pcie);
         tegra_pcie_unconfig_controller(pcie);


At first I was thinking that is we are not actually suspending the
controller we can skip the configuration of the controller in the
resume. However, if we skip configuring the controller in the resume
then the device does not resume at all. So right now I have the
above, but clearly this is not sufficient. The device resumes but
the NVMe is not working ...

  nvme nvme0: ctrl state 1 is not RESETTING
  nvme nvme0: Disabling device after reset failure: -19
  nvme nvme0: Ignoring bogus Namespace Identifiers
  Aborting journal on device nvme0n1p1-8.
  nvme0n1: detected capacity change from 0 to 976773168
  EXT4-fs error (device nvme0n1p1): __ext4_find_entry:1613: inode #18622533: comm (t-helper): reading directory lblock 0
  Buffer I/O error on dev nvme0n1p1, logical block 60850176, lost sync page write
  Buffer I/O error on dev nvme0n1p1, logical block 0, lost sync page write
  JBD2: I/O error when updating journal superblock for nvme0n1p1-8.
  EXT4-fs (nvme0n1p1): I/O error while writing superblock
  EXT4-fs error (device nvme0n1p1): ext4_journal_check_start:86: comm rs:main Q:Reg: Detected aborted journal
  Buffer I/O error on dev nvme0n1p1, logical block 0, lost sync page write
  EXT4-fs (nvme0n1p1): I/O error while writing superblock
  EXT4-fs (nvme0n1p1): Remounting filesystem read-only
  EXT4-fs (nvme0n1p1): shut down requested (2)

Is the above what you were thinking? Anything else I am missing?

Jon


[0] https://lore.kernel.org/linux-tegra/20260208180746.2024338-1-mmaddireddy@nvidia.com/
-- 
nvpublic


