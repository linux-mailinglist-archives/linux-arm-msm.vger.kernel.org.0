Return-Path: <linux-arm-msm+bounces-78455-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AA20BFF3AC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 07:10:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 4E0D14E9DCA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 05:10:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5294D269CE6;
	Thu, 23 Oct 2025 05:10:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Huv+d9x9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD04A265630
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 05:10:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761196215; cv=none; b=b1fBS5o7fcNnklaWg8sbb1zOg05C/Ooss+wv5HE2caFDrrIhMalvPe9tkhYgh97CjzWGgoaNfLxeZnLgX1IXqom8HKZ3vuaUPSU06caFLSiofDVYetVdwLsHBLECw/HZZELykhv1hv39w8FVhpcroWlFV1YUvevpA/rguay0cjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761196215; c=relaxed/simple;
	bh=p/ddS2sSKg4RpCYpXVyJO3QkAfXeZbIVQJ3wGS7uMHQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cz9ExHvAbin+FY4tPtt2eWnVcigaKhOhTiu2P9hnxuSGfxdkNjS5N5mVWbU3OaRPxvtVDN/1qanOtV7J1bVu1SYNN9MFYndndSj3gopzfMTjf6417sfZIwMy1ZLsc6IPGXyVWnYGEeSBE2KR//vWJJoV5u/xFZ0DKxk/aY3kSUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Huv+d9x9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59MIf7jj018119
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 05:10:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sVOpM0zB9ogMep4UsRUJ6puOQkqX/C+l4ebqHw8qJuw=; b=Huv+d9x9qZmGX2fY
	T1LYTYpdJeXxWqNhtzqeaYl/yFlffczKv/uNneHwMQIMjnOlSTn0CVGxeHn6np3w
	6HcqSdWW6tHPa9uLsB2fC4MB9FAEd8URbsJ2x7e8A0+V0SgwMkaIMTOIGQrAivZK
	fp/9qYh4pfTIIm1I6h+qJGJtLOTw4TkpB0x50vU/7HAyWa71yF0N0wtXshu9iIEn
	JoW6o1GOxOL5n4KiPaErGeB0piJJnSYvnlPlT/AhFcHhQNe40Qn4ZwWKrjYl627g
	3uN8RDYjSpBwoR7v0mEaDLvEu58J1VZCR90kcvHWuf8CjPTq/J639jT0YxHvXVJo
	9RQ0xg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49xhe0myay-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 05:10:11 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4e899262975so13209051cf.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 22:10:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761196206; x=1761801006;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sVOpM0zB9ogMep4UsRUJ6puOQkqX/C+l4ebqHw8qJuw=;
        b=I9Bv30YzjbIG8Iau1YAOC4mIoXYsiyd6UYdVRmhsRtlGAO+evDSGQkfgkqX+142XQz
         rrANI0qN4v05trwqm3cApKYspHvq/30Ni9vfj6eOOtooPq1QmQ604eAy/Cyqc7eHxuzy
         U/yGZNbDuIzGJW7f8iZRqzlVWKWU4YjVQn1nh5Zmfe3OVieCXffSUcUxRNh5f/uWZDso
         8eRXAMZmXPbFnnh+zMqr8LKSYkYSuIpQMZuWjtgcGibKyVnfy3AJF2zIal39OS8hooPv
         /PTzOoldyg8d4BKBZd8E6tbQVA/dgeA4bPaSlzO/ewtoMnRoEVUQQ61UCUdBv0t6vdX+
         xOQA==
X-Forwarded-Encrypted: i=1; AJvYcCUAVj8vhXuaGNiLVbqKg43Z5PBziKfygoHB+rlXsukXu6gYEaQKTejTDCV2JUAtS8y6y4h49JF/wXcYH2Y3@vger.kernel.org
X-Gm-Message-State: AOJu0YzbFE89qvQtvjDOpVoeQN905N8+UmHZntl3olaaHkK/KfxAkcMl
	JqV7QOFw9PF+ya5oz1t92THhXa55H2baSmY/rQrsLlrRbb5D+6Seg+jv6UIDwDz/doUT8MigmDp
	LaivEI9nfnNSLGVI5hm05nzjdNMJ7IztWL2ynOJNGRcb7UJIW4Afv/yC68LxrETQEk5Zu
X-Gm-Gg: ASbGncuDv132NpVoahKuIdTghGxZ8aLWjUkXk2Ll6BuNw2E5Mag9PFRFi2GTWKHfi4q
	iowRAat78ut+7TQSrzwxmVebJVa5sTRgwHcLrvpvT72qp6PJV4No0PUBNTMo3PyZN3vsY1RZPFm
	ZcAQDTR0epwkb1EndPJNdGYnjqaRsAV2FhGm1CRLnjJmXyQ+l7F7q00iM+FJDN8+uPsWHOqHbYo
	OJyihRspbem47yG3NIIJy72oO5PyKCosfoNMxS/A16Dw6TaTo7/cna1mCyzjyP1d6pYIwpdDpuz
	AlgdHOW4AQroXh0zxvJvRVrPAY477MLdUMuPd0KKJyWZJaoYUtmmzeqm2W8lEF3inJA/CrAN8f2
	CFSHSqKjd/EygaVPuX46lv/8+TlyE/WQQLa21SCjaLUnBYOFKs7nzwbqSth/2Gwcu0WeZoGy/OK
	xneg==
X-Received: by 2002:ac8:7d14:0:b0:4e8:a6c3:4322 with SMTP id d75a77b69052e-4eb815ad563mr17146351cf.68.1761196206361;
        Wed, 22 Oct 2025 22:10:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IElx1ZrpuKVGYGNP7kr8DERnwquHFSi9hHuZxhw/hdjJ0rZpVP7WqU0TbMz0+PNl974FTh0fg==
X-Received: by 2002:ac8:7d14:0:b0:4e8:a6c3:4322 with SMTP id d75a77b69052e-4eb815ad563mr17145901cf.68.1761196205810;
        Wed, 22 Oct 2025 22:10:05 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0c3:3a00::4c9? (2001-14ba-a0c3-3a00--4c9.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::4c9])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-378d67dc50csm1785491fa.41.2025.10.22.22.10.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Oct 2025 22:10:05 -0700 (PDT)
Message-ID: <1a787fe1-20ba-42b7-a94e-cd1bf465f16f@oss.qualcomm.com>
Date: Thu, 23 Oct 2025 08:10:04 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/3] dt-bindings: display/msm: Add SM6150 DisplayPort
 controller
To: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        fange.zhang@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com,
        li.liu@oss.qualcomm.com
References: <20251021-add-displayport-support-to-qcs615-devicetree-v5-0-92f0f3bf469f@oss.qualcomm.com>
 <20251021-add-displayport-support-to-qcs615-devicetree-v5-1-92f0f3bf469f@oss.qualcomm.com>
 <fh7daiy5p5taaz7ifymbivfktjqngs5oashhd3osrtzspsac2z@nswaeyh3kkhi>
 <8d4184a8-4e32-43ce-a487-a195e97fa874@oss.qualcomm.com>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <8d4184a8-4e32-43ce-a487-a195e97fa874@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIxMDE2NyBTYWx0ZWRfX2Bj4u3rqLIoZ
 vR7Yme1b8J8cFq+wuRk1XE0vi8dOuPEKEBhS+ac/4OM06HCdAz1jc93P2C9tFTxFutYYPhQL+A5
 ptcH2DHIzsgNhKPc654rBfbTXnNKd1Gaj5QPegn47mL241awnkdKTl1gMaYYTwudYN8KHCfPyxh
 xbnTDDdo+r+VexAz5PbMcHTPsIH99oehRxPGsUs3gsgE4wtIWlNn3JpbIlomq6IfuM0OeUoE9fj
 izCfIJcHlWcolwUcXMXUZlwAPQETR5XFkIzyWtpXaFSHreksvlYlo1gS02TqDxDT8lej8KC4f3i
 +IOEu6jWVazre7ods0Wk40FEZepB/7eufSPh3QpJv0SG6OahbKqvh9+P8USxZnVEwgtE/4D1eOR
 hBf2y8Q0arK66q7G453Dum0l7XGvAQ==
X-Proofpoint-ORIG-GUID: x-8YEMHrLXyQF-xysB37qVMQTubcPA_B
X-Authority-Analysis: v=2.4 cv=WYUBqkhX c=1 sm=1 tr=0 ts=68f9b8b3 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=yyiXTTIM6uUZdMJXhTkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: x-8YEMHrLXyQF-xysB37qVMQTubcPA_B
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_08,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 bulkscore=0 impostorscore=0 spamscore=0
 priorityscore=1501 clxscore=1015 malwarescore=0 lowpriorityscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510210167

On 23/10/2025 07:50, Xiangxu Yin wrote:
> 
> On 10/22/2025 11:07 PM, Dmitry Baryshkov wrote:
>> On Tue, Oct 21, 2025 at 11:18:07AM +0800, Xiangxu Yin via B4 Relay wrote:
>>> From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
>>>
>>> SM6150 uses the same DisplayPort controller as SM8150, which is already
>>> compatible with SM8350. Add the SM6150-specific compatible string and
>>> update the binding example accordingly.
>>>
>>> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
>>> ---
>>>   .../devicetree/bindings/display/msm/qcom,sm6150-mdss.yaml   | 13 ++++++++++++-
>>>   1 file changed, 12 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm6150-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm6150-mdss.yaml
>>> index 9ac24f99d3ada1c197c9654dc9babebccae972ed..89852af70de97a9025079107b838de578778c049 100644
>>> --- a/Documentation/devicetree/bindings/display/msm/qcom,sm6150-mdss.yaml
>>> +++ b/Documentation/devicetree/bindings/display/msm/qcom,sm6150-mdss.yaml
>>> @@ -51,6 +51,16 @@ patternProperties:
>>>         compatible:
>>>           const: qcom,sm6150-dpu
>>>   
>>> +  "^displayport-controller@[0-9a-f]+$":
>>> +    type: object
>>> +    additionalProperties: true
>>> +    properties:
>>> +      compatible:
>>> +        items:
>>> +          - const: qcom,sm6150-dp
>>> +          - const: qcom,sm8150-dp
>>> +          - const: qcom,sm8350-dp
>>> +
>>>     "^dsi@[0-9a-f]+$":
>>>       type: object
>>>       additionalProperties: true
>>> @@ -132,13 +142,14 @@ examples:
>>>                   port@0 {
>>>                     reg = <0>;
>>>                     dpu_intf0_out: endpoint {
>>> +                    remote-endpoint = <&mdss_dp0_in>;
>> Why?
> 
> 
> Oh, I think I misunderstood the “messed up indentation” comment from Krzysztof.
> It seems the two-space indentation under port@X and opp-x is the actual issue.
> 
> However, that part was not introduced in this patch.
> I will split a separate patch to fix the indentation there.

Note, you have two different chunks here. The first one is useless as it 
adds a graph arc to a node that is not a part of the example.

> 
> 
>>>                     };
>>>                   };
>>>   
>>>                   port@1 {
>>>                     reg = <1>;
>>>                     dpu_intf1_out: endpoint {
>>> -                      remote-endpoint = <&mdss_dsi0_in>;
>>> +                    remote-endpoint = <&mdss_dsi0_in>;
>> Why?
> 
> 
> Ack.

Use YAML coding style (two-space indentation). For DTS examples in the 
schema, preferred is four-space indentation.


-- 
With best wishes
Dmitry

