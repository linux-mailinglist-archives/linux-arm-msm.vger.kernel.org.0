Return-Path: <linux-arm-msm+bounces-29150-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6494E958F77
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Aug 2024 23:10:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A12CAB22C89
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Aug 2024 21:10:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A1BD1C4631;
	Tue, 20 Aug 2024 21:10:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GmGn9aRl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C2F61BE222;
	Tue, 20 Aug 2024 21:10:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724188206; cv=fail; b=PTq9DDSg5k5fGjfkDjEkG8YjN4/KJG3ZhW0O3kyWwY/v1k9u1+Fy7A2nXOvK2O7orNcHyZk1XmYtMAqs6nGlClLD61/QsJhyyTcbzJ/ShiJojwxe7b1+E3U4xznxc+iQZFl2PJZ7aQuao6FS/ad2uJ2dSqWUxlMRGzllTP1kK8g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724188206; c=relaxed/simple;
	bh=PRswDDjsDNBF9q8wsfSzOked7zdtbwC49Mu3W2ANqdo=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=QHn1jzsit+L28WT/lUIglZVdin+l/6X3czoW5wWq/bqQwI6hb68w0YjGeth4Udkvzt/M1/P6Sdn+g54q16VzhB2W5xHvRpFShTtDDmjBk47AEhfLf6H4FBC5cHo5f+I+o+IjZhXRFVGvkTcaQcGxZu2599LxRS7wpVgIJE/lyyM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GmGn9aRl; arc=fail smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724188204; x=1755724204;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=PRswDDjsDNBF9q8wsfSzOked7zdtbwC49Mu3W2ANqdo=;
  b=GmGn9aRlkjz29KUfx6upmi8oBc61zx1T8n79rad6QHkKsnZHB7MRS/YI
   Jm3J6JmAyKQC16ssU4WYEKZapsLFcyoQkWtUHMW7xT8g41dvSO+Pb67Mt
   7PimUcPjeppDZjkOoiMEzQ9fo7dOWDFnaGBlXikzU5DJ+jBRnkmxplbpN
   Muw64a/FjTGdMvfzVvkma6gJQhR4fzW3mnVEyBK7DTzb4HR9AEbIyysMc
   bcU3LriyPo73hiQ5S92wdVVQ7a6ga5aXw074P9ZeNjoYzQGx+0MSp4GVB
   bBagiFnXYsZPhenWsDIGeJ2tCZbtXyvp6QX2CnLG0SBUUBK62eLbjRJtj
   Q==;
X-CSE-ConnectionGUID: VNJ9+vrXT0iCY9Z9YAZ/UA==
X-CSE-MsgGUID: wE/cSymFQauCw1LTRuvcvA==
X-IronPort-AV: E=McAfee;i="6700,10204,11170"; a="33933809"
X-IronPort-AV: E=Sophos;i="6.10,162,1719903600"; 
   d="scan'208";a="33933809"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2024 14:10:03 -0700
X-CSE-ConnectionGUID: Fq4lKmkqSlKDycj1woII7w==
X-CSE-MsgGUID: gWjTl5J6QpyvT3lnVjYing==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,162,1719903600"; 
   d="scan'208";a="61631043"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 20 Aug 2024 14:10:04 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 20 Aug 2024 14:10:03 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 20 Aug 2024 14:10:03 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.175)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 20 Aug 2024 14:10:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b2oVbuZXSUmioO6rt6XKO7LmIGPiRn+jV2uFXCv6cdjn6i1VUubFdZ6UowLz8G4AciGjjCc4lrqDGRiNeyMt4IpaOgoJdzNmBXlJd9tKZT7tXqfDh/pSYnZiRxrVSlY4NzCaWcsbYj3F/r96QZZkhTCDNIfJszqqzKXaV5IwWkkFlfuYB3ddJHUiRLGKsUQcI5QbAAlck4+hCXroiPQz79wdVhd46xcW2jSh0Z0ZeoDdPF3nIekAZzItJEyWocEyDb2YAReIvaoezMbxT9ZMbeJvbwAlRMjEHmEGjjWWkUwsOSZtOv/USf27Mwp7zUm7exsE/MFvk0gx7raiW9XcPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J4jqk86LeesEhKNTTRhVrupqrL5s9Z2G0PhpxQFPrak=;
 b=Vudx51hD6mbjeABZx0Z/pMDzY5/csfJgLaKj+ax1qR8B4a9LZ98yO3YSWaHSDDKUNdfe+Xd4wE7kN275OcIcMj7rNcZPSzjmt2WN5BbFVXrIpcwdXimdNl2EujV2p+eo9VnWsmSxglGnWohzpa410A+9F0qUR4JmNemeeUZK3qx3s6ky7AEIDm4QHHzojEJemvUGb4RBOnPgoGjPtanKwiAccNHZOTwayRs5z1u/apkfigBAgmmBsLFmiUcpV3urX7Wa4hbEoPOXmLCVuICWZXTASh7J3THkHcCqRKQvl4+zFwaXV6cavEmPf6Su2DkVnGQdoRgm+wLmj6x269TV0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5089.namprd11.prod.outlook.com (2603:10b6:303:9b::16)
 by BL3PR11MB6385.namprd11.prod.outlook.com (2603:10b6:208:3b5::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Tue, 20 Aug
 2024 21:10:00 +0000
Received: from CO1PR11MB5089.namprd11.prod.outlook.com
 ([fe80::7de8:e1b1:a3b:b8a8]) by CO1PR11MB5089.namprd11.prod.outlook.com
 ([fe80::7de8:e1b1:a3b:b8a8%2]) with mapi id 15.20.7875.023; Tue, 20 Aug 2024
 21:09:59 +0000
Message-ID: <35fd8e73-2225-4644-82f1-037294710d30@intel.com>
Date: Tue, 20 Aug 2024 14:09:56 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/7] net: driver: stmmac: extend CSR calc support
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
References: <AM9PR04MB8506A4B49180F34117B93655E2832@AM9PR04MB8506.eurprd04.prod.outlook.com>
Content-Language: en-US
From: Jacob Keller <jacob.e.keller@intel.com>
In-Reply-To: <AM9PR04MB8506A4B49180F34117B93655E2832@AM9PR04MB8506.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0191.namprd04.prod.outlook.com
 (2603:10b6:303:86::16) To CO1PR11MB5089.namprd11.prod.outlook.com
 (2603:10b6:303:9b::16)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5089:EE_|BL3PR11MB6385:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a6882ba-7a5a-4c8e-787d-08dcc15c735a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7416014|921020;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZEdMYjZYcURFYmZjdE5WMW4rd1p5NmpiQi82ZnpETWt4c3dPNTg1cTFwLzRC?=
 =?utf-8?B?Um5JajZDWE9yaXA2alhvamVBLzdHc29nZWZQRXc2aVZOK2ZXZEN2Z1kvdGVV?=
 =?utf-8?B?bG5Rbld0TWVtam96MzR0dXhVdFNyM3lXUDlrS2FKN3pkMUh3Nk5ZOGpTbC9N?=
 =?utf-8?B?aTJVSEc4UTFtdVhpUENNYmNhUXdiRUU0NVdNWjRkVmpTV1FaMjUrK09KY0FX?=
 =?utf-8?B?OTJyUVFjcFZ3aGxSUWRDaEJkQVdTcUNhSmZ4QmI1bGJhUVRsbnZGZUpLZ3JY?=
 =?utf-8?B?NUNaaUNSQ0tOTVhoSlFBOHgxWlVaL3NxOWh1QXErckhIbGRicWhqTVdrR0Z3?=
 =?utf-8?B?SEd5VnVuRHA4NFZDTWdqTzZpS1ZYdmMvMkJOTmtxekpVQ0hEbW9WNHAzZitP?=
 =?utf-8?B?RjFUSy9Sc0xSSkQrNW5SSWZkU240aktqazNoS0w1NlJINHFrMjFHa1YyZzJv?=
 =?utf-8?B?RDFlcXBUZVlGTUwwY0wzTGtUNUl5TEVTYjU2YlAycnZGMGxZZk1pKzdOWWRr?=
 =?utf-8?B?c3FMTVZ0dld2andCUnRvS0dEZG1nQ0VyMkVkbEpVWHkvR01JMjA2MTVLYUd6?=
 =?utf-8?B?Q1VQOHMxck8rVEV5eE8xclpQMUx3eHlTTGlhZ1NTNUR4Y2RRVzB5bE5kSmlh?=
 =?utf-8?B?QS9NQkIwUW5DME8zcm5kSS9pZ3I3YlNGNjZiMENYUG1XVytIWVh3OGVFdXIw?=
 =?utf-8?B?UjQvRk43UGJmWVZVMW9tejZIWDA0dUtmdE1ZYXVQaFVheEV0cmhvT3NqN0Y5?=
 =?utf-8?B?akJVOHYyZEJNb0FwV2p5MTlaajhxdlZET0lBY1V1alphUFdMYU9UY2svMnlo?=
 =?utf-8?B?ZnU0ZENKQ0dUSWp6K1J6ZzNmc1kzYzU1QzJPSDI3dHlsRzd5Y2FRZnA0QXlW?=
 =?utf-8?B?Z2dBLzA0VDBSbHFZNncrS3lEZ3p2Zjc4cUhXYmVZTzhFaFdVeUFqdHQvdDFH?=
 =?utf-8?B?MGx0bm95WXcxTllkUk5uaHVEQXMxZHM1ZFVFMEVlY3RCdUJlQWwxcVJVWTVZ?=
 =?utf-8?B?dkdiTEZGNUNpc1ZjbWFieCtHd0I4YWFGOExFYmwwVmdGSE8zbEhRbVFBMkJH?=
 =?utf-8?B?Z29tZ1RRQzFwVFV2RnA3dHFDSGFQSnBFQmxlNVdvVW1PU014anFtMDMvODB5?=
 =?utf-8?B?T3NuYkdNUEpCZ0tXRXZDejYrckdENEdxNEZWb0JlU2NjTXRKWkhXM2VZRkFC?=
 =?utf-8?B?YzhlUUw1UzJyUjI1T21DV0JFL1p4MHk5ajBQMS9EaUxMdkJmTDZ2cFBGekE5?=
 =?utf-8?B?T0dNNERRQjA1dkVJUWhPSUM1eDhIdzdGSVpnUGZGeTFtUTZyYTR0eGlLb3k5?=
 =?utf-8?B?aVcwTTl0M3U0NFRZWU9KbURFOUszdUYvRjFlRmcvOHpFQ2RYMFg2TCsyNnhL?=
 =?utf-8?B?V2UzeTZpRnppbjdoTkppSmdOVFZieU5DeUZSOSszVFlucTQ5SkRtaGlLVklR?=
 =?utf-8?B?enUrcStrb2FjVU1IdXhRdENOQUJON2hRcENlR1dsb3NhL0Qxc1o3QTF2K05P?=
 =?utf-8?B?UjUzbVNBT1RQUkoxSlhZK1lhVXFvS094UEFEdUtPeFRVRk5keCs4Y2xXYSsv?=
 =?utf-8?B?UGtISUlvam4rYmdpOXZaMkoxK2ZxaHdDSVhtSkg3SGZlNXZpU3J3RFYrbUYr?=
 =?utf-8?B?UHVSRFNzczEvZHFkckJ6eUNyMVdGUTBGaldXaTRZalhaVDFybmlYa0d6SU0v?=
 =?utf-8?B?WDhxNGpzTlRsRjVoZ2YrVE94UGJmYXQ1MjdaYjliZHpDWjNXNEpIMWEwQllV?=
 =?utf-8?B?dFAwSzM1ZzNhSzV2QkN2NnZzVzVpMTRWcTNySmtpQkRWRHZQaTVnRUk2QkFC?=
 =?utf-8?B?c3B3UGdsUDFRc3Y2bEJFT2NUTTFFRk5NSjZmckN3eG5GMWNFWHI2dmhCd3Zq?=
 =?utf-8?Q?G203LPjRwBgOP?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5089.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7416014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Uk1QQk01a1h6ZFEvY2lXcW9NcHBzallscUpxZHoxaUE0S0hvQWo2RjJVSkNh?=
 =?utf-8?B?NkNMTUhEN1EvWTNJZTcyVTBZTytlQ2xvY3lLY25RT1R0NlZjRy95a1M5ckhl?=
 =?utf-8?B?VVEvb2JDVmJwZmJLUmFkMWhjWExVUGFwNEViT3RaYzhScVA1M2NpT0JuQU15?=
 =?utf-8?B?dUJ4cTk3N0JtU1lGeGZWWU00cGNrVjVHV1RwVDhidnEvZUNja0Q5VXJmTTJF?=
 =?utf-8?B?MEQvdlA0eUZPYkJQSFc3NVNXeVk0Y3pQS0pFUzZiWSsvM3hLSjMvS3RpMld1?=
 =?utf-8?B?WlJlWjR1ckliMjE5YVVOOFQ4dlVzTFJkamFyMzFuVjIybjI3dTZ5K05Yd083?=
 =?utf-8?B?WTc0cVh0Q3lFdEN6VUFmOFIxOWVVMHlGQ3BUZDFvTUs0V1k3ajE4dnhYRzFM?=
 =?utf-8?B?ZXpJdzJxdHZQZUtkV0tkTXFOQ3JvZklTRDV0NmNVUjNDRnlOOXExNjZWNDB4?=
 =?utf-8?B?S2NsNVVpdTFHcEQyVlQ1VG1SU3VrRE03YUJrZ0JUYzlrUE8xTHZRak1wMXMv?=
 =?utf-8?B?N3VjOGMrMDBnOWNKdnBVRUdvQW1scklqY3I0OHZWeHZEcFJ4bVZUSzl4c0Fw?=
 =?utf-8?B?NTRCYkk3a2R0bHBNQkNHOGhwRXNrNlg2cVJzRlJST1h2UWJRa0N2VHhxV1d2?=
 =?utf-8?B?ME1kLy9XbmVRZUttd0wvVER2cHZaSS80UkduSUpHM1NvY1M5U3V3aFYrZ3Jt?=
 =?utf-8?B?bndhc2JWU1lQd0FuUVFNVk5jb0RuUjUwbXhhWk5sTENId3UwOGJ1NzkydGlP?=
 =?utf-8?B?Skp0cWc5U0c4RnVRZUIybDNTa2M0dTgvbzc0bHJOb2Y2TjdIcThlbXdPdDF0?=
 =?utf-8?B?YmRRa2g0a3Q4ZTkzZnhRQVlUMjJiNGhnb2lZNlJKTVdVZDI1WlU5QkVReWkw?=
 =?utf-8?B?MDBnOFdWVkNVMm0zdFdBT1YxQmlTYXR6K011TDNwSWdwRGVFTktDeWdQeU00?=
 =?utf-8?B?QzNoTWNGNURnQmcrc3VxVEVhYXlGbnRCd0FhUTdUSndHNzY3RzJDTGJpWDhV?=
 =?utf-8?B?MU4rVTcvNENMZVp5NFVFVFJRYTVITUdpTElvYnhxemRIVHlOeHZnbEJhTjBG?=
 =?utf-8?B?TVE2TEZJQStvYTFiUXBwNDU5SHFrejNwL2VNQzk1YmEvM0hlNlp0THJkSG13?=
 =?utf-8?B?K2IrR2MycWI1a05yVDgxanJ3MU10MWRSWFd6eFhla2tmM2JPQUJva2pXYWxq?=
 =?utf-8?B?R0NyYkxPcEZYRTQ5OXZZUm5PMTkwSDJpVWZaV0ZsZ1JHbE4wYnNkRTBoUVpn?=
 =?utf-8?B?SHJaUGZBVVZDVDhsbWEwQllGVlY0cU9VQkswSnB4OGJpNnp3M251K2MyZ3lP?=
 =?utf-8?B?QXU5RmZhbVIvYzlRNUN2Wm5BQnViRy9uaU04b3pPMDNobXFYR1J6cm50S3Rr?=
 =?utf-8?B?aXAyYjNtcUFObC8rL0VBbkMwNzVBNVpxRkNSdllIT0Rqcm1nbzhyaE9ReERx?=
 =?utf-8?B?bkg4SzNXUXMyaGJnQkZ5WXJpam9wNVhIaVhDY3E4TGtTRThGaDIrcEVTeVkz?=
 =?utf-8?B?ZkFHZ215RFhYd0EzNVRndC9wcWtVdkxxRzlZbWFHa3Z5NzZNR3plTGVlZnUw?=
 =?utf-8?B?MVBaVFpZb1QzZlJoVk50bjV6QjJkL3ducEMzaU5Ia3pTc3kvNjhaZkF0aGJP?=
 =?utf-8?B?MlNaVityYlpOZU5oQzFpZjd2cG8yY21iWGtPTThhcStVYkZKUTM2UzZEZHBw?=
 =?utf-8?B?bUd6TmlPdVREWSsrT2VIZGdYeGtuVmswRVllUW5YNWxIcDBxcld3MXR3QmNW?=
 =?utf-8?B?QzNnQ1NWODl4MWZTS25HTWFONEVFMDdyNjdDMXFGWGF0K1BDMC9sM0RBMC9K?=
 =?utf-8?B?N1ZhSnZpRVQ0dFg1QTNQNWdlaUhWSkdIVmVPcFBMMzNqMzBDV3hxUVY4MzJK?=
 =?utf-8?B?Vm1hdi9Db0JsYm9Na2dDVGJ4ai9nZGdySmIwQW9HVm5oVUNFTzR5THJoSGZh?=
 =?utf-8?B?amt3czN4amhUa0gwUHU0TWpyWWdRcjkvSlhkSCtvcnZmWHZXZm5MbnFJQncv?=
 =?utf-8?B?R2FrZEpEaTRSbm5wRWd2T3MxRS9RWDl1WmUyektFU0xVcHAvdW41UTV6Qm9Z?=
 =?utf-8?B?bXRBWk0zQ1VLaS9RRFliTmJncnM5MmlDVDNaVzc4S0VhOS9sVU1Rb29RdHpK?=
 =?utf-8?B?MUtYdC9pLzNWeEtaUlZxNnRUSzN4YVQwcFJ1clAwSzJvQkJuZC9xd2tzU0s1?=
 =?utf-8?B?VlE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a6882ba-7a5a-4c8e-787d-08dcc15c735a
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5089.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2024 21:09:59.8314
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4NsgfAh8pAaM5Xm/rRfy3Quub0jNWH90cng4InmIf60WAcCJmku3Em5J6lcQXtgqQhlJVdbeVDKeqyFHKvrUXbWcqe8svTXB7oq3nzkS8E0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6385
X-OriginatorOrg: intel.com



On 8/18/2024 2:50 PM, Jan Petrous (OSS) wrote:
> Add support for CSR clock range up to 800 MHz.
> 
> When in, fix STMMAC_CSR_250_300M divider comment.
> 

The phrasing of this was somewhat confusing. I would also have chosen to
do this as a separate fix, since it makes reading the change somewhat
more difficult. A separate change could also explain how it was wrong in
the first place and add more context.

Either way, I think its a minor enough change and it only affects a code
comment. Not a huge deal.

Reviewed-by: Jacob Keller <jacob.e.keller@intel.com>

