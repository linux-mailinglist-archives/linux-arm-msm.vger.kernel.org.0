Return-Path: <linux-arm-msm+bounces-92434-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2szHIW3uimmcOwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92434-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 09:38:05 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C74141184BB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 09:38:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4A9AE303C03F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 08:38:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B42AB332917;
	Tue, 10 Feb 2026 08:38:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A6wnSwM0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85C0527E1DC;
	Tue, 10 Feb 2026 08:38:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770712682; cv=fail; b=mZ60B+PEsdEbGy/BWz7dpbbbYyZyjzSkMbLXtnCrkhCeB8DytLUl6V6b4PIrUdG8Mi2ddKxohK2mjDXTU8sYSPoj7wSR5irqvKF1kAWdCxQDQNXleXWYXbuV1JyIXsX1fkeJ6rHudbQ3mlO0qQwntxP2DtRBCMq8yLmn7khaGog=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770712682; c=relaxed/simple;
	bh=+iAUUq7krhi2BM7x/EQ3i9RVhN6lvT+M8GFGSP2lHjc=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=d8W4ajNiLUpVsZFzN8BL0KRgdEDPTb4TfaPPE7SmqsuFTpIYcwqObwYiWBnuUPJmHQm/y3Bhxn9e4/6e77MAH6mgRHhWKDDvVlUeGoBqp2ZaPfPZRz+2Ng0KwS0DF/1cv81PVEuG4FaCWpqJVW4VWVMMUi898mWGEZMWPuJjMwI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A6wnSwM0; arc=fail smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770712682; x=1802248682;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=+iAUUq7krhi2BM7x/EQ3i9RVhN6lvT+M8GFGSP2lHjc=;
  b=A6wnSwM0asAivvbT8QTTKyW3f5a79uRtW8QdjFiTBnpFD/ZphjNZZ0DN
   kMT0PleXCEhz2AVGnbnGjq9MnbgV9occVTXilFMoouHbwCrQSN/2M3/FZ
   hHOZbX82GpbRZEutFpD9EL8wySEdEx/kjKdytP0/F82SyTDKFWX9Np32k
   SwbtYtr8fRLOrsKXSZ8iIuKRBH13onBYBoaeF2OQTbXMT4TrDfpqr252S
   MaIp/vNFkwBpHsOReETaNiOg24R7IGyLzJCQIkga0u+aL3P7ZeMRLVKEG
   uNI64y79l+y/ClV2XigIWs1kGPaWAiQ2FZmYBC97QJjA9+18ygbE27qfr
   w==;
X-CSE-ConnectionGUID: 9XaeSbADSfmkrgc6pZEwfg==
X-CSE-MsgGUID: 3F7BPGdvRzG4r7KhbzdmiQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11696"; a="72018702"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="72018702"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2026 00:38:01 -0800
X-CSE-ConnectionGUID: 9u0zGau6SSicbtgAlLHDug==
X-CSE-MsgGUID: WLdz477wTbykt4Jc3KvpzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="210946014"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2026 00:38:00 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 10 Feb 2026 00:37:59 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Tue, 10 Feb 2026 00:37:59 -0800
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.55) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 10 Feb 2026 00:37:59 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oZi2W2GsaqGefwQmHuljN3TaZm01znj1s1BdqXYsKJa+7b53cW0kr8dObAqLmEvggldwOKqM2N55EvlD6MskikZPdegEcFjq8TnCCksYM5ZM5BpSVD7r3yfNdsm4uP/lwm7BPuVrF/gjK9tIKo5XFTWEPgJY+2khqLuJSPc99pL1a3HrlP5Mn+FVriClDGTEQaNJA66UDhXcAg6Jd0jq/zaxnBnGx3EeF0VQ+hkAAwXJ53K+g+MQMxXUkytzWq+oa7Dvs7JX2tGi2evCVRzn97xgypgAqeRprOeWwHFIpVkxULgwKwJkd3yz4ki68+RFkYT7ICWMpv0WiCqEy2uDKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dWFgo3Dcaf3x5X3MOmQ0XnBvc/iLF3LtwRAZCGFu+Ko=;
 b=mq7Qu+Fdkn2LTFl4iaQ876oZx7FkPgpFvw5GiEX9/9PhBsQIRIbDin9Z5r/c+v226MED+R4NC6OWahouAR9JDCBcxnsJe0qHWMr4RfJF+YZkUHV8gCvT40A3G0LbFwF3y80+irK2EHnHrHOt2r3ybl4IM9zs94gda9Iy8SXZZczmoqxffmkRNofz0SGUbrHW+2Z21F17pzlIPmsPfEqFQZ8TqdKxEVHXTjTOhJWxdwZQkGHh61ncSmzUxWgXvmSC/E2C5pcZlVAX9uZxKtuClQSscwHI0J/9Vh2PRbkWnnVTRviOEnKpemSeaeTqTBRT4PYlbxWQy28SBXmWaytVkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7198.namprd11.prod.outlook.com (2603:10b6:208:419::15)
 by CH3PR11MB8705.namprd11.prod.outlook.com (2603:10b6:610:1cc::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.8; Tue, 10 Feb
 2026 08:37:55 +0000
Received: from IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::2c4e:e92a:4fa:a456]) by IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::2c4e:e92a:4fa:a456%6]) with mapi id 15.20.9587.017; Tue, 10 Feb 2026
 08:37:55 +0000
Message-ID: <5cb8c03b-638a-4677-a537-974eba41b358@intel.com>
Date: Tue, 10 Feb 2026 10:37:49 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] mmc: sdhci-msm: Remove NULL check from
 devm_of_qcom_ice_get()
To: <manivannan.sadhasivam@oss.qualcomm.com>, Bjorn Andersson
	<andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa
	<abel.vesa@linaro.org>, Ulf Hansson <ulf.hansson@linaro.org>, "Manivannan
 Sadhasivam" <mani@kernel.org>, "James E.J. Bottomley"
	<James.Bottomley@HansenPartnership.com>, "Martin K. Petersen"
	<martin.petersen@oracle.com>
CC: <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-mmc@vger.kernel.org>, <linux-scsi@vger.kernel.org>, Sumit Garg
	<sumit.garg@oss.qualcomm.com>
References: <20260210-qcom-ice-fix-v2-0-9c1ab5d6502c@oss.qualcomm.com>
 <20260210-qcom-ice-fix-v2-3-9c1ab5d6502c@oss.qualcomm.com>
Content-Language: en-US
From: Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park,
 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 -
 4, Domiciled in Helsinki
In-Reply-To: <20260210-qcom-ice-fix-v2-3-9c1ab5d6502c@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DB3PR08CA0010.eurprd08.prod.outlook.com (2603:10a6:8::23)
 To IA1PR11MB7198.namprd11.prod.outlook.com (2603:10b6:208:419::15)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7198:EE_|CH3PR11MB8705:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a061b23-cf17-4b71-500c-08de687fafdc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SUZ5R1VPRDBnZ3EyMld3QzdicDNaNDhlM2s2eFN5dTRjN25uNDZIUzhkTmZO?=
 =?utf-8?B?OXpWTVJDTDRtdmhocFpXWFQrZHh5dE1QYjZPOW9GVjFDZDd2MnB4YnFNODFR?=
 =?utf-8?B?eExmM0t2NGNIU3ZWREJ0TXN4WGhVbWZ0eS8yem1aZWVnelh5VXJveWRlUlA1?=
 =?utf-8?B?WFE3M0pPdmNoaDVXTjBIWE5IMFVpaHVuRE1UZHpBQ3ZpdVRVV0JjS2ZSQ2hr?=
 =?utf-8?B?SEY3OW50eFNsRkI4WnJXL2NYTXVUWG0wK3JnVFlpNytKb1ZJK3NmUTV2azdx?=
 =?utf-8?B?ek9XZzVXNFlQN2k3eGtTY3hZSlk5L1lvaFlzN2huNERhSW05Zi9rYnI0V3R4?=
 =?utf-8?B?UlJWRWhjWlRTWWl6dFIvT3VNWVpHcDJ3RFR2ZnRCK25FUXc0dTVYRFp4L2xX?=
 =?utf-8?B?ZktoazJ2L0QrdDNtYVA3Y29CSnVBei9QUWJjeThMZFlmMm5ldDB3RG5nekZ3?=
 =?utf-8?B?V09wMEtKb3FFbjFyUUFpWHJrMURXZG56THlQZitDQkFqaFZTQStPZnJZUEpO?=
 =?utf-8?B?YytHemhLY0tJZW5sZUdaeG5wbG1qMDA0bjgyZFR6OTQ2NjhpSE9DUVJvMWlP?=
 =?utf-8?B?Y0ltNmo0WTY2NVZhL3Z4R2VGRFg5b3JxVHI4SkJNVlVIK0RaUVd3c2VITVhx?=
 =?utf-8?B?bmEwU2lyYjJlMHRjNlNpYnVxNGszU0c1ZXJOVUVMVHIycytIQ3FoREdiUDYr?=
 =?utf-8?B?d2UxeGdCYVFETC9OOWp5ZFZjZUdsWW5oVjFhL0JRRzBQSzYvc055OElsUDFn?=
 =?utf-8?B?L09hSDljSklxNFFQTTRiMDAva0RFcmxHSUx3WlFzQnpmVXl0TmtkVC80WS8z?=
 =?utf-8?B?RDVKem9qRXlRUUJVSW12Ui9DektyelNHdXE4eFJKeWpkbmgxUXE3dzNuRXhz?=
 =?utf-8?B?NzZKaGl3WTh5eXJWZTZOTHdXY1MyOGUvcEprdldHc1B6N0NtSmYveVVXaHo1?=
 =?utf-8?B?SlZQOVB0bjd4RkFaRldHZGQ2YmJReGJWNjRTVU1vMTJXUkZNS0JQOEh4K1Rz?=
 =?utf-8?B?amE5bTFLaUVEQlVrRHh3Y1RIay9DOHZZRDZRckR2OHJ0czB3SjFRNlZIdldR?=
 =?utf-8?B?SW9hbWt5S256VFhzUlZtdGxlb3VQc010L1lVOUJ5NWF1ZWhLaUh1UzlTVXpU?=
 =?utf-8?B?d0lCeHJQMW1sNXUwUmpzSjRKd3VIejY5N2FtcnBxQnUvNnZmREQ0MTNQK3lT?=
 =?utf-8?B?Yk1Td3k5QmxvL0IyMXN0ckQwNFc4bXdPMzVBeUlPNjRDbjdXb0xaTzFpVzYy?=
 =?utf-8?B?RE9wN0sxZFlEdnlMQjFIdElqRVI4TmowcTFMZ3FUSkRnZEY1QnpVNnVIdXlD?=
 =?utf-8?B?UXJwTkdOWC9aMjE0eVV0d1UrcXltSlJnWG5aUC9wOGdHNGYrSGhTRTdaUm8y?=
 =?utf-8?B?M1Y2c2tHS0QzOC9HN3lMeTMwQ1UwS09GYkhqdnU0eXlrM1VzaWx4RVpFMEEy?=
 =?utf-8?B?K1A3NGUyL3lTdXVmYys5UWxMdlVCVENxTmVYMkxLQVlMMHJzSlRYdXB2dXZK?=
 =?utf-8?B?SnlwMXhLZUdJSjlxWjVLNXdXaC90clBzQXJzTUZLczM2cVZqSUZrbjRqeXNR?=
 =?utf-8?B?MUdtTDNnU2E5OXVWNnFqeEFMYm1JcURlbXpsaFQ5K056aHJ4anEvK3h0cURr?=
 =?utf-8?B?NW0xVW4xSmY4OHY3MmFlRVZVaDV5dFdmdmcxZlhreHIybmlwS1dPVklpellh?=
 =?utf-8?B?SU5qUDZlUUFmcE1YaXVUa3FnYlYwQVFwVEpqb2lkOFF2UlV6dlUzTEltVW1G?=
 =?utf-8?B?VDJzOXlDTkxQREpaNmlpdW5vUFIwWnhYczJvSjhvOThDUVBORi8xdGFzWlNt?=
 =?utf-8?B?czFVNEMzZngrUHppWW5HY3EwdWdSTldpODBZc01hUXpkQnR2SUI1SlhoKzJO?=
 =?utf-8?B?Vlhid3Y0bkpjOWZZOHpPR2l6Mnoza3FxQ1Q5a1hjTkp5UnJvak9iR25ydXVz?=
 =?utf-8?B?K1NCcHVVdFliWlNPMG44bk5kTzBKY0JSZHhtSFhBMTVONFh0OFd1SVZpWGU0?=
 =?utf-8?B?blNCS3dpSXlKTnBDR1dLczM4VHZzd3pqZllEYlV1clVta2NYZFJqWWZhR1dJ?=
 =?utf-8?B?Y3RPSUlHUForN2loeUx2THB1dlR2Vi9RbWJMZ0lyb01mZHRyNEtiNEliL1lL?=
 =?utf-8?Q?r2+o=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB7198.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OThmNTZOR1I1N0k0dmkwSXJBaFB6S3hDNGhibEpJSk9WZWUrWFBnbEU1bkQw?=
 =?utf-8?B?d29BWFM1T0txdU02R2ZOdlZHSU9TYjVBNXl5SkZNMWt4amRBRjM4RFlmajVx?=
 =?utf-8?B?NmpYa2svUjRsM3BwQ3hZcEkzZ2huK29LU2dsVW1LQW13QXAraXhNYjBJalFl?=
 =?utf-8?B?a2gzV3RoQUs2SWRWUThiVFhnVW1NS0tzcEVjUDZjVVBJd1VodWFpNnZMUE0r?=
 =?utf-8?B?ZmdydUNTWkluQ0JxUTZ1WWlsbktGcDRLMU9ZVDg2U3NBMFpjYjFreVY0Z2hh?=
 =?utf-8?B?cUJWR1lvUkx1OWtmTmc0bk1vbS91cDdXaWVtbjB0L0lBL0pkblNUeE1yc3Nr?=
 =?utf-8?B?MEdxb2k5K20raXpQY1VTVXorWFNQa0J3MHVJUWJIOFNuK1VyVEJQRVYwazI4?=
 =?utf-8?B?bml6TE13NktSYUYrRmRJTEVRSVJlSHpSdEtSQXVObERFV1BLVEpIalJ3dnE3?=
 =?utf-8?B?SUdYRDdOcXV0aklYNHlUWGVJZW0vNDR5cGhOZjE2eVp4Z2Q2d3pGQUpkUmk3?=
 =?utf-8?B?eHZNMHVmaFNlalB6TTlPdkJRbEdFemo1SkUzY0dwbjhoK0FzWU1nb0IwTWdM?=
 =?utf-8?B?YkJuQ0lsUk9yY0N0bEE4djB4Y2F4d2FndnUwbE1nbWpMbEtUN0xiZFNUUWRo?=
 =?utf-8?B?TDBOOVhuN3NhaXF3WENvS04yUHNoRlZKWXl6MDlySGlFWTVLMFdzeGpSN3BK?=
 =?utf-8?B?ODFtNmF4ck8zTFl1VjhaclN2Zi9YRHRNQmhXZmtmaE5mQnBEcmpkTmpCNzFR?=
 =?utf-8?B?OG1GdlROL3Z1RVk3YkNUYkpSemh0OS9lR0oxM2tFZ05XV3dxVTZVT0ZLQitR?=
 =?utf-8?B?U1BuemxsekFoalRVQlJrWTlzOUVqOTN6aWxzZzdpVlA1dWIyWmwwUzZta2NG?=
 =?utf-8?B?d1J0TnZMb3dvS1I5Nml5dndQcUlUdUNLQ3dIN2wydncxbk1GUWN2YUUxVFBR?=
 =?utf-8?B?VTU4UG9tVWJZZTFDQ1prMXVxTXdrb0JmSWUvOW9BU2FjQVF6cnh1L1BPa0gv?=
 =?utf-8?B?YnlVTHh0a1NzMCtnRHRhS0xrQk1rc3AwaFovOCtCU0l5U2ZWU0VEdFhqbHVq?=
 =?utf-8?B?ejZ4K1FtNGZiUUNIWDBYSVdKSEN4USszYWUxQmtQSVNxUFYwUEJJVytscCtz?=
 =?utf-8?B?aUpISmVsa2NmSDBEVkY0RlJ3OGhRckVqelpJS1pubE1tSVNSTTR0Uk9pSGhG?=
 =?utf-8?B?NGVqUDBrZGkxOGo3bW1ZSktLVlo3VFNnVVh4aVlFL3FLMk43dGhhQ1lBaWdB?=
 =?utf-8?B?dTNNbFFwd2tucjJCVW9yQXkvYVIzMjV6WDFWZlNCZ0NEalhaVm1FcFdzZmNp?=
 =?utf-8?B?dWZrbnh3VlNndEVTSFpxMnBkNnE1ZCtkVWlKRGZ0L0YrNXM4SFFURmg4ZDd5?=
 =?utf-8?B?T0gzanpxcXBuRkdCNnhPUkNTTi8ySExMeHU2dkVLRmRaN2JWN2w4b1p4NjYx?=
 =?utf-8?B?Q1BZUXNKVmhKOExPdU5zM1p0UGp6cWlka29GUkg1UElFdi9HY01MeFhoYWdI?=
 =?utf-8?B?T1p3andLQ2JYZ1loTVljajhKb2ZBT2hXUGw4VDV1a0RMY2JXbERTM3NkYzc1?=
 =?utf-8?B?dXJMcXNPTHpEdCtpN2xLcmlhRGhyd053OGJxQ0M1RVhpazQwY3c2SGN1TmF4?=
 =?utf-8?B?aFlONDMwN0hnK2RCZWpDaEtRTTl6YkVjaFI2VnpCT0dPOStmZTNGbTRIK1Ez?=
 =?utf-8?B?bTRnWW81N2VzaXRhNWZiNlNnOE1acEIzbG5tMmlDUFBGQnJXTzhWREJyMFQz?=
 =?utf-8?B?MzVZWTduaVdINlNyVk5RTVh1eXRhWlVWYnhIUDNzWUtMdVZoTHpOM3RYQ3la?=
 =?utf-8?B?ZGl5amZUNHhDbVRoRXdBSVp3SVNiR3NYSEVLRTlWd1RST3hwblY2NWlnL29y?=
 =?utf-8?B?d1ZCVkpSWXVQWGlnN0dNQjRwWjFNd3k3OVVFSVlqYk5yTVhIR2F5clY3dXVJ?=
 =?utf-8?B?d3JObUc4dGJaRXdqTit6TUJaYU1XL1BmSnNlZkNZQ214c1RJQUJId3o0UXN1?=
 =?utf-8?B?dzVEVGNTUEx1N2hXTzBDbURXQys5eW5FRFdTKytMZnpCR2RoQkQrTkh0Y1BT?=
 =?utf-8?B?YkRMSG02S0g4Z0Y1QmdTcmROdEhqNXkwZlg2VmU2VklEWnAwNWFPUkk0S3lD?=
 =?utf-8?B?S1pVUnRiQWcvR3gwcFFibXV1L1JPaXZlR2dxM0RHZTZITE9FQng5cy84Sml5?=
 =?utf-8?B?OXFNUHU3a25OZ3p5WVdKZzJ1TE5iZDhCZURVVy9abTVPTnZOSVBpb0RvazZE?=
 =?utf-8?B?ZExBZEpyZXJwT1JNZEFrTGtGdGNRQ0g4ZVlDNWc0bW1kM0JEejROOFVhNC85?=
 =?utf-8?B?a2pjRmU5amdHR1lKWlJvbU1XUllmSHRoZEVqNlBxeTRPVVZhWXBQZz09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a061b23-cf17-4b71-500c-08de687fafdc
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7198.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2026 08:37:55.5764
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gh2VQfyqdYIjS+yobnu63wcA+KJJuPOy63b1R/uFCtxNh4SPukHuCiYC0KnMnckyStM/vqrXjKrgoSGhER8Bsg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8705
X-OriginatorOrg: intel.com
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-92434-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:mid,intel.com:dkim,intel.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[adrian.hunter@intel.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: C74141184BB
X-Rspamd-Action: no action

On 10/02/2026 08:56, Manivannan Sadhasivam via B4 Relay wrote:
> From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> 
> Now since the devm_of_qcom_ice_get() API never returns NULL, remove the
> NULL check and also simplify the error handling.
> 
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

Acked-by: Adrian Hunter <adrian.hunter@intel.com>

> ---
>  drivers/mmc/host/sdhci-msm.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
> index 3b85233131b3..8d862079cf17 100644
> --- a/drivers/mmc/host/sdhci-msm.c
> +++ b/drivers/mmc/host/sdhci-msm.c
> @@ -1906,14 +1906,14 @@ static int sdhci_msm_ice_init(struct sdhci_msm_host *msm_host,
>  		return 0;
>  
>  	ice = devm_of_qcom_ice_get(dev);
> -	if (ice == ERR_PTR(-EOPNOTSUPP)) {
> +	if (IS_ERR(ice)) {
> +		if (ice != ERR_PTR(-EOPNOTSUPP))
> +			return PTR_ERR(ice);
> +
>  		dev_warn(dev, "Disabling inline encryption support\n");
> -		ice = NULL;
> +		return 0;
>  	}
>  
> -	if (IS_ERR_OR_NULL(ice))
> -		return PTR_ERR_OR_ZERO(ice);
> -
>  	if (qcom_ice_get_supported_key_type(ice) != BLK_CRYPTO_KEY_TYPE_RAW) {
>  		dev_warn(dev, "Wrapped keys not supported. Disabling inline encryption support.\n");
>  		return 0;
> 


