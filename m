Return-Path: <linux-arm-msm+bounces-95871-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MMEbKvj7qmmcZAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95871-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Mar 2026 17:08:24 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 175D02248FE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Mar 2026 17:08:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0395F306759E
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Mar 2026 16:03:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D89423AE1AC;
	Fri,  6 Mar 2026 16:03:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="mikbpFin"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012050.outbound.protection.outlook.com [52.101.43.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACB7734104B;
	Fri,  6 Mar 2026 16:03:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772813026; cv=fail; b=qE2RH9ArNM7rJdao13DIA4SnfagPTvVCQUSPNxktJN6UznU+NbrzttHI4OLGIoNKcIcR7DjgrjZNHe6wRW9A5yrf0TxErIbOUu+/xR4wDqFyw5+CGEn45xu8gLruSAwdpp8cDLTHz7FD6Mj04HNtRvBhI81RROEibS5VwS2594A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772813026; c=relaxed/simple;
	bh=Suj8F9B2EDEM49J3s/To/6N3micqyUQsRlDnykkzTmE=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Ts8HoYUEqLrH0P2PgfXr/hRb8oKzDr7qfKDg8HpYdPSVmvJk3ueNDrP5RdFDuXUy41BZAS96RVmHAKwD/EXIwYYMoECOeyXMzixXHFmqHxxGPg2+kiztcaT5aCcq1QNRpDiFJ2FE++q12eLnnA1Asj0b1nGDdb8Vfd+kUYiRTNc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=mikbpFin; arc=fail smtp.client-ip=52.101.43.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BlTnwVtGxF324fs6TpQtjYbKZPQ4Bn+wEA0i3NclfyuUNi2JS2WPVY5RLanLkUHe7WKQKydf8rQrUThhS8JR3Nn3A6zhneCXB90+bZE7mU6wgFjUFkRN35mNaoMyedho4MEySyKCIb0CFMqmIX+1b/3tq9vSGPji3MluSWHt5r4NklQ2U33/kUv2bDwYjF2GRQXgVr4HourLWWaHmC7m/fDdLnivYwYQvcZMdmXXCPXJc6OxN+XmwaE6XwltA1VjsDtxUZGfzqWtSB8PwR+JLR6jiacQegNzXU/gtI3SIO+cxLpaQwA9shloAg1sG7D7c8zfiupb0ySOB2PcP6dwcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2KcbsmwV35M6TGxoGavU9OYs7prhbC2t/pWxgGSPXng=;
 b=c7Kf00x5hncDZhJvYOQlcbXDNBUE5oQg/bqHwFgX9S1hJroeVHuZOnVXNo5tSPFnu04pIlYf8CvFZb87pBlrVWoV7HRoGg+qjtV1l4Dp9uBruxuhxbQ/CU11xlf7DiUCH5j0iVXTJiRp0hscCny13FzTStp11bIz4mbqLIXELaleI3Kh1N3j/dDxObRWoRIF0ebUpii4t8qIoYWn+3oWRiwzXOJnzMsTCIRRA0MmC+9s19zB2ZmIDwU68vswCfVnQLZ5w77HV2Qd4tJbT8MFimLgN60b8e8H3HsTTk7KBvpZvMF5EUWMHLNMygOzTgfAnytDnu7959qNAwzg7QQobQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2KcbsmwV35M6TGxoGavU9OYs7prhbC2t/pWxgGSPXng=;
 b=mikbpFinM2k9ZHxqcXn6/IvofVmNoSaT/zLdt7xZUyYLoq4xZTZBrrUtRwkoQ9Edx3+l0anrEEEb28Ecnu5uQ4WiM4u/hGxQhlAWPjHeMVWxjXAuqFTk5HdQqQz6oJouNpPcqCauNJechUtM4bHvjLsUUF0Bal1vTAVyvlV09plcBRKwyaj7ZID8+rGQeXYgcrOryGWfT+uGNYy3SYleHmb1c5JxP+7GdxCP7orUM3BtmSN63MH2r2cXSOWoElasqxXrgRQIZF16e6sxU9W9fyRwDOmPY5CusQcnQIzmtlPBGNGWFfFp0EoICLUbXFKuc89LEpCY/I6O13qrH0tFmw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS2PR12MB9750.namprd12.prod.outlook.com (2603:10b6:8:2b0::12)
 by CY8PR12MB8338.namprd12.prod.outlook.com (2603:10b6:930:7b::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.5; Fri, 6 Mar
 2026 16:03:41 +0000
Received: from DS2PR12MB9750.namprd12.prod.outlook.com
 ([fe80::56a8:d6bf:e24c:b391]) by DS2PR12MB9750.namprd12.prod.outlook.com
 ([fe80::56a8:d6bf:e24c:b391%5]) with mapi id 15.20.9700.003; Fri, 6 Mar 2026
 16:03:40 +0000
Message-ID: <3a0ddcfa-9fe6-4744-a9e4-016c43f9400e@nvidia.com>
Date: Fri, 6 Mar 2026 16:03:35 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] PCI/ASPM: Override the ASPM and Clock PM states
 set by BIOS for devicetree platforms
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Manikanta Maddireddy <mmaddireddy@nvidia.com>,
 krishna.chundru@oss.qualcomm.com, Bjorn Helgaas <helgaas@kernel.org>,
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
References: <5z7c25nkb35prvax6vq6ud7eaeuhzsswbf7fqvmlgys3xftgwb@odocboejrdrv>
 <e44c330b-778b-4fa1-b678-fa909cc05b03@nvidia.com>
 <bf37b6a5-268d-4c07-a536-a826b3d5953b@nvidia.com>
 <unc5zefwndgcv7wufaezz3gkg3qtaymkjlmymhyqdqwzn3wybl@ow2rhbyt772h>
 <f9ac8c8f-8959-416b-ba90-14f0886c5bc0@nvidia.com>
 <a5m4pqtiaxsq5lmq64roro633ganbeq7mypa5ojuuqy4npkvok@wcogdbzaq6xe>
 <7157c68e-97f3-43b0-bfb5-e271a8f2a4b8@nvidia.com>
 <cf1e685a-a1cb-45ec-bdc3-1ef1a3d1044e@nvidia.com>
 <npt2cgwksulq5375dzlhszqaqrurgdvlkz6fdczer6shglqfg5@gp6a6xymymww>
 <26ad62ff-4972-4b29-8f9e-1868cd20ee00@nvidia.com>
 <kkly3z4durpagtenadvmzdpojlctachgfgi2fdapt6zthdl2gx@n2qhmlud2zb7>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <kkly3z4durpagtenadvmzdpojlctachgfgi2fdapt6zthdl2gx@n2qhmlud2zb7>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO6P123CA0008.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:338::16) To DS2PR12MB9750.namprd12.prod.outlook.com
 (2603:10b6:8:2b0::12)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PR12MB9750:EE_|CY8PR12MB8338:EE_
X-MS-Office365-Filtering-Correlation-Id: b11d7d72-00a7-40e6-dd52-08de7b99ef44
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|366016|10070799003|1800799024;
X-Microsoft-Antispam-Message-Info:
	b9E3EwZPkRqah09o71QOhuE5bYRMLc4sgUcvvKMuU1JUJlKJhvzOoOjl4PCnnCmhn1WyweS5DNEbdEnSKf+dRTa1cT1DWEkaDAu/Usr3dOqRz7+qgjLDXTh6L5FKZewYJNXINy7rx9SDKvHzRiGmp603Tt5t75kj4nLO3Fyy8xArPtufm+EjrF/A2Uhxyj0+sbRGuF6APpfR/JyIR3JV7P7ZlZQgRt+/b0GbOYAO8p4ncykxOAzChd3iCibUe8qiy9ihOU6Uxjwjb4kW5kRq3qyH6jOT+G+zlgddtYYEu5D9U1EyuCG3ZKWpaZsM8MU3Vs24rkznh8ejaD3Xf955ttjkOaOj+bERHlMbV7i60/E4aiJ3rNoNm5zTS4OP4yxosI63TRBVtvWe1s+E/ZVaLRvzQZkHNb8p9xwt3UFt1r6RDikbdBD4dHh/rg3eYONZPLbxfppJ0UEpb+hSq0+bwszvSp3JmB83y6xgTQ0Yq1FpeThQYqRHOx1tEnTzLF+9mlUrf0K1FPKzDWo+5PZwBntaRTWbqs8uCNm4kuwfG+pwP+5uXl0YC/BhehC72XzVJ+O0e6X5RYcouY56/YeVOMdBWLZguvVgUoCNFqVnYhl+6iOEzeOesaZTaUxkcE2BXFBO44nkTLWtpXbBU27eRVHlvcuxdIzeQFINz42sqaaGSLhQbiznjSh5m/i9rrmQpMnk2J6LyW0GKnYlasVxaOcXWGfhPp02fFy4xNHJrQM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS2PR12MB9750.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(10070799003)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SVBVRkgwdXVVZFRNRENMekdGMVY5RklMbVcrUWNMWldFMG9jeElSSVhHUWZa?=
 =?utf-8?B?aTRkQ0MrbXE0SHd3emRTNERTNzNFRENHeVJpNU5HOExlbFYzcFpPcVlGbEd6?=
 =?utf-8?B?Nkx3UER4RUhxMGtaU3ZnQ0ZaazNwTEtIWVFUMG82RVVIcU5NS2ZZR0d1V1ll?=
 =?utf-8?B?b1VadjJPME43enFWekpwbXFld0RBWGxoRUdPckx0aHRIeGpUMXlSOXhjM0xi?=
 =?utf-8?B?YTZ5eUF2aHhtdVhReTRYMzRWUjUvSWdIdExFT0wxQ3BLUkZjaFhTZ2xEMk1M?=
 =?utf-8?B?TjUySjdWeG4zaEMxVWNHYXVXTEplTFlsd2wwYVJaejRTTDBOWWxqUkpnMklh?=
 =?utf-8?B?MjlaTy8wL1N3TDFZRHRya3RCVjJ2YXFwczNOODMzOEdlanFhWHRRdzJRWkZP?=
 =?utf-8?B?elBxbFByOGtXcHlBeFVTamtjVGhXTWdTOGVQK1RKck1CVjB3K3VFakVNMkFO?=
 =?utf-8?B?UVRwbUt2VlFqcVlMSE10WVByZ0NSOGlsNHlNOWFtT1ZsZmIrampJd1RKNVht?=
 =?utf-8?B?d3RIQVA4T0pPTCtuZUllTVJXd1dCRlhJcDhyaFhEcVhzRmljNFdOYi9INUY3?=
 =?utf-8?B?STJJa0hCSi82ZUMzalVHMUZzbS8zT0l1U29YUmNReVd0anlhZmplZ0ZBcjl5?=
 =?utf-8?B?dUdVQitNd3RpMnFVUllkMGdzZE1pRFViOERaV201ZGZ1emNlOG1RMUZjdzhj?=
 =?utf-8?B?WFUrSWRzaEhQcnVWVXlyUEJ6T0dNYmZiUTIrclZsSDlreEhVQ1pXREE2MzdM?=
 =?utf-8?B?bHN2US96ZnlWZXdVK2ptcFVLR1MwakRLdEMycy9Dd0lEWFlnTk5xOHQ4a3h1?=
 =?utf-8?B?ZjVrc0o2dmMrQTR1dzUvZmZmK3pLOVRrVlFpV0lSSVIxRlM1Q3ZpVk81RGtY?=
 =?utf-8?B?L3JLUXQ2VmJYU3NtT2lFYVVaUXhmd21sNUlVWGl2WTQrWjQwdWkvZTdKQXJC?=
 =?utf-8?B?NEg0ZFZQWWJuUXhMZzZ3YTRRZUZLQStlaGxBQWFNaERPRHJja0lKZjV6dUtR?=
 =?utf-8?B?ZmNHNWt1bnVqbUc5SXVrOWo4a3k4QlBLZDRTTTJxRC9jK3R0VXlIQ2hEZVh4?=
 =?utf-8?B?NU5OeW9IdUJ3aFdQbVJHZUpXTjdnek4vNWgwbXd4M0l1bUR6MXRzWHpkQ0JC?=
 =?utf-8?B?UERLNnpZbWhDNDhYY0V4S2xkSVZiR1F0MXFUQjhub0tXL2lzSFg0ZHhiYlhR?=
 =?utf-8?B?UGI3NW9GbnNKRTBuWE52dncvRWRHQ3U3TUtKZWpFRTR5ZjhxQitHQ1lBajF2?=
 =?utf-8?B?ckxMTUN2bHYyeFBRbjBYWEVMVEwzZEFCQ1ZPcEgxaFhIR0lwQ2dlMk95U2Zo?=
 =?utf-8?B?Z1NMQ1ZxeHZuSDBVclpZanV2MVR4ZHo1R1RhYUNmdFJCYWpLWFpnY1BYMXRj?=
 =?utf-8?B?Z0tjMFdGQUplMGRkTDFYQnVtV3hwMW95KzhYRGdrUW52dG9QMndwdFhERVZh?=
 =?utf-8?B?REQxYnNjMmRGQmIzalNQaFRkSXpOSmFxdDRhQ0sxK1BXcVpIU3lwd0tkM25K?=
 =?utf-8?B?LytpYVZQN0JjY0t6TzEwSWtnb015bmhEd3BJdkNScU8wV2FkM1JMclE1T2Jo?=
 =?utf-8?B?UFpIM2dqVm82VlBUQTdOUzBjSEZiOERhNzUrMk9yK0lNR0hPbHZMcU5ZTldv?=
 =?utf-8?B?MGxxT1ZWaGFzZDlpcWhOY3c5V29wRzN3NUxyMHhxbFNsZ2ErbVRzNDV1Zmx4?=
 =?utf-8?B?bjdHUzVrVXh5aUtrUjZEeTZXZThIUWFNKzJVN3RCSG5pakd6OFFmak5Cbm9r?=
 =?utf-8?B?OWZoWHNleE9ob0pUbllTR2tFVkFuUjZKSjRtc01SZnlEb0NGeTJZQ0tDVVlF?=
 =?utf-8?B?YWNJVnQ5aVlqRiszcUVEbmx4NXMzeEM3RXFsbDRaRzhlUHdxditHOG9IRGxY?=
 =?utf-8?B?S09MbFNzaDhkZW5wZVlSVm45L0R0ZDUrQVVzelJ4N2Y4R2pQcVZYOE1UbkdL?=
 =?utf-8?B?QUxSQW1aYXNVQ05XNVQ5MjlBRzFIdEswRW1CNGhVNVFSOHlmVkF2dy9RTGMr?=
 =?utf-8?B?Y3hHVDJNQ2xPMG1RdC8xakpFanlrYndDZEdTN0IrM0ZkMXhrWDNLRC9XNktn?=
 =?utf-8?B?Q3lBN2k3RHJsQy9CNXdteVNaWGYwdWlKWmpPQ0JCZTFHOHppZGxYSlpzZjVl?=
 =?utf-8?B?VHhidndrMzQxMVl3UWEzaExEcHdwK1pUckV4dWNjZThRdmpFQ1NOaTFxT0ty?=
 =?utf-8?B?VWVFcjQ0YWRDVEZ6OHdCTDMwVENaQWlMSzQycXd3VXpxMkhSSHRSbXR3NG9j?=
 =?utf-8?B?aEh1R1ZGeFhPZjRwVmZ6d0JWTitqY3Z3MXBMRzNiU3pVZDhFVkxZaEV2U3Zw?=
 =?utf-8?B?blNMYXEybC93WHd4SjZDV3FaeUc4eEpNdWlEZ1FuR280RmNsekM0dDRmM0dn?=
 =?utf-8?Q?dDGzJnIhd1MoupeIwuT82sIl8lJzihd/9/Wn3TaK959Im?=
X-MS-Exchange-AntiSpam-MessageData-1: T1G4igZa6dZYkA==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b11d7d72-00a7-40e6-dd52-08de7b99ef44
X-MS-Exchange-CrossTenant-AuthSource: DS2PR12MB9750.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2026 16:03:40.8735
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R1OnsH7KI8A9SmVQyRdQkrIe3CckW/CfFA/DMAUrYyM+nddHRFgFAoAQFQM0AUN48GWGmnk2rRPLGxaOqHq1Vw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8338
X-Rspamd-Queue-Id: 175D02248FE
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[nvidia.com,oss.qualcomm.com,kernel.org,google.com,vger.kernel.org,linux.intel.com,canonical.com,gmail.com,kernel.dk,lst.de,grimberg.me,lists.infradead.org];
	TAGGED_FROM(0.00)[bounces-95871-lists,linux-arm-msm=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.982];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,Nvidia.com:dkim,nvidia.com:mid]
X-Rspamd-Action: no action


On 03/03/2026 16:17, Manivannan Sadhasivam wrote:

...

>> For Tegra, we enter a deep low power state known as SC7 on suspend which
>> does involve firmware. Nonetheless I tried for fun, but this breaks suspend
>> completely.
>>
> 
> Ah, this explains the problem. We also have a similar problem on our Qcom Auto
> boards where the firmware completely shuts down the SoC and puts the DRAM in
> self refresh mode. So NVMe driver never resumes properly. We tried multiple ways
> to address this issue in the NVMe driver, but the NVMe maintainers rejected
> every single one of them and asking for some API in the PCI or PM core to tell
> the NVMe driver when to shutdown the device during suspend. But this turned out
> to be not so trivial.
> 
> Another way to workaround this issue would be by calling
> pm_set_suspend_via_firmware() from the driver that controls the entity doing
> power management of the SoC (firmware). In your case, it is
> drivers/soc/tegra/pmc.c?

Actually for newer devices it is PSCI and so ...

> In that case, you can use this patch as a reference:
> https://lore.kernel.org/all/20251231162126.7728-1-manivannan.sadhasivam@oss.qualcomm.com

This change fixes the problem as implemented. What is the status of the 
above? Any plans to get this merged?

Jon

-- 
nvpublic


