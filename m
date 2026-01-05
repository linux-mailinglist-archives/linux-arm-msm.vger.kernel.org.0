Return-Path: <linux-arm-msm+bounces-87514-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 6683DCF443E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 05 Jan 2026 16:01:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5C7F730136CC
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Jan 2026 15:01:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04C7A347BCA;
	Mon,  5 Jan 2026 15:01:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O4UDO8KJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89ADE347BC5;
	Mon,  5 Jan 2026 15:01:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767625286; cv=fail; b=Qm9eYohLkZCDXpaapQHs241aJrb46swgroMZzSkhR0qtdE2dDMN26tyTEx1s9O5vrhsrXtB4TKo0VP8zgPUofaInk4olVWyVo9CZIgucmfeBvp/eIOqlWbH0CI75UcGTxaE+ZvioR1wI6RsP3zhejM16sSaKw65U6dJ9r2WWoWo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767625286; c=relaxed/simple;
	bh=lw9DZvchRxIUxc3O2BybQdwlZXrAhYDc+cnKrhHZhag=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=RkE5A/BElS2rxKxcP2phyECef1oZkaYV2MsSo/ky97/DtoUWK5u71qaRZ9sFsWICqoTG4UFBRdXWGOaDApkIk2W205hCFXYTo3iuYm0fYoQcRjfLlPx1dAk6fiG7jFOMN/nIMqlRRSx+7yEgKFs54Mn/uyirK2HFUAxoTObbnQU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O4UDO8KJ; arc=fail smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767625284; x=1799161284;
  h=message-id:date:subject:to:references:from:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=lw9DZvchRxIUxc3O2BybQdwlZXrAhYDc+cnKrhHZhag=;
  b=O4UDO8KJz3xORYdmFJ4AAZo6rf2otHyCX3WmQpahHWDAKLd3TUwxsem+
   bP8V+CN0CJXEjpf613CqysWIHYDBK8EiuPBsCLrs+qg/bN9hCW7gHJSyZ
   sWJvm6PwJL0Jx0zvuIlOyBGWDKIvcO9puBCS4kpaAWEb3mHZh0z5u+uJM
   LzGwM9TERQWtVbm4B0LEVSDJ+NowhEsV8yb37BcPK22f9LqljleUIWcK5
   +bFkx6tC264t/Ab2LEZ2XhaI4OdZcGdTWxfOlq9b7IwfNwb2halXMFIr+
   tQrhRGwautgHcrdmMrS/D1MB4gqawkFo5I23TubTe2Odivnl2deVAqWgI
   A==;
X-CSE-ConnectionGUID: LSCBoRkCRaSDBX0AHNheGg==
X-CSE-MsgGUID: AKEq+EKFSuO2A0L0wKuqsA==
X-IronPort-AV: E=McAfee;i="6800,10657,11662"; a="68895467"
X-IronPort-AV: E=Sophos;i="6.21,203,1763452800"; 
   d="scan'208";a="68895467"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jan 2026 07:01:22 -0800
X-CSE-ConnectionGUID: fDHcWYfARb+t3XheUCkpEQ==
X-CSE-MsgGUID: EhoIGrKrR/6+Hk0YoJcZ4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,203,1763452800"; 
   d="scan'208";a="233097931"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jan 2026 07:01:21 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 5 Jan 2026 07:01:20 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 5 Jan 2026 07:01:20 -0800
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.11) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 5 Jan 2026 07:01:20 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FtxM3Kmd7ozW9+4jpP6puQBNdt0JGMXn6PIGNKEIiGWGtbrjYBHYkKWj53OCa9l5kn5Q9mMgb5lEFirLALVGfCyyHaxBicKRYCz01Qjva0xkt/wCYFFmYM8kpvWj2pKuh9oonlYZvxq3yGi2bA35vjGTMc5ijyql6mUsQ4rHc+tAddHJ8/4QO4SsuQW6k8ebaiRHhsYnPfxOGKdhLcucfIRcCI6rALliFkyghJompHO+MAOYjJNW68nI+iBgOpJNAJo8JYzXuqcw3YDolKq/JrIJdEPrZqKTdmEQJ3j8UcWGiGS7aoMzwZNlZHbe9bfm1dN29ccGAaCF9o+1ZiPKNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AanW10/NBoVHIAISpvEtI7PQFn1CSNgLyVfimgCr1v8=;
 b=Nb1pCEj/uuEKQgy3r0dEdHF8KH17kLwJM2QvgymitPcD1zHhzxKXH6PHWiqw/OR1UAWr7fkzfafTjvVOCxvmXJVRrHYe0SfviC+3/vXEfvzNZF+FCkiZCUD7YxpLc9G2H5A4hzn3Xl2b3hOvUujltQ3F56qEmRrNtX5RQHyDI2BJooykHr6b19rtKk0OY6UrpBZY4DkN7M+TxtWtnJ39n71XJro1dGWi+dITJtWPJXFCxzgG2KgRnfIo+rc2bK7T1pNXEfGPlQNdbpOiAQ8pLkHW+QwhiBhKxKVrJ3oRgH1e3WnD52IpTE094VN7tZLBZktIS9l9gpi/3u82/PuaTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7198.namprd11.prod.outlook.com (2603:10b6:208:419::15)
 by CY5PR11MB6318.namprd11.prod.outlook.com (2603:10b6:930:3e::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Mon, 5 Jan
 2026 15:01:14 +0000
Received: from IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::2c4e:e92a:4fa:a456]) by IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::2c4e:e92a:4fa:a456%6]) with mapi id 15.20.9478.004; Mon, 5 Jan 2026
 15:01:14 +0000
Message-ID: <f65f1647-3c95-41e0-8c6c-a25d835fcf35@intel.com>
Date: Mon, 5 Jan 2026 17:01:10 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mmc: sdhci-msm: Add quirk to disable CQE for ICE legacy
 mode
To: Md Sadre Alam <quic_mdalam@quicinc.com>, <quic_asutoshd@quicinc.com>,
	<ulf.hansson@linaro.org>, <linux-mmc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
	<ebiggers@kernel.org>
References: <20251224101050.3497746-1-quic_mdalam@quicinc.com>
Content-Language: en-US
From: Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park,
 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 -
 4, Domiciled in Helsinki
In-Reply-To: <20251224101050.3497746-1-quic_mdalam@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0273.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:195::8) To IA1PR11MB7198.namprd11.prod.outlook.com
 (2603:10b6:208:419::15)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7198:EE_|CY5PR11MB6318:EE_
X-MS-Office365-Filtering-Correlation-Id: 37cc01e4-d8b7-4487-e336-08de4c6b455b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007|3122999012;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?K1Q3aFhTTHdpdFc0VytIS1EwT2ZmMG5pdlpFblFOUENTVTAxU21NSXBXeldt?=
 =?utf-8?B?RzBhNWwycFlwb2UvWElVYnlTazJGcWtCZEFEMmxpSkFQRHhsVFptV0pPb2I1?=
 =?utf-8?B?dHVGanVCM3FEMmxISEg5RDYxNkkySWZ3VjFwRnp5dDlRYk1nbUFPWG5GejhQ?=
 =?utf-8?B?SEdiTkVFSGZ4RHVEeHViOFVXekZVa21UNWF2VVhUdzkvWXdHc2d5eUwyRDEw?=
 =?utf-8?B?NmEzbEYvL2FOTmlkZXNGeGk4bkJJMjBDdnJYa3FBUHNBdlkvNVpVSGJUcVVo?=
 =?utf-8?B?ZTVpQk9tOWhWVFQyTkNPR1Fxdk5XNzI0Wlg3U1I4YVhMOFB6VjNNQ1o3TVdT?=
 =?utf-8?B?VEcrVHY2TVdCTW8vT3VWa1dmazlCQk1lVTVNSndQNDFnMjhxOEptRGJYL2JS?=
 =?utf-8?B?VzRDdGZ0QVRCUmNTais4aGx1RzBXYlpOM3N0eCsrQjMwS3k3MmlOOTZDMFBx?=
 =?utf-8?B?dm04N3pkcXp2QzRUU0JBQVJZSjZwY0w3N0Z3dUk0SE1vVnQ1LzlycHM2TDhs?=
 =?utf-8?B?NXlTQlNLRm8wREtMODNrb3k5WitBQU9uNEQ0bThhU3pQa2dQRE5yOFpMczVG?=
 =?utf-8?B?NXBobjBkeUhadWRUU1R1cFgvcE9oOEdnNUtsZ1FMdlF2U0RRWkxhUFI0RDNT?=
 =?utf-8?B?WkVqMUpiTmkySnJSRlB1a01oOHlRWGJtQ2NhRGhEV2thMmZrNUczWjFRcytP?=
 =?utf-8?B?LzlDL2dFVS82QXVqRjQxQkdGNEIwelFpZEFWbXFFSVlGTzZJMlBiNmR5d1I5?=
 =?utf-8?B?akRMVWdIUjdnUzNuN3FIM3hsOXFaT2FLcm8zS0kvMlg3VkN5Z2g5aFB2OW40?=
 =?utf-8?B?cDlLeU9UcXBRTzJVK3dDVkRXQVVVcFVQUFVvR2RmWmZ5Y09qcUdoQlE5RVl1?=
 =?utf-8?B?cFNFZXZYWi9oRW40elJkUUFxQmpnYTVmbEY3cmI2VFh1WmdqeDRJVXA1M1Rm?=
 =?utf-8?B?ZzhURlBGK3JZUlVRcmI5QU5oSndsckg5Nk9hbEdnZVlNV3FDbnV6RlNGcFJE?=
 =?utf-8?B?c0swY2l5RjY3a2Q5OGk0SUNKMlJIdEZyN1A4clVOTWo1WGtOV3hZa2p5cDRj?=
 =?utf-8?B?NDBCb0o3VFRMWmlRU3BRbHZnMWc1RUc1VUFGSVVwR3BNZys2ZWFMd2NzYndl?=
 =?utf-8?B?TzN0cGNQMzZMQld1RFB5TGR0TlpSU3k5ZWZ2VUFzNFpxRFptZURKenlrWHRx?=
 =?utf-8?B?TkszcytCZ0s1VFBFbmJabkZYb1A3Q2xiMEMzN1A1WDFyMG11ck5NQVM4M2hF?=
 =?utf-8?B?aGJPMjV1YVdVQk1aZ09nYWtEUjdRYi8xZk05aW5Mb0RZOXN6S0s1MDJ6TTln?=
 =?utf-8?B?WkZjQXJMMlBzZDJYUDZJTzNqVG5HamIraDBuc3RncklmeTZjcjAwM3dTRm5y?=
 =?utf-8?B?dGhkU3Z5aWVQcURmdTZJaW1pMitvYmpPR00zcExvUVlabzg4alJ5d3pmdFZr?=
 =?utf-8?B?SnNWQ3FrYjFiM1paLzZQSFM5V3lKZ1NMK3JnMnRaUmFzaS85Yk1UQTAvanFD?=
 =?utf-8?B?RXlqaThDS2Fkb1A5WFl0U0h6SVFXWnRoNDFjZk81R1hxeGg1ZHllRDFQL3M2?=
 =?utf-8?B?NzBNVEI3MjMyNXRvMWtwRUZDL25YV3ZaYjY1aXZSZk14dzFkSzgvUCs1bFVt?=
 =?utf-8?B?eTNqRUN5RVF1SGd2Vng4K2IrMU1Ncyt4TVV0bTlIZVBlc3pEeHprK2dxMkx3?=
 =?utf-8?B?aitYRzY2a3N4NWgzaGhUSmZqbVBhMHFTclJDcmJZcm41R3JaYStJTXVCdVM0?=
 =?utf-8?B?ZzdkUzJpZ1NPNFpLbUZHSldHMERjb3dmTWZyVURWZUFiS2FSV0s4UXJqTXpG?=
 =?utf-8?B?NStrNlpzS2dsSm15bERHRGV3TE52U2NOWlVoRkFlaXBFbEV1QWpFTlNFK3BX?=
 =?utf-8?B?SHY5aFpKK29TdGo5ZEtBYWNlKzQveUZGWTh2MTlmL1Z2OWpYVjg0Q3pqcFBT?=
 =?utf-8?Q?jKhIYqv2AU52ktKyFRLV/wspAWFQK3GT?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB7198.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7053199007)(3122999012);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YmdYaXhXYlVyWXpUclB0N05SdTBkcVZkeGkrRmNzaUFoNzlLMTVRb3FydTVn?=
 =?utf-8?B?by9haFhYdGZrZmlRemNVYzJ1cmVQc1p0SXhocE5QbnZNVmlsbFhjeXlXbWVU?=
 =?utf-8?B?ZmVrT3VGZHRDdG03MU0zUkVNNDk0TnBEeEs0VzJVaE9BS3BGUUd3eStpNDEx?=
 =?utf-8?B?eXVTbWJpSkNkMG83S0RhZ1NXOGM5K2ZJWVRIQ3AxVFl5UENvS05uSnNRQnlm?=
 =?utf-8?B?VWlmMTIrVktRaWFtVFNtMDBVVGRENGNFZG5xZTFOQmpTWWRFTHN6K3lxSHpF?=
 =?utf-8?B?SktGZHNBam45T2h5ZDNjRWZQRktUVmRIWGtyK1Rmd2hKYTR0UlJPT3F3VkVN?=
 =?utf-8?B?UmJZeUdhMFVHWGJvRU5Sd0dPd0g0T0p3OGc4QTZXekJrZFYyczRKS0thdE41?=
 =?utf-8?B?Q0s5TXhFK0VXUzcrd3VRdG42SHJRN1hPRGdqNVhpd2hyMEYrTFMyQmlWSGxU?=
 =?utf-8?B?MFhEdXlVb3psNHA2RXgyWkNza2xtU3VCb0FyVXp2bVdPNWdvQlY2RzRIcHVj?=
 =?utf-8?B?dEtzcDI0Q0VSdFJyU2dQQnhYVFRNS1JQQ1VQNFFwWE9PMDFCQ2hTS0xnT1hU?=
 =?utf-8?B?RkJmM205Tk5nMHUwL1ROblNJbHprSEREcDM1emFaa3hTa2s3ZU5ieFRaN05C?=
 =?utf-8?B?YnBjTG5NTG1rUjhYNzRpT3o3MzNBVDhhNVdPUXp2cDhTR2o2R0d2Z3RWRFVh?=
 =?utf-8?B?cncxMlJ2UmFsT3VpN0RKTVhQYXFONEgxS3dZa05ET04vUGo2UUk2UUN1WWda?=
 =?utf-8?B?ZGFmUFJtUm5raEdtWjhKdVNiQmZMSjJSdkdDK0JYckRZNXpzbWFVNTY0NXZz?=
 =?utf-8?B?VXdxckZBdXVEYnVnY3cyY1ZiNHJWUU05RFBFakl2OXlacHNxVUhUdHo1elBy?=
 =?utf-8?B?U0dybEM1NXBsS3k0b1hOR1ZRdVFsai9jdW9LZUNhRWhaQStFcGZQSlVkd1l4?=
 =?utf-8?B?R3RkeTkwRFRaaWMzbHM3eVJ1SlkyK2dMOHFjL0ROMi9LMHlzVndkK0gwRU5B?=
 =?utf-8?B?MlhMWHV4RUJhNFdYbDZTajRpcFA2eUc4d2tRUVpiQU5nTENaekFUcStQZVRm?=
 =?utf-8?B?M1ZwTWljdHVheS9keFZJVWZ0UzNOZXVIa256YU1DNmowREVwU0VKcjNSbWlX?=
 =?utf-8?B?UW1iYm5FUEMrK0JuZXp4eXlZRjExZUtoNTlTTGFENWxadTRLUVhLTlRiZytR?=
 =?utf-8?B?WTF0L3RuZlJJTVBzdHo0YVRoTDc5dzYwNjdMUjUyeW0wRkRLOHBiK0I3cEha?=
 =?utf-8?B?aWt3WmJoUnlLR2pRclBuZmNrMmhUTVhEeDUwZ0lIQTAwTUZLREdPZHJKbE5B?=
 =?utf-8?B?M0lYdk0wRk5aOW5VeFpBR1krc3dpT3R4aTRQTit2KzlYcmtrcFd6ZlA4S3Rq?=
 =?utf-8?B?ajlIYmtER081M1hLa0tPaFpBdXNsUjNDTmlHOTV5N0ZPTWYzdzNOa0xvYW9B?=
 =?utf-8?B?RlNpS0c1VXJ0R3FyTllyRWRWc05FNTM0V1VEWWpFZ1FvVzVDNm9DRVE0aXc1?=
 =?utf-8?B?R0dXZ1NuclE2bGU3QTBobnpkWko5UkcxMVJhdTI4dytadWxDcXduSTNSaWo5?=
 =?utf-8?B?WFZxVTZvdzBXZCtvRmQwZDcyZHA1R2xkUDliOEZpbERqRFc1NXVDZ3M2UFNt?=
 =?utf-8?B?RjZHSURxeTlDWlJvM0tGOXJKTFlVa2J6K00zaVJBYTd4SXJTSk9yMkh0OWpV?=
 =?utf-8?B?alVvNVgrNjVWN2s4R1laUFVFeU5za0hXczJ6Wk9CTDFmTVVBcys4V3lkdjRp?=
 =?utf-8?B?cW05eTZ0c29wYWlqTno3U05SM1RZbkFxNTdPRUVwNDZOYVZZOW40OXlYN1lW?=
 =?utf-8?B?emd2Y0hveEE4a20rMjF4VlZmVVMweFZIZ0JtQUZmdFoyeFh5WUZnam1ZUXlO?=
 =?utf-8?B?UndPMDd2M2JkK29kWmVLaGFqSjRuM25PUlFhYjJEdUM1bnpVQ3V0ejVQb1E4?=
 =?utf-8?B?a0hOZ0lESDUwbmFSbDl3SEFtOFpKWnQ1encvVlJrYS9kb2k0UnljRmVMZWFs?=
 =?utf-8?B?SDBFcVQ2WEVRMURFOVo5T3VHRTQ1U29xWW9oN3VUajc2Si9iS3J5eUNwaG95?=
 =?utf-8?B?eG9PeVZBN1JaaDBEajl1L3FpcXB0RllQa0NJUWF0Zmc3enFHeFBEL0wyQ085?=
 =?utf-8?B?eWZ5ak9TR0pFN2o4ZFIrc01SSlg0bkhpUzNReXJoaEhSQTlOdFUwMGRZRm5R?=
 =?utf-8?B?YkVOTmh2TTdoeThlSDRhZ2FuamlNTFNRMXNwd2xiRmMwaVkxbkZrQ21NT2lu?=
 =?utf-8?B?TjFYVnJ1QkFYd3lJYjhjZEg1Z0FtZUl6MjBmc2VEL3hGdVlZV1ZUeTYzL3Vr?=
 =?utf-8?B?Y1JucXB6K1M5MTlSM0VIZ2w2L0JjNm5BTEFINmxNYytSK1ZPY1U4dz09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 37cc01e4-d8b7-4487-e336-08de4c6b455b
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7198.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2026 15:01:14.5052
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I5DAOp4i4RhorJNV4teC7tPKGXZe06/N1dq7MiZJsLE4AKEaa7aj2lmfpEjEqVjXrRD4R7efYs+6E3s/8VJMXg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6318
X-OriginatorOrg: intel.com

On 24/12/2025 12:10, Md Sadre Alam wrote:
> Some hosts require Inline Crypto Engine (ICE) to operate in legacy mode
> instead of Command Queue Engine (CQE) mode for platform-specific
> requirements or compatibility reasons. Introduce a host-level quirk
> `host_disable_cqe` to forcefully disable CQE negotiation and allow ICE
> to function through the legacy request path.
> 
> When the device tree omits the "supports-cqe" property, the driver sets
> `host_disable_cqe = true` and avoids enabling MMC_CAP2_CQE during card
> initialization. This ensures that even CQE-capable hardware falls back
> to legacy SDHCI request handling. A minimal `cqhci_disable_ops` is
> provided with `.cqe_enable = cqhci_host_disable` returning -EINVAL to
> force the fallback. Other ops are left NULL for safe defaults.
> 
> For builds without CONFIG_MMC_CRYPTO, the driver uses standard
> sdhci_add_host() to avoid unnecessary CQE infrastructure initialization.
> 
> This allows platforms to forcefully opt out of CQE usage and ensure ICE
> operates reliably in legacy mode, providing stable crypto operations
> without command queuing complexity.

Can't the driver simply opt-out by not setting MMC_CAP2_CQE?

> 
> Signed-off-by: Md Sadre Alam <quic_mdalam@quicinc.com>
> ---
>  drivers/mmc/host/cqhci-core.c | 28 +++++++++++++++++++++++++++-
>  drivers/mmc/host/sdhci-msm.c  | 20 +++++++++++++++-----
>  include/linux/mmc/host.h      |  1 +
>  3 files changed, 43 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/mmc/host/cqhci-core.c b/drivers/mmc/host/cqhci-core.c
> index 178277d90c31..32da3b856db1 100644
> --- a/drivers/mmc/host/cqhci-core.c
> +++ b/drivers/mmc/host/cqhci-core.c
> @@ -334,6 +334,12 @@ int cqhci_resume(struct mmc_host *mmc)
>  }
>  EXPORT_SYMBOL(cqhci_resume);
>  
> +static int cqhci_host_disable(struct mmc_host *mmc, struct mmc_card *card)
> +{
> +	pr_info("%s: Host does not want to use CMDQ\n", mmc_hostname(mmc));
> +	return -EINVAL;
> +}
> +
>  static int cqhci_enable(struct mmc_host *mmc, struct mmc_card *card)
>  {
>  	struct cqhci_host *cq_host = mmc->cqe_private;
> @@ -1135,6 +1141,18 @@ static const struct mmc_cqe_ops cqhci_cqe_ops = {
>  	.cqe_recovery_finish = cqhci_recovery_finish,
>  };
>  
> +static const struct mmc_cqe_ops cqhci_disable_ops = {
> +	.cqe_enable = cqhci_host_disable,
> +	.cqe_disable = NULL,
> +	.cqe_request = NULL,
> +	.cqe_post_req = NULL,
> +	.cqe_off = NULL,
> +	.cqe_wait_for_idle = NULL,
> +	.cqe_timeout = NULL,
> +	.cqe_recovery_start = NULL,
> +	.cqe_recovery_finish = NULL,
> +};
> +
>  struct cqhci_host *cqhci_pltfm_init(struct platform_device *pdev)
>  {
>  	struct cqhci_host *cq_host;
> @@ -1188,7 +1206,15 @@ int cqhci_init(struct cqhci_host *cq_host, struct mmc_host *mmc,
>  	cq_host->num_slots = NUM_SLOTS;
>  	cq_host->dcmd_slot = DCMD_SLOT;
>  
> -	mmc->cqe_ops = &cqhci_cqe_ops;
> +	/*
> +	 * Some platforms may not support CQE reliably.
> +	 * Use host_disable_cqe to force fallback to
> +	 * legacy request path.
> +	 */
> +	if (mmc->host_disable_cqe)
> +		mmc->cqe_ops = &cqhci_disable_ops;
> +	else
> +		mmc->cqe_ops = &cqhci_cqe_ops;
>  
>  	mmc->cqe_qdepth = NUM_SLOTS;
>  	if (mmc->caps2 & MMC_CAP2_CQE_DCMD)
> diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
> index da356627d9de..3295e8c9650b 100644
> --- a/drivers/mmc/host/sdhci-msm.c
> +++ b/drivers/mmc/host/sdhci-msm.c
> @@ -2200,6 +2200,7 @@ static const struct cqhci_host_ops sdhci_msm_cqhci_ops = {
>  #endif
>  };
>  
> +#ifdef CONFIG_MMC_CRYPTO
>  static int sdhci_msm_cqe_add_host(struct sdhci_host *host,
>  				struct platform_device *pdev)
>  {
> @@ -2228,7 +2229,8 @@ static int sdhci_msm_cqe_add_host(struct sdhci_host *host,
>  		goto cleanup;
>  	}
>  
> -	msm_host->mmc->caps2 |= MMC_CAP2_CQE | MMC_CAP2_CQE_DCMD;
> +	if (!msm_host->mmc->host_disable_cqe)
> +		msm_host->mmc->caps2 |= MMC_CAP2_CQE | MMC_CAP2_CQE_DCMD;
>  	cq_host->ops = &sdhci_msm_cqhci_ops;
>  
>  	dma64 = host->flags & SDHCI_USE_64_BIT_DMA;
> @@ -2270,6 +2272,7 @@ static int sdhci_msm_cqe_add_host(struct sdhci_host *host,
>  	sdhci_cleanup_host(host);
>  	return ret;
>  }
> +#endif
>  
>  /*
>   * Platform specific register write functions. This is so that, if any
> @@ -2852,10 +2855,17 @@ static int sdhci_msm_probe(struct platform_device *pdev)
>  	host->mmc_host_ops.start_signal_voltage_switch =
>  		sdhci_msm_start_signal_voltage_switch;
>  	host->mmc_host_ops.execute_tuning = sdhci_msm_execute_tuning;
> -	if (of_property_read_bool(node, "supports-cqe"))
> -		ret = sdhci_msm_cqe_add_host(host, pdev);
> -	else
> -		ret = sdhci_add_host(host);
> +	/*
> +	 * If "supports-cqe" is not set in DT, disable CQE at host level.
> +	 * This allows ICE to operate in legacy mode.
> +	 */
> +	msm_host->mmc->host_disable_cqe = !of_property_read_bool(node,
> +								 "supports-cqe");
> +#ifdef CONFIG_MMC_CRYPTO
> +	ret = sdhci_msm_cqe_add_host(host, pdev);
> +#else
> +	ret = sdhci_add_host(host);
> +#endif
>  	if (ret)
>  		goto pm_runtime_disable;
>  
> diff --git a/include/linux/mmc/host.h b/include/linux/mmc/host.h
> index e0e2c265e5d1..8b963ccbda19 100644
> --- a/include/linux/mmc/host.h
> +++ b/include/linux/mmc/host.h
> @@ -565,6 +565,7 @@ struct mmc_host {
>  	int			cqe_qdepth;
>  	bool			cqe_enabled;
>  	bool			cqe_on;
> +	bool			host_disable_cqe;
>  
>  	/* Inline encryption support */
>  #ifdef CONFIG_MMC_CRYPTO


