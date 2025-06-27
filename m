Return-Path: <linux-arm-msm+bounces-62844-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C826BAEBC95
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Jun 2025 17:55:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F28003BE098
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Jun 2025 15:54:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6EFB72E9EA6;
	Fri, 27 Jun 2025 15:54:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nmao1MSX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D536F2E9720
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Jun 2025 15:54:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751039678; cv=none; b=eMc+D5zK4L5JnTJcGTk3c2mg0QrE0vBp+9l4qr6ChOJKcaTJuWdxHoJk1RkKR9GmVMibht/wFuEAxLhl+Ojx9gAenHZ+Y387rBLP7iQDnWA6UWOkMAePlKS+5AI6ONlRu0v9wdgopDS/iWNqgsW83l3Cjd386q0glXju6xRkKag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751039678; c=relaxed/simple;
	bh=S8bnZFwqOefSjfjbTJZ426XN8OOe081rliiCwRtOwVk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZBF8BlYSe5s2/6BYNW3M++yhf9mett9M+ty9CjXlaHcWy6ViCaSSvTtDLJaK3WMjIzmSHyL6FEuqbkznYhk6jZ6wrorVyvg5TviUZG96z78VUBwMSgvf4u8JrU5bRyQWnitIHSi/6rIK5DfpjkxRvmh+9/hV5I2khN0FQO87zYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nmao1MSX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55RCGOiZ015139
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Jun 2025 15:54:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pZr7iAj8/Dq9pOneeMlm+pgyY2ynqbotMAGjlAeCcLw=; b=nmao1MSXUtZjQUoq
	SDTHRsY0Hg3VjpLw/0Ii6jsLVDVb+o6Yohs8y3iHUebXf0FRWOQk/sjhIqZJBEBY
	BSo32OJ3lGaKxUevBvFPf56KEC7/lfJ8pBNAv2D1F7XYnaQcpdiQDhvfhyTtTLUa
	ACryQoaz9l4DhHiiNizuY9qmTnWFmSIdOOZm+Bhwi7pEu78jtRObXxWSPQkzbkr7
	6hLAhByJHsqGgfYv6o4x9hV1eGwsL1pu1qSch+fMTKpYF2mpUw7cbCeVr9XfhuLV
	SdoaqoIPwjllHbjr22wrAx2Oe6drE/2Vv2f0sFHDlO2CaXmEVdGj0lSD6dHuDHmj
	Z8Dviw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47fbm25xrn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Jun 2025 15:54:34 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7d2038aae69so4024785a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Jun 2025 08:54:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751039674; x=1751644474;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pZr7iAj8/Dq9pOneeMlm+pgyY2ynqbotMAGjlAeCcLw=;
        b=AKhunZ41thlQ6WJkZFMT+k+SxPr+AkTQI2Ksrab0qsXyv2F5QG4QIXFIXRi1hkpOwx
         veFChsnFqAZgULb9oo8iw9tFl2dqzRMsbFRTu5hosowmgByO+P4UUz8sC/DWygaxcySJ
         pnJEPdQENwUL7Xj3vVSckQYrkfg2pqH29PI20avz0G5NvZPf/8FitdSEqQHkSwIAeKgO
         Ppyyh7dR4zYvtGVeA8JJvGQ5guVegdCBGmuBHC9g0XnPTkSh9DTcF2c3i/656D4G9Vmn
         jRX4cS3PsjoQZvVQuTH2IAE4mYTZIug3EgZ7bnYOnuNak9bZg7ofBu/btEj8uDc0J7Ay
         KrGA==
X-Forwarded-Encrypted: i=1; AJvYcCUwIiOcP08Tiu7SRCVZfRJvY+cV5ix80c/vUuTSl+F86QUHZTbaQYIvXBehunr4HPmU0BriLQksFkCoKrnd@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9q3TnZccdcoT9L9szbuKL8fyU3DPwlViwAczGR9mcvYwvQzsx
	xxKm2/UdgbCTxfw8yAqmxmS8cRbdDdjVrRUvfJ9eKSE+jhZxnygYvRlx8qdFhVM1jGRj5Glx18s
	DqY1kVO/huUyVbQdCTz0RfciQAQV73iNhQURBeknWWvugCCCINVEJfDHb1sSCLdQwAVOT
X-Gm-Gg: ASbGncsGIENjyAOo3bGcKxPS6HAEKGKkQdRim+6iAqxRoIYvbKbQp7p9LxLm1FIpNk1
	yTThRdhIEJtahxuo4qIdtKpZyIFv6mM0aA9gL8TkPCf98ypoz4r8U22Bv/pRElv9nifneNVHl88
	AesIlzcEzmdWr7xe+mPODftNa3yR6LxvW/VRvu26y+f+1vJHgrjmyKgAhBB/SehD8tSLzCrn+Eh
	q5Xsht3q/+5mMBfKVyEvAXxlu30FfD2Kv4v2lrCnR/l73ixQVxwueLs/2S8VOuGNlZMQu/0OJBV
	lFJADCQ51t1xpCvKsELCVXiqvWNrjXdYMcoJujPfvoiFyuvwMN64IUoOWgMVGheId3KKTuJgPs1
	m0+s=
X-Received: by 2002:a05:620a:404c:b0:7d3:b0a3:6aa7 with SMTP id af79cd13be357-7d4438e31e4mr210380885a.3.1751039673922;
        Fri, 27 Jun 2025 08:54:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGnVBSJATURZomyb5icuOPlYo1v/x1ajNUslEnC5Ai/XTvP7ZKMpfHMiKxOU0P7qaWYMS3lXg==
X-Received: by 2002:a05:620a:404c:b0:7d3:b0a3:6aa7 with SMTP id af79cd13be357-7d4438e31e4mr210378085a.3.1751039673452;
        Fri, 27 Jun 2025 08:54:33 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae353639bfcsm147793566b.11.2025.06.27.08.54.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Jun 2025 08:54:32 -0700 (PDT)
Message-ID: <68c06500-a776-4f56-8514-c180b23f7715@oss.qualcomm.com>
Date: Fri, 27 Jun 2025 17:54:31 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] soundwire: bus: add sdw_slave_get_current_bank helper
To: srinivas.kandagatla@oss.qualcomm.com, vkoul@kernel.org, broonie@kernel.org
Cc: yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev,
        lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
        krzysztof.kozlowski@linaro.org, linux-kernel@vger.kernel.org,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20250627155103.441547-1-srinivas.kandagatla@oss.qualcomm.com>
 <20250627155103.441547-3-srinivas.kandagatla@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250627155103.441547-3-srinivas.kandagatla@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=YYu95xRf c=1 sm=1 tr=0 ts=685ebeba cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=7h2XZbHhf3WDBbgsTHsA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: 3OnV3oggksSCTMY0YsOndKPfQWQ3addM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI3MDEyOSBTYWx0ZWRfX42nA4vr4IM9h
 8oTscSSyuEuffT79eL6myie/wG/SJrtQ3jvN6lEi47tnWhv4ojLgHP6bx6TrsEOISyr+1RDWyA4
 g68OgqEhMcUGjZQyz/KaYfsUS3wxaRc4YJY3Rb+GvwWYNvMCxoTJ4fQvt39EuMI6k/3GTs3NIog
 TIZRVIFipi8gR5GFDkEyV+TslOY3lsFwESs8V2FQuMGNKiiyIN0OWx6qC8t3oC5MC5qPAW3/TsN
 CXDSfMGCAZhxIX6sQxG7bEGzM1OQXa+1yl5Q6qSpr2hj+4npM7ZgeUfBkfGCUJ/V+uyj8XBcbaI
 uR2ywt/1zClm6O3u8twjw0j/n9m7aPUKHL4ucFyJD0/j+Gf/G75w+AjHFJl+SqvMNKRE/eZ1n9N
 awvlcVN8T5Qt/dWzL4xo6WTBczNRJ0Z3GTQRDfUvix0z44fCNuf6a8CgKNHBda0nXFCCyqAQ
X-Proofpoint-ORIG-GUID: 3OnV3oggksSCTMY0YsOndKPfQWQ3addM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-26_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 spamscore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 priorityscore=1501 phishscore=0 mlxlogscore=999
 clxscore=1015 mlxscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506270129

On 6/27/25 5:51 PM, srinivas.kandagatla@oss.qualcomm.com wrote:
> From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> 
> There has been 2 instances of this helper in codec drivers,
> it does not make sense to keep duplicating this part of code.
> 
> Lets add a helper sdw_get_current_bank() for codec drivers to use it.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> ---
>  drivers/soundwire/bus.c       | 7 +++++++
>  include/linux/soundwire/sdw.h | 8 ++++++++
>  2 files changed, 15 insertions(+)
> 
> diff --git a/drivers/soundwire/bus.c b/drivers/soundwire/bus.c
> index 39aecd34c641..58306c515ccc 100644
> --- a/drivers/soundwire/bus.c
> +++ b/drivers/soundwire/bus.c
> @@ -1363,6 +1363,13 @@ int sdw_slave_get_scale_index(struct sdw_slave *slave, u8 *base)
>  }
>  EXPORT_SYMBOL(sdw_slave_get_scale_index);
>  
> +int sdw_slave_get_current_bank(struct sdw_slave *sdev)
> +{
> +	return FIELD_GET(SDW_SCP_STAT_CURR_BANK,
> +			 sdw_read(sdev, SDW_SCP_CTRL));

sdw_read can fail (miserably)

Konrad

