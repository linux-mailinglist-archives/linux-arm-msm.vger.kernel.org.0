Return-Path: <linux-arm-msm+bounces-88449-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 76C90D10B23
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jan 2026 07:23:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 94DCE3028FD5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jan 2026 06:23:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1821230F55E;
	Mon, 12 Jan 2026 06:23:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nH03xMCc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TeOgrDNw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71CB425B311
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 06:23:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768199037; cv=none; b=g6jK1pJgX+6g9+NF5M0l8T1baKKavT1SAegwhDdJTMfWVPi+XHL4KPwKl/mvnWtR2cRyr+xQLQiLxKuIkRAUDkr+gIVVB+W+hV4WH/ZliLLCQOfwBtOW5dzU9x1hZ0Pf0nTjCI81feZ9ShE7tjdEiwhyg88Gef6eMkBZ/qO4goU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768199037; c=relaxed/simple;
	bh=P4mSXC8MlSTuA3uaBQti8JM3g1vCWbzXGPhQqnptI9c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OaH6wuqi2fEi9I1/yxcIQUd6zNQ6yoTNhT56hCKiGyQPXl1/b00XWuysvvrBYwzTlJV7addRfMVOFPbK71CZ7IHD+1hFS8zrt5gRasspa0zrpNhUxSe00OioMh/3UTqmp76fTrKBccxtgl2dkoOl54kzY+Dy6wVJq/WYXlYd/Xw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nH03xMCc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TeOgrDNw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60BNqQRI3248477
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 06:23:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Km5DvJaebtBlt4Xd6bMnxrJoMszvzr8gf7s6KJ2cMFw=; b=nH03xMCc0gDgKYGX
	JIjTXDXIW1TjfHgwTjVsMfzekYG3l73Shl15xcjnUU/ZkltHzBwPVF6k5fL3BAn8
	9+Nlvmr+SFiWFVYjnxdhBxmm7mJBXYsZfLqd53okTXdrCT9ohNOhxI/4UILyvlF8
	uB3wtt6swxgEPW+SuD74/HQhk5UQjXqT3uUQIw+vlfUSsqQvdENmX0Y960XoWP3n
	fhRYG6bkL5IU3Icln8MfTR3QWBeaC9MimjgnLumxYD7faFekA+vKS0nEl6CbJGJk
	vRs2gVxymUoOQS11cklvwze9IX0SihDPL7LcqTiUD4zqXN2kAC+g1kCul1kcMDYH
	pLgj3A==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bkf57brxb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 06:23:54 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-88a34f64f5eso148735956d6.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 11 Jan 2026 22:23:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768199034; x=1768803834; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Km5DvJaebtBlt4Xd6bMnxrJoMszvzr8gf7s6KJ2cMFw=;
        b=TeOgrDNwtO40jwtaYj0R2kpxIl937jIe61x2ege5jPuBgQnbk4+/BAe48yk8aD4dbg
         Q7PRwJH/pSp/mXc9gPsIoUBTgwS9Nhs9V/xkIWK2ARmjv38xHelepX0BZpoXmMUh8h2f
         Pf7cf8sKgtEyQZ/tpWiO8xcTd87e4AzsW0i1KhqTZ8WBZlL0irVvHn64OIlwEwhLkekU
         4e9bXe8im1qMk41WuVr0gQc87QSNqRx28oxr2arKbtXDIwc99ifTqVUh1r7dSLKaKn5O
         +179GTpgQXmjGNMvnbrQyls7iBvQOF1CPPkMIQQbeqhfpSj0r1qHmnAipVtVmMoZ0ZrX
         CqxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768199034; x=1768803834;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Km5DvJaebtBlt4Xd6bMnxrJoMszvzr8gf7s6KJ2cMFw=;
        b=oCJOsnxlnc3Fj5uPImxGGPQ5EZzDlDDtIU0TowoAl9dN2LHeQz6+K5BgMb4Dac0W09
         Ui6R3Z51CP1rk4YkgpCpJ8xiXMlSEsi9namsV7TDGe/VwcXJ3ZMxfd+hXkl2UN2mvI5w
         H6hsPU7bfv8VMSKfi5J5NsxSHKSXBXi7kEJ+KFP/ZN75VmmOdi5lntPlWThPp9JPKt+K
         irkBKRXO+WeDdaaKdQKYoM73zDMCEhE9y4tSE8aN8vddYtBN7gwJIPw/wR0x6fu4UPa1
         m/BYSaPd9s75DxQld93megZxfdL/o8poHzuZQvnvLqz90lpNVP/I/SGhRpzUWzEpFilD
         8VAw==
X-Forwarded-Encrypted: i=1; AJvYcCVKSIdExmv4qWRseiYu9C6yi/p3rLFMsHDlhZmz67Xw8lKaKtEuAx1vMe5Ge7EYdu45nwHuQan7luPUIYaz@vger.kernel.org
X-Gm-Message-State: AOJu0Yx70eGn7SF62MYd+lzTP4rFa6g7quzW3pzzG/mpCHP/+/rpJp4v
	kyXtIg8luSLlM2BWxO4VGNLB/PJhAMytHUMfk39ZErrssvaSUvfIAFQJ/+WF85dJOvdoDk59oXc
	8Ihaq7qffM6SMzfZJ1QXuLG6e7Vc5mQEzZYaSrhJwJL8Tu39u9VFmR74HRzJz2rhF2o2Z
X-Gm-Gg: AY/fxX5/y0p/t24oC/be94h9a06rnJhpdn6Tf2NYte0VS9n+5EG/CReXMx3BDN1Edis
	7iwpmPYNuaAx2XuwUSoRt8e10/QzCs0Ehulg5AeJyVGeWN86oLbQS0drpIJl2cdslO5i2VCKuSP
	rwi44pEIh+9ux4B8dVxn1KygB4mK7N6gqfnbICARO/ytHudA2Sk1zCQZnX7K02FjwOmGTN1STt5
	1jkGsqOyPXL1Gr6CRMOxSOk9PDH/GQtCZH292pTi+CLknoTF4xIY63jgBKmHnQGXYaCGyrFRwU6
	O48sSENLQvhZAUNRAnxzt4yUI07Lhc2YQYuY6YoIOSYiWxZQ2u0Ul6ZjxjU8LD/2qcDlSpwF9iU
	1tLjf/fRpXE9LpcUcigqH8Y1ppRiYYCU/yPFfn59ZyBea3UWUFUTFbZRUFUT3TuM0AEzcBHc=
X-Received: by 2002:a05:6214:449b:b0:880:5249:be4b with SMTP id 6a1803df08f44-89083c49d2dmr246929196d6.12.1768199033571;
        Sun, 11 Jan 2026 22:23:53 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHhWoWXnAmkoZk9GRxeBtUzBXi9ZFKae087r03NDSp0afxk1Z9oa4ANoJpC2jtq6aFa5UtAdA==
X-Received: by 2002:a05:6214:449b:b0:880:5249:be4b with SMTP id 6a1803df08f44-89083c49d2dmr246928886d6.12.1768199033106;
        Sun, 11 Jan 2026 22:23:53 -0800 (PST)
Received: from yuanjiey.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-890770ce99dsm133195916d6.3.2026.01.11.22.23.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Jan 2026 22:23:52 -0800 (PST)
Date: Mon, 12 Jan 2026 14:23:44 +0800
From: yuanjiey <yuanjie.yang@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: robin.clark@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
        jesszhan0024@gmail.com, sean@poorly.run, marijn.suijten@somainline.org,
        airlied@gmail.com, simona@ffwll.ch, krzysztof.kozlowski@linaro.org,
        konrad.dybcio@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, tingwei.zhang@oss.qualcomm.com,
        aiqun.yu@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com
Subject: Re: [PATCH 1/2] drm/msm/dpu: fix mismatch between power and frequency
Message-ID: <aWSTcI6H6+7AXkEN@yuanjiey.ap.qualcomm.com>
References: <20260109083808.1047-1-yuanjie.yang@oss.qualcomm.com>
 <20260109083808.1047-2-yuanjie.yang@oss.qualcomm.com>
 <kusxzlezvsuwcwwdtm7yqwnqea6gdeolkepxpx3estabaiqymo@edj7pgccli3y>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <kusxzlezvsuwcwwdtm7yqwnqea6gdeolkepxpx3estabaiqymo@edj7pgccli3y>
X-Authority-Analysis: v=2.4 cv=K/sv3iWI c=1 sm=1 tr=0 ts=6964937a cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=hW2TlsjfLSOC7mfwDcUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEyMDA0OCBTYWx0ZWRfX0sTpzRKKMm+t
 gBjv2vUFJlrYQd/i4mtfCnOLYThNl1p5pTU2+b+iecu/2P+gsvVDAOvKJ4n21H4rxixwYf13DwC
 Ehv989wwdgEFx3TX5hEmIC1lVq0Te0mM9UneJmgAvTRUHgNBF7S4ESrl3jEPjWT7qLy26V/53Qu
 bNI8GUVDCZu68Yt7Ixc3nH99eQHlF9fYAIbb07mlauTl7E96+U8K5YI7PttP+/2iVYphTGMYGut
 yQZqHqnXJ/IR99AB8s4DMPgg7Van7JYNrmKvihWhwQYjfRPQ7mNJaWQLyQwdXFeqC9NDfgPF/eA
 v3BLDLnjUtFqoqADhgk4hZBk/OmjUaFXL3sBxeeOvOuJaP+XuHyiMrm0NLGhpg7+XTVSFoWqYmk
 4W2DiIdENsIvsws5MFnwIvw/U5YJy/sbGJbHtEccHBnXkE8zlRID40sDEboms4sJFUxon9mSg1M
 2kcYKN5qQPwCRRSGasA==
X-Proofpoint-GUID: vEkGA3fDdznot7tCRvIoUNvXTY9aacEp
X-Proofpoint-ORIG-GUID: vEkGA3fDdznot7tCRvIoUNvXTY9aacEp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-12_01,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 suspectscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 clxscore=1015 malwarescore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601120048

On Fri, Jan 09, 2026 at 05:22:37PM +0200, Dmitry Baryshkov wrote:
> On Fri, Jan 09, 2026 at 04:38:07PM +0800, yuanjie yang wrote:
> > From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> > 
> > During DPU runtime suspend, calling dev_pm_opp_set_rate(dev, 0) drops
> > the MMCX rail to MIN_SVS while the core clock frequency remains at its
> > original (highest) rate. When runtime resume re-enables the clock, this
> > may result in a mismatch between the rail voltage and the clock rate.
> > 
> > For example, in the DPU bind path, the sequence could be:
> >   cpu0: dev_sync_state -> rpmhpd_sync_state
> >   cpu1:                                     dpu_kms_hw_init
> > timeline 0 ------------------------------------------------> t
> > 
> > After rpmhpd_sync_state, the voltage performance is no longer guaranteed
> > to stay at the highest level. During dpu_kms_hw_init, calling
> > dev_pm_opp_set_rate(dev, 0) drops the voltage, causing the MMCX rail to
> > fall to MIN_SVS while the core clock is still at its maximum frequency.
> 
> Ah, I see. dev_pm_set_rate(0) transforms to  _disable_opp_table(), which
> doesn't do anything with clocks. I think we should have a call to
> clk_disable_unprepare() before that and clk_prepare_enable() in the
> resume path.

I do check the backtrace on kaanapali: 

active_corner = 3 (MIN_SVS)
rpmhpd_aggregate_corner+0x168/0x1d0
rpmhpd_set_performance_state+0x84/0xd0
_genpd_set_performance_state+0x50/0x198
genpd_set_performance_state.isra.0+0xbc/0xdc
genpd_dev_pm_set_performance_state+0x60/0xc4
dev_pm_domain_set_performance_state+0x24/0x3c
_set_opp+0x370/0x584
dev_pm_opp_set_rate+0x258/0x2b4
dpu_runtime_suspend+0x50/0x11c [msm]
pm_generic_runtime_suspend+0x2c/0x44
genpd_runtime_suspend+0xac/0x2d0
__rpm_callback+0x48/0x19c
rpm_callback+0x74/0x80
rpm_suspend+0x108/0x588
rpm_idle+0xe8/0x190
__pm_runtime_idle+0x50/0x94
dpu_kms_hw_init+0x3a0/0x4a8 

dev_pm_opp_set_rate(dev, 0); just low power to MIN_SVS. 
And freq MDP: 650MHz


And I try change the order:
from: 
	dev_pm_opp_set_rate(dev, 0);
	clk_bulk_disable_unprepare(dpu_kms->num_clocks, dpu_kms->clocks);
to:
	clk_bulk_disable_unprepare(dpu_kms->num_clocks, dpu_kms->clocks);
	dev_pm_opp_set_rate(dev, 0);

But the issue is still here.

 
> > When the power is re-enabled, only the clock is enabled, leading to a
> > situation where the MMCX rail is at MIN_SVS but the core clock is at its
> > highest rate. In this state, the rail cannot sustain the clock rate,
> > which may cause instability or system crash.
> > 
> > Fix this by setting the corresponding OPP corner during both power-on
> > and power-off sequences to ensure proper alignment of rail voltage and
> > clock frequency.
> > 
> > Fixes: b0530eb11913 ("drm/msm/dpu: Use OPP API to set clk/perf state")
> > 
> > Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> 
> No empty lines between the tags. Also please cc stable.

Sure, will fix.

> > ---
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 16 ++++++++++++----
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h |  3 +++
> >  2 files changed, 15 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> > index 0623f1dbed97..c31488335f2b 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> > @@ -1306,9 +1306,14 @@ static int dpu_kms_init(struct drm_device *ddev)
> >  	struct dpu_kms *dpu_kms = to_dpu_kms(priv->kms);
> >  	struct dev_pm_opp *opp;
> >  	int ret = 0;
> > -	unsigned long max_freq = ULONG_MAX;
> > +	dpu_kms->max_freq = ULONG_MAX;
> > +	dpu_kms->min_freq = 0;
> >  
> > -	opp = dev_pm_opp_find_freq_floor(dev, &max_freq);
> > +	opp = dev_pm_opp_find_freq_floor(dev, &dpu_kms->max_freq);
> > +	if (!IS_ERR(opp))
> > +		dev_pm_opp_put(opp);
> > +
> > +	opp = dev_pm_opp_find_freq_ceil(dev, &dpu_kms->min_freq);
> >  	if (!IS_ERR(opp))
> >  		dev_pm_opp_put(opp);
> >  
> > @@ -1461,8 +1466,8 @@ static int __maybe_unused dpu_runtime_suspend(struct device *dev)
> >  	struct msm_drm_private *priv = platform_get_drvdata(pdev);
> >  	struct dpu_kms *dpu_kms = to_dpu_kms(priv->kms);
> >  
> > -	/* Drop the performance state vote */
> > -	dev_pm_opp_set_rate(dev, 0);
> > +	/* adjust the performance state vote to low performance state */
> > +	dev_pm_opp_set_rate(dev, dpu_kms->min_freq);
> 
> Here min_freq is the minumum working frequency, which will keep it
> ticking at a high frequency.  I think we are supposed to turn it off
> (well, switch to XO). Would it be enough to swap these two lines
> instead? 

Yes, just clk_bulk_disable_unprepare(dpu_kms->num_clocks, dpu_kms->clocks) to
disable clk is OK. 
we can drop change here.

> >  	clk_bulk_disable_unprepare(dpu_kms->num_clocks, dpu_kms->clocks);
> >  
> >  	for (i = 0; i < dpu_kms->num_paths; i++)
> > @@ -1481,6 +1486,9 @@ static int __maybe_unused dpu_runtime_resume(struct device *dev)
> >  	struct drm_device *ddev;
> >  
> >  	ddev = dpu_kms->dev;
> > +	/* adjust the performance state vote to high performance state */
> > +	if (dpu_kms->max_freq != ULONG_MAX)
> > +		dev_pm_opp_set_rate(dev, dpu_kms->max_freq);
> 
> This one should not be necessary, we should be setting the performance
> point while comitting the DRM state.

No, issue is during dpu binding path. And in msm_drm_kms_init driver just
pm_runtime_resume_and_get enable power and pm_runtime_put_sync disable power.
But We do not set the appropriate OPP each time the power is enabled. 
As a result, a situation may occur where the rail stays at MIN_SVS while the 
MDP is running at a high frequency.

rpm_idle+0xe8/0x190
__pm_runtime_idle+0x50/0x94
dpu_kms_hw_init+0x3a0/0x4a8 [msm]
msm_drm_kms_init+0xb8/0x340 [msm]
msm_drm_init+0x16c/0x22c [msm]
msm_drm_bind+0x30/0x3c [msm]
try_to_bring_up_aggregate_device+0x168/0x1d4
__component_add+0xa4/0x170
component_add+0x14/0x20
dsi_dev_attach+0x20/0x2c [msm]
dsi_host_attach+0x58/0x98 [msm]
mipi_dsi_attach+0x30/0x54
novatek_nt37801_probe+0x13c/0x1c8 [panel_novatek_nt37801]

And I found a a similar bug.
https://lore.kernel.org/all/20220915205559.14574-1-quic_bjorande@quicinc.com/

Since the panel driver does not hold the property power-domains = <&rpmhpd RPMHPD_MMCX> 
once all drivers that do own the RPMHPD_MMCX power domain finish probing, 
the interconnect’s dev_sync_state is triggered, which eventually runs rpmhpd_sync_state 
and starts dynamic voltage adjustment. This is when the issue occurs.


if do change below, this issue can also be fixed.
&mdss_dsi0 {
    ...
	panel@0 {
		compatible = "novatek,nt37801";
        	...
	++	power-domains = <&rpmhpd RPMHPD_MMCX>;
    }
}
But I don't think panel driver should own a power-domains = <&rpmhpd RPMHPD_MMCX>;



Thanks,
Yuanjie

> >  
> >  	rc = clk_bulk_prepare_enable(dpu_kms->num_clocks, dpu_kms->clocks);
> >  	if (rc) {
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
> > index 993cf512f8c5..8d2595d8a5f6 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
> > @@ -92,6 +92,9 @@ struct dpu_kms {
> >  	struct clk_bulk_data *clocks;
> >  	size_t num_clocks;
> >  
> > +	unsigned long max_freq;
> > +	unsigned long min_freq;
> > +
> >  	/* reference count bandwidth requests, so we know when we can
> >  	 * release bandwidth.  Each atomic update increments, and frame-
> >  	 * done event decrements.  Additionally, for video mode, the
> > -- 
> > 2.34.1
> > 
> 
> -- 
> With best wishes
> Dmitry

