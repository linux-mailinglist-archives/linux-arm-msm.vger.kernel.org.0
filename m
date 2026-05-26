Return-Path: <linux-arm-msm+bounces-109701-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ACJwHcMTFWomSgcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109701-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 05:30:11 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id ED9B95D0587
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 05:30:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A5B06300A8D3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 03:30:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64F883B6C08;
	Tue, 26 May 2026 03:30:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="w9rirrLF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011016.outbound.protection.outlook.com [52.101.62.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01A033B6BFF
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 03:30:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779766209; cv=fail; b=pAtJdG0bmIj808NWzrIua6cHYz4GiE0mbfY0IVOH5BImwFOzrJ4Zz0SRHm/pKIUBHlE+z7a/n+zeF1Tj7rI/Rvcz72Y2LPQMMY2TsssFuI/5xGw5q0BfyXYR6ZZVge0qgNCpN1Dk4QnzSWg8D3P8mni/H26vHqL8D9C0MaabH7E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779766209; c=relaxed/simple;
	bh=nla6xwmjXQ9mUQkjy3sBH5lwpfHj3tFTgfyZWNdbK8Q=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=nxYmMuUl6oYQFxDyzWBdyNI/y74PF23v4viknFPf9BlelgOx4UrqgmnkAIhyLdrqwCe7vN00yoaM2czyuN0rGv473qZ4mO/2sX96DHYoFBhVuycptfW12Ko/cisd5zBXsGJW8Mxy5GzuiAj1fiBSmwTK3BH0m6cLG6l10zIDrYs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=w9rirrLF; arc=fail smtp.client-ip=52.101.62.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Uy5LTQPxGlidRO6JadciM5uH2ZCbtjwrHJ8YjljfA3XqITIJkzSomiuHUV3f75S8m3SfjGNy+rPf9AFy0bnTT4zqlt+ZAGj8Ir80V90hWoiekKHxQw3xqKYunIfzRsroQw23+P0y0Rx01gARl8LMxrucr2DLeHo/v9nqieWa2i/UKVP4DgdhFlkiYWIX5IU2UHgNwuZF5eQ5Xd/vhfKZ2m1fedmW+4ghUq82YlTXwb9ON4gI71MbACdk//KN5dJIQeP1YY6F6nvJguq2lP+TMHeNYsiwdg8lMNmhBpuAeVWbild0uzcjrPoltgJLcW+hnMJHW31p7tXro5jM0zJu4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f6z/7aLzUxPTTgMjKpwWthZ9plHmi78dI4hbgsN0o/A=;
 b=feRM+MWBPup1F20VvsRu0owqI8Ebs2rGaDvaCSWe6fIB2G2gGtapjrDlxQCJBjdXOjCY2nx9X2sD6SUA1FI6GOfHOi8sR1qAYyVkRzrH/imd8J5MglkOmlVrmiyda2+IQwqJ1SRGjptJuqeJE3/249S6g3ENxcMpzd0mXez9iJI+lOZrub+HGW6n5afOkNEgK3nm3L5epytVts0aYXkBY0HRT7X0d3BjEZvSdKJV/DUtPXEiKEUk4gr2jPuUAkC4g5rRouwqJRql5kmqtSwFNgW61bDBUF4eLPNrya5SkX4Gy4r0jKU+hjQMk+fFwAYXa0MsrvjSpHn6DuYlW7n5Ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f6z/7aLzUxPTTgMjKpwWthZ9plHmi78dI4hbgsN0o/A=;
 b=w9rirrLFk6FyrsrmzkL8RYuY6J9AP4Ibjerzc2DEonNlaJ70zaB4+S6DZDJEFHbYg413VlzNJF40nFRkWP/e834f321Dgb14LW27H7B33kPP/gIfVpgKO3kGG/X1lYn8ozcSpEp90w0i6fpEbm6Rh87MYMERJUYg0gAuznocVNQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from IA1PR12MB8495.namprd12.prod.outlook.com (2603:10b6:208:44d::9)
 by MW4PR12MB5627.namprd12.prod.outlook.com (2603:10b6:303:16a::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.11; Tue, 26 May
 2026 03:30:04 +0000
Received: from IA1PR12MB8495.namprd12.prod.outlook.com
 ([fe80::bfce:c745:c822:204f]) by IA1PR12MB8495.namprd12.prod.outlook.com
 ([fe80::bfce:c745:c822:204f%5]) with mapi id 15.21.0048.019; Tue, 26 May 2026
 03:30:04 +0000
Message-ID: <85aad1b1-3ac8-464a-ab5a-69c92a491925@amd.com>
Date: Mon, 25 May 2026 21:29:59 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 4/4] drm/amd/display: use plane color_mgmt_changed to
 track colorop changes
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
 <20260525100524.304263-5-mwen@igalia.com>
Content-Language: en-US
From: Alex Hung <alex.hung@amd.com>
In-Reply-To: <20260525100524.304263-5-mwen@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR02CA0004.namprd02.prod.outlook.com
 (2603:10b6:303:16d::19) To IA1PR12MB8495.namprd12.prod.outlook.com
 (2603:10b6:208:44d::9)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR12MB8495:EE_|MW4PR12MB5627:EE_
X-MS-Office365-Filtering-Correlation-Id: 372bdfee-faaf-4487-c400-08debad713c1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|7416014|921020|18002099003|56012099003|22082099003|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info:
	LUPPIpaKZ0Zp1X1UZrUf6jkrw9xpOmpOqRdhUezUCDwgvrvZq6vhOeH90WjqEt6SAJsNHFMEeWIvIlhge8HwT55jQeNNocJqzQg7k+5FKJLUdOD42XEzEyws6UWn3M7nnGhEZvQwMb329XwUC0rpwy50Tw2AhQ4olRtr3h6V3f9VXleNzRkNtqDWL2e8Hradg41u4inVcZp0Kb6iQEpx+a6GDQh0kZb30QViYjsUce9c076Pjwe4sslqHIcy2R88k8uxhN3z/919vSUJSywybFTwVdRkETrYoWxtfA7Rn3EbtX8tVouVO1sPdKiWKsqRbL3GGShROnruJ7eBsKikaVezsBFBiwQ13NuGg3nWz239n4NuKT4320rsmPNp3GVf3yX+cxbnrmSTNPnobuOBuQssCx9WzSET3eQLfIm8PdG43FUxLamrl7kh31fMyIpD3T/7njoy0PWJyXpdzChbhCF6WdKa4u2Il6je1E3bD1+1SBIPtZyJA91fIgPHv+wtvma9BVOwdqj7D6W8yltWFnQK2G+UyoiaUPvllQ4MNbaDdb7rZoRc3Xkoq1woSe0fEzjn9A7GEf1QqmrREMHJ6T17ejJlZ+vW3mwCo6WcLv52hFQrNOveS7OhqmjHon5LeOZIqniE5ecOBcu9dCjGoj1+tpw9krOnWp45bLP17qjPEVAwvCpGz5sxhUuimFu8/OQGhiFCALRurZlC+V2xOPpFvWVKhuzcDCMXSfcXaP4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR12MB8495.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(921020)(18002099003)(56012099003)(22082099003)(11063799006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WGdSQkNYRHNuSzV5OXVFK3paVUsybWN3WitCQXdOc2tMcUpBNURZZGozTjVp?=
 =?utf-8?B?Q2MrM1duTkhyRHJyRlJwOFhQYUZoNnk5RWVhNzJ4bzBsbkgxWFo3Ujd4TTNh?=
 =?utf-8?B?NXQvSzZOeFphODhXM3NscnlLNmpvYWZqNnVIdjVic1hwMm9WeHJQT0l1TGtp?=
 =?utf-8?B?QllrTHVhSTNqNlhHNlErN05KL3BlQlgvdHhTZUZHTDhhNDlxckVuaUo1WWI2?=
 =?utf-8?B?YU05WCtQRlVpSWk4cFp3SEphaXMxMURHQkV1c2U0a1ExbnR6Ny8rdHdVaDUr?=
 =?utf-8?B?VWFnbUNVWlN1ZHJKU1R4UGJFZEJWNVozR3g3V0dHNDV4Qnd5aVEvSEVKeXVS?=
 =?utf-8?B?UXZya0dGZG1vRGpsbkhObFlueHdRaGJYQlh3NEkraVhqYTZKRDJzVmVoeEhq?=
 =?utf-8?B?Mk1CUFJCYWdJanRkcVFndXNoZmdBK1VOd01nMTBNUjNkT1ZiaWFNZGtuZzNR?=
 =?utf-8?B?dFRnQTcxSmgrcTlKdzkzbUJ1NFVVamdLSHE5cFh2KzY3eERlR1ZJRHhEanRx?=
 =?utf-8?B?azR2bE8xU1BqVEVnWFpqU3M5Y1dEbEhJKzkrdURoS2Z0UG9KY3Fma29ydEw4?=
 =?utf-8?B?THQrZWo3bVBJMUhxVTl0dHhJQXZOOVY2bUdrZmJWM1VmSzMxcHBuSlRwdkZ0?=
 =?utf-8?B?TmN2bENPUnhTNjV3dVkweWtBdXNsb3FBZ2tQcFRWZWh3cUVXQUJOdU5qOFVv?=
 =?utf-8?B?ZzZsM29oeVBTRG1JNC9tTWl6U2w4Y3NuQlV2MWp2aHRHT2JEK1lKbzZUbU40?=
 =?utf-8?B?RWtTMndVSkF6OXpBa3EyVkJrTmxTYTQyZUdTcXFsZFN5Z1h0STg1eUFjN3dH?=
 =?utf-8?B?LzQ2T0hxdVI1UGlybmhCZzVrYTczbGZwZm5LN0Y1bGkzR3haeVdjZGlHMVRL?=
 =?utf-8?B?WUNIYjBEeWJuNFdmTmRPZjhhYWx0TUxSRHJUZ09pZHVrVFJ0Z3pBUFhsbHI4?=
 =?utf-8?B?bklrVzltQW8wZW1lN3h4SjBjZlQ2WmFIcXNsVXdRUEJlT0RzWUxlbTN4NzBS?=
 =?utf-8?B?eis3bXRobkFLV2FMUWxNaTlqVVlrWC9HTUtaNkFKOE9NL0duamx5NW9YYjRY?=
 =?utf-8?B?MXRWanFmQlVNYkttNG40VEYxclBvelc5Y3A0d0xNT3doNUczSjVLMVFubklv?=
 =?utf-8?B?RytkTzdYVENXeEIrNjF1ekNQbUpGbW1yMTFjMXcyMGg4dExqVlgxYTIxbk91?=
 =?utf-8?B?cGtDZDRsdzhGc3N5UVFScUFzMXZ4QUJ2M21Jc0srOGQxSVU1UUllbkZaNy9F?=
 =?utf-8?B?ekRXQi9lMlBXOElYd1U4eHVCM0R2cllTVnEyM05aNFdQbHlZVDJFdHFXRmtJ?=
 =?utf-8?B?K3NIZ0NhMzFwbVNOYSsyN1NndjN6VjFvYUJUeCs3cE1sdmZsRm15czZmUjVr?=
 =?utf-8?B?UEJaNmNERUZoL0tyTSs5WFVGQW1oYXRUMlAzaE9ybmJwamk5QmhtSFFsVUhp?=
 =?utf-8?B?bmxUTjkwRTJYM3NSTFRzaWhYRVVqOFBwQmdGLzFVbkx5OTRJSnYvR1VEc2gr?=
 =?utf-8?B?NkhDZmhia3BmRUVrOFluRWpuOEFYdnNFeDBxLzZXWE41bjZkaUVkcSs5YXJI?=
 =?utf-8?B?RjVyRno5ejkydCtCYUxoUDBvNUlWdjEwMWhIRE41Z3p5Sm84aVlCZmJCbEFJ?=
 =?utf-8?B?VFVMRmxvWkZMK25GcFRRQXpKZXAzeTFxSVh1angzVjNNeHhjOTlRNnpqLy9I?=
 =?utf-8?B?NlRwcnNxTE1XWUgxY1pGSHZIaWtUdG81QVgrRlJjSnpoV0srZlY1aElVWFRi?=
 =?utf-8?B?QWdSRFduOGxDMHIzellCZFZXQUMrVDkyNWphNE9sQUN0eHVWK3hkc08vOTRw?=
 =?utf-8?B?NlpLT25iK0QrWmcyUVhZd21td3N4bE9GZk1EU1RRdUZyZkkwcXc1MkQ2QktQ?=
 =?utf-8?B?dzcrMi9zd1dNWGd2OFhYd1lLcEphYkVFVHV3L2xIMDh6MjVwZndZUTE1TDRq?=
 =?utf-8?B?VUQzZElXcEMrc3FMbE1sWFNhVnRpTXZEb3hqM0Q4ZmJIOHdZL2R5VklyeXpq?=
 =?utf-8?B?OGQxNjRmK1BTclpHVHd1VFFpTEt1RjdNck5KZzNCb05ibzJTcGpoREFxQzdz?=
 =?utf-8?B?aSt2UU4vMG5lL1dDSnN2Z29jTGM0S2M1bWUzdnB6TStud3V6VURaMitXdmJP?=
 =?utf-8?B?UFU5N2JRTEhyclAyU2M3dEE3WTE3RC8vUFVwYVExTCtxcENEc0VPajNrY0Zy?=
 =?utf-8?B?NDZzZWxLcE94dFpSQmJtZm92Z3dVSVJRZmJqQXg1cnQ5OGxDV0t4ek9KS3Ns?=
 =?utf-8?B?M0NyK0NESFBpSC9KZUpDSmRKbWNQQlc4a2Qza2lYQzF0V0RmSzJJOXFXekRE?=
 =?utf-8?Q?GB/mUCmhkadJGDQ7yg?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 372bdfee-faaf-4487-c400-08debad713c1
X-MS-Exchange-CrossTenant-AuthSource: IA1PR12MB8495.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2026 03:30:04.7073
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BeKZSSHwJvvC8wFeXgYO3vxRCtk5Mj4YGk8RhhibQ5J+kRf+/2fHBoPXRKL2Vlp1alxdkeINX6G6TiG3WGRMCg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB5627
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-109701-lists,linux-arm-msm=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,amd.com:email,amd.com:mid,amd.com:dkim,igalia.com:email]
X-Rspamd-Queue-Id: ED9B95D0587
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Reviewed-by: Alex Hung <alex.hung@amd.com>

On 5/25/26 03:50, Melissa Wen wrote:
> Ensure the driver tracks changes in any colorop property of a plane
> color pipeline by using the same mechanism of CRTC color management and
> update plane color blocks when any colorop property changes. It fixes an
> issue observed on gamescope settings for night mode which is done via
> shaper/3D-LUT updates.
> 
> Reviewed-by: Harry Wentland <harry.wentland@amd.com>
> Signed-off-by: Melissa Wen <mwen@igalia.com>
> ---
>   drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index d590f0df6abd..36425d9c2a67 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -10198,7 +10198,7 @@ static void amdgpu_dm_commit_planes(struct drm_atomic_commit *state,
>   			continue;
>   
>   		bundle->surface_updates[planes_count].surface = dc_plane;
> -		if (new_pcrtc_state->color_mgmt_changed) {
> +		if (new_pcrtc_state->color_mgmt_changed || new_plane_state->color_mgmt_changed) {
>   			bundle->surface_updates[planes_count].gamma = &dc_plane->gamma_correction;
>   			bundle->surface_updates[planes_count].in_transfer_func = &dc_plane->in_transfer_func;
>   			bundle->surface_updates[planes_count].gamut_remap_matrix = &dc_plane->gamut_remap_matrix;
> @@ -12024,6 +12024,10 @@ static bool should_reset_plane(struct drm_atomic_commit *state,
>   	if (new_crtc_state->color_mgmt_changed)
>   		return true;
>   
> +	/* Plane color pipeline or its colorop changes. */
> +	if (new_plane_state->color_mgmt_changed)
> +		return true;
> +
>   	/*
>   	 * On zpos change, planes need to be reordered by removing and re-adding
>   	 * them one by one to the dc state, in order of descending zpos.


