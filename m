Return-Path: <linux-arm-msm+bounces-109028-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +EU4KgbqDmqwDAYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109028-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 13:18:30 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 209F15A3E11
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 13:18:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3939D3016D1C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 11:18:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 275DD3BB9E3;
	Thu, 21 May 2026 11:18:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NcYJfn5y"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43AD83BBA0B
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 11:18:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779362293; cv=fail; b=qKFvzcJLVT5qoPGhLMwfAM+eZJYVAgnoVul2f6XAI1L9phE+7j8fbK4ngFejWSGxVXZ6l8cFQO+aRa2/7wiqEK+vJRKOfc7IqgafVp+/4OBkCIbmm7iJaXyx5DjTrokA7UOr8QpTY5ZuF/2krR5gyiPmUn05KTzPo9xob1jensg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779362293; c=relaxed/simple;
	bh=DKbF3XNB9ju9kKHECZhcFwb7bQ9GB4xi8WXMSVxaZuw=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=tWzEt5su+xa1+ojxX425P3vO8yoLeUlzuDPisn6d+vLm+uHEsp0CKoZllArFA1GEdtV/72ZH6ALkIf84x8rzgM1FzSLSXDZ2undFDTaonirkkvo7NnRu638P6d50hs8hE8na0s4vngjwJir0aNsM0N+W903IV8O49VlCmcAP1E4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NcYJfn5y; arc=fail smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779362291; x=1810898291;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=DKbF3XNB9ju9kKHECZhcFwb7bQ9GB4xi8WXMSVxaZuw=;
  b=NcYJfn5y9mS5Xv+ytHoSFDkyYJ4XZnb3Zw0F5gWtPfpkjiKrxtohevxR
   yGF6VFzsRglJDvOyOkHWVE3RfRC4Dx87zBavSU4hpA2+DVNaJLjqT2kAo
   qekVxhXawf74jjCWdt4Bda+hNo0IMnOuV3/VFnnVZraGrC3ycNo2u418o
   hV8jZN4g0otlNMG/xzQExxL4hiDMFRlR837MCEBfj4fe3P+AnElZTX06d
   HDXV4nKJ+oRFVM1FjxGyg7AiLAd7pnZHLnDpYGdoLQUD5kExQ9Y756Glu
   E8/4BP+LfithUR6Dd5bQlnkgag5Rga2zlCYIokYTdMUebE3yp8HfeZeEd
   w==;
X-CSE-ConnectionGUID: TVHbR7VfSV22jdNlpnTHUw==
X-CSE-MsgGUID: T+sD0liNS3y3XppeBVAgkw==
X-IronPort-AV: E=McAfee;i="6800,10657,11792"; a="79304829"
X-IronPort-AV: E=Sophos;i="6.23,246,1770624000"; 
   d="scan'208";a="79304829"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2026 04:18:10 -0700
X-CSE-ConnectionGUID: MeKH+8BqTs+wE4F43nyz8Q==
X-CSE-MsgGUID: QIpIiaaeSpKsJDsK+5SisA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,246,1770624000"; 
   d="scan'208";a="234160033"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2026 04:18:10 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 21 May 2026 04:18:09 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 21 May 2026 04:18:09 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.30) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 21 May 2026 04:18:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dNtGMom4EFOgWH/w9qciwNzwG2MGQrOPgAXQvj96kldr2TiI1V3+PLBmInHeYHlz2iF3DpULX5neVtF8VRPugqHBi1KeiQk9cEiwOCSlURt7sVoyi03i28LdS/bvU3CIXRT7q258YG0BjdVAq+sIShftxVRfCmheiBRuSGNc414er/tZ2gICqMn9SwYdVFaujHGn8iuFWDfMg/xVexuIZwNM0tMc+EyAP9VEg33rRZWapwPh3uTWSAJxfjPyqYY85a5nItynB0x2HLeftufvbKXg9b6RV8+Go0nOPhH8WmrZ306xeTIQHt8bDd6JfFfBnAgMZ+fwJ47i0fIq5epIxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sL9GP09m5M4UHFnGGaCM3/RyCm73zYZ7uMixVFr6vU0=;
 b=KzVh/VcEZGlsRfsc7JInDnwPSIerP7Q0RRwwM7tlBhacoSmCJ2d4276/zlyJQMegjtBWGw8zgMlgM9Ja+oFBoHb4QNNwF8EMDBBSrMd/ZivqPS0uBXBedBsG5PK6s1JhEiJbEAGjqsvBdgkjvrdTFVaj6qp60JhfSiD/uZndZNBMyqUU51uwufA6wojDwTWkMDICfe6+FxhvQDK5UCfbNtlyX9pHZAR1uOjK+/186Z4ai8Ob2NkCgcPOapEKFUM0ySYp7ujmafwQfBIH1gxLJ4OBnJYFGT9OxNvgFC6dyReyYatWULmB32EESTnWhFjdjxcPgUS9zNBjgy6AbDh9IA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com (2603:10b6:a03:488::12)
 by DS0PR11MB9453.namprd11.prod.outlook.com (2603:10b6:8:298::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.23; Thu, 21 May
 2026 11:18:07 +0000
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::45f:5907:efdb:cb5b]) by SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::45f:5907:efdb:cb5b%3]) with mapi id 15.21.0048.013; Thu, 21 May 2026
 11:18:06 +0000
Message-ID: <ebee1103-c76e-46c3-9a71-84f5e84fd76c@intel.com>
Date: Thu, 21 May 2026 16:47:54 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 4/6] drm/colorop: make lut(1/3)d_interpolation mutable
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
References: <20260519211111.228303-1-mwen@igalia.com>
 <20260519211111.228303-5-mwen@igalia.com>
From: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
In-Reply-To: <20260519211111.228303-5-mwen@igalia.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0198.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1aa::11) To SJ1PR11MB6129.namprd11.prod.outlook.com
 (2603:10b6:a03:488::12)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PR11MB6129:EE_|DS0PR11MB9453:EE_
X-MS-Office365-Filtering-Correlation-Id: 6bf3aadb-f900-4d59-674b-08deb72aa1bf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016|921020|11063799006|4143699003|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: 9JyIn1+pSvP3Cqkesm2hIIHlkyQ6op5WXPuvxYiVw21cj4WUGxZxHXiff0wqwEUn5T6QWpJDZTvUa5BGn2pWFAyP4UXWiiPn7gkidRL4LzjxcxEfI59XTSBDuQXksGU/Ec0yeHSkWDz1HAeYFLGGzynggOWXn5w1S5mE1kl/0ekoQWtlB6hnBqIMHzxHh0gFPUughGB4JLkid3zdfFtQoLfI/AyI1jCCLEm/HibxKhjUcZbnuwNVcS0SUwTMTRQEnhtfncBZ0HDt6fDXt0kJqhU2nd9NLc4NL963IDJmCsxhObnxWSHXWazNmr+ekghub6IPKtsFGTLaXheJyQ+IrF7/hmMJA2E3E2suOtHBXKuyqhZ2rBxtwBSqr3+DplDi0HnwI9Ue4FRTzhm45Yx0diqQBY7qK87oY3G8o5eMGWE55vIevp1yX/cfyIz8Ga46G7OGsH1xN+7VOCgDbDijpniDgbL8VqWa0MR4f95kL8frnS220RFeD6MePU/dzT2sqHG3XcdCkP7jroywKNOEeZGrNHLB/JJOqG2aBV45PZ4LCKREnXqwH9AyjlpATxgMYyG5O8QDtR/TafGM8agwbQb0GcDAlLF2xp3nz7Xk03FQbybAHf7ebojON3NKRmjKbI/sSmPgEfHUxqK56y/IYaIvln7qtW5FjDWgwaGVGFYNiMyWlWhq3uaL1eIaI/cTcQ6AQPMa6RvLCPmn2XT15nnUxFJiuGmfjsoQUcvZ48Q=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ1PR11MB6129.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(921020)(11063799006)(4143699003)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eGNaS3U2NEVhNnNmQmVDbWJBWjNwTFdoTVYyUXcwY25mNzRyazdpbTI4K0Qz?=
 =?utf-8?B?YUJzdlBZMzZiRURaT1BOT25SN0pHc2w1cFd4UXA3Mm9BcDJzcGlJYXJiYkR0?=
 =?utf-8?B?cUVPc2RrWjh3Mm9MUzJsaDZDUWRiR0o2dWxuV2JFdUZSUE41TlRnS1NOUHI2?=
 =?utf-8?B?cXhFUzRiY1JabWdHc2x4VmRaeUM2VTJhNHQ2N0VReDVnVEI0LzlQTDFPN3B4?=
 =?utf-8?B?WDNoRWFtRFRjNHhTQUUxSGFBTkZDaWtpQ2NoeCtiaVJWaEYrcFE3R0ZCMUZJ?=
 =?utf-8?B?UDZNbmhyWVV5c0tpOUovYWZ5S0JOdGV0NDdwLzhOd0RxZWZFMEVOWUFRb0g2?=
 =?utf-8?B?MmhJazNhMC9GRURJRnV3VTBhTXFTQWR6VG95SDM5dzlGMURFMDRhWUJCek5z?=
 =?utf-8?B?Q2NibDY3eUlzTjUrODBjTVB4SEJOQmh5aWR3Z2pGRGxIQUZlMy9MbUk2ZW1B?=
 =?utf-8?B?TUl2UUVlalJ3dVk2SEw5QURXcXNDQ0E0bXp4M3o1V2tIL0hJL3lPSlI2STlR?=
 =?utf-8?B?OHFBTStVUEk5ODdOZ3JkMGYyWG9ENmR3QVlmejhXaU50VUNlWUc4QXhHaWQw?=
 =?utf-8?B?enY0cGJ4QkFsUHVOaGJrRlF4ZHZzS0hNZWg0L3RxQlYyb2xQalB0OG5pTHpx?=
 =?utf-8?B?dE1vNFNZOFFHenBSdzdBZVk4WEJxNG5Td2tJTVhxSjFlbHRYOE9VcVBxVWFj?=
 =?utf-8?B?R1VaQ21zbjh3WFc0RXZLUFY1KzlHMVZqWnV1L1I4ZEMyY0x5dnFMMjFUYnJl?=
 =?utf-8?B?dkhld3hJZWlqOEJBZnFKR3IwcTc4MENpN0hvZy9xQ3JLeTB1UWVvSnJMNHRj?=
 =?utf-8?B?LzNtcStEei9UOGlod0Voamdqdkt2NWxqWnN3VStPaWw4bm5jSzZyaGlkTURT?=
 =?utf-8?B?RUk5Slp1OGtJZy95WGtQRjVCM3pNWTJuWkZFRWhROWJIZFlJZGNleE41T0lR?=
 =?utf-8?B?cDFUU0orbXpsUjlRRmJCa0NVZzFCYnRJbytHRDV4VmJqSG9iTVRjeG9hdFds?=
 =?utf-8?B?dytKR0xWckRiVUV2amhMZTkyTHFOaHhHSEJLNC9BR1U2L1VrVy9LbEdnaTN2?=
 =?utf-8?B?M3dkbHIxRHRtTnV2Y01WakJaZnEvbGdxckg0WU1WVHBNbi9MZDBJNk81Qmpu?=
 =?utf-8?B?L3dEWklmekN3K2tpL0kvczJkNi92cmhoNWpXcW42NEJzWmZ4U0FTNFpRZkVs?=
 =?utf-8?B?Y0YrTDV3MkZYRktoNm1MVktUTk5kSUtuMXIzN2o5a2ZPNDFsYUJzWThKSjJR?=
 =?utf-8?B?V3phcDlJVzNPSGpDeitDYUo4WWRYekhBa3h5Mzl5ZWpZcTNxbXcrRHlSdVgx?=
 =?utf-8?B?WE1uS1B4WWdxa09Zai80SDgwREs2SjVuSEI4WWIzcWdHQjJVR09PWGJHM01t?=
 =?utf-8?B?ZE0zWEJZaTQycHRLVWlKTFRZNnZJclAzUURjeGJMWVMyeEZZQkl1SXBCSWxu?=
 =?utf-8?B?YW95Vk5OVzZ3QjFmWi9YWnFpSzVUSzFQd1dnUCtDNEVSOUU1aU51MHdFU2Fu?=
 =?utf-8?B?R1lRT2JGdmwrRDdDRUJicHZEOTV6MkoyRzBiZHFuWDE3NEtNNmlpNUVNd0F0?=
 =?utf-8?B?aHBuSmovY1ZCbzhTQzdEYjBIZGxPKzdTUlJISDdzU1dPYmxaWXluckRweHFt?=
 =?utf-8?B?dnVOaUV6VzlYT0gzeTYzNURaamdBVUgxdFNqS2FSRmFwN2RoUXRkZ1lDUFRZ?=
 =?utf-8?B?RGZ6QUVHL3EvT2VlbS80TUlLd1BlYzkxelZPTjd4TCtHamQ5bTNnNHkrMVpY?=
 =?utf-8?B?aUtndmlvYlh3b1Q4N3NDTHdFeW1DYk44V3N1OVgydm5BS3kwNHJNRGJyNEY0?=
 =?utf-8?B?eGpZOTR2UXhJanl2bEhabGNWM3U5Y0dsV0kybWZCd253ZjJ1aDR4WjZrMzRv?=
 =?utf-8?B?bFdPTlRhemlWbUlIV0tBenJwcGtGN2g4cnNER29WSkNEQTRlanQ3WldqLzhW?=
 =?utf-8?B?TGZ4ZVNDbDlXTXdRK29JSVpKZHIvTkcra1p0UVBHOWl5dHBFeFVhODhKZ1N4?=
 =?utf-8?B?dWp2d2lBZlh5NDA3NXFVNnFZRzlsNGVXWm5jS25rajlOOXJnZ3ZRUm8zRG9Z?=
 =?utf-8?B?R0RHTjNVWFVDaS9YWEprSC9mRkdYQy9YcUF6ZHN3SDNxVDVPRDhqK284UHpR?=
 =?utf-8?B?N3NTSW1LNHBkWmZweEMxZVUxVDQ3eTN6RmNyWEtEN1gvcFdzVGdtS1I3NlAr?=
 =?utf-8?B?UlBteUlSakhpdGFOTVorRkJjQ2ZhQXpKMEIyRmRyMUMvVE44TmpIbFErV2w1?=
 =?utf-8?B?RWx2ZWp3dTA0bmhha0VlNmF0QXptVHFZeWhuZ3ZlSG5nOVNLbnNZUk1wQ1Nh?=
 =?utf-8?B?SEtMNmJ6R2dqTXJqOWJQMGZidXpncnBSR0hWNFBWNnp2M2RtV3NGRlRNcWtI?=
 =?utf-8?Q?YbAa97Bp1VGt3FvA=3D?=
X-Exchange-RoutingPolicyChecked: OarsKcldxI6rjLGlhSfA40/0BCQ5m/vDmHRUFAPRithHiI+d3lc9bedNPDxVVSPFqJg7pnW7CjsCe+C922IkpW3ArZoyVdO7mmWldq+WfXNN3dlqG0UX02n/n5bNxRv8l/1zAsKfUwNtuo0Orf1AeNSQr9ZoXZCBXNiTfNYfAURdSXKmptjRBNaUqdCOf6L3Q7yDusC9kU7rwyLshJm+SmGJCDopmd3seHhDTMaQ1NCfpEjDn2+FSPGKPzjzzqMon++JEpKEZ+FX6DMVH5RHqVukevoAUhIQ8BmrRSf2m7rFU77n2vFwHg8GIxbj6nL4XXe85B5g8qu1tIlS9BcaXw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 6bf3aadb-f900-4d59-674b-08deb72aa1bf
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6129.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2026 11:18:06.6407
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mHVXAn6ueWT0YBdwSnJ+sPF4Z4h8z97mxHnk76kqNzpmkioub66ebGiI4G9M4wUYV2sQNg/u2RCBI8Kt+mIm1HoLblqTSbuAr7pRsiVLZ6c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB9453
X-OriginatorOrg: intel.com
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-109028-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[igalia.com,gmail.com,amd.com,linux.intel.com,kernel.org,ffwll.ch,suse.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[amd.com,emersion.fr,intel.com,kde.org,collabora.com,bootlin.com,linux.dev,lists.freedesktop.org,igalia.com,oss.qualcomm.com,kernel.org,gmail.com,poorly.run,somainline.org,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[29];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,intel.com:email,intel.com:mid,intel.com:dkim,igalia.com:email];
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
X-Rspamd-Queue-Id: 209F15A3E11
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 5/20/2026 2:39 AM, Melissa Wen wrote:
> As it's not immutable anymore, any changes should be handled by
> drm_colorop_state. Move their enum and make it correctly behaves as
> mutable.
> 
> Reviewed-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
> Signed-off-by: Melissa Wen <mwen@igalia.com>
> 
> ---
> 
> v6:
> - check drm_object_property_get_default_value() before set interp props
> ---
>   drivers/gpu/drm/drm_atomic.c      |  4 ++--
>   drivers/gpu/drm/drm_atomic_uapi.c |  8 ++++----
>   drivers/gpu/drm/drm_colorop.c     | 16 ++++++++++++++--
>   include/drm/drm_colorop.h         | 28 ++++++++++++++--------------
>   4 files changed, 34 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
> index 659cf56150e5..b26212e719b2 100644
> --- a/drivers/gpu/drm/drm_atomic.c
> +++ b/drivers/gpu/drm/drm_atomic.c
> @@ -857,7 +857,7 @@ static void drm_atomic_colorop_print_state(struct drm_printer *p,
>   	case DRM_COLOROP_1D_LUT:
>   		drm_printf_indent(p, 1, "size=%d\n", colorop->size);
>   		drm_printf_indent(p, 1, "interpolation=%s\n",
> -				  drm_get_colorop_lut1d_interpolation_name(colorop->lut1d_interpolation));
> +				  drm_get_colorop_lut1d_interpolation_name(state->lut1d_interpolation));
>   		drm_printf_indent(p, 1, "data blob id=%d\n", state->data ? state->data->base.id : 0);
>   		break;
>   	case DRM_COLOROP_CTM_3X4:
> @@ -869,7 +869,7 @@ static void drm_atomic_colorop_print_state(struct drm_printer *p,
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
> index 764d12060666..b0a9a8094dfe 100644
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
> +		if(!drm_object_property_get_default_value(&colorop->base,
> +							  colorop->lut1d_interpolation_property,
> +							  &val));
> +			colorop_state->lut1d_interpolation = val;
> +	}
> +
> +	if (colorop->lut3d_interpolation_property) {
> +		if(!drm_object_property_get_default_value(&colorop->base,
> +							  colorop->lut3d_interpolation_property,
> +							  &val);
> +			colorop_state->lut3d_interpolation = val;
> +	}

I see you fixed the ; in the next patch, better to fix it within this 
patch. Also needs space between if and (.

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


