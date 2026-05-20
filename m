Return-Path: <linux-arm-msm+bounces-108724-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +D9MEqOeDWqC0AUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108724-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 13:44:35 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 190EE58CD94
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 13:44:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 03806314D920
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 11:36:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C0BC39B94C;
	Wed, 20 May 2026 11:35:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="YA2EOWne"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011035.outbound.protection.outlook.com [40.93.194.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 812CE2F363F
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 11:35:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779276954; cv=fail; b=kKwgPB5Z6O9J6zSU+6unCZJHHX9nKC2uM0gQx12E2BiAEm9NHeA+ENBiX/cWfkIRahoUJapnSb9jlCom2LsxtmN/as7SR9CDS6Y/y/QEEoEn3lpdVvwCgBqxgKLcfNku5l73Xga8FTNh0D0QHRBzoxO71cJ6W6W5TCNweuR/khw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779276954; c=relaxed/simple;
	bh=0oS9K7qkyFG9M2EmpB9w+8MZe2C9RwhGRCOsCBz/2i8=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=jsCkkWQQA3EaZBbbaWZaiw2MzfGMdBDjFEiFgswvZCtU/rtK5XyXr6Zo0sBUCsZBt3VWuzWM04N5qt8SI/HzqMbT919Q97IRp9dYjxdabX4H9ZY2GsdKUhoT4Cu0KJ3flrjFrxktOKiwcnfJkS9yJoCuLrR1+t0rMyfzoH/AF+4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=YA2EOWne; arc=fail smtp.client-ip=40.93.194.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TAgZ8pJMf2ox0iMH8ueo3PMma6yKKEcN63E/uACxpxR7aC4SXK+517E6RRvMV/9Q74hr2XJHlYuWx/ojADS2g6XWhGpz1tQNrkyBbdkmPlGAFDsJMsr/5YtJYEhXYhtdJEVJLaBWRYfgSbEZU90YISMmv3/+NxDGKjmTGfbITG7CFz2YjLgh0/vihGSWgYQoh5/1Hf4bxZeLtLXIHVGXABjbUcCdmufGgRocG3fIxa7HlcRRT3V6b7+K+iAHaYYONwhA7uc+3DeTgV0O898yevrYX4MOtq6o7u1l9+02n3Payw8qVYiFpzszfLl5SDMp9LYRYz79WuCzicFn0vHtDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EECI8WZY+v9cwhzawDzGelC1ocQYnWeiT4LeynM3Wmo=;
 b=VS4/MREAivmzkzuOJSSI2iQsRUrUb42W8+fXValm8kzyscvfvaYYyZybUOuWpJKEJHKT0CGpc5nrPqIPSxrA55X/okE0o4wJ5qtfkNfvJcaXgX+/wIRRtbspk8v4Q4z01dLMqHoJS4Uq4aIKsSokbRNBCfo+HJ1ByjEqM6amUMPGz/u42c1MEtQTh7ZpHea/3IDLwRUIGsieMhLM5lO6Udbf7jMgQx+0llUHG/wJVAuf8rQcyD7iMLgDFWxJjpG08EwPZetnztVE/rf+q8ddHstsdYcI88TvwYefwHjuq/usxnn9PgEv9AvpuIlLqRbhUef/A/VrEDDbdj6n+lQVXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EECI8WZY+v9cwhzawDzGelC1ocQYnWeiT4LeynM3Wmo=;
 b=YA2EOWneKs/usg0X036Bk6qeJcVYdY1xvkmUIkrjmCBOBzspx5b6ohIeCbXlRdDC3oae87KQnRvtqQdQI8fHK/ID1gZBNvOoBkBT6ewIDEXhnZcqnpwyUuySxYKcR8pNcOpu4af6C3/DCodSUJLKpzZlHeXcgAcqaHDShgRWFik=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by PH8PR12MB7110.namprd12.prod.outlook.com (2603:10b6:510:22e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.14; Wed, 20 May
 2026 11:35:49 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c%5]) with mapi id 15.21.0025.022; Wed, 20 May 2026
 11:35:49 +0000
Message-ID: <73a122c6-77e2-4a75-b5e2-ecc0ecf7edce@amd.com>
Date: Wed, 20 May 2026 13:35:40 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] drm/exec: Make the drm_exec_until_all_locked()
 macro more readable
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
 <20260520101616.41284-3-thomas.hellstrom@linux.intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20260520101616.41284-3-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0003.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a::13) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|PH8PR12MB7110:EE_
X-MS-Office365-Filtering-Correlation-Id: a6d35d34-c66a-4dde-c074-08deb663f0c5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|1800799024|376014|366016|22082099003|18002099003|56012099003|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info:
	AyGix35LqH8CUwC8LZsAZumQvMBSUw/v3U5Hc/bvfeAMfiGbVFOCs8NeXYoCihGn7Klz41UwRa4E87ZZ1an67CjVSjrmajiA42ciRhknWpE0HdMTzQ7XqwzO6vGlbgErTwOJHAQVtWda5XN7/Lrb3mu6Rpv+PCwiIATtmt6bJXeUEbkQkivvlLgkYycm8Kb2fzuH3mBXb8WJnHN9rEJhaCAFqH6v3GM8q5yx2j7TaIJLEcvNw1SMC4mQfI08slGEx9D38idNiOl0RGQgghWgI28YoGx0CK7qIXPXq1QhsUerJjXOQJX07iwp7gf7c3QqX6OGLGIcugwqWSnwu+5/h80HVf0AvQWMXgNpLzvdrHexIxIzN+xXDV8oqYs41JwMtclfiI+B30HTHlS7tdMult/3nJRSMqU16uh17FIn7rq3q4ebCnWYNNMKNjw98gsmutqsVkswsZBwCoBEWqJTHN9RXKQKDB59pL4KIxx+D5x3DhJDoEI8PMGJGtAfUDi0b9Ioa2dQ5vTl34zMUtQZKii49M23bAY0iFxHTitRqn9hBJhuaRc9sJMMJft3jhQvM4N2ofWkkars09j3F+7ZL1g4kVfQJrLuUUdRZ+yvv8qEiqqb13KsORv/oj2uwbf17kJDQ+OYzF77i6dMGTr760u+ttHsA98zIfycLNUlJuTCa4PjgcyGaTLbJuN3pA/y
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB5685.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(376014)(366016)(22082099003)(18002099003)(56012099003)(11063799006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RC9VLzM0Nk9GNGlIVGxHSDhtTDFobE1lQWJWbzh6U2Vvc2ZJaXQ5NnlGSjVQ?=
 =?utf-8?B?K0RNSElrc3JVSlRabjJIOEdNdDhJU1FYQktmZHZPQzZhSnc5SkZjS1lKOEJi?=
 =?utf-8?B?TzNoWVJhbjlQQlFoR1VSTlJyczY2S1Rsd1drb3kzZU5vTlB3Sk95THJQcER2?=
 =?utf-8?B?QStlbEU1VXRoWVlBVlJwQ1p5d3o5VzNrOENHUERsWERwZURTZmdmcnVtdGVq?=
 =?utf-8?B?RWM2Y3Rna2F4M1M5enoyWDFmMWVDUU9oZEtCM2VLcjIwa0RYREtBVlRMckxS?=
 =?utf-8?B?bUhBN0VLdGIyZE51VFZ2WGVGbXpJdU1KV3ZhRWdkcFBXOEloN2tHSU91ZmZ4?=
 =?utf-8?B?MVJYM1VrN29icTBwZ3JyRnFGUUNDMDQ2OUZJQ25KVGpLQ21OWDN2UHZzVjAx?=
 =?utf-8?B?aFdJZldLMGJqcVEvd1FGZ0FsVlVFQmNQTTIza1hPWkRCZDh2bWZjZWk1Vzlk?=
 =?utf-8?B?TGk0S2Jsd1JmNzgyTWl6Mkl5dktJTVEwc1JKNDdlZTNjL0JrMDJoYjlFWlY0?=
 =?utf-8?B?U09SUER3Q3cyMnZWWXl2RHBUamh4cjlrY2ZlSjF2NE9ZbTFpaFZaejVJU2xQ?=
 =?utf-8?B?NERPL1JPdnVseC94S3FJaHFNNGhCeVQvVkZqVFMyckJsY3BKRnRvOGI4Nkc5?=
 =?utf-8?B?S2JvMTQyYmdlS3F5cDZKeklYcytERmRHcEFrdDhkeE9zSXcrUEUxVkdXcXF1?=
 =?utf-8?B?ODZKenZBTFJhUDlGbm5waEVMUGJrazQrVEZaY1BTeWdVcnNOQW5PWUxERVlw?=
 =?utf-8?B?TEQ1YVBzWEFJemhjOEtlZktDUlRXN3UwbkhjRnM2ZXVQYVJmUVI0SGhHdzNh?=
 =?utf-8?B?UXZ3aWt2cXkvUXdveFQwdVVNdlR5QWNNM3U3bTYrVERoZE14SmJ5N1RidzBU?=
 =?utf-8?B?bXRZRUZnMlY1RjJLd2VUSGlVL0xpRk9jYTdmb0JCUy9RY3p2enY0VWUzYlNG?=
 =?utf-8?B?NWZNazVFeTkvVythby9rcmFGN2FOQVU5UnZyVEdUeWVhR01PZlVacHAyRzdX?=
 =?utf-8?B?RnRVbDZJSU1PQmEzWmFibFByd2ZLOXorMFNWWEpxbXN0U3R4VmdMczQyeU5H?=
 =?utf-8?B?c1I3dG91WTVTUzdOYUFwMENOUFV5RUFjY1Ivc1cwK3R1YWdqOXBoMDdWV1Z2?=
 =?utf-8?B?ZmVHeDg5M0NHOHlkWVNSOVhZR1JnZWZ2UUtweVBhMC9rejRxcExoNWY4SEo2?=
 =?utf-8?B?R1c3NFBFMjNvUzIzcUxlY1E2MFduenhIdzZvSkdqbVpoM2hNeGZUMEEvMDFP?=
 =?utf-8?B?MFRoOG9xczJhRVE4QjE2WlQ2NDBEYWNLTGlvb2lPcVBrVUdVb0N0U1ZWc2l2?=
 =?utf-8?B?dERRQnFvdEpKODJ5SUZNQithV0hEOVpYa3podzgvSUdmT0Z5NXlmNThWY1Ar?=
 =?utf-8?B?S3JTby9Fckk0K3J4eVYwbXIwc0ErR2FJY0VpZDMzM2thN3JnRnpoeWpiY2pJ?=
 =?utf-8?B?TzB4eTZkbFBVOWtrOUxKbGF1SWtVTGFYaUV3L1BoTVRxYkNEZzJwc1NEVkxm?=
 =?utf-8?B?YkZrcFQ0MndFOGVYZmZmK1RucmZ0dFNHS1NQdnlseWNUcW54OXhCQzBqbk5m?=
 =?utf-8?B?QlR3b2loLzJxYW9Xa0w3NEJNZ1I4QVdwL2sweG5zcFp6Um1URm5uUElJMndT?=
 =?utf-8?B?clJJNFF6eForTEdKUkd6ZE43d3AyZGZ6dmpQSndLd2hDT0FMOVBhVDBDamFr?=
 =?utf-8?B?UCs1blVNM3UvWlRnUll1MUw3WUlWeXVUcnl0MERyREtUa1dnRVNEcDJhN2VT?=
 =?utf-8?B?R1lrajZicWJlVXhpUFNDUDZESjBUYWREbWZITW5sSkc5L2xuTkFmUDRwd1lv?=
 =?utf-8?B?Q3Q3QXVIZC9lRkhZNVd2Q1BOSHFkRUZ3ZjlZQXg2aWkwWk0vQ09BdzhKaXd0?=
 =?utf-8?B?QXpVRlNTOThkQ2tUelNDT1g2Rmd1elJjbTl0ZkJaV3VyaEc2dUl5RllEeEhK?=
 =?utf-8?B?dVY0clNkc1BOTDkyaSs3bnppYVY3UGhkbmJhbGdDUW9RRHlUMnNpcE9ucGpB?=
 =?utf-8?B?VXVKcHNSMVJXNUo1U0xTWEJOcTFwZ1JvSTNiRDBYYWZLUm1halplK2htdk5s?=
 =?utf-8?B?N25lWnNQYTRCb1BZR0MyYTJNNFUyaTZBcTBJc080UEprcjl3ZFphMHRDR2s5?=
 =?utf-8?B?SHNUWmRKQklNUUpiMkVpWm9nNFZ1VTFwazZ5ajJZOW9rRENicWN0NStENFps?=
 =?utf-8?B?ZVdQTHBWVEtJS2VmNzhOZEIwdlhRZEJSZ0RXbU0zMkV6ZHpsT1FCVHNENFVw?=
 =?utf-8?B?WnNPZGg4WGU1WjRIUU9tcGxNRm5NV2hyVDFlSDFxZVVEVHlxTlJtVDM0aWJ2?=
 =?utf-8?Q?CqOvdxhsaHzN2yiJAp?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a6d35d34-c66a-4dde-c074-08deb663f0c5
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2026 11:35:49.3225
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pAPb6mGaJXsSZHHjJpwylIOXoPoXT4sFed/r9hQT3WaEAHUYCm2T/o0R3nW+ur2x
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7110
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
	TAGGED_FROM(0.00)[bounces-108724-lists,linux-arm-msm=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,amd.com:email,amd.com:mid,amd.com:dkim,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 190EE58CD94
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 5/20/26 12:16, Thomas Hellström wrote:
> Use __UNIQUE_ID as done elsewhere in the kernel rather than a
> hand-rolled __PASTE to craft a unique id.
> 
> Also use __maybe_unused rather than (void) to signify that a
> variable, althrough written to, may not actually be used.
> 
> v2:
> - Move assignment to declaration (Christian)
> - Declare the retry pointer as void *const.
> 
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

Reviewed-by: Christian König <christian.koenig@amd.com>

> ---
>  include/drm/drm_exec.h | 21 ++++++++++++---------
>  1 file changed, 12 insertions(+), 9 deletions(-)
> 
> diff --git a/include/drm/drm_exec.h b/include/drm/drm_exec.h
> index dee6ebdbe416..18f84faabbb9 100644
> --- a/include/drm/drm_exec.h
> +++ b/include/drm/drm_exec.h
> @@ -95,6 +95,17 @@ drm_exec_obj(struct drm_exec *exec, unsigned long index)
>  #define drm_exec_for_each_locked_object_reverse(exec, obj)		\
>  	__drm_exec_for_each_locked_object_reverse(exec, obj, __UNIQUE_ID(drm_exec))
>  
> +/*
> + * Helper to drm_exec_until_all_locked(). Don't use directly.
> + *
> + * Since labels can't be defined local to the loop's body we use a jump pointer
> + * to make sure that the retry is only used from within the loop's body.
> + */
> +#define __drm_exec_until_all_locked(exec, _label)			 \
> +_label:									 \
> +	for (void *const __maybe_unused __drm_exec_retry_ptr = &&_label; \
> +	     drm_exec_cleanup(exec);)
> +
>  /**
>   * drm_exec_until_all_locked - loop until all GEM objects are locked
>   * @exec: drm_exec object
> @@ -102,17 +113,9 @@ drm_exec_obj(struct drm_exec *exec, unsigned long index)
>   * Core functionality of the drm_exec object. Loops until all GEM objects are
>   * locked and no more contention exists. At the beginning of the loop it is
>   * guaranteed that no GEM object is locked.
> - *
> - * Since labels can't be defined local to the loops body we use a jump pointer
> - * to make sure that the retry is only used from within the loops body.
>   */
>  #define drm_exec_until_all_locked(exec)					\
> -__PASTE(__drm_exec_, __LINE__):						\
> -	for (void *__drm_exec_retry_ptr; ({				\
> -		__drm_exec_retry_ptr = &&__PASTE(__drm_exec_, __LINE__);\
> -		(void)__drm_exec_retry_ptr;				\
> -		drm_exec_cleanup(exec);					\
> -	});)
> +	__drm_exec_until_all_locked(exec, __UNIQUE_ID(drm_exec))
>  
>  /**
>   * drm_exec_retry_on_contention - restart the loop to grap all locks


