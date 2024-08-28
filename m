Return-Path: <linux-arm-msm+bounces-29781-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 85D5D96292D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Aug 2024 15:47:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F32371F22985
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Aug 2024 13:47:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C05F15B0E4;
	Wed, 28 Aug 2024 13:47:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="M0a0Tf4Q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2059.outbound.protection.outlook.com [40.107.236.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 980DB168489;
	Wed, 28 Aug 2024 13:47:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724852837; cv=fail; b=ECMs1OpoKjK2nh+892fz4FNrl/ggeB8dpGLREYOhP/YJ//HmbI5R8pC7sZK3OwwqPhYvOkvEO4QAVPa3kkYPKKGhPfkUdg5JLnej6Smw1Omu0jZFpylyoUoyYiqvm8JsiKk+N/cNjWRtv3ytEBdl2ZtsTGdh6sf8QmBSea0aQFo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724852837; c=relaxed/simple;
	bh=I9yCfVoZsSKA6cYxE/Ip2+t6LkMAu/aJqm7NbbQG9KY=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Tco7m4HuBai0LCh+ee/djPe+Pqy4WdSME+0CnN88oeCfnkd0QV+vzLhDqdOKHr5mnzAUmrAwNPNJ7YRK0ieGIVwC8erqD3GBZ+9GqpV2ajtFaHw4d1yOhKhOiiDpaJRM5cIci1FJWbVws5K4hkV1acFbwfCQ8creCIiuGtD7sUU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=M0a0Tf4Q; arc=fail smtp.client-ip=40.107.236.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wt2mjeaJj3iOTQz3Di6Bnv9AxjXgaU4CLyitWlLIscki7DUDezmTm0d1kschEMVC4w/1COK8SlMdJAgVNLHiPARz3PUPi+5CMtfpgWsUWYSE6LZ6XC/YBRZmQtWmIsbbkxKytaGNREC75AfvVsna7/4C5ciaQJ1Ndc/dMmcDV3GWynBXq/7dXLDLY29vzceqMW1Dk51TWWkX0bkxJZPWW2apjAcuc+MdpKCrv4GcSsscT1FnDS7Zl4tRyxfA0piW1CferLE+RwfQxPCyDInoE5gPiO/iuVE4KdhXFh2uEdSltk4KpVg2yfOyOQpWkDn0YAF3cgLGBY2qbZMmNSwL+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xZ/3RnJDzeIzTH9uNNF5YKLr5sQXYENlhvKNDOYe6bE=;
 b=uqmCvu2M2NhJU/Il54Zt6ygxA1yxeVTacJuMnLwIs+B23huHMScPNSfBtCMfSHxG0mk7f+ApdP3/g2Ac1Bxv5uSJzWaXcHa1ioVgXVy6wBFtVgdX/TfOReZIitWupULCJIGjohKjzE/YnwR4aNFIrk+FxAZ/8TdfD3UwiNmQPrwP7gh5eeOeEdJaJuWOYHRoJld04uxP0RFKj8IP3mm5kSbbZXlOWokyeTh2jxzHHWdxp56mlcpKKQQPHBqE8hakVsFHeUwYWVjdQ3Ugw2LP8ZuShE6eNMS3buSjmSFpGLjXHMFkkYWtbp1FBPDCp4WK7kpB7S9J8H66GTuFY8GK9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xZ/3RnJDzeIzTH9uNNF5YKLr5sQXYENlhvKNDOYe6bE=;
 b=M0a0Tf4QutylaMBMwRVV0c8kXqiyZnfbhKOlkjH+XOr00COgTIvZCBAjdBes62xhAEh1fRn5ien459XQz861i/4EDeQlvElzkLBk7MFbeiBD3j44GetMbCDV5bSgIDo7zy5TT2EVb9z03hpG0gR2wxghZbkBSmUvOqmYczQ3JDB2nh/w0tFJsMR+mwfZ2I3m28veTLPERbqSf1t1v2M/Kd0DbY9DeUZCeCEoHh61qfUCyHK/T32sVgNEC4VjbfnyNjZJ5sHUPncfsPqp6AIldb2Zg5CHuPj5YM9yWYkr2/HixjetbZ6zcaTV7bB/QhUsMWUh1LDjQ9hOqqXFkg+opg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM8PR12MB5447.namprd12.prod.outlook.com (2603:10b6:8:36::7) by
 BY5PR12MB4179.namprd12.prod.outlook.com (2603:10b6:a03:211::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7897.27; Wed, 28 Aug 2024 13:47:12 +0000
Received: from DM8PR12MB5447.namprd12.prod.outlook.com
 ([fe80::5f8:82ee:7da9:219b]) by DM8PR12MB5447.namprd12.prod.outlook.com
 ([fe80::5f8:82ee:7da9:219b%4]) with mapi id 15.20.7875.018; Wed, 28 Aug 2024
 13:47:12 +0000
Message-ID: <7733a4ca-330b-4127-af12-33f376fbbc47@nvidia.com>
Date: Wed, 28 Aug 2024 14:47:05 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: clk-alpha-pll: Replace divide operator with
 comparison
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, Ajit Pandey <quic_ajipan@quicinc.com>,
 Imran Shaik <quic_imrashai@quicinc.com>, Taniya Das <quic_tdas@quicinc.com>,
 Jagadeesh Kona <quic_jkona@quicinc.com>, kernel test robot <lkp@intel.com>,
 Dan Carpenter <dan.carpenter@linaro.org>,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
References: <20240813094035.974317-1-quic_skakitap@quicinc.com>
 <4d314b61-7483-4ceb-ac72-10dbd7e4522a@linaro.org>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <4d314b61-7483-4ceb-ac72-10dbd7e4522a@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0121.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:192::18) To DM8PR12MB5447.namprd12.prod.outlook.com
 (2603:10b6:8:36::7)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR12MB5447:EE_|BY5PR12MB4179:EE_
X-MS-Office365-Filtering-Correlation-Id: a62872a4-3a1d-42e0-e99f-08dcc767eaee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UWFXN3ZORlliS1JjL2N6R29pNXJ1a3pvdE0zb0kvQXVtYzlOdG1lNHpYZDBI?=
 =?utf-8?B?aFovOHp4QlpLdWVqSUt3OXUxMk5NSnlKTTl6azh2dWJEYjZjOFRFWWhqUFZh?=
 =?utf-8?B?Q0diUUJocnd2ejFRc1lVcVFRYVRYa282YkhHbE1UWWZuMHpmdWNuNXRuTmVJ?=
 =?utf-8?B?SE5VeHAwaG1RZlZ4UG1TSnViQlFuU3hwZ1pteFlqckdwb25JYmoyNVAvMmdx?=
 =?utf-8?B?TGg3ZHNTVHRQUFdOeHZzL0lNMkRPRHZSYWQ0VDhDK3lmMnZLZGVuekNDMFVK?=
 =?utf-8?B?R1QzRjBYRGh4eHRmV1FLWkROMFdDWDhJQTg3L0QwL0phbGh4TW5HYnBmN2Np?=
 =?utf-8?B?UTRIMHFIQmg0T2hOS2hDN3M4RStHOTRzR0VuaWFPc3lEODFvUUVBWDJ3Tkdo?=
 =?utf-8?B?eVpUQTJOWmpsOVIwK1FFczdTaEpMUWZTRmdWRlBlT0tXb05CaUZmWkltZnJ6?=
 =?utf-8?B?OVg3V0Z2VnRtbVVzK3ZBMDBKU1hYL2pjbEFnbmtWeDhBREV6Q2wrZi9VRTJa?=
 =?utf-8?B?d0hMdTFwWXJ4L1U3MFptem10dGc4SVloZG1nQUkyQ2V4dm9SU1h2WGR2TFlp?=
 =?utf-8?B?SVZLZ21KUWxpLzJPaHVXUVhLUGFBMkFnaWh2elI3d2trK0lEaUxMMlI2R0JX?=
 =?utf-8?B?SEpwN0t6eUhOZlJQQS9IdEdJcnN6bVpVbW9KcVQ2SFRBRDU2WWltZHJmOGh6?=
 =?utf-8?B?VFJLTnZhQ2c2Q0RIWEY1VFdiZjBQODBDQWlvM3daRFRNZHQzODRObkRCT2x2?=
 =?utf-8?B?UjZSU0JSYngvWUZlME9pVFNmMUdDcUtWYUFyTlNWcm8waGFHZ3QxdVBKdjJT?=
 =?utf-8?B?RUpMQnFRek1lT2EvWTZwTFNwWmhjaFdmV2NJbHpiR3RwN2MrclBmMHRFRzl5?=
 =?utf-8?B?UTZpS2ZKNDNSZDA0MzcwbmdOb2htMmliUE9ETUJ1TEtSYkNZeDM0c09SYk1w?=
 =?utf-8?B?VkJjNHBseDIyS2NtSU5FYXBsODVMczlaMVFMbkhkRFcrRGtkUTZ0RWFDQXZK?=
 =?utf-8?B?MmFHcG5QTy9DNEc5R0c1a29PZFhISlMrUldDMys1REJ2bmZJNG5mQ0dVeGxt?=
 =?utf-8?B?L3dFTFp3SGZpSGtZd3pkR1F5TUFvYytyVkNrWENpNEU3V1NScU5IaEhsakoz?=
 =?utf-8?B?RDFFaTFWYnpPL3k1SGE3SzRVajhKbXZsSXhLeDRIZGw4SFJqUEQwdkpkQmxE?=
 =?utf-8?B?NkZBQXNPbzIzNENBL0l1Wk5nYS8vK3FNRlQ2Zlp0dnJoVEdCOTR2TVVzMWl5?=
 =?utf-8?B?K3ZjcG80QU54VjhMZytmQ3FXdzFhc0R0dzF4Y3RmOG9kcVNudkgxYUV1VlV2?=
 =?utf-8?B?MHhlM2NpWEFLNmY3STk1aXhic2FGdmJRblIxcVozckt0bmxGYXF4blRtUHUx?=
 =?utf-8?B?dWhJUTdqcHU5Tjk5OFlFN0JzS2N6L0RWb2g4M2NHSGxsTjNkTEdpMHdqdGhT?=
 =?utf-8?B?N2JuWkNZN2Z6Y1IvTGVnRnlkLytZUzBVTXlDT1h0b3M3RVhlUjFmcVBydWN5?=
 =?utf-8?B?THBQcUJ2YzhZNmFrZDJ1enJOUEhtdXRYeWNCZEJNaG9FMXlBRGtmWkpwdFBO?=
 =?utf-8?B?aGl0RzJ5amJjSjBETkVJd3F2L2Eya2FGTjgvY0pyaDlqSmUwNHh6cEh2bkRa?=
 =?utf-8?B?dHhHVUg2a29aR1VxOVdxUXlMT0tkRzlTR3RQRkRObjkvOXZzWEdBa0VUQnNU?=
 =?utf-8?B?TVNOT21kdDVnZ1p4UG1jSjFtNnhkQnUrRkhKY0g1ckloVjBWMWV3c0VIbHVZ?=
 =?utf-8?B?RStjVFBYRWFrdjhhUGZva0pmRVhpS0tMKytLTmZyTWVsb2RidHJvbE1DcCtY?=
 =?utf-8?Q?e3Pd6eD6zryo0pHZ9JiAvbvbhNxyB6YgM4n/Q=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR12MB5447.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZVYwOVlqbDRMTmYvU01YNW1jNnd3WTdPcGJ0RGZEN0RSbE1ERldDL0RMTHBr?=
 =?utf-8?B?c25PdWhCVVIzdDhXMVVRaElZUUFGamQrT1lPeGRHNmdmaG90ZGVsWWIxZVdR?=
 =?utf-8?B?ckRqRmFFS21hTjlSZDVzeVUrSzlnZHd6ZVhVWitOazduQ2t5aGtJT0JCSk1t?=
 =?utf-8?B?NFVJWVVkS3ZKSkVqSkg5N2ZiSmloUGc3clliZzhWMEFQSU1MbVQveEJhcFR3?=
 =?utf-8?B?UTdoVUdrMEQ4S1ZmRzRqZThzMVZRYnpjSDVubllMYm8vWTRKK2VqN0YwT0JR?=
 =?utf-8?B?bWVBM1pTQTY2WEtMTFRhdFpYSjA3RndhS3RqYUU5cU4xai94eUxMRktBR3Ji?=
 =?utf-8?B?UzZSeHlscUgrSEtRTElmQ0xZd0RyNFpyQmZEMEhSUDVoQXJDK3dOckZFL1Zi?=
 =?utf-8?B?Q3FsVUZCeW1RVVhxaTdQa1c1bmp4dlNvVG94VVEzUjdmQ3dXQzJzVFFWRjNa?=
 =?utf-8?B?RzRYQVFzN2MyWHJyNzZxN25pejdRQnp0QkUrL3laWFVRVksxT20xUUZ6L0pP?=
 =?utf-8?B?aUhpaHFmS0RXbUpEckhXY3VNNDFlOWR1QXVmYjFaU0lpMTRBbEhwL0RPNHdV?=
 =?utf-8?B?VUVRN3c3Q2RQREpyM05YOWcrNHdVVGdrTWxOMU8vMTB5RTdqT3d1djJuOXNE?=
 =?utf-8?B?b3l4eWZDWUhxRlg1OTF0aUFZc2kxdzZ3Y1ZsVXdoUGF0d2NtVGtaaTY1K3pw?=
 =?utf-8?B?V0ZpQ0xkMlV6SHd3U080NE1JRTlmSVU3cVZGbUZVcUw1WEJ6Sml3S2pKbk9o?=
 =?utf-8?B?TGF6c1Y4Y3RtUmlCTkd0Slg5NDAydmpxTFVGWk90NE9CcVJtdyt3alNSL0Zs?=
 =?utf-8?B?NjVkUGlva3JITHBWdW1HZmVKUDFRZHV2Rm1EQzBVMUlibThUMXB6bWhFMHhx?=
 =?utf-8?B?ZGdkMU1JVkk2andxVXZ0SHRlUzE2NFNOOHdHQXpUdnpPVTZiZjBMeXcrY1pr?=
 =?utf-8?B?ajhydFYwa1R6SXYvNkVrUW81YnJkQjJBb0VzSVQvSTJFQkdpS0NHTFU2WTYz?=
 =?utf-8?B?YzNtRVlIOEMwSmo2dTRIUWVSMEhscEtsUjFkakFyZnliYVRkNkNZMVFlazEx?=
 =?utf-8?B?TEdIVHZGQlZOSjVlcWV6Skdhc1JrVmxjTWRoeGFYM1lFQnpOOUhDVXRUTCtH?=
 =?utf-8?B?RkE3NytTOTY3ckg2U09DOEQvSmFiM0N5VUFaVVBueE9sWTBCNDFtVDVmaHdu?=
 =?utf-8?B?M01xaDVVR1lYTHF5aFhLUDhIcG1RaHh1WWo0MU1JcVd4ZHREa0ltUzlrZU1o?=
 =?utf-8?B?Vk9MUWp2cVNTbks5Y2dyMVN1aTg2d3pVcUtuTlN0NzM3NHpwTmtjTEpuTXRR?=
 =?utf-8?B?RzR6Rldwb2YwUFdmSnZGcDNLRlBMaGhSV1B4TTJwTUlVbi9reE9iV3U2MUYv?=
 =?utf-8?B?cE4yVmJJdDRJa1pRM2hGemhtaGxGSHVCWGFIT09mdG5icyt5MmcrLy9MV3la?=
 =?utf-8?B?bUxITWpjZXN5L0pjdWtmd09sakNGbGZPY2JzeW9XL3AzQkwreTBXbnJPbXRp?=
 =?utf-8?B?OUJwNW9XZTVXQ1p4MDlZbmwyU2JpcVB4RUpqbFhzUXMvckF5N0xXWFdQVU52?=
 =?utf-8?B?cG44ZGM2RDVJWEViaElTQU9vZkl1N2pNdXVaY0phTTd2VFlTeWhEdFFzcGgz?=
 =?utf-8?B?RVNNZDdLUXpzRHNqOXVFczFGRGREOFpsWjV2MTVzV1BKWmFQcmxHUHVlRGtK?=
 =?utf-8?B?dnBIV25sbDNBdlVPdVNBWEpzUTB3ek4zZ0xBVnAwaFZ3RnNpTjd6RlBKbGk1?=
 =?utf-8?B?dkZDU1VwdENIM3dabFlkcVFuVnM1aUtuRGlqNDh1eUkra2VUM2pxOXNvZFVH?=
 =?utf-8?B?cStSSWxNTWI3NWoxdUE3ZDZZeEd4anVGdWtWcDRXK2Z5ejY5c0pyZUp2WnZp?=
 =?utf-8?B?UW1ac2ZYc1NjNjNZTXpCVitWa0FsS0sveTl5UTFPVTVRUmtrYzdJSEk2ZUI4?=
 =?utf-8?B?MHh2d1ljUVpteFdpaVcyTGRtVUxQanhFa1MrdThDWkY5SmNjN29pWDNzc1VE?=
 =?utf-8?B?MUREbVFZOUJmdWZ1WmFNVEhRQ0pIYUFYK3JLSXNhVUcrZmVhWEdaYklONVpN?=
 =?utf-8?B?N2tsaDJKL24yMXBEejBmOXYvNjZWTG5wcCtuQllDZFVOS3lsbmtkcDlYOXox?=
 =?utf-8?B?eEdlOHE1NU5LQitBcUZzZlJsR0F4cEpyVDZNeUF4NWdmWkl3bzQ0UG5FcWpv?=
 =?utf-8?B?TkN3djFpNGNlWXdmYkZSaTRBUmh4YVRvbjhHaFB4RXl3T1dDUEQzUGdRclQz?=
 =?utf-8?B?Z0lGc2xjUVZuZCtXckJmdzl3UG1BPT0=?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a62872a4-3a1d-42e0-e99f-08dcc767eaee
X-MS-Exchange-CrossTenant-AuthSource: DM8PR12MB5447.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2024 13:47:11.9188
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ouzkFzUuOrqYPzJekq9PNzK0psZDJQD+lDGqJBPeNTa80Php3J4X5MeE0HfnWIdIeOD4uEgzEn1IkzA4pIJ6mg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4179

Hi Satya, Vladimir,

On 13/08/2024 21:01, Vladimir Zapolskiy wrote:
> On 8/13/24 12:40, Satya Priya Kakitapalli wrote:
>> In zonda_pll_adjust_l_val() replace the divide operator with comparison
>> operator since comparisons are faster than divisions.
>>
>> Fixes: f4973130d255 ("clk: qcom: clk-alpha-pll: Update set_rate for 
>> Zonda PLL")
> 
> Apparently the change is not a fix, therefore I believe the Fixes tag
> shall be removed.


 From the commit message it is not clear that this is a fix, but I
believe that it is. With the current -next I am seeing the following
build error (with GCC 7.3.1) on ARM ...

drivers/clk/qcom/clk-alpha-pll.o: In function `clk_zonda_pll_set_rate':
clk-alpha-pll.c:(.text+0x45dc): undefined reference to `__aeabi_uldivmod'
  
>> Reported-by: kernel test robot <lkp@intel.com>
>> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
>> Closes: https://lore.kernel.org/r/202408110724.8pqbpDiD-lkp@intel.com/

There is also the above smatch warning that was reported.

>> Signed-off-by: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
>> ---
>>   drivers/clk/qcom/clk-alpha-pll.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/clk/qcom/clk-alpha-pll.c 
>> b/drivers/clk/qcom/clk-alpha-pll.c
>> index 2f620ccb41cb..fd8a82bb3690 100644
>> --- a/drivers/clk/qcom/clk-alpha-pll.c
>> +++ b/drivers/clk/qcom/clk-alpha-pll.c
>> @@ -2126,7 +2126,7 @@ static void zonda_pll_adjust_l_val(unsigned long 
>> rate, unsigned long prate, u32
>>       remainder = do_div(quotient, prate);
>>       *l = quotient;
> 
> Since it's not a fix, but a simplification, you may wish to remove
> an unnecessary 'quotient' local variable:
> 
> remainder = do_div(rate, prate);
> 
>> -    if ((remainder * 2) / prate)
>> +    if ((remainder * 2) >= prate)
>>           *l = *l + 1;
> 
> *l = rate + (u32)(remainder * 2 >= prate);


The above change does fix this build error for me.

Satya, did you intend this to be a fix? Can we get this into -next?

Thanks
Jon

-- 
nvpublic

