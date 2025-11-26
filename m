Return-Path: <linux-arm-msm+bounces-83356-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 18B21C87D2A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Nov 2025 03:26:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 4FC2534F932
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Nov 2025 02:26:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A26032FDC30;
	Wed, 26 Nov 2025 02:26:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MIjijmdb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aSOBSh/d"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 314E523A564
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 02:26:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764123973; cv=none; b=qRGAm9eUex9dzf0q36sLevGGdsfNiNCXeEa2RPDq8KoY9fe3U+htDKb+iQ4bGGeh2+2X1sZaXjCaVkpHDmv+dSvnMqBZjO1mkc0W51tvLuMUiUmXnwSgkbbuSqM14yXlAOzkZ1bspMSKjlT8HAnAXBQ6P5I/EHX/NDCCAwdyxpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764123973; c=relaxed/simple;
	bh=IvkwnBreerHye+pyyWKXJbSIvj4RH/cd9+Bnp1+28CU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S4pUV73RNQFlo5TfVLuuYFftBvjwEaIleLWnboEnXvf5dBtOZynE5Q/712S5Sl9Cqt72O6LdGQ0i5JHKRVefL2IolM5mZsYs+jMKr/h/PYD03eIth5D79qRJukno4gxD6pQB0/ce9ZV7PilhHuKMuNY7cLonM1iDtjcnrMHOyMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MIjijmdb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aSOBSh/d; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5APGmXVQ2655351
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 02:26:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=TxSG1ManjepYP5kIvbTRIx6w
	sMG9QO6qn584WZ2KdCE=; b=MIjijmdbj4J9ynEqZ5gC2dJ5dIiY3zSRDJiUt5tU
	8x719mlOxmciR+E1sOQVi1ygJ1bUuoJhgnhahm+dY2yR04FQqgIQfcaorhPmsqpL
	KH4j6yodePHJE58LI9Ly9VbR2rPJ8pvJq+3poRWDwNh4XHROu0xUwm6SokgvDEUn
	G+hL1a6eueoxcBHJ0825/V/s65XLI9BFx3DJxb38TpkZZOZnb4T7/b+gGiVdL8+V
	h8sYww3HaajvD5OdUUQqLz0jwHnQ0bMBRuVOHIVDxm3Z6gkZt2CVuxT1/ipp82Y6
	pC2LUqUHi+5k/jE16CgvqLA5qPCiWUrv7aYjbU6A6EmM5A==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4an9fxtr6g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 02:26:10 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4ed7591799eso148624851cf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Nov 2025 18:26:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764123969; x=1764728769; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TxSG1ManjepYP5kIvbTRIx6wsMG9QO6qn584WZ2KdCE=;
        b=aSOBSh/dCV9myBx9J8AEdTkXaMBU9RhcMk1qkdlGo9QzqCXff/ihp5oKYGBZ4ScS4q
         vDFnTzte+icoKJkmrn5SHvz2DcCP2yJBjIKIrxumXH7AEN5lCzfCdHFvnk4hi/fJ9v+w
         csonRMNXBz0Wg3F3piUdKzO+MQYYYEKfnCYI3SCOT86N9Drr9JT6Ht8ln8sK81nanACB
         eF1nUb/Vvno8Vno0bG6MoaRtVivB8wM9z8bdBXR5DqdzF3nZXd9VEhFRAU0ebQ7j9A8/
         2cQ/UJpqw6NIBpGwfW9uaT7KJz4isyHiyOpkrIYVZuhKHi5kFPcPAvxb+oCplxsBT3mE
         Lnew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764123969; x=1764728769;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TxSG1ManjepYP5kIvbTRIx6wsMG9QO6qn584WZ2KdCE=;
        b=oEX2VtdJ6cTfsOOtQoO7O+vIvONwm/VALha310hKoW/z2GwSWwvQ8RsPAUbW/cccdL
         dHZR6zDF/jwgocJqc1FKGtbhhQosY+BvtspTMLvR6HCOpy+kgQpNQGkW/yuclAUChZyX
         FhKPHDEv7AAE056xEhDUIm+RiAEoKcaDTBLfBDO6nrEPWZ4PIG4dAmN5g49zIqeqqF6C
         iHSnush3AQ/irry+iDvCzY1MQSYRGMPV2QtprMuL9t2slw+lfflhzrGwCpy+bHDLlJvO
         3FeT80h9G9FSrlXEYRpdTYfk9yhMIqTgg5ah+QGLGch+VGZ3HNDxF+j37+zFV/7seets
         hUrA==
X-Forwarded-Encrypted: i=1; AJvYcCX+UetCzp1AJuHwNFSQQVTUeA4Y97mLwpO9WvVVd+nvSs3L5EdkeoMHqo0q2b/24gmF1be0wTMaHcuyqbD/@vger.kernel.org
X-Gm-Message-State: AOJu0YyzdMWqxIeRYg/xhLvll6jPqLYrgKRGsSkD8o8kqC9agSaza3YK
	Ahhz1iDE8t6AwVAAamTPwATSXc58I0hlk1xwnwYbKBWEE6PdrNLqdSkhcdmLwWTRb4whIKevGcQ
	R9he7eWFRqzqQmoNwHjPEshkURoenuIL8QnJql0BZde86wQtjjt9sAM5G6HFZhVjG+QWe
X-Gm-Gg: ASbGncsMZ9UNBTM8rH1x5kdsjHa35zvDlMFXiBafTR81vxFoAMmnJ8gMAIrWkf1AqSY
	xYAEX/o22J27MPpfxcjKvubKmlfhfs5Ynq9LBNG2NaE4oH3STpYNqN0s0q1VHkvDFbLlortVBW6
	kKlomAcQI849XEQBeHaL2OXE8bZLgm8DTrSYKapVFWHOwGNdR9HlKQYzunUAfZqkKNt+wrY0s1o
	bwWRX3s1VPmT07yC7fNudZUsHihy7T+Qh3/eBsNcg3TeDWdpFaTkGL2NMjy2N30nOCCeamFQRPW
	SyQ9ZqNXJASv+X0MxCeFwPCCn5hyQxcndbqwdCLx0HP6L8TC7CteGOgQUOPfRxog1by1mGHEMpi
	iAN9YrMXDmS0hCWvtIC13dLFfep/8RnbozEp/gYIUFHD61S8VP/G4jwlNrQdPV149B1l8M2/VFl
	0=
X-Received: by 2002:a05:622a:1812:b0:4ee:4709:4c38 with SMTP id d75a77b69052e-4ee58943fb5mr234067811cf.80.1764123969284;
        Tue, 25 Nov 2025 18:26:09 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEz8HcPa9d0VpPpenRMeT+be3LkzfrhEnN46hyIHhUBzFTAfu0MT5HHoOY/YvkYm3AIa6rYVA==
X-Received: by 2002:a05:622a:1812:b0:4ee:4709:4c38 with SMTP id d75a77b69052e-4ee58943fb5mr234067381cf.80.1764123968793;
        Tue, 25 Nov 2025 18:26:08 -0800 (PST)
Received: from yuanjiey.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8846e5749bcsm137582306d6.44.2025.11.25.18.26.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Nov 2025 18:26:08 -0800 (PST)
Date: Wed, 26 Nov 2025 10:25:57 +0800
From: yuanjiey <yuanjie.yang@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: robin.clark@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
        sean@poorly.run, marijn.suijten@somainline.org, airlied@gmail.com,
        simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, quic_mkrishn@quicinc.com, jonathan@marek.ca,
        quic_khsieh@quicinc.com, neil.armstrong@linaro.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        tingwei.zhang@oss.qualcomm.com, aiqun.yu@oss.qualcomm.com,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Subject: Re: [PATCH v2 05/10] drm/msm/mdss: Add support for Kaanapali
Message-ID: <aSZlNaMSRYRLwYhx@yuanjiey.ap.qualcomm.com>
References: <20251125064758.7207-1-yuanjie.yang@oss.qualcomm.com>
 <20251125064758.7207-6-yuanjie.yang@oss.qualcomm.com>
 <teg6is2sw35s5nyd6df74hwhctnx4txjd355reqpgfwl7xtkq2@e2rzbskjfz26>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <teg6is2sw35s5nyd6df74hwhctnx4txjd355reqpgfwl7xtkq2@e2rzbskjfz26>
X-Authority-Analysis: v=2.4 cv=I6tohdgg c=1 sm=1 tr=0 ts=69266542 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=kj9zAlcOel0A:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=inixIHUC_2VtAalyxKMA:9
 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI2MDAxOCBTYWx0ZWRfX+icoGRyXJHkg
 RpsAn4hUwFWwHwkV6ed/TKOPRWo3dZq7B8BR5FT0p1Owuqepm7wfjCchHeteCl0KAm5Vj6YCZdv
 19ocP3c6Ejo9UhtOXeFMw5NEE5YceUUuCftIz4B6hXAgrfWNU3LLHYF6jbKwr97p3fEaLUR9t8S
 fCESyGxGJYXGxxAAD+AbJJx3+FxMf6b4t7cWlUI4ZSsh7LW045hKfGgiYkXBvfwn5HxI9VUIEje
 H2JnqfWFwUJmUeExpz7HwHQSbWa4qulEctJOJwAntCizdOJ9s0l4BTKOYwD+436KyCNWjvDFQYE
 M+Eiip7lW89sCX4//IuGCEbYitZNd754PwdsD1ePQ==
X-Proofpoint-ORIG-GUID: KKN0s154TqNevyCEsJu7MpP-Kfy2sCeQ
X-Proofpoint-GUID: KKN0s154TqNevyCEsJu7MpP-Kfy2sCeQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 spamscore=0 adultscore=0
 malwarescore=0 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511260018

On Tue, Nov 25, 2025 at 04:47:09PM +0200, Dmitry Baryshkov wrote:
> On Tue, Nov 25, 2025 at 02:47:53PM +0800, yuanjie yang wrote:
> > From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> > 
> > Add mdss support for the Qualcomm Kaanapali platform.
> > 
> > Co-developed-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> > Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> > Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> > ---
> >  drivers/gpu/drm/msm/msm_mdss.c | 22 ++++++++++++++++++++++
> >  1 file changed, 22 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
> > index bf9a33e925ac..797ef134e081 100644
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
> 
> Can we please merge this with 4.0 and 5.0 functions?
Ok , will do.

 
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
> 
> After glymur, please.

OK, will do.

Thanks,
Yuanjie
 
> >  	{ .compatible = "qcom,mdss", .data = &data_153k6 },
> >  	{ .compatible = "qcom,glymur-mdss", .data = &data_57k },
> >  	{ .compatible = "qcom,msm8998-mdss", .data = &data_76k8 },
> > -- 
> > 2.34.1
> > 
> 
> -- 
> With best wishes
> Dmitry

