Return-Path: <linux-arm-msm+bounces-78663-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 33464C0436A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Oct 2025 05:06:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 96D44356BF4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Oct 2025 03:06:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF0A826F28A;
	Fri, 24 Oct 2025 03:06:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fYsRSshu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25E6B26E70B
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Oct 2025 03:06:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761275166; cv=none; b=eOEDfC3JupAPbkjjL1ubcRWUy5/WyH7oXn9B5ou5n0/XyDfdPllVID7RWd3C/GaDHjNf1bLXw2zPFwvX/r8jPsjGsSBjq7XcL0Zkx0UvrFdH1zNFQ1Ir5HpV4Q1cHuFbeW2NE+YEVVVMYjfE/mJ7A+DIwRIhFWvZ80WdnGEzWkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761275166; c=relaxed/simple;
	bh=xflPyfFGMKye4kmK4AGn6eBGVRiTFsFbDcF+ogX1/Ic=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GbAUUgaeXq4nClqG6qmR9LnWH8Y1sE9OXCIP+3PWQa/AEs002nIXPWXdPpsCMB81YNxN8I5hzHKiH6AZgz5X/yjfphEdDQeQNcOaUwSq6Dl0ubazRE5rXry9ED4AQvjDvk1t5+ss8mIrRNoqsbTtVGc/5ppX6ZJ0vDrP9v/CT7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fYsRSshu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59NF24Vr009131
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Oct 2025 03:06:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=4ytYg5wIvSCF5vB30aPZTmXG
	+DpyzHPysWUr4KYo2nU=; b=fYsRSshuTvO+iBk5tEhQCKqPmdb2or6LOosi9rAC
	sE8n0mV26VqAOMrivDpDydH4xNXeb3a6WM/rCkaPQ4XhSCaJPOutS4w830G1eZ4b
	pjagGIwREvBJ0Zl3PayxpEFyQD0p0DysLmVSDRNnltMj9PPJHVYkkyBGLf42Ikms
	aiW4Sfojd2PpUhxTt2ScCh+Q+66/Rhv74ouHZOBoKOKTHtKwnIWxb57jbAibCUwk
	0Z614UqV4ncT72ley/V4M0nB1MMfYz/HqWVCLXbYc+pD3AczEXH/vJkavOAD0mQe
	J+CzFpbxF3KXG7sTqHFetW/ssn+EwLQRpL+yjYzOMw2uuw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v27jah30-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Oct 2025 03:06:03 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-797ab35807eso49221676d6.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 20:06:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761275163; x=1761879963;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4ytYg5wIvSCF5vB30aPZTmXG+DpyzHPysWUr4KYo2nU=;
        b=U4iNqb4hHnALXkD9yyEc/mh+iX54i08Cb8Kqfdyrvm3YaDd1l4qS7gTEgLjDVEaJCz
         ishPSqSq+XQVkKngMBa3xu8IK7m7mCgPWjEdQeDw72Urk36NlCVfBfd4HsucAwHQVZzz
         AxCyGiUTFXkPryssqhhG38DnPlzExV+ikc5JgAm0zvJydLPr7QZyu662Rh1/m+5uWdv0
         R015jq4kmv3P820LRGmaXE7JmVJTZIo9EHzSUNT24BvrgJKmsTkddgQCChAWVWQa1I2I
         HSZy5gmZiXvLQLh5M/nUIYnaMGzouOWF0Bi6X+C72rsHTqSUXDz9rUZ+4BNyEygk4Opq
         TPOw==
X-Forwarded-Encrypted: i=1; AJvYcCULuDo7RkfBePrqI2XrdY1uMj6kw5kO6M77+oSCizC9mj3l13DbD9RZleciS3yc4+Z7OmRoVOzStyrTz3Cl@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4RSjmLRvJf4IEjo3gOye9Bn49DPO+KcF3dCEBXHwHVK2/Xftp
	ZF7humtvFY7rIVNysN1INncmt3YHbyY20P2pAKox/LEg9EEhTxrAmxkv120JTXJgY5PsuV2DRLL
	SvHJDlMAElYHSXSozHd8wjYRrHpOu64sD7VlOy0kA1qNrbTSFtOgkesmLOel/J/fbbObA
X-Gm-Gg: ASbGncsMkefjB2O7jecy/8aPSbG2i1oalfJe8WENk4C9pbXhS1P9sDnMFdrmeTO6YCv
	ycumc5MUHhve/lfU+H9rFGGoDSP8sOkgkOfMk81b/q/Mp05qqqnEp5mYtnXau160FK7eGycXFsn
	iG/VceHpxbeBV6QBCCaLaSYBMmIv4c/RCT9hN/8cQBODXdXnZwn7iL4hQF+cCRkJayv+FN6H3HR
	grj4tlH1F+biE365/CnGACjd0g1yy/mvzmIgg6KM7ZJrxi6z5baumG+wikjj2A3bsuLmsFX0oDR
	IKZrnN0vj9h5cOou2ATyP65DRFyL2ZJPKC+VkDxAYRAlp1PFEg9LrqgT5teYASxFygokON3Z3UB
	gHIFwOh2L9CroILIKsmWuLTwW8mrVy5LLWn8bQw0zSpuTAet+EiiseZ+WfBKM
X-Received: by 2002:a05:6214:27ef:b0:87c:dff0:7c1a with SMTP id 6a1803df08f44-87cdff07dd8mr268990006d6.13.1761275162843;
        Thu, 23 Oct 2025 20:06:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGkcreB+0KcKKEZo2+yTp/pEKF7bGUgeuh4BxWqNNLIOy98t8bmDiGhZCsT7X+sb2q+MU8G/Q==
X-Received: by 2002:a05:6214:27ef:b0:87c:dff0:7c1a with SMTP id 6a1803df08f44-87cdff07dd8mr268989566d6.13.1761275162274;
        Thu, 23 Oct 2025 20:06:02 -0700 (PDT)
Received: from yuanjiey.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-87f9e824a77sm27351446d6.60.2025.10.23.20.05.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 20:06:01 -0700 (PDT)
Date: Fri, 24 Oct 2025 11:05:50 +0800
From: yuanjiey <yuanjie.yang@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: robin.clark@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
        sean@poorly.run, marijn.suijten@somainline.org, airlied@gmail.com,
        simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, quic_mkrishn@quicinc.com, jonathan@marek.ca,
        quic_khsieh@quicinc.com, neil.armstrong@linaro.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, tingwei.zhang@oss.qualcomm.com,
        aiqun.yu@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com
Subject: Re: [PATCH 04/12] drm/msm/mdss: Add support for Kaanapali
Message-ID: <aPrtDoW7QlNSH12X@yuanjiey.ap.qualcomm.com>
References: <20251023075401.1148-1-yuanjie.yang@oss.qualcomm.com>
 <20251023075401.1148-5-yuanjie.yang@oss.qualcomm.com>
 <7yrjpxx2uqb7ox6yk55hsdj2cgexvcoqjjutmhnjokciy7pnl4@a3zdvmn7wmto>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7yrjpxx2uqb7ox6yk55hsdj2cgexvcoqjjutmhnjokciy7pnl4@a3zdvmn7wmto>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAxOCBTYWx0ZWRfX4KWGflGqC5bF
 hvE273Fz/03/uXayWEiqbNheQIW6HP1xh/CXQNTIPaA1h5wkhcOvuUQVUxfuY5/PavKipPWTLmx
 A/zbJyn2/YH49/Ira6IdgvMoE9VOQPnPxCt3zyE4NHQFwavfPK72mwNYblWK6NyH1fhhKRzKR1m
 HfwD9Qb0lMJRqDzWqSPOoQUygw5BFkrmrUTIWW1ZScjUaj9n9f7OJ87oMLYLNh3Ef/R6HM3eSqZ
 cJuSL3SXP2hcMz3Eb3vGVhwzv8KgBThOn9NyU3XMZShuH0sUPrFaDCt+u8kvQNn5ul7vw28ljXX
 972iq6eDKmkZMlU7w+AQeiA1TK7gerDnA/duKGizJNH9F16lrFnBg2kOopkhiVFOWCMp7COrltT
 B2Zvs+SctbIMwJ8FqhU9Acez6WbQIA==
X-Authority-Analysis: v=2.4 cv=G4UR0tk5 c=1 sm=1 tr=0 ts=68faed1b cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=kj9zAlcOel0A:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=1k5Ug2qgVVKK0g3C12EA:9 a=CjuIK1q_8ugA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: CZPuQozPZghFaFFk6u1enQqOdPx4_bS-
X-Proofpoint-ORIG-GUID: CZPuQozPZghFaFFk6u1enQqOdPx4_bS-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-23_03,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 priorityscore=1501 spamscore=0 suspectscore=0 adultscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510180018

On Thu, Oct 23, 2025 at 03:01:14PM +0300, Dmitry Baryshkov wrote:
> On Thu, Oct 23, 2025 at 03:53:53PM +0800, yuanjie yang wrote:
> > From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> > 
> > Add mdss support for the Qualcomm Kaanapali platform.
> > 
> > Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> > Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> > ---
> >  drivers/gpu/drm/msm/msm_mdss.c | 22 ++++++++++++++++++++++
> >  include/linux/soc/qcom/ubwc.h  |  1 +
> >  2 files changed, 23 insertions(+)
> 
> Where can I find the UBWC config for Kaanapali?

https://lore.kernel.org/all/20250930-kaana-gpu-support-v1-1-73530b0700ed@oss.qualcomm.com/
I see UBWC config is in gpu patch list, so I don't push UBWC config patch in my patch list.

so I should wait gpu patch applied and rebase this patch ?

Thanks,
Yuanjie

> > 
> > diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
> > index 2d0e3e784c04..665751d2b999 100644
> > --- a/drivers/gpu/drm/msm/msm_mdss.c
> > +++ b/drivers/gpu/drm/msm/msm_mdss.c
> > @@ -243,6 +243,24 @@ static void msm_mdss_setup_ubwc_dec_50(struct msm_mdss *msm_mdss)
> >  	writel_relaxed(1, msm_mdss->mmio + REG_MDSS_UBWC_PREDICTION_MODE);
> >  }
> >  
> > +static void msm_mdss_setup_ubwc_dec_60(struct msm_mdss *msm_mdss)
> > +{
> > +	const struct qcom_ubwc_cfg_data *data = msm_mdss->mdss_data;
> > +	u32 value = MDSS_UBWC_STATIC_UBWC_SWIZZLE(data->ubwc_swizzle) |
> > +		    MDSS_UBWC_STATIC_HIGHEST_BANK_BIT(data->highest_bank_bit);
> > +
> > +	if (data->ubwc_bank_spread)
> > +		value |= MDSS_UBWC_STATIC_UBWC_BANK_SPREAD;
> > +
> > +	if (data->macrotile_mode)
> > +		value |= MDSS_UBWC_STATIC_MACROTILE_MODE;
> > +
> > +	writel_relaxed(value, msm_mdss->mmio + REG_MDSS_UBWC_STATIC);
> > +
> > +	writel_relaxed(5, msm_mdss->mmio + REG_MDSS_UBWC_CTRL_2);
> > +	writel_relaxed(1, msm_mdss->mmio + REG_MDSS_UBWC_PREDICTION_MODE);
> > +}
> > +
> >  static int msm_mdss_enable(struct msm_mdss *msm_mdss)
> >  {
> >  	int ret, i;
> > @@ -296,6 +314,9 @@ static int msm_mdss_enable(struct msm_mdss *msm_mdss)
> >  	case UBWC_5_0:
> >  		msm_mdss_setup_ubwc_dec_50(msm_mdss);
> >  		break;
> > +	case UBWC_6_0:
> > +		msm_mdss_setup_ubwc_dec_60(msm_mdss);
> > +		break;
> >  	default:
> >  		dev_err(msm_mdss->dev, "Unsupported UBWC decoder version %x\n",
> >  			msm_mdss->mdss_data->ubwc_dec_version);
> > @@ -552,6 +573,7 @@ static const struct msm_mdss_data data_153k6 = {
> >  };
> >  
> >  static const struct of_device_id mdss_dt_match[] = {
> > +	{ .compatible = "qcom,kaanapali-mdss", .data = &data_57k },
> >  	{ .compatible = "qcom,mdss", .data = &data_153k6 },
> >  	{ .compatible = "qcom,msm8998-mdss", .data = &data_76k8 },
> >  	{ .compatible = "qcom,qcm2290-mdss", .data = &data_76k8 },
> > diff --git a/include/linux/soc/qcom/ubwc.h b/include/linux/soc/qcom/ubwc.h
> > index 1ed8b1b16bc9..0a4edfe3d96d 100644
> > --- a/include/linux/soc/qcom/ubwc.h
> > +++ b/include/linux/soc/qcom/ubwc.h
> > @@ -52,6 +52,7 @@ struct qcom_ubwc_cfg_data {
> >  #define UBWC_4_0 0x40000000
> >  #define UBWC_4_3 0x40030000
> >  #define UBWC_5_0 0x50000000
> > +#define UBWC_6_0 0x60000000
> 
> This should be tied with the ubwc config changes as this chunk goes into
> a different subsystem.
> 
> >  
> >  #if IS_ENABLED(CONFIG_QCOM_UBWC_CONFIG)
> >  const struct qcom_ubwc_cfg_data *qcom_ubwc_config_get_data(void);
> > -- 
> > 2.34.1
> > 
> 
> -- 
> With best wishes
> Dmitry

