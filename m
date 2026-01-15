Return-Path: <linux-arm-msm+bounces-89186-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A927D239BB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jan 2026 10:37:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3B17D305F62A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jan 2026 09:31:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A989035FF46;
	Thu, 15 Jan 2026 09:30:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XwRmoqbs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QIFILosX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F7263346A0
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 09:30:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768469457; cv=none; b=G8IoGdrFxE2a7431bdsHmo/P4zz/jxEuVs/nPGgVy0z/6BPv9RroWw8yW4n6q8mPY9owR0bgSa6IeQssX6jlGl9NNXc8Eu7z54f9Y5X4I/LdTjqDovcyqDO3pSO05sBnbiRj7CdBAVlbZj9lxazWB9KyU2xm2dkQAO2hUkyS/Ow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768469457; c=relaxed/simple;
	bh=DauQk9p5pIosUBhPuxMl4TQB9wnU7vTST03SGF1cKT8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qA/YOmlcnA/fbnxh7ucCnfFXGM125wGZgiXKUTA+ckukEyY6ImUqWStoHTCkJnwlh1shco1CDif6r0FpNpqcHpu5ylp1RFWl8MREXliUqBhj9wecsacwjCcgAutbkhXfRnd11A5AbQZd0tBxssYrogEZwb83BKWpZekcnIfNueQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XwRmoqbs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QIFILosX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60F6fw4p1991681
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 09:30:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6UFfVn4U9hhL7GUJ/TzKS7TheZ9cYLz0xB+kdpbIWKA=; b=XwRmoqbs/d+v5A/t
	JklcSpWok4LGHzCBTmDNS1eA5Y/xK7NQmGNfdxzyTkDDsM8Yn0SBmar9vQX04GhP
	CwZ0uLlKHBpPj3dAKZGq8fYjZUxXa1aN7roM8ebZWk0tTyXJbL8WbM9Yj8ZdhJdp
	rnKWNMefi9FZZnR1sxNJCHGTbD/a0lToh2ikzH6KgrrvY7A2r/Tt+hM1NxT1B8yU
	gKhTFenDzFV/ffLKlPIzw2CAh1Blqh5s1ptLfNEGQbmREOUHhRDo9h/OOi8XOeVD
	nzqwXClqqn/fHaFkQoo/dZavxuQKN6Nf3GYM6hZTi2kZKjPjKP4hvgC1XKhoaLL5
	+1i5Fg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bpbdbuds4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 09:30:53 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5014549e7d6so2423861cf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 01:30:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768469453; x=1769074253; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6UFfVn4U9hhL7GUJ/TzKS7TheZ9cYLz0xB+kdpbIWKA=;
        b=QIFILosXRByNAwIwXJGW6CuYKFbtFxpGucnwRRONnIhRVA0CsCPzj8LjUCQJLnZ2ML
         covnnqvrh0woVC/njyng87QOfWr7y3UCKMFMtvXkG516VXgdzsjUHkOELlhsnzgboq/7
         EvUvKXwEfhiVqIijaRlAL4TmGeDgi226n30bmlShV25V0tQhPRH/5IK7n5iu4ifEyExK
         pP58F3Tov7wPGJgzSjItGBGiE3H5t/dYzoBfjtinJ8oPbTQ6jQYlQqsiaJCR0T8LgEPj
         5rdN7jL+xhK6d6Nlg4RuW7ykljIJbDCp8IJYbgtW7jeAfLEgXczuISqZy8JVoSlQByg5
         LpiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768469453; x=1769074253;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6UFfVn4U9hhL7GUJ/TzKS7TheZ9cYLz0xB+kdpbIWKA=;
        b=TnPIbQ/c6/c0BQOVDl0OM8VOucgSfENMHdHsefW5URh4Q3r595UZOHzUB/F7ejYdUk
         dfNM26TgUgM7S2qoXKQlC7AZjqzkXD0cW1zYaZzyLyAv9J79qhhvZrtpyhdpARMRL9w5
         QmWNonDBnjwEf6EmoQ3BU/aeiQiTjBXkAQKcW771ka+9QNTtWKG/1ocbls7FV6Ub4a7Z
         +MGKAnfHCtfJh8zlSVO4qUbz2CCmZgaNoADolLIfl62g1Id2YCC105P6fpIKk8zA5ws4
         l7yreoconEwr1M3XVQH9bEvrtEJ4ttNrEVTvmjc1E4zQa83PskvoMbaYKE9erkRfwz0m
         yIRA==
X-Gm-Message-State: AOJu0Yxzolc4NZq3AiamwIlTZptCROJddksX4a64Wx27CdQPdT07FdqT
	eR3DmcpPIV/d8X9wwdlm3ZUZ5TNY9m9SptGpHxZ1VObaVf0OdIZ2eYQuaH4FCuuv3Y6qr/FsQKx
	amjo+j5cD/SVzNQYa5nRn8sv7WKOf/WZgq/RHV1CVF7GkyhpJy03Bvhu4udu++HqgAwXZ
X-Gm-Gg: AY/fxX4UmR7hTJROXWrGKrLIYrWiLMeE5A0pJQLCQAjatbc9dnsRR/tVZ/fj5NA/6Hm
	7HxNT6N4xPt1rQaU/A4Nyy2IjShS0TomdMfWVe4i0d7BZztdFp1Trkiu814ahlee0vm/fq47DLf
	GF3GomgS0ZJSWbOsVKlTsEBXJJ+4N+EY9CW0JtLrNWMQw8/ebB6RojaFAU+nNX1FekULIBig8jR
	Wxn/xgzF+hlYE8Hc56dFwXGs9ZHLKby5jCg0jQFlG5a2EUKpFxUvMpNmwWkMerEGLxhF6bdRmMX
	0WXa8VFOf1pXWpGVVr2xtBzCBHlvOGW+WtqXt7Ebc4Za5tQbUXi4wRkc2yQggB0qNsh952Err19
	kWlCtKwoMRoZ6+DSglfpiyztHDcFoyLs4U4klbqfpjKnS+l169eI1ddlBiqJEZWNmsjA=
X-Received: by 2002:ac8:5a0e:0:b0:4ff:b757:1210 with SMTP id d75a77b69052e-5014811e52amr57935641cf.0.1768469452985;
        Thu, 15 Jan 2026 01:30:52 -0800 (PST)
X-Received: by 2002:ac8:5a0e:0:b0:4ff:b757:1210 with SMTP id d75a77b69052e-5014811e52amr57935311cf.0.1768469452547;
        Thu, 15 Jan 2026 01:30:52 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65411877707sm1934109a12.1.2026.01.15.01.30.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Jan 2026 01:30:52 -0800 (PST)
Message-ID: <5b4870fc-911d-4574-a0ce-59428cbdf103@oss.qualcomm.com>
Date: Thu, 15 Jan 2026 10:30:49 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/8] drm/msm/dp: Move link training to atomic_enable()
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>
References: <20260115-hpd-refactor-v3-0-08e2f3bcd2e0@oss.qualcomm.com>
 <20260115-hpd-refactor-v3-4-08e2f3bcd2e0@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260115-hpd-refactor-v3-4-08e2f3bcd2e0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=NvncssdJ c=1 sm=1 tr=0 ts=6968b3cd cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=tir8h9pnGiVj9xZly-MA:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: sSSg4tE5ouyKcMpFpIgskqKr_WvzWZPh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDA2NSBTYWx0ZWRfXxFTNIt7KcmDj
 +8WQQxPqKbam9ccML5ZaeEQho7jLW+rS2KDTfPCmioGMTTxpWO/+esDALAi1f87zCnmkeAsDaG/
 k7uV7dWKbeER2HA7BE5hC4kkenSI5YVFBlugGWusMTkOqtneXlsoOp1OlH7K6vyiMwxxAlOpDJn
 krWidED+8s3SsmMHfPhjICbRdYBE9TG5WKMUo8N844CNEOBdpdTKJwGp/09RhH0d4I0WTuNX5we
 gz3ef6660HQ0+WJN0kps0ebXXp9Fn5fGyUElfwceN7jQywA0utXgJaoMkZA8IyBA1XFQdwgorup
 v3+zRt0WywUrvZHz9rWv7leKJ3QfD0Lehqle73LqtHJQwWXnfSGY5wwGz1+q045O/cjXVCtAu+e
 7ukJeJiJ4HZGLVqQqvqImxWqaI00B1FQAkQ4r+w3J3ssKoQ0ovb0JkIoZmpFg5joN6tjoSGQOVu
 LEOJiyvp+iB6AxkzVUQ==
X-Proofpoint-GUID: sSSg4tE5ouyKcMpFpIgskqKr_WvzWZPh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-15_02,2026-01-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 suspectscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601150065

On 1/15/26 8:29 AM, Dmitry Baryshkov wrote:
> From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> 
> Currently, the DP link training is being done during HPD. Move
> link training to atomic_enable() in accordance with the atomic_enable()
> documentation.
> 
> Link disabling is already done in atomic_post_disable() (as part of the
> dp_ctrl_off_link_stream() helper).
> 
> Finally, call the plug/unplug handlers directly in hpd_notify() instead
> of queueing them in the event thread so that they aren't preempted by
> other events.

I think this part of the commit message no longer applies 

> 
> Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index a05144de3b93..3184066adb15 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -436,11 +436,6 @@ static int msm_dp_display_process_hpd_high(struct msm_dp_display_private *dp)
>  	msm_dp_link_psm_config(dp->link, &dp->panel->link_info, false);
>  
>  	msm_dp_link_reset_phy_params_vx_px(dp->link);
> -	rc = msm_dp_ctrl_on_link(dp->ctrl);
> -	if (rc) {
> -		DRM_ERROR("failed to complete DP link training\n");
> -		goto end;
> -	}
>  
>  	msm_dp_add_event(dp, EV_USER_NOTIFICATION, true, 0);
>  
> @@ -1695,6 +1690,12 @@ void msm_dp_bridge_atomic_enable(struct drm_bridge *drm_bridge,
>  		force_link_train = true;
>  	}
>  
> +	rc = msm_dp_ctrl_on_link(msm_dp_display->ctrl);
> +	if (rc) {
> +		DRM_ERROR("Failed link training (rc=%d)\n", rc);
> +		drm_connector_set_link_status_property(dp->connector, DRM_LINK_STATUS_BAD);
> +	}

Previously failure in this call would have propagated an error

msm_dp_ctrl_on_link() enables mainlink clocks, so 

> +
>  	msm_dp_display_enable(msm_dp_display, force_link_train);

IIUC this will crash the machine if the above fails

Konrad

