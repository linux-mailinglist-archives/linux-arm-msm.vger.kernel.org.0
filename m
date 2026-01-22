Return-Path: <linux-arm-msm+bounces-90256-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4I2BFSJ3cmn3lAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90256-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 20:14:42 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E12076CEE8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 20:14:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A63D03016CB8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 19:14:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35F993904C3;
	Thu, 22 Jan 2026 19:14:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="UPjWZE8W"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013056.outbound.protection.outlook.com [40.107.201.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22B55372B25;
	Thu, 22 Jan 2026 19:14:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769109272; cv=fail; b=MC7X39/cPfvPO8kLDPqggWWETx9xFxKLNTlrODf5uQlJqEpEwnQpYzbgjC9XbhnkBXpHcXTPOHD4mFB4CGjy+nhqfQCSHzh4H8wvUb0kcDNflHjgH4CTfUNVg7dfZENhqHk+9zG8eLKgiKpoSDEJxwlypBQcYqjutCRabnw+QB4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769109272; c=relaxed/simple;
	bh=SD7mSzvC4tSMcrbgsP0hLl9E8Z+VCOZnVzWnS+TwFpU=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=HnZH4CviD8xW+E8VqOAiNDKHP5mwwhbvcz3MZoI2fIJ5ILDcI7XPaxii+vOrnilVYe9ixKECo95Wy16ro5OJj3Mscd7DfPAAnHk+LzULoaHqGr7dCarjZtmJcM27t+HVOevjnQTrvQmtUkohbMaXa2TK7bwycOWO5UdDigUF9e8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=UPjWZE8W; arc=fail smtp.client-ip=40.107.201.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VhdhEz5BCmcro152fIuw9JwHQOyBras1bxgjh0KT/dUCKj/HKr6PXhNy0QupBd1KnL//aBWksfIoJqgUH3V1xx+bi4yt1D4Ps+3BFdpIhkgs7sDHTkb9cnwJlWn+KlTLa8ICKbCi70iZVTKsF0pIr7bjja48e89EHB0iF1vVwuur9wwNIgxhGf51rCr5p7BKsWY0KEvUkEvLu/ZxkYAidowIXDyj2J93PmZgbBgkhG/Ji5Ph0CfgRhrJIMyOWmMHox3fo0BJCZP7hRKJbQEQgclCPTDOxEfKhX3f2aSgg70UN5EJSesbtue7JpyWwXKO0NHH26lJZdF43MBSMX87vA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xZfj3EyGZwYmLk1lnfTDqEgp8Hez4/Kx3kGULqcdSFE=;
 b=W++cTb52nsQvhxRz8thdey7LVyfk5AiMfY0VFz4N3djS7rN+JQIxaI81oQg6p+FjiYbqDYe+mHBqwVe6+6K1UMG61i45iTGeLq1vsrERTTULX97szarPEXoffiKa5CK3xWXXlqw5QyJex1GSgLonnD5UwelQBeuhLdng2BBCrYS/xqPnLPoqsQ8IbHi1/Fcm5b6VEmJ22o7ctAsPl+h+6MJl+L8pEqUI/MYKZtHQwv4/Ft8Jz23gtEs207O7ihSYt2jBNmh7rk8p0PfU4kT0UlFYbhmYJkrpDZPBTF6TwtJfYGlwHLZqdqsBxIP3JrVMFChvvUCTxS28Wctil9DSKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xZfj3EyGZwYmLk1lnfTDqEgp8Hez4/Kx3kGULqcdSFE=;
 b=UPjWZE8W6hMFgLNqYia5vrpcHZRvxOFPqnQZHJjF+22to7SSYjYH4JuKvJerJc2sDFyZH0rWBMfSu+BN+++AFRERlYd47VQT9Mr54cjVVf5tSJqd/fVuZTRkzF7kbqVTrGzWOo1+uVZeZq3a45IQtJJ8bgf1j8OiSFawiLr2YPxd/uCYatAfdFy/MW9XZG/dF+AGRsMkl6/JcAB7h/riAsKywTk9/k/P6WOTp+i4jyaT9Q0eNz26tvPmDQpmJ+H47iErabQbFV57hiUDWdpLoG0cZRzi80FvpD0Ps3kTs/tXedqKTC/7Z7EzB61OkTUnT0Ob1r8DW9hrjxiQmfdF0g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS2PR12MB9750.namprd12.prod.outlook.com (2603:10b6:8:2b0::12)
 by CY8PR12MB7729.namprd12.prod.outlook.com (2603:10b6:930:84::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Thu, 22 Jan
 2026 19:14:10 +0000
Received: from DS2PR12MB9750.namprd12.prod.outlook.com
 ([fe80::56a8:d6bf:e24c:b391]) by DS2PR12MB9750.namprd12.prod.outlook.com
 ([fe80::56a8:d6bf:e24c:b391%5]) with mapi id 15.20.9542.008; Thu, 22 Jan 2026
 19:14:09 +0000
Message-ID: <e44c330b-778b-4fa1-b678-fa909cc05b03@nvidia.com>
Date: Thu, 22 Jan 2026 19:14:04 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] PCI/ASPM: Override the ASPM and Clock PM states
 set by BIOS for devicetree platforms
To: Manivannan Sadhasivam <mani@kernel.org>,
 Bjorn Helgaas <helgaas@kernel.org>
Cc: manivannan.sadhasivam@oss.qualcomm.com,
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
References: <7306256a-b380-489b-8248-b774e6d3d80e@nvidia.com>
 <20260122152903.GA1247682@bhelgaas>
 <5z7c25nkb35prvax6vq6ud7eaeuhzsswbf7fqvmlgys3xftgwb@odocboejrdrv>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <5z7c25nkb35prvax6vq6ud7eaeuhzsswbf7fqvmlgys3xftgwb@odocboejrdrv>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0292.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:196::9) To DS2PR12MB9750.namprd12.prod.outlook.com
 (2603:10b6:8:2b0::12)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PR12MB9750:EE_|CY8PR12MB7729:EE_
X-MS-Office365-Filtering-Correlation-Id: 02518f0a-4abf-41e6-9aba-08de59ea6b96
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?THRERjdSRTVELzV4STlyQzVUaFJEdlNPdGh5cFZEQmp0NnN6Y1MrZ01lNkRk?=
 =?utf-8?B?NEl1Y0RNSHF2dHhabHdndVJ5YWc1K0hLU1ZwM3BPV0pEYWQrdk9KSnEyTTR0?=
 =?utf-8?B?KzJQVzhTTHBDMW14RktRaENqeGxkR2lJYkhXRTBKVzhXc01TTmM1eVdjNnJD?=
 =?utf-8?B?Slg3aUNrNElxUFRvT2RtRlY3QWJKVVBBaG5HdVBTTHArMlUvMEp5K2pwb0pS?=
 =?utf-8?B?ZDhnZjZsb2RNQ1diLzVjMGhzZTBIRDZlcy9LM3VqWHFpYmF0eWJLUHJ5WWMx?=
 =?utf-8?B?VWhkL0Fyb3dPcFVxY0VwWlBzNkhzbjBGWHUrWEJjN1A1MnZyVTRVRXJsY1JE?=
 =?utf-8?B?VlJWN1FRZDU0aW5ONGtEVG9iUnFqS29BNmpYaHZUR0EyWHlqajYxbjVOMXhn?=
 =?utf-8?B?aU1zVDA5ZnczSWhFNkJpejk5eUNmWVJ2Sk5CODlxdFhSOHNHVGxHTTVzMFQ0?=
 =?utf-8?B?T0tEd2JMNVlMcVR1VFpQOUtmajA2eCtZOVFkQlUwWnZQY3dWZWJ0MmVZMlhi?=
 =?utf-8?B?emZ3amxOOEczNFM2NVVrWGNseWxxQkMzWWxpb21GZGVYeHZVQ010RWZ6cHZl?=
 =?utf-8?B?L0QvMVArMUEweSs3ODEyRlFwNmUxdGt2TWllTUhtbXR1ZjV0SXZmVWo0eUtC?=
 =?utf-8?B?MUhDSnU5S0FxQU8zcUl5UFh1L3pxTHN3aUxNN3YxWFMzNkxtYjR3bktYRGJn?=
 =?utf-8?B?TUQ3U3FTTzhDSzh1M3ZVYmtkRW9UUmd3aWpnWUliakN1azdURE5OTEdPeHlq?=
 =?utf-8?B?NnJ1MlpWOXlnZXU1bmNBTnZMUE42ZjJDd3F2SWN3SnNuNnBaV2FyZXUxS0t6?=
 =?utf-8?B?Rm0vVjFOSjRxT2hLbS9iMTdhREJoVHlLZDlTQ0xXbS9LTWdEVUxSaTNEY1dE?=
 =?utf-8?B?R25tRkViYytUUGROWjVNR2lGdnlqSUVCYnhab3d0Nk9QM3BMd1hsM1BSeDR5?=
 =?utf-8?B?a2pDSkR6TFpuU2lEQXJkNENEQTZIOERXbjFabWppUEp5ellxSFdSakdmc1pG?=
 =?utf-8?B?V1VYbjN6R09xcWlQbGRNVmJrZGxDVFZwVUFRZk10dVhxdkxHb2JZSTJuSXFR?=
 =?utf-8?B?TE1XSWtZb2ZMU292TmxTVkF0OXMySEVMSk1pZTN1Q0RzeHV0c1ZJMXBkOUcy?=
 =?utf-8?B?VnpPalo2RHZNbW9uZVdoMWFzRDdxZmMvQ1N2TFRaYVlDYjd0d3ViOE45L0U4?=
 =?utf-8?B?Y0lsc3lYVVdIaERnNkhOc3FlTDJJREp0MjU4U2tzUHlUcElCaWFlS0Z1bzRI?=
 =?utf-8?B?cHlYMlMrdFRBMWpEUDVTYURTVmF2cG0wU0NMN3ZXTzB0WXMvNmtxRnZZbktx?=
 =?utf-8?B?QnBxNHFjeGVydmMwMlBwUmxndzZGOElIaGVIdmsrOExzOEdGSVNocGJ1Y3Rv?=
 =?utf-8?B?NE5kUXVSdUVSd2VESzhQcE81RDBmMU1KR3RQOHVMMzJYeHAwUHpXZUt3Nnp0?=
 =?utf-8?B?cTVCTmhOR2pidHRObU9KWFdXNXBDcldFNitoamhIUXJMWGdFQjEvVHMyaG1L?=
 =?utf-8?B?OVhsck1nR3NiTHBVTjhkeGIxQ2dTUjZtQ3ZtVFhQb3BnajZNM1ZtczNSR0c3?=
 =?utf-8?B?RFM1YmkydzV6ZE1maml6dnVYdWI4ZU45bFZiOW9lSmNldTJkWHRaNHdIM2JO?=
 =?utf-8?B?WHoyWXorMWw3a2RZVzBUMndmZjhaaERNVGRJSXAyYUgzL0hJeGsxcTZhdmF6?=
 =?utf-8?B?cjQvd1hYREoxcmp4b0tLLzhua0ZiT0NrZWFHakVZTStabmJtMHQ2L2IvbjBJ?=
 =?utf-8?B?VmlmQXh4TVhEM3lpTVFEMThDUDJrTDIwbmR0R0JJbFJHdUpTaFM3YS9PTkF3?=
 =?utf-8?B?R3J5NVZGNWNFWVhSNFF0RDVwaDFSYWZKSGRPODVnZUFUVzdWdm0vMllhKzJj?=
 =?utf-8?B?T0QyUXpEWTRsdk5STWtZN0t1UjdIUGtaZTJCSW9vYTloMStMZW9ueWRrTkhi?=
 =?utf-8?B?L1hqY2hvckNleWp3ay9JcTgzRnlwaHlHbWNrY3NScytxZzhYL3V2RVd4dXRk?=
 =?utf-8?B?bkl4MVRQNnVaa1NoM2lTU25zTzFVTFZDeHdUNFBmQ2xWU1pGS2FhNXMvcVZn?=
 =?utf-8?B?cmR6YWgrbDZaS0FvQUhqaWxUTGh6WGsySkdyRnhUd0VVM21icnJtNGExd0tY?=
 =?utf-8?Q?P4rA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS2PR12MB9750.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UkoxN0tNeUhLTmdKellIQUVNSFFveXV1Sk8wNVNLVkJSZVRKTDZmazd2eGVw?=
 =?utf-8?B?SE5PZ0Q3QmJMNG1wSmFDcmp6aEYyb2JURWVtSEk4M0RJREc0eWY4Qlg2bXlS?=
 =?utf-8?B?M1ZXKzVRU1hEMU8zYlZOeWlFeDNaanh4V0pOT3k2MU5OTFBNRm84dExBS3do?=
 =?utf-8?B?aTNPTVh1WHBiMVFZMFd5U1NJQXovbHlzaFV1L1hNK2RrRU1MdnR4ZWFzYWxZ?=
 =?utf-8?B?Q0FqNHFMblU4NndUMHlMc2lkM2JJR2ZZOW5rVUFqdmVlREwrZUJIN0RKbnVt?=
 =?utf-8?B?WjJOaDJrY3RDY3dnVGlsdm5hOVlkSnhqTXJJU1JMdHVTQ2srQ0xlRE9HYUU2?=
 =?utf-8?B?MFc1YVd1K043UmxZRGVlZXl5dHRVL04vcEp6WmZlbHF3aks1T2c5eGFwM3RK?=
 =?utf-8?B?NG9LZ09oNFk5MzhONGxuLzVuaGVaOTB2M0l5alpOL3Q2N2J6NFk3blBHbXlt?=
 =?utf-8?B?RDRZTHE3c0R2dnE3WVBqVU1HSVVWUXpndlN5aEJIbGFONlkveEtwOTA5UVNj?=
 =?utf-8?B?MlliTnJoR0lzc3hSUFZlN1VEeEF4QVJ2eHZ0QW9LZEpMU3dOUmEwZkdjVGJv?=
 =?utf-8?B?b21SYTJJTktZc05rZ2hKWWhWbjFaVTZNWkZnQkJLeFA4WWdjdmViR2ZraDBo?=
 =?utf-8?B?Qjkyam93OTNCaVdYZWRycmlGV2doeUlVeUlDYlNJaElwTjlDcnFoZW13MVRU?=
 =?utf-8?B?cHpMWGdndUNNMHo0R2FPcCt3bTU5UE1Rd1JMOThxQ0NIdGJ0V3dsS045VmUz?=
 =?utf-8?B?SVVvTFVHU1FNMmk0RWp2OElHczVNVVBCUnFScEVhRGlJbFBuRG5nK3hkY0RD?=
 =?utf-8?B?bExFd2tzYjl1UVRMeTVoall5djIxNHBCQVlDQW1aMXRiS1FkTGNBWFFmSUxi?=
 =?utf-8?B?RGw0YTNLZFBlRlhFaE1TM3FZalEzV24ySlBHWWF0ZFUrQWFINmVOZWN5c0Zy?=
 =?utf-8?B?M0Q4WHNrNG5MVWw1WnNDKytpckc5bzdUbzVtM3RWS1JidUJhMlFsa3UzQ2Er?=
 =?utf-8?B?cHJ1RFRxMit2V2d1Q3hjQTlEb1NyczhIVkVCNUZzL0Nvb0MySXJmS2lrYnhN?=
 =?utf-8?B?dUVMSHhTZ1dnbGJQRHNvTTV4dk5tcEJXL0YrNFF4d1ZLQUdJdHZOUkQ4MjJB?=
 =?utf-8?B?OUNORDdMZzArZVJyR3IzV3Z0QkswZkRjUWwrU1VwR3pCcWVjclJHUGE5MWxk?=
 =?utf-8?B?ZUlYV2QxREdKZ0ZoWG14RXpWdVAvWEdaRkVSeElxZW5VcmNTNjFHOFJSQk9L?=
 =?utf-8?B?T0tsTHQ5ZU92TmJwSDdIdVZSQXZuMmJvaHVlbTVHamtUKzZNY3VHNUdaYW01?=
 =?utf-8?B?bEd2ajBEd0RvdWRHRk9JazZSYXg4eUFDNmRRQWxheXR0TTl1T0hBVG9ZbWJF?=
 =?utf-8?B?RlNYVUM5M0luNi9PdXYvaTFoUGh4Um1IUXBUNnppUkJCcjh3TlBpb3lrNjlQ?=
 =?utf-8?B?Yi9ZUGM4UWl5a1ZrRTU5Yk1UdXJ0dkR3QWtSeThSYkxzNjdoTEs1SDNVSUt1?=
 =?utf-8?B?d2N2QTAwbktKa3JpaTJyQlNHVEJ1YUI3TlN5TTRQeldDZDRQVndBYlpVb3VX?=
 =?utf-8?B?VEdwbFNoT2J1c3JoSks4UVI2TG9KSUhINWYxR2Q3eEZQUWlMOGkveWtKV094?=
 =?utf-8?B?Nzd4YjEwd3pmWHIyM0ovaFBIV0x5S0g3RWtnZWtsemlMSXEyM1U1bWdIT3Vs?=
 =?utf-8?B?bERHbGFJRDhzR0hUVVNNRUJrakNLUVhrQUR6MTFaTEY1Z0F4dERyeFZWeFls?=
 =?utf-8?B?cDFqNTIra2dhNUFidGJlTkFhazJ4RGkvcW9QY3pMb2dJQlNleHhOQnlmcmlv?=
 =?utf-8?B?V3ZOZEk0MEJCdlY0bjVWMGZSSjBSUTBVcmx6YnRCWEszV1c1RnBCWkxYQTNq?=
 =?utf-8?B?Z0g2M2o1cURSMXRFR3E2Z3J0NHYzNTM4aGk3L1AxbElIeDJWbVRFeWZ5QkJ3?=
 =?utf-8?B?V0YrNzZ1RTJhNUpjK1NZalRFZEFabWVuOCtRZnRaMWxCUzNLd0IvZE1VVE1L?=
 =?utf-8?B?a05QeDEwK3FVMU1ndGxoUk5xYXQzSjFiWHFGQTM5bDkxVXN5U05UT01EczJU?=
 =?utf-8?B?ODFRcXp4a0ZrMGxzZDVqNk1zd3RzYnBEbHZOUDZodjdmK01GSE9mUlR0SlhK?=
 =?utf-8?B?M1dMRTB1andGNThYWm5CYmo0QnFaemd2NmEvSm1mOWI3ajBYVXFObnZxZkdQ?=
 =?utf-8?B?T1Q4dlBGTngzOHFtNk5LKytHYlNTME1ZSGQwL25FbFc3cGpzQ1g1cUIrdEhs?=
 =?utf-8?B?QnAwdlBUYkNMbjEyKzlBc2tsTGFFMGh4MEI1eHFiR0tvblRmaDR5eXI3S3lN?=
 =?utf-8?B?ZWtyWDR2RWdBSEF6YlVJbEVWVVdHcVZXU3NJdS85Z0hjZENwMEg4QT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 02518f0a-4abf-41e6-9aba-08de59ea6b96
X-MS-Exchange-CrossTenant-AuthSource: DS2PR12MB9750.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2026 19:14:09.7807
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2JhzP2nexFXorq0sPbQD2gTev9aXIkESFLJtCoDvI2fPwIKIOi38xCkxfA+wrdP8qknK+OuuDJpaxg+iYLZ6bw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7729
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,google.com,kernel.org,vger.kernel.org,linux.intel.com,canonical.com,gmail.com,kernel.dk,lst.de,grimberg.me,lists.infradead.org];
	TAGGED_FROM(0.00)[bounces-90256-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
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
	NEURAL_HAM(-0.00)[-0.994];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[Nvidia.com:dkim,nvidia.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: E12076CEE8
X-Rspamd-Action: no action


On 22/01/2026 17:01, Manivannan Sadhasivam wrote:
> On Thu, Jan 22, 2026 at 09:29:03AM -0600, Bjorn Helgaas wrote:
>> [+cc NVMe folks]
>>
>> On Thu, Jan 22, 2026 at 12:12:42PM +0000, Jon Hunter wrote:
>>> ...
>>
>>> Since this commit was added in Linux v6.18, I have been observing a suspend
>>> test failures on some of our boards. The suspend test suspends the devices
>>> for 20 secs and before this change the board would resume in about ~27 secs
>>> (including the 20 sec sleep). After this change the board would take over 80
>>> secs to resume and this triggered a failure.
>>>
>>> Looking at the logs, I can see it is the NVMe device on the board that is
>>> having an issue, and I see the reset failing ...
>>>
>>>   [  945.754939] r8169 0007:01:00.0 enP7p1s0: Link is Up - 1Gbps/Full -
>>>    flow control rx/tx
>>>   [ 1002.467432] nvme nvme0: I/O tag 12 (400c) opcode 0x9 (Admin Cmd) QID
>>>    0 timeout, reset controller
>>>   [ 1002.493713] nvme nvme0: 12/0/0 default/read/poll queues
>>>   [ 1003.050448] nvme nvme0: ctrl state 1 is not RESETTING
>>>   [ 1003.050481] OOM killer enabled.
>>>   [ 1003.054035] nvme nvme0: Disabling device after reset failure: -19
>>>
>>>  From the above timestamps the delay is coming from the NVMe. I see this
>>> issue on several boards with different NVMe devices and I can workaround
>>> this by disabling ASPM L0/L1 for these devices ...
>>>
>>>   DECLARE_PCI_FIXUP_HEADER(0x15b7, 0x5011, quirk_disable_aspm_l0s_l1);
>>>   DECLARE_PCI_FIXUP_HEADER(0x15b7, 0x5036, quirk_disable_aspm_l0s_l1);
>>>   DECLARE_PCI_FIXUP_HEADER(0x1b4b, 0x1322, quirk_disable_aspm_l0s_l1);
>>>   DECLARE_PCI_FIXUP_HEADER(0xc0a9, 0x540a, quirk_disable_aspm_l0s_l1);
>>>
>>> I am curious if you have seen any similar issues?
>>>
>>> Other PCIe devices seem to be OK (like the realtek r8169) but just
>>> the NVMe is having issues. So I am trying to figure out the best way
>>> to resolve this?
>>
>> For context, "this commit" refers to f3ac2ff14834, modified by
>> df5192d9bb0e:
>>
>>    f3ac2ff14834 ("PCI/ASPM: Enable all ClockPM and ASPM states for devicetree platforms")
>>    df5192d9bb0e ("PCI/ASPM: Enable only L0s and L1 for devicetree platforms")
>>
>> The fact that this suspend issue only affects NVMe reminds me of the
>> code in dw_pcie_suspend_noirq() [1] that bails out early if L1 is
>> enabled because of some NVMe expectation:
>>
>>    dw_pcie_suspend_noirq()
>>    {
>>      ...
>>      /*
>>       * If L1SS is supported, then do not put the link into L2 as some
>>       * devices such as NVMe expect low resume latency.
>>       */
>>      if (dw_pcie_readw_dbi(pci, offset + PCI_EXP_LNKCTL) & PCI_EXP_LNKCTL_ASPM_L1)
>>        return 0;
>>      ...
>>
>> That suggests there's some NVMe/ASPM interaction that the PCI core
>> doesn't understand yet.
>>
> 
> We have this check in place since NVMe driver keeps the device in D0 and expects
> the link to be in L1ss on platforms not passing below checks:
> 
>          if (pm_suspend_via_firmware() || !ctrl->npss ||
>              !pcie_aspm_enabled(pdev) ||
>              (ndev->ctrl.quirks & NVME_QUIRK_SIMPLE_SUSPEND))
> 
> Since the majority of the DWC platforms do not pass the above checks, we don't
> transition the device to D3Cold or link to L2/L3 in dw_pcie_suspend_noirq() if
> the link is in L1ss. Though I think we should be checking for D0 state instead
> of L1ss here.
> 
> I think what is going on here is that since before commits f3ac2ff14834 and
> df5192d9bb0e, !pcie_aspm_enabled() check was passing as ASPM was not enabled for
> the device (and upstream port) and after those commits, this check is not
> passing and the NVMe driver is not shutting down the controller and expects the
> link to be in L0/L1ss. But the Tegra controller driver initiates L2/L3
> transition, and also turns off the device. So all the NVMe context is lost
> during suspend and while resuming, the NVMe driver got confused due to lost
> context.
> 
> Jon, could you please try the below hack and see if it fixes the issue?
> 
> diff --git a/drivers/nvme/host/pci.c b/drivers/nvme/host/pci.c
> index 0e4caeab739c..4b8d261117f5 100644
> --- a/drivers/nvme/host/pci.c
> +++ b/drivers/nvme/host/pci.c
> @@ -3723,7 +3723,7 @@ static int nvme_suspend(struct device *dev)
>           * state (which may not be possible if the link is up).
>           */
>          if (pm_suspend_via_firmware() || !ctrl->npss ||
> -           !pcie_aspm_enabled(pdev) ||
> +           pcie_aspm_enabled(pdev) ||
>              (ndev->ctrl.quirks & NVME_QUIRK_SIMPLE_SUSPEND))
>                  return nvme_disable_prepare_reset(ndev, true);
>   
> This will confirm whether the issue is due to Tegra controller driver breaking
> the NVMe driver assumption or not.

Yes that appears to be working! I will test some more boards to confirm.

Cheers
Jon

-- 
nvpublic


