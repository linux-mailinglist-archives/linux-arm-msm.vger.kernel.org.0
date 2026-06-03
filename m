Return-Path: <linux-arm-msm+bounces-110912-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id cbb0BgHlH2rArwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110912-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Jun 2026 10:25:37 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 2370C635AB7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Jun 2026 10:25:36 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=XzelwwcZ;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-110912-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-110912-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id CBFA131393FA
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jun 2026 07:50:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1632E405C4C;
	Wed,  3 Jun 2026 07:48:51 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B67BE402B80;
	Wed,  3 Jun 2026 07:48:44 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780472930; cv=fail; b=GOelFqheWTbh8UPiV5lRsDV94X6CdROzdEjYcu1DCmsa/8CEeSxEph4mBUVI0GOMKAUcvdoVsQMulxctiKtWXyuK/jnMMxnks9sPxnelSiCl55RKiqYL/5uJgvdilchfYYRt4BedqCllqHpyBqh44A+c1TMmSbIqJItkjzq+QfI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780472930; c=relaxed/simple;
	bh=7cWDLSHYc+VvvFjCY8IJv9Q3GKWZJwPtHdcoLhbK4RM=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=abefG2u3DCbmUk9LAbCzv2IyHi9/k6nF5U5z8SomZReLgqtkIXSaGpV6Wef+1AfR2Va4i+GLO9wnVXU6meVV68TAzoYci1ItzZxIg1hNntsWRm7iJ62dZSNEjgijL7zqHbK35JrkIYQUftSiAmKtRArLdOOqY1+4L2FtI8Zxgco=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XzelwwcZ; arc=fail smtp.client-ip=192.198.163.12
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780472925; x=1812008925;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=7cWDLSHYc+VvvFjCY8IJv9Q3GKWZJwPtHdcoLhbK4RM=;
  b=XzelwwcZAG2+tzWG5m/9DqzgjyYlHDl+d6GNXgHXFWH7nEX84hnS58YJ
   vUpqfEzuq6oyn88IvuOzWwcFD/olGG0F5k1X7nOIL1hgpbPeSS/QQ3Qa0
   SFqPOi9bX74Gll4erw0H9MRYxDGJvlMJoMj17k+CkVWHvZOzj1FW7ewbx
   bVADjQSdUN6fskYf3Dbp3OL8+96bBRSE2vSINstZxBsOeKtBCKwG/XY/F
   vrJbIbCyr0aC4FxBitfvp1HF/f2ctcVAXAc8Ec23udy3kmbqGSrGb7SbY
   IB28tPNUjCmLYjV8037Q8lvaqNr+09CwVb5aNMAkHitSLf74QLnPFLYrp
   Q==;
X-CSE-ConnectionGUID: bP6cB0W+Q4WLjnVVqVtdZQ==
X-CSE-MsgGUID: 4e58T5mhQR2JsjFJOyOZ5g==
X-IronPort-AV: E=McAfee;i="6800,10657,11805"; a="85127241"
X-IronPort-AV: E=Sophos;i="6.24,184,1774335600"; 
   d="scan'208";a="85127241"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2026 00:48:28 -0700
X-CSE-ConnectionGUID: vIEWEU/eQe2zFJbpouoGxw==
X-CSE-MsgGUID: v+PJS7JFSU6mU5xQ9I+0YQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,184,1774335600"; 
   d="scan'208";a="245965934"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2026 00:48:27 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 3 Jun 2026 00:48:26 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 3 Jun 2026 00:48:26 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.2) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 3 Jun 2026 00:48:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DNwEIgaQNKdLSZSLyHKn3Rd5repKc5hNjKFtx6fO5Tbt8OWbRZZ3+iqrUpi1Xgu+lnz1P2u5VwIIop93zWFbF3lkJMyXjiahThqSbAQY5vuapAA4WKVVWzZi77CFhsC+oyyUE4IfKil4I9pKj9jz2tA6khoyCaVui1Zr9pot1Pq+QiWL7IaLI7nkaSW8/RrWPQnMmMtHJZAZfZPhzt+049SjOHdrAcjP7lFsDe8SmN8oDbJ67biAJDNcEWgIqUbvtyhHnVioWtn868MJTD8F0EESa2DUkMGh5H5MGM2ps0HfJcMKlUuRxC6f60OhWmVcIIGlqbLw1nA1kZe98G9qYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bVBobvy2BePNge8ewm26DfL3m+wTNAAicX7tDjSMi20=;
 b=i9t7o8EhDCsqvpL12gTAC3oE0WLQb7Wog349Hey9C3T6EMxyndWBVCzs3TJidBYCNX6eG4oHAyMzvQATqWpWFKRglWlmipKJe9z64WOLJT2zmyrhj/iXAUAl60uKWxTYm7nXj4o/aSUnmPvseHRHK6UBt2VXLyG13ggF+tMgFm5o9noJ7EN+ORIQ7sguKNtSxplbGHdfi0PMJEKUko6SkFn+j+FKVw1mH9jQkDmBxjIZbL14qQ2s1mNkk9hf6EBxBisQyg0w5nqf0WfpdJz6I30AtwKDzKMu1XNi91+GF3JP49HCkyN+eC2I6u1scndtw8XkvvbCxdqJnwvxcO8rOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB7198.namprd11.prod.outlook.com (2603:10b6:208:419::15)
 by PH8PR11MB8040.namprd11.prod.outlook.com (2603:10b6:510:238::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.16; Wed, 3 Jun 2026
 07:48:16 +0000
Received: from IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::2c4e:e92a:4fa:a456]) by IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::2c4e:e92a:4fa:a456%3]) with mapi id 15.21.0071.015; Wed, 3 Jun 2026
 07:48:16 +0000
Message-ID: <650d6ae8-36c9-44ba-a065-a1ceebee48b2@intel.com>
Date: Wed, 3 Jun 2026 10:48:11 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/1] mmc: sdhci-msm: Set ice clk rate
To: Ram Prakash Gupta <ram.gupta@oss.qualcomm.com>, Ulf Hansson
	<ulf.hansson@linaro.org>, <konrad.dybcio@oss.qualcomm.com>,
	<abhinaba.rakshit@oss.qualcomm.com>
CC: <linux-mmc@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <pradeep.pragallapati@oss.qualcomm.com>,
	<manivannan.sadhasivam@oss.qualcomm.com>
References: <20260529081045.2877910-1-ram.gupta@oss.qualcomm.com>
 <20260529081045.2877910-2-ram.gupta@oss.qualcomm.com>
 <18af0dcb-8cf1-4565-a90d-58bf1e66811f@intel.com>
 <a03e129c-6719-4cae-bffd-563bf1dfc335@oss.qualcomm.com>
Content-Language: en-US
From: Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park,
 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 -
 4, Domiciled in Helsinki
In-Reply-To: <a03e129c-6719-4cae-bffd-563bf1dfc335@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DU2P250CA0001.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:10:231::6) To IA1PR11MB7198.namprd11.prod.outlook.com
 (2603:10b6:208:419::15)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7198:EE_|PH8PR11MB8040:EE_
X-MS-Office365-Filtering-Correlation-Id: b0dfb966-625f-4d87-437f-08dec14478e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|22082099003|18002099003|11063799006|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info: Ts/kGnx3FYJ13m4rCIL1WxHmPiVNVPJiwk9Hq7TSSHxmUWQtNAWy009tuJir0Lz+4oi8abE32TxOL/fmA3YeAlBzywrBZcLTgjujczfnD+s1Es5Di2SPPvx9RNzC0lpOSfPu0/Ai3pV9ypVfmQUb9uX4P9hFeB0wEcjMv7b6c6J/6Tx2yCxIVjLyaVuQ558mnCO1gRnZa3itg/7zdxTLIj1kQDH/daAs2MEg6Tpd812bSdIejYZt1D1JCUE5MX+rFr1O/0jca1Iq3zgopJagEq1PGk2HLo2BxVCVHK68IWSy41xJDoJnWJQmYb1zELJj0TwSeRF1KVplzPOeQfvYH0PCsr9sLcBhfvsURlc2w1wMRIgmDAxpZ8hhxIqPV2/fng11rIQ23ypRnsphVDucsTHveE5jtmWkXpzbt2FZtIycz4t2kkYFGQt7mjTTMWwXHjcCszcPj0VwZzWQO7z/HBRfYcI4v+2jvARUw51k5vTxvqgLEdCJBEXT3OPrW9tGwqRYgVXCnqb6ZR7FNM032qf7ZHGJpT0EAWvVY9ChQwonZriATQPUTQh0GmAmacUGeCsP4VMaTygEHSfnULhVumFvnihFxiDh018sdR+9qyhw0CSePbxHhTfxMVpZimBbu452HmNr/nUTghrwEv9cy932KDg/inmQxY2DC1GECKHNdUFzhKTWERf9OtxWOfJlCHIRaRw4N6GQ8kontNKRDQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB7198.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(22082099003)(18002099003)(11063799006)(4143699003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WFZMTzYzQTN5M1Exd0JaY0VlNGhHSVlmT3hxUkNmWmRQT2tHdU1ySy9Dc1FS?=
 =?utf-8?B?amhIRjRMVmxVQTNQaUNvUy9aQ21YOE5JYXVrUUxRaU0ySzdZQk41QVAwdnpy?=
 =?utf-8?B?azZqVHNKdFB4YUM5bFozM2lzRkxFTG83SzlqaThPOUt3Q0hHNzJZdHh6b2tS?=
 =?utf-8?B?dUVOVEdNcEk2ZEcxSUhjdEp2MmxGL2o2bUhYN1BaaWlTZjlvOTJKQWVKR0pr?=
 =?utf-8?B?NS92c240dTN2OUQxV2FycmVKbXQ2ajJNVHZOMVE5UDIxZklpVEMvSXc4ODhw?=
 =?utf-8?B?M2J1a0tGazN4MlJTMlowOE9vTmcrbzUrcXJtWnVlYkJvZkNSeFFTUFQ0RG1q?=
 =?utf-8?B?VkJVa0dwWm05elQ0ck9JU2pnNHhuVFhjVWoyZnNmQzhkRnBaNU9mUE5tZldq?=
 =?utf-8?B?cWxtNUNYTkk4TFJxYzVaME1NWlZUaEtyWGw2NWMzQzhhWGhYRk5RZkh0N1U4?=
 =?utf-8?B?c2E3UVZGeVhaWk9ubnJJY2V0MjhZVjdUd0xHV0JDYmcwbjI0dzM1bTdUWDdP?=
 =?utf-8?B?bzB1QnlJVXJTR3JQelNzaXJUKzlQQkRPbjZtLzZwejNKSW1YeGMwMUtXaXFG?=
 =?utf-8?B?MjcyRXZRZHB1bVhMNDFtQjFBRm82VlNSdmFxS3g5SmRBK2lHWW12Z2U5amVG?=
 =?utf-8?B?NVVMSmR4OStZTVNTQ3ZQblE0TlQyMWJyT0VLU3l1OWJBSCtLN01RcTFGTkto?=
 =?utf-8?B?UmdSSE9OMjlhTU9GMmMzZHhtUUJKc3lPS0QzdTlqRnJacnBPYUhlWFlZRyto?=
 =?utf-8?B?c3dWWW4xU1l2NUc3K3MzY2t4QWJoZ2xkaGVXZTNPZXZmeXdwMHI3SXlyV3NB?=
 =?utf-8?B?OGkwRlFvdmtVOG56RDBseXltSWUxbC9kQ0lEUnpUM3k4SGFDbnVVS2phcnF3?=
 =?utf-8?B?OHhhUm5zYXQzTy9WQ1pxQms4cVVvUVFhVmZwUDRPeXN3SXEycktJZGtZRzU0?=
 =?utf-8?B?SHBiREZYNUVwRGlDUWdramxQbWlUMXFoeEJrNU9NSlVGU0hwbkt0WjZyNUhw?=
 =?utf-8?B?T1ZVemlNZGV4SmcwZFN1dzd6a25zS3RmSlRyeXgyN2VBcGRsVkdEengxTENF?=
 =?utf-8?B?b2ZIcFlmb2M2b2t1emhtSmVRSEtXT3JxT1Z0ZFh1SWFINlc3NDhSL2RldlZ5?=
 =?utf-8?B?bXVnclRKUERnMUtaekQxT0RZNlhqdnkwSlBSLzYrTTNhVjhsRW5oQVZXbVlF?=
 =?utf-8?B?bFBrblNTbzJUdmQrcUJyWUlTZWhXS3c2aHB5V1FlWjFnU1RoODE3REtzSzZZ?=
 =?utf-8?B?U09GaHBVdmpwaE1pUmFpSFh6U1QzL2oxbzN1SHBpTGtGNEpCT1AxVG03dUEz?=
 =?utf-8?B?cEgxalJTWktRQUxBbVB4Mjg0aGxla2p6bW5IN1dYa3VYV0RDeXoyY0dUSmRm?=
 =?utf-8?B?U0hmaXZwQnFoanVMQkM3YmtBUTgrRk9IcllqOEQzVE55SVFkRDRZVmtxbjNu?=
 =?utf-8?B?OER2bFZRQzlGc1VnQzI4cURzZW5vR0JMNHZjZHUxWmpXZjgzdnNOc3ZKTzM0?=
 =?utf-8?B?WHF4aGcyNUxRQUxxb2lQOGRVZEpIMngvS2FiUCtKd0VKdFNuSklMRms5a1hT?=
 =?utf-8?B?Y3UzRUYxN0JrNFJtWTA4dTYwakkvODhYU2krK1hPRU1ZdlVYV2xLVCtFNWxu?=
 =?utf-8?B?cG1zc2RRZEdWMEE1M3grbmZLcXhDV3dRTW0zZGIwcmlxMUFNdzVEOGVZTHlD?=
 =?utf-8?B?eFJ5Njl4dEhSUEdMeWZoUExUUDJRaWorTFJuMjV6Mk9VN1dQOW1ucVlIQm9y?=
 =?utf-8?B?NklSUmcvbjdKWU5FVms1VWo2ZDVWOWFIVS9ad2RUVmE2YXhhY2lXZ3hyeFZi?=
 =?utf-8?B?TVJKOG9VWFhtTzlKK21tK0p2WlBOb1Y5R2c2Y2REMVZrbktuQ0I0eWN0cDBs?=
 =?utf-8?B?Qm54cFZTU3lzN3lBNkkwK3hEUW1ySElJZk45R3JsaVBlMEFwVlBXTDNKeXR0?=
 =?utf-8?B?Mi83MXdGcFU3cG1XN3lLRWtpcXBrdHhOVXZiQUVuekhsOUZqMkFJVTE3Q25i?=
 =?utf-8?B?TmJaN0FmVExzUzdyUVdpaGh2RFhkUVppN1Z3bHdPM3hBM1p5VldRLzE0QUdO?=
 =?utf-8?B?VkNZQk94akZlcHdpai9tSWNEYzBPdzRDY3czOEFMY29hY2wvc1QvVFlUREc1?=
 =?utf-8?B?bktEVmdCVWVzRFY1TVFNdUNSUU1MMEtiZkYyYjd5MUxNOVZBVkFwa1dTOERy?=
 =?utf-8?B?WHhrcGNjdktlTjdwTmYzVytsM0wxTmE0bWpacEtNc1RVaEJKcXBRWG5QUHgx?=
 =?utf-8?B?TldFdFBzS0t2U3ZUT2h2dHpzTVVqU1dZRldZTHFJRkVnbWErMFo2RlhxWU9T?=
 =?utf-8?B?RXl6Zm5BcXF4cG04Z2RUODRwYUNjOTZkUlQ5N1l1SFVxOHhwWVk2c0ZJYTMw?=
 =?utf-8?Q?xBbBrrEDiV0xEn6Y=3D?=
X-Exchange-RoutingPolicyChecked: N0AKuPOdeLor5LunB7KMFK0kfRR1N2Zo/ocKT5Xv4jzZoZtxfmIR5V95Xe6hk4ZMSyDEBubUD6DYe7JDckchAL/1Qd+qqa4op1Jt0xXYLQ2d544DtH6jZ1hZiCc62FdHC8maYsnI8oVles85mxg2pZaVRtmeV8/hdBYThuh9MwqTGYXCCMvMJAzCxBTAvJa0kn5HxnMK+2YxMmDxZ13QLROrq68DG0m/dhp1D34eiQxLFfZ3G0kethXJW8UNzQEGrLjA63iSyZ6VPx1oeSLraR9UaqKRqaNmBb3HLiFhi8RkIQxnrVgK66xhJFGNGNkJ3LQ5mEQ/Llqb5p//ZRlNpg==
X-MS-Exchange-CrossTenant-Network-Message-Id: b0dfb966-625f-4d87-437f-08dec14478e5
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7198.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2026 07:48:16.5489
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nCjLUmmiXPRlJhxP10yMuNngngSDz7VDtJ1qnCvP4G4NMqMN94mvzz8jes3fEEZhuJ4c/yUKJJSTthPFISqnmQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB8040
X-OriginatorOrg: intel.com
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-110912-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:ram.gupta@oss.qualcomm.com,m:ulf.hansson@linaro.org,m:konrad.dybcio@oss.qualcomm.com,m:abhinaba.rakshit@oss.qualcomm.com,m:linux-mmc@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:pradeep.pragallapati@oss.qualcomm.com,m:manivannan.sadhasivam@oss.qualcomm.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,vger.kernel.org:from_smtp,intel.com:mid,intel.com:from_mime,intel.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	HAS_ORG_HEADER(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[adrian.hunter@intel.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[intel.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[adrian.hunter@intel.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2370C635AB7

On 03/06/2026 10:03, Ram Prakash Gupta wrote:
> 
> 
> On 6/1/2026 1:00 PM, Adrian Hunter wrote:
>> On 29/05/2026 11:10, Ram Prakash Gupta wrote:
>>> Set ice clk rate from sdhci msm platform driver, needed for
>>> target which are having legacy ice support, and need sdhci msm
>>> platform driver to set rate.
>>
>> Please expand upon what "legacy" means here?
>>
> 
> for devices where ice node is not created as separate device node those
> are referred here as legacy, separate device node for ice starts with
> below change: https://lore.kernel.org/all/20230407105029.2274111-1-abel.vesa@linaro.org/
> 
> also I will update legacy that ice nodes which are created withing mmc dt
> node, so that ambiguity about legacy is clear.
> 
>> For CQ case, qcom_ice_create() prefers "ice_core_clk" before
>> "ice".  How does that relate to this?  Please clarify that in the
>> commit message also.
>>
> 
> "ice" is the naming convention used for emmc ice core clk in dt and
> "ice_core_clk" is the naming convention for ufs ice core clk. In the
> function you referred, since ice driver is common for both storage media,
> it tries to parse both the clock.
> 
> Here we are handling "ice" as this is needed for emmc only. I will add
> the same in commit message.
> 
>>>
>>> Signed-off-by: Ram Prakash Gupta <ram.gupta@oss.qualcomm.com>
>>> ---
>>>  drivers/mmc/host/sdhci-msm.c | 12 ++++++++++++
>>>  1 file changed, 12 insertions(+)
>>>
>>> diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
>>> index b4131b12df56..c6a073718aa4 100644
>>> --- a/drivers/mmc/host/sdhci-msm.c
>>> +++ b/drivers/mmc/host/sdhci-msm.c
>>> @@ -286,6 +286,7 @@ struct sdhci_msm_host {
>>>  	/* core, iface, cal and sleep clocks */
>>>  	struct clk_bulk_data bulk_clks[4];
>>>  #ifdef CONFIG_MMC_CRYPTO
>>> +	struct clk *ice_clk;	/* ICE clock */
>>
>> Why keep ice_clk?
>>
> 
> here we need this ice_clk because rate set is required only when ice clk
> is added with emmc node in dt, and in case we try to use the clk entry of
> qcom_ice structure it will set the rate for new ice node as well which is
> separate.
> 
> but also we can avoid this, since this one time operation, and we can reuse
> local variable clk inside sdhci_msm_probe, so it wont be needed. I will remove
> this in next patchset.
> 
>>>  	struct qcom_ice *ice;
>>>  #endif
>>>  	unsigned long clk_rate;
>>> @@ -2708,6 +2709,17 @@ static int sdhci_msm_probe(struct platform_device *pdev)
>>>  			return ret;
>>>  	}
>>>  
>>> +#ifdef CONFIG_MMC_CRYPTO
>>> +	/* Setup ICE clock */
>>> +	msm_host->ice_clk = devm_clk_get(&pdev->dev, "ice");
>>> +	if (!IS_ERR(msm_host->ice_clk)) {
>>
>> Does not attempt to deal with -EPROBE_DEFER, although bus_clk above
>> doesn't either.
>>
> 
> here need is just to set the rate, rest of the enablement part would be 
> taken care in ice driver, hence we can avoid this handling here.

If devm_clk_get() returns -EPROBE_DEFER, then the rate will not be set,
so you are relying on devm_clk_get() never to return -EPROBE_DEFER.

> 
>>> +		/* Vote for max. clk rate for max. performance */
>>> +		ret = clk_set_rate(msm_host->ice_clk, INT_MAX);
>>> +		if (ret)
>>> +			dev_err(&pdev->dev, "ice clk set rate failed (%d)\n", ret);
>>> +	}
>>> +#endif
>>
>> Could put this in a helper+stub function in the "Inline Crypto Engine
>> (ICE) support" section, to save having #ifdef CONFIG_MMC_CRYPTO here
>>
> 
> sure, will take care of this in next patchset.
> 
>>> +
>>>  	/* Setup main peripheral bus clock */
>>>  	clk = devm_clk_get(&pdev->dev, "iface");
>>>  	if (IS_ERR(clk)) {
>>
> 


