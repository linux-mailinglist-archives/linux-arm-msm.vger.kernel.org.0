Return-Path: <linux-arm-msm+bounces-108727-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id llXOHJGgDWq10QUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108727-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 13:52:49 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 0998E58CF8D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 13:52:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 4FE8C300B9D1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 11:40:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F29C2F8E8B;
	Wed, 20 May 2026 11:40:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="LxDfhcL6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011025.outbound.protection.outlook.com [52.101.62.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD77B33B6F9
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 11:40:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779277215; cv=fail; b=TiLlF8EilGbFBzHza1YvOMWhc3l8p+JFh1MuuP8LW/fmmpCRLYzELlbj66FrNk0O92pKNoPyVTQVlOPlNN4tE2ZW28YMkaJ+8X0odCeCDskX8wXqB/RyEbmfeYhNlasScHD34Lid0tzYk3UKxloiETq8IBd0syqttSg/F0ilwTs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779277215; c=relaxed/simple;
	bh=bmaDrqJHwTRMWa6kPjoAk1kglRgIJLMsxCo6CnpOcxM=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ujmeh9ocy3bRK7xLpYr7TJb+RN6rC+BN+96EKN3B/5wlfhCNhnKid+LZ6a8/mJJ7r4Y4BhqJ0SFngaEe3sF0UalicJJ8bMHEwPzP1MIGx4r2nDIm95wlO/HjJz4k+hN/Y8ZfJzlkzgjFFKn6/g+3OuYXqZWs/TCokNdKTFR47gk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=LxDfhcL6; arc=fail smtp.client-ip=52.101.62.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ia2NAvlfKApntn3bYs0w8DrsM5QlFyVmnmhrp8H1FQs6EL0DJVTmKyrMgvol6FYPH97JUP9pk7biMX6Vl1wrQvRV2+OnR9m/WB0gE6FfDNfCbUqy6qP+ndScKFIkMOF+prqsVO460WotuKhqfbRZb28MQV8LrexzUJLcIYamIlVG5Wh2QUOlSKYGpJKAZifsJJsRpD3KrUjxgHjisuhgsDFaDIDZPcdgstBNm+L+qucVTSu6R+f8C+o+UHqIhd6aHHCMuJkYT5W80Nq0+mdTOVta2MxH1JF09noDa/LQznxpXsiWrpOXeZ99GxRyjXO0/XwKH+uX7TduFjB/M8xrzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fUfOfSOLOUkSzAANz9PXu69E0r2e7GWn+itk2CR7YhE=;
 b=iLXuyP2yMwUEkiSFR8JVlgQNf8CAIj2X93/m6172hnE3LVNm83ie0l8/SzUkcQodWzMBLeVVyQQGC1ezKTBWQRqHgrblb54hW5e/rSBjNhgRUX2EwDMtQpPanvBphw3MzrOr+y9C2RXum8nBmroGvttBa5yS0jgvZppoWzBR8KR/uMnPYRk7RJjgfRZGl5sWshKOdZd1O36XnvT/5x774r9khpk1pYnErUixSeeshWKVpNZsCAp8G+agg5DHggYpcGgYEJxh4vtJzF2nEI0XdCtnJaHbQjBAUi0krJQldW1e61W88/J1F0ywkFh2RvIJdrxyOW3gSQ+brePwEYNDsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fUfOfSOLOUkSzAANz9PXu69E0r2e7GWn+itk2CR7YhE=;
 b=LxDfhcL6pwtDdej2UkKiU4cLxFNOTRJWHTk838pfA+0RCqFPVrJKjGVniCs2ol7YC6qynYZcmnZGvXVzXzL0amhumrIHQtatWi6veRzQROkQACgHKaS2WLOEgpcv1CLqA6cclK90klgTTFLZLelGmWvN5gFBqIrkxPS5GjSwJj4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by PH7PR12MB5831.namprd12.prod.outlook.com (2603:10b6:510:1d6::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.14; Wed, 20 May
 2026 11:40:09 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c%5]) with mapi id 15.21.0025.022; Wed, 20 May 2026
 11:40:08 +0000
Message-ID: <39252c58-8145-44d0-96ab-5935d58c1bb0@amd.com>
Date: Wed, 20 May 2026 13:39:58 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] drm/exec, drm/xe: Avoid abusing the drm_exec retry
 pointer
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 intel-xe@lists.freedesktop.org
Cc: Felix Kuehling <Felix.Kuehling@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Danilo Krummrich <dakr@kernel.org>, Matthew Brost <matthew.brost@intel.com>,
 Alice Ryhl <aliceryhl@google.com>, Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar
 <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
References: <20260520101616.41284-1-thomas.hellstrom@linux.intel.com>
 <20260520101616.41284-4-thomas.hellstrom@linux.intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20260520101616.41284-4-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BL0PR02CA0047.namprd02.prod.outlook.com
 (2603:10b6:207:3d::24) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|PH7PR12MB5831:EE_
X-MS-Office365-Filtering-Correlation-Id: 69192700-29be-4a4a-d516-08deb6648b72
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|56012099003|22082099003|18002099003|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info:
	RhuX3I89RD9MUo1DMCUU/u+O5BZ55+KknU9QRnHT2daQJo3FcWVuRRgioQWbWaebt5825Hr/tkxqxcmkG3YiPhICoTWBp0ipDKNoX/h0GtSauEpiDSi4zQQudg6/neDO1jvaKkULLeywC9F7IsBziqB/f4l+l5QPNLiQD5ROUExsSkvWc9jBF6K5n2suemMcF+gQlH9nLD9XWUMdjTm+p3QHJN9YOGbI1aD6KHp255znmzqv7XWfa6pJfiJpAj0U5R03HhgC9oJIMdTlxq+vev0auJXyCBic0VArQILpm1+XWduVZmwuNOBftxEQS2nxGhWW23Uq1FaY8DA+iFlxwG/bbEwP6G+3SLvHo3J9uvww1y9e9YxeMzeg2UNBSeyORtP/L+z54c33tfd2NRy/4oorFkWYsJQr6qbyRsaiNYuZw8jAanMul/BlW6zBDEeW1ac+COEOt9wkupjhh9iYtBypHnykpGGdQpnXWhyNFKUlWgNmqltQiu8NDv45EnoWIN5XFma2sCn122iyMlrdS3/9aJPjDuSuVqaCDjDvN/uWE2YgIERQUbxDlu+HqZOvq7V7KRR5Spihtwx9WKyy4GGTnneQ93tXUoNLIZqCsbkJacBd2zv86uWazvpivpsCW0CHDPnO05MzlxM1yLRfBkno1d73+yWPhrfcOtaMJ/hRyZvOOfs/UZHOkFqORUum
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB5685.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(56012099003)(22082099003)(18002099003)(11063799006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ODlmR2ZScW1idTh4bVdZNStaeU1yeXVqZ0g1YjFRWUhFbUx4aTJqN1NZOFh5?=
 =?utf-8?B?elg4TE9zanVob0FEeS9TR3MrODdBdGZ1Yi9zaUtoRml6SWJ1YU9EOUhSYm9r?=
 =?utf-8?B?WGpTdTBDclg3Wm9oeXZwVXZBYmNXbUwwNlBEOUoyOGpPMHBEcU84SnRBK1Q4?=
 =?utf-8?B?R1NjVkd5Y2hCMjBEaXpkK1dCWTZHR1VRbllEZ0JHME9ydk5lV1phVlpNWlNC?=
 =?utf-8?B?bm5ZZEtEakxhZittS0tnaDl4SGViWHN2UTU0VEswQ1dSUHYzUHN4ZzNRMEZ5?=
 =?utf-8?B?Q2tyNGFPdWtoNzBBSXBoeEFXSkIxRkxDSGhiNTE2TmxhRVdQVmNmK3Z4Sncy?=
 =?utf-8?B?T2ZVUGN1WGFVQzVyRE9KeXJvRXpaaEVSSG5iUEJGK1c5azB2Slc5eDhyYTcy?=
 =?utf-8?B?ZnJQRCtJNGt5QXVrZEpkU3NsYkhpdVZNanlzeUNlTDVrT1IvR1dldTJkWFRu?=
 =?utf-8?B?c0pLaEhudGNxbS92WWRkRUFBOWhZbi9nZ25oVzk1aUdQb3lwSWZCdUwzOUFm?=
 =?utf-8?B?aDRwMVM4eEgwSXpTQVNSaHFibnVzRTErWTliYlQ2cFRoUkkvQUNxMm9lRHg4?=
 =?utf-8?B?M0MxdUsvMGs4ejZNdlJDZHhzQ25vb3ZFbk9ZUndGVjNBR1JoWitaU3JGbk5E?=
 =?utf-8?B?SnZrNU5tREFjQ2ZWcGV1NWNIQjUxeGo0QUhxSjJzTkhzWDEyUWFyOEJGSjRV?=
 =?utf-8?B?K1FlcWpORHJoZmphdWxUMm96b3hFbnd4a2gyeE40V2V4YXVwTEF3U1AwWXVY?=
 =?utf-8?B?d1JPUk5aZEFCODJRdHloVkxkNU13QWQwVjNKOTZuT0V6SFJKQlh1VVVuMjZw?=
 =?utf-8?B?SXdIV0RJSTBFR2hjRlF5UXFJZktuaUpiZjEyY0NKQlVIWWJhN01iOXF3eU5Q?=
 =?utf-8?B?dHNibE9jZjV3Q2RuV3BTeFNNOFUvZ1IvKzJWWkk0ME9lWnA1WnRiUlNYd3Iz?=
 =?utf-8?B?aWsrN2dXUGFxdzgrMzFybHVZQUdUa3hDanZDbHhldHlhUU4zRWdkcHhQK0lo?=
 =?utf-8?B?SDNGanF2S1d3Sjk1Qk5xMlN2bmJlMUk3c2RuZXYxbkJkS0k5SnNCRUZEemFx?=
 =?utf-8?B?UCt1THJqRlhSWkdKcDNoQmwzZVR6cEtWaE1HOGlzQjJZNWZvWHhxWlI2eTRO?=
 =?utf-8?B?U3p6aGs3S2IzUVQrLzF4OTlvNXk1OWlUS1NNYWtTQlJNcXFpcHQ1U1RuRmVt?=
 =?utf-8?B?VlVoSitXVUpwYTFEekw2dWpINHFSWExidnNMYWNsTmdsZGt2RHUzNDZ0cjRp?=
 =?utf-8?B?Qk9LOGFMTzVPdy9tS2hoYmh6UWtwOUJsSjZ1dEQ4QzVkbzZWeEQ5amtDbmhj?=
 =?utf-8?B?S0Rlc3l0RkxxL2VlLytXZm5tall2Y1VXV1RFSmhZSy9jQUhXbldxRHJXTjRi?=
 =?utf-8?B?OUVyamVHYjcvNm05bmkzMWNMN0pBYWsxazJYR2pYYmF4Y3d4NzN2NDNiODI0?=
 =?utf-8?B?Mld2MWtLU0Q4UGpBbmNKT2NUb3gzTDNVQ3ZFdC9BS0ZNY2FId1U0NWhCTUFo?=
 =?utf-8?B?SjJuOGpiOFZqazhKR0V2eHo0SGxub0l3WlcrVk9NeGhtancrbnpzaUxEVFVi?=
 =?utf-8?B?Q1djWW9IclJtbEFEQ25KZmZWQlNFbVFBczZORTJzbVAzdjN2bkRtY2lvVnpM?=
 =?utf-8?B?QVd6VWdhV3hLUmV4blYrempnbFB6YnJBcndmNHAvOEpJUStYbFVET1N5TVov?=
 =?utf-8?B?Nlp1WDZJSzBIVDJNV01KLzd5VU9MWTNBM1J2K2t6dUNhWk1oSUFNTE9id3JW?=
 =?utf-8?B?cmh0MWNzWFplUENPTHBLcm5maW0yclIyR0FzTmlHbGw1M3JHUDZLQkNwbkp2?=
 =?utf-8?B?MUlScTJOMHRValErdXI5TXVOSktteDZwaCtvMXN6VTNiOEtLaXlTdTJhVGRx?=
 =?utf-8?B?K2poczM4b2hOODBidzNySHRDalBVYmtIRjJkTEhGT0RIYzFNQ3JyYkI5OGh1?=
 =?utf-8?B?WFRIRkFWVm4vL2ZLdVVWK3pTMGJBc29sUWYxVG1GU0ZCbkpuSDIrRU9Gc0Ew?=
 =?utf-8?B?c3hlalhVMDdLR08yTk9NVVJTOXVaRm5zbjNGVk1iUUZHcTVXVkRDc2JLbXdn?=
 =?utf-8?B?eUdBQ0ovS1JOODBWT3NuTmF5WnRpZ01sOGIvUWIxZDIxTDNUTXpXVHVwdUtG?=
 =?utf-8?B?TXh2SDQ5c0JJa2k5RHdmSmpRY3dxY1RFbVFQbjVQbVZSTm1QVUhLZEUrSGRt?=
 =?utf-8?B?UTJsQkpuWHJ1QUtHRmVHTDRtMUdGWXM1bWhjUVNNZlhJaUtaQVFQZDZVckp3?=
 =?utf-8?B?bFpoSmd3ajcwMGgvYlZyMnRjZ3RSS0hYVGx0eUJWZ1FuQm1UTEgwM0V3NkZh?=
 =?utf-8?Q?YeFD54AYdbNWi9eeZU?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 69192700-29be-4a4a-d516-08deb6648b72
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2026 11:40:08.7572
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n5xf0HfGCCmphNGhujvXcf4g3Yet9ECChpcncI+tuHxAaygHI1bcWhE8X8jSRiuN
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5831
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[22];
	TAGGED_FROM(0.00)[bounces-108727-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[amd.com,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,intel.com,google.com,oss.qualcomm.com,linux.dev,poorly.run,somainline.org,lists.freedesktop.org,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[christian.koenig@amd.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[amd.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,amd.com:mid,amd.com:dkim,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,intel.com:email]
X-Rspamd-Queue-Id: 0998E58CF8D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 5/20/26 12:16, Thomas Hellström wrote:
> The xe driver was using the drm_exec retry pointer directly to
> restart the locking loop after out-of-memory errors. This is
> relying on undocumented behaviour.
> 
> Instead add a drm_exec_retry() macro that can be used in this
> situation, and that also warns if the struct drm_exec is
> not newly (re-)initialized.
> 
> Use that macro in xe.
> 
> v2:
> - Only allow if the drm_exec context is newly initialized.
>   (Christian)
> 
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

BTW I've ran into just another complex use case were we need the retry handling with userqueues.

So I'm probably going to use that macro in amdgpu as well but with quite a bit of extended functionality *sigh*.

Anyway patch is good like it is for now, so Reviewed-by: Christian König <christian.koenig@amd.com>.

Thanks,
Christian.

> ---
>  drivers/gpu/drm/drm_exec.c         |  3 ---
>  drivers/gpu/drm/xe/xe_validation.h |  2 +-
>  include/drm/drm_exec.h             | 19 +++++++++++++++++++
>  3 files changed, 20 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_exec.c b/drivers/gpu/drm/drm_exec.c
> index 746210f3f6c2..7988f5e7d56a 100644
> --- a/drivers/gpu/drm/drm_exec.c
> +++ b/drivers/gpu/drm/drm_exec.c
> @@ -48,9 +48,6 @@
>   * See struct dma_exec for more details.
>   */
>  
> -/* Dummy value used to initially enter the retry loop */
> -#define DRM_EXEC_DUMMY ((void *)~0)
> -
>  /* Unlock all objects and drop references */
>  static void drm_exec_unlock_all(struct drm_exec *exec)
>  {
> diff --git a/drivers/gpu/drm/xe/xe_validation.h b/drivers/gpu/drm/xe/xe_validation.h
> index a30e732c4d51..4cd955ce6cd2 100644
> --- a/drivers/gpu/drm/xe/xe_validation.h
> +++ b/drivers/gpu/drm/xe/xe_validation.h
> @@ -146,7 +146,7 @@ bool xe_validation_should_retry(struct xe_validation_ctx *ctx, int *ret);
>  #define xe_validation_retry_on_oom(_ctx, _ret)				\
>  	do {								\
>  		if (xe_validation_should_retry(_ctx, _ret))		\
> -			goto *__drm_exec_retry_ptr;			\
> +			drm_exec_retry((_ctx)->exec);			\
>  	} while (0)
>  
>  /**
> diff --git a/include/drm/drm_exec.h b/include/drm/drm_exec.h
> index 18f84faabbb9..99c7e1bb3c5b 100644
> --- a/include/drm/drm_exec.h
> +++ b/include/drm/drm_exec.h
> @@ -9,6 +9,12 @@
>  #define DRM_EXEC_INTERRUPTIBLE_WAIT	BIT(0)
>  #define DRM_EXEC_IGNORE_DUPLICATES	BIT(1)
>  
> +/*
> + * Dummy value used to initially enter the retry loop.
> + * internal use only.
> + */
> +#define DRM_EXEC_DUMMY ((void *)~0)
> +
>  struct drm_gem_object;
>  
>  /**
> @@ -142,6 +148,19 @@ static inline bool drm_exec_is_contended(struct drm_exec *exec)
>  	return !!exec->contended;
>  }
>  
> +/**
> + * drm_exec_retry() - Unconditionally restart the loop to grab all locks.
> + * @exec: drm_exec object
> + *
> + * Unconditionally retry the loop to lock all objects. For consistency,
> + * the exec object needs to be newly initialized.
> + */
> +#define drm_exec_retry(_exec)					\
> +	do {							\
> +		WARN_ON((_exec)->contended != DRM_EXEC_DUMMY);	\
> +		goto *__drm_exec_retry_ptr;			\
> +	} while (0)
> +
>  void drm_exec_init(struct drm_exec *exec, u32 flags, unsigned nr);
>  void drm_exec_fini(struct drm_exec *exec);
>  bool drm_exec_cleanup(struct drm_exec *exec);


