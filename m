Return-Path: <linux-arm-msm+bounces-78583-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 71717C00F19
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 14:01:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6097E1888C69
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 12:01:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65EC9298CA6;
	Thu, 23 Oct 2025 12:01:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ERRuSMqz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4D8B306B10
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 12:01:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761220882; cv=none; b=MYEMJ0Li88zRKgJt/AQydnOm6juJKUSUTCiL4S2dqVGw+ttDO7ujvuRzUIv3+25WJSM04GALhz8AiLWTwfyr6rccHbFQnZJxuNI3UGwNv3trBdkbVP9O4pFtVL9QZOOcssAXR1EDXB0u056ioxq68lIVqHzPZMfoBTZsbKVSCbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761220882; c=relaxed/simple;
	bh=xgyOM0BDgOZaPTwKa5g6GcOjB33jTljJLH+mwWNy4PM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gvDshJcZea+SQdrVRU++MttE+7+SUX4g50A+Dh9IGmtg5nIu5PMVZSC1CbW+lD+Pt3wZ4O8PhOzGxpf9pWcqnXmeo7dalWmABNxqvT+njSifYEzgWlxe6d1HgJUY9yTBzCCx3BbHCO3HOQmn/ref3hh5b37GLVRqlAhZOPGe+WI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ERRuSMqz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59N6Wc4L015966
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 12:01:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=goeKdp/WYHhJWHlaAy8C59qV
	Sxphru8lrJomaYpY0h0=; b=ERRuSMqzetasBthM5RxIR9p9b2FPm8/Zi9gQWLY0
	SWJKLQH3qGe3Mq76R8uVPpVyCGW6AW4M+wZYJS71aQ53AZ+Nf/5DX9OLRbl5YVyW
	6qwP1S9MqpLVA0Twp8C7onzazAZ7yLPI4VIwdcN37Ve+vNEmQZhurqmqh7mpB45T
	2lSiqaiSCf7Uxy5HbdFZ4D2n9ujUKPqm0fjLd4M1R6tiEWB9MrI5FMxCphd0eb4+
	8Iq0Ow4f6r4c9YyLla5aA5Qj2ChVclZVYiHAdvpK8Ybxhcvi6xc4XhKNcT2x4pt3
	jF8MdXeQ5d+4ji3YvPL4ROa5SEEAWvGxM48KJyDiXqbwFg==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49xkpsdwcn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 12:01:19 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-557c0337356so1415065e0c.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 05:01:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761220878; x=1761825678;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=goeKdp/WYHhJWHlaAy8C59qVSxphru8lrJomaYpY0h0=;
        b=EEKL/3/vVr/cAgZvtjE+/9EZ16/PrAWG4yonZg04zkx+xkcTxec6NF6nVhN1pt1EWb
         3dlO7ep3x3X9mvdrh0B+9gjfW2A2Vr2Dfsb2UmbTXYEMHBPvunpFJ4wbsmGxBs0wfAcv
         Aw0owj8vKRsWIyPSPvWoSU3Cd3OBxFjT0S6R+t+WqiRd3nK/WEh9izb4VlQuEMIUA95m
         /RYiEzwg4kRnriOC3OCIVCdZzx9iI/z6Hpbe53XTJXhwWL1yaeq2VJfrai/l5xm2py/7
         Gqid6KUTtC5fCvYb2mk1dQIc5icDo25g9WCRGETk5kZFl30vTpx+0O6D6BfdjkDEbFl1
         Jnng==
X-Forwarded-Encrypted: i=1; AJvYcCWswYLkW+8XFEyhoOJ1IhK06uve2OOABxdDLBm+N0JZdPkKjko5f3/L5pQS6nDos91FSd8A2T5xshAuIdh2@vger.kernel.org
X-Gm-Message-State: AOJu0YyW5Bvl1C51ilug4L77+63/nVwswv00oErfevOmZTxvJEOQB1/s
	7iSt73+aD9JripGC8YkFQt5xpnhXcNlnfCMBGxFEVhNFC48WxgVfhuiYsxAGSc3hE3wWeHK82Aq
	IF+VkX0kyAiZ+PcmbJ8SOscHatHPs2vvNasyOi+wVwI8nVY9pwUTIr7oLfkQRe4L9gr5B
X-Gm-Gg: ASbGncv5MKXXiF+UNnY4EWQcaNPhosTCG0xutLHyDFFYMiArNb8u7NwIrgrKwZiZRPH
	toInhk3zO9DlRnLDmgwzuBVoAKCGOULZWzQ21z9Q6fDcNK5OM6HLhaiyZAqNPUjGZA382DRxRlC
	oNC0gCbRVF3Wcg6LG5BnVULWtlTojSdvumHXpJ/hpDdipK1WZ8m4o8vGeaFNFpp0vKo+ma7ieI2
	6NlnCqoflYOqNjhDONB9lWLHCKOpeaiNW+cv4boX0JF61MjgIz2KexWYEysv4JxyVr/I5X3YQob
	VxMFjZJ27Fg2cLXJGKCwY9Syjh5Gk8dp4R0EjuarWJlCyI9BmJv9wPHjHUJisKRxvmgu9UzqdSx
	ZXAPZ0SlnflbYRPrmn+IbyfMeCyj1uPK7ofAGmH3XKe7LoC68BPu436Z2C+IkcKTPhnxIkiAqk4
	3F9xxOFIP3jCLo
X-Received: by 2002:a05:6122:c457:10b0:54a:8deb:21a7 with SMTP id 71dfb90a1353d-556a1fe00b0mr1375532e0c.4.1761220877760;
        Thu, 23 Oct 2025 05:01:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGYxrTX1ih+hGngZciP+iHFYfeFoyaVhepsbpmQ8PJc+gldudoSg8FgGhwuto7pKkQZUsY/ew==
X-Received: by 2002:a05:6122:c457:10b0:54a:8deb:21a7 with SMTP id 71dfb90a1353d-556a1fe00b0mr1375509e0c.4.1761220877262;
        Thu, 23 Oct 2025 05:01:17 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-378d66bbd08sm4052251fa.4.2025.10.23.05.01.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 05:01:16 -0700 (PDT)
Date: Thu, 23 Oct 2025 15:01:14 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: yuanjie yang <yuanjie.yang@oss.qualcomm.com>
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
Message-ID: <7yrjpxx2uqb7ox6yk55hsdj2cgexvcoqjjutmhnjokciy7pnl4@a3zdvmn7wmto>
References: <20251023075401.1148-1-yuanjie.yang@oss.qualcomm.com>
 <20251023075401.1148-5-yuanjie.yang@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251023075401.1148-5-yuanjie.yang@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIxMDE5MCBTYWx0ZWRfX0BC1+wVtKccE
 3y5jqTM4lg16wXiDbMSiASN2C6sBmntSS32cIS9cUXabyZeCMU6rxyFovf50HB6Wc62cB1rDg30
 yGhIqxW1Dnw4VlLiVNBUei8zpjdrI0J1WrC+2x8keHQQDxJLECwuwdg1MdGXzuRc+vjTQCGfNpq
 S3+BrH4JGMUjKnW43/XjB11D7P3kRzwRQXWcJ3r7bMMmoSR3YBEGQC2Blh5NiBZEVEk5ujySfMf
 SQt+9m4FUjMaUq0xRryUHqYySNzYcUWymZ2yAO+wRk+lJFTC5Re6fNjcP1JJHRqcJvzA7xdgMKD
 jzDvP7SEiJ+tSeb7vLwlDAXUYffKX2eenBnL3swMN16fJpazib6PO8FBCM2Yj5y6Hh4xQqxUOWd
 2+2YrqR/3buzdJF9Fhos8Iqo+DeuoQ==
X-Authority-Analysis: v=2.4 cv=FbM6BZ+6 c=1 sm=1 tr=0 ts=68fa190f cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=FJEgi42wPuteDVaKdBsA:9 a=CjuIK1q_8ugA:10 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-GUID: 2Ybd-9MUv-3KiFEKbYe0Qe3ZHehA-C3C
X-Proofpoint-ORIG-GUID: 2Ybd-9MUv-3KiFEKbYe0Qe3ZHehA-C3C
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_08,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 spamscore=0 impostorscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510210190

On Thu, Oct 23, 2025 at 03:53:53PM +0800, yuanjie yang wrote:
> From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> 
> Add mdss support for the Qualcomm Kaanapali platform.
> 
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/msm_mdss.c | 22 ++++++++++++++++++++++
>  include/linux/soc/qcom/ubwc.h  |  1 +
>  2 files changed, 23 insertions(+)

Where can I find the UBWC config for Kaanapali?

> 
> diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
> index 2d0e3e784c04..665751d2b999 100644
> --- a/drivers/gpu/drm/msm/msm_mdss.c
> +++ b/drivers/gpu/drm/msm/msm_mdss.c
> @@ -243,6 +243,24 @@ static void msm_mdss_setup_ubwc_dec_50(struct msm_mdss *msm_mdss)
>  	writel_relaxed(1, msm_mdss->mmio + REG_MDSS_UBWC_PREDICTION_MODE);
>  }
>  
> +static void msm_mdss_setup_ubwc_dec_60(struct msm_mdss *msm_mdss)
> +{
> +	const struct qcom_ubwc_cfg_data *data = msm_mdss->mdss_data;
> +	u32 value = MDSS_UBWC_STATIC_UBWC_SWIZZLE(data->ubwc_swizzle) |
> +		    MDSS_UBWC_STATIC_HIGHEST_BANK_BIT(data->highest_bank_bit);
> +
> +	if (data->ubwc_bank_spread)
> +		value |= MDSS_UBWC_STATIC_UBWC_BANK_SPREAD;
> +
> +	if (data->macrotile_mode)
> +		value |= MDSS_UBWC_STATIC_MACROTILE_MODE;
> +
> +	writel_relaxed(value, msm_mdss->mmio + REG_MDSS_UBWC_STATIC);
> +
> +	writel_relaxed(5, msm_mdss->mmio + REG_MDSS_UBWC_CTRL_2);
> +	writel_relaxed(1, msm_mdss->mmio + REG_MDSS_UBWC_PREDICTION_MODE);
> +}
> +
>  static int msm_mdss_enable(struct msm_mdss *msm_mdss)
>  {
>  	int ret, i;
> @@ -296,6 +314,9 @@ static int msm_mdss_enable(struct msm_mdss *msm_mdss)
>  	case UBWC_5_0:
>  		msm_mdss_setup_ubwc_dec_50(msm_mdss);
>  		break;
> +	case UBWC_6_0:
> +		msm_mdss_setup_ubwc_dec_60(msm_mdss);
> +		break;
>  	default:
>  		dev_err(msm_mdss->dev, "Unsupported UBWC decoder version %x\n",
>  			msm_mdss->mdss_data->ubwc_dec_version);
> @@ -552,6 +573,7 @@ static const struct msm_mdss_data data_153k6 = {
>  };
>  
>  static const struct of_device_id mdss_dt_match[] = {
> +	{ .compatible = "qcom,kaanapali-mdss", .data = &data_57k },
>  	{ .compatible = "qcom,mdss", .data = &data_153k6 },
>  	{ .compatible = "qcom,msm8998-mdss", .data = &data_76k8 },
>  	{ .compatible = "qcom,qcm2290-mdss", .data = &data_76k8 },
> diff --git a/include/linux/soc/qcom/ubwc.h b/include/linux/soc/qcom/ubwc.h
> index 1ed8b1b16bc9..0a4edfe3d96d 100644
> --- a/include/linux/soc/qcom/ubwc.h
> +++ b/include/linux/soc/qcom/ubwc.h
> @@ -52,6 +52,7 @@ struct qcom_ubwc_cfg_data {
>  #define UBWC_4_0 0x40000000
>  #define UBWC_4_3 0x40030000
>  #define UBWC_5_0 0x50000000
> +#define UBWC_6_0 0x60000000

This should be tied with the ubwc config changes as this chunk goes into
a different subsystem.

>  
>  #if IS_ENABLED(CONFIG_QCOM_UBWC_CONFIG)
>  const struct qcom_ubwc_cfg_data *qcom_ubwc_config_get_data(void);
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

