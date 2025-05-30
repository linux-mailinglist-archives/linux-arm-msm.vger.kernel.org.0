Return-Path: <linux-arm-msm+bounces-59879-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DA7FFAC8C82
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 May 2025 12:56:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A77E91892763
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 May 2025 10:57:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D351E224B09;
	Fri, 30 May 2025 10:56:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kZRVEeIj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BD86223DF5
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 May 2025 10:56:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748602612; cv=none; b=pVVZ0xkJrnki/FRn4AYllWSYqBVBP4LuDfJjPfQSVSTwCGNOd1KWK2+W/G8aiNzQmF1lnsbdhgZ0lNWLpXZuVECWvMpO3znbs+YpsLcJMsfkhiO5uxm/dgIf6F6mHVgZaEOg2np2tctyvY7q8tFDdd4nOsgel9w1pTdhDUBJJuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748602612; c=relaxed/simple;
	bh=wXzNltEAfvd2Z9TuqPjRTjSk3qvDN5IHyR2ohzs6boE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lBgvvQ2KzcpfpMNsOeQqOMkUGMyZcWQu76+E9CTDM2xkCF0l74DFFyFLZlLIRgRH9mQEb+zPzvpyedlO1RfVtGO3w93uQA8qewJ6ENmPvX1sTYWRNO39ZJGke5Watdq16ByiRewBO3r4cfsc/vzsf2FSxNyfp6YIJ3F92RyK70A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kZRVEeIj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54U102eG005033
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 May 2025 10:56:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	odW9Gnbh0pAigIu977/CYjbuP4cZbGddXolCkSLXzHI=; b=kZRVEeIjcFr+g/o2
	H7opx7uDuqhRJhyu3p9dKmR3VsPNX2SDDngRwAy4PjXS2Kny+Bbf6LwhzObSjFO7
	bbex/gcsQN7IWlPObXnT64+6u5Hyzxvst3C3zVCOTk36cCys9SuEpec+NW/f8kPH
	kr0jXKFwvI4LN+djLvmlXOuP/C1faSFbBu6iApc2MqPMflDnwerCyhn1oAzD5CHw
	/CkkIdGXRtTJfCxfZq5eJgHXcM+f/z7CvymjPTrXOvHBmd/QZS3JYdH+7JOeiYxC
	QdmULlmPJKse2D1ChjNTmO0NcNAn7xTURhiMSPTymdFklTmJJsp8e05H//IKrP3/
	8bJJ4w==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u5ek8j28-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 May 2025 10:56:50 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c5841ae28eso43871085a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 May 2025 03:56:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748602609; x=1749207409;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=odW9Gnbh0pAigIu977/CYjbuP4cZbGddXolCkSLXzHI=;
        b=BlZ4imQ5zV3b82TkxjBIlPOpliDRF6HEW0mYRSZddEnubuHMjsAychJRyNWzITxSr0
         QUPsX0DFOwdZ4kapexifvyVk84Jm6PEcXZe0jBcPhW3X9KlDFSHWuGpA1+x/yp/Fgvi1
         wyWJein7oDb1bCEbL+f1C+whL76p4j7xIhl72CyluaDrzEnrQfusV2jzSgGJpV/+poPe
         KLvYuHF3NPlPmctd1mNQnPR0FKZGpdEbHosjS7Y6q1gJrXIcUtLE5h8PhNcPmeP352Rz
         mt8GQrPdwUbFnd/Lmufoq5SEGza8gXXeUAMBhtBnT4fqfQcn0M1LNiYRu+UmaJ9/qhh6
         /YBA==
X-Forwarded-Encrypted: i=1; AJvYcCXI2ToQ9mBP00FNRvRbKsC/olpHTmEGCKcJbwgzPAAf8TsSNi5ghkBuixRph2y/hbxnoMzci2ivnKyj8ks0@vger.kernel.org
X-Gm-Message-State: AOJu0YxyMEe3BQxz7auuy4RX1ExFAJYASF8XUSl9M3cvSJk8ra9eNI+X
	uC1nkyG7jfESYgazbUWh/AIUhT0zDo/CLD4Tw60oOKgJqlDmL21/BL4wcW7wrcbtO0OUCrb8cxz
	/+vzoTCwSVq9pfATftbHiqaNBs++kDJ1IQltflaxExSiokn7Ikg29wFpDZZC19/MSs6G1
X-Gm-Gg: ASbGncvhBJYXXUTGTkyAQam8d12VpyLEJYRJlv04P7rpCXKQzgVpg+7fF43leEDc/B2
	zGNcB2ZyQxkROI7tmla+xs9MWdZGNjZKRpxeSwc1FAik0sGL2XFAuwibWwhIIGuL/U09d0UGlUv
	hwJ+iyN6Lc69y5sbh6147JigJ1BpHc/gM+ZMqPc1SloymgVr29IrrL5csFzhHyhbn/3ON2XKloe
	Fh6AF9u1Usxd+A7zCs2X1xAdP9cbV4bE+KKnz/Sf/rlQN5HyPQuXJSpmoF6w9suJzJ+uiLxYRSy
	O37Oj6qeXAbH0y0FsCLBCXjRz+owaZiRCCtQueESnI3cvsbesUJyIxiDcKJwxfHUww==
X-Received: by 2002:a05:620a:22cb:b0:7d0:a873:41b6 with SMTP id af79cd13be357-7d0a87341eemr23248885a.13.1748602609025;
        Fri, 30 May 2025 03:56:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFVhwGo6eIBUc8NIPWCq/VAYr79CpNK6ZT1bJU+Fx1YS9w2pL/7LMaola04s9DtuAsRXHuuOQ==
X-Received: by 2002:a05:620a:22cb:b0:7d0:a873:41b6 with SMTP id af79cd13be357-7d0a87341eemr23247285a.13.1748602608611;
        Fri, 30 May 2025 03:56:48 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ada5d84f2bcsm306618166b.83.2025.05.30.03.56.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 May 2025 03:56:47 -0700 (PDT)
Message-ID: <8972adb4-b6ae-4ea9-986a-32e59fe84c50@oss.qualcomm.com>
Date: Fri, 30 May 2025 12:56:44 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] arm64: dts: qcom: sa8775p: Remove max link speed
 property for PCIe EP
To: Mrinmay Sarkar <mrinmay.sarkar@oss.qualcomm.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, krishna.chundru@oss.qualcomm.com,
        quic_vbadigan@quicinc.com, quic_nayiluri@quicinc.com,
        quic_ramkri@quicinc.com, quic_nitegupt@quicinc.com,
        Mrinmay Sarkar <quic_msarkar@quicinc.com>
References: <20250525-update_phy-v3-0-5b315cd39993@quicinc.com>
 <20250525-update_phy-v3-2-5b315cd39993@quicinc.com>
 <mcmpmaapzv3vbiynlrp6sijdjvj6a5j3dxzoixz6b4cxqsvbsl@ecljexn3zg2e>
 <0aef1687-0158-4d7e-8e3d-b6eafc38d049@oss.qualcomm.com>
 <CAMyL0qPd2HRv4nr2C9=5SgzSkuKO_1cfZbOUO2aUj3vPWnmJbA@mail.gmail.com>
 <41ac26a6-7a5a-4c11-b05c-9ce688ad1856@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <41ac26a6-7a5a-4c11-b05c-9ce688ad1856@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=GIgIEvNK c=1 sm=1 tr=0 ts=68398ef2 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=ra-v6aFW90cMH64V2wwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: UyZT04zmo3E7aoepNaihfZr8rbisSToy
X-Proofpoint-GUID: UyZT04zmo3E7aoepNaihfZr8rbisSToy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTMwMDA5NCBTYWx0ZWRfX2KlXeIhr9jTB
 XXMVnAfe4TC+LSx3dFR1VE5xb0VwP1367kQv9MnjMdX14MaWLrsII/YDxdWShbhdBpZ/Juhyh4J
 xQrieCq3QR8aGlcwMcBnSaPnBIO5xrcKUBh057T0GtvGQOk3yX/n/eptAhSpDeoxbco3DARAy/S
 pP9Czk0G3ykI1gAbzx7RINc34apmS6armvuGTuGklA5UqbN9DYqW7dc70SYuR7PyRyhTfRtWRbh
 OtyATYrcd/y5dZY1pEQwKI2x14cj3OG1uWYoR3x0kpUGJZKCzKXdQSFjZTrRMBT6YoUxv9F2w69
 wju3Fm2X5FCTQZfGLXQEmSjEPULyajJBJPpYSRThcjjcN0kPn9c7NqK+mjvaHLEAwnR9vlkwwlU
 am9u5et+q5y0Ipl5q5+Wc6XGkKJMNx/ChqyFXRK4979l5heOJz1OF5Vr6Y9NKCIchfZEgBZs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-30_04,2025-05-29_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 adultscore=0 priorityscore=1501 mlxscore=0 phishscore=0 spamscore=0
 suspectscore=0 mlxlogscore=883 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505300094

On 5/30/25 12:50 PM, Konrad Dybcio wrote:
> On 5/30/25 7:38 AM, Mrinmay Sarkar wrote:
>> On Tue, May 27, 2025 at 4:06 PM Konrad Dybcio
>> <konrad.dybcio@oss.qualcomm.com> wrote:
>>>
>>> On 5/25/25 3:29 PM, Dmitry Baryshkov wrote:
>>>> On Sun, May 25, 2025 at 11:27:18AM +0530, Mrinmay Sarkar wrote:
>>>>> From: Mrinmay Sarkar <mrinmay.sarkar@oss.qualcomm.com>
>>>>>
>>>>> The maximum link speed was previously restricted to Gen3 due to the
>>>>> absence of Gen4 equalization support in the driver.
>>>>>
>>>>> Add change to remove max link speed property, Since Gen4 equalization
>>>>> support has already been added into the driver.
>>>>
>>>> As Gen4 equalization is already supported by the XYZ driver remove the
>>>> max-link-speed property.
>>>>
>>>> "Add change to remove" is a bit clumsy.
>>>
>>> I'm more worried about this node not having these gen4 eq settings
>>> (i.e. the part talking about driver support landing is true, but it's
>>> unused without the presets being explicitly defined in eq-presets-16gts)
>>>
>>> Konrad
>>
>> Hi Konrad,
>>
>> Actually stability issue was resolved by this patch series:
>> https://lore.kernel.org/linux-pci/20240911-pci-qcom-gen4-stability-v7-3-743f5c1fd027@linaro.org/
>> and I don't think we need to define eq-presets-16gts for this.
> 
> Okay, so there's multiple parts to it..
> 
> I was referring to this series
> 
> https://lore.kernel.org/all/20250328-preset_v6-v9-0-22cfa0490518@oss.qualcomm.com/
> 
> Please check if you need this as well

If not, we can get this merged as-is

Konrad

