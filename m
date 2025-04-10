Return-Path: <linux-arm-msm+bounces-53762-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D2BADA838A0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Apr 2025 07:49:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D2C757A8E6B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Apr 2025 05:48:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93E281F1311;
	Thu, 10 Apr 2025 05:49:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KYJ8gIXC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 110891FC0FA
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Apr 2025 05:49:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744264146; cv=none; b=XA0vdMRZ1/QSzI+5ZDuyHXnqi7COqcp633JUHpbV1jfjtttwU+59nFcPu/3T8uzaatvmFRPG1FWJkf3koCZwka3OdKBsdr3xAxRTOgEdBzABvM3mZKaCCmDsT9pe4EeZqNzRi1geaFf9CgweTG76orVDNPuuQohU7e4m/OHzT08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744264146; c=relaxed/simple;
	bh=oln2jJOOqICfShN8BJEsdupRTcRq//7pVVPzBAIOxSc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ANhH3TdJKDMRfb50QaUeOlbT9reUAc5y171fgQa7Ai32esgHKLeqslwRW4gdVmanCrTsuV5vO331U/UwWHNYnFTatIvrzLaaQLib95yL6rNe0a94ICfPE2ajCptdDfDWzmBdWz9xtaP+UGUchuMZlkBEEDqkYbzAKoALR8WLlsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KYJ8gIXC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53A5UANW001752
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Apr 2025 05:49:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=6MfMIQcCfAX5ZEXpELMyE/uJ
	lS97RQd/7sCSe2WVOqg=; b=KYJ8gIXCaxiIXAsB02wvIO0JlatZ4IQwf9CstzvY
	oYUdp59mFB7RAAd8xdcw4x7YvkRff6O4Mxk+tZVr/d1iGED0M8X3H7eLLNkodq4u
	25n6cq7Yrg8qLk0wmr8DeONgMQhAZipqjPx2GAkpgHLLY5PieH36DzzsbcCpCtXO
	bxY46FklShistOwfEEHORNukgjUy6GgaqoDSLxPA4ipRlzMNbvUH9ukDl5SatvNO
	+3ZZ7V7J3ZsYTXT+kb8LuIBMXAte+FvjevmVrDT2lHN7J1R0dtZqwDQKxBPUqbVB
	tuGEWvEhBFm3C0VyaeH952c7TKSQC7jZCz/VhbJaasyopA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twg3nqfe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Apr 2025 05:49:03 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6e8ffb630ffso5645486d6.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Apr 2025 22:49:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744264142; x=1744868942;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6MfMIQcCfAX5ZEXpELMyE/uJlS97RQd/7sCSe2WVOqg=;
        b=bnDpuS5ppgvJwH+q3pPXUTax6WkqixWGsyNL9BpRZWu57jnyMJcR5et9GvO0J3Z8CF
         +l9ImX3LNg0wdxFV9lIzUXWMEk4buI+Cmzn8li6tde/pIulxFfExAI+/Jchy5/Mz8HLJ
         FhWIRL2yM/KaBjdldyMWSQa3rwKvVOXmyZW1D25GtD3pw4SPUqUfp8L5ikBJ1w7oLxga
         q494Cv8QhJejqNR99oEJwpXKcE+px6SUtlz46LQERPwct7m2COaWfRJicLdnkoN5T0hl
         hC3GKEoxmiKh2jEZhdrA+Xm3Ix7hZMHXzL+7skI3AVPLYz7kfTv+uCesav6JR/QuzpFc
         TShA==
X-Forwarded-Encrypted: i=1; AJvYcCXSw6wPi2HqcNzwBwnJIjy4NTPG+zXki/Go/Hme1vTSgmW5Wmkx/2zs36D/xCLnxfGZbvGjkc4AAzsYHsit@vger.kernel.org
X-Gm-Message-State: AOJu0YwtvjGKagycLt5WXpE6S8MLQKMkfZ9iIWpuoFDTl/FEd4RtwfGk
	dkBEcrxAyC2Czb6dS52/U2Tsk6+1IzrwH1mcCmHhTDllIku0W/3ekSECCSSATPl2/umM2xKhXMS
	Bn8VKqtOc97p7GRRlOnP4EmI0tVYlo/0xykEQWrtO+0ZyhiDcse6OJ4AQOVqHBA8GWAbgC50Z
X-Gm-Gg: ASbGnct0uvBO+A5ETbbTuHhSBERDROxC4SVxWxZmAIEuV5XMmrndfedMmQIE7pWBtrV
	iRC77EhxhFX8nnCJw4kujZqsv3C5uuxGrqgjXksmhLkRO+rqW98fnnNh3yeGqeeLhqjGZlpCV7W
	a2Kh1bvQDZEgyHFhy/ovkyz7LCJIvH9DP8QGolwMUPiTpOTxgW42flJwjRPVO9HTDJlyhhzRufw
	9cN5Rf7euT5v6YxMkT1FK8qA0hvjWw7zvYROYOet5tcrHzB3z0iuKySuZXwmhqddJyhvc6Dhd2y
	FEZtn7pxGHyo27NqyaRnZHRYT+jRAYIK7BnAcyMCD+/dX9bKAyUOooKCyobB+6ZqhkFyfESZeho
	=
X-Received: by 2002:a05:6214:224e:b0:6e8:ea17:8587 with SMTP id 6a1803df08f44-6f0e5c84b55mr20662076d6.42.1744264142393;
        Wed, 09 Apr 2025 22:49:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF3oSJ0cAMrOma0aNj8l0ookyEkkm93nqZHeWGbUi2zEFDAzsFv+nBjyFl++iehgnLplpiGbA==
X-Received: by 2002:a05:6214:224e:b0:6e8:ea17:8587 with SMTP id 6a1803df08f44-6f0e5c84b55mr20661896d6.42.1744264142081;
        Wed, 09 Apr 2025 22:49:02 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d3d510914sm45087e87.196.2025.04.09.22.48.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 22:49:01 -0700 (PDT)
Date: Thu, 10 Apr 2025 08:48:58 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Wojciech Slenska <wojciech.slenska@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] pinctrl: qcom: pinctrl-qcm2290: Add egpio support
Message-ID: <6q6iftxcym6ubvtljaquwz2xllsvxyfhfkb3t5fifugedlb2c7@efpxjlyqfuk6>
References: <20250409080030.62254-1-wojciech.slenska@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250409080030.62254-1-wojciech.slenska@gmail.com>
X-Proofpoint-GUID: Kd__w_cM15unOMxJARj3TjDXiI1brSXv
X-Proofpoint-ORIG-GUID: Kd__w_cM15unOMxJARj3TjDXiI1brSXv
X-Authority-Analysis: v=2.4 cv=I/9lRMgg c=1 sm=1 tr=0 ts=67f75bcf cx=c_pps a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=seQdOu09bPYBcSS_nr0A:9 a=CjuIK1q_8ugA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-09_06,2025-04-08_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxscore=0
 phishscore=0 suspectscore=0 mlxlogscore=766 lowpriorityscore=0 spamscore=0
 clxscore=1015 malwarescore=0 adultscore=0 priorityscore=1501
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504100042

On Wed, Apr 09, 2025 at 10:00:29AM +0200, Wojciech Slenska wrote:
> qcm2290 supports the egpio feature on GPIOs ranging from 98 to 126.
> This change is necessary to allow these GPIOs to be driven by TLMM.
> 
> Signed-off-by: Wojciech Slenska <wojciech.slenska@gmail.com>
> ---
>  drivers/pinctrl/qcom/pinctrl-qcm2290.c | 70 +++++++++++++++-----------
>  1 file changed, 41 insertions(+), 29 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry

