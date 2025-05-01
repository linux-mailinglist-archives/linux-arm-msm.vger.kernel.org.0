Return-Path: <linux-arm-msm+bounces-56379-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 002CFAA60DD
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 May 2025 17:44:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AEDCA3BB6CD
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 May 2025 15:44:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC2BB2045AD;
	Thu,  1 May 2025 15:44:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="HmRMe8WE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2061.outbound.protection.outlook.com [40.107.220.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDDF933C9;
	Thu,  1 May 2025 15:44:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746114284; cv=fail; b=nTfJ03SdWiyn3FsUJnuHw13NYNilcAdeuADVJy3o6lYZXOMHtEmgXocotS4H2wEuWaz2Zjc9q+qS0w39w3bVX6XEarm2mWJQYAFbOZ1wYwwilx6ZhU3Q93BX2Q2DlFew9BvRIzxgSvqpz+on4W3+Uplp5bV3tQfLDgzKNhxmL4I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746114284; c=relaxed/simple;
	bh=GZC8+KlSafPxVMCXqOB6/hdDwgXNSOlMvnZVDcYptS8=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=o7UyBzITwEAS7nNEBvRjFEyo4+qMAJ7KqMmpS8xOsvXifW7Jnyfg3qTQqcARaa5d4/O3fDGmKSpO5CDRrEksli2c4MliAkIOs3jGe/hc7Gkqn5jp4348yMewfPZ5X4TLNVSdlZHmhy4EoMNGOvWZcCVuirmDosWz1Ex5qhyPiEU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=HmRMe8WE; arc=fail smtp.client-ip=40.107.220.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k9Z82Xgjo17xPY8pWEm6AA3noAaOBaZk01dahg004te6GdtQ9mtRKb41mMEJ4hxcpJNt7a/8vLl7l2Gt6jHMip1sBdgu0XimyooGo8lkYX/bUD2dMRmSi1P3C5jOu+QpRc8mp+vRQeS/bFC4qbIGCjwywoE//ksFp2FiRYpCXzUQSzu8CWU7dYCiBZR4Q5RzHFjnuBU+2HS5JlYj+Jrzo2yNG6lE512va4zEQ1FC1ckKnQPNWn7lk13nfTO1IH0zhoXEUyoWmIrZvPR4FxMfgtLVms180InypC4GeEBtbE0mSywGg6XtxY/GVBrCE3VxHRToLepPL2ON4iOvWi/o7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aYEZLPKdUZISuZOI/rBHyqx5Uifx8MI0CIo/2MfshN4=;
 b=Dl7tFZpa9vFsBx9AYMGO/ePh5IkVMIyOV/cwEjP+YgCCS3OnDS+fslVJ2s2CelCW0mPHx91NKSbAFBuXNyiR/M/YFndXTRjDALHOyP7FUD+P932HXQE+3YQ8Vo7gryAEmdzVjYTjCR2ph00SsJn/IVi1J8ZDqUllKW4KkyWW5jFxV0vmjri4NCB6EcNNf9FYNXEvQVlph4Y0wSX2SjGl0k0juRLVUdkbId9eD1eO3CD0Ntx4IPZavbZ6rqPsjceqR7so+u0LxnZvGx83ia1qBjfL1dQKu+zDJwKRs+ds/j8N9in0zPuGvKGmY05gYQGPXArYEtRns43XNDDENiIDqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aYEZLPKdUZISuZOI/rBHyqx5Uifx8MI0CIo/2MfshN4=;
 b=HmRMe8WEzS2YBKLkWBiWLhhuBv2mELtCKZ2MRmgAw2pDhhMALWnfjM6FYu+rzMuDyhWIopxMEveRRQ6KzHUeHKGfoeD3PH/9BEco5tbn4kXQK0ifdPqcYKcfLmHqnyxlTa7DhpQYtEOtnp1VtZtcWzrJLNScIRFKajI0ru0qKdA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CH2PR12MB4956.namprd12.prod.outlook.com (2603:10b6:610:69::11)
 by CH3PR12MB7596.namprd12.prod.outlook.com (2603:10b6:610:14b::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.20; Thu, 1 May
 2025 15:44:39 +0000
Received: from CH2PR12MB4956.namprd12.prod.outlook.com
 ([fe80::fa2c:c4d3:e069:248d]) by CH2PR12MB4956.namprd12.prod.outlook.com
 ([fe80::fa2c:c4d3:e069:248d%3]) with mapi id 15.20.8699.019; Thu, 1 May 2025
 15:44:39 +0000
Message-ID: <8c8e9362-c116-4a80-bcb7-a44df68e0bfc@amd.com>
Date: Thu, 1 May 2025 10:44:36 -0500
User-Agent: Mozilla Thunderbird
Reply-To: tanmay.shah@amd.com
Subject: Re: [PATCH v2 0/4] of: Common "memory-region" parsing
To: Mathieu Poirier <mathieu.poirier@linaro.org>,
 "Rob Herring (Arm)" <robh@kernel.org>,
 Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
 Daniel Baluta <daniel.baluta@nxp.com>,
 Iuliana Prodan <iuliana.prodan@nxp.com>, "Andrew F. Davis" <afd@ti.com>
Cc: Saravana Kannan <saravanak@google.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Bjorn Andersson <andersson@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 Patrice Chotard <patrice.chotard@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Chen-Yu Tsai <wens@kernel.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
References: <20250423-dt-memory-region-v2-v2-0-2fbd6ebd3c88@kernel.org>
 <CANLsYkxKHhCHYrbAGzQ48QGpL_DbuLnX3=ppmpyu0vjuuvvODg@mail.gmail.com>
Content-Language: en-US
From: Tanmay Shah <tanmay.shah@amd.com>
In-Reply-To: <CANLsYkxKHhCHYrbAGzQ48QGpL_DbuLnX3=ppmpyu0vjuuvvODg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA0PR12CA0010.namprd12.prod.outlook.com
 (2603:10b6:806:6f::15) To CH2PR12MB4956.namprd12.prod.outlook.com
 (2603:10b6:610:69::11)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB4956:EE_|CH3PR12MB7596:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f6fa84f-2fd8-4267-5704-08dd88c71555
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MDVHdEczQkVzZG56bmVpbmdSdTdJRkh6UUd4ZzdGTnZRcjFCV3hvZDNYSUwz?=
 =?utf-8?B?UXBPMHJYUkc2ZEdqTmtVOE9lSGRRZlpwQUJEd2J1czNYS0ZVZElCWnluK0hC?=
 =?utf-8?B?bGpMR0xncENNZi9mRkFibk9xTU5CTG53S2pnejNIVEpnRlBMMWFEL05FUWRI?=
 =?utf-8?B?a1VDSkJuRWRDR21JSXJpQ1BwbGRkcjkvUk5zczZIWDVuWFdRczN0V0VZNTJ5?=
 =?utf-8?B?MW15b2ZRTktLTHBnSldzOXVjdEFuS2t6RVZCa0lKYklaYXVuRkp6eTlJNytk?=
 =?utf-8?B?S0F6bHBCeEZ0UXlReVR3OG1NMklwdXdQRFpwVDFVcm1aRXl6YTR2SFlLSEhL?=
 =?utf-8?B?SFhNYnN5QWN4WXBBWXhpSDAxQkI0TS9iYkJHRFYyNUdQeHh3ZTI3bkdnaU5u?=
 =?utf-8?B?eEwrcFpweVJ1T1NoMUlzL3RjUnhjRERkSUlDZHJxN0xyQzkyaU1aOWxYVElR?=
 =?utf-8?B?MHFhcndubzNtZW8wY2YwdU9tY1F5dzJSRGs3NmJMUEpKN0JUL1RkOXAyNE9T?=
 =?utf-8?B?dytwSG1sTS82cldwcXVaa1VtMllGQjVvL2s5aENCSnN2c0JpRHVwbFcvUWtM?=
 =?utf-8?B?N3AwajNtY0F4ZFRPcU11cjhEQXNUYjl0dFhjMWxnVkh0YWZ4b0xKSmZSeGFk?=
 =?utf-8?B?bitKbXdiUzE0UU1EcGh4QURiWkhWZi9kUHZDWWdiOW05Mk1jQ015VFJIK0x5?=
 =?utf-8?B?a1B6amE1YXdReVNwK3BMbEVqb0xocXRzdnIyRXRLSEg1RkNUMGZwdDQ4cnNW?=
 =?utf-8?B?TWIyUUQxdXBzL0kyQ3dyOWcvY0l0RkN5VEIrOE54azhKMzd4cklyUmcvMTB6?=
 =?utf-8?B?WnpJY0t5ZkVjakpaZ3lWVlIvcVFMNXA2RVNibzlYMnV2NXR5Ly84SFRtMmV6?=
 =?utf-8?B?NzhuY1lJOVU2WmZQMkxKSGh4ZVJBUFk2dytlWHU5RkZWWDVQaERxekVaNU1B?=
 =?utf-8?B?dTAybldvRWp3ZTZIdHljTHZ5NjhMeWt0WU9pS0hRYldXZDh3dThaRjF3bi9K?=
 =?utf-8?B?Yzl5dVVXMVlpVHlYaG9oTjI4M1d5NDF1VHRLNEdieFAya1M4N2cvTUxZYVBt?=
 =?utf-8?B?WDBtcHF3U1BibXlMZjZYQ0F2VEZJZVNXTmFGN0JkV0dCTUs2MnNsaHdvQ2RT?=
 =?utf-8?B?dTdzOHVGMEFqaVpnWGJmNDd1eW1MNnJEdTRUYS9wa3k5a2JLTGpRays5UE5U?=
 =?utf-8?B?ekw4TDhLVm5RKzVLQnJyajc1THVKQjBPTUJOVFRaeDQvVlpZWXh5R0lDdDZs?=
 =?utf-8?B?cGZ2MEduRjM4b2c3RWJ1T1pCaWg4WW9ReWpGNG9rTTYzNWNBeTFKb1hGclVF?=
 =?utf-8?B?V3VGU0hFV3J4OUZvY0Uyb2o3TnBOVjJac1FiZHBzSFlSRnJlNFpCYlE1RHBj?=
 =?utf-8?B?SDZnTWlsZlczb2lvSWxablh0RHVOSEkvb2QrVFM5c1UrL1lUUHhyOXVEbjdx?=
 =?utf-8?B?Ti9aS1dIeFZjbVVOTjNLaFMrZnBxQlBBdVVtVjJjMnRCUnF0bWE3TzdydHFH?=
 =?utf-8?B?b2tlZTl0UTVXNFQwaWE5NmxheDJNME1EbXRLVEZrV3kwK0J3QTNUK0NJU29M?=
 =?utf-8?B?S2RLTFRlbUMxNXB5VFJaQmhqbzVkYk1SSnRlVWQ3SFM4cGs5NUdkV0Vaemll?=
 =?utf-8?B?RmtUNEp4UUQwYnlFejBURHZFTGhYajZsR2pCK2c0RUNCVzJ3L0R4alNBaUp3?=
 =?utf-8?B?cWlVYVZUbllnUnI4am52cWNVWVhPS0NTRHE0ckZGYlExeXlJSjlQNGtqS25i?=
 =?utf-8?B?dkIzMU91TkpKTGhtZWR5eENJdEJLS2lBdnJpZEx5bzBEQWJMbWRMZ3hJMGlG?=
 =?utf-8?B?K1dnaFdsK1NBTGtYcGpGWk1UcHNoVytGRnQrRlF2bDVjbTVSemhoN245QzB5?=
 =?utf-8?B?ZkhSMFpaZ2Q2MG12UzN2d0NOK3ZBNWIwWU4vdWlIUDZpWjNwMkxPVnlmbWUr?=
 =?utf-8?Q?7JYS4F3lhPw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB4956.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VlJ6VWlIN25mUGxpUWljRmFlUzUvU3Iydm5kVERnWDd6L1BuV004VVNSYlpF?=
 =?utf-8?B?V3dXOUo5Z1JLWFVPc3oxWmFoN3MrUm5nY1VTSU50QkJYZkI3cmZzY2c5V3Bw?=
 =?utf-8?B?UHZoYm0wWmdTK0hsS3Q4RTVMam5pVmlEQ3poMm9xa3FybEVXcm5hWU45bHp0?=
 =?utf-8?B?MUFkQ0VpQWpsbm5senlQQVc5cFFxaVBwTjRvTkJMN3NLck11cEVqTU11Z0I0?=
 =?utf-8?B?V2VSdzR6SGJiRVZZQ0RPSDh2amJDajZJc29JbUZLdW5NL2xOZXdqRE9PenJz?=
 =?utf-8?B?TUVnc2lqZTB3bTlqc2lWT21zRUhndFBrb1d4VmVETUhVVHB6cU1ZL21TYTE1?=
 =?utf-8?B?bXRuV0JFblBYK2hEa2xzU1VXbTAwS3J2RXRPUW5DUXFVTXpSUEpYUEhhaHNl?=
 =?utf-8?B?Vmp3OWptQ0x0Z0RmRDYwdDBFcVdsS2dIb3lwY29wckllYUpuSTYwcFJvRDl5?=
 =?utf-8?B?a0tNOTk2Q01iT2xncGZyN0dxbGEvRnRZeS9hMHdQcCtSZXgzZkFWeGhKSDRP?=
 =?utf-8?B?ZUlEQnZwSVZNVmMrSk5ESnR4d3RmUzJDQW1LSFBLVkFoU3M1ajZJVUI1NzRx?=
 =?utf-8?B?aTZFS01tTHZxUHp0RStxU2ZvYlFSeW9nNDNqVVg3TXM0RXNidFR1QVJDbEZW?=
 =?utf-8?B?N3BYSERMeVZQa0NndlZ5Y2ptV0c4LytqekU1TitmMGhOaVhpUU12U2REdHZO?=
 =?utf-8?B?R1U4dnVNMnR5ZDZ3Ri8zTnBycERqNVE0OXQvZlZXeVFJUGRlbFJLeHpFVEVx?=
 =?utf-8?B?WWpRblZiYXd3d1JOa2Vma3g2YXpDMEtqUUlZYnJ3RktzbENPcDdYNGVVaW9o?=
 =?utf-8?B?N3owdEpuSTQ2djZGcGJ3TklXSk1PUVZ6eThvSkhYTDFxUUVCZVVFUUlUM2xO?=
 =?utf-8?B?TWtmbXlhNWY2MHY5NDd3T0UvaVdPK3h5SHByTE9reFJ3K3hGUUk2M2hvZXVL?=
 =?utf-8?B?bGNvdWhsdm9YZm9IT0kydThMalU4Y1VSRFFzd1lWeHJhaU9XWW1qRjZIOTZ3?=
 =?utf-8?B?YmxsemVHanRxOGFLVGR0N29Kd3lpZXFVYWFGTFBndjNUUmRtNnJtdUxoN2NM?=
 =?utf-8?B?QWJrTGFEVjNsNGZSK1AwMm1UY2NGREhxWS9JZGxVYStsZ1puV3JGMTgyTzFC?=
 =?utf-8?B?UHpIdkJkdVdBMjF5VmRJVURJaFpqQmRDdVlNYzhGNUJVMlVlVTgwbmRQNXd6?=
 =?utf-8?B?bEVOM2dDYmM1R0lhcTdWRm5sVmNsRkFhbkpYZXhlK0hKNHNoN3EzLzlPZHhJ?=
 =?utf-8?B?Z1h1RVlkZkJ4bzMycXdUM091VHpCNXEzSGhBcC9kK3ZFYkJKK2VBaVpOM0oy?=
 =?utf-8?B?TzhadlQ5WnBGZEREYzVQMkxIOEZnOVVTRnlpZkhGcGhCcXhOVk93bSt0VGMv?=
 =?utf-8?B?NUI0OWZyRDhmUUdLUU0vOEJsRXRzUkRJaC9JWHVsWW5MN0ZVblA4QW5XV3Ar?=
 =?utf-8?B?ekZFMkpzUU5McEhibjFDVHkxZk1zRkp3OUFlY3dRUVI3VUJmSXl1aGVXNk5V?=
 =?utf-8?B?Rit0YzhIT2hscUI5bU9wRkQ3RXd4L0xlRk84T1BtV2I1QXlhemhsRStOU3Jw?=
 =?utf-8?B?N20wT0JhQ0lLdW5rREluUXQzYTVENDRJa3Nacjc3TGd6M0J3dmhKZFVzZ0Rm?=
 =?utf-8?B?bG1VN2FsZW5UWW81V2hlS1ZCRmtRcU81bXJOMFJaK0VQTU1ES1RhSUhsMUFs?=
 =?utf-8?B?N0h5NndnSFowUUs4ZVBkMGFUQjZyOUs4SFB2elR4M0hBQWtmWXlOZ0VWUGpr?=
 =?utf-8?B?cGt0YllTREpmay9wWjdLaVl6ZmZtRmJkRFI5YU4wMitZbDVxRjVUdkRIWjBG?=
 =?utf-8?B?Rm5vTDZLR3IzMlBjQUZhUUg5amxsK3hoZFVMTXdaZloyd3ZGTTdUbXVpQllG?=
 =?utf-8?B?QnR5czR5ajA0bG9adW04QmVaM01GZHlLTEpSSWpTMUhQaU5rcWdZbWF3U0p3?=
 =?utf-8?B?eFRwVnBDMTRrNnlYTmtKa0x5ZmJXTVNnckI4V2UvK3FxekUzRnpGTGJvS1lR?=
 =?utf-8?B?dldBRXFkRUkzVTA1cDRGOXQ1aHQ4OENSRXY5YlhLd1RYUk9GM29TQ3hRdlEw?=
 =?utf-8?B?T2hqTGc3MHBFaWg0MG85K0V6Z0F1Z1BVSE1HMTRpVDMzSHltbSt4dm4rR01t?=
 =?utf-8?Q?imdbMNUSUGzvb6Z+jr7PipF6C?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f6fa84f-2fd8-4267-5704-08dd88c71555
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB4956.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 May 2025 15:44:39.5925
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hjsSOWHwy1y2PCYOkd244Qjhr8fU1y43pZQMdiHvop9L3d2Ckcbv0r+CGGCBrJet
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7596

Hi Mathieu,

I tested this patchset on top of recent for-next branch. I don't see 
issue on AMD-xlnx ZynqMP platform. With this:

Tested-by: Tanmay Shah <tanmay.shah@amd.com>

On 4/24/25 9:14 AM, Mathieu Poirier wrote:
> Arnaud, Daniel, Iuliana, Andrew and Tanmay - please test this patchset
> on the platforms you are working on.
> 
> Thanks,
> Mathieu
> 
> On Wed, 23 Apr 2025 at 13:42, Rob Herring (Arm) <robh@kernel.org> wrote:
>>
>> While there's a common function to parse "memory-region" properties for
>> DMA pool regions, there's not anything for driver private regions. As a
>> result, drivers have resorted to parsing "memory-region" properties
>> themselves repeating the same pattern over and over. To fix this, this
>> series adds 2 functions to handle those cases:
>> of_reserved_mem_region_to_resource() and of_reserved_mem_region_count().
>>
>> I've converted the whole tree, but just including remoteproc here as
>> it has the most cases. I intend to apply the first 3 patches for 6.16
>> so the driver conversions can be applied for 6.17.
>>
>> A git tree with all the drivers converted is here[1].
>>
>> v2:
>> - Fix of_dma_set_restricted_buffer() to maintain behavior on warning msg
>> - Export devm_ioremap_resource_wc()
>> - Rework handling of resource name to drop unit-address from name as it
>>    was before.
>> - Link to v1:
>>    https://lore.kernel.org/all/20250317232426.952188-1-robh@kernel.org
>>
>> [1] git://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git dt/memory-region
>>
>> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
>> ---
>> Rob Herring (Arm) (4):
>>        of: reserved_mem: Add functions to parse "memory-region"
>>        of: Simplify of_dma_set_restricted_buffer() to use of_for_each_phandle()
>>        devres: Export devm_ioremap_resource_wc()
>>        remoteproc: Use of_reserved_mem_region_* functions for "memory-region"
>>
>>   drivers/of/device.c                       | 31 +++++-------
>>   drivers/of/of_reserved_mem.c              | 80 +++++++++++++++++++++++++++++++
>>   drivers/remoteproc/imx_dsp_rproc.c        | 45 +++++++----------
>>   drivers/remoteproc/imx_rproc.c            | 68 +++++++++++---------------
>>   drivers/remoteproc/qcom_q6v5_adsp.c       | 24 ++++------
>>   drivers/remoteproc/qcom_q6v5_mss.c        | 60 ++++++++---------------
>>   drivers/remoteproc/qcom_q6v5_pas.c        | 69 ++++++++++----------------
>>   drivers/remoteproc/qcom_q6v5_wcss.c       | 25 ++++------
>>   drivers/remoteproc/qcom_wcnss.c           | 23 ++++-----
>>   drivers/remoteproc/rcar_rproc.c           | 36 ++++++--------
>>   drivers/remoteproc/st_remoteproc.c        | 41 ++++++++--------
>>   drivers/remoteproc/stm32_rproc.c          | 44 ++++++++---------
>>   drivers/remoteproc/ti_k3_dsp_remoteproc.c | 28 +++++------
>>   drivers/remoteproc/ti_k3_m4_remoteproc.c  | 28 +++++------
>>   drivers/remoteproc/ti_k3_r5_remoteproc.c  | 28 +++++------
>>   drivers/remoteproc/xlnx_r5_remoteproc.c   | 51 ++++++++------------
>>   include/linux/of_reserved_mem.h           | 26 ++++++++++
>>   lib/devres.c                              |  1 +
>>   18 files changed, 339 insertions(+), 369 deletions(-)
>> ---
>> base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8
>> change-id: 20250423-dt-memory-region-v2-a2b15caacc63
>>
>> Best regards,
>> --
>> Rob Herring (Arm) <robh@kernel.org>
>>


