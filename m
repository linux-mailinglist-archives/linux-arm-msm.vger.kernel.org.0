Return-Path: <linux-arm-msm+bounces-54210-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 641B1A87D0F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Apr 2025 12:09:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5BDD91886742
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Apr 2025 10:09:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59511264FB2;
	Mon, 14 Apr 2025 10:08:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="d3qSA8Sz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4212265CD3
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Apr 2025 10:08:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744625300; cv=none; b=qZPMBOuP9Z+hlQM48//NDjvVquVudy6533zyRhWn1PF+jbIdtaxuYq5T3GCnv+JQL/2KYsOn9bCOibk2AxuLqT3+TG+P5NBrkdjQxplpwTc2DwATQu17cWzFcXTBrd85rv54o4U9T2QSxYc9arX1QEhzqoLblQrKJi4e3tHEdw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744625300; c=relaxed/simple;
	bh=hI5exL8lVprwxjKyBwz1haJkb+ldoxiXow/seg0QwZI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PosJTL9s1rjJJz1ur70RO4wtYYFuzYfntZP5mUd9VR+QeS68sJpvkGf1gE+EPdBxR2DfKUrH2Mqq+nA0uEbV/Dz68cwgGB2UKzSVQKXNJAb4PeKOWUFoWiFLfiLyhNQ9tCSWGZ+y7royVCTP6u884hIRK2guHbi79q0k2SBrY7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d3qSA8Sz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53E99obW031332
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Apr 2025 10:08:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iAPOu8FTHZQiUawy5teQOSK8iVJhCxgNvfNjhCFVeS8=; b=d3qSA8SzB23MwR0Z
	kugFKL/fCG92rdQklMzld68n3xq07ZCHMjKFg3VeF6lcQsVxozg3RVfoEwp2IDSG
	k9Qi1/2NoCiTqJfHgGGhNziDLVA0N+aKI4CH0AeyKwKXsIv7qnyQySBDSV1XN+vq
	0lld2uAkOkcE9V4fSgs7cZWqkFK+PvPXtVjKhLh57fY265TJnjU5LzstR+ec6DH7
	CXtFFD/fdEIAYbLiYxuuDJGQv2OQCh5KS+CsAKvTuI7MNRDDph9dndyRtgTWV4ia
	nETdspqGFOA7Vp7Vs/PFbEXTBjWY1z1JAD4bFdmgePRVQ3NyeR3nvhyqEzCDOoBW
	p0pSTg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ygxjv260-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Apr 2025 10:08:17 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6e8f3c21043so9037706d6.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Apr 2025 03:08:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744625296; x=1745230096;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iAPOu8FTHZQiUawy5teQOSK8iVJhCxgNvfNjhCFVeS8=;
        b=UdPPCrkh4cBIMvlLeKEnUBvg2++GszYg1RljoqW33IdK4qvYTRklwVehsJgQeM4GNk
         lpgwOkJrBMvPaaYXPYSP+OkajSl1VYnyUXFzvIkKWJw95ra3vHXRvw7EwRK4wCxRvDf3
         cenDZTBHnCt14bIGMWvIQu8gr7uwpPKDUqAbZYkNP/1uaH9uNAuVOve1f07KXFLiYcbM
         MGAtjPHcB0naYFVpVWtVwiD+gJqAVogida9ZvBDwvZlAPsLrzJMYKVcfydCpN4TucBjR
         gBcLxOX2qOL3z5/ZNDbzMNBeyzTg64j6yGCOX5D+za3fdT5GYhYvz8FX4MA7Tkb5oNaW
         A99Q==
X-Forwarded-Encrypted: i=1; AJvYcCV4/dHdYdeHOF/5EshKCS1NG/A29jOjVWYQ2Bhc+Hv9K0OfYAUVjIKjaVN0Ajm2ohYOYx5l9mZcxU9D+2Cm@vger.kernel.org
X-Gm-Message-State: AOJu0YyKtQjxQ5Z6WfdMtraY4W2xISorhJ25r5+IKIPpwBP06dHDjPYL
	SzdJ5JRodi3Lc5PD+Wg0MK01/CO220Uyj489WhGJR6BrSv1j/niXo54mXq2UpQV6LvBYOKQ+FaZ
	wY0h61kt56HnYHSuUuxBum81UtNUJVaQlY+vCSZnIpEXADpMXyLvuSiMT6YuNc4kM
X-Gm-Gg: ASbGncvBaFjprzhtg4QndRYn06KuEqsVm7UKKIDx4FKjRYNuJDpC7v7jOhdr6LPJn7W
	dp8LGE5cz0OxpawqatOGTLUk3w+07fuAQ58zthwDyDmqGVKEEzgvedmJDduowD83YYVPpO6yr7Z
	CNL8W5mtMYwPwCB9n9gBrYL1QVvVSd3pmDFeJ7FMhzyKPrIU45Ssnu83NYUug3mfKKCjvBS9oDn
	owZXLo1y4HhlS+CKCr5qrM5WydBJX7GaLPhh8X1z6PR/wG88BELNirmdKqwKdxrnstsxNKpRMHi
	hbNWFMXgk3Ok+5IJMM80BBuRR8m6S2yQx+nBXvFApEO5eVF5XwRMHx44y2hupfmVfw==
X-Received: by 2002:a05:620a:d8a:b0:7c5:6fee:1634 with SMTP id af79cd13be357-7c7af0c1fc0mr640416785a.3.1744625296285;
        Mon, 14 Apr 2025 03:08:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFkIZWUYjPc9DMV0+IzC+9l1y0nHMActJ4TmxNbh2ot2IBhc4gOyrgI/EtejUkizlU/wxPYNA==
X-Received: by 2002:a05:620a:d8a:b0:7c5:6fee:1634 with SMTP id af79cd13be357-7c7af0c1fc0mr640415285a.3.1744625295827;
        Mon, 14 Apr 2025 03:08:15 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1ccd69asm872424966b.159.2025.04.14.03.08.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Apr 2025 03:08:15 -0700 (PDT)
Message-ID: <518663e1-8bed-46b6-95dd-142b98e567b3@oss.qualcomm.com>
Date: Mon, 14 Apr 2025 12:08:12 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/3] i3c: master: Add Qualcomm I3C controller driver
To: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        alexandre.belloni@bootlin.com, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, jarkko.nikula@linux.intel.com,
        linux-i3c@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: andersson@kernel.org, konradybcio@kernel.org
References: <20250411113516.87958-1-quic_msavaliy@quicinc.com>
 <20250411113516.87958-3-quic_msavaliy@quicinc.com>
 <a1e85e39-4be6-4793-aee4-d990e1e46bdb@oss.qualcomm.com>
 <bca32a29-23c7-446f-9307-cc36d3f1ee44@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <bca32a29-23c7-446f-9307-cc36d3f1ee44@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=WecMa1hX c=1 sm=1 tr=0 ts=67fcde91 cx=c_pps a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=sL-q8L-RPyKcODZA9a4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: RmTPVFZGrRx_t9GM-o45igrTKuX1_Uuw
X-Proofpoint-ORIG-GUID: RmTPVFZGrRx_t9GM-o45igrTKuX1_Uuw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-14_03,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 suspectscore=0
 adultscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0 mlxscore=0
 impostorscore=0 mlxlogscore=830 spamscore=0 malwarescore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504140073

On 4/14/25 10:53 AM, Mukesh Kumar Savaliya wrote:
> Hi Konrad, responding to one comment which is not working as suggested by you.
> 
> On 4/12/2025 4:45 AM, Konrad Dybcio wrote:
>> On 4/11/25 1:35 PM, Mukesh Kumar Savaliya wrote:
>>> Add support for the Qualcomm I3C controller driver, which implements
>>> I3C master functionality as defined in the MIPI Alliance Specification
>>> for I3C, Version 1.0.
>>>
>>> This driver supports master role in SDR mode.
>>>
>>> Unlike some other I3C master controllers, this implementation
>>> does not support In-Band Interrupts (IBI) and Hot-join requests.
>>>
>>> Signed-off-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
>>> ---

[...]

>>> +    if ((m_stat &
>>> +        (M_RX_FIFO_WATERMARK_EN | M_RX_FIFO_LAST_EN)) &&
>>> +        !gi3c->cur_is_write && gi3c->cur_buf) {
>>
>> The indentation here is confusing, please align the `(M_RX..` with `m_stat &`
> I have tried to implement this, but always giving me warning as below.
> Tried many ways, but same issue, hence keeping it like this.
> In fact, earlier also i faced same issue hence i wrote it this way.
> 
> CHECK: Alignment should match open parenthesis
> #468: FILE: drivers/i3c/master/i3c-qcom-geni.c:405:
> +       if ((m_stat & (M_RX_FIFO_WATERMARK_EN | M_RX_FIFO_LAST_EN)) &&


Maybe let's define something like

bool hw_pending_read = m_stat & M_RX...

Konrad

