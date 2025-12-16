Return-Path: <linux-arm-msm+bounces-85308-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FF93CC13C9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Dec 2025 08:02:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D7596303026C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Dec 2025 06:56:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CDFE3370ED;
	Tue, 16 Dec 2025 06:56:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Cvvn/6aS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BuIxkKxV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFAA730F7F6
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Dec 2025 06:56:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765868208; cv=none; b=AO3HEZyhLoR3m4OjJ1XCCQGtKZydfltVMKUDnV5FD10oHVdQJuHHVuE9pb3MjcuwfqtPIeJ0TewQEu9I0PIChEca6L9KILfQ3aSceIj8XQmBqq3JhzBUJAoWYIPXvvkctfDyShn8ocRxjmqC9dZ23hgovkfSczooVAC/+uU4sYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765868208; c=relaxed/simple;
	bh=709khksNuZKmtT71dlZTOo7Ps/cpvnEphMdn38NM5C4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m1rceHPZrWbqerizYNyO+FNJPABaK8m+YSY6Fdv84QKjlsJHPYohYhkZHEkgmtFRrDMqvfWFa/nPtOZzkGmNLNU/yVdvNLOlUr65ujHbAI51XRkw8TusFgmtce8ftxZF4gq21wwaC+vIz9nllzCMdJXg+9LLWq6IHALEihOup8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Cvvn/6aS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BuIxkKxV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BG2KrKx1131638
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Dec 2025 06:56:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Qq0o/o5mq7+GYYh0mZ6Yhmwi
	FC0Spd5O2WRdpBvbVAI=; b=Cvvn/6aS1fWlxEEenRLUS0s4I9haInDuEiH/qQP+
	DHHdpTokI1Bjix2M41K+4n/kuHof0RYJEaiDWN0boqNGbuNlEoOqEY/4btGilgKc
	/lvXq1YUK6gS9O7ImNI4aLBe0UEPnyPGA+mwz9BMBaDjYZeZcnEWG+klsgbfK/qi
	L3rhpJ6IWn7Y3bOiNX3cYwe4XwM1bOgXW+j1HASZwr4QjYN8d7YSdpFYsLAY9uDq
	533/1SOY9NF97G8ZUVQq5vC5otJmmN4haDqDE7RF3UsNCXIZ7Esb27vIhqSQ7jOW
	HOoP3pSuEU968uigP1iGmKEzmkoyUxsePTDURK0HYrVN5g==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b2p3uapks-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Dec 2025 06:56:44 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8b17194d321so591294785a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Dec 2025 22:56:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765868204; x=1766473004; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Qq0o/o5mq7+GYYh0mZ6YhmwiFC0Spd5O2WRdpBvbVAI=;
        b=BuIxkKxVYd9Z9cqqSylc0xCXOweojlrMDtw4L4qQHeXqo4xr0Y2oO1WW1KJ4MtCKmC
         GOeXhoqAcMC1SheRmk9KQq6xQ+m0qqjY5YxXAajweJSzyhyWmw101ZbKaEvEGGqdrVPe
         xX+EwsYbl+bzLA8/QLvxsPFmupBOFr7GhsMs1ezRUYNpoPqcTDr9gStDVfBlLFPmQUIA
         Kl6vByWDpXQ5skvTO+8k9HUYzQymFXD4sqgxthZnMqT4CHia71mPVEfM6zsfSKRXtDhS
         wsXWbAmMxn/8OqrVJ0Av6fyLL06WJpeeVdFbwHfN+UH3QqeE4VsHRLPE4uT14jTCr/Fx
         GFmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765868204; x=1766473004;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Qq0o/o5mq7+GYYh0mZ6YhmwiFC0Spd5O2WRdpBvbVAI=;
        b=UXjxVy9AnsB2Tr6ev9X/Fr67lPoy83RV8AR7kN2TVJteqDzLi6bUXZ+GjCckHBSD/4
         W1C9zmQiZ/K/o5BCX4ZzJltjw66SdWYzCBh2VNv/nRlkqaGfhFf5rHpO9czTo33PiMwh
         y0z3Xyol88DeoSNRTcEDTajZtFWn09QRuehYT9jtAzfUn9r9fjWGXL/H2wPiu+Zdu95a
         0CpHW0C8VTnwZ7Uucd+wKiMAoXhWyLMrD86+7OYX3q1/VgdSN9JJKFzzcRMvEx8j5367
         8A2ZNU9q5YWrb3aP4+3s9Oni0ZMYHVAhZp7vBDY2kxL/jz/8y5wFXT9W8n8Xl0GoIByz
         oZwA==
X-Forwarded-Encrypted: i=1; AJvYcCVzBXcc8VgQwcW4NxtFY3b5UqF6zYvcKHdpBRk9bitE1tY9+kNG1lE1dxL/MQw+uLBr6XkihstUXM+CeQ1S@vger.kernel.org
X-Gm-Message-State: AOJu0Yyp309i+y1OjcN+efpcRMciSKfItXvhbCkeJ9AAS1v+bgGUa+So
	RR5ylkJ6nLv0bZVEWZOEeTJG0MlErHrV8poz9lxj2kr338RDwAz19wz9cVwSqNh6LJmiYqUARCG
	IzsRCiPlHt4Z01Gk6HiWeUs3EclV7MfKfQrNqVnUiMVTlNDnfnf0eslI5jc03jIyewALH
X-Gm-Gg: AY/fxX43yz0rNkavSDJfoZfzfO90YTvGeckEfdPC/q29zG5bqWgBd0yVTG/8jBV5iN5
	Y0GPVFeNyXB7bPiHUY48XQtx1TDOGrYDFUq4QjHLykp4ju/jXxxEpxjRx1hlACUYnquNyOhhBQr
	Bhhv4igK/Sb6P0Te4jjwodb+pGGzei8GFdQtzmEidunqb8m7M3bhIUok6lswo6+M2D2BICF/WaU
	HFmpEtFtiSU3+BHAao/RyX42u47fZUyzCqaebEIvft7cOFfJnobdYkTZqqTd28Et0+4XnhqKmQn
	iEd9+SZTp05yq1YJC9w6L2CvZAHxR1V2tJhahKzxfisQAdbHijLABjJBzKwlcLTMiDZPqXPsNtI
	z1cMjpg2JcAsKmEz6CHfnt6sI6W8xyK/TkfiZxjORd+HD14oZqRkGjf3HRdvW6zqPF5/KcV8=
X-Received: by 2002:a05:620a:472c:b0:8b2:e469:39e8 with SMTP id af79cd13be357-8bb3a24892amr1820305985a.42.1765868203468;
        Mon, 15 Dec 2025 22:56:43 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE2K7PBJaFBU9kaEhxjqCZE/yPyO7uDfeLt4ijLUUf+oDfLGzKbgQUNi501dluGkE3z4Y2BZg==
X-Received: by 2002:a05:620a:472c:b0:8b2:e469:39e8 with SMTP id af79cd13be357-8bb3a24892amr1820303485a.42.1765868203010;
        Mon, 15 Dec 2025 22:56:43 -0800 (PST)
Received: from yuanjiey.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8be31c75b45sm123526485a.52.2025.12.15.22.56.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Dec 2025 22:56:42 -0800 (PST)
Date: Tue, 16 Dec 2025 14:56:31 +0800
From: yuanjiey <yuanjie.yang@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: robin.clark@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
        jesszhan0024@gmail.com, sean@poorly.run, marijn.suijten@somainline.org,
        airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com,
        mripard@kernel.org, tzimmermann@suse.de, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, neil.armstrong@linaro.org,
        yongxing.mou@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, tingwei.zhang@oss.qualcomm.com,
        aiqun.yu@oss.qualcomm.com
Subject: Re: [PATCH v3 10/11] drm/msm/dpu: Refactor SSPP to compatible DPU
 13.0.0
Message-ID: <aUECnz+INNuLjHR6@yuanjiey.ap.qualcomm.com>
References: <20251215083854.577-1-yuanjie.yang@oss.qualcomm.com>
 <20251215083854.577-11-yuanjie.yang@oss.qualcomm.com>
 <pzwgxqdlpmrbylguvzwypry3fix6wi7kxu3jlv3yzdtb3unnrf@wfzvuhvhmue5>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <pzwgxqdlpmrbylguvzwypry3fix6wi7kxu3jlv3yzdtb3unnrf@wfzvuhvhmue5>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE2MDA1NiBTYWx0ZWRfXyF4iIC8Yowh5
 NYlmpdX/AZEKF2e22a46+SXxe/sHkKuqKdNqt+RZoXwUamClrDNXxDRS6Y/NxrZgkJmJthb8+5u
 xUpEmZgMI5mBVym+NV8Jsu7ZP5+9OAln+k0vkDJTOeY3karMX6jxxYQZsDodaohePUWpABamJ5r
 wRowPjpkWSY34u7fbGhw9grHY9Vg9NXrSwov8NMbEfcqXxkxmxsBNntqAIaP9dFEofV6iNhpx7A
 QYCc1jCP+7m3Vh7XLOF/z4Rlp3LkYpTnD0MCOtXtodF/fSGTMbuPkQnJ5dAHY3Zdk+UI6PahcCT
 FKd8O72heZz3iHt0y/iRIeitkyQ9jzTsndtj6YwKL/vVXBcE2ZF+TwKbiKV+HwRC+Ch1Qzrschh
 k2kfDw6IdflLCuiu0VOLAlJfy7KnEA==
X-Authority-Analysis: v=2.4 cv=Q/TfIo2a c=1 sm=1 tr=0 ts=694102ac cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=kj9zAlcOel0A:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=PnxoWNhBm_jaqvFsFIIA:9
 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: J9PEU5Hma4huQBz_y9xl1547-ESYq1iM
X-Proofpoint-ORIG-GUID: J9PEU5Hma4huQBz_y9xl1547-ESYq1iM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-16_01,2025-12-15_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 spamscore=0 adultscore=0 suspectscore=0
 phishscore=0 priorityscore=1501 impostorscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512160056

On Mon, Dec 15, 2025 at 10:08:22PM +0200, Dmitry Baryshkov wrote:
> On Mon, Dec 15, 2025 at 04:38:53PM +0800, yuanjie yang wrote:
> > From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> > 
> > DPU version 13.0.0 introduces structural changes including
> > register additions, removals, and relocations.
> > 
> > Refactor SSPP-related code to be compatible with DPU 13.0.0
> > modifications.
> > 
> > Co-developed-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> > Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> > Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> > ---
> 
> We've fixed the order of the interrupts patch. Now you are adding SSPP
> customization for 13.x _after_ adding the first 13.x support. Is that
> supposed to work?

Yes, will reorganize order.

 
> >  .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |  15 +-
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c   | 155 ++++++++++--------
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h   |  52 ++++++
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c   |  18 ++
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h   |   3 +
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c     |  17 +-
> >  6 files changed, 191 insertions(+), 69 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> >  		switch (ctx->ubwc->ubwc_enc_version) {
> >  		case UBWC_1_0:
> >  			fast_clear = fmt->alpha_enable ? BIT(31) : 0;
> > -			DPU_REG_WRITE(c, SSPP_UBWC_STATIC_CTRL,
> > -					fast_clear | (ctx->ubwc->ubwc_swizzle & 0x1) |
> > -					BIT(8) |
> > -					(ctx->ubwc->highest_bank_bit << 4));
> > +			DPU_REG_WRITE(c, ubwc_ctrl_off,
> > +				      fast_clear | (ctx->ubwc->ubwc_swizzle & 0x1) |
> > +				      BIT(8) |
> > +				     (ctx->ubwc->highest_bank_bit << 4));
> 
> I have asked to drop unrelated changes. You didn't. Why? You are
> changing whitespaces for no reason. It's just a noise which hides the
> actual change here.

here ubwc reg layout change in DPU 13.

ubwc_ctrl_off
veriosn < 13 
reg: SSPP_UBWC_STATIC_CTRL
verison >= 13 
reg: SSPP_REC_UBWC_STATIC_CTRL

So I do some fix.

> >  			break;
> >  		case UBWC_2_0:
> >  			fast_clear = fmt->alpha_enable ? BIT(31) : 0;
> > -			DPU_REG_WRITE(c, SSPP_UBWC_STATIC_CTRL,
> > -					fast_clear | (ctx->ubwc->ubwc_swizzle) |
> > -					(ctx->ubwc->highest_bank_bit << 4));
> > +			DPU_REG_WRITE(c, ubwc_ctrl_off,
> > +				      fast_clear | (ctx->ubwc->ubwc_swizzle) |
> > +				     (ctx->ubwc->highest_bank_bit << 4));
> >  			break;
> >  		case UBWC_3_0:
> > -			DPU_REG_WRITE(c, SSPP_UBWC_STATIC_CTRL,
> > -					BIT(30) | (ctx->ubwc->ubwc_swizzle) |
> > -					(ctx->ubwc->highest_bank_bit << 4));
> > +			DPU_REG_WRITE(c, ubwc_ctrl_off,
> > +				      BIT(30) | (ctx->ubwc->ubwc_swizzle) |
> > +				     (ctx->ubwc->highest_bank_bit << 4));
> >  			break;
> >  		case UBWC_4_0:
> > -			DPU_REG_WRITE(c, SSPP_UBWC_STATIC_CTRL,
> > -					MSM_FORMAT_IS_YUV(fmt) ? 0 : BIT(30));
> > +			DPU_REG_WRITE(c, ubwc_ctrl_off,
> > +				      MSM_FORMAT_IS_YUV(fmt) ? 0 : BIT(30));
> >  			break;
> >  		}
> >  	}
> > @@ -313,19 +337,18 @@ static void dpu_hw_sspp_setup_format(struct dpu_sw_pipe *pipe,
> >  
> >  	/* update scaler opmode, if appropriate */
> >  	if (test_bit(DPU_SSPP_CSC, &ctx->cap->features))
> > -		_sspp_setup_opmode(ctx, VIG_OP_CSC_EN | VIG_OP_CSC_SRC_DATAFMT,
> > -			MSM_FORMAT_IS_YUV(fmt));
> > +		dpu_hw_sspp_setup_opmode(ctx, VIG_OP_CSC_EN | VIG_OP_CSC_SRC_DATAFMT,
> > +					 MSM_FORMAT_IS_YUV(fmt));
> >  	else if (test_bit(DPU_SSPP_CSC_10BIT, &ctx->cap->features))
> > -		_sspp_setup_csc10_opmode(ctx,
> > -			VIG_CSC_10_EN | VIG_CSC_10_SRC_DATAFMT,
> > -			MSM_FORMAT_IS_YUV(fmt));
> > +		dpu_hw_sspp_setup_csc10_opmode(ctx,
> > +					       VIG_CSC_10_EN | VIG_CSC_10_SRC_DATAFMT,
> > +					       MSM_FORMAT_IS_YUV(fmt));
> 
> Again, useless whitespace changes.
checkpatch.pl says here is alignment issuse, so I do this fix.

> >  
> >  	DPU_REG_WRITE(c, format_off, src_format);
> >  	DPU_REG_WRITE(c, unpack_pat_off, unpack);
> >  	DPU_REG_WRITE(c, op_mode_off, opmode);
> > -
> 
> Why?

yes, will drop "-" diff.

> >  	/* clear previous UBWC error */
> > -	DPU_REG_WRITE(c, SSPP_UBWC_ERROR_STATUS, BIT(31));
> > +	DPU_REG_WRITE(c, ubwc_err_off, BIT(31));
> >  }
> >  
> >  static void dpu_hw_sspp_setup_pe_config(struct dpu_hw_sspp *ctx,
> > @@ -385,9 +408,9 @@ static void dpu_hw_sspp_setup_pe_config(struct dpu_hw_sspp *ctx,
> >  			tot_req_pixels[3]);
> >  }
> >  
> > -static void _dpu_hw_sspp_setup_scaler3(struct dpu_hw_sspp *ctx,
> > -		struct dpu_hw_scaler3_cfg *scaler3_cfg,
> > -		const struct msm_format *format)
> > +void dpu_hw_sspp_setup_scaler3(struct dpu_hw_sspp *ctx,
> > +			       struct dpu_hw_scaler3_cfg *scaler3_cfg,
> > +			       const struct msm_format *format)
> 
> And here...
checkpatch.pl says here is alignment issuse, so I do this fix.



Thanks,
Yuanjie
 
> -- 
> With best wishes
> Dmitry

