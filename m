Return-Path: <linux-arm-msm+bounces-77455-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 24CA5BE02D3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Oct 2025 20:29:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id BFE7A4E34CA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Oct 2025 18:29:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 091B53254AC;
	Wed, 15 Oct 2025 18:29:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BpcvuMfE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D052941C71;
	Wed, 15 Oct 2025 18:29:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760552947; cv=fail; b=EZMN0BzWcEI6E/HUXxSzYsMrGdnOYTcGiLT/F2rtReiUUPZsx7FFLbu/k72DAfgmAgLv1ryoWTI7UKmP5K2kfJPxp8PQz9oGWbI7Y3k80YCebPicewe/h4fUS3SF/miI6PlNA/skVIDt4FCEjl8W0H1BGDTIpmYSeiDHelu0scA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760552947; c=relaxed/simple;
	bh=DMgFuWs8k+3eBsqftPcc2pN+h3BSO7a5Mrv5/jZ399I=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=bQJ2fSLPPzfI2tTG7SlwUDQ3XXA7RVLH3CNcEtfmfgnmmA1AsUFsaJdKq+u0FirZxZkLnFRFjpHGq1pWBE8AuYYI1cTMjT8hO1b5zpddO0M0K5OjRZMdYilNthUCKuaadGnBSg3rebUF08BKg1/T3k9/Ki/OK7JWaUDwA9Mdq6U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BpcvuMfE; arc=fail smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760552946; x=1792088946;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=DMgFuWs8k+3eBsqftPcc2pN+h3BSO7a5Mrv5/jZ399I=;
  b=BpcvuMfEUlKUpzeRDk+Ix4gOnP9bthq59OohcqB6yDtdAuBu+CZ76AHB
   7yV2Id+yeftqIFmnP1fNRpDXb7Bfd/feY7Pgk3FfY/7RSNl1wOPsppsKp
   MbLHzdtxguoqML0gFMFqdG7lEPD0yXhdkIeTP2ZntDajHQe7z3Tsz5tJF
   CFpSHezdo/ieZlJG+JwE/i4hEel8CXUdUa9D6HiR4RxHxNRCavG5wjUpv
   QvmwPOTKGsWan8R0ytdrCekg9t77IBvLjdrxPM3Dei38v3aq8WWdH85bk
   t1TCmKQuZUfOv8wnm+ojZNKh6ofXZUaodnSB7VOEE8BuQxjY9R1wMFsh2
   A==;
X-CSE-ConnectionGUID: tzT5/7YKSLiaQj5moXY0BQ==
X-CSE-MsgGUID: vyY3buqVR+yNiXiFZ46pbg==
X-IronPort-AV: E=McAfee;i="6800,10657,11583"; a="73014351"
X-IronPort-AV: E=Sophos;i="6.19,232,1754982000"; 
   d="scan'208";a="73014351"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2025 11:29:05 -0700
X-CSE-ConnectionGUID: N8syZX/CR9OB2B9KnmPFjg==
X-CSE-MsgGUID: Hw0UqFrGRGOesSsDYYjVSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,232,1754982000"; 
   d="scan'208";a="187341792"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2025 11:29:04 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 15 Oct 2025 11:29:03 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 15 Oct 2025 11:29:03 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.4) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 15 Oct 2025 11:29:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n+q+f+au6wtpxMG4A3jJ+Dk6GfTWicc7ztd78kd4qx933pMqaixhOlCq/AZoVoEkES/HqIgDIiAn/jUgbJcH3bGTCMWzFUd1l39TM1r9JhjjzMZVQLEWGF6RHS8ofwEUElmmzHLY9KuBQ/wa8Og4icbuN+lf4iDtLY2vK4xmAiRXwLowjMoIcz+opSUjp4x1N2kat9XWL3Y+9Ze/kgPXM+bh2Ia+jmbjj3pL3bARe/N6xssWAvTTjIuOJhClkN/uXiQvgSlSOysl04EDmv2HA2nlJ822e9crd6WFcwwuDDc/96hPvjSlFKZNLjC/Pba7WkiXjKV6Jag7BsspFYxkrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6TprCK4gv3cYMI/oC39Yua73X6Bn3UKbcfU+ixYVYI8=;
 b=MrYGt1Qas5SpYvlV+WgBrwrvQUvkOWA81wbdCkmjuDaQrBtNBsTEENlOQ42qwWh1VxQ+mxBT+wZ7ZEt3FxaVtrBEUCLeSc+ttzSffXUdbVwIlSRrQlu+EhfC8ExOgAdx1Wobe1Qcl9FVWB0k9f4k0uTIBgdKVdM8UHedoUtnx+vmR3G/iaN8Kg3S+ahDjkD1HWXe5Iu94mPVL1Ia+IQRbf8bhcWgPmWIn2hvEdghycouxoNU5FLvJGvmWVefyobMRA7QogGUy4TCu532Td9z2dXgKjDncvpsQIQJQeO+Ry5nKLHYKNG8roSMPYwneK4Uk+IgNGRn/M74kH2IaS3kNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7198.namprd11.prod.outlook.com (2603:10b6:208:419::15)
 by CY8PR11MB6987.namprd11.prod.outlook.com (2603:10b6:930:55::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.10; Wed, 15 Oct
 2025 18:29:01 +0000
Received: from IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::2c4e:e92a:4fa:a456]) by IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::2c4e:e92a:4fa:a456%3]) with mapi id 15.20.9228.010; Wed, 15 Oct 2025
 18:29:01 +0000
Message-ID: <1234c326-9950-48fa-815a-94337ff3cd7f@intel.com>
Date: Wed, 15 Oct 2025 21:28:55 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/4] mmc: sdhci-msm: Add device tree parsing logic for
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
References: <20251013145316.1087274-1-quic_rampraka@quicinc.com>
 <20251013145316.1087274-4-quic_rampraka@quicinc.com>
Content-Language: en-US
From: Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park,
 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 -
 4, Domiciled in Helsinki
In-Reply-To: <20251013145316.1087274-4-quic_rampraka@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DU7P190CA0024.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:10:550::20) To IA1PR11MB7198.namprd11.prod.outlook.com
 (2603:10b6:208:419::15)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7198:EE_|CY8PR11MB6987:EE_
X-MS-Office365-Filtering-Correlation-Id: d1de9aa2-1d64-4010-f6ab-08de0c18b62b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7416014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Z3ZOVWZrdTk0YUtWRGExMGdUSnJmcmJkUVlmb2hCVVlURFR0dWpsSU1nVEpt?=
 =?utf-8?B?WXVwZ1BhMzVON0orSm4xTjVrZXlUWkVjeURRcFhaV1hlMkdySkd6enk5aGFP?=
 =?utf-8?B?d3ZsMjU2SjIzRGVRV25ELzRUZGUvbEszMjUyQjFMZXoyQ09pdk5yblhlVTc5?=
 =?utf-8?B?RS9SSE90N1pBRi9xMFFnR3ZLeWFqSkNLamhjZnlBMDV1cHFqcjNGQUxQY2wv?=
 =?utf-8?B?aDJUVUltNjAwZzlaREJOZkJ4OXFwUVZOVUV2OFVITXdLVVEyUWtaaWFOcHVk?=
 =?utf-8?B?K0RQSkZhRnBDWlFpL0x5cDJoNVBaYmp4aXBFdzNQU04xcElrbjhHNWZ6YThk?=
 =?utf-8?B?YWZINlZEZTI4bDg5N09HK2pnS1d0NmNZZFl5YzgwVWxEL2JQY2Ftd2NFZkVv?=
 =?utf-8?B?SlQ3aDFURkNaTkgyS09xSHM0MkFmMmQ1VTdEYS9PL3grdURVK2R1RExWQkdx?=
 =?utf-8?B?U01OYWtTY3E3QUdWNnc0WWlYMi9Cb2NRSnNsUk1uM3A5K0xCRFFKN2taOXpI?=
 =?utf-8?B?aVZsOGJFOGhhSGtTKzVmRXFVcnIvN3JOc0dReG9vRTBZczBTUksxSTB3Q2Zk?=
 =?utf-8?B?WUlhU0YwSDJhUFhqd2t2SWtWVlM0V04wWkFNZG0zSmw1UGxsQUM2ZnpkVHlZ?=
 =?utf-8?B?bHRIWjZVYTVmcGVSa052Q0hobCs2VzJ0UTQ3MjRRSGpoSjh2TjRZLzVHWDgz?=
 =?utf-8?B?eW02MFRPT1dONEZoWlVDR2lJQ05mQmN1OUc2Rmo0VVJQSXMzazQreENOb1hH?=
 =?utf-8?B?LzE3VkU2TEIzWGs4MVpSUTEvU1JwMjNZbm44bDJSSDVad0lvK3lzRDhGcEN1?=
 =?utf-8?B?RFMvZHVZNGdwdXk5SERkU0g5dUEzdFhZditsS2pveUlFU05SWmE3TGNkOXdP?=
 =?utf-8?B?alFkNVhIbnhPeEhhM3BPZ2FXTmJ6TlBlU3haMXEyNlRPd0d2L3gvVFV3RE1T?=
 =?utf-8?B?MjY1UWxwQVVUZzZuMHVac01BalBSZVRnck9yZWpRdDhmUjhrT3ZyNGgwZndy?=
 =?utf-8?B?WnF3emtXZG9CbitoYzFPR1hVajFMZU1KN0FmcHlWQ3ltS2hWUk5CQ0d6YjJL?=
 =?utf-8?B?K2h6Z1JwL3dQZURFOG9GRkQzSGJxV1gyenJzcEdVcTg1NjZ6NXBVcTNPYlYw?=
 =?utf-8?B?RVFaY2txMUg1clNUbWp5U2EzOEM3clZwbWRCMFhid2locWtPZWNYWHFDTk9j?=
 =?utf-8?B?T2FvZitEclRBTEpJQ2oyQ09iMk53dEdEeXVlWjFpalpjSStjcVArSXh2aVR3?=
 =?utf-8?B?UkhkZDJhcVJRb2N4emljNmUxeDB2U1k0QzZyZXZpQjRrNmRoeitOcEpHaXN6?=
 =?utf-8?B?bHlEaWVBVTRsUVJOTVVUdXl2b1RJUjA2dUNZcDFKTXlsTGFQMThHTEF5amxJ?=
 =?utf-8?B?UmdIK2RObFdldkNFZURzU1RoeGsxNjk5d1BBMU5BbmpTVnBkZUtRRUFldkQy?=
 =?utf-8?B?WldRbkJzRU1pbFo0UGN1TnFNKzQweE4zQ2VXM2EvcTF4MXltL0FGczJ2Rm5C?=
 =?utf-8?B?VEtTL1RCQkd0RGVMZEdKZHFrNGFBOW1WRTJrZk51dkx6cTRYMmtaTGxPQXVZ?=
 =?utf-8?B?SWlBWHVxZkNvbnJoeG9jdW1yb093MHBaNTlLbWorMDBxZlBVNWY5VlQwQUw2?=
 =?utf-8?B?L2VWSjVvQkJBdnhhMzNSZDdQL3g3VGNRSnBNNXZuWEFQQlMxODRrS1M4MEQz?=
 =?utf-8?B?UUJBZFhWTU5Ka3gwMlQwL09TdzE3K0tZOVgyZkh0U1BGYmZZZkdiOHYzTkNt?=
 =?utf-8?B?WndNemNEZlBya2VhL1ZBS01BYVlJdEhuS1h0VUgvaHI2RVhhczdTWlVIWU51?=
 =?utf-8?B?eFlkRnZpN3BrcHZNUDVYSXFhWHZ1bmpTY0ovdnJSN2E2a0IvdndWUjR5SXUx?=
 =?utf-8?B?QzYxRG9hRXZPaXNDb1hVTGw3MEJNaU1wSVNNNXlsd0lrZkFSazZ6SThaRFRE?=
 =?utf-8?Q?CHD5NHiJKwlfyv9mJ19etS2BMDUqb3P2?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB7198.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7416014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dHZtK1NXRVRQU0pwL05LNmNrRFdiaUZTdGRBWSt5TEwvK1lGWFFJem5ZVWVJ?=
 =?utf-8?B?bjNKY3hZS256U3l6bUwrSDBJdkRDcUpLZFZPcVJPdVVnVmk3Mnc4blpldDVG?=
 =?utf-8?B?SGpQTGErcnJKdXhpNzZsTnJTVGlrb1BmTEc1anJObUk2cDJpVDNRODdBQTA0?=
 =?utf-8?B?S01MREl5NU5UYitTNjMvNEk5dURDbjg4Q0pjUXVBa3lwMDFZbTRMcXhGWnUw?=
 =?utf-8?B?NUl3d1Jua29TU2YwTzNyU0VWUExZOTZTSTVEVkpBa1l0UzRic1RYSjZmNlZ1?=
 =?utf-8?B?eEJDRkZZQWdTT3ZLOHc3NDM0SlhtNmEyalROWUdWNHJpc3h6TVVGa0hTVS9p?=
 =?utf-8?B?UEFnRjhINzhGMGw0ZHljZFVIdmhETVp3OW0ycHhKdWJndjVjYlloUUVaekE0?=
 =?utf-8?B?dktaUWdNRDRJR0ZDeVZGVDdzYmloQlpONFNuQTdzcEtMMW9YMnRUQTlHU3g4?=
 =?utf-8?B?aU9tUlBNVkppVmdmSnMwM2ZpQTNtZzd6TmVQcGk2Y0RJUm13USt0eGY1T0s3?=
 =?utf-8?B?a244dXBvTUxGTjlTYm9FTjExWGx5aGdZV2VwejhzbHk1S3R3ZlpiWlFFQmxm?=
 =?utf-8?B?SElBR25LcXM3UGtXZlByQm0rbkNTL00xQTY5QVFNVXVHZkZteTlVdVNoRi81?=
 =?utf-8?B?bjd3eU1UUkVuS2p3M2dWdmFScmdRd29WVkttVEY2L1E2aU00TTRuem4xQmVy?=
 =?utf-8?B?dC9JU0tYR1JmYlliaVlLTEplc2xwMFd1cTlNL0JpdWRIQnJ4azV5dy9pa0k3?=
 =?utf-8?B?eDl4Nm5EVGNJYXNmaWpiSE9LVy81aDNka1E0MTRvb2l0czZZTTVjRnYzNDdT?=
 =?utf-8?B?WUE1bHg5cnZuS0xxbm13SmFlTU1WOEdxWjhqMmFpQk5DZzhpS3k3Y0dnanZz?=
 =?utf-8?B?NlZ3ZnROVXQ2ajJOU1ppRmhoY3IwRnZ4Z2lmbjVkSTRDS3RuTDBEUSt1dURH?=
 =?utf-8?B?Z1JvdVRhWk1EcWFrUFNNcUhhUFBxUjd3K3dmZDRzdXY4VkpRT2haNmVpaFBR?=
 =?utf-8?B?NkZMNUJIZVU0Q0Vma3ZZSGZzcWRIUjZoN296aXo3NnZ6TEZFWXBBQllOd25K?=
 =?utf-8?B?RGJ1MmEzU0JDRmZrd3hJQ1VqWU5FbENDNVpTdGwzbFFRc0hJNEFjVVI0d2R1?=
 =?utf-8?B?ZmMvTGdyS2svRUVWZjQvOEQ0T1hEQjJjNlgwSi9SaFdNMWtoOG9JamVqaHhZ?=
 =?utf-8?B?Z1lDOHZIb2NMbk5OdjB1eTJRWkdibGtOd1M3SW9WanhxL1ZwbHpzR2d3elZI?=
 =?utf-8?B?MTFmcmtKb3RtSW5KZTdXVVFuMk1YWUF5N3lndnNJeWVaSlMzWlppS09iTXBi?=
 =?utf-8?B?c2NtakZiNW11ejlvNS9DWExxVU9aYzFXOUtQSnNidnFwRmN3M0pUeDRZanhR?=
 =?utf-8?B?Q251TmNIZFJxODlGeTNNSVE2alkyMlhXc3l4SVFPOE90TFF5aVl6T3pubHJK?=
 =?utf-8?B?UHNvaThBUE51M05Fem5QMjlKTDNDZmw3MG03Q1FISEcyZVdUYWl0TUtMNU9M?=
 =?utf-8?B?U2R6VTdJVnhaOEt4ZTloTGZ6dFhKSEZGbHlGUHI4TCt2Yk5va3hGVFhTOFky?=
 =?utf-8?B?eTBoN1dpM0VDZVpaZk1qd2thMnZyWWw1S1NiUXVPREFiM0poM2VjREtwUWk0?=
 =?utf-8?B?UlpNQzFJWkZEZlllbkpCWjJnV3MzTjJ3QnBnbWdZdVNXc1lURXhCaHJZT2VK?=
 =?utf-8?B?d1cvbWtBN0orVDdxekRNWVloSktWM0ZOalhOWlVac05kZUJHaEdVeFJBQU8v?=
 =?utf-8?B?QzFwNzJrdHNneUNIaGY1a0hZK2ZLaTlCMjlCR2pOY1pnUUdUYUpYTnhtZDRC?=
 =?utf-8?B?dCt0K3YrWHR4S2NIYnBVdlFBNE5iekNsZ0Jac2Y5Vyt6dm40Tnc4VjI3MHZP?=
 =?utf-8?B?cHBxd0g4UGtzYnN2VW5wakpkMXpUUFNrZ01KLzE5Wnh2ZUVkaEhVTU1HNHBJ?=
 =?utf-8?B?d0EvekR1cnlpUitEMFZ0eVpNS2VVNVp0di9pMVJhWmFTTTB5YWlRWCtqQnpY?=
 =?utf-8?B?OEg1dUJPOWFaclZUbC9Mc05YWFRWekxCTld4b2szenhVa241aVFoS29xd2Ra?=
 =?utf-8?B?aVlNMkdYYkRja1pFMWQ5bnpsbjlVTzVOZGZpcUVuVGxqdS92SDNyUCthWndS?=
 =?utf-8?B?S2Z2VzZiVEEvRmRoOEp5VWhQOFRHR2RsR1o2bW5wR2grdUlKVUdFR2Q0cHo1?=
 =?utf-8?B?a2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d1de9aa2-1d64-4010-f6ab-08de0c18b62b
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7198.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2025 18:29:01.1079
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ju/GTd894m4/a12YWdAZZzoQnh3EXEVlbeRZPDeLUTpYx6Y38pQEBuoiaNX16PUnhJb7csFtssb4rYNF0XOLAA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6987
X-OriginatorOrg: intel.com

On 13/10/2025 17:53, Ram Prakash Gupta wrote:
> From: Sachin Gupta <quic_sachgupt@quicinc.com>
> 
> Parse dll-presets from dt and introduces the capability to
> configure HS200 and HS400 DLL settings from device tree.
> 
> Signed-off-by: Sachin Gupta <quic_sachgupt@quicinc.com>
> Signed-off-by: Ram Prakash Gupta <quic_rampraka@quicinc.com>
> ---
>  drivers/mmc/host/sdhci-msm.c | 38 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 38 insertions(+)
> 
> diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
> index 423e7cccab7d..8038b8def355 100644
> --- a/drivers/mmc/host/sdhci-msm.c
> +++ b/drivers/mmc/host/sdhci-msm.c
> @@ -266,6 +266,19 @@ struct sdhci_msm_variant_info {
>  	const struct sdhci_msm_offset *offset;
>  };
>  
> +/*
> + * DLL registers which needs be programmed with HSR settings.
> + * Add any new register only at the end and don't change the
> + * sequence.
> + */
> +struct sdhci_msm_dll {
> +	u32 dll_config;
> +	u32 dll_config_2;
> +	u32 dll_config_3;
> +	u32 dll_usr_ctl;
> +	u32 ddr_config;
> +};
> +
>  struct sdhci_msm_host {
>  	struct platform_device *pdev;
>  	void __iomem *core_mem;	/* MSM SDCC mapped address */
> @@ -274,6 +287,7 @@ struct sdhci_msm_host {
>  	struct clk *xo_clk;	/* TCXO clk needed for FLL feature of cm_dll*/
>  	/* core, iface, cal and sleep clocks */
>  	struct clk_bulk_data bulk_clks[4];
> +	struct sdhci_msm_dll dll[2];
>  #ifdef CONFIG_MMC_CRYPTO
>  	struct qcom_ice *ice;
>  #endif
> @@ -302,6 +316,7 @@ struct sdhci_msm_host {
>  	u32 dll_config;
>  	u32 ddr_config;
>  	bool vqmmc_enabled;
> +	bool artanis_dll;
>  };
>  
>  static const struct sdhci_msm_offset *sdhci_priv_msm_offset(struct sdhci_host *host)
> @@ -2531,6 +2546,23 @@ static int sdhci_msm_gcc_reset(struct device *dev, struct sdhci_host *host)
>  	return ret;
>  }
>  
> +#define DLL_SIZE 10
> +static int sdhci_msm_dt_parse_dll(struct device *dev, struct sdhci_msm_host *msm_host)
> +{
> +	int ret;
> +	u32 *dll_table = &msm_host->dll[0].dll_config;

Local declarations in order of descending line length tends to
look neater, more readable e.g.

	u32 *dll_table = &msm_host->dll[0].dll_config;
	int ret;

> +
> +	msm_host->artanis_dll = false;
> +
> +	ret = of_property_read_variable_u32_array(dev->of_node,
> +						  "qcom,dll-presets",
> +						  dll_table, DLL_SIZE, DLL_SIZE);
> +	if (ret != -EINVAL)

Would rather have expected:

	if (ret == DLL_SIZE)
or
	if (ret > 0)

> +		msm_host->artanis_dll = true;
> +
> +	return ret;
> +}
> +
>  static int sdhci_msm_probe(struct platform_device *pdev)
>  {
>  	struct sdhci_host *host;
> @@ -2577,6 +2609,12 @@ static int sdhci_msm_probe(struct platform_device *pdev)
>  
>  	msm_host->saved_tuning_phase = INVALID_TUNING_PHASE;
>  
> +	ret = sdhci_msm_dt_parse_dll(&pdev->dev, msm_host);
> +	if (ret == -ENODATA || ret == -EOVERFLOW) {
> +		dev_err(&pdev->dev, "Bad DLL in dt (%d)\n", ret);
> +		return ret;
> +	}
> +
>  	ret = sdhci_msm_gcc_reset(&pdev->dev, host);
>  	if (ret)
>  		return ret;


