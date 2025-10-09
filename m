Return-Path: <linux-arm-msm+bounces-76642-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E74EBC9033
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Oct 2025 14:29:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BB5423A9319
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Oct 2025 12:29:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D419D2E2286;
	Thu,  9 Oct 2025 12:29:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MCn92TbF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C44302E62C0;
	Thu,  9 Oct 2025 12:29:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760012969; cv=fail; b=uHD8OUmTWevDSu6ecR88uc16wxW2JYDjhMamqxx5rpjY5O933bGauBQFFAntLP6N6Jk8qQ3pd96xy6pQUTzsGg2DyqAaM7ULo/rbONpzvcr6F3SuyLrQWGXD9txBBbADC2AHKNwqKJZF1LHCNlwoc1vS4a+SIMDuQQKrjlx0fh4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760012969; c=relaxed/simple;
	bh=o5LzBlqWPkZ0WjFflKH2dHe3ea+WT6LKjIfdyF+enh0=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=o8qHHWnxuvM2pGUkwTXBhLitZIqi0UA2Umzh1rTNrPyuV3TyrGErBiMkus0IvgKdjvi+9MK5LMO6UK8s0ElP4M3Qx40wGUeizsINppTZjy+lfDtAeRD548VHhUb9EOIwHvrMsCUj2nhBz3Fz1/FA3XpPG6OmQzQZoN4JyeWEHiY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MCn92TbF; arc=fail smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760012968; x=1791548968;
  h=message-id:date:subject:to:references:from:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=o5LzBlqWPkZ0WjFflKH2dHe3ea+WT6LKjIfdyF+enh0=;
  b=MCn92TbF6WjOUoyv9wCg5Gy0i6bDB8XGrzLvYKydE5S+7yeKbhRKTD9s
   P+vPu2dPXrWMl11kBowwdOcDfLokNYdKTLgavIfnA/rokSry3mHbGLo5o
   w3sdrgRahq+vnNqHl1M3L778hCD/1yfzbd/7zBtiT1dDoV7/FurPoxgSG
   DNXRW1goZBzuGfkEw4P2qjrRzE7Va2ntfzanikWabmeZt+7twUK6Jsat4
   KqLN/oG+M676KcVyQn3pkRxjb6w8Nj3TS7MXgKyhnjCuAO+uXtQOKNyqK
   Gv4hXrZnt22vIR+tBNTbJ8yYddVXJaDB9KIT/8h+V6Sw6ktTiu4q81i/U
   Q==;
X-CSE-ConnectionGUID: BK55GDbuQDinozUE41rO7g==
X-CSE-MsgGUID: Hf/PpsDcROe+FbE6p4Ve4A==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="66047461"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="66047461"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2025 05:29:27 -0700
X-CSE-ConnectionGUID: rcLWwltPS/yF+Or4Rr7G2Q==
X-CSE-MsgGUID: fTbMxNmMRquX6mtikanoxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,216,1754982000"; 
   d="scan'208";a="180278295"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2025 05:29:27 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 9 Oct 2025 05:29:26 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 9 Oct 2025 05:29:26 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.66)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 9 Oct 2025 05:29:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RDsmiuoNJYYk4H7M7PGZ7mypwweD/CwJRJKSXigQjekN4pBP8YX50WqlVzkKvqZtdIqQZCVo32HrLYOl41wQovElJkeWunzqyFWgpK3jhjiS131n/EHkU/GmWevPtJDDKJWjCgIOmUzofcN7DNugpEA5EUj7f0d2gqfe9K3day8OVfu6FZfxvvUxUCq0xFeX58Ok9ofqf4wsPETfomvCDk5SGNUe7mp2PN0q710PNipxA/YYmtooVVe87l3FdbUnzgJtXnYeP1aFy8lnDT2moK/ecVP6IPS0I5uWFSeDm9BsClgXCJS6SK1V1vO25SoysDIaiy6K0PLMD1uF1K1g8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HyafPyVxXhaDwqGz2wUl3jQbWLS2HcmMwmxmJENlALU=;
 b=McLH+knyCOHDLtrFOd5TtZ+XHmk1uObYIPL+4N9MqhdQRQBHJ2u7EWqJUcIdOCTAww4AA0TfVH0Z/aTH8uVu1Xhe9UVaXQjQZVL4HoOFisIjSaGgz7ZvbQzu8HABUUStXgrsZlp/0CI1MbQ9hEU/zjTYqbLMbHPVSthU3czk7NitxUnYfZg9iDUnxwDyD34/UN6JSRNr4mSuDQ+5UiJXxCLOQpfHlSlBE3bBUIm58AicnTB8+M+f4Rpr58Zi+V78REKGcnKZ26Kk2S6EujTTd5187FIA0j5jPt1bMhFSwQkkbO/7SAHll/GBkXOSxLkFss0rtqcfYKwgXh7dQ6AzzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7198.namprd11.prod.outlook.com (2603:10b6:208:419::15)
 by IA3PR11MB9157.namprd11.prod.outlook.com (2603:10b6:208:57b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.10; Thu, 9 Oct
 2025 12:29:25 +0000
Received: from IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::2c4e:e92a:4fa:a456]) by IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::2c4e:e92a:4fa:a456%3]) with mapi id 15.20.9203.009; Thu, 9 Oct 2025
 12:29:24 +0000
Message-ID: <f4363815-a5bc-4f5a-80a1-7d4a17ad539b@intel.com>
Date: Thu, 9 Oct 2025 15:29:20 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mmc: sdhci-msm: Enable ICE support for non-cmdq eMMC
 devices
To: Md Sadre Alam <quic_mdalam@quicinc.com>, <quic_asutoshd@quicinc.com>,
	<ulf.hansson@linaro.org>, <linux-mmc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
	<quic_varada@quicinc.com>
References: <20251008110758.718944-1-quic_mdalam@quicinc.com>
Content-Language: en-US
From: Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park,
 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 -
 4, Domiciled in Helsinki
In-Reply-To: <20251008110758.718944-1-quic_mdalam@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DU7P251CA0008.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:10:551::21) To IA1PR11MB7198.namprd11.prod.outlook.com
 (2603:10b6:208:419::15)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7198:EE_|IA3PR11MB9157:EE_
X-MS-Office365-Filtering-Correlation-Id: 17b1bf7b-8ed7-4328-3d99-08de072f7b31
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aXhWbXRkcGtUS2dqRmxPUEl4YUVtcXJIRjdvRWJJWGFEMjRQZlFWNTBYVUYv?=
 =?utf-8?B?WGh4Ynl4QVE0THVqKzRsaVVQdGdLYyszZ0pLaTYrLzBMeHlHVmZiRDM0dGhO?=
 =?utf-8?B?d0xrVUFkMTB4N05DeGNQVzVlVkJwYnplckozblhzejJDQXcxVzhYUXkyZFZy?=
 =?utf-8?B?SExsS293Z3l1enpWV3BJZ0RGa3N0ak9HWGUrcm83c3ZFRTVrazdKZzFOL0Fh?=
 =?utf-8?B?WGR3YTF0MlVSU1ozbXg3TlJIOGJ5dSttMGtpR2thTWFOTjFUV21Rc2VKZ2VW?=
 =?utf-8?B?Z0lBRy9JS2ZhcU1VWk5lR2tDbDZTRzAzV3QwckRXbEdRYU9OT2tSQ3Y0b2ps?=
 =?utf-8?B?Vy9mTmRKcFNaZHhES1dlejVFdzRVbmpoNWFmYnRJUEVIcWd3TEliejlxdlRU?=
 =?utf-8?B?NXhnNlRISjBiZHpicWlzS2YwSmJPWHlWZjhtRWZqa05FSk5DOVlUbEpYU2xI?=
 =?utf-8?B?cDBpeitPMlZJam9GMEJ6VS9oc0lBQVRTUTZJVkFMMXlSRURCbmZqUUhUbWdi?=
 =?utf-8?B?T3Q3cEYydE13V2NGVi8xVkN1eUQxSmt5Nk8rRjVoNnluV2ZSNnpCVnBZQ2dv?=
 =?utf-8?B?Zlp1YzNYQVRIUVpzemdjN0xDZXdNT3dxMEUrNHc4YWlMVnRCQ3BQOXYzcG9V?=
 =?utf-8?B?d2x0VkUwMSt6OE9vZVRBSnZuSnVyNzVMTU9zVFdlN2Z4TzFTQTFKTjN4RDRU?=
 =?utf-8?B?NUcyMVRmdVVUN0NXUWJpdkw1aldQRFloSDkyRXJsNVhmVUxtYUU5a1pMTy9y?=
 =?utf-8?B?Nk9Id21yY25TbzVSVjZ1UjJjaVQxVkJWYzRRVzc2VzduWnNZTWtQMG5wdk40?=
 =?utf-8?B?c1RreFdGcVJkU1RHdG1vRU5USHJzN29ka3VmT2ZvZm11aXI3b283L1k2eDJI?=
 =?utf-8?B?TzBuWkFaNFFldHZYcEkrai9uUkZNRUIwbW80R2hrWE15dis0VVBzdWlqV2JO?=
 =?utf-8?B?bkZjekFPVzcyUGZGSVFDY2E2NG4yOFlKWmtleEFGbTM0Yk9jcWxNYm1oREFX?=
 =?utf-8?B?UmlOWjF0UkVyeDcxL1UveEltQkNicnVmSUxvTDgzdTRZcm9uemxxeHZwUXJV?=
 =?utf-8?B?TDgxM3Q0SDhlWHZ2T1dTSzhvcCtrMEc1cFJwZ3ZkWWxGQldSb29uS3V0ZU9I?=
 =?utf-8?B?Y3ZkZzhPNEJoUStCNHVjQURmcmZ0U3hDV2xlYkJocnhvMk95OTRweGpQc1Ax?=
 =?utf-8?B?NGhKbnhiUGhRT1FtVmQ1NkxqVU5rR3RTRDBaWnh4SC9hUDZEdmttdVZnNmNy?=
 =?utf-8?B?VExQSnV5d2VrWEZGNGVMdXFSVGVsOElEek9DK3VISTBoMjQxRldxNUkxTFVu?=
 =?utf-8?B?aUNueVNCUmdvTWlkSitzVW1YcTZzb1RFSkhtNVJncVA3TVRGRDZUY3EyU00y?=
 =?utf-8?B?U1RGL2lWUXRNT2Y3cmpsak1OMzRaY1pOME1aYzY0UEFFQ1V6ZWRTNEQxd1Zw?=
 =?utf-8?B?SHJHQm9zQ3Z0NFJRSlR0b0ZBZ3pZdmpObVVSMjQvTlhVM1hCTnZ0VFIxWTc2?=
 =?utf-8?B?M0k3ZTFYTTMwMkZuM2M0V3NmT0RraUd5RXp3Z1FtakpEVENaTVVPV2VsT3U4?=
 =?utf-8?B?Q0cxMktoeXhYMnB4WEd0aWpzUlNIWVJSa2s4K2xLRWJwTk9UY1B5WmhuN3ZN?=
 =?utf-8?B?UStXQThlZm4yanQzUDFCWUZHOCtsYS96UnUwUUpJSHlPMzRRVVBVTmJUdTBP?=
 =?utf-8?B?amhYKzBEWHBmbXJKN2xEY1JuZ1VzbE8xMWFqMFhXcTZwQ04vK1VTWGRpSW1Z?=
 =?utf-8?B?UUhZOVA5UG9EQS90Y294QVgzRUFKeXFYYUQ3OHlWbXVBcGVrMnF4ZmRrUXll?=
 =?utf-8?B?VkhLR001MUVqSXF1YTgzRXN1bVV2QjRTdHI3bUp1ZXdXTVdpVWJaS043b3BH?=
 =?utf-8?B?OWhhUk1MMFZqNk83NCtUa0l3SVZqUm9XU2ppOWIva2NDbHdRZi8vSjNOcGpR?=
 =?utf-8?Q?T+kq34DscWNJPlivoK94kzkejw5I9bWk?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB7198.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cWllZTNHdVpVcVkvRlB6L2Z6N3kzaDJENG1ic0tJQ1E4ZHZsUndzSm5Gekwy?=
 =?utf-8?B?UlZGeTZua1diQk9ybUhUR291TmtvWDM3cVhpZFRsaU1CL2pPSFVERlpBdE0w?=
 =?utf-8?B?WWYvSTA0OVpRcWYwQWxmeGdpbTdRdDMwYU9hczQ2L0xXWE95ZXJUV05ONFdi?=
 =?utf-8?B?WjFmc1p6WjRZWUZKN09KUmpQeVBQZmU2Sk5VYTNvMXpINTZsZDhiZmI2T1dG?=
 =?utf-8?B?enozV3pkUmE3d3hnQnc3YWJTWkhLLzJVTnhieG1DQW9YUnU4YnArVS9ZQm5R?=
 =?utf-8?B?VnBPUDVqUmFSWFlIMSsrT0trbytzOFZFelJzMTNWL2NYekU5VjBEcWF4RGtm?=
 =?utf-8?B?QkZSMnVkRnNTRmFINDhDZlVxTDlBdklCN2RUN014bGt4cW0wRnJNOE03Wmti?=
 =?utf-8?B?SnhTVjcrTlBFaFI4VmpqTkVoUEovemJ6bUZWSlArYi84UHl4bVh4Y3dXaEpL?=
 =?utf-8?B?c1lmRG9BSjNodTY2NTFQYTBHQ2FyZmoybi93THpIZWpHSkRBQ1JsempndUZv?=
 =?utf-8?B?Y0Y1cmRpTW1MMDl6RFdVQ0RSWjJQWndwVjhjbmsvK3dpcXhFQXdDSzVFV1BB?=
 =?utf-8?B?OXJ5R2RNN1VidGhUTlY5M3FGOUQ4MCtQbWxVcTRLUUkzNWcxeGxjMEpEWUdk?=
 =?utf-8?B?RllvdS94Z2x1aHZKQXIvbyt5S1dqYXc2ai9UQldVdlJuOG9LcENrb044RHpz?=
 =?utf-8?B?bW5hdTdqWWJyQWN6d2x3eGV0N055Y3RybnptTk94TWcxSE96Mm9ESC8wVUtP?=
 =?utf-8?B?c3JMMkVNTkhjV2IrbmR5djlCdnJuY3JzZ1lTNVZPZWEvcFlXOXJEVUxKQnZ4?=
 =?utf-8?B?eUNMWXRwMnJMbVA3V3RrRjMwdmZvc0dGY0xUaXhRNHIrQ0NST0p5djFhK0hl?=
 =?utf-8?B?TFZxYlVDMlljY3lSWkdFSWthOUswRGRucEtJSVRSZzd0eXRBVSsxQmJJRHo2?=
 =?utf-8?B?bGkxaC9JTzdwa2NlUDJiSGlEMmlXQUJnMWJ0Z0V6cFdaNENtYXlLNDJjOGo4?=
 =?utf-8?B?blZsNG9qbTVLbGprY1k2M21HU2JEV3ZsVzh5MFpzL2IwK0xoMXJpdmFvRUp6?=
 =?utf-8?B?VkxxdkJTazVqeWZvWmVXa0JoallyZWg1YVBDa0ZaTmx4UTlUTGh4S1daOS9a?=
 =?utf-8?B?RHE2eE1RWEVpZi9tSTNGc0prejdRSzdkZXZJakJvSW1IM2UwUGVKaWtMRjZL?=
 =?utf-8?B?ZXhCS09CQTVEU2Fkb0FKVFpiT3VScnNJSG5tVHhGV2ZyNjBNd2Z5bVlHT0Yv?=
 =?utf-8?B?SlZPUzY3Y05TRG1jTmRhRUJ3S1BkUjdtSk5NdENqWWtEbGx2MUQrRk9NS2g1?=
 =?utf-8?B?MjRPdlQreGVwdDhJZlVjaU5POXZZSVVrTGxyTHFkbkEyZlpOMnNrNHc2bEZU?=
 =?utf-8?B?QS84OEhESnB4WW91TjRwOERWaWtMeE51NUNWQWQ2dzJYQk05T29ZcUcxSjA5?=
 =?utf-8?B?dTd3a2dzWGI2akkxbHVMUlhuRjNVS1dXOGVjcFVjd2VWRjZUQlgvVkZ3c3RN?=
 =?utf-8?B?cGxlWGwzQ21uMUlOdS9zY3ViVmI4ekc1MDhXcWtRQk41S0ZsSVJqc2dYb2JN?=
 =?utf-8?B?Mlk4bkdzQ0psbmM0SGJITnJSL2swR20weGJBemNmcnlUZ3UxZ3VSR1UwbGMx?=
 =?utf-8?B?V0MzM1NSYTVlTkFDUy9OdnkwWnd4eWI2bGNidG9lTmxNb0JOeHJtNFZGc1Nu?=
 =?utf-8?B?b09VTXIrcHJFdTJXL21GVmtsRkJqSnQxdk1HYnN6akZrbW9vZjFoSzQrN1NV?=
 =?utf-8?B?VlJ4L3lEMEdCVnZyU2pzUzlGT2ZzV3lSQmdDL0xVaTJYWTYvekZ5b0hLMHRs?=
 =?utf-8?B?NjFmZllOQUkzdWh6TXNyMlVkb08rSktTWHhyRFNkbkdzMThWVlB6eFEvMWhl?=
 =?utf-8?B?WUZkdHVOSXpidXpXcGRzajlYL0xSNFd1Yzd5Q3kzbEZkNnJCRUJzM1BkOEVs?=
 =?utf-8?B?WjJHQlVIZFU2bVZtaWJoVnBXa0tSSFFQZzFLTVdTWFc2cFViWnJ2YStWM0lk?=
 =?utf-8?B?emdKOXp2TGNKSDBWUmF3Q2s4Mkh4M3pwUU1TOGkxb0czbytlVHUxNURHM00w?=
 =?utf-8?B?dHBnSEg0NENsaVBhaEx5T2lZNFJ4ck5WdFZ5Smt5Z0ZEM2lFTnBKbVV2Qy9Q?=
 =?utf-8?B?ZkZIbmY0aWZFUi9PRTdLR08xVUhPSmtIdkVVaDRVcjBxU2o0Q01mdTg1S0tB?=
 =?utf-8?B?cHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 17b1bf7b-8ed7-4328-3d99-08de072f7b31
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7198.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2025 12:29:24.8499
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8Ot8WOenpbrRKkLc1MMjgNnLns+3Sh52cc4XPChG383MDwSEMDA4rfpecXrqDJjZFtCH0bJ3kKhBmKWfc+WUhQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9157
X-OriginatorOrg: intel.com

On 08/10/2025 14:07, Md Sadre Alam wrote:
> Enable Inline Crypto Engine (ICE) support for eMMC devices that don't
> use command queuing (CQE). This allows hardware-accelerated encryption
> and decryption for standard eMMC operations without command queuing.
> 
> The changes include:
> - Add non-cmdq crypto register definitions
> - Implement crypto configuration callback for non-cmdq operations
> - Initialize ICE hardware during host setup for non-cmdq devices
> - Integrate crypto configuration into the main request path
> 
> This enables non-cmdq eMMC devices to benefit from hardware crypto
> acceleration, improving performance for encrypted storage operations
> while maintaining compatibility with existing cmdq crypto support.
> 
> Signed-off-by: Md Sadre Alam <quic_mdalam@quicinc.com>
> ---
>  drivers/mmc/host/cqhci.h     |  4 ++
>  drivers/mmc/host/sdhci-msm.c | 74 +++++++++++++++++++++++++++++++++++-
>  drivers/mmc/host/sdhci.c     | 20 ++++++++++
>  drivers/mmc/host/sdhci.h     |  2 +
>  4 files changed, 99 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/mmc/host/cqhci.h b/drivers/mmc/host/cqhci.h
> index ce189a1866b9..9bf236e27675 100644
> --- a/drivers/mmc/host/cqhci.h
> +++ b/drivers/mmc/host/cqhci.h
> @@ -119,6 +119,10 @@
>  /* command response argument */
>  #define CQHCI_CRA			0x5C
>  
> +/* non command queue crypto enable register*/
> +#define NONCQ_CRYPTO_PARM		0x70
> +#define NONCQ_CRYPTO_DUN		0x74

Since cqhci is not using these, they might be better in sdhci-msm.c

> +
>  /* crypto capabilities */
>  #define CQHCI_CCAP			0x100
>  #define CQHCI_CRYPTOCAP			0x104
> diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
> index 4e5edbf2fc9b..2204c6abb3fe 100644
> --- a/drivers/mmc/host/sdhci-msm.c
> +++ b/drivers/mmc/host/sdhci-msm.c
> @@ -157,6 +157,23 @@
>  #define CQHCI_VENDOR_CFG1	0xA00
>  #define CQHCI_VENDOR_DIS_RST_ON_CQ_EN	(0x3 << 13)
>  
> +#define DISABLE_CRYPTO			BIT(15)
> +#define CRYPTO_GENERAL_ENABLE		BIT(1)
> +#define HC_VENDOR_SPECIFIC_FUNC4	0x260
> +#define ICE_HCI_SUPPORT			BIT(28)
> +
> +/* SDHCI MSM ICE CTRL Info register offset */
> +enum {
> +	OFFSET_SDHCI_MSM_ICE_HCI_PARAM_CCI	= 0,
> +	OFFSET_SDHCI_MSM_ICE_HCI_PARAM_CE	= 8,
> +};
> +
> +/* SDHCI MSM ICE CTRL Info register masks */
> +enum {
> +	MASK_SDHCI_MSM_ICE_HCI_PARAM_CE		= 0x1,
> +	MASK_SDHCI_MSM_ICE_HCI_PARAM_CCI	= 0xff
> +};

Preferably use GENMASK() and FIELD_PREP()

> +
>  struct sdhci_msm_offset {
>  	u32 core_hc_mode;
>  	u32 core_mci_data_cnt;
> @@ -1882,9 +1899,47 @@ static void sdhci_msm_set_clock(struct sdhci_host *host, unsigned int clock)
>   * Inline Crypto Engine (ICE) support                                        *
>   *                                                                           *
>  \*****************************************************************************/
> -

Unnecessary to delete this line

>  #ifdef CONFIG_MMC_CRYPTO
>  
> +static int sdhci_msm_ice_cfg(struct sdhci_host *host, struct mmc_request *mrq,
> +			     u32 slot)
> +{
> +	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
> +	struct sdhci_msm_host *msm_host = sdhci_pltfm_priv(pltfm_host);
> +	struct mmc_host *mmc = msm_host->mmc;
> +	struct cqhci_host *cq_host = mmc->cqe_private;
> +	unsigned int crypto_params = 0;
> +	int key_index = 0;
> +	bool bypass = true;
> +	u64 dun = 0;
> +
> +	if (!mrq || !cq_host)
> +		return -EINVAL;

It should not be possible to get here if (!mrq || !cq_host)

> +
> +	if (mrq->crypto_ctx) {
> +		dun = mrq->crypto_ctx->bc_dun[0];
> +		bypass = false;
> +		key_index = mrq->crypto_key_slot;
> +	}
> +
> +	/* Configure ICE bypass mode */
> +	crypto_params |= ((!bypass) & MASK_SDHCI_MSM_ICE_HCI_PARAM_CE)
> +			 << OFFSET_SDHCI_MSM_ICE_HCI_PARAM_CE;
> +	/* Configure Crypto Configure Index (CCI) */
> +	crypto_params |= (key_index & MASK_SDHCI_MSM_ICE_HCI_PARAM_CCI)
> +			 << OFFSET_SDHCI_MSM_ICE_HCI_PARAM_CCI;
> +
> +	cqhci_writel(cq_host, crypto_params, NONCQ_CRYPTO_PARM);
> +
> +	if (mrq->crypto_ctx)
> +		cqhci_writel(cq_host, lower_32_bits(dun), NONCQ_CRYPTO_DUN);
> +
> +	/* Ensure crypto configuration is written before proceeding */
> +	wmb();
> +
> +	return 0;
> +}
> +
>  static const struct blk_crypto_ll_ops sdhci_msm_crypto_ops; /* forward decl */
>  
>  static int sdhci_msm_ice_init(struct sdhci_msm_host *msm_host,
> @@ -2131,6 +2186,8 @@ static int sdhci_msm_cqe_add_host(struct sdhci_host *host,
>  	struct cqhci_host *cq_host;
>  	bool dma64;
>  	u32 cqcfg;
> +	u32 config;
> +	u32 ice_cap;
>  	int ret;
>  
>  	/*
> @@ -2185,6 +2242,18 @@ static int sdhci_msm_cqe_add_host(struct sdhci_host *host,
>  	if (ret)
>  		goto cleanup;
>  
> +	/* Initialize ICE for non-CMDQ eMMC devices */
> +	config = sdhci_readl(host, HC_VENDOR_SPECIFIC_FUNC4);
> +	config &= ~DISABLE_CRYPTO;
> +	sdhci_writel(host, config, HC_VENDOR_SPECIFIC_FUNC4);
> +	ice_cap = cqhci_readl(cq_host, CQHCI_CAP);
> +	if (ice_cap & ICE_HCI_SUPPORT) {
> +		config = cqhci_readl(cq_host, CQHCI_CFG);
> +		config |= CRYPTO_GENERAL_ENABLE;
> +		cqhci_writel(cq_host, config, CQHCI_CFG);
> +	}
> +	sdhci_msm_ice_enable(msm_host);
> +
>  	dev_info(&pdev->dev, "%s: CQE init: success\n",
>  			mmc_hostname(host->mmc));
>  	return ret;
> @@ -2450,6 +2519,9 @@ static const struct of_device_id sdhci_msm_dt_match[] = {
>  MODULE_DEVICE_TABLE(of, sdhci_msm_dt_match);
>  
>  static const struct sdhci_ops sdhci_msm_ops = {
> +#ifdef CONFIG_MMC_CRYPTO
> +	.crypto_engine_cfg = sdhci_msm_ice_cfg,
> +#endif
>  	.reset = sdhci_and_cqhci_reset,
>  	.set_clock = sdhci_msm_set_clock,
>  	.get_min_clock = sdhci_msm_get_min_clock,
> diff --git a/drivers/mmc/host/sdhci.c b/drivers/mmc/host/sdhci.c
> index ac7e11f37af7..2d636a8ee452 100644
> --- a/drivers/mmc/host/sdhci.c
> +++ b/drivers/mmc/host/sdhci.c
> @@ -2202,6 +2202,21 @@ void sdhci_set_power_and_bus_voltage(struct sdhci_host *host,
>  }
>  EXPORT_SYMBOL_GPL(sdhci_set_power_and_bus_voltage);
>  
> +static int sdhci_crypto_cfg(struct sdhci_host *host, struct mmc_request *mrq,
> +			    u32 slot)
> +{
> +	int err = 0;
> +
> +	if (host->ops->crypto_engine_cfg) {
> +		err = host->ops->crypto_engine_cfg(host, mrq, slot);
> +		if (err)
> +			pr_err("%s: failed to configure crypto: %d\n",
> +			       mmc_hostname(host->mmc), err);
> +	}
> +
> +	return err;
> +}
> +
>  /*****************************************************************************\
>   *                                                                           *
>   * MMC callbacks                                                             *
> @@ -2227,6 +2242,11 @@ void sdhci_request(struct mmc_host *mmc, struct mmc_request *mrq)
>  
>  	cmd = sdhci_manual_cmd23(host, mrq) ? mrq->sbc : mrq->cmd;
>  
> +	if (mmc->caps2 & MMC_CAP2_CRYPTO) {
> +		if (sdhci_crypto_cfg(host, mrq, 0))
> +			goto out_finish;
> +	}

It would be preferable to hook the >request() callback e.g.

	host->mmc_host_ops.request = sdhci_msm_request;

void sdhci_msm_request(struct mmc_host *mmc, struct mmc_request *mrq)
{
	if (mmc->caps2 & MMC_CAP2_CRYPTO) {
		etc
	}

	sdhci_request(mmc, mrq);
}

> +
>  	if (!sdhci_send_command_retry(host, cmd, flags))
>  		goto out_finish;
>  
> diff --git a/drivers/mmc/host/sdhci.h b/drivers/mmc/host/sdhci.h
> index b6a571d866fa..9ac32a787270 100644
> --- a/drivers/mmc/host/sdhci.h
> +++ b/drivers/mmc/host/sdhci.h
> @@ -709,6 +709,8 @@ struct sdhci_ops {
>  	unsigned int    (*get_ro)(struct sdhci_host *host);
>  	void		(*reset)(struct sdhci_host *host, u8 mask);
>  	int	(*platform_execute_tuning)(struct sdhci_host *host, u32 opcode);
> +	int	(*crypto_engine_cfg)(struct sdhci_host *host,
> +				     struct mmc_request *mrq, u32 slot);
>  	void	(*set_uhs_signaling)(struct sdhci_host *host, unsigned int uhs);
>  	void	(*hw_reset)(struct sdhci_host *host);
>  	void    (*adma_workaround)(struct sdhci_host *host, u32 intmask);


