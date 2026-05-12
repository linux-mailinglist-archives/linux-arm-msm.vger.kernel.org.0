Return-Path: <linux-arm-msm+bounces-107067-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ENwCDAzvAmryygEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107067-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 11:12:44 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E23CE51D622
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 11:12:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B3F53309DC6B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 09:09:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05EC338837C;
	Tue, 12 May 2026 09:08:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="BSWEWcHF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012062.outbound.protection.outlook.com [52.101.53.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CC95313267;
	Tue, 12 May 2026 09:08:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778576887; cv=fail; b=OSGy5zWLodGjW2DwGXdHdU5R4DI6pepkYDKdEqG9Xmn/3b6zkjn055m9N8Mku1lVWDuAtsMDzFOKT51aEFWWjRO8NQRltwinS+r1dTCewCIOqgXHpCDnG34QUtq+WusC9neTRY7z/3b3HMDRYdHhnOLy8KNblKa3Sx9HLAWUpRo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778576887; c=relaxed/simple;
	bh=sGhagKF8D/dGZyE9sweEsOvovtj985bFmPIVN8o8A2U=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=krq/vZ67l+bkkpzxoU8Y9rdg/WLySDjsiuwsKriqjvs40uT5c/4oVj3kDlCikgd67AHCCxU++ulka+K6/nw0OMkvouiVBLFxqtYmVaXzCaQOtdZuB1S3iNjZe3hV4vZalFg2pVrt5PhnKGEpsnQRJhe7g5h3/aYu3DthqyQhqj0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=BSWEWcHF; arc=fail smtp.client-ip=52.101.53.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NlJH3vZzvYak4CpQJYKCXhsqlbQBCth0pQut3d2uFk4Rm0zJMl0hQGh+VpetCTQyMeOuQPrFE4qj868wYaNAHzjz8f48SnvB4eYjDNA1a9Sd/L+X6ZSBFYeFZleIoY3jKE1zUppzO/Ml9g0B89IqPT474cgLtYghGqbnPtvc9/VfzOnjIEQnF4F4NsI6C4t4DmLgDmJEPdptalgtUwG3dfe7idWrXALgWXqm63dKISofyfmPk4qw7IHeO3ldO3xtwDu0B146Ci6+6hj4qJrQkhD2E5KlZZLLDnsxY7aySlnHZ5FcbRgAcMWjq5kRXhu9y/KOlvVnD+cyLKmIecj1Yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T9QzAAl68wtZoJQd0DnxRnCA8MhxTHhlTljt9q9Acjs=;
 b=ky3s+7yEoPqIGwjvhLEJG3h302JdQqkSHq5xo2fgpQlo/+LyTdGf3HghXsJtJ+eDJXNRNS41qc9MAOp4ztV0kq05fEvn3m8rT2nAIfx1yvP3zLd2Zdt2erCxNw10z4/spd/9+uFhzkm5SP+/fawY3rVyTLSRR+3GVvf8tcvi2xLj9r7LoO3+3y0fmY+Jd/l9NOvqdkfg/BjqZUtUw93sv3sJAivxd6nb0pA7U9eMn7mhM3Z0sr0IiZoIQ8hy+Lft9WjwStwYh8VCRe8zONYjdeb0QO7bxCaX0bupP/FQmwr4qiJaUmbQRL99jT6CauwqJitpnDuVSKIuxC0OtqE5lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T9QzAAl68wtZoJQd0DnxRnCA8MhxTHhlTljt9q9Acjs=;
 b=BSWEWcHF2RJM9/c1IL1BZIg7ylaLsOWQN5cZg351TCXkOix3PTsWGrbv+rembRI2+lavGlA8dyjxkAidy5ky4auyU6SPyYjmB+qUYMi1GajtVfAvHSHpiaNxCwMgzkXDoz6zJUuGP8yyLSsG7Lxatb1BAOxjtiAO5mKM+YUT6F2O/rSJBlYO5BC6RMRTR2vMniNzdxmnmMIxcbUoSZIj9xRdi0s6yLCRCBB78h9FdAN1FFy3eUfBqeLZltQC5GWo6MmE+EofkYz17W8DEXv1T1qtpsdXlyCx85vV9qFj4HWK39mC1qpf0p/judQ1dZ8jtOI8WFaFe+xa3QghjER8fg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS2PR12MB9750.namprd12.prod.outlook.com (2603:10b6:8:2b0::12)
 by SN7PR12MB7980.namprd12.prod.outlook.com (2603:10b6:806:341::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.23; Tue, 12 May
 2026 09:07:56 +0000
Received: from DS2PR12MB9750.namprd12.prod.outlook.com
 ([fe80::56a8:d6bf:e24c:b391]) by DS2PR12MB9750.namprd12.prod.outlook.com
 ([fe80::56a8:d6bf:e24c:b391%6]) with mapi id 15.20.9913.009; Tue, 12 May 2026
 09:07:56 +0000
Message-ID: <daa93cc4-090a-4eb0-91c3-029e0b037b71@nvidia.com>
Date: Tue, 12 May 2026 10:07:50 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] PCI/ASPM: Override the ASPM and Clock PM states
 set by BIOS for devicetree platforms
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Bjorn Helgaas <helgaas@kernel.org>,
 manivannan.sadhasivam@oss.qualcomm.com, Thierry Reding <treding@nvidia.com>,
 Bjorn Helgaas <bhelgaas@google.com>,
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
References: <20260122152903.GA1247682@bhelgaas>
 <8d8b2244-2bf0-48cf-8fb8-9e47e197a62d@nvidia.com>
 <fb6uzh3jfes3hky6fblpsh2vvg3daij5ogecydiuhmytxbglcb@tdqjcoxuymsk>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <fb6uzh3jfes3hky6fblpsh2vvg3daij5ogecydiuhmytxbglcb@tdqjcoxuymsk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR3P189CA0044.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:102:53::19) To DS2PR12MB9750.namprd12.prod.outlook.com
 (2603:10b6:8:2b0::12)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PR12MB9750:EE_|SN7PR12MB7980:EE_
X-MS-Office365-Filtering-Correlation-Id: e09265a6-54cf-44c5-a0f3-08deb005f504
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|1800799024|11063799003|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	NbYr1Y5KIznVwVovOKiWiEEcUmUliD6RdJw8CKP8lXtf524mFXKya2VIURsqRsHGby0CcnjQZ64Kqee1Onrx/XvsTffZpm9o2scDhuVYTpFN8V+0lDtlBUvi8WnQjpAbQrSLqyUtHqtNA/Xca/+NvkvBjesL4gQSr9X4968ri5y9fN2WnfdE1GwV51LxXViZadP70+QZpnMG6J9oOAn/3F9jVBSGpWxt43927brgl7tG6fPL9xB6ViM58//oIEBAUx0snSqCFZeTjpRIB3VmZYpCFxg0ePU3DZiicZ1zNQ9kDkxBco74a8YiGg+UITXNIe+uOSkcVBOpTFJFqY7vm9CCaBCcjvF3nlRkX9+ngT42G82WZePAvrG+e3xl97UkmAi3oCJ2nUKk+G0coVUXJZ1LqUq270kXX5IliUNTrCs8Jc3gN+jefK7qgGy911CVZk9bbfNmchOs1D37C11JOrSUKhCdO56ibVGPyZAaNqEEOG0qT40i48HoW+QpOyTePwUCU8mTpmemswC44tyIgpAn1GA9X/mUyxvATKqsnHw30ylBHTKyveJJkCBstqBWxcps0P9t8o4eB2W4w2hfrk3j+DmgLGJ8njL+kxZMaAvqyBJxXYH6q6e6PXYq8tdt7SRGV6Q4aRgjKh5ucMw1pQRh2P5+177WvgrsQadSBcXTcbb9rUWdQLp1bSp5ru3b
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS2PR12MB9750.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(11063799003)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SnUwU005bGZZcmVlOWFzeTNjTHFkdEsycExLT2NVam5jMGVwY1l5aUZOUFJE?=
 =?utf-8?B?RWtwTkxmQjRYYzJmNFpjZHEzZGdsT2tjcU1wcUk1Yk8xOEhyWnI5RXFQZkFj?=
 =?utf-8?B?N1FnOW9ST0F6Nnd1YTJrcE5JQWllc000cHlZTkZ1dnZHQTZnQ2x4OXJxbHVM?=
 =?utf-8?B?dzRZVWI2WTlOM01IVXI3ZUlaSU9wR3RSQXJQQlBBUHdkL05sMDhycTNJL2ZH?=
 =?utf-8?B?b3I4OVlHQ0NWWmY3SmVvdlNtUW41aWRJMnNPTm54dGN2OVV6UTQxblo1cWdO?=
 =?utf-8?B?T1FwelZzdW41NUtmK1p5a3pOOG5TUDVZZDVUTEtTQTZZNUdxeEFCWVZjMk1m?=
 =?utf-8?B?bDB0VEo4YVpFVEtNMHBCd2UzeU4rd1M5dU56Y3YyeVZiVklrd1JtUm93dnhY?=
 =?utf-8?B?OG02OW9YM0xROGE5NlNIRTc2R1NheGdVMWVxOWtkZGg5aW1UUFlHdTdNQk9Y?=
 =?utf-8?B?SWd6cEhBTE9YYkhkZWxHanpWek9Sb1lZeGEyQ3pjczZieUlHQzVMYWJzc1V6?=
 =?utf-8?B?eWxXcXd0OUxzSzR5UlljdWtYaWkzVGdtSDZ5bnQ3OFpQTVFrV1k0YjdUZjJz?=
 =?utf-8?B?MTFzSmR2WTFaWHAzUmZXRHk0TkJLdVlwbmxpVkZNeTVEeGFML1NrVDBDOHAz?=
 =?utf-8?B?aFVBWVBVYTJUTkE5cElvUU9iS2hJUkdWVUVRSUxEb2dobWtWRitoYWRNVnQ0?=
 =?utf-8?B?L1l1RkFrNDl0bm56c212VDYvN0M5Umt0cjI4dmw0VGhNMC93cm41Q05mZEFq?=
 =?utf-8?B?K1ZmdUU1SEc3dXl4UjNUbmZHWnJuZzh3d3NLR2dLK3E4LzBpMng3RG9TaUI3?=
 =?utf-8?B?ZDZDTnczOFJva08rSGM3QzF2SUYwajNWb2NwU3pXd2lxZXJldEFZUWM5UFFa?=
 =?utf-8?B?RnBQT3lqQzg2bDZvb0Nmck1ESnZqYnljN1lsV2RPdEt2Y1VLaFJhKzdVMmE2?=
 =?utf-8?B?eWE2QzkvUUM0eHV1V3NtU1hMSUd2TjcwVGlPSkhQYWxYU3ZNRFRWUFl3ZEY0?=
 =?utf-8?B?MlVyaUpiem12d3dVTC9CL2VlelNnRFZTUEgySHRTYjIycGRFd3JBazN5YTlq?=
 =?utf-8?B?d1dBdDZPQWhIcjJjOFI5OG44MVVNY0ZveXlvYWVsR3dOWit6NDY4UVVFQ3Fv?=
 =?utf-8?B?RjBIWlNxdi9BUDRVaEtrcDJab01ia092SlFkUkFJWnFFYVhndWRCUVl2S1pJ?=
 =?utf-8?B?UXFZR1VpbmRla0xlNDI1NzBUOTdhVmtWQjlMSjkvYzVvaFRCSlFwSEtXUmJC?=
 =?utf-8?B?M01NZGVrR0R5NnQ2VXdndjlXbUFyM3VmTTlqUks1WVJJUExSdW9RYjFtckNp?=
 =?utf-8?B?UGlieGdST3k5dkEraTh0czJwNTkwYzZzVHk1RjBVNk9XUTVxa2lvaVpDVW1T?=
 =?utf-8?B?M3U5NllGaU9udXpWWGdzcjZZODRST09DKzlKdm9QOTk3WU5yTzdER3Vvb3hB?=
 =?utf-8?B?ZkpvS0wrSkJOVHF5ZTY2ZnZ2NDlVdGFtNTRQcFkwVFhxQUZuVWkxd1ZtZlc4?=
 =?utf-8?B?ZlhvM3RCMkpOMmZrdjJEYlhRc29iQTNpNDFTS0Z3OE9jbzFlM2djVFgrWE5H?=
 =?utf-8?B?bloxd0U0OERiK1JuSTJ5SHU4TmVSSy9Neml1TnJ3WWRkYkNkdEVJY0lWZ2pz?=
 =?utf-8?B?QnV0K0wvRVY2MmcwRHBSQ2tUWE5jdjVZU3c0NkVVY1Z3dGxTaWRXWk1MeUQv?=
 =?utf-8?B?RjE3MFd2RDJ6YmI2RHM0RWtVUDdGYjJyeVJ3S3EvOWZKMlptcEV0WldYVkxj?=
 =?utf-8?B?Sy84d3lqcmVUdHRLdG85MkhDQ1pQYkt4RnR5UVozdmFNU1dSWFdvMDcvVFdG?=
 =?utf-8?B?M29QU2RqQzBHcHBlU3F2QVNqR1E5dnNLL2lJNVVONjNqVDZWb3dCZ3pVSHZm?=
 =?utf-8?B?d0t1dVNpbXo3YnNLRW1oWnZUNGsxR0hrRVlTcFNHYVJJMTZtTkZSUUM1R1Z0?=
 =?utf-8?B?dUJncCtVc0hLR3pVUUt1T2cwTGlrQTBlOXN2c2kwa0NKdittWFQvYzBMeXF0?=
 =?utf-8?B?dmRURHRHL2lhakFkS0hSNURLMGJjbnJnRU9SekVQT2tNd2F1L29ZRlNFdGJF?=
 =?utf-8?B?Z1d1dG9aQmtveFlMeGZST0lHS0twOE0vL25oZWg3YUMxSkZXVTd1VkNhSGVp?=
 =?utf-8?B?SE5wczlLYThoUTk2S3hqTEN4N1NCcnA1OFNZUndsc3ZKYXMzZW1VQ3JmMUc5?=
 =?utf-8?B?ZFRLWDlXMEdTN0tKSlpDSnM4Mm5CZ2k1YTV3YUxLUXNObG5TSXZwRTRqeHR3?=
 =?utf-8?B?Q3gzWTM4dnoxdzFrSHFmY1YwakR6aytsc2EzMFFwVHB0MGg1b05ORDAyTHN6?=
 =?utf-8?B?dXRlQWVGRW9MWWt5UVhZM0tqVVoxSmlTeUllZG5tUmdwcE5aUXJ0QT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e09265a6-54cf-44c5-a0f3-08deb005f504
X-MS-Exchange-CrossTenant-AuthSource: DS2PR12MB9750.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2026 09:07:56.6054
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OmQG54zDgOQYH1tyUkn4lTxkMW7AlXC7VtSKGjuG661BpjD1sMXNJbfJdI5vwTh39UjmzQnEeS1STyuvyKRX7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7980
X-Rspamd-Queue-Id: E23CE51D622
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,oss.qualcomm.com,nvidia.com,google.com,vger.kernel.org,linux.intel.com,canonical.com,gmail.com,kernel.dk,lst.de,grimberg.me,lists.infradead.org];
	TAGGED_FROM(0.00)[bounces-107067-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jonathanh@nvidia.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,nvidia.com:mid,Nvidia.com:dkim]
X-Rspamd-Action: no action


On 11/05/2026 06:18, Manivannan Sadhasivam wrote:
> On Thu, May 07, 2026 at 11:25:23AM +0100, Jon Hunter wrote:
>> Hi Bjorn, Mani,
>>
>> On 22/01/2026 15:29, Bjorn Helgaas wrote:
>>> [+cc NVMe folks]
>>>
>>> On Thu, Jan 22, 2026 at 12:12:42PM +0000, Jon Hunter wrote:
>>>> ...
>>>
>>>> Since this commit was added in Linux v6.18, I have been observing a suspend
>>>> test failures on some of our boards. The suspend test suspends the devices
>>>> for 20 secs and before this change the board would resume in about ~27 secs
>>>> (including the 20 sec sleep). After this change the board would take over 80
>>>> secs to resume and this triggered a failure.
>>>>
>>>> Looking at the logs, I can see it is the NVMe device on the board that is
>>>> having an issue, and I see the reset failing ...
>>>>
>>>>    [  945.754939] r8169 0007:01:00.0 enP7p1s0: Link is Up - 1Gbps/Full -
>>>>     flow control rx/tx
>>>>    [ 1002.467432] nvme nvme0: I/O tag 12 (400c) opcode 0x9 (Admin Cmd) QID
>>>>     0 timeout, reset controller
>>>>    [ 1002.493713] nvme nvme0: 12/0/0 default/read/poll queues
>>>>    [ 1003.050448] nvme nvme0: ctrl state 1 is not RESETTING
>>>>    [ 1003.050481] OOM killer enabled.
>>>>    [ 1003.054035] nvme nvme0: Disabling device after reset failure: -19
>>>>
>>>>   From the above timestamps the delay is coming from the NVMe. I see this
>>>> issue on several boards with different NVMe devices and I can workaround
>>>> this by disabling ASPM L0/L1 for these devices ...
>>>>
>>>>    DECLARE_PCI_FIXUP_HEADER(0x15b7, 0x5011, quirk_disable_aspm_l0s_l1);
>>>>    DECLARE_PCI_FIXUP_HEADER(0x15b7, 0x5036, quirk_disable_aspm_l0s_l1);
>>>>    DECLARE_PCI_FIXUP_HEADER(0x1b4b, 0x1322, quirk_disable_aspm_l0s_l1);
>>>>    DECLARE_PCI_FIXUP_HEADER(0xc0a9, 0x540a, quirk_disable_aspm_l0s_l1);
>>>>
>>>> I am curious if you have seen any similar issues?
>>>>
>>>> Other PCIe devices seem to be OK (like the realtek r8169) but just
>>>> the NVMe is having issues. So I am trying to figure out the best way
>>>> to resolve this?
>>>
>>> For context, "this commit" refers to f3ac2ff14834, modified by
>>> df5192d9bb0e:
>>>
>>>     f3ac2ff14834 ("PCI/ASPM: Enable all ClockPM and ASPM states for devicetree platforms")
>>>     df5192d9bb0e ("PCI/ASPM: Enable only L0s and L1 for devicetree platforms")
>>>
>>> The fact that this suspend issue only affects NVMe reminds me of the
>>> code in dw_pcie_suspend_noirq() [1] that bails out early if L1 is
>>> enabled because of some NVMe expectation:
>>>
>>>     dw_pcie_suspend_noirq()
>>>     {
>>>       ...
>>>       /*
>>>        * If L1SS is supported, then do not put the link into L2 as some
>>>        * devices such as NVMe expect low resume latency.
>>>        */
>>>       if (dw_pcie_readw_dbi(pci, offset + PCI_EXP_LNKCTL) & PCI_EXP_LNKCTL_ASPM_L1)
>>>         return 0;
>>>       ...
>>>
>>> That suggests there's some NVMe/ASPM interaction that the PCI core
>>> doesn't understand yet.
>>>
>>> [1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/pci/controller/dwc/pcie-designware-host.c?id=v6.18#n1146
>>
>>
>> I want to revisit this issue. From my perspective low-power suspend has now
>> been broken on some of our Tegra platforms (that have NVMe devices) since
>> v6.19 and so far this is no resolution to this issue. The patch that was
>> proposed to fix this [0] has been rejected by qualcomm and although this
>> does workaround the issue, my confidence that this is the right fix is now
>> low.
>>
> 
> The referenced patch is now merged into arm-soc for v7.2:
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=7602c0ec0bbfd3985d49f4f0cad281c1414008c9
> 
> I hope this takes care of the issue you are dealing with.

Well yes this patch does fix issues for us. However, I am still a bit 
confused about this whole thing given that this patch does not work for 
all qualcomm platforms. Anyway, I guess we have not seen any other 
issues so far with the above and so may be we can consider this closed 
for now.

Thanks
Jon

-- 
nvpublic


