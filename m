Return-Path: <linux-arm-msm+bounces-71464-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 89966B3F20E
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Sep 2025 03:59:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EE0791A84E65
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Sep 2025 01:59:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C5BA27FD56;
	Tue,  2 Sep 2025 01:59:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Xz1UKnDm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B17AA1E47CA;
	Tue,  2 Sep 2025 01:59:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756778355; cv=fail; b=LBFK8vItcyJ/QvXXMDzQvj3UIF9Hf4cojCnfDfZ7HcfwwsvJnHqG7x/YOcXK7d1KelX6x6IqdCJTjmtKqOQ6EU1ZYKnrwde60ILbbEQQQngFl48bM4Oz96N6En2CndWNqOQw7CcFsCfVqX2cinGprlPAd8ORI7RrJhLh1z8EM2A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756778355; c=relaxed/simple;
	bh=7yZJemF4xW1IArL9Lw0JsdNnsXMS7yuqI+QiS+KX5o0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=j1E5Kkzy7h9F6sg1CLG8zM1pUNGXCfwc/l5+qenU1Chv9yW/SLJEuV/XHK9LmZ/Aa7n2p8LcV0HYfEZysXwmB79Txc3y61iqe1TlqwmgalvR3O6szbk/dde7OsOjpRV1JNzIJZofXy3iR7vz5JTm5TwzjnGKjwGmJh76PCKmiD4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Xz1UKnDm; arc=fail smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756778354; x=1788314354;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=7yZJemF4xW1IArL9Lw0JsdNnsXMS7yuqI+QiS+KX5o0=;
  b=Xz1UKnDmFpDsYK7du+lPbPqhA/PrXSjWMknSf3Mp/sJNzlEaopouZ11W
   9KFQHxIdSyJsoEJFTkt2Cbla0TE8QW3S3oi5BhBa6UFdV6pD8tgEws4/r
   mNgz6XWCIkYgQkij4AdSmX27opJN4j6aay09Sp0Pa/zU0+LrANtP0CIqw
   dLJeyKJM5PXpO9zd/85k0YUGebphw7oE3MPKmCfobydx50Ix+gsZfQyqJ
   DlhYbjtUDpl4DDkRkTPatWLSrzoMCaoANzkfPd2whjoUNPPzyjqEprzhX
   EAbenerEm1OA7DpazgV+LEha9IorBdONIvpXVuiITaC3DtVM8eLtH3uhS
   g==;
X-CSE-ConnectionGUID: z43HXw6aQGiSm9a/zx5h3Q==
X-CSE-MsgGUID: BxFv4AvsQtWdXYWNHhOoWA==
X-IronPort-AV: E=McAfee;i="6800,10657,11540"; a="70411187"
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; 
   d="scan'208";a="70411187"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2025 18:59:13 -0700
X-CSE-ConnectionGUID: w9OwHwDrR9Wibm3laVsyxA==
X-CSE-MsgGUID: 8/qU2HoETHyQE8EfI6oGwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; 
   d="scan'208";a="170408277"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2025 18:59:12 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 1 Sep 2025 18:59:12 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Mon, 1 Sep 2025 18:59:12 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.76)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 1 Sep 2025 18:59:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pLTqGO+AhthDHFZ/6tAV7i5FLBNgNueXBZztPBSGN8VueQq7swjRGWz4FdT7xy77dHKKc1Wm9GGIs4CFDmiXVENDhbK6Me3JmhZP3QFqNN04VDXXMoCEfXAIvaCN6Q0ZKlmDssAxBdT0PJyFtYGAh+f2wumb7eNsLziYPF2Ggs2JrPQWeld/QoTJyiyJDavNj0RXyZ1B0pBMYnRPo7we2zmyWap9rWD2isG85sMDhhipUrFArrDGZOTAfInsOHRAypJAgJOuY3LIrEQ1xfek8pftftddqcpuQIsKRDku0D5XthW1dLl+zRysKlhY0sMpdNAvLKLA3L4OGBPhAkagsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7yZJemF4xW1IArL9Lw0JsdNnsXMS7yuqI+QiS+KX5o0=;
 b=BYHLrwgfTeDcarVTaQmW3cuNWx8PuOwVIbysOf9+x6ocR3CcUtTEhdS2mJwOSl9vZMWHcF2Zmt139qjlsZLhp1jPu2SZ+OtIUPzAK4Gu1xw8VfzJYqhucWIsIusPtWahF9LR55vMLzrQkF+SFn0TKqdJZpldx4fi4ZwcLRK+aWK4apopsDlhvn5rPUp/chMrpGnh4MqDtWiRte14FlJhxEw4fMQYxToX3BU6EhqE8vCDUjZH1AVn6v3GGCXCGOYzRjdWyiMa7wvk9ECJ4QtHHbPyoQkX+82GWz5HvGwkYeJv2jPcajyxe2bFCPw/ddZ49VyxnsHzBeKouVO9nVrA0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5300.namprd11.prod.outlook.com (2603:10b6:610:bf::18)
 by SN7PR11MB7537.namprd11.prod.outlook.com (2603:10b6:806:348::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.19; Tue, 2 Sep
 2025 01:59:08 +0000
Received: from CH0PR11MB5300.namprd11.prod.outlook.com
 ([fe80::81fd:4855:139d:6e74]) by CH0PR11MB5300.namprd11.prod.outlook.com
 ([fe80::81fd:4855:139d:6e74%4]) with mapi id 15.20.9052.013; Tue, 2 Sep 2025
 01:59:08 +0000
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
Thread-Index: AQHcDTjBQ9B/HpZlE0OWqgHmvUxK67Rpwj4AgAL7nwCAEVGZAIABMEhg
Date: Tue, 2 Sep 2025 01:59:08 +0000
Message-ID: <CH0PR11MB5300FDBB088A98842785678F8006A@CH0PR11MB5300.namprd11.prod.outlook.com>
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
x-ms-traffictypediagnostic: CH0PR11MB5300:EE_|SN7PR11MB7537:EE_
x-ms-office365-filtering-correlation-id: 25d71d2f-8616-444b-ce3b-08dde9c44daa
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?NDE4c1dSNEM2Vks3aW5aU0xZdDQzVkxRdVhXcEdzQktHdGE0cXBBeE5qc2Qx?=
 =?utf-8?B?WHQ1VXpBTUE4MER3NGJKTUpicXRjUTFvbE51VDhCd3pFSWpSZFBKQnhacVpU?=
 =?utf-8?B?QWhpdkRVYjJYcE5UL3o1RzZiTGlxUGM5TTEzSHJMUmJmTnZOblYxeFBKUzFy?=
 =?utf-8?B?OVVqQTg0YmdBWlJnVVhyemdpNVd6SWM1STl0MmNod2dVUFFTVzJFdTluNm9u?=
 =?utf-8?B?QjRqaHFacXk3SURvNVZJNVk5eFlzWEhmT3ZjdW40dHFUd2Z5VmQ1N0M0dmhD?=
 =?utf-8?B?dS9QbTBlOU9qM2Z6a0FTUld5c1FsdVVVdVZDMUgrQ0VJeG5hSVcyQUFXK3lH?=
 =?utf-8?B?ZjNMK2hReEFUdG1sUUk2WjFTaElVeTB3b3JLLzEvVFpGMmlIK0hhdDJuSUFq?=
 =?utf-8?B?MFRzWVdCV3JPenJXc1FVSmR3c0ZPa0h6dW14OFZBRzhUT1d0NXY0V0dhUzdD?=
 =?utf-8?B?b2I0SVBvU1NkMjU3dVhUdHVad3RMUUtEQWN4bXhMK1F0TDcrNTIrVFFFVDFR?=
 =?utf-8?B?U0REbU5OdW5FZE5ScnJhdXNjYmVyZnA5NFNGMnVoQURCNnFSSzNpc2ZsZ0lQ?=
 =?utf-8?B?RUVCc0hTQWM4UjdIMHo4ZmJuSXFMNlIzZHVnb1dldTdHa3VQUjE1dFVQdmNZ?=
 =?utf-8?B?YW44K0xhWmRKNGU3UGZ5aU9iUGhTYTIyb3RLQTJuTHltREpNOVBGS2N0MEF2?=
 =?utf-8?B?MGo3cVpGWjBWUVQ1VFYwMzkrTmRPN052c1VuS3hPRFJWKytRRDBBZnVTOWxF?=
 =?utf-8?B?endnK0Q0YW8vZStRZE5GUSt6Q0FBUTl6S09IeUowZkpxKzVJcU45NXBKVU83?=
 =?utf-8?B?Uk96Y2ZhVVBSdGRFTW5UR1BtempLdFdQSGI1b21lbkxsZjVES3B4ckRJUWVI?=
 =?utf-8?B?S2ZvNkNzL2J3RTA0L0FaU0UvR1F2K214UFl4R3lsS2VBRzJXb25YUFoyL2Rk?=
 =?utf-8?B?SW5ONXVYYVRHejVyZCtPVWVQS0xHM2lRK0hHci8veUVDeXVpVUp1K2F6dC9o?=
 =?utf-8?B?d21MeEx1NVV1TXlCVzlpMVFTZXVrYm1PS29wdzNoNlp5TmJFd3lxQitDZytl?=
 =?utf-8?B?cy9UNWVEZ3prV2FXWXliSExjOFh4Q3VScnEvZ1g0T2txeGlKenNNTXdOV3Fj?=
 =?utf-8?B?YmtoS2pnVXE1bTlBVi9iemQySDFZOFhQNVEwQVBTWEJzZ01KdjZCYTBWcnI3?=
 =?utf-8?B?YkhpQnNEeE1wcEpNeXFHc2VtNytRM1NlL0U2OWV5VW9UQ2RwVzUrdGIrMTd1?=
 =?utf-8?B?b0V4bFpZckhYc2xBdklDOHZxS0lPcDUrQ0hPRDBiVjdxdm5KWnhMQnBOaG5Q?=
 =?utf-8?B?R2szTkxSYzBDem1LSHB6aDRHdVcrN0FMUzBPb0licEI1RzI3Q25pUEtZaE44?=
 =?utf-8?B?VUFjQ054aS9FckMxdlpSMmFrVEdpM1ordXc0ZlBpZUtCSFA2ekl3Zm9xZG8v?=
 =?utf-8?B?MlJTWG43cjhiVmlyL0k4SjVNK21BRkV3MkVOUHluKzMvOTQ2cldhaXl4RDY2?=
 =?utf-8?B?K0F1RitHeW1IYlRya1dzc3lld3p3RG1pLzhVRlVkNG1lNkJwQ3RvUDR4bXZK?=
 =?utf-8?B?T0ExazcvdFBvTUl1d2diMVd0L2hDUStmbWlwckNvMHZ4cmFadVRPbUFIV0F1?=
 =?utf-8?B?bENZSzV1VG1yL2ZUUkt4VC92YWJGYTVNM0tSMnhGTmF6VEFacXlBbEF1WHBo?=
 =?utf-8?B?Z1lTVU9ONGpJZ21ueStYV1NhVDBscFNFcjlVUWZZMXI0ZW9LLzVqUitEY2l6?=
 =?utf-8?B?ZDFReG40bkZSa3JZazd0MndSR0F3aUxTMVJ3NFg3M1kvbys2Y3N6dWhxdTgy?=
 =?utf-8?B?VXpTK2p5elFRMDY5QjhVRDM2ZkxxbVNONVd2VDd5YTF0UDJZUE42MXZ6dHZK?=
 =?utf-8?B?a0FrYWh6ZHZLa1BvWGdnSnJyZVBmMlRoMHN5Zndibk11ZnJJR1AzenFncHU3?=
 =?utf-8?Q?YrBXNtFmu7I=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR11MB5300.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SDNKNkIwS2x4V2Vucy9KSXpQMmE5ZEVpak5GL3JPMlhETjRHZmRUQ1IvK05N?=
 =?utf-8?B?aXNoeUpucXpBQTlDUHM5WndNb3cvelJRak5rNEhNSUFzVk50d3NEbStCdFY0?=
 =?utf-8?B?V3NjWlFLc0RnNTBROWVrSWpybHVIdFNLK0tlYmwvVkRwbWlDTnVPUWl2Ti96?=
 =?utf-8?B?YVljeXU1Vmp1dnVHRHkza0ZDUW9vVWY3SGhSRjdMUFR0amdLVUl1OWpTSGtI?=
 =?utf-8?B?UHdhQWgyblBZQzFZeUIzcnJWb0VPZVhQd0JoRzg2ZVc0d0NJdDlxRkZQSnJE?=
 =?utf-8?B?QnBOei9OM3FGaVJ6MHB3QytSbitWa3owSVZQMVBXNDR5d2Jna3dkTzlrM3Ni?=
 =?utf-8?B?RXplZXE0RFlvbVNVZkZpcDVxdjFqTTE5M2crWldsRUc4OFhrcVdvVUNUbUFI?=
 =?utf-8?B?aDNEZFBTRk0xUXduWWhlNjBBcDZrcTVIYVpNYnZxM2NlM0x2K25sMDFWalZC?=
 =?utf-8?B?UGNPUXR1WDBsWEcxRnlyMTJOUXppT3dzbVMzUTVhU0J5cEMxWHJtdm9NZDRB?=
 =?utf-8?B?dW5qWmNFOHZiVFNCWU9haVVYTVpsd09scVY1R2hOek1NR1o2eDg5ZzVzeHVX?=
 =?utf-8?B?YzN6V0tjclN4QVRtdGIzZ1JJcGxMLzc3c3ZWeVRwZndudlZoQU9SOVlwNGV5?=
 =?utf-8?B?TnU0Q1dURnVvdm5pV0FBQVZSaWNoakl4Z3J6WURhNk42SmVSdHBDbXlxTTdp?=
 =?utf-8?B?cFRjbzFSeU5udmdGdEJwcVVuaWZ1bXNxTTdxc3poejNjeVhzeUFwZGVzYWcw?=
 =?utf-8?B?bnBPWW5lSU1jWFljN1BnY2hKMk9icDNsd0Rielg3amdXVHk1VHZXN2sySDdi?=
 =?utf-8?B?ZXJtY2F1QmRzOWUvOCtBbGY5b0x0WEtSeGNJTFAyM3RLUjJiTGs5NUNIa1pB?=
 =?utf-8?B?NjNSTG1JUmdNcG1SeHRnbTZIaG1CTUZnK1pQU2xINGFHYUJFR0hTc1p5NWox?=
 =?utf-8?B?UFgzRmluK2N3QUhJZ2VuWTA0b0x5M0ZYenA2Ris1RktNczJOUUd3OG1DYUlR?=
 =?utf-8?B?dlQ0VUxFUXZjNTZsZHppUGRFNFpsN3h2YkhaQ2pMRXlmejNVMUlkbUwvT0cw?=
 =?utf-8?B?SnJRekZML3pxNzhrYjRFR1dNc2pDbFI2WnRMUEZoV01MZmk0SEEzUE1lVGdH?=
 =?utf-8?B?OEpMS3dleGxqUGNHYXJlVHRKUERka1I2bEYzYmpWOVFZQzdqUTlYUzRlT3BP?=
 =?utf-8?B?bFZxS3hqblZ6Mm5MblAxd2VHR244Z3dSdFRWNVRpallrbXpZQXRsZXk1U1pj?=
 =?utf-8?B?YzByY1M0a0RsT0tzNmw5cTVlUGQvRGwzSzZtRjZYZldkcHhEODFQTndiczVy?=
 =?utf-8?B?SXhhZStWYUExUGtkWGZEcjVYNEJNU0pmbEZaU2Npakc0SHAxOHAwWWkxS1o5?=
 =?utf-8?B?T1hBKzdFWi9EMWcvaWlab0FHYUQ1QXBaeUZ5Nml6T0Flc1JNTTMxT09uRmFI?=
 =?utf-8?B?QkFsUU5aVFJVMzgwaVdPTTBqNlBYZ3hIYkQwekRtVXJ6TFVSSnFTd2pneklV?=
 =?utf-8?B?SjhYNjl2VU9EZnhzeUNSNWc3anc3RllROE01WnJabUZNdFNrbjZzQVZ4MjU4?=
 =?utf-8?B?dWZBSkd0MEVWNU01dzNSWFFLTmMzeFZIWm5IK1R3NWwvc1lxRzdDVlZIZi9n?=
 =?utf-8?B?TFFTREd4WHJ0VVJucjcwcXB1TS9zVWo0U2lZZDFXbFN6WGs4SmlsWVV6K2xW?=
 =?utf-8?B?VlRzLzhDbWRTRTFOWmNBck05OUsrcWNXc1N6bml6QzF0S3lJOUZMaVhZejNx?=
 =?utf-8?B?cS93VVR1dUY5dVFJNDNBSCsrZ1ZSRFp2dUczSzNOM2poYnB1TVN6Zm05elN0?=
 =?utf-8?B?Sm54ZU5HSXh6TnF5L0RVbDBFREh2dWZHOUM1UC9YRTV0eUlTQmMvd29yeTNl?=
 =?utf-8?B?aUIzZTN2aU5lVkN5dGRDN3dmaElUMmxIb3pVZzZZUDhmbm92UVYyb0ZqOXp3?=
 =?utf-8?B?d2p6SjdqZWxZL2VKK2YzbWJ1VDdaNHZPbWh6cU1HSURLTExGaGdWbC84bS9v?=
 =?utf-8?B?N2MwMllJbWFucFpjb3hlMnVJTkw4NGtQNCtHNEkyejl1NkJwd1hSSExSd1lo?=
 =?utf-8?B?ZkpPVXpTVmMwcjdKclVTU2huQndjZnIyNkVMZWdWRUg3aG80RU12WVVndkFw?=
 =?utf-8?Q?5lPw2KVC/Be8FKfHGPN+UBisu?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 25d71d2f-8616-444b-ce3b-08dde9c44daa
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Sep 2025 01:59:08.2142
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: i8QkHzJ2USkLO+rqAfFW6usEdTbhsp1jh3d0vy1zel+1oyFCrgCpl7d+mgcWQQjTGLIxrJPVKF6yLSX6YyaiMLmCpd2NMg1f6z8ncWDwknA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7537
X-OriginatorOrg: intel.com

WWVzLCB0aGUgZml4IHBhdGNoIGlzIGNvbWluZyBpbiB0aGUgbmV4dCBkYXkgb3IgdHdvLiBUaGFu
a3MuDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogTmVpbCBBcm1zdHJv
bmcgPG5laWwuYXJtc3Ryb25nQGxpbmFyby5vcmc+DQo+IFNlbnQ6IE1vbmRheSwgU2VwdGVtYmVy
IDEsIDIwMjUgMTI6NTAgQU0NCj4gVG86IEhlaWtraSBLcm9nZXJ1cyA8aGVpa2tpLmtyb2dlcnVz
QGxpbnV4LmludGVsLmNvbT4NCj4gQ2M6IEpheWFyYW1hbiwgVmVua2F0IDx2ZW5rYXQuamF5YXJh
bWFuQGludGVsLmNvbT47IGxpbnV4LXVzYkB2Z2VyLmtlcm5lbC5vcmc7IGdyZWdraEBsaW51eGZv
dW5kYXRpb24ub3JnOyBQU0UgVHlwZS1DIExpbnV4DQo+IDxwc2UudHlwZS1jLmxpbnV4QGludGVs
LmNvbT47IGxpbnV4LWFybS1tc20gPGxpbnV4LWFybS1tc21Admdlci5rZXJuZWwub3JnPg0KPiBT
dWJqZWN0OiBSZTogW1BBVENIIHYzXSB1c2I6IHR5cGVjOiB1Y3NpOiBBZGQgc3VwcG9ydCBmb3Ig
UkVBRF9QT1dFUl9MRVZFTCBjb21tYW5kDQo+IA0KPiBIaSwNCj4gDQo+IE9uIDIxLzA4LzIwMjUg
MDk6MjEsIEhlaWtraSBLcm9nZXJ1cyB3cm90ZToNCj4gPiBPbiBUdWUsIEF1ZyAxOSwgMjAyNSBh
dCAxMTo0Nzo1OEFNICswMjAwLCBOZWlsIEFybXN0cm9uZyB3cm90ZToNCj4gPj4gSGksDQo+ID4+
DQo+ID4+IE9uIDE0LzA4LzIwMjUgMTg6MzAsIFZlbmthdCBKYXlhcmFtYW4gd3JvdGU6DQo+ID4+
PiBBZGQgc3VwcG9ydCBmb3IgVUNTSSBSRUFEX1BPV0VSX0xFVkVMIGNvbW1hbmQgYXMgcGVyDQo+
ID4+PiBVQ1NJIHNwZWNpZmljYXRpb24gdjIuMSBhbmQgYWJvdmUgdG8gZGVidWdmcy4NCj4gPj4+
DQo+ID4+PiBGb2xsb3dpbmcgcG93ZXIgcmVsYXRlZCBmaWVsZHMgd2lsbCBiZSBleHBvc2VkIGFz
IGZpbGVzIGluIGRlYnVnZnM6LQ0KPiA+Pj4gcGVha19jdXJyZW50IChQZWFrIGN1cnJlbnQpLA0K
PiA+Pj4gYXZnX2N1cnJlbnQgKEF2ZXJhZ2UgY3VycmVudCkgYW5kDQo+ID4+PiB2YnVzX3ZvbHRh
Z2UgKFZCVVMgdm9sdGFnZSkNCj4gPj4+DQo+ID4+PiBUaGVzZSBmaWxlcyB3aWxsIGJlIHVwZGF0
ZWQgZWl0aGVyIHdoZW4gYSBSRUFEX1BPV0VSX0xFVkVMDQo+ID4+PiBjb21tYW5kIGlzIHNlbnQg
ZnJvbSBPUyBvciB3aGVuIGEgZGV2aWNlIGlzIGNvbm5lY3RlZC4NCj4gPj4+DQo+ID4+PiBSZXZp
ZXdlZC1ieTogSGVpa2tpIEtyb2dlcnVzIDxoZWlra2kua3JvZ2VydXNAbGludXguaW50ZWwuY29t
Pg0KPiA+Pj4gU2lnbmVkLW9mZi1ieTogVmVua2F0IEpheWFyYW1hbiA8dmVua2F0LmpheWFyYW1h
bkBpbnRlbC5jb20+DQo+ID4+PiAtLS0NCj4gPj4+IENoYW5nZWxvZyB2MzoNCj4gPj4+IC0gUmVi
YXNlZCB0byBrZXJuZWwgNi4xNy1yYzENCj4gPj4+DQo+ID4+PiBDaGFuZ2Vsb2cgdjI6DQo+ID4+
PiAtIFJlbW92ZWQgZXh0cmEgc3BhY2UgaW4gZGVjbGFyYXRpb24NCj4gPj4+IC0gTWFkZSB0aGUg
Y2FsbCB0byBkZWJ1Z2ZzX2NyZWF0ZV9maWxlIHNpbmdsZSBsaW5lIGZvciBjbGFyaXR5DQo+ID4+
Pg0KPiA+Pj4gICAgZHJpdmVycy91c2IvdHlwZWMvdWNzaS9kZWJ1Z2ZzLmMgfCAzMSArKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrDQo+ID4+PiAgICBkcml2ZXJzL3VzYi90eXBlYy91Y3Np
L3Vjc2kuYyAgICB8IDE2ICsrKysrKysrKysrKysrKysNCj4gPj4+ICAgIGRyaXZlcnMvdXNiL3R5
cGVjL3Vjc2kvdWNzaS5oICAgIHwgMTMgKysrKysrKysrKysrKw0KPiA+Pj4gICAgMyBmaWxlcyBj
aGFuZ2VkLCA2MCBpbnNlcnRpb25zKCspDQo+ID4+Pg0KPiA+Pg0KPiA+PiBUaGlzIGNvbW1pdCBj
YXVzZXMgdGhlIGZvbGxvd2luZyB3YXJuaW5nOg0KPiA+PiBbICAgIDguNjQ2MTc5XSAtLS0tLS0t
LS0tLS1bIGN1dCBoZXJlIF0tLS0tLS0tLS0tLS0NCj4gPj4gWyAgICA4LjY1MDk4Nl0gQWNjZXNz
IHRvIHVuc3VwcG9ydGVkIGZpZWxkIGF0IG9mZnNldCAweDU5IChuZWVkIHZlcnNpb24gMDIxMCkN
Cj4gPj4gWyAgICA4LjY1MTA0NF0gV0FSTklORzogZHJpdmVycy91c2IvdHlwZWMvdWNzaS91Y3Np
LmM6MTI5NiBhdCB1Y3NpX2hhbmRsZV9jb25uZWN0b3JfY2hhbmdlKzB4MzgwLzB4NDE0IFt0eXBl
Y191Y3NpXSwgQ1BVIzA6DQo+IGt3b3JrZXIvMDowLzkNCj4gPj4gPHNuaXA+DQo+ID4+IFsgICAg
OC44MzI0OTFdIEhhcmR3YXJlIG5hbWU6IFF1YWxjb21tIFRlY2hub2xvZ2llcywgSW5jLiBTTTg1
NTAgSERLIChEVCkNCj4gPj4gWyAgICA4LjgzOTIyOF0gV29ya3F1ZXVlOiBldmVudHMgdWNzaV9o
YW5kbGVfY29ubmVjdG9yX2NoYW5nZSBbdHlwZWNfdWNzaV0NCj4gPj4gWyAgICA4Ljg0NjA4NF0g
cHN0YXRlOiA2MzQwMDAwNSAoblpDdiBkYWlmICtQQU4gLVVBTyArVENPICtESVQgLVNTQlMgQlRZ
UEU9LS0pDQo+ID4+IFsgICAgOC44NTMyNzddIHBjIDogdWNzaV9oYW5kbGVfY29ubmVjdG9yX2No
YW5nZSsweDM4MC8weDQxNCBbdHlwZWNfdWNzaV0NCj4gPj4gWyAgICA4Ljg2MDAzMV0gbHIgOiB1
Y3NpX2hhbmRsZV9jb25uZWN0b3JfY2hhbmdlKzB4MzgwLzB4NDE0IFt0eXBlY191Y3NpXQ0KPiA+
PiA8c25pcD4NCj4gPj4gWyAgICA4Ljk0NDAyM10gQ2FsbCB0cmFjZToNCj4gPj4gWyAgICA4Ljk0
NjU3MF0gIHVjc2lfaGFuZGxlX2Nvbm5lY3Rvcl9jaGFuZ2UrMHgzODAvMHg0MTQgW3R5cGVjX3Vj
c2ldIChQKQ0KPiA+PiBbICAgIDguOTUzMzI4XSAgcHJvY2Vzc19vbmVfd29yaysweDE0OC8weDI4
Yw0KPiA+PiBbICAgIDguOTU3NTAyXSAgd29ya2VyX3RocmVhZCsweDJjOC8weDNkMA0KPiA+PiBb
ICAgIDguOTYxNDAxXSAga3RocmVhZCsweDEyYy8weDIwNA0KPiA+PiBbICAgIDguOTY0NzU5XSAg
cmV0X2Zyb21fZm9yaysweDEwLzB4MjANCj4gPj4gWyAgICA4Ljk2ODQ3NF0gLS0tWyBlbmQgdHJh
Y2UgMDAwMDAwMDAwMDAwMDAwMCBdLS0tDQo+ID4+DQo+ID4+IG9uOg0KPiA+PiA4NTUwLWhkazoN
Cj4gPj4gaHR0cHM6Ly9naXQuY29kZWxpbmFyby5vcmcvbGluYXJvL3Fjb21sdC9jaS9zdGFnaW5n
L2NkYmEtdGVzdGVyLy0vam9icy8yNTMzMTIjTDE0MTgNCj4gPj4gODU1MC1xcmQ6DQo+ID4+IGh0
dHBzOi8vZ2l0LmNvZGVsaW5hcm8ub3JnL2xpbmFyby9xY29tbHQvY2kvc3RhZ2luZy9jZGJhLXRl
c3Rlci8tL2pvYnMvMjUzMzA2I0wxNTYwDQo+ID4+IDg2NTAtaGRrOg0KPiA+PiBodHRwczovL2dp
dC5jb2RlbGluYXJvLm9yZy9saW5hcm8vcWNvbWx0L2NpL3N0YWdpbmcvY2RiYS10ZXN0ZXIvLS9q
b2JzLzI1MzMwOCNMMTQ5NA0KPiA+PiA4NjUwLXFyZDoNCj4gPj4gaHR0cHM6Ly9naXQuY29kZWxp
bmFyby5vcmcvbGluYXJvL3Fjb21sdC9jaS9zdGFnaW5nL2NkYmEtdGVzdGVyLy0vam9icy8yNTMz
MDkjTDE1OTQNCj4gPj4geDEtY3JkOg0KPiA+PiBodHRwczovL2dpdC5jb2RlbGluYXJvLm9yZy9s
aW5hcm8vcWNvbWx0L2NpL3N0YWdpbmcvY2RiYS10ZXN0ZXIvLS9qb2JzLzI1MzMxMSNMMjIyNg0K
PiA+PiB4MS1xY3A6DQo+ID4+IGh0dHBzOi8vZ2l0LmNvZGVsaW5hcm8ub3JnL2xpbmFyby9xY29t
bHQvY2kvc3RhZ2luZy9jZGJhLXRlc3Rlci8tL2pvYnMvMjUzMzEwI0wyMTYwDQo+ID4+DQo+ID4+
IEkgZ3Vlc3MgdGhlIHZlcnNpb24gc2hvdWxkIGJlIGNoZWNrZWQuDQo+ID4NCj4gPiBWZW5rYXQs
IGNhbiB5b3UgYmUgcHJlcGFyZSB0aGUgZml4IGZvciB0aGlzPw0KPiA+DQo+ID4gdGhhbmtzLA0K
PiA+DQo+IA0KPiBHZW50bGUgcGluZywgY2FuIHRoaXMgYmUgZml4ZWQgPyBTaG91bGQgSSBzZW5k
IGEgcmV2ZXJ0IHBhdGNoID8NCj4gDQo+IE5laWwNCg0K

