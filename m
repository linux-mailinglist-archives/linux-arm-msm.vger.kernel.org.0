Return-Path: <linux-arm-msm+bounces-73074-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 391ACB52C43
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Sep 2025 10:53:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B52287A2135
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Sep 2025 08:52:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B91DC2E62C6;
	Thu, 11 Sep 2025 08:53:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OrIY/QGA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B7FC2E6137
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Sep 2025 08:53:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757580814; cv=none; b=h3It2/VdGyMMkStwtEC1z9H/RCUDgeYSuHAmfoH6QqCiZRMEiq0oZrBRTnI99zUihikG7yAFux3vGewaRxNLaKT9ecxDHVqqIHd1XZdNoISLDkoTRpMNQlNtY3ZPV89YspkRqXUL94arvLh6AjwwutQf7KQLIohRcAgI4Ajx8SE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757580814; c=relaxed/simple;
	bh=rAsx1W0BJTPP4nRI2Q1Nmo+8/AQQ8dP4RLS8RmnUsy0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=V+2Rg8nW7AiYQmcEW8kkUHlsy5h1V5tVMD6TreAoZ++Bia7Y2z8fhN+3/6tcMghAvC+O8uPnWaq0pN+eOSgPqDlubBv4GwOmCRC7PxNG522YfYjYweEVow8TDOEphSEY38CwJc8r05yCQH2xPUMFbVSB/5/dHKm90Xw3B8hx3O4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OrIY/QGA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58B2J8LW003399
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Sep 2025 08:53:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ynWl2+LN0okkZhiNEn8Jl42YKjFcoHHouZf21AAoHq0=; b=OrIY/QGAjyiGsCvf
	Dmxj++57E6yEaDivTVuW7agmMUOYVnC/DM5C3oLOgZuxx0OCoj8r3Lf58/yLCjNx
	x2zKTAvM6/VIyfu4Ob/p2P+uMLolymGRxGIjExVMyPEy0Wz8bz1SH1/CEMDJKN17
	AJFUJ39O3bXtCI0zB99HZs2ouvKC/RrC1QH/CN0frAAic/bLsJGwXY96olQSdPdD
	aLJgznelxD2iQAATm+WkFealh2YMeYNtuscpRVSqXQcUhIn+ONuHSDzRP5FwU+xv
	0Sx0y+JpQh/Vq3qzD6Wer6WeilyLnVDkDGpEM1EDHM2arVchyWdLKp4UOurR27dI
	nAYTaQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490bwsf435-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Sep 2025 08:53:32 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4b613a54072so2166691cf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Sep 2025 01:53:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757580811; x=1758185611;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ynWl2+LN0okkZhiNEn8Jl42YKjFcoHHouZf21AAoHq0=;
        b=dJlGnEwuKil72T4vbZ7Igd+3dgb6nraZqKZkN/xHaYF9LPJFIB3+/SgS6dDJlESupG
         qc1S+pHPbWrM61C66oqPYMOJ/bz7yBL1Ks69gjjm/ypYbR1Xl35a49GvGREkjdXRH9EI
         Bwl82XlqJpEcdwNIV3At6M6XexeHzWcnhAbrX+yL/FaO6BnpNVPg459MwK6cQHhSi28M
         of7BxgYwcCauleH0cB30p8N4IHrFkNZEDLaVT5ZFAUOA+syvYIahHbWg0TtjL16w6wWR
         IWEwfWimOJxKddeky39U9ECyO0Xo2akAX4RkWXPWZkmLaolUcQg/2rYRP2+imBwlzAcE
         17bA==
X-Forwarded-Encrypted: i=1; AJvYcCUH7KDHeQHwj1HHZg8K4RFEH4SUV2ovUM0GojjWllO9IrXQWdQwg40Sl6V2UvOaw3jQfiSAHB4N3h+ii6k/@vger.kernel.org
X-Gm-Message-State: AOJu0YzIOyDcIz06C/XghSl63VJA0MXNxsp+VoSnirFvMkurxviwI/dS
	3JrUAlApVIwoLYXvKLI7NRQ65t/jKUFjC9kUNZd3rgLyMklhN3YV0gFWeEULSXv4GlQb2QVZnGP
	Vf0c/WF2rS0zwstuIogPaTj2M8Bcj5Ld3yFgLJCpcQlbvTM7+nyaP5j4nvPCK0LtIgJdX
X-Gm-Gg: ASbGncsct4B/p2Ua3nblI32bqeY+ZyXxHrEFWsTTHG/RKhYZhcD5se7PvWZNCHioz7A
	q8u7+NxelfIb/dOYXkeUDw5swPm7hVrzON6FNvV/JId943TB+RGjeQS3G8ekVBF/yG4AYrzyOSL
	jDgZMAxXQVwXeccSHn6jwk0elzzXbB9BA8mSHUjfWu4yGiF9DJTaMweMFZV7N0Zjp7bk4+r/0sy
	Cj4mKgR9jLRAqC3DBG8TESBzUSk3QW4k9s916rtXlSei2RsNpXuuZAyXepqZyDBOqw+9cvRdBpx
	hm+RlmKnHjD8XzcYIAVyaCNuSEopklghfs0TRLrxuEEU/n52uHvlWyfmaTxv981ye266FmoUpQB
	Pgr/0DvahnY9Ts0MEVzuADw==
X-Received: by 2002:ac8:5e09:0:b0:4b5:f68b:86a0 with SMTP id d75a77b69052e-4b5f83aa98fmr140394381cf.5.1757580811155;
        Thu, 11 Sep 2025 01:53:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGwrCXlNX3e4J1CCi9Qj59YkjWyURxTP0akIJvONe/E360yXgamsqbmCNGDwjWVWtWm2ONHng==
X-Received: by 2002:ac8:5e09:0:b0:4b5:f68b:86a0 with SMTP id d75a77b69052e-4b5f83aa98fmr140394291cf.5.1757580810734;
        Thu, 11 Sep 2025 01:53:30 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b07b32f20ffsm86223766b.79.2025.09.11.01.53.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Sep 2025 01:53:30 -0700 (PDT)
Message-ID: <b83a59f9-16ae-4835-b185-d5209d70a0f6@oss.qualcomm.com>
Date: Thu, 11 Sep 2025 10:53:26 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/9] dt-bindings: net: qcom: document the ethqos device
 for SCMI-based systems
To: Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>
Cc: Giuseppe Cavallaro <peppe.cavallaro@st.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        Eric Dumazet <edumazet@google.com>, linux-kernel@vger.kernel.org,
        Andrew Lunn <andrew+netdev@lunn.ch>, Vinod Koul <vkoul@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, devicetree@vger.kernel.org,
        Jose Abreu <joabreu@synopsys.com>, netdev@vger.kernel.org,
        "David S. Miller" <davem@davemloft.net>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Jakub Kicinski
 <kuba@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-msm@vger.kernel.org
References: <20250910-qcom-sa8255p-emac-v1-0-32a79cf1e668@linaro.org>
 <20250910-qcom-sa8255p-emac-v1-2-32a79cf1e668@linaro.org>
 <175751081352.3667912.274641295097354228.robh@kernel.org>
 <CAMRc=Mfom=QpqTrTSc_NEbKScOi1bLdVDO7kJ0+UQW9ydvdKjQ@mail.gmail.com>
 <20250910143618.GA4072335-robh@kernel.org>
 <CAMRc=McKF1O4KmB=LVX=gTvAmKjBC3oAM3BhTkk77U_MXuMJAA@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CAMRc=McKF1O4KmB=LVX=gTvAmKjBC3oAM3BhTkk77U_MXuMJAA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: cdD48hltzc40ytsxeH1MtQmiupkpHm05
X-Proofpoint-GUID: cdD48hltzc40ytsxeH1MtQmiupkpHm05
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAxOCBTYWx0ZWRfX89J7P4Z0qdxe
 n2BxjffdfH1JBhmERY48qAGqr/1wp6MxwpsvBcyRLcNrtJdOqLTL/5kVW9PFLbs1oXmkOLWATZV
 FQRPf6wB40sZ4PXeatHMFZ2TTtLJA9rXfXjBpyTjSiLfjao72qvMzALfmeVWZfHIE99J0c6u+TX
 xSf7w9H66ii66C5r2+yrVyQnrsWhO53AKIblBTS4uQOq4dI5P/IAJKtwvClVU0HkO6FvevTQUsH
 3WGYv9zg2mFLMXStZIVuSTkU6Ikb7v4iIwIa4Wwpyqxlgw4OwGhX7P6nCgmY+OYq10Fr0IhC6/X
 P2ZBVsE4nxXtmae4uXu2mwFy0pwHI6NQQatL7okBXIKnhE+w1DNPlP5MWp6PQuzMdgS4MjC6T8i
 pSYKd9oB
X-Authority-Analysis: v=2.4 cv=G4kcE8k5 c=1 sm=1 tr=0 ts=68c28e0c cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8
 a=E8Hth7WlfHmEou41Ml8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-10_04,2025-09-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 malwarescore=0 adultscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060018

On 9/10/25 4:42 PM, Bartosz Golaszewski wrote:
> On Wed, Sep 10, 2025 at 4:36 PM Rob Herring <robh@kernel.org> wrote:
>>
>> On Wed, Sep 10, 2025 at 03:43:38PM +0200, Bartosz Golaszewski wrote:
>>> On Wed, Sep 10, 2025 at 3:38 PM Rob Herring (Arm) <robh@kernel.org> wrote:
>>>>
>>>>
>>>> On Wed, 10 Sep 2025 10:07:39 +0200, Bartosz Golaszewski wrote:
>>>>> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>>>>>
>>>>> Describe the firmware-managed variant of the QCom DesignWare MAC. As the
>>>>> properties here differ a lot from the HLOS-managed variant, lets put it
>>>>> in a separate file.
>>>>>
>>>>> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>>>>> ---

[...]

>>> These seem to be a false-positives triggered by modifying the
>>> high-level snps.dwmac.yaml file?
>>
>> No. You just made 3 power-domains required for everyone.
>>
> 
> With a maxItems: 3?

In the common definition:

minItems: n
maxItems: 3

In your new file that includes the main one:

properties:
	power-domains:
		minItems: 3

Konrad

