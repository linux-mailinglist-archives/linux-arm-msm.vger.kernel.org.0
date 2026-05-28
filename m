Return-Path: <linux-arm-msm+bounces-110133-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ML0FEpdTGGoQjQgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110133-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2026 16:39:19 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9859F5F3D0D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2026 16:39:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C53C73182832
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2026 14:33:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F45D3F0A8A;
	Thu, 28 May 2026 14:33:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DZ+GORoc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BC822EFD9B;
	Thu, 28 May 2026 14:33:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779978799; cv=fail; b=prl4rZBip9n9XgNfIehdlYNHm63bltvZ79y8/Taw/mf5IK3dxoSqzpD2bmL7FQRIYpQP53rh5prhJ4/Pj/rzrnqxUagolwvaL7yxNqZ4uRmablTo0r+7Th8TzkBdwV54s/n4p2WMcGw+u4GZnJeR51b7p/tvJdT4j2khUs85OLE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779978799; c=relaxed/simple;
	bh=oY1GDGe6Biot2oPgnkmy7Bz/cw0+BvIJH5aC1CQ3Aec=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ru2VGJIPAIQr7pgC5AfJOUUPPYb3FjJ2KLBu1XHYnT6OiGMb0SKo2jx9nlqTLjYfhTAiBPEBdZYSzSa+fsEYr4ou5hXLXtfUHBQ95vBR0/my6WzQTrXo8dKn7tFFMbFpSlApaaOo5lZHem7OQObglmyY0Lm8yyxRpDI4fdvdKt4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DZ+GORoc; arc=fail smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779978797; x=1811514797;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=oY1GDGe6Biot2oPgnkmy7Bz/cw0+BvIJH5aC1CQ3Aec=;
  b=DZ+GORoceAVC1sxKE2HTGOpvcd0BwE5wna77PBXEYO85uiuOD0JZ9Q5c
   IdCnSRm//ENHV2QweKVV+I2HmIDyYoSo9V+ixm2u1t6e7PYDqJhtimRX1
   SDtLmKMrybjxi5VGLNDSdliAZWr3iVgIOMWi074Puryw9e3wN9llku8Wz
   3FqddWyQe2uVSoetL6djbba7G0tKcmD63OTX7YHpvyH6QQjSLVNqPqo4s
   8BEj6ZX1AjdxrvESxGN3SkchTm+4eZJ3jWfBMceyGi90WZEZyKGvQYZc5
   F4WfxiMCZB/u3InY5d7iyrDhzQSG4C9lsiHIssoDsRCOlZe4jn96s2w0v
   w==;
X-CSE-ConnectionGUID: u7ldtwn+SkOv5pI/PvaKjg==
X-CSE-MsgGUID: KsH4kbW9QxmgHWz8WumnVQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11800"; a="84447885"
X-IronPort-AV: E=Sophos;i="6.24,173,1774335600"; 
   d="scan'208";a="84447885"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2026 07:33:16 -0700
X-CSE-ConnectionGUID: b4brNJNKTjqjeJz2IsBQjQ==
X-CSE-MsgGUID: JAJTD2+CRDi16eLMeuxAtQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,173,1774335600"; 
   d="scan'208";a="272901064"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2026 07:33:17 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 28 May 2026 07:33:16 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 28 May 2026 07:33:16 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.37) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 28 May 2026 07:33:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fQ+WNVtLURgpYtD9wqua4i6vSP2PWtq6i0F5L4jpVKsQ1/VKeEokIudKj1qmVlz1GEpwaiz7DYku6anR3bH1WkxcaBf+UleMgNe0GEfW/NkcxQEyL2fvJS28zmPvlJsYTbDw+QsJgtGSoUsGkgMuqOUx+i+lLLiWM4IxJlqL38S/oCMsSLBVcFVVxaA6ThvBs244NUxYS1XkuuI2EKBsbnOMHVrR8FxsdeHxWGP/jptcjh2Pf772KEi0emgpjuewCfJJPG8/1ZU9PYo3cMpIrtbBl6bSLOXBeJqKrFxe9qjC+wFlC2j03N+90gh+Gk5K85k1ihyP+Q6r2p0gmSj0xA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=burs/aiojb6vhd2C5wTp7sDSSeRpO7nr0T4o6MqGgs4=;
 b=r7pLNyobUbmGmfRwky95PY9HE2/RnXDLyAxUYV+qCeRVMoRqTVo04erUY37vdSUUhqcBy4zgZ4l+jtZ01gXopiOV/ZqNd4b8rFODSpo8cG4ead+OlfTsLe8wsrRvnOI7dzxXq3prw0xWseymJaNxv1CDIZBr8kkP+y7ZFDYV5BNA8hVJ4kD1K7lYInvmo8l74Fn0OQ38+N5y9U+o1Q3wSHsW2DM3/pGIhhVBUTZSU9kOxbw+MMy0R9fB9vjFyO9Pr0gKxnpNIgMZUVx3rMhujfsWiT6IDoRFBBShZ6GexpJcjJKBg9Yy3Yh3aU32gf3od2MdahT6/Uwv5o0LqJH1dw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8718.namprd11.prod.outlook.com (2603:10b6:8:1b9::20)
 by CYYPR11MB8406.namprd11.prod.outlook.com (2603:10b6:930:ba::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.12; Thu, 28 May
 2026 14:33:08 +0000
Received: from DS0PR11MB8718.namprd11.prod.outlook.com
 ([fe80::6aa:411d:4bfa:619c]) by DS0PR11MB8718.namprd11.prod.outlook.com
 ([fe80::6aa:411d:4bfa:619c%5]) with mapi id 15.21.0071.011; Thu, 28 May 2026
 14:33:08 +0000
Message-ID: <f20bd885-d428-4eba-afbf-1b21e4d3ed8b@intel.com>
Date: Thu, 28 May 2026 16:33:03 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] net: qrtr: fix node refcount leak on ctrl packet alloc
 failure
To: Wentao Liang <vulab@iscas.ac.cn>
CC: Manivannan Sadhasivam <mani@kernel.org>, "David S . Miller"
	<davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
	<kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman
	<horms@kernel.org>, <linux-arm-msm@vger.kernel.org>,
	<netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<stable@vger.kernel.org>
References: <20260528080019.1176700-1-vulab@iscas.ac.cn>
Content-Language: en-US
From: Alexander Lobakin <aleksander.lobakin@intel.com>
In-Reply-To: <20260528080019.1176700-1-vulab@iscas.ac.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DU2PR04CA0217.eurprd04.prod.outlook.com
 (2603:10a6:10:2b1::12) To DS0PR11MB8718.namprd11.prod.outlook.com
 (2603:10b6:8:1b9::20)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8718:EE_|CYYPR11MB8406:EE_
X-MS-Office365-Filtering-Correlation-Id: e230ab00-d819-4789-9367-08debcc60992
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014|18002099003|22082099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: gHlUL8Xsr9biCykD8+/OlfBtz5oUXdMVzrvH9itLKNx6ZnZ5fteU9Vp72uGmzsHZaOWkK5tzygET+f9hGnanCNI2zYrXE0hH5kgX5ILUVPhTTzbJ2AvELygJrEnljwQoD2N5no0nEejL8AJcX5vyG2VQ+kIgEjw8udCMDVUbqMx/eOHIZVCgnaVHXyDIEPalSQjiKe0sY+os5UyOnyCFq/pgtat9Vr7q6P6rmmbgKZua3nedNifJmqy6eJuhDQru2V6mBAiS9tJ7biNzO3vJ+SrkeA9jLd95TW0OrLn3jzo88SfA/Mql9dFeTCa+E8LmtkCr+O8oadZNhlJ1RzCj56vZ/ihHk/2kP9s9KVcMYB06qbQIP5muL1Nf5WFIotiMeaplK/XZzUUUyeizYNg6BMkfkH46RSZdFZaRLH+GTqUDoBthCCgDcppT0r6G6+G3HP/922v7spSQEJ+wCw9allidg4hmWISXAcMV7Mmjm2DOvoHBmwLw7+6Bb7oKBJVlaZGJObHXRLF+SzaH+hgHEMtPlmCnb9GbO4sG3z1sLNbvvXltRjqG/FzLY7BQNh1PXKuBphY/tH6b97RSCtsGDKKsZrFzyozpqKKP9aawpqa63fbh849fEMMVA/NiYneVzI+JCDUymHhRs4edc8fy2h1owcBnGFt6s0A0f+wXRW6tDyZEPij5iiUVoqraPtsf
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB8718.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(18002099003)(22082099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UzBvN0hja2gwNlNEVW9pQmNNbVBSa2VwWHY3MFVRTlJJMWp3L2NCdlowbTBj?=
 =?utf-8?B?L0I0MEUzSS90SDRDbXlOYzFXTnM5aGNReVJOaTN2WTN2ejZQcnBwVnpLcndF?=
 =?utf-8?B?QjMzWnZrQk1POWtMSGNSeEh1VTZIVklYdlY3WVhheU01blNRWDg4OUNtZUFF?=
 =?utf-8?B?ZFF4RlcxSWxhLzd4NGJhUi9iYnZPenBVZmVYUXF3MldmS2ZpeUNmYWxtZUdW?=
 =?utf-8?B?QUllaGhoZUMrWldRKytUeDBLN2liSDl6S0p5Rktyd1VrMGZMRWtoYU9PS0hr?=
 =?utf-8?B?UDA3WGl0dUpvSGRxRmFMNmYzWklCMGdHTFBoalNxYTFZVnFQTkdPYm5hOWx6?=
 =?utf-8?B?NlNMckY4bXJSQW56bHJtY2FCa1BFUXduRjczWkRlYWZZSGVZQXVWcXYzelh6?=
 =?utf-8?B?N3Q4NkFLWStPK0hZdmNQb0dLOVpDbnNYbFJ2VmpYMC9DejJTcmx5a0pqNjBs?=
 =?utf-8?B?VGwxME56bkFMNWh0OGN6L0Z6bjkxNDJ0NXNGNTZoVkNzekNTVkFwY2VMRGk4?=
 =?utf-8?B?NHY1aEw5dkNrb0s3K0txVFhlTkJFSWtIdmZCc2FUL2ZrV0E4TDFrOG5jSzBs?=
 =?utf-8?B?QWpmcTFaQ1JMS2s4SWRkUFBQRDNvTVFjMkZiU05JakNpeHJuRFFZbDBlOEpj?=
 =?utf-8?B?K3FENzVha0JrZlVra2JNRWNVaXZaSis0bEtUUWxXOCtvN3NLUDhmQllYaHJQ?=
 =?utf-8?B?Tk9KNk5RTGY1VXMwSWNHSWJDM2xUWFVDMHZWb1c0elZueURQYlJXSnhVMVlV?=
 =?utf-8?B?MUhRUTBrUVNuR2hVblhvdS9tajhHelpvM0VQa1BuU2NOVW5ScmJobFcxZitG?=
 =?utf-8?B?R0tpOWpYZmdEci91K0hxWWFXaXpwc0kwQlNxVzBCRWJwNnFuK1FxYWR2aHY4?=
 =?utf-8?B?WFpNcEtLM1hMcThoL0piRGVWZWxSMmcxbWNBVXI2VHJFbWJrMUlGZ0FKMm9Q?=
 =?utf-8?B?eEVIaVdPZEFPeU5ONGZQN2NMSUsvVEJ1Sk4xMkJJMzd2Q2VXQThwMXBzVGMy?=
 =?utf-8?B?T0t5QU0xZ1RFYjFJSzlZOExkQkdsWEcvbXlRb2pGQ0lPNEk0emR4YjlMTGFQ?=
 =?utf-8?B?QkQyTlRwbzdwSzVoVlJNeEt6U21id0ZPdjVWK0N2eXBXRFZkbk1Ba0RkbGRT?=
 =?utf-8?B?b0xraHdRNWt4ZXorWGoweEU5M1UzU2tnU2REbGFPWW84ek9hYldWTUxNV00w?=
 =?utf-8?B?QWNiRXZFZ05lUzVJMTh0KzZUZlFZU3ZrS0tmcGUxZW5yczRmamQ0TU1aWTE1?=
 =?utf-8?B?NVUrb3ZiWkY3YnY4L1MxVzdYUEZzYjQrQzI1UEpRNFhTVU4vVjQxY2hRSlAr?=
 =?utf-8?B?SDlBc2F6eVVRNUdaMUtRdnM4SmNaYjFXcWxhbVB2SnZPTXlzR1o2UmlydDha?=
 =?utf-8?B?SmNhdG1SOW42dytIdUtsZVZtNldINXArdVdqZ09pMDhOS1AxRVNRSkp4ZVFD?=
 =?utf-8?B?bk9PTEFuNStKQW1XYUp5VUNmcUpmMzR4NUhUeDNNTk9PdjRsWWM2RVBRTXcr?=
 =?utf-8?B?MHdJSFlicDhjeFdJZGo3RnlVbURRaXFPMFdVeDVwKy9vVk4zV1hIYlBMMFU4?=
 =?utf-8?B?TmFwM3BBU2Vjc1phOGhaQ2Fka1B3MWlMb0U0VzZsTTMvWVkvdXhCK2ZoZDBp?=
 =?utf-8?B?RUpENDYrR1ZXbi84Mm1lVzc0cFJaNVFMRlYzNGxDZWRxMEVJKzZ5ZEx3R21K?=
 =?utf-8?B?QWtqOVdWU0VWenQ4cVVEMGthVjBiWG9xbGdhaXVlTFM4MHVZam5UeDkxd2cw?=
 =?utf-8?B?MTJic3FRZzB0RWNneC9IaHd6anpURWRRejNlQ040WWE3QmZMU1o4ckZuMzJ0?=
 =?utf-8?B?STJTaUlkSjI2Q05KYmVScXYxRDdoclVybEhMYUNEWmtxY2pkaGo4UGNKRXRi?=
 =?utf-8?B?UmV6allpajZ2ZjQzZXNka1JxemF4cVVmVVQwaVBTMHN6RXI0Q0dEMnJKUlRk?=
 =?utf-8?B?Mm45YnpsSUlTZWV4MzNaZmlOdytqdDRxcWhGUzh2QlplR1M5czBrK25zNVVM?=
 =?utf-8?B?Z1JIREZzR2sranFNSitvVUVHSjNPcWpHQTBDMytpZlhpY2toY0dqakRpQlFk?=
 =?utf-8?B?K2VOd0swRXpCajhHTTlTMXNkN3NtcEVjcDJDSnlBdGZWOUlLU0pFNjdNOHFw?=
 =?utf-8?B?U3ZpZjV1Sy81SXJmVkRZdXRGREZuVFd0SmNhSEtWNEZ5aEl3NVEwcTFiakhi?=
 =?utf-8?B?bnU3b0lXNFo0VklKaFA2eVJuQ243SWJFd0xCRnJzVW90cVE1WWxEaWdrVzkz?=
 =?utf-8?B?TkxZV1BodlpTTTFQNTQ1RzBlYlFwSnQvR2MwOWh2aHhGOStlczBvU3R0OXpu?=
 =?utf-8?B?TmNPTzZmQ2pxc2loWmlLcEl6YW5GYmcxOEsyMXUwTFNoZXNvQTB3QnhSSTFw?=
 =?utf-8?Q?qGybB2KT9v9/uziQ=3D?=
X-Exchange-RoutingPolicyChecked: oPy9zEGQzrdsu3IaZBbgk2wTjLpj3yt/E9tyVPjrq61ENryV8m20dMM/hRfqhCe1bGhvhuoeR1X2ky/7fD1n4EwbGeviZEsqceTWmZhubJIhaVwYkhPN3xR7D5BI2qbhuYSQc2h8AwwX2CpeW40Rl7X3ZK+/Lvx+g/No+7gadU2mWKYPsCNZ9DpytR24Ql0Ox13Iu/q83k+atkPvzRR3qR9rIv43QDbVyQLiitW8DA/w7G2knJ8ko7533UuhYJipRm59pEipftFEhPp9XXg8GpSzcF6v/+q9s59j40TqrA02kZuB6fW/2HppjGpjceTQSgVdh+CPhFmcfHtrOr8AAw==
X-MS-Exchange-CrossTenant-Network-Message-Id: e230ab00-d819-4789-9367-08debcc60992
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8718.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2026 14:33:08.6792
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Eqrui8aLPjr8B8fvoOx+9o1M74KRtf17F4FBUseG8PoLF8G+mJX6GcIpfyV6m/l1Er6klGZlONqzQABrRx36adAGX91bxpmwDP5EjjzTaWc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR11MB8406
X-OriginatorOrg: intel.com
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[intel.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[aleksander.lobakin@intel.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	PRECEDENCE_BULK(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-110133-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 9859F5F3D0D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Wentao Liang <vulab@iscas.ac.cn>
Date: Thu, 28 May 2026 08:00:19 +0000

> [PATCH] net: qrtr: fix node refcount leak on ctrl packet alloc failure

Please specify the net tree in the subject prefix, i.e. [PATCH net].

> qrtr_send_resume_tx() calls qrtr_node_lookup() which takes a
> reference on the returned node. If the subsequent call to
> qrtr_alloc_ctrl_packet() fails due to memory allocation failure, the
> function returns -ENOMEM without calling qrtr_node_release() to
> release the node reference.
> 
> Add qrtr_node_release(node) before returning on the allocation failure
> path to properly release the reference.
> 
> Cc: stable@vger.kernel.org
> Fixes: cb6530b99faf ("net: qrtr: Move resume-tx transmission to recvmsg")
> Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>

Reviewed-by: Alexander Lobakin <aleksander.lobakin@intel.com>

Thanks,
Olek

