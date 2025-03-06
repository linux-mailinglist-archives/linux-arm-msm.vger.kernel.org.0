Return-Path: <linux-arm-msm+bounces-50561-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F151A554BF
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Mar 2025 19:20:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CA7993A7A2E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Mar 2025 18:16:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B721425D534;
	Thu,  6 Mar 2025 18:16:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UZEmx4A1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41401768FC
	for <linux-arm-msm@vger.kernel.org>; Thu,  6 Mar 2025 18:16:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741284999; cv=none; b=BVLCeV5Jt1+xd/GFe0SfMCclMmgZYeDXZA3j8er8J2bUx7s6AooAhnjMBcUOXDB0/RkB7mtOIWllYMbCui5yu+XcrgdE9dEb4JuOD5Q1NdAjGBdkotYYSXHz16ecDk+zha8hBS6m1bvEIV8zJBOflD3AE/ch18AsiBlGYK5mPzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741284999; c=relaxed/simple;
	bh=EbN82f5kikmtn0/Qm1LCf8hDyauxcxvlf9oa3I6HuYM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Grg1T/930LuXw4G3bOCprP6QHQuiM3fddXu+W16nNwn/188N1nrIDooE8e/vUVVMIyJziKMK1oSEySHvsDnSy9hVlFY/6w2sE/SSE1tvMsH1THU5vJmUljUC219WsS02COzS4IBU9TEmUz1FY8GZEsn5x7ylVPijE3gbrhDMUo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UZEmx4A1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5269K0Kr020243
	for <linux-arm-msm@vger.kernel.org>; Thu, 6 Mar 2025 18:16:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7YoaTsJp1GG1Zf+NPHc2w2/LVr4OpSBhjU2pbItONag=; b=UZEmx4A1UoSGa19y
	FdVxOdk4+umqERqxcPoesxLRcuIr45Z5GV3E7YCdgGDB726FjEz0LcTCDvdY/ZiC
	WD3VcrVbnPaCs8nY3XQmc7LutpatxhicE8ULC64CyRmS/bm4WZV/2pSDcvdWe1OU
	lX4BoJkfZwUDI3fAtd0bgzDQzWkivLcT29mQuGvyM+9Mw7zA88wQfVOJVyEQ+DEo
	L6+HeY0qv+1DsV/mDPvjLk0cPmU4R5uu1M13Jg+FATXseD3kc3MU+yXK7CFp5zka
	CJoc0blgOsmQFndTtnAbU1svbtJYVwFk4IGUs0yg4ZT6/fiz/RpktqhEXhG5m1/j
	iiW++g==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 456xcuk795-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 06 Mar 2025 18:16:35 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2234dddbd6fso20252095ad.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Mar 2025 10:16:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741284994; x=1741889794;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7YoaTsJp1GG1Zf+NPHc2w2/LVr4OpSBhjU2pbItONag=;
        b=c5KVEpB7sXX3dQXF4HlY7m1pB50fDGuxpXwXwb687YZpEhXhDfaljO/qc8oZHGsfWs
         TPcqtpgh09LCscD6nuy7d4HgdNZYCS+p/5aDLJzjzW3X0YSLoRuDLCywxBvtv7+Swyn0
         VQuyvcKg4q8cWifpG5OOYvsE/+d62St6hXUnFd8h+jmrSBHpjkrCRTsKaVKwXKcXKqZl
         FNpM7UxREPja3QtDiVyhbXPvSrkbndn5ptKr/QbZ5qzxNKoX08WiZCC0u0QwnMmICW+U
         PSVMQy9x7M5vWcI1oxvoUbbFSKxb/exNXWzry78vKcqc0GqfdP/iUqitaGGEwJTUTaua
         ISJQ==
X-Forwarded-Encrypted: i=1; AJvYcCUI+4ig1W9uaf9Q5AJF+wu8cR9FEi/OQLgbHBL7WRLUxsyg32UMQtrUKf47KY7UADBqxCqxdnKS3Aj1zzy9@vger.kernel.org
X-Gm-Message-State: AOJu0YxCVWVruKIykowouUaRhjdP4xOKugMlV+ghmKdGKVr797cXB7KI
	4u7wFogQl+W8RCcA+h90SpPUIKPY3a/qY90joONQL6K9B0nB9jZ3nSRok+LB60HBGxLoTloeVCB
	0GXFvBPUKbO/u9tQY7oW2oQXsqBc5Wm/a8xouoL+H/UAGBH8vOYvWdvFZ0S70rLOIa6VuxU/h
X-Gm-Gg: ASbGncsJbmLjR+Gn4eQB+kELSRrrn7ixGmMtezMgolxnb7xeOp3att6FAwYWUNUzVA9
	RupCC/AwsWLgk3MQnjrXjyDPe2UTNWKhEeIJN7l+0soTdieOkgIM/T98heZKV78NFASjEaTyx59
	2X8Oe6TYid0Uwgj2lahrkP3/Ld8pvFbn5EkDfdrJezX2Li12b6XW9mc/zbKvsT1A0xWWu7CcBuh
	q7/04ixixtSEiMubayiB69Wemr9tEztyfVwYsKMZ24BN15/S9hGKeDwKXY4tN3xtGHEXDHL2qCr
	LEWp+aQi9dhMdwIO7dKbTM4XIZZ+id5zqJaBUC0e/2FrZXU4EmbVX3Q2fJqHC8UjzUygR126crd
	r3bIZcSwc
X-Received: by 2002:a17:902:da82:b0:215:a303:24e9 with SMTP id d9443c01a7336-22426fc03f1mr7980145ad.3.1741284994282;
        Thu, 06 Mar 2025 10:16:34 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE2QXPnvkM8ZDS13HEbJ2sVRdyW7rZoIkB+tLurlGijzAZiz/Dt7XnEJlYLEibNROvZrljTAg==
X-Received: by 2002:a17:902:da82:b0:215:a303:24e9 with SMTP id d9443c01a7336-22426fc03f1mr7979875ad.3.1741284993923;
        Thu, 06 Mar 2025 10:16:33 -0800 (PST)
Received: from [192.168.1.111] (c-73-202-227-126.hsd1.ca.comcast.net. [73.202.227.126])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-224109de260sm15596405ad.16.2025.03.06.10.16.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Mar 2025 10:16:33 -0800 (PST)
Message-ID: <fb462c07-8d3e-4220-8394-1f8d9ae587ff@oss.qualcomm.com>
Date: Thu, 6 Mar 2025 10:16:32 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 00/13] arm: dts: qcom: Switch to undeprecated
 qcom,calibration-variant
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250225-dts-qcom-wifi-calibration-v1-0-347e9c72dcfc@linaro.org>
 <174110761299.741733.15423494263862521182.b4-ty@kernel.org>
 <d5l3bsozn2sauenlyjolb45hqgiiachixxycziuyfsxch3ypvd@mjb6whdyjztw>
 <64cb6810-4a75-4313-8d66-d773798f5a1b@linaro.org>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <64cb6810-4a75-4313-8d66-d773798f5a1b@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: XiiWQx4PQW2N7nDUznzCv_6cbRanPCDK
X-Proofpoint-GUID: XiiWQx4PQW2N7nDUznzCv_6cbRanPCDK
X-Authority-Analysis: v=2.4 cv=eeXHf6EH c=1 sm=1 tr=0 ts=67c9e683 cx=c_pps a=cmESyDAEBpBGqyK7t0alAg==:117 a=e70TP3dOR9hTogukJ0528Q==:17 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=dtyQWf_3DRneHDyFKqMA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-06_06,2025-03-06_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 mlxscore=0
 impostorscore=0 malwarescore=0 bulkscore=0 phishscore=0 adultscore=0
 priorityscore=1501 suspectscore=0 clxscore=1015 lowpriorityscore=0
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2503060139

On 3/4/2025 10:48 PM, Krzysztof Kozlowski wrote:
> On 04/03/2025 21:50, Dmitry Baryshkov wrote:
>> On Tue, Mar 04, 2025 at 11:00:10AM -0600, Bjorn Andersson wrote:
>>>
>>> On Tue, 25 Feb 2025 10:58:57 +0100, Krzysztof Kozlowski wrote:
>>>> Dependency
>>>> ==========
>>>> RFC, because this should be merged release after driver support is
>>>> merged:
>>>> https://lore.kernel.org/linux-devicetree/20250225-b-wifi-qcom-calibration-variant-v1-0-3b2aa3f89c53@linaro.org/T/#t
>>>>
>>>> Change will affect out of tree users, like other projects, of this DTS.
>>>>
>>>> [...]
>>>
>>> Applied, thanks!
>>
>> Applying it too early might break WiFi on those boards. I think
> 
> It is just non-bisectable, so that's why I put above remark.
> 
>> Krzysztof explicitly asked for it to be merged in +1 release, when the
>> driver changes are in.
> 
> Yeah, that was the point.

Driver changes are already in linux-next, and I've sent the pull request to
linux-wireless to hopefully have those changes land in the 6.15 merge window.
(ath => wireless => net => Linus)

/jeff

