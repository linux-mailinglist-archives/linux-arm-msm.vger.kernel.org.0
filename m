Return-Path: <linux-arm-msm+bounces-71992-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C6F0B43514
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Sep 2025 10:12:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A31F17C445B
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Sep 2025 08:11:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36CE72C0273;
	Thu,  4 Sep 2025 08:11:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PAyrJXuf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 689342BEFF8
	for <linux-arm-msm@vger.kernel.org>; Thu,  4 Sep 2025 08:11:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756973493; cv=none; b=Qy0woaUP6DnpEDl0CWcWsLZbpY4l2/yh6bpsLJ6JsLE40jy9NVYFPIYHS3OGqbJengO9WBVoMnLan89g6gcrJvUVVNjfi78Wt/SBivxIm7w8z+iODYJI8b1nUvF1iWf/fjItanXdrdoyzPtTErvQE6eXm7cN6olOb3ZDUIFJbvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756973493; c=relaxed/simple;
	bh=4h08wpz5drqqCtxh2Mgu2qUofUwO3S1QVgxWjKb5L3I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NXyahYxKtdTpaY+eEMQjHRUyCMD4wUKIpafMXaUPyiMYVRW4xI0+YnvK+HXa/PlU5O4YCi8TuNiZA6i1WW70+sSW1C4Gs6IEGfZd9rc3SncswXtJ3BUbbYsWf38rbR+0/I568CFPdYWBGeOZCy2XquKds1uGUkDUME9sNFWhrp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PAyrJXuf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5840awwS007650
	for <linux-arm-msm@vger.kernel.org>; Thu, 4 Sep 2025 08:11:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	L7t4dwQgkA12CDBLO/H8GwQ2txzuPeZic7pjO4qLBo4=; b=PAyrJXufetwiSgVz
	uAdzS+qwhc3dwJknZKxoaGTAS+xCPuTAIIoVT2ZUmCGZD/mIlEkCe9snuoRBm53y
	/N0daTcncnqxhGRTJ0qDB1TfUMCyJXFooAVkLKE6X8stOnVO6MGvOvMP9vjcmuZA
	Z5+CTZQ5KNtG7+FDlSHessrX60NHta3TYynN+kcjyjTM/9UAiD/FxVURjzXGTPgW
	FxFYtRn/7iBHcXiZ+Qi5HW3wDSnrSRhcX4cNPcWJBd09kqLClpPabkkpMFuak1Xm
	xbHPuwTAaNlrmmB3LLoMz5G9Q4BXBPwM9nhtEj0CVOW1DhmP0mZO7qBJdomwTKZF
	vSGHBw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48w8wyamud-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 04 Sep 2025 08:11:30 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4b3ca5e94d3so1641701cf.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Sep 2025 01:11:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756973489; x=1757578289;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=L7t4dwQgkA12CDBLO/H8GwQ2txzuPeZic7pjO4qLBo4=;
        b=nXd/UbgWdpZx4144IB/SJBARuCChkTGQ6/uO8NbC+9+r8emFHBCBt3G1iuyACpztVY
         UleEGpvVGMM2lDDng1jJoO3JJuwf9X4yogTMnpCynEOy5dn2Hd0dC635MJr5/Kupn5Md
         MReU84lOC3a43Frs0/40ODfYzirMLNO1iok55LIwKkKy0u7K3pP/16dGSRrC4AC1kNcU
         xy6LA5uHv3vcgQwHWwk4zPQDnElqJWfLSVdXV7Y2xHHp4J07USJvPAFQ6l6wWJcq+2Qq
         pnhB5tN+j13doJhC6qCc28TpB02BF54AfbuZiL80MczRfl1+4Y5vvsI/wPElonb8uj0t
         q00Q==
X-Forwarded-Encrypted: i=1; AJvYcCWWNmC3d24NAes3kv2fV6ZuOQtK5SOLBoHe7iIUXvx4sIn9Dsv/GuOIpok0tk56TmzFwWm+QntKOesp1vxQ@vger.kernel.org
X-Gm-Message-State: AOJu0YxX+F8le7QBS3JkxnlljWciGbXQDIU/L6fDnyQhCrWzcDtqyraZ
	obnQ2fz3EwfpbsBaHQ6Skhw1SzkgDY+O6hychIRAK6q+9EKbkD9a4T5S9yBdAIKip3mOlGPOGTZ
	h5aFzVRsJhA4BVhd16PCnB5VLmVaYwmZuipF7GCYGKr+11sf5OnY1eGBplhmfKK4jmmn4
X-Gm-Gg: ASbGncvwnDrUjkQljEtE4WulR6UZmAd4QHGakaOzkB4STUDGQfzyd2T/jbuoZ46fNco
	RH0CaL478/pHsjMMqC9tQlwfNZXlQR3HJOT477LHHlLF2cReNC3wkn85cc1Fw25SH5Lqtie33qj
	e8l4Ojble8VqxphYx2plpZTe6d+MAUoja+C3TEwmK5ZWr0GDGct2pQk2TP7AOSoE2W9ivz1bjgc
	XQPnmvo1aMlZ5691Jcc/Jl3REHed+N8JLL461e7I32D9IqMtKiYvyKV1vdegBnjPJc9iA7EkyxS
	qc5ELsTNGgC0WK/c39dyonTttveu1IgEztmzkibSwWys7gM5WrdlKggd92hV3Mfp7q3+H31vspm
	OPlTdk/yjefU22hFhoRl5Ww==
X-Received: by 2002:ac8:5d12:0:b0:472:1d00:1fc3 with SMTP id d75a77b69052e-4b313f0e6e7mr174091031cf.8.1756973489296;
        Thu, 04 Sep 2025 01:11:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IETRY11wlgI/tWg0eDPS0dRUFiv1L7olBCrkOPdcF5xbIyJYVEuM11SwnRqh3KhtLOSUAXIXw==
X-Received: by 2002:ac8:5d12:0:b0:472:1d00:1fc3 with SMTP id d75a77b69052e-4b313f0e6e7mr174090681cf.8.1756973488627;
        Thu, 04 Sep 2025 01:11:28 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b041770913fsm1097170666b.107.2025.09.04.01.11.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Sep 2025 01:11:28 -0700 (PDT)
Message-ID: <1b92fe18-67bd-4fda-b7c2-952ed96aaa61@oss.qualcomm.com>
Date: Thu, 4 Sep 2025 10:11:26 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] dt-bindings: phy: qcom-edp: Add missing clock for
 X Elite
To: Rob Herring <robh@kernel.org>
Cc: Abel Vesa <abel.vesa@linaro.org>, Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Sibi Sankar <quic_sibis@quicinc.com>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Johan Hovold <johan@kernel.org>, Taniya Das <quic_tdas@quicinc.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
References: <20250903-phy-qcom-edp-add-missing-refclk-v2-0-d88c1b0cdc1b@linaro.org>
 <20250903-phy-qcom-edp-add-missing-refclk-v2-1-d88c1b0cdc1b@linaro.org>
 <11155d6c-cc11-4c5b-839b-2456e88fbb7f@oss.qualcomm.com>
 <20250903235138.GA3348310-robh@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250903235138.GA3348310-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Ycq95xRf c=1 sm=1 tr=0 ts=68b949b2 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8
 a=_W-1yxQpv4NGZoZ9-g4A:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: zV3FsS2u0DU2tNzJX88SarJklw-Rh381
X-Proofpoint-ORIG-GUID: zV3FsS2u0DU2tNzJX88SarJklw-Rh381
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTAxMDEwMSBTYWx0ZWRfX140efuZt2SVO
 SBcA9zG3uL36AuU6madKRuhJpc1DlB6c+iuJLHQyiQQzBftNnJ1R/gnYxmUVfLLOaTS0CIad696
 2U/kA67lNK6SPPdrIOLhSxAPh7o0Nz+IdI7598n3VKxtj6jYMV7lkzF0wfvZJUpBeRJxiiA2mVg
 20lYbAAE5d2PFzlCel6DETenlFe25pd6j2JNCMebtxLgFobpyVLPGuFVhbqLYVXSYCmYlhaD1Vo
 3MQMAiFmHdKtHDON31kyO3l3M/63G194tRKzM+OwvrhM8v6V+AspmK1NDG4fPkjF/QePu1mo3ni
 gjVnEg5TdeUMzd5jC7S2pl517beBWJiaYr5K/tvEprHZBpnQnC9Ch7JfuhkPZOciRiuchUx5jea
 SA6NJaRJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-04_02,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 adultscore=0 phishscore=0 malwarescore=0
 bulkscore=0 suspectscore=0 impostorscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509010101

On 9/4/25 1:51 AM, Rob Herring wrote:
> On Wed, Sep 03, 2025 at 03:37:25PM +0200, Konrad Dybcio wrote:
>> On 9/3/25 2:37 PM, Abel Vesa wrote:
>>> On X Elite platform, the eDP PHY uses one more clock called
>>> refclk. Add it to the schema.
>>>
>>> Cc: stable@vger.kernel.org # v6.10
>>> Fixes: 5d5607861350 ("dt-bindings: phy: qcom-edp: Add X1E80100 PHY compatibles")
>>> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
>>> ---
>>>  .../devicetree/bindings/phy/qcom,edp-phy.yaml      | 28 +++++++++++++++++++++-
>>>  1 file changed, 27 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml
>>> index eb97181cbb9579893b4ee26a39c3559ad87b2fba..a8ba0aa9ff9d83f317bd897a7d564f7e13f6a1e2 100644
>>> --- a/Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml
>>> +++ b/Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml
>>> @@ -37,12 +37,15 @@ properties:
>>>        - description: PLL register block
>>>  
>>>    clocks:
>>> -    maxItems: 2
>>> +    minItems: 2
>>> +    maxItems: 3
>>>  
>>>    clock-names:
>>> +    minItems: 2
>>>      items:
>>>        - const: aux
>>>        - const: cfg_ahb
>>> +      - const: refclk
>>
>> "ref"?
> 
> Certainly more consistent with other QCom phy bindings.

That, and the name of a clock-names entry ending in 'clk' is simply
superfluous

Konrad

