Return-Path: <linux-arm-msm+bounces-119191-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id io/uMXNUV2qGJQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-119191-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 11:35:47 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 248B775C8C5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 11:35:47 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=Xsk9Tlmu;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-119191-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-119191-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 519DD3004F70
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 09:34:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6453433053;
	Wed, 15 Jul 2026 09:34:21 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 811043CC7DF;
	Wed, 15 Jul 2026 09:34:11 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784108059; cv=fail; b=oaEsyMtvnqnbbxLwEWjemQ4mXLYyBphqVgNK9rH/zO0Jy4CM8pIObg6CYBYWwDUU0QRrBNfIoxn5K+nzU+iPDqrpnhh8bCgK99hZkT9cP7iuK2Vw3H/M3uOjsyEsPXqgHHsjMiYDlrn3/0UbiucMTI6s+ENgoab7q8A7nrnKav4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784108059; c=relaxed/simple;
	bh=M7lmgJbeNA7VQXP7701MAF6rV7x6mweLcRqpLBgeAv8=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=n340QfUVaRXILCj/h1aHveFt8EcU2N1SFSVoo7PCAdJui76PXRIe6vOCKczb1erih3aDeN9qPuiAyph0kPh2WuDlFaxrNtNgWX5iQEV0KmtuVYLLoiiTHD6X+AlTZQHiNVAs47PnZnrA1mEYOlpM90DZbKYqEoo/4k1FEUD/j2I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Xsk9Tlmu; arc=fail smtp.client-ip=192.198.163.8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784108054; x=1815644054;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=M7lmgJbeNA7VQXP7701MAF6rV7x6mweLcRqpLBgeAv8=;
  b=Xsk9TlmuYg3rslcHA1PwbGO28HJygoWBQW6T3Inu6cHOGLL3pscLUaL6
   o72VeXWPwH51I/IbMTsT/attcKGedB1nzxh0m6bqfcGNYrtzAKogqovZz
   vjxuiIWiPtp7ArELtbjHjdV0hZ8oHf2YB0oAtp6XLgGkZNOydQuNVFW+C
   8ih0mJCmbey0y8XNWZbov4QrFWtlfseXf+xD4JgtD4HdlV5FNH5vsIkBT
   GsYW1gHwpA4MlBqqsUZv2nnlGtA+8wTpNyXk5E9Iq8p65B1lkQ5t5Pos2
   thORuHv/x35FP+sqhL5vyaVlv9HoM4BtkjSUaVlcRZXYUlITz+eifGZvp
   A==;
X-CSE-ConnectionGUID: BD2ECavfR/uPoZbsavwwRg==
X-CSE-MsgGUID: sFOGvdHZQjmae0BroiHHLw==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="102295948"
X-IronPort-AV: E=Sophos;i="6.25,165,1779174000"; 
   d="scan'208";a="102295948"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2026 02:34:09 -0700
X-CSE-ConnectionGUID: l9M/fNdxRyGwixREh569nQ==
X-CSE-MsgGUID: R7WHVxPMTUyWSEOUpw9clA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,165,1779174000"; 
   d="scan'208";a="252167589"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2026 02:34:09 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 15 Jul 2026 02:34:08 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Wed, 15 Jul 2026 02:34:08 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.49) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 15 Jul 2026 02:34:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O4t69mw8fGi3vQR2h1y8Y3ABuiwSkuth320K/HPoa+5ZPx54BkqRbtw1TRun8cgAB/HyxR5CxpWrihLI2AYYNT1irZrKps9d+zM1zEU5sFNLt4uVnHnXW+LrWgyDtX2dQtpX024iwADrbYW49lx1PzqkhIjPV8wIPtfCkoMAkBnNRr13/2ve6I8tCXIffhhJdW7JqENcvHGComNePvmbQcaRKoIsjOvJeRthiNoGvTxesmx8WpB7pRkCpebAdBYqamhAYBaxK5OrPqwR7hMoM4ctK0tnnZbpK/Fk2T3VMKwAN0VJQXf+heApMC3bgK/vUSZrAKdlwbSMy6KS3Y6usA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6D9uxlelGlTQkNraA4BQRJKFgzMVI5M/6yHfjRnZtL0=;
 b=LSRrwzscxadSCg8nU8PmhnCj8BkpA1tJNOkz9o9k9XaJYEnOHfIFtXasWrsjZIkZy3spcadzC7OpH9ynTdLrQ/95Kboq1lOhUtTIwPpfXZJzmvm9dRw4hjc2kvCqwOeT5WFwvQvLUeL0pTdvHNT4rn8Z+TZCgkB9h0cgv+d54yGIUdKq8LC+Kmjgvyt4b/rjYa2NcXB508cfQIN/eqLcsHVqavPepM7byRtH1j+gkbzRyHyutEediNcdHqXx6Q4cZt6e2B7LelS9ORwLKpgrBPdOf4b+Q8x1fgy9WfgJwasOTv36kjcE+VT9gHkeLNHHBdZ2KY8jZFsu3TWyXkcJVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA1PR11MB6967.namprd11.prod.outlook.com (2603:10b6:806:2bb::15)
 by PH7PR11MB7718.namprd11.prod.outlook.com (2603:10b6:510:2b6::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.10; Wed, 15 Jul
 2026 09:34:03 +0000
Received: from SA1PR11MB6967.namprd11.prod.outlook.com
 ([fe80::36a9:3aca:a63e:c8f4]) by SA1PR11MB6967.namprd11.prod.outlook.com
 ([fe80::36a9:3aca:a63e:c8f4%3]) with mapi id 15.21.0223.008; Wed, 15 Jul 2026
 09:34:03 +0000
Message-ID: <2bd4fe2c-a42a-4fac-b82e-0c683da5c9a0@intel.com>
Date: Wed, 15 Jul 2026 11:33:58 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] ASoC: codecs: lpass-wsa-macro: check clk_set_rate()
 return value
To: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
CC: <linux-sound@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Srinivas Kandagatla <srini@kernel.org>, "Liam
 Girdwood" <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, "Jaroslav
 Kysela" <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
References: <20260715-xo-sd-codec-wsa-va-clk-set-rate-v1-0-f0c713ff0b4e@oss.qualcomm.com>
 <20260715-xo-sd-codec-wsa-va-clk-set-rate-v1-1-f0c713ff0b4e@oss.qualcomm.com>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <20260715-xo-sd-codec-wsa-va-clk-set-rate-v1-1-f0c713ff0b4e@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VIVP296CA0003.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:357::7) To SA1PR11MB6967.namprd11.prod.outlook.com
 (2603:10b6:806:2bb::15)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB6967:EE_|PH7PR11MB7718:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d7ac281-fcde-47bf-3743-08dee2543571
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|23010399003|366016|1800799024|18002099003|22082099003|4143699003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: 1L7rIFQZZsxlCLH6wxXrbOFH48ak/WkUmE3EQhC0yxC1FuKQSafbBd0o9R5mwX4oj/8ua1MFBhtjmMNaH+E9AwArpSuaM+Dr3++Dbwwlc6KEp946Nr3K6J9AKdVX2x7a4K+qWEEm72SsUwnNqO57d6rEVYxfkpiHujx+7HipB3s8eKexMhjrb5MaE/HzsVKRpUASQVD5oIf288Uglo4lPan7wfa8O3p/EjbmK8/W/Il/pr/IJdudTDfxS5TPpPKSvxe8vszsuJsJPiTx5GcebS7cRVd6f+1zraDtyQuNj5JS0sWSe+0tctrOHmz4yh/AfKF5+8cVJPE9YrauH79WCYDCGU/khdGPllC5xYDWSa6jqIpWaUqVOtGXiSKvqqKdHiX1nISlRKYGIuXsVkO1/GpP9nsz/y1zDIuVJ8LOt1rlEvfhHoe6koEZ97Mi4SxzI0XK8fvA6IQ3F+giKRi9ZghwT7s5geAFU7BYlMozz3F7gGp9aSf14Iogs96dojJpq8W9qfbKgN14Ngcgx6lsn74Xh+8EyUWh947dk+pVcMj494Me8yZ+LVmRB4ovYqCoRwQMXHWo0DThHF3OsEnPIokjx1/h9JDsweXXVPzxs8wRbdRl28V7GB3qLAZHkz7Dm5YDDDqGPaFz9E+fTASPKPlbADf+mE6yArPWFbpBLpc=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR11MB6967.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(18002099003)(22082099003)(4143699003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z29oaEVaU09LMmQ0N05HQzVMV0hNM1NOUEovWElFRUkxZjAya0x3N3VMN09q?=
 =?utf-8?B?U09SNmlJYjQxVUhaU3JSU2RjS1B6QUFZenAwNXRuK2xINTlVek9RMWY1K3BS?=
 =?utf-8?B?dEpHQXlKeElQeXFtaC8zMmFvaDErdFVheVVlRi9tTFp0cnQybENRRVNGUFNX?=
 =?utf-8?B?MU5TOHFzOVlIaWNZNDFZK2ppL0xtNGZWYlBacklJTGNGVUpFb3EyOHpuNTQ4?=
 =?utf-8?B?MEU3WWdrTlF5ODYzVk1IZnJHbHZSSTNKQWhQZ01TU0dMd01hVW1UYTBmcE55?=
 =?utf-8?B?djRTRUwyVVhwc0lrWDZaWlpvRTJLSzRCRk5VUXI2SFhMOTNZY200c0hDZ2VX?=
 =?utf-8?B?eERuWHpjRElCb1BsSUVLdHRtdUZITU9FSWVZQ3JBclRVcVNnbFd2Q2JnelRM?=
 =?utf-8?B?Rm91YnVzMFZQUmhadko4aEt5K01PM0p0VSszQ0xheTd2c2VJTGtBSGlXbTRN?=
 =?utf-8?B?a1ZJRFlpKzU5ZW5RRlEvbGs5d1R0S0t4dFQxVVkvUU5hSm5mWjl6dGt3bGo3?=
 =?utf-8?B?RmNwK2RsK2ZTSWFpNFIrZFM2T29IQlcybWpRUkVHbnZRdGx1d0dXeXpxODh4?=
 =?utf-8?B?UzFkUHIrTVV5ZkJZSGJLcDNCNlFWWFZlbElUbkIvU21rZG5sbVVJcFV6RGkw?=
 =?utf-8?B?L0FzdW5ncVRiQWNMZHlxVytqeGZwWDJ4NFFKT3lGMDlHalF6NFB4MVY5ZjVY?=
 =?utf-8?B?UU0zalU4Nmd4TlJKWFNobllybENETDBHSWE5VC9IYjMwM1h3ZGs2ZzE1NHR2?=
 =?utf-8?B?NFN5T2Z4WFF1WG9QQy9OUnpycjRXQ09mUjVuSW1rRktIK0VMY0kxcitLVElq?=
 =?utf-8?B?bTdqTkFJNEZZanVSWTF3VHQ0Umhzam4wWkhKd3IzOTR5ZytYTVdDeWxpdnNk?=
 =?utf-8?B?TlprUlNPM1lHRE1IaU52QU9jNUcxM2F3STFqNkYxUlZSd0JEN1o0V1ZidU02?=
 =?utf-8?B?NysxWjRTY1BQK2R1VmFscUluN3hIeDdGYmRZL3JQRVpOQkZCRDkxaDNiTWhI?=
 =?utf-8?B?K0pkTjRZYnM2QWJaaTRsempNVHB3U2JlQzB3WENWdnRBeEtqMjZxanFkZjcz?=
 =?utf-8?B?L2t5RUh5RGVNa0thbVZDc1F0eDZFdmMxdlg3T2xzN094QitnWG8wRmhDM0hM?=
 =?utf-8?B?dmNXckdIRXZndHUvQUkyOWRIVm03NTZEVmRySDlqby8zNkJJc25EbmlWZk5r?=
 =?utf-8?B?UlpOUS9JVmRGSTh2UkNlWEtHTnluN0ZMMmlucGVRelBjbkJMbmJMeWZCQ0NY?=
 =?utf-8?B?dzl4ejBoaHdyRURwT0pCeEk3aEI4OW82eVd5QTdzWURZSTQ3Z1UrU3hySkhW?=
 =?utf-8?B?dTFpbjNVU2xmNnBINGJJTVYxMDA2VVVTTTRvcFNBUUtoSkc3dFpVQnVvdHo2?=
 =?utf-8?B?ZWZUU1FreHkwTzJIU09lUjNUNWRpZjg3Y2lNZndXTFlEcGRvb1hobWM3OWY4?=
 =?utf-8?B?b202dVhTWnE1LzZjb1F1a2xXblMzM0xyRzB6OWd3ZWdBdDdRRDRLbkFDcFJw?=
 =?utf-8?B?R3d1d2VmUDVpNWFyV0h1ay95VUJvOVdOQ21GeU9xQlZhR2pSK1VXcmpwTUo2?=
 =?utf-8?B?QktlckJmbFJ4MFlsTmwyVXN4Snlyd08rN3BhMHduZ2lKVysxQitPWEVwRFZD?=
 =?utf-8?B?L0VqZXB5S0dxTDhwQzBGY2lHVGtKUkd3YjFBcVI3aFNBMzlYV1VUaEo3UnRm?=
 =?utf-8?B?VHo3NXRsWFFMWTdHaEtCeWNHL2tzdm1lTHBtRjY3NGdFVUJ0cDM1TzB6TTE5?=
 =?utf-8?B?bExGdEpEMXFYa2RlNG40TFRXMHJzV2l2M0dxNS9IMitNbk1NSklwNWZndStW?=
 =?utf-8?B?MmUrUzVYRjYyUVd5eC8yR2pscXZ5OVVyQlNjamFoR2Z0MFNrams5bU5Kb2JG?=
 =?utf-8?B?OWo1WVR0b3hFTzlxaWRWQklwLyt6S2hQeHF3Qmo2M2kvb2dMbEtWWjBTa01m?=
 =?utf-8?B?VjkxYnM4a3F3SitLb2dRaFdSbW1hOStZcEExYVYxemRsd1R1UmkxREZ4TXdM?=
 =?utf-8?B?QzR6a1ptMWthc0kzNFpJMXI5VTh3L2xrZ2tDWVhvZWdoZXJTczRwREFtLzFr?=
 =?utf-8?B?cGxwRlVhSlM1RWVDR0t3VUdMTDJXb2ZvZnhXK3FCNWwvN0l3RDd2dmdGY05Q?=
 =?utf-8?B?TncyMjZCaTUrQlU5Mk5WTVFqQURFN3AwakFXcFNTWUFmckNRMDhPOFpCV1FT?=
 =?utf-8?B?QzcyKzh4cU8wb2VkZDltZjdxck1aLzYzOXhmWGtqNXRvNkVCV1d6cklXejNO?=
 =?utf-8?B?bVllSmZPNzNRUnNpWE5ZaFJRQ1N0bEtpTlRwRGROemJhdE9mdzljcGNSbHRa?=
 =?utf-8?B?K2FMdTVVR1ZFWUtTdTArVUJUeFI2dFpNVk1IbDRXeG8wcEVpMm12UlB2NnFJ?=
 =?utf-8?Q?9izVxxqH7dLKUOVI=3D?=
X-Exchange-RoutingPolicyChecked: sBXB2hXi4ZCeUGcPU1mRlr67/fqFDYRAo2nd/qFy/cjoyZAutOiuDwnzRItY3Ee8oL9893oRn6OJkAt0A0yGbzAyrLRt88DdSQKxuOqZsEdSnqQzC3ykOmkk5zk6WvMSt5hjww4F7jJ/jkkVvbNLFrwqjGurfdwhOnbGgq2kk0fkMj6Gak6lLMW2uGVlW0gA9xkLIhu1eMjhaKz0t4DaRomoEGlQQg5uvVhk0w9ufNS/MVWCVjF0SPgoh5uvOrq+sze5odPT0oER1RBZ0TvVG4zwfu9nlKRf1QDf+5MPhH+fPd1pH5o9e86nPnDj4rspQcRqJCcxE437Jx5F4MKQuw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d7ac281-fcde-47bf-3743-08dee2543571
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6967.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2026 09:34:03.7123
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l6+AbZydHLlY+oGQ4zOvw/8o9nJVqBsD52KFSvv8wq//ZdQqb7BLzFmTo1io+ywiTKkSKguc120SdEzlqupZoaLJ7baUK939Y11ZN9Z0Lxo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7718
X-OriginatorOrg: intel.com
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[intel.com:d:+,kernel.org:s:+];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-119191-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ajay.nandam@oss.qualcomm.com,m:linux-sound@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:srini@kernel.org,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:perex@perex.cz,m:tiwai@suse.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[cezary.rojewski@intel.com,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,gmail.com,perex.cz,suse.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:from_mime,intel.com:dkim,intel.com:mid,vger.kernel.org:from_smtp,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[cezary.rojewski@intel.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 248B775C8C5

On 7/15/2026 10:29 AM, Ajay Kumar Nandam wrote:
> clk_set_rate() returns 0 on success or a negative errno on failure but
> the WSA macro probe function was ignoring it. Check the return value and

_is_ ignoring it. s/was/is/.

A patch is a proposal, there is no "was" until it is merged.

> bail out of probe on failure.
> 
> Signed-off-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
> ---
>   sound/soc/codecs/lpass-wsa-macro.c | 9 +++++++--
>   1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/sound/soc/codecs/lpass-wsa-macro.c b/sound/soc/codecs/lpass-wsa-macro.c
> index f511816aa4a0..fc9e0a37c042 100644
> --- a/sound/soc/codecs/lpass-wsa-macro.c
> +++ b/sound/soc/codecs/lpass-wsa-macro.c
> @@ -2773,8 +2773,13 @@ static int wsa_macro_probe(struct platform_device *pdev)
>   	wsa->dev = dev;
>   
>   	/* set MCLK and NPL rates */
> -	clk_set_rate(wsa->mclk, WSA_MACRO_MCLK_FREQ);
> -	clk_set_rate(wsa->npl, WSA_MACRO_MCLK_FREQ);
> +	ret = clk_set_rate(wsa->mclk, WSA_MACRO_MCLK_FREQ);
> +	if (ret)
> +		return ret;
> +
> +	ret = clk_set_rate(wsa->npl, WSA_MACRO_MCLK_FREQ);
> +	if (ret)
> +		return ret;
>   
>   	ret = devm_pm_clk_create(dev);
>   	if (ret)
> 

Apart from a nitpick in the commit message, code looks good.

