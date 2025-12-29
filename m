Return-Path: <linux-arm-msm+bounces-86866-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 01592CE73DF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Dec 2025 16:45:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7F8EB30109A9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Dec 2025 15:45:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 799C022B8BD;
	Mon, 29 Dec 2025 15:45:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="h43/lVL+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="joGCTvtP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 170631E9B22
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Dec 2025 15:45:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767023138; cv=none; b=lmorJICknkT966xSHs/QzdmTFjjSOQ7a5ks+9xZFbqfwgbcTFERWbyS+6LeupFSaNZN0bVHXFghcxC0ifTP6lgIPHJw+KeNKDmdxp0LTlCW9YrcWuDKojOnDxwAiP8iiD3GxHhdLgOqkOYHtYnwioU443BQcxCg2wJ8IHSlbP7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767023138; c=relaxed/simple;
	bh=aZyitUGsJYlFAiM9y5nT+CYnBD6OpgHDDgqTvQvcyTU=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=ZFiM8qe8HhojWntpIOzMiv8vbgkvOL3mpd44LkU7/V0Lj2PE8K/0M/tkzB0Ab9ORG1cZgGMVeFfSW/c9VfQq87A5M8+aWjSxD4NsUekv87KJGMpoGR82bB84N+WsIVWy346EWQTrSW4LXFc5KSnAziEVmQsPEEu2wLk4Kf1OW1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=h43/lVL+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=joGCTvtP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BT9vIAC1348132
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Dec 2025 15:45:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OwJ/KIXxN1pm8G02XFPstS7pjvm6mTSx7XvsygsQhIk=; b=h43/lVL+1gNGIobm
	s30qk5sMMyFw6wq3WUOJiKmfN2PU/9hZolcWnvyYw4B8juU+G6y3WdvbML7Qxre9
	TVMnhmNCFZK2lb/ruZn/Mp49mctN2DkIeyCIRlwbX+YVcLMnBYd6t9DQ6ReOJwlr
	KdH8kRHpeFXIMtxyVi/Yk0/im/uBBvF1pp0tnG+0/QysTX5cH6A90tzWWcu6gefI
	AyL+kHL1RM9uZFBnn6aiANJTkx0RVQFqGFKMkFPz9kVXgTMY0wn10XZd5qr95Pxp
	xqLBLjce9WBn/jT0vZxWGRPj4YHyJn8SG1Juj1GT75pAnsaJrb18BaslJrcYybPa
	hEOKNA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bavrj37jw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Dec 2025 15:45:36 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4ee21a0d326so85327911cf.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Dec 2025 07:45:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767023135; x=1767627935; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OwJ/KIXxN1pm8G02XFPstS7pjvm6mTSx7XvsygsQhIk=;
        b=joGCTvtPalcX+fH9ExFFGQRPm5iAxy6ex+chvjg8NXrtJkKDLRo8saMweX8g0ey3gY
         NPY/led15KfaoFmmPpw4vISK9NPcCMNZTODMR1IaWRJrWmn4eX82uGmUB62BGRmszz0i
         oDR7WnohNP7jUvxJz5RQ8YepxPRpzcTbVrORzlIfaFKp8i2qgvtQOqBOfa/QQryeGHo5
         aEbIZXs1SFQwgo1TC5IzoOLrahfLJz2q5He9Y5pq/qM9GP6AXDtX8qthcqHfqt+e98oV
         4i7sJKqBRvv3VUUcH/jLXt6730f1kB4Qf5OdATLxLpipm7kO2fhIbRANOmx4hQPa05wD
         E7GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767023135; x=1767627935;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OwJ/KIXxN1pm8G02XFPstS7pjvm6mTSx7XvsygsQhIk=;
        b=LkE8N7CFWssnVwiF9W22J6+q82JehI79fVt5pbGfEvmlZ/ulSbsHTis/cKi2gUUAvW
         mqMQ3bOw0uw5K6/9w5APpGOvCwcySNCSUCeLRq2oPjoi2MCHfSTWx8ibh2HTDXIzo6rg
         bdySjYMuG8q9Df/nDYkoBsoQ+KfFsefswXNuuFIdf9AIb+EKqLgbWejHi5q9idk7x2q2
         0Pt+ll1+vS8ZgtC5pnMr5LgiK5v1cAjWfP6zFBsTke1Gm/Uu3hQl4C/9a0e3fJWs2ZR1
         0FNHTREUxwZhZ2eNrYHbuyzPMltyHrFweaxGO9pYMkMWGOx6TffswyYK8FAm1/ktmPft
         QKCA==
X-Forwarded-Encrypted: i=1; AJvYcCU8DC6u1DC2N1dUtS/SDPmtS148Mw+BLJbuu2gMSU67/0h6M3gFg8SQK0bPVzHAeMlEWlm1qCedqLFFKAAM@vger.kernel.org
X-Gm-Message-State: AOJu0Yyy7Zbhf5ijNOVdrkeazZdkVy8JrTaKb/TjNuLdoCh5W/dnXmcW
	BO16MbNr8OYdI0x346TXEfz0Ndk3x1QWb3niWT/G54yckVT2odJVKgKp9mgL4T33CGLXPx+7QqQ
	/4jsW4THh9yMTyrF+4iG3GCFP5RIWLiOFK4AA9pm+xydQnhemGwf3oeh7aLWA4wXE7Rca
X-Gm-Gg: AY/fxX67oGgB7dHtyUMj1NrmvMUP1+JyPMZMD9H0wrMEPOVn3+F+jE20/v2rS6TtuNa
	+8e9icFbMzRAR+qoOfcwu9b++Bz1Gju2Db/wCGK7kBXrs2gmlE784kIq4tRRcy0Trqppq4AW3E3
	vKD4out2y4r8aBY9h50cnv7/J24/DNNqSAw7YO5UBUGDeiIe1ZZVZGA0hYFe6rBL/Jutq58vJ7j
	fzJYgYvc7ZqxZN2fC8C2DLkGiA4f2SLZlfXbUKidXCj0IB8B4l2O7kr4xjyJeLw2JKOjOjgRCJo
	wEh49+1pJQVLqoC7M6G3TXjTPNAuJ7ojXlTe7yeCHNClx+ZEeFAvS5CvgnLxNFWikru6YDonEbb
	fFUCsBe6OPLinSJP4T9pWhZVBKyJBTA3IkgVGtdY=
X-Received: by 2002:ac8:5742:0:b0:4f1:e8c0:1cd9 with SMTP id d75a77b69052e-4f4abd1aebdmr448777071cf.25.1767023135144;
        Mon, 29 Dec 2025 07:45:35 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHRLj3csfwZOpvtwltYjpXTDlPKqg4UM7bvghdHWRKzUr5Ab2yIlSrTakhW800lBR8D0caFYw==
X-Received: by 2002:ac8:5742:0:b0:4f1:e8c0:1cd9 with SMTP id d75a77b69052e-4f4abd1aebdmr448776481cf.25.1767023134620;
        Mon, 29 Dec 2025 07:45:34 -0800 (PST)
Received: from [192.168.1.110] ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037f51a74sm3455398866b.63.2025.12.29.07.45.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Dec 2025 07:45:34 -0800 (PST)
Message-ID: <dd693ce4-3cf6-4a58-8c94-6f73186fab7d@oss.qualcomm.com>
Date: Mon, 29 Dec 2025 16:45:32 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: remoteproc: qcom,adsp: Allow cx-supply on
 qcom,sdm845-slpi-pas
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251229152658.284199-2-krzysztof.kozlowski@oss.qualcomm.com>
 <39fd6151-7b64-4e39-9b97-3376b6b62b61@oss.qualcomm.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@oss.qualcomm.com; keydata=
 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
 cwzYbmi/Et7T2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <39fd6151-7b64-4e39-9b97-3376b6b62b61@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: rzwx78HkctddnEMLCHKm4k8g4gnSxDXR
X-Proofpoint-GUID: rzwx78HkctddnEMLCHKm4k8g4gnSxDXR
X-Authority-Analysis: v=2.4 cv=coiWUl4i c=1 sm=1 tr=0 ts=6952a220 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=7hisBbMUveKue4xTUIgA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI5MDE0NSBTYWx0ZWRfX+A2VVdohSogS
 tlguOZiq3XQOyLyYaaGA+4O3r2QicdydZpeAAXAW5HWQ1LVpXTvJGJ+mfvvP558Epi18PUPslzX
 2w2P8e/qz1z8w8O1K5yqZctD5DrwmIsRzS7THT9jj3nP7BcX3evhEZzdr0lhEP6d4iA9FpX/7w7
 iRsrZ6Ff9M60Nb8jxaGwTgyOJFYmYdXT+Zx5OaUJYOv6TGRAbmFO3J1uCoUiUi6dVeQu1klGtTs
 DjA8Bb5byHA/0VZCIIBLtWEFngJfzCIBXl/wg/Mi068TFrXhF2y6xFQcWJwd+wDmqA99hXJDyUC
 y2A8RU07R6e90IhiTY6Si78wcNzkRMB9b5Jbgk1pGPnrHFRNs4+wAD86uebEM9HC+dSMlamOt+Q
 Opd843KaqZ2pIVkWqfvbpexuMNBm7MRUjKHf6jHC0rQBQRBnjqyR2l174ShQbRVLimXtfzgidWR
 KGs714NunrVYj7eW2ag==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-29_05,2025-12-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 phishscore=0 adultscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512290145

On 29/12/2025 16:38, Konrad Dybcio wrote:
> On 12/29/25 4:26 PM, Krzysztof Kozlowski wrote:
>> One SDM845 board uses cx-supply, which is not allowed by the bindings,
>> as reported by dtbs_check:
>>
>>   sdm845-samsung-starqltechn.dtb: remoteproc@5c00000 (qcom,sdm845-slpi-pas): Unevaluated properties are not allowed ('cx-supply' was unexpected)
>>
>> The SDM845 SLPI binding already allows lcx and lmx domains, thus the
>> cx-supply seems like a fake name for something else, e.g. some
>> enable pin.  The qcom_q6v5_pas.c driver parses cx-supply, so it is an
>> established ABI, therefore document it for this device only.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>> ---
> 
> fyi https://lore.kernel.org/linux-arm-msm/CABTCjFBQOq1pmdou_17ZOV3MgTxD_2byAY4RitqPVN5FYdRuJg@mail.gmail.com/
> 
> but this one seems to be more tightened, that's preferred


Heh... I think you need second or third pair of hands applying patches -
6 pages of patches with "New" status:
https://patchwork.kernel.org/project/linux-arm-msm/list/

Best regards,
Krzysztof

