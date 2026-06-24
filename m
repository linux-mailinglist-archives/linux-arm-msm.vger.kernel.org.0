Return-Path: <linux-arm-msm+bounces-114423-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id jJVZGjdEPGqclwgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114423-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 22:55:19 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E9016C14A2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 22:55:18 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amd.com header.s=selector1 header.b=NTnNBCmH;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114423-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114423-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=amd.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 5FADB3001A48
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 20:55:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C9AD2DB7B7;
	Wed, 24 Jun 2026 20:55:13 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013037.outbound.protection.outlook.com [40.93.196.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02F633CB8E3
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 20:55:11 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782334513; cv=fail; b=aULDjixkJ+v6LydhQ7fC8zVuQ+I4l5JzR7oWLF3Cq6oxbcpqQrlpkpTcjmcUcMWSukSurG+qphNmA7KU7Smt44yt2ThyazO/lqqyC2jvVUnS+Sp8pO0LlmJcEO/khQBvi1icJbAzc5RnuFDqQlDw7Lkfl71TdCKSc4775MLtrG8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782334513; c=relaxed/simple;
	bh=eXQSvtl8j3vM3si7sfEMu0PfUD7iMR0uj2sIlEPX/S8=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=eVRWUXp0aN4i+SE8pumO+wVVzjadMDwXIVTIXWlkx1h9MFmp5m6helehQF9xkDTBSChr30zqL7L3x6o6CDCVpK4JBSpunH0PLta5Hgu+8URdGUmC8Pa2NjqOvAQLC4txeYe+33w8AsB5x5dJWyiC76g6YmjbWQw2I6MnDm/VP/U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=NTnNBCmH; arc=fail smtp.client-ip=40.93.196.37
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ymr4TUsQ3TgE1UyW/zZhLE8VGwAaUvqxbk9Xh/hPETAGs2DzUXt8R+2lW8o0KrVcSpqtq+OdcJxcQQ0M5iAKCSJI9o5zJnAfeZc0gX25EOtt5oexzvqaJcxbthPjDlRjesVxSkOFzm7PilMCICLw2KOojKZrAGFgPt9Bb/4491QALFwognJAE8rIYeWN+/S/3xJ/fStGmWg1orkfjoKUQXE6KFR/Nskn+WiK6qkEfzBXUToBweTEPtPL17xC37BUhNMizDPeyLzd+Ithw5Z36ju2LW9ebpdBoeBgYMKWnC4MWmGqk/EaM3q0bH2E79U+THrZxyjo4hpqHxfgK7/jyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U8zNEwiHP2lk2f3Ss5+S/6uqZV8XkAuYQtJdAVKabxk=;
 b=KFdNmlnltUE3+u5zELt65cOk5rcgZ+CUyan1BaftIJLxNl8xGCdYWqnhYv8LwVqlvFL1hBh/hXZBFUBmgqzdocxu66boVBzf6BsY3EZEQg8fhxXTFHqI4STxnILhp6KSxcoUdniR+ZS/R3NFevs8bbmA/IXtfpNMfWIAYn68lqLA59N+ODPZXtXAEtZMkNTw+Qwm+/m9noxBjmrKNst7dbkCOZlqDI77HFR5ncpYg7vEYxjmgVOdj15RoH2tpl6624LaJHVZ3FjiCN+LlJ5f6QR8rwxQEdY47yYz6qi2/6GyKJOIZSObGb6CBbuGsC6AJqD6ocFzCofB9pdbikhtaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U8zNEwiHP2lk2f3Ss5+S/6uqZV8XkAuYQtJdAVKabxk=;
 b=NTnNBCmHSWdxQQGTf/VTtxV45zcG63z9Ef9OnjhaGmH2Q/gUMqVn6XR6WMSciN+Ps4U5Ama1LPZC9BPSs2J39izYGxqLxu6sF+6NMbMqM1D4q9fVhxk1b84XH1XmJ+2rAWW3njba2V2gXwGEutUNqUM1uDHyNUppsv4vko9l5Gg=
Received: from SJ0PR12MB7007.namprd12.prod.outlook.com (2603:10b6:a03:486::8)
 by SA1PR12MB9246.namprd12.prod.outlook.com (2603:10b6:806:3ac::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.14; Wed, 24 Jun
 2026 20:55:07 +0000
Received: from SJ0PR12MB7007.namprd12.prod.outlook.com
 ([fe80::6f95:c4a2:894d:9e8a]) by SJ0PR12MB7007.namprd12.prod.outlook.com
 ([fe80::6f95:c4a2:894d:9e8a%5]) with mapi id 15.21.0139.018; Wed, 24 Jun 2026
 20:55:07 +0000
Message-ID: <b4165454-1682-41e5-aaa7-294462251413@amd.com>
Date: Wed, 24 Jun 2026 16:54:57 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/7] don't allow changes to inactive colorops
To: Melissa Wen <mwen@igalia.com>, airlied@gmail.com,
 alexander.deucher@amd.com, alex.hung@amd.com, aurabindo.pillai@amd.com,
 christian.koenig@amd.com, contact@emersion.fr, daniels@collabora.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, simona@ffwll.ch,
 siqueira@igalia.com, sunpeng.li@amd.com, tzimmermann@suse.de
Cc: Uma Shankar <uma.shankar@intel.com>,
 Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>,
 Xaver Hugl <xaver.hugl@kde.org>,
 Pekka Paalanen <pekka.paalanen@collabora.com>,
 Louis Chauvet <louis.chauvet@bootlin.com>,
 Matthew Schwartz <matthew.schwartz@linux.dev>,
 amd-gfx@lists.freedesktop.org, kernel-dev@igalia.com,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20260609121230.1358786-1-mwen@igalia.com>
Content-Language: en-US
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20260609121230.1358786-1-mwen@igalia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQZPR01CA0023.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:85::19) To SJ0PR12MB7007.namprd12.prod.outlook.com
 (2603:10b6:a03:486::8)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR12MB7007:EE_|SA1PR12MB9246:EE_
X-MS-Office365-Filtering-Correlation-Id: 7db0ea9e-cde9-4456-9e4d-08ded232df48
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|23010399003|366016|921020|22082099003|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	+nntdyI7/b6kihn3JJgAu8kA2Jnxl0HY6vFxq+/Gj4+i9Zsxr3H4mAzm51oaOzVoqNGSfmTcOU2D5e5oSVLNFNoiUOKU/o1grVNmDl4PAWRFFcBRSIUqCobrSMcRMMLNgjsBGtFHCkrda/6AWLQaJyn2FHcgdPNDLMVDcOE67zMMVyL51wlsxObGSfnv5/lPKtgs6fWJ+kw2NKuI9U4LqApbpghKgtNiT2zPEb2C8EuKCZoPCaoM3sPOWfA8yxL8qYaJ7yrWQX1+FBqKHrs7cYc7RV+JRO5k6/qz77a//j+YRzVqDwpYxQL8tvrOFCJdbBCAV2fBb4bWNB6lYPYhrDvLHZ7UAOoOeAJZpQEQbzPcCbWRuCer7hW2mIYN0MFThLJj+K9tqLbG/RE9ugAaZhwu4Of0pRd+HlBr+3BGbZGXZe4fqD/Jevp/CnAM6MAKdQb4CUEoe11LSIRfTPTjoeeueyCzXfqdJiGhDwyeP+q2kB1Q9up1JECPYZegoLe2nLZHWCSF5lRRgunnhfV7MLrRcHjapnQWjgcC/NawSZsT2UD7lgK0Ia2gBMiXKZ7i+GR2cfqqzVkHwEMfU15tUSsWrZ4N//C76iQlbHShtaiVrXYR5NlKVwwoB5aEW6f6PDa3umehjP3b8vNtJtDT4DRL5zmpPGSefMmoYVOw8KpR/OmnOBMFWUPLZbAvh6hfspw9G1zoXmFmLH/Pc5Q16w==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR12MB7007.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(23010399003)(366016)(921020)(22082099003)(18002099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RGllRG9nd2JLNnlMTWJOY01IMXpXZGhpQkVUbWJkZDNHdkM1WEI0aEpxWkdT?=
 =?utf-8?B?RGdteU9IOXNGWVpGZnkzRk1UdFRGWlUrbFhvbm0vbmJJZ2VNSTZtUXhRNFRw?=
 =?utf-8?B?OXUwdWV4YjVMRkJMbDVIYXU4Q0dhM204Z2hzMnU1SEZNNnV0emtJVXVid3Nv?=
 =?utf-8?B?SmZXdXZORDNLMGRHcXdRVis2QlBYWmc2dnppU0dqLzRlSVVQRVVDTWZrVzFp?=
 =?utf-8?B?bXl6NHFkN3ZsOGhwdHBEUTlCR0Y4ZjZ3ak9ReGx2RmNnNEpJZldKWTFjZCtG?=
 =?utf-8?B?SytJVGxIQTNmRmU0elFVbFJIOXFiRTFPUkF5NDNrTDVUMlpQK1VRV1pEaUl4?=
 =?utf-8?B?SnR1YmJmMlZaL05JMHRLd3VtZlRpS1p1dzRWWWNSSFJWWjhUVytyeXhRbktR?=
 =?utf-8?B?SUJ6MzdYZytaYVhTMDlyd3pzdDdkZDh4WTkrYkJNWUowc3NoVnBNZjVtNjJx?=
 =?utf-8?B?K004VHpPdGNWUGhWbVdBTlY3dWFhK1hTYi9wbWxUcHlGNmpQYjRXUWlRdUpl?=
 =?utf-8?B?c1RBcjZiU1gzRVRzREZkZjJsN0xZRDdxYW5XcTB2QVNUQ2ZTVEhadkh3bHY0?=
 =?utf-8?B?NEt5cHFRaGNka1MvRUpWRXdXY1A4TDBHMjZPOGE1MGRqRHNQZy9hUGQxQTJT?=
 =?utf-8?B?aFdWY2lkeW9pbW5lUGhocG9la1hib1VoTnlKM3ZIOTQ0SzdqZXhZV1hFb3Iy?=
 =?utf-8?B?YklVNVJldjljRHBTVzBtL0xGSWFPL1lNN0orOWZsQWRUUmdRMzRnSGNUN3Bt?=
 =?utf-8?B?WXZpUDgvZXJxTThIcjFyK2NJU1hpNkNHWTFKczVWeklrVS85UnBLRFNnZWNs?=
 =?utf-8?B?V05ML0NoWUNqQVdwSGx5WmdDemh1dFd0cmFlc2FiRXVmcWFXbG5QaVZCSlQw?=
 =?utf-8?B?SDZkSEU0VHh1Z1RTZHF4MUJoZFJsbkJRMHZPTWZhRFZicVplZnI5dFpib2l6?=
 =?utf-8?B?OW9oQzY2VG52QlE5QzJ5UWQ2R1VxbGZzRlY0M1VoSmJQYnNPV3g4WGN0NVhP?=
 =?utf-8?B?dldjQ1JuLzN0YTBmUnJ1ZGhUOU1abGdTYU5XZ20vaCtiaGdndHo5N3NuL3M3?=
 =?utf-8?B?dGtPVnFYWS9pTWR4aDRtenBqU05JdGdkWGdqOHZTd0FJTitsTk9MMUR6dVFR?=
 =?utf-8?B?NXBqUkJFYU9OZFlXamY5dFVheVpwOUR0U0lKQXovT1g1ZVhzOXF5R01hZlBx?=
 =?utf-8?B?VC9NOEoxWlhSVzNYZUJhZmZyQ2l4U0d2N2FhYm1qZUR6ZXBIdFYxMmRVQ0tt?=
 =?utf-8?B?UlpMblVRRTNnR2VXdkVUY0hTYnZvK3NUSFQ1eGc0UmxvWFBMd0xDMFJDVks2?=
 =?utf-8?B?KzZZL2ZhcHhaME0zeUNuem45L21RUi9qVFcvZUliTWg4YzdESDFRbDJTWnRW?=
 =?utf-8?B?cGhOSXVIRUZJSEhZRjU1cFBDUCtjT2pxSXRWM0xtQVgyOWg5cndsSDB3Y1k4?=
 =?utf-8?B?Z0hnVDY4ckxIUE83K2tKWWlsUW5ia2NpaWpNVlFTRFdENmhpTWxEUHFlbjBM?=
 =?utf-8?B?QU5CUXVDYkpPb0FGSDliUVY5M1ZJVFpOV3FyRkkzaXVNN2xGcWdNUDdqQ1E3?=
 =?utf-8?B?RXMwZVNUREh3VXBuOHVZdzkvYU9ObEJGY0JLWE5LOUxyZG5CRzA5NlZENTdG?=
 =?utf-8?B?L2t0S1BLK3ZZdXZxTTVmNE5SeEN1WURhSGdGM0Z0U0NDUzc3aGhDVG04U1N2?=
 =?utf-8?B?dU90Q0RLeE91NVdUWkVWeFFaNDRMVE9FTE5uWFJ0MTlRb2taQVYxVEJGcFpK?=
 =?utf-8?B?U1lsR3AyeTg0ci94QmR2THZsWXA2T09MVW9VQzRxMlpQS2FJamhYT1poWXA4?=
 =?utf-8?B?SUJobFRQWVhiSFhzYysrRUZJc0h1UDNaUzlXSldON0tOeFZNZzdYUmk5VUo2?=
 =?utf-8?B?RTVNZTA3eGU0c1o5MVN5WlhsSE1yL1lobkJKYnJWWWdHcmtOVFBLUTZLUjFO?=
 =?utf-8?B?Q1J3b2lWdkk3WlJKVDFRWmM4Sk9BczBpT2ZRUmRndUtxeXQreDBpRVNQTTR1?=
 =?utf-8?B?c3o1eFMxNlJ6a24xNjFPbWlnK0orV1RKSzNQZ052cURaSHVwNVVTaG9ZQ2Fh?=
 =?utf-8?B?Y0IrSFVJSDNSSWtiQzVtWHA1TVI1c0NZT2V4M24yd3R4S0lBQ280MlYyM2ZD?=
 =?utf-8?B?YWkwamJaNzlwWVJGaTNwelY2WEpySUpFaldoazBBamI1djlzdE41V014amUz?=
 =?utf-8?B?Z0JLdFpDQzR2R29jUkhkQkdFdmtLa3JQRlZ2VzU2WmRaU29YMDljQ0ZBaEJS?=
 =?utf-8?B?TmdYUndtemR3dEV1WU9TTDk1TFlvM25JaEs0RzVYSnBxVCtCd3NjaEJ6dU9p?=
 =?utf-8?B?RVFnaHcyTTNRN0FFVmNiczI1NmxrVVZUMUloMmUwNEN2NkJmSmhhdz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7db0ea9e-cde9-4456-9e4d-08ded232df48
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR12MB7007.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2026 20:55:07.1628
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pxAdU6ndPRTM9ZQ99nRnOfz9F3XR1qiIU0VUZoFnxtNVUyUT4ddmCVj4PSDATazDHKmkRxeotuIKgoJ7Ctmrfw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB9246
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-114423-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[31];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:mwen@igalia.com,m:airlied@gmail.com,m:alexander.deucher@amd.com,m:alex.hung@amd.com,m:aurabindo.pillai@amd.com,m:christian.koenig@amd.com,m:contact@emersion.fr,m:daniels@collabora.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:simona@ffwll.ch,m:siqueira@igalia.com,m:sunpeng.li@amd.com,m:tzimmermann@suse.de,m:uma.shankar@intel.com,m:chaitanya.kumar.borah@intel.com,m:xaver.hugl@kde.org,m:pekka.paalanen@collabora.com,m:louis.chauvet@bootlin.com,m:matthew.schwartz@linux.dev,m:amd-gfx@lists.freedesktop.org,m:kernel-dev@igalia.com,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:intel-xe@lists.freedesktop.org,m:intel-gfx@lists.freedesktop.org,m:dri-devel@lists.freedesktop.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[igalia.com,gmail.com,amd.com,emersion.fr,collabora.com,linux.intel.com,kernel.org,ffwll.ch,suse.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[harry.wentland@amd.com,linux-arm-msm@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[harry.wentland@amd.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[amd.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5E9016C14A2

On 2026-06-09 07:51, Melissa Wen wrote:
> This series is a follow-up of what was discussed in [1] and on #wayland
> IRC channel regarding policy and userspace expectations on changes in
> colorop properties and the current status of the color pipeline in which
> the colorop is part of. In short, we agreed that userspace can change
> properties of colorops that are currently part of an active color
> pipeline or when the pipeline is switching status in the same commit.
> However, userspace cannot change colorop properties of inactive color
> pipeline in the expactation that it will be activated at some point in
> the future.
> 
> Userspace also expects persistence of color pipeline already set, even
> if it becomes inactive for a while, when activated, colorop settings
> previouly set should be preserved.
> 
> In addition, I found some bugs on IGT tests when this policy is applied.
> So I sent bug fixes to kms_colorop and kms_properties to behave
> according to this contract [2]. The rest of the series in [1] was
> detached in [3] since there is no dependency between them.
> 
> [v1] https://lore.kernel.org/dri-devel/20260526142940.504911-1-mwen@igalia.com/
> Changes:
> - define a macro to walk in the color pipeline (Alex H.)
> - fix checkpatch warning (Alex H.)
> [v2] https://lore.kernel.org/dri-devel/20260604180457.1110110-1-mwen@igalia.com/
> Changes:
> - [Drop] drm/atomic: duplicate state of all colorops
>   If inactive colorops state are duplicated on resume, the commit will be
>   rejected. 
> - [New] Four new patches to make AMD driver match the policy of colorop
>   updates only for colorops in active color pipelines plus individual
>   colorop updates. It also tries to untangle COLOR_PIPELINE = Bypass from
>   colorop BYPASS prop = true. I think patches 3-5 can be cherry-picked and
>   applied if it looks correct for AMD, I just included them here for
>   context (for example, Sashiko reported an issue in the previous version
>   of this series).
> 
> [1] https://lore.kernel.org/dri-devel/20260519211111.228303-1-mwen@igalia.com/
> [2] https://lore.kernel.org/igt-dev/20260602211259.898147-1-mwen@igalia.com
> [3] https://lore.kernel.org/igt-dev/20260526140752.503380-1-mwen@igalia.com/
> 

I went through the series a week ago before being getting into the weeds
of other-important-work-tm. It looked fine to me then. Since I'll be off
for the next two weeks I wanted to make sure to at least provide my

Acked-by: Harry Wentland <harry.wentland@amd.com>

for the series. If you don't have RBs by mid-July I'll be happy to have
a more thorough review with the aim of giving my RBs.

Harry

> 
> Melissa
> 
> Melissa Wen (7):
>   drm/atomic: only add states of active or transient active colorops
>   drm/atomic: reject colorop update from inactive color pipeline
>   drm/amd/display: don't check colorop status if its in an inactive
>     pipeline
>   drm/amd/display: truly bypass plane colorop 3x4 matrix and hdr mult
>   drm/amd/display: make shaper bypass mode cleaner
>   drm/amd/display: fix bnld colorop bypass mode
>   drm/amd/display: allow individual colorop changes
> 
>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  31 ++-
>  .../amd/display/amdgpu_dm/amdgpu_dm_color.c   | 178 +++++++-----------
>  drivers/gpu/drm/drm_atomic.c                  | 125 +++++++++++-
>  include/drm/drm_colorop.h                     |   3 +
>  4 files changed, 207 insertions(+), 130 deletions(-)
> 


