Return-Path: <linux-arm-msm+bounces-60823-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A978AD3AD0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Jun 2025 16:13:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1D847189C4C8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Jun 2025 14:12:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EAD8B2D1920;
	Tue, 10 Jun 2025 14:09:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XBIx6CtN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F486228C8D
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jun 2025 14:09:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749564566; cv=none; b=VhGDkqrQs+WuEWsfIzz6OsI9xFO5k4ONz1yGI4zX1xnuZYyTNwGlKWdaAxr/nD4HjrpZ5BIWzEjQ/apXNjOb2zCxKdVLW6gSJVKqDkJjf+lTry+vuulkbTL/j1a8+h7UPZOPP9S7FL1kZl6Ea2k4NUP1eafG5pcf59QdQXbj9pk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749564566; c=relaxed/simple;
	bh=64oL1IuUL6LDShJrW7z+kKTXElQQl4FAWK8vmLE6BNg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=F5k9VB6q4D9IYOy1p3uOifAf0Af9fSIdZBssfDzRAMdop3CEOsKEJy3jukF8w//wcrY59IiBJqHY80wr0txy7IK6dFrUmKN1eEsUDHPeGBQ3OMHXOhXwKlmmnMqOTqGdyphlKSzhDG4qqUpQnjY/ikSgDgmk2+mXD4AgABL+Xhc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XBIx6CtN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55A9RwHU005324
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jun 2025 14:09:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gP4Jd0wZuukS80MSwtMl4EeLp4f+KtIALdhGXarYaPU=; b=XBIx6CtNaZzvB0WU
	a6Jyu2bBHjsjyam2qsljk1cGYDp644pMzaMwezxnE80cCmN2AduJtDXRYv8JlN3d
	sanK5mMNYey47Fqu6Fun4HV5HL39fM2tNcGMVw+/5xlKEfMPCQhxm74xutYPbjNk
	XaEpffomlc94SLryZ8Sgxw5dAuy0uEoiayVkyTL3DLwitAVhSp9g3FsK8BEQzr55
	2WDTdwu/va8MPQfarXvqzRC6cJ/Pv55DOcA+yKixkpExrBoeubw/VjaYwPhI6HKM
	HFNSWPnH5yaVGejWAFrw+7/alL5b6Zvab9F5NB2G+/VG43n2h4cEOh+c7fsifZKv
	p/+c5A==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474ekpsdac-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jun 2025 14:09:23 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4a517ff0ebdso15650551cf.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jun 2025 07:09:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749564562; x=1750169362;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gP4Jd0wZuukS80MSwtMl4EeLp4f+KtIALdhGXarYaPU=;
        b=t+m3pNkZNKjZ8ldnSQRcxUxB3iMEUC/9Za6bWKGmkewfkAGeyryAY9Kha52/afB8+/
         XBguD1T9N+rpvHXieEBqfRIVocGMQaraszhN1vZro4A8VY5L1w0jU7xMZsEYKXhHGLB1
         D3qhBk2+5M9GVcbD2FZDIhDcCMwuNJZ0HXuXSzZXaLzLHfRQFyyKC92IZUZV8uGOAL7H
         fWVZ4Qu7mH+dGSqbfGo9w7alvXPlqpevbEnQ+DVit1sUsSzgamOsxnUvZ0bClpA8h43t
         ZiJtstFdq1vScmFXlumTL2vpX36YMhlUWi4N6rmFuLEo4GVC6eblGJ6NBpeLO1CYjtak
         /9ow==
X-Gm-Message-State: AOJu0Yy1CdFTBhmZXrRk0Z3rgTfTj0PbqY+SL9+HgJC0uvhZdB6mBF+0
	tLQkw/DgCyinjyDzhjC4ynsZ6V9ytrZAVMgcle0O8w9VFoEs71k8WNHJpgQpfzejzNwmkMgOOhv
	kluX2g496oTrmZujADbAK42nZVvCBLwPGh0qPPRzxXUWKUmiqNl60C0QiIF715tMKmInz
X-Gm-Gg: ASbGncsgMPcMYFHvyMEV+wODlHV/9IEMHU0TAp1W8wnkyExL7SHGGVm7ILky3noPVGX
	HKQt7X/EUCvpolOueIp/OmorjdH3GdgTsIrPDwDE/udg1TSJn6m3BxR7kDqdZKlcAYw0rJhG83U
	Akx4D0GaDTiOi+MmuhBehrfntpH4x2yODTsysQZQbysl0uWrdhOVI203vqh7xe2Ng9zrmP3i8/2
	4ATh8/gC2o9NlAhIlCvLyPxIR8RyJahRiPnYe4qx25CV5qfnICQx5PSicvIaWn35dxBfCDMTZ19
	5LO012bTrIWY9tfBBcKifa8S5PCUxbKuHfppWKGiwoNW7U6YAElT2bK5mL/XKwkf3nX2O6mNDRj
	O
X-Received: by 2002:a05:620a:294a:b0:7d0:aafe:dd6 with SMTP id af79cd13be357-7d331c11a81mr969896885a.1.1749564561939;
        Tue, 10 Jun 2025 07:09:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IERgZgp2y5pYp48AInVGbjIfwav55zx9yDpitn4roraA79eZtpYgR9Fcxn3XP8O4dbac3evfg==
X-Received: by 2002:a05:620a:294a:b0:7d0:aafe:dd6 with SMTP id af79cd13be357-7d331c11a81mr969893985a.1.1749564561524;
        Tue, 10 Jun 2025 07:09:21 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ade1dc7e770sm729541666b.183.2025.06.10.07.09.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Jun 2025 07:09:21 -0700 (PDT)
Message-ID: <73e2881f-b899-45a4-a59e-47593283b63b@oss.qualcomm.com>
Date: Tue, 10 Jun 2025 16:09:18 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10] arm64: dts: qcom: ipq5018: Add tsens node
To: George Moussalem <george.moussalem@outlook.com>,
        Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sricharan Ramabadhran <quic_srichara@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>
References: <20250610-ipq5018-tsens-v10-1-3a10a5a2642c@outlook.com>
 <f123294b-b944-4723-bd74-713970468d51@oss.qualcomm.com>
 <DS7PR19MB8883BEBE4168DD1682F858749D6AA@DS7PR19MB8883.namprd19.prod.outlook.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <DS7PR19MB8883BEBE4168DD1682F858749D6AA@DS7PR19MB8883.namprd19.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=JcO8rVKV c=1 sm=1 tr=0 ts=68483c93 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8 a=KKAkSRfTAAAA:8
 a=UqCG9HQmAAAA:8 a=E6Ly0PRcfj7wCC4qtTcA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEwMDEwOSBTYWx0ZWRfX1I1Dk5OQNlDD
 RvBdCCmeoh4PGFD5bsMD4JYSSPhhleVCdiEiQcCRscHw1DZlNAUqhR1PX2ZETPZ0LEVV4S237M2
 /gSE1OV7eGteZw4Ni+MLcw7dMzuCxL7ZKvyvUNRMu0efqVLOybTifTvdSvnXQV2au+ZT63WSfun
 VHFBC/+8AK5MwU2/VtfirXq8uelgFYl0lIT6PNeE5EWq2TIFlvzUryTVVC+CC4vGIwsBNVw2kol
 HKxRra3HVO/ajhohMsGqR7I8DjqG101UK75J0q1jqwAKOivwyQZb+YFKprMJi0Zew3GTBqe7Efu
 FJXZr/sri/z8IgV4MiORU2RSX3NX7gkN3wmnLmL8zSorMFX7zSPxCPYWvhDKQ40g9ZVqYia8yqi
 laJZYD74wANzeNH2yDhi1pOWykzN6VZhYWQ28UXYuubVwmyPGQmHg30fEsSH5jyWsE0HZk3W
X-Proofpoint-GUID: SmNvf_uGmtPPY41KrxJvzy7QhM6TbHrf
X-Proofpoint-ORIG-GUID: SmNvf_uGmtPPY41KrxJvzy7QhM6TbHrf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-10_05,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 bulkscore=0 spamscore=0 impostorscore=0 phishscore=0
 priorityscore=1501 mlxscore=0 adultscore=0 clxscore=1015 malwarescore=0
 suspectscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506100109

On 6/10/25 4:06 PM, George Moussalem wrote:
> 
> 
> On 6/10/25 17:08, Konrad Dybcio wrote:
>> On 6/10/25 3:03 PM, George Moussalem via B4 Relay wrote:
>>> From: Sricharan Ramabadhran <quic_srichara@quicinc.com>
>>>
>>> IPQ5018 has tsens V1.0 IP with 5 sensors, though 4 are in use.
>>> There is no RPM, so tsens has to be manually enabled. Adding the tsens
>>> and nvmem nodes and adding 4 thermal sensors (zones). With the
>>> critical temperature being 120'C and action is to reboot.
>>>
>>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>> Signed-off-by: Sricharan Ramabadhran <quic_srichara@quicinc.com>
>>> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
>>> ---

[...]

>>> +        gephy-thermal {
>>> +            polling-delay-passive = <0>;
>>> +            polling-delay = <0>;
>>> +            thermal-sensors = <&tsens 4>;
>>> +
>>> +            trips {
>>> +                gephy-critical {
>>> +                    temperature = <120000>;
>>
>> I'm not sure whether there's any firmware/hardware measure to shut
>> down these beforehand. It's better to have a software trip at 120C
>> than to not have any at all, but you may want to try and find a
>> case_therm or so thermistor for your devices..
> 
> these are the temps as defined for the critical trips by qcom. IPQ8074 has the temp set at 110C, while IPQ6018 even higher at 125C.
> They've also defined lower temp trips in the downstream DTS files.
> Should I try and add those? I could check if the driver supports them..

you can register the CPUs as a cooling device and add some sort of a
trip point (see e.g. ipq6018.dtsi)

Konrad

