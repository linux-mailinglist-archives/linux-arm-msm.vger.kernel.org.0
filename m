Return-Path: <linux-arm-msm+bounces-75299-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F20E8BA375C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Sep 2025 13:18:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A36C65614AE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Sep 2025 11:18:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54B4A24635E;
	Fri, 26 Sep 2025 11:18:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BSUQ5OO1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDEC6158545
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Sep 2025 11:18:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758885495; cv=none; b=jV8ygLSc3UIfe5qfyK3ZgeZE1+A6FUFd4jl5B68DYMwWAEUiCU3PoQwTfLNztRa5K1OOoXFYxjuqVYHuT21ntrg2c0a990S0WOFfc9Yi/p2QdlGD0wDLljM3/3cClphlIVrYrJkRXUzqyLQw9uMKfGP46wL4PEUVfz6h8j3/bh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758885495; c=relaxed/simple;
	bh=WWXLCQcdLw/jfXQnL555FapDZ2XFm55+s0Ewk9K6eVw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jQjs+mvGs1W4hxY0pF4wOy9VjieMusGrMAvF8AMmzYRTtKBJWf09SEpICufp3Pzzv1RrWkHXVFieX5/QVggCBlZFS1Bn8w4dCsU6XmACgRknVKmXoVFNeHD1tCLrH8SCxjXCL/zrvsoOmqLly52JomnmOAIjR71xdsAddUGMScA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BSUQ5OO1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58Q8vf7J028832
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Sep 2025 11:18:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Eq9Zwf2rKiWBOFDTkcfFofQ9fiSbCfKkCk6e8JzUd+4=; b=BSUQ5OO1IXahVIuV
	Vn8Ku/wW88M79HlafbRzhLbeqlgfbsYTcgba0hO3JM4RJGdeUy59wHOEI50o1ePw
	9bWfmr1qmXKbOyzPbh7Nhf1oybSp49g36xYPjfD1H1bQqUs4D31V1sqdumkbJREa
	7xDKdPmo5XjjMS+ctOvkrYZqJ9SbwqEXiIY5ILTqiKZxxBPD4dAg5fkRhV8ZFhWK
	iGEZnV8piOhPbPhu5gsQj8W/Kk7HhuJAnLWKzXAHEQk9YWtRtpNGIGAEc0Ok/G7y
	vSjaSUoeWIV8kARA2y/DZ1FoO/wDPRK9sDHrywxChABlyRLNAsXA1jkNFW9Km1gu
	S5kp5Q==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49db322m98-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Sep 2025 11:18:13 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-85696c12803so82927985a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Sep 2025 04:18:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758885492; x=1759490292;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Eq9Zwf2rKiWBOFDTkcfFofQ9fiSbCfKkCk6e8JzUd+4=;
        b=lsThF5tEzRRgveIAqXcUb7r1XIGM41WX6BBUt54Gy08LBGoPjUfVAw+51VW/JKyzP+
         wIIsVnpChCrVpKluYdMmdas64Uxp2GFjc5WfHFRHXZYHUqs6oRwmiR5oK7SJAi3S+FMg
         FU+dacH9g5lvnEkXMAa/OdS3a95nKlrF27GZSIUT35rIY1etp/pDc3wEOyazkZs0iRiv
         R3PlW/VpXDQAYH/y1iCASBuj2whuTmjsw2W9pnEsNHxGA9G8I06ZTBdheSdkgLr/Uyld
         k3UjkNpkODmP1VuRdAqT6OISpEvOAFqnCcXiJy1rH7fuNm13ReHtHD9Z6FST8kwm96yc
         7tEA==
X-Gm-Message-State: AOJu0YxrRwszB/HFvrLcxLMh6EGSc7NWyq4duJp9PNDowTq2msxscJnI
	IEQZ/n/WJNgaNJ5ep+tjY0RJNv3iTS3ZldQ+At0Nn16XQsS9fBXf8XozTFPhVjScTh4gFbvnI6f
	2HP5GSxVEdks1M02M4jXJRprrf34FbffB4VRk5ogwa3zCEA1r8CTKeeTcfa8NzGHajLbR
X-Gm-Gg: ASbGncusW9IzqmDVJEAR3zHZi1tbJ8WxCnp81aOt/atNBUAlASXwLvhSgR66hF9KDVD
	OOo39X0zP7Zn/uz2kib8qNfxwZQiXmPDlz8QO/IMfyXbNnzhBwMqmyQSPGac31eUjkevIqIR2CK
	yzzU4lywvFHYqL8DeLCG5G/y4DTP+dx2ynhpQo6TwGKFHpkqfaq1l/d3NjNo6/rVc/O2E+viexE
	hssrYQ7eylKjep/G51xuh1lgmZ8ls2SptqVKBRJ213mYza5dw6ZkhRgWlwy+ST/egejl9CQsN07
	eQNZSLagC7xj892xXWmgLvuuAd4eEId+Zt4eQNY3t+qZyIcKiYUwUUhhyfFm3dfc5F0Fp1iW0Kp
	FrhGJ8n8AyBWDuAwZWQhsDw==
X-Received: by 2002:a05:620a:3182:b0:812:81c6:266c with SMTP id af79cd13be357-85ae6d81db3mr601251785a.9.1758885491717;
        Fri, 26 Sep 2025 04:18:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGTjabHhK02b9oVhzoCCGFrlmQKMMkgWl8q77/ykLbuE2cCJPi3DSQKHtmGntFz7aUmVpFMZA==
X-Received: by 2002:a05:620a:3182:b0:812:81c6:266c with SMTP id af79cd13be357-85ae6d81db3mr601248385a.9.1758885491079;
        Fri, 26 Sep 2025 04:18:11 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b3545a983ffsm349631066b.94.2025.09.26.04.18.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Sep 2025 04:18:10 -0700 (PDT)
Message-ID: <652595ef-ef79-4c36-9979-b536ca65e1de@oss.qualcomm.com>
Date: Fri, 26 Sep 2025 13:18:07 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] drm/msm/dp: Update msm_dp_controller IDs for sa8775p
To: Mani Chandana Ballary Kuntumalla <quic_mkuntuma@quicinc.com>,
        dmitry.baryshkov@oss.qualcomm.com, marijn.suijten@somainline.org,
        swboyd@chromium.org, mripard@kernel.org, abel.vesa@linaro.org,
        andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, robin.clark@oss.qualcomm.com,
        jessica.zhang@oss.qualcomm.com, abhinav.kumar@linux.dev,
        sean@poorly.run, airlied@gmail.com, simona@ffwll.ch,
        alex.vinarskis@gmail.com
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        quic_rajeevny@quicinc.com, quic_vproddut@quicinc.com,
        quic_riteshk@quicnic.com, quic_amitsi@quicnic.com
References: <20250926085956.2346179-1-quic_mkuntuma@quicinc.com>
 <20250926085956.2346179-2-quic_mkuntuma@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250926085956.2346179-2-quic_mkuntuma@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=ao6/yCZV c=1 sm=1 tr=0 ts=68d67675 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=tFSzMcqD3SoeBU5fSnoA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: ShRGib-CcPvkaELor9XmAZKp7pLddzFZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI1MDE3MiBTYWx0ZWRfX+Xu5L5fiRkge
 CVbVNRHDS9ZSx7bFCYUI2hLTTnozMPXzioP4pH5NWGCJGJkwQjbyX/vKJ2SU9dfivRGyAiQlWNB
 8TRK9kSPt3HnQSO15EOnisO74bOoe0UpZXXg0XOzH5eloejeYUPYs2jqaZKOkg4sUuAk4dunWxR
 yFoWiSkWrxd4BcY+pvuAwCUthuWcltX9Zz9giuqjtPGAn+AMrrSqflB/X6sWNOZn/SdUmvHtoOk
 JO8imyMuQqkJcAvJkaB3ntDtzooEdgfLRLEnrOYopvsfbK01bQvTD9IeiEFKVZ2ZGLCby8C87et
 eVDjv4KIO0X/I/2re0AN39XJcYQVzvbylG2okGDVvmgWiixJwmQd5VN9rUkF34oSbn0WTUG7gSk
 Arh8jvJuzLzuae32j4x6Akd7no4oHg==
X-Proofpoint-GUID: ShRGib-CcPvkaELor9XmAZKp7pLddzFZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-26_03,2025-09-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 priorityscore=1501 suspectscore=0 phishscore=0
 adultscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509250172

On 9/26/25 10:59 AM, Mani Chandana Ballary Kuntumalla wrote:
> The Qualcomm SA8775P platform comes with 2 DisplayPort controllers
> for each mdss. Update controller id for DPTX0 and DPTX1 of mdss1.
> 
> Signed-off-by: Mani Chandana Ballary Kuntumalla <quic_mkuntuma@quicinc.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index d87d47cc7ec3..f247aad55397 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -133,8 +133,8 @@ struct msm_dp_desc {
>  static const struct msm_dp_desc msm_dp_desc_sa8775p[] = {
>  	{ .io_start = 0x0af54000, .id = MSM_DP_CONTROLLER_0, .wide_bus_supported = true },
>  	{ .io_start = 0x0af5c000, .id = MSM_DP_CONTROLLER_1, .wide_bus_supported = true },
> -	{ .io_start = 0x22154000, .id = MSM_DP_CONTROLLER_2, .wide_bus_supported = true },
> -	{ .io_start = 0x2215c000, .id = MSM_DP_CONTROLLER_3, .wide_bus_supported = true },
> +	{ .io_start = 0x22154000, .id = MSM_DP_CONTROLLER_0, .wide_bus_supported = true },
> +	{ .io_start = 0x2215c000, .id = MSM_DP_CONTROLLER_1, .wide_bus_supported = true },

Well, did you see what happens when you try to plug in a display
to a controller on MDSS0 and MDSS1 at once now?

(memory corruption)

Konrad

