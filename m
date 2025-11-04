Return-Path: <linux-arm-msm+bounces-80286-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AA56C30D8D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 04 Nov 2025 13:00:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 38FBE460660
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Nov 2025 12:00:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D77632EBDCA;
	Tue,  4 Nov 2025 12:00:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FQ7pMc7E"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FC0B2EAB8D
	for <linux-arm-msm@vger.kernel.org>; Tue,  4 Nov 2025 11:59:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762257600; cv=none; b=k9aPYFysVraRkval2UkJhntaPHyGT/SAPmi2EO/P58ofHSPy2yJXbhfG1Pu7gAgG9eIeyb1immJ5mupblNdB7QG9rQVqesRosLS0pg5fRMOqCNmc3338YkJtgn234PD1aJ6ooHhdft+3uYlDm/clGEAWTE47/FCiZySpkYU4Yn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762257600; c=relaxed/simple;
	bh=6c8g/ZYuiMRbAXxCY6J1PXEVbRw5F54c9Htwc4BoMEk=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BI0wVFgdhLRzgaMQgymYufVItjoErhPga7L7/6rjH/EPxVXf2JiVK6ts9WrZObYMAstqEajuVSXKbKVh9hYgZyLM40V0BMsrY9A4lkVjzlWEjfprYUODFrC5BATXgloJHAlPJxiYO43W5Ygy/9VwETgTFdDGGMml4wcA0XBI1Vw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FQ7pMc7E; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4710022571cso50936945e9.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Nov 2025 03:59:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762257597; x=1762862397; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=CRDsESs7bHanH8A88qsmRD3YZo8DiYehUnYoS0PE/dY=;
        b=FQ7pMc7EVU02JgHkwnntA0bsxQ4N9WhVx+4G+XKKZd0qVT9XXnJGbqc+VFLDblbUYJ
         eDQcaUG5CiQTTEXxzCMtA4OhsbJKR9N1DSwbbvlLXIFavvhv/0gk7BtYd8okvTSiyhcf
         fVLXJcMwpK+FeODEJknJBvA35GjaOfGaSEoVZ0qcp25E+GOjV0Gk2SVIMh94KL8S6PSs
         LEXl4Rmkf6DjsbjI4AFb0fX8N1dDC9a11sxerLaXDnaIwHKgt5UTZDLxdi/rkKmK65OG
         QbezhlrJSsEKBpmWTjiCjXefJAccyx9nTxAWFq7HYpjzI6EoAxkC0KyJKWi6BU4/iyH+
         Jf0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762257597; x=1762862397;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CRDsESs7bHanH8A88qsmRD3YZo8DiYehUnYoS0PE/dY=;
        b=oQr3I88lYdLyi249B7xqk2qpFX8mGWsjrsUgvlUljufdoLw3h7Vzi/Fxw7+Z9MeRtf
         mv2ZT9E4JeikYZDATljdj5cTB3Tsuroc+CMPEHw7viP0AhG5JqKLwFkKqFziNY/BhWQ8
         yc+ts+DnxGkoCPs0uEG1UM+M9tgeFOYc7b+NbZQrsbZaHfu/lK41QWK4sSKIbPuN13Fh
         Q+t61mPk6Vnu4/DVYTmOiqnkPU3LY4VbTNK0ZddGs9i54s3poYL4BH2mdydc1tJj0IVW
         b6Nwm4FBFjtGD9Lwmbaw5WGWbzjtU5gryPMAKukCWc+tzOHd+LSQmNxPvs3Gqvn/FtT8
         yAIA==
X-Forwarded-Encrypted: i=1; AJvYcCVkQ4pxwHdXrryz50Z5M60iU+72MQZ6tbLn8t06IZpVmPOraAZdbjmIxoasqnvBD0N5aQFiC3uzvtBqEM/5@vger.kernel.org
X-Gm-Message-State: AOJu0Yyo3Q+NSWXl7bw3HkYG4MHn0KZUIKyf4TNLo40ozNWojniXsUzw
	CevUtsr0bhiSuYPyCdQEmmzIDALMHiGWkxBRvMDps6uQnEji/G5KjxF0
X-Gm-Gg: ASbGncu8c04cvpOxQLc0PpdPME+APtlpgOKdHy1XmzoT/uAmM3JYVMg81IPCxLwV/nc
	xB8mO+u71geIsqnaTtnzkh5RIpdLYelSmcWRa9bsdkTnhzyFyUZbAvIcAcErvUeiANnFv5luDUD
	c18Yzp74ekSMiXtjslArS9tBFwm5tUtQXOjJ7+plY8Hpi2J2v59Br8kdkitmc4raqlxAb0LkWfe
	xLNKulwDtqH/tYoD+UnT2c9/JKnBsp9eLUtxdM1eAc4u1piDHod919+RJEginYfO48dOcjb+KhX
	0gUBoQY0+xkilXC4M+L5IUlxGjhEnuJV3560XkmURwi2khfJHTi3qN/T3urglAgiGblV8NjIR95
	Q6J6MOiV12bTdXAitqk7OBObt1UjAWUZL8F8sLyEh5p3Bv0o54+df+xY7PuCO9Z05l2bx7UkiiP
	kHmep/bbd/cleSdneHc398wVVhisCe
X-Google-Smtp-Source: AGHT+IHO+t3FoXc2lmkwuUhyA4zyPzNY8ffbVGOeuhpveHqkdWRdaJHtFzSS0tkKwjisgxNuxB9PgA==
X-Received: by 2002:a05:600c:8185:b0:475:da13:2566 with SMTP id 5b1f17b1804b1-477308a690dmr149519255e9.35.1762257596943;
        Tue, 04 Nov 2025 03:59:56 -0800 (PST)
Received: from Ansuel-XPS. (93-34-90-37.ip49.fastwebnet.it. [93.34.90.37])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429dc18efb3sm4509841f8f.3.2025.11.04.03.59.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Nov 2025 03:59:56 -0800 (PST)
Message-ID: <6909eabc.050a0220.54944.cd03@mx.google.com>
X-Google-Original-Message-ID: <aQnqugwQrqL0WHRU@Ansuel-XPS.>
Date: Tue, 4 Nov 2025 12:59:54 +0100
From: Christian Marangi <ansuelsmth@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Ilia Lin <ilia.lin@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Raag Jadav <raag.jadav@intel.com>, linux-arm-msm@vger.kernel.org,
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] cpufreq: qcom-nvmem: add compatible fallback for
 ipq806x for no SMEM
References: <20251031130835.7953-1-ansuelsmth@gmail.com>
 <20251031130835.7953-4-ansuelsmth@gmail.com>
 <qael7opoqary2n5iqefxxp42v3qoudfhfvcgjyxfe3t7353zge@ahgvniscxl7v>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <qael7opoqary2n5iqefxxp42v3qoudfhfvcgjyxfe3t7353zge@ahgvniscxl7v>

On Sat, Nov 01, 2025 at 12:42:55PM -0500, Bjorn Andersson wrote:
> On Fri, Oct 31, 2025 at 02:08:34PM +0100, Christian Marangi wrote:
> > On some IPQ806x SoC SMEM might be not initialized by SBL. This is the
> > case for some Google devices (the OnHub family) that can't make use of
> > SMEM to detect the SoC ID.
> > 
> > To handle these specific case, check if the SMEM is not initialized (by
> > checking if the qcom_smem_get_soc_id returns -ENODEV) and fallback to
> > OF machine compatible checking to identify the SoC variant.
> > 
> > Notice that the checking order is important as the machine compatible
> > are normally defined with the specific one following the generic SoC
> > (for example compatible = "qcom,ipq8065", "qcom,ipq8064").
> > 
> > Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> 
> Reviewed-by: Bjorn Andersson <andersson@kernel.org>
> 
> And as mentioned in v1, this (cpufreq) patch can be merged independently
> of the first two patches. So please merge it through the cpufreq tree.
> 

I will send a new revision just for this patch so I can use
of_match_node()

Should be ok since it hasn't been picked right?

> 
> > ---
> >  drivers/cpufreq/qcom-cpufreq-nvmem.c | 17 +++++++++++++++--
> >  1 file changed, 15 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/cpufreq/qcom-cpufreq-nvmem.c b/drivers/cpufreq/qcom-cpufreq-nvmem.c
> > index 3a8ed723a23e..5a9bd780a4f3 100644
> > --- a/drivers/cpufreq/qcom-cpufreq-nvmem.c
> > +++ b/drivers/cpufreq/qcom-cpufreq-nvmem.c
> > @@ -257,8 +257,8 @@ static int qcom_cpufreq_ipq8064_name_version(struct device *cpu_dev,
> >  					     char **pvs_name,
> >  					     struct qcom_cpufreq_drv *drv)
> >  {
> > +	int msm_id = -1, ret = 0;
> >  	int speed = 0, pvs = 0;
> > -	int msm_id, ret = 0;
> >  	u8 *speedbin;
> >  	size_t len;
> >  
> > @@ -275,8 +275,21 @@ static int qcom_cpufreq_ipq8064_name_version(struct device *cpu_dev,
> >  	get_krait_bin_format_a(cpu_dev, &speed, &pvs, speedbin);
> >  
> >  	ret = qcom_smem_get_soc_id(&msm_id);
> > -	if (ret)
> > +	if (ret == -ENODEV) {
> > +		/* Fallback to compatible match with no SMEM initialized */
> > +		ret = 0;
> > +		if (of_machine_is_compatible("qcom,ipq8062"))
> > +			msm_id = QCOM_ID_IPQ8062;
> > +		else if (of_machine_is_compatible("qcom,ipq8065") ||
> > +			 of_machine_is_compatible("qcom,ipq8069"))
> > +			msm_id = QCOM_ID_IPQ8065;
> > +		else if (of_machine_is_compatible("qcom,ipq8064") ||
> > +			 of_machine_is_compatible("qcom,ipq8066") ||
> > +			 of_machine_is_compatible("qcom,ipq8068"))
> > +			msm_id = QCOM_ID_IPQ8064;
> > +	} else if (ret) {
> >  		goto exit;
> > +	}
> >  
> >  	switch (msm_id) {
> >  	case QCOM_ID_IPQ8062:
> > -- 
> > 2.51.0
> > 

-- 
	Ansuel

