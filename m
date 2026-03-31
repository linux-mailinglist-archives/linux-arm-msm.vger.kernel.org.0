Return-Path: <linux-arm-msm+bounces-101008-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sFbmOg+Uy2nMJAYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101008-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 11:29:51 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B7D536712E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 11:29:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id EB27330205B5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 09:29:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE6E63DA7E4;
	Tue, 31 Mar 2026 09:29:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="bmBHtqyc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010029.outbound.protection.outlook.com [52.101.201.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BD4539A7EA
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 09:29:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.29
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774949389; cv=fail; b=Aca26AUgAw/d1tMHED5jYv2PoMyx5sUMQctyZvkWGm5knbs/o/wexYury95PjbpGYwkhJpUnKlsSDDZvCSgd3YkQjxg403c94+kDpjdu9y3ayz5B7gBa1o7QZE4nUMGEcLFssSjnMh4Fndfw9MNz0BGP/t8Y61ZRknws9N7WRdE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774949389; c=relaxed/simple;
	bh=EZbxXXRTvMAdGwGrrU7UGr7OGMEutLyO1H9YQ2N7VOk=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=nBm6LYcvHMTHZOdKsONj3mhke5jtQHvCOaq/7jGKG+UkZVHzokbjvpnILYhaEcK9VXPPYgsxQGDCJlccESum6KCosLhIEbzfSk0R3kCAHzZEjNjGd5yfM6mm90WV1bFgRCQTFWKuUIOvJ+ePL+zYuT8LKxfaZ7xWpovAwUs6ZQg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=bmBHtqyc; arc=fail smtp.client-ip=52.101.201.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wMypwDWZRDbuPIS26TSdDL56V9eDHVT23g3pUtpxRg4GlM5O4GTIKX05wNc1w2EfKeCACUGOSJ8kPiaUNfpeFIOLIsXL2t7JguDy7kTTh+n7II308Cfka/XpG9K2KXYFNBMBr3/DQCGNU+CCNOnatQdV97fdv9bZ25mtRvaID/xBxon3VO3gcJHgI6wqU2gDfAtMiqI41wx2Wva8m5ZPAfGjPZl++mZsTZxeGNWpqAIquGBsFzQ5kws3D2bji8FXgz+zT/NkRn+r9QcaBGpuICGWzs/nh8Tx15epm4M/jZTMNi6ax4gDdZ8Mpz+nQNcI5tSOXjUlSI9w080DKO9g4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zsqee0vn3ZKJJGR6xae3nweLN/kfzd6gldxOQuTLMr0=;
 b=vUoVfnWWyFagvU73IYmrNL0oXqpc+HVx2opucQmNkb+M4225TeoP2Kit/o99fIOg1k9a/2BUkn3fvFrHSUgCFqPJbGhtLC/Nz9Z/JXIrxum6sO0XN035Dnu4woK8TRZtW36k9BTdOJfPIutgy//p3sGhTSls1eQrrOeFRnPdjmA67QTlwrFzMEicD3ovuoYunsBnn9boS6OZlR/3CufelNIH6smNHXdd9ZC01TaNKy1x9QT7tumuuHkYaBy3WwkfMa4P1vy+/HyvwQCYXmmtjc/HZvEV8sjtGNAKYx/ShVB5Mh3pPg/2NdQQfS8D63mlJd21qO63rprnV0WvSYCWGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zsqee0vn3ZKJJGR6xae3nweLN/kfzd6gldxOQuTLMr0=;
 b=bmBHtqyc6JforFe+dqCA6pgAKf//fTf+aRLOE+M4joR6TS11uEoU3E/PBz4G2zUzQd3e24NDGsAb1gfRWcrYK11MOiEkQ5BnpvkXI/5ymwmcXHc2PfwKEL78u5F2lBivQF25httFs3cfpk+T0DIIjqe0PdIrHzuDeYAOEy5rj14=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SN7PR12MB7420.namprd12.prod.outlook.com (2603:10b6:806:2a7::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.16; Tue, 31 Mar
 2026 09:29:45 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c%5]) with mapi id 15.20.9769.014; Tue, 31 Mar 2026
 09:29:45 +0000
Message-ID: <b36e387b-1399-485e-a56a-2d971328e27a@amd.com>
Date: Tue, 31 Mar 2026 11:29:36 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] drm/exec: Remove the index parameter from
 drm_exec_for_each_locked_obj[_reverse]
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
References: <20260331092023.81616-1-thomas.hellstrom@linux.intel.com>
 <20260331092023.81616-2-thomas.hellstrom@linux.intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20260331092023.81616-2-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0450.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c6::11) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SN7PR12MB7420:EE_
X-MS-Office365-Filtering-Correlation-Id: d3b39f6c-6560-4499-f1bf-08de8f080b86
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|376014|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	f2HYJxI+zE/YnMPJcUgz/p6I8Z0V0Y+yvyvJnXiVLlRA0GXe9OPpPPxodAoyo08/JxpmW/jUBprp63+MpmrhElq/hUhUP4cNOYPQsX/ryhQD/U1HWNCsNWLW9VCB+Og4f7JUlNSYNf0NKEE+Yec5+UuyuUcGfWcrtfX847/NoR08yWsuUh5CZhFREPu/XaL+rsXTta7CKCZnLNMRs298qxaBls1Q2y7eg8zse1qJBKnNiCU93V7hJqTgkFAoIf4CpFV3oFriOdnVVuROnEOuSuoNZ1v1vv+TPm2ADhqKEckUNI/SzJpvVpRvEZ3Eh/+T5m3zgukFT6GN8vBgaMNfvzJI7BDewEA/YEVYJFog3TnJHuNOSRBa7CZ2fMXVr6yKJrn5fdp68xh/sQS2giW4Y5HvJzugf8H33F4OU9YxbLJyzqYbTFWc5kN4oWTW1SfbvlQB22Twp5mt7Y3qzlmtSTc9j/aXLNoGD0s4rIbXnbDyxu9qouYqkYnox/LK1lT8f3j4v0fwIfLhgx9kkFT3WHZhY/A9jvSqsDv8sOzkUg+hXIbVTebWx9hjuQ5a/GtjFFMbwQ/3YJ8dMonKEH1ZKWJqq5OcWxrtT0mF7R7TM3RdVPrIwoq85njrxbdZtHKkaUqEILLgB7hqSTq0OZdMPVpVLPMLVoEx1xun7a35Fh3TK1D5u15hIe9lm5i5VHnvmlQhkMOBayIT5BzvuaQacdirbCSQ1DnXn8LzPAPdDVM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB5685.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U1JMS2p5bFdieGwzNmZqWE1VTTRjMTR6RXJaczhJS2tld0M2MDJGNWZ4UEtv?=
 =?utf-8?B?LzhldXNUUzhWa2I5Vzh4UERiZjBJc0Vqdi93QTRMZDlLSHpCU3ZrMThza2J3?=
 =?utf-8?B?L1h5VEV2WG1aQmRLZDJQdzcrZ0g3Z0JQYXA5VkdidjBBQW5uZzFPZGtzaTNN?=
 =?utf-8?B?MFdpYVpOUU5wK05ta0tFZVM0RjFsSmcxT2xSL0F6b2dWODNLbHdrK1JTYUdv?=
 =?utf-8?B?aExjM2RmN1FQNDQzekx2YlJZSWFCRmpEU0lwWVM1Y3BmUVE0Vjd1ZTE2VmlO?=
 =?utf-8?B?QXRkejdHNnlUTU1VbFFaQjRIcUprRWhaeEdia3lJQTZwSHNKMG4ySk9QNDA4?=
 =?utf-8?B?UGRMSS9ydVc1MkF2R2JHQTF0aGlEejBEUVdqZnZNb0V5YzFzR1N4R3BjTjBB?=
 =?utf-8?B?QXplTTIyWkMvc2lNeUhqd2NYZlZTdTViVlQ3R3dSVzlTME5KSURwV1gwVnBk?=
 =?utf-8?B?YURjbHNzTTFtd1BUQWdOSjhJamxIRnhXSlVLUlFPMTdKamQrcHUraFZ4Mkc1?=
 =?utf-8?B?UitSVmFySG1VOWplWEtOdUpwMS9nUHBsbU16V1BJbE1pT1BvKzVETC93T1dz?=
 =?utf-8?B?akIyNEJLbDdRdmVBY3E3VDNlSVRDM1RiSFJuYkVqczBsOTNmVzNwbE9NL2Y0?=
 =?utf-8?B?VW5tZHZxaUpweGRJcjU2VlpQYkhSbUpsUW0wVlRqOTdycmsxU3dhQXlDSnE3?=
 =?utf-8?B?YmF2L3NwU0gzayt2TDNobGVDNHY2akV2VlkzQkYvdElldyt1ZUxqdG5HWEdi?=
 =?utf-8?B?eURDbjh6REpSWHdBNXdTOUZOc2t1ZVU2d1BuN1YyYUZXYU5BMkQ0RVRNcWFZ?=
 =?utf-8?B?SEpNOUVyQUZIRVBmQ0FOVElSbEhsYUdQMDB1cVhuUWpRbzBHd0JRM3VnNSs2?=
 =?utf-8?B?b0NyMExmVytiVWFaaThaeC9Qdkd1SnFzckJOeGY5ZzRQVFVFU1F3TksweHU4?=
 =?utf-8?B?eWNnMVF3cHZqZDE5WlJJY2ltSTRGOEszTTUvbEZ0M2UwTmNUMFFnOUFESHla?=
 =?utf-8?B?VklpZWsveXJML3d3cUV1dnFhUXFVRUEvRlZwWUNFekpPcldxRmdkUndQd2pq?=
 =?utf-8?B?dWcyOUhaTkhsRS9rbmlrdEdNNlB5K1NQd255MENWNEZ5Ymx5YnJnbmlkV2F0?=
 =?utf-8?B?KzIwZ09BWXNIOTBHYXRWR092UlZMV2dOV0twUEpBNkZVTHdxbm5aWllHWFgz?=
 =?utf-8?B?clFQZTV6TThMVFM0MnZGM0dxZ1N6Rlh0RThCMnkvWXBFZE1WMlB1OHBXK2g1?=
 =?utf-8?B?ZWpBMk8wODlwNytuVHZwYWluZUJZeSswVzl0YnpYdGlmL0Z0ZTlZUGplWHZv?=
 =?utf-8?B?RnVZRGoyQnI0OWxUakNPa3JTaWFwUlFONmNPMEltdnRlQTFkdWpVU0Zld0JH?=
 =?utf-8?B?cVl2WEgvTTllWit5bU1ZeXFYcmdjM21NYkhzRmdUUnJpVCt4WG1UQko0d2lE?=
 =?utf-8?B?enk0RGpaemRReTNwMThvQnE5NVRVZnZFUC8wa1luUk1Zc2M5bk1Ed21KUlRx?=
 =?utf-8?B?YWR2bWlxKzQ1azJia2Vma1lOV2FRamJwakRzc1YyZlVQblBQcWFrbDg5NHNm?=
 =?utf-8?B?K1kwRXpQa3hyczZIUG14eSsrU0JudWZBQkxQYjdRSzR5cllXendXM3dySUdu?=
 =?utf-8?B?bjBjZHc5d3dJaGFzNlMvNnlLTzFlWkZJUHhGQ2ZVUk5KSzZiN3pmUjVlalFx?=
 =?utf-8?B?eWJzcTdQdlFHOFpUVHU1dW9OS2xLWkVHRUt5RnBUSStGN1I3blNOVFVaTVZ3?=
 =?utf-8?B?RG5YWE5SUmZNeC8xOTk3MlA2ZXlKRDVJTTJXRUQ4Yk5ZMFptalkvN1paMmxk?=
 =?utf-8?B?dEoyL0M4VGExRTk2Q3FSOVpzZTdqSjhRQXRYcHVUZHd3UnFkbXk4WkdXUWpV?=
 =?utf-8?B?M3FWcUxDNXZMbkQxYjJZaTFFcnNMT0hMelh4NjJyam8xVmJHZ0d5ZkpQY1pp?=
 =?utf-8?B?OVFiMWtWRHpwTDZzbkJNWTVBemJlRy82R3k3MHdVcjlMeWZheThkdE9vT01G?=
 =?utf-8?B?RzcwQmkzTUlWWHh3eEJIdUtYVlA2Ky95cVM1bk9TbDc2SlBlVlZybjdLa3JY?=
 =?utf-8?B?cGlLdDBCYldlampJTTRHRkRVNXpUbHlTOEJRUVBERFpmNk9Ga01hNFJEbkJL?=
 =?utf-8?B?eStnVzhzaFRUMmVFY0dTeW15Uk9LYlB4aHBRdzRxOFJYMHhFVWlld1VOVHA3?=
 =?utf-8?B?NWsvRGZLUDMvQ3laM3E1VG04ZUJqT0ZOdGpLNFdsc0Y4ZXJnSENIUnBVLy85?=
 =?utf-8?B?WG5MWEFKbmNIZDdZWEJKTUFFMmpvWUt5N2phdUxrdEFOQVdGQWtkVUs5VHpL?=
 =?utf-8?Q?wmXMLXDVkk1LZtQzEW?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d3b39f6c-6560-4499-f1bf-08de8f080b86
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2026 09:29:45.1476
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gw6LVNnG7a8HFtOQ3MfprRJH1McDarOh5qxdYHudnEGL9rW+BwKkDtobFHJoqq6X
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7420
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
	TAGGED_FROM(0.00)[bounces-101008-lists,linux-arm-msm=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,intel.com:email,amd.com:dkim,amd.com:mid]
X-Rspamd-Queue-Id: 8B7D536712E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/31/26 11:20, Thomas Hellström wrote:
> Nobody makes any use of it. Possible internal future users can
> instead use the _index variable. External users shouldn't use
> it since the array it's pointing into is internal drm_exec state.

Yeah that was on my TODO list as well, just one more comment below.

> 
> Assisted-by: GitHub Copilot:claude-sonnet-4.6
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c             |  9 +++------
>  drivers/gpu/drm/amd/amdgpu/amdgpu_eviction_fence.c |  3 +--
>  drivers/gpu/drm/drm_exec.c                         |  6 ++----
>  drivers/gpu/drm/drm_gpuvm.c                        |  3 +--
>  drivers/gpu/drm/xe/xe_vm.c                         |  3 +--
>  include/drm/drm_exec.h                             | 14 ++++++--------
>  6 files changed, 14 insertions(+), 24 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> index c048217615c1..c4ee19603460 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> @@ -850,7 +850,6 @@ static int amdgpu_cs_parser_bos(struct amdgpu_cs_parser *p,
>  	struct amdgpu_vm *vm = &fpriv->vm;
>  	struct amdgpu_bo_list_entry *e;
>  	struct drm_gem_object *obj;
> -	unsigned long index;
>  	unsigned int i;
>  	int r;
>  
> @@ -962,7 +961,7 @@ static int amdgpu_cs_parser_bos(struct amdgpu_cs_parser *p,
>  		goto out_free_user_pages;
>  	}
>  
> -	drm_exec_for_each_locked_object(&p->exec, index, obj) {
> +	drm_exec_for_each_locked_object(&p->exec, obj) {
>  		r = amdgpu_cs_bo_validate(p, gem_to_amdgpu_bo(obj));
>  		if (unlikely(r))
>  			goto out_free_user_pages;
> @@ -1201,7 +1200,6 @@ static int amdgpu_cs_sync_rings(struct amdgpu_cs_parser *p)
>  	struct drm_gpu_scheduler *sched;
>  	struct drm_gem_object *obj;
>  	struct dma_fence *fence;
> -	unsigned long index;
>  	unsigned int i;
>  	int r;
>  
> @@ -1212,7 +1210,7 @@ static int amdgpu_cs_sync_rings(struct amdgpu_cs_parser *p)
>  		return r;
>  	}
>  
> -	drm_exec_for_each_locked_object(&p->exec, index, obj) {
> +	drm_exec_for_each_locked_object(&p->exec, obj) {
>  		struct amdgpu_bo *bo = gem_to_amdgpu_bo(obj);
>  
>  		struct dma_resv *resv = bo->tbo.base.resv;
> @@ -1280,7 +1278,6 @@ static int amdgpu_cs_submit(struct amdgpu_cs_parser *p,
>  	struct amdgpu_job *leader = p->gang_leader;
>  	struct amdgpu_bo_list_entry *e;
>  	struct drm_gem_object *gobj;
> -	unsigned long index;
>  	unsigned int i;
>  	uint64_t seq;
>  	int r;
> @@ -1330,7 +1327,7 @@ static int amdgpu_cs_submit(struct amdgpu_cs_parser *p,
>  	}
>  
>  	p->fence = dma_fence_get(&leader->base.s_fence->finished);
> -	drm_exec_for_each_locked_object(&p->exec, index, gobj) {
> +	drm_exec_for_each_locked_object(&p->exec, gobj) {
>  
>  		ttm_bo_move_to_lru_tail_unlocked(&gem_to_amdgpu_bo(gobj)->tbo);
>  
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_eviction_fence.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_eviction_fence.c
> index 4c5e38dea4c2..f6b7522c3c82 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_eviction_fence.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_eviction_fence.c
> @@ -121,7 +121,6 @@ int amdgpu_evf_mgr_rearm(struct amdgpu_eviction_fence_mgr *evf_mgr,
>  {
>  	struct amdgpu_eviction_fence *ev_fence;
>  	struct drm_gem_object *obj;
> -	unsigned long index;
>  
>  	/* Create and initialize a new eviction fence */
>  	ev_fence = kzalloc_obj(*ev_fence);
> @@ -140,7 +139,7 @@ int amdgpu_evf_mgr_rearm(struct amdgpu_eviction_fence_mgr *evf_mgr,
>  	evf_mgr->ev_fence = &ev_fence->base;
>  
>  	/* And add it to all existing BOs */
> -	drm_exec_for_each_locked_object(exec, index, obj) {
> +	drm_exec_for_each_locked_object(exec, obj) {
>  		struct amdgpu_bo *bo = gem_to_amdgpu_bo(obj);
>  
>  		amdgpu_evf_mgr_attach_fence(evf_mgr, bo);
> diff --git a/drivers/gpu/drm/drm_exec.c b/drivers/gpu/drm/drm_exec.c
> index 8d0601400182..746210f3f6c2 100644
> --- a/drivers/gpu/drm/drm_exec.c
> +++ b/drivers/gpu/drm/drm_exec.c
> @@ -24,7 +24,6 @@
>   *
>   *	struct drm_gem_object *obj;
>   *	struct drm_exec exec;
> - *	unsigned long index;
>   *	int ret;
>   *
>   *	drm_exec_init(&exec, DRM_EXEC_INTERRUPTIBLE_WAIT);
> @@ -40,7 +39,7 @@
>   *			goto error;
>   *	}
>   *
> - *	drm_exec_for_each_locked_object(&exec, index, obj) {
> + *	drm_exec_for_each_locked_object(&exec, obj) {
>   *		dma_resv_add_fence(obj->resv, fence, DMA_RESV_USAGE_READ);
>   *		...
>   *	}
> @@ -56,9 +55,8 @@
>  static void drm_exec_unlock_all(struct drm_exec *exec)
>  {
>  	struct drm_gem_object *obj;
> -	unsigned long index;
>  
> -	drm_exec_for_each_locked_object_reverse(exec, index, obj) {
> +	drm_exec_for_each_locked_object_reverse(exec, obj) {
>  		dma_resv_unlock(obj->resv);
>  		drm_gem_object_put(obj);
>  	}
> diff --git a/drivers/gpu/drm/drm_gpuvm.c b/drivers/gpu/drm/drm_gpuvm.c
> index 44acfe4120d2..2e44671e05b1 100644
> --- a/drivers/gpu/drm/drm_gpuvm.c
> +++ b/drivers/gpu/drm/drm_gpuvm.c
> @@ -1550,9 +1550,8 @@ drm_gpuvm_resv_add_fence(struct drm_gpuvm *gpuvm,
>  			 enum dma_resv_usage extobj_usage)
>  {
>  	struct drm_gem_object *obj;
> -	unsigned long index;
>  
> -	drm_exec_for_each_locked_object(exec, index, obj) {
> +	drm_exec_for_each_locked_object(exec, obj) {
>  		dma_resv_assert_held(obj->resv);
>  		dma_resv_add_fence(obj->resv, fence,
>  				   drm_gpuvm_is_extobj(gpuvm, obj) ?
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 56e2db50bb36..30efd6721da1 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -373,7 +373,6 @@ int xe_vm_validate_rebind(struct xe_vm *vm, struct drm_exec *exec,
>  			  unsigned int num_fences)
>  {
>  	struct drm_gem_object *obj;
> -	unsigned long index;
>  	int ret;
>  
>  	do {
> @@ -386,7 +385,7 @@ int xe_vm_validate_rebind(struct xe_vm *vm, struct drm_exec *exec,
>  			return ret;
>  	} while (!list_empty(&vm->gpuvm.evict.list));
>  
> -	drm_exec_for_each_locked_object(exec, index, obj) {
> +	drm_exec_for_each_locked_object(exec, obj) {
>  		ret = dma_resv_reserve_fences(obj->resv, num_fences);
>  		if (ret)
>  			return ret;
> diff --git a/include/drm/drm_exec.h b/include/drm/drm_exec.h
> index aa786b828a0a..25db52dd2af0 100644
> --- a/include/drm/drm_exec.h
> +++ b/include/drm/drm_exec.h
> @@ -68,28 +68,26 @@ drm_exec_obj(struct drm_exec *exec, unsigned long index)
>  /**
>   * drm_exec_for_each_locked_object - iterate over all the locked objects
>   * @exec: drm_exec object
> - * @index: unsigned long index for the iteration
>   * @obj: the current GEM object
>   *
>   * Iterate over all the locked GEM objects inside the drm_exec object.
>   */
> -#define drm_exec_for_each_locked_object(exec, index, obj)		\
> -	for ((index) = 0; ((obj) = drm_exec_obj(exec, index)); ++(index))
> +#define drm_exec_for_each_locked_object(exec, obj)		\
> +	for (unsigned long _index = 0; ((obj) = drm_exec_obj(exec, _index)); ++_index)

I'm not sure if _index is unique enough here, would use something like __PASTE(_drm_exec_index, __LINE__) instead.

Apart from that looks good to me.

Regards,
Christian.

>  
>  /**
>   * drm_exec_for_each_locked_object_reverse - iterate over all the locked
>   * objects in reverse locking order
>   * @exec: drm_exec object
> - * @index: unsigned long index for the iteration
>   * @obj: the current GEM object
>   *
>   * Iterate over all the locked GEM objects inside the drm_exec object in
> - * reverse locking order. Note that @index may go below zero and wrap,
> + * reverse locking order. Note that the internal index may wrap around,
>   * but that will be caught by drm_exec_obj(), returning a NULL object.
>   */
> -#define drm_exec_for_each_locked_object_reverse(exec, index, obj)	\
> -	for ((index) = (exec)->num_objects - 1;				\
> -	     ((obj) = drm_exec_obj(exec, index)); --(index))
> +#define drm_exec_for_each_locked_object_reverse(exec, obj)	\
> +	for (unsigned long _index = (exec)->num_objects - 1;				\
> +	     ((obj) = drm_exec_obj(exec, _index)); --_index)
>  
>  /**
>   * drm_exec_until_all_locked - loop until all GEM objects are locked


