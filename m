Return-Path: <linux-arm-msm+bounces-59688-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CAB5AC686B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 May 2025 13:33:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 29DCA9E68B9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 May 2025 11:32:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA68E28315B;
	Wed, 28 May 2025 11:32:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="er673KpT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B463D28314D;
	Wed, 28 May 2025 11:32:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748431964; cv=fail; b=tBt/LPKFovju3F8bzUyEWEu+T4MJ0NLlJ4M84ZYNzmYVCv8ee7bgbsG6wg09Ap3jOVkECfi5J2FoUDZVsivA0WWaGJ85jryY7HjqTkCLjjjrCU+DM1uJvQ+HB7QvYppZFDisHD1BwOrH+wEaODfigTRRXMLQgumjNKmYwrVkZIM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748431964; c=relaxed/simple;
	bh=j1VOO4o/VhhSjzFVwNHr3JfF46xTLZXjG+0YyGfeN9k=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=lHW7afYRvfjaBeIkTG7q0jgLE7c37ZF+t74E7k6N/NA8uYZPfSdCDLqGbn0OqquvVuTXRqtbr2uxZRDUex9XkUBdJ/BRGqsmotTzWFyFmkC5hakILbbQFWxUqHdgi2azYT+k86W8osSek+Fnmmpumd1pqMTzTxPo36IwHuh1LR4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=er673KpT; arc=fail smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748431963; x=1779967963;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=j1VOO4o/VhhSjzFVwNHr3JfF46xTLZXjG+0YyGfeN9k=;
  b=er673KpTGyrnNjyLWzScMAYLLja5W7QywmZcs76z/S2AlELNnjE+sLw4
   qjVKoO5RyHluUWxmsbubC1BfoKpV2oVpzrX2Y7tWNPiGlkLhiPaVy55zI
   6tvS5VKSwyf3qb5+GfZCWvGGQEMdd1MPVuzmPhcoJyPSE4qaJD3F8lCGQ
   JedAYOb9GSnxYjuUfJMQXQDseXuRY39Fgniy3EGIFVqezme/Es6s3/QeY
   JO+tMQP8LHJxaTF/TQWKxIJX1pFgZTUHKlbTIIlicpqoP2g1wfa5fe3CU
   q80v3i52RfoadTqaosH9Uz5Jf/8/zvnqlXU99fgGHFLYndhSBqxeFv23g
   w==;
X-CSE-ConnectionGUID: 2ywx5X0EQiGSW1wu4cO23g==
X-CSE-MsgGUID: fgLDCe+fT9mle8aU26ZC3Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11447"; a="50449274"
X-IronPort-AV: E=Sophos;i="6.15,321,1739865600"; 
   d="scan'208";a="50449274"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2025 04:32:31 -0700
X-CSE-ConnectionGUID: Ftzm2cU6S6q6b/7cm1Y0oQ==
X-CSE-MsgGUID: yM9AuPjBRluv2t7yofdVsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,321,1739865600"; 
   d="scan'208";a="148502905"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2025 04:32:30 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 28 May 2025 04:32:29 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 28 May 2025 04:32:29 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.68) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Wed, 28 May 2025 04:32:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zKwAdoE9nWg/2Hj68DlmV+P/bpLUgnbFsjmtIdohG39FhdTgqv/CTN088pMP1pDWV91NEcirEVpPtsf0QqLw3beUOIN+HNEQZCn+6vNxF1XzqyrTP4XCJmphy05rFarlRdkDfqUbP7IWKwfWZNAgMLd24YnetgSznbXe1dM7Rbh+Cm81DcmzYNpm0gvgjmM5S6o8p83qHFPHiEUp2fdENoEsI1snuJqoTx/CcY6RYr4RRpCUGPm2+a8Bh9ROQ6WagMT33cgqw063kHej2sC7kCleC9xwJL+3hLi8Pk4ggPCz4Lj6dO6R0ySKlTgKyDk2bVZXogEJWuncTWDyC3E9aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=urSUd+U/QcLQ1SdSTs4cKwU53O5ICuBBP5CeXYPTDlA=;
 b=x1htr8NDszZfRItg/Xk6M53gKT/5AjrGKuYDdU4XGCDFkDtCT28epY8E6dHt6QMXRnOhmMomwoSLpsNoz5TLPYy7XBsdMb0yNT/qWa5Z+n8Ek8hQtQ2q6/aUQECbQs4UysDNxE/MoUzGqcUGTbGlh0RWYi0FU2gKWTBj17q+1J3/q13EQQqnL1pfsFUEoVq/vAiI7ygDOQhjKazj2ABi+v6f0DLWenCQK48r6eHJjs5NOkRIHsUsEvpdNw0LCp1AiwDdQOnbmXjbeqm6PSQrksu6ecy8/GC0mm7YnZDzkXaE0XKDvqoIrPjpEfrksWGyL4EpUjy/LW2X0veIhrahXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6054.namprd11.prod.outlook.com (2603:10b6:510:1d2::8)
 by DS7PR11MB8807.namprd11.prod.outlook.com (2603:10b6:8:255::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.26; Wed, 28 May
 2025 11:32:27 +0000
Received: from PH7PR11MB6054.namprd11.prod.outlook.com
 ([fe80::a255:8692:8575:1301]) by PH7PR11MB6054.namprd11.prod.outlook.com
 ([fe80::a255:8692:8575:1301%6]) with mapi id 15.20.8769.029; Wed, 28 May 2025
 11:32:27 +0000
Message-ID: <177e21cc-0a9b-4543-8135-f4da424f5713@intel.com>
Date: Wed, 28 May 2025 14:32:20 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 1/3] mmc: sdhci-msm: Enable tuning for SDR50 mode for
 SD card
To: Sarthak Garg <quic_sartgarg@quicinc.com>, Bjorn Andersson
	<andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-mmc@vger.kernel.org>,
	<quic_cang@quicinc.com>, <quic_nguyenb@quicinc.com>,
	<quic_rampraka@quicinc.com>, <quic_pragalla@quicinc.com>,
	<quic_sayalil@quicinc.com>, <quic_nitirawa@quicinc.com>,
	<quic_bhaskarv@quicinc.com>
References: <20250523105745.6210-1-quic_sartgarg@quicinc.com>
 <20250523105745.6210-2-quic_sartgarg@quicinc.com>
Content-Language: en-US
From: Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: PL 281, 00181 Helsinki,
 Business Identity Code: 0357606 - 4, Domiciled in Helsinki
In-Reply-To: <20250523105745.6210-2-quic_sartgarg@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DU2PR04CA0055.eurprd04.prod.outlook.com
 (2603:10a6:10:234::30) To PH7PR11MB6054.namprd11.prod.outlook.com
 (2603:10b6:510:1d2::8)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6054:EE_|DS7PR11MB8807:EE_
X-MS-Office365-Filtering-Correlation-Id: 67f2eb58-6919-415d-eedb-08dd9ddb530b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aTlUdTI4elhQalVIL2Zjam1icnFzaDF2WFllV2g1NjdJMG90M2tIV0F0TUhu?=
 =?utf-8?B?QXF5MU4yb1RwbWFDYXovd2FIZkFRQW8wQ2FjSXZwNUlVMlEvUzd3cmg3Z0t0?=
 =?utf-8?B?bXN4elROcW4vQ2JEcVdoRW1ueDJORk40ZEgzVkFsQ2swSWU3OTJ4K3MrUFd0?=
 =?utf-8?B?bnJYWERQc252S1ZvSytQbWR0TEp4MGlpWFVTOGEvblFWcE40dTNvSHp2cndE?=
 =?utf-8?B?aDFXTXhJZVp0QUJWZGlBc2VndVl5Y0FTbWtmUEhOMGllUHl2NUQzcnh2YlZ6?=
 =?utf-8?B?UVpiRFhwaFc4cnNtbWVnbGFBOWxZNGtvYTkyTFV6TFpGVlRTeElMQXFBOUla?=
 =?utf-8?B?TEEwVVhxS3MxVlB1cDlnQUF1K3hSYXkvU0d6ZmNzTi9nb0x2Rk9rVm9VTVhY?=
 =?utf-8?B?M3grcTRNMWJBNy83N1I4VlBhOWJLVlF6Um5ZMDhFREpzWnpQMVFQT3V0Wk44?=
 =?utf-8?B?Zm0xVFdUL3U2ekptc3dmTjJJVnZjSmRtejRKYzh2dkZTWlhGbFZ6ejV4bmk1?=
 =?utf-8?B?ZmNid2tmYS8zbHVJVDFyM1Z3b0ZxeXpQMEVCSloyQnU1TWtlaVRUSXFHa210?=
 =?utf-8?B?R1crK2dvc2wyVzhPdUpmZ09wVTRrVitQaWw4T3dkOG5taHR3U2pFSlFjK0Mw?=
 =?utf-8?B?WmN5cFdiWExTMjhWVUFGWldFMlZXL1dHQWcwd1I4akVZaThweEdFM0FhTndF?=
 =?utf-8?B?amJmNEVFaEpBZ0crdHhqd3dyb25nN083eUh5RHJCU3VaelJDMTIyRlZxY0FU?=
 =?utf-8?B?ckZXS2dwb1VFM1A4WjYzS1ArWU42SkJoOExuMWp0ekwyOHdBUmgvSUx3SDU2?=
 =?utf-8?B?OTZ1b2RiRGxPYThveVJxeEhvOGNHV3BRY29SVUhueWF2Y2NTd0UzL1I0TUdv?=
 =?utf-8?B?cm91QWNZanFEd1NrUTNIWWZMMGFyMlRRMXhqUlZrZUw2dGwxdXYrcm4yYkhM?=
 =?utf-8?B?Z1FmTWViUFc3emFOck5aVnlDUXlUc0Vtdm5CYzgxZ2xZVjhHREJtU1VTYzVk?=
 =?utf-8?B?azJXMEwrNVM3TnVkSmtNNlljVFhvWXhIeXc2aVNWR3NUeDNrbDFpVVkxL1F0?=
 =?utf-8?B?d3BtdVNJZ3hKcVNUelRvRzBEa01nWTc2ejlWRFlkYlRPTjlzR0lFYWQ1enZt?=
 =?utf-8?B?YUdRL3hKWG9LclU4dzkyTXdJemswNkRNZzI0Z0ZXNmEvN0taV2RqVXp4d29h?=
 =?utf-8?B?QmNJdEwrSlNWYmYxczNtUzU5Rk9jL3dIUXN4dWhqOEhjZmlQY1lhSGR5b3ly?=
 =?utf-8?B?Q3J0dVVSQ3cxd0N5THBuYk1ORnhURjNoamZDdzNBYW5NTzBQQ3hQRklqdEtV?=
 =?utf-8?B?L2ppRjkydW5tZkJONVUzR3p5MkRZbGdCcnpnM0JYcjVDa24xSFVMQXVwK2Rx?=
 =?utf-8?B?TTgramkwVHl6Y20walo0NFZkM1YvZHhHVXlsY1FBUi9wZitjWnEySCs2NGhu?=
 =?utf-8?B?dGUxVjE5MzFvTlYxMXd2dzJZa0tYRldUdkJnSGhEUFNHYmptTFlDM0hsQXhY?=
 =?utf-8?B?T1R0WUFZaDdTRFlEdTN3YWlFczYyUTRVa2FqZDBhQ05lV2g2MTQyZ0FhT3RJ?=
 =?utf-8?B?cndNQnU5ZE1NOHdtRTZHTUR1bVNlb016U1BhOWZXSVlqbm1xNVl4MUZIM1Uz?=
 =?utf-8?B?VHNmSnhYTWw0ZlNUUHJrZjNzR2N1dkEwTUdiQ1dpdFdhcGF2MmU4YUltSmo2?=
 =?utf-8?B?T25FZktzdTFhdEdONU84WFpaK0RuRTNyR2RuRTRpcytyRUxpZTRCbE1wVXNV?=
 =?utf-8?B?a2JJSU9Fdm5aZWtIUWVLbU94L1Rvczd5VklmUVhieTJXMWZZNElvV040LytV?=
 =?utf-8?B?Z3VMZ1lzQ2hxNGp1NENSRzJ4SkhROVpsWGdDWklteWhyYmNIenFwZlR0V0t6?=
 =?utf-8?B?dWJ2UlhVVk1IZmhPMUZqNERJajNURW9kNlR2bG8wWHJXOVhxZ21CWmNybU5w?=
 =?utf-8?Q?Nchobe65YPU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB6054.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aWZpUjZ3WDk4RUhPSEcyTmlieWVGRTg3MVFnR1B4MGtYK1lqRm9HSXFqbkZm?=
 =?utf-8?B?cHA3VlRMbFRhVFgzeDNvNUhVeStxblpqWU13RE1vT2Nndk5WODZRblVkbDVE?=
 =?utf-8?B?cU1HYjNtKzRYZ01VQmFiTnl6SjltUnZTRWlvcnNuUyt0Z2xtdExTYUp0c0NV?=
 =?utf-8?B?V1ROWm9OZ0hkRVVYOVpnc2xXR0pNTVZtYW5UcXpzUWlIaGltQmFEbXFobmZN?=
 =?utf-8?B?U3BKWDJHRGlTaVd6Q3VsT2ptYzlNbytaZGVOT0tYMU9Vb2V0NEtxYnJxSXZr?=
 =?utf-8?B?dEZYMXlUdSt6c2k0OWZ5MDJxcXo5TkwzOThZdEY3N3NXZTVWcGFuS2VHaGVz?=
 =?utf-8?B?RUZ1ajVuN2k5R0srRThPT2pXR3BDcG9GSDNubFFMWHRudXd5Mmd6RnlSVlJU?=
 =?utf-8?B?WDBCTkZnTS8ySmdSTytveUZyeHNFelFGc2x4V1p3dXhtQ3BEYlhITTVHc2s2?=
 =?utf-8?B?QU1nMVA5R0J0dkhyN0RRc0ZIZkpnN214TkdYK0tKTjdBdXZzNTJYbkV5bzY0?=
 =?utf-8?B?RUQ2M21ndFZBQklIc0dwUmxiR0VtNFFqZGpBNHBDM2VHUjlPYi9zdkg1YUh4?=
 =?utf-8?B?TndwOE9DendCcWdieThObFRrNHNyaUdlRjNWM2M3RGw4TVh4THFmNFRhdkE0?=
 =?utf-8?B?UFVOaHlzNEY2Z3NQR2ZtZDNiZFlXN1lQN1ljeFI0NU8vdC9hM1FveUY3TmxR?=
 =?utf-8?B?SURWeGZiTmRyaUZHZFdWVUs1WFdEcWNtUzZoOFpkclR6ZElVZEFDOWJPcVRy?=
 =?utf-8?B?bStlbWw5eVhsL09SWjJhTnJ5ckdJa3ZaNHU3QWNZaEtNVDd3anI4VDVIR1BL?=
 =?utf-8?B?eDlDK01DSmI3dy84SjNIRlE0eitndmZTWFgvYjZrZVhkWWpyVkNKT0c3TURJ?=
 =?utf-8?B?SVFRYklsblRDTmk2YVNHRzRpaUFUeFJuRWduTTJaODVIWmx5ZmkyVjJGRmdW?=
 =?utf-8?B?cENDbGFaaFRMWFlIUjA5eGNQSG5zemV5SVdyWG82VGZDSG5RZkVzbitNMTRD?=
 =?utf-8?B?dFdLcm94ZUVlTXFSN2ZOSzlsZmRIR0VLbGdOZFdkSnJGNGF5d1dSYzdHNVhj?=
 =?utf-8?B?MTFCamFhY01tUWdRelYxRWdxeENIa3ZTVmVZUnlJQkw2S3drRkFyU2lxbUpC?=
 =?utf-8?B?WjYzSEcwMjlNclNyT1hRcU9YejZ6TEJhSVJ3UUJtZ08wZDYvaXhwRHlTU3Uz?=
 =?utf-8?B?dGpoT2RnSlluNlJwb0pFckg5VVp3L0lwc2VVTDlKYzlzVTZ6YlRjcUg3cVlw?=
 =?utf-8?B?SDZrVk1JUHlMQlFHNWlyNDhlaFBRRFlFOSs5VWh1U1VHRTBvbTFLN2lTdFl2?=
 =?utf-8?B?SHQ5RytzaU5ibmdPcFF6Qk9xS3ZSRlNETGpRR1pWWHJrMzFzNUEzTmJ4Q1hl?=
 =?utf-8?B?Qm5WK3FiZUppVnEvSlFWcmo5blJZSXF0MExZOVBWZDFVV0ZsMUhKcUY3b0lL?=
 =?utf-8?B?cGRKT3lKVjVhMHFlN2RFM0FTRExZOUxtQ1d2ZmZzTnc1bnc4SEhTeFFaUFVG?=
 =?utf-8?B?WHhXY2xwWTZWaWVMWnhuc2hCa2R1bGFjRXJ1cGRKQ29Cek1TZkYxU0IxNUNZ?=
 =?utf-8?B?MjVib3NXak9LNDkwSWI1SnlIYUo5MzU1ZS94REtwU3ZQejAxRWUvOUNSTksz?=
 =?utf-8?B?WS8wbWlkOGxkZVNRSzE4SVU2cExXMTBWWnJodm9GYzhXU3k5QlYrNzFoRVdD?=
 =?utf-8?B?TGF3VjRuYUxia2QzWjVDbzlOQmFSMWVKVEJIUVNZUW8xb3h1aVlWbU1VcWJC?=
 =?utf-8?B?Z0U4aUlpdXZ1eUNwbGNkRWd0ZURqS1lKZGZIYldsVVpXQVczRllrQnJBNXNZ?=
 =?utf-8?B?aFEyemxWY2ZER05uTituVXZwNzMxTEdwbktLNXRCdVFGaW5BeVY3TmpwTUNH?=
 =?utf-8?B?c2tMYmw4L2ppWituK3pNOFpWbHEwQmtRamRqa3l6c0JXSDJxUEpJMDRTNkpS?=
 =?utf-8?B?M0czVEtwZnNBZUJwa2lvK3RiMmx0SThFZ2QrZU9qQUlFS2k3dWhjcWFEUEZi?=
 =?utf-8?B?cHA3TzhESTRIVllTZEF2V2VmckZzY0ZDVHpPUS80QlNZcXFKWlpSN2hxSlBY?=
 =?utf-8?B?MDg3cGwwcU1mc2VaeUd1UzlPMC92a3pQQnVUU3RkYzRSMWE1RXQ4eEJ0Z254?=
 =?utf-8?B?ZTRKL0JWSFFlRWY3SGRSWUc3K1lFQjdzeDlqNXFwWXdURTJTYWV4bStBNVUw?=
 =?utf-8?B?Qmc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 67f2eb58-6919-415d-eedb-08dd9ddb530b
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6054.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2025 11:32:27.5780
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C727CNphCyGZegfXgbO49CiUsZaSgB5Ke531CIx0NTtKM0NNfwvkJ9Oh4AG9egOB8QdObCkc+B/A4zK4JrZL7A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB8807
X-OriginatorOrg: intel.com

On 23/05/2025 13:57, Sarthak Garg wrote:
> For Qualcomm SoCs which needs level shifter for SD card, extra delay is
> seen on receiver data path.
> 
> To compensate this delay enable tuning for SDR50 mode for targets which
> has level shifter. SDHCI_SDR50_NEEDS_TUNING caps will be set for targets
> with level shifter on Qualcomm SOC's.
> 
> Signed-off-by: Sarthak Garg <quic_sartgarg@quicinc.com>

Assuming this is still needed even with new generic quirk approach:

Acked-by: Adrian Hunter <adrian.hunter@intel.com>

> ---
>  drivers/mmc/host/sdhci-msm.c | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
> index 66c0d1ba2a33..bf91cb96a0ea 100644
> --- a/drivers/mmc/host/sdhci-msm.c
> +++ b/drivers/mmc/host/sdhci-msm.c
> @@ -81,6 +81,7 @@
>  #define CORE_IO_PAD_PWR_SWITCH_EN	BIT(15)
>  #define CORE_IO_PAD_PWR_SWITCH	BIT(16)
>  #define CORE_HC_SELECT_IN_EN	BIT(18)
> +#define CORE_HC_SELECT_IN_SDR50	(4 << 19)
>  #define CORE_HC_SELECT_IN_HS400	(6 << 19)
>  #define CORE_HC_SELECT_IN_MASK	(7 << 19)
>  
> @@ -1133,6 +1134,10 @@ static bool sdhci_msm_is_tuning_needed(struct sdhci_host *host)
>  {
>  	struct mmc_ios *ios = &host->mmc->ios;
>  
> +	if (ios->timing == MMC_TIMING_UHS_SDR50 &&
> +	    host->flags & SDHCI_SDR50_NEEDS_TUNING)
> +		return true;
> +
>  	/*
>  	 * Tuning is required for SDR104, HS200 and HS400 cards and
>  	 * if clock frequency is greater than 100MHz in these modes.
> @@ -1201,6 +1206,8 @@ static int sdhci_msm_execute_tuning(struct mmc_host *mmc, u32 opcode)
>  	struct mmc_ios ios = host->mmc->ios;
>  	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
>  	struct sdhci_msm_host *msm_host = sdhci_pltfm_priv(pltfm_host);
> +	const struct sdhci_msm_offset *msm_offset = msm_host->offset;
> +	u32 config;
>  
>  	if (!sdhci_msm_is_tuning_needed(host)) {
>  		msm_host->use_cdr = false;
> @@ -1217,6 +1224,14 @@ static int sdhci_msm_execute_tuning(struct mmc_host *mmc, u32 opcode)
>  	 */
>  	msm_host->tuning_done = 0;
>  
> +	if (ios.timing == MMC_TIMING_UHS_SDR50 &&
> +	    host->flags & SDHCI_SDR50_NEEDS_TUNING) {
> +		config = readl_relaxed(host->ioaddr + msm_offset->core_vendor_spec);
> +		config &= ~CORE_HC_SELECT_IN_MASK;
> +		config |= CORE_HC_SELECT_IN_EN | CORE_HC_SELECT_IN_SDR50;
> +		writel_relaxed(config, host->ioaddr + msm_offset->core_vendor_spec);
> +	}
> +
>  	/*
>  	 * For HS400 tuning in HS200 timing requires:
>  	 * - select MCLK/2 in VENDOR_SPEC


