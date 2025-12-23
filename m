Return-Path: <linux-arm-msm+bounces-86429-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E6C68CDA830
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Dec 2025 21:31:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E456B301E221
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Dec 2025 20:31:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFEE617BEBF;
	Tue, 23 Dec 2025 20:31:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NTLYo+gh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iiQmgB8K"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75FB71B0439
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 20:31:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766521864; cv=none; b=VRl+/6lUzx0GJcALvfbauIDCUzbWg5iEpzRt0vDVXb80t1UDPTk79aCcA/JJb4wPWosEeDxreoS9ATGDZr/BsOPx530bRohNrVxdRKzzjmqtteA63jAFfs1SwTZkuWKrgIRRp2d0h1Mj1pRJTx9t/dKmb/B4TDKtuxa99kG5zEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766521864; c=relaxed/simple;
	bh=ajyxTDXf0xp2drcTnnIGbQ3DiQYBFWUBIjjjjVKVRhk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MhqKaLj+musUorS3XQUMOqr+g8Ml4G6wDFcB0aJ0CvVxwmAgaMzjzkDwFrxSAmjs/zhKAlWB7WA5/IyEJWO1G0GH93KyZCuR2Et2lUksqbDtLDdHVx29zOXq6zLc11lUbyu1Ahr3jww7wKsZKcU+BP3Z9tMc/g/o7pWYquoA0sA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NTLYo+gh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iiQmgB8K; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BNGerT22747598
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 20:31:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=4yTVMLxBUXz2CKuwVwliNlCR
	EofHqymY8nVV9CVfBco=; b=NTLYo+ghkVY3NoHrMcq+VeAlcZ77iHAfH8Le/LeC
	Tflsjyif2npVjh/H33xLZkqVr504NG6E5+xqv1sn0951bMLjnADSp/eFm4F0J9sp
	C+euByLRthWqa47IjYbbAOeP/R1AuAvQ7gW3zb4NRK2Ml0zYWXofO+Bhg/hBD+qn
	MRFwTDRuBaG9CBMYazT7eTulPYlEaXHIfYJxxJpWpYs2Opb/GYUWylSjj06SC3Lv
	I73MuvKxytl9I3g3HxWn4TO07XaChpInDpFbh5XF7h09V3JivpChGcQB8l5QqGhb
	wv6AvOFQauimwNcG2LzjAqc/Ye2pLKHa9AcfAC94LmGrHg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7h5cuhut-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 20:31:00 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4edaf9e48ecso139540001cf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 12:31:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766521860; x=1767126660; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4yTVMLxBUXz2CKuwVwliNlCREofHqymY8nVV9CVfBco=;
        b=iiQmgB8KLaTCs2LHLlfq+/WSBkhqqDz0beeCdrAjERA3aOeADeohQPlvNzt/+JejXg
         M6tis01hg35CTR7YmFe4YAvd/zv3lZsT2QXs7vkgFLPy4ZTMMYOghPuHu6jIqUw6DlQT
         XIGz4Da+1BvnRZ26fOw1aO7QkpjdBIHb7CbKq9MH2MYVPIwgaqLVSmsHGJfcz/J7vHtl
         iW+uDKHn9m722mjmD+9Gt9Xu5vWNO8Q2zv7afmp27VUsqB6BIELgArVKdVncJyVlL7h7
         EPlkadop00rSawr+2mczDYvnl34CeuPrqLJwyMsvuAGjtYxv554J7fcdygOQemJI3E/V
         KJZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766521860; x=1767126660;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4yTVMLxBUXz2CKuwVwliNlCREofHqymY8nVV9CVfBco=;
        b=uRtezZRWvWElmMZX9fj2UWFEbg5+IXB451kNmbT9VldGV8XUtN36IhTJl888a7u/+6
         ZUlOCQRDkquYCx52z1kt0QzPHGUgcOIHZwzDAWgc4gvdDUR2Cb2/VGKj1p8/sgqMmyNC
         1M2hx4P0vdZrK+XWrlED93H+uJ8t4En7JEN1bV1PWFIGjpE2n22Q8fqPsKujpWiLzoV3
         ZDSYyTSPdR/qmvbp9Ebfe8w8fu6OyHQRRn6/lXGg1W1+RDkEFHjEZ5xPpjav40jYIZJs
         frDsm7MwBLRDRf3+lzlNR1PYrPzlfS1lpGcv9gH8bnkPySwY45eEtCipMb1q2QgUHg9s
         FuLQ==
X-Forwarded-Encrypted: i=1; AJvYcCW1HRwxHTQ61SazfJ8J5CCSeN6OIUh+CmLK9rD9MMqZDJsSSMyUfDtkv8Gc2megKO+nETZo4aRc4a7d3OOX@vger.kernel.org
X-Gm-Message-State: AOJu0YxZ7QqiZnRnoYyk8nWq6KCUGycuzeYcaYP6dZBz/s5KQ7IN94Oi
	8SC0yq86SE7PY0bkOtbOFxDJ8bmwUJ4XxpNTImUbB2R/rD7BeJJhBG8l/z7eR9wyR7WYvI1v0Cv
	yHnb5d56AdH5OU9Xd4DdWVlVs+jZPn/S56ByCYxahulL/xVwOeddHA3nYE9eiPGrcEg/v
X-Gm-Gg: AY/fxX7UnfWNutirtxCrSLU57qG9sK+7I72Xbeyz4UF+gP+avCuUkUXwFa/ajK3CbMF
	A863WBFTUP8F+zXYZ1rt0EfJgrnnCG5u59wcr41tVPcacLF/04N50f/Fd+bSepYPKHzCcogFAqU
	DV+neRcZHs2Z1jBfkhP8fGi7hy34hLCSTzat5FlxjxcYUYreYJdjcIIA7CM6paeDcNRZjGcyLl/
	Vok83/CftCnt7b1vrq03sqTz/Yds1+U8qdW86cOnDwwq8owb4a0ej8llVOUU+ibZbRw0pAVl7tY
	VjyqTEb1bVitgh9HzQtPZAe9tYfI1Hzww/PLuIYrkY93ez2IBJcj8Wo33LNviJL9ffYlUXG7wif
	Psu/bW5yWCFz6vJhwHWNWxhEE3I1fleXMOV34kVEAJCCqurUTI/wCvmq4nlujhZVTwVEVuQBrGf
	2BVbP94s1eIUcXFgDgNm870dU=
X-Received: by 2002:a05:622a:2515:b0:4e8:a8fd:e00 with SMTP id d75a77b69052e-4f4abd6fd05mr238717481cf.43.1766521859692;
        Tue, 23 Dec 2025 12:30:59 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGkymYoqedGNX8RtCYK8eQPHwf5IoC9fyqOpxWcuOypEFxU4OUDP0i1kmyNmN0ZGRkzYM4p+w==
X-Received: by 2002:a05:622a:2515:b0:4e8:a8fd:e00 with SMTP id d75a77b69052e-4f4abd6fd05mr238716991cf.43.1766521859184;
        Tue, 23 Dec 2025 12:30:59 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59a1861f2e6sm4377066e87.69.2025.12.23.12.30.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 12:30:58 -0800 (PST)
Date: Tue, 23 Dec 2025 22:30:56 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: yuanjie yang <yuanjie.yang@oss.qualcomm.com>
Cc: robin.clark@oss.qualcomm.com, lumag@kernel.org, jesszhan0024@gmail.com,
        sean@poorly.run, marijn.suijten@somainline.org, airlied@gmail.com,
        simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, neil.armstrong@linaro.org,
        konrad.dybcio@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        tingwei.zhang@oss.qualcomm.com, aiqun.yu@oss.qualcomm.com,
        yongxing.mou@oss.qualcomm.com
Subject: Re: [PATCH v4 10/11] drm/msm/dpu: Add Kaanapali SSPP sub-block
 support
Message-ID: <fto47ksvr6i4fxl52yqcdgatut7oqepgc7d2slrn4gr7yi2xei@s3bnte4sdk5f>
References: <20251222102400.1109-1-yuanjie.yang@oss.qualcomm.com>
 <20251222102400.1109-11-yuanjie.yang@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251222102400.1109-11-yuanjie.yang@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDE3MiBTYWx0ZWRfX/DzwMA6VkPY3
 w3+rUosqiOdjvgmWco65aQR202u7IVLzT5GAEryJRYBqnzUZfVfhlixTo/fYuMnEvrY8b2ySeu7
 gbJpLyvcCPYv9POoRI7dvQIctgluQvinBd0MlBMQhomYWc/jfvjgvs6HkLTP2VmDdksr4MPtqIg
 DvW7/L1rU+aJ5NtwUW1vVb/2YjL1y0QbyJSd7ETY+8b2qsAd3RBh6yArkbs4TWku0nAhVE1u3xS
 QtFWa5uBZj7MqHsutjyxLjsaQNaK3iDmpxlyHc0Gmsn8zhVjTaCUuVFIkrVmAPGnaF+knBtdtjF
 AUr12N5zxVoEXU6vw1LkqaLXVcxqt04ayw3jt8EALdUPgTQrm3xN2R1fFaOEL+zS8khZzUVNGfx
 H/eDcykX6a7p18pFUoaQL+dGzy/I5TEOHrBh6J6lgj6k/NSGNkPyk4HhDIczZeqVJJFAkuVXbsh
 rx9HlqX5gf8nyM3waLQ==
X-Proofpoint-ORIG-GUID: Pxf3k4tYUxj7n342ESpfTQzIGa9j5quM
X-Authority-Analysis: v=2.4 cv=LeUxKzfi c=1 sm=1 tr=0 ts=694afc04 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=T7gXAn62BuYQ5x_KxX0A:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: Pxf3k4tYUxj7n342ESpfTQzIGa9j5quM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_04,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 impostorscore=0 adultscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512230172

On Mon, Dec 22, 2025 at 06:23:59PM +0800, yuanjie yang wrote:
> From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> 
> Add support for Kaanapali platform SSPP sub-blocks, which
> introduce structural changes including register additions,
> removals, and relocations. Add the new common and rectangle
> blocks, and update register definitions and handling to
> ensure compatibility with DPU v13.0.
> 
> Co-developed-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/Makefile                  |   1 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c   |  13 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h   |   4 +
>  .../gpu/drm/msm/disp/dpu1/dpu_hw_sspp_v13.c   | 321 ++++++++++++++++++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c   |  18 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h   |   3 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c     |  17 +-
>  7 files changed, 371 insertions(+), 6 deletions(-)
>  create mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp_v13.c
> 

> @@ -291,9 +292,10 @@ void dpu_hw_setup_format_impl(struct dpu_sw_pipe *pipe, const struct msm_format
>  		if (MSM_FORMAT_IS_UBWC(fmt))
>  			opmode |= MDSS_MDP_OP_BWC_EN;
>  		src_format |= (fmt->fetch_mode & 3) << 30; /*FRAME_FORMAT */
> -		DPU_REG_WRITE(c, SSPP_FETCH_CONFIG,
> -			DPU_FETCH_CONFIG_RESET_VALUE |
> -			ctx->ubwc->highest_bank_bit << 18);
> +		if (core_major_ver < 13)
> +			DPU_REG_WRITE(c, SSPP_FETCH_CONFIG,
> +				DPU_FETCH_CONFIG_RESET_VALUE |
> +				ctx->ubwc->highest_bank_bit << 18);

I'd prefer if this is pulled into dpu_hw_sspp_setup_format().

>  		switch (ctx->ubwc->ubwc_enc_version) {
>  		case UBWC_1_0:
>  			fast_clear = fmt->alpha_enable ? BIT(31) : 0;

> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c
> index 478a091aeccf..006dcc4a0dcc 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c

This commit was about SSPPs. Why are you touching WB?

> @@ -148,6 +148,15 @@ static void dpu_hw_wb_setup_qos_lut(struct dpu_hw_wb *ctx,
>  			      cfg);
>  }
>  
> +static void dpu_hw_wb_setup_qos_lut_v13(struct dpu_hw_wb *ctx,
> +					struct dpu_hw_qos_cfg *cfg)
> +{
> +	if (!ctx || !cfg)
> +		return;
> +
> +	_dpu_hw_setup_qos_lut_v13(&ctx->hw, cfg);
> +}
> +
>  static void dpu_hw_wb_setup_cdp(struct dpu_hw_wb *ctx,
>  				const struct msm_format *fmt,
>  				bool enable)
> @@ -202,8 +211,12 @@ static void _setup_wb_ops(struct dpu_hw_wb_ops *ops,
>  	if (test_bit(DPU_WB_XY_ROI_OFFSET, &features))
>  		ops->setup_roi = dpu_hw_wb_roi;
>  
> -	if (test_bit(DPU_WB_QOS, &features))
> -		ops->setup_qos_lut = dpu_hw_wb_setup_qos_lut;
> +	if (test_bit(DPU_WB_QOS, &features)) {
> +		if (mdss_rev->core_major_ver >= 13)
> +			ops->setup_qos_lut = dpu_hw_wb_setup_qos_lut_v13;
> +		else
> +			ops->setup_qos_lut = dpu_hw_wb_setup_qos_lut;
> +	}
>  
>  	if (test_bit(DPU_WB_CDP, &features))
>  		ops->setup_cdp = dpu_hw_wb_setup_cdp;
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

