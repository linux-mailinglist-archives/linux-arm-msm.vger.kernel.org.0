Return-Path: <linux-arm-msm+bounces-108180-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EigYNFn9Cmop/AQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108180-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 13:51:53 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F095F56BFB7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 13:51:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 88771300BC78
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 11:42:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6AD37372B51;
	Mon, 18 May 2026 11:42:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FYIkWky8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFA9E330D22
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 11:42:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779104541; cv=fail; b=sbcyn+6vNgDt9LiJmpFp5SnUUwVdxBlzeO4l4X5T0EVrbyWCnLkFo6izGoD3Rc1/RTT3Yg8WXy6KohpQUawCroexvR1A5fOI4mGhqGI2zLxqQXag+v1E5wJ1v5ii+XvgVfBJeL9NW8rJtqFKfJ6CK80NRORDu4kbCFCy75a7YOE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779104541; c=relaxed/simple;
	bh=BrlSTYfjgMCA/011OjlMRzjnVyOLuEfy9fAvYEedAog=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=HWEcxpXcOAWf4V7RxMrU28uMlL1WqiIc3dmF5kFG1j5DQbNKnI1+LBwwqrjAIt1uyQDxWa7ivUs61YILEApoi3NZmi7pjTGd/O6oMV5CobvtE+euNZuDBDj6JJxmXQRJpvnCFBipv/TAkJSz9AhLS32d1ipiCi9NnbvSplfHSWM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FYIkWky8; arc=fail smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779104540; x=1810640540;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=BrlSTYfjgMCA/011OjlMRzjnVyOLuEfy9fAvYEedAog=;
  b=FYIkWky8xAcf2cpoPmeC5Yel8HEoRaPoDoBSA7daANiQb8ISM9B8pmD/
   ep2ISKh1E3LK1M2iBquEsHXmZzPGAGIAKdOhNHHByOU4byhhISs323qj3
   4y/49k/RbGdpTlTA7iBlThHfzFcQYvkRebNtGdFmL1ZDVFEKf8TuSuebe
   z1lVka7lflCrR9wBBtFDn+2qQg44ehwj/8+XAVeAtFzMRflPrHfd5PAVK
   4A5g5+YZfwDQAgCx04fJcPioDC3iorVu/Xo+7Wt+4uirnGKPX0lTup/1W
   MKGLWgvZ2a0P0Pj3NAc4OnKwTAdggpsvSWLUOU8BVoJTS4mBlcOUgtA+l
   g==;
X-CSE-ConnectionGUID: 3TM8UPUfQqCiXjMpVls7tw==
X-CSE-MsgGUID: CmkAgd42Rimmn67P0MQPIg==
X-IronPort-AV: E=McAfee;i="6800,10657,11789"; a="83807063"
X-IronPort-AV: E=Sophos;i="6.23,241,1770624000"; 
   d="scan'208";a="83807063"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2026 04:42:19 -0700
X-CSE-ConnectionGUID: dcdClMwbRvuBQCWXgZzCjQ==
X-CSE-MsgGUID: SCeHobM7T22DLe9Ftki7vQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,241,1770624000"; 
   d="scan'208";a="244385613"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2026 04:42:19 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 18 May 2026 04:42:18 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 18 May 2026 04:42:18 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.59) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 18 May 2026 04:42:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cZKkYSEtgURVpwdcEGRziKDR5LbPbPbPPi/awxY7xlbcjB9Ay8rhOVe0CjmB1qN1+5iUsqCBDcC3cSPuL4vUHYi7ICu7zSqeRDeBiE/ThjqzGdw8H2eoAj3yCT9e0KG3kgXWve/idAst8eYcKjm4+Mnjj+xV3VLhSyWqm3xea1DbnthIss1HUCBPsFNsnqBWfR9t3hsCm6wtLmhvWWUPCZM3uEL74t5JwD5saK7qBIrgMz4cMnki9DeCL72KkpItukvxoM12SaVBVjbx/0fBY66Tb0aqfwxeahQIDF4hgPzibVa3gSAf7Trb6Yt2ukZ19mxES0gtenMmhxFTY2+GmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NFGItQi5sol9tiXCN4K9hj9iRgf854JOf6VEKFVyhBA=;
 b=LQlHtnh4/cOGiELJk8UxG2OB/9KP3oRbNnu/Cte0fjv9T13pDBDqo3D7Aamlk2tLnTARD36aacBKuHwElzw7ZK3n8IFoPplCJ/08lwjM3UwG0xdPnJdkGOJWXbM2PT6BQQMzf+kkmYhGjNGliezIDp/jde6wpIgIFEvmh7WVeU2HECo12W/biXmlfPYZ9qBxTEDPzRi7uUrbN5tSsyMGfJV341yqaIvXrxpnf8JlIff7GkcFuhyV496uNzVP+XRQdKn/gx30YgoKMmD9kwppDL2ABvOaLA2Di9d3/oZmkC1/y2jW1s9TfrJ9/qFl0s7OIebsyrPl2/NaqR+vr/BbNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com (2603:10b6:a03:488::12)
 by DM4PR11MB6214.namprd11.prod.outlook.com (2603:10b6:8:ac::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.25.24; Mon, 18 May 2026 11:42:14 +0000
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::45f:5907:efdb:cb5b]) by SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::45f:5907:efdb:cb5b%3]) with mapi id 15.21.0025.023; Mon, 18 May 2026
 11:42:13 +0000
Message-ID: <9fca1948-d30d-4c7d-8e8b-a0cb8c5b3ce6@intel.com>
Date: Mon, 18 May 2026 17:12:00 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/6] drm/atomic: only add colorop state from active
 color pipeline
Content-Language: en-GB
To: Melissa Wen <mwen@igalia.com>, <airlied@gmail.com>,
	<alexander.deucher@amd.com>, <christian.koenig@amd.com>,
	<harry.wentland@amd.com>, <maarten.lankhorst@linux.intel.com>,
	<mripard@kernel.org>, <simona@ffwll.ch>, <siqueira@igalia.com>,
	<sunpeng.li@amd.com>, <tzimmermann@suse.de>
CC: Alex Hung <alex.hung@amd.com>, Simon Ser <contact@emersion.fr>, "Uma
 Shankar" <uma.shankar@intel.com>, Xaver Hugl <xaver.hugl@kde.org>, "Pekka
 Paalanen" <pekka.paalanen@collabora.com>, Louis Chauvet
	<louis.chauvet@bootlin.com>, Matthew Schwartz <matthew.schwartz@linux.dev>,
	<amd-gfx@lists.freedesktop.org>, <kernel-dev@igalia.com>, Rob Clark
	<robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, "Abhinav
 Kumar" <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>,
	"Sean Paul" <sean@poorly.run>, Marijn Suijten
	<marijn.suijten@somainline.org>, <linux-arm-msm@vger.kernel.org>,
	<freedreno@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
References: <20260506192633.16066-1-mwen@igalia.com>
 <20260506192633.16066-2-mwen@igalia.com>
From: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
In-Reply-To: <20260506192633.16066-2-mwen@igalia.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0118.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d0::11) To SJ1PR11MB6129.namprd11.prod.outlook.com
 (2603:10b6:a03:488::12)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PR11MB6129:EE_|DM4PR11MB6214:EE_
X-MS-Office365-Filtering-Correlation-Id: 42d08131-f7be-4813-44aa-08deb4d28114
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016|11063799003|4143699003|56012099003|22082099003|18002099003|921020;
X-Microsoft-Antispam-Message-Info: +dd1uQWFhdMy3IB72cEwJHYtjN/qYRSR13u3E+pKYQ5pj9+67S9JnJDJenX8le5aA4M9h1+WszYIdR3s1FlpEZk4qyEV60RzZ4/dqCig+B779JHSQIEe/DKJsvXFnqK6/iEAWzk9xTSmHVsjLQVTx2TtzcWH3snQzIKaz+CrCq3UtxfqRfTNp6cyJOj9xLW/EZY7aC53hMKl7gqJ9UZzvJjzTFCOXdjjCDCqSsy7qpmvIU4pH/m6nRU6xNdKWu9OM0+4fa5xbGisvJdoVa6CvOUc5YkM7G48wuiyoFi/nCJ9Ov3xfGxWSEuHUP1iB7cBuaxbuvhE+lBO4oBNpF5iled1DuTcaUy1F6P1g4OVBOeDuJjeTS355pJ+MZQf4h8jAkxpSSK9w2nD5mRmTXYyxUhmn0mYZ7tkO0CfthgJv8zT4TYnJWCphBoKdSMdp+OLkY/xzguu9npEPE3SfLJ7dBA8vSjhKISbOsuM/oMLVTjS6dOItJxVs2GEbo8VJkOzj0lkAPGyTb6ZT01WA5e6Fmc+o7a3ktm7zmuNFXhFZWDshxXD8WcYSAi2KaGSqWLT64hmvTg5+s9pqv6ENRqRfRd206ocpw9UIxax7K6cFhYYn8HP4TyhfYVjant+tF7Qi6wXhTzA7UMuG8b5QldGfDW0XMPmzAw8xpH3N4L9i94o1r8lA+uC1Bgz3ogKgw3oPlghjPaQMHYrqU/vhZPT0vG0pFlczQ6S5jQIy+Uzzuc=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ1PR11MB6129.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(11063799003)(4143699003)(56012099003)(22082099003)(18002099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VFRjYkJCeGFQY2tNbDl6SkhMVkRWMzZsQ3pVMjlEVUFKWjh4R0RONUdRTkdV?=
 =?utf-8?B?VkJCQmFCbzNqelZOeUtXRUVNTmQvSHJueGduQ1IyaFVvR0QzOC8rMWtXYlRG?=
 =?utf-8?B?WFJQZ2Ftdk9FL29CZkVTNVlBc0krOWxYeFM2SVd0UDduL2c4TXVNUzIzMlA3?=
 =?utf-8?B?UFN0TmFSallTK243M04zYzNwRXMrbnJ0eWk0Vnc0dnRyL092TkR1TkM0Rzlu?=
 =?utf-8?B?RWJIZXBWODVpaUx0eWIzRjFEWE9IVElVZlEzM084MXhWY0QvcDRnN1g1Sito?=
 =?utf-8?B?dEQ2V1JhUzNGcDYrNzB0MnpERjlUU0Rad3dkMGliRWZzMUZqN2F1OUhiQkla?=
 =?utf-8?B?ODh2MWoxSUdqdEdvZ0Z6WVlxUG9SR2JhNC94RzRNaTQzYnVLRzI3aURDd29j?=
 =?utf-8?B?bEFyL2laV3hnQTlrVE4xaWNhRjUvZ3NzWkdDak9iZkJXYmVOR3d0YjQwT1VQ?=
 =?utf-8?B?Vms4dFpjWVNWQXc2VTdxVUFyYVN5b3FkUTZmVjRLcXkvcFZ4aG1zUmNaR280?=
 =?utf-8?B?L1dHTTU0UWF3U2RNSXJtcW9KZVlkUFJ2M1djOVJLeG1xMWp2TVgrdGtsWTNv?=
 =?utf-8?B?eXRFd1hCWERBOUptRW9HODc5WGFQclYwSmJNb3J5N3g3aHRJWHNJaGMwRzhm?=
 =?utf-8?B?dXBrQlhqeC95Wm9Sa0hEcE9xODJCQmRHdE41dGR2Mnl2eGRyV1o3d3RHeHlO?=
 =?utf-8?B?M0d2T2lMMmUwaUVmZTJ1RGhnRlA2eDVJSEFlcE9keXI1ZzRLMFk5NXN3OGR3?=
 =?utf-8?B?M0YvOGpRTDVNRU81ZzdnL1ZmZG1UK3FWWFV4RGFDLzVleWFIWGZxN2RMejFR?=
 =?utf-8?B?c1JzaWpicSsyQjhEM2x6OG8yMGxiMFVRaDVUSEtvSkdOa2lpc0dRejBrMlB4?=
 =?utf-8?B?RmFvb3FlL0lmYXQrWXc3WnFBeHU2d05KbUFPVm9nR3BscDhTRnVZMTVYbytl?=
 =?utf-8?B?c3ZNTnVGQkNGbDNJNjUxVGhTU25ybG1rZUFzTklvWEV0REp6a0pRNlN3eWsz?=
 =?utf-8?B?WkVhSnIvMCtrZU9xWHlFazlZcDN4S0ZMM3NPNHU0SEFZZkFJRStJZFFCM252?=
 =?utf-8?B?NWdlRTBjNVpDQTgxeFB4a2xGZlZ5eE1hUmVXNkpoaS8xczFYaDcxcm9QZkNB?=
 =?utf-8?B?dFErOXhJUmNXTVA3TlpNYStGbzFCZ0diYWY4K0ovNUtoaXVoWFJnQitkdG9N?=
 =?utf-8?B?RGxsUjVjQnhZSmg0RjdrM2RMcmNmbkJpWHVWRld1TUhSYWVQQnFXMUdGWGJZ?=
 =?utf-8?B?SWwzRWxWS3k0TFAzaVhSRTVXT1hNVjN2cHVKYjQzd0Fvc1c4dG1qSy8vbUV5?=
 =?utf-8?B?RFJrT0xnSGJsWUdNYmcrK29KYktzbDV2bkZqQ2FCcUJmSjNOUHdtd0hYWTJ0?=
 =?utf-8?B?aDVrMFUrd1FsV0tzdkNwa3EyNlQzUFlybXVNZ0xiNlI3VGR4OWFOM2VWU0lU?=
 =?utf-8?B?aGpWNThxbnNGdzBoUGJnWFE3cjJWcm9MQ1pNU1VlYmFSM1I1ZHpQbmE3ZzFl?=
 =?utf-8?B?d2d5WWJzTzQzT0ZPYURlRmJSTnJHcDlua21PUlhoRVBEbUM2WW85UHpaZnly?=
 =?utf-8?B?UmZreld0NExLb2k0VkxKbmQ2dDdyZFdtZFRGbHA0eUxkUUhyT1UvZzMwV0xl?=
 =?utf-8?B?M0QrSzE4bXhrSXBJQ3c2WEF1SnNXcEp0Z1F3bG11dmh4SGl2TkQ5VlVWQk5p?=
 =?utf-8?B?cFI3T3R3WlplNXNBcVpVcHdBdlpRcVQvK2pwRW9KTUlxeVZrdGFRNWorN3h6?=
 =?utf-8?B?dldsS2J3Q3hGMEorQXd4cFBNSk9lc1J6TUgwektRUFM0aENJc2RBK3VDZlRz?=
 =?utf-8?B?UjdOazR0TDdINk1XeDdha2lsMkJJUittOVdXVHlGWVN5N3hhRjkrZVVBSkRY?=
 =?utf-8?B?MFdNKzg4WXZpT2xUK0wxdndyVWRQZ0hWcVBBTnJWRElkajRhS3VGQWpjcnMv?=
 =?utf-8?B?SURtdW5GQS9QbFhnY1E2TDljaFJTWk1qeG51aHlQVjBNZFQyTzNLdU1YTFQ2?=
 =?utf-8?B?SjJQTjFzTkVBTDhnS25YZWkvUjI4cDN4Y1FOVG9DMU5VYXY2MkdTdVNqSFlR?=
 =?utf-8?B?QVFNTXp6aW5WUXhJcmpCMmJneUc1QTMwZHVKVkV4U3ZMbjNGaHZGOGVYRGE0?=
 =?utf-8?B?cXMxTkhMdHJDR3pJZDUvWkJPN1gwcjFYOWZOc2VaVFdZdm0vNXhWWG96bk1Q?=
 =?utf-8?B?WTFObHAzOThCaUlSUWFlVHJHODFheG1maEpUZ0NaUFE5VllUKzJ2aW9uT0R5?=
 =?utf-8?B?b1BoZGlraFFLby8zL1RUL2dGZnhrbnFYYXRiWXYycUZUQ05rbjBHMCtNMmJ1?=
 =?utf-8?B?cVVlUUJrWnhudERVS2tqNVh2TjNBRmhMakFrSWpTMDNuRERaZXBQRTNZTW13?=
 =?utf-8?Q?LtKyZqJWANzukSQI=3D?=
X-Exchange-RoutingPolicyChecked: s3sqz0xYhAYZrZPXVwSvnewfoqpQy4hJQFi1m45FTm2y3wcDsNyCHH7TGodckoYreNkUQODZOLpNqthkuq14W+6Mm4tV5SIDBiyuGKIThQTsMs/i0ckkodn5vCDdLHjSfNkLWcCoOk0B4mX/9lHbvLoU4PjEHEcA47TzR0KG3I748CzxTJ4SUHv4i2NX3ILeQtcLVdSoWzM6CO7n8x8FPM2lCyB1SRscsqEtL5uYC9mFgK1PP5BEQarBCETKuQWPSLiw77SdCnPUtkx+v1nsxUVy1iUMbO7Zo3XjVFQaH7fS+LMnoGaFnFsAD+xWONBIFepnwV1xeKefyVTe1zudvg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 42d08131-f7be-4813-44aa-08deb4d28114
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6129.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2026 11:42:13.7885
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kqgoQ0AIe7DU3yynVghcF23wlODqCdF6rL2TToCWWN/7u9bjMXzyxZnE07yiOGEXIxXU0/b6+bnmdkLg+yDafnJLam3fUMVSPmUVo6LFcRs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6214
X-OriginatorOrg: intel.com
X-Rspamd-Queue-Id: F095F56BFB7
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-108180-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[igalia.com,gmail.com,amd.com,linux.intel.com,kernel.org,ffwll.ch,suse.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[amd.com,emersion.fr,intel.com,kde.org,collabora.com,bootlin.com,linux.dev,lists.freedesktop.org,igalia.com,oss.qualcomm.com,kernel.org,gmail.com,poorly.run,somainline.org,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[29];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[igalia.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,intel.com:email,intel.com:mid,intel.com:dkim];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[chaitanya.kumar.borah@intel.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action



On 5/7/2026 12:53 AM, Melissa Wen wrote:
> Instead of adding colorop state of all colorops of a given plane, only
> get those from an active color pipeline of this plane.
> 
> Signed-off-by: Melissa Wen <mwen@igalia.com>
> 
> ---
> v5: fix kernel-doc for plane_state (kernel bot)
> ---
>   drivers/gpu/drm/drm_atomic.c        | 39 ++++++++++++++---------------
>   drivers/gpu/drm/drm_atomic_helper.c |  9 +++----
>   include/drm/drm_atomic.h            |  2 +-
>   3 files changed, 23 insertions(+), 27 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
> index 54bab7e9f935..8eb519673fc5 100644
> --- a/drivers/gpu/drm/drm_atomic.c
> +++ b/drivers/gpu/drm/drm_atomic.c
> @@ -1591,26 +1591,25 @@ drm_atomic_add_affected_planes(struct drm_atomic_state *state,
>   		if (IS_ERR(plane_state))
>   			return PTR_ERR(plane_state);
>   
> -		if (plane_state->color_pipeline) {
> -			ret = drm_atomic_add_affected_colorops(state, plane);
> -			if (ret)
> -				return ret;
> -		}
> +		ret = drm_atomic_add_affected_colorops(plane_state, plane);
> +		if (ret)
> +			return ret;
>   	}
>   	return 0;
>   }
>   EXPORT_SYMBOL(drm_atomic_add_affected_planes);
>   
>   /**
> - * drm_atomic_add_affected_colorops - add colorops for plane
> - * @state: atomic state
> + * drm_atomic_add_affected_colorops - add active colorops for plane
> + * @plane_state: DRM plane state
>    * @plane: DRM plane
>    *
>    * This function walks the current configuration and adds all colorops
> - * currently used by @plane to the atomic configuration @state. This is useful
> - * when an atomic commit also needs to check all currently enabled colorop on
> - * @plane, e.g. when changing the mode. It's also useful when re-enabling a plane
> - * to avoid special code to force-enable all colorops.
> + * currently used by an active color pipeline set for a @plane to the atomic
> + * configuration @state.

nit: The documention sounds a bit wonky to me.

Also s/@state/@plane_state

This is useful when an atomic commit also needs to
> + * check all currently enabled colorop on @plane, e.g. when changing the mode.
> + * It's also useful when re-enabling a plane to avoid special code to
> + * force-enable all colorops.
>    *
>    * Since acquiring a colorop state will always also acquire the w/w mutex of the
>    * current plane for that colorop (if there is any) adding all the colorop states for
> @@ -1622,23 +1621,23 @@ EXPORT_SYMBOL(drm_atomic_add_affected_planes);
>    * sequence must be restarted. All other errors are fatal.
>    */
>   int
> -drm_atomic_add_affected_colorops(struct drm_atomic_state *state,
> +drm_atomic_add_affected_colorops(struct drm_plane_state *plane_state,
>   				 struct drm_plane *plane)
>   {
>   	struct drm_colorop *colorop;
>   	struct drm_colorop_state *colorop_state;
>   
> -	WARN_ON(!drm_atomic_get_new_plane_state(state, plane));
> +	if (!plane_state || !plane_state->color_pipeline)
> +		return 0;
>   
>   	drm_dbg_atomic(plane->dev,
> -		       "Adding all current colorops for [PLANE:%d:%s] to %p\n",
> -		       plane->base.id, plane->name, state);
> +		       "Adding all current active colorops for [PLANE:%d:%s] to %p\n",
> +		       plane->base.id, plane->name, plane_state->state);
>   
> -	drm_for_each_colorop(colorop, plane->dev) {
> -		if (colorop->plane != plane)
> -			continue;
> -
> -		colorop_state = drm_atomic_get_colorop_state(state, colorop);
> +	for (colorop = plane_state->color_pipeline;
> +	     colorop;
> +	     colorop = colorop->next) {
> +		colorop_state = drm_atomic_get_colorop_state(plane_state->state, colorop);
>   		if (IS_ERR(colorop_state))
>   			return PTR_ERR(colorop_state);
>   	}
> diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
> index a768398a1884..c8dadbf5c319 100644
> --- a/drivers/gpu/drm/drm_atomic_helper.c
> +++ b/drivers/gpu/drm/drm_atomic_helper.c
> @@ -3752,12 +3752,9 @@ drm_atomic_helper_duplicate_state(struct drm_device *dev,
>   			goto free;
>   		}
>   
> -		if (plane_state->color_pipeline) {
> -			err = drm_atomic_add_affected_colorops(state, plane);
> -			if (err)
> -				goto free;
> -		}
> -
> +		err = drm_atomic_add_affected_colorops(plane_state, plane);
> +		if (err)
> +			goto free;
>   	}
>   
>   	drm_connector_list_iter_begin(dev, &conn_iter);
> diff --git a/include/drm/drm_atomic.h b/include/drm/drm_atomic.h
> index 8883290cd014..8916923f32b8 100644
> --- a/include/drm/drm_atomic.h
> +++ b/include/drm/drm_atomic.h
> @@ -919,7 +919,7 @@ int __must_check
>   drm_atomic_add_affected_planes(struct drm_atomic_state *state,
>   			       struct drm_crtc *crtc);
>   int __must_check
> -drm_atomic_add_affected_colorops(struct drm_atomic_state *state,
> +drm_atomic_add_affected_colorops(struct drm_plane_state *state,

s/state/plane_state

Otherwise, LGTM. (needs a rebase though)

Reviewed-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>

>   				 struct drm_plane *plane);
>   
>   int __must_check drm_atomic_check_only(struct drm_atomic_state *state);


