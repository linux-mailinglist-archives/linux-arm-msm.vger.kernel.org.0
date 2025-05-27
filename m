Return-Path: <linux-arm-msm+bounces-59525-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7798EAC4CF5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 May 2025 13:15:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 38EFB17DC09
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 May 2025 11:15:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4963F25EF89;
	Tue, 27 May 2025 11:14:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="g3neIP8P"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12olkn2037.outbound.protection.outlook.com [40.92.22.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5900524887A;
	Tue, 27 May 2025 11:14:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.92.22.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748344481; cv=fail; b=T1uKjXoEt/dYMG4atCPj0SBsO2TcnBOKn9ra0KyVZRquKzv8nGjbZuRE+3t/mGUcC4hSSzXEglr4LHWELm7MrU3U57uX4DyfD0UprasHOGAvYy3jVTtbod7sQVcTGyw8CH7VBzbmYx+HTdAYAMQppA2bnxxKTCRpQzepha/fMZk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748344481; c=relaxed/simple;
	bh=QtRen8pK3Xo0GkjNZeyple8dNo5s6WFRb1daK3tvOXk=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=etCEeCDMgfD5a1cwFaUb75XyCTIag3b6g7uGBE1l856fdBA+lhjPSuX0sbGHbIKhJTfkyoiCKIisZtA/8lNGATZfCdbtFrBHIugLXC2+E1Mq3wZKHn0UV6/vEEnCFCMTAbQ026qh7t0JODOsT4x0aQsdD/dYrP4Z+6e8CFqghDg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=g3neIP8P; arc=fail smtp.client-ip=40.92.22.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zRwDyR/HsJaA5QD/1J0hJ/cI8DYN8ryKfVWZmLsym98K9BI3p0fx81rAUG1gg+Pj76ZngI1ZWpOVR6x3TSogRdcJVUYojLO1Y/eOVq/K9eSRRlSk58R6If+atIW1D1CdG8QvzDL65P+eFkHiFZkPEQxU+XQeaBCQ3dombcdZfaFR1aKZugsXvpCnOkpgR2N8gOVxTGJii/VBpIQGbkUNdg1l+8WQPe4r6oJNSywTYxwlRTN+e/gpqVIqjtS62yYJy2UAQ15u8FxrN3WZtGMVETzeYUMOi8+5JLl4Qd3Wmzg+AjV6NyLmAAnvqdYquHY9harw3HcvcrweumYUksS1PA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G0apB1l3eIgjWYBvSnLv+O8YTFrPinzwLXU1TgD2NtI=;
 b=VZTTmc0Ikif9KdM25euBZ/Knr9rqo8jsc7HXwKvm+PjyLTsIiuY+inUOwRR0DOVNcHebdm4IjCsQkROj37z+d4+pL6nJ3Oz0i3dp+Nhw2WCNv0a7W8WjSD3dYRWbAKajA2pk5PVH6/qNxgoDVF1cDoMjndAKJjrkM2rBekiYYsI43+fo6gk+sC4VUaH6ePC236D8xz6tyBohGI7KbLtO5yfEU1z2niIdv01XlE1dV65gkyG74jxMyzo3u2tkkmR0MekdpFP9WF/KVTte/jzhDMPn2TztNKddtCdYtOkpDIlE/tVWx+U0VZlQ0wE8osH03th7/2c7QIuU893VxWcEsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G0apB1l3eIgjWYBvSnLv+O8YTFrPinzwLXU1TgD2NtI=;
 b=g3neIP8PTjzzyvi6EBt3NaXFDHi5bQLT8OvVUw7tLkWxT5qDuBAxVjax4Tnmin1M5KC7PmH/m8GOfGHRWNYsweAIWNYuD216BEfGoMT8yFlY4XnUDeYHMR1oohzXp3j6gNheHMMRXu7N/7zglOY/+/rFmsUunJ07YGn/cSlPlFpDB6UpKwCfUg+TA0oriOA9ifNj/FtcRqJENqF8DsmkwHKRRDOwqsYJzrNKbuKzaMcU69fKXdFFgUxABPJgxw0UeupoF8rkxkJgLh3Vbj1J94a+Pqw8F1uXegZk5twkznj/RrsQVpfO+fMemEKV7LQG3G/JujJ50wCBwxbRpzcCZQ==
Received: from DS7PR19MB8883.namprd19.prod.outlook.com (2603:10b6:8:253::16)
 by BY3PR19MB5202.namprd19.prod.outlook.com (2603:10b6:a03:36a::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.26; Tue, 27 May
 2025 11:14:35 +0000
Received: from DS7PR19MB8883.namprd19.prod.outlook.com
 ([fe80::e0c2:5b31:534:4305]) by DS7PR19MB8883.namprd19.prod.outlook.com
 ([fe80::e0c2:5b31:534:4305%4]) with mapi id 15.20.8769.025; Tue, 27 May 2025
 11:14:35 +0000
Message-ID:
 <DS7PR19MB8883BE13166F7CD5DCA777DB9D64A@DS7PR19MB8883.namprd19.prod.outlook.com>
Date: Tue, 27 May 2025 15:14:23 +0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] clk: qcom: gcc-ipq5018: fix GE PHY reset
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
 Russell King <linux@armlinux.org.uk>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Florian Fainelli <f.fainelli@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-clk@vger.kernel.org
References: <20250525-ipq5018-ge-phy-v1-0-ddab8854e253@outlook.com>
 <20250525-ipq5018-ge-phy-v1-2-ddab8854e253@outlook.com>
 <337068fa-adc2-478e-8f3f-ec93af0bb1c6@oss.qualcomm.com>
Content-Language: en-US
From: George Moussalem <george.moussalem@outlook.com>
In-Reply-To: <337068fa-adc2-478e-8f3f-ec93af0bb1c6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: DX0P273CA0090.AREP273.PROD.OUTLOOK.COM
 (2603:1086:300:5d::17) To DS7PR19MB8883.namprd19.prod.outlook.com
 (2603:10b6:8:253::16)
X-Microsoft-Original-Message-ID:
 <c23b3fc8-fac6-4dd2-b42b-7cd5ccc0054e@outlook.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR19MB8883:EE_|BY3PR19MB5202:EE_
X-MS-Office365-Filtering-Correlation-Id: 6631bd72-0a66-48ca-6914-08dd9d0fa8ee
X-MS-Exchange-SLBlob-MailProps:
	/UmSaZDmfYCV7gMu87/GtwOd6jzNwNFltboDOuONhDWeadRUwjWxNIGlFmrIBpwKDSAb35yWOmp/3qFYCDAGicJodze7Jn98XgYyC/ghS9Wz7OQHI4tNFO6M0ikIjFD8dEv/JjXCdx80ZUoISomEAFQTqStxrX5jbpEdrQvmwuM5vlaIEvCu3YcFyxVUS4PveziEhlymut823+zRScWcjrO2eJQO2pM1MtLFVDtntgj9+G4bAWng5Uv/g6nt8fHsrB79nBs7FtzhZmCrClziPS5QsIVpwrGqbrFG9aSyC2RUhgF2O5wtS1M3gT01vJtrpZPcC6WT5Fx0MBF3lVEaoaehhBE28jDsI+duTyru+7iju7OmP09ofpvZXpP6RNtiSAOE9nHZ7yXIALu3sMcJP/ZZklKXMfEl8fp+H5CEsVyRFxYaOVLsyT1l7NbXFSHLUht6USnNLGS40xvBoQZpn+Ecnkq2pSKbqYYNjj2/PCrFGLNYIXieQJXC8m7k+MuWywqfIFAK24mEZ/+QxfIZAAD9D10qeUlBOMk9mPZL3Xc5XJNUvpBti8J5sj8bCwpLw9pVlES5ue1FdtrV4ef9BQTGwqe3TG8Tw8hky3MpeYwHT8uM/RxMnUzCGSgWnA1l43aniId8dMgp1aP4lwtmswPmWZrxtutDkZaQxj7UvpseyJ4bGf4IWj1NReEK+h+HuKfz3R2qvQ3hjCIrrQQS9tkAfTQrPUAW1/dx8Mr88hsavcX+CcS4A1jC0FTeh2F3pxSC0whKhXkG9z1e7rLzYSgIinDSi9knPWlYrn4jNJhaB4PSlNNBDB+OEeJrK30Yx6SLOXoCtY8OOJxS66knZA==
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|461199028|6090799003|8060799009|7092599006|15080799009|19110799006|21061999006|5072599009|1602099012|440099028|3412199025|4302099013|10035399007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?c3RUYkZaK3A1MXhrT2tudzYyMjBqMVRsdE5IRzhmQzhjMnZJMEpyMk1vT2Fv?=
 =?utf-8?B?ckg3NFltbVJwRnJlR0VrQnhidkI5TFpMTXBBTStZaU9pQWlqMWZSMmJiRDZq?=
 =?utf-8?B?UlNkNGFydVVlSzZFeEVzVk14S1BqMnBhWjdmVlZXUU9mb3ljTEpISTh1bDla?=
 =?utf-8?B?M2hERDg0VHdWd0gvWENmbE9JelFuTXkvWm9rT0VqcDJlN05SUnZpN1VtcVlk?=
 =?utf-8?B?OUtPTXFBU1JnSDZtV2dhclU5NkhuUlFsQ1YyajVJR1dBeHlqZlU4WGZOd1h1?=
 =?utf-8?B?V29nVEQ3bTQyL3B2MHAvVVF6U2luZW1QMjMxai9sNTI2MXZnZ05kRm5UeU1l?=
 =?utf-8?B?SWlLQ0J0NnBlQUpqZnpING1HRkxleHYxSGkxNGVwTjdTaWNkUnc5cThMMzZL?=
 =?utf-8?B?QWp4Y0lwWXlVditpRkpEeTVScHlxZlVOOEs5MkYydG91Tm8wZWpCNVJoR2d2?=
 =?utf-8?B?UlA5a0NjZFVHTmEwRWVqZmVuWmdlRWZvUnMzRmVhUCt4dHJpdDFYRDZFVWVq?=
 =?utf-8?B?a3Zya3hrRFJhVTc2dVJibXJnQiszQTFSTzFsRXp2R0xvR0l1WnBrRGFSbW8w?=
 =?utf-8?B?b2lEZkJZcFd2T05FRWZUaHB0V0pEaGsrVm5MeStDTDlJZDM1UCtKVHQvWjVK?=
 =?utf-8?B?dEpEQzkrTWFSQkNDZEZ0cXFkUWVEdmNMUHJ1UEtUMVhmTkxaNFd5Q3hQTjBJ?=
 =?utf-8?B?U0VSTjVyQVZSY1RzK1h2bE1wemlxVE4rVHpnSGNoZ3MzTzN1Y3F3azFzUXpk?=
 =?utf-8?B?UkRpYUdHUWNEbVBDSnBDdCt4U3ozL0tSS1NYOFhMU056a2Z3ek5TZm5haXdh?=
 =?utf-8?B?MmpvRkF5cXlmYVdQTzlBcS9NQm5ha1NnTE4xMUxEanVrVXp3YUpycUNiUmU5?=
 =?utf-8?B?aVdDU0xwUHdtY2ZqeWhtRmY3STh1OUgxQk9VUWZzNncrUEdJZVBBbmh2MmpE?=
 =?utf-8?B?V0FuL0Z1STNTVWxuR0t4a1N5YnF3akhhdXFERzBhVjdXNHFseEZ6bWZrVG8z?=
 =?utf-8?B?QXVkOTNINkY4bmVTdHN5SmNSY3QrRURuT05zWlJZU292VVFEbGJHS0JaaXBW?=
 =?utf-8?B?SElOTlpReitXaWQxQWVEdmlqalE3STRLVG5NaFBCQXljeVNjanN3anVnQVlD?=
 =?utf-8?B?WXI0V2s0T3Qva290a0ZTc3puRjNLRGdIUWNJVGFmbEJUOUttNFdpdHdPMlpG?=
 =?utf-8?B?Y3c4SUo0ZmZ1azQ4YzlEMkRjOGhYc0RBYUhWZ3Fkb0xBOGlRamJ2TTJQNTZM?=
 =?utf-8?B?czV2b2F1cFUyZ3BZVVppTzBELzBhOFhSTlBBNWhoR2ExYUJlV3RTZk9yalpB?=
 =?utf-8?B?WlUvWUUvVFg0R09qSkFTUkFiNXU4SzdyZThzK1N0Tm5OV0dtRzZGNzY4NGtI?=
 =?utf-8?B?T1Q1RElTZE8xSXR4bS9sYXJzck9BRGNoUXY2ZVhqYU9xN2t4TUx0L2R0REFh?=
 =?utf-8?B?Ry9Sb01EVTNYbE5MQkUxSWw3WVNGWEM5M2VXbHIyK1AvSUxJVHF4MFVUWFBw?=
 =?utf-8?B?c2FYNVBQRzlidDIwZmxJTnVqZmY2T2QwU2ZUbGVSK1hiSUlldGovM3VqaTAr?=
 =?utf-8?B?MXYyZXBPNTl1ZzFYNVIrU1VteFJTdklBSmhFcjAxcVlmQ3p6akR4aU9hYjR6?=
 =?utf-8?B?QlFwMTZVZlcyaU5iY3cyTUltempIcGtMTVFqNU51a2cxNDhvNHNrQmUwS3Q3?=
 =?utf-8?B?UTlIS1UzOEN4WkxMWm5hMlhHSW5BZldCYlhFZVovaWlLMURTNWFCVFF3c3hL?=
 =?utf-8?Q?G5tI+mqmvNDwXWxGsI=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OXZlTzd2bDA2VVFKOXFqOFpQdGRTVkRvWkpGdVFTZFB5Mk4vMkhQamEvV0dZ?=
 =?utf-8?B?Z3Axd2xFYkt2RGdUTmtab3RiRlJGbnRnLzNpZ2R6NHZLTWk1VUl6SE5ROFNt?=
 =?utf-8?B?MEZzUmpwZDczMXhZYUs0NjZ2STNpZzJxakZjOTlSWDJ3N2pKSC9TdDNNclox?=
 =?utf-8?B?SHRXNHFoeGZoODJLRDVGNWZNREdTaC9Nd0hVMkpTMXVOQWR1K0F2eGV0YWJZ?=
 =?utf-8?B?cGZqbVRsbEJSc0RKc0tpeDBvTWdjaXYwellxcnZCWURQSWNZVVVMYVdYWU5w?=
 =?utf-8?B?NHN3SzM4VE9ZdUg0ZkN3U0pJYzdnejhteGlLeUc3MUNydWtxN1cyU2pxQlY1?=
 =?utf-8?B?Q3dMUUdick9Bb01EUDdqNEZydFdKMExhTmVzcnhMSVlTRXJ5ZEZhZEI0UEVw?=
 =?utf-8?B?WWdvUzltUzV3MzFZUUp4MEIwbmxOREpmRzlYS0dmY25PMjJSZm1GemdxNnRu?=
 =?utf-8?B?Qi9tMUt0eWwrbERKOFMvckNUT2l3bWdzYTVrNFk3U0RFQ3dlRVBlNHhaZW9E?=
 =?utf-8?B?bjNWeU9nV0ZXSG5Jb3MzemVuOGpydmRtTWd0dTlFNGZtd2Z6bXhpWEpLM0cy?=
 =?utf-8?B?SStXVk9BNkFsUDNWNy9sZGFxTmVOWm12QnNjZExaTnl2SGNMRndkSnRBM3k3?=
 =?utf-8?B?d1hsbmZRVjZ1UkRCRHBHQW9VTTNYbzVGbWY0b3Z0VHptWlVadmJyZ2tYclJk?=
 =?utf-8?B?SFFKOFhsS2VHbE5kTmZ0OEpaUmN2ZEdiUEt1T2pEeThuTFVET0tBUkpLRkow?=
 =?utf-8?B?cVd1Y3VJRTVxcXptcHZNc3J3a0I2dlVwN2FxWnd3MFJBTUJQQlF2NXRhRklV?=
 =?utf-8?B?eWxtM2VkMnNjWVl0NG9pOEY5UGxseEpHNC8rYUlmd0JLVkRxTU1uMkNqNjBM?=
 =?utf-8?B?clhZbVNxOWwrbStONm43S0RHbUh6UDFyU0NFdjRoWE1MbGpKWWJHOHBIQnBB?=
 =?utf-8?B?aVIxM0F5VzNNV0l2NnV3QlFqZHovZWl2b2YyeVduMldtR3FsRnkvZER4ZUM4?=
 =?utf-8?B?bDFtclJyem80dFRNZzc1L01JOWJPZ0ZicUVJK28wK3d3WTVuTVlxRVB3RTBt?=
 =?utf-8?B?a0ozVFdIZFo5TEpvVEQ1bnBRaFNiZ2lYaHBabmRVbEpGUGovVjIrY1k1Q3JV?=
 =?utf-8?B?cTJKTi9PdDA3R1ZYL25SaExVQmRlajFCWkgxMnhhWGNhcVlIZnN5dVZMdlhy?=
 =?utf-8?B?NG10M3FIcnlSb1Y0MTRJeVl5TUhUbTRzWTRybE5YVjNvMXZiSG11Z0dWZUwr?=
 =?utf-8?B?TkVUdXVkN1I2cDZ6OXNqdjlHSHFiR2p1aGVRTEloSkJlMGNqY0ttRVoyUG02?=
 =?utf-8?B?NUV1WlQwZXY2VmdxRjVuVmRJeUtFY3QyZmEzU1BPSmM2bHhCVzBJblkrZDZK?=
 =?utf-8?B?VXVBZTJYalFocW5kd05ISGVJdjlvT2JQcDB3b2hlL09mUFhyNFVYTDdEakdR?=
 =?utf-8?B?Y1d5dlh5NDU3TjVaMTZUQmUySU81aGE1UmZnT2R1R1JqQzVraFA0TjhxbEho?=
 =?utf-8?B?RUMyZlFTUmdsNDZFYnhQQzA1NDJYUGhrWHpIQkhpdDN0cVhzOG1CbVo1enpX?=
 =?utf-8?B?UEJaWnZjVDI1cm90dkdhcWpjRVZxUUpJYmpPT1VzRGxPN1FFczlDVDRqMnc1?=
 =?utf-8?B?V3dyT2VsbU5IQ1lYNHlYRWwvWDdFWFg3OHFkdGNWckVFQlpKRmJxZSt5SUpq?=
 =?utf-8?Q?RU4OPm1UuFJuS6gtDsjh?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6631bd72-0a66-48ca-6914-08dd9d0fa8ee
X-MS-Exchange-CrossTenant-AuthSource: DS7PR19MB8883.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2025 11:14:34.8475
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY3PR19MB5202

Hi Konrad,

On 5/27/25 15:00, Konrad Dybcio wrote:
> On 5/25/25 7:56 PM, George Moussalem via B4 Relay wrote:
>> From: George Moussalem <george.moussalem@outlook.com>
>>
>> The MISC reset is supposed to trigger a resets across the MDC, DSP, and
>> RX & TX clocks of the IPQ5018 internal GE PHY. So let's set the bitmask
>> of the reset definition accordingly in the GCC as per the downstream
>> driver.
>>
>> Link: https://git.codelinaro.org/clo/qsdk/oss/kernel/linux-ipq-5.4/-/commit/00743c3e82fa87cba4460e7a2ba32f473a9ce932
>>
>> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
>> ---
>>   drivers/clk/qcom/gcc-ipq5018.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/clk/qcom/gcc-ipq5018.c b/drivers/clk/qcom/gcc-ipq5018.c
>> index 70f5dcb96700f55da1fb19fc893d22350a7e63bf..02d6f08f389f24eccc961b9a4271288c6b635bbc 100644
>> --- a/drivers/clk/qcom/gcc-ipq5018.c
>> +++ b/drivers/clk/qcom/gcc-ipq5018.c
>> @@ -3660,7 +3660,7 @@ static const struct qcom_reset_map gcc_ipq5018_resets[] = {
>>   	[GCC_WCSS_AXI_S_ARES] = { 0x59008, 6 },
>>   	[GCC_WCSS_Q6_BCR] = { 0x18004, 0 },
>>   	[GCC_WCSSAON_RESET] = { 0x59010, 0},
>> -	[GCC_GEPHY_MISC_ARES] = { 0x56004, 0 },
>> +	[GCC_GEPHY_MISC_ARES] = { 0x56004, .bitmask = 0xf },
> 
> The computer tells me there aren't any bits beyond this mask..
> 
> Does this actually fix anything?

The mask is documented in the referenced downstream driver and allows 
for consolidating:

resets = <&gcc GCC_GEPHY_MDC_SW_ARES>,
	 <&gcc GCC_GEPHY_DSP_HW_ARES>,
	 <&gcc GCC_GEPHY_RX_ARES>,
	 <&gcc GCC_GEPHY_TX_ARES>;
to:

resets = <&gcc GCC_MISC_ARES>;

to conform to this bindings restriction in ethernet-phy.yaml

   resets:
     maxItems: 1

Effectively, there's no functional change. So we can also list all the 
resets in the device tree, whatever is preferred.

> 
> Konrad

Thanks,
George


