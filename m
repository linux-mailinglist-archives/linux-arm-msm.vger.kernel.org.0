Return-Path: <linux-arm-msm+bounces-63475-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 219CCAF65AF
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Jul 2025 00:51:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BCB837B0814
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Jul 2025 22:49:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B52D1247298;
	Wed,  2 Jul 2025 22:50:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kgVGiyNh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB9B524BBF0
	for <linux-arm-msm@vger.kernel.org>; Wed,  2 Jul 2025 22:50:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751496624; cv=none; b=DqX8cyj4Zwki2CgvbWw2MKjggdEqordVgG9BVi8R6HfOxRLVog4+BECHaJUPp8YjvdIXXz44zFz7g9d2mlev3G6G/8G/nEV/D3uew2SRdNV2bsBxlMcV/91UWIyOkDPKnmptOANB0yHAh1n0MWjPorc0JLjXc/cVzKyLQlOH9hY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751496624; c=relaxed/simple;
	bh=8PXm+FpNtl4YUNoKWPG2VJslFlM93iGTJXz8RaqTStk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mLjk6nIyV8OOU+qg2DuO37ksQ5Je8qqrn3CUDABPrMZE639Roqj0usvZ8KYNXPATGnCHhqN5IxG+9uoZbj7OamRkJkcA0pXcUSaZSaXXMs7KETVHP6KwWmqO9u16qu7LNKxoKc3BRAlVpeqc1usBcrSP2rFumW0bmXgYIjIS2pg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kgVGiyNh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 562JBYUU007736
	for <linux-arm-msm@vger.kernel.org>; Wed, 2 Jul 2025 22:50:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=KNJiOzzbO5+h4Osyd2A23sTN
	+JdE2BR225dLptBy01o=; b=kgVGiyNhv35DGtG9SjDuoUDcJO/wY6Czd8qwyHte
	KGXX/8vqOOVqLSG2wUio9lzqneJKABtjiAFXj+62PsZ2jfSn0sVFy9Q4ERBuoRN9
	jfl1bQcCysG3n+LdLRa+1iwxFirCW106lPFAPW9NjHyuy8/4bYqtdiv2qRQJpdFs
	HFXZL31e0SVVDvw/4hKQkW4k3YSeStn7abucCcYmd342MNC7PZz56ZzrRt6QyIRl
	yhokSkGhMHGcQxPXLyUAETdbt4IINwqG4Rr8iWaKE/mFOD50xnvlt1lHHgyQ7NOY
	DNbNlMSMG18DO03XWoESo0bxIx8TykJoR1bxl5Yh76BZJQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47napw0ftn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 02 Jul 2025 22:50:22 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c760637fe5so1258987785a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Jul 2025 15:50:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751496620; x=1752101420;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KNJiOzzbO5+h4Osyd2A23sTN+JdE2BR225dLptBy01o=;
        b=EOpBO/1ud8uXbfPcPVyvfknPpBgVAh11hRZnzIjQeJKPlLOEosBdmJJVY8dbSWMGpK
         JJrTrDWMGhuW8M6zmrCbfqrJ2ziN4CIUX+ZaCbvtX03tuoftz+CboIUoYNEXPyRqjhvw
         rgF6ZuUcucbdEUtic0eha5521h3owSwE65RzMSo5/kxMUp9WsnhaSsIAhtpRXn3qz0d0
         S5Ip2PZs1gyZWxrmGr8DCpDKuxAaTRcI6O/VG5j6jmsDbW79CX2hFK63mLyd4lwsAHxs
         MQeSewDba9JkXQipIvJn/DCiR0wGg3To8H3tneWYR5K+pfVQMR6a60lSW59W02XGN70P
         aQ1w==
X-Forwarded-Encrypted: i=1; AJvYcCWpmDjaKHjYqylTPaS19c8QQDv6VM+vbnxJnjtRGsGZz3FekY3fc5yU6bEWwGidBVkFCcpwvfqSyzJNF+Hh@vger.kernel.org
X-Gm-Message-State: AOJu0YzCeamyOtRssF+ALc1ccs5aa5+zMi/5FP812GV074v6T0mai0Wf
	arwhJbAwN6cYQdHQ17rqg5y7h1XPZeeS+tgeAeiMTudOlEnGkUzg+NABMQlprXgsawHGCf39GMD
	OaFnZ7/jfK92TmSxgj3cxfq4GgrvItTLms/WIdxOoYeovrvRMElEzAPalwhunZxFjSa40ZH8AWv
	ym07q12w==
X-Gm-Gg: ASbGncvxQQADOtlwt5qt9W0viCUNES3ebijnCmzGutEH/FB9hqn1w6lVxupeYE2Mqnv
	O2aEkh88iYQmNbFoGh1dPFWFQ7/pdxyWoibEcz9unHXDh+cueJ++M/MH0tE+/BvST27C1+QLCM9
	Gha76tG0xdUFKBVm271UzE/Qw0il1FVBYzHM0gMOrNIFcGVN0RMIQ+0fYSUKX4s3mRLN595arZk
	gaGem9Uf3um7drMMr5qzsE6YhQDj0wnZlOgXa2mscaNSeUiyBDMl6jn9ivCJtl5riix/i2LVZLh
	CLtSnD2P8VMwyUI3rIYN0snrDugroad48Nhd1ja0rDwdqOibmx0U+anL/2X0Sy2UbAkWMuBnoZ1
	ESDeze00opX2Fo78xm8lX3z2g7wvwBDz1sWA=
X-Received: by 2002:a05:620a:4893:b0:7d4:4123:6609 with SMTP id af79cd13be357-7d5c472ae96mr589963685a.39.1751496620482;
        Wed, 02 Jul 2025 15:50:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFT+NZRCRf/AYUnKuCUI+ZRLu8rndWyb5Z3cOZJcoFUG1lXuZ9XMN0SOy8F4eZfw+RGK5ssdg==
X-Received: by 2002:a05:620a:4893:b0:7d4:4123:6609 with SMTP id af79cd13be357-7d5c472ae96mr589960885a.39.1751496620103;
        Wed, 02 Jul 2025 15:50:20 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5550b2d1b2csm2244447e87.194.2025.07.02.15.50.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 15:50:19 -0700 (PDT)
Date: Thu, 3 Jul 2025 01:50:17 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Alexey Klimov <alexey.klimov@linaro.org>, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH RFC 3/5] pinctrl: qcom: sm8650: mark the `gpio` pin
 function as a non-strict function
Message-ID: <qwlhmbsd5gqrgjsfzvaqha43pztq34bxjswske72igg2z37euw@2rkx76ikaclq>
References: <20250702-pinctrl-gpio-pinfuncs-v1-0-ed2bd0f9468d@linaro.org>
 <20250702-pinctrl-gpio-pinfuncs-v1-3-ed2bd0f9468d@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250702-pinctrl-gpio-pinfuncs-v1-3-ed2bd0f9468d@linaro.org>
X-Authority-Analysis: v=2.4 cv=dIKmmPZb c=1 sm=1 tr=0 ts=6865b7ae cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=KKAkSRfTAAAA:8 a=WO_RV84IVBc_PpyxV4YA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAyMDE4OSBTYWx0ZWRfX6Hw9D0EB0GO4
 eGog5YBO6zFp2lxjZA221MtJ0A0Rh72/afrhzByiSiSFQ3XXzxuAimlXIUoGctIJXOp3aRS5LFI
 nB4c7ekQ6CWreYem8VcJYHEZ2ER+VajU9z7hctrp5pB8VUkz7GH1i0EXPhJAUQjGYjUL7ZFZaiY
 rV3vowXzT0U6bW5FvokvNaFSahzH+e2vHfsziau/Bf/SbdXKaJui7weYYlGAKzHacm90pwG2pNt
 xqnOVThcOos+a8JWkLaU0rUrsNM/10u9xEpV2agNCgzwyaPYtiHrOHP8B9dBFplwUdsCaUy0NnA
 XTE0gtfqNtD+0ugbhul4DhUaQFaCToyI7p1G5RUsHArHS1oJe6A4B2uGsnc3N06o/kZptzqF59s
 9CNHbGF83Zlu3THyTM5g9KANfqpicu1avJYLeK5IMEr0nqwZ4foXVssFghI40ng6zxbP4+2E
X-Proofpoint-GUID: qcENnpXbx6ztSNeyL30kUTPMQYY83lZ8
X-Proofpoint-ORIG-GUID: qcENnpXbx6ztSNeyL30kUTPMQYY83lZ8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-02_04,2025-07-02_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0 malwarescore=0
 impostorscore=0 mlxscore=0 adultscore=0 mlxlogscore=879 phishscore=0
 suspectscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507020189

On Wed, Jul 02, 2025 at 10:45:33AM +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> Allow pins muxed to the "gpio" function to be requested as GPIOs even if
> pinmux_ops say the controller should be strict.

This is a strange commit message, shouldn't "gpio" function behave
exactly like that - mark the pin as a GPIO?

> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>  drivers/pinctrl/qcom/pinctrl-sm8650.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/pinctrl/qcom/pinctrl-sm8650.c b/drivers/pinctrl/qcom/pinctrl-sm8650.c
> index 449a0077f4b10666ecd9dfaae8e0057a91e181a6..4ab0e75079cd5dec1d86835dae30c9a09455c7f3 100644
> --- a/drivers/pinctrl/qcom/pinctrl-sm8650.c
> +++ b/drivers/pinctrl/qcom/pinctrl-sm8650.c
> @@ -1328,7 +1328,7 @@ static const char *const vsense_trigger_mirnat_groups[] = {
>  };
>  
>  static const struct pinfunction sm8650_functions[] = {
> -	MSM_PIN_FUNCTION(gpio),
> +	MSM_GPIO_PIN_FUNCTION(gpio),
>  	MSM_PIN_FUNCTION(aoss_cti),
>  	MSM_PIN_FUNCTION(atest_char),
>  	MSM_PIN_FUNCTION(atest_usb),
> 
> -- 
> 2.48.1
> 

-- 
With best wishes
Dmitry

