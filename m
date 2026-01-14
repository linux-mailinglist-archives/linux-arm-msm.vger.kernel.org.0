Return-Path: <linux-arm-msm+bounces-88916-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 384D3D1CCF2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Jan 2026 08:25:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2F9CA3048C50
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Jan 2026 07:25:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7FAF35F8D2;
	Wed, 14 Jan 2026 07:25:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JPOUIh8J";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Vit2peHp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FE5D35F8C3
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jan 2026 07:25:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768375526; cv=none; b=E0JnuL+6y4kPAWWbtdPlY6/6KEUzDiAdEzjM6jtsKW2M3V8Bi0izxWOnaAnZeaWvBhqU+KE42j+Xwhh1G0Pb9mRI3KvZ808CyRj3lYto9QckyQ7OFTDvqNQjkoUOihiK6LBgKEfe6n3st0hi0eKH4HcnGV5RiVncVrZJM027Kww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768375526; c=relaxed/simple;
	bh=jaK92eoy/8AAGH5vt4scZ0Q4tGzYmBAfKteMC+eKBnw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sLVCvkUMT+FdYACGjkbKJbEWU+13lG7fvmTabaLiOufniJ9AtrulMbvipyms87w2w5y3oGkd41hSdzGUTTn1QNALGvhb6/oKaYDfzgiWZwLrgv8HpeXQNrO+sxhK2xEeU9PfVfTjDe/W6jpeB4bgM+ygdiOgXEvZZmIC/OmT7y8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JPOUIh8J; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Vit2peHp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60E65xdR1872418
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jan 2026 07:25:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EIKvwWZ09qPpnnCXZJpVZUB+Qv3PCgdJBJ893R52Bxs=; b=JPOUIh8JL8AIh38F
	T6ly9WdUMZhwcvqIYAb9kr4uOa00UrRr5rCUHqI1syDsVZ83hrMB8+8/5IMMmBHL
	AnzjE6Ydpi9a2XHXn3zIJFtUpWTmAkWbFa8uvL7dd1wWJlPkuMtwDNUNiEgftKG5
	9PXGO4FnXwmUShAbB5lT98RD3vy0GmtBXtebUTDLxbrOxCqjwykMLkU28nrzKY9H
	InrAWgCv+Qzh87QAUMHpxJLNQ69xKm0i4RBrxIkrehE7lMFT2+VxwMv0kf2Yjnmq
	xQF5Iq4V8T8LV5mS9BCnWtFCQIyzUrZs26XwrA3FkvrLpmdjkPNZiDK2mh+Vo/j9
	QcZtMw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bnu58t82g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jan 2026 07:25:22 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-81f42368322so3236462b3a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 23:25:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768375522; x=1768980322; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EIKvwWZ09qPpnnCXZJpVZUB+Qv3PCgdJBJ893R52Bxs=;
        b=Vit2peHp1eQCUBzn5V0vwiavioiV7ZfX0uNJBwh8loGLDMzVYIuh2NgwB5kRmpJTFR
         SkGLDpyQ2xHhd1WXLt5idOQZPwRbuXj4sIw642Sf9i6RarfIAnHMpmLDd+chCCzSBWne
         +PSWX/8JuaN0pryfEFKFkgfguAJ0L/uQUrAKxwWRwzPoEWlTohxQTP7ksnWZ8oOdMBUu
         gd1KVD+SMfh0l981TK9QECuEonfj42mETRDJJFcG79HrTPG30yZcGfvLb8C5oiJei9km
         7NG4W+tdYfC+id0G+Xs4HQBg78A9jx6vu3q2pNdUhR2yoMVanKE9Zl6TMbvxRnEz6UfR
         E8iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768375522; x=1768980322;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EIKvwWZ09qPpnnCXZJpVZUB+Qv3PCgdJBJ893R52Bxs=;
        b=CRNyHs5UqSuHL5uBNFFi7LcbZBoEqJVVn8Lp2b0y0n9jp3TjFbqvOQj1MwCFDgm7lV
         JbncGrse0wDanb/kH7Y3ZdxHkZt0lfD01kAvLgK6/xHWhT5TAQBo0tvsUrFh3gh7SKez
         BwsuHiPubjPv7VjnnQIBcSPa7+4DPHrsTPeqU1UL+P51zWX2XnHltP5Oioi8jcEKPYGJ
         /hAAxCqpQKEGkfLNupX1OhJ+WNs7pwp1mIxtvyHfNr4gh9mtOBU+jw3ZdLOSiBblANfS
         KoBrXvFqb8lRy9GR0GzLICW6jgMKzNwp5gbYrmNGf7VRUzs7ZFqYFr0ZUVR9fN4jOvPv
         2QRw==
X-Forwarded-Encrypted: i=1; AJvYcCWofaI4jjtmSQ5oMehPfRzZquuacQUb4aFqPNURJiwQkTxJa/ANKhKT5rQ7JYowF4TopDy69/E65O1q/pMf@vger.kernel.org
X-Gm-Message-State: AOJu0YyM04Vm6ognVL7vTprZHKVfU3vPDvxn/hHiPo5mMm4/SSb2mMth
	sirjE7zfchIvwBPoA/dG4O82Fg5Tgj5Lmlc99/rQ0VRfqQZ/j5v9ZFLs+DkoZIbUKrNcpw2kD4E
	AR0Zp3O/vRc8qpXPy6CiQ035fsuSmmzrUdor4tOIpkM1w1ErFP7acaKNJkiim2KSAGB0Z
X-Gm-Gg: AY/fxX7ev01z7tBd0tMrF0VE5QF7XvzG3w4pQ0SKWhXZdnirjpYepSlrUSF4f4CqMxD
	59qWIZeroS5JP9BSe4f576dOrqeFGJBMWd4TMGYhVk4lrfzT6xvGGSG9vAgvxL/FoulOVFPz6vJ
	w6L074QXTRC/YdMZ+u6h6qlqQG8kPKezAOFvCe3vtyzWu+/528JoQm6enGTwRL5JzBq5gMQdW0T
	j8+wy98xwpWEU0KClsWNA7hJoLyyb8vmS7AnAU+r9+8ZxjMr+wY4Ic0THkH9Hb/ZU+XOM0KwxAy
	WX6GLjTnG5jzR+XiEF4lIZ04eHKGyVdCiti3Id401wJH2GIS+qDtIXsqheLr5auIGrmhTK/sW5i
	u9Sf7pH7sqnsLik3C+a2ZoqtdAGaYuxKEPznBaIotMz2/
X-Received: by 2002:a05:6a00:368c:b0:81e:f623:ba04 with SMTP id d2e1a72fcca58-81f81cc85ecmr1637017b3a.13.1768375521489;
        Tue, 13 Jan 2026 23:25:21 -0800 (PST)
X-Received: by 2002:a05:6a00:368c:b0:81e:f623:ba04 with SMTP id d2e1a72fcca58-81f81cc85ecmr1636982b3a.13.1768375521017;
        Tue, 13 Jan 2026 23:25:21 -0800 (PST)
Received: from [10.206.109.90] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-81f87aa4f97sm245432b3a.69.2026.01.13.23.25.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Jan 2026 23:25:20 -0800 (PST)
Message-ID: <bc537a18-04ab-0ea7-3600-2a35418e6a05@oss.qualcomm.com>
Date: Wed, 14 Jan 2026 12:55:14 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 04/11] media: iris: don't specify min_acc_length in the
 source code
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-media@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
References: <20260113-iris-ubwc-v2-0-4346a6ef07a9@oss.qualcomm.com>
 <20260113-iris-ubwc-v2-4-4346a6ef07a9@oss.qualcomm.com>
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
In-Reply-To: <20260113-iris-ubwc-v2-4-4346a6ef07a9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE0MDA1NyBTYWx0ZWRfX7vkFlZCBHbd9
 05HJi4yU+oDR6UTxeuNfAJ80Ls6SAhSP03ADcNwwBn0BDcCE6FCP33XM7Iz+Ec4/5wm5jP1Ihay
 TO/Ga6F8uFJbw7gyIgwIwRbMVwtDeJOGnLJioGsHktd+sYpUi0qR/v1Ag470ma/lET7G+y4gQa0
 azXxF0hynfHbc0mZyQKDS8DaBexKf/oHY6TGdQBjMmdCrJpd1q/mjy1mq5Y2Xqni7rYnHrfwjE8
 sSkL8p/aiQKAMq+uZjrRzYDEXLu/nmKDJU5qMHWuVXXm7LX2ASpNW0P6+GpHCK41oU83MPe2CnK
 RqQK5EnIHvBHoh9J6ZSeJVPcf0JmgMkUZwJikIV0pnRVEzEVGdhgyXU6JN3oa+BHlvb9CIdvqQM
 svsou2CmICwdFj+JQDuYl1R0O5ej3z0PJ2uBeLiMDD08uF/n0Tf1jbh5t1PM7//+iy3C+zhRqr5
 4TbpVZUjAnzdZUY09Qg==
X-Authority-Analysis: v=2.4 cv=BZnVE7t2 c=1 sm=1 tr=0 ts=696744e2 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=52UxMbdsJFNFq4lwM_0A:9 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: 2dwwuGj3hVlscDOXRU5Szp7mOqfiwde_
X-Proofpoint-GUID: 2dwwuGj3hVlscDOXRU5Szp7mOqfiwde_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-14_02,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 priorityscore=1501 bulkscore=0 spamscore=0
 adultscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601140057



On 1/13/2026 10:27 PM, Dmitry Baryshkov wrote:
> The min_acc length can be calculated from the platform UBWC
> configuration. Use the freshly introduced helper and calculate min_acc
> length based on the platform UBWC configuration instead of specifying it
> directly in the source.
> 
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c | 5 ++++-
>  drivers/media/platform/qcom/iris/iris_platform_common.h | 1 -
>  drivers/media/platform/qcom/iris/iris_platform_gen2.c   | 1 -
>  3 files changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
> index d77fa29f44fc..878e61aa77c3 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
> @@ -3,6 +3,8 @@
>   * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
>   */
>  
> +#include <linux/soc/qcom/ubwc.h>
> +
>  #include "iris_hfi_common.h"
>  #include "iris_hfi_gen2.h"
>  #include "iris_hfi_gen2_packet.h"
> @@ -120,6 +122,7 @@ static void iris_hfi_gen2_create_packet(struct iris_hfi_header *hdr, u32 pkt_typ
>  
>  void iris_hfi_gen2_packet_sys_init(struct iris_core *core, struct iris_hfi_header *hdr)
>  {
> +	const struct qcom_ubwc_cfg_data *ubwc = core->ubwc_cfg;
>  	u32 payload = 0;
>  
>  	iris_hfi_gen2_create_header(hdr, 0, core->header_id++);
> @@ -146,7 +149,7 @@ void iris_hfi_gen2_packet_sys_init(struct iris_core *core, struct iris_hfi_heade
>  				    &payload,
>  				    sizeof(u32));
>  
> -	payload = core->iris_platform_data->ubwc_config->mal_length;
> +	payload = qcom_ubwc_min_acc_length_64b(ubwc) ? 64 : 32;
>  	iris_hfi_gen2_create_packet(hdr,
>  				    HFI_PROP_UBWC_MAL_LENGTH,
>  				    HFI_HOST_FLAGS_NONE,
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
> index 8d8cdb56a3c7..3c5f3f68b722 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_common.h
> +++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
> @@ -73,7 +73,6 @@ struct tz_cp_config {
>  
>  struct ubwc_config_data {
>  	u32	max_channels;
> -	u32	mal_length;
>  	u32	highest_bank_bit;
>  	u32	bank_swzl_level;
>  	u32	bank_swz2_level;
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> index c1989240c248..c70cfc2fc553 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> +++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> @@ -633,7 +633,6 @@ static const struct platform_clk_data sm8550_clk_table[] = {
>  
>  static struct ubwc_config_data ubwc_config_sm8550 = {
>  	.max_channels = 8,
> -	.mal_length = 32,
>  	.highest_bank_bit = 16,
>  	.bank_swzl_level = 0,
>  	.bank_swz2_level = 1,
> 

Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

Thanks,
Dikshita

