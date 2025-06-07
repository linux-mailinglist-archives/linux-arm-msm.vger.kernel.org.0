Return-Path: <linux-arm-msm+bounces-60501-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D68DEAD0AE9
	for <lists+linux-arm-msm@lfdr.de>; Sat,  7 Jun 2025 04:08:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 225327A3B63
	for <lists+linux-arm-msm@lfdr.de>; Sat,  7 Jun 2025 02:07:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7C65258CEC;
	Sat,  7 Jun 2025 02:08:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Sg/iHtzg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52AE02580F3
	for <linux-arm-msm@vger.kernel.org>; Sat,  7 Jun 2025 02:08:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749262126; cv=none; b=l2yXPhEa0b+YurS1P/22egs9xNtUGqkX4aEaqptWqy/M5avTcNpJm75EB7zAUl1Yj1wN6dpEEge/uMPggwtfdzdiwIhJ3jq3fUtUVcugwuHITD8YwC0bxSvo0TwUU4f78mURW0ptmhHIzzPHYuUDy+qGGywtCkrIB0l60kVvas0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749262126; c=relaxed/simple;
	bh=1wPBp9mn1Yt2Yh31Y1H6YFb0Bxf1nyDWQ8/uWhDjpd4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kRmmjtpqTzqNs8XamIPcDDSDpJt7y3rUsBrjsTIG//awdnYR61+x1Vyi7f/46FSgV5Pcr1mQWTSsQysBMzcVceK8Tv3yeAALfjPL0boIkr8/5/g7p4vHIr47tKWAkZO08izjz9Dsrqe5uh5PCqj4iDu5jWxFZgCFoSelNvpQisw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Sg/iHtzg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 556F9EX7026238
	for <linux-arm-msm@vger.kernel.org>; Sat, 7 Jun 2025 02:08:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4d2TUqwOZCp8hCOyVsn5//7lj8HaxFyUEfEqmF7yDXY=; b=Sg/iHtzgqBxeA4HR
	+CvW+2ghX5pOzyDtIrPBEdn/PuJCNKM3CcnuD0jHhxipR9aw9pMP8FfS1Nl8btlu
	KQTDq8YKIa9o2l4hDmpO46avS0ZibebYNS6H3eJ8fLUUjcMpNSZ9EqODTb3792DX
	jYZZ5DxxyNa83xtrRccp6jdFO1Wej/TdS43JiyGibu4VKcqE3KBDP1C1ZyJ5B2SR
	Xjz4bsGK7iIIj2heJOODS1XbHsPddzsrC7jyr88DdunJjy8/yB7V7xZQSkIPhqn1
	iBEAtsoPU6X9D8UMQ++NmngjKj+EymnjCxYcdfFeywL7m2Q1zYX/lFrbMqpRtAoC
	wfjX2A==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 472mn08cc4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 07 Jun 2025 02:08:41 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7d09bc05b77so425438985a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Jun 2025 19:08:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749262121; x=1749866921;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4d2TUqwOZCp8hCOyVsn5//7lj8HaxFyUEfEqmF7yDXY=;
        b=fqhq1pOAmQK+O+UU7NB0yD7sxRAjKQxZrvRyLRhTDAmqyFRdzVLQlaMsHwIccHyx/R
         dDHkzS0om61RIeY17zhhPQGfQSEA7O62jjuNc7KJka01nnGFrH6l4BsElIRZEy0zHA3g
         7BvMIjzSO05YwUG9dZl2ufx9yKSKKCZ8dYXK3bzcARa76zr/qDfbamPQsjHz+EzAg8Pb
         syGNxeT9m3PcFmw/CoUJOyaceTrj7N3fLwt5FLSKfKTn7Ce0Ioq9nmIh55olmsepodZS
         9XK43Nty0AKp1V3dSoGKJhGrnGR4VM5F5OTD9L02F5DSZnpJEg6PGh+pH/YjjZbe6IIV
         ogwA==
X-Forwarded-Encrypted: i=1; AJvYcCUWscUKp6G3OL6OotD6vUUG03sJVVjo1LDGwK8U9xpzffGlVSwUEk56BZMlgGz8WQiskpdTPUokfmmk0V5u@vger.kernel.org
X-Gm-Message-State: AOJu0Yyqe25FJUqdI1uw14uAs7agp38ZqXkWZoKAD6+ZhX5WhA1FTTAH
	/gNr5bdbOrz3Wmfqqv9D7d15ax0/LIjtGMKcR5UJQ8oOE+RzAQ545GJCfzIgHSvMml+vMTpNeMm
	TEvJ44slL0l9e1+KsR3nq35+HrOP41Bo1KDwhLxhYdSgmuI7ko4mLLkuwj103m+B5jc6I
X-Gm-Gg: ASbGncvoNRRYq2EE5a5DWpTl6MFFnvrgwHPkHZhQ5UUItntS4UjwNYbFc8RM0mbpEK2
	pr1Ny4p41CZrFjLATY0/k5VIuqQFEp+/1dOYlWvB27iLRuifEJSrEJXCJ9RIaAzVoFwLeVCQObx
	j99OklHsL8UO5svUjRHr6Ir5tzcvUx1Kotn0J/ikLTg1Sb/YgNs9t3CyVc86e2I2qFjO2Jogv9M
	kzgmmeQMibfqD3k08x18ktumtRRLDlqY0Fx0ONBZb0wk4B59ttDYfSLpwU92YmLICec97sUAUr5
	A26dtElZ1Zr4e7S7JWepRBxWNOZSQTX4kF8U/8ddiW9fa8VJBZax9/Wo2aJL/XI7+5qu+8Xn1YD
	dQny1WfPiYhPP3yImEK71GbXa
X-Received: by 2002:a05:620a:2408:b0:7ce:bddd:7119 with SMTP id af79cd13be357-7d2299329bdmr812225385a.51.1749262121038;
        Fri, 06 Jun 2025 19:08:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEz7nZzHZFUC4z+SxHCj3/apQ8BIw5H1t8RfplWUNiwQy336iHPVr/nvIPtH3vtjLYLC4dchQ==
X-Received: by 2002:a05:620a:2408:b0:7ce:bddd:7119 with SMTP id af79cd13be357-7d2299329bdmr812222385a.51.1749262120660;
        Fri, 06 Jun 2025 19:08:40 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0c3:3a00::4c9? (2001-14ba-a0c3-3a00--4c9.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::4c9])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553677316d6sm352047e87.206.2025.06.06.19.08.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Jun 2025 19:08:38 -0700 (PDT)
Message-ID: <5d4c51b9-f4a4-46ee-a8ab-d523fa7292eb@oss.qualcomm.com>
Date: Sat, 7 Jun 2025 05:08:36 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 0/3] media: venus: enable venus on qcs615
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Renjiang Han <quic_renjiang@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
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
 <t6niql4jfotjnbducypwxkdjqt3or7k3rwmltvbhifmpphsiwy@er56ey4v2pzo>
 <a3bf69f3-6500-4e45-ba34-8ba24312938a@kernel.org>
 <CAO9ioeWkLu+ne18kjEST7YU7b1aBzcMBBeyfpagzis99BAeOHg@mail.gmail.com>
 <b710e357-09e3-460e-b097-28cf0c856aeb@kernel.org>
 <44b3779b-702c-4e8b-8ccd-c9c3314a511f@linaro.org>
 <3956eeef-2a60-4bfb-908e-5e3e32970b86@quicinc.com>
 <e18bdd88-3866-4aef-8873-b9b67f0cb9b7@quicinc.com>
 <85533e92-43bb-40dd-a8d5-13d19e859616@kernel.org>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <85533e92-43bb-40dd-a8d5-13d19e859616@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: kOEhGVTa2lGmoXuaT6iXgPIaKwYh0iVP
X-Proofpoint-GUID: kOEhGVTa2lGmoXuaT6iXgPIaKwYh0iVP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA3MDAxNCBTYWx0ZWRfX8l+Hbsn9DSrV
 1j2drhRDuluDeFPl8TQ+IgKq9KIWbzbzm53pAcEdNnlzLgu8ZHWSEnMx9J+1QiPF483Q+wK2LjN
 Dy0cbVtZLM40L5gMdrhZxv94MjGavPMfV6knqXl6iC7Bmciayru7AYOrfBHI+qlvs3lKwKOwsRe
 JxfisPqgTxHMLr+WJcsIzFL+ujcLTZaygLktmBxZ3PcopXDJ7Wb+/IqUdxytjLFTsg0y3pwTuIg
 izbtXueHKDFYoJJw2R3W1CdZEJ1IZ9SSvz4k60dJpK6cZ29BoCuYVlXTBj5Pf+iPKmO5lomkmY1
 6o6gwfPpEF9fAtDfGA9JfKKIQDH4jIqxH5gR8NhD1drcw5IeDPia7mH2GoO1CKQsWE3O6U7qDB2
 6gpWNt3mvlnFRHJ21HXOaF2nwKmfyuDg01dAYUp/TnW9o0xLEz0ChIdmhHcRO7lVY3p6AwCk
X-Authority-Analysis: v=2.4 cv=Y8/4sgeN c=1 sm=1 tr=0 ts=68439f29 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6IFa9wvqVegA:10 a=_IlkK9eLdjtuzbIfdvoA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-07_01,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 lowpriorityscore=0 mlxlogscore=999 spamscore=0 phishscore=0
 clxscore=1015 impostorscore=0 bulkscore=0 suspectscore=0 priorityscore=1501
 malwarescore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506070014

On 06/06/2025 08:54, Krzysztof Kozlowski wrote:
> On 06/06/2025 09:51, Renjiang Han wrote:
>>>>
>>>> Reading this thread, I don't think that is the case.
>>>>
>>>> I don't see how patches 2/3 or 3/3 depend on 1/3.
>>>>
>>>> The frequency table is a fallback in the driver and the DT changes
>>>> are completely straight forward.
>>>>
>>>> TBH, I think we are hitting an email comms/social barrier here, not a
>>>> technical one.
>>>>
>>>> @Renjiang can you please confirm that freq_table is a fallback,
>>>> qcs615 will work without OPP table and the DTS stuff doesn't depend
>>>> on the driver.
>>> yes, freq_table is a fallback. driver will use freq_table without OPP
>>> table. the DTS doesn't depend on the driver.
>> To correct my previous response:
>> For this project, the driver patch needs to be merged first. Since it
>> falls back to SC7180, but their frequencies are different which is
>> reflected in the OPP table defined in the DTS.
>>
>> The DTS patch is intended to enable video function on the QCS615 platform.
>>
>> The driver patch is to switch from using the driver freq_table to the
>> OPP table from the DTS. Without it, the driver will continue to use the
>> internal freq_table as before.
>>
>> Therefore, if the DTS patch is applied without the driver patch, the video
>> function will be enabled on the QCS615 platform, but the driver will use
>> the SC7180 frequency table, which can lead to an overclocking issue.
> 
> This means devices are not really compatible and DTS is not correct.

The devices are compatible: all programming interface is the same. 
Having the freq table in the driver is an error.


-- 
With best wishes
Dmitry

