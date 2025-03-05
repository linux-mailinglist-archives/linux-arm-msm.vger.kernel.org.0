Return-Path: <linux-arm-msm+bounces-50385-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DF8AFA505E3
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Mar 2025 18:03:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2B4363AB311
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Mar 2025 17:02:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B11451A070E;
	Wed,  5 Mar 2025 17:02:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ax3GRm41"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A48F1ACEC6;
	Wed,  5 Mar 2025 17:02:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741194138; cv=fail; b=iG3z73662yv17Fz35Os0ArBRhk977DIyjIvE6ElDAcV7xSaCzaTnabfF8uCVAVz/NQvcyUNeNfsQNXNshtdtshju3Xgu1SrvzluVZ9JHbQBG+CIUA3IT+ZRcCWnxdYG5gjrVyzCG//LaitI5y3Ihf5ReFGHguMHJjN91twwuMm0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741194138; c=relaxed/simple;
	bh=FSkmCUuMgrKNxYLCDHuxi0g732at2s7LlZodHKgnjDM=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=QS4FKJZKAEAJxim0w3G27l6KADB02YqO47K3OG85vR8knDH9SOBMcaxxHpSaxoyPqWX0uHRGv+eUABwNotJNg9f9qOkARbuiqxY8k6WNseJ46zGmx2rkhjLJfJCLqGSb2vgV9U38PhHYxnbyq9D6ZA9gA9DtrjPZ0RgzIbNqTlM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ax3GRm41; arc=fail smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741194136; x=1772730136;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=FSkmCUuMgrKNxYLCDHuxi0g732at2s7LlZodHKgnjDM=;
  b=ax3GRm41+a3eVR/lkDZPZ9BZZPu+IjL2AEPKRlY6L0q5t2FHC9oniyuo
   u9A0cVuTIJO91tQApq5I8/+6lY/KWFjQWcYa06u0a9ItQp0pN0i7leI9x
   iOFwTbR5tM6Ev+1idn79YQjF/SeIaiBbMvFyvcnKLDGWDDuc2ETaZiYPp
   UIYsQNj4N/fJxGL8A0USi978ExMhnJF90M911D7P8HBkfMTvbj1t02Lz/
   4werp3j+TKSV6RZtFf8JmKa6ITD4tbx+hLYlqmXOWlCfkph9vAJf+a+Nv
   CJFRspchqHj/cuDUGGfGKyIG4/+TYbPUPCCYGMNiJh7mP/CHd9lB7dVOf
   A==;
X-CSE-ConnectionGUID: lzC4bpz8QYmXDBX8B+LNIg==
X-CSE-MsgGUID: SAMIAAdmTue/bxGI/2RDag==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="42192347"
X-IronPort-AV: E=Sophos;i="6.14,223,1736841600"; 
   d="scan'208";a="42192347"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2025 09:02:12 -0800
X-CSE-ConnectionGUID: HdG+lqJ7QgGNYAbjDPQVwA==
X-CSE-MsgGUID: TxstsODJRheILD2EtILW+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,223,1736841600"; 
   d="scan'208";a="149512860"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 05 Mar 2025 09:02:12 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 5 Mar 2025 09:02:11 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 5 Mar 2025 09:02:11 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 5 Mar 2025 09:02:09 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BldEPwF9lvOA2cIDYCsTAscA7jlMmf5LPN9dVxhGUi5C56ki2/b9W9f73a49sP99GqBUNhvOAzAFlaLMXOxnTm/vEB7PVpwWM5q/6D0P92LTca9ZkJY2TtazNEbxF7+7oT33XbsTRAoMOwQkxgjc+yMm0PHUnrtPr5EngVqbkOHGpr/C88Vc93wTR39POeQvpaOHG4bhyo9CLvnApJ2bb1iXxdJmDjBGXGU+Mh/UZVZcJ0koIOtwiab1FjCDNieB+nJXRd4L1QvHnmT/vdCeP3P6KWTnJsO3YnreEoCJh/uvQT+VjFtfG3YitiO8iGENyXR1ENWBvCakqY/f2nQqkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CqcyerwlTeqVfBeuGOw5HVQ1MWIyOHXhoJgdUAv4mQM=;
 b=q2WBCyGYNSXcRA2PqNY2Jw9jYAPfrdqKqsSQ+WXPzfLBDg8kXZgVEkF9eAcsbGnxVuKdBLWAr7w5w7kr3x8uMhmflDiZdlBPciEortoFkvNwzoPQCJ3M2icg7thmWcRHNKvz/fCD6bzXGze19IRDNGEYQfwVcOirzVjvr+95BATVJaLLI0BcIrgVAz0rW/4Q+bP5NsxHE8wNJMnYEKdUJGGXRAIYMMIHHBxAJyKY9vtMjPB6AxRonGQ0oBvRVByZgjEvIqBNEITYYkjhs4lE2DHCm7+XwDYKxrYrJLRgpGNVqTqfeOmGgFDoDTLcqgrVQ/LE03Rn+uJnnhe0U/Vz7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB3605.namprd11.prod.outlook.com (2603:10b6:a03:f5::33)
 by PH7PR11MB6547.namprd11.prod.outlook.com (2603:10b6:510:211::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.17; Wed, 5 Mar
 2025 17:02:05 +0000
Received: from BYAPR11MB3605.namprd11.prod.outlook.com
 ([fe80::1c0:cc01:1bf0:fb89]) by BYAPR11MB3605.namprd11.prod.outlook.com
 ([fe80::1c0:cc01:1bf0:fb89%4]) with mapi id 15.20.8489.025; Wed, 5 Mar 2025
 17:02:04 +0000
Message-ID: <d0945da8-de9b-4906-b5fc-b7cd55c6bdb3@intel.com>
Date: Wed, 5 Mar 2025 19:01:52 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] mmc: Avoid reprogram all keys to Inline Crypto Engine
 for MMC runtime suspend resume
To: Seshu Madhavi Puppala <quic_spuppala@quicinc.com>, Ulf Hansson
	<ulf.hansson@linaro.org>
CC: <linux-mmc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-msm@vger.kernel.org>, <quic_rampraka@quicinc.com>,
	<quic_nitirawa@quicinc.com>, <quic_sachgupt@quicinc.com>,
	<quic_bhaskarv@quicinc.com>, <kernel@quicinc.com>,
	<quic_neersoni@quicinc.com>, <quic_gaurkash@quicinc.com>
References: <20250211100807.26170-1-quic_spuppala@quicinc.com>
Content-Language: en-US
From: Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: PL 281, 00181 Helsinki,
 Business Identity Code: 0357606 - 4, Domiciled in Helsinki
In-Reply-To: <20250211100807.26170-1-quic_spuppala@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: ZR0P278CA0029.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:1c::16) To BYAPR11MB3605.namprd11.prod.outlook.com
 (2603:10b6:a03:f5::33)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB3605:EE_|PH7PR11MB6547:EE_
X-MS-Office365-Filtering-Correlation-Id: bfd21ebc-09f2-4ac9-f308-08dd5c07728a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cXltT2hRbnJXY3E1YU4xb2RicUs0RmVUZXI4YTU2M2h1UkNFbGlIQlZwYUJx?=
 =?utf-8?B?SCtNYlk4VEx4emYrUElISkJGZ1JMODVaWk5OMVpTRUdTOXNTck9wY1Y1L0hr?=
 =?utf-8?B?Q1NBOEtjU0xzOUUwR2Zxblp6NHl1cGpGZEtuTnpxNlZYL1JOMWFkNS8vVytv?=
 =?utf-8?B?UVJHeFZpcjJuRGtQcVhpbG5oTzZ6dXltVkdCRU1JTFV1VkRYTmRuQXAvNTNo?=
 =?utf-8?B?ck1NWEZPMk4xSlcwUkwxTmRCQUgwdDhSbGp5THVkcGlPSFZqU00weTBLZndE?=
 =?utf-8?B?QTlSMzRDOUhtNDYwT1NXWm5wZ1Y4MXd6eHJNcTBMNVZNU2RGU3FUK3pTRWhm?=
 =?utf-8?B?RzVnUWEwV1RyK2l6L0lyRE1XZGFXZGI1NGZKdDc1bVV0NE1FOUZFSkd5b04z?=
 =?utf-8?B?VWRYTnZrZnUxRm5nci9MR1VlQy9YVmlsTjEyZXlsZDczZzhiM2lhZ2U0WlR0?=
 =?utf-8?B?NkFmZWVIVng3RW9uSFlzMUtuZGxWOFBsMUpwSzNjWHMyQWpJNWVOV1o0YTJL?=
 =?utf-8?B?UkRmcUFsUzRLQkFuY3owTXY2d3NSdEUxTlIrMFgrS3ZJbis3NDdGbDg4MEZO?=
 =?utf-8?B?T1hUYm5vbHJPNG1MNmVHa2F2dGxnMWpjdEZWSGxYTTRYcmE2WEIvK2plY3Jw?=
 =?utf-8?B?Ly9wRjROWDErRWNUWFRJTmxjTmQ0M0IxMTJHS2RuOHpDMi9iUXZpdk5iWElr?=
 =?utf-8?B?aU5UVzY1MFhSMW9VT0dvOFVCS2o1VTZoQkJpY1lmdzVIVzU5NzNDVXlhSHZt?=
 =?utf-8?B?eGhwVFJtQU5vTHFRd2hyL3VmdVNrMW9uU2h6dUxOdFhZQ2IyUnlPV0RMNVlw?=
 =?utf-8?B?S0paSjBkTm1vR2V4K3hSL2lrQnoxRGJvOG9ZaDBxTUR6anFDUlphQzBVbFJv?=
 =?utf-8?B?QlRJS3pIbllTLzhtS3dyNFVWcC9TY08ybXIyYWRwc2FSMVJFNG93bXhrTFFI?=
 =?utf-8?B?V0ZXaWxDN2dRTmhuTHJHSTVpVm9DNVlzRlpyOE56UjE4bkN2bkpueGJVYVRR?=
 =?utf-8?B?SGd5SDJqTzZ4ekc0Tk54Rk4zTTVsSHJFQmRwOEtsbm44T2hQWVZiSnhqcTEx?=
 =?utf-8?B?REVkb2IyTFYzNzlreVorVmdJY1ZoUUdCcGRzSkxKUVd0YnplVWkxTC84N1ZX?=
 =?utf-8?B?bHRYL0ErUmtSOTVQL0NUZHFQSUZnRmZmOGZkRG9BT084alFzc1VaV3YzNXIw?=
 =?utf-8?B?TnJYUzV3anp3YUtFd3h0bnppQW43bmU4U0FONWk3ekJpZnlMbFRSemszdXBy?=
 =?utf-8?B?Rlk0UHN5NXlUMWt1Y0w2c0g4cjNTY05CTjkxT3Fxc015cHFRWisyMlZTUTVG?=
 =?utf-8?B?bDU0TmV6NjlrektFWjh0UURmeklUWWZwT0l1MStKM3hKRmM1UmlHUG5JVHVC?=
 =?utf-8?B?akl2T0VpK3JJVnFzR010N0RNUnEzS3dWb1pIdWdQdXM2QjB5citZMnUvZVM3?=
 =?utf-8?B?eWFGNEpVUUhpN0toUk1lUzQwbmNCYjJkbUxqYjkrbUt3WVYxUnBRRGpORGxn?=
 =?utf-8?B?ZFRjbVJNMnJ3SCs0akdzSm9JdWRSVndWVnVQUmtDYU1EZk92NVJyc2kvZ2Ur?=
 =?utf-8?B?ZFVRZWNYL1RYd2FESitHU1hzZktPeG5iTnNnQjU1ejI5WFVrd29nTlZlTnVh?=
 =?utf-8?B?TjNFMnlIU3lLaGVXYy96Mk5DeUlSQ05oZTNSdk1yNldiekhnTEdMbGZ6VGFI?=
 =?utf-8?B?L3RPRG8vVzIySFg5MHo4WlBLemE4WjNkWVRNU2ZqNm5jc1lSYmtFdGJoWnNR?=
 =?utf-8?B?ekhPUEhldmxLK0JuZ2Z0TUJiVW4wZG9SM01qUWQ2SXdvVmt5ZEFKZ3JvOFlC?=
 =?utf-8?B?ZjhPaG90Q1lXVmRpMWhadz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB3605.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RkxDOXp4MXQ5Z2UyOHAzbGthclg4Z3dNK3BNOUJlYWpaQ3BDazB2RmJFS2xq?=
 =?utf-8?B?bXBOVW5YRUMyU1JnaVFPQkhQTTY2UzBzQ3JPdk9xZnlKNURMbHNqNHpHd3hV?=
 =?utf-8?B?M2Fra01rUGpJQzNjV1M1RjVGdmhHQldNLzJ0bXdYc2x1Q2diczJ0ajJoZXp3?=
 =?utf-8?B?Q0VmTjBDaG83R1paSzBna1RJZ01FeUNkelJOaW1CajNTdVNndkYyMVRKWWNR?=
 =?utf-8?B?bTRqRzJBVjFBYWZWNHVISVNGc0ovUTJObVB1bEcyVThhbldVcXd2Q3lFeXdv?=
 =?utf-8?B?T1dkNGN0TVRaS3NkakRUNXdTcCtKendKclE3Y21TSmN4ek4xcTJ0UFcxSnRi?=
 =?utf-8?B?ZHJuVExxUTlBTE1uMi90emRkTms1cmcvNWdOYm9XUEdxSkRkS3BkSXlIeTlB?=
 =?utf-8?B?Z0VhQ21jRVdGVXRKaHArTmt2Vk95SlBBbC9ZNFA4dmZyNEYrZ3d0Qk9uajJo?=
 =?utf-8?B?bVJPMk5ER1RhVlZ2d1NKVC9QVFgwVGJyN29Zc2k5OWh1Z054Vmd6VGZ6L3dY?=
 =?utf-8?B?bzc2RkJSYWpFd3A0cXh3ME9vaTl5UUFqblFUYlp4VDIzNDBiYUF3L205N0FY?=
 =?utf-8?B?bkhlRFlNSzRCbkRicmhwRlFQelY1UlZ3bkZGVUovb2haTEp3QjZUTEdNOWlR?=
 =?utf-8?B?Ty8zYlVRT2tFd0NEY0NFYWk2Q1BsQStjRVlKc3greU5Ga2F4RC9RRkxBbURY?=
 =?utf-8?B?d0JQajBwa2ZRYkZya3U1UGxoYmMzcTlLb1pGcVhJTlRCQW5rdkl6cStvbEkw?=
 =?utf-8?B?di9MYnRBNHRyYnRYS1VWZHM1RkdPcmgrYXNMNmJ0cGorVk5Ua2pJajFRbDlE?=
 =?utf-8?B?RGxpRVAybTB3OFBCSWk2OUZVL3VFVmY1SkRKdVNLa1owK0tPc1lkdW16S2ZG?=
 =?utf-8?B?MG5kSGI5QUg2ZzV3aGE1NVVYYlppS2xDMVgrTHNwakZTeVRKVk9obGo4SlBE?=
 =?utf-8?B?ZHdpR0Qybm9jQUM2Mm54MkRJRU9vUUJoaVlwczU3NnBWaGdJaU9oNTBvU2Yy?=
 =?utf-8?B?MWMvK1ZjUWE1elk1UXY3WFpNRnUzMkNNbnZPREpweEhMUnNOdy84eURXbkZm?=
 =?utf-8?B?QmVodEdLMzhqV2tQRlJaaHJrNDNhN1J2SkNUV01YeE4xdjdGclozeGkySGti?=
 =?utf-8?B?VmgvM3IwVHRRNldKcUxhOFZUT0dlRG5qemtKSEwwYjBWT1I2RWtUdnEvRTdq?=
 =?utf-8?B?ZjZQbURBbDJFTUt0OFVCdlErdkhJSkpmQUEzeExOUlNRY0lSQTFHb0NUOTJx?=
 =?utf-8?B?WW1DWU5uRUZhdml4VE1PUGUzZ0VDRlB6elQ2dlgzNDNlNlFHQkpKN3kzZlF0?=
 =?utf-8?B?RkR3WlpaeHNrUDlOenhXOEQ3L3ZuQkthWHJFVDRXZGxCM2dzS21vRFZsVmVB?=
 =?utf-8?B?Q0l0NnIvWi96UmZIcU56S2doa0o4SVI0WjdBM3l5U2szbzNLditxRUYrbjAy?=
 =?utf-8?B?cjFXc0ZrcWhQY1JvZENmVStOK2t6TUhSWmgyUUF3NHJFOFVtRVhkdmo0WjVB?=
 =?utf-8?B?dFRTbVQzaGFZaHZCSnI3VEcrMXQ4QnExME9NQ3pzRkd1aWdtSEEvb2N6SUhp?=
 =?utf-8?B?bzNDU1o5NkVoNjFoRE1RQWQveS96ZGlTbmNSVWdxMWgrZ0I0b0tTTExrOEo3?=
 =?utf-8?B?VU5lZEQxMXZ6blh5ck81bjgraGQ3Vk9aV1FRRlJTcUw0YzhORTBmMGRMQWpS?=
 =?utf-8?B?UUtXQ1ZBVmJETS8wcHArVEdUU1hmeDlsTlppZjlhZ21nN240UTF5c1NYem4r?=
 =?utf-8?B?bHZxUWtnLy91Z2prZkNCZjRXTVRyeHdHMG1mdlFPejJadzloMlkvRnh2VlhH?=
 =?utf-8?B?Y2VseCt6S1gzUXNzc0hVcG16QXhIcVBBeis2UlZoakM2SjFrQ2JHc2dWY3ZB?=
 =?utf-8?B?K0JydWtPZXZEYnpGekYyYkZIU2c3NmRVSU0xemp4VHNETWEyUVBzR0cxMW9E?=
 =?utf-8?B?ODVpR3lBaTROTnBqTWh6UUJvRTlCYnd6NHVDcXc3VHlEM0liTXBBWnE5YUh1?=
 =?utf-8?B?OEs1ZHBVTXpHSWt3U1NqZ1E5NGV3LzNaMWxqU0haeDV4ZTJXN2NXNXZ6TTlI?=
 =?utf-8?B?MWpBSGpzb0ZUbUhrb2x6dWF6WC83OHVzM3Rzbm9MS2NnUmJkQmdrL3g1SGEr?=
 =?utf-8?B?bFZPUnFSZFViMWZBem9JeTFMQnkyTVUrVC9TeTdSNUFKbzA5RlhVN2NRWG84?=
 =?utf-8?B?Vmc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bfd21ebc-09f2-4ac9-f308-08dd5c07728a
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2025 17:02:04.1909
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z/7mywD96swhbo+ViSlckqdlriLwpLMasbMz5//JjJsnoqPGa9gaVvn5hNXIQ1UTtJOVA88bw1JgusUdfiYv3w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6547
X-OriginatorOrg: intel.com

On 11/02/25 12:08, Seshu Madhavi Puppala wrote:
> Crypto reprogram all keys is called for each MMC runtime
> suspend/resume in current upstream design. If this is implemented
> as a non-interruptible call to TEE for security, the cpu core is
> blocked for execution while this call executes although the crypto
> engine already has the keys. For example, glitches in audio/video
> streaming applications have been observed due to this. Add the flag
> MMC_CAP2_DONT_REPROGRAM as part of host->caps2 to control reprogramming
> keys to crypto engine for socs which dont require this feature.
> 
> This patch addresses the following:
> - Addresses the comments from:
>   https://lore.kernel.org/lkml/20241006135530.17363-3-
>   quic_spuppala@quicinc.com/T/#m69c9ab538bd9efd54515646952d0d7d1d7c17690
> - Avoids reprogram of keys for Qualcomm SOCs only.
> - Ensures reprogram of all keys on host controller reset.
> 
> Signed-off-by: Seshu Madhavi Puppala <quic_spuppala@quicinc.com>
> Co-developed-by: Ram Prakash Gupta <quic_rampraka@quicinc.com>
> Signed-off-by: Ram Prakash Gupta <quic_rampraka@quicinc.com>
> Co-developed-by: Sarthak Garg <quic_sartgarg@quicinc.com>
> Signed-off-by: Sarthak Garg <quic_sartgarg@quicinc.com>
> ---
>  drivers/mmc/core/crypto.c    | 2 +-
>  drivers/mmc/host/sdhci-msm.c | 4 ++++
>  include/linux/mmc/host.h     | 3 +++
>  3 files changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/mmc/core/crypto.c b/drivers/mmc/core/crypto.c
> index fec4fbf16a5b..d947cd1bbfe3 100644
> --- a/drivers/mmc/core/crypto.c
> +++ b/drivers/mmc/core/crypto.c
> @@ -15,7 +15,7 @@
>  void mmc_crypto_set_initial_state(struct mmc_host *host)
>  {
>  	/* Reset might clear all keys, so reprogram all the keys. */
> -	if (host->caps2 & MMC_CAP2_CRYPTO)
> +	if (host->caps2 & MMC_CAP2_CRYPTO && !(host->caps2 & MMC_CAP2_DONT_REPROGRAM))
>  		blk_crypto_reprogram_all_keys(&host->crypto_profile);
>  }
>  
> diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
> index 4610f067faca..52207873e18d 100644
> --- a/drivers/mmc/host/sdhci-msm.c
> +++ b/drivers/mmc/host/sdhci-msm.c
> @@ -1865,6 +1865,7 @@ static int sdhci_msm_ice_init(struct sdhci_msm_host *msm_host,
>  	}
>  
>  	mmc->caps2 |= MMC_CAP2_CRYPTO;
> +	mmc->caps2 |= MMC_CAP2_DONT_REPROGRAM;
>  	return 0;
>  }
>  
> @@ -2451,6 +2452,9 @@ static int sdhci_msm_gcc_reset(struct device *dev, struct sdhci_host *host)
>  	usleep_range(200, 210);
>  	reset_control_put(reset);
>  
> +	if (host->mmc->caps2 & MMC_CAP2_CRYPTO)
> +		blk_crypto_reprogram_all_keys(&host->mmc->crypto_profile);
> +
>  	return ret;
>  }
>  
> diff --git a/include/linux/mmc/host.h b/include/linux/mmc/host.h
> index 68f09a955a90..d1e6fafca21c 100644
> --- a/include/linux/mmc/host.h
> +++ b/include/linux/mmc/host.h
> @@ -459,6 +459,9 @@ struct mmc_host {
>  #define MMC_CAP2_CRYPTO		0
>  #endif
>  #define MMC_CAP2_ALT_GPT_TEGRA	(1 << 28)	/* Host with eMMC that has GPT entry at a non-standard location */
> +#ifdef CONFIG_MMC_CRYPTO
> +#define MMC_CAP2_DONT_REPROGRAM	(1 << 29)
> +#endif

The #ifdef is not needed since we probably want drivers
that reference MMC_CAP2_DONT_REPROGRAM to still compile.

Ulf suggested the name MMC_CAP2_CRYPTO_NO_PROG which seems
much better since it contains "CRYPTO"

>  
>  	bool			uhs2_sd_tran;	/* UHS-II flag for SD_TRAN state */
>  	bool			uhs2_app_cmd;	/* UHS-II flag for APP command */


