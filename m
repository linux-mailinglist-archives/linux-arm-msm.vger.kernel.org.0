Return-Path: <linux-arm-msm+bounces-29152-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5728C958F8F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Aug 2024 23:15:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7BB291C21A96
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Aug 2024 21:15:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 700BF15CD64;
	Tue, 20 Aug 2024 21:15:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K9OnD4jF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E1DB38FB9;
	Tue, 20 Aug 2024 21:15:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724188554; cv=fail; b=ImKvq/3YPhgf03eISJr5QBmdTnUvG6dCPTBZi2lbyCq7BTP5ZMBHnwDQH4ETb+jaYRFdiPzw07jMWHMgupuWikRdGxAWyKrJt4FfoG3hLmxPAAZ26uHQdYgO8+J4d4/e8uIiEx7T5JdBRq7fhPZIyRX62P1zy0QeIjEJ+ncZyU8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724188554; c=relaxed/simple;
	bh=switfihuX8rcG8okoejdiaw/F12TFaQx8o4/9GhKr3o=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=pQvJUwIHjxG7w63FghdgQlLPvn6qoAJW1ABs9gTK498F41e75CCJgQ4Kh0ZB66KKhDZ2oMiIWwdg39YBvk2X3dDIC5k5C5O40Jxo/jnHMic5C7gu+Oa76w5nmPdLNOXF+Ub5bTfhScO5aCthjwoQinRJ8/blLr/NqZxGWQ52xY8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K9OnD4jF; arc=fail smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724188553; x=1755724553;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=switfihuX8rcG8okoejdiaw/F12TFaQx8o4/9GhKr3o=;
  b=K9OnD4jFPRM+cJbnmDVFcnYJBansCkLnyqE32GJCs15K3rtqiosi21u7
   iW23XXrYYTAnukR1fRAJKbLW2J0j/2YSA/tCGK5BSts3jQPp4+UxerkSx
   obl0SlZkDJ/uD80Gc2k9l9uy1cpZAZpw/NXye0z7GtUK/u62KCcvtr24F
   BUwoysDMowQC4W+zbfjPrwquTGxR6jPh9xGFwrTOPYILLKD3sj4RgFNij
   JSMPJw+iCmz/VLovys6VCNpfdPhaubBsAO6JVNRmnXmmZS6H20Y5cxoxm
   glL+UvQkQQamI3glDGVy0DX57hWvvQu0E6TQ9wa+hY4bqJHqSxNC5DQ9o
   w==;
X-CSE-ConnectionGUID: H0Cnko5lQOCFWHTzZsNlRQ==
X-CSE-MsgGUID: +w9ilCkRTPqCsJUzZf9soQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11170"; a="22704139"
X-IronPort-AV: E=Sophos;i="6.10,162,1719903600"; 
   d="scan'208";a="22704139"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2024 14:15:52 -0700
X-CSE-ConnectionGUID: cUu0GZfVTyCXZ/2f2q5c0A==
X-CSE-MsgGUID: juzhvPgIRfS+ZLzFEI4Brw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,162,1719903600"; 
   d="scan'208";a="61182257"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 20 Aug 2024 14:15:51 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 20 Aug 2024 14:15:50 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 20 Aug 2024 14:15:50 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 20 Aug 2024 14:15:50 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.46) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 20 Aug 2024 14:15:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gayxaalfuBoLyqN+AgYCkdq9e/7qzfd0Cw91bftXYkum16lsifrGhVzDELn3w1kSRp9lb4zwjB+QXJ5Empdazum1E1bOq+t6e3mwfYLvA1JQMiZ8VQT4leCEgg+pnxnbg4EWDckEFLaRaZi/AAQXNQaWhchcTiueQlU5cNLCfVKRowSqQ5ip/yqxdMH84ANN7vszOvrJvUoIFKTOzGf6x8nEI2iDT9kZVBl/hK7AWUximT9pHKcC8Z0P+WI5sZC+zAPO148/qhAMmkS3pNzw4JtRwoXhMgDb1DOpQXnfR+zv0IZ44E7a3ia+04caUCZVPTdlbLwlj+tDXWsbvI4mPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xi0b3pnVvimGPiQ019aEgr/4Nh8JHiX0qRlaMaaPli8=;
 b=NcAgigF77kn1B/D+2CCYYrMBSun2vkX9CNWk9TieVfiEEaSa5TtOKEfR8II3905qByWn/Bb5XRFTjRiEHDPRjv1tutJMVmjIjAvN0T9+KsFDRh1C1LWhuErWfCaaLGyOYnACk63sEV82V8DT2OBqiRfffY/scag1GeRcIg2OdKz4cDrNvomL4WeRTfFbgNX8NTnD99id1O6LGCKT+oPNA9o41eLfvhaXDEBCizTVGmwA7UNV80eanbY7E45/MavFd0labr5eaLo/9gIVqU3qx3SiPl2aXOkVYcspEMqShZ6TBezhSe2nS4hRdv4vIpD8wolgZt3qO2uMsOudWcGVAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5089.namprd11.prod.outlook.com (2603:10b6:303:9b::16)
 by CO1PR11MB4852.namprd11.prod.outlook.com (2603:10b6:303:9f::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.25; Tue, 20 Aug
 2024 21:15:48 +0000
Received: from CO1PR11MB5089.namprd11.prod.outlook.com
 ([fe80::7de8:e1b1:a3b:b8a8]) by CO1PR11MB5089.namprd11.prod.outlook.com
 ([fe80::7de8:e1b1:a3b:b8a8%2]) with mapi id 15.20.7875.023; Tue, 20 Aug 2024
 21:15:48 +0000
Message-ID: <0104f251-f032-4082-835f-01ca2279c1b1@intel.com>
Date: Tue, 20 Aug 2024 14:15:46 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/7] net: stmmac: dwmac-s32cc: add basic NXP S32G/S32R
 glue driver
To: "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>, "David S. Miller"
	<davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
	<kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Alexandre Torgue <alexandre.torgue@foss.st.com>, "Jose
 Abreu" <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Vinod Koul <vkoul@kernel.org>, Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit
	<hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, Richard Cochran
	<richardcochran@gmail.com>, Giuseppe Cavallaro <peppe.cavallaro@st.com>
CC: "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-stm32@st-md-mailman.stormreply.com"
	<linux-stm32@st-md-mailman.stormreply.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-arm-msm@vger.kernel.org"
	<linux-arm-msm@vger.kernel.org>, dl-S32 <S32@nxp.com>
References: <AM9PR04MB8506DECD381225ACFB311329E2832@AM9PR04MB8506.eurprd04.prod.outlook.com>
Content-Language: en-US
From: Jacob Keller <jacob.e.keller@intel.com>
In-Reply-To: <AM9PR04MB8506DECD381225ACFB311329E2832@AM9PR04MB8506.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0347.namprd04.prod.outlook.com
 (2603:10b6:303:8a::22) To CO1PR11MB5089.namprd11.prod.outlook.com
 (2603:10b6:303:9b::16)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5089:EE_|CO1PR11MB4852:EE_
X-MS-Office365-Filtering-Correlation-Id: ca4304a3-2869-4425-2456-08dcc15d430e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014|921020;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RGZRTTl5UDJtcGljbFNLRVR4dndsM2RkNmgydXBxSXJ6Nkk1UVU5R3pKblVZ?=
 =?utf-8?B?SERhcm13T0MzaVdoZlJEM2U4SjhpMVgzSUVUd0ZmQkZoU01XOXk5NmVDWUJZ?=
 =?utf-8?B?MlFlVmh0QzVtM2FtWkZMMDdCbUJPRmxPUDZYRHI4aVB3UEduZ2tsTVlTY2NQ?=
 =?utf-8?B?SHZRSTl4ZDZscStXelhyV2RxVVRtSUVjMEU1M1ZSeUZQR2E4bEdDallVa0Zq?=
 =?utf-8?B?NE92M2xkUUh4aUgxQ0M1ay9uTDFYV081M1Fwb2VHaGZVaVBURnVKWGllblBl?=
 =?utf-8?B?T2s2KzlPR3pOM1hvMXBOZ2ppZzdSRlZnbUFkR0dIQWQwaFBQOFd5Y2YwTG9H?=
 =?utf-8?B?NWV5VGthWWRqQnAvVTNOdTg0TWtBcldjYkg0bG1pK25ZZnFEdmNhTFlrYXhw?=
 =?utf-8?B?YzFmYWlKMFMvc2Vpa1Ywdis2Wlp1eFlScVJGTU40c2tPdytxMy9POEx0WVJQ?=
 =?utf-8?B?WUlXOWM2d1A0MXJUK3dnWXlEZ0h0Unl6YS9BMFBSaE9Bcm1QcXRRTm9IZk94?=
 =?utf-8?B?WWlOUjJOeXBrV3p1aDFWWktHNnRDWUNFMWtxWjhISjdRWjV3UUpJL2JMSU9M?=
 =?utf-8?B?K2hudkdHdWprRDcrZEM4L1hycEF6NkpILzExOGU2L1cxU3ZITXhPcHFTbGRj?=
 =?utf-8?B?YnZFNnJlSnl5Q1VVNTUzeTcrb2ZmTGNTSXNYdUtPU1VvcWhCWFRqcitDYjIy?=
 =?utf-8?B?WXBjeUdVTmFWeFJPSW1rYXBUbEZLVTE5SjNxUzRFYjBhbHU4U0ZSeVl2NFZ1?=
 =?utf-8?B?UmtPc1Yrb2wycm90NEQ4cE5mUG1Ma3creXE0RjIwU1k1Tkk4TkdpV0xmUEJO?=
 =?utf-8?B?WnN5citmaWVnNlpyNHNFWkQrWXlrK1lrbnZHczBucVB6Z2E0TE5GYTVIMUhP?=
 =?utf-8?B?MW1ocDZ0cGg1ajZLKzlMU0xhNmFTckpCcG9sd3BqdTdrZ0RPenp1RVFPdFZC?=
 =?utf-8?B?MnFxb1F6bit3eldNRFB4MW55R2U1ak1lMFEzRCs3c2hlTXBZTUdqbjNRUmhE?=
 =?utf-8?B?ZEZadTYweWxuODVIeEQ5UzRjTXpIUUFkamVNVEtEc1h3S3BMZ0dOWEdOVHRh?=
 =?utf-8?B?UUlCdldnUnlaWS9pSHBpTHR5RnRpM2NaQlE0b3lUMUdsUXR2bmZlWllaWFdR?=
 =?utf-8?B?RXJRZWltdGMzZ3ZHdmMxM1VSRUlOS0lxWDNOZW5uaWk4bHNKZGpWcm1yZTdC?=
 =?utf-8?B?R2duWTJOVGppaU1vd01wdzcrNzYyK0F5ZVNpbEJvU2ljTVpJQmRuNElVVUlj?=
 =?utf-8?B?d3F6RUdSakxRQmFjK1BpdFJGeUVEaERsTkUrR1UvNGNRYW1ieW1zYnBIVFJ1?=
 =?utf-8?B?a0RWSWlGYlpNc1VUT3dlUnUwTm5RTVUyT1p3U05odWhYM3ZnWm4yU1BGM2hn?=
 =?utf-8?B?UmhsbG9ZSUZpNUJET2dkRFJUYUowU2oxa3daZWZDdTRJT2x1MnZxSG43ckpT?=
 =?utf-8?B?ZjRuL3U4OUd3bFVJWGV4Zm5XRFlhN3FOMnlHMUx2MHZQbktPajVIUy95OVMz?=
 =?utf-8?B?eDF3ZzZpVk4zZThwSFNIWDZ6bUdiazhBNXY5WWFsaDlSMHJnLy9pNVpOVEc5?=
 =?utf-8?B?UW9rV1cvS1R0R2JGQTRlSjNpSWZnUXl3UnBuanZrSHl2NWlRQmJpZ3JzM3kv?=
 =?utf-8?B?NTdDdVRrV2xWbEo4bGFvWjR4a0dyNnBwbkJ5Mk1kcXg2NlY5NDIvK0V1TEUw?=
 =?utf-8?B?Vm9ic0UwVTRpbDdUWXlmZzl5MlhZRVRwdlV0ejJkMEdZa0dscDNhYkh4YlVE?=
 =?utf-8?B?UitnUU9sNmVJejI4M3VhTWlQYm9MUGFkZFpNc3orZFJPbEMzSmJOTlByNGJ5?=
 =?utf-8?B?QVdYZFZTdjFMMnB4azdueWVHWkU5aGdONHlJMlhWRUdyM1lNc1BnM3dQcE1I?=
 =?utf-8?Q?H9/Lhp91YwoZ1?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5089.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y0t4MkZOZkVpa1VlYjlGV0V4dFMxTkxZY3B2Y1VzZVFzWXJpU0kvZGVCSUFz?=
 =?utf-8?B?MFFZYVo3cWcrbVJQRjRsczRLQzVLY2ZLWWlsUkdqRkc1b2dGZ3NmZ0xzamZ3?=
 =?utf-8?B?SUVmcnh1NXRMVlAwM1M0RytKdVIyUzJZa01hZE12RDlQSWFNTlV0bXowYzV4?=
 =?utf-8?B?UEFUM2o1aDVGQjZmZWVPVHg5TjFSOVdaUWpCSmkxWFlkNWd5SHhsZGZibkxL?=
 =?utf-8?B?TGQxd0U3TitHOFRJckVqMjF0ci9wWk5jdy9nMUhnYlRlWDMrSUM4QmxNM1Vw?=
 =?utf-8?B?UXFxdW5zWWQvWjB3ODU2QnhUbnMwbHJ3Q2MzTllSRG5oVkNoeG1NckQ4QzB4?=
 =?utf-8?B?UWsvelpkUmE5ZnBycTVhWW9DZjI4eTh2VUl2bmVaR3RRaVBGckZySlBGUGEy?=
 =?utf-8?B?QmVIdmo3ak9zV3U4WkFRcWRuMUVZWHlsUTdDM0dTL3laeEFHc3F2ZWY4UUla?=
 =?utf-8?B?Znk5S0J5VG9tRmpEVDVObUh2aUlEK2luV1VRdTZqbUo2T2hMZHpXc2Y2aExD?=
 =?utf-8?B?cUFGMHArWHFjN2E3QVp6WjYycWg3VE5oeEFQdVExcDlucU51WjkxakNuVStq?=
 =?utf-8?B?OVd3ckZzWlRtVXdRTjVibkZRd1RuSnhMQTZWNDdINDBxQkgwM3lIeTZybkxi?=
 =?utf-8?B?U0JFSGhWSHpjRkx1bXE3YUFnRUpZL3o3MXYxRDJxUmJtNVRBTmV5QlFCdWdn?=
 =?utf-8?B?SFdhb0toY214SFBvS0tMa2tXWFI1S0F1MFQrUFpmcVV2MVU5OVoveGhVQ3I2?=
 =?utf-8?B?ZEZTYmtJVHFqeE9MNnlBaTMwczQvSG5sUGJqVUVKbVNhNThvTzhtOE1DTmFS?=
 =?utf-8?B?YkROVWZxOEx5VlUxbml4c0E3bVFzaVBJek5CeW1KMTN6R1l4blBXQ2tUcEJ4?=
 =?utf-8?B?T3ZHZWNnU09ZWnFiV3FlK3VMcEdQUmFTbU80WkJzVzJvR1IxMGh1NTNpK3pN?=
 =?utf-8?B?L0tQUEhBVnp4NGE3U0ZwakttWHUybTRqcVpLeGlacGJyUUtGWVA0TG9BRlJN?=
 =?utf-8?B?bWk4YmVtVUdGd3pFd3BiTDNxeExrYWVMTDhrSHhaMUJCak9QeVJTWWdMK0Fh?=
 =?utf-8?B?VzFRZEtKVjk1elRBaFRhaVhpTjhHSk5VWGNDWldvc1IxYnQwalBNcElzUUtn?=
 =?utf-8?B?NDM5N3YxbCs0UU41ZHM3Y1RCVEJGTVlMK1YyNzZ2dGpYQ1N4UW4vMUI2T1Ux?=
 =?utf-8?B?WFVqYjhwRG0vT3FrV1ZBZ001ZlZaQXVkbnBSVHZlTjFRU1pqR0UyMUhpVVJ5?=
 =?utf-8?B?ODQxTHZ3ZDlsYXI1RkRlVktvREtYUTVxdi9IdFZlbm00OCtTY2t5T1BCOUJh?=
 =?utf-8?B?b2thSWsyNktyUWk4SUFMY3FkQUZsb251TUdWeDd2SG14MGpnRzRKNXJrcDh5?=
 =?utf-8?B?YStuUlJBM0RWb1FIYlk5aGd4R2xEU2NPVktHOEFWSWM5WDVTV05MajZqMHNY?=
 =?utf-8?B?ejNyTnNYVEtwbUpmU1RlaWFRSVFFN1BoWkc2K044ajlGOUp5SVVsaWViTnJ2?=
 =?utf-8?B?RnBZVXI3d3g0SmdNM0RweHM3S2EwWXFQZUtBNU9GaUIxVE9XWENQVGlCelNa?=
 =?utf-8?B?clNBU2ZoUmJCakY0NEx6dVVZbHBJV0pLSnNqZHF0cE5Ja0M0MEl4bEtRUnM5?=
 =?utf-8?B?enhMbWJPdWI4emhvNy9uN2ZtTWJiUmxoMXRHbENzUm9aL1VrR0EzS05FVlgv?=
 =?utf-8?B?M1FwOGRPbUJoL2RvSFYwOVIyODR0SHNtTm5yZDFHMDBqNmhSZjlMQS8yVGRF?=
 =?utf-8?B?SWFWV1JhMi91TE1MRGhLaUdRYy9zbVBua2RzYkVqN1FRNmVkTTFmdWNHemxK?=
 =?utf-8?B?OHdSWVlYWEFrUklHYWRUTUdxYzNkZ0gvMTBpaUZubExtWnFDTWdBR0c4OEM3?=
 =?utf-8?B?M2F1ZlVwWTIxckVvMVI3UmtCRDhiVjBQdEZEbEhWYUdKRUx6anJIVlNndXdR?=
 =?utf-8?B?YXRwTjZ6UGhXUzQ5Y3ArZEQxSFZBWURSc1RpNndoanBaTTVtNzJoanphYTVM?=
 =?utf-8?B?ZG5GOURyZ053VE51S1JTd3UySldPNjhrMHljcjZIUVVyV3BPMVIxckYyVVFT?=
 =?utf-8?B?ZFNLZmtJenl0QnFqM0c4clVoejJhR21taW9MM2MrTnRHeHhXL2hnSVF5cklx?=
 =?utf-8?B?VW1UTEZ2aml4T2NTS0N6eGpwWnJnZ29Cc2REbkVTTk52aS9EMytqdDJJUkpQ?=
 =?utf-8?B?dFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ca4304a3-2869-4425-2456-08dcc15d430e
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5089.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2024 21:15:48.2007
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y1SevOkEeUa5Z5+dAKGl0eo6Sv+zedn0Ys2AHhgStwE3Slc91W4QEg2vyWl8jhEZwUm2ShQ+vi8FmnSpOk47K3XiXUqXA8vbL88ptNiKKE0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4852
X-OriginatorOrg: intel.com



On 8/18/2024 2:50 PM, Jan Petrous (OSS) wrote:
> NXP S32G2xx/S32G3xx and S32R45 are automotive grade SoCs
> that integrate one or two Synopsys DWMAC 5.10/5.20 IPs.
> 
> The basic driver supports only RGMII interface.
> 

You mention that it only supports RGMII.. so...

> +static int s32cc_gmac_write_phy_intf_select(struct s32cc_priv_data *gmac)
> +{
> +	u32 intf_sel;
> +
> +	switch (gmac->intf_mode) {
> +	case PHY_INTERFACE_MODE_SGMII:
> +		intf_sel = PHY_INTF_SEL_SGMII;
> +		break;
> +	case PHY_INTERFACE_MODE_RGMII:
> +	case PHY_INTERFACE_MODE_RGMII_ID:
> +	case PHY_INTERFACE_MODE_RGMII_TXID:
> +	case PHY_INTERFACE_MODE_RGMII_RXID:
> +		intf_sel = PHY_INTF_SEL_RGMII;
> +		break;
> +	case PHY_INTERFACE_MODE_RMII:
> +		intf_sel = PHY_INTF_SEL_RMII;
> +		break;
> +	case PHY_INTERFACE_MODE_MII:
> +		intf_sel = PHY_INTF_SEL_MII;
> +		break;
> +	default:
> +		dev_err(gmac->dev, "Unsupported PHY interface: %s\n",
> +			phy_modes(gmac->intf_mode));
> +		return -EINVAL;
> +	}
> +
> +	writel(intf_sel, gmac->ctrl_sts);
> +
> +	dev_dbg(gmac->dev, "PHY mode set to %s\n", phy_modes(gmac->intf_mode));
> +

Why does this code seem to support others?

Is that support just not yet fully baked?

