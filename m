Return-Path: <linux-arm-msm+bounces-100033-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YLKACH/JxGkL3wQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100033-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 06:51:59 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 76C7F32F810
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 06:51:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 17EC5300DE1D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 05:51:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DC103ACA42;
	Thu, 26 Mar 2026 05:51:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T+WIPRxd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 652D23AC0F2
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2026 05:51:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774504316; cv=fail; b=fP4RaihXUKba/+FnzYPiYCsEy6wIqpsCKYMSy4DQP98TbDNkhuP4yabACYmm4zasyhTtG84M55YMW3i7PlMEsy08Ow+sJ8E8YyWHd3f2PIkbq1RKaQCxNsN+qUHuBIuKQp4Aclr5z1jYm2d03Mf+1FSXzWhr9T2Gl2YumAUthcU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774504316; c=relaxed/simple;
	bh=elkcOSlY7KYeLU2UX4Gc56blCttq9Nl7F/mufVaE+/4=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=GmyHdT/pOYmqYhCfidh9Ek12kBROUl4n9jcEn3xN2RERvaYRsxTkLVNuyrOXaHqlYXaK5zkcuwfG9FDADZZDSYiMHivPHxI8uupS7moYC5FQ4FszfnwfW2UkbzdKCKFLojnnhnTVOcS9b9C9SG5f9X1C7OR5cI40kjJCLggxPEU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T+WIPRxd; arc=fail smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774504314; x=1806040314;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=elkcOSlY7KYeLU2UX4Gc56blCttq9Nl7F/mufVaE+/4=;
  b=T+WIPRxdMr0H3bZ8wDQRfA21I/ro/6EupRqUKlaSTV4/+qkz34y1YghB
   AgE4VB9mJAv5KB5JSsydPjXyESxO1MRJreVRPzk4ceSZRdPlSsoyiVVSO
   1ZB0/FYymODqP7Kf4OrXgPgzeY1ei+LiY2wbDqf79HLLKqjiDZUlrtRqx
   +oB3KzX7Ne4lZNSz+lMJ4bcEmdwGTwjm+yLfCQlXOaZzBHX7jD29EpzCd
   BG4ZtyGTQQa0++oYcgnk2MNA/c74LQprZNaATAAWIGsVG1klSNwqi2i31
   wr2MtWkrFwFW2xpgn4XK3+U/eVS1y/iNkkQsqEe+JyxapJ/M4+Hyi4OH0
   Q==;
X-CSE-ConnectionGUID: zV6g/Y2gSxKdJ/avauTa2g==
X-CSE-MsgGUID: IDVvHSErQJ6JhaoRyJC0sQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="93133123"
X-IronPort-AV: E=Sophos;i="6.23,141,1770624000"; 
   d="scan'208";a="93133123"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2026 22:51:53 -0700
X-CSE-ConnectionGUID: W5fLoAElSSikGPoq1w/5FQ==
X-CSE-MsgGUID: U4re5yk3Ss2Mi+ZciUiGpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,141,1770624000"; 
   d="scan'208";a="225155427"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2026 22:51:52 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 25 Mar 2026 22:51:51 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 25 Mar 2026 22:51:51 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.11) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 25 Mar 2026 22:51:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IVGGmvmLT9n9BYnHxhgB4TmAbXS3DzWte1K3Zn4+zt03lp3iQ7WLJmh9jp6f/53Z8psXXDFt9n7VSlt44/PUTEJc9d+szHKKAQtDQFpuWhWXqVFdQz8ZTllfLqoJx3o9COELhmdVOn0KoL5z2Hp2yxdup6Ne619ScqbwgwcvCxNlsTr0bZIpui4eV77YItBhwZYaFYLaZ8y7EKbfZFNf5RmQlsVKq4oRKpULIq78SSUJxXgCa2cXbqWH1J6XmI0+hYimMbTPVQ4RP8U8ClKRFPqM3lo8AWZAKchMAqJ6udllQjO6ku04EHuMHUSZG2i6gZY9/tA0ee+SeaooDdAeSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WJDBXPmHAKpfx4pd/SJU9KK5+fJu3pCIzrDCiak13Q0=;
 b=FZhUIR3l59fS0suxMGH/UIXYDwJKrGXJ5gD4mfAM/4b9nVNP3rTVvokBxdZGc4wc/xhhvYpHU/H7rxFsQTNBIc2t/XFIP1Z3JRmhKYNMvDcz1gXC7flBomFjv3xYEhhpRvD2pgP6jACgnCQ5oAY5tHHses3j4Fgf/kL5GvI6/M3pYCgHukVAhxxIdcQI16TpekPBIrOJot1+Zz45ZWErbjrp/g3c2v+CMyuMvlW3rYEj8aQaWrETZcYoN+EhCwp2A2Cn/kxObovl6lRQosN+1wMPjGY+QUL1ZY1FkuAsYvHVgP9YQDmztndrRh2hxQRv8V2b7dapywTQxiuPW0AnFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com (2603:10b6:a03:488::12)
 by DM4PR11MB6478.namprd11.prod.outlook.com (2603:10b6:8:89::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Thu, 26 Mar
 2026 05:51:43 +0000
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::45f:5907:efdb:cb5b]) by SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::45f:5907:efdb:cb5b%3]) with mapi id 15.20.9745.019; Thu, 26 Mar 2026
 05:51:43 +0000
Message-ID: <dbb27ec4-cdc6-4ead-9daf-664d97e86cd0@intel.com>
Date: Thu, 26 Mar 2026 11:21:32 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] drm/atomic: track individual colorop updates
To: Alex Hung <alex.hung@amd.com>, Melissa Wen <mwen@igalia.com>,
	<airlied@gmail.com>, <alexander.deucher@amd.com>, <christian.koenig@amd.com>,
	<harry.wentland@amd.com>, <maarten.lankhorst@linux.intel.com>,
	<mripard@kernel.org>, <simona@ffwll.ch>, <siqueira@igalia.com>,
	<sunpeng.li@amd.com>, <tzimmermann@suse.de>
CC: Simon Ser <contact@emersion.fr>, Uma Shankar <uma.shankar@intel.com>,
	Xaver Hugl <xaver.hugl@kde.org>, <amd-gfx@lists.freedesktop.org>,
	<kernel-dev@igalia.com>, Rob Clark <robin.clark@oss.qualcomm.com>, "Dmitry
 Baryshkov" <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, "Marijn
 Suijten" <marijn.suijten@somainline.org>, <linux-arm-msm@vger.kernel.org>,
	<dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>
References: <20260323131942.494217-1-mwen@igalia.com>
 <20260323131942.494217-2-mwen@igalia.com>
 <feea29b7-fb28-4ac1-be74-b42c52173c59@intel.com>
 <197d2909-8644-4380-b752-ffef6f300faa@igalia.com>
 <70d47573-a0cb-4f65-8838-1956f8a672fa@amd.com>
Content-Language: en-GB
From: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
In-Reply-To: <70d47573-a0cb-4f65-8838-1956f8a672fa@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0134.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1d5::11) To SJ1PR11MB6129.namprd11.prod.outlook.com
 (2603:10b6:a03:488::12)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PR11MB6129:EE_|DM4PR11MB6478:EE_
X-MS-Office365-Filtering-Correlation-Id: a11fbae3-d13b-4438-e984-08de8afbc218
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014|921020|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: mXr0dCyZAAnTdzczJtHYGkSE6X0Vo+UYK8iWD4sk1J9JuYIwmYNbJxKW55h+/+OpRJ1wrF78IuiePHyTKyQnHa1rw2QvUNkrWA1uoLHfJjvUf2n0f1FJgIpcxOrLRzk0//R1Rge6hT66DrM9ch3bMyLawnqu6H72A5y6xFVJlDmn1UcdC7qk+mDHK62GqqDggCTk2Y5cDRwRrpoLiVO2TXqjl74Kf5JzfztkBhcW5H5UJXAfq1wZsWNOOBsKFMpH5zfxsuDQUdp/UNnIykzWkO8CGJU/TRYQcWkZym75XPdYAumOaTtr4WEnTletyxTBQm0yK9fHp/IcqNgZ46iKiciQkYvbu0jlPA7jcmmfXCcAxpFOz8GVbZmIr/t5oYv5KnaxY+7d7AIBFWIqyjVjTt7U3teUTJrfHj1RU+FtoOpwgfjM++HdDoaEE0obDnWAz9/Bqf/np0eEenQaNYUUE2E7BXH1O+76OmKIReeMgtm18jSc4NlMb+Fn0xSc5QAfdkizFLjNmrqPYK4gm0qBQ0mECR08jck7OJZtzUUJjPb1TVIumtKGHF0QsQiPcNvc+9fBGeeLIXnSBjpNq2h/s2WMNCuHE3ujWb81mgVKobLx5UY2n4tS5l6NwnV8mAgmRSZMcg0oux23QnP1uBPSJtpsQXjEnpJXYvc7/P3hZ9whwKcJsX6SWtwQ/fMe+etDt9SDNMF6cde4sd/G74W+4lMFyXTKkfM7HAsfoSksPuYCeu1hxplN+a1yBXw8IxFhyPq/m7j9dpoLIEXMPkwC0w==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ1PR11MB6129.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(921020)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z2dtZUUvek5WajF1dU1uWVhTdm1qdXdLRVVCb0I4bzYzSWZJUnI0dkJGYW1G?=
 =?utf-8?B?WW1YVW4zTjEzMFpKT2dwRm9sZzExRnkzZnFIZXB3RTdWYnpDYWNHNWtCbTRv?=
 =?utf-8?B?NGJGcTFWbXZGUitpOHQyU2w2TDJEMmFxUmxRek8vbU52WDFLTnNHcGtRU3J0?=
 =?utf-8?B?MXlmSHh3amErMkkvR0dxbGpKTTRzU1V5Wk1mTStrSEo0YWdYVFZNd1M1Qkc3?=
 =?utf-8?B?MlhZTEErbk40d2lqNVErb2wzU0NYNmYxOFlqcHE4UG1tOWowY2FHRiswd0F1?=
 =?utf-8?B?UnRrQUhKVFkwdGlFSFpIYnRaZlFyTFUwS1JkYVVCRG5HWXRJV1RyUFVLZzVF?=
 =?utf-8?B?NTg1NU1yRVNxait5TUFzSVhPMUU0M0Y3S1lUMkYzTHpLdjR0cEJjRlhQRTUw?=
 =?utf-8?B?QTVhWWROajlNME10VVd3MFY3RWpxRDdEdEIxY285eHUxSjBJQ3h3cWpOVjIy?=
 =?utf-8?B?Ujd4c0wxN0d4TVIvSy9aT0RjQVJxWXZ6RndJWWxqRUJnbUYvSEZiRTcyU0NY?=
 =?utf-8?B?OVlrRFIxV29TRmtyaFBPNzlvK2ZnQ3lIemZrdWFVV2tqc3dRd1Vha2hRMlgr?=
 =?utf-8?B?SmoySXdUV1I3TGoyNHFUTzRsRmcvempuc1Q0WDBwdmowbDMvbTl5WjVGR1Zt?=
 =?utf-8?B?YWt2TFExcG9NUDAxYndBY25Ca2FKSUFaeGJ1eXFQaW9ldTYyUTcydXo3bVRl?=
 =?utf-8?B?Sk43NzQ0cU55SGRSeFpzTzdHRnRCV0ZyY1pWNjI0RUtnN1FvY3hXNXhZYkkz?=
 =?utf-8?B?VE5LNnorK0RJbTU5RmtSdEVCTUtpWG4xcFFqWi9aUWVoRDNoSEVDUXZpUzhI?=
 =?utf-8?B?elBCTkxrNjNsdW5jVzFKU2FIQXlXNUt2dTBrc1J0QTBWSnBOQTdtcEZPbTlT?=
 =?utf-8?B?dmFqTlhOclZ6aXRVS25DdlVZaHlkVWtINzNaRFZxK0U2R3VYdEwvcTNtb2Ns?=
 =?utf-8?B?UzJVb3Jmb1g2eURiZStJb3BocU5DaU55Y01tb1JsaGZIQ1VqT3FTaWlIRW54?=
 =?utf-8?B?MXhQc0k5aWFHMFRDVWk1WVBmeVZSeG5XMUl6SHlHbDVJTFBzR1pDN3ZhQThL?=
 =?utf-8?B?QUgwdjN2amVGS0htRUJhb28yc2xObTZ1S3d4ZUxHc3M4eTBnaC9OWDNoVUxK?=
 =?utf-8?B?VS9rU3lKZnI3QU9hSWJwckd1ZmxKdUlpRmYzQVdDQUVUUVlxaHlIMUptR3JO?=
 =?utf-8?B?M3Zadi9odUkvdHk3OGJuTmlSaHdzcFRiQnYxWGt0c2p0R29CdjVFNWc0Wmlq?=
 =?utf-8?B?cjNTb3RpeUVDaWxPcVc4blQyLzBrVys4VEtvUHREWnV2NzUzbTByT0VaNy9u?=
 =?utf-8?B?dTMxL0Eva05jVGVQTW5jNW4vY2dmVVVLMkUrUTQ4a2gwQjU4SjlwWUlQcGFR?=
 =?utf-8?B?REE0V3ZOUSt1MWRObnErbURrOHJkTHJoRm41Qnlsekp5ZUtNMFQ1M3Y2eTdh?=
 =?utf-8?B?TnNGM1pmcURJZ0c3aGlUU1VoUmxQNVcyNU5Ub3prZ21XSzhkbitVem5IZDlS?=
 =?utf-8?B?ZmxHbmhPcG05ZFFJdWh5emw4UjJpWmllbVllK2VKLy95MjEzRVZkSHhTM1Nh?=
 =?utf-8?B?MHNxUEJFOFV3QmdDYTEyZEh0eE1JWHVBYVdXVE5rL0dZdVIwcmppZUtDQXlV?=
 =?utf-8?B?TUZ1eUVLS24vN1hUWXVMYjRQQ0ZrUVdDbUswb09PNC9rem5Xc0lOdWE0bThW?=
 =?utf-8?B?dVhBaG1UbjZ6V2VCelhDSWpDZ2tCcXZkRzlnRjgzVS9SdG1wTGt2ckFwdVdW?=
 =?utf-8?B?ODlBV04wR2RMbEQwZS9nbEVVVjFNeGZlbXFFdWNlUmhranZwN1RHb3czZ0hC?=
 =?utf-8?B?WUFYZ0tJY3Y5K0VvS05uNVI1cEQ0RjdhY0VwK2dVeXhWR1ZUbjlaYjlyQ1BE?=
 =?utf-8?B?bW1SbGNKS2J0MmViRk5Ub1lVQzJWNnhjdkE3bm5LczBpSkdJcGJ2WmVCSDFy?=
 =?utf-8?B?MmJsYkltc2JJMElzRm5XK21aVTJReGoxR0c1QlFqWWFVSjBOQVUwbXVPZ3dZ?=
 =?utf-8?B?UXJ4OHJqZGpVQXdMejAyWmNzc0ptWWlPUDFhWERjanVNTDBPN0ZJWnRFSVhh?=
 =?utf-8?B?SnptY0NsTnFlQksrRmhBaVA5eFZTZ1VjRlpxNE9STGloUCtGU0pJUmRYczFP?=
 =?utf-8?B?MXFWMHRoM1FDMzlYQUVUUkdZVis5QnJrck1qUmUvRmhkQlhmNlJ1enR6Z1Q1?=
 =?utf-8?B?d0EvcWF4QkZwRlgyZjdOeTFVemVuam1BKy8xTW16d3JLTUJMbmt4c3VOeFZT?=
 =?utf-8?B?cUk3ejdMN2x2eTgrcXphajVIVGdOemhIclJkZ3IwZmxTQm5zbzMrSXpkcWFQ?=
 =?utf-8?B?cDUrT01lWjZOaUhWR01XNnY1UHg3b0tKT2FITGVSTFl5SU5jS3BuVms5TFhX?=
 =?utf-8?Q?ibOuX9rwshiJeXtI=3D?=
X-Exchange-RoutingPolicyChecked: lIKSZGjPtfAcGTpmKlkaJmddO1TUkGv8ZCHDm1fFwO3xbvvpwilAJyuB2+cR+uk+UGUzXNUfqWubbbYvnn1taorIvPnL9X2AFHHfgIOhAwJr1ad2ttSeoVN8V1kTSKbJQqUxHRbR1Czu9W6qz9MsD5v4PVj3v8h36mXdoM+L70FSXjrWsGYxGfNTsrrmte3UYiYT+T2XMNirqw3FeHfGLS0tkVL2sT3l5gTfhEb32QFV0IKX1WWWSwZ8Ay4PRZgI2sEJlJlO49JYlkiperd6PrGzWFe4d6WbdU8qfu5axoXGt+F2VAIdNuXxqFgS5lAUEQFVCjdVFv4SAehAaetFqQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: a11fbae3-d13b-4438-e984-08de8afbc218
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6129.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2026 05:51:43.3996
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Aw0fQ2yksXKGCeQUi+pNVAkxLfmmz5INyOyVrC74vuYtwG+/wlSutya9Edi5FakceuY3CBi8g9Vd8iNoc36aN/C1pI/yayltSCcUcGwQkF4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6478
X-OriginatorOrg: intel.com
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-100033-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[amd.com,igalia.com,gmail.com,linux.intel.com,kernel.org,ffwll.ch,suse.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[emersion.fr,intel.com,kde.org,lists.freedesktop.org,igalia.com,oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[26];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,intel.com:mid,amd.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[chaitanya.kumar.borah@intel.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 76C7F32F810
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/26/2026 8:38 AM, Alex Hung wrote:
> 
> 
> On 3/25/26 20:13, Melissa Wen wrote:
>>
>>
>> On 25/03/2026 06:08, Borah, Chaitanya Kumar wrote:
>>> Hi Melissa,
>>>
>>> On 3/23/2026 6:45 PM, Melissa Wen wrote:
>>>> As we do for CRTC color mgmt properties, use color_mgmt_changed flag to
>>>> track any value changes in the color pipeline of a given plane, so that
>>>> drivers can update color blocks as soon as plane color pipeline or
>>>> individual colorop values change.
>>>>
>>>> Reviewed-by: Harry Wentland <harry.wentland@amd.com> #v1
>>>> Signed-off-by: Melissa Wen <mwen@igalia.com>
>>>> ---
>>>>
>>>>   v2: add linux types to provide bool for MSM driver (kernel bot)
>>>> ---
>>>>   drivers/gpu/drm/drm_atomic_uapi.c | 53 +++++++++++++++++++++++ 
>>>> +-------
>>>>   include/drm/drm_atomic_uapi.h     |  4 ++-
>>>>   2 files changed, 45 insertions(+), 12 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/ 
>>>> drm_atomic_uapi.c
>>>> index 87de41fb4459..713fa9e81732 100644
>>>> --- a/drivers/gpu/drm/drm_atomic_uapi.c
>>>> +++ b/drivers/gpu/drm/drm_atomic_uapi.c
>>>> @@ -265,13 +265,19 @@ EXPORT_SYMBOL(drm_atomic_set_fb_for_plane);
>>>>    *
>>>>    * Helper function to select the color pipeline on a plane by setting
>>>>    * it to the first drm_colorop element of the pipeline.
>>>> + *
>>>> + * Return: true if plane color pipeline value changed, false 
>>>> otherwise.
>>>>    */
>>>> -void
>>>> +bool
>>>>   drm_atomic_set_colorop_for_plane(struct drm_plane_state *plane_state,
>>>>                    struct drm_colorop *colorop)
>>>>   {
>>>>       struct drm_plane *plane = plane_state->plane;
>>>>   +    /* Color pipeline didn't change */
>>>> +    if (plane_state->color_pipeline == colorop)
>>>> +        return false;
>>>> +
>>>>       if (colorop)
>>>>           drm_dbg_atomic(plane->dev,
>>>>                      "Set [COLOROP:%d] for [PLANE:%d:%s] state %p\n",
>>>> @@ -283,6 +289,8 @@ drm_atomic_set_colorop_for_plane(struct 
>>>> drm_plane_state *plane_state,
>>>>                      plane->base.id, plane->name, plane_state);
>>>>         plane_state->color_pipeline = colorop;
>>>> +
>>>> +    return true;
>>>>   }
>>>>   EXPORT_SYMBOL(drm_atomic_set_colorop_for_plane);
>>>>   @@ -600,7 +608,7 @@ static int 
>>>> drm_atomic_plane_set_property(struct drm_plane *plane,
>>>>           if (val && !colorop)
>>>>               return -EACCES;
>>>>   -        drm_atomic_set_colorop_for_plane(state, colorop);
>>>> +        state->color_mgmt_changed |= 
>>>> drm_atomic_set_colorop_for_plane(state, colorop);
>>>>       } else if (property == config->prop_fb_damage_clips) {
>>>>           ret = drm_property_replace_blob_from_id(dev,
>>>>                       &state->fb_damage_clips,
>>>> @@ -709,11 +717,11 @@ drm_atomic_plane_get_property(struct drm_plane 
>>>> *plane,
>>>>   static int drm_atomic_color_set_data_property(struct drm_colorop 
>>>> *colorop,
>>>>                             struct drm_colorop_state *state,
>>>>                             struct drm_property *property,
>>>> -                          uint64_t val)
>>>> +                          uint64_t val,
>>>> +                          bool *replaced)
>>>>   {
>>>>       ssize_t elem_size = -1;
>>>>       ssize_t size = -1;
>>>> -    bool replaced = false;
>>>>         switch (colorop->type) {
>>>>       case DRM_COLOROP_1D_LUT:
>>>> @@ -735,28 +743,39 @@ static int 
>>>> drm_atomic_color_set_data_property(struct drm_colorop *colorop,
>>>>                            &state->data,
>>>>                            val,
>>>>                            -1, size, elem_size,
>>>> -                         &replaced);
>>>> +                         replaced);
>>>>   }
>>>>     static int drm_atomic_colorop_set_property(struct drm_colorop 
>>>> *colorop,
>>>>                          struct drm_colorop_state *state,
>>>>                          struct drm_file *file_priv,
>>>>                          struct drm_property *property,
>>>> -                       uint64_t val)
>>>> +                       uint64_t val,
>>>> +                       bool *replaced)
>>>>   {
>>>>       if (property == colorop->bypass_property) {
>>>> -        state->bypass = val;
>>>> +        if (state->bypass != val) {
>>>> +            state->bypass = val;
>>>> +            *replaced = true;
>>>> +        }
>>>>       } else if (property == colorop->lut1d_interpolation_property) {
>>>>           colorop->lut1d_interpolation = val;
>>>>       } else if (property == colorop->curve_1d_type_property) {
>>>> -        state->curve_1d_type = val;
>>>> +        if (state->curve_1d_type != val) {
>>>> +            state->curve_1d_type = val;
>>>> +            *replaced = true;
>>>> +        }
>>>>       } else if (property == colorop->multiplier_property) {
>>>> -        state->multiplier = val;
>>>> +        if (state->multiplier != val) {
>>>> +            state->multiplier = val;
>>>> +            *replaced = true;
>>>> +        }
>>>>       } else if (property == colorop->lut3d_interpolation_property) {
>>>>           colorop->lut3d_interpolation = val;
>>>
>>> I think it would be prudent to add this logic for both the 1dlut and 
>>> 3dlut interpolation properties. Even though they have just one value 
>>> exposed right now, that might change in future.
>>
>> I didn't include interpolations in the color_mgmt_changed logic 
>> because there is a comment in `include/drm/drm_colorop.h` saying that 
>> they are read-only.
>> But thinking better about it, and I think we should not allow 
>> `drm_atomic_colorop_set_property()` calls to change values of these 
>> properties if they are read-only.
>> I didn't track the discussions about what are the plans for these 
>> properties, how the userspace knows they are read-only properties and 
>> shouldn't set any value?
> 
> It has been a while but I don't remember that userspace needs to set 
> this value, so this can be a mistake. Device driver just need to give a 
> supported interpolation that best describes the hardware.
> 
> We can remove setting them in drm_atomic_colorop_set_property if 
> everybody agrees.
> 

In that case, they need to be marked DRM_MODE_PROP_IMMUTABLE at creation.

==
Chaitanya

>>
>>>
>>>>       } else if (property == colorop->data_property) {
>>>>           return drm_atomic_color_set_data_property(colorop, state,
>>>> -                              property, val);
>>>> +                              property, val,
>>>> +                              replaced);
>>>>       } else {
>>>>           drm_dbg_atomic(colorop->dev,
>>>>                      "[COLOROP:%d:%d] unknown property [PROP:%d:%s]\n",
>>>> @@ -1273,6 +1292,8 @@ int drm_atomic_set_property(struct 
>>>> drm_atomic_state *state,
>>>>       case DRM_MODE_OBJECT_COLOROP: {
>>>>           struct drm_colorop *colorop = obj_to_colorop(obj);
>>>>           struct drm_colorop_state *colorop_state;
>>>> +        struct drm_plane_state *plane_state;
>>>> +        bool replaced = false;
>>>>             colorop_state = drm_atomic_get_colorop_state(state, 
>>>> colorop);
>>>>           if (IS_ERR(colorop_state)) {
>>>> @@ -1281,7 +1302,17 @@ int drm_atomic_set_property(struct 
>>>> drm_atomic_state *state,
>>>>           }
>>>>             ret = drm_atomic_colorop_set_property(colorop, 
>>>> colorop_state,
>>>> -                              file_priv, prop, prop_value);
>>>> +                              file_priv, prop, prop_value,
>>>> +                              &replaced);
>>>> +        if (ret || !replaced)
>>>> +            break;
>>>> +
>>>> +        plane_state = drm_atomic_get_plane_state(state, colorop- 
>>>> >plane);
>>>> +        if (IS_ERR(plane_state)) {
>>>> +            ret = PTR_ERR(plane_state);
>>>> +            break;
>>>> +        }
>>>> +        plane_state->color_mgmt_changed = true;
>>>
>>> I am not sure if it was the intention of the uapi design but as I 
>>> understand there are no guardrails for setting a colorop in an 
>>> "inactive" pipeline.
>>>
>>> So, color_mgmt_changed  is set to true even if a colorop from a color 
>>> pipeline that is not currently selected(or set to Bypass) by the 
>>> user- space is changed.
>>> I guess, the driver needs to be intelligent enough to ignore those 
>>> colorop but should we reject it at drm core?
>>>
>>
>> Thanks for pointing it out, makes sense!
>> I agree that drm core should reject changes in inactive pipelines.
>>
>> Melissa
>>
>>
>>> ==
>>> Chaitanya
>>>
>>>>           break;
>>>>       }
>>>>       default:
>>>> diff --git a/include/drm/drm_atomic_uapi.h b/include/drm/ 
>>>> drm_atomic_uapi.h
>>>> index 436315523326..4e7e78f711e2 100644
>>>> --- a/include/drm/drm_atomic_uapi.h
>>>> +++ b/include/drm/drm_atomic_uapi.h
>>>> @@ -29,6 +29,8 @@
>>>>   #ifndef DRM_ATOMIC_UAPI_H_
>>>>   #define DRM_ATOMIC_UAPI_H_
>>>>   +#include <linux/types.h>
>>>> +
>>>>   struct drm_crtc_state;
>>>>   struct drm_display_mode;
>>>>   struct drm_property_blob;
>>>> @@ -50,7 +52,7 @@ drm_atomic_set_crtc_for_plane(struct 
>>>> drm_plane_state *plane_state,
>>>>                     struct drm_crtc *crtc);
>>>>   void drm_atomic_set_fb_for_plane(struct drm_plane_state *plane_state,
>>>>                    struct drm_framebuffer *fb);
>>>> -void drm_atomic_set_colorop_for_plane(struct drm_plane_state 
>>>> *plane_state,
>>>> +bool drm_atomic_set_colorop_for_plane(struct drm_plane_state 
>>>> *plane_state,
>>>>                         struct drm_colorop *colorop);
>>>>   int __must_check
>>>>   drm_atomic_set_crtc_for_connector(struct drm_connector_state 
>>>> *conn_state,
>>>
>>
> 


