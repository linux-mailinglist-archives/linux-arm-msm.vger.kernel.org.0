Return-Path: <linux-arm-msm+bounces-59736-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E2CC9AC717F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 May 2025 21:27:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5390A9E4B42
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 May 2025 19:27:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5019921CC63;
	Wed, 28 May 2025 19:27:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fmzNirXZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3E503FBB3
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 May 2025 19:27:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748460452; cv=none; b=NKskalEoN12DvHB7H/zzf9B6ZVdNuCgrfFe+hmh32ZYZATDaRIUh9BZl+GjLxDJ5iUQLOdXaBHYJdSKATI96DTN0y8IlduhHPNqClwFhkxy870sgYsXvfaprFHuQS+9uJoJPtiU3PIrwVe97qayZVPFUkW3Ywn6sEloP7FUSxKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748460452; c=relaxed/simple;
	bh=Xn1FKEJLv5D8pFVsWrE9ZqQAzj3W2hMUw/eULkExvVA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jNYewCV3/SdojFOH0NmwenemMqc5knsNAJTfFpk6dTdbskNkn8mzowgrnNpkbs4vBi2Um4HAZrdAe02ab2jSQDQs03axtA9hKG7Om6f35bUurpY5lXKj9163lqXeg2y3hf965qqzlI7HgmZmH3289lTmsb2aoTpXRU1qqFe3zW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fmzNirXZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54SE1kbH028172
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 May 2025 19:27:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=vappqUOIevOsLclXr9ODpZ9f
	RqMbtiuDh6sBRBORQbE=; b=fmzNirXZ6FyEDMBnoFgsH0PUrLkYHh0K/PWCX78G
	YhCdS7s4lUaRBzPpPUGWuDELd1MwkPxuYcMvtfp/T1s5yM1nAaHlSBDRLda2Y50F
	3uN7V9CKQpi5h0cMRga6R4ioaOUALHJ5rj6ojcG2JI7MSqqyqzRx+UI877PrI4jo
	KxHwFT+ocGF7JUVjwYMeuWqfKNKjCh4VV4obdqGVbK1myr2NbtLdB4Qj0hl+G9Q4
	tn5WSgztOJ1oshpwlXlkcW69vSEr4xqJiiXIsEl9HPJjKVlg5K+fRlWFQ9Pn7goT
	q6RTMy04G2YOb2mOOzJNo8s5EwCPHfESDsi/uMw2Qqj56g==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46w992ne9f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 May 2025 19:27:29 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c95e424b62so199451885a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 May 2025 12:27:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748460448; x=1749065248;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vappqUOIevOsLclXr9ODpZ9fRqMbtiuDh6sBRBORQbE=;
        b=BJM0k7So1pQhvNBejp+Q6sLiyNVug/iXwiGGfxQnzzbI6lrtwilH5fXDR0VaQ+Rcrk
         HKUJibUlflPC5ymld08yo3AOL91xOoJ6AtfyQmpJ9ulQYXrEnH7lGeKE7WbWnoFdsfkh
         LKqDlQgQceEHTJQ1VbI6him9TH30E9E0La4bBBsyZs4PCyktGDuuKO6xy9Jpo2lecQxi
         JWeWhQB3o3SUUwWaSLomFOr50o0ZIAd+nNZ8g1JY89YcqFCrqbW8MNoJh5itgQeSmp1P
         Xc/vwJofXe9G7tVk3TbBkI2nAIJZEj/NtTWSuG9noNQFe6nqcYPlYX1NcyUImuz6Ofz+
         kDeA==
X-Forwarded-Encrypted: i=1; AJvYcCVjXihqWVp6B5OH4K9d9lb3UWjqgKfTJvpOhMZHA5a/1Bt1iIxZu1JyIwjZ7wSvELdJ3a3ibZ2DX0b9Cfrh@vger.kernel.org
X-Gm-Message-State: AOJu0YydwSsZDQzhG7T1Qs6yKxSKn95yPxcxu7jEr5l1yXPn6oe6oIiA
	T8pPUvLkmqeQOH2npXELe2jCgJIbdCERwgOfobzg1M7kpUQRs2RKI90I5s1BgjjGBSx3glQFyiF
	Ozf9QaYLDPZrbs5lZbBBiSMQsyEmxh8kJLCgBPw25IpOQVFEznNETjyztGwjVJfKvf8D1eZriMf
	AT
X-Gm-Gg: ASbGncvEMSiAciJM/G0FhZ/B+HLl6AV1O3qWwQ31xwXMyi7cmQO4Cyt7IKCEBHAowl8
	Kz6lLLuJy+b37MdLiPMyamd3fTUyBI8/Xu8+jvg0MuBZD9F0tHR8hq3aJPW5NlGfB8Gxj+HVv53
	5IvKfH8HbZzVATQDQHS4K8OO5yriiBZOfqgH4gUw03J7RMFDJXFsYNDRlte5DiXFi6qhOrp73Um
	8I7ZAdRfQXktULBsNiJ/3I8nuA+rVa0KDnxewD0R/gjdwOFwzpz4x6QupkEsXUFT+UEfBNJRL7Z
	pa+x5C2ny5h1XCRUmM1Eqn+DhGy7oE8rb8UyjwjuP92C5nwUtdMsdn50MiEiw/XYLdnoY2IqXaU
	=
X-Received: by 2002:a05:620a:1a23:b0:7ce:eb15:6f7d with SMTP id af79cd13be357-7d0987d636emr112819785a.20.1748460447617;
        Wed, 28 May 2025 12:27:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFsnngm+Izjr1ofjAwabPE98EDhFCUUgnxCLZ5MClGgAAgXgIfJXNwHrbGpGcDTWLEBS94kKQ==
X-Received: by 2002:a05:620a:1a23:b0:7ce:eb15:6f7d with SMTP id af79cd13be357-7d0987d636emr112815385a.20.1748460447219;
        Wed, 28 May 2025 12:27:27 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5532f6b25a5sm404947e87.211.2025.05.28.12.27.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 12:27:26 -0700 (PDT)
Date: Wed, 28 May 2025 22:27:24 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Renjiang Han <quic_renjiang@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: Re: [PATCH v4 1/2] venus: pm_helpers: add compatibility for
 dev_pm_genpd_set_hwmode on V4
Message-ID: <zewub4somwmi6jvym5m44t6cumeonv2pcrtsntbkujlznotefp@bhfrerykhfqu>
References: <20250218-switch_gdsc_mode-v4-0-546f6c925ae0@quicinc.com>
 <20250218-switch_gdsc_mode-v4-1-546f6c925ae0@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250218-switch_gdsc_mode-v4-1-546f6c925ae0@quicinc.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI4MDE3MCBTYWx0ZWRfXx0NN++viZhzp
 5MoKsqTHNEfK0DhKzLsj6O+yteHwWnN23FH39ePiUepBaZKUlWHKuO0eV+8WNcUcLAeRqSAX887
 eSuyAD8b9MhwC3wTkf7+ravIb0NHkfYUgGAx4TXslv5nfbGx9UyAnlgtU+x41quDQ9AK/Ml/cxu
 2XkvgSLXny5Fc7Og3IBo5buPR2jp6xpObxwhDG/pdOGliC+n44+hAX0HKOv1y4BU198M90S5wIg
 o9XHsjKv8mSDsO8w4KXKVNHG6zcXRzImdxh85TiSPOwArhpODGVT5LDmy8TqZPAIPhB9nETXDE9
 9ZB/Sm0dbj+g/5gQaEcpHJG8nPlvIQVjSGADLtMXAjMTnEr2Jo+5ayjmaaiqzMFTcI5KzLfJF85
 bXwb8WM1HXJmBjP4yBu9GYqSlKvbacPvVLTgh0UzwbeSYKfMXPYCHsjvjG7RWVzVMFvDwPEq
X-Authority-Analysis: v=2.4 cv=Fes3xI+6 c=1 sm=1 tr=0 ts=683763a1 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=gF5d3Xu8TQ-Je0CE9tcA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: wJ0_4yguF1XXUvBp3vHNLhdq3XB2X74D
X-Proofpoint-ORIG-GUID: wJ0_4yguF1XXUvBp3vHNLhdq3XB2X74D
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-28_10,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0 impostorscore=0 phishscore=0 clxscore=1015
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 mlxlogscore=999 spamscore=0
 adultscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505280170

On Tue, Feb 18, 2025 at 04:03:20PM +0530, Renjiang Han wrote:
> There are two ways to switch GDSC mode. One is to write the POWER_CONTROL
> register and the other is to use dev_pm_genpd_set_hwmode(). However, they
> rely on different clock driver flags. dev_pm_genpd_set_hwmode() depends on
> the HW_CTRL_TRIGGER flag and POWER_CONTROL register depends on the HW_CTRL
> flag.
> 
> By default, the dev_pm_genpd_set_hwmode() is used to switch the GDSC mode.
> If it fails and dev_pm_genpd_set_hwmode() returns -EOPNOTSUPP, it means
> that the clock driver uses the HW_CTRL flag. At this time, the GDSC mode
> is switched to write the POWER_CONTROL register.
> 
> Clock driver is using HW_CTRL_TRIGGER flag with V6. So hwmode_dev is
> always true on using V6 platform. Conversely, if hwmode_dev is false, this
> platform must be not using V6. Therefore, replace IS_V6 in poweroff_coreid
> with hwmode_dev. Also, with HW_CTRL_TRIGGER flag, the vcodec gdsc gets
> enabled in SW mode by default. Therefore, before disabling the GDSC, GDSC
> should be switched to SW mode so that GDSC gets enabled in SW mode in the
> next enable.
> 
> Signed-off-by: Renjiang Han <quic_renjiang@quicinc.com>
> ---
>  drivers/media/platform/qcom/venus/core.h       |  2 ++
>  drivers/media/platform/qcom/venus/pm_helpers.c | 38 ++++++++++++++------------
>  2 files changed, 23 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
> index 43532543292280be15adf688fc0c30f44e207c7f..0ccce89d3f54cf685ecce5b339a51e44f6ea3704 100644
> --- a/drivers/media/platform/qcom/venus/core.h
> +++ b/drivers/media/platform/qcom/venus/core.h
> @@ -168,6 +168,7 @@ struct venus_format {
>   * @root:	debugfs root directory
>   * @venus_ver:	the venus firmware version
>   * @dump_core:	a flag indicating that a core dump is required
> + * @hwmode_dev:	a flag indicating that HW_CTRL_TRIGGER is used in clock driver
>   */
>  struct venus_core {
>  	void __iomem *base;
> @@ -230,6 +231,7 @@ struct venus_core {
>  		u32 rev;
>  	} venus_ver;
>  	unsigned long dump_core;
> +	bool hwmode_dev;
>  };
>  
>  struct vdec_controls {
> diff --git a/drivers/media/platform/qcom/venus/pm_helpers.c b/drivers/media/platform/qcom/venus/pm_helpers.c
> index 33a5a659c0ada0ca97eebb5522c5f349f95c49c7..409aa9bd0b5d099c993eedb03177ec5ed918b4a0 100644
> --- a/drivers/media/platform/qcom/venus/pm_helpers.c
> +++ b/drivers/media/platform/qcom/venus/pm_helpers.c
> @@ -412,9 +412,17 @@ static int vcodec_control_v4(struct venus_core *core, u32 coreid, bool enable)
>  	u32 val;
>  	int ret;
>  
> -	if (IS_V6(core))
> -		return dev_pm_genpd_set_hwmode(core->pmdomains->pd_devs[coreid], !enable);
> -	else if (coreid == VIDC_CORE_ID_1) {
> +	ret = dev_pm_genpd_set_hwmode(core->pmdomains->pd_devs[coreid], !enable);
> +	if (ret == -EOPNOTSUPP) {
> +		core->hwmode_dev = false;
> +		goto legacy;
> +	}
> +
> +	core->hwmode_dev = true;
> +	return ret;
> +
> +legacy:
> +	if (coreid == VIDC_CORE_ID_1) {
>  		ctrl = core->wrapper_base + WRAPPER_VCODEC0_MMCC_POWER_CONTROL;
>  		stat = core->wrapper_base + WRAPPER_VCODEC0_MMCC_POWER_STATUS;
>  	} else {
> @@ -450,7 +458,7 @@ static int poweroff_coreid(struct venus_core *core, unsigned int coreid_mask)
>  
>  		vcodec_clks_disable(core, core->vcodec0_clks);
>  
> -		if (!IS_V6(core)) {
> +		if (!core->hwmode_dev) {
>  			ret = vcodec_control_v4(core, VIDC_CORE_ID_1, false);
>  			if (ret)
>  				return ret;
> @@ -468,7 +476,7 @@ static int poweroff_coreid(struct venus_core *core, unsigned int coreid_mask)
>  
>  		vcodec_clks_disable(core, core->vcodec1_clks);
>  
> -		if (!IS_V6(core)) {
> +		if (!core->hwmode_dev) {
>  			ret = vcodec_control_v4(core, VIDC_CORE_ID_2, false);
>  			if (ret)
>  				return ret;
> @@ -491,11 +499,9 @@ static int poweron_coreid(struct venus_core *core, unsigned int coreid_mask)
>  		if (ret < 0)
>  			return ret;
>  
> -		if (!IS_V6(core)) {
> -			ret = vcodec_control_v4(core, VIDC_CORE_ID_1, true);
> -			if (ret)
> -				return ret;
> -		}
> +		ret = vcodec_control_v4(core, VIDC_CORE_ID_1, true);
> +		if (ret)
> +			return ret;
>  
>  		ret = vcodec_clks_enable(core, core->vcodec0_clks);
>  		if (ret)
> @@ -511,11 +517,9 @@ static int poweron_coreid(struct venus_core *core, unsigned int coreid_mask)
>  		if (ret < 0)
>  			return ret;
>  
> -		if (!IS_V6(core)) {
> -			ret = vcodec_control_v4(core, VIDC_CORE_ID_2, true);
> -			if (ret)
> -				return ret;
> -		}
> +		ret = vcodec_control_v4(core, VIDC_CORE_ID_2, true);
> +		if (ret)
> +			return ret;
>  
>  		ret = vcodec_clks_enable(core, core->vcodec1_clks);
>  		if (ret)
> @@ -811,7 +815,7 @@ static int vdec_power_v4(struct device *dev, int on)
>  	else
>  		vcodec_clks_disable(core, core->vcodec0_clks);
>  
> -	vcodec_control_v4(core, VIDC_CORE_ID_1, false);
> +	ret = vcodec_control_v4(core, VIDC_CORE_ID_1, false);


return vcodec_control_v4(...);

>  
>  	return ret;
>  }
> @@ -856,7 +860,7 @@ static int venc_power_v4(struct device *dev, int on)
>  	else
>  		vcodec_clks_disable(core, core->vcodec1_clks);
>  
> -	vcodec_control_v4(core, VIDC_CORE_ID_2, false);
> +	ret = vcodec_control_v4(core, VIDC_CORE_ID_2, false);

And here.

>  
>  	return ret;
>  }
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

