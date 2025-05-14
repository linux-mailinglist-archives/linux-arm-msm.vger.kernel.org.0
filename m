Return-Path: <linux-arm-msm+bounces-57809-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 93236AB6560
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 May 2025 10:11:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 19EF54A622B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 May 2025 08:11:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 728E121B9E4;
	Wed, 14 May 2025 08:11:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="egRXdpBa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12olkn2010.outbound.protection.outlook.com [40.92.22.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9165D21A928;
	Wed, 14 May 2025 08:11:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.92.22.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747210304; cv=fail; b=QE0nJEN4tBjn5bI9ALATypO+oNCk9UFawo6pvw59rdNkf9T5lnbe6EbR9UKi/XcJXjuCMaox6WdoeTvWahMBM2C2wA9SGRBC6XLuT+eRgCgu8XVMz6WqZaVDb1cWvTA6PWdHKFMHWYKel4oTChXmMHDco3/pZysqoxHrY8kIvQg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747210304; c=relaxed/simple;
	bh=PXZwTxyJEc0NdMbvwHyj1H6B2EvVhCk5XN5JUzCI4j8=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=t9LGuDfpRVkz2vfeamsgksO9d/cPDHY1zYD3M1pWxWGh5LDo6u7wcUmBrCBLtk0BermfpQIMUUm7Atum4Wq/zzo/C9ix3YGxGki+gpMLpL+X4Rh24N8IXvPckFzET1FfC1zZx2JN9hk7JZDq9NX8gs3rXjhpDqCXy4WoL1FCJKY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=egRXdpBa; arc=fail smtp.client-ip=40.92.22.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vNUMuoyP7mhN9ueJb3uSYuFsR/pIGYmk4KjmOc7Uvqgdm0XFXem/sc90Ywey94pA0850UOyCgVnPJlTHhs7ARnAQ3ExwlH6TeMwB3HmL01rvsRyyKe4yEn81IfTGtb6Qg7MlqN6/qMYGfuKm7TJIJv7tte589zCwQ6LdJLBWBjwtc5+s5bZaV9Q0UE8xLhzDoxuIomXr8ht7UmdUHoKSHZKtpPO/zS0WYWg8bOSSc1IpGAgCUSK+qMuIKx2pk+X0XJdlM2KuxWxyIR4g3VDwfjNMZD7DGnvF5p4dPMxbKN5AZvkUomTfRwrZqVRDf7zKmbL82qxy33LEeab5jCDf3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yzQ+u5lxcJvOm3tZhJqjlGGgKbEFd6jIQf3LiBtFNd4=;
 b=NiBr0imb22dnYd1Be4Y9/8TxUBWxBZTF/Gb9ONPQ2jAhvBceF+60xkjFTUmmbGkSnNPOGYxxitiZNswe4ub4+QSAZoqFP6bzfu9q286zdfXtueOxwV3U243yOR3OykGETk3uHSerXyw5JdaROSrH8em7WtFHuKbB5QT8XVfRlpOlU9ur/QlxgaTQYWg09dyKK1YJiiYiCWTHSnU5X0+f4wsKev3IJquPyCi/hV2oEhtt88YeTrmxXwTYTi3J5ASDFQQvYNNapdTD0CjsUNSDG9GVhR9bUERiQFirqQ9xQGrVKFJ60EIQnxwm5u1cL8Bk/Mw/ebOsKwjX1TN6DLgfJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yzQ+u5lxcJvOm3tZhJqjlGGgKbEFd6jIQf3LiBtFNd4=;
 b=egRXdpBaDdRWOiKwkZB1g+9Dtk6lA2xqht/uNTO0yWbV98kIQszjdCtlRDThGKPOAsv7yGYIGV6qEiHYw2xCuXA1I3uOujrUAQ1rY9CB+FqWLIyOIc7ZdVAThYwSL/lgDa+XLckAofC6REEH8pRrT+GTD2oLmw/7aN0RIDVX7+vFHxG+R1dPpVwv6L26Qu9La6s7Z28vEOX+n3CRNSF1qCV5hL7EvD0smndamjgfSMAXDQfjeTNkVkUQZuA/yQm4OTqhi68cbs+tnseW3gEYvzCs104AxVDM6v9IMuyeDvqTSL69DFO3rgOWkkrE6YLJNNtY3dyN1r61mqydkF4gYA==
Received: from DS7PR19MB8883.namprd19.prod.outlook.com (2603:10b6:8:253::16)
 by SA0PR19MB4459.namprd19.prod.outlook.com (2603:10b6:806:b1::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.30; Wed, 14 May
 2025 08:11:39 +0000
Received: from DS7PR19MB8883.namprd19.prod.outlook.com
 ([fe80::e0c2:5b31:534:4305]) by DS7PR19MB8883.namprd19.prod.outlook.com
 ([fe80::e0c2:5b31:534:4305%4]) with mapi id 15.20.8722.021; Wed, 14 May 2025
 08:11:39 +0000
Message-ID:
 <DS7PR19MB888352D0B5157990EA5240139D91A@DS7PR19MB8883.namprd19.prod.outlook.com>
Date: Wed, 14 May 2025 12:11:30 +0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/6] dt-bindings: clock: qcom: ipq5018: remove bindings
 for XO clock
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
 <20250506-ipq5018-cmn-pll-v2-2-c0a9fcced114@outlook.com>
 <43dbdfaf-fc02-49f4-b2e6-5c08b1998d17@oss.qualcomm.com>
Content-Language: en-US
From: George Moussalem <george.moussalem@outlook.com>
In-Reply-To: <43dbdfaf-fc02-49f4-b2e6-5c08b1998d17@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DX1P273CA0029.AREP273.PROD.OUTLOOK.COM
 (2603:1086:300:20::16) To DS7PR19MB8883.namprd19.prod.outlook.com
 (2603:10b6:8:253::16)
X-Microsoft-Original-Message-ID:
 <8cd66bf9-a5a6-4f3b-9783-8c060ba51b4a@outlook.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR19MB8883:EE_|SA0PR19MB4459:EE_
X-MS-Office365-Filtering-Correlation-Id: fd0ca626-4d14-490f-b487-08dd92bef3b5
X-MS-Exchange-SLBlob-MailProps:
	zZTkHIKWWP9Z2DuRJRBOAeLG15V8iNU5hUAGNgjiERx5brp4W/47x9GC5wGGzM4jmzlCSLjbKIr98FUuHH0XpU/FXDdu/y/WGBnVyz6SVuNUZeORFDGfK12UYF5agMbC5h5pS0V1T34iLckKdy/XmXsW4UDoZVQwedT04lejgzY+H8M1cKJ0t+ANUYdLEqjyQ1aiCGQlWyn4pjW+O6dLY1oVIiHT5O4MrIVnk6iGrYAHdkygcxMdYwfn02rrMArQ92JyV8i89caoXRUc+Jm3Eevp56KJT7IYs7A2vhtLV9sTQUKRnHlJRmbYAsxLVWANp+rmrGsOB9ZoA9qm8stv8hF2EENcewokFbRxB6/QgVIrz4WAnwbubz1LjADWgicA91MJXSV3LqMB2YOQjFbuyWLBMgOxE9IJ403+s1+cMBwLSLZ2jGL3vb0qRREWrWRr2JO9NTZpsszHi/mv7kGW6hVqMrUNddFEBI0D6twDKFgyQdm7EEbki8IRz6X3iBYORAzHVhwWUYfF2lGlmVw4D0xqjUVGDi1t2tSvxSKTiKyBTLjtDq+KdNNqQDhsXTp+RFJUyw/jweq88QHQ9xP8VXsXlbteFJY+CVARQUol8Mx3hRMsuV+wVhp+rPyTCKEoV+o7AqIkQl2rZuD360DR+j0nf7u4YuNp7orqkrLICYOu43JW/PK1IQ==
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|7092599006|19110799006|8060799009|15080799009|5072599009|461199028|6090799003|440099028|3412199025;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cm8zd1gxMmp1VmJ0cDVWbVByOHBhQmVtMERRZ3ROUEJhbHhGQ29RVEF3aGJF?=
 =?utf-8?B?aFBLTTdtcEVnTElhR0t6bTRHNmExZENlLzJPVVY3NFd1dXB2MkJ2Sjh5Y2tF?=
 =?utf-8?B?NEEzZUs3VUpLT2pwNmdsTjJ0bnN0c2tTVnBoNVk4Wkx2eHNWT3d4Sm9xU284?=
 =?utf-8?B?Tjd3WVIzM2RLVU5XRGx4UU05emhFaWxlVVEzK3hqcEZLTVRic0NnZTYyMVBI?=
 =?utf-8?B?dkpTbFVTWjhudGdvUFhuSWJrRTdBT3JpeFpyc2Vrbkg0YXpYZXlGOHB6a3Jk?=
 =?utf-8?B?N1hEZnJpWXVsR1puUWJkRzFaazVOaUNKRHhoRmZkcDdvNEJrMzl0bHNTMEsr?=
 =?utf-8?B?a2w5VXZvQkROdHBlWVJkSk9OY2Y3bU1Qek5SK1lydUdIczlBeWRib1U3T1pW?=
 =?utf-8?B?ZDVHMmtTUXlZL0RHbGlhQ0k5WWVZRVhLaG4yN3JURmwwMjdJV3A1bEJSTzFI?=
 =?utf-8?B?ZHMydEl5MjZDdS9JNTg4NHFSbXRhSUw4Rnh6UDBTc1dlUENSd2FHSnFscm5n?=
 =?utf-8?B?UWdNZ2Q1dE9lK0lOQk9IZXhQZmYyYnB0NlFmY090M3M5OENiUGRDWkJCZHNy?=
 =?utf-8?B?djBTQURGL3hMbnBkN2p1bFJGckVzbHpuWGNMMGhlZzRLRk5hR01SbDMwbEQ3?=
 =?utf-8?B?K1J0RnNTR0ZVeXZkMzNiRjFEL0JNUERqS1hSeGs3MEpRd0E1aW9ITkwydDQv?=
 =?utf-8?B?MERsRGFBamJPMmlCWEM0cENXUVdsZkZsbWpPSndkNUlGMjV1cWpEZWd2dWZR?=
 =?utf-8?B?eDdNaXJCNWxxK3BPZWtmNUFDc09teFNrWDR0RnNieWg1MTJ4QTE2eVo4eDNQ?=
 =?utf-8?B?M0JxblRCQ0p5VHJuSGFVUmZENjRlZmNkK1QzUGxneW81NFllZ290aGo0Zyt0?=
 =?utf-8?B?TEhFdUFoYWlwTFpRd2VsNnY1SlduejNBMkdpcjFsNTNUaWhpMzM2d1NBWkdo?=
 =?utf-8?B?TWNEOHlCSXN5NG5Fc2V2cEZRcXc4VXVkZmJtWk5Ea1gydytublAwam9tN2Z6?=
 =?utf-8?B?RWlraWZrenFXeTVJMkpjWmFZNU56U3Zha1hIL1hEeVA3c093eVNOeUxKR3du?=
 =?utf-8?B?Tms3WFdCbHFaSnNSV204MjdCTDBTZTRvbWtEL242citEQm5EN3NBN3hUdjJG?=
 =?utf-8?B?WER4bndpTWY0Ny9LWVJsUFpoUGpvbDFZQjdtZXVDZXNkY3dSZWJ2QkU4c0dQ?=
 =?utf-8?B?c2MrNmJlRDUzNy9Tc1ZvMkgwQjFwTUp3NjRrcER1aklmRXdPM2NLbURycm40?=
 =?utf-8?B?R21DRStRS3k4QmdQcThBeWYxL2ZUT0JrUzdVclJ6OSsrL0daUkdQZGJVMGty?=
 =?utf-8?B?ZmR0bTlGanFvNEswekNvMzFxNTYza25ReC9wcDVsYjZyNDl3Rm1SSHE4K0Zh?=
 =?utf-8?B?b2Fra2lhYy9DTmZqK2lYUERJUGRtWEU4SW8zTUlDMzJjNFlUVXZpa1JyS0g5?=
 =?utf-8?B?eGxraElUbDZPdllHTHVkR0NpSTJtWHVxL1FkRXludDVXcFhUbG1HVzdWb0Za?=
 =?utf-8?B?dFZNU1JTcWxyRW1iNnJtQ01jR3Z0amtrWE1UWXlJa1I1eTk2S3o0K1Q0RUpl?=
 =?utf-8?B?ZjFBdz09?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Qm5XcUorUHRPVXFYQjVsNlo0WmNuT3VHa2g2ZnRycktFWWU2UUZqbVZtTnhV?=
 =?utf-8?B?c1NmSFVFbzA1amN0cEJ1R09XeFpqTVROZnBMamQyc1FkWjkxVGsxdjJiMEVq?=
 =?utf-8?B?S0h3a25LQ3dyY2FwNlJNVWlDQmxIc1lQL1g1eDFiUm1kaUl6VFZ6aHpuTjJE?=
 =?utf-8?B?bFkrS0ZLMlVNUVdaTk03SWp1K3FpL0dIZmpNWHorc1hJd01DR05CT1FzcjVD?=
 =?utf-8?B?ZkRoWC9QUlBCMVVnZFNhV2hiQlJXWTZvcEM0WEJWbS9oR050TmlHb0tMc0Uy?=
 =?utf-8?B?Y2UzeVYzR01QbWlCQTh0elVXQjhaL3l6OW95OXR6Y2NjbzB3NmIwdkJNMC9P?=
 =?utf-8?B?UC9mTzhNeTdhMUFsdUtTRzBNMkNSbS9MaVNDK2xZeU5KdE81RFZSRWVCMEU4?=
 =?utf-8?B?cWJHWExrOEtMdERKdUhXSjhJZE9LMW13TUhrQ1BYQW4zd1BOUzd4QmFZWjBI?=
 =?utf-8?B?RUYyR3krckE5U2RNbzhvemJUSGt1Uy9FcFlHRjRDZlZaQ09lZFFOcVZRcnRN?=
 =?utf-8?B?MFpINmhrSGk3TEFnQkt4QmI0S1B4WjhoL1NXam00S0xXdC9rL0x4SlRnRElW?=
 =?utf-8?B?amhsdU41V2VXUGc3V1h0RGZRa29lNlo1cUhtZXd6WFoyaXhYeUVWdDZRTWpx?=
 =?utf-8?B?MDh2VFU4WGJzNG9kZ1NPK08zblh5QVpOTUFWRlNBY3VvNVplNGEyaUx4YUha?=
 =?utf-8?B?UXRJTHUweDNtUzBRVWM2ZkI5NlI3YlFGeXhCNlpMQjc0TkQ4Y2R6UjNaQzhB?=
 =?utf-8?B?UmVuZ0UvdFpNRmp3cG45RWMrSE9Sb09HVzBWOHhnNC9FRFJHRVRFVkxYMThj?=
 =?utf-8?B?L0tOZDZNRnlNTDBIMmhyb2luVVBwRGl3VHdJVjVMbFpNQVZJbkVZc2xrSHpu?=
 =?utf-8?B?Ynl1R3NTMStXTVl2Lys3V0pVcmcyU29CejdMWnZsWnB0NjdweTVCNXlZY3RL?=
 =?utf-8?B?VUlSb0hqZ0l0bU5iL1NWM3Q5a2FpVENpSnJCTjlQRGpxTUhMRzFxcVZiWTdL?=
 =?utf-8?B?eWZKOThmQzBJQXRDaVNJZEdOMFk5Vm9vNnRQclBWM0s3TDFOS2JoVm8vUVJj?=
 =?utf-8?B?MUNMUDAvUWJNRStTblBUWkZNZ2ZKZ1ErbEw5S2lxeG14dUljQ2hqbTZ6SjZw?=
 =?utf-8?B?WjR3akRCOGZSVUdBeEEyRTNNV2tQNkNpVTkzaVhQTzVTTlRkWERjanZzS3pj?=
 =?utf-8?B?Y01mMTZkQnZtdTJJajMzNC8wTUtHL1FuaG1QQWg3L3Nta3lOK1JPRnVlMkNJ?=
 =?utf-8?B?dkp3OVZ0MUpGZ1kyRzRBdEhhK0lyZVo5Mm4zbElhOWgyMjdQdmhkUzEydWRt?=
 =?utf-8?B?Z2ZNTGV5TXd3M0FYdENBM0JMKzFGbThEUDk2NEw1cXBtM2lxanBIODVVR2Q3?=
 =?utf-8?B?aDhDbFgvUkw1bVMvK2lhNXcvcVdaTHBZQzNJQkVVeXZvaDlHV2xsRGh0QlUx?=
 =?utf-8?B?OU1XcmQ0MmxlSTlyWjI2UUExVmJ2WTBMRUZsQkd5NFk1QUpSWTR0bHRoYlVV?=
 =?utf-8?B?cllJOHVBY3o0b2tlZ0MyS2VRQnpKa0tYRmExUFdXZ0E2MkhkNkp1anZiL2NO?=
 =?utf-8?B?YkI5RnJ6V0dqZ1pMRjhma0FPQm1idzIvZG53NE8zWlpmQXRYQ3o0TGJBMG5C?=
 =?utf-8?B?N2kxMXpCTTRKK0Rrd0dHcEtVYlBKS3lraGZuWEJ5TG9NZjNmS3djUlBjZlEv?=
 =?utf-8?Q?EXvi9KzJm5Eih7/4uP0s?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fd0ca626-4d14-490f-b487-08dd92bef3b5
X-MS-Exchange-CrossTenant-AuthSource: DS7PR19MB8883.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2025 08:11:39.5461
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR19MB4459



On 5/10/25 01:48, Konrad Dybcio wrote:
> On 5/6/25 7:43 AM, George Moussalem via B4 Relay wrote:
>> From: George Moussalem <george.moussalem@outlook.com>
>>
>> The XO and its source clock must be always-on and is enabled in the GCC
>> during probe. As such, remove the bindings for them.
>>
>> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
>> ---
>>   include/dt-bindings/clock/qcom,gcc-ipq5018.h | 2 --
>>   1 file changed, 2 deletions(-)
>>
>> diff --git a/include/dt-bindings/clock/qcom,gcc-ipq5018.h b/include/dt-bindings/clock/qcom,gcc-ipq5018.h
>> index f3de2fdfeea11f4b8832b75a05e424ca347b3634..d4de5eaffee7b4cb81e0ff2dcbf9e6669c3da8f8 100644
>> --- a/include/dt-bindings/clock/qcom,gcc-ipq5018.h
>> +++ b/include/dt-bindings/clock/qcom,gcc-ipq5018.h
>> @@ -140,8 +140,6 @@
>>   #define GCC_WCSS_DBG_IFC_NTS_BDG_CLK			131
>>   #define GCC_WCSS_DBG_IFC_NTS_CLK			132
>>   #define GCC_WCSS_ECAHB_CLK				133
>> -#define GCC_XO_CLK					134
>> -#define GCC_XO_CLK_SRC					135
>>   #define GMAC0_RX_CLK_SRC				136
>>   #define GMAC0_TX_CLK_SRC				137
>>   #define GMAC1_RX_CLK_SRC				138
> 
> Let's skip this patch - when we add dt-bindings, we promise these values
> will be an ABI, leaving them in there, even if unused, will help
> introducing spurious entries

Understood. Will omit this patch in next version.

Thanks,
George

