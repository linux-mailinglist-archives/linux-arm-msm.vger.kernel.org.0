Return-Path: <linux-arm-msm+bounces-92981-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YOzyJKMrk2kI2AEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92981-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Feb 2026 15:37:23 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B658144BE3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Feb 2026 15:37:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 62F8F3011740
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Feb 2026 14:35:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 721DF312826;
	Mon, 16 Feb 2026 14:35:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="elyX5opu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012020.outbound.protection.outlook.com [52.101.53.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EA6C76026;
	Mon, 16 Feb 2026 14:35:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771252552; cv=fail; b=TctNEjiCzCtRYIUDn5Co9xhnf23YwX3Sa2fCwUZyHAU8QyBpZp3xIVUiQDgWeFXErEFgVu2fZYe1Csu7WCsNsDOcBJE0dttuRLeZ1gxopS1ZsI169aZJDr9SZUGay22hxNKoUZ9SaN0wpJ1ee5Mu4IERTys5yWeem4a3kDgqc/M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771252552; c=relaxed/simple;
	bh=xX56F6LcKbW5gBUDP1bJ+UOTeWABOwlT3tBxdtREwDc=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=P97wgR/OYe4k5ACBkeQSPMJi9Tb+Qo15o3ZL8B2eoDp5OuuPIG63DYV9YkmLLS34IMvHKpv1kM23YLyw+YiHnr8tINc3OBN2jxwoMIhXIEYP0W/jVEG2+PI/WQjWP9zq5l9SMa4o25n9QP6By1rLJr6KxMKpmHLcpr2Qsu7uYPU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=elyX5opu; arc=fail smtp.client-ip=52.101.53.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pC7Zpz+oatpH2n5H0lLjP5Q7tX27Pgk/3HcIflTjrvS3ab0X6ypNHCaESSrIkaFuJkgSx6w3ZyDjYKgWHwwX+nbCiBIryzBYdw7LAJXnuCVT8fm4Czqs0mFwrwD6TjXNSGsxlvKpDFsBphOlREeQY2Ggpf5SRQ5JiRAybJ1MONLJznCum7MtO/rnACU2TYdMqvZKuDw0PkVJWv4iQYjE0l22vuXYDMxCjisg+hMd2gNlFZd8NhNvcsIUS2ZL3TTAW1dmfRga/9Ny6KrvykHPfSnzXcfJB745fCsbkmVE0mwtNR98q8B3RVbPpoGcgIWip5IVfI3egAUxxTlyG6ctHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Yevk4TuSPcABhljf4K84BgvYoIDP26cWJ2UJtSK7BOk=;
 b=TEZIAmBgTlIU9igABt0VTyqK0ZCD2QDXTz9qTnzuAxibOFcY4vzbZdkWOrAo4LL+3jsX6JFHyeI6FruOkNlEQ78bLfLZww8+4yWDtOZzKaGXlIrWQhKuzJq49NLx5aerJM+JlQixb9loJU5oSJA+aFbpqd/3Fz+PIAwG8FPfrxKIBZBLpSIlXMABxDDjnAxP2K24wAI7Jylo6wa59cwWGg+amQOp1QBAZuBOL0p6RkGd5X906x7ej9a/LzeIWXsNVQ/kalN5URoyM1R4Z0ZE17OK0GOOfnXmZIe6y5TfNtXGoGhkSnsnSbCP+Sskgs2sEbmcf+kt2XjdhK5Jyj08Tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yevk4TuSPcABhljf4K84BgvYoIDP26cWJ2UJtSK7BOk=;
 b=elyX5opuM66ByLd3gWZhc9Ah/kWMB7heoTMRLLiMf9kpHMuIWvqrxBbr1i0EXiHvKLDK+Se5ifRgIBIgUxn0/Bes6yXzl9J33+VVh1/569DUvtCfhvCsEivF5hRlipASNV/AoYAquiUtj+OfaT3Xqu7hVghsvNMezeayYEttl36isyERXN3bmT/SwO3qwCzUHMET/RvUCe41lDFZkkyck/VG64m0zmgW8UDPErWuaYXiWF/7LfJWuA3Aivc+rDWr0f4xClSa1FX6nFLonH/HFP6H9HsJDWWrzOCcqNxSOIRnKVyWvgMPk+kWk62zpXtlC+lIqd1YgmL8F0p4h46azQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS2PR12MB9750.namprd12.prod.outlook.com (2603:10b6:8:2b0::12)
 by IA0PR12MB8280.namprd12.prod.outlook.com (2603:10b6:208:3df::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.18; Mon, 16 Feb
 2026 14:35:46 +0000
Received: from DS2PR12MB9750.namprd12.prod.outlook.com
 ([fe80::56a8:d6bf:e24c:b391]) by DS2PR12MB9750.namprd12.prod.outlook.com
 ([fe80::56a8:d6bf:e24c:b391%5]) with mapi id 15.20.9611.013; Mon, 16 Feb 2026
 14:35:46 +0000
Message-ID: <7157c68e-97f3-43b0-bfb5-e271a8f2a4b8@nvidia.com>
Date: Mon, 16 Feb 2026 14:35:40 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] PCI/ASPM: Override the ASPM and Clock PM states
 set by BIOS for devicetree platforms
To: Manivannan Sadhasivam <mani@kernel.org>
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
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <a5m4pqtiaxsq5lmq64roro633ganbeq7mypa5ojuuqy4npkvok@wcogdbzaq6xe>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LNXP123CA0020.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:d2::32) To DS2PR12MB9750.namprd12.prod.outlook.com
 (2603:10b6:8:2b0::12)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PR12MB9750:EE_|IA0PR12MB8280:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d8c6e4d-c32e-4200-f3f5-08de6d68abf9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|10070799003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MnZQOXRoRUp3V1VSRTNDWWZLNHdIRGUvR1pPTGZES2xaSTVFYmNDYkM1UXdS?=
 =?utf-8?B?YnFSVG5XTjBxU2FJZ2tsc2Z1YUxZRHVFVm9mTWdhNTZQVlozcHZJZkxUREF1?=
 =?utf-8?B?aVZ0b3BIc2pCT0lxdTY0eGdqb0dTNmZpUzZHbXhCcWdIZnZqdW5BK3VFNWgx?=
 =?utf-8?B?NXFBdSttdUdJSnVWenJLcGx4bVozUWJUR2Zuc2ZZSStXQW1mRlNuRjN2RURM?=
 =?utf-8?B?NDhCaGtITlNJTDhGd0N3c1R0S2NiMXlmRTIzNmRRYzhBeVhUVkZXdkVIeE1p?=
 =?utf-8?B?alAxVUVPaWRaL0ZQZU55bjhYeE8vSzYxWmZGaGxtTEUvVjNYRzllaWMzdTVF?=
 =?utf-8?B?L3dPYmdzTW5ndm5LVmxsaHVEeExKdzBMUEtiQXFEc01hdXVMNlAxNnJUYzdn?=
 =?utf-8?B?N2dKS2dPOUNXTzJqNVp4YnZUdi9BTVdpYWFFOExwWFlTT2pBK3puRTVGNHhC?=
 =?utf-8?B?T015MnBTa0NPdE5INU1VaStGcnNmTWRubyt4dzUzeHcvWU9VaFQ0amJBSHdp?=
 =?utf-8?B?dk1tbnpsVG01THJVMDZZdmdsL1lRU3FDbHRLeWpoWmFqUDN5WE5HanRxd1k0?=
 =?utf-8?B?UTJDTU9iT01PR1paUU9KVXFDRDc4MVdPSEFvMDNmc0dCQ0ZFSXBULzJTQ1Fu?=
 =?utf-8?B?NCtxVHBNOWFveFVXeEord1Nmeno4R3JJSEJiTmRKTE9jSTNLamY0ZUxEdkVW?=
 =?utf-8?B?RHh6Q2ZHbzlkb1JwaXZKNlQ1YWNhK3dPak1TdGpwcDIrY0htOGkyWG5yaGpL?=
 =?utf-8?B?SUNHUXFkR0J6M3lUQmUxTmpXV08yRFJFTXRDS1VaRWdmdGRSdmhhYUczZi94?=
 =?utf-8?B?WWNxZEVBSjBMTnRFUFFKWXR0dWl4OWZ4b2Z2Q3dPanFkS2RsZU1Uem1uWXJ4?=
 =?utf-8?B?N2dsMEgzS2lndE9FK3BzV1o5VFZmWEovN2c4Q1Mrb2JtNFNpemQvMnhSZ1Bv?=
 =?utf-8?B?Yjl1cjdMQWZGLzZJQzlXbklHbjF2RzJuTXdGemVVUU1OM0tycHpKZldkRGNP?=
 =?utf-8?B?aHF6ell5bWdGZ3RDQkRJRGwrdW4zUFQrcGpzVHZPT1pTRDVISWFJVEZzRHpO?=
 =?utf-8?B?d0pEdTMrOHlNbDJUZFFRaHZmRTJidnJIeXE2dkdJUjdCWEllQ2pPZHV3M2xZ?=
 =?utf-8?B?TzV2R2thajk3TGdwUGcwRWRpdXdmRHl1akw1WUw3ZmZPK0dmRGErOEpxdVFr?=
 =?utf-8?B?U2xLS1QybjdNLzZRNXZkV2RERVI4OGh5Q1kyaS9vdzJxRHk3UkJhWERlTU05?=
 =?utf-8?B?WGpjaWVmbDlNYm1HN2pBemw4Vy9hb1hRVEtuSmZObjhtODV0L3R6ako3djJX?=
 =?utf-8?B?cnY5VFJsaUVKb1dpc0FFNW5ucFdMR05MZEpTUmgzZW9MY2ovL2gzbzB5SElV?=
 =?utf-8?B?VXFDVHRxZ1FYUFRhTE4rbGhYMGFYTlFWTm1uYnFwaTg4aEsvWm5MOGpzTWhC?=
 =?utf-8?B?bGlla3lqZ01WRWYxNTFVL0Zsb1JZRVFpcDJFbnNJTitzRkRNNTB2SmVJcjNN?=
 =?utf-8?B?ajdTY0xJcEx5Mk5TazJ5aFNTMU5ZSzR0WG9nZURaY0NOcHk5bDA1c3kvV1gw?=
 =?utf-8?B?QlFLc25QU0plSlV3ZCtBMkJRYXhwZEswai96aUN3ZnVxOEpNVmVtNE8yK01N?=
 =?utf-8?B?RUNnR25CRUZMRFFaMm51eEZsY2VoUnBYM0VLempwWmRlUlliTk5ySi8zdmVY?=
 =?utf-8?B?Vm9uekp5SlY4UjIrcytZTWhEZllOS2syVUd3TiswZ3dTSCtpbXNBRmorMCtl?=
 =?utf-8?B?Z0xub3hGS3U1VW1MU2VDUTAvWTJFaHY1aHNEQUlDdmZWTXA1bUw0eS93cVRt?=
 =?utf-8?B?NlBobEV1RzVwZDBGdW5mYkFsTHg2TjMzL1lJZ1IzMHE0V2IxQnNCWXZSYVRX?=
 =?utf-8?B?OTdxRjJJWXRSTEdNNElYaUlhU0V4eEVnYU5FZU1xWXBaZ3NJZkw3UHVNMUJy?=
 =?utf-8?B?eGFHS08yazVNd0N5OHQ5cWFhSTFwbWZvZktLTytFUjNOMmFnVFdGUU8xVFhV?=
 =?utf-8?B?U2k5M3FUZU02Q01ER2pPeDhEYU5aby9XSEJja0dsOHNhck5BMzg1MUhvMVpB?=
 =?utf-8?B?TTh3ZVNkQlFHR1hnampMYTY5cVF4UnRnTHorSlIwallhdnc0NTBZZ2huZ2lC?=
 =?utf-8?Q?6aeE=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS2PR12MB9750.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(10070799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K1V0UHhDWFp2N2I0SzdySGt6Wll0d3gvTXVMV0VtRDZuMGkvRW5rMGxXN0lY?=
 =?utf-8?B?T0ZyV0JPTkhlVzBETS82MjIyT0RUVEZkL3dqYmtESGNrU0RsNW8rem4vT1ls?=
 =?utf-8?B?VUcyRWl0cXVvZ2RFcjBkODh6NlZ1akF6ejZTYXJwQnRQWk55Q1dUUVhLWjQ4?=
 =?utf-8?B?MkhMd000c0Q2RWJSOFdjZ01xUzU1OGFZT3pRUEd6ajhBTElSMHJTRUNFZlFJ?=
 =?utf-8?B?QjVaNTMwWDRPMGJVbWMwenFhUFJ2Ulo1TWMvRFJuU3ZkcGR2c2pWdEpFV3Bo?=
 =?utf-8?B?aGo1UExwNko0T2RnUmppeVUrY0wxY0pkRWU1UjJsSXJSckNOZU5tTDR3NXFR?=
 =?utf-8?B?ZkZucEl5Rk1sUW1LMVB1NE1JVS9kd2F0SUl2UVdVUzcvdnVlb095NWtQWnpr?=
 =?utf-8?B?V0RsclI5eWZyc2d1QWJtSUtVWkcwZlpqSWIrMEdHZDdJelJON2VKei8rUkNN?=
 =?utf-8?B?KzhqT0NEa0JmbEozS0RXRzZOdGRqSVVRSmkzY3lISEk1N2xFZk9BWnB0MDN5?=
 =?utf-8?B?SU02OGxsVGh0N0JtdWNjdGZ0c2hKTXRTa1pXK0FPMENBZmxEN3RvWjVXMWVP?=
 =?utf-8?B?RytWRGJ6RXRzTk1ZVU1hYVIxS3pYVjdhNFFybWhkZnZwWm5XMEtpVyt0Sk53?=
 =?utf-8?B?ZUlGaW5lcmR3K3BHd3hPSUdwZE4ra1J0YUJaNHVOUVVoVmNQVHlZM1NDOGkw?=
 =?utf-8?B?aVVVSXJhdThyMlNiMUo1VFFEaUd4eHl5UGh5TmZwa05tRlZrTDVvU3VsUncz?=
 =?utf-8?B?ZUNXMlN3NnZjWEwxV1lkMS9BMERUSVRZWmsrNlRwRVlTNHZCRFU1Wjk2Y1Qz?=
 =?utf-8?B?Q3pBQzFGNStqR3RUUVBIcXB2YjZUa2gxUFB5ZXMrNnVsU0toMytBeUVVWXBC?=
 =?utf-8?B?TWpxZk5ERStESVErazY1MXdJOW56ZjhkTFAyOUU3SmdISUdyYkdxc0ZBaXNp?=
 =?utf-8?B?cHFvMDBGZC96SmpNYTJRSDdDcE5wK2pMOEU5ZHZVZmt1d1NIL0FoNjFXMXhi?=
 =?utf-8?B?bzdadHlxY1JTZU9zcmF1Z3IybzhzUFdJd0M0RDJJUWVJQkI3emNxSFZIZUtz?=
 =?utf-8?B?MEt0RHlVUjRtNGdvMzBjRGZMR2pjTU5YaFNDYW15cElZRFdrempKamo1R2Zu?=
 =?utf-8?B?WWFjMEpDeElFdzZvZ05TLzcwVklGZGx5S0VtK1VmNk82dGtZNGlnTC9nSGxL?=
 =?utf-8?B?TlVkclo4WlVBbzBoNjJNMGd2dmVHTFJOaUdJTHpZNDRTdVBJd1d4SDVXblNW?=
 =?utf-8?B?KzE1T2NPbjB6VzFIOFJjUWJWVy8wZlJMWU9qVDAyNUN0NDFvTFQzdnhOem90?=
 =?utf-8?B?YlNxNE5ZQ2VobFNYZTVFMjN3VGZxcXZzcHpOdzZRM29DcXJoOHcyNE05dVdI?=
 =?utf-8?B?NDZ5L2p5blI2RHlreE9peExRRW5GZkZ3QzBJV0ZDZVFFbWVIQW8rQlUwWkZp?=
 =?utf-8?B?bm03WGZRb0UzNzVXeExZOU5Tc2JpTXlZZERIbVlwYkp1cERvUmFQR2tXczBV?=
 =?utf-8?B?a21kdll3MVVGQyt0L25zYzJZaHJ2eUhFdTRaNkg4aXBNRWVFbUQybzhjM1ZT?=
 =?utf-8?B?UldsSloyU3lPbGdvMlhScHZSUDQ0ZGs4ekRDbDVNL1k5SFhvL2RvRndtY1Fo?=
 =?utf-8?B?ZFNJWWdaMjJ6eUNjbVc5R1BFcmFlOXdFKzVMNmtwWDhDalFBa1kvRGVoVmFN?=
 =?utf-8?B?aHZJYjB3RDJzSWdHZDdML0pOd01QSm5SYVpXdjNKRjJYK0FXVjN4UEZNVmFI?=
 =?utf-8?B?dURaRk8rVkd6bUM0eXBoVGVNZnhXVnpPdUJtbGs5K090ZER6alJJMnBPRjFF?=
 =?utf-8?B?ZTgzc1NFTlZsaXRVY3RRbE13ZVRwV3NDTVhySzFWendyZFRjUlBSaUFTbEFK?=
 =?utf-8?B?RkxYSFBDVEhadm8vajk0eXRXOHNxZ2RreXlCOWYwMUh0anNsc3JBalJVbGNE?=
 =?utf-8?B?OUgrQnM1MzIyWW5GN2xOVHpjTjRSNjh0MXBxL0toR0FlTldZN1hJdndHNy9x?=
 =?utf-8?B?SFNPaHU3Q3VFYXdJaUVDcUFydTRyZnVpS3Y1N01LTWN6OFFHTEJodEI5dnBS?=
 =?utf-8?B?MUZ6ZitiaXFiSjdiTVorY2tGV1ViNXVPTHFhejdrR3ZHa2gxb0xQQUlEZGlT?=
 =?utf-8?B?M2tnYzBKcVlWNHYyV0pwVVU1SXZEQThHbU5Ialp1S1JpQUVwK3RYNjZOcHBq?=
 =?utf-8?B?eGZsNTZMcjFsYWtoV1orSVhTUzgvbzBaMTZFL1c0blZwT2RUc0VSRWdua255?=
 =?utf-8?B?U3FWcm11elY1KzB5UndDTHNUZExORzU2eEJEMU9ZWXRLOUI2UUJrYzBadG5H?=
 =?utf-8?B?MjhEY3FkZmhNaGNvU0NlVGJjamtCWm9BUmlxN1Zlclk4bzFRUmRKUVVvdyt0?=
 =?utf-8?Q?CAxeTQFeVoldMdF6q2b+UJ+FsnNPx1ID9bwAUBp3KYC2A?=
X-MS-Exchange-AntiSpam-MessageData-1: QGCmzUIMhbKgCw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d8c6e4d-c32e-4200-f3f5-08de6d68abf9
X-MS-Exchange-CrossTenant-AuthSource: DS2PR12MB9750.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2026 14:35:46.5031
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RLMbrXVKWnZpW2KJ7cWdCz1MfQuZHW413Pf5uWId7fgxJfFDZn3L1FQ3GHNB+ZptrTxV7ffkac5fXckspKWZsQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8280
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[22];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,google.com,vger.kernel.org,linux.intel.com,canonical.com,gmail.com,kernel.dk,lst.de,grimberg.me,lists.infradead.org];
	TAGGED_FROM(0.00)[bounces-92981-lists,linux-arm-msm=lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jonathanh@nvidia.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[Nvidia.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,nvidia.com:mid]
X-Rspamd-Queue-Id: 2B658144BE3
X-Rspamd-Action: no action


On 16/02/2026 14:18, Manivannan Sadhasivam wrote:
> On Mon, Feb 16, 2026 at 02:03:41PM +0000, Jon Hunter wrote:
>> Hi Mani, Krishna,
>>
>> On 23/01/2026 13:56, Manivannan Sadhasivam wrote:
>>
>> ...
>>
>>> So to properly fix it, we need the controller drivers to perform below checks
>>> for all devices under the Root bus(ses) before initiating D3Cold:
>>>
>>> 1. Check if the device state is D3Hot. If it is not D3Hot, then the device is
>>> expected to stay in the current D-state by the client driver, so D3Cold should
>>> not be initiated.
>>>
>>> 2. Check if the device is wakeup capable. If it is, then check if it can support
>>> wakeup from D3Cold (with WAKE#).
>>>
>>> Only if both conditions are satisfied for all the devices under the Root busses,
>>> then the host controller driver should initiate D3Cold sequence.
>>>
>>> Krishna is going to post a patch that performs the above checks for
>>> pcie-designware-host driver. But since the above checks are platform agnostic,
>>> we should introduce a helper and resuse it across other controllers as well.
>>
>>
>> Do you have a rough idea of when you will be posting patches for this?
>>
> 
> Krishna posted the series a couple of weeks before but forgot to CC you:
> https://lore.kernel.org/linux-pci/20260128-d3cold-v1-0-dd8f3f0ce824@oss.qualcomm.com/
> 
> You are expected to use the helper pci_host_common_can_enter_d3cold() in the
> suspend path.

Thanks! I will take a look.

Jon

-- 
nvpublic


