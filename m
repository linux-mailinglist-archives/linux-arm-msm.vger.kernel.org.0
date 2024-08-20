Return-Path: <linux-arm-msm+bounces-29153-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 032C1958F9A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Aug 2024 23:17:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 79A621F238A2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Aug 2024 21:17:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 125281BA87C;
	Tue, 20 Aug 2024 21:17:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BluVxZAJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63F4C15CD64;
	Tue, 20 Aug 2024 21:17:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724188672; cv=fail; b=P0aqzs8thSkwtu2LeN06GQGrc0l5M0ev416zkwC60qnWm43hXVDlNBGV9tK61XZsvzm03NroCgUagyypQL60zw8lXQZbGnOmndWOlPeioqDr1TsWre1+gnx//hiqfHdr7gPrXQD6bM0RPsUQ5fUeplyKgxqZXrLj3dRjcHr/bUU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724188672; c=relaxed/simple;
	bh=v14gBqXrybSHFeC1YjGJWEAfL2KN0sXXAPE1JE0FRZ8=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Va6b+S9lP+awq0u4p8JzNAvG70Q+ln+CUJrf3zkDhjUxZ/P5xo8k/LPEGeT7rzjuqbUnFkjHEL9g8Tx+eoSz02/rojo5wsQ/lWWwCy4RbXD6mb9tpqITlD+227DnNwh+I+QyofwRneUQnVzhosi1Qa5GqjRLFBxHQ06yNWKlo7g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BluVxZAJ; arc=fail smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724188670; x=1755724670;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=v14gBqXrybSHFeC1YjGJWEAfL2KN0sXXAPE1JE0FRZ8=;
  b=BluVxZAJPOUsA4rPQE358ijTqX1b0WYsblk5Aay439NpQTouJt4XcfG0
   HAT5n+wcJ6oU1Ou3exuvAoSTI7V8f4eOgFpAAryHyKtu1sLMmuqn2EBVy
   qGFOEH/jYYohGb70O1h2PkGSuVF9txbjb6ky0WVOdD98vbsP50Izse74p
   GHCGCVjzPRlOb5/4ZiU/k96IPASmB0Ilna79azk+35GtsiOb4yRK/C+M0
   kW+g6GL+03rOp/E9jUFkxLgT+9AJeQBpZt2q7EZv6DXHPD2g9c3djnxyN
   TXdE85bT3zI+kHbHw2KmPd1LprptQtq1zBc/LhMxJEDqdz0WBjfjSTM2Y
   A==;
X-CSE-ConnectionGUID: D5r7+FI+R/61aFNPwuMmVQ==
X-CSE-MsgGUID: G+md4Ik7QDSOEobUSOjsYA==
X-IronPort-AV: E=McAfee;i="6700,10204,11170"; a="22704438"
X-IronPort-AV: E=Sophos;i="6.10,162,1719903600"; 
   d="scan'208";a="22704438"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2024 14:17:49 -0700
X-CSE-ConnectionGUID: 1s6o6AMoQZmiSG1XSut47Q==
X-CSE-MsgGUID: /BIIHrA8SAyaNJFsz8d6pw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,162,1719903600"; 
   d="scan'208";a="61182471"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 20 Aug 2024 14:17:49 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 20 Aug 2024 14:17:48 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 20 Aug 2024 14:17:48 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.172)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 20 Aug 2024 14:17:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A9eYkTWFiR1f8rYtDQhKI1M+o7lh3CLOm9gbXX6G1gDtrMbrf9QlPcoeTE1orI512OimjNr+4LEd+IT80vKM1eLW89I+udDD6kVogBZYknCCdSyQSVj2/VvTLEbI5zQRnePgZ/2LQqkiNW7i372T4v1lSt7Obl61+BYUNC3FiRCJ2dvT/ZhoJ9RQN8oUx+KLorVDLDr7QCbu7/AoqmE+abbTcPTjmCgr2S6EDTe9/agbkqbtW8bC+KHwlV5IUnxL6TZmOrMk2GyrbcAXEsojZLfkTIBGemhneP6dJNhicqFK0d32jrWdsxi4zgNOck1TukutZJztjGydoQa2uFK3Hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PiPq/zaKBsDnKjtcvOGRK5VVdwVktHC89RUpVgc6RxE=;
 b=YeG/G85X7NqGMAs9dcUEi2LnmFQNm3LamzzpWKjHlwVPAZOf+vFoqRozqeD5Cb6riktl6rlbiRaxLo8wZxWT/G/exKZSo1qdmKRL39gaAUMQZAVn3gZXNsAow8HZZRa3SBCgOf4on7fb/ne1/qCYXg2mYBtXBcBpXkh5RrdTVcj9rdIScMvDALuJoIgTbgmfOOVjfk4Mh4hY74Uw4pgUmfmF7YixMT1+2KZxhjK0YHiwS50mEWV7wf66Equzvhsku0ZyEVsnLYzBVNI9DzO7VW401jPKGYyJ6UShpop4S0EETMzuUC0/I2ESL58zLBl9JZLKQ1I2qqXho6q4RyJB+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5089.namprd11.prod.outlook.com (2603:10b6:303:9b::16)
 by PH7PR11MB6607.namprd11.prod.outlook.com (2603:10b6:510:1b2::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.20; Tue, 20 Aug
 2024 21:17:39 +0000
Received: from CO1PR11MB5089.namprd11.prod.outlook.com
 ([fe80::7de8:e1b1:a3b:b8a8]) by CO1PR11MB5089.namprd11.prod.outlook.com
 ([fe80::7de8:e1b1:a3b:b8a8%2]) with mapi id 15.20.7875.023; Tue, 20 Aug 2024
 21:17:39 +0000
Message-ID: <9e70d070-0f7a-4bff-8105-d76dd9c12426@intel.com>
Date: Tue, 20 Aug 2024 14:17:37 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 7/7] net: stmmac: dwmac-s32cc: Read PTP clock rate when
 ready
To: "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>, "David S. Miller"
	<davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
	<kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Alexandre Torgue <alexandre.torgue@foss.st.com>, "Jose
 Abreu" <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Vinod Koul <vkoul@kernel.org>, Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit
	<hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, Richard Cochran
	<richardcochran@gmail.com>, Giuseppe Cavallaro <peppe.cavallaro@st.com>
CC: "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-stm32@st-md-mailman.stormreply.com"
	<linux-stm32@st-md-mailman.stormreply.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-arm-msm@vger.kernel.org"
	<linux-arm-msm@vger.kernel.org>, dl-S32 <S32@nxp.com>
References: <AM9PR04MB850617C07DDFFEA551622F58E2832@AM9PR04MB8506.eurprd04.prod.outlook.com>
Content-Language: en-US
From: Jacob Keller <jacob.e.keller@intel.com>
In-Reply-To: <AM9PR04MB850617C07DDFFEA551622F58E2832@AM9PR04MB8506.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW2PR16CA0049.namprd16.prod.outlook.com
 (2603:10b6:907:1::26) To CO1PR11MB5089.namprd11.prod.outlook.com
 (2603:10b6:303:9b::16)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5089:EE_|PH7PR11MB6607:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a876d85-0638-435f-0599-08dcc15d8593
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014|921020;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VGFTLzF1Q1E1OG13SEhSeWl0M3E4Sk45aEVpcE1XZDFOMEJwaFJDd2M5UEhn?=
 =?utf-8?B?Q0wrc2NsTHdZUGxVVzFKWm1DaGJBRHI2UUJDWFd2aEYrRGlHTG9kRUVhZWl1?=
 =?utf-8?B?bzZPZHpVTGd5SS9XNVIzSk1pTVZ5cytBVWgzSzg1dnpiYzZjdndLN3ZRNkp4?=
 =?utf-8?B?QXBGazBpdmg3U283UlBENHZXYm1jNHZUdWpMM0xXVVFjMmxnMktBTkZDNzlo?=
 =?utf-8?B?YUprNCs2VFIwRkpyTUlzdWl6NkdUeGJvQm9ZcjlPSjM1UCswbmZDWE1sTStr?=
 =?utf-8?B?K3ZUNytYSVpmbEY4WE5uOWl3K0ttMjlDaXJiZEF3cjBSVndLbUhKMTgzZmt5?=
 =?utf-8?B?Q3JDcWlOa1lrMFVXRmxkazVjWnNsdTBVVlFVcFVDV1hVWTgvNDliWHhlclV3?=
 =?utf-8?B?dFVkSitmaHhPanBEQXVKc0pZRGI2djRYbWtOUmNBU1dmbXFHSXhwZk5kVXQ5?=
 =?utf-8?B?SXg4cXBkVkVMK3FsamttdnRJTytHNzYrVWNURjJmampjZlArRkNROFpmRmtl?=
 =?utf-8?B?K08yc3I5Y29pV1ZXS0VDMEhnSHBhR3ZaNE5EZTZuOUJpbXBlcnNEeWdrZlFw?=
 =?utf-8?B?NmJ3VG9kb21JcjFKMVRZVmJwV253M1RFUy9LTFNVKzRLcGtEMFpRbjgzRGpv?=
 =?utf-8?B?OEtaTmVyMzBPcEZlQXFhM1ZrY2pJcjhQMjVxZ00zOXV2Z2pDWkFFblo3MXMr?=
 =?utf-8?B?dzNjVHFkQXAycFBHZ0VGdjVJMlUwT29SMVNwbytJd1NPWHB5NklxTk1LVkIy?=
 =?utf-8?B?UFFMVExJMnNvWlo1c2MzQXBiOENFM2dja09Nb1IxbTB3Z2N0QUhYYzIxWkxS?=
 =?utf-8?B?S2V5ZGIrTGhhcW52azFVK1ZXZkI5SUdIVU9DTmN3cFdPcDVLZFZKRHV3Um5Q?=
 =?utf-8?B?amZPNEhGVzA1UVJUVDVQY1dmNmo0cWUzUllvTDdQMXZKWnVuTkpEajFvWlFi?=
 =?utf-8?B?eHFYRmtQRysyeEZ0UGt6Zm5pYjd6bjVNaXJCakpJSFhHd0NMNTFFcUxOSkxz?=
 =?utf-8?B?cllpa2ZyUVk1aEFaYU92R3A4WFJWS2dDdENuZFZieUFyNnBHZjlva08wZjUz?=
 =?utf-8?B?R2xzdERLZHliY1NtYzZsbklKVGdHZ01Ta3M5L05tN0piZk5wMHJJV3doLzY3?=
 =?utf-8?B?clhnb0JzM3pkSFpyTllKblNCVEZpZnBKcGc4dlBPaWwrbHJaN293RWR5UEds?=
 =?utf-8?B?RkpwbjRiRkNmSXpMQUMxQzZ3SkpmZWJFa01KNHNSY3VYNisrYXREcGh1blU1?=
 =?utf-8?B?Qi9lVGhsY0xQMkFqbEM5YkYvb0ZXdStqUHcwVklOditSYWNJRlB2d3BoK0wz?=
 =?utf-8?B?QlRiaE0zNytDWnVYLzN3d1VZREZYVFhzMlRQM0VZbnpzdVQzSlJFZDV1c3Fm?=
 =?utf-8?B?NGp5TWx1aFh3RzFQa2lLOWpYUXhFSkxPTFVJaE5aYUhOQWVBOUlyU3ovNE84?=
 =?utf-8?B?NysvMXAwRWtKM0xMRWFOWnpKODU2Nzk3YmpORjBMdVdFSEc3KzdYTWpZOHBD?=
 =?utf-8?B?cS8vNjV4YzRVQTNEN1EzcHA5OS81bHZxQVF5VkUxNmhjRWY0dlBIQUVVZGtw?=
 =?utf-8?B?ckhNVlZTcXBSL1FwYWQ1ZEU1U0lkOTNkaXRDd3MvY1lMM3BheFN0cy81NVd4?=
 =?utf-8?B?eFp3UHhYTGVyMmJZMmk1MGtDSlBuLytLTkh4RHlNUnJZWGZ4M1FFTEwrQUJS?=
 =?utf-8?B?bHB0cjNrbFJzZHZtSDkyWnUyUlJvZnlPYkxjcjk2Ymx0cW5kVVJJZTZ4MWtr?=
 =?utf-8?B?QnhIVHVLa3dGY0FXaTI3QXd4ZHpEM1VhOU54bkRIbHFaYy9ldm1jQTFoUnpi?=
 =?utf-8?B?RFhSQUpyMzY3T1k1TithT3prMmZSYlBBMHE0V05KRWxrbGo2ek9HNEdyMkJu?=
 =?utf-8?Q?Ok6gBrtyn1VIB?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5089.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U2ZPMW44V2lHNmJJMjNmVkp3bG1tNFZTV1FmVHhKUU92ODRyR2JDdDBFSExJ?=
 =?utf-8?B?M2JnQ212OVp1QlplV3NFajN3S1RkSW9XNmlSV2lyYlllNGw4eDBRM1M3anFK?=
 =?utf-8?B?cEJoaWgrN1FRUWNsU0sya0trdk12STBJTHEwNG84SmdsZmNhZkUzQnBVUlRD?=
 =?utf-8?B?bHZobXgzRkdVc2w2K2prVno2aEhxOUhtdGhCcGZPZDV5L0NoYUJ6cE00U0lL?=
 =?utf-8?B?N1hWUGJFejVubjNnbTB5UGFrN0VBQ3pqQnloM2E5KzgxbWlCa1dtWkR4clRq?=
 =?utf-8?B?dVcvQ3dnN3NBVEpWLzc5SnJRZVdtRFgxOS9WZGZQeURrUmhGaWw3VU5kYlR2?=
 =?utf-8?B?b2FNUEZtbHNvTGZ0ZTZSazdYT3lEeHVVSzkrRkp1MDlTS3dwWkxqQURZdFJF?=
 =?utf-8?B?dGpDM1NmMFd4aWVscGNrRTIxWjNSZWpnMnFyOEhJSVdzeEU3UGJVNHBiNlpJ?=
 =?utf-8?B?d0laeXhaU0NmRnZIellJaEJ6Z3BDZS9TTE9BcXYwT016ay9JaDl0YlQ0d1d6?=
 =?utf-8?B?Q0oxeEpJMWhramFwd1Fsb2xkT3UwYzRtOEVOU3NmSkQralBndFdhYmd5THFo?=
 =?utf-8?B?ZnU2cGowT2tod1JtdExORHNBU2pGTERwSmJwOG5OaTJsRVZiY24zOXBxbCt4?=
 =?utf-8?B?elJyQ2phK2VhM0o0K0Y2RHFxUEJUUkpQZU5NbW1ZS3J3enlpOXdvczRxUU1X?=
 =?utf-8?B?SXh1dGdMbVlURkpRL3EvUktyZmJCbjhDdVNubkJVamtESGx2R0VvVVNPUlZa?=
 =?utf-8?B?WDcraWkrNHBXTEhWWFdHV2ZMcWZTaEh5cVcvMzhiRCtpQXFWMHM3KzQ1ZmJN?=
 =?utf-8?B?MVB2TS9zVXdPcnF2RTFEN01BNXppc0R6NWk3bjBib3ZQWWt2dHZVZVhiZ1pt?=
 =?utf-8?B?cWp4L0tsc2V1UHVVM2ZqdC83RHdkUGVnL2tZZlNjU3JyYUN1SU9KeHVpUnRS?=
 =?utf-8?B?eXMwcHdRSStQcG9jWDVWa0k4VHJqMUlodU51eG1hRUVuWFJiMXIzQUlqZ2JH?=
 =?utf-8?B?Um4rRWdKaUp4LzV2Wll2SjVjc2xHRnI1SXowei9aY0VDeWNmRTVqMytlSUxK?=
 =?utf-8?B?QmRrdGx1OHA4Sm91ZTIxRS9sYm5SOHpKWWZvbjJrRTRncnY2bTY4amI0b0xn?=
 =?utf-8?B?SFh6bHFYZHYvRUFnMHRqeXdQeVpsbUlENkNrbUhORVBzUDlYbU1iK2xBbGFP?=
 =?utf-8?B?cDJLMFhmbzRSS0IwR3c4U0xhQ2wwTXBqZjg4Zy9ZZE1NaENWK2t1RjQvNWps?=
 =?utf-8?B?VHdiMEg1K3NqajM2c0YzSlRqUUhBaXROSDFBaExaMUZzNGlzMnpjZVRJdDBo?=
 =?utf-8?B?bTdLaTcwT3pab3UrZkxYUFh2ZFZUYnRYUEdUSDlGRHlRY083RVJ2aHV3SGY5?=
 =?utf-8?B?SnNUSnZxUkhWYk96VEhIZXh1aVlyQU94Q2pXQ0pwZlJWL04vRzh1TmpBSFlz?=
 =?utf-8?B?THFMVFBSNkdEOGVZZEZlUUllR01vRW52R2VEWGFaTFpMNUovcEFWUHhmd2J5?=
 =?utf-8?B?YkpqWkpjdDFFbGtRam9nK3RIdTV3OTA1Y2VPUmxvUGN1RFJXTWY2WlpMQkx2?=
 =?utf-8?B?TzgzUGtwZUV6eWhabUNocFhwYTBjRkVKVHlDZkFHWDIxS1RWbTREWjQ4VGQ0?=
 =?utf-8?B?ZjJmWkxxZGlPbm5DZG5JWnlobzN1QWI0cHlMdFRibHZLUFJRN0ZCMWVXNVZ0?=
 =?utf-8?B?RGZVeHlYdDJ5dXhIOUFyaHlYTUNCSnU4SVNiQWhQVk9rQkNKMkxmb2dFbldx?=
 =?utf-8?B?UkhLL3NBemNpM1ZueTlXQkk5SWxFeFVnNWo2ZWk2UGRjOFgrVDFqbjNYVlpX?=
 =?utf-8?B?YVF6R0p0Vy9SWFdheGgxT0V0dnFlUjlFT1Nkam92SUpyaXQvQkMyZlhualpP?=
 =?utf-8?B?a1Z1RXJkZ2o3RElLKzBaT3BrT2FQTS9USk9QWmRyQi9ZaUZyNHFIeGdEYXll?=
 =?utf-8?B?RCtQRE5LanVHVjRJalJLR1VJQWxBZ3ArUkpCQVE2TzVzTnJ1TisvWjBNbXNa?=
 =?utf-8?B?YWdUQXloaDBVYjFIUWRUUGxUMGZHSVVseEM0bDhRK25KSHZMY0lpcCtQWHBO?=
 =?utf-8?B?b1dPMFNqSjUxODNrZ3I2amVqb1V0VTVkb1JMa3dFNE9yUE5tZU1UcENWMWl4?=
 =?utf-8?B?eWJML1hWdE0renRQbDNhcm9JbXZYekZWdzJxM21iZGFUUUN2Q2xTK0tITmh3?=
 =?utf-8?B?MHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a876d85-0638-435f-0599-08dcc15d8593
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5089.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2024 21:17:39.7910
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0PYqVRmPIMMj9zZP5iizq+2msCLeFRqOa3VQ+WoDqBkPHIZDKUMxgUnHJXc1ETIxLkZfzCvcV2sriSAtInvezklKlXU9nUjppAaf7lYVfjU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6607
X-OriginatorOrg: intel.com



On 8/18/2024 2:52 PM, Jan Petrous (OSS) wrote:
> The PTP clock is read by stmmac_platform during DT parse.
> On S32G/R the clock is not ready and returns 0. Postpone
> reading of the clock on PTP init.
> 

Ah, I see. So the clock returns zero into the hardware bits accessed by
stmmac_platform. Then you come back in and fill this in later during the
dwmac_probe.

Reviewed-by: Jacob Keller <jacob.e.keller@intel.com>

