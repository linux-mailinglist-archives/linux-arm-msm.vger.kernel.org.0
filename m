Return-Path: <linux-arm-msm+bounces-77992-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A1A70BF0EE6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Oct 2025 13:54:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5B2EA40604F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Oct 2025 11:54:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B0F8303C87;
	Mon, 20 Oct 2025 11:54:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iFRnPDvJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA0233019C1
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Oct 2025 11:54:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760961253; cv=none; b=h/YPypeLl/FIFpxcLcbVHWMQ5B0QGLE5laPd0oJ0g3giRpu7WtItEG4JcW6K1q4TAlWHX5ACJGRWfYxghBpGbUOxvA/Xx8p4qOeAHsuTAyQW0237H3GFJfcR/TNVaHRcJP15UoIoVt7vczeaDScFmNWJliQ73+8w4tWBZlSUyjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760961253; c=relaxed/simple;
	bh=XOIoFcLWk/VxuwfLj/ZGuAxaYM5SP7XocY36ApNKCWI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HOZecnwJUPogOqvp9OsLd3xfpkz36RSoQbMAv1hxVKWoVbKLiYHd5YdUztShGBNggHAuhrRQw3PnFAYnjPdi0oNvJ0l6mMX9BgMbqelbjrsc4mkEn6geL5g9s5fMbPPCHIYMczG0VnpgemBIZJ4eyagcGoUv2HadgRe0XgTXWvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iFRnPDvJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59KAYcWe029041
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Oct 2025 11:54:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XcShWWRo4S23fgER/KylWBMkTNjMeFbimZyf7xwZHKU=; b=iFRnPDvJf7Ns1pah
	vuoBBsX5XlQaV58G0SQaZaudlkk96rrMaCUnYQ2aNRMk6yvDzGIp7VX7n13VhKPR
	dLr0c6QkMAvwgtIYLD82LEFR7ZpnNLAvT6m5zuklfKUnLYB3W9Qf+oXNKDmwSHvO
	piDOAZ0zLplDJPN9+PD0uAcaxai6aAwzJC0QN8fyCyIwqSXJftxbxXM+Vg22/Gqy
	55of4x153hYrdFeenxCQiqjxx0bvEn22NtmbFBXy27uLGzz9f9IepmOCtimpHhYJ
	vpETB560L3YYti6nV6eZSCle6qof8mTSzXQMcB0+HPF2o8CGq5fCzfjDHUCe3/BB
	nrxxEg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v343vmsx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Oct 2025 11:54:10 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-88f3a065311so155739785a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Oct 2025 04:54:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760961250; x=1761566050;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XcShWWRo4S23fgER/KylWBMkTNjMeFbimZyf7xwZHKU=;
        b=TZghS7HimLs4Yv0Imdy5qIUA0QDABVP714j+ESRvV/jbwWtkQje/zK+m+BCIHnNsOy
         PmXioj/K2TP7p4gIhKlbsvXisCJaksnByT28qO6YmYolcZR3Buu2An1citMcPN8kqQyG
         PRdBb7HsDPOzxD6j8tu2sULU9xf6BX9odnEcnFTzg/ip5eKvu0+13w4Etij4FJ7QYGNw
         lVe5wpkUXa+zxILPBZxMmF/kKUb6aUdX4pLF7aUwftdy62RSYsGl43nVENzGFdf5VzMm
         Z2NRgTgVV1Aq0pMdnYYxdaAgSWnQXukyXmC7Ru1b38+dCTJc+YhMExG2VdMfZl4qxVyr
         2p5Q==
X-Forwarded-Encrypted: i=1; AJvYcCVz2jShbSVshmP4EXhbUE+bffloqk3APXAQswfVc49+XRufM+zKbBJFG3KtO90jwHVpNHQrZzEnSSNhfVAb@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9/AVfQr/Mf70ID5292z/v4c8BFPclbCX0szr5Jew+xXuAo1ld
	p7Z67y0SmAYkiDh4eA1qB034QyeplLzdEbhxARJjr4Tk1L84aLGYgW8lm+02g8JTy2sf1vDKo8v
	9ZZPplYInwqr45uXJDRP/fARExcafgH5YOgZxMy5OpwGgVLPjSxM6M1oQX+kYAh98Dv02
X-Gm-Gg: ASbGncvdARfvgwe8b3Z5i4BQgtqIcnxhD1Z4JpUQk1kbjdOTc9Vg+tj4zBcdI/beMeV
	9Jfs/jOZyK533SHicXG7o+0J5mxA1++rwMObdBShkM3v8HsNb9rYqQcVp/P0X1le6sVU9SH5abZ
	mE2gRD6TR/Z7NSqSWgeozSlrEhJQuDKRwqaIrleS/HZLCHJnaZ+xO4Lvznkvkh7zDQbCYuq3ycr
	FPbPulR6xC7JWjsR7yzt8hve9AB57fzLWws3RF1ia7b+NaP8oCwY0ZrROZZ0vDsaD/cGc1goPnB
	ifH8u80Gh4QM7fCZXGtISQ6n8ndrVkAwsQNNhiWMDNEyyAmowJlBQg0HqTTDYHPmTXeZoRcb2i3
	6aF8yJLb9i5x/9/Y0unPqzm2rBk3R7kr0H5nd5ziR4gnerS7qSm6lhWJp
X-Received: by 2002:a05:622a:118d:b0:4e8:b634:1a1d with SMTP id d75a77b69052e-4e8b6341e2fmr58090221cf.11.1760961249524;
        Mon, 20 Oct 2025 04:54:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFrkoRTdssi+cLEdmRJ0a9TfppCSguJ/4ySe0r9bIdiNLEhlqFKb+7lyYFQTE9qy3WdUHwtVQ==
X-Received: by 2002:a05:622a:118d:b0:4e8:b634:1a1d with SMTP id d75a77b69052e-4e8b6341e2fmr58090071cf.11.1760961249059;
        Mon, 20 Oct 2025 04:54:09 -0700 (PDT)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b65eb0366casm784827966b.47.2025.10.20.04.54.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Oct 2025 04:54:08 -0700 (PDT)
Message-ID: <70ffe530-87a6-4045-a319-b7becb5831ac@oss.qualcomm.com>
Date: Mon, 20 Oct 2025 13:54:06 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 17/24] arm64: dts: qcom: glymur-crd: Avoid RTC probe
 failure
To: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250925-v3_glymur_introduction-v1-0-24b601bbecc0@oss.qualcomm.com>
 <20250925-v3_glymur_introduction-v1-17-24b601bbecc0@oss.qualcomm.com>
 <CAJKOXPdi0+c_FqinVA0gzoyqG6FVFp0jq5WSLsWWKiT12VVs3Q@mail.gmail.com>
 <CADhhZXaB310hVo_w8_CoJLQ3j9dy1eeTwbmk0q=vUV2ga1PAYA@mail.gmail.com>
 <8f81289d-7672-42e6-b841-6514607cdb38@oss.qualcomm.com>
 <20251013110407.dqpjdrdaw4gzpcy4@hu-kamalw-hyd.qualcomm.com>
 <49004d3e-7914-48ee-8705-ee86d1944166@oss.qualcomm.com>
 <20251014123658.sobt6ab6gnbafyme@hu-kamalw-hyd.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251014123658.sobt6ab6gnbafyme@hu-kamalw-hyd.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: iF-upetGjRGNskDc2IeVH3zzxLKa5Siw
X-Proofpoint-ORIG-GUID: iF-upetGjRGNskDc2IeVH3zzxLKa5Siw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAyMyBTYWx0ZWRfX6Y6C3zqNwHfA
 OyoKNH5oebiaL5We/gBC/M/Oyys+bQAHUqsvh2qPHY/Mm89N1N1QKrtTqoT2p35HVoj0OqlfTwH
 R6vudDhNOkNdqBUL9CrhEkyXFCkKdZg1TWzp9U3vA1J0N42RDoFBGlmSTuVLqmWtf3JMRD5/ftS
 i6kv95FbEoQFYJ51QMs5e/JDUYwVXsjoBL/RiDhqVyfqigKFMk/6odvZksP6l8OZuUzRRSvrztC
 q0pK4IcYi/Ffx3QyA5IWCO5OwpgcC7mibMAZzZ1qgZAC9DTv688JIJNhiKoRG96wlkn+6xznAr+
 Czi1KXlJ3ipkCFLq8PJEbuNwSs2whxp2PcAUDWe2gnnZrlTem4srHCcdmpudFLD5RMEkmzwD3a8
 rMe52uxwEXub0HZwIoSVMRYq0anNvQ==
X-Authority-Analysis: v=2.4 cv=E/vAZKdl c=1 sm=1 tr=0 ts=68f622e3 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=dw0t6H4-AAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=-vGuBvw500s2EirlLaYA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=wVJa4CU9-Z26yuRAZDil:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-20_02,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 adultscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180023

On 10/14/25 2:36 PM, Kamal Wadhwa wrote:
> Hi Konrad, 
> 
> On Tue, Oct 14, 2025 at 12:23:23PM +0200, Konrad Dybcio wrote:
>> On 10/13/25 1:04 PM, Kamal Wadhwa wrote:
>>> On Mon, Oct 06, 2025 at 04:28:59PM +0200, Konrad Dybcio wrote:
>>>> On 10/1/25 2:23 PM, Kamal Wadhwa wrote:
>>>>> Hi Krzysztof,
>>>>>
>>>>> On Thu, Sep 25, 2025 at 1:41 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>>>>>>
>>>>>> On Thu, 25 Sept 2025 at 15:34, Pankaj Patil
>>>>>> <pankaj.patil@oss.qualcomm.com> wrote:
>>>>>>>
>>>>>>> From: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
>>>>>>>
>>>>>>> On Glymur boards, the RTC alarm interrupts are routed to SOCCP
>>>>>>> subsystems and are not available to APPS. This can cause the
>>>>>>> RTC probe failure as the RTC IRQ registration will fail in
>>>>>>> probe.
>>>>>>>
>>>>>>> Fix this issue by adding `no-alarm` property in the RTC DT
>>>>>>> node. This will skip the RTC alarm irq registration and
>>>>>>> the RTC probe will return success.
>>>>>>
>>>>>>
>>>>>> This is ridiculous. You just added glymur CRD and you claim now that
>>>>>> it's broken and you need to fix it. So just fix that commit!
>>>>>
>>>>> I'm afraid, but this is an actual limitation we have for Glymur
>>>>> (compared to Kaanapali).
>>>>> The RTC is part of the pmk8850.dtsi that is common between Kaanapali and
>>>>> Glymur. On Glymur (unlike Kaanapali) the APPS processor does *not* have the RTC
>>>>> IRQ permission for the RTC peripheral.
>>>>
>>>> This is interesting.. is that a physical limitation, or some sort of
>>>> a software security policy?
>>>
>>> This is mostly a limitation for all compute targets(like Glymur). On compute
>>> targets we need to support ACPI TAD feature[1] this feature uses the RTC alarm.
>>> In a nutshell, this feature implements 2 times - AC ( adaptor power) and
>>> DC (battery power) timers, and based on active power source(AC or DC?) at the
>>> time of timer expiry device will either go for a full bootup or stay in power
>>> down.
>>>
>>> This feature is implemented on a different subsystem (SoCCP subsystem), and
>>> since the SPMI `IRQ` permissions can only be assigned to only one subsystem,
>>> so we can't use the alarms on APPS. This is why we use no-alarms DT to register
>>> RTC device without alarm-irq support.
>>>
>>> [1] TAD specification - https://uefi.org/sites/default/files/resources/ACPI_5.pdf
>>> section 9.18
>>
>> Hm, is there maybe some sort of an interface to talk to the SoCCP
>> and set the RTC as we wish, from the OS?
> 
> Yes, the developement is almost done and we have done some testing as well, but
> that kernel driver needs some more cleanup and testing before posting to
> upstream. This will be added in future.

Thank you. Like Dmitry mentioned, please leave a comment about this

Konrad

