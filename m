Return-Path: <linux-arm-msm+bounces-88446-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 57724D10A80
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jan 2026 06:52:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B38893038977
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jan 2026 05:52:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DDDE30F7EF;
	Mon, 12 Jan 2026 05:52:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="T58iTMoW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Xt5PDwmi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0282D30F55E
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 05:51:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768197120; cv=none; b=FMIOJwlwxQmpCcro97lJWq4vuBIr4xfwlMWIc/m0pez5wjuHI3CanqlSYx3Ve2TZBtIv0P7G/k9lFUOD8qjw0GIeUJb5I8QYKOb4dZ2ynFvXXp2zlilQkfQv1VrPovjo3mLueQY2EugidhejP2xuFe05FOnShUX4S9PoafZxfXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768197120; c=relaxed/simple;
	bh=UoG80koWqOmd9TO8UAVJGVWdPHlkYlpo5RzAg1io7hU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QpwJeBepabZ82z8AuwbTma2feJ59R56vtCL8pH4slqUf6cTMp7DPxkEHBWC/icvPjLPax8WlXik44dFPMRF7qMQK7CBDN59jv0eT6fruiEdfjbOaXdFLeTT5A5J5pAKtAiHnaYHyUj7xidtNzd9v8HL0oIDLH7AazMdKAbqbH8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T58iTMoW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Xt5PDwmi; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60BMdmjn3938278
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 05:51:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Td6ocBeHnz0kcfIs1Fr0o+wo
	3hzHfbfDLUrMEyzcrBY=; b=T58iTMoWkjRpa2aSIJqwdm/7/9OP3vMOlwwNJIRS
	+iSPQ/HgJx/tfVEwkGowLd2eHckrTlrKx28cmsDcNcj11RV0nBs80Xw3+1A1mm/P
	GRdRXaGJnvh5hPamxEXtwmyPkxUsPIAZ+vIAgnJ/peaAiZJMMz8SPYt0vVt20Szn
	5Mg8lkcMSt/mm9Vw4RgfD049aRktnD9lberbvNku4bGLfyycuO81TN1XCZfmRJLn
	IXtT07Ip0zoIgdps8mr80VUIc6r+0cBpIyRIZvmtwPmy+lhCrGW/mjE82JMUFkkK
	mq/0gfJxIwytEMk/HDzCE2WFhXvYHVbFbhd7T99KEam6lg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bkeuskpen-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 05:51:57 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-88a25a341ebso147668666d6.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 11 Jan 2026 21:51:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768197117; x=1768801917; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Td6ocBeHnz0kcfIs1Fr0o+wo3hzHfbfDLUrMEyzcrBY=;
        b=Xt5PDwmiulgVWvOmzqALTF4r4nA4uH9po6hbHAxybGt3EfKEM2MmBGrfyqETAWVkeu
         H78D4UE3UiLdNeDkajKnhmHdi1/Qhpytv3e3ask0L5NIPbnist/FR0rln0ny3NOU0Zr+
         k0AI/WqnbQuHTy+fMUxuscFQuZwbpvJkZ8KH/yOwzQ+9a3YZ3k/6e1VD7zsfy7MgXa+2
         qW5KMiPOWlFMPpbLcw9LB/3fw7EcreHsswkLXuoNUfl004GY5kd2e6O88sjygKAgvq74
         OdGZIqlwgN/+/tycXQNdoUpakQO+hpqdalX66Zqh012mDI1F7ANQ9omJor/1bnrR6+bT
         WihQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768197117; x=1768801917;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Td6ocBeHnz0kcfIs1Fr0o+wo3hzHfbfDLUrMEyzcrBY=;
        b=FVw6wwz+Q2Gh/4dpasFIyfvmDCPjaW/OFJs99iyrhI3StLamanDP3toMNd33Vdqqon
         CQvDBEQGNQwtbBa35JOWockvDU2AxHLH7Yl1jgGt2SBVkGBlZWvsW9QGf13oMdWV08AG
         ayxBwvE9Bst53UnoL4S5emWTWgBBASHJn6J2F1KvdcB9NCd/N3D5Pwh/3/S1RklHrFmq
         nDoszbBD34nqJ2d/1Mk8lgrmSQvcCK/S0rHjnHv2Qr1vtozOidiB+rDyere+fTvXwzVS
         upLX/QfHPXYGsdSm+OxYa7eTfV950GSt7vMWTmpyLTuWWZSstikZ/4jB+6VK6zXwcPCw
         OKTg==
X-Forwarded-Encrypted: i=1; AJvYcCVViSZfiBLu8e4Zo7jf38Pcd8lq8d9bum3nFLGzuoeQgagYaMwS02ebQzVDwhEzKXrYZLOaBCRkDGCqf4Bi@vger.kernel.org
X-Gm-Message-State: AOJu0Yztu8W6TynV/FVsN8IUTLpWRvzFnIg+lTjo8xLoY261OiEenq2U
	yBIvBzNEQwIoFcRYRj1a/buslDj9UKC2FwPzocdovyBToERUGn9UF4ZtkdMlyOQxBymT+VffGZQ
	MGIaO0wjqcF7rEHHqodjpexPPpoeFmorb4AWCUvx6xAWTH3H+SvKlQEOyPSuaEbnDnXKH
X-Gm-Gg: AY/fxX69L4IAkYjDTn5TJfTkGRCmiGzlyc37Euo+/tSwM2dqIzutm2Dy62gJc0bTbBT
	8do5YchUfge8cyWEisH/I2pSJWioijjfP+zq3YuTnhSNEeN1e1b9Hsb9Ux8y6CMRoREB8Rv1TbH
	N3ezLlPRRpvQg8CRDUNMEiYWu9FgCuLvWOBpFzyOrNHeJjqq6vE/Gj4M+j3axphj9JgM3yeWhrh
	TotZ3mEsvufU+GcA1jRS4eq4s6lRY9Rr7mBfR5rnEbQkUNFcWoWdLt7+uUMTXsr1adwk8V9+qsh
	mnvB78BsDfW4ZuaOaRjAhqgjjddl0m2dgZkx7O7VBSrmOmNE1h9AgelYCJbI1wminjM8j7VV2aG
	ErA1cK46r50mxjeS/c2Tnxfsu+RhUcxvOA5cfrGEkp6x0QNgremj4gjr+NOWfYsIiHp4dZyo=
X-Received: by 2002:a05:6214:498f:b0:88a:4452:750b with SMTP id 6a1803df08f44-890842d8089mr231498826d6.60.1768197117127;
        Sun, 11 Jan 2026 21:51:57 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFMwmKE+BswERgCS/LJ0lJR4KnAfJVfiurAyj/wNOuhWJpyqEv6OKbBkeQCT6o36SNFMxdxIw==
X-Received: by 2002:a05:6214:498f:b0:88a:4452:750b with SMTP id 6a1803df08f44-890842d8089mr231498566d6.60.1768197116652;
        Sun, 11 Jan 2026 21:51:56 -0800 (PST)
Received: from yuanjiey.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8907725ffc7sm129678696d6.44.2026.01.11.21.51.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Jan 2026 21:51:56 -0800 (PST)
Date: Mon, 12 Jan 2026 13:51:46 +0800
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
Subject: Re: [PATCH v5 10/12] drm/msm/dpu: Add Kaanapali SSPP sub-block
 support
Message-ID: <aWSL8gAJllBMnA5S@yuanjiey.ap.qualcomm.com>
References: <20260108085659.790-1-yuanjie.yang@oss.qualcomm.com>
 <20260108085659.790-11-yuanjie.yang@oss.qualcomm.com>
 <k2orlbxktyqhuuoievurde5vglpbx2qqhkbmnasfnefax6p4tv@7hhmnyomtxyy>
 <aWBpEIHLtmCyZ5C8@yuanjiey.ap.qualcomm.com>
 <wgx4q3f4ktpoyq4u7rrquy7rs66hwidpr7dfxvw74w2xf53toe@kh3qy674des2>
 <aWCXOX+OKvWsqzNM@yuanjiey.ap.qualcomm.com>
 <bqwfbvjq7lmuz6ggrtcsq3hvxrvtfznxrt3l4cjr7lwlzvmtfy@6wtnkgefkpck>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bqwfbvjq7lmuz6ggrtcsq3hvxrvtfznxrt3l4cjr7lwlzvmtfy@6wtnkgefkpck>
X-Proofpoint-ORIG-GUID: Xzz10FOCMovUvjhdaadOLly8BH41XExh
X-Authority-Analysis: v=2.4 cv=GNMF0+NK c=1 sm=1 tr=0 ts=69648bfd cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=kj9zAlcOel0A:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=XksDqd45YQGufXC9n9wA:9
 a=CjuIK1q_8ugA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: Xzz10FOCMovUvjhdaadOLly8BH41XExh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEyMDA0NCBTYWx0ZWRfXz49C9ddCLv+v
 mDhmF//YwOBFf3Fdb8OnfLalQnEAqUBFZjyBo18n3Ov/xeBYzuNhc+8iLJ8mRl81MU1EFI5r6p+
 LRbj5fWP/f0N5qGb9Bpz8iRcfbZKGTwyjSHYXH4DmuTbt0l2T72/p5LbizdigULpXQwGCgb8hMO
 eA2EChg9D54jhW6DVPR19hWWLdbhr+P1Ureead+44ysVrlb5NMeeEnzjfYLj3H9GbdatMtWRgjs
 7h/8GCVb0cy3DL3OyhnxZdfNGj4E33S/serrx3OpxkFnU8G+afLmfT3HrL9HDjpdYRSuhY7vJoz
 acahN1EC0kYqngAI1dCib3NQ4fG2LjJF1DWli4jNpFCzuflcxtotuOuEdWBSR1WVtEp3LL7VNeB
 eFm7mhMWTle+kJCUKMicgjDFGR/byIgBimKal4Us+dvJtzjuxBDmKIG8AZ3Nmzwezx0jP0sRXJB
 7sYErch1adOosRFh8LQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-12_01,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 bulkscore=0 adultscore=0 malwarescore=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601120044

On Sun, Jan 11, 2026 at 04:19:49AM +0200, Dmitry Baryshkov wrote:
> On Fri, Jan 09, 2026 at 01:50:49PM +0800, yuanjiey wrote:
> > On Fri, Jan 09, 2026 at 05:25:26AM +0200, Dmitry Baryshkov wrote:
> > > On Fri, Jan 09, 2026 at 10:33:52AM +0800, yuanjiey wrote:
> > > > On Thu, Jan 08, 2026 at 03:46:18PM +0200, Dmitry Baryshkov wrote:
> > > > > On Thu, Jan 08, 2026 at 04:56:57PM +0800, yuanjie yang wrote:
> > > > > > From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> > > > > > 
> > > > > > Add support for Kaanapali platform SSPP sub-blocks, which
> > > > > > introduce structural changes including register additions,
> > > > > > removals, and relocations. Add the new common and rectangle
> > > > > > blocks, and update register definitions and handling to
> > > > > > ensure compatibility with DPU v13.0.
> > > > > > 
> > > > > > Co-developed-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> > > > > > Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> > > > > > Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> > > > > > ---
> > > > > >  drivers/gpu/drm/msm/Makefile                  |   1 +
> > > > > >  .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |  14 +
> > > > > >  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c   |  14 +-
> > > > > >  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h   |   4 +
> > > > > >  .../gpu/drm/msm/disp/dpu1/dpu_hw_sspp_v13.c   | 321 ++++++++++++++++++
> > > > > >  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c   |  18 +
> > > > > >  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h   |   3 +
> > > > > >  7 files changed, 371 insertions(+), 4 deletions(-)
> > > > > >  create mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp_v13.c
> > > 
> > > >  
> > > > > > +		c->ops.setup_sourceaddress = dpu_hw_sspp_setup_sourceaddress_v13;
> > > > > > +		c->ops.setup_solidfill = dpu_hw_sspp_setup_solidfill_v13;
> > > > > > +		c->ops.setup_pe = dpu_hw_sspp_setup_pe_config_v13;
> > > > > > +
> > > > > 
> > > > > >  /* QOS_QOS_CTRL */
> > > > > >  #define QOS_QOS_CTRL_DANGER_SAFE_EN       BIT(0)
> > > > > >  #define QOS_QOS_CTRL_DANGER_VBLANK_MASK   GENMASK(5, 4)
> > > > > > @@ -475,6 +482,17 @@ void _dpu_hw_setup_qos_lut(struct dpu_hw_blk_reg_map *c, u32 offset,
> > > > > >  		      cfg->danger_safe_en ? QOS_QOS_CTRL_DANGER_SAFE_EN : 0);
> > > > > >  }
> > > > > >  
> > > > > > +void _dpu_hw_setup_qos_lut_v13(struct dpu_hw_blk_reg_map *c,
> > > > > > +			       const struct dpu_hw_qos_cfg *cfg)
> > > > > 
> > > > > Will it be shared with other blocks (DS, WB)?
> > > > 
> > > > yes, _dpu_hw_setup_qos_lut_v13 will be used in WB, in function dpu_hw_wb_setup_qos_lut_v13.
> > > > 
> > > > So maybe I should drop '_' rename _dpu_hw_setup_qos_lut_v13 --> dpu_hw_setup_qos_lut_v13 ?
> > > 
> > > Yes, please. As you are going to resend the series, could you please
> > > also remove the function from the header?
> > 
> > Sure. But here a little confused.
> > 
> > Do you mean I should delete _dpu_hw_setup_qos_lut_v13 in header,
> > Or I should rename _dpu_hw_setup_qos_lut_v13 in header to dpu_hw_setup_qos_lut_v13.
> > 
> > _dpu_hw_setup_qos_lut_v13 is used in dpu_hw_sspp_v13.c and dpu_hw_wb.c, so I don't think
> > it can be removed from header.
> > 
> > Could you please help me clarify this comment?
> 
> Move it to dpu_hw_util.c

Yes, will do move _dpu_hw_setup_qos_lut_v13 definition to dpu_hw_util.c.
 

Thanks,
Yunajie

> > 
> > Thanks,
> > Yuanjie
> >  
> > > -- 
> > > With best wishes
> > > Dmitry
> 
> -- 
> With best wishes
> Dmitry

