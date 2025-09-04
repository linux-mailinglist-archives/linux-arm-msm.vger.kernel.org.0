Return-Path: <linux-arm-msm+bounces-72130-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C8728B44635
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Sep 2025 21:15:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 86C9517406C
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Sep 2025 19:15:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92BB926E702;
	Thu,  4 Sep 2025 19:15:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hsUPa21y"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 815BB267729;
	Thu,  4 Sep 2025 19:15:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757013311; cv=fail; b=ewM37X0mtZIDHSOCZhvWwQ7nZnl2TzoBj7qMycpTJkowuCn9f/TeaI9KI0T20LdnUhNggR0I1iYs0Q9ehvELevY6cZPfn+mROYtUQCNl5bn9wxtfUyARzlhwzD8sX0uelS76wJ0xQAOtBYTZPB0KdbXcFiylbTBdwZbC3Ua/pCM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757013311; c=relaxed/simple;
	bh=59hEIIamXCaadh7kBjguR1+XF4FT0xP1rsmvOnqn9dA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=EuIPk/1L7dUdI7wjC6sZOxYvO0LIQxgW16S4BtDsKMxvrpkXnQqpjt4I1XS6+fMxYtJFZP8OrUhApwbanb7FKJDbC76MwgsAIy7LeCjUYheOqa8AgbMHkv00Gw1GGJXLqp5ZdkJFtZ2eUkrOUj1LnANB4oVeMTziiYOMoFqjVZU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hsUPa21y; arc=fail smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757013309; x=1788549309;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=59hEIIamXCaadh7kBjguR1+XF4FT0xP1rsmvOnqn9dA=;
  b=hsUPa21ymKZ1BL+lrkTcoC6WFaC7ID8pu+2Q49yY4vbLcfpxro1SXBRm
   t+0DsGPwjXugh+/M3ixe5Ms+DOtf5fAp20reH2DpZ4Zif7MMn33wnBk5m
   Q2TeeTD77qyKsLZ+aE17hdp+orTp0AaG4pJNc+IdOuO6NHZhHuS5Olyqv
   cfiMvZuMOQNBIXTQGdORnM4mn4KpyE7hVLiQqoYng+1PhtX7uOvoNq8pT
   RsggPZTxa1Cx28445BYxG5pA46wfquqP+iD5cUyrtzmpdp2TGBhkufWK1
   3qJHNwK2w9szkF6R1WD77ByK258IodIahxMmEtnE9tGk1/EuS19yv5uXM
   Q==;
X-CSE-ConnectionGUID: h4cMWzZ3RVCAQa8DpwpEvQ==
X-CSE-MsgGUID: yslcm2AtSy2rkM9DfIBwLQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11543"; a="59222689"
X-IronPort-AV: E=Sophos;i="6.18,239,1751266800"; 
   d="scan'208";a="59222689"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2025 12:15:08 -0700
X-CSE-ConnectionGUID: Pkl5+HtySR64ZIHW14G7wQ==
X-CSE-MsgGUID: ylTNf6mWS8mJfsjqizZJEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,239,1751266800"; 
   d="scan'208";a="195636784"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2025 12:15:07 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 4 Sep 2025 12:15:06 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Thu, 4 Sep 2025 12:15:06 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (40.107.92.65) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 4 Sep 2025 12:15:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FZN9K5EMVlkhraD54ilRyzzKbipZpSAXhTlfvyR521jeMNdg3bGFy0zq1OzolTOEsnsAyUKe+w/4pq6qNVJEU8DkL9SIt5khooAmDTpjvx2orLFwW1kyrxXrVaTx7aOcRf4qo845QBELbAGH166BCxlV+6Ufu+PkDzfBAN8YwSkF5szFXWlrUDlTjAMVhnLDeScrNC2CMMvEYXAahtUHMJL8xoMGjAqgWMSpJTUAoTXhpXvsHgmeWwD7z+HF8CdAvkxUHsHicE82MNfCqvk4P+WgLAdDsD3Gthti4cXCPRpAI/wdTQx6jie1xEpPLMQfjaR6b74roymnPqdPT7WwKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=59hEIIamXCaadh7kBjguR1+XF4FT0xP1rsmvOnqn9dA=;
 b=yrpvFTNgr4qHs//0hUahTHBZoWJDRVrDf1jRm2xgD5ZJHFKHIRlJuoaW18XSlCLxYW14b4tkS+k9POBRWIIvLmF+CuJv5WG57/mmrZDExbfFV41dqhBdKmXoWcPpcP3/dBhOsQt1N9edv/VCoUqv9yiX3ecTv8JNHLsvkVpNFWth0UOPGjlQkt5yNl6hA/TzjBsj7Xm1PIJTAwJ9wq+lmjBko9i6bPLY19h/4rEQbTyNs3DxqTtr7ymHLgGHUH0uOAS4ObS6wCUSArrlAn9HxqSsMftL+2xldigAhPlnBpWhoplEhbyYZjRPojydUTNobR7htBz8UOa+rQ9rMPjJeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5300.namprd11.prod.outlook.com (2603:10b6:610:bf::18)
 by PH7PR11MB5942.namprd11.prod.outlook.com (2603:10b6:510:13e::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.17; Thu, 4 Sep
 2025 19:15:03 +0000
Received: from CH0PR11MB5300.namprd11.prod.outlook.com
 ([fe80::81fd:4855:139d:6e74]) by CH0PR11MB5300.namprd11.prod.outlook.com
 ([fe80::81fd:4855:139d:6e74%4]) with mapi id 15.20.9052.027; Thu, 4 Sep 2025
 19:14:59 +0000
From: "Jayaraman, Venkat" <venkat.jayaraman@intel.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, Heikki Krogerus
	<heikki.krogerus@linux.intel.com>
CC: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, PSE Type-C Linux
	<pse.type-c.linux@intel.com>, linux-arm-msm <linux-arm-msm@vger.kernel.org>
Subject: RE: [PATCH v3] usb: typec: ucsi: Add support for READ_POWER_LEVEL
 command
Thread-Topic: [PATCH v3] usb: typec: ucsi: Add support for READ_POWER_LEVEL
 command
Thread-Index: AQHcDTjBQ9B/HpZlE0OWqgHmvUxK67Rpwj4AgAL7nwCAEVGZAIAFdQYw
Date: Thu, 4 Sep 2025 19:14:59 +0000
Message-ID: <CH0PR11MB5300AD8DD6BE6CBC799B49DD8000A@CH0PR11MB5300.namprd11.prod.outlook.com>
References: <20250814163028.18058-1-venkat.jayaraman@intel.com>
 <91cb0acb-73c4-4d3a-9aa8-1056f367d82e@linaro.org>
 <aKbI4DnIDD9fD_Gz@kuha.fi.intel.com>
 <b897d082-0d74-46fc-a0e4-7745347ba597@linaro.org>
In-Reply-To: <b897d082-0d74-46fc-a0e4-7745347ba597@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5300:EE_|PH7PR11MB5942:EE_
x-ms-office365-filtering-correlation-id: bd600214-ba44-40b3-cd57-08ddebe7575f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?a1JqQWlkZXc0QTNNUzlqSDF2eXJsaEJLUW5Da0VwK0dCUldtVlYvWGdBNGc4?=
 =?utf-8?B?T3krZldNNGk4empOWFVnRlZQZml6a2NBZ0FuN0d1eDMwbjVoMm5zbFZFUjN5?=
 =?utf-8?B?N1BkMDN5SnRJaW1yMEZCNCtabng2akxTRmRFTGJIQ0lkUUVsYi9vVVJZdURh?=
 =?utf-8?B?Sm1aektzN0FoS2RRSkxEc1lQR0dYT3ozcmc1bXRlcXJWUGt0NTBEazlqVHIy?=
 =?utf-8?B?K3dYOTZkZXE2bWRWVXhmSHJjcmFZQ1pFa3paWXlrY2FpL1BHaFY2dXA1V1dL?=
 =?utf-8?B?bmplSHA5dC9OUnBCRTJYU21xK3VvK250VWVKaFEvUlJvWFh3T0NEdUxieGVF?=
 =?utf-8?B?WEs2a2pDbE1NZUV5MGIwcDV2MnRWYjFqemRZUnZBcC9WakpoM2Uxb0hQNmxq?=
 =?utf-8?B?QWJzUG9wK2xTR1FpZHBEU0tiN3c0d1JTanZaSWtKOFFXUURlL3A4RVh1TEcx?=
 =?utf-8?B?R3hudWNXV3QrMjBTeHIwNGFBOGVWUzFhNmdvbnJ4VnJScWl6SEhvZjMvdzJD?=
 =?utf-8?B?VlRpbEhPZEZYaHhTMG04UFVMT2xVemZXZnYrcVNOSTRySGlCelFKbnlKV3lO?=
 =?utf-8?B?QzBFUlZ3c0FGM3VUb3hlNlBNOG5heWNPeFFvYlJvOE0yT1VWWFY4UHdPU0hk?=
 =?utf-8?B?aTlENmxSQlppRkxDM2FhaU5pd2tYdlMvN3pBYUVJazBUcUdOMHZBRkRRWHlx?=
 =?utf-8?B?TGpRWWljUk1zQWhCbjQwazA2RjVkZHRmTjRGMWRlV0ZxR0JsdGNlRllmTVEr?=
 =?utf-8?B?L1A2UURpdXBBOTcxTTNWNXJDN0RwN2sydlFxYmU4NDB1Tmlhc0RUWkpJVDgv?=
 =?utf-8?B?MXg0UGFJeGd3VDBGWUJnaGFiZnVQZG9LUUJnVHkyaG9FWGZjTWVNYzRUb2xJ?=
 =?utf-8?B?eGJ1N2g4cFJMVTlpOXBZRDc5VXhxbFBLa3JvS0N4a0dPZVF1Vm9NVFVHandC?=
 =?utf-8?B?Z3Z0b0l6Y09abVhYQjZwajBwc3ZHN2k3WWpBYVhndVlrbEMyNXdGUm1xL1lK?=
 =?utf-8?B?aHFqK21rN1lYUWxwWEk5TXBuZ3BwVTdaZ0pCbExjQVkzc3laL2UxUzQrTDVo?=
 =?utf-8?B?aFI1dk5GNDdpeXZkcVM0Vmw1cWdCNndJWEJUU1FsM2w3cWZCWDZUbkpqM1RL?=
 =?utf-8?B?QWEwU0pLWnArV1dyckpHVHhYYzUwc041TTNrNWloYkpWaGJCRlYxUnl2Slly?=
 =?utf-8?B?R0lRWDk5ZjRVR012L3FVNkRncUI3MGN1ZURJZUgxTlZrRENYVXVRb2p4dDBC?=
 =?utf-8?B?RVBBY0JZV3ZoeTNMTXZ2RkNoYXBGeVp2aFFLOE1pM0l5RC9xK28walA3bEZz?=
 =?utf-8?B?SkhnTG9NTnB2ZDhzKzB5aG1ORmVBUUp2SEpwcUV4WUphTUhCY2tMZEg5aFpv?=
 =?utf-8?B?d1ltK3NkZ09pSXk3WE5zcWhnYXF0aWkxMFNPRmhsdXVVNVBrWHJxcTRKbDVz?=
 =?utf-8?B?Z1V4YVRkalV4UG8yUHRvVXNQQmpRNTVmcWNhUXR4QjJkamV5L0JoT00zbktH?=
 =?utf-8?B?Si9wTlBFbzNIVC9QQWNFNzRhYkZSczFwNit3dk0ydy9veUI5UkZuL2o1TGQ4?=
 =?utf-8?B?dkNqaWZuZTQ2UzV5U1Z4TFpYNzFLMk5Gc21KVURZS3NjelNtUFEyNTNsQ2Rz?=
 =?utf-8?B?bHdEWnA2Q3M5SUNPNWNVRDl2cE9mODM0UG9FQXFYNzE0NHorTzFvd3JtaUx3?=
 =?utf-8?B?bWxmbUVTek9lVStENWE2bVhzSU02UWFzbVFCN1hMM1RMNzI5MGFINEhhd3lV?=
 =?utf-8?B?WTJLTkJ5RTFsekhWZlpoUVdULzArMjJrbytvN0pjdlFkVHloY2FKWkI2WHpF?=
 =?utf-8?B?cGd4TGh6eVV1S1RJZHV2Y0lQTVMzaWFBRGl4YU5Wc2t2cjhMNGRiRXdXS01X?=
 =?utf-8?B?QUNnTW1TMGU4WFdEcEV0WXZmbkI5WGloaEM0VVhPaEFJUWdhdndiVzBOS0Vu?=
 =?utf-8?Q?QCaZqcpc+Uc=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR11MB5300.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RzF3cnBWd2pLVC9ZcHY1algxYnFKTHhSWnNWU2tvYVJkSURGekRETjVUVENG?=
 =?utf-8?B?THVidlNJRHFIUFVTV3d2SHhENlE0bktPd1JZdTlOWWdlaytWKzZ3a2xLdWx6?=
 =?utf-8?B?RWVnQzVrMHBMU0hGbTJKeTVxUlJmakJ2QWNEYmdGYk82dWhxVFBjcXJLeS95?=
 =?utf-8?B?d1poV0ZWSWNWbDc5L29nTjFiVERMMHhCOWlnNFFlZ1lncFcxbXlrbjMzUjhh?=
 =?utf-8?B?eGhyc0ljbTR0Sk93a05tSmYyQ1ZHZXlVYjErSzk3TnBMaTlEeWZqZmpjUzVU?=
 =?utf-8?B?WDh6bnRWaFllNUc4Q3A5U3VRekx3cU1xVWVCd0xLaXZISkgyZFJrYXhGQnNn?=
 =?utf-8?B?dG1mNitzaVZaZDZMcXlqZVgxRWUwTW82K1o5eTgzMFhkRGlFUjBTVEk0eUdT?=
 =?utf-8?B?ak5aUS9vNzYydTJnS3oydmYrUUMxVGpqejRoYlV1Z2NLR01FZDR3a2lzaFRP?=
 =?utf-8?B?MFBidlR6SGJKdldlb3E2QlNwQllqcm9BZk54L2ZUUGU0eWQ1aVJCV1BETnQv?=
 =?utf-8?B?M2k3NDJTdlFlSEhCbG12TFBwM3d5MVkveEpJcnpOREp0Yjh6Yk9NSklTbHBY?=
 =?utf-8?B?WURnNVpEM01HNzhod3JudVlwVmg3WkRuQ0hqMDBqeWxPczlxaUgwaEpNMDZJ?=
 =?utf-8?B?VExWVGVIVzgwZmZwWThmSXU5WVBFSkkrc2Q1MkVrQ1puUEZLUW9TT0RlbDVB?=
 =?utf-8?B?Tmhobm54ZFRvdnNQOUh5RmIzSkN5VENEUGloY2VJTm9iNjBkRVJmTEovT09p?=
 =?utf-8?B?aU9jMi9LcXRsMzh6cEhpdmUxWXVXRFhSdUl3VExDZEVCOWtJZXAvVzh4MEsz?=
 =?utf-8?B?U2x0QjdxWEVBRkxPUFY1dEt3ODBNZ1JqV013dnlKYXZQajhzSnhFOVlxTjVE?=
 =?utf-8?B?WWVkdy9mUTFyYytGM1BRYUROYmdIRWdUN3pIZVhQckxVbmpoT2xleWVHcWxw?=
 =?utf-8?B?TzZYMGFXZ1haeEpBdjc3WDhlaTlXTFc5aURKQzNES0tDZjhGcVFFQW55cGhP?=
 =?utf-8?B?TkdiUW1ueXFyREFqbDdaQ3p4eGFjanV0YWpEa2Fjd0Jpbnd6MHgxNUNUcGw4?=
 =?utf-8?B?RU1nSUxFNytlSHI3RXYyNUUzcXdqMTNhU0Y3c2JncnhleXhNMENERHMxYlpt?=
 =?utf-8?B?RUFhZlN4Uk1Db3FrT3JZaGF4ZVNzTGU4aGozSndjdG1JSENCdFVuTnN3OXd3?=
 =?utf-8?B?RmZBVmtTemhSM3lNS1Azc0pCMkVZU1oyRk8wME95NUd2Mlp0eEpVUk9TWC9O?=
 =?utf-8?B?MUFwNzNxek9ySzRJT0kyZGowcThjZE56NEJmQXNkNXJ5aENRQmRkdkJDNTcx?=
 =?utf-8?B?dFk5djZpOFVHTG5qM0M0VlZSdE1kei8wbW9TZ3loMHMzaFI1S2pRNHF6V2hK?=
 =?utf-8?B?ZGZQYjB5U0FnbHJMQlkrTU9tZzhDWFp3dkJPS1loY25nYS9mUWVFMEJodnZk?=
 =?utf-8?B?Y2ladkJPeTZaVDBldEJNZGdUbVB4b0JGY2NyTXZ2c2wydGV4WFo2Nkp4WTQ1?=
 =?utf-8?B?ZUg3SVp2MkMxeU1QQXdMSS9wbEVKdXZ3TkRNd01MTzltOUtMdkNaWTZDOHNv?=
 =?utf-8?B?UFZrK1llYW1HUGVVd0kzZWlRL0lpSHZDZ1JYdm94aitWVUFBRWIyNFFPVXU0?=
 =?utf-8?B?QzlHcW1qOTZQMmd3SlFQNHhtQkk2TXNvcWl4VXNaZDFpdnhDK081ZVN1Y0RZ?=
 =?utf-8?B?ektHWlBnUkxycjMwMjYvQmlFcEVSYk1oWUpGSzZJcVdXWVZQUm4yTnVOdy8w?=
 =?utf-8?B?L3FnVzRCTWNsZGgzeDliT0Q3b21YNjY1eXRpNm5yVlRWcEpVelZZRUdNMHNz?=
 =?utf-8?B?emFldTB2RitCVHA5bTFCMjUrRDIyQkhXN1pySU1ta2NpY3I0ZmdGMzFCdVNp?=
 =?utf-8?B?aTdYMXlvdjZGU0NBVGhXaFlsaXhEZWZqZnhZd3pVd1Vjbno4cEs4MmxLNkh5?=
 =?utf-8?B?MERtZmZScGlQZk50blFmb2NKRUtGNzZGL2ovUFZQYXdLTHRSUXFReVlHeXl2?=
 =?utf-8?B?ZzZ6SFhwc0FleUFpUzFKOWxoZkNTNTZQOXRrbVh2d3VtY2xsWTdwZGQ0eUsx?=
 =?utf-8?B?c1JwaVB4UlhkZktMOHRZTzFsdHF4YzBYVitKeStrUDlaU2J0cHl5a1BPOU0z?=
 =?utf-8?Q?IewSfo++hOT9u+Dl6dy58bZSk?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5300.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd600214-ba44-40b3-cd57-08ddebe7575f
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Sep 2025 19:14:59.1916
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FHpBqdx+egJRICV3Dsj4PSZYDBNADIx3U9I+nHH/RPVUF5xZZ0qzKuYheyNOrdGF2KuxKQTUg4xjA0IarMGbs9x03ZWAlpOFyU8XDNgxk/8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5942
X-OriginatorOrg: intel.com

SGkgTmVpbCwgDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogTmVpbCBB
cm1zdHJvbmcgPG5laWwuYXJtc3Ryb25nQGxpbmFyby5vcmc+DQo+IFNlbnQ6IE1vbmRheSwgU2Vw
dGVtYmVyIDEsIDIwMjUgMTI6NTAgQU0NCj4gVG86IEhlaWtraSBLcm9nZXJ1cyA8aGVpa2tpLmty
b2dlcnVzQGxpbnV4LmludGVsLmNvbT4NCj4gQ2M6IEpheWFyYW1hbiwgVmVua2F0IDx2ZW5rYXQu
amF5YXJhbWFuQGludGVsLmNvbT47IGxpbnV4LXVzYkB2Z2VyLmtlcm5lbC5vcmc7IGdyZWdraEBs
aW51eGZvdW5kYXRpb24ub3JnOyBQU0UgVHlwZS1DIExpbnV4DQo+IDxwc2UudHlwZS1jLmxpbnV4
QGludGVsLmNvbT47IGxpbnV4LWFybS1tc20gPGxpbnV4LWFybS1tc21Admdlci5rZXJuZWwub3Jn
Pg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHYzXSB1c2I6IHR5cGVjOiB1Y3NpOiBBZGQgc3VwcG9y
dCBmb3IgUkVBRF9QT1dFUl9MRVZFTCBjb21tYW5kDQo+IA0KPiBIaSwNCj4gDQo+IE9uIDIxLzA4
LzIwMjUgMDk6MjEsIEhlaWtraSBLcm9nZXJ1cyB3cm90ZToNCj4gPiBPbiBUdWUsIEF1ZyAxOSwg
MjAyNSBhdCAxMTo0Nzo1OEFNICswMjAwLCBOZWlsIEFybXN0cm9uZyB3cm90ZToNCj4gPj4gSGks
DQo+ID4+DQo+ID4+IE9uIDE0LzA4LzIwMjUgMTg6MzAsIFZlbmthdCBKYXlhcmFtYW4gd3JvdGU6
DQo+ID4+PiBBZGQgc3VwcG9ydCBmb3IgVUNTSSBSRUFEX1BPV0VSX0xFVkVMIGNvbW1hbmQgYXMg
cGVyDQo+ID4+PiBVQ1NJIHNwZWNpZmljYXRpb24gdjIuMSBhbmQgYWJvdmUgdG8gZGVidWdmcy4N
Cj4gPj4+DQo+ID4+PiBGb2xsb3dpbmcgcG93ZXIgcmVsYXRlZCBmaWVsZHMgd2lsbCBiZSBleHBv
c2VkIGFzIGZpbGVzIGluIGRlYnVnZnM6LQ0KPiA+Pj4gcGVha19jdXJyZW50IChQZWFrIGN1cnJl
bnQpLA0KPiA+Pj4gYXZnX2N1cnJlbnQgKEF2ZXJhZ2UgY3VycmVudCkgYW5kDQo+ID4+PiB2YnVz
X3ZvbHRhZ2UgKFZCVVMgdm9sdGFnZSkNCj4gPj4+DQo+ID4+PiBUaGVzZSBmaWxlcyB3aWxsIGJl
IHVwZGF0ZWQgZWl0aGVyIHdoZW4gYSBSRUFEX1BPV0VSX0xFVkVMDQo+ID4+PiBjb21tYW5kIGlz
IHNlbnQgZnJvbSBPUyBvciB3aGVuIGEgZGV2aWNlIGlzIGNvbm5lY3RlZC4NCj4gPj4+DQo+ID4+
PiBSZXZpZXdlZC1ieTogSGVpa2tpIEtyb2dlcnVzIDxoZWlra2kua3JvZ2VydXNAbGludXguaW50
ZWwuY29tPg0KPiA+Pj4gU2lnbmVkLW9mZi1ieTogVmVua2F0IEpheWFyYW1hbiA8dmVua2F0Lmph
eWFyYW1hbkBpbnRlbC5jb20+DQo+ID4+PiAtLS0NCj4gPj4+IENoYW5nZWxvZyB2MzoNCj4gPj4+
IC0gUmViYXNlZCB0byBrZXJuZWwgNi4xNy1yYzENCj4gPj4+DQo+ID4+PiBDaGFuZ2Vsb2cgdjI6
DQo+ID4+PiAtIFJlbW92ZWQgZXh0cmEgc3BhY2UgaW4gZGVjbGFyYXRpb24NCj4gPj4+IC0gTWFk
ZSB0aGUgY2FsbCB0byBkZWJ1Z2ZzX2NyZWF0ZV9maWxlIHNpbmdsZSBsaW5lIGZvciBjbGFyaXR5
DQo+ID4+Pg0KPiA+Pj4gICAgZHJpdmVycy91c2IvdHlwZWMvdWNzaS9kZWJ1Z2ZzLmMgfCAzMSAr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrDQo+ID4+PiAgICBkcml2ZXJzL3VzYi90eXBl
Yy91Y3NpL3Vjc2kuYyAgICB8IDE2ICsrKysrKysrKysrKysrKysNCj4gPj4+ICAgIGRyaXZlcnMv
dXNiL3R5cGVjL3Vjc2kvdWNzaS5oICAgIHwgMTMgKysrKysrKysrKysrKw0KPiA+Pj4gICAgMyBm
aWxlcyBjaGFuZ2VkLCA2MCBpbnNlcnRpb25zKCspDQo+ID4+Pg0KPiA+Pg0KPiA+PiBUaGlzIGNv
bW1pdCBjYXVzZXMgdGhlIGZvbGxvd2luZyB3YXJuaW5nOg0KPiA+PiBbICAgIDguNjQ2MTc5XSAt
LS0tLS0tLS0tLS1bIGN1dCBoZXJlIF0tLS0tLS0tLS0tLS0NCj4gPj4gWyAgICA4LjY1MDk4Nl0g
QWNjZXNzIHRvIHVuc3VwcG9ydGVkIGZpZWxkIGF0IG9mZnNldCAweDU5IChuZWVkIHZlcnNpb24g
MDIxMCkNCj4gPj4gWyAgICA4LjY1MTA0NF0gV0FSTklORzogZHJpdmVycy91c2IvdHlwZWMvdWNz
aS91Y3NpLmM6MTI5NiBhdCB1Y3NpX2hhbmRsZV9jb25uZWN0b3JfY2hhbmdlKzB4MzgwLzB4NDE0
IFt0eXBlY191Y3NpXSwgQ1BVIzA6DQo+IGt3b3JrZXIvMDowLzkNCj4gPj4gPHNuaXA+DQo+ID4+
IFsgICAgOC44MzI0OTFdIEhhcmR3YXJlIG5hbWU6IFF1YWxjb21tIFRlY2hub2xvZ2llcywgSW5j
LiBTTTg1NTAgSERLIChEVCkNCj4gPj4gWyAgICA4LjgzOTIyOF0gV29ya3F1ZXVlOiBldmVudHMg
dWNzaV9oYW5kbGVfY29ubmVjdG9yX2NoYW5nZSBbdHlwZWNfdWNzaV0NCj4gPj4gWyAgICA4Ljg0
NjA4NF0gcHN0YXRlOiA2MzQwMDAwNSAoblpDdiBkYWlmICtQQU4gLVVBTyArVENPICtESVQgLVNT
QlMgQlRZUEU9LS0pDQo+ID4+IFsgICAgOC44NTMyNzddIHBjIDogdWNzaV9oYW5kbGVfY29ubmVj
dG9yX2NoYW5nZSsweDM4MC8weDQxNCBbdHlwZWNfdWNzaV0NCj4gPj4gWyAgICA4Ljg2MDAzMV0g
bHIgOiB1Y3NpX2hhbmRsZV9jb25uZWN0b3JfY2hhbmdlKzB4MzgwLzB4NDE0IFt0eXBlY191Y3Np
XQ0KPiA+PiA8c25pcD4NCj4gPj4gWyAgICA4Ljk0NDAyM10gQ2FsbCB0cmFjZToNCj4gPj4gWyAg
ICA4Ljk0NjU3MF0gIHVjc2lfaGFuZGxlX2Nvbm5lY3Rvcl9jaGFuZ2UrMHgzODAvMHg0MTQgW3R5
cGVjX3Vjc2ldIChQKQ0KPiA+PiBbICAgIDguOTUzMzI4XSAgcHJvY2Vzc19vbmVfd29yaysweDE0
OC8weDI4Yw0KPiA+PiBbICAgIDguOTU3NTAyXSAgd29ya2VyX3RocmVhZCsweDJjOC8weDNkMA0K
PiA+PiBbICAgIDguOTYxNDAxXSAga3RocmVhZCsweDEyYy8weDIwNA0KPiA+PiBbICAgIDguOTY0
NzU5XSAgcmV0X2Zyb21fZm9yaysweDEwLzB4MjANCj4gPj4gWyAgICA4Ljk2ODQ3NF0gLS0tWyBl
bmQgdHJhY2UgMDAwMDAwMDAwMDAwMDAwMCBdLS0tDQo+ID4+DQo+ID4+IG9uOg0KPiA+PiA4NTUw
LWhkazoNCj4gPj4gaHR0cHM6Ly9naXQuY29kZWxpbmFyby5vcmcvbGluYXJvL3Fjb21sdC9jaS9z
dGFnaW5nL2NkYmEtdGVzdGVyLy0vam9icy8yNTMzMTIjTDE0MTgNCj4gPj4gODU1MC1xcmQ6DQo+
ID4+IGh0dHBzOi8vZ2l0LmNvZGVsaW5hcm8ub3JnL2xpbmFyby9xY29tbHQvY2kvc3RhZ2luZy9j
ZGJhLXRlc3Rlci8tL2pvYnMvMjUzMzA2I0wxNTYwDQo+ID4+IDg2NTAtaGRrOg0KPiA+PiBodHRw
czovL2dpdC5jb2RlbGluYXJvLm9yZy9saW5hcm8vcWNvbWx0L2NpL3N0YWdpbmcvY2RiYS10ZXN0
ZXIvLS9qb2JzLzI1MzMwOCNMMTQ5NA0KPiA+PiA4NjUwLXFyZDoNCj4gPj4gaHR0cHM6Ly9naXQu
Y29kZWxpbmFyby5vcmcvbGluYXJvL3Fjb21sdC9jaS9zdGFnaW5nL2NkYmEtdGVzdGVyLy0vam9i
cy8yNTMzMDkjTDE1OTQNCj4gPj4geDEtY3JkOg0KPiA+PiBodHRwczovL2dpdC5jb2RlbGluYXJv
Lm9yZy9saW5hcm8vcWNvbWx0L2NpL3N0YWdpbmcvY2RiYS10ZXN0ZXIvLS9qb2JzLzI1MzMxMSNM
MjIyNg0KPiA+PiB4MS1xY3A6DQo+ID4+IGh0dHBzOi8vZ2l0LmNvZGVsaW5hcm8ub3JnL2xpbmFy
by9xY29tbHQvY2kvc3RhZ2luZy9jZGJhLXRlc3Rlci8tL2pvYnMvMjUzMzEwI0wyMTYwDQo+ID4+
DQo+ID4+IEkgZ3Vlc3MgdGhlIHZlcnNpb24gc2hvdWxkIGJlIGNoZWNrZWQuDQo+ID4NCj4gPiBW
ZW5rYXQsIGNhbiB5b3UgYmUgcHJlcGFyZSB0aGUgZml4IGZvciB0aGlzPw0KPiA+DQo+ID4gdGhh
bmtzLA0KPiA+DQo+IA0KPiBHZW50bGUgcGluZywgY2FuIHRoaXMgYmUgZml4ZWQgPyBTaG91bGQg
SSBzZW5kIGEgcmV2ZXJ0IHBhdGNoID8NCj4gDQo+IE5laWwNCg0KVGhlIEZpeCBwYXRjaCwgZm9y
IHRoaXMgd2FybmluZywgaXMgcmVhZHkgYW5kIGFwcHJvdmVkLCBjYW4gc3VibWl0IG9uY2UgdGhl
IGluaXRpYWwgcGF0Y2ggaXMgbWVyZ2VkLg0KDQpWZW5rYXQNCg0K

