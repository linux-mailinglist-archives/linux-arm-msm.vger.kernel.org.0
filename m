Return-Path: <linux-arm-msm+bounces-59726-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 33854AC6EA5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 May 2025 19:00:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F03673BD57B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 May 2025 16:59:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65FF128DF25;
	Wed, 28 May 2025 16:59:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="i9A7msKs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD5A928B50C
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 May 2025 16:59:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748451561; cv=none; b=h3FWx/qotm/q9u7p1pTnXD4E+rHyFfD2fPK2mR6WxvDbHWPmMO+kR8dxU5X7kurvQf6RZrep8XYQELTW1JkdPAiQGrF+Humcs6hteCZNnMCWvhjFJ0377UO1d08TiqX0OS28yPaSN8g4FavvnYVNstpfPXythCQs0X8EUKI03h8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748451561; c=relaxed/simple;
	bh=bbz83AfdKHYzzOPGEeednRwLoLYcbCnR8BtMwWBiaqQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uPzib41+mar8cg16bwkfg7I7qlkQ6cbCtBK7W+Mqo/3NB/Ui+y1vsL+cO+U3RyZPQUBUpLMhwKWMtWi7C2jiIF2a3jzvto3Rzhkwq7381LUW6rUmNxp9hRmqBd7vSoBWK933m6WEtXbbo89xB+qAAhTHCohwpWxFWQosbqmpFto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=i9A7msKs; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54SBDIhg012686
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 May 2025 16:59:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OZ/GIA0WSr9eJOkPJDxd+ZEymhaMmc/jbzotcFP/Tp0=; b=i9A7msKs9T4m7sQ7
	9TD0U0CZGjMVxxWKsjjZmpIQsmp7adNbwlUWZXuzAZKzX5KDDt1EoS4kEuZhEYr/
	IiAeunODH+51QL6PYly/6Y1PXn5EtynYXcqJWvcXzgfPa3TVHq8eFVNcltF/FXdO
	TpitkVRaBXjkrp8FcuuaQDqCYGOmHvdNBX33NKDPpctYR5KWk64UG/6Njg1fmw2Y
	0KzcgDVF2XdtNG4pLKnpDb7TSUfM6QFM1Pr+lpV4iyRepkMNFoVvgIyVImeWqCZL
	rW+Jkzhwvdif3WtjI3WJnY9WIwAlVRtKvESEtEz66/fHq6y5wkL4NPDdc2FHSpak
	am3X3Q==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46w691deya-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 May 2025 16:59:18 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-476783cbdb8so8353351cf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 May 2025 09:59:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748451557; x=1749056357;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OZ/GIA0WSr9eJOkPJDxd+ZEymhaMmc/jbzotcFP/Tp0=;
        b=G9qXcyf6NOaxM0iIG8N6YsCFVKS0ZmdCXomWxJCqU6jpxV4XBLK4vB9d1AheZ0MMWb
         /4L8lPbz395lwzM2zRgPsGFgtayajy0gPTVvISlThKS9s/sBB+Q3xNsUoVR9PqtkbRts
         HfT2eWi/xrENkRCL9VT9PTW4fCw5z7uTWXMs+MTqpXxOVJgZbvIZsM37nR4ILRZIgtMZ
         304X9YQz5txplftX1SPd5j4En3XwwdM2o0gkZ31dzL1a61mh4ps3C4CUZyObXK60wrg7
         vk7Z8LHnDaFRptp3PryJOS2QSK5BbJ6MHnGmvkmn5VS4Z8HDki36t2WvCbjYq49DBGJl
         TXFg==
X-Forwarded-Encrypted: i=1; AJvYcCXjKx3pVvFCc7kqCb+K88uzd3kYBE2YlyMBPapYGtgkDe2hv25FqcJAkBmdi0/wF5IirCJ7gTabeG6O/yzb@vger.kernel.org
X-Gm-Message-State: AOJu0YwsGaUUdRIbVwpEwJQzAa1W7KCWVND4He96TQP+piKBk1hU7B3s
	YHcRDVzO/D0CQQxh4fsUlY5vlSkSJhlEpPLGsHO7yzfWiNb/0sAGpAJ1vzHRAm77yDC8jDjGdwt
	tbQA7cJC17B6n8uVMxiqJptov+v8V4BYt78nwnYEzm1EukhE/nmI3efBTvnBsD3NGRvSq
X-Gm-Gg: ASbGncv1X/4qvAuuSsJPfqZVguRgLtq/1DF0eTgzLZ5V/DvuhcOPFJOeGPsHrwHWzu1
	7hm2QqnmVbrevYyHgq6xJ5W7WTEoxOAs5swGZSzWHdVudXedEAIWMLSIIJGzDKIo3TRe5exiRCG
	wCIaEMcANjgGgHJxwlXZ+fcqelGgYXm+C8JItx+U6vrtPmJhp2uVkEknVGmFnATJIa7zuyihjl5
	DNKVJ9rwC1Es1C+WKe7LSgNnth+DH3skb4zIk4LDIApchMdJ4tBgA97Xv5LtFAT3jftYVACr74l
	BajIgCKBn2Jq306sqWqsJg4dRorpUS0+M8h9BfMQmjbHRdbdBA1uzJAkS5y9xx+AOw==
X-Received: by 2002:a05:620a:40cd:b0:7c7:5384:fa53 with SMTP id af79cd13be357-7ceecbf4af7mr968130085a.6.1748451557379;
        Wed, 28 May 2025 09:59:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHAL+YqMQeWpvXAQsu9NOtyQO1XUv8gfuWwheXdpWcfFgbiPN1ZK8NrIvSTpLX2pyw7cfpnQw==
X-Received: by 2002:a05:620a:40cd:b0:7c7:5384:fa53 with SMTP id af79cd13be357-7ceecbf4af7mr968128385a.6.1748451556936;
        Wed, 28 May 2025 09:59:16 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad8a1b29351sm136692966b.98.2025.05.28.09.59.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 May 2025 09:59:16 -0700 (PDT)
Message-ID: <a669eb4a-8e4d-4bdf-8bf0-7699d9a99e63@oss.qualcomm.com>
Date: Wed, 28 May 2025 18:59:12 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/5] arm64: dts: qcom: Add Lenovo ThinkBook 16 G7 QOY
 device tree
To: Rob Clark <robdclark@gmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Aleksandrs Vinarskis <alex.vinarskis@gmail.com>,
        jens.glathe@oldschoolsolutions.biz,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Douglas Anderson <dianders@chromium.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <quic_jesszhan@quicinc.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Johan Hovold <johan+linaro@kernel.org>,
        linux-usb@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20250524-tb16-dt-v4-0-2c1e6018d3f0@oldschoolsolutions.biz>
 <20250524-tb16-dt-v4-5-2c1e6018d3f0@oldschoolsolutions.biz>
 <g7vlyqma6ow6tdsaqt2rfwvblxqwbqlwmoueio7i4vqvjy76kw@5bz4g33pq4t7>
 <CAMcHhXoYkQru_0n5siMGGkTcHu8yWRZWfT4ByiD8D0ieZHF+wQ@mail.gmail.com>
 <vwoixgdyjjzcjlv4muwrzv7wztnqyidtj7ghacgkjg6hgkkyl7@ji53bhiltaef>
 <CAMcHhXqDFuo+x99KOK0pQFj-FyTdQoZS_JvehNE2AC_JSoQ2gQ@mail.gmail.com>
 <rvyfkow43atquc64p6slck6lpfsot67v47ngvfnuhxqo222h6k@kdvbsmf3fwsr>
 <CAF6AEGvr_foMVwaE_VSVWLT50cbGi8i3UGwo2e=rORD-1JmTmA@mail.gmail.com>
 <152f5150-30b0-400c-9816-13e4710a4156@oss.qualcomm.com>
 <kbmqr7gjkd72hgorbhbwb7ttvmecfbb6pg72st7zwt5ogxju6p@itycxk6vriy5>
 <CAF6AEGsTtEA=So1CDhvg8H5+Z-RJ9OnhgSzDoa+zkWSPO3cvnA@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CAF6AEGsTtEA=So1CDhvg8H5+Z-RJ9OnhgSzDoa+zkWSPO3cvnA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=WfoMa1hX c=1 sm=1 tr=0 ts=683740e6 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=fSamKcmLYGn2YG_ZD4IA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: xQ-JduXIUm31bip2NuoY4PLOOdXbRL4T
X-Proofpoint-ORIG-GUID: xQ-JduXIUm31bip2NuoY4PLOOdXbRL4T
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI4MDE0NyBTYWx0ZWRfX+OWbA9KXy9Qq
 DgAQa8lxopO4FvcwY6WbS9jAghjs/GCe/fQIOC3QXJ8nTREwgdlwB9mUu1OFuzjQknOEyakbVAG
 RQK88GPaouC3pyF09Wph52+GT/YrMonyqUOxw/yvyE+W2+ISwv+nqog2ok8H1C1Mc1SyE2k4UWw
 wB/QV8/Vx7sMdOsyXEz+ryHlL6m+yDDHX8HRbHTO3/LCve1IVRoePB/zY6uvQajrRZaACxHuOvu
 nt05HsmbfO28/AYj3jIFFT/xaEHUnCEM/GXBNW4qn5WVuQJgHj6jJHjwiHc4yTN8umwM86sB+3O
 s152Ia478KPc+dNNo+NTfpWMHr6bOKD8COzEq51tOB1hLoWNqhToivxcet4a43xKHuz3mwJPqvP
 /98+Pc3nRpuZCyVO31wUVqBPBMLhRy5PkN/La9CtFgQstiNAgGtiVBsfQaR7wLBWD/WstYnx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-28_08,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 mlxlogscore=999 priorityscore=1501 mlxscore=0
 bulkscore=0 adultscore=0 spamscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505280147

On 5/28/25 6:50 PM, Rob Clark wrote:
> On Tue, May 27, 2025 at 11:18 AM Dmitry Baryshkov
> <dmitry.baryshkov@oss.qualcomm.com> wrote:
>>
>> On Tue, May 27, 2025 at 12:55:06PM +0200, Konrad Dybcio wrote:
>>> On 5/26/25 5:28 PM, Rob Clark wrote:
>>>> On Mon, May 26, 2025 at 1:36 AM Dmitry Baryshkov
>>>> <dmitry.baryshkov@oss.qualcomm.com> wrote:
>>>>>
>>>>> On Sun, May 25, 2025 at 09:43:36PM +0200, Aleksandrs Vinarskis wrote:
>>>>>> On Sun, 25 May 2025 at 15:33, Dmitry Baryshkov
>>>>>> <dmitry.baryshkov@oss.qualcomm.com> wrote:
>>>>>>>
>>>
>>> [...]
>>>
>>>>> Yes, please. Don't set okay status for the GPU until it gets enabled.
>>>>
>>>> Drive-by: Shouldn't the dtb describe the hw and not the state of the
>>>> linux kernel's support for the hw?  Ie. if bad things happen if we
>>>> describe hw which is missing driver support, shouldn't we fix that in
>>>> the driver.
>>>>
>>>> (In the case of the GPU there is the slight wrinkle that we don't have
>>>> a gpu-id yet so there is no compatible in the dtb yet.)
>>>
>>> My two cents are that it's okay to enable it, at least in this case..
>>
>> That would most likely make display unavailable as DPU driver uses GPU
>> as one of the components.
> 
> Hmm, perhaps we should allow the gpu to probe, but just fail to create
> priv->gpu, similarly to how we handle missing firmware?

Yes, let's stop killing the entire combo-stack in all scenarios..

Konrad

