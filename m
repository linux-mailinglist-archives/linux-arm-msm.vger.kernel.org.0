Return-Path: <linux-arm-msm+bounces-119192-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id gRGjB6ZUV2qRJQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-119192-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 11:36:38 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id CBAFD75C8EE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 11:36:37 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=YgZh0VqD;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-119192-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-119192-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 4F7F030054E2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 09:36:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D962435AA3;
	Wed, 15 Jul 2026 09:36:07 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACD23434E55;
	Wed, 15 Jul 2026 09:35:58 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784108165; cv=fail; b=ucFoDW+E08hyjCzTAVuJ30JdbIrApEZNzU2tNtQejPaHCDVYJWt81+ApywabiC+wmY5BH7al1ipViBkbiwkTnht5T22NyVACV/JS96KyIdbh+rdc/54SQV7Fnk2HhTP1XFbe68AF5nt2pUFD2VYdCo4VTrmmXVcjTSpo4bHMOtQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784108165; c=relaxed/simple;
	bh=IuNMrbmOT4yHyrGKXt/UvT9GWzpy3bnuXtosBhfPeyk=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=RDkcMtgJvUJ1FKZsQZ8Y9zhsTClcuoh63H9eFegeYUZQ+dNsizRo20p7lF9i0d4sI5hfkbxSV89icu8ALVTYsosKPNN/Y2r4Yyj+gWyj289XT6f5NmbDx41BScrsK2ZyC25JmLLaZU7wSz1z0f5Xckx7mVCxY0FZzOTjNAE0J1U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YgZh0VqD; arc=fail smtp.client-ip=192.198.163.15
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784108159; x=1815644159;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=IuNMrbmOT4yHyrGKXt/UvT9GWzpy3bnuXtosBhfPeyk=;
  b=YgZh0VqD0c7VtYXehVjYNwDL6hd7h3kJYB6Fg7OWkEsIFmnMt4tWCKtB
   MKxj6xtMHOOH+13i5B4vwp3HJCujyTAyPbNAE3Zxsg703SE8eFtA0YyZR
   b4YoUw3yaq9P3/fjvqY6l8kU0bKsbTXDqz1UkVGeDfUM/MmIHdFjagxkf
   /oHY0KV6Ut0wzQ6/JXX5OdPskd9Ms78fWocScjpdfsZx9un1YBIaNIVJ8
   3n9/IO4LnoW3Riq8WmMvgSdwWn5pXe7SZSZcThfgbqEtLDLFV8Sq85hdV
   sfc1xqw7hRgZsmb6EFvrdT4hhMhyKcv2zbnSMFPMewcWYi5Ko/jX/BSDa
   Q==;
X-CSE-ConnectionGUID: 95nCt4CXTDSC09d94XgDdA==
X-CSE-MsgGUID: cuccMX9PTFSyKIJX4Qpzaw==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="84858755"
X-IronPort-AV: E=Sophos;i="6.25,165,1779174000"; 
   d="scan'208";a="84858755"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2026 02:35:54 -0700
X-CSE-ConnectionGUID: 3aemA/ZORruL1b8Aqe59bQ==
X-CSE-MsgGUID: nQjnheCQRsG4WwJ1qF3HqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,165,1779174000"; 
   d="scan'208";a="253509244"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2026 02:35:54 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 15 Jul 2026 02:35:53 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Wed, 15 Jul 2026 02:35:53 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.12) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 15 Jul 2026 02:35:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AyRPaivOUSYwhFhZbEGDOhE0QSvYq/w9YdVECDImlNHFrlzRXeI9Frs+zNliUBr/ZMU5Wyk8KVuQr7zoqOzE8iuiK7uKZcGooDbtijAs90FcvVLd45+edWdNQ6rzBqAjVZcXeOCHlj7r8f2yLeRcOWxcNmRXe+79O8BtcTRivJhBXwN9Pu2U/75Eix058fw2aIM8jSdFtsb0zKgZ19YeUaYf4U9wjTftoMLQbPqxHYGKSGGimBYnTbSvuqAEtTJGPhxZ8/0cr/t3d+vlQDlsah8QqhADuDUMFJo2PI1tyJtmxXU+BM42Y++6B7W6WIihB94oCYPUpVdX1023zvQr6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IuNMrbmOT4yHyrGKXt/UvT9GWzpy3bnuXtosBhfPeyk=;
 b=FlyFdmB5EsHXTlPXb1xQHYUwxuWMv4eInWnNqMdC8l+tua+NrPoH4bItlrG0d6hwN3UrrjLcZ9nTFyyLpp6IG7dg+Ce1+cMpEEABtedHuuWrXmEnMYI7JFu45HLguNyiKRq6GE1X1ZWSWSVW36+/QANc2P2dmBm69T6DkL/5qJB8X5Zz850HHsFFJtNJa0N3aSetPjZnslbke0HesR+uN2YBiHc3yeMrPB2DnXuIjhcUF3BCAJ5Mkeg/3M/Xo4kBIAziqveTgAHdyk6vCf6HKMlSeov8l27BXTTh0XpwxdvKNGYLDQ+ngwjNUGeZw6Nu8vzw8FG0yZyIoJsD1wiSVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA1PR11MB6967.namprd11.prod.outlook.com (2603:10b6:806:2bb::15)
 by PH7PR11MB7718.namprd11.prod.outlook.com (2603:10b6:510:2b6::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.10; Wed, 15 Jul
 2026 09:35:48 +0000
Received: from SA1PR11MB6967.namprd11.prod.outlook.com
 ([fe80::36a9:3aca:a63e:c8f4]) by SA1PR11MB6967.namprd11.prod.outlook.com
 ([fe80::36a9:3aca:a63e:c8f4%3]) with mapi id 15.21.0223.008; Wed, 15 Jul 2026
 09:35:48 +0000
Message-ID: <faeab006-8a65-4352-a33b-e64e30fd2cf2@intel.com>
Date: Wed, 15 Jul 2026 11:35:42 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] ASoC: codecs: lpass-va-macro: check clk_set_rate()
 return value
To: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
CC: <linux-sound@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Srinivas Kandagatla <srini@kernel.org>, "Liam
 Girdwood" <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, "Jaroslav
 Kysela" <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
References: <20260715-xo-sd-codec-wsa-va-clk-set-rate-v1-0-f0c713ff0b4e@oss.qualcomm.com>
 <20260715-xo-sd-codec-wsa-va-clk-set-rate-v1-2-f0c713ff0b4e@oss.qualcomm.com>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <20260715-xo-sd-codec-wsa-va-clk-set-rate-v1-2-f0c713ff0b4e@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VIVP296CA0010.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:357::14) To SA1PR11MB6967.namprd11.prod.outlook.com
 (2603:10b6:806:2bb::15)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB6967:EE_|PH7PR11MB7718:EE_
X-MS-Office365-Filtering-Correlation-Id: 48295ca9-bc3c-4a7c-2dc5-08dee25473bc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|23010399003|366016|1800799024|18002099003|22082099003|4143699003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: Cyrq/JEkQ78dfnzxW+DY4Zew/M+6l/3n9yO16SOC5I7TODnk+054LuQCMluPAu+m8n+7XYwq/vHzo+zo/tWI3yRh8OnWL5hRf9/hETuMUl2BILPpS0YEi7eq0x7wCYxc5rk25OOYFR07CcBRTvoGcK4+vaMw/bcAnDXGmTzIvCdx1ur0a7BUSRJcVJ8mioZKcrolUxjehpRpuDCNrSDaQSJ+FZUYGVEomKxbDOT1HXoLBjlArfDeF65GJvpcfaUY2TGwsiPf24+2S59HH4E9rZE64zoqX2HFUK/wMgLrF1SLlXfxADg0tt35wjb9PYELJkzq+JwR++vif5Rs6BozZtrfi1X/Meh3EEUPecK4vp/LPNP8C3GXFQhGnX83dRtp+P6oenXYz7IjbPZq+FpWG9gtpktVzmKOA6HF5gcrR2BM5OUH/5MIGN+VaPJKVygfAgF/7/zopHSgtFgDHvilavCK8sTfFzcyZuTox5VynCQl0+vC5ZCdEjP1G9D69liZvOAFNh1Xz4YK0QhpsAuUk70yrs9xTVlUmoXYT1F8ZQJuPfjvZdCduxWaJV/I0Ijh9Io3JPvuTx3J3Du7y/QdsTXTpzW4L/igKihPfM1Vom8ybh1KG/5f+TmCNXWVpsv2EZST2oYgg0MtAPLgeDHLSWcXxwWVSDSBHZyuAHqNYeA=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR11MB6967.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(18002099003)(22082099003)(4143699003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RFFad2pvM0FNV3FUcCt5SGEzZ2ZrWU4xd01uZEc4YjA4d3RUYUxQYzduRDJP?=
 =?utf-8?B?bmtoOXN3V21RL2MxUVg1dWc5WHVzQW82b1BCYzQ0VkxPdUtSUzUyTU5qbW5V?=
 =?utf-8?B?bCtZNzVMbjdZV2pXTVFtN3BxSDhKekVEdEk4RDJKYWJKUWNMM25BOXViWjZ0?=
 =?utf-8?B?T1ZETkxUWWVnVHN4dThnenlPTDc0N1M2SURYV3Bnc0VpWXVERVc4QUJTeUIz?=
 =?utf-8?B?MTVNNnNIQnMxQjFHcVUxTGw5eE5sN1RlMldBVzdybThQMUFVdlFHWURVektJ?=
 =?utf-8?B?RUppTXloNGk1MjVGR3ovakJhRGVTTnhCdXVKc0ZMWDJvV2lLeWN4Q3RlNGNa?=
 =?utf-8?B?Rk5kVjFlZHkxN3NTNUIvKytIb3R5eHB6eGplc1MzZGkwUmFLUDhsbmwwaUhQ?=
 =?utf-8?B?cmQxZ0svQ3IrTlgwSVRqZ1BmTWVhRHFCUFo1V1daa0picnNVa3RZaWNQT3JY?=
 =?utf-8?B?MnhCL05oMStmaStMWjdUS3lPdDhBbms0QkwvTzNTM0lQN0FoUlJ3d1pLYnh1?=
 =?utf-8?B?QWZjdUFJQm9jMDUyS2JITWhXSWpLQTk1SWJvSzhaQlBUdHU5dHg2OGpSTTc3?=
 =?utf-8?B?aTd4VU16UGtXanlkNHkzNUpOaXRqOHRvTnNuNnVBTXRZdTdqRTRQc3FIMjBD?=
 =?utf-8?B?S3Y3NmJ1NWpDaWpKSEljd3pLZTdoTTZaMlpvVENQWm94YlNEZHNlbHhqcm56?=
 =?utf-8?B?c3hacnhoUDhTN3VhN013V21nY0JPL0h1NUhRUmJRcXNXMG5kM0VjS2o0ZVRi?=
 =?utf-8?B?QWdVK09NSzcvTTBHRXZyK3J0Yzl6YSszSjUzQXNzbGVydzBabTA0d0FEV2JY?=
 =?utf-8?B?YjdaUS9UTkNJdTRJaW9LdUdKYnJlWmdycnRDbjEweFg0dUdxbXZEYTVsNnl2?=
 =?utf-8?B?YnhIdjdtK2FYdFFUc0dtMDFPZzJza3k1bjBPWXVpMEZKbVg3VC9ZNHlvcFIr?=
 =?utf-8?B?VE54UERONDVRK1pjdjdQM2FrVjJKNjEzZ1pPVEtyYi9jZmtSVW1vcDEwbmpP?=
 =?utf-8?B?UTBzS2tGMmZhYXNRaXVNUXI3aUE0SE92VzBtRWJ4cU5MVXFOOEtFV1B6dFM0?=
 =?utf-8?B?M2VVcnQwSnE2cE9TR1RjdzZHZ29CZTJvV2o5MVFKWUJWRnFVL3A5YkIzRFpm?=
 =?utf-8?B?QkE4aWliRi9SZ0VTb1lWMnBMdW1aTG12aGVReVVxSTVodHpuQzZzU3pNOVBj?=
 =?utf-8?B?UUFmaHVLRENoT0lCTkV2ZmdRdENyakkwYVFLQ09tRC9XVDJuOUphTkVsMDRG?=
 =?utf-8?B?MTFnME1Vckx0ZTh6M2NkOUlubVVJbFdaaU9aanpGcjUxM0RubmZnUDVUZTh6?=
 =?utf-8?B?eGJhNWlXd2h3RU1GSW5kVk53bDZXVFRpNDR3dFhKVk1TUjdxVFVNN2IwaUM5?=
 =?utf-8?B?REhESUhlZTBBOFpLem1lUllSZURsQUZzMDQ5U2xIU1BIRmV5V1NhTk9BMlRq?=
 =?utf-8?B?NnkrVmlYMHNPeUcyN3FhOE9YcXNlMHJGU2JxOTY3d3paSGduaGV6QnRGaC9y?=
 =?utf-8?B?b29aVjdpZk9BaWZQUFk5ZlZFcGdJNW9IWFB4ZTdpeUFwUUxBL1JHTVJLTzV2?=
 =?utf-8?B?bUhuQ29UZHJ0WXFSNktwb055SkRTaWljdHFoc3EyVzJ0OHRWNExiOEFjWldm?=
 =?utf-8?B?NW1kWmdYRXhWaFA0aldKUE1mVGYrQjIvZUh1M1ljVkVMcWtrblgxSm54cWpI?=
 =?utf-8?B?b1ZjWDF5c2h5SGdqTURLc3lGbFNTSS9IS2JrSERmWXh1bUxmVFF3UzkzRkY0?=
 =?utf-8?B?K0ZEL3NOTTRQN0kySWhFeStYUVNQZXhmMW0rc1VYQW9QbGNHZXk3RWJMd0Rx?=
 =?utf-8?B?UlhpMUpKOFk2M0dQWGd0TmVoTFVzMEtUTWtlVHBPc1dzZkQ1aFZqdFg4MElx?=
 =?utf-8?B?N1JmYnZONHUvU3lLS2p0Q3BWMkl3V04wSnViUGRIam9KNEJVUm5WUEZtUGJH?=
 =?utf-8?B?TU5udTVrem5HdzFhc05KM2F3WThYb0szYzdHbkxUZWtJVTJFN3RDVDZDdmg4?=
 =?utf-8?B?YzhERkUzQ0pBSU9JMmhoUkp6MVpsRU9zNFdkRlN0dUlRZ1FYcDVuU045QXlC?=
 =?utf-8?B?Mkw2eHZFNy9oL2RrcTVIYWpYREhnWGR6SzQvbEhJM1BKWGZoUEJxcktNemh4?=
 =?utf-8?B?REhwV3dHVnJIbEU5bzlrWmMzSDdkalpGY29ia25KOWEzUnd0aXNVbmxxbXZS?=
 =?utf-8?B?Z21hY2dXSHp2S0ZSNjRaZ2VoVTh5Z3N3QjBkdktWVUxKWExtNXkxbVExQmgz?=
 =?utf-8?B?MUY0QmNxcmRjRHlnaWU1a3l3cXBYT25YeTlHVERvMFNnL1ljRmhRSGxnd0xB?=
 =?utf-8?B?RE1qVDBoN0dlSEZET3FtU21Ld0ZrQysyQ2dGMHNaUFU1YkkrdGYwTUpnbjFD?=
 =?utf-8?Q?acbMUmsIsgIXk+bs=3D?=
X-Exchange-RoutingPolicyChecked: T1wXXGORqtiF43+TsJR42aCqp0ggP4o3Yt8f/UvRVh6XhzfAjsFbIz6qQIvKmC2Yx7gx8EvkV4PccOCtDDbNoBIRSA1B4hO82jQqLb2rmgEfEnZVOHSV/R97LTHgwRemfx9TyjmgXfkYiA7NQH4RLCRny9IpN6Nmzj1X9z/dNuYLbxq44NPuGtCNKcN8lO49uKcXzEHlCKceUOe/EC05X2vgVbz3cP87jQcatlkrRAh205o2jXm8V1CZ2LsLPYqA06nbvNwQreQ0wQtjPus+iwftMI8JDY1UYFdNvQqZUR4AXlKDMlxMsqoCPsdtp1fd4uXYXh2L2rQxMeMFKRGdPA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 48295ca9-bc3c-4a7c-2dc5-08dee25473bc
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6967.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2026 09:35:48.2395
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 59GWvk3AsgwSOIiEB/vnDG8+7Q4jo9NBMWuIbEGLEsEZ4+PKSbsfv+4ogJ3mQ+fhGQ0FJax6tBf7j79si9XB5aBkYo4QczvmGQELEE9trP8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7718
X-OriginatorOrg: intel.com
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[intel.com:d:+,kernel.org:s:+];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-119192-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ajay.nandam@oss.qualcomm.com,m:linux-sound@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:srini@kernel.org,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:perex@perex.cz,m:tiwai@suse.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[cezary.rojewski@intel.com,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,gmail.com,perex.cz,suse.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,intel.com:from_mime,intel.com:dkim,intel.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CBAFD75C8EE

On 7/15/2026 10:29 AM, Ajay Kumar Nandam wrote:
> clk_set_rate() returns 0 on success or a negative errno on failure but
> the VA macro probe function was ignoring it. Check the return value and
> bail out of probe on failure.
Ditto as with 1/2: _is_ ignoring it. s/was/is/.

A patch is a proposal, there is no "was" until it is merged.
Code itself looks good.

