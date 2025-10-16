Return-Path: <linux-arm-msm+bounces-77516-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B3C5EBE1B62
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Oct 2025 08:25:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B712219C7BD4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Oct 2025 06:25:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FDC32D3A94;
	Thu, 16 Oct 2025 06:25:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e3iBsF/f"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5166D21CC44;
	Thu, 16 Oct 2025 06:25:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760595920; cv=fail; b=Zcwdt9a2XsXdRbveRde4tngxHcA+z0TUsQwIrqyS6+iz31Mi6G3sQbpDEjYk2Wjvgo7M5AXRxBFa+NF079U+ctbNV6kLIcqEe23Aco3L+6KSPn4NZIaDG4E027h7yyjL27Pj7pKrzJuxhlDTXDDyJDCaDYYySbD3T+4VLb0kHfA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760595920; c=relaxed/simple;
	bh=0scbTsYg1ypZjOUHTZyqhjQDmWisCe08glGbSjeYUZ8=;
	h=Message-ID:Date:From:Subject:To:CC:References:In-Reply-To:
	 Content-Type:MIME-Version; b=N5dEcmYsT2+TgqFYC8O+ViuroyYZ+Xf1h7v4Bmg35pDSqX/bhilY+MkAd3u56oRA8u7e01Oqzgyo6SCidiXLOjgud0yS26Lc6xAlPlHBmuVII2vg0gTdFxQeJCNlV6bvId7Le8zZX7V7UE1zfogZnPSGnPDtIKQFCjivBG1hBao=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e3iBsF/f; arc=fail smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760595917; x=1792131917;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=0scbTsYg1ypZjOUHTZyqhjQDmWisCe08glGbSjeYUZ8=;
  b=e3iBsF/f6repmrpW88DBNg5wBfmkliry8eWUYY4ZMoMiVvc3je8hpMaG
   kWEbvJNZzsNYuiVJoqOeycv/44+YHfOEUp4gjiGIkEjvI+//og/WqhS2b
   XbQ1PjFLhrqQ58zfxqJGNwzyNhW33+3GqobEp9yatN6EBxn/ujmE7fRCA
   mayEm8l4hjM4ypVTzwg5JSXeeH/41qEIu7zSihGFRMQNMlnjlWrfMQHz6
   NamoMMdQotlMYGA0Yqm1POWcMjfznfaqDr9yjWep+RREk86TdvxrvMw3/
   D4TEGfjJqq8GR91Wx5FHnjHbIlo0rydIVdcB2aNEo5XSSHIYsXxS0+cLI
   w==;
X-CSE-ConnectionGUID: cI5Q3ylGQ5qkhen8bktzjA==
X-CSE-MsgGUID: MshkxfrITfiYNT/1P5jXzw==
X-IronPort-AV: E=McAfee;i="6800,10657,11583"; a="62872787"
X-IronPort-AV: E=Sophos;i="6.19,233,1754982000"; 
   d="scan'208";a="62872787"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2025 23:25:16 -0700
X-CSE-ConnectionGUID: NyCVCOkWS3GZYaF6gO4JUg==
X-CSE-MsgGUID: PiT3Q9X/Sr2bqhqZQL/ipw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,233,1754982000"; 
   d="scan'208";a="181925743"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2025 23:25:15 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 15 Oct 2025 23:25:14 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 15 Oct 2025 23:25:14 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.47) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 15 Oct 2025 23:25:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZyHQfpTL/VbkNYfcCrM9pIzG5GZxTQQPX/SWeDz5uA4DoLmJ1a7AkWZCFp0XsKMHtq20FTSkYH7hdp4d03RhIOPPGfxeHAyFzD5zTdbWWyPwgCh/JX3jyP2xcONp9nZbdGgsnw2AGFmdl+uda/G6okBoUcUxd02CGMksmRa7GdA+l8NpFntE7RGwMry0ephvv/5NdUo4S9HVToXz970Cd8KpkZkcXS3Y6vzLYqgtlZSXTvk22Epff1zGVIQxzzzq3GVcSgAaUjvcEwN4tTGu+UPDfbGrC4sVxiPmAsOxX83V+eUlOv8cpw8DICaVSxygQBfErC2874+QiOA+R7dtvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uDNm1oYvXbhlBF2PYM0X/zAAyIghaJZLOcrWrELZPt8=;
 b=TNpDCkJsUfjXl/6hbyR2RddfMGNuqEwbGI6cM6p6sCVHLgGsrna5wcPqbmCL4WwaZkad3A8ZAE4FhpQGaIBgEhmtsUn4W13m0aOm5PA3GSDCjW6ZeyFr4scYlejIBKZsnHe/sZAFjkvgMrG3VUkzQSeKST1y/O8g2azkrfMw3Jso09+M7ILvamj8SWGBxCJzCR7xFk2ahCWmkiHxZfEQ1AGSho8sUh/6+PZg4qfELAh73bov0qP5yVy18HuRSZ3TzspeejBu10nezJyykxrAw1RfplrmbNM8Bb1WFUjk6OUcirMRHpFsVNAU2rCJ26l17RVO3ArrCsGwYlhbzBEb2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7198.namprd11.prod.outlook.com (2603:10b6:208:419::15)
 by PH7PR11MB5885.namprd11.prod.outlook.com (2603:10b6:510:134::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.13; Thu, 16 Oct
 2025 06:25:03 +0000
Received: from IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::2c4e:e92a:4fa:a456]) by IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::2c4e:e92a:4fa:a456%3]) with mapi id 15.20.9228.010; Thu, 16 Oct 2025
 06:25:03 +0000
Message-ID: <1320d1a3-0554-4fbe-a2f2-7f6d4f50a3c4@intel.com>
Date: Thu, 16 Oct 2025 09:24:58 +0300
User-Agent: Mozilla Thunderbird
From: Adrian Hunter <adrian.hunter@intel.com>
Subject: Re: [PATCH v5 4/4] mmc: sdhci-msm: Rectify DLL programming sequence
 for SDCC
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
References: <20251013145316.1087274-1-quic_rampraka@quicinc.com>
 <20251013145316.1087274-5-quic_rampraka@quicinc.com>
Content-Language: en-US
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park,
 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 -
 4, Domiciled in Helsinki
In-Reply-To: <20251013145316.1087274-5-quic_rampraka@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DU7P251CA0013.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:10:551::34) To IA1PR11MB7198.namprd11.prod.outlook.com
 (2603:10b6:208:419::15)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7198:EE_|PH7PR11MB5885:EE_
X-MS-Office365-Filtering-Correlation-Id: 10bda712-00ff-4744-a978-08de0c7cbd8d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TkhMdWNGWnlmNjhxU2RIbE1aYTJpVE5qRlBUYTR5VFE3a0pUTmpSdzM1VGt2?=
 =?utf-8?B?M1hVR1ljcFdnMHNpZDhYbXMydmtub1dHVzNGSlJ6NXFBOGNDV2NqaEUzWnpj?=
 =?utf-8?B?V0NGc0c2U3ZncWlsTGNnR0RhdW9seUZoZUxzeFpQSHo3WnVaeGhteTdncE1X?=
 =?utf-8?B?VUFFdWRhNlU4dFNLNTdqZ0hUMDBKbGxYU1Zxcy9GSHd2cGdiVVh4RHVDNmJK?=
 =?utf-8?B?aWxoaWdyQXRwVDBlbFlnM1MrL1h5dm44OTRYdHQreEJLM0xrNmtXbndJdGJR?=
 =?utf-8?B?UkdGZldtNmJQSGtMT0EyRkdaekVQOG5LUlBMait1Z0taM0VZK3ByUTROc2hv?=
 =?utf-8?B?ZEpCOUNWVUlaVTR6SVdxVXRqQk04M0tDWWQzZllVdXo5blJIWXJRM1RPY1dO?=
 =?utf-8?B?SFM4SlBFRG8xVzJIMlN4YXlUK3ZQL1lkWi83T0JERTk1bUwxQUJkMnRVUFFW?=
 =?utf-8?B?aElmeW1qQno3UGZ1ZXBGeHpmNHJyd1hMbnFhUVBWNEJ1WWNCblpkT3NJYjZJ?=
 =?utf-8?B?azg1Z3dMMHgwTFNGbWhXZzJqb1ppZk1UZndxMzU4ZFAxRVFZM2NNcTNML0hw?=
 =?utf-8?B?RDhPcVcvdVhQWEE0VmxsL2dCZzNDZzZnSGFMejRwVkdzME1kUGNabHdpL3Qr?=
 =?utf-8?B?Ky83K2tUWCtqYmtyMWpUQW95UHo0N2Y4NEl4dXpVdis1Vmx4MVJQTVgybUdU?=
 =?utf-8?B?VFZFMVFQWHI1RlRqRHZoNmJKa21KbGlyVnhnVXVINlBWSlhETUlId2RwMWlK?=
 =?utf-8?B?YTNwRHB6WWhMb0YxWXlyK2JxVHNSczdUMUYzUjJ6b1lOVGNUa1dHOGhKSDhG?=
 =?utf-8?B?Z1VRTHRJNThObGZYMm9XY0lxT1kyMWtmZ0dydnRxeklKakdubXBseFhSaVVT?=
 =?utf-8?B?NXRGWk9JTEw2YkZDUVBXOFZ3ZjBUOVlhcGdrRGlZS2JDN0RLa0VXOGZHMDJH?=
 =?utf-8?B?eS9udDZlc2RoVGd0aW8rK2hJOHBtck5XS2RDNlNjM1c1SDQ1SzhSQjQvNHlw?=
 =?utf-8?B?cHBnUHR1dDlZMEZaVWd4dnMzcVNtQ3EraGg4NlZtSVNTczlnNWtsVFYzbm0v?=
 =?utf-8?B?TFpZcVNHdGx3UVFCWGZsRlB1cDNjSVpJVW4rQjJFTy9aMjh3bUh2QzAvVnds?=
 =?utf-8?B?aWxqamtpelRjdEtBb2FYUFdPM0VtS0xucG1XSEFBZUcycnZBOEJPQ20xSE5t?=
 =?utf-8?B?cEpaeGFwNWUzcENHNGJiYTJNby9RaUFvRXBybmt4ZFMrUjMzb2pjdUhlS3V5?=
 =?utf-8?B?RWJkWUxVWUtuRlNMdDhsZndnYSswYVJyTXFmd0hIRk5UQjJqTGErczVlTWZn?=
 =?utf-8?B?aUFrM1oxVzNwVTR0MHRUSHFud0RGaXlUL2NVcGdLbk1kSE1FTWo0WUMxWkQ1?=
 =?utf-8?B?MUJUK3lXa01oL0x6Vno0WEYvTytIZmliWU1CMW0wNmRNQnEwZjNtR2RzVm0x?=
 =?utf-8?B?emJBV3kvNllPcWRJUXdCZ0hqK2xEM1EvQkh5dkVQcVR1VGh2RkMzYy9Xd2Rk?=
 =?utf-8?B?NXZGMm1KcnE5SEdzb1ZwNGdvS3pkYVo1YXFOeVZxVlZkUXVYb0dsSkY5ZWVP?=
 =?utf-8?B?S2czUEg4bU5VcEJqWFI1YjllR3RzTmF3SEZ1RWNNTEt0bnJTQXJ6cTFtcFhM?=
 =?utf-8?B?N0h0WEVpbGltVUxOUjJhdDJMbVE2M0g2Wkh1dmVKR2dtUE5GMXJiSTRRTFk5?=
 =?utf-8?B?Z2huRjNzY0tyU2NqWWdlK3pJUy9Ib3ZOYzROZDlQLzEzOGYrd3ZmUUVmMjF1?=
 =?utf-8?B?Zmd4YjUvVnlzVlBpeUxEYmFxcWtYL21neGllUlMrRzR5N0UxcWFUZElLVVF3?=
 =?utf-8?B?RWxlVzlCSEYyUS9YQ0Mzd1gzVE8rSXNMNDkxeVFyeWphUTlPMzZzZkJxdktG?=
 =?utf-8?B?akQ0OE02K0dVMktNNzVJT1lNOFRwUGhmbWMxbmQ2eUxJa2owV1RRZHlJRVFQ?=
 =?utf-8?Q?LreZZ2A3O6eYmA7Xi3oC5pVf7EzZpwzj?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB7198.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WEtiMFEvalBxcDFrZ21VRk9DTXNvSzExTDlzK0xOWTZ3Q2FoOTJLSlFNZTY5?=
 =?utf-8?B?MGt6L0VwMkNtKzNKL1A4V21ndUlTZW43RjUwOUZJSUdmdVZ5YmF1NnZKenBk?=
 =?utf-8?B?c0Jzc1dKRk1WY3JUanZuVlJhRWRJdHV4ajE3KzVwOXlYODkxbU95TGl6QnBT?=
 =?utf-8?B?YS9ZVExRQVViNVZVTmNlYVV5aWNmSEh0b3k1L0VjTmdBOEpEeE1vd1owektZ?=
 =?utf-8?B?ZXN6emozdG1IUTdROUd6RmlTUWxTa1NCcURteFd5UVJ0WlY0dlFWeUU2M29M?=
 =?utf-8?B?bG1rbldhT2ViVjRKSXRWSENuKy9VTERsdThtOWhUc2VPbmRFRzZLUDBEcXRw?=
 =?utf-8?B?RnlUaDNZem1UZ2ZwR2FBY0hLQmdnMmtSWm9UTG96NW9NN0JwaXdqNGVZK1Qx?=
 =?utf-8?B?dVVoZ2IvZEU1c2U4YWlkUnZZcllvZHJqNWRyNCtsRXRZeEZWVVd1VHI2Q3Za?=
 =?utf-8?B?UFhxYitGbkcwd0Y0d2gzWUN5S2pNWDN2TURvY2s1akgxdFovSmNGSU1nVEdC?=
 =?utf-8?B?N3lRMDI1cGIwOGlucWUrOFY0QTZwcGM1YytzUm8wT0ZhTU13bkYvWFNnK0xu?=
 =?utf-8?B?RGU3WUlVS1JkeTIwZHdGbE9ZMWZ0K0VWb1hqdlVjc3p0OFJVbERxWG9rUWJT?=
 =?utf-8?B?ZWpPcmtyY0kvNXpQUWNNZU5tTDI1VXRMT1pVUWozUFRZZWxYS3BjNWFCeDhO?=
 =?utf-8?B?UWRWUVkxZ3VPNk5CcVFUd0NEcHJZeENnYUZHanloYllURkY2MVdpUDZnWFda?=
 =?utf-8?B?bjRLL1RTOGZrSENTK2ozZnFsV2d5RjVkdU9qRTArS1JyWlgzV1dIMG1LdVMy?=
 =?utf-8?B?ZjFYTWhWNDZjWkVLS0IzbUdXeDJTcCs5ajN4Z0YyTHZCVGZOUWxvZll6dHlJ?=
 =?utf-8?B?bGhCbnpIc1BNTXFFYWx2Y3JvdHFPZEhkd1dhOGl1eWk1U0R4Y1BnWG1HazNQ?=
 =?utf-8?B?ZFpsb0FJMmQ1ZWxJdjBmZ0htK2lTbWxhTTMwdEttTFkzL21sMHJESzVWbjU3?=
 =?utf-8?B?TXJnMGs2N05IbE1VMkJ5R29Fb2llbEdHb3BrTTYzQW8rRkNwdVFYRnQ5eGx5?=
 =?utf-8?B?SGc2OXRSVkJ3TzBoMTRERHZ6N0JycU1qWXpZMWZiRlRWOTZNZkZ6YXlxWlJJ?=
 =?utf-8?B?cmx1NkRYSkU2MkVlbnI1RjZST2pKQU1GSjA0TTdydWpiclVzMlJ5RnhIdDVH?=
 =?utf-8?B?bHFDZUZqaHRGQ2twMUJoaHdJRmpHWGtkcS94TUt6NDZObm9BeWZrYjhXajd2?=
 =?utf-8?B?OGhLUXMzZ1QrLzVkU2FyWjREQWxpbWFCY1FSdVl0NkJRTTlYUXRzTU0wd2pD?=
 =?utf-8?B?Sm9PbHN6SzRuRzBqYXFESkk1Z09KemFnbnd6dEdBYThuQXNWN25hVHRoUWZn?=
 =?utf-8?B?ekFRNm4zZUhlK2ltNXJ1RGQzcHRqanE0SmZwVUtoMm5IazJSbjJBS0FBUGxp?=
 =?utf-8?B?bm5JWUt4OE1KNzZRNS9EVkQ5ZHZtdUtTeXN2ZVRiMHYzQUJQZ3RYK1cyWGtI?=
 =?utf-8?B?ciswL01iTDl0SWlETStQSC85Zjk4Wm9PalhDK0FNU0J5a05scEZHam1zUTR3?=
 =?utf-8?B?Z2tacGduTXFkdzZZMndlSktraDZBYUlJOWFmYUlOdHB1UG5XSm8rbkphMjBC?=
 =?utf-8?B?SXJucE1BNjNkcXNoUjJORFJTdnpEYk1jUm11UGQ4MWFJOFZJK2djMlpyaitH?=
 =?utf-8?B?UVhIWnAxTmhjRjI3QjIvSVVsekxwODFsMHdydW41RXh2OEpuQ1dJSzl5UzVK?=
 =?utf-8?B?MUdnWUl4aFlBalhVUVpPNmk2UmJ0OG9OSm5qU05XRVBsZ0xoMTZwdCtaLzRq?=
 =?utf-8?B?QjlZZy9WendRMzFJbVBwWXRIbUVKUUZNZEFGOUcwbTh4NGFieDR4UCtIbWpW?=
 =?utf-8?B?blFEVTh1OFJLWUVVRVlmZ1ZpZ0RjRmRhNVprYm84MThiL2NmVXpyRnV2VXRZ?=
 =?utf-8?B?dkpCQzJwRmNtOGZiZDNVZTkrS2hNL2NRMkE2T21VN3p6WHZnZDJoOWYxeGls?=
 =?utf-8?B?Mm5UMUttTnY0c3JXbUYzbUszem0zU2RxRGp5V2RtQ01UOUY2QUMxbGxKVlN6?=
 =?utf-8?B?a0FLRzNMbzk3Z001aVk4a1M5QXZ5ZjlScTBnbWdxM1ZvZTB1bG16MlI4M0lD?=
 =?utf-8?B?R2hJcUxQVlFzUG1IZHZ3UW5qSTBxYUxNczR1bTRhUmJuNUFXMHg5OEt5UmZJ?=
 =?utf-8?B?WGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 10bda712-00ff-4744-a978-08de0c7cbd8d
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7198.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2025 06:25:03.2878
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e7jYZ0XvTvYgJOJRPbT3ksusA/EN03x9r38cY231FaIXsCfPtz3lWFkDtFlQ3qFtxcKqEqOSv9AQ0SxQOAk6xg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5885
X-OriginatorOrg: intel.com

On 13/10/2025 17:53, Ram Prakash Gupta wrote:
> From: Sachin Gupta <quic_sachgupt@quicinc.com>
> 
> With the current DLL sequence stability issues for data
> transfer seen in HS400 and HS200 modes.
> 
> "mmc0: cqhci: error IRQ status: 0x00000000 cmd error -84
> data error 0"
> 
> Rectify the DLL programming sequence as per latest hardware
> programming guide
> 
> Signed-off-by: Sachin Gupta <quic_sachgupt@quicinc.com>
> Signed-off-by: Ram Prakash Gupta <quic_rampraka@quicinc.com>
> ---
>  drivers/mmc/host/sdhci-msm.c | 272 ++++++++++++++++++++++++++++++++---
>  1 file changed, 253 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
> index 8038b8def355..a875e92f8663 100644
> --- a/drivers/mmc/host/sdhci-msm.c
> +++ b/drivers/mmc/host/sdhci-msm.c
> @@ -28,6 +28,7 @@
>  #define CORE_VERSION_MAJOR_SHIFT	28
>  #define CORE_VERSION_MAJOR_MASK		(0xf << CORE_VERSION_MAJOR_SHIFT)
>  #define CORE_VERSION_MINOR_MASK		0xff
> +#define SDHCI_MSM_MIN_V_7FF		0x6e
>  
>  #define CORE_MCI_GENERICS		0x70
>  #define SWITCHABLE_SIGNALING_VOLTAGE	BIT(29)
> @@ -119,7 +120,8 @@
>  #define CORE_PWRSAVE_DLL	BIT(3)
>  
>  #define DDR_CONFIG_POR_VAL	0x80040873
> -
> +#define DLL_CONFIG_3_POR_VAL	0x10
> +#define TCXO_FREQ               19200000
>  
>  #define INVALID_TUNING_PHASE	-1
>  #define SDHCI_MSM_MIN_CLOCK	400000
> @@ -319,6 +321,16 @@ struct sdhci_msm_host {
>  	bool artanis_dll;
>  };
>  
> +enum dll_init_context {
> +	DLL_INIT_NORMAL,
> +	DLL_INIT_FROM_CX_COLLAPSE_EXIT,

DLL_INIT_FROM_CX_COLLAPSE_EXIT is never used?

> +};
> +
> +enum mode {
> +	HS400, // equivalent to SDR104 mode for DLL.
> +	HS200, // equivalent to SDR50 mode for DLL.
> +};
> +
>  static const struct sdhci_msm_offset *sdhci_priv_msm_offset(struct sdhci_host *host)
>  {
>  	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
> @@ -803,6 +815,209 @@ static int msm_init_cm_dll(struct sdhci_host *host)
>  	return 0;
>  }
>  
> +static unsigned int sdhci_msm_get_min_clock(struct sdhci_host *host)
> +{
> +	return SDHCI_MSM_MIN_CLOCK;
> +}
> +
> +static unsigned int sdhci_msm_get_clk_rate(struct sdhci_host *host, u32 req_clk)
> +{
> +	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
> +	struct sdhci_msm_host *msm_host = sdhci_pltfm_priv(pltfm_host);
> +	struct clk *core_clk = msm_host->bulk_clks[0].clk;
> +	struct mmc_ios ios = host->mmc->ios;
> +	unsigned int sup_clk;
> +
> +	if (req_clk < sdhci_msm_get_min_clock(host))
> +		return sdhci_msm_get_min_clock(host);
> +
> +	sup_clk = clk_get_rate(core_clk);
> +
> +	if (ios.timing == MMC_TIMING_MMC_HS400 ||
> +	    host->flags & SDHCI_HS400_TUNING)
> +		sup_clk = sup_clk / 2;
> +
> +	return sup_clk;
> +}
> +
> +/* Initialize the DLL (Programmable Delay Line) */
> +static int sdhci_msm_configure_dll(struct sdhci_host *host, enum dll_init_context
> +				 init_context, enum mode index)
> +{
> +	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
> +	struct sdhci_msm_host *msm_host = sdhci_pltfm_priv(pltfm_host);
> +	const struct sdhci_msm_offset *msm_offset = msm_host->offset;
> +	struct mmc_host *mmc = host->mmc;
> +	u32 ddr_cfg_offset, core_vendor_spec, config;
> +	void __iomem *ioaddr = host->ioaddr;
> +	unsigned long flags, dll_clock;
> +	int rc = 0, wait_cnt = 50;
> +
> +	dll_clock = sdhci_msm_get_clk_rate(host, host->clock);
> +	spin_lock_irqsave(&host->lock, flags);
> +
> +	core_vendor_spec = readl_relaxed(ioaddr + msm_offset->core_vendor_spec);
> +
> +	/*
> +	 * Always disable PWRSAVE during the DLL power
> +	 * up regardless of its current setting.
> +	 */
> +	core_vendor_spec &= ~CORE_CLK_PWRSAVE;
> +	writel_relaxed(core_vendor_spec, ioaddr + msm_offset->core_vendor_spec);
> +
> +	if (msm_host->use_14lpp_dll_reset) {
> +		/* Disable CK_OUT */
> +		config = readl_relaxed(ioaddr + msm_offset->core_dll_config);
> +		config &= ~CORE_CK_OUT_EN;
> +		writel_relaxed(config, ioaddr + msm_offset->core_dll_config);
> +
> +		/* Disable the DLL clock */
> +		config = readl_relaxed(ioaddr + msm_offset->core_dll_config_2);
> +		config |= CORE_DLL_CLOCK_DISABLE;
> +		writel_relaxed(config, ioaddr + msm_offset->core_dll_config_2);
> +	}
> +
> +	/*
> +	 * Write 1 to DLL_RST bit of DLL_CONFIG register
> +	 * and Write 1 to DLL_PDN bit of DLL_CONFIG register.
> +	 */
> +	config = readl_relaxed(ioaddr + msm_offset->core_dll_config);
> +	config |= (CORE_DLL_RST | CORE_DLL_PDN);
> +	writel_relaxed(config, ioaddr + msm_offset->core_dll_config);
> +
> +	/*
> +	 * Configure DLL_CONFIG_3 and USER_CTRL
> +	 * (Only applicable for 7FF projects).
> +	 */
> +	if (msm_host->core_minor >= SDHCI_MSM_MIN_V_7FF) {
> +		writel_relaxed(msm_host->dll[index].dll_config_3,
> +			       ioaddr + msm_offset->core_dll_config_3);
> +		writel_relaxed(msm_host->dll[index].dll_usr_ctl,
> +			       ioaddr + msm_offset->core_dll_usr_ctl);
> +	}
> +
> +	/*
> +	 * Set DDR_CONFIG since step 7 is setting TEST_CTRL that can be skipped.
> +	 */
> +	ddr_cfg_offset = msm_host->updated_ddr_cfg ? msm_offset->core_ddr_config
> +					: msm_offset->core_ddr_config_old;
> +
> +	config = msm_host->dll[index].ddr_config;
> +	writel_relaxed(config, ioaddr + ddr_cfg_offset);
> +
> +	/* Set DLL_CONFIG_2 */
> +	if (msm_host->use_14lpp_dll_reset) {
> +		u32 mclk_freq;
> +		int cycle_cnt;
> +
> +		/*
> +		 * Only configure the mclk_freq in normal DLL init
> +		 * context. If the DLL init is coming from
> +		 * CX Collapse Exit context, the host->clock may be zero.
> +		 * The DLL_CONFIG_2 register has already been restored to
> +		 * proper value prior to getting here.
> +		 */
> +		if (init_context == DLL_INIT_NORMAL) {
> +			cycle_cnt = readl_relaxed(ioaddr +
> +					msm_offset->core_dll_config_2)
> +					& CORE_FLL_CYCLE_CNT ? 8 : 4;
> +
> +			mclk_freq = DIV_ROUND_CLOSEST_ULL(dll_clock * cycle_cnt, TCXO_FREQ);
> +
> +			if (dll_clock < 100000000) {
> +				pr_err("%s: %s: Non standard clk freq =%u\n",
> +				       mmc_hostname(mmc), __func__, dll_clock);
> +				rc = -EINVAL;
> +				goto out;
> +			}
> +
> +			config = readl_relaxed(ioaddr + msm_offset->core_dll_config_2);
> +			config = (config & ~GENMASK(17, 10)) |
> +					FIELD_PREP(GENMASK(17, 10), mclk_freq);
> +			writel_relaxed(config, ioaddr + msm_offset->core_dll_config_2);
> +		}
> +		/* wait for 5us before enabling DLL clock */
> +		udelay(5);
> +	}
> +
> +	config = msm_host->dll[index].dll_config;
> +	writel_relaxed(config, ioaddr + msm_offset->core_dll_config);
> +
> +	/* Wait for 52us */
> +	spin_unlock_irqrestore(&host->lock, flags);
> +	usleep_range(60, 70);
> +	spin_lock_irqsave(&host->lock, flags);
> +
> +	/*
> +	 * Write 0 to DLL_RST bit of DLL_CONFIG register
> +	 * and Write 0 to DLL_PDN bit of DLL_CONFIG register.
> +	 */
> +	config &= ~CORE_DLL_RST;
> +	writel_relaxed(config, ioaddr + msm_offset->core_dll_config);
> +
> +	config &= ~CORE_DLL_PDN;
> +	writel_relaxed(config, ioaddr + msm_offset->core_dll_config);
> +	/* Write 1 to DLL_RST bit of DLL_CONFIG register */
> +	config |= CORE_DLL_RST;
> +	writel_relaxed(config, ioaddr + msm_offset->core_dll_config);
> +
> +	/* Write 0 to DLL_RST bit of DLL_CONFIG register */
> +	config &= ~CORE_DLL_RST;
> +	writel_relaxed(config, ioaddr + msm_offset->core_dll_config);
> +
> +	/* Set CORE_DLL_CLOCK_DISABLE to 0 */
> +	if (msm_host->use_14lpp_dll_reset) {
> +		config = readl_relaxed(ioaddr + msm_offset->core_dll_config_2);
> +		config &= ~CORE_DLL_CLOCK_DISABLE;
> +		writel_relaxed(config, ioaddr + msm_offset->core_dll_config_2);
> +	}
> +
> +	/* Set DLL_EN bit to 1. */
> +	config = readl_relaxed(ioaddr + msm_offset->core_dll_config);
> +	config |= CORE_DLL_EN;
> +	writel_relaxed(config, ioaddr + msm_offset->core_dll_config);
> +
> +	/*
> +	 * Wait for 8000 input clock. Here we calculate the
> +	 * delay from fixed clock freq 192MHz, which turns out 42us.
> +	 */
> +	spin_unlock_irqrestore(&host->lock, flags);
> +	usleep_range(50, 60);
> +	spin_lock_irqsave(&host->lock, flags);
> +
> +	/* Set CK_OUT_EN bit to 1. */
> +	config |= CORE_CK_OUT_EN;
> +	writel_relaxed(config, ioaddr + msm_offset->core_dll_config);
> +
> +	/*
> +	 * Wait until DLL_LOCK bit of DLL_STATUS register
> +	 * becomes '1'.
> +	 */
> +	while (!(readl_relaxed(ioaddr + msm_offset->core_dll_status) &
> +		 CORE_DLL_LOCK)) {
> +		/* max. wait for 50us sec for LOCK bit to be set */
> +		if (--wait_cnt == 0) {
> +			dev_err(mmc_dev(mmc), "%s: DLL failed to LOCK\n",
> +				mmc_hostname(mmc));
> +			rc = -ETIMEDOUT;
> +			goto out;
> +		}
> +		/* wait for 1us before polling again */
> +		udelay(1);
> +	}

Please use an iopoll macro like readl_relaxed_poll_timeout_atomic().

> +
> +out:
> +	if (core_vendor_spec & CORE_CLK_PWRSAVE) {
> +		/* Reenable PWRSAVE as needed */
> +		config = readl_relaxed(ioaddr + msm_offset->core_vendor_spec);
> +		config |= CORE_CLK_PWRSAVE;
> +		writel_relaxed(config, ioaddr + msm_offset->core_vendor_spec);
> +	}
> +
> +	spin_unlock_irqrestore(&host->lock, flags);
> +	return rc;
> +}
> +
>  static void msm_hc_select_default(struct sdhci_host *host)
>  {
>  	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
> @@ -925,14 +1140,31 @@ static void sdhci_msm_hc_select_mode(struct sdhci_host *host)
>  		msm_hc_select_default(host);
>  }
>  
> +static int sdhci_msm_init_dll(struct sdhci_host *host, enum dll_init_context init_context)
> +{
> +	if (host->mmc->ios.timing == MMC_TIMING_UHS_SDR104 ||
> +	    host->mmc->ios.timing == MMC_TIMING_MMC_HS400)
> +		return sdhci_msm_configure_dll(host, init_context, HS400);
> +
> +	return sdhci_msm_configure_dll(host, init_context, HS200);
> +}
> +
> +static int sdhci_msm_dll_config(struct sdhci_host *host, enum dll_init_context init_context)
> +{
> +	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
> +	struct sdhci_msm_host *msm_host = sdhci_pltfm_priv(pltfm_host);
> +
> +	return msm_host->artanis_dll ? sdhci_msm_init_dll(host, init_context) :
> +		msm_init_cm_dll(host);
> +}
> +
>  static int sdhci_msm_cdclp533_calibration(struct sdhci_host *host)
>  {
>  	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
>  	struct sdhci_msm_host *msm_host = sdhci_pltfm_priv(pltfm_host);
> +	const struct sdhci_msm_offset *msm_offset = msm_host->offset;
>  	u32 config, calib_done;
>  	int ret;
> -	const struct sdhci_msm_offset *msm_offset =
> -					msm_host->offset;
>  
>  	pr_debug("%s: %s: Enter\n", mmc_hostname(host->mmc), __func__);
>  
> @@ -940,7 +1172,7 @@ static int sdhci_msm_cdclp533_calibration(struct sdhci_host *host)
>  	 * Retuning in HS400 (DDR mode) will fail, just reset the
>  	 * tuning block and restore the saved tuning phase.
>  	 */
> -	ret = msm_init_cm_dll(host);
> +	ret = sdhci_msm_dll_config(host, DLL_INIT_NORMAL);
>  	if (ret)
>  		goto out;
>  
> @@ -1028,7 +1260,7 @@ static int sdhci_msm_cdclp533_calibration(struct sdhci_host *host)
>  	return ret;
>  }
>  
> -static int sdhci_msm_cm_dll_sdc4_calibration(struct sdhci_host *host)
> +static int sdhci_msm_cm_dll_sdc4_calibration(struct sdhci_host *host, enum mode index)
>  {
>  	struct mmc_host *mmc = host->mmc;
>  	u32 dll_status, config, ddr_cfg_offset;
> @@ -1051,7 +1283,11 @@ static int sdhci_msm_cm_dll_sdc4_calibration(struct sdhci_host *host)
>  		ddr_cfg_offset = msm_offset->core_ddr_config;
>  	else
>  		ddr_cfg_offset = msm_offset->core_ddr_config_old;
> -	writel_relaxed(msm_host->ddr_config, host->ioaddr + ddr_cfg_offset);
> +
> +	if (msm_host->artanis_dll)
> +		writel_relaxed(msm_host->dll[index].ddr_config, host->ioaddr + ddr_cfg_offset);
> +	else
> +		writel_relaxed(msm_host->ddr_config, host->ioaddr + ddr_cfg_offset);
>  
>  	if (mmc->ios.enhanced_strobe) {
>  		config = readl_relaxed(host->ioaddr +
> @@ -1108,11 +1344,10 @@ static int sdhci_msm_hs400_dll_calibration(struct sdhci_host *host)
>  {
>  	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
>  	struct sdhci_msm_host *msm_host = sdhci_pltfm_priv(pltfm_host);
> +	const struct sdhci_msm_offset *msm_offset = msm_host->offset;
>  	struct mmc_host *mmc = host->mmc;
> -	int ret;
>  	u32 config;
> -	const struct sdhci_msm_offset *msm_offset =
> -					msm_host->offset;
> +	int ret;

Here and elsewhere, this re-ordering of local definitions is a nice
improvement but it would be better as a separate patch

>  
>  	pr_debug("%s: %s: Enter\n", mmc_hostname(host->mmc), __func__);
>  
> @@ -1120,7 +1355,8 @@ static int sdhci_msm_hs400_dll_calibration(struct sdhci_host *host)
>  	 * Retuning in HS400 (DDR mode) will fail, just reset the
>  	 * tuning block and restore the saved tuning phase.
>  	 */
> -	ret = msm_init_cm_dll(host);
> +	ret = sdhci_msm_dll_config(host, DLL_INIT_NORMAL);
> +
>  	if (ret)
>  		goto out;
>  
> @@ -1140,7 +1376,7 @@ static int sdhci_msm_hs400_dll_calibration(struct sdhci_host *host)
>  	if (msm_host->use_cdclp533)
>  		ret = sdhci_msm_cdclp533_calibration(host);
>  	else
> -		ret = sdhci_msm_cm_dll_sdc4_calibration(host);
> +		ret = sdhci_msm_cm_dll_sdc4_calibration(host, HS400);
>  out:
>  	pr_debug("%s: %s: Exit, ret %d\n", mmc_hostname(host->mmc),
>  		 __func__, ret);
> @@ -1183,7 +1419,8 @@ static int sdhci_msm_restore_sdr_dll_config(struct sdhci_host *host)
>  		return 0;
>  
>  	/* Reset the tuning block */
> -	ret = msm_init_cm_dll(host);
> +	ret = sdhci_msm_dll_config(host, DLL_INIT_NORMAL);
> +
>  	if (ret)
>  		return ret;
>  
> @@ -1257,12 +1494,11 @@ static int sdhci_msm_execute_tuning(struct mmc_host *mmc, u32 opcode)
>  	if (host->flags & SDHCI_HS400_TUNING) {
>  		sdhci_msm_hc_select_mode(host);
>  		msm_set_clock_rate_for_bus_mode(host, ios.clock);
> -		host->flags &= ~SDHCI_HS400_TUNING;
>  	}
>  
>  retry:
>  	/* First of all reset the tuning block */
> -	rc = msm_init_cm_dll(host);
> +	rc = sdhci_msm_dll_config(host, DLL_INIT_NORMAL);
>  	if (rc)
>  		return rc;
>  
> @@ -1325,6 +1561,9 @@ static int sdhci_msm_execute_tuning(struct mmc_host *mmc, u32 opcode)
>  		rc = -EIO;
>  	}
>  
> +	if (host->flags & SDHCI_HS400_TUNING)
> +		host->flags &= ~SDHCI_HS400_TUNING;

Really the flag should be cleared on all return paths

> +
>  	if (!rc)
>  		msm_host->tuning_done = true;
>  	return rc;
> @@ -1845,11 +2084,6 @@ static unsigned int sdhci_msm_get_max_clock(struct sdhci_host *host)
>  	return clk_round_rate(core_clk, ULONG_MAX);
>  }
>  
> -static unsigned int sdhci_msm_get_min_clock(struct sdhci_host *host)
> -{
> -	return SDHCI_MSM_MIN_CLOCK;
> -}
> -
>  /*
>   * __sdhci_msm_set_clock - sdhci_msm clock control.
>   *


