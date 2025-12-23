Return-Path: <linux-arm-msm+bounces-86405-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CDA3CCDA31E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Dec 2025 18:59:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5726530A35B2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Dec 2025 17:56:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 205843502AC;
	Tue, 23 Dec 2025 17:50:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FUJ5AsyR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kPrJcZAQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC0A63502A6
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 17:50:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766512248; cv=none; b=aBq4i2AqDWUFnlugVRpi+NEUY3fV9qoqNLb3SDF4eXAfBBANdX6HOKiGEJh8TjcHei8ztXnxen6Df9ODnEsqP3YDLrTU/KGGRsivb0PEn/VRf3TKGwANDSIqU8s4dVSFPFdmY3esXqfdwT7iHctLeF8l8ODMQ/hxRKOUlXn6yFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766512248; c=relaxed/simple;
	bh=+i1eSTNPXxwZP78zP0rQuPGn4sg8Tqe01LGVbkayK7s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=umoqu6p+FQS8QoZp4tCuxdmkP/G1FUH4i2Jczqzv3a9+S5ULLuPJMuiIFgGjezodoYLaKUuTKpMfbctGLOd0obFBCHtAEgmGXID8ls0XgfO/vy3Bn+VcEUyNm88bzcM2JPU3y311FAhiKRVhUQOSdG6TxMcktE9MLIvuWYLiA3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FUJ5AsyR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kPrJcZAQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BNG8p2w2747324
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 17:50:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	b9pZ5bVgW9NnLKyCv/+M1ErsUPVvJdj0vF0fVveYMCg=; b=FUJ5AsyRjEzzCQL2
	0y8A3MeDZzt1nBcFUY/eQ+vIbUYJreKlHUlN0w1hdnOrUrwoy5+/49S+MsvdGa4s
	iKLAECuRnRVfWfncI4B/k17iyU+qgnFwnbAli+UcJebZzNO/ZChwawEH4yVUDYn7
	jQWYQ8Tze8DxqdxqpqnpQsKZF69RHWeEYbJBmvJLWzBxpKsvhA6RZo3RTGuypiRU
	/yiDTBbFXXl9miwkl/f2vex3zLENGV8IZ0NppJBf/YO9alQXTdNSnErh8akjv+MT
	M655ugv3p9ZGxAH6dQOVK2tI90qzpyCxLjdcqvtPgWqucp3ed3wm6SUgetl+OhrZ
	6bMUCA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7h5cu125-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 17:50:45 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-88882c9b4d0so17373636d6.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 09:50:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766512245; x=1767117045; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=b9pZ5bVgW9NnLKyCv/+M1ErsUPVvJdj0vF0fVveYMCg=;
        b=kPrJcZAQT9QgIzf5jTWeIDdEF7KatZZ2lVE19ZxUzRShla8y+bhUfshwwWgUedUBzF
         mzf2Sbh6ugpQaEOfX++yP/LH9dWkUjMkuMdgJMWaVbVWKFDNoxDzRSr/te8YQh2B5t+1
         vH8uKqFw8VanmNVJZDHahqLkREgEYTpJyr10Oqj6mjKmvKqNll+aZP1hWBFOBuyb00B8
         aVgMPVir6YzESTEB79CjmGDcGfHvfGABPwbUj8UDJ/AeksSPDPTZ2hveUfWHRRHALWsM
         T0yIzEGgZQsg08USEtXwgNgGAcAAcEhxvFwQaNYGw3Q/9t2a0geaeZqC1mgZASEukjmP
         VHMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766512245; x=1767117045;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b9pZ5bVgW9NnLKyCv/+M1ErsUPVvJdj0vF0fVveYMCg=;
        b=hCJL7SZg5+XNKHc+akvSemnp/6JFXIY8MU9j8a0xA1p6A++dcAlkmLM+5y/U7rxRVT
         HW7MR43aA97FTDoynMXt6hD8abxyr2bBkvaXQsUHj8tBLRp237PkfJqAqvbNcM41DGbA
         fr0dM4Hj+hg0OLtXglR3a8NPhWhqUR0L8X0U5PPTKpJwXXr1zdKj1P9sEj7TVzlidNGQ
         ynhegcPtNVAkcPgIm4c7PD6PL7TuEoh/3p10utOFXCNeSf1wZa+Cc8zRxSbh+lfT7oXr
         O6RYIKpNmwFSix9q2Q91YtAeATvmXHar6tiG83tsDFLQjGWThglXWH08JS7fXrVzyZNF
         862g==
X-Forwarded-Encrypted: i=1; AJvYcCWzrWBKfaHbTAEwpi6RBDliSNAj9H3wdA8n9QKfjt7uelXLPVr2vkLltgS9cQZwTXlAdWGdto6X/DlbOQex@vger.kernel.org
X-Gm-Message-State: AOJu0YxlnRGqMTY6UWeVSv6Or/H1WbS84UaizhBbzVT7CTSPatqNaEGi
	5aPDm/kPmeQ34KsDhs5qV4HDIS3bXLex7yb1Yt0pYI5FmztWZD9npme59c6OSVXV4SdEZou3Yzy
	itzdqnv8mBMkGvIWrAg0kAhivpOkUxbcipGmytckPIRotZ8WWN9rTqu/p2LYIIGRKcA13
X-Gm-Gg: AY/fxX5F+pHv4UQTTrjzrCiW7u/Uw8bIemp91kbypJf48uKsejFDEqfCQtLEFM13snr
	HwtEbrHxwCZ3dKSE8p/4sjufN7GKnFKCpVWQwHjVaZ902pjCMTyvaTVdaagtZFW3fikgIQgzne1
	RIqwt0VsHC7n7crHFHzryGbusHfX0R6K9wXWuQpXwA7Z6EGcipmr1Q5MpE2WylzQlROV2kBwizY
	4K/l31lBZqQorAlwYuTktBIySSCx3Sr2Gilp/MQu5+zHuy5cqqZum6VeKRQq8Lm9Gi74ejCYHmI
	DSVmQ8r8sFKOiy1O+VCVzMX+szMZz3r4JDYtg1A/bYUhU8ZNWIweu1rfsBUqlZGuz9MexVwKd2m
	6YlXiRqHvqZKQStMBk+bUKkgtuAkucrSzMCabtLgTCVwilT7RQQ4FutVGtJseivSjuQ==
X-Received: by 2002:a05:622a:28c:b0:4ee:1fbe:80dd with SMTP id d75a77b69052e-4f4d620461emr58618701cf.5.1766512244908;
        Tue, 23 Dec 2025 09:50:44 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHDX9i69BREA4fOTN99IvyB2FPzNt41gSCZwxWyw8lmenWkzgMrdDFfbDhuqvOiuctcG/zSfw==
X-Received: by 2002:a05:622a:28c:b0:4ee:1fbe:80dd with SMTP id d75a77b69052e-4f4d620461emr58618331cf.5.1766512244398;
        Tue, 23 Dec 2025 09:50:44 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64b90414649sm14350874a12.0.2025.12.23.09.50.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Dec 2025 09:50:43 -0800 (PST)
Message-ID: <e469548a-8d74-4d3b-9617-2b06f36013e2@oss.qualcomm.com>
Date: Tue, 23 Dec 2025 18:50:41 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] Add support for Gunyah Watchdog
To: Alexander Koskovich <AKoskovich@pm.me>,
        Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
        hrishabh.rajput@oss.qualcomm.com,
        Konrad Dybcio <konradybcio@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck
 <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <b105810a-63a8-4d81-9ad8-b0788e2e1431@pm.me>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <b105810a-63a8-4d81-9ad8-b0788e2e1431@pm.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDE0OCBTYWx0ZWRfXzx/yFUN+pGBp
 a9B5WBDTSezKlSxSy+VTIz5fmYW1Wy93P1rUclIAjN3Rg102HeiWsE3BlGA58fpZYd2Z7qOfnnZ
 WvroOHsUMAGYIMiy+iw6EJQHTeeRseBFFeU2N3WZkSp78AdoUsk5Ny0oPAQkfqZOM31AV9hYNpL
 ZoaQiSUkSsyEDk/HRqQShkW/gKGaSKK7sxet4RYbmyGSroYKXCEq1nrNSq5fBMbcz+f7lUDfhsH
 Ewx7fpReBeiNKdnVhhSqFsL6534ZR3CJJYnbaxdQwD7OqAfzi/Vc3d/k1kpwLu7Jspsj5dxc+18
 J86mFz2bPUT5vHGrCq07xf057qti/LA37T+7Fs2xzqRhWCTG6+yOPn9NQF6SsPZ+RGJFlqW80TD
 TzgiQFHeceMDDMM00SLoy5fom/3uuDGAqOWdI6gdiK6nomo3VKIu25S1hRIbbO0Otv+7OWJvsUf
 SgGgYhhx2xZMoQQQ6WA==
X-Proofpoint-ORIG-GUID: kfnD0K70HeJM8YrwM9EOGiZ4izUil5a4
X-Authority-Analysis: v=2.4 cv=LeUxKzfi c=1 sm=1 tr=0 ts=694ad675 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=qC_FGOx9AAAA:8 a=lsCYmBuC6W_TzA65AAgA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-GUID: kfnD0K70HeJM8YrwM9EOGiZ4izUil5a4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_04,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 impostorscore=0 adultscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512230148

On 12/22/25 8:02 PM, Alexander Koskovich wrote:
> 
> On 9/4/25 1:05 PM, Pavan Kondeti wrote:
>> Thanks for asking this question. I believe the overlay part needs some
>> discussion here.
>>
>> I have tried this series on 8550 MTP. The overlay failed, so watchdog
>> device did not probe. same is the case with 8750 too. It works only
>> after applying this patch. I will test and report my observation on 8650
>> later.
> 
> Hi Pavan, was linked this thread after seeing what I think to be the 
> same issue on another platform,
> but issue is a bit more serious here since bootloader fails to find a 
> DTB at all, not just overlay fails.
> When the "arch_timer" label is missing from the base DTB on Milos, 
> ufdt_apply_overlay in bootloader
> will fail and it looks like the DTB memory gets corrupted. If you are 
> booting without a dtbo image,
> then you don't see the issue. Couple logs from bootloader when it happens:
> 
>      ApplyOverlay: ufdt apply overlay failed

FWIW this comes from ABL, which is open source

https://git.codelinaro.org/clo/la/abl/tianocore/edk2/

You can probably deduce the correct tag from the boot logs

Konrad

