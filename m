Return-Path: <linux-arm-msm+bounces-31128-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7195696F665
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Sep 2024 16:14:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D9C00B20F05
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Sep 2024 14:14:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DBEC1D0140;
	Fri,  6 Sep 2024 14:14:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="FEaK7rX9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (mail-bn8nam04on2057.outbound.protection.outlook.com [40.107.100.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97F7B1C7B93;
	Fri,  6 Sep 2024 14:14:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.100.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725632056; cv=fail; b=IfRS0bQ2dStFe7e3ORdDK8wlVDYpLQ/ZBvW/Zwb03ltDDQDcJuxSPWroqky+eeSqgi15GaBvKlndhSnwKe5RRx3oeHR1EO+53YcXXUaJUVrEN4q5Hh+Ei90VnECdM8lm51Tx+i9C74UyyqhRjNdDB3w6QK2ceOXKDQPL8YdqoFo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725632056; c=relaxed/simple;
	bh=nozGox9f5D9OWq7XXQajIYiEACPuQb7GJzhrMrgm0Ho=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=TTg7b8mNnifgijojFcjrqpdkW9rQDHiS5pSAFhDQqON1d2IPH70pRpjERSf0YBncCILFCo7SvWLLY9WZC/M2ndIDDa/2m4293G8JHR+s7EYgGO83daMz7ANC9pyKLwtS5t/aICKwCDvoXAUzaOmRu98HOsUYbnQuwylxVBO2DcM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=FEaK7rX9; arc=fail smtp.client-ip=40.107.100.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DrgDayf/i39KhCsylXjAuX780Q4mhnmV74VmPG7LN+3gENT9Mdl/aEy1wbxvYuHXuCzInea6sSUHgGqrqckg7B4KCJNZNelTHvv3hXPCawsLYejst+fDXQybUNYIaHGYeRdtGJcrBZO34rPJ3KZOfd679esVZhfg1AjHG1FDF72+5ku9cW5QV5TBYDyl68vtCBehj3kEF8BWA3GbgwYcFKkaryZgjy7FI5vcXNcd7VTJaj/w/4seF9lzvunIPg+eBL2QaoBWk7QrFSRwje4yv/9Gx35gPhlR1SxylQsN275Iqqy/nXeeIq/XGR+1IR+PpVSzuDII1B7Oid4cblOPhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NhofM1l3nKPCK0DDiD4bhEn+SDzr6Ctg9U2+HTIHRoI=;
 b=ragfnRc40i+A+wbxuDq7TMKg6yP8NFPFRhS9Dn8P2DManMgohgGXsxITWc2XS0Yosvl9D4k8Gi2KOTLbez191Bq5+DghCEsojfIR2qxZY3lSkTvkkG9Du1LH9BtOJVmY5kB+WnjiaHxyJA7m98mUuiwL/TS8h2dzH34DiGnD41qdaggu7yHnLiYiXD9PLQCcHoTRmW2JYVumEgxFeUWb8GAgLDdp6ccyJKELq5pXvY+SrjCfVLFCQXMjoekPSWVkunD89Bm8MKdm4cttd1655+8Sq9/bzgrVidA+v0a1NdPawpp0ORfQynlh8zGbDis+UknGbXCt4k7SxYk1AOBitQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NhofM1l3nKPCK0DDiD4bhEn+SDzr6Ctg9U2+HTIHRoI=;
 b=FEaK7rX9wL4M1q20wxiqiiyAC7osVfzlc4G1qJZm2/e0EJRT2cFHAnTUU75l0+tPteX/piQmcGAYhFeRYv8f9ZulDris9PAPAa097UR4jcjp/6ILB3bnHGnj1Ji/f5BonA1gUA2eU3ZO7iNHO6zuVr20MT5fE7Al0H9RtE5189fk+eafHzVQmMUpLa7a3dAsDbSW8RFbPTSSMWnZe5TpucXS2A9KGyKN8i8nNKlH46Vz6fmv1t7FJ8q1FkFuBfLCcaf/4qu5vXjYpaFXkzuuAS8HeMo8/DnD2EcKJ/k4cq8Hhs6NuMuTubXkz8vNt1wnfKJHAQxjWvlozr2ZbEOXiQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM8PR12MB5447.namprd12.prod.outlook.com (2603:10b6:8:36::7) by
 MW6PR12MB8867.namprd12.prod.outlook.com (2603:10b6:303:249::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7918.25; Fri, 6 Sep 2024 14:14:11 +0000
Received: from DM8PR12MB5447.namprd12.prod.outlook.com
 ([fe80::5f8:82ee:7da9:219b]) by DM8PR12MB5447.namprd12.prod.outlook.com
 ([fe80::5f8:82ee:7da9:219b%4]) with mapi id 15.20.7918.024; Fri, 6 Sep 2024
 14:14:11 +0000
Message-ID: <fdeadc0c-7f8d-4547-8703-c402bf06e495@nvidia.com>
Date: Fri, 6 Sep 2024 15:14:04 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3] clk: qcom: clk-alpha-pll: Simplify the
 zonda_pll_adjust_l_val()
To: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Bjorn Andersson <andersson@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, Ajit Pandey <quic_ajipan@quicinc.com>,
 Taniya Das <quic_tdas@quicinc.com>, Imran Shaik <quic_imrashai@quicinc.com>,
 Jagadeesh Kona <quic_jkona@quicinc.com>,
 Dan Carpenter <dan.carpenter@linaro.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 kernel test robot <lkp@intel.com>,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
References: <20240906113905.641336-1-quic_skakitap@quicinc.com>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <20240906113905.641336-1-quic_skakitap@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0600.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:295::20) To DM8PR12MB5447.namprd12.prod.outlook.com
 (2603:10b6:8:36::7)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR12MB5447:EE_|MW6PR12MB8867:EE_
X-MS-Office365-Filtering-Correlation-Id: 467afef0-4061-428f-a059-08dcce7e2dad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZGlHZFlNNlJQRkl5OG8yZmtlLzJqaDRwVW1ZZEk0R3JoTldYN2h1WG52akhX?=
 =?utf-8?B?NnZDaXZPK014UE9oQ3haMnhLU3ArU0V5ZFlFZWs4aVV4L1Z3OElvZ0Q4LzFS?=
 =?utf-8?B?cWVnT28wd01NVTVhWG9NZFpUQjIyK0dhWS9DeFloSFkvbGMrZjBVTVRCa0dF?=
 =?utf-8?B?Qm5rUVd3RVd6OEp2Qm8vTFhpUDJETmdrYnFyclYyM2I5RVUvMER2WVhGY0hq?=
 =?utf-8?B?eHJPL3ZRNHVnRkNpc2dqaWZUSFc3dDNEdmZOSVMvYUszTXpjZEJPWi84WER2?=
 =?utf-8?B?TXhFNEdlRnNGbW1adkxnM1JJSlJkT1l0UWYzbnRpWG9xTWZ0YmxENzZsSFVR?=
 =?utf-8?B?ZzdQQjI0UGdFZVlFNzl5YUJhaXJlVkdMSHVPSkZuajdrWWIyN3h5YWUzR3k0?=
 =?utf-8?B?aFcrOVh0eHplYjhqWFNaWnpFVGNLWUNyR2J1cjRCUmJzSkpUcVpvRWFhWFVh?=
 =?utf-8?B?UDRSWCtkMVFlb2JtZGVZbytIZ2NyRU5qYXVGK1RVSG4yRSs4N0ZESllhemp6?=
 =?utf-8?B?NFJRUnAzamFldXZIOFlhRWhlUFl0SDlWcGI1QlJERmtHQWNqVUYrN2dydkl2?=
 =?utf-8?B?M3VyT014SnRpdjZVY09Ic3MyS0kzWFhKdU5JVDFKMlpOVmJPckUrUk54cnVQ?=
 =?utf-8?B?WmMrNEdQdlVJZW9xYitFRzJWblFQTXAyM01xanRrQktybVNpSCtsdTNqb3Fa?=
 =?utf-8?B?d2liQjVXeElnK1lVMStrVDBlUjM2NXZ0SDZmZmc4blYxTlc0UHp5MEhmS1pD?=
 =?utf-8?B?TW02N1B6ZUNEdnZDaVZYVUREaGZiaWZGKzdWMEVLcXNFUTRWNjNNVUtqbko5?=
 =?utf-8?B?WEd3OVRWSythWmlvbDJqWDhuL2lMTkNVWFFFL3UrSWFqeUhadk5RR2tmcnBq?=
 =?utf-8?B?ZTRwNFp4S1IrblBaaHFHRGtOVGx3eE5qWklnNXdRSHAramM0RVJyd3VQekNN?=
 =?utf-8?B?eFQ3Z3J3c1ZZbnBHVENwTkk4OU81emZEOVUvcUNPMFVYTHl4cnI2QkhHMTJ2?=
 =?utf-8?B?MjczaVlQU2NGdzZqMG1zMmxoY01IeEJZTENsUHBFMk95QXc0NE52QkJYSVZZ?=
 =?utf-8?B?bUxSQ3I5YWFWZFJlR0pXQk9GbFY0UzEvVTE3M3RtbUFyRVVWRG1PZ1J3TjQ5?=
 =?utf-8?B?dkllT2kzL1FhY2pMdTIwcnh3aVA0RUxsTEs4ZGlJM3lxb2llTHg1R2pHaXU2?=
 =?utf-8?B?aGliZDBBWDZheEMvYTNvTkdqaVBzSXVUTk05S2hzOXRRZW5lcEttNTdTeE8v?=
 =?utf-8?B?dkROQVVqd05mT0JxYU53bmMyOWd6eFhJWm8zZUZ3c1BLQytPVEZVVUY1ZzBH?=
 =?utf-8?B?d2dEendrVjVLZmhFU0plc2FxNTVlWFY0TGtqczJSelVpMzcvWEFxWVFKOWlw?=
 =?utf-8?B?ZitqbVBzaERTWDBsVGtzSHV6SW1Ub1JaR0U3QUNwTlRMQWErMEVocXRDbzR3?=
 =?utf-8?B?QVpUR1hCdll1RkJzQlZuVG12YjNmSUthREo5c1ZnZ2xPNlRjRzRiR0tnZ05B?=
 =?utf-8?B?Q2xTdkxtcmE1UnVKa0ZtYk9pN3g5THltbVVwS1BzNTM1MklvalhsTkRwZlQy?=
 =?utf-8?B?R3lzeFR5ZHViMTEyTUlGTCtTanlQdUVGcmkyN2w2T2RweFlFYzVtV1ViNE95?=
 =?utf-8?B?TnNyZnVObFNZZHpmMkZxUjNJaXBaazNoYWRNUGZGS1p3STJpb2NXZ2N2SUtt?=
 =?utf-8?B?d0UrbGZyUXpvK1FneXk0SWVmL2dCSE9yVHpONXlxNG5ZNVpXMEtwUU9hVmlt?=
 =?utf-8?B?RlBNSzc0R0JMOEU2WnVHdUFRNU5pbWtuRG9qbExybk9GQmVCU0UyaXI0Nmov?=
 =?utf-8?B?NUs4WDFnNi9WbmpoL0JGUT09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR12MB5447.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UndXMEdYKzl1WXdpWU1GL2hydkhrWm5rTFU0Mm5Vbnk4SVhDQTFuTmFZK2Fl?=
 =?utf-8?B?RVlzREVjZmtvaTU3OW5zTjd1NlFDamdEalYyZXRmeDZ1RXgyUHRWMUtSb2hX?=
 =?utf-8?B?VWJ5S0ZnUC9yRVNuYXJDUHI4TGg1b3hHL1BaTGpoWndKZXh5bDEyVUNYSVFu?=
 =?utf-8?B?MUI4Y2pQZWVuaFZia2JwYTZyeFZrSDNEUHdHZ3psOU9QSjd5WWxBRDdqTGZU?=
 =?utf-8?B?NGJvRUZodDlERVlmd000aXJkTGkwTFkyWEt3ais5WnlNRFBxL0E3OEtKNFlS?=
 =?utf-8?B?RldsbnZIMnhFV2w0SDJKaDJGVnhDTCtDNUo4d1J4Si9IcExmdHlaT1N6UGU0?=
 =?utf-8?B?NUJNR3ZCUzBDYlcvZWNWM2xqcWg4RktlN0hLblR4QVpsSnlHOG40MG90dVNt?=
 =?utf-8?B?TThuUnRFUThZY2lUSHNWbmdpTDB1bXcrK25mejZ4MXNGcldLWGNKcmNNSVJK?=
 =?utf-8?B?b3NOakxEVDZFZldNL0FUZU9Oakc1SEFLYUlGUFdFUXFyTndsUkwxT05NeU1p?=
 =?utf-8?B?SjhqNzJ6c2lxQjBnL2NwTlRaSDMxdnpUTUVBTVYzU0F3b21qcGtLaFVpWEVV?=
 =?utf-8?B?NUFDY3VuTldBd1I0d3cvL3h0ZlJiTWJCRUtZQ3hLbGIyL0Fpc3ZWcVRkS042?=
 =?utf-8?B?UkZZNytEcWRJakU4WjRXVzlBY2dyMzU5aFlzWDhMQlRacFBpTTdmTE1kQTFT?=
 =?utf-8?B?WmNXVmlmaExFNTArTVZ1aHdGRGJVMmxqb1RkNktsZk8zeFJYczAybTJDalA1?=
 =?utf-8?B?bGg5OFZhTW1DUU05cGZiYW1CN0NwSUV6VlI3M0tyLytnU0Q4ejV0VWRTVHdH?=
 =?utf-8?B?dWlYNWpROE5PeU81RkpZL1c2NkVDOTM4WUszdkFpU053ZXpsaVYwc3ZMbkFo?=
 =?utf-8?B?NzRzd0QybmJPR2VlZHphb1ZBK1dCTVRYdkRjU1lqV0lNVWQvRWVCUDlrZkFu?=
 =?utf-8?B?ZzRGQmlNMHk5OGZuTTlhR2U0UjVBNXVMTW5kdlpJNnVsN0ZGaFJRWlh5emJk?=
 =?utf-8?B?UGtRdVRZRnFySHlTZWMwY2tzVDBDc3lFQ2ZFS2pESkgwZCtuaFVDVC93OVg2?=
 =?utf-8?B?SVkwMUNqdGRlUXlrMmxCS2RJNHl6Rnh2OC8zb21zcXhmckY3dkd4Y3k5NjZ3?=
 =?utf-8?B?Yjg3ajZLT0ErME1wcHJEblkzOVFpdTJXODJROVBQOUJBOXFEN0QrYzRieUtI?=
 =?utf-8?B?bVYzVTRmY0xqWHN6c2htY3l2TDRYamZ1Z3NoaExoSmNRS2VYOTJsTUYrYmsy?=
 =?utf-8?B?VllJSW5JSmxHK3B0b0VPQ0hlZXplZXBDZ2YvaGZ2Z0JHc09Gc0hydzV5eml0?=
 =?utf-8?B?b0tIUUNmdWRHV2ZYcS9xeWtJYUUzL3ZqM2FXejh6YklPU0NaK1VBNmlBaUpl?=
 =?utf-8?B?Uy9oSnIwUVZESWhkVlZJUHd2bXE3QUtYZXdGSE5xblZLVEZMNkZ4YWdTZmZr?=
 =?utf-8?B?dDEyU1pqa1Nwbmd4dTk3WHMzc1FyeXBaS0hibW42ejEvaWtoU2VZbXU2Wk4w?=
 =?utf-8?B?cFYyQjlBSjFrYU9tV1RhTEJ1NVJiZmdpa2xTVnhiWVl6Y2R1cko2WWtDYWJH?=
 =?utf-8?B?ZFZXb0dlOCtVL1BmbTM4YnFnQWV6QS9tNnROZjZZYy8zQTZ3V05jMXJLRG5J?=
 =?utf-8?B?ZGQ0bmN2YmRmMUI1Yit1ckRoT2RYSkhCVUd6MFc0TFVMRGZkM1RkZ1AvRUp6?=
 =?utf-8?B?ekVzUGgrM056YnduQjk2UTR2UGZma1NsOGswbUtRVW0xYjZPYko3ajUzb3Vm?=
 =?utf-8?B?TGhuRmRJQk1JRkN3SEhtM1hOZU1uSm1zNGVaUlBUSVlwODB1NWJZOFUyclhP?=
 =?utf-8?B?WG5JVW0ralNPUUprRlRwSS90ZU5oZ0RQdW9TWU9XUDhvYmlVM1o0enNFRE44?=
 =?utf-8?B?Z2MveG1zRXJSdEM4QTB1b1dCeW95aXpOdkthc3l4S0JobEJROUsvdUhSOUFL?=
 =?utf-8?B?MzBGRkwrYnlxd2FueURIQ3VpSkQ0WVlNdXBzYXBaODNNMUlDcTl4Vjlpcmdh?=
 =?utf-8?B?bCtqdldoU28yRFZ6NVJ5NVE1VXJXZlNTL3hwd2FmUSthZEFjSHgxRytQeEc1?=
 =?utf-8?B?K2RqNU16Y0ZzRTJWYWdXaXk4WEFNcVJOOTE3TlUycjhEQWVLZjFJUy9VNzdW?=
 =?utf-8?B?Yyt3ci9IWG9kVDEyazVQaWRGSks3MUpsODdzY24reEZnclF5WHZaVFlkakh0?=
 =?utf-8?B?cGNqVndScUY1ZWt3eUp0R3ZDMGhrMWUyM1o2dzZzRDBkK0dkQ3VXWHFlV2Rt?=
 =?utf-8?B?RVcwWS9Ia2FmWXJFRjM2TWp5ZTdBPT0=?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 467afef0-4061-428f-a059-08dcce7e2dad
X-MS-Exchange-CrossTenant-AuthSource: DM8PR12MB5447.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2024 14:14:10.9428
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EC+8IV3KW/WbOHzXSiwXZ9N5g1HIMXSWG1APCSNYID9fNsELPKcebBYPOspQKDRUno3BVjBQUt0BbKA5s4rp3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8867


On 06/09/2024 12:39, Satya Priya Kakitapalli wrote:
> In zonda_pll_adjust_l_val() replace the divide operator with comparison
> operator to fix below build error and smatch warning.
> 
> drivers/clk/qcom/clk-alpha-pll.o: In function `clk_zonda_pll_set_rate':
> clk-alpha-pll.c:(.text+0x45dc): undefined reference to `__aeabi_uldivmod'
> 
> smatch warnings:
> drivers/clk/qcom/clk-alpha-pll.c:2129 zonda_pll_adjust_l_val() warn: replace
> divide condition '(remainder * 2) / prate' with '(remainder * 2) >= prate'
> 
> Fixes: f4973130d255 ("clk: qcom: clk-alpha-pll: Update set_rate for Zonda PLL")
> Reported-by: Jon Hunter <jonathanh@nvidia.com>
> Reported-by: kernel test robot <lkp@intel.com>
> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> Closes: https://lore.kernel.org/r/202408110724.8pqbpDiD-lkp@intel.com/
> Signed-off-by: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
> ---
>   drivers/clk/qcom/clk-alpha-pll.c | 4 +---
>   1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alpha-pll.c
> index 019713c38f25..f9105443d7db 100644
> --- a/drivers/clk/qcom/clk-alpha-pll.c
> +++ b/drivers/clk/qcom/clk-alpha-pll.c
> @@ -2176,10 +2176,8 @@ static void zonda_pll_adjust_l_val(unsigned long rate, unsigned long prate, u32
>   
>   	quotient = rate;
>   	remainder = do_div(quotient, prate);
> -	*l = quotient;
>   
> -	if ((remainder * 2) / prate)
> -		*l = *l + 1;
> +	*l = rate + (u32)(remainder * 2 >= prate);
>   }
>   
>   static int clk_zonda_pll_set_rate(struct clk_hw *hw, unsigned long rate,


Tested-by: Jon Hunter <jonathanh@nvidia.com>

Thanks!
Jon

-- 
nvpublic

