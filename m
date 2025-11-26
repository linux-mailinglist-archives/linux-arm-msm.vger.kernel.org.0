Return-Path: <linux-arm-msm+bounces-83360-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 50A78C87F93
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Nov 2025 04:40:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id E993F4E0F29
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Nov 2025 03:40:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BF7630DD3F;
	Wed, 26 Nov 2025 03:40:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pMXV4TCz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="c6k4B5US"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2D562236FA
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 03:40:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764128409; cv=none; b=K8Ab4/NZE0QF/QI47HhWN/SSU15ewA+5hhoWRItoUaKDT6gR6FUX1bUmCxhxln09a9xHoGyl++rcDtAckXFRqTsOEjX0lphdP1RZKKOsKM1l4FwoMKohDxp8Wq6Sh14OYgw0XK89CjuE1jeuEKnrHLrqm1IMdhiQmZ7ZKG6cYP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764128409; c=relaxed/simple;
	bh=qT4Fd90t7ia3rPH5dg6538wG/v8QcJGvY58RjZ2Q2PM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YMAHardnaOHSOFQ0dG5tuWJ9ojP6w3o/LOgXPT76qeW7Vu7xRE1OdQkh0UEr0DQt/BDDUGE2R5i7tdyVegIEg1ImFn+jivIgGMcnQq61KUPfzXUlQGVbzy1ZL+e0uRvkTbWcp4q4clHBdY8lllHEzLB/+XUprjFb7z68skq+wmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pMXV4TCz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=c6k4B5US; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5APH2wG53738440
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 03:40:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=DqCFtFVW3SFIUOOsVlNtQttk
	B7IIU4EgK/vcGFj17yo=; b=pMXV4TCztb+vUyIA167YBMNDlpe7Bg/fG8q8brCL
	Lwa/WFABjdtajYADiLvjRiRtaB7Jmnj3L6xyQ2Dh80SMSRcvCUWkwZA+rWe52E1e
	Z+iLLTrkfmw7FhUv1hAgTUTnF1/6Qxkl8kXsw6RFHsUHAiPvEIrix+xHr0wacGpu
	NTogrQ1DXfSTgBpuHo67ciT1R9Nw7UVw7sUmdLCtPxkz+subuMej8HDIgqn7y3Om
	PDEIOh+Wf3SaslxDHdVLy1ZVhwjuxznenZrTHskkngCBTt5f+Q8bwzkdIuIU2VqU
	Oo0p0rkmW3GyqsfXJrm193JY2drt9K/tYiYq4CAbOXy4Ng==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4anggyhdj9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 03:40:05 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8b1d8f56e24so1724329885a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Nov 2025 19:40:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764128404; x=1764733204; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DqCFtFVW3SFIUOOsVlNtQttkB7IIU4EgK/vcGFj17yo=;
        b=c6k4B5USC4RMbOPKZKG1ifbgovrmyJrFUeDCPr7GNUPk6mic4ZL1DuusU5sdQQQdcO
         LcKCRXCZDuF2+G1amDYE1ZZ49sZqZqUYzrrFRV6v643rHDD7xXE31Ea8hzrZzQF9+vzV
         6Qb7x7VVDzvRfh5K0ogVLTglg7dj9cvCt9jIxgPg5QBvRrJGQOBpgqOoGYdaF7gZu6Ho
         wQw8a+bg7KajVi2FwRjZni8oN77SFEm8ZIG7L6Z5kGlE1px8M00DAw1ya0ikTy+IubfW
         fOjbm8ekjk6Ds5rm1P4gxnm4aSHC88NXPXuy5e6gM/z2zoFi1zZHXMUdzOjHRtw597N8
         KunA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764128404; x=1764733204;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DqCFtFVW3SFIUOOsVlNtQttkB7IIU4EgK/vcGFj17yo=;
        b=lAjgsXmuX7kqZkoFresUYTID7uqj+w51QJuDOQ5p7wN0mIL3rJAxvSB+mTMATXAblZ
         in0IKbDIeZV/SttU2e07iVsUcYiHLsfA3emVJXdTofN9mQBdZY/Z7GGXV0azua0bhDT/
         oj69FHyj/Wg54ksuzNQAcQEKhEPpRV9ZGSDKjxJ6WsUpzu1lb7PrpIfPfTksEB2Qnh57
         1gBbrCgdyQRWu29iw3zPm39DulRm/ZgM4axl33QB9AXYAvUwXAXgOA5MYl5ZySX9M7dI
         rQujPgT/CeJ9e3taMukFrxv0+nUeCuiz6ASF5+lgMURm+n95C3KXqeJdjzGl0GGcdUi2
         1RzA==
X-Forwarded-Encrypted: i=1; AJvYcCVrXd7kODDJILxdY/Ljera4A5yB8xj2DKkoKN/Ex/KEy2NfK8rIOG80+F3Pgw5jvhiNKg7ZG2Z2H7S9l9u6@vger.kernel.org
X-Gm-Message-State: AOJu0Yyg3Ni82WPAY0eueGoP96KexJFyDNdP4VfBDlC9nxluHxDkwefx
	9E+sEpt3exfAF72vzaz5XS514cF9myauP9/1BtbZP2eDOaT0EbpZU/lnmKGWYFzJKbMKsBupWWO
	eAl9b2e7nSX64WgK1QrwExR4WOZO+EMggQwuPBQwiikD7mYYFBMEyxIdy8dnHWKz8xbCw
X-Gm-Gg: ASbGncu9yAJU0QTzmA0BIMht9FiBIEq6enPu7SYhY3Leq4DIjQO9vkUyhJfXvGYtPNz
	VbBJC/7PeiKFky8Tfrmfu912KBFbZwbmIaGbQGP6Ku0tFLaavLOYLFpdBxQ8S+Wk/nwkhtrGpTZ
	1Tw4Yik4yA5al/Hwuflliy7tLd0AOdtcoerQJy03XT88vMC6o7FFUPMTyC1/lAJrAFd1mpgYbQv
	0jWnSTmvrXro4sRywZjdH2CvNRvBI2SVyTDIIpZfALbVGRbFpB6VC6H7cFh9trji/MED5FWbIS4
	bODTKkMnF4yUDqfhksiWNo5GNyzO52viwkoTKbw6nA8AFIkeQJg5mo8vYkQjOmM7y77FjYM3uOP
	eTxBRSgobpfmi+oAQIADQx4PXwjt0a+Jr3/ktGYcX2OveBNiqeOqYlWrlpodin0w5+kVHbRcAei
	M=
X-Received: by 2002:a05:620a:318b:b0:8b2:80d:bc2e with SMTP id af79cd13be357-8b4ebdb06f4mr771565285a.44.1764128403935;
        Tue, 25 Nov 2025 19:40:03 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGBQfimHI2BOTZZ71o9jXLaJCNGE9VonmDvABispb4wWdgkDS2pMs9hdYUpRUHas6bcd+wGrQ==
X-Received: by 2002:a05:620a:318b:b0:8b2:80d:bc2e with SMTP id af79cd13be357-8b4ebdb06f4mr771562085a.44.1764128403249;
        Tue, 25 Nov 2025 19:40:03 -0800 (PST)
Received: from yuanjiey.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8b329528337sm1314386385a.20.2025.11.25.19.39.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Nov 2025 19:40:02 -0800 (PST)
Date: Wed, 26 Nov 2025 11:39:50 +0800
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
Subject: Re: [PATCH v2 09/10] drm/msm/dpu: Add Kaanapali SSPP sub-block
 support
Message-ID: <aSZ2hpuaYr6h+hlX@yuanjiey.ap.qualcomm.com>
References: <20251125064758.7207-1-yuanjie.yang@oss.qualcomm.com>
 <20251125064758.7207-10-yuanjie.yang@oss.qualcomm.com>
 <2a6qysb63icgu3mpolwgnfnfevl6w56ver4hbswyg4pjtbbtvt@mxtwwnmmpqhg>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2a6qysb63icgu3mpolwgnfnfevl6w56ver4hbswyg4pjtbbtvt@mxtwwnmmpqhg>
X-Proofpoint-GUID: SqlS-eS6F2EA79jJ2_2Xb2IPKm1JxR5A
X-Proofpoint-ORIG-GUID: SqlS-eS6F2EA79jJ2_2Xb2IPKm1JxR5A
X-Authority-Analysis: v=2.4 cv=bNUb4f+Z c=1 sm=1 tr=0 ts=69267695 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=kj9zAlcOel0A:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=Sz8l8isZqtrj-xhcdpEA:9
 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI2MDAyNiBTYWx0ZWRfX5PSF6beGXhwe
 uUdgg90IWGaxzNhvvr0siYD/5ImOYQ4NbZTSPet5alpnVE8hp9iZf2XQGD3sWuJ7jCvEz4bJM7d
 CSiVYut2GMDa1+hpSK1qvyZ/ii9zFHVyWT2fW3r+9c/lniTdFDve5JoU9kke131QWEQRCepux7N
 s1gLKYhosp0SV0xTKBbv8d2pUtGjP073ZAsXnRfrDf90UT1w41iKT6azsN7dkux+kj2NQZcfoxx
 7t2M4k9K79YqTbztLgf3QxbfbEqbfE1tAttBk0RUyBl0XWhKQfIWmXGpS6yt9lBzSEbdNEQrHeC
 Q4ynMEX+hdgWha18bFJuNembWxqggUPsdK7cFhEd3wdf16pIirsSo2eqnmj166VFbm+u0S1dc47
 ljxXNtM6bLjcOEU4ACWrCvFJXeLIpg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 malwarescore=0 phishscore=0 spamscore=0
 lowpriorityscore=0 bulkscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511260026

On Tue, Nov 25, 2025 at 08:21:01PM +0200, Dmitry Baryshkov wrote:
> On Tue, Nov 25, 2025 at 02:47:57PM +0800, yuanjie yang wrote:
> > From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> > 
> > Add support for Kaanapali platform SSPP sub-blocks, which
> > introduce structural changes including register additions,
> > removals, and relocations. Add the new common and rectangle
> > blocks, and update register definitions and handling to
> > ensure compatibility with DPU v13.0.
> 
> Please split this into two pieces:
> - refactoring of the current code,
> - addition of DPU 13.x.x support.

Ok, will split two patch.

 
> > 
> > Co-developed-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> > Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> > Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> > ---
> >  drivers/gpu/drm/msm/Makefile                  |   1 +
> >  .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |  27 +-
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c   | 276 +++++++-----------
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h   | 264 +++++++++++++++++
> >  .../gpu/drm/msm/disp/dpu1/dpu_hw_ssppv13.c    | 224 ++++++++++++++
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c   |  23 ++
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h   |   4 +
> >  7 files changed, 645 insertions(+), 174 deletions(-)
> >  create mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ssppv13.c
> > 
> > diff --git a/drivers/gpu/drm/msm/Makefile b/drivers/gpu/drm/msm/Makefile
> > index 8aa7d07303fb..664e71dfa880 100644
> > --- a/drivers/gpu/drm/msm/Makefile
> > +++ b/drivers/gpu/drm/msm/Makefile
> > @@ -86,6 +86,7 @@ msm-display-$(CONFIG_DRM_MSM_DPU) += \
> >  	disp/dpu1/dpu_hw_lm.o \
> >  	disp/dpu1/dpu_hw_pingpong.o \
> >  	disp/dpu1/dpu_hw_sspp.o \
> > +	disp/dpu1/dpu_hw_ssppv13.o \
> 
> dpu_hw_sspp_v13
OK will fix.


> >  	disp/dpu1/dpu_hw_dspp.o \
> >  	disp/dpu1/dpu_hw_merge3d.o \
> >  	disp/dpu1/dpu_hw_top.o \
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> > index 336757103b5a..c996b08076a9 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> > @@ -208,6 +208,30 @@ struct dpu_dsc_blk {
> >  	u32 len;
> >  };
> >  
> > +/**
> > + * struct dpu_sspp_rec_blk - SSPP REC sub-blk information
> > + * @name: string name for debug purposes
> > + * @base: offset of this sub-block relative to the block offset
> > + * @len: register block length of this sub-block
> > + */
> > +struct dpu_sspp_rec_blk {
> 
> dpu_sspp_v13_rec_blk

Ok will check.

> > +	char name[DPU_HW_BLK_NAME_LEN];
> > +	u32 base;
> > +	u32 len;
> > +};
> > +
> > +/**
> > + * struct dpu_sspp_cmn_blk - SSPP common sub-blk information
> > + * @name: string name for debug purposes
> > + * @base: offset of this sub-block relative to the block offset
> > + * @len: register block length of this sub-block
> > + */
> > +struct dpu_sspp_cmn_blk {
> > +	char name[DPU_HW_BLK_NAME_LEN];
> > +	u32 base;
> > +	u32 len;
> > +};
> 
> There is no separate "cmn" block, it's just SSPP's base. Drop

sure will drop.


> > +
> >  /**
> >   * enum dpu_qos_lut_usage - define QoS LUT use cases
> >   */
> > @@ -294,7 +318,8 @@ struct dpu_sspp_sub_blks {
> >  	u32 qseed_ver;
> >  	struct dpu_scaler_blk scaler_blk;
> >  	struct dpu_pp_blk csc_blk;
> > -
> > +	struct dpu_sspp_rec_blk sspp_rec0_blk;
> > +	struct dpu_sspp_rec_blk sspp_rec1_blk;
> >  	const u32 *format_list;
> >  	u32 num_formats;
> >  	const struct dpu_rotation_cfg *rotation_cfg;
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
> > index 6f1fc790ad6d..a2c5d1433f13 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
> > @@ -15,141 +15,24 @@
> >  
> >  #include <linux/soc/qcom/ubwc.h>
> >  
> > -#define DPU_FETCH_CONFIG_RESET_VALUE   0x00000087
> > -
> > -/* SSPP registers */
> > -#define SSPP_SRC_SIZE                      0x00
> > -#define SSPP_SRC_XY                        0x08
> > -#define SSPP_OUT_SIZE                      0x0c
> > -#define SSPP_OUT_XY                        0x10
> > -#define SSPP_SRC0_ADDR                     0x14
> > -#define SSPP_SRC1_ADDR                     0x18
> > -#define SSPP_SRC2_ADDR                     0x1C
> > -#define SSPP_SRC3_ADDR                     0x20
> > -#define SSPP_SRC_YSTRIDE0                  0x24
> > -#define SSPP_SRC_YSTRIDE1                  0x28
> > -#define SSPP_SRC_FORMAT                    0x30
> > -#define SSPP_SRC_UNPACK_PATTERN            0x34
> > -#define SSPP_SRC_OP_MODE                   0x38
> > -#define SSPP_SRC_CONSTANT_COLOR            0x3c
> > -#define SSPP_EXCL_REC_CTL                  0x40
> > -#define SSPP_UBWC_STATIC_CTRL              0x44
> > -#define SSPP_FETCH_CONFIG                  0x48
> > -#define SSPP_DANGER_LUT                    0x60
> > -#define SSPP_SAFE_LUT                      0x64
> > -#define SSPP_CREQ_LUT                      0x68
> > -#define SSPP_QOS_CTRL                      0x6C
> > -#define SSPP_SRC_ADDR_SW_STATUS            0x70
> > -#define SSPP_CREQ_LUT_0                    0x74
> > -#define SSPP_CREQ_LUT_1                    0x78
> > -#define SSPP_DECIMATION_CONFIG             0xB4
> > -#define SSPP_SW_PIX_EXT_C0_LR              0x100
> > -#define SSPP_SW_PIX_EXT_C0_TB              0x104
> > -#define SSPP_SW_PIX_EXT_C0_REQ_PIXELS      0x108
> > -#define SSPP_SW_PIX_EXT_C1C2_LR            0x110
> > -#define SSPP_SW_PIX_EXT_C1C2_TB            0x114
> > -#define SSPP_SW_PIX_EXT_C1C2_REQ_PIXELS    0x118
> > -#define SSPP_SW_PIX_EXT_C3_LR              0x120
> > -#define SSPP_SW_PIX_EXT_C3_TB              0x124
> > -#define SSPP_SW_PIX_EXT_C3_REQ_PIXELS      0x128
> > -#define SSPP_TRAFFIC_SHAPER                0x130
> > -#define SSPP_CDP_CNTL                      0x134
> > -#define SSPP_UBWC_ERROR_STATUS             0x138
> > -#define SSPP_CDP_CNTL_REC1                 0x13c
> > -#define SSPP_TRAFFIC_SHAPER_PREFILL        0x150
> > -#define SSPP_TRAFFIC_SHAPER_REC1_PREFILL   0x154
> > -#define SSPP_TRAFFIC_SHAPER_REC1           0x158
> > -#define SSPP_OUT_SIZE_REC1                 0x160
> > -#define SSPP_OUT_XY_REC1                   0x164
> > -#define SSPP_SRC_XY_REC1                   0x168
> > -#define SSPP_SRC_SIZE_REC1                 0x16C
> > -#define SSPP_MULTIRECT_OPMODE              0x170
> > -#define SSPP_SRC_FORMAT_REC1               0x174
> > -#define SSPP_SRC_UNPACK_PATTERN_REC1       0x178
> > -#define SSPP_SRC_OP_MODE_REC1              0x17C
> > -#define SSPP_SRC_CONSTANT_COLOR_REC1       0x180
> > -#define SSPP_EXCL_REC_SIZE_REC1            0x184
> > -#define SSPP_EXCL_REC_XY_REC1              0x188
> > -#define SSPP_EXCL_REC_SIZE                 0x1B4
> > -#define SSPP_EXCL_REC_XY                   0x1B8
> > -#define SSPP_CLK_CTRL                      0x330
> > -
> > -/* SSPP_SRC_OP_MODE & OP_MODE_REC1 */
> > -#define MDSS_MDP_OP_DEINTERLACE            BIT(22)
> > -#define MDSS_MDP_OP_DEINTERLACE_ODD        BIT(23)
> > -#define MDSS_MDP_OP_IGC_ROM_1              BIT(18)
> > -#define MDSS_MDP_OP_IGC_ROM_0              BIT(17)
> > -#define MDSS_MDP_OP_IGC_EN                 BIT(16)
> > -#define MDSS_MDP_OP_FLIP_UD                BIT(14)
> > -#define MDSS_MDP_OP_FLIP_LR                BIT(13)
> > -#define MDSS_MDP_OP_BWC_EN                 BIT(0)
> > -#define MDSS_MDP_OP_PE_OVERRIDE            BIT(31)
> > -#define MDSS_MDP_OP_BWC_LOSSLESS           (0 << 1)
> > -#define MDSS_MDP_OP_BWC_Q_HIGH             (1 << 1)
> > -#define MDSS_MDP_OP_BWC_Q_MED              (2 << 1)
> > -
> > -/* SSPP_QOS_CTRL */
> > -#define SSPP_QOS_CTRL_VBLANK_EN            BIT(16)
> > -#define SSPP_QOS_CTRL_DANGER_SAFE_EN       BIT(0)
> > -#define SSPP_QOS_CTRL_DANGER_VBLANK_MASK   0x3
> > -#define SSPP_QOS_CTRL_DANGER_VBLANK_OFF    4
> > -#define SSPP_QOS_CTRL_CREQ_VBLANK_MASK     0x3
> > -#define SSPP_QOS_CTRL_CREQ_VBLANK_OFF      20
> > -
> > -/* DPU_SSPP_SCALER_QSEED2 */
> > -#define SSPP_VIG_OP_MODE                   0x0
> > -#define SCALE_CONFIG                       0x04
> > -#define COMP0_3_PHASE_STEP_X               0x10
> > -#define COMP0_3_PHASE_STEP_Y               0x14
> > -#define COMP1_2_PHASE_STEP_X               0x18
> > -#define COMP1_2_PHASE_STEP_Y               0x1c
> > -#define COMP0_3_INIT_PHASE_X               0x20
> > -#define COMP0_3_INIT_PHASE_Y               0x24
> > -#define COMP1_2_INIT_PHASE_X               0x28
> > -#define COMP1_2_INIT_PHASE_Y               0x2C
> > -#define VIG_0_QSEED2_SHARP                 0x30
> > -
> > -/* SSPP_TRAFFIC_SHAPER and _REC1 */
> > -#define SSPP_TRAFFIC_SHAPER_BPC_MAX        0xFF
> > -
> > -/*
> > - * Definitions for ViG op modes
> > - */
> > -#define VIG_OP_CSC_DST_DATAFMT BIT(19)
> > -#define VIG_OP_CSC_SRC_DATAFMT BIT(18)
> > -#define VIG_OP_CSC_EN          BIT(17)
> > -#define VIG_OP_MEM_PROT_CONT   BIT(15)
> > -#define VIG_OP_MEM_PROT_VAL    BIT(14)
> > -#define VIG_OP_MEM_PROT_SAT    BIT(13)
> > -#define VIG_OP_MEM_PROT_HUE    BIT(12)
> > -#define VIG_OP_HIST            BIT(8)
> > -#define VIG_OP_SKY_COL         BIT(7)
> > -#define VIG_OP_FOIL            BIT(6)
> > -#define VIG_OP_SKIN_COL        BIT(5)
> > -#define VIG_OP_PA_EN           BIT(4)
> > -#define VIG_OP_PA_SAT_ZERO_EXP BIT(2)
> > -#define VIG_OP_MEM_PROT_BLEND  BIT(1)
> > -
> > -/*
> > - * Definitions for CSC 10 op modes
> > - */
> > -#define SSPP_VIG_CSC_10_OP_MODE            0x0
> > -#define VIG_CSC_10_SRC_DATAFMT BIT(1)
> > -#define VIG_CSC_10_EN          BIT(0)
> > -#define CSC_10BIT_OFFSET       4
> > -
> > -/* traffic shaper clock in Hz */
> > -#define TS_CLK			19200000
> > -
> > -
> >  static void dpu_hw_sspp_setup_multirect(struct dpu_sw_pipe *pipe)
> >  {
> >  	struct dpu_hw_sspp *ctx = pipe->sspp;
> > -	u32 mode_mask;
> > +	u32 op_mode_off;
> >  
> >  	if (!ctx)
> >  		return;
> >  
> > +	op_mode_off = SSPP_MULTIRECT_OPMODE;
> 
> You don't need a variable to pass a constant.
Ok will fix it in next patch.


> > +
> > +	_dpu_hw_setup_multirect(pipe, ctx, op_mode_off);
> > +}
> > +
> > +void _dpu_hw_setup_multirect(struct dpu_sw_pipe *pipe,
> > +			     struct dpu_hw_sspp *ctx, u32 op_mode_off)
> > +{
> > +	u32 mode_mask;
> > +
> >  	if (pipe->multirect_index == DPU_SSPP_RECT_SOLO) {
> >  		/**
> >  		 * if rect index is RECT_SOLO, we cannot expect a
> > @@ -158,7 +41,7 @@ static void dpu_hw_sspp_setup_multirect(struct dpu_sw_pipe *pipe)
> >  		 */
> >  		mode_mask = 0;
> >  	} else {
> > -		mode_mask = DPU_REG_READ(&ctx->hw, SSPP_MULTIRECT_OPMODE);
> > +		mode_mask = DPU_REG_READ(&ctx->hw, op_mode_off);
> >  		mode_mask |= pipe->multirect_index;
> >  		if (pipe->multirect_mode == DPU_SSPP_MULTIRECT_TIME_MX)
> >  			mode_mask |= BIT(2);
> > @@ -166,11 +49,11 @@ static void dpu_hw_sspp_setup_multirect(struct dpu_sw_pipe *pipe)
> >  			mode_mask &= ~BIT(2);
> >  	}
> >  
> > -	DPU_REG_WRITE(&ctx->hw, SSPP_MULTIRECT_OPMODE, mode_mask);
> > +	DPU_REG_WRITE(&ctx->hw, op_mode_off, mode_mask);
> >  }
> >  
> > -static void _sspp_setup_opmode(struct dpu_hw_sspp *ctx,
> > -		u32 mask, u8 en)
> > +void _sspp_setup_opmode(struct dpu_hw_sspp *ctx,
> > +			u32 mask, u8 en)
> >  {
> >  	const struct dpu_sspp_sub_blks *sblk = ctx->cap->sblk;
> >  	u32 opmode;
> > @@ -189,8 +72,8 @@ static void _sspp_setup_opmode(struct dpu_hw_sspp *ctx,
> >  	DPU_REG_WRITE(&ctx->hw, sblk->scaler_blk.base + SSPP_VIG_OP_MODE, opmode);
> >  }
> >  
> > -static void _sspp_setup_csc10_opmode(struct dpu_hw_sspp *ctx,
> > -		u32 mask, u8 en)
> > +void _sspp_setup_csc10_opmode(struct dpu_hw_sspp *ctx,
> > +			      u32 mask, u8 en)
> >  {
> >  	const struct dpu_sspp_sub_blks *sblk = ctx->cap->sblk;
> >  	u32 opmode;
> > @@ -211,11 +94,8 @@ static void dpu_hw_sspp_setup_format(struct dpu_sw_pipe *pipe,
> >  		const struct msm_format *fmt, u32 flags)
> >  {
> >  	struct dpu_hw_sspp *ctx = pipe->sspp;
> > -	struct dpu_hw_blk_reg_map *c;
> > -	u32 chroma_samp, unpack, src_format;
> > -	u32 opmode = 0;
> > -	u32 fast_clear = 0;
> >  	u32 op_mode_off, unpack_pat_off, format_off;
> > +	u32 ubwc_ctrl_off, ubwc_err_off;
> >  
> >  	if (!ctx || !fmt)
> >  		return;
> > @@ -230,16 +110,42 @@ static void dpu_hw_sspp_setup_format(struct dpu_sw_pipe *pipe,
> >  		unpack_pat_off = SSPP_SRC_UNPACK_PATTERN_REC1;
> >  		format_off = SSPP_SRC_FORMAT_REC1;
> >  	}
> > +	ubwc_ctrl_off = SSPP_UBWC_STATIC_CTRL;
> > +	ubwc_err_off = SSPP_UBWC_ERROR_STATUS;
> 
> The same. No need for a variable to pass out register offset.
> 
> > +
> > +	_dpu_hw_setup_format(pipe, fmt, flags, ctx, op_mode_off,
> > +			     unpack_pat_off, format_off, ubwc_ctrl_off, ubwc_err_off);
> > +}
> > +
> > +void _dpu_hw_setup_format(struct dpu_sw_pipe *pipe, const struct msm_format *fmt,
> > +			  u32 flags, struct dpu_hw_sspp *ctx, u32 op_mode_off,
> > +			  u32 unpack_pat_off, u32 format_off, u32 ubwc_ctrl_off, u32 ubwc_err_off)
> > +{
> > +	struct dpu_hw_blk_reg_map *c;
> > +	u32 chroma_samp, unpack, src_format;
> > +	u32 opmode;
> > +	u32 fast_clear;
> > +	u8 core_major_ver;
> >  
> >  	c = &ctx->hw;
> > +	core_major_ver = ctx->mdss_ver->core_major_ver;
> > +
> >  	opmode = DPU_REG_READ(c, op_mode_off);
> > -	opmode &= ~(MDSS_MDP_OP_FLIP_LR | MDSS_MDP_OP_FLIP_UD |
> > +	if (core_major_ver >= 13)
> 
> If it is common, there should be no if(version) checks. But do we need a
> version check here at all?

I confirm this part is not needed. will delete.


> > +		opmode &= ~(MDSS_MDP_OP_FLIP_LR | MDSS_MDP_OP_FLIP_UD |
> > +				MDSS_MDP_OP_BWC_EN | MDSS_MDP_OP_PE_OVERRIDE
> > +				| MDSS_MDP_OP_ROT_90);
> > +	else
> > +		opmode &= ~(MDSS_MDP_OP_FLIP_LR | MDSS_MDP_OP_FLIP_UD |
> >  			MDSS_MDP_OP_BWC_EN | MDSS_MDP_OP_PE_OVERRIDE);
> >  
> >  	if (flags & DPU_SSPP_FLIP_LR)
> >  		opmode |= MDSS_MDP_OP_FLIP_LR;
> >  	if (flags & DPU_SSPP_FLIP_UD)
> >  		opmode |= MDSS_MDP_OP_FLIP_UD;
> > +	if (core_major_ver >= 13)
> > +		if (flags & DPU_SSPP_ROT_90)
> > +			opmode |= MDSS_MDP_OP_ROT_90;
> 
> And here?
> 
> >  
> >  	chroma_samp = fmt->chroma_sample;
> >  	if (flags & DPU_SSPP_SOURCE_ROTATED_90) {
> > @@ -273,31 +179,34 @@ static void dpu_hw_sspp_setup_format(struct dpu_sw_pipe *pipe,
> >  		if (MSM_FORMAT_IS_UBWC(fmt))
> >  			opmode |= MDSS_MDP_OP_BWC_EN;
> >  		src_format |= (fmt->fetch_mode & 3) << 30; /*FRAME_FORMAT */
> > -		DPU_REG_WRITE(c, SSPP_FETCH_CONFIG,
> > -			DPU_FETCH_CONFIG_RESET_VALUE |
> > -			ctx->ubwc->highest_bank_bit << 18);
> > +
> > +		if (core_major_ver < 13)
> > +			DPU_REG_WRITE(c, SSPP_FETCH_CONFIG,
> > +				      DPU_FETCH_CONFIG_RESET_VALUE |
> > +				      ctx->ubwc->highest_bank_bit << 18);
> > +
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
> No unrelated changes, please.

ubwc_ctrl_off
veriosn < 13 
reg: SSPP_UBWC_STATIC_CTRL
verison >= 13 
reg: SSPP_REC_UBWC_STATIC_CTRL

will add this fix in SSPP refactor patch. 


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
> > @@ -323,9 +232,8 @@ static void dpu_hw_sspp_setup_format(struct dpu_sw_pipe *pipe,
> >  	DPU_REG_WRITE(c, format_off, src_format);
> >  	DPU_REG_WRITE(c, unpack_pat_off, unpack);
> >  	DPU_REG_WRITE(c, op_mode_off, opmode);
> > -
> >  	/* clear previous UBWC error */
> > -	DPU_REG_WRITE(c, SSPP_UBWC_ERROR_STATUS, BIT(31));
> > +	DPU_REG_WRITE(c, ubwc_err_off, BIT(31));
> >  }
> >  
> >  static void dpu_hw_sspp_setup_pe_config(struct dpu_hw_sspp *ctx,
> > @@ -385,9 +293,9 @@ static void dpu_hw_sspp_setup_pe_config(struct dpu_hw_sspp *ctx,
> >  			tot_req_pixels[3]);
> >  }
> >  
> > -static void _dpu_hw_sspp_setup_scaler3(struct dpu_hw_sspp *ctx,
> > -		struct dpu_hw_scaler3_cfg *scaler3_cfg,
> > -		const struct msm_format *format)
> > +void _dpu_hw_sspp_setup_scaler3(struct dpu_hw_sspp *ctx,
> > +				struct dpu_hw_scaler3_cfg *scaler3_cfg,
> > +				const struct msm_format *format)
> >  {
> >  	if (!ctx || !scaler3_cfg)
> >  		return;
> > @@ -405,15 +313,11 @@ static void dpu_hw_sspp_setup_rects(struct dpu_sw_pipe *pipe,
> >  		struct dpu_sw_pipe_cfg *cfg)
> >  {
> >  	struct dpu_hw_sspp *ctx = pipe->sspp;
> > -	struct dpu_hw_blk_reg_map *c;
> > -	u32 src_size, src_xy, dst_size, dst_xy;
> >  	u32 src_size_off, src_xy_off, out_size_off, out_xy_off;
> >  
> >  	if (!ctx || !cfg)
> >  		return;
> >  
> > -	c = &ctx->hw;
> > -
> >  	if (pipe->multirect_index == DPU_SSPP_RECT_SOLO ||
> >  	    pipe->multirect_index == DPU_SSPP_RECT_0) {
> >  		src_size_off = SSPP_SRC_SIZE;
> > @@ -427,6 +331,19 @@ static void dpu_hw_sspp_setup_rects(struct dpu_sw_pipe *pipe,
> >  		out_xy_off = SSPP_OUT_XY_REC1;
> >  	}
> >  
> > +	_dpu_hw_setup_rects(pipe, cfg, ctx, src_size_off,
> > +			    src_xy_off, out_size_off, out_xy_off);
> > +}
> > +
> > +void _dpu_hw_setup_rects(struct dpu_sw_pipe *pipe,
> > +			 struct dpu_sw_pipe_cfg *cfg, struct dpu_hw_sspp *ctx,
> > +			 u32 src_size_off, u32 src_xy_off,
> > +			 u32 out_size_off, u32 out_xy_off)
> > +{
> > +	struct dpu_hw_blk_reg_map *c;
> > +	u32 src_size, src_xy, dst_size, dst_xy;
> > +
> > +	c = &ctx->hw;
> >  
> >  	/* src and dest rect programming */
> >  	src_xy = (cfg->src_rect.y1 << 16) | cfg->src_rect.x1;
> > @@ -497,8 +414,8 @@ static void dpu_hw_sspp_setup_sourceaddress(struct dpu_sw_pipe *pipe,
> >  	DPU_REG_WRITE(&ctx->hw, SSPP_SRC_YSTRIDE1, ystride1);
> >  }
> >  
> > -static void dpu_hw_sspp_setup_csc(struct dpu_hw_sspp *ctx,
> > -		const struct dpu_csc_cfg *data)
> > +void dpu_hw_sspp_setup_csc(struct dpu_hw_sspp *ctx,
> > +			   const struct dpu_csc_cfg *data)
> >  {
> >  	u32 offset;
> >  	bool csc10 = false;
> > @@ -519,21 +436,31 @@ static void dpu_hw_sspp_setup_csc(struct dpu_hw_sspp *ctx,
> >  static void dpu_hw_sspp_setup_solidfill(struct dpu_sw_pipe *pipe, u32 color)
> >  {
> >  	struct dpu_hw_sspp *ctx = pipe->sspp;
> > -	struct dpu_hw_fmt_layout cfg;
> > +	u32 const_clr_off;
> >  
> >  	if (!ctx)
> >  		return;
> >  
> > +	if (pipe->multirect_index == DPU_SSPP_RECT_SOLO ||
> > +	    pipe->multirect_index == DPU_SSPP_RECT_0)
> > +		const_clr_off = SSPP_SRC_CONSTANT_COLOR;
> > +	else
> > +		const_clr_off = SSPP_SRC_CONSTANT_COLOR_REC1;
> > +
> > +	_dpu_hw_setup_solidfill(pipe, color, ctx, const_clr_off);
> > +}
> > +
> > +void _dpu_hw_setup_solidfill(struct dpu_sw_pipe *pipe,
> > +			     u32 color, struct dpu_hw_sspp *ctx,
> > +			     u32 const_clr_off)
> > +{
> > +	struct dpu_hw_fmt_layout cfg;
> > +
> >  	/* cleanup source addresses */
> >  	memset(&cfg, 0, sizeof(cfg));
> >  	ctx->ops.setup_sourceaddress(pipe, &cfg);
> >  
> > -	if (pipe->multirect_index == DPU_SSPP_RECT_SOLO ||
> > -	    pipe->multirect_index == DPU_SSPP_RECT_0)
> > -		DPU_REG_WRITE(&ctx->hw, SSPP_SRC_CONSTANT_COLOR, color);
> > -	else
> > -		DPU_REG_WRITE(&ctx->hw, SSPP_SRC_CONSTANT_COLOR_REC1,
> > -				color);
> > +	DPU_REG_WRITE(&ctx->hw, const_clr_off, color);
> >  }
> >  
> >  static void dpu_hw_sspp_setup_qos_lut(struct dpu_hw_sspp *ctx,
> > @@ -706,7 +633,10 @@ struct dpu_hw_sspp *dpu_hw_sspp_init(struct drm_device *dev,
> >  
> >  	hw_pipe->mdss_ver = mdss_rev;
> >  
> > -	_setup_layer_ops(hw_pipe, hw_pipe->cap->features, mdss_rev);
> > +	if (mdss_rev->core_major_ver >= 13)
> > +		_setup_layer_ops_v13(hw_pipe, hw_pipe->cap->features, mdss_rev);
> > +	else
> > +		_setup_layer_ops(hw_pipe, hw_pipe->cap->features, mdss_rev);
> >  
> >  	return hw_pipe;
> >  }
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
> > index bdac5c04bf79..8ae4091e6e63 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
> > @@ -14,6 +14,167 @@ struct dpu_hw_sspp;
> >  
> >  #define DPU_SSPP_MAX_PITCH_SIZE		0xffff
> >  
> > +/* <= v12 DPU */
> > +/* SSPP registers */
> 
> No, keep them as they were.
Ok will keep them as they were.


> > +#define SSPP_SRC_SIZE                      0x00
> > +#define SSPP_SRC_XY                        0x08
> > +#define SSPP_OUT_SIZE                      0x0c
> > +#define SSPP_OUT_XY                        0x10
> > +#define SSPP_SRC0_ADDR                     0x14
> > +#define SSPP_SRC1_ADDR                     0x18
> > +#define SSPP_SRC2_ADDR                     0x1C
> > +#define SSPP_SRC3_ADDR                     0x20
> > +#define SSPP_SRC_YSTRIDE0                  0x24
> > +#define SSPP_SRC_YSTRIDE1                  0x28
> > +#define SSPP_SRC_FORMAT                    0x30
> > +#define SSPP_SRC_UNPACK_PATTERN            0x34
> > +#define SSPP_SRC_OP_MODE                   0x38
> > +#define SSPP_SRC_CONSTANT_COLOR            0x3c
> > +#define SSPP_EXCL_REC_CTL                  0x40
> > +#define SSPP_UBWC_STATIC_CTRL              0x44
> > +#define SSPP_FETCH_CONFIG                  0x48
> > +#define SSPP_DANGER_LUT                    0x60
> > +#define SSPP_SAFE_LUT                      0x64
> > +#define SSPP_CREQ_LUT                      0x68
> > +#define SSPP_QOS_CTRL                      0x6C
> > +#define SSPP_SRC_ADDR_SW_STATUS            0x70
> > +#define SSPP_CREQ_LUT_0                    0x74
> > +#define SSPP_CREQ_LUT_1                    0x78
> > +#define SSPP_DECIMATION_CONFIG             0xB4
> > +#define SSPP_SW_PIX_EXT_C0_LR              0x100
> > +#define SSPP_SW_PIX_EXT_C0_TB              0x104
> > +#define SSPP_SW_PIX_EXT_C0_REQ_PIXELS      0x108
> > +#define SSPP_SW_PIX_EXT_C1C2_LR            0x110
> > +#define SSPP_SW_PIX_EXT_C1C2_TB            0x114
> > +#define SSPP_SW_PIX_EXT_C1C2_REQ_PIXELS    0x118
> > +#define SSPP_SW_PIX_EXT_C3_LR              0x120
> > +#define SSPP_SW_PIX_EXT_C3_TB              0x124
> > +#define SSPP_SW_PIX_EXT_C3_REQ_PIXELS      0x128
> > +#define SSPP_TRAFFIC_SHAPER                0x130
> > +#define SSPP_CDP_CNTL                      0x134
> > +#define SSPP_UBWC_ERROR_STATUS             0x138
> > +#define SSPP_CDP_CNTL_REC1                 0x13c
> > +#define SSPP_TRAFFIC_SHAPER_PREFILL        0x150
> > +#define SSPP_TRAFFIC_SHAPER_REC1_PREFILL   0x154
> > +#define SSPP_TRAFFIC_SHAPER_REC1           0x158
> > +#define SSPP_OUT_SIZE_REC1                 0x160
> > +#define SSPP_OUT_XY_REC1                   0x164
> > +#define SSPP_SRC_XY_REC1                   0x168
> > +#define SSPP_SRC_SIZE_REC1                 0x16C
> > +#define SSPP_MULTIRECT_OPMODE              0x170
> > +#define SSPP_SRC_FORMAT_REC1               0x174
> > +#define SSPP_SRC_UNPACK_PATTERN_REC1       0x178
> > +#define SSPP_SRC_OP_MODE_REC1              0x17C
> > +#define SSPP_SRC_CONSTANT_COLOR_REC1       0x180
> > +#define SSPP_EXCL_REC_SIZE_REC1            0x184
> > +#define SSPP_EXCL_REC_XY_REC1              0x188
> > +#define SSPP_EXCL_REC_SIZE                 0x1B4
> > +#define SSPP_EXCL_REC_XY                   0x1B8
> > +#define SSPP_CLK_CTRL                      0x330
> > +
> > +/* >= v13 DPU */
> > +/* CMN Registers -> Source Surface Processing Pipe Common SSPP registers */
> > +/*      Name                                        Offset */
> > +#define SSPP_CMN_CLK_CTRL                0x0
> > +#define SSPP_CMN_CLK_STATUS              0x4
> > +#define SSPP_CMN_MULTI_REC_OP_MODE       0x10
> > +#define SSPP_CMN_ADDR_CONFIG             0x14
> > +#define SSPP_CMN_CAC_CTRL                0x20
> > +#define SSPP_CMN_SYS_CACHE_MODE          0x24
> > +#define SSPP_CMN_QOS_CTRL                0x28
> > +#define SSPP_CMN_DANGER_LUT              0x2c
> > +#define SSPP_CMN_SAFE_LUT                0x30
> > +
> > +#define SSPP_CMN_FILL_LEVEL_SCALE                0x3c
> > +#define SSPP_CMN_FILL_LEVELS                     0x40
> > +#define SSPP_CMN_STATUS                          0x44
> > +#define SSPP_CMN_FETCH_DMA_RD_OTS                0x48
> > +#define SSPP_CMN_FETCH_DTB_WR_PLANE0             0x4c
> > +#define SSPP_CMN_FETCH_DTB_WR_PLANE1             0x50
> > +#define SSPP_CMN_FETCH_DTB_WR_PLANE2             0x54
> > +#define SSPP_CMN_DTB_UNPACK_RD_PLANE0            0x58
> > +#define SSPP_CMN_DTB_UNPACK_RD_PLANE1            0x5c
> > +#define SSPP_CMN_DTB_UNPACK_RD_PLANE2            0x60
> > +#define SSPP_CMN_UNPACK_LINE_COUNT               0x64
> > +#define SSPP_CMN_TPG_CONTROL                     0x68
> > +#define SSPP_CMN_TPG_CONFIG                      0x6c
> > +#define SSPP_CMN_TPG_COMPONENT_LIMITS            0x70
> > +#define SSPP_CMN_TPG_RECTANGLE                   0x74
> > +#define SSPP_CMN_TPG_BLACK_WHITE_PATTERN_FRAMES  0x78
> > +#define SSPP_CMN_TPG_RGB_MAPPING                 0x7c
> > +#define SSPP_CMN_TPG_PATTERN_GEN_INIT_VAL        0x80
> > +
> > +/*RECRegisterset*/
> > +/*Name        Offset*/
> > +#define SSPP_REC_SRC_FORMAT                             0x0
> > +#define SSPP_REC_SRC_UNPACK_PATTERN                     0x4
> > +#define SSPP_REC_SRC_OP_MODE                            0x8
> > +#define SSPP_REC_SRC_CONSTANT_COLOR                     0xc
> > +#define SSPP_REC_SRC_IMG_SIZE                           0x10
> > +#define SSPP_REC_SRC_SIZE                               0x14
> > +#define SSPP_REC_SRC_XY                                 0x18
> > +#define SSPP_REC_OUT_SIZE                               0x1c
> > +#define SSPP_REC_OUT_XY                                 0x20
> > +#define SSPP_REC_SW_PIX_EXT_LR                          0x24
> > +#define SSPP_REC_SW_PIX_EXT_TB                          0x28
> > +#define SSPP_REC_SRC_SIZE_ODX                           0x30
> > +#define SSPP_REC_SRC_XY_ODX                             0x34
> > +#define SSPP_REC_OUT_SIZE_ODX                           0x38
> > +#define SSPP_REC_OUT_XY_ODX                             0x3c
> > +#define SSPP_REC_SW_PIX_EXT_LR_ODX                      0x40
> > +#define SSPP_REC_SW_PIX_EXT_TB_ODX                      0x44
> > +#define SSPP_REC_PRE_DOWN_SCALE                         0x48
> > +#define SSPP_REC_SRC0_ADDR                              0x4c
> > +#define SSPP_REC_SRC1_ADDR                              0x50
> > +#define SSPP_REC_SRC2_ADDR                              0x54
> > +#define SSPP_REC_SRC3_ADDR                              0x58
> > +#define SSPP_REC_SRC_YSTRIDE0                           0x5c
> > +#define SSPP_REC_SRC_YSTRIDE1                           0x60
> > +#define SSPP_REC_CURRENT_SRC0_ADDR                      0x64
> > +#define SSPP_REC_CURRENT_SRC1_ADDR                      0x68
> > +#define SSPP_REC_CURRENT_SRC2_ADDR                      0x6c
> > +#define SSPP_REC_CURRENT_SRC3_ADDR                      0x70
> > +#define SSPP_REC_SRC_ADDR_SW_STATUS                     0x74
> > +#define SSPP_REC_CDP_CNTL                               0x78
> > +#define SSPP_REC_TRAFFIC_SHAPER                         0x7c
> > +#define SSPP_REC_TRAFFIC_SHAPER_PREFILL                 0x80
> > +#define SSPP_REC_PD_MEM_ALLOC                           0x84
> > +#define SSPP_REC_QOS_CLAMP                              0x88
> > +#define SSPP_REC_UIDLE_CTRL_VALUE                       0x8c
> > +#define SSPP_REC_UBWC_STATIC_CTRL                       0x90
> > +#define SSPP_REC_UBWC_STATIC_CTRL_OVERRIDE              0x94
> > +#define SSPP_REC_UBWC_STATS_ROI                         0x98
> > +#define SSPP_REC_UBWC_STATS_WORST_TILE_ROW_BW_ROI0      0x9c
> > +#define SSPP_REC_UBWC_STATS_TOTAL_BW_ROI0               0xa0
> > +#define SSPP_REC_UBWC_STATS_WORST_TILE_ROW_BW_ROI1      0xa4
> > +#define SSPP_REC_UBWC_STATS_TOTAL_BW_ROI1               0xa8
> > +#define SSPP_REC_UBWC_STATS_WORST_TILE_ROW_BW_ROI2      0xac
> > +#define SSPP_REC_UBWC_STATS_TOTAL_BW_ROI2               0xb0
> > +#define SSPP_REC_EXCL_REC_CTRL                          0xb4
> > +#define SSPP_REC_EXCL_REC_SIZE                          0xb8
> > +#define SSPP_REC_EXCL_REC_XY                            0xbc
> > +#define SSPP_REC_LINE_INSERTION_CTRL                    0xc0
> > +#define SSPP_REC_LINE_INSERTION_OUT_SIZE                0xc4
> > +#define SSPP_REC_FETCH_PIPE_ACTIVE                      0xc8
> > +#define SSPP_REC_META_ERROR_STATUS                      0xcc
> > +#define SSPP_REC_UBWC_ERROR_STATUS                      0xd0
> > +#define SSPP_REC_FLUSH_CTRL                             0xd4
> > +#define SSPP_REC_INTR_EN                                0xd8
> > +#define SSPP_REC_INTR_STATUS                            0xdc
> > +#define SSPP_REC_INTR_CLEAR                             0xe0
> > +#define SSPP_REC_HSYNC_STATUS                           0xe4
> > +#define SSPP_REC_FP16_CONFIG                            0x150
> > +#define SSPP_REC_FP16_CSC_MATRIX_COEFF_R_0              0x154
> > +#define SSPP_REC_FP16_CSC_MATRIX_COEFF_R_1              0x158
> > +#define SSPP_REC_FP16_CSC_MATRIX_COEFF_G_0              0x15c
> > +#define SSPP_REC_FP16_CSC_MATRIX_COEFF_G_1              0x160
> > +#define SSPP_REC_FP16_CSC_MATRIX_COEFF_B_0              0x164
> > +#define SSPP_REC_FP16_CSC_MATRIX_COEFF_B_1              0x168
> > +#define SSPP_REC_FP16_CSC_PRE_CLAMP_R                   0x16c
> > +#define SSPP_REC_FP16_CSC_PRE_CLAMP_G                   0x170
> > +#define SSPP_REC_FP16_CSC_PRE_CLAMP_B                   0x174
> > +#define SSPP_REC_FP16_CSC_POST_CLAMP                    0x178
> > +
> >  /**
> >   * Flags
> >   */
> > @@ -23,6 +184,76 @@ struct dpu_hw_sspp;
> >  #define DPU_SSPP_ROT_90			BIT(3)
> >  #define DPU_SSPP_SOLID_FILL		BIT(4)
> >  
> > +/* SSPP_SRC_OP_MODE & OP_MODE_REC1 */
> > +#define MDSS_MDP_OP_DEINTERLACE            BIT(22)
> > +#define MDSS_MDP_OP_DEINTERLACE_ODD        BIT(23)
> > +#define MDSS_MDP_OP_IGC_ROM_1              BIT(18)
> > +#define MDSS_MDP_OP_IGC_ROM_0              BIT(17)
> > +#define MDSS_MDP_OP_IGC_EN                 BIT(16)
> > +#define MDSS_MDP_OP_ROT_90                 BIT(15)
> > +#define MDSS_MDP_OP_FLIP_UD                BIT(14)
> > +#define MDSS_MDP_OP_FLIP_LR                BIT(13)
> > +#define MDSS_MDP_OP_BWC_EN                 BIT(0)
> > +#define MDSS_MDP_OP_PE_OVERRIDE            BIT(31)
> > +#define MDSS_MDP_OP_BWC_LOSSLESS           (0 << 1)
> > +#define MDSS_MDP_OP_BWC_Q_HIGH             (1 << 1)
> > +#define MDSS_MDP_OP_BWC_Q_MED              (2 << 1)
> > +
> > +/*
> > + * Definitions for ViG op modes
> > + */
> > +#define VIG_OP_CSC_DST_DATAFMT BIT(19)
> > +#define VIG_OP_CSC_SRC_DATAFMT BIT(18)
> > +#define VIG_OP_CSC_EN          BIT(17)
> > +#define VIG_OP_MEM_PROT_CONT   BIT(15)
> > +#define VIG_OP_MEM_PROT_VAL    BIT(14)
> > +#define VIG_OP_MEM_PROT_SAT    BIT(13)
> > +#define VIG_OP_MEM_PROT_HUE    BIT(12)
> > +#define VIG_OP_HIST            BIT(8)
> > +#define VIG_OP_SKY_COL         BIT(7)
> > +#define VIG_OP_FOIL            BIT(6)
> > +#define VIG_OP_SKIN_COL        BIT(5)
> > +#define VIG_OP_PA_EN           BIT(4)
> > +#define VIG_OP_PA_SAT_ZERO_EXP BIT(2)
> > +#define VIG_OP_MEM_PROT_BLEND  BIT(1)
> > +
> > +/*
> > + * Definitions for CSC 10 op modes
> > + */
> > +#define SSPP_VIG_CSC_10_OP_MODE            0x0
> > +#define VIG_CSC_10_SRC_DATAFMT BIT(1)
> > +#define VIG_CSC_10_EN          BIT(0)
> > +#define CSC_10BIT_OFFSET       4
> > +
> > +/* SSPP_QOS_CTRL */
> > +#define SSPP_QOS_CTRL_VBLANK_EN            BIT(16)
> > +#define SSPP_QOS_CTRL_DANGER_SAFE_EN       BIT(0)
> > +#define SSPP_QOS_CTRL_DANGER_VBLANK_MASK   0x3
> > +#define SSPP_QOS_CTRL_DANGER_VBLANK_OFF    4
> > +#define SSPP_QOS_CTRL_CREQ_VBLANK_MASK     0x3
> > +#define SSPP_QOS_CTRL_CREQ_VBLANK_OFF      20
> > +
> > +#define DPU_FETCH_CONFIG_RESET_VALUE   0x00000087
> > +
> > +/* DPU_SSPP_SCALER_QSEED2 */
> > +#define SSPP_VIG_OP_MODE                   0x0
> > +#define SCALE_CONFIG                       0x04
> > +#define COMP0_3_PHASE_STEP_X               0x10
> > +#define COMP0_3_PHASE_STEP_Y               0x14
> > +#define COMP1_2_PHASE_STEP_X               0x18
> > +#define COMP1_2_PHASE_STEP_Y               0x1c
> > +#define COMP0_3_INIT_PHASE_X               0x20
> > +#define COMP0_3_INIT_PHASE_Y               0x24
> > +#define COMP1_2_INIT_PHASE_X               0x28
> > +#define COMP1_2_INIT_PHASE_Y               0x2C
> > +#define VIG_0_QSEED2_SHARP                 0x30
> > +
> > +/* SSPP_TRAFFIC_SHAPER and _REC1 */
> > +#define SSPP_TRAFFIC_SHAPER_BPC_MAX        0xFF
> > +
> > +/* traffic shaper clock in Hz */
> > +#define TS_CLK			19200000
> > +
> >  /**
> >   * Component indices
> >   */
> > @@ -331,5 +562,38 @@ struct dpu_hw_sspp *dpu_hw_sspp_init(struct drm_device *dev,
> >  int _dpu_hw_sspp_init_debugfs(struct dpu_hw_sspp *hw_pipe, struct dpu_kms *kms,
> >  			      struct dentry *entry);
> >  
> > +void _sspp_setup_opmode(struct dpu_hw_sspp *ctx,
> > +			u32 mask, u8 en);
> 
> Don't you see an issue with these names? Please use a sensible prefix
> that is used by the rest of the driver.

OK, 

_dpu_hw_setup_multirect 
--> dpu_hw_setup_multirect_helper or 
    dpu_hw_setup_multirect_impl

add suffix like _helper or _impl or _common

these names can be good enough?




> > +
> > +void _sspp_setup_csc10_opmode(struct dpu_hw_sspp *ctx,
> > +			      u32 mask, u8 en);
> > +
> > +void _dpu_hw_sspp_setup_scaler3(struct dpu_hw_sspp *ctx,
> > +				struct dpu_hw_scaler3_cfg *scaler3_cfg,
> > +				const struct msm_format *format);
> > +
> > +void _setup_layer_ops_v13(struct dpu_hw_sspp *c,
> 
> I'd rather have dpu_hw_sspp_init_v13

Ok will use dpu_hw_sspp_init_v13.


> > +			  unsigned long features,
> > +			  const struct dpu_mdss_version *mdss_rev);
> > +
> > +void dpu_hw_sspp_setup_csc(struct dpu_hw_sspp *ctx,
> > +			   const struct dpu_csc_cfg *data);
> > +
> > +void _dpu_hw_setup_multirect(struct dpu_sw_pipe *pipe,
> > +			     struct dpu_hw_sspp *ctx,
> > +			     u32 op_mode_off);
> > +
> > +void _dpu_hw_setup_format(struct dpu_sw_pipe *pipe, const struct msm_format *fmt,
> > +			  u32 flags, struct dpu_hw_sspp *ctx,
> > +			  u32 op_mode_off, u32 unpack_pat_off, u32 format_off,
> > +			  u32 ubwc_ctrl_off, u32 ubwc_err_off);
> > +
> > +void _dpu_hw_setup_rects(struct dpu_sw_pipe *pipe, struct dpu_sw_pipe_cfg *cfg,
> > +			 struct dpu_hw_sspp *ctx, u32 src_size_off, u32 src_xy_off,
> > +			 u32 out_size_off, u32 out_xy_off);
> > +
> > +void _dpu_hw_setup_solidfill(struct dpu_sw_pipe *pipe,
> > +			     u32 color, struct dpu_hw_sspp *ctx, u32 const_clr_off);
> > +
> >  #endif /*_DPU_HW_SSPP_H */
> >  
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ssppv13.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ssppv13.c
> > new file mode 100644
> > index 000000000000..ba2d70182d58
> > --- /dev/null
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ssppv13.c
> > @@ -0,0 +1,224 @@
> > +// SPDX-License-Identifier: BSD-3-Clause
> > +/*
> > + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> > + */
> > +
> > +#include <linux/printk.h>
> > +#include <linux/soc/qcom/ubwc.h>
> > +
> > +#include "dpu_hw_sspp.h"
> > +
> > +static inline u32 _sspp_calculate_rect_off(enum dpu_sspp_multirect_index rect_index,
> 
> prefix with dpu_hw_sspp

Sure will use dpu_hw_sspp 

from _sspp_calculate_rect_off  --> dpu_hw_sspp_calculate_rect_off

> > +					   struct dpu_hw_sspp *ctx)
> 
> ctx should be the first argument.

Ok will fix.


> 
> > +{
> > +	return (rect_index == DPU_SSPP_RECT_SOLO || rect_index == DPU_SSPP_RECT_0) ?
> > +		ctx->cap->sblk->sspp_rec0_blk.base : ctx->cap->sblk->sspp_rec1_blk.base;
> > +}
> > +
> > +static void dpu_hw_sspp_setup_multirect_v13(struct dpu_sw_pipe *pipe)
> > +{
> > +	struct dpu_hw_sspp *ctx = pipe->sspp;
> > +	u32 op_mode_off;
> > +
> > +	if (!ctx)
> > +		return;
> > +
> > +	op_mode_off = SSPP_CMN_MULTI_REC_OP_MODE;
> 
> You can guess my comment.
Sure.

> > +
> > +	_dpu_hw_setup_multirect(pipe, ctx, op_mode_off);
> > +}
> > +
> > +static void dpu_hw_sspp_setup_format_v13(struct dpu_sw_pipe *pipe,
> > +					 const struct msm_format *fmt, u32 flags)
> > +{
> > +	struct dpu_hw_sspp *ctx = pipe->sspp;
> > +	u32 op_mode_off, unpack_pat_off, format_off;
> > +	u32 ubwc_ctrl_off, ubwc_err_off;
> > +	u32 offset;
> > +
> > +	if (!ctx || !fmt)
> > +		return;
> > +
> > +	offset = _sspp_calculate_rect_off(pipe->multirect_index, ctx);
> > +
> > +	op_mode_off = offset + SSPP_REC_SRC_OP_MODE;
> > +	unpack_pat_off = offset + SSPP_REC_SRC_UNPACK_PATTERN;
> > +	format_off = offset + SSPP_REC_SRC_FORMAT;
> > +	ubwc_ctrl_off = offset + SSPP_REC_UBWC_STATIC_CTRL;
> > +	ubwc_err_off = offset + SSPP_REC_UBWC_ERROR_STATUS;
> > +
> > +	_dpu_hw_setup_format(pipe, fmt, flags, ctx, op_mode_off,
> > +			     unpack_pat_off, format_off, ubwc_ctrl_off, ubwc_err_off);
> > +}
> > +
> > +static void dpu_hw_sspp_setup_pe_config_v13(struct dpu_hw_sspp *ctx,
> > +					    struct dpu_hw_pixel_ext *pe_ext)
> > +{
> > +	struct dpu_hw_blk_reg_map *c;
> > +	u8 color;
> > +	u32 lr_pe[4], tb_pe[4];
> > +	const u32 bytemask = 0xff;
> > +	u32 offset = ctx->cap->sblk->sspp_rec0_blk.base;
> > +
> > +	if (!ctx || !pe_ext)
> > +		return;
> > +
> > +	c = &ctx->hw;
> > +	/* program SW pixel extension override for all pipes*/
> > +	for (color = 0; color < DPU_MAX_PLANES; color++) {
> > +		/* color 2 has the same set of registers as color 1 */
> > +		if (color == 2)
> > +			continue;
> > +
> > +		lr_pe[color] = ((pe_ext->right_ftch[color] & bytemask) << 24) |
> > +			       ((pe_ext->right_rpt[color] & bytemask) << 16) |
> > +			       ((pe_ext->left_ftch[color] & bytemask) << 8) |
> > +			       (pe_ext->left_rpt[color] & bytemask);
> > +
> > +		tb_pe[color] = ((pe_ext->btm_ftch[color] & bytemask) << 24) |
> > +			       ((pe_ext->btm_rpt[color] & bytemask) << 16) |
> > +			       ((pe_ext->top_ftch[color] & bytemask) << 8) |
> > +			       (pe_ext->top_rpt[color] & bytemask);
> > +	}
> > +
> > +	/* color 0 */
> > +	DPU_REG_WRITE(c, SSPP_REC_SW_PIX_EXT_LR + offset, lr_pe[0]);
> > +	DPU_REG_WRITE(c, SSPP_REC_SW_PIX_EXT_TB + offset, tb_pe[0]);
> > +
> > +	/* color 1 and color 2 */
> > +	DPU_REG_WRITE(c, SSPP_REC_SW_PIX_EXT_LR_ODX + offset, lr_pe[1]);
> > +	DPU_REG_WRITE(c, SSPP_REC_SW_PIX_EXT_TB_ODX + offset, tb_pe[1]);
> > +}
> > +
> > +static void dpu_hw_sspp_setup_rects_v13(struct dpu_sw_pipe *pipe,
> > +					struct dpu_sw_pipe_cfg *cfg)
> > +{
> > +	struct dpu_hw_sspp *ctx = pipe->sspp;
> > +	u32 src_size_off, src_xy_off, out_size_off, out_xy_off;
> > +	u32 offset;
> > +
> > +	if (!ctx || !cfg)
> > +		return;
> > +
> > +	offset = _sspp_calculate_rect_off(pipe->multirect_index, ctx);
> > +
> > +	src_size_off = offset + SSPP_REC_SRC_SIZE;
> > +	src_xy_off = offset + SSPP_REC_SRC_XY;
> > +	out_size_off = offset + SSPP_REC_OUT_SIZE;
> > +	out_xy_off = offset + SSPP_REC_OUT_XY;
> > +
> > +	_dpu_hw_setup_rects(pipe, cfg, ctx, src_size_off,
> > +			    src_xy_off, out_size_off, out_xy_off);
> 
> I think this can be inlined, there is very little in performing (x << 16) | y.

Sure 
void _dpu_hw_setup_rects --> inline void dpu_hw_setup_rects_helper 

> > +}
> > +
> > +static void dpu_hw_sspp_setup_sourceaddress_v13(struct dpu_sw_pipe *pipe,
> > +						struct dpu_hw_fmt_layout *layout)
> > +{
> > +	struct dpu_hw_sspp *ctx = pipe->sspp;
> > +	int i;
> > +	u32 offset, ystride0, ystride1;
> > +
> > +	if (!ctx)
> > +		return;
> > +
> > +	offset = _sspp_calculate_rect_off(pipe->multirect_index, ctx);
> > +
> > +	for (i = 0; i < ARRAY_SIZE(layout->plane_addr); i++)
> > +		DPU_REG_WRITE(&ctx->hw, offset + SSPP_REC_SRC0_ADDR + i * 0x4,
> > +			      layout->plane_addr[i]);
> > +
> > +	ystride0 = (layout->plane_pitch[0]) | (layout->plane_pitch[2] << 16);
> > +	ystride1 = (layout->plane_pitch[1]) | (layout->plane_pitch[3] << 16);
> > +
> > +	DPU_REG_WRITE(&ctx->hw, offset + SSPP_REC_SRC_YSTRIDE0, ystride0);
> > +	DPU_REG_WRITE(&ctx->hw, offset + SSPP_REC_SRC_YSTRIDE1, ystride1);
> > +}
> > +
> > +static void dpu_hw_sspp_setup_solidfill_v13(struct dpu_sw_pipe *pipe, u32 color)
> > +{
> > +	struct dpu_hw_sspp *ctx = pipe->sspp;
> > +	u32 const_clr_off;
> > +	u32 offset;
> > +
> > +	if (!ctx)
> > +		return;
> > +
> > +	offset = _sspp_calculate_rect_off(pipe->multirect_index, ctx);
> > +	const_clr_off = offset + SSPP_REC_SRC_CONSTANT_COLOR;
> > +
> > +	_dpu_hw_setup_solidfill(pipe, color, ctx, const_clr_off);
> > +}
> > +
> > +static void dpu_hw_sspp_setup_qos_lut_v13(struct dpu_hw_sspp *ctx,
> > +					  struct dpu_hw_qos_cfg *cfg)
> > +{
> > +	if (!ctx || !cfg)
> > +		return;
> > +
> > +	_dpu_hw_setup_qos_lut_v13(&ctx->hw, 0, 1, cfg);
> > +}
> > +
> > +static void dpu_hw_sspp_setup_qos_ctrl_v13(struct dpu_hw_sspp *ctx,
> > +					   bool danger_safe_en)
> > +{
> > +	if (!ctx)
> > +		return;
> > +
> > +	DPU_REG_WRITE(&ctx->hw, SSPP_CMN_QOS_CTRL,
> > +		      danger_safe_en ? SSPP_QOS_CTRL_DANGER_SAFE_EN : 0);
> > +}
> > +
> > +static void dpu_hw_sspp_setup_cdp_v13(struct dpu_sw_pipe *pipe,
> > +				      const struct msm_format *fmt,
> > +				      bool enable)
> > +{
> > +	struct dpu_hw_sspp *ctx = pipe->sspp;
> > +	u32 offset = 0;
> > +
> > +	if (!ctx)
> > +		return;
> > +
> > +	offset = _sspp_calculate_rect_off(pipe->multirect_index, ctx);
> > +	dpu_setup_cdp(&ctx->hw, offset + SSPP_REC_CDP_CNTL, fmt, enable);
> > +}
> > +
> > +static bool dpu_hw_sspp_setup_clk_force_ctrl_v13(struct dpu_hw_sspp *ctx, bool enable)
> > +{
> > +	static const struct dpu_clk_ctrl_reg sspp_clk_ctrl = {
> > +		.reg_off = SSPP_CMN_CLK_CTRL,
> > +		.bit_off = 0
> > +	};
> > +
> > +	return dpu_hw_clk_force_ctrl(&ctx->hw, &sspp_clk_ctrl, enable);
> > +}
> > +
> > +void _setup_layer_ops_v13(struct dpu_hw_sspp *c,
> > +			  unsigned long features, const struct dpu_mdss_version *mdss_rev)
> > +{
> > +		c->ops.setup_format = dpu_hw_sspp_setup_format_v13;
> > +		c->ops.setup_rects = dpu_hw_sspp_setup_rects_v13;
> > +		c->ops.setup_sourceaddress = dpu_hw_sspp_setup_sourceaddress_v13;
> > +		c->ops.setup_solidfill = dpu_hw_sspp_setup_solidfill_v13;
> > +		c->ops.setup_pe = dpu_hw_sspp_setup_pe_config_v13;
> > +
> > +		if (test_bit(DPU_SSPP_QOS, &features)) {
> > +			c->ops.setup_qos_lut = dpu_hw_sspp_setup_qos_lut_v13;
> > +			c->ops.setup_qos_ctrl = dpu_hw_sspp_setup_qos_ctrl_v13;
> > +		}
> > +
> > +		if (test_bit(DPU_SSPP_CSC, &features) ||
> > +		    test_bit(DPU_SSPP_CSC_10BIT, &features))
> > +			c->ops.setup_csc = dpu_hw_sspp_setup_csc;
> > +
> > +		if (test_bit(DPU_SSPP_SMART_DMA_V1, &c->cap->features) ||
> > +		    test_bit(DPU_SSPP_SMART_DMA_V2, &c->cap->features))
> > +			c->ops.setup_multirect = dpu_hw_sspp_setup_multirect_v13;
> > +
> > +		if (test_bit(DPU_SSPP_SCALER_QSEED3_COMPATIBLE, &features))
> > +			c->ops.setup_scaler = _dpu_hw_sspp_setup_scaler3;
> > +
> > +		if (test_bit(DPU_SSPP_CDP, &features))
> > +			c->ops.setup_cdp = dpu_hw_sspp_setup_cdp_v13;
> > +
> > +		c->ops.setup_clk_force_ctrl = dpu_hw_sspp_setup_clk_force_ctrl_v13;
> > +}
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c
> > index 486be346d40d..968020967bc5 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c
> > @@ -81,6 +81,13 @@ static u32 dpu_hw_util_log_mask = DPU_DBG_MASK_NONE;
> >  #define QOS_CREQ_LUT_0                    0x14
> >  #define QOS_CREQ_LUT_1                    0x18
> >  
> > +/* CMN_QOS_LUT */
> > +#define SSPP_CMN_DANGER_LUT                    0x2C
> 
> Any reason why this wasn't lowecased?

Ok will note this.


> > +#define SSPP_CMN_SAFE_LUT                      0x30
> > +#define SSPP_CMN_CREQ_LUT_0                    0x34
> > +#define SSPP_CMN_CREQ_LUT_1                    0x38
> > +#define SSPP_CMN_QOS_CTRL	                   0x28
> > +
> >  /* QOS_QOS_CTRL */
> >  #define QOS_QOS_CTRL_DANGER_SAFE_EN       BIT(0)
> >  #define QOS_QOS_CTRL_DANGER_VBLANK_MASK   GENMASK(5, 4)
> > @@ -475,6 +482,22 @@ void _dpu_hw_setup_qos_lut(struct dpu_hw_blk_reg_map *c, u32 offset,
> >  		      cfg->danger_safe_en ? QOS_QOS_CTRL_DANGER_SAFE_EN : 0);
> >  }
> >  
> > +void _dpu_hw_setup_qos_lut_v13(struct dpu_hw_blk_reg_map *c, u32 offset,
> > +			       bool qos_8lvl,
> > +			       const struct dpu_hw_qos_cfg *cfg)
> 
> Does WB blcok also use new regisger format? If yes, the register offsets
> should be named differently. If no, there is no reason to have the
> function here, it can be inlined.

OK will drop _dpu_hw_setup_qos_lut function, will check. Thanks

> 
> > +{
> > +	DPU_REG_WRITE(c, offset + SSPP_CMN_DANGER_LUT, cfg->danger_lut);
> > +	DPU_REG_WRITE(c, offset + SSPP_CMN_SAFE_LUT, cfg->safe_lut);
> > +
> > +	if (qos_8lvl) {
> 
> This is redundant, we know that on DPU >= 13 we have 8 level QoS.
> 
> > +		DPU_REG_WRITE(c, offset + SSPP_CMN_CREQ_LUT_0, cfg->creq_lut);
> > +		DPU_REG_WRITE(c, offset + SSPP_CMN_CREQ_LUT_1, cfg->creq_lut >> 32);
> > +	}
> > +
> > +	DPU_REG_WRITE(c, offset + SSPP_CMN_QOS_CTRL,
> > +		      cfg->danger_safe_en ? QOS_QOS_CTRL_DANGER_SAFE_EN : 0);
> > +}
> > +
> >  /*
> >   * note: Aside from encoders, input_sel should be set to 0x0 by default
> >   */
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h
> > index 67b08e99335d..9d442d6fc11c 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h
> > @@ -360,6 +360,10 @@ void _dpu_hw_setup_qos_lut(struct dpu_hw_blk_reg_map *c, u32 offset,
> >  			   bool qos_8lvl,
> >  			   const struct dpu_hw_qos_cfg *cfg);
> >  
> > +void _dpu_hw_setup_qos_lut_v13(struct dpu_hw_blk_reg_map *c, u32 offset,
> > +			       bool qos_8lvl,
> > +			       const struct dpu_hw_qos_cfg *cfg);
> > +
> >  void dpu_hw_setup_misr(struct dpu_hw_blk_reg_map *c,
> >  		u32 misr_ctrl_offset, u8 input_sel);
> >  
> > -- 
> > 2.34.1
> > 
> 
> -- 
> With best wishes
> Dmitry


Thanks,
Yuanje

