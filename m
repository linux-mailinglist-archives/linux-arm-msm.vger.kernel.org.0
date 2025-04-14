Return-Path: <linux-arm-msm+bounces-54195-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 88441A87BB4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Apr 2025 11:18:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B2CEE1890B06
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Apr 2025 09:18:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 808BD263889;
	Mon, 14 Apr 2025 09:18:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IVhNOIRC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6B9D25F97A
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Apr 2025 09:18:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744622288; cv=none; b=DeaMzL+Ux2hvpmF568/LHA62TYTlnbHmc7QYllI50Qe1se1dOT8C/g9TFU98Truv8FkkdolIS6twtkEtBD+oYaMPk4oGwNEfYcIduV2tHmGuMmnhN4LJqVXqP82MAgC5SiIOHCClCAkwqFr4WUvIAFA6zBhalO3sq3lzc0VaUEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744622288; c=relaxed/simple;
	bh=b8gcyIitXwq9zfPGj1TTyeB6iiYH/NPcTALQqB5eb88=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=U2niEJ+5fyOMDg4nvsCaZQFMVET8qPGnOFX+WOcGkOoxaXdBnTJUgRvb/vwCjC5G+Zwca6OF90Lw+ZgRnZSY3c5vgdFyqcwc5XoAuhQi3dKEbx88cwfFJGe957nbJWMzKRT7il3lLOmEWFH9fpEFRcUnH/P4oNt8u5Hin9ilSxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IVhNOIRC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53E99pxt016522
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Apr 2025 09:18:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9n6fUwx7dsdIHqmGM9lTq0LMxBs5RvxrZgMfBBeiHZw=; b=IVhNOIRCd08r00/4
	Xq1isB6u2/D2jXogCcMM9qAiKSwQHsiU2fEq7dqq6A8oz7sP6iMEjW5kSEyXbX3Z
	1KrJjn5sBGMmr7QoVGRdji+qi6c/hOQ7nro/EHopuFstrTVVJTWG0Foh/Iy8JN9/
	Hd2FKJs6kZCy1V42LvA6TjzLMB9abrdm34/+mI3hyvfgbs3TtD1/5/8HgV3jeRaF
	sqC9qOD6vVDvoG5Alf5gFK+/HFHO3nGlaQ9DBthp4fL+roPuhH+oh32m4mISWf2D
	KHpa/HQDNcQ8a2C7amplFyrG7m7P/cdhwY77OSYEp5jTuPPezBmqLikd8zf9Zs+y
	ilXYVQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yf69m2ad-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Apr 2025 09:18:04 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6ecf6a05e9dso1613086d6.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Apr 2025 02:18:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744622283; x=1745227083;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9n6fUwx7dsdIHqmGM9lTq0LMxBs5RvxrZgMfBBeiHZw=;
        b=eX7h/zuS8zdN3IZMdCK5BPpnnZABHdTsGNVY3epRvI+lOT7b703mWqFsjZtc8s6BQE
         ecbhHepBPm0EaXl3VCyblxwHop8hGCQa1s7l2Wp2erUJgrSd/H4ELWfA6IBLX67knGof
         8ePbLuTpAAnoRxolUjOebej+YtCZCk1rf5aTlBt2tBRawCGKjWAthlthaOurl/JDbt5N
         kMpw8a3Kz6AROfqsRgkeML/1lnYc+9q9eZ5HkeThM6bXcYXQI7S2kQtFYwKqWSsAhJn/
         /e00A8JQB8WjrEnRTJSAldujmSX3x19WEEfpIQ/FHwGpxxoD0cDe/S21tJD6SeIPOMNy
         YdZA==
X-Forwarded-Encrypted: i=1; AJvYcCXYCqygKROOHi0fi31Taz/Qd/LVKc+GbCz+Xmu4BqC3GgFAxd7MJ+Crl3MY4H+j8AOkLAGtEcn7rLeq3Is0@vger.kernel.org
X-Gm-Message-State: AOJu0YwHNdMDdo7M9aL4JM0ZFRrFje6RQsYs5lSEgnN6kFT7baqVMLjo
	ZEkiA9R04t2o5XIK5DMdOE+F1mbg+iQEinis3KX4aSktWo8j+F/WmdUHdF5xYjGLh/nQ4K5rJ7B
	19A6J2k7fbWXbuSlTEFCDYvkWkqZI2r1tFQcfjx71MvcudsRtptLcFU5mZFcu1LeS
X-Gm-Gg: ASbGncsC9n4PXAIs6q3zDFLJe/wx9+GMKeUQ0T1boZLX2k/ShPnrL3ncGHGMdw1vzX1
	m3eZoxYCJvLUuEyW/htghf7d9HFQA0Rl9KEwQXUyQndYEE9tSiUocUmSrxQ/+ZlscOo5tfQgY6N
	4PcyeRKRLXOOxlRAD1t6o05kgQzYzBqd0Yw4ApuF4cDmqCr0yffNQYfkt/+lwe6Rp2wNbb3mrkg
	X70QWromZpWH1W0A6axrDqZN84xtBXHj2Q6DRIyQ6/EVRHWdkBMgzlpI3FgreURBkO2/DLECw4G
	qkAZaENADg3vnZ5Qwnd0EMYMFrWCMPTw/G+kMtXapVArhboI6upqL6rPpXtY/NHaDQ==
X-Received: by 2002:a05:6214:627:b0:6e4:29f8:1e9e with SMTP id 6a1803df08f44-6f223228651mr69610146d6.0.1744622283487;
        Mon, 14 Apr 2025 02:18:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFluLUS0n50qcCegrTq8Pm42HzMF5shZXnI+wDunODqc0e6WM8+H5gnO9csrzFiy43bwKo2CQ==
X-Received: by 2002:a05:6214:627:b0:6e4:29f8:1e9e with SMTP id 6a1803df08f44-6f223228651mr69610026d6.0.1744622283016;
        Mon, 14 Apr 2025 02:18:03 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1be9152sm860014966b.42.2025.04.14.02.18.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Apr 2025 02:18:02 -0700 (PDT)
Message-ID: <04ed2ec1-9393-4d02-b7c8-54d6b0aecabc@oss.qualcomm.com>
Date: Mon, 14 Apr 2025 11:18:00 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/3] Add Qualcomm i3c controller driver support
To: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        alexandre.belloni@bootlin.com, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, jarkko.nikula@linux.intel.com,
        linux-i3c@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: andersson@kernel.org, konradybcio@kernel.org
References: <20250411113516.87958-1-quic_msavaliy@quicinc.com>
 <eb6e8452-db37-47f7-9265-fd47d4cb69b8@oss.qualcomm.com>
 <84c07b53-a564-4c71-b172-676303700314@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <84c07b53-a564-4c71-b172-676303700314@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: EBZ85hZiJt43cTjFxfKytBvL1IzlZIdx
X-Authority-Analysis: v=2.4 cv=JNc7s9Kb c=1 sm=1 tr=0 ts=67fcd2cc cx=c_pps a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=Nc8cXWw94qvZg0M5jZYA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: EBZ85hZiJt43cTjFxfKytBvL1IzlZIdx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-14_02,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 malwarescore=0
 suspectscore=0 mlxlogscore=999 lowpriorityscore=0 bulkscore=0
 impostorscore=0 clxscore=1015 phishscore=0 adultscore=0 priorityscore=1501
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504140067

On 4/13/25 9:28 AM, Mukesh Kumar Savaliya wrote:
> 
> 
> On 4/12/2025 4:50 AM, Konrad Dybcio wrote:
>> On 4/11/25 1:35 PM, Mukesh Kumar Savaliya wrote:
>>> This patchset adds i3c controller support for the qualcomm's QUPV3 based
>>> Serial engine (SE) hardware controller.
>>>
>>> The I3C SE(Serial Engine) controller implements I3C master functionality
>>> as defined in the MIPI Specifications for I3C, Version 1.0.
>>>
>>> This patchset was tested on Kailua SM8550 MTP device and data transfer
>>> has been tested in I3C SDR mode.
>>>
>>> Features tested and supported :
>>>    Standard CCC commands.
>>>    I3C SDR mode private transfers in PIO mode.
>>>    I2C transfers in PIO mode.
>>>
>>> Signed-off-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
>>> ----
>>> Link to V3: https://lore.kernel.org/lkml/20250403134644.3935983-1-quic_msavaliy@quicinc.com/T/
>>> v3->v4:
>>>   - Dropped "clock-names" property from dt-bindings as suggested by krzysztof.
>>>   - Makefile: Correct order sequence for i3c-qcom-geni.c.
>>>   - Indentation corrected around print statement.
>>>   - geni_i3c_probe() : Exit with return 0 instead of ret for success.
>>>   - Added sparse annotations around i3c_geni_runtime_get_mutex_lock()/_unlock().
>>
>> So this is the third time I got this revision in my inbox, previous were
>> <20250410084813.3594436-1-quic_msavaliy@quicinc.com> 10.04
>> <20250331164648.2321899-1-quic_msavaliy@quicinc.com> 31.03
>>
>> b4 should be automatically upticking the revision counter, please don't mess
>> with it manually
> Sorry Konrad, i could not understand what's the problem or what you are trying to say.
> 
> Do you suspect something (Which i didnt get) is seen as manually changed ?

Yes, normally each 'b4 send' upticks the revision counter, but here we got
a couple submissions all with v4

Konrad

