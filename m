Return-Path: <linux-arm-msm+bounces-117942-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ang+JMN2T2rThAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117942-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 12:24:03 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 07AC072F8BD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 12:24:03 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b="IU/oYThb";
	dmarc=pass (policy=none) header.from=intel.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117942-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117942-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 59DE9317ED9D
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jul 2026 10:08:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6391D408025;
	Thu,  9 Jul 2026 10:07:25 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83DB33BFE4F;
	Thu,  9 Jul 2026 10:07:23 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783591645; cv=fail; b=NeGWic3/3Vqzbra0TTv3P7Km3ABqhnLbOgYjj5UcAGMK2dLg1iB9Y75d/jttRoS1F74tQyfsLfX1GGG4A25XXJPK9DjBRLjV3OtoOayF5oDww+dWc/L0zEBBVyiSPHdpp4sG/aOWe4cImAto2k5LR8rapucTvn66/ab4eeXsH5I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783591645; c=relaxed/simple;
	bh=OvzECc3O2+5LVR9tbR9zbwzJOdhq+iOFPBp2Vc4oDKo=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=i26EE9af7ddDy9zsLm9lzAn3SYHbsQ76Rd4VJ3VelaV5MGwFfjNsgo1x1cuWeWn8+g81KNo4ng7w4cuxwQm7WB6jSfF7U43O7ni05sUbH5/cHy4Iospx4amlBl1UAPJfRZwwht4AsAd18iJkLWuZspi8Aktr+DrR+wUrfXb8sMs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IU/oYThb; arc=fail smtp.client-ip=192.198.163.12
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783591644; x=1815127644;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=OvzECc3O2+5LVR9tbR9zbwzJOdhq+iOFPBp2Vc4oDKo=;
  b=IU/oYThb5GdDV5lj/qVPiiexR63ms/ClawXb8ER7P4gQa7pnvrzOnznP
   QASpTCDXQNtc3tiM3NtnKSksEEzowTOsd6OXZxfL/yyfxGo+/Mtz6c0vC
   KK/qjSwx5FFYVXgiqRnuPAFl7+QBgtwjZQUbdDqPUaGk6cDIJOUP5ltob
   pF9O/gHSVsaHehzGuzo+rUcTB4a5VVHi+9Rbqf1SMgBDom0rG+3uumfOl
   1g1eSzkcS62e4WrYFVBBUnN0nqO2XdDrZhhnA4EUvygpRbYHZM2A8gjKG
   sf956dnwCg3AmnNp3j9vldxhyp6iI0jINS9J3B0y812ipsT1l2qnTxFQS
   g==;
X-CSE-ConnectionGUID: IOy+QglwSaCicDkwRDJPwQ==
X-CSE-MsgGUID: ft16AOVXTgygEPNk9r8VVA==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="88095954"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="88095954"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2026 03:07:22 -0700
X-CSE-ConnectionGUID: r5xq7L0wQUiBRUg+BLgz/w==
X-CSE-MsgGUID: qz7lZ3I7S0a/BLrUn6N68g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="259443436"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2026 03:07:20 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Thu, 9 Jul 2026 03:07:20 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Thu, 9 Jul 2026 03:07:20 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.33) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Thu, 9 Jul 2026 03:07:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YygGbf5+focSttgmF84GzqJEWyrVIJbI45I8UBITpNcx/qgCrCVOx1pNlva/CruvQdmVDJpaFonlM5htwHOJiCRiY8oHWhoHo0JmZsRyjnPhHwv1UaZaE8dUZJEt1PLPbQFCFhAkzGMpNgvpQV3R5moOyd7HtokdqpDYzNFQXW3T4QoB0bcb2WHh571Q70p4mPyDib5aKLvdZ86AtPA85504wDzKD/c0NTWkmscNv05tQV4dGvkRyIZaW+2S5WyU/rkt/ZpeA28qax4xtXfN+/sEO7SJC4kHHNgf/aDNivJSMfiXJdDZmxW87+baaTZXHjHXtsAw9vJPr+/EevcCjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OvzECc3O2+5LVR9tbR9zbwzJOdhq+iOFPBp2Vc4oDKo=;
 b=OPouZnDQ0GEmTXkZorYPL53efD6g8szToPsN52p0jqbs1QR/ErgtV2eP/OVHeGju/+uyeL7QBhVN+tmfWu++WaZU3iuAg12edzCGak4wen+Fu9kCcD91yfXM2nLOFTINMFX2/xwHDm/hkWfXZt6FtaRVCFLlYQzT/dmjWyVY46t9OBCDgfrN5xCHMcVTTRJEUadOEQjfy0x/3lGXvnELwXTdMMahKtQw5QlOUkHJ19w5iN++uG1hxqAzYLqYO1qnlgl+rbsRwbwovjIi1JjMdAbaHTgmnogP1mgl6dY/k1+ini/DYKPWxVzxYVAPHAWVTKZHH86z/UBmgw/qAzt36A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM6PR11MB4691.namprd11.prod.outlook.com (2603:10b6:5:2a6::21)
 by PH7PR11MB6379.namprd11.prod.outlook.com (2603:10b6:510:1f9::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Thu, 9 Jul 2026
 10:07:15 +0000
Received: from DM6PR11MB4691.namprd11.prod.outlook.com
 ([fe80::5d52:baaf:8c72:ba5d]) by DM6PR11MB4691.namprd11.prod.outlook.com
 ([fe80::5d52:baaf:8c72:ba5d%6]) with mapi id 15.21.0181.016; Thu, 9 Jul 2026
 10:07:15 +0000
From: "Huang, Kai" <kai.huang@intel.com>
To: "ljs@kernel.org" <ljs@kernel.org>, "akpm@linux-foundation.org"
	<akpm@linux-foundation.org>
CC: "david@kernel.org" <david@kernel.org>, "kvm@vger.kernel.org"
	<kvm@vger.kernel.org>, "tomi.valkeinen@ideasonboard.com"
	<tomi.valkeinen@ideasonboard.com>, "dri-devel@lists.freedesktop.org"
	<dri-devel@lists.freedesktop.org>, "surenb@google.com" <surenb@google.com>,
	"riel@surriel.com" <riel@surriel.com>, "linux-perf-users@vger.kernel.org"
	<linux-perf-users@vger.kernel.org>, "pfalcato@suse.de" <pfalcato@suse.de>,
	"x86@kernel.org" <x86@kernel.org>, "rppt@kernel.org" <rppt@kernel.org>,
	"jannh@google.com" <jannh@google.com>, "mperttunen@nvidia.com"
	<mperttunen@nvidia.com>, "dave.hansen@linux.intel.com"
	<dave.hansen@linux.intel.com>, "kasan-dev@googlegroups.com"
	<kasan-dev@googlegroups.com>, "linux-trace-kernel@vger.kernel.org"
	<linux-trace-kernel@vger.kernel.org>, "hughd@google.com" <hughd@google.com>,
	"dinguyen@kernel.org" <dinguyen@kernel.org>, "ray.huang@amd.com"
	<ray.huang@amd.com>, "linux@armlinux.org.uk" <linux@armlinux.org.uk>,
	"lumag@kernel.org" <lumag@kernel.org>, "tglx@kernel.org" <tglx@kernel.org>,
	"simona@ffwll.ch" <simona@ffwll.ch>, "maarten.lankhorst@linux.intel.com"
	<maarten.lankhorst@linux.intel.com>, "robin.clark@oss.qualcomm.com"
	<robin.clark@oss.qualcomm.com>, "nvdimm@lists.linux.dev"
	<nvdimm@lists.linux.dev>, "tzimmermann@suse.de" <tzimmermann@suse.de>,
	"willy@infradead.org" <willy@infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "patrik.r.jakobsson@gmail.com"
	<patrik.r.jakobsson@gmail.com>, "linux-parisc@vger.kernel.org"
	<linux-parisc@vger.kernel.org>, "etnaviv@lists.freedesktop.org"
	<etnaviv@lists.freedesktop.org>, "m.szyprowski@samsung.com"
	<m.szyprowski@samsung.com>, "muchun.song@linux.dev" <muchun.song@linux.dev>,
	"abbotti@mev.co.uk" <abbotti@mev.co.uk>, "l.stach@pengutronix.de"
	<l.stach@pengutronix.de>, "James.Bottomley@HansenPartnership.com"
	<James.Bottomley@HansenPartnership.com>, "peterz@infradead.org"
	<peterz@infradead.org>, "christian.koenig@amd.com"
	<christian.koenig@amd.com>, "mhiramat@kernel.org" <mhiramat@kernel.org>,
	"hsweeten@visionengravers.com" <hsweeten@visionengravers.com>,
	"djbw@kernel.org" <djbw@kernel.org>, "iommu@lists.linux.dev"
	<iommu@lists.linux.dev>, "jarkko@kernel.org" <jarkko@kernel.org>,
	"osalvador@suse.de" <osalvador@suse.de>, "acme@kernel.org" <acme@kernel.org>,
	"deller@gmx.de" <deller@gmx.de>, "thierry.reding@kernel.org"
	<thierry.reding@kernel.org>, "linux-arm-msm@vger.kernel.org"
	<linux-arm-msm@vger.kernel.org>, "sj@kernel.org" <sj@kernel.org>,
	"pbonzini@redhat.com" <pbonzini@redhat.com>, "viro@zeniv.linux.org.uk"
	<viro@zeniv.linux.org.uk>, "jonathanh@nvidia.com" <jonathanh@nvidia.com>,
	"schuster.simon@siemens-energy.com" <schuster.simon@siemens-energy.com>,
	"rostedt@goodmis.org" <rostedt@goodmis.org>, "mingo@redhat.com"
	<mingo@redhat.com>, "linmiaohe@huawei.com" <linmiaohe@huawei.com>,
	"ankita@nvidia.com" <ankita@nvidia.com>, "damon@lists.linux.dev"
	<damon@lists.linux.dev>, "freedreno@lists.freedesktop.org"
	<freedreno@lists.freedesktop.org>, "brauner@kernel.org" <brauner@kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "bp@alien8.de" <bp@alien8.de>,
	"airlied@gmail.com" <airlied@gmail.com>, "alex@shazbot.org"
	<alex@shazbot.org>, "liam@infradead.org" <liam@infradead.org>,
	"linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
	"kees@kernel.org" <kees@kernel.org>, "mripard@kernel.org"
	<mripard@kernel.org>, "namhyung@kernel.org" <namhyung@kernel.org>,
	"linux-sgx@vger.kernel.org" <linux-sgx@vger.kernel.org>,
	"linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
	"oleg@redhat.com" <oleg@redhat.com>, "harry@kernel.org" <harry@kernel.org>,
	"linux-mm@kvack.org" <linux-mm@kvack.org>
Subject: Re: [PATCH 19/30] mm: use linear_page_[index, delta]() consistently
Thread-Topic: [PATCH 19/30] mm: use linear_page_[index, delta]() consistently
Thread-Index: AQHdB8JhhqDR4OKgF0aV2NSSaE+WJLZlBeeA
Date: Thu, 9 Jul 2026 10:07:15 +0000
Message-ID: <93cea857dd426563cc9b29c49a52d520517e1585.camel@intel.com>
References: <cover.1782735110.git.ljs@kernel.org>
	 <bf56e2e98b512962a2fb88900d535a0e9e6769d8.1782735110.git.ljs@kernel.org>
In-Reply-To: <bf56e2e98b512962a2fb88900d535a0e9e6769d8.1782735110.git.ljs@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.58.3 (3.58.3-1.fc43) 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR11MB4691:EE_|PH7PR11MB6379:EE_
x-ms-office365-filtering-correlation-id: 351afb90-6aeb-471c-61bf-08dedda1da3c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|23010399003|7416014|376014|22082099003|18002099003|38070700021|11063799006|56012099006|4143699003;
x-microsoft-antispam-message-info: yb7ZWXTjzW3rF5SIIsQj8BVo9AOcXDMxWiRNPGsrQp5vxFDirNi5S1k2Ubg77hU4C/z/F1WvZkJySG1TzG0xnDC3pI8yNv73KqXXFCqA/A8Vqyx/h6dg466UyGCxF5meVe1rOhALDLVOihx5KLFIOjUgoxko2idSfJEcpFkQSYO2mxtWqsj7o5PQd9WiKr+ZYskoF+TGVRDhCX1zgASS5ktpEAnjRsvj/9IANUTgBNxTaElubsMKq7GZCLa8LLGTaA6WptO527ynPAy8q4l121Jg577qU+YIowUojREhEhbqk72nOlm9Z3Yr1DmLx7PnYs5zWxfr6qr/rkh3Sxd9O0DTBBoBWRqeT7istbHJCsFJB75f/OQLw0r5WUIkWAZn9q3tlZEk7y0Wq3covcjep+XqOibS50GCGheqPx95T8qeqV/1iMc9qpmzQmY7PfdyUqi6xkr4Xn2iR4S5/VJOXM+kx7+y6jJ09i5sXYiKHqlJvGjGi5fUOXqs6URclaPJ6zrwKeXZzI+4MR1qf+tFT5C0FawKikMNW4fIzBOXkM5kRJd0bD9NY0IpZo9vdV6sP7JHKV57s8Xhu0DBLfuqIDf+q3DwVBaPwVK4W/eSFJ1ytmRHbV464HI6nvjpL981ahY7L4WDnL5b+26quqwxVkkek5JHvJje3jKaHeheCvo47kie/BCAyx3hxhkgPMxCLaaBm/dGVTt0e5StCyyAgCbZp0lhGcKR6zFXt7q+bKQ=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB4691.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(7416014)(376014)(22082099003)(18002099003)(38070700021)(11063799006)(56012099006)(4143699003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VFFYOVZ2TFdNcFJlb0l5TGgyMWI2dkJ6THFWY1BLalFDSEpPZm80dnVFYVAy?=
 =?utf-8?B?V1hwVGVXTytaNUdZaUE3UmdxajFUR1lFOUxIQ1VadzBOUkd5eGZ2ZDVZUjBi?=
 =?utf-8?B?ZDZWbUFvU3RQNjBwa0ZZU0pHNTlJTWxxNFlWdnhVWTJ2eDFqb0NmU3YyMG9S?=
 =?utf-8?B?QmpOQkpQMlRKNHJpbXQ1UE1IdG1JUzZoeE5tMDR6SG5JMVRLWlI5VmFaUVlk?=
 =?utf-8?B?aFpGdzJwSUNLaGNqejh0ZnROOGR2cHMxL1pkUWJSN04xVlk1ZFFPM0dBU2xn?=
 =?utf-8?B?NjZpZkQ3QzNxaW5LQnp3MlBoT0EwL3RnbUI5ajJiOE9Bc3JPaVFHNFRtdVN0?=
 =?utf-8?B?V2FIbWQwT2VMMVBrWWRIdFBmd09OUVlqbEtsMmZlYXBBNE10bm8xb3hJd2I5?=
 =?utf-8?B?cVBWc3FGbXBNOGQ0T2pZQzhHaTJQd2hnTTFRU09hOGNkaEpYZW9iQ2lPUEYw?=
 =?utf-8?B?djhuRnVValpPZ01hbWhYbXdaL3JQQlZpZUtpZllwbDlrNnRDenRBVmljNGxG?=
 =?utf-8?B?NFgvV05aSWgvc3VsSXB5ZVRsRjBXVEVCc0FUcDlKNnY1VWhJd0lscTJHdEtH?=
 =?utf-8?B?MzVudDhHcDNJQ1NPTDU4ZW1xWmZQY3pldkNJb2hXMEJsbkVCKzVYb1RnRU9x?=
 =?utf-8?B?U2swUjMvandIVUk2TGVDc2NLczhvTjRrL0hxYnRzSC9KM2NrYmhhaW13Zmt6?=
 =?utf-8?B?TnUvT3o1Vk5yd0hYM1JOU0YxVGZseWZ4YXZyNTFieWpiMjkrOHF4M29EU0N0?=
 =?utf-8?B?dzFDdTNzK3RmMk5zb1NsSlB4NkdjMXkyT2hmc0JYN3U3QmdCb0sybUE0RnJq?=
 =?utf-8?B?aE1yNzVMekxLMGhrRGxnY2I5YnBMMzhsMytMMmQybjJKRFNsRzZsMUI2YzB4?=
 =?utf-8?B?R2pSMWMxNFlQcGlBQ0pSTExNSHBJVndZRkNjZTk2ZDhTc1E2NWVkVk1OVmxT?=
 =?utf-8?B?eGpIazZEK2dUM3prTHZCMXhGN1pkV25sdHNEbjUwengveFFRVjZGOFppODBC?=
 =?utf-8?B?UTU4ZHBmRnlPSVhMcDlvMjhkdDY2TCtUazQ3cSs0NzFKa3RPb1FTeWlrS214?=
 =?utf-8?B?ZW9wOWtORXFja3NVNXpZQ3k4QmNaZjdNcllTTTA3UDVIVTRhRVI3L1BRaUVl?=
 =?utf-8?B?T2wzUnk1NU13SWU2V09WZm9zNWpleVRJM0JoanBiNlBubmUyT1Z1YlZ2Y3FH?=
 =?utf-8?B?TGZ1V0RoZ01meTJWbkpFc1dJU2lOdHJORjgwMmVMMUlQQ3JoaUtBWjVtWGto?=
 =?utf-8?B?ZmVicE8vUGpXNzRKckQvOGdJdStsOTM3Tm5GOW54dW5GU2lHdXdlS29hbGhU?=
 =?utf-8?B?VmY3SUsybFJDUEk0d1FCN1ZTcWlKQlZPbGpJNk1xS21TaksweU5Fbkx6NWtv?=
 =?utf-8?B?WUhoNEJuSFJ3SVpsV1hEcGVaeEVMK0lyY3NETFBjV2pUQzZBYUEzNmQzWkE4?=
 =?utf-8?B?blFiTE0reGlvUWdabGNSN0VON2hOWUQ0N3FoMDZIUTJCU2hvQjNpeTJxRzQ1?=
 =?utf-8?B?dlZPR1NZcGxjTjErNDhjSERlSm1McEgzeHZaQXR4Y29nemNmcWplQjN5bnp4?=
 =?utf-8?B?cFFUUC96RjkrUzI2alZpSlhLTGhXcGNiSHdSK3BOcXdwbXc5YWQ1a1o2UG1V?=
 =?utf-8?B?V3BodDMxNlFRR2REVzZLRzhKWGtTNnJJS2hzdlFuNm1tY1E1Rnl4Z2JjekVV?=
 =?utf-8?B?TXJuWVU3dmlOSnFZV1VKZXExZ1d3Ly9wMVZ4cXVycHFlcWpJdk1ZY3k4NmtM?=
 =?utf-8?B?REFhNHNZY0RmRkM4WUt0Rmg3NzNnUTBjVTRaZEpZQ3JrZVpjcEtybDUvdlN2?=
 =?utf-8?B?V01EK3NCbUdjWCtrRDZONXBiVlg4NDZoTjBYT3NqUWlvYmFlUGtzc0Z2cEVL?=
 =?utf-8?B?anhaM01YN1JVL0hiWUFhNVg0b3VOTFlXOFkrNnhUU25uWUwwOWxSVTBCQVlw?=
 =?utf-8?B?cGMxZTN5VGhXVmxkT0ZOZmZub2hVVFdQV2F4VGlGTWFXeVZQTWMwU09vU2VX?=
 =?utf-8?B?MDRrb3IvMnJ0ejlNV0RKTFozZnBIY3Nwa2JmZnYvcGxMbk9HTlBCMFIzS0E3?=
 =?utf-8?B?RE9QMENqWEJscHlDVHk4UTA2UkRDWURTYm5vNmw4MXhuVzIwMUgrYTU5bk13?=
 =?utf-8?B?OXJVQkgvZklOTCtxcWVNYjVrWXZFUDJrd3hVcS9JVVhBajJXTDhyLy9Ca041?=
 =?utf-8?B?em5RKzl5RHZ6bHlqUkRGQjhENUhqUFlrb1A3NEk1YitObmZxTFU1V05STVFi?=
 =?utf-8?B?V2JOeXE4S2szRDZZMm1OZ21aSERPUEszbDEwbFh1SWtEVmU4RTBGRWp0Ykh3?=
 =?utf-8?B?WXZ0Uysrek0xS29DVXJqLy91VzlNaVJJRGFaZEw1KytzM25RVUVGUT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <0C3E54796533DE498A7E11F4E014A6CB@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: k2MjFvWgQrv9y6266FexqV5zB6sWr7dV8EJepRtddA37uBKcgDknFbR2gLYYZ7BeBNWqf7gHjbqQkUZLBZfSV9T3mwGvFnzrUErJNG3Mg5SqnEAePpDcxiEHlUCtvFv7s6yNBvqg7AeYVTRnEJG0UDAZPgJ1dPCeMwgTk2VIJA7N+TIpCjLHquh/43eHAIytYzlrdLE3t9hgnZs5B9LwiAOnVpGHRFrUaI1YEr4mSfTKWXyqiM86mdWyRTJl83OsDK12G8KbXPs2qskeLG4V5w/c5yEcDkqGzrkftWBPrK67JhawWvYmi5ePBdMOq5lJjU+eNx+zzq47ngMaLTwxHw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4691.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 351afb90-6aeb-471c-61bf-08dedda1da3c
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jul 2026 10:07:15.3883
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: E69Ig70+4pjSiByM6TbH29ru9rnB5VGa0infWjxDqRU5Hnp3HIid+4LGmWgXuNJsVgZ1KFXzMv8damlNgddN5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6379
X-OriginatorOrg: intel.com
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.56 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[intel.com:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-117942-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:ljs@kernel.org,m:akpm@linux-foundation.org,m:david@kernel.org,m:kvm@vger.kernel.org,m:tomi.valkeinen@ideasonboard.com,m:dri-devel@lists.freedesktop.org,m:surenb@google.com,m:riel@surriel.com,m:linux-perf-users@vger.kernel.org,m:pfalcato@suse.de,m:x86@kernel.org,m:rppt@kernel.org,m:jannh@google.com,m:mperttunen@nvidia.com,m:dave.hansen@linux.intel.com,m:kasan-dev@googlegroups.com,m:linux-trace-kernel@vger.kernel.org,m:hughd@google.com,m:dinguyen@kernel.org,m:ray.huang@amd.com,m:linux@armlinux.org.uk,m:lumag@kernel.org,m:tglx@kernel.org,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:robin.clark@oss.qualcomm.com,m:nvdimm@lists.linux.dev,m:tzimmermann@suse.de,m:willy@infradead.org,m:linux-kernel@vger.kernel.org,m:patrik.r.jakobsson@gmail.com,m:linux-parisc@vger.kernel.org,m:etnaviv@lists.freedesktop.org,m:m.szyprowski@samsung.com,m:muchun.song@linux.dev,m:abbotti@mev.co.uk,m:l.stach@pengutronix.de,m:James.Bottomley@HansenPartnership.com,m:peterz@infrad
 ead.org,m:christian.koenig@amd.com,m:mhiramat@kernel.org,m:hsweeten@visionengravers.com,m:djbw@kernel.org,m:iommu@lists.linux.dev,m:jarkko@kernel.org,m:osalvador@suse.de,m:acme@kernel.org,m:deller@gmx.de,m:thierry.reding@kernel.org,m:linux-arm-msm@vger.kernel.org,m:sj@kernel.org,m:pbonzini@redhat.com,m:viro@zeniv.linux.org.uk,m:jonathanh@nvidia.com,m:schuster.simon@siemens-energy.com,m:rostedt@goodmis.org,m:mingo@redhat.com,m:linmiaohe@huawei.com,m:ankita@nvidia.com,m:damon@lists.linux.dev,m:freedreno@lists.freedesktop.org,m:brauner@kernel.org,m:linux-arm-kernel@lists.infradead.org,m:bp@alien8.de,m:airlied@gmail.com,m:alex@shazbot.org,m:liam@infradead.org,m:linux-tegra@vger.kernel.org,m:kees@kernel.org,m:mripard@kernel.org,m:namhyung@kernel.org,m:linux-sgx@vger.kernel.org,m:linux-fsdevel@vger.kernel.org,m:oleg@redhat.com,m:harry@kernel.org,m:linux-mm@kvack.org,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[kai.huang@intel.com,linux-arm-msm@vger.kernel.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp];
	DKIM_TRACE(0.00)[intel.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCPT_COUNT_GT_50(0.00)[76];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kai.huang@intel.com,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,ideasonboard.com,lists.freedesktop.org,google.com,surriel.com,suse.de,nvidia.com,linux.intel.com,googlegroups.com,amd.com,armlinux.org.uk,ffwll.ch,oss.qualcomm.com,lists.linux.dev,infradead.org,gmail.com,samsung.com,linux.dev,mev.co.uk,pengutronix.de,HansenPartnership.com,visionengravers.com,gmx.de,redhat.com,zeniv.linux.org.uk,siemens-energy.com,goodmis.org,huawei.com,lists.infradead.org,alien8.de,shazbot.org,kvack.org];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 07AC072F8BD

T24gTW9uLCAyMDI2LTA2LTI5IGF0IDEzOjIzICswMTAwLCBMb3JlbnpvIFN0b2FrZXMgd3JvdGU6
DQo+IGRpZmYgLS1naXQgYS9hcmNoL3g4Ni9rZXJuZWwvY3B1L3NneC92aXJ0LmMgYi9hcmNoL3g4
Ni9rZXJuZWwvY3B1L3NneC92aXJ0LmMNCj4gaW5kZXggZGI2ODA2YzQwNDgzLi42YTE5MzNkZGM2
ZmMgMTAwNjQ0DQo+IC0tLSBhL2FyY2gveDg2L2tlcm5lbC9jcHUvc2d4L3ZpcnQuYw0KPiArKysg
Yi9hcmNoL3g4Ni9rZXJuZWwvY3B1L3NneC92aXJ0LmMNCj4gQEAgLTksNiArOSw3IEBADQo+IMKg
I2luY2x1ZGUgPGxpbnV4L21pc2NkZXZpY2UuaD4NCj4gwqAjaW5jbHVkZSA8bGludXgvbW0uaD4N
Cj4gwqAjaW5jbHVkZSA8bGludXgvbW1hbi5oPg0KPiArI2luY2x1ZGUgPGxpbnV4L3BhZ2VtYXAu
aD4NCj4gwqAjaW5jbHVkZSA8bGludXgvc2NoZWQvbW0uaD4NCj4gwqAjaW5jbHVkZSA8bGludXgv
c2NoZWQvc2lnbmFsLmg+DQo+IMKgI2luY2x1ZGUgPGxpbnV4L3NsYWIuaD4NCj4gQEAgLTQxLDcg
KzQyLDcgQEAgc3RhdGljIGludCBfX3NneF92ZXBjX2ZhdWx0KHN0cnVjdCBzZ3hfdmVwYyAqdmVw
YywNCj4gwqAJV0FSTl9PTighbXV0ZXhfaXNfbG9ja2VkKCZ2ZXBjLT5sb2NrKSk7DQo+IMKgDQo+
IMKgCS8qIENhbGN1bGF0ZSBpbmRleCBvZiBFUEMgcGFnZSBpbiB2aXJ0dWFsIEVQQydzIHBhZ2Vf
YXJyYXkgKi8NCj4gLQlpbmRleCA9IHZtYS0+dm1fcGdvZmYgKyBQRk5fRE9XTihhZGRyIC0gdm1h
LT52bV9zdGFydCk7DQo+ICsJaW5kZXggPSBsaW5lYXJfcGFnZV9pbmRleCh2bWEsIGFkZHIpOw0K
DQpGb3IgU0dYOg0KDQpBY2tlZC1ieTogS2FpIEh1YW5nIDxrYWkuaHVhbmdAaW50ZWwuY29tPiAj
IHNneA0K

