Return-Path: <linux-arm-msm+bounces-76993-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id BB9BABD2A75
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Oct 2025 12:54:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id A0F7D4E2D04
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Oct 2025 10:54:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4D2E305E24;
	Mon, 13 Oct 2025 10:54:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y9Duc44g"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DD363054FB;
	Mon, 13 Oct 2025 10:54:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760352845; cv=fail; b=uN6kyUowSInT4LuO2VBvnekRPmDpsFQ/OSxzY85tF9Yk8ous0jTzMXl+mK3EPyR0cfMR8K4FHZsJ2eJHE11jfw3wAe+ZJUWLqkskYhh3MqQvsZgXOZTpUWO4ZASXIeCLAGgCSSJunRLPJLgWR0PIRnm7trWdZFQcNiIH2aT2F9w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760352845; c=relaxed/simple;
	bh=LFwN0/tgjF+Z8SMWC8EKK9POURzp/bdfrWD0bMmr/gw=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=IP5hbHnKiGuCYkpGygMpzBbH4JIXeBzWvokgc1ytYHCsC2c2/F4gUkEFJJ4nRZKCKcq/Z1ygaefQvzMlmlDsy7HX2OQVSsKWNfQrYidR080X7QLYe4djX08E559EfvpdU3Ug8y6CKU7W9scouRfIEwU7sCSM3qTkQx8B81cZm8Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y9Duc44g; arc=fail smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760352843; x=1791888843;
  h=message-id:date:subject:to:references:from:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=LFwN0/tgjF+Z8SMWC8EKK9POURzp/bdfrWD0bMmr/gw=;
  b=Y9Duc44gWJrkUy0APqucSlnO2el9CujsZaRAT8lb5AePvMopDUag6NLl
   qddCGgELgDctOPgr3t9Blir0w7h7w/J1Z3NQRJ/L/7flPjH2KHxAMSqZO
   1CsH7Z+Ok7YCcFujrc1bF0aQx3FBTKwdd/LR6QDYHlvGmyXObXqpqb+Ii
   43R+jSvk/nzEhH8FGoQ/+6ZYuAqsJoXqU/4HuJueYhdqmzIwoBmp+zBFt
   DangNYrzX01JhMES4tvJPhvZUyqrbJtnPGAYKtpYPfp1Ca/CY/4E0hly+
   tiIR8GasSygIvQE3mdvNYPjVGt6kR7RlmGyt23lJj/+sq64SIcFju8GiT
   A==;
X-CSE-ConnectionGUID: e09RUOpaRdqYDD06A57zLA==
X-CSE-MsgGUID: kjhTAFYaS3elWGyOViyGcw==
X-IronPort-AV: E=McAfee;i="6800,10657,11580"; a="72746271"
X-IronPort-AV: E=Sophos;i="6.19,225,1754982000"; 
   d="scan'208";a="72746271"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2025 03:53:59 -0700
X-CSE-ConnectionGUID: HfwwztBMRuy4ioowSpNUZA==
X-CSE-MsgGUID: Gv277+tJRUChXvMFIo/+zw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,225,1754982000"; 
   d="scan'208";a="212193893"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2025 03:53:59 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 13 Oct 2025 03:53:58 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 13 Oct 2025 03:53:58 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.26) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 13 Oct 2025 03:53:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=omfYgq8eRCm4dkmYtTPxJCYHk0uWKow2iRBOYyvI0+rn79LkL/+J6jTWgrpw8LEZ5KhPDy+G4FiMOCOm1x6SuNLbyx4SFp+G7AIoUSG/Kdq1HEtmYv6e58O/7zR8s4DF9P1HBS1zBgPDn0bYi+DfCPk+VxmPDhUesY1fjsaXzdVKDr/YDyZwnqRVhBPQPfMuCRTsUnecb92ce8uA9I7syA7X0rivHdd6F0AL52bhXt1Ich3fCuQudVTpzBp3oZ7NKoWl019CMWaxsb1Xw/YyKOAR8ifP9KujDGFeCk7CA2y8uqjwtcbIwfMETrLGGM7BTcmEtvX9tj9gaaGPGqR+7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8LHhRMOx/3fixPRAwaYm3K4FNNBa7YYKJnkVDCROuwg=;
 b=nOB7tKMfI5bbW4VlVE6RcfSu+cyNU/UEZlstWxnHoGIwzFaC3x4d+lRLfXIHBuLCGtdgdIDt9bl71oo3EIQa85mpC2VH7BP8aMwyYRXi2UtLydwGGKiAxDH1SrS0PYj4kfyUfV7j+DKhLHOMNVIZBqXpIpNsZmIHybb3gTG56sUPYmUpDrP5hCnSJVuhXsm2XqWHM9HFozomK6l0KvvTHqsMhEbOjrs2BmitNp8TYwnyIYAqEcb2obmzc+kVH+lS7/f7K1G7xLZvVWvMKkWUbaEMiWVpmKQPLmG16POLOuVrXznBA/vzyxCMIC8LJO0Wahmi6f4FIrb2ayBL5eNAAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7198.namprd11.prod.outlook.com (2603:10b6:208:419::15)
 by SN7PR11MB6948.namprd11.prod.outlook.com (2603:10b6:806:2ab::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.13; Mon, 13 Oct
 2025 10:53:51 +0000
Received: from IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::2c4e:e92a:4fa:a456]) by IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::2c4e:e92a:4fa:a456%3]) with mapi id 15.20.9203.009; Mon, 13 Oct 2025
 10:53:51 +0000
Message-ID: <2b9c6ef7-16ee-4174-a87f-63c611657872@intel.com>
Date: Mon, 13 Oct 2025 13:53:47 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mmc: sdhci-msm: Enable ICE support for non-cmdq eMMC
 devices
To: Md Sadre Alam <quic_mdalam@quicinc.com>, <quic_asutoshd@quicinc.com>,
	<ulf.hansson@linaro.org>, <linux-mmc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
	<quic_varada@quicinc.com>
References: <20251008110758.718944-1-quic_mdalam@quicinc.com>
 <f4363815-a5bc-4f5a-80a1-7d4a17ad539b@intel.com>
 <9567ae91-c15c-8677-de78-af7ecd792970@quicinc.com>
Content-Language: en-US
From: Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park,
 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 -
 4, Domiciled in Helsinki
In-Reply-To: <9567ae91-c15c-8677-de78-af7ecd792970@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DU2PR04CA0036.eurprd04.prod.outlook.com
 (2603:10a6:10:234::11) To IA1PR11MB7198.namprd11.prod.outlook.com
 (2603:10b6:208:419::15)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7198:EE_|SN7PR11MB6948:EE_
X-MS-Office365-Filtering-Correlation-Id: e3860e68-5a15-46c1-bc02-08de0a46cb3c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?anMvUUtRNURSWW9HRGtveXF6Y2k2T0RYaG9OWHlvNlZ4T2IzUitWa0Q1NzJX?=
 =?utf-8?B?aU5IU056TlRQRjNVZFo3YmVpcFlyL2xQL0djM3BqMlp4VmRTbFFUUlI3OXZM?=
 =?utf-8?B?MHBNbDJPbE02enZlTVc5WlRpNG1veHB6Qm43SHh6Mi9VSnBiWUlLM0doblI3?=
 =?utf-8?B?UkhBbXF3M2Y2eFg2eXhOT0NyN2JLN3c4WGxNNmRrUUZBWHQ2SytET0VLQWtz?=
 =?utf-8?B?VWRNMjFXeDVVZnFmWWVHOWl3RUJQTjJxczBveDgrc1gvNWFIeXpzWkIwNjk4?=
 =?utf-8?B?QUt2c01TQVkxUFRySURBZmFWdWFhS0xOVVBDdmhHS3pvUTBWKzFwNkhyMm5O?=
 =?utf-8?B?ZDk4RW5Ld00vYjh5OThhMDVITUtyWitNVmhwOWUzMzZLUHkyUThvdXpZZWV5?=
 =?utf-8?B?NllHRitnRlJUMGdVaU9CSW1BQUl6Q0pKM25selp6Vk4vbEd3aGU0VUlJV0s2?=
 =?utf-8?B?NkR0R3BOVnhLbzJVck8yQ3hNUzRMaHlOSVhCbHJBdExQcGduMVNYdHJqZXRQ?=
 =?utf-8?B?bkx0VUdaU0lOU00yQVRZdE54eTZBT2R0ZmNCdHJWVXk4NmhIcE9rRVp2VFZa?=
 =?utf-8?B?SGduK3NYYU11U0VXa1JyMXdLM2pkMWZxdEFoWWc5Sng0MDNSaDhhWXFwZFpC?=
 =?utf-8?B?THdOOXZSbGtwWU9TajN0cFZ5cno5bjhuOGZ2Qmt1cTJFZGtRL3lxeGEzK1dE?=
 =?utf-8?B?aDJ4QmhIUUV5ZzJQdTlvVnV5c0FtY0x6cVc0Zkt0RkphUnB4MElzVmsrU1lu?=
 =?utf-8?B?bkZQY0ZkNnFTa1c1NmhTWWN6b2pxcVI3NGlqeWExTURISkh4SVhldHVqVTFG?=
 =?utf-8?B?K1NEenVhZERhZFJaR1pqNE1nR1dpZjJGY2NwcmxaOE9IdThoWGxFb0VEU0pa?=
 =?utf-8?B?MndHVm5Xc1JJUWZmSFplRHFvUEFUV2h0TlJYcjJOTVBzWGtlVzFWQTRxNTFy?=
 =?utf-8?B?MWVmZzVsRTMydUZ3TlNNQ0tvYWV4V2N1d2FKZ0xiaTBIQ2VVc1hHRG1kUWd6?=
 =?utf-8?B?dWt3VmFWS0NaZTM2cHd6QUZ3ZWg2eVEwVjdIVzB4SkJXNFZ2aFgrbUs5R3Ny?=
 =?utf-8?B?TElCWkN5cUdWNktSL2RKK2lnZ1JVa2JnZyszSWNQYWptN0RJN3hyZlVFVkJQ?=
 =?utf-8?B?ak1LUEFhNDBLSlh6bklsR2pHSmMzdU5oK0JDdXI0WDlFSFJwSGtGRml3SFdP?=
 =?utf-8?B?WHZ6Z3lNVzNDZkl3a3hiQW1kaE5aaFh1cXIxNHhzZ2ljN3ZnMFQrS21IN1RR?=
 =?utf-8?B?ODhGTkttZGdqc0NNRWFiM2hlRFJGVURhTFRLR1U1bUNENEl0QzJ4MzhIWkt0?=
 =?utf-8?B?TXRGZStrZWFSRFpxOUhmcTVwdXlQejNqb3NWU04ydExmVmJnQWRXQllLT0dW?=
 =?utf-8?B?SnZWUjZHQktQRTFGenIvR0VpL2lZSThIazl1OUNqNGl3bXltN1RvZnp5Z09y?=
 =?utf-8?B?emNDT0xHamtsZ1MvV1B0VmZMb0RLYTMyS3pDNVYxdFltQ3M1dk5HTS8zWVNJ?=
 =?utf-8?B?RHRGVkV3QzlWQXc1a2hsMmR0VEUxbW1LMCt6TkJRQkQ4NkdFL0J5cnJsL2dG?=
 =?utf-8?B?bFUvbXVmazVqYUlYUEFBUlVFT09NRk45dnUva083ZU44UWo2QVZqMkZ5a3ZI?=
 =?utf-8?B?UjZvSEVPOFNZcTlWYlh6LzhTQ1BXTUJ5TmVyNXF3NHRxcWFSZG1qUDh4ZVdz?=
 =?utf-8?B?Mnk1ZUhpNjF6R0JwNFR2anZka1VlcDU0M01Nc2NSNWdPd2VNQklkUk1DSVBp?=
 =?utf-8?B?eW9ZTW5vZTBUQjg0UzJ6ZVh0dStBMUh0N2hDK0hybXcxeU5qMDN4NmpzaGlQ?=
 =?utf-8?B?UWJVL3Eyc0crZENDQWcyeHRENCt4cVBFaFJnSTIwSDZ0ajB0TGdPNXFUckFL?=
 =?utf-8?B?cE1Fanh6emVrejdwdDl0WGY3Mkdpbmd0YWdkb1dhb1FudTF5VlM3ajFubVV3?=
 =?utf-8?Q?znrzG6gnCGUiKI4wGErQZaSDv3sbdn3n?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB7198.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N1VuRUltZFN4aDhxMmJmaG12dkFwdHRTTFpTZ0RnbXZtTEFFN3U3OUJFUzZ4?=
 =?utf-8?B?TGVsbW9CbElObFdmWXJuNXM3cEk2QkU5L2dkZ25lRGVpVzlZUllaT0oyY0Vh?=
 =?utf-8?B?ZmgvVkVJaTZXaXNMQzlVVGdsQTNlcUVVSDI1QkIrQ2lSZzAwd2xoVE9mRXUw?=
 =?utf-8?B?TXVDMFVFaHBtd3ZSekNINEpQOEtVdHN1VlFlMG0wcHJreVlrK2NRTVU1dVRq?=
 =?utf-8?B?a2RJMzhnaWZib0NhRC9PR2lzN2NOYktDb3ZwOFZPZHhWOThENFRlcEQ2MlJC?=
 =?utf-8?B?Vjlqa0djdWEydHYvdVVPMG9YdEE2bm9SQXJTNVdCNndsOVJvaEtOVzhkM051?=
 =?utf-8?B?UXBCOHpGUWw4TVBvdmtadFBEdkpYeU9adVlzWWZNSzk2VkxtT2Z2Ri9TM09s?=
 =?utf-8?B?SSt1MlZzTW0zUzhEQXFZTVdpVUp1Z3IrZ09mMHpIOUo5SHcvMWNVWGFSWjM0?=
 =?utf-8?B?RjQ4L2Q5NDZHZmhXVkIwejNiblFuU2JYUjMxRjcyeHpCc0c4MDE4ckNTK0o3?=
 =?utf-8?B?NEN4akR0ZVJhUmovZ3cxUGtCUnkzRlcxZ2E3UU91bzFvUnI3SVJNeGtLRTVX?=
 =?utf-8?B?ODNoOWM4allLQmtDeUYzcStmMFVtMjQzYytQeE85NzlFWTRLRytNN25wcmNp?=
 =?utf-8?B?MXlDbzBndVV4OVZ1cGJLR1c2dlQ4RFlHVW56dTRqOUU3aDF2MFZVUklVMlF6?=
 =?utf-8?B?M05XQ2pDWTNTdG1sb3dBWlZLV0RLcXVWbzlmQk8zOTJXR0ZBYUhGOXVLaWlJ?=
 =?utf-8?B?S1FwT2hvNDRIRmhWZjdpaEVTMWl0ZUJYdGV5Q2lNdm14Q1dYL3lmeDNmbk1N?=
 =?utf-8?B?R2lON3Ivdzd6Q0Npd2tMWTBIYlVjNlBVQ1pzaVFQd3VQS25ra0Rrb1c1Ymh6?=
 =?utf-8?B?Y25icnR3NFRGVitLMXRZdnlNZ2s5Q2ZXc0J2K213bUtKaXByWmZBdnk5SUxO?=
 =?utf-8?B?TXZ0SWdwbGxQamNDVjJIVlo0aFhwa2RkSTZ1d1hXRjg3R3piVWp1cTJ4RXZ4?=
 =?utf-8?B?b1RrQjhSQTNvbzVrN1h4Ry9kNlh1T3ZKaGI0TjdYY3lWQjlQYlRDQmRpZ1N0?=
 =?utf-8?B?ZnkvWWNqWXRlSlVYNmxYK3JSbmRZWFkxUFVObUQ3Y04wMTU0Nit3K1JlRm1Z?=
 =?utf-8?B?Y2NmSnFuaWNPakJ2bENobDY3NjdKd3ZSa3kvOGorQTlqMFlvOE5mRFFxNzZK?=
 =?utf-8?B?ZkhaNkJqZFZ6eGoyN0U3Z0Zab091dTFkUmc5aGlBbjhld3RZVVNrbzI5TVdB?=
 =?utf-8?B?SHVJOUJYeUlkM3ZIRVpwV052aFgzb1VSL1VIa2tZbVl0dnVmdXBqZVVFT2Rt?=
 =?utf-8?B?Q2V6ZDRLM08wdXM5cEp3d3lmVUZLRGtjYXgyc0hzR3drbEJLRk5ld3h0UnMw?=
 =?utf-8?B?ei9yd0VMNGc2UVB5OHYyOThCbnNBNExPR3NjMGlCYmZrU1lLZjVKZkIwS0N6?=
 =?utf-8?B?TEt3aHVBQTkza2kzazJTamRjK2JuSzJXd3o2M0pGdzh4dUsyNDdSZEdMZ29W?=
 =?utf-8?B?SzhEbTYrSDRSOEd4eWdwYkV6Qlo1VUY1ZGR2OVVSV1p0TnpNZ1RrbDAwSjFE?=
 =?utf-8?B?c1JVL05SWGhlREV3OERSZEQ0NEh6WGt4a3craEZHbnBTcnF6LzNXUVRxV3Jo?=
 =?utf-8?B?MG5FcUpoenViZlI3Vjk2QWwxaDU0cmNoRTJCQTRya2hGUE9NTmxJd2h6ajFX?=
 =?utf-8?B?MjJlSjgvcXRJSVpBd0U2dzcxN3NNNFFQdkpRRDBPb2Rja29zT3RjUUU3V3RQ?=
 =?utf-8?B?TVU0cE11NmJjZjBOalM4a3lpMVN1THZnbUt4YjEyMWphM1dYMHBWR2dOaEZH?=
 =?utf-8?B?T2xULzhReFEyNFducFBTRVoyUWdUTTVCRjRqMVR0NmdLcmZGblo4Nld2bmRI?=
 =?utf-8?B?ditOQVhBQ1JXSXhidndZWUN1N1JyL3JPa0VzU2pETmRvWWd4WDNibGF0RTBT?=
 =?utf-8?B?VFBhRlBFbXpXRks2ZWN3aXVYU2dEUlJBZlZabDJSN1k3Z1pXK1ZMUHlhcDFX?=
 =?utf-8?B?ZkVYNTlLcTcvZ0ZoeDNpRVVmcVdpd202cGdITFJlUkVsTVRobytrVzRrTE1r?=
 =?utf-8?B?eW1kNklrK0pOWHRlL1RlY2pPb0U4eWxyRGkzaXByZUJ2cVZocWdLMnVMbU9Q?=
 =?utf-8?B?KzEybHZYRkJmUUN3R0djb3VOUHpEeURlMWhIOXRjS0tWS25SNUFYQ3dtOWZU?=
 =?utf-8?B?SEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e3860e68-5a15-46c1-bc02-08de0a46cb3c
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7198.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2025 10:53:51.0269
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FRAfY5M4uuxvnAS0QFPPwpfTDwWsAMEWLGG0OikF0sVIpNP9STLwcvwcu6SmFgo+deTluLQ/2nUrkK8MaYLnDQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6948
X-OriginatorOrg: intel.com

On 13/10/2025 12:09, Md Sadre Alam wrote:
> Hi,
> 
> On 10/9/2025 5:59 PM, Adrian Hunter wrote:
>> On 08/10/2025 14:07, Md Sadre Alam wrote:
>>> Enable Inline Crypto Engine (ICE) support for eMMC devices that don't
>>> use command queuing (CQE). This allows hardware-accelerated encryption
>>> and decryption for standard eMMC operations without command queuing.
>>>
>>> The changes include:
>>> - Add non-cmdq crypto register definitions
>>> - Implement crypto configuration callback for non-cmdq operations
>>> - Initialize ICE hardware during host setup for non-cmdq devices
>>> - Integrate crypto configuration into the main request path
>>>
>>> This enables non-cmdq eMMC devices to benefit from hardware crypto
>>> acceleration, improving performance for encrypted storage operations
>>> while maintaining compatibility with existing cmdq crypto support.
>>>
>>> Signed-off-by: Md Sadre Alam <quic_mdalam@quicinc.com>
>>> ---
>>>   drivers/mmc/host/cqhci.h     |  4 ++
>>>   drivers/mmc/host/sdhci-msm.c | 74 +++++++++++++++++++++++++++++++++++-
>>>   drivers/mmc/host/sdhci.c     | 20 ++++++++++
>>>   drivers/mmc/host/sdhci.h     |  2 +
>>>   4 files changed, 99 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/mmc/host/cqhci.h b/drivers/mmc/host/cqhci.h
>>> index ce189a1866b9..9bf236e27675 100644
>>> --- a/drivers/mmc/host/cqhci.h
>>> +++ b/drivers/mmc/host/cqhci.h
>>> @@ -119,6 +119,10 @@
>>>   /* command response argument */
>>>   #define CQHCI_CRA            0x5C
>>>   +/* non command queue crypto enable register*/
>>> +#define NONCQ_CRYPTO_PARM        0x70
>>> +#define NONCQ_CRYPTO_DUN        0x74
>>
>> Since cqhci is not using these, they might be better in sdhci-msm.c
> Ok
>>
>>> +
>>>   /* crypto capabilities */
>>>   #define CQHCI_CCAP            0x100
>>>   #define CQHCI_CRYPTOCAP            0x104
>>> diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
>>> index 4e5edbf2fc9b..2204c6abb3fe 100644
>>> --- a/drivers/mmc/host/sdhci-msm.c
>>> +++ b/drivers/mmc/host/sdhci-msm.c
>>> @@ -157,6 +157,23 @@
>>>   #define CQHCI_VENDOR_CFG1    0xA00
>>>   #define CQHCI_VENDOR_DIS_RST_ON_CQ_EN    (0x3 << 13)
>>>   +#define DISABLE_CRYPTO            BIT(15)
>>> +#define CRYPTO_GENERAL_ENABLE        BIT(1)
>>> +#define HC_VENDOR_SPECIFIC_FUNC4    0x260
>>> +#define ICE_HCI_SUPPORT            BIT(28)
>>> +
>>> +/* SDHCI MSM ICE CTRL Info register offset */
>>> +enum {
>>> +    OFFSET_SDHCI_MSM_ICE_HCI_PARAM_CCI    = 0,
>>> +    OFFSET_SDHCI_MSM_ICE_HCI_PARAM_CE    = 8,
>>> +};
>>> +
>>> +/* SDHCI MSM ICE CTRL Info register masks */
>>> +enum {
>>> +    MASK_SDHCI_MSM_ICE_HCI_PARAM_CE        = 0x1,
>>> +    MASK_SDHCI_MSM_ICE_HCI_PARAM_CCI    = 0xff
>>> +};
>>
>> Preferably use GENMASK() and FIELD_PREP()
> Ok
>>
>>> +
>>>   struct sdhci_msm_offset {
>>>       u32 core_hc_mode;
>>>       u32 core_mci_data_cnt;
>>> @@ -1882,9 +1899,47 @@ static void sdhci_msm_set_clock(struct sdhci_host *host, unsigned int clock)
>>>    * Inline Crypto Engine (ICE) support                                        *
>>>    *                                                                           *
>>>   \*****************************************************************************/
>>> -
>>
>> Unnecessary to delete this line
> Ok
>>
>>>   #ifdef CONFIG_MMC_CRYPTO
>>>   +static int sdhci_msm_ice_cfg(struct sdhci_host *host, struct mmc_request *mrq,
>>> +                 u32 slot)
>>> +{
>>> +    struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
>>> +    struct sdhci_msm_host *msm_host = sdhci_pltfm_priv(pltfm_host);
>>> +    struct mmc_host *mmc = msm_host->mmc;
>>> +    struct cqhci_host *cq_host = mmc->cqe_private;
>>> +    unsigned int crypto_params = 0;
>>> +    int key_index = 0;
>>> +    bool bypass = true;
>>> +    u64 dun = 0;
>>> +
>>> +    if (!mrq || !cq_host)
>>> +        return -EINVAL;
>>
>> It should not be possible to get here if (!mrq || !cq_host)
> Ok, will remove it in next revision.
>>
>>> +
>>> +    if (mrq->crypto_ctx) {
>>> +        dun = mrq->crypto_ctx->bc_dun[0];
>>> +        bypass = false;
>>> +        key_index = mrq->crypto_key_slot;
>>> +    }
>>> +
>>> +    /* Configure ICE bypass mode */
>>> +    crypto_params |= ((!bypass) & MASK_SDHCI_MSM_ICE_HCI_PARAM_CE)
>>> +             << OFFSET_SDHCI_MSM_ICE_HCI_PARAM_CE;
>>> +    /* Configure Crypto Configure Index (CCI) */
>>> +    crypto_params |= (key_index & MASK_SDHCI_MSM_ICE_HCI_PARAM_CCI)
>>> +             << OFFSET_SDHCI_MSM_ICE_HCI_PARAM_CCI;
>>> +
>>> +    cqhci_writel(cq_host, crypto_params, NONCQ_CRYPTO_PARM);
>>> +
>>> +    if (mrq->crypto_ctx)
>>> +        cqhci_writel(cq_host, lower_32_bits(dun), NONCQ_CRYPTO_DUN);
>>> +
>>> +    /* Ensure crypto configuration is written before proceeding */
>>> +    wmb();
>>> +
>>> +    return 0;
>>> +}
>>> +
>>>   static const struct blk_crypto_ll_ops sdhci_msm_crypto_ops; /* forward decl */
>>>     static int sdhci_msm_ice_init(struct sdhci_msm_host *msm_host,
>>> @@ -2131,6 +2186,8 @@ static int sdhci_msm_cqe_add_host(struct sdhci_host *host,
>>>       struct cqhci_host *cq_host;
>>>       bool dma64;
>>>       u32 cqcfg;
>>> +    u32 config;
>>> +    u32 ice_cap;
>>>       int ret;
>>>         /*
>>> @@ -2185,6 +2242,18 @@ static int sdhci_msm_cqe_add_host(struct sdhci_host *host,
>>>       if (ret)
>>>           goto cleanup;
>>>   +    /* Initialize ICE for non-CMDQ eMMC devices */
>>> +    config = sdhci_readl(host, HC_VENDOR_SPECIFIC_FUNC4);
>>> +    config &= ~DISABLE_CRYPTO;
>>> +    sdhci_writel(host, config, HC_VENDOR_SPECIFIC_FUNC4);
>>> +    ice_cap = cqhci_readl(cq_host, CQHCI_CAP);
>>> +    if (ice_cap & ICE_HCI_SUPPORT) {
>>> +        config = cqhci_readl(cq_host, CQHCI_CFG);
>>> +        config |= CRYPTO_GENERAL_ENABLE;
>>> +        cqhci_writel(cq_host, config, CQHCI_CFG);
>>> +    }
>>> +    sdhci_msm_ice_enable(msm_host);
>>> +
>>>       dev_info(&pdev->dev, "%s: CQE init: success\n",
>>>               mmc_hostname(host->mmc));
>>>       return ret;
>>> @@ -2450,6 +2519,9 @@ static const struct of_device_id sdhci_msm_dt_match[] = {
>>>   MODULE_DEVICE_TABLE(of, sdhci_msm_dt_match);
>>>     static const struct sdhci_ops sdhci_msm_ops = {
>>> +#ifdef CONFIG_MMC_CRYPTO
>>> +    .crypto_engine_cfg = sdhci_msm_ice_cfg,
>>> +#endif
>>>       .reset = sdhci_and_cqhci_reset,
>>>       .set_clock = sdhci_msm_set_clock,
>>>       .get_min_clock = sdhci_msm_get_min_clock,
>>> diff --git a/drivers/mmc/host/sdhci.c b/drivers/mmc/host/sdhci.c
>>> index ac7e11f37af7..2d636a8ee452 100644
>>> --- a/drivers/mmc/host/sdhci.c
>>> +++ b/drivers/mmc/host/sdhci.c
>>> @@ -2202,6 +2202,21 @@ void sdhci_set_power_and_bus_voltage(struct sdhci_host *host,
>>>   }
>>>   EXPORT_SYMBOL_GPL(sdhci_set_power_and_bus_voltage);
>>>   +static int sdhci_crypto_cfg(struct sdhci_host *host, struct mmc_request *mrq,
>>> +                u32 slot)
>>> +{
>>> +    int err = 0;
>>> +
>>> +    if (host->ops->crypto_engine_cfg) {
>>> +        err = host->ops->crypto_engine_cfg(host, mrq, slot);
>>> +        if (err)
>>> +            pr_err("%s: failed to configure crypto: %d\n",
>>> +                   mmc_hostname(host->mmc), err);
>>> +    }
>>> +
>>> +    return err;
>>> +}
>>> +
>>>   /*****************************************************************************\
>>>    *                                                                           *
>>>    * MMC callbacks                                                             *
>>> @@ -2227,6 +2242,11 @@ void sdhci_request(struct mmc_host *mmc, struct mmc_request *mrq)
>>>         cmd = sdhci_manual_cmd23(host, mrq) ? mrq->sbc : mrq->cmd;
>>>   +    if (mmc->caps2 & MMC_CAP2_CRYPTO) {
>>> +        if (sdhci_crypto_cfg(host, mrq, 0))
>>> +            goto out_finish;
>>> +    }
>>
>> It would be preferable to hook the >request() callback e.g.
>>
>>     host->mmc_host_ops.request = sdhci_msm_request;
>>
>> void sdhci_msm_request(struct mmc_host *mmc, struct mmc_request *mrq)
>> {
>>     if (mmc->caps2 & MMC_CAP2_CRYPTO) {
>>         etc
>>     }
>>
>>     sdhci_request(mmc, mrq);
>> }
> Thanks for the suggestion. I Will update the patch to override the mmc_host_ops.request callback in sdhci-msm.c via a platform-specific wrapper (sdhci_msm_request). Since mmc->ops is a const pointer, I Will clone the existing ops into a local copy 

Can just update the sdhci ops directly:

	host->mmc_host_ops.request = sdhci_msm_request;

(msm_mmc_ops) and replaced only the request field. This preserves all platform-specific callbacks like enable_sdio_irq and avoids probe failures. The change in probe function.
> 
> #ifdef CONFIG_MMC_CRYPTO
>     memcpy(&msm_host->msm_mmc_ops, msm_host->mmc->ops, sizeof(struct
>         mmc_host_ops));
>         msm_host->msm_mmc_ops.request = sdhci_msm_request;
>         msm_host->mmc->ops = &msm_host->msm_mmc_ops;
> #endif
> 
> 
> Thanks,
> Alam.


