Return-Path: <linux-arm-msm+bounces-36989-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F3B859BC23C
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Nov 2024 01:58:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B5E912824FF
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Nov 2024 00:58:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A75BB125B9;
	Tue,  5 Nov 2024 00:58:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="RxYvmMZO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3D4CDF5C;
	Tue,  5 Nov 2024 00:58:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730768308; cv=none; b=Og0lOrrCDxSagWxgMsy6MxgHV3EIBUn2rhh94FWsbPSQCx6oZ7Hqd/c3FGVGPtpz6laifsRho2WkeK/3qPGS+jD5EfhK1TwtSXwVYJN5SGZZpX2xwiQx3zx1C9EO/s6zcgCGCKYTOoavl0u8NcbkwLj/MTtSevI5C7EjohB7zPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730768308; c=relaxed/simple;
	bh=8HpIzpr8QQrsiK3rCz7mOPHzonGBwf+dtMEHHOXHVJo=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=S1Dk2lkXNCZQBdTtvetPVtWwSBCE+bZTRqf1f7tlnaw1B7BtxkiAFnlnivDxBOVt32cp45pvrSsT7LjVB0i4WeAlwm1KM5LoPq6DB6ZC1YGzPaH9k2lb91s4YTpcpngmzj3oMpxolEpVWXuxt6pOzwn0vqnHslQ26qymvWR9fuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=RxYvmMZO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A4LIxSM001479;
	Tue, 5 Nov 2024 00:58:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	thFT9R4zawQwXZDNXsi0vhiGW8TpNWoJBJ1cYQq1QF0=; b=RxYvmMZObB4ufg8q
	P3WOfZA46hsW6Hv0zDtq9v69t8iGbkXbvebFPGTgtvGZaI+9SEA1IAtXEYRC1JDJ
	D3EyS1JF3lzVAFafXmG7d25DgzDTOv90N5t8Q/KAZQuqOz1U2yy+YJfNhYiBGAk6
	DcSWKPBaTAFdYzkb1AxX2Rd08EhYWCDUjre/A4DqQUMLeOo44nqyXZZJXWGUetrF
	3r1uDejHM5c2IZqGTUvQk7eqQDoJiSiATzoTreyn5/MOo7atGcuCXnjvusWfZgFR
	RiyQtKoIN1DbsEB0CCyZYT/CTeCNe0FHVmyeGgPMOyQ93YsC0l/Bb80m0P0T08oS
	awaM0A==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42nd2s5w3n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 05 Nov 2024 00:58:18 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4A50wHqn028893
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 5 Nov 2024 00:58:17 GMT
Received: from [10.64.68.153] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 4 Nov 2024
 16:58:13 -0800
Message-ID: <9591930f-6ead-46d1-9dbb-114f2310f5f4@quicinc.com>
Date: Tue, 5 Nov 2024 08:58:10 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: Add coresight nodes for QCS615
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        Tingwei Zhang <quic_tingweiz@quicinc.com>,
        Jinlong Mao
	<quic_jinlmao@quicinc.com>,
        Tao Zhang <quic_taozha@quicinc.com>
References: <20241017030005.893203-1-quic_jiegan@quicinc.com>
 <69be09ec-e9a5-4fb6-890e-74a65f3ce404@oss.qualcomm.com>
 <3f90b3d6-9637-47b7-ad8a-ff43cb28ad32@quicinc.com>
 <e263d461-9e2b-4ffe-8221-cd9ecdd142c9@quicinc.com>
 <a41e3aeb-43b9-49c0-8243-29a78a3b1602@oss.qualcomm.com>
Content-Language: en-US
From: Jie Gan <quic_jiegan@quicinc.com>
In-Reply-To: <a41e3aeb-43b9-49c0-8243-29a78a3b1602@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 8XpJwqKuY7iMpw8mz6MBWuYrp6i_-Pvz
X-Proofpoint-GUID: 8XpJwqKuY7iMpw8mz6MBWuYrp6i_-Pvz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0
 lowpriorityscore=0 mlxlogscore=999 clxscore=1015 suspectscore=0
 adultscore=0 priorityscore=1501 bulkscore=0 mlxscore=0 malwarescore=0
 spamscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2409260000 definitions=main-2411050005



On 11/4/2024 10:11 PM, Konrad Dybcio wrote:
> On 28.10.2024 3:53 AM, Jie Gan wrote:
>>
>>
>> On 10/28/2024 8:54 AM, Jie Gan wrote:
>>>
>>>
>>> On 10/26/2024 2:47 AM, Konrad Dybcio wrote:
>>>> On 17.10.2024 5:00 AM, Jie Gan wrote:
>>>>> Add following coresight components on QCS615, EUD, TMC/ETF, TPDM, dynamic
>>>>> Funnel, TPDA, Replicator and ETM.
>>>>>
>>>>> Signed-off-by: Jie Gan <quic_jiegan@quicinc.com>
>>>>> ---
>>>>> Already checked by command:dtbs_check W=1.
>>>>>
>>>>> Dependencies:
>>>>> 1. Depends on qcs615 base dtsi change:
>>>>> https://lore.kernel.org/all/20240926-add_initial_support_for_qcs615- v3-5-e37617e91c62@quicinc.com/
>>>>> 2. Depends on qcs615 AOSS_QMP change:
>>>>> https://lore.kernel.org/linux-arm-msm/20241017025313.2028120-4- quic_chunkaid@quicinc.com/
>>>>> ---
>>>>>    arch/arm64/boot/dts/qcom/qcs615.dtsi | 1632 ++++++++++++++++++++++++++
>>>>>    1 file changed, 1632 insertions(+)
>>>>>
>>>>> diff --git a/arch/arm64/boot/dts/qcom/qcs615.dtsi b/arch/arm64/boot/ dts/qcom/qcs615.dtsi
>>>>> index 856b40e20cf3..87cca5de018e 100644
>>>>> --- a/arch/arm64/boot/dts/qcom/qcs615.dtsi
>>>>> +++ b/arch/arm64/boot/dts/qcom/qcs615.dtsi
>>>>> @@ -202,6 +202,18 @@ l3_0: l3-cache {
>>>>>            };
>>>>>        };
>>>>> +    dummy_eud: dummy_sink {
>>>>
>>>> Node names (after the ':' and before the '{' signs) can't contain
>>>> underscores, use '-' instead.
>>> Sure, will fix it.
>>>
>>>>
>>>> [...]
>>>>
>>>>> +        stm@6002000 {
>>>>> +            compatible = "arm,coresight-stm", "arm,primecell";
>>>>> +            reg = <0x0 0x6002000 0x0 0x1000>,
>>>>
>>>> Please pad the non-zero address part to 8 hex digits with leading
>>>> zeroes, across the board
>>> Will fix it.
>>>
>>>>
>>>> This looks like a lot of nodes, all enabled by default. Will this run
>>>> on a production-fused device?
>>> Yes, usually Coresight nodes are enabled by default. Those nodes can run on the commercial devices.
>> Sorry, my last clarification is not clearly. The Coresight nodes are enabled by default for commercial devices(fused), but only part of functions can run with commercial devices because it needs check fuse data before running.
>>
>> If we want enable all debug functions related to coresight nodes on commercial devices, we need APDP override(APPS debug policy override) procedure first. The APDP override procedure will override some fuse data to allow debug sessions.
> 
> In other words, will a production fused device boot with this patch
> applied?
> 
Yes, a fused device can boot with this patch.

Thanks,
Jie


