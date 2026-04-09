Return-Path: <linux-arm-msm+bounces-102486-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OLMBMaGR12k2PwgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102486-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Apr 2026 13:46:41 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 635DC3C9D1F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Apr 2026 13:46:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 361EB3025911
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Apr 2026 11:46:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D78D23537CE;
	Thu,  9 Apr 2026 11:46:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=axon.com header.i=@axon.com header.b="EpnnZ5Nl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011037.outbound.protection.outlook.com [52.101.52.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B6583B95FF;
	Thu,  9 Apr 2026 11:46:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775735189; cv=fail; b=I8gjrlCFR6oOFsjIs8wk3xA3L07flKnYlPuIGj1nTQRRGC+tijdnYR8OZ6wd3b9tjBbxhgmbs01n86+wAO2iOojgXgClymuCCV8F7SuGgVAN3+dp5Tmn2JB558HoV5cBnf/qREP+jDdSD2fL1jMsqJUZ+dkYitZm1+kwCxS49JM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775735189; c=relaxed/simple;
	bh=9/tm0AgXJqOiepFfJ/NsyGwDDD0wue+KlYUjYhnxwH8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=PtUPCC/7QTGoIES6+viiG0Hm4Qmj3E7OO4ND0E37oG1gZScm05VudxP2x681UJ1BMxZU9mCl0vQVzzuKVrf4FQfgbxET4Rz8Q+oxxUQsWlYQyjuC0SJlERi6vUjH+1MJUKUhBi1lnKLXu6K9N2IcZkFtflUzdsQnT3Dkh0uTSaI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=axon.com; spf=pass smtp.mailfrom=axon.com; dkim=pass (1024-bit key) header.d=axon.com header.i=@axon.com header.b=EpnnZ5Nl; arc=fail smtp.client-ip=52.101.52.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=axon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axon.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q3ZmXJxjQMrjfuUYjZlLfct7JNe0SccHV2YVPQL5uSAhMqS8eatkwC02pd6kkNSjLjA/lcZLX4Rl0CHgbYaPQ+hc/g764PQ39g0Rsnavis/dnzuTHgEOtqNSzsfEzwXb/Z7eEhyHWyr1qSa+MTp8t9qr9vTEWefHuehsmtPDW+oWvpbwO3Rhsn0/RqUaTRy4rEP28v4l8qqPag3/ASrlDFsrhCqmpSL/fYU5MKxaX+bJCiBVEySTVfbiAvtpbaVShKz5IUvDEyG2fHzF8tobkYquFvIT0WHsTFvxPGZQg31GQW2gPil2Zu0K8Od28ZH/bToXNB0Mc8BpMzO5cFmF0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=10E6iLdq9MTxqp60vcY0Sv2VqQGEzjIncnH8bq9YoRg=;
 b=tPt9i64tRdFAEyeNo07cBaNIkqnsAWfSR+w/o+791ocUdvlcwVu1Bclwp6fi+mv3N00mWaVZprWihn+dFRw8h+L6sBOxGy5JLY8WpliJAD2QoWED161z4Uz4fPVtjihIAOIUxMRDwV02j4Qt4uowXkbKf7y5YjtjhJvCmogjaxSiMae15aZWknVR+j2p4eFzrJNcGT75akZHyIU308AagaX20zq3UJHWB0Tlbil8cmRRQphXIf7HfCvS47CRoW1N720SNuNUYO+pcSCsmN/c5CGkHBMoa+ULBxSTjZHDlbrdfDrFVfm57eHjQ5NiRi9rbE3C0UKVN97KBXuKme8svg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axon.com; dmarc=pass action=none header.from=axon.com;
 dkim=pass header.d=axon.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axon.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=10E6iLdq9MTxqp60vcY0Sv2VqQGEzjIncnH8bq9YoRg=;
 b=EpnnZ5NlYC280e8TNOKZlE4c/XXPv8oDDPVlCslrr78QX5d4B4Lbx+TSinBGmf9mPVtGA9JwNRn8x9ItxCAJH7U9FB6ULl5Egjv6Nr6J+2wFjP04LzSTbO3Q6TmBrlLA0HPTvf3AV3TRC268CWYAPNzCukj75jCBvs0csuRdMv0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axon.com;
Received: from SA2PR10MB4524.namprd10.prod.outlook.com (2603:10b6:806:118::8)
 by DS0PR10MB8173.namprd10.prod.outlook.com (2603:10b6:8:1f9::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.15; Thu, 9 Apr
 2026 11:46:25 +0000
Received: from SA2PR10MB4524.namprd10.prod.outlook.com
 ([fe80::f41d:e38a:4741:e76c]) by SA2PR10MB4524.namprd10.prod.outlook.com
 ([fe80::f41d:e38a:4741:e76c%4]) with mapi id 15.20.9769.018; Thu, 9 Apr 2026
 11:46:25 +0000
Date: Thu, 9 Apr 2026 12:46:23 +0100
From: Joe Sandom <jsandom@axon.com>
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/5] arm64: dts: qcom: qcs8550: add QCS8550 RB5Gen2 board
 support
Message-ID: <20260409114623.u4zyacth7g4eo35d@linaro>
References: <20260404-rb5gen2-dts-v1-0-895f8fc494fc@axon.com>
 <20260404-rb5gen2-dts-v1-5-895f8fc494fc@axon.com>
 <ehlhjfzekjnscro4ffydjhzfuiqhfkuyuxrk42x53cturzi4do@74y5k5ee6bv7>
 <20260407113925.4imd3lxkcrq47pu3@linaro>
 <25g2sasffiq4axsamv2m5nywieucj3vbwfhvn66jtzjxoodfxx@vkswsycqju6g>
 <20260409100455.foytyzse3k5ty55l@linaro>
 <lusy4sd2q22tvtvzgbb3pbpxauy5ym46ojjtpjq43wyzn72yxy@uxcggqladbnl>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <lusy4sd2q22tvtvzgbb3pbpxauy5ym46ojjtpjq43wyzn72yxy@uxcggqladbnl>
X-ClientProxiedBy: LO4P123CA0664.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:316::8) To SA2PR10MB4524.namprd10.prod.outlook.com
 (2603:10b6:806:118::8)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PR10MB4524:EE_|DS0PR10MB8173:EE_
X-MS-Office365-Filtering-Correlation-Id: 140d7ada-fe85-4ac7-cf73-08de962da13a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|366016|1800799024|376014|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	mXVQB3g35/UarUanrLzN8p0k/K8q3fangZSjBvblT9EyK1QRX6MW7SXTq0fBqAM/Sj21PRsMiz0/g1PTFjZ1Y0E0XTWBzaM7gp2lCnoJPEvRRSHbe63t2UaCYBk9h+UlRpfMaElBlOtAXGZrve37jDYUKGhpbG/vSCatV7jniXgj0fY49XjMEsohxFgeaBpPbOECg6UlMFKC4uxgpcs51b6PUkcBYcRlmfKWG/6R2HZgq2KNNG1iKGUBDC1iwQmn0nxcflr9EYiWxdAh+wDTD7d3G4L0np71PJue0fkJBwMR38u2AtlLazpoDx7yxl4lf7OxEYI2DoAJoYNJcqBV6SSwsm7VHW7oktc/smWIyjfoV9HnrXdmJp3V2K8MX9WJdbfsiUamvz8giPxepN7SSoKdEzY88hqIGJLpSNFIlT5xvI0G1bjGClpHJWysslb5WMkEH4yPqu3dK/K6zngHLQNN8pIUIlk0RoYjJ54S7Hld9tOjEhmZwqjXIM75r7d9XM7xlZ5VSi5Vg6ql5VaTyHr15sYu11M9LZnNenPOm2qlA1m7T1YTwGv3NGQ1U2x1rnBcOLzT0ORYrR0AuY086QnBNyqBTBjGRhZI9+T/1B1hmQfG3FEj18ZJTpe1n9bsJsjO/phfLa/EbR6GDnlYNUOq6IC1DQDxVkCaWBu+eWlksgL22KAzrF2WxdSVxsQhHFO8hcUstBtywfzB5srWv4aHep4nKUzEGWTbk3YmWhI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA2PR10MB4524.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(1800799024)(376014)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bTdKREZDLzZoajBNNTAzNUQ3cUN6dUh2TEdvSzBhdzF1em1CK3QvQmRrNjdv?=
 =?utf-8?B?dVc3VXg3V1RHK0o2Q3dGYnVqcngxeDAwNDJJNlI3TUl0OWxUVnFFQ3p0Tm5m?=
 =?utf-8?B?c1pZQmJURGlQc284Z29MZWZXNVc0VGE1MHIvSDhYVHp0L281ZUM5UDVMUXM4?=
 =?utf-8?B?QWN2M2F3VVJjS0Nyd1NjREN0N1BaalJMbjNWUFpObCtuVW1jZmJjR0cyN3JF?=
 =?utf-8?B?eldSWWV4RlhKRThwazJCK0NNaThOZWQ2dE9ZY2hCYzdtY0FVU1BUZDZ0TFdz?=
 =?utf-8?B?R25sc0pBQmxvWWJ6R3VyMit4b0p3dzY5WVRkM3hUQ0dwRkZETzY1R29kbEhx?=
 =?utf-8?B?WTYwclNNblZTbGh0MVg3RHdrOGY0Ry84QlFxWjByOXhmdFR3L0FBRUJSa2tw?=
 =?utf-8?B?MnZLTWlwbkIvaWlVNEVueHRVU3BSRmpiQXNnWFJsbEJIUCtsWDFMWEpTd0pL?=
 =?utf-8?B?TnFHTW1heDF4NnlUenVDM2Irdi93UVFwYUhVUlNvV2QyWXlscmxTTnRFRURQ?=
 =?utf-8?B?Znd6SUdQNEU0NVlsV0N1N0FnKytkQjRsS2tNYlA3MTdYSkdLYkRFWU0vM1lv?=
 =?utf-8?B?Z0Zoc1RyYUh4M2dNdTVKSTN3UWNsODVNVDRpSWZxMDNaVXVIejY4V04wNXQw?=
 =?utf-8?B?dG1QWkdYRTc0K2FMalRKU2FYUWh2cDNUVHBjWFpEWloxNk0zQk43cHV6M1dM?=
 =?utf-8?B?WlB5MCs0Y1loTnA0SFB6WFA5bzY3TDNhYzFKWS9hdVJVSlcyNWZ2bWdoWVNH?=
 =?utf-8?B?b0VnbXNnTzdTYmM5cXNObkZWNUFlMnpONUYwU0VUa2hTSEJKMDBrdTdHNDBC?=
 =?utf-8?B?MmI4K0JNY3poa1AxR3NvTnVzeVVDWjc3SjVzYjNqMFNSR1IrbmptS0UycFpk?=
 =?utf-8?B?MGU4N2FQdFV4bi90OHJqeXppNlhaOUszNjlQR3dIbU9oNGxMS3Vqb3BwU1gx?=
 =?utf-8?B?TkZXMk9QbGJnUFFmMjhBWktqUitXVzA3QkpuSngvU01qQnpGNTNaVUZqMjdy?=
 =?utf-8?B?R2l5UXVrdGVTWkRXZnBrc3BtY01adGk0R3BmYzArNjlnTmlQR0Y1eDcxSUtG?=
 =?utf-8?B?UVFzUkRzMFNIL0JoRW9MVkpkRFdxQVMzUnp5SytONGhuSCtzbHFhckZQM01I?=
 =?utf-8?B?dVFmZ0wwNkU4aFhad0YzMytkazR1eEpjdVJWSGorcmY0NUhIdGg3VGY3SlB5?=
 =?utf-8?B?SmwzUHRTZEFkeWRKNytCQ0U5UnZEUXhKOGIwc3NES0IwMTB0UVFHNFRlRStT?=
 =?utf-8?B?NVdCMzFac21NK0JFUmRYTTAyb05KQTZoMi9IK3BWTFV4Nk11U1dqdTFPYVVj?=
 =?utf-8?B?QlQ3TjBaVTRzQWJNcFdyMWZsemk3YmdFanBJZmJRNUFJL2gvUDF6QjR6aU85?=
 =?utf-8?B?bnZXdjFGcTl0V3U2VFlCOHE4ZVY2bWQ0b2R3cEIzcGYzakhnK2dLd0ZtVjdI?=
 =?utf-8?B?dU5lVmlCUEpxVXB4eGxJMUZTY1lGZitlNWxCNFp5M2pxZGVLNVpJWlpHZ28v?=
 =?utf-8?B?dEY4WlZHcGd6NkxMczhja2J6QVgxNVF4OVA4TURKVVdmelJQUnEwWFNCS2F3?=
 =?utf-8?B?VDZOaVdKRnZ1M01zZ2h2L0t2SmRNMU40WHZuditxTWJLVkVLNE4vT3JMeVZZ?=
 =?utf-8?B?MVlUUStkMjBLUUVDMmtybEdRUHdWQXdnU1NGdGZqbGlIWWpUN1pnb0dVVmcx?=
 =?utf-8?B?Y0RjbnZWWm1JVU43UHJlRnc1eGYxRmVHSERwTUcvMmlEeHZGRnRNMjJraUF0?=
 =?utf-8?B?bVlGRW5jMlYvbEZxbEtDa3E4WTBTSWMrN3B1N1V0N0lWR0NBMGswWEg3SlY0?=
 =?utf-8?B?bDJFMTNlcVVZMVRoNWZjL2hRd29mNSsvd3NWVUhaODMzcW9Qc2dGeWdvSTJX?=
 =?utf-8?B?RDRHelI4K3g3STdxdkVoRzFWVGZSWEwxVUVweU8zZTIwVUJZWVMxbmxVc0ta?=
 =?utf-8?B?WjN0c3JEMTIvRDJaZ0JkeU9OSHNzSWZGN1hQQi9PWldhbXBwMDc1QjRSczdN?=
 =?utf-8?B?L0xYNDhIbUlYYVB0QmNvc0ZOZFI5RDZZOTF1RkYzNnAwTmtuL3IvVW00cEta?=
 =?utf-8?B?aFRaMTlNc1NuZ0JlekNNWWZ0NUNyYzFpNWFSdlQ5dGNmVStPdHZJUE1JZGVQ?=
 =?utf-8?B?eUZVVm9GUmh6N284VEEzcE8vdFl3eHNaS2hNN3pZVUxMWi9rOXNpU1Nnak1y?=
 =?utf-8?B?REpLWitHd1dyV2wzNUVjQXNncU1VNGVOUEZOaW1EVFRsWWVFNXZSL0F1V1Nh?=
 =?utf-8?B?NE9qdlp2WTlrL1RhNEcwcHlVMTlCTEZQUVNjWEhKWmtBS2hUUlptd0FySHor?=
 =?utf-8?Q?EpByfaaZUfbBtcOd6y?=
X-OriginatorOrg: axon.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 140d7ada-fe85-4ac7-cf73-08de962da13a
X-MS-Exchange-CrossTenant-AuthSource: SA2PR10MB4524.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2026 11:46:25.7670
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b575368d-7461-447d-a9a4-f90f22962981
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nBRsvMVY6NKv0lcS5T9qjLetpLaQRK0UZh1Pqw7FX2Iod8BmtpNXcc5xFM7Lyv7L3NVFUZBxsTKHAKcFE0z3jQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB8173
X-Spamd-Result: default: False [0.34 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[axon.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[axon.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-102486-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[axon.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jsandom@axon.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[axon.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 635DC3C9D1F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Apr 09, 2026 at 04:56:06PM +0530, Manivannan Sadhasivam wrote:
> On Thu, Apr 09, 2026 at 11:04:55AM +0100, Joe Sandom wrote:
> > On Tue, Apr 07, 2026 at 09:44:34PM +0530, Manivannan Sadhasivam wrote:
> > > On Tue, Apr 07, 2026 at 12:39:25PM +0100, Joe Sandom wrote:
> > > 
> > > [...]
> > > 
> > > > > > +&pcie0 {
> > > > > > +	wake-gpios = <&tlmm 96 GPIO_ACTIVE_HIGH>;
> > > > > > +	perst-gpios = <&tlmm 94 GPIO_ACTIVE_LOW>;
> > > > > > +
> > > > > > +	pinctrl-0 = <&pcie0_default_state>;
> > > > > > +	pinctrl-names = "default";
> > > > > > +
> > > > > > +	iommu-map = <0x0 &apps_smmu 0x1400 0x1>,
> > > > > > +		    <0x100 &apps_smmu 0x1401 0x1>,
> > > > > > +		    <0x208 &apps_smmu 0x1402 0x1>,
> > > > > > +		    <0x210 &apps_smmu 0x1403 0x1>,
> > > > > > +		    <0x218 &apps_smmu 0x1404 0x1>,
> > > > > > +		    <0x300 &apps_smmu 0x1407 0x1>,
> > > > > > +		    <0x400 &apps_smmu 0x1408 0x1>,
> > > > > > +		    <0x500 &apps_smmu 0x140c 0x1>,
> > > > > > +		    <0x501 &apps_smmu 0x140e 0x1>;
> > > > > > +
> > > > > > +	/delete-property/ msi-map;
> > > > > 
> > > > > Why?
> > > > I tried extending the msi-map to cover the RIDs from the QPS615
> > > > PCIe switch (matching the iommu-map entries), but this caused
> > > > ITS MAPD command timeouts.
> > > 
> > > I'm not aware of any specific issue with ITS on this chipset. At what time did
> > > you see the timeout? During probe?
> > So when I set msi-map to match the iommu-map entries, I got this;
> > [    0.000000] ITS [mem 0x17140000-0x1717ffff]
> > [   11.085152] ath12k_wifi7_pci 0001:04:00.0: BAR 0 assigned
> > [   11.115762] ath12k_wifi7_pci 0001:04:00.0: Wi-Fi 7 Hardware name: wcn7850 hw2.0
> > [   11.153632] ath12k_wifi7_pci 0001:04:00.0: MSI vectors: 16
> > [   11.252398] mhi mhi0: Requested to power ON
> > .........
> > [  101.596274] mhi mhi0: Wait for device to enter SBL or Mission mode
> > [  101.603098] ath12k_wifi7_pci 0001:04:00.0: failed to set mhi state: POWER_ON(2)
> > [  101.610632] ath12k_wifi7_pci 0001:04:00.0: failed to start mhi: -110
> > [  101.617171] ath12k_wifi7_pci 0001:04:00.0: failed to power up :-110
> > [  101.794431] ath12k_wifi7_pci 0001:04:00.0: probe failed with error -110
> > [  103.158872] ITS queue timeout (12640 12609)
> > [  103.163183] ITS cmd its_build_mapd_cmd failed
> > 
> > With msi-map removed, I got this;
> > [   11.469642] ath12k_wifi7_pci 0001:04:00.0: BAR 0 assigned
> > [   11.490059] ath12k_wifi7_pci 0001:04:00.0: Wi-Fi 7 Hardware name: wcn7850 hw2.0
> > [   11.497787] ath12k_wifi7_pci 0001:04:00.0: MSI vectors: 16
> > [   11.559958] mhi mhi0: Requested to power ON
> > [   11.567375] mhi mhi0: Power on setup success
> > [   11.693069] mhi mhi0: Wait for device to enter SBL or Mission mode
> > [   12.185946] ath12k_wifi7_pci 0001:04:00.0: chip_id 0x2 ... soc_id 0x40170200
> > [   12.482168] ath12k_wifi7_pci 0001:04:00.0 wlP1p4s0: renamed from wlan0
> 
> Thanks for the logs. I also checked internally and learned that the timeout is
> due to Gunyah limiting the devices per-port. On SM8550, it currently only
> allows 2 devices per RC instance to save the memory footprint. So when you
> connect a PCIe switch which exposes more than two devices (1 USP + (1+) DSPs),
> you'll run out of ITS mapping in Gunyah, leading to these timeouts.
> 
> So either you need to modify Gunyah to allow more devices per-port or switch to
> iMSI-RX which you are already doing.
>
Makes sense! Thanks for checking Mani, good to get to the bottom of that.
I'll leave it as is for now and will look into modifying Gunyah
separately.

In v3 I'll update the commit message to reflect your findings
> - Mani
> 
> -- 
> மணிவண்ணன் சதாசிவம்

Thanks,
Joe

