Return-Path: <linux-arm-msm+bounces-85690-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 44BF5CCBD7B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Dec 2025 13:51:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7F0CB300EA1F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Dec 2025 12:50:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE803334361;
	Thu, 18 Dec 2025 12:50:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b3dPfteg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="B/fWGuML"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41EFD2BB17
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Dec 2025 12:50:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766062257; cv=none; b=LSVO4BevoyG/7SnEogUqvVdIZVbNMhs6RilYwLLcO7uK7Yjx7NuV3YPEuJhrZ/j85XQsi7gGUNeWfZ8RWXuHOgW4BEbwpQYJ4SxwXlwuMJfR9WfgviV6FMxjwynu1v8godscicovQMtLr0a+ot7y+H+vtpHhkA4hV+xBIZM36nM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766062257; c=relaxed/simple;
	bh=nT+Z7K+xYvhfifW176JW2A8cpszMgLrT/52hysFTbbQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Kf2E7PM+c45d60agDqT8XS8BxyQLgAJOWSyYqa8oh7KXUH91j1+rfBatsdWEWGUyuYiakhbc0MDiqIwBnMnetzjz6UQcnpFBxmgHLXru7M137Y1jokunm1J6TzjOHwNA+2HINNgc0Pd1ulJKwkIJlm4B/S/hEtWYgJeVe6kENDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b3dPfteg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=B/fWGuML; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BI934sr680496
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Dec 2025 12:50:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dxkXtNOmEaF10A58PDTRV1K7kEcPFxGfhnkXO2omHZI=; b=b3dPfteggkFQyvI0
	XJUB4WFLJvYIfaXSTEPQvaN0mVZFHBtBtC4olV/LUagDqWEHEGi2qX3Y4LxafbsD
	PLWdFRv1r0ukWs1motptem1WoB++g8Me/MrOCQ+dkdgsYQTWZcFk50IdIjK5sSQw
	CIJvbH9csFyWnm70QdVck2bzwnhNVWbV0e1yexD2fKTQwhyn7hmS1+vlgYR2S90U
	QEzD3Bqc0esJ3N54ULOkoL8YsaLjd/aKE8YVRIpklMXFJyyAWoig/T9O9rKjRtjy
	hmDlvs9z7dYJmOHPS6TWdCa6HV98xT8SJwRzb+aSlK96e2PCyb1VtAAQ0EWAETCe
	k1K9ZQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b45bhj9wq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Dec 2025 12:50:55 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ee07f794fcso1599581cf.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Dec 2025 04:50:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766062254; x=1766667054; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dxkXtNOmEaF10A58PDTRV1K7kEcPFxGfhnkXO2omHZI=;
        b=B/fWGuMLKSAUvU0M3mFMZcIDGTrMdVdOj+k/D5tpwl56L+6BuDAbtDPZ+C4dlbz9SG
         mXZRI+s3akYuRF00fMRtm/NgZCy84cXNqKFqpBdzq/GJantZePnGIEtc2IoYWc+C+JEE
         Xho0BsIxTejaXczQ1U+nDkxjLZ5ie7diaiBZ8n+H+Ow8fy3L1HKeocKKdcKXcx5xrHlh
         BxnOYas/c7Eu3lYagFTL8BBml3AmJoxycOEXiWK5iENCQonvDcQdLPs/Wm5CN+ygUMA8
         3b4zqjOubcqnn5CQOZNMKl0/fcls254N/NAfcNAZRljX0WE0luDxWPuyPkeSnYhFhifG
         xJVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766062254; x=1766667054;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dxkXtNOmEaF10A58PDTRV1K7kEcPFxGfhnkXO2omHZI=;
        b=BMkXBov6fZurOl37Jrw/QZZIyn0eJdGQTX/rj2l3nbNNwJPAGsOp97+u+E/0w+HFbx
         XuaW6obVQNeMDkI7Sh79Ak0p3EwJbwhUbGvVL3pk8ZjztmX3AnikscrvmkvpSBfQ7J9z
         1SoEfpmQWwuYUom2ff7yI3DDfP45Fzh9SZ/jPcx/3FBj7TRviux9Nfm2RmhnIEe//wTe
         cN7IJWj/aHNjfl8+RhuKmfFrvQhyD8khC1ibQAa4YOPVAraKgikJcm9dvSuUzN3NDKVV
         QEGsQAr0J5Oe9cTYhwb2t2kighrbvBEooZ0SxJAJ/MeVjfApFWXLtY9rhR+d/n8wbtMb
         aQMQ==
X-Gm-Message-State: AOJu0Yzhwps/Yok/oZHm/yGlSGYi7rsQkg6ug5aLOOtEZGstSd4A97fm
	/80xUjSyJ4ztomoU+GVB+ttSwa/piBxHJO5/cB+HIQNmcAIqVfA6cHgGvpuPhpylHSwk2GBJusw
	3QhGlGTMq2l3K4nMbMQWzKY/xI/eTZZAzmo/1TiwM1aO8oAFXabsJSJNUfWB8Btu6ONH5
X-Gm-Gg: AY/fxX5jTQXRUSw7IOK3yfm9Sq+qnZPLRUDJGzSyQhtACXLmURisefEaqCDfpYYIpKh
	JdcOE1TUzX5lNBAbRH50kpvyvSayo/h6P78djsLv5RaXHwFLbLk4DR3rcB4Kw83hlpNGTjHGS9z
	SEULI7viQ0IBcZPJpAD8PFvegI7mEVtFaRN2UOoRy1co8ggu+LTM4iLKOTZsdn4T8CtgVjx0ZqH
	+NEOiW8WHfcooiSa2MgJ3ATsDY1dKr3mUDzwnCRFjSL3RnBUzUb34Hwb6235vjHvgmsz2SoLe51
	vuHwzmUU00xZUXEfHhimddy7jKOBUG6Sv645NTXN14DO5tGJrE3io9E0y9hZeTJdSCtL6Vitv6L
	2BpK6TCnBNS2FFkatAIwe00tdaS3t+HtsKVSZChUgEleGU1Gd4wto4dfoq9R7zsgIGg==
X-Received: by 2002:ac8:5d07:0:b0:4e8:a54d:cce8 with SMTP id d75a77b69052e-4f3610c2804mr19287821cf.4.1766062254359;
        Thu, 18 Dec 2025 04:50:54 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHIBlnd/lTcRpYprJ8AJw7wzy1oqdKWQddPjpuPPmYIIcfoSF0jBkR278anslispESju96ulw==
X-Received: by 2002:ac8:5d07:0:b0:4e8:a54d:cce8 with SMTP id d75a77b69052e-4f3610c2804mr19287681cf.4.1766062253969;
        Thu, 18 Dec 2025 04:50:53 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8022f94036sm222752166b.5.2025.12.18.04.50.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Dec 2025 04:50:53 -0800 (PST)
Message-ID: <1e7594dc-dca6-42e7-b478-b063e3325aff@oss.qualcomm.com>
Date: Thu, 18 Dec 2025 13:50:51 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] soc: qcom: rpmh: Add support to read back resource
 settings
To: "Maulik Shah (mkshah)" <maulik.shah@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251022-add-rpmh-read-support-v2-0-5c7a8e4df601@oss.qualcomm.com>
 <20251022-add-rpmh-read-support-v2-2-5c7a8e4df601@oss.qualcomm.com>
 <9e8b47d8-9a20-40da-a6eb-cdd167c108dd@oss.qualcomm.com>
 <5029600e-a3b8-4aec-a374-526fb3f6417e@oss.qualcomm.com>
 <8580c092-3e1f-4b53-8330-ac1746b7a126@oss.qualcomm.com>
 <cd7420d3-ceca-4a65-bf19-bed4452d9576@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <cd7420d3-ceca-4a65-bf19-bed4452d9576@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: OgSSUWCFFW0lP2nNt1zwPRARXrByi3A0
X-Proofpoint-ORIG-GUID: OgSSUWCFFW0lP2nNt1zwPRARXrByi3A0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE4MDEwNiBTYWx0ZWRfX4NK8FaCYDZek
 oyLLWzPSyKhI5n1HWVCM6+ypo7X3foEysgdrUHX+KjPBFfNL/SGN2eXDWs3z/UXf3deZQB3X2FZ
 jsZJ3XsvzEfM/HOYUyQ6mdQu9MtQ6JX7YO2oFpe1E8fm6hFmwOxxkDw4Aqm7V3XWPpwzLRVL7GK
 G/evyk+S8Ll5w2tUYMQ/acPm8aG1hvCPmBVwGJZbgfwYfsKTOrgcpN5FvwS9SqfiTfTOZd8cPoJ
 Fl+43nstUI/c2igEbXnMYnLHIZ7FSf6xVCNzY9N8SjQmp1/aic6xucr4e8BBFYFEsyDz5DozNpG
 hRbf+BDqfMJ4Nd4M4gHIUFsikKt8MrTG1POQckN/KxpK+FVuGLywym8jwc1HhK/grEMDzb1cgi3
 uv1eQSnKCgPgXvzYMrk7oRzMUmK21Q==
X-Authority-Analysis: v=2.4 cv=SZr6t/Ru c=1 sm=1 tr=0 ts=6943f8af cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=92XHK9IGOTDTESaaxPUA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-18_01,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 suspectscore=0 spamscore=0 phishscore=0
 clxscore=1015 adultscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512180106

On 11/21/25 9:41 AM, Maulik Shah (mkshah) wrote:
> 
> 
> On 11/17/2025 6:04 PM, Konrad Dybcio wrote:
>> On 11/17/25 9:26 AM, Maulik Shah (mkshah) wrote:
>>>
>>>
>>> On 11/12/2025 4:56 PM, Konrad Dybcio wrote:
>>>> On 10/21/25 11:08 PM, Kamal Wadhwa wrote:
>>>>> From: Maulik Shah <maulik.shah@oss.qualcomm.com>
>>>>>
>>>>> All rpmh_*() APIs so far have supported placing votes for various
>>>>> resource settings but the H/W also have option to read resource
>>>>> settings.
>>>>>
>>>>> This change adds a new rpmh_read() API to allow clients
>>>>> to read back resource setting from H/W. This will be useful for
>>>>> clients like regulators, which currently don't have a way to know
>>>>> the settings applied during bootloader stage.
>>>>>
>>>>> Link: https://lore.kernel.org/r/20250623-add-rpmh-read-support-v1-1-ae583d260195@oss.qualcomm.com
>>>>> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
>>>>> Signed-off-by: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
>>>>> ---
>>>>
>>>> [...]
>>>>
>>>>> +int rpmh_read(const struct device *dev, struct tcs_cmd *cmd)
>>>>> +{
>>>>> +	DECLARE_COMPLETION_ONSTACK(compl);
>>>>> +	DEFINE_RPMH_MSG_ONSTACK(dev, RPMH_ACTIVE_ONLY_STATE, &compl, rpm_msg);
>>>>> +	int ret;
>>>>> +
>>>>> +	ret = __fill_rpmh_msg(&rpm_msg, RPMH_ACTIVE_ONLY_STATE, cmd, 1, true);
>>>>> +	if (ret)
>>>>> +		return ret;
>>>>> +
>>>>> +	ret = __rpmh_write(dev, RPMH_ACTIVE_ONLY_STATE, &rpm_msg);
>>>>
>>>> Is there a reason for making this ACTIVE_ONLY?
>>>
>>> Yes, using ACTIVE_ONLY makes the read request place immediately to read back the current resource setting.
>>> Sleep/Wake are H/W based trigger and are not applicable for this API.
>>
>> Huh? So if I send a read request with e.g. SLEEP_STATE, it would only
>> get fulfilled upon an active->sleep transition?
>>
> 
> Read requests will get fulfilled immediately with the return of the current resource setting,
> there is no separate active/sleep/wake vote values that can be read, put it other way the
> rpmh_read() API do not take any "enum rpmh_state state" argument like various rpmh_write_*() APIs.

I see, thanks

Konrad

