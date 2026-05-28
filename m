Return-Path: <linux-arm-msm+bounces-110067-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wZxvDywLGGqmbAgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110067-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2026 11:30:20 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F3565EF993
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2026 11:30:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 352E2300621C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2026 09:28:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71A9B3ACF1E;
	Thu, 28 May 2026 09:28:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Vg49YSfY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B5A93AC0D7;
	Thu, 28 May 2026 09:28:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779960495; cv=fail; b=GkBym+uXLWeowzSrS4ls7+dkTYz20jrVi0uePEug/4NVjOH0vhYlOy9O0foiE+6X68jZ9ngVHODRETe38tEbtl+0Gz0AglvbenZd/laNt9jQTsH+KPIVuQ6hJNcwZXoGulwtEubFi9GO7E813gPoQUojZF1JefvqWQB0zTZ+qII=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779960495; c=relaxed/simple;
	bh=JD2K5i9mamkzXITS/qIN341V2yEIi5ldK9Jd/Cm8nRE=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=iEmcY6ZSE9WZLKbh2HUdLn9aGe5QeEvpXgLbT/plR1OfRQrGm/buIkhnCyShS8okBu1ExDh0Y+10up73F+73jiNHOrsH3rotJAbsiSIT5sZg6TOQSJXh0U9FZqncHLX/LKdXy5lQqN8DyZLCKWn/QvTGOs/UrFr4LiKYlQn2Tp4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Vg49YSfY; arc=fail smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779960493; x=1811496493;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=JD2K5i9mamkzXITS/qIN341V2yEIi5ldK9Jd/Cm8nRE=;
  b=Vg49YSfYRjlRzILXWITlkq9ka+OU/+AARDja0C5v0g3uZNNEyVUpWPrr
   VhBsGEfDSyySu/3Rd8DE2KSMoTTQQTL2SSSGorYzvnGGeVdgoRRsh43EX
   nEATawFvckC07Et/levKDuZ2i9FlQGplIGHTxHwSMc6ds7vIYS0BIBpFn
   Buvav38wiRFaBK4MO04H6bpH2jQ8QiqfmnQnnzlpHeeosE7hDLu46lTEb
   wm3UlJsrMWM4BpIkC8il3xXA8mag164xG72hhInrzBzglvMf9+y4FgzFB
   3v3dZzObDW8bdjkVJOsgvVo7ajSNOmyON+X3jtXsUpV2ZJPNSHNvCWbuZ
   w==;
X-CSE-ConnectionGUID: HzVi0xZbQ1iLGeURjsFZwQ==
X-CSE-MsgGUID: asKLEKP8TEGGR6FD2YE/AA==
X-IronPort-AV: E=McAfee;i="6800,10657,11799"; a="84688716"
X-IronPort-AV: E=Sophos;i="6.24,173,1774335600"; 
   d="scan'208";a="84688716"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2026 02:28:12 -0700
X-CSE-ConnectionGUID: YaWjEIAIQtWkPyQ1NduepQ==
X-CSE-MsgGUID: 0UhFw0GuQfmzHPJ5kXj2XA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,173,1774335600"; 
   d="scan'208";a="242661383"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2026 02:28:12 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 28 May 2026 02:28:11 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 28 May 2026 02:28:11 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.9) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 28 May 2026 02:28:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LbJV7DOetHEc886ufORmn9rEDubcSTPiS+6wEJ5D3MgVKdpBo2dLvQeAzrhhnhmd8Fc9QpSjLWqoj167ZzYmZyYw9+mc1gD1FsHIS+STblxsVOrlG0ilgFURhlHAxKYl80+W3g0rWvZ5/uxDaENsJVmehNaeOGCtSbRQG36niBwPkoD5z4aRyOI2+RKUXm0WJA580DEdro6WvpLCh1mHMLiDV80FP/Uv6TPCcV5I7+QH1Ln8/vALJvzGSal678LAKzZBcWvb3jBnSC41wTXcK/DustYojCotIL5BCtiX1pOEYBvnRK6oWe12ercxbnowUf9zwPXqnGEBexzlnpW0hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HCu4+qYM+z9jVHBU28NXZpqSKSLFQrnLgVVhYTw6Nc0=;
 b=VGLDEUSZqjZDSinkyshMFQp+M7C3o0eoeBbTQm3heAbdEN8Vrw17Zm/Rnw62mRGD/NC00CcLnmZzwLF4FvHYGojM4iv2+SyUhMUPpuyfH8fGmJMnTan1TtV+X8+K/TiG0woX1qirv+dC0JL4QhzvFMjWaSPbsBzLzbtq0y7+Zb3azXilfUI1lTCGPn2gtNbGMjM1JXDUer7VbFEjm62xKPvQtikuOk6Ekn0RuYTpGfvbqSsUjZKbLWTAPy5u4g5yrhmVjiUjzuCdMExL/9fQgYS0G7/BrWPoM50W50U1tuY++UInzTT2TiRTsS8y0TDGQKQY2vXxC1W99dwVqhd8Fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB6967.namprd11.prod.outlook.com (2603:10b6:806:2bb::15)
 by DS7PR11MB9451.namprd11.prod.outlook.com (2603:10b6:8:261::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.12; Thu, 28 May
 2026 09:28:06 +0000
Received: from SA1PR11MB6967.namprd11.prod.outlook.com
 ([fe80::36a9:3aca:a63e:c8f4]) by SA1PR11MB6967.namprd11.prod.outlook.com
 ([fe80::36a9:3aca:a63e:c8f4%4]) with mapi id 15.21.0071.011; Thu, 28 May 2026
 09:28:06 +0000
Message-ID: <28c0e1ae-e2a4-43e8-8be9-c05f8cbeecdb@intel.com>
Date: Thu, 28 May 2026 11:27:57 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 4/4] ASOC: Unify code style for platform_device_id
 arrays
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig_=28The_Capable_Hub=29?=
	<u.kleine-koenig@baylibre.com>
CC: Vijendar Mukunda <Vijendar.Mukunda@amd.com>, Venkata Prasad Potturu
	<venkataprasad.potturu@amd.com>, Jaroslav Kysela <perex@perex.cz>, "Takashi
 Iwai" <tiwai@suse.com>, Lars-Peter Clausen <lars@metafoo.de>,
	=?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, Srinivas Kandagatla
	<srini@kernel.org>, Shengjiu Wang <shengjiu.wang@gmail.com>, Xiubo Li
	<Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>, Nicolin Chen
	<nicoleotsuka@gmail.com>, Frank Li <Frank.Li@nxp.com>, Sascha Hauer
	<s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, Bard Liao
	<yung-chuan.liao@linux.intel.com>, Kai Vehmanen
	<kai.vehmanen@linux.intel.com>, Pierre-Louis Bossart
	<pierre-louis.bossart@linux.dev>, "Guilherme G. Piccoli"
	<gpiccoli@igalia.com>, Mario Limonciello <mario.limonciello@amd.com>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, Kuninori Morimoto
	<kuninori.morimoto.gx@renesas.com>, =?UTF-8?Q?Amadeusz_S=C5=82awi=C5=84ski?=
	<amadeuszx.slawinski@linux.intel.com>, Charles Keepax
	<ckeepax@opensource.cirrus.com>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
	<linuxppc-dev@lists.ozlabs.org>, <imx@lists.linux.dev>,
	<linux-arm-kernel@lists.infradead.org>, Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
References: <cover.1779958164.git.u.kleine-koenig@baylibre.com>
 <d131f7afc3c61ca8ac82a848aaa6ecfbb57ec63b.1779958164.git.u.kleine-koenig@baylibre.com>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <d131f7afc3c61ca8ac82a848aaa6ecfbb57ec63b.1779958164.git.u.kleine-koenig@baylibre.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI4PEPF00000126.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:808:1::8b4) To SA1PR11MB6967.namprd11.prod.outlook.com
 (2603:10b6:806:2bb::15)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB6967:EE_|DS7PR11MB9451:EE_
X-MS-Office365-Filtering-Correlation-Id: 69f6634e-ece6-4bb9-5362-08debc9b6c6a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014|5023799004|11063799006|4143699003|22082099003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info: r1pjSLPRLnMluD50OmpznKzvaJIEFU1ZemFCz7MAtEjA4yaMGGOwzQfwmmQg0H+ewYDHcqPTI5SAIYvMahbYtdAx82FLzzlBKJHi5ODIB34SADMI8I3MWzvMX25UQ3aAQ+qkiWyTOwC7e0AKJcuZV3eLy9HWEl6CmUyQL6swbpz3+TTeiAWUzEegigEod6mf7bSrZz9NFtJFMXLZNnDzTmCR2Rthwf4zBP9wsAybHi6ydCCplBLbCN7lFawi/6ilblj0wE70JyktByxHwrL81Ls2bJ7Jhhfd7YP0SM0aKMoTM6Yv5AP2NwfLu5BiyXSXwbjPThEeCleL8vTpKWTNyqq2DgJRT2zXc913trq33A2TvLwI+2FOTiLr5penfF0Tw+1ubwD1LYZMX9e+7lJHVSu92fCHxZRLttR6a5QWfgDnI3QfMIzMHxOPCMHUKTXUS7aziMYqdC1LAcpKuhE20aUQvi22jL2Qv9dmBh6IoaLu7cQAm7lY6tvohhQPvJpNn//d2vi3EVzcOKeQMfZnoOdsUoXxQ523ZAKmaEGn4vTAKxRdMSRFXVsdD/jOXJ1mItaUZc1kiPpxWm6xx2qeaAarf4eQdjRr2Q22Qm9BOKd02WT7b5iMjdfpMY+egtAIJw01InXnF6iIIKpHOlnpIgiPMGKsNcK2qawhlq1Sn35DLxJeSPuTkYPZ7JN66zi5
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR11MB6967.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(5023799004)(11063799006)(4143699003)(22082099003)(18002099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dWpmTlhEVWFJYXBxdE42WW1tLzJ2clBNQmFZT1k0bGtpMGpidkhvZGpwSHVR?=
 =?utf-8?B?NFEvYlpqVGN3V0NEUGNGR3EyRDR3Q1ptclFaanlxVnVYZnNFRGt5SHZzSitB?=
 =?utf-8?B?WHdHQUtkL2x5YzVwNzY5aWpvK2tOZlIzSWVoblRkd1A1Z1R4M1ZLTEdMaThr?=
 =?utf-8?B?bElIZ0RuM2hCNHE0aEdVMVNHMjhaRGVNMjJrYW9VWUVyd25PQk0xb1k2Mkht?=
 =?utf-8?B?UE55RjVTR3pxaU5nK0g4Y0IzTlV6M3RnZnMvdXY0WGRBcGJJTDRvcTNwNWNw?=
 =?utf-8?B?VmtvUkFXc05WUmwxdGxUUkFia085aFdnZFpWZVNHS0JtSlB0ZEVWSXdjWWVU?=
 =?utf-8?B?b0JqRXdxaTAzN2xpVmJ3bFhyRzF5MmtLckxBZjZCelR4TjFacWQ5bEd0eXZv?=
 =?utf-8?B?cDNFY0NnMXJsbXNzTjlRNzQ3T3E5a2JXZ3o4Wnl6Um9PKzJEeDBlNCsrV0t2?=
 =?utf-8?B?YjhhdHg4RmJITUVsQllIV3BLUURYWVhVQUh5WW5OT1Z6V3BsMGRRZk5ZU1di?=
 =?utf-8?B?b3psTTNmZDladVQ3ZnBTTVZORFhzOUVSVzNTd2VPbUQ5elBvTHcwRU5zN0FH?=
 =?utf-8?B?S21hSHljRlJyUlpsRmYvYVVtUm9IU2trZE03dDJxWGdnRXVySXpoVDZiVXZk?=
 =?utf-8?B?b0QvMkNpNk1YS1ZJV3NzdTV3RHpuYm5WWkdTRUtUMnpaM01nWkJYQWhXSHV2?=
 =?utf-8?B?Q0phYUVNSXRDbWd1SHVYK2Q0YSsvRG1DWHBpc3BFc2lwOEhFOU14UnpyQzFh?=
 =?utf-8?B?ZXVkMFRDcjA3UEdGOGFQRzh6R1RZWHh3SksxY3hGbkRya3JGWXVBNjJ1WUxh?=
 =?utf-8?B?UHM5aDVBT1FSbVZpdThpUmJKWXZxYmFIVnZ2VlV1MWJDZEdrc2lGVWRwZFlO?=
 =?utf-8?B?VDB2UkRKdzNSTWFVNkU1c29IYW9GUEJOdHMvcnZpSjR1d05pd3ZmTFVMcmVP?=
 =?utf-8?B?ZUtxNHhSTGFFMHBSVUp3djltYVE0eXp0clVteUJuQVB1N0p1YlhpWk85YTBR?=
 =?utf-8?B?MW1QRWZmL2dtNTgyUWxoSUF5QzRQNUVaOU93VlZLckJON2d0bjJqRW9ENHlv?=
 =?utf-8?B?VDVLd1RzbjNwSEZZY2xpWWFwK1lGeHl1NTdCMng3eUdpRmZvOUJLaEZOaTVR?=
 =?utf-8?B?RTh0Q01KVm56M2Q0N1lWa2FCc1NOUm9QaEVac3ZLWC9GSWIzSnRSeVdyZ2hv?=
 =?utf-8?B?c3d4RngweUd0Q1ZKbGwzb2NISnd6ZitWNjNjOUU0cllEOWNIM2hlWUU0VXg1?=
 =?utf-8?B?U01zSXVqYm9mT2FudmtHYjExU3Bwa2ZHQWRWNkowb21IUitnWnNlWVEzWmlG?=
 =?utf-8?B?RmEraGdsVEVMZHp1ZjdNVlB5aWw1RFpqMDZ5RVhmTG1YK0NHWm56dWZyejhq?=
 =?utf-8?B?MkpaOGk0TTZ0Z01raGZuSGJuS2UyRllBQ2N5QTBuWVEvc2VYWFVUbzN6bTVJ?=
 =?utf-8?B?ZUVjcGtzUFZZWnJyWlVpdjg1VUJNVGNQWDFkdHdVcWJGNFV0a1FRTHB5VkJY?=
 =?utf-8?B?aEp3YnVSanV1dVB5Wkc1VXJuUEJPMmRmVVA0b2QvUU1qOGx4cm5nVE01cjVB?=
 =?utf-8?B?ZmtRM1lmTUpEa2wzTWxxRHpBSjIxWVBQTk9WazhXc0tNTXpmZHYxaEpRdVh2?=
 =?utf-8?B?YS8vZ0JUWEtua28zZ0kwYzJqMzdsYmI2K2ZRUTdvS3E5Uk1LTG9DaXEraWpB?=
 =?utf-8?B?RGFvUy9JZEFoN1cyRzF5Sld2VjAzZENnTURxTkpvR015SWdVUjBuTzZleGdm?=
 =?utf-8?B?NkJuaFNXT3RGMmRsdjVHWFJMUUpHamhaTTRXcStpcGplQys4aE9LSURLdEpQ?=
 =?utf-8?B?U1crZ3R0a2dCNnE4RVppekltdC9SaDh3TUlJaHI2WDNTMlMvZEl4VGhQQWhn?=
 =?utf-8?B?MTBmOUlrcUtybDRJTkhXdUJNNksyQ2JTM1JIOXQ0TjI3aUpqeE5JU1lLY0dk?=
 =?utf-8?B?TGZiRmpGWWNsWFZ1dXNKQjlGR2NYS0NlMjJ6dUxMUU9hSys2TjdkNU83R1c3?=
 =?utf-8?B?dzdPMVN5MGxBZDZFcnZLVm92d0tWM3VTLzBWZUpaeWUydiswejRtbGF4dmgr?=
 =?utf-8?B?SnViMndHeForbGdOMGhPMkw2cHZwWlR2UUtScjJmRm0rTmcra2s5alIwUnNj?=
 =?utf-8?B?R3YzVTFZYWc0WmFTL3BNQndJSGFWbE55eksrNXIweGRJeHVBZVErSDhzNFlz?=
 =?utf-8?B?SjBKR0g4OEFiRC9BQUpIM2wvaXM3L001WGFBRXFUNzArc2xKOVhiTXBOczV4?=
 =?utf-8?B?MUNOM0dZVHhJcXZLOHRyWStmRWxDN2NYSG1sRmZoeE1lRjA2YTdiQUNHWlVj?=
 =?utf-8?B?UUJhVHhINzZJZzlWVjM0U3NPcUE3YkJidGkwck40RFBaUDBGY2lkb0xHTDVx?=
 =?utf-8?Q?R5//YdscsfLjxg3I=3D?=
X-Exchange-RoutingPolicyChecked: itkMyu/sU9bDUkZzl7YoVf+Uf8a3osTJfUReeZ4v8HgtSb4Md0n/zqYhMI53REivTtGMAA8u++0ncKkrRY944kpEU0OL0J+EkRdT/tZ0gozHC/ASVDoJgZDptDXOs61M9g02aRLIHVIVt6ku5d00OOH6LYYHV1BFeGIU61CFsXPw8b2rDfhFnSHZIQ55N2NP1kZBncNd33Fqv0yQtwlECoLIQfea5HfVsoyTBuetXHZqmWsaCs9wfFCaz5ydS6ut8/PPnul6Omaj4bY8q/GnkMwPKWVCIV3kHNCs4C7fD+mqDmjp3p8q0MRCtZUl6K+mw1y6FIx2bXSnTJBBBRdEpQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 69f6634e-ece6-4bb9-5362-08debc9b6c6a
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6967.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2026 09:28:06.0533
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9gI9arv0KW1c1QXyIe0J4GkjAZ6mKCelc/jhkCOmR4oHAARbyymzeODqrWe1hQwkw8Mqo59cotNhLPFE+H+kJe9I/zc4Hxw4aL6Bwzx5xp0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB9451
X-OriginatorOrg: intel.com
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[33];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-110067-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[amd.com,perex.cz,suse.com,metafoo.de,analog.com,kernel.org,gmail.com,nxp.com,pengutronix.de,linux.intel.com,linux.dev,igalia.com,collabora.com,renesas.com,opensource.cirrus.com,vger.kernel.org,lists.ozlabs.org,lists.linux.dev,lists.infradead.org];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[baylibre.com:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,intel.com:email,intel.com:mid,intel.com:dkim];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[cezary.rojewski@intel.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 3F3565EF993
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 5/28/2026 11:06 AM, Uwe Kleine-König (The Capable Hub) wrote:
>   - Add a trailing comma for initializers unless the closing brace is on
>     the same line and for the list terminator;
>   - Use a single space in the list terminator;
>   - Use compact one-line style for small entries;
>   - s/\t=/ =/ were the tab is only one char wide anyhow;
> 
> Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
> ---
>   sound/soc/amd/acp/acp-sof-mach.c       | 14 +++++++-------
>   sound/soc/codecs/adau7118-hw.c         |  2 +-
>   sound/soc/codecs/bt-sco.c              | 10 +++-------
>   sound/soc/codecs/wcd934x.c             |  6 ++----
>   sound/soc/fsl/imx-pcm-rpmsg.c          |  6 +++---

...

>   sound/soc/intel/avs/boards/da7219.c    |  6 ++----
>   sound/soc/intel/avs/boards/dmic.c      |  6 ++----
>   sound/soc/intel/avs/boards/es8336.c    |  6 ++----
>   sound/soc/intel/avs/boards/hdaudio.c   |  6 ++----
>   sound/soc/intel/avs/boards/i2s_test.c  |  6 ++----
>   sound/soc/intel/avs/boards/max98357a.c |  6 ++----
>   sound/soc/intel/avs/boards/max98373.c  |  6 ++----
>   sound/soc/intel/avs/boards/max98927.c  |  6 ++----
>   sound/soc/intel/avs/boards/nau8825.c   |  6 ++----
>   sound/soc/intel/avs/boards/pcm3168a.c  |  6 ++----

Please separate all the avs-driver changes into a separate patch with 
the following prefix for the title: "ASoC: Intel: avs:".

The code itself looks good. Provided the separation is done, feel free 
to add my tag:

Acked-by: Cezary Rojewski <cezary.rojewski@intel.com>

