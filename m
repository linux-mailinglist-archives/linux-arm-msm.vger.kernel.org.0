Return-Path: <linux-arm-msm+bounces-108183-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +CATC/b8CmqA+wQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108183-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 13:50:14 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9605E56BF4E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 13:50:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AED413000515
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 11:44:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04F2E37649E;
	Mon, 18 May 2026 11:44:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TzpTb3NI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5FC727A462
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 11:44:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779104656; cv=fail; b=CWPLiknaxhwhg41DetYYgmdHXybAHsgXipkyrIY8np+Ph0hbXydJb7nEc5B/FGquck29CIK3VUmFJNt6pIwiBjoy0VW/FC0HyNJ0bqy/cQDkTGr54ObKeQyFb2KWrKAOtz695YGIP5o6LztSsDFjZOdamRdNRBC5VlO9YP1gCzI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779104656; c=relaxed/simple;
	bh=Knjs6LHIZjTakRJDy+JX4c41E49ywMaEK+lIGGIwfVQ=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Gft4onvGkYnJZsA1TzDUUliaT4O0JptP4Bpa0UtB7g+WaESJFvcll0iLs3AU1p2B3wWxUcy8vXn+QKVIgP7oDEAsMuOBAZd1hoedQl20sAFVc02LuAqso1sE3qlcygGHV4K61ey7uxJoMbhKgYHGnV9qkFptdn/Cou6we7Hau50=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TzpTb3NI; arc=fail smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779104655; x=1810640655;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=Knjs6LHIZjTakRJDy+JX4c41E49ywMaEK+lIGGIwfVQ=;
  b=TzpTb3NIsSm8oKOpjVISNNccdKicHJDIN7MOZT27YK+BB6PVR8hxTD3H
   WtmDxIwZH/ATQrYThewc8HNqfV6MpXsX/YoNm06221Msfqw9zZ1TIZY0V
   BzWnk23pJckheRn/tSr4wu1famPht0KA94vy4fBfOiiO/OzRKZJNB7bUe
   zWKdN6DoBmC+gzWhR/+qvVI0ZgcJFK3Ofcj1sva8ki0JDl9ASyOpl6/Tg
   LMC8GC8It586iqzB/BTLIJ+8o5ghvoOC8gYWPax+r/ebX1UvK41zsYMx+
   XbgjXuhvh1w9mcR2i1PqXqQV94pkWSZpiju6Z/gXMLJeH9eH4K4VOZF0/
   A==;
X-CSE-ConnectionGUID: Irt3et8UR3WtCxe79SQ77g==
X-CSE-MsgGUID: 6EHxHI6LSDq1xsljDrw29w==
X-IronPort-AV: E=McAfee;i="6800,10657,11789"; a="90535489"
X-IronPort-AV: E=Sophos;i="6.23,241,1770624000"; 
   d="scan'208";a="90535489"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2026 04:44:14 -0700
X-CSE-ConnectionGUID: 9focGdftQh2jbzolX1S04Q==
X-CSE-MsgGUID: mi62SDQqQ32tjn1DGkhVDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,241,1770624000"; 
   d="scan'208";a="235163979"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2026 04:44:13 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 18 May 2026 04:44:12 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 18 May 2026 04:44:12 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.21) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 18 May 2026 04:44:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JwmyM34zHKHMCCjuSf795jkPsHbsZzpAgwetmRt/SkKf1Gl1B68o5A+Dp5qK339GG6ixsvLWR4klY1GLbn7QtTSJ7sgNsenZttg6+K+Az9ud1nE6OP/gQzMEO0Tjyf26pF4j0dymkcPSpAjCZiaF1FyyVe88MeWO2z3Rcr40e9YA2p2r8pt00RtivXbDTrvSNUxQ5Ph7svnsSGqfR8FzBb26UEvkZUT0bdOysEhmTRk6VuTjfeBKIYMlQwDC7Be44BYcc+9aPzaBYs8O0CzlcnR16F4bZFsaFefkaGeEDh+OF46h6S1NU9lQs9XO3glwcMFC0D8uRz2P3GG7nlWBww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A0o7DDHGIpCuY5c7GTLXY3KFvVL9zv2hmOkVM9Mn+mg=;
 b=EzxfgJSG3XreDMyJgHkYPDqOIHzlliiVLtHg2+y9Bd5F0JOWSLpkFkpFcTU5ORMQYM4MGIx1HqWHPGnP8fpyp8a4svT9t19geM/hUsR6UlfHAqvUTmm2G+vMW0uROUnvwnUOlkfR+yEbB2i3QzAGFYpAxqY4BWHy2ZHxl3uxPAlgQnoM4saYBHnERhLKVmHXfoAzQ2mepckfW0/asaWO5kLVdbgI/hGC54HEOVomu3RQsdafUtDCgURrCb90j3UnPvv/FFDp/ksvee4Ko8LZuEt3CVB5p4nv4vVIPMlASexj2c9dglNxq9rnmWA9ZAFZB+UAfV1aqCLVzVJcboZQ1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com (2603:10b6:a03:488::12)
 by MN0PR11MB6110.namprd11.prod.outlook.com (2603:10b6:208:3ce::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.23; Mon, 18 May
 2026 11:44:08 +0000
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::45f:5907:efdb:cb5b]) by SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::45f:5907:efdb:cb5b%3]) with mapi id 15.21.0025.023; Mon, 18 May 2026
 11:44:08 +0000
Message-ID: <948720d8-0d39-405a-baa4-ff5672ae7f0c@intel.com>
Date: Mon, 18 May 2026 17:13:56 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/6] drm/colorop: make lut(1/3)d_interpolation mutable
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
 <20260506192633.16066-5-mwen@igalia.com>
From: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
In-Reply-To: <20260506192633.16066-5-mwen@igalia.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA1PR01CA0171.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:d::17) To SJ1PR11MB6129.namprd11.prod.outlook.com
 (2603:10b6:a03:488::12)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PR11MB6129:EE_|MN0PR11MB6110:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b61ab40-1049-4661-88db-08deb4d2c525
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024|22082099003|18002099003|56012099003|921020|11063799003|4143699003;
X-Microsoft-Antispam-Message-Info: 7bbiIaPxl4kFGA+OXbu/SwmlTdTuj8hrSSm5HJx9MqD1tISHVX5MjzzZjT7I/TEwDR6yDxV3Rj8KAhZSceYGjav1AomfhRd0qzS3NdK75fYsFeymyzGKBFZuL0+BRfwn4Mp420+Otw8V+SDwcTgIREncElq9J075DIRuSFHWE+B25c0pO3Ir+xB2ecIFoQKR+Yg4DxX9cixp8PVjqEKoAxV54dccxYFfSKLBa3eIJXFPPHbsp+9Y+wv3RjHhGQxJDEr7bSBgi+hbcQeea3R/HmJyTvbi1xPGUfSOE1xV6vjJZADfjVPMXn+Zq296nb56CD8TtnoMm7589AmDh9U6bQRnlaJAyBj7+MMDkG/8JdnU76Dnhp4GYTJfVS1YNG8EkyhqetYaciadcGBouosU0r+XGDR8B+E0Xgo8ukD2a9AAxAxPhPapbohPqvB05paihXgv8WMmMzSEKq61KPIFMFC1C9RQk/8/NTxGFcnV2aK/PiYKhSgWBsHuRhlGH9AjRzQTDodM5gIk4XKVXFSesDjJ4dMAoJs65IXi3qfNuEiOw37JFqXCd6G//zgZkaI/0Qx+cDVAQNG1zivGbiUTIPUhoNyajN/PG2OaqlY4dsJhPykslHBjfYQe41kTOeh1e8AELo/zhYt95QKd/YJ4P/7ied8BYoPjXzFkpH7nvlJVzTmYrA28YJ6L0nuDE0dS798vrvyq0Tboi153D12mEiO95Cikqv3AqGXY6efjYLI=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ1PR11MB6129.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(22082099003)(18002099003)(56012099003)(921020)(11063799003)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZllZWG5kSC9HWG56eGh6ZU1xclVNcUdqaXpCTi9iWW5uc1VIWDEyOVdsZWVQ?=
 =?utf-8?B?TUREazhiLzhzRnJhcE8za0V3SVc2cVF1MnFiU1gxc28zam5keE9TMnhPQ3NG?=
 =?utf-8?B?TGhPdjZ3MEpLOWFwSGlxRXBybk15VmtaRUpRemd3RHkreWpLeDRVNDBENFp1?=
 =?utf-8?B?YUdOeUU5UzV5KzJPTzNpR0U1d01QaEZMOFFVdzhzd0p6NHJSalZoYlFHY0wx?=
 =?utf-8?B?WnJ5YU1WSllrSzZPUkJ6Uk9VN0tHMEhyL25mRStWMlZNNU1EVW10K0hxWDlv?=
 =?utf-8?B?MXhxajNoSm5UcVdJZDNHR21TdXhaa0tuNmVIWGliQWd0U3JEdElTMS9HVU1L?=
 =?utf-8?B?VFRTdys4U1ZnT3gvUHV2NENwRmd5OHFOTzhKbFNGc29nUjUvSGg0ZUt6QXRj?=
 =?utf-8?B?czgzWXJoRm9jK0x5NGF4bXl4MVg3T1huRHRMNUZIRjdRUXVrS1VHa0N5Z1FM?=
 =?utf-8?B?c3FFWXBNQmlwbFhxTFE5VkE4bTlDdWhZK2RZcGpLZUZzZVVrUVZRUzFLdFN2?=
 =?utf-8?B?QVk4MXd1cFcwUXQ0bisraFNIV2plOFc5VTVwaEVSRjF4K0h3ZmNHZ1RRRmpl?=
 =?utf-8?B?bncvNWFoaFl0dXNDeGxDeEliTFpSa3BLcUNMMUxnR1VLNjh2dm5VZXh6dzVv?=
 =?utf-8?B?cVl0NXJEOVBsMHdHR2RBUlNuN3cwUXI0Z2hiNjJ6Zi9TWFVJZVBsVjlpL1lP?=
 =?utf-8?B?Rm1ES0NDcjEvZ3J4Qks2TXNmRWZIZFNNcmZNZ0JiSURTWWE3SFJZMllQZFJs?=
 =?utf-8?B?d3ptemFjVmt0cmJ4SmhJV2xvUUdSSkszYTdYbGpYS3c4ZXZlanhFaDhkekNl?=
 =?utf-8?B?LzQxcnUwQjlmNmtaeXlwL0wyV3d4TC9wcHRrR21hMEdXek9Vd1I1R1NIZWlB?=
 =?utf-8?B?S2xGb1ZORjFoQW03aWhBdHJUUS9GMklhMEIybE1yeXVkeC9MTlNpMDFTYStG?=
 =?utf-8?B?WUtOVGtxMFl1QVhnOWZzQk1xS0t2WHhjS0VuSWNYc3FaQzlPNkdBN0I5R3pM?=
 =?utf-8?B?dUlFNjhRQzM4Q05ZVzZaeEZaaVk5WjZmbWFwUzRPQUwxQTJLVzZFSVB0Y0gv?=
 =?utf-8?B?SGJUcXBNUVZ4c3IzT2JwTHlRSlNhWm1uVHozeTFCU0kzVTJlN2MxOXVBOUpp?=
 =?utf-8?B?Y0pFVW9ldkJ4VHYxUW54RHU4cUJXTFlrQWlYNFRBVGMwdCtEeElXTExRZ0V3?=
 =?utf-8?B?dTJUOUYwZ1YxRFE5OFRTTUlZQjRFVGk2L3V3NW13RmRKUVhFS1dXOWtMcG9T?=
 =?utf-8?B?cTJpTEQzOXltcG5kcm9QNTNCTGxPOGJoZkVReU10bHRQUWgyWTB4V0FlcG4y?=
 =?utf-8?B?OWtFS0UxdDVmdERKNk5iMDdhVUkrZ1hsbElrWmovQUVaUEh3VWJXcHpocmNS?=
 =?utf-8?B?QU50YVFYczN2T05EQm1rekNnN2JBRW9tZjJhYUZwc25EWkpwV0JiNytoazZn?=
 =?utf-8?B?bk9Jc2NIYVZCb0JaSUZSWWtWVTRXa3A4bEZiejMxc1oyNHk4SDEyUjNYbUgx?=
 =?utf-8?B?UW9OckVzWERHWnBXenVRN1pMWERLVlI1eHdhVFpZNUdIN29KYU03MSsyb2ta?=
 =?utf-8?B?RFU2TVNxQWhpRUp4djRkY1hSdlJSY1FZbXl1V0EySTFaV0FvT1dUVktiL21Q?=
 =?utf-8?B?a0NxNDRrMzVDSHhRV3hZU1FiWFZoSTFQbEUyNjY5c01vekFxb0NrdUM2ak4r?=
 =?utf-8?B?L1I2MlVtYVpSeFlHQXVZY01hNE8rRWtpRmg4eE5DNFRCNjJSek9oMVNQVzg0?=
 =?utf-8?B?d3FFVXFEVEU5a3hKcVluSGZPcGVhbnFFSlZwNzUzQjA4NGpERWI3NWhFN2Ny?=
 =?utf-8?B?UzEzbGFlVnMxRExyaWlnMFBZV0dOdjl0cDlMT2xMTXRXWXVMaGZITWVwaXgw?=
 =?utf-8?B?dEo2dElqTzE4K25GZU5OQjBNU1VhVDhjMlNCblZxZ2ZGQ0IxNmlHZ0lKOTV5?=
 =?utf-8?B?MjVEWkFRektOTVdVWjNBb2h4NEpqam5RM0o3Ry9XM2ZXRFFvVGhYQytveU90?=
 =?utf-8?B?NzlvRzltanJyT1dvTW5HSnpDMnhPYUFUMUlMYWw1N3R4eUdCQ1pScHRGMCtC?=
 =?utf-8?B?V2NwNHdOOTFIbmtEVnJIbklvenRWVGxoak0rVGJmQ0tWUFk3SDh4VlYvbWFn?=
 =?utf-8?B?dVlZd1VYdWpFTDJ5Y1k0K3FsTW8rcndnT21iOEdBblF0QjJCSVIyR1o1Sndh?=
 =?utf-8?B?TndNelJ0d2p4UElmaFpqTitNQVNQcGU0VFphYnhTOHhOZGFDVXZzYWFOcXZr?=
 =?utf-8?B?OUxML2c1amNIckJiYnJqWUZLbDJyOXFRY1JrMU5OZURmT1B2TzYyWFNSYVVv?=
 =?utf-8?B?VVNacSt4VCtpRjNSenUyaVh4NFV4ejh1K1ltQ1hZai9XbVlQWkRxSGtnSlhl?=
 =?utf-8?Q?PSUVJKpQbo3fFAzI=3D?=
X-Exchange-RoutingPolicyChecked: CwWvRsYkg8BjQ8e0AZL6lR+wREznlXmM+En1cQ65FSx2Ly2P5JVplIQLq2P0LvdzFkDDQUVBZoYaFPjjvhN9ll7FcdX5DLo0SKva9frNmQGtKttZZ3LEt3Gf2yqKQgGt/1dIPh95PKy1XO8NWcdV3kpeuFq13tfGKZgPwfW02NUpPzSBCozqTerBawdcFZEeIYUsW+jiYJqxIGddDbTpLMX6e8q4lmevD4/rIuQpwDWGXVMUOdopKSVfNFCooJGznACiIdrpDvmR1RzEQu7CdiY//pbp04WQrhjwqauohI3LrUsZQ8+XGiSPgJX2P5QnocVBAfRXRMhB03eOyBoNpA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b61ab40-1049-4661-88db-08deb4d2c525
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6129.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2026 11:44:07.9614
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hu3dESIaG+/DezjU1El3ch//NUfBH1nAaxUJpb9qUzgDKHaiHcHXL3miWqi6FX0h74plwvDSOiYtyetlpjnYPDeO7M/lQDo14CPCiy19Xl8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6110
X-OriginatorOrg: intel.com
X-Rspamd-Queue-Id: 9605E56BF4E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-108183-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[igalia.com,gmail.com,amd.com,linux.intel.com,kernel.org,ffwll.ch,suse.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[amd.com,emersion.fr,intel.com,kde.org,collabora.com,bootlin.com,linux.dev,lists.freedesktop.org,igalia.com,oss.qualcomm.com,kernel.org,gmail.com,poorly.run,somainline.org,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[29];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,igalia.com:email,intel.com:email,intel.com:mid,intel.com:dkim];
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
X-Rspamd-Action: no action



On 5/7/2026 12:53 AM, Melissa Wen wrote:
> As it's not immutable anymore, any changes should be handled by
> drm_colorop_state. Move their enum and make it correctly behaves as
> mutable.
> 
> Signed-off-by: Melissa Wen <mwen@igalia.com>

LGTM

Reviewed-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>

> ---
>   drivers/gpu/drm/drm_atomic.c      |  4 ++--
>   drivers/gpu/drm/drm_atomic_uapi.c |  8 ++++----
>   drivers/gpu/drm/drm_colorop.c     | 16 ++++++++++++++--
>   include/drm/drm_colorop.h         | 28 ++++++++++++++--------------
>   4 files changed, 34 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
> index 8eb519673fc5..1386172af92b 100644
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
> index bff8d58f8f12..25fe94410af7 100644
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
> index 764d12060666..b6930ef278c3 100644
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
> +		drm_object_property_get_default_value(&colorop->base,
> +						      colorop->lut1d_interpolation_property,
> +						      &val);
> +		colorop_state->lut1d_interpolation = val;
> +	}
> +
> +	if (colorop->lut3d_interpolation_property) {
> +		drm_object_property_get_default_value(&colorop->base,
> +						      colorop->lut3d_interpolation_property,
> +						      &val);
> +		colorop_state->lut3d_interpolation = val;
> +	}
>   }
>   
>   /**
> diff --git a/include/drm/drm_colorop.h b/include/drm/drm_colorop.h
> index 61cc8206b4c4..d5b45339333f 100644
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
>   	/** @state: backpointer to global drm_atomic_state */
>   	struct drm_atomic_state *state;
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


