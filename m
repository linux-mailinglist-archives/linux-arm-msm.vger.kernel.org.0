Return-Path: <linux-arm-msm+bounces-31389-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 28327972B22
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Sep 2024 09:48:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AFC6E1F25185
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Sep 2024 07:48:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96B6C17E00F;
	Tue, 10 Sep 2024 07:48:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mUQElsVC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CADD5178372;
	Tue, 10 Sep 2024 07:48:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725954497; cv=fail; b=KRQVwZ9NcdsWREkdkSgHI/+rcGWlnuL7X6U0ggzFoPOBmOYv1R72AQ1UKEGDbry4P2pbxgZWdvE5d7LniLujZ3AdnDk5r3t9gcu9WXWoaNjf0EOqMYaMyXSPlvZivfZkqs6iM7ODIiM6E2YhxH21M7Vdfs0ggU7bqgEzce26z6c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725954497; c=relaxed/simple;
	bh=Ltb2QxyKlJH7s7QfIWO1633cCOs1/fdrHxIQcvDZNUw=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Nm4DN1s7Pl/z2lZkAJUyX8zmELSnaQyedhkwuo6DVSv1PsOANvuqK9SsiWGxW4qLsMi1tKGpYPs6HR6VcZVd5X17mkqRkXBLXxYP5d9lN/UxM0bo4CtV5QCV29qFqD8Sz6e9t0/g7RqaFR5usD9xwY4wAqmWFsR/Gnv6aks2ze8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mUQElsVC; arc=fail smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725954496; x=1757490496;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=Ltb2QxyKlJH7s7QfIWO1633cCOs1/fdrHxIQcvDZNUw=;
  b=mUQElsVCkPsg9OPGgjY9ck8Ke4/RN68EAPO26w/96jBfU/FQZknRjVyc
   P/tUa/ONKqe0vqwRLMAfUzqf0gyYJ+7+EsMk/Yd9UKaYptjmCpeTrP6d3
   pq+jv7dyVT+atUbebuqO2EsX9SoSXjVNasaGQgEmE+bFlU9FiwLYL8WoA
   6tYLXPsPR/j17Twfu2ooA7qEaYYjgjkR2SQ1LAYMHlLpJZnOzwqpac2W8
   MPr4AP5668KhmZ/bEKzCdQKmbXrFZGWqxqDeUn6WMAInY98EgVQyoS5C1
   BOfMI0Hqe+AuUqv4dslw5IlAHT6eTjzEWuW72AnQ1iYjCe4x23BFepnP+
   g==;
X-CSE-ConnectionGUID: 7MPYNgfcQXyLmO9eDCaScg==
X-CSE-MsgGUID: YfEfJrgeTlu3jnC0Jm3iEQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11190"; a="24230706"
X-IronPort-AV: E=Sophos;i="6.10,216,1719903600"; 
   d="scan'208";a="24230706"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2024 00:48:15 -0700
X-CSE-ConnectionGUID: yZ4ikExKQ52VXraMJ+xTzg==
X-CSE-MsgGUID: YwK01JooRDazURwH00ojFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,216,1719903600"; 
   d="scan'208";a="67189050"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 10 Sep 2024 00:48:14 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 10 Sep 2024 00:48:14 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 10 Sep 2024 00:48:14 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.174)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 10 Sep 2024 00:48:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Tv/IsiOezOK1GiGd6nDpxYBzYeHqocO4YHyydzOb7wnajJ2r6Z9PrHyulvObrQWFBSdWAEybVN8mKeTGgH9sA/tlHcHBWlgn4PfS6ReCR4vqWB2ZpNJgV0jxKh6qch8h3H3bqbbtMExcFAVziOUU356Un5h3AyJl8bsKUbgqDAkmyrpGVnq3w9EygYWFMz7SKwCfqJ0wXjh3+MG1FYPeAiKAf0rQF5C8/4kY5QHfxxOzTblu1AbiAsVqkgu6OfJGAF8Ctw0fXOSpluu7ztybiqSfQGcBj6dwN1X+0jomaVkD9rqb+BFLdlLygY1Shgl8W2JYOlqeZGlem6wAXLnWvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8MNi87GPo4KW29E2uE48flXpk5ACnzi6LqILitimsoA=;
 b=ZH37FpuwZwOBKz3RxRxomL6qNVzQe6TTMU7IiFxA2nMuwSjL1qKoTNQsCUutqB0l+CNl+MpuRipxphV36uA7srQsj2JSnS2IYDNtuLEC6Ndvwtal7c31DGeLjicVHZQojDFTN9jLmxPy2Tw6GQCOQr8kqNPh71hU6AJkyqCIg001INtFQAlUBz5XgWgix+orjfxwgvHb0NkLCojQKh92GtxG3fgVavkWYMHVIxto6bFd4pAXjqA6ji6tluE7i1s0m9CChWnWsD+IycdGxUXBTOyxk6D/LFRWz5RQz0gF7Ly3Z7yPmQocTWrFMkoy6z+L0zT0zC4hrfnIDgGtvTqbFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6375.namprd11.prod.outlook.com (2603:10b6:8:c9::21) by
 SJ2PR11MB7428.namprd11.prod.outlook.com (2603:10b6:a03:4cf::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7939.22; Tue, 10 Sep 2024 07:48:11 +0000
Received: from DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::cd01:59f6:b0f8:c832]) by DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::cd01:59f6:b0f8:c832%6]) with mapi id 15.20.7918.024; Tue, 10 Sep 2024
 07:48:11 +0000
Message-ID: <011edf7b-5787-4e35-bf61-ebe356ccfe1a@intel.com>
Date: Tue, 10 Sep 2024 09:47:59 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/13] ASoC: Intel: avs: drop SNDRV_PCM_RATE_KNOT
To: Jerome Brunet <jbrunet@baylibre.com>
CC: <linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<patches@opensource.cirrus.com>, <alsa-devel@alsa-project.org>,
	<linux-arm-msm@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-sunxi@lists.linux.dev>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
	<tiwai@suse.com>, David Rhodes <david.rhodes@cirrus.com>, Richard Fitzgerald
	<rf@opensource.cirrus.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown
	<broonie@kernel.org>, Pierre-Louis Bossart
	<pierre-louis.bossart@linux.intel.com>, Liam Girdwood
	<liam.r.girdwood@linux.intel.com>, Peter Ujfalusi
	<peter.ujfalusi@linux.intel.com>, Bard Liao
	<yung-chuan.liao@linux.intel.com>, Ranjani Sridharan
	<ranjani.sridharan@linux.intel.com>, Kai Vehmanen
	<kai.vehmanen@linux.intel.com>, Srinivas Kandagatla
	<srinivas.kandagatla@linaro.org>, Chen-Yu Tsai <wens@csie.org>, "Jernej
 Skrabec" <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>
References: <20240905-alsa-12-24-128-v1-0-8371948d3921@baylibre.com>
 <20240905-alsa-12-24-128-v1-9-8371948d3921@baylibre.com>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <20240905-alsa-12-24-128-v1-9-8371948d3921@baylibre.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: ZR0P278CA0151.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:41::12) To DS0PR11MB6375.namprd11.prod.outlook.com
 (2603:10b6:8:c9::21)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6375:EE_|SJ2PR11MB7428:EE_
X-MS-Office365-Filtering-Correlation-Id: 156cda47-9225-445b-aad8-08dcd16ceafa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?U0pPWGJKcFpTZWxGb2MvSTVjYmV6bWdKTTZKa3dzdk5iTTNtb084QzFzVmw0?=
 =?utf-8?B?bFRKWENnZjdoZ0xhNTZRakxQMWIzL2NyZDVSc0t3dzZSMFRBYTNWT0VGK09J?=
 =?utf-8?B?TXF1eWpTMjd3Y3FtbjVDWERRT1ZoRDRka1M2VzhqRDBBRGJJSjZPaU5YdjBI?=
 =?utf-8?B?aUtwL2lrVTRpbnAzZE9KTkJQWTFhbDFNQWprcWNyT1k5RUdWSnJxQmVYS3lp?=
 =?utf-8?B?bVBlVmtvbEhaOHB0Z3hXWGo3dU1YaWhOUXU0TkZTb3YweDFTMVVpMU9xdkZl?=
 =?utf-8?B?UEtMTlkzaTU3aHVkS1NiT2U3Nkoxay9Ya054bDFYb2gwdiswSUU0N2p2REtt?=
 =?utf-8?B?cm1MbFk5OWVsc2ExMng3ZFM4ZFlOVnJVbmVKWERTa3AzR2xHUE1WZVI0QUFy?=
 =?utf-8?B?Y05xK3RpdWh3dFVzUjduOW41bzE5TUJGRTZZTUtwaFJXUVB4YkFrV0R3R2V2?=
 =?utf-8?B?cldHQlZoTHZxZXZPMDZtRlBCNFV5V3E3T1RUbzdwUDNpc0ZaaDNMTzV0eHRx?=
 =?utf-8?B?OElvV04rU2xVaG9NNGhiODUwdVhtMHNpakF0S2VlSlA2RVpVbWlsNXU1Ym9V?=
 =?utf-8?B?MFdXMW02Wm5COVZ3ZkZKMGpJcHVnWUw2cFYzSkFXaVJKTlBOd2l5b0xiM08y?=
 =?utf-8?B?QVh2UGVKM1UwNjZ6azJoZWtLODUrUDlvOUZCVFIwdTNYMzdPRGR0R3BQUVRn?=
 =?utf-8?B?eUUyeHdUN3FHR1MzY2U0akJYbWxNS0U5dkg1YXRKTFY3cURxbGF1YUdYQXlt?=
 =?utf-8?B?dC9XdytPQVdhL01TNG1UUUIwU082NUdDS1VRVzB4OFJaMEZOdW5TZXZrOWp5?=
 =?utf-8?B?enVhOG43Zk1URHpmUDZrMnllWUZsY0grcjNjUlgyTC9URVBZSG1NeW1Zekpr?=
 =?utf-8?B?aWlrUHZlSkdkWkNIMDBTSDN5TFRMeG5ER2k5OHdkelVSZEpwOHhCT05pTmMw?=
 =?utf-8?B?Mmg0dXJ6NUF4aDl2amJjOXIydG9uc3AyVTZ1UFhOdXA3TVpkbHNFcGhEL09L?=
 =?utf-8?B?d1JVUDRCTG5MRW9hbUYxUTJzOTRYSEN0TkZYYlA5Um9KamFocmtKSi9EY2RI?=
 =?utf-8?B?SzNVQmdBOEEyNUV4M1RJUDg5d2JlbG1rL2pycmNwLzdMNUVrT3RnaHE0Vmpk?=
 =?utf-8?B?a2o3c1NhK1FvWWpLUHFvWDJNMWZpNW9CMUpJTnBCL0VYVnNZOHJIcDFNakRo?=
 =?utf-8?B?bCtrT0NCL1FKeE11RnIxb2ZrVEZvMDkyQllrUHlWaC9UUFpqWGhtMUV5UGJX?=
 =?utf-8?B?bUxxMHhWeldseDZzbnNJbEJIUUROUjUxN1ZVRmRPNTUzSkxlMi9LcXlDZ1R2?=
 =?utf-8?B?VmIwWGgrTlVBdXRlSzVpZDRHditFN04zRjQyZTJ0Qjk3dWs5V1NoQkV5bk1j?=
 =?utf-8?B?clY2SStNY1BCWWEyNFhLSThNUzdiSmRsZC9KNDNRQ3BCd3pZS3Z1N1hIUzdZ?=
 =?utf-8?B?cTBUUGxKRXlGNVBnOEt6UHlyZzVEQkVwRkJJcE9BZWdkbGtCU28rczE2ZHF6?=
 =?utf-8?B?amRQS0ZKS29zOWZSL0FzQnd0dHVqaUZKcGVvOTIxRWdpbkpKUEdYRytVU2Mv?=
 =?utf-8?B?SGVFOElRKzkvdEpJUHNKb0dySzNtSjF0a1JYM2FnNmxNNUFFY1gzNERiTTBQ?=
 =?utf-8?B?VG9yMTF6Uk5JUWthSU84MTlNS3AwMU14MDhHbkIxenpLQ2NNSjJ6MHVHdHQz?=
 =?utf-8?B?d0cyK2tZUG5XdnF0bUFKSXJLMkRIeTlaS2ZYdVVUUHRMMHh3TzkzUjJJcmdj?=
 =?utf-8?B?L1VuY1lualdZR3EwMkMrVG9mUE9sdkdHdjhQYjhOdUR1bFVyM01Yd2xFSUNK?=
 =?utf-8?B?eVYyNjdDNWhUZkVFZGtXQT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6375.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aXY1VVdJWmJFaFA3Mi92VmpGM0tzMUorZkEyb0VNRkRZM3ZBbkI2QVdZajFj?=
 =?utf-8?B?NDllVi9NZGRuTktJYmRkalRDaXdtSmhDbWlGU3BHcGhlWUN6L2hWSndScHhI?=
 =?utf-8?B?ZVUxemZaL2d6dXNidFo1N29WZU5XWFFlY3l0OFlSV21WdStPUnEwRnd5elBM?=
 =?utf-8?B?RmF0SmNtSkRYRDQxVVlUTlpDQ1k5NG12NTZBbkZIQ3d2RUt4UFBFUjNnRlFI?=
 =?utf-8?B?K1RJZk9Xd2NrVHVJTlhHMXArbHIwNnhrWlFFbUU2K3IvNEJsUkZVMEV2UlFj?=
 =?utf-8?B?MTBtR24rSUNWazc4ZkZ2QmgxQ1NFU3MrRkFkMURWb05yZlpkbU9RV2gzVEw0?=
 =?utf-8?B?T29uSlg1em1LTEhCelgxZS9PNktTUkprbVpwVkF1QUR1emtFL2N0N0l0aFcy?=
 =?utf-8?B?ZjBEWitVTzdrdjZEYjFuMktUTFF2U2xMbU1OZmNFd0lac1BQRndobDlMdVNo?=
 =?utf-8?B?VFJHU0xHcENDTVBmekYvOGNtT09qVWJPb0dob1lxTHM5djJUc2ZxTEtjNlF0?=
 =?utf-8?B?Rlk4NDN6NStTOVVqemlFV1IzUzFERFIwdVNOb0ZTNkJwclNESmtGcmhQWnh4?=
 =?utf-8?B?SzBpUWNOUnlTU25iblYrRjlvMTlZV1JHa3orSG0zc0Y4L1JyOTArL20zZWVm?=
 =?utf-8?B?YUlERWFVdzRLUS9UcGJxeXZvU0V4T242VlcySUl4eWl5Rnl6QWpIM1BlN0k0?=
 =?utf-8?B?TGJwcnZtS1lxc282eW5DUTFqY0k2RC9sTi9mSWZoeWM1OTl4THJMNUNwai9K?=
 =?utf-8?B?L21qUkpvb2ZhV0dHeC9JNGpjd1NQTjlxOUkvQUkyMjRXVkVCMHprYUE4emdK?=
 =?utf-8?B?KzNCcU9BVkYyUWhQb1NrQ3RvOVVFb1o1QWl4ZE12NWdoZDF5Q0dBempZeXNz?=
 =?utf-8?B?azZCdE5RVGJwSGxCQkwvSkh3YXM0Y3hPa2ZWcnNSQWNMMzl5U2kyaFAwdVdH?=
 =?utf-8?B?V2FFSWwwcUxNeWs2eWdHTnZtcFJsVVdJQUs3MlBpTHpqbGNVYWNUZ1FJTWVi?=
 =?utf-8?B?MGFZZWlQQ3NOK2FYdkR6YWxNYkZSQmYzcU9QTlFaUHorSm1LNCtUMU55WnJN?=
 =?utf-8?B?WklXbnJLakF4ZVNwcWpyNGxsU2JYSjNVWk9ZOTZ5cEJ0dlFtWmFYY1JxOUZ6?=
 =?utf-8?B?WEx5ck9YQTdvdnM1ejNjT3EvekhybVBkOXJxNS9pNlUzWFhWaHY2QTlnSTA0?=
 =?utf-8?B?OFozWnNHNldsQVVlRk1QT28yd0RKSkQ1clExTWt3TmxWOVdVTFFQWGl6c2Y5?=
 =?utf-8?B?cnFHZlByL2o3RUpSTk1kQUVSYTJQOGhnSmJ0QUhhS3JJVGx2cUo4bFpjSGJI?=
 =?utf-8?B?azdveDJHTEQwaE5pL3hLVWlpbzJQWmhhckszaWwrbW1WdERENkxrSmpTbTRx?=
 =?utf-8?B?dE51TTFRQnhTd1dHUVZ4WE4yandUa2RLa216TDJCUkFVL1VmcUlSdGpscWtm?=
 =?utf-8?B?eG1NNyswVHNpNHJsMWpTS2xwYVkyVVJ5S1E3T2xtVG5CWndRVmNLcXFCdTZZ?=
 =?utf-8?B?MU1YQkpCUjVTa1hMV21UaWtzNzdqbWRBSGZxYUZmYTIveWVLazE0Rk5YUFFL?=
 =?utf-8?B?aHV3UFZndHNzS0NuSGZlbzBTVFZGTnE2TWVqR0hVN0dsV3F6QkYvU2R0M1NV?=
 =?utf-8?B?UHFDQmR1MkZVeHR3ZzFiTDFuTGhiMTArZTRwdjM4WEliaWgvdHhhR29QQmJ4?=
 =?utf-8?B?OHdFcVNWelIrTGFwMlp3Zlh2Sk4wZGJMeVJZbDB4TTFxTVZFYlpqQkJnbkVy?=
 =?utf-8?B?a1hhbm5IQjhnYXMzVzl4U0ZGMnFCd24zdnFsazFTN2RWSktLY2JvTzNiLzh1?=
 =?utf-8?B?QmQxVzdZcnNkdHBOMEh2bGwrejdBOE1YOFpwZ1ZYYm40R1RMa2tQSHlFQkJZ?=
 =?utf-8?B?eWlUT1Z3NzRZSkhjZFgxaXZkbEtScU1CckdYWWY2SktjVHBLNkUyeDg0UVQz?=
 =?utf-8?B?d2VYYlN3RzBKc0UxbmFGWEQ1dTQwK2l2RCtCRlhXUkkwVG1ZOS9XUldwYWQr?=
 =?utf-8?B?OEkwNGMvRXVXWHV3ZXI5aUlMNm1GeU9LNHdKN05PMkwxbmRqbnNqRU8xaTAy?=
 =?utf-8?B?V2h6elRTUGhJbXJTZXdIbWxXR25NMHlaQ1FRYVA0dGhscTBlOG1DMEFwRmZF?=
 =?utf-8?B?UlRCdWFDeGdPbE5ITTdGVGtzcmU3TFVsZGZaTUtLbyt1N3VDL0V0Zi96TWV6?=
 =?utf-8?B?a3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 156cda47-9225-445b-aad8-08dcd16ceafa
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6375.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2024 07:48:11.1320
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TBVtAe6bQGiUvFdbJNIkJlcZN2HN9bai7oDSdSEPFuCT/frfH6iPJFWqEZbSMLbsLvy8vp5G8GhZ+Pz7gblXvkUlm1hN7P7f+zr2DJDo7AE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7428
X-OriginatorOrg: intel.com

On 2024-09-05 4:13 PM, Jerome Brunet wrote:
> The custom rate constraint list was necessary to support 12kHz, 24kHz and
> 128kHz. These rates are now available through SNDRV_PCM_RATE_12000,
> SNDRV_PCM_RATE_24000 and SNDRV_PCM_RATE_128000.
> 
> Use them and drop the custom rate constraint rule.
> 
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---

Thank you for this cleanup.

Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>

>   sound/soc/intel/avs/pcm.c | 22 ++++++----------------
>   1 file changed, 6 insertions(+), 16 deletions(-)
> 
> diff --git a/sound/soc/intel/avs/pcm.c b/sound/soc/intel/avs/pcm.c
> index c76b86254a8b..afc0fc74cf94 100644
> --- a/sound/soc/intel/avs/pcm.c
> +++ b/sound/soc/intel/avs/pcm.c
> @@ -471,16 +471,6 @@ static int hw_rule_param_size(struct snd_pcm_hw_params *params, struct snd_pcm_h
>   static int avs_pcm_hw_constraints_init(struct snd_pcm_substream *substream)
>   {
>   	struct snd_pcm_runtime *runtime = substream->runtime;
> -	static const unsigned int rates[] = {
> -		8000, 11025, 12000, 16000,
> -		22050, 24000, 32000, 44100,
> -		48000, 64000, 88200, 96000,
> -		128000, 176400, 192000,
> -	};
> -	static const struct snd_pcm_hw_constraint_list rate_list = {
> -		.count = ARRAY_SIZE(rates),
> -		.list = rates,
> -	};
>   	int ret;
>   
>   	ret = snd_pcm_hw_constraint_integer(runtime, SNDRV_PCM_HW_PARAM_PERIODS);
> @@ -492,10 +482,6 @@ static int avs_pcm_hw_constraints_init(struct snd_pcm_substream *substream)
>   	if (ret < 0)
>   		return ret;
>   
> -	ret = snd_pcm_hw_constraint_list(runtime, 0, SNDRV_PCM_HW_PARAM_RATE, &rate_list);
> -	if (ret < 0)
> -		return ret;
> -
>   	/* Adjust buffer and period size based on the audio format. */
>   	snd_pcm_hw_rule_add(runtime, 0, SNDRV_PCM_HW_PARAM_BUFFER_SIZE, hw_rule_param_size, NULL,
>   			    SNDRV_PCM_HW_PARAM_FORMAT, SNDRV_PCM_HW_PARAM_CHANNELS,
> @@ -1332,7 +1318,9 @@ static const struct snd_soc_dai_driver i2s_dai_template = {
>   		.channels_min	= 1,
>   		.channels_max	= 8,
>   		.rates		= SNDRV_PCM_RATE_8000_192000 |
> -				  SNDRV_PCM_RATE_KNOT,
> +				  SNDRV_PCM_RATE_12000 |
> +				  SNDRV_PCM_RATE_24000 |
> +				  SNDRV_PCM_RATE_128000,
>   		.formats	= SNDRV_PCM_FMTBIT_S16_LE |
>   				  SNDRV_PCM_FMTBIT_S32_LE,
>   		.subformats	= SNDRV_PCM_SUBFMTBIT_MSBITS_20 |
> @@ -1343,7 +1331,9 @@ static const struct snd_soc_dai_driver i2s_dai_template = {
>   		.channels_min	= 1,
>   		.channels_max	= 8,
>   		.rates		= SNDRV_PCM_RATE_8000_192000 |
> -				  SNDRV_PCM_RATE_KNOT,
> +				  SNDRV_PCM_RATE_12000 |
> +				  SNDRV_PCM_RATE_24000 |
> +				  SNDRV_PCM_RATE_128000,
>   		.formats	= SNDRV_PCM_FMTBIT_S16_LE |
>   				  SNDRV_PCM_FMTBIT_S32_LE,
>   		.subformats	= SNDRV_PCM_SUBFMTBIT_MSBITS_20 |
> 

