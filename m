Return-Path: <linux-arm-msm+bounces-94273-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WOs7IeEhoGkDfwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94273-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Feb 2026 11:35:13 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id A4C641A45B3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Feb 2026 11:35:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C3681300BC7C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Feb 2026 10:34:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3CAB3A783B;
	Thu, 26 Feb 2026 10:34:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="WDszwsuH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013019.outbound.protection.outlook.com [40.93.201.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12D29389E09;
	Thu, 26 Feb 2026 10:34:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772102070; cv=fail; b=cJXbXkycMPrZDpmQFaw4UGaHUPrW7GuJVLpJiCgP00NPPBlJdBrELOOg++UhuFyF595zesNtryE0olvxQa8DemevYZqzraY2buRI3ZbP5ReI3sC1ZkPMp5MUImootqf2HZY0otu40W+ynliFnQU5STGKEz2zFvGBnMRKWEKc+iw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772102070; c=relaxed/simple;
	bh=3OqaeQzkCIuh+u5R8NJerwp7kHPrCFAqx2dTLqR8lds=;
	h=Message-ID:Date:Subject:From:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=iZ5gBTEpHWBiQF69eWxPVcN01b2SUDFi0ly+g8f9b6T8XPWIXmk1snPvghRyFpuKG1IX3FFKMbDFfBtyF1QsMIMN5KGVdxkCmWP1HAWt8SMk9V7pFQurHczALl5wd1MjUb2s+JkoGQwQLL1Wh5UPGQWl09y+3A7XrqQqmOQq6X4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=WDszwsuH; arc=fail smtp.client-ip=40.93.201.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fz7b5xuDudOqNjeEiRRO8wGeoQB7lwrU0+DhK9JeL2O2Zgdf/6MHny6J6CRXbqEM1XT64RLOMfsT4KBPQXIgPWl6+RHta16hsyKmp2N4wux/dvi4ytxz/x20Lj1um2XXwJn8ymnmKAtDIQ9FX9QoViocfA7H+/9sbmVPgeSKb9t3NrL4WV1UHo7V0r0uFa65x9AOL7Ll+mR55TRZVSSEJF6aZtFHOChSTb4+4i6B1i5coErp9RdoNYpmFy+++tfBKjd7BgexGuKW/sSdjm7WuGQK6Ma7R6IgFdHdmyqvJ9NE0MHgRxijOWouGIWR0ikiakDBWQVcCm+B3/mVdQcFig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n+WFlfs4aMuWP8541hYmc3WL4yeHiDMFuPFAyDKcJ3w=;
 b=ryNZQx3RqneRlq9kqrsGFvfHrmhN82vMNx4PHoVm5kwU6at+J8t70ttD7kMqx67Z8m8WQWN+/ow8wa9A0qmoM1vtwiVUL4viDE/Oe9HbW3j/wYSmg/bV1cZRdRw6gfRdX+HmHzKx2TvLHDnpFeZovOStfeB0L+4yCy73HnHFXC4sQ+k0JOZix1AB+tkFstWB7N7ToZVk6/8B/L/I8St3qIYTHhlkEt1IfuWvlujd9lMmasREp3u1EtAKnOACMfGf0nphSC2yiD3i8qZshPhCwddENQOZD5ER/Lx89Qu8NXWAOqlokO/LucEwAwbylCJNMEPja5FHcx4Q4jNGPO+lKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n+WFlfs4aMuWP8541hYmc3WL4yeHiDMFuPFAyDKcJ3w=;
 b=WDszwsuH+0Atb7iiI/AKaN9KLL1R5mVtekjwRPOZs67oxSxbSknOgdD1usAKaNWxg5k4/nypQ/KTB9v/yRa9w6EQsOP/4X9gYtmZFNjjJVGt0YKNPKVu8A6vaboQ5Fq+3mPObSyKTR+1kiQYMzBwRJdrIQsWfJ2TTb+eb5WSJtvms+lZumTiSi82ARfXBRw0M3PHlc1zYHjYjn0dzC1ZPOiY6enqdZsPqtXx1yQUrBTmCOUlIybBO4Rkun8wx2u7xHkpWhD2Lk4lsI78nB221IdTbHyXexPVVcJ1HXphVa8mz8FDeWP4Iji7xKJk9ayalIT5FfMMMbiK0cUX4pKKXg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS2PR12MB9750.namprd12.prod.outlook.com (2603:10b6:8:2b0::12)
 by CY8PR12MB7436.namprd12.prod.outlook.com (2603:10b6:930:50::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.14; Thu, 26 Feb
 2026 10:34:24 +0000
Received: from DS2PR12MB9750.namprd12.prod.outlook.com
 ([fe80::56a8:d6bf:e24c:b391]) by DS2PR12MB9750.namprd12.prod.outlook.com
 ([fe80::56a8:d6bf:e24c:b391%5]) with mapi id 15.20.9654.014; Thu, 26 Feb 2026
 10:34:24 +0000
Message-ID: <e0a0dc6d-fff0-41ec-92eb-7f2dbefa967b@nvidia.com>
Date: Thu, 26 Feb 2026 10:34:18 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] PCI/ASPM: Override the ASPM and Clock PM states
 set by BIOS for devicetree platforms
From: Jon Hunter <jonathanh@nvidia.com>
To: Manivannan Sadhasivam <mani@kernel.org>,
 Manikanta Maddireddy <mmaddireddy@nvidia.com>,
 Bjorn Helgaas <helgaas@kernel.org>
Cc: krishna.chundru@oss.qualcomm.com, manivannan.sadhasivam@oss.qualcomm.com,
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
 <e44c330b-778b-4fa1-b678-fa909cc05b03@nvidia.com>
 <bf37b6a5-268d-4c07-a536-a826b3d5953b@nvidia.com>
 <unc5zefwndgcv7wufaezz3gkg3qtaymkjlmymhyqdqwzn3wybl@ow2rhbyt772h>
 <f9ac8c8f-8959-416b-ba90-14f0886c5bc0@nvidia.com>
 <a5m4pqtiaxsq5lmq64roro633ganbeq7mypa5ojuuqy4npkvok@wcogdbzaq6xe>
 <7157c68e-97f3-43b0-bfb5-e271a8f2a4b8@nvidia.com>
 <cf1e685a-a1cb-45ec-bdc3-1ef1a3d1044e@nvidia.com>
Content-Language: en-US
In-Reply-To: <cf1e685a-a1cb-45ec-bdc3-1ef1a3d1044e@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0218.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a6::7) To DS2PR12MB9750.namprd12.prod.outlook.com
 (2603:10b6:8:2b0::12)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PR12MB9750:EE_|CY8PR12MB7436:EE_
X-MS-Office365-Filtering-Correlation-Id: f97c9f5a-aefe-46da-e001-08de75229c3f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	+cLEwCBymRrMOj79iF6y7Ut+z8sZitaNmYWvb6bDxtgQsLOOHaBGztg91PkR1fkXR+GHEQiquIRnPgFtIam7Buwz+dor7xRxYYu0jDtBq+rtyXYEnwwlP39debmK9lirGLFHqFz8lypNcEp0qL3Nj7yj33QQxRljKOak76hBy6PvF1zCgPvaDWzkV0+jPlsj/3l0VjpnOFCvDtOjdL/1xIr054EhchuqhyqMXk+vGnAxUiPrz4aJOdaC4k57YWFXcBtSR5QcPs0vfVOYF/50aqBi8OdiWuQ+NjVs5Em42Z8Y8gSuFgsYMJ9azOYh1+m4N1H8ST3fxcvdK9DMgiMWd+0ozlQaXXXJAQuR3TYqB/yTZU3zLFm3C0o4pay0XRTKoqYetvsLJrABjRMOtqnmdZ5ZrgRWQgC5UgaMfVYRnyUOGRpmT/QLNzJxypO2BhAsN2v2lJUT9QtR8ynK7m3f6Ysp94LaZZ63QrR8/P4RbN4tCFMbHkQPWzJN5L9aV/pxrbQFfxouqu1fDr9lIvdCjgJ565AR2DCy16ZYIQNnKss5fKZKwJOi01laIbMuCvVUPNzXaP3q83hJb7s7m5s6nELPlc4kOJL9xzDUePgwpXwWnYNHUH5bgmdyBY66HyR81ClR1fDX7+jON1bSQ4428wMsjrlsnKDwXCMm07XCCO27kb/tBRUwnW/3Fit0KWvLtWSNDCs7lRu+5igLoXXXMU0FLGX2qkm57ssK6U8gbPo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS2PR12MB9750.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TjU5TnJsZTdrRTRjeHFqKzU0TlNaeU9iNkJWVzRLZzlXcGw0eGtVR0RaUm8w?=
 =?utf-8?B?REhvc2I0Snh4UnFoOE00V00wTCtGZFFHY2Vvbi9xbFJRb2RQVWMzMHJsS2Fo?=
 =?utf-8?B?Zy9LZFpYc1dqckMwL01hQUlPV2oyOVJNQ2lNM1c3YTl3SkVhcjJIZVhtcDM2?=
 =?utf-8?B?R3pYQlhVWTRmcDJRbFdBYmtOUFJaeDV1WklTcTY3T3NoZkZ5UGpjVjlqNVMz?=
 =?utf-8?B?WS96cERXUVN2UHdtNUo5dFppSUJqUFoyY01BRElEMzgwTlVONnU4NjhwRjA4?=
 =?utf-8?B?b0V4UTFYQklpOGYxS1E1YW1WU2NMQW45S3ZOakFLZkNxUlJlcFEvUFk3cExM?=
 =?utf-8?B?YWNwN3JLUXQzZk1wZXN4UVRGVzlkdUFPaldpUU81YjFrdzgvSWhqcXNQT3pK?=
 =?utf-8?B?U0pMbUR6bmRCN1ZVaGx2dnhFWkhSSk0wMUo0a09wb2hrenlIOUl6ek1ZRUJL?=
 =?utf-8?B?VG84MjNxUHA2SjlwWS9qTkc3dTdyODBaRVNpRi9IaHJGOUhRQlhQRXJLZUdK?=
 =?utf-8?B?SnBXdGF1TE9IRlBWT2Q0OE1ocHhTZ243a3Q2bjlMNTFhL3JnTTNvSFQwYmND?=
 =?utf-8?B?Z3RDekl0ekFhTGRNRzNuM1l0U1JUMXkvYlFveGNybnpIUkZhaHZ6ZFFZOWtS?=
 =?utf-8?B?bCsycjZaemFzN3pPa2FTSzR0WERiemM1d1VtZStOc2NKLzRuZnpXMEVGbjF0?=
 =?utf-8?B?L05ZaVBiZTRzL0RnWFAzZCtDTEdESVMzVzVnTXFzbE5JOUFPMjRyaWxOQTVw?=
 =?utf-8?B?Q1lKUUVoK1RJTkRzOXFWR2FkQlpyeWIrdEdkNUw5QUJlNUNldjFhTk11N2I5?=
 =?utf-8?B?UXA3YmtYWlZ0WkR3aklGY1ZiY05NY2dSdkU5b3JvcWV1Q2FBcy9DYXNTSnlk?=
 =?utf-8?B?dFZQdytEcytOSEFEWHM5UmY3NzhLNFVHbklaWG1FTzk3TTlVaHoyM3pEQ0tp?=
 =?utf-8?B?d3NTeGVQazZvekxRWTIvUi9kV3hYWUhGSDBsS1JSZGZiWEFyUGF3cmRCalJB?=
 =?utf-8?B?eW45NHR2eWtTaWUxRlYxMkVndUpHS2wyeHA2dmZZQTFtTy9QNTgrTlpCWDVl?=
 =?utf-8?B?V2E0eU5sRG16a3RqR3ZJVkR1S0d2TjJmMUNzS1lPU2pRbGVtVUFMaC9UNkJu?=
 =?utf-8?B?RSt0NTVzOTN1dWF5VjU5UG0xOGtERXJ0ZHZkdkZaemhPWThqYzBKREVUMU9Y?=
 =?utf-8?B?SmN1SkwrMXNVT2Vhb2JIcVliVGhBZ3p0SE52WHhxaFRRclBEWlBVN25zeWU3?=
 =?utf-8?B?UEFpWGRETEVYRWtEVEpnUWpsZEg3aG9TckVGNUxtTXo3eVlOTHJQTU5vL0Ni?=
 =?utf-8?B?LzJYOUg1Ylc2cHN2enVEdlBPKzZrbDdXYVZUY0RMakg1cHIyNTQzQllhdkNt?=
 =?utf-8?B?L1lYL3VkWGpHVDlXNkhXczZHZ0l3SUUyMHBYOXFGQ05MeUhCbDRZTDlTT3lE?=
 =?utf-8?B?WWxCN1lJZmNGT1VqdFRSWmMwSGNPeXRBTW51UnZuSExiUk0ySkg0Tm5wOU85?=
 =?utf-8?B?YlU3eWRVWVNaMWtDWC9peGNmbEUySlJzYUhaYnhKVWtNaTRZWGx5NENsVVkz?=
 =?utf-8?B?K0M0czBoRWE3cGN6T0ZzQ21YYlFwcUpYMHByWFIzVWtTdENPektNdFFxaDBt?=
 =?utf-8?B?TUEzckEvcnV6WmtraFI1SmN1UEtPRDU3NkZXdkNCUjd6MFZiMG1abG1hNGNk?=
 =?utf-8?B?WWZLUk5TNkhnM1Nzb0lLTVNnanBob3pSNVBDTk5WN0NYT3RNazFtSEZ4em9r?=
 =?utf-8?B?T1N6SlJidmhaMnBYdEtUdXMwOEc0VmdPSnVZaStoQVAwcGlzYS9yam02M2FF?=
 =?utf-8?B?elJLRERDTG9LOFN0R0taQkVGZVBOeUtpUkRnUGxsWGNXZWtGalNlRXk4NDdI?=
 =?utf-8?B?Z2ltRFcrbFF2SE5ZblVvV0x1cUVZR3A1QW5qR1RxWTB3Z2luVmZmSjJhU1h6?=
 =?utf-8?B?blFSZ0g3elBXWDdrOVljbEtyVVF6RjQ3VldleXBaQmdXSFp3TFBabnZ6dGVh?=
 =?utf-8?B?WVEydUJSb3UxV1ExSm8ycWQrSTNXVTRJbVNMb1RBT3IraGRzSHd5ZXp1bWNZ?=
 =?utf-8?B?dk9jMmt4L2JGNENxbWtJbHVDOExCYmNYNmxheGdwdWxJOXE5aThVZHlvQjNC?=
 =?utf-8?B?VUpYWDFZcWlsOFJIQVE4ZHQzeEhQZ0MxUGtRZDA4MHR0WUxpZEVwOHh4RDBk?=
 =?utf-8?B?NWlidkV6NUsxZnArYVVwRTlTdWxuSDZHSHlrTWs2aGhHWnRzbEZQVWd2ZFFB?=
 =?utf-8?B?MWRMMnV0REtOV01NZDNONWovcERXSVIrdnRoRnVYbjRkaUZqUll1YkgvOWYr?=
 =?utf-8?B?a3dSSHo4QkkvdDNDdlp1VzhpK29WejZ3Z0ZHTFdKQ2UrMEZzbmZTZz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f97c9f5a-aefe-46da-e001-08de75229c3f
X-MS-Exchange-CrossTenant-AuthSource: DS2PR12MB9750.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2026 10:34:24.5887
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PBjswZ6EhKXWeMIg48XQ4bMHExkYDE4ciUpO3cTBweWlHTNmlPoU1X42uN2HKYaWMl8XSeD+D159aRH0cN/GBw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7436
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,google.com,kernel.org,vger.kernel.org,linux.intel.com,canonical.com,gmail.com,kernel.dk,lst.de,grimberg.me,lists.infradead.org];
	TAGGED_FROM(0.00)[bounces-94273-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jonathanh@nvidia.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,nvidia.com:mid,Nvidia.com:dkim]
X-Rspamd-Queue-Id: A4C641A45B3
X-Rspamd-Action: no action

Hi Mani, Bjorn,

On 19/02/2026 17:42, Jon Hunter wrote:
> Hi Mani,
> 
> On 16/02/2026 14:35, Jon Hunter wrote:
> 
> ...
> 
>>> Krishna posted the series a couple of weeks before but forgot to CC you:
>>> https://lore.kernel.org/linux-pci/20260128-d3cold-v1-0- 
>>> dd8f3f0ce824@oss.qualcomm.com/
>>>
>>> You are expected to use the helper pci_host_common_can_enter_d3cold() 
>>> in the
>>> suspend path.
> 
> 
> I have been playing around with this, but so far I have not got anything
> to work. Right now I have just made the following change (note that this
> is based upon Manikanta's fixes series [0]) ...
> 
> diff --git a/drivers/pci/controller/dwc/pcie-tegra194.c b/drivers/pci/ 
> controller/dwc/pcie-tegra194.c
> index 9883d14f7f97..9f88e4c1db08 100644
> --- a/drivers/pci/controller/dwc/pcie-tegra194.c
> +++ b/drivers/pci/controller/dwc/pcie-tegra194.c
> @@ -2311,6 +2311,7 @@ static int tegra_pcie_dw_suspend_late(struct 
> device *dev)
>   static int tegra_pcie_dw_suspend_noirq(struct device *dev)
>   {
>          struct tegra_pcie_dw *pcie = dev_get_drvdata(dev);
> +       struct dw_pcie *pci = &pcie->pci;
> 
>          if (pcie->of_data->mode == DW_PCIE_EP_TYPE)
>                  return 0;
> @@ -2318,6 +2319,9 @@ static int tegra_pcie_dw_suspend_noirq(struct 
> device *dev)
>          if (!pcie->link_state)
>                  return 0;
> 
> +       if (!pci_host_common_can_enter_d3cold(pci->pp.bridge))
> +               return 0;
> +
>          tegra_pcie_dw_pme_turnoff(pcie);
>          tegra_pcie_unconfig_controller(pcie);
> 
> 
> At first I was thinking that is we are not actually suspending the
> controller we can skip the configuration of the controller in the
> resume. However, if we skip configuring the controller in the resume
> then the device does not resume at all. So right now I have the
> above, but clearly this is not sufficient. The device resumes but
> the NVMe is not working ...
> 
>   nvme nvme0: ctrl state 1 is not RESETTING
>   nvme nvme0: Disabling device after reset failure: -19
>   nvme nvme0: Ignoring bogus Namespace Identifiers
>   Aborting journal on device nvme0n1p1-8.
>   nvme0n1: detected capacity change from 0 to 976773168
>   EXT4-fs error (device nvme0n1p1): __ext4_find_entry:1613: inode 
> #18622533: comm (t-helper): reading directory lblock 0
>   Buffer I/O error on dev nvme0n1p1, logical block 60850176, lost sync 
> page write
>   Buffer I/O error on dev nvme0n1p1, logical block 0, lost sync page write
>   JBD2: I/O error when updating journal superblock for nvme0n1p1-8.
>   EXT4-fs (nvme0n1p1): I/O error while writing superblock
>   EXT4-fs error (device nvme0n1p1): ext4_journal_check_start:86: comm 
> rs:main Q:Reg: Detected aborted journal
>   Buffer I/O error on dev nvme0n1p1, logical block 0, lost sync page write
>   EXT4-fs (nvme0n1p1): I/O error while writing superblock
>   EXT4-fs (nvme0n1p1): Remounting filesystem read-only
>   EXT4-fs (nvme0n1p1): shut down requested (2)
> 
> Is the above what you were thinking? Anything else I am missing?

So NVMe is still broken for us and I admit, I don't fully understand the 
issue. However, it seems to me that this change is not working for all 
device-tree platforms as intended. So for now, would it be acceptable to 
add a callback function for drivers such as the Tegra194 PCIe driver to 
opt out of this? This would at least allow NVMe to work as it was before.

Thanks
Jon

-- 
nvpublic


