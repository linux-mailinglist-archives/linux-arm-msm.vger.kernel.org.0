Return-Path: <linux-arm-msm+bounces-82615-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id A4168C725BA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Nov 2025 07:41:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 8A75E4E023A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Nov 2025 06:41:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1B1221B9FD;
	Thu, 20 Nov 2025 06:41:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IyY9bz/5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F06CD531;
	Thu, 20 Nov 2025 06:41:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763620867; cv=fail; b=YIbebNbju5Of8i3HSOk1k0aExMJYIQmNxlA3Mj7ItbWWMrapjeoo+SoM9sHAgcpP2wK9rtvkuU7uW6gEXhPmNda1I7B2lJDz9vLmeHAJMv+TILWYqSvUoLBF1cWirxyqG0xYN2/P5g0fk5pQycIGfWTEGsdqtn5ZoAfOR2+Gvpw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763620867; c=relaxed/simple;
	bh=2u7nHupECcXO0Rrvteu0jQ2e3t6x/fjl+8DqcT7FiEk=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=t/z9eNiklpKWZ/kVQ0uIW3K2cB7sW5uM0J1LXy+5b3N/qpVfhEHe9Bp0vxkdOo6CEHZ4PEYHyehI8+Z6xwGzZmgJG7uvqSXoshk7ejCknbVvx7lH/f+YHO8UxPQVb0g4iDq3I734otdh4kRC7M0ppRMHTNOCI92i0wpYI8+MqHw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IyY9bz/5; arc=fail smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763620862; x=1795156862;
  h=message-id:date:subject:to:references:from:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=2u7nHupECcXO0Rrvteu0jQ2e3t6x/fjl+8DqcT7FiEk=;
  b=IyY9bz/5mxp/feQJdf5Ct8kgbX9JsqfXuq4Y/GMq/aRsyRDDAppCnT5o
   6fYcdHfNTJviRDNGdFoCg6d5k85+1OBG4cEyOa/QR5OpaKjL3ri7R38l/
   j2B5Q+aEvFAUmVDMr2+qB8BK9yj76zY6PEgKCmjwffnpqAAJdCLAbkZat
   i3YnIDKdHOO/gHVycxgCMwSN4a5sz4DCR4crQLEpdeJMsDrEB5l98VvEy
   oznLUOw/IGOhJw1ZDLpkhEesCiNqklXli5TBFEyefyirqH/4TM6cHnaze
   s7FblCFTILwuKnSqmijQjkQBigsEay6HpgjgW95tfjfjbiMB6HJc0YO7Y
   Q==;
X-CSE-ConnectionGUID: SuPlOrJGQ3aU2SRPx6SCKg==
X-CSE-MsgGUID: 9Cd+mX1dQ9SRPY5T68Tv2A==
X-IronPort-AV: E=McAfee;i="6800,10657,11618"; a="65616487"
X-IronPort-AV: E=Sophos;i="6.19,317,1754982000"; 
   d="scan'208";a="65616487"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2025 22:41:01 -0800
X-CSE-ConnectionGUID: SNrEF9xDTwuWqPFj5V51Mg==
X-CSE-MsgGUID: wAOCOa2kQAKQAojzWWhbSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,317,1754982000"; 
   d="scan'208";a="191705957"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2025 22:41:01 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 19 Nov 2025 22:41:00 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 19 Nov 2025 22:41:00 -0800
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.44) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 19 Nov 2025 22:41:00 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sNgSr++o8UHd8+wyLSgpW7r86afsbxcnPl3xsvxKg3qoObS6aYjXvNgqhExoaeMnOJgWdIhh26RtOclpWfd/NUL4CAF/31k2kfSTQcOlLd6b5DPoNYRgQwU+2koHdSMhale2JK1HwphNW0t1IbGUu69M2joCN2czNqN1sTCsHaqMPv6MrS/l8GOi8jEZA4//vnqu3AzdO4xIpj46UEiKm86B5JSOhwdhqaGptdsuW8HnIBGQ2VT5wVKvBQHhy+XHNGJGFGI9n0NxTqvARmYW7zYFAPU7WevgPI4W2N3b9vQc9ElAudzt2LW9B0WVzWZfYSJMJT57Coeji4zi/JXg8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wlnm7B/HhGiSy0R7vWYAazKHyxprRpyMKFuK64Vjwxg=;
 b=tKjT+bAoDJjQ2LeRmU7q1YcF6FTRxib6mT8mFQ2LDvW14Hn3YQ2cu1hDdtGLWdmxWfsrKLb9jbIsCoJvcjxbzyvUTXJRBnpeYshuIebjtCUMqFVYTMfDEgCPEZPUXBkAZza+HtxYAbYVWkaRH2DIU7Yh4joII28gb/+HbnvL9kT62n13h5esNLM4vOYtYp/NMhxyr6Dulod2NDv2NCK0iyWYcBbTpKbL2eL2L3aSk+eM6Pnv4HvU/uJW+fgxsmF9l5YiL2bKFuhwanY1l+z1z9VVEAxf+2Q4u+DTpiUa20ycRvJByJisYDKhZJ+gxdBeFYQFhvgGEz2bUwSZFLJarA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7198.namprd11.prod.outlook.com (2603:10b6:208:419::15)
 by PH7PR11MB6769.namprd11.prod.outlook.com (2603:10b6:510:1af::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Thu, 20 Nov
 2025 06:40:56 +0000
Received: from IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::eeac:69b0:1990:4905]) by IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::eeac:69b0:1990:4905%7]) with mapi id 15.20.9320.021; Thu, 20 Nov 2025
 06:40:56 +0000
Message-ID: <2888130d-3910-49fe-95ef-3864b1e2ff2d@intel.com>
Date: Thu, 20 Nov 2025 08:40:52 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] mmc: sdhci-msm: Enable ICE for CQE-capable controllers
 with non-CQE cards
To: Md Sadre Alam <quic_mdalam@quicinc.com>, <ulf.hansson@linaro.org>,
	<abel.vesa@linaro.org>, <ebiggers@google.com>,
	<linux-arm-msm@vger.kernel.org>, <linux-mmc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
References: <20251119114653.751992-1-quic_mdalam@quicinc.com>
Content-Language: en-US
From: Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park,
 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 -
 4, Domiciled in Helsinki
In-Reply-To: <20251119114653.751992-1-quic_mdalam@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DUZPR01CA0288.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b7::21) To IA1PR11MB7198.namprd11.prod.outlook.com
 (2603:10b6:208:419::15)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7198:EE_|PH7PR11MB6769:EE_
X-MS-Office365-Filtering-Correlation-Id: 5465a1d7-cd5c-484a-d07d-08de27ffc210
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NVA5TXJzU25tTGJSVzVxUlNUYzBJeWFhQjJIbTVLdFI2ckZadXNpM0gvYktG?=
 =?utf-8?B?RUNZOFdiOVgxa1U4cklEWE9ra000Y1NQR2EzQWtyM3RWemd5Mk9JWE1ReGNY?=
 =?utf-8?B?OHBRc0VGbTVuN29Hb3VTcXBib3N0VmdpbCszcXpZWjRuOXp1M0Y2bXJqcUQ4?=
 =?utf-8?B?TDVTVms2Qnk3TXNXaUpMeFlQVnRpU1FUQ1krcXgzY0VRN0Nid2dvSVA4RTk1?=
 =?utf-8?B?NnRsaEdvR2tRYUJ0QlFyMkl5VEJOOElSbGJES0lFdmNSUkM2TVR0NjdYN25n?=
 =?utf-8?B?aVJ1WGxtWXl4QXBJanFOanpMbnZ3VjRkS3VKY3h4eWpKc013TitTOGtPcDBK?=
 =?utf-8?B?Vm52ai9VcUxRUlVmblVQQ1JuMWN4MmlBVkpPM2Rkck9xYmo1VFhuRVE5L2lD?=
 =?utf-8?B?dk8rZzNSRGNsVVV2b1JOTGxlUFJ6cDM3RW9uY0cwb05YUTkwS0E1S1VGQVhU?=
 =?utf-8?B?aGJ0SFVEYzlTeEVEMldvRDk5aUxSenpUUUZtbW5MYnhuYUkxV2NzTE1VcmdU?=
 =?utf-8?B?MUtjajlwY28vNTI0c0hFMWZQdGdsQkRnR1dKZlNCTXR5Sk1lWE9OQWxla08x?=
 =?utf-8?B?MVhlK2JIVXRXRHdobE1YTjNTNE5oWDVjeGprZmlGWGJ6Zm55SVRsbDhBeFBX?=
 =?utf-8?B?cVBPUW5XdWh1bnY1VzRhSXhYNFE0a3lPNWFnaklPVUp5Y2ZqRnZlRXZ2UlJ1?=
 =?utf-8?B?NTB6ZXlKQ3gzSGtoSWorOFczUnVBR3R5NHV1WktKdnJRSkhlK0RmMXdaZmdC?=
 =?utf-8?B?ZVkxUGJuNEliRGpnV2ZKTzBGdW9DSGFRWE91cHQxMi9ZWUlibzluSHBmTWpu?=
 =?utf-8?B?Tzh4TVhEZENHUkhsaDN2R2U2MDF5dVlUOS8waTVTYnZkdGNhZjZ3MUgyYU9F?=
 =?utf-8?B?UEh0MkR3cVBnMUEyNGx1NFZQTXZlcmlpdENkU2tnZlE1RUl4TlRmZTdmaG1Y?=
 =?utf-8?B?V0hhS3ZYSXU4dVEzM2FqQlV1UUpoR3RKb3NpMzZyZEtoYUhMZk9HdXFTTGdx?=
 =?utf-8?B?OVNFUWdDcWNkeCtuMHBFYzNzbXd1c0laVHRXczFvTjNVRmZ0eUx3TjNRTEtv?=
 =?utf-8?B?S1ZWS0kvTVNVWmxzeEg5RDJkbStSSTJyN1EyT1phbENVSkVNcS9GKzltbnFv?=
 =?utf-8?B?cC9SVWJaSUlhTTVLZVZkaXB5WWh4T1ByaHN1aThwV2UyZm5qQ1VwK0NaYXlB?=
 =?utf-8?B?SG9wOTFPcE8rd1RxYVRrMnhoaE5Ma0gxR1U2TnVUeHFLWnRLUkl2MFRvTnpO?=
 =?utf-8?B?d0lDVVRadlBxQUoxdlR4NWg2U29DU2xuREZZZE9IWlJCZDBUaVVROTBqTnY1?=
 =?utf-8?B?UmJ3RytTVkgxNHNjT0FMVkh2NkczVGpkODJjM2Z2S1BvKzBJOUlZQUNnNDNy?=
 =?utf-8?B?VnJxc1ZDNWdnWmpiRDFXc2pFb3hoamZsSi8zZ2xpWFJrbWFYMjlGMW9OaHp6?=
 =?utf-8?B?NE9GVmxKQ2U3WGFha1RqSDUxRk0zbjJwRVVVbGhTWk5qUXRjdGtyVVhSaWh5?=
 =?utf-8?B?c0dQNFkzOFRDZkFYUlZuZk45N0RieU1yWGpXbE9yUXNhV2NlU2JnWXk0bkxI?=
 =?utf-8?B?MWVZMTVBWG0rbWsvSXo1RFVCd1JHV3dxVjAzSU10MUtSTTJkS24yUXlUWk5r?=
 =?utf-8?B?WVhwcW91Q2dpUkdVOWZNdDN4aHJGRDV1emZ0QitmSzJ5WjFTdnVNZUpzTjV6?=
 =?utf-8?B?NmlTV2tUMTU2ajZyK3JnRVNVR0QwRHpqTHNRY1lsNW1QdWIya2d6Ry9HOG1m?=
 =?utf-8?B?V2JmVFRiQWdyL0VTR0R5UkhYdzBTb0hxS253anRITllQaGtiU2oyQkRub0pK?=
 =?utf-8?B?dGVsc2orQWlNeFNjc1Q2aXhJUlBRS04zMHlORVkvTFBVb1dOKytESWd4c095?=
 =?utf-8?B?VkMwSW9pS1diSFFFaTgxRm5BMWV6R1JSMEg1ZUNCald6TVV1RU05ekhwbW9S?=
 =?utf-8?Q?3w316/mtOjV8oEw0wPbWHM5u9+vkId07?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB7198.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a0paZ2E2S2FjNTVPaVRwVG5xYVR6SzZMd3RuRkdiVmxsMEF4TTM0OWZhU2Uw?=
 =?utf-8?B?a2NmU0gvbHFDQ0pVS05qWTdscUpVbncrYitJdGV5TmI4UVpVZmJTM2NJbTF6?=
 =?utf-8?B?eE9jTUN3NFcxMVpza200S01mNFNiVmJoRkZ6V0Nlbm1CclcrNVg0QW8vbWZ0?=
 =?utf-8?B?czBQa3BlaStpSGlLWVFwSUJQS1ZsSVBzMjFBVmY5TFNUeWIzcGxsSlVCZ1Rj?=
 =?utf-8?B?NkY1LzNEYXk1Sks5M1VIeDhqR0hENEJkVmcvTXNzYU01cnNBZ3dpQzdsVklp?=
 =?utf-8?B?aHNjc0JOT0VZYm5zZVc2cC9hWTJ2dGxmNGhhcTFPdHlwUTYrVDZsL0JNV25N?=
 =?utf-8?B?MDN1QjdIOTNxTE1RR3JyV092SkVDd0Exb1pzWFQwWUNtYk9rMVdsVEFiRSt4?=
 =?utf-8?B?Z3Bvak04SjhBd1hGaXQ3UENPNlpoWjFkbHhReWdiM3VLWitHYjRHTmhDdFF4?=
 =?utf-8?B?RXk2aFdVbm1QeThRaDRNY1Y3OUl1MlpxNTRuVU5WZ1hvTGlKN24yejJtMkpW?=
 =?utf-8?B?RGwwbko0endmNUh1di9zck50ZkxIV2RpM0JzY3pNLzBDd1hnWVFSUmJVRUVV?=
 =?utf-8?B?aFkwbVhLQ29mUVlaT0g4TWxCK0REbGs3VFJPUExzMnpXbEtFMUdiNlJDcW4v?=
 =?utf-8?B?aXM3T0ZLRjRoaURPMTNWUzVRWDk1UEVDb3N0dlViKzQ3UEZVYWJkQW84emY4?=
 =?utf-8?B?Q0NJYVREMlMrM3E1SmZsbnFib0tYRXNlb2FPZngzWUZ4Y2VoTisvbTZiWlBJ?=
 =?utf-8?B?ZlBXM1d0WWRNMUJIL2UyNHN4eGRaZ1R2eG11UGYrSkc2Y2Q3cjc4eVhQR1RH?=
 =?utf-8?B?U3kvRFJaQkZXR1lvNHBsTUg2THFqbWowL0xnRTg5bzJ5amphY0pQU1lVemlM?=
 =?utf-8?B?TWtMTGJPS1prNVJGZ3dIMFl2NWVPRmNUSjVzbWdOdXZuZjcycU9qeStreEFG?=
 =?utf-8?B?RENPeDlzY2UvOTZLWjYxN1A4eE1IYms4WWVVdVkreFVKbmFlbWUzcGMwNFl1?=
 =?utf-8?B?am1XTk5LZGhoQnFkTlhFdGZJSWwxRWVsbXBoc1VtQ0Y2QmUwYTJxS2FlVWYy?=
 =?utf-8?B?b3ZjSC8zbWhka1VqaS9xaXBJdU9lSWFVUmFOUU5ITzNiVEpEQWt5Y2ltOFlm?=
 =?utf-8?B?ZGNHRG9iSCtwVkpiVTYyYURySmk2dm02RUlyNSsxOEs4bXFFbURIcm0zc1ZL?=
 =?utf-8?B?aXdKdXhRWFFHRjNFa2dJd3hGdkdHYU1pdDg4b0dnaUhWRUhzSnp0T0lWMDJW?=
 =?utf-8?B?MGU0R2JwS1pnYVdoaXFMNWord0xHNCtjc1haa2kzbnNMbGxyN2tWKzFJeTFK?=
 =?utf-8?B?cWpRVkFkaGdOUnNoNTQ3c3NjUmRLUU8wZ1p6N1lTNW00U3IrRW9ZWTViSGhn?=
 =?utf-8?B?U3FHMGphMVB0Rjc1NWFUY3h6Rm1BUTdQOGwzeVV1QlJ0c2VQWURaaGJhUG5X?=
 =?utf-8?B?cFQ0dkt0QURvamJOQmNUejZ1SWh6VVlOYlFBQWcyOGZpc3JqWFlvUHdUZGZr?=
 =?utf-8?B?c010eFdhUGZIS2p4OG42TkM1WTBSb0x1cmp4U3pMU3J5WSt0L1BLMHJFd3RU?=
 =?utf-8?B?QWhkVFB4SE9UKzhmemdGa0lOa0RETTRKbGRZQ0VTTXplZllFNjlic2xGbFNJ?=
 =?utf-8?B?Q01tcS8rTUlrZlVub1JrMW54ZVlIL1BjcllyTW5sYXRVdEF4NStlTUhXV2Vr?=
 =?utf-8?B?MlN4ZWNTUmFVRDJIUzJTWDY3WVMxcC9DRUpLYWNqZkgwOXp0a2dNN1Z0bDFq?=
 =?utf-8?B?cGk4Rk9XRlZVcnYzTUozNldJUno3Wm1Nc1I4ZDFOVzFEVWxEc1FZMFdPYmhC?=
 =?utf-8?B?QnhpZHovY2sxUFB4UEllWjdzLy92ZjBRVy80MWN3UEdEWjRHT3czRjFQZmYv?=
 =?utf-8?B?MlNlalhHR0F2b2NHSTZsbEN1R2J5cEhEeTBlUXc3dUppeW56ZS9vbjc0Zm1x?=
 =?utf-8?B?Y1pjV0JyV3lqZFJCbVphMjdmUWtpcWlGVG1wUTBPNmVac1VqTnB4ODlweWFZ?=
 =?utf-8?B?NUx6NUVBbnBRUDg4dnA3YUZSL2YvV1BBKzM5WFFLdFZJaGNLMTV1c242QUJK?=
 =?utf-8?B?VUJhYUJBcFdMK2d6T1V2MHBkVUlaQVc0SDRVSlU1SmFZekh1cTNHVlBUZWdX?=
 =?utf-8?B?NjR4bGxQUVFZV0VuZUJIRk5MT3ZqUE10N2svbS8vRW1rZC9LdnY1ZHFLRE0x?=
 =?utf-8?B?VXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5465a1d7-cd5c-484a-d07d-08de27ffc210
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7198.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2025 06:40:56.3187
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G/fE6SVZeygwFr5GA/T4a5zXvdqCObTZbCF3Mkf4OeoqPo8dYtAFES6Vv/7G3kdBZ0h4lzlTRo7fcZS+4hHZDQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6769
X-OriginatorOrg: intel.com

On 19/11/2025 13:46, Md Sadre Alam wrote:
> Enable Inline Crypto Engine (ICE) support for CQE-capable sdhci-msm
> controllers when used with eMMC cards that do not support CQE.
> 
> This addresses the scenario where:
> - The host controller supports CQE (and has CQHCI crypto infrastructure)
> - The eMMC card does not support CQE
> - Standard (non-CMDQ) requests need crypto support
> 
> This allows hardware-accelerated encryption and decryption for standard
> requests on CQE-capable hardware by utilizing the existing CQHCI crypto
> register space even when CQE functionality is not available due to card
> limitations.
> 
> The implementation:
> - Adds ICE register definitions for non-CQE crypto configuration
> - Implements per-request crypto setup via sdhci_msm_ice_cfg()
> - Hooks into the request path via mmc_host_ops.request for non-CQE requests
> - Uses CQHCI register space (NONCQ_CRYPTO_PARM/DUN) for crypto configuration
> 
> With this, CQE-capable controllers can benefit from inline encryption
> when paired with non-CQE cards, improving performance for encrypted I/O
> while maintaining compatibility with existing CQE crypto support.
> 
> Signed-off-by: Md Sadre Alam <quic_mdalam@quicinc.com>
> Acked-by: Adrian Hunter <adrian.hunter@intel.com>
> ---
> 
> Change in [v5]
> 
> * Removed unused variable
> 
> * Added proper comment for sdhci_msm_request()
> 
> * Removed sdhci_msm_ice_enable(); it is already invoked during resume
> 
> Change in [v4]
> 
> * Moved ICE initialization for non cmdq into sdhci_msm_ice_cfg() and made
>   it conditional on mrq->crypto_ctx to enable lazy setup.
> 
> * Added msm_host->ice_init_done guard to prevent redundant initialization.
> 
> * Updated commit message
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
>  drivers/mmc/host/sdhci-msm.c | 101 +++++++++++++++++++++++++++++++++++
>  1 file changed, 101 insertions(+)
> 
> diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
> index 4e5edbf2fc9b..69c67242519c 100644
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
> @@ -300,6 +312,7 @@ struct sdhci_msm_host {
>  	u32 dll_config;
>  	u32 ddr_config;
>  	bool vqmmc_enabled;
> +	bool ice_init_done;
>  };
>  
>  static const struct sdhci_msm_offset *sdhci_priv_msm_offset(struct sdhci_host *host)
> @@ -2009,6 +2022,91 @@ static int sdhci_msm_ice_keyslot_evict(struct blk_crypto_profile *profile,
>  	return qcom_ice_evict_key(msm_host->ice, slot);
>  }
>  
> +static void sdhci_msm_non_cqe_ice_init(struct sdhci_host *host)
> +{
> +	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
> +	struct sdhci_msm_host *msm_host = sdhci_pltfm_priv(pltfm_host);
> +	struct mmc_host *mmc = msm_host->mmc;
> +	struct cqhci_host *cq_host = mmc->cqe_private;
> +	u32 config;
> +	u32 ice_cap;
> +
> +	config = sdhci_readl(host, HC_VENDOR_SPECIFIC_FUNC4);
> +	config &= ~DISABLE_CRYPTO;
> +	sdhci_writel(host, config, HC_VENDOR_SPECIFIC_FUNC4);
> +	ice_cap = cqhci_readl(cq_host, CQHCI_CAP);
> +	if (ice_cap & ICE_HCI_SUPPORT) {
> +		config = cqhci_readl(cq_host, CQHCI_CFG);
> +		config |= CRYPTO_GENERAL_ENABLE;
> +		cqhci_writel(cq_host, config, CQHCI_CFG);
> +	}
> +}
> +
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
> +		if (!msm_host->ice_init_done) {
> +			sdhci_msm_non_cqe_ice_init(host);
> +			msm_host->ice_init_done = true;
> +		}
> +
> +		crypto_enable = true;
> +		dun = mrq->crypto_ctx->bc_dun[0];
> +		key_index = mrq->crypto_key_slot;
> +		crypto_params = FIELD_PREP(ICE_HCI_PARAM_CE, crypto_enable) |
> +				FIELD_PREP(ICE_HCI_PARAM_CCI, key_index);
> +
> +		cqhci_writel(cq_host, crypto_params, NONCQ_CRYPTO_PARM);
> +		cqhci_writel(cq_host, lower_32_bits(dun), NONCQ_CRYPTO_DUN);
> +	} else {
> +		cqhci_writel(cq_host, crypto_params, NONCQ_CRYPTO_PARM);
> +	}
> +
> +	/* Ensure crypto configuration is written before proceeding */
> +	wmb();
> +
> +	return 0;
> +}
> +
> +/*
> + * sdhci_msm_request - Handle non-CQE MMC requests with crypto support
> + * @mmc: MMC host
> + * @mrq: MMC request
> + *
> + * This function is called for non-CQE requests only. The MMC block layer
> + * routes requests as follows:
> + *
> + * if (host->cqe_enabled)
> + *     ret = mmc_blk_cqe_issue_rw_rq(mq, req);  // → cqhci_request()
> + * else
> + *     ret = mmc_blk_mq_issue_rw_rq(mq, req);   // → sdhci_msm_request()
> + *
> + * For CQE requests, crypto is handled in cqhci_request() in
> + * drivers/mmc/host/cqhci-core.c using the existing CQE crypto infrastructure.
> + *
> + * For non-CQE requests, this function provides crypto support by configuring
> + * the ICE (Inline Crypto Engine) registers before passing the request to
> + * the standard SDHCI request handler.
> + */

Kernel-style is not to put kernel-doc like comments on call-back
functions, since the functionality is defined by the upper layer,
and there is no point duplicating the information for every single
implementation.

> +static void sdhci_msm_request(struct mmc_host *mmc, struct mmc_request *mrq)
> +{
> +	struct sdhci_host *host = mmc_priv(mmc);
> +

A simple comment here would suffice, say something like:

	/* Only need to handle non-CQE crypto requests in this path */

> +	if (mmc->caps2 & MMC_CAP2_CRYPTO)
> +		sdhci_msm_ice_cfg(host, mrq);
> +
> +	sdhci_request(mmc, mrq);
> +}
> +
>  static const struct blk_crypto_ll_ops sdhci_msm_crypto_ops = {
>  	.keyslot_program	= sdhci_msm_ice_keyslot_program,
>  	.keyslot_evict		= sdhci_msm_ice_keyslot_evict,
> @@ -2759,6 +2857,9 @@ static int sdhci_msm_probe(struct platform_device *pdev)
>  
>  	msm_host->mmc->caps |= MMC_CAP_WAIT_WHILE_BUSY | MMC_CAP_NEED_RSP_BUSY;
>  
> +#ifdef CONFIG_MMC_CRYPTO
> +	host->mmc_host_ops.request = sdhci_msm_request;
> +#endif
>  	/* Set the timeout value to max possible */
>  	host->max_timeout_count = 0xF;
>  


