Return-Path: <linux-arm-msm+bounces-56529-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7401CAA7642
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 May 2025 17:40:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A28D31C04D84
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 May 2025 15:41:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4EFC2580C0;
	Fri,  2 May 2025 15:40:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="2fvPQ8dl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2053.outbound.protection.outlook.com [40.107.236.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAD3A257427;
	Fri,  2 May 2025 15:40:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746200447; cv=fail; b=PoxjuR2as4qWBsZ2SJ/O1nMQiw63frbMTSMwO0frBqir4NW3ewan3Gub+9xjKuwpTiuXydYL/yn4DSqZWyga8W3OeUlQg7ig3ZKaO942cYFbg/ST9oUV5QPuJd9xaqv3meB6FXR0XXcyUxFoxmsFqInCRDqW6drxI6dcK5jJn/w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746200447; c=relaxed/simple;
	bh=7kq4r68vEvJxvILb4F4P0zjamfHbCSVYvmBCOZyjA90=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=R11O+xDvATnk7BBkzOlomx8N4AY0DgwCfNuqIaeI9cpQM44VpfIduyvkMhVaRyF1T7GfWiC5IaMsanrvDZXbR9QZassTgddVNo34mcwOKtVqOj76wN4J2LVnJvSBWzmRWmfEvRbobuT032T41OgB8mnwK323ZFFMhESmf4TGaEE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=2fvPQ8dl; arc=fail smtp.client-ip=40.107.236.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ltBfzVDWzveRH4q84PDlUMM3vmrK5gF0h2/W/Rg2EPMGuWlWoi2Ci8v62Tkw/kWW4x5pkct8qpb8/djGCWUDeGU0vAvpSUlavMb/07WOFcIYNgnWLoFZ0H+FqqpEPTExFz7QDQxFgmx/3iparff2NIPcpl3xQZWKtvLjtHbSpgezAvhflCvF/Y+mX676PJ+XkcVJzP9WVQUEmUOWfNyIEQ1pRgHV5+vjQzwFzBbOuN+eZLEug+SIgzbKBXkzoU7YwPF9nMk27h9ALwpj8nwYHOCsU1baYoe6WLt6WLCXoOcgCM/4xn4UPXAAEyL10yBc+VjHvtzRKMLDsu/Wt7vMyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fDfrqby/neydW5A7T6X4aSdWoITFfK4UaM5gpdalzAg=;
 b=REX2KHefhF4B7SjF00fkdPBFAiJ2VtmpegLUvCGAtEZ4oL/G498nzw+t07xqDGZU6S4p35QJL//ouTTehB6MP9tYnv299vHVVgBj/gCB/jvrYwFbl5iD4W/F32HECC1KBM7Z4aONne5qtKwqtcVuqVKZswwfrfHuA5Hu1c1MLZvu0e5oqBLJNIBCz81WSFwPD7VwJLWCNYoVWlPJToouHZs3P7fZBYProWEdcIG64ZTBv1Ierh5rDUipEXnKh8Xt9DzLsnX1T5OI027lqGn/p3SOGbfAZ/v83zLfYNvDsqhNqZX9o0lQ49Hom/6zRhXO5qltpf4hgFxqrtPOsDQtBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fDfrqby/neydW5A7T6X4aSdWoITFfK4UaM5gpdalzAg=;
 b=2fvPQ8dlb7FKYlY3F5YybUfN1Mxlq1GVdJXZ5KxmSuWqSJ9biQ7w1VFPZux6h9eD0aToYNJ+NZQ4N+GhW6NNLHijAIPc3nTfQx/cK5pWcFQaMHs6TsCVwDzLRybXj6qv/2Ke+lORrfl00ap3OfDfR4Y0ObZzM9mIAp5ct3+6aDI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CH2PR12MB4956.namprd12.prod.outlook.com (2603:10b6:610:69::11)
 by BN3PR12MB9594.namprd12.prod.outlook.com (2603:10b6:408:2cb::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.19; Fri, 2 May
 2025 15:40:40 +0000
Received: from CH2PR12MB4956.namprd12.prod.outlook.com
 ([fe80::fa2c:c4d3:e069:248d]) by CH2PR12MB4956.namprd12.prod.outlook.com
 ([fe80::fa2c:c4d3:e069:248d%3]) with mapi id 15.20.8699.022; Fri, 2 May 2025
 15:40:40 +0000
Message-ID: <938c4876-d284-4f11-a4ac-9f3831d3c14d@amd.com>
Date: Fri, 2 May 2025 10:40:36 -0500
User-Agent: Mozilla Thunderbird
Reply-To: tanmay.shah@amd.com
Subject: Re: [PATCH v2 4/4] remoteproc: Use of_reserved_mem_region_* functions
 for "memory-region"
To: "Rob Herring (Arm)" <robh@kernel.org>,
 Saravana Kannan <saravanak@google.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, Shawn Guo
 <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 Patrice Chotard <patrice.chotard@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>,
 Chen-Yu Tsai <wens@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-remoteproc@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
References: <20250423-dt-memory-region-v2-v2-0-2fbd6ebd3c88@kernel.org>
 <20250423-dt-memory-region-v2-v2-4-2fbd6ebd3c88@kernel.org>
Content-Language: en-US
From: Tanmay Shah <tanmay.shah@amd.com>
In-Reply-To: <20250423-dt-memory-region-v2-v2-4-2fbd6ebd3c88@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA1P222CA0186.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:3c4::18) To CH2PR12MB4956.namprd12.prod.outlook.com
 (2603:10b6:610:69::11)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB4956:EE_|BN3PR12MB9594:EE_
X-MS-Office365-Filtering-Correlation-Id: ad3e229c-882d-4b31-e6f5-08dd898fb0e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|921020|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?V0ZqRVhUZm5iTzZOa2lidHJVTUlRUTRMbHBpMXJ2WUE2NUczZ0RFeDdBVTNG?=
 =?utf-8?B?TkI3SEVjazF6NUFIRTQvcmV3Q0o4RDFnZldaaWlVYkYxUjBMaG5Wam43L1Zj?=
 =?utf-8?B?ZlZpeGt4WkN4RGlUV2tVbk12NXpERCs0aDc4QjEvVEtsRTNPL1piaExUdzl5?=
 =?utf-8?B?ckFwamt5V25COUo2ai9CcTY3TkFSR0dNK3FadlE2eXFCcmQxWVZkbDJkMTZn?=
 =?utf-8?B?WmZqZEtqekRrekl0czRZMGUvNzFabE1aV0lOenRzTEZnRmhEWXdMZmVHaWZX?=
 =?utf-8?B?SE1RT0RCeTdPS1BoazBTbHJPcUFlL1I0S3U3QnVlcUZ1Y2ZlT1FORnI4L3Fw?=
 =?utf-8?B?ZlVSc2FVMjIyRytnczY3ZHlzYjBTVklvLzFUU3VmaHJHMGNaU0g1Sk9DL01s?=
 =?utf-8?B?V2VwUkxIU3pibnhXTjRKendXU2U1U0pOSXFMNHBaRm85STRXYU5KVDViemdS?=
 =?utf-8?B?NHVjRGV0aVhIM1FidG94bktHTnlYWjQwVVZQYjZCV1FZbGZ3bDhCcS9aRjJy?=
 =?utf-8?B?U0d2R1Y3MXJ1WjlPSTlLMVp3UG1lM2VobTNxZ1g0TnFQUzhZY0VRcUQvNmVj?=
 =?utf-8?B?eDFrbE5QRHNjcHFzQThpd1dKc1g2Y2dQN1F4Q203RkVPR2oxT1ZEbWJSNmV3?=
 =?utf-8?B?VlpRaTJNVjBIcWFtUUFiQldBQWNCNFZzS0ZMVURaYnJkZGNWbm5iWHRkVG52?=
 =?utf-8?B?aDFINVVPN1NSSWJaYkVwdCtYQlo0TnY2TGRUM0QxR1JBRUVuS00xZVV0MUpC?=
 =?utf-8?B?eHloN01wNDVQTHdTZlI4bmlFM3hEbkNJNVVwNzg1VHU4dWlwc242VUhpZWFL?=
 =?utf-8?B?MEM3QWx1V2Q3NFRTVVk2SGlGbWZoMEZTTVhzVy9ab0Z1VnNiemxkK2o5ZC9X?=
 =?utf-8?B?RCtPQ3NheGZrL3l6OFAzTmJzVjVvaEpNbUJVd2NLUThQc0lMbTdyeC9Oc1pK?=
 =?utf-8?B?NldZWC80eTF4c0VxemVDYUlUdnRxdm9hTndHWmI3aGNIZmQ0L05BMG9XQ21S?=
 =?utf-8?B?TDZhd1BiejFCbEY4b2EwbXdFdUhnbHZ2NVpza2cxK01WcWZyaE5JQ1hLWjJW?=
 =?utf-8?B?MklFOW1odjIydHlIeHFmRTYzZ3NxY1FTbW1ncXJFT1ZFRWFaUmNmajZVeWJx?=
 =?utf-8?B?Nk9aZXdGNzRqaDk1NXQrSDZjVU1mZy9xRlFJVUNXSzBaSzBXdlpXR1NsdDBN?=
 =?utf-8?B?SG1YRmRvYldQZE9uNWFVSEx4Q2Z2RFR6TTJhZ2tGQnRTc3BnRXJtSWZ5MGZU?=
 =?utf-8?B?UzkwOWl5Slp0Z0UvMDZwVTBTcFkxdzRZV21LZlZEZ3c4QkZZUW5OVEpIYXM4?=
 =?utf-8?B?aWxHRlFjZWxxbHd5YmIwYXRmekhCY0o4M2Fab3ZxclJxZTRmbmpNa09ERkFY?=
 =?utf-8?B?VGl3d1hvTFV6dWhUY1hnU293NGl4ZEV6eVhrd1d2K0JRdE9zQlR1SCsvT3Nw?=
 =?utf-8?B?OVBTc0VVMVBnTG1zeWs4TkF4d2s1V2puUVdkandtbFR3VERzdnBLQXRqendM?=
 =?utf-8?B?UXozZzdGWnA1MmhwWWtUazBmamZFaVA0QW1lcmFKbUQzcWcraXZoYUhSVGh3?=
 =?utf-8?B?a1hxS0JPRTd4MXRoMENya0Q3eVlIQ0Z3cG1rQ2VtZUV1UVRhaldvT2Q4T09T?=
 =?utf-8?B?R3ZLNTRqcjFHSHpCVmlWb3hyNmdrZGpSZnkxUE5aMjVHVW5aUGdBc2l6Y2F1?=
 =?utf-8?B?dkx6bnBzNFZaVTVHbDEvb1Fhb3hSa2w1N0pKdTJZWCtRVE1rWDllMDV0RkIw?=
 =?utf-8?B?dDFtekZYR1I5V25UTURBRjJyeFR1UG9QU0lPanFFbVlOMi9VcEtjVldkMFI1?=
 =?utf-8?B?U2QzL3ZpUnl0QkhEY1MvcHNvVjhlTjZyTEcxUkFuZm1GcnJkczl2c0JiNG9F?=
 =?utf-8?B?ZzhqZXpXV215TkFrY0pUTTUxYjBlUno1SzdNWmYxYU5MQkxsakdWOWErQzFu?=
 =?utf-8?B?dllLcFRTY3lWRHMwSnZMOTJFYlczOHhYMzNmWGFCcWdpSC9RS0pRWEgzYzBs?=
 =?utf-8?B?VWJuU1ozSnN3PT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB4956.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(921020)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SWxuOUV2bTcveGo0amFMRjVqNEpDbFlxSXY5N3lDcjZWMTRaRGhoU1dHdW5U?=
 =?utf-8?B?b3BkaU80UHFlNDRCNlJjWHNwUlVDMTdvVEQxakh5ejE5eGhYOFVacUh6TnZ5?=
 =?utf-8?B?K0ZTZWlKREw5eDZ3R3V1SlhwZlVRNE5GVGdOWUhOLzFzdkgxUGJvcnVoRVB4?=
 =?utf-8?B?S0laTVl2RW9ZVDZMKzlSMllabVdQS1c4ZzZtZ0RJaERSbS9ocDY5Q2dOWXg4?=
 =?utf-8?B?T3ZIUWJQbjh5elFSbjlaajVjc216SjlvYTRtZWIwcmZoZVhxVTUrcHI4Rmx6?=
 =?utf-8?B?aVc2clhmQk5Bbmc5RUM3VmJ1c3c5SnVLaTVMY1pieUdCbmYzRGZLTGRKQlZj?=
 =?utf-8?B?TWlLbTFYNGYvOHhTMGxUZnFDcVZLRVFtMkVxeGJzazF2SjJxNWZ1WUVxMVNL?=
 =?utf-8?B?V0NyeHFmYVZHeVIrWHZBVERZQ0FZWWJXQmFqMzlSZ0t5WkVSdm15bWVFS1Fx?=
 =?utf-8?B?UGF3MFpaSkgwZ1MxY0RBdm9sb296Uk9RZE9hcnhIUlpQaUxWcEpkNUFRT3pN?=
 =?utf-8?B?bnNub3UrNG5rMTlXa2UzWldvYXVtOVAwdktKNVIzZHArZnB0dHh5UFR4MUp2?=
 =?utf-8?B?S3NGS1p1SkZETXorM0RlU1QvUm42K3gzVkphSzhVblBHdUdtYnRWSm84aU15?=
 =?utf-8?B?MENlbVk3eWpESktyS0ROSHpwc2d0Z01HMStyM1JXUzFIQklIN1FvMFU5VWw3?=
 =?utf-8?B?WnVIeXk4WlVzUGh6ZytKeVY2bXk4UU5xR0N4MDZaWHFJTktXaDlGUi9UQWVr?=
 =?utf-8?B?ZUkzYU9TdmZSOGE4NFZYNFRnSisxRm1pRU9UbnFFellmbjB6MUpuNXU4YlpZ?=
 =?utf-8?B?RXZTV01KcjE0WUJRYndRQUJVczZNTHM4SjlDRFhack0zNTg0bkcvWDJleXJw?=
 =?utf-8?B?dmtNaEIvOVVmN2FyTURjY2hsWllKb3RGY2ZYWTQvUjFIY1hQTVN4OGJqYnMy?=
 =?utf-8?B?SHZtL2ZjMTlCWUVZaEZtQzZUVTJzdW1QN0xiRFR3dGZCRkxyMExJcm9WRUVC?=
 =?utf-8?B?cFJVeGV3TTdFZzdXV0ROLzZEZEpXOWg5RjJBcHpRVWdpR3NZL2ZhL2xEMXFX?=
 =?utf-8?B?b2wyYTljNjFYR1R3L1UyZFY4VElXaFlmNnVwT0wzTDJHYW42bHBLOXpCRyt4?=
 =?utf-8?B?UzBZUHliK3FOYit5aUlvTE0wZS9IZG1BUDd6bUE3Q0lSVGF3TjdJb29HNjhH?=
 =?utf-8?B?L1I5V1hRMkczc1hXcjhrTHloMWI2MVgwdlVKV1RiTVVJWGhVR21ldkRFYzdm?=
 =?utf-8?B?MWpXMHBQSjNBOStZSHRReUZrMWwyZzZxYkgza2VQdWdDRCtxb2doaEdybVFx?=
 =?utf-8?B?YjdZRVZvNGdpNVFKZmRvRE5FQi9JU0t2T1kxbGRHYTdiVis4YzgxRzQrTklt?=
 =?utf-8?B?Z1lITU16U1BCYVpWS082TXJPNTBaMmxycHdUU01kYitkM0RDVGprYmh2ai9x?=
 =?utf-8?B?TlJ3dWlNRXZpQUM0V1hxVlpROGU1THhsUDhFcDUzNUl3L1ZSZDRva0kyVTVq?=
 =?utf-8?B?TzJKUGVRYlVhYU8xRjd6cjNVczl3MlhsSUZsdjFiam9mcGxDcXA2US9EMVBB?=
 =?utf-8?B?bVZ3RWlzTGN4QVMrV05aWDk2MUd5RXZqTFp6ZzdpWmtsK2huTlR0UldOa3du?=
 =?utf-8?B?NFFxNkVPZEkzbEN6WXh5NjFTK1BmUGVaTXZNK1BFc1RHdG1mU2hmTUR3UjZR?=
 =?utf-8?B?YlRhQ0hwQzZPMTJpaC83L1lnMlFlcTcvejhzQVgvdUtwRy9VclZ2emlSNmVv?=
 =?utf-8?B?N3B5Q01ueUdnYnBmMHVNUEdreS9tNVg3K054aCtXWUpFYlB0MEp4dzZ3SVBC?=
 =?utf-8?B?Vkt0TXk5WnQ4YWNyOVQ3L1VFOG5nc0ZCR0JwSzZ3UlFuZ2dBSHEyTTk5QzNB?=
 =?utf-8?B?cExET3VDZkl0UmpnS0RpSGdmYy94aitMb3FwUWtEMGtuV3E5L3pqVzVsWjV6?=
 =?utf-8?B?Rm9xejZEbUhVcXFKZzlxMkFNeHF5b1BZSis2SnE1UUd5aUcyb0REVnBLVitF?=
 =?utf-8?B?bGZ1VG9uajRuazVoQTZtMGpjZFN5ZjY2UXkwaEozbExkS3VJQ1hBWFhVN2hy?=
 =?utf-8?B?R2x6S2lJcHZtaGRYQmFzSmg1WHQvVm82b3haWlE3YmwzN1YyV3pmNHFNWGw1?=
 =?utf-8?Q?6KbnnDZxzFJZSkLRt1/s73CT0?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad3e229c-882d-4b31-e6f5-08dd898fb0e5
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB4956.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2025 15:40:39.9300
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OLTR5MxRCXed33rS/Xj6r01jzmm7I9mdN5BI7r2dixoD05j/amlsQNWjRBnYKc8T
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN3PR12MB9594


Hello Rob,

Thanks for the patch. Please find my comments below.


On 4/23/25 2:42 PM, Rob Herring (Arm) wrote:
> Use the newly added of_reserved_mem_region_to_resource() and
> of_reserved_mem_region_count() functions to handle "memory-region"
> properties.
> 
> The error handling is a bit different in some cases. Often
> "memory-region" is optional, so failed lookup is not an error. But then
> an error in of_reserved_mem_lookup() is treated as an error. However,
> that distinction is not really important. Either the region is available
> and usable or it is not. So now, it is just
> of_reserved_mem_region_to_resource() which is checked for an error.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
> v2:
>   - Use strstarts instead of strcmp for resource names as they include
>     the unit-address.
>   - Drop the unit-address from resource name for imx and st drivers
> ---
>   drivers/remoteproc/imx_dsp_rproc.c        | 45 ++++++++------------
>   drivers/remoteproc/imx_rproc.c            | 68 ++++++++++++------------------
>   drivers/remoteproc/qcom_q6v5_adsp.c       | 24 ++++-------
>   drivers/remoteproc/qcom_q6v5_mss.c        | 60 +++++++++------------------
>   drivers/remoteproc/qcom_q6v5_pas.c        | 69 +++++++++++--------------------
>   drivers/remoteproc/qcom_q6v5_wcss.c       | 25 +++++------
>   drivers/remoteproc/qcom_wcnss.c           | 23 ++++-------
>   drivers/remoteproc/rcar_rproc.c           | 36 +++++++---------
>   drivers/remoteproc/st_remoteproc.c        | 41 +++++++++---------
>   drivers/remoteproc/stm32_rproc.c          | 44 +++++++++-----------
>   drivers/remoteproc/ti_k3_dsp_remoteproc.c | 28 +++++--------
>   drivers/remoteproc/ti_k3_m4_remoteproc.c  | 28 +++++--------
>   drivers/remoteproc/ti_k3_r5_remoteproc.c  | 28 +++++--------
>   drivers/remoteproc/xlnx_r5_remoteproc.c   | 51 +++++++++--------------
>   14 files changed, 221 insertions(+), 349 deletions(-)
> 
> diff --git a/drivers/remoteproc/imx_dsp_rproc.c b/drivers/remoteproc/imx_dsp_rproc.c
> index 90cb1fc13e71..fffae6ff4a5c 100644

[ ... ]

> diff --git a/drivers/remoteproc/xlnx_r5_remoteproc.c b/drivers/remoteproc/xlnx_r5_remoteproc.c
> index 5aeedeaf3c41..b73e97074c01 100644
> --- a/drivers/remoteproc/xlnx_r5_remoteproc.c
> +++ b/drivers/remoteproc/xlnx_r5_remoteproc.c
> @@ -460,49 +460,44 @@ static int add_mem_regions_carveout(struct rproc *rproc)
>   {
>   	struct rproc_mem_entry *rproc_mem;
>   	struct zynqmp_r5_core *r5_core;
> -	struct of_phandle_iterator it;
> -	struct reserved_mem *rmem;
>   	int i = 0;
>   
>   	r5_core = rproc->priv;
>   
>   	/* Register associated reserved memory regions */
> -	of_phandle_iterator_init(&it, r5_core->np, "memory-region", NULL, 0);
> +	while (1) {
> +		int err;
> +		struct resource res;
>   
> -	while (of_phandle_iterator_next(&it) == 0) {
> -		rmem = of_reserved_mem_lookup(it.node);
> -		if (!rmem) {
> -			of_node_put(it.node);
> -			dev_err(&rproc->dev, "unable to acquire memory-region\n");
> -			return -EINVAL;
> -		}
> +		err = of_reserved_mem_region_to_resource(r5_core->np, i++, &res);

Here i++ is not needed as it's done at the end of the loop.
This bug breaks RPMsg communication on zynqmp platform.

Thanks,
Tanmay

> +		if (err)
> +			return 0;
>   
> -		if (!strcmp(it.node->name, "vdev0buffer")) {
> +		if (strstarts(res.name, "vdev0buffer")) {
>   			/* Init reserved memory for vdev buffer */
>   			rproc_mem = rproc_of_resm_mem_entry_init(&rproc->dev, i,
> -								 rmem->size,
> -								 rmem->base,
> -								 it.node->name);
> +								 resource_size(&res),
> +								 res.start,
> +								 "vdev0buffer");
>   		} else {
>   			/* Register associated reserved memory regions */
>   			rproc_mem = rproc_mem_entry_init(&rproc->dev, NULL,
> -							 (dma_addr_t)rmem->base,
> -							 rmem->size, rmem->base,
> +							 (dma_addr_t)res.start,
> +							 resource_size(&res), res.start,
>   							 zynqmp_r5_mem_region_map,
>   							 zynqmp_r5_mem_region_unmap,
> -							 it.node->name);
> +							 "%.*s",
> +							 strchrnul(res.name, '@') - res.name,
> +							 res.name);
>   		}
>   
> -		if (!rproc_mem) {
> -			of_node_put(it.node);
> +		if (!rproc_mem)
>   			return -ENOMEM;
> -		}
>   
>   		rproc_add_carveout(rproc, rproc_mem);
> -		rproc_coredump_add_segment(rproc, rmem->base, rmem->size);
> +		rproc_coredump_add_segment(rproc, res.start, resource_size(&res));
>   
> -		dev_dbg(&rproc->dev, "reserved mem carveout %s addr=%llx, size=0x%llx",
> -			it.node->name, rmem->base, rmem->size);
> +		dev_dbg(&rproc->dev, "reserved mem carveout %pR\n", &res);
>   		i++;
>   	}
>   
> @@ -776,7 +771,6 @@ static int zynqmp_r5_get_rsc_table_va(struct zynqmp_r5_core *r5_core)
>   	struct device *dev = r5_core->dev;
>   	struct rsc_tbl_data *rsc_data_va;
>   	struct resource res_mem;
> -	struct device_node *np;
>   	int ret;
>   
>   	/*
> @@ -786,14 +780,7 @@ static int zynqmp_r5_get_rsc_table_va(struct zynqmp_r5_core *r5_core)
>   	 * contains that data structure which holds resource table address, size
>   	 * and some magic number to validate correct resource table entry.
>   	 */
> -	np = of_parse_phandle(r5_core->np, "memory-region", 0);
> -	if (!np) {
> -		dev_err(dev, "failed to get memory region dev node\n");
> -		return -EINVAL;
> -	}
> -
> -	ret = of_address_to_resource(np, 0, &res_mem);
> -	of_node_put(np);
> +	ret = of_reserved_mem_region_to_resource(r5_core->np, 0, &res_mem);
>   	if (ret) {
>   		dev_err(dev, "failed to get memory-region resource addr\n");
>   		return -EINVAL;
> 


