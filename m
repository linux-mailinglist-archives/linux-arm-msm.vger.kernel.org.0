Return-Path: <linux-arm-msm+bounces-110547-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aM5eJFBRHWooYwkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110547-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Jun 2026 11:30:56 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CC20961C75D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Jun 2026 11:30:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9CE9C3045682
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Jun 2026 09:24:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35694344D8C;
	Mon,  1 Jun 2026 09:24:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gQvD67wq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 552DD2D29CF
	for <linux-arm-msm@vger.kernel.org>; Mon,  1 Jun 2026 09:24:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780305861; cv=fail; b=o8OqFtRq1t6OeqcwJAU0X8j6JOkP+kIfZqQoQ7Il83gQlX08PuN2TNmsfSk73GRtM5G8KW2fAIEqWfa+SQ9XboZT2Cdo/1nBv8gdJt6dd3mG+A0nJJyu4VRsEDByVfxxKEOZTMND35nSZT6KVTJ2iRGDujc4yMmUn2tO+u1qeTY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780305861; c=relaxed/simple;
	bh=4DyBcubFA7gD8y6yCyey20PPutFVrky47LuprbUlbUc=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=BYAlP7aOb8rgzQnm1AZYJFnqstRMqfYd/oUsXUM4HXRXuCuJZ3xZ8sC4ERrDbWoQz4i+oaxUhbvD3fqp7kPN/pWYroZ9Jeg/vgPm4Y53F104qQJAq9pKkbZqNx/OpH0xfeKiXFGLfzqhzW++VuIQ1eIGQHBTHEm4grCg2oYnFGk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gQvD67wq; arc=fail smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780305859; x=1811841859;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=4DyBcubFA7gD8y6yCyey20PPutFVrky47LuprbUlbUc=;
  b=gQvD67wqY8DUgAscQe8a3RxPJLw/24tSyzO2XS41PDkoPxQy6hNrtbTq
   JzYsLPC+Nk+nN4JV/UvpIWV/K8GXB3KpJtSWtdhr0uQeMlbg50dLLyUdz
   vqdXSlovKZTYzXTs6jg67Sezs1AcA+arCk32Ezb8GnbHwNwaUnXVxU3h8
   lPkTZzTDhTDraW7p/FuvM4gVhnnjnHVmgHZ2CosG7WExVv6koiILLwbv2
   pj/ylO2MXgqUPvbbs8hYZBYZEhUAM0+J16zOMxA1AedgBjHsT8MDXJ6++
   1hNwT90PChF7fAukVIzQ9IeFcVzH4nqjPtuOmIQVQXe2RewRWIdeMWGJ3
   w==;
X-CSE-ConnectionGUID: EOj0g4f+Q2GJSbVT2uwG/g==
X-CSE-MsgGUID: BMpOAId2RTKP9v5jcZlCPQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11803"; a="84948699"
X-IronPort-AV: E=Sophos;i="6.24,181,1774335600"; 
   d="scan'208";a="84948699"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2026 02:24:18 -0700
X-CSE-ConnectionGUID: 9QAFIKxtT2G0SamYqufQyg==
X-CSE-MsgGUID: mq0cysqeTsGIg/vv6/dlLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,181,1774335600"; 
   d="scan'208";a="243620570"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2026 02:24:19 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 1 Jun 2026 02:24:18 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 1 Jun 2026 02:24:18 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.29)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 1 Jun 2026 02:24:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B29BVLru1friHt7ufqeaH9EIYutbLDPahFkBJWf/P0/In4ZtCAjjDtOrO9XxCjkMkFlMOXNNPkSfugaiq52sUzkxpGe+QgGk0WhHkXL377CODwDDBiLTwS1FV68a8sYWoKDh3LWYtI8hPx6hDnZMqXxJ73EPzTYdj0fuJtNVoKh1jbnqXRAO3Wd77pYxph4AC8Qc/xzcjDEcQ0VuDoloMHGd6paWo/UAXpg2+F98CFrd44xCCvzf1dOyJpKEriveeondXdrT5sFIM9J22KrzDIcfUCIRgEUru5LoENVkM62zI0NAYUZ1bDBDXpCeaonrV0kQQMaRoCvF04DPitNOXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZDt4+FYNOMw+GNGpk+n+VAxUja2/0YiJx7ZwJ1EPtTA=;
 b=GY4yBCou7x7mAuqhiXm7JNhNmswgSpnr9+LWWP3YF6k9MbCkQTT58VBFxBDnIYklj6HzPqvKjt2wASJq8VwxN5YN7SVVPQ/7UC28QWo8KuLBUPjCmcJXi0r/xzxMISGBZ9JSamJFUbIuMDRObcV2ZISy4+dQrv8UVLPLWY5k1KrFn3jft4PqeHLYJrqKh3NImrQSNl6STVR97vv4tO7I7ENQ5KbmspJOcdMWx4Ii6NyIjnGW3yHFtsiCIpcmUafwwa4zIWOTd4V8srsTyw1AZVhGrI39r0ZYqR+A5HtZgAvpdV6neqibuM8AJSdSIGU+ZKv35deXTQG9roJirH0vVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com (2603:10b6:a03:488::12)
 by MN2PR11MB4535.namprd11.prod.outlook.com (2603:10b6:208:24e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.18; Mon, 1 Jun 2026
 09:24:15 +0000
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::45f:5907:efdb:cb5b]) by SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::45f:5907:efdb:cb5b%3]) with mapi id 15.21.0071.011; Mon, 1 Jun 2026
 09:24:15 +0000
Message-ID: <f9e5f9ed-ed15-40ae-9330-44f8c42f5f98@intel.com>
Date: Mon, 1 Jun 2026 14:54:01 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] drm/atomic: only add states of active or transient
 active colorops
Content-Language: en-GB
To: Jani Nikula <jani.nikula@linux.intel.com>, Alex Hung <alex.hung@amd.com>,
	Melissa Wen <mwen@igalia.com>, <airlied@gmail.com>,
	<maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>, <simona@ffwll.ch>,
	<tzimmermann@suse.de>
CC: Simon Ser <contact@emersion.fr>, Uma Shankar <uma.shankar@intel.com>,
	Xaver Hugl <xaver.hugl@kde.org>, Pekka Paalanen
	<pekka.paalanen@collabora.com>, Louis Chauvet <louis.chauvet@bootlin.com>,
	Matthew Schwartz <matthew.schwartz@linux.dev>, John Harrison
	<John.Harrison@Igalia.com>, Rodrigo Siqueira <siqueira@igalia.com>,
	<amd-gfx@lists.freedesktop.org>, <kernel-dev@igalia.com>, Rob Clark
	<robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, "Abhinav
 Kumar" <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>,
	"Sean Paul" <sean@poorly.run>, Marijn Suijten
	<marijn.suijten@somainline.org>, <linux-arm-msm@vger.kernel.org>,
	<freedreno@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>,
	<intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
	"harry.wentland@amd.com" <harry.wentland@amd.com>
References: <20260526142940.504911-1-mwen@igalia.com>
 <20260526142940.504911-2-mwen@igalia.com>
 <e8aaf4da-8fb6-4d6a-95d6-563ac0562b49@amd.com>
 <4452e675c4853faf665b520a8932a960946206bb@intel.com>
From: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
In-Reply-To: <4452e675c4853faf665b520a8932a960946206bb@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0133.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1d5::18) To SJ1PR11MB6129.namprd11.prod.outlook.com
 (2603:10b6:a03:488::12)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PR11MB6129:EE_|MN2PR11MB4535:EE_
X-MS-Office365-Filtering-Correlation-Id: fd72ede6-df0e-4ac2-c09b-08debfbf8cae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7416014|4143699003|11063799006|18002099003|22082099003|6133799003|56012099006;
X-Microsoft-Antispam-Message-Info: IBif2xE355/n+fr4MBEbvqkAy2WL1SNtm7NKi7fuveY8VA48qaQIymqF2s2m0pOYsd8ViT+AH0JavjiORitf4cp/Z7rIRRCzLkle8JZg7nJ2NrCuanxGT48c/oz7O2OpL81hrwttUBo2Nmp2/KXsgxTwBKKDlEctFgpU9bgV/KibuNaK+B+p2Lxydhi135DXDSCyUHWV7jRrqE1wRLStlKMqypc7kZC6C7NC2y5GQHP/LEmBYgsfsg1CoTn/PDBlo3t6kNv3Zh8jYBcrOYV580cKzDeApNQYQZ7d/BGbweoVUMiwU4GFO1a2xyVHKHN8JmFqwZ0vrwegw6WHqbHM3a5shxOSXi8XkYvzfz6KmEcZC2jSJ/DsvxdDLjICauMTRPuqu1KrH2GICyVorKrIoB6Gt/LqUrnQuwB4iIvukwOnUD8KRIeWntWUuL98CFGt1TBU1XxezAeZSlb4ViBb/KGtS8VLWOZvzI5PvGw4PQMVFGGQjlXskB6fRPxLD+4JDNFLiGfjpSqKQW/XDHWoP13NymnOJWT4TYXL18uoYCDgzwl5GOCyiWBbPihcsWH1RCfMQgBrH0y5h7B9OE7NT8MqhI9Vw+ZYYf12urlQ0K3HcRDUP1CAb8uN3YQGq4L5AbyWHGdVgveatPopH2DrMUwCGkecQ15zVZCizx++Bz7QQl44Qw7l7U2uPxglNnC0hrRcK4h+sRpyg8xn9mDy+w==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ1PR11MB6129.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7416014)(4143699003)(11063799006)(18002099003)(22082099003)(6133799003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WXp1V2grUmdzamwydU9RdStXSHBpejE4L25MaG96ZGwvSFlXR0llRGNHV2JZ?=
 =?utf-8?B?WGs1M3MwaVRpMzZHY1JNZk4zb1MzKzVUR0hjeFF2M1BNZmZjL2c5czdrWXc1?=
 =?utf-8?B?c3Z5a2J0amtUWnlTbXpTVVdSNXQzMnh6VU1zRmpsRVJ5OFV2UHVSRG1DZnRX?=
 =?utf-8?B?STFNZHFENFRtVWZhWXF3bmZxaVVBc0h4WXN4SmVScGNGZUtkaTF5ZFJSZ3VF?=
 =?utf-8?B?bEZobkZVTVRrL1hYVE95K2xyVFJRRUpTcGJKQ2xCb3ppTHRxa3loQXB4NWxI?=
 =?utf-8?B?VWViTzlBd2ljU041NTJuY3ZQSFFNK1NWaE1OTGpkc2JoVTFMc2pIOXlXRWhY?=
 =?utf-8?B?VHRSSnhRQWxwL0tMWW5PQm5Mb0JwZEhsZTVGaXpKZUVnY3lDejE0NW9MWUhj?=
 =?utf-8?B?cEVFSDJGSnBJNnQrNndtMWVqcEs3eW1GUWhSUnUrcHZZZkNRTFJyUlQxRXFU?=
 =?utf-8?B?ZVFmUkg2T3ZaR1o5T2ExOXV1a0I4Q3B1VmJWUElLcXpIbVh5R21MQlZRUUkw?=
 =?utf-8?B?SlBsYzRNeG9qcW5UeDd6ZkZ3N2UvOElzRHlRS3MxcFpFQUxNUU9ma2YyQ1My?=
 =?utf-8?B?OFRmTHZ5YkUvNzBhOWIxUDdCU01hRnhIZWFpUzFsaW1FZFp2Um0wMjBxQ0Y2?=
 =?utf-8?B?YzkyZzhoNml5cXVnVDdnNzhrazI1citPd2RPWlFQTnMwQnVBWHRXOWtETFFK?=
 =?utf-8?B?ZUZxaFZnK2hrVkxCTmtVZmFNbWViZGpNVUpXQVkwTU55SkVFQlhSOE00cVA3?=
 =?utf-8?B?LzF0WWpRT3F0SzhHaUVCMVZINFViVUJQbkdsRXNiUWFxU0wvdzU5dnFpZFBq?=
 =?utf-8?B?b1VKMXB4YXIrbTNBRXQxYUdjNkdyVllhKy9HVzhSUFMwZkFLUC9EL3J3TFJ2?=
 =?utf-8?B?alhZQ05XKzZ0ZDJnalVON09RZWFtR1EvcmxxanlRVFpqYUZIWFhVWGtlalRT?=
 =?utf-8?B?ZERvcXJjSXJ5U3hVV0p6d2puNGo3bExiV3dEK3E0UE9uUGJtOVJ4QTdBMXY0?=
 =?utf-8?B?ZUJ0T1hxZ092ZW1nN0d3a0xZU0tocUY0OWRsN3FsY0M1QzdpNEp6ZDJMenBJ?=
 =?utf-8?B?a05jRnNGU2VJdDljSXdHbjd0SFZaTFVWTW1uQXAvekgwNWlDMjEwODI2bGYr?=
 =?utf-8?B?QWtlaWJCV1hQRDhVUEhBenhWaXlTZ0ZpN1JTOEd3a1gvUVNCcWNKRWJKOU9X?=
 =?utf-8?B?ZkErb1Z2ZTRDK1VqZThiUkNwbHZ5U1dNVlJJanpkcHNyd3Zkdnl5U2JrVWZT?=
 =?utf-8?B?K1FqWTUwMEJvbkhGMUZUQzNMSGsxNjh4SUdZK3F4b2htNnVOM294WkFkZzE3?=
 =?utf-8?B?VmlGZmFVQkN0NWhDd0NvWmg3YXFPVUF1YzJ2MFBSeUxTV0hTa3UyNHMyWjhk?=
 =?utf-8?B?TFNwdHY3bjBSM1dqNGVhYXJHVjlRUWU3ODZCREhNeE1OUk5UV3hxZ3hpaTdZ?=
 =?utf-8?B?U3JJRzVUamNGSnV3ZFNlM0c1aVhMR01LYzFnbTNWRGZXNlNUVUJJUjJDYmgy?=
 =?utf-8?B?ZnJMUnBrNndGTnprbDREZ0ZYL2p2S0FkMGtxb1FkQjBtZW9qcmZWZVNMNFNz?=
 =?utf-8?B?WXM5S04wdi9jYUJqckhGak51MkNxKzBUY0c5WW1WcFl2bW40YWxOL01wUGI4?=
 =?utf-8?B?VmcycmZKbitNWHo5S3k2aFM5UFpjOHlnMGZYUE1VNENqUFc3aVNoZi9xUWNH?=
 =?utf-8?B?YTBLNDFveDdqaHFKWm8vOE9SV0hnQzhsS3BkL0xzWlBpenlqa2I1eE1mK1hV?=
 =?utf-8?B?eTVublJid1lBeWRHVHZpY3lmWDZ3YmEycFlrbzRUK1RSTklvZE8wV1p3QjNn?=
 =?utf-8?B?UEhaY1RtYVBDZXRwSitZeWNnbFMvcGVYYTlZRS9yUG9sMFVWSU9OU2NIeEto?=
 =?utf-8?B?U3VyQjk2L3l5NnFmTGp3RE82dTZXS2RkVmV4UUx0bDJOQ2NDMEJDelUxcmI5?=
 =?utf-8?B?ejlrY3F2TmdvUm1WNXhOaDlGelM5ZmVYMWRhQTNBeEw3S2xIQytzZWxma2Vn?=
 =?utf-8?B?ZFUya0tOVkZNNTdQN29VclU0em5RYVZzRXRlb3VmRzRpeHhNU0szS3pMTjBO?=
 =?utf-8?B?K3JWcXFVUmtLSVlsVlp1THE4Q1grNkcwMEMvcGRESWw5d0JoL0pnem0xdW5H?=
 =?utf-8?B?K2piNU9sbnFJV1Voc2dSM0dtK1JZWGMzZVRmZ3NreVczS0JyTEpWRnVUdTJi?=
 =?utf-8?B?djBGZlB5aWl0R0Z3UlNoYkNQcS9sdS94RzMxK0FVcWw5SVlQN0M1WDcwSzFX?=
 =?utf-8?B?YmVWV1dyMWpIdEg3VGZEVG8yOTJlS0FabGJ3UFBGUDJKTS9yMXMzZEFCZzdw?=
 =?utf-8?B?a0tWMnhnT1dLc2NIWGZTekZsM1VCaThHS3ZjREhIVGdZNCtEK3UyN0V5VjdB?=
 =?utf-8?Q?+ayHZCrUjs5DHjWI=3D?=
X-Exchange-RoutingPolicyChecked: OaUHc44+GW6Vw6GdbTJpdKImPO2z1vCNlvS6P2XAV++psCQ9bO7PZFUeSAzEiYUmsGU5sVPTk9tenKODKEcXVruqhzfXueGKXjPG0E9LqsdUcneZkIyzryAEvC7ncgBiJc/KrJfIcb5JaG4K496wA5lsIq+xJB+Kn3nLtvHObHpAnBMbpRoB4Kobe7tmaACHRKdFjOFrmbJ2MDrVdQPmyguP/uJcuaK/rtTKk9eDyi0ABP/2tw0LFGIFm1lMKris84R+bh5S5omhaltpGLJ7B4P5xrVj6PQ61oANIzgJGY/0AXN7oiA437Bwp6cLCf8j0XAHbKQBzi1MF2zFljbIPg==
X-MS-Exchange-CrossTenant-Network-Message-Id: fd72ede6-df0e-4ac2-c09b-08debfbf8cae
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6129.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2026 09:24:15.6662
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oWcz3mR/apzHFk0UQe+KJl2BnkPdaRFdd3rw+UmpbC22MBKIkrf1p3rdeERLyIGnRlxr2aMLQuLZlg3RS2z3i1snGrtxT4NwXTQGFrPNa6A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4535
X-OriginatorOrg: intel.com
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[30];
	TAGGED_FROM(0.00)[bounces-110547-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_TO(0.00)[linux.intel.com,amd.com,igalia.com,gmail.com,kernel.org,ffwll.ch,suse.de];
	FREEMAIL_CC(0.00)[emersion.fr,intel.com,kde.org,collabora.com,bootlin.com,linux.dev,Igalia.com,igalia.com,lists.freedesktop.org,oss.qualcomm.com,kernel.org,gmail.com,poorly.run,somainline.org,vger.kernel.org,amd.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,igalia.com:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[chaitanya.kumar.borah@intel.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: CC20961C75D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 5/29/2026 7:16 PM, Jani Nikula wrote:
> On Tue, 26 May 2026, Alex Hung <alex.hung@amd.com> wrote:
>> On 5/26/26 08:17, Melissa Wen wrote:
>>> Only consider affected colorop states those that are part of an active
>>> color pipeline or a pipeline that is about to be activated or
>>> deactivated in the same atomic commit, i.e., colorop is in the chain of
>>> old/new plane color pipeline property. To cover color_pipeline
>>> deactivation, remove the condition for plane_state->color_pipeline.
>>>
>>> Signed-off-by: Melissa Wen <mwen@igalia.com>
>>> ---
>>>    drivers/gpu/drm/drm_atomic.c | 67 +++++++++++++++++++++++++++++++-----
>>>    1 file changed, 58 insertions(+), 9 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
>>> index 170de30c28ae..4fb3a23e862a 100644
>>> --- a/drivers/gpu/drm/drm_atomic.c
>>> +++ b/drivers/gpu/drm/drm_atomic.c
>>> @@ -812,6 +812,59 @@ static int drm_atomic_plane_check(const struct drm_plane_state *old_plane_state,
>>>    	return 0;
>>>    }
>>>    
>>> +/*
>>> + * This function walks old and new plane state color pipelines and adds all
>>> + * colorops in use by @plane to the atomic configuration @state. This is useful
>>> + * when an atomic commit needs to check all currently enabled or about to be
>>> + * enabled colorop on @plane, e.g. when changing the mode. This also avoids
>>> + * including colorop states that are not part of the atomic state.
>>> + *
>>> + * Returns:
>>> + * 0 on success or can fail with -EDEADLK or -ENOMEM. When the error is EDEADLK
>>> + * then the w/w mutex code has detected a deadlock and the entire atomic
>>> + * sequence must be restarted. All other errors are fatal.
>>> + */
>>> +static int
>>> +drm_atomic_add_pipeline_colorops(struct drm_atomic_commit *state,
>>> +				 struct drm_plane *plane)
>>> +{
>>> +	struct drm_colorop *colorop;
>>> +	struct drm_colorop_state *colorop_state;
>>> +	struct drm_plane_state *new_plane_state, *old_plane_state;
>>> +
>>> +	new_plane_state = drm_atomic_get_new_plane_state(state, plane);
>>> +	old_plane_state = drm_atomic_get_old_plane_state(state, plane);
>>> +
>>> +	if (WARN_ON(!new_plane_state || !old_plane_state))
>>> +		return -EINVAL;
>>> +
>>> +	drm_dbg_atomic(plane->dev,
>>> +		       "Adding old+new pipeline colorops for [PLANE:%d:%s]\n",
>>> +		       plane->base.id, plane->name);
>>> +
>>> +	for (colorop = new_plane_state->color_pipeline;
>>> +	     colorop;
>>> +	     colorop = colorop->next) {
>>
>> This for-loop is used 5 times in this patchset. How about a macro in
>> drm_colorop.h?
>>
>> #define drm_for_each_colorop_in_pipeline(colorop, pipeline) \
>>       for ((colorop) = (pipeline); (colorop); (colorop) = (colorop)->next)
> 
> Is there a reason struct drm_colorop reinvents lists and doesn't have
> struct list_head node?
> 

I believe that's because the "next" colorop is exposed as a property (of 
the current colorop) to userspace. Since the chain is already described 
by the property, a struct list_head would be redundant.

Harry, others can chime in.

==
Chaitanya

> BR,
> Jani.
> 
>>
>>> +		colorop_state = drm_atomic_get_colorop_state(state, colorop);
>>> +		if (IS_ERR(colorop_state))
>>> +			return PTR_ERR(colorop_state);
>>> +	}
>>> +
>>> +	/* Same color pipeline as new; no point walking old. */
>>> +	if (new_plane_state->color_pipeline == old_plane_state->color_pipeline)
>>> +		return 0;
>>> +
>>> +	for (colorop = old_plane_state->color_pipeline;
>>> +	     colorop;
>>> +	     colorop = colorop->next) {
>>> +		colorop_state = drm_atomic_get_colorop_state(state, colorop);
>>> +		if (IS_ERR(colorop_state))
>>> +			return PTR_ERR(colorop_state);
>>> +	}
>>> +
>>> +	return 0;
>>> +}
>>> +
>>>    static void drm_atomic_colorop_print_state(struct drm_printer *p,
>>>    					   const struct drm_colorop_state *state)
>>>    {
>>> @@ -1591,11 +1644,9 @@ drm_atomic_add_affected_planes(struct drm_atomic_commit *state,
>>>    		if (IS_ERR(plane_state))
>>>    			return PTR_ERR(plane_state);
>>>    
>>> -		if (plane_state->color_pipeline) {
>>> -			ret = drm_atomic_add_affected_colorops(state, plane);
>>> -			if (ret)
>>> -				return ret;
>>> -		}
>>> +		ret = drm_atomic_add_pipeline_colorops(state, plane);
>>> +		if (ret)
>>> +			return ret;
>>>    	}
>>>    	return 0;
>>>    }
>>> @@ -1607,10 +1658,8 @@ EXPORT_SYMBOL(drm_atomic_add_affected_planes);
>>>     * @plane: DRM plane
>>>     *
>>>     * This function walks the current configuration and adds all colorops
>>> - * currently used by @plane to the atomic configuration @state. This is useful
>>> - * when an atomic commit also needs to check all currently enabled colorop on
>>> - * @plane, e.g. when changing the mode. It's also useful when re-enabling a plane
>>> - * to avoid special code to force-enable all colorops.
>>> + * currently used by @plane to the atomic configuration @state. It's useful
>>> + * when re-enabling a plane to avoid special code to force-enable all colorops.
>>>     *
>>>     * Since acquiring a colorop state will always also acquire the w/w mutex of the
>>>     * current plane for that colorop (if there is any) adding all the colorop states for
>>
> 


