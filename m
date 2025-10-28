Return-Path: <linux-arm-msm+bounces-79147-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CCE5C13EC3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Oct 2025 10:53:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B9A7C3AA785
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Oct 2025 09:48:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E4B62D8DB0;
	Tue, 28 Oct 2025 09:48:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CaBvbMT7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED2F37405A
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 09:47:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761644880; cv=none; b=ZLKUU2mbSmNQmSR0jhS0qEp+e1ifwBsEiZzjLHtuYPRduyv20cTg/Z0ldlTEMQ+tT23+V50kbKaiiVji7NsHvqDgXnmFK6rAnjP0XDaM7X2jMO754cDfjWkqmorkBxRqO/tcbo8Qr4HFbxfkaYD2lVPOr4uDzGmsHtQ7fyHR/Xc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761644880; c=relaxed/simple;
	bh=92ximMM3HrtCvYomgPsBKCGxl0j5JEsmTo0RRYmUmfc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=G3bmwQt7VuEFIe6xyBxrjtaYqFD+4YSu3P9nFgNjXXI1Up8FGHSUyrLW64vDJn7dnE7ggmyYzbiO29AlwctD+dZNycduD7ghR/84jxmRawEu6IPFOyX4dUfVrmvCPVfVFmSizsqicOSlfJP6njKBaj5XVKubQJEzWrybjAQQeLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CaBvbMT7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59S3gYit3165297
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 09:47:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	w8fQgACQUdMVIbkMW+bOZbTopCm7jhlY2sNnMiKhK4Y=; b=CaBvbMT71qxdRcLc
	/tz0Ll8hiP/C4lCb0tkRv0LTvExtU5Vfl92yFHyMNi4gRU5iL0DA6N8yrICdUKv/
	ll8HxKdkND/zSkjn0RJ4erPzzzVnmCRt21NutpPpeq/T7rREzI0MIxdEQcvIGS+r
	0tEvcdPJnJFFVF0e6rGChUrd3jeXCu+ZxkQu+j8VUHbyD/RnXamqkl4rWJd2amaX
	u7e+thsL1dhZhP5SXFT37CUPQSanRVmHra4B6cwvFa3smO4qS8hvhclvvgTmOgRx
	8h/kQvKVk4FKS+yhEB7tuWLv40Ja0muWHhC8SEdY7P6D3BpCED35+C6GGMTZA0Qv
	Jzy1hw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a2bwx2rep-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 09:47:57 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-87bd2dececeso23047936d6.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 02:47:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761644877; x=1762249677;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=w8fQgACQUdMVIbkMW+bOZbTopCm7jhlY2sNnMiKhK4Y=;
        b=K7HvbEMkQvaHTeC9VzawKNEAjOSgfSjlmp5sFEfMubP6dbQrr3+A1saAo4mgAypsmx
         Rl2Z6hUAMKsjFWK/llqreIwk+Pt7glA/d1EEoD7chQDXXjZQplrgkjv2rdlwJLNR4xJW
         8qNXC9n/MKfyQEfgIJfsyfZGChTyFswvaDTrvXnhTHh2uzV/KxMoo67BzjhJt0Q8GH3u
         dCFrcQ6DHs49I5Y4a8qgCpy1aSLO5Ur3d9Tr3rTcx4Uo7oyglBbRBYpYb8/si9FI4rj9
         jRuxCG1yU2VmVY25wzg/l5quP0cTRPRDDq3fTKTIPGlXHRnX4pvkYXbGEbA70d8mL455
         abSg==
X-Forwarded-Encrypted: i=1; AJvYcCUGNx3SQvK5tjadNRjRNEyoAxoD6kgm4vHXwwdzw+wH76d8R4s0ZHeUw3wFhlzmCq8b+rqOfsb1Xxu1dga8@vger.kernel.org
X-Gm-Message-State: AOJu0Yzk4GWu/h9x+/3laBd0ShdNQErg5U9gbXldQtm+1tFKJxq1HxUm
	C1PRa+LuHw+RWuDsZV8m+p5js84vE/CZyk9kNM01tc3KNM5G7Ro+6OunjAiXGT8MIcKaV+1X5u1
	nk5/NssgcjnOy0x8DPx2NWw+6WXU9v7sw0eCfXdUFPkwLYhgEGNma5aim+OVMGTO1rvsu
X-Gm-Gg: ASbGnctc/1WD32k9dLIG2ffLwGkqkZLeGgBWiJo1nYUQUGK/GvlZYHbCASSSDPcD+Yf
	1QDEZ3UOx0vC+vbAZq+EXUUj+8OEC5bxceuT0MxU8+M217IwjrCUg1e7DMdj2UOqST7CO77zMlv
	BzDkghskgYcG8HwwJkoMVAlsJLQT18s9Crp1BbLM3OAZYA2Kvk+H8xXCiFeDaF/eZBZgbESYUAB
	zu6wFtjcjfTpz+WhUGJkalo6RN2c27RWYLa2Z89eiirW8ruR1HA//AoBCRGgizs5GB+746DFAe0
	sIGYcWWQWihYMkv8Sn4VbtGnPnRMSFTsp/lSToNPpv3DL3NhecxjjO6Ih4rrx2RIZB6qYEhFUky
	fflhaaW2bqd6ITipsd4QbRkqIByXYVb9dBy70dAkcRgeGfq1j9xFo2JRr
X-Received: by 2002:a05:6214:2245:b0:7d0:8b28:aaa4 with SMTP id 6a1803df08f44-87ffb1059c5mr21687426d6.6.1761644877307;
        Tue, 28 Oct 2025 02:47:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGOS8rCxBapT8jvuZGeFUYuC27SOQS9JehyH0lmgObjPrvYaSPzNW1Ksfgu1G8QPT0mdat+BQ==
X-Received: by 2002:a05:6214:2245:b0:7d0:8b28:aaa4 with SMTP id 6a1803df08f44-87ffb1059c5mr21687266d6.6.1761644876903;
        Tue, 28 Oct 2025 02:47:56 -0700 (PDT)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b6d853f97f7sm1026780966b.51.2025.10.28.02.47.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Oct 2025 02:47:56 -0700 (PDT)
Message-ID: <63f3d1af-8620-465d-8dd0-30a42a36305d@oss.qualcomm.com>
Date: Tue, 28 Oct 2025 10:47:53 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: media: camss: Add qcom,sm6350-camss
To: Luca Weiss <luca.weiss@fairphone.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bryan O'Donoghue <bod@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251024-sm6350-camss-v1-0-63d626638add@fairphone.com>
 <20251024-sm6350-camss-v1-1-63d626638add@fairphone.com>
 <20251028-defiant-visionary-rottweiler-f97cda@kuoka>
 <DDTUHFIN3IEK.3FY5IS9S73ASO@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <DDTUHFIN3IEK.3FY5IS9S73ASO@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI4MDA4MyBTYWx0ZWRfX7YdJaOLChtc3
 3voHyEraw5Fz5RgC7pZzJ60FZcCDWECKHDBHL5I+QWnl0OeWIweTPof9hb2b1xXd+cGveV6A7MB
 fi8oFyxcWN47UZjjmbLjIAjNEOHpnYaEBVM8eWHi6zMldVTPKykgyy7JFnRv4MR4PtRs0gos5mR
 m/XuB6Z++LFYA6VwFUk1+GFuh8Jzr/y0UpICe2DnKq8QIPlHOCrmbW09/dwj1G671n2SxZ0yeHY
 rfMlJlu4SlSH3M/AT6/3kKNQ2pvGTqq4GRgwbmFNccMNQQIS4i5unuyOriwviMzTixdFlytNigx
 NoTVx4qHsJ72iyQyrPb84vI+WVhZUTlD5zXFVWQxkgLq3Ea9GZ331uTskP4ghr2GBpej0H8BKNE
 UFS+nR5DizSv8lx7hqeB+puYDQvRkQ==
X-Proofpoint-ORIG-GUID: hYxhLS6ZJB8lnal5bDiLzP988eM2u8fm
X-Authority-Analysis: v=2.4 cv=U9WfzOru c=1 sm=1 tr=0 ts=6900914d cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=As_Xg-pERP707GV__uoA:9 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-GUID: hYxhLS6ZJB8lnal5bDiLzP988eM2u8fm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-28_03,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 lowpriorityscore=0 priorityscore=1501 spamscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510280083

On 10/28/25 10:24 AM, Luca Weiss wrote:
> Hi Krzysztof,
> 
> On Tue Oct 28, 2025 at 9:54 AM CET, Krzysztof Kozlowski wrote:
>> On Fri, Oct 24, 2025 at 02:23:59PM +0200, Luca Weiss wrote:

[...]

>> There are no dots in property names. Are you sure these are called
>> VDDA_0.9 in the device datasheet (not schematics)? Please look at other
>> bindings how this is being named, depending whether this is PHY or PLL
>> supply (or only PHY).
> 
> The following power supplies are mentioned:
> 
> * VDD_CAMSS_PLL_0P9 - Camera SS PLL 0.9 V circuits
>     (not referenced in downstream kernel, connected to vreg_s5a in
>     schematics)
> * VDD_A_CSI_x_0P9 - MIPI CSIx 0.9 V circuits
>     With pad names VDD_A_CSI_0_0P9 to VDD_A_CSI_3_0P9
> * VDD_A_CSI_x_1P25 - MIPI CSIx 1.25 V circuits
>     With pad names VDD_A_CSI_0_1P25 to VDD_A_CSI_3_1P25

I can corroborate this

Konrad

