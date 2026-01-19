Return-Path: <linux-arm-msm+bounces-89650-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 147D8D3A8D4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jan 2026 13:32:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6A607304909D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jan 2026 12:31:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9875312812;
	Mon, 19 Jan 2026 12:31:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jGZEXThl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C9CF2367B5;
	Mon, 19 Jan 2026 12:31:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768825882; cv=fail; b=daZlIUpvGUwmm6ZBdCxyVEvomkzd/u/qFJsglkp4MKF/xBp9LcagADOjl90/4y7mUYSfZgtX1TRTqJ5J2zDXcTChdhayYlIWdBn7CVCFyKwP/uzlJjCLTYXKUdnaxEAiglVWcycWqQepm02s0NNEjbwIChagaE7tjVLIFMQibFc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768825882; c=relaxed/simple;
	bh=MscrFbeajepyD9qSH8eEib0XKa0TMGa1EF8Ma4MKdfQ=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=FbNObRwopiJU+BU7G+eFoElY49PaKYW3SNZX8sQIGOT7UzETCrtN3hvPcfXk7V7Q8Hc3mZSm4Pjl0aU5SwXU+BYNp9W6CKmTwzb6DPSzjZ6YelbwtBdoRKSYAJ7+JzeNiC+imoUyA+whw8XwV8bO3P8PCEFl86S/gDS0XEI80/8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jGZEXThl; arc=fail smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768825880; x=1800361880;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=MscrFbeajepyD9qSH8eEib0XKa0TMGa1EF8Ma4MKdfQ=;
  b=jGZEXThlGz3c1GGORCcfBT08yNqzRdNkVSHEwm33KUa2mwBKg9LU0UGX
   uoxUy9bONcAOAJQoMj236oM8nxv+Cf02nJU67wgCxVCow5wnv8SpfA+QH
   U8L1Voo5i+T7occWDVbGuze+9NKwpqYlk1nhJRtmSkkWCfp7ViPcU1Crm
   oLYUN++GNG6kGpp0wCOtDrw9Ls7PUietu/U93x5rE2Z1TSy1FZw3wMlSj
   v1bYHcw1hfUhNVPScUwIIpzp+2fPXVCEvEAyjIyoLIyuKfu7k7pfTek3x
   1g2JTMJGESpmoF8FpY3wDQmf577sv7bJqOEYYf4Z/tV0OyxwHCrc6USKl
   w==;
X-CSE-ConnectionGUID: AwH6Xs1CTa+ewq5tnbIIoA==
X-CSE-MsgGUID: QF/1K8omR8mIwkZh1Me2lA==
X-IronPort-AV: E=McAfee;i="6800,10657,11675"; a="57589021"
X-IronPort-AV: E=Sophos;i="6.21,238,1763452800"; 
   d="scan'208";a="57589021"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2026 04:31:19 -0800
X-CSE-ConnectionGUID: H/38MHmiTTW1Gkm9IBEu1g==
X-CSE-MsgGUID: j5sKBPWWSqi/WL5ypuMVZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,238,1763452800"; 
   d="scan'208";a="210360481"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2026 04:31:19 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 19 Jan 2026 04:31:18 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Mon, 19 Jan 2026 04:31:18 -0800
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.17) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 19 Jan 2026 04:31:18 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vsFtt7IAKAu5jiY8r5epUeqae7npuJRSkXhxW1ZA9rLZiOhnByToa8vgTqjhnFvC8ERtDI8IJKbeu1WMuWzYSoRiG1DABmkHtQDa6veTCYfiPxe/PUtnP0stP8bhlkRDSXjZOqsSYvRaP5wQCzqZIcWRGdUAm1SazlPUF1bzmHYcZ8lupItv0YjZKRnypgRZ3zZR5Lvo9Crj3LX+wY83/ssdRsFjfmGQDtQBGJ4tuxMrgrHRWslVt/h8/chYuZ9viHCQ469MCed9Le31p39TCkNHLJ5K6Q7fXBju/2dr95lQXK7BkD1oGt1rJ5B3WL3NoLQvRlPv4yOntrMdEsheSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TMSZbXws/tl6gzKiKcAj5UqgRoHw6qg1fdFbiPYHCAc=;
 b=VeBdphkJJlvGAgS72YYSqG5WOyls/naGvr8ORT1yQlK9hL4rvi6g1XAmfqgytCn9489Lwna9qPjPFaqqpr3oUN25Q/LwhigfkOii5RH47r17h7ptN2r0DBBxq62T9s7MGi3iTwODyiITRyrNG6Ije0tggulyLO9aE+F4BLYfQAk8VYusFaD13RMzqRvqjZQHmVkREILM4jqERvWdIoyf5H19nSGVFoNcUYHO1luc6YhaKQ6iru2HPb/EMPJBfmXvKPc0iF/RPG4/DSpxcm68fwTt1lOUg4mc3TogzfxnDEQHnGDW5M6Ta6CfQIBsWqkKs1b09iB8X41ToXZVmu3xXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7198.namprd11.prod.outlook.com (2603:10b6:208:419::15)
 by SJ0PR11MB5938.namprd11.prod.outlook.com (2603:10b6:a03:42d::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.11; Mon, 19 Jan
 2026 12:31:09 +0000
Received: from IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::2c4e:e92a:4fa:a456]) by IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::2c4e:e92a:4fa:a456%6]) with mapi id 15.20.9520.011; Mon, 19 Jan 2026
 12:31:09 +0000
Message-ID: <16c9c334-ab2a-4d24-9467-9a8faf572442@intel.com>
Date: Mon, 19 Jan 2026 14:31:04 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] mmc: host: sdhci-msm: Add support for wrapped keys
To: Neeraj Soni <neeraj.soni@oss.qualcomm.com>, <ulf.hansson@linaro.org>,
	<ebiggers@kernel.org>, <abel.vesa@linaro.org>
CC: <linux-mmc@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Wenjia Zhang <wenjia.zhang@oss.qualcomm.com>
References: <20260102124018.3643243-1-neeraj.soni@oss.qualcomm.com>
 <3a93822a-6ca1-4cc1-be12-38b2b04704da@intel.com>
 <23c9f3b9-f575-5bc6-e7f0-46238c26a7e5@oss.qualcomm.com>
Content-Language: en-US
From: Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park,
 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 -
 4, Domiciled in Helsinki
In-Reply-To: <23c9f3b9-f575-5bc6-e7f0-46238c26a7e5@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DU2P250CA0013.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:10:231::18) To IA1PR11MB7198.namprd11.prod.outlook.com
 (2603:10b6:208:419::15)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7198:EE_|SJ0PR11MB5938:EE_
X-MS-Office365-Filtering-Correlation-Id: 2cf99deb-7071-451a-3941-08de57569f79
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Q3k0NW5HRXJuL0d2WVlEQUNPRHdOclJ4dXlnYmozUHV0VmJWS0dPcFdCdFdO?=
 =?utf-8?B?bGVkTVJ3ZVVvSHJLT1dPRzMxREJTY1QwT2EzN21GZFRPdkJDaE5TMHdNSzF5?=
 =?utf-8?B?aEhTdm9BT1VBV0ROTWRCeXlXYXM0RTY1MVN5L0xrT01qM0phTWsrRHBueXh1?=
 =?utf-8?B?QjhpVzZEcHk5dTBsNDZWbjAxakl1aVBtNFpIWEhwYzJ6S21DTlhMNnM4QWtt?=
 =?utf-8?B?NEtyUmtuejhXNXpId0I5cVpRbVFaRk5LWEhoNWZQZUNaalVSNHYrT3hqU2RS?=
 =?utf-8?B?NVNwVkY4ZlhzQzZSdmpwYVFkNW15aDJ6OVg4dVpPMmsrai9TbjVzZWhTR3dK?=
 =?utf-8?B?NkUxaStWTXY1YXlBb25NakV3bnFiVnk1R094MVJRNk9FOFVwVWp6cmRkVGt1?=
 =?utf-8?B?ZXozelNWWFIvNkNDWm1ZdnFjYytBL1p5SGs3b1UzVGl4dmFZSnNBWDZCSWp3?=
 =?utf-8?B?TUg0aDNldk50Z0pwd1Q1RnQ0MktnZTJyeTB3em9UeHo4YWFHOWp4WWdNbDBB?=
 =?utf-8?B?Q2Z4RmFPQlFMSHVZTXNkblVZOENqNU9UK05ZR1ZkTEdWMVRKS0FHSVB5NVlq?=
 =?utf-8?B?eXc4a1RMSkZLZk5qYlIyNlRtNUNXU3BjTXc0TzQ1Z1JmeFNCRU51c3h6RER5?=
 =?utf-8?B?SFJIUGJqdVpseDFXaUlvNnpNZDhPV0g2VzNIWFJ5RUp1NUdldkRsa0kzMlVT?=
 =?utf-8?B?b25OWG9PcXZuQVExV3J6TG9ibTNIYnZlUHhsTEFPQlkwU29VM3ZKUWcwTDdS?=
 =?utf-8?B?bUpXOWZPQ0FSSDhCbnRZNzdjd3hySVU3YXk1TUU2YlJNcElWVmlINkJ2eFZL?=
 =?utf-8?B?ZWZsM3F0KzR4bERxYnNsUThnNUVWUDhZL1A0TmUxZVU5VWY3bHp3c29JYVpH?=
 =?utf-8?B?ZXFhMUQ4eXZjN2M4d200OHZuSmdZelN3cnFvTU01M3ZZSGIzZURQMldjc0d2?=
 =?utf-8?B?RkVqVmVIbWtvNW9iN3FYSzAybjhMeW1wcWUxWkZuRlZxY0hoV1pUS1llZ1c5?=
 =?utf-8?B?OWFVaWdvZ3pzTzJyWUpzOERLQnl4V2NGRXRieHNVSmRXaFRLUEQwTldHTUd0?=
 =?utf-8?B?dkNHM1lIMnRMalAzUGJzM2tBd3UwMHFzN1NtN3JCZVNoV3crcjYvL2JyTXZv?=
 =?utf-8?B?OTVCMng0ZVYyWktwQnJwWHQ2UW0rNjJvTzNJNktlczNLMWlUc2xCZ2ZZeGht?=
 =?utf-8?B?THdVZTRuN28zN0huakdvWE5TWm1sOEo4bHRibFNsVS83dlZuOGhVN014Nk5m?=
 =?utf-8?B?N1NOekhMRVpjREY5Mzh6eFJjSFM3ZzA2TFU5SktqNkVaWG02Y243NGtJUm1B?=
 =?utf-8?B?ZlNrVnJPMloxYkx6YWpnMUxvMHlNTkIvZGJNdmN6Q2hiUW5zbmM2K0FGaCtr?=
 =?utf-8?B?NDVvWEpoQ3Z5ZkhxeTlEMkRwUlM2S0YxTk9qbzl1ek9ucmRnVXJBSnJ6QlNK?=
 =?utf-8?B?QlV1YldCN3FvTWNqcFFOWk9vVVdqL0FNdFgyN2tUY0JGdUhNclNDTTVobGlM?=
 =?utf-8?B?dVhIUitoVnB0eG41RURJcStaU3pmbGJkdjBXQzFFTU0vSENkdzFWeUpGVlI2?=
 =?utf-8?B?d0U5UUgwc1ZLTzJ0MHU5THdqRWJqZUViT3RNbm50N2h2OTI4eTJIbTQ0NWZ0?=
 =?utf-8?B?aXlBZ2k2TWMyZ2ZEL0hrQkFBTmdYeVQzMXRzbm5jMHhpeXdaUkE2NWlkMm51?=
 =?utf-8?B?SUVZTkFBalU5ekJmeHpsbVdwclQxVWJFSkdZa2s4SXUrTXNXVUJPSTlacktV?=
 =?utf-8?B?SHMxSUlwSkZRcXBBSjhCdTNnVGMzQks4ZkFUQU1ycTNkbE9XMStnaTJ5QTR6?=
 =?utf-8?B?YmFsT0d3R2lSUktwM09McHV3cUk4SXoyREIwT3lhMFdwU1VISEF1bkM0MVlY?=
 =?utf-8?B?RWV6aEI0YXVOQ0g4YWNEVW13NHJFOFR0MGZEeE40WWJPUVdFcUNZcmlVUEZj?=
 =?utf-8?B?S085SUp4eVplazYzVnJLdmtUU05NRDYyaDBRemd6OXJWNUFiUVR3U0djVkdH?=
 =?utf-8?B?RjZwTDJEa2VVNGloeU93blM1eG1JODlBL1AvdEF1Y0J0MEhVNUxoaXJaQ1lM?=
 =?utf-8?B?SytyTmV3YlhjelVwNWF4bGdqRkIrQkhhamlWeGNwcytJNDYvSlpuc0lQZEpS?=
 =?utf-8?Q?mhOU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB7198.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SENIWDJRZDltN3lCSUtMZFZ0djdCWTlMbUZKZmVvZkFoMFkyTUlMSWFNNENp?=
 =?utf-8?B?MnVCVUNlNVJ6MVJzZ2owQWRlc3o4dFB4ZXBva2plRlhBeEhSRnA0RGxsd0tL?=
 =?utf-8?B?MVJBY1Y2TFNUWjlCVCs1MkZ2R0I3blZTQnBNVGwwOTQ2VFFSRmhFVmpabUpF?=
 =?utf-8?B?Tzg0bkVTdXhEWmdiRXo4a0c2Vzc5WlE5a1F4RHRPZ2kyL3VvNUUzcFhBOHYz?=
 =?utf-8?B?MmtvRlptNGNtZUtOYUdrTnRwckpSK1dGWk56K0Y1U2paeG4yZTFWUXdqVmRq?=
 =?utf-8?B?S05uN0xYWk5OTmhWVFhXYnlYSmhLQjNWZXdNT3JrWEdiZHo2Wi9hMHlDVEx5?=
 =?utf-8?B?UGZ6RkNGZ01QRksyb0EvSWgrcFhpcmRFTUxhaWtRNG03a2xNZ1RnaVM4bkxn?=
 =?utf-8?B?NTI4MDRtaW1MS3lMN05IeG9CSDNteFlIa0k0QWR2dGhreFV1eXF5VEZKR085?=
 =?utf-8?B?MDFEUXcvNmtIN1BVbEhRdGhudnhMSWtmTitidnBKNlFVbFZBS0NsOGpzV3lp?=
 =?utf-8?B?SjNCWlA1K051N1o0clhnckl6Uk9XZXZQZzhRczJiNGNFZGhyL1NyUVFWRnBq?=
 =?utf-8?B?a2ZZaVpTVytCUHM2VThWdUdiM2ZUOUo4bzRiTldveVJOV2RaK0puMmo3M00z?=
 =?utf-8?B?eGd6ZkFrV1RnRDFnVGlXZ1NvK2xIQXA1aDRRZHl4Tmo0bDhEU1U4VHZqZDZS?=
 =?utf-8?B?cDJNVStYcWY0VlUxNDZOczl4WjQyMGRMRHJlaURibFV1cTRyYmwwdy9NYjlk?=
 =?utf-8?B?WkY1R0g3aU9NaVZseDJGTC9BTW9WWmd6cml4VHl5N3AxZWdyT2xxL0RWV2pm?=
 =?utf-8?B?VGJ4QXFEb2Z3Q05OeGxIVFhaTVFTeXNGZFpCMUdoWFNIZnJzV2pKWkdVbVJS?=
 =?utf-8?B?ZjZwcDR3OGZsZlBEYjJsZVlZSDhRMVgxczg1endVY3h4YmR6Ti9qZWRmMHdM?=
 =?utf-8?B?RGM4Smd1bmt5S2ZLUjFJZ0dWWWxPQTBaWXY5aGNYOFdTbnpzTzBSRkdJS2k0?=
 =?utf-8?B?Z1Nha0ZYTVF3S2dicEJTSVJQaTBYc0U0U2hOQU4yblJndS9CRTBremNpZjZB?=
 =?utf-8?B?cm1zdWk5Vm9XWncyeElWOElnTmQ2Z25IS0pyUFRPY3ExZnBZNzc2eGp4RDAw?=
 =?utf-8?B?bzJYODE1QWZtc1EyQytJbUt5U2kwbDZmSmZ4bGZwK05Hc3UzcWcybWhnOXk1?=
 =?utf-8?B?eWRWUEdpcmt4VXlaWUtQUXloTm85eGVlL1BLYWl6MGZodUkrN2ZrTm1SLzFI?=
 =?utf-8?B?RGxPNU1FRk1ONS9ySitNaVc0NUpxVzllN3lyaHlYZHI5MUFWaGxZL01GRjNN?=
 =?utf-8?B?Z2krODFpT2F2NUdjWGcrcUppb042ZVpiNWtrNnFKb0lZYmNKWnFxcW1ZYjRk?=
 =?utf-8?B?ZDVCZDJSK2hSMDlRRXh4MkdaZVE3MDFuQTBKWGVOUklMdnc3UkZJemJaK1N6?=
 =?utf-8?B?NGttTXV1bEZkbURlb2tES0FreUxaOFZsZ080K3lxdTBudkJnSFJFMUhxNEtq?=
 =?utf-8?B?WUlnOXFBQklEQVlNWW1TQmVkeitYU21hR05WTThabStxcWlRTXpKWXEwTFM5?=
 =?utf-8?B?MFhvQUFXaThSYUZvdDl4UFF0VjRkOVREc3RBVjVpVHpmQ1JZbmlDemdBakRr?=
 =?utf-8?B?bE0zOTBEdklQYWxhUmlPYzdPZ3UvbC80NThKOUV6TUhIbEoxRjNtWGFRcTdp?=
 =?utf-8?B?a2FnL3hGSVlYRFV0TlMxd0k3bDRtVTdEbnN3QXpydHlseUY5ZldsbzBIMUla?=
 =?utf-8?B?NTJ0MEh1bmNUR1kyWk40bnJGb0hGTVdQK3BWNDY1NHR5d09QTFNsSFRaREhq?=
 =?utf-8?B?WlE0R1pUdEVnajZlcTh0eGpwMjcycUdJU0U5Q3FMU0toQndrci9PUFlCV2hh?=
 =?utf-8?B?cDNuempjaS9QbjR5QUp5OGtYc2lXZFVYUXhrM1ZxZTl3T0lTZU9KSWZCQjQx?=
 =?utf-8?B?d0VBZEpwVnptcEM2TkZLR0liem80ZVBBMTRJUjlPRWRjVnovMUJiQzIxSDZ1?=
 =?utf-8?B?UkcrbzM2RGFBM1Y2K3haS3BxY0xqY1JvRnBNSUUyRzR6VDJsamJPOTUwemZs?=
 =?utf-8?B?RFRpL2JQR2k0UUE1L3VRWlM3a1hrdVY5WXkzL1NCY1FoQ3dZbkZBcmIxZkdV?=
 =?utf-8?B?b2RiMjhkc3oyYzZYMTRreWhka0ZjTmg3bStqODNSdTZYemFRR2lWY040eWI3?=
 =?utf-8?B?N3dobHJwMlVHcGtyOCtaR0ZWWGVSdisyM1A2QzBOcHZMa1BBemt0eEZWcjVM?=
 =?utf-8?B?ak9McVBuOHNqVVVodm9YbTVITUFXZG1NVGlmNHJjeUFDK0hFRTVUcGxjZUtY?=
 =?utf-8?B?Si9ZMFFtN3NsY2J5S3FzM21KTUtTZWNBMkQ4TEsyS1p3dEpPRWFWZz09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2cf99deb-7071-451a-3941-08de57569f79
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7198.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2026 12:31:09.0192
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 45a2h7ez881q36P5YEN3D9dAgd+swZJ5U5l86nQyUv4Lch2z868hR2SMW8KQ4PWFJJBIbEiUrz7tHFFdR1JBQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5938
X-OriginatorOrg: intel.com

On 19/01/2026 12:19, Neeraj Soni wrote:
> Hi,
> 
> On 1/12/2026 12:35 PM, Adrian Hunter wrote:
>> On 02/01/2026 14:40, Neeraj Soni wrote:
>>> Add the wrapped key support for sdhci-msm by implementing the needed
>>> methods in struct blk_crypto_ll_ops and setting the appropriate flag in
>>> blk_crypto_profile::key_types_supported.
>>>
>>> Tested on SC7280 eMMC variant.
>>>
>>> How to test:
>>>
>>> Use the "v1.3.0" tag from https://github.com/google/fscryptctl and build
>>> fscryptctl that supports generating wrapped keys.
>>>
>>> Enable the following config options:
>>> CONFIG_BLK_INLINE_ENCRYPTION=y
>>> CONFIG_QCOM_INLINE_CRYPTO_ENGINE=y
>>> CONFIG_FS_ENCRYPTION_INLINE_CRYPT=y
>>> CONFIG_MMC_CRYPTO=y
>>>
>>> Enable "qcom_ice.use_wrapped_keys" via kernel command line.
>>>
>>> $ mkfs.ext4 -F -O encrypt,stable_inodes /dev/disk/by-partlabel/vm-data
>>> $ mount /dev/disk/by-partlabel/vm-data -o inlinecrypt /mnt
>>> $ fscryptctl generate_hw_wrapped_key /dev/disk/by-partlabel/vm-data > /mnt/key.longterm
>>> $ fscryptctl prepare_hw_wrapped_key /dev/disk/by-partlabel/vm-data < /mnt/key.longterm > /tmp/key.ephemeral
>>> $ KEYID=$(fscryptctl add_key --hw-wrapped-key < /tmp/key.ephemeral /mnt)
>>> $ rm -rf /mnt/dir
>>> $ mkdir /mnt/dir
>>> $ fscryptctl set_policy --iv-ino-lblk-32 "$KEYID" /mnt/dir
>>> $ dmesg > /mnt/dir/test.txt
>>> $ sync
>>>
>>> Reboot the board
>>>
>>> $ mount /dev/disk/by-partlabel/vm-data -o inlinecrypt /mnt
>>> $ ls /mnt/dir # File should be encrypted
>>> $ fscryptctl prepare_hw_wrapped_key /dev/disk/by-partlabel/vm-data < /mnt/key.longterm > /tmp/key.ephemeral
>>> $ KEYID=$(fscryptctl add_key --hw-wrapped-key < /tmp/key.ephemeral /mnt)
>>> $ fscryptctl set_policy --iv-ino-lblk-32 "$KEYID" /mnt/dir
>>> $ cat /mnt/dir/test.txt # File should now be decrypted
>>>
>>> Tested-by: Wenjia Zhang <wenjia.zhang@oss.qualcomm.com>
>>> Signed-off-by: Neeraj Soni <neeraj.soni@oss.qualcomm.com>
>>
>> Doesn't apply cleanly to mmc next.  Otherwise:
>>
>> Acked-by: Adrian Hunter <adrian.hunter@intel.com>
>>
> Is this a blocker for the patch to get merged? I will anyway see why it is not applying cleanly on mmc next
> but wanted to know if this is necessary to resolve for these chagnes to get merged in Linux-next?
In this case, it is up to Ulf, but in general it is inadvisable
to assume a maintainer is willing to fix up patches that don't
apply cleanly.


