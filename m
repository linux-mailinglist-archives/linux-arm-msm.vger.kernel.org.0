Return-Path: <linux-arm-msm+bounces-56534-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B1734AA76DF
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 May 2025 18:14:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5DEF81BC1310
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 May 2025 16:14:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47AB725D559;
	Fri,  2 May 2025 16:14:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="tpA9/6dG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10olkn2015.outbound.protection.outlook.com [40.92.41.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71CA425D53A;
	Fri,  2 May 2025 16:14:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.92.41.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746202480; cv=fail; b=YmPyd8G5JTYhNH4o4kD6iex/02RIpcdJBZsVUeElUcj487qs+uAOAHt56szQiFBTA0x7rFoSb8Dj6Nx8JuTBj6l0AtdTsIeaVXUPIOuuNzLl8apfpAl2HPG2smT5BPe1SyIivA3csYkd72mi75Ozpfzzmtki05U7jPyAc/IDtQ0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746202480; c=relaxed/simple;
	bh=lIW1keRrT8hkoUBrA2Q1nQNZ/46FVT1KhW/V1hcqzh8=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=R8l2Gbidj8o61PeMm4nIrg2wNw4NBMWlEqPw/JlYQPZFVlvoFSSd8+qm6iCsRpoRcQqmVO7Oa2Rdrbz0hmPuRNqIYOHfS+7Lc+kPxfZgQoX2nOmq9w0MiJjeOzYSOUVLFCYSNdkiJQXxE60I/0gISTw89ikqOtKWXAH1PxsNvOQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=tpA9/6dG; arc=fail smtp.client-ip=40.92.41.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mvLAoi5fSZuTeU9poTTwVpxxlklliQC/WqQ4p87C+T+w4WX5fgekiS82dSaazn4SZtUQxQ2gkjUB+JVrXT/0PNRsZUUxPs6mbVAi3b4X5YV/En1w+0j7NABBrOntyarbBXDhUj2dOZ4JaT+nWLoyUTxhDlFm0jn2QwMFK1UkgcM6WGCsWw5BQ6ex6ScXY8ejty/3gWuB04goP5LKw2RnZG3B+Iv2UC1oyvJpL496Sg3n+urpRad48QF0kHubIyHdpg3xnm8+rl8755D60j1mpUuxHxenyP4wR1uHnDhHljNylZ1/onpxtAxhUnTccGKV3eHHX68ZJ3QBssQzuBi+gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Upetl6nSU1V7NevJc4nHYusQXk3GHMAntmSECxNL9wE=;
 b=FY8iwzvgT3E14Z1xUUFa9Wf2uyIppHEB0TF0wqaUvaX/+JySpKWvOdfvy9rR8Uu5qt/lSoXt8dK33QcBDgwYGSKFjLdaFuKkpSTr+szfcOcsYWoVAe3q4rWBJjTIDzusrp5uNkbnA02fIr57C9/Ixi63/IQ/OWfPOwOMlDxldhltxeFfblaqhe94tYL/p9TtlDhw3qjkj7IZRXY0k2lhGVnjbvXCnaXkuGXfCq2lv9htYbrs114fVByIEMvIuTPFktYaZUnkMTk12raE6DkGvE9PXnnhCiI2ULe/gUicTjWezCfJFF/5ctar2auU5BNJwSTlKt1PILiitT3tHJvdlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Upetl6nSU1V7NevJc4nHYusQXk3GHMAntmSECxNL9wE=;
 b=tpA9/6dG3pzPRkHhKF6ySrz2CkUZeu0jOUxZVlvTzd2zdfcZiq+vHbS3r3dFLxM84trsJ1ze9rDkE8TTDL7+wrHYsgxBVw7br5dolZeynF6Pbjuq2svopxTIK89WHCv15ethJBVQFWfqV5P8wTvirhTMe0Gcs6SdwDrk1zSJuQMV6nXwfo+/aAi35+eOoEtUbftov6/Nq5AF2yMaDVK8+a1FGzYke6DbkrAI/votoUuVIp72gUff/cYIVo3ZAsjdV6GqP93+2VYCbJ6/FbsCCue2g6Acvw3ZRXsDFJ0GBR0TTUSpita5KiltEixP/8+WL49qTyoahQSCtIagbplIKg==
Received: from DS7PR19MB8883.namprd19.prod.outlook.com (2603:10b6:8:253::16)
 by SN7PR19MB6587.namprd19.prod.outlook.com (2603:10b6:806:271::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.20; Fri, 2 May
 2025 16:14:35 +0000
Received: from DS7PR19MB8883.namprd19.prod.outlook.com
 ([fe80::e0c2:5b31:534:4305]) by DS7PR19MB8883.namprd19.prod.outlook.com
 ([fe80::e0c2:5b31:534:4305%4]) with mapi id 15.20.8699.021; Fri, 2 May 2025
 16:14:35 +0000
Message-ID:
 <DS7PR19MB8883AFFD49C5E9EA39B55E7B9D8D2@DS7PR19MB8883.namprd19.prod.outlook.com>
Date: Fri, 2 May 2025 20:14:25 +0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] dt-bindings: clock: qcom: Add CMN PLL support for
 IPQ5018 SoC
To: Rob Herring <robh@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Luo Jie <quic_luoj@quicinc.com>,
 Lee Jones <lee@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250502-ipq5018-cmn-pll-v1-0-27902c1c4071@outlook.com>
 <20250502-ipq5018-cmn-pll-v1-1-27902c1c4071@outlook.com>
 <20250502141730.GA1259057-robh@kernel.org>
Content-Language: en-US
From: George Moussalem <george.moussalem@outlook.com>
In-Reply-To: <20250502141730.GA1259057-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DX1P273CA0035.AREP273.PROD.OUTLOOK.COM
 (2603:1086:300:20::22) To DS7PR19MB8883.namprd19.prod.outlook.com
 (2603:10b6:8:253::16)
X-Microsoft-Original-Message-ID:
 <017cfcd8-b6ac-486d-ab9d-2a2b086ce227@outlook.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR19MB8883:EE_|SN7PR19MB6587:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c48c398-b0a7-4354-d676-08dd89946db4
X-MS-Exchange-SLBlob-MailProps:
	Vs63Iqe4sQlVobdhjoRt/HQUSkoYJhJhf4HU624keHtHHaBvjjYhq4Z3phjCXrpqtnKJcoonekfL0kYYOBNDoX60/b3njTZNgqE4IY90nMj6J3gySbIL8XmuOSU9HUHrHSXD1y6HpIYhn17wgownwgw/dgKTh1n6wT4my06yl2hE46yDBfApCfVsTYMk9ZawxR98Hr7uxQdACwOAO4AMVRMZRxDKQprMw3GDJCmJ1zCMSYR55KcYt79o/+0zy5NZ1JzZNa6p0v7zdhTgaC9jkBvCAbRDSDWgOOrG1kzdscRxceug8Bf0QgOXl5ePM2mlLFKgAdx1ZPtpQVhujOJG9AxDJVms9zPEZT5lxL0DI1r78bkISM4dA12icwkYOeYyMa3d87Md8wN7zLq5a7512JGHnqknTYKCZIT34AUaSFtePM1oRH3dudYcRIGhpRCtyxqXB5XUUB0faYjzbMcRiVWwPwZ8RIxkXY214cunFSF/0KJZ+ZGDRRWGD/LuD7jIA19IOk8MdVmIX5hs3I7aFdXbX3P5rsH+3rHbVTGNv+rjkZFO9CzjZ1D+yp4M286SIV1o6j0fSP0NlphX7K5p9p63miufNTgSH2+kDhzpZJ9eqR8qtW0batnPjaeVOmyXA0RtXW1T723mfNsJWNyPnWB8gVxeAQbspiYTIl6rzoa6woZ+rVYiKTMIwLTF28ZCLk1p6gOtmw0mTxSeICFnY5iMl9++9QrqcRzR+P9PRRs=
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|6090799003|5072599009|461199028|8060799006|19110799003|7092599003|15080799006|3412199025|440099028;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NTliZXBzR1c4SWZRR3JwWWVRdXhnTUlZRDNCeUMzd3pIMkJ6Q3p5aVhPemtS?=
 =?utf-8?B?TFVlR2VkdE5GYW1lS0IxRzVDNVUrdXhPdjhkLzJTckQwNlhDSEFGdENKeHky?=
 =?utf-8?B?ZnlOdGI3VWJxSzhyT3ZkNlZDNFA3SHZxYW5DbVlCS0p0bithVkJxdVA2RXZ1?=
 =?utf-8?B?ZDBHOVVHQ1Exd1NGRStUYVM2VGRLU3NZbitTa29aNVVIRkVGNHovcjVkSTln?=
 =?utf-8?B?dW9tSUY1QjE3OWxvazBZbVBqUWZHZDJxMS9OKzVyTVJuTW5KTnFpOWgxSzAr?=
 =?utf-8?B?N2pSTDVWcDN5SU1HNDZnbnQ4UVBrb1hqV3JFWitOY3hHWjdZcEpSRDZZNjhE?=
 =?utf-8?B?ejhZZk12bENoZENsY0VrcWZBaTZlV2pjajRYWGFiT3ZhRnc4dFdCcHV6Mmo3?=
 =?utf-8?B?NWJjMm1BV2Jld0FldmlldVJiMUNOYkp6Z3REUDF6bXZiUnRNZnV5V1lHSlNx?=
 =?utf-8?B?TGhvdjhtQXZTSjN3VGsvQkpRNjJBdXJ4SW82SDBwdndlUlB2b3hJR01kNDdo?=
 =?utf-8?B?MHltSTVPRGFsaHpIUEh4OVpBeE5IaVJha2VvY1FYVWpqVEl4VE05dGJDL0Jh?=
 =?utf-8?B?bU9UVnJneXNSRFpIWE9lTm1HbTc2aXRNM3FyTnE0aHc0WS9BMURZeVJwbXZE?=
 =?utf-8?B?Ym9LQlFxZWpvVnhUZkcwbmwrQS9zNmtIeWFzMktFRjBFaVp1ZmVpejI0YU8r?=
 =?utf-8?B?ZmViVmRlSzhySGlsRlFUbFBkUnlGRmIwV2lkSG1Gdi9tM3F0VUJuQVpmanlk?=
 =?utf-8?B?Y1RLQXBGVzJ4VWx2R0xibHcxVGJScW5yYXdUdE9UbHhLNjQrNFkxa0oyRGU3?=
 =?utf-8?B?SFJ6bEtyYktpUFJRblNlcmo5bkN3MGZYSlRyNjE1MkZzaVZvRHJyUlBCZHEr?=
 =?utf-8?B?RGw1Si84L0k2a3VvdDFvTk4yamdNUUFwSHVBOTRzOWlUcUJic2ZHTmtHYjF2?=
 =?utf-8?B?ZWE3czJqbWlpT0ZjdlY0ZTMyRWlDYUxlbVZycWd0bVhSRDJ5enlObHdtc3Zw?=
 =?utf-8?B?UWw1MkVlMVVNZlV3bTR2bk5ZaEhwSzh4eitCWjBYd0w0S2N0eWpXcTlNVXo1?=
 =?utf-8?B?aWkxS1BobGpRbU1YOUtaRjQwdE85ZjdRMDhqWVhnaGFKQjJNSHFvYk1hQ3RQ?=
 =?utf-8?B?K2tUVHdEWm02Y28wRHI1N1JpOWZnTWNJMFljb0hwL2hHdm5DbVplOHJLZ2cx?=
 =?utf-8?B?UHdKVTJNZUVNZGxpSU5CbWNtUmd1bTYzbGNEclJXdHowQlZ6K0dQTTFJUmhG?=
 =?utf-8?B?cnYzUzBRRVJFMXgxSUQ0NVBSaHVkcS9TdERvU0kycDV1YzJieWZOcnRlZElG?=
 =?utf-8?B?TmxmRUsyZEtveXE3WTFtbGZmekREcnpBWWg3QVY3MDBNVTJESWN3Y2xjY0Fz?=
 =?utf-8?B?YWdWQnNZVGFVNjlFYXlWN1dLWmlqNUNuNjMrdWp5VE9LRWorTGNOaFQzUC8v?=
 =?utf-8?B?YzJEQjIyTVc2SzFCTEpxeDg3NFdwMHIvenl2YjhTUWtQbkgwQUVTSzh1ZmJV?=
 =?utf-8?Q?Refdm3fnrpAO2ETrG3ThqYmuccn?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T2xSMHd1R0x5RDdRQ01xZG5peFNTUmFEUXpMUEloa2dmRGZwUGZBVHVkWGtZ?=
 =?utf-8?B?VDRVYTExbE5wTXlKbytzcUlFR3ROY21CTm53WGMvcjB3d0x5azlYd0tFaEZu?=
 =?utf-8?B?NGJTOWhnY2F5c0hKSUhYOWlqRzRRNmxTV3p1aVY4eGJtdXZnamJxam1iY1VZ?=
 =?utf-8?B?UDJnWEcwWnlCSXBXNmFiMlR5WDV5LzNrR3Bsd0hWYTZnUjFTNXhEaXpYSXgz?=
 =?utf-8?B?R1VMd2JtWVVLYVgxcDBzZXpXa2FOTUtZdzlBUGFoRXdMc2FZbk1MdVU5Uncy?=
 =?utf-8?B?SFpjVVVXRUhXNTRsTDZML29scmdXcVJQVEQ4c1NucGtmWDk1WndzU0dYeEtY?=
 =?utf-8?B?OHFhY3BYV2R4VjhLOXB5bm8rOFhMZ3daMmJ2cHdEK2V1QzAza3BoYVZjcXI3?=
 =?utf-8?B?dklJeStXS21OZXZEcS8wamFNQUJjME1ROTNHTWFEWkRtN2tUcHpXcThCWFR4?=
 =?utf-8?B?amVkdElWcndCeU1LY3hNZnZlSExJeG5tZGtDanI1SWk4VFJtaDJOVEdpUFQ5?=
 =?utf-8?B?QSsxNmUwVmwyV09DK0t3RDRsam1TWEY1U2s0NDBJWWlQVmR1N3pPVGszZGZr?=
 =?utf-8?B?dXlDaGNqMy8yVUd6ZXpDaFJHdUx1MzVWZW5BR1RRdHhSa2VKMnY2b0NLMUh5?=
 =?utf-8?B?Zm92RGhNU0JlbFFaWDJSM1ViM3Bid2RGeXY1RnoyV3ZRWFRLVzJNcHZ3U0hF?=
 =?utf-8?B?aGlCd2c3aW1VT1AvaDNqS2JkOVFOa1VxRVUzSTdKU2dhNW5mK1VHbHE5M1ZI?=
 =?utf-8?B?YWhjS242RWRyeURQMEdQcnl3a1RscE1mOEkyTm95NkFkM3pmdE96bXgvVzF2?=
 =?utf-8?B?bG9jb0pqUmprSTZZRzlFdjFwSEl3MHJiZVN6YmlHWW9hODI5SVdmY0YxNXpa?=
 =?utf-8?B?a3AyWjhsSWZDYWJya0N1RGU3QVVRekpmcnNmUGlzckt1RzhkL21wbm1FWmVk?=
 =?utf-8?B?VDNVVEZrZlUzL0RkcnlRNzVQRTZSOGRPUzZUMUI0T3FOeXp6bHVtNE5XUzhZ?=
 =?utf-8?B?T2ZvRm5Tby92U1hkLys4YWlpUFJzR3FxWTEzQjZ3djVNRWIraHV3MlhrTW41?=
 =?utf-8?B?MGk0MVRTZFM5L1pPVkFlUE1pbGNRM3lVWk5FRmRubUJmR3dENW5HTTYvbUNN?=
 =?utf-8?B?UUd1ZllYNnR0ZzRnRk9PSVV3eFFmcGpoaXdzWjFSUmZnOUNEaTU2Y0dFaU1W?=
 =?utf-8?B?UmtXMk1yY0hzVUZEMHFwVnNWbHgrZzJORTlmQ091MWZvWktXNXo1V0d2V1RS?=
 =?utf-8?B?T2F5dHBycWxEZlhWNkVEUVFvNjJ5SXhQWjBvNG1WLzFOdUcrMmk5Wnd1T2c3?=
 =?utf-8?B?cEJSUFkvM014c0g2dHk3RjVxVkpNUUVEZGxTYVlsSCtvNUN2QnJZMDFmUE50?=
 =?utf-8?B?MDRxK0NXSS80YU1CTkxYb05QcUs2dEhUb0NTYjVVbUN1WE1SV0g5Q2RUVXY0?=
 =?utf-8?B?TWVJbGFPWVliV0IrSzRDZXhYMWl6SDZoQU9sSmdEeWtid3hrMnVna3FEVXZw?=
 =?utf-8?B?RjNqQmgvZjdqVXBzYmFiZEFubWZ4Vk9WWUJGbVBDaUpuUUpLSjNIY0Zic1d1?=
 =?utf-8?B?UEJEZFFtU0N4MlZQRHpESldSSy96aHZnVUFnV1c4eSt4eERkVHVPbzRBZ0hW?=
 =?utf-8?B?RlJtR0FBVzRmcTcvaEFJM2FSZ0RaU3hJOVhvdWcyZmhLWDNGWEdjYWpqUTRZ?=
 =?utf-8?Q?Q6RAn0b9FggAEN3WbPsw?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c48c398-b0a7-4354-d676-08dd89946db4
X-MS-Exchange-CrossTenant-AuthSource: DS7PR19MB8883.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2025 16:14:35.1769
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR19MB6587



On 5/2/25 18:17, Rob Herring wrote:
> On Fri, May 02, 2025 at 02:15:43PM +0400, George Moussalem wrote:
>> The CMN PLL block in the IPQ5018 SoC takes 96 MHZ as the reference
>> input clock. Its output clocks are the XO (24Mhz), sleep (32Khz), and
>> ethernet (50Mhz) clocks.
>>
>> Unlike IPQ9574, the CMN PLL to the ethernet block needs to be enabled
>> first in IPQ5018. Hence, add optional phandle to TCSR register space
>> and offset to do so.
>>
>> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
>> ---
>>   .../devicetree/bindings/clock/qcom,ipq9574-cmn-pll.yaml  | 11 ++++++++---
>>   include/dt-bindings/clock/qcom,ipq5018-cmn-pll.h         | 16 ++++++++++++++++
>>   2 files changed, 24 insertions(+), 3 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/clock/qcom,ipq9574-cmn-pll.yaml b/Documentation/devicetree/bindings/clock/qcom,ipq9574-cmn-pll.yaml
>> index cb6e09f4247f4b25105b25f4ae746c0b3ef47616..25006d65d30e20ef8e1f43537bcf3dca65bae73d 100644
>> --- a/Documentation/devicetree/bindings/clock/qcom,ipq9574-cmn-pll.yaml
>> +++ b/Documentation/devicetree/bindings/clock/qcom,ipq9574-cmn-pll.yaml
>> @@ -24,12 +24,10 @@ description:
>>   properties:
>>     compatible:
>>       enum:
>> +      - qcom,ipq5018-cmn-pll
>>         - qcom,ipq5424-cmn-pll
>>         - qcom,ipq9574-cmn-pll
>>   
>> -  reg:
>> -    maxItems: 1
>> -
>>     clocks:
>>       items:
>>         - description: The reference clock. The supported clock rates include
>> @@ -50,6 +48,13 @@ properties:
>>     "#clock-cells":
>>       const: 1
>>   
>> +  qcom,cmn-pll-eth-enable:
>> +    description: Register in TCSR to enable CMN PLL to ethernet
>> +    $ref: /schemas/types.yaml#/definitions/phandle-array
>> +    items:
>> +        - description: phandle of TCSR syscon
>> +        - description: offset of TCSR register to enable CMN PLL to ethernet
> 
> items:
>    - items:
>        - description: phandle of TCSR syscon
>        - description: offset of TCSR register to enable CMN PLL to ethernet
> 
Fixed in next version, and validated by make dt_binding_check 
DT_SCHEMA_FILES=qcom,ipq9574-cmn-pll.yaml

Thanks,
George


