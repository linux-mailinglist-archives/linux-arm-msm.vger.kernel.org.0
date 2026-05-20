Return-Path: <linux-arm-msm+bounces-108729-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GNnjFsugDWqC0AUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108729-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 13:53:47 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CE8958D01A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 13:53:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1B3833038ABC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 11:42:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 333A839B483;
	Wed, 20 May 2026 11:42:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="PIVDtecw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012009.outbound.protection.outlook.com [52.101.43.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BBFE39D6E2
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 11:42:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779277345; cv=fail; b=AsG2AifKwZP0V/PI1D/sEOBNFs2lkYk/IJtuvNWB5WPUTLcIbphsgy5861uVtvoC9Dj9cMYarVLc3yhV3DmD2h2KeqwkoAkazwG1z8AyiWMFCyYK7GPsoVCou7IF/iJ2gsMCOBbry+zARWv7H2whobITOFyu0FY/8DdWuDJ7EDY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779277345; c=relaxed/simple;
	bh=4KJDDqidBy5rIXVL2BkGn1CB6Ag8DW0GrJwTZBUB/T0=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Xzvo+MaI7ojR19klZqpobWcsa0iwC92OJ1scZFOAIS0aVm8EwVmjmjK8/BLE1J/89aeqIqMBIBAXJBqFK1g9dDq4qEfs07IET0w4U9SUcxcOQ6p7WCkPTEzH3ms5/v4FddVGxnxJ1GTKQ1E8sW4TrT5OFpFLYK5z1VZnL0yTKbg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=PIVDtecw; arc=fail smtp.client-ip=52.101.43.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YbndcyMei3l4iJe3ysxj61M3UIZgRLGTqYxUrJsfJXGHdkLf/uNkLuUQUbGv01a5lPILAJIjFXmWMMWc+D0xxnyhHTiGl3uwJvGbnzpXRSRRZStSFH+ZkgA1jEActRA0D8kVSd4K+MT3xbRIZmD1a+0pT6G9U9Jd41pkzRi0DX6uVPkXdj0Vc2gvgaN2COicZLkqcc9TgZmkOgWap4EIgCkqCutOArL4Q1Ee1iGBdVwy5vQhSYAWJ7Dn3dlDRgmgYdS/uPtVblohSXjJ4VbGw3+kngh8yVsXblLxOBHoZIb03FjVVV4YDCUeuWViK+kMDkEBs5fhLHdphDaPqOCmCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5FFNdUib/HWpjohmLS+BRIEQ7mt5V9GeLarYVeWaSlQ=;
 b=J8pDQ9uS1CpMK9o1KNMJIkpAQFJd2nTLsmg5f+fxrBGT/+m17JlgQEip+h753vv+w8mD5ims2AmmdVQOl43aVYjmbHdmI0TMsSkE5J1jtXJ78TDE/7txfYTJCumoOBUKqyRJ2DhkaS0Mf4cigxNmbjKaVywwRaZJZAjDuOV4mhcUiIYZg0717so28fvxrvarVZM9sMtXTa71ZSrGy1T0tAWbKVef2p84R4KQ9cB3faj8VZqEMVq7mrgTwRg2cIsUgrj1Z0PjAwgLJ5pR1lOhkUw33D/7DHEgtG61PEZ0CmGhX+78MTmplfLGPbzdjAx9BWZXbh2aZtfWFrALLHcDBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5FFNdUib/HWpjohmLS+BRIEQ7mt5V9GeLarYVeWaSlQ=;
 b=PIVDtecwo1+mjhBnPQN+YxTSHMzRdF4y/LtK2P+oXh3xvRFXm6karP7/9B/nX2R5wgZyr6YPW0vBSIGuy4hgx9Kd+dzo8K5iHTS1E2xh8KpalWTbaVvjKZNzHaThNWFfgkNL5vKWNrHjyiC9nbRL1QXGPpUFTZGXogRlFvwlx0Q=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by PH7PR12MB5831.namprd12.prod.outlook.com (2603:10b6:510:1d6::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.14; Wed, 20 May
 2026 11:42:19 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c%5]) with mapi id 15.21.0025.022; Wed, 20 May 2026
 11:42:19 +0000
Message-ID: <d61822b9-af27-429d-9fab-7153fde8c4cd@amd.com>
Date: Wed, 20 May 2026 13:42:11 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] drm/exec, drm/xe, drm/amdgpu: Add an accessor for
 struct drm_exec::ticket
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 intel-xe@lists.freedesktop.org
Cc: Felix Kuehling <Felix.Kuehling@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Danilo Krummrich <dakr@kernel.org>, Matthew Brost <matthew.brost@intel.com>,
 Alice Ryhl <aliceryhl@google.com>, Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar
 <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
References: <20260520101616.41284-1-thomas.hellstrom@linux.intel.com>
 <20260520101616.41284-5-thomas.hellstrom@linux.intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20260520101616.41284-5-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BL1P223CA0035.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:208:5b6::19) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|PH7PR12MB5831:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c28852b-2d92-40e7-8c31-08deb664d96c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|56012099003|22082099003|18002099003|11063799006|4143699003|3023799007;
X-Microsoft-Antispam-Message-Info:
	Gjm/LW8TnfqXB/C6AFpSC/p4kDK0cQ+40EqmqvDMBb1ORnHNeRhWBh6OHXfYXBft2h8bifh8Se/yVQ+TXNJY9MmBXSoilHP1j2JtCFNo8w/UFIoVtbl8UAY/2l6nsLoN5i2h6BgHiKqcKf4LXSN98oO+JHYM1L6uFBaax0/GAP6kizs9z7AomQ6OyEPQCU/aZFfg9UxOwKiXKkQ8e8ffxykcsT2/2ox8NrX34cYXB9gd+OMavIBM15Z5lj/RqStS4V9OiGWAxFHJPUMuOiuVk8NDYuzxotKomOwFrF6+lOFV+QXLi0c4duxEhwdnclcIitrSChAZ0ss8UFfPuwnRRn7wnLLmsuFr+3guZDTsY9gwGB9mTdEQOPIH5q8ZB77LWmCYwPmrIVMAUqEQbhSURR/9nEytepssBCHkdVdDVGP+3hu6sbtBVenCpMrIhud+6yByHBubdMbW20ppwmsJtPgKHGWNzZjYME7MITylq42rTx2LiMjVgBBRvhiYIqtdxRChOy1uWTvNRJpYG5SZgxfSwyUYv8skNQ0+9S2b0AxnOBUMDSXIw7NtPWVg/ncryvcUDE+v0uwXaSGvHEH8V5T/m5fuFHFlfrP6jEQ3u4qA0nODsbG7fR+KkSd3hk6FS6sWpDlG9odHi7/pb+H5uZsscN9oLlj49CYOKn291xxmfA15tJ6QwLsJxz0jvTLo
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB5685.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(56012099003)(22082099003)(18002099003)(11063799006)(4143699003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NDI4YVZlVVUxRzY3Ny9WNXJRRy9nZEl1Ujd5WHpWdm1zSkRHZDluU2dqQnQ3?=
 =?utf-8?B?Mmg2VDFOUWI4Q3lueU9HamJhcGs3dmJWTFJxQUlaa1ErUUMzYmxkQVgxWTJk?=
 =?utf-8?B?VG1uem03NWFseS95Tyt6WitrMHZHakVRUEhtWlIreWg3a1hkVVZDWnl0WCs0?=
 =?utf-8?B?UFdOYTRMRnk1bzNEc3R5QjQwSHJzZFlVb1BFQ2kxVmpySXRvK3dyMmhRSGVO?=
 =?utf-8?B?SVQvQ2kyOFN3MTU3aGhnTFBnMXZLWTR5cEt0TFc2czFRUzk5NVZMbHZoMTAv?=
 =?utf-8?B?SnZXcWNBYUJzK0ZJRmpPVkd6SW15VW10cVJWcXNuU2liRnp1UzdSVFlPQnR4?=
 =?utf-8?B?V1NDbFZkR0hmbUVBVlpka3Jybm5SMGxoRHIxSEFxS1ZsVGVyZUYxOU9Zb2Na?=
 =?utf-8?B?OE85aXE5c1JsNnZNNmJNam01cm55TE9hOU9GZTZheWZrelRGaFNKOEg1T0g5?=
 =?utf-8?B?RENMNVVKRStuUnlVbCtOa1owNmMvN3VTa2pMZkFUcjB3b3g4SzJ1K2YyR0w0?=
 =?utf-8?B?VkJ3ZDR4ajBOYWNFRHovRE96VmlHZ3djTjcwNy9obXp4bUhMRDhKV0V4SVR6?=
 =?utf-8?B?Q0FCSWpwUTl3c255ZHlEcFRra1ZtOEVJSmFqTXdmb3dSSHoyVG5TbjhFNTZB?=
 =?utf-8?B?ajByb3RsOWEvQXpXWHVtYUlrL3dML0hIRUxZOUFUNFlNdFBmZzlRaVlmWTBM?=
 =?utf-8?B?S2xaRFB6SVNWMjlzS09DRndqZ0ZkdGJyWDhpZGFIdDN2dVk3YTlvbmVSQ2FG?=
 =?utf-8?B?bWxONmRveThCcEtza3QvU3BMOFVJOGZyeEFCekFJSVVUVE11R1NaV2lnRUh3?=
 =?utf-8?B?RFZ5OU9pTkpzcGYrNU12VE9FSysydHordWwzL080cEkzQmJtK2RwTDFSNTdD?=
 =?utf-8?B?eWJ4akN6ZkFzM0sxTDBuOWFWNFNWQ29yc25RcGxGSUlJbmw2VHFsdFhFSEtZ?=
 =?utf-8?B?YTA0aWNoTzN6alBDSU5uVUZKVHRjWXN2VkxoNjNGOFkrWWVFZlZLMW5zWSth?=
 =?utf-8?B?S1gzS0s3dGhIbXRWKzJ0Q2R0VmJLeUc3N0N4dVA0dEhrMXZrcitIWER2RjRo?=
 =?utf-8?B?WDNHeEZsdEN3S3JzTWJJMUNBaVpEeW5FU3JUVDdDT05VUXQweVcxaUpRTjdV?=
 =?utf-8?B?YU9ERk1DOERFaW5QL2tkS011V29rd3RZcEt2UCtiaUwzeExLTkhYMVgzZnc0?=
 =?utf-8?B?NlVDYkJObGV6TTdJbTlFZnlKZDFUbzFGQzI3d0xRWVlLZnZsNERsRHJxMXRs?=
 =?utf-8?B?cmpLOEE0MkZBNmpISEQzTTZwUUlvL1VtMG5SYWNIWkpOU2hqbDdrV1p2WFVX?=
 =?utf-8?B?NnU5OG1yc3F1cDB6YkIrcTNHMS91dHdzR2VLVkR5cWJ4UitxUHVCZlZ6RVl2?=
 =?utf-8?B?MEJZYU5jSUx0bHBYWmszbkVVTHZUMUZZSDM2d3lIWmR3cHp4ZnBaNU0yMUVQ?=
 =?utf-8?B?VitoMjZNL1pqdnE2OURnUzAxdDlxQUZUYlZoMWNiVlFBL21EMkRrQXlzd0JY?=
 =?utf-8?B?UUgyU05jT0VqUUlta1lpUUVaYWJxV1FkbFMwS1JLdkxQVXowNTdjYUNWY0Jz?=
 =?utf-8?B?M1VxUjVsdHpZSlNEN0ovbmJuSjVLTjM3MkxyU1BveUw2ZitERzhPemFqeDJL?=
 =?utf-8?B?dm1NbDFJTVoybExKM2ZyVUVvTVJXSW9GMk5odDFqYzBWVG5UbFdaVmVmZkZn?=
 =?utf-8?B?QllqaDJJMVlvQXYyUGsvRm5KclRsUFM5bURmL0xLeE5zMUdzZjF1K0QrLzdr?=
 =?utf-8?B?Zi94ZUhXOGwzUFlGUjNpczl2V3dXeXVDcEx4a2M0MjRacjV3aEZ5T1FmdFFX?=
 =?utf-8?B?amZSUGpBZGVOUHdQMWV2Z2lXTmRTS1h0ZHl6cWNQN1FGM3pSRkxnZm1JU1pY?=
 =?utf-8?B?NWxrK0FWNklzbmQ5SnpzSVZoT0xzcnFSUnYwSTRxc2lqVTE1aVQ5UkJOaTZX?=
 =?utf-8?B?Z1Z5WGtmQ3hkd1kvUkl4eUozYytJMHFvdWhIOHJjcmk1cUtMamkwUjhqK1dQ?=
 =?utf-8?B?V3g1RmtiVkZ2aUxVMVJWWHJLTTBwZzIzVGE5ODU2eHJUVHd2cUdJQ292YlJq?=
 =?utf-8?B?aXRIek1VY0QwOXFMZmYzOTFkbjJMZlVNZlFFaEJJODJScjlzVDNEZ3BOZ1do?=
 =?utf-8?B?WXVpa3dhSGF3cnFKTmY3dVRhMVlhbERzZnI2M1d1SE1ZQ0ozaXZ2WDRHaGZ1?=
 =?utf-8?B?TU9FTTFnWTg1NVRXN3NjL0NqSmQveDFub0NqdFplQmdqVkFUeVF3RytqZWdt?=
 =?utf-8?B?R1RpVTNtaHdubG45RmVsQUY2TjVSMEtQUEN5emZNVGYzRC92TTkwdnMxa0Fl?=
 =?utf-8?Q?O8Pbehpc0ZP2KcsVXN?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c28852b-2d92-40e7-8c31-08deb664d96c
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2026 11:42:19.5571
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wzgEGvf5G6+v+eDDzWkavvxWyd2JcqbL+X2eZ1zhUMa2/LK/Z/IVOKUMkujLsNjV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5831
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[22];
	TAGGED_FROM(0.00)[bounces-108729-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[amd.com,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,intel.com,google.com,oss.qualcomm.com,linux.dev,poorly.run,somainline.org,lists.freedesktop.org,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[christian.koenig@amd.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[amd.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,amd.com:email,amd.com:mid,amd.com:dkim,intel.com:email]
X-Rspamd-Queue-Id: 2CE8958D01A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 5/20/26 12:16, Thomas Hellström wrote:
> Drivers were accessing this drm_exec member directly.
> While that may seem harmless, it will require action if
> the drm_exec utility is made a subclass of a dma-resv transaction
> utility as outlined in the cover-letter.
> 
> Provide an accessor, drm_exec_ticket() to avoid that.
> 
> v2:
> - Fix amdgpu compile error (Intel CI)
> - Update the commit message.
> 
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

Reviewed-by: Christian König <christian.koenig@amd.com>

> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c |  4 ++--
>  drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c           |  6 +++---
>  drivers/gpu/drm/xe/xe_validation.c               |  4 ++--
>  include/drm/drm_exec.h                           | 11 +++++++++++
>  4 files changed, 18 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
> index 72a5a29e63f6..d54794e5b18b 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
> @@ -2999,7 +2999,7 @@ int amdgpu_amdkfd_gpuvm_restore_process_bos(void *info, struct dma_fence __rcu *
>  	/* Validate PDs, PTs and evicted DMABuf imports last. Otherwise BO
>  	 * validations above would invalidate DMABuf imports again.
>  	 */
> -	ret = process_validate_vms(process_info, &exec.ticket);
> +	ret = process_validate_vms(process_info, drm_exec_ticket(&exec));
>  	if (ret) {
>  		pr_debug("Validating VMs failed, ret: %d\n", ret);
>  		goto validate_map_fail;
> @@ -3040,7 +3040,7 @@ int amdgpu_amdkfd_gpuvm_restore_process_bos(void *info, struct dma_fence __rcu *
>  			goto validate_map_fail;
>  		}
>  
> -		ret = amdgpu_vm_handle_moved(adev, peer_vm, &exec.ticket);
> +		ret = amdgpu_vm_handle_moved(adev, peer_vm, drm_exec_ticket(&exec));
>  		if (ret) {
>  			dev_dbg(adev->dev,
>  				"Memory eviction: handle moved failed, pid %8d. Try again.\n",
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> index 97a851ae7bd8..6ada57abce9d 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> @@ -1157,7 +1157,7 @@ static int amdgpu_cs_vm_handling(struct amdgpu_cs_parser *p)
>  			return r;
>  	}
>  
> -	r = amdgpu_vm_handle_moved(adev, vm, &p->exec.ticket);
> +	r = amdgpu_vm_handle_moved(adev, vm, drm_exec_ticket(&p->exec));
>  	if (r)
>  		return r;
>  
> @@ -1359,7 +1359,7 @@ static int amdgpu_cs_submit(struct amdgpu_cs_parser *p,
>  	cs->out.handle = seq;
>  	leader->uf_sequence = seq;
>  
> -	amdgpu_vm_bo_trace_cs(&fpriv->vm, &p->exec.ticket);
> +	amdgpu_vm_bo_trace_cs(&fpriv->vm, drm_exec_ticket(&p->exec));
>  	for (i = 0; i < p->gang_size; ++i) {
>  		amdgpu_job_free_resources(p->jobs[i]);
>  		trace_amdgpu_cs_ioctl(p->jobs[i]);
> @@ -1794,7 +1794,7 @@ int amdgpu_cs_find_mapping(struct amdgpu_cs_parser *parser,
>  	*map = mapping;
>  
>  	/* Double check that the BO is reserved by this CS */
> -	if (dma_resv_locking_ctx((*bo)->tbo.base.resv) != &parser->exec.ticket)
> +	if (dma_resv_locking_ctx((*bo)->tbo.base.resv) != drm_exec_ticket(&parser->exec))
>  		return -EINVAL;
>  
>  	/* Make sure VRAM is allocated contigiously */
> diff --git a/drivers/gpu/drm/xe/xe_validation.c b/drivers/gpu/drm/xe/xe_validation.c
> index a611438eaafe..8dff4d0ec895 100644
> --- a/drivers/gpu/drm/xe/xe_validation.c
> +++ b/drivers/gpu/drm/xe/xe_validation.c
> @@ -156,7 +156,7 @@ int xe_validation_ctx_init(struct xe_validation_ctx *ctx, struct xe_validation_d
>  
>  #ifdef CONFIG_DEBUG_WW_MUTEX_SLOWPATH
>  /*
> - * This abuses both drm_exec and ww_mutex internals and should be
> + * This abuses ww_mutex internals and should be
>   * replaced by checking for -EDEADLK when we can make TTM
>   * stop converting -EDEADLK to -ENOMEM.
>   * An alternative is to not have exhaustive eviction with
> @@ -164,7 +164,7 @@ int xe_validation_ctx_init(struct xe_validation_ctx *ctx, struct xe_validation_d
>   */
>  static bool xe_validation_contention_injected(struct drm_exec *exec)
>  {
> -	return !!exec->ticket.contending_lock;
> +	return !!drm_exec_ticket(exec)->contending_lock;
>  }
>  
>  #else
> diff --git a/include/drm/drm_exec.h b/include/drm/drm_exec.h
> index 99c7e1bb3c5b..8725ba92ff91 100644
> --- a/include/drm/drm_exec.h
> +++ b/include/drm/drm_exec.h
> @@ -161,6 +161,17 @@ static inline bool drm_exec_is_contended(struct drm_exec *exec)
>  		goto *__drm_exec_retry_ptr;			\
>  	} while (0)
>  
> +/**
> + * drm_exec_ticket - return the ww_acquire_ctx for this exec context
> + * @exec: drm_exec object
> + *
> + * Return: Pointer to the ww_acquire_ctx embedded in @exec.
> + */
> +static inline struct ww_acquire_ctx *drm_exec_ticket(struct drm_exec *exec)
> +{
> +	return &exec->ticket;
> +}
> +
>  void drm_exec_init(struct drm_exec *exec, u32 flags, unsigned nr);
>  void drm_exec_fini(struct drm_exec *exec);
>  bool drm_exec_cleanup(struct drm_exec *exec);


