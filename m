Return-Path: <linux-arm-msm+bounces-69170-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 74737B260A5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Aug 2025 11:20:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5812A16A037
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Aug 2025 09:15:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E60D62EA155;
	Thu, 14 Aug 2025 09:15:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fF53YECK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFF712EA469
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 Aug 2025 09:15:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755162918; cv=none; b=UYDOup7jF4TqujJWYuhJYIO3IITCu0Pk5iteoIN3+H61E3yIHPIXjloheMjy3M2YuYTbN8MMrjoQEWAdYnsIbtRhMrAx1aA5cgM/WmhVfc3rpdoqkkZ20YxvQgC/UCMaVCFhsKiayyEc0gePRc1ay6S9hmq9YmF7UNMkPx1pmTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755162918; c=relaxed/simple;
	bh=XhEhDZQsgMiczoesYFyeTv5mQBvZtLNYROcgClmCwOo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VbXk5J7pImuE6Bx7zCffFbIGlkRDAddQLNoZVh1v7yjq7Hz/ACW3Iv1J0UY4nvSlZ4wxqM2ZyoQ4wolTdVkt8NLVBZcrnJBdz5lyoX1mrgQkXWlNmLuCX3F+0KaZV8ax+G0L4q7lMpD5K7FpfE6wXLXLtgTQgJJ3nQvLFLNj/tM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fF53YECK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57DN0KNP023974
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 Aug 2025 09:15:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JXECCtiDhY+FWYo/Y2DbBqY/PXD9a7G7J6neCt3E7iU=; b=fF53YECKPEpR0cg2
	VwKZMznx3OdK06LL4V00GTK7XF7m7O9Oc+xjaniO3m8nGem5KeT7rJyPcRHQ5yZd
	e2KkheFATa41mjVAAbqJwSE+mk9dsoF0ubvLylZtys7cMvbR8m3eFbpqxb+LBEKr
	TFSweUjxiGj0S0kUpdm1EaaF/ywK3kKKtoywAHsHarK2Kika3Ihu7nv8l7ioJc5p
	JQRaFO8W2wELAON6cAoGg5GMx9z2QudnF9AeQAxC8T51R4s4Qih//aFoNUcKcWRT
	fsIoLTuwMHS3Y9EGkObTcQD7t6giIx8Mu1corNqIUPi5/lMJYAaF3WaoUjzGZxAv
	lZM5mg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48gr9rurke-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 Aug 2025 09:15:14 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7e87068f8b0so19736985a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Aug 2025 02:15:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755162912; x=1755767712;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JXECCtiDhY+FWYo/Y2DbBqY/PXD9a7G7J6neCt3E7iU=;
        b=jTKnb25B1lTX2jvTOuS0jb96Zs28y+0myZVlu6PYrOAjrG1wesYGIy0u5ERDqoTSw9
         b3R+PxxfGpXXkZNuy/r/b0Ow2c8Wrpw6sx+FNJlvk4QFd5WP9oPx8Y+luPgu9u3s0V74
         8jbY4NYgHetXrIT4vxhbQp+shKAG5msOI3eit3lii5LVg4Xn49ba773x+VzJgiXu/JqF
         +iQQf+gmNeePCJjUARct0Llw1c4U6Xn0wdlUq+qBGi9XoHNhmAFNgCc4YPQyTJtEsd64
         P5h6RaZzTwuhQtqX6/CDMs1xA/nd20DRFJB1+NQcPUs+4oHTy0zgMvvYnfAACZUnKrtb
         ZTcg==
X-Forwarded-Encrypted: i=1; AJvYcCXFTAWQw8o+9hGzHdp7vCfjd6SoPXW2sKcpelhvVCARFecIsO5ryymBQ1QlDokb3L/Z0yaOwmd6lv9RDKjt@vger.kernel.org
X-Gm-Message-State: AOJu0YyxKmVvEVI+Ty/yXB+Y2dkfzHBlc1ECvQ6rfhuQCWXzXB+9bhyY
	hKgoAYW/sHT9I6IFb7A96SRCYjz6+dqSEasy1hwj+xbSCZKMw6NVRd7Brtg2zKPQk4HehEKtOoC
	0VHDdCXlfLgQEvSxDTs28Cit+4Yv9Xtm+l0fVnCJj19BHJVNxOH+vy2fZ4Ms1tZSuwmZl
X-Gm-Gg: ASbGncuvGc4eJUEfvhkzOOTDnORtF6eDKqeD8wtLrweViaj8bsDZf+wm1RKGFqdlAd2
	zvJlCCk/H0s2Servg//i4w9X50u851KJ2uLFYZm8MwtMVYFJ8N4ZnBmpfylWOft3L0VT6bRIL1b
	lEDcaG0cMdIVtJCUQq0cQIxWODwqCn6Zy1n/6g6jsYpugGKqr7V9Yz0zD2GEKyLYLXWBxic+jIp
	sNZkodGsEb3tX9N/YqloS6zprlz7D4WGzRLWnNI0h3l91eesWruaKJyLtY6/aZt/k75h40pC7uq
	1QFhUx9V6F0tiG8bug3ttR7u7Hc2TjgRwG4QF7A97sLhJ+cIP5XjPVudX74jHT6E1AwDOI3TTHR
	37rjcEHmGeIiSFzHQyg==
X-Received: by 2002:a05:620a:2801:b0:7e8:1594:c1d2 with SMTP id af79cd13be357-7e870445097mr153925285a.10.1755162911946;
        Thu, 14 Aug 2025 02:15:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG700skgv8n/LYxojP/q5UsrZ8ZDa7F90OYLMOTMtJbcl0KhlRKJm0m+VOoW1I+d9LOuGyLbA==
X-Received: by 2002:a05:620a:2801:b0:7e8:1594:c1d2 with SMTP id af79cd13be357-7e870445097mr153923785a.10.1755162911409;
        Thu, 14 Aug 2025 02:15:11 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a0757b7sm2547884966b.19.2025.08.14.02.15.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Aug 2025 02:15:10 -0700 (PDT)
Message-ID: <e35ca54c-252f-45c4-bfdf-fd943f833bc4@oss.qualcomm.com>
Date: Thu, 14 Aug 2025 11:15:08 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] soc: qcom: icc-bwmon: Fix handling dev_pm_opp_find_bw_*()
 errors
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org, Dan Carpenter <dan.carpenter@linaro.org>
References: <20250814063256.10281-2-krzysztof.kozlowski@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250814063256.10281-2-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODEzMDA5NCBTYWx0ZWRfX26tOStVeymAR
 zo0R45gdndTO0+coEw0lWRfarg/siMO+sTtDux3XTybY6KJoNzkkN+HIEa1NnBRHigjaWS8lAKW
 LgAts/It03YwF4MyIZvD1zdjPs+6cJs+ozfbAEkL/qkwD6GdqXRH5oJ6wGyZs51fCuuyBB5d6+d
 HvGjP0L+bGa/nl79hCSgtvZBaCMBOmhkRYL70Me9bs0R1pRp2vHVEeLrfBufm0YjuTTI4pnb4Om
 CXdjTf1ZLjSIEG6nhJOueC/4ecbXFHq+7hvORchE3MmFwhnL5t+gUgdeh72n73qDVqzxHah9VcR
 ODpb5nnikUWLKK0dWuGS7pYkRH4WnGwQW+y95TncswUFO8+jEPhwv67j6Fzf3zk7J9qlzURqx85
 Nssg4Ncd
X-Authority-Analysis: v=2.4 cv=NIrV+16g c=1 sm=1 tr=0 ts=689da922 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8
 a=oxqizksRuSS1_KsISTYA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: JFTBeWwzQbeql0qPkYVUvD5C8_KdHQuz
X-Proofpoint-GUID: JFTBeWwzQbeql0qPkYVUvD5C8_KdHQuz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-13_02,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 impostorscore=0 adultscore=0 suspectscore=0
 spamscore=0 malwarescore=0 phishscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508130094

On 8/14/25 8:32 AM, Krzysztof Kozlowski wrote:
> The ISR calls dev_pm_opp_find_bw_ceil(), which can return EINVAL, ERANGE
> or ENODEV, and if that one fails with ERANGE, then it tries again with
> floor dev_pm_opp_find_bw_floor().
> 
> Code misses error checks for two cases:
> 1. First dev_pm_opp_find_bw_ceil() failed with error different than
>    ERANGE,
> 2. Any error from second dev_pm_opp_find_bw_floor().
> 
> In an unlikely case these error happened, the code would further
> dereference the ERR pointer.  Close that possibility and make the code
> more obvious that all errors are correctly handled.
> 
> Reported by Smatch:
>   icc-bwmon.c:693 bwmon_intr_thread() error: 'target_opp' dereferencing possible ERR_PTR()
> 
> Fixes: b9c2ae6cac40 ("soc: qcom: icc-bwmon: Add bandwidth monitoring driver")
> Cc: <stable@vger.kernel.org>
> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> Closes: https://lore.kernel.org/r/aJTNEQsRFjrFknG9@stanley.mountain/
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> Some unreleased smatch, though, because I cannot reproduce the warning,
> but I imagine Dan keeps the tastiests reports for later. :)
> ---
>  drivers/soc/qcom/icc-bwmon.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/soc/qcom/icc-bwmon.c b/drivers/soc/qcom/icc-bwmon.c
> index 3dfa448bf8cf..597f9025e422 100644
> --- a/drivers/soc/qcom/icc-bwmon.c
> +++ b/drivers/soc/qcom/icc-bwmon.c
> @@ -656,6 +656,9 @@ static irqreturn_t bwmon_intr_thread(int irq, void *dev_id)
>  	if (IS_ERR(target_opp) && PTR_ERR(target_opp) == -ERANGE)
>  		target_opp = dev_pm_opp_find_bw_floor(bwmon->dev, &bw_kbps, 0);
>  
> +	if (IS_ERR(target_opp))
> +		return IRQ_HANDLED;

So the thunk above checks for a ceil freq relative to bw_kbps and then
if it doesn't exist, for a floor one

Meaning essentially if we fall into this branch, there's no OPPs in the
table, which would have been caught in probe

Konrad

