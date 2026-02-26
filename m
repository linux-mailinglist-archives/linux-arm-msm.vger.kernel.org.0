Return-Path: <linux-arm-msm+bounces-94328-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6AIaFHOHoGlvkgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94328-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Feb 2026 18:48:35 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FCFE1ACD8C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Feb 2026 18:48:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D02C333BE39F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Feb 2026 17:03:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D352D426EB8;
	Thu, 26 Feb 2026 16:55:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="H5ruoMgI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011071.outbound.protection.outlook.com [52.101.62.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92F07372B43;
	Thu, 26 Feb 2026 16:55:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772124946; cv=fail; b=I8G4m5exQTZqCA4MWUETjgF5KHBRwAqOgwYi3JRc0KeLLXtcigHcAY2PkNyGpOh3ltrNQ+Vh9EKf1i0p8iucpS32ZotFFp8aR9f3IX5pVM/nitvmgILjczgRkgtcKWo8mpV1ZN6E7k2DdvSVUDIxOTkH2vnMWQrXL5fgHznIlPg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772124946; c=relaxed/simple;
	bh=6Vxkqu8CftQc848SdoScbAIUHKQ0kynEyOSW2+po//M=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=LloF2C2dKWl22hQVtsjl2g/SCTISrXEAHDyDVzV3ozJRG2+FKszum5VAGuFuIV6M3KLTQfIavQGvTIvStJ/V/rDEobZfyyFqjbNuDEvZmcAndQHx5TvivxOEzr5uUb7dJVPkUKcCFmH1YbpBl87A12B+kRN9LHj556Mu2FTsWv4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=H5ruoMgI; arc=fail smtp.client-ip=52.101.62.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vwRRARjZDgLDBnW8yNdibPoGJNKidxmQaJj0hVDArBBPU9AG2MsRvSFbbZjrxLm3567g1Q2mbW1F7ncIz8c71VLx6uQhSujzPnmFmlN53DOHnQ7+MTJWvxDejjJu74hoFHjn5OVul+f8g0dp1GKAtnpFduXtfsWsL0rzH5XgRD0Zk584XWdIYQmfiQCJUJXhHuMjkF7bkAbW6vM89GUZvvnUthKhyfueuTWBh1SsZ4LmkXYz3WQlEtdHnUZNcYc4ICGTs+5UwyjM/VahL6uHjogsMHSxN+fHsuLaN/xTZTDW3QRtVvltsCSNzACPOsULdiSewDqRue0wJZMlQbpI6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w6qNtiqSBbApIMksjHLOMt2rP0Hvr3Vlgv29CnCWCBg=;
 b=ej2SJfMfZgVaSqyjZkZTosrjhYHm34psiAOVmdhLAR6c5iuHvMqvwDdxJu75Lf/6+9QrlGHWjgstoRvAY7f7bdAtfU2v1H6ppyczVLYewyJVrBX0zXCYUEISq55co91bU5+H3QVoSWvfzWbxjmGVEW/5nEp/e21RtfibzCtir0WeHP4uTX9jFhGuE7HwlmBE+ZXWFqci+TiqNOPf+LviG2MWZcYq8hPz0/xEoGEEjUmzO1wglrrJez7SXinnbe/UuqbVdHJqyo9dMqlzPhO8c00yvqLoqLSFTRZKwqROKIaxWbYJ4Dk+rfyrmIaN0COYCzqvzmIz+nsilx3RCSwM3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w6qNtiqSBbApIMksjHLOMt2rP0Hvr3Vlgv29CnCWCBg=;
 b=H5ruoMgI1gG60ZrGcnHmXSAUQJ9xSCdNoxXB14UBD6Vu3+9EMXkOaoIFliR6kVemuO7bKXs1LsOZ3jHWXS10UKdnd9qxDwFYhzqlLzfkFl0gST71chX8MWkty0U0/13MLwlau+/7tTb3heGql1smFIGYpV8DRZNqerqLZmlmyI19iIQ+zDiZDO3Kor/gbnNp1DdNpjzDLee7jJKiTA7OcWrjRd2Oe339N+amzvbkw09Fj1ewubYUndZVLTu2YUB2TD9oozvlngr5ZMPMXpjVkSJkp8kH4OV1UDYOuyNwoamcaMFGGXSh6TE7DJWmL9UlNs3crXCrq1w9JWmKgeoFTw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS2PR12MB9750.namprd12.prod.outlook.com (2603:10b6:8:2b0::12)
 by MN2PR12MB4357.namprd12.prod.outlook.com (2603:10b6:208:262::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.23; Thu, 26 Feb
 2026 16:55:40 +0000
Received: from DS2PR12MB9750.namprd12.prod.outlook.com
 ([fe80::56a8:d6bf:e24c:b391]) by DS2PR12MB9750.namprd12.prod.outlook.com
 ([fe80::56a8:d6bf:e24c:b391%5]) with mapi id 15.20.9654.014; Thu, 26 Feb 2026
 16:55:40 +0000
Message-ID: <cfbbe3f0-f958-4cf2-aaa0-afca52cc5d5e@nvidia.com>
Date: Thu, 26 Feb 2026 16:55:34 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] PCI/ASPM: Override the ASPM and Clock PM states
 set by BIOS for devicetree platforms
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Manikanta Maddireddy <mmaddireddy@nvidia.com>,
 Bjorn Helgaas <helgaas@kernel.org>, krishna.chundru@oss.qualcomm.com,
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
References: <20260122152903.GA1247682@bhelgaas>
 <5z7c25nkb35prvax6vq6ud7eaeuhzsswbf7fqvmlgys3xftgwb@odocboejrdrv>
 <e44c330b-778b-4fa1-b678-fa909cc05b03@nvidia.com>
 <bf37b6a5-268d-4c07-a536-a826b3d5953b@nvidia.com>
 <unc5zefwndgcv7wufaezz3gkg3qtaymkjlmymhyqdqwzn3wybl@ow2rhbyt772h>
 <f9ac8c8f-8959-416b-ba90-14f0886c5bc0@nvidia.com>
 <a5m4pqtiaxsq5lmq64roro633ganbeq7mypa5ojuuqy4npkvok@wcogdbzaq6xe>
 <7157c68e-97f3-43b0-bfb5-e271a8f2a4b8@nvidia.com>
 <cf1e685a-a1cb-45ec-bdc3-1ef1a3d1044e@nvidia.com>
 <e0a0dc6d-fff0-41ec-92eb-7f2dbefa967b@nvidia.com>
 <vpwe273ehsbsyjpysyky4ypgnawosjehen34rr2n5bpoaqjsyg@3uylwh3oyyqc>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <vpwe273ehsbsyjpysyky4ypgnawosjehen34rr2n5bpoaqjsyg@3uylwh3oyyqc>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0065.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:153::16) To DS2PR12MB9750.namprd12.prod.outlook.com
 (2603:10b6:8:2b0::12)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PR12MB9750:EE_|MN2PR12MB4357:EE_
X-MS-Office365-Filtering-Correlation-Id: a6ce66b3-09ee-4c56-fa9c-08de7557df53
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|7416014|1800799024;
X-Microsoft-Antispam-Message-Info:
	m57uNyXM6I5+cUw2Wuubj3Jm0+5lN6yFjC6kJELr2dJkARB8EHyaOBAIwuLwXCxE65hRxQZPLDSRVw1PaQ+5g8Ox1Zr6aeu0rTb3NHplblFt6+eBIZWysKCu69PI9IQoHwyY9ReT5TW8dHr7W7J0JlEur+cFrFAFx0gJ061ceGdBjQAWjyVZJL/rNmJT2dCO4MyRxN6pCUY7bvu6ZA5ReEqe+Wq7HRlJDuGV7PjK2cgwb8c81icHpG2jNk7JmYtNJCjia5Qvd30JZkxZHpIbidHsTgRQs7Pc8NsNN0F5XYOYsSHLPwVSo8wg5/vbXjQj2XBST/93p1QUkFs1EDhYu3CcORphufEzfKUJ7XD1kCo1BINXkj0958VdyOf4bScIfbRfkqynrOsELpjiwKwU7rZFHiW3fbLUVcT8P+ZmNFuf6VFuzl6nfdBYiFAm6P+fnThdg55O+MQ70OlIXIFFmkUDR8y/DabV/McacHPF+n/Q53rOm872EO1r46nDMYvt5ZKqJq/NykNV6I5zKRLadtPrO4IKUs7DHyJQLcoK89RG9QELXJZb/DKTY4WCX8VP921Zd73yQGYnEMl8F7emxTOs56+FLhmh6a/hOUihwkVTqQYi7lPCCPZDX9WETlMuaCppguwmKVfHwj0SX0DXgWkpU3+Nzp1Qjek2yd7pqkbv9q15UnUhmqcK87qvn/KZXSiIwhjq6u1fpdoOpV8IE1MpDuD+O0/kSXJ/ilfMI7M=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS2PR12MB9750.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bzk5L3dMcnlMTUYrR1JVS2cybDR5UTh2YUlYMEJzK2xseDU4NSs0VTNCSjRm?=
 =?utf-8?B?ekpKSDhOVUFvOTVTZlQ2b3Z0Q0NUbnRvUU12TmRES0ZuSWk2dCtkZ3MxR2NK?=
 =?utf-8?B?RmdlZVFZT3Z6cWZTamdTOVkrNzFrMXV0Y2ZJZUJ1UTN6dFlEeXF2eE1laFFt?=
 =?utf-8?B?cHRtanA2RVRxNnQ0c2pEeE83cy9vSjZDc1BWenRHRG96OWFQamZpN21naTgy?=
 =?utf-8?B?c2loSUI1cnRpamRGRTVFVUFJTFVNOGtNZGl4ZFpzemFmZWhLMUxXU3U4NE1C?=
 =?utf-8?B?MGhYOVhJeEN1bnhuNFhhQ3N5R0hyTXkwZlIvRTJEOEdqTHljVlc0RzRvK1VW?=
 =?utf-8?B?UWUwbkFobzl0a0lZSDgzUVQyL3NvOURuMnpoRzVtb3Q3d0FxL0hKZEhwdmxJ?=
 =?utf-8?B?ZkpQbG5oVmYxOFo5Vk43bCtiRVVxQUhLbXU2ZFpjWXBuVW5tZDcxSW1qLzRZ?=
 =?utf-8?B?bG1KYXpqVHRSWmZ5cXh3UG0vZE5Eb1Q2YUhwM21TZ3ZoS2I4VlFrRDd5UGF5?=
 =?utf-8?B?UHlvWFNMR2NHckk5cHp1eGJOODQwdUVHeXJhQ2UrNmVvTGRXTU56eWxEdTBj?=
 =?utf-8?B?NU5UbHhtN1VYWFoyalBvUEg5R2pjelBGL0VzWXNtL1k3SWZ1WDRNa2p4TnNP?=
 =?utf-8?B?SjFZV1FSa2hRekpSeUdmR25Rb1FFWFFkeEVGTjNIcG5ha3pMMXhXYzZrS1c5?=
 =?utf-8?B?QTZuS05DQnRiSXhkZW9mVUY1V2hjOWIwZGJxNWJLWHJvY2M2RVNoZ25wSE0y?=
 =?utf-8?B?b0VTa1hLTmpkM1pUSm5DT0tGVlFqOC92eitUNzc0VjhxODNXVDA5V3ZBWXln?=
 =?utf-8?B?MWhVQUxQQVdoc2tFeVdlM1lMSlZ3bHJJdWUrUXo3Y3cwa292ajFwWFYvNUVB?=
 =?utf-8?B?WkpOQk9zWGE1Y0RZakg1ZmtTckVxbno2LzlHMTFVV3dPTUdVZmJuMkl2RVRy?=
 =?utf-8?B?NHBuRjJkUWZBVUN5VUZKdzhBUzRzUkcrSS9zeGtDZTV4UVdmUG9YZEYwNEhX?=
 =?utf-8?B?R3loWEgvYXBlUFJ6ZlJ0azhPS084ZXp4Uk9jbUJ6L0N5d2lvR1JwYVpKZ1Fu?=
 =?utf-8?B?TThXRy84NHNPT1AvOUhGZjZkWWtrckY3NDgxM3ZCbUtRRVAzQWhSR2l3c3RB?=
 =?utf-8?B?S2FlTWdUUTNCcEN1RE1ZVmpZVGI2aXNqNjhRaDNiRWR2bjE3a3liWjRTbk5R?=
 =?utf-8?B?Z0NNRWxlWk5MZEJPeU5PTjE3ZG8wSGZSTEhuZnNLVHo3a04reVBQZW5JQkFU?=
 =?utf-8?B?dFVSWGhYUmZZSG8rOFFNOWJBckhPQjdLWkdGZEJyZXRSdHd5d2xmVmRoRU1n?=
 =?utf-8?B?eFM5MCtwMm4yMUlWeWtKQjYwMzhjMmkxR1Jac0xDc3Q0Y0NON3I4c0F1RVFF?=
 =?utf-8?B?YzJLTlBzNGJXbFBPWWFaUytBMGxscTJXSHpaYlBYVTN6L0RZNDh1VVZTUjg1?=
 =?utf-8?B?eG55SFJyNzZFeVZPZHNrYllGUDljYVZYdEt4N2JHREhCNVZ0aEdwWkRlRkdz?=
 =?utf-8?B?N3ljdUlTbjUzUkp6R2RoY3l2VThmazFXR25KUURSWnFFY3crbmdhbEZ6UWRI?=
 =?utf-8?B?MXVzbkh4ZVV0cDdyQnp4OFBIdlZZNXhpZHpxRDIyOEptNnhvblhjU3MwQUVE?=
 =?utf-8?B?WnE5VW1kOHd6bHN1V2thSkE5SXdhaWwxZ1p1VnVFTjF4UldaM0JyV1BWN0k5?=
 =?utf-8?B?QUZHMG5Xd3YyRStPWC9xR0RhVm55YXBUQjN5cy8vLzJJdW1FVW1wVWljZkU1?=
 =?utf-8?B?RmNPeUxDNkttMzJ0WDB2Qnh5VU1wVmY4QlFCdTZ2N0E0dExjOWhHS2crM2do?=
 =?utf-8?B?cDFFU2l5eUE2VExCdldMNE1mVHJ6elhTUnR4YjFiSnlRTjhyakxYYW5kZEdx?=
 =?utf-8?B?K3FGMXZNZTZ3TU52bTB6QnI5b1BWUVhUdkZQQkxMVmR5cko4T1hqMGErRXNL?=
 =?utf-8?B?RW45QmJ6NlFRSDFVeThxS3gvY1JQWTZKeTNUbU9kR0p0MUc1VzBIOUxRYitp?=
 =?utf-8?B?VDZMRVVnYW5NcENDbjRwS0l4R3M4SkI0TUxTV1FhQUV1Q3FHKzU5NzV3NVNB?=
 =?utf-8?B?RTlqZ0dUaDloVTVMQmw1TUF6ZTFqMVNnOWYwRjAxRXVlaUFWNFNlRElmTE1V?=
 =?utf-8?B?ZDQwY0FnenJicGpleU45dzcxL3V0SmF5QVpFOUpjZHgyeDJUUVd1aS9YcFNU?=
 =?utf-8?B?L2RWOTV4dmg3c0ZmallTU2U1NFJGRFpNbkFxdWNleUN2TEk5WGRmVS9CWE1B?=
 =?utf-8?B?djJVQVpsbTlXNXo4OWZjQVFnMTNtRUtuVFZmZUpyK2tHWWZ1T2ZyTnJmQmlv?=
 =?utf-8?B?QnhKMC9obDdDT2VrcGFtZHYzTm5TQ3JxSEc4a2JocHhWekVyZm1qQT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a6ce66b3-09ee-4c56-fa9c-08de7557df53
X-MS-Exchange-CrossTenant-AuthSource: DS2PR12MB9750.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2026 16:55:40.3881
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QNTpTzBCj+uYZyFDayNfe+WKUIGXAZ5dkcW/URftDPIZ5ERX6M0W+eiruTfedGBjlFx2PlGNCVb0B4Xi3RS7lQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4357
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[nvidia.com,kernel.org,oss.qualcomm.com,google.com,vger.kernel.org,linux.intel.com,canonical.com,gmail.com,kernel.dk,lst.de,grimberg.me,lists.infradead.org];
	TAGGED_FROM(0.00)[bounces-94328-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jonathanh@nvidia.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[Nvidia.com:dkim,nvidia.com:mid,nvidia.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 2FCFE1ACD8C
X-Rspamd-Action: no action


On 26/02/2026 11:08, Manivannan Sadhasivam wrote:

...

> Since we know that ASPM is the issue on your platform and the failure also
> confirms that ASPM was never enabled before, I'd suggest disabling ASPM for the
> Root Port as a workaround:
> 
> ```
> diff --git a/drivers/pci/controller/dwc/pcie-tegra194.c b/drivers/pci/controller/dwc/pcie-tegra194.c
> index 06571d806ab3..f504b4ffbcb6 100644
> --- a/drivers/pci/controller/dwc/pcie-tegra194.c
> +++ b/drivers/pci/controller/dwc/pcie-tegra194.c
> @@ -2499,6 +2499,13 @@ module_platform_driver(tegra_pcie_dw_driver);
>   
>   MODULE_DEVICE_TABLE(of, tegra_pcie_dw_of_match);
>   
> +static void tegra_pcie_quirk_disable_aspm(struct pci_dev *dev)
> +{
> +       pcie_aspm_remove_cap(dev, PCI_EXP_LNKCAP_ASPM_L1 |
> +                                 PCI_EXP_LNKCAP_ASPM_L0S);
> +}
> +DECLARE_PCI_FIXUP_EARLY(PCI_VENDOR_ID_NVIDIA, PCI_ANY_ID, tegra_pcie_quirk_disable_aspm);
> +
>   MODULE_AUTHOR("Vidya Sagar <vidyas@nvidia.com>");
>   MODULE_DESCRIPTION("NVIDIA PCIe host controller driver");
>   MODULE_LICENSE("GPL v2");
> ```
> 
> You can use specific Root Port IDs or PCI_ANY_ID depending on the impact. We can
> also work on fixing the actual issue parallelly.

Thanks. By default we are building the PCIe driver for Tegra as a module 
and so I am not sure we can use DECLARE_PCI_FIXUP_EARLY() right?

I was just thinking that in pcie_aspm_override_default_link_state() we 
just need a callback to specify the default ASPM override state?

Cheers
Jon

-- 
nvpublic


