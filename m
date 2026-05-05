Return-Path: <linux-arm-msm+bounces-105905-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SBt9M+rD+WmxDQMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105905-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 05 May 2026 12:18:18 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 777D74CAE19
	for <lists+linux-arm-msm@lfdr.de>; Tue, 05 May 2026 12:18:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 90F8130948B5
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 May 2026 10:10:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39B273F7871;
	Tue,  5 May 2026 10:06:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jmLXrMPD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C255D3AD51F;
	Tue,  5 May 2026 10:06:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777975566; cv=fail; b=EodxA8Tt0ZFeQq9SzYhRPTQYDxapaW2q7XhqWI9kOPF4GZ5Sd/Zm3K01KlFTApyXKj3g2mA4iQ/ccUJLzRgaK/HR9jjV+zw25P9bug3N2ztWfMRg2VFHREbQHk5psz6HqzsytbkY/f691DUdE3yUWvNkCEjOzjLygc60jz+DpsY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777975566; c=relaxed/simple;
	bh=W6GTsAIFlDpzJ0tF0E60g+0oezCQYYJxsv2/K2x1Im0=;
	h=Message-ID:Date:Subject:From:To:CC:References:In-Reply-To:
	 Content-Type:MIME-Version; b=hQrg8pUwtJICqdjBfdJfMEw2pVheiEFTCTAT3yUYGj9JDTmDzNdoen48A9yo9wB6KY/pCRpWWsDjOppvKtXVQKAMudqh+4u3H1j/Z9Ef7OJ1/DT14qbCCXzX5ESBkYy3aoAaGnENK/LcYw0t/t8QdtHPHMjDah1k5kk+fwuVKGE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jmLXrMPD; arc=fail smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777975564; x=1809511564;
  h=message-id:date:subject:from:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=W6GTsAIFlDpzJ0tF0E60g+0oezCQYYJxsv2/K2x1Im0=;
  b=jmLXrMPD4pa44ABL6eu/mvvZoqnspVdcETYxGs3skjHrDaidIi3usOrn
   +7jaZEgmVgvbF99tdiTuUs65v5umv4KpW0fFz9pGwKFmCNUbqDHdoZR4r
   1udYe9HyJhIJcwr2CYiO/qxRgurepcGeZ5hz2HuleAhdsulyFriQ8Qxkx
   1W4RkaDYOrSCxEet27cNIY7a9lxz8kzTC1V4edQiEAulHyVCtmmt/AwB2
   avEjdU86YVQICC2q38qgBGeTLffDgFoHoay4N0F2GvCqUiO8YkFpGjECg
   g3vJCVN1JOvq1Ep1EHRgXNMV6OOpXDMa11o+eIUyFX0Zbvik1a4JkPsdF
   Q==;
X-CSE-ConnectionGUID: PTjbLDCrSmK0NORCnMfduQ==
X-CSE-MsgGUID: mTX10RvDTMKPtlDJEXZWzw==
X-IronPort-AV: E=McAfee;i="6800,10657,11776"; a="79030946"
X-IronPort-AV: E=Sophos;i="6.23,217,1770624000"; 
   d="scan'208";a="79030946"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2026 03:06:04 -0700
X-CSE-ConnectionGUID: 1pbByNl0TdS4fmxjBpEJ0w==
X-CSE-MsgGUID: BOxLr4LQSDqdzH75buTqyg==
X-ExtLoop1: 1
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2026 03:06:02 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 5 May 2026 03:06:02 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 5 May 2026 03:06:02 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.5) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 5 May 2026 03:06:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JbNzP/EJUDCXF9i5vG1B8F7dOXg2g5IcoNpdl+YRAJnQswZGpRslluv4NKASq4ley7pSWZKO/xgrI31fjQMUlBM5dTV3oCrthvbmMf9joWBTfxLfCfqH/YqIERxOce3GFNqLvoxXKNG2ZNBqRmsM17j7o0+B4O5iHEYJlggUQShfho23FC/jf5H+MDvT/gXVQL+HHDgAIqYt60jPSa4+Fjok8LXX0MnBpKEm1uvS6/R4FtTicLodm4qCVE2/anLtfR3IzfDVviLXHdKb1rS4yPSNGJeP47Y259pdDDU/lS/hUmecA1H1ffAecfHEBG608ksmKPAJZum7USXVWQzqcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=miIRr8IAH6HlqaZZSE3NrkeCpysA5RVi37vQ3maz8jY=;
 b=gWFtO+PUZtA8be4rk3jmc1LuF1fxeH3nqpkNI3AfoHw0Wolt2g4gzUb1J0A6x/RJp0UlP4mkVKQburyLgO2sRYRkw4ayQj0Dsl8b/+vakdCuM8lAUQj5b7f9f0x7kS8shaoIJ6MC463R3EmjfvrT37RigzCfb8K+/DrmxouPJXTDuoT08FqbWIpDi2bvvOhsc/3C5Si/a8KBaFvSGR8TOaQh6y/beRCqqxSu5SKNGJeOewvsvnXf2fjMXaDV9SZWWa2Hcmjub5IegamoUKvtePba52N57A6FIv45wZj03frkhWjMmg3rOVUSV4psGXoH5HR/5UXZ3IxkO4WAxrEa0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7198.namprd11.prod.outlook.com (2603:10b6:208:419::15)
 by SN7PR11MB8041.namprd11.prod.outlook.com (2603:10b6:806:2ec::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Tue, 5 May
 2026 10:05:59 +0000
Received: from IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::2c4e:e92a:4fa:a456]) by IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::2c4e:e92a:4fa:a456%3]) with mapi id 15.20.9870.023; Tue, 5 May 2026
 10:05:59 +0000
Message-ID: <e0a93b90-5e9e-4856-bc4a-60547282420b@intel.com>
Date: Tue, 5 May 2026 13:05:51 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 3/5] mmc: sdhci-msm: Set ICE clk to TURBO at sdhci ICE
 init
From: Adrian Hunter <adrian.hunter@intel.com>
To: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>, Bjorn Andersson
	<andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, "Manivannan
 Sadhasivam" <mani@kernel.org>, "James E.J. Bottomley"
	<James.Bottomley@HansenPartnership.com>, "Martin K. Petersen"
	<martin.petersen@oracle.com>, Ulf Hansson <ulf.hansson@linaro.org>, "Neeraj
 Soni" <neeraj.soni@oss.qualcomm.com>, Harshal Dev
	<harshal.dev@oss.qualcomm.com>, Kuldeep Singh
	<kuldeep.singh@oss.qualcomm.com>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-scsi@vger.kernel.org>, <linux-mmc@vger.kernel.org>,
	<devicetree@vger.kernel.org>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260409-enable-ice-clock-scaling-v8-0-ca1129798606@oss.qualcomm.com>
 <20260409-enable-ice-clock-scaling-v8-3-ca1129798606@oss.qualcomm.com>
 <5ebaeea1-215b-415b-9333-02705ac305f5@intel.com>
Content-Language: en-US
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park,
 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 -
 4, Domiciled in Helsinki
In-Reply-To: <5ebaeea1-215b-415b-9333-02705ac305f5@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DUZPR01CA0001.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:3c3::10) To IA1PR11MB7198.namprd11.prod.outlook.com
 (2603:10b6:208:419::15)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7198:EE_|SN7PR11MB8041:EE_
X-MS-Office365-Filtering-Correlation-Id: 412bab10-63bd-4e77-7b06-08deaa8de773
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016|921020|56012099003|18092099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 6ZDEsLhEtEwAU25k8x2ArHr4Bg66NY98xlKc1NvaH7z+ln+r+fWjPFfJnDhBR0J/3QMD6vHMgqgpb357uWHFOy1zKK9iZg08joNKgyUdvGf6JYyGEXXi+TN7UmLiYHjiPCMbwk3duAVzyOy7oPbs/Psx6l1EVJN86QJHQ4ZYgp7VUJGc81ce94Tc4pa0wdsCOoz/hHS9FkSUWOTXMCY7IcWpFp1RqI5I30JRVH9/5OI1f9jgdItGy2QC0A6YDt7lz/gh6vGEa5teAg99+dvsSr89ORSqekkuTEQSrLMubvBh1rLysAViXFVAuTX/2B3qCiXvMYu2wDCkD7NpMNpDtShyEv+GWfKWTNi629Xl4xxzrH9CfXbRb9xP96HC+KrcSCw5vERpgsd1wtxGuodcLybt3ms+9xin/cvcTvFScnBEaVgS0z37RVQnLMQTSAJwMWullzq8Oajd1B9Rr+pIUJ2YZ0380u6qHDRxsc3maBpF3Zp0UbO76+EgwI9Pm+vVnIC+p0tC0e5u5289zIrE3HsllgoZsHROLyPA1LnoltSb6D/qeEhpm783WSD/iuweYTW5wHH/GOhW9ZgFxksn2Rd+mF19nGwNwYdQoA3nFoc+EFkqR23w7axl9E2bZUI1np6PrfPqiOe/WqBGlXeEzJu+9IHs93anXCA2qTb9k4EmA50ncwAM/QsyQX5/EEfiYmN38LZoZJKmkz+NuhYOkNoD19gssJjULXlkfryDtsM=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB7198.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(921020)(56012099003)(18092099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z2F5V2JHZk1xeTc5MFdkMTBaTDlJWHZaKzF6Zy9hdkxObkdqOS96OU9ta25q?=
 =?utf-8?B?Y2c5cGUyYkpqL282RzZMTHN3QVhIcHVUUEtkRkJMc0lKYzk0VHRPdlhWTDNZ?=
 =?utf-8?B?T0RNTGdodWhzWUZYZTdhbUNXT2JrNk9mWW90cHZycHBkR0ZBM2o2cjc4cFNo?=
 =?utf-8?B?VDJDVENPZE1LWlRRbDNNZy9LNFdoOWFZY2NZdjlMSFVDazV6YU9QNGMrZHN0?=
 =?utf-8?B?TWRWZVVBc2RqM3Q0emk1QTcwVHpybUNLckY3c1kxWjJ6M3l1alFRRTRuMTMw?=
 =?utf-8?B?M0ZoVks5RUFmaDhwcXZMSWNxN1ZyM3N6WUhRQ2FuNUlpek11WUZjL0lsdjlo?=
 =?utf-8?B?b1Q4Uk9ObVhhSjZIYUVpaUFKd3Nxc3RjaDRKYmRZOUtpcU5OWTlBWjFtc0pM?=
 =?utf-8?B?MUhhOW9FalhFL2lGbTFiZ0pDWUFYNGxXNkVsQ3YvUUJGZ1NHbjhtcFRLVUJz?=
 =?utf-8?B?OXB4OWlKOEZ2SnlXQ3kxZktnSktWRVRuSmhSejZiR0tOdmVCbUdOWG1HYzRH?=
 =?utf-8?B?aE4wZFN1S1MzTENMNklkcHdIVmNOc2xOOTFjNmdWdTF4MENOUHE4TmNxV0Qv?=
 =?utf-8?B?ZU8wOVJRankzMGVwK25wTzlGM1BGUWowanZ3ZjNJUmhaaHNKblppS2pHMnl0?=
 =?utf-8?B?eFplWmFSZ2g2TXFWaFhsb3NRNkhEWEhVQ09veVprdEpYdHB5aWFYOFhUN2Nz?=
 =?utf-8?B?eDYzb3hndUptWG8xeUhqa2xEUldVT0dKUzJhYkdQOUFEV0VRVzNQVzNPN2Vj?=
 =?utf-8?B?QUlORHZRbm9sNVhGaXl0aE4yK2tBQlFsTGZNWVBNMGg4ZDllaU5YWlZnVVdT?=
 =?utf-8?B?VDBEUmpGekVKVWxMZ1Fkb1paVGZLSVpocnZ4SERYY3pJNUUxVGRTNmNTWk5r?=
 =?utf-8?B?anZ6VXZ0di9YcVhCZVE1YnE0cFdjVTRSczFSOGoxR1dKNDFGSHFwODJJUzdq?=
 =?utf-8?B?K1BYU1hHMjkwT1hsczhmUWRjRlE4aG5qNkxkU3NMMUErKzN4N2gxTVVadHJJ?=
 =?utf-8?B?cnlJYUR5eEN4QWM2YWRIYjlZV3Z1L1BMeTNSMEZGTEJZN0ZETmpmV0lZc2kz?=
 =?utf-8?B?ODY2bWIrVGw5dEJ3UUhDOFcyTjVtQXUyamp1QkYvcUJaNjIyWE5UNzBkaE5X?=
 =?utf-8?B?NTFaOTFva2N4WjBOUURFbXhoTjlyYWExN3pkOHlCdlFDemZhKzRjS1AxUlVJ?=
 =?utf-8?B?SVlOdFp0TExPVXFpSlhoTjRKMnE1SWpGdDVnbVFGQ214eGFXOWlOWVZBNW9C?=
 =?utf-8?B?MFoveDJWcDAzMlZqK29yenFEVlBYc2lJOUhpajNvV29oL3BtM1hnYWpicE8z?=
 =?utf-8?B?UnBIZ1gxTitTb05lZFBDa2lRSmpzb2N3eHlWN2liT3BrV3V6VEt6OHhjZWlV?=
 =?utf-8?B?R2psaGpXME0vTW1yZEphS1NJVVFFY1dLbVdrd2FkQWZyS1Q5akczZTI3d3E3?=
 =?utf-8?B?UVJvYzdCS0hFTjQxbVhTNkkzK0F2SGxsZTl3NmE3NFJJcSsrVGRsN3VmRDIw?=
 =?utf-8?B?QXloTlh1OWRvenRTdTJ5UEZaR0JPa3NjSTNpNDhOVlRjbkpiV280bGxVRVB1?=
 =?utf-8?B?Q1U1Z2JiazJNdVNqL09oT2FVNmt4a2l3THF0VExjcnhJT3ZKcFFGS0ZDSU4z?=
 =?utf-8?B?V2JCU1pkaGR3aTE2aEkwWDdLbThaOVpSWGhERnlIV0hVd1pmRnpTSGNhS29I?=
 =?utf-8?B?VEQxOUN4RllGSDg4dWNJNlMxUGRkWXVjYW14UGRoYURtZXl0MmVRNU1kQnBI?=
 =?utf-8?B?WEFnTERoS3EzbE84Q2xxbFFPTVNUcnhEcWoxSTI2SlFqa1dSakswRG9INURW?=
 =?utf-8?B?dHM0eE9HTzdycFpnTGVKUFd6NEFNUmZtSXppMDRCVlJFNE1mRSsxOFNNL1Q0?=
 =?utf-8?B?SlBsWEVLN3E1WGN2TmoybWd1S2k1S1VEem1SYW1OWDdUZ0FPVnhSazNpQy9i?=
 =?utf-8?B?MXF3TGF5TGlMMC9rQ1J6U2tFR21GcGF4YURTeWVaWHNSNXVxNkRtZVdCY2xl?=
 =?utf-8?B?UTJuTDNRWFJoY1lFc2psQWpSZUYvNVRpNllXUE94RUVRTWdSNmZEVnUvSjFl?=
 =?utf-8?B?V29ZbGt1a3ZlOHR1WnFGbFFGSHRBOUw1eFZOS0JmSUJRT3NKbi9jNG1hWGVs?=
 =?utf-8?B?NmFIaG1rUEtOa0xVWnJoN1djUzRpQjROTlRtaFhPdUtoOU1XOG1rMFcrdDRq?=
 =?utf-8?B?dWFjR3NtQTBvaFBCaWFRTHB0eVFpK1VBbDkxUGNYOFljdEg5eVdJMTFiaGFP?=
 =?utf-8?B?aWlreVFFVVNLTVoyYW5pL1FrK2VzbllvRzg0RENpRng4TjlTT25WZG9DSU8x?=
 =?utf-8?B?bjZ0RlhnSDlWOUgwRlluM3I3Q2Y4cWlScjA4NTJ1TFBqcWRicytDbkJVTDFt?=
 =?utf-8?Q?GKn29gjKXk4kdh84=3D?=
X-Exchange-RoutingPolicyChecked: uolWXyrSDqrcIfE1z+TDWMcQTe2tUtbmFUsqEwIdeWKzuo9NmAHAGNMW/BnxuDodUmcNYRpV7ee+B14j0sN6ktBAM/hqRmJa3Hp8NgCM0nU5K6SqjJqtsUA32HTD0exi5IqPkrZa4yjJad8Wu1fCpemi4P8guhi7LncQCWmA2GeBPUTqtat8VnLRyyse6XWE/ZobNmRIxdEwlastPT+I7fpZzaqWEeBqCIFyfRyTfCe+VSfRoE5A3xSGEDxyMxo5af5HrDhITjVevmCzB+GheCdlhX4iZMtApA3rklpxRy0tL19GkaQIEgbHXOR/xzvxBpncaGLr60wCTEz0y9DBxg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 412bab10-63bd-4e77-7b06-08deaa8de773
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7198.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2026 10:05:58.5142
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U0X3mtqxpLcSjTUA0Vem9/v7P0V2asxznymotR62P4bI2r9FyPSA3GdFcCvklh+iOk8DCdAe6YFVdC70RIHu7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB8041
X-OriginatorOrg: intel.com
X-Rspamd-Queue-Id: 777D74CAE19
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-105905-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,intel.com:dkim,intel.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email];
	HAS_ORG_HEADER(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[adrian.hunter@intel.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[10]

On 05/05/2026 13:00, Adrian Hunter wrote:
> On 09/04/2026 14:44, Abhinaba Rakshit wrote:
>> MMC controller lacks a clock scaling mechanism, unlike the UFS
>> controller. By default, the MMC controller is set to TURBO mode
>> during probe, but the ICE clock remains at XO frequency,
>> leading to read/write performance degradation on eMMC.
>>
>> To address this, set the ICE clock to TURBO during sdhci_msm_ice_init
>> to align it with the controller clock. This ensures consistent
>> performance and avoids mismatches between the controller
>> and ICE clock frequencies.
>>
>> For platforms where ICE is represented as a separate device,
>> use the OPP framework to vote for TURBO mode, maintaining
>> proper voltage and power domain constraints.
>>
>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>> Signed-off-by: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
> 
> Reviewed-by: Adrian Hunter <adrian.hunter@intel.com>

Or rather:

Acked-by: Adrian Hunter <adrian.hunter@intel.com>

> 
>> ---
>>  drivers/mmc/host/sdhci-msm.c | 24 ++++++++++++++++++++++++
>>  1 file changed, 24 insertions(+)
>>
>> diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
>> index da356627d9de6a11ed5779bf057fa8eb23c38bc0..32e3f37fe425f66c00290a373e06e8ab6257824e 100644
>> --- a/drivers/mmc/host/sdhci-msm.c
>> +++ b/drivers/mmc/host/sdhci-msm.c
>> @@ -1901,6 +1901,8 @@ static void sdhci_msm_set_clock(struct sdhci_host *host, unsigned int clock)
>>  #ifdef CONFIG_MMC_CRYPTO
>>  
>>  static const struct blk_crypto_ll_ops sdhci_msm_crypto_ops; /* forward decl */
>> +static int sdhci_msm_ice_scale_clk(struct sdhci_msm_host *msm_host, unsigned long target_freq,
>> +				   bool round_ceil); /* forward decl */
>>  
>>  static int sdhci_msm_ice_init(struct sdhci_msm_host *msm_host,
>>  			      struct cqhci_host *cq_host)
>> @@ -1964,6 +1966,11 @@ static int sdhci_msm_ice_init(struct sdhci_msm_host *msm_host,
>>  	}
>>  
>>  	mmc->caps2 |= MMC_CAP2_CRYPTO;
>> +
>> +	err = sdhci_msm_ice_scale_clk(msm_host, INT_MAX, false);
>> +	if (err && err != -EOPNOTSUPP)
>> +		dev_warn(dev, "Unable to boost ICE clock to TURBO\n");
>> +
>>  	return 0;
>>  }
>>  
>> @@ -1989,6 +1996,16 @@ static int sdhci_msm_ice_suspend(struct sdhci_msm_host *msm_host)
>>  	return 0;
>>  }
>>  
>> +static int sdhci_msm_ice_scale_clk(struct sdhci_msm_host *msm_host,
>> +				   unsigned long target_freq,
>> +				   bool round_ceil)
>> +{
>> +	if (msm_host->mmc->caps2 & MMC_CAP2_CRYPTO)
>> +		return qcom_ice_scale_clk(msm_host->ice, target_freq, round_ceil);
>> +
>> +	return 0;
>> +}
>> +
>>  static inline struct sdhci_msm_host *
>>  sdhci_msm_host_from_crypto_profile(struct blk_crypto_profile *profile)
>>  {
>> @@ -2114,6 +2131,13 @@ sdhci_msm_ice_suspend(struct sdhci_msm_host *msm_host)
>>  {
>>  	return 0;
>>  }
>> +
>> +static inline int
>> +sdhci_msm_ice_scale_clk(struct sdhci_msm_host *msm_host, unsigned long target_freq,
>> +			bool round_ceil)
>> +{
>> +	return 0;
>> +}
>>  #endif /* !CONFIG_MMC_CRYPTO */
>>  
>>  /*****************************************************************************\
>>
> 


