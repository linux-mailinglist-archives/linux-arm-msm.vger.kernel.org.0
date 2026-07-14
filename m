Return-Path: <linux-arm-msm+bounces-118980-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 4/dJMgLrVWp7vwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118980-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 09:53:38 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 36E2675217A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 09:53:38 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=hqnqgT0z;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118980-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118980-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3B4FB301EC76
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 07:53:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89DD53F23C9;
	Tue, 14 Jul 2026 07:53:33 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCAD82BEC4E;
	Tue, 14 Jul 2026 07:53:31 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784015613; cv=fail; b=bDkZgSI9MeO1sp7WiyjSXDq8+cVtQ2/Ouw0B1xH5EnzWgTx6pWvJ93HqMjdkuS4HhMDYEt4ZgehstFDI17LmDPteI+Wi2Kx012VceSCOZKgH3uEDsmHco7Z+ZlTzDvH9LOHkkdGO/sgfeteVqIflqXaxrSj+mskQIRaKUjy60eE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784015613; c=relaxed/simple;
	bh=jUzl6OvdhepovikQjq0VbRFpobVwlC8NFU1J/UHnnBo=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ti9L4WXtfeBeDya0pZyxcgTX4HGOBVKFjZ0VLiUSCZcOqP2TAVYD3Vl4Ao7pZBQCn9w00281ubDWZvna/dRUxdHYbAr29b2AbRXL1RD43tXtVGyY4K84sInYPbuXPxwZhbZkkhGH/DKBXJN7mbuZeGzb8Ycx4/03sfh+1NuPffM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hqnqgT0z; arc=fail smtp.client-ip=198.175.65.19
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784015612; x=1815551612;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=jUzl6OvdhepovikQjq0VbRFpobVwlC8NFU1J/UHnnBo=;
  b=hqnqgT0zADu91ifwxO5kEq7YkB+UYpmD4hwkpp2N9cRpjNgD0BhVwVBT
   5g7A1FMG0Cn8oPNOv6MBFNyXb5/uw1vKo2A0Y3+Y5EvFhUdWPXaYTR+Da
   2TQrg0BIUn3V5pNQCEwSXaGpDQyav+b2uikSvxBsL6s1eFquty0WfDQw4
   hWB/FafWbysGF7ja9ECEUDM1mfUhKWlwXTCpzPjUkGOEmABGXIwp3eie0
   6FEavksp+TWtucCjqv3CBkwDmtfLnMJzF2nJX9UWENGLQVTAyQfve11cf
   MSyGSLuMBvXcKTvXZWYPrdCaQmWQ7NHMroKOwh13ifYK1M3qZw056iaYD
   A==;
X-CSE-ConnectionGUID: gP2VRy9kSy+cO7/F4eppNw==
X-CSE-MsgGUID: WsCjQzX8RXGyz8InBtgsyA==
X-IronPort-AV: E=McAfee;i="6800,10657,11846"; a="84594829"
X-IronPort-AV: E=Sophos;i="6.25,163,1779174000"; 
   d="scan'208";a="84594829"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2026 00:53:31 -0700
X-CSE-ConnectionGUID: IWYdDhmiTdCBaQJw34gm9A==
X-CSE-MsgGUID: EszaUIrfR9yCRQ6ziSZIQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,163,1779174000"; 
   d="scan'208";a="255844215"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2026 00:53:31 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 14 Jul 2026 00:53:30 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Tue, 14 Jul 2026 00:53:30 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.22)
 by edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 14 Jul 2026 00:53:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Nk3G1kL004Sbw/cK2C0ncuJE3UIzg0J6W3tY08v1fzyNTFaL6EfQJBPxpZQBe5dmWC2/EN4+Br0SfwaSzszRD7F9NCW7Hk2XFSRVlPvk1AJbz3W4Pdp35tSZbcSgH60oQtvhsS29YWNx4A2Ag6BaT3PtfckABI8rx9/CA/znwuzUntt7NOzoMMyQQEwJW1251OgbNbXT/qGw2k3SqEMtuAgkvtzx9KYHNUQCtffvK/X5rIH7TzmrPSsSakZtsZ3KrEEqDDk+TA3WhVbSc3BCcKWZtAylRNG4Jgl3/YsVvHRV5zjNe6hi87xNd1zFA9ATSCvlZ1TNBSomQb45PLeCQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jUzl6OvdhepovikQjq0VbRFpobVwlC8NFU1J/UHnnBo=;
 b=r0D/XyyYBivIQa/suZqdZxCJ/gZOF9AI4hWiHl0ZN90TWQaXDOvXnC2LHeUrSK7fsNwe70Ng7GUA6eHmpsafe6MLg+4xjbQFR5q+M5WDC65MqQqPnZ/Zvsw/35jwVcF5GNq0MM27odrbtaoNbHhvMXkh3+uRatqzQAF69hvMxVTije5LNtWGzd/x04GJTfWYRCk6y51JNnPfFYHa00XXIT9HqqlKG6WIAmSM6Jws7eIuRbksdMriHrTPN93vOTr1VQhvkWiZdkpdo/ZIdtPOnfNdUYSxjdbhIQmFVuh1LW2w7vhv/Ai34G1vx9Hq5fKmKrb2TU//PClzr0dIZtPvNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH0PR11MB5902.namprd11.prod.outlook.com (2603:10b6:510:14d::19)
 by DS4PPFFCBF1B4C7.namprd11.prod.outlook.com (2603:10b6:f:fc02::62) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.22; Tue, 14 Jul
 2026 07:53:27 +0000
Received: from PH0PR11MB5902.namprd11.prod.outlook.com
 ([fe80::f95a:602a:34d3:5d37]) by PH0PR11MB5902.namprd11.prod.outlook.com
 ([fe80::f95a:602a:34d3:5d37%4]) with mapi id 15.21.0223.008; Tue, 14 Jul 2026
 07:53:27 +0000
From: "Jagielski, Jedrzej" <jedrzej.jagielski@intel.com>
To: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>, Stephan Gerhold
	<stephan@gerhold.net>, Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
	<davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
	<kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Loic Poulain <loic.poulain@oss.qualcomm.com>, "Sergey
 Ryazanov" <ryazanov.s.a@gmail.com>, Johannes Berg <johannes@sipsolutions.net>
CC: "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"chris.lew@oss.qualcomm.com" <chris.lew@oss.qualcomm.com>, Deepak Kumar Singh
	<deepak.singh@oss.qualcomm.com>
Subject: RE: [PATCH 0/2] net: wwan: qcom_bam_dmux: Alloc RX buffers as a
 single coherent block
Thread-Topic: [PATCH 0/2] net: wwan: qcom_bam_dmux: Alloc RX buffers as a
 single coherent block
Thread-Index: AQHdE1JzoQX4BiQs7kaM3CY71MxlrrZspPrQ
Date: Tue, 14 Jul 2026 07:53:26 +0000
Message-ID: <PH0PR11MB5902886DEDB417349E5E6E44F0F92@PH0PR11MB5902.namprd11.prod.outlook.com>
References: <20260714-qcom-bam-dmux-vmid-ext-v1-0-3f29da7cca76@oss.qualcomm.com>
In-Reply-To: <20260714-qcom-bam-dmux-vmid-ext-v1-0-3f29da7cca76@oss.qualcomm.com>
Accept-Language: pl-PL, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR11MB5902:EE_|DS4PPFFCBF1B4C7:EE_
x-ms-office365-filtering-correlation-id: 2f51268e-a182-4156-8740-08dee17cfcf3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|7416014|11063799006|56012099006|18002099003|22082099003|38070700021|921020;
x-microsoft-antispam-message-info: 9XYq0hHinxwdix9kjDv/vKEIZGjhFAow/pDu3LJ/iRXHVkrccr8y/2YV9Dcy9wEebe7V8JtLW/LxMSYSlCVkF9aOYROonkyw8IMDc0ZVA1jsk5ubp7ytkRglWyBl14CQex121bywj1s1DCRTbQtEsdeYCZpkh+mOi/WqMDXcckPcl8Uxf7KoJ47B9Dd1WsI3QdVq/jK3xMemlEP9zwNr51w/t9QvIcw5FMPPpV3hBsdfGZjxzHhlOa0H5G8B8Lq1WroFV6qVxS39JxG6HJ8PTwGAOH9nowLmj1/9SkZQXzkk7QEea1JfNYsCGm+pB5n5fNk2RF4Yckjepho0rsIPNu3Qxfq1c94oCS57Y2XFIMw4jZ88A0qmhYvz3rFvdGj7N+UaAgw6tWGa0Ywxoj+YsAt8FSrbqH5YxwrNSPaI5cHCc+lHwhUwe6q7R7QD+KkHJg44mNDQW02Dp1KqPCEhZh0gHo7orl06p1E+dY9LrFsgl6alKN80Jv7aI9QjOwFkm0+esHbtqmipEIL45dJXJihDovPp4ZyDsV5sWNLmafU9l1ms/IWS+gSf5L3Dmi83AZkQ+Wm8ei4m0me9FCgdg89fxHYSev3YaJ+aV18k89tUagdTOR8e3lbNkSzvo7u5Yji6o+AVw13GXX8PolZ3Ch+1tMXcfYjWhdQJRzO4TuFNyQRuh6oW9vbwgbqFy3HD0GrBScD+8zkOCfbOYaDJ6lX1Sn3i8q8CIhrycCOPNb7tWcamALwNuHbBe6FgJRK5
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5902.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(7416014)(11063799006)(56012099006)(18002099003)(22082099003)(38070700021)(921020);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WFdrVEVtbjgrd1h4ZzBwb0NZL2h6Z2NiUWFHUjJaeWlENjBkbHN4R242T3pR?=
 =?utf-8?B?bjZPOXFNL2hTNTk4aXV3NktaN1I2aWJmZnNxWGFCVUNORWFrd1g4UHpoZmxJ?=
 =?utf-8?B?THRXQjF3SFdoV3hTcHdsaVRpdGl4NGdFK3BlcWt6ZGJFUjdTaWo3cU5xTkRT?=
 =?utf-8?B?Yi9OenJyQXB1YUtYSDNyWVhFR1VPRFBkd0hWMVNxRGlPQ3A1NmxCZnBLY2JG?=
 =?utf-8?B?dFNHLy9OMlZwUXppVHg1ZHZoUWxieXA2ZGVabmI1S3NTVzEraTQ1c0Z2VlF4?=
 =?utf-8?B?czRpZDdEME5mOVk1TzNXS0EwaS9aN1YzbzBWc2twaFpjbXJNZ2oxYyt2bWY0?=
 =?utf-8?B?aERwNHNPc1dIdXpjcEdoME5vOGx2TzJrbndXaHdKVThNWitkdlhvSmVzOExm?=
 =?utf-8?B?Y3BOV3czZzJTL3g4TXJVbzE0bWcza1A2dVNZQU12cEllbVYyZ3Raa1NZNzQ4?=
 =?utf-8?B?RFpuS2FNZnlBaXVTTXROVjBtYmJrSXhveXlMVkRlMVQvcGZqSjVLMFA0TmxU?=
 =?utf-8?B?ZXE5OFE0TzVNYzljZENEcmpSZ05tR1Y1bnlYWExYbkplKy9KTVR3bHo1Zlpj?=
 =?utf-8?B?LzQ1UGs3YnNmOHlFZ1VXL1FyUXJUNkhLYkZIcUwzTzlNWjh2YU1nVnJwZmZY?=
 =?utf-8?B?aW1GaWxrUmlYR2g4cmFNbVVvZENhNlRGdENPbVVmY3hFYXlpNHl0enh0ZnNs?=
 =?utf-8?B?RWRWOTdsZHdNdytiYjZYbk1VdkVJUzk4QUZSaXUwcHZJcUl6VHFmNkZGT1NJ?=
 =?utf-8?B?RlpJQk42RXJRSDg3OG03QmFxR0FlQjNlY3lxRjMzcDUybkJOTThOSUVYL2JZ?=
 =?utf-8?B?NE1CNW8wNXkwbzd0dlVaS1V5Ym5HZWxSWkxRNEhYRUtGc0pnTmpOSXBxYzlY?=
 =?utf-8?B?dDEvMGlIdVBIeGk1Q1RYYkhLdk5rL3pzdEhtdjlwaGJ4a3VVTDI5VVVlQ2J5?=
 =?utf-8?B?TnJncE9UM2s4YUFnNXNoeFFLV1VBQXRJZHIzNWtESUprcGZHcFUveTZDVFZG?=
 =?utf-8?B?WjdZZ0MxZXlZOUxYcmVFM0lNdmZ4V2tNMjF1WDBsUkY5MThCVkl0QmxtTzFL?=
 =?utf-8?B?ZHFNYmJId2RSUDgvNVVsVlV6Z2g1cmw4MllsWFA2Q1craXJwNGcwNjYwNmZI?=
 =?utf-8?B?SjdXc0FqMk11dzRHeW43dDREdWRqb2l0RUMyQVRKYjJ3ck9nN3NxbEJZRS95?=
 =?utf-8?B?UU9FSitEbUNoRytROStvaVBJZlZaU2puWitybCtZcEtYTW43U1o3dzlWR3V2?=
 =?utf-8?B?UGp4Z2FReXdmR1FvdTN4VGZGLzA0a3pwZmpZaTl4R0Q2T01NenU3R0NyR3V0?=
 =?utf-8?B?RE9ZK1VMOWJwNldqeGdiMHIyMzlFb1laaDFTWkFKS0lnb1JvNUFqa0JEcWZn?=
 =?utf-8?B?RGFsVXdZQU1MenBySW5IZFFZYUhQT1NER2ZtM2ZnclY1ZHQ1b2c4M0NJSVBO?=
 =?utf-8?B?dm5rbVkxVkd4cVZKQzQ2NDQ2alhwaGhOdEM4VjdXTW11K0V4eEgxTnYxN3JO?=
 =?utf-8?B?QndRWCt1ZzdnTmZjLzhUM3FrbDBZUUp4WmpQKzB6Zy9Nb0x2dFpWV1FLK0RZ?=
 =?utf-8?B?Y1krZjVVTzNsV09KSU9zci9Pek1uZ053eUJEVlI4dmhvbTJDdUFEYktwTHVR?=
 =?utf-8?B?aHgvTVozaC9SbkhCVE5wOEFCazhhL3dtTTZJVXh4YnYwbFFXM2dGSVBxYTl3?=
 =?utf-8?B?S0FBWXpnb3YyZlp3aktaUWs2SEY4aEE5d1RUY3N6YXlKajNqRGszMXVJZ3Fs?=
 =?utf-8?B?b1d3MzNHOVB5Z0VrQnVaNFIrOEVtbGNIZUdVK3BRaGZLVHZBN3dOcWdMbDQw?=
 =?utf-8?B?Uk9SRlFldW8zZ2JUck9wdjc1SG93L1pGa3V6WVVWVTdiR09QbU5LeE1Ndmsv?=
 =?utf-8?B?UjlWWGZTbTJWR01rQnNaWkRuOGVvbTNuTFJTcXVvSWNjeHl0eEpUdDYrK2V0?=
 =?utf-8?B?L3NXOTRGbmZBejE3UEpBbGVzdWUxcUgxT004SUc5NXRndHE4alltOU5TYUYy?=
 =?utf-8?B?MGhtbndOUERKSlIzZjlJL3huSm1oNXBOU2x1Rkp3bW5CTlJVUVExRkI4WmpN?=
 =?utf-8?B?UGpkUWlHYzFvbXp6SEVBekU4UDVRR2hGSWFKN3EyMllPWUR4dld0dDY5dTdP?=
 =?utf-8?B?YTVnTjdvbER5UzBHelVoaHZoVXEwZ3VHaUc5NGJudWRwRk1Ta0J0dDBHNFBR?=
 =?utf-8?B?YkVTcHFwSm92OWVQNW8xQU41ZytoZ2c2YjFyeEFZOGJPVXJLYVF5RjRHN3RZ?=
 =?utf-8?B?ZEpNeEdaaktRc1ErUVNZMVNUdkJaRUhXTDJHRmIzMDY5dGdoTVZSeXFxZFJI?=
 =?utf-8?B?anVpU3d0Q3lXQWFmM042WTgwdlkzLzUxQy9GNGwrVHNSenFJbnFYZz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: FmxCDKj5hz2iQMYOVvH6WTNp3gXYhu7kooCVe3S73ZT/nhiOGTa06a6cFHIZkec+7xd6NITLalTRKYXvdZF+ZSZ6GaUshUL4qaVOlJBkWGJ5JNxUPkDXETJeswV92aq/HksZEaf4Y7PzXbXjoPNoPH3+ULe6H3C8fdRgcyu49hxyFADcjcSw8bb7uZR5RbL51UzzEuQjvEkca3fSOH4g8Stw+VAm5G2AFZkoA/Od4+OvHsgGXm/atNWfcCMWcnqPAclaGm9+ShBNeypUklbRio1jReKPeGe0uAtBNrzSCYgH9R4KNs+xC/QlEzNfhZXveWg8iQbmqvSfVuBjmN2QFg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5902.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f51268e-a182-4156-8740-08dee17cfcf3
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jul 2026 07:53:26.8632
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ga6AX1CDpYsedrE77PXcd+Z319y4g7/c7uBxstVYzl1gDG6Dd0b/OhYzshVzfVMNcLa0PjWuAnnBlFyFTYg0wNPq4yXpAOfCjY3U3djiCI4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPFFCBF1B4C7
X-OriginatorOrg: intel.com
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.56 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[intel.com:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-118980-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[19];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:vishnu.santhosh@oss.qualcomm.com,m:stephan@gerhold.net,m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:loic.poulain@oss.qualcomm.com,m:ryazanov.s.a@gmail.com,m:johannes@sipsolutions.net,m:linux-arm-msm@vger.kernel.org,m:netdev@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:chris.lew@oss.qualcomm.com,m:deepak.singh@oss.qualcomm.com,m:andrew@lunn.ch,m:krzk@kernel.org,m:conor@kernel.org,m:ryazanovsa@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jedrzej.jagielski@intel.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,gerhold.net,lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,gmail.com,sipsolutions.net];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:from_mime,intel.com:dkim,vger.kernel.org:from_smtp,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	DKIM_TRACE(0.00)[intel.com:+];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jedrzej.jagielski@intel.com,linux-arm-msm@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,netdev,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 36E2675217A

RnJvbTogVmlzaG51IFNhbnRob3NoIDx2aXNobnUuc2FudGhvc2hAb3NzLnF1YWxjb21tLmNvbT4g
DQpTZW50OiBUdWVzZGF5LCBKdWx5IDE0LCAyMDI2IDc6MzMgQU0NCg0KPk9uIHBsYXRmb3JtcyB3
aGVyZSB0aGUgbW9kZW0gRE1BcyBpbnRvIHRoZSBCQU0tRE1VWCBSWCBkYXRhIGJ1ZmZlcnMgYW5k
DQo+dGhlIFhQVSAoZVh0ZXJuYWwgUHJvdGVjdGlvbiBVbml0KSBlbmZvcmNlcyBwZXItcmVnaW9u
IGFjY2VzcyBjb250cm9sLA0KPmVhY2ggaW5kaXZpZHVhbGx5IERNQS1tYXBwZWQgUlggYnVmZmVy
IGNvbnN1bWVzIGFuIFhQVSByZXNvdXJjZSBncm91cC4NCj5XaXRoIG9ubHkgfjE2IGdyb3VwcyBh
dmFpbGFibGUgb24gU2hpa3JhIChtRFNQLCBWTUlEIDQzIC8gTkFWKSwgdGhlDQo+cGVyLWJ1ZmZl
ciBtYXBwaW5ncyBleGhhdXN0IHRoZSB0YWJsZSBhbmQgaW5ib3VuZCB0cmFuc2ZlcnMgZmF1bHQu
DQo+DQo+VGhpcyBzZXJpZXMgYWRkcyBhIHFjb20sc2hpa3JhLWJhbS1kbXV4IGNvbXBhdGlibGUg
YW5kIGhhdmUgdGhlIGRyaXZlcg0KPnNlbGVjdCBRQ09NX1NDTV9WTUlEX05BViBpbnRlcm5hbGx5
IHZpYSB0aGF0IGNvbXBhdGlibGUncyBtYXRjaCBkYXRhLg0KPldoZW4gbWF0Y2hlZCwgdGhlIGRy
aXZlciBhbGxvY2F0ZXMgYWxsIFJYIGJ1ZmZlcnMgYXMgYSBzaW5nbGUNCj5jb250aWd1b3VzIGNv
aGVyZW50IGJsb2NrIGFuZCBTQ00tYXNzaWducyBpdCB0byBITE9TIHBsdXMgdGhlIFZNSUQNCj5v
bmNlIGF0IHByb2JlLCBjb25zdW1pbmcgb25lIFhQVSByZXNvdXJjZSBncm91cCBpbnN0ZWFkIG9m
IG1hbnkuDQo+DQo+UGxhdGZvcm1zIHRoYXQgZG8gbm90IHVzZSB0aGUgcWNvbSxzaGlrcmEtYmFt
LWRtdXggY29tcGF0aWJsZSBhcmUNCj51bmFmZmVjdGVkOiB0aGUgZXhpc3RpbmcgcGVyLWJ1ZmZl
ciBkbWFfbWFwX3NpbmdsZSgpIHBhdGggaXMNCj51bmNoYW5nZWQuDQo+DQo+U2lnbmVkLW9mZi1i
eTogVmlzaG51IFNhbnRob3NoIDx2aXNobnUuc2FudGhvc2hAb3NzLnF1YWxjb21tLmNvbT4NCj4t
LS0NCj5WaXNobnUgU2FudGhvc2ggKDIpOg0KPiAgICAgIGR0LWJpbmRpbmdzOiBuZXQ6IHFjb20s
YmFtLWRtdXg6IEFkZCBxY29tLHNoaWtyYS1iYW0tZG11eCBjb21wYXRpYmxlDQo+ICAgICAgbmV0
OiB3d2FuOiBxY29tX2JhbV9kbXV4OiBBbGxvYyBSWCBidWZmZXJzIGFzIGEgc2luZ2xlIGNvaGVy
ZW50IGJsb2NrDQo+DQo+IC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL25ldC9xY29tLGJhbS1kbXV4
LnlhbWwgICAgIHwgICA4ICstDQo+IGRyaXZlcnMvbmV0L3d3YW4vS2NvbmZpZyAgICAgICAgICAg
ICAgICAgICAgICAgICAgIHwgICAxICsNCj4gZHJpdmVycy9uZXQvd3dhbi9xY29tX2JhbV9kbXV4
LmMgICAgICAgICAgICAgICAgICAgfCAxMzQgKysrKysrKysrKysrKysrKysrKy0tDQo+IDMgZmls
ZXMgY2hhbmdlZCwgMTMyIGluc2VydGlvbnMoKyksIDExIGRlbGV0aW9ucygtKQ0KPi0tLQ0KPmJh
c2UtY29tbWl0OiAzYjAyOWMwMzViMzRiYmM2OTM0MDVkZGY3NTlmMGU5YjkyMGMyN2YxDQo+Y2hh
bmdlLWlkOiAyMDI2MDcxNC1xY29tLWJhbS1kbXV4LXZtaWQtZXh0LWQ5Mjg5ZGIzMTBjMQ0KPg0K
PkJlc3QgcmVnYXJkcywNCj4tLSANCj5WaXNobnUgU2FudGhvc2ggPHZpc2hudS5zYW50aG9zaEBv
c3MucXVhbGNvbW0uY29tPg0KDQpIaSBWaXNobnUNCnlvdSBuZWVkIHRvIHNwZWNpZnkgdGFyZ2V0
IHRyZWUsIG5ldC1uZXh0IGZvciB0aGlzIHNlcmllcyBpIGJlbGlldmUNCnBsZWFzZSByZWZlciB0
b1sxXQ0KDQpbMV0NCmh0dHBzOi8vZG9jcy5rZXJuZWwub3JnL3Byb2Nlc3MvbWFpbnRhaW5lci1u
ZXRkZXYuaHRtbCNpbmRpY2F0aW5nLXRhcmdldC10cmVlDQoNCg0K

