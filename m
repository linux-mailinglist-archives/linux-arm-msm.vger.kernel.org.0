Return-Path: <linux-arm-msm+bounces-108185-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4JOGFK/7CmqB+wQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108185-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 13:44:47 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EBDB156BD77
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 13:44:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5536B3000895
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 11:44:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB55027A462;
	Mon, 18 May 2026 11:44:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RxqyJqlN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2759834678E
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 11:44:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779104684; cv=fail; b=Fqo9rgKaH0RmfWCMoxhhJgD5ndyP3J0V4xGrv9o0nbldQCjAiNdfVMroefUL/HqB716BWaN6YxYLkeZ8hJGSNuwt+Gb817QjKeE0p/GMHRyQ5GbnZ0PhX0suAG/A0r3PBUA8ruaaj7q0+IppD2cDXdFMWWf60vysWL7Zf5nS1tA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779104684; c=relaxed/simple;
	bh=mtywAaXSzs/trgXckpYBuyCCBy7pt2FHki8bPlBJB5g=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=AcoXawgJZ0sk7i8R3/3IR2n8aUnAAkXuuJFLqQv4EdZSpJfiNOBzOj4OgrySvVASo443ITDPkMA8voxJdYWRME8E3ZgQeeDAP9MV0aVnSmKNzjPB3I6Y45yFQJ0oUSvpgmTY82H35fbXELkcw4jZBcV+jP0+qdAzOsn/ruPT0pk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RxqyJqlN; arc=fail smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779104683; x=1810640683;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=mtywAaXSzs/trgXckpYBuyCCBy7pt2FHki8bPlBJB5g=;
  b=RxqyJqlN3GKHIIFWLyAAffoyQkGIXLGz0rwMkgYLkJUn3FvVwaXHca0n
   T94saH8VNmcdLRuEiFofCKoy7z3gym408f0X2FJ+vZccqRKNm6A9d/ksk
   eSSll0CIcn99yxKQ0CjvSuL0bUMOyz4vk+C10mPTmiNn5Qgc0/Qutmvoe
   RNRIAqmDfdKPlK/n1w1paAi3MpYwT3CgcMI1rQg2veJ3W0m5crTYDb3Mi
   om9VoLU1l4zdNKuK+5J0nQFoFqJM8D2RKyPxzVWXsjmWA4FRSdmB8WrUD
   kzgYMTyV8R4jBeu/Hg3O/HgIoSrX52wMdVxuf+szG9YktQbGhNsxIDyLj
   Q==;
X-CSE-ConnectionGUID: OVJze8JjSLumj8nALDGsrw==
X-CSE-MsgGUID: q2lg7fefSLatAO8svJPoJA==
X-IronPort-AV: E=McAfee;i="6800,10657,11789"; a="90535554"
X-IronPort-AV: E=Sophos;i="6.23,241,1770624000"; 
   d="scan'208";a="90535554"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2026 04:44:43 -0700
X-CSE-ConnectionGUID: L2BFGL7QTLy6zcPu4MzkgA==
X-CSE-MsgGUID: DVVEVLwoRU2QEhFb0r2ZaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,241,1770624000"; 
   d="scan'208";a="235164031"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2026 04:44:42 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 18 May 2026 04:44:41 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 18 May 2026 04:44:41 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.19) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 18 May 2026 04:44:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m7sHCcEtYtSkh3z9+OxNLsxpov4SGWxEOiIAkZY2zB4i8v3cdZYdr7DMgPBvV3/Oi/4ySIssO87R0Ad/VIhnb8HOg1e1j0NqdCFZbOsRkweH9N/zwwcAwxv1PJrdgU1q70i3Brg1ZnAPvfPHz32ogfpGZ0spvxo9iqYLwk34QEMoWA4SSwiCMti2tKXu+jYsxQbrcxjVYp+9xVJmYUmjq7+AUpq3Le03+XHpQotv+nvH3u2P259sZ75jRZHIVUVJk0FztaAvQxEpuRWKU90Np7HFKdPNrL4TKtTSZfYV2wj3lpMW3u+RqUGwkuFhF+J0XtD1puunK49PbTloUxyAaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6pP2tmwqF6ANa4I5ONL6wDGKKZFHjN4mjx3TsW0MArY=;
 b=ZSOiE8QjH3OFBhnCd1jyQf3NNaoYKmRYC5x+yW50kRcw73oUdvkzy7Zggo3hHOvYdVVF5+UCMCb3sJw0YQyS9lgv2y6r8C3WhtArOsoQZGBLJvft50OYGBsdPChd7dITKA+SfCT7yPb+4PYLF14k6itH4iteZwfS0es5E8+mG6zWIvcW9lI/r49h2H6HzOFU4AGsGvC655NlzkSVdY721pSi26PPcZiXzrRJec/DJoc7lk8iDQtgXD3Gy7rJS8rTwCU2K48/2tMgVEfKUZ3Q8SPjwnpSfWwSloc6wkEAMpz4D9EZfk7gphutNB64D1Nqv+5DXURWblTPo+BawRmXIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com (2603:10b6:a03:488::12)
 by MN0PR11MB6110.namprd11.prod.outlook.com (2603:10b6:208:3ce::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.23; Mon, 18 May
 2026 11:44:34 +0000
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::45f:5907:efdb:cb5b]) by SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::45f:5907:efdb:cb5b%3]) with mapi id 15.21.0025.023; Mon, 18 May 2026
 11:44:34 +0000
Message-ID: <d68f8b2c-e34c-430b-bd40-fee7ed11d01f@intel.com>
Date: Mon, 18 May 2026 17:14:22 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 5/6] drm/atomic: track individual colorop updates
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
 <20260506192633.16066-6-mwen@igalia.com>
From: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
In-Reply-To: <20260506192633.16066-6-mwen@igalia.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0113.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:11d::14) To SJ1PR11MB6129.namprd11.prod.outlook.com
 (2603:10b6:a03:488::12)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PR11MB6129:EE_|MN0PR11MB6110:EE_
X-MS-Office365-Filtering-Correlation-Id: b522f722-cb1b-4d81-1ef0-08deb4d2d503
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024|22082099003|18002099003|56012099003|921020|11063799003|4143699003;
X-Microsoft-Antispam-Message-Info: FJzMjmTnJCuau4qr0c1YfjKqHGTEbxupoeWhs8Uny7NI34bl/pA3roWEyzJVf95DUwQPvr0bCw2XbJAd46YTiKcinB7PQiYpbJRyOJmXqg7w995CKpyky5p6mBgMdIFk783+9kPHXpS7wVaQXNJyrloTttsziouNNG3IUdA+obCb9pyFh9HTsd2O6pZgO7YNd729SL27HTcoGaSSyz79cCLACj1YJFRamkvFMw+iqfWV0DidSdJFlx6XoHTHivBNGdaABaojSvHrpsabA0TDi5OA9eXUzyVozs2gDSWti+xlHWCPtawucebSN/t/eXnFl39cBkZrrRAIYsG2n/CHZ7GBVWVfGZrmJMSJAvZhcOFmGg9VrUrKwD4Y5t2CtuxtqRNnWHZMkT/2M7uTIEPj2kqWfKoANDq5m+q1iiaApej3oAX/ic3qEp11e2R1NbuYsvu8nrIJNOGhFH13wx7f/YzC8cB6Ag0li+ccIDTh4nb485PSAu50lndvHyupjPj0SNxQpl+TyZfY2eQNqZjWZCKckzNZzpzrDBC/9uYN//a7gzYwoeyqVrQkHf1RHoDRNVnrPwiMcAXLHchHrwgW0JlPOgoB13kmgqPqfJDpDP7EK7aVeDgRM7CAV9KTjYWt8tQzfZSflW8Mw18kNp3OdtfW8BZscgIgr9CsPWbWgmyqQXeTpiVX2QKg2hrj1ryktluOOT8oKHx6WFeR3OTvPHIlWFL0f4YDPiVbYIoQCK8=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ1PR11MB6129.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(22082099003)(18002099003)(56012099003)(921020)(11063799003)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZUltNWtIaGRFa0thMFZlbjM2SklPVVJmNFVFQlA3ZzFybFM5cnBCUkk1TWtX?=
 =?utf-8?B?L29OellyS3FGRmdKV1BKVHBZdVBsaHljSXJzQ0NiRnpsbmxRU2xxNW8raCtM?=
 =?utf-8?B?L0tvOVdJRGlHc1VFdVNscWJ6V1ZrbFFhT2JiTHRDZm5ESlEzQ3FNak1rYUhQ?=
 =?utf-8?B?ZUdCaFFsSmJXTXhtYVhrMnpPQll0YW9CakdKWGhLUjNqcTBMK1Urc2pmaXFI?=
 =?utf-8?B?VVNrZjBZbmxYcitWUmxKUVhrOTcyOUNLSHJsWXIwamJuVm1zSlNVMTlTdkto?=
 =?utf-8?B?d0ZRNmcrZWdNS1JLY0p0bXU0SlgrY1lEMmRpSGlKQk52TFlsdzI3MzBncUpH?=
 =?utf-8?B?ZE9GekhmZmNOblkyN3hDTENKdVR5NWdISWlPWHRKcnNYakNVL1B2emNDcmJH?=
 =?utf-8?B?TCtvV0tKUHVRQkpKYkFHV2t2elQyM3R0bkdsaFVRMUtwUnpVVXRCcnl1UDhD?=
 =?utf-8?B?UFQva3dkZmFwaXdOS3F5QlhCWm9GTlBEOGdLSzk2cGp6bFBUS1I3aXdITllq?=
 =?utf-8?B?NTQxcVpwNVd2U3JYL1FxU0lnYjRtZzFwcnJ0RDlmbmRackEvYS9oY00vVjBm?=
 =?utf-8?B?NXpSeDQ5MHJxb0lpU3JUYjkzSlpuc3Z0VkZvUGNEa0EvcDkrS0dUajUyajVj?=
 =?utf-8?B?dWFZb2UxdmN1aEdiSyt6RUVYNUYrcWE1YTQ0VUFnUEhiWjBOd2lKeU5HTjVy?=
 =?utf-8?B?UGtiV3BaRjlPUG8ySjF1NlpDL0YwaGZ3bExnVU5TZ0swTmNLNFlza1lUTzhi?=
 =?utf-8?B?OGp2UWRvWStYMlJLVWlqWFZMR1pUQTgxVTV4WmEzeTNZcG9KRkxDenQ2TERV?=
 =?utf-8?B?dnMzTXlZZnQyQ2RrV3Y4aUNOTU1Rdm9ETkkycjY3TGVoT1RtQmNFTXF2RDEw?=
 =?utf-8?B?ZHV5Q2RKNEFPa0NuMDh6d1JiUUpRYjgwYS9sQzZCQm9zcnNHblhkQzdDeVRs?=
 =?utf-8?B?VmpKT1NtaXd4R09LM1QvZjVDQ0tic003Q0pQQVcxQjJSWjdES2xWK09PVG5S?=
 =?utf-8?B?YUFXSS9RdUFZenU2L0J5NndwYnZxVFJsSVlxZjFraHd5L3BCMzlnM0wvUVo0?=
 =?utf-8?B?WUhuWkVEUlhvNUZUUnk1Zkk0S1ZXUlo5WE9tQ2tkRXhPMVpCRnBxSkEyUEZT?=
 =?utf-8?B?RmFlY09INXViQlBuRnZYQThYbzRhZmpoNC91WjF6KzZDcHVWT2NYcVE4WnA5?=
 =?utf-8?B?RWtLOHFpM0JDQ3NWTDdzZ2d3NktOVW51Rlluc0dFV3lkS3ZZSG4yWXd6Tk9J?=
 =?utf-8?B?UGdFSDhtSHhYQ1lMK08yMzkwZ1RZV3MwMks4Z21lVFpLMEpJcFpVYnZocnRD?=
 =?utf-8?B?QWxZaCtLSEZOMWE0ZzRpbndlajZIWTRocUNiTkhTMTdrcWhnejQwRjk3bEJv?=
 =?utf-8?B?NGpFU1VMeDlDRlp6QUJIMFFnK0JVdjZmUzErTmxRR1M4WVQ2SWMwMTVFZVJB?=
 =?utf-8?B?Y2lhMlIxWTEzaExucEZVUlBWaHlWVWFEeFFTNHM2b3JoSWdMcEd5VkVqQVJW?=
 =?utf-8?B?MEZublp5U3Z0NHF2Ym5rcmZpMVBibUpvTlhvYzN5RE1hS2NIYjRISnFFQXlt?=
 =?utf-8?B?ZllmekZ5cEFyNFBjRXJZaGNVeWluSE0vUGFWMzVZRUszQU5hSDB4SHdmcVcw?=
 =?utf-8?B?MENlbFhXblAxdUlLTWMxL2gzajMvQUZqbEZGdUsvUUlBcER3WTl1eEszdUp1?=
 =?utf-8?B?bERLaXcxSFJpYU5FRGEwV1RRd240MHF2WHphV1NUZUZGOWZGUzJVZVV3andl?=
 =?utf-8?B?Si9qOWF5ZnUyNmhoZVhHaGFBdnBnQnlEQTlWaWJHMys2TE9FZHYydko2NkNC?=
 =?utf-8?B?RUxOUGJkR3N0VXlPTjdzUUVLNStnSWJkcHc2SURjd2xtUFhhQno0S3lkOGpu?=
 =?utf-8?B?ZW9NSzU5NHg4bU9FaE42UnpmOVVFcjBSUHRSd3MwblhYUmNSMC83MWpDUVB2?=
 =?utf-8?B?SG96bGU5SGJXMk5zUHVMYVZnZTEzTVBNaStXR1NZVFRyOW1LcWFlTm1pR05y?=
 =?utf-8?B?ZTZIblhpbkFPMFMxQms3Z2l0QTJyZU1CRHRDMHJKeEhjQ2tKejFOK3V3SWRR?=
 =?utf-8?B?OWUrVDFnZ1NkZjJxbjhrWThNSGw5NjNrcHhRRGd1Rm9pOWVIMTl1ajN3c3hG?=
 =?utf-8?B?Y3IxbmJNMDNDSFhRVUZYbloreDAweW8wYVkrRWJoYW16cCtwUTIyNFdEZCtm?=
 =?utf-8?B?cU9seFBuSXBIYjJQcW92T3FGZmRZUVE1VjZWNDNuSVZOQWVMNTFUL3JpRWY1?=
 =?utf-8?B?a0VDN210MjU2bHEyUzNaTm5RK1ZlNUFDejJLS3NwSzBRM1lLU1B2cGpEZDh0?=
 =?utf-8?B?dStxMWNPU29wNnlhbWFTRVZFb0p1MmlUZCsvcFhRUmNaNzFaU2Q3SEo5UUk5?=
 =?utf-8?Q?fgbnN/rN+z7SShZ0=3D?=
X-Exchange-RoutingPolicyChecked: yNCSYcqZHco1k81ER7lyJoQ4gexdI4GOGz/0G3Vjntor8XW2AukFNZlZwpOEbto689L5dvRPacfEsKoYWA3i0W+fOLMn7z72srb0oxTqjpI1ZnkISi0E9o3C5mV7/0Vab46n3RivHWDK2vg4CZSQYEo+UTj2MPShOKaRF+mXR3eniCup798NNZBMiiTqdWcx4crwYkQGVADW8rqJBJzuTO2IcQPCOVxvHJv2S215W7Oay7YsFuXt5BwodwwVd5tX6MAY3OdIP5w/EfVANOYxb5/vrdeQ4U+mGl+IgK/undoLtryhuzw/GPFSHkdVKIa+E4Dtkl9hgzl9AaCif36DOw==
X-MS-Exchange-CrossTenant-Network-Message-Id: b522f722-cb1b-4d81-1ef0-08deb4d2d503
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6129.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2026 11:44:34.6349
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K7ZLok+MOXSG97L+uEY4TpD/1DD/69/x0GQOBJbTVi/8LZtAewHCeHDNV7uC1eWRtlyarzyEbVstrwEkZNWQpflt+aIPGS00uTc6uwqZocM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6110
X-OriginatorOrg: intel.com
X-Rspamd-Queue-Id: EBDB156BD77
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-108185-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[igalia.com,gmail.com,amd.com,linux.intel.com,kernel.org,ffwll.ch,suse.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[amd.com,emersion.fr,intel.com,kde.org,collabora.com,bootlin.com,linux.dev,lists.freedesktop.org,igalia.com,oss.qualcomm.com,kernel.org,gmail.com,poorly.run,somainline.org,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[29];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,intel.com:email,intel.com:mid,intel.com:dkim,amd.com:email,igalia.com:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[chaitanya.kumar.borah@intel.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action



On 5/7/2026 12:53 AM, Melissa Wen wrote:
> As we do for CRTC color mgmt properties, use color_mgmt_changed flag to
> track any value changes in the color pipeline of a given plane, so that
> drivers can update color blocks as soon as plane color pipeline or
> individual colorop values change.
> 
> Reviewed-by: Harry Wentland <harry.wentland@amd.com> #v1
> Signed-off-by: Melissa Wen <mwen@igalia.com>
> --
> 
> v3:
> - track lut1d/3d_interpolation changes (Chaitanya)
> 
> v2: add linux types to provide bool for MSM driver (kernel bot)
> ---
>   drivers/gpu/drm/drm_atomic_uapi.c | 55 +++++++++++++++++++++++--------
>   include/drm/drm_atomic_uapi.h     |  4 ++-
>   2 files changed, 45 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
> index 25fe94410af7..2bac16c9855a 100644
> --- a/drivers/gpu/drm/drm_atomic_uapi.c
> +++ b/drivers/gpu/drm/drm_atomic_uapi.c
> @@ -265,13 +265,19 @@ EXPORT_SYMBOL(drm_atomic_set_fb_for_plane);
>    *
>    * Helper function to select the color pipeline on a plane by setting
>    * it to the first drm_colorop element of the pipeline.
> + *
> + * Return: true if plane color pipeline value changed, false otherwise.
>    */
> -void
> +bool
>   drm_atomic_set_colorop_for_plane(struct drm_plane_state *plane_state,
>   				 struct drm_colorop *colorop)
>   {
>   	struct drm_plane *plane = plane_state->plane;
>   
> +	/* Color pipeline didn't change */
> +	if (plane_state->color_pipeline == colorop)
> +		return false;
> +
>   	if (colorop)
>   		drm_dbg_atomic(plane->dev,
>   			       "Set [COLOROP:%d] for [PLANE:%d:%s] state %p\n",
> @@ -283,6 +289,8 @@ drm_atomic_set_colorop_for_plane(struct drm_plane_state *plane_state,
>   			       plane->base.id, plane->name, plane_state);
>   
>   	plane_state->color_pipeline = colorop;
> +
> +	return true;
>   }
>   EXPORT_SYMBOL(drm_atomic_set_colorop_for_plane);
>   
> @@ -604,7 +612,7 @@ static int drm_atomic_plane_set_property(struct drm_plane *plane,
>   		if (val && !colorop)
>   			return -EACCES;
>   
> -		drm_atomic_set_colorop_for_plane(state, colorop);
> +		state->color_mgmt_changed |= drm_atomic_set_colorop_for_plane(state, colorop);
>   	} else if (property == config->prop_fb_damage_clips) {
>   		ret = drm_property_replace_blob_from_id(dev,
>   					&state->fb_damage_clips,
> @@ -713,11 +721,11 @@ drm_atomic_plane_get_property(struct drm_plane *plane,
>   static int drm_atomic_color_set_data_property(struct drm_colorop *colorop,
>   					      struct drm_colorop_state *state,
>   					      struct drm_property *property,
> -					      uint64_t val)
> +					      uint64_t val,
> +					      bool *replaced)
>   {
>   	ssize_t elem_size = -1;
>   	ssize_t size = -1;
> -	bool replaced = false;
>   
>   	switch (colorop->type) {
>   	case DRM_COLOROP_1D_LUT:
> @@ -739,28 +747,45 @@ static int drm_atomic_color_set_data_property(struct drm_colorop *colorop,
>   						 &state->data,
>   						 val,
>   						 -1, size, elem_size,
> -						 &replaced);
> +						 replaced);
>   }
>   
>   static int drm_atomic_colorop_set_property(struct drm_colorop *colorop,
>   					   struct drm_colorop_state *state,
>   					   struct drm_file *file_priv,
>   					   struct drm_property *property,
> -					   uint64_t val)
> +					   uint64_t val,
> +					   bool *replaced)
>   {
>   	if (property == colorop->bypass_property) {
> -		state->bypass = val;
> +		if (state->bypass != val) {
> +			state->bypass = val;
> +			*replaced = true;
> +		}
>   	} else if (property == colorop->lut1d_interpolation_property) {
> -		state->lut1d_interpolation = val;
> +		if (state->lut1d_interpolation != val) {
> +			state->lut1d_interpolation = val;
> +			*replaced = true;
> +		}
>   	} else if (property == colorop->curve_1d_type_property) {
> -		state->curve_1d_type = val;
> +		if (state->curve_1d_type != val) {
> +			state->curve_1d_type = val;
> +			*replaced = true;
> +		}
>   	} else if (property == colorop->multiplier_property) {
> -		state->multiplier = val;
> +		if (state->multiplier != val) {
> +			state->multiplier = val;
> +			*replaced = true;
> +		}
>   	} else if (property == colorop->lut3d_interpolation_property) {
> -		state->lut3d_interpolation = val;
> +		if (state->lut3d_interpolation != val) {
> +			state->lut3d_interpolation = val;
> +			*replaced = true;
> +		}
>   	} else if (property == colorop->data_property) {
>   		return drm_atomic_color_set_data_property(colorop, state,
> -							  property, val);
> +							  property, val,
> +							  replaced);
>   	} else {
>   		drm_dbg_atomic(colorop->dev,
>   			       "[COLOROP:%d:%d] unknown property [PROP:%d:%s]\n",
> @@ -1278,6 +1303,7 @@ int drm_atomic_set_property(struct drm_atomic_state *state,
>   		struct drm_colorop *active_colorop, *colorop = obj_to_colorop(obj);
>   		struct drm_colorop_state *colorop_state = NULL;
>   		struct drm_plane_state *plane_state;
> +		bool replaced = false;
>   
>   		plane_state = drm_atomic_get_plane_state(state, colorop->plane);
>   		if (IS_ERR(plane_state)) {
> @@ -1308,7 +1334,10 @@ int drm_atomic_set_property(struct drm_atomic_state *state,
>   		}
>   
>   		ret = drm_atomic_colorop_set_property(colorop, colorop_state,
> -						      file_priv, prop, prop_value);
> +						      file_priv, prop, prop_value,
> +						      &replaced);
> +		if (!ret && replaced)
> +			plane_state->color_mgmt_changed = true;

Nit: For consistency with the other color_mgmt_changed updates in this 
file and to make the intent explicit, perhaps change it to 
plane_state->color_mgmt_changed |= replaced;

Otherwise, LGTM

Reviewed-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>


>   		break;
>   	}
>   	default:
> diff --git a/include/drm/drm_atomic_uapi.h b/include/drm/drm_atomic_uapi.h
> index 436315523326..4e7e78f711e2 100644
> --- a/include/drm/drm_atomic_uapi.h
> +++ b/include/drm/drm_atomic_uapi.h
> @@ -29,6 +29,8 @@
>   #ifndef DRM_ATOMIC_UAPI_H_
>   #define DRM_ATOMIC_UAPI_H_
>   
> +#include <linux/types.h>
> +
>   struct drm_crtc_state;
>   struct drm_display_mode;
>   struct drm_property_blob;
> @@ -50,7 +52,7 @@ drm_atomic_set_crtc_for_plane(struct drm_plane_state *plane_state,
>   			      struct drm_crtc *crtc);
>   void drm_atomic_set_fb_for_plane(struct drm_plane_state *plane_state,
>   				 struct drm_framebuffer *fb);
> -void drm_atomic_set_colorop_for_plane(struct drm_plane_state *plane_state,
> +bool drm_atomic_set_colorop_for_plane(struct drm_plane_state *plane_state,
>   				      struct drm_colorop *colorop);
>   int __must_check
>   drm_atomic_set_crtc_for_connector(struct drm_connector_state *conn_state,


