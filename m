Return-Path: <linux-arm-msm+bounces-62411-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A2D6AE7F30
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 12:26:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1A73F7A80A4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 10:24:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9D452BD03C;
	Wed, 25 Jun 2025 10:25:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bpCgU4N5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FDF729E0F9;
	Wed, 25 Jun 2025 10:25:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750847121; cv=fail; b=MqzGnMatduIoHeyPy0h7Pw47qDRePpFoAfWiWoPvOx+BGQF+DPjj0rDMtP8donbqlMc3VPquNM3LqxRWli7ETKNFGBwn7cnu/6kM+vJT8iha4iq8pNnAO88sEl1N9yiMIDZvVQM77ilu9L6VFdHplFQRquHb1Uif0Edv4J66TZM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750847121; c=relaxed/simple;
	bh=2PKBqo8bwIQ1urn7sB3qNZwALymM/pBNp9pNlB75lvw=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=IuGFnSUpzPfcpEnFRa3WtZLOqjam2OhIyJw5DHXS7suwoyQBAOkqVBM6lXYLy+JZa/Iw31RViDWoD2VshgBBZCuvqgvuFzeFYspwgWQz8QW72FWlcwtO74xrHw7oTEdI63bXgrNpK2J1VLjK63DVhU/iKY5MfazMJGoPoIi8AAE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bpCgU4N5; arc=fail smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750847120; x=1782383120;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=2PKBqo8bwIQ1urn7sB3qNZwALymM/pBNp9pNlB75lvw=;
  b=bpCgU4N5m/n6HqZmXYO6Cn3939BL1Zjqut0DvYZCGSrZhZv/ySMVHgvE
   qWFDsorNa5rKX5gqvp41Mb7RIOp4be1P0X2ThQLmCzGwTtu608OnT5xNC
   Dt6sx4RpXD0pCfNhygKw/y/5lRG3Yo9I7I/I7mTbsX/oD5sIlZqLITnqg
   58rtXjmZpmHekkMagc1zXqqPx+dICEDqYcUMuNckMLfuWGDhuuqCVBZ0x
   MOY/Vb+Dl7+rfM8BWXKJxgCNlurTIMZOQKh0CA+SsEV38QzaaifVx4SrU
   Ei8XnQFGYWQB3z0NV4YtT58XKZY8XngpzmAPDeOq072Dky4+QtijDLcJO
   Q==;
X-CSE-ConnectionGUID: 26oNOSt1SZ6aIkWZEoDRsA==
X-CSE-MsgGUID: qXCVKG1lRAmFzYn6/Wop8A==
X-IronPort-AV: E=McAfee;i="6800,10657,11474"; a="52975073"
X-IronPort-AV: E=Sophos;i="6.16,264,1744095600"; 
   d="scan'208";a="52975073"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2025 03:25:18 -0700
X-CSE-ConnectionGUID: bcSlctutSUyRTZ8jVneAlA==
X-CSE-MsgGUID: vEW7sdydT1KZ2rpLz2xnSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,264,1744095600"; 
   d="scan'208";a="152312724"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2025 03:25:17 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 25 Jun 2025 03:25:17 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 25 Jun 2025 03:25:17 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (40.107.220.83)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 25 Jun 2025 03:25:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UD+J1zEs7BG/32f1lAFscxR482zVdLRj7D5hU+GbOM4IkZhAMxsBPmz/FxQ/zBhMlC/r99P31bPIMj+VflHYtzmGYX+btO5e12RmefQErAZYS4mHcw1Vtb2wZmoKLkqVfu3e4fK7nBmGQrWv2PO5pr2ZzfM7VE1b7whAQWo6M28Gvt8HJF+zLSZ02QQ7TPzqxKwM3iVc1tNXpSC8eoTgmYdt5aHcEnhkmHvEI8012ZE8GNjnyD7A5wWbsy0/85h2tbSOQU9e2AE2SdnSjIkoI2+aj/ovbvybaqHAtl6S/m0mdMUDde0cNJn8xO+7F14vC/QKK1USooisYJLsGNWjww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kHzBCneMm6aF5Cmxg+9+X7KIaObyE7mVYNUPQbeBBDk=;
 b=MHcjLfmVyC0odHigheGwvSfanuOi5+Z79W66+nMxvSo0WH9UEy2s0QRBvQEXuOVrbCG1JGyb0O4/Hj+Zv9yn8bLJIN41r74pwiupbtJznzb87syQAoj8ee2hU/AaTG+FNDURynPI1vWt2klIeSu4hO2D2euZSTTmVZNnPcOMEOBiHK6J5JEno+B8gEEVCVsYdL02WSS4RtntGpyZ6AohoCmgpXFTIkCKQeyVkVSruW24TTCI72s6rzhwwqCgU+/L4/Nib56bNko7kI1grkm3B3MXXEEjZVMHD2UXuucuNKY9isya0BcWoZ097nNNspPgYXN7171fRg2WNuh/0eG+3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN7PR11MB2708.namprd11.prod.outlook.com (2603:10b6:406:a9::11)
 by DM4PR11MB6310.namprd11.prod.outlook.com (2603:10b6:8:a7::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.28; Wed, 25 Jun
 2025 10:25:15 +0000
Received: from BN7PR11MB2708.namprd11.prod.outlook.com
 ([fe80::6790:e12f:b391:837d]) by BN7PR11MB2708.namprd11.prod.outlook.com
 ([fe80::6790:e12f:b391:837d%5]) with mapi id 15.20.8857.026; Wed, 25 Jun 2025
 10:25:14 +0000
Message-ID: <a142960d-d30f-4845-86d3-a2b2888f1907@intel.com>
Date: Wed, 25 Jun 2025 13:25:09 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2] mmc: sdhci-msm: Ensure SD card power isn't ON when
 card removed
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Sarthak Garg
	<quic_sartgarg@quicinc.com>, Ulf Hansson <ulf.hansson@linaro.org>
CC: <linux-mmc@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <quic_cang@quicinc.com>,
	<quic_nguyenb@quicinc.com>, <quic_rampraka@quicinc.com>,
	<quic_pragalla@quicinc.com>, <quic_sayalil@quicinc.com>,
	<quic_nitirawa@quicinc.com>, <quic_bhaskarv@quicinc.com>,
	<kernel@oss.qualcomm.com>
References: <20250620090333.3068568-1-quic_sartgarg@quicinc.com>
 <61cffc10-3e05-4331-b967-6c01cc03d072@oss.qualcomm.com>
Content-Language: en-US
From: Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park,
 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 -
 4, Domiciled in Helsinki
In-Reply-To: <61cffc10-3e05-4331-b967-6c01cc03d072@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DB8PR06CA0010.eurprd06.prod.outlook.com
 (2603:10a6:10:100::23) To BN7PR11MB2708.namprd11.prod.outlook.com
 (2603:10b6:406:a9::11)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN7PR11MB2708:EE_|DM4PR11MB6310:EE_
X-MS-Office365-Filtering-Correlation-Id: 284bc549-4ef7-46f6-0d61-08ddb3d292f3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NnNRREZodGQ0M1FTWWp2dWp4R0N5UVEzRGI0WHI5T29XTlhnS1cwR2UwZnB6?=
 =?utf-8?B?d3VIcXpYYWNmK0lKdFhiYmhhODMvTzYyY1lBMFlYS3lyNW84eDA3WnpYZDNt?=
 =?utf-8?B?eXRxUHFzSy85ZU0xaHY4aTRDTHBWYkVxQzRHNjgrVzRuQU5tcnBDWGpXL0Z2?=
 =?utf-8?B?UkZSWjhxbXhGYkYycm1TVnpXS3AreitkL0hBWUdGOUNFdHI5djJRWGM0Mk51?=
 =?utf-8?B?cFNSNUZacGlGckJsRnE3bU5RZmRNYndVZHJLMVRKVUgzc25sbFljVXhpVys4?=
 =?utf-8?B?amUvcFdUVmNSVkQvSC9FRzJWVEY3WmdLU1pESFd3WDdXejdOUW4xb2ZFSFNa?=
 =?utf-8?B?TXNFVVM2bXloS3MyR1BUS29uS1N1ZFZZQXhFSC81NGhSc3BQeHBHSXR6bS85?=
 =?utf-8?B?aWlQTTRiVTMwU2I0ZmZVRjVWcFJQWFV1ZGFXMzNKY0FNeUdVWWtJeU43bXdD?=
 =?utf-8?B?RndCTzRnUFovV0tHV2xGOUFlWmVwRTlYMStITWpIVS9HSEZ5VzBLdXJ2ZFZo?=
 =?utf-8?B?TVB6VEY1aGNYRHBBbm1DRVNSaVlXU3JJeEZoSVl3UlFSV20zZk5YNFh2TGtF?=
 =?utf-8?B?bzRadkw2Q3ZWYnhlcmR1R05GRlhSQ1REZ01qUEFjQ2l2dEpmc25pSlFJZTlL?=
 =?utf-8?B?MHc4NXBIajkyWFo1WHJtSHFVb25yNXJMc21Jc1ZySkg3K1lsKzNlNWorbVly?=
 =?utf-8?B?akhoME9iYkJjQnpGQ1NxcC9KQ3lhMEs0MythZWg5N2VWWGdPZnJkSFJvQXFT?=
 =?utf-8?B?L3p0SjVxRkRyL3NqNWxLMHF1OEVEUUdpR3hEcC9GV0I2VFYrOFoxUTNlQjNj?=
 =?utf-8?B?dVk5V1lnOVFodGY4cktYdnR2Y1FQUlpKa3RqNGpIcE5vVTNMUWhMaERKd3Js?=
 =?utf-8?B?aDdPK0xVUDNZUkhRS0t0WFFXeUJxWU5QKzVzOGxjOGxLMnBCNHd6NzdjbVd4?=
 =?utf-8?B?K3JpeWZmci90OVZHeFJ6TlhMc2JFR3N1YUM0WjQvUldqMlJoTHg5cWs5VWRj?=
 =?utf-8?B?YjdZSGZRNjBMSWpBQmNoK2F2SXhxVWhESFhxQkMwVmovTEZKcjZZbkhzRjBs?=
 =?utf-8?B?eVVzWEsrMEdZS3ZNZmkrbnhnRHg5OFpUQ2VsSXFqa3pOczNTRCs0azJsZW01?=
 =?utf-8?B?MjJKaTN4eWFWMzhFR0duU2puc3N0UStTNC8yVGk3VDNxNEJTVVJxbldwZ0Zo?=
 =?utf-8?B?K3dYV1B4WUF0N0VLQTRndXkwZEdaWjRvRkNLdGJtTHhQVXVJYUhOZzhyMEht?=
 =?utf-8?B?bndNRitLQ0dxKzBPd3V5Z0dUMlMxTGVXQjh3dit4Mzh2MkRRaW9lL0haNFF6?=
 =?utf-8?B?MUhyNVRteVE1TEFab0pOYjlkSGFsdHh4UkM3WUI2dVJsRnplZVZEc3poZXZ4?=
 =?utf-8?B?Vld5R3RTMzZpb3E0b1RzelMvVDFNUTVYU1RJQ1ljcnhhK3RUVHdaRU44RUxN?=
 =?utf-8?B?U3BqOEZ4RWJ3VmxEOWdrblhxUERSK3R4OHpRQ0NGRkxoQ0w1KzZIMlVqQjhX?=
 =?utf-8?B?d1BHV08zZXY2U1o5T3d3bXViK20yNnpHUkFHRlEvRjNqZklqL0JQeEtsaG43?=
 =?utf-8?B?c1g3a3paajFQT0pOeEVhNVdMTzhKQnlhWGJZUGI3MXVSTnU3dFQ1Z3p3UTZt?=
 =?utf-8?B?US9FdjZkczVEMnBQNXhvZ2FvMmlTcTNvSmo3b1FBUTJaQVlpSUtjQW01QlIw?=
 =?utf-8?B?K2p0RGx5WW1NZkp4TGpsbTg5ekZvek9KL2FBZElYVHdFcWt4MGxjVnZiZ2w3?=
 =?utf-8?B?Vi81MVcrOGtWNFdLaTdyTUN4S3IxK0pJK2tUVUtLbkdlSytCY2pZZ3YvWlJn?=
 =?utf-8?B?c1R2V2ZqVWcxVTdOK0E4T2NOc2kxQ0crRGRRUWYyaWdHb1VaY0V5SnNoeFBl?=
 =?utf-8?B?ZXBvc3dyR2pnU0NxL0dDZ0RCTkszVXhYM0RjSm5CRlBLaDhxR1pRemE1TjNu?=
 =?utf-8?Q?H69aWx4AS7k=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN7PR11MB2708.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z0NUemc0MHc3a2hGbTBGSG5uMjgvcHRMdU5OTkFCdDdXcGk4ci9pbDhEMDM4?=
 =?utf-8?B?aktCaldta3QvSjdHOS9ZQTdOTlVWVG03SUJOeWZqV0hrVDJ0dGEzMkI4YVVR?=
 =?utf-8?B?YUhaR2lNVlhGUU90T0Z3WmwwV2lvSEkrekRmdStLdjR1TTd5di9acUdZVEpV?=
 =?utf-8?B?NzI5ZS9uSi9RNGg4V3NWUWtSS2J2TG1RQlhlZUpLWHg4NnZheG1PQXA3Q2JO?=
 =?utf-8?B?SWtXMXRnMnM0RDhKQk5XTGw2Yzl4ZU9SVUhFcEF4SlV3YmdQRDkvQTNTdTdX?=
 =?utf-8?B?T08zSkRzWmNmZ0xjSWE2Y1FqU3R2UVhUVVRjQ1JJZVhxb09yZlczK2hwc0xI?=
 =?utf-8?B?V3g1dXd5dU5zVzh0RTVZVkV2MTRabXAvL1dMbXVpUDZ2OG1KQWI5Uy9BS0xM?=
 =?utf-8?B?RG92WXREaTN5elFFZlkvSmVvS2hzZ0NtTjJqNnpLVUErdFdSVmYrZUlyTmty?=
 =?utf-8?B?Z1F0YURvOHlKeS96cS9ZZUlNZ1FrcGxGNEpZY0N6MjJybUJ2ZXIvR1lzWElo?=
 =?utf-8?B?TUUzMmtmbFcyRjViWklJUzRtUUUyMVllek9kZDJQY3FidXZlcnIzTDMybWtX?=
 =?utf-8?B?TlR3TGswdmZxdTRQUXVjcDB0SisySmNlRjR5VkdjV21BdGRaT002ZWJyQ3Zx?=
 =?utf-8?B?ak1nQXdReWZ4Q1VjT1Rmb1NjWWFQQXNidVdxOVJIM1g4c2h5M3ZWK3ozc0pt?=
 =?utf-8?B?cmFOTWNtYXNiNVFXeGN0a2FVMWpRcFowWmpmSUkrUDQraTJicWhCTnBmRTBX?=
 =?utf-8?B?MFhwTUJXZUhhOERRa25obDY1L3FEYnpOSVV4K3VndXVnbTVQVWZpQTI4bmx2?=
 =?utf-8?B?VVcyVGhpc0QrUWsvS2VITTNnOXpveTJtOHpNaklKR1ZWWGRlUVFWSlByVXpJ?=
 =?utf-8?B?K0dScW1HSTJNaHQwVmNWMi94U1FKN2QwTE1yc2lSMXBqek9aU3gwdHlUVE1z?=
 =?utf-8?B?N0VIY256OXFnTndVZisyRXh3SFNvUjNlcElOeG1lSllnZW5BTlZoUUlxL3JT?=
 =?utf-8?B?WDFyV05MZUhjYVJDZDFYdnlLQ0J1RWE2WlZJZ0JYdHQ1UWxWb05PeTNCVWJW?=
 =?utf-8?B?Vzlaa1NYRkhpMDhrNzYxWklLQlRUYUloZHJXYmwwL3NJb1M5dnlxYlRkN1ZU?=
 =?utf-8?B?c1pxSnpMRFNoaURIbzc5a25ZQ2R1MzhSazVLNTM5WkFPYktrVnphMXh4dmd0?=
 =?utf-8?B?K1NVT3ViQjdOV3pKMUI0cXY2YWtHeEFaVWZyV1I4WVV2Q0oyM0tNbTZnM2x6?=
 =?utf-8?B?S3pmcGVuRENZTWExQmltNXRiRGc4dXUrNkRTcUExSlB5NHdxUmIxTEtYWmNq?=
 =?utf-8?B?SHh6b05jdmN1U0RUVU5CRloxaktHc3dSU09ydjZ2OS9DNG8wcmwwOW1rd2Fj?=
 =?utf-8?B?Nk45bGdrOEZJSFY2ZTNXeU55TXpyckpuZlY4bE1zNTB6MVdkc2M4RVVXWCtP?=
 =?utf-8?B?K01KRjZzczJ2akhwN3loa0h6R3hEKzlnSy9DTkp1ZjlndXFBTGlPRUR3ckZZ?=
 =?utf-8?B?YVRaZit4cXUzVDMwdVVhTWdiOTJFeDJXZVVNQUlYR05ibUd1dnJ1K3BrL2lV?=
 =?utf-8?B?S3lKVDZEUjRhVWlZNHg5MFp1VjZyU1kwWWNsckVpMk5lSUtMbzdZWVNjZDZI?=
 =?utf-8?B?dE0xeGp0ampuSTgyWXJzQ0kxN1FPR3hLR2RBN1hKbENxWWNBSXY5dkJSUUpU?=
 =?utf-8?B?bFhZSjBVSUN5ZjhibTFybUVIK2F3dGxha2tUeGtPR1dLZzNHZHAzUzZBQ0l2?=
 =?utf-8?B?NmRNb2M2ZEI3WC80azYwMnR0SG4zNWxlVWY3OVVIOWFJaWFCNE54U2kwUDdw?=
 =?utf-8?B?NEJMOE5JeHNlQnFYakZEcXJWMEdhMDVJYWxWUlA4WmZtdEIwZnVxV2NwM3BM?=
 =?utf-8?B?S1pJQWYwWDZ6R1RCVFJEb05QaGViakEzdTVhTFkyUlVrNEtuZXRXUk96SU9q?=
 =?utf-8?B?eHRIV051clpmMWc1TEZHSHM4Q1EzWHpPU25zOFliWDBRVE01QnB2VUFvanpn?=
 =?utf-8?B?bGIzSDZiN1l6d2xaZC9nWE8xWlJRVmEySlZnVVAxRE1zdHlLRTJtUHJYNEdp?=
 =?utf-8?B?YWlReDJyQ04veUpYQ3BDVFo2ZXkxRUZFbHZ0bFVCb1AxWWRCUjFSS0NwbURz?=
 =?utf-8?B?R09ITERpRFl3R3NKb0dxMjF0RmpST1BPUTFZNnRIT0tVSzVyblg3Y2lsNmcv?=
 =?utf-8?B?VkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 284bc549-4ef7-46f6-0d61-08ddb3d292f3
X-MS-Exchange-CrossTenant-AuthSource: BN7PR11MB2708.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2025 10:25:14.8675
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EsnsbJuDeIhQQ5GAw3Nx72GFssDYapY9iVpOkNkanNbJDydSbeZ81nFbPdxvageD989sILYknl+Z4Ygcw4jKGg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6310
X-OriginatorOrg: intel.com

On 21/06/2025 13:59, Konrad Dybcio wrote:
>> diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
>> index bf91cb96a0ea..97a895d839c9 100644
>> --- a/drivers/mmc/host/sdhci-msm.c
>> +++ b/drivers/mmc/host/sdhci-msm.c
>> @@ -1566,6 +1566,14 @@ static inline void sdhci_msm_complete_pwr_irq_wait(
>>  	wake_up(&msm_host->pwr_irq_wait);
>>  }
>>  
>> +static int get_cd(struct sdhci_host *host)
>> +{
>> +	struct mmc_host *mmc = host->mmc;
>> +	const struct mmc_host_ops *mmc_ops = READ_ONCE(mmc->ops);
> What do you need the READ_ONCE for?> +

Yeah I was confusing it with bus_ops.  READ_ONCE() is not needed.
sdhci already assumes mmc->ops->get_cd always exists, so
separate get_cd() is not much use.

With that and cosmetic changes, you can add:

Acked-by: Adrian Hunter <adrian.hunter@intel.com>


