Return-Path: <linux-arm-msm+bounces-52500-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C844A71066
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Mar 2025 07:09:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 177E51884B34
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Mar 2025 06:09:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F17617A2F3;
	Wed, 26 Mar 2025 06:08:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CwYiwTXk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A57819A288
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Mar 2025 06:08:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742969293; cv=none; b=K1LoQNRf8BekLcz0OKfVNrTokrWq3u5mfTI3dMTyh9PPsQ6W8i0AR+PBklKXwAQ0qMr9y4p/F4sfuMJACgeOC2hVkRdLV3dlO1XNlTOa7Jsnpu/FxHnwmxt4ZUcrOtQMixbLPFHFqieowpW/D/eo+ojl6bQ9DPvN2D+7jx842l4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742969293; c=relaxed/simple;
	bh=DV8Dt4NQTcwtQhBu3ee6ir786TfXKELwP+K9zh18GmM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MkZMZ/w6f8SZZfAai7azwzN8IG240NswaNTlaiKHyo1I0XffYIBbkfY9zxRxxTd4f8UF5jbJPsFkIoVigH+a88u84OUH0zuWTPq5Zr9gBFwOlWIiJPnOy5uWr+/icONFmflbpnin14xImS27wxuoLMMML+DHT/lNnQWe0l4JBPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CwYiwTXk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52Q64G7T026608
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Mar 2025 06:08:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bs6P/y7OnnXl9wA9mcNU5vvj6Yur2Xri8LkAGJTa6fQ=; b=CwYiwTXkeMQo8M39
	2AWWOe8cSAhLOrKuostRhfIBPzVEn8sObh8qKBh8FepDOpWAK2LeyfvOlTHAV2PN
	0Ydl7bsIOJUkW/xSS0muvx1EM8WpAWJlHy/brDdDSV24DH9cHVLjIL26pLerQwx7
	r1b2EsEzyXahnp/lLb2Edt7jP317SIUld0NjS5OUdSphhBU/ZvAcvFgShidFLwGr
	iVm6zuSBClBNAbF85e0tHyvhheg4gLawUrPHXmKSluev39VLy9xZNUbTrrMTgpQi
	g28TdNq7AH6qyfv5uR/CmCzRGMISifCRJRfd+GaGTOSr+sx3JA+oOsFcd5CY+dh6
	FFzjFA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45kmcybudn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Mar 2025 06:08:10 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-2ff68033070so10429636a91.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Mar 2025 23:08:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742969289; x=1743574089;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bs6P/y7OnnXl9wA9mcNU5vvj6Yur2Xri8LkAGJTa6fQ=;
        b=LOX3QBv6DPHPHG8boms1WGARg2EPmh4dHZRwYUjHIbZD3h51z7YP4AItpOKrx5QaKZ
         GBjcjFI/7ASv9C80lzGM/6YKwUfbGVJBiZqaFNRnwFBWW2NkilFZvC0BJ+O7etsxzkh7
         Pe7PbF9aXB0AGxYev0Ig7hD5c0IBsX1IA3ZSowLx/+wrWENUtpfjL+JLUaOKSSswbfe7
         AQMHd9JQwSBarFh9qEMo+yiZ8tRmecgykxQFj5NVNboYwZhPJDk5/QMJt3BOGjgg0Wql
         l27Ru/3Vhrt33ue3roMjMUmIvdyH5AkKdjm3r1HLHq1HSrwBkIMlBl4ZnT6ooa8YrZ3D
         WFqg==
X-Forwarded-Encrypted: i=1; AJvYcCUCtMpBe490oSSUYrULUn05z0LdRi568zCMvhHZ2ankTD1x3g142rhJwpK91VPsBlNkUHygwpT6N3LirXmB@vger.kernel.org
X-Gm-Message-State: AOJu0YzDKQSevhhTBqN/9DGFHAZ28ddpY0RRaEyVo+IWixPIGVq2FGbq
	byEdkiUGMaeGTu+pV0r/wAAKiOZn8Q+7OAgrUuVYtNPMQyBkqhUMNHObPY+9iV5OkFiM3t7Ufce
	QbTLSfJCOM+isDS0zTXHc2OY8C6+XzOAesV4ZdkuJWIiepf6NABJlbf3SO7LWHSfa
X-Gm-Gg: ASbGncssOR1pMioj/c/mWNfCxXSetU6FfoN30YHYvNyE9HcV3CKdlrBFjuy6CoOy/AN
	rddSksx7woNMOduPYLZ8ZqGP0KpUx86Fg/jsaBAkK34YyQT5EUMqgpiuXzheep3awGOsq+X/xEO
	OzbQDKlB4ee8dV+Ev1L1xaeGPA8zNx5ALLrLEWX17rzw47bIwe4f4X/squYRwyHjbyFn/+Scu5/
	8u4YdOYwop7o2gULxYLJzUeZfalDPwi0OL8c0d/we9xDYsY1rVXTCI60p8gkfS1tzZ1wyomd9UB
	98kjlNUSY5uUUg+oGWcQFxTrz+2yPJgivbQw/nGi
X-Received: by 2002:a05:6a21:33a5:b0:1f5:882e:60f with SMTP id adf61e73a8af0-1fe42f2da7cmr26905143637.17.1742969289519;
        Tue, 25 Mar 2025 23:08:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFSUcFYBXOOAqPpsEodlNU/8h9WWE4B5xscY9kxh7baPG6T5AYHq6bhQtT/uMIVHhhESqO7RA==
X-Received: by 2002:a05:6a21:33a5:b0:1f5:882e:60f with SMTP id adf61e73a8af0-1fe42f2da7cmr26905106637.17.1742969289107;
        Tue, 25 Mar 2025 23:08:09 -0700 (PDT)
Received: from [10.218.35.239] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af8a2a4747bsm10102367a12.68.2025.03.25.23.08.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Mar 2025 23:08:08 -0700 (PDT)
Message-ID: <45d1dbc5-bf6e-4fe8-bf2e-0d517190fc8f@oss.qualcomm.com>
Date: Wed, 26 Mar 2025 11:38:04 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 0/5] Add snps,dis_u3_susphy_quirk for some QC targets
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250325123019.597976-1-prashanth.k@oss.qualcomm.com>
 <ee0848ea-7a06-4f4e-9115-5e3c0ab8bf95@oss.qualcomm.com>
 <7029a455-47be-475d-b429-98031d227653@oss.qualcomm.com>
 <db0bbc62-ecf2-4f72-a0c9-462fbaadebc4@oss.qualcomm.com>
 <5k45tcntn2bhxqt35quzfm2dsq6eug3hgqdcrta25oy47zuqja@4jclvspwob5x>
Content-Language: en-US
From: Prashanth K <prashanth.k@oss.qualcomm.com>
In-Reply-To: <5k45tcntn2bhxqt35quzfm2dsq6eug3hgqdcrta25oy47zuqja@4jclvspwob5x>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=EZ3IQOmC c=1 sm=1 tr=0 ts=67e399ca cx=c_pps a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=xMnwRdS-aKneeMBeM7YA:9
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: XV_AgZIC-i6TOCNaJWLxuL1Jn4_aA2B8
X-Proofpoint-GUID: XV_AgZIC-i6TOCNaJWLxuL1Jn4_aA2B8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-25_10,2025-03-26_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 impostorscore=0 malwarescore=0 priorityscore=1501 mlxlogscore=999
 spamscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0 phishscore=0
 adultscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503260035



On 26-03-25 03:40 am, Bjorn Andersson wrote:
> On Tue, Mar 25, 2025 at 05:31:28PM +0100, Konrad Dybcio wrote:
>> On 3/25/25 4:01 PM, Prashanth K wrote:
>>>
>>>
>>> On 25-03-25 08:11 pm, Konrad Dybcio wrote:
>>>> On 3/25/25 1:30 PM, Prashanth K wrote:
>>>>> During device mode initialization on certain QC targets, before the
>>>>> runstop bit is set, sometimes it's observed that the GEVNTADR{LO/HI}
>>>>> register write fails. As a result, GEVTADDR registers are still 0x0.
>>>>> Upon setting runstop bit, DWC3 controller attempts to write the new
>>>>> events to address 0x0, causing an SMMU fault and system crash. More
>>>>> info about the crash at [1].
>>>>>
>>>>> This was initially observed on SM8450 and later reported on few
>>>>> other targets as well. As suggested by Qualcomm HW team, clearing
>>>>> the GUSB3PIPECTL.SUSPHY bit resolves the issue by preventing register
>>>>> write failures. Address this by setting the snps,dis_u3_susphy_quirk
>>>>> to keep the GUSB3PIPECTL.SUSPHY bit cleared. This change was tested
>>>>> on multiple targets (SM8350, SM8450 QCS615 etc.) for over an year
>>>>> and hasn't exhibited any side effects.
>>>>>
>>>>> [1]: https://lore.kernel.org/all/fa94cbc9-e637-ba9b-8ec8-67c6955eca98@quicinc.com/
>>>>>
>>>>> Prashanth K (3):
>>>>>   arm64: dts: qcom: sm8150: Add snps,dis_u3_susphy_quirk
>>>>>   arm64: dts: qcom: sm8350: Add snps,dis_u3_susphy_quirk
>>>>>   arm64: dts: qcom: sm8450: Add snps,dis_u3_susphy_quirk
>>>>>
>>>>> Pratham Pratap (2):
>>>>>   arm64: dts: qcom: qcs615: Add snps,dis_u3_susphy_quirk
>>>>>   arm64: dts: qcom: qdu1000: Add snps,dis_u3_susphy_quirk
>>>>
>>>> Are there more targets affected, from the list of the ones currently
>>>> supported upstream?
>>>>
>>>> Konrad
>>>
>>> My initial plan was to add it for all the QC platforms, but wasn't
>>> confident enough about it. Because we have seen the issue only on these
>>> targets and hence tested only on these.
>>
>> Okay, let's proceed with these and in the meantime please query internally
>> whether it could be applicable to others too
>>
> 
> But if it applies to all qcom targets, wouldn't it make more sense to
> add the property in the qcom glue driver?

Hi Bjorn, This issue was seen only on some targets 2 years back, so we
only tested on those platforms. I think its better to add it to other QC
targets only if we see that issue.

> 
> Regards,
> Bjorn
> 
>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>
>> Konrad

Thanks for the review Konrad

Regards,
Prashanth K

