Return-Path: <linux-arm-msm+bounces-75188-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D9DABA141B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 21:45:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6D73118910F6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 19:45:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 185C731D75F;
	Thu, 25 Sep 2025 19:45:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Pl+z1jyX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A53431985B
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 19:45:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758829526; cv=none; b=VE57TLpDzlX5Pcb2Uxmq5ntcdZwo1b8j+TPkCXNgwmfyxQ7Z+/gfDAB1D960j/H+kg/6Kn9VfwKq+akn9rHLNLyEwUeOIDy7oJYdddNzjH+0f2YXZrCjHysePxrLYp0f++v0VIg2M6GvpltKVbKVVu5e6Bl5M+EhQqKdKayyNNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758829526; c=relaxed/simple;
	bh=1zEu2OmlwcXZazsas1KTl1VcfwBjOaoT3EP8isjLdzI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VEIH72bQrNvFWQ3TVv9nTSj/HkvZczocQbTBOCF6oPLdgsHvpPgEBDACSBM7rr2soPQbYZLI0b7dAbhRH3yM6XDSdYvnKXl2XHYVkREyMY3jhG4AXSxMjHhRbESr/9AgjfMSliEDLOfCGNcNjoj0lylkg3SsurKwG9L6EOtoIX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Pl+z1jyX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58PIQY36026601
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 19:45:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	T61Tn9AWSXYN6GxmJGVXPjVrhV39tAQxcO9u49rK4W4=; b=Pl+z1jyXkRzTHuXw
	BvJuH7Bn56HtJk7FslnjGr+5hGCjRyzfiOv+holL5N7f/Tl8VyCDgsK2TjzjfRXd
	wt+VQ0JhgcMTTv71CwiEDkI0wiuTPFxoG1PEkM//z9IqKtufssvcM2hMDsaA3xtH
	QqVoSftdb4xmvTP2VIxEGOcF2mG1gmCameXkz4B0lCtOzoFULG1PVZyy/i2++erX
	I1z6VSiTbBkd3qplqn0Ofn7JeSk5697cyyqtwK048ff/BTAkiFLzlMsl+6n28x7F
	GRg98XuTyqJlkk6BkWAUiuzTxGLWZTNEdunWpSI7I5zZkFVVMOgMcuHrjO4c9vwy
	JRF53Q==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49db0u062j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 19:45:23 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-33428befc3aso1490506a91.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 12:45:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758829522; x=1759434322;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=T61Tn9AWSXYN6GxmJGVXPjVrhV39tAQxcO9u49rK4W4=;
        b=qGkhhKwBvJRfbj8iJZ9AxX3R0f5oEMlD+Sf2WRbEUpHegtDRZnYpPJO5yiRKvIrNZp
         ebDAOwv7IV00PW7mZBdl/HNoO2C5ogtutDPpbfTeXDT+v4+3M+qYwrl2z6IkjGm+lWzH
         QzlsWHd0sTDsV+H44RtfZg/Fu+kT73eNXPszSDrmXcAEYlpcNcPTeQtENNfF2w+czs0f
         czX1Uh1t6XasXw2jL3HUWXGFndf9qcGEI9iNlhDyaUnv24w5OL2DH4b9+hPjrL1o8IEy
         KinZzBaY6IfC+MFOWKorFQ7kL6EbSM/GAauh0/v6S06h1d1E5PN8PPCt/DznXMO/yJDc
         AnZg==
X-Forwarded-Encrypted: i=1; AJvYcCUes/tsVWsQaufiAMlz/eVsnSJO0JM7+mZPlCTknEzDyTkfRGS1PWUd9KwoDmmwqZvNh/5poxKpEwPh/oiJ@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1f1tXYmoEo7HBqQ20vTIyiwhh9R21M9wSa4JjZrf76iAJ9Cwl
	NN3NbzywQTd4dr/lCObaGPGcmushHiN5qMv6h1gqIH9A83aVocgdt9WO6P6J01/FgD18DkvFWKy
	ftX9ra6S4LnVjeNrS4mJ64vchq6CRo6yPEs/cumD7ntjVzZFpU9o5hLrhyE448uRnPwUH
X-Gm-Gg: ASbGnctO4ZciwXW68puk3WCuvxSdFB5cGhAiJ5gAPyOclSDn31Y1QpvqOjK82VLDmcp
	jsUUqsUX0hvNFxnNpBDWgY7uKACE8iBcUzvr4/MzaTtpyKRWe5+o9Su77SdOQv8aE7Z57BJnsy8
	vJtSXt4oditBBnfwJV2eX7nxoOrAozBON8ThiVpV3SiUeDnYcmKvdZsPHzm9H+NlXCR/13KrrPL
	UT/KSFMSkm+38tI3fyzkRuY/myFIAe+r8AjrmnbJm6ThKIUR56vbQJg2upQK/I2woewwJh+pjeO
	wgrK1z8x+/vyo0XzvLhgT1gtDsP84MN06qCWt02r9qBpbu3N9uCor7Z6D+NVvbqKioSV09f9oRY
	=
X-Received: by 2002:a17:90b:1d0d:b0:32d:d8de:191e with SMTP id 98e67ed59e1d1-3342a25964emr5540661a91.10.1758829521630;
        Thu, 25 Sep 2025 12:45:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHRfwJXovOnl+lHkuSFlnxOPjTPUGECyVPSFyJNabv+KOUv3Mo6exOm1jceL+NldToCC5Md/A==
X-Received: by 2002:a17:90b:1d0d:b0:32d:d8de:191e with SMTP id 98e67ed59e1d1-3342a25964emr5540630a91.10.1758829521132;
        Thu, 25 Sep 2025 12:45:21 -0700 (PDT)
Received: from [192.168.0.166] ([49.205.248.165])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33471d71199sm3135991a91.5.2025.09.25.12.45.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Sep 2025 12:45:20 -0700 (PDT)
Message-ID: <6198a56a-dbca-5cce-fcd2-43978e87236d@oss.qualcomm.com>
Date: Fri, 26 Sep 2025 01:15:15 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 1/8] media: dt-bindings: qcom-kaanapali-iris: Add
 kaanapali video codec binding
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Vishnu Reddy <quic_bvisredd@quicinc.com>
References: <20250925-knp_video-v1-0-e323c0b3c0cd@oss.qualcomm.com>
 <20250925-knp_video-v1-1-e323c0b3c0cd@oss.qualcomm.com>
 <nuunkv3xwfes6wed5xf4re2efakndvvrfl4lhmenilkic4sjiy@5cb2f5ygegvm>
 <522d7244-0003-a42e-9be0-1d353df8d5bd@oss.qualcomm.com>
 <oimuo26ohcye74j6rl5hfbmd4ip5wzudhyiaibf74b5zmjb4vl@xh3dnp7gmvq7>
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <oimuo26ohcye74j6rl5hfbmd4ip5wzudhyiaibf74b5zmjb4vl@xh3dnp7gmvq7>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: SMKxCFlHKRUa0ivLydyZa8AcFlXc28Jh
X-Proofpoint-GUID: SMKxCFlHKRUa0ivLydyZa8AcFlXc28Jh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI1MDE3MSBTYWx0ZWRfX2uwiTOIVUcdS
 D+cJ1DxzSlVqOvSc4Vnk9IOlbXSgr41lIFa2MKcYKlma3hjTVioi9hsbeLeMJnfKZhS7yu1M83k
 useHNLJD5jdKwGjbXh/TY9HS4x+U2HpDei8RLe73ZdME7mJseP+KR4v54PkQs+gOPcQHBTCqYu2
 RHtnS7BKIMk7e6Vwk7A33sBf7mLJjoKNcvrM8IMTmuZdott6QK/+vjRD8RZVG0+cnOquJUmYR6i
 HizA72k7x6bHj1Edq9V5mTo+o4DhWeg58hVOE6OH3We7CvdzOev5Ub1h7/pm/eWMjwIVcZQ/riV
 KVLpFeMYRBqtY1FElxzPhBjan7hPYm5N6JHFzKPi8e8QSYzlx39nuf/jEG9mkw7Xq6BDFO+ASNF
 2zbHgg6a3t5ajFVy7yuNY2ekBPN8fg==
X-Authority-Analysis: v=2.4 cv=ZsHg6t7G c=1 sm=1 tr=0 ts=68d59bd3 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=AkZwv1uTgJSVxlfcUQlFCg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=gEfo2CItAAAA:8 a=puI59K64icZz00i_70MA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-25_01,2025-09-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509250171


On 9/26/2025 1:08 AM, Dmitry Baryshkov wrote:
> On Fri, Sep 26, 2025 at 01:01:29AM +0530, Vikash Garodia wrote:
>>
>> On 9/26/2025 12:55 AM, Dmitry Baryshkov wrote:
>>> On Thu, Sep 25, 2025 at 04:44:39AM +0530, Vikash Garodia wrote:
>>>> Kaanapali SOC brings in the new generation of video IP i.e iris4. When
>>>> compared to previous generation, iris3x, it has,
>>>> - separate power domains for stream and pixel processing hardware blocks
>>>>   (bse and vpp).
>>>> - additional power domain for apv codec.
>>>> - power domains for individual pipes (VPPx).
>>>> - different clocks and reset lines.
>>>>
>>>> There are variants of this hardware, where only a single VPP pipe would
>>>> be functional (VPP0), and APV may not be present. In such case, the
>>>> hardware can be enabled without those 2 related power doamins, and
>>>> corresponding clocks. This explains the min entries for power domains
>>>> and clocks.
>>>> Iommus include all the different stream-ids which can be possibly
>>>> generated by vpu4 video hardware in both secure and non secure
>>>> execution mode.
>>>>
>>>> This patch depends on following patches
>>>> https://lore.kernel.org/all/20250924-knp-interconnect-v1-1-4c822a72141c@oss.qualcomm.com/
>>>> https://lore.kernel.org/all/20250924-knp-clk-v1-3-29b02b818782@oss.qualcomm.com/
>>>>
>>>> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
>>>> ---
>>>>  .../bindings/media/qcom,kaanapali-iris.yaml        | 236 +++++++++++++++++++++
>>>>  1 file changed, 236 insertions(+)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/media/qcom,kaanapali-iris.yaml b/Documentation/devicetree/bindings/media/qcom,kaanapali-iris.yaml
>>>> new file mode 100644
>>>> index 0000000000000000000000000000000000000000..f3528d514fe29771227bee5f156962fedb1ea9cd
>>>> --- /dev/null
>>>> +++ b/Documentation/devicetree/bindings/media/qcom,kaanapali-iris.yaml
>>>> @@ -0,0 +1,236 @@
>>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>>> +%YAML 1.2
>>>> +---
>>>> +$id: http://devicetree.org/schemas/media/qcom,kaanapali-iris.yaml#
>>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>>> +
>>>> +title: Qualcomm kaanapali iris video encode and decode accelerators
>>>> +
>>>> +maintainers:
>>>> +  - Vikash Garodia <vikash.garodia@oss.qualcomm.com>
>>>> +  - Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
>>>> +
>>>> +description:
>>>> +  The iris video processing unit is a video encode and decode accelerator
>>>> +  present on Qualcomm platforms.
>>>> +
>>>> +properties:
>>>> +  compatible:
>>>> +    const: qcom,kaanapali-iris
>>>> +
>>>> +  reg:
>>>> +    maxItems: 1
>>>> +
>>>> +  interrupts:
>>>> +    maxItems: 1
>>>> +
>>>> +  power-domains:
>>>> +    minItems: 5
>>>> +    maxItems: 7
>>>
>>> You are sending bindings for a single device on a single platform. How
>>> comes that it has min != max?
>>
>> I was planning to reuse this binding for the variant SOCs of kaanapali/vpu4. If
>> we do not have min interface, then for those variants, we have to either have
>> separate bindings or add if/else conditions(?). Introducing min now can make it
>> easily usable for upcoming vpu4 variants.
> 
> No, it makes it harder to follow the changes. This platform has
> this-and-that requirements. Then you add another platform and it's clear
> that the changes are for that platform. Now you have mixed two different
> patches into a single one.

you are suggesting to add new schema when the new variant comes in ? there is
also a possibility that this hardware(kaanapali) can be used without those
optional power domains as well. Let say, someone does not want apv codec, in
such case, that pd becomes optional.

Regards,
Vikash

