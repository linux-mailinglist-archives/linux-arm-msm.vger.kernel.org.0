Return-Path: <linux-arm-msm+bounces-89697-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B4FC3D3ADF3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jan 2026 16:01:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 83431301EFCF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jan 2026 15:00:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C6D0387349;
	Mon, 19 Jan 2026 15:00:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ebRPsQ40"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2FD336D510;
	Mon, 19 Jan 2026 15:00:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768834842; cv=fail; b=DNMGKWaP2iajoK6S7rMfnBGOqswd/8iz1UpwdJV845e2EoGPpE1dlpxLA1+ReUAH8b+1H0C25nJ5fW8uExdjW70UUAYcrhTWs/e+s8TRm+JVypczsAaFMOXoI2d7Fgv1BrHr9Xe8G2eK1AABBgFLV0SgynvDJsmTQlWhjxpvClo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768834842; c=relaxed/simple;
	bh=CfAdtAURbV+myfvIB7lmkoDczvp/p8+67vww/YOLyXk=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=dza+162VrPYA0KH6z4YV7ZIcEkopt0XLTrkN3vRotXMFkOB/WKAtMj95GKqROj2IMo/rdNWl4YREBFKKiWfUcK2WPmHrEPRbfOtE2MPnqSK4c//ZzrC55Hf6QjFG5DSnSJNUd0nScNn5pFDSPpA80TDRHFzYjSaoAUyvgk8OdNY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ebRPsQ40; arc=fail smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768834840; x=1800370840;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=CfAdtAURbV+myfvIB7lmkoDczvp/p8+67vww/YOLyXk=;
  b=ebRPsQ404jbaHtOGBXYdHVDUEO8hY+mUTsF9vOJ5LqkFeaZbL081q7mW
   gd766CCLryRGBQRGMgNlf4YsJmdcWuwlsYKSXhWq5D/MCLm4Csoj7hpXZ
   WRkXK5u0xd0aCDUF+j7vOsUVDS3WFabAXSosHSe4hQfVqIHXkZQgb0u5B
   fZ8WKLPSoU3HBmwNZFIqk8Cdf70GSkucwDtkj6u1Ue+eEvBPsXa11Ae0T
   DOOSucCuHSAMnIZdgFBFQsdDpJ8KSFn/TIdyFj/jLe4MkHn1b9yDemBtV
   m8R1tdAxhvvXDHx14npjLSP7LN8tM8OyTeQfcSX4mb0ypDKBtg36O5Tc7
   A==;
X-CSE-ConnectionGUID: A9ACi7wORzGDHnewdyM/tA==
X-CSE-MsgGUID: eV4bNjADSC2LV/rsWajbBg==
X-IronPort-AV: E=McAfee;i="6800,10657,11676"; a="69944004"
X-IronPort-AV: E=Sophos;i="6.21,238,1763452800"; 
   d="scan'208";a="69944004"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2026 07:00:36 -0800
X-CSE-ConnectionGUID: IljnBIxSTXiSLijtErsWhw==
X-CSE-MsgGUID: rvl1IzrETzyTXxwUlZBzCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,238,1763452800"; 
   d="scan'208";a="206317972"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2026 07:00:35 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 19 Jan 2026 07:00:34 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Mon, 19 Jan 2026 07:00:34 -0800
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.8) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 19 Jan 2026 07:00:34 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tZLe5O5KtaK713AsJ3hIBR/qaTvIvSA31k1839wezVKXTrMAs1uaVDWyCsuGxdNFZduWjn5k1uf/e0HO/kis7eadQvPvlXktd8kLLJVXkZ/YvVUi09fCrnHJYAi01LqL7HDktnp6xjfPEECH8k0diSYawwgzFLRGc+lwLs2SCFORRTvZkv4IdvgwWS5LpNCuFNMByvPq4uYjVTlQVPowf5WEcQStpcxaRrq8yaiVpodDB65e8quoX0gM5YvOXEIuYZ3ur3SAOU3JlpDc4h5mCe0/bmCD/L0Tqbw9Q3DLPw4OkCPGJhhzGEKExJJB3G6LPGlrcWjVaqH18IkA82WgKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=91Yu5kHq9JJQurMApUZapi7MXxBL7d5q7CIYzgroH38=;
 b=aHzOSPDM+f7DzIYBI2Pygt5GGPPKPU5YIa+VmDa2SCz40EbGi83iL+2NhRo/4zQpKBHu3Ucm686AhG/sacHYdkxFWlq6NZ/v4XKYx9RsEPGd+rScq8iOdxpsJaODTKwjOOy/t2vqOc/XmX+5uKgVcoeT3WIHANQnO5dXwH2nvTQ2/Y8U6fs24vXialt2iPsvaEVUu4k8Oy4htOsemyFWMFAZJAlmCRhc9BqHW4cg6+zXwDoN4crR3BuxFUKW5bd9y/O+cZzWDKKmAY+2xthlX1GabRsOWmNHduH0I1N5c7C6EyWl14jCIa0d8dht+IILzDRXBcGHyp8l1YlOD4nzbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7198.namprd11.prod.outlook.com (2603:10b6:208:419::15)
 by DS7PR11MB7690.namprd11.prod.outlook.com (2603:10b6:8:e6::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Mon, 19 Jan
 2026 15:00:31 +0000
Received: from IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::2c4e:e92a:4fa:a456]) by IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::2c4e:e92a:4fa:a456%6]) with mapi id 15.20.9520.011; Mon, 19 Jan 2026
 15:00:31 +0000
Message-ID: <76ae6bb1-6f8b-45fd-ba52-9ee104f14f9e@intel.com>
Date: Mon, 19 Jan 2026 17:00:25 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] mmc: Avoid reprogram all keys to Inline Crypto Engine
 for MMC runtime suspend resume
To: Neeraj Soni <neeraj.soni@oss.qualcomm.com>, <ebiggers@kernel.org>,
	<ulf.hansson@linaro.org>
CC: <quic_dmukhopa@quicinc.com>, <quic_rampraka@quicinc.com>,
	<quic_nitirawa@quicinc.com>, <quic_sachgupt@quicinc.com>,
	<quic_bhaskarv@quicinc.com>, <quic_gaurkash@quicinc.com>,
	<quic_sartgarg@quicinc.com>, <linux-mmc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>
References: <20260116121004.1829223-1-neeraj.soni@oss.qualcomm.com>
Content-Language: en-US
From: Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park,
 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 -
 4, Domiciled in Helsinki
In-Reply-To: <20260116121004.1829223-1-neeraj.soni@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DU2PR04CA0209.eurprd04.prod.outlook.com
 (2603:10a6:10:28d::34) To IA1PR11MB7198.namprd11.prod.outlook.com
 (2603:10b6:208:419::15)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7198:EE_|DS7PR11MB7690:EE_
X-MS-Office365-Filtering-Correlation-Id: 37813afc-8e1c-45bd-5b01-08de576b7d6c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?b3EyTUlVMy81SmQrTkJlVWV2WlNVSDFCL3BQUHF2aElCbVlvdWdZUUNKU2dj?=
 =?utf-8?B?cXA1Y0xWNkk4RjlxSmxKR3psUE0rdkZwTG9SWitWUHFZRGlMZ0psSEFiUXU4?=
 =?utf-8?B?UVlXODRkN0hLN2Z0Szh1ZmNyVXNtTkRtWkdIL200eE50a2tNekJ0UHpiWkVN?=
 =?utf-8?B?Ry8yczRYb3NFMHRLT3NVU0xRU3NWZVVpWGRzWm0yWDRtN2VaNmFCV050eFh6?=
 =?utf-8?B?MWJwd0V1Zlo0THl5NFBBZ01YUnRFSzBCQ213MXFtZWtIREVvZGF1Y2dpUnVp?=
 =?utf-8?B?SEtJWHZLdzVYbkhmTU9oNnR2SGNDSFNhMWpVakdpVmhNTGFVTy84NDZOaFBx?=
 =?utf-8?B?aVN1d0M4MXJBVDFGRlBBZ05NdFBGdmtlNHF5MkhURTdFMEN1UTBQTWIwWlFK?=
 =?utf-8?B?dnJ0Ym0wOVVTNWV5ZEkwVHJJZXc1S0ZhVE5LTUFpdFIrOHVseXBLUHlOTkNY?=
 =?utf-8?B?OXU2U3IvMGMxbE13alpwSWZreHlqQk9YL0FBSEV1YnJCa2dGS3V3TVI0TnRY?=
 =?utf-8?B?ZnEvY2hZcVIvb0RSL2FtZm1JL2dGVHlkdkhqV3NrbFdEbm1uVGVOVUZ3S0dQ?=
 =?utf-8?B?OUQvd093akRCWGNBdklyYmxZMXduR1NDcm5wWEdMRW9la3VZZkxQdzdlRlVu?=
 =?utf-8?B?YlZGVVFsS3d3VzAxQ1UyMDd1T3JVLzRCL1BKVG90UFg2eFdWUXF6Y2VYT2dB?=
 =?utf-8?B?T1lYd2xsaFhGdStYVDMyNnV3ZjhuNEZUd2hWbXk1aERLZjF4b1ZSVTV2eWhE?=
 =?utf-8?B?Rm1XSHJOK3hSN2Q2aXJzeEs4cVBOUmZnMk9vVnZJRnFRSkZ2c2hwd3RqSnRX?=
 =?utf-8?B?YzBtaFUyOXlZc2F2SVdVSGlMZS9HUitiaG1uKzlsNXNMUHpieDMzdXk5U1Yv?=
 =?utf-8?B?TDAwclNlRVkxSFlGL21zQUc3RXFCaU5OLzFMTnBoQ2ZoRkVGNHg1SVFCNlpW?=
 =?utf-8?B?YndwSTZnb1NMaXkxV3BLRDAxUUJmbWVaeUsyaVlKZ3FiWFZrRC9oVlVsLzRK?=
 =?utf-8?B?QkNTOVlvM20vMzNOS3YxYm9wUXd1NjdyVDA5ODYvQm1aS3RrRURSWjBpL0E5?=
 =?utf-8?B?YWJ6ODdVNWh2Q2Z2SVhuUWU5MG55MHhPa1doRzZ4WFU5QWxKb1c4UVl5dUkr?=
 =?utf-8?B?UWFZNDY4NmhUZy9kWWEycmsrL1V2cUpmKytzTldVbVRjc1VLcG9hYlZqM1ND?=
 =?utf-8?B?VzZrSFFhcVlDSk5VanBmQ0hiYjkxNWR1VDI0S2d4cTJVMXg0ZHBnbG5GZzdK?=
 =?utf-8?B?bUphZCswMTVOUlZtdlF3TXZSWjRDY0lsZENhTm5vZzgwZ1JiRnppSWFycXV2?=
 =?utf-8?B?aS9XR3lFUXg4TjRrTkdPTTREUjlGQ2lUOWdKb0RPYzY4dFVPejFudTlWMURn?=
 =?utf-8?B?SjBRVjQ0NCtWT3QrcjM5RUJoaWEyVUZJSGNNNEMrTVdsUnlycnN6Qm5mcFJh?=
 =?utf-8?B?eXBjbHdMc2lVTW14ZEFKUVVVY0pjbmtnL0hMalNiZDJnNWtqWXNmVTVZbHl4?=
 =?utf-8?B?MklPcE5sbVpRNEdOb3dISlRBYWtXZENySmlXT3cyTHVhRU5BUEU4Z2I4WS8x?=
 =?utf-8?B?T1E5ZVkrQzgxZ1ZGbTBLcHJlMzA0M3pCd0YrMy9xZzcrb0Uwc1VqUmRBTHd1?=
 =?utf-8?B?VUVldEFYY1J4eFhqcFcrRVVuMkREQ2ZITDVRNUdPWU9PUk9aK1h3SVYyckVL?=
 =?utf-8?B?ei9FMWlSSnFiSDV1ZGxTYWpWOVFYNEJRY25sVFd6Zm1ralFKR01yeTZtMTEz?=
 =?utf-8?B?ZVZPQ0o4RUdoTWRtM0l2bVFlTTJJVU9kaDZSRHExOUtRZVJnSGRMWjRSRUZE?=
 =?utf-8?B?QWNPZEtWeGZkT3pzK1MvNkV3WkE4V2M0azBqRlVpbElNNXdjNHh6M1lYUjdU?=
 =?utf-8?B?QXRsY0FMaW1MSEtQWTh0VUdmTkJOK2VHVWpDUXlmVjJBWDVjS3lqL3RvYkNN?=
 =?utf-8?B?Q21Yd284RlhvZ2ZWODhndGk2dE9zY3o2SkFvWlhwMTkxeFZUdFo3RFhsWjJu?=
 =?utf-8?B?WFZQQjk5UU4yTmI3bUxOa1JRM25sNGFMYWtLaVRHMUhoZ1lZVlBjb3VFeC9I?=
 =?utf-8?Q?jWKcld?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB7198.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(366016)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?clUwSm0rR3NvM1p2SHd6RGhYeFRYR3dmM0tGZXhwTUhHeUVyRDRwSGsvckln?=
 =?utf-8?B?aEFUZDBSYVE3eXR2eWlzWWVVbU5mWnZqUEtHRnJvRXNhbDczSVlCMjQ1ZEpE?=
 =?utf-8?B?c1lNcGo3cHQ1eXh4TUt3My9FTGtqOTBwOE1BSkw2TWpjVGk0RnFjWCtJNGZv?=
 =?utf-8?B?ZU9SbDZnYWExZGwrWUl3VmdTV2p0ejBOVTVLOHJJLy9lYWpIL0dDT0t2NVBV?=
 =?utf-8?B?bHZyZjUzL2dqMXVvZjVVZXRuSC82S1JHZHQ3b0hDYkVwU2pjemFqam93WDVn?=
 =?utf-8?B?TWhlVkFDQ01zS00ybGJGSDVINjZTdjM1aWpSY3FDQnB1c0UzZS8zeXh3VnNr?=
 =?utf-8?B?bmlZQnZ1N3Fmd2h2ODZzdkUwQUJKK0ZXdk5CWFp2L1NKLzZaUUVnUWZ0K1I4?=
 =?utf-8?B?N1FkYU1wUVVlRVhoRlIxUGd5OWVVT1grcERMakE5dHJqdEMrTC9JcFBWK2pl?=
 =?utf-8?B?TXpFZVlXRTllVWZabWRaY1dkWXlwNHJzZHgwTGhkOENGa212Q3dMUlZHdEsr?=
 =?utf-8?B?T1EyT2lHVFEvNWc5RXRnT2lkYXhiS2grWUNqdllHczFXNytNOWh1b09MRmdv?=
 =?utf-8?B?TWJIbW9SQm02NTNtMFJLWFgvWWNYNVlYQllQWTc0cWNVbnE0WWRadWk0a05T?=
 =?utf-8?B?aGxsdGNjcUYwM3hRd09QZ2RXSHlOdU0vMUU3ZlJnRVNXNFdEcGFCRXY5eHlJ?=
 =?utf-8?B?bXJoRXVQRUU4azR3ZnNvTWtxRElsb2VIM0x0L3BtNGlMMHc3RVRMYXp1Vm9N?=
 =?utf-8?B?ZHJXNzBCRzZVWFlNRkdWY3FTS05rSzUzNERBSHcvdEJzc0ExYmF4dzJza3FG?=
 =?utf-8?B?ZHNXZVowa1JBekszaG9HbFlXRTdhUVVPUTdZOGlTeWRaNG9DZGJpODhSeDBp?=
 =?utf-8?B?VFM0ODVWcjhWNGhoSUY1MDI1ZHhXWUVtTGRnbk1TNC9oMk82WTN2SHJqRnc5?=
 =?utf-8?B?aDBKZnhxL3J3ZDVySjB2V1NYTFJ2T3VCeFFPcnk1S3FHVmpKS21ZcldkZm9o?=
 =?utf-8?B?OTNQVWF5R3hpWXFMeE9sQkV0OUY1aDMrY0JlUVZYY1c0ekFLRVZoMnpkZUNm?=
 =?utf-8?B?TUUzaGpvTTRwMnhxU1NpRnVueDNDelZudDFhaWUvaGdnS1pxNGU4KzkyVFBk?=
 =?utf-8?B?ZmMyMUJnbmt6aFlaN3JxRmgzdVEvandpSG5yTkloM21Ud0F3cEJCVDFzZWNv?=
 =?utf-8?B?Ylk5SzJ5SHBFY0FIQkhnZ1dMWVZ5UEFXK1Q5aUlDZjkrSXdtUmk1RWNaV0wz?=
 =?utf-8?B?aWRLUHp5K3RrNVlGNDBNQ2VTVjhuRis5T2c0QkhNTXF4VHZZS2R2U21QK1NP?=
 =?utf-8?B?MDdPTEdjUmJMS3Rua3NJSHBVdFpOblJMSjNYN0FVdGNqMm5WOFVMUlIrY1A5?=
 =?utf-8?B?Y3JMNWV0UDg0QzZWSTFpM2hPT3ozN0YrT3dZb1BZQUhkblp0RGN5N3pzN3JE?=
 =?utf-8?B?OFBrTlY5OFluRm9RcE1ZTjJRUEhTeGFKL1NMU0hmSnZiMDgxY0J0bWZNd3Rz?=
 =?utf-8?B?NjNnVmtyaUs5K3RueGtEbnNwM0lSNUpLVW1ucDBNVnRBZ3R1M1hHanNQMW5T?=
 =?utf-8?B?eDBrMnhOYWJUN1JGRVg0dWpKMDNkZGZFL2FrL0E3c3IycDhNQVBhWVJIUS9K?=
 =?utf-8?B?ZmlRNURIT0VZQ2FROE1PYjU2UVlGUUR1QWVBWHd1Nk8yVzlkRU1iQmJobmJj?=
 =?utf-8?B?RkVtRTFUU3NGUmwrbkM0dU9aVHBpaTB4VWxXZXFBQ0xreUV0SG52cmtSLzdr?=
 =?utf-8?B?Q1AwdGhjVm1tdTZEQXp3d3VoeUtlaHU0NUpqdExzaTM5azY3SkRaQmNYUjhu?=
 =?utf-8?B?NllRSkRUcGUvbi94Tml1bTAyTVVjY1dzV1BxVXdYa1JGS09RTm1Vejg2dGMx?=
 =?utf-8?B?ZXBUcDNpazJ1UnBZaEtIczQxbVRvanBQeEppd0xyT3JVN2poRk1uLzZFVUhU?=
 =?utf-8?B?YUl1MnloVEI4R2k2bm1aRzU3L3JFRDNUQ1NyYk1GYVVSWGFPb2pYWi9zZFp6?=
 =?utf-8?B?M3VGWW5VZnFNakhuelZEODYvbzYrUWppakhPazk1enNMYm8zMnRhRUxmZWJr?=
 =?utf-8?B?N0htUUpjaXlUR090UjNrRnpjRzNuYjcwQjJqSmYrSnFkcmJBdWR6OHkwSzFW?=
 =?utf-8?B?REFKWHRUakExNjZyK1M3TWI1WG5FdDRhaEc2MjNld1RTTTVGRHRMT09hM2x2?=
 =?utf-8?B?cnozSFV5c0REcVBTckIwdWtWTmxYaEEzTysyMEhmTnk1RHBISTdBRGFmN1I4?=
 =?utf-8?B?MXFLd0pNUEdwSGpBTmFSQW5pUG1jL3lyWUxVYU5mMDJVT2YvTUlEbDFzU09S?=
 =?utf-8?B?OE01ZE13ZU4vS3ZTb3kycys4TFFEZzF4bGJIM0x6RmI0VXVaTnY3QT09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 37813afc-8e1c-45bd-5b01-08de576b7d6c
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7198.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2026 15:00:31.4225
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VyRbu4YxDT4TOK8iK59ktg2wdj6G8XfZu8wVEpUdXbs4/mQzgpaI88vPy7p7kg5CF8Di9VW9bVVLXxS4SK52vg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7690
X-OriginatorOrg: intel.com

On 16/01/2026 14:10, Neeraj Soni wrote:
> From: Debraj Mukhopadhyay <quic_dmukhopa@quicinc.com>
> 
> Crypto reprogram all keys is called for each MMC runtime
> suspend/resume in current upstream design. If this is implemented
> as a non-interruptible call to TEE for security, the cpu core is
> blocked for execution while this call executes although the crypto
> engine already has the keys. For example, glitches in audio/video
> streaming applications have been observed due to this. Add the flag
> MMC_CAP2_CRYPTO_NO_REPROG as part of host->caps2 to control reprogramming
> keys to crypto engine for socs which dont require this feature.
> 
> Signed-off-by: Seshu Madhavi Puppala <quic_spuppala@quicinc.com>
> Co-developed-by: Ram Prakash Gupta <quic_rampraka@quicinc.com>
> Signed-off-by: Ram Prakash Gupta <quic_rampraka@quicinc.com>
> Co-developed-by: Sarthak Garg <quic_sartgarg@quicinc.com>
> Signed-off-by: Sarthak Garg <quic_sartgarg@quicinc.com>
> Signed-off-by: Debraj Mukhopadhyay <quic_dmukhopa@quicinc.com>
> Signed-off-by: Neeraj Soni <neeraj.soni@oss.qualcomm.com>
> 

Would be nicer if mmc_crypto_set_initial_state() would be exposed
to host drivers, so it could be called instead of:

#ifdef CONFIG_MMC_CRYPTO
	if (host->mmc->caps2 & MMC_CAP2_CRYPTO)
		blk_crypto_reprogram_all_keys(&host->mmc->crypto_profile);
#endif

Perhaps that could be tidied up later.

So, nevertheless:

Acked-by: Adrian Hunter <adrian.hunter@intel.com>

> ---
> Changes in v4:
> - Removed the "CONFIG_MMC_CRYPTO" encapsulation for "MMC_CAP2_CRYPTO" and
>   "MMC_CAP2_CRYPTO_NO_REPROG".
> 
> Changes in v3:
> - Renamed MMC_CAP2_DONT_REPROGRAM to MMC_CAP2_CRYPTO_NO_REPROG
>   in the commit message for clarity.
> - Added parentheses around the condition: (host->caps2 & MMC_CAP2_CRYPTO)
>   to improve readability and correctness.
> - Updated the comment associated with MMC_CAP2_CRYPTO_NO_REPROG
>   to better reflect its purpose.
> 
> Changes in v2:
> - Renamed MMC_CAP2_DONT_REPROGRAM to MMC_CAP2_CRYPTO_NO_REPROG for
>   improved clarity.
> - Defined MMC_CAP2_CRYPTO_NO_REPROG for MMC targets that do not support
>   a Crypto Engine.
> - Restricted the usage of struct crypto_profile to MMC devices that
>   support a Crypto Engine.
> 
> Changes in v1:
> - Addressed the comments from:
>   https://lore.kernel.org/lkml/20241006135530.17363-3-
>   quic_spuppala@quicinc.com/T/#m69c9ab538bd9efd54515646952d0d7d1d7c17690
> - Avoided reprogram of keys for Qualcomm SOCs only.
> - Ensured reprogram of all keys on host controller reset.
> ---
>  drivers/mmc/core/crypto.c    | 2 +-
>  drivers/mmc/host/sdhci-msm.c | 6 ++++++
>  include/linux/mmc/host.h     | 5 +----
>  3 files changed, 8 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/mmc/core/crypto.c b/drivers/mmc/core/crypto.c
> index fec4fbf16a5b..a5a90bfc634e 100644
> --- a/drivers/mmc/core/crypto.c
> +++ b/drivers/mmc/core/crypto.c
> @@ -15,7 +15,7 @@
>  void mmc_crypto_set_initial_state(struct mmc_host *host)
>  {
>  	/* Reset might clear all keys, so reprogram all the keys. */
> -	if (host->caps2 & MMC_CAP2_CRYPTO)
> +	if ((host->caps2 & MMC_CAP2_CRYPTO) && !(host->caps2 & MMC_CAP2_CRYPTO_NO_REPROG))
>  		blk_crypto_reprogram_all_keys(&host->crypto_profile);
>  }
>  
> diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
> index 4e5edbf2fc9b..2ccb63dde9c1 100644
> --- a/drivers/mmc/host/sdhci-msm.c
> +++ b/drivers/mmc/host/sdhci-msm.c
> @@ -1949,6 +1949,7 @@ static int sdhci_msm_ice_init(struct sdhci_msm_host *msm_host,
>  	}
>  
>  	mmc->caps2 |= MMC_CAP2_CRYPTO;
> +	mmc->caps2 |= MMC_CAP2_CRYPTO_NO_REPROG;
>  	return 0;
>  }
>  
> @@ -2526,6 +2527,11 @@ static int sdhci_msm_gcc_reset(struct device *dev, struct sdhci_host *host)
>  	usleep_range(200, 210);
>  	reset_control_put(reset);
>  
> +#ifdef CONFIG_MMC_CRYPTO
> +	if (host->mmc->caps2 & MMC_CAP2_CRYPTO)
> +		blk_crypto_reprogram_all_keys(&host->mmc->crypto_profile);
> +#endif
> +
>  	return ret;
>  }
>  
> diff --git a/include/linux/mmc/host.h b/include/linux/mmc/host.h
> index e0e2c265e5d1..2fd76f966e24 100644
> --- a/include/linux/mmc/host.h
> +++ b/include/linux/mmc/host.h
> @@ -457,12 +457,9 @@ struct mmc_host {
>  #define MMC_CAP2_CQE_DCMD	(1 << 24)	/* CQE can issue a direct command */
>  #define MMC_CAP2_AVOID_3_3V	(1 << 25)	/* Host must negotiate down from 3.3V */
>  #define MMC_CAP2_MERGE_CAPABLE	(1 << 26)	/* Host can merge a segment over the segment size */
> -#ifdef CONFIG_MMC_CRYPTO
>  #define MMC_CAP2_CRYPTO		(1 << 27)	/* Host supports inline encryption */
> -#else
> -#define MMC_CAP2_CRYPTO		0
> -#endif
>  #define MMC_CAP2_ALT_GPT_TEGRA	(1 << 28)	/* Host with eMMC that has GPT entry at a non-standard location */
> +#define MMC_CAP2_CRYPTO_NO_REPROG (1 << 29)	/* Host handles inline crypto key reprogramming */
>  
>  	bool			uhs2_sd_tran;	/* UHS-II flag for SD_TRAN state */
>  	bool			uhs2_app_cmd;	/* UHS-II flag for APP command */


