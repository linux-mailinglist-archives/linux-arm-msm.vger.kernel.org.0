Return-Path: <linux-arm-msm+bounces-40039-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 770879E16A8
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Dec 2024 10:06:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3CBA91605EA
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Dec 2024 09:06:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CF781CDA17;
	Tue,  3 Dec 2024 09:06:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com header.b="JiIKdhW/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05olkn2077.outbound.protection.outlook.com [40.92.90.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C7A81CD204;
	Tue,  3 Dec 2024 09:06:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.92.90.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733216809; cv=fail; b=RpzR4pc62euWEcVWG3dmUamwILHlIZ427gx3FVhWUPQgf/TpD6Qui+Qef+HV2EQhSmigfBQIenVhCuMC4r1HZ8i+HMJKtUTpOpJzn4+lyxBzkg3nMEorhiX+OaBFsPCcJFA+sEHaHSy9E1js/C2MnPFmnZlIZjJ3cqMJ5suJgXM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733216809; c=relaxed/simple;
	bh=qbl17YpXWl40TcX1b/Sc8xuncWP1vR+O2QPJL4swdN4=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=klrmUF25TJA+CORrbvJI9v/t97kNlSRa4vqsqCaPW16cGcag0Zt1JFCgyeivAJbUFbgsymPpAIL+ZiOyyTRUDl64rFeJhd+dXvmkrg10K+Ds+AjZFWNTV2eE1nyPj3F/ucRYt5TF/ZinuB7EcF6woyw1bKLi9S/HWTkJD3d/390=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hotmail.com; spf=pass smtp.mailfrom=hotmail.com; dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com header.b=JiIKdhW/; arc=fail smtp.client-ip=40.92.90.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hotmail.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pH2IOZUQTWHTUgxcVggPFSkqKALkcomdXz2r704BFlCsssA/10I6ECca396RPkxKRUyjlzA18eYsa/DlBUuueONMTTnxXdKC6q4Th+xNfgUs0Ih+N2NgOQEgpPWCV6DlC3K3oELX9DysouqgrQNJ9VsLghAy+FehIAIU5+MsiCbQTGGK1QyUZESI1+ofQymGYhk+nGDA6rE8AIKPuQ+nyPSNyUYQLDtXcGaJbu06oq4bPFKHg0NiejycNHR5Sc8oa+s5tmpkAmiogjyBN3pF4F91Eh/Q+Siryt24nFNmZjZU8Pf4b49dj9qVVGeLgi89BoD5IgRd3QEsqbEC/4jrwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WbGikG1YHHyfWleTKYVwHDMUiPZNxf1kvTNnvcal+/w=;
 b=KP8+7A/TV0OI9BZcUL3Fl++XoKV/woOveI2aX4B10c2LVV6ggvFXxMki8DMLewxJRCasPX7UYXpz+5tSZGhoihXD5VMQ9MGMBBeUeMiLdwsbOyJ2XFqHPogn1N5ayNQFfq+p8JRSlc94zWIqmvPcjOAWyJluW1cSxOvDSlwLGNFS4csM3pEY3tLMEfq1LenRDWd4aG7rKATzs+qkqV+qRlwL5DSxbXcSc7zqHuwWZwxkQRfwziDgRoaPIRqOVma0x1atb8+zLGcZIscVPBm9hxiWT/dnUHrJU9RWftnmtkH7T37F6GfT4pB+eKKufiGDNXWeCRIwhIlE3+9qp6nzSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WbGikG1YHHyfWleTKYVwHDMUiPZNxf1kvTNnvcal+/w=;
 b=JiIKdhW/yb+sFrGyYnBGFwKa6s6G8huOswNmHw6VCIuJAiTOQINBwWc+54+OpDOZIOUIt9YkxdjvqSNNbytfZEmamGRbMC+mcZpH34Qv9tkc5fuSPtNOXg5rVdE6pxROmUoU4jyUj/d5fePNQmRITSiyiYkny3ltMIiPWw21fuJMy1CMdezf43cHWmvkh7Zw95eBlcVE5Rv+DXN1wbq4jQPMKsF1D8UX1DxnOyULUA8QfUCQd4AIwgfwoIaQP7u8t5vCPl4Kz7kGvjtImQMMvQmtl3o05Sd9RV2e5dXe7Vt2UFX2qoCiM8SWzt8FRkNagz4Ruk8AlnK51D5k0HJe2g==
Received: from AM7P189MB1011.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:177::15)
 by AM8P189MB1252.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:24c::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.19; Tue, 3 Dec
 2024 09:06:44 +0000
Received: from AM7P189MB1011.EURP189.PROD.OUTLOOK.COM
 ([fe80::d5bc:546b:e438:6ffd]) by AM7P189MB1011.EURP189.PROD.OUTLOOK.COM
 ([fe80::d5bc:546b:e438:6ffd%5]) with mapi id 15.20.8182.018; Tue, 3 Dec 2024
 09:06:44 +0000
Message-ID:
 <AM7P189MB101131A5E18B815B42AE9F7BE3362@AM7P189MB1011.EURP189.PROD.OUTLOOK.COM>
Date: Tue, 3 Dec 2024 10:06:43 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/3] arm64: dts: qcom: x1e80100-vivobook-s15: Add
 bluetooth
To: Johan Hovold <johan@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Stephan Gerhold <stephan.gerhold@linaro.org>
References: <20241202-asus_qcom_display-v5-0-e0d3752ff71f@hotmail.com>
 <20241202-asus_qcom_display-v5-3-e0d3752ff71f@hotmail.com>
 <Z07GzL3suEjGlnwF@hovoldconsulting.com>
Content-Language: en-US
From: Maud Spierings <maud_spierings@hotmail.com>
In-Reply-To: <Z07GzL3suEjGlnwF@hovoldconsulting.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS4P250CA0029.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:20b:5e3::19) To AM7P189MB1011.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:177::15)
X-Microsoft-Original-Message-ID:
 <3f1c7990-2b75-457a-9f72-b4140fbfaaa4@hotmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7P189MB1011:EE_|AM8P189MB1252:EE_
X-MS-Office365-Filtering-Correlation-Id: 93d4b44f-98e2-4950-a074-08dd1379cead
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|6090799003|8060799006|19110799003|461199028|15080799006|5072599009|10035399004|440099028|4302099013|3412199025|1602099012;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QkxOaXlycWVFVTJ5ZHJqcXVyVHhhUVNzdzF0WDhvSlB2a04yQ3I1MWVKNTdP?=
 =?utf-8?B?TUxkMERya1dVK1JGbFhsMXU3UnlGTkFGWDdpNXNpWTFjV254OHBaQnBZUjNR?=
 =?utf-8?B?MDNwMGw5WFRqMjV1cUV3cm9jQ0NzNjYvU2FjbHB6RmQ5YnFTYWgvR1U1RmY0?=
 =?utf-8?B?RkNRY2Q4S3E4YVRBcmRnNFFLa1RPLzFOV1Q1dXhQdGoyd1NVRDZjUHdPQ21R?=
 =?utf-8?B?WStpVXJVdzNteGY1Q3E0WUpLSm1Mb1BKM2N6djBnQUZrM1Vsb2tiTkM2SmZF?=
 =?utf-8?B?aWQvSDRiREtxVjVQQ1RxTnBmU3FKVmppNHRITi9EcE5IYjVBSzVtN0JBU0lN?=
 =?utf-8?B?eFBncFZyZFNTOUVwaHZqSkFOdXc2TFJoN05GQ3d6SmlHL0hrWlhSV01yQ2dp?=
 =?utf-8?B?bDFSVVR6KzVaTGFVSElyRjE4N2srekJZL2VhbStsM3V1NmlEdy9rRmt1bEFn?=
 =?utf-8?B?SlVoRXJ5N3RwWU80Um9NQlNQTWljWCtIbFhQZ0N3cjVIVnpVVElvdTdiS1ZH?=
 =?utf-8?B?RkxWNnRyaktDbXh3ZDZFbGtVQU82Nm5aL2EzbjdBMi9JUEFqSmxnZ0JQZzA5?=
 =?utf-8?B?eHB6YXR4TjI2ZzBOazdXQnlJcXRjblFwenBmRnNGTWdJM2k5UEFNSTJSUHQx?=
 =?utf-8?B?bElZdnAzUVFMK2Exbi9zbTBscU9HWk9NOXRQTjg0VnUvL3lVLy9QOTBhcWxX?=
 =?utf-8?B?VkdxWEdwdHBUVURxN2ZQOGEvK2orQUU5QStVc08xWXp3WDBWUTEzSS83K3hL?=
 =?utf-8?B?Q2g4NldiVGJXZlNGWW1PMGYyYlhLYVVHNERqOEJITGs4eS84VXhUTVFZRFFh?=
 =?utf-8?B?L3FaVTBYU3BEa0tYUTlISW9lNFN4NTlUK2VQVnBhU2o3R2JTSzVzcyttck96?=
 =?utf-8?B?Q214Y3I2Z1V5MEZEU2FoRnBCV2JVcVQwODhLNE8wMDB5Z2R1OTNPVzlSTHhi?=
 =?utf-8?B?NHgyYytiYno4bjlNRS9wQjBhVkw2cnVuK1ppcENyR0FHWU9pNDlPbEIwamRn?=
 =?utf-8?B?ZmtsT3ppb1diSGFVYUJSbWxjcDdTM1lxMHBzZFphTVRMQy96ZTVnR3Z2R1hP?=
 =?utf-8?B?c0tpZmtXcGZQU1gxVXJiekxHZUFPRUhZam4venJIUFpTTTdmRGo0K0V6elV5?=
 =?utf-8?B?LzZSUEVvL0pDR1hoYkIzNURqL3Q1MDVhdm1VMEFpY3RWQjRSTmF6T1dKWlJq?=
 =?utf-8?B?TzUzL1FrZHkrdVZFU3VpQmIvSkcrRjFTUWxpWklmSHNzTTN5MXdNbjBoSVFI?=
 =?utf-8?B?ekFlZlBTSDBkMGFTeWRZZXdUcDM5c2Q4NWZOTWxQRDdEK29WNklhNm1wbGho?=
 =?utf-8?B?OVdBV1VpNm9PWTJ2RHo5cnA3OHhEQUtPbitpNXgzUExpNXlLaU80M2F1ZndI?=
 =?utf-8?B?R0Q2T1lQQVg2VVJmT0kyWThnTGxrMldBTW54RjdHd1lQZm1PLzlkT3BuV0xt?=
 =?utf-8?B?NVBCRzFBQVlWSHNmSEl1OS92QnVVRjFWWW4wd1B2Sm12djVyZUlaWDZSYUMw?=
 =?utf-8?B?b3RiWlFGRFFjQ3RsbU5UNlVBL0pIb2QwTmI5TVFNVkpXdkptdEl1bE8wTG94?=
 =?utf-8?B?emdJNC9xWFgyUzA3by80UDVCb01lL2x2aGNMM1VHUDFaMzRCcjdCTFREdVNF?=
 =?utf-8?B?emdVeEZPdGpoRk81bjdnVWpHTEVzNHc9PQ==?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?elBpK1NnSStGZWJ6R3IvTWpBRU9KSzRXMjRZcG96VTdSV01jYkU5V2VyeWlJ?=
 =?utf-8?B?Yk1NVGhFVjU2TWtiVWoxdWMvbG5LelduR1FyTVdZTE9aVS93dnJMY2tURGM2?=
 =?utf-8?B?aUhqNFkwdkE5RzhHVlZTZW0yN29MRUxpWmJ4UGdGZUhlck82ZzZFVHBTeUE3?=
 =?utf-8?B?MC9rR0R0MmdVYWdRS3BEUFRxeUM3aUp4NmpNc2lNdk5DRC9jRjVoSE1PQ0Jv?=
 =?utf-8?B?Y1VVQzRmUTBwV1ljQzFoMnlPWnVmUGM1NmhCUzRwTERZSDIrVW1uQjR6UlND?=
 =?utf-8?B?Rjludkd1d2o3L092eDdkclN2UkVqUDU4bHluMnlveGYyMU5jSHRCL2NWdk9o?=
 =?utf-8?B?dnU0OFRFL0Z6MXlCL2Jua1dYUC9UbWxHTmlJS3N6VVRRVmx3aHRNMHN0bjU2?=
 =?utf-8?B?eHJEQUJsbDFIRUJ3dmdtTTJzNE9VanhPMmxiSFF1Y1ZoZEIyL3Z2VFA2MkhL?=
 =?utf-8?B?RnNyK0RYM0pLRFExWXFVOWVicGdFek4yMGRpaVRiS1NxK2pQOXpxSzdxdzha?=
 =?utf-8?B?anJhNVkzckdROWhpWlhqQXJqS3BFbEVVYVBWMnNGb0tvV2UzTlB0SzE2NFRl?=
 =?utf-8?B?aWR2Nzc3L0I3NlM2L0h2b0lYQktkbC92MUJaRkVISnlQM3IwZ29zNW1MSGts?=
 =?utf-8?B?K0FaOEJoRHRUOWZRS2FOaloxMFEzUlo3WktXeTh1T2MrQ25PRHNRQklvSmRS?=
 =?utf-8?B?T1JGMmdWeDZnSHhhN2drMUdPa2FLZG1PZ3QxZDhDWDZSMEF6cHdDOWVQWHdB?=
 =?utf-8?B?Qk1rUTg5WjQ2cENyaHh6c25VYmN6Q1cxdEIrakhVUXorbnAraW5SWndwV0pB?=
 =?utf-8?B?ZUR2elRqeVltSTg3MkxkL05seE1aNklEMElobXdEYnpUVWxVR3FtZCszS05p?=
 =?utf-8?B?NXFJZTdFRmE1d0dwQTNqaFRLZmhpRktVNGVIckMyOVVDRmJvN1NUZ0V3a3U5?=
 =?utf-8?B?SVAxbllBUU1aNEplSDJac0ptYm5WZ3JnTTNibnMxZ1NBV3NDWHpxWnl5dXFx?=
 =?utf-8?B?UlJPZFFPaW8vZE1Gc1ZscXREcjdEVUVod3I1ZllSdWFXZTFsc2lYM0VsZHVy?=
 =?utf-8?B?M29LajI3cjZ1Q2I2QllMTHh4WHkrU3VkRG9xU3VHU29BNTB5ZVI4REREMUVo?=
 =?utf-8?B?WU9XQ3F4eSt2UzRvbkwvektQTGgzSktiem9yTVd3L0NIcHEyS0JIVDNIVDZB?=
 =?utf-8?B?NlpIMHNXNHF4MlY3aWhpd1dHZWFKRTU4QjE0d1pMUVFteEJ2eWlQNzQrMHlB?=
 =?utf-8?B?R29CMWFmSzAyc2Y5MkpSZlR6a0FBVzltTmxYSTJxeUpCSFZHU2NralJHTHRF?=
 =?utf-8?B?dzlRenNNYTI1dGhhQ3NNTUtCR1luWHBQdWFRU1FzZ0pjYitKcEt2TTVJZXcr?=
 =?utf-8?B?Ky9HTU04OXFHQWtFWW1VdTNEdGYxeDkwNElsZlQvUEQrQlg1QWJxRzFjMWtr?=
 =?utf-8?B?Y0p3c0lxZ01IenlFSjZyaWpPSEc2RWxrcHNvREJEb1M5TzMxZ1pUODUzN2ll?=
 =?utf-8?B?S2gva1VxdjVYV3hSM0c5Mi9KRStaejZuckp1ZC9iclIzWlV0Q25JcWp0S2xE?=
 =?utf-8?B?cnZTZ1VreGkvVEdZN2NCenp0Vzc2WkZzQWZsWjNtQUwzQVd5RjJUR0dCM3Zn?=
 =?utf-8?B?STBZcWUvN2w2aGcrMFFxMzV4WHR3Qlg1RjlhOXJWRGRuWS9qWTZrcDRxZjEv?=
 =?utf-8?B?WTRUQUZHR3JpMk5EVWpBMHo5ZUVYRVk0N09FYUQ0cjM1NTBKWENlTnVTbFU1?=
 =?utf-8?Q?xVMvUaEWVLsEQUzSgU4nihyv90r9VgIgPa5SnIv?=
X-OriginatorOrg: sct-15-20-7719-19-msonline-outlook-3b3e0.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 93d4b44f-98e2-4950-a074-08dd1379cead
X-MS-Exchange-CrossTenant-AuthSource: AM7P189MB1011.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2024 09:06:44.0779
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8P189MB1252


On 12/3/24 9:52 AM, Johan Hovold wrote:
> On Mon, Dec 02, 2024 at 07:18:13PM +0100, Maud Spierings via B4 Relay wrote:
>> From: Maud Spierings <maud_spierings@hotmail.com>
>>
>> Add bluetooth for the asus vivobook s15
>> Describe wlan configuration
> I assume you copied most of these (effectively boilerplate) definitions
> from somewhere so perhaps you can mention that here (e.g. if it was
> copied from Stephan's patches [1]).
will do
>
>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> Signed-off-by: Maud Spierings <maud_spierings@hotmail.com>
>> ---
>>   .../boot/dts/qcom/x1e80100-asus-vivobook-s15.dts   | 163 +++++++++++++++++++++
>>   1 file changed, 163 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dts b/arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dts
>> index 7269f8e7709988657b363004875163a69142f16c..0774bd65ae8cddab81b98e27a116fd5adbe1363c 100644
>> --- a/arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dts
>> +++ b/arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dts
>> @@ -18,6 +18,11 @@ / {
>>   	compatible = "asus,vivobook-s15", "qcom,x1e80100";
>>   	chassis-type = "laptop";
>>   
>> +	aliases {
>> +		serial0 = &uart21;
> No need to add an alias for the console port which is likely not
> accessible on this device (without some tinkering).
Yeah I did find it, there are some labeled probe points on the pcb plus 
a weird unused connector near it, I will remove it
>
>> +		serial1 = &uart14;
>> +	};
>> +
>>   	gpio-keys {
>>   		compatible = "gpio-keys";
>>   		pinctrl-0 = <&hall_int_n_default>;
>> +	wcn_bt_en: bt-en-state {
> Looks like you want a "wcn-" prefix on the node name here too.
will do
>
>> +		pins = "gpio116";
>> +		function = "gpio";
>> +		drive-strength = <16>;
> Is this the drive-strength the firmware uses? The default 2 should be
> enough, but you can leave it as-is if it matches the fw settings if you
> prefer.
This one I do not know, it is not turned on by the firmware, I assumed 
the same value as the two later ones
>
>> +		output-low;
> I don't think you should be setting the pin state already in the pin
> configuration as this should be left up to the driver to control.
Will remove
>
>> +		bias-pull-down;
> A pull-down should not be needed for this output either.
I pulled this from the DSDT, it was defined with a pull down there
>
>> +	};
>> +
>> +	wcn_sw_en: wcn-sw-en-state {
>> +		pins = "gpio214";
>> +		function = "gpio";
>> +		drive-strength = <16>;
>> +		bias-disable;
>> +	};
>> +
>> +	wcn_wlan_en: wlan-en-state {
>> +		pins = "gpio117";
>> +		function = "gpio";
>> +		drive-strength = <16>;
>> +		bias-disable;
>> +	};
> Same question about the drive strength applies to these two.
These two drive strengths were used by the device firmware, a lower one 
will probably work too but I thought it would be best to stick to those 
values
>
>> +};
> Johan
>
>
> [1] https://lore.kernel.org/all/20241007-x1e80100-pwrseq-qcp-v1-0-f7166510ab17@linaro.org/

