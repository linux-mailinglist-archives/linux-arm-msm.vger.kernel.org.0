Return-Path: <linux-arm-msm+bounces-90207-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mPkcOJpBcmnpfAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90207-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 16:26:18 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 958CE68BDA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 16:26:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 7AABB70AFAD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 13:43:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9176318BA9;
	Thu, 22 Jan 2026 13:43:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="FWlpZz8N"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011040.outbound.protection.outlook.com [40.93.194.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 000123164C2;
	Thu, 22 Jan 2026 13:43:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769089433; cv=fail; b=g3Od3fHARqoGlVrvdCzyQBdDDkW0eQJqia7yD5hG1iGmqd/SVqCaCMMEfSFaz4spUNXZnqYQ8Dn+qdbuXYQiBRnzCV6g+FGPPEnJaBMaIxqg0A/TgixfUGV7P/KyOXHmLciMy5SrcBiHcv0i1zVxdJPKcQmaFe/0ncqSTcjx5L8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769089433; c=relaxed/simple;
	bh=EQjn565SYcNyi7Y+2HTZc2A022M3p/zqG+zUEJoVA8I=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=IfDWcCvLdQrjmCHG29capB4NKdEzn6Jh37vKkoMhl882pU7dshEt7zYmXxRk5q8j3uoSOku+FlyrkPxSPermGyqAgzOlF1EnzgS2WdVT0qrsr8rjXo8e7l0te6YUgzCwVBAmxspjswRFxP1BQOMjdjEIrQVViV5G2XlxodhbcqE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=FWlpZz8N; arc=fail smtp.client-ip=40.93.194.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SF2eoHVrM75RxaaEZvQruHPkacEJSmic1zpsiUqeluBFUd6t+77rSOvG5SVRO/DxOzo4l+n6iRUUhqbFg9dzs/oSnmLlsCdAK/zMtn6r1RjD1ov17ufqx6c5oDO4mG0varf1xpSwc/7HLzSmD1BYN/H1beCI0QAiasWQ4WLZdUBftXkI/oBOrhuff8eMiG9EToUsQ4+bs++hEEDVOu3rYufAHI1iMj+5PKh0BYlucdqD+8a+7y28jZJWj9HkFGRqumpPiuq2SzGE/PNSNc35QaN0NaIPVRkp4F0pVP9ZqTicle42dQgUCiEGvRHD7BGC3bE6ObAn6Qtu1Xpgo24Ohg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RpaJMvsmoYWjyuY1dgQw5ZatPhYvSgvPDwRJvgV9xs0=;
 b=Sxqew0Ix747ZD31lTxUiA3YNGGEdiMAy9/wdqXCd0xSgdDjnqoRMh67goexu3zyWiydyfP2Em/NlC7XXQwU95mnP24ZyU/IKKJDW7KYOspvYkyodPgbNY/g82hMrBYrooij+OVzgYQuHjcYhd9J9NjvronGyg+cVKbBoZDzOfN+0zBVqUS9IM9lMRrAbSlHfpp96TIlQVIxHYj8tddXY4njlQkGQh48Zbn5jR4Wb2T+RdwtCpPPjHFKdrO9JM9Os7k0w+PR+qymvsqTprWKEXpu5Tg5Fkt+ohpq8Vz0caPO1Fsw1tQQsjK3xXoTfhHBVAF9oCX9fo01SNF4QRQnkNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RpaJMvsmoYWjyuY1dgQw5ZatPhYvSgvPDwRJvgV9xs0=;
 b=FWlpZz8NLhv5iOlwHQ6Och86GMEMlSaz3CMNNNhcZYv4/zAGX1DIallDnK3ZyZroyLdTK4wHiUKqaMWhFLLyUxDEAFXk/h3CcmMeq4LUKUVArYdEEwLBdD+y9iIx5Abzfud56vGM2CXvk5D1v9j/QufTxwL5tDEfndYxgJVnkl2xVKpicRrzHe1H1r9zm73rqhgHVmmRT6SshcG+WZWBgGMnIeRjYenjnBi7O0GWw++2zFHhCPRWfh51jJEt9njZXgs9lCoFUJ5KrC+DxwZS0WFWLnT5IDLlxz+LSCqzdns6d3yiUjyyiQw8LiN2r+5p+/5UT1qaDaqmMHXRjtcePQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS2PR12MB9750.namprd12.prod.outlook.com (2603:10b6:8:2b0::12)
 by DM4PR12MB5890.namprd12.prod.outlook.com (2603:10b6:8:66::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.10; Thu, 22 Jan
 2026 13:43:46 +0000
Received: from DS2PR12MB9750.namprd12.prod.outlook.com
 ([fe80::56a8:d6bf:e24c:b391]) by DS2PR12MB9750.namprd12.prod.outlook.com
 ([fe80::56a8:d6bf:e24c:b391%5]) with mapi id 15.20.9542.008; Thu, 22 Jan 2026
 13:43:46 +0000
Message-ID: <9a76a4a7-c02c-436a-8f69-57606a6b2bed@nvidia.com>
Date: Thu, 22 Jan 2026 13:43:41 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] PCI/ASPM: Override the ASPM and Clock PM states
 set by BIOS for devicetree platforms
To: Manivannan Sadhasivam <mani@kernel.org>
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
 Chia-Lin Kao <acelan.kao@canonical.com>, Bjorn Helgaas <helgaas@kernel.org>,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
References: <20250922-pci-dt-aspm-v2-0-2a65cf84e326@oss.qualcomm.com>
 <20250922-pci-dt-aspm-v2-1-2a65cf84e326@oss.qualcomm.com>
 <7306256a-b380-489b-8248-b774e6d3d80e@nvidia.com>
 <76sr3yuwdaon3o3u5dfjycwlxhxcarid5tevgtao6aaapvwbzd@e7bam35dzt3k>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <76sr3yuwdaon3o3u5dfjycwlxhxcarid5tevgtao6aaapvwbzd@e7bam35dzt3k>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P265CA0260.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:37c::11) To DS2PR12MB9750.namprd12.prod.outlook.com
 (2603:10b6:8:2b0::12)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PR12MB9750:EE_|DM4PR12MB5890:EE_
X-MS-Office365-Filtering-Correlation-Id: a92cbdc2-538d-4f86-7229-08de59bc43d1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ME5MN21ISnROMkNOK0pna0t6dEJKVHYvZ3pVZ25hSnZZZTBEWUlRbW1tcUN6?=
 =?utf-8?B?RUhocTlIOTZrdzM1VHZydkViZE51dnA1YU8rVHhZYUxoc3g4Mm1SNTdxVnpO?=
 =?utf-8?B?U09POHJYZk5kKy9rWjhvVzVOMEpmdGNrK1FtYmZWNTRTRmNybURDVDcxdGE4?=
 =?utf-8?B?WmZJaFhIL3JsYitsZy80VEp0d2xKZzk5aWJra3FaNjlkNVlXMG1idGQ0ZUV1?=
 =?utf-8?B?NmhKZEd4STZMZ3RqUE9pZk9FbldoYmh2UVRLTWVrQmY1S2NhNTU1R1ZGLzFw?=
 =?utf-8?B?alJrTEx0aVgzeDllYVhoSXUxdDhBa2tFR3hpckVheE5pUTRzcnFDRWhSdkJT?=
 =?utf-8?B?NVgzbkdObXYzWjBXRksvYWxRcUhvZ2YxMDltaEcyQjJVRTBIUmlFNThuVWw4?=
 =?utf-8?B?TEExenlhb0R6ZU0wK2kzdXZaOTcrZTgyazRSdGkwN0NoVTgzOVpocHU1b3Rl?=
 =?utf-8?B?K3BMdlNKcC9ZWndxSW52SzlHOVFyN2JOWVlCcUwxUG9UcVh0MjFlNHB1TFB0?=
 =?utf-8?B?R2czQmJ2eXo5TWlBbkdkaUxvYVo4K05mTzNWNnRIL3Q0M2YwaDdzRXBQdUZ0?=
 =?utf-8?B?SjFITk9MZUxEZGlabmhadHRWVDBDUmx1dUFwRWxHRXg0bnVnU3lkWW9zYUxH?=
 =?utf-8?B?QmhUa3ZYeG5OYTVra0Zpaktza0JOWTF1OTMrVTYrTWdMT2VkVFRsck5nQmFR?=
 =?utf-8?B?LzhBSm5vbDBkZ1lGeXhQZWh1WWFYN1B5TTg5VE9oWHo3TlhUSitYd0lCMkFO?=
 =?utf-8?B?NkxVK0tYMUV5Z0tydlpaVUZ1UlJEejBWWDFWZU5CcmhqZG1kSlZoWnpZWEpO?=
 =?utf-8?B?R2U3YW5JZU0rd284dFY5aXNSSENudDdHWm5uaDhFay95MEd4RFpudXJPbzc0?=
 =?utf-8?B?SjRwS3V4Sk1KWER2bFp6Sk9HWTcrcm9IN0dYcnhzTGVGcnFNb1ZERGtVS0Jv?=
 =?utf-8?B?bU0xY1VSTExTTEZ4OFJzY0NXdC9uNkdYVkl1d1JVWmxNbFFWWXRHQVBaVTFy?=
 =?utf-8?B?QlNNWGJ1Uytya0ZaQlBrcmVvcnRRVWdvT296YzhKY1krNERPbUZWRVBpZnhy?=
 =?utf-8?B?bGxHNGNLbk8yQVZuQVFmemZPKy9sMUlSUnkrcUJBWmZmSC9vNGtyaVJ0ZjA1?=
 =?utf-8?B?NExNV3pmRlAxWGQrenQxZUR6WTRGZWs1ODU5VFgvaFk4TDRyZTlGVEMxVlRi?=
 =?utf-8?B?aXNTbzNmMm5HNTIvZzFGVW9VRUJsRjAxcjdvMVBXRmRtbmF4b1BWUjhZSURr?=
 =?utf-8?B?T200SUhPNVQ4aVQ1UWpYc3M3NE5NMXBsMGVqeUl3c2srTzdxc3ZNVzhaTVRz?=
 =?utf-8?B?K0RiZkhRa1J5SjFpQ1lPZ3lGVmxsU3B3QVJCQjN6dzJkOGIzM0Q1TTZTTlpY?=
 =?utf-8?B?ditlYU0rWTI0OCtkZllYUjBwL2Nra0VKdDA0eUpqbWJ2L1NvVGdqYm5NY0ZL?=
 =?utf-8?B?bkNmVjZYUU1sMFgxMFQ5aUZKM0JiWnZRT3plMXBPOFppcEhiRm54czBWQjVR?=
 =?utf-8?B?TFpYNklHM2E0b0lkcFFMN0dIZmU5TS9FZ3NLZHBlVjZwb3RCS0FXdHNmbFBU?=
 =?utf-8?B?OXZlSHhUbEUxU1dseTVScmtzMTRDcmtoRGYzRWZ0Qy9MUjlNR2REUURaRHpr?=
 =?utf-8?B?WVFIL01KLzBBQkZ2ZmlONlZOeGdNL2k2RFhIU2dlS1BQN0NFRis2dnpUdnZ6?=
 =?utf-8?B?Q0FHanFqeUNEYnkzblZUS1dsL0lUVEh3TGI1ZmkrSzd0UERtU0NGZjNBWFZp?=
 =?utf-8?B?cTZnZGpibEswRDJRRTJsdjJYVG10ZmxCdExNT3lNQklqUkxDNTltTWhBL0gz?=
 =?utf-8?B?a3Rvb1krSjRFd0ZVNTNINWUza2xxODZ2TmRTNHBoWTNycVhNdFg4dXc2Y0Jm?=
 =?utf-8?B?T3JnN2dzZHBrcHo4Rlg3UW4xZ3pjWEdIWk5MU3J0N1g1Ry84QXF4UkVJVC9U?=
 =?utf-8?B?T1ZPYjluQXo1Q0tUY1VzVVR3RnJaYkdXMDNqNEpUaUFDU3lZTm0vSk9BVnBQ?=
 =?utf-8?B?QUw4RHlIc0YrSzV1Ym5GZHhKTUFONERGWWR3QWs2c1BHSk4zS3cwZGo0UWdW?=
 =?utf-8?B?bXFGcmJoMmlEbnZRRTVpeVpwZVY2WmJHS3dLSklNV0d2aVc5YmZSMUgrZm1w?=
 =?utf-8?Q?TMZA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS2PR12MB9750.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SGJVdlhZWnlEalEvSWYzRWZ5cXhOL3lMWmhqUHRJWHczMy9MU0MvbytzSG80?=
 =?utf-8?B?Uk5KS25ZYk1wYmRwbHlkaC9yczZBMkU2WmFEbWd5cTZYN01PQkpqQjgwYXE5?=
 =?utf-8?B?NUJ5Q0praE85djBENE1idWpaREFQb1hOYWtUejM1V0w4OU1Ud2ljRW00NTNm?=
 =?utf-8?B?d0J1c3hLaTdXeWp4Q1MyaEZtY09jV2NOcmRoTU9PUmJGQ1QyMVUwcTh0OEJU?=
 =?utf-8?B?bFY2SktVUlVEQkdlblFTajlLZjV3bkV3K0svVWpRQVdkK3lhQ3lrSmpSSWZ6?=
 =?utf-8?B?SG9VMEErcXBOQ0VZdERrZGZORWRXbm9FV2JNRkhUV2dienUwckdsU2VtMk8w?=
 =?utf-8?B?bWJBY1g0c1d2eVFIOEY5TWE0Q2U0UnpDK2NtSDRSSFVzTzNyUDdWblZjMUQ1?=
 =?utf-8?B?VjBFbFZKZ1E2N0I3dUtkTzBCUDR1N0YrbWRLWDV0M1BaankyL2tWR0EvQWhl?=
 =?utf-8?B?R1JiU0hTemg0Sm51MGVvYnZjMVl1dVRtUTE3enRTeDk0UnFpdCtGYml3RFF1?=
 =?utf-8?B?dkZFSVFFZnNlaXFrM05qS09ZTGFOc2RiR20zYm9QbC9TcWtLUnpCZHBRWTZv?=
 =?utf-8?B?VHhVb0xJZnFMMDRVSXBRc3JFa3JHVWRvdGUwWWk3b3Z1WjN2NTR3M0hZbWNJ?=
 =?utf-8?B?QU0rdUp1cE9FSE5lZTF2bnJKVFI5cjR6NjJsZEZaUkpzMzRDa3dTb0VyeDlW?=
 =?utf-8?B?cHRkRWpnamw1WWNsbzlLU2lMdzVLa25PcktqaVRGd0JJZ3R2Y2x2SEZ2Z0lp?=
 =?utf-8?B?Nnl0cFdTVnZKSW0vVVA0Z3VEZC9oM25GUzhWdDg2b3FvKzlTeUFDZGNDcXZN?=
 =?utf-8?B?V0RoRWtwMW0xQTlaaGlFbEFtcDg0dUJMank5ZnIyNXQwQUVHeEkrRzBjQk40?=
 =?utf-8?B?QnBxNU9kNWEvSzZwZGxZWG9XaUo5M3lxZk5RdmgraEJocjVFbmtBazkzR0Jn?=
 =?utf-8?B?TE91UEFDOVpHcjg2dWNnWXBWRVMzUTdZenpCYitCbkN0aGxicVhUcE5nTFh6?=
 =?utf-8?B?c1VmWlRWeWd1Qk1ydkx1ZmxsRUIxTlU1WnNvK1lDUWRQVnp3bllvTkE0SEsx?=
 =?utf-8?B?dUcvbGJRREpXUGlCS3IwMUVka2R6QzRhZ0dnWCtkTUR4aTdCajl5QzlnSGNm?=
 =?utf-8?B?b21HN2hqT0plRUMzRTNJUXNKemlqMHQvckhwaVFMZVZKbTVxczFhTnFqREF1?=
 =?utf-8?B?OG42QW5XRldGT3hTU1FURFpORWw2VFdGQ0hWZGxYNWxZR0NPMFZiR0hNb1Nt?=
 =?utf-8?B?dHgvckFBWDRsdkVPVlovUjNnOFA5NE1sREZQS205dHJqdzlCK05TamFRd0k5?=
 =?utf-8?B?ZEpKWmlKMWtXaE00NWdISW9WVXQ2eVQvcjB1VXlWUncwaDBJZWxmUFpneWNY?=
 =?utf-8?B?bWlReU9ybi9UY2R3ZkRSSVo4UnF4MXZ4VFNmRkVBMklZUkdobUljT3lrdmJP?=
 =?utf-8?B?ZXZpVFF2czZOZjdFdHF0TU1Bdm45ejdjWTVjL3VDMUpmODRPOHlUK3E0Mmhr?=
 =?utf-8?B?Ykp2dHp1b0JIMU0yZjduOUhsaG8yUDk3bGtCMlJGdHQ0cmh0MFhCRktpU3A5?=
 =?utf-8?B?WWFnb2FRWis3SlR5dythdXlxcWF5RWlCanRGTUFEYVk1N1B0UGdMVU5KNnJT?=
 =?utf-8?B?akM4TnBONVkwUWVTUGNVWkhqY2hacmt0K1hmd3M2WDJMVVYrNW51UzRXeFVB?=
 =?utf-8?B?aGVIcG1aTWU5M1E2NVlVdTJLVnJJUzhOV2s2Wjd1dkprditFSGdZdnUxOEF4?=
 =?utf-8?B?MmIxcTROQlU0eTB2UjFUS1VrZFVkTW8rYTFkdFEzSVIweUNqUFBzVHpTbEF5?=
 =?utf-8?B?VE8vOHNQZHpKbjhzTHJvZGFsbWpTWjRIY3NHbkZFVHFnRWRFS3dndjhrU25W?=
 =?utf-8?B?Szh0Z2l5QWFRK05Sb3FkSStRVDRTWGR3c0krSUtRS3ZkZ0hFa0FFVUZyV3VQ?=
 =?utf-8?B?RWVDT0RqdG5VOENKZUo5TERLeEhscExPN0pUQkdJamorUkJUVU1ER3FHeUdW?=
 =?utf-8?B?Z3pZU2FyRDIwVGFUL0dZdVJ3b2VYU1QrbEJNMGdnYTgzcVdQVktCTWdXYlpZ?=
 =?utf-8?B?OGd6ai9tYkgyZ0tVR1Q0V084cElqSVh2cTNZRW5KYUIxeHlTd2xtaGRMQk5P?=
 =?utf-8?B?b1VybEduRHIzRmk2bTlsaFA5UktibmM4SzBKRDVqc01tSHlqREFYWTBoNzNS?=
 =?utf-8?B?SnhqUTh3bGtmMEVwLzhOaFdFS0R4Wm1qU0tFbVhyQ2o4VkxGUW1naEYybS9i?=
 =?utf-8?B?Y0lBTkNQd255bWphNFgyZ3V3YWtqaEZqRVBKaGRZZ1h0MTExWkErQ1dTZ3VG?=
 =?utf-8?B?TGxqUWJ1NDgxMXNOMG1uelRGZ0t5SWZaZWdEQkpYanpkempkY09vUT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a92cbdc2-538d-4f86-7229-08de59bc43d1
X-MS-Exchange-CrossTenant-AuthSource: DS2PR12MB9750.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2026 13:43:46.1538
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vu2ceEy/nPF/078nXUJmV7cdkPqRxpAtIjEZ5sA29QI8IhgEZe442Jgb27M1wONZWKq3gnXhF58RZoH8Spr8JQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5890
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_POLICY_ALLOW(0.00)[nvidia.com,reject];
	RCPT_COUNT_TWELVE(0.00)[16];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,google.com,kernel.org,vger.kernel.org,linux.intel.com,canonical.com,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-90207-lists,linux-arm-msm=lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jonathanh@nvidia.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	ASN(0.00)[asn:7979, ipnet:213.196.21.0/24, country:US];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ams.mirrors.kernel.org:helo,ams.mirrors.kernel.org:rdns,nvidia.com:mid,Nvidia.com:dkim]
X-Rspamd-Queue-Id: 958CE68BDA
X-Rspamd-Action: no action


On 22/01/2026 13:17, Manivannan Sadhasivam wrote:

...

>> Since this commit was added in Linux v6.18, I have been observing a suspend
>> test failures on some of our boards. The suspend test suspends the devices
>> for 20 secs and before this change the board would resume in about ~27 secs
>> (including the 20 sec sleep). After this change the board would take over 80
>> secs to resume and this triggered a failure.
>>
>> Looking at the logs, I can see it is the NVMe device on the board that is
>> having an issue, and I see the reset failing ...
>>
>>   [  945.754939] r8169 0007:01:00.0 enP7p1s0: Link is Up - 1Gbps/Full -
>>    flow control rx/tx
>>   [ 1002.467432] nvme nvme0: I/O tag 12 (400c) opcode 0x9 (Admin Cmd) QID
>>    0 timeout, reset controller
>>   [ 1002.493713] nvme nvme0: 12/0/0 default/read/poll queues
>>   [ 1003.050448] nvme nvme0: ctrl state 1 is not RESETTING
>>   [ 1003.050481] OOM killer enabled.
>>   [ 1003.054035] nvme nvme0: Disabling device after reset failure: -19
>>
>>  From the above timestamps the delay is coming from the NVMe. I see this
>> issue on several boards with different NVMe devices and I can workaround
>> this by disabling ASPM L0/L1 for these devices ...
>>
>>   DECLARE_PCI_FIXUP_HEADER(0x15b7, 0x5011, quirk_disable_aspm_l0s_l1);
>>   DECLARE_PCI_FIXUP_HEADER(0x15b7, 0x5036, quirk_disable_aspm_l0s_l1);
>>   DECLARE_PCI_FIXUP_HEADER(0x1b4b, 0x1322, quirk_disable_aspm_l0s_l1);
>>   DECLARE_PCI_FIXUP_HEADER(0xc0a9, 0x540a, quirk_disable_aspm_l0s_l1);
>>
>> I am curious if you have seen any similar issues?
>>
> 
> Marek reported a similar issue on ARM Juno board [1] on which one of the switch
> downstream port failed to come up while *entering* system suspend. But I was
> clueless as to why the device fails to function only while entering system
> suspend and not during runtime. I suspect something is going wrong in the
> suspend path.
> 
> In your case, looks like the device is failing while resuming from suspend. Did
> you see any error log during suspend as well?

I don't see any errors on entering suspend, just resuming from suspend. 
One other thing that I notice, on resuming in a good case I see ...

  tegra194-pcie 141e0000.pcie: Link didn't transition to L2 state

In a bad case I see ...

  tegra194-pcie 141e0000.pcie: Link didn't transition to L2 state
  tegra194-pcie 14160000.pcie: Link didn't transition to L2 state
  tegra194-pcie 14160000.pcie: Link didn't go to detect state

It appears that this is related because ...

  tegra194-pcie 14160000.pcie: PCI host bridge to bus 0004:00
  ...
  nvme nvme0: pci function 0004:01:00.0

>> Other PCIe devices seem to be OK (like the realtek r8169) but just the NVMe
>> is having issues. So I am trying to figure out the best way to resolve this?
>>
> 
> First let's try to isolate the issue to L0s or L1. Can you try disabling L0s
> first, then L1?

Yes I will try this today.

Jon

-- 
nvpublic


