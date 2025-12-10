Return-Path: <linux-arm-msm+bounces-84897-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B0F66CB2B60
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Dec 2025 11:33:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D4B3E301C9CA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Dec 2025 10:33:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 699E8314B95;
	Wed, 10 Dec 2025 10:33:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="U2Ot8htx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazolkn19011012.outbound.protection.outlook.com [52.103.1.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 063253148B7;
	Wed, 10 Dec 2025 10:33:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.1.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765362813; cv=fail; b=f0LRA+1IOWb05aX6pJCpX9yww/kuqI0azmTzRZEUn/iUhrHRK+CMDojwbmCpamJlMPcF+ILnL25IzAZGjaFOTj8WrltG/gJ+NowY6n8C9fPqX6jlSRVYf6eP31Z3S0qEuZPnLKurmRjWW3XYTED8vkLs2G7i/lyilW57trh/woo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765362813; c=relaxed/simple;
	bh=D/mJUIOsj+DxPJ10LHMWh97+ceam2GdSIft1M3t929M=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=AgMlW5Kg61AAIij6UNLlv25q6NTXLt3eN/w0vU0rbV1UGJq6+76sC+nJl2giha+O17UgkOqGKP8+gD0oaxWAFfIg1BKiALmgPy9tUhQU+HYjPLLfV3EhEEEa53ILeIKO18S82R39nHgGUlKXkBp+O2GDkNAZ9GwXOA62eE0zTOQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=U2Ot8htx; arc=fail smtp.client-ip=52.103.1.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Hkb+8UMQI3juAE6IIIxfoTzEeWnauT+kHUXtFkELzsXiDHOslVB7OkId9n6Z2pNOIU9H8xEf0D2+fk8pkkWIpKl25xPbSPg55bZLkoSw4KWw5Zt8ceThycflqYbNxYDxrO3HSXLtQpjnib9040ixgKax9zM1k+NbdMJolHWRxCKYX3NZgc6TyFUdU7b+U51teNTNrtwavzHVZghbP0SSg7IE5I4GBXUA5VPggbpDMUvWgLoKIaFJq6Xtv5u35lVSy2X/yygO5rcxzdaHe2Nf28Mw8Q7YF3eKpxqsPFes2FoIv9TYxwO4Koc1ykrJJPt3Ez6yR9yMz4y1DLplrOOZsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T7qeaZiMxh7mUnP59w36NF8rj/Sr0mLd2vYJMOLFrJ4=;
 b=PvK8RWxTg7aU+bvXKodEK8eQ1VGmA8XU/kuMcXCxF0FBRaTNKLScIndeJkQo3oSLXcpXIbv6ovRO4ZrcjtiMwQ1YXr/tY8MxN8+UQ2+s9yor7ZACYOUewPp2JEjMyEjiqvTsBgdIwandtFL8dA/ThxZqVKEdF6R/LIO+k25mdQ74gcSqfQHtOkzAVPzRaveYkGUmbG16NyIpoTYvU3Q0PEnCa3oNICAkx478M9Fr7EQuzV/8eoYx2iLOCtUUmSw105YFIGYJfkNRjgIzvy1BJB1Yx0D+OvTGsfGExCmu+zmIPK1NWV5Rn2h9EdMRo18mmDzXaVLIGwgOu1+Di/NVHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T7qeaZiMxh7mUnP59w36NF8rj/Sr0mLd2vYJMOLFrJ4=;
 b=U2Ot8htxixfNT09yO0HLJ1rE0zrsxaUSaTMsH5h9AUpk3QoNlHX/bAOyDvU9opDUzMhW2ORCdfZCBLvr1jK+h29NcC5wyMw+8RBNnn7wptjo2UtuMJRNh0MAmSE00qk82x8jhxe9+1Nqz8WPCkiogl0eNTpeFBKbCKyti0MmlWAlbAVvSJLoWKbCnZqk4TCXT05eL37gl9D6WktQPOEFEuD5j10YDQiRUjc0bIyDbhv6ZPD+KKMAdjDV5hN76GYql+rdDc1hiDtxC/mtOvSziD4MzqfxL3JPsU8CZLnDevdUR0c/gFSRsUrLFTEGzm9NZBhlcvFIx/J6QXil9nuYaw==
Received: from DS7PR19MB8883.namprd19.prod.outlook.com (2603:10b6:8:253::16)
 by SA1PR19MB6669.namprd19.prod.outlook.com (2603:10b6:806:258::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.8; Wed, 10 Dec
 2025 10:33:21 +0000
Received: from DS7PR19MB8883.namprd19.prod.outlook.com
 ([fe80::5880:19f:c819:c921]) by DS7PR19MB8883.namprd19.prod.outlook.com
 ([fe80::5880:19f:c819:c921%5]) with mapi id 15.20.9412.005; Wed, 10 Dec 2025
 10:33:21 +0000
Message-ID:
 <DS7PR19MB888320190F3C44CE78D937B29DA0A@DS7PR19MB8883.namprd19.prod.outlook.com>
Date: Wed, 10 Dec 2025 14:33:12 +0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 6/8] arm64: dts: qcom: ipq5332: add nodes to bring up
 q6
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Manikanta Mylavarapu <quic_mmanikan@quicinc.com>,
 Jassi Brar <jassisinghbrar@gmail.com>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 devicetree@vger.kernel.org,
 Gokul Sriram Palanisamy <gokul.sriram.p@oss.qualcomm.com>
References: <20251208-ipq5018-wifi-v6-0-d0ce2facaa5f@outlook.com>
 <20251208-ipq5018-wifi-v6-6-d0ce2facaa5f@outlook.com>
 <hpqk5f57kq7j2zkntzfevvgxhvfxqf6ittqexmwwuuwsuftgbn@4n5dir2jjuve>
Content-Language: en-US
From: George Moussalem <george.moussalem@outlook.com>
In-Reply-To: <hpqk5f57kq7j2zkntzfevvgxhvfxqf6ittqexmwwuuwsuftgbn@4n5dir2jjuve>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DX0P273CA0064.AREP273.PROD.OUTLOOK.COM
 (2603:1086:300:59::11) To DS7PR19MB8883.namprd19.prod.outlook.com
 (2603:10b6:8:253::16)
X-Microsoft-Original-Message-ID:
 <48f5dfa1-8651-44dc-baec-3284c1c75863@outlook.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR19MB8883:EE_|SA1PR19MB6669:EE_
X-MS-Office365-Filtering-Correlation-Id: fcf30fb4-b69b-447b-c9fa-08de37d789aa
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|5072599009|6090799003|23021999003|8060799015|19110799012|15080799012|51005399006|461199028|40105399003|3412199025|440099028;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cnhIYXZ2OCtCTVJZR1dMNVljNUNQc0pKbFZxZlFKUDZ4QWt4eTFDOGdhWnNZ?=
 =?utf-8?B?bzRBTWtYRzgxbmc3bVpZM0FFd0VWKzRyODhoRXQwRW4xM1IrSFVMQnVRNjdS?=
 =?utf-8?B?ZEZxeE1TQUVaVjNZeTQ4eG5aR1VOS2dXbmRvcGZueXljajBZdkpzM205UkYy?=
 =?utf-8?B?MDRJYTd6MWJOOTFsclROZ0xPdTlaTk9yUmFySis5S2dWYXdPdU8xZTljeVdS?=
 =?utf-8?B?R3ZvcEpjY1ZlUU53UzYrTVJKd3h5TG9hMUl0czNaK3VSZnNzZ3VGN3FsVjEz?=
 =?utf-8?B?QklJNzltb21zdFdxRXFadnl1Zm8zd0JPWjVoSUgrblZSei9TdUFrVlJ2NkRE?=
 =?utf-8?B?a3hRNTgwSjF3UFhLcXgxZmt4TkhaKytSOURNTDlrNkVpZTRvaW05NERpWmE4?=
 =?utf-8?B?YWhNRWUzdGJJT09aRGxma2ZNMHp5Ti9jMk1WVlRlYXlaakJGYnduMHBnaUNR?=
 =?utf-8?B?WGpnTk5vYVMzVitSaDUxTVJidGdCamtpNDVpb0t4eVVpVjlSSG1uRmxhVHM0?=
 =?utf-8?B?QjFOQ3dQN2xWa3Bza1ZDejY3TjJwSFo1WjdRcHZ5ZnhIZmwzRFdEaXo4UXVY?=
 =?utf-8?B?MzAxcmdyYVpKUERtWUJDUzBodFZNZ0hHa2h4R1RxWHNtUEZ5Nm5FQTBOWFE2?=
 =?utf-8?B?RnlFSjY2M0NHcGZURmVUQjZFeHIvUG1ESlN6YWcvUXJMK0haZzZhWStpSStC?=
 =?utf-8?B?enlncmJ6OGlSVStGSGhPZDgvRFpic2hLNE92T0FiTWFDZkhYWlVBMXNmdElN?=
 =?utf-8?B?OStPMGJ4VVp6eXc5czc4bVdhYTRaSU80ZTE2b3hHekw3VkswQkZiOU0rWjhD?=
 =?utf-8?B?Y21Ia0VDNVVaUFQxMGk4Rzdoam4wQ2pGazZJL25qd2NhVm1lSzkzNGladW1r?=
 =?utf-8?B?NXJDVkRybU9Za09TQnhlNXVWMGs1TDlIZlhYRzZPU3lvV1IyV0F1VVVoaWd0?=
 =?utf-8?B?VGNKeS96MXUzczRuOVVjaG5aVUNvMGdSYzBLcERDNHlBaktDUjdRRit6Wldi?=
 =?utf-8?B?V1ZzbXpnVkplam1jUGszaEVrWUJtT0dmMjA5enFjSGUxY1Y2SHdVdVR1Wm1F?=
 =?utf-8?B?SGdzOTJ4R0JvSStRaHhUWnQ3M2dlRXNUMTkxT1pIVElncnZTUUpQTC8yTG9S?=
 =?utf-8?B?aTNmUFYvUWM2ZmNZM3pIS1J3VThzckJyZ1lmSjBTQVowMm9lL0h1VlUvN2h2?=
 =?utf-8?B?eS9FSXVaemFaS01tYUdreU9JZy9GZlBUcjFmbGtwaDhvUWxqdzl5S0lnNDEv?=
 =?utf-8?B?ajlJYjUwUi9aS0tDQUF4bVM3cFI1cURVRUJQR3pSYVM5ZlFsdDdsTll0eVpB?=
 =?utf-8?B?WExaa1FhTUJ6dForZGVvN3B0ZkVZaHJtZUhndHJCeHdIck9uRURVdDFHZXJm?=
 =?utf-8?B?SU5EbmM4RkRYbGhyb0RCTnBsTXh6SWgzT2tWRzlNbC9tYUpXaUJMQk50Z3ky?=
 =?utf-8?B?a001ZFV1UFBoS0ZiaFRmZGVzWFI5a2cyNEl4N2xHK3c4Ly80VTFGYnlKeWNr?=
 =?utf-8?B?OHpWNWVXOEZTRm1HTUhTNjl5UjhKWDRrdWFTTHF3SXJocGcxMkZJaFVaYmxs?=
 =?utf-8?B?WFBaM0V1SGd1WFpTTjdjeHpJZmF6NzU5a3JzSnJqQW9SR05uMmdvSGlkOTlz?=
 =?utf-8?B?QnJwZXpmbUtkRnVEdDlNTGtSM3lDdFE9PQ==?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eFpMUDFoZDhMMFQvZjhIRW1BcUNjbjU5RWVnU2VaelQwcHBveUliTEZlZTht?=
 =?utf-8?B?clNpeUtsbjJvSnFMVkRZcjY1a05VTEF1Zys4eXRqTXBYUmlSMWtlOHp5Ykda?=
 =?utf-8?B?cFhKSjE2NkJrZkVSUGljeFh5YXdzM0ZsWmdxa2hxSFRxSGFlNDNYVzJjekRw?=
 =?utf-8?B?Zm9nQTVQalpmdWxIZWlMa096eC92NTdJQ2h6NVo5V2hMMmYxM3pkUTRlWDU3?=
 =?utf-8?B?M24yMHk1V0lVdDRLS1dKYXBIbXkyWmlBTGNnd1JyNCtNTVovdEZsWmFuaVJS?=
 =?utf-8?B?eTYvd2RRMWEzMUZveWJHeUxuSDFzWWk5U0VybGdJSFpzRldYVGZLZm1NWjBo?=
 =?utf-8?B?UzBRSEtrTkpmbFBYRFl2OURKRGtJSGtzNituZTMzUWRwd2h0WjFtZFArUlN2?=
 =?utf-8?B?MGxRVlFqUTd0N0JZOHJJanRqZ01DSTBtbVFXKy92L3F2TXRkSkxYeXAzdGxD?=
 =?utf-8?B?a0FBNDZiK3hyMnJNR0RiZDVEYTVtbFlFRHhHUWJaa0tPblFtZUxrcnE1dFla?=
 =?utf-8?B?MDd5WCsvcW5aRjJUNWJVdVdyckMwckRVdGs3YURrZExBY2xlcXFRR1ljNjJ0?=
 =?utf-8?B?SFZycGhMM3U0L2hJTXZML0RraDF1N00xMkJ1STE4c05lR0JVWk15b3BRaXEw?=
 =?utf-8?B?WDl1SUZ0Y2E1d0FnZlUvU1J6M3VVUmtUdG90S0RVdkRKMSt3VWYzQWhPeTdv?=
 =?utf-8?B?YmZXWVRXQzZPcW9zM0h0dXB5aGdXRnlnYXp2K2owaXNMRCttRmxJcUZvQ3Ev?=
 =?utf-8?B?aVlSV1BLS3hPOFlCUnNaU0RuVXc3L3dUTkRZQzVMS3R2aXUrZ1Q2SkFaWXVH?=
 =?utf-8?B?SUxvZW9vUE9JQUZYU0J6YlF0WExaYlBKUGJKUFE3allaREQ3VFptK3N1Rmx3?=
 =?utf-8?B?MTUrQVN3cTBoZUs2cFNtRWVuaHlPbEw5ZW5RRXdHWnVmL0VGRHdzcndnbFlk?=
 =?utf-8?B?UTlFYndMb1NQVmRoYW1pczFQcmtSREtFejBUTlVQdTZja1RaenhPODc3WTdj?=
 =?utf-8?B?Y3gyWTlYWGpvU0xyTTFYMTJsbGQxN1M2L2M1Zlk2b3VkQzBoakZ6Tm5ydVlD?=
 =?utf-8?B?RU12OEZGTUxxbm52S2RieUNrT2dpQVNOaUJPZURTWURvaUxDc3kwbmtBR1BU?=
 =?utf-8?B?ZmJGeW42ejhwNDltQ29HZzVCOXRZb1UzNGFDQ1RDSTBNbTFBTzl5aCtTbStG?=
 =?utf-8?B?bGZUdlQrMEtPWlBMQWtEbU9TbG1rcFZYb2ZkTXV5SjFRSXlDaWJjRGxrRG5n?=
 =?utf-8?B?YjVuZ1FPTnY0bTNjbGN2eVFIUSttcnBPRk1TR3FMVjJGTEozZFRaUHBrSTdj?=
 =?utf-8?B?ejZHOERQaUVTSUJxb3NKRjZWMUQ1VTM3WjZLZXV4cWZHS2JnS05ENC9DYmdV?=
 =?utf-8?B?d1RPNEJqYmw2NW5zMmJER1NyQWN1Qkc1SE5FV243V0hkcWNJaUI2YklVWThw?=
 =?utf-8?B?WWU1b2xSWXlDSnRDaUo3OEpCV2UxeVhIYm9HZFFTTkVDZUJQM2t5TzB0RVdY?=
 =?utf-8?B?KzJKbEl4cTVwMjRCSndGR2xVRExLL3hRb3FuYksvUUM2anZrS2lIc282Z01I?=
 =?utf-8?B?Z1lWbHpYczU4NVA3V1JMU1F3S3grdHN3OW5DTTIyZmp4c1ZlN3ZDajhtZFhh?=
 =?utf-8?B?ZmJ2VE4ra0lUS2tYcktMVS9PWjlyN1NhcDd1SVZidUJySzRTK3R2Y2paU2Zq?=
 =?utf-8?Q?5HWQ1XF5HPW/BMZJj8/3?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fcf30fb4-b69b-447b-c9fa-08de37d789aa
X-MS-Exchange-CrossTenant-AuthSource: DS7PR19MB8883.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2025 10:33:20.9179
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR19MB6669



On 12/10/25 00:06, Dmitry Baryshkov wrote:
> On Mon, Dec 08, 2025 at 04:25:38PM +0400, George Moussalem via B4 Relay wrote:
>> From: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
>>
>> Enable nodes required for q6 remoteproc bring up.
>>
>> Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
>> Signed-off-by: Gokul Sriram Palanisamy <gokul.sriram.p@oss.qualcomm.com>
>> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
>> ---
>>  arch/arm64/boot/dts/qcom/ipq5332.dtsi | 64 ++++++++++++++++++++++++++++++++++-
>>  1 file changed, 63 insertions(+), 1 deletion(-)
>> @@ -871,4 +909,28 @@ timer {
>>  			     <GIC_PPI 4 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
>>  			     <GIC_PPI 1 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>;
>>  	};
>> +
>> +	wcss: smp2p-wcss {
> 
> Please keep the nodes sorted by name: this node should come before
> soc@0 (here and in other DTSI too).

Thanks, will update and sort by node name.

> 
>> +		compatible = "qcom,smp2p";
>> +		qcom,smem = <435>, <428>;
>> +
>> +		interrupt-parent = <&intc>;
>> +		interrupts = <GIC_SPI 418 IRQ_TYPE_EDGE_RISING>;
>> +
>> +		mboxes = <&apcs_glb 9>;
>> +
>> +		qcom,local-pid = <0>;
>> +		qcom,remote-pid = <1>;
>> +
>> +		smp2p_wcss_out: master-kernel {
>> +			qcom,entry-name = "master-kernel";
>> +			#qcom,smem-state-cells = <1>;
>> +		};
>> +
>> +		smp2p_wcss_in: slave-kernel {
>> +			qcom,entry-name = "slave-kernel";
>> +			interrupt-controller;
>> +			#interrupt-cells = <2>;
>> +		};
>> +	};
>>  };
>>
>> -- 
>> 2.52.0
>>
>>
> 

Best regards,
George

