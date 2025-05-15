Return-Path: <linux-arm-msm+bounces-58055-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F546AB8327
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 May 2025 11:47:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B022916D05C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 May 2025 09:47:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABFB51E7C18;
	Thu, 15 May 2025 09:47:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=westermo.com header.i=@westermo.com header.b="UWTeLl0p";
	dkim=pass (1024-bit key) header.d=beijerelectronicsab.onmicrosoft.com header.i=@beijerelectronicsab.onmicrosoft.com header.b="a6O0xx8M"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx07-0057a101.pphosted.com (mx07-0057a101.pphosted.com [205.220.184.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A825C18FC89;
	Thu, 15 May 2025 09:47:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.184.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747302435; cv=fail; b=OfwkdhGaNwH61bVFSniR2/cnqi0DMtavFwznd/8S/1HKrveuysszLqkTBdVioDN7ub3q1eyG9YcgtSP/WSloKZxjMzc+0OS5GaF5m7GfuSHKQJafrLh6JkOneS7VV7fJ5Dey6zzvsMzrNIPjzFLDMadv+9l/jFx4vbmQUJIxJNA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747302435; c=relaxed/simple;
	bh=EInqY0fXOQAO6Um6KwoUScQBxXfdclaFMKy1oH80l5o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=PQxiwH48XyBDdrE3ip6azTJ1ZKxOZQYJH8GHwdzrGD5Y96ntOeQwlsy0VCCjwn37gT0jcfqU7nCxi+PafCIWUKKRvgcfd0Pos2/M+XeIuJYmP/3IIGJcL/MZO8Pu2CCvrqyhVR6bfjN3gSHM5yf35kqlQ9v8n5p/hHPcExn9NZI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=westermo.com; spf=pass smtp.mailfrom=westermo.com; dkim=pass (2048-bit key) header.d=westermo.com header.i=@westermo.com header.b=UWTeLl0p; dkim=pass (1024-bit key) header.d=beijerelectronicsab.onmicrosoft.com header.i=@beijerelectronicsab.onmicrosoft.com header.b=a6O0xx8M; arc=fail smtp.client-ip=205.220.184.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=westermo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=westermo.com
Received: from pps.filterd (m0214197.ppops.net [127.0.0.1])
	by mx07-0057a101.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54F4vYn5008076;
	Thu, 15 May 2025 11:46:58 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=westermo.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=270620241; bh=
	tE8H7P41znokH6GJvihLwMfpOr2q4IsEvMuUqTgSNCk=; b=UWTeLl0pvryv5Xfs
	nxTGmxe3wB1miIcequeDAUgZoQIRzZrYMr/Wr/2GMybbDYP2h711C3Fcmgdv+99G
	O3I9oqczn0Rg14QwrCbLb0QaeQlBS2ZkCviop9e3POWigXXQsldji20yeMpt0GIM
	rWFcvbs6BOHhLYOtcAS+KRzG0WWaaFqWpjz+gEzOvUvdfdv4QuUMn/WaNsFWUjVW
	/R/zCrLzFrL5ewZBk/6CoRZJl+mYMM9KGZbyTYifgJyQUMXsAHt+9Jy9/N65JfHP
	kFi6zH0umSPjfkTfcXxQR0iKLljdEBQh287O0cHWvomLqWbhhTAj2Y5fE0sgfQwY
	XkHP8g==
Received: from eur05-am6-obe.outbound.protection.outlook.com (mail-am6eur05lp2104.outbound.protection.outlook.com [104.47.18.104])
	by mx07-0057a101.pphosted.com (PPS) with ESMTPS id 46hu5bdy45-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 15 May 2025 11:46:58 +0200 (MEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r0avai+esa3+OxAPhBhDd6L1XY1pXGUdByMM6/z3qHcMBvB5oslDNu87PIs48D7kuV+6lKMb+uK5c8zvuD2ubXrxVc/dZlSg5kZbuXH3S2zVgybYd6uGxgdYbvyp/Vjndnyc1W51HHcuNEQ5KOeVKIXDV8ZnH7kmpHDziIpJe6rbGv44g+iiHABFyayludu2Xa5FgL4ExsRl/oVi4feLL6euxNTbGg8ebK3HNk4ITFq1VzB+x7z4yX0a8eK8N3D3gIihUFcU87swP+0whe8M+s8LDJduvhMkfOr2mN7+j9tMTigbopMJ45SCJq4dtYfNJXqNA5eKEaoYd2VvM9p/fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tE8H7P41znokH6GJvihLwMfpOr2q4IsEvMuUqTgSNCk=;
 b=wMNsbugWllAoXzXMq9nxAAaHRFARSI0DqyzLFIb25pescviLX2ggMZXt7nwxWuJlQAACaW6eUeihFNE/zHICUSG/xeEr0RXED5I9/2EugN0mUa8845I3bx0xi9odSrtxbn6katWCuWJKMG6ui6Uyzf9oguD5QyLIqODc3VkajDYVPsd1XYRwAd6ybxb5JDhNRxR42wwJbzJiJPiE9pu7WDUWlahqaon7LOk2gIcRjCb+2s8gQXSJCD16ksQJ5T7e85Hfuea5NDOfIzR5xgLoQr6vaAi4yFJ8SnxgjTFgOj+kngnJlCz2jUZRVRe2uz6lMoZVZFp18wgB0KAgCE2o3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=westermo.com; dmarc=pass action=none header.from=westermo.com;
 dkim=pass header.d=westermo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=beijerelectronicsab.onmicrosoft.com;
 s=selector1-beijerelectronicsab-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tE8H7P41znokH6GJvihLwMfpOr2q4IsEvMuUqTgSNCk=;
 b=a6O0xx8MPspb29Mx3sGS7W7W3MEkfu7Wvhr4X3kWTbVsgNrBwgXZAIgMhu48xg3Ge1SivOVfh/3qiyZdiMnSLJtC+ucVMCeHXef4hnu/JYsOU8dNLoJoIfI1m8jkZSRYmQ9cBivsDiveokBzO/Gd6pfv0i5lF2Pw1n8fv5SYAFE=
Received: from AS8P192MB2240.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:63a::18)
 by AS8P192MB2174.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:635::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.29; Thu, 15 May
 2025 09:46:55 +0000
Received: from AS8P192MB2240.EURP192.PROD.OUTLOOK.COM
 ([fe80::bee5:29b7:49f2:cf70]) by AS8P192MB2240.EURP192.PROD.OUTLOOK.COM
 ([fe80::bee5:29b7:49f2:cf70%3]) with mapi id 15.20.8722.027; Thu, 15 May 2025
 09:46:55 +0000
Date: Thu, 15 May 2025 11:46:52 +0200
From: Alexander Wilhelm <alexander.wilhelm@westermo.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] bus: mhi: host: fix endianness of BHI vector table
Message-ID: <aCW4DCR/IMxejUpg@FUE-ALEWI-WINX>
References: <20250515092523.1724845-1-alexander.wilhelm@westermo.com>
 <CAFEp6-3-25sRUvPbeX0oH1pVyRt49gvdVw5eMi1_azzPdYUjDw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAFEp6-3-25sRUvPbeX0oH1pVyRt49gvdVw5eMi1_azzPdYUjDw@mail.gmail.com>
User-Agent: Mutt/2.1.4 (2021-12-11)
X-ClientProxiedBy: GV3PEPF00002BB0.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:144:1:0:6:0:1e) To AS8P192MB2240.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:20b:63a::18)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8P192MB2240:EE_|AS8P192MB2174:EE_
X-MS-Office365-Filtering-Correlation-Id: dcec5139-775f-49fc-69f3-08dd93956d42
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QmhDeEFyd1ErUzdZTW9aM1lMMjNGbHNDdENVQlpYakdjMlc0NmJmYzVPSjF5?=
 =?utf-8?B?WXh1VU0rY3R4UUpBcEx1OFg3TERmZGg0QkVYQXNyc1MwcmV0WVJuTWJ3S3lp?=
 =?utf-8?B?ajRLS051RFpGeTRCZkVRcnVaRjd5a0xZWk1WR2tzT0JCWk5pRkVnT2xmVGNS?=
 =?utf-8?B?QThkcXgyZkgyTTFCbitkQm1mZnBTdDVqbkhTUlh0eXVZUTRNMmtOQ2EwdVo3?=
 =?utf-8?B?ZHlOVjUwMWV0bGhyeTRIcytHWE8yTFNNTXkvTWswcFVuVWZYelhoSDZMSDZ1?=
 =?utf-8?B?RkZxQU9aU1J0MFRLRVlaT011bVVuZ3lUaUVYWlRKNXBWcElqbCtEaDROVlM1?=
 =?utf-8?B?TG5URXpsTU5IRlFPK1NRUWZ0aHRUd0J5VDZHQlc2ZnRMdDBSak5NN2diZnFI?=
 =?utf-8?B?djZqSGtMclR0L1l6Mkg2OXMxOVZQRVN0bW93TnVjME51Mm5uSGsvQ3FEOVND?=
 =?utf-8?B?dlNoR3NHV0k5MlJUMVdUcWQ4VWE4dWFIbEdXN1Zwd281eGZLK3NMaXpkaVVF?=
 =?utf-8?B?bmFzMVBBekZhMGdOcnZHQjVhaHFiV01jQmdQUFpwZnJDUnltVE4rRjV3SVRD?=
 =?utf-8?B?V1lxYmRaZlM5NjRJV3BFeWZKa1Y5Z2lSWXhYbmJIOXZ1a213eXcrMzI1cGVz?=
 =?utf-8?B?bm12YmhmclVjdi9VNjUyNHRKTE5vSVUyMUFpK3JBcXNHMGRZUzRWbHVCaHdw?=
 =?utf-8?B?bnUwVktBMUtIUkpWcDUrRTBsOTgwd1dWekxVYk1KV3J4UXRJbDF6ejIwMjNX?=
 =?utf-8?B?aXZCMHlKZFE0TUR1SXA4bVhMdVZsOG51SGRIcU41SnRIVFROdGVveFR0OHFF?=
 =?utf-8?B?Mm04VkFrOHlhVzBFZ0piR01iUFZnb0JRUDJYMDIxM2pxNU0za3dFcXBDcjVT?=
 =?utf-8?B?Qkk0UnhwejdhN0FjOG5BN1Q5aGJvVXpFbkNIMVdkZ0JkcFNLOHBHbld4NTBr?=
 =?utf-8?B?YS9lcmkvdmF0U2kvMHdVNmdiRXZQTk0rem82dDRSMmppcWhlV1lDbk5adHFa?=
 =?utf-8?B?b2hkSHRXYWV2NndwdWpWQWZZUGtMNmVRV1I4QnlrUVYvVWFNSnRZbk4wR2h5?=
 =?utf-8?B?bC8wdkgwY3d0ejhmcHkzMkZheUtWOUZXOTNpMkhaQU44ZE0yZEJGUGJCK2Qz?=
 =?utf-8?B?Vm9ySksxVGV5MEZiQUdydzdhTWRVVGhrYnVQK2l5dnlVUHFxNlBGYUhnWFgw?=
 =?utf-8?B?ekMydUtpRWEvcDVhaUNBVEx6b2RmOHhENFN6QStjcHBpVDIweGtpa0FYTkxB?=
 =?utf-8?B?d0xaS1VJaE11dzVUY2pBMTl3b1NEcm4rcDc5OEtPRmMvamtBeEtMLzlhK3BK?=
 =?utf-8?B?VVBVemVsTm5uVWJaTmVHYWt0SUd2eVlzN29pcjFUR0g5RHlVNGp5UFBHZmQy?=
 =?utf-8?B?V3d6VnFPc0h2V29wZTcvcEZPL1dCUFFMcW5OSS80TUJOM3VqWk51bFVPUE8x?=
 =?utf-8?B?OFhDUGRveUM5MS91eHpSdDZwTVhVVDdPTUlmdjlPTkM5LzM4R0d3Q0NLOTMr?=
 =?utf-8?B?cXdrSmlvUFU0Z2tRRmVhTExlK2JnR1JkYnBTcXRJT2RGTzdpME1VY09sUzVy?=
 =?utf-8?B?Y0I2blNRT01pbm05SUJHUjd1Z0xoR3kzT1M5Z0N5ZXl3MnpUYkh0ZkNlVWJs?=
 =?utf-8?B?aUhxb2hsaUppMC9FdmpFN0dwVlVTT0NxQngyVWRSZlBXeXN4VXZZWTJUVEhT?=
 =?utf-8?B?b2ZJQ0kvZWtHQS9XcncvZnM5VGF4dVFmeFdXUWhhemhRWGZBZU94WWdMTExN?=
 =?utf-8?B?dm84NWdYcUJRMmxYL3hReVZEem94RDZNS1RKUmFvR3hKUXBKTUxwR0Q0YURp?=
 =?utf-8?B?Q1BHZ1NCTnpYbDM1RWxETEN1SFRMOVBsalo0enU3ZFdwT0VxUEdyenM2NEU0?=
 =?utf-8?B?ZTR5aHRpMldrdExVZU9aZ2VQM0U5Y2RkS0x5K0plWWRwVURQdDhGalY4bkN3?=
 =?utf-8?Q?ABzsJBD7WkU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8P192MB2240.EURP192.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UkE0aWpYeWNZVk9hR1RweWhSc0c2c2pzWG1aNFIra3dBdWJ2UmdMVW4zUWZj?=
 =?utf-8?B?SzJpTXQyNEFuOGFSSGMrbzBKenNuSnp2YTNRWWVyb0V4WlQ4blUrTzlscEs2?=
 =?utf-8?B?SEQ0aS9CWS9uME1ZRWNCanQxL1AwWTlQOUVybEhsdTRXMitRV1RJbUxtRGpS?=
 =?utf-8?B?L2Z2ak1UMnhxTGdlS0h1N2V4WVVVQ3N6cE1mTnQxcUMvdEV0dk96RnpiVTdo?=
 =?utf-8?B?WldPWW1WNjZTanlHOUtIQTRsdENUeGdoY24vN3kwcExWNFhFZ2pEUzBvZkVr?=
 =?utf-8?B?NDB1YUdhZmJodEIzWTA1ZUZPcGJ5Vk04NnNxWWlvQVc3K0txakcyeGpzVUlL?=
 =?utf-8?B?U29yY3FwYWdzb3pIQWdyR0FraGJPTVNRNnN1UUxUeWJ5TWFJMUI5TDBqUGdk?=
 =?utf-8?B?czFmYkNjODFSeHUyellZR2d5QkxKR1pFaWFJczAvWVYzemZHMHpkL3c4MUpY?=
 =?utf-8?B?OE9DZmhLYS9zR0V4SjBPNnNOL1llbG9xdUthUFA3M3ZmL2dxai9ONGVFeGRK?=
 =?utf-8?B?cGJNRVMza3o1anNPRUNRUjZWam9ZVEdWSGsvdllRWi9mRmVkWDMvMmRqa2k0?=
 =?utf-8?B?SVpHLzYrd0Nsam9pSGVxUWxDMGpVUkxQcUUzb2FWazBjVDh3UDNLS2JHVGY3?=
 =?utf-8?B?L25sbnYySFZqZzRVK3p5SnNSeDAvaFViWWx4YngzeUM5bkhrZGZOSHVHaklm?=
 =?utf-8?B?RDh3c1F2ZXFycmczZDNGTk1Sejh2ZzhncFlTb2RrQ21Ob2Vlc2VGOFpkS3ZH?=
 =?utf-8?B?NEVpcU1CaitUQ3MyOURzYXczY1lKLzBBSGZwM1p3b0dnOEQ0aDgwbStXdWoy?=
 =?utf-8?B?STdGTU9jVDZwanl1QTVKaC9mcTEvcC9HTWNCaXU5VnRPa25WeFdYZ2Q4Qzlu?=
 =?utf-8?B?MHR1MnR0bmF1ZzVGNmoyL2JPMzMvQmxqV3Q2alVpdnRrRUgwQ05xZmdNVDFP?=
 =?utf-8?B?ZmJFT2V4cC9XWTJvbWVqQVRLanM5ekw1YS9najkxcEQ4MkRaVlVhWFRsNWdN?=
 =?utf-8?B?ZVY5M1lNZFljU3g0QmZCUGpnSytFZVV3SUlpOHZWd1ZLNjVPQTR0Y0paVU12?=
 =?utf-8?B?cUNnRU80NFNBdWFmOGVlR1pRQkdXNXV5NzhpSmZlY1JCWFFhNHJ6aUhqT2th?=
 =?utf-8?B?VTEzMnZDTjk3RmFpOXg4OHRVQklOb3UwZjh3MCtDeTZxQ3JKM002Mi9jcVJE?=
 =?utf-8?B?MGhYS0JJOGMyYnZkZnJnVzdmRU9vSlJubFd0UXloOG5vZS9sRXZNYTNKb0Vp?=
 =?utf-8?B?RW8xTTNvbTZoUVlUcWQ4YzdTNERwbldRTkdubVBHSUtXc1dsOTFveXh4S0pK?=
 =?utf-8?B?SmxXOUphUTBKRDgycDNJbzBDL3BoYnl6OXJZRkFKY3YzWmRXOTg4K1NHNXQv?=
 =?utf-8?B?ZytlVzBrM0ROa3VkaVBlckthdisxbXlQWTh2a2c5dDZqQ2o4ZnVGeDdMUFRY?=
 =?utf-8?B?SGhvWXZ4K0t0bmloaC9xLzcxamJDYjhHYXkyWG1uMU5NTzN3VTRONEsyVUk3?=
 =?utf-8?B?dExrbzhKU2plN3dXbE15V0M1S2NtSXB5ekpUQWlsTmN6V3pJTmJESjhQVWQ0?=
 =?utf-8?B?L2xjSnNzcDA2SVNhSE96MVByTG5vOEVSR25EekdYRHk4NGh0TzVsbWlxcXRi?=
 =?utf-8?B?TG9WVHU1S0RpRFFIK0NPQVRwOXMrcnEyS1IyS21iUE1TMjZBS1BhK3E1YU1I?=
 =?utf-8?B?Qi9EaGg1TUdMZ1dobmdCeGtienc0R0NWNlZ2cTlHc2IrUkhmU1dsV3VYT1hh?=
 =?utf-8?B?REtsTkhPdnBwS1dEcStWMU4rWkIza0JwMkFGVEhSOE02WEl1clZWMlpTVDI2?=
 =?utf-8?B?Y3JtNTh2ZUVMRHVpWlROeXlubHVhcjJ0aE5wOHhpbUdoSlJzT2R4UGc2MFVH?=
 =?utf-8?B?emtoanNWWnRBNUFzWXBZM3BINktGTUQ5T3RmZVNON1V5TmpyOTA3RDl2d1Nx?=
 =?utf-8?B?Qjh4bERGenJkbE1kcjI0M0ZSRndxb3cwMTA4cmlvbjFVem9QUlpWa25jUEVD?=
 =?utf-8?B?TlZGT3dESHBteEM5ekpkMTl5RUN5YXRlbVIyK2tETFRubVBLN3dHUnRyWlNB?=
 =?utf-8?B?L29KQm9KMTYxVlBCMXZFSnJENThHby83NG9POGhaZDhuMzRJNnc4RUVHTU9G?=
 =?utf-8?Q?yqoPhYbYiM+VYeGjh6R6aV3gK?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	fm8nnP66APV6gvXvSdrWRtvAabA89MYz+3n1GCLb+iCqgo1DjTYsIn4kKfGgcU4lMQvx73PHnk/meBp7KLr5pXFLbH8sFvJu17MSt5aVHi+cVfo2PgaBjosPJkXoPBg9928UKZELRPFRjoSQDNiFRBbZ4K0dAEDBP7gRDTZT20YKDrLCr7L6Cyv0CsuR9V763VE7NY6pfardeTWqcDn7toCMy43u/CwBEPCGYgwvj+CeOO9ooEAcmnibhU9vyKIcg8ywlzemrqOUfyql5WfS6iuGyAzaqJecrtUL2GOPiKF6/NFwK48o6uJ7AxmlCFZGqwqqrFRdxJNwCxmtz6NNNfY8cZSM0bJYNFMX1dU2XDaWxBpEcNm2EuKRLfFInQXl9IYQbyghrCqd45WHmYsILzDSkDXRMdi2qotFMGKaaiRitGNfTD2CRIlMwyYh5l8Nl3Pipy8G+93kZvHv6U3UC8sMe3Ds+E39gYj6rTF2cXJi6UsA3at43FGJ+0fnXDSGhUp5WcxEUpaFcAAlindwT8i/Y9klsK9t9dQCMKNILcUOjY0TfA9pjlK63tq+WgmOIB/RYfa6PZWGSO/8C/yYZv+wo17FEe3GzDbwVa77gGrMlKt3Bzy4dEBf+fo8oW52
X-OriginatorOrg: westermo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dcec5139-775f-49fc-69f3-08dd93956d42
X-MS-Exchange-CrossTenant-AuthSource: AS8P192MB2240.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2025 09:46:55.0516
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4b2e9b91-de77-4ca7-8130-c80faee67059
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UFt/0gNKVkIquK5l4CLI/pVkyFbIVbwYSyKJPZq5nyUh12P0yNzRGm8d67c8e/HpGHz4+LRTYBlXnI5hhB/7GQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8P192MB2174
X-MS-Exchange-CrossPremises-AuthSource: AS8P192MB2240.EURP192.PROD.OUTLOOK.COM
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
X-OrganizationHeadersPreserved: AS8P192MB2174.EURP192.PROD.OUTLOOK.COM
X-Proofpoint-ORIG-GUID: LYunBbNA5meQfXHDZNkv4sJCQNta6Iro
X-Proofpoint-GUID: LYunBbNA5meQfXHDZNkv4sJCQNta6Iro
X-Authority-Analysis: v=2.4 cv=LINmQIW9 c=1 sm=1 tr=0 ts=6825b812 cx=c_pps a=ujVtL2Xc6AYuIgh9KuiIGw==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=8gLI3H-aZtYA:10 a=N9GNhs4bAAAA:8 a=65p1ccFE3Hf02clXqFMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=PZhj9NlD-CKO8hVp7yCs:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE1MDA5NSBTYWx0ZWRfXxKPxMb6hcZB/ dE5wj3408ZKgHfUzIrAV1BlDBWlEu3kV/suWVkAa4pwaXLHINUhy+s6o89+y7hjX3lKgaLjxJHO c/nPwr11BEy8sTiqTUYnVoeGKPJoByy1VLEALQ/ySR8EjCHvmvN4do2pu7ZIPiLzu+dFV9+aAoB
 AgSV2A3So0fXxE+df4L1HVsCYQE5N1aXUCaIDjpXyN2VwCs11JZv+4fGtP5I34z7imOT21R1xgl DLgRKQDooO5VfmCv/UEUTiZ6zvOMKkZ+M4qStdMDQTfapFMaiany+4/A9xkZzCsWyANqJKGpORP DSZovaodg3pHd6NYToEvR+ARex4Qadg8oz4eGMXVTTnlxmL28AHt1+vIx4rE8tpxVxSibfOuKBd
 vfoLK4MLzER2pxmXgMCwxFBdFivD7f+mZxiZ/O6YW0AYPHroFPVwUVB+xFVmYCUqUWJ5EFVm

Am Thu, May 15, 2025 at 11:38:43AM +0200 schrieb Loic Poulain:
> On Thu, May 15, 2025 at 11:26 AM Alexander Wilhelm
> <alexander.wilhelm@westermo.com> wrote:
> >
> > On big endian platforms like PowerPC the DMA address and size are required
> > to be swapped. Otherwise the MHI bus does not start properly. The following
> > example shows the error messages by using qcn9274 wireless radio module
> > with ath12k driver:
> >
> >     ath12k_pci 0001:01:00.0: BAR 0: assigned [mem 0xc00000000-0xc001fffff 64bit]
> >     ath12k_pci 0001:01:00.0: MSI vectors: 1
> >     ath12k_pci 0001:01:00.0: Hardware name: qcn9274 hw2.0
> >     ath12k_pci 0001:01:00.0: failed to set mhi state: POWER_ON(2)
> >     ath12k_pci 0001:01:00.0: failed to start mhi: -110
> >     ath12k_pci 0001:01:00.0: failed to power up :-110
> >     ath12k_pci 0001:01:00.0: failed to create soc core: -110
> >     ath12k_pci 0001:01:00.0: failed to init core: -110
> >     ath12k_pci: probe of 0001:01:00.0 failed with error -110
> >
> > Signed-off-by: Alexander Wilhelm <alexander.wilhelm@westermo.com>
> > ---
> >  drivers/bus/mhi/host/boot.c | 8 ++++----
> >  1 file changed, 4 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/bus/mhi/host/boot.c b/drivers/bus/mhi/host/boot.c
> > index efa3b6dddf4d..205d83ac069f 100644
> > --- a/drivers/bus/mhi/host/boot.c
> > +++ b/drivers/bus/mhi/host/boot.c
> > @@ -31,8 +31,8 @@ int mhi_rddm_prepare(struct mhi_controller *mhi_cntrl,
> >         int ret;
> >
> >         for (i = 0; i < img_info->entries - 1; i++, mhi_buf++, bhi_vec++) {
> > -               bhi_vec->dma_addr = mhi_buf->dma_addr;
> > -               bhi_vec->size = mhi_buf->len;
> > +               bhi_vec->dma_addr = cpu_to_le64(mhi_buf->dma_addr);
> > +               bhi_vec->size = cpu_to_le64(mhi_buf->len);
> 
> Ok, but then I think the bhi_vec_entry struct should be fixed as well,
> using __le64 fields.
> 
> Regards,
> Loic

Sure, I'll fix that. Thank you.

Best regards
Alexander Wilhelm

