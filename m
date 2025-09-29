Return-Path: <linux-arm-msm+bounces-75520-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 009DFBA9FA0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Sep 2025 18:13:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 91F403A8D60
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Sep 2025 16:13:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 120B530C0F8;
	Mon, 29 Sep 2025 16:13:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jqNp5xw8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 115EC21770C;
	Mon, 29 Sep 2025 16:13:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759162396; cv=fail; b=Xw75TXqjpyf/Fey0XsDqirfILnZBB8/T4zTdHCjYJji6x8ALDuyU34V4itwYgljqys/JvEqvtSIT42F+Nz9msBWgdiL84MoGgT17akJW1EhuIXbep5nm9LdTDRG1t8ApgPLYfkG5JM3O9x+JFJFtisO4/UtVXzPgWWbTXooOGMo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759162396; c=relaxed/simple;
	bh=sKqHtQsBGLrVnheJee/bYOwGKc1tE4+e28fTiLzIs5Y=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Y26wkiyAljJuNzxu5icDwMcMSl/+eRdnBRHg4BL3p8JKSlbixirbGkCcnfcYJZm8TPa4sfdQX8pPMq8313SCdtNTovwkUMjjRIU15PL+CUfB09QBMDpobIFYC5kJG9jsVSl0cw/oI+w1iV+DBaoQAJZOxIagBC+GPT9nrpKCjd4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jqNp5xw8; arc=fail smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1759162395; x=1790698395;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=sKqHtQsBGLrVnheJee/bYOwGKc1tE4+e28fTiLzIs5Y=;
  b=jqNp5xw8vB+RSaNP/DE0gQBRnA0P5d1CqNbPAqS9A+mSGJt+p1U9L4CC
   W0hB7SqdCym2p6fKE0I5kPMpCLKNwstdDGCSHm0ELOjPLe0+SVP3Iu+fX
   xF8ml0VWJJo0G/I9T03NsPy27PSv2BLpzNEx9PYMHl4auURHE9qpVqyh5
   HKFsPP/cHxWPzTYqkcOizk57oms9hqYzSUobhanUblR2vSOaskcoLBW3F
   Z02OXjjVWakoW6Yhogwbfl0zCf0KvLhCuQ7Yb4iQLT/0+qx3Yl4RLRQPh
   LmGewhIyDu8tyZrOVsu8VjRJPTBsoY5n0r+pllqQf0ITCHfzyLqoPtNyz
   A==;
X-CSE-ConnectionGUID: 5kV526e4TKO+8TIKHkgelQ==
X-CSE-MsgGUID: SkNS2ElORHa0JCmjMdktyg==
X-IronPort-AV: E=McAfee;i="6800,10657,11568"; a="72772583"
X-IronPort-AV: E=Sophos;i="6.18,301,1751266800"; 
   d="scan'208";a="72772583"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2025 09:13:11 -0700
X-CSE-ConnectionGUID: ls+cZH6dTKurBx5IJKWpnA==
X-CSE-MsgGUID: L6ZF25QVTwiPDClTd/Atfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,301,1751266800"; 
   d="scan'208";a="177528374"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2025 09:13:10 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 29 Sep 2025 09:13:09 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 29 Sep 2025 09:13:09 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.32) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 29 Sep 2025 09:13:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UcwoCV6JFBz6l1PyCPnQVuQZZUSvDx8l0xBrOPmwVx2eG8ksMiYd8wwcrKxLk2o0WC0KdLRaFNAgtmEqDJiOi7k37pTXp6w+Ml3wOfD4svv2VRA/a8WMjGAnKFXl+uCt+2QK7mEplny6YHKgeUXBV1B05aJLLRbhxbKX3CWJDrVmX+ISRp0WR83bjQvkUFuCyCGlXjK/Jibv1PZjrqomU0ZNc1KJhuqWqFbrTvCIMKcCxf76lbbQ1OSht0U7/itq8uJLhcprRpdZYqzzrouEMyk9xNDCcXHL+KT3JAQJE5HSW1f4ZcPMJitt+5d6KbtIgm1Apz8sDMuMiUrZG/9GUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f8prVtnGyCh/pxHcEs0LgO3mzfCsgi7eHHeWrpvW1zY=;
 b=YysLi6CteSSmk8XuAFEKrZ9jBuEEukbENg9RytRbbG4lraqvaNOP67NHE9L/j06TqBVTlWuJwrJW2fXYrcBfL0mGMlPP2wgikBXyuWKlf7KnH1cVGKJBjBIQ23hC2dIh9VRSbgCOw1Uor9AOZTWBZzfoVDwWVri5ExB7O8Dr41vFKff6X0lRntibc3OaRwieeiaNjfwkVwas3ZZlJlqzDBh/A8MGWnJuAXYsnwAnEIzPwwsCBMflIGA9c1hGLRLl/LJxrmYNH+ORj0SfDynpcxocqpzRJlrNHcUq9+laegMRRo2Pz0udRL4IDbjGMAQoH9j152l0FE4Pvz5hsraCKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7198.namprd11.prod.outlook.com (2603:10b6:208:419::15)
 by DS0PR11MB7829.namprd11.prod.outlook.com (2603:10b6:8:f1::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.17; Mon, 29 Sep
 2025 16:13:04 +0000
Received: from IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::eeac:69b0:1990:4905]) by IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::eeac:69b0:1990:4905%5]) with mapi id 15.20.9160.015; Mon, 29 Sep 2025
 16:13:04 +0000
Message-ID: <59375a10-2a5b-45ed-9a4c-76884c0fe3c6@intel.com>
Date: Mon, 29 Sep 2025 19:12:54 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/4] mmc: sdhci-msm: Add Device tree parsing logic for
 DLL settings
To: Ram Prakash Gupta <quic_rampraka@quicinc.com>, Ulf Hansson
	<ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson
	<andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
CC: <linux-mmc@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
	<dmitry.baryshkov@oss.qualcomm.com>, <quic_pragalla@quicinc.com>,
	<quic_sayalil@quicinc.com>, <quic_nitirawa@quicinc.com>,
	<quic_bhaskarv@quicinc.com>, <kernel@oss.qualcomm.com>, Sachin Gupta
	<quic_sachgupt@quicinc.com>
References: <20250929113515.26752-1-quic_rampraka@quicinc.com>
 <20250929113515.26752-4-quic_rampraka@quicinc.com>
Content-Language: en-US
From: Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park,
 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 -
 4, Domiciled in Helsinki
In-Reply-To: <20250929113515.26752-4-quic_rampraka@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DB8PR06CA0050.eurprd06.prod.outlook.com
 (2603:10a6:10:120::24) To IA1PR11MB7198.namprd11.prod.outlook.com
 (2603:10b6:208:419::15)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7198:EE_|DS0PR11MB7829:EE_
X-MS-Office365-Filtering-Correlation-Id: e36cb773-0fad-4afb-194b-08ddff730fd7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Y25ZaURMZkFxamIzYjJpTHFJaGpPL1FSMWZYUG03THozLzdCSGM1UEVaNUMv?=
 =?utf-8?B?NVVqb0h3SWJpMmF3SThmaFRqVk9BdWVsNFZidXRubGNXN0xibXIxM0JwYUJl?=
 =?utf-8?B?SmNmUTlkTU84R3hGdlovdEVqYnpxYUNXU0FoODBPRGRyblNySU45WWNLelBT?=
 =?utf-8?B?Sk1HbjJ3YkRDUi84U3JzQ2FVZHBxUGxwSGhJSTk2SXA0Yjh4TlBiM2k4blV6?=
 =?utf-8?B?QmdzTWZTemoyckNudThsZkZrK0lNK2V1Tm1DdWdpNW9qeGNPdXl1TGF6TWIx?=
 =?utf-8?B?SkZ4N3lqS21VTG9TMk9PMXpwYlRHTWlqVGkzWWJjNzNtblorQ3RhTlRxTFBE?=
 =?utf-8?B?ZXZIVkszb25lM3lUT1RpWG00NHdZWE0zUzNxNFZ4Q0hhL0lBSXZ0V2RLWm9F?=
 =?utf-8?B?V3huSEZRMFNGSzRvb3dNY2c1OU1VcHRnazZaVW5lalF3c1pFQWhJWWF0Z2l1?=
 =?utf-8?B?SllpdUhnelVFcnJhT1dpNEpSUDVVMmhjb1p6TmI5MUh4MS9XWVRqS3RidnpP?=
 =?utf-8?B?cjlWaE84UnMzOUVlNnRYM2tpMHlhTVdzS0txM2tyWDZUcWpyYTc1YlVlaG5D?=
 =?utf-8?B?OHpEWk9WTGJkMTJwdUxpQjVXaGNlaU8vUWJBWHQxZ2d6cWtsWUpCV1VzUi9S?=
 =?utf-8?B?T0FsZTlscTRCVmFpTTY5WDhrVS95ZHFxSWZIY1ZpYlNtYVZBK1didUpDUzlE?=
 =?utf-8?B?SnQvUHZUbG9kSXhUS2p0Q0lZR1JGSDFvU2ErQmlBbCtaelB3cTROd0k3OG1C?=
 =?utf-8?B?T0hqQjlmZXBHdFVoODczcEdGYzBZNDZLL2k3NmRadW5TMkVXSHFHbVI3Mlhv?=
 =?utf-8?B?eUdwQmsyMlhLSmx2dTlKYUR0ZHZ0WjdxVm5DajBsbEt1V216dGt0eXFGakF1?=
 =?utf-8?B?TVZsekREQmtVVzl0eGptbXNobjNvMlRBTkxzTW83WGIySTdLQVA1TmtQNUw4?=
 =?utf-8?B?R3RHR245MjJaVXJBN2tKNTZvMEI1UDlhRU9NRkJHVitHY1k4ajF0WjFGcjBo?=
 =?utf-8?B?WTIvb3dWeTNoaTFmd0dDQTZXM21Ka1JPYVd4RHJkTk5VZlVYU0hkQWU0SHZL?=
 =?utf-8?B?dUdscC9MQnFrdFVrUEhlWXpUcTR4dWFWeFVMSVUvTWU4MCtaTEUrY3hucFlx?=
 =?utf-8?B?NERQZ2U2d2dOOERtNCttOFMzbzV3dFZkUzZ0Rmp6TFJBNTJyeE1GbTB6NDJk?=
 =?utf-8?B?a1V0ZkF2azd2c1J2ZGdUUTArS09tZkJKY3FEMVhpbHk4Z041ek5nQjRMWnlw?=
 =?utf-8?B?QnJrRGsyNldwbDllSWRYVWkycVhyUnlHWFd6UEJ5U3g3RG5ycTY4NXpaUjFY?=
 =?utf-8?B?Tm41Qkc5ei9mQkF0Vml4ZDhGaUVhY2FWcDlrOHk0SDBIaTc2QmxHZkg0VlN6?=
 =?utf-8?B?MXFITmpiNnhwdGg0eFByOUQ4Q29kT2wxUkZyZngvVEtFemQrNHRqSGRUNGtp?=
 =?utf-8?B?WW9VVkdGTnZBeWtIb2FheWt0TkRVWGl6WUZmUi9na2MwVHMyT3hGR0Z1VFhG?=
 =?utf-8?B?UTBMMjM2M1hvUHNZWldzZlovRU8ybHZNUnRHVVpPZTVpREovT2V5eDAwdUJq?=
 =?utf-8?B?ZHdCNjFVcXFsa0YyMFdBNnFXN2paSmhrVHJyYVdtRTFxVHBRMElLb1BBK1VM?=
 =?utf-8?B?MVZoQ05mZGVDWEt6SmpFSUYrUklmb3Bxd2dSMml3VGlxd09yTmJNQXE2SWZN?=
 =?utf-8?B?OEFjalNFRC8zSGVCa3cycGRoV2psczFJYWdiajg4R0xrYk5mRDJEOXQxUlI2?=
 =?utf-8?B?bzVhdXBNUU1qSTFiUlZGTmtibFNESWVsVk5qQlFCNUY4eUNiaVJuOGpkK0VI?=
 =?utf-8?B?RE12T0ZpcVhSMjhrL001UTVrK0pudWtVdWxVdWhtQ2FJM3hVaFVBVitGbHVs?=
 =?utf-8?B?M0pLc0QrRU1WQkdGODNkTC9SV04vTk9EKytJTHVXQk9ZK0NVWjZXVGo3OEtS?=
 =?utf-8?Q?TMZ2qDfdUb/7HjnnGjo/zP3fhLpIKjv1?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB7198.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VncyaU0yTlVzM3kydThsRnE2UlZpclpkUVVNd1ZKejZDZTE3MHNnanpXckZQ?=
 =?utf-8?B?eWpBaFhvOExDTWlqc3VsL041MnViT0FlaGYwemEzTXdVZTlqMTl1Si9nc1JB?=
 =?utf-8?B?dHNjQ2xFQ2V3YnVWSkVBSEhZQVNUU2ZjRWpaa2FKVXNvT3RxbjIyRUNHVmtU?=
 =?utf-8?B?b3I5UWRRaDhsZDFuMnozNnVNRFYwTWh3SEkxMS9YYXJPY29hVUliOVhSaXoz?=
 =?utf-8?B?RjNQZUl1M3grMDd4aXY4NWNUSG1zdEl5MktaeUt1WlZNLzBQR1pDUXJIS2Vp?=
 =?utf-8?B?Ymc2WW5qU01lQkQySDZxNk0wZVJGYkg0emZoZU5ueGZOUlQ5NEdXU1AvM1k3?=
 =?utf-8?B?bXE0L2pzSzFoT0VHL21UdkFnUnVUcTRlM1ZGRFBYUVQ0MW53L0lObTV4ZDhw?=
 =?utf-8?B?R3dVdmwrYlU0aU9KbmVQcnRsQThjNmxRMGRRVXA5dnBqWUU1NDh1UFlDSjRq?=
 =?utf-8?B?ODZtb2hiMDloMVFSeXFiclBhZUJFaHV6ajFzQURBMGlMdElLdndRN0FmY0ph?=
 =?utf-8?B?V0t3RFkwenJOc2dmRW9pUDkzUXpQcXNySkt6ZytKU3Z4NGkweHBsM2o4WUJp?=
 =?utf-8?B?ZDRpeGI1N0Z4bnFDSzlsVUs3QWU1WkdiTTVhQ2NON2Nwbll2V2txVVpjTjFs?=
 =?utf-8?B?VWVETEw3dkpZZllzZ0tlRm0zUWRqbDVkbTBQWkN3WW9xM1BMcWUrK0lKakgy?=
 =?utf-8?B?TnVydGo4TGVsek1kblg3TlN5OHUydnVZeXF1YmNRVXJ2SFRHVko0NWp1VkxF?=
 =?utf-8?B?M2tEV0hJaDA3WmVCcStZd2V1ekd6VFVvL25uaVRVUndBTUd0Q3dEVXNobUw4?=
 =?utf-8?B?SUJQMFl6cU9EbHBwb2Z3ZjJhdElUcFJDcXNwL2o5Y3NhamNMMnIrckZNYjhm?=
 =?utf-8?B?OVNJbThLTWxIYkhSZk9Vd1poWTVMYlAwcTA1aU9UaEsrbjBXdDF6clg1UkVY?=
 =?utf-8?B?V3lKYmdwR29HR2c5dkVObGJpSEkzRlBlbHVZSlFsMEhEWnNINWFMb0tDbVFw?=
 =?utf-8?B?MDUyVnprdHllajNOMXFjRjUvRmdkRFRIU05JZmxkdXN5WmtQV1V5S0c2MUI4?=
 =?utf-8?B?M2FoZ3lsQlhhY3BZWGV4NzBwbXBzbS9kT29JaVIvcy9XL0NHMzJrYkJsRDJO?=
 =?utf-8?B?SnJ1Wjl0L215TFpiR3ZLZFBiV3lBL29SS3hOSHNLTGxPNEJvMHhESmlaYnc1?=
 =?utf-8?B?NHNnRVNRTnk3RVdaZ0xzWHgva1NqS3ZLRFFZSk9wTGo0VDJNcEwvK0Vsb0VP?=
 =?utf-8?B?c1J2RUc2V3M3VW1ncC9hN1h4dkdIQzcxYzFaVDBwY1BzcldLNis5ZGtRaDNt?=
 =?utf-8?B?eUEyZ1N2UjVxcW5FeFhGU2NDZEFXWjRndG5PbkxBS2NBT0d0OW1wOFBkY1pH?=
 =?utf-8?B?VkxiWkx0ekMyY1JDUndOcVMxWHB2M1dXMDluSmVlNnBkbzdadHgrbTh1THIx?=
 =?utf-8?B?TDhrM2JIdWJNUUprek5iYlZ1Y3RlOWZwRXZDYXo4N3BNVE9qbnNPemRwSlB4?=
 =?utf-8?B?TFVyVC9BcTlnUGkrTkYrZGZBVEZuS0hwUEFhc0g3YTZ4M21mNHZxbjMwRnlT?=
 =?utf-8?B?Y1NpNko0RzJUMlR3TlFja0YzRlBGYkwwNUxpcU83cU91ZGs5SmxHY0FSYkxS?=
 =?utf-8?B?TDNqdE1YSWViMFdhZmtaelVpdk1QbWQzZlhsWGF6NElNWU1XbWkwN1hHOU01?=
 =?utf-8?B?WU5zYVVjUk9KWm9JdVNNOWUrdzIrZFJjejZxQjYramRKamMreEtJUHNVOFkw?=
 =?utf-8?B?bkk1eEREMDFhSmxaeHdRMGZPejNGdWVMdk1LZC9JT0RCN2xsam9EWEdOR080?=
 =?utf-8?B?TEhQYkJJRGs4YWJvOUQ3WHFnTjF1Z0VJWXVHZTErSHRmbmFCeGZQQ2ZNaGla?=
 =?utf-8?B?dUVTY2JsSEsrUlBMVjJ6d25tMHNvUE9aZkdIRXY3VDZ2cFNhRTYwYm5yNGRS?=
 =?utf-8?B?SDRXOXd1Z2VFM0JXNDByNVBNcTFMeERDSVZselVXRlNsRUIxc3NCK0pQZmt3?=
 =?utf-8?B?NG5LWFFJWGpGZnRZdW9sN3VLWk55cTBpS2R4VjQrTVhsNkVWMlNvUklDVDVM?=
 =?utf-8?B?RzBYVW91VGVyUFVXYVVLSnFMUTZQbStreHN5WGVYVENMN2YxSmk1N2t3dUt2?=
 =?utf-8?B?YWJKZ2hPa1c2aHUvZHkzZzNWSllvTFhUWjdaMVdTQlpXU0VkcHdEMFR2TzNG?=
 =?utf-8?B?Smc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e36cb773-0fad-4afb-194b-08ddff730fd7
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7198.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2025 16:13:04.3941
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WapXorgJ2nLiIAh6dD47QLy+GGGTaym6V+Es8UcWqqVMCPr6sVMnKPO5etbki7zMCnSPumcyDNjOZ4Arcios5Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7829
X-OriginatorOrg: intel.com

On 29/09/2025 14:35, Ram Prakash Gupta wrote:
> From: Sachin Gupta <quic_sachgupt@quicinc.com>
> 
> This update introduces the capability to configure HS200
> and HS400 DLL settings via the device tree and parsing it.
> 
> Signed-off-by: Sachin Gupta <quic_sachgupt@quicinc.com>
> Signed-off-by: Ram Prakash Gupta <quic_rampraka@quicinc.com>
> ---
>  drivers/mmc/host/sdhci-msm.c | 91 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 91 insertions(+)
> 
> diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
> index 36700735aa3e..d07f0105b733 100644
> --- a/drivers/mmc/host/sdhci-msm.c
> +++ b/drivers/mmc/host/sdhci-msm.c
> @@ -265,6 +265,19 @@ struct sdhci_msm_variant_info {
>  	const struct sdhci_msm_offset *offset;
>  };
>  
> +/*
> + * DLL registers which needs be programmed with HSR settings.
> + * Add any new register only at the end and don't change the
> + * sequence.
> + */
> +struct sdhci_msm_dll {
> +	u32 dll_config[2];
> +	u32 dll_config_2[2];
> +	u32 dll_config_3[2];
> +	u32 dll_usr_ctl[2];
> +	u32 ddr_config[2];
> +};
> +
>  struct sdhci_msm_host {
>  	struct platform_device *pdev;
>  	void __iomem *core_mem;	/* MSM SDCC mapped address */
> @@ -273,6 +286,7 @@ struct sdhci_msm_host {
>  	struct clk *xo_clk;	/* TCXO clk needed for FLL feature of cm_dll*/
>  	/* core, iface, cal and sleep clocks */
>  	struct clk_bulk_data bulk_clks[4];
> +	struct sdhci_msm_dll dll;
>  #ifdef CONFIG_MMC_CRYPTO
>  	struct qcom_ice *ice;
>  #endif
> @@ -301,6 +315,7 @@ struct sdhci_msm_host {
>  	u32 dll_config;
>  	u32 ddr_config;
>  	bool vqmmc_enabled;
> +	bool artanis_dll;
>  };
>  
>  static const struct sdhci_msm_offset *sdhci_priv_msm_offset(struct sdhci_host *host)
> @@ -2516,6 +2531,73 @@ static int sdhci_msm_gcc_reset(struct device *dev, struct sdhci_host *host)
>  	return ret;
>  }
>  
> +static int sdhci_msm_dt_get_array(struct device *dev, const char *prop_name,
> +				  u32 **dll_table, int *len)
> +{
> +	struct device_node *np = dev->of_node;
> +	u32 *arr = NULL;
> +	int ret = 0, sz = 0;
> +
> +	if (!np)
> +		return -ENODEV;
> +	if (!of_get_property(np, prop_name, &sz))
> +		return -EINVAL;
> +
> +	sz = sz / sizeof(*arr);
> +	if (sz <= 0)
> +		return -EINVAL;
> +
> +	arr = kcalloc(sz,  sizeof(*arr), GFP_KERNEL);
> +	if (!arr)
> +		return -ENOMEM;
> +
> +	ret = of_property_read_u32_array(np, prop_name, arr, sz);
> +	if (ret) {
> +		dev_err(dev, "%s failed reading array %d\n", prop_name, ret);
> +		*len = 0;
> +		return ret;
> +	}
> +
> +	*dll_table = arr;
> +	*len = sz;
> +
> +	return ret;
> +}
> +
> +static int sdhci_msm_dt_parse_dll_info(struct device *dev, struct sdhci_msm_host *msm_host)
> +{
> +	int dll_table_len, dll_reg_count;
> +	u32 *dll_table = NULL;
> +	int i, j;
> +
> +	msm_host->artanis_dll = false;
> +
> +	if (sdhci_msm_dt_get_array(dev, "qcom,dll-hsr-list",
> +				   &dll_table, &dll_table_len))
> +		return -EINVAL;
> +
> +	dll_reg_count = sizeof(struct sdhci_msm_dll) / sizeof(u32);
> +
> +	if (dll_table_len != dll_reg_count) {
> +		dev_err(dev, "Number of HSR entries are not matching\n");
> +		return -EINVAL;
> +	}
> +
> +	for (i = 0, j = 0; j < 2; i = i + 5, j++) {
> +		msm_host->dll.dll_config[j] = dll_table[i];
> +		msm_host->dll.dll_config_2[j] = dll_table[i + 1];
> +		msm_host->dll.dll_config_3[j] = dll_table[i + 2];
> +		msm_host->dll.dll_usr_ctl[j] = dll_table[i + 3];
> +		msm_host->dll.ddr_config[j] = dll_table[i + 4];
> +	}

Kind of begs the question, why the driver and the DT have to be in
a different order.

It might be simpler to have:

	struct sdhci_msm_dll {
		u32 dll_config;
		u32 dll_config_2;
		u32 dll_config_3;
		u32 dll_usr_ctl;
		u32 ddr_config;
	};

And:
	struct sdhci_msm_dll dll[2];

And then dereference like:

	msm_host->dll[index].dll_config_3

Also then you could perhaps use something like:

	of_property_read_variable_u32_array(np, "qcom,dll-hsr-list", msm_host->dll, 10, 10)

instead of most of sdhci_msm_dt_get_array()

> +
> +	msm_host->artanis_dll = true;
> +
> +	kfree(dll_table);
> +
> +	return 0;
> +}
> +
>  static int sdhci_msm_probe(struct platform_device *pdev)
>  {
>  	struct sdhci_host *host;
> @@ -2562,6 +2644,15 @@ static int sdhci_msm_probe(struct platform_device *pdev)
>  
>  	msm_host->saved_tuning_phase = INVALID_TUNING_PHASE;
>  
> +	/*
> +	 * Parse HSR dll only when property is present in DT.
> +	 */
> +	if (of_find_property(node, "qcom,dll-hsr-list", NULL)) {
> +		ret = sdhci_msm_dt_parse_dll_info(&pdev->dev, msm_host);
> +		if (ret)
> +			return ret;
> +	}
> +
>  	ret = sdhci_msm_gcc_reset(&pdev->dev, host);
>  	if (ret)
>  		return ret;


