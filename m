Return-Path: <linux-arm-msm+bounces-116367-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id raTAFa/bR2qjgQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116367-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 17:56:31 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 14EF670412A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 17:56:31 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=g8oMYNUZ;
	dmarc=pass (policy=none) header.from=intel.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116367-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116367-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 93C3E3023302
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jul 2026 15:55:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2AD62D3739;
	Fri,  3 Jul 2026 15:55:24 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DD942DCBFA;
	Fri,  3 Jul 2026 15:55:16 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783094124; cv=fail; b=STHdxr16DHgC82f6q1LK8fWmeUBYsMjd9Qv1OshgL+Pngxe3JajQVnIr5joxwEhq3DicHdDC3MhRcp9PYpm97g1Ob1xLfNrc5I3blxpB6tPFgzDgmG1v1nE3cLVQKnAj0ZQ7JiqSKBu4QVn+PG/bMLGbMoH87ok2aZJsZ2uUEIU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783094124; c=relaxed/simple;
	bh=cq1Ia3qvLUfw4q5EMv6IoenPZeED0efv9NXSJ21ATOU=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ADwEbzUtShgZnuOWUQNcluuvf01FtWBnYbj1l+V/ENxaUTOUYtKnW5NTtBp6GQTVCCNNwKrHWRThjcRaXQ9Dr/7oj5bkNeoITPs/ukuMcm7jKfDc3NTynaZV+v/L7QoxRPMp1hFwhDV01icwkedK/AARb5ftLUP8hSW8HXO5J9Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=g8oMYNUZ; arc=fail smtp.client-ip=198.175.65.10
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783094118; x=1814630118;
  h=message-id:date:subject:to:references:from:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=cq1Ia3qvLUfw4q5EMv6IoenPZeED0efv9NXSJ21ATOU=;
  b=g8oMYNUZlNMVGK1htVGOHret0yVRitqiq8US/l4+a1urqWiFQ99wItgp
   wwNWMRzsUEMGgZ6Cf+iNzlx7rPH0MKaV2iQqaNHNzYESjCIa9Mv4V3Y/6
   ml1MvuG3LcraLJRE/niob8V7wtZVKH1Os/79MOE27365mR0ApWRfSVeRa
   GwnYvwLDag+kJ21ajza6ayE+QJWiQEZeE1fSrgmtyPrKnH3RrcWLKPtnm
   5GMCcI+68dyhgE4ENCzh/+iquK0JfGIi3D7wYHcPrgrbPg0B/eCGg165Z
   5joiVRhJJLb6aXb4ovqrk4jTcO3W7xzoxDsZZZlu4OjPPLdJ3l+K/uSWe
   g==;
X-CSE-ConnectionGUID: JPvJ4D6AQsGwu1Z+fo6knA==
X-CSE-MsgGUID: ZPBMb9j6RwSgr2i1a0oxTA==
X-IronPort-AV: E=McAfee;i="6800,10657,11836"; a="101268076"
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="101268076"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2026 08:55:15 -0700
X-CSE-ConnectionGUID: oLdu9fgCSuiMMnx55b6/og==
X-CSE-MsgGUID: J19XKXXLShuzLXT3hrug2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="277469485"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2026 08:55:14 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 3 Jul 2026 08:55:14 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Fri, 3 Jul 2026 08:55:14 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.14) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 3 Jul 2026 08:55:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uBc8sJCnML5IDmpY1FhfxSPFexWzwNDaTeb56G+5GKSnpPEeEWCpUkvoyIvdYogq9+vbLLoYQgPIO1gDUZqN2w9R0wBjxSNAXmcdq32zm3AnvKBuz/YHTSLFEQ2OcHx+Nv/3NwO7iIm/xjW94zlNCBs+ajgyn4KqyQbpUPVVj4kPZ+GVyKipEOIU3jq5QiyivKo1919dWko1Ld3wuHNNPd10B+CFNnbfl0cmKmVW5cGA+wD4RqukXYlsszwyrjB11+eXm6MQIbyBVXa/uENGTLNJoqX3U6iTtq6BGQSONtncbHmnZJK2HgQfOmNNW5useH+I5+q7ZPwLhGBAzCbE+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dLnC1fvqtYHhE4OJmX4zSZE49yWBpb7jamm1qhs+wLw=;
 b=KuEoF8iIayzYVEjdbwywx8QWQTTQpY6tijVD8Swx/X4cuqny2uX6MGVFx7db8pg8M5s1fDYGMz5aKNq8o+oS2spIOMZq0BZ3gnj0DV0Eiv5FpcylTci0qzS0ApW9opnRGgnmqyK7ltUrdRVzo24kFlpVYtWLL1LEW9ssGEjgyZ5zuPabqO88zB9lwYSA/nLDvndkPJ4F0MpZurKCPfllVdMytO/lEKsBmw5ucemlk0HbN8YeIExHdB1Nnd4VlXjPR166pKV8R/oAWXaaP7hIMy5PnaAqkvNKV5dN0WrWwqphBpdvOqL1eIFKecUbquFuNRSyF8YMtaVnoZVj/Z5/Qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB7198.namprd11.prod.outlook.com (2603:10b6:208:419::15)
 by PH8PR11MB6681.namprd11.prod.outlook.com (2603:10b6:510:1c4::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.9; Fri, 3 Jul 2026
 15:55:10 +0000
Received: from IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::2c4e:e92a:4fa:a456]) by IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::2c4e:e92a:4fa:a456%3]) with mapi id 15.21.0181.010; Fri, 3 Jul 2026
 15:55:09 +0000
Message-ID: <06f3ba88-f7d3-426d-8c95-612140fdfd52@intel.com>
Date: Fri, 3 Jul 2026 18:55:02 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mmc: cqhci: Remove unused intmask parameter from
 cqhci_irq()
To: Chanwoo Lee <cw9316.lee@samsung.com>, Asutosh Das
	<quic_asutoshd@quicinc.com>, Ritesh Harjani <ritesh.list@gmail.com>, "Ulf
 Hansson" <ulfh@kernel.org>, Chaotian Jing <chaotian.jing@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Kamal Dasu
	<kamal.dasu@broadcom.com>, Al Cooper <alcooperx@gmail.com>, "Broadcom
 internal kernel review list" <bcm-kernel-feedback-list@broadcom.com>, Florian
 Fainelli <florian.fainelli@broadcom.com>, Haibo Chen <haibo.chen@nxp.com>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	"Pengutronix Kernel Team" <kernel@pengutronix.de>, Fabio Estevam
	<festevam@gmail.com>, "Michal Simek" <michal.simek@amd.com>, Thierry Reding
	<thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, "open
 list:EMMC CMDQ HOST CONTROLLER INTERFACE (CQHCI) DRIVER"
	<linux-mmc@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>,
	"moderated list:ARM/Mediatek SoC support"
	<linux-arm-kernel@lists.infradead.org>, "moderated list:ARM/Mediatek SoC
 support" <linux-mediatek@lists.infradead.org>, "open list:ARM/QUALCOMM
 MAILING LIST" <linux-arm-msm@vger.kernel.org>, "open list:TEGRA ARCHITECTURE
 SUPPORT" <linux-tegra@vger.kernel.org>
References: <CGME20260624021955epcas1p2ba2fa4eb8bd0aafaf7b46bde2cf524be@epcas1p2.samsung.com>
 <20260624021912.632627-1-cw9316.lee@samsung.com>
Content-Language: en-US
From: Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park,
 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 -
 4, Domiciled in Helsinki
In-Reply-To: <20260624021912.632627-1-cw9316.lee@samsung.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DU2P250CA0007.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:10:231::12) To IA1PR11MB7198.namprd11.prod.outlook.com
 (2603:10b6:208:419::15)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7198:EE_|PH8PR11MB6681:EE_
X-MS-Office365-Filtering-Correlation-Id: bc67c492-b91c-4b6f-fdab-08ded91b75c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|23010399003|1800799024|4143699003|11063799006|56012099006|921020|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: e1+PL2i5Jctr83ODWUfxrlLhq7OVnktl0fhBrP/ZxY+7qY0GHO7ZbhUsjcw1jQkNSfeMvNU1la5Ti3T3cK07jRru5O2s3z6beO7rwO9azif1TsiqDXKoeQS/heh2H2bAWcyAzJSxpr4o5jmP9zHfKDJoOEPDA1wGCx6wr4WGgKtbMm93y5fhobzdPzmqQ8me2Rl9I8v4aSqiQxBAUVzDr7NY++z8WzAt8drcsIwMnX1AJDYQhrX9UxJGZK2URUF3jeDb9dcgtTKeImDre4GWP3eb7j/vZoSqMtVISN95iMjMVapGFmiKeiWKRTdf2AgHxtS98gq0PfEKY9CrPf/+kCxmwaG1GwQqzbp3aeRNye70a/yVqd70IofZO5s+CNkt4DYSmmTH/b/niyQLXy7fe2rmin5AA42lDdh9YM9eGC+lM4VUGY37RL1yQQ4t6WxOdMNujhqEEz80fJQUhRaNubftpPCo7W2f9eUvoWeO3xU367dC4kJVM9DfcdN2w22fk91QHpSdU+rkyyAGugWx9kZe7jbv9LqaP/xcq8LHs35gFjf48byx2DazDxuKUd90rTvxv81PG0zJkgD+ovjAXU74df/HMr6a0KkkFP7OSfyhrYXzyAF+ejIAkINDYzIWxPalN4h65ZUktPoKK6ShsxVb3RP/jpRXDgBx5oU0RVT3dk14+858e6262x5WwaheGeUI3ZIdQ+dCG6K8jZUeeg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB7198.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(23010399003)(1800799024)(4143699003)(11063799006)(56012099006)(921020)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K1dNOFdZSGt2cWRTcno2M0VjdFN2OXp5ZWpER0VEM01vTW5teXpsYXV3R0Mr?=
 =?utf-8?B?OER4SHJYeG9Jc3dxZEgrMXhNTjVNM3ZsaUpZaWp1L1AvSjBrUzRDYTlpbXZu?=
 =?utf-8?B?dUNWMC9ZREk3QmJ3czFHUzdEVDEyUldDclZKODUwcG1UMzhNcEpQa1Azc2dM?=
 =?utf-8?B?SUZNRGt3RHhDbk13Vk5BdnM3c0tpWEUxekV2QU9OdUcrbGFIQnVPZkhaS000?=
 =?utf-8?B?Tnkvd2xPYXNwZW0xbGhCYkxHOHFKNE9hL0JUTkYwclBQRWg4cWFobkZ5OXlT?=
 =?utf-8?B?ZGdib1RZS29KZ3NITzdKQnhuRHhBOWJZVzRqWGpkdmU4VWRSRmhOVEZPeUhl?=
 =?utf-8?B?Qjc5bVpUMk1jTUhZNmdkR3ppTVZsZ0hsb3FXc004WmQvZ3dqbksxUmNSQi9u?=
 =?utf-8?B?bUxyajloOE1nUmN4eUZjS3JrNEZTUzJQMHZYWFMyT1lmSHIyNEFDWnhYdXdX?=
 =?utf-8?B?Z2tqSUpDOGYwcDFScUZJSjNrUldTYktUR3hFdEdaeGFlT3BwYm5lL2FXZWZh?=
 =?utf-8?B?Mmd5aG5oV3pWMHM0dFV6d3pZajZiZzhNVEZjcFp4c0xKUUVkRkxaRWIxNnAr?=
 =?utf-8?B?UlE5dUVDc0VCSWFxVXMvYWY2czFlY2VZdTdWM1RpVHJqdC9sSSsvOFJ1UjYr?=
 =?utf-8?B?bmp0NVJ6NTFaSXVjQ09rN3JOU1MxMC9VYUs4bWNSY05oMUtUaHlhT2M0ZEIy?=
 =?utf-8?B?UHo5WXNlZCtxdWV4UmJPRi9KdXVVOXBSNVlKenhmczY0RkozSTFSVElSNWZ2?=
 =?utf-8?B?UW52UHhOSWRhS2Q4L21XYnMzZVZldlZOa0RpNnNDYm5wTXdHOGd5VDFSN1Fj?=
 =?utf-8?B?M0N2V2VtTkhiZE0wRDliZzRNdTBlSGlxdVNnandFd3B1OVFicGdZak5NSk95?=
 =?utf-8?B?UmVib1VWa1R0cit5ZG5QZ0dtRGMrUC9RNFFhckhNaUNxWEJJWm0vOVhQb3JX?=
 =?utf-8?B?NDIzQnI1R0RZR2VTUEI5dFd1RTNjcjlaNGR0ZmVqSGZVWjZIL1Vva3RONG91?=
 =?utf-8?B?ZDI2Y213SytsbkdhZGpzeTQ1NG1hWkFHVmczMHd5dEordkoyZWFsVC9JSWFw?=
 =?utf-8?B?d2FFbmlacU4zaCtXRWZsRWJJMHNJVDF6OGtXNkpZMllXWE1GeCtZY2RJYm43?=
 =?utf-8?B?TFl5ZFhmdzhJcmlpcjEyQXhQbSs3Wkg4bStoRzhQc1FOTUxqTHBJbVFQZHRq?=
 =?utf-8?B?bHNwbkpKOXYwbFBseXh1V2k2OEYwQ3Q1UkNnRHZUTzZyRWluUGZtOUhPaTI5?=
 =?utf-8?B?S3J5OVk0aEpxSzZwMzJ0Qm1yVmw5Zk00eXozS29NNExkUGhWWlVVU2N2RXU0?=
 =?utf-8?B?K05oblYxSjZIK2lBaTR2dE9mK3YyUUlEZk9VYjBHN09paDZIOWJkd0pPb3pF?=
 =?utf-8?B?NWI3M0FMUzlHbjZBOHFQRXFFazRCUFFqQ1kxbEhMSWtjNkxaV3Y5cXNLK2lP?=
 =?utf-8?B?SEtiQUNSWWt1elFiQU5nM1d3VWdhZWZXRnZjcTdtcUpKRUF0UDlkbTAySTZw?=
 =?utf-8?B?T1ZJNW9TMlFlMlI3bkFhM3VGWnVMOXh5Ti81Y0x0MlFmaklwbmRIZUwyOVFa?=
 =?utf-8?B?Z2hlRkU5Nm9yazRvWmUraVBwM2hEMUt3Vzg5S3htejJCb1pYRi84V203V28z?=
 =?utf-8?B?THFtdmRhY3EzbWdhRkp2SEZWOFdSQW9JR2FBQVNSeXU3TkhwRHMvTFIzM2VP?=
 =?utf-8?B?OXRGa2dIRTJ6WE1jQisvZjFwQ0s3OWhvZ1VSM2tmTHFrVXpnOHR6Vkx4SVpD?=
 =?utf-8?B?aVJBSVF1dzJpTkx4VkdOZlNGTDBXTFU0ZTBUWmcveUhVMHR5SjN5WGFkeDVO?=
 =?utf-8?B?RUNUdlNYenNEQ0pjZzIxWVRjK0x0NEN0TTZPQ3VZcUErK2NaTW5kbXM4VkpC?=
 =?utf-8?B?N212UENpaDZsNVJMSnFDZXNFeXhDQnNuWjcvMXBmQkxNb0FobE5BeWhMem85?=
 =?utf-8?B?UUFoMHRyTEVUeXAzK1RBRjJ0aHBNVFZ1eUZnME51T016WVhraVFxMjgrYzV5?=
 =?utf-8?B?djdSNlVYNXdUMjdjQ1Y2cWR1QUhtK0FlalExOXJYY2VXMnpFNDY2QVNKVjFG?=
 =?utf-8?B?ajVSSDlLbFg4N0VxMU91NkJ3aWtyL3lIS3lpMmNuakgwYk14TkhvTUlEU3N0?=
 =?utf-8?B?Y0dOVFFqaVhweWlQU0EyYUdVM1RYQnVSUEIwK3dEUHc0c1QvVTkyVHJJb1Fr?=
 =?utf-8?B?alVrWkNwaTArcmdoUzhXOGk5RkhMU2pKNGh3U1BEazlZZlNrTUZwUlZNMmE5?=
 =?utf-8?B?YWowa2h0UlNJM2FBbC95d3grUEZmb0Y4Z2RaZ0g1R1FLV3VWL3owQTBmSlV3?=
 =?utf-8?B?WVhNZkdMcUZHVnNZYlgwL0xjUkhSOHhKLzdmV2pTYlg4MzFocnlPaFRxMWNX?=
 =?utf-8?Q?z9sYXangddC7gYlk=3D?=
X-Exchange-RoutingPolicyChecked: p2NJIiNu2PI6pHVUeIdvoL1wyD2jjMU/HczxvLzEo6CFFfS03Xxjf44wXt5NlbApP+6hDmIjfiGJuGKdRATqQ8APTxde5ThjsrPRZEjPehLMuvsrGcqbOg1robj28Mi1iE+hmHgrh79lT49gLipkRSsWEqKGfvH8ldH7WAEtAZQynLNtAT0VCsUpTQpgkyhLUzxl1VXkZGyiEpp0yxll+M0IKNkzl1jWz344BTfJLw6++A5t17YIN7mVqBeCNKu9qFQCi0T181QVUqUvSNhRi8/nlZNVxH1mOL9Zq/YAfzTJ2pqF5M4zEF3gpHwfCl2Tx9Qw3v3iv2zCQ3K8FtdyXw==
X-MS-Exchange-CrossTenant-Network-Message-Id: bc67c492-b91c-4b6f-fdab-08ded91b75c7
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7198.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2026 15:55:09.8719
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9awrwnDcrx4203xZWzpIsmE5Bh+GpeYGplyaPa6lWtDCzNkrbHFMQPLnqogbqKVYmiB+rEErgyZ5tr8nj+jRkg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6681
X-OriginatorOrg: intel.com
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[intel.com:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-116367-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_ALL(0.00)[];
	FREEMAIL_TO(0.00)[samsung.com,quicinc.com,gmail.com,kernel.org,mediatek.com,collabora.com,broadcom.com,nxp.com,pengutronix.de,amd.com,nvidia.com,vger.kernel.org,lists.infradead.org];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:cw9316.lee@samsung.com,m:quic_asutoshd@quicinc.com,m:ritesh.list@gmail.com,m:ulfh@kernel.org,m:chaotian.jing@mediatek.com,m:matthias.bgg@gmail.com,m:angelogioacchino.delregno@collabora.com,m:kamal.dasu@broadcom.com,m:alcooperx@gmail.com,m:bcm-kernel-feedback-list@broadcom.com,m:florian.fainelli@broadcom.com,m:haibo.chen@nxp.com,m:Frank.Li@nxp.com,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:michal.simek@amd.com,m:thierry.reding@kernel.org,m:jonathanh@nvidia.com,m:linux-mmc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-mediatek@lists.infradead.org,m:linux-arm-msm@vger.kernel.org,m:linux-tegra@vger.kernel.org,m:riteshlist@gmail.com,m:matthiasbgg@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[adrian.hunter@intel.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[25];
	FORWARDED(0.00)[lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,intel.com:from_mime,intel.com:email,intel.com:mid,intel.com:dkim];
	DKIM_TRACE(0.00)[intel.com:+];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[adrian.hunter@intel.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 14EF670412A

On 24/06/2026 05:19, Chanwoo Lee wrote:
> The intmask parameter of cqhci_irq() is never used within the function
> body. The function reads the CQHCI interrupt status directly via
> cqhci_readl() and processes interrupts independently of the SDHCI
> intmask value passed by callers.
> 
> Signed-off-by: Chanwoo Lee <cw9316.lee@samsung.com>

Acked-by: Adrian Hunter <adrian.hunter@intel.com>

> ---
>  drivers/mmc/host/cqhci-core.c       | 3 +--
>  drivers/mmc/host/cqhci.h            | 3 +--
>  drivers/mmc/host/mtk-sd.c           | 2 +-
>  drivers/mmc/host/sdhci-brcmstb.c    | 2 +-
>  drivers/mmc/host/sdhci-esdhc-imx.c  | 2 +-
>  drivers/mmc/host/sdhci-msm.c        | 2 +-
>  drivers/mmc/host/sdhci-of-arasan.c  | 2 +-
>  drivers/mmc/host/sdhci-of-dwcmshc.c | 2 +-
>  drivers/mmc/host/sdhci-pci-core.c   | 2 +-
>  drivers/mmc/host/sdhci-pci-gli.c    | 2 +-
>  drivers/mmc/host/sdhci-tegra.c      | 2 +-
>  drivers/mmc/host/sdhci_am654.c      | 2 +-
>  12 files changed, 12 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/mmc/host/cqhci-core.c b/drivers/mmc/host/cqhci-core.c
> index 178277d90c31..98ceb0b9a6d1 100644
> --- a/drivers/mmc/host/cqhci-core.c
> +++ b/drivers/mmc/host/cqhci-core.c
> @@ -819,8 +819,7 @@ static void cqhci_finish_mrq(struct mmc_host *mmc, unsigned int tag)
>  	mmc_cqe_request_done(mmc, mrq);
>  }
>  
> -irqreturn_t cqhci_irq(struct mmc_host *mmc, u32 intmask, int cmd_error,
> -		      int data_error)
> +irqreturn_t cqhci_irq(struct mmc_host *mmc, int cmd_error, int data_error)
>  {
>  	u32 status;
>  	unsigned long tag = 0, comp_status;
> diff --git a/drivers/mmc/host/cqhci.h b/drivers/mmc/host/cqhci.h
> index 3668856531c1..8fbbc48c3f85 100644
> --- a/drivers/mmc/host/cqhci.h
> +++ b/drivers/mmc/host/cqhci.h
> @@ -315,8 +315,7 @@ static inline u32 cqhci_readl(struct cqhci_host *host, int reg)
>  
>  struct platform_device;
>  
> -irqreturn_t cqhci_irq(struct mmc_host *mmc, u32 intmask, int cmd_error,
> -		      int data_error);
> +irqreturn_t cqhci_irq(struct mmc_host *mmc, int cmd_error, int data_error);
>  int cqhci_init(struct cqhci_host *cq_host, struct mmc_host *mmc, bool dma64);
>  struct cqhci_host *cqhci_pltfm_init(struct platform_device *pdev);
>  int cqhci_deactivate(struct mmc_host *mmc);
> diff --git a/drivers/mmc/host/mtk-sd.c b/drivers/mmc/host/mtk-sd.c
> index b2680cc054bd..01ea3adbdf3b 100644
> --- a/drivers/mmc/host/mtk-sd.c
> +++ b/drivers/mmc/host/mtk-sd.c
> @@ -1805,7 +1805,7 @@ static irqreturn_t msdc_cmdq_irq(struct msdc_host *host, u32 intsts)
>  			cmd_err, dat_err, intsts);
>  	}
>  
> -	return cqhci_irq(mmc, 0, cmd_err, dat_err);
> +	return cqhci_irq(mmc, cmd_err, dat_err);
>  }
>  
>  static irqreturn_t msdc_irq(int irq, void *dev_id)
> diff --git a/drivers/mmc/host/sdhci-brcmstb.c b/drivers/mmc/host/sdhci-brcmstb.c
> index 57e45951644e..1de2f05fd958 100644
> --- a/drivers/mmc/host/sdhci-brcmstb.c
> +++ b/drivers/mmc/host/sdhci-brcmstb.c
> @@ -430,7 +430,7 @@ static u32 sdhci_brcmstb_cqhci_irq(struct sdhci_host *host, u32 intmask)
>  	if (!sdhci_cqe_irq(host, intmask, &cmd_error, &data_error))
>  		return intmask;
>  
> -	cqhci_irq(host->mmc, intmask, cmd_error, data_error);
> +	cqhci_irq(host->mmc, cmd_error, data_error);
>  
>  	return 0;
>  }
> diff --git a/drivers/mmc/host/sdhci-esdhc-imx.c b/drivers/mmc/host/sdhci-esdhc-imx.c
> index 18ecddd6df6f..d0fa83f67a80 100644
> --- a/drivers/mmc/host/sdhci-esdhc-imx.c
> +++ b/drivers/mmc/host/sdhci-esdhc-imx.c
> @@ -1503,7 +1503,7 @@ static u32 esdhc_cqhci_irq(struct sdhci_host *host, u32 intmask)
>  	if (!sdhci_cqe_irq(host, intmask, &cmd_error, &data_error))
>  		return intmask;
>  
> -	cqhci_irq(host->mmc, intmask, cmd_error, data_error);
> +	cqhci_irq(host->mmc, cmd_error, data_error);
>  
>  	return 0;
>  }
> diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
> index 0882ce74e0c9..ceed47ccfda8 100644
> --- a/drivers/mmc/host/sdhci-msm.c
> +++ b/drivers/mmc/host/sdhci-msm.c
> @@ -2165,7 +2165,7 @@ static u32 sdhci_msm_cqe_irq(struct sdhci_host *host, u32 intmask)
>  	if (!sdhci_cqe_irq(host, intmask, &cmd_error, &data_error))
>  		return intmask;
>  
> -	cqhci_irq(host->mmc, intmask, cmd_error, data_error);
> +	cqhci_irq(host->mmc, cmd_error, data_error);
>  	return 0;
>  }
>  
> diff --git a/drivers/mmc/host/sdhci-of-arasan.c b/drivers/mmc/host/sdhci-of-arasan.c
> index 785d3acb18c5..4ca73e7d799e 100644
> --- a/drivers/mmc/host/sdhci-of-arasan.c
> +++ b/drivers/mmc/host/sdhci-of-arasan.c
> @@ -555,7 +555,7 @@ static u32 sdhci_arasan_cqhci_irq(struct sdhci_host *host, u32 intmask)
>  	if (!sdhci_cqe_irq(host, intmask, &cmd_error, &data_error))
>  		return intmask;
>  
> -	cqhci_irq(host->mmc, intmask, cmd_error, data_error);
> +	cqhci_irq(host->mmc, cmd_error, data_error);
>  
>  	return 0;
>  }
> diff --git a/drivers/mmc/host/sdhci-of-dwcmshc.c b/drivers/mmc/host/sdhci-of-dwcmshc.c
> index eef53455b8ee..4c5fa6a6931d 100644
> --- a/drivers/mmc/host/sdhci-of-dwcmshc.c
> +++ b/drivers/mmc/host/sdhci-of-dwcmshc.c
> @@ -624,7 +624,7 @@ static u32 dwcmshc_cqe_irq_handler(struct sdhci_host *host, u32 intmask)
>  	if (!sdhci_cqe_irq(host, intmask, &cmd_error, &data_error))
>  		return intmask;
>  
> -	cqhci_irq(host->mmc, intmask, cmd_error, data_error);
> +	cqhci_irq(host->mmc, cmd_error, data_error);
>  
>  	return 0;
>  }
> diff --git a/drivers/mmc/host/sdhci-pci-core.c b/drivers/mmc/host/sdhci-pci-core.c
> index c347fac24515..b121d896a804 100644
> --- a/drivers/mmc/host/sdhci-pci-core.c
> +++ b/drivers/mmc/host/sdhci-pci-core.c
> @@ -215,7 +215,7 @@ static u32 sdhci_cqhci_irq(struct sdhci_host *host, u32 intmask)
>  	if (!sdhci_cqe_irq(host, intmask, &cmd_error, &data_error))
>  		return intmask;
>  
> -	cqhci_irq(host->mmc, intmask, cmd_error, data_error);
> +	cqhci_irq(host->mmc, cmd_error, data_error);
>  
>  	return 0;
>  }
> diff --git a/drivers/mmc/host/sdhci-pci-gli.c b/drivers/mmc/host/sdhci-pci-gli.c
> index 6e4084407662..b55618566d65 100644
> --- a/drivers/mmc/host/sdhci-pci-gli.c
> +++ b/drivers/mmc/host/sdhci-pci-gli.c
> @@ -1760,7 +1760,7 @@ static u32 sdhci_gl9763e_cqhci_irq(struct sdhci_host *host, u32 intmask)
>  	if (!sdhci_cqe_irq(host, intmask, &cmd_error, &data_error))
>  		return intmask;
>  
> -	cqhci_irq(host->mmc, intmask, cmd_error, data_error);
> +	cqhci_irq(host->mmc, cmd_error, data_error);
>  
>  	return 0;
>  }
> diff --git a/drivers/mmc/host/sdhci-tegra.c b/drivers/mmc/host/sdhci-tegra.c
> index 820ce4dae58b..221e48b59f48 100644
> --- a/drivers/mmc/host/sdhci-tegra.c
> +++ b/drivers/mmc/host/sdhci-tegra.c
> @@ -1280,7 +1280,7 @@ static u32 sdhci_tegra_cqhci_irq(struct sdhci_host *host, u32 intmask)
>  	if (!sdhci_cqe_irq(host, intmask, &cmd_error, &data_error))
>  		return intmask;
>  
> -	cqhci_irq(host->mmc, intmask, cmd_error, data_error);
> +	cqhci_irq(host->mmc, cmd_error, data_error);
>  
>  	return 0;
>  }
> diff --git a/drivers/mmc/host/sdhci_am654.c b/drivers/mmc/host/sdhci_am654.c
> index d235b0aecfdb..2a27db2f558b 100644
> --- a/drivers/mmc/host/sdhci_am654.c
> +++ b/drivers/mmc/host/sdhci_am654.c
> @@ -462,7 +462,7 @@ static u32 sdhci_am654_cqhci_irq(struct sdhci_host *host, u32 intmask)
>  	if (!sdhci_cqe_irq(host, intmask, &cmd_error, &data_error))
>  		return intmask;
>  
> -	cqhci_irq(host->mmc, intmask, cmd_error, data_error);
> +	cqhci_irq(host->mmc, cmd_error, data_error);
>  
>  	return 0;
>  }


