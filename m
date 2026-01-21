Return-Path: <linux-arm-msm+bounces-89988-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yA5TCJWwcGmKZAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-89988-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 11:55:17 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 901015592C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 11:55:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 5975D8E8CA5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 10:35:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B18F3559E5;
	Wed, 21 Jan 2026 10:35:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=westermo.com header.i=@westermo.com header.b="aH4KAL+P";
	dkim=pass (1024-bit key) header.d=beijerelectronicsab.onmicrosoft.com header.i=@beijerelectronicsab.onmicrosoft.com header.b="x1p1vnlo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx07-0057a101.pphosted.com (mx07-0057a101.pphosted.com [205.220.184.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92F273B8D56;
	Wed, 21 Jan 2026 10:35:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.184.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768991711; cv=fail; b=RiiqUwLXCRcKSO9xELkyi/2SsV2b9820H8/TFqLV+jcD8oIx79t8zmfWeopgT0UPU9K59xEt8gl/GJexNTDGp+Roc+Z7vTV5gH3gZhb1GZs6q7wUEN+DBeWuz0LtsPpYyFwcpUMrrqnErQEWtWtnxya2EO0UoGJDuM1fFAy0+58=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768991711; c=relaxed/simple;
	bh=2qWNyXmnJlI+u/uA1SUCTK+ERt+wjlax0gLhCQ1sLNQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=SjqO++NAW3Q8cfRi52SXTbNMbv3sjF7JetnVkCh+ZtisgSGWEkrLFWeR0YHTrGM++d8cPlo2uwGB+5gWI2PYQobp/HQPaaxQ1PBwVrBe0Tc8+TkJ5eFsrZ0msBi11UjhQ47Q4YmwaiuwSk8OFLigOqVCru71GLHn5FGD3rKeAds=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=westermo.com; spf=pass smtp.mailfrom=westermo.com; dkim=pass (2048-bit key) header.d=westermo.com header.i=@westermo.com header.b=aH4KAL+P; dkim=pass (1024-bit key) header.d=beijerelectronicsab.onmicrosoft.com header.i=@beijerelectronicsab.onmicrosoft.com header.b=x1p1vnlo; arc=fail smtp.client-ip=205.220.184.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=westermo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=westermo.com
Received: from pps.filterd (m0214197.ppops.net [127.0.0.1])
	by mx07-0057a101.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60L5R8gG1383143;
	Wed, 21 Jan 2026 11:34:56 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=westermo.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=270620241; bh=
	HPaMgEW9/AjLISUsB0RV3zSswtTnADAjM+bjQy4MqAg=; b=aH4KAL+PciKfwA2K
	J28UimAg5rp9JlH6n0varq/vZVpmiyYBktFEKU8oxWnhcyoy4YI6jfKJ/azljdG+
	/HYdbnshzN9LBS70eS7O6Kk2TarDM6pYQAAI+6TXveCH/fHizjgJjp+ZwhjQAf1Y
	gEbsH/+yPWw43jYMzksSh7J+Hg0i5e7tyWeyDynsclPXhtQEp9hI+ccLanBTan8F
	7jXVjhE/vBmtsT9VICM1C9aMMB6egu4CKp/0WuhcdWkQguss/kEul7p+FTcK9I/o
	wbEn9J1akfOFgw4JO69X/mJ81IT7W0U+rcLcbuEePiHOrBKW3H8LJ/xCY0tKql1X
	zyICbg==
Received: from osppr02cu001.outbound.protection.outlook.com (mail-norwayeastazon11023080.outbound.protection.outlook.com [40.107.159.80])
	by mx07-0057a101.pphosted.com (PPS) with ESMTPS id 4btn6ggcc9-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 21 Jan 2026 11:34:56 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wzuXxd/6K4Q4glHcCh5reM6fWt+DIeAQcqZivMx2N0aPspkLNPNtBl5JZvxQuognCWqH6XbJSHjc3R/fbDNGMEJwlYAp6IzxJ1wu3qPPZpB/R0mPihRkLHVPPNrRkei/Gh0EyMNzSrC/F8BIJhxnfaBhXaj6nf+KdohzMqTt+3FoFn0Y9XQ16GOWh8t09iNJIecbs7KiUKqmalrdpKv63bI486OLBTo5BL6frrFo8IZtBJcsB/RlmcW8pkrFfKwUsDauDd4pulgkWG4tA/duXcp/ymRx+HT0Sf2Mba4fdiZzqrPW9+wCs9fVpzJfkO6NztVFNnaIA0LWpR4mE6CXMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HPaMgEW9/AjLISUsB0RV3zSswtTnADAjM+bjQy4MqAg=;
 b=gTDZ7q3ABX2SRTPbvQ97uqL395t4QXJIwfuoZitFxmUkC4o+Mf0aYnM6SUvqLJRCcbj2fGD+J8o8a8K5WfUUyv84KHbmD4xFYX5GhAdcHparVy6wk5Bve5oU7D25tindWFLsF8WmrltMbCFE1rXQbPumxq1iwZLmztuSw0fvXIOi+yqk1QHCCsRttX70i3tdABvLBwuQatvD/6l7HcQIY2kZg4e1n50EUVmgxU3Om9CDF1u3O0dIA14kBh8um+v59dUcceJnnx16v2+lbua0TUctOwQKJgtpEMfOpO6v41NfOU7lHGdUJEHUDdUFvOh8VU4GI2bARYvGcEaoxoTOig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=westermo.com; dmarc=pass action=none header.from=westermo.com;
 dkim=pass header.d=westermo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=beijerelectronicsab.onmicrosoft.com;
 s=selector1-beijerelectronicsab-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HPaMgEW9/AjLISUsB0RV3zSswtTnADAjM+bjQy4MqAg=;
 b=x1p1vnlowbwR/28ychwfY1UfrrP3uy+SaiDwXb3WLJjRt2LVn3PwGlAiipTpOYmfarZJWeQvX5ClojXHf9U/5ztcX/fiAzcld03WOxcKFJJ7SZtk+mzd6JrweaSNI74sWHznXiA4q2zx3SiGsLUMHBqm6z2ShAW/T7zwa3I9FAM=
Received: from FRWP192MB2997.EURP192.PROD.OUTLOOK.COM (2603:10a6:d10:17c::10)
 by VI2P192MB3242.EURP192.PROD.OUTLOOK.COM (2603:10a6:800:2df::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Wed, 21 Jan
 2026 10:34:52 +0000
Received: from FRWP192MB2997.EURP192.PROD.OUTLOOK.COM
 ([fe80::8e66:c97e:57a6:c2b0]) by FRWP192MB2997.EURP192.PROD.OUTLOOK.COM
 ([fe80::8e66:c97e:57a6:c2b0%5]) with mapi id 15.20.9499.005; Wed, 21 Jan 2026
 10:34:52 +0000
Date: Wed, 21 Jan 2026 11:34:45 +0100
From: Alexander Wilhelm <alexander.wilhelm@westermo.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: David Heidelberg <david@ixit.cz>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 0/3] soc: qcom: extend interface for big endian support
Message-ID: <aXCrxXvHCUhvhONe@FUE-ALEWI-WINX>
References: <20251119104008.3505152-1-alexander.wilhelm@westermo.com>
 <dfb72933-938f-43f2-87f3-2e3ab9697125@ixit.cz>
 <aXCXSt6_aTmoCnsh@FUE-ALEWI-WINX>
 <sc57szhtetjs5b2xbudbib2dkaspek6eohviy5ab4po66e3oz4@zhlfb2c4avc3>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <sc57szhtetjs5b2xbudbib2dkaspek6eohviy5ab4po66e3oz4@zhlfb2c4avc3>
User-Agent: Mutt/2.2.12 (2023-09-09)
X-ClientProxiedBy: GVYP280CA0031.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:f9::9) To FRWP192MB2997.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:d10:17c::10)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: FRWP192MB2997:EE_|VI2P192MB3242:EE_
X-MS-Office365-Filtering-Correlation-Id: 38106c75-00be-4969-8c01-08de58d8b632
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aVp4ZjQwS0sxdHVMNFkzUWwxQUhqai9mOFE0OXByaUpKc3ZINitud1M5ZDM2?=
 =?utf-8?B?T0g2VTl1VE90ZHJXZGtnUnd1MzJ1bEJQQko3T3dCWTAzaFBCUS9nU2VEWjFh?=
 =?utf-8?B?YWJnUVN3bW9XVSs4RjZyY0poMGViREttUEV2Y2dxczRmNW1mVkNnaXNLQ0JG?=
 =?utf-8?B?eVBaWTh6OUdoNjJvbmt3Z2ZvZnJObzlGdEROSm50U2MrK0YrbEZFSW1KeFZo?=
 =?utf-8?B?eWNnaHhzR0ZCU282T00vU3hSd1lVOER6amlNSGNqNlZ3UGoxWDh5emcyNm83?=
 =?utf-8?B?UFpkd3FBdHNYUjd4ZElvY0hDQmNmQm53cFdLVlFoL2tmWEVWUTMxNXVjdmxv?=
 =?utf-8?B?bXdmVGhUTFFnYzlNY1ljSUJWS3phQjF4a05OZm94S1l5MDdCVFJ2a2QxLzF1?=
 =?utf-8?B?SDFqakhNaGQvcjBGUGxnVXdkWm1MakRIVlVweVBXNHVOUlcvcHFSSks2UHZm?=
 =?utf-8?B?NHdWVXFBcVJ6eW5FQzc3d0VEblZ5dnpieU5ScGRsRHlXMGdDTjhabm5Fb1l1?=
 =?utf-8?B?ZWl6V2Jkd1Bnd1A2YVlIQ3VSZVlZbEFUbFlmRFoybEluM09SSGh6dFdlUC9F?=
 =?utf-8?B?RXFTYThlY29aMVg4N05YS21VbXZvRkZNd1Q4WUViYTJuSFFsZHkvK1F4ZnNK?=
 =?utf-8?B?aFJmLytReVB3amxWZFNDdWFuTjNhSHU4a3BhMk9MdWpIOEkxc0t4YW1hajIx?=
 =?utf-8?B?bVJ1MEVYZjdERVUvVjE3VEU3TkdaVU92RU4zWDl2cEZsOTZFTWNzUllWdVZs?=
 =?utf-8?B?THJqaUVSamtkWHE2NHkzdFRYbktOZXV5QndQaDVGM0ZnckFCTHBxa3cyenh0?=
 =?utf-8?B?eEd5RjRBZDU4eHFxaGJLWDgrUG5SVnQyRDJ4VnVvSS9KeDRSd3BKZlZrQXdm?=
 =?utf-8?B?dGxpeWxZY3JOTXB6N01BSlpDVXRxdWRyRGxrVkF3TTU2UWtYckc2YkRIcTlH?=
 =?utf-8?B?TTErRXZ6bENlMDM2TzBVbFhsK3NZcVFDNVMxd1JPT1lHUXlkbGM4R2lhL1Zq?=
 =?utf-8?B?VUhGb210NFdBSGcwOFA3elBXTTNqU24rc2E2NS81NEE0UFpYUE9OV3NYdENm?=
 =?utf-8?B?WGZTVXNlRTRJMDJmSk1hZDFWMjRGREpzQ0owUFVXUUd0Ky9aeEt3NWo1SHZz?=
 =?utf-8?B?dlRsNFVCcnIzamtsdWt2WXM1WkdWSGdSb3ptSHJYYmlWNVdRbXBCazdsczlK?=
 =?utf-8?B?SVNwZU9iU3A2cW16UStvZmUySW9MTVRzRk83SisrTys2dVVtaWwzcUlFMVFs?=
 =?utf-8?B?QkVrRGNLc0R2RTd4VW00STBaVjRiT3FXUHYxa2w5TTRNRnFiZnJKaWRqK2xE?=
 =?utf-8?B?aEtxMnhLcVNiVHdYWmJYakdsdjZKRGdVcjVjbHZ1VmxKcnNrdDE4SVlhTGhV?=
 =?utf-8?B?WVhvZzVNWU96eFF0RGZ3czYxWkhlNWhZWlJCZENGQkFXQTJudFM5VGdpWjNN?=
 =?utf-8?B?OExOY083NTViMk9PMmcvVG9IZlJMUk5kbEZKMk5tWTFZV3IyalcwRTd0NDF4?=
 =?utf-8?B?L3hOOWFUeGNMcytQd0VKYnJHWXcwbWp1MDZqWllsazFvckRRaXJlcitkandr?=
 =?utf-8?B?NFU2VTRoM3U1RU11Q28reWNOL3VaTEYyRHcrQWl1b0tFWWQ2RUFVaC8wbXZM?=
 =?utf-8?B?d0I2SkkybGNGcklxQm9OZm0zN1FTRnoxYXV6UG9MQVJ6dlg2MTlvRndRaFh6?=
 =?utf-8?B?TWhreEpvMWovNVoxdnA2VHJPbUtKblR5azNRRCticlZHcWRldkxqM1FYK045?=
 =?utf-8?B?TW0vOXEwLzRmTUIvbXpBWjBOQlJsUUhZZW9JR0VuODR4WitHZTlXTFk4WVlP?=
 =?utf-8?B?Vlc2N2NMUXhmYjhCM1Y2UCt6V1gwVFdXK2wxVTdGZEl4djByY3hNK2pKaG9m?=
 =?utf-8?B?cWpzQWlZQkcrb2lnZWpVeEx3eTQ3M1k5SElIK015VFpKK0Fid1lJSGc0ejlV?=
 =?utf-8?B?REQzK0xkcmlkZU84cnoveldBZVF2NEc3blRLNVpXL0I4UnZFd2J3UTE1aU03?=
 =?utf-8?B?d3FHMFhmTWVGbUVLa2RWNFhMdWlvc2dxRkZ4VmE1dnFseEgyaTNlMVUxSXBi?=
 =?utf-8?B?VGZQcEJPN3hlRkpoandrUmt3cTFZMkVQZ3pjUzJTTUs5SHEweEVEWVZ6T1Ey?=
 =?utf-8?Q?v4j8=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:FRWP192MB2997.EURP192.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QllZTWVuNy85cGFHS2ZyMTdML3dGUlJwRU9Vbm8vTU1ZdnkxOFRjZytwanlW?=
 =?utf-8?B?aDU5Q08wQ1ZJQldYeFhBeGRmL1c0SlZqWW0zNEk5MkcwOFJwUWY5Z3FHYWJZ?=
 =?utf-8?B?dVRna1ZMRjhyZ1RLcnV0VXVCNGZid1BNQVdFZzNKR3l1K0hRWU5zdWxndWN2?=
 =?utf-8?B?UmhOaS9yUGlwOWhlUUliaWozN3BkR1hPMndqM1A2ZFFqMlBuemJJMnJmT1NT?=
 =?utf-8?B?WnQ2VkYyMy9BTllObUtqQnZWRXZZd1dOZFA2c1EzVG5ETXF2eDQ5SEk4blhs?=
 =?utf-8?B?elNLdUpPSjRJUXZuQUU0aktLa3RyZWd3RHI3R0I1Q0xFTVNiSGdpU0UyOWVs?=
 =?utf-8?B?Q3RpdWtRRjlNb0ZsdmtGc3hVbUhhR2NFTWxkLzhkZmp5ZTE3TzNjSnZORmRN?=
 =?utf-8?B?UGlVckZhZkNlSWtYN21Ic1ZYdWw0WTcxS2hRYlU0c2FkQTlybHlxWGs3NW40?=
 =?utf-8?B?TUFKWVZ0aExmcTlRbFg5UG9rUU1ueWNmbjN2LzlBT1dSQjBHL3FGb0d6ZXJi?=
 =?utf-8?B?NVhGZld2SHdYZVFjcmJ5REJiT0FZY2dtYTVnYTM4eFdoYWhvanRkMFc1Y0po?=
 =?utf-8?B?bDJBVXQ5cDB0LzhLSkppYU1zTjBmUjlDU1Fac2FGelVtMnlnOUxqOU1NOVl4?=
 =?utf-8?B?LzRwOUg5cjFLbThGeStQbUFXZzBBS1ozaW55VktnbTcxN2xmWmNnV2tocEdz?=
 =?utf-8?B?V2RiVGQ5MG8vYjJCMkdPcDV0VzluR0dxNnVhZktLZGxublpqNVlTdkxvUnIx?=
 =?utf-8?B?RGFyZm5HMk81VndxS2JZb1ZGR2I0aCtGaWNjOU81YUdua041UUlvMnc5eWpR?=
 =?utf-8?B?WVdQa0ZDemlCcmE2MzY1VlFIK0taSGlHeHR0Rm5oaU85dkJzbnc4dG92ek14?=
 =?utf-8?B?azYxbm9XTTR2dVRTVnAydjIrTGpzdm1kRmRma0pNQzN3YUw2OTJnMmlXK0Vy?=
 =?utf-8?B?RkYzSWdkRi9FVVNSdnBkUmc5MzNOODNuZUt4QWJ2ZmExM2FZY1FITmhVMHNU?=
 =?utf-8?B?WnVhVHZzbHdoWHdNMzF6bjczenU0T1lzdzRobHlMMG9OS0g3Nnd0WWlTU0FS?=
 =?utf-8?B?RUJMeXR1d0J6MWxwNGxLd0FlZDJ1NE54RElEZ3RHR0JvL3FISDd5OFBxZ3pI?=
 =?utf-8?B?MUZUaTFFTDZFWlczQnRSRm51QVRPMVQxamVJMlJENG1ZalNOSStTdG1MaTd6?=
 =?utf-8?B?azVacHNpVlZKSlNnWjlzbDZWOHRYdllTT1pFdExLZUJqSVYzMFZwcGlPVjVT?=
 =?utf-8?B?ajcwUW5KYllHSWF1eHY1R3RjQVJiUkRnTXcwcld6ZUVtUHIxSmtoc2tJam9S?=
 =?utf-8?B?Rk1RSEFSSitWTUxYcjlzWTlhMnFabi9RLzMvenBGMGRIdkZOS0ZwOHR6WjQr?=
 =?utf-8?B?QkVnMkRIeStlRFVCdEd4WkVzT1dFNmJESHlPR1J4L1Brb3FaeXpQZ1ZzK0xl?=
 =?utf-8?B?OEJDaFcvWlh0enV1TE9OVDYwcVBmWXEzZXNtR2RiQ0FiYndqLysvQnZId2VU?=
 =?utf-8?B?aUREeEozWmw0WEFYaU14dUxicjA5UHZWK2hrRmZ1TUEyaFRPUEV0RG9WTjVr?=
 =?utf-8?B?dllUTEV1ZGU5WHY1Z1VPL0hjUG93cHFVT1dISk9wZzNYVkNUVUw1NnNGMisz?=
 =?utf-8?B?aCtuYkhxaGc5UW5aUEVkQ2VQaS84M0tPNWJTazlPWXJBTitlOWN5WTVSRitn?=
 =?utf-8?B?ZTB5ZVQwcWJPUWthdVdmMm54dmsyendvWmcwV242OTU0QWxhZkEva0RjSkFK?=
 =?utf-8?B?bEpNTm1NZG5BTWtyVU9rUnBpeEJXcmIwaGdHemdYajVab1FzbEF1eFlXRVFQ?=
 =?utf-8?B?QW5MTUpwMzdSb2JNN1RHYlpQNlBwRkxad0k4alQrTUIwUkVXSTRVRUtOY1dD?=
 =?utf-8?B?eDBkamg3UGtyM29vU3NYcVpoUlZDMHFKRm9sOUVxTmlDcFllK0cwTjhPL3lE?=
 =?utf-8?B?S1hjS3hFSFRuWFpnaVhvelhSZGpkS1BnYy9FSHFFNVFKWkhJejYrM0RYWkND?=
 =?utf-8?B?M2Irb2ZrM3krUFI3R2Y4ci8rSytPQTVqRWo4MUZneW1yRmJwQUgrVWdtbDRw?=
 =?utf-8?B?NGZKUHk4bk96Qlo0dnFNWU1XNEQxaUhDbGQ0MDZoQStBTnpaNVp1NHNoSG1x?=
 =?utf-8?B?Q1BHQVF5bjBZV29lcGRkRVd1NmFCVklsNXlMcDRNTTNQZG5oZk5mLzFHT3Zj?=
 =?utf-8?B?UXR1Y3VuaG81MU9vRWx6Qmt3czF1ZkFVMGloZ0tMMU9qbmlSVXc3alowUUVI?=
 =?utf-8?B?Y2NPTU01eXA0Tmc0cFVYUGRHM2VpU3Z6OEErRFRpdlpqZU9xaFE1b0xRcjhS?=
 =?utf-8?B?RS9wS3FpNW15REZxTVVUWG1ZQTA2V0RaRlZnM2cwSVJJcFpENHp1Zz09?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	brmekBcOIFKGQwHUYRmmvgtXkxHofhM94O4vEHE06gavyYdeyGEC1CBJXXQeNbIvR97CaLgmvE86dUj3SAYmt1lPwN6Kl5cXBBz375jjwlDUHJRcGI7YxwazyeQLJNFhzFlfMVHgcmTtpiyduRaRRpDXcyrwdSgGQK3rTVy+aXmkHERPrkfaJlj9ppmpsTW8UMTD6kS1uknxs3T2GEeb05yyn/8lWjkQAkoNv6ESYI8XO049wsjgfUNHFDJKIDXa7n9ugmo9pyI88cVyCr2ZsWkopR3Nl6GwvxKN/Vf2peE0rjTohnOdUh/5wiuauIpmKE93KrlHdLugMXpmCEhhuNWkpN9osdcwWVVC1aTVsLEZw0ElMtXOiYRJG+Re++eNekvyN7uVs3Ly0fo6JsuA1/+v6EDFT1HCL1wdfJu8C0xBss7LDTzY4YGa2iFTdEW4pTqNv429jr9apZtf56chV6qDNkJ79t7+KfW+7S03FHZHxzPKvgFSHauPHxZwQPCnAzt8N5J6jWRiRAXg9inhzDWTJpX3xeFDDOwwOiqK1UOr97lwwhaXOnQv8beWylMoSt8TaRQpANf8r7c/er5eehI2zlVsQI9S9e1RDSoz467feW54ca2OV+UfOLwIu9Tc
X-OriginatorOrg: westermo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 38106c75-00be-4969-8c01-08de58d8b632
X-MS-Exchange-CrossTenant-AuthSource: FRWP192MB2997.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2026 10:34:52.6971
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4b2e9b91-de77-4ca7-8130-c80faee67059
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m5TEWPHG1EEVFRlv50P6hcXADlfvu9lrqBqOb7AzIiVTce5rMs21aMBHUp5hS4AZaF0TjawY8LsbW/K+SenOdA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2P192MB3242
X-MS-Exchange-CrossPremises-AuthSource: FRWP192MB2997.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossPremises-AuthAs: Internal
X-MS-Exchange-CrossPremises-AuthMechanism: 14
X-MS-Exchange-CrossPremises-Mapi-Admin-Submission:
X-MS-Exchange-CrossPremises-MessageSource: StoreDriver
X-MS-Exchange-CrossPremises-BCC:
X-MS-Exchange-CrossPremises-OriginalClientIPAddress: 104.151.95.196
X-MS-Exchange-CrossPremises-TransportTrafficType: Email
X-MS-Exchange-CrossPremises-Antispam-ScanContext:
	DIR:Originating;SFV:NSPM;SKIP:0;
X-MS-Exchange-CrossPremises-SCL: 1
X-MS-Exchange-CrossPremises-Processed-By-Journaling: Journal Agent
X-OrganizationHeadersPreserved: VI2P192MB3242.EURP192.PROD.OUTLOOK.COM
X-Proofpoint-GUID: CxO7hP4RH0x4tdBFZ60zYpar_lui8bOQ
X-Proofpoint-ORIG-GUID: CxO7hP4RH0x4tdBFZ60zYpar_lui8bOQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIxMDA4OCBTYWx0ZWRfX4PRtB01rFxFX
 WLYQrnH6+peux7QVdRRAlCZNqiNfa1KgHa/KA8Azkh2Q1xrLHxLcVFaAJiIk1xOY+qqYd84M4l0
 grcd8fDUlvPYOQ7Ms4LyduI6+vzoMvoJrd8mWDUAd6pJjjac2DS55CrUrk6h5KBYyG7j//0AGSM
 bZMCAudZPKLZrU6QADOIDyk2hWgeQlN+91bSlr4ZvXuxmjT1ksQ7599ZGDRCaiSyor1WoWsEOl7
 5a2ZfnJGY2irtlP5M30reO/vRUU/Z9cT6eLpE2CQsWm5Z/oxq+2J17UxzlDTRnLlEvGLkMkAGCC
 kWLjy8hLo80bt7Go43ktudXox/hzDaFLQePiK+zu9dQM4F584wpxHbXTJa6wSVD8cBK9m9s6sSy
 /hxoQt/wfcdq8QW5a7rSdKw4W8glZ6OB/ptmpiEMrRNGAOQM2umEwnpDINUIqG3DSG7ktIpYQ9N
 0i8wQkkfM247+E8dwyQ==
X-Authority-Analysis: v=2.4 cv=Xrb3+FF9 c=1 sm=1 tr=0 ts=6970abd0 cx=c_pps
 a=F2KL2Qz/X2xAL+kHTXsCSg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=8gLI3H-aZtYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=UrzDZlQLpq0S1YNm0ugA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Spamd-Result: default: False [0.54 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[westermo.com:s=270620241,beijerelectronicsab.onmicrosoft.com:s=selector1-beijerelectronicsab-onmicrosoft-com];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-89988-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo,urldefense.com:url,westermo.com:dkim,beijerelectronicsab.onmicrosoft.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[westermo.com,quarantine];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alexander.wilhelm@westermo.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[westermo.com:+,beijerelectronicsab.onmicrosoft.com:+];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	REDIRECTOR_URL(0.00)[urldefense.com];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:7979, ipnet:2605:f480::/32, country:US];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 901015592C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Jan 21, 2026 at 11:27:35AM +0200, Dmitry Baryshkov wrote:
> On Wed, Jan 21, 2026 at 10:07:22AM +0100, Alexander Wilhelm wrote:
> > On Wed, Jan 21, 2026 at 09:22:07AM +0100, David Heidelberg wrote:
> > > On 19/11/2025 11:40, Alexander Wilhelm wrote:
> > > > Currently, the QMI interface only works on little endian systems due to how
> > > > it encodes and decodes data. Most QMI related data structures are defined
> > > > in CPU native order and do not use endian specific types.
> > > > 
> > > > Add support for endian conversion of basic element types in the QMI
> > > > encoding and decoding logic. Fix the handling of QMI_DATA_LEN fields to
> > > > ensure correct interpretation on big endian systems. These changes are
> > > > required to allow QMI to operate correctly across architectures with
> > > > different endianness.
> > > > ---
> > > 
> > > Hello,
> > > 
> > > I recently (next-20260119) started receiving errors on Pixel 3:
> > > 
> > > [   21.158943] ipa 1e40000.ipa: received modem running event
> > > [   21.164616] qmi_encode: Invalid data length
> > > [   21.168930] qcom_q6v5_pas remoteproc-adsp: failed to send subsystem event
> > > [   21.175844] qmi_encode: Invalid data length
> > > [   21.180494] qcom_q6v5_pas remoteproc-cdsp: failed to send subsystem event
> > > [   21.187467] qmi_encode: Invalid data length
> > > [   21.191772] qcom-q6v5-mss 4080000.remoteproc: failed to send subsystem
> > > event
> > > [   21.199088] qmi_encode: Invalid data length
> > > [   21.203360] qcom-q6v5-mss 4080000.remoteproc: failed to send subsystem
> > > event
> > > [   21.210636] remoteproc remoteproc0: remote processor 4080000.remoteproc
> > > is now up
> > > 
> > > Since it's not well tested, I believe there could be problem with
> > > configuration, but after reverting this series, no errors pop up.
> > > 
> > > I would believe maybe these errors was previously hidden, but just to be
> > > sure asking here.
> > 
> > Hi David,
> > 
> > This is exactly the problem I was afraid of. When the endianness fixes for
> > `ath12k` were rejected, I implemented them in the QMI subsystem instead. I only
> > tested this with `ath11k` and `ath12k` drivers, both on little-endian and
> > big-endian platforms. However, other devices, such as your modem, also rely on
> > QMI, but were not tested.
> > 
> > The difference now is that, instead of using memcpy, basic elements like `u8`,
> > `u16`, `u32`, and `u64` are handled explicitly in separate switch-cases. This
> > raises the question of what exactly the modem and its corresponding driver are
> > doing at this point. Could you please tell me which repository you are working
> > on? I could not find `next-20260119` in either the `ath` or the `stable`
> > repositories.
> 
> https://urldefense.com/v3/__https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/?h=next-20260119__;!!I9LPvj3b!AWVWfTEAVZO1j_Z284kxYiMwiOLbmHWEDT8S0RRsUl2rXclrmeyzh9ChVTTXMlhjPLcoRAiuS7Zfx9c0ejF_6IDNCNmVGYaDZmw95gOh$ 

Thanks, Dmitry.

@David:
OK, this is interesting. The QMI subsystem supports exactly the
basic element types from u8 to u64. In your output, I don’t see any errors
like “Unrecognized element size”. Therefore, I assume that the modem is
adhering correctly to the QMI protocol conventions.

The “Invalid data length” error can only occur if `data_len_value <= 0` or
if `temp_ei->elem_len < data_len_value`. However, my changes should not
affect this. Since you are using a Pixel 3, I assume this is a
little-endian platform. Even if your modem performs any endian swapping
internally, this should not affect you.

Unfortunately, I must have overlooked something, I can’t identify the
problem just by reading the code. Without having access to the specific
modem, I’m also unable to debug this properly. As a fallback, you could
revert the changes and drop big-endian support for now. At the moment, I
can’t provide an alternative solution on short notice.


Best regards
Alexander Wilhelm

