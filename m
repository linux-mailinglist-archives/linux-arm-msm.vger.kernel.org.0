Return-Path: <linux-arm-msm+bounces-34540-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 805D19A0078
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Oct 2024 07:13:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A30CF1C229A7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Oct 2024 05:13:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A48818A95E;
	Wed, 16 Oct 2024 05:13:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="AFMNDagb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C677721E3B4;
	Wed, 16 Oct 2024 05:13:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729055627; cv=none; b=j8r3bZ3o645Bbbrw8dsyiWeCFh9mIyvG91WX5WY1pFIXZNpATWsrbMMHQB9FOIv37js2tXuiawEAfOWe47ps8/e2dJerQZrZ0Bz6GOZELYalouYzOguvSXIWezwd81692a1BXmRuf9H2jnBMSu1W+EuzaXQMfRqOuz9MvGnrLag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729055627; c=relaxed/simple;
	bh=pftf73/c4Yj3xjCsAfa54VCCgMSRTEbc7fLmYhfjguU=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=JtHcUrcKnEJus9SwIiTNdU/1p5eBNJAvaquWmgdRFPho5AYUJIHpebx3klyXa0b2ZEg+IfVKuARQwr+CVXYFMET88+ncfTL35klDvyNo9mvOynySr0RoT6rVWLQwSR50Zq7Mf+WMVlSY6h1p+0wwCiHpbwK9l3iDxmuIWd8+ZMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=AFMNDagb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49G11j2b025257;
	Wed, 16 Oct 2024 05:13:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XfONfCk+bzmPqjKhmWgzHubgBUfdV5cdIxwDOmQEMKo=; b=AFMNDagb33Y56ndw
	HycjaCjQ1xLZIrNNTinbRvzyVaxBEjmAVYA7T1d030fn541GK98fxL48iL9CHyxX
	p7bi2DOc2Qcqh1gjgl86pY2PuMIaejDz11VWdmcHPLjtb9Kk8UDjt7b30OyZc9rz
	El01NZx5cW/oeCFUR7LVkeJdPbFoOcEQOelBKLP8/NXbDYqDjvx6rNg5ls1StkxD
	AXhGFGxED8mY2ccjEW2BkaaErcNJzscraVizQE82U6ZqGOtlcUOCvFH0K0ia1x0Z
	xFwuz4H1sTgHyxfV/Z0TlIHUgJX6jw8s/xERNpG0xjZYUra80oGU8x23GAVSNDqm
	zpKHBA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 429t5kj9x8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 16 Oct 2024 05:13:41 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49G5DRlZ025633
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 16 Oct 2024 05:13:27 GMT
Received: from [10.216.49.154] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 15 Oct
 2024 22:13:23 -0700
Message-ID: <bbc900f7-eb8f-2664-2144-50a9a6ad8453@quicinc.com>
Date: Wed, 16 Oct 2024 10:43:19 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH] arm64: dts: qcom: qcs6490-rb3gen2: Add PCIe nodes
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Manivannan Sadhasivam
	<manivannan.sadhasivam@linaro.org>
CC: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        "Krzysztof
 Kozlowski" <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley
	<conor+dt@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <quic_vbadigan@quicinc.com>, <quic_ramkri@quicinc.com>,
        <quic_nitegupt@quicinc.com>, <quic_skananth@quicinc.com>,
        <quic_parass@quicinc.com>
References: <CAA8EJprRF0tVFZK9c=MT8bSRcBdRvcugBaeEzpX5-wfRyNgc3Q@mail.gmail.com>
 <c8be2bbf-a51c-a38f-6e6f-a88801f953d5@quicinc.com>
 <20240209075716.GA12035@thinkpad>
 <CAA8EJppfzc_dM9c9mHPVWheVxi-1gJxCmaWPvreELijEQDDSyA@mail.gmail.com>
 <20241001101622.ys36slymgjbaz26q@thinkpad>
 <8459161B-87B8-481F-AE71-3D5156B1CA56@linaro.org>
 <20241001141948.g74rn6777ywvtcmx@thinkpad>
 <CFF89D4D-8131-47C2-95B8-A0E130A16E46@linaro.org>
 <9c24ba5d-431a-c45e-ce1c-3541eac7d017@quicinc.com>
 <20241012124334.4gsspgtuud4uudop@thinkpad>
 <7yzjgqitjvfwricftcpelktwjbgwkjuibwkpodjd6x4gwkjkw3@wkeqp6lqwfqv>
From: Krishna Chaitanya Chundru <quic_krichai@quicinc.com>
In-Reply-To: <7yzjgqitjvfwricftcpelktwjbgwkjuibwkpodjd6x4gwkjkw3@wkeqp6lqwfqv>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: UYdiqJwZ8aOVuaWU5tqd-kEb_xeY5UkS
X-Proofpoint-GUID: UYdiqJwZ8aOVuaWU5tqd-kEb_xeY5UkS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 impostorscore=0
 bulkscore=0 mlxscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501
 malwarescore=0 phishscore=0 clxscore=1015 suspectscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2410160032



On 10/14/2024 4:55 AM, Dmitry Baryshkov wrote:
> On Sat, Oct 12, 2024 at 06:13:34PM +0530, Manivannan Sadhasivam wrote:
>> On Fri, Oct 11, 2024 at 05:24:29PM +0530, Krishna Chaitanya Chundru wrote:
>>
>> [...]
>>
>>>>> The logic here is that the fixed endpoints in the switch will get an unique SID
>>>>> and the devices getting attached to slots will share the same SID of the bus
>>>>> (this is the usual case with all Qcom SoCs).
>>>>>
>>>>> But I guess we would need 'iommu-map-mask' as well. Hope this addresses your
>>>>> concern.
>>>>
>>>> Yes, thank you!
>>>>
>>> Hi dimitry & mani,
>>>
>>> This particular board variant doesn't expose any open slots to connect
>>> a different endpoints like another switch(which might have BDF unknown
>>> to us) so static table should be fine for this board variant.
>>>
>>> I tries to add iommu-map-mask property, the issue with that property is
>>> that the driver is applying the mask to the bdf before searching for the
>>> entry in the table. If I use a mask value which satisfies all the
>>> entries in the table ( mask as 0x718) and if a new bdf is enumerated
>>> lets say 0x600 due to mask 0x718 its value is again 0x600 only.
>>>
>>> Can we skip iommu-map-mask property and use only static table for this
>>> board as we know this board doesn't expose any open slots.
>>>
>>
>> Hmm, I was not aware that it doesn't have open slots. Fine with me then.
> 
> It doesn't feature open slots, but it has two PCIe connections on HS2 /
> HS3. Users might attach external PCIe devices.
> 
> Krishna, could you please clarify, how those two connections are routed?
> 
For this qps615 board to one of the downstream port (pcie to usb) usb
hub is connected and to the other downstream port NVMe will be
connected.

- Krishna Chaitanya.

