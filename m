Return-Path: <linux-arm-msm+bounces-62767-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 907FAAEB774
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Jun 2025 14:16:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4ECD31C24E64
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Jun 2025 12:16:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F3311F4608;
	Fri, 27 Jun 2025 12:16:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oyrw6Tuy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F32492F1FC3
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Jun 2025 12:16:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751026581; cv=none; b=aR7YpOyJsSnkILZ6HCEIBMCFXWVBXT8N8zIPV1O09snfcBB43uWPi/6Pb5CVteo1hVUBHo24635XC07DhSkAQshOK+Af7humuomPUu8hqliL9JTfAsZWZ3kUqYvGXniM/LzFqhk7foorU8vjO/mBXpBL76ILmNV0+OfYVDpLNLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751026581; c=relaxed/simple;
	bh=/xFnVyAzk16zZpIqNtiCHChTJBM1y49oYqwHRM0PMcY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LQK/xG9HsW/ebWLtyD3hCPMdLS2d1/HFYyq1z1vMNkSTBNA3Z8O9lCaBzCKxWjppx/WSn0Lj3dx3f7kecjHUXBftfen1xOSvtUVd10S54kuo4M+gYMXgScpDFr6aMfGbuJVTNDIkceyYCY3xhRhMxnPA2hKq/VPMrM/XNX8MV20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oyrw6Tuy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55RCAvSA014870
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Jun 2025 12:16:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lU0WIMQMpWLmZZYn9MfMQsBWefoG4LKIkwcYF1KthQY=; b=oyrw6TuyD/2F9rjn
	0CCVlmlfrnQCU189qrbmshgZk8Evy4cEdRj7jn0Ks2qro3lT1hviFeV3tjJv0M50
	OEWpQ3LrhHI94PB86OXB4pQu0+5WmY5akDCUBYlfQyiD6wOnuvud1GD13H6uchvK
	w/+ksdtmJzKtyQq2n/ftB6F+48PzevpT7MllQtQT9J+o2MNTGBhfp7ZmfvLiZee5
	1kA3L7OYMbi8EyfP94nNFoAEigRWhbW6L1eWw6w+oU8xdTi7P9H4arGtdcWG2HD2
	5pE6Vn9oTtDfbv+vXnacwTCs7zA++YE3882sRpeYHtD8+cuFIXFIDAqd9NAFLtOj
	7McuJw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47emcn0jj0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Jun 2025 12:16:19 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7d3cbf784acso474486785a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Jun 2025 05:16:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751026578; x=1751631378;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lU0WIMQMpWLmZZYn9MfMQsBWefoG4LKIkwcYF1KthQY=;
        b=hRVtcrH08SJbgj7bToWv0RXa/zvqz8piu/GOKodhmPysprgrZ2V81FIbPKzRKeTPia
         eJLgr1COWWGXQSsS0rzSiMs4krqicoSdDDZr42IXpEwz0NZcanHZDQR5Rs6k4e7/6aqK
         RMNc9Mllqx40h1jKIbvy8LLdiG4xkE57lIe4HcIVxoTenulrSVC+MESCKEllltJPCxIm
         zEU5OjRs/STS9fADko+fpyvVX0idat4slrUQ/tS1P4XGB1a1YmweP2mRb8KstTWGdI32
         RhFFh5/WHMscE6EtbJ6QEhJvD5ngPOLGP9fTGUomnpo9hxw/x++ijgiMNLPWrK/gViig
         /iNw==
X-Forwarded-Encrypted: i=1; AJvYcCV4+Shj1NipjpEYSkPI7Iz3mA+q6zqQ4YaSynYugzDM6HzQFc1/q1zTHvNgzIw8x0T5PnLtwQR5NA8FVqXK@vger.kernel.org
X-Gm-Message-State: AOJu0YwCHcrRd4J2UJvF5K2p1NTqr0XmWYef3375LeyUfMgFajSKoK6X
	pt1EUnz2oGTOobZ6qdv+ITbzMxtJihUWZG9fm60I1KlSNfDM2dlaAbh/j2VlAUeOORBb/+hGqN5
	Or4X/eIRq7/EVwxgVFvVtIhm/BWceVoaz9FN+04Oq7bthSQbp3ocsfs1rIcvAHAge+ODG
X-Gm-Gg: ASbGncuzFDOHQYBeJrsmBJkbebcxqlgu6+E+eR9pjmQVq+nB+AVY0kXAfJeW3n3bqlV
	fYZ1qFfb8KiuRiMBfCI6C4i+qndHGtYn7vzJcYRVdyl+4Is9V2+086014uVe6JQkst3flSv/+F0
	hh5UQ7zPCKb3ed/HF0/IhwQ8JD4sLZP3ri7OlHuzr3klOinjtuiAlE16rdkJbC/MrM5OyYW7t/G
	DIZgtEPGoatnKNB+dbg0wd+pjl1XKHQ5pbBNcaqVrH5U2MrNcAewRc54qtIJ6cQDSyD2oCAAmwa
	mvWigMB9w5EABkHE2M6vn8BXmO1tMrtwVxGoz9CPWXZuYOMX
X-Received: by 2002:a05:620a:470a:b0:7d3:c381:f653 with SMTP id af79cd13be357-7d4439b8895mr471214085a.56.1751026577492;
        Fri, 27 Jun 2025 05:16:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEUE6WsBFESfsW2EmUTOcwR3CqmOd/OTjwz/cqEShKqDwwXxfASft7QAm8ulgo8Q1dlk+4uww==
X-Received: by 2002:a05:620a:470a:b0:7d3:c381:f653 with SMTP id af79cd13be357-7d4439b8895mr471208685a.56.1751026577083;
        Fri, 27 Jun 2025 05:16:17 -0700 (PDT)
Received: from [192.168.68.113] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3a892e6214fsm2565424f8f.98.2025.06.27.05.16.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Jun 2025 05:16:16 -0700 (PDT)
Message-ID: <c609cafa-5970-4694-9b6e-b5536df72eb7@oss.qualcomm.com>
Date: Fri, 27 Jun 2025 13:16:15 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] arm64: dts: qcom: sc7280: Add memory region for
 audiopd
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Ling Xu <quic_lxu5@quicinc.com>, cros-qcom-dts-watchers@chromium.org,
        andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        ekansh.gupta@oss.qualcomm.com
References: <20250516110029.1637270-1-quic_lxu5@quicinc.com>
 <20250516110029.1637270-2-quic_lxu5@quicinc.com>
 <uzyxagnmxz5tsjy32mfro2alwdpcq5kybwzcbsysul7u6adgdf@x7katw7eme6u>
 <b90ee18a-5e88-4c36-a623-ae9447c53a46@quicinc.com>
 <2mu3bncxoq57rxi22dyd6ys2wa5n3wmtadfvixozshxgenutai@dlkbqgplzrrd>
 <46caa88e-790b-4733-83bc-75ed6c7ca2d8@quicinc.com>
 <CAO9ioeVoqQhDhBW_fVU8kkt=3trV9YhEDUO0izdf8cuCDqU4Tw@mail.gmail.com>
 <76071cc9-b052-4628-9890-239b0acd260f@oss.qualcomm.com>
 <fd2vic3g5jjk22y7yv24mtwr27ies2my5lih3zfj6yw4zd2obo@artndh3vepbb>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <fd2vic3g5jjk22y7yv24mtwr27ies2my5lih3zfj6yw4zd2obo@artndh3vepbb>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: ceA-BAagpflLlJI0lIWyE4DQc5XPv_cR
X-Proofpoint-ORIG-GUID: ceA-BAagpflLlJI0lIWyE4DQc5XPv_cR
X-Authority-Analysis: v=2.4 cv=J+eq7BnS c=1 sm=1 tr=0 ts=685e8b93 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=COk6AnOGAAAA:8 a=BHjmFTkj5n41xVJOCs4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI3MDEwMSBTYWx0ZWRfX7hMgdASrNYwe
 TWX95k69faW6RsVsO10n+HX8U2xOaeFBZxGvhDHyGJMdzlOVAG61TPZzf8lQVXmnC6GYNkDivl7
 K4ljG993ue3YUCPDALYqEeVN9kaTWrOL8OQ20csuOdn4CAoQP+xX+deD6cOoZeh+4e4IJK9DSS3
 Ke14JkJSKqiWAGJ0w/GbBwzGx7RJzzu/nVKZOwEu4brzBGEE+0CiohsymIwpn57ERvYBvJb45xV
 PRt9roqQVufs6Ld8Zq4HBZxiwOuWVDvkqOwT+Yv0zyzJT4YM7RsCK5LENalMaQcN8ATj+GGx13c
 lD6J4Iphgcm/nrVFzHAmr9XZpAzKZ15fFfMZ34GKHqlaaJvIe5F97nQ3gkUIzn+uCBVyNYmUOnu
 uLekTZCsP9MZ5exZCsk+uLwSDrqwPdxhbZ7YINkxJT2ZFryj0X+uGlYylrUN3jVpiQAEKz9/
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_04,2025-06-26_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxlogscore=865 adultscore=0 impostorscore=0 clxscore=1015
 spamscore=0 malwarescore=0 phishscore=0 priorityscore=1501 suspectscore=0
 mlxscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506270101

On 5/22/25 7:51 PM, Dmitry Baryshkov wrote:
> On Thu, May 22, 2025 at 08:27:40PM +0200, Konrad Dybcio wrote:
>> On 5/22/25 2:16 PM, Dmitry Baryshkov wrote:
>>> On Thu, 22 May 2025 at 13:44, Ling Xu <quic_lxu5@quicinc.com> wrote:
>>>>
>>>> 在 5/20/2025 9:53 PM, Dmitry Baryshkov 写道:
>>>>> On Tue, May 20, 2025 at 02:41:22PM +0800, Ling Xu wrote:
>>>>>> 在 5/17/2025 5:47 AM, Dmitry Baryshkov 写道:
>>>>>>> On Fri, May 16, 2025 at 04:30:27PM +0530, Ling Xu wrote:
>>>>>>>> Add reserved memory region and VMIDs for audio PD dynamic loading and
>>>>>>>> remote heap memory requirements.
>>>>>>>
>>>>>>> Why? Was it not working without this heap?
>>>>>>
>>>>>> yes, it will not working without this heap.
>>>>>> Memory region is required for audio PD for dynamic loading and remote heap memory
>>>>>> requirements. For more info, please refer below patches, it has provided a more
>>>>>> detailed explanation.
>>>>>> https://lore.kernel.org/all/bb68da04-ef52-4172-8b6e-f4027bcc2786@oss.qualcomm.com/
>>>>>> https://lore.kernel.org/all/effea02f-6ffb-42e9-87df-081caafab728@oss.qualcomm.com/
>>>>>
>>>>> This triggers a bunch of questions:
>>>>>
>>>>> - What is audio PD?
>>>>>
>>>> Audio PD is a protection domain which is running on DSP for audio
>>>> specific processing.
>>>>> - Is it a required component?
>>>> yes. it is needed wherever there is some audio use cases where
>>>> DSP audio PD dynamic loading is needed.
>>>
>>> Which use cases?
>>>

Usecase is for audio compress offload, ex: when we play mp3 or any other
compress format, we need audio pd support.



thanks,
Srini
>>>>> - For which platforms ?
>>>>>
>>>> For platforms that require dynamic loading of DSP audio PD.
>>>
>>> Please be more specific, we are not playing a guessing game here.
>>>
>>>>> - What happens if there is a memory region, but it is not used by the
>>>>>   driver (SM8650, SM8550).
>>>>>
>>>> It won't be used.
>>>
>>> So, what happens? DSP crash? system reboot? blue smoke coming from the SoC?
>>>
>>> I'm asking all those questions to understand:
>>> - whether this is applicable to previous SC7280 platforms or just RB3Gen2 / IDP
>>> - whether this needs to be backported or not
>>> - whether a similar fix should be applied to other platforms.
>>
>> I wouldn't worry about FP5 too much (albeit it's apparently not easy
>> to test it out and even having spent some time trying to, I couldn't
>> figure out how these things connect), but the chromebooks may be
>> potentially problematic. That said, we can overwrite it in sc7280-chrome
>> if necessary
> 
> What about NothingPhone?
> 


