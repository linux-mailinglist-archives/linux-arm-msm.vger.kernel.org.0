Return-Path: <linux-arm-msm+bounces-60502-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C2DDCAD0AEF
	for <lists+linux-arm-msm@lfdr.de>; Sat,  7 Jun 2025 04:13:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 305897A2174
	for <lists+linux-arm-msm@lfdr.de>; Sat,  7 Jun 2025 02:12:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F2A62580F3;
	Sat,  7 Jun 2025 02:13:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HwKl09VY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DD368F54
	for <linux-arm-msm@vger.kernel.org>; Sat,  7 Jun 2025 02:13:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749262395; cv=none; b=C/LgiiVj+J3PNqDhxwn7AWVMFkkxdpSzxaNcpRGM29Cw5aMM1Vjen6GJsfeZJUV5KJJ9g9e3hQE9lfx2BttAb+vdGLl7ndu5tYdbgQw53ulvseUPPnPEp+Z5bGjh8mq3B1nvGbqdS/J6PaeWhyNOKnZlygG79Xe+BPFBCMObiQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749262395; c=relaxed/simple;
	bh=eUxFrBFp0ONXP/Y3CMgcye0PPpcsm5lLHiLJ2ypC6Gk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FGWXTcyXwCqY8mDAlc5FE52R0d6FUTA42oFSThU3V/JA5mnlzCLt5Dj+fZz6xftKIqAspE0v4QpcvzmxFKFk3HkPdTnd+dZ5ZFk1d/zD/duLXJcsqS2PX4AWcaOMwv0VOABQac3bZVst8O8vohNrUFkFNlYXCYIFKr2yMBDwAj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HwKl09VY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 556F9KWQ023181
	for <linux-arm-msm@vger.kernel.org>; Sat, 7 Jun 2025 02:13:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LNC+SBQQX0KLS9LMQnxgQ/a4DzNVcrUKnUuhtg5+TZ0=; b=HwKl09VYvJZxHYIm
	Vywde0VOyjGNEnCq0G5drnHwAUX/m00dsSRBfvaawqB6C0LzSAj3Tu/xdGnFifmq
	yFHlN1PWqyaTJw4F5fujT4ClBYMh1QHBXvCigombJFy5jfGBIiMHvYMaJpXUXgJY
	NocqNW5MZrsl9Aw1g1rfZjk3FqsGDokCoTSIg0DBda+WH6QRBG/QCPEY8Aio4BRr
	0aIS4BNyWeei98ihvMDuc0F/yVG8Xv52p0IlYFLWdualcDTxdPSt3jSdEH0EIpyP
	uWMF0RtPSP0z/5L+JTBTkR4e7h6SWtecfmaGVEymYgbOXvhbcdYRyWvJnSmHnwzV
	xoTKfQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 472be89v7y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 07 Jun 2025 02:13:13 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7d0aa9cdecdso258890585a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Jun 2025 19:13:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749262392; x=1749867192;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LNC+SBQQX0KLS9LMQnxgQ/a4DzNVcrUKnUuhtg5+TZ0=;
        b=DI8lS4zIwjz8nL92YXWgYJ0Fih9lMktn2AUYiywhieV/FR4vUBP/jqD0j9iURxyOH4
         pn4VsDiQg/Q2WDIV/DUDJ/51CrROSMI1yVN/EX67nvIL4E/KqB5aGqyhAByxHZS4JvAi
         yuTs2ectR/HkBO/59zRMIiykkc49Aukbb0Ec5X6+Xi8NArsEkQhaVdJwTg9gstavFHUf
         PiextoIgZzzIcdNw22DYduT89lNR3p239Z8YqONbrUKUKqStVlX2jD/WApK5y/ieZf1r
         /PY8aBFzl8gAT0MN0dbT352nlrjNZbrMIWonhefZjU5Od4X2hs3s/usbzypmKzzXxg95
         IkTA==
X-Forwarded-Encrypted: i=1; AJvYcCVgy+c28sQEIIUe6hw/7VO9fEzTzoAY41alcSoAxDmFnUlIrrqsCttsGrpkJ4b3lsaSNE0z9UW/hB2E8/BX@vger.kernel.org
X-Gm-Message-State: AOJu0Yxg+pWCgDvWw13tqMWf1KktmPn4QxfakKY9a0p/IxrRmKkZQpKl
	7z3JMs+ZLKtIDEc3oeOEnyOkmFL+yueqXNfJGy1yV2WqRglIPK5DYcZ4sNlOYYcLLFMIXnSr4Dj
	WVJ/GtAfxbioosWd+6viLJCLLpfEx2bhOZE9ZoZc7pg8i9yAdEktR34XVVx9ZWOhYAK7l
X-Gm-Gg: ASbGncu7GGnbppblzAYUqlcIN6kk+RzequGdVUWvidEaZCuA2GtTgqtjQx9dCcChZGp
	7py1THthO7HBDDJhxwWZEnVAKHH9XxgDP/4XtOxMCYGRLBRCxf7GS95Q/XeH6/oFZaQnFK49958
	yxuTJuE4v3QurssXeGbzV8cM8FxL63r9Yg1NL+VrIzG8ovpIgWdU6wvHBr+PwFtcxGFq8xlrfIY
	1hnHWWg224/4UBk3XxqqN2ezaM0GyO+5xs1mzkL3CSxadlSuoDXqcAfiQnc0pIeh+/SiZbF6qZW
	He6r0MGNPo25QKUaE86IclGWV2mSNTOe6s3zjBHvCYNJ2jn+7IJjGr+gIMvkJ44hCpsJdPP3+1V
	ieei5cc3QtxnwJg==
X-Received: by 2002:a05:620a:28c7:b0:7ce:bdc6:af03 with SMTP id af79cd13be357-7d2299739b9mr724189985a.34.1749262391812;
        Fri, 06 Jun 2025 19:13:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH9+9tQzP9Xj4ZdMiOijwBLsSZ+6qk9AvT2izfO66/kKl3OHMwjeB0WbRkXZVtlsecaNwvbfA==
X-Received: by 2002:a05:620a:28c7:b0:7ce:bdc6:af03 with SMTP id af79cd13be357-7d2299739b9mr724186885a.34.1749262391418;
        Fri, 06 Jun 2025 19:13:11 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0c3:3a00::4c9? (2001-14ba-a0c3-3a00--4c9.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::4c9])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553676d75a1sm356765e87.87.2025.06.06.19.13.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Jun 2025 19:13:09 -0700 (PDT)
Message-ID: <a258433f-f1da-4be7-a0af-645571aab871@oss.qualcomm.com>
Date: Sat, 7 Jun 2025 05:13:07 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 0/3] media: venus: enable venus on qcs615
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Renjiang Han <quic_renjiang@quicinc.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc: Vikash Garodia <quic_vgarodia@quicinc.com>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>
References: <20250530-add-venus-for-qcs615-v8-0-c0092ac616d0@quicinc.com>
 <wmri66tkksq6i3hfyoveedq5slghnnpozjzx6gck5r3zsiwsg6@xevgh54rnlqd>
 <285cae4a-219c-4514-818f-34c8225529de@quicinc.com>
 <5854a587-aba7-4e71-87f8-249ba00cbc59@linaro.org>
 <996c9a39-5520-4b43-adfa-06ce29223ba0@quicinc.com>
 <713b87cb-0003-4ee3-a599-9cd41629bb42@kernel.org>
 <7aa36a0f-6741-40c2-93f4-036823d245fd@quicinc.com>
 <247002c0-ee68-4d0d-857a-768bf68bce75@kernel.org>
 <d5aee491-3ba2-4beb-8b8f-4ba8372e6d16@quicinc.com>
 <fa6a7983-27bf-40db-9843-0891bdadf523@linaro.org>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <fa6a7983-27bf-40db-9843-0891bdadf523@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=bNYWIO+Z c=1 sm=1 tr=0 ts=6843a039 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6IFa9wvqVegA:10 a=JtWKr-mtcYz7jm8YwJUA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: u4p1eDdN4mcPwsvdTZM139xMzLA-0DNx
X-Proofpoint-ORIG-GUID: u4p1eDdN4mcPwsvdTZM139xMzLA-0DNx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA3MDAxNCBTYWx0ZWRfX0Ffd7pI+31Bw
 Env1VVzKhx1H+nGehuFqj4EoCrWYcJccGMACjJBFpy6i+/+LYW0hCoMfDd9XB91W0Izl7EvgCFI
 YQShlWOTJO7o6+zhkGGTzSxMTA5hQ2Pm04iIeZDYN20lfaTZSDH4g/7VEfCw5Omond+NLHZOBjP
 Wd4AvZR09NaTNOFsytuUw+Vd3JU4jpNbqXzVUeQ9OmuTfja23506WUsCCf7X0U2h2VSt34dGJwG
 oJdK86XmGR5E7mPQ+DlIDc9iLO4t8AP2GK7ea7uwh17Xs3Pd3r4UbFjl/87aYGuRsZzgW+UzbtF
 eaizYKb+gZ+D/Wq8Z/jc9kMDVSCkTNkI43Wd5eCLJhoQOFy3frrO1JSrC4FVQskBNYOy6AlGpUL
 MjZhIjYBaMFYwEshvwmVeZn/rFFYDa07o8H99CgYItwJbKHxIUfhof0U7vSggFW/4SIOcii/
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-07_01,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 suspectscore=0 mlxscore=0 impostorscore=0 spamscore=0 clxscore=1015
 mlxlogscore=999 adultscore=0 bulkscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506070014

On 06/06/2025 15:53, Bryan O'Donoghue wrote:
> On 06/06/2025 14:32, Renjiang Han wrote:
>>
>> On 6/6/2025 8:56 PM, Krzysztof Kozlowski wrote:
>>> On 06/06/2025 14:51, Renjiang Han wrote:
>>>> On 6/6/2025 8:44 PM, Krzysztof Kozlowski wrote:
>>>>> On 06/06/2025 14:37, Renjiang Han wrote:
>>>>>> On 6/5/2025 8:34 PM, Bryan O'Donoghue wrote:
>>>>>>> On 31/05/2025 01:05, Renjiang Han wrote:
>>>>>>>>>> Note:
>>>>>>>>>> This series consist of DT patches and a venus driver patch. 
>>>>>>>>>> The patch
>>>>>>>>>> 1/3, which is venus driver patch, can be picked independently 
>>>>>>>>>> without
>>>>>>>>>> having any functional dependency. But patch 2/3 & patch 3/3, 
>>>>>>>>>> which are
>>>>>>>>>> DT patches, still depend on [1].
>>>>>>>>> I'd say 2/3 and 3/3 still depend on 1/3, otherwise we can get 
>>>>>>>>> video
>>>>>>>>> core
>>>>>>>>> on QCS615 over(?)clocked.
>>>>>>>> Agree, so we need to make sure that the driver patch is not picked
>>>>>>>> after the DT patch.
>>>>>>> This statement is confusing.
>>>>>>>
>>>>>>> 1/3 states that there will be a fallback if there is no OPP table
>>>>>>> present.
>>>>>>>
>>>>>>> Giving the code a glance, I believe that is so, freq_table should be
>>>>>>> used if there is no OPP specified in the DT.
>>>>>>>
>>>>>>> I think we are having a hard time here understanding what you are 
>>>>>>> saying.
>>>>>>>
>>>>>>> My understanding:
>>>>>>>
>>>>>>> - venus modification is standalone 1/3
>>>>>>>     Qcs615 will fallback if no OPP is present
>>>>>>>
>>>>>>> - dt modification 2/3 3/3 is therefore also independent of driver
>>>>>>>
>>>>>>> ---
>>>>>>> bod
>>>>>> yes, let me re-spin this with driver patch alone. Once that gets in,
>>>>>> will bring in the DT patches.
>>>>> Did you read my feedback? There is no "once that gets in". DTS is an
>>>>> independent hardware description and your patchset claiming there is
>>>>> dependency is just broken.
>>>>>
>>>>> I am repeating this since few emails, so shall I NAK it that you will
>>>>> address the main issue you have?
>>>>>
>>>>> Best regards,
>>>>> Krzysztof
>>>> Hi Krzysztof
>>>>
>>>> SC7180 and QCS615 use the same video core. Only difference lies in the
>>>> freq_table for the video. Freq_table is generally determined at SOC 
>>>> level.
>>>> The Venus driver does not currently handle freq_table compatibility 
>>>> well
>>>> across platforms. This patch enables the driver to use the OPP-table 
>>>> from
>>>> the DT, addressing the frequency compatibility issue.
>>> This does not resolve the main problem at all. If SW cannot use the
>>> fallback alone, your fallback has no meaning and is not only confusing
>>> but actually incorrect. And based on previous statements like
>>> "overclocking" it is not only incorrect, but even harmful.
>>>
>>> Best regards,
>>> Krzysztof
>> The fallback is only triggered when there is no OPP table in the DT.
>> Since the QCS615 DT will include an OPP table, the fallback logic will
>> not be used.
>>
>> Also, if the freq from the freq_table and the OPP table are the same,
>> would it be acceptable to drop the freq_table from the driver?

No, it's not acceptable, because then you'll break support for old DTs, 
which is a no-go.

> 
> If you drop the freq_table, you will need to apply OPPs for the sc7180 
> to DTS first before venus or you'll break sc7180.
> 
> I think TBH you should add a freq_tbl for QCS615 and make it so the 
> order of patch application doesn't matter wrt adding OPP support.

That would require adding board data for QCS615, which definitely 
doesn't look like a good solution. It is _exactly_ the same as SC7180. 
I'm against duplicating it just for the sake of having freq_tbl.

> 
> - Add QCS freq_tbl
> - Add OPP support
> 
> Then do whatever in DTS, nothing can break in this case.
> 
> As we've established the fallback isn't a fallback because it falls back 
> to wrong data, so lets fix that.

Why isn't it a fallback? With the driver changes in place, the fallback 
is totally correct.

-- 
With best wishes
Dmitry

