Return-Path: <linux-arm-msm+bounces-58206-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 29EF7AB9B2F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 May 2025 13:36:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 173083B21F7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 May 2025 11:35:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98388233D91;
	Fri, 16 May 2025 11:36:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Hmd1RQRv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14F8721B9E2
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 May 2025 11:36:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747395369; cv=none; b=cenpplFl+n5KkTKG7FNi/TARpqOSnqF0LM9Jv+BLHzVHFC6l2OUXIFQVxmCvs1EBkP7aR43AIl0LR4Tde0kGCS6KD2qG/rgl6vPZmla0nkMXM3u9jc3W6QKNYUOH4XCvt93Q/CxVMVY4ia4fogsMt7/HwDstw9VwkfJvEULiUaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747395369; c=relaxed/simple;
	bh=x71wh9qpjv9m4txcRMSYgEFgU/qLQI3szX4WfGrxJsk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QNEv9q/qBwxV0ZMnEdDb0+oWGd937Ko/NVFH6Ov5rIBgA0LuZrUP5cvrXWUSF7RnSxFWapJrO+LIb4XQ7jjS78vzIYgJOv0AbTuiq1MqZCLTjhDIYJm6X6pP4eWPIvnmTP7GVJKKCseIqXMR3mc/Eo0q7NsldR0GkklRkQvN+vM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Hmd1RQRv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54G3bsuG020842
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 May 2025 11:36:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ekV2UpDnpry6+UbUBtnNG7zgHt6PFpPr1W7ydztSu/k=; b=Hmd1RQRvsa5D2YvH
	kW0Td15We6WvuB8+hJYTpq0VMz3JPHZvTMXtouBGo3lbrUO3w3sRMx5X5xQHlIP2
	6GlIQUllUGjBtqGfZr9o8vTFpaWYeEfmkUiborFFuSNIZyQpCWJwP3NcXqjKcVRr
	Siry3Gyt4lH1fLWNZ02qUjXAhUW6JdWpZcDZLn5Mqz47oQa/1k8vntCwXtxnw6hp
	LxUS3sroneKyVWUZ1iJRnAWsMYehVOJWwQksmUsrnIoJaRj01k9u2IlZEk19it7L
	/Paf6Yuxerz5QOjEBryU4iWDcqBHh//JzO5HZgsSVkK+Y3LfeVriUEIRPMEG0txT
	qsrQsg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbew9mey-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 May 2025 11:36:06 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c552802e9fso43705685a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 May 2025 04:36:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747395366; x=1748000166;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ekV2UpDnpry6+UbUBtnNG7zgHt6PFpPr1W7ydztSu/k=;
        b=LBWpFsChW41FKIq5tZ0/TGNmVDJyCRZl1o8e3ySIUCLU7qwKFO6eiNwngFIaf/nt+Z
         pP5OGXXOZ6MoXmqsku9Kq4KKpduwx+HUlwHDpopu+HhC8yzTaYpMC76sYFhByYj7B09X
         5a8KQnNjENCTxZt0T4CikmiK5A9p5tkHIdlMakvQfQBb5Xa6OkdcogIvm3KR0j6TFzqH
         tiutXWVzZjUPIA2OCH8cVtCaL57ITz6b/QqKeZayQ2+5bas3g6+28UUliwUlEfotw7zv
         l1Gmn4g6pvcqfHzTBSIK6i3U0RWReTqaCoOByzFbFgXoYBKpJP+FW7QuStPccsWhXdBq
         OwAQ==
X-Gm-Message-State: AOJu0YxTnrX95g6dTQxWver2NCOm/Swxa5uxKZ8XDaO3GLq6YVMIjh40
	/WHOlyTsenulnx0G68ZYxv6oGFwQurX8Q8FVkrd/DCYFMiFdqWGcXRBoUDB63AZZ7XvuaokFju+
	Cx6uTbED7axwo/hmtVt8lyDP7bjk67XLmKxBTUygFId0v2SfwXjmtI7WEbvxV8AKcsixm
X-Gm-Gg: ASbGncuy4k2ZA9ahkANs8DW6SgHZZMprsf5iJ+t9t/QSmDzSu9w5vS4S9CNB6LbNPlv
	oAqDkJ1wUvAcZXjUgwzu9/L+Rsvb9T5YzfIhbZm1xzeC9o8A2JXVx1uL464Y9oQg8Kd2XzLnPvC
	dolysgulI+lfgqJJNwo+Gbhr/rS+BdqOJEXRvg3kBxNOXwTQX/UV3AiFnE+qyQVncGJg2Ctl+Vy
	hXvgds6A4Lndjr8askfcZKDO4VAARPO0+2Vq2kbSIag3kDQQt9WRjwZ5MJp9BgBWivJNtVeoaQo
	3BlwyOMMHj7Mf2F1zvMIb4m7cznWfkeFuKl8bYatthEgEZmBPuuWY8FR9LSQSGSjSQ==
X-Received: by 2002:a05:6214:2602:b0:6f8:9a2e:1726 with SMTP id 6a1803df08f44-6f8b0720ba1mr21196936d6.0.1747395365888;
        Fri, 16 May 2025 04:36:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFQAvfyU/2baVWoHmgKenJhYPlFdeNZN/pq43vpeCxwa5wY8TW2sY5mrUqs5+/uZrvj9eUOwA==
X-Received: by 2002:a05:6214:2602:b0:6f8:9a2e:1726 with SMTP id 6a1803df08f44-6f8b0720ba1mr21196686d6.0.1747395365458;
        Fri, 16 May 2025 04:36:05 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d047738sm146675366b.19.2025.05.16.04.36.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 May 2025 04:36:04 -0700 (PDT)
Message-ID: <fd92ae5f-2caf-408e-8a79-6338e6c8ea07@oss.qualcomm.com>
Date: Fri, 16 May 2025 13:36:03 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: dts: qcom: sm8750: Add Soundwire nodes
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250424-sm8750-audio-part-2-v1-0-50133a0ec35f@linaro.org>
 <20250424-sm8750-audio-part-2-v1-1-50133a0ec35f@linaro.org>
 <e83b58ea-0124-4619-82a5-35134dc0a935@oss.qualcomm.com>
 <afda790f-0b5e-4569-a92b-904df936df85@linaro.org>
 <1a0be977-39b8-4089-a37e-dd378c03e476@oss.qualcomm.com>
 <17b9649d-b788-4a13-b7eb-bf54b7a83b0f@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <17b9649d-b788-4a13-b7eb-bf54b7a83b0f@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: snFxT9w_3-dN4trFW3ICFhvej3CgWE_Q
X-Proofpoint-ORIG-GUID: snFxT9w_3-dN4trFW3ICFhvej3CgWE_Q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE2MDExMCBTYWx0ZWRfX11hN3dkaShuo
 BG6++ClSHYXVJTV3X8gB5NeR+ao+mY15QDkwevtpTtwd5Zpl40DxA0rx0wfcHbKqFbclAA8wV0D
 zEZqnWCbSJpWGmRKA2rPA0MrpdLbRW0u7Mw2rI074jEyplSRVpBOiWlSX1qiuZHIRhfwPJALX5m
 pAhvT04ThR5ejmktwZHqMzV4cuQ7CkID18eKMrXWnDDhwIObFl6JMmI/CmDkVY/MtqtRcNHScc7
 XaxCKg0WAnvEcw4/brzLE/1iQjB9KBsAdH42TozvvhN4npyxctQOSjGMDtQjtIj3+bTpdYpH+4F
 VChQqfjSWj9EKo5sCGl8esUDyRJPufElEZdp4b0unGhRCvurG6ZuKFv+FZsipzj1w7BQiGHXYiS
 7trPc5QCKEvMuutYOM1gdJVO2lIyurKr1NBX5ETKypaI2Gga0NLJ/oNytjF9OfRnP6cykAVP
X-Authority-Analysis: v=2.4 cv=LOFmQIW9 c=1 sm=1 tr=0 ts=68272326 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=8ckfQZQAI897uWQ1iqcA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-16_05,2025-05-16_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 adultscore=0 priorityscore=1501 suspectscore=0
 mlxscore=0 malwarescore=0 mlxlogscore=733 impostorscore=0 bulkscore=0
 clxscore=1015 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505160110

On 5/13/25 10:26 AM, Krzysztof Kozlowski wrote:
> On 12/05/2025 21:38, Konrad Dybcio wrote:
>>>>>  arch/arm64/boot/dts/qcom/sm8750.dtsi | 122 +++++++++++++++++++++++++++++++++++
>>>>>  1 file changed, 122 insertions(+)
>>>>>
>>>>> diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
>>>>> index 149d2ed17641a085d510f3a8eab5a96304787f0c..1e7aa25c675e76ce6aa571e04d7117b8c2ab25f8 100644
>>>>> --- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
>>>>> +++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
>>>>> @@ -2257,6 +2257,36 @@ lpass_wsa2macro: codec@6aa0000 {
>>>>>  			#sound-dai-cells = <1>;
>>>>>  		};
>>>>>  
>>>>> +		swr3: soundwire@6ab0000 {
>>>>> +			compatible = "qcom,soundwire-v2.0.0";
>>>>
>>>> They're v2.1.0, same on 8650, there's a number of new registers
>>>
>>> Sorry, but no. This the "generic" compatible and it is correct. Devices
>>> expose versions, which is perfectly usable, thus changing compatible to
>>> different one is not useful. We could go with soc specific compatibles
>>> and new generic one, but what would that solve? This one is generic
>>> enough - the device is compatible with v2.0.
>>
>> Well, I'd expect a "2.1.0", "2.0.0" fallback there..
> 
> OK, let's see if any DT maintainer will ack such thing. :)

They sure did in e.g.

83adc98ec0d8 ("dt-bindings: dma: Add support for SM6115 and QCM2290 SoCs")

Konrad

