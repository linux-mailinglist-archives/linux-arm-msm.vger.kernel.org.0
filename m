Return-Path: <linux-arm-msm+bounces-88451-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CCCCCD10CCF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jan 2026 08:07:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AFB42303F365
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jan 2026 07:06:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4342D326D63;
	Mon, 12 Jan 2026 07:06:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JcQVDJ16"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F534319862;
	Mon, 12 Jan 2026 07:06:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768201566; cv=fail; b=uOmU/G4Qkl6iWXRKDxL4yA82qya/vBII29bNH59lLkBqz3haL9Av257RWHj7Y1AdVdxT9orSClEBohnu6JqAls8X5rvgdRzZrpy+yBKbl+7qrO0W47mAEPPAWhjWlVkLo75baj60NGomnUTZeT9hoMnu3eTPbzIhDQJWD8TQFxs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768201566; c=relaxed/simple;
	bh=5xDHnCVEDO4Jrcq/VSa6V1UCtxLEzuatvYwW4eWfxL0=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Y+Uflmhn8aBnWARImGvi+Kab/JVGN1dKjssjwHJVvs+sRkipH1MrF9km/WQ1V/sX/avFxA5JW6LLe87Q7uTDRS0YVD5p27BCwHVw3WkY1Pf/QHe2WgvCzgsixQKCwFwLVQq1St9PPBfXhZACrN0E7VhOz3vI1B9u8TS2L8Sk+f8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JcQVDJ16; arc=fail smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768201564; x=1799737564;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=5xDHnCVEDO4Jrcq/VSa6V1UCtxLEzuatvYwW4eWfxL0=;
  b=JcQVDJ16J+XFkW+CUcR8XFJKnBJb3PrfvVDRNhyfMZsRmKL2LAFuC+M9
   yyhT3NIXd1cEiOgrMyQoA7JdFFPWq0k6R5KRBD+GdXXcUMZktTGuXMTEq
   L27Nw9+5mD3Vo3WXJsQCZTSH4nvpP2zkk+mWmBhsCXbSsMkqWs80iYf0N
   IcpZiYcgbUCMlIhKg9LMDCMqEGRKCycGU8zAWuoy4gPUSd5GJ0ydUKO44
   6/QUrD5Awq6p+PonQdvMaT6/WK54ZdsPRwOZ8PzgS6flJeAQpVP0uN4nl
   q+I/t3GKxM04bzsa+9jnfjYa0PvLMa2pQ7Fb0VEbWNvebPxfFGHGukAyy
   A==;
X-CSE-ConnectionGUID: Fe2mBgazTiqoo+O6IcNVrg==
X-CSE-MsgGUID: VM2TUXsjRBKbKZ+QEgm9Eg==
X-IronPort-AV: E=McAfee;i="6800,10657,11668"; a="73323324"
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; 
   d="scan'208";a="73323324"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2026 23:06:01 -0800
X-CSE-ConnectionGUID: g6k60U1VQE24Q4LHG4uL5Q==
X-CSE-MsgGUID: 4F18NLKQQaanTgYBtM57Mg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; 
   d="scan'208";a="203817485"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2026 23:05:58 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Sun, 11 Jan 2026 23:05:57 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Sun, 11 Jan 2026 23:05:57 -0800
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.69) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Sun, 11 Jan 2026 23:05:57 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TT7Us5dUlfTMgGXjSjYr3V/9cDWlvalCu146g5dR/S27Cx2fwupTmRj9SojTwO5ti5+qIoG/76WnRKoWn56LI8MCZ7F4WFt9CCCiSgdzWfR+gXz7YpA/HqRtlee1uhTc1r5FbMXjIN9Q0qLFwfweqerKketq5CLfeJDjO05PEOzuSkPZmrQZD8qrOuYQMXhbhojcxnBWPVLwo86m5xjMx7eP+F9cJBA4Xw9QUMVfRzJo8mtGqTKdYiqRo1SDINDYJDFS/tXxm5snqCp3wAcqD9pjar4qQdnYvPvq1Juu/yZV4Pcb80or8k1pJkVLlFEMa9EY2d7mpdVO5LNKj27TeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VzjDEYP3qSKOHdioXsZ5MipRAVAmnGJVJJRHz0qKvFg=;
 b=a1k0f+fRtpk1gZnat/pm2nEKw2l6NEqOVCUy+VQA1WB7xW30+TzJui0SA2bVNxLaKCGGJn9rXYGWcwo0nXqg/HXoq89KTQUx/AeYc7GAgZRA01fKijpaEy/uyhwCUSh1uL8WW1NfXND9mj/oj+OIlbmVGFO9buaDQYyXDwpIJvXmZL4O+eud4KJwQpY7LM0SU8OIyN/w/LYI63IOa0SDorFhVyxwx0pEK4O67HrXEccttoLNA5WP5YdwJ1+a1XfgYkQlUw4tnALxNZmFJKTd7hiU+9Ui4JYaitP7E7F1IE3srhvpDcyKyYj4Ls0vEmasMZdFFuqz1XwVSoNrPEI1ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7198.namprd11.prod.outlook.com (2603:10b6:208:419::15)
 by CH0PR11MB5300.namprd11.prod.outlook.com (2603:10b6:610:bf::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Mon, 12 Jan
 2026 07:05:54 +0000
Received: from IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::2c4e:e92a:4fa:a456]) by IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::2c4e:e92a:4fa:a456%6]) with mapi id 15.20.9499.005; Mon, 12 Jan 2026
 07:05:54 +0000
Message-ID: <3a93822a-6ca1-4cc1-be12-38b2b04704da@intel.com>
Date: Mon, 12 Jan 2026 09:05:48 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] mmc: host: sdhci-msm: Add support for wrapped keys
To: Neeraj Soni <neeraj.soni@oss.qualcomm.com>, <ulf.hansson@linaro.org>,
	<ebiggers@kernel.org>, <abel.vesa@linaro.org>
CC: <linux-mmc@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Wenjia Zhang <wenjia.zhang@oss.qualcomm.com>
References: <20260102124018.3643243-1-neeraj.soni@oss.qualcomm.com>
Content-Language: en-US
From: Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park,
 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 -
 4, Domiciled in Helsinki
In-Reply-To: <20260102124018.3643243-1-neeraj.soni@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DU2PR04CA0169.eurprd04.prod.outlook.com
 (2603:10a6:10:2b0::24) To IA1PR11MB7198.namprd11.prod.outlook.com
 (2603:10b6:208:419::15)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7198:EE_|CH0PR11MB5300:EE_
X-MS-Office365-Filtering-Correlation-Id: 779ae639-23b0-452b-1537-08de51a90650
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|13003099007|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?a1BrNTNjcTZpVU9MYTRLUHcybzJYOW93QjZ1Um11L1puL3lmSEQ0QWVMTTQ5?=
 =?utf-8?B?R3hCQlhxZTYva1VTbGZWTTEyUWhqSDN5cjhmc1VxSXYvY2tKby9NZ1loN2pV?=
 =?utf-8?B?MGgwRXdOR055ak9SeHhhY1pUMlJKRDFXWWF2dTJBNEs0eW8yS2hQN1V5ZnVl?=
 =?utf-8?B?Zm5yaVM4OWF3Ym9pVFNjNngwTEd2R2hOalZDTTVHaXd1cldNN1ZmSXgwZTVt?=
 =?utf-8?B?cVJBTk41cVNaUVpkdFd5OWpYR3pzZUkyM1JCZEgvYk1CaUtRZ1hsZWwzMWNp?=
 =?utf-8?B?Y0tISVorOU9yYVY3MkRLc2hiSXhobENkK1licVZyY3lqdE1MbXVTUGFxSzdS?=
 =?utf-8?B?K3VUUE1KSkp6STdzUGRCZi9reFJLTkN3M0lCa1RtMHArU0hRUXRvQmNDSE1I?=
 =?utf-8?B?eHlFbElXeGxCNG8xNXNBRGRleFVmOEs5dms3SFlSYTRVOEdSZ2xKNVN1WEF0?=
 =?utf-8?B?Vi9SZzN2V3ZVSnIrQ3oxcGo4YmNOSEIwTTlZNVZoWTJhRWpQOVZrQ1U0VGJP?=
 =?utf-8?B?L01rTGVjY0ErckRDSllMR1gyMERMdXEyQStRVzBwZlZSTXRxOHRxQ2RkWjAz?=
 =?utf-8?B?Si9VcjU2N1hieXI1OUU1S2E3eW9oKzF5MHhNa3JNZTZybkYyRzg0RDY4YStO?=
 =?utf-8?B?Q2UyWS9hWkNiV1lsaWk5ZjE0NHA2a0RzRUpxY1ZLWGpEMitRTUthMXZlQ1Q4?=
 =?utf-8?B?dldlWi9IZ3VMblo4QXk5OEx0Q2JqNi9OWHYyRGpJRlN1UUpEY2lwaERCS0Jk?=
 =?utf-8?B?SVJCZjh3VVR2SDBvUDAzRW52ZURoMUY3L2QvZVFhREE0eW9CcTNZNWZrWjcr?=
 =?utf-8?B?Z2hvQkx5dzk4MCtxbHdkenRYTmRqSEwxMHZPTUhnS1ZnUm1yaVFOcU42SmZK?=
 =?utf-8?B?bThIZUlTY3UrTlpTNi95NDBQL0U2NTlnTWcxWkhGZDNlZ3gyaFNDWTVzZzBL?=
 =?utf-8?B?N3dyRDZ5MkN1NW9GKzZTaFR2OU1HWlZRYSt2Y0xiVTgzTi9jVUVNbVliOFhw?=
 =?utf-8?B?Y0xiSjRpUVVJR1c1eVNLL1JncEtkemNXNjVZYTNHbTNPVEVQSkNsS2YrNFZB?=
 =?utf-8?B?Z0o5Qk9HSWgwWXhmZWIzQkRPR0Y3K0Z1aURCc1F6OHJaOXgvWjdscFhXQmNo?=
 =?utf-8?B?ZWVYanRhMUNvNEF6YXBKTFBTYWNZNlBieHBjUTJhWWljN3pNdndGSWVYdEQv?=
 =?utf-8?B?Y0dNUWZxZTBQY1BXcTZ1Z2QvQkRVd1lqRWEzWEE4VTllbnJjd01uUmdMRlZt?=
 =?utf-8?B?azRDSFU5L0cvQ2ZWT0IydktveWNKcEVVNU9oQ2JkSGsvTlJiZ1ZDU0F4Y2xs?=
 =?utf-8?B?QjVkbFV3RWFnVEQrMDRQeDMxMGt1MEZoeldyT2liRGEwY1dCb1YyZzhubGxn?=
 =?utf-8?B?ZXhJVUYveFBOYlN5NEIrcG1xaDJ4R0JhYlBtbTU3UzE0TExWZUhIMmhiN1JU?=
 =?utf-8?B?OXgxSEhSNERSME5hb3NDTGVPQ3hWMWFzNVEvdHB5cXhOc281bzU2ZEU2R3ZF?=
 =?utf-8?B?dGlpWEdPQTRKRmREWC9mZDIyMlR2dE8ybWtlWDFUWXNvUGpXeVlXTlhNT3hK?=
 =?utf-8?B?MUwvRnFva2N6NmkzSGdrcHdXSVdXeUsrN05QME9rWHVNWTR6UEZLTDNOUTRu?=
 =?utf-8?B?OXVrVi9OQUtOaWExMG96WEQ0VWE0UTVtSkZqZXJBRjJDbkNWQjRaNnJQZkhr?=
 =?utf-8?B?TVhaOFFxYmdpYmk1Q3o1Q0xXbk16YXE2bWhSZ2p2cjNRZGtHYVUvdTVmTVl1?=
 =?utf-8?B?Sm55R3cxMlJMNmtkZ3NySWs1L0tPelErUjZCb2paYkV1bXZTbFViQ0F6R0VX?=
 =?utf-8?B?N1NRc3c1YlFsMUFWV0FVWGhPd0thY2dJbGhPVEFnVUVKV2dwTTRnQlBGYmZw?=
 =?utf-8?B?eG8zR21DVWxrdUtETkZKSWhkR3BLVEhQcHEwa0d6MVVNRlhsRzVJVkxxTEhz?=
 =?utf-8?B?ZlcraFN0RW00bDFTSDVzQ1FPTGhFV1M1T0JWVlBVVS9zNUNlRUdldnFqcmQv?=
 =?utf-8?B?WFJxVDczc3hRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB7198.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(13003099007)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OXFYb1NzTURQUUlDdVRjbnlmUzVNYTFQcGROV2JRMVd2WjhFS25GUEdjcXNS?=
 =?utf-8?B?a1o1OVp1S1V3SFRHZlRZdjh4blBhREU5MnpvdnQ3VUZvc0FoaFpBQUJrMGpi?=
 =?utf-8?B?OFVaSndmZHE2UHE5cHNCdzJVKzROMklqeVpuRitteDRQZldTQkVPenZsK3lO?=
 =?utf-8?B?bURxdXVSbDZscElUaXRFNWpWUXd0UHc2dzFFQTE1bDFxNDMzTU1GUWM5MU5q?=
 =?utf-8?B?YytXL0R2bXNtK0s5RDRXRDZEeTJoeDJQZG1mUWplQlRwLzFyelBKYnJWYjhE?=
 =?utf-8?B?Z0VONVR1eGhMcG0vaHNMQmJJQmllUS83SnBpdGl4MUs1SEN2SDlUSjFBN2Qy?=
 =?utf-8?B?czUrL0x6eVVJbC9lWWtrOGxmMlNwTW4ydkhPcVhWQnM2eit3bGhuSlhuTnVQ?=
 =?utf-8?B?anRiRFExZVM1bE5kd2F2VlEvdkdncnAya2RXN1RJcXZ1SEFLR1U5ODJISXNy?=
 =?utf-8?B?U3dFVElSVHFoZHhwRHgwRkZRSDQ3ZDZWMXlwQzBGNjkxZ0lLNFlGcVhBc3pL?=
 =?utf-8?B?U0lFWHVKenVLU2dudUNOL0pMTXkyVWZUT2w2eEdoSmJLNDdpb0ZRQ1pMNDhW?=
 =?utf-8?B?ZnlEY0Y3UnJEVXYxalNKTjVzOVBjM09JTjRjVDVVbTJTRG9jbUg2b1JUQjYx?=
 =?utf-8?B?SHJjM0xNc1h1bXBBMHVpUU8wNFF2QlE3WWZEenNveGR3R1ViSDVJU1hnY0Ev?=
 =?utf-8?B?SXRSTWEvaU8yTVoyalFXVHhXbUQ4VVBGSUtucVhHZFZrajJ4MXpXcE9Vc3Iz?=
 =?utf-8?B?Mml2YjhmVzZaSjIxWjRnWXlLNmhsL3g1eXJPK1ZzczdocnhKTHlZOW9DRS9P?=
 =?utf-8?B?L2RTdlBYYkFPT2VKN1VBUnkrMzI5bXY3Y3BRMzB1VjA2Q09OM1hVVFdiYXdZ?=
 =?utf-8?B?YmxBbjZaZTgrTTg0QmhQVzk3YmJJcTk2QUZsS3hjUEQyMmpKWGFDODB4RjJh?=
 =?utf-8?B?RndmUFRHSUNiUkt6YldYdk56cXdMdUU4eHhrYkJoYmQ0YUNDTFRDcWJ0UW1k?=
 =?utf-8?B?N3F0S3ZVclN0dzllckVBb1AraG0zc2hUVUIyK3BZVWJZVnFESmRDY0RtR0M3?=
 =?utf-8?B?UHdFejZQMHZYdko2UDhsWDY3VDZZQS9FM0R5VE9VaEpiSUVWQzdXV0h0Q0sr?=
 =?utf-8?B?WVhvREV5OGsreW5MQmpsVGl1RnZPNGZTaWQ0UmVkTnJtbExzOStUOVgvM3JE?=
 =?utf-8?B?azYyd3hmdFJLUWQwVko5U2tkMC9LQml6cWJUM0M3UHJ0S28zMUZ6MFB6TDVJ?=
 =?utf-8?B?ODhlQjFhK2N6NDhpTnpSaXZRdElQdTF1MnFUTS80MktMU0hnL2lrMmF1ditJ?=
 =?utf-8?B?enViRlRSbHJSRFB0WEpJYmppc0grOFZOMUUyODdHTkp5ZkhHM0VVcEViUEZr?=
 =?utf-8?B?WG0rQWlsNzBTcGtZKy9PT3lydXFINHd5SnRyUXg3ZFpQTUFkVjNzbE5WZDZa?=
 =?utf-8?B?OXN6SW9JR1NYaFg5bXUwNXBzQ0dxTWpnZU90VFpudlNUdHBUNTc1TVFpSGg2?=
 =?utf-8?B?dUZVVFAzUlZHbGEySHBBKzFEVFRGdnNCMGFucUwwUFBVWDU1azVVNUIrbHVP?=
 =?utf-8?B?WUVoZWwwbUVHeGUyQnFyRWRlbExSNGJKWjdZWkpOQnFKUkk2R2dNVEErMmVN?=
 =?utf-8?B?S2dpNytDZ2EzV3FXR20vRldXTzdwNGxVc09iR2N0MDY0RmdlMFhKV1FmRlRL?=
 =?utf-8?B?cGxGMWg4bk9FNDdPMno3ZmZheXdCcFpzUW5ScHJ6a3pXRVVCODh6bUREdVRN?=
 =?utf-8?B?ajQ2cEdaOHR5SzlUOUpHbE15UE55UW5OQlVFVUd5Z0Z4OG9CNGxwQzd2aDdG?=
 =?utf-8?B?Ui9nY243dTJMZGYzUmIxZ0ppOCtteTVteU1xcHhPd3pKSExiK3NPM08xeVkv?=
 =?utf-8?B?SFpubVAzdWF0UmhqdnJ2eGhWczg5cnM1RHBWNm1pZkpnVDJHeXpZNk1FczRt?=
 =?utf-8?B?eTN5dFloSWpKMjJMN3NySkdKQjZVK2RnQnkrUWt6TWZkcThjTW1BSW9QNGJH?=
 =?utf-8?B?VWxvUUo4Ykc1R3VLTDF1eUc4MkptZTZOMlZlQ0lURTBtMnBISis5NzFqZU9j?=
 =?utf-8?B?K2tMaDlwUEt0TyttLzRobkc5bUIyRG1FZGkxQ0pVUkh3alVHMzJlRlIybWFj?=
 =?utf-8?B?YmNYUDZncFVxYmdENlRGS3k2Y2wwRGNoWHRyVXFZdEUrOFJwcUkwQ3NLb091?=
 =?utf-8?B?S2VnN1F0WnFPZFcwMGJEZldpSS9mTTkyaVhFa3V4Q2N3RytOTEE1L0M1OCti?=
 =?utf-8?B?OUNqMFhDcEhhMmVnZGtvcW5WangxazhaMGM3NGRPZzJwMzZQb214SDJ4QWk2?=
 =?utf-8?B?MEZucjc0cWdmdE9iMWpWRFU2NkdVTEMzaHdqU0VjeTU3MXhVdGlSdz09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 779ae639-23b0-452b-1537-08de51a90650
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7198.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2026 07:05:54.2368
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 12sOr0G/RXp9lJc8zonWRMR+jcyoWWd0yVEjsZa/71NpZm2jAdSxoHOnF0gHGyPeqp3MKOT1dXbzKtQOzJwLxA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5300
X-OriginatorOrg: intel.com

On 02/01/2026 14:40, Neeraj Soni wrote:
> Add the wrapped key support for sdhci-msm by implementing the needed
> methods in struct blk_crypto_ll_ops and setting the appropriate flag in
> blk_crypto_profile::key_types_supported.
> 
> Tested on SC7280 eMMC variant.
> 
> How to test:
> 
> Use the "v1.3.0" tag from https://github.com/google/fscryptctl and build
> fscryptctl that supports generating wrapped keys.
> 
> Enable the following config options:
> CONFIG_BLK_INLINE_ENCRYPTION=y
> CONFIG_QCOM_INLINE_CRYPTO_ENGINE=y
> CONFIG_FS_ENCRYPTION_INLINE_CRYPT=y
> CONFIG_MMC_CRYPTO=y
> 
> Enable "qcom_ice.use_wrapped_keys" via kernel command line.
> 
> $ mkfs.ext4 -F -O encrypt,stable_inodes /dev/disk/by-partlabel/vm-data
> $ mount /dev/disk/by-partlabel/vm-data -o inlinecrypt /mnt
> $ fscryptctl generate_hw_wrapped_key /dev/disk/by-partlabel/vm-data > /mnt/key.longterm
> $ fscryptctl prepare_hw_wrapped_key /dev/disk/by-partlabel/vm-data < /mnt/key.longterm > /tmp/key.ephemeral
> $ KEYID=$(fscryptctl add_key --hw-wrapped-key < /tmp/key.ephemeral /mnt)
> $ rm -rf /mnt/dir
> $ mkdir /mnt/dir
> $ fscryptctl set_policy --iv-ino-lblk-32 "$KEYID" /mnt/dir
> $ dmesg > /mnt/dir/test.txt
> $ sync
> 
> Reboot the board
> 
> $ mount /dev/disk/by-partlabel/vm-data -o inlinecrypt /mnt
> $ ls /mnt/dir # File should be encrypted
> $ fscryptctl prepare_hw_wrapped_key /dev/disk/by-partlabel/vm-data < /mnt/key.longterm > /tmp/key.ephemeral
> $ KEYID=$(fscryptctl add_key --hw-wrapped-key < /tmp/key.ephemeral /mnt)
> $ fscryptctl set_policy --iv-ino-lblk-32 "$KEYID" /mnt/dir
> $ cat /mnt/dir/test.txt # File should now be decrypted
> 
> Tested-by: Wenjia Zhang <wenjia.zhang@oss.qualcomm.com>
> Signed-off-by: Neeraj Soni <neeraj.soni@oss.qualcomm.com>

Doesn't apply cleanly to mmc next.  Otherwise:

Acked-by: Adrian Hunter <adrian.hunter@intel.com>

> 
> ---
> This is a reworked version of the patchset
> https://lore.kernel.org/all/20241101031539.13285-1-quic_spuppala@quicinc.com/
> that was sent by Seshu Madhavi Puppala.
> 
> My changes rebase it to use the custom crypto profile support.
> 
> Changes in v4:
> - Updated the link for fscryptctl tool in commit message to "https://github.com/google/fscryptctl".
> - Aligned the indentation at few places.
> - Unwrapped few lines of code.
> 
> Changes in v3:
> - Updated commit message with test details and moved "Signed-off-by" above the
>   scissors line.
> 
> Changes in v2:
> - Updated commit message for clarity.
> 
> Changes in v1:
> - Added initial support for wrapped keys.
> ---
>  drivers/mmc/host/sdhci-msm.c | 47 +++++++++++++++++++++++++++++++-----
>  1 file changed, 41 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
> index 4e5edbf2fc9b..8ac4aee2cb3b 100644
> --- a/drivers/mmc/host/sdhci-msm.c
> +++ b/drivers/mmc/host/sdhci-msm.c
> @@ -1911,11 +1911,6 @@ static int sdhci_msm_ice_init(struct sdhci_msm_host *msm_host,
>  	if (IS_ERR_OR_NULL(ice))
>  		return PTR_ERR_OR_ZERO(ice);
>  
> -	if (qcom_ice_get_supported_key_type(ice) != BLK_CRYPTO_KEY_TYPE_RAW) {
> -		dev_warn(dev, "Wrapped keys not supported. Disabling inline encryption support.\n");
> -		return 0;
> -	}
> -
>  	msm_host->ice = ice;
>  
>  	/* Initialize the blk_crypto_profile */
> @@ -1929,7 +1924,7 @@ static int sdhci_msm_ice_init(struct sdhci_msm_host *msm_host,
>  
>  	profile->ll_ops = sdhci_msm_crypto_ops;
>  	profile->max_dun_bytes_supported = 4;
> -	profile->key_types_supported = BLK_CRYPTO_KEY_TYPE_RAW;
> +	profile->key_types_supported = qcom_ice_get_supported_key_type(ice);
>  	profile->dev = dev;
>  
>  	/*
> @@ -2009,9 +2004,49 @@ static int sdhci_msm_ice_keyslot_evict(struct blk_crypto_profile *profile,
>  	return qcom_ice_evict_key(msm_host->ice, slot);
>  }
>  
> +static int sdhci_msm_ice_derive_sw_secret(struct blk_crypto_profile *profile,
> +					  const u8 *eph_key, size_t eph_key_size,
> +					  u8 sw_secret[BLK_CRYPTO_SW_SECRET_SIZE])
> +{
> +	struct sdhci_msm_host *msm_host = sdhci_msm_host_from_crypto_profile(profile);
> +
> +	return qcom_ice_derive_sw_secret(msm_host->ice, eph_key, eph_key_size,
> +					 sw_secret);
> +}
> +
> +static int sdhci_msm_ice_import_key(struct blk_crypto_profile *profile,
> +				    const u8 *raw_key, size_t raw_key_size,
> +				    u8 lt_key[BLK_CRYPTO_MAX_HW_WRAPPED_KEY_SIZE])
> +{
> +	struct sdhci_msm_host *msm_host = sdhci_msm_host_from_crypto_profile(profile);
> +
> +	return qcom_ice_import_key(msm_host->ice, raw_key, raw_key_size, lt_key);
> +}
> +
> +static int sdhci_msm_ice_generate_key(struct blk_crypto_profile *profile,
> +				      u8 lt_key[BLK_CRYPTO_MAX_HW_WRAPPED_KEY_SIZE])
> +{
> +	struct sdhci_msm_host *msm_host = sdhci_msm_host_from_crypto_profile(profile);
> +
> +	return qcom_ice_generate_key(msm_host->ice, lt_key);
> +}
> +
> +static int sdhci_msm_ice_prepare_key(struct blk_crypto_profile *profile,
> +				     const u8 *lt_key, size_t lt_key_size,
> +				     u8 eph_key[BLK_CRYPTO_MAX_HW_WRAPPED_KEY_SIZE])
> +{
> +	struct sdhci_msm_host *msm_host = sdhci_msm_host_from_crypto_profile(profile);
> +
> +	return qcom_ice_prepare_key(msm_host->ice, lt_key, lt_key_size, eph_key);
> +}
> +
>  static const struct blk_crypto_ll_ops sdhci_msm_crypto_ops = {
>  	.keyslot_program	= sdhci_msm_ice_keyslot_program,
>  	.keyslot_evict		= sdhci_msm_ice_keyslot_evict,
> +	.derive_sw_secret	= sdhci_msm_ice_derive_sw_secret,
> +	.import_key		= sdhci_msm_ice_import_key,
> +	.generate_key		= sdhci_msm_ice_generate_key,
> +	.prepare_key		= sdhci_msm_ice_prepare_key,
>  };
>  
>  #else /* CONFIG_MMC_CRYPTO */


