Return-Path: <linux-arm-msm+bounces-62893-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 84675AEC409
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Jun 2025 04:01:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EAFD4562850
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Jun 2025 02:01:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3190228682;
	Sat, 28 Jun 2025 02:01:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jl4H4ZzU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C50822BB15
	for <linux-arm-msm@vger.kernel.org>; Sat, 28 Jun 2025 02:01:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751076111; cv=none; b=dn893uRgqPEmxzn2+58lUeg9wiK6cBwSluJfFdnKG0LnmWnvbneBTK1fbuCO8QTidTjOaubn+5ikTGePgX7jbkMccNAQsao5D++GMTidswEGz/6ecyYwpHEPyTLD7vpHSjn9hBq5GnY74qdAT5Pdsfi9p8aIorsjjxpd0sygBGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751076111; c=relaxed/simple;
	bh=YQKufK5B37dPWkLPPT5+YvQ4CcXXjfbMBWtmXldNfS4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AVqJjfwN+mISbx4RkQc2CTUyR+G0NzL20Fy3zSDbO2o/u1kv8iIjLOi18Dsj2e3E95inFM/ub74ekC3UoUMn8Jc0kCyDIZWw6CaQpCR4Aj20pPkJAjSd801XpcgBdi+L/ZzGHNLTqAGsw883Mx7ouM3aaS59ASuHseGjs053BYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jl4H4ZzU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55S0hCg0018500
	for <linux-arm-msm@vger.kernel.org>; Sat, 28 Jun 2025 02:01:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=wOafyhq0+mdzfsSrGok0cyzw
	J2NOz0wUDRPXuIS/tqM=; b=jl4H4ZzUqL8foLddZfS+0QS7JAgWW2lnfJFviL7a
	trNiy6130IGXaOMhNSXB4KeuYUmZ/0SliN3ga2lNtalyf0JiXw3ftzJxfe14GsSq
	/xCKoFa5Gk2MwwS/onuRFyd1IL3CnQhnmM93uPW4niHWaJlUY8OYfb559ZwwCb3C
	QJCW8/Hbc0ZslyPuPa/EIH4//A7gTEq5HfT668mwzA9E3v+pm+LwUJCvXCJsFs0T
	a4dt5a5rpctekYlp75ek2fnort4K92p1ubtaR4gKT0BlckItkOW79ede3BbuKSkL
	8GozKSpJJR/ayFmKPiPK+pzwTqzbzeFzEOS5llzwqQ482w==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j63k02sm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 28 Jun 2025 02:01:48 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c5bb68b386so718557485a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Jun 2025 19:01:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751076107; x=1751680907;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wOafyhq0+mdzfsSrGok0cyzwJ2NOz0wUDRPXuIS/tqM=;
        b=p4+NdRN7tB5WzW0ftn557J0GnBVT05dOoAIUKpVcGhNHmp1E9bW06raxE9iWtK7mwh
         evyhnusBxKdVsUMSdL1g6DMo4ZKST/N7Mm+3fqEEmYItmypfB5Bu91Z5gWZP8L2Gg0ms
         oXX116QbidTpbte00cPbj+9PLPOTxJmw9WmMr5uhQoCK1Si2ZgIBSbG90EiT4I45fH71
         oQ3l8kHGiHbWdE/vITDxqPNx85sx3aQ31KjPIeJIKYUm73XCuDg1rJu6yaCO+AvHS5dv
         CSWbjvMx6V12bHLsg5U4d6kcmXMSre4M7jjbTi/+2GMUyiKXakpM/JUOCI93ZGprlM3E
         1Niw==
X-Forwarded-Encrypted: i=1; AJvYcCX0dffyDsYS9Ob5QxJXu8GeLZ7es/F4TFSM0aEPptu3Te8+o8W+rfnJBRZ2jDWuV8eoLX7uW2puAABRz0t8@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4PpbojMPHP9NpLmncWE6ql7OkJiMBOTSJMlZjIJSU/q2kq2pD
	mlBZQdDLJfbSNxDpmLmBtpZz1YwjJUWtK32GYD9GnW387+urSAy1+dDqa9J8avNunISHPQtWqK+
	UIp5OumwQ7qdC7hhpweZh0JcZ18y3tCs0qYhg59gH3JPR9j7tXI6lQ6/epi91ynzHdg+g
X-Gm-Gg: ASbGncvlpLhlzb7YgrM82HlPYwFoLxN4CQYIEL1PEYiPmXqtBC7d2dsoczgHBrUhaJq
	pKE0GKyPREZE/SfX3jR787oMWA6II9FKZUOPQN4/E9s1rK84Zj/fQ8B8rQlreI5Elguq4Ocx1Wb
	CMv/+tYCXk/m4GGWScxGRfa8I25uKpDS5dQ/G7Bo1sUKPYLlQLYA55BDv+JUEWYmXbp1pLbsHDw
	WBqSFR8kzgJ0kZK2wi25mf2GpBo+Nj7zGd0UhoBkRHtoz0Te5Afr3pHtMdooI9IPCIQHWeyZt0q
	Xug5a6cdIuXC+WgxBFSBY8DEso140h5T3pREdIp2Di3srGfGQO1oquS4z/7c0bSqWcy3ZQ86Dh9
	yv+mXwSVUakdy465FNrwZ1h7xuuHuvcDmDEo=
X-Received: by 2002:a05:620a:25ce:b0:7d3:8d33:f550 with SMTP id af79cd13be357-7d4439a6a1amr774762385a.42.1751076107415;
        Fri, 27 Jun 2025 19:01:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEQy4V3LUj6cP0goe39au344YNAhL03BMEkFdvQ5aKk+4bNvTbXNYZ2qFiGlHxlzTCN5cXEFw==
X-Received: by 2002:a05:620a:25ce:b0:7d3:8d33:f550 with SMTP id af79cd13be357-7d4439a6a1amr774758285a.42.1751076106960;
        Fri, 27 Jun 2025 19:01:46 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5550b2cdce5sm645109e87.164.2025.06.27.19.01.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 19:01:44 -0700 (PDT)
Date: Sat, 28 Jun 2025 05:01:42 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: srinivas.kandagatla@oss.qualcomm.com
Cc: vkoul@kernel.org, broonie@kernel.org, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, lgirdwood@gmail.com, perex@perex.cz,
        tiwai@suse.com, krzysztof.kozlowski@linaro.org,
        linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 3/4] ASoC: codecs: wcdxxxx: use
 of_sdw_find_device_by_node helper
Message-ID: <skelt3xhnonz2ixhik5dvrmg5tpquoxmioeeem2gs5espqcykj@eh47grxbpvuu>
References: <20250627155103.441547-1-srinivas.kandagatla@oss.qualcomm.com>
 <20250627155103.441547-4-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250627155103.441547-4-srinivas.kandagatla@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=ZKfXmW7b c=1 sm=1 tr=0 ts=685f4d0c cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=XXM5SuZbuiGnn3J7RH4A:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI4MDAxNCBTYWx0ZWRfX4QMStgeRvcuA
 yHlByFMGffZvy0gsxwn8/10rnzf9Doj35GVcEQ4JwVuRlOQSjiE26xQfplzewP6eIvFLc7XCQ/N
 85iYOyI9fxJSCxy2E22jfQHCv8oDFH3xBmgivFqtEN975zxQTbiNAtu6eAfbN42xIFpl/Znz6U6
 /rAzY7gdMb9Rub6KBt0qgpafZfzDkF34nTvfGzpa4Aipb5Tj8REEWrRtzf9Wqd4T65LAsKVZ9wX
 4ulKrt8ZTl893tfyoH8PQ4/NG5pkUkP+vHMOxhgEzvLIRRROBYYJn6MvLnjH5Oic4MXigFI2WhL
 OklO6dk2ASn5JgKy+h/hEnt+Qu5F2lh6nYQYOpRkvHSph/ZDGbV9VayDl6/OfVMxoboxohUIMW/
 UxPfeCYLo9Rno106dAH2LaHy4qSJkmagq5dul4jvZ1sAWSXyOBwlZScGIg0z1zm9bA7166YU
X-Proofpoint-ORIG-GUID: SVBnItFmG24WrWBnf0WNY4uPj8ZWYqvT
X-Proofpoint-GUID: SVBnItFmG24WrWBnf0WNY4uPj8ZWYqvT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxscore=0 mlxlogscore=507 spamscore=0 suspectscore=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 impostorscore=0 malwarescore=0 clxscore=1015 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506280014

On Fri, Jun 27, 2025 at 04:51:02PM +0100, srinivas.kandagatla@oss.qualcomm.com wrote:
> From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> 
> use of_sdw_find_device_by_node helper function, rather than duplicating
> this function in every codec driver.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> ---
>  sound/soc/codecs/wcd937x-sdw.c | 6 ------
>  sound/soc/codecs/wcd937x.c     | 4 ++--
>  sound/soc/codecs/wcd937x.h     | 2 --
>  sound/soc/codecs/wcd938x-sdw.c | 7 -------
>  sound/soc/codecs/wcd938x.c     | 4 ++--
>  sound/soc/codecs/wcd938x.h     | 6 ------
>  sound/soc/codecs/wcd939x-sdw.c | 6 ------
>  sound/soc/codecs/wcd939x.c     | 4 ++--
>  sound/soc/codecs/wcd939x.h     | 6 ------
>  9 files changed, 6 insertions(+), 39 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

