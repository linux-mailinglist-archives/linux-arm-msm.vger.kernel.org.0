Return-Path: <linux-arm-msm+bounces-93504-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2BYeKoBnmGmJHgMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93504-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Feb 2026 14:54:08 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 24E69168140
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Feb 2026 14:54:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D4DFA303609F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Feb 2026 13:53:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F5D2349B19;
	Fri, 20 Feb 2026 13:53:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="OJHNqk7B"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazolkn19011014.outbound.protection.outlook.com [52.103.1.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2691D32D7DE;
	Fri, 20 Feb 2026 13:53:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.1.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771595621; cv=fail; b=R4Bm2LtRsIM64JKutHFThp5L/0ID7kGcw6/Fgtjeij8PrT/fS/D2qglSmhTHJPRXZxHFr6xhyQEGt8CYLb5vQl4JT0O8o4dTGBf39Yoyd4/yEVPro85xBjO8UUbWbC1+RjaFz4nslIZxZaqMrWnP+ZjI1BVMiHyAsvuHlcfVhPg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771595621; c=relaxed/simple;
	bh=inkk+yfrdVUnBcVI/9tj+4nSoY0RJrIwi1l9NkRnU80=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=dE84c7oKlBXWRy6N978yYio+tV+m4f4m5rAPiR8DRQd5meKwnI7FLYokkb7H2S8JZLaPVKtjsRsiZAo0Ff8dV3bEl3aq/k+N5TnbTnDLEbLfy0VxglVxCY/eycAMJXY0cl3yS0cOQGtFXXSWXP7MUYw5azsE/Cv4XlKj7JPSdHo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=OJHNqk7B; arc=fail smtp.client-ip=52.103.1.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WdQnhf1iGDeT8p1aRHVL8fPUb+NfYDBMGbpipc5BsAxLDgqTYPwkG0/vOInUkyiCvsCbqeu9AlRJ7ogpbTDMJ0MjKrRZ/YiGbo6YYRYFOPoo1Y7hq0spPZFDNx6sorcutF6G/Edioun1bPXkHeZGRRqL0eijcEevC4AP9uBJkmblrmjrovtr2ed6Ga6PMK98Dy8A7XYM03iARPkFNyQBe+6yhnOJW/hsnrA/vIBM4otrJ1sxpieAiJmHoifM+7b2DDv8ilyPhWz9wB+8AjqfXgpzFXkAkiyz07NxYSn9BUef9AO0bR1XxaKPvYZBz2nw0fFpU+ISrjqPYCHoN34oIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vB9V8XQA75Bu8ZEi5HYuUrUl00NrZ/uyLNcOzUbpooA=;
 b=x6w9RJxzoPSjiKKfuzhcn64Y2M/0qFUT6Q0py3hnaT3VKuFK2tug8Ie5mAp6SfKBQO6xcvw+mJT3Q4XhemEbOULQhgk/egwzrQWwSc3Hcd3xjQLHJbgJPUtsVevWPuH41BJQqJ4Azb/mCHJLvYzavQcof7Bgti133oheoLyxGPde4crVfEB/kRssYf4tbPAF4w0iHXt4kLuYOidAzy/7O/67/GBIgkAmcHu4G3awdAz67fgeQH9C8O5OWxfZxcn6307A+Bo960LPXuTs9QR8MXaHDYD0zdJ/2/c6rUVeJDpTibilNo5iaqlzbMoleauuupdTUDDJG6umCpv6D0q61Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vB9V8XQA75Bu8ZEi5HYuUrUl00NrZ/uyLNcOzUbpooA=;
 b=OJHNqk7By047sAj/xovZadjzMwBLo4F5HwJop2yDJGRGj4I9HHIvl69Yw7O4wO7YFJNnFFKjKtFV/T1oIwCwHD1M8vQvO7ah79ddx15Me34p3oSjX4PfVUKQr2MX5k4DvJm/QEJiPE86YDaU0xYFpfFnlCDWvwmPoqOY5sY2JwIjjIz7InRo4SYutORJNe1ShxiehjxhysTa8i0B43LNcEEKet+t5QCDlpR3AMvZmn7nerj3CKZJbH7NKLBKnTm9bYBMZpiaaAj0RlboF2Kp5eOByW2kdk0/m6Z7JOBNwp/gHpDhzHApI9V93VKgmwiI8Q9nbJjmbPqXNxX9h4DPhA==
Received: from DS7PR19MB8883.namprd19.prod.outlook.com (2603:10b6:8:253::16)
 by IA0PPF0A4D809AB.namprd19.prod.outlook.com (2603:10b6:20f:fc04::c88) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.11; Fri, 20 Feb
 2026 13:53:37 +0000
Received: from DS7PR19MB8883.namprd19.prod.outlook.com
 ([fe80::5880:19f:c819:c921]) by DS7PR19MB8883.namprd19.prod.outlook.com
 ([fe80::5880:19f:c819:c921%4]) with mapi id 15.20.9632.017; Fri, 20 Feb 2026
 13:53:37 +0000
Message-ID:
 <DS7PR19MB88834BFC4ECEF7CA27C379139D68A@DS7PR19MB8883.namprd19.prod.outlook.com>
Date: Fri, 20 Feb 2026 17:53:19 +0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 4/6] arm64: dts: qcom: ipq5018: add nodes to bring up
 q6
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
 Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>,
 andersson@kernel.org, mathieu.poirier@linaro.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, konradybcio@kernel.org,
 quic_mmanikan@quicinc.com, linux-arm-msm@vger.kernel.org,
 linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260113092021.1887980-1-varadarajan.narayanan@oss.qualcomm.com>
 <20260113092021.1887980-5-varadarajan.narayanan@oss.qualcomm.com>
 <62d53cdd-b71b-48f8-88d5-65407d3a80c7@oss.qualcomm.com>
 <be05578a-d90e-42ce-a1de-4f670fce03d0@oss.qualcomm.com>
Content-Language: en-US
From: George Moussalem <george.moussalem@outlook.com>
In-Reply-To: <be05578a-d90e-42ce-a1de-4f670fce03d0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DX0P273CA0097.AREP273.PROD.OUTLOOK.COM
 (2603:1086:300:5c::12) To DS7PR19MB8883.namprd19.prod.outlook.com
 (2603:10b6:8:253::16)
X-Microsoft-Original-Message-ID:
 <5387ab69-107a-48d6-987c-a92df41a739f@outlook.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR19MB8883:EE_|IA0PPF0A4D809AB:EE_
X-MS-Office365-Filtering-Correlation-Id: be6efad7-4625-4a6c-e93e-08de70876e8f
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|15080799012|5072599009|23021999003|461199028|8022599003|6090799003|8060799015|19110799012|1602099012|4302099013|440099028|10035399007|3412199025;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?b3VtMThpa1BJUWRkL1BlWFNmWmUyekh2MW9wYUlXbXQvaUhjZjhFWDk0TzdE?=
 =?utf-8?B?SzNBMGxKbXBXYStTNHYvTFpuOFFONkxPQTB5SHZCcloyZGdrQWlmd0hkN0I1?=
 =?utf-8?B?c3VTem5iRGJieUMvSUl0eldsVU5LTXJvZGNjZkx3bDRuT1l0RVBGWU5tQzJU?=
 =?utf-8?B?eFp3cmIvcDYvVjM0TTJVWFRNUER6R0NucEtXdU82dTBrUkRpZ3lOWm8vK05y?=
 =?utf-8?B?Sjl2Q2xVOENkL1R2bnU4NHNQbGk0U2JGQUUxcHpwQUhzdWlPSHl5VHc3TmUx?=
 =?utf-8?B?ZW5Ud1ZtNFBDR0laT3dTajNzN0FULzhiSVVuYksyMkgrbi8vdndtMnRtdTFR?=
 =?utf-8?B?a1J0bHBVdVJFM0dqVHZWTmFmVDBqem43dWNoRlFsbUVZZHUzaUxyb29tYTRU?=
 =?utf-8?B?Nm1XUjBjWVp1blVtZEVyREpuTHhLN091QVZWNVc5dyt6b2xTVHdCSnlCOXVC?=
 =?utf-8?B?MHkvREloOVhTKzc1b2pQdEthRDFLdHhjNDBiTG1GaDFQUzlLYU5abFZ2cGhQ?=
 =?utf-8?B?RnBMSUEwNythS1J1OSs3Znd3LzYxQ2NJRVhMeENNR1hyckFiUS9VSFpVMVB6?=
 =?utf-8?B?NEJzSGkxeDd0RjdGV2lVNzRuSGdTbTFQc1dmNjVENGc2bGVlSHFFejh3Vk9Z?=
 =?utf-8?B?ak5vd05YWWQ3S0NSMVY4dzdhTzM2dkVLZ1g0d2xWZGtmVEtwbTdsa1ZFbnBM?=
 =?utf-8?B?NDJKVEVSazFGWEpEVWdTNDRBMmtNUjBndkhGWHB3b01qdEpjSmV4UHlRSXlo?=
 =?utf-8?B?QSsybHUxc01WYUpiOGxnbUd3dlBkN2NWYzI5dVBYU1lnWjBpR29JRkxhRGV5?=
 =?utf-8?B?dVZNMHdpZ3huVnFaNkdnamZad3k0bU9IZnl2eTczL3VjWGV5S05VTUhJTUdF?=
 =?utf-8?B?bThKeFpDNGFvNGZYTXF0RTFORWlFSnV2N0RUU0Z0YXNRNzRjaDVROUFLbU1w?=
 =?utf-8?B?YU9GSkFWdTc0YXByUWpISnVKQ3FvWlA0YkpuajhNck56dW54YzJCZysyVDBD?=
 =?utf-8?B?UG5EQjN0dGpqSXFOekdlZlREb1M4UmkvNVc4b1Vjc1loRzdzSkZ0WFAvUmxv?=
 =?utf-8?B?T09uS1N1OHM1SldtcXFOdGZTZ045SDFDcEEyVnR4VC82c2pqdmxtRWZUSmxE?=
 =?utf-8?B?aTBCc1dxcE52WCtLamc4Y3BmLzVHWEU2V2RSMGlLbEtJdFQveDc3V3lhckFk?=
 =?utf-8?B?SEhUT0E1Z28rVUpHSmgybEFNSmd6U0FsaGsrOXpUc20rRTN5MlQ1alh6Rjcv?=
 =?utf-8?B?Ykk2OW5GdUp3TFp2Z3hCR2xLRFE1TFF1YjNGNldYZFJjWnJucWNJRy8rMzNF?=
 =?utf-8?B?WVllQmx6TzJNRHdieXF3ajVvKzY1QnpvdnBKc25YNE5QRW52Ymo0bWxUMnpJ?=
 =?utf-8?B?VkpqUGhUSWIvSG9Ld2hEK0VLWkdYNXppWGd5Y3ZxcDd1UFBncG83aUJuazc0?=
 =?utf-8?B?ZFZONkxwRWwxREpqV2FyNkdiTGZBdEhKS21BQzdhM0V3bEFnK0RlMnZtbXZ6?=
 =?utf-8?B?QnJsanJkWXozRUZsa2FpNXdVUmJVMlNBa3hacEhlSE1jcDN6SEtPb0lxWjhE?=
 =?utf-8?B?MU5NQzRJRVpXT0lISkNQWWhQeEUxd28wbkFubjlFVzdVdExwK1FwcFZNMTl3?=
 =?utf-8?B?OVNocm8zOFkwSmxXaW4waEFNRFpzUlRRYU5HZUpRdWYwaFRLQUlLQ0YwSWlt?=
 =?utf-8?B?OTZkb25FVGRjNHhJTkhicWlTa1JLdUMxRnM3Y0I2Q0tCWVBmZllZWFA3Z2E4?=
 =?utf-8?Q?L4UOoe/v8bmYf6+GfHRUQRGFJL+NYlY0HzY6WPp?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MjE1QmJzdWM1Q0JWS1JMdWhURndBT2xIZkU3K1pBcjF4SEpyaXpDTzJqZENl?=
 =?utf-8?B?anJTYkswYkpSRlBlN2YzVjcveTVEaSthYjFBbm55MlMzSWs2QTdxdTFDSDdE?=
 =?utf-8?B?OGZLcXIraDhQQnUvK2g1d0NJbkFmWmx3OEdaWHFjMzhkNXYwSk5FYzhQUEJu?=
 =?utf-8?B?TmtrS0pBVTdYMFBkY0daNTVEb2xJNENmb2hPZG8xVTdNVDFIVWVFVHdBdU5Z?=
 =?utf-8?B?Z2dTSjZ3a1dKQ2k5OUZnbTFobkxBWDNpY1ZKYVQ1MzZEUXkrZlV2a25vckFm?=
 =?utf-8?B?bTBtT1Fsd2wrUXFoYlpnQXNvL0FPbW9uOUdJSnNiUmhNbkh6UUd2Uk1TSWx3?=
 =?utf-8?B?YzdvcTVXYUZLUHYxTGl6TmdVTFVCTW9ZNFdNVHY4ZExSNTVUd3ovWVJiS3pC?=
 =?utf-8?B?cHgyb2dFN3pxZDl6U2xJOVRFSGU2clRsdHdweTN2cDBrMmYwUHpsbGQ4R2FX?=
 =?utf-8?B?SXIxREt3ODBTSTR0VHRVY0h6WFV5eUs2RTRUb0t2Q3BVdEc1enptRWhYUzh0?=
 =?utf-8?B?NmFkMkJUMDczb0kvdXVCZnNIVmVTTEJGUmZFL1BzNXdKb2ZOVjZEYkZRNVNt?=
 =?utf-8?B?cnVzMVVGQzJibjZhQkRQSUUvOTlUMno2N1VERDk1QVpyNmdsWUpTenFnNXpD?=
 =?utf-8?B?Q29iemxDeUZ0VVlpQk5qTHFGd0c4cXlEVVh2azhlc1l1aVJhT3hnWi95bWcy?=
 =?utf-8?B?b3lPVWNOTDZlQzdkVXpFcERWUktJZ3hvV0M3MWNkN0daalQ3NTRtLzI2cGRa?=
 =?utf-8?B?dGxIS21mZjl0cXR5QWpkcXQ5YmEyZFVxRDFhbG9zMkt4QmhHVUtTc016Ykxs?=
 =?utf-8?B?eXNEWDlWaXdBTTFlV24ySnViVW9hRDhNSlczNStENVJYbmhqK3ByWGlJWXQw?=
 =?utf-8?B?NEVVVVFSc3djNmd0WFBTL0QwN1VWekp2R0w2eXNJZEo3eSszVHNMdlNnS2VM?=
 =?utf-8?B?QjhkbGlOSGhud0p6TlBNSnZxWkp2WUtCcjJvZncveEZweGV2SDlJUVJnT0tu?=
 =?utf-8?B?YWpiRENINi9vektReU9IMWgybmtwZ1lNNVBmYncrbjQzdm5QQy9BVzc2WFk2?=
 =?utf-8?B?d0NJblpORy9IQlVnKzB2bThZdExTb2R6NjJvZVhrU1RNNmF1K2VtUFJ2NUFT?=
 =?utf-8?B?Umxvc3l1YkVsR3dscGVYM3lQbTlteUFsMFF3NXlid2o5TU1DWlRWRUMydzc4?=
 =?utf-8?B?MEtzWURVRUxSV0hoSTF0QzNUTG9qMjJTV1dHYmpxaEtiMktZelFPSlVwY2d1?=
 =?utf-8?B?M2YvalQ2em1NWjZIRDdHczNvQXB3c3d1ZDduZXF1aHJzWnFTME1lTTVwSU1Q?=
 =?utf-8?B?YVMwZ3d5SnZtODBXdWtiTUdiUEU4bHN3d1ozeG1xZHI3OTM3UzZrUFloRkQy?=
 =?utf-8?B?N2ZKNUM1L1lvZ20vU1VJQ1RXT3lUMjlnYVpheTBoS1N3NVByRlU5amgxclVv?=
 =?utf-8?B?bFowc0VtYTgyODlkaVFIa0RXMTlIQ0xwMmpwOXY2RktGSW5vOVZYU2xoNkF4?=
 =?utf-8?B?d0ZVdUVkT0cvZ0h2bk1mUFE1ZEIrQ3ptYlU5Q3BhemJXbUYxZEtCVXN6amZI?=
 =?utf-8?B?UmFVOUJJVjJZT2JrbEtjd0NyUDJEUmVaejY4RjZBSzZDOWdKRmFGR2FwT0xz?=
 =?utf-8?B?akh2QUwvM1FqNjdETXRtd21HckNRUGVDNTcrcTRVYUw2OFk4S1ZaYWlsczVj?=
 =?utf-8?B?SjZvOFc5UStiTHhvK25ZZFBEV3dMT0QvYXR2MzN4NDdjWDM5NGh3Nm5pS1R3?=
 =?utf-8?B?TG5WZFJSS3NaVndTUTdsQUxhcEhlSTUwTzRKYVJiMG9XYW85cTFqMnZ5aUEy?=
 =?utf-8?B?bE5Qc05jWWlFMDY1bnArbDI3bzlIcWs1amVsWXl4YTIvbHJLQnZ5SFlmazdT?=
 =?utf-8?B?TThTdUxPTjF6M0oxajl4ME1tTGJ6NjdYN28vM04rb2lwNkE9PQ==?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: be6efad7-4625-4a6c-e93e-08de70876e8f
X-MS-Exchange-CrossTenant-AuthSource: DS7PR19MB8883.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2026 13:53:37.1317
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PPF0A4D809AB
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[outlook.com,none];
	R_DKIM_ALLOW(-0.20)[outlook.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-93504-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_MUA_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[outlook.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[george.moussalem@outlook.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	DKIM_TRACE(0.00)[outlook.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[cd00000:email,outlook.com:email,outlook.com:dkim,DS7PR19MB8883.namprd19.prod.outlook.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 24E69168140
X-Rspamd-Action: no action



On 2/20/26 14:36, Konrad Dybcio wrote:
> On 2/19/26 8:42 PM, Jeff Johnson wrote:
>> On 1/13/2026 1:20 AM, Varadarajan Narayanan wrote:
>>> From: George Moussalem <george.moussalem@outlook.com>
>>>
>>> Enable nodes required for q6 remoteproc bring up.
>>
>> I just recently became aware of this series, and have some questions...
>>
>>> +		q6v5_wcss: remoteproc@cd00000 {
>>> +			compatible = "qcom,ipq5018-wcss-sec-pil";
>>> +			reg = <0x0cd00000 0x10000>;
>>> +			firmware-name = "ath11k/IPQ5018/hw1.0/q6_fw.mbn";
>>
>> This file does not currently exist in linux-firmware.
>> Instead there is q6_fw.mdt with associated .b* files.
>>
>> How do we transition from .mdt to .mbn given that distros update their version
>> of linux-firmware independently from kernel updates? Will we need to have both
>> the .mdt and .mbn files present for some period of time? Are there associated
>> changes which no longer attempt to load the .mdt files?
> 
> Since there are no in-kernel users for this one (the ipq8074 WCSS driver
> requests that but no DT is wired up), I would say we should promptly move to
> MBN..
> 
>> I ask because I've been told the ath11k/ath12k drivers will also need to
>> transition their firmware loading from m3_fw.mdt to m3_fw.mbn, and I'm not
>> sure how to make that transition.
> 
> I can't see any m3_fw.mdt in the tree or l-f, unless the m3.bin qualifies

I think you checked for QCN9074 which uses amss.bin and m3.bin. For
IPQ5018, IPQ6018, and IPQ8074, m3_fw.mdt is there, see:
https://git.kernel.org/pub/scm/linux/kernel/git/ath/linux-firmware.git/tree/ath11k/IPQ5018/hw1.0
https://git.kernel.org/pub/scm/linux/kernel/git/ath/linux-firmware.git/tree/ath11k/IPQ6018/hw1.0
https://git.kernel.org/pub/scm/linux/kernel/git/ath/linux-firmware.git/tree/ath11k/IPQ8074/hw2.0

> 
> Konrad

BR,
George

