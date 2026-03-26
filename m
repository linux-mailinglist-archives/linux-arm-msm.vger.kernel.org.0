Return-Path: <linux-arm-msm+bounces-99997-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kJjoDC+jxGle1wQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99997-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 04:08:31 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E2AA32E9E0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 04:08:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 254D330063A9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 03:08:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A495626E173;
	Thu, 26 Mar 2026 03:08:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="fzFdO6ZT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012000.outbound.protection.outlook.com [52.101.43.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D915B2E401
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2026 03:08:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.0
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774494504; cv=fail; b=lRzTMQ1XAoN5jqyehDmXB8DzJ3R941gjyi6x8XIt266ChrksCiwYDoXatwM0TBZwZ/OMat/aOnhusD01C2CwZH+0HPciqbzkd7ukutGNa2wiCzM5JvXI3RVl2pTGyBproRmrZAyZH2U+uuAvbH12Zn8RzrBMBqOeFGdycdoCah4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774494504; c=relaxed/simple;
	bh=oX/9WHX7XDH/HbFlHVHKxOVeZbImGYDQ/SrhRbYcu/E=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=XgTE3kNnBFTyB56vZQ0e1IFvyqh+72y5YoGro3hJo3wX635XK8OhWuCsFbBOYoCDa9qKHTWIxQYKxljexaaHrCRlMTrTxYU33++NkA1vjrQ8yfUwuqSp2onw9aLJ3lQ7+X9mM8v+jv0zKDK1laQfHHvmDLrZvX54BgFRD+rD2UM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=fzFdO6ZT; arc=fail smtp.client-ip=52.101.43.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wHr2W/ogOadgA+OLMfFws3t8f3xUVvNFcstXRoPLKDh5Q9if89b7cpEzcyt0OsdOz7DHStcIyYE2BXm3LICqdR1LigLdoEF2AEYOLW3CcfmDgIjJ/CrRae/cBKtEqDe9cCUMUGT1tVPW+O/oqggZqpD2TltkZ22BsuJsFEOOHMBMfpi8MWTT5jLysZ/mASgmc7TlOaNoyPyK14sXxmLi5M2gq9goC4MUOQ4KoyuWaFiQiGdBvuBsI+Y6qr9wuiLWQGjbFZysHe0c5y8glmuqhbY3wJ/hC147fJ6G9A3LWUXrv3222SIgLXSWED0MzHgppIlQu6FnPQSvRkSSfCAoyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h79C33LZKAMJ5MUVMTVY/TjeqVHc3CvuL8D95Tr9Rhw=;
 b=auKGc0hatMDZz+44FT1awyRWpzrW7AEJye7YgjNtkRLtNkpx2/RrDmnsRa8rZ75MPvHjYoK9BxKOOyda49jY7bOVamSV3BvOIyZYzbtB+KWTVElij32LTE8CtsFhIP+lzgy1PKUk0Tttc+3yGdK4POdHioNVoEOPiTApniq9dEbm3fKR3805Tm+qN78LoLiyHyYqsSCh8D2vmA2DjDZZBzxidOrn7D+kTMIJ4yFPWcxKWwvqXuW/nDc1aX8aQu13kKEPtLt5EgNOnekeIDb1lk6zbabl7tS9LWBonQnSgmgPFgb+u40fzVxwfUBYJ5tHd+Xi0tjUWqdLoPHCnk5Bgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h79C33LZKAMJ5MUVMTVY/TjeqVHc3CvuL8D95Tr9Rhw=;
 b=fzFdO6ZTuiiuHGV8+KqKM91sxfrmxVhJ1rrvMbG/DsyMGA71U8LA4Lq75o4GDXjab0Zf3gLHbTWo6ZSqNWCwjfY3JRVpxZMGkiX4FfcyrV01csFmOTzzvN5g1Ihqpd5v3dYVawCAreK458LbASeKpHne0RWQXOshK5oYFbsBsqc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB8476.namprd12.prod.outlook.com (2603:10b6:8:17e::15)
 by PH8PR12MB8431.namprd12.prod.outlook.com (2603:10b6:510:25a::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.7; Thu, 26 Mar
 2026 03:08:17 +0000
Received: from DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2d79:122f:c62b:1cd8]) by DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2d79:122f:c62b:1cd8%7]) with mapi id 15.20.9769.004; Thu, 26 Mar 2026
 03:08:16 +0000
Message-ID: <70d47573-a0cb-4f65-8838-1956f8a672fa@amd.com>
Date: Wed, 25 Mar 2026 21:08:13 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] drm/atomic: track individual colorop updates
To: Melissa Wen <mwen@igalia.com>,
 "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>,
 airlied@gmail.com, alexander.deucher@amd.com, christian.koenig@amd.com,
 harry.wentland@amd.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, simona@ffwll.ch, siqueira@igalia.com,
 sunpeng.li@amd.com, tzimmermann@suse.de
Cc: Simon Ser <contact@emersion.fr>, Uma Shankar <uma.shankar@intel.com>,
 Xaver Hugl <xaver.hugl@kde.org>, amd-gfx@lists.freedesktop.org,
 kernel-dev@igalia.com, Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar
 <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
References: <20260323131942.494217-1-mwen@igalia.com>
 <20260323131942.494217-2-mwen@igalia.com>
 <feea29b7-fb28-4ac1-be74-b42c52173c59@intel.com>
 <197d2909-8644-4380-b752-ffef6f300faa@igalia.com>
Content-Language: en-US
From: Alex Hung <alex.hung@amd.com>
In-Reply-To: <197d2909-8644-4380-b752-ffef6f300faa@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR03CA0331.namprd03.prod.outlook.com
 (2603:10b6:303:dc::6) To DM4PR12MB8476.namprd12.prod.outlook.com
 (2603:10b6:8:17e::15)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB8476:EE_|PH8PR12MB8431:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ee74c87-e0b1-4dc7-45b7-08de8ae4ece0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|7416014|921020|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	QsRRecYa5akgDa5g8nDlbAYOrV3keIkxFP1hIDKcTltUZbKNTCuow5W3V0KNjd8O5wAgiRWc5AEtOr7JK0cov5DDqcdzDKOjRGjltL5DRkgC9r9HwFkIALrlHovMne5JzEQadk1ai+4OM69HgfBPqDSlZWFWovpsHVHBYiXAgEiMGkwx6SqjTdB6+BWJdh7cD6THyJNihHvFSOSUVf2sWokVkBjbHmRBpPoExmQGUvoCkdIP8utgRnOdDGG6bLRt89/iS3k9sdqdv/z8ZEVM2jUc+RAqVV0d9YqAm7kMQ4jzCAkz/vu7xYPG8uwQVqpHIMYy6yXlZQOz3hZ96JseoC0mf6PIbgZJkssT38/yDM3pR8lSjqLcr56iDlhJ6iCI8VXsvkJyt1N36KquR6T39lArXCDoNKsznzxoVSUWIlRQdPceUOPxvidQMS3CTzqwevuEmtYpX3QIU5hB8DwGj8UWnbFFYMet5n/u6gsTqrdOXeWXEaeEyxu212ik519uGoBaFNPun/ldE6szPLbCoKw/OCTczTfBQf0pbCSFax9mU9uHrEkbOERUzRq/F6A7ZiU6v2WJ2MbYi2486ur4OrvNUdO9K2YS6R9wxq98RsYUcmrsomuB33YkpNxIkaJE0wy1mHWMyFixyQseqtQ+J5Hxc/v7CfpSTlLip1fvbog3ckNzmxsWRARQhhWzZQtITaVyJvuJydCBpHLH7QpcY8mq6A2LU40nNQORRteucsexouGpK/Hyip4PUbf8BsIVZVcctmmNbNgFi5t9zbym0g==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB8476.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7416014)(921020)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?V0dEcnpCbUJTRzN5VXR2NFFQNFI3UFNseVRrUlU4Y2dpQVA3TThab2Fhbk9T?=
 =?utf-8?B?clp1WXlKTWwyNDhKcW5BYlZWTm8wajFNWC9QN21hQ3hsRElEK0h1QUFEY2dz?=
 =?utf-8?B?ZE05MHluZlJkZ3hsUFlnVHVtbWNQRFhVL09iRUJXT2E5dzBWU1lUdUwzRlhV?=
 =?utf-8?B?OTB4Ny9UU0hLSWRiQy9mZFFudzZtdlZNOVhrNVpwMjdGTENBNlBKWDg4SEFt?=
 =?utf-8?B?L2IzQUF4ZFFhcjFwNWdCdlUrQ0kwVlBxdHRtbTFrQ0M0eWZJLzFEaGFxU3RK?=
 =?utf-8?B?QXk2TkJFM2tDaHhrSnJBZjFSRm9zalYxTC9PRTdycSs0Ni95OHViK0E1eVlI?=
 =?utf-8?B?b3BqSUZyZDVaWVFKbjFmS1Y2blFJZEpaYm8rQ0Q5TjZGc0F2VzhWVjVGbFEz?=
 =?utf-8?B?bm5DTnNESm8yeE5YeXhVa2RjbjczSUp0ZFR5Z24xQlJVNUtmL2lDYUF1enNH?=
 =?utf-8?B?b3pWT1ZUVGRST2ZEWU5NeGtvaEJVSVNwWXREYTdsWHZ6ODVsWGJxWXBmKzlj?=
 =?utf-8?B?MjlJYjFtVUlQZTJZeUc3M0R6Qlpsak9Wek83aVZqUmpMU1lXUzlKcTdwd2Ja?=
 =?utf-8?B?UTkzVkd5andVMjVLRWkweTVISmFtVEVtKzE1enVFNTBZZGpkeFJTVFFwdFBB?=
 =?utf-8?B?eUVka0h6dEZ4aFREb081b1FoWUJBUFpHdjFxVFpER1VBa1NCbitLdFNRZkhx?=
 =?utf-8?B?Sy93ZDZoY2R2VjkybHJUV3VsREtPdGJKT1ZmVHAzYzhwdVljNXZuR0FqUEdG?=
 =?utf-8?B?ZndDYUE0VDZnczZ4WWhtOUV5dUlsYjllb1ZzZEkzekMyV1h0SmIrSUJTUHRs?=
 =?utf-8?B?MmVQb1Q4MWNvdjN3OXdoT1JOVHdJakt1SGp4Y2dIVFZtY2Y2R0VQZmxLYmtC?=
 =?utf-8?B?OVprMVhjVW9vVXQzdk9TZ1oyYzIxNWpuc1IxVWpqVkt1Q29iaElsUkZMWUxx?=
 =?utf-8?B?M21LWEw5K1U2K203Zm11UnlueXVubExhbFcrdDUwRDRRMHZNR2ZlU2cvQlFu?=
 =?utf-8?B?UythQjM3ZnNReEJmdzhtZ2R3Szc4UG5NY0dKOVpTQ2s3TWJmanVEL01RWlBX?=
 =?utf-8?B?eFlCbkYybGxxbS9YOWNwR1ArK0dURCtPRytHK0RIejB1VFRiQkhyWURWcHBR?=
 =?utf-8?B?RzNqZDBNT0ZNVkFhcStsVlF2VmpIS05IQ0pOeVpUSlROVytBVVVOL2ltNjQy?=
 =?utf-8?B?VkoyeGV0MGdNWUhBNzB6Y2lXSW1EWm9Zc1kwMStreDd5eit4aUhkelNGb0dR?=
 =?utf-8?B?OVRmT0hFN2pwbmV0Q3ZLNFU1TERlVG4zYWRyWTJoTi96L1RNajBSUTlSS0xi?=
 =?utf-8?B?UEpwZ0tUbXFSQUN2SzJ2V0RQS2FMbzhISExrVnk2MTVHejZPdVkrYkNyR2Fz?=
 =?utf-8?B?eUc1dDVLMXBWcWJTOHF5Y1FEdms4SjNTSVpZcUNLSTdxdkNkek5OcXJpVXZy?=
 =?utf-8?B?SVU1TWRqeVlsZ3BKWTN6a05KcmMwNUM4Q3UvMTI2ckgzSTdONzhld2ZMUGkx?=
 =?utf-8?B?clpOdmtsOUJ5Q01Kc2xxSHpKUnpjWTFtanRPWW8xZitjbDMzcDRCb2tRQS9E?=
 =?utf-8?B?bzl0d2lHRXQxc1VtdkdZbUh6Y1pXREFMbU1DWXQwUDVKUnUxME5vZ3VSb0lW?=
 =?utf-8?B?eTZ4MFhTN2t3cXZrZkRvdVJsckN4TkhQOHVORGVHdDZiRjZJSURSNGUzR2Zx?=
 =?utf-8?B?bHBnUFA5Sm1rdkx1elNLZ2toRXU2VFVpN29lemI4UkdDS1V0QU96RUhJNXFI?=
 =?utf-8?B?RmhFK2tGYUNqdmdTZzdqZ1hlQjk4YXNBM2JBK2Jjb016eS9XK2lxcEp1ajBX?=
 =?utf-8?B?UU5GalRLOHJRMzFrTW9Fa25rSmNUN0hodHFmMDdkWjY5RUx0TGNlbmtxaXlB?=
 =?utf-8?B?UDZRQ2t0UkE3NEx1bm5VcUh2OW1UV0lQemlQQ1FrUEZaMzljZHNUZlZ5Z01Y?=
 =?utf-8?B?LzV2aFBKQytLTk84MWQ1VFJ4VXVyL1NMUU5NS0pCZGtFeWZjc1FzY20rbWZm?=
 =?utf-8?B?TDJ6Y0JReG1YMXhjOHRHcUpFbDZQa0JIVHQrVUw0RXBSeU0yV3VKWVFGNUZM?=
 =?utf-8?B?L25tUmtMRU1TcnZSYmFlQ0IyUlNDSGZ2RHFTUTB0QjB0UEtQelE0UStsS2xh?=
 =?utf-8?B?TnMyTTJjL2JIZG9kamlnQ0VBaVdRUVQwMGQ1ZnNiTnZzNU9sTE91eVc3UkpD?=
 =?utf-8?B?QmpLczI4TkJpazR5Vk03aHE5T1VJcUFldW5zUklDbXFQZWRHTWxGVXJ3Z1kw?=
 =?utf-8?B?Vjc0cll0d1ZOQmlrQm8vQVRpZ21FWmI1QkM4NGpsckVXQ01DN2x2QTBGL3Iy?=
 =?utf-8?B?S0I5MkdhdXhkbk45WFpSaURERHhrbC9RZE92VTVkbTNxbExydlE5QT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ee74c87-e0b1-4dc7-45b7-08de8ae4ece0
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8476.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2026 03:08:16.6645
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AjpONxzXWj/AUDOdf6AV9fGDn6o2WITiDM6vVUfFAz88SBNtFzBA5/oOb54oIheCRNl8PC0i7P7HiAki1GJ56w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB8431
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-99997-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[igalia.com,intel.com,gmail.com,amd.com,linux.intel.com,kernel.org,ffwll.ch,suse.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[emersion.fr,intel.com,kde.org,lists.freedesktop.org,igalia.com,oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[26];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[igalia.com:email,amd.com:dkim,amd.com:email,amd.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 7E2AA32E9E0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/25/26 20:13, Melissa Wen wrote:
> 
> 
> On 25/03/2026 06:08, Borah, Chaitanya Kumar wrote:
>> Hi Melissa,
>>
>> On 3/23/2026 6:45 PM, Melissa Wen wrote:
>>> As we do for CRTC color mgmt properties, use color_mgmt_changed flag to
>>> track any value changes in the color pipeline of a given plane, so that
>>> drivers can update color blocks as soon as plane color pipeline or
>>> individual colorop values change.
>>>
>>> Reviewed-by: Harry Wentland <harry.wentland@amd.com> #v1
>>> Signed-off-by: Melissa Wen <mwen@igalia.com>
>>> ---
>>>
>>>   v2: add linux types to provide bool for MSM driver (kernel bot)
>>> ---
>>>   drivers/gpu/drm/drm_atomic_uapi.c | 53 ++++++++++++++++++++++++-------
>>>   include/drm/drm_atomic_uapi.h     |  4 ++-
>>>   2 files changed, 45 insertions(+), 12 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/ 
>>> drm_atomic_uapi.c
>>> index 87de41fb4459..713fa9e81732 100644
>>> --- a/drivers/gpu/drm/drm_atomic_uapi.c
>>> +++ b/drivers/gpu/drm/drm_atomic_uapi.c
>>> @@ -265,13 +265,19 @@ EXPORT_SYMBOL(drm_atomic_set_fb_for_plane);
>>>    *
>>>    * Helper function to select the color pipeline on a plane by setting
>>>    * it to the first drm_colorop element of the pipeline.
>>> + *
>>> + * Return: true if plane color pipeline value changed, false otherwise.
>>>    */
>>> -void
>>> +bool
>>>   drm_atomic_set_colorop_for_plane(struct drm_plane_state *plane_state,
>>>                    struct drm_colorop *colorop)
>>>   {
>>>       struct drm_plane *plane = plane_state->plane;
>>>   +    /* Color pipeline didn't change */
>>> +    if (plane_state->color_pipeline == colorop)
>>> +        return false;
>>> +
>>>       if (colorop)
>>>           drm_dbg_atomic(plane->dev,
>>>                      "Set [COLOROP:%d] for [PLANE:%d:%s] state %p\n",
>>> @@ -283,6 +289,8 @@ drm_atomic_set_colorop_for_plane(struct 
>>> drm_plane_state *plane_state,
>>>                      plane->base.id, plane->name, plane_state);
>>>         plane_state->color_pipeline = colorop;
>>> +
>>> +    return true;
>>>   }
>>>   EXPORT_SYMBOL(drm_atomic_set_colorop_for_plane);
>>>   @@ -600,7 +608,7 @@ static int drm_atomic_plane_set_property(struct 
>>> drm_plane *plane,
>>>           if (val && !colorop)
>>>               return -EACCES;
>>>   -        drm_atomic_set_colorop_for_plane(state, colorop);
>>> +        state->color_mgmt_changed |= 
>>> drm_atomic_set_colorop_for_plane(state, colorop);
>>>       } else if (property == config->prop_fb_damage_clips) {
>>>           ret = drm_property_replace_blob_from_id(dev,
>>>                       &state->fb_damage_clips,
>>> @@ -709,11 +717,11 @@ drm_atomic_plane_get_property(struct drm_plane 
>>> *plane,
>>>   static int drm_atomic_color_set_data_property(struct drm_colorop 
>>> *colorop,
>>>                             struct drm_colorop_state *state,
>>>                             struct drm_property *property,
>>> -                          uint64_t val)
>>> +                          uint64_t val,
>>> +                          bool *replaced)
>>>   {
>>>       ssize_t elem_size = -1;
>>>       ssize_t size = -1;
>>> -    bool replaced = false;
>>>         switch (colorop->type) {
>>>       case DRM_COLOROP_1D_LUT:
>>> @@ -735,28 +743,39 @@ static int 
>>> drm_atomic_color_set_data_property(struct drm_colorop *colorop,
>>>                            &state->data,
>>>                            val,
>>>                            -1, size, elem_size,
>>> -                         &replaced);
>>> +                         replaced);
>>>   }
>>>     static int drm_atomic_colorop_set_property(struct drm_colorop 
>>> *colorop,
>>>                          struct drm_colorop_state *state,
>>>                          struct drm_file *file_priv,
>>>                          struct drm_property *property,
>>> -                       uint64_t val)
>>> +                       uint64_t val,
>>> +                       bool *replaced)
>>>   {
>>>       if (property == colorop->bypass_property) {
>>> -        state->bypass = val;
>>> +        if (state->bypass != val) {
>>> +            state->bypass = val;
>>> +            *replaced = true;
>>> +        }
>>>       } else if (property == colorop->lut1d_interpolation_property) {
>>>           colorop->lut1d_interpolation = val;
>>>       } else if (property == colorop->curve_1d_type_property) {
>>> -        state->curve_1d_type = val;
>>> +        if (state->curve_1d_type != val) {
>>> +            state->curve_1d_type = val;
>>> +            *replaced = true;
>>> +        }
>>>       } else if (property == colorop->multiplier_property) {
>>> -        state->multiplier = val;
>>> +        if (state->multiplier != val) {
>>> +            state->multiplier = val;
>>> +            *replaced = true;
>>> +        }
>>>       } else if (property == colorop->lut3d_interpolation_property) {
>>>           colorop->lut3d_interpolation = val;
>>
>> I think it would be prudent to add this logic for both the 1dlut and 
>> 3dlut interpolation properties. Even though they have just one value 
>> exposed right now, that might change in future.
> 
> I didn't include interpolations in the color_mgmt_changed logic because 
> there is a comment in `include/drm/drm_colorop.h` saying that they are 
> read-only.
> But thinking better about it, and I think we should not allow 
> `drm_atomic_colorop_set_property()` calls to change values of these 
> properties if they are read-only.
> I didn't track the discussions about what are the plans for these 
> properties, how the userspace knows they are read-only properties and 
> shouldn't set any value?

It has been a while but I don't remember that userspace needs to set 
this value, so this can be a mistake. Device driver just need to give a 
supported interpolation that best describes the hardware.

We can remove setting them in drm_atomic_colorop_set_property if 
everybody agrees.

> 
>>
>>>       } else if (property == colorop->data_property) {
>>>           return drm_atomic_color_set_data_property(colorop, state,
>>> -                              property, val);
>>> +                              property, val,
>>> +                              replaced);
>>>       } else {
>>>           drm_dbg_atomic(colorop->dev,
>>>                      "[COLOROP:%d:%d] unknown property [PROP:%d:%s]\n",
>>> @@ -1273,6 +1292,8 @@ int drm_atomic_set_property(struct 
>>> drm_atomic_state *state,
>>>       case DRM_MODE_OBJECT_COLOROP: {
>>>           struct drm_colorop *colorop = obj_to_colorop(obj);
>>>           struct drm_colorop_state *colorop_state;
>>> +        struct drm_plane_state *plane_state;
>>> +        bool replaced = false;
>>>             colorop_state = drm_atomic_get_colorop_state(state, 
>>> colorop);
>>>           if (IS_ERR(colorop_state)) {
>>> @@ -1281,7 +1302,17 @@ int drm_atomic_set_property(struct 
>>> drm_atomic_state *state,
>>>           }
>>>             ret = drm_atomic_colorop_set_property(colorop, 
>>> colorop_state,
>>> -                              file_priv, prop, prop_value);
>>> +                              file_priv, prop, prop_value,
>>> +                              &replaced);
>>> +        if (ret || !replaced)
>>> +            break;
>>> +
>>> +        plane_state = drm_atomic_get_plane_state(state, colorop- 
>>> >plane);
>>> +        if (IS_ERR(plane_state)) {
>>> +            ret = PTR_ERR(plane_state);
>>> +            break;
>>> +        }
>>> +        plane_state->color_mgmt_changed = true;
>>
>> I am not sure if it was the intention of the uapi design but as I 
>> understand there are no guardrails for setting a colorop in an 
>> "inactive" pipeline.
>>
>> So, color_mgmt_changed  is set to true even if a colorop from a color 
>> pipeline that is not currently selected(or set to Bypass) by the user- 
>> space is changed.
>> I guess, the driver needs to be intelligent enough to ignore those 
>> colorop but should we reject it at drm core?
>>
> 
> Thanks for pointing it out, makes sense!
> I agree that drm core should reject changes in inactive pipelines.
> 
> Melissa
> 
> 
>> ==
>> Chaitanya
>>
>>>           break;
>>>       }
>>>       default:
>>> diff --git a/include/drm/drm_atomic_uapi.h b/include/drm/ 
>>> drm_atomic_uapi.h
>>> index 436315523326..4e7e78f711e2 100644
>>> --- a/include/drm/drm_atomic_uapi.h
>>> +++ b/include/drm/drm_atomic_uapi.h
>>> @@ -29,6 +29,8 @@
>>>   #ifndef DRM_ATOMIC_UAPI_H_
>>>   #define DRM_ATOMIC_UAPI_H_
>>>   +#include <linux/types.h>
>>> +
>>>   struct drm_crtc_state;
>>>   struct drm_display_mode;
>>>   struct drm_property_blob;
>>> @@ -50,7 +52,7 @@ drm_atomic_set_crtc_for_plane(struct 
>>> drm_plane_state *plane_state,
>>>                     struct drm_crtc *crtc);
>>>   void drm_atomic_set_fb_for_plane(struct drm_plane_state *plane_state,
>>>                    struct drm_framebuffer *fb);
>>> -void drm_atomic_set_colorop_for_plane(struct drm_plane_state 
>>> *plane_state,
>>> +bool drm_atomic_set_colorop_for_plane(struct drm_plane_state 
>>> *plane_state,
>>>                         struct drm_colorop *colorop);
>>>   int __must_check
>>>   drm_atomic_set_crtc_for_connector(struct drm_connector_state 
>>> *conn_state,
>>
> 


