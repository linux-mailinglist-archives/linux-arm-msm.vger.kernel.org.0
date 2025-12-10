Return-Path: <linux-arm-msm+bounces-84896-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 01B8DCB2B7E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Dec 2025 11:36:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8B06131A2AFE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Dec 2025 10:31:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DBF1312814;
	Wed, 10 Dec 2025 10:31:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="m+BvzIvB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazolkn19011035.outbound.protection.outlook.com [52.103.13.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F689311C2F;
	Wed, 10 Dec 2025 10:31:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.13.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765362716; cv=fail; b=Ktizs+3XVpcukabs4FiOlE0pVAawYBZAKFLDmxXPrUzoLCSy/VbS4c6jJ49meFpWdfBCnBP23Cf/NXK+4UaNmRIteVlZbbSG+Xmn5DfFIB9oQxAzQkhxNWc0ktVOXz2hCeoNQNj3M7getCig/7YlB7lRxY2AJBP25pPMQTFeonM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765362716; c=relaxed/simple;
	bh=fUeRiKS3IQhqxj1LVmkyLDO58Qw3+u1VGaADil1/3kk=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=PfU0ozvqrX20HrvLzJGH+5j7P635ZlFlsgtY0VSthxZFBg5cSyRs1tuTfewhRfOLmokE0MNjB4dZmVZ6Lu2MhfK61z3LmXoB11TbTHSVIST1vgkBknKpKCz6tkAn4zpuKnv4y/aOgxJ135/HHJAfVQ9zgPaJApKpmV+vXOtEYK8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=m+BvzIvB; arc=fail smtp.client-ip=52.103.13.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DCdi7fkGyFz59h7QHhUxsY2jagq2G49xPxYnP0uvXi66uA68948XNWYXE9uoG5fqIVavory6mtVFATTt5R495MRlHXCqwxSz4FAhNopFomHgWq9OvJ0cxWbies7deQx+4RDw1zcLXzezg1G0no6fjEPD7cOcOJ/Egux6TLVIhukXfvUfn4DQ9EAUGzhWj1RSUF9bXhnwqF74HI2b5q8ZRofd/OM5b7AdUZZdAXqhG+G1SExUZCpz7lQWrn8TD5a/gBTsj51ep+gfayixfEPuQj+TfErOgMVSAlJI3AV7aI1t58D/844x/aaTP6xZC66AkFJjy0ztLXSQBLQLYcnPsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qEZFkj1CBQ5i1SHdmFTwM8qbMpimPpw+aBpav7jqLhk=;
 b=qwU5JcoJx1Qj5SVvBYaqzl+HrVXYy9PzcUSMhSsNxONqKpBD0lagyciJbQxGSUFjTOoH3So3FymEGAJ+U3BFFi79AcEN7LLOeRhOEBPD7y7Bsa/oW2Lzx/8ifTqRwYyw+gNiL3dMiFLvVTu2D8SrbmVyeqz3Lo7S1JqLz8+/TXiicAGN37m3nSV7ltujQOPhX8xHJt7sTMg+SSydR/rXb/TDNSGttUJOmBKdd38SAnDB8h0VQpd3ja/ChJoRc4OVTISjHeIEWTVeDz6jpDXhOk7arvV0JJARFVmQvkRc3g6cy8fB6eooXMe71uY3ipZfP3sfUJAXIhVQpWvN3rsGVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qEZFkj1CBQ5i1SHdmFTwM8qbMpimPpw+aBpav7jqLhk=;
 b=m+BvzIvBg4N6sLMPSb3vVuiNvMphkjMFeKb2C40YEFRXr+45JK9HXPugItCGf8z5ychKuBhudnbDXJHUv0Z2bCEGGukjEjAlu1/OolbNkJ1F3ehaBtPsTqzTzJNVlcZZzEjypWHomdDqxvAD3i4tQ3SjCPj3WAy2aoWLIHjHMw6QhCTT7xV8aNdA7w/Q4V2h0q3yu2K8uSLotgyI8L99n9DnB0fDzBXE9JTw9QM5vLDgeSKHjPb/+i1hWpw/V39dqPPJwcUbpxmpsx4hrbvkKRUHRe3YXxqRHvMGu144Cch6CarFoEVAittliIwlqz9EDklXB9WrMoGs97UOrw9x4g==
Received: from DS7PR19MB8883.namprd19.prod.outlook.com (2603:10b6:8:253::16)
 by SA1PR19MB6669.namprd19.prod.outlook.com (2603:10b6:806:258::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.8; Wed, 10 Dec
 2025 10:31:48 +0000
Received: from DS7PR19MB8883.namprd19.prod.outlook.com
 ([fe80::5880:19f:c819:c921]) by DS7PR19MB8883.namprd19.prod.outlook.com
 ([fe80::5880:19f:c819:c921%5]) with mapi id 15.20.9412.005; Wed, 10 Dec 2025
 10:31:45 +0000
Message-ID:
 <DS7PR19MB88834BCECB817E8A0F0EA80A9DA0A@DS7PR19MB8883.namprd19.prod.outlook.com>
Date: Wed, 10 Dec 2025 14:31:33 +0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/8] firmware: qcom_scm: ipq5332: add support to pass
 metadata size
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Manikanta Mylavarapu <quic_mmanikan@quicinc.com>,
 Jassi Brar <jassisinghbrar@gmail.com>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 devicetree@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Gokul Sriram Palanisamy <gokul.sriram.p@oss.qualcomm.com>
References: <20251208-ipq5018-wifi-v6-0-d0ce2facaa5f@outlook.com>
 <20251208-ipq5018-wifi-v6-1-d0ce2facaa5f@outlook.com>
 <zjimpbzncmjfcaoiepbkwcg3v3soka3mhudee447h5hseuiyci@kfexqup2aly2>
Content-Language: en-US
From: George Moussalem <george.moussalem@outlook.com>
In-Reply-To: <zjimpbzncmjfcaoiepbkwcg3v3soka3mhudee447h5hseuiyci@kfexqup2aly2>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DX0P273CA0073.AREP273.PROD.OUTLOOK.COM
 (2603:1086:300:59::6) To DS7PR19MB8883.namprd19.prod.outlook.com
 (2603:10b6:8:253::16)
X-Microsoft-Original-Message-ID:
 <eb28d662-e544-4c16-ae49-fcb006acbe2c@outlook.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR19MB8883:EE_|SA1PR19MB6669:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f2b2bfb-5641-47a7-9cef-08de37d75074
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|5072599009|6090799003|23021999003|8060799015|19110799012|15080799012|461199028|19061999003|52005399003|40105399003|3412199025|440099028;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YmtqSUtCOHRTaUk3MGlxOG1qdlFtdHJ3ODV4eVp6NzFyeWtjWm5wL0FjUWF1?=
 =?utf-8?B?eU8xYzZUdVBrWHNteEZSNWFEM1pFbHFsa1ZXeGVrWUgyNGlkS2xKQVNjQjBU?=
 =?utf-8?B?RkhNTVlIOWdKZFVxWkdtNXU0UktxczJlUUtrdVh3RFhhZTRsUEErZzhMRFBZ?=
 =?utf-8?B?bDVGbXQ1S3BVeCtWVXhnZExTZEk1ajJwWHZJVUVLM0Jmd0t4WE05bGFxd2FH?=
 =?utf-8?B?UmtpdkI4TzVLVUh0QjFIK0JWL3FtWjV1ZmZEMGt2Qng0N1RROXJxMlRiZ3Vo?=
 =?utf-8?B?czdlcGtnWDV2cmtIWGxYUmNHTytwWHhZWnQ0TVJrUnMyMVBYUFpVRWt4bStY?=
 =?utf-8?B?UUNjVnkzNjdVMElNQW9VeUp2WVR3K1ZtaWYrMGcyTEs1WE1VcWxQYUxMSEx6?=
 =?utf-8?B?eDluOXh5K2ZQNEF6MkpiNWtCaWpKSzFzb3VLb1dJTFdlT0J5WjV2SUJEUHNE?=
 =?utf-8?B?SEo1dXVWbHRFeXBCaXhyQ2VOOWE0KzcreDBOR3VTY29nandTOTJ5NmRQOTFS?=
 =?utf-8?B?cnpnZ0RWT1lRWHJOQTVjZmU1S3ZnVE9NU0hoOURoU01uRWhrblNIekdnN3Ft?=
 =?utf-8?B?dktyeGJRaW1vZjRicytRaVBJRXZpcUQzVzhWUnJUOGpkbFhjZ05Wb2UreUpS?=
 =?utf-8?B?QVN2K2hHd0V2WEM1Y3dzZFdWdUoyMi8zSEc1bHNTYjJ0WXNJVjJURVdINUlR?=
 =?utf-8?B?aFJtTzE3bGpWOW82ZlhDcGlqencxQ01MMUo1Y0c2YU42MmRNTlJPK2IyUWVG?=
 =?utf-8?B?a1JXbWtCVXNZUCtwenJNZVFZQ2lYVHhiWEVjMTNSZWtyZzV1bHMzcDhveXJ0?=
 =?utf-8?B?cDQxblJ0R2xhb1BLVjhGZk8ydUFkQ0ErSjJPSWk4dGdKN0tZS2xqVW1EWmJI?=
 =?utf-8?B?M3RiUG1nek1xM0FhTWRESDc3ZHFvekE5VGR1enJKZ1AxZjJQVXFySDdpRjJj?=
 =?utf-8?B?NEp5bXpxL0RVNU5aZGJDTlM5Yllzdm9yQUFxNDY4c2t5WHJNWEpxL1Y2dmFu?=
 =?utf-8?B?MGVmV2FwZ3psRWdnNVdMTDJ5ZFBvVzgwaWdybHAyTHFtc0R4RkVURG5pcmd6?=
 =?utf-8?B?VGNtRmhMUXlETWFESlZrQ2FscWVob3dwQU54aS9rbmdVMDdSUnlobC95bHE5?=
 =?utf-8?B?OElzMDBVMUNPZ3FzWWZ5T0t2c0JabVkxN1ZYRndkeDFxWmREcUlEZnVCeU1B?=
 =?utf-8?B?TDFaMmlBR2VBKzcwTTR6a3RuZ0VwUkhkNEQ0M2VNdEhLRW8xUmwrVFk0NjE1?=
 =?utf-8?B?dmJ4M3JRaGl3TFVBRGdydDhJKytMYjArM1hHaGpkVGxEWmdaWG1nU0pOTlFP?=
 =?utf-8?B?TENCMExLNTJoTmszelpYR1h4Z0VhV3dWNzJzYnZ5RFBNcEkxaVVEK2FQcWE4?=
 =?utf-8?B?L29wQTB3M2ZvNHVZQ3dmZ2xBRWdMaDVRWHp0eUhBL3JPL2owK2ZkRTJIalNk?=
 =?utf-8?B?S3Q3S2RYOEtZcWZEVWFwTjFPdUdYSkxjMDFRUEVMakorUzIvQUh4M0tTdjg0?=
 =?utf-8?B?YW04MU9keUZTd2xseTBVNi82cDdFTG9OQnFGbW1tNTJmQmdJelMxNjV4NHZP?=
 =?utf-8?B?UXJEZlN3SkN4UUxkK05OVDV0RXl2K3ZKOEJhcTFxYjVmbU9hYlZ0dm5rN2Rj?=
 =?utf-8?Q?OieZWyaRKh5HsI77QCMAmla18hq3q2QaYEPTbNHc7WeQ=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VTJFNmRhQmxSUkNJMHI4ejJua1hpeXhLUFI0akRZQTNYcmxDZTkvU0dyWlUw?=
 =?utf-8?B?Y0tVaytkWmxpM3piRmNPUWtsWDlOQmNuVUw0N1g1N2c5dEtzU0MwMWUvR0FM?=
 =?utf-8?B?TUY0aXFCWWpoV1ZOMUYzVE1idGxndW1iUkE1REY3MTdKZDZEcGMxTXREdGw5?=
 =?utf-8?B?dk5oanEwRzJKNFMvVUg4b0FxSUF4UUNQUm41eEdDbTZyOXRmcjdDZW1INVJD?=
 =?utf-8?B?NFV1Q3Z4b1hrR3llODFJdC9sU2VNRmZNU3dtTUlWNEFUUHQ1cVh1aEVnVVRN?=
 =?utf-8?B?WklqeUhNNVduVHFkZXhXek1abTcxRjhtOG4rdXlHSHhwY1lSODY0RkRXWEdK?=
 =?utf-8?B?T0pJNTRsMGR5eW42N01IVmx4bUtUaW12RXQraSs1aU13cjRTMzBmKzJRL0J1?=
 =?utf-8?B?YnNKRElxYTY2UEF2TDM5OGd6Z3ZRZjYrNVNaWmdKeXlQcFhxaDQ1MTUyV0t0?=
 =?utf-8?B?VWVZUHRsUk1HOWlyb0hFNkVSTGpSekxpZTR5VWtiRExOQlpZdXVYMUR0Nlgz?=
 =?utf-8?B?Y1ZtUUJMUjUrK2d1aUlIbmNzQzI1ajVNQmZXYlFTUWtyWk9IZUt2VUZhaksw?=
 =?utf-8?B?SnFJb01JR295VnNjM3Rjei9wTXF4dXNsclIwdGpUVTA4ZUZmM3BxSEthNkFw?=
 =?utf-8?B?WlVsbTYxY21iaGVKdHg5US9vVFIwT3g5Q3B0dUlUNElsSTRPcG1VTjJIVG5B?=
 =?utf-8?B?bGxjWjV0U1I1ZklZZTliWElrNldvNjZZYk42U3l4Wk5qcWt6UVRldW9OcWFq?=
 =?utf-8?B?MU9XYW5seG5rK3IzaDEvUlZxVDNEaUdyOEpoem5ZZ0hnMDVIeXhGVE5hYUZL?=
 =?utf-8?B?eWJVbEJpQTV6dDBsbHdObi8wRzl0VlZMRm5xUmdQQjRyaHVOSmtDZHpDM1lC?=
 =?utf-8?B?RU5pdjlvNmI4Y3lNWXI4UEtMWWZaalZBWkRSVGN2VFF5dGVxVjIvajJYczJT?=
 =?utf-8?B?L0xpYXEwNzdIYk55ZTAyL2NDMGVLL29NRVVxTHkwbklpdmRNdFJIakIweFBx?=
 =?utf-8?B?czZBNFJ2NHZCbUNLbTVPQk9HU1VzVGhWL0Y1bWFUKzFTSWtCZzMvZzZPZjMr?=
 =?utf-8?B?K3hBaXNscFd1bHpZWlB5eGJUQTJZTkovRzlySXR1RkRQblppckZQUHVlRWt5?=
 =?utf-8?B?b3E5WjJoTWt2R0pSRzg1bnBUMjBBS25YREVnUVhOSUpHSmNKVndzMXF3NC9m?=
 =?utf-8?B?L2c1dGNTWUVwYkVVcGxCWjFxZU1QZGpZYWoyTWpkUXJZS1ZTUWVlTWkraVNR?=
 =?utf-8?B?MlFwcVpPQmFMSnIvK0M4eklNRy9hMlJqYm9qbkJ3QXhqRldRMlBLUUZPcGlU?=
 =?utf-8?B?OUd5WHQ1a1ozT09oTTd5WWRoZEphTW5KaC9vWFVPblROSkd1RnVUTXhPWFph?=
 =?utf-8?B?dVJmNkF3Q1FiZERKcXVmOStGOEwrZ3dyV0h6Smp6M2NoS08vZzJ4RTloVmts?=
 =?utf-8?B?Y0k4eHpsOVFaM1pZYTdZV0RackRhSndrVFo1aUdyRkFUMHBrU0drTXdSR0g2?=
 =?utf-8?B?clliZzYwSlZISVNDOTExWEppSEJRVXNtVm10YkxOMUdrUzc2UFp6RXV6Y1F3?=
 =?utf-8?B?SFNYKzVucGxFY2ljZk1UR0h0aFRJZjlBYnpleVo0S1pMOGxXWFRwVHBkS2RX?=
 =?utf-8?B?OS9nKzVweElvREFsdHRPMmFRb0JLTVRiVXlERGhJRWNHTEtVKzd6anVxSU93?=
 =?utf-8?Q?ehGGkDTB5LmJkbFaGV65?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f2b2bfb-5641-47a7-9cef-08de37d75074
X-MS-Exchange-CrossTenant-AuthSource: DS7PR19MB8883.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2025 10:31:45.0525
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR19MB6669



On 12/9/25 23:52, Dmitry Baryshkov wrote:
> On Mon, Dec 08, 2025 at 04:25:33PM +0400, George Moussalem via B4 Relay wrote:
>> From: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
>>
>> IPQ5332 security software running under trustzone requires metadata size.
>> With new command support added in TrustZone that includes a size parameter,
>> pass metadata size as well.
>>
>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>> Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
>> Signed-off-by: Gokul Sriram Palanisamy <gokul.sriram.p@oss.qualcomm.com>
>> ---
>>  drivers/firmware/qcom/qcom_scm.c | 17 +++++++++++++----
>>  drivers/firmware/qcom/qcom_scm.h |  1 +
>>  2 files changed, 14 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
>> index 1a6f85e463e06a12814614cea20719c90a371b69..c970157f75b51027fb73664a58c38550344ab963 100644
>> --- a/drivers/firmware/qcom/qcom_scm.c
>> +++ b/drivers/firmware/qcom/qcom_scm.c
>> @@ -583,9 +583,6 @@ int qcom_scm_pas_init_image(u32 peripheral, const void *metadata, size_t size,
>>  	int ret;
>>  	struct qcom_scm_desc desc = {
>>  		.svc = QCOM_SCM_SVC_PIL,
>> -		.cmd = QCOM_SCM_PIL_PAS_INIT_IMAGE,
>> -		.arginfo = QCOM_SCM_ARGS(2, QCOM_SCM_VAL, QCOM_SCM_RW),
>> -		.args[0] = peripheral,
>>  		.owner = ARM_SMCCC_OWNER_SIP,
>>  	};
>>  	struct qcom_scm_res res;
>> @@ -617,7 +614,19 @@ int qcom_scm_pas_init_image(u32 peripheral, const void *metadata, size_t size,
>>  	if (ret)
>>  		goto disable_clk;
>>  
>> -	desc.args[1] = mdata_phys;
>> +	if (__qcom_scm_is_call_available(__scm->dev, QCOM_SCM_SVC_PIL,
>> +					 QCOM_SCM_PIL_PAS_INIT_IMAGE_V2)) {
>> +		desc.cmd = QCOM_SCM_PIL_PAS_INIT_IMAGE_V2;
>> +		desc.arginfo = QCOM_SCM_ARGS(3, QCOM_SCM_VAL, QCOM_SCM_RW, QCOM_SCM_VAL);
>> +		desc.args[0] = peripheral;
>> +		desc.args[1] = mdata_phys;
>> +		desc.args[2] = size;
>> +	} else {
>> +		desc.cmd = QCOM_SCM_PIL_PAS_INIT_IMAGE;
>> +		desc.arginfo = QCOM_SCM_ARGS(2, QCOM_SCM_VAL, QCOM_SCM_RW);
>> +		desc.args[0] = peripheral;
>> +		desc.args[1] = mdata_phys;
>> +	}
>>  
>>  	ret = qcom_scm_call(__scm->dev, &desc, &res);
>>  	qcom_scm_bw_disable();
>> diff --git a/drivers/firmware/qcom/qcom_scm.h b/drivers/firmware/qcom/qcom_scm.h
>> index a56c8212cc0c41021e5a067d52b7d5dcc49107ea..b8e5b4f2498e75c9eca1a0c0032254b7126b9ed3 100644
>> --- a/drivers/firmware/qcom/qcom_scm.h
>> +++ b/drivers/firmware/qcom/qcom_scm.h
>> @@ -100,6 +100,7 @@ int qcom_scm_shm_bridge_enable(struct device *scm_dev);
>>  
>>  #define QCOM_SCM_SVC_PIL		0x02
>>  #define QCOM_SCM_PIL_PAS_INIT_IMAGE	0x01
>> +#define QCOM_SCM_PIL_PAS_INIT_IMAGE_V2	0x1a
> 
> Please keep these defines sorted (QCOM_SCM_PIL_PAS_INIT_IMAGE_V2 should
> come after QCOM_SCM_PIL_PAS_MSS_RESET).

Thanks, will update.

> 
>>  #define QCOM_SCM_PIL_PAS_MEM_SETUP	0x02
>>  #define QCOM_SCM_PIL_PAS_AUTH_AND_RESET	0x05
>>  #define QCOM_SCM_PIL_PAS_SHUTDOWN	0x06
>>
>> -- 
>> 2.52.0
>>
>>
> 


