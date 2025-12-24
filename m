Return-Path: <linux-arm-msm+bounces-86460-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 080FDCDB2BD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Dec 2025 03:25:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5CABE300726C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Dec 2025 02:25:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7B1F274B44;
	Wed, 24 Dec 2025 02:25:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ix51g6Pd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PKhwMx7H"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 266AE196C7C
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 02:25:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766543124; cv=none; b=L9VtSEAG/R0Clnt1JJYJ15AqJWgGs1ozObZ9+ulW0evbn02P4WWgJv1/ScExAnaN1JaWUSkP6dYM9dIbqfLKVvD+LP7cwn9nFcKZcBTOQrr9oNX0LvnBM8+4ChQIky9yuLVGejEj+OFHwrNyeXAviTBwwh8OEdc2a48SwFpwJ8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766543124; c=relaxed/simple;
	bh=Q2u8UqAa8GkbUAhuaJ7JCVRvNutUwRpMRuPnQO5w4BU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eynYc99NB1XFVuRBmNNgZlfBs8nq3OehmJYyVB/2edJtDfq21BMWoLprJy/SDzwa4naymzcJTAebtKn0ByVbmcx8NBm/xuFiddrK2O5MIRBh2TN3prXJkqyavudNa1fuqFCma4kN2f1XQLNsG0qeofHsB5+YwjTJDB/Oqt/AoNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ix51g6Pd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PKhwMx7H; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BNGO9ZB1018084
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 02:25:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=kJMSIrPxVRjOWG8ys5y3zHEr
	idLtCLiJY6TEPFUHWO0=; b=ix51g6PdfcG4VDQ67f5SKdxUHI0rXS5UYZfVIebi
	Pc45weHyC0n3bs0cUWce04cz0VY/YFxN9r0iiZxNhq6Eim1fjqeFemJIxNNXIPoo
	9ChAM7mRvyHEE2FLB+RT5cpfRVJbJGvvwgb52/eNIrL38riJQSKPFHIb3A/h+ti7
	wEWSkQiNxSZyD73GwWkwk+3ef+SV1yF55PLRHZ4zO/zRp5qBayzUlwDBKpSR1UHP
	HycmFozA3LWOWt7YstSl6ElXQc93O5Rfmh2tvAE57Yi054rS5EDWSHPIvkB8R/Y4
	0b2oh93zeXNO72YrBcobqtEm7zPGIIW73sFCpnC63+VPAA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7xjs9ft9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 02:25:22 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-88a2f8e7d8dso145885686d6.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 18:25:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766543121; x=1767147921; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kJMSIrPxVRjOWG8ys5y3zHEridLtCLiJY6TEPFUHWO0=;
        b=PKhwMx7H4weiHMgDJfNRNXSCbXDiMIQLkA//ajJgjPNN5IXEh+3ZjI7wNx+dXQKKq4
         j/5aZjKCW94DpVmGY49d1n5Xl2uTt2n6zGYvNocadM0MscVgqVqZ7EVoWzI5yTpeQgdN
         RRgzwEBHnQEKiBw3xrvB+Dk8+6sjaqSJM0EsZ2WOz64K6pd9YUcXj/ZYvgSU9QU6prpp
         HSq2aJ5xQrfEVGeOcihFUQgSk+UDkdFOzlLwgvaETc9cSG1cTYmrEq5Xw5oaBqSRBLNO
         1bh+4mPHstG+62P3rlZmPHDxxbC0Q8ROAFIvY77MZeDcm5ph2/cfPdGI2WARTZ3oatm2
         1oLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766543121; x=1767147921;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kJMSIrPxVRjOWG8ys5y3zHEridLtCLiJY6TEPFUHWO0=;
        b=FRE7f1ayvjQua/iOUVFf9nUyY+csULVtFPsiI/5oDcJTmMXqXdxiacC68/0KlWh0YP
         AP4L2luFskHzrt3CDAWebCKtOEw2ZvfqZsQ9Gg/t+PAfU+jK/D4VPuetowBuCAwjKTSa
         z4h+8CvFLgoRtwBQmuAsx2WisM5f8wcCa7bb1LwITcXhriCIe7afyfVzsPxuGz13IXKI
         WN34M2kLeQ2zGh3jZX5qIUvp5bfO8tqN7hvm3rnRtJUbYvIGOnny8PQda5CGE92BQoDN
         oKESwvquLAeI4pFmhzkxJak1MByY5vXfi0Xzi//60wRqi/yHvZzoaTLJsrF8E3FNlorH
         oq2A==
X-Forwarded-Encrypted: i=1; AJvYcCUR9hGYMghvjZjdFojoleWUMnUNmyMyAYb0xG57YD8NGXBjghTgphAE3MfYkm2/DeAoEW+yx3X4j4P7GX1S@vger.kernel.org
X-Gm-Message-State: AOJu0YwRjMEl4kfp+oyc9uszWMd7Bwm/j82JrxGvBfH93oH0ipg6J9vm
	WJHH8cYUsWekkhvGpyMqC5TqP6bjLYTa7LiEnwzeacTEX+0C0DNwTAI++6FIr3sb3K8d4eCG5zL
	2LCy0JKTCGnL9+CsslheCooqmp2iUFCUD4HRDwQ33ktKaw/BdHdjtB5ermfFwIarLSWL5
X-Gm-Gg: AY/fxX5ECu6d4x/AZaN7mt6Y8NSLbBUqv8EU1Fy6qtjkw2k6fDwgzUAsyoqqFhoJBOM
	GAivSYJ4BMqG4NH40AYCCarqmKLRe3JT5Eo9B2V2C63MdqbJuRoi3elEv/QWnqGC1E1xDZD0d4y
	4Vvo72B/i1I2xry/L2u7YKEgxGRtP96RYf2kCTlKmYv372jU6SYWlz1m9Llnf41KGGzXktBRMsU
	2DDtGOjd67XvkB+rmLovxAR77gX5HHPhbnVl99PSUSetljWB4RKalWpsnT/NaIdDnvVmehnpe9/
	+VBCsM+sQ639isLrt7npsfRGSbYi9fzWQHgC4aqGFyCfcUxNX7So7u5s8tdFtu9SIjeWNfLjV/t
	DciOVff/lExNI9tPI+lRFFqRZstWLbfFDyhfTookI97VE3L/hNwFhMCWMuXL6llJD2EpmWa4=
X-Received: by 2002:a05:6214:491:b0:882:6797:3a67 with SMTP id 6a1803df08f44-88d81278f16mr272973206d6.13.1766543121337;
        Tue, 23 Dec 2025 18:25:21 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFrNdW+R0PdyyGcoJ/iH1xT1ZvVmp3X4bDgF/iM5YBDtBr8TepTmAOt1PUis9RhdZlldhttbA==
X-Received: by 2002:a05:6214:491:b0:882:6797:3a67 with SMTP id 6a1803df08f44-88d81278f16mr272972716d6.13.1766543120870;
        Tue, 23 Dec 2025 18:25:20 -0800 (PST)
Received: from yuanjiey.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-88d96bec097sm117191926d6.16.2025.12.23.18.25.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 18:25:20 -0800 (PST)
Date: Wed, 24 Dec 2025 10:25:10 +0800
From: yuanjiey <yuanjie.yang@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
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
Message-ID: <aUtPBuotEGDLcz/S@yuanjiey.ap.qualcomm.com>
References: <20251222102400.1109-1-yuanjie.yang@oss.qualcomm.com>
 <20251222102400.1109-11-yuanjie.yang@oss.qualcomm.com>
 <fto47ksvr6i4fxl52yqcdgatut7oqepgc7d2slrn4gr7yi2xei@s3bnte4sdk5f>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fto47ksvr6i4fxl52yqcdgatut7oqepgc7d2slrn4gr7yi2xei@s3bnte4sdk5f>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDAxOCBTYWx0ZWRfX4LIwnZ9zQAlI
 GNmCwp2LNJ/DIP+beiS7S2CSyIx4GbjQUTqfdmoUJC+3ySc1Vi62k7TRxiYiXX4Zjg03ci1Rjzd
 d7/kLJ+DOl375At2Kp9F0b/zIsHz0K31KnfDd6ZtV2tDCrFZnmimtEEl9CWhOx4jF3mLM1znI0T
 l/np8PaWGuePAStVHBPJ3spYwi/hKyHJuRcBaDD7ArzKj1TxLeEbAzc0DvoNvFcC0ma3tgtw8CL
 ONYUcr8n9JPXRKgz4KHZNrPDJZQh8vsCTbOlJL4U7js++rhGHMtf+u3nZ63il7nQMCazeW6QpOy
 VMrKt6nRekU5dnOV/aOAL1lZJG30tI2hJOdi9o8aVl9GGSQMnFRA4Z/FthGHlvRaXjPx9jsuvax
 i/BxgfAF6PfyeiLsuUX0qfwosq6JNYR15FoJfHJ3BIrHQ/6SHJci75XdL1C9VFcGRXUPjLOjRgD
 jl6JFb8UwPsa4K7qb1Q==
X-Proofpoint-ORIG-GUID: _i5VNfSYdaULG_anyzX1mdkcqsBgSL8o
X-Authority-Analysis: v=2.4 cv=YcqwJgRf c=1 sm=1 tr=0 ts=694b4f12 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=kj9zAlcOel0A:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=EeaRNE0bk9nq3hHqtxUA:9
 a=CjuIK1q_8ugA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-GUID: _i5VNfSYdaULG_anyzX1mdkcqsBgSL8o
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-24_01,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 adultscore=0 phishscore=0 clxscore=1015 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512240018

On Tue, Dec 23, 2025 at 10:30:56PM +0200, Dmitry Baryshkov wrote:
> On Mon, Dec 22, 2025 at 06:23:59PM +0800, yuanjie yang wrote:
> > From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> > 
> > Add support for Kaanapali platform SSPP sub-blocks, which
> > introduce structural changes including register additions,
> > removals, and relocations. Add the new common and rectangle
> > blocks, and update register definitions and handling to
> > ensure compatibility with DPU v13.0.
> > 
> > Co-developed-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> > Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> > Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> > ---
> >  drivers/gpu/drm/msm/Makefile                  |   1 +
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c   |  13 +-
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h   |   4 +
> >  .../gpu/drm/msm/disp/dpu1/dpu_hw_sspp_v13.c   | 321 ++++++++++++++++++
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c   |  18 +
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h   |   3 +
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c     |  17 +-
> >  7 files changed, 371 insertions(+), 6 deletions(-)
> >  create mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp_v13.c
> > 
> 
> > @@ -291,9 +292,10 @@ void dpu_hw_setup_format_impl(struct dpu_sw_pipe *pipe, const struct msm_format
> >  		if (MSM_FORMAT_IS_UBWC(fmt))
> >  			opmode |= MDSS_MDP_OP_BWC_EN;
> >  		src_format |= (fmt->fetch_mode & 3) << 30; /*FRAME_FORMAT */
> > -		DPU_REG_WRITE(c, SSPP_FETCH_CONFIG,
> > -			DPU_FETCH_CONFIG_RESET_VALUE |
> > -			ctx->ubwc->highest_bank_bit << 18);
> > +		if (core_major_ver < 13)
> > +			DPU_REG_WRITE(c, SSPP_FETCH_CONFIG,
> > +				DPU_FETCH_CONFIG_RESET_VALUE |
> > +				ctx->ubwc->highest_bank_bit << 18);
> 
> I'd prefer if this is pulled into dpu_hw_sspp_setup_format().

OK, will put this part in dpu_hw_sspp_setup_format.

 
> >  		switch (ctx->ubwc->ubwc_enc_version) {
> >  		case UBWC_1_0:
> >  			fast_clear = fmt->alpha_enable ? BIT(31) : 0;
> 
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c
> > index 478a091aeccf..006dcc4a0dcc 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c
> 
> This commit was about SSPPs. Why are you touching WB?

Look like I should drop WB part in current patch, 
and add a new patch just "add qos V13 in WB".
 
make it more clear for each patch function.

Thank,
Yuanjie

> > @@ -148,6 +148,15 @@ static void dpu_hw_wb_setup_qos_lut(struct dpu_hw_wb *ctx,
> >  			      cfg);
> >  }
> >  
> > +static void dpu_hw_wb_setup_qos_lut_v13(struct dpu_hw_wb *ctx,
> > +					struct dpu_hw_qos_cfg *cfg)
> > +{
> > +	if (!ctx || !cfg)
> > +		return;
> > +
> > +	_dpu_hw_setup_qos_lut_v13(&ctx->hw, cfg);
> > +}
> > +
> >  static void dpu_hw_wb_setup_cdp(struct dpu_hw_wb *ctx,
> >  				const struct msm_format *fmt,
> >  				bool enable)
> > @@ -202,8 +211,12 @@ static void _setup_wb_ops(struct dpu_hw_wb_ops *ops,
> >  	if (test_bit(DPU_WB_XY_ROI_OFFSET, &features))
> >  		ops->setup_roi = dpu_hw_wb_roi;
> >  
> > -	if (test_bit(DPU_WB_QOS, &features))
> > -		ops->setup_qos_lut = dpu_hw_wb_setup_qos_lut;
> > +	if (test_bit(DPU_WB_QOS, &features)) {
> > +		if (mdss_rev->core_major_ver >= 13)
> > +			ops->setup_qos_lut = dpu_hw_wb_setup_qos_lut_v13;
> > +		else
> > +			ops->setup_qos_lut = dpu_hw_wb_setup_qos_lut;
> > +	}
> >  
> >  	if (test_bit(DPU_WB_CDP, &features))
> >  		ops->setup_cdp = dpu_hw_wb_setup_cdp;
> > -- 
> > 2.34.1
> > 
> 
> -- 
> With best wishes
> Dmitry

