Return-Path: <linux-arm-msm+bounces-109699-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YhVLDm0TFWomSgcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109699-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 05:28:45 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 99B0F5D0534
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 05:28:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 47DE930157DD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 03:28:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2F873A8741;
	Tue, 26 May 2026 03:28:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="WEVYi3N1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012051.outbound.protection.outlook.com [52.101.43.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B857C3AEF2A
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 03:28:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779766122; cv=fail; b=Or1JIccSIYE4MoWhkFJhc3nLRJqAxL3+9QmoTS3ZlnIPseYIGBDpiPKhRgBo1dqfNyzgQpoFGkS7TXHU79MqBcl8G8B4+kaX+CSJxs1ZPLgk6dnbG+mzPQQiY077vtbnoUaDLLQvba8pqlnoqvBKGUxKBXG8jtsBz6+IwmlWkMk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779766122; c=relaxed/simple;
	bh=oEoQDYd83Y1q4kvLB3xIXgNOj9c0JKFEwhk0Sfqq4/0=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=HsG2dxzLq7uVzkxa5UkQQaxWRqYJu1LzqXhfE2I+SuHEH3wQYv8ws6DtbvjrfAVLDWyDgryK9+YL3m43sGhXdpXCW6pH7lDBDtziotkCcibqNLeaL4cmvS2+hNgC1HLbOvMtCvxo7lVeui4nhlCnJkmlZF/X2xBUo86Qav5pDwI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=WEVYi3N1; arc=fail smtp.client-ip=52.101.43.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m8DjkR0RPiIrB07D5UkG6aZNb4+u6pK+fmjWl123RgkLQOqXMrkaotNEB+npzfxRkZkN7e6UD5r5EOUcuF/qMhDljUsR3GvKe6w37PNq/5a/Ck589okmTc+eiuEIZc4x19f12c6OxTgm4gwJflpt27JWWsSroF7/I0xDgFwlie9P6wH4GBHzt0fEYLOQBRDxl8xwA3hXVOl7pmSv63Ds/4vkyN+fDuYJJ8AjR5c04aoguYtosUblS2lUzgrtPs2QnoY4b8AOqlILS+6+udwBxHYQ2HS/Cx8N+kdU3CyD23EuvSqOk8OB7mDxHYdBVCyrys5KW+xCo9DH9NoD6H7gUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q4hwFM9cExeHacTR9ySfp7gjhMoIL8TjEfuaim5pNPk=;
 b=WM49sh+YxhbQa/202u+42UG9F8rSgMnuyCaMnQQGJMAsZbFoyGH77w0BCDBFoNIrg+070aBad5CalMgTE1+0JGLD1fPjxpDXL2HKELyVvnJvjoDvFFR9Qovq/O9xjSdNtf+/0Fx4snTA+6wm6OWA32KicBoNubtSKuXQoxKWZQDROyW3JTXNgoBvGaRZgb+roLIZUMZRCvTDXL0ggtQYXRhn/ZLIsMb0UPED8tA31wiBjNVMSRW8tIaiCrtnqFtZ5UcPCujioIiqj4xW4+OfgNs0gqP3e/qRL3VAQN7YDFocu0+3uTUC9meexU34az/xlethyQUvVO4x6ybOlQK7pA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q4hwFM9cExeHacTR9ySfp7gjhMoIL8TjEfuaim5pNPk=;
 b=WEVYi3N1W2r8re05be5mXkGbs3WmAhShCj9UgIWwML9FtGr9v76Qh/pYe8XhE4S4u6kBV8nSYsLgAOauIUTU3LcE2jmbHR8RtictMBuN3n21OnPwm9kCwtbNXn8XcW1Tkl3Px0A/FcbJhhRUYnDPqkYpFCrvPaPSJ37hf/0dkRk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from IA1PR12MB8495.namprd12.prod.outlook.com (2603:10b6:208:44d::9)
 by MW4PR12MB5627.namprd12.prod.outlook.com (2603:10b6:303:16a::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.11; Tue, 26 May
 2026 03:28:36 +0000
Received: from IA1PR12MB8495.namprd12.prod.outlook.com
 ([fe80::bfce:c745:c822:204f]) by IA1PR12MB8495.namprd12.prod.outlook.com
 ([fe80::bfce:c745:c822:204f%5]) with mapi id 15.21.0048.019; Tue, 26 May 2026
 03:28:35 +0000
Message-ID: <bdd27e91-2182-4c85-8c68-1156f323b5af@amd.com>
Date: Mon, 25 May 2026 21:28:30 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/4] drm/colorop: make lut(1/3)d_interpolation mutable
To: Melissa Wen <mwen@igalia.com>, airlied@gmail.com,
 alexander.deucher@amd.com, christian.koenig@amd.com, harry.wentland@amd.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, simona@ffwll.ch,
 siqueira@igalia.com, sunpeng.li@amd.com, tzimmermann@suse.de
Cc: Simon Ser <contact@emersion.fr>, Uma Shankar <uma.shankar@intel.com>,
 Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>,
 Xaver Hugl <xaver.hugl@kde.org>,
 Pekka Paalanen <pekka.paalanen@collabora.com>,
 Louis Chauvet <louis.chauvet@bootlin.com>,
 Matthew Schwartz <matthew.schwartz@linux.dev>,
 amd-gfx@lists.freedesktop.org, kernel-dev@igalia.com,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20260525100524.304263-1-mwen@igalia.com>
 <20260525100524.304263-3-mwen@igalia.com>
Content-Language: en-US
From: Alex Hung <alex.hung@amd.com>
In-Reply-To: <20260525100524.304263-3-mwen@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW3PR06CA0002.namprd06.prod.outlook.com
 (2603:10b6:303:2a::7) To IA1PR12MB8495.namprd12.prod.outlook.com
 (2603:10b6:208:44d::9)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR12MB8495:EE_|MW4PR12MB5627:EE_
X-MS-Office365-Filtering-Correlation-Id: 7edcdd69-0589-476b-54e5-08debad6de55
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|7416014|921020|18002099003|56012099003|22082099003|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info:
	ff5mPCy5XjmfXhQPxrmrTs5OtFMLG8pESJB44offVMCCfB2ALQR/UBg4jihpgDe4Antmkov6HyqReBEs1WgVQykvuLMBdUlnO5yPYaJwgo2vU44OI+zzHjAmC/ii5Qa2zARYj1j9PkSWmR2dx3m2O1LKm8kcxnRlHD2Wqfsws4tH7qfcQIQYzxWCMuSYZOSr6hVjDK/yMvqdfND/DTNcdgC1mV61/yfo7dfgNwUi3BCyAlWWJS7AwYjx4cnQzv8BYZe6BMBAoKGkDEv1ICqqU9K6DDnKLzU0W8ZYfaV7/2KTrhn2T4H4OwwywKZL3MCLg3PEfwOSRii4qYDbWBPDcJTFwrmAJb4MWf303d0qqHPUXGuLKlVl4RN5GQUArAanofnnONgQ5LR0YJPnAYsMJywFbG756+q15o+q+dyFDvLhAeDgSDJ8rLnKhem0RFWHij5CFF+c4L5ARC2KntmBdR74tmQOLvbagyU7w0ldWMrpRDKwKoWUu0B4sBvk+cl2XQLGfAhzNMj+p5QvZuRSkBJgtChs0uYSBtYHPw+mpmiTeynZXfEcB+NvE067AtYmIGGrrnU3NrH2K9+4u0N3I3O/qLCund16UbyTtHwRW4aggit93OcaqCTkzvvIcUqdSaz8gcTgyzzpN7ubaXK+ahAG9fLBaBC+T+IpY8pYRE3vnR1XWLwv9l9mFhHWOSeXx/oqwMoKq6dqfvdilKxfn/6SOMn2xcUIReZh2MAK060=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR12MB8495.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(921020)(18002099003)(56012099003)(22082099003)(11063799006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QTFUTC91MW4xaGxheFhLSHp5YXRnVTJuTW40TGRMeWJuVTlLQ2ZsTGJ0QkFv?=
 =?utf-8?B?alVKWEtqelM1MS9hQnpma0lST3A4Wk85enBYMlBweStNUlFrR3ZnMGExRERa?=
 =?utf-8?B?d3NVK2JNN1NMQnBaMXkxMjlEdDR2ZVZnOXpTMzZ0MFlIUkZSNzZ0aU10OUxP?=
 =?utf-8?B?Q3pXbDBUV1puL084VTdFSWpTLzZ3b3lpOWMyM2lLekVDM3dpMC9wZHZYUkI4?=
 =?utf-8?B?cnQreEhsc2NsamNrMG9iOHBrZGs0Si9Sb1Q0SUVrUUNqRUZJbm5zbVhSS2ZC?=
 =?utf-8?B?SEhkL2RyS2p5Wmp2b3E1K3dGZGRlR0NxT3k5bDZxSHlvSFpQaUVtWFJIMnAv?=
 =?utf-8?B?dXBDYjlQdTVSL01XYVVMN3lBUjFuUzRYQjcvRDJla1BCVDhmNmVUS1pLaWJZ?=
 =?utf-8?B?V1FMNUtGY1VNZFBhN3ZHVnRabXI3a2o4dEVCV0RHakVvUDBRdHFMUTZSS1R5?=
 =?utf-8?B?dll1ME1aMmFVc3l5TDVvT0RnZGhTZkFWL09Na0VqZEc3WGpBUjBUblVoQXMz?=
 =?utf-8?B?azQrek1SZ3RHRmdYdTVMREozZ25pKzJ5bUJ4Q3BiRXQ0K3FiQTN0dVFhc3c1?=
 =?utf-8?B?TDN5VzVJTzUyOUVkMFlvV1VCMDMvZ0FEYW1xRzZSdzR4eml1dFMwZ1NFRENi?=
 =?utf-8?B?ckNlZk1iVy9ibk1HMXhtempUdXFQQ284OTA4Z3QyeWhtQ0NqT0FWVThTS2o2?=
 =?utf-8?B?anVWbUJmN1NIekZoZEUydmt4YnkzWjd5TmMyZWlnRDIvaHJLTVVsUHo2UzFW?=
 =?utf-8?B?bk1yRUM5TGFuOVBaV0RFYkNIVU16dENubUd5VnNOb0F3RHZHblVEQ3FKS1Nm?=
 =?utf-8?B?ZVNIUVFsUlVNVitSUnJUQVFoM2xOeDhyVk40YnJpdVlja0h0dGdpZVFBQ2Rq?=
 =?utf-8?B?SktQSFVUNkJuZ0QwbnM1TUZrVFFGRFVxNElYU0JYOUJ3bWJsVmZoaEdrTTdr?=
 =?utf-8?B?Q01wRHBjMGpqejQxeGQ3R2M1QXlCSVlCUmlkWDI3ZWFoclg5WkdJNTdXdVJI?=
 =?utf-8?B?MldMMjFpTXNaV1BHMHZFTVVONDgxNS9SUTBGTkFjWGRtbXhqMUZ2QmkvaDBO?=
 =?utf-8?B?b2NwTWVKdDUvR3pKTy8zTHZKeUhqcFNQUmFaYXhKK1k3RUxrcSthbFVtQ0lJ?=
 =?utf-8?B?MlVNS2ZYSlNOdXQrbzNOdUNYbkdaVmQwN0dtZW1zb1cwMk1HL3VqKy9DQ3ha?=
 =?utf-8?B?SS9iUUIxQ2tWR3BMYjlIVUphTzNITTM3b3cwNjgwanNTZGRQMURiU09pby9R?=
 =?utf-8?B?Y3JJQW96akhYVFVIZ3o0MFFDcHhWUUttWE1JWFMvMWg0REFqQ09HckRZZisz?=
 =?utf-8?B?OXFzMnQ2clJ1djU1Z1kwa0h0ak9jZ3dRVGZtTCtYZ1RlT1VHdjRJV3habndC?=
 =?utf-8?B?anZiZHhRLzRqd0VwWERqandBNWJtUUo1cVNzZlpGNk81NEtzdEhacUZZUjI3?=
 =?utf-8?B?RWp3bTlTNEZOVy93UTFMU2dCNHRmOVFGVC91aDJ5K2trSnN0Yis3R0dUT3NL?=
 =?utf-8?B?b25QdFlqSzR6a3BlZUdVNWlhcnpGR3VrajcwTkFnZGl5QlRlZHE5bmVUQ3JV?=
 =?utf-8?B?ZTh2SFVteEJ6N2VJNUMxYU1DQ05pb1JFVWtDWVJqV2tVYXVBTExYTjB4TUkr?=
 =?utf-8?B?SElZOWxyUEJJQ3ZKeHFFcWMwQWtHbUllcFBMVXV2Ymx5eThlQksvOFBvTU9Q?=
 =?utf-8?B?dXZHcGNtV3F6RmhaQ3pxbnR4akNzL0ZJOVpPNVdTM1p6TUx3MFZ1TnNhK2xj?=
 =?utf-8?B?QStYTTZCV2ZuK1pKNVgwRWVQTFZkM1YzczBIN2xnWXpNZC9yWmdDbmwwdEQx?=
 =?utf-8?B?TXdUSmNHUjRqYWN4Wk9mVU9oZENXWnFNdTdJSytjYTdKY2ZOT0hNSkhNMjRi?=
 =?utf-8?B?V3ppRE1ZYlFwVU9kNzdMMElqOUN2NDhiV1JQUGdYcU9ZRzJTSkxxL2svd3Vo?=
 =?utf-8?B?QkxpL2RtTWpFOE9jeDFMTnpuZEdJZ1h5SVUycHkwRXVZdng3bVp1aVRLNEdW?=
 =?utf-8?B?SU1xeGhDOStGUVo2c1FmUGJsZVJyUWo3NUJrUnVZbDRpdzIyNEw1NExVOWhW?=
 =?utf-8?B?djMyVUNIbE9GTndzeHU1K1FoVXlvSTMyd3pjdzBpVWM4UFFNZE1xQXNraklE?=
 =?utf-8?B?ekZjRjVlWnVDUHpXMGsxelp3azlvWDRiZUQ3TnhkcGVXZUxwMFhPTjFnZWY3?=
 =?utf-8?B?dnE4WlVxbXNJVXZVOFZEVnZqNFhJRVZUNVQ4c2lVaDFXdE1MZ2orL2pjcjFh?=
 =?utf-8?B?K0lmOVpqNldSMVo1cnlrbmdoMUplZXFTb1Z6eEVmeUxTeUhnTUZZa0srdFBa?=
 =?utf-8?B?ZEEvTWxQWWNXWjZIRlRralRGSld4TmJiSUNFRkxqcndvSE50amp4Zz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7edcdd69-0589-476b-54e5-08debad6de55
X-MS-Exchange-CrossTenant-AuthSource: IA1PR12MB8495.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2026 03:28:35.1907
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6n/qmaCox1NjU+zEKfjf9CIyl5oIl+zlpi9yBzJyrrt6zeymXua6uKF5BBx1OzSQMDa0c08P7ivy68xTRcbZ0A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB5627
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-109699-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[igalia.com,gmail.com,amd.com,linux.intel.com,kernel.org,ffwll.ch,suse.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[emersion.fr,intel.com,kde.org,collabora.com,bootlin.com,linux.dev,lists.freedesktop.org,igalia.com,oss.qualcomm.com,kernel.org,gmail.com,poorly.run,somainline.org,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[31];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,amd.com:email,amd.com:mid,amd.com:dkim]
X-Rspamd-Queue-Id: 99B0F5D0534
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Reviewed-by: Alex Hung <alex.hung@amd.com>

On 5/25/26 03:49, Melissa Wen wrote:
> As it's not immutable anymore, any changes should be handled by
> drm_colorop_state. Move their enum and make it correctly behaves as
> mutable.
> 
> Reviewed-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
> Signed-off-by: Melissa Wen <mwen@igalia.com>
> ---
>   drivers/gpu/drm/drm_atomic.c      |  4 ++--
>   drivers/gpu/drm/drm_atomic_uapi.c |  8 ++++----
>   drivers/gpu/drm/drm_colorop.c     | 16 ++++++++++++++--
>   include/drm/drm_colorop.h         | 28 ++++++++++++++--------------
>   4 files changed, 34 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
> index 170de30c28ae..080aec5a9774 100644
> --- a/drivers/gpu/drm/drm_atomic.c
> +++ b/drivers/gpu/drm/drm_atomic.c
> @@ -830,7 +830,7 @@ static void drm_atomic_colorop_print_state(struct drm_printer *p,
>   	case DRM_COLOROP_1D_LUT:
>   		drm_printf_indent(p, 1, "size=%d\n", colorop->size);
>   		drm_printf_indent(p, 1, "interpolation=%s\n",
> -				  drm_get_colorop_lut1d_interpolation_name(colorop->lut1d_interpolation));
> +				  drm_get_colorop_lut1d_interpolation_name(state->lut1d_interpolation));
>   		drm_printf_indent(p, 1, "data blob id=%d\n", state->data ? state->data->base.id : 0);
>   		break;
>   	case DRM_COLOROP_CTM_3X4:
> @@ -842,7 +842,7 @@ static void drm_atomic_colorop_print_state(struct drm_printer *p,
>   	case DRM_COLOROP_3D_LUT:
>   		drm_printf_indent(p, 1, "size=%d\n", colorop->size);
>   		drm_printf_indent(p, 1, "interpolation=%s\n",
> -				  drm_get_colorop_lut3d_interpolation_name(colorop->lut3d_interpolation));
> +				  drm_get_colorop_lut3d_interpolation_name(state->lut3d_interpolation));
>   		drm_printf_indent(p, 1, "data blob id=%d\n", state->data ? state->data->base.id : 0);
>   		break;
>   	default:
> diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
> index 6441b55cc274..78423905051e 100644
> --- a/drivers/gpu/drm/drm_atomic_uapi.c
> +++ b/drivers/gpu/drm/drm_atomic_uapi.c
> @@ -751,13 +751,13 @@ static int drm_atomic_colorop_set_property(struct drm_colorop *colorop,
>   	if (property == colorop->bypass_property) {
>   		state->bypass = val;
>   	} else if (property == colorop->lut1d_interpolation_property) {
> -		colorop->lut1d_interpolation = val;
> +		state->lut1d_interpolation = val;
>   	} else if (property == colorop->curve_1d_type_property) {
>   		state->curve_1d_type = val;
>   	} else if (property == colorop->multiplier_property) {
>   		state->multiplier = val;
>   	} else if (property == colorop->lut3d_interpolation_property) {
> -		colorop->lut3d_interpolation = val;
> +		state->lut3d_interpolation = val;
>   	} else if (property == colorop->data_property) {
>   		return drm_atomic_color_set_data_property(colorop, state,
>   							  property, val);
> @@ -782,7 +782,7 @@ drm_atomic_colorop_get_property(struct drm_colorop *colorop,
>   	else if (property == colorop->bypass_property)
>   		*val = state->bypass;
>   	else if (property == colorop->lut1d_interpolation_property)
> -		*val = colorop->lut1d_interpolation;
> +		*val = state->lut1d_interpolation;
>   	else if (property == colorop->curve_1d_type_property)
>   		*val = state->curve_1d_type;
>   	else if (property == colorop->multiplier_property)
> @@ -790,7 +790,7 @@ drm_atomic_colorop_get_property(struct drm_colorop *colorop,
>   	else if (property == colorop->size_property)
>   		*val = colorop->size;
>   	else if (property == colorop->lut3d_interpolation_property)
> -		*val = colorop->lut3d_interpolation;
> +		*val = state->lut3d_interpolation;
>   	else if (property == colorop->data_property)
>   		*val = (state->data) ? state->data->base.id : 0;
>   	else
> diff --git a/drivers/gpu/drm/drm_colorop.c b/drivers/gpu/drm/drm_colorop.c
> index 764d12060666..65fec53f70fa 100644
> --- a/drivers/gpu/drm/drm_colorop.c
> +++ b/drivers/gpu/drm/drm_colorop.c
> @@ -342,7 +342,6 @@ int drm_plane_colorop_curve_1d_lut_init(struct drm_device *dev, struct drm_color
>   
>   	colorop->lut1d_interpolation_property = prop;
>   	drm_object_attach_property(&colorop->base, prop, interpolation);
> -	colorop->lut1d_interpolation = interpolation;
>   
>   	/* data */
>   	ret = drm_colorop_create_data_prop(dev, colorop);
> @@ -442,7 +441,6 @@ int drm_plane_colorop_3dlut_init(struct drm_device *dev, struct drm_colorop *col
>   
>   	colorop->lut3d_interpolation_property = prop;
>   	drm_object_attach_property(&colorop->base, prop, interpolation);
> -	colorop->lut3d_interpolation = interpolation;
>   
>   	/* data */
>   	ret = drm_colorop_create_data_prop(dev, colorop);
> @@ -521,6 +519,20 @@ static void __drm_colorop_state_reset(struct drm_colorop_state *colorop_state,
>   							   &val))
>   			colorop_state->curve_1d_type = val;
>   	}
> +
> +	if (colorop->lut1d_interpolation_property) {
> +		if (!drm_object_property_get_default_value(&colorop->base,
> +							   colorop->lut1d_interpolation_property,
> +							   &val))
> +			colorop_state->lut1d_interpolation = val;
> +	}
> +
> +	if (colorop->lut3d_interpolation_property) {
> +		if (!drm_object_property_get_default_value(&colorop->base,
> +							   colorop->lut3d_interpolation_property,
> +							   &val))
> +			colorop_state->lut3d_interpolation = val;
> +	}
>   }
>   
>   /**
> diff --git a/include/drm/drm_colorop.h b/include/drm/drm_colorop.h
> index 53a2148082d5..d08a6a8a8392 100644
> --- a/include/drm/drm_colorop.h
> +++ b/include/drm/drm_colorop.h
> @@ -183,6 +183,20 @@ struct drm_colorop_state {
>   	 */
>   	struct drm_property_blob *data;
>   
> +	/**
> +	 * @lut1d_interpolation:
> +	 *
> +	 * Interpolation for DRM_COLOROP_1D_LUT
> +	 */
> +	enum drm_colorop_lut1d_interpolation_type lut1d_interpolation;
> +
> +	/**
> +	 * @lut3d_interpolation:
> +	 *
> +	 * Interpolation for DRM_COLOROP_3D_LUT
> +	 */
> +	enum drm_colorop_lut3d_interpolation_type lut3d_interpolation;
> +
>   	/** @state: backpointer to global drm_atomic_commit */
>   	struct drm_atomic_commit *state;
>   };
> @@ -306,20 +320,6 @@ struct drm_colorop {
>   	 */
>   	uint32_t size;
>   
> -	/**
> -	 * @lut1d_interpolation:
> -	 *
> -	 * Interpolation for DRM_COLOROP_1D_LUT
> -	 */
> -	enum drm_colorop_lut1d_interpolation_type lut1d_interpolation;
> -
> -	/**
> -	 * @lut3d_interpolation:
> -	 *
> -	 * Interpolation for DRM_COLOROP_3D_LUT
> -	 */
> -	enum drm_colorop_lut3d_interpolation_type lut3d_interpolation;
> -
>   	/**
>   	 * @lut1d_interpolation_property:
>   	 *


