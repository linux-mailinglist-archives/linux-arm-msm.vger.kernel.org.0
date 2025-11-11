Return-Path: <linux-arm-msm+bounces-81326-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FA7AC4FFB3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Nov 2025 23:37:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 7322F342BD5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Nov 2025 22:37:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2E2D2D0292;
	Tue, 11 Nov 2025 22:36:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mOiKgAiC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="G3l7D3u7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC1A6279DCA
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Nov 2025 22:36:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762900618; cv=none; b=jXONVIUkUUiajRaSRBUxmYmtQ6/VlC6ZFqYMAY2JQPn8hxMLgWopKl92qFhHhzOfL9KqmdXZkCPAFBZ2Z0CoaS4iAKLQA0idKaHqZVi8O6h3ZhE1Gz6QQp6E9pOhorS4zxeybETj89BSkITpCIObN4G8oI8fXgqmrbmm5roX3OM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762900618; c=relaxed/simple;
	bh=3fWmHOxKq6K4JtRy+o9ZjHgsvWeln5n+UKsL57Cgy7w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pGAJsrJ9xjE3uzbMqVYFTMzdMNmHeNRBm7GIfLgwLwLKyr1l1TFdgnQZkt8afMPtJ/ayUT55lWa/EtvSSKl+zqGFwypAOfln84kcDt0CdxqSEM5MtOeWNpy7lnSFxKnTV+NfC11Iwl0t3KIr7CdrjF43/7ey74mJw7CbENcIFaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mOiKgAiC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=G3l7D3u7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ABKZIam2251303
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Nov 2025 22:36:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=7Lf6DQCQZs5RnAciE19Kjze4
	UBC2DxH59loEQV5g5TU=; b=mOiKgAiCxzdd4FakiuLjRz2h7/qxXjx90rWbvij4
	FqzZsf+mhRmII3Bb3cRM1NCXInGVLYI2UMSn4G4hAJvBo2Emj6s0WbratxlLGyTe
	9MelY/O0Y1LlKn8W6VDnfCngqhHHGwiv07nb1dshvD4HcSl2NwSAwLfIPptLm6f3
	jVJaU3yVqJW/UtyZAGIC+kGXT+87arRIDx57aGSmzpNU4BCCGhVnoq11gkoCPAeH
	FouABTASk7fdwVqbkjLvj47woUDRItwBoH9OcIjDN3RTXJZzTsgDL0ublc4ARlkR
	P3Da9iiOdomLbkG+C1JfqQm+AKZNr3nar2D8qMd6HguNXQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4abxxuasxy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Nov 2025 22:36:49 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4edad305681so4361431cf.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Nov 2025 14:36:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762900608; x=1763505408; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7Lf6DQCQZs5RnAciE19Kjze4UBC2DxH59loEQV5g5TU=;
        b=G3l7D3u7KxKc/GWZ+7Jrn7HmNTvUkjCl9bI/Av4UPdZihSPTPG6nqao5w5OVSpXibs
         rwOSc+0nHCIoavh/TAkLdmzNUwi12777eskaKXnWRhLR9D3HTmhsljygzecTsSsDujQc
         b+ZsW2bX+rLh/DW4sg3eFaZacnRE9CTaTr/9Bg3roiRoH3jvfGnpweHYwln3yovYV+gQ
         30CEwiFl1bxq3jSIcR60Mq8QPnTuzvv4EUUjQBpqSrLHdZBdBEJdflRRVCNcRea94pA7
         kZfg8Q9nYQYfYO+OA5Awdy6VXjl8f+V9EKAuS5U79COfEwHqOre/otozHANV3AC1ee5t
         xYLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762900608; x=1763505408;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7Lf6DQCQZs5RnAciE19Kjze4UBC2DxH59loEQV5g5TU=;
        b=iQzSGxVTT1HGEACVN7L+zkVoHQenMu2j7jTqFtNrE+cICn4mFzEC9MQgoMH4VwSrZ6
         2qMbjq6DiuW3pDG+wrJ2zrPKZD6rsUJFcPazgOFB0Ez0j1DVdkeFANImAbBaY7ocgy6f
         VvZPyH2YX7K2qU3SPxptqkOUWnJI8WVkOFHB0VCAQ/C95Vv1pXedEtF4f/VgImMsE4LQ
         xtDLUb4UmoMofg/Oq/DkZ1QHDjPV9CINXVtF573ZFohcb+6bxlVsPB5E2Kewu9xzVXJe
         CalsgQvmiG6IyeeuSDPvqcCdwFIIE1k3p28R0bUnRX8OywaAo3U8Zw+1ACIJr9ry4X6m
         5Nbg==
X-Forwarded-Encrypted: i=1; AJvYcCUEdJxMxMjZFLr230aYhRSCYGwbyAzkTDnIxSIN30KY6bQz57jO3sNPTUZfuasQbIEIGoPMX7zuliAnioYV@vger.kernel.org
X-Gm-Message-State: AOJu0YwRH7rVtyFqKjpr1DRg18qCdkITB3dG7C56CKv4avC6e8Plijh5
	ATfurs5/j9/8qyzan7ApWuAJEI9l1IGRYVo8Td3VF0GZ6QeF/oreTVgiW1zNk+ef9cOvafPnj0+
	0/7d2jENrHUlPT3c5ss/nuRU8g6XJP8iS6o64LPCYcdSqNkQoiC21edBnX8repY6MR/Ng
X-Gm-Gg: ASbGncubeo1dmm74fL99GnY3XOiL6+BmGrNwfjTTn9iydkQiAYxq30Jnmq33cYrdpWe
	YA6tZCv27dZXLCmTfCgUveXzM540A+3C6Whwk38hgnMARUSTgNPEQb0z5T2Wrib7v4ozJdQUK2H
	TK2YSbOZFe8XvkHMXsDWNR42Ur30T7lYW7q7NW9nzcrzqFn6Sgz9K5m6TBt+vVQifVyPM7V/hFV
	s+Lcm1TJitACSxgmSSPnLevhTnF5AS5bk19CuplnpFnfTui49hROYk6KVQlqmiZ7TRX0fgJdFnW
	qy76I8bOF2jOKIHFKQWJxC3Io96Gn5V0WNsjweijzc0mCDQ6pxttEek8NDk86szBjU29ATbTfwm
	WzOVgbPtM0e5ZUzCINOLRmmTJTiDJKi2SSKhq2D8liwGag6L6SxjiCRIBBtRxjmuW3GtgxuHzDa
	Pj5ksZQNw+53bT
X-Received: by 2002:a05:622a:3d0:b0:4ed:1bba:f935 with SMTP id d75a77b69052e-4eddbd9cc3fmr10605411cf.57.1762900608409;
        Tue, 11 Nov 2025 14:36:48 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFbTefJ2z0M7lHf60BOYoHNgvXkw0SsQwfZl0cycXZYQVG4QHwOCTgRxy1jxcyu/3c+cxh1RQ==
X-Received: by 2002:a05:622a:3d0:b0:4ed:1bba:f935 with SMTP id d75a77b69052e-4eddbd9cc3fmr10605091cf.57.1762900607944;
        Tue, 11 Nov 2025 14:36:47 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5944a0b7600sm5330869e87.57.2025.11.11.14.36.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Nov 2025 14:36:47 -0800 (PST)
Date: Wed, 12 Nov 2025 00:36:45 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, hrishabh.rajput@oss.qualcomm.com,
        Konrad Dybcio <konradybcio@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v5 1/2] firmware: qcom: scm: Register gunyah watchdog
 device
Message-ID: <oeg7s3g2zbctft72p3tsdgdlsgbxqnbwk6dj2loiio4fbazfbn@fsgj2kijxb75>
References: <20251107-gunyah_watchdog-v5-0-4c6e3fb6eb17@oss.qualcomm.com>
 <20251107-gunyah_watchdog-v5-1-4c6e3fb6eb17@oss.qualcomm.com>
 <hbxtbaoavlsw7pbmg3cfkbyx4nacjfiikckhqgpvlggbh6hu5b@jyporqecfzni>
 <263d1390-eff5-4846-b2c2-31f96fc3248e@quicinc.com>
 <3794bb0e-5e2c-4d5e-8d81-d302fa36677c@quicinc.com>
 <rt777beinysf5nuy57frn7okwglsl77xqikmvobao32bznhnkf@mzg243ddzlpl>
 <b7ed3445-d004-4c15-b8f8-b2f92a621471@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b7ed3445-d004-4c15-b8f8-b2f92a621471@quicinc.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTExMDE4NSBTYWx0ZWRfX0SCK+o7ZZcxX
 vHoymWBu+6aZeJsWkTNgzFTe6/nOHHIiMVyIfXs8BJAKmZ3rWCFpaGlGm4tUsaMustaQtKOiU5j
 O4JqmG9t8Mw3xuviw72Nd0FAy1wCkFeCHP6GNRmPdhikQphl3s0RzrfM3nzz78ow1RrIEbU2Lfl
 t9WOGFZCLUPcCV9zt+9jit4nRE1l1jzj2wwzJkZFV7ulJrmlbE8aUNM8r//GO+a1OGpceTra9Ur
 zgTftIv1eDbetY+rSXoj55IPcOA/3yqRQFq0kPVGuCVEnsPHToJ0Q3GKkBfcIZiN7wsNnmPtIR6
 FPzKI/YK7q2B9qALqVLPcWVHzT+KHATcE16sgE9zQ7+zvbxpaaFBzHfCxaMZh7BdX1+qcoy7s+K
 Xpq9FIJgxVCoMuUSyH8exzGl4IJ08g==
X-Proofpoint-GUID: fNUlqbmVALQ_sTWjmBCEr8_5p73oR8I_
X-Proofpoint-ORIG-GUID: fNUlqbmVALQ_sTWjmBCEr8_5p73oR8I_
X-Authority-Analysis: v=2.4 cv=TfObdBQh c=1 sm=1 tr=0 ts=6913ba81 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=XerNsCJ_4FoK1Q8j8m4A:9 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-11_05,2025-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 bulkscore=0 phishscore=0
 impostorscore=0 adultscore=0 suspectscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511110185

On Tue, Nov 11, 2025 at 10:31:10PM +0530, Pavan Kondeti wrote:
> On Tue, Nov 11, 2025 at 10:38:27AM -0600, Bjorn Andersson wrote:
> > On Tue, Nov 11, 2025 at 10:51:43AM +0530, Pavan Kondeti wrote:
> > > On Mon, Nov 10, 2025 at 09:43:53AM +0530, Pavan Kondeti wrote:
> > > > On Sat, Nov 08, 2025 at 07:26:46PM +0200, Dmitry Baryshkov wrote:
> > > > > > +static void qcom_scm_gunyah_wdt_free(void *data)
> > > > > > +{
> > > > > > +	struct platform_device *gunyah_wdt_dev = data;
> > > > > > +
> > > > > > +	platform_device_unregister(gunyah_wdt_dev);
> > > > > > +}
> > > > > > +
> > > > > > +static void qcom_scm_gunyah_wdt_init(struct qcom_scm *scm)
> > > > > > +{
> > > > > > +	struct platform_device *gunyah_wdt_dev;
> > > > > > +	struct device_node *np;
> > > > > > +	bool of_wdt_available;
> > > > > > +	int i;
> > > > > > +	uuid_t gunyah_uuid = UUID_INIT(0xc1d58fcd, 0xa453, 0x5fdb, 0x92, 0x65,
> > > > > 
> > > > > static const?
> > > > > 
> > > > > > +				       0xce, 0x36, 0x67, 0x3d, 0x5f, 0x14);
> > > > > > +	static const char * const of_wdt_compatible[] = {
> > > > > > +		"qcom,kpss-wdt",
> > > > > > +		"arm,sbsa-gwdt",
> > > > > > +	};
> > > > > > +
> > > > > > +	/* Bail out if we are not running under Gunyah */
> > > > > > +	if (!arm_smccc_hypervisor_has_uuid(&gunyah_uuid))
> > > > > > +		return;
> > > > > 
> > > > > This rquires 'select HAVE_ARM_SMCCC_DISCOVERY'
> > > > > 
> > > > 
> > > > Probably `depends on HAVE_ARM_SMCCC_DISCOVERY` is correct here.
> > > > 
> > > 
> > > Dmitry / Bjorn,
> > > 
> > > We are debating on this internally on how to resolve this dependency
> > > 
> > > - QCOM_SCM depends on HAVE_ARM_SMCCC_DISCOVERY which means restricting
> > >   QCOM_SCM compilation than what it is today.
> > 
> > What does that imply? What is the actual impact? (Do I need to go read
> > the dependency tree myself?)
> 
> Actually, I misunderstood how QCOM_SCM driver is enabled. It is being
> selected by other drivers which needs functionality provided by QCOM_SCM
> driver. So adding HAVE_ARM_SMCCC_DISCOVERY dependency does not make much
> sense. Sorry, I should have done my homework properly. I was carried
> away with `select` vs `depends on` approach. 
> 
> > 
> > > 
> > > - Adding #ifdefry around arm_smccc_hypervisor_has_uuid usage in qcom scm driver 
> > > 
> > > - Adding stub for `arm_smccc_hypervisor_has_uuid()` which is not done
> > >   for any of the functions defined in drivers/firmware/smccc/smccc.c
> > > 
> > > We are trending towards the first option above. Please let us know if
> > > you think otherwise.
> > 
> > What is this trend driven by? Is it coin toss or is there a reason? My
> > gut feeling is trending towards one of the latter two options...
> 
> Thanks, we are going with #ifdefry around the new code that is added by
> this patch.

It's preferred to use if(IS_ENABLED()) rather than #ifdef.

> 
> > 
> > But you're effectively asking us to go research these three options,
> > determine the pros/cons and then tell you what we think, at which point I
> > presume you will tell us what you think about each option.
> > 
> > It would be better if you made a suggestion and told us why you think
> > this is the best choice - then we can either agree with your reasoning,
> > or choose to ask more questions or do some research.
> > 
> 
> Understood. I will keep this in mind while presenting choices from now
> onwards.

-- 
With best wishes
Dmitry

