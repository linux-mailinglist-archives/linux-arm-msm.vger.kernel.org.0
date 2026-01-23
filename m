Return-Path: <linux-arm-msm+bounces-90360-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cBF2K0GIc2laxAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90360-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jan 2026 15:40:01 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 153F0772BC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jan 2026 15:40:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B0ED2301D6AA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jan 2026 14:39:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 605DE2EE5F5;
	Fri, 23 Jan 2026 14:39:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="NN9t+i2L"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010017.outbound.protection.outlook.com [52.101.201.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0C3A19644B;
	Fri, 23 Jan 2026 14:39:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769179198; cv=fail; b=lAl2YvWdnvOCzcb5VDP/tNA+hqS7w8fuOcA/i4gTWZfhlVZEDz4bTDeVicbXyXWMQTm1egXri0EzImkru/z68Ti0Kugz7rzFiz/jui2b7iz9qnauvuZHldnl0E0B5vnkrgzDtmXtXRIsLupzZErYulYE23NvnVA6kGGI2gVjFHA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769179198; c=relaxed/simple;
	bh=6Xfm/YKHLRDPhelIFMRH1wb+6enOHsr8LA2DTgneT0w=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=nz85otbNprsdwqsnAIBPdRnKTOCq7ABV6S5XT6r3os1v3JqC8Auts01MJb48laQxo+BxIsBcv9Es4RqrYhUPNz1L5bHnF56Db/pUS7u07YY8nBYjjAc2ZKjU6Bw6Su+8pBVFGbMBjC2FhF7VMUfZFztNTqYp9h9LDPWAtIQ68go=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=NN9t+i2L; arc=fail smtp.client-ip=52.101.201.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qXBtH3CfYcTjv4TsZ14yUw+fbflsyybx/nR15R7eLUUCVxTP/PeR4wbnKkevVQ+SunxofUrcasLJcIVkUvOJK3B8yEHwyaRqLYn6XMgi34aPhQQqYHr167U8xG+J0r2xYRXbu3tQgZCAf/KeFCmwvtNKlOjNY+c3jcpVDzmkDwfQxrtUVlQG924mywahxYdoe63vQW/+YOmFJNuf+bzuuw4e7d3mFc/YGnbuyb614quFLSneLroT8n/3zaL5DbqpzxRLUnQMragRSKR0k3zU8EEbdARvDe/m/JpEz6HPLklWhKxvzknwR2jUGugGxjkHr4ThrGI+9joThEZo/pm+ZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SOOcm5JqBiZgXnls5vdVR/sEIIYpig/Vq20BTg8Fp/I=;
 b=iTzjHBPLP06QSuophDC8Xo1wkH6PijBC9Qk3OcHkqYoB82K9H9pK4PfuVs1/pzRoY9ncYdR89320yjJMyshtK7/yYSlUvXA+BAQSVu9Xl5B9+/oJlAjaZWcP4Sl63NDeVYANGgG6A6KdatqH6Q1jnpFyAMBU58eTYYcPReuLoz2zPttUQvL/++kJmTtpAYl4MkBJioPNeqCx1vulco++d/JMDcWiOvTVzcB8OIJ/e3fP0Ig/ykFoNRPFuvbJ1AnV8fqgwIPyEUUTRQEbzZD/mHvo7QLbvqvNn6Mmn39urmcTONuowGmqJSFlHLMlJkBzpgd5ADHTaIRf1eJ4Sc3Odg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SOOcm5JqBiZgXnls5vdVR/sEIIYpig/Vq20BTg8Fp/I=;
 b=NN9t+i2LXVgUDMfERufgeGMbiJYEej4wo3M6UQ/VlMPbRezCGKflnJE0LS/X9Mz05NLPrUY2ClL40xRYsLbvSPuWDUcggojgOqNPLEPLnlOJmsjJui3tyd3So7vpD2gOcaieEBz/nOJIkbauTbqWFnhOe9zmiOwVW15sjcuCCH+dE4nPBzvLg6HKN9pZhIGzP/ldo4qgdlt35mVtJgj53rqGp0NGlxWMo0FZAq6TT83dDw09dmlOM+MjnMSTVgngIOyl9WL6p9APbq+g8Ey9dyNoQjeeY4m32F2265inqV3YFiimPfwzC+MFMla3lq2JCzY0ecQaQsd5GQ5ibD7eEw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS2PR12MB9750.namprd12.prod.outlook.com (2603:10b6:8:2b0::12)
 by DM4PR12MB9735.namprd12.prod.outlook.com (2603:10b6:8:225::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Fri, 23 Jan
 2026 14:39:52 +0000
Received: from DS2PR12MB9750.namprd12.prod.outlook.com
 ([fe80::56a8:d6bf:e24c:b391]) by DS2PR12MB9750.namprd12.prod.outlook.com
 ([fe80::56a8:d6bf:e24c:b391%5]) with mapi id 15.20.9542.010; Fri, 23 Jan 2026
 14:39:52 +0000
Message-ID: <2e0f12b3-59ad-4bf8-8416-5a7e0fff470c@nvidia.com>
Date: Fri, 23 Jan 2026 14:39:46 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] PCI/ASPM: Override the ASPM and Clock PM states
 set by BIOS for devicetree platforms
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Bjorn Helgaas <helgaas@kernel.org>,
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
 linux-nvme@lists.infradead.org, krishna.chundru@oss.qualcomm.com
References: <7306256a-b380-489b-8248-b774e6d3d80e@nvidia.com>
 <20260122152903.GA1247682@bhelgaas>
 <5z7c25nkb35prvax6vq6ud7eaeuhzsswbf7fqvmlgys3xftgwb@odocboejrdrv>
 <e44c330b-778b-4fa1-b678-fa909cc05b03@nvidia.com>
 <bf37b6a5-268d-4c07-a536-a826b3d5953b@nvidia.com>
 <unc5zefwndgcv7wufaezz3gkg3qtaymkjlmymhyqdqwzn3wybl@ow2rhbyt772h>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <unc5zefwndgcv7wufaezz3gkg3qtaymkjlmymhyqdqwzn3wybl@ow2rhbyt772h>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO6P123CA0041.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:2fe::12) To DS2PR12MB9750.namprd12.prod.outlook.com
 (2603:10b6:8:2b0::12)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PR12MB9750:EE_|DM4PR12MB9735:EE_
X-MS-Office365-Filtering-Correlation-Id: f2fb7ec7-573f-496d-476f-08de5a8d44c3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|10070799003|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dW9EbHZNcEkwZjdSaGhITzFvdzBVS2F4STJNMWdRWlNZcHh5WVppNU1wUTVP?=
 =?utf-8?B?ZTdUcVhQdEpwMS90b0g5RGJlK3JOQTBoSVQrbnZkZ2pvYlM1SGd4T1NpSHBt?=
 =?utf-8?B?elFlSHJTUTdXVXhneWxtUlQ4UHhHNzVQMldFU2xQYXJzVlpnQ3lUUGd2REJt?=
 =?utf-8?B?Z1ZEN2JpSENma1V0VmZzTGNlbFhBaXhoWEtPOXJpMnA0cTFQcXBHUWpMMGE3?=
 =?utf-8?B?UTRUUGdjSWptMW8vdWJFVE16bjdUY1BVOHBNOExjSGtXa1NCVlZManFnMmFB?=
 =?utf-8?B?d3pUeFMxSUJvemtyaGhrMkdtVzJKTyt3OWNsL1ZsMExnWFVRUitSV3NVV1R3?=
 =?utf-8?B?OXBHdFRzL3ZxcE5RRHNCUHRnUG1mUnF3ZFBpcTcybmo3QVY2ZG9qN0t4eEhP?=
 =?utf-8?B?RFdaN3F5eHNaVFl2NDlhODVIVC9LM0cyN2ROdUpVMTdSU01BbkF2c2E0R2s2?=
 =?utf-8?B?TEcrcDducVVOZUZrQUo3WTJDVGF6YnAyenRUSE80NW5NNk1uT29hc2FvWlVj?=
 =?utf-8?B?TUhmd3VSWUJyQWVKeGQzMWE2MzRVb3JueTcxOG1DZTEzYzlnRXprc0ZlVXJi?=
 =?utf-8?B?c2o5UjhHQWEveUYweHZ0dFNham9zR1VubjFqWkVtalVCZ0xzaWNXYW1XdlJN?=
 =?utf-8?B?NjF0Y3RDTkxobUxONWVKSmtIRG90YnF6UWdWUC9DNFA4Y0htUUlFemIxbTh0?=
 =?utf-8?B?RC96QjJvZ0NFNW1kWU4veit2a1FKTFpnejB2MW03NDJXSm01bnBZKzNkMHBE?=
 =?utf-8?B?MG1wYm9HQUlSS2hCQXRPWjlsZmM4Q1ZBdEdkMjJ0bVVReFZzaHBQdnFGVEd1?=
 =?utf-8?B?OWR0REd2dlZFWXJGczBEY1RrQ0dURHZxaGdaREpVQVBXYnN2Y00raENqYzFD?=
 =?utf-8?B?bm91TDdMMmxlWFBwMlgxaGNvTWlhV0VsZUlBYlJDTjlza3hKUU1lWnUrRmRK?=
 =?utf-8?B?dWR2TkpZQ1FpWnJFWHBOVUUvNVlCMXdGbEYzZTdsbVF0QUVXbnpVN1hERVJn?=
 =?utf-8?B?dk9yWGFrNVNYQVJPZGIvUDlpOXV1ZFJFTFpQUU1BTDVLeTM5R0V5cXJyeFZL?=
 =?utf-8?B?dHFPY1BDc0tQU1MrWTNtSDEwQnlhaEhRa0w5Y0hpMG9uNktiVm96c3Y3Wm1z?=
 =?utf-8?B?aURXZnNheWpiTjcxSHpTcEgyYWo0Z3BFS3Q5VHhIcDZRWDROOTBFYnQyNzFl?=
 =?utf-8?B?cjZ1QXZ1VWxrVTRuakJXaENUOWJCNmpTWllVd09TbDEyS0VYeVVocWtZaWto?=
 =?utf-8?B?VnFQaEFxci9zeDltbFNtOHNWRTRBb3Z4cXowdzlCWlppTlVLNy9UWmQ0NDJy?=
 =?utf-8?B?TlIvdDlmNUVUUmd5N0FqK2tuQmQxTWl3WDZFbWc0RFQ1QlVZUlAxbFlmT2lU?=
 =?utf-8?B?VmlibzdOR0pvVXpLTU53bUFsaVdjcDNJSUJTd1lTQnhaYjZqZEFjQzBiMUVT?=
 =?utf-8?B?NFViNTZSUzJKZ0J1bThmZ01UYjV3TnNuNzdOM1doRmdPbXRvbEdtNWszRUlx?=
 =?utf-8?B?RlBsUTBLb0lFTkVjbWVYV0k3Q0Nxb005bFJUeWZXbndWZlFBTlNPSDdZcFpm?=
 =?utf-8?B?WGF4UlVuSmJyZzdqNzRwZVpzYmpJazZNSWFYMXNQTHEwZVF2WURXSXEreVRl?=
 =?utf-8?B?NmlmUnFOUGpvUnh3NTlLY21wcU9ORGozSDY2N0FrMzhZUUZCcVJHRG9ZdXps?=
 =?utf-8?B?NVovVmZqeldpWUEwTlYycE5ldHdlZG9xZXpuaWdwZ2xCejZjSTFURGNNRUcw?=
 =?utf-8?B?Y0ZHa3V3K2hhSlo5Q3k5dVlwRVgxSXp5T3ZOUldWdGhsKzl6T25VYnlrVDdN?=
 =?utf-8?B?QmJpWlkwZkV0VDk2UEZVN20vcE1RUEw5Z0VYRlhhcU1wSlpmZDl0SER4QXAx?=
 =?utf-8?B?bXUzcGFmdTJuVHVBUkdiZDNJRU5TdHBRMEFtK0NDY2dDOHJLZ2oxSEV6UDBU?=
 =?utf-8?B?YnBPK0RPRWgwL3dCR1lTZEFnUTZGV1JHU2kycWloQk5leHZTUVp1a2ppVytF?=
 =?utf-8?B?SDY3ZlExQzZVRTVMczVEd3dxUjRGZHN2RXFFUnRsMG9OelEzYWU1QmJmby9I?=
 =?utf-8?B?SXJPL1pTUzl4TUpKN0tlM3VOeE5sKzFHK001SFdGcTF2OXBpRWJ1MDBsSU4z?=
 =?utf-8?Q?zP3M=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS2PR12MB9750.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(10070799003)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UG9CeU9LVndvaHlJYVNkY25ZNk01NmJSL2JMNlhFbkc3UE54ZHdwTUc3UEg1?=
 =?utf-8?B?VXNveHB4cHExem9EREVmZFZoL0dUZ21FMlRZSUlkMVhXUmU1ZVRtaWtFSmJ1?=
 =?utf-8?B?UWdJWjBaRkNZYndoVXlwZGtiYnp2NW1SVXZUdjlCSytSelAwcEJzS0FaUEtR?=
 =?utf-8?B?ai9Jdk03R0xLWXg4cGYrVmZuTXRwYmxVL1RtZ0R3WGIvWlFHNHY2K3RzQ0Rj?=
 =?utf-8?B?eHdPYVRQRzlQVjh0dFJVRVp3bmQ1YmFXcndvaHVxcWkvYTdRVEt6Z1dnUWdJ?=
 =?utf-8?B?d2hYMXcybkIzQzJxbkI3WVgvZlFwTVRuMkVWTGZEUitjRUx2MHZhcW5lWXQz?=
 =?utf-8?B?cm5WVzNsRlprWkZ6UlNOZDNkeXZ5R3hVUW5GRW1CNnhmTlUwS0ViVC9TWG9R?=
 =?utf-8?B?ejhKenVWcUNrTnRtb1hZSzNITWlZSDhoSGxidEJPUXRHS3pjcFBJOVhsQ3Ro?=
 =?utf-8?B?MjVwNnpUczhWLytFaVZoK3c2dm5yeTQvazB0UEdpdGdmZFNKZW1EOUg1eUFl?=
 =?utf-8?B?a25KcExZajEzdkNHeWI3VlR6L0RjUXl5L2E5aVM2TGFmbitxZWwvd3Rrc1Qx?=
 =?utf-8?B?Rlh1MnRyb3dlczBlM1RjdmRsTGUxbURWYnN6Wlp6M29WMWZDS2kydWtTa1NS?=
 =?utf-8?B?VDBSTkFWTUNYbUIrSDhkWjJVWWwrKzdaNXArQVRnUEpncWVVT3dCYlJaWHlF?=
 =?utf-8?B?RWZhQytjOUlqcXBXTkRSVEpYVkN2OThTWHBiT0RMdGFrU1VZUHROb1hPbWR2?=
 =?utf-8?B?UWVxcnQyTm5yVFE2MWo4cXk5alNLdkZrR3ZJaldCRmM1S3drUkw5N1F1R1Jm?=
 =?utf-8?B?bTJZUFprd3FOSzV5SGJsSThuU2JKdjhrWEZwN1A1MzhVcTNHQktVbU1PbHFW?=
 =?utf-8?B?YkNBTURYTmdGSzZMVys3V0Z6bUVicGM0NkJuTWZUSmh6UE0rRlc4RHdsR0RQ?=
 =?utf-8?B?Z2FsMUhRcTVzRDhiZXlZSnlxVEYzWlA0dWl0ZWgzVzVQYURWRmViYk1tUE1R?=
 =?utf-8?B?WEVKZ29FcVhjeDFvclFCVFZ0VjhFR29wVHRheVZxKzF6TUQ3UTlqMTNna3Jt?=
 =?utf-8?B?aGxETmEzVzU3ei8xRnBabWFNWjgyZ1o0cTBFSzlpRUVnblhDRkhtTnRwc0Ju?=
 =?utf-8?B?UVhiNVlrRHdPVDNnb0FrcHJIbHMrdnUxOGJONFlDQzdMc3RxbGNKS0hlazlK?=
 =?utf-8?B?OWFVVHAzK1RqK2cxdjI5Yk1lV1AxemlrMEtHQnZkaVpscXdlanhzaExrY1cz?=
 =?utf-8?B?RGlNY200T3FUeU5GRGxiZDJjME1nZUtMMVdDVjdKeXRLMUJibDNVbmZncUgx?=
 =?utf-8?B?cndYaldveWZ6NmU5ZEw3d2hwKzRwTDB0bHkwc2diRDdUMGNBbVZ2T05kMThu?=
 =?utf-8?B?aFVKN2ltWU11S0xQRGZuWnVrYy9DeXBlanJuUnFWRWxaZTdQTGJQSDFrc3dL?=
 =?utf-8?B?SWdPTnZ1UVppTFE0SWFxTHA1UVpIcDB6U3J2ZC9yeFNXbDBENmRmZmIyTjEx?=
 =?utf-8?B?TXMwZ0J3MncxTnFKT3FsdVc4YjBMRVBpU240ZGtJQ2xWanFNbHlzSmhycjhz?=
 =?utf-8?B?VnFIYTJhaEVWK1RyQ3k3MGordkZ0THN6RzBlK0h3Tk53ZXlEZGtsNFJ5azRQ?=
 =?utf-8?B?eHpPWFI5R0w1S2hvc3h0R0NzaER2Y00zY0JnM3paQkpuUDdJZ3VGUktRR0g5?=
 =?utf-8?B?dWtnbzVWVGViaDhRMHEyWkh0VzVKYnJ6L1NGQ0wxQmp4ZHpxbllZWlY5OHpa?=
 =?utf-8?B?T0pjSUoycXJleWluVkFlTFhTc2hSa0hXNVVQMTAzZHJKa0JFdjdKM01jclpQ?=
 =?utf-8?B?YkphZ294N0dqamlTeENVOXBoVUtoTnczNThMQzNIU1FYa1FKQ1I0R2ViVTZi?=
 =?utf-8?B?YVFrbFBwWTNTY2hCcjE2Z0V3MXVVQTJYZXNYNk8xOENrVTdyVmhDaXBVekVt?=
 =?utf-8?B?d0lKWWpTY29TcWVkREs3YkdWWTJkL1hSTFZWVXIyVnhEblZJMVR3MWxhTCtW?=
 =?utf-8?B?UTJzWm94dzd2N2hsWk5OWWxxVjdvMklLTHZQYXVtYXlaK1lqdHRXeFR3bzBm?=
 =?utf-8?B?TmJSbHlxckgxbHZ2MmU1WjA5NzRMWXY5cTZkSjhwY25ZN0xma2h2ejYzOGdM?=
 =?utf-8?B?MVFxYUxPS0ZITyt1cGJENitOblArK0VSeFc5THljSVNCUzBnNlcwZGl3VFhr?=
 =?utf-8?B?WldKRXVGWW1GMmhtblFubXN2S2x3bm1RMkRVN2JvalVNUTFPSVdpYjNoTzVv?=
 =?utf-8?B?aFREeUZYa0dOZzFtWTBEclEwK2lURVJnbTB5WitEaUtsaDBSRi9BYmdwZkRr?=
 =?utf-8?B?M20vWTc1NHV6dThFQ1Q4OU9HajduRWFMT2RqNGVHa0YyaU5oenl5VFN6STZG?=
 =?utf-8?Q?CNrpML78MXuMls3tWTBrU16+RnXZc9cbXLciwIHCnv2k+?=
X-MS-Exchange-AntiSpam-MessageData-1: zoQC118ygKzegg==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f2fb7ec7-573f-496d-476f-08de5a8d44c3
X-MS-Exchange-CrossTenant-AuthSource: DS2PR12MB9750.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2026 14:39:52.5017
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F8tEr9W7v88UA2JZOEEFKS9492S/GZb5zuAJj49Um+kL6pJ+pc7NKSoZXfka53Do/6c2pVmCZEQJ0W8vJH3m7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB9735
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,oss.qualcomm.com,google.com,vger.kernel.org,linux.intel.com,canonical.com,gmail.com,kernel.dk,lst.de,grimberg.me,lists.infradead.org];
	TAGGED_FROM(0.00)[bounces-90360-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
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
	NEURAL_HAM(-0.00)[-0.993];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:mid,Nvidia.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 153F0772BC
X-Rspamd-Action: no action


On 23/01/2026 13:56, Manivannan Sadhasivam wrote:
> + Krishna
> 
> On Fri, Jan 23, 2026 at 10:55:28AM +0000, Jon Hunter wrote:
>>
>> On 22/01/2026 19:14, Jon Hunter wrote:
>>
>> ...
>>
>>>> I think what is going on here is that since before commits
>>>> f3ac2ff14834 and
>>>> df5192d9bb0e, !pcie_aspm_enabled() check was passing as ASPM was not
>>>> enabled for
>>>> the device (and upstream port) and after those commits, this check is not
>>>> passing and the NVMe driver is not shutting down the controller and
>>>> expects the
>>>> link to be in L0/L1ss. But the Tegra controller driver initiates L2/L3
>>>> transition, and also turns off the device. So all the NVMe context
>>>> is lost
>>>> during suspend and while resuming, the NVMe driver got confused due
>>>> to lost
>>>> context.
>>>>
>>>> Jon, could you please try the below hack and see if it fixes the issue?
>>>>
>>>> diff --git a/drivers/nvme/host/pci.c b/drivers/nvme/host/pci.c
>>>> index 0e4caeab739c..4b8d261117f5 100644
>>>> --- a/drivers/nvme/host/pci.c
>>>> +++ b/drivers/nvme/host/pci.c
>>>> @@ -3723,7 +3723,7 @@ static int nvme_suspend(struct device *dev)
>>>>            * state (which may not be possible if the link is up).
>>>>            */
>>>>           if (pm_suspend_via_firmware() || !ctrl->npss ||
>>>> -           !pcie_aspm_enabled(pdev) ||
>>>> +           pcie_aspm_enabled(pdev) ||
>>>>               (ndev->ctrl.quirks & NVME_QUIRK_SIMPLE_SUSPEND))
>>>>                   return nvme_disable_prepare_reset(ndev, true);
>>>> This will confirm whether the issue is due to Tegra controller
>>>> driver breaking
>>>> the NVMe driver assumption or not.
>>>
>>> Yes that appears to be working! I will test some more boards to confirm.
>>
>> So yes with the above all boards appear to be working fine.
>>
>> How is this usually coordinated between the NVMe driver and Host controller
>> driver? It is not clear to me exactly where the problem is and if the NVMe
>> is not shutting down, then what should be preventing the Host controller
>> from shutting down.
>>
> 
> Well if the NVMe driver is not shutting down the device, then it expects the
> device to be in APST (NVMe low power state if supported) state and retain all
> the context across the suspend/resume cycle.
> 
> But if the host controller powers down the device, then during resume, the
> device will start afresh and would've lost all the context (like queue info
> etc..). So when the NVMe driver resumes, it would expect the device to retain
> the context and try to use the device as such. But it won't work as the device
> will be in an unconfigured state and you'll see failures as you reported.
> 
> Apparently, most host controller drivers never cared about it because either
> they were not tested with NVMe or they haven't enabled ASPM before. So the NVMe
> driver ended up shutting down the controller during suspend. But since we
> started enabling ASPM by default since 6.18, this issue is being uncovered.
> 
> So to properly fix it, we need the controller drivers to perform below checks
> for all devices under the Root bus(ses) before initiating D3Cold:
> 
> 1. Check if the device state is D3Hot. If it is not D3Hot, then the device is
> expected to stay in the current D-state by the client driver, so D3Cold should
> not be initiated.
> 
> 2. Check if the device is wakeup capable. If it is, then check if it can support
> wakeup from D3Cold (with WAKE#).
> 
> Only if both conditions are satisfied for all the devices under the Root busses,
> then the host controller driver should initiate D3Cold sequence.
> 
> Krishna is going to post a patch that performs the above checks for
> pcie-designware-host driver. But since the above checks are platform agnostic,
> we should introduce a helper and resuse it across other controllers as well.
> 
> Hope this clarifies.

Yes it does. I am happy to test any patches for this.

Jon
-- 
nvpublic


