Return-Path: <linux-arm-msm+bounces-76038-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 489ADBBDA6A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Oct 2025 12:16:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 48D3D3B761C
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Oct 2025 10:16:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E0C9223DFB;
	Mon,  6 Oct 2025 10:16:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ix2ep30w"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD4B31CEAB2
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Oct 2025 10:16:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759745782; cv=none; b=Af12JILQFL9WX9ybpRCZuh+w3YrK2YLeKegyO+X3SsiTOy/KhG8sUxaqTux8p9GF4b9Nr2dpmmWhUwHZ3IAoZpRcCpYfFbCR573RRmX6oZ4NOCZl0UfAThFNViUpQy6O5uvG1gPG1HT+d5J7aGjdNlA5m+kSCokIkwlXzM3ihF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759745782; c=relaxed/simple;
	bh=Eh0d0qZba8BtpAV24kNLwWp4pX6k+8EBFDG1/TTxghE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sAUC9eQOWve1GFibZCAdnq4dvRlQpWLiUD7MH/rGwjuq9Zx1PUPXOghv1C/iOHnEZf3jwAY9WlQwQfBbmMJRHUwFHdnUcP2IHjy+dS6l6PXw+sq41xc9dFelkAS9HjPQQdQ/DkNRdo+EMRFDVc7eyWgMP6GwU0/rKuD6finy3Nw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ix2ep30w; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 595NPJ44018867
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Oct 2025 10:16:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9HMZPOeln5HgZr8mqiZ5+a+U8n0huJ7s/8ub16Ui27Q=; b=ix2ep30wcLX1e/2B
	GWNuTi8+6aA4bntOApoh/Iu8O4cZgIEWYYMQNNiYKKRDgep2Eh5gase833c96zR7
	wy6bvnzMV9AJ7BokPIXpQASHjQb2kLpIGvFLF8jjWHRBaJ38scnazrHas/SKMuFr
	PKc77AyJJcZLYwKGpHIpzADt7+wPuP2NVkpel3g5FRU3Kah2kcmvIm/BOpAr/qkB
	D7tChDwVwzw90cnHRSeFIO1gYb18JcSBIIIxTbGwxa1RKW0JSYKCQWSg2VotO3zN
	tEL6LnvqPKhJkaq1KgYcRQaq6yhGok9XO0DPzeUC8hO3NN8ytkgM7oB8QeJA2tz0
	X6lVSQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49k6bfjpk5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Oct 2025 10:16:19 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4e015898547so8559411cf.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Oct 2025 03:16:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759745778; x=1760350578;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9HMZPOeln5HgZr8mqiZ5+a+U8n0huJ7s/8ub16Ui27Q=;
        b=fdvEMx+kwXe6JBQZiqdo6AhPZCCSU1EgH7mx28HtMCUdl+NNF2h+QfJAPWBkNdbpyO
         YZUk31dBJHAT5C9RlEQ8tuFKvHhX/agH19KCR02jolfkuqZ4xbwB0vojhQO4Vh1Un+xD
         4TbLlmVT7yJrpvi2CPcqhHv2x9quV3v+KCIWKTQcybG00V4xyj64PvrP9oNXBK1+i6q3
         vPUNp/T6s6yp2Zz4Tu0UwzMOGsiopa9Glqm+iW2GDIC84RHW1KA6wPNTDuQ7FNO7Tam+
         czipwc5YDHxLefN+wsDUfuIVXB6Hi4oJEMYFh9EUaFIYFXKh2gcZ0zVWMBlgWjkaup07
         QOzQ==
X-Forwarded-Encrypted: i=1; AJvYcCWP5bw+BvKtDetRD97pVUjBdgrCNCPMquwoabMLG86OGf7ILTOuv7/vs095vi2wbJb37HxCd6VCta0+LueW@vger.kernel.org
X-Gm-Message-State: AOJu0YyKwjbGONQ93m7LpPB5K7SRp2VvK7Q9EEk8pX4n8Gp71qz7OotQ
	82WAPY1aTZN3He9P/GQPhntfYvT0D4JqHsKuBa8VgEM+/LvJTHgTavj8dD13AYZfKn03n0xufxs
	u2KDTTdaRngVmy7/q2CWw3c4pwOA7/jQkKsbunjNcOgGgBlSW7kjP/+n0uxtOULKVlgDC
X-Gm-Gg: ASbGncsJOF1biAaLMcFiLUOR+Mo8rxlG9ZiZOlp/VllTuDRrGZ53nMlB5bLESmcQ7D5
	9pCX9BMUOx8j/dOIFDNTYm4b24YmtJNX5glxu3Occmcgisrr9tOI99JgggE5BPl1nlVirqSURSg
	6npnBEol8c7UCAzHevL1e+n9wjFZwrTHE7U9GA0BMIJDljHOKK6PcMa+1qu3u6+lqP1GvwTB9aJ
	x4eyfNydnaysYMqmHju8m0yIOEphJH6Cuf7PmI2s1MaUPe18+RG7jboXA1NpCUCI4DhVGZWV9Je
	0imA+C8k3Aec6py1Kf2GQyK6VTXYLv2JUvB/UDNvOBToXgUI6qxySvoklg5PR7TWRQ+VP5NnBqJ
	torHRQGORZ9ba0Vx3xzkt/QG+gME=
X-Received: by 2002:ac8:5890:0:b0:4d7:e0ed:421f with SMTP id d75a77b69052e-4e576a2e554mr104006701cf.3.1759745778302;
        Mon, 06 Oct 2025 03:16:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFPvGGEXMKSW3PR78XzS/AjAzDzBYLQ9l2XV3dnRRFJTzKidEAVeQO5t8uTCr9+KbX0iB5dOw==
X-Received: by 2002:ac8:5890:0:b0:4d7:e0ed:421f with SMTP id d75a77b69052e-4e576a2e554mr104006501cf.3.1759745777846;
        Mon, 06 Oct 2025 03:16:17 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b4865e78242sm1110936866b.35.2025.10.06.03.16.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Oct 2025 03:16:17 -0700 (PDT)
Message-ID: <f5526ac7-6e5a-43c3-a8eb-9f75cd3c6c36@oss.qualcomm.com>
Date: Mon, 6 Oct 2025 12:16:15 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] Documentation: dt-bindings: arm: qcom: Add Pixel 3
 and 3 XL
To: David Heidelberg <david@ixit.cz>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251005-pixel-3-v1-0-ab8b85f6133f@ixit.cz>
 <20251005-pixel-3-v1-1-ab8b85f6133f@ixit.cz>
 <bq3jeaxksk33ntdk32ojsdyh2d3qkglvgj6segtc3acizlkrhm@fvdsccdbuook>
 <6807638b-b212-44b9-b7cb-e53e1f11c0d9@oss.qualcomm.com>
 <012fdcbf-3089-4f49-9c65-1d0cc24ea2d5@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <012fdcbf-3089-4f49-9c65-1d0cc24ea2d5@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: pvKrYsV2tRNvOpb-gNKSXPaOQQWczGUq
X-Proofpoint-ORIG-GUID: pvKrYsV2tRNvOpb-gNKSXPaOQQWczGUq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDEzNSBTYWx0ZWRfX/2ZHRIQIeDbO
 jfw+k7NvpAO51StXDR4u6yhA9Z1QIvAf6G/2QLOuGMXBcvex+Fx9kBl4NpYnmG2HHmkMBsGEGNo
 I7KI3kRVuOpfPoCnRKB57j8yfWWZPmwl78ONDNur52t2kOXEcShdTIIZVUqmO3r2Opyc623xllK
 Jje/D/moimfTZp753pQfnzMACZ2+aIj77A2f1UNzJwgOGp9R46YGqGSuaYCMnPE7ux/deOCZB7T
 7gkrsP9HboJZDNxA4L88I/EYo+wTJKBRDxhTFSEjwJcM7bQASkdsSONjjpw+rplxaojf/cQ5tKk
 fN2IDCtjKjxf8tmPtI+RMS1tQgjJ7ot4EpQ8N44KVaKqcM7jPX9GZgQ4SA+y6q+nhoL+JD9k9up
 /jE/zj9Vc497ayb7qHwST7S9pQldFw==
X-Authority-Analysis: v=2.4 cv=Hr572kTS c=1 sm=1 tr=0 ts=68e396f3 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=U46Y8RmMCvoGOKAdW7wA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-06_03,2025-10-02_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 spamscore=0 bulkscore=0 impostorscore=0 phishscore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2510040135

On 10/6/25 12:09 PM, David Heidelberg wrote:
> On 06/10/2025 10:09, Konrad Dybcio wrote:
>> On 10/6/25 12:21 AM, Dmitry Baryshkov wrote:
>>> On Sun, Oct 05, 2025 at 03:16:28PM +0200, David Heidelberg via B4 Relay wrote:
>>>> From: David Heidelberg <david@ixit.cz>
>>>>
>>>> Document the bindings for the Pixel 3 and 3 XL.
>>>>
>>>> Signed-off-by: David Heidelberg <david@ixit.cz>
>>>> ---
>>>>   Documentation/devicetree/bindings/arm/qcom.yaml | 5 ++---
>>>>   1 file changed, 2 insertions(+), 3 deletions(-)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
>>>> index ae43b35565808..2190c5b409748 100644
>>>> --- a/Documentation/devicetree/bindings/arm/qcom.yaml
>>>> +++ b/Documentation/devicetree/bindings/arm/qcom.yaml
>>>> @@ -976,9 +976,8 @@ properties:
>>>>           - items:
>>>>             - enum:
>>>> -              - google,cheza
>>>> -              - google,cheza-rev1
>>>> -              - google,cheza-rev2
>>>
>>> Why are you removing those?
>>
>> I removed these a long time ago, the base for this series is 6.17-release
>> instead of -next :/
> 
> I did purposefully base on 6.17 (and sadly the downgrade from next brought this mess), because the support for Pixel 3 is a bit fragile and as I have only Pixel 3 XL at home (not the Pixel 3, which I always asking someone else to borrow or test for me), I decided to kept 6.17 base so I know it's the state where blueline boots (in case sdm845 or blueline gets broken in the -next).
> 
> If you want me to, I can base the next version on -next.

-next currently contains changes from the past ~3 months, which
you're missing out on

You unfortunately have to rebase, or your patches will simply
generate merge conflicts

Konrad

