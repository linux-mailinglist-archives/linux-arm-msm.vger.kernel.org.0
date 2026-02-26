Return-Path: <linux-arm-msm+bounces-94327-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ELxVBtSEoGkakgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94327-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Feb 2026 18:37:24 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B20E1AC922
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Feb 2026 18:37:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0348F31AC2A0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Feb 2026 17:03:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2F6642849F;
	Thu, 26 Feb 2026 16:53:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="OIyaCvzL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010069.outbound.protection.outlook.com [52.101.56.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A3F43A1CE9;
	Thu, 26 Feb 2026 16:53:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772124791; cv=fail; b=qHMywnrbAyTGZgJIpZjVgFok0tsPoqS4ZH1HQvGEx35oCK7EtX2vOa6vj6xnJZcr4WGCprxmSiOtwHsJO7dORUg1BX9LDgJmYNxpLaZ+8dsAQqA2jd9vS7oBkcLNjYdLu8hEu427p0mJXbgdEkjpcJCMnusDzQTxmIGr/F2JBXE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772124791; c=relaxed/simple;
	bh=vXHUX6mHe5Ds/P60yo4MpGmUfvhQ6M7Icq7AtwT3fLw=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=KyQxC7Xr0OPp8FDYrzXPUo+ojb8bF8WwXe3IUfZWmSYDhdE87QtKWhJlN7yBDI8hCdwy5OdH66NrYHMnYBM5Zq6EmT3JKuNqKHPiyt3SKDnMCDdE8Vi6E/BkXvAlK5BpTSGYf0b5Ovh4f0sgR5m6Ix+sFIvqGKSbK7LdCLPRkKk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=OIyaCvzL; arc=fail smtp.client-ip=52.101.56.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Fzt45HSFt8fj6/OeHuum+qQ84IbBZ2k3WThRFiTi5/1vJA17iIFuPEC3RWT6FSz3AF0APrrlF+g9dBcrRr0pGCGuYYxqCYIlrcMF/ywP9z0ZoXQJ2zOcj+45DRjpwn8ATNub7DEpnWYZcRe/CDABLWwVvSEByDEIaaZbJU8PG2A/LbsKz0al/j0i6BLOrk9RgAFmVa+CK0w4WDS4jKe5PYKu8UXqiotm9dMrDQdU7Yl4YQGqxfTtqEbzf+FFlRA7pVV27ZAvDDr9ouJ25W4js3RpHIjlANi4XscIBH3BqV3McnVqvDGY7FvKZ4ywRmOwTqkvJX/3YI4DM+7etO53xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7x8pgl5YpjKyFw8x3XxrCBmcXvGraJmxYgtH846jPiQ=;
 b=HRIojNCB3jJNT3rChZNP1HysFvxHxTSgYjjP86QpQm3DUO9VPsI82N9iYX65Me6kjcUxpV6lfmarcqof5hvSY8UdQGg8NqpcRLn0avF6OvFxOIlH3d1aCbCWuxhyP3aQH44f/0xramxNL66aaACZ9LgIdvCRwIQSgl5sgfh1b4CB0YeR2FGsTqypNXjmzz5cLlijLRYinLnIAQnjjq0eYo0se8vlQYZpOSpuV1MdjRO3Qut2Y4bzdducPC7GL/8ik4sXp5PCtAyFtYpjZZ4+ImAqLOu9FbBSbG5sJm6C03pglwnX4CByWi/yxCU590rpF2TYCSQ7RC6XkEpJyZWHtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7x8pgl5YpjKyFw8x3XxrCBmcXvGraJmxYgtH846jPiQ=;
 b=OIyaCvzLtIeqFMl6+h6lP03HApf2kbzsSq04Vs72XxqzTTLcGWTHY0AS+1OZTAf34LKtDWBVIwXgVCCwFP48FJ2Lj/zsdLgkGxXSVhTct9lqnUlxVNAUogcapkvotE4iIiRMKnHNLnk5yroFxJcZM2fk5FtKOt06FBZb8oqJvL1OOIXvEiIzhXXhYHfXrhi3CGUembkBzTfw7fzhfWrtfZIcyy4YxaNXsmCfe8HwA/5YuEHrihA2NFD/RsjDik9vKVBHFclc73cJTYCYhESyWPZ2WVLQwiKynE9NvyKlY9jW95+NwG8Y3HS1UkQM4m0zsHnLPufxppiflJ/xpiH5qA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS2PR12MB9750.namprd12.prod.outlook.com (2603:10b6:8:2b0::12)
 by DS7PR12MB6285.namprd12.prod.outlook.com (2603:10b6:8:96::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9654.14; Thu, 26 Feb 2026 16:53:03 +0000
Received: from DS2PR12MB9750.namprd12.prod.outlook.com
 ([fe80::56a8:d6bf:e24c:b391]) by DS2PR12MB9750.namprd12.prod.outlook.com
 ([fe80::56a8:d6bf:e24c:b391%5]) with mapi id 15.20.9654.014; Thu, 26 Feb 2026
 16:53:03 +0000
Message-ID: <26ad62ff-4972-4b29-8f9e-1868cd20ee00@nvidia.com>
Date: Thu, 26 Feb 2026 16:52:57 +0000
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
References: <7306256a-b380-489b-8248-b774e6d3d80e@nvidia.com>
 <20260122152903.GA1247682@bhelgaas>
 <5z7c25nkb35prvax6vq6ud7eaeuhzsswbf7fqvmlgys3xftgwb@odocboejrdrv>
 <e44c330b-778b-4fa1-b678-fa909cc05b03@nvidia.com>
 <bf37b6a5-268d-4c07-a536-a826b3d5953b@nvidia.com>
 <unc5zefwndgcv7wufaezz3gkg3qtaymkjlmymhyqdqwzn3wybl@ow2rhbyt772h>
 <f9ac8c8f-8959-416b-ba90-14f0886c5bc0@nvidia.com>
 <a5m4pqtiaxsq5lmq64roro633ganbeq7mypa5ojuuqy4npkvok@wcogdbzaq6xe>
 <7157c68e-97f3-43b0-bfb5-e271a8f2a4b8@nvidia.com>
 <cf1e685a-a1cb-45ec-bdc3-1ef1a3d1044e@nvidia.com>
 <npt2cgwksulq5375dzlhszqaqrurgdvlkz6fdczer6shglqfg5@gp6a6xymymww>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <npt2cgwksulq5375dzlhszqaqrurgdvlkz6fdczer6shglqfg5@gp6a6xymymww>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P265CA0289.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:38f::12) To DS2PR12MB9750.namprd12.prod.outlook.com
 (2603:10b6:8:2b0::12)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PR12MB9750:EE_|DS7PR12MB6285:EE_
X-MS-Office365-Filtering-Correlation-Id: e5497e1f-4074-45d8-f137-08de755781be
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	eoyC5WmcJ/cS55MJTn/omSiHYZ4x5XCmJIwIUJvrjiM1Xa2LCe65h/eORk6DZboI9f85UmNUarC9aEPdx2HhJUrIN1pEGqykJ43Imn5xydlAtv3G546G4kFh7ypwaLQhtdAdT4wZ2ItbI35mZ1re0v6BnODVdxwM5oYHYy2jR6Hu+BfXcBQIC865k7nrMCvM80AXv5K4INQUGVAM7ScoR0EJ7PvbxB6j/Spbt58WGmkmuJ3XVoYZ9m5fNohwHVbNvPefiJXZIkIdb5gBbImNNUNxV2IpyJeCaM0i546AVWjPGk/VKJjoj8++F/FbQo6/4ObIUWJzmvBU8GnQKkzbK/SInabZqtSDLDlVCuK2UyaMFqEQEj35qwe33tl3TBIWJWTXZ16jgOJRPXLyZPpVzNrm8U6PgK7vHcmqEdRBWQgLBdAtttnAA0bcva/HPplHfUNT4SI0DlZ5GbW8ZpXZXPmS7TNrI9m8CvXSqqpE0C1uUFbSGRmN4UwPIwt8LtBlRTa9PJY8x+K1Sh46AQ5N1gfDbjVcE/ezTYX9o9qh3FHMmVNfgoeiHVWN3k4ZitxK1ENT60eZhoTSZtndCSoFs+K0hYEsr4o4HJ7kAMI2XFMKjMvvVERxE3fUUAubCbJo5+FYbBg8pK3kLHyQ2xRCXY7ENCl7b2TrpvhHbpGX0hmx/X+e9VCHweiidQUHCK1VqzJiVJe20wnpkO9AZ4+AdR2ea/G095HV8MpjCkiPTQ4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS2PR12MB9750.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Szk5UVJiakRpNmthYS9laTNRYVQzNzRub0hkQWZ2M1F4RVlMUXNxcldnamM5?=
 =?utf-8?B?aVUwTDl4RTlMRHFGQmR0M3Bma0xlLzRNZEszOE1PZ0JpNXd6QXRNckU1SzY0?=
 =?utf-8?B?ME8xWFlOb0VFTzNhZnhvSWw2VEZnRjRjbWlqU3V1TnpLR2NyYTcrbi9qSmZo?=
 =?utf-8?B?RmZtUDlFdE9OOTZwakc1OGw1RVM4TFZVckgzOGFpbkJxdmVKTVBEVW1xYXYx?=
 =?utf-8?B?a04rem9LR2ZaZXBhSTdqV2l3SUhvaURoRE5qWjByUHJhY25IV2R0TWZUSC9z?=
 =?utf-8?B?ZHpkNm56VGxUSXI2QmhCbVlrMTU1bUU2Yk56OXhPdlhsdjY2ZXFDaTZ6ZXN2?=
 =?utf-8?B?Ti9Nd1VkWFdIYmlTeHMwYkZkT2xBbGV2QzI0cWtKc1hnUTJiL0FuVGxHY3Rs?=
 =?utf-8?B?cWZyaWdPWFRjQ0VkTzdsb1o2Yk9HdC9VVklxaHFhMFpYRkVIYlVMbDV6YkQv?=
 =?utf-8?B?UFp4Y1dNT3NjTlFSbCtYV1pRcHBIOFliRmUvOTlFS2hIMVkzaVBkQVBRSGR6?=
 =?utf-8?B?T3FpV3k0WUNRSHY1elg0b0NMeXVuS0hsOHg3RzhUR25VQnpUSzdnOWwvSzlh?=
 =?utf-8?B?ZFVnNmpILytINUxmTSt1eE5JdWlkZElpZVRiVXh1Z3FDMVZjRnpFK2NXa0xy?=
 =?utf-8?B?QjVTTnBSNDlNa0xaTnhQdHJtZFdVVVRrL3Nva0pyVTliQnNaZDNzckZVSXF6?=
 =?utf-8?B?RWhWdWVrNkRMRS9nZlZuNEM4K2M1YkU1TG5XWHBucGpMMWVzUzZINmdWbDNH?=
 =?utf-8?B?SVFRcTVhWU9vck1iUllJTVN2N3VPSEZVaTkxTkYyMVRrSnE4ajd4bks0ZEZJ?=
 =?utf-8?B?TVI3dFA3K0FoNjJ2eUYxNzVZaUZPSmV2MXM0aXNOWTlzRE1nYVJqMnR3WVBI?=
 =?utf-8?B?ZWU5RHRrTm4xNDVudnl6TlpabVNjcGgzalM1c0theWxlaVJJVi9Tdks1bmI5?=
 =?utf-8?B?bkZKMnVxdlNjV2NockRlMUY5SGhTRDJMc29nOXZOMGZiUXAwdGtkVWpzTVlQ?=
 =?utf-8?B?UnB6NWhzVWg2dkZTeG1xT2lmSTRDVnExRGtjZGZTMzFlT2R5SHlCemI4QWtP?=
 =?utf-8?B?N3JLSTlJc1M1V2oxRDVydkRqZUkxNnJiM3d3YzYzOU14RGNkYkxuQ3YzQjVR?=
 =?utf-8?B?MWNxNUd0UVVOVXJxbVZOdHI5Q2tSUVlyQXZIbE8xL3FMOWt3WENvRml3Zkt0?=
 =?utf-8?B?RERNejN5d1JWNmRtS29HbFllellLVzVRN0NTNlJpazAzREpUSWxFMmEvMG9v?=
 =?utf-8?B?VlJlbUVWTmU2MkNPcmQ1Q0FvTEFoZitkcnRHelNqYWkxNUxvM2V0alVQNU92?=
 =?utf-8?B?QUduYndIdzQvTTZUT2NUdHpCb0lvdDdKL0xxSTRqUEM2WnVGVFBCT1VCaDYy?=
 =?utf-8?B?R1FFaVZoSlllelRkRndtaHc5bDNhaXMzVnVOZEJRdzhWTjZTbzdEbWNoL3o4?=
 =?utf-8?B?V0NHTkNTT0xoZVJnTW5jRjNjRXhCNHdid2pXOWdRVGdDeHdzRUQwTm1sK2lR?=
 =?utf-8?B?RTUrWFdFR09lUDErS1Q2NzhHOUlhbHNyRm9DTi8ramgrTDVmNDFwVzc2cndZ?=
 =?utf-8?B?bWNmcXJWVzdqN3gwUUIwa2JEYmowYzVnM25mcHBiNURTeGs4aG1OUU01NUM4?=
 =?utf-8?B?N2dqclJLa3BZQWhSMVZFc3ExR2pEcUZqRWFTeEgyelRIaS9US3BDK0dSUnM3?=
 =?utf-8?B?RS9QV1kvRSsrVUR3bWN4TG1EemJvUlExN1dHd1h1K1dnTEJORmJVTS9mUWJ2?=
 =?utf-8?B?NTcvM0l1TVJDU21ISHdFMWxodE81MFAzVU9NK3VXQllDeWxZc2FFTlRNZVNT?=
 =?utf-8?B?bEZzSWFOejk5TVVvSEMveVpuTTFZeHVqUlErNGd5eVBLMXpIdmhFZGZIc2VZ?=
 =?utf-8?B?ZCsvWHpvQzdQTzR5VXBlTUxPc1VxYVQ4MURaN1l3SXpLMDN5a0sxSXRITFRx?=
 =?utf-8?B?MTBPVVRxaUVlZXNzMzdnK2N6QkowWnNEUUI5dVlnbXltMWtHWHBUTTNjbWI2?=
 =?utf-8?B?Q1puelczTGRHVFVxQzd6Ym0zNm9xeVpUZi9hQ25DRnhvdGVWU3loVS84Zmc4?=
 =?utf-8?B?Z0gvQVlzRFVST21ZUkhFTlFlNWpIZGRCYUxpT3NEbzV4WlZPRVJJKzZ0VjhP?=
 =?utf-8?B?WTYvM2JHb1JybDVJc1pYVU44WXRFR0VnTHlWLzlWMFVtdm1ROXBkU3pzZVZP?=
 =?utf-8?B?aEFOYXFxcnlpQjFVeDZ6bmVpeEYrSnZxR2FTeC9PdmpoSDB0TFZNZWQwRmZ3?=
 =?utf-8?B?LzlnNVpjYzQ2ZllQWXk0SVlOSjhaQ1oxT0hiTm8wLzJTbzhVa0VoSTZJeGkr?=
 =?utf-8?B?T0tvV05yUTkrUTJYUEhqT0VrVXlxSlRYMnJCbzRPTk1sSVQ4YkZwUT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e5497e1f-4074-45d8-f137-08de755781be
X-MS-Exchange-CrossTenant-AuthSource: DS2PR12MB9750.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2026 16:53:03.3572
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xOwmvtgl9qN7HelY9n75TwI6kxQxZUVNO3Cusxepmf9gXihGZWujHaFQjFG+mndZNeWaYbXxvKcoyUZlg/1x9A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6285
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
	TAGGED_FROM(0.00)[bounces-94327-lists,linux-arm-msm=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,Nvidia.com:dkim,nvidia.com:mid]
X-Rspamd-Queue-Id: 7B20E1AC922
X-Rspamd-Action: no action


On 26/02/2026 11:16, Manivannan Sadhasivam wrote:

...

> I can't certainly know what is going wrong. If controller driver suspend is
> skipped, then ideally the controller and the NVMe device should stay powered ON
> during suspend. But if the platform pulls the plug at the end of suspend
> (firmware, gdsc or some other entity), then all the context would be lost and
> that might explain the failure because both the controller driver and NVMe
> driver would expect the RC and NVMe to be active.
> 
> You can try commenting out the whole PM callbacks:
> 		// .pm = &tegra_pcie_dw_pm_ops
> 
> If the host itself doesn't resume, then it confirms that some other entity is
> pulling the plug (which is common in ARM platforms). In that case, we have to
> let the NVMe driver know about it so that it can shutdown the controller.

For Tegra, we enter a deep low power state known as SC7 on suspend which 
does involve firmware. Nonetheless I tried for fun, but this breaks 
suspend completely.

Jon

-- 
nvpublic


