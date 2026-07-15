Return-Path: <linux-arm-msm+bounces-119279-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id KlhTLHOQV2qcXAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-119279-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 15:51:47 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EF19C75EFE6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 15:51:46 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=fYobczGp;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-119279-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-119279-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CE45C3190D93
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 13:45:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C6882F7EFD;
	Wed, 15 Jul 2026 13:45:22 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26B54314A6F;
	Wed, 15 Jul 2026 13:45:19 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784123122; cv=fail; b=NQdK56XhenWVf48D9GUcpFnwK6PtFabnDooJCLxox2f7J/NY2YpVAfckmNFgHi9ZXoYZxcId8btjEmsxflN4RkpltNLqL3HnBze0ABeyqLU3ikyIADzcxvkJSfYjdIiBVv9byLith3hl0exDEC13E6xGtyY0CRIlRo7yEFhiV/c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784123122; c=relaxed/simple;
	bh=5gqgUp/WL8uQpsxX62Xj3f6ibJ6zHvLp2Db+sLsMDU4=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=IOvMQBfRWLO2zTsa+RE9JxmSoEJsorhmgTVD3BDyFXkSiC8YBvWcOeOUx7sDWFhJmiCmnDJMVK0jBpWG73RVHuB5ezRse8KljjKYcN5VX9Ns+EsqV4mfrDvBWTXAKdYzjQKQlP9NbfwGULh42nPx1NLt3n0wQrAjt5+WmqfpLVM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fYobczGp; arc=fail smtp.client-ip=198.175.65.18
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784123120; x=1815659120;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=5gqgUp/WL8uQpsxX62Xj3f6ibJ6zHvLp2Db+sLsMDU4=;
  b=fYobczGpvd5KmgwXwmrCpgP6wud8uKYTXA4mwYunPYnHvO+sCqAYlQ9D
   RhPfJRKM75+OPXLksIPhH2urg7OP7x3t9EsB+uNq2vNS/lQa5bK1tbCT4
   FPJCLvey/LYlEnSYouitMxvYRTZMaf76g1x/Bj5vnqci2DsTESJmLzTNE
   O6iwOsd242O8MTCa4cn9NbqiTHtFfdz0ZPoD9W4A1aa/fJcEBor3nj6ar
   pok6Fh6VMZXeHNQA+FZ/qQtKzMqElE4rxxbWE8owG9wFjhVOYv4lGX+uD
   mnIeBuxkCkjJCy7g78x2YTxSUHmujoEeYiiyJZIAuAXp7ZyzEaTqn+QVB
   g==;
X-CSE-ConnectionGUID: 34KprxSvSS6au3OxLtvg3Q==
X-CSE-MsgGUID: UH+OXNKFQo+20wFz7eMFpQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="84850537"
X-IronPort-AV: E=Sophos;i="6.25,165,1779174000"; 
   d="scan'208";a="84850537"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2026 06:45:13 -0700
X-CSE-ConnectionGUID: Q0cl/buvSB+WYdz0Cxr2Pw==
X-CSE-MsgGUID: nxXMIGnSRlWNhZjcqx6VPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,165,1779174000"; 
   d="scan'208";a="256835268"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2026 06:45:13 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 15 Jul 2026 06:45:12 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Wed, 15 Jul 2026 06:45:12 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.71) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 15 Jul 2026 06:45:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sGtMwS+VNSZ0XipLsM+oFL6iTEPGLE1P8td018mP/4+ixjGXczzyI97a/PZ1Nv08gKGtZP3gDqOK7wAOmWX+tyfovicP4c79GTLhk9v9FcD37jqpv2Eel1+6bBIxm4GDQlThjUESrdtiHh6MLbXDjzReNjPoeSfcA6jgWVzYK5xtzg5pFx6+Bvw8ewNGLLzHvGNckxmH7CyxzAhEcURBEK2OIN+uSc3UgUqvU/i7TFIspGMHz/nNffrM1M+EREAEIokYXUYitSv+DDI98LPSaZB1feDnx5wD5QqHXEFou39K2dX1zOrtBihW+iWYSZrG/CrK7KXmpqCRhZQ1fJaEkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AjHKr6iRe+VgIRPezmjl/vjb+UyEY9RqfRX8m/t/Knk=;
 b=GmRy0+LNz0Fh4Bmf2/rd2bedkhm86OC4YdszpM6eU9cVgzABP6l1YgihO1Aqcyup8NUIlZLYsYHL9xYk/9DYPm9IM6v8LSEpVxSP320+A450+koMz5wGduZjy5ihViveS29GM1/oof+RMrtKEA6+q+8vednBzlQpnTbuRWdp219R9/hxuwHrDdBCLepgkPzWGpAGgXGJFM32rzcBj1W0Lu1aMG//2QbvJtCfG5IAuI2ZXBN21sDsSH0gftqNL+IzeOZPRttPAjyZ1cYy/ghC19LOtoEoTTv53ZU+37C4ZBw0GJOT18jDCpaUqMma31f37alG3xlBS8KVEby0Xb4cFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA1PR11MB6967.namprd11.prod.outlook.com (2603:10b6:806:2bb::15)
 by CH3PR11MB7722.namprd11.prod.outlook.com (2603:10b6:610:122::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.12; Wed, 15 Jul
 2026 13:45:07 +0000
Received: from SA1PR11MB6967.namprd11.prod.outlook.com
 ([fe80::36a9:3aca:a63e:c8f4]) by SA1PR11MB6967.namprd11.prod.outlook.com
 ([fe80::36a9:3aca:a63e:c8f4%3]) with mapi id 15.21.0223.008; Wed, 15 Jul 2026
 13:45:07 +0000
Message-ID: <367e9b6f-da60-4b59-995d-3f3a07231447@intel.com>
Date: Wed, 15 Jul 2026 15:45:01 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] ASoC: codecs: lpass-{wsa,va}-macro: check
 clk_set_rate() return value
To: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
CC: <linux-sound@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Konrad Dybcio
	<konrad.dybcio@oss.qualcomm.com>, Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
References: <20260715-xo-sd-codec-wsa-va-clk-set-rate-v2-0-16ca64c2b929@oss.qualcomm.com>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <20260715-xo-sd-codec-wsa-va-clk-set-rate-v2-0-16ca64c2b929@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VIUP296CA0160.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:35d::17) To SA1PR11MB6967.namprd11.prod.outlook.com
 (2603:10b6:806:2bb::15)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB6967:EE_|CH3PR11MB7722:EE_
X-MS-Office365-Filtering-Correlation-Id: 11cca031-cb9e-4c7e-a411-08dee2774804
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014|23010399003|11063799006|56012099006|18002099003|22082099003|6133799003|10067099003;
X-Microsoft-Antispam-Message-Info: myI2WsuyHxYyUs6uOSEPxTXznssDPG+3jwzTUqqNA+SMrkZraojA43KBpVrClaYLHuNDU/7SEtLwPr58qvDpoazlN/jSA9Y/3x6ASNaFO0/rULEqBP81EvzA0A8GK4MkVchiXmYCvWoBE3aEoMyxUi2ymR+i8XkVRVOXf+JxdiWzdEJSRjmgD3V7Yv+S2Bvurm2mdIVxcH/i/Yo/p/vBctnTA52zzYeUR+2iBrdXkAakQA/gV5GyEXAeK2Ijq1rQiDZAvf0jd9QKUhlFwkpvNu/3r0yfqMxPWNNuvMUEu0nhszudF7suzVKBkGadrLxxQQrjC3oq50IkgahR+qoMK8ffKE1zDOOO2LE5WDtAr81OUgyWA1B50/WctdoLBHELzOcuLnoyRwqHX8E8QoqRnFIYOWlqYwI57c3o2cjqViwqXbycMjA8f6F0dXk7F5RvG62n3W53ZgAZ2g2gAaVOf2ZBsi5kkrUjjUtb7bKQg8LZ9dmTVwsCoR56YjrtUz6BIexkF+1fm7nRf6jkzOAyfeN2XdfBTWVfZrO0guwwqw96OgEq1SyaX3aSsTbcjTdd0WiVy3d2dq8xWtU2gkE+255kdUbmVRJ3glgNw5lNQvM66deJeOmALtYPJgAXeiq6
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR11MB6967.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(23010399003)(11063799006)(56012099006)(18002099003)(22082099003)(6133799003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R1BkeVI0cmExVDRhRFE3TFpXMityNCtRcSt3QTErWHZLK0dBUkNYcmNlNzd6?=
 =?utf-8?B?QnhFSk9vbStXYzV1VldiMHY1Y3BQYkpMSytSM2tzS0xydEFrZWlTbENjREgz?=
 =?utf-8?B?dnlOYlZvNzNRODJoYmYyaldOM3JhRC9KSDIvUkwvdGhra0U2WXk3VFBhMnJp?=
 =?utf-8?B?TDFlckdUaDJGUURjS3BPRVc0SkJNUllSTjNoK0o0cGdhaHA5MktPZTNIMDhH?=
 =?utf-8?B?bVJhbjdBU1g3Q1pmWXVCVFV0ZEV6RzFRa1E3aFpIYWE0cEt0ZjB3TVIrR2c4?=
 =?utf-8?B?YjkrblVqdHFNQkQyZzl5U1QwZlp3TlczKzA2MVJEZm9BL0dXZkRlVFFrU1g1?=
 =?utf-8?B?TGY5NHdOUnZCWEE0TDVHcUxNSzlMNlo4WmZZOURqNnJSZXpuc0VmUWtJSEha?=
 =?utf-8?B?OW42eFo1SHVWNE51d0RQWU53VEhoUXJrOHhzZW1EZmlzczZXOVJIVCttWVpy?=
 =?utf-8?B?bU96STZxYzBxcTVOa0FtQWR1ZEUxc25DdDdsakdkOGlWc1F0VUk5bkxFL0x6?=
 =?utf-8?B?SUxPY3FzNnRWdlA2ZW9rTTMrYWlHSGE5NXA1RFRKQkZCVDA5bjU4WXc4VjZ3?=
 =?utf-8?B?NkYxbXpHem96WnRIdHVjbHA0Tm5DMk9LMDNNSGJUb3l2U3BMejZrZWlKTXVk?=
 =?utf-8?B?YUF5RitnWFpzQklSTWE0MHlKak54MEZucGFWWnpWQzYwSXlvcXJHR3ZlMGxi?=
 =?utf-8?B?Q3htYkFaN3RmeU40R3BaY0ZLUGsrRUhzZnQxMlgzR2xJdTVkcDJJZmx4NVFw?=
 =?utf-8?B?OTRseG9mZG85TnFoNGF2Mnp1TUNoS2UyR3d4a29MSHpQOUsyVFVKZDdhVUxE?=
 =?utf-8?B?Y0F1ME5rczJudjZpMEllei9VUmJicTZLQ25SaHVjSjVEK0g3eEpzOUtHSWFl?=
 =?utf-8?B?WjZSL2pyV3RocC96bWt2ajRQYmxTckJTajAwVDE5WE1rN1FRMnQrN1Zsa1RI?=
 =?utf-8?B?TFZoMWlsNkpSYjJMYjNoeG41OVgyTEd2K1NLU0drZXJWQ3UyR1ExVXpZTUdJ?=
 =?utf-8?B?WU56TmQxVzBIMlJTWklLZFNJeHpYK3UyL3c5QktIekxCUFp3RWg4a0ZOQytW?=
 =?utf-8?B?b09uOTRBQllLU1NGYW8rRzIvOGNyZnpHWXV6T0hScVVVRGhJZkRFNzB1Y01u?=
 =?utf-8?B?ZXh4ZW9aZGp2V1VCY2tBOUZwRjRDWkxJNE80clM2VnJyUGpuOGV5UVV5RGRI?=
 =?utf-8?B?MklNVytKNWhtRFZMQi94TWNLOVp6aHpjKzl0TkpRQklvUHUyMVNuWGx4ek91?=
 =?utf-8?B?NUJGMkJ5YitqazRQRTZMWkdoYjZTekZjb3p5QjJiQUc5OHJlMFZobWtIMk12?=
 =?utf-8?B?UFNaUVVrcFo4NWFHZEpuR3MycFlXUHVxNDBsZWxKSy9TeEtUVC9SOWttUGR6?=
 =?utf-8?B?eTRsT1g4cUVQNXFnS1BZbHQ5R21YZkQxc2U2WTB0U3ZtYlVFU0dHUHpORm8w?=
 =?utf-8?B?cm83RXUvc3NvYzczenpqQ096Q3dxYlNjQWFtRVFGcDhLKzJqaDFkSTYwZ1Fk?=
 =?utf-8?B?VWdRZlNkdjVaYTVwT2hoSHZtZzZjY0RDM0hqZTlNM0VWK3BzNTA0ZE1wVzAz?=
 =?utf-8?B?b2pKK2ZhVkxCeUpGYnQwNHhxc1piaUI0OW80QU5RRG81bVpyNjZ6eWtBUmxm?=
 =?utf-8?B?YUxHRnBGRTBCVldBKzRpQ3ZpVXk4THhnY1VENGkvdlFVQ3RwZ2t4dHVmam4r?=
 =?utf-8?B?Ui9Hc2FsUllNb21KWjNQd0gyRzN4ZlhIVkJNMlZyUGxwdGg2RFpmT1ZwakFE?=
 =?utf-8?B?OXNTSk42OGNlTGlSQUtGTWpRNHdLak1JU3hnRHphczh3bVYrUGlUZzZSQThu?=
 =?utf-8?B?a1VsSVVJZUlUajhMdENGTHdQOGNkZy8rYi9HZW9LZDVqTzF0ZjRlTmhRSTUx?=
 =?utf-8?B?M0VaakFxQnpQcHJrRUp0YUtQQkJtYkdRWGZueU9pR2YrUHBLS09jVkIyUDV2?=
 =?utf-8?B?bWJKVmd0UmY4czY2aFVxVUl3UEoxRm5nQjdxSkxvaytobXBJelUvQTYwaVQ0?=
 =?utf-8?B?QnFHVXZxSUVqOEhoNERuaGdmSVdsYmw3YVliN29lb0VUTkVhTWEwYVpJOHF3?=
 =?utf-8?B?RUwwdDA1c2JWN05wZVp0Um5oQ0VpZFFEMTJQNkk5a1NqdUtWbHVwR1pqNmtq?=
 =?utf-8?B?Rmpwd3V4bDZrZXVEdW1IWUtraE9PMy9xN2dwaFNqUzdQNTFsZmJtQlR2M1Na?=
 =?utf-8?B?OW1XSHg5NXhsUGxzcklRbGVkZ2lzOVZMMTVjWjIvK2N2eU9IKzBGeVU5eW5v?=
 =?utf-8?B?eVI2Smh5c2U5NTE5bzROd002dEpzUHcxRzlHYWRyTVRyb1Z2Wm15ZzJrM3Bp?=
 =?utf-8?B?MEhIRFRtc2xSZmwrUnQ4ZWo0eThLellNVHBwcjl1NkZSYWZ3RW1Tb3NzN0h6?=
 =?utf-8?Q?8PXRlAR3GxR7Ozf4=3D?=
X-Exchange-RoutingPolicyChecked: THPnuPPw0Gw2SryZhTSWM0B+l4YI0WzjFgdQ/l3U0BTowoyLRi9dXq7z6oyb+hpdK6OVw27bwDv8UNEoWzlzQgEghlGmQayjt4OV4DJC5pI+X7RWMfqydCfMxODul0dBcPt9VOrwF8YhYTbWHpQFtH48nn/76RPtErzMzkaKu2f3gmSt/LZis+5pS95/LbzepwG/t1nKhEdmKosH4j/OZ7Y01UENKBRriNCv15dOaNXk9p3tf7KGn+Z7KbD3Dlc8tDBS8Af5rwDALo0t2OqiKH4nlwN7e3RDiZ2oqATKG5Up4+a7rc53qFQCc76Uev9ezL0f+ytEX+BybtQmHVv6bg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 11cca031-cb9e-4c7e-a411-08dee2774804
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6967.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2026 13:45:07.2290
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nCXhMs/myw/yj35jREzTRyVd1F79dfY1736X3MCdzx0XgHD8Cfk/eofjUYkDPN1HRPyO3uCNfJEmgwyatwgWE6cI+UId1QhkxqHEe4kEfTA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7722
X-OriginatorOrg: intel.com
X-Spamd-Result: default: False [-3.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[intel.com:d:+,kernel.org:s:+];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-119279-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[vger.kernel.org,oss.qualcomm.com,kernel.org,gmail.com,perex.cz,suse.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,intel.com:dkim,intel.com:email,intel.com:mid,intel.com:from_mime];
	FORGED_SENDER(0.00)[cezary.rojewski@intel.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:ajay.nandam@oss.qualcomm.com,m:linux-sound@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:konrad.dybcio@oss.qualcomm.com,m:srini@kernel.org,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:perex@perex.cz,m:tiwai@suse.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[cezary.rojewski@intel.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[100.90.174.1:received,198.175.65.18:received,10.18.126.91:received,10.1.192.144:received,10.18.126.92:received];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_SEVEN(0.00)[10];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EF19C75EFE6
X-Rspamd-Action: no action

On 7/15/2026 1:55 PM, Ajay Kumar Nandam wrote:
> clk_set_rate() returns 0 on success or a negative errno on failure but
> the WSA and VA macro probe functions are ignoring it. This series adds
> return value checking and bails out of probe on failure.
> 
> This mirrors the same fix already posted for the TX and RX macros [1].
> 
> [1] https://lore.kernel.org/all/20260707-xo-sd-codec-tx-rx-v2-3-f61b4622f97f@oss.qualcomm.com/
> 
> Signed-off-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
> ---
> Changes in v2:
> - Use present tense in commit messages
> - Carry Reviewed-by tag from Konrad
> - Link to v1: https://patch.msgid.link/20260715-xo-sd-codec-wsa-va-clk-set-rate-v1-0-f0c713ff0b4e@oss.qualcomm.com
Not CC'ing reviewers is frowned upon on the list.

Nonetheless, thank you for addressing the comments. For the series:

Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>

