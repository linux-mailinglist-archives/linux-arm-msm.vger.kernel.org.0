Return-Path: <linux-arm-msm+bounces-80935-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B18EC456AB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Nov 2025 09:46:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 740E24E0526
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Nov 2025 08:46:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C84D32FC87E;
	Mon, 10 Nov 2025 08:46:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hYK0T0KB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7309229CE9;
	Mon, 10 Nov 2025 08:46:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762764401; cv=fail; b=U7CqTgoyJVPlzi6YwIGaKSi/GCk8US6Yc/3WPog5H6DWLvC9/N1uO+eIrtFCDwDbGMIdK7d6wISAxJDdqcwfmKqwWmrdSyv8/8aFkw7UOQ0X/ghcKhZv4Mquu8aUHbJygEojAaXoc6ci9vgNqS7DCmAsAE+m7hKLl1M2dkX6bcE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762764401; c=relaxed/simple;
	bh=lv4AbgMU/EinS0fXkBIPzFWAQgFoa3YzPyTO/BYjFRs=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=NbNoIlIoiQdoVazsr3YxcHEE4ylGLAPb1aTSKnqQUNqJmqZGtFk3ocAEhACLoUFKor1NYWh+64u7mu2y/tBY8YCGRbCffDmQepKC4QzfiTqN5oDOThegUJ55Sdz6xjjndle3Mmcpg8SvLC+1aU+PpJK48eoXMtf5HuOWys0dqC4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hYK0T0KB; arc=fail smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762764400; x=1794300400;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=lv4AbgMU/EinS0fXkBIPzFWAQgFoa3YzPyTO/BYjFRs=;
  b=hYK0T0KBHAzO3Ezf4WHLw3Bm+RXVJxLY8VDJqhDhOt0xMXZ/exo2PfI1
   7wN7var0Gu8jTSsbOhp7B2sFPYj8wul0yvz7BBgp6orfVYeVbstQXrSVW
   cqCOST7rNnlvAOyuC0vx2Xc//zvVSHGQ6DHMZ86Z6FYj7jLHMZzwKkgve
   DO0vDywKMMu3PpBC56GZNIOJ1GFpW9T/tXkGaPsYX36Ob+NVbRJmMB8Ns
   HP78Za2Ku5pxFEwVMIv478XnuNKi3k0gYsfV4I54PEFOPm36UjjHubXXr
   V+rL4ZEj9QDBQYhPi1aR2LKZX4gKGqiHQ0d4OM2h/eJP4a9m9mH7AfFTL
   w==;
X-CSE-ConnectionGUID: CTjB+Lx0Szu6S7XdkJb6wg==
X-CSE-MsgGUID: ZKDGoPh7SNWYrD30GsoxaQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11608"; a="90280339"
X-IronPort-AV: E=Sophos;i="6.19,293,1754982000"; 
   d="scan'208";a="90280339"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2025 00:46:39 -0800
X-CSE-ConnectionGUID: vvi/wiSTSKeWAxOY3idWig==
X-CSE-MsgGUID: MG6PZhu4QeKSGranJBjFZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,293,1754982000"; 
   d="scan'208";a="193632905"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2025 00:46:39 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 10 Nov 2025 00:46:38 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 10 Nov 2025 00:46:38 -0800
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.65)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 10 Nov 2025 00:46:38 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PWRL5TDiaS5Ei8pqMd/whECQwkuNExU6RliTIGgrO3234tfs3lJIFP6vly3v1N5cVkG8YGF63bUEY9Rqy938HfOkympfZkHB4LrOWoHiwl4Kf6hv200QJsZzgiAUsP0Ed8DclIMOSJscJe4PhIrkI/wMm4TjYHvPXJpAyNVWD9ryz/DdaZ0FMb0dPEVyJmchqdwvIvSk4sCJ5BEKSYXgVDFJTeyovn60ecw9ZiOXbaDsTRB1FjzTMUAA9vetDr112QkSOYFi2KaOEaR5CbWrX1Uzx8yWNm4mi390Kfgraq0jAHrqixwdPssOv0EgHKG1T9xks9Lv2YNBC6pyh+5Umg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=StKRB+vBxt7BLsoJzCFtPCLBPrvlFBN+l/Fmnhd5Ilc=;
 b=PVRpPnDeQqAm6q2hi2Q/NV4bDo9m5thTrleXzRuQfUp/bCf+vSg6sb8yq5X0qE2hyb8WQW8pLHp2MBMq1rO5iI7z17wk9yLtkWFfpKsqMErSGu0gLvmDndFKlGbAusR5e1UcW8Rv3jEUA/zeGcdjqIvpRgHYXDAyJigCoF7w9YS++CMTBVRiBiS8BMGvRSHKB3ReaYDVUItmgJ+LX8aFDOQn9UteRDMgvTf1QDrKf3eVx/KBNESLyOTHFtCYwbmB1JlN1Yyvgv7Mcqg98dDhpIpxb+JB8fDt90ya0sZDY9m4ZwdHZsCqBn2jbR/jWukoCqDu5FX9hGw3BZsm9GJwEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7198.namprd11.prod.outlook.com (2603:10b6:208:419::15)
 by PH7PR11MB7516.namprd11.prod.outlook.com (2603:10b6:510:275::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Mon, 10 Nov
 2025 08:46:36 +0000
Received: from IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::eeac:69b0:1990:4905]) by IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::eeac:69b0:1990:4905%7]) with mapi id 15.20.9298.015; Mon, 10 Nov 2025
 08:46:36 +0000
Message-ID: <ae37c98b-927e-44e4-b83c-71753d61e2cc@intel.com>
Date: Mon, 10 Nov 2025 10:46:32 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] mmc: sdhci-msm: Enable ICE support for non-cmdq eMMC
 devices
To: Md Sadre Alam <quic_mdalam@quicinc.com>, <ulf.hansson@linaro.org>,
	<linux-mmc@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Eric Biggers <ebiggers@kernel.org>
CC: <quic_varada@quicinc.com>
References: <20251104063943.3424529-1-quic_mdalam@quicinc.com>
Content-Language: en-US
From: Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park,
 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 -
 4, Domiciled in Helsinki
In-Reply-To: <20251104063943.3424529-1-quic_mdalam@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DU2PR04CA0288.eurprd04.prod.outlook.com
 (2603:10a6:10:28c::23) To IA1PR11MB7198.namprd11.prod.outlook.com
 (2603:10b6:208:419::15)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7198:EE_|PH7PR11MB7516:EE_
X-MS-Office365-Filtering-Correlation-Id: 10a6e863-1fec-4917-8bba-08de2035a83a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VlJyY3lrR3JUM3hxVGRIVmtaTFF3V1RaV3FqdUFHVjdhcE95Wjk5UHBCdVMy?=
 =?utf-8?B?ZURPZjZkZWR2eFhFaEFUVEhzRWVmMk1nd2VQZmgwSDREUGMyWG9NaWlmNktj?=
 =?utf-8?B?YThMMWxqZm02di9jS1RIUm95WWc5TEI3eFJaYStPWTdDQ1RvY2txZy9RZFNU?=
 =?utf-8?B?RFg5a29jb2R2TzBWM3lHZzFOTm0rVG51RjlZbjFabFRyVnFLaVE0R2t2SFVa?=
 =?utf-8?B?cHlQT2hOUTJnaEdMMjQ5TEdTWjF3Y3JBN3U5QlVLNmQremlsZmxrV05MT1Z1?=
 =?utf-8?B?V3dOc1NhSkJHYW5VUDQrbUtzbU80K1M4QzFtSEZiU1hyL0RDM2ZJc3lXbm1m?=
 =?utf-8?B?MStxUzR4OENGYTg3M09zaThtd083VWN0YzZKTUsyNHovY3JTNVRZOElmRzdH?=
 =?utf-8?B?MkN3aEViT013ZTFFZ1grdnFIYlVCd1ZYYmpoblk4b0hYT2tjM2NYbXNBNnUv?=
 =?utf-8?B?dVVaYlYrMnMwaHVkelRxTDF0blErMDlVU1drU2kzTFVLcGdLL1N4cmMvUnpK?=
 =?utf-8?B?SDUyTFFITUh4OXpHbFBKZjJEWXVEenZoTkVzQUZZeXZYaThjYVVIVGlyaDFk?=
 =?utf-8?B?UEJCUUFsSW9acjcrR21JYXlick5kcXV1NTBXeDc5L2EzaVlxNTRFU1N5Mldn?=
 =?utf-8?B?NDY4c3B1UDVSZlRYOVlrVC9xSUJDVXcwcG9KbTkwQ0pmWTdZQmRQdGFCOXRP?=
 =?utf-8?B?L296RFJTYzF5bEJzcXJ2S05HMGc4cFhQZHVYalkwdVROOVZ6aFYyb0JFMFhh?=
 =?utf-8?B?QXg4SWZZU29BNjNnK3FQVzlkaDNWNlE5SGc0WENta3RLdGV5L2xObmlmSnN6?=
 =?utf-8?B?RTIyT0NCTlovZjRuQ3I1dDBUZ2VIT1hqLy9xYVhVZ3V1d1UyaThzODZqK2NR?=
 =?utf-8?B?N1c4QlJUeUVNcllFdWo1UzFWc3JhaGlaQ2xqcjQyTHloSmRNMkROWkV2dnB6?=
 =?utf-8?B?Um5iQmhwWFN0RGV5bjlrdktTWkFVcml4K1FXS3ZzQ0dqWFpnWmVlWVcvRW5J?=
 =?utf-8?B?MlNGbTFyRG03aUEyVFN4ejdEU1BMWUhoK3d1bTR4c1pQYSs4M0tuMXZMWUlj?=
 =?utf-8?B?Mjg5b210aFZBNHZaMjhEUlRMRngvU1ZRclFnaUF2VEpRWjZPR3lwRW9Ya1dx?=
 =?utf-8?B?NzdpZzFZeGxWM3lGVlhyTWM0M2lKa2ozWUZuYTI2NEhyZWd5R1d3RUZKRFRV?=
 =?utf-8?B?VW5hSGVmZnB6b0IvTzhDOHI0WnNicTdqZFJhQ2xCejlTVUsrTUZ5cklGSSt1?=
 =?utf-8?B?eE9rQ09lbGpuTGMvbnBUelJmaVRZeUtTRWFydTkrQzE5a0d4cHp2L3MwOFR1?=
 =?utf-8?B?V3YreHBBUDlJdlFqT1VGK1VvWDhSNVUzZGVSWXRZKzhYQWp5aGx0dDJZYlc1?=
 =?utf-8?B?bkxuNGxyNHpickRUV3loVml1bElncFBSMTNHRXJscTNFSjdQeDlnbzB4dmIr?=
 =?utf-8?B?NW5NaFY2QjFtRHFWUUhaRTNxTXdaNnZqYWpzeEpYS0ZuUythdnZkWHZXRHh4?=
 =?utf-8?B?ay8way8xK3RoOWYwOTdKYURDY2ZDUEtYd1hUdjJWbWRQbEpaTHVqM2RCV2lp?=
 =?utf-8?B?S3RIRHNUdmFOdWpEVGxOR3RGaU82NWZ1Z2ZjSjA1MSt3MmpqWGtYYXFCRzJU?=
 =?utf-8?B?Q21adGMzWFZrN0xHaEFNNVFtTmZqaXAraDk4dFFteWZRbGVsUzdaREsrMlcx?=
 =?utf-8?B?U09EU3FZWFlnTjBZZ01CUlB6bE5qcVBTNGFTTitreUhmS3QyTElKdXEzRnhP?=
 =?utf-8?B?bTZQMXUrOGY1ZDNZN3R0ZUVxWk1WQ08xdDl0TU1PdlhXRVVIVDJqcE9FSnJS?=
 =?utf-8?B?ZGlBdmFUOWRGc2JSb2dzVWtiOW5KdHFmWnhQWjd3YjlhRllCOEpLUEYyK1k5?=
 =?utf-8?B?dFJjdlRUbHVoQWY1ZWVSM2FpeW83SENoem9WS1BGVWJ3Q3hxZ1M5bTlZOGtN?=
 =?utf-8?Q?KWv2S27FVCOkfEoL07JiLgg9H/QH2gz+?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB7198.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b2t5b1ZaMWdtN2ZSQ3dibmFWQUF1UkVNYmd0dFZnVmE1SE1vcVVVOG5EOFAv?=
 =?utf-8?B?NG1TTHF4cytCR1JSYllSTEpRZFFSeW9QbDNxcnc5L0ZLcDN3VzNSeTlaNEFW?=
 =?utf-8?B?N2ppV1lsZmFROHVOSlU4YmFZblpTLzhnbmkycW5oak5xNHk5SENlZFhKK3c4?=
 =?utf-8?B?ZXg4cjRsOFhVMW1xTXdlQWRrSnliby9uSDE5MTRQYkhybHROTmgwbzVSRGV6?=
 =?utf-8?B?Z3RxQWhNTHphMHVJN3J4M002dCtJZ0h2N0dINjdhTWxYUjdLUlBhYmFqTUNL?=
 =?utf-8?B?K3VpU1lra3FDdDU2T0tROUxka3JSZFZrS2tWbmRDbld5VytET2dxeEY1Q0o4?=
 =?utf-8?B?M2F5SGd3V1JtcmUxK0dMaVM0YTNkeld2cStPZUc1TGdJcktDSmJ5U1BXVHJL?=
 =?utf-8?B?Q1duQ2dpTkoxdXdyQWZWNVNNUyt3dUZjakdpRnFXMXRQVWVFWHB5SGxocnla?=
 =?utf-8?B?dGkrT1VzRHBERTdVTDZIRkdQS3QzZTBXMUUwNGRrMjFTN0p0RGU5Y1lGaTVn?=
 =?utf-8?B?UVhDK2JTZEVqS3dEMTlBRmtHaEdBN29IRkdBZ0dGNzZ2WVJNQ0F6WFQ3S0E2?=
 =?utf-8?B?Z21GZS8zcG1GR3p4ZndicmhTenUvUXB5aWttSEFxK1NJekZob3NvM0hNcEcw?=
 =?utf-8?B?YzRmcUVNT2RuSjhZcEczL09QdytPT3AvOWJnUWFyazBKMlR2LzVnUmdtbzEz?=
 =?utf-8?B?RVQ3dHpxd25LNDBidlJZZ0R6NkZEa2plTHcxd1NqbzMwZEViSzhJSi9mbExt?=
 =?utf-8?B?YVVBUzZhQ2tsbjQvMGFXUDBvcHI1NmNYTDJtbGxjUnlHQlZDbjhDd3JJYVRw?=
 =?utf-8?B?QW1BWUZKN25kSmlyZ3dGL0Rmcy9lay81NkJTYzFiZjVIbHh5TEJya2Y0ZTFy?=
 =?utf-8?B?L1pua1hRL1EvazYrMm1GUkVnMDN4ZHFYUnN5Qi9VREZzWFhROXdBMTlpU2Vk?=
 =?utf-8?B?V3g0Nmd4a2ROTmtVTVNYUWxBYnVrTUhXN0hyM1RLMnMxak5Id0g0MTFwM1JO?=
 =?utf-8?B?OFh5VzNTaXpYcndKcG9VWmFtWUZ6b2p6d1k4VVYzRE1XVWNIZjEydmdaaE5q?=
 =?utf-8?B?Y2JvOGxBR3JieXVaaWtSMGQ4ZE1JbGpLa1dIbDVWTTVrMHg4WTZPR2UvQzJz?=
 =?utf-8?B?ZzdCK0dmSnBnc1FCTnBYcEF4OG5CeUNxaUpQZDZqYStGTnovbk9xeXBpNWpH?=
 =?utf-8?B?dkJJL2d6eTB3alBOM09pY2ZMa090SkR1UXZEWXJQbW1MOGFBT25FV1FRQXAz?=
 =?utf-8?B?VjNETlgwYUd6eThBa3REQjdLUjhUbjFSUk9TZGdUZzFZQTVUdVVqUzFwN3pz?=
 =?utf-8?B?N2lmVTIwNStleGhuZWxsb3JWd01VcXc2S042eWE2Mzcyc3RlMERhRXFxN1dF?=
 =?utf-8?B?Z1A4dTJrQStGWmt5Tzk5WmR5bGxIdWhlK09JSHozdXhNeGtOb2kvaEJKSXFL?=
 =?utf-8?B?eVZHVUhwa3lVOWdBS25VOWZ1YmN2cjk2TXlLSXNBUmtaUmxsU0xMVzdJME80?=
 =?utf-8?B?NE1UcTM0Z2c0RnlEb3hxWWNSSk1EcVhkVVlZaWRzOS9LUGU5WDNHS25hTkpY?=
 =?utf-8?B?dlJNU2Q1TWR3SVJ0eG4rOUJrcVY4T1pWSmhoOGMvcVU4NHQ3ZEZsbVJiVmRx?=
 =?utf-8?B?ZnA2bUY0K2w0SGo1TVFyWmp3YXFkU3BrUGx2T1gwdGhRWS9ROVNjTEltMGhG?=
 =?utf-8?B?cTQ1NUdNWFBJUUhITkMvMjhNaUNZakJPWWltL0xzaEVBb21RbHZEdzRJTmhF?=
 =?utf-8?B?eTdlbk1TTTF2WjRGcVp0VS9KVmtacVhhcWp0SnVCNGNyMFRFMnF0S28ydTlS?=
 =?utf-8?B?c3NSWWN6aWEyUTNLVTFXMHJIMFNFR0UxSndadGFFU3FLS2pHWFZjWm5oaXJY?=
 =?utf-8?B?WGFPSFRHY3d3eE5sdmxLQlNhRms0MVdwSXdhRDRsZzhQTlBDVHlJb3FJcTJE?=
 =?utf-8?B?VnkyazRyU2FNUUFuWHY3QS9IWW9NbVAxRGtoU2lLOVZzYm9EaG9zK3BKWVoy?=
 =?utf-8?B?Wk51eGFPWEp2bmZyN2hkdDUzekdMSHhTdnZnUXdmNmRtSEdKYjlnakxhWVUy?=
 =?utf-8?B?VURRVlY1R1FNaWN5UXg4UDBiZ05JU25FREJXUkpvcGlsRXFXUFV6ZjdVem9E?=
 =?utf-8?B?eFZPaGlTYjVicmYvMWk1OTFZTStQMW51cTNJa0wzTnNJaEdVS1RwT3VCZy9I?=
 =?utf-8?B?Unc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 10a6e863-1fec-4917-8bba-08de2035a83a
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7198.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2025 08:46:36.4176
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fhYQq6gjeisJY1RDet8C3drYhnAy3MmABg8+KqpvS1nO/M927E8p52o5/xmauMzW2c14m5k5UeKKUS7XldZxoA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7516
X-OriginatorOrg: intel.com

On 04/11/2025 08:39, Md Sadre Alam wrote:
> Enable Inline Crypto Engine (ICE) support for eMMC devices that operate
> without Command Queue Engine (CQE).This allows hardware-accelerated
> encryption and decryption for standard (non-CMDQ) requests.
> 
> This patch:
> - Adds ICE register definitions for non-CMDQ crypto configuration
> - Implements a per-request crypto setup via sdhci_msm_ice_cfg()
> - Hooks into the request path via mmc_host_ops.request
> - Initializes ICE hardware during CQE setup for compatible platforms
> 
> With this, non-CMDQ eMMC devices can benefit from inline encryption,
> improving performance for encrypted I/O while maintaining compatibility
> with existing CQE crypto support.
> 
> Signed-off-by: Md Sadre Alam <quic_mdalam@quicinc.com>
> Acked-by: Adrian Hunter <adrian.hunter@intel.com>
> ---
> 
> Change in [v3]
> 
> * Refactored logic to use separate code paths for crypto_ctx != NULL and
>   crypto_ctx == NULL to improve readability.
> 
> * Renamed bypass to crypto_enable to align with bitfield semantics.
> 
> * Removed slot variable
> 
> * Added ICE initialization sequence for non-CMDQ eMMC devices before
>   __sdhci_add_host()
> 
> Change in [v2]
> 
> * Moved NONCQ_CRYPTO_PARM and NONCQ_CRYPTO_DUN register definitions into
>   sdhci-msm.c
> 
> * Introduced use of GENMASK() and FIELD_PREP() macros for cleaner and more
>   maintainable bitfield handling in ICE configuration.
> 
> * Removed redundant if (!mrq || !cq_host) check from sdhci_msm_ice_cfg()
>   as both are guaranteed to be valid in the current call path.
> 
> * Added assignment of host->mmc_host_ops.request = sdhci_msm_request; to
>   integrate ICE configuration into the standard request path for non-CMDQ
>   eMMC devices.
> 
> * Removed sdhci_crypto_cfg() from sdhci.c and its invocation in sdhci_request()
> 
> Change in [v1]
> 
> * Added initial support for Inline Crypto Engine (ICE) on non-CMDQ eMMC
>   devices.
> 
>  drivers/mmc/host/sdhci-msm.c | 71 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 71 insertions(+)
> 
> diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
> index 4e5edbf2fc9b..6ce205238720 100644
> --- a/drivers/mmc/host/sdhci-msm.c
> +++ b/drivers/mmc/host/sdhci-msm.c
> @@ -157,6 +157,18 @@
>  #define CQHCI_VENDOR_CFG1	0xA00
>  #define CQHCI_VENDOR_DIS_RST_ON_CQ_EN	(0x3 << 13)
>  
> +/* non command queue crypto enable register*/
> +#define NONCQ_CRYPTO_PARM		0x70
> +#define NONCQ_CRYPTO_DUN		0x74
> +
> +#define DISABLE_CRYPTO			BIT(15)
> +#define CRYPTO_GENERAL_ENABLE		BIT(1)
> +#define HC_VENDOR_SPECIFIC_FUNC4	0x260
> +#define ICE_HCI_SUPPORT			BIT(28)
> +
> +#define ICE_HCI_PARAM_CCI	GENMASK(7, 0)
> +#define ICE_HCI_PARAM_CE	GENMASK(8, 8)
> +
>  struct sdhci_msm_offset {
>  	u32 core_hc_mode;
>  	u32 core_mci_data_cnt;
> @@ -1885,6 +1897,48 @@ static void sdhci_msm_set_clock(struct sdhci_host *host, unsigned int clock)
>  
>  #ifdef CONFIG_MMC_CRYPTO
>  
> +static int sdhci_msm_ice_cfg(struct sdhci_host *host, struct mmc_request *mrq)
> +{
> +	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
> +	struct sdhci_msm_host *msm_host = sdhci_pltfm_priv(pltfm_host);
> +	struct mmc_host *mmc = msm_host->mmc;
> +	struct cqhci_host *cq_host = mmc->cqe_private;
> +	unsigned int crypto_params = 0;
> +	int key_index;
> +	bool crypto_enable;
> +	u64 dun = 0;
> +
> +	if (mrq->crypto_ctx) {
> +		crypto_enable = true;
> +		dun = mrq->crypto_ctx->bc_dun[0];
> +		key_index = mrq->crypto_key_slot;
> +		crypto_params = FIELD_PREP(ICE_HCI_PARAM_CE, crypto_enable) |
> +				FIELD_PREP(ICE_HCI_PARAM_CCI, key_index);
> +
> +		cqhci_writel(cq_host, crypto_params, NONCQ_CRYPTO_PARM);
> +		cqhci_writel(cq_host, lower_32_bits(dun), NONCQ_CRYPTO_DUN);
> +	} else {
> +		crypto_enable = false;
> +		key_index = 0;
> +		cqhci_writel(cq_host, crypto_params, NONCQ_CRYPTO_PARM);
> +	}
> +
> +	/* Ensure crypto configuration is written before proceeding */
> +	wmb();
> +
> +	return 0;
> +}
> +
> +static void sdhci_msm_request(struct mmc_host *mmc, struct mmc_request *mrq)
> +{
> +	struct sdhci_host *host = mmc_priv(mmc);
> +
> +	if (mmc->caps2 & MMC_CAP2_CRYPTO)
> +		sdhci_msm_ice_cfg(host, mrq);
> +
> +	sdhci_request(mmc, mrq);
> +}
> +
>  static const struct blk_crypto_ll_ops sdhci_msm_crypto_ops; /* forward decl */
>  
>  static int sdhci_msm_ice_init(struct sdhci_msm_host *msm_host,
> @@ -2131,6 +2185,8 @@ static int sdhci_msm_cqe_add_host(struct sdhci_host *host,
>  	struct cqhci_host *cq_host;
>  	bool dma64;
>  	u32 cqcfg;
> +	u32 config;
> +	u32 ice_cap;
>  	int ret;
>  
>  	/*
> @@ -2181,6 +2237,18 @@ static int sdhci_msm_cqe_add_host(struct sdhci_host *host,
>  	if (host->flags & SDHCI_USE_64_BIT_DMA)
>  		host->desc_sz = 12;
>  
> +	/* Initialize ICE for non-CMDQ eMMC devices */
> +	config = sdhci_readl(host, HC_VENDOR_SPECIFIC_FUNC4);
> +	config &= ~DISABLE_CRYPTO;
> +	sdhci_writel(host, config, HC_VENDOR_SPECIFIC_FUNC4);
> +	ice_cap = cqhci_readl(cq_host, CQHCI_CAP);
> +	if (ice_cap & ICE_HCI_SUPPORT) {
> +		config = cqhci_readl(cq_host, CQHCI_CFG);
> +		config |= CRYPTO_GENERAL_ENABLE;
> +		cqhci_writel(cq_host, config, CQHCI_CFG);
> +	}
> +	sdhci_msm_ice_enable(msm_host);

Perhaps this could all be done lazily in sdhci_msm_ice_cfg() ?
e.g.

	if (mrq->crypto_ctx) {
		if (!msm_host->ice_init_done) {
			sdhci_msm_non_cqe_ice_init(host, ...);
			msm_host->ice_init_done = true;
		}
		...

> +
>  	ret = __sdhci_add_host(host);
>  	if (ret)
>  		goto cleanup;
> @@ -2759,6 +2827,9 @@ static int sdhci_msm_probe(struct platform_device *pdev)
>  
>  	msm_host->mmc->caps |= MMC_CAP_WAIT_WHILE_BUSY | MMC_CAP_NEED_RSP_BUSY;
>  
> +#ifdef CONFIG_MMC_CRYPTO
> +	host->mmc_host_ops.request = sdhci_msm_request;
> +#endif
>  	/* Set the timeout value to max possible */
>  	host->max_timeout_count = 0xF;
>  


