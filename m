Return-Path: <linux-arm-msm+bounces-88377-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8757FD0E0A3
	for <lists+linux-arm-msm@lfdr.de>; Sun, 11 Jan 2026 03:19:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 303CF300C6DF
	for <lists+linux-arm-msm@lfdr.de>; Sun, 11 Jan 2026 02:19:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83D6C1A00F0;
	Sun, 11 Jan 2026 02:19:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cdvhRfSN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MUMKiAzS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F14C5477E
	for <linux-arm-msm@vger.kernel.org>; Sun, 11 Jan 2026 02:19:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768097995; cv=none; b=jpOt2f1YyIA9fg/vOqB7jCKDuxNQ/0HeEQJ9DwCz1aDvuv3YQRyCXSSJhd3123enAYOOJcXlrszzexOQ56LZ21q7O6jRD27VWTHa+zlGZl15cgRSQV+TH5alP58NMFYJfZ/23G9jU8Uu4pBA+NbWX4ficRqZmrFw6IYDaeGRHDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768097995; c=relaxed/simple;
	bh=RD8w23eDAmfWwtOK3vME3qAq9BNbryNX6p/DmlRCsqU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oYbsO3RrdGixwuV4iKu1jKKW9G60ts3sNfLHvqgN0oZQ6brVIvFlUpH+Q9ZmHvHSqheByc2W5NKZZcBudbqXEQ5lmhQ4KyMfjNtg88xpyXI1jgPELCe9Nq0jg5T2cSvfEW8eYiluCh/hceq0ZaTtNCsL2Kr/smJtpDsOffMdMRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cdvhRfSN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MUMKiAzS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60B0MI111767802
	for <linux-arm-msm@vger.kernel.org>; Sun, 11 Jan 2026 02:19:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=FIEneGTc12V5ccfuNdx8sn0J
	rZwEPXBUi8elZpJBgEk=; b=cdvhRfSNrZ6CPGPonsLi5NxVUKMYalgseN/x8n3J
	jGsoCglU8/jI1VFlxQf9Zm2/CablXixFz74T8iydUUKeKowa9t3MXcedpEcf8cAg
	CSiCrSqLOULPRahW52omyczIP9tbGqHDl49dDW4lc79ReN1qfPo9Q5SJZA80KMkL
	7LEYQeHhSE+AzOGPvk85GTS0FMl6adMsvQMslECIL9haKlEGo+06kliY6VEhmBK9
	OCJdXEnPymgbV+T1cZXVb5mp3bGxZ6PAQdrp01aMbC2uFDhHFxgh5pbUnD8pjk7D
	2HFYh89WwjvQNPkVWxn0wLQXBEi6BxvCcSCsZyAICbFLyw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bkds59nrg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 11 Jan 2026 02:19:52 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8b19a112b75so1338696285a.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 10 Jan 2026 18:19:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768097992; x=1768702792; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FIEneGTc12V5ccfuNdx8sn0JrZwEPXBUi8elZpJBgEk=;
        b=MUMKiAzSTYZ88YeUGmJJnmQj2SFnW3/767wsJdlvKBjabS8g17IsrKoA7ZdHZLYwVe
         r0NDQfpcpFnr1HivhZCdQymmKRmaPwDmqMAbe+oh07aV0B8XhmLkJziB4sp9TIAzybLo
         kfvvD/SxXpTkesfAwB7vf7jpAbrnFLm3p4WyBucN6TZ1V32II1m9xKina1UzZSG/ZXSU
         7WYc2w7jl6bb0AhnGSspxaYtc7Axtbn/ZWQf1esN0Cl9XjqIP+OxeVZyXnHon3UxpWP+
         IuPt1aYp2NLdyDMr2rHV8mNUELJLqfYf/XoQDn7PgmY0dOO+u8xOD+AVcol+lI4lGjLP
         Vp0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768097992; x=1768702792;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FIEneGTc12V5ccfuNdx8sn0JrZwEPXBUi8elZpJBgEk=;
        b=X0rr1bDcMYHJzUQWbTeNtv3ZoChCyIp3lpLQKid5RvaZnLsj6MVEv/8jHbREfKU0zm
         /dBxw18vPaDZk8sbAOMiAt+cS3ywSxLrSrNk/MNacLVSs2PdcTUeBfzkCL0a//9bxYVw
         B9Q6c4Rmgr/hrr0+tpIQEJUBm2EQU4wH7DTYmVW/Ey232NhI4T/usKNmLd6vj1geu5xm
         dnMFU/1bj/jxVKqP1NH0gsZhgTnd6GXY6OTxSJT9YkFnbEFv7fKuougpoFtrAsDllHWL
         zB4VQj6UnjptZzmrZUsW7OQhKXk6gojndZxOSrsLDUztLplJA4uEi8Kx2KiVPKf5e36r
         siBg==
X-Forwarded-Encrypted: i=1; AJvYcCXpPGaocjdaaUc/LbFzn8afLmw4Wstsvbu+C3QlEukXmH19iPjz0Spl/81B4sncA1LAA4iH8Bsz2EeCD9z1@vger.kernel.org
X-Gm-Message-State: AOJu0YywHrqwZzeTkTrZeU/eo949twWS2+qVrHJYPFv1himagsq3YsOl
	dR9aZu8iaH5YpEMfEn3mqvpysROigFmkaQPBFJraTBD93++3x8lt69ORptd4DfvJZHDjo9Ko492
	93DwJYYQvrzpS7OwNA9vMzShbGEPF+iY839XOAF8cnTkkgh2LcMnAoUpSWt+/SR1VwDMH
X-Gm-Gg: AY/fxX7dUZCbpibhX408PCFqxvBXMjVMdQnNjF39ukvMaRkOSjGGFXwHYhfa0RuGywY
	xNd5A9FRgQnE3d26n41ti9STPO3JY9fUb2vJptemu89Sz7s/Vs2J5D2M1FH4bf0lw94PCmLveIk
	5S19/KOlMgQtxcI/vHBEOWu4cY2jCKbnoC/luQfDNydiJETxinChw3htNMwfSyQfZA0ly8hpvq5
	KAVmARuo2Gdsx15hpc4PPYTD03lHrup1YN/Go01dYIZVvcC2MurHvmhkqmhlH5S1czCItYEeUe5
	uCBSvXQxOXGUM+/iDiDnCuwoFKHR+fHtscqLX2Vhc4brgGetBs2xqI5TY9IDgMnp2JWnAMWu8JM
	6bm3atCUi3Bjh9QP/UTvhWcPHLpy9MgOXaZ8K4MZdsu2DLu+f/bO9wWM5X1maVSThyoVTNp7U+s
	XNQdRTRLl+KDDYnTXKUXZ+Elo=
X-Received: by 2002:a05:620a:29d3:b0:8b1:2fab:30a8 with SMTP id af79cd13be357-8c389431a6amr1979929585a.74.1768097992235;
        Sat, 10 Jan 2026 18:19:52 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHy7eVNr6zSzi0msAWA9F3Q1DRJEXtVz9kZnYvsEZVE86G+Qt0WTx1dTh8p07SiVfnFOk5Q4g==
X-Received: by 2002:a05:620a:29d3:b0:8b1:2fab:30a8 with SMTP id af79cd13be357-8c389431a6amr1979927585a.74.1768097991780;
        Sat, 10 Jan 2026 18:19:51 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59b6b60645asm3331421e87.9.2026.01.10.18.19.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Jan 2026 18:19:51 -0800 (PST)
Date: Sun, 11 Jan 2026 04:19:49 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: yuanjiey <yuanjie.yang@oss.qualcomm.com>
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
Subject: Re: [PATCH v5 10/12] drm/msm/dpu: Add Kaanapali SSPP sub-block
 support
Message-ID: <bqwfbvjq7lmuz6ggrtcsq3hvxrvtfznxrt3l4cjr7lwlzvmtfy@6wtnkgefkpck>
References: <20260108085659.790-1-yuanjie.yang@oss.qualcomm.com>
 <20260108085659.790-11-yuanjie.yang@oss.qualcomm.com>
 <k2orlbxktyqhuuoievurde5vglpbx2qqhkbmnasfnefax6p4tv@7hhmnyomtxyy>
 <aWBpEIHLtmCyZ5C8@yuanjiey.ap.qualcomm.com>
 <wgx4q3f4ktpoyq4u7rrquy7rs66hwidpr7dfxvw74w2xf53toe@kh3qy674des2>
 <aWCXOX+OKvWsqzNM@yuanjiey.ap.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aWCXOX+OKvWsqzNM@yuanjiey.ap.qualcomm.com>
X-Proofpoint-GUID: aLop4d6EYI_0esWrhw6GQ8XATJ6Ziz8o
X-Authority-Analysis: v=2.4 cv=c76mgB9l c=1 sm=1 tr=0 ts=696308c8 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=WoYqaP5JkDdGEjE3MmsA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: aLop4d6EYI_0esWrhw6GQ8XATJ6Ziz8o
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTExMDAxOCBTYWx0ZWRfX+hhdagffgoG2
 OgOwASjyuFhXHNnw5Ozl9jG3VW8pcoiquRsvtps9MdqtwWXI5j+6IHiuZU8Wrtk4EjLsCmXQ5ds
 EKOcYRCDBy4TNoT9BjclXxagjcku/eKXn/8TsWlA3u4wPHbW94STduihUOisQHQJzpgUuPlpcOQ
 Zqgcvb5GoDDx2cuQ3IerEoFtQUvzeYLg+3UeVr8O6D5xP6jk6B4d4wiZpkHrq7coR8ZVaCPYCu2
 WB91H76SkwyoOJUYJ3gNn8muhv/SbsAJpY2i3djJT4V4eZaux+4555q0WQRPXy+MCPbopDhqtFV
 Gk7tTGW7kCFBXrneL8RdVhZVdgVX/9XqJ5BhGb22l7Ax9Ju4S7thvNPB4Rla3O6CMlyJFb7spBj
 NwZB5qx2lkHTVdy4uxkQd2mRMOIFORUSWDCImgMX2r9P0Rks40Q/YpPJtXreQZFHhnEF+A54PMx
 75dE2AcKkIwDb5dF2ow==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-11_01,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 suspectscore=0 bulkscore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 impostorscore=0 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601110018

On Fri, Jan 09, 2026 at 01:50:49PM +0800, yuanjiey wrote:
> On Fri, Jan 09, 2026 at 05:25:26AM +0200, Dmitry Baryshkov wrote:
> > On Fri, Jan 09, 2026 at 10:33:52AM +0800, yuanjiey wrote:
> > > On Thu, Jan 08, 2026 at 03:46:18PM +0200, Dmitry Baryshkov wrote:
> > > > On Thu, Jan 08, 2026 at 04:56:57PM +0800, yuanjie yang wrote:
> > > > > From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> > > > > 
> > > > > Add support for Kaanapali platform SSPP sub-blocks, which
> > > > > introduce structural changes including register additions,
> > > > > removals, and relocations. Add the new common and rectangle
> > > > > blocks, and update register definitions and handling to
> > > > > ensure compatibility with DPU v13.0.
> > > > > 
> > > > > Co-developed-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> > > > > Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> > > > > Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> > > > > ---
> > > > >  drivers/gpu/drm/msm/Makefile                  |   1 +
> > > > >  .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |  14 +
> > > > >  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c   |  14 +-
> > > > >  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h   |   4 +
> > > > >  .../gpu/drm/msm/disp/dpu1/dpu_hw_sspp_v13.c   | 321 ++++++++++++++++++
> > > > >  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c   |  18 +
> > > > >  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h   |   3 +
> > > > >  7 files changed, 371 insertions(+), 4 deletions(-)
> > > > >  create mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp_v13.c
> > 
> > >  
> > > > > +		c->ops.setup_sourceaddress = dpu_hw_sspp_setup_sourceaddress_v13;
> > > > > +		c->ops.setup_solidfill = dpu_hw_sspp_setup_solidfill_v13;
> > > > > +		c->ops.setup_pe = dpu_hw_sspp_setup_pe_config_v13;
> > > > > +
> > > > 
> > > > >  /* QOS_QOS_CTRL */
> > > > >  #define QOS_QOS_CTRL_DANGER_SAFE_EN       BIT(0)
> > > > >  #define QOS_QOS_CTRL_DANGER_VBLANK_MASK   GENMASK(5, 4)
> > > > > @@ -475,6 +482,17 @@ void _dpu_hw_setup_qos_lut(struct dpu_hw_blk_reg_map *c, u32 offset,
> > > > >  		      cfg->danger_safe_en ? QOS_QOS_CTRL_DANGER_SAFE_EN : 0);
> > > > >  }
> > > > >  
> > > > > +void _dpu_hw_setup_qos_lut_v13(struct dpu_hw_blk_reg_map *c,
> > > > > +			       const struct dpu_hw_qos_cfg *cfg)
> > > > 
> > > > Will it be shared with other blocks (DS, WB)?
> > > 
> > > yes, _dpu_hw_setup_qos_lut_v13 will be used in WB, in function dpu_hw_wb_setup_qos_lut_v13.
> > > 
> > > So maybe I should drop '_' rename _dpu_hw_setup_qos_lut_v13 --> dpu_hw_setup_qos_lut_v13 ?
> > 
> > Yes, please. As you are going to resend the series, could you please
> > also remove the function from the header?
> 
> Sure. But here a little confused.
> 
> Do you mean I should delete _dpu_hw_setup_qos_lut_v13 in header,
> Or I should rename _dpu_hw_setup_qos_lut_v13 in header to dpu_hw_setup_qos_lut_v13.
> 
> _dpu_hw_setup_qos_lut_v13 is used in dpu_hw_sspp_v13.c and dpu_hw_wb.c, so I don't think
> it can be removed from header.
> 
> Could you please help me clarify this comment?

Move it to dpu_hw_util.c

> 
> Thanks,
> Yuanjie
>  
> > -- 
> > With best wishes
> > Dmitry

-- 
With best wishes
Dmitry

