Return-Path: <linux-arm-msm+bounces-108181-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OFoaF+/7CmqA+wQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108181-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 13:45:51 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E6EE156BDDB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 13:45:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1750030173A0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 11:42:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68EA531F9A1;
	Mon, 18 May 2026 11:42:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O76v5k5L"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 124CF307AF4
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 11:42:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779104570; cv=fail; b=s/PI1/9Rw/H29dilb9ok6X8vqZ9nBvkJ7Mc8bVo7G2E6FNzgGwjSt69+wKoI3UdDTfnh+2xLoLS33xXBcBTuKfba2ZOblEurcuNN2An6QPxdExIc+tQ4SfptH/X+ZNMij4Lj4zHoJculRoV/uUbc6cEu4+fZUH87yNReIyBFqG4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779104570; c=relaxed/simple;
	bh=FFcZ9pXwVwP57ZXoVG04a1VWlGUCf5IsHdDnQdAPbzo=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=awBtdIjuNXB3A+bEu/ANq03f/9ENszTWggQ6Fzmk1EQPXgcF5Wqbg4tT9B6mVCVd/kzT0HjuqJAhxyq5JOErk+K7HYDcC6CjX5PN2ni2221geYuAyWRY5uvXYuUDPmNTN5zcTI24fQxR6ZMdGzdETmqwWTV1qeLUbdFT/Gr2csg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O76v5k5L; arc=fail smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779104568; x=1810640568;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=FFcZ9pXwVwP57ZXoVG04a1VWlGUCf5IsHdDnQdAPbzo=;
  b=O76v5k5LnE3YOt9x4xsZ6WQAX2wh8zR81tCYQZScrr6y0KuQAiztb3JP
   1gjp+ls49DRjN9Zz6ciNR6bOqEQNJOGZ76DtoLcueTmMHORjKKocpIThL
   QAuTlpCiaMD6FyP3+0f6Gq8cgH2bVdrlEl0igz1BS89DvTWSXSNmimBe+
   pqEfaIwRM5M73p9kk/qJ1yk5uGzwr50q2nmdpTcNa+y7LjNeCxeTKNHLy
   UaJ+jrCPEQsyCiYAUedYzNjTVFD6Cv47Nz5YSlW5XjBmT1n8dcQJ8PjDO
   YhtfbJAfz3bQ6O1uDJ0OtlAakKXAeTmT9uD6bb5PexdeQe88vAHzxJrsy
   w==;
X-CSE-ConnectionGUID: f3kzUfGvSD6ArXBAs51qEA==
X-CSE-MsgGUID: Gbx16hVGS5ekkp14Tbt60Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11789"; a="67483253"
X-IronPort-AV: E=Sophos;i="6.23,241,1770624000"; 
   d="scan'208";a="67483253"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2026 04:42:47 -0700
X-CSE-ConnectionGUID: FGk4kDv3R86bHs2IqdJYgA==
X-CSE-MsgGUID: kZyryZfcSjWq+XmOXpjoZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,241,1770624000"; 
   d="scan'208";a="233015190"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2026 04:42:47 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 18 May 2026 04:42:46 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 18 May 2026 04:42:46 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.52) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 18 May 2026 04:42:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZHQhQeoDTNJyuiujppJsByyIJ6vZ/pPCEQu9TQ4pDgUVx6t+v1CxqZP9Un6nUBlRxRB23NG3YHrmcMc4DakXHQlqae+3tbE/E7x5M4W5mKlWyYYQURHqlFje4KZpHwHrbaGXZ8QRKItRyL5ityzgbElUHXOzd1YNYoeWYiyGxp3CYb/ZN9fLAqmDBkbE48mObHxdNlDqfECyOb8Mai8lkP/peweW2T4ikd+FmKu7Uok5Xzv5/FUzIZxPGXyF1l5e5ejO4mSmnOPPNGIG8vKgfFBgrNiCrb8iaAXG95gaqKrE2FVxFkNyZACl4gepxHq6pITUDL47IzqQLigSDQbRkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yC/tDzfVJcXrVy/jvYqY+GhqSun6bSdkt7eJTu+ls5A=;
 b=BTkC9ELtxsFEW7R+uDS7xQ4MapF4CJj1S33H4iBIyK594azKqs4+8nSnuHcp6aYilPlECJArM02p61PLyC7MFuzXD/1tMZlZSk9/iavC94tfk9nh1OYYfJT9leVeuRRhW0RB3nlt6Wa+0s/IEeHiYmEF+THfU8ir9IHB4N7xTAAWLGH1anPEljo561qiZIlUyReKPKZfGq1SgR6/7+rR4vlHG5xRORnsno/CIfP0ojRiOibXhmeJAX27KLirr9A9kllnnIEyTRjTHhzf+iiejUgXDmc9GrfVmmfh8tkdJ4laRWaNj9DguGul5ZSZPnDc3g+3HslB4RlgTC+W6zZvcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com (2603:10b6:a03:488::12)
 by MN0PR11MB6110.namprd11.prod.outlook.com (2603:10b6:208:3ce::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.23; Mon, 18 May
 2026 11:42:41 +0000
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::45f:5907:efdb:cb5b]) by SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::45f:5907:efdb:cb5b%3]) with mapi id 15.21.0025.023; Mon, 18 May 2026
 11:42:41 +0000
Message-ID: <cd1d9fd2-8026-44ad-a0d3-d317dc1fb28d@intel.com>
Date: Mon, 18 May 2026 17:12:29 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/6] drm/atomic: don't set colorop properties of
 inactive color pipelines
Content-Language: en-GB
To: Melissa Wen <mwen@igalia.com>, <airlied@gmail.com>,
	<alexander.deucher@amd.com>, <christian.koenig@amd.com>,
	<harry.wentland@amd.com>, <maarten.lankhorst@linux.intel.com>,
	<mripard@kernel.org>, <simona@ffwll.ch>, <siqueira@igalia.com>,
	<sunpeng.li@amd.com>, <tzimmermann@suse.de>
CC: Alex Hung <alex.hung@amd.com>, Simon Ser <contact@emersion.fr>, "Uma
 Shankar" <uma.shankar@intel.com>, Xaver Hugl <xaver.hugl@kde.org>, "Pekka
 Paalanen" <pekka.paalanen@collabora.com>, Louis Chauvet
	<louis.chauvet@bootlin.com>, Matthew Schwartz <matthew.schwartz@linux.dev>,
	<amd-gfx@lists.freedesktop.org>, <kernel-dev@igalia.com>, Rob Clark
	<robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, "Abhinav
 Kumar" <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>,
	"Sean Paul" <sean@poorly.run>, Marijn Suijten
	<marijn.suijten@somainline.org>, <linux-arm-msm@vger.kernel.org>,
	<freedreno@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
References: <20260506192633.16066-1-mwen@igalia.com>
 <20260506192633.16066-3-mwen@igalia.com>
From: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
In-Reply-To: <20260506192633.16066-3-mwen@igalia.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0117.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d0::9) To SJ1PR11MB6129.namprd11.prod.outlook.com
 (2603:10b6:a03:488::12)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PR11MB6129:EE_|MN0PR11MB6110:EE_
X-MS-Office365-Filtering-Correlation-Id: 4de2a0df-769f-48a1-e91f-08deb4d291af
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024|22082099003|18002099003|56012099003|921020|11063799003|4143699003;
X-Microsoft-Antispam-Message-Info: ex/f2pUVUJezfiRpHIV0O8WXeR/8roogJoMlwFdoNAUUWBsbWq8dW5N+Mfp5sqhPIqW+EZW+vbmasUJrUoc/kApGnC5YltVl+VXWEfDSLywhRep8MZIJqFJNsXkzQNzcBH3Mfk6OWtwPTUgotbPFBJVRAcXPySduUzIS3qORZ7MA3GP5nG6ncIdyK1OUWbhWUermBdYJpsPzs0qoWwB2J7c8gFZQDdjsSwjRelz54FgL7O+pyShMvOhzqJhP9V4Jluc/2Uo6ENMir5aLPjx1q4pxYwqgG1nWHZZ02CoF1vwAYi546YqX4RN5S6xbfk2rspLtVPV335AUEIjAmPnVWhB7sUKZQ4DmO63HQptKE0AxBQfU5IPVu+0jkYwJ/1U5oKI0B9pGUn6h01R1XT2wFdVWqFUSnyYnvREonWnSpppwEEoj6fXs3eSNhClsLl5C9lZwWkGZWg3RisEob3c+98W53F05bIkE9PnmSuZhFtkLNtPmpg95Fe0r8GBgEkqNv+ziWulUMn+jMAdl21cMzM9osbPbc3vIx/DLFlw5GA5l2tI1pfqqU1CrsaZ3JpdeOnOo3h3Rq3E4tltMcSKoutvam1tkCZuzpXF0yFpPfPpgQXNr96IxUye5QuksNU+n0gppdYVDJcffnoHE8f+R/18tKY6VP4RCjm4WWXQrfUtSDvn5N6V/4VCN7AbFk5Y9y86Kg2URZHxqPzzC4bV26tJoEER0QX7CyFnUYmH18Yg=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ1PR11MB6129.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(22082099003)(18002099003)(56012099003)(921020)(11063799003)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NDFsbGRQZmJPMXYzbEh1VThVVlJ1bTV6UjhnNUkwdFpaMkZpdmtMRkdOMDNp?=
 =?utf-8?B?NlpDR2MzTHJqZ3JFYzE2NU1TMVF4VjNnNlROQUI0K2VKMGZmWUJYZUJBTWRl?=
 =?utf-8?B?RDJpRWNNN3d4N2dDT0lVbytXdzBPcGtsSEdDeC9hVkluUUZpeUZkVzNUbE9D?=
 =?utf-8?B?dWwweUJ3bEZ6dWJYRjN3ZEVlTEFUNjZyVnE0R0x4Vk9vajZQV05xWE40dmQx?=
 =?utf-8?B?dDlScW92bC9CcjM5TVVWM1J0dG1mMU4rT3lXeTlCNnBML09LVUs5RXQwalR0?=
 =?utf-8?B?U3MwdElUbnlnZ3plaGJsWCtuYTF6d3dkUmhXS3dTc0hGMWN1V1FsWFplSm82?=
 =?utf-8?B?R2V1bGE3WWlndnA0cnhqQy9UZjVXWVJaWm53dFFIZWFaekZSL096OWlJSlJJ?=
 =?utf-8?B?T3hoQ2Y0L0VmT3JEa1RZWUJHa3lWQzI0ZXpMa2ZiZ0VhVkRnL2VjWEVIR0o3?=
 =?utf-8?B?WUFuVi9FNmQxcnAyY3o0OG5CY2lHMzd3WHM2MmYzVlhudkxObndYM1Z6Mng4?=
 =?utf-8?B?bVZ1WTMxc1J0YUVUV1ozc294MklKSXZNakJSakdNOGd6bHJObGU2Y2Z1LzRn?=
 =?utf-8?B?WFdWVE4vN1pOYU5Icmp0aEFPRVZMemZoVC91ZktmK1pKMWkvODlFM0RQd0xk?=
 =?utf-8?B?ajl1WVIxTTBsOUdWcm1WVWpJSzBvQWRDU1N4bHlVRiszZHROaXZhdW9OMUls?=
 =?utf-8?B?c092azB1ZG83MmVybnpIQU42eDBBVWJhZVJTbHJxZkNRSnRNU09Vd09uS2Vh?=
 =?utf-8?B?VWJiMElEbjd1SUpnK1ZpUW5PUDBURjVPOVNlYzFBcTVqT0doN2kzby90Uy9X?=
 =?utf-8?B?aFJOazR2bXU4bWQ4NE52MlBuZnVDaVZUU3hGZytsS2FwdlBQd2JpbDNrcGFQ?=
 =?utf-8?B?YTd0ejR0VVczdGlyZGNFYUZaTzVwa0lmR3RTZWNrRGxxMWQxMkhxNTlQUVZH?=
 =?utf-8?B?VFVZam9KQUV2R2k1R2xWSVVSejdESm14WC90VTBrTG1oT3hKQXpaWHRIVHFF?=
 =?utf-8?B?VGo2V2d3d0tSYVZabERvNTVsc3ovR3h6L283cUtYZ2UrWlpGNHlyaVdZQ1la?=
 =?utf-8?B?YWJKbXhhQ0g0MEZ6aHR1cWtjZVlGNE1MOEpvTTFnWFBoaVQ5b2F4N2hQWjdC?=
 =?utf-8?B?RlpVSTk2aCtXakNMek10c2xFR2xXWnVZQllUREs1YVBmV0hWZkN3NFRuYUZ0?=
 =?utf-8?B?RjMxU1o4VUcxdFBzeU5kNG13bzRnRUVoVmZ4WUtmYUE2VC9vVzBzeGZoSUpZ?=
 =?utf-8?B?N2VmWjVNYXdZWWZiRzluNGVGZU5QQnBTSTdUZE5USHpRTVlBdjRCelpqaHpt?=
 =?utf-8?B?L2Rma1JIQktjY21sM0tSMDlubGszemJRQW9nUVlaek9LRUo1Nk1NRjZtejFZ?=
 =?utf-8?B?a0UvL2x0eDlLVDJMZVVPdFc2ZG1hV3ZKaTN5akxFRkRaQ2ZaankxUmsrSVZD?=
 =?utf-8?B?ZzlWcDdXcG1zQ0VRK0hEaFRaMlY5bnRZMWo4enpQbDR0VWRMN1F0NU12V1Mz?=
 =?utf-8?B?WmhSWjFNcTMrQjRMWUdES3pwRmEyTVQybG5CUy9peFZGS2Y2cnBFU0ZiR1E5?=
 =?utf-8?B?SHREamt6UjFCRUdoblNIV2cyL0xtdlJwSjR0TWFnam1ZTlNEV1JMSnZnSHpB?=
 =?utf-8?B?T2hoekI4NStCSmYza0dMMGlDWDF4aFFCVld3US9qOFRLYS8yQlVuREhzcFNV?=
 =?utf-8?B?N05WblRXVlVTY2daV09NSDZnbVIxQk4yQjBPU09wZnpKSFNqa3hYeXpQOE12?=
 =?utf-8?B?R2lySUhjUnBvejBadXNSTVlHZ0t0SkhTVzNCYklDdnRiRlpGZFRxYkZ2Y1Zx?=
 =?utf-8?B?MVFnOWEzeVhzeHhJeXhuZ3FwaFFjTjJXaHlqbTJmVEx4Sys1SmNYeEpvQ20w?=
 =?utf-8?B?bmhaZkdlWER4S0ZkenNNTmRkNXNFOTY2ZXgxcXE2UWxOSllUbkdoWk5VbHVJ?=
 =?utf-8?B?QWtOV2pzTkhtMUVseHlUN1NTSWV4TTlwbWEyZzRGRXEzVlI2aXJ2cEpTQ0Ru?=
 =?utf-8?B?UGJjSVJFV3c1Z2JDb0RQbnRyY2o1QnA0M1kyTWNsajV4SjlCa2NxTlN6L2t4?=
 =?utf-8?B?SjNkMUk1aUtYTkxxektFYlRpQkxCQStmMmlETnkxT3dxdG00TWFVSjh2UXBT?=
 =?utf-8?B?MitMWnZoMXZqOTJWdnIvTjF2eEI4QloyWmFsaHNlZ0F3ZGUvai9ETjdCZGx4?=
 =?utf-8?B?L0tnUkVIWXdXSFYvWHBEZlI3S2JFV0tIby90eHYrWVBHbUhHTkk5eGgrZ2dy?=
 =?utf-8?B?WU9xZEozdnlyUmYvZUlPcjgyUytReXloQzhyVE5pM01XUjVpd2FOWDZadUsr?=
 =?utf-8?B?azRPcXl6ODRXZk1sQzF5U2VXSEJFQ29Hbk83cG9WOWRGVGNpYmlsL3lReTVR?=
 =?utf-8?Q?vOvLaV7TWYDJ+wHM=3D?=
X-Exchange-RoutingPolicyChecked: D1o5lvUxdwzfTVgcYLg9hnK2u9uNisJFLx032Yp5dSqkubRXsp9uj47hW14OOmNunMedenhIxnL1IazmfQrsATQOl37lOkKWDSlrD43Y513b5c4yE4EA4eoWZqCpkOdtqlB94AdxfNlYr86lzDtGD6uEpWjIuZx044nxi9YBRBU6HwnJln87T2272iQ2lVYtXFUBlT8aTeyfs+Je3bUMNmYsyVttwx16XoYFYMArTRHd/xOnHddT4RnqQ1ubcXTG5yi1CZ8oBLSiQg8CaKSXOACY+pg38JyHNchCaDq5iDs2iG7y9uhtkHy6adeFDFixTXD5bXXdMXjlLfJ2/Urhpg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 4de2a0df-769f-48a1-e91f-08deb4d291af
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6129.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2026 11:42:41.6624
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f9Ro+vrB0Fi2gRguQS2kY22KLIMWxIqoaIU8Ch93N/8ek1ObqG5efou+RmbtrFEm/3M3bP81sOlcE2a/wdr9tUgaPIYT7WJ16NiSTJFcOUk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6110
X-OriginatorOrg: intel.com
X-Rspamd-Queue-Id: E6EE156BDDB
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-108181-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[igalia.com,gmail.com,amd.com,linux.intel.com,kernel.org,ffwll.ch,suse.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[amd.com,emersion.fr,intel.com,kde.org,collabora.com,bootlin.com,linux.dev,lists.freedesktop.org,igalia.com,oss.qualcomm.com,kernel.org,gmail.com,poorly.run,somainline.org,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[29];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,igalia.com:email,intel.com:email,intel.com:mid,intel.com:dkim];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[chaitanya.kumar.borah@intel.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action



On 5/7/2026 12:53 AM, Melissa Wen wrote:
> Reject attempts to change property values of a colorop that is not
> part of an active plane color pipeline.
> 
> Suggested-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
> Signed-off-by: Melissa Wen <mwen@igalia.com>
> ---
>   drivers/gpu/drm/drm_atomic_uapi.c | 34 ++++++++++++++++++++++++++-----
>   1 file changed, 29 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
> index 5bd5bf6661df..bff8d58f8f12 100644
> --- a/drivers/gpu/drm/drm_atomic_uapi.c
> +++ b/drivers/gpu/drm/drm_atomic_uapi.c
> @@ -1275,15 +1275,38 @@ int drm_atomic_set_property(struct drm_atomic_state *state,
>   		break;
>   	}
>   	case DRM_MODE_OBJECT_COLOROP: {
> -		struct drm_colorop *colorop = obj_to_colorop(obj);
> -		struct drm_colorop_state *colorop_state;
> +		struct drm_colorop *active_colorop, *colorop = obj_to_colorop(obj);
> +		struct drm_colorop_state *colorop_state = NULL;
> +		struct drm_plane_state *plane_state;
>   
> -		colorop_state = drm_atomic_get_colorop_state(state, colorop);
> -		if (IS_ERR(colorop_state)) {
> -			ret = PTR_ERR(colorop_state);
> +		plane_state = drm_atomic_get_plane_state(state, colorop->plane);
> +		if (IS_ERR(plane_state)) {
> +			ret = PTR_ERR(plane_state);
>   			break;
>   		}

Hmmm, this creates a dependency on the call order of 
drm_atomic_set_property() for color pipeline and the color op. :(

Not sure if there is a good way to solve this.

>   
> +		/* Check if the colorop obj is part of an active color pipeline */
> +		for (active_colorop = plane_state->color_pipeline;
> +		     active_colorop;
> +		     active_colorop = active_colorop->next) {
> +			if (active_colorop == colorop) {
> +				colorop_state = drm_atomic_get_colorop_state(state, colorop);
> +				if (IS_ERR(colorop_state)) {
> +					ret = PTR_ERR(colorop_state);
> +					goto err;
> +				}
> +				break;
> +			}
> +		}
> +
> +		if (!colorop_state) {
> +			drm_dbg_atomic(prop->dev,
> +				       "[COLOROP:%d:%d] not part of the active pipeline\n",
> +					obj->id, colorop->type);
> +			ret = -EINVAL;
> +			goto err;
> +		}
> +
>   		ret = drm_atomic_colorop_set_property(colorop, colorop_state,
>   						      file_priv, prop, prop_value);
>   		break;
> @@ -1294,6 +1317,7 @@ int drm_atomic_set_property(struct drm_atomic_state *state,
>   		break;
>   	}
>   
> +err:
>   	drm_property_change_valid_put(prop, ref);
>   	return ret;
>   }


