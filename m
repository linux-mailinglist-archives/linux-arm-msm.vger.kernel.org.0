Return-Path: <linux-arm-msm+bounces-109923-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cAP7McMmFmqUiQcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109923-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 May 2026 01:03:31 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C8A75DD661
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 May 2026 01:03:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 07DFB300DF48
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 23:03:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2640211A14;
	Tue, 26 May 2026 23:03:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="OLp9DlP8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011047.outbound.protection.outlook.com [40.93.194.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECC173CC314
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 23:03:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779836582; cv=fail; b=KBQ/z69s4xmoa5JonJj9k8WnlJrkX8sqrby44Ad22B8Op6Cd1ziT9poS56ua3V0dHSunUbtorKOs8fWj0biFIsRBBC9O0wv60vwqyyR3pWLg3B6SvioFSJsMjlLt/J36BfmawzlnYGAp1Oi8TkNaniui3DKSFw+NOI11QlGMOZM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779836582; c=relaxed/simple;
	bh=jruWMA/22J89POgY1pzMYTjv7PZ1sFHDQZaDINzMddc=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=MDagwDcSbfRyvCRTqx9auQmwaIkko4yUSA4cIil3uCIczNh97GA2oRCfgm0xHNPFXZm+TqTR+z/lDVidAI+BmmZ6vDubMmlneL8T/nBEP0N7FN4Sl2GDE4UdfWXbnKmjncnArOUpoiBqhYjckPOlaO5pQGXrDOmNCVQJdbqdzF0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=OLp9DlP8; arc=fail smtp.client-ip=40.93.194.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mGJNWMwVR/XEfS78J+mMEsBinPXIsVc5fWnK/GbUS+LONnktF9/pAcT3/RUjFVtX1d3EaKpLDb6qxZmoUccX4/yotOZLJsSEQW+j4IhvSbYZ+RyUs4BBQELsqd1wLdXUhjSAQ/i2SVUR/viIg7h9ERmj2sas6WVCN7j204ipMv6tt+niX5lJ6L4+VpKFik+ri+0ZeM/yvGERHJpLD48QMX9e32IZnnEnJq6weyQ6QK8aQUjBqNaxEv/XYopoTMd0207HBsfBEt5LvE59Ts9nMQLzieeK1hxMudT4BsHJAzWjImunpnWgZ3zmyYkuB3dL+Uv/gN0Mxrs69W9iK7gPSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OqQJz0jOIfyyyQdv/QcFd1tMakNVNIVOhDl2A4aCMRQ=;
 b=ypc17Rf6Yf3o6Ki5he9ifpE7J/w2uttbwNC6eUAFtPAp0xh4yNH7fN2qG3ff5jgWbt+/VgO/UsawFeY2mKRVjHMLXtZBRdM62hCNc06cFF4vREuk3Wc/P4tgiZGXfHH1so7fcJ/3sVZbink+DCBfKfscxPC67UVxCswcjmL8oFlxg2vcWOuV1kzNiio5szB5Ctm+Edh8OA8xaAdir4hXeZzNwDtHdZwGrIkTCe6lrYoKacbQLbJJhdSn63TBKVSAeAlOar9WZiMm1dpiBhUE1nRBiEfT4w+uAOhXVyPvtZGniM+KOgAUeMQu7V4FICgusUS4T+aiherr92g7pGHnEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OqQJz0jOIfyyyQdv/QcFd1tMakNVNIVOhDl2A4aCMRQ=;
 b=OLp9DlP800n7YE3oeCiDh4K6opjNusghDXUFP49SV5lkqwYpxdEOCe6w0v/AhwYCb+EX/mjPsyM71Y1/Cpl39f1u1KyT/NQQjxhX+WQU+Y6fj+/X6Q2xx3wBsm3r0v69CNcjaYMwTNJw4XXxRddxK9MH1+2DgdaLS/UE9SjDxNw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB8476.namprd12.prod.outlook.com (2603:10b6:8:17e::15)
 by DM4PR12MB5961.namprd12.prod.outlook.com (2603:10b6:8:68::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.11; Tue, 26 May
 2026 23:02:54 +0000
Received: from DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2d79:122f:c62b:1cd8]) by DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2d79:122f:c62b:1cd8%6]) with mapi id 15.21.0071.010; Tue, 26 May 2026
 23:02:54 +0000
Message-ID: <e8aaf4da-8fb6-4d6a-95d6-563ac0562b49@amd.com>
Date: Tue, 26 May 2026 17:02:51 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] drm/atomic: only add states of active or transient
 active colorops
To: Melissa Wen <mwen@igalia.com>, airlied@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, simona@ffwll.ch,
 tzimmermann@suse.de
Cc: Simon Ser <contact@emersion.fr>, Uma Shankar <uma.shankar@intel.com>,
 Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>,
 Xaver Hugl <xaver.hugl@kde.org>,
 Pekka Paalanen <pekka.paalanen@collabora.com>,
 Louis Chauvet <louis.chauvet@bootlin.com>,
 Matthew Schwartz <matthew.schwartz@linux.dev>,
 John Harrison <John.Harrison@Igalia.com>,
 Rodrigo Siqueira <siqueira@igalia.com>, amd-gfx@lists.freedesktop.org,
 kernel-dev@igalia.com, Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar
 <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20260526142940.504911-1-mwen@igalia.com>
 <20260526142940.504911-2-mwen@igalia.com>
Content-Language: en-US
From: Alex Hung <alex.hung@amd.com>
In-Reply-To: <20260526142940.504911-2-mwen@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW3PR06CA0021.namprd06.prod.outlook.com
 (2603:10b6:303:2a::26) To DM4PR12MB8476.namprd12.prod.outlook.com
 (2603:10b6:8:17e::15)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB8476:EE_|DM4PR12MB5961:EE_
X-MS-Office365-Filtering-Correlation-Id: c0523e2a-9693-4dd7-c1fd-08debb7aeb33
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|366016|1800799024|6133799003|11063799006|4143699003|18002099003|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	xsHopncY+nHGYoo4R7qeadrD8bYBN3znAoJHdH/zk8P0nTaHj5KN8LMZXmtADg9d8EMIrKPbF/dnzD0M6a82gLbwbqiT9PRT14dGNVcnWh4ZnPWrQ5mUa0jr9bFpMfwdeXSbtZ59EmQr/qaGaBt6uA0UYoJA2sOhdL0UdyMHtb6+wkAbGmgI9Lq9ldLn2VslpHZXeyN56bX4xKg3a5pAFhsEZTajQaWCe8s72uArBpjpZhdfjC19Tmkod/V4Eoj0fEtxzig3rtRfYJxvw43Pn+OyR8TsYSs5HbNL9iqRHO06krNA/hOQO8H1JuWHKXrUF9SgXNKURcTLXZIOz67pSTpxtDW4zIJwEIp2TE5KpgURhvzKoeGNZm6CtAzwr634DGKuNSWce2NHtQbbZOLjZ98BrQgBoYRfpnlmg1UqDp0zUA2JTtIDEjQox3ua2jX/MySSN3QVmkbDFU59B5sREyinKEHoknXwVB23vYhRR1WW67SuC+o8pTxgv9PUGUDtF132l/JRDfpBKsJqkR9APlvalL2JU83HC9ykrwWbBJ3JPh2TRXHDfatpgK2q3stYZsDd/vtJBlCO4/3fGnpNVdHwwHJy7cnlg3U08KtXak4bm+t4+Zwc5lllltWuSvss6pCMW3PUbzfc2pDCQ0duopVEb29f/r2lfiH92lydCK2LxPqqxEtdVRnnuskvB+r2
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB8476.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(6133799003)(11063799006)(4143699003)(18002099003)(22082099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Zyt3dTZRMStadEFKWExHd0pUbS9OMUYwSm9WMC9EZnpNbDVoMWRwOFNyOTV5?=
 =?utf-8?B?U0RJSndLeUVaRnU1OU5TdTRwczhmMzRtWDluN1UzeHhFdnJrWlJxcXlUV09p?=
 =?utf-8?B?N2xIVGM0U1JJSjhiT2xHTEJXaU00eWQvbXM3VlJyTi8vRU5MeXI0UEV6RGlk?=
 =?utf-8?B?eGI4bWd5ditrQ21UNE9oVHRCb0M5dkE4QzIySUt4R1h5NjZXbUtXelhEMmdH?=
 =?utf-8?B?REtwYy9vSjRMUWg5UWFORldSUEQ2dE93ZEY0UFVSc3dhV2NPT2d5em9EUDJx?=
 =?utf-8?B?S2VnU1F3STNod1RMbXBQTGwvTGpUWGxyTE91MW9QWE0xRVcyWUh4MUVlcUw2?=
 =?utf-8?B?UnZMRnh2ZjlBNk9oZnJXWm85SGhBUXh3U1c1YnlSSDZrU3o0S1hKa0ZDekhI?=
 =?utf-8?B?UDlzRU9JUWwxQ1NtRnUrNHREa2FWdUpIL3AyVFJzcXNVdzUrVGRLMHoxWG9x?=
 =?utf-8?B?OXB4WHk1NXB2c0tyaSsvdlVRK3gyVmxPdkFnWk5IQ3R2cWM1SE41NGhUUzQ3?=
 =?utf-8?B?L0ZZVkZHN045OGQyVStFNnNyRmhRRHlFNGZTT0NicnVvZTMyS0E5UkVBOXlp?=
 =?utf-8?B?THJuYUY2OWRDY0Rpd0NsbVFhbHRFTzY2VXBrRXEvMXpac3o3VmMwTHlNb0xL?=
 =?utf-8?B?T0pQa3RnQnU1TlFOVlgraSswWHkrUXR1NFJueEFCYTFHZVpFZWpPcGs3aVp5?=
 =?utf-8?B?dFdaVW91Q0FUTjRmWVBNbnovbWxpSHFJdFdxQzRSQ3Z3bWo0Z1k2NHB4dWk1?=
 =?utf-8?B?NkFqaExSUWVRY3orYjl6dktzMnNtRjlHOWxCZmJiekdHdzhvcldsb2xPVnpm?=
 =?utf-8?B?Sm9TSzJqaEVpK0g4TEZUSkh3MEdPVFMxS3NXQVJ1Ym5seDNYNzYwdW9zUjZv?=
 =?utf-8?B?dTNxNVFyUjRPWXN5YmFTZkoyN2hkM3VjaFY0M1NTcUY2TVhGU2tLZy8yeGFD?=
 =?utf-8?B?c1V5bTBUTlBWaFFFRjlrbm1wK2hvZlM2VkUwRzN4dzVTN0tMT1hLNFVXUXZX?=
 =?utf-8?B?MkVYb2ZVcUlYL2t3VVhzOUtRUnNJVDdxaDVPNEZrN0N6WW1sNmJJOFdyOHBi?=
 =?utf-8?B?OC9JYkxmY3VqK1dheTlteDNQSWZBbzB3RjNNdXZETmMrK1N3T2prZ293THZO?=
 =?utf-8?B?dGJpamExVWxySkd0SVF0RjBTd3lYWGZEYmNJTkYyUWRxRTlpSzRmV003S1Vy?=
 =?utf-8?B?M29YNjR3L1hIaU1yV1A2dnJzUGdNejdMNkpOeTJ2NEJTYVVTTlREbUdSTlVQ?=
 =?utf-8?B?MFlsUjlib1ZOdGhrWDNROFlOSHorLzJMcFMwa09qSDZhK1RTUEZjQm9seTVq?=
 =?utf-8?B?MU8wcjZORnN4K0kzNVIzQzYrYWZ4cjEzNi9IWWU4S1JTb3lZd0xjL1IxRkxZ?=
 =?utf-8?B?VFlrazVJdVd5THc0T3ZxT3JFT0o0Z0NNUmF1RlYyVGpSdlVEbHNtbVVaZ2sx?=
 =?utf-8?B?Z1pmS2ZBeHlFUnRONkhLM0lwd3l4cVYzOGl3U2pkamswVE92SGJkTjBpWVY1?=
 =?utf-8?B?aXhUMndUWW9sU1FwcUtyZnkzWGx6TTRNS28zRlA5d2dHalBrczJpR1lRNW84?=
 =?utf-8?B?elJQTXp4S2Jxa0tvU0FoREp3R0dUNGh4elErb2UrSXltRS9YbzdGR094c2cz?=
 =?utf-8?B?ZzVGb0NETEkxQm9TK0RlRExheHFPdFl1V2NEU3pIUVAxUnRtQ1l4bzFmbXV3?=
 =?utf-8?B?TFo2OU5zR3kxbnZKdzNvbTE4ZjhuOXJRMFFmajBmQkdOK0Q3TUxvUWUxTXpa?=
 =?utf-8?B?UjdpdTlkdzBScFZ3ek5wYXVUQVlRS2UzOTg0RmZDYkFPNGVqL2dIM2NHWlp0?=
 =?utf-8?B?bjFkeGxBbndOMTU0YkJxZitSdDkzR1BpVnEzNWNqcUQ1enN4Mm5acitjUUVP?=
 =?utf-8?B?V0puKzBtVXVpamlCSWVBM2dCbnp2VnFhZTAvRTVyTVFjaUtidDRDZkQ5Mm1Q?=
 =?utf-8?B?Vm5YN0lrbmowS3dCZEJwTXliNDF5V1lVaFVjejB2M2N5T0IvVzR6cE85ZWlQ?=
 =?utf-8?B?NVl6aS9XQjZkT3ZZazNZeUtlb0NOUXNYQnZZNDhSYkFHRXNhdlJsVnh1Q1pO?=
 =?utf-8?B?czdXT1RyTDRwaW1oTW1ucE02clRMcmRLN2lkNUw5d01KSFdSNmRlRExVM1FR?=
 =?utf-8?B?SmpJUi92a21tNDkyNmJQQitwbU5LT2J5bURESG8rTXlvbUVYN2kxZDJGa3NZ?=
 =?utf-8?B?bFBiZDc1QnpyZHNWNXF6N3Nwakk5d1IrYUU2VllUZ0NxRVdDSEZqMFY2d3cr?=
 =?utf-8?B?bkc2RERwZlhQcUlEeEU1dXFOS2VCSEF5S3BKS0I1TWhwaWcwSzREOXQ1NndD?=
 =?utf-8?B?aERJeitCSFZTOWorQlgwRXdlTG8vSzRxRzBKUE12ZUQ4UzZTRlAwQT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c0523e2a-9693-4dd7-c1fd-08debb7aeb33
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8476.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2026 23:02:54.1442
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6lmjOscRk8xIVP6u3K/u5DmQtOJOa5d/lW2WN+nA3nyF6J5WinUtPQDGw+9Ya7BNJYjZ077Fe+wDc36UkPuQ3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5961
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-109923-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[igalia.com,gmail.com,linux.intel.com,kernel.org,ffwll.ch,suse.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[emersion.fr,intel.com,kde.org,collabora.com,bootlin.com,linux.dev,Igalia.com,igalia.com,lists.freedesktop.org,oss.qualcomm.com,kernel.org,gmail.com,poorly.run,somainline.org,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[28];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alex.hung@amd.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[amd.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,igalia.com:email,amd.com:mid,amd.com:dkim]
X-Rspamd-Queue-Id: 2C8A75DD661
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 5/26/26 08:17, Melissa Wen wrote:
> Only consider affected colorop states those that are part of an active
> color pipeline or a pipeline that is about to be activated or
> deactivated in the same atomic commit, i.e., colorop is in the chain of
> old/new plane color pipeline property. To cover color_pipeline
> deactivation, remove the condition for plane_state->color_pipeline.
> 
> Signed-off-by: Melissa Wen <mwen@igalia.com>
> ---
>   drivers/gpu/drm/drm_atomic.c | 67 +++++++++++++++++++++++++++++++-----
>   1 file changed, 58 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
> index 170de30c28ae..4fb3a23e862a 100644
> --- a/drivers/gpu/drm/drm_atomic.c
> +++ b/drivers/gpu/drm/drm_atomic.c
> @@ -812,6 +812,59 @@ static int drm_atomic_plane_check(const struct drm_plane_state *old_plane_state,
>   	return 0;
>   }
>   
> +/*
> + * This function walks old and new plane state color pipelines and adds all
> + * colorops in use by @plane to the atomic configuration @state. This is useful
> + * when an atomic commit needs to check all currently enabled or about to be
> + * enabled colorop on @plane, e.g. when changing the mode. This also avoids
> + * including colorop states that are not part of the atomic state.
> + *
> + * Returns:
> + * 0 on success or can fail with -EDEADLK or -ENOMEM. When the error is EDEADLK
> + * then the w/w mutex code has detected a deadlock and the entire atomic
> + * sequence must be restarted. All other errors are fatal.
> + */
> +static int
> +drm_atomic_add_pipeline_colorops(struct drm_atomic_commit *state,
> +				 struct drm_plane *plane)
> +{
> +	struct drm_colorop *colorop;
> +	struct drm_colorop_state *colorop_state;
> +	struct drm_plane_state *new_plane_state, *old_plane_state;
> +
> +	new_plane_state = drm_atomic_get_new_plane_state(state, plane);
> +	old_plane_state = drm_atomic_get_old_plane_state(state, plane);
> +
> +	if (WARN_ON(!new_plane_state || !old_plane_state))
> +		return -EINVAL;
> +
> +	drm_dbg_atomic(plane->dev,
> +		       "Adding old+new pipeline colorops for [PLANE:%d:%s]\n",
> +		       plane->base.id, plane->name);
> +
> +	for (colorop = new_plane_state->color_pipeline;
> +	     colorop;
> +	     colorop = colorop->next) {

This for-loop is used 5 times in this patchset. How about a macro in 
drm_colorop.h?

#define drm_for_each_colorop_in_pipeline(colorop, pipeline) \
     for ((colorop) = (pipeline); (colorop); (colorop) = (colorop)->next)

> +		colorop_state = drm_atomic_get_colorop_state(state, colorop);
> +		if (IS_ERR(colorop_state))
> +			return PTR_ERR(colorop_state);
> +	}
> +
> +	/* Same color pipeline as new; no point walking old. */
> +	if (new_plane_state->color_pipeline == old_plane_state->color_pipeline)
> +		return 0;
> +
> +	for (colorop = old_plane_state->color_pipeline;
> +	     colorop;
> +	     colorop = colorop->next) {
> +		colorop_state = drm_atomic_get_colorop_state(state, colorop);
> +		if (IS_ERR(colorop_state))
> +			return PTR_ERR(colorop_state);
> +	}
> +
> +	return 0;
> +}
> +
>   static void drm_atomic_colorop_print_state(struct drm_printer *p,
>   					   const struct drm_colorop_state *state)
>   {
> @@ -1591,11 +1644,9 @@ drm_atomic_add_affected_planes(struct drm_atomic_commit *state,
>   		if (IS_ERR(plane_state))
>   			return PTR_ERR(plane_state);
>   
> -		if (plane_state->color_pipeline) {
> -			ret = drm_atomic_add_affected_colorops(state, plane);
> -			if (ret)
> -				return ret;
> -		}
> +		ret = drm_atomic_add_pipeline_colorops(state, plane);
> +		if (ret)
> +			return ret;
>   	}
>   	return 0;
>   }
> @@ -1607,10 +1658,8 @@ EXPORT_SYMBOL(drm_atomic_add_affected_planes);
>    * @plane: DRM plane
>    *
>    * This function walks the current configuration and adds all colorops
> - * currently used by @plane to the atomic configuration @state. This is useful
> - * when an atomic commit also needs to check all currently enabled colorop on
> - * @plane, e.g. when changing the mode. It's also useful when re-enabling a plane
> - * to avoid special code to force-enable all colorops.
> + * currently used by @plane to the atomic configuration @state. It's useful
> + * when re-enabling a plane to avoid special code to force-enable all colorops.
>    *
>    * Since acquiring a colorop state will always also acquire the w/w mutex of the
>    * current plane for that colorop (if there is any) adding all the colorop states for


