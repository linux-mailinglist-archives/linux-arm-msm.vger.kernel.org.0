Return-Path: <linux-arm-msm+bounces-76195-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id C6C4DBC1366
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Oct 2025 13:29:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 4D3F234E53B
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Oct 2025 11:29:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1417E2D9EC2;
	Tue,  7 Oct 2025 11:29:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q65Bja8o"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C96F934BA2C;
	Tue,  7 Oct 2025 11:29:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759836570; cv=fail; b=EPxw+NzsZ03OODfbm54DrGUI+s0jnlMR5bg9BMO/RT9vugCShQlDpuk3Jab3W7ZM/LZpxOFAiNSl/YqeHJincqATAJjWKabYiFZtsHIAQmqEVOS2hEaRrI0i2+dS8DvTQrflaNkEOyBscLRXp9LaAHnAGKAsJT2KXSrV9dlvfq4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759836570; c=relaxed/simple;
	bh=hJY8Jfi5dUsh73+HGnZmfW2J0N+b3MBwMkD/j6nIqbQ=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=AsZ3l1PnBoAoMEX4lCQsGARSeLaq3STZ7w36hpzYXqhcWMVLxHbqN+mrAuBQMVSJFeeHFUP0jH4X+eiQ9MpQPB31wNPcq8d+L9ZYLcBkhtP7JdxD43mUZuWLQ8g34lzdLm4FrVvkvMx8m0KOg/ULPS8M1qZY2DBPOm08t1YkZlo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q65Bja8o; arc=fail smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1759836568; x=1791372568;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=hJY8Jfi5dUsh73+HGnZmfW2J0N+b3MBwMkD/j6nIqbQ=;
  b=Q65Bja8oF87C33U+I48wwAWTiJRD1TSAi99tQ+CswIZlyxyODl2dyRaT
   Urty8FIOMsGaHBZxF5eITiTEBaw+7DdcqyfnB3iZKElSf8Vg9zF43Q7vp
   gWrzNoYNs3sW4D/1DAGA+Y759N/szE389VVlKhI85mXFAEQ3OuZk9rKFu
   GwfI4YVMBxucFFLLKA7eMC+io7vjWyD6/0csm8+ocZGtwNcOUxvmRixrS
   /Swt1YsvQAq1sn08MeFSFkNtuVzxA+lEEFaGJLwMkuVR7ogOqWXAlr7g7
   cNM8L2NXW9grD/K4R122Mtil+jb2mjf8zPni1YKhWYm47qW869/2PsYP3
   w==;
X-CSE-ConnectionGUID: HA5Ye6ziQlmiZgZzFQRB6A==
X-CSE-MsgGUID: heMxRTx3TNuNpwfKRmQMTQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11574"; a="61050710"
X-IronPort-AV: E=Sophos;i="6.18,321,1751266800"; 
   d="scan'208";a="61050710"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2025 04:29:25 -0700
X-CSE-ConnectionGUID: C7+uxbyWQky8tVlYiA1PDw==
X-CSE-MsgGUID: tGdRjZ3vSh+44asiyjDB9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,321,1751266800"; 
   d="scan'208";a="180054796"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2025 04:29:25 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 7 Oct 2025 04:29:24 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 7 Oct 2025 04:29:24 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.31) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 7 Oct 2025 04:29:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Mdi9+ezDdQ+yDuaOAST9D+1RpyaP9OzXZKi6ZqVEG4bMiZxVctZByi2ltI5EX6FBo/cbzYpQAAJZKDfpI8eTg7ObTYuptsNtlcNSkyUkWvDQkGhw777zqzF4wsfqUVou6Snvk0jQzZ1X2q7YBoTsydRzGUat/uBoSWyfGCd4snj/KA7sDdfugbxDne6DiMoRCPEafAMpxWWwQSzu6KXZrB9F8b+a4/+ECzrpIWwhjhMmk2OO91ymyGWDA4jNFUsTY/eYs8JSu6hjYHA1dILnhJmt50XcO/4hyLOx/5o7gCKQmbZBGinv2Hsx7lwOmcV7b2rZieVgkKayjc61dWYxUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cUwfyd5jY2cBHbLKjkphYmzXTG//nWmEa7vVKaKxUfE=;
 b=xC4edhhTFInEHjWjMiy0AXHVqCaMgu+x4EiVTd+yaVVRT1nGL3nEuTLuHv3LBfgzLbU/VvNn5whgajcb5I0Nf2uiyvZNr1jy8eBv3cqxtKxnn2zpCH4lfeQlgWO1Uhw8z81uL4d8WRwuEMuadTHslPWACGjSc0YcymIsUsvuwTNu6ycTJ2SeSQiSzYErBPSsP4JtUPMuX3ddRUChzpMKkBaTigrSiUY+6V0Ev2Foalt/QOGVrDkD56Gk2+mdlw9++EpcvTzvgilxHN3iCih4B4spUoWKaTH0Jl2r6UK/iHf4ODIlrRC/3x/7hrOhbcclGsOPdHRjr9zmEl/vfiLaqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7198.namprd11.prod.outlook.com (2603:10b6:208:419::15)
 by CYXPR11MB8662.namprd11.prod.outlook.com (2603:10b6:930:de::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.20; Tue, 7 Oct
 2025 11:29:18 +0000
Received: from IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::2c4e:e92a:4fa:a456]) by IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::2c4e:e92a:4fa:a456%3]) with mapi id 15.20.9182.017; Tue, 7 Oct 2025
 11:29:17 +0000
Message-ID: <4e53a9f4-8fef-406f-921d-0753c2351eb5@intel.com>
Date: Tue, 7 Oct 2025 14:29:12 +0300
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
 <59375a10-2a5b-45ed-9a4c-76884c0fe3c6@intel.com>
 <e1b61851-85e6-3897-196c-1f432e7e8432@quicinc.com>
Content-Language: en-US
From: Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park,
 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 -
 4, Domiciled in Helsinki
In-Reply-To: <e1b61851-85e6-3897-196c-1f432e7e8432@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DUZPR01CA0219.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b4::16) To IA1PR11MB7198.namprd11.prod.outlook.com
 (2603:10b6:208:419::15)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7198:EE_|CYXPR11MB8662:EE_
X-MS-Office365-Filtering-Correlation-Id: f8b13964-0199-4759-5de4-08de0594c063
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UXUxa0FVT2UvejZURy85K0RyOWRNbElCTEMzOHZPbG9rYVdLTlJOQzhGZndW?=
 =?utf-8?B?LzVPYmNqWkk3bm80K3htb1ZYQklOYW5VblNuZGlEZ1dPZG1ENmZYOTlWVU1w?=
 =?utf-8?B?T0J1aFJpb1N0bW0wdmRZcWNINFNLNXFUODZTTXhVaDhOWjZqUHNna045dUxT?=
 =?utf-8?B?YWZTcFZjc3pyS2JZSzlURmo5RklrTVMvOXZmbVpXWE9jeFJpOGlHemJCdEFz?=
 =?utf-8?B?ZFU4U1h5eEUyM2M1NzNoTkFHUlprNDFVR0UzSFNqZHZnNUhmWm93T3ZyWjd2?=
 =?utf-8?B?YnN3eWtSRTF5YnVoYXl5RFU0WWc4OGtlYk54TkpiT1NPU21rUVluajNuM2Fx?=
 =?utf-8?B?QjExanBMcnBvVjdXNHlNZnEva0Y0SFZOQkM5bjYwb0FDUFpQZ0RBOGVzenJ5?=
 =?utf-8?B?K1Z3UWhqWXBEWnM4SUVNQWZJVEk1VVBVMDJYLzA4emo0NTY3dVU3YjliWTdE?=
 =?utf-8?B?U01yb0ZJNTZYRmZGYTBwNHdjNkZ2V2VxNHRmdWdoeHFza1ZLSlRuVDZIRDBS?=
 =?utf-8?B?anRRNFozZTFaSjI4c2hXUDZDRUNKZExGNzVBR1V2dE4xSUdPMXZmZ2NUcExk?=
 =?utf-8?B?M1RDU3l6UVFFakxFUHRucGR1MDBGZDJ6ZEdGWFQ5Rkc4dHRzN3RORVBaZk90?=
 =?utf-8?B?QVg3ZXZVS2d2NVo4ZFhEZm9NUE5vOGRYYWVvWU04T0xzYXdyNVJLRGZHMFpZ?=
 =?utf-8?B?eUJEUGdOQ3NjcmtQK3NrZDhQVXUyL2VlczdzK3Z5NG1WVURsNlZ0ZEY4U1ZQ?=
 =?utf-8?B?Z1pqZi9ucGJqUERPTEFrQXFqWmNtUGtYMzk0emIwbzZIRjEzbmMxbXc4di9X?=
 =?utf-8?B?dDVJZFQ4R08vYzl1cThzOWNoWEpkcjc1S2hxZGltd29pNnNzWnVQazV4cmFV?=
 =?utf-8?B?V09HaFN5VEw2VG5hUWM3YkRDQS9CVjFTSk9qVlZadU5SNEVwdnZ0WTFpQ1NR?=
 =?utf-8?B?NEtPMXptRjVxNHVZYW5jYmdmVHZxK2VnOVRSOGN1SU5rYXdSRkU3eGR4bzd3?=
 =?utf-8?B?MFFUNmFYN1c2dCtaQkw0SWk1ejJrTnF4b2tWT09tTDYzSno5ZzlSU3dKdW42?=
 =?utf-8?B?R0ZRbE9FdG0ybXBiM3AzVFJGSk5rN2ZLSTlaRGZpS3p0emM0UENJd0Izdnho?=
 =?utf-8?B?dnIvbzBPS2U4WWkramcwKzFlVCs0OG9KZW9TSHBOMUNYSHVmSWg0cjQvNElZ?=
 =?utf-8?B?bTI3a0hRYjdOQjFKckhsR29RRFJsWWtOeTFFdkE4WlFKL3h3dGRkWEtwekZ4?=
 =?utf-8?B?cC9PZHhFdEZSNTZkc28wMkhzcm91d0lCTXB1RUUvL3NVV1Fja2s2WjloREhW?=
 =?utf-8?B?SFFwcjVUV01sb3VSWEpvWENxdEVxRjg1VVN0UDlPRFc2cmpGSEswWlluazhy?=
 =?utf-8?B?T3JSMGRHay9neE56ZEEyZ1g5K0crTU5ITlczSE1xUzZ2anV5Nkxod055di9H?=
 =?utf-8?B?T2E1Wml3ZkwyYVF5bXloaEM3SWdLc2doaEFyVlBWUU5oTUVwTlNDQU5FSU16?=
 =?utf-8?B?ZjNsdEg4YlpqaURnOSs3aVdiN09ReWczdTlRL0N4K2dqd29TUFRVNWNVbmly?=
 =?utf-8?B?a0lFT1owdHRsellRbUQ2TGhKdXArUXJjaHVNRm5pc2xlOGszaDBPM2RmWDZq?=
 =?utf-8?B?VERtTURHWUpXeWN5Mm9Wb1pLcWZsQ2dpbDg3bjBqN20xQUlGL3U5eGFyY2E2?=
 =?utf-8?B?b0lWWGxIQjdVaXExSThwN3JSREhBN2J5blZWTk4xM3ZXMEI0VisrQWYwaWhP?=
 =?utf-8?B?ZDVJQnFKQ3hHLzk2Y2EvemtkdW9HNEJJOGxENi83dHFpWm9RL3JzSTh1K0E2?=
 =?utf-8?B?WTgvUzJrK2IrN1hnNXpJcFhiS0hWSG1OcitZRmhBcTN0QmJuZWJVZXduTDlG?=
 =?utf-8?B?YWNYY1hGRGdkbTlrUlpsZ1hhME5UOFFiU2labkdpb0tneC9lZXdRbHcxVHFa?=
 =?utf-8?Q?TD2uedzvDd91hSgTa12GxxJW2WEuXehT?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB7198.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TjBIc2VtRXdOQUprUVN2QjdlSVBJKzIrNWNlT1RCSVUwS2d4cDdVaGxEZjU0?=
 =?utf-8?B?aHdsdUh0ZlNuMXNRSmhRajdLQ0dIcG0zU1B0dDYyQ2lTbVRNOGRSa2R2OUZR?=
 =?utf-8?B?M0lBdEhJM2pWRnJGcTB6a3Fmd1pybU56Umx0RGdxcFhOTFA2TkF3cExtY1lQ?=
 =?utf-8?B?QU9MTWQvcnlUTmYxckxKclJ2R0puanZVVFVmYWdFcVZPdlVHcmNXdW5IKzJm?=
 =?utf-8?B?aGF6UXBqdUdybmI4a0k0YXRyYW5qZXV5QlJsWGFUQlZ6R0c2dnl2MTRmVTdR?=
 =?utf-8?B?eFcwRnhkVUV5ZTVNK25pNnpuTXlhS1NyNzAxM1ZQOTBYbExaTy8ram9qcTBM?=
 =?utf-8?B?VmU3Mzc0S3pIWXlBeERWV0RqckJZNHhOUHJrSGJRdjlKTHRaMmZjN3FQVi8r?=
 =?utf-8?B?ZUcxSlFxaHRObW1lZUpjeEJTT3RsRTJ6czVLZWhmSTJ6Q01SSzBhemVoR2dC?=
 =?utf-8?B?djRqZGl6Q01SeXRVWkFTeVJVajhuOVR2RFR2dU56Z3ZkQVVxTEdYUVJmSU5T?=
 =?utf-8?B?Q2lzYk9OYnJnYUZqVFVybnN0aC83T05WVGJ3QlVXUGRPSEt2ZElOSjhZa2gv?=
 =?utf-8?B?TTk5TjI2SUtaY2pockdCemNuT051VjJXc1djNUIxTmRVdU5TZVh5ZllYL3Vt?=
 =?utf-8?B?Nm1TVG05TWdGb0R4UGNKbW1sdEg2R1V4ZCtLNEVhWi8wVERYQ3FOK1oyOENO?=
 =?utf-8?B?bGc5MU1DVFVWUEd4Q0xWUExFVFlobFo4U0lXajZKV0p3dW1JT0xIbmZwamJm?=
 =?utf-8?B?WjFRbUFSbTQ2b3RCbkZmTnpsMEQxWFRIZDVUSEVCWDFZR0VtbVdXRG9FQy9C?=
 =?utf-8?B?c3BRQzNzbFFYUnp1NGk3QzJreTNDWW9CSnVwM0QvRFNmVjE4YW9KM2FqZVhj?=
 =?utf-8?B?VHRKSTd5RWhsR0ZFeXJqaGNjQzJvOGo2aHNxNFhJV3cvT2RMSGpvSHNPeW9O?=
 =?utf-8?B?TjdweHpiZHRhMVR6ZEo1Wk1HM0U1NWZCTlFudzZma1BwZEpROWFTcnpDU3pp?=
 =?utf-8?B?cjdKRGlSS1dPM3dwK1dUNGNWRFZHTHU1OEszNDN4NzdjRjg1bFFnZjdrWFNh?=
 =?utf-8?B?eU02azE2OGk1QlVEZmc0RDhteXFJNmVQSis3WlM1SHBndU1xTXloZmE1MFM3?=
 =?utf-8?B?SFFwZlJ2NHgyOTljckRaRHYyWWM3WFRkc0NWNkFYVDArRXNaQXNFYXJDMDRh?=
 =?utf-8?B?cytPTGgyQmhTeFlRYWdSV1UvYWxhdVlOQ1BrcGtqRm1za2tvQ0IwdUJ0bFln?=
 =?utf-8?B?N3NlY2M1NU8yRnhDVEdxZnd3NTQ5TG1qUGhoYVNxcjFyak1CZFo5Z0dPNCtv?=
 =?utf-8?B?QTRVVjF3TE42aHZDSnRrVmVEbE1mV3hSUzh2cDhUZXVLMll2eXMrN25VamZF?=
 =?utf-8?B?SitBUzRrWVZTdmpZQi9RbGt0TWhZL29PdVhqM2VEUzB6aVU3VmNhTzkyKy8z?=
 =?utf-8?B?TXpLakpLdHdmcVNSbkI1cTArVk02VHZjTEhzVnV4U2x6eFBURmx0bzRmRVBl?=
 =?utf-8?B?dHhnWXRrY1ZnOERLK1VydGJKcE82djNUa05USTJIUWRIOVNub1pDUnVFai9q?=
 =?utf-8?B?aGY0T00wS3Qxc3d1bEM2YWhkTUthWTVNQ1h0aVJ0M0VZbTBTK2Q2MnNzOGVP?=
 =?utf-8?B?UlBleEVGVXNGVHBRTmVMWU43WXg1aS96QmVsTkNwVSt5eUNHWGJ5WWVzRHZK?=
 =?utf-8?B?dkJJUUN3cUsybWEvZ0MvTDZISDVBVEk4eEY5Y3lSNnBCaWlsajUveGU1MWxt?=
 =?utf-8?B?Y0JPVHZsUUxYTUZNQ21vOEhUY3JxMjBITWVLdm5GKzEzMU05Tm1mOXliV3Fh?=
 =?utf-8?B?cjNwRlpMd0FQMXl0UG1oUjEwd01KZVE1TEErRGNxYXAzeWwxWFNYcVVqajVX?=
 =?utf-8?B?VWh2MmEvQ2FZejJWWU9QdlBsWHNKK1dzQ0VIT2xPQUo1cmFkU1JTZytLWEdQ?=
 =?utf-8?B?WnNsMjRTTENIWkNqRzBuSCs1bXcvNTRPWStXZVBSMG1YL0x5ekE5SjZwZktC?=
 =?utf-8?B?L1o0VUl4Vi91cnBpT1ZqVS92dURqN0pBTzBDNWFaZENKQWRneG15b04yeDVI?=
 =?utf-8?B?NTR1d0FPczhyRXZ5ZVZrVENBUW5sOTFRd2FFM0wyanNRaVZ2RWM2RzBtVW15?=
 =?utf-8?B?ZTdLM0JjamQrcUJTMjdQWmlJRFREY2RaZHZQcnR2MHgwamZUUS9RMjdGV1hN?=
 =?utf-8?B?Umc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f8b13964-0199-4759-5de4-08de0594c063
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7198.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2025 11:29:17.7372
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vlDibJJ/EO95YF7mUfK61zGWmWcUypwZ/TSI/e/oDrENpyJEI4m+UTYKwE+idJlw9qfy0fPTCZNK2xefeuY0NQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR11MB8662
X-OriginatorOrg: intel.com

On 07/10/2025 14:04, Ram Prakash Gupta wrote:
> please let me know if I can push next patchset version.

That is up to you.  Whenever you are ready, review comments addressed etc


