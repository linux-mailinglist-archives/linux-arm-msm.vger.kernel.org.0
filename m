Return-Path: <linux-arm-msm+bounces-87911-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 570FECFE2EF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 07 Jan 2026 15:10:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 49BC8300889C
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Jan 2026 14:03:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64A3432A3C9;
	Wed,  7 Jan 2026 14:03:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VYVBokaG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08E2532A3CA;
	Wed,  7 Jan 2026 14:03:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767794624; cv=fail; b=LP7qZtaYGAqCwhI+4MPnrhlug7JEOIqkHWhib7Zep5g7lVU3wsSlf093DluIqj0P8b2Rc2rJgm7ACWXML9lGVFQsRJBFwPzWhfxLGodLkv9LOc4pR4xjCNkHmFF/Dan8w6/8qukQukulen2wtU/XS7taINVtuUltgH6u7EpJTgs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767794624; c=relaxed/simple;
	bh=3DL5pTQQd05KlCtkG+dWsbBlXip2dYjAC8QM568rTuM=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=fXiJvxHlnd0HqHsFGf3c4n1ke3faeekrBW2JoLKzQ98upHzq6Ho1k0ESD4xgpH6+ExzCtkIr0whSgywX85TXG7r4nyliSnL8zKA6hzxKbpCNHpvtWtGvr+AtZEQOqo8arWu+3NlVXugUXoI/YrPkjLgT68dn8SSj4SQ6igxpjt8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VYVBokaG; arc=fail smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767794622; x=1799330622;
  h=message-id:date:subject:to:references:from:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=3DL5pTQQd05KlCtkG+dWsbBlXip2dYjAC8QM568rTuM=;
  b=VYVBokaGWE1UGd6I8tm+VGt1bp7P78NoGOfZG//na0eMfIwHA+JJXuiW
   QdOKyn6CdewqpekF0SZFS3YeLPbhYtDwlx7/UgcFwJXpm3ZcCAT8M6OMa
   Ty4BLcveGxAB9+o+ozJBZPXB8885tKfAI2PJDz7PFmjasKmmxD7KItnwf
   n3DJyGUFFjhAsGcEm6MCNsj0geA6E58j5QJkooM/A/R6pgCKexVkK3+Kz
   yFF9dbWDAh6D5tcIS/SuCFE9YWtmBR72OOTQWTXGEZU4MpvLaj435eoHQ
   N4UMvwqQTGeQzqwxMNg0QxlkldFsxgajWwCrMJK/Ztng7P5OgJggN8nqr
   w==;
X-CSE-ConnectionGUID: lrMo4grpQRi1c9aYvCgSaA==
X-CSE-MsgGUID: pLlUz0TOS5+JnAxxzDQGYg==
X-IronPort-AV: E=McAfee;i="6800,10657,11664"; a="73017173"
X-IronPort-AV: E=Sophos;i="6.21,208,1763452800"; 
   d="scan'208";a="73017173"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2026 06:03:41 -0800
X-CSE-ConnectionGUID: 7shcBngIT3WhVxvUsJgpqA==
X-CSE-MsgGUID: BKB9bFj3SE2pjPtBQuVGNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,208,1763452800"; 
   d="scan'208";a="240411306"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2026 06:03:40 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 7 Jan 2026 06:03:39 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Wed, 7 Jan 2026 06:03:39 -0800
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.5) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 7 Jan 2026 06:03:39 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I4uc5gAf5idGegAEd7ERD8Sy8HW/MZAV+LWAfKliBvlf80KDuvJS3vuoKnBd1LjPTDsMCDgnSwJ5lHfEzNNKznzEAmcdtMVFpENXmbAYm35IAj2Xo8xxWmskyIlGNDvPaWmyqy5S1SMpDxRmHiqfxsvmWakd7j5o2J32nbM292iklT4D7s2yEQ+5eUYVIODjwX4sQgakBeX0wK79Kbx4r2+LpSqPfq0I7Gg6Co/ziXBO5SVoseN8jF8YZFMZ4Jj/sfgkDpEtwHEU8SstKJASSkD7wUtzLvB0xtuqG76DzhAfRv4ctM+r+KuW3U6sqJKRmzO9SDRZoXSqKgYQTCnoWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ki9wqtt/uga9bGnQu99QhLUOLliH52FWEUe+PuIF1eg=;
 b=OyjV+iovrp4uxGyWNwL2Cx/hOC7fp4B5Dxo+kbxKI8XXJ2wjG7yax4+A3ZgRJqC3a6/QNKEM8IItnpM+wF8Uur2Y7qNPeCyrF9eE+1s6eIEho60PWLrIzHlO2cD4rsXxaJ6CQe9ecYW3hnWsdooL/685+2iOCtbt0sYe1FPJBwMADIQZ7xEL7IR9GGrgSDJANG942Asead5Opj/ea6uXmtNKZ8ghFNU57aClDND4xFWbqHRg11Ry2YZ3p8NBqghi0dR5SvaNREcgKqzuLBWGXb9aiYXGjNZvQafCs1YUqZRdZQjC6dmBlNXtULcLeFyZSP3DpnuSVs4Id3HwwuNkrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7198.namprd11.prod.outlook.com (2603:10b6:208:419::15)
 by DM3PPF6C1A2BDF1.namprd11.prod.outlook.com (2603:10b6:f:fc00::f2b) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Wed, 7 Jan
 2026 14:03:27 +0000
Received: from IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::2c4e:e92a:4fa:a456]) by IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::2c4e:e92a:4fa:a456%6]) with mapi id 15.20.9499.002; Wed, 7 Jan 2026
 14:03:26 +0000
Message-ID: <db79d30b-03ee-4e98-baa4-c0201f4eca8f@intel.com>
Date: Wed, 7 Jan 2026 16:03:21 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mmc: sdhci-msm: Add quirk to disable CQE for ICE legacy
 mode
To: Md Sadre Alam <quic_mdalam@quicinc.com>, <quic_asutoshd@quicinc.com>,
	<ulf.hansson@linaro.org>, <linux-mmc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
	<ebiggers@kernel.org>
References: <20251224101050.3497746-1-quic_mdalam@quicinc.com>
 <f65f1647-3c95-41e0-8c6c-a25d835fcf35@intel.com>
 <0c33b361-8563-8aef-53d4-6158b358fb72@quicinc.com>
Content-Language: en-US
From: Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park,
 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 -
 4, Domiciled in Helsinki
In-Reply-To: <0c33b361-8563-8aef-53d4-6158b358fb72@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DU7P195CA0016.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:10:54d::23) To IA1PR11MB7198.namprd11.prod.outlook.com
 (2603:10b6:208:419::15)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7198:EE_|DM3PPF6C1A2BDF1:EE_
X-MS-Office365-Filtering-Correlation-Id: 722e0112-0e39-4760-00c1-08de4df586f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|3122999012;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UXMzT0c2MnRObGZpWCs4SjJQR0UzNVVDQkNCRnpjSVJRQ1RQOHBySE1jdFFj?=
 =?utf-8?B?dTdXRHJhUXM2Kzh3TWhaK09YN2QrbE1JSGp3MnVSemhIekRnUHRncEs5bndV?=
 =?utf-8?B?clZsbWYyYTVkT0tVaWNEYnlCYlBJWkFYcmpQK21URXduMDZGVVdVdm5iUlJi?=
 =?utf-8?B?SENyWEpsWVAxb3RpdTJTRVRxQUtORVVVSndUSllIUXdYM2J2eS96QTJidUNs?=
 =?utf-8?B?MEsrSVVXRmozYm5zMkxWYitXT0I3cmpUTGxTcFVKT0ZGVXR3WEh3RUdzYXRo?=
 =?utf-8?B?QzZoeGNNcjliVnlYaGZrTFUvUGgrYW5maEJkRmJ1VUxYZVdUd2J5cHpBaXNE?=
 =?utf-8?B?OHMySEg4ZlRqWXVwb3NvTnZnNXRRYldWWjhQMG9MMjFaS1lVQWsxY2ZBVVVU?=
 =?utf-8?B?K2YweEhWWjhaSnRkR1RMNTdkK3U1ODdKSUk5MnRuYnR6K2pZazJDMlBKdFR5?=
 =?utf-8?B?WnFmQ1h4blBIRVpwaEpqWVZiVnVWZVRPYXVEdTRseGp1ZlhUM253UitJQzJq?=
 =?utf-8?B?eFAzc1JSUGUyYVI1MWtmZWxZT0VQWkpSYVVLdHdwSVBlelNlM2RzMnRpVGk5?=
 =?utf-8?B?NWZmWXZZbnRpT0R2dTJVK1phSjU5dTdVTWE0V21OMkhPekV4cmlpbUhwY3Ju?=
 =?utf-8?B?ZG5lenZlZ0t2ejNqZWFPeXJXNkd2MncvSHREaVlydVBlNGdUVUkxcGsvS1pv?=
 =?utf-8?B?OGFTdnZWUlNtbkswZ1hZMU9Ka0Y1RGY2eSt2SW9PUWVhaTJqK01WaW5kZW9U?=
 =?utf-8?B?SnVveitSSjVmdEVVS2hVb29RYXdYSlk2V0FmbVVSZVU3dm1JK0RucWZQUlRa?=
 =?utf-8?B?MjBtSWtxSUFEcGJiaWozN3MrcTdWcTRnOFlpU1kzazNBZldZYUpweEo4RXF6?=
 =?utf-8?B?Y0E1c0xsVitJVkZGemhHcjYxY25TMi8xZGdBWjhFSHpldXV0UXlLRGNjSStW?=
 =?utf-8?B?bVdnV3BhS3hUdmdMdkRSQjgxOUdaQ05aYTZZbUpncVQ2cURQTTBHcUR3TVQv?=
 =?utf-8?B?K3pIUWxQczJGWVN1SmJHL3pHUk5TR3grSzNhVm41WHlrQVBoWXZUSTZnYTRs?=
 =?utf-8?B?S2J1blBSVGVwZUZmLzVaaGdveFNJaDJVNHlWRm5BbDlLLzNtMVkrb3VzVVd1?=
 =?utf-8?B?SVVGVy9MRzJXUXMwS2RUS3o0dW5YS1RFZ21LY0tLOGs4c3M1R1J4cUVtYnEw?=
 =?utf-8?B?dTZ6L0F4MEdVd0xzWUZUbXNadWNHRUIyK3lUOW9ueDFabHFWZUp3Wjk4ZVkr?=
 =?utf-8?B?WE1yaEZuU0RDeUlOQm95NEhJWGRUcnVxeVIzQnZXWEo1bkJRbjNhcHhZaVhy?=
 =?utf-8?B?UlZnblNWM1M1bWZqakU5MUR1UGM0dy8rcEgyV1QrQW1mOGsrcTNpbkx2TGs2?=
 =?utf-8?B?bGxqdHQ4aDZrVEUwdCsxTHZUQ1pWV05JdWhMSldNc0dBaVZ3clgxRUFmaHlz?=
 =?utf-8?B?NDBuVG9uZWZHMGdtajRsbFdrTVpkb3NsN3IzVHZOcVJML2VUc2JTRWFTZUxK?=
 =?utf-8?B?clMvb1cvL1FZWnpNMU9Wa2dpT3FKZnBEWDEyVElMV2tSRkZmNEdFSkxrUGk4?=
 =?utf-8?B?NGpZVWdsVmlWZ3Z1bldBb0xUR3pSZ2JtQlh3R3lhWDQ3MGp2eDIvcnRMNkdl?=
 =?utf-8?B?ZExBV1BodjRHanpPaVkvZGgvMTdpaVNpemRTaE1zdURQd2hvMnJUS3FnOFFk?=
 =?utf-8?B?dDBoa3FKY0ZKTG5lMVVrSW91ZmkyK3YyR1FiYWJlZFlnYzBTdTZZZXgxaEph?=
 =?utf-8?B?bHVhM3ZMeFBxZWVRbXZVVFpxR28yV2NXcmtLYzlIUkRkLy9SZFd0aUJyYjNS?=
 =?utf-8?B?RXdjYzYzZkxWemxncGt4dGFRUGcrNFA4WUhobkZnK2ZjZzVuRUxjT2ZHMXBn?=
 =?utf-8?B?azlHWi9ZTWFIRWZQT0tKbUl1aW81aFNMR0t2UzVDM2N1ckx3UGpuZnh2ZXg0?=
 =?utf-8?Q?htOMuTnaynN9uMObMtwc8CW948WvpId+?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB7198.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(3122999012);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b1ZzanVId2JlNmZPdmM4U3JhRWdiSmFoL1dyQk1Xb2U3S01RbjRQZjdHVmF4?=
 =?utf-8?B?WVk2ZTk5ZVZGUHdiaUJpaDJlYVFZZ3hETWVXMk1NOE5DZGJIL2s1TkFRSk0x?=
 =?utf-8?B?by9LU1B1Rnd4VnNualBydWw1enkyWmNWRDV2MFovamFWRGR2R3Y2VDNnWHVM?=
 =?utf-8?B?NGRweEVtYWpnZGxXOE9PY1dXU0RnbDE4Wnd3b01GZUFsR3Jaa3p3WFB0S1hV?=
 =?utf-8?B?Nk1aeWJHNWE2aVdGaUNndzBkYzJMcVlkL1g0WHdtVVNWUHlCM2drN0t5ZENl?=
 =?utf-8?B?UFg4UlBBQjFqWTZrSS9weVNaYUNKOTc4TGF2MTdqc2wxTWYvZzhEcUNLTjZz?=
 =?utf-8?B?cCtzcHQ1dWVmakJTNHF4b1piZDJJNWFRWS9SaGp0QmRNNWoybFRnaUVQS2ZF?=
 =?utf-8?B?SWxWMGcrVVJmRWJLczlSelNLamVGYi8wdG5sMGNzMmg1VjRBK2pyUllDQmp6?=
 =?utf-8?B?WmdxNysvd2xHdHVXU1VSeEZTN0lHNUJLVm42R0NiZHdNeXVDL01vUitXU3Vx?=
 =?utf-8?B?VkpSTTE3N0Q2eDJPUVZKSThPNC9ERlpKOXRlb0JmbldHaXhyalBTTW9xM1la?=
 =?utf-8?B?VEdyTU41cGNqMUJNNGZBUDM5clFUQWJXZk1idklWbFNvQmltUjRNeVB1cDYy?=
 =?utf-8?B?WmUzZ2NKS1Y2dUI3a0dPWkN4V1oycXNFcWtqQmlFcS9CN1VpZGNpK25sdFE1?=
 =?utf-8?B?SlRNaktaeGpHd2xQbnlIeEJOMU9yWjVkeXVSZDZ3ZlJLV3ZERjNMZU5PZWkr?=
 =?utf-8?B?QlFLdkxKRzh4RUxLYldaYmozS2UwT0VCZXc5cUdMSlEvMkRGMFlJSkRhUlRm?=
 =?utf-8?B?eCtmdGJ6cDNqd0t5OFJGRTZ3OWNRQUFNQzFFMGF1Rm5CNlNQck9LUFhwNWMv?=
 =?utf-8?B?TFNuM1RxTSt3ckNrajd5b1VhbXJRWXdlS2pGU3NVNE9rY1B4QlIzaUk4em5V?=
 =?utf-8?B?M1RZUXc4b2hKWE1icUtlbmhmWW1scG1PRHJ0bE9VaGMzQVZIMlFybE1OUFZH?=
 =?utf-8?B?OFZGSXJVby8xRUYyYXRpSXJQS0pyUE1EYVZCd0Y1eEdHRGFDYlNYVlUyK0pw?=
 =?utf-8?B?clpXN0NOOVJiOUJVMDl2QjE4aGN1VWtBQWdpWTV2SnFjVGNHb2pVdEF4NElB?=
 =?utf-8?B?aVIwd0NFdC9GSTEvZ1JVaWtvcytHdXdLOWptcGd6YWtQbDdvZVFZTDJMSFlI?=
 =?utf-8?B?b1d0QWNTWTBEZ2s2YnJwVXFiTWVRbjlMZmorQ2EyN0JqU0ZBWDNuY0NZOFBZ?=
 =?utf-8?B?dGM3LzV2TTBDdUFMVTJ0UFpIejFVVFNBWEhORjgrMXlOV2xNS2UzRHA5ZGFj?=
 =?utf-8?B?VjZKVVAva0pEbldlS3lHSlg0ekkwYnpOWUhwZERscy9QSTlDa1hnWmUwMTBM?=
 =?utf-8?B?L2phVjgzNllrd1VJMGVEajNUamJBVDdGeURWZXA5cFVQT3RMcVRjZGtpcW93?=
 =?utf-8?B?MFFwU200QjVERFpkcmZsUG01SmpMRk1Sb0xySzJQN1l6a1JpTE4rbDE2d2J0?=
 =?utf-8?B?dHIzdm0rS1pGWDhMMERIbkhYQTZ6dXE0dEJXNDBsS0lINEpQMEFrMmdBT0J4?=
 =?utf-8?B?Ui9MNXIwNFV6YTEyNHhpckJSTm52cGVjZm03ejRsNFJsUk1sRENiR2x0NXhi?=
 =?utf-8?B?em5qTEg1S2VobDJKWjNmOTZGU3AwQWQ2VlEvOUFsbGovREZjV3VsMVFrNVNv?=
 =?utf-8?B?WVlxZXQzOHhKM2JOa1duZFp4SE04QWNuc2hDeXhNLzZmcHZkUURKL1E2dmln?=
 =?utf-8?B?ODZCQkI1Q3c4UVNDVXRZdmRORUVCMXc3cnBpMVJQOEpPcHlZRHRrdkRnaHNG?=
 =?utf-8?B?Z0RiYjM5eHo2blFBNUFYdEFNaTJaUUNPckorTkxkaEF4SFdpWHhiSmNBMWJx?=
 =?utf-8?B?UkI0bXVJdnBPd2QyVnVXeUFFWStrNWFNZzYyWUp1SGtOTHBwN3pXSnZGMDVq?=
 =?utf-8?B?dGJnZERmMzFtbnhDYVc0THZLT3g0cTcxVDduUG52d05BTnA2Vmxrd1Z5bWJY?=
 =?utf-8?B?RzB6TS9iSVBLV0ZHMEgyOEd3ZndzUDIvUGxyVnZWd3A3TnBRTWtBRjJBVTln?=
 =?utf-8?B?bGgxN0ozUFhQaHlKV1FHSnZnQ1doam55OWdWWTZxZjhzMjFzbHV4WmJHV2Vk?=
 =?utf-8?B?amdhbHlYcFRMZFN4UytLUXladTVQVSthby9xZlFnMjhxRitDQTlSaFE4eURD?=
 =?utf-8?B?L1hESWJQaklKOVcyQS9uaDZ3UDliWUtPUkRCYm9ubHJkVVZKWGdINlc5Q3pj?=
 =?utf-8?B?RkpKRmwyM0E5aHBEYnBjTTIybk9Pa0NBNzI3LytjS1FYalpNNVJad1N6dmFp?=
 =?utf-8?B?SFYzZWtGMjZKL2VwcENJeW5qZEk4U3VEQnA0b1RQeXhndjU5TXoxdz09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 722e0112-0e39-4760-00c1-08de4df586f9
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7198.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2026 14:03:26.2370
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /3K2sMtk4NHzK5LOIOikZ62Tga7zHa4M497TMkmjlF6ZuA1lkOZZ1IuwP3JrPEMZKpO/XM7Kj9s/n1QCh/Ru4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF6C1A2BDF1
X-OriginatorOrg: intel.com

On 07/01/2026 13:55, Md Sadre Alam wrote:
> HI,
> 
> On 1/5/2026 8:31 PM, Adrian Hunter wrote:
>> On 24/12/2025 12:10, Md Sadre Alam wrote:
>>> Some hosts require Inline Crypto Engine (ICE) to operate in legacy mode
>>> instead of Command Queue Engine (CQE) mode for platform-specific
>>> requirements or compatibility reasons. Introduce a host-level quirk
>>> `host_disable_cqe` to forcefully disable CQE negotiation and allow ICE
>>> to function through the legacy request path.
>>>
>>> When the device tree omits the "supports-cqe" property, the driver sets
>>> `host_disable_cqe = true` and avoids enabling MMC_CAP2_CQE during card
>>> initialization. This ensures that even CQE-capable hardware falls back
>>> to legacy SDHCI request handling. A minimal `cqhci_disable_ops` is
>>> provided with `.cqe_enable = cqhci_host_disable` returning -EINVAL to
>>> force the fallback. Other ops are left NULL for safe defaults.
>>>
>>> For builds without CONFIG_MMC_CRYPTO, the driver uses standard
>>> sdhci_add_host() to avoid unnecessary CQE infrastructure initialization.
>>>
>>> This allows platforms to forcefully opt out of CQE usage and ensure ICE
>>> operates reliably in legacy mode, providing stable crypto operations
>>> without command queuing complexity.
>>
>> Can't the driver simply opt-out by not setting MMC_CAP2_CQE?
> Correct. This change is intended for the case where both host and device supports CMDQ, but the host explicitly wants to disable CMDQ and want to use the Inline Crypto Engine (ICE) in legacy way.Simply clearing MMC_CAP2_CQE would bypass CMDQ, but it would also bypass ICE as well.

Did you try it?  Looks to me like removing MMC_CAP2_CQE is all that is needed since "mmc: sdhci-msm: Enable ICE for CQE-capable controllers with non-CQE cards"


