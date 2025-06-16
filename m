Return-Path: <linux-arm-msm+bounces-61439-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C241EADB0B8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Jun 2025 14:57:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C0CB918863BA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Jun 2025 12:57:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 049BE285CBC;
	Mon, 16 Jun 2025 12:57:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YXPRdIMV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAEE5292B33
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Jun 2025 12:57:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750078625; cv=none; b=fknjgr0iQ0sI8CdQJ/s7FiH+kNBJvFieHiIzWVkIsE+dqbHgET8fJko9ZyWEN8kXH+aoJHAVdbeJyi0drVwfYK7NIkNA120jvBSVoUBcYMDSTJQAPKFJJSa2eRJSJFwTjnI03zv6vf/Be0mfeLnd/sfdVEfLEfMZ1Q6wJBUlVVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750078625; c=relaxed/simple;
	bh=t1GQ7nqgQkownLdDYTm4/UkPZbcPEuHCVThj226KQio=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EOIPHvKt196uvPI9lADli5Dq64+mzFXKcDwbdCZ5DSZoqVqw1tJLUeCyDvLaobwLwoKmH/tuITdukaWFD9eJyb+mGsWLIe+mCe8X3QNJKH10lO570J3JPC91KWy+vFIuIgj/Efo626sQZlO9/eDH8e2w/tbDyMtinRolwZKqkbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YXPRdIMV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55G8uL0E028921
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Jun 2025 12:57:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FKwuipyWGCLDYFoJ13lyjhPxeC6AD0OBZeTREMsaE+U=; b=YXPRdIMVItIvJ2Cc
	a0Sswp89CATcrYblwWTMMKqRvXveuCCoXbBDXXh4PIVgdOEUHvr69G/h0b2s2UIa
	scEYeIsg+dZuuOlx88joNSLmY615F09ZYPRiA9RewHr+RBfHBzdiYuEfm5/D1ogl
	d5/vqsXcDJYXoJi/JApAnjQLBss+HT7qebwi69NJrsX32x8Du8Ss4LvNgwp38OHi
	O9eecutKxY8ApTSnZLUbQsAPL5MjomulT0tN1kPQZAx7+WLFKX3Xn0rRu1cnrHbI
	lJnBmmuX0oDsXIIgH6iokhPNkwnH1kFdap3z7kqS7WmaGATavAJ/i0kdALmjtTZC
	epRPRQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47928mcg1x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Jun 2025 12:57:03 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7d097fd7b32so1159928685a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Jun 2025 05:57:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750078622; x=1750683422;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FKwuipyWGCLDYFoJ13lyjhPxeC6AD0OBZeTREMsaE+U=;
        b=bhsi7ewVYAhXrNZFKg/+4/aarTYKnm7G28F1TOuaObuD1+QJtQ5rbVZK/kzloMedbG
         1yQmuSxIytBq+SOxuFjwog59rG+A9OZxXd0zMWz8+0UxcQdhcpD5uF7mKF8BS2vzwweN
         niKOIKWhTCmY2epBuAKfABiqHRST0CWA9a+CDMCHor9DOfpFmMCAOJd0b8dC1vHu+sRO
         wpzI56aMt8QZMX1ofUjFM/irAZVZU1BYvjCiPIFkRNPe49nW3SF9l3ZP5Ju4Fk/oKjBr
         lweaGp0+9djnt3aITJMi4356+2QqJYl+Mma7YPYVV7YkIIYEcS0ixyzhxv2217RcYxcV
         wlMw==
X-Forwarded-Encrypted: i=1; AJvYcCWHaiSVu8926zDyybSQU9mhzwr11h709TsInErI9WWknjT7ouyH0dCtypLzDe8MfsPkXibiuF94ekEY1ZkP@vger.kernel.org
X-Gm-Message-State: AOJu0YxSvk3pNPtFobvVQDqVpHerx+NYnEPuuDhOfAsllodDIQIvXG8I
	3zs1TKHAF0XbTL7iAfOL0wy1XeCEaQHmENbkQjRLYXbCMwKQu52u+mv9vuI5EDLKUtIPS5Kw1yV
	8JOEp+hfYRfF9PP2lz9kpzX/2qoChreFVTIgMKmOvxLL4CvaENbOaIwSbw+aGMUMAEDEx
X-Gm-Gg: ASbGnctDWHx+Bw8on9+qSE3I+YaSroejmQZ0hG8dGtW7VyCq49CI+N4AZMD/Jj96EPQ
	uyam4Yy/jrS/HATXRbiQ1zM8ewsKdPQv78jB5sbhp2eiWu+9+ffC1O6+OlTPO8ZxPYImtjbw8/q
	PVKJ0FEXpKsMN//E0MmkYqviZrKG9rXaDOnCPLMHHwvT0F6XVgcWHCM+8ikskjmnrEybd65d8zK
	GaBurtJYF12gq6dwMWG33boE0GePjZq/TVxz0xlLlSnqeBvP1iGPo/+1ZiK1TYAK4bKNoFw9Jmx
	GlCI32tiZx/ycYafWBBlAfPANWQflQYUOFH6CP4qEs4EEKjmWH0xBb/B0Q==
X-Received: by 2002:a05:620a:1a0d:b0:7ce:bd97:f879 with SMTP id af79cd13be357-7d3c6c1ab7emr1453849885a.19.1750078621336;
        Mon, 16 Jun 2025 05:57:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFFYPS0k/+7wc+2m2vG7o++m5m5Sp5cpWuM8q65kOaO8pwx5kzXP7v29Fo1lQWXH5INkeOc9w==
X-Received: by 2002:a05:620a:1a0d:b0:7ce:bd97:f879 with SMTP id af79cd13be357-7d3c6c1ab7emr1453844285a.19.1750078620710;
        Mon, 16 Jun 2025 05:57:00 -0700 (PDT)
Received: from trex (132.red-79-144-190.dynamicip.rima-tde.net. [79.144.190.132])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568b70d77sm11147736f8f.94.2025.06.16.05.56.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 05:57:00 -0700 (PDT)
From: Jorge Ramirez <jorge.ramirez@oss.qualcomm.com>
X-Google-Original-From: Jorge Ramirez <JorgeRamirez-Ortiz>
Date: Mon, 16 Jun 2025 14:56:58 +0200
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Jorge Ramirez <jorge.ramirez@oss.qualcomm.com>, quic_vgarodia@quicinc.com,
        quic_dikshita@quicinc.com, mchehab@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, stanimir.varbanov@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/5] media: venus: vdec: ar50_lite video core support
Message-ID: <aFAUmnQGhuVFubBN@trex>
References: <20250613140402.3619465-1-jorge.ramirez@oss.qualcomm.com>
 <20250613140402.3619465-4-jorge.ramirez@oss.qualcomm.com>
 <c8c31c62-ffb8-4b15-b3f1-6ecfec7a7c1a@linaro.org>
 <aE6wu8iKsLcMA/Ny@trex>
 <a538052a-fc4e-496b-ae71-033ff8d87204@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a538052a-fc4e-496b-ae71-033ff8d87204@linaro.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE2MDA4MSBTYWx0ZWRfXxsTi3axBUNXz
 Sx6lZ+CFYVFrMepE5s6y5Zd0fsf76PQyEHIDXPDSb2HowAOZ7w/+x8/1NcX4FV2d+/zlJCuT+Ie
 OeZPFRQ8loyXSBnmvJrOVow8qUWPFpdc2LOc7zPh9L431XK11kHDhugL+yyFvwEfZ+1oMScHREC
 rmGS86WG12K/yDuRK9NakkRwag3VOXt/r0/PESZKsA7Acob8T1noA+hVjntWRWDSdgi4qw/+LJp
 BfiWjrFvUCFd36Zfm3MGfFt/JZ5rkZ3UrpUeaIDxEV4GnbVukW/aFKFWL6DQmxVUnBDoRnr/3yC
 ABzpVOh9aUwh0BrCRtmdz+FlE5Q17zS/pdfttuyPlQSVEnrVPQ+VkbIN9MBP5Ezu8JUZ8j9gAR7
 vl45VABspeaKdw1tYciw7bxHNzyhplTcDeuXTVkYxwYppNwLveRNo+iiU7/TlCV6cVg1vTDf
X-Authority-Analysis: v=2.4 cv=fvbcZE4f c=1 sm=1 tr=0 ts=6850149f cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=wjE3nLva0YkvARyJ+Gfmxg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=0RC5y-S3vamAmSp5PK4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: I5T35U5tHWSnLWxK4VtsSyTIE7xBuYhp
X-Proofpoint-ORIG-GUID: I5T35U5tHWSnLWxK4VtsSyTIE7xBuYhp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-16_05,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 mlxlogscore=999 phishscore=0 clxscore=1015 mlxscore=0 impostorscore=0
 adultscore=0 spamscore=0 suspectscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506160081

On 16/06/25 09:13:08, Bryan O'Donoghue wrote:
> On 15/06/2025 12:38, Jorge Ramirez wrote:
> > On 13/06/25 15:18:02, Bryan O'Donoghue wrote:
> > > On 13/06/2025 15:04, Jorge Ramirez-Ortiz wrote:
> > > > The AR50_LITE is a streamlined variant of the AR50 video core, designed
> > > > for power and cost-efficient platforms.
> > > > 
> > > > It supports hardware-accelerated decoding of H.264, HEVC, and VP9
> > > > formats.
> > > > 
> > > > Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
> > > > ---
> > > >    drivers/media/platform/qcom/venus/core.c      | 11 ++-
> > > >    drivers/media/platform/qcom/venus/core.h      |  5 +-
> > > >    drivers/media/platform/qcom/venus/firmware.c  |  8 +-
> > > >    drivers/media/platform/qcom/venus/helpers.c   | 81 +++++++++++++++++++
> > > >    drivers/media/platform/qcom/venus/helpers.h   |  2 +
> > > >    .../media/platform/qcom/venus/hfi_helper.h    | 10 ++-
> > > >    drivers/media/platform/qcom/venus/hfi_venus.c | 14 ++--
> > > >    .../media/platform/qcom/venus/pm_helpers.c    |  1 +
> > > >    drivers/media/platform/qcom/venus/vdec.c      | 15 ++--
> > > >    9 files changed, 123 insertions(+), 24 deletions(-)
> > > > 
> > > > diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
> > > > index d305d74bb152..736ef53d988d 100644
> > > > --- a/drivers/media/platform/qcom/venus/core.c
> > > > +++ b/drivers/media/platform/qcom/venus/core.c
> > > > @@ -254,14 +254,19 @@ static int venus_enumerate_codecs(struct venus_core *core, u32 type)
> > > >    static void venus_assign_register_offsets(struct venus_core *core)
> > > >    {
> > > > -	if (IS_IRIS2(core) || IS_IRIS2_1(core)) {
> > > > -		core->vbif_base = core->base + VBIF_BASE;
> > > > +	if (IS_IRIS2(core) || IS_IRIS2_1(core) || IS_AR50_LITE(core)) {
> > > 
> > > Is there a property that IS_IRIS_2_1 || IS_AR50_LITE that we could use
> > > instead of expanding this IS_THING list ?
> > 
> > I know what you mean but I think looking for possible comonalities
> > between cores will just make the partitioning more obscure.
> > 
> > we could perhaps define a different type of macro ie, something like
> > IS_CORE(core, IRIS2, IRIS2_1, AR50_LITE) ? shall I go ahead with this
> > type of macro instead?
> 
> It feels like a nit-picky point to be making but, I'm just thinking about
> adding another say two or three SoCs that need this conditional.
> 
> In that case this statement would start to look long and ungainley. It would
> be nice to come up with some common conditional for it.

what about

#define IS_VPU_MATCH(core, type)	IS_##type(core)
#define IS_VERSION_MATCH(core, type)	IS_##type(core)

#define MATCH_1(CMD, core, a) \
	IS_##CMD##_MATCH(core, a)
#define MATCH_2(CMD, core, a, b) \
	(IS_##CMD##_MATCH(core, a) || IS_##CMD##_MATCH(core, b))
#define MATCH_3(CMD, core, a, b, c) \
	(IS_##CMD##_MATCH(core, a) || IS_##CMD##_MATCH(core, b) || \
	IS_##CMD##_MATCH(core, c))
#define MATCH_4(CMD, core, a, b, c, d) \
	(IS_##CMD##_MATCH(core, a) || IS_##CMD##_MATCH(core, b) || \
	IS_##CMD##_MATCH(core, c) || IS_##CMD##_MATCH(core, d))
#define GET_MACRO(_1, _2, _3, _4, NAME, ...) NAME

#define IS_DISPATCH(CMD, core, ...) \
	GET_MACRO(__VA_ARGS__, MATCH_4, MATCH_3, MATCH_2, MATCH_1)\
	(CMD, core, __VA_ARGS__)

#define IS_VPU(core, ...)	IS_DISPATCH(VPU, core, __VA_ARGS__)
#define IS_HFI(core, ...)	IS_DISPATCH(VERSION, core, __VA_ARGS__)

then when there are three or more conditions (not much point for less
than 3 IMO)  we can just have
 if (IS_VPU(core, AR50_LITE, IRIS_2, IRIS_2_1))

would be the same for IS_HFI(core, V3, V4, V6)..

shall I post this as a separate patch and then just use it?

> 
> > > 
> > > 
> > > >    		core->cpu_base = core->base + CPU_BASE_V6;
> > > >    		core->cpu_cs_base = core->base + CPU_CS_BASE_V6;
> > > >    		core->cpu_ic_base = core->base + CPU_IC_BASE_V6;
> > > >    		core->wrapper_base = core->base + WRAPPER_BASE_V6;
> > > >    		core->wrapper_tz_base = core->base + WRAPPER_TZ_BASE_V6;
> > > > -		core->aon_base = core->base + AON_BASE_V6;
> > > > +		if (IS_AR50_LITE(core)) {
> > > > +			core->vbif_base = NULL;
> > > > +			core->aon_base = NULL;
> > > > +		} else {
> > > > +			core->vbif_base = core->base + VBIF_BASE;
> > > > +			core->aon_base = core->base + AON_BASE_V6;
> > > > +		}
> > > >    	} else {
> > > >    		core->vbif_base = core->base + VBIF_BASE;
> > > >    		core->cpu_base = core->base + CPU_BASE;
> > > > diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
> > > > index b412e0c5515a..122441f9600a 100644
> > > > --- a/drivers/media/platform/qcom/venus/core.h
> > > > +++ b/drivers/media/platform/qcom/venus/core.h
> > > > @@ -382,6 +382,7 @@ enum venus_inst_modes {
> > > >     * @lock:	instance lock
> > > >     * @core:	a reference to the core struct
> > > >     * @clk_data:	clock data per core ID
> > > > + * @eosbufs:	a lit of EOS buffers
> > > >     * @dpbbufs:	a list of decoded picture buffers
> > > >     * @internalbufs:	a list of internal bufferes
> > > >     * @registeredbufs:	a list of registered capture bufferes
> > > > @@ -450,6 +451,7 @@ struct venus_inst {
> > > >    	struct mutex lock;
> > > >    	struct venus_core *core;
> > > >    	struct clock_data clk_data;
> > > > +	struct list_head eosbufs;
> > > >    	struct list_head dpbbufs;
> > > >    	struct list_head internalbufs;
> > > >    	struct list_head registeredbufs;
> > > > @@ -520,7 +522,8 @@ struct venus_inst {
> > > >    #define IS_V1(core)	((core)->res->hfi_version == HFI_VERSION_1XX)
> > > >    #define IS_V3(core)	((core)->res->hfi_version == HFI_VERSION_3XX)
> > > >    #define IS_V4(core)	((core)->res->hfi_version == HFI_VERSION_4XX)
> > > > -#define IS_V6(core)	((core)->res->hfi_version == HFI_VERSION_6XX)
> > > > +#define IS_V6(core)     (((core)->res->hfi_version == HFI_VERSION_6XX) || \
> > > > +			 ((core)->res->hfi_version == HFI_VERSION_6XX_LITE))
> > > >    #define IS_AR50(core)		((core)->res->vpu_version == VPU_VERSION_AR50)
> > > >    #define IS_AR50_LITE(core)	((core)->res->vpu_version == VPU_VERSION_AR50_LITE)
> > > > diff --git a/drivers/media/platform/qcom/venus/firmware.c b/drivers/media/platform/qcom/venus/firmware.c
> > > > index 66a18830e66d..f8dcef0426ac 100644
> > > > --- a/drivers/media/platform/qcom/venus/firmware.c
> > > > +++ b/drivers/media/platform/qcom/venus/firmware.c
> > > > @@ -30,7 +30,7 @@ static void venus_reset_cpu(struct venus_core *core)
> > > >    	u32 fw_size = core->fw.mapped_mem_size;
> > > >    	void __iomem *wrapper_base;
> > > > -	if (IS_IRIS2_1(core))
> > > > +	if (IS_IRIS2_1(core) || IS_AR50_LITE(core))
> > > 
> > > For example here.
> > > 
> > > >    		wrapper_base = core->wrapper_tz_base;
> > > >    	else
> > > >    		wrapper_base = core->wrapper_base;
> > > > @@ -42,7 +42,7 @@ static void venus_reset_cpu(struct venus_core *core)
> > > >    	writel(fw_size, wrapper_base + WRAPPER_NONPIX_START_ADDR);
> > > >    	writel(fw_size, wrapper_base + WRAPPER_NONPIX_END_ADDR);
> > > > -	if (IS_IRIS2_1(core)) {
> > > > +	if (IS_IRIS2_1(core) || IS_AR50_LITE(core)) {
> > > >    		/* Bring XTSS out of reset */
> > > >    		writel(0, wrapper_base + WRAPPER_TZ_XTSS_SW_RESET);
> > > >    	} else {
> > > > @@ -68,7 +68,7 @@ int venus_set_hw_state(struct venus_core *core, bool resume)
> > > >    	if (resume) {
> > > >    		venus_reset_cpu(core);
> > > >    	} else {
> > > > -		if (IS_IRIS2_1(core))
> > > > +		if (IS_IRIS2_1(core) || IS_AR50_LITE(core))
> > > >    			writel(WRAPPER_XTSS_SW_RESET_BIT,
> > > >    			       core->wrapper_tz_base + WRAPPER_TZ_XTSS_SW_RESET);
> > > >    		else
> > > > @@ -181,7 +181,7 @@ static int venus_shutdown_no_tz(struct venus_core *core)
> > > >    	void __iomem *wrapper_base = core->wrapper_base;
> > > >    	void __iomem *wrapper_tz_base = core->wrapper_tz_base;
> > > > -	if (IS_IRIS2_1(core)) {
> > > > +	if (IS_IRIS2_1(core) || IS_AR50_LITE(core)) {
> > > >    		/* Assert the reset to XTSS */
> > > >    		reg = readl(wrapper_tz_base + WRAPPER_TZ_XTSS_SW_RESET);
> > > >    		reg |= WRAPPER_XTSS_SW_RESET_BIT;
> > > > diff --git a/drivers/media/platform/qcom/venus/helpers.c b/drivers/media/platform/qcom/venus/helpers.c
> > > > index 8295542e1a7c..ae89369c6a07 100644
> > > > --- a/drivers/media/platform/qcom/venus/helpers.c
> > > > +++ b/drivers/media/platform/qcom/venus/helpers.c
> > > > @@ -230,6 +230,80 @@ int venus_helper_alloc_dpb_bufs(struct venus_inst *inst)
> > > >    }
> > > >    EXPORT_SYMBOL_GPL(venus_helper_alloc_dpb_bufs);
> > > > +static void free_eos_buf(struct venus_inst *inst, struct intbuf *buf)
> > > > +{
> > > > +	list_del_init(&buf->list);
> > > > +	dma_free_attrs(inst->core->dev, buf->size, buf->va, buf->da,
> > > > +		       buf->attrs);
> > > > +	kfree(buf);
> > > > +}
> > > > +
> > > > +int venus_helper_free_eos_bufs(struct venus_inst *inst)
> > > > +{
> > > > +	struct intbuf *buf, *n;
> > > > +
> > > > +	list_for_each_entry_safe(buf, n, &inst->eosbufs, list) {
> > > > +		free_eos_buf(inst, buf);
> > > > +	}
> > > > +
> > > > +	if (list_empty(&inst->eosbufs))
> > > > +		INIT_LIST_HEAD(&inst->eosbufs);
> > > > +
> > > > +	return 0;
> > > > +
> > > > +}
> > > > +EXPORT_SYMBOL_GPL(venus_helper_free_eos_bufs);
> > > 
> > > These EOS buf things look like they are not specific to ar50, could you add
> > > these in a preceding patch to this ?
> > 
> > um, previous cores seemed to tolerate passing empty pointers to the VPU
> > firmware without issue. Unfortunately, with the AR50_LITE, this results
> > in segmentation faults in the _firmware_. The purpose of this function is
> > to add support for AR50_LITE while preserving the existing behaviour for
> > other cores...introducing a  dedicated function felt cleaner than
> > further complicating the existing conditional.
> > Given that the previous conditional was just an if/else I don’t really
> > see a lot of benefit in refactoring the earlier conditionals _before_
> > adding the AR50_LITE logic. Would you be OK if we keep it as proposed?
> 
> ok
> 
> > 
> > > 
> > > > +
> > > > +int venus_helper_alloc_eos_buf(struct venus_inst *inst,
> > > > +			       struct hfi_frame_data *data)
> > > > +{
> > > > +	struct venus_core *core = inst->core;
> > > > +	struct device *dev = core->dev;
> > > > +	struct intbuf *buf;
> > > > +	int ret = 0;
> > > > +
> > > > +	memset(data, 0, sizeof(*data));
> > > > +
> > > > +	data->buffer_type = HFI_BUFFER_INPUT;
> > > > +	data->flags = HFI_BUFFERFLAG_EOS;
> > > > +
> > > > +	if (IS_AR50_LITE(inst->core)) {
> > > > +		/* We must send valid sizes and addresses */
> > > > +		buf = kzalloc(sizeof(*buf), GFP_KERNEL);
> > > > +		if (!buf) {
> > > > +			ret = -ENOMEM;
> > > > +			goto fail;
> > > > +		}
> > > > +
> > > > +		buf->type = HFI_BUFFER_INPUT;
> > > > +		buf->size = SZ_4K;
> > > > +		buf->attrs = DMA_ATTR_NO_KERNEL_MAPPING;
> > > > +		buf->va = dma_alloc_attrs(dev, buf->size, &buf->da, GFP_KERNEL,
> > > > +					  buf->attrs);
> > > > +		if (!buf->va) {
> > > > +			ret = -ENOMEM;
> > > > +			goto fail;
> > > > +		}
> > > > +
> > > > +		list_add_tail(&buf->list, &inst->eosbufs);
> > > > +
> > > > +		data->alloc_len = buf->size;
> > > > +		data->device_addr = buf->da;
> > > > +
> > > > +	} else if (IS_V6(inst->core) &&
> > > > +		   is_fw_rev_or_older(inst->core, 1, 0, 87)) {
> > > > +		data->device_addr = 0;
> > > > +	} else {
> > > > +		data->device_addr = 0xdeadb000;
> > > > +	}
> > > > +
> > > > +	return 0;
> > > > +fail:
> > > > +	kfree(buf);
> > > > +	return ret;
> > > > +}
> > > > +EXPORT_SYMBOL_GPL(venus_helper_alloc_eos_buf);
> > > 
> > > I think the series would be nicer if the EOS buf decomposition stuff went
> > > into a patch that preceded this one, and then you add the IS_AR50_LITE() in
> > > the next patch progressively.
> > 
> > see above
> > 
> > > 
> > > > +
> > > >    static int intbufs_set_buffer(struct venus_inst *inst, u32 type)
> > > >    {
> > > >    	struct venus_core *core = inst->core;
> > > > @@ -630,6 +704,13 @@ static int platform_get_bufreq(struct venus_inst *inst, u32 buftype,
> > > >    	if (!hfi_plat || !hfi_plat->bufreq)
> > > >    		return -EINVAL;
> > > > +	/* Firmware buffer requirements for internal buffers only */
> > > > +	if (IS_AR50_LITE(inst->core))
> > > > +		if ((buftype != HFI_BUFFER_INPUT) &&
> > > > +		    (buftype != HFI_BUFFER_OUTPUT) &&
> > > > +		    (buftype != HFI_BUFFER_OUTPUT2))
> > > > +			return -EINVAL;
> > > > +
> > > >    	params.version = version;
> > > >    	params.num_vpp_pipes = inst->core->res->num_vpp_pipes;
> > > > diff --git a/drivers/media/platform/qcom/venus/helpers.h b/drivers/media/platform/qcom/venus/helpers.h
> > > > index 358e4f39c9c0..bf55fe3b8747 100644
> > > > --- a/drivers/media/platform/qcom/venus/helpers.h
> > > > +++ b/drivers/media/platform/qcom/venus/helpers.h
> > > > @@ -58,6 +58,8 @@ int venus_helper_get_out_fmts(struct venus_inst *inst, u32 fmt, u32 *out_fmt,
> > > >    bool venus_helper_check_format(struct venus_inst *inst, u32 v4l2_pixfmt);
> > > >    int venus_helper_alloc_dpb_bufs(struct venus_inst *inst);
> > > >    int venus_helper_free_dpb_bufs(struct venus_inst *inst);
> > > > +int venus_helper_alloc_eos_buf(struct venus_inst *inst, struct hfi_frame_data *data);
> > > > +int venus_helper_free_eos_bufs(struct venus_inst *inst);
> > > >    int venus_helper_intbufs_alloc(struct venus_inst *inst);
> > > >    int venus_helper_intbufs_free(struct venus_inst *inst);
> > > >    int venus_helper_intbufs_realloc(struct venus_inst *inst);
> > > > diff --git a/drivers/media/platform/qcom/venus/hfi_helper.h b/drivers/media/platform/qcom/venus/hfi_helper.h
> > > > index f44059f19505..128ddf8e3cd5 100644
> > > > --- a/drivers/media/platform/qcom/venus/hfi_helper.h
> > > > +++ b/drivers/media/platform/qcom/venus/hfi_helper.h
> > > > @@ -397,13 +397,16 @@
> > > >    #define HFI_BUFFER_INTERNAL_PERSIST_1		0x5
> > > >    #define HFI_BUFFER_INTERNAL_SCRATCH(ver)	\
> > > >    	(((ver) == HFI_VERSION_4XX ||		\
> > > > -	(ver) == HFI_VERSION_6XX) ? 0x6 : 0x1000001)
> > > > +	(ver) == HFI_VERSION_6XX || (ver) == HFI_VERSION_6XX_LITE) \
> > > > +	? 0x6 : 0x1000001)
> > > >    #define HFI_BUFFER_INTERNAL_SCRATCH_1(ver)	\
> > > >    	(((ver) == HFI_VERSION_4XX ||		\
> > > > -	(ver) == HFI_VERSION_6XX) ? 0x7 : 0x1000005)
> > > > +	(ver) == HFI_VERSION_6XX || (ver) == HFI_VERSION_6XX_LITE) \
> > > > +	? 0x7 : 0x1000005)
> > > >    #define HFI_BUFFER_INTERNAL_SCRATCH_2(ver)	\
> > > >    	(((ver) == HFI_VERSION_4XX ||		\
> > > > -	(ver) == HFI_VERSION_6XX) ? 0x8 : 0x1000006)
> > > > +	(ver) == HFI_VERSION_6XX || (ver) == HFI_VERSION_6XX_LITE) \
> > > > +	? 0x8 : 0x1000006)
> > > >    #define HFI_BUFFER_EXTRADATA_INPUT(ver)		\
> > > >    	(((ver) == HFI_VERSION_4XX) ? 0xc : 0x1000002)
> > > >    #define HFI_BUFFER_EXTRADATA_OUTPUT(ver)	\
> > > > @@ -561,6 +564,7 @@ enum hfi_version {
> > > >    	HFI_VERSION_3XX,
> > > >    	HFI_VERSION_4XX,
> > > >    	HFI_VERSION_6XX,
> > > > +	HFI_VERSION_6XX_LITE,
> > > >    };
> > > >    struct hfi_buffer_info {
> > > > diff --git a/drivers/media/platform/qcom/venus/hfi_venus.c b/drivers/media/platform/qcom/venus/hfi_venus.c
> > > > index b5f2ea879950..302776bf8fe6 100644
> > > > --- a/drivers/media/platform/qcom/venus/hfi_venus.c
> > > > +++ b/drivers/media/platform/qcom/venus/hfi_venus.c
> > > > @@ -497,7 +497,7 @@ static int venus_boot_core(struct venus_hfi_device *hdev)
> > > >    	if (count >= max_tries)
> > > >    		ret = -ETIMEDOUT;
> > > > -	if (IS_IRIS2(hdev->core) || IS_IRIS2_1(hdev->core)) {
> > > > +	if (IS_IRIS2(hdev->core) || IS_IRIS2_1(hdev->core) || IS_AR50_LITE(hdev->core)) {
> > > >    		writel(0x1, cpu_cs_base + CPU_CS_H2XSOFTINTEN_V6);
> > > >    		writel(0x0, cpu_cs_base + CPU_CS_X2RPMH_V6);
> > > >    	}
> > > > @@ -565,6 +565,9 @@ static int venus_halt_axi(struct venus_hfi_device *hdev)
> > > >    	u32 mask_val;
> > > >    	int ret;
> > > > +	if (IS_AR50_LITE(hdev->core))
> > > > +		return 0;
> > > > +
> > > >    	if (IS_IRIS2(hdev->core) || IS_IRIS2_1(hdev->core)) {
> > > >    		writel(0x3, cpu_cs_base + CPU_CS_X2RPMH_V6);
> > > > @@ -1134,7 +1137,8 @@ static irqreturn_t venus_isr(struct venus_core *core)
> > > >    	wrapper_base = hdev->core->wrapper_base;
> > > >    	status = readl(wrapper_base + WRAPPER_INTR_STATUS);
> > > > -	if (IS_IRIS2(core) || IS_IRIS2_1(core)) {
> > > > +
> > > > +	if (IS_IRIS2(core) || IS_IRIS2_1(core) || IS_AR50_LITE(core)) {
> > > >    		if (status & WRAPPER_INTR_STATUS_A2H_MASK ||
> > > >    		    status & WRAPPER_INTR_STATUS_A2HWD_MASK_V6 ||
> > > >    		    status & CPU_CS_SCIACMDARG0_INIT_IDLE_MSG_MASK)
> > > > @@ -1146,7 +1150,7 @@ static irqreturn_t venus_isr(struct venus_core *core)
> > > >    			hdev->irq_status = status;
> > > >    	}
> > > >    	writel(1, cpu_cs_base + CPU_CS_A2HSOFTINTCLR);
> > > > -	if (!(IS_IRIS2(core) || IS_IRIS2_1(core)))
> > > > +	if (!(IS_IRIS2(core) || IS_IRIS2_1(core) || IS_AR50_LITE(core)))
> > > >    		writel(status, wrapper_base + WRAPPER_INTR_CLEAR);
> > > >    	return IRQ_WAKE_THREAD;
> > > > @@ -1531,7 +1535,7 @@ static bool venus_cpu_and_video_core_idle(struct venus_hfi_device *hdev)
> > > >    	void __iomem *cpu_cs_base = hdev->core->cpu_cs_base;
> > > >    	u32 ctrl_status, cpu_status;
> > > > -	if (IS_IRIS2(hdev->core) || IS_IRIS2_1(hdev->core))
> > > > +	if (IS_IRIS2(hdev->core) || IS_IRIS2_1(hdev->core) || IS_AR50_LITE(hdev->core))
> > > >    		cpu_status = readl(wrapper_tz_base + WRAPPER_TZ_CPU_STATUS_V6);
> > > >    	else
> > > >    		cpu_status = readl(wrapper_base + WRAPPER_CPU_STATUS);
> > > > @@ -1551,7 +1555,7 @@ static bool venus_cpu_idle_and_pc_ready(struct venus_hfi_device *hdev)
> > > >    	void __iomem *cpu_cs_base = hdev->core->cpu_cs_base;
> > > >    	u32 ctrl_status, cpu_status;
> > > > -	if (IS_IRIS2(hdev->core) || IS_IRIS2_1(hdev->core))
> > > > +	if (IS_IRIS2(hdev->core) || IS_IRIS2_1(hdev->core) || IS_AR50_LITE(hdev->core))
> > > >    		cpu_status = readl(wrapper_tz_base + WRAPPER_TZ_CPU_STATUS_V6);
> > > >    	else
> > > >    		cpu_status = readl(wrapper_base + WRAPPER_CPU_STATUS);
> > > > diff --git a/drivers/media/platform/qcom/venus/pm_helpers.c b/drivers/media/platform/qcom/venus/pm_helpers.c
> > > > index 409aa9bd0b5d..5d9dfe3fd043 100644
> > > > --- a/drivers/media/platform/qcom/venus/pm_helpers.c
> > > > +++ b/drivers/media/platform/qcom/venus/pm_helpers.c
> > > > @@ -1168,6 +1168,7 @@ const struct venus_pm_ops *venus_pm_get(enum hfi_version version)
> > > >    		return &pm_ops_v3;
> > > >    	case HFI_VERSION_4XX:
> > > >    	case HFI_VERSION_6XX:
> > > > +	case HFI_VERSION_6XX_LITE:
> > > >    		return &pm_ops_v4;
> > > >    	}
> > > > diff --git a/drivers/media/platform/qcom/venus/vdec.c b/drivers/media/platform/qcom/venus/vdec.c
> > > > index 99ce5fd41577..87c7901b280e 100644
> > > > --- a/drivers/media/platform/qcom/venus/vdec.c
> > > > +++ b/drivers/media/platform/qcom/venus/vdec.c
> > > > @@ -550,7 +550,7 @@ vdec_decoder_cmd(struct file *file, void *fh, struct v4l2_decoder_cmd *cmd)
> > > >    {
> > > >    	struct venus_inst *inst = to_inst(file);
> > > >    	struct vb2_queue *dst_vq;
> > > > -	struct hfi_frame_data fdata = {0};
> > > > +	struct hfi_frame_data fdata;
> > > >    	int ret;
> > > >    	ret = v4l2_m2m_ioctl_try_decoder_cmd(file, fh, cmd);
> > > > @@ -561,18 +561,15 @@ vdec_decoder_cmd(struct file *file, void *fh, struct v4l2_decoder_cmd *cmd)
> > > >    	if (cmd->cmd == V4L2_DEC_CMD_STOP) {
> > > >    		/*
> > > > -		 * Implement V4L2_DEC_CMD_STOP by enqueue an empty buffer on
> > > > +		 * Implement V4L2_DEC_CMD_STOP by enqueue a buffer on
> > > >    		 * decoder input to signal EOS.
> > > >    		 */
> > > >    		if (!(inst->streamon_out && inst->streamon_cap))
> > > >    			goto unlock;
> > > > -		fdata.buffer_type = HFI_BUFFER_INPUT;
> > > > -		fdata.flags |= HFI_BUFFERFLAG_EOS;
> > > > -		if (IS_V6(inst->core) && is_fw_rev_or_older(inst->core, 1, 0, 87))
> > > > -			fdata.device_addr = 0;
> > > > -		else
> > > > -			fdata.device_addr = 0xdeadb000;
> > > > +		ret = venus_helper_alloc_eos_buf(inst, &fdata);
> > > > +		if (ret)
> > > > +			goto unlock;
> > > >    		ret = hfi_session_process_buf(inst, &fdata);
> > > > @@ -1332,6 +1329,7 @@ static void vdec_session_release(struct venus_inst *inst)
> > > >    		hfi_session_abort(inst);
> > > >    	venus_helper_free_dpb_bufs(inst);
> > > > +	venus_helper_free_eos_bufs(inst);
> > > >    	venus_pm_load_scale(inst);
> > > >    	INIT_LIST_HEAD(&inst->registeredbufs);
> > > >    	mutex_unlock(&inst->lock);
> > > > @@ -1682,6 +1680,7 @@ static int vdec_open(struct file *file)
> > > >    	if (!inst)
> > > >    		return -ENOMEM;
> > > > +	INIT_LIST_HEAD(&inst->eosbufs);
> > > >    	INIT_LIST_HEAD(&inst->dpbbufs);
> > > >    	INIT_LIST_HEAD(&inst->registeredbufs);
> > > >    	INIT_LIST_HEAD(&inst->internalbufs);
> > > Otherwise LGTM.
> > > 
> > > ---
> > > bod
> > > 
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

