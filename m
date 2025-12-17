Return-Path: <linux-arm-msm+bounces-85427-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 889C3CC5D42
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Dec 2025 03:52:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6BA48301274E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Dec 2025 02:52:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9A1325DB1A;
	Wed, 17 Dec 2025 02:52:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kkP9Y3yC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="M//X30lZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B0E3224B01
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 02:52:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765939939; cv=none; b=Sx0RmgsNQIEv3BmY61jJV67yFelT0j9waPYPGMhC2xTLCeBmpUfsalFL66quQKk1ta67KKms3H60mDGDZ3PyhrEMEC8ZUMDe9xlwV3D9i2nEMQFy503rl3RxobTbXAvMUZxoKEqBPBO4sXm/PQM1/CiX+1mOupE0S9Hp+LkHTlg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765939939; c=relaxed/simple;
	bh=+taVl9d0DmNYlbBhHvM5GjECJ3vUFg7jyaoe51/b/yE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kbIPDvb4uRbptbb/dTLIokAUG6MtVjbxMCaCRuj2PvT4GGA9fFzdVqv0E2xb769AN+IO8ZgrqJjz+9PLHxMC/X1bW73nhOaKENLOMBCN/nKZPGBuBdfw2RUavNLJi+lyshaMf+W916RtQtvjdLPnPHNMBmxum+FUrTj5PcE4z1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kkP9Y3yC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=M//X30lZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BGMR7Zf1544556
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 02:52:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=JCJBPzyRlhs0ukky8nnWNxDG
	T3jIQ2bJUvRtWHrXAZA=; b=kkP9Y3yCoFi7+UDQPn6FBzxoy7INU9c/w6Tsuzjf
	OAcaisEwIdxxWr+wUSL07+/BCTYYlYNb3uAiFZ2TCjZlNVNPOEDJ5UOs/Y24ulKN
	Jj1LxAPNDoF82HY4H8VcQTl1Uz6r5pGeFModVu7iYYEBd50xbLBWhd7u25A/asN4
	5EHKl/5ZDqH9LFjo1diyEn/awSDui1/VDScTcgma+oTs1T9Jq+fvs+1jOlLbTUtz
	QahlZurh9Tj0K3s/GyxrSZuK8ezTd3qYtonCUyNQqx0YPbrSUckft+Oc5VGZ+vtl
	K3bJw/k3vz1FXHIZP16CAK4soXqLSLVUopwUlSGvgPTLww==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b366qatvj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 02:52:16 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-88a2f8e7d8dso82805666d6.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Dec 2025 18:52:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765939935; x=1766544735; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JCJBPzyRlhs0ukky8nnWNxDGT3jIQ2bJUvRtWHrXAZA=;
        b=M//X30lZMjHLYs51LVhXa0r7NCZuB1KvDMyb+fDAw0EO6/IyRDCZdEHts9TXMBU3OI
         Iu/Fk7k3jI5hDiOGoAoeXpVTLuOv8VOGSzOD/s8dChmt3gXBbz5ThIPKr9MDQ/r7xuMM
         /RpRy/07ClMkKUkLxb9ZJMcXnRS1AdW5qOcV7rRba2efYaRIQUw55VS1q5iTuVVigciv
         r8OikA72NQdRFSh6hH667iIcLRQgAKGJsIY0AmJlx9JT5kXhoEBv7kN6WBZB4eNPzW0h
         CtV4U4LGH/T6QGyNINt7mVKkkl57AZ1Mgrm2azlwuld62Q3zxzo4jZuNJCpzH7ChhyKN
         q3eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765939935; x=1766544735;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JCJBPzyRlhs0ukky8nnWNxDGT3jIQ2bJUvRtWHrXAZA=;
        b=qvY58rYwlQJHPUBjns31B35JkaCoLrJxIXwlKLdZy+4WvmrWn8udfT1MQ2VO+AYEMA
         SLc2AaFqzMszCbhHpNwvzDhHdWGeY9UWE+so8LOLwekaG1In4GIBbJvnBvZr8r9B8fQD
         9h2MinEb8z0uclFDQrHCYGiNfWCpP9WHEa9VYuxZHgTgxoAd5jXSaCQhO6t42aHSCuIo
         zd1IWG5gTsbBDKOcR1bpPUjJbbbzJKD+EZN3tVHD2I1gq5zaSXS04NJ8//tBe7ojNPPT
         +I3bZengU2qoOAC++fETrgBbIuHbCtoDB5WAHSCLhepPOTxJV3P5mXQ8wtWQO0RTAePY
         RMsg==
X-Forwarded-Encrypted: i=1; AJvYcCUGG4AUjQfw55z4f2dRbpsxz+SBeYAeAz+EwpHsUrPcty+M4HDlY1EQcnr/YnecT7c+wlwezqBuGnwZmBK2@vger.kernel.org
X-Gm-Message-State: AOJu0YxBAXzr81SlSoTSxcMXMaAIHTqR/KKWjUHFv4YmZYDXFTKJjxfh
	QcmPuoR6uUYqfXdirtBb02kvUPgqS579nsVHrlY2MOEESFBXIzf/P+4ardwKycnwYCsJF/9ozY7
	e1DyVIQcRwfhPkBRUgIfkcm7hZB6Q5oesNkGu+jzJACe5t/xcN+ljUzrWK3vG6mCwYDjaTlWDie
	5bAaQ=
X-Gm-Gg: AY/fxX48yWid+jkbnYzhUWle6PXZcq+vagqCcz1PGDRyiznk9UzyJKgipvV6dBzFoLI
	JsmckPb0GYRnO6ylOnEXVAyq0jowasvFyIx8uK/Mdq8C6SKtpJW5/WZTP1pQohhRMFIVDD1dcs6
	O9cr0y5S92COXyG+eEWRrXVhfFS7C4DHVtFk5HNa4wd/IStkuamAGHwQc0bpLo4ilx5pPjuQjG1
	eRepwKu1U2cSPjc7G9/CB7l261jAJCyPHd+kohQrwCsCGTdGoh5O1tECzGeQPFyL3zvQNpNfcX5
	U7txQfr3qRy+Ac2EQKlyjj8qRuowqidQe1XSNswv7wqTOQFKZ8B7jrV6bt7nfIp/nLuB9MuBr+n
	PdLS0W3fXzGKuH62B2CpCyfIxs6Qfai9tLR+EVXneuHvbqrsfGck7APu8ZHJ6YTr8NESZKJ4=
X-Received: by 2002:a05:6214:4007:b0:88a:2444:36e9 with SMTP id 6a1803df08f44-88a24443787mr170641546d6.67.1765939935442;
        Tue, 16 Dec 2025 18:52:15 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGx1RaDoBtJw9fMmc0Xmr4th/lJOfvqaul2PsNrWDcut+ChvzvkgYHcb05lGbK5/M73moqytA==
X-Received: by 2002:a05:6214:5b87:b0:888:82c3:dfc0 with SMTP id 6a1803df08f44-88882c3e67cmr227694546d6.55.1765939562816;
        Tue, 16 Dec 2025 18:46:02 -0800 (PST)
Received: from yuanjiey.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8899ea36210sm85899146d6.27.2025.12.16.18.45.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Dec 2025 18:46:01 -0800 (PST)
Date: Wed, 17 Dec 2025 10:45:50 +0800
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
Message-ID: <aUIZXiL+JY27phny@yuanjiey.ap.qualcomm.com>
References: <20251215083854.577-1-yuanjie.yang@oss.qualcomm.com>
 <20251215083854.577-11-yuanjie.yang@oss.qualcomm.com>
 <pzwgxqdlpmrbylguvzwypry3fix6wi7kxu3jlv3yzdtb3unnrf@wfzvuhvhmue5>
 <aUECnz+INNuLjHR6@yuanjiey.ap.qualcomm.com>
 <gljkq6jijsprelq7qmgai4g7mqlshezdx755n3ivbxjdf6uw73@dz3mkct7g3ry>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <gljkq6jijsprelq7qmgai4g7mqlshezdx755n3ivbxjdf6uw73@dz3mkct7g3ry>
X-Proofpoint-GUID: IaFc65baMzo3I9mXAIk5IZWAsw2ZXTta
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE3MDAyMSBTYWx0ZWRfXxFv7YGu9hrxX
 tzohIDJGBQwg4pVyW/Z24yzlNB+Tn2GDzxylr7cKZ9mqDDIDkKYeSBrXT40CIB+B2Hl3anBuJ5n
 rPFnjT2k/RQhotZUMIa1yZiezER2PbclcbMMwnXJq97V1aXXx95tWwc9hd7w6BeEymCnvHzu56A
 Sw/CCH6H8vZihGm5e024WaciBVyjT2nT9hC5/215VJeWHdpjph/8muxqTDMOWhnUp3c3VUovdNr
 yGFQJeE44zAgjq6eh4rgPujJykK5ii2vTQDJPYFWOz3KOUVO41TNMuyjVfQJm2SLKxyMr/BvKVd
 PxnGcwE91AY57vM/A2a72kUFjmeD4uHtET3JHdLeTgkx/9IUITWYYIhteYPFT2xoG3U73/bbxow
 S026uHOJ0Z9mBEXqAjJ14MdC3meUlQ==
X-Authority-Analysis: v=2.4 cv=RKe+3oi+ c=1 sm=1 tr=0 ts=69421ae0 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=kj9zAlcOel0A:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=tNEIORBzTMdH9SYpPiUA:9
 a=CjuIK1q_8ugA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: IaFc65baMzo3I9mXAIk5IZWAsw2ZXTta
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-16_03,2025-12-16_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 phishscore=0 malwarescore=0 bulkscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512170021

On Tue, Dec 16, 2025 at 04:22:32PM +0200, Dmitry Baryshkov wrote:
> On Tue, Dec 16, 2025 at 02:56:31PM +0800, yuanjiey wrote:
> > On Mon, Dec 15, 2025 at 10:08:22PM +0200, Dmitry Baryshkov wrote:
> > > On Mon, Dec 15, 2025 at 04:38:53PM +0800, yuanjie yang wrote:
> > > > From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> > > > 
> > > > DPU version 13.0.0 introduces structural changes including
> > > > register additions, removals, and relocations.
> > > > 
> > > > Refactor SSPP-related code to be compatible with DPU 13.0.0
> > > > modifications.
> > > > 
> > > > Co-developed-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> > > > Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> > > > Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> > > > ---
> > > 
> > > We've fixed the order of the interrupts patch. Now you are adding SSPP
> > > customization for 13.x _after_ adding the first 13.x support. Is that
> > > supposed to work?
> > 
> > Yes, will reorganize order.
> 
> And after comparing with v2, I'm really surprised. It was better before
> and then you changed the order of the patches. Why? You were asked to
> split it, but not to move it to the end.

I make the mistake.
Sure, I will keep the v2 patch order in next patch.
 
> > 
> >  
> > > >  .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |  15 +-
> > > >  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c   | 155 ++++++++++--------
> > > >  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h   |  52 ++++++
> > > >  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c   |  18 ++
> > > >  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h   |   3 +
> > > >  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c     |  17 +-
> > > >  6 files changed, 191 insertions(+), 69 deletions(-)
> > > > 
> > > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> > > >  		switch (ctx->ubwc->ubwc_enc_version) {
> > > >  		case UBWC_1_0:
> > > >  			fast_clear = fmt->alpha_enable ? BIT(31) : 0;
> > > > -			DPU_REG_WRITE(c, SSPP_UBWC_STATIC_CTRL,
> > > > -					fast_clear | (ctx->ubwc->ubwc_swizzle & 0x1) |
> > > > -					BIT(8) |
> > > > -					(ctx->ubwc->highest_bank_bit << 4));
> > > > +			DPU_REG_WRITE(c, ubwc_ctrl_off,
> > > > +				      fast_clear | (ctx->ubwc->ubwc_swizzle & 0x1) |
> > > > +				      BIT(8) |
> > > > +				     (ctx->ubwc->highest_bank_bit << 4));
> > > 
> > > I have asked to drop unrelated changes. You didn't. Why? You are
> > > changing whitespaces for no reason. It's just a noise which hides the
> > > actual change here.
> > 
> > here ubwc reg layout change in DPU 13.
> > 
> > ubwc_ctrl_off
> > veriosn < 13 
> > reg: SSPP_UBWC_STATIC_CTRL
> > verison >= 13 
> > reg: SSPP_REC_UBWC_STATIC_CTRL
> > 
> > So I do some fix.
> 
> What does it have to do with the whitespaces? Fix _one_ line.
get it, will drop unrelated whitespaces.

> > 
> > > >  			break;
> > > >  		case UBWC_2_0:
> > > >  			fast_clear = fmt->alpha_enable ? BIT(31) : 0;
> > > > -			DPU_REG_WRITE(c, SSPP_UBWC_STATIC_CTRL,
> > > > -					fast_clear | (ctx->ubwc->ubwc_swizzle) |
> > > > -					(ctx->ubwc->highest_bank_bit << 4));
> > > > +			DPU_REG_WRITE(c, ubwc_ctrl_off,
> > > > +				      fast_clear | (ctx->ubwc->ubwc_swizzle) |
> > > > +				     (ctx->ubwc->highest_bank_bit << 4));
> > > >  			break;
> > > >  		case UBWC_3_0:
> > > > -			DPU_REG_WRITE(c, SSPP_UBWC_STATIC_CTRL,
> > > > -					BIT(30) | (ctx->ubwc->ubwc_swizzle) |
> > > > -					(ctx->ubwc->highest_bank_bit << 4));
> > > > +			DPU_REG_WRITE(c, ubwc_ctrl_off,
> > > > +				      BIT(30) | (ctx->ubwc->ubwc_swizzle) |
> > > > +				     (ctx->ubwc->highest_bank_bit << 4));
> > > >  			break;
> > > >  		case UBWC_4_0:
> > > > -			DPU_REG_WRITE(c, SSPP_UBWC_STATIC_CTRL,
> > > > -					MSM_FORMAT_IS_YUV(fmt) ? 0 : BIT(30));
> > > > +			DPU_REG_WRITE(c, ubwc_ctrl_off,
> > > > +				      MSM_FORMAT_IS_YUV(fmt) ? 0 : BIT(30));
> > > >  			break;
> > > >  		}
> > > >  	}
> > > > @@ -313,19 +337,18 @@ static void dpu_hw_sspp_setup_format(struct dpu_sw_pipe *pipe,
> > > >  
> > > >  	/* update scaler opmode, if appropriate */
> > > >  	if (test_bit(DPU_SSPP_CSC, &ctx->cap->features))
> > > > -		_sspp_setup_opmode(ctx, VIG_OP_CSC_EN | VIG_OP_CSC_SRC_DATAFMT,
> > > > -			MSM_FORMAT_IS_YUV(fmt));
> > > > +		dpu_hw_sspp_setup_opmode(ctx, VIG_OP_CSC_EN | VIG_OP_CSC_SRC_DATAFMT,
> > > > +					 MSM_FORMAT_IS_YUV(fmt));
> > > >  	else if (test_bit(DPU_SSPP_CSC_10BIT, &ctx->cap->features))
> > > > -		_sspp_setup_csc10_opmode(ctx,
> > > > -			VIG_CSC_10_EN | VIG_CSC_10_SRC_DATAFMT,
> > > > -			MSM_FORMAT_IS_YUV(fmt));
> > > > +		dpu_hw_sspp_setup_csc10_opmode(ctx,
> > > > +					       VIG_CSC_10_EN | VIG_CSC_10_SRC_DATAFMT,
> > > > +					       MSM_FORMAT_IS_YUV(fmt));
> > > 
> > > Again, useless whitespace changes.
> > checkpatch.pl says here is alignment issuse, so I do this fix.
> 
> The issue was present before your patch. If you want to fix it, fix it
> in the separate patch or ignore it.
get it, will drop unrelated whitespaces.

> > 
> > > >  
> > > >  	DPU_REG_WRITE(c, format_off, src_format);
> > > >  	DPU_REG_WRITE(c, unpack_pat_off, unpack);
> > > >  	DPU_REG_WRITE(c, op_mode_off, opmode);
> > > > -
> > > 
> > > Why?
> > 
> > yes, will drop "-" diff.
> > 
> > > >  	/* clear previous UBWC error */
> > > > -	DPU_REG_WRITE(c, SSPP_UBWC_ERROR_STATUS, BIT(31));
> > > > +	DPU_REG_WRITE(c, ubwc_err_off, BIT(31));
> > > >  }
> > > >  
> > > >  static void dpu_hw_sspp_setup_pe_config(struct dpu_hw_sspp *ctx,
> > > > @@ -385,9 +408,9 @@ static void dpu_hw_sspp_setup_pe_config(struct dpu_hw_sspp *ctx,
> > > >  			tot_req_pixels[3]);
> > > >  }
> > > >  
> > > > -static void _dpu_hw_sspp_setup_scaler3(struct dpu_hw_sspp *ctx,
> > > > -		struct dpu_hw_scaler3_cfg *scaler3_cfg,
> > > > -		const struct msm_format *format)
> > > > +void dpu_hw_sspp_setup_scaler3(struct dpu_hw_sspp *ctx,
> > > > +			       struct dpu_hw_scaler3_cfg *scaler3_cfg,
> > > > +			       const struct msm_format *format)
> > > 
> > > And here...
> > checkpatch.pl says here is alignment issuse, so I do this fix.
> 
> And I'm asking you to don't do it. Don't clutter the patch with
> unrelated changes (and whitespace / alignment changes are generally
> unrelated).
>
> -- 
> With best wishes
> Dmitry

Thanks,
Yuanjie


