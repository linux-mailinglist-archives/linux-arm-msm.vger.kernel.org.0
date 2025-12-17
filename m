Return-Path: <linux-arm-msm+bounces-85476-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 9627BCC743E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Dec 2025 12:14:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 16DB13035A01
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Dec 2025 11:13:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 494BA33A704;
	Wed, 17 Dec 2025 11:12:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nmDOEgOl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jDZepw5n"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C09A333A03D
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 11:12:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765969925; cv=none; b=kDRpR4LCU38HTzTcecky/VNNY/GzK2b78FnN8D/0c88nNzPnBZTl3OFFSTP6YXetchPnEHNr1tOi31nVZxZkE5ta9ltwj8jkbEErZbdiu4xwWnmP+k3RagXtN+3qMQj5849hqmR3peNamm2JhubgqaFE4GcMb0o0Q3o5w5CIGds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765969925; c=relaxed/simple;
	bh=LlLV/28sCuOmANe66iWLGqjRd1+cBIwqNMnc0KOSZzU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Yci1iumWzeW2B4os6Yo/4nUZIhX1y0Ik9UPsBt5TslFWm/8nwVUUMKVU84mQcD/M3v8BTp/C5ZfCD7uwIPcQGP2TVGBdkDukBo0WwpPafvWHqBQ+RsKWwxxV9QwszdskV61qGzg6xx3o6e1r/LNMS70kJQg2y1FmRy/6cm5aRbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nmDOEgOl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jDZepw5n; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BHA4lWJ1281789
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 11:12:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ExQR+krKvze2GEv0/P9bT8ECaGN87QaML9Aoy0DR1u0=; b=nmDOEgOlGPMbrxcc
	NhejsmTGCT9ztEuXfHGXWzLPbIOzuNdD1YsjE59l0biRvC9gmCBGJOpadhjfqsx0
	87MQFZVpqYTm35ypycjxjggQa/F7x+1Ui8CWSXee+7Wa9FdIFyCiDQ9WwSgiDmfi
	oNvDDBcSI9PEBTh92YGWrtYJkeTroGPVGfgzMbmD2cXdOz95c1x47uQA/Cd9v+Qx
	qtZUxBGWpGgys/bvlvRHTIxTUxULW6N/D0qgv5ZB6x1i2ikPgmhCnT3l8IIp1VN1
	fSdv0Ihr/b2EQD0SsWBRUomiT1UOPWijjn5fY+1GzezncZMJ6DPcCyym3ZWMAAH7
	q2VXHQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b3fe2a68f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 11:12:02 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-888881a1cf7so10175226d6.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 03:12:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765969922; x=1766574722; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ExQR+krKvze2GEv0/P9bT8ECaGN87QaML9Aoy0DR1u0=;
        b=jDZepw5nBzp8v863LSGyPzfS+GqC3av+sN4pZaPZHui/dw2LZo/iNiuPFRk8+TW3e2
         nAhnOxHXzIBk8bz0dZY0hP/0Q6Veok/bVvSy4DgTDucZ6HiGgtTMvYJqaTtRp8QPmw6b
         5RldjVwW7c+6rPmZLjTc5rHmShvCz4U1qK0F+15mfKikF/YUbUp7xouKbbXV51+bzyXC
         h4/P0M9v5zAccm2jynx3FSZCfcCY3fP8XMcjv20JscCMRVkwagNw7VF/G+c4AvsCWwbl
         KbLpsLkH0WmMhimyitrcCL9aKq83gO1nVdIcpDnEhB2GD5h39OOLAkAFUDQuWzy9qhgS
         pBiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765969922; x=1766574722;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ExQR+krKvze2GEv0/P9bT8ECaGN87QaML9Aoy0DR1u0=;
        b=pRftlUp/FiS+t3+LY1zwRNqADorEmRcN5u11MPgXVoQh5b0aEExskOzlC2YQvviHF5
         HZv39ldFNCWqBzbwUMZ9eof8oo/Ykfm/kdLu4cF1KHb4cbDKRYLYFOa2PdHyK1YL4nTe
         KpW2WVG228zWJVP4AiVH0DPHO2DGCuAXYe/QSVjissC6naOcUh2y2BFupm3ZeBml8gAR
         WM4lW6OIotGf06y2A5RJmF4+5exMnRpel1AdykWpdWRtZ7w/HSFOTkvra4BGKBM3OisX
         cunCmgbuK8vtFJT7TXNZ2b2PC4Qd3qM3ThNn3syvO/LRSUu0ckh0FmbKW/hZIzEGqtk4
         5ZAw==
X-Gm-Message-State: AOJu0Yx6gg5EXmwRZoTSR6m5bcFpuNh45CPLMvv4nr3JJREzcIF7MfuB
	QnEOxdD5pNOQ8iqlRE5oziYKCkOa0FP0jzSwzhMn0fOPSW5Uj+LE8Hnfipl2lomsHuFb7zraC8C
	kiNrklhsjiCHC1fnRK0kJpcW2bCJR2FZ6+lnvtYhZwhen642wbX88yhmHE/BaoBaC8e8ngj4fnX
	N4
X-Gm-Gg: AY/fxX6wabtxj/NTb7aqNdRi+TskK1pjgq4N/ndOsRu/F0u0xskHqHY3LRil2i7dIf4
	bKL1AVorKgPOEjc99bCSQ4yfqubBchS6GmgBszXsyhTpBc2JwbZHfQdb7nAWdOedPtwmzZoirvZ
	MSzjR1x/X5qEDRA2JDdViNkluqQ+0wpqlKHC7f+AvgPo3sc6kdqCFeu2di2cHMQB5tFBwyBwRA1
	am4uwQRAbUcmr/YwJKzGCWXYp9Tzpwangl09Xd+to/ynY5EL5Qb0UUJdkWR2+ii3/ANExQ47eo2
	POXiFYFjQc8q9W/uQgpP+EGTy5wZvHChoULYFUDvbTgZgjcu/3uZDxD0b0dBuoAtXXRsHy5mqUl
	ELoRjbLptj81aiDTKM3AT1G+6R5CkRyvv85ozGEvNY4iurtyFzGqkE0nQsRgO1fQ1RA==
X-Received: by 2002:a05:622a:102:b0:4f1:b580:fba8 with SMTP id d75a77b69052e-4f1d04e6df9mr189186381cf.3.1765969921751;
        Wed, 17 Dec 2025 03:12:01 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGcEboJ4RWIQ5i7FJOk17RlbPNdYOC1Mx5pq5R91V+jM8OWrxAZUta37GzEFS30iRcgXnxB2g==
X-Received: by 2002:a05:622a:102:b0:4f1:b580:fba8 with SMTP id d75a77b69052e-4f1d04e6df9mr189185991cf.3.1765969921320;
        Wed, 17 Dec 2025 03:12:01 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7cfa570174sm1901860566b.55.2025.12.17.03.11.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Dec 2025 03:12:00 -0800 (PST)
Message-ID: <d87d69a9-ad52-46ed-a47a-ddc74bc3d4d6@oss.qualcomm.com>
Date: Wed, 17 Dec 2025 12:11:58 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: qcom: sdm845: Introduce camera master clock
 pinctrl
To: david@ixit.cz, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
References: <20251213-sdm845-mclk-v1-0-197bc947d4c6@ixit.cz>
 <20251213-sdm845-mclk-v1-1-197bc947d4c6@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251213-sdm845-mclk-v1-1-197bc947d4c6@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 17t2lV1agdZU-AT2dJAgaSN3efw7kead
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE3MDA4OSBTYWx0ZWRfX22Rl7eo/BV9p
 tjwuvwJQZccuaykV7RbSIB+7KWZTCQsxHWe3vboGzhyZ9LoPRcrJLoMiI+o6ZgG4kOGKYR6zPWf
 wL13H0UZPYuHXH1BVm6fyp7tRr8jJHraZaqSGiU6VHJXb2fdRN5TTdwtZ/eM8S98zNdrbnIrXUP
 Dsp+BwSJ37Eus89Y1ehNLO/qdhzdpdCxN0z2w7hwMaRH/vljATBxiyCHsq43zcZipsLtoh65qpo
 6pdPrfaBBbucCEgmuyUFhRbWHmk6dqfVfH2E8uKwWfwyiiqNvLkCZ1QrQlLJLze32RAViO51mCo
 G8SPjr4fDi2fZ6fK6iG9HnDOzgjBCQ5u/CmYv6SwKd6MfFE7EdE4NqZYmhObGsAT5340j24MASA
 wo7jt47X0zMfOa4WhTPDkFVhrCRiIQ==
X-Proofpoint-ORIG-GUID: 17t2lV1agdZU-AT2dJAgaSN3efw7kead
X-Authority-Analysis: v=2.4 cv=HpN72kTS c=1 sm=1 tr=0 ts=69429002 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=r4GYhBLE_ilKjY4j7I4A:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-17_01,2025-12-16_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 suspectscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512170089

On 12/13/25 1:00 PM, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> There are shared for the whole architecture, so let's define these in
> proper place.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---

In addition to Vlad's comments, please add the missing "dts: " to
the commit title

Konrad

