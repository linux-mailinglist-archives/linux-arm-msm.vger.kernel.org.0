Return-Path: <linux-arm-msm+bounces-108182-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MC0jESD8CmqA+wQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108182-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 13:46:40 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B794656BE2E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 13:46:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 23E21301842B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 11:43:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13EB03246F8;
	Mon, 18 May 2026 11:43:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F9gUfrC+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E271374E64
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 11:43:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779104598; cv=fail; b=QF9CdJ10vb2To2TdyYC9iGAMIf8dVT3I9KFMDDfbGNAyfsKPcUIcvb87KHmTJTjnhtUNzCp1MdtBXBxXD+WHbVLYl4OF53Et1VXXcUM8JikAHzV2jQv1SIpHK0WPlxjRQ9PZSCd1toooP6yQgPzSW4bEJ5JQGzeuIV4flxAQ3ms=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779104598; c=relaxed/simple;
	bh=T6o93rY5uSRtjzRHFXM4h2RzaHXwYDd+84UxBCgKjjQ=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=P4YnYq5UPgjNRPcrxAq3TG5OAWzKgp1WST/5uOFOkUNn9tFUfZz7f2mlYTSL+VTJ6TWuVDgUF7qo0CTQNPj+U4OoQ6lxj6Ox5juaVUIg28OZWBYgiW1HVmwWfYfxr5JGe3rcYRHvGYH/Otdu5SRLGHo8XlN5yvYmh9hblELIJR0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F9gUfrC+; arc=fail smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779104596; x=1810640596;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=T6o93rY5uSRtjzRHFXM4h2RzaHXwYDd+84UxBCgKjjQ=;
  b=F9gUfrC+w2MHyCudT9Js3v513aAJoHDWwqu90PQOxo5MuK+YZnSnH/Xy
   jGscjb/5nD2pTqotmcwT+Un4tiBzDb8qR+DH1WB/RQ9njpp1sUp4TEmUS
   hoWfQ52PCnqeXgaxHwKaR7/IyRV/8hro/h71UsSAfFPIEFNrprxlqjETe
   RXCDiTNtvxGEWP4iHpFAc/m2I5aWmUI96u1EdQPxeTXiZiucnyxYadWdN
   j9Rqu28KEwan9J/2PGD6yy3s3CuuVE3clvUFO/i15inBNc5sqbeqMh8Y6
   iIuMTCRUEo9YSC8NFDf457DdTIsf/A15tFBQjZDwDIv9O6l1M+x5Zt/Oj
   g==;
X-CSE-ConnectionGUID: 33UkY1BnReKHlzlU7iCWxg==
X-CSE-MsgGUID: vwOgCfFORLW+pu8pZSDLuw==
X-IronPort-AV: E=McAfee;i="6800,10657,11789"; a="83807141"
X-IronPort-AV: E=Sophos;i="6.23,241,1770624000"; 
   d="scan'208";a="83807141"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2026 04:43:15 -0700
X-CSE-ConnectionGUID: ARjJ0mXpRvm33LWNA4EVZA==
X-CSE-MsgGUID: 6jnTXxnQRSCie+DOBSZyVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,241,1770624000"; 
   d="scan'208";a="244386000"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2026 04:43:15 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 18 May 2026 04:43:13 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 18 May 2026 04:43:13 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.3) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 18 May 2026 04:43:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CT87EwEKisc7kJ7d3h3UoTLa3/KOkqnJ9Sd8rcMnSygddbFvCZ/IamlkZobsNnvtxQSd5zqoSL7xVvKB6WV0KW/RIm8ju6qOkhnMMFamHdy1Elw3aC3gPdoKSJ2awUD16Y84pIY2uPp5WjY6AplUntnM/F0L42ef/EszSlfX4uETFHwKShujwhJ1RvYcarHWrYq/B27Cz1GW975D2GYShqkXF+rB9tKh1BJY6BOE1VS3Y+3BkSpIe0VD9yoT11ykjebMVshUKnFUDf7sXZfLdEjf0KOn0SZDBJcnS8nHiQAO9DY8P8O2P27+A8YDZNhVeR3e8T3VxUqjciTRuw4m2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0mmaP1+7oUx2/OKu5FNjCY/zifx1hHjN905eAS6rh+4=;
 b=Q0VgL0e8rL+OhKs5zO8Zktxy9qDBl2SRb3MPF8er+q4u7c4CQ9qujAq8BQZ4SFPm3+bqBf4Pc94O1RWoHjdykX926BGavyRkbAheCi1sQAtoJGpXkjnwbxtWmzb/2t6RUpws/b6FhKEHxyTO1HUidECQWlBKPZSfVxlJPhxdQVmfB9AjlNKntA3wbS67nJDV4GJ8v2zt7sCgJha3y/0HrXWhVP2dTqjDAqwmIid7Khnqu3U/Hmd7DYWpuxNUoLRtaxlYJ23W3lBZiDS2G9uPqOUi2S2yicdIPpep1MaDWDVRqULN4eTE7iNN8k//Zz2/Erey5KyAHv3ts79EALVhGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com (2603:10b6:a03:488::12)
 by MN0PR11MB6110.namprd11.prod.outlook.com (2603:10b6:208:3ce::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.23; Mon, 18 May
 2026 11:43:08 +0000
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::45f:5907:efdb:cb5b]) by SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::45f:5907:efdb:cb5b%3]) with mapi id 15.21.0025.023; Mon, 18 May 2026
 11:43:08 +0000
Message-ID: <2ec56a27-4c2a-40ec-82bc-bc4e05a8e143@intel.com>
Date: Mon, 18 May 2026 17:12:56 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/6] drm/colorop: Remove read-only comments from
 interpolation fields
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
 <20260506192633.16066-4-mwen@igalia.com>
From: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
In-Reply-To: <20260506192633.16066-4-mwen@igalia.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0P287CA0011.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:d9::7) To SJ1PR11MB6129.namprd11.prod.outlook.com
 (2603:10b6:a03:488::12)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PR11MB6129:EE_|MN0PR11MB6110:EE_
X-MS-Office365-Filtering-Correlation-Id: a81fa99d-152f-426a-4815-08deb4d2a1d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024|22082099003|18002099003|56012099003|921020|11063799003|4143699003;
X-Microsoft-Antispam-Message-Info: cen6SQRR7JWdN8mVwXX4O5mu1hEkhRcQD9Oy8nUtzzKQtgliLv3hh7J+02rsY58tnO8qzTyFHEcxG/yD+ml7Q5VK5/iNJn91gATus1D4VNq9EekNc253mkAMOEWZhKMG+GOq8Zds5sSlechHc6UYcnMyWU/Q3NxP7SFzdTypGGjwVvleFf9mmo7fc0knAEIQEULUvGyEMIUGv/ayGU/Zt7BgznBLGEtThxGvKZOZLVYC4QfwuRgGSqHDt8iUssoJHbAFnnKYPqZWLj5OscIxDTEsDTBC4vAdNfeE0Z5HBCwPIWrzPDX3HcOsdNfC47nQIenorOuihe1ngCwZUlK7rC2HqaKBM9fo/IvsRXA7GXopyS3QoYxCaWUHmRR9swLHcPpsriSW6TNoFMXUIWCyl8cs23B+iLJGTskRl7LYgQfdPr7R2I0qnrFKqgd4KurzZtFeZoPboxrofoXIf8MtRx940wuxig5PC2+OFiB7fTtsZ24peS+Mj7uELAr8YDOZx+DYQuceIOtdKbi0HCHzDVC0hWQnSprYMNp6aOhO+ZuLeV0FmuQUxMed0scMlHWUNJzFnuhvoA1lCUTDRRLVZ4aHNurBZqdu7jGCNFWohAFAfWrKm2d99w4N6x1nCdfy2nAJR7XjZ+JTGe1Ura/YwimqEV/XIGOz68mSLhnzc5RV/1bl993kwC57hPYRNal/072X66odNzZEWvHsAvlf5zhwpWzxNsUnMncZN7PayWQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ1PR11MB6129.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(22082099003)(18002099003)(56012099003)(921020)(11063799003)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ODJZUjc0UmdDM0FaWVd3alRlMElIMzluQVZnclBxQkFrWExSOVRTcTVkbmFu?=
 =?utf-8?B?b1piaEdDL2dsN0tpdnRqOG82NWdsa1AvVEVyNDFxWVlEUWlSdUE5VnIvTGVK?=
 =?utf-8?B?MXpUSFBoQ1ZaV2xTcGFUTDBCdkhkNFVaMjl5UlZxbkVHN2hJU2tWSy9MWmZ3?=
 =?utf-8?B?TmY1Ty94cEgyTTl0TzBuNlZsU3lueStMaGsrMGlVM0t6ZlRkYkxGR2JrYks1?=
 =?utf-8?B?c2RvVVJMYk9lRFI5S2lHTFJvK0ttT01YRTg3dG5mWWhyT09US2Z0T0tPYjZI?=
 =?utf-8?B?dWRRK3hiV1p2RFBZU01DSXNpRFBkcmxiVkNZUlRocW1UTVRyd3YxZ2s4YWVv?=
 =?utf-8?B?SnBPWkdhSnJPYk1VUlZmV2k0cFlTVlFaQWFqMmx2U3RzdEZLcFptQWFIL1V4?=
 =?utf-8?B?bllkTVdBTUZVazR4YmZ6MHNrazVhamhncEI3RDNsM1BHWDRybXBFYlQ5bG9S?=
 =?utf-8?B?VkhWd1VaUXBNN2FucnlBcDcvZDRXZ1NCUXBDQTA3bGthbFFsVnFNZFQwd3VL?=
 =?utf-8?B?b3RJQWJSYjZEeG9UNlB3Y0loM0dNSUp6TTNOUUp3andzLzh1eWNLVVYranBv?=
 =?utf-8?B?bk82SDgxL29qUmlDcm0wS01oNHNnaUNiYW1PSmUxRFRqdDJXUDQ1RGg3Smt6?=
 =?utf-8?B?ZUdHdjJGOVJ5ek5mRkh1cHFjSGptMXI3alA0UjRZVmlHS1VWMW92NFlocnNu?=
 =?utf-8?B?ZXBvMG44VVJwVkt6MkR0bnVSbE1oSEtMTGVWZTMwUmpSbFhrazVYa0taVlBQ?=
 =?utf-8?B?ZHkxeGlzend2NnpLanpDSWUvYTNkWGdrVXlacDViK2FnVzJHc3dmcDNTQjA0?=
 =?utf-8?B?bFg0NWRKUEloVi9XSmhsSElZNi8yQzlta2YzWjBMUDJzcEhqWm9BcUgrRWpn?=
 =?utf-8?B?LzFsMjVldzk0WTVlNWd6ZXI4ZHRib1BOZEtpMFRiQzV5bGVtMnVCTFE5ei9N?=
 =?utf-8?B?Z3c5L0RkbkR2dUtHTkN5Y09LN0twQmFpWkRNKy82ZmFkc09XMFZVYVNUVGgr?=
 =?utf-8?B?dHFkK2IzWUswbi85M1ExRzNmQlhKYTBjWjFQU1UxTWRPZk4vNTF3U3d1cG9r?=
 =?utf-8?B?SDV5L2JFeUJVWGdhRGRZWldIaE5WNFhoZXQxR0VwVzNDcTRFWGtaeXk4dFRQ?=
 =?utf-8?B?RTBnSC95N0c2aGdBcnVZSXRmUzh4aVNqU2wrY0czR0tTNkpOamhGdVNiSUNH?=
 =?utf-8?B?MlVITVpoaFdGcVFsNVJFV3pkSVN3bVBqUGptRW1DblhZcXVXZnZMTVEvbUZ0?=
 =?utf-8?B?aHF3VXB1bW1XekF5bUxSbU1DZE5NUURBZ3Z5c2xoZDRlTnhHd1hLR0x1YzRa?=
 =?utf-8?B?V1pIN05sMWxHZ0pVM3lkVUQ3RDk1ZnM0Vytrb3B1aDI2ZHV3SS9yWUpuWUo5?=
 =?utf-8?B?allzb1JzcTZpSWpCZ1ZrbGZIa3g5aUdBWDlHb2cvVG93SW5jT0RhZjBkVnVO?=
 =?utf-8?B?cmJUMW8rWVpYajhRbE1QRWhsVEtPaTJBemtzdXQ0MEhUbWlWOS94dkJLQlB6?=
 =?utf-8?B?SWNaRnBLSEc2dzNZYXFadHgrdERhZmRvMmhTeStOOG1ldGV0T0lkbXBvaHhM?=
 =?utf-8?B?R0w4K3ArNWVCU09xR3J1cFFWdzVhWGgzY3VhYzZwMysvSnFsZ0lTbkRqNEV3?=
 =?utf-8?B?VTc5ZkJBNFArZm5oY0pKY0ZMQnpWWmdRcUZWRFdaaXpPNkhrYWVPaDBpR3pY?=
 =?utf-8?B?R09uRllMRTlseDZYbTUxQ1JiNXIvQnFZZ1lhRXJUQU5vSHJOQ2JyWlE5WlIv?=
 =?utf-8?B?aUpoWlFCek5tUTY1L21rcG0rQkdOWmxSY1V5T25kVUlFTDFJYnhoMDh4Uk9G?=
 =?utf-8?B?cGpwY2hxSkt4TGJwTXRUODdqenlMRlZ2bVo4dzhqYjllSkU3V0hTd1lqdkdz?=
 =?utf-8?B?L3hJQWc4TVZ4V010d2NBa2pTRWZPOFJuOFVJR1ZvaG4ybFo4OHZHZ09LSGRE?=
 =?utf-8?B?engvcFcwdE9uN2d2aExNN3o5N1MySUx2d1NvVVczRm9wWkp3SjBLOEhrQzJk?=
 =?utf-8?B?ZGl4SnBORENVMUtUcFZqYWJ2RDg5Q1Z1RVYveFJheDBNMjFPSnRtZHRVc3Uz?=
 =?utf-8?B?NjM3UnZRTFFYdUVCVzZSTUVxQkU0NWpDdmpkWnlrTjVDTkhLbEZtTE9Uanhu?=
 =?utf-8?B?SkpXVFEreHRIMVpKc1NUbmRDejNSb0JRN1loc2F2ZVNiU3Fad3hGeFVFeXNa?=
 =?utf-8?B?K29iQ0dLTklrUjdCWHRVNGVSdEVNTEtiNU5iTTFIMFFaUklKZzZ4azhsRUxI?=
 =?utf-8?B?TzFKR3BmNE9BUDA2UXYzOXEvUlBZMHY2UFBqYkxpcFFFOUo3Z0xEMG0waFFx?=
 =?utf-8?B?d3NUZEd2SEIwVDVNRlhTVFVXTnBycEJlenhqY3V2TDlWcFVCWDVtM01wN0hF?=
 =?utf-8?Q?js2u1adNoyyTJ4tg=3D?=
X-Exchange-RoutingPolicyChecked: eEaxqXKYdJa4fxx8bIaf1OFRFqJ57lpxGboNduX1SBejdw9+/H8HRQoPaCtqshRkTjPQYW7DnTtuwB40v/FmggI9hqP3pkn1QYv72eLCwhEpeS7Vc1h4USy6bb9T1eNxMYU9Zi3CymfFOKaqW+0COvH91GvGMByu8PIg5Wq07tT7Miu/4X/r5HrTLYCOREhYiqvTm+zLe+1Gk1E32hExB8MkII38sl0JclwRjsLfghknzPmrsxlp8jrX3xxHG8MWFeRyLhlA3EhhJ60BbJhWePqKa82UbKAAwFmdiYaAPwL7ufVC2lJYil5mKCyWIuGuBeAUeiTIiNcKpF9XXP8n9g==
X-MS-Exchange-CrossTenant-Network-Message-Id: a81fa99d-152f-426a-4815-08deb4d2a1d5
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6129.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2026 11:43:08.7270
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Elu414/FK+mIWbe0gFRrNLRRWPQAIfBhxRJ0HbGD06gbTaodsVAPRRNI3OXgGLI4+uPfywMUHd2YZLkSoswf2BD4kZE+jqomc7H9vHyd9Bw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6110
X-OriginatorOrg: intel.com
X-Rspamd-Queue-Id: B794656BE2E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-108182-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[igalia.com,gmail.com,amd.com,linux.intel.com,kernel.org,ffwll.ch,suse.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[amd.com,emersion.fr,intel.com,kde.org,collabora.com,bootlin.com,linux.dev,lists.freedesktop.org,igalia.com,oss.qualcomm.com,kernel.org,gmail.com,poorly.run,somainline.org,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[29];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,intel.com:email,intel.com:mid,intel.com:dkim];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[chaitanya.kumar.borah@intel.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action



On 5/7/2026 12:53 AM, Melissa Wen wrote:
> From: Alex Hung <alex.hung@amd.com>
> 
> The lut1d_interpolation and lut3d_interpolation fields and their
> associated properties were marked as read-only, but userspace
> can set them via drm_atomic_colorop_set_property().
> 
> Signed-off-by: Alex Hung <alex.hung@amd.com>

LGTM.

Reviewed-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>

> ---
>   include/drm/drm_colorop.h | 6 ++----
>   1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/include/drm/drm_colorop.h b/include/drm/drm_colorop.h
> index bd082854ca74..61cc8206b4c4 100644
> --- a/include/drm/drm_colorop.h
> +++ b/include/drm/drm_colorop.h
> @@ -309,7 +309,6 @@ struct drm_colorop {
>   	/**
>   	 * @lut1d_interpolation:
>   	 *
> -	 * Read-only
>   	 * Interpolation for DRM_COLOROP_1D_LUT
>   	 */
>   	enum drm_colorop_lut1d_interpolation_type lut1d_interpolation;
> @@ -317,7 +316,6 @@ struct drm_colorop {
>   	/**
>   	 * @lut3d_interpolation:
>   	 *
> -	 * Read-only
>   	 * Interpolation for DRM_COLOROP_3D_LUT
>   	 */
>   	enum drm_colorop_lut3d_interpolation_type lut3d_interpolation;
> @@ -325,7 +323,7 @@ struct drm_colorop {
>   	/**
>   	 * @lut1d_interpolation_property:
>   	 *
> -	 * Read-only property for DRM_COLOROP_1D_LUT interpolation
> +	 * Property for DRM_COLOROP_1D_LUT interpolation
>   	 */
>   	struct drm_property *lut1d_interpolation_property;
>   
> @@ -353,7 +351,7 @@ struct drm_colorop {
>   	/**
>   	 * @lut3d_interpolation_property:
>   	 *
> -	 * Read-only property for DRM_COLOROP_3D_LUT interpolation
> +	 * Property for DRM_COLOROP_3D_LUT interpolation
>   	 */
>   	struct drm_property *lut3d_interpolation_property;
>   


