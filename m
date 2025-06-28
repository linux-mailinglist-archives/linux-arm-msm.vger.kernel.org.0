Return-Path: <linux-arm-msm+bounces-62894-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 50A3BAEC40B
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Jun 2025 04:02:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BB3D5562A13
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Jun 2025 02:02:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC75F1E2602;
	Sat, 28 Jun 2025 02:02:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="co8Fj+sB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 396781C8630
	for <linux-arm-msm@vger.kernel.org>; Sat, 28 Jun 2025 02:02:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751076136; cv=none; b=FDkl+0cyWYLmgcd7tg6Px7x/ZFreNa/96NoNUpYp3+H4NNFjVJthqNekquqb48mfuFm1Lx046O/ilrw9s17GxeJ4mhGqb+2KJ3aAXfsw9JlXqOg4d421gXOiqtixQBu//pm5G0dI7riQE4Kdzmk7kwEwKa2j0/dMbsR5/RNv+QM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751076136; c=relaxed/simple;
	bh=sNp9pe+T/QSoanxRAXrWpirOPqJeTwmcsYRvUmHMWrs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QZ+tDXz86Iv1tSq6v1qH0ZErtt/bhPBdDdT1qstw7hRBDJFAaKMP9WH9RJOxEakmghlAN6pzj2gNl3aWDRxyFrX895EJwj6yDt9+O6NUp/hie1hCyId3W+CQmWagit7AiaRjTkrncxwBQ7GB1qHoXU4VzNOIdUIFZk7itwpCxbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=co8Fj+sB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55S0DDSk008203
	for <linux-arm-msm@vger.kernel.org>; Sat, 28 Jun 2025 02:02:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=w6cFaqnSskENYcVsGiQcJv3y
	zw/fX5DNOuINgCjQrrA=; b=co8Fj+sBfGcMwktx6wTkh5muUp1Fw7f34NtoYTW7
	bQckDEa43cN933Q7h/1jkGS+1VzMysn7cyH/MqIDx3hsV4QEfEfNNr/2AL7QV/Gb
	E+AQj2jsjIP6JkHPyyNrYhiuTyoGoW6e392BjBn1oGeDRs/bv0XuyE7ywc490FcN
	aZVVlMnvfWvBcP9ojaNBB4A0Rmb60wsF2+L7hdqkclVJsYX1gK7aYjlwJzQmF4hx
	cSimVv8zwaTNv6eQXMxoD8gPoxIE6EA920k3h6xFYyrQjXKn2zBfyCnsxL9o7g/3
	7dm3ZZJq7Yo8WhbZxi0AuVtr77pYLYKxFNQrRWt+jcFykw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47fbm26yu5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 28 Jun 2025 02:02:13 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7d38c5c3130so63058685a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Jun 2025 19:02:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751076133; x=1751680933;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w6cFaqnSskENYcVsGiQcJv3yzw/fX5DNOuINgCjQrrA=;
        b=a4viPVNOga4YyHwkQsiPxStjuY2437GoiguL8OXw4Uj3mS8NjmlWvqduJlkpomWbxG
         5Es7YB9ZhDz9rupVPSPcwsK0VkL2ze8A6Xyy61isfilgoveGPj0tmq7+a/vklfFKIQvL
         RQDA5J49MQ/9FPOzRsGH/JIVnVj4Bb1KSJLrq80UitPwYXKrlnp4UQnPWGrwKySAa1Dp
         e7lLB/3KHJDa+Ka5TAwJ2H2bfFKeoyVrsHBv6ZVBjl1qJLc8vf/k3HqQ/fQm5DsF9a+7
         rE6+TjPeuUOO2Ue48UoDmmGR9QFkQY23qynymrrSKGKqfdNM1l2c6Vs0X9s0ijdFzJHA
         Ef2g==
X-Forwarded-Encrypted: i=1; AJvYcCXPHKQsfR8HxvKFvkZ/cUejj4CX+ylJ2VgD8zKc5KtqLR6NKZljn8Q7sy49cp9BDaNqzVSGRSN6of0SbZzk@vger.kernel.org
X-Gm-Message-State: AOJu0Yyl2wGheAe5Pg9OfmLF8FjvAOEX5y3uIE77APyqaAxi/DKk56xp
	rivuAV6MzkKUwr1cyqojAj0oUC8WHEMQxRjeB2YVEwFHBS0r8k9sgvL0Sp3rwfaiMs9Edjm2vSO
	/cRD/j+VC3aNtwrtZ5wf+46zGnIUw3hMYb4/60KQeZD69MS0jgpcuyoy4tnL+Tbnsu/9n
X-Gm-Gg: ASbGncumVNJx4MpkSwmsCnLlcz9jftXCMqtuc/RqBZ2sTeLomolXFqq+306bLTc7XR8
	a9HxzJJ9yR9VUlLatZ+6FKbJPKcnXHmZ8iIirWYjPKWvnjebNeEkuGfE9SY8jc30fSOHzovY+xx
	3HIbOEvuieePG0w6frVVnldjDbSNNcjCdzVSDBLMN3vvFRFd0TAKcmFsYTqTtvpFoBx3rM1oW+k
	sOpzgm2+keR/0tNGUfWUjl7Lhj1Z1PcnH7aglsmxzT6OidJ/q2yYpUBlraZr+txonpBKqYMg794
	yZV8DTTERjN5YborDRDW80fFOyD2x8J+JSh2+LlBU1lCrb8w+FZHGjDgxqSMBDQ8AJX7F5dtsO4
	w+RtRyAq94EWq1vEzcD3N/CZh3w5nfAmRtuw=
X-Received: by 2002:a05:620a:aa17:b0:7d3:90ab:800 with SMTP id af79cd13be357-7d44392359emr700974685a.4.1751076132886;
        Fri, 27 Jun 2025 19:02:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF12VuS84LoNNAk+G2kfyBlFl+od3zmjm4qe4Mm6a14+ByrTTticLF4T4ykVkcNtc/sQk9zmw==
X-Received: by 2002:a05:620a:aa17:b0:7d3:90ab:800 with SMTP id af79cd13be357-7d44392359emr700970985a.4.1751076132462;
        Fri, 27 Jun 2025 19:02:12 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5550b2403fasm649184e87.37.2025.06.27.19.02.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 19:02:10 -0700 (PDT)
Date: Sat, 28 Jun 2025 05:02:07 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: srinivas.kandagatla@oss.qualcomm.com
Cc: vkoul@kernel.org, broonie@kernel.org, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, lgirdwood@gmail.com, perex@perex.cz,
        tiwai@suse.com, krzysztof.kozlowski@linaro.org,
        linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 1/4] soundwire: bus: add of_sdw_find_device_by_node helper
Message-ID: <cy5cpzoidygeptqwxvnnjilads4npayv2zvu7hfff74defmygv@zglnb7ur4rw2>
References: <20250627155103.441547-1-srinivas.kandagatla@oss.qualcomm.com>
 <20250627155103.441547-2-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250627155103.441547-2-srinivas.kandagatla@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=YYu95xRf c=1 sm=1 tr=0 ts=685f4d25 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=wpCz0eZ45CY81w7ywFIA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: eo_jXaXzH87vlcl5VM93Y2v13wUYLX4z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI4MDAxMiBTYWx0ZWRfX3wbgXPrPMOHw
 zPtVyvJ1B5potUWpsMRCrdRpBw3whvsfefAwQqWTQIqQsd9Qj8boSzsxUAruxkUHS7Zx7VduGct
 2UaPtbC7oxLmTT1AjuRNwWhGx0cruuZTCe6tUcpAn2YdNJXT/nvwQ8ct9nI72sEIBzkG/oUXPtR
 rzOSOJhHaZkD0gb2LWeLXQnqV6zMcb5QhUyVncUVmQlFfjqeDL0XsHz+whZEL+tFjleLrdOD8pS
 nAqCnEoC7GjKhAZYtXjmZLi4nITqMhMk+axK0+z8RBpYEdwO5KKhoNeZI2gbKYBEO6MxO9sVbzE
 V0mpldv3YUCLNzOrg2pL56d1atjBJoNi/dnVOIRGhs81g+ackaFS8kElqsNurs681tfRhoU72cT
 W8iMGz9/5sQmYcvdj2JXS+tQexiiwiFmoYJiw/KuKLH7Rv/5q931CkhRBw5U1zwS3gnP56TC
X-Proofpoint-ORIG-GUID: eo_jXaXzH87vlcl5VM93Y2v13wUYLX4z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 spamscore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 priorityscore=1501 phishscore=0 mlxlogscore=681
 clxscore=1015 mlxscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506280012

On Fri, Jun 27, 2025 at 04:51:00PM +0100, srinivas.kandagatla@oss.qualcomm.com wrote:
> From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> 
> There has been more than 3 instances of this helper in multiple codec
> drivers, it does not make sense to keep duplicating this part of code.
> 
> Lets add a helper of_sdw_find_device_by_node for codec drivers to use it.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> ---
>  drivers/soundwire/slave.c     | 6 ++++++
>  include/linux/soundwire/sdw.h | 9 +++++++++
>  2 files changed, 15 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

