Return-Path: <linux-arm-msm+bounces-54028-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 03E6BA85E06
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Apr 2025 15:01:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 10C2B168640
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Apr 2025 12:56:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D386C2367BC;
	Fri, 11 Apr 2025 12:56:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iARYEuE1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BEBD2367A9
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Apr 2025 12:56:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744376191; cv=none; b=ocAPHtBMj79Lcq/KdtF4vXuFnTyd6vMxuir1v0K8pYhA53MtLeHqPDSbRQKytY4E/8ujMbaLyO1yrOyT7mMc5GwQOVEYqvqWh4QtBMD5s84DiNnV2LGz67+MW/5LoBy9pPirDPrPswLq5t8RdJi5iznmCY1U45+tfqx/P52Xmbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744376191; c=relaxed/simple;
	bh=Sfy8MjMMU+57mHRwvKz65SKNaOSwioFjv8LNdhjshMQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZNcA4JDcEu0URWCeZlVLx7Uhp3U2gvL0VOki1rgfOv/S5xbZriCsSQTpwORsfGKZIQf13gMiXhYzSIR8nrh1Mmt8Fm26+dXEX3HuJ4a6gcswM0wv2RyR+DyhjD1A3dt8eRsbFrp9EUrJzBjImw9kgcceFhjJ+2t5UXEXcFV5jY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iARYEuE1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53B6JiJn013937
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Apr 2025 12:56:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CMvxg5D4cmEiDoMOwRUc1Nn+M/99Mlhq5+0RDjA73no=; b=iARYEuE1NWygdwH6
	UKWKY3z7djZ5qarxVEM3NZg7vw7a8PUC5MIF4rrs21Ati++mdCQwhhBTa1eO/A6+
	uHp8Yl9cEUqwqlVoNRWEvh2PllK2DSr0Y99jz5tijGKGR/E+lINvDOldn/8+PaNA
	72Lo57tzAUyRTfQGAwEe3NB+RKDK4CWjFwxPTSwCXKz2hzvcklVjU8C15GAQgPv6
	7BDkBlSGn2lsDYp3AjujfQFjh3QrGvUQic4EwrbVuv3a2ZdwDZiGp8OtUugnZXoS
	/BHJvudYAlREQzTpYfCCtgl+ozuAT0HGM3cBpfRFSDB+1jG0wM4PTCwNVJdMXj/i
	3KjKxg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twbejfva-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Apr 2025 12:56:29 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-73720b253fcso1574432b3a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Apr 2025 05:56:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744376188; x=1744980988;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CMvxg5D4cmEiDoMOwRUc1Nn+M/99Mlhq5+0RDjA73no=;
        b=bK5Z810B53o6uvfPWJSMflgZewoLs5YeIXZN5Nw2WHaKATdYVTkV48HnfWQ0FXT/5s
         FhKvlyiD0rp+G8T3s8cwaiixfycLXkt1TfMkpefHYLfThMeYFDcpbvPQl6FcOhepvubO
         stqYraVtG1nPNh1fg4+ILp2SBHi9Zd/9PQHsFEJ97cQwiFoI1ZgVdnKP/aDx7RVUov+S
         8cDQsNw8SP01o3TeBWtJmiShFcpqI56tEUVRnwKXbyYFZdBgkTJwihJEmtYIUFrGazaN
         5V/Ypfgkib/M0Si7g/PhfXu63qV/TqiPBx7R9wYCFUezzAJYFKtOuMGOs7QEv33SNA6R
         4seA==
X-Forwarded-Encrypted: i=1; AJvYcCX30OiToHwN7P/dHBBUBpsf8V0MFC8gVzAofGwAZSLlGoUO2tE4s+MjPbhjHj+mdOFSDB9yv4BpZqighj6W@vger.kernel.org
X-Gm-Message-State: AOJu0YwW0ALVSfJJv7ODsAyep56s1DnJ2cOv4QDa6/AxpALoUMhqDgON
	PStEhgGPJ9pxiT3SqbKiBIS+JcbnEpWTsn1AR3R6hUkXpvUqlpVvOPTgtLjrTPW11T5nxiuF5W9
	iJ+56HtY5vn6jZmjAGB6iK1s3cfHK/oo25Kgq2BQVpv4o5bBXYvWjsE20e/PLqcSz
X-Gm-Gg: ASbGncuLD1WLK4rIzmhrrd1PDMoWZgefQqgAUYlOnXUy1K+VMOM7HTrYY4BGic+GMC2
	ZgfE+8z9cYwKVgKTeLuMHEEoC05tM8rSFiGzSteJR0qXaf8Q1Z0V4yXwMLUbrbP5X2vP3TyYp2u
	as/Z5pQp/8ceJsvOHG5Oih8cMnoc2CvQF7kz9YZViETWmSBh8zOM39zb890JrS/qvq9MakFboZ+
	fcgoNCX+XidBtwyOhs0u3WKKPxk4RyNNIkRjNlXyyKP1AYJLJywiaXzJ0x4NSEp1xfqUdSgSRDT
	ynTuqrcufwFBI8Yw5MAYipMe4i/NOIC03g/obfsvSIThzc3GeMxz
X-Received: by 2002:a05:6a21:3281:b0:1f5:889c:3cdb with SMTP id adf61e73a8af0-20179787801mr4522243637.8.1744376188252;
        Fri, 11 Apr 2025 05:56:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGzqIKT2YA5sP6Tn3NINcpTsJ5x6Bui+ZmBQb0oUO6uDlCc9CZJV9wpDBiw/Mrmpl1rkjrz5A==
X-Received: by 2002:a05:6a21:3281:b0:1f5:889c:3cdb with SMTP id adf61e73a8af0-20179787801mr4522201637.8.1744376187801;
        Fri, 11 Apr 2025 05:56:27 -0700 (PDT)
Received: from [192.168.1.2] ([122.164.81.245])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b02a0cf374asm4611147a12.26.2025.04.11.05.56.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Apr 2025 05:56:27 -0700 (PDT)
Message-ID: <74c9c5c2-6195-4c32-ad34-a3889de0ea53@oss.qualcomm.com>
Date: Fri, 11 Apr 2025 18:26:23 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] phy: qcom-qusb2: Update the phy settings for IPQ5424
Content-Language: en-US
To: Vinod Koul <vkoul@kernel.org>
Cc: Kishon Vijay Abraham I <kishon@kernel.org>,
        Varadarajan Narayanan <quic_varada@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250407-revert_hs_phy_settings-v1-1-ec94e316ea19@oss.qualcomm.com>
 <Z/i+6k6VseihdQ69@vaman>
 <734cf70a-1d96-4a87-bc7e-c070c1e7dc8c@oss.qualcomm.com>
 <Z/j+fs6hCVhGKLcH@vaman>
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
In-Reply-To: <Z/j+fs6hCVhGKLcH@vaman>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 3JfrBtI20O0VtgqJUXj5aJ7GOqH50ys3
X-Authority-Analysis: v=2.4 cv=T7OMT+KQ c=1 sm=1 tr=0 ts=67f9117d cx=c_pps a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=uB/6cedsP4G8bgUXdgZ7XA==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=rZc7fG3luCRD_x8UD3oA:9 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: 3JfrBtI20O0VtgqJUXj5aJ7GOqH50ys3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-11_04,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 mlxlogscore=879 lowpriorityscore=0 adultscore=0 phishscore=0 bulkscore=0
 mlxscore=0 malwarescore=0 suspectscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504110083


On 4/11/2025 5:05 PM, Vinod Koul wrote:
> On 11-04-25, 14:29, Kathiravan Thirumoorthy wrote:
>> On 4/11/2025 12:34 PM, Vinod Koul wrote:
>>> On 07-04-25, 19:51, Kathiravan Thirumoorthy wrote:
>>>> Update the phy settings for IPQ5424 to meet compliance requirements.
>>> Can you specify which requirements are these?
>> The eye diagram (Host High-speed Signal Quality) tests are failed with the
>> current settings. So design team asked to revert.
> That would be good to mention in changelog.. am sure you wont recall 6
> months down the line, which requirement this triggered the change!


Sure, let me mention in the commit message. And yes, as of now, all the 
compliance requirements are met.


>
>>>> The current settings do not meet the requirements, and the design team
>>>> has requested to use the settings used for IPQ6018.
>>>>
>>>> Revert the commit 9c56a1de296e ("phy: qcom-qusb2: add QUSB2 support for
>>>> IPQ5424") and reuse the IPQ6018 settings.
>>> Why not do revert first and then add the settings?
>>
>> I thought of submitting it separately. But what-if only the first patch
>> merged and second one didn't due to some issue, it will break the USB
>> feature. So, I thought it would be better to keep it in single commit.
>> Please let me know, I can send V2 with 2 patches with the merging strategy
>> (both patches should go together to avoid the USB breakage) in cover letter.
> Series is applied together and you can mention the dependency on cover
> letter

Sure, will send V2 accordingly.


