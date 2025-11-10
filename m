Return-Path: <linux-arm-msm+bounces-80917-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 99252C451F2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Nov 2025 07:48:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 588EC3B1785
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Nov 2025 06:48:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EB3F2E8B76;
	Mon, 10 Nov 2025 06:48:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jJcAHol5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ig82u5ez"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA650221FCA
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 06:48:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762757282; cv=none; b=JTZwze6OV9PZS7JsKq9kjBHhha7CPNI9iXflBHxf8zgWRW/SLaeEpUjdYt3MiaXm0XukOUEeW00rBgzlxwohBkdn3LFdUSGN8/FZ5aP2uviZs74GkLPuc+NX+2n46hbf1KIM9pAaEsWwkCxnVMZNlnIVGaSKhmn3kMVULnnpIxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762757282; c=relaxed/simple;
	bh=Colp3J1CtUUxtYunOSxTe/q94oFmsL/+dkEwvdrbzqQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dvnjyxJyGMCtNGp4ajJUxVXASj5ZUBLwZRbwUbDbQ8KdKkju1MVh5P3aT3bWCnFSTpLo5HnZ9RtKLOxYRV8LGiXkCGqes5falIB1BBdfov2WS1lyuEuo4wIxKk2sgh3gHxxam5GPxGdrGtN2UCQzG0Ihop3F6XVTPmbYqO2cKLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jJcAHol5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ig82u5ez; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A9Ko2JY1522149
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 06:47:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hKUnVQ3iHT+UcmDjXNspHD8cD61G/kra1wg6N9IeAe8=; b=jJcAHol5IkPm5dZo
	JTbrrcz+LRU7LqYdjjjCg2MRokDcsDmnvVJrRQ2XtMBYPMXrN4AycxPYpUsRMaCY
	J2l8qwywE1sRRm+6+vt8x9RxLSFCQI4mbQZ4ucJ/XvlTL727tkl8xSN/+BYhDftX
	xqkz+oSM4kVjYFbkjq5LqXz6zWdlNjeSlP1Tvj2XqoVAsup31d1tkSO/ZGGlCxeK
	wLS6/q8dma/ls15p5q/KrnSlzgh4DVxR/2rs+Jrfbpn3aNQuhKxyqo5g2MPyEaQa
	yZFBou+EaKf+x7NNC9xD+N7d4LkHCqSg4BWzBsvQmcNYXLzKQ4K+UBnd0g5X070v
	SiUNvQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a9xvjbncn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 06:47:59 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-7811aa16c6bso313854b3a.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 09 Nov 2025 22:47:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762757279; x=1763362079; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hKUnVQ3iHT+UcmDjXNspHD8cD61G/kra1wg6N9IeAe8=;
        b=Ig82u5ez/pYfn83Vrp+oQDZgeimyr0V/U6aGsXh6LFWKILDFTjZR79BRdF7oN8ot3g
         seua50LZthO9qRSR/A9rlGIX+EIv9vyYXt7Sk2ofCApOQ77+jyxEORw3Xs+8QDLcncjX
         IjuW4mrmRs3Cp+ciHtJuA3WoAJF/LoS3hjT93fLc6NeoSiLeZB97YQucWddAz60TLvPD
         CGN0FoM6BrTKOpLM7hv9xfvM3rd1rOMwiNtD1VmQH6QVb7l1jl/nNQ+nKEIn0+3cSvfn
         qWIOXNrqHD8X8S7g/9euqVTwOoUx30rdC6R+h58VqAXR14hVrlCC/oGum6SXBf/RayD9
         Q6Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762757279; x=1763362079;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hKUnVQ3iHT+UcmDjXNspHD8cD61G/kra1wg6N9IeAe8=;
        b=F1PtCSMq+/Uo1y+rq6a+ynn7R5Y2ZhLqopUwoHIthKBkABvJ3vW6nu678Ndogr6+TP
         o3T3i6z4yg0+i9Ku/JNw3t6zQJBeR97VPYBdvownYQ+ixT4MpkhjAQr7iEtfAQ5Vx364
         EAngYQIMGBLxVSzh2bCv+mauYK8615gD9+0u06gyoMJqTOySLv48NA0E8vL28aSpbBbZ
         qJc9s8HZ4AITlv1XrA1I9MiigDH29lbRofJa7n1HtcIOS12TaNzUjDp17UgyUlL6+gVf
         OnFTAftLXhiWoN5ZALp//hXTTg4ISiiVghl+FS92zgwHcCrMq+BNdSHsKdIexg+SgtpX
         wEzw==
X-Forwarded-Encrypted: i=1; AJvYcCV/lbAAIAeUqUhFL0PCEuMsX4UBOWcqMPiIBHhObyf4sgv9gjj9e7Mvdxu9nW+LBRXxktsCt3Us8GpLbUSt@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2JuFsOorLPSed0LSRB7mB9kbrRzKHE3dIeX5ODbCwL1z99ZKA
	6yJ23cgCR9KYNp6ZV23KgNWQ2FBujUkqK6bkvXx1QVRHIA/1XIux/2cC6S/SRZotTF6LaykLGgo
	JtHkG7+hPlkIS0Yd+/y5XMcDCOazLYJSzoieafcJvXUm3rfrsc/uwjjZN4Z3MT2aRTpo=
X-Gm-Gg: ASbGncuxdktNf9QvpitUNulVU8uHRZpv2PJNSnZnkZgD53D8naGyfTAK++t5zLNqQJo
	KKny6gDw6oqeqhK8iacuSQODveTxBJtuvEcX+tC6hPqbmbnSEEAJ0/Iqv2n5yF2FLu7OJPcTbwh
	STSGTbRnGTxF+ePhpdMKw0I/m733m3kEVMwDF1hr3QglrBydvFCNp652y8IqYTl+y9xXd5ZTy7I
	L4nsLWPdS3avrxt7/6sq32P6LBObLYS12AUuv2Bqf6zN3TxmAOGP7G+nwpBArtv0kZ1ufO+aXWz
	/LbglAP5QREWBwMsOIR5k/wz2rM4Iv8eBOWec9gWjmKwxn0U5gvpPG9v8DC5e0HPDy26lxh3Nfe
	URwi4DXv/wENKexGOInVOfF1P9rek
X-Received: by 2002:a05:6a00:2190:b0:7ab:4c7e:a9d1 with SMTP id d2e1a72fcca58-7b226999ea6mr4593607b3a.5.1762757278745;
        Sun, 09 Nov 2025 22:47:58 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEgWc5pnkGSNwJDR7b/mhuRmkoqM2U37Z8tRqk/xuImnRxiqjCHoT5jkDMdFqNIO5Yv44sPdw==
X-Received: by 2002:a05:6a00:2190:b0:7ab:4c7e:a9d1 with SMTP id d2e1a72fcca58-7b226999ea6mr4593576b3a.5.1762757278278;
        Sun, 09 Nov 2025 22:47:58 -0800 (PST)
Received: from [10.217.216.168] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b0cc179f77sm10372943b3a.34.2025.11.09.22.47.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 09 Nov 2025 22:47:57 -0800 (PST)
Message-ID: <522f353b-7965-467c-9951-9829e58dc681@oss.qualcomm.com>
Date: Mon, 10 Nov 2025 12:17:51 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 1/4] dt-bindings: mmc: sdhci-msm: Add sm8750 compatible
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        quic_nguyenb@quicinc.com, quic_rampraka@quicinc.com,
        quic_pragalla@quicinc.com, quic_sayalil@quicinc.com,
        quic_nitirawa@quicinc.com, quic_bhaskarv@quicinc.com,
        kernel@oss.qualcomm.com
References: <20251026111746.3195861-1-sarthak.garg@oss.qualcomm.com>
 <20251026111746.3195861-2-sarthak.garg@oss.qualcomm.com>
 <0c791304-928e-4075-87c0-bd37ebd8e351@kernel.org>
Content-Language: en-US
From: Sarthak Garg <sarthak.garg@oss.qualcomm.com>
In-Reply-To: <0c791304-928e-4075-87c0-bd37ebd8e351@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=QuxTHFyd c=1 sm=1 tr=0 ts=69118a9f cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=EGUEwqo9yqTfsl6hxHQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=zZCYzV9kfG8A:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: u6t8XAk9ul-WhCOIeB_kgY1ZkaqmCbHK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEwMDA1NiBTYWx0ZWRfX3a+9egPVtq+u
 dETI2Nsz5ygRDzMLdACCZl+fbB+E5YSJk6FuuGPTQDjT01VRxFQ8NR3RNZhX/NrDBeKELs3Wv7y
 BebkWv/qndKiYdbF25tpy/67fSis3sXS4Ot/YdFBjhJURs/ME0qMg62FV9lgsbs5sq+uxXeiYuZ
 0OkKs6BbRI84naYMO+NQRnPvF8R1dLXpZuqi8wDd4SML8yxqX3W6Hi42OjFHpGjr5+0ozw/R30A
 08/KyYVF4INVOcUiDhY1JUoyW0nRy/zt5I4K56o3bxKmFHXeqQlQL7kNg1HTSw65xQBn7BnN2he
 xHKCDa5X9qc289OH6p7wyJPrp5F8rTmCHaOmUHy2atNGeiniHeNJ2Dq5VGxfVIZhZdxbxXrFOdT
 Vg3YB5HgYvHGOHu6DNGMTJKywCwqag==
X-Proofpoint-GUID: u6t8XAk9ul-WhCOIeB_kgY1ZkaqmCbHK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-10_02,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 priorityscore=1501 adultscore=0 phishscore=0
 spamscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511100056


On 10/27/2025 8:00 PM, Krzysztof Kozlowski wrote:
> On 26/10/2025 12:17, Sarthak Garg wrote:
>> Document the compatible string for the SDHCI controller on the
>> sm8750 platform.
>>
>> Signed-off-by: Sarthak Garg <sarthak.garg@oss.qualcomm.com>
>> Acked-by: Rob Herring (Arm) <robh@kernel.org>
>> ---
>
>
> Why are you sending third time the same, even though this was applied
> long time ago at v1? Please do not send unnecessary patches, this just
> clutters people's mailboxes.
>
> Best regards,
> Krzysztof


I had assumed that we need to repost the entire patch series regardless 
of whether some patches were already ACKed or applied. I’ll make sure to 
avoid resending already accepted patches in future submissions to keep 
the mailbox clean.


Regards,

Sarthak



