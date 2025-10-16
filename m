Return-Path: <linux-arm-msm+bounces-77522-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E7A1BE1DE8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Oct 2025 09:08:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 03C193AEFB0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Oct 2025 07:08:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20D542F6572;
	Thu, 16 Oct 2025 07:08:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bI7obuSl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C4CE23ABA0;
	Thu, 16 Oct 2025 07:08:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760598499; cv=fail; b=aPThQIQwv3FezWyx1dGNgehr3tRIYQ8NAhtwb63R0IAugLlz3MPu6RfOTiL8YB6hnyfzG9sqUEuUbJw+o6cAjiOotbZHiP23/fU2YnT5RU+fGMNFZDvlrFwawCNDP/vfNXPFN1eIDMSjvRvJg+6H0DhdfKbT5a1h8dCPR8lWff4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760598499; c=relaxed/simple;
	bh=iFRyzJUjbOKo2LuatbMOMU0kF8PLlsZJLimVNXwgwO8=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=tmusQGfOpgbKf+8Z1nzepAvG71YcAMwNWZtgPBuOCnfg4HAQ7OuSmQEaoLCRuJf0pK6YHFWNV0vA8WkAP3rR7nARZ6X+4geUP3dSq9VCaUK+jikdgi5jxuVG8KP4Jt40aTA3UKlRuKfyIGxKeB8B0NGkrZjTIwfok2dzLwVo8iE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bI7obuSl; arc=fail smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760598497; x=1792134497;
  h=message-id:date:subject:to:references:from:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=iFRyzJUjbOKo2LuatbMOMU0kF8PLlsZJLimVNXwgwO8=;
  b=bI7obuSl4vKg0gQ32ICd6U702dQntx+u0Q8WqyFjJrRyie1tW+xneYJy
   agsMIlWCA0EULiZhSe/gy+fnCiF44BfQFqbuSJAZgmOwRwOvbmmCzHAIQ
   kxhtKZBDN7OxiozuVHXY7rAwurs7Py2QfOYeqgJ6sO4U6WcTJg55XaFMw
   vqphW4GNVeXor8QFxfO42ifC1v3bcVmuBUFvt4MQ8WaWBrXdL4wI7Dlw3
   0g2O4p9MEAz/rOvaVab5kzD0pb0oWuijr9W26rCfklwkvpF8EydVnuLm9
   BfOVnEU/VUHIw3j0kJpjIc3nVN0alBYJYBZXeAUKYHA0sHwwrG5VGxI3N
   g==;
X-CSE-ConnectionGUID: 2WBsmSA8RtaT1lsqJYUykw==
X-CSE-MsgGUID: Vqqd1B2xRAG3Mw/W8p6wCQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11583"; a="65400678"
X-IronPort-AV: E=Sophos;i="6.19,233,1754982000"; 
   d="scan'208";a="65400678"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2025 00:08:16 -0700
X-CSE-ConnectionGUID: nn1Rvx7XQB25aA1LMECHiw==
X-CSE-MsgGUID: vs3GxCr8ST2N/zQ3jzyw2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,233,1754982000"; 
   d="scan'208";a="213335602"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2025 00:08:16 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 16 Oct 2025 00:08:15 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 16 Oct 2025 00:08:15 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.68) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 16 Oct 2025 00:08:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nT0vzRTtH/8EHNkrrsbWPeOfgtjyBwXrlrCdcsE5htKJu/TjjLTyDj3IsOT+x4poqWHfmK+u7jzBB0LUOOTruAmu/sDV5RfI9QeKUEjXIMlz+6XXf25dYgNH6mhOx6ehPrcaEco9X05Zi243+SNd11D2BGbTk/aWhiMjUukE/vb9EehGhHDiYLA9rwEONSm53PBiUqCDRORb7mgC07c6rg3Y9x6iDWF4CsLQNINGc79lt6E6hkHY/sZiriz4G+68YH1C8ppgamgnxLLzc5L99CcLo/fHY+sbrB5bz5QxdEAH60mLZnqmV6m2Q55IrNy3HvhGwIwEnS6jsC5OL/NndA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mf6sPqNtUQRHb7TBLyDkgFDXvZ50yAz9J2LBDRCWlZs=;
 b=xxx0r/h6DQnIuJ29jIZBUP38AwJ+6+gL9AYsddl7J6cg8Nfhcr/WBhHuXZOIIlRBF+x28dm5Hnc5/4TFbJO36z/LzNziLgTtf9pImRLP6SMMXvnMyUDNLhNtNxIijPy6fSY4HcOqJTcLzt6wU+zhy9tJIMFFUqHh7NxQNhO2IR0iHzYBl2c4lWjZCAfWgHnG0yiCU607W4QSUugc+bLvjET0qjZCLX7cF0iafGj87JpF0L5gv01qINZwB+hqPlUva0IAS5zFixIIYc+UHnEMhVKu5lEDkxtnELARH8tQ0lyf+GLEzg57dsQrVd/FgW66VzC0cFBxbJQHKeUTdGBnUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7198.namprd11.prod.outlook.com (2603:10b6:208:419::15)
 by IA0PR11MB7694.namprd11.prod.outlook.com (2603:10b6:208:409::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.11; Thu, 16 Oct
 2025 07:08:06 +0000
Received: from IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::2c4e:e92a:4fa:a456]) by IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::2c4e:e92a:4fa:a456%3]) with mapi id 15.20.9228.010; Thu, 16 Oct 2025
 07:08:06 +0000
Message-ID: <0a8b4abe-3348-4f2d-b986-f4f5cc7e68b5@intel.com>
Date: Thu, 16 Oct 2025 10:08:02 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] mmc: sdhci-msm: Enable ICE support for non-cmdq eMMC
 devices
To: Md Sadre Alam <quic_mdalam@quicinc.com>, <ulf.hansson@linaro.org>,
	<linux-arm-msm@vger.kernel.org>, <linux-mmc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <quic_varada@quicinc.com>
References: <20251014093503.347678-1-quic_mdalam@quicinc.com>
Content-Language: en-US
From: Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park,
 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 -
 4, Domiciled in Helsinki
In-Reply-To: <20251014093503.347678-1-quic_mdalam@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DB3PR08CA0012.eurprd08.prod.outlook.com (2603:10a6:8::25)
 To IA1PR11MB7198.namprd11.prod.outlook.com (2603:10b6:208:419::15)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7198:EE_|IA0PR11MB7694:EE_
X-MS-Office365-Filtering-Correlation-Id: ccd56d10-ef2a-4170-ca55-08de0c82c150
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TWM4am1WNDE2YTZKTzNTOVphQ29YUnUwdm5sNEdvZEhOM0NGUFpLUFJiQkZh?=
 =?utf-8?B?N2N5M1Qya3Vqb1lha0daZjZEUm1NMVNhejlBMk9SS1pFNXNDeG1HRkhGajJr?=
 =?utf-8?B?bm5adXliaTFVM1RXU2o5bjhHbjFFUlJ0RmFrdzgrb0c2a1FhM3VBY0YxcG5D?=
 =?utf-8?B?TTFFZjhWS1JLWmMwTXNUT3Nra2Rzb2Jjd25xOXVxbXB6c2FqNERYd1hUcFBS?=
 =?utf-8?B?UGRlcjNha0NoN3NmTWM1OUtRai9NWG9hVUV4dTVHTXdWRlFKb3lKZUZpMXYy?=
 =?utf-8?B?ZkpmZllEbnJSNWNVb1JpNndqcm1ZS2RCNVp2TTJMRzdZS0pxeHJjbGJxbTNp?=
 =?utf-8?B?SC9MK1gyNjZGaHVQZytGdXhKYzZoL0s5dWZuNjhWR1lUaFlPOUxEV2NYd05i?=
 =?utf-8?B?MWlucEJBeU16UkhHTDRRZkgzUkVPRFMxcGY2OG1FWkM5aDJmbnZRSllSOW5t?=
 =?utf-8?B?SEpUTnh5U2hla0NIVE4zVVZVWWhxR1dvbzFodU14bnU3dWYzbE5ybEFUN0kr?=
 =?utf-8?B?ODZOZXEyWlQreE44WVVzQmFXaUo0WGVJaFJoK05rMkJSK3RFLzZUTHUxTERC?=
 =?utf-8?B?VzcvNENNWDZvZnhXQmFXRkt4emN3M0FvZ0tBc1JpZmRiVmtrOUg3eS91Z09P?=
 =?utf-8?B?bWF1VmFzdUJpNUZ2aDdkaHo1ZklWbFVpUlNsTEs4cGZmTjNwRlFDUmpGSWQ1?=
 =?utf-8?B?bWd4ZHBqTXBCUkF5RHB5eVRVTkpLTUx2ZGs3VVBPcytJblpzTkVFN2RRM3g0?=
 =?utf-8?B?RmM0QkpaVXY5VDRTSmM3VUgzSHhuTFZkVnBtdGtvelV5KzI3UHdpazQ1L1Nz?=
 =?utf-8?B?WGlibHpweFV3U1dkclp4amQwZ2lUYjJzYjFLdUVid2EwVlZWcm9kQmpoSm9U?=
 =?utf-8?B?c3RqYzd1UFVsK0puR0ZhU3RaWWNEOGdjVWJwU0ZpeWl2eDg4MWpGVWdMODdL?=
 =?utf-8?B?aGJNT0Y5bnRDakZOVGRTbkJrQkNkR3o0RThQblVFaVA0Q2FQUFU4VVFaQzBB?=
 =?utf-8?B?MzJvdEhkV1JpQVZzL2E2NWlMdnpJWkRGcHIyTllzNmpFYUJoNHRIMHc0dFR0?=
 =?utf-8?B?dUJZc1ZRNGcrRlNaSDF4TVI4TDBoT0grZHg1NUI1UGxvNGZORlJZREE1TzNQ?=
 =?utf-8?B?K2tmOWhkOFhzWVNHZ2V1UHM2ZnRVQklnMkRJNFJPUkptVzdDSGp0SmJtUE10?=
 =?utf-8?B?OVhVWlBMUi80ZlhRK25ISzExWTdpY3BVK2NyYlBSRzZRVVNsM1lFTnJjQ0xF?=
 =?utf-8?B?M3cyeDU1QkhiZHNZNjVUczJ2MHQ5ckVBN2JPdkllT3gyVy92MmMwb1dEOHlw?=
 =?utf-8?B?OFIrdmlOakFnSjRHc1dYb0ZRZXp1VEFDTmVFdTZjTDBBdjM1YkI2T2RvckpH?=
 =?utf-8?B?NkEySHplZ2dIay84MXp1WDZWa3hYSWNiTG1ISi94Z04xUjh2VGFvSUNMWGV2?=
 =?utf-8?B?SXFrUDZ3ZThLVDhWcm4wYlc0QXdXVG1HUHI5SDA0OVljZURzYjFmYlVzL1Nu?=
 =?utf-8?B?dTN4aGs5em1GVFNXa3pYUS9DclFhT3NPdjY0L2VpZEdXUmgwWXppTmxnYmM3?=
 =?utf-8?B?cGpKbTlKbGtPTUFnYW8xbWhFWWhkYUJCMjNhcGx5d1dWTGYwZHZocFhKWTlD?=
 =?utf-8?B?Z3R3VDFNcWE5UytDeVBnQWQxeGRWY2ZsTWpKQUdTbWVJYTNYZEJUUkFsRW5r?=
 =?utf-8?B?d0RYenI0MW9zczh4UzQyeGt4U0hTdGprMWk5cTZrTmNUQ2IvWGMzNkNuOFp0?=
 =?utf-8?B?RTgvenJKWEV2MU00YjZXUlZMd0E4YU5zeDZtaGVJWEpKelh0RWRNMmlQQkE3?=
 =?utf-8?B?b1FkQU1rRHJadCtQVE1jTWVNanpMQXRxdjhBVW1landodWtBUnZPd3Z5UVY3?=
 =?utf-8?B?SGVYVDZlOGRlVDRVUjNXUlp4MXZubGhjQVNySWI4UEdROE9VZXJ5bmdwSE5Z?=
 =?utf-8?Q?SNY5mkak8/02XcEfyrWK9L1n4y3p8pJm?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB7198.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SGcrZWdKd3FaWktLOFVwZStPY0t0TUoxczVDRXhNcTlZSE1tdFhIZVZQMEtk?=
 =?utf-8?B?Q1JWUWJDOXVOM1BmMnhrMmZoUFkwTWRjbTB4TklTTVhmKzNnYTVXcW9Mb1g2?=
 =?utf-8?B?anBqZE9OdE1VQ0JPb00wZ1UwYzNMZXFBUGt1S1BCL2RzWUhsU2lRVFNmZHVh?=
 =?utf-8?B?VUJvam9PQmtRYkZSUXVEc3NhVjRkQlJkcVl0Z1ZkK2EvaG51SGc2NUJPczZj?=
 =?utf-8?B?SndzeWRabjg3RnpYaXRGclZFY1dqVDJEMUdHdUxPdktZUHoxeUI3VzBxOVJU?=
 =?utf-8?B?aFU1ZXZBbldwNjBQVGEwRXNDWVYxV2hyRU9HQWI2VXk3V2tYWHk2VUFqSnZG?=
 =?utf-8?B?U0hiL2MvU053eDdtMWxIMGVKVWNnWkZBYzNFYU9JSWMzMXZuY29EMmliWU9Z?=
 =?utf-8?B?ZGpsbWppNjJOdndBd25lYWJvSzB4WDlJcEs2M21vL1pGMS8rU1U1bE1PaFFF?=
 =?utf-8?B?WWkrZ3JKd1FnY2NmRElCKzc3cWthaDRsMzBRT0QxSW84U1JFdkR5cWRoSXlX?=
 =?utf-8?B?L282Slc0Q2I1K2ZlU2pnOFlvYUFneVREbDFpdmpjQ3BwNVFMRlJvVERiNmtn?=
 =?utf-8?B?L3lhbUtIdVdXdllOVFN6Mmw0VUw3cklJMjZHNDdIYnNKamFaaSt3U1lTVXdx?=
 =?utf-8?B?d29TV0tPdzNVUVd6enVrcjZnM1NDTldnbHd0MDlKUXhFS3d5c2tDTkluN25a?=
 =?utf-8?B?V0h6dlJ5V2hlUFZ2ZFArQ0JXbXNhREIvOFF1WVRmUjFmR3V0bTMwZFhVbjNL?=
 =?utf-8?B?cUZIRlhmNjJHWHppWFBBakZUMVJWZHhKSU53SUlFTFRzS0w3Q2F1eVRjdlFl?=
 =?utf-8?B?TWRlMTZIa25NbmpOais0MVg1UjFYNXdSMWs1amRhREtodW1Ca25ncFdtTGcz?=
 =?utf-8?B?Qms1QlVSbkpPaU5ja2xiRUFPblA4a2RvUFZZL2xRNTYzcUttMjArTDBHMlNp?=
 =?utf-8?B?cGpVaXNHVWdDQ0JtcUIxbGdGYklTbENrUEtYU0R3RTRrd1g0LzNHQVNRcHNV?=
 =?utf-8?B?Y2FNMUxwU1NMUm5PdU4reDd1VS9lMWVuK2lwNGVmc3lHU2ZFTFdJcWNiQWZa?=
 =?utf-8?B?Y0svUHk2RHl1WWJvYzRrUUxEVWNxalZOQXR1eCtZdEtUdDFON2w3ZlJYZmR5?=
 =?utf-8?B?OXdHU0Q4Mm9OS1hGU1VvWEFSRXh3Y205WWErTExScVg5c010d09YelNidVZD?=
 =?utf-8?B?VUNyRzl5RXdnNTJoMXlKK0dMTzlrU3JEM1VrVVE0bkY2SEhWckhrM2NsSE5K?=
 =?utf-8?B?ZEtZTCtlc1dZRjA0Yzl6S1BUTndhWkg1WHgzbGdJVENqb05tMldSbUMwbXFZ?=
 =?utf-8?B?a1BoaXBBYk9SVkZzeHBHOWZlZE5NejVhZVRmNGwwYWFsc05UMGJNajY5SFpS?=
 =?utf-8?B?YVlMZ20weDZpTTloWXRaUGdiYk9leWlIbkVJK3NTWmxwV0NBQjhYWSsvS0Jx?=
 =?utf-8?B?MUoyYzJqeXMwOGlpRkgyNXJIV3hnbVk3RVU2VWcrTmN0NHBJOExJMFlyMTln?=
 =?utf-8?B?TGVHZlJhd0F5TVVkQkx1bzNJVkpENldhM2NTMmx6d2tiN2hnYXVEK09qWDFx?=
 =?utf-8?B?R0ZXejZ5cnczcEJQeTJWWUFZQzFTMVJZZTd3RmdSaTBhNEVqM3pFS3R3VTZ5?=
 =?utf-8?B?WG4wVWdDeGNtNElDUjZUc1l2d2hrMmViRXhIRWg5UXl0dWZ6aERHVjBBWkky?=
 =?utf-8?B?OWtlTzdwR2M3KzZ2RW1HTFA2cjRDOHhBUGxKV1BLaHJNUkcrY0Zyd0swMlN5?=
 =?utf-8?B?aiszbG1HeER0SmNFV1ZrbVcvZlF1ZGtDWDNkQkRUMEJudXRPK0I3RGVSdTV1?=
 =?utf-8?B?S2ZhM2ZiNi9xM1BXUlNrdEJUcGZnU0FtRlV0bVRHOURwRk9lMENwc01nZXBE?=
 =?utf-8?B?dEJRN0UrT0JtWWRBVW1yNjF2MC9jOVhGck9UU0p1T1V3MElHMTNWazRxWTlM?=
 =?utf-8?B?Z2ZKYWM2RlJ4dHFXWU9vY3I4WVd0SnhBZE9DQVcxTk1WZ0RUMzFTb3FPWWhV?=
 =?utf-8?B?OUdUMUdmMzUwOURmZHBpRjdWckYzRlVRZWFXN21EeTFsSS9wcytxSkVzRGNR?=
 =?utf-8?B?cTIrSXN0YkRIY2pNZ2xDSEtCYTZTWEFMc1hvdXA0Y2tRRlpEUUlnaGlEQkxB?=
 =?utf-8?B?Zkk2RUJnWFl3TEM2cjBNY3d2ckgydEtUbzdNcDJETFo1VDNROUFjYVUwVFd6?=
 =?utf-8?B?L3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ccd56d10-ef2a-4170-ca55-08de0c82c150
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7198.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2025 07:08:06.4549
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mxSD5pguzIE1DbGmtiObud+3hvdhfQbHHmXno+Q+sM3MVR0w/fEli71XdJoE0gzccFi9hIwLXvkyOsKquKHhew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7694
X-OriginatorOrg: intel.com

On 14/10/2025 12:35, Md Sadre Alam wrote:
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

Acked-by: Adrian Hunter <adrian.hunter@intel.com>

> ---
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
> index 4e5edbf2fc9b..483aadaca262 100644
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
> +static int sdhci_msm_ice_cfg(struct sdhci_host *host, struct mmc_request *mrq,
> +			     u32 slot)
> +{
> +	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
> +	struct sdhci_msm_host *msm_host = sdhci_pltfm_priv(pltfm_host);
> +	struct mmc_host *mmc = msm_host->mmc;
> +	struct cqhci_host *cq_host = mmc->cqe_private;
> +	unsigned int crypto_params = 0;
> +	int key_index = 0;
> +	bool bypass = true;
> +	u64 dun = 0;
> +
> +	if (mrq->crypto_ctx) {
> +		dun = mrq->crypto_ctx->bc_dun[0];
> +		bypass = false;
> +		key_index = mrq->crypto_key_slot;
> +	}
> +
> +	crypto_params = FIELD_PREP(ICE_HCI_PARAM_CE, !bypass) |
> +			FIELD_PREP(ICE_HCI_PARAM_CCI, key_index);
> +
> +	cqhci_writel(cq_host, crypto_params, NONCQ_CRYPTO_PARM);
> +
> +	if (mrq->crypto_ctx)
> +		cqhci_writel(cq_host, lower_32_bits(dun), NONCQ_CRYPTO_DUN);
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
> +		sdhci_msm_ice_cfg(host, mrq, 0);
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
> @@ -2185,6 +2241,18 @@ static int sdhci_msm_cqe_add_host(struct sdhci_host *host,
>  	if (ret)
>  		goto cleanup;
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
> +
>  	dev_info(&pdev->dev, "%s: CQE init: success\n",
>  			mmc_hostname(host->mmc));
>  	return ret;
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


