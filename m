Return-Path: <linux-arm-msm+bounces-105893-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qIeMNLjB+Wn/DAMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105893-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 05 May 2026 12:08:56 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 399324CA93C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 05 May 2026 12:08:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 67961303DAA7
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 May 2026 10:01:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D60392D061D;
	Tue,  5 May 2026 10:01:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GiGBLZQq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48C6130F7F3;
	Tue,  5 May 2026 10:01:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777975271; cv=fail; b=oVKEBz+aSydw2jRliA7eXQiJMvxl3Y/Q/bsiNBWd0xiWamiZEErhGGinvt0ZtjhWMkpVUNx+kTvW8p3oyw5FPCXym9qqC5NzJe6vAW0O+KTu/lAOVgJES61uNi/u5A6vUKynUxAus2fQQOW+MqFSs4m5xPfVd+/mNl/KyASkk6c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777975271; c=relaxed/simple;
	bh=KOv2YvgYcI9Mc7LqDJnAC5/stTu4kVkBrvxKcz2X/kg=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=KggPSBx67xfIhd5ewDG5qnrtyAoZJFo+hbTBOfnPoMThqalpVYhnAl0JAYeV6n3ItDkZcDvlZUC/NF4w9KHCG/Oi7zuscSVB9+8n00HICTG/4ndas9a4gCGQCDl+YIX/lq2qWVMUeX74NTqfyt+ESQm1z8lRsiXIZddPLIE4f4s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GiGBLZQq; arc=fail smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777975270; x=1809511270;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=KOv2YvgYcI9Mc7LqDJnAC5/stTu4kVkBrvxKcz2X/kg=;
  b=GiGBLZQqxx1vVAY+CaM7zuKcMEAVfxnIyRpO0rnWlYsb3W2mIpHhDNUp
   zSTT0Pifbxy1HGFDgVdCZb/D6a4trGcRsYJs/H0vDFLWNMU7bg8ES3rbw
   j2VUfNMINdeTkR3g1cQQagN0TeABtIGEKc3daxpSma0WXmup8MGYmPdPU
   c0SfHL2IM8iksN2N5QUvUgIDmSGkPCAXGDoYQPgEE0k4l57yPEeXMu7r9
   hWTMR6/tGFd2YyTTJ1BXHSrUFOov5PHFYQZrNiu+cBXApkP5/EH8XKDox
   mMH7n1Lfh66wS9lTHuvrO79APBnL4zHYAGltiXRHoyYYGRXUpKna/dNeU
   w==;
X-CSE-ConnectionGUID: vxhH7q2jTl+9ejX9Bks3+A==
X-CSE-MsgGUID: 8EYkf8L2Ro2evEK35BlBWQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11776"; a="90214168"
X-IronPort-AV: E=Sophos;i="6.23,217,1770624000"; 
   d="scan'208";a="90214168"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2026 03:01:09 -0700
X-CSE-ConnectionGUID: GRWkMiJMRYWigWtoDETDCw==
X-CSE-MsgGUID: defuzKYoSHuD8rqzg1HHpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,217,1770624000"; 
   d="scan'208";a="259122588"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2026 03:01:09 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 5 May 2026 03:01:09 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 5 May 2026 03:01:09 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.52) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 5 May 2026 03:01:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k25Eed8EJZgXPES9a5gracXOumGSPlOWtuFSc15J2amoe1WovEmvJlXnp69kU+iXsEtFF+STrsDIfHDNrnJ1cVELJR1Llq2tpFKisarkErMMWoMWfzMoyCg89dO1pKK2DyvqYd1IbE8rcvCnSnEU1QQk7h8xl77XTi2A+qevkDKoNe8cIAHF4h8cF6gvDFrlR2lINkYn+sBowktbGkSIp3+ZJy8ly3GeoT75juTaFXfAz1XEjNOGyu2f8L4J99EXKsmV8ptOmbJ5nNE6m0opw1NpqQFiVFhUUSC0mBz/DiO+hwsKK854rut//Ei5Khqaqz5XzGSNGL/BRlQUBVZ57g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F6fbvhqup9wMLUEhSN4UsM8lPEyFM+Z4Hp5jXuVDtSA=;
 b=KbDBhrpE2mqMZwI8yL1xdhgcPLUH/CRWNe3Lwlmz3xBM8SkNxuXvpHxQjwrGuFsZx5PqCPhdTKlexJtbw3JC1rGi3ef8HNLijmaBrWMCZ2A/LFlhF2XaFajG/hrpuiPbRAaZDs66bWB5dtA3G9niKRf0EzRp2b7u4yOKd0nksahhjJWjD4NfBDK1xykerTL+KHFbcdp8PfAf41UMXiQeBlE2N93hpmrkuEBkfmL3XrTWPLJaI+mzdCYTQNqBmk2MfS8AOEIIvb6yjZCEo1wZFkDTGpA+Z3XdamfBrF/Fz3TWVQuDg0G6aFmZxCSQdWcoItVhWviLvzSsYshBoXVSkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7198.namprd11.prod.outlook.com (2603:10b6:208:419::15)
 by SA0PR11MB4559.namprd11.prod.outlook.com (2603:10b6:806:9a::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Tue, 5 May
 2026 10:01:05 +0000
Received: from IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::2c4e:e92a:4fa:a456]) by IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::2c4e:e92a:4fa:a456%3]) with mapi id 15.20.9870.023; Tue, 5 May 2026
 10:01:05 +0000
Message-ID: <5ebaeea1-215b-415b-9333-02705ac305f5@intel.com>
Date: Tue, 5 May 2026 13:00:58 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 3/5] mmc: sdhci-msm: Set ICE clk to TURBO at sdhci ICE
 init
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
Content-Language: en-US
From: Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park,
 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 -
 4, Domiciled in Helsinki
In-Reply-To: <20260409-enable-ice-clock-scaling-v8-3-ca1129798606@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DB9PR06CA0017.eurprd06.prod.outlook.com
 (2603:10a6:10:1db::22) To IA1PR11MB7198.namprd11.prod.outlook.com
 (2603:10b6:208:419::15)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7198:EE_|SA0PR11MB4559:EE_
X-MS-Office365-Filtering-Correlation-Id: ccc1900e-837a-441b-aea3-08deaa8d38eb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014|921020|18092099006|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: IBA7ci91O9oTibuJMVWQ5d7iI/JtaHs89DpJe+BwWUbqwbpeXzya/2eityunqTVF7VTslyrBNoToHRPI+7fy1Dqcumcosj7VE9IyGm07nj8icZe94QnF5WmoFuqB62fVHFtmWYGPr/IsKP3ybRGKx2ylufdts/KvtRC9WL3+AIjm8nXBADZ3goj6wdwEQG030oZkoY5yrYiykowVY7+wHHrVVrAgVTBuKVIOfgWNxpWfaQZprl00c76KaEIjb2IX4iH1Lg568GCsavRPqFRUKATH00g49bXnxAV03Ftcz1/W3SsplvX+8gAi3WDdXfCEgffy8AKkDIJbuXyxIwLhIJ8xsYEa7f6Z92qR8wsHLLZAsxJeQmtmx0n9gwhJ5017nm3HVlDM9D86H6z5+2Ey4PfNVi3Fi5hAUWvuvqidyo1ftukfJbe/JnJSDq3GAkorwjpzK6wltjONls5XrVYpm06+v1L301Lz8TmctJu/MU/hI1Ck1EaIqeSqGep37gFjGbh1GHdmgFP5qi07BrZkMZQepg4tNui5SJspGxduuKD3nawy5FTvC1PezEikpZixvkvBLpGvlfOErsNT4kYrcBsfnZkKKzHWjqhkdYv6URv4a73+enJhDGzxJorDFdBeHjsSojFFEvzvbKENNXTSjXWsytWJZGILkBjIdelxEyhCAR+ZQsN82b8W+1Sx4AF9CvmHsoXiai9YMSiS5wT0ab7WF0fldKYf7IE39WkCy4Y=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB7198.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(921020)(18092099006)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OEdsZWtLekpOZEp4N3F3WHF1MDhBb0g1T0ZpbWNmREhWbTBSYTg4MlRjci80?=
 =?utf-8?B?YWVIbFRybVAyb2h5cHBGWFE5eHN4bzIrNEd2UkF6TzR6akh3TnZ4eUlORjZO?=
 =?utf-8?B?bldQc0FzYWw1cDRDTzJJT1l2WDZ6dWlJUkFkV0dnMDE1aXZGRjczTEd4UitW?=
 =?utf-8?B?dC95TXUyMHlZYWhFSmNyS1BtWXVZZ1IxdEFQSTJCVitXN2R5QkVhbFpPMzBW?=
 =?utf-8?B?VlZIWTFZbktsVG52Q096ZkczaXU3aFA5VUhCVWtmb1p3b3dubmFlMHRPVWcx?=
 =?utf-8?B?ejRMN1hTNVJEUDN1NjFFSHR4cWJxdkxJbEdCdXFLTFNTYThsaThYWVNaa1NV?=
 =?utf-8?B?eGU2SEpCeDZ4cEQ2S3A5b2Joa0c4SC85VThrQWs5R2hFQU9QNVFHMFFFUkNr?=
 =?utf-8?B?OHZSNmFMZ0VvOXo3a0RWeHRNR2pDVE1iRTBsQmxPUUdiMzNwZVIzMTJGdVVn?=
 =?utf-8?B?YzJraUdYaUc1OTJEclN1WlYxaUxBQUdsbktMUFVFbldnVDcxOFZ0M2lBUzN6?=
 =?utf-8?B?QVlJTnc5TEZTZ2pwZmdBZXN4RUV4VERmYkhNNDBrT09hL3pQV1ZNVlIxcGdH?=
 =?utf-8?B?Y3p1Tjc4Zks3bm05ZWVVU1dkdDl6SVVkNy8rcEhyQm1oMmJRdFNPWGdDbVlo?=
 =?utf-8?B?SmRvQ09jZ2dQeXZMRnBadlJQMnV2ajk1d0tOMnFvMEpxT1YyYTVNWlM1L1l0?=
 =?utf-8?B?Rjh3WlRHanhkc0xCRVBUdUdNdW1sdEVZWnhJcGJnL2hoNld4Ykl2WDlOSTlH?=
 =?utf-8?B?MXFHZGtJanlBaHRVK25FR0h6dmxxWXdHcCsyT1dZcG9qL0c3QlhaY3gxWHZJ?=
 =?utf-8?B?SzA2WGRqdGdoUWFkZEIzZlQ2NFNYcE9QMXBIRE9MR0FYeExMcHhiNlVCWTRG?=
 =?utf-8?B?U1RiWDdJUnZsT2tjTUZZM0tQMnF1T2gzc21FdzltbFZFam5YRGdXZ0RyUTVz?=
 =?utf-8?B?ZFI1VWpYQ2JGMHAxdVEwSGtqcElkZWlWQStTUUM0TGs0cklvUm9WTnc3ajds?=
 =?utf-8?B?VTBIUW1rUVlJdW5NeWh1REdBMXB2Y1NOY1JrUmNndDh3L2hJQXc4R25LSDBq?=
 =?utf-8?B?TW1EcXkvZDZDUWswV0FCMkdxSno3eWplOVlQdDV6OXRDSDBlQTVkU0J4RnZU?=
 =?utf-8?B?d01PRkVuSWI3aE1wUHhwcWdZa3FQb2s5OVRlL1ZRTzNEbXBvWXpVUEtOVGlH?=
 =?utf-8?B?S2xjcWJWZ0k5RWZiUkhONUlRbG1HbEhnbkgvUkVvY3hCTE5VNUpZQUI5bEtj?=
 =?utf-8?B?UEttN1BEdUlJTDZJOHdNR3YrMkVBK2VMbzU2a3c1RWtLSHJSMm9uVXB4WHJp?=
 =?utf-8?B?V250ZVlnOGZpa3hLUXBXaExWd3pDWC9ERm9Sb1NONU1RRC84NlNYV0hLK3hw?=
 =?utf-8?B?cFFCeVFGdk5TMjQ0WDdSVU1pVW1UaUtFOHVqc3krUVpHa2hBMHh3RWFpRXU3?=
 =?utf-8?B?V1RCQ2loZllab3FhMlNmYWFPT2c0V3NRaFY0SlhWWHZzemZSR0RHZDg2cGJy?=
 =?utf-8?B?ckpUM1d0VWlhMjIxRjNIWTdHMkhlUi8yOU1uc2FGOHBNRlE4UXZHY1BEc1Bu?=
 =?utf-8?B?V1l3ejZaenh0UWRKU3pUR2Zla2NjMUdnTU94MytZVUM2eEtNc1pZbkdFczNB?=
 =?utf-8?B?NmwyT2FFVTU1VjZKbHZidnQ4MzUzMTU4TFFSOHp3RHNUM2JrYUg3WUpQcFp0?=
 =?utf-8?B?a1NueEVVN0R6Zm1BU1VCWU4vQjBhU1gwTExYQUI4UkJJb1Z5ZVRoK2RhSXpI?=
 =?utf-8?B?ZHVSRk9xbzhRc0xRNEZMS0hhMEVuYlkvbEJGYnFRZHFOTEd5U0NKT1VTRytW?=
 =?utf-8?B?YkZHbGFqSmMvUEovcm9WUllYRCt1TjlrVEl6WlRmM0RycCttTndQS1ZiMjl1?=
 =?utf-8?B?cUdCUXJOSTlubmNNWkEvTDVSdEoyaHpOWUpKMW1oOStYU2h4WGVrUFJSdGov?=
 =?utf-8?B?N29GcW1JZktsWUdDZWNpSnRxL24xZVFOc2VzcjdUQVg4VmllNWQwb3hkeUFa?=
 =?utf-8?B?UnVzeXAyODczMW9DL0RmZGgzN0ExdXZoWkhDbHFsdER4S2RHUkxudnoxdHVG?=
 =?utf-8?B?bmdWcmI3RVplRy8xMk1HQnpNL0UwZXV1TGxQTGtlNGpKYk4vajB3OWhHbnUv?=
 =?utf-8?B?dXJnYVJGZVFyOFpUTmxCaFMwZk01RlRXN0QxODNuYllrN3ljN3VUN2pLZDFr?=
 =?utf-8?B?SmNBQTZLQVNwZ01Eczg3eFc2UWVTaHRNaHdsTzNEUit2UXFPRmk3SXRkbDMw?=
 =?utf-8?B?a2FKM3lNQ1hvNnJDZDBOYUJzejZpTmZENU5oV0xYdFRpZEZzZE0yV01SL054?=
 =?utf-8?B?S3NLaTJ6Qk9jY2NZNmJQZXRZR0RXTVVrRVVUTVVIZ3V1R2RMaktsY3MzbjhQ?=
 =?utf-8?Q?LVFV8zP4OcsGmJls=3D?=
X-Exchange-RoutingPolicyChecked: eI5xV0tC/3hpDIGjY8j7OJJrxc7U59JKnIaojsDzUUW7lD2CpN/sp+WAwQnO/wUNra85uj47FGrzJDyNnVjQZz2Y2zF5syv5mPKCERqum0wMMnAdlT6i2tMIPqZuDFGLFQWKeUMCoCZxIO3CewZNc8tJ/R7ne3fRIUlnyfI1KBE/rniyjQQKucLGA5FQDUGum8T65ItvU9YiCSOjmHaDpAea77NN26m0Nhv2+QW7cCoy5XdTa+B401fViy7+ArUzkzagdz6o1zpt798lAumRB7CpsI0HVsxd/YmL5Tpv/uIaQIN5aZJ2TK8KoGZlyIG6Z2pGc0xB1mk28q2yAafD6w==
X-MS-Exchange-CrossTenant-Network-Message-Id: ccc1900e-837a-441b-aea3-08deaa8d38eb
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7198.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2026 10:01:05.7461
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZqcyC1h6K3B+VCp9piCI/J3Rf/dQkxn0E33/BH0O/+eb/LKH3B+JqeUbiOdkdUAgcSZaObz4+ZKwn2FIy1SLfw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4559
X-OriginatorOrg: intel.com
X-Rspamd-Queue-Id: 399324CA93C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-105893-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:email,intel.com:dkim,intel.com:mid];
	HAS_ORG_HEADER(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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

On 09/04/2026 14:44, Abhinaba Rakshit wrote:
> MMC controller lacks a clock scaling mechanism, unlike the UFS
> controller. By default, the MMC controller is set to TURBO mode
> during probe, but the ICE clock remains at XO frequency,
> leading to read/write performance degradation on eMMC.
> 
> To address this, set the ICE clock to TURBO during sdhci_msm_ice_init
> to align it with the controller clock. This ensures consistent
> performance and avoids mismatches between the controller
> and ICE clock frequencies.
> 
> For platforms where ICE is represented as a separate device,
> use the OPP framework to vote for TURBO mode, maintaining
> proper voltage and power domain constraints.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>

Reviewed-by: Adrian Hunter <adrian.hunter@intel.com>

> ---
>  drivers/mmc/host/sdhci-msm.c | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
> 
> diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
> index da356627d9de6a11ed5779bf057fa8eb23c38bc0..32e3f37fe425f66c00290a373e06e8ab6257824e 100644
> --- a/drivers/mmc/host/sdhci-msm.c
> +++ b/drivers/mmc/host/sdhci-msm.c
> @@ -1901,6 +1901,8 @@ static void sdhci_msm_set_clock(struct sdhci_host *host, unsigned int clock)
>  #ifdef CONFIG_MMC_CRYPTO
>  
>  static const struct blk_crypto_ll_ops sdhci_msm_crypto_ops; /* forward decl */
> +static int sdhci_msm_ice_scale_clk(struct sdhci_msm_host *msm_host, unsigned long target_freq,
> +				   bool round_ceil); /* forward decl */
>  
>  static int sdhci_msm_ice_init(struct sdhci_msm_host *msm_host,
>  			      struct cqhci_host *cq_host)
> @@ -1964,6 +1966,11 @@ static int sdhci_msm_ice_init(struct sdhci_msm_host *msm_host,
>  	}
>  
>  	mmc->caps2 |= MMC_CAP2_CRYPTO;
> +
> +	err = sdhci_msm_ice_scale_clk(msm_host, INT_MAX, false);
> +	if (err && err != -EOPNOTSUPP)
> +		dev_warn(dev, "Unable to boost ICE clock to TURBO\n");
> +
>  	return 0;
>  }
>  
> @@ -1989,6 +1996,16 @@ static int sdhci_msm_ice_suspend(struct sdhci_msm_host *msm_host)
>  	return 0;
>  }
>  
> +static int sdhci_msm_ice_scale_clk(struct sdhci_msm_host *msm_host,
> +				   unsigned long target_freq,
> +				   bool round_ceil)
> +{
> +	if (msm_host->mmc->caps2 & MMC_CAP2_CRYPTO)
> +		return qcom_ice_scale_clk(msm_host->ice, target_freq, round_ceil);
> +
> +	return 0;
> +}
> +
>  static inline struct sdhci_msm_host *
>  sdhci_msm_host_from_crypto_profile(struct blk_crypto_profile *profile)
>  {
> @@ -2114,6 +2131,13 @@ sdhci_msm_ice_suspend(struct sdhci_msm_host *msm_host)
>  {
>  	return 0;
>  }
> +
> +static inline int
> +sdhci_msm_ice_scale_clk(struct sdhci_msm_host *msm_host, unsigned long target_freq,
> +			bool round_ceil)
> +{
> +	return 0;
> +}
>  #endif /* !CONFIG_MMC_CRYPTO */
>  
>  /*****************************************************************************\
> 


