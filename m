Return-Path: <linux-arm-msm+bounces-108723-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CJTFB1OgDWqC0AUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108723-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 13:51:47 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id D2F3858CF50
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 13:51:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 383733059E55
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 11:36:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07452548EE;
	Wed, 20 May 2026 11:34:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="0ezorYv7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012069.outbound.protection.outlook.com [52.101.53.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E25133B6F9
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 11:34:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779276891; cv=fail; b=I6ofNWwEoK6T5prgKkJo0iuwQqSWPPIduUtP4xw0+FeGVNfyM1noW5j6J8jFWGqw+Z6FVeEFiuFLZ43tvM4CQjZgNUPpbIHgiYl53+ETH9fudGwcIMBmzurMqtPZ4DTZEn1FUhSa4nYK09fVKE+VwVirfE5EcX8V9EalihJqD/o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779276891; c=relaxed/simple;
	bh=z1wUQwUc5vJeuBB1dIMY2jAsxi91MLMG7V1UFCaKTxE=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=kO7/puJHBLG0jlFgZdMEfdcmG3/LzYlHMzHgzd/prHxWnED5gtlo6uuFL+3Boi0DBa00KUBz4hkLu5GMTa47EmRn8mQJptW3G/6BC/izCcy31d2VMiPwWoRIik+c5g9nUFkPoHROaZc/gJyjkt/aoPz+AQ2leuCpVyAWnmn7WXU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=0ezorYv7; arc=fail smtp.client-ip=52.101.53.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OR6vF2k6Jh0Ng5uaVyJFsFqo/RK1lr/q3f2oJubarKKEeuz2ePcaJltLvBFkXm7jeE0WO0Pjezq+wVlnP1M4n+AJJKI/ZT+pjMyzDiV2jac6kVxQHQ1QgBmDWYOyn68Ea3DZm61O8tENAY2p8WL5lTsjeYct5krPRXhu/1dPPI5htz/NacwYtCYWBvGhm6GFxAUrFJdENl0H8G4Cd4ZbDw/EvWoIGmHPHXuwvsWnWaSDE+7b/s1uE+Jak3UOwYaSqUlURFOcSSBLBJw+n+gDe3P/V0hK1Rk3A3JYiLiPPeqxBFl5jPZcS6IJMqOSU4pbue2PCVk5wwc7bQa5QU2v9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LMvdvjN+035aHYQy4N7pvKWv9b5M707dZZ5wYn0whVc=;
 b=cfeleXROYEfkdjGwTbo4O7mSA9qFRp3DpxRiUVKtoplGT4kS4cxCWzI+Na71Lm2vh9zSKXPs4MKb7AysEi2PNkOMIJFYlc4JKoxD2IIF4vATRz/ESRs9aTKffYQpEwB5eEgXCkHpSFsRUb8nztwJ8B/rSqNhxX9Z+07M7yO/tllZxEgTJgvXCqUWTfVGMnh6CtIquufx4xBlWJ44JMG2iDhmo49hMvriUBuRqX6CdMbGerivGNW/Yl3ILgAXk/xvvtrri4SdWJJ29m8Qt5NhaU8XDgAKVsPOK16M6ObGlODXHtuPQkb3wOhEfflBCEnScQaiMf6Jh3lCPKv0cmAP2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LMvdvjN+035aHYQy4N7pvKWv9b5M707dZZ5wYn0whVc=;
 b=0ezorYv7ihVUYAiALmBKOC1bODTnX4nM02Fbskwa10LeR9c37hVstxHpT9H9/Ee+htGFo7Z6qgeBaTSDLKrBGsoFIrC14WCnFg5NyxoazeR9dZaaLW6cWJmcbSzrZsk6E7jtm7ALh60SykBB503C4/6rzx8+esE+U/ZWeUPFdpg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by PH8PR12MB7110.namprd12.prod.outlook.com (2603:10b6:510:22e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.14; Wed, 20 May
 2026 11:34:46 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c%5]) with mapi id 15.21.0025.022; Wed, 20 May 2026
 11:34:46 +0000
Message-ID: <da49f6c2-5b6e-4bd6-8940-84206b5913f8@amd.com>
Date: Wed, 20 May 2026 13:34:33 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/4] drm/exec: drm_exec polishing
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
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Natalie Vock <natalie.vock@gmx.de>
References: <20260520101616.41284-1-thomas.hellstrom@linux.intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20260520101616.41284-1-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0015.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a::25) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|PH8PR12MB7110:EE_
X-MS-Office365-Filtering-Correlation-Id: c14b8524-eb2b-4a60-8a97-08deb663cb73
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|1800799024|376014|366016|22082099003|18002099003|56012099003|11063799006|3023799007;
X-Microsoft-Antispam-Message-Info:
	7flMOVAsEd/PZvD6A/vnT+FrYuojou2ulcxIlf3npFFjea3IQpAZZiLrIB/UFfZYv3eJyss6GmAcIfIOC55D069O1uI51+g1+IfydlvYPM3OAXXUW7Q+YFJ8HZjR7xVAl7yVx0CWpV/M8q+WUhqhP/xl/B+HszZCSWw/HjTJB7PkzIxVHPDYOgYdpF3zMxm13gLrflFveqY45L2usmXyeV86HM7tWf96GO3nfaBJ6Ah51Vcg0JqVJpZgFu8RccSCQkO9yeyhb+earpK6h66Vol1BRfoUAkyRzx36gqK8cWuTvoWmm16DKadmh4rU1A/Ip+YVkRCplBfnKtLsI3L5XbjbgiY+X5Rf8wPNz5fh4R+YAyqVcGzHN9kh9TzbagGzL6AfY2kbjsOMZdxCYEXHe1jjWOUY5Q4wqp1MIpq71/RKsGGnloVwLK/0+QW3Nl2RJ9JGM4mURJfFW5YOW9av0EqucaeRxrTjwxu8Kjpmj7i69oySvkx4nSpwPFxnVTq5+8IRDoIjQz2ybEY6FmKOKdg4lzU7CDQoqXz5m6Z89F0IChBIYcTNCNeN71yr0Dnh5shKgWEhazqF91OmRd9fTj9dAkX1tISlKwq09YgQhWcVguFOUYaY6quA4eNF8lOY7FIqO4sG6ME6IfRQi08NniXBlyllQfe5q+0/qu91z9oi3+jPoN4WXvRf4P4Hbsf4
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB5685.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(376014)(366016)(22082099003)(18002099003)(56012099003)(11063799006)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TjE4cGMzWEdhcFQvM0RxUnNFTnNSdTVWUlo4RE9ubTkwbkNXTytYN1RiekJ1?=
 =?utf-8?B?aEl5NG5NUDhkUDZXOG16YTZwMnhtOHhMZ0NmRXBXUGdaNzlrZXRFRit5OFg2?=
 =?utf-8?B?c0RJV1pzYXppajdqWGJrYi9YbHFpbU9WUmhpTGpJNy9Zcm8wMERaS1o0UWtO?=
 =?utf-8?B?WXBMYUZMQ1lpT3NpRGJxdlR4RTE5ZnBCdkNDYk9qTkprS2FzTEdkUkx4WGdw?=
 =?utf-8?B?YU8yMXBsRS9Gcm5EckZkMDhyVUo3MVpCTFFINitoU3BwckVmUUl3aHY5Zmtq?=
 =?utf-8?B?U0htbE55dUJLbkRLZElVcmdYS3BidkxBRm5YRmZxektHaFlpeHFmdXN3V2hy?=
 =?utf-8?B?cFJjT2lFdHY0RTRNUWZqeW1DRTlxeXMybWViZWpESVpKbGEzQ1JoRnErWVZB?=
 =?utf-8?B?ak0zSHhjS3ZoSm92VWR2dDMxRGJ6dW5DZ1hxbldBenA2cHBQV1psUTVOeDJL?=
 =?utf-8?B?UGZCSG5SZzFUcTU2VlNKMmtRenRrNS85TmdDMitwNFl2TWlvWHcwZndla2tq?=
 =?utf-8?B?SlNacEVVWVQrVVhadjl6RkhzS3I3MjdobkMrRmtKRDVWUHdUUFFTeXBXSnl0?=
 =?utf-8?B?amVrK0hPOGdyUi9BN0toWFlHSGNqbDRSaEdmMFVUWmNibitKdkx3dGZUS1Zn?=
 =?utf-8?B?K2xzTXpNS0NsT3pkU0hvTDBGblptMVhqYWJtTjhTTEhiWHdRSEJBL2NNSlhT?=
 =?utf-8?B?akZ6LzBvOTlmSU5aclpBTThkMUhQb3JjUFNJcGIwS2h5ZUx0ZDZFckUyUlpE?=
 =?utf-8?B?LzBZMmhHQkZycG1sREtRUWVkbHdNM1BRTlFmM2o1ejRqVEZoMjBSamNJVG15?=
 =?utf-8?B?WDc4SVBwU0VDQklZckFOcFNDcXdRaU54dEVVUWhoVGlMVTBpL0ZlK2sxL3JH?=
 =?utf-8?B?SCsyMEVKdHE0L1NwdFZkT0pqaFQzcERweXdsVURDRHd5eWMxaDd0djV3N2R5?=
 =?utf-8?B?TDFlWHk2US92eUFoWUg3a0E4S1dudlpSRWVhREgxSS93T0N0cWFwVnYzQ3FI?=
 =?utf-8?B?Q1QyWDdaT0VveUJBU21GOVlSOE8yb0duY2FnT0tVT3lZSXJZakVWeFk5OWRT?=
 =?utf-8?B?bDR5QjhETjhsdEp2eGNnTkFnQUl1SzNUbVFiN054RVJMdlhyQ3JydDhVd3Ev?=
 =?utf-8?B?SDB6M2hCM2J4UkZuVkxPSWNycFc2MVNYamJzaW5BV2dkWXJTMWF1TlliQ1gr?=
 =?utf-8?B?RU03Vi9XSTF3NHdscExyOFVVd3dqUVkya3BsaUkvT0FnekN2aEpDZ3Jsb21C?=
 =?utf-8?B?M1FoM2tPT0RxU0NySGs1OGgrVm5FQldzTWdkeFl1VkNZMGNZNVg5djBRV3Fp?=
 =?utf-8?B?K0xKeHdkU2FnVmd3ZVlqeHFvOVlwZ1QzUFFsUVYva00xa3lXQzBXZkQvZWM3?=
 =?utf-8?B?V01MNWhsY2VyemphZFBwbFlRcndBR3lHL2lYME5Odmc3SzNRMWYwWEVGaERu?=
 =?utf-8?B?eW1rUU1yMmlpYjRNcE9WWCttb3c4ZSszSEM2ZzlJU0VJVGFacE5OYWpON3Zt?=
 =?utf-8?B?UkZ1b1d0TjExelRuNU50TnNQQy9uQnZ5UkVRVjBkRGR6Q0U2NGF3OUVBT240?=
 =?utf-8?B?OUNvUGpObENSTzE1Vm9XZmp5NUpZWjc2QkF3ZjZiZUJkS1lJdk5lYkdPUFZo?=
 =?utf-8?B?WFkza3lIL29LTnNZazAxMksyM2tadnA1N2NCV1RZWGxDYXdQNDV2THFlUUJF?=
 =?utf-8?B?cmF3N3dYVDl5NVZyaVNVbUlScndBdU1SK0c1UUhlQm8zVGVTemp0WDVHMlM3?=
 =?utf-8?B?bnpUMWdyVjVuWk1VMDZFLzc4L013V2cyNVdWZzd4dm0vbUtEcW15b1F5bnJk?=
 =?utf-8?B?VElYQXIvY2w4My91ZjBsU1k2WW95SFQveGtrTzQ4V04ySmt3akIrMDRJd015?=
 =?utf-8?B?VSs5ZTQvN3BiMXhRTTVPNmxhUjRUMERQNW5mTkJONlpNblJGdzY3K0pTVEN5?=
 =?utf-8?B?WTRjRXREZDVlNmlnSHVPYjlWdW8rWXcyb0xkd2FYTXB1VmJCRnozL3NUYm5X?=
 =?utf-8?B?eXdTamxoYXJFeWJsVVZYaTdEZjZDVk53SzRZZE5rUzlQQWU3Sy9ZemthWG5y?=
 =?utf-8?B?L0Vsa1VoM2hpbWI1cFpJbzVKeVBISDc3azFZbzJUODc5bkNWSGo0cU5RZ1B2?=
 =?utf-8?B?ZVlpcVc4UnI2ZlZOcW1Xcm8veXVqSmdKRTJkZmY5cS85M3FiWVBwME1vS1pt?=
 =?utf-8?B?cmQyZUFwendtZHphUFIwMXJzWFlUakNycnJCMXFJcnRSbHR1TWpBOGY1andz?=
 =?utf-8?B?ZWxDK0xQWi9VZlpnNlhyTXYxSzV2aTBBMkk1RGxLaHBsbVNKWDRVZG9kQlA0?=
 =?utf-8?Q?eBXn/XwdHzfY6gYjED?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c14b8524-eb2b-4a60-8a97-08deb663cb73
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2026 11:34:46.7600
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qLCG0R2YJzxDIDA+C6rNtxO0C+x23hP27yrieBS42usoF5Qi7xY6zrCorBCvb65N
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
	RCPT_COUNT_TWELVE(0.00)[23];
	TAGGED_FROM(0.00)[bounces-108723-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[amd.com,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,intel.com,google.com,oss.qualcomm.com,linux.dev,poorly.run,somainline.org,lists.freedesktop.org,vger.kernel.org,gmx.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:mid,amd.com:dkim,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Queue-Id: D2F3858CF50
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 5/20/26 12:16, Thomas Hellström wrote:
> During the work towards enabling exhaustive eviction using full
> ww locking in TTM, Christian indicated that the path for the
> drm_exec moving forward was to be a full drm_exec helper with
> things like userptr validation rather than a WW transaction
> abstraction. The idea was then briefly discussed to craft a
> WW transaction helper and then subclass that with drm_exec
> with the idea that the WW transaction helper could be used in
> TTM for eviction and for other uses that didn't mandate a full
> exec sequence.

BTW Natalie is now trying to polish my TTM patches for doing that because some test case for the SteamDeck is running into issues with pinning buffers for display.

> Regardless whether that actually happens or not, this series
> aims to clean up abuses of drm_exec internals in drivers
> so that future development of drm_exec isn't blocked by
> such driver usage.

Yeah completely agree, going to review those patches now.

Regards,
Christian.

> 
> Except for patch 2 which is a small cleanup only.
> 
> v2:
> - An drm/msm patch was already merged.
> - Use a unique id for the loop variable (patch 1) (Christian)
> - Move assignment to declaration (patch 2) (Christian)
> - Declare the retry pointer as void *const. (patch 2)
> - Only allow if the drm_exec context is newly initialized. (patch 3)
>   (Christian)
> - Fix amdgpu compile error (patch 4) (Intel CI)
> - Update the commit message (patch 4)
> 
> Thomas Hellström (4):
>   drm/exec: Remove the index parameter from
>     drm_exec_for_each_locked_obj[_reverse]
>   drm/exec: Make the drm_exec_until_all_locked() macro more readable
>   drm/exec, drm/xe: Avoid abusing the drm_exec retry pointer
>   drm/exec, drm/xe, drm/amdgpu: Add an accessor for struct
>     drm_exec::ticket
> 
>  .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c  |  4 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c        | 15 ++--
>  .../drm/amd/amdgpu/amdgpu_eviction_fence.c    |  3 +-
>  drivers/gpu/drm/drm_exec.c                    |  9 +--
>  drivers/gpu/drm/drm_gpuvm.c                   |  3 +-
>  drivers/gpu/drm/xe/xe_validation.c            |  4 +-
>  drivers/gpu/drm/xe/xe_validation.h            |  2 +-
>  drivers/gpu/drm/xe/xe_vm.c                    |  3 +-
>  include/drm/drm_exec.h                        | 71 ++++++++++++++-----
>  9 files changed, 70 insertions(+), 44 deletions(-)
> 


