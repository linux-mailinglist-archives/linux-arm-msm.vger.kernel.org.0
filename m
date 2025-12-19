Return-Path: <linux-arm-msm+bounces-85845-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 915A4CCF90E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Dec 2025 12:26:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5CB763014D98
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Dec 2025 11:26:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECDE731195C;
	Fri, 19 Dec 2025 11:26:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YiMdrmX5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VH7Lr+so"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 885E4311948
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 11:26:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766143587; cv=none; b=KGe1tAANuFmukG66UwFDNZhBUS0aCPHejDli+VtRXypEjUzdJxiLp/SUuMi+E3WgbuslkpMVbA419vOB2oxO9aj7NOluBtJETSV4lklfMmttSPJ6lGzPbwnTJ+CWC77TpGU/Y8/G5JrWlFKqkWKXecvq93DVgvZ4TYs8Fz8ozYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766143587; c=relaxed/simple;
	bh=8pJSuO9KIUWmfdi7w+3+9HoMOfbr+58miWs+1C6zH50=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sPnSHgMlQI1ZsDj6jXJvzD5WqP/fzI1VDibNelMQRhBObS/qxeirtemdPjJZKcmW4qjiP2VGTbesAPrUbt4FuuLKs6b/vdCNCrbL1699yO0etmbGA0oUOqo36btMlhQHHGozQ5jijnKOuaQahUP09F0jFROgpxkWvsITevdeGk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YiMdrmX5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VH7Lr+so; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BJ4cG484101367
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 11:26:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qgIkZckTvFqsmG+otJwpZvPH1RpWL7olKv7lb9pkgWM=; b=YiMdrmX5HvbOCtXI
	Gjd8vb97B3RzuvFYodaQrjZ1/HifKixRGBTy+0g5jdiOox4zgXgd+QY80U1M6loL
	nG9gEyzSJrf3xUlV4Z4G/4N+0P1CpCU1sRYZTPxEY4JKMClUen77thCyq+IeNzzZ
	6C+TvsAgAoN+LT9fSbU2rUTEGC9WNQzMk1erVcnVlN2hEuB0FJ1HCYQtjw44b2pd
	RkDrj5j9csFBC/N2mj8Gwlfzybsb/rHsNoY8B0ShrdvP08HtJhYAIBgx5PKHmgc/
	AwaYc5rqBfx0GvN8rvo7cmG2GkD9rXgMfp48nEsG0yc6IbNNx94iZZI28byRzlYF
	cjQ8pQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b4r2c2fep-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 11:26:25 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-88882c9b4d0so5192196d6.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 03:26:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766143584; x=1766748384; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qgIkZckTvFqsmG+otJwpZvPH1RpWL7olKv7lb9pkgWM=;
        b=VH7Lr+sotB1oLWxzdiG0QzvcuzACpvO8cZ+F1y3V9KaM7pvkyMkFILzynxTNLHid2L
         lAopiKUZ70hDpETQ9qFIu8yuqI0oCojsADXklORC/EY5fmqQe22vdYZ744EdOQlu1QSj
         2PkMAbm9GoZuntZls5GR2xyHm120QJuVQPtK8XzlAS21nkh4lry7G4wN0U1R9ZstMv+y
         Y7zmXuaowX71y1TzAimzt2xFnUWnKx3iV2/JnZmzcJr2i5Fm2+a15pHXXQeIl6pRdR1u
         pN8qfwFe3E8yWzbAk5Nde/zj4g4uVS8skl8lrZ+/Sy/AtKFs7QYVvXyCDMRmA48aCvO7
         pclw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766143584; x=1766748384;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qgIkZckTvFqsmG+otJwpZvPH1RpWL7olKv7lb9pkgWM=;
        b=PQQ0jlwN2OfwFPdZSaFUenWmzmQ7qdoFbLLQlFMn9vvwgiObFkUwiZi08J7jzO5msr
         kT2nWqFHPF6Nw+anOURTJvHkXsKojFFMzT45OBsxHHGLMadSiELCnkKvtgxqSVyV0WBL
         svNHPNI+K5ICDF0Y22L0PAteBi36Tnx44xA2l5azI05PcACMaeP9TN/qsvE5Q/D2Rd8X
         ncWs0JHt1dcgM8cGZxNM/nPaWQFe/pOBSCi5gFpVETz5NylXHR44tLpvw6R9nHfTXFrM
         iyNxazKr4WFEyu17UjLT7CyezjlZcCxI+OO+qOHuznWJTIFJtXQbl4nQCGqiwvxCoXvD
         SnyA==
X-Gm-Message-State: AOJu0Yy08Qh6n49njIYv11gdFwBuwZVv9czH2KXgadZDTyZzB3Pt1UgV
	ZNDnq0UvrXEUv7qjdRsutw1PHkC9PGO4iwqwP+RifIle6Bnz711xiF3ro8tDj2wcZ4h8Xjo1QGK
	Svozqku+Zbz9S3gTW+reMG1jiUigaNndOx1TCKjiWeEqnDnWUSfwuByYolbYip1BfhZj1
X-Gm-Gg: AY/fxX6uIJ+rcD0qtXvj92tA7sw9iL1Ujp+jKo35oCd4my81YDyot7mvTEmhUHvdhsX
	U8wj+O/ZxIq7EhF+fQWS0qHZjNZwj5wuw5T1ycdo8ynpVZXNRCQcLC2LwHSNc3u2rnxlwJAlvJz
	baFR1t9OgjzRyx3PfOcCXCKH/ah4+VUsbX9CXSs7dU54bmU5sx1fJTH6RVNJrgusXlS7rdRUeAe
	WTCAuHRCtse5yTQ/dLTwlPKPOwQPdIQEQlxCHSb5xdBIZa/it+d7Dy1Fcq6ldwc1YOwGlELDT0H
	DN5JsQzOrAVn+prSsYv7uMmh/DnJzWsIGTNTGQRQTsBZH8ZagYJ83x49hX021D8LQ2oicbwANmc
	nISJ/NMm2PEZNva/4Dz69RJeMAbpohcZ+/PF1F9kd50g/DGydvvzRPXJSCLuCO1JBVg==
X-Received: by 2002:ac8:5744:0:b0:4ed:b7f0:c76e with SMTP id d75a77b69052e-4f4abdcbf88mr25276451cf.8.1766143584606;
        Fri, 19 Dec 2025 03:26:24 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEQYdnxNsnG1bLW+kQ2/cqPw9VinGQT/IzvI6aLregUbGRCz0G+G/WNWgUTZ9OauQUxpPN6vg==
X-Received: by 2002:ac8:5744:0:b0:4ed:b7f0:c76e with SMTP id d75a77b69052e-4f4abdcbf88mr25276231cf.8.1766143584203;
        Fri, 19 Dec 2025 03:26:24 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037ad83dasm211412366b.25.2025.12.19.03.26.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Dec 2025 03:26:23 -0800 (PST)
Message-ID: <328e0750-29f8-4020-b4fd-e2e70a38005f@oss.qualcomm.com>
Date: Fri, 19 Dec 2025 12:26:21 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mfd: qcom-pm8xxx: fix OF populate on driver rebind
To: Johan Hovold <johan@kernel.org>, Lee Jones <lee@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
References: <20251219110947.24101-1-johan@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251219110947.24101-1-johan@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE5MDA5NCBTYWx0ZWRfX36t8EjP4n9e9
 bbfeNwPXhjAE9Jn/SCOnm7WaIJEH4z440VFv+4YXSg0c2xJVMfMhh0exsOa3CHENbp45MDtfdK+
 9NgDxIkDk+btdmhp4PkO9FOeHkKRIiv3OvKy7Hs+0Gko47oRnuvCSrQQr3lLwUX/l1KIatIs2wu
 xbswOw5WeltbCsmfJPzLpRFWjCbIirQ15xsbNKjFxgypX0OKstpTR7NxUc2VsyonezL1W4GbEC6
 nAMwPCfhSq26D+IpLaJaBuSDGPGXUR6W9EL+KhCZfc9GpZ3sYMOzGw7ke1BjUVejRyqQ0FC0yjc
 VlJ6w6N1iMebD9+J4jduj9q9L5huh9VouWDsoQaz+FGqrnrKiEJwFhwsKpGQMpod/GjZZMLojPM
 RzQznOqssiYm0PQzBu6WBPHYgXpQO3HgloFQ5K89AGIkHXb+KMqRFrFdlpXrVaAXG9GuePW/C8/
 CupizwpOVpCAXcXVpeA==
X-Authority-Analysis: v=2.4 cv=dOmrWeZb c=1 sm=1 tr=0 ts=69453661 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=wTlNtMXEErMED71dkKYA:9 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: UAbZEs5h3u28Ls-WRTgbzpVC4tiZx0sw
X-Proofpoint-GUID: UAbZEs5h3u28Ls-WRTgbzpVC4tiZx0sw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-19_03,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 malwarescore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512190094

On 12/19/25 12:09 PM, Johan Hovold wrote:
> Since commit c6e126de43e7 ("of: Keep track of populated platform
> devices") child devices will not be created by of_platform_populate()
> if the devices had previously been deregistered individually so that the
> OF_POPULATED flag is still set in the corresponding OF nodes.
> 
> Switch to using of_platform_depopulate() instead of open coding so that
> the child devices are created if the driver is rebound.
> 
> Fixes: c6e126de43e7 ("of: Keep track of populated platform devices")
> Cc: stable@vger.kernel.org	# 3.16
> Signed-off-by: Johan Hovold <johan@kernel.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

