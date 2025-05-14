Return-Path: <linux-arm-msm+bounces-57808-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C40CCAB6532
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 May 2025 10:05:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 567EA18862BC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 May 2025 08:05:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C90F217F5C;
	Wed, 14 May 2025 08:05:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="ZvOfvrcb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12olkn2082.outbound.protection.outlook.com [40.92.21.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4318520766C;
	Wed, 14 May 2025 08:04:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.92.21.82
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747209900; cv=fail; b=NxNNSIcgtXZ1mtFHqu2IDJQ8I1LV6IMN4lkHBtWbk9rzXf3tmMSo8ontxb0ZLqv7vesr7HudZHeavWjJfADMZ3r5DqtsQaPEK8bzI6j7ExGnmMtTkCthY7bWHfH49SWk2cIZMIOgnMUyqmT8BkD7M/FTyzcZfqxCVttuRt3d1DY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747209900; c=relaxed/simple;
	bh=ZrwBV7+fJwhaJq2pY8xFukuA7IPheoa4wArqNdN/tlc=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=P6w730aJ4MVPaoL5+atPCIHH5WPOqyzyFOmWb8Pkw/cy/6trzwnZpFG/KxzSzrfgal5e8E3J8yGmaaQQ3Q9hhZzF9rtM4AH9bh9ycKG764DUbLzaUu1qj4rjgjZi+lgawADVosgWRsWUpDPimaCKxDucXtcnM0BeCVhx3RBAglY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=ZvOfvrcb; arc=fail smtp.client-ip=40.92.21.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gXWCLt7kbxKm6EcyKRBKlK1Awayzfji4PH+QapPQ1cNNwxNPXvCehhYcVZ8DTZLF8Zk1FdlH/WNtu8w4s9W1WsT/Vcuuv5Donvc0EGXSRncCnsWisDqOJgrhka1ygspWzLzYECUKe7D5Wf4CMKyew9vFxV3jMRbTiFJIoX7MxlA77t3pFxCWe6jD4rTOP/ueElpfq7z8ytEzwtmV8IB5nR6Y++iUbthgNPbpTlW3hXo1+/fRhoi9uSs07idHVAvQ9Tq1+WzV69jY/Wt+5q/Y8MFy3fmgSFpU0MwSTFz49uElRMu8FO7C2EQcT3u+tc0L3pIZIc0+maYuf3VrZrmR9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JaOtvWUxyuJZFu6C4zZXXIDgvBV6OOIbkFyQRgsZyHk=;
 b=tKa2ztcSK23XU9y8m7ysZhwGSMLf3M9N6sEsyUxL7YkqPAQyofO2GKxqYQj8yeBIGRwiCmFWFAy7/tdDHoFvc1aZvI4pmzMrXMxXUivu0fzs9rxH1kp1ApA3TAaD4H96iYI2M0M71adaLEermNBnmnRboxxofARKkwyVRH00iNV8aIt6RfrV9NubU2rVYa2Jvj6iX3kYKJqwrOV5B6p0Y+z5aNHQISUAXKFQ/VqPXuEVHrEghpAILh3fPjn/zAxgJLaxZy5j3WcI7jfTDL8zhjuA1P68EWS8a9i6ItesIliRA5rTryhnIdbh/PkTm+qiIyKEbIIOjgr2hVyHqZbXrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JaOtvWUxyuJZFu6C4zZXXIDgvBV6OOIbkFyQRgsZyHk=;
 b=ZvOfvrcbk/EyrbhfuFZAyU35ZGVuQktEIhInnp4+DELAddERVR5QUL2qAgQYup+cNJau56KEca0P6Ea4NpzA6tRtzQ030FK0jdwri43IIBFbBnMJUvsL2wNyDmyvEf32aouXJUKEEe+vZALCgdJb/vBVAzvJ6ct88vyM2K3LP+1dkvV3JuSM02qekeWzzCgpZmfZVPv8i8Ok/B92X2ge2t9sXKloRz2FHEexRUPh39qgi2KxUkREtrqoNlB08xkS49rqrio/vVdqGC//vlxXcJSH5/vOMldE7bMBT02HxJMvWHdfy8T0fHGA99140Ugu+9EJpVErrK1Rdf21i21AaA==
Received: from DS7PR19MB8883.namprd19.prod.outlook.com (2603:10b6:8:253::16)
 by DM6PR19MB3947.namprd19.prod.outlook.com (2603:10b6:5:249::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.28; Wed, 14 May
 2025 08:04:55 +0000
Received: from DS7PR19MB8883.namprd19.prod.outlook.com
 ([fe80::e0c2:5b31:534:4305]) by DS7PR19MB8883.namprd19.prod.outlook.com
 ([fe80::e0c2:5b31:534:4305%4]) with mapi id 15.20.8722.021; Wed, 14 May 2025
 08:04:55 +0000
Message-ID:
 <DS7PR19MB888370ACC69E0A1ABC46D3BB9D91A@DS7PR19MB8883.namprd19.prod.outlook.com>
Date: Wed, 14 May 2025 12:04:45 +0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/6] clk: qcom: ipq5018: keep XO clock always on
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Luo Jie <quic_luoj@quicinc.com>,
 Lee Jones <lee@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250506-ipq5018-cmn-pll-v2-0-c0a9fcced114@outlook.com>
 <20250506-ipq5018-cmn-pll-v2-1-c0a9fcced114@outlook.com>
 <a3c3dbe8-b73e-40a4-b86f-ff9f371b1a46@oss.qualcomm.com>
Content-Language: en-US
From: George Moussalem <george.moussalem@outlook.com>
In-Reply-To: <a3c3dbe8-b73e-40a4-b86f-ff9f371b1a46@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DX0P273CA0088.AREP273.PROD.OUTLOOK.COM
 (2603:1086:300:5d::8) To DS7PR19MB8883.namprd19.prod.outlook.com
 (2603:10b6:8:253::16)
X-Microsoft-Original-Message-ID:
 <64c4019f-2817-4968-b4a2-93927acb5864@outlook.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR19MB8883:EE_|DM6PR19MB3947:EE_
X-MS-Office365-Filtering-Correlation-Id: eafd84a0-39b9-4a3a-c264-08dd92be02c9
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|8060799009|15080799009|461199028|6090799003|7092599006|19110799006|5072599009|3412199025|440099028;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?M0ZtRXloWjBVTTRvTmJLRHo0NmFraHlBMWs1NFc5eGVWTjRkQmxWalNtN1FX?=
 =?utf-8?B?WXNUNEs1T0NrdlZDTGRRSlFQcStob3hMOVpXdXlHTExUaE52Zm9BT3RFNWho?=
 =?utf-8?B?VnhqTXBzNnpTdVFoTmdYTUJyZks5SkRzU0NoL2hlUVBrRUhXemNSUDlabXJZ?=
 =?utf-8?B?dnRaTDI4UEQwenMxTlVZN2p2SVc1aVdueGV3dVJMRXVuZ2tYV1ZGOEF2ZVRS?=
 =?utf-8?B?TE5XK3MwanFrSitvRVVXMThIczF2ZU5GT3l5eU9kdUhNT0EzdzVVN09BLzU3?=
 =?utf-8?B?VkxsaDdqTFB5Yk5SeFJVbThNNk9qTTArN3BjZUg4L05KbVpTMkJrTzVEWVBi?=
 =?utf-8?B?QXlFd0FZRmQ0QXAyK3hOOTlRRU05cmdlWHFySXJmSmI3aUYySWVkbElYUGlS?=
 =?utf-8?B?TDFxbWxDTlNRdXg2K2JLR0ZLMGQ1dWFvVUhJdEJqS21CY0RKYWNmSXcvY1V5?=
 =?utf-8?B?dy9GUmh0VW9XcHBNejB5a21lOEVwUlpPOTVRSmxsL0pURWhKWTVIY0Y5RXV2?=
 =?utf-8?B?Y3daL0FkWWxwWW5scXFRQ3c2QnNHSjQvZW8yZnk5WVRjRFlHQ2tHdmhhN1BJ?=
 =?utf-8?B?TEdOT1JCR3ZCWS9OdFdqc1VwcFBpYTh6NWM5Tk1RV0pqWlpRZ24zWUJWUUlo?=
 =?utf-8?B?RTRtZjNNT0w2cVRtYkd3Tmh1WjFWUFpBMlZ5ZXgzZHhoZXR3Rms4a3lmNDBV?=
 =?utf-8?B?cHppK0JDZ1VJb20vaEI5aVJ2TWZoNCtJVDUvOWI4a1RvREJFSmV6QzhFaE5Q?=
 =?utf-8?B?eWQ0WkN2anMwKzRLT2FlWHErNHlyMUVtMHBDd3dWcWFFYWpjNUJQZ1VaMFJY?=
 =?utf-8?B?MlZwYWw2SUxIeDNvclpmQTIyak41OE5zNzB1Y2orK1dZVDF3OVJYNWcwQjY0?=
 =?utf-8?B?RThnVGdTZXBpdURlOUZid3BrZjF3NHpFZENVd1EvdGdzQ1NyVVVWSWEvNjZi?=
 =?utf-8?B?YzE1bDF4NjdkM2ZDMmJDNEY3QmtsWnBQbUhUaHBlYTBGQ3Ard0tMTUU5SFlK?=
 =?utf-8?B?Z1NkM1RMTVl1V2RneE10emo4RTlDelB0UTdYRkNOQVlWVmFiK2VqaWF4dVZR?=
 =?utf-8?B?SUFUSnl2SjJycmVUakR4dmxFdEJKaWhjclg3NHNvMUsrWnJOM2FET1M3bHFr?=
 =?utf-8?B?VkV6RFNBSHhiOUpad1V2MlhPcm53Ny9Senh0eHpBYS9ReTd0SkttNzlCNTVD?=
 =?utf-8?B?SDRQcFJsWFMvOVUvVWJ5MkNSVHpaeFpSWWpUQzNhTmhmN3FydlRkNXNHK3JY?=
 =?utf-8?B?MEwyUTV5N3JVYW5rUzN6RnNjeWg2VXM0eGc5cjU5UStSRE42M3Z2OGk4c2t3?=
 =?utf-8?B?R3hkMlZSMmxmZGVqdFdlYTFZT29EWEF0TjRTa2NMaG9hcVFpOE5MNmdQYlRN?=
 =?utf-8?B?QktWcUFzdGVUcEczWlJkL1VVTk42MnN1dXcvSGJGeUhNVXBlZ2VDNTMyenJk?=
 =?utf-8?B?K1FVZnpJb080ZitYOG9wRkVFZlRMN1JRRHdwQlBCNUhpL3FVRzVVdERJMW0y?=
 =?utf-8?B?bzZ6V3RCZE1HbGxUME9oT1k1WnNsQ3BRV3AwUldYLzRDd0FWV0p3SWkwWXhr?=
 =?utf-8?B?SzIvdz09?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cTZMWDIweHZsZWcvOFVudVhZK05Wb29oWmsyUmxlRkxpSGpFc1AwSXF2cTlr?=
 =?utf-8?B?d0hnRHppTmp0dTBtZUQ1WSsrN3FTNElVV0g5N295TWhHalZBU3dXRnhaK1Jr?=
 =?utf-8?B?dEx0cm9iQ1g3ZGdYVk13WGxxaEdJbEVUL1d0bGhYQXNHSVd2R1pDV0sxd2dY?=
 =?utf-8?B?TW00aENOZ202TWpOSkJhRm9BcFJkWmRXUHY5R1pDazA1TlkydEk4SDUzZG5t?=
 =?utf-8?B?bWFPR0h6eGpSeXFIVVhKUHhoRmxaYUNUdW51aUdQQmh2Q29lTFI0L01FME5l?=
 =?utf-8?B?T0doUWJzRHpCMDNJQm5LUWxYT1dIRkZBcmZwalF0Q21mTGp1UGV2NFhsUU8y?=
 =?utf-8?B?RXR6a0NSVUdwaTg3M2NibHFRWktXVmh0Y3l5dDB5ZzJkZFhUWjh2T0VwN0JS?=
 =?utf-8?B?ZkpGbE8xK2ExamRxR2JKZTNMSnVCd0krUHJVMVN2VklKd043UWRKNGpYOEFE?=
 =?utf-8?B?OWxlY04zVTI2QmhZUnlWbDhuU2JuMm5lU0ZYbUQxb01SblRrM1B4NUlIcElm?=
 =?utf-8?B?V21QVk5jYjB5RmN4MlczdUJnS3dlK01PdDEvTWNxRTFwMzR0WmhPMlRZalIw?=
 =?utf-8?B?bXRHb0NLZTBLZERqVUR2MlVvYi9RdkY3SU5GemFWdTZCdVBoMWhXSDBrSWpL?=
 =?utf-8?B?cWMwNWFwY3NLbWFCTWZFR0NBQWI5cE4vRU1HTHRWRWtkbUs5dFM4UXlrV1Ju?=
 =?utf-8?B?Qlp2a3hVWTE3aE94OElQNUx3aUNocXBSaTRDZ29jR2RVYzBNWlI3bnBWZnRi?=
 =?utf-8?B?eUU2KzRXNDBRdTNIaUdjblpQRzRTVmxjT1RQWm1UK2J0VXp6WmN5bElvMmd1?=
 =?utf-8?B?Z1J3bjhaZVRsZS83Y2JPeldEZXpleW4vVkNTQnZxRnk4VVVodk5xTUFmRkdl?=
 =?utf-8?B?bGtpaldyVTRZWlM3U3RwR1Jtazl4dERHT2RNekkvdzFDYXZLdmtodGFIenBU?=
 =?utf-8?B?czB6N1o2TUV1K1NoUlRvbTQ5eDJta2duQWVXWGt1OXY1VDBKNFJVMUJTWnEv?=
 =?utf-8?B?ZnhlcXdJNno0cUlXSitJN2ZEWXkrTFVmRUIra3E4bTBHNUxXYzNpUU14ZCtC?=
 =?utf-8?B?bEt6THhXYVIrNTIydFZGS3lSWWFJMlgvMnl2OE9TbFd0K0hKcWIzRk1OZUx3?=
 =?utf-8?B?SC80YTVjaHBuQkVjei9kVkZrekhuR0tTOGR3M0ppQjdES2hmUzdFRTlCN1ZS?=
 =?utf-8?B?d3oybjdCVnc4ZldRTk56c0JJVkhCN1owNHhyeFE2QXlhN0N0L3JlazB6dVZm?=
 =?utf-8?B?ZnNIYWZidmFKVU9JYURMY1NkdHQ0NGwzd2c1NThnTDhMekpMVURHMVVnTjJ1?=
 =?utf-8?B?S3N1SXMvZlFoMm1uTDdTNklTMUxKK2x2a1BoMHY3aHcvbHBXUXR2RmZFdnk4?=
 =?utf-8?B?RVJwcW5VQUpXQ2dSQ053MGt2VFBYbzMrVXJUa3VkaW43V3h4UUU3UU5yaWhL?=
 =?utf-8?B?WC9EUVBJRzZrMmRKT2hxdytQa0ZvTHE0bHZRQkt6QklXanRhRlR1QzNXVDda?=
 =?utf-8?B?d29SRWROdkhjR1NTbUt4aGVCb1dmdmNZWGgxanFpL2E1NTluVnJRTzBmSjJV?=
 =?utf-8?B?YkFaOS9YT05kQlZ3V2loM1VkL1Z0NEx2Q3JSVEk3ZWxOMXRxZ2pmZ2ZKMzBk?=
 =?utf-8?B?SEJXSHFhNXdFdzF3elNlMzR1cUxpenRpUDJMaDdhdzkwOUUrMk0vWVJnZzZ5?=
 =?utf-8?Q?MY3l2StAe1JBMI+j+t6I?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eafd84a0-39b9-4a3a-c264-08dd92be02c9
X-MS-Exchange-CrossTenant-AuthSource: DS7PR19MB8883.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2025 08:04:55.4460
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR19MB3947



On 5/10/25 01:47, Konrad Dybcio wrote:
> On 5/6/25 7:43 AM, George Moussalem via B4 Relay wrote:
>> From: George Moussalem <george.moussalem@outlook.com>
>>
>> The XO clock must not be disabled to avoid the kernel trying to disable
>> the it (when parenting it under the CMN PLL reference clock), else the
>> kernel will panic and the below message will appear in the kernel logs.
>> So let's enable the XO and its source CLK and keep them always on.
>>
>> [    0.916515] ------------[ cut here ]------------
>> [    0.918890] gcc_xo_clk_src status stuck at 'on'
>> [    0.918944] WARNING: CPU: 0 PID: 8 at drivers/clk/qcom/clk-branch.c:86 clk_branch_wait+0x114/0x124
>> [    0.927926] Modules linked in:
>> [    0.936945] CPU: 0 PID: 8 Comm: kworker/0:0 Not tainted 6.6.74 #0
>> [    0.939982] Hardware name: Linksys MX2000 (DT)
>> [    0.946151] Workqueue: pm pm_runtime_work
>> [    0.950489] pstate: 604000c5 (nZCv daIF +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
>> [    0.954566] pc : clk_branch_wait+0x114/0x124
>> [    0.961335] lr : clk_branch_wait+0x114/0x124
>> [    0.965849] sp : ffffffc08181bb50
>> [    0.970101] x29: ffffffc08181bb50 x28: 0000000000000000 x27: 61c8864680b583eb
>> [    0.973317] x26: ffffff801fec2168 x25: ffffff800000abc0 x24: 0000000000000002
>> [    0.980437] x23: ffffffc0809f6fd8 x22: 0000000000000000 x21: ffffffc08044193c
>> [    0.985276] loop: module loaded
>> [    0.987554] x20: 0000000000000000 x19: ffffffc081749278 x18: 000000000000007c
>> [    0.987573] x17: 0000000091706274 x16: 000000001985c4f7 x15: ffffffc0816bbdf0
>> [    0.987587] x14: 0000000000000174 x13: 000000000000007c x12: 00000000ffffffea
>> [    0.987601] x11: 00000000ffffefff x10: ffffffc081713df0 x9 : ffffffc0816bbd98
>> [    0.987615] x8 : 0000000000017fe8 x7 : c0000000ffffefff x6 : 0000000000057fa8
>> [    1.026268] x5 : 0000000000000fff x4 : 0000000000000000 x3 : ffffffc08181b950
>> [    1.033385] x2 : ffffffc0816bbd30 x1 : ffffffc0816bbd30 x0 : 0000000000000023
>> [    1.040507] Call trace:
>> [    1.047618]  clk_branch_wait+0x114/0x124
>> [    1.049875]  clk_branch2_disable+0x2c/0x3c
>> [    1.054043]  clk_core_disable+0x60/0xac
>> [    1.057948]  clk_core_disable+0x68/0xac
>> [    1.061681]  clk_disable+0x30/0x4c
>> [    1.065499]  pm_clk_suspend+0xd4/0xfc
>> [    1.068971]  pm_generic_runtime_suspend+0x2c/0x44
>> [    1.072705]  __rpm_callback+0x40/0x1bc
>> [    1.077392]  rpm_callback+0x6c/0x78
>> [    1.081038]  rpm_suspend+0xf0/0x5c0
>> [    1.084423]  pm_runtime_work+0xf0/0xfc
>> [    1.087895]  process_one_work+0x17c/0x2f8
>> [    1.091716]  worker_thread+0x2e8/0x4d4
>> [    1.095795]  kthread+0xdc/0xe0
>> [    1.099440]  ret_from_fork+0x10/0x20
>> [    1.102480] ---[ end trace 0000000000000000 ]---
>>
>> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
>> ---
> 
> [...]
> 
>> +	/* Keep some clocks always-on */
>> +	qcom_branch_set_clk_en(regmap, 0x30018); /* GCC_XO_CLK_SRC */
> 
> this clock is not a clk_branch2 - its control register is different and
> this call is incorrect - you can drop it altogether, as if the XO source
> clock isn't running, the system is dead
> 
>> +	qcom_branch_set_clk_en(regmap, 0x30030); /* GCC_XO_CLK */
> 
> This one actually is likely supposed to be always-on too - does removing
> these two lines do any harm?

removing these lines AND the clock structs works AND updating the 
parents for clocks that reference the xo_clk_src works. There kernel is 
not complaining about anything. The other option is setting the 
CLK_IS_CRITICAL flag. What would your preference be?

> 
> Konrad

Thanks,
George

