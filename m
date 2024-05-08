Return-Path: <linux-arm-msm+bounces-19532-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 04A198C05DE
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 May 2024 22:52:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F17D91F21B52
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 May 2024 20:52:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB75C131746;
	Wed,  8 May 2024 20:52:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="l3ObWLnN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2057.outbound.protection.outlook.com [40.107.237.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B70A85626;
	Wed,  8 May 2024 20:52:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715201568; cv=fail; b=TEhQpjZDKikgoO+pcXcQRnXM9NTSy2fTjKiZpb/3VOhfTzx69S7dp98XiU8BXVitgR89AacQyx39b7EgUHCX2iXNbfj7DvW8J4mAZPXuEeZq6H1ATBTna008O5Ilnp1zBlhhPixRQQJEjJOei3BCc/WJewS1JQCIJ7CODLckLU8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715201568; c=relaxed/simple;
	bh=1R8SnMAtqaqMvkrshS9avABoNtDIaX/nUVZ+vZYZLgY=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=dNDkxwLYkPVO/40imyLyBOFGYlLGGZgIYHlUi7gMQ7Jjy8blIRSOlI3BNKIGArUZxMWiAg5JfBxkyg866V0yuzQqMq+OUGSRQjV8vybyCB05TCNEAtpovJd9S8B5JsF/pzAbyNKd9JMCnibuj+VitfryoF7LUNFpi/9fWzw/aX4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=l3ObWLnN; arc=fail smtp.client-ip=40.107.237.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kJgX1RytGLUYQrFXyWq4wvHhwWGBEmUk/nISi4HeRGCoL+lqhvJ3ju9AyfXNbPagl2adXOvIFjjkbnmruz5ATKrgCC1xCM6qUHYGffg4M6CrriOTWLE/I6vUC39kcyILaTC78CogH95cTLU642c2j7pk3nlWtYfvRYrUWtR6MoVYZnEuoEHso3LTS/jW6PA0Wb5xUzYeDoWXHoxqNlYJTjewCxBDLCYhx5p/JAvnwT0R6FJ5VlP85ZfkKsJ9MZzdTXFYa02a/5YdA7yhXl03L7q50th/h2onhO+W0BDt/e2CGig4x/3TB67ATQOFSGivMA4LfSLX0S9QnfKiljYBDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tGeDinUwJudWsb5GWrCseZXnIfK12L1axe4ZMfksY3g=;
 b=NlSOW6BGKCHVorXmrvNubwODZhVIvuu0zksGGtIgUN9/05JGHTyUAt3+9MOuyRlK81p1ft85ZaQR+azLaErN9AA6YQ3oL+0u/LyxYpvMLwm9jIA2gW0FmiT1tYknegbY9R5W0LsNWNp5/FcHBID3eELviOQg5jwniW6SZcp/iUw+yEiHRrZ0wMNfbhlbYa1rkZAWQTNAh4M4YGGdzxdxZ5LTc8eVnpZu9PxBCzogm9x+f+oR6R3GZa2pVlJQuPNPyvXlvVRE3Z8LID/U2MiSUsHeAefJwaQTjuOuer2z66dH6jovoDSs5V7j4wWGXwWOVEe+W9mZ5d23kE1xojK9Bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tGeDinUwJudWsb5GWrCseZXnIfK12L1axe4ZMfksY3g=;
 b=l3ObWLnNbs2X6UrchPCNqI6Zdybmxpf/rbP6deuebrl/wJFmkgei3jrmyC6aryZ/yYhZp1lKnapY+7YwTzL4LeA/9eU5JSIOPhR4aKMMInL5T60Z0kaInLfwNEe14UE3igEALDQUM1gpNYPljgl/wjFDdhnNNxLp1JL1W3ceZeMO9GotIwAbDprirrVJ988l13seupW0M1zcs+N7azR2bLdSidCmFcvUALk6SvYbkTKhOABTfPK27VEjXlbgjAvVlLNBikfBixCfQNDlILb+OdjbcF9v65NyeNwuLLilFMCPYnXx2oR/bD4f61DrgC1HfZSm36NKYGkOxceTsCIVfA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CO6PR12MB5444.namprd12.prod.outlook.com (2603:10b6:5:35e::8) by
 SJ2PR12MB7823.namprd12.prod.outlook.com (2603:10b6:a03:4c9::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.43; Wed, 8 May
 2024 20:52:43 +0000
Received: from CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::ae68:3461:c09b:e6e3]) by CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::ae68:3461:c09b:e6e3%5]) with mapi id 15.20.7544.041; Wed, 8 May 2024
 20:52:43 +0000
Message-ID: <780207c9-fcf1-460e-b16a-aad60c12ac71@nvidia.com>
Date: Wed, 8 May 2024 21:52:37 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm: Fix gen_header.py for python earlier than v3.9
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Clark
 <robdclark@gmail.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-tegra@vger.kernel.org
References: <20240508091751.336654-1-jonathanh@nvidia.com>
 <83b6e1aa-c8ec-0bd7-2c98-20705741b76a@quicinc.com>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <83b6e1aa-c8ec-0bd7-2c98-20705741b76a@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P123CA0074.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:138::7) To CO6PR12MB5444.namprd12.prod.outlook.com
 (2603:10b6:5:35e::8)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5444:EE_|SJ2PR12MB7823:EE_
X-MS-Office365-Filtering-Correlation-Id: bdc58946-f3ef-4be1-867f-08dc6fa0ce9c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|366007|376005;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NU16MzFEWEJQaEdLUmY2RWRUTGFrMXVveWc1bkJuZUh3UWx4QTd1Qjl5TFVE?=
 =?utf-8?B?VHN0c3A0c0RMNWJnQjZGNUZMeGVqUU5BSDJoUUMwaVJmb0NLZWVRRlEzOXY2?=
 =?utf-8?B?cFNFcGlQQTRTTFlqVGJPZ2kyUVNCWnZYSDlORmh1eURPY1FoaHhhZ25uRDRS?=
 =?utf-8?B?WDkvV0Qwd3VyUE5TUU4vZm9YdVZXQlZXUjdLTnM2QWJ2SkpFTVZSZ3BzOEJG?=
 =?utf-8?B?a0hTa1gwWjlmN1NONnJqZGpLdTZ5VW9xZUFkWW9WME9FSzdFdVJlZjVSenc2?=
 =?utf-8?B?a2pQUEhZOWdKQTdCZTlWeWkyblNPYzUxWDRQU1Q2WDNzS0VwMDErL2k5cXJB?=
 =?utf-8?B?R212aWcwZWdLblh1TU5iVjlmYUpTTCtOenhJVHlTYVdhdEJ4d0VjYWptK05r?=
 =?utf-8?B?UWxpRDRPMW45VzRxME1aOWEwVkVvMVcrVXgvbmt2VHBOL09wa2NYZmExbDYw?=
 =?utf-8?B?c2MrRTFqQXk4WXlWY3l1RCt5amxXUWlwTWJQU2xOSC9PbUpxZ05lOHpKR2Nu?=
 =?utf-8?B?c1Nnai9jckNtcldTV3BySGJOamhrdVdvL2d5bGFJV2pBSGFZS2xETE8xTFN1?=
 =?utf-8?B?MUhkTDZrWTZKUGljenAvcU5KNkd5R2NCTmEzZkw5YjQ2OHcyQ3dyMXkvdFcz?=
 =?utf-8?B?eGc3b3FZMklOVTJTR2VGSHFmd1NyNzJGaU9uVUthSi80RVdnUTEvTTM0ZGxx?=
 =?utf-8?B?UlZKdkErV1hvaG1tR2RiVW9BY01lemY1eHgwcU5Jb0JpWVVERmo4TEl1d0wv?=
 =?utf-8?B?Z1VCYTRlblpSbmpMclZFWHRPbXZSZ1FKRmFtRnd4SUtXeldpeDltRzZGWnp3?=
 =?utf-8?B?TFY0d1AyeXRJejkwS0UwcTFpdjhDRTlVdTEvSklaZW15RHZzV01mVjRkNTh3?=
 =?utf-8?B?NUJSRC8xTWlOOHZiUzFIbVZyLzVQbXVkeUUrUjNSenBKcnVQSGlNVlZvV1NU?=
 =?utf-8?B?RGpLUnNuSkRZZHhScDFob2l3U25TZVJTRFljdFV0bVFkdkFpY3l4TTlHdjNa?=
 =?utf-8?B?U0xyWEkxdGw0R0JNUElBRTRNeXM1dUxyUkZkT2Y0L3FkUEhzQ2gydVRPRnd3?=
 =?utf-8?B?NVVKanQ4Z0t0bm9GRGRiUlRBWEFKMUdrdDM4NVVWMFNGUmQ5a1M0ZU5jeWxX?=
 =?utf-8?B?K0RyaGhuQk5JUmpZdGdSWVlPbHQrWjZ0QzlLZ3VxaG9sVnhQTG5Ra0RTTDNJ?=
 =?utf-8?B?WFdxSXlrV1FlZTJlRklXOXlKRGdzc2NiTGdlWllnNEtlQmxmdlVuWlBPYmlM?=
 =?utf-8?B?VEVhU3FIU25lY0dvdkp6eXVmdGMvMjBBK3BObDhlTU1qTkNTcHhpYnlVaStU?=
 =?utf-8?B?T3dSbUE1RmhCM010dXY0SytnZjlVbEFlQ25BTXlXWFZRNVlJeVMzenl3YXFw?=
 =?utf-8?B?MHNMYTNIUElVR0xlM2tLZVFHeDJLdUlyM0lLeUFTa2hnTks0ZlA1RzlOMEFJ?=
 =?utf-8?B?ZEJwckpaa3ZsVjB2VXlMWFVqcUxZTkIyaFZQQ1BMd2dza09yL29oYlN5d01B?=
 =?utf-8?B?WHlnbHJCdEt0Zm5SZ1RWY29QL3RXN1NNWHAwNWZ6Y05xQmlTcG4yais3V0wx?=
 =?utf-8?B?OStvL2pOVVRtQ29iWFYrRGp4dEFMVS9GcThtNnJkUWkwM3d6eEpNekd1MnJt?=
 =?utf-8?B?bVhSdkVXaFFYYzRGd3hibVFvdHZnMHdrbVhUSDdjTDJLQk15cFJyb0FEMERm?=
 =?utf-8?B?MWNITW8xWTN4N0ttTE1Yb1VjMllzSUp6T2U0M2x5bWREWXFSZkJxMFFBPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR12MB5444.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(366007)(376005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TU9IbXA1eFVNQ0lWb3l1YkNzbkFXMU9EamhEY2Y2bFhKM0prMVltRmt2NTdr?=
 =?utf-8?B?Qkt0WGlhM2lLVXhudzYzSm1EYXRVTnRua3hCcEJ6dXJCMWczcElFWEk3Rk9C?=
 =?utf-8?B?NnBQS29ySzczOWthd05Yb3NEZnpQNUpObkFGdTNUOW0xNFN4em5XK0s3UmRr?=
 =?utf-8?B?am9MOGlkYitobXBDOUFBRGQzaHVzdGtNa0h2VFZBclRJbjFqMlpSVUx4TENj?=
 =?utf-8?B?Y3B1UmFadzlEZ2J5UHpST3o3R25tOEVUZjBTbjhrUTVqRncxK1ZvckVXcmtN?=
 =?utf-8?B?WjVPS1BwbWFKbDVrd3ZGT3pCZW80dXRqbDlDdEZaNTdPRUNRUWJoVHVxYTNN?=
 =?utf-8?B?VEdXOGdhRC8vbnh6Rkpoc3pmL2hCYUVwTjMwLzZyRk5uNU5yT1U4RzQwaG5P?=
 =?utf-8?B?YXkwZzRIL1dmdzh1S2M5R2ZEcklVejBSNWlhM0tKa2M0amw1dm9ZRzg5UzR0?=
 =?utf-8?B?NHI0eC9TOHNYclVpN2pXNDJ6K3F5ZWpTdlBJaHgyR25WME50ek1IN0ZnU3Vm?=
 =?utf-8?B?VU1ydElLVHBJZDZQbXhsLy9tNmdyM3JySUliTG9zYVhCZldabDY1OUtLTTY3?=
 =?utf-8?B?R1BwZ3FaL1VYVjVyb0JrTkhKRG9taUJobktlY3UwSHd6aWlJL0dTNWZPbXYz?=
 =?utf-8?B?eE1kMG56UUM0UVR2RnF2TEpqK2JFT1RtcjBpMS9yQTBCTml3TDRhSGZpcjVt?=
 =?utf-8?B?czB6RlFCTytteUZwTWV4ZDlDR3hsT3hSZWwrSld1U3hCSTgxcklNd2w2M3lC?=
 =?utf-8?B?a2dDVTN2Y2dqdi9UTWxESFBqeng3M2RHeFA2a2VYQlJDVThwdnYvZVZWSUxY?=
 =?utf-8?B?YkVkdElMUmxuOFlpZUZqZ0d4MWR2WStIWStmNXVSdTF6OEtBcWZXS01oRFM0?=
 =?utf-8?B?dFhXNjdYNk9RRTFrM21hdnFObUNjZ1NCWW5ZNVByUk5uY050Q1hmcnFuSm5s?=
 =?utf-8?B?ZWhsMlF5cEErVXZkZzdVNUVneStnTU96YUFDTmw5UzYvY0wwbjVHM2NrRVpF?=
 =?utf-8?B?RHhtSGRkbW5wLy9IS1ZZN3M0R0piQkxUNDJrQnpnb3NwblJFZUFpaklwM0xq?=
 =?utf-8?B?LzFhQ3VCb2VHSDNmVWFPYVdQclJraTlCeEpVT01LOURyWmxuVm9pMm04cklm?=
 =?utf-8?B?SU5WaDRUcGZKN1IrUFhBZElJMmtvaFZNT0g0ajhVVnRCa0xaT0J5K1E5dFBr?=
 =?utf-8?B?YzVEa2NBaktJY2J4anZxT2VpZDAwWk1XRFlaOUJBbUtIZE9lWEZ0YjFuai9a?=
 =?utf-8?B?bzltdFlScHN2N0NBWm1mQWUzUGF4VEVBejRoRGg2M28vYWY1cHFPUy96Sm5Z?=
 =?utf-8?B?Q1ZUVnVOSUNMRWdpdXkzMjNEUFBuVlZ1RjVEVWtjclBDY3B1M0tCd2ZySExP?=
 =?utf-8?B?SGZzd2hMQWVLeldtQzk0bFZlZGJodDkrU2RaaEZURnlpTWlpK0NWaHhacDFl?=
 =?utf-8?B?Rmh0SVZ0Y25SOCtjZFk0WVptSTNUSzFTUXdBWFhyMXJoT2poRmpLbkkwT0dE?=
 =?utf-8?B?YmxuVHVHUHkwMFJPSGtSa3g1QmNwMkNyVE1rcnRZTUdiczdUMEo5RVM5MGx2?=
 =?utf-8?B?NTNCSHRPQk01RktrREN2QXAxeVBERG03NjRSUTJLelZyTEZva2ZhRjJsR0pX?=
 =?utf-8?B?eGR6aU1YaFUramtkWG5YdmVDZ0ZOK215UUlhUENOT1JpTFZHWmJvNmFocnlh?=
 =?utf-8?B?VE43WWVSN21kOFhxZHJJODVpUmdvVTVkd3VJdi82ejB0eFU5YXBpdWVGODQ1?=
 =?utf-8?B?RVJrSkg0MkY2VnBJSUwvU1pqQXFMR2FtTEF0MzV1MG8rditWN1dWUzI5OWxP?=
 =?utf-8?B?ZW51UlJWQW5IRi9uVCtIcFcrYkVBUmc0MXljbnNSajNaUUhvdWRERDBERmZX?=
 =?utf-8?B?c0tnVnhEK0h4bE95NitUcHJLYm9rTjdZcjZtWTBOamoyS250c2tPOHBuS3d4?=
 =?utf-8?B?TTNvYU1GRkgwL1JkNU9vZis1ekw3eXZqdjViS0IwRGZ0NVYwSFF3RjFPdGs4?=
 =?utf-8?B?QmhpVjFBcjZ0QWU3d3B2TXJJOGZHSERkNmw3cE54QkNuNGZYZGhWREhvY2pD?=
 =?utf-8?B?NDlEQnVQN1JGcDRnNmZ3UGppYzJkQjJGY2l2WHhMSTUyUndiQUQ1Q2FiUms5?=
 =?utf-8?B?VXovY2NMUG96V0ZFRU5ZMjZJSWlYcnNmSG12N1VGeWkraVdKbStoV3VQSzJC?=
 =?utf-8?Q?VGvwTXGlNshFROs3+b5UyaDjyQomNXTF8Tx/SREKZU2e?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bdc58946-f3ef-4be1-867f-08dc6fa0ce9c
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5444.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2024 20:52:43.5262
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lGYEW1qctQYhAs4UwPDb0ArVi2MrPBP/ERs6CK/BN23MrmyYBXDALhg5uLQEYKKv53H6ClfMaHyNA9u0bLi25Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB7823


On 08/05/2024 17:46, Abhinav Kumar wrote:
> 
> 
> On 5/8/2024 2:17 AM, Jon Hunter wrote:
>> Building the kernel with python3 versions earlier than v3.9 fails with 
>> ...
>>
>>   Traceback (most recent call last):
>>     File "drivers/gpu/drm/msm/registers/gen_header.py", line 970, in 
>> <module>
>>       main()
>>     File "drivers/gpu/drm/msm/registers/gen_header.py", line 951, in main
>>       parser.add_argument('--validate', 
>> action=argparse.BooleanOptionalAction)
>>   AttributeError: module 'argparse' has no attribute 
>> 'BooleanOptionalAction'
>>
>> The argparse attribute 'BooleanOptionalAction' is only supported for
>> python v3.9 and later. Fix support for earlier python3 versions by
>> explicitly defining '--validate' and '--no-validate' arguments.
>>
>> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
>> ---
>>   drivers/gpu/drm/msm/registers/gen_header.py | 3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>
> 
> Thanks for your patch, I had sent something similar y'day.
> 
> If you are alright with https://patchwork.freedesktop.org/patch/593057/, 
> we can use that one.


Yes that's fine with me.

Thanks
Jon

-- 
nvpublic

