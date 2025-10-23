Return-Path: <linux-arm-msm+bounces-78607-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B89E1C01AD8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 16:13:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6925D18897FC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 14:14:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99EAB29AB05;
	Thu, 23 Oct 2025 14:13:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pU+Mn0X9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA440328601
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 14:13:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761228824; cv=none; b=riLd3WasMK40V4EVFgu8x131vD3wjgYyb3o8+3ZATabiv6mRSM8yBAFgeEb3Ntgc4fHS9dXWv2KRp7oY8ZbInbZWxwk3RW6hwQT1yUCvy3PdyADEAHzaFww5UYZ05jWdDPIvtVC8ZgSePZJtqClnHxo3zeXQHBCqh1oKJOJaho0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761228824; c=relaxed/simple;
	bh=Uwo+aYqg5B2e+9HKK6ZZffaGQmJz/+R31BTiwfyuubU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qvGQrO1jZ6/gqnd/I3ZyU0JYtebkfN68I/OEE8B7suyYCpyfACJyh3331Geg383/j3cgOYejUyzKXGMdajzE6gesxzR3MK1yQIifJUI/sXXuHuzLTe+BM17qdcmrnuWPlcQnGrqakNTHG2/SVdfJNN81YBQvMf014D37AUac6vc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pU+Mn0X9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59N7nSrQ019109
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 14:13:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=bxlmW53Ze95tx/Dvnq3bdZa2
	THJyIwU6ELjaUv9Gq8M=; b=pU+Mn0X9jNXUt1EVLox7A5LY7XOubdiPbjYo+RRx
	W1M2o4bBX9bF3cgjRLj2g8kBIbNZUvTjym5lZj1bm3LKCH80/Z+ImWiL69lKXOpW
	mYHS1tSAu0Ow4LmopH2i1pxtRx4NQSU9P2Tfq8vBpgmhD5GiAF5Nv599R4+zL0Se
	OOHtoenOEZlvDm2WmnAdEXgBWKSgKEVcqdlzaLQbai0MNXIvsB6/AyDeq09602O4
	D5xftRE6H8h0z7XnUg4679p8+4TvGOIZdGYbxtPwu38NkTUGI143wDnFfLd2Zmts
	Co2tGIXbTDruXTQb6tGIQ77H2SzVXj+87+bKdxgGRAGEAQ==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49y67qjn6v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 14:13:42 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-556a5452533so2086966e0c.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 07:13:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761228821; x=1761833621;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bxlmW53Ze95tx/Dvnq3bdZa2THJyIwU6ELjaUv9Gq8M=;
        b=bj7VbY2oL0LhEKpfmOhuHe+jJSRjfP8L0NLQ8ZidhTKNEi18YdROM/HowV6WLCHFa7
         2bRUjv88ZKZHglVo7eYS+r4rMJDDjJniwdhb/r+yqeaPdlEYbr76VVw2alE6TLu7Mwl/
         qssFa3ku5bE7iIBg5SurPXmq0hI969n1RUYBE6xD92nuXQ9atzCB01srOPb/48QDPtZ8
         ggEuYt33EKKy8wiYlegSrSpgAw/VOTM5eG7ArdKlmNcGnrba20kEaZ9qrR1RAxPG3F9O
         zRHX/iQpoh7hdRyZIo7IMKrXitiWegogwtT1YzMWrqHEYghXTZEBnZmWjFGUeaJU1Q8d
         I1uQ==
X-Forwarded-Encrypted: i=1; AJvYcCXKXtMEm90AdDFe8wq8U6Cs9JIUHzcydcndzVcI3InaYAmD7UKn2XESvwrPkheXKANfY9zNypOfeemR40L8@vger.kernel.org
X-Gm-Message-State: AOJu0YzoXHpqQpqdhMfnHQJkp79P+hXdvje8q6vvnHhE6IP0pKZ8TLxR
	KRTvv/YzgotWj6W7ikFBMbFERhEwV3GzM86jicQchjx5lZLE7HkoWeNk2/2dAHbeBjpLJdKQKjA
	LTK3xHfgqTz0U71eNfOU43OCH0Mg9AB0lF91aPTG/kK+F1qo+x40KjUSqZqxae5dg9j+x
X-Gm-Gg: ASbGncsylOnXvh8qhuIf5kGlUVPgAhKV+bVYUC6lguHF4WLd8iiKdHFvjYF8mmK2NVV
	4JkkCJ1eA+InBd/pB1gSmtU8nJNJzvvnAulYP5EKyj3CVVPIB4+jExP9gHNLd179iaM6WsOgvXP
	kE55xFqa42R49yeHsHemxtKguJJo9B+X3ev8S1zcIg8hx2Eu6WNCa3GjFdLKvPOs2HlbMokXYYD
	QLcuviBPk3D58gSkHy2hjV3LSJXnQ+KMLDDBvK+7tEvY20Dw4d4XAF40GEJWHfkEoifBA44FOOH
	yGkWWAGrL27XgE8o2LYuZhC5iDNs/hhcZtR11lJtuOub7DNvmKR/3FRaNCeSt5N0QGRJMrXf/Zt
	mT4lhgF+64QPo8bY2DtH37tY7/GA+3OpsLpwhx02Lfuzs3DvPF45i9VWeuk0JmjeDDLMv5pM6kG
	fsxy//b0u/szjH
X-Received: by 2002:a05:6122:810:b0:54a:a58f:e989 with SMTP id 71dfb90a1353d-556a23d1b76mr1496700e0c.8.1761228820719;
        Thu, 23 Oct 2025 07:13:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG5TgXEWMCaYgffAKUiCdHKVEM+aaviF0rQ5ddKDKB+LpphL8HT0eGhK1PfL8c/RkWPBJR2bg==
X-Received: by 2002:a05:6122:810:b0:54a:a58f:e989 with SMTP id 71dfb90a1353d-556a23d1b76mr1496672e0c.8.1761228820138;
        Thu, 23 Oct 2025 07:13:40 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-378d66bbc2bsm4790101fa.5.2025.10.23.07.13.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 07:13:39 -0700 (PDT)
Date: Thu, 23 Oct 2025 17:13:37 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Alexey Klimov <alexey.klimov@linaro.org>
Cc: broonie@kernel.org, gregkh@linuxfoundation.org, srini@kernel.org,
        rafael@kernel.org, dakr@kernel.org, make24@iscas.ac.cn, steev@kali.org,
        linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, abel.vesa@linaro.org,
        stable@vger.kernel.org
Subject: Re: [PATCH v2] regmap: slimbus: fix bus_context pointer in regmap
 init calls
Message-ID: <aduio24mrmn2n5ioznn4qqvxohka5ellynbhsfuai5ybupja7n@alr3vpmtayxa>
References: <20251022201013.1740211-1-alexey.klimov@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251022201013.1740211-1-alexey.klimov@linaro.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIyMDE2OCBTYWx0ZWRfX6kVhulwWLpD/
 ssMCAcZfB70XgvCHu9HQcKRgdC7iJFogK4vnDUcL3Wbz5S33gypdZRO6mvvKMPKGEPGJSU4sY1t
 7/y6sYPShl153n/aBbPekNAE4W2dpanwsoSNkudv058vQrEExtXydnadzfpaQbtO+zRSSrmr8TE
 u0IDt4hBesSjS9lBOT0Xt8qKpx+50FHznQGOrf2ezkvyalkz3EiiobnRK8TahQFm5lQbQWzD+mc
 sOTVJFo8QycwJuDzx979FQEv1azUTfsN44LcwDIMiIcJFWEVzoLlVtGpMnLtUdI8i+zVbWCjOj2
 xm4vi7k7xr8H5B3kFwjYG95qeYudzP8lZLojQdrCARl4vS3EDZmf0tm+L04XeXeVq+fZ9pClA+K
 l6gmALfXsuvBA3gmjtp1BVHw6+egPw==
X-Authority-Analysis: v=2.4 cv=LMRrgZW9 c=1 sm=1 tr=0 ts=68fa3816 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=FQcGyLhEAAAA:8 a=KKAkSRfTAAAA:8 a=PG27YUxyvBvumL9L9GoA:9 a=CjuIK1q_8ugA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22 a=09nrmc514_O-33C_6P4G:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: 24B6y6SPouczqOodLrzBTSN1PbL5o_nb
X-Proofpoint-ORIG-GUID: 24B6y6SPouczqOodLrzBTSN1PbL5o_nb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-23_01,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 priorityscore=1501 impostorscore=0 phishscore=0
 bulkscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510220168

On Wed, Oct 22, 2025 at 09:10:12PM +0100, Alexey Klimov wrote:
> Commit 4e65bda8273c ("ASoC: wcd934x: fix error handling in
> wcd934x_codec_parse_data()") revealed the problem in the slimbus regmap.
> That commit breaks audio playback, for instance, on sdm845 Thundercomm
> Dragonboard 845c board:
> 
>  Unable to handle kernel paging request at virtual address ffff8000847cbad4
>  ...
>  CPU: 5 UID: 0 PID: 776 Comm: aplay Not tainted 6.18.0-rc1-00028-g7ea30958b305 #11 PREEMPT
>  Hardware name: Thundercomm Dragonboard 845c (DT)
>  ...
>  Call trace:
>   slim_xfer_msg+0x24/0x1ac [slimbus] (P)
>   slim_read+0x48/0x74 [slimbus]
>   regmap_slimbus_read+0x18/0x24 [regmap_slimbus]
>   _regmap_raw_read+0xe8/0x174
>   _regmap_bus_read+0x44/0x80
>   _regmap_read+0x60/0xd8
>   _regmap_update_bits+0xf4/0x140
>   _regmap_select_page+0xa8/0x124
>   _regmap_raw_write_impl+0x3b8/0x65c
>   _regmap_bus_raw_write+0x60/0x80
>   _regmap_write+0x58/0xc0
>   regmap_write+0x4c/0x80
>   wcd934x_hw_params+0x494/0x8b8 [snd_soc_wcd934x]
>   snd_soc_dai_hw_params+0x3c/0x7c [snd_soc_core]
>   __soc_pcm_hw_params+0x22c/0x634 [snd_soc_core]
>   dpcm_be_dai_hw_params+0x1d4/0x38c [snd_soc_core]
>   dpcm_fe_dai_hw_params+0x9c/0x17c [snd_soc_core]
>   snd_pcm_hw_params+0x124/0x464 [snd_pcm]
>   snd_pcm_common_ioctl+0x110c/0x1820 [snd_pcm]
>   snd_pcm_ioctl+0x34/0x4c [snd_pcm]
>   __arm64_sys_ioctl+0xac/0x104
>   invoke_syscall+0x48/0x104
>   el0_svc_common.constprop.0+0x40/0xe0
>   do_el0_svc+0x1c/0x28
>   el0_svc+0x34/0xec
>   el0t_64_sync_handler+0xa0/0xf0
>   el0t_64_sync+0x198/0x19c
> 
> The __devm_regmap_init_slimbus() started to be used instead of
> __regmap_init_slimbus() after the commit mentioned above and turns out
> the incorrect bus_context pointer (3rd argument) was used in
> __devm_regmap_init_slimbus(). It should be just "slimbus" (which is equal
> to &slimbus->dev). Correct it. The wcd934x codec seems to be the only or
> the first user of devm_regmap_init_slimbus() but we should fix it till
> the point where __devm_regmap_init_slimbus() was introduced therefore
> two "Fixes" tags.
> 
> While at this, also correct the same argument in __regmap_init_slimbus().
> 
> Fixes: 4e65bda8273c ("ASoC: wcd934x: fix error handling in wcd934x_codec_parse_data()")
> Fixes: 7d6f7fb053ad ("regmap: add SLIMbus support")
> Cc: stable@vger.kernel.org
> Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Cc: Ma Ke <make24@iscas.ac.cn>
> Cc: Steev Klimaszewski <steev@kali.org>
> Cc: Srinivas Kandagatla <srini@kernel.org>
> Reviewed-by: Abel Vesa <abel.vesa@linaro.org>
> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
> ---
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

