Return-Path: <linux-arm-msm+bounces-82064-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 03916C63003
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Nov 2025 09:57:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 515C534FCA1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Nov 2025 08:56:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 123B7324718;
	Mon, 17 Nov 2025 08:56:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ElJypurF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39934322C7B;
	Mon, 17 Nov 2025 08:56:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763369768; cv=fail; b=ddp8utX9pVsOlbwMvcDWRJzEXJ/aaflrnVxFfCNF65n9saZoGodFeEKgtyN+GIx0OiESd5b2egh4PMJSos61gvjQZjmPA2c9yqmhD4uJkQ1i2zk7jrYAyfAO93R/VcJLUtj64IKH1XIjnBiagep+GSs0/gJn3YSTUPu0CI+fXmU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763369768; c=relaxed/simple;
	bh=5ahedrK+2V9LNevtbt0se5T/U/jVaicco9c5aS+ovAk=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=XkVgbhABQLpLJgpO+4WrbEk3I1bc/6zTgeax7xuq0YVN4+Ce+rQtqC1j10MoureCqNJ8D29MffYv+ApFvlbjmJ0rYS2LbrM4ZNi4/bLMkVlI3ig1Qu2fEgVQQ5BhrhNhXjnT+ZF0Uo/0Bq0+1hxDeikmLOvmOIZ8oaohrLKIMII=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ElJypurF; arc=fail smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763369766; x=1794905766;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=5ahedrK+2V9LNevtbt0se5T/U/jVaicco9c5aS+ovAk=;
  b=ElJypurFFB5+Cy/K7OH+iwtD9WRK03iYKdb9VSmaEorDiDKhXtoZcnWI
   Y2L/y4vQzeTtNY9fX5hLDZSYcXAwxoryrPtYsdOndJOsXw6AOr1MfWhCA
   wvpmJwRqjthLgbg6CUtOQycOrE7qxaWFPiNzTFrVdtE5S2++NIAM54yu4
   x2L8tynroBhNzfvu6Jye4sI6Bdo6PDv13uub49kK+5uK5wQzuLl6KG9Gs
   UPkQaClMNkYEvuJSqeeca3Q75wfTO1qJ5yR98ixPRxMHfQfJwiEZZY0Iy
   YjID0zoZUP7h6SV4NBcdsb5q42Imn9vxkkc919VjEtG7ryGD+jrUYWpf6
   w==;
X-CSE-ConnectionGUID: +sAkDqa5T7WoNnGcRRi1FQ==
X-CSE-MsgGUID: ocbDKYvTTAOIieA3VZo9hw==
X-IronPort-AV: E=McAfee;i="6800,10657,11615"; a="88011097"
X-IronPort-AV: E=Sophos;i="6.19,311,1754982000"; 
   d="scan'208";a="88011097"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2025 00:56:01 -0800
X-CSE-ConnectionGUID: exGlgz/USiaGzsMDYILOxQ==
X-CSE-MsgGUID: UUy5sU5/QyuiK5x/JLBwnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,311,1754982000"; 
   d="scan'208";a="190185299"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2025 00:56:01 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 17 Nov 2025 00:56:00 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 17 Nov 2025 00:56:00 -0800
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.14) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 17 Nov 2025 00:56:00 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gp/lFQqQGJP42BdF1y8aB0VZtQ8/TegGTIM4ug7LOJopvi0tnX2cMbXuaaytXWMiZfE7ctwrcmWpJyP8PHHroMei7fFaP1KOFFjlSsMLvIeZd2vL54Gglj8nOvkQ4cM2MY2C2grreSUjPeLpFMFON5FvAIpGHTLeFLZ+p1+wmBsyjXCLdLdPmLgAq7mpHrLBIEzOTBRcLKxgPoNppFWBphSGfjl2BiPxvAn68tQCvrQY/e5HtWzvqUPzWzbJtwXdj1LK4RVjreUc4baJG0jZZMPWuHeUSVaPlNNzJdUSDdzQndnf+62ypn+TqPuxgfpBz7Atb+DUEw5C1ruxu8LgCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JFpdwj67gA5CT1z/aRInjVukRDca3ESBy1ROm6OOnBE=;
 b=sHnWyk595MpCCPmpnPCUSaGp2MgjCFpcNmhqxlfZ/CfDJmssf0z0daH5mIOP573DvwHsM1KbXf+rnFy3DmdQDwrST6Yn82uP+Zi+m533wC7uAaHsuVPG9KQO+L7M5n/5vFLfbLxvv6CW4o1bCWehepfoYqltwsT4CEWfUVyitx+x9w749PBVfbbFHP7yHkX3sjuGi/bGazw+dWHsZwBPAwFuTXmaYRuLBGdzqraKuXQAKFaBi7PBn0Djd5yAz97vjE+E4QEjVXN826v3zFzh0HIWOqCTCBHEkBffIROvM2PZ6UwGiMSjGjVM89RhTpsWmsHUk5E8LYOqPqho/+xauw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7198.namprd11.prod.outlook.com (2603:10b6:208:419::15)
 by DM3PPF1721FD39C.namprd11.prod.outlook.com (2603:10b6:f:fc00::f0a) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.22; Mon, 17 Nov
 2025 08:55:53 +0000
Received: from IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::eeac:69b0:1990:4905]) by IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::eeac:69b0:1990:4905%7]) with mapi id 15.20.9320.018; Mon, 17 Nov 2025
 08:55:53 +0000
Message-ID: <47c2b137-3abb-4933-9708-d6dfbd2f7a91@intel.com>
Date: Mon, 17 Nov 2025 10:55:48 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2] mmc: sdhci-msm: Avoid early clock doubling during
 HS400 transition
To: Sarthak Garg <sarthak.garg@oss.qualcomm.com>, Ulf Hansson
	<ulf.hansson@linaro.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-mmc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <quic_nguyenb@quicinc.com>,
	<quic_rampraka@quicinc.com>, <quic_pragalla@quicinc.com>,
	<quic_sayalil@quicinc.com>, <quic_nitirawa@quicinc.com>,
	<quic_bhaskarv@quicinc.com>, <kernel@oss.qualcomm.com>
References: <20251114082824.3825501-1-sarthak.garg@oss.qualcomm.com>
Content-Language: en-US
From: Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park,
 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 -
 4, Domiciled in Helsinki
In-Reply-To: <20251114082824.3825501-1-sarthak.garg@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DB8P191CA0003.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:130::13) To IA1PR11MB7198.namprd11.prod.outlook.com
 (2603:10b6:208:419::15)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7198:EE_|DM3PPF1721FD39C:EE_
X-MS-Office365-Filtering-Correlation-Id: e30c7efe-4d8b-40f7-2fc5-08de25b71d48
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NFpQNFFiYUJGRU5nNFdRbnZNblJDVWo5ZTd4eVRNZzFDVTZKZnhIWEVqV3Jo?=
 =?utf-8?B?eTNJMFd1ZCtBTlk4UnlBbWxYeS9rZGxNUHJaek9UZzhldGMzaDVMaExYZjdQ?=
 =?utf-8?B?WEtmQm5PYmUzTFB6YkNKMW1LQkQ2YXI3dGF4VE1qN2M3Kzl0Ti96czFFcjlL?=
 =?utf-8?B?TWpMb0ZjNlZoTnJIbWxiVWZ3TVV3SVUxWW1Gck5udFZISDM4TlBJTFVWcWZG?=
 =?utf-8?B?eDBuem1LQVExeWhmT1R6MWFMMHJTOW5TdlZYTHdjZlAyUm16UFduN1o1elZL?=
 =?utf-8?B?aGUyVHpaM1orQWxDbkhlTmM2VlFaaGs4eW52empQcXl2UXcrSysyd3AycVB0?=
 =?utf-8?B?OHNYWjNCUDVjV08rKzVva3pvckEvdUd6cm9jWTV2N0o4czgzWm1CWThaQllz?=
 =?utf-8?B?SVFWN1lQclV6c3Z4a0U1S1NoZ0x2ckhBa1BHdmg0NVMyZDliSWhnUGZ4c2Jv?=
 =?utf-8?B?V1hIY0Z4R0tGc3JxSnN2eVU0eWFveW1IUXF6YXJnWEE4dXFnd1E3Tk1hd3dS?=
 =?utf-8?B?K0p0VFJqUmFjSjdNVW5mK3JZcWNuSFg1SThMM0dHSGs0QnBtYWZXSFpPaFZw?=
 =?utf-8?B?bzZJRVV6U3NqMTFQbmZQSUw4YjlGTDYrQ0RMR0pUM3ZJVytOek44R0ZJb2ds?=
 =?utf-8?B?cTV5cHFKczF1WlpKaUgxYUxha1BQOXdrLzZHQUdRWCtwdkI3c0kwQVI0Nnpv?=
 =?utf-8?B?TUxCVmFBcW8ra1gxVjMrOTRpWnpPem1uVHNZK1B4Z092d0cyaFZ4WTFXWEJC?=
 =?utf-8?B?QndReHJmd21EakkveEYvVERvc1cwS3lMVm5zWU5rdnNqV3lEQlovKzJxR3I4?=
 =?utf-8?B?MEd1cXcwV2ltLytLL1NnWDRyM0hnTkJGaVdlTWVnck1YQjNtMElZSEt2bGZt?=
 =?utf-8?B?dHJjUnFOd3hBSVNNQ2lwTHp1aTFlcDNXOGNHWVc2UTNxRHRKR1JyQWVseFBp?=
 =?utf-8?B?SnZlNVY4c1o2dWZZZnE5WDljOTIveThSem9sWjJuRmxBL0pCVHljakU3ZkZJ?=
 =?utf-8?B?cEp3OU1tRUlUbXRBYUFaN21xc0YzUEVmS01FR1ZvRnpibVJ0cmN1aklNWUxz?=
 =?utf-8?B?YU0yS21FbVFMZ0xwcGdtaXo2UExLdTMzK2h2eWxLdmcwNjVpM0I1NlhhYzlx?=
 =?utf-8?B?NWQvTDB4aXVNZ1hDcDM2cm4ycWJPVDJoM2lGRWtrUXp3MFlNZEoyWGJ2V0JM?=
 =?utf-8?B?SlA5SkxTU1FOQU8zekdqUE1BTE9pWmhTVU1lSnlOMVNJaUpOdFgxVkZLN1RR?=
 =?utf-8?B?SUxBdWRRR2M4ajczdGZ4Q0NwK0tnQ0Q3SlB5alpHcUx1SkI4eFhacG1PZ0VO?=
 =?utf-8?B?S0ZFeVdVLzBzRnhDUXJCVzhTRU40bncwR0V5NjVSS2Q2YlM0dkRET2dNc3lV?=
 =?utf-8?B?VkhNVUxPMW5CVHdGV1pYdXorUjY2dFFWeXlTQUJISHpCVWw4THh5bFMvZ1Na?=
 =?utf-8?B?ZzJHVTNIUVo3TTU0RERMdUhNeDNUVEdFUzFjY0VUTjVCTUZ3M2VtQUNISGhr?=
 =?utf-8?B?Z2dxQXpjQy9raU0wZ2RmSThFOUZGZ2ZDcTg1ZVpibmhEWndudnYxRmhKU0Vo?=
 =?utf-8?B?aE92ejYwbHZJRTZJQ0lDeGM3eTNBNmVmeG1RMUxYSndSalhlNVR0eGFLMk56?=
 =?utf-8?B?VnJwNUYwK2w3cFRxQi9CdlB2cTRuQmJDODlsWmFRT1JsbFZxOXhjc25PV1Zz?=
 =?utf-8?B?b2VFNFlWN1BQbkFCNmdac1hITUJyQUI5cm9PWFdRd2c1dHMrRTJibDhPTzJO?=
 =?utf-8?B?cjQrZFlwSGxEeUFVSTZTTGpjL3JRSXFOU0hEdHdIOWFUbHErQ1B5ZG5QK1pB?=
 =?utf-8?B?bE5HNys3M1p2YXhiY0k4NXRTdHVoWXluZ0NNNVBXOTBKeUxlcmx3elE4SDk3?=
 =?utf-8?B?S1lkL3RZeUJGK09Rak9BYk1oOXBJZFp0V0RTNzhFbWNLTjhoSWJxd2Z1U1By?=
 =?utf-8?Q?Hn+P1QyovjWO3eNEJbapVLYPsNXpjWFO?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB7198.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RW5rL0ptMXkxQnNjZ1VSOFdmQllmQ0hWMUdlbUgvQ084QzRZV2MzTXlNSjZD?=
 =?utf-8?B?ZUdZVmo0eUE2V29uelZUQ0pNZThSZ09qQXJENHpsWHROSHg0S1JGZU9lR3Ew?=
 =?utf-8?B?Y1RCaTlHd3J0bGNmQkdBNDBsb1g3Mkd5MXBoZlNuN3JHWUt3R3JkUmV6Y1M3?=
 =?utf-8?B?OVF3djRMRW84YWdZQ3E0R3g2Qjh0SVFCeThxbmQrTWtEQlpOLy9qT2ZKMkNO?=
 =?utf-8?B?WXhDbTJuWnpPdXdKUklNOGZXQ3I1d205azVpbG94UmV2d0VJZ3BQaFRUS1li?=
 =?utf-8?B?K0Y3dThNK0JCMUxsV080QUtzM0xXd3RnNm5IL2ozRHRubVBTYmtpL2ZlWnZk?=
 =?utf-8?B?YWVVSXB5VGJQVzhaUkxpaXViTHNNQ25uakwrcGNjTk1tM1VIenpUZDJxbTFr?=
 =?utf-8?B?UXlxY0hYS1BMT045UXVYNG1TTmM0SjU5TkM4eTNXUDNNV2doNUV0SDR4NlFW?=
 =?utf-8?B?KzJDa3ozSFkrSk5nZXpnbmhXTzZXcXJlcjRHaTE1dzNxSFlIQVVRK2tEUk5y?=
 =?utf-8?B?LzVKcEVGQVZYTkg4K0E3QTh1Y3VaR243N3ozdDdmazZuVmsyc3MwVDJLOEw5?=
 =?utf-8?B?b0JGSUE4THpObGp1S0Yza3R2MTNDcnd3MTU3b2U2c002UXNUNVBIZm1aVmo3?=
 =?utf-8?B?Vy9aQy9oZ1VjaURCd1hZbGJiYlRqNitGUGxKMDIxd1paMHdXbFcvdU9QTEo3?=
 =?utf-8?B?MGtJd1M4cmYrWDZoQ0ErVndRaldWSjIzWm5yNzVNekd0dTFqdnorNkw1MUJp?=
 =?utf-8?B?am1qS1RjbFRubUZjTHFXYzlmUjBSUXpaaTZkc0Z1ZjYrYmpmdWZlcjBOdWs4?=
 =?utf-8?B?Tk16TzYxcE9xbHRGamlKQVlJZHlsekg1MC93bUh6aHdJWEpVUkhrVnBHK0F0?=
 =?utf-8?B?MHoweWJtT1dhTEZNSmEra1dQcXhlaUtYUW1vOGFiWXVIOTNUZkQzcXpTNnRp?=
 =?utf-8?B?Z0dqK3E2Y0FaYUIzTHhNVlJYY045aTNDMW4wZDN1Q3lqYjlOUys1QTdZczA4?=
 =?utf-8?B?NzFVTXB4ajFlVWMvTDk4NDdOMWxtQmJ5bDZwS3VkMWc3TldtMTJ3Szd2ZTR5?=
 =?utf-8?B?VUpkMm55bFVBWmlaRVJWeFB3Y0cxT1dVQVJ5a2tzT1R2TUt6b1E5RlJUSHNz?=
 =?utf-8?B?emxOU0VDTmZ5a3hQVFJpbTNVZjd0QkRaSWswRHUwVG1Ga1dNQ0xIRnBoc0dW?=
 =?utf-8?B?bUZqM3BkaWp3c2JERVdLMCtUUHp6VzFNUzFUTnMreTQ5dTRiVXNJUnp1WDhR?=
 =?utf-8?B?ZTFYVFp2eEE3WGgyL0lDcWFNejZ6OWc1K1VMOWxuMm1DajZPWDlTQkhqMWI0?=
 =?utf-8?B?RGYweDdtaEk3MzBuUkZoTG52YytXY1ZvRE1YTGFBS3c1TzFad1o4V3BYemlx?=
 =?utf-8?B?cUU1dmNwNi93Ym8zZHgwYWY5TWNFMjlMQkVQNWV5NzRmeFFNOXYvUTRSem0y?=
 =?utf-8?B?V2tpUVhNTnlVcm5DQkhUUGNnWUd4Y1gxVFJ3eVRTeXNYN3BKby9mZUx5WjZV?=
 =?utf-8?B?K3p5L2sydUNaOFRONnMwRmhMYU0rVG5uT01PZFBwQURYaUN2by9oREFad1Vt?=
 =?utf-8?B?eWowK3ZGUGVLVFEvL0dnV1dVcWZSTHB2d01yZWdBN1hzL0pRRi9BbXRSZXBz?=
 =?utf-8?B?U0VDbzNlaFBRMGY4VzdvajcvazhRc2RYYWp3aHVPSXNNNy9QK3F4VlFmc3FZ?=
 =?utf-8?B?V2NEeEVTcE9ZMEZJNHJvZDRxOS9VT3JRR0Jab0VYWmZwVU9vVlZ1bEdhWkps?=
 =?utf-8?B?RVhROVF0bCtHdzlHUlNYRmZ4MmYrTzdZcDRtaXB6U0pCRWlnakVFRnBTZTlI?=
 =?utf-8?B?K3kwOHB1RndJZXhxb2dQQnJyaGJ2TDNDT2FwdmRBZzFZeWVabTFxOEhIYnQy?=
 =?utf-8?B?Y0RVYzNMZlQ3Q0Z6bTdPbzVVS1dLbXZvRDZwS2xWSE56RDlrODlxdWJTM0Rn?=
 =?utf-8?B?VjhLeDZRV1RKYXh4MHdRendFMmhxVTNqWnFHNXpzejNGa2txUlV5VkZoQWVV?=
 =?utf-8?B?S1lzY3JTR0I5NkMvRVNSZ0lwa2dnQzJtQjUzM0NGdGV1cUl1Y3VwZjBQVnpy?=
 =?utf-8?B?SnRyVlZQeFh6K2c5WkxjS1pYK2k0QkF1MTRBYWh1a00vTitsMEsyM29YVEph?=
 =?utf-8?B?RVhUTENPcXJqTEkxSWxjMG1rUGpBZ0lPY1h5RXlidmN2cDJDblVzRnloZHBq?=
 =?utf-8?B?Mmc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e30c7efe-4d8b-40f7-2fc5-08de25b71d48
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7198.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2025 08:55:53.7266
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0x0uONGbTa6O7dX0RwZ4kMBZxg81/jFsJ5qgCiHLP6MTocWswpFb4Hi7fyjXtAv180N/ceU4nDu34Ng7jjCreg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF1721FD39C
X-OriginatorOrg: intel.com

On 14/11/2025 10:28, Sarthak Garg wrote:
> According to the hardware programming guide, the clock frequency must
> remain below 52MHz during the transition to HS400 mode.
> 
> However,in the current implementation, the timing is set to HS400 (a
> DDR mode) before adjusting the clock. This causes the clock to double
> prematurely to 104MHz during the transition phase, violating the
> specification and potentially resulting in CRC errors or CMD timeouts.
> 
> This change ensures that clock doubling is avoided during intermediate
> transitions and is applied only when the card requires a 200MHz clock
> for HS400 operation.
> 
> Signed-off-by: Sarthak Garg <sarthak.garg@oss.qualcomm.com>

Acked-by: Adrian Hunter <adrian.hunter@intel.com>

> ---
>  Changes from v1:
>  As per Bjorn Andersson's comment :
>  - Pass "timing" as an argument to msm_set_clock_rate_for_bus_mode(), and
>  then pass host, clock, and timing to msm_get_clock_mult_for_bus_mode() to
>  align with the original intent of the prototype.
> ---
>  drivers/mmc/host/sdhci-msm.c | 27 +++++++++++++++------------
>  1 file changed, 15 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
> index 4e5edbf2fc9b..3b85233131b3 100644
> --- a/drivers/mmc/host/sdhci-msm.c
> +++ b/drivers/mmc/host/sdhci-msm.c
> @@ -344,41 +344,43 @@ static void sdhci_msm_v5_variant_writel_relaxed(u32 val,
>  	writel_relaxed(val, host->ioaddr + offset);
>  }
>  
> -static unsigned int msm_get_clock_mult_for_bus_mode(struct sdhci_host *host)
> +static unsigned int msm_get_clock_mult_for_bus_mode(struct sdhci_host *host,
> +						    unsigned int clock,
> +						    unsigned int timing)
>  {
> -	struct mmc_ios ios = host->mmc->ios;
>  	/*
>  	 * The SDHC requires internal clock frequency to be double the
>  	 * actual clock that will be set for DDR mode. The controller
>  	 * uses the faster clock(100/400MHz) for some of its parts and
>  	 * send the actual required clock (50/200MHz) to the card.
>  	 */
> -	if (ios.timing == MMC_TIMING_UHS_DDR50 ||
> -	    ios.timing == MMC_TIMING_MMC_DDR52 ||
> -	    ios.timing == MMC_TIMING_MMC_HS400 ||
> +	if (timing == MMC_TIMING_UHS_DDR50 ||
> +	    timing == MMC_TIMING_MMC_DDR52 ||
> +	    (timing == MMC_TIMING_MMC_HS400 &&
> +	    clock == MMC_HS200_MAX_DTR) ||
>  	    host->flags & SDHCI_HS400_TUNING)
>  		return 2;
>  	return 1;
>  }
>  
>  static void msm_set_clock_rate_for_bus_mode(struct sdhci_host *host,
> -					    unsigned int clock)
> +					    unsigned int clock,
> +					    unsigned int timing)
>  {
>  	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
>  	struct sdhci_msm_host *msm_host = sdhci_pltfm_priv(pltfm_host);
> -	struct mmc_ios curr_ios = host->mmc->ios;
>  	struct clk *core_clk = msm_host->bulk_clks[0].clk;
>  	unsigned long achieved_rate;
>  	unsigned int desired_rate;
>  	unsigned int mult;
>  	int rc;
>  
> -	mult = msm_get_clock_mult_for_bus_mode(host);
> +	mult = msm_get_clock_mult_for_bus_mode(host, clock, timing);
>  	desired_rate = clock * mult;
>  	rc = dev_pm_opp_set_rate(mmc_dev(host->mmc), desired_rate);
>  	if (rc) {
>  		pr_err("%s: Failed to set clock at rate %u at timing %d\n",
> -		       mmc_hostname(host->mmc), desired_rate, curr_ios.timing);
> +		       mmc_hostname(host->mmc), desired_rate, timing);
>  		return;
>  	}
>  
> @@ -397,7 +399,7 @@ static void msm_set_clock_rate_for_bus_mode(struct sdhci_host *host,
>  	msm_host->clk_rate = desired_rate;
>  
>  	pr_debug("%s: Setting clock at rate %lu at timing %d\n",
> -		 mmc_hostname(host->mmc), achieved_rate, curr_ios.timing);
> +		 mmc_hostname(host->mmc), achieved_rate, timing);
>  }
>  
>  /* Platform specific tuning */
> @@ -1239,7 +1241,7 @@ static int sdhci_msm_execute_tuning(struct mmc_host *mmc, u32 opcode)
>  	 */
>  	if (host->flags & SDHCI_HS400_TUNING) {
>  		sdhci_msm_hc_select_mode(host);
> -		msm_set_clock_rate_for_bus_mode(host, ios.clock);
> +		msm_set_clock_rate_for_bus_mode(host, ios.clock, ios.timing);
>  		host->flags &= ~SDHCI_HS400_TUNING;
>  	}
>  
> @@ -1864,6 +1866,7 @@ static void sdhci_msm_set_clock(struct sdhci_host *host, unsigned int clock)
>  {
>  	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
>  	struct sdhci_msm_host *msm_host = sdhci_pltfm_priv(pltfm_host);
> +	struct mmc_ios ios = host->mmc->ios;
>  
>  	if (!clock) {
>  		host->mmc->actual_clock = msm_host->clk_rate = 0;
> @@ -1872,7 +1875,7 @@ static void sdhci_msm_set_clock(struct sdhci_host *host, unsigned int clock)
>  
>  	sdhci_msm_hc_select_mode(host);
>  
> -	msm_set_clock_rate_for_bus_mode(host, clock);
> +	msm_set_clock_rate_for_bus_mode(host, ios.clock, ios.timing);
>  out:
>  	__sdhci_msm_set_clock(host, clock);
>  }


