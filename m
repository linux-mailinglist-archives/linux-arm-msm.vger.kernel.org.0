Return-Path: <linux-arm-msm+bounces-63236-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E63FAEFD11
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Jul 2025 16:49:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 23861188A0FF
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Jul 2025 14:49:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E347277C84;
	Tue,  1 Jul 2025 14:49:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kUEXXjWR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63A75275108
	for <linux-arm-msm@vger.kernel.org>; Tue,  1 Jul 2025 14:49:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751381376; cv=none; b=obMLM2QA6jPdDL/F6Y6bZ22UV4yeMmDJ1FYstAovORhsYYjnULWFldBroKTdkCIRSnL6uyzVjBeBi6GLN5y1Zscho+vEinXvYVxxqJHwpKu1yBr4T7NUScZnqzxS0T0X/YFGaNg/kwvNPTM+hnDRhMVzk4zpv3vmU5Mshed9mcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751381376; c=relaxed/simple;
	bh=e8cofJFzf1imC1xcaAYUYmQi7KXDT/mVIdcDBWP3M8I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Z0oxjy7+Z+fOJk90v6mN0NLKgOa9i7Ii48TbVAbzjms43O9Hvg+SsdMiHIVViSrD98GWZNRPzvOdwaicQnd90iL0AB8vBNkrqpHqxwYIh2NqA2thoNs8NQuOMblOev18FbD6XGZPzrdJwRPLWVZ18IRdTDX62PENHapGuHEsngI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kUEXXjWR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 561EHoqM010475
	for <linux-arm-msm@vger.kernel.org>; Tue, 1 Jul 2025 14:49:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rGmB+YfykJEgHd/lXi7FY+QDtnoGkDNaBJlLAV3kCVQ=; b=kUEXXjWRWGbQa9Qr
	r003MGh6bnCm/U9M6kQDeZMtgTiFPgdiyzAxD/uqG0MkynGqevwcoXh6SnT5nM4O
	TJRcpGDH6GCbbUN/R3l4ReqRfSmbecTz3FyiaUCYkA42H+vqZR7IdkCSEdgp2eme
	QSm2NMRKJjpj2S7RL3m10Xrw42NuUrb0E3zW8lbv3bVztyRNgT9ERSexM9AEfQel
	pUgezVzsK5OirGkybTbMz6flVssAKmep+jmdCn48johrd2u26d0aW4GK0Zq7qS4J
	2cZ2Yoojq1GoG8wGU8yZHFk1Pzs19Aeg1hXXnG9qjDIGzP7XxiT2rflPjRGwLWtR
	festrw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j7qm98g5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 01 Jul 2025 14:49:33 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-234f1acc707so26202045ad.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Jul 2025 07:49:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751381372; x=1751986172;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rGmB+YfykJEgHd/lXi7FY+QDtnoGkDNaBJlLAV3kCVQ=;
        b=lP5ExGihEJAazGnKDoEUKcpFMAwsiRIQNsmKr5t22+k6K+YMKi60i2CUUr6woZXRLk
         3xy3u5W/L+Bbh+mvlx78mJhEhwD7DpZg9Yw+VIV/mAYmH7V96hmpWGcLfItGj2gNsehh
         pM0AoH7EnVSMT9jw3An7KPb3jGFS9QxxO2HRUBh3gU3mCIkoHHXIkYu+Sle4vF+ys+S4
         /lSL0NOq6Mm184qz9g5AkWJVgBeH96NdB1APrOK8jVexxRtcLWkJdCYSlOS6wdlxBoOt
         gKUb/164NdMrDVegOAlBinuGgUaPYALYMX9v9ZHV+SrSTbkzGARGuph7HetH7fbN9LBH
         HvIg==
X-Forwarded-Encrypted: i=1; AJvYcCVvaWNyUZsabst+bKw6orFmQYvjAAWd9MazUIK0jmsk3y7xjQ0nM1xV8dhshHrNDbEO9N/EiShXSbAZc8h2@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9BnU4bNnja+Rzk6E8ek1ItnCZ8n8e2kUK6u5uLiZQVQSquOud
	rdxH0MOylkTTa32WxvG25ohhaX7yRTSsKCQJ1hwTIpjwzthjonU/7JPwLO+K3yvksNVHOXGXPVz
	tncy7XIeQw6Vn9mYhJNwPNk1EeJd24JNendOK+zoHPxL/DkKmroYKIBVdoMJEoVw/4Kky
X-Gm-Gg: ASbGncsWSxr0Co0K0NbCB17CbZ10yhNGIHyGszw9msSd9MdCePiKzm6phJHbeFsBz72
	csnuZi/CPWFX2LfCclzYJPNXfM+G7pBEdGMrmHvHKf3r6MyKe8zx/BWJ90b5dmHDWmd0kqO4Bpl
	FlJiHgOZwXH4Pb2tc7NNW04AL8w/WhHKVHwPSzc4EggqCfIrqlJQhZ/MhSPKKdDY9opOul6P7IM
	KKST6kPjPNnK0gTi0YvmKbs6mdbH/b788CSNBY1PPbCfVWrPf6P4IQxOa0lTaSNLoi1e0Qx/y5a
	51BOHGxuHKvw7Q0nDBAgW4hDhsJc2bFqgCOgHO83Bqer3EuR/EfdUBumd3SDjII9BtFtMvso1ol
	qgkbWGjy5ZP/wphE=
X-Received: by 2002:a17:903:2ece:b0:236:9dd9:b75d with SMTP id d9443c01a7336-23ac4606753mr303424245ad.40.1751381371761;
        Tue, 01 Jul 2025 07:49:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEp1Ad/hhib51T+HK2hWQlQ5i/UENf7EU+ytKDeILLwtSvTV3KWZcptdDryg6BFVQuicGgoIA==
X-Received: by 2002:a17:903:2ece:b0:236:9dd9:b75d with SMTP id d9443c01a7336-23ac4606753mr303423845ad.40.1751381371312;
        Tue, 01 Jul 2025 07:49:31 -0700 (PDT)
Received: from [192.168.1.111] (c-73-202-227-126.hsd1.ca.comcast.net. [73.202.227.126])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23acb3b001csm106117515ad.154.2025.07.01.07.49.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Jul 2025 07:49:30 -0700 (PDT)
Message-ID: <855ae20a-3675-4cce-b87d-6f25fb69e0a8@oss.qualcomm.com>
Date: Tue, 1 Jul 2025 07:49:27 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] bus: mhi: don't deinitialize and re-initialize again
To: Muhammad Usama Anjum <usama.anjum@collabora.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Jeff Johnson <jjohnson@kernel.org>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
        Youssef Samir <quic_yabdulra@quicinc.com>,
        Matthew Leung <quic_mattleun@quicinc.com>, Yan Zhen <yanzhen@vivo.com>,
        Alexander Wilhelm <alexander.wilhelm@westermo.com>,
        Alex Elder <elder@kernel.org>, Kunwu Chan <chentao@kylinos.cn>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Siddartha Mohanadoss <smohanad@codeaurora.org>,
        Sujeev Dias <sdias@codeaurora.org>,
        Julia Lawall <julia.lawall@lip6.fr>, John Crispin <john@phrozen.org>,
        Muna Sinada <quic_msinada@quicinc.com>,
        Venkateswara Naralasetty <quic_vnaralas@quicinc.com>,
        Maharaja Kennadyrajan <quic_mkenna@quicinc.com>, mhi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath11k@lists.infradead.org
Cc: kernel@collabora.com
References: <20250630074330.253867-1-usama.anjum@collabora.com>
 <20250630074330.253867-3-usama.anjum@collabora.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20250630074330.253867-3-usama.anjum@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=C4TpyRP+ c=1 sm=1 tr=0 ts=6863f57d cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=e70TP3dOR9hTogukJ0528Q==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=QX4gbG5DAAAA:8 a=IWbF6JPFI0dN2yP9E1IA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-ORIG-GUID: My-GjWU72XObFWiJxie9fEs0175zuECP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAxMDA5NyBTYWx0ZWRfX2nDpn+5qj5pD
 aNHBAWCqDem/f029UyA4bb7iWVsi6tAr3OpjVGKPKsCRWST1RlNlEu4Oa4zAXQlNkK2jFnNWB4V
 OGt/5llagec4xI6IlxSwr687q8mnj5rgrgDfYWHdqQ590LDIWzc5faKGLpN5Vp+tjUqT/i6Dl8L
 Uez6szwocAxa8ccl+J46nFTBczS/AbvnEiKzKNFL99x/CafP7OFBR1Z+CKweBc20l6KFJJYyUAg
 7FYtyGjueDbM1nErmbGaqQaBtovwfdGOglBY5V67Xqrg0bEp+Y6EvsxISqRdmeNhk+tZu3kDKFY
 2mDi0GVHI1fHcS5F/k47Vs62qUFPERTVu3M8MMZOVGKG7dZu6XYkqsw1OpRxP9SA+fPwyu0kWYx
 npseGcUtPKqQOy1hdIDjD1RcgMkmgtzX4JZdVG2smDNYgmoIY5sBeZM6FPNQW/AGoaE4Y1yC
X-Proofpoint-GUID: My-GjWU72XObFWiJxie9fEs0175zuECP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-01_02,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507010097

On 6/30/2025 12:43 AM, Muhammad Usama Anjum wrote:

Subject has incorrect prefix, should be "wifi: ath11k: "

And ideally it should mention HAL SRNG since it is specific to that allocation

> Don't deinitialize and reinitialize the HAL helpers. The dma memory is
> deallocated and there is high possibility that we'll not be able to get
> the same memory allocated from dma when there is high memory pressure.
> 
> Tested-on: WCN6855 WLAN.HSP.1.1-03926.13-QCAHSPSWPL_V2_SILICONZ_CE-2.52297.6

not quite the right format since it is missing hw version and bus

> 
> Fixes: d5c65159f289 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")
> Signed-off-by: Muhammad Usama Anjum <usama.anjum@collabora.com>
> ---
>  drivers/net/wireless/ath/ath11k/core.c | 5 -----
>  1 file changed, 5 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
> index 4488e4cdc5e9e..bc4930fe6a367 100644
> --- a/drivers/net/wireless/ath/ath11k/core.c
> +++ b/drivers/net/wireless/ath/ath11k/core.c
> @@ -2213,14 +2213,9 @@ static int ath11k_core_reconfigure_on_crash(struct ath11k_base *ab)
>  	mutex_unlock(&ab->core_lock);
>  
>  	ath11k_dp_free(ab);
> -	ath11k_hal_srng_deinit(ab);
>  
>  	ab->free_vdev_map = (1LL << (ab->num_radios * TARGET_NUM_VDEVS(ab))) - 1;
>  
> -	ret = ath11k_hal_srng_init(ab);
> -	if (ret)
> -		return ret;
> -
>  	clear_bit(ATH11K_FLAG_CRASH_FLUSH, &ab->dev_flags);
>  
>  	ret = ath11k_core_qmi_firmware_ready(ab);

does this patch have any dependency upon the 1/3 patch?
if not, then it should be sent separately since it should go through the ath
tree instead of through the mhi tree.

/jeff

