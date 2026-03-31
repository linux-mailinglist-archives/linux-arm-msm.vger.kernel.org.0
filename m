Return-Path: <linux-arm-msm+bounces-101014-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WRF8EHGWy2mYJQYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101014-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 11:40:01 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C792B367350
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 11:40:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0F0B4300C0E2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 09:40:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D022C3815E9;
	Tue, 31 Mar 2026 09:39:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="oGveRMjD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011007.outbound.protection.outlook.com [40.93.194.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BED82C11C4
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 09:39:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774949997; cv=fail; b=KnuP+1Clf7L/qn6huqtQVjHqPqY2mnU8Yasep+jukGTdRwrxwrIDZMKk4Jsejd9b+lxQv25L2XqLzm4l8ZM3x/zIjHjlSOsVf5N3aqUALklT7mscxGDJTPP5hYRlxLOhhMjd/ABde25c7NC7LljEI048HMk3UFME6qxs9XMtXRE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774949997; c=relaxed/simple;
	bh=ECt94Zju04NezC1Izd82KYOnQrt09UfEpxnQCtJVn5E=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Ht+ars8/IKMXPWmI3rAbHRtCCAbMO8OVLgw3vbd0eeg+djaK5W+DiwMyBEb15Kvfwqiv6LpT2aqZaPyc+y+AABsdLwTg/x5Xa2aY/fCSnaq1Ncsv+muCxgHd6c0ncy5/mrpMbqJWXVlniOk83pKyDF/97oP+RkQW0i4dyU7XDGY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=oGveRMjD; arc=fail smtp.client-ip=40.93.194.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RGh/QxIl6vP3CY0UgGYNmkkPikgCmI6ueMw8L4xeWFw/Iq0xKipxfY6fnFbkaG1seTj1JZhURKkUudRftdKtLaWYPQ2Jd+96VqjLbNCjjGkUY/+hA6KiTC3dn9C3PaT1f5/YSiq10X8s5xj73gawPOkrD7lfl+VbEuPNwtt7hZeiSwJsJtGBIrCCUabhrppiPOwszIXSyOWU0o59PQbPsi9dp6QPno0hmRlNDNkFTCm/zCukUG+wIQyPAGgZ/zlMVZFW+r8EQfl1NFg7h7W0Zkw/HwsjY3Ohet6sRdnRSK2ZpLwdIsDFPpxgn8x5ou6sQFyc/gPETG/1uJhQkfT7NQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HCDd2AOGam+N32A764qH9W0qk/YxMLL5KS+2fZPzzRQ=;
 b=i5X1z3x7IZil6fyY/VwEya0V/4fxzofk+jSy7n3ZzthG34jxR/2aKNbzzkngoJyb62JeuSfJURWbOwGJZkUdnhQ0y8W+2KMjUxI9u1dOuFqUxjI1uXH8U4qPCfiwkBWG53N0OpLAQUyFnnpg2s71YFZxmMrZNiygeqe5TAURmCBpnNJoog7ZZ3n/p+RqPkC+Ce0Jl0MaN8wsUpVVO7sgxjmDQJ8Nw5NXCTj4dWnu2wfL4HnUO/VqKKPyBclaZF9sAh8Ay0xLUyjoLdQ8EKnMhNTaGF1lR/oZUFnzpEEL0w2yAKGdnui4ZSy6v9D/SNQeQEpvQwmzFPQj3oGilCRPgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HCDd2AOGam+N32A764qH9W0qk/YxMLL5KS+2fZPzzRQ=;
 b=oGveRMjDiUdNCZvClwSXb3dPRnUPbotcZg98a7qpvdaYy5x+wz4mrte3V2lXhc1LcaTuAOUa5786xqoBmV/CSfiLibWlr9lrHN0GlOzj0aOBFdqLo0jw3nW+ZFXVr6GTQqGA2hGBR/g+7GmnQhYsDpL+8p0jXtSQEq95UtaKct0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SA3PR12MB7858.namprd12.prod.outlook.com (2603:10b6:806:306::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.16; Tue, 31 Mar
 2026 09:39:53 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c%5]) with mapi id 15.20.9769.014; Tue, 31 Mar 2026
 09:39:53 +0000
Message-ID: <dc8f24ed-be2a-470e-a092-f461503cde71@amd.com>
Date: Tue, 31 Mar 2026 11:39:44 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] drm/exec: Make the drm_exec_until_all_locked() macro
 more readable
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
 <20260331092023.81616-4-thomas.hellstrom@linux.intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20260331092023.81616-4-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0001.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c8::15) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SA3PR12MB7858:EE_
X-MS-Office365-Filtering-Correlation-Id: 97efa6b0-dbd6-4a0a-3b75-08de8f097603
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|376014|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	AWbtSpz1kV2Ta7pQHRpmprrLA/Jr3m6fapjUbhax1X5RoKkkMfNltgPOK7qUSlveZP9zKQVf7YtfyD+GXKoelAtpHA81NFo4XSLm93ZhYtyOLdI4tOk60LBQJkR3vAWyp602EkPO/m2jvguvd1TWiaQEd7n+NRV49iQpU1DxSluv11ueqZDnnKyR7nmwXbWz+qd99aJ69D9dkTYUzjxepktwv7pxv8ho/drCZE6+Mjp+24GKXxNiIFSs5MVpIk8AVqqMARzpyRxYzZ/QKZkjpQgxhoGWwi0yzzgx0VmiGIERFEjGcOqm10oB1J81P1XgpW7PUN5rCrxHgaQaWvvxtPW7J/WB4DHEnqLsouG+PYaybLcjZSv/ymS6lfcbAf3GeUtlEtcecldbQzChOzJs3Xn6yLWwEc7uxU2nZR7Q4pMCXoP8ICkLdZCZNvLhFxRpvuJcrTtz1oUygcMhJk4Dsm2zjXcM/CRBmjcnnmBUNizqO6rqyAdGqxZm+YNWddl5q964RCpgB+mY5k5LxF5p/s1VwUo2paoRb0QI8vHdEuOYZvBFbVQ43Fa3SW4GuYfHqwVEzz5j8tRoqnFlmuLJMRjf9VUZpqjKA29G9Ee1XLaatbBVm4bF+MEH+dibxadVRCwZ0P767A2s1w8eEUyR5hYSQ1OwOARN4Ppc1HDcjl9fzaopdt4PdSn5wZxfuxCRghYDMqj996h0fTm/3itXIP6CjJGApZ5sizBJgbiHy+I=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB5685.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T1BhTDQ1dERLZEwzY0ppRmdnNEVCSit1dDFOSEx5VzhLR0VWVi9mVUNmdGJB?=
 =?utf-8?B?bXJsL2ttL29WSGx1YmNKamhUYlJRMWJrbHY0Z3A4Q2hUV1BCUHJwWnA1enp6?=
 =?utf-8?B?VE1OMDBjSlkyakZIdjlJeUR4UnFNNStNRzRaSzh6WGVWcm5MTnU0ellSaFI2?=
 =?utf-8?B?M0c0eTVKWm1mRVBlZ0ZmYlJBcjNhLy9kVDZuNU9ILzViRUtWdTFQazVKZGd6?=
 =?utf-8?B?czdENlZ4cDdzd09EWTZCblhwL1NjQndKb0hIYWRENUE5TFR4eXRSRW1Vck9L?=
 =?utf-8?B?Z2VYdkwxVUVYSjhFa0duU1FzQ3FGZnY4UDFldUc4Zk1BbURKZlhjUjROSTU0?=
 =?utf-8?B?ZDRDUVltYStvRnFtSzZpMUNheVNERGlTakl2VFR5RlpvZldvZFk5L3FQRHdQ?=
 =?utf-8?B?VHU5a0d3Qkg1MEVnc2gwakJLaGl4UFpjM2VEQUQzZ1ZhWlJDR2xoeXhIa1l0?=
 =?utf-8?B?dVJlR0hoS3gza2dvUVY0cW14TEd5cFhuS25LblBKYzEzQVpNdU5Mbm43aVFq?=
 =?utf-8?B?ZnJINjBLdzhYM1d2L240QUNQWWtMSkpuUUh0TzlWSWlOVUg2aEl2VlVzQTVQ?=
 =?utf-8?B?b0l1K3JCYnpYazkyS2tKcEZHWmg0a2daQ0tqbmZYem16bld1SU5TQWsxNUdW?=
 =?utf-8?B?eXI4cGY5VEEzQ090RFBPb3NxUS9oWkpMR1B5Z1gzK1ptRjNYNHl3eTBRb3Zo?=
 =?utf-8?B?OHNyb3FndGtQUjVQU1JNT2RjVnc1amZLSUEvTEx3QnBWRlpqOWYxRFJiMnFz?=
 =?utf-8?B?UHpvQ0NWeklVR1RBcVdISi9JSStqZittb3hyaUhjdHZDMXpZL2VrYVo2MUtE?=
 =?utf-8?B?ekQ4aU5lZUZ3cFhiengwVlgxNExlUjFJQzA0dlJvTDI0TXNYM1VXRk01aGp1?=
 =?utf-8?B?QStpbWVDYW5JL05MVEFRMGZwVUN5WjNPN2dLVGxXVXd5cXJ4RmRwMmx1V1gx?=
 =?utf-8?B?VkpESGVkbDJEVEdvTlVjVlFrMlVROE9oTGR1dks2Vy9qMDZ1cUI0WXJrZklI?=
 =?utf-8?B?VGpId3RNU0xZdHBmTUM1SmVqeHJ5Mjhta3Q0OUlsU3I0SDhkbHl6YTNGUlpu?=
 =?utf-8?B?Wkd5NWxtSWUwa2hDajFmOTc3QmJhclZvYlUzUGNNUlZrb3l4TkV0em9Kcmda?=
 =?utf-8?B?cTA1Wng4Tk5ZTDAyaDlqM2laV0EwZldPOTNadEdObjZnazZ0UVNGM0hUR3Vn?=
 =?utf-8?B?YWYwQXhmK3Z5bkFjeERtN2xQSzRoNzhVUXpKR0VBTkNhQnlUVDVnYmZXdHBC?=
 =?utf-8?B?WDlhVDNrRWF0RE1GQjFHREZEa3B6WmY4L0ljOXk3enZYVEw3S0dxWGNFM0pV?=
 =?utf-8?B?dk5ULzJvU2tiaTNsV0pxak9NcjRmWVg3cE1ycmpTM2k2U25hMjFOczM4YVo2?=
 =?utf-8?B?SE9vYnpRb0NMYWdoOG45R1c0WE84bUY4YUdFQ0dCTTBscHlCNElHVUxxKzBi?=
 =?utf-8?B?VUtwK2E2MjdUZ3lJOHdBeWtFYWovV2NJMmp1WHpDajlMTStEc1Bna2lJV21k?=
 =?utf-8?B?ZDhtWlZ2bSt6NXdaMjFUSGdLVys0RC9XR0x2anNLamdvUmFhaXFZbjFDZXBP?=
 =?utf-8?B?YTExeHdQQjFRUDROWWFOeUd0blhyN0RiZ085czlxRUtLNmFWcFBsSTNnWlU0?=
 =?utf-8?B?STMvdjUxN0Fsb2tWclRxVEY2T3Q4ZU9rSUVJdFVNZE1JdjMvQ1EyeUpIU0pL?=
 =?utf-8?B?OE1CdkZzMHQ3L1ljUGh0bmFNWjR6OTd6OGllREZYblhSaXNDc1VTQ1NERi9a?=
 =?utf-8?B?bENEcVBzT0RwRnBRcDYrMk80bHhWYmxYRGFjRm1mWFJCWkt6WVRWYXFWOG9M?=
 =?utf-8?B?ckJtV2I5dWhmWTB5R2V4SXNJZUFLaUFFbUtoMFJOekZUNkF1VlFxMVhjc1BE?=
 =?utf-8?B?d1lIVVRoMXg4RWNyTUhHMlYxNmV3RmFKTjlMRmk0UmQ4L2VDWGpqS20xdVNs?=
 =?utf-8?B?V05KNURJaGZlVkpRTGsrT1hlYmlrVVVzWXF0ejBNVVdSejZsTEpWY1hRdEZa?=
 =?utf-8?B?L0lZSnQrM2QxenJCVmFQRk0vRW5nVFZCaktjbTRGUHRXY1Y1R0NSeUVuN1FC?=
 =?utf-8?B?NUk3M3RkMlJPc2NxakI4YkVaMk9xWFlJODJCQ3BKOUxZenEzSnp6cGk3M0Rh?=
 =?utf-8?B?VXRMcmxXejJPQ25NcEpkSXdqNEFNNDlVbFd1d1JZZnRhZTZaVE5USkxjNU1S?=
 =?utf-8?B?bmJ2N1owSXZpbXRZQ3BQYk9CUm45MVhHdnoxWWt1ZFBtTDhMekdSam00M1R0?=
 =?utf-8?B?dVQ2YnpDcklGWk8rS0pBVTd6R3FFWkJHZWhSU2dta25HYlJGUENzcCtkYTJ3?=
 =?utf-8?Q?yAsO8HMNzXP+IgiJq4?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 97efa6b0-dbd6-4a0a-3b75-08de8f097603
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2026 09:39:53.2375
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KmqPQyDkSTXvrVYrTKjE9ofjwjtpfQZJSHgoVvzd7p8FnWqYGWuLyk6Mzw6zodnx
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7858
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
	TAGGED_FROM(0.00)[bounces-101014-lists,linux-arm-msm=lfdr.de];
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
X-Rspamd-Queue-Id: C792B367350
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/31/26 11:20, Thomas Hellström wrote:
> Use __UNIQUE_ID as done elsewhere in the kernel rather than a
> hand-rolled __PASTE to craft a unique id.
> 
> Also use __maybe_unused rather than (void) to signify that a
> variable, althrough written to, may not actually be used.
> 
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>  include/drm/drm_exec.h | 23 ++++++++++++++---------
>  1 file changed, 14 insertions(+), 9 deletions(-)
> 
> diff --git a/include/drm/drm_exec.h b/include/drm/drm_exec.h
> index 25db52dd2af0..fc95a979e253 100644
> --- a/include/drm/drm_exec.h
> +++ b/include/drm/drm_exec.h
> @@ -89,6 +89,19 @@ drm_exec_obj(struct drm_exec *exec, unsigned long index)
>  	for (unsigned long _index = (exec)->num_objects - 1;				\
>  	     ((obj) = drm_exec_obj(exec, _index)); --_index)
>  
> +/*
> + * Helper to drm_exec_until_all_locked(). Don't use directly.
> + *
> + * Since labels can't be defined local to the loop's body we use a jump pointer
> + * to make sure that the retry is only used from within the loop's body.
> + */
> +#define __drm_exec_until_all_locked(exec, _label)			\
> +_label:									\
> +	for (void * __maybe_unused __drm_exec_retry_ptr; ({		\
> +		__drm_exec_retry_ptr = &&_label;			\

I think when using __maybe_unused we could also move assigning the variable to the deceleration and drop the extra ({}).

Apart from that looks good to me.

Regards,
Christian.

> +		drm_exec_cleanup(exec);					\
> +	});)
> +
>  /**
>   * drm_exec_until_all_locked - loop until all GEM objects are locked
>   * @exec: drm_exec object
> @@ -96,17 +109,9 @@ drm_exec_obj(struct drm_exec *exec, unsigned long index)
>   * Core functionality of the drm_exec object. Loops until all GEM objects are
>   * locked and no more contention exists. At the beginning of the loop it is
>   * guaranteed that no GEM object is locked.
> - *
> - * Since labels can't be defined local to the loops body we use a jump pointer
> - * to make sure that the retry is only used from within the loops body.
>   */
>  #define drm_exec_until_all_locked(exec)					\
> -__PASTE(__drm_exec_, __LINE__):						\
> -	for (void *__drm_exec_retry_ptr; ({				\
> -		__drm_exec_retry_ptr = &&__PASTE(__drm_exec_, __LINE__);\
> -		(void)__drm_exec_retry_ptr;				\
> -		drm_exec_cleanup(exec);					\
> -	});)
> +	__drm_exec_until_all_locked(exec, __UNIQUE_ID(drm_exec))
>  
>  /**
>   * drm_exec_retry_on_contention - restart the loop to grap all locks


