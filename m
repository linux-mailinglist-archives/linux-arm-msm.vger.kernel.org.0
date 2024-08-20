Return-Path: <linux-arm-msm+bounces-29151-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 34353958F81
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Aug 2024 23:12:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DFFF828560F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Aug 2024 21:12:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CF3E1C579A;
	Tue, 20 Aug 2024 21:12:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R/LxPzbr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E42081BE222;
	Tue, 20 Aug 2024 21:12:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724188337; cv=fail; b=lwmww5/rwzUlZs34CjO+6mZ7eJF7lA+g4ArEh3A3Z6j45H3s6pm2KNbQUsBDIIQfWbz4r8OdDcSGiwI3O+sRaqODJr99d9hrafNG6Dk8RqkWE7EEFElSpfy3sZ6n5VwMAV6ZlvyWV4O9dHVQhi+ZPtvF5Cz+23XFKXQzsZrr92c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724188337; c=relaxed/simple;
	bh=aog71gIa+HGsmuTI5a0pwlEhuvEgR21sxHKG1JMtUSs=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=CkJloVVrK+SxMZ81JqCIMskulw1Uqu88rGqyMFIZsFE6qvmxrtt2mltSCTBQRbPDRP5bfxqZyyb6FhPZIF8Q2LrfCRd9iPZXka31XWU0TLcb4Yt3sq8oUj4StDpincg80Q3Ul5InAJvyMRnCwqQTpjvyc5jWnbWBi89FwSVrO6s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R/LxPzbr; arc=fail smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724188336; x=1755724336;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=aog71gIa+HGsmuTI5a0pwlEhuvEgR21sxHKG1JMtUSs=;
  b=R/LxPzbr28qXMXdgvVZtMQRYmfEFIiTV4bWE98Zhn7JSWE8YA1BGGIsT
   jx/sKbVR0V7N8Aqc+456oLqDR75fKNad+wsqVrNWnooBXj7XAf14BUtuV
   tvP99rvg6taEim0G9brn+LBU9N4Vup31Zt5JjLqHK5tD39cW2g4GBs9Zq
   sdjeSIoas5iGd7zlxorvtbnkD4rQEbP5qfu3HQQrqHzXkfYdYeBVq6WN6
   86ESVQ4LgoKQtSkpMktP3dTq0bM5tcRuM1Fb3GtaAADtU2sJw3nWIrDXh
   LWLu4F6op/gm+BwUwwkD60+ILAx0mWlR40Nuv8ki006jLXdotTftyH/2f
   Q==;
X-CSE-ConnectionGUID: L6tbAxlqTdGqgRspCv+3LQ==
X-CSE-MsgGUID: 9zKtKxoOTTOCa1F+Mr5+/g==
X-IronPort-AV: E=McAfee;i="6700,10204,11170"; a="22402018"
X-IronPort-AV: E=Sophos;i="6.10,162,1719903600"; 
   d="scan'208";a="22402018"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2024 14:12:14 -0700
X-CSE-ConnectionGUID: COKiNmz7Q4CUf5pPtSr7Rw==
X-CSE-MsgGUID: R9+AB3j1QPiSItPAtz6WcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,162,1719903600"; 
   d="scan'208";a="61017430"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 20 Aug 2024 14:12:15 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 20 Aug 2024 14:12:14 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 20 Aug 2024 14:12:14 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 20 Aug 2024 14:12:14 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.40) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 20 Aug 2024 14:12:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K6KVRgc7ls59R/y7JLgbthnUAYMByu06BmGyn13yeDJEjk7+ImGyjlIRX2LLxC+G9pN21MDEHLRnATxuEZ9HLdEOMMYjofiQNAossT6Me/CuZz144j2IxClBVwG+FjP9GyWnlLUt3vK8RZOeN6ari4kFCh5R5XiPRh0TDElNHtldXGyrmyDsTjOWY/Q10ruKtsJfK+jXuyMcjXx8Ymbavqt7fBEgIrIWIp9J1FXNmlApNf9NhvDaG0ifOZGSs3J2WpqDySdef56ty/OmdOIfsz3JTA0mGh6KrR0pqSAj2M/fHKubwYoOSgXsmpkK84r2Ix1S+8+hpm8dt9fDMc8VmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r5VazpfWCmuZ+haQU+zEZmF0DsaCWD2sPSNTD7d2ljo=;
 b=Z/sGChuPIOGeC6aijKtBy6/+Ll6MapU6g1gpmkevN6+cBEnP+6d/a1lG8yALZGZ3mAfd/w3xixLp5gkT+FvjMOkzlzVtkXV1x2Wk18as67fkYhl93b//LTNhWYYFw0KhidBk0mgAtIRL/445FyxRzQTR9xZeDsAGoZUWKilKSWM6YPWBp08DB6IUSkXHeD1lS5eXFGlccoCYWHc31JExlJHFUyMgKpDUjsdlczl+E4Uma5602NpvCz3uDEuWA4uc5mE9mDyVsrTX6z423xQfh1cGU42jPFSnDEB95doKl3FVYEE6q5Ca1zdy3a1RMnVPZzWQxPnNP1DTkFp2d9fxUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5089.namprd11.prod.outlook.com (2603:10b6:303:9b::16)
 by CO1PR11MB4852.namprd11.prod.outlook.com (2603:10b6:303:9f::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.25; Tue, 20 Aug
 2024 21:12:12 +0000
Received: from CO1PR11MB5089.namprd11.prod.outlook.com
 ([fe80::7de8:e1b1:a3b:b8a8]) by CO1PR11MB5089.namprd11.prod.outlook.com
 ([fe80::7de8:e1b1:a3b:b8a8%2]) with mapi id 15.20.7875.023; Tue, 20 Aug 2024
 21:12:12 +0000
Message-ID: <7d3c45f2-e1e7-402d-b6d2-a9cd9db987aa@intel.com>
Date: Tue, 20 Aug 2024 14:12:10 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/7] net: stmmac: Expand clock rate variables
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
References: <AM9PR04MB8506FFF6CFF156C2EB1C1AE4E2832@AM9PR04MB8506.eurprd04.prod.outlook.com>
Content-Language: en-US
From: Jacob Keller <jacob.e.keller@intel.com>
In-Reply-To: <AM9PR04MB8506FFF6CFF156C2EB1C1AE4E2832@AM9PR04MB8506.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0364.namprd04.prod.outlook.com
 (2603:10b6:303:81::9) To CO1PR11MB5089.namprd11.prod.outlook.com
 (2603:10b6:303:9b::16)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5089:EE_|CO1PR11MB4852:EE_
X-MS-Office365-Filtering-Correlation-Id: b1bff76e-5a75-4f4d-a56d-08dcc15cc243
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014|921020;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?K0xtS1hVbENxT2JNR3A5dDRqcGlrVHc3bHZWODFqbXlyMnRBeTdNNGpZVk1B?=
 =?utf-8?B?bWh6dEtGSkdmbzVQaDdjZlN0ZDJmbUhRS0N3bWFScjRhY1F0eG1oWXBlT1pp?=
 =?utf-8?B?V0hmRWNZYmZDeDBVa1M4SVVuekc5bURRcXU1KzZ5T0dUdGdCb0NMcjJ0YWlI?=
 =?utf-8?B?cjBhY0lEdHVDUFpjYll4WVE4bFo4cEZZdmRjb2hhRDRHcTh6NHU3TnFQQUIr?=
 =?utf-8?B?VlJ5dDY3dVJZQkRrcDYwTTlSQklzQ0FCZ05yK0xXdjJncVZmOTdhdnh3Q203?=
 =?utf-8?B?ZjNJaVlJR1BzL2VlRUNHYUlBVUpkWXNUbE55MUkwNXgvakh2S3BIRUtpMVNa?=
 =?utf-8?B?RHhVNG8xSTVlbzdxK3VjVlhCZGsrL0hjOEJSNU5HVFFXcEZZcW0rZVFNZEUr?=
 =?utf-8?B?bEJHM1JBUDRpdFE5WXhRMWZXT2dYOGFTcFd4aDRhTTVoRlpXbTR1b2JGaXZz?=
 =?utf-8?B?S1FJYjlBZjFMYTFBUWs5RzJFTCtwbWN3MjhuMlpVZ1MreWcxZmpkRHdZWmli?=
 =?utf-8?B?UHZJZi9TdWRkZG9XR2dtSmtRdmNiazA3aUU4VUMzUllnU3luQkY3bDMycHpt?=
 =?utf-8?B?bmdicDRDV09tOTQyVFlRTjRZRDlwWExnaHR6eGNycGgySXAwTkdRcEphWGhQ?=
 =?utf-8?B?NVVaZFA0eUg4bVpVWXdscEFuS0JXanRPWFNBMWhXczUwL25YZGJDUTk1ekwv?=
 =?utf-8?B?ZEdDa2h1K2ZMSTZnWjllcEZ3VEx3QVpocGczaGo3bUt2cmpyaW1NSDR5K3BO?=
 =?utf-8?B?VGhzdFV4cHhSNnEyOWhnRjM1VFR1L3dWby9PeThJSllCYU1iVy9aRlBGckJv?=
 =?utf-8?B?Z0VQbG9RL1ZEOUp5TjVodWxicEQ0c09OSkRJNHcyRHp0aWdjNDJBTy9jMG1O?=
 =?utf-8?B?TlhGN0pvVER0YkRERDc4ZXBRWkNzZnkvOWZkRjhmRXdUZzFHQ0Z1NHBCS2Y5?=
 =?utf-8?B?NXhJRXBxcEUraDI4QUJaUmhxbjlpWUtRU2Z2KzVZT2RkVjdLeTFZVXRPTkVU?=
 =?utf-8?B?QXIxUmgrZzZEbmpLOTh5dkdzanpzRzJEYnJnc1dCMHpOa1daTFplVkdsZnBM?=
 =?utf-8?B?QU5OeTE0NU9lQmRKOC9RNkJwV0dRNE96bkhkK1F4NTlBd083UTByNHBOdzM2?=
 =?utf-8?B?Tm1mMTltOVpPdDJ2aTdmNmFweEpuVU9ScEdxdTYyYzBQdmVucVkxK0laWXdz?=
 =?utf-8?B?U2xQMUVMUk9QYU5odlNNd2xiOGtTNnRnRFp5STd5TWdycXJ0YWZ0NHM4YjZp?=
 =?utf-8?B?dnBja01HZGFDRmp2ekE3Vzc3b1BGSlRYVWpvUEJmczNsZHZqTXJiM1hLckJS?=
 =?utf-8?B?NHdQQjhXbGlab2NDUDMwS3pPcjRUWlJjMEtmRjMyOXYxU1lCSlpCQ3FaV1lN?=
 =?utf-8?B?QUlaTnFtOWhPbmNyMnBuaC9MRkpVZzRpbU5pN1V1RjgweDVLbDJKMllFM0tj?=
 =?utf-8?B?c3Rkd3JTMEZjNFhZWVZLOUtCZG5VS3Zpc25tUFg3dXFBZ3dubm9pZytqdURl?=
 =?utf-8?B?WmdSSDkxS1QrOVdueGFjMjdkT1pjaGlsY01TWUZnWlViclFaenFQMDJkSDFY?=
 =?utf-8?B?TmVPK2I4RTBuZnJ4blh2NnJxYUdGT0NYUVVuNktva0EwQ2cwOWJnTlNMM2JJ?=
 =?utf-8?B?VEF2ekluWW16amhvYlc0S0Y5UWpFNEhidGdXZCtFQTVIQ3U1V1hoYXg1dDNj?=
 =?utf-8?B?akhXemluVjNqZ0Q4STdMak9NRk85bXUwMkIzSG1QMXB4WkVJbHJwbXc4ZGxZ?=
 =?utf-8?B?WXRxUlJ0dmk2WWV1QnE4b0hBYnZrSXNwTjJsb1dKZkl3djFablpIb1Ivdjh4?=
 =?utf-8?B?U0tqMUYzN0ZzT1dvNjkyeXJsaVVZRFIzZkt6RkV5Q3RMSng2N2hIUWNPaWYx?=
 =?utf-8?Q?yVafo4u9TI0Xx?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5089.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WjFnTUIvazJHcGVpaXBVRUZhdnZrdFRPVW00VW9wWnNWdHlaZUZtUWZOSTJ6?=
 =?utf-8?B?cU5vRFR3OUU1MythYmNyOEQxWVBvWDI1STNLWFJBbkF0anB6VUhydGZUSXFz?=
 =?utf-8?B?S00vM2ZkTU51dWxlbG9oTEZNVnJpMHJ6eHVpOEdkdUEwcklzMzNsK3R0OWJO?=
 =?utf-8?B?T04wYXRYM1dXNzM1MnptRjVoM25uRkxyMjU5UEhYbyt4S255T2JwOUlNTDhR?=
 =?utf-8?B?TXVsajdMV05VdllGS2QrcHFQLzk0SDdibkQzekVVczBnL3dGL253S3piQ0VO?=
 =?utf-8?B?clJJSFh0QklTR29tTkFvbW5jRHgyT3JSbTFDL0dISk9LNW8rLzg1Zmh5TlFN?=
 =?utf-8?B?bkJYOHBxaTF0c055ZmlhcHZWT3RkWnN0cStvRFdEdXJvdjduMFE3TFJTQ3RY?=
 =?utf-8?B?Z2NuaW5vTk9BU3BGZkFIWkJRV0J4MGI2ZGk1RFNDRGVnTVUwbXhUT1hUbDYr?=
 =?utf-8?B?cFF3cXNxajQxaFEreGxmb29rQzAwN1hnQTJaMFprZzNlQnF5SVVYcnNWR0dV?=
 =?utf-8?B?enY5SHdCNFAwTjkwcm03aTdWUkpvMnBkbnRjUlRpYndDQ0c0U1hQdHoxVXNH?=
 =?utf-8?B?andSaEhoOUp0QTFnUER3ZnNKdTRiL3dqV3R1ekhRT1FjZjFNS1A5UlFza2xk?=
 =?utf-8?B?bkcxanVMKy90NFV6ZGZ3SXdYTjd5Rzhxc08yT1VHTVgvMzhFd0phZm9URzFC?=
 =?utf-8?B?SEw4ZFM3NjZkTkl6a0w0RlJrOHVVTVE3d0FlcGJiWjJhajJHdDdBOHpaYmtC?=
 =?utf-8?B?YUZVd2hwSE81c2M4MXV4Qm5WdXRMcWJ3V1IrOVdtVUd4OGJBVW4wME1lVUFV?=
 =?utf-8?B?Ykp3dkdpRXI0dnNyclNiS1JkK1RYSUpJUUk3anVFcUpxRW5laEJ2d2diUW5M?=
 =?utf-8?B?L2tEc3BJdVA0aVZ5a0xwWlFYa0lieHlTV3RZWjBPbWdvbzcrcGNMdTlpUks4?=
 =?utf-8?B?RzlXSGVGbmpsdFNvd2UvVHltNDdiMlZqczE0c3gvSDV4Q0tRcmJScGk5bWJz?=
 =?utf-8?B?bjhybmZSUlBOVkk1M0psYWRHZkRmMFdKdjlUN1pCUTB0SmllQ1lLSlIxMHZM?=
 =?utf-8?B?NzdBY2NHbHpTT3dCd3lyWUhDYnpETE5TMTFlMXA0MkJQVm13STJKY0tQV0pE?=
 =?utf-8?B?TTQyR2NYTFllU3dxa1BjZjluNHZEUjRuc0oyWEN4WDR3REorNm9YMVAvMTNH?=
 =?utf-8?B?azdZTS9LSGxmbkMxM1dHRjRvN2NWMmNsMi90OFVES202YUpkN1MyVFMrNHpG?=
 =?utf-8?B?ZVV1N09OT0FpSjdHMFZPQTlKMm1LaEc3NHl0WC9Gd2tDUkdNbXo0bG1ObFVq?=
 =?utf-8?B?ZDBjazNFeVVNSEJyKzJnWEhXdG9Ia1BnM3A4cXlPcmxleEJULzlzbGpMeEE3?=
 =?utf-8?B?NHFVUHl3UVhidXByUHoyRzhlNGZ3ZDRRUWNJaFY5ZFhLQ0x4b0txTTdxUlVo?=
 =?utf-8?B?d2g4aGhuTTF1cGpkRXNoRnZYdVhBNDRqL3ZRZ2s4eDUxb3B2amsvclJpcmVa?=
 =?utf-8?B?bDBvazFBdzlEZnpibHFXblk1NlltbzBsZG5QRFF4U0h0a3d1Q2ZNZUVPL3Nw?=
 =?utf-8?B?T1R1SG93T3RudVZBZUhrWFlqUFFPTGRwMGFNMmtINk0xM1lBaFdmYkIveGhs?=
 =?utf-8?B?bzhmZ09mL0Z5SEUvZnhkS1RjVUM5WFA4SHFVd0IvZlM4QkNzSlJ0U2NENjcv?=
 =?utf-8?B?UGtNZlRtbDZibFduVERHUjJkLzBUT1hPcXh1Vkw1aEtuOWZ3VTNJakwxN0pR?=
 =?utf-8?B?b1BTWU5haFEyRm5hRkZqNEljSk05Yk40T3lzc0lsRHVJenFFVTVERXZrS0tQ?=
 =?utf-8?B?NGliZTFCRGUzQ3NTOU5UK1EzcUEraVhTbFBiZzBqVFFqcDJVdExucWtvQkhY?=
 =?utf-8?B?RU9LM0s1VGRpdit4Rm03L0pseDI4RHdhRTJQdWcvZ3dHWk4rYjk1cVBjQ3hD?=
 =?utf-8?B?M1ovUEZ3N05Tc1I2UFJVM3hSY3RIOCt5eS8yWWVlWCt6dEJ6eE16WFczYTRD?=
 =?utf-8?B?OWNwZU5wWjhuamtRU0xQalhkL1plT1RmbVB3MU55Q0NjN2I1Zk43YlV1aUhs?=
 =?utf-8?B?cHFPSmRvTEFCVTlBM2J3Q3oyWTRqWWNuazczT1JSdWNsV3NqV2FuWWRwMDk2?=
 =?utf-8?B?U3hvOW96dk96bDNqZXNNeEZxckQ0SEZGbkhQdmhNWkZWejU4TnNPb0k0dUJJ?=
 =?utf-8?B?bEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b1bff76e-5a75-4f4d-a56d-08dcc15cc243
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5089.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2024 21:12:12.2080
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: luWuP7gKi15GMGVEjrw2PIfQ1ZUtLDfiY/Ao2YQ4oJ+nU4/qQvKXqLUSvLwe7Fbrkd/715uSXGGIplSS/eUQOFXYgGGKrWZ6Dc8mmspvGkY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4852
X-OriginatorOrg: intel.com



On 8/18/2024 2:50 PM, Jan Petrous (OSS) wrote:
> The clock API clk_get_rate() returns unsigned long value.
> Expand affected members of stmmac platform data and
> convert the stmmac_clk_csr_set() and dwmac4_core_init() methods
> to defining the unsigned long clk_rate local variables.
> 

Was it truncating before? Seems like that would justify a fixes tag if so...

> Signed-off-by: Jan Petrous (OSS) <jan.petrous@oss.nxp.com>
> Reviewed-by: Andrew Lunn <andrew@lunn.ch>
> Reviewed-by: Serge Semin <fancer.lancer@gmail.com>
> ---

