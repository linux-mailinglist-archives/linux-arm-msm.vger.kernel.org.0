Return-Path: <linux-arm-msm+bounces-109700-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uLuBMqgTFWomSgcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109700-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 05:29:44 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 30CAB5D055D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 05:29:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EE402300A8DE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 03:29:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 853DC3AEF2A;
	Tue, 26 May 2026 03:29:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="whcoFs44"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013044.outbound.protection.outlook.com [40.93.201.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3AEF3A8741
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 03:29:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779766182; cv=fail; b=sPvIf1lcTwhPy8JMcId4NZ08BYyckrGoIeB96FxhwWnMYbzf/DjPii9B5dJk5QACt16QwJNN9kVMRzXvSLkvX36SOH3rZVdh3/VFuXse3EpLUBQXCCNvs4O3cVgf36VcIkoFT/Ub/NFP59hlfiscVId2oxr6rrVy1ZmsZ0T3QKo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779766182; c=relaxed/simple;
	bh=LHzwZ/e2apG+vYJfVwheHmQNYp2H4gkWef/eH8r/e/U=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=N3mhe/+p4S0SgMBa3FRIL6ljUth0XiX0RtfddrROcxQGGzhbQoDTcMpnO/qYCaiwexoLinJZsJy0G36ui8RkjYemyDxpnYtmPK+oeKNVtvCzRFbo1tZELZnNMdtJ5r2kXx2sgg9oveUyBbCQL4hI/BWBZOC5vCoyoOteTCwQhdQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=whcoFs44; arc=fail smtp.client-ip=40.93.201.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bEOjpy+ME5p1Gux+YYM9o1yoSs6b3NsHXftxhNpTOKgxAaVL11etpAYzVfNC/TZKESh/eVN9pBSchIBbonK1ns2kiTp1jyHh57bmhhegz/+qAp9TYmY32q5RufxaAULX07h2S9zJaq/qD6jPgfzbX1DNS5DWJUZWJAW6XV+vAvAaQYV5zEwVmwJi59Xm1c7GJZwXg7RsfSAPUn30N0GKSnrFD2lv2k5dZvojlfoGwg0DWZA9IgQDRALShwsk7toeEwSSpMP4Tr1Q5uQtjQtj95xHQiAyE0+naKMNcNgn5nKpABSpowPZBSZEJxcI/6iOgG5pGLCBHWwRY5ABFHTILA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3Ap5oLFmxGqVYfmV0wrSqCC5UgDWW+bNX2eVLTOReGQ=;
 b=jEe8FMqTDnFc6s15oAgVqce5GcLfyWpQjCxdgXCCZlb0NnweMMfWlHFY+AAlnT6gekj/TqVrSPLhG2X6JbkkxTKCzrklxiVN9QG3cUE9/lSoNLzS72bT9Q962aDhV1+s22G7LcG/yplkdB24WuVApMSXBIj9/71saeONZ4bigoxdrHpODzdU8swLp/DwkuXg8b8hGR7JPjazthH4GzybKJsvstH/8HMOqt/q1+gt2z8dtsPYx9+jQ7npZPfXpB4cZ+NYImGh0kL28o0AtgZmOrXNZK5chsj1aMMJu3Sa+EB5IDevOLxDz0frUw3hcnsKcOJLr+PUiOrsmIENeMzGdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3Ap5oLFmxGqVYfmV0wrSqCC5UgDWW+bNX2eVLTOReGQ=;
 b=whcoFs44kAf/6kdGvKRBmHbO0hAESYbgt95vL0ZlOZZeXaLfkh7DZiBIa1K3mW6MqNYalZZSuOX3gYjArArGeq70s8U8bAc7v++zK367XWWi3gAUflkzon6Hxy2Ovzh4H64xqp9nU5eTEgnMmrZQZiEmJvgxpVAVt2FjTS0ynLw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from IA1PR12MB8495.namprd12.prod.outlook.com (2603:10b6:208:44d::9)
 by MW4PR12MB5627.namprd12.prod.outlook.com (2603:10b6:303:16a::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.11; Tue, 26 May
 2026 03:29:37 +0000
Received: from IA1PR12MB8495.namprd12.prod.outlook.com
 ([fe80::bfce:c745:c822:204f]) by IA1PR12MB8495.namprd12.prod.outlook.com
 ([fe80::bfce:c745:c822:204f%5]) with mapi id 15.21.0048.019; Tue, 26 May 2026
 03:29:37 +0000
Message-ID: <fecafacd-7e0b-45a2-9d56-a79cc3997bb1@amd.com>
Date: Mon, 25 May 2026 21:29:32 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 3/4] drm/atomic: track individual colorop updates
To: Melissa Wen <mwen@igalia.com>, airlied@gmail.com,
 alexander.deucher@amd.com, christian.koenig@amd.com, harry.wentland@amd.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, simona@ffwll.ch,
 siqueira@igalia.com, sunpeng.li@amd.com, tzimmermann@suse.de
Cc: Simon Ser <contact@emersion.fr>, Uma Shankar <uma.shankar@intel.com>,
 Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>,
 Xaver Hugl <xaver.hugl@kde.org>,
 Pekka Paalanen <pekka.paalanen@collabora.com>,
 Louis Chauvet <louis.chauvet@bootlin.com>,
 Matthew Schwartz <matthew.schwartz@linux.dev>,
 amd-gfx@lists.freedesktop.org, kernel-dev@igalia.com,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20260525100524.304263-1-mwen@igalia.com>
 <20260525100524.304263-4-mwen@igalia.com>
Content-Language: en-US
From: Alex Hung <alex.hung@amd.com>
In-Reply-To: <20260525100524.304263-4-mwen@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW3PR06CA0014.namprd06.prod.outlook.com
 (2603:10b6:303:2a::19) To IA1PR12MB8495.namprd12.prod.outlook.com
 (2603:10b6:208:44d::9)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR12MB8495:EE_|MW4PR12MB5627:EE_
X-MS-Office365-Filtering-Correlation-Id: 875d7828-db64-45c0-e21f-08debad70381
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|7416014|921020|18002099003|56012099003|22082099003|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info:
	zFjl17v7V7uQxtrdcmCQh0/zw6EYFbGWX7mpVuCV6h9QRh4gBj2+fiCW5X7Uib2rJUaHCMF/tcO/Y03uAbOiH1bGdPnl+kYWHV9/wo8qnZDVuv2ORayV0lzuA0t4vE6quSnfvOWEwsDKzg6NOGHABTsu8bN+1qAQlrLxDk4Gpq/A0xmzM+H9i/C0dWqRcw26/39F0meTMvbaWQm1RXaZ6EMnGdoIlE94AmmHkGyJM6ytyahFJN9q68yttjorKsoFDHh+i8FSAUVscLx+sp7Tsp5lfu76R2RJBHOf75UYLs6EC3NNTxqx8j2ac0H3hWQ3QkQHeF91p9v0o8oeDitdBcHW233s3ZVwQ30Ldmlb4WD3ccJWqrOt5SHDgcABOIK4j7Q8Ze2BusOIgVOCoiqzkDlli+uf+mAyuE8A9KqSxR/iQzC/7LACm4FZ55EFCXoTydQpOkusf30BWGIIk/YUhjif32ms66yxm5wZCrw9SWUPEVJkRLEGK8jJRPmvq/PVkf6c5Md3gSQaFcbPFCm+rACjM6HJ+WDCADo8/o2ioT9QloeWszR9ZErUl3URrbvcjgOmOYTr1bphP41I2qolmaOmcncNudCSwTVoghcXWaoX3tJ6XYYQXzocXMPV9z6JbwUOqThabvYSpEkL07mwoiTZGTzNd3bZUEmTCuvmgl+XCvBs59Wb0bpMXJZe6GoW5JxB1oCprmw93RmPLs0xM31JEO1eGPiZr+eFZlOR/Yk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR12MB8495.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(921020)(18002099003)(56012099003)(22082099003)(11063799006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?c2hhV0NGdmlaMVp2ZWlYSkJyQ2dlNjYxVzBpdDIwenl6WSszUlJpcW9lNXk5?=
 =?utf-8?B?NCticEpMdGRJMkVSRzVmdkRDajh5WElrZXp1STRUL2I1YkkxekdXK01pTEhU?=
 =?utf-8?B?NEIwRzN2allxLzhwK0g0QWdyZXVtN1V3aGdsSXdJU0R4dUgwRFY3aGFsaEp2?=
 =?utf-8?B?aGJPR1UyMXdYK2YwR0ZjOFJXNUNLSnFhc05TT2ZNSmdMRHFRZTJPLy9RQTRG?=
 =?utf-8?B?OE56dDVhbzRoZ01ONVptSUMxdVJIdjIxSGlDNHlNdzJkb3U2VzR5NllLUnVM?=
 =?utf-8?B?TVo5UEhweTNwdVJIT1JxNVBrR3lmZmJ3VVVHNS9IMDNLVG9Ddk1hdUlmTTVZ?=
 =?utf-8?B?c3Nac0s0TlJTeGRkOHdNQlVNdWJLT3NvK2w2QTVvekRqWnpqMFM5amZ5RW9K?=
 =?utf-8?B?dStCL1NlbmQwdHpEWjloMWRQVUZ0WEt5cmw5OUhVYjFnUGo5MEhkYkR6cGY0?=
 =?utf-8?B?a21jRDZEdEcvQ0NBeWN4eUN5aDhKTXQ1TllGMXlMa3VUMkcxU2d4S3hhTEU3?=
 =?utf-8?B?bDMvY3Zid093VzZRRmlaa2MvRE1ZanBFQTd6MnpjTDVjU2RRMENpYWtEek5t?=
 =?utf-8?B?QmQ2eC9JMTlnTWN3V1kyUXFxYlF2Tzh5enBvNHkvRkVJb1VuRFgwbGc5ZS9l?=
 =?utf-8?B?QmZlNmlSc3BGZEs3Y0JFZkJpYTNnaWphRkRKclI2KzZxdkM4TFp0QXdITWxY?=
 =?utf-8?B?d1lCT0gwWlVaMUx3b3dpZGZ3aytpajUwZXdPM0RpbFQ4R1ZZSDVBblpTeVda?=
 =?utf-8?B?VXI0a1Mxbi9uNzg3TGl3UDBXSFVpOHVVaVdHcGNaY0FUYk9tMmhObkxRczhO?=
 =?utf-8?B?QzN3YkZMWXR6ckpEekxKSk8vK3lPM2NRKzV0ZlUzM1djMFVNb2R1VDBWUncv?=
 =?utf-8?B?ZmlqcHBvKzhCRngwWHFrNmhTOHV3dmpKWXB3UHlJbncwZHQ5SDRhZHZ4RFY5?=
 =?utf-8?B?dkZCRG1Tdm1Jam5jVFN2K1FLM2xqQUVVSFd3QmVWVU0wNTMyaS9yWkt0ZlB4?=
 =?utf-8?B?SGtMa0srRHRoVkVyNUExK2hVTzhHbFVIS3IyeXlUZmtvaHN0MGJLUTNJaE8v?=
 =?utf-8?B?Umh0RDNhSVEwYno4VEd3d0QwMndDT29ZV1k1YXdaTnJFSGRrWVRoUnhVM0J1?=
 =?utf-8?B?SkJGR3RpbzFyV0ZMQkR6R05LM2huRDR5a3NlVmVkNks1eFBkRE95UGJwdS9v?=
 =?utf-8?B?Y3EyN0w1ZVA2RCthVmdZSVJKdmdoa0xPdFlhc05tWkpZZllDcFg4QjhrVVRM?=
 =?utf-8?B?STdISDh1bk5id25iUGhCSHFYWVRyTExvK05pQkI2Vzl6L1M4L2VVVStjZ1NF?=
 =?utf-8?B?NjVaTzhrSWtidUFXSm9PcFNlalVOaTE2cjJ4dE0yc3pSTmZ6UmdGMkxQMHIy?=
 =?utf-8?B?c3AwQU1acnIrWEZudUd4RThwZUJTMnB5MGNmZDhlVFNNRkE5VUVnN3hSVXBS?=
 =?utf-8?B?UjlYYjJ5Zld1YkhjcmVGc1BKODBYb1BNOXBRQU9iZ1JQM2Z4cUpkL2R0Zlcz?=
 =?utf-8?B?QlNPTmR1bHRKb0FPa2ZOSGtPMjZpWUZ1Y0pFVlRWbmN2M3JuWWp0YnJQeVlG?=
 =?utf-8?B?VzExYUlJTWxFWllsa2hFTVkrTVFUUXF4UzNiZllNb0xVVE9PelE2aytGS3hW?=
 =?utf-8?B?MnNwOVN3RjFpT1lyMkJvaXI5WGJCL1QxaElKSXRLQkl4dU8zTmlsNlpkb1Mw?=
 =?utf-8?B?ZXlOaDdRdDNvMTAreEdYY0o4ZGdSUFhTUGlvUFdydHF1OTBoNkkxNjRubEk5?=
 =?utf-8?B?N2ZZY0tud2xMaGpjc1NKTWxZeTlieXpMMXZWcEdBZFRMbFpaSCtYMzZjZ1Bh?=
 =?utf-8?B?SVlsSnpveG4vZ1ZCRkxjb05ZN3RaTXZBT0xUQkpBUmJYUGdPdlFvUkdNMjVl?=
 =?utf-8?B?d0QwRk5TNkFWMjRZYlBvSmN5a3BMckIrTkJQN1JzcEJqQ2RaSFpCQzRETWY0?=
 =?utf-8?B?UGM3a3VuZEhwODVMakxwdUc5MnFVbEVFWkJoTnlxTmlneUZuZXdoWm9FaXVl?=
 =?utf-8?B?Wml2SFRjcUpIWVdkUlBQZTY3SlFnTUh3OXNJN1l4TGxOUjVTWFY1VktvbWFx?=
 =?utf-8?B?S2pGbDlqOTBNVDdpM0VsNjhzVnJsdFVWTnBseHd4U2RwcmMzdmp0V0orMi83?=
 =?utf-8?B?UjZTSUFDdEN6RGZCWUFMZWR3cU8rSTZHcTZUMzdVTStLWnNyM2NJbFVnRVpn?=
 =?utf-8?B?eVM0aEhPRGtIQnd1LzRUVVJhOVNFSHZabXVybDNxRUxtZnI1UWxRZG14Zkk3?=
 =?utf-8?B?WFpKYzMzdlVQbTlFUi9HMkYvaDd1cGpLODdCMmdCdEpURUxTT3NwcWFpeXhC?=
 =?utf-8?B?dTR4UmFiZEpUdWVzcWVXR0RKSnNGYlcwUkVjeFFqWDMvMHRNVFc3QT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 875d7828-db64-45c0-e21f-08debad70381
X-MS-Exchange-CrossTenant-AuthSource: IA1PR12MB8495.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2026 03:29:37.4048
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ThQbxLJOJd90JUK2Yw0NnunFs1iHQIHk16rqf0+QKwbjaz2N1mUO9XqiE3GcxiudKnyvz5JUuypXVGekQxopGQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB5627
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-109700-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[igalia.com,gmail.com,amd.com,linux.intel.com,kernel.org,ffwll.ch,suse.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[emersion.fr,intel.com,kde.org,collabora.com,bootlin.com,linux.dev,lists.freedesktop.org,igalia.com,oss.qualcomm.com,kernel.org,gmail.com,poorly.run,somainline.org,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[31];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,amd.com:email,amd.com:mid,amd.com:dkim]
X-Rspamd-Queue-Id: 30CAB5D055D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Reviewed-by: Alex Hung <alex.hung@amd.com>

On 5/25/26 03:50, Melissa Wen wrote:
> As we do for CRTC color mgmt properties, use color_mgmt_changed flag to
> track any value changes in the color pipeline of a given plane, so that
> drivers can update color blocks as soon as plane color pipeline or
> individual colorop values change. Since we're here, only announce and
> track changes to plane COLOR_PIPELINE prop if its value is actually
> changing.
> 
> Reviewed-by: Harry Wentland <harry.wentland@amd.com> #v1
> Reviewed-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
> Signed-off-by: Melissa Wen <mwen@igalia.com>
> 
> ---
> 
> v3: track lut(1/3)d_interpolation property updates (Chaitanya)
> v6: use `|= replaced` for consistency (Chaitanya)
> ---
>   drivers/gpu/drm/drm_atomic_uapi.c | 64 ++++++++++++++++++++++++-------
>   include/drm/drm_atomic_uapi.h     |  4 +-
>   2 files changed, 54 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
> index 78423905051e..e997917819e8 100644
> --- a/drivers/gpu/drm/drm_atomic_uapi.c
> +++ b/drivers/gpu/drm/drm_atomic_uapi.c
> @@ -265,13 +265,19 @@ EXPORT_SYMBOL(drm_atomic_set_fb_for_plane);
>    *
>    * Helper function to select the color pipeline on a plane by setting
>    * it to the first drm_colorop element of the pipeline.
> + *
> + * Return: true if plane color pipeline value changed, false otherwise.
>    */
> -void
> +bool
>   drm_atomic_set_colorop_for_plane(struct drm_plane_state *plane_state,
>   				 struct drm_colorop *colorop)
>   {
>   	struct drm_plane *plane = plane_state->plane;
>   
> +	/* Color pipeline didn't change */
> +	if (plane_state->color_pipeline == colorop)
> +		return false;
> +
>   	if (colorop)
>   		drm_dbg_atomic(plane->dev,
>   			       "Set [COLOROP:%d] for [PLANE:%d:%s] state %p\n",
> @@ -283,6 +289,8 @@ drm_atomic_set_colorop_for_plane(struct drm_plane_state *plane_state,
>   			       plane->base.id, plane->name, plane_state);
>   
>   	plane_state->color_pipeline = colorop;
> +
> +	return true;
>   }
>   EXPORT_SYMBOL(drm_atomic_set_colorop_for_plane);
>   
> @@ -604,7 +612,7 @@ static int drm_atomic_plane_set_property(struct drm_plane *plane,
>   		if (val && !colorop)
>   			return -EACCES;
>   
> -		drm_atomic_set_colorop_for_plane(state, colorop);
> +		state->color_mgmt_changed |= drm_atomic_set_colorop_for_plane(state, colorop);
>   	} else if (property == config->prop_fb_damage_clips) {
>   		ret = drm_property_replace_blob_from_id(dev,
>   					&state->fb_damage_clips,
> @@ -713,11 +721,11 @@ drm_atomic_plane_get_property(struct drm_plane *plane,
>   static int drm_atomic_color_set_data_property(struct drm_colorop *colorop,
>   					      struct drm_colorop_state *state,
>   					      struct drm_property *property,
> -					      uint64_t val)
> +					      uint64_t val,
> +					      bool *replaced)
>   {
>   	ssize_t elem_size = -1;
>   	ssize_t size = -1;
> -	bool replaced = false;
>   
>   	switch (colorop->type) {
>   	case DRM_COLOROP_1D_LUT:
> @@ -739,28 +747,45 @@ static int drm_atomic_color_set_data_property(struct drm_colorop *colorop,
>   						 &state->data,
>   						 val,
>   						 -1, size, elem_size,
> -						 &replaced);
> +						 replaced);
>   }
>   
>   static int drm_atomic_colorop_set_property(struct drm_colorop *colorop,
>   					   struct drm_colorop_state *state,
>   					   struct drm_file *file_priv,
>   					   struct drm_property *property,
> -					   uint64_t val)
> +					   uint64_t val,
> +					   bool *replaced)
>   {
>   	if (property == colorop->bypass_property) {
> -		state->bypass = val;
> +		if (state->bypass != val) {
> +			state->bypass = val;
> +			*replaced = true;
> +		}
>   	} else if (property == colorop->lut1d_interpolation_property) {
> -		state->lut1d_interpolation = val;
> +		if (state->lut1d_interpolation != val) {
> +			state->lut1d_interpolation = val;
> +			*replaced = true;
> +		}
>   	} else if (property == colorop->curve_1d_type_property) {
> -		state->curve_1d_type = val;
> +		if (state->curve_1d_type != val) {
> +			state->curve_1d_type = val;
> +			*replaced = true;
> +		}
>   	} else if (property == colorop->multiplier_property) {
> -		state->multiplier = val;
> +		if (state->multiplier != val) {
> +			state->multiplier = val;
> +			*replaced = true;
> +		}
>   	} else if (property == colorop->lut3d_interpolation_property) {
> -		state->lut3d_interpolation = val;
> +		if (state->lut3d_interpolation != val) {
> +			state->lut3d_interpolation = val;
> +			*replaced = true;
> +		}
>   	} else if (property == colorop->data_property) {
>   		return drm_atomic_color_set_data_property(colorop, state,
> -							  property, val);
> +							  property, val,
> +							  replaced);
>   	} else {
>   		drm_dbg_atomic(colorop->dev,
>   			       "[COLOROP:%d:%d] unknown property [PROP:%d:%s]\n",
> @@ -1275,8 +1300,10 @@ int drm_atomic_set_property(struct drm_atomic_commit *state,
>   		break;
>   	}
>   	case DRM_MODE_OBJECT_COLOROP: {
> +		struct drm_plane_state *plane_state;
>   		struct drm_colorop *colorop = obj_to_colorop(obj);
>   		struct drm_colorop_state *colorop_state;
> +		bool replaced = false;
>   
>   		colorop_state = drm_atomic_get_colorop_state(state, colorop);
>   		if (IS_ERR(colorop_state)) {
> @@ -1285,7 +1312,18 @@ int drm_atomic_set_property(struct drm_atomic_commit *state,
>   		}
>   
>   		ret = drm_atomic_colorop_set_property(colorop, colorop_state,
> -						      file_priv, prop, prop_value);
> +						      file_priv, prop, prop_value,
> +						      &replaced);
> +		if (ret || !replaced)
> +			break;
> +
> +		plane_state = drm_atomic_get_plane_state(state, colorop->plane);
> +		if (IS_ERR(plane_state)) {
> +			ret = PTR_ERR(plane_state);
> +			break;
> +		}
> +		plane_state->color_mgmt_changed |= replaced;
> +
>   		break;
>   	}
>   	default:
> diff --git a/include/drm/drm_atomic_uapi.h b/include/drm/drm_atomic_uapi.h
> index 436315523326..4e7e78f711e2 100644
> --- a/include/drm/drm_atomic_uapi.h
> +++ b/include/drm/drm_atomic_uapi.h
> @@ -29,6 +29,8 @@
>   #ifndef DRM_ATOMIC_UAPI_H_
>   #define DRM_ATOMIC_UAPI_H_
>   
> +#include <linux/types.h>
> +
>   struct drm_crtc_state;
>   struct drm_display_mode;
>   struct drm_property_blob;
> @@ -50,7 +52,7 @@ drm_atomic_set_crtc_for_plane(struct drm_plane_state *plane_state,
>   			      struct drm_crtc *crtc);
>   void drm_atomic_set_fb_for_plane(struct drm_plane_state *plane_state,
>   				 struct drm_framebuffer *fb);
> -void drm_atomic_set_colorop_for_plane(struct drm_plane_state *plane_state,
> +bool drm_atomic_set_colorop_for_plane(struct drm_plane_state *plane_state,
>   				      struct drm_colorop *colorop);
>   int __must_check
>   drm_atomic_set_crtc_for_connector(struct drm_connector_state *conn_state,


