Return-Path: <linux-arm-msm+bounces-75530-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AA172BAB1F8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Sep 2025 05:06:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 639C03C277A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Sep 2025 03:06:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C91B71F0995;
	Tue, 30 Sep 2025 03:06:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GRCgXwxu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2333418859B
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Sep 2025 03:06:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759201577; cv=none; b=cO70rc5CAgLUOQV2ivYRaCAxVWFKoCB3f3Z4yvqg1txlVIRJ+j/2uC8U5DfUGXR28/b6Ro2sPd1AF7Rj3EKMYdqAw9DZMFmVB8E3JtKkOMyYAwzRAyPwxAhSqNaaDTPIHI7+Qm5FpGXXhxZQQWeJ76vQyX4ZC/jodKNRYb/sNvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759201577; c=relaxed/simple;
	bh=wRBGoZ0w+/yO+4GK/SekM4EcOmzBtCdzP1s9NAQ0siQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=twWbYeDT/zh4fnOaMWttsbvdFSXlJfT3j/ISmcHUmhu2eVUs1lb5pgNrfiLXzVONT1cjnE01/7GhbBrKK2nLY7uPcjem1dSrCHJCNn+xAtxPymxdMX0pdO5vP8tTeQQ/xiaUBImhT7DjW9sB5FQZAWlzo8zcVdcnlhzV2LciZis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GRCgXwxu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58TIA3nf032708
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Sep 2025 03:06:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6q+XaInOzB2LHu4CwIXfwgbLjWT9VQ02Q4RXVHW+YAk=; b=GRCgXwxuxDMEUl2p
	SwfreGHZIzR7xB0VTjUI7oxh1kB8qop2uQr3gp0s5yiDrTNelbY5NFf1YkZ1OGwI
	ETyGrLtDDoY4fcFaOdR4hRId+hZiWMznPogiElfbYqQyndu8TQg+DuSiUlU9YsVx
	MsReF5HrqHqG7Om+IMkzmKAOikZvK0CE48y41oLJ6kDpuj2aoyQEiTdBMSw1BL3o
	QgPQVjSVfCOS4NYE0jx92lGLul0DeKJ6wCNB//u6HKOCuSyE+MkB2pRYliJZDaSc
	MW+HGhCzh07QUfqxRwZKa4dIN4IxAPXY4DzMSyKhiVpzHVcutNdbOvCO+Clo8bZU
	rMMt7Q==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e93hf6vr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Sep 2025 03:06:14 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-272b7bdf41fso56691505ad.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Sep 2025 20:06:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759201573; x=1759806373;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6q+XaInOzB2LHu4CwIXfwgbLjWT9VQ02Q4RXVHW+YAk=;
        b=CgQ1Y47taTeQ8pbmJXa1IsKjM6zgwCr/0uNGdbhzcXGffgO3EdHfmgTxyRFPCrBA91
         8PzK3VrQwbRCocXTYmZN9HmULLqLPMRar+EAh+XOtlQ1ZIGfAevDAd3Ee+zyDj6snYOQ
         h4+LKRRfV5xiOpsiv677gLRMqYamCaIMY2gmg/SqjWvIxXxku7ihmJkqgNHFkwcaucdX
         W5c8muPLERZsgPGWEUNP0zMSJrZE6UHMy06e9ONFnd1wIL3c8wKaHLBNtxPVboLFVklU
         /OSJEvayqNEJV9YdiIW60D505J0lZE+WqJV5P38ozeRqxjYSAII255+2rLIdgc2pw4qV
         AXgg==
X-Gm-Message-State: AOJu0YwKAZscXG19Sxove3n32Q4HXuFH/SmaY5B/BbNAfb12X/Ntosyn
	jPJzSwI5zWACqsDt0Fev4WyXpxHYbwSjR/nmilJDOp4Zh1o+LaWru16qzJ2imX/1F7mgbiMx848
	2066bE44RRiyV7f22OvQCMdrOe5TqzHVnHSqdYCB11nXtGxWmrrz9Q6L5qAiTKMJxki8W
X-Gm-Gg: ASbGnctsqRCYyQlf1RqKpyJ0QfIDv25VRklomi2ps+RpWa7tKNzXU/1D0KoZzO05b5M
	R3Fe9B95WYzgDeuDNUyDw4Yqk6q1ostAAvZQbsTouUrYydK32mpgqSkD8exzk4dpRZ+NN5DjZu4
	O+tDfKLcKVxedvE61ProF3VYWIZuZ3RohILXf/+e27AR5Z234evdDCDvrA2Dvoh8Ef4GpUYYK5d
	gAbO3yWf/9lgolT9OSGv7Esb1MKcU8VaCZFCaP3VjfconPVCPECaSEVJo4MgK5zv/XhHz/6cl+5
	mVtzsrLSDiU8j7xcuKsKpYdrSdtNp25hj9sSp5Kd9g5QjoikAJLS8l2E7X63T3hKtdpibC88qrk
	I95jiV5QNOw==
X-Received: by 2002:a17:903:334c:b0:27d:6f49:feb8 with SMTP id d9443c01a7336-27ed49d2f57mr156108975ad.16.1759201573197;
        Mon, 29 Sep 2025 20:06:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFppymW1BaRnptlS5tRN1jEjk6aV/lNXpQE5CYU67X0s4DFB3lZF1LGafmAUHUxjxxRxnJzbA==
X-Received: by 2002:a17:903:334c:b0:27d:6f49:feb8 with SMTP id d9443c01a7336-27ed49d2f57mr156108635ad.16.1759201572746;
        Mon, 29 Sep 2025 20:06:12 -0700 (PDT)
Received: from [10.218.15.248] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27ed69b12cdsm142955845ad.115.2025.09.29.20.06.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Sep 2025 20:06:12 -0700 (PDT)
Message-ID: <70569fdf-7a3a-495a-b1ca-d35ae1963592@oss.qualcomm.com>
Date: Tue, 30 Sep 2025 08:36:07 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: interconnect: document the RPMh
 Network-On-Chip interconnect in Kaanapali SoC
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Eugen Hristev <eugen.hristev@linaro.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Georgi Djakov
 <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com
References: <20250924-knp-interconnect-v1-0-4c822a72141c@oss.qualcomm.com>
 <20250924-knp-interconnect-v1-1-4c822a72141c@oss.qualcomm.com>
 <ea291acc-bfdc-4a04-ba60-fc59a55ada28@linaro.org>
 <f4e7a388-54fd-42a7-8960-be6a3de7ec6a@oss.qualcomm.com>
Content-Language: en-US
From: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
In-Reply-To: <f4e7a388-54fd-42a7-8960-be6a3de7ec6a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDA0MSBTYWx0ZWRfXyBSlCwKDAdmG
 vgDWeN5GCYQ6c6E5dQZulzrR5ME+iWdJ7H2doDYr043IhqFrIC9tknf8/wu2oMmFTqnHuXR64tm
 5mrNW/Z5OIQIohgHWm/DbBpcLGmlSILB0V2psZJ7Gr99RRWn8JXZUky1wBA3CN75zQD+wFpcmCD
 Jf3UtFTpjPPPbhIKW/NI0/UwdvzdrNAtcQZ4n0q0eb69gTj+XkHtg6Rg2uIyKMRwMQBqYCJ4Kyl
 H1bv/PtV/Zkbqko6uDRc3CxlnzInn8KdAp/kSl35JDyNXR8Y8Sv+GTWam2IgcvS+/zysqEpRefX
 yieDHXT2G71fEYOrY9DMlh0p+/f0yz2F6pAgJhMrbVUMNbDRl2b7YALo1mHJ/grh92nip3a9sNC
 epc7Esok4ZHRQN4fTSpY3sdjkNvyxw==
X-Proofpoint-GUID: z8HAjt6zyEAWUVYLB3FOg3bNQA2EfvXq
X-Proofpoint-ORIG-GUID: z8HAjt6zyEAWUVYLB3FOg3bNQA2EfvXq
X-Authority-Analysis: v=2.4 cv=Rfydyltv c=1 sm=1 tr=0 ts=68db4926 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=MsHyvPc69t2rxRqWf9MA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22 a=HhbK4dLum7pmb74im6QT:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-29_08,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 bulkscore=0 adultscore=0 lowpriorityscore=0
 impostorscore=0 clxscore=1015 malwarescore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509270041



On 9/25/2025 6:10 PM, Konrad Dybcio wrote:
> On 9/25/25 10:57 AM, Eugen Hristev wrote:
>>
>>
>> On 9/25/25 02:02, Jingyi Wang wrote:
>>> From: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
>>>
>>> Document the RPMh Network-On-Chip Interconnect of the Kaanapali platform.
>>>
>>> Signed-off-by: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
>>> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
>>> ---
> 
> [...]
> 
>>> +properties:
>>> +  compatible:
>>> +    enum:
>>> +      - qcom,kaanapali-aggre-noc
>>
>> Hi,
>>
>> Does Kaanapali have a single aggre node, or there are several ?
>> On previous SoC, I see there are two (aggre1 and aggre2).
>> Also in your driver (second patch), I notice aggre1_noc and aggre2_noc .
>> It would make sense to accurately describe here the hardware.
> 
> They're physically separate
> 
Yes, they are physically separate but the topology treats them as a single noc
with two slave connections to system noc which you have noticed in the topology file.

Thanks,
Raviteja.

> Konrad

