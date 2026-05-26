Return-Path: <linux-arm-msm+bounces-109924-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GCQDLwsnFmqUiQcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109924-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 May 2026 01:04:43 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BAEE5DD66A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 May 2026 01:04:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 29423300A63E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 23:04:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8F153B3C0E;
	Tue, 26 May 2026 23:04:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="0dtj5ohn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012016.outbound.protection.outlook.com [40.107.200.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AAA3352C52
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 23:04:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779836676; cv=fail; b=dmz0C3rqtivERlvg7MvIKUKIXPvdWGIMj/ZLU5espaaMJfSh0HkY05K2+iduxRWRavW1KhqNTey+BmZwRWRWhtC3bdCuSK1MSpAebd0U5sRq4FP4Cnyq0iL+bw0h4U+JYUToI1OdbV0LxW+nDtO751327T8M3yCd2nN2Rg/Z9lo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779836676; c=relaxed/simple;
	bh=XAKOZv895RwsKwPEn2TGpPlYSU8MDphSfPt4M/cj6j4=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=gWEUUYCaubUOOUJx1wLy+2FmsPfTvZDErhk9ZinepKvoKNBTcv1uzulakPMeEaumY7c0Zu2kSI685cE5G4JjwfGHaLF9St2KC7+weEJxLPMRSJ+MFWA+fOVlIBBrpGZI1tMrKnQzBg7y5J7UIG5fpjh13GF0qSOdZpAybFaPj7c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=0dtj5ohn; arc=fail smtp.client-ip=40.107.200.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ewx8zK5QvnE7hzsVZJeHD93CI/RxhGF7F9JFMxU5W3Ccrij+u77rWjahVX1KEB11folnGaIEmN2hRD8szgs0rDvexImzrmX3xEK46Q8y1nj24CvS8SEv9PMrqFAhrMlvvZIu97/Rziz9mOZkygmxEZYwDBGpsrOqN0/uZDgUQpuV8i9Bujkj9Qy7abmBwpuoTzMnRF0ztueShNHjbc90kikrDGPSYOaAdcmeqmtunPDT39IsO734W+QOHV3tC6YiX15pvsoX/aRgoxLkr01tDmtK2LB+aFIHXJtx49Is2Oyzfx06gXPT9+qeIGR8B2+Jy7P8fpDmi6x5Y5tYA4Wizw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vd9SsKyjoSU9uZzx69T6ZMjkMADsVjGCWyldpCm7aTo=;
 b=bsUOHzXq+dm6jflvVUqbE1UOl6Gmo9Mx9oIvywu7y8lIfKfyIxlxLsAC3CDyqYQy7oteLtHkH00xVE3UrkZOJvrdqkIvsI/b4yGFaMwzGMjni1LIycEhAcQavDP6vmLSHfjy/byCnB1MjuecDDL4U4+qCBUJZap2PPVzwJaKuX7GUGdBeKPELhLZ0A/uWowHpLEQwGTqzluljW4BA78BevqFtD6fhiazajsPZQAFh69/V+kfccXctu9/oU9Mta613daxR9mp9pp3pKMeZ2ydRaWb9wOo7Xin2tNq4vYxeWOEYio34bIG92jxfn7cPPYYcZBaiKIu0ufus4j2vZSbyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vd9SsKyjoSU9uZzx69T6ZMjkMADsVjGCWyldpCm7aTo=;
 b=0dtj5ohnrc0CJ1GksUGJUVV86gCQDuwDjLqSIJrqt29yjDKW7cCI0bFMf0IbT0Krmpwxwcj/MWejOyUyGUBGMA/H98S4Pu9nuNteQ5dRfqorhCjAosW4tc1fUX/YnGp6Pax4uRNGMCLwXssi4zOEhnZSlT/aVQ7YHSWCjMj/cvM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB8476.namprd12.prod.outlook.com (2603:10b6:8:17e::15)
 by DM4PR12MB5961.namprd12.prod.outlook.com (2603:10b6:8:68::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.11; Tue, 26 May
 2026 23:04:31 +0000
Received: from DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2d79:122f:c62b:1cd8]) by DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2d79:122f:c62b:1cd8%6]) with mapi id 15.21.0071.010; Tue, 26 May 2026
 23:04:31 +0000
Message-ID: <fc8cf494-487c-4433-b11b-59a25c2b711c@amd.com>
Date: Tue, 26 May 2026 17:04:28 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] drm/atomic: reject colorop update from inactive color
 pipeline
To: Melissa Wen <mwen@igalia.com>, airlied@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, simona@ffwll.ch,
 tzimmermann@suse.de
Cc: Simon Ser <contact@emersion.fr>, Uma Shankar <uma.shankar@intel.com>,
 Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>,
 Xaver Hugl <xaver.hugl@kde.org>,
 Pekka Paalanen <pekka.paalanen@collabora.com>,
 Louis Chauvet <louis.chauvet@bootlin.com>,
 Matthew Schwartz <matthew.schwartz@linux.dev>,
 John Harrison <John.Harrison@Igalia.com>,
 Rodrigo Siqueira <siqueira@igalia.com>, amd-gfx@lists.freedesktop.org,
 kernel-dev@igalia.com, Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar
 <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20260526142940.504911-1-mwen@igalia.com>
 <20260526142940.504911-4-mwen@igalia.com>
Content-Language: en-US
From: Alex Hung <alex.hung@amd.com>
In-Reply-To: <20260526142940.504911-4-mwen@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4P223CA0022.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:303:80::27) To DM4PR12MB8476.namprd12.prod.outlook.com
 (2603:10b6:8:17e::15)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB8476:EE_|DM4PR12MB5961:EE_
X-MS-Office365-Filtering-Correlation-Id: ac1692c2-9914-4868-47ea-08debb7b2522
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|366016|1800799024|11063799006|4143699003|18002099003|22082099003|56012099006|7136999003;
X-Microsoft-Antispam-Message-Info:
	2MWWwDkz5utKb3ov9iMBVH9F/RaU8DLBCuNHzXGj6JkNSjnkDAsZkEVWcT3nYJfLiXrm0JoDx67Of6+RaBTZg0yRSQZvbYqNlJTuZ5boDfwmxApxj+QE3zpT1A4V8RdKZARQh/FR6lxNvEpzLOKOfdaDg5BXTKJp9fhNH5GrPJ5D2l9ljk4FSrptxDy9BX30Ah8zEXsgFKitzlbR2l0pYSDLAp6Sxj2U07jKiinlqo7rV1fh1g300hiAAU2wvfcUinVO2ZZVNY1MUMWCq3QRUFp0bQ2hx+4j97jNFohSX0c1CESzXeoG/ldpxOIaIiPVjCsYSbBdr/lrG0PahvkoeiTBu095gGzc8dAZO6hjwOrNpEkUG+8oQba1xgegJ/BGbCab6B7ZE5tl4cWCYaWjWfdiueNmxPinkfi8aJsjjy2ADOK1lqucdmKKHIx2gCNBXmRHjBQaxh4RooWHh8QBVhsvrj+EwMwTR25BDRARd+cfFywM4/IF/78b8GubH57HFkajld7Iz+Pnv6IPfPS1Exjdlq10eBSN7j/E47MZQVoVDPdPngCp86VP1lHjq0px7WobcdpZyuvu4WQHHMG9hGXTrhUt9rPcWo+9qUYld0/9RpjYo+tzDs76NGAvIljqdflrV5vjJl/crVgUuD8iGjsT1kDYehictxBl/yI6LWveVhcJyGps7CsQzztBFpGC
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB8476.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(11063799006)(4143699003)(18002099003)(22082099003)(56012099006)(7136999003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UW44QmgwN0ZRdlQ3VWNuT01GbnltMnZ3aWppTFRjQXlHU2hpdlVZZXc5ZjZo?=
 =?utf-8?B?ZjQ5ZVR3RTQrOS9xUkI4TlJTNHliWWx2OWxiTUw5cEQ3b2FlM2FiS3VsTS8z?=
 =?utf-8?B?WE15OHRjRXhkWlJIaWN4aXJ5UHlVMzAzaGZTVUU3MjUvbWptWmREbFlBV0Jm?=
 =?utf-8?B?RlA1azdPNWVXVVNoc0ZPZGxDVVBpTitBUHJaMkxVU0VvekY4SmRVSkFTdk5S?=
 =?utf-8?B?QlhmOUtodHdldXBRWi9Hc25zSG5DVlJUS05HUFZvL2g4QkU0T0NTVWFLVHRS?=
 =?utf-8?B?aG4zVW90aUE2RjNBNUlKdnorWXFVWWNJMjd5dmhmMFdqYmQvUlUwaWNBNTlJ?=
 =?utf-8?B?bmRtUWg4dG1WeFNUTmkyTlRWdmlCcCtCODhtV2JEQU1TNm9WUHNBbW96NzF2?=
 =?utf-8?B?M2hSUERRN1p2SGwrUnRZckkzZzZEdEliYzRHMHNKVjZMMzdTY3NnT2RLN3Bu?=
 =?utf-8?B?dWFpMXFtQlczNDVHbzZ4RTBuSk9FeUdmZHZRUTlkTThtZ1hnRTF2azJKWGNi?=
 =?utf-8?B?YlhDMWozNjhPRHNveStSVzNiWkdDQzhUWTNJTW9zOUt4QWtqYmE1a3hHRjVm?=
 =?utf-8?B?U2FyTCtpSFI1ek1ucG5kUnJQZHA2aWQvVmFmTlZLS2o3anM3WnY0RURBdnox?=
 =?utf-8?B?NFdWUTl6a0NnZ0F3KzlnUFVGaGdFd1pWWmFFTURjWCtkOVlwK2djRUlmWGNQ?=
 =?utf-8?B?WVhzSXZPSWc5b1ZqWmlydFpGY05uM2VOMHRjVDVKbDI0V0dhNWlxNStDSTA2?=
 =?utf-8?B?bHFwaHNnSGJoZ2MzRUwyeUZ4eVdHM0YyT1N1TDhMZlFENnVPbmNEb09HYllu?=
 =?utf-8?B?RmVlY2JmbDR3MFBRZlhKWDZLYTc3NFRVNk1wVDR5VXJ3Qmw0Vm1qRWZwZWVh?=
 =?utf-8?B?ZHFzVnU3UHEwSjIzNjllWG1md0lsTUtoWDRmMWNkZ0pZcUlDc1doMzNrNkZI?=
 =?utf-8?B?N3VvSjhqYmZoVityU3oyT3BZNlhoc00yNG5oMm5UbFlHSGhPWWNjUWNTc0Nv?=
 =?utf-8?B?MWdOZUdIak1HY01MWlFrSTdBQzRiOHlXU3EyRkxpOU9KMjJCSnNQSUNsbk52?=
 =?utf-8?B?UVFWS1dGZ3JzeDNFdWk3K2dHSFUxSUk5WmZNM213elJjbU04Sko0d1Vqc1ZV?=
 =?utf-8?B?MXUveUdjUGNQS2JnaXFsMitDMC9NNWE4V0NOL2lQQkgwN2NoOWRseHVWc2lm?=
 =?utf-8?B?YnFzZjA2eC9RbFVMb1RDSFNxcFdIandIanpBOFZxUVF0MlduckY3T2d5RFM5?=
 =?utf-8?B?VWcxOVdHbFVyZzk4cmtaSnZaYlJqUVQ1UnowMU4zbDdKbFdrSmx3WjlRZmFC?=
 =?utf-8?B?dmwvRU1iaVpoZC9QR2IzNHhOb05Ha3Vja2NlZ2N1djBudFpKenhjT0dnbUV2?=
 =?utf-8?B?UjFQVHk0d2FNQUM4TnAvaWkyS0ludWYrQ2ZYYmRJSS8zRCtjaTZUNk1GUzhy?=
 =?utf-8?B?Y0Z5bUlNTWlsQnlSSjVFeFVTbGJhcUlSK0RzWHliYURWT2UxbHFwcExhTHRN?=
 =?utf-8?B?dW1nM1IyYUpJMFcvQ2NmT240cWJjMkpIZWMxTkNaOW8yRVlqYjlkYXdkYk53?=
 =?utf-8?B?Tng5ck43d0VXMVlVUlRSTnk0eU1DMXVvTVlMU0NVQzMxcGx5OG81eEFqYTJh?=
 =?utf-8?B?S2VwcjBwZldXOTBvRGhLR0xtQ1RJY3owTDRDYTBiUHE1MkkvWW02YjdBUWdQ?=
 =?utf-8?B?bjh2T1YwV3gxZjBHS0M4WFd4MGlPS0pLWGs0bkQwUitZWlEvOUNGU21ZOGZH?=
 =?utf-8?B?amZTVTV5T1RVYXhhZnVFVEYvc2FSeUdzbEVXeHRtVTFod2VFdGx0Y2czcVZ6?=
 =?utf-8?B?MFVRTU9qMnNtWVJjUVZLQjdmai9RWXF3R0pPbVlrWUJ1cDFQVEVDWDg0TkZ1?=
 =?utf-8?B?ODVSeHB3UFdCdnZ3RlNqcXBYSDc0eDN6L3M3YW5LdkZKbHVrbWIzS3ExUWdR?=
 =?utf-8?B?VE5pZDBVakVxK3VjWWxqMTdyNGFPTlNheW1vbUQ5elRHcHFWdUFvREhqblBw?=
 =?utf-8?B?V1ZLWGpHUlZnYzBuZTRjQzRaQlJNTzIwSm15UEhPRkZPeXQzOXZKdDVxQXU1?=
 =?utf-8?B?RGU3Q0prQWY4cTVKY0hQN0grbDdTeHRLcUhUd3M3MTdHUGpSRUJ5RmxJK1R3?=
 =?utf-8?B?Z0xXcHFVNlhJb2s3OVJyOGM1blJTSEFrL0RVWEZXZGFpYUl3OHNiZzV4WTJj?=
 =?utf-8?B?MmlSK0Z4VmRjdUdsbGVHWlUyanlmNVhFS3l4Ujh3My9td3VQQXZSOTd1MmNl?=
 =?utf-8?B?VGlUMUdQdlp1bVlFcEd5Q01STkg5UGphT05ZSUd6SDhtbnFFY0crNUhUQi9G?=
 =?utf-8?B?bGllZWlEdlNHUUFWMnBUVG91RVk1VkRLTEdEbDNDWEpoVkdOM0JOUT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac1692c2-9914-4868-47ea-08debb7b2522
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8476.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2026 23:04:31.2909
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PbKGkokZSgFj2kAecwWh6/d1vAGUX7CljpXY+1cFlCSILJKkLReThpCiJri7Zp1XMthIHZPdZG+BXlkfoJyciw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5961
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-109924-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[igalia.com,gmail.com,linux.intel.com,kernel.org,ffwll.ch,suse.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[emersion.fr,intel.com,kde.org,collabora.com,bootlin.com,linux.dev,Igalia.com,igalia.com,lists.freedesktop.org,oss.qualcomm.com,kernel.org,gmail.com,poorly.run,somainline.org,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[28];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alex.hung@amd.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[amd.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:mid,amd.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,igalia.com:email,intel.com:email]
X-Rspamd-Queue-Id: 7BAEE5DD66A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 5/26/26 08:17, Melissa Wen wrote:
> Only allow updates on colorops that are part of an active pipeline, i.e.
> check if a colorop belongs to the color pipeline of a plane in its
> current, new or old state. If not, reject the state change of this
> inactive colorop. Performing this check later in drm_atomic_check_only()
> to remove the ordering dependency that would exist if done at the time
> of colorop property setting. Userspace is allowed to change colorops of
> an active color pipeline, or when activating or deactivating its
> pipeline in the same commit. However, changes in inactive color pipeline
> is not allowed.
> 
> Suggested-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
> Signed-off-by: Melissa Wen <mwen@igalia.com>
> ---
>   drivers/gpu/drm/drm_atomic.c | 59 ++++++++++++++++++++++++++++++++++++
>   1 file changed, 59 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
> index 4fb3a23e862a..a0549435954b 100644
> --- a/drivers/gpu/drm/drm_atomic.c
> +++ b/drivers/gpu/drm/drm_atomic.c
> @@ -865,6 +865,54 @@ drm_atomic_add_pipeline_colorops(struct drm_atomic_commit *state,
>   	return 0;
>   }
>   
> +/**
> + * drm_atomic_colorop_check - check new colorop state
> + * @new_colorop_state: new colorop state to check
> + *
> + * Ensure that the colorop in @new_colorop_state belongs to an active color
> + * pipeline, i.e. it's in the chain of colorops set to the color_pipeline
> + * property of current, old or new plane state.
> + *
> + * Returns: 0 on success, -EINVAL otherwise.
> + */
> +static int drm_atomic_colorop_check(const struct drm_colorop_state *new_colorop_state)
> +{
> +	struct drm_atomic_commit *state = new_colorop_state->state;
> +	struct drm_plane *plane = new_colorop_state->colorop->plane;
> +	struct drm_plane_state *new_plane_state, *old_plane_state;
> +	struct drm_colorop *colorop;
> +
> +	new_plane_state = drm_atomic_get_new_plane_state(state, plane);
> +	old_plane_state = drm_atomic_get_old_plane_state(state, plane);
> +
> +	/* No changes in the plane state. Check current-committed plane state */
> +	if (!new_plane_state) {
> +		for (colorop = plane->state->color_pipeline; colorop; colorop = colorop->next)
> +			if (colorop == new_colorop_state->colorop)
> +				return 0;
> +		return -EINVAL;
> +	}
> +
> +	if (WARN_ON(!old_plane_state)) return -EINVAL;

return should be in a new line.

> +
> +	/* Check if the colorop is active in the new plane state */
> +	for (colorop = new_plane_state->color_pipeline; colorop; colorop = colorop->next)
> +		if (colorop == new_colorop_state->colorop)
> +			return 0;
> +
> +	/* Same color pipeline as new; no point walking old. Colorop isn't active */
> +	if (new_plane_state->color_pipeline == old_plane_state->color_pipeline)
> +		return -EINVAL;
> +
> +	/* Check if the colorop was active in the old plane state */
> +	for (colorop = old_plane_state->color_pipeline; colorop; colorop = colorop->next)
> +		if (colorop == new_colorop_state->colorop)
> +			return 0;
> +
> +	/* Colorop is not part of an active color pipeline. */
> +	return -EINVAL;
> +}
> +
>   static void drm_atomic_colorop_print_state(struct drm_printer *p,
>   					   const struct drm_colorop_state *state)
>   {
> @@ -1714,6 +1762,8 @@ int drm_atomic_check_only(struct drm_atomic_commit *state)
>   	struct drm_plane *plane;
>   	struct drm_plane_state *old_plane_state;
>   	struct drm_plane_state *new_plane_state;
> +	struct drm_colorop *colorop;
> +	struct drm_colorop_state *new_colorop_state;
>   	struct drm_crtc *crtc;
>   	struct drm_crtc_state *old_crtc_state;
>   	struct drm_crtc_state *new_crtc_state;
> @@ -1730,6 +1780,15 @@ int drm_atomic_check_only(struct drm_atomic_commit *state)
>   			requested_crtc |= drm_crtc_mask(crtc);
>   	}
>   
> +	for_each_new_colorop_in_state(state, colorop, new_colorop_state, i) {
> +		ret = drm_atomic_colorop_check(new_colorop_state);
> +		if (ret) {
> +			drm_dbg_atomic(dev, "[COLOROP:%d:%d] is not part of an active color pipeline.\n",
> +				       colorop->base.id, colorop->type);
> +			return ret;
> +		}
> +	}
> +
>   	for_each_oldnew_plane_in_state(state, plane, old_plane_state, new_plane_state, i) {
>   		ret = drm_atomic_plane_check(old_plane_state, new_plane_state);
>   		if (ret) {


