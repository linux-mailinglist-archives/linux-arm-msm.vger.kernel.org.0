Return-Path: <linux-arm-msm+bounces-61124-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EDE82AD7146
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Jun 2025 15:11:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B97473B2ED0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Jun 2025 13:10:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBD3123CEE5;
	Thu, 12 Jun 2025 13:10:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="bLzp9u3C"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12olkn2071.outbound.protection.outlook.com [40.92.23.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C18D21B0F0A;
	Thu, 12 Jun 2025 13:10:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.92.23.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749733842; cv=fail; b=cvk7xdvtfJZJIwhbRbwnYk4xhaTJsZ7nhtfFYRNknFv9FD5C/H34dgTPQql7VM8vJfM0dF7oGFa2VQAG3O7/yaNnfIsKq0zvRa+7iwGm0GaFGVC2lnV5hovaEy+kzWSEmnsf+SIQZ8pd51n0m1T0xmJIKyNWFrnQKsGxSN0W8vs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749733842; c=relaxed/simple;
	bh=SJqqtiTEmKPq4ppSgNopDRYArv8aBSrgAd7AYtNOP5A=;
	h=Message-ID:Date:From:Subject:To:Cc:Content-Type:MIME-Version; b=sTMBOtdJIYg5L7TRpWNTE2H3GFKbvEOXnKn2aiPtpTH4p8KCUrbtFpAt/BnZvWTC9Jc2O9KTpmZULiTN16hH+6PKq+MF4jXo9tjx0dsc8QewC3/fOUnQ55CVHz5Dnpsf5MxEPvZCFPZgb9f22LHdm7MwFz+f58RmWHXNlEe9/CU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=bLzp9u3C; arc=fail smtp.client-ip=40.92.23.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FFlaT9ppGxCwUO7ttTASsRQczgveYP+CpBJcbi9FJZX5VltpDLdstwlaIwMJ6C2y1gJlQuWEA+UFCRJ9siWPI0QQN1Vc1zNSKoSXsD4Hy8eXe0SvbpWxPldoazA5tC7KMoCoPqYk/6Ib+BEtD9jdc3pCI9aFt/KDfLSpYIaM4QguCWnju8RTjV7QnZVZKDn4uMKzv+ooLks4IDJgxVcb2UE2O7TLXmYqOeus9zg6TqVRWUduVxovABPTIsOx6yNr3RgD5oxyA+m9AbrMzNY3L6LWclDoeRnIzzsHtVHIV9F0M/SyJwg2y92O6AwvliLagrhGttTR2TIFrS5nFD+4tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Kr9LqSUMTUFgC0+dXYpHtHo0ZEPIQWkvDt5wUvnPYvs=;
 b=FOByIEz/aiX2CgEhzUrhX4oyWGQwqN2r613O8NPGgeJjVImk3ukxuVFPHH3hF8EhJXsa34ZSzedHSsVjZWxTIweD4wqDrS3yR7gK94THn0m0E72zrU8IryxT2PncLlSHutZLMk7b/vR87J37kvMnWouxSU0kNE/4G8e9ordpx35XD587Lljb60ZHeQpsIO9RlA6PWnohb3aw4Op1ihxrYuOQ+uAXohX1cZ1koOUrrbrhyodomK+XFBJScfiW8F7+3wxct6P8BK1isAzdxfcLFonCqpdOqffe13rja/GgpdiR3V4gcxWL9V1dCKhzN3uCOtAGuWRuSVMxJpjA8kWKYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kr9LqSUMTUFgC0+dXYpHtHo0ZEPIQWkvDt5wUvnPYvs=;
 b=bLzp9u3Ca1+X3sl8TqNrjBoUZhKU9fXfc5XQIAErS+kd9vouZNANeHBdRnXMpeC38lkCBEUG5lsh3vNXrNkBDn1hEA4HCSUJNmg0eYtBUuAjfE6UcUSnEvfbLZOpfAZKvVxUlOT25GAIB4Db3tIRW6CvKXDEQ9ZsiyKv2AilGUSlnn8jiqSvWZz8n0OWcvw0cfWY3CwfuEGTzD5rbABS44UiToufnP06AH59ftKt3ZgwqTfU0NqNf8jlletGsQiJfC8dclIVIXSt/UVhsvd1UeaNDcLF2N3NdzE/ySjERG/6ocWcU80WphiZuUOtHI4lEpUCLw9dOrboqPKyM/xYUw==
Received: from DS7PR19MB8883.namprd19.prod.outlook.com (2603:10b6:8:253::16)
 by DS0PR19MB7396.namprd19.prod.outlook.com (2603:10b6:8:148::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.13; Thu, 12 Jun
 2025 13:10:37 +0000
Received: from DS7PR19MB8883.namprd19.prod.outlook.com
 ([fe80::e0c2:5b31:534:4305]) by DS7PR19MB8883.namprd19.prod.outlook.com
 ([fe80::e0c2:5b31:534:4305%6]) with mapi id 15.20.8835.012; Thu, 12 Jun 2025
 13:10:36 +0000
Message-ID:
 <DS7PR19MB8883E05490D6A0BD48DE11909D74A@DS7PR19MB8883.namprd19.prod.outlook.com>
Date: Thu, 12 Jun 2025 17:10:24 +0400
User-Agent: Mozilla Thunderbird
From: George Moussalem <george.moussalem@outlook.com>
Subject: [PATCH net-next v5 0/5] Add support for the IPQ5018 Internal GE PHY
To: Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
 Heiner Kallweit <hkallweit1@gmail.com>, Russell King
 <linux@armlinux.org.uk>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Florian Fainelli <f.fainelli@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, George Moussalem <george.moussalem@outlook.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DX0P273CA0041.AREP273.PROD.OUTLOOK.COM
 (2603:1086:300:58::7) To DS7PR19MB8883.namprd19.prod.outlook.com
 (2603:10b6:8:253::16)
X-Microsoft-Original-Message-ID:
 <688070e1-3446-4960-9a4f-8f3af082d33b@outlook.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR19MB8883:EE_|DS0PR19MB7396:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d308551-64ab-4e8e-5e38-08dda9b28510
X-MS-Exchange-SLBlob-MailProps:
	Z68gl6A5j2/UGE8LB7fW1rt/luL1dFdMeknJyD2a6jWWQhCUgoqqtDFd1pLRl5Kk+0kOTpJAvgB3XWoQOoCRXCpcfz9GLfOD807DMYG19DsqUTmiftzJ8v9lu259/R9EzY5Rmye9iUrJ0SGOC1csVeKK41e6z8ZCuyyRAsonFFKbFBMwRIfBV9vziGn5SYT7V+6FJlNRblMEMqfuCsfZZ6FieDeyfQp5AEheMHphPoMtPOH/EznqZ07S2yL+oFGOgwjHGUNT9PBQnDGi9uQtHyDzSa9360EdXr0k+oFTsoXj6w8GiyKFsRd2nOZxH6eq0IIYnGXwlh4TmeE7acPSoLrLeURvakqFz1OYy5OGVAoDl8/HMqQ6f9Vrhh9KHKI31xJbPBqp4W0/CnnSYd4D4Gfd7XhvlZGYy5lB684K9P4b6TSKtT+T8Cy98ST1jJsIUepJxqNCCW1TrVmJhlyA7YUPI4z3kzxLd5MGABShw9/Rco6x0/9JTAiAugR1WZXQ8WvOHhK3kSqjRm6IEwvKo9jLqzcF+cBTxSrZb43QCLp2zWpT5iJg5HYk2/e+ZM6mhHkpujotirIDCGn2M56cdNm1RR1M0ShJFneAjLAw9zRnfSEUoNMg4F1msQfqL+W+0X03H5C0xlgvz7NlTod1Hq17ZDRnxjPo3lrUoIYbZcN+gsLCLUMHIwQp06+EKdkQ2rIsERHEmaA4cCYVJYNSHtdKiSRVwireLuIvXH0qfhFCMgBLu0BbTXcehoJZbln2oprelQ8ptMsJBgdtN8Fbs2ijHuaz2OpynIp74DjVC7dIQUyqrAQJHDxyRhlyfwIg
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|6090799003|5072599009|7092599006|15080799009|5062599005|41001999006|461199028|8060799009|19110799006|1602099012|40105399003|440099028|3412199025|4302099013|10035399007|1710799026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?a3dFK0RYRXZEYzFkM1AxV0NrN0dTYnRHb1VTWkllckJ3Sjljc2RxS00rUWhv?=
 =?utf-8?B?bUIxUlA3dU5lcWVIelBma3VQYjJSODlzcDZYWEs3UXZDYkRIZ0Mzc2gxTHZs?=
 =?utf-8?B?UXZmdGZxUVlzTEVSN21CY0xHYzB4ZVQ0eGtFYWZCb2NIYkRWQU1GSE1iQ2h4?=
 =?utf-8?B?Y09ZOHByWWFhVEhHYmZJTytFc240N0RWak5oVU1NZDJsT0ZYZHdLNG9Kc016?=
 =?utf-8?B?RDJiUUJJSGVSQWx5VGdPaFM1WlNoemZtdUFZdGxRVllmQzFFaGh5OU16NWhl?=
 =?utf-8?B?dVVEVTV5QmpRNVJ6NFB4MGdQMFU0aFpqRUVxN1lNdUJCYlNtbzhuVHJtcWs1?=
 =?utf-8?B?clo3QXpuK0JBQ1U1NDhTMDluSytwVG4rVVA1VlhIRlU5dHNRNVA2aDZPNmxv?=
 =?utf-8?B?ZE5YbXFZSUduSzZ2eEFrcDUrcDdwNHJLR2VIdHJNZzViNWNKL2E0allSb0tk?=
 =?utf-8?B?ZDV2Zm1OSEhuN29JR0N6U1RjRklpZzJVanhuaTBnQ1c5WTE3WGR4NjNoYTQv?=
 =?utf-8?B?bVhvazJOTnJvTGVqOW9TZjViZXlGblpLNjlZTTZLcSs3SGVHcmZEd0RJNkZC?=
 =?utf-8?B?RTJPTE5UN3RrZE81Ly9WcFVuKzNrS1ZCNFFrNzhCNWJKbFlJV0JUUFIrTFdi?=
 =?utf-8?B?Ym9DMGhCUGh0NEt3cGhQZ3A4UGdqQ2lRSXRmQ3E2dkY0bGpyc3BBNjY5THA5?=
 =?utf-8?B?SmwyWEpud0dkUVBoNnMvaDRxTWlhL3Y0RVppTEZLZ1p1QXU2Qjd6YTNpL0xo?=
 =?utf-8?B?TnphVUlubVRSNEVJYmhqS2ViTkVvUUUyd3gyckovbmFNVUtJMkFld2JONXZR?=
 =?utf-8?B?N1VqdEdZUjdTWFp1dTVpN1dpc0wxbGJ3RXJTUkFYYkhwSUtzSU95cDhMaFQ5?=
 =?utf-8?B?NmFyWklXTU01MklaY1EwZnRUR0pHVTVuMXd1ZUpaVUx6bzg0TVpXZHVid0pF?=
 =?utf-8?B?VmFaaFdDYkFZSzYwOUVrOFBrNXd4QVFWZldNcEVLMm5FOVIyaWJ1QlRQZkdS?=
 =?utf-8?B?UW9WVStsUjE0VUFiamtnRTVkRWh4T3luSXlTVXRSc1BnLzVNMGhDWHpDTGlt?=
 =?utf-8?B?SGxoVDJlMkhmQldCTldTM1pFQlppV2tuNlUwTlZYcDNyMUg4Z1pVUWVBNDUr?=
 =?utf-8?B?dEZSTXp1bjJuRzY3ZWVaZkV1TnNtNkQxUHNXOW5sZHNHSTdHK2cxZ2xURzFs?=
 =?utf-8?B?aVFoKzJUNEhZWm1BdjhwZnM4STdScWRLQzN2RnlCNWFvSHZFTlRMZVdQN0Q2?=
 =?utf-8?B?Z1hLRE5ieDJqc01vL0lBYXJyc29rQWNhUDRnaTBVUFhVNDBCZ1R1Zzc5Q082?=
 =?utf-8?B?N0Y0NWRLY25HVTFOcHV3K2szeHFZR044YStHcEY5OEk3RXFlYnpteXNwWGpI?=
 =?utf-8?B?aFlJaUdDdWxGeDcxdVlUYWkrWnhOdkRNS2dqWFBEVWY0TzZyZVBBTFdzeHZ1?=
 =?utf-8?B?WEgyMm1sdENiNEhIVXhuVmpmdUJjZlFuQUxtLzJVQnFaVUNTTEsyRXFKK3d0?=
 =?utf-8?B?R1JSTGd6Z3Uxa016em9HSXFDMXRHdnVjUGZEVDBhMFMrWEFocVk0bTFSek1U?=
 =?utf-8?B?emQxa2IrK3VhdzRmbU5mKzU5VTF6K0hxL3ZxOXkxRCtUTERhbXlhdjh4SlQz?=
 =?utf-8?B?T3gxb0wxNXZtbGVac3hJVDUwbHl3dmhBSUVvMkcwZjQxL1pWaTZKQUhRZXBo?=
 =?utf-8?B?NWRtNzltNHNkMnErWFZpSGFnWFhhbjBpMEwvVkFKampxc0hGSjVqWXVTWnhK?=
 =?utf-8?B?a2NEVTJKSzgwTkVnVFpRZnQrWUc0VUFmNkxtNnExb0JBT1JtY1N5STNhVGE5?=
 =?utf-8?B?OVY5NkQrOVV4Ulk4NWpLb25NbmNKNktuV3FaQTNVQ1Z3K3FIUWVuNnI0NmRM?=
 =?utf-8?B?RFlkK2hhaTk5Wm9HN2YyU0dlMVlBTW5QbUtKaVlvMFhxUVpxNWszUGVDb1FU?=
 =?utf-8?Q?ET9M9DaopQOrksj2YnCoAFMqkwfISCPW?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bWd3SUZ6NGVEemZyOXBZR3d3R2tMV1B4Z3ZvbmNxc20vV2FKSThvNllUUFRy?=
 =?utf-8?B?ZnlhamZ6Y3loYzRSU1BrQWhRd1lkSU5pTS9mNi8wdyt5L1FEaG13WEQ4cUNh?=
 =?utf-8?B?R3ZBdkI4alhiTXRJWFhVM0FzQmdiaTBnakxiTXo3WjVTTFBKSU9DNjFrdklE?=
 =?utf-8?B?aW9rN0ZtWm14WnFxaVREVUF2M1JCV3BRbDB3NjFrdHRqWldERGd2SVZLN1dZ?=
 =?utf-8?B?aGgyTWlYWWFIS01KK05DV05uMTFCdE9NWVZUZGtISzN5Wm80Rzg5Zk1ZQ0Z0?=
 =?utf-8?B?OG10Yk42V0x4UjdJWFFRNXc5YmwxR2ROeDFud2lwLzgwZkZ0dzBnaENvT3NL?=
 =?utf-8?B?Tjg5WnpKbmR2WnVaUFo2RnViajVPU04wUTYvYTVWTGZEcnhQdnQwQXBDWHRo?=
 =?utf-8?B?TkMwMTdZZDQ2YWdIaUFVZStlNG5rM20yYkpRdWVPbFJmaWxMOUxveHZQZFph?=
 =?utf-8?B?TS9LOGY1YU1SU1NhT01mVllTczF1aE9xUDdEMDFPcjlYNnU1aUlnT1F6Ylo5?=
 =?utf-8?B?L0UxOWxidmhWclB3elZubTBKMG0wY0QyQ1oyQWIrMzVINXMvUmtRUklmR29N?=
 =?utf-8?B?bzBmWDVGZFhGYkNZeC9mN2lwdWZjcGFSZG5FQTNuRURPUW10c3VnZ0NqN3RE?=
 =?utf-8?B?MzVQL1p2WnFSUkorMnhBdXViZTE1cWd5Yjk0V0pzSkRia2xOOVgxMW5lR2M5?=
 =?utf-8?B?eVlsTjZXOWorNzU5TjZqY2RJTWl0b091R0E2SGRlWk1UNzY1N2ZFRWxMYXRU?=
 =?utf-8?B?dHpLb3hlR2piOXgzTkYxaDNSK05pdUs1MWtESytaZWJqTXJNR1NscS94ZnpX?=
 =?utf-8?B?ZS90eW8yR3VwMWJFQUduQlQyNUlSUTNpZytIOEFwRHlDOG9uUGhQK1g3TnZr?=
 =?utf-8?B?L0VvVklTTk9KWWZyTGs3bnBoQTdUeDBmNmh0TngwVGZOSlZCRnZ3VVVnTVhT?=
 =?utf-8?B?RVVDcmYyTUZWQ0NISzJJQ3ZYNXJIMytCaVIvOU1XRXZGVVVlY3lwMzVGNzR2?=
 =?utf-8?B?YW0yc25IL2JsbldoVlNVTEdkdkpPcVptcnRVZ1dQR1pmQzVOY1lFT2diNkpy?=
 =?utf-8?B?MENmODF2OTFZbi9UZGlBTUFnY2o3L3pxSk5tUVQ3SkJ5bitMbExUTnpjTHJa?=
 =?utf-8?B?d0puZkNHMktiL2lBc1Y3KytWbkZBTE1IbGhWakwzYWxCTjJaS0VBamd5V1A4?=
 =?utf-8?B?SThFelNJclJLRVc0Yk9YU09pUUxaSnlDdjM0eS85SjBvWHYyZkQzQzJ5SXJk?=
 =?utf-8?B?T2lKM3hrQ1JEakFvenZDY1RLN0YyWkFxYnBOQ2tXbjhETUxjTlN6eTg3Wkxl?=
 =?utf-8?B?ZWdTQWFLZzd4MTJXV3NGTDhWeXVKS2JBNWd2QkdOVXQ3bCtibkhLbUZvK0RJ?=
 =?utf-8?B?SDBqczFubnA4ZXBJOW4rN1cyTGNjWDVna0hZdDhrZGNjNHRBbmlDMHJQMEcr?=
 =?utf-8?B?SHZ4SXZXNGZYTW42TEZDYmtGWVFZSG4rQ29lUDhjRk1GWndDcGdGWm1pN2JK?=
 =?utf-8?B?MDliU0tWTDJhRU9WY01Xc0hldmNKNGhvTDVlU3V0ejcvS2owbmVOUjN0Zkk5?=
 =?utf-8?B?SEJ5b0d0YmNFZHEvTDBrRFBNODNkOFBOeVBnd1QyMVAyR0JkTmhaN1ZiRElQ?=
 =?utf-8?B?N3JTVi9KMHArYVFWZjRKdkFXN2JNUmUxV3Rna3Jmb1dKS2dJdVdqMHdzYlNS?=
 =?utf-8?Q?wkQBm32hzjz8sB8zLndC?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d308551-64ab-4e8e-5e38-08dda9b28510
X-MS-Exchange-CrossTenant-AuthSource: DS7PR19MB8883.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2025 13:10:36.6605
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR19MB7396

The IPQ5018 SoC contains an internal Gigabit Ethernet PHY with its
output pins that provide an MDI interface to either an external switch
in a PHY to PHY link architecture or directly to an attached RJ45
connector.

The PHY supports 10BASE-T/100BASE-TX/1000BASE-T link modes in SGMII
interface mode, CDT, auto-negotiation and 802.3az EEE.

The LDO controller found in the IPQ5018 SoC needs to be enabled to drive
power to the CMN Ethernet Block (CMN BLK) which the GE PHY depends on.
The LDO must be enabled in TCSR by writing to a specific register.

In a phy to phy architecture, DAC values need to be set to accommodate
for the short cable length.

Signed-off-by: George Moussalem <george.moussalem@outlook.com>
---
Changes in v5:
- Removed unused macro definition (IPQ5018_TCSR_ETH_LDO_READY)
- Reverted sorting of header files for which a separate patch can be
  submitted
- Added a comment to explain why the FIFO buffer needs to be reset
- Do not initialize local variable as caught by Russell
- Updated macro definition names to more accurately describe the PHY
  registers and their functions
- Include SGMII as supported interface mode in driver commit message
- Changed error handling of acquirement of PHY reset to use IR_ERR
  instead of IS_ERR_OR_NULL
- Link to v4: https://lore.kernel.org/r/20250609-ipq5018-ge-phy-v4-0-1d3a125282c3@outlook.com

Changes in v4:
- Updated description of qcom,dac-preset-short-cable property in
  accordance with Andrew's recommendation to indicate that if the
  property is not set, no DAC values will be modified.
- Added newlines between properties
- Added PHY ID as compatible in DT bindings for conditional check to
  evaluate correctly. Did a 'git grep' on all other PHY IDs defined in
  the driver but none are explicitly referenced so I haven't added them
- Link to v3: https://lore.kernel.org/r/20250602-ipq5018-ge-phy-v3-0-421337a031b2@outlook.com

Changes in v3:
- Replace bitmask of GEPHY_MISC_ARES with GENMASK as suggested by Konrad
- Removed references to RX and TX clocks as the driver need not
  explicitly enable them. The GCC gatecontrols and routes the PHY's
  output clocks, registered in the DT as fixed clocks, back to the PHY.
  The bindings file has been updated accordingly.
- Removed acquisition and enablement of RX and TX clocks from the driver
- Link to v2: https://lore.kernel.org/r/20250528-ipq5018-ge-phy-v2-0-dd063674c71c@outlook.com

Changes in v2:
- Moved values for MDAC and EDAC into the driver and converted DT
  property qca,dac to a new boolean: qcom,dac-preset-short-cable as per
  discussion.
- Added compatible string along with a condition with a description of
  properties including clocks, resets, and qcom,dac-preset-short-cable
  in the bindings to address bindings issues reported by Rob and to
  bypass restrictions on nr of clocks and resets in ethernet-phy.yaml
- Added example to bindings file
- Renamed all instances of IPQ5018_PHY_MMD3* macros to IPQ5018_PHY_PCS*
- Removed qca,eth-ldo-ready property and moved the TCSR register to the
  mdio bus the phy is on as there's already support for setting this reg
  property in the mdio-ipq4019 driver as per commit:
  23a890d493e3ec1e957bc925fabb120962ae90a7
- Explicitly probe on PHY ID as otherwise the PHY wouldn't come up and
  initialize as found during further testing when the kernel is flashed
  to NAND
- Link to v1: https://lore.kernel.org/r/20250525-ipq5018-ge-phy-v1-0-ddab8854e253@outlook.com

---
George Moussalem (5):
      clk: qcom: gcc-ipq5018: fix GE PHY reset
      dt-bindings: net: qca,ar803x: Add IPQ5018 Internal GE PHY support
      net: phy: qcom: at803x: Add Qualcomm IPQ5018 Internal PHY support
      arm64: dts: qcom: ipq5018: Add MDIO buses
      arm64: dts: qcom: ipq5018: Add GE PHY to internal mdio bus

 .../devicetree/bindings/net/qca,ar803x.yaml        |  43 ++++++
 arch/arm64/boot/dts/qcom/ipq5018.dtsi              |  48 +++++-
 drivers/clk/qcom/gcc-ipq5018.c                     |   2 +-
 drivers/net/phy/qcom/Kconfig                       |   2 +-
 drivers/net/phy/qcom/at803x.c                      | 167 +++++++++++++++++++++
 5 files changed, 258 insertions(+), 4 deletions(-)
---
base-commit: 5d6d67c4cb10a4b4d3ae35758d5eeed6239afdc8
change-id: 20250430-ipq5018-ge-phy-db654afa4ced

Best regards,
-- 
George Moussalem <george.moussalem@outlook.com>


