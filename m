Return-Path: <linux-arm-msm+bounces-88170-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D7B0AD06FBE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 09 Jan 2026 04:25:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B4404303D6B8
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Jan 2026 03:25:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FEC12727E0;
	Fri,  9 Jan 2026 03:25:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Zf1fM6oc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="e+7AO+pe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2B0714A0BC
	for <linux-arm-msm@vger.kernel.org>; Fri,  9 Jan 2026 03:25:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767929133; cv=none; b=sxwREyUi6ms/NKlg68kS5WSlMaRRkXT49Vqi3qdvPaiQ1eBJaSjn3G+xOpp8e6G6Qpqoo3yEtlDn+TdbOtinkCcwoeH+9NJV0in+41DLGoc0H88Ghp3fWUbe6SAEwPDHvjvh/FtTO/eGsp/jcZJpBKwlrKKG8zWUHd9alNe3Po4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767929133; c=relaxed/simple;
	bh=V/Gh8xSJ/2b2rYVPU2lLtraGRBai0LjTKsvNh/y5EV0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kgRlIRGdHXDHxioILdUImq61pUhjgCu8isw+7F05GJpabiI00Q3XLasmcvkPG3ph8cBsowX5Z0xMuZPz+xLBY5ItUrdPur+bqH4D1lp+gOm3PL/wSxChDnohgtzCPx/x+3wZFAmL6PzpIYEzDz6EogcfCstQmEIssGIeo2pyeMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Zf1fM6oc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=e+7AO+pe; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 608HkAXr2153225
	for <linux-arm-msm@vger.kernel.org>; Fri, 9 Jan 2026 03:25:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=c1FKPH8l16cGJoXn2zSMGvS/
	GHDw+D/u2O8httFkqlA=; b=Zf1fM6ocfch8lu4T30ShlcGytnsHHSpEUg4WJbhU
	07XBEUxk/4JF52i9Y8aonMQNcRzEnfRRuw4WRxQpSXSaSnBTtkcyRIyAuyVIdtcr
	fy22KIqnasQ4zCYZt2v7bDtY+DmOzab4F5tZgumRh+jdl0Q4MeqA/DnYvmVSM5Zg
	WfP+LJrCj4a2r3BsmtfP2i0WTVW0gipVonge2Iac90+Ty/emLIGCAjQw+ZgHq2k/
	Oqb/HMsO2ZHGZ86O5kYhTvLkoPpUY/hJ9nTgF/D/cFAk5K5B3irlCmHNhfdwpdAw
	IEAlt9dzRc+hIA0LLunIy8bnCNTgEbP5Z1mPrM9g8KVGdQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bj3d6c6ae-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 09 Jan 2026 03:25:29 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8bb3388703dso1431887385a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Jan 2026 19:25:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767929129; x=1768533929; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=c1FKPH8l16cGJoXn2zSMGvS/GHDw+D/u2O8httFkqlA=;
        b=e+7AO+pebfODAN6S/A/68Wn/jwaC6uAVhm6V2E/9+Wc6Atqx5pDQhHLCRcUeB4DN10
         V7UZYuiy9+ImPH0mX31EoxpVRqd1F0PIV0aZZrnlrI027i9G0xnN0WNhbOji8vkYU4fS
         Qtj5NDG4EeAcbDRmc8V6TFUDTS+cgn+snh0OXYebrjqWW4C+uoUH68EG0vZlHw5F2Nh/
         tVeDGGJ7cwGjVdBMu4Pdf9Zzx7Lp4fZ+d3zYwybkFYvlhxNsFJLe5Mb6taO694gmyv5n
         6m7YDHldSM2DfiaImoDUm3NWLfHSh4pbnU58u5dOPI7B2EbF+bkaOPXJHl9pL8umZuWK
         Fzgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767929129; x=1768533929;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c1FKPH8l16cGJoXn2zSMGvS/GHDw+D/u2O8httFkqlA=;
        b=H+l94KVNJghBAO4MG2gPLQ6hY6k4AimI+Cm3i4SBkCFy8aORfr+oMc5YavsLGpEJd4
         rqkWxYkoZxwkYY/ELVX8htYrxo6xui6AeHSft7DlUKt12LvYJuOvyEtQUqES4b0JUnrp
         6nwc8zX/BsU2dOl6LYgEr7w8cxArmk9lLmIwhFr2sR6E6alLdhMbxjwdyAgqA6HIxNj1
         iluXKxCZk9NFXnYmOgcRr8p5VhQPs/5R8KJuvh+oOAgBlMes+SgcxA677KS2SiWz5ydD
         Hrxz+yUxAMkLhWXcB4guqW9iVSRJRoRj2oqQ0HIC5fzxDDfNYmUC4Riqk61VDmVLGuJy
         HVew==
X-Forwarded-Encrypted: i=1; AJvYcCX2k/rCSt1mo38Iv5RR3oRSA24QZ0cOKWzx//yA9SufiXKK5/QUaKa4oPwyVAAMO2xVgoDyBwT+KpZ+uGZi@vger.kernel.org
X-Gm-Message-State: AOJu0YyXjFJa2FoiOd6sSCC9msnheycHCo3kWbzYCRNTl/5bLHaJ07ZS
	z39d0fKNWUnTxCa8TnBKYRE0jsE+mRmrNRCtI7zw9eZZgmP/pL67JIPMrVUfiv6reIcjaGrWkbj
	aPUT0xGrspzqSI5IPLg2Gm2EObATTY1lUKVwF302pKBPvzbtWeDolYzKLWoVHKVTPYFn8
X-Gm-Gg: AY/fxX6SPXitMWhRvofdXtvugXJP1q/QcTm/FkkZnCiUtHe69qVICbgRp7Fd8cpnxah
	iEL5gdlUQqpISWgBj1pT8AmYNQRcdLr6IfRCMOSvKMsefIeV8MGB/Om+aoEgUdadxyvY/eTWlIO
	PswlH7PD0HAwV3BaZzfn8WkoFwlOioeoFAHZgDDx7T7CWbQ3a9u+LsyqOXBlKGcH4ITdYZdGkb1
	2d3vWReFHzlGrcJMbVMUJLoZ17LvuQDemFvwji2XgNHs8ejdxKelegS6UbK9Ze5AT1LBwaVdkYV
	DAR7hnlvKnKo1RkT3z5RyEnKvmVbGUryLYDWfO1KRAf9IgMoDDjzS5seei7is7pQ/4rrEjq7Skz
	yHPz2Csu6CVuNwf5zD9J+sLFYhU1TcOud4xSjkFF/Yisltjg4vLv5PW5fM5D7rptSDpHktKaau2
	99vlEDOd4dGmLjSVsks8rDIEg=
X-Received: by 2002:a05:620a:4802:b0:8ab:8037:509c with SMTP id af79cd13be357-8c389379d1cmr1039304785a.12.1767929129056;
        Thu, 08 Jan 2026 19:25:29 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH7POTAZbGqCpGluds596QJkhD/U1qqkBoYNpWwEpul7vXI/0CQ8FgavMG4km/E65OtbPFIdg==
X-Received: by 2002:a05:620a:4802:b0:8ab:8037:509c with SMTP id af79cd13be357-8c389379d1cmr1039301285a.12.1767929128612;
        Thu, 08 Jan 2026 19:25:28 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59b796a135esm783614e87.50.2026.01.08.19.25.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 19:25:27 -0800 (PST)
Date: Fri, 9 Jan 2026 05:25:26 +0200
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
Message-ID: <wgx4q3f4ktpoyq4u7rrquy7rs66hwidpr7dfxvw74w2xf53toe@kh3qy674des2>
References: <20260108085659.790-1-yuanjie.yang@oss.qualcomm.com>
 <20260108085659.790-11-yuanjie.yang@oss.qualcomm.com>
 <k2orlbxktyqhuuoievurde5vglpbx2qqhkbmnasfnefax6p4tv@7hhmnyomtxyy>
 <aWBpEIHLtmCyZ5C8@yuanjiey.ap.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aWBpEIHLtmCyZ5C8@yuanjiey.ap.qualcomm.com>
X-Proofpoint-GUID: zaT-gNVymeqXbOD_3Md3WvIDLXaYBDu2
X-Authority-Analysis: v=2.4 cv=APfYzRIR c=1 sm=1 tr=0 ts=69607529 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=ewj0gPjmfU4c8-7OqbcA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA5MDAyMSBTYWx0ZWRfX+By1KRab1Pia
 kkSsirkcJ2SBoP20OTeIWzzd3bD/AGcoIe4lsCoYEEhChgDBkERMNGrIBeVkLEzO4eX6E9lYzta
 eaLomEWbaMumYPfD9GN0Lgrv27XE4UGwZq1SHUso5OZQlr30FruhDWY+6UPQ1lJGK+ZvmyQMhMz
 MdRJxHjr3Dm4+JvGv6ECIBR6Q6kUD6Djk9WflroR9pXUaIKi4qkMTCHtfCbk8aaSo34pP7fl8j7
 vC0tVnI+8nHSYNYoG0WsDSOdYJIfR/xFpysEAlUraFT/8wiZiAol1/JmPJyI/n2AKtrDC6ZJpOI
 gerdsyP9LCsFW4HIYI8wKWeYeB+PJAjDdmrlb9k+r8qXOrz+Rn9ObQ8KYi7WubSTu+ofyf0qiou
 w6BUNosxDvXg9zvS5wgUrs279ocmj1SLAv2eGEnrl1rTjacriESg4ozNdhUXHHYLMqJdAe3ASuG
 GjLCpSiH2kCQ9GIAOcg==
X-Proofpoint-ORIG-GUID: zaT-gNVymeqXbOD_3Md3WvIDLXaYBDu2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-09_01,2026-01-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0
 suspectscore=0 bulkscore=0 clxscore=1015 adultscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601090021

On Fri, Jan 09, 2026 at 10:33:52AM +0800, yuanjiey wrote:
> On Thu, Jan 08, 2026 at 03:46:18PM +0200, Dmitry Baryshkov wrote:
> > On Thu, Jan 08, 2026 at 04:56:57PM +0800, yuanjie yang wrote:
> > > From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> > > 
> > > Add support for Kaanapali platform SSPP sub-blocks, which
> > > introduce structural changes including register additions,
> > > removals, and relocations. Add the new common and rectangle
> > > blocks, and update register definitions and handling to
> > > ensure compatibility with DPU v13.0.
> > > 
> > > Co-developed-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> > > Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> > > Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> > > ---
> > >  drivers/gpu/drm/msm/Makefile                  |   1 +
> > >  .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |  14 +
> > >  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c   |  14 +-
> > >  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h   |   4 +
> > >  .../gpu/drm/msm/disp/dpu1/dpu_hw_sspp_v13.c   | 321 ++++++++++++++++++
> > >  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c   |  18 +
> > >  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h   |   3 +
> > >  7 files changed, 371 insertions(+), 4 deletions(-)
> > >  create mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp_v13.c

>  
> > > +		c->ops.setup_sourceaddress = dpu_hw_sspp_setup_sourceaddress_v13;
> > > +		c->ops.setup_solidfill = dpu_hw_sspp_setup_solidfill_v13;
> > > +		c->ops.setup_pe = dpu_hw_sspp_setup_pe_config_v13;
> > > +
> > 
> > >  /* QOS_QOS_CTRL */
> > >  #define QOS_QOS_CTRL_DANGER_SAFE_EN       BIT(0)
> > >  #define QOS_QOS_CTRL_DANGER_VBLANK_MASK   GENMASK(5, 4)
> > > @@ -475,6 +482,17 @@ void _dpu_hw_setup_qos_lut(struct dpu_hw_blk_reg_map *c, u32 offset,
> > >  		      cfg->danger_safe_en ? QOS_QOS_CTRL_DANGER_SAFE_EN : 0);
> > >  }
> > >  
> > > +void _dpu_hw_setup_qos_lut_v13(struct dpu_hw_blk_reg_map *c,
> > > +			       const struct dpu_hw_qos_cfg *cfg)
> > 
> > Will it be shared with other blocks (DS, WB)?
> 
> yes, _dpu_hw_setup_qos_lut_v13 will be used in WB, in function dpu_hw_wb_setup_qos_lut_v13.
> 
> So maybe I should drop '_' rename _dpu_hw_setup_qos_lut_v13 --> dpu_hw_setup_qos_lut_v13 ?

Yes, please. As you are going to resend the series, could you please
also remove the function from the header?

-- 
With best wishes
Dmitry

