Return-Path: <linux-arm-msm+bounces-25387-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 96809928B78
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Jul 2024 17:18:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 23A311F252DF
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Jul 2024 15:18:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8450216C6AE;
	Fri,  5 Jul 2024 15:16:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="W3XEmMPl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1F1816C686
	for <linux-arm-msm@vger.kernel.org>; Fri,  5 Jul 2024 15:16:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720192617; cv=none; b=BndnMZAXoFRhro18oZy7PFrmYkeOls9hYf2N7SRTXDWZFnK1nzCP5h1A5YUfXxtyKgAWyNXSCy7PYgGCnIaiSmgDOKHJTYtniqplD1fk1SvMn+gFJmp4Ha06E8R4cOQ44AX530uJtNxggnHycm9D7yhSmVixS0k47DvC7KHzHNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720192617; c=relaxed/simple;
	bh=1SJmi6roK53nVSxDpk01R+5CCMtW24rzBmgbVvZa2Uo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JkX6UjRpfD3D4BduAa9ZSbg+Ia0LwyaKpQIGuMW/8qKWmd2Kgc1TToIdmAgTpwowgzq5ahQRMCxD0tFqtb3fhAsU/gLfZR4BawGvy1IXHNpMgZZkMxfckspU8CxzT7ycu/fFbi5DUzY4twyQSiGpI8Xzzxmccv9vj/XxFpHfqTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=W3XEmMPl; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-52ea2f58448so1840646e87.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Jul 2024 08:16:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720192614; x=1720797414; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jAi8Yh8H6kvgELJJaleTT1aA4PEdcZWxJ8yjwouMUBU=;
        b=W3XEmMPlaruFF4HyT9k2xhRRwhbpFg4N6Qmi4Z7vyUphmTXgvE1GJ1rrnHdqX1nZSW
         cxAYuxauplJPOV6l0XNM8Gph55reSYZOSVZhxQscmVkxNUK1sZwH9+w/7d7UxKvGIqTX
         9C16hJpgv2Fa4Hp7vAbA6ZQmZlQySk3haIkl66qeDCbrBq0eXVU5v1AJJglkc2oVPA8u
         B7Wm9DkOC03RTnKqf8JvhH6A3EUid+bIvtjrOZjp5XTx1u7Ox1lHOlFT1B/Nwp9sskOk
         em699gf9hAuF6SO8fuac4wlVD3Owi4Bw3yuWTvyl4fCaGuZQs9/lkt22qLdXp9184zuN
         Av/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720192614; x=1720797414;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jAi8Yh8H6kvgELJJaleTT1aA4PEdcZWxJ8yjwouMUBU=;
        b=doaND1cuqA6ralDFWDOh6kB1yIdGP0sXRSl+Z7F19HM2ZERzeI32dkIzbdFACbSh2C
         F8fbkYEPuEX50VIr0QH64zUUkp+skd5/JT6sYdT9NZfaUe1rwN5w8q/3AA82rflmHLF9
         52wPGs/zJHwM7BPnm+mdq3pTw8ZBYvTF0/ss7RMSgeWURDEOCpMGsLmN01Gm5p3Ur5sp
         aCm6UKsH3GR+eyiRCGN0zyC3QCHkVmabYr/sAzZxY1rtxAC0eodfsXmHmdmZKzqy8Toa
         IJ3bxte+d22HHFaA4fEwc44WAEgaEmFJjzCQEMmIW+cMskgyjIzSkkvvRdJ1VQ0TiSmS
         J8pA==
X-Forwarded-Encrypted: i=1; AJvYcCVkuK701lLDCCtirBjM8jT0nJHZAHorLzjqF9C5AxfNi5wpQBFK9Ndwf0MKbC+jWll9gdapfJwKHbgaj+uFWwrfh6Daa6Yoo0fFxNjoDQ==
X-Gm-Message-State: AOJu0YxxZGoIM8rKm79QteNCxfi+iGSOZJXUEQPkjjsA0mB6zT7bzSE/
	tnNvFVACl9588n1ygpJnSAXjmih4+qFeKMorc3xC21e1kmI9t+/T/7mBJeoYbmM=
X-Google-Smtp-Source: AGHT+IFF0x3NMy9LMtTvla/+V+TLaDM4vdzLOeeF5CqOS6ZS3ehsuSFZ/VTsszSK87chi/FZYGvU/g==
X-Received: by 2002:a05:6512:3da3:b0:52c:db80:d694 with SMTP id 2adb3069b0e04-52ea0626e92mr4204523e87.20.1720192613739;
        Fri, 05 Jul 2024 08:16:53 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52e9baf8e26sm730057e87.128.2024.07.05.08.16.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jul 2024 08:16:53 -0700 (PDT)
Date: Fri, 5 Jul 2024 18:16:51 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Varadarajan Narayanan <quic_varada@quicinc.com>
Cc: vireshk@kernel.org, nm@ti.com, sboyd@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, angelogioacchino.delregno@collabora.com, 
	andersson@kernel.org, konrad.dybcio@linaro.org, mturquette@baylibre.com, 
	ilia.lin@kernel.org, rafael@kernel.org, ulf.hansson@linaro.org, 
	quic_sibis@quicinc.com, quic_rjendra@quicinc.com, quic_rohiagar@quicinc.com, 
	abel.vesa@linaro.org, otto.pflueger@abscue.de, danila@jiaxyga.com, 
	quic_ipkumar@quicinc.com, luca@z3ntu.xyz, stephan.gerhold@kernkonzept.com, nks@flawful.org, 
	linux-pm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v4 01/10] soc: qcom: cpr3: Fix 'acc_desc' usage
Message-ID: <bsr6l33xllblwwoa3ftbldxvqwe6tcljt3ek2petoc4hc5xgsg@b36fw3wetj5f>
References: <20240703091651.2820236-1-quic_varada@quicinc.com>
 <20240703091651.2820236-2-quic_varada@quicinc.com>
 <u4hzxnecdyow6h4vhddcp53tuxrqhbqu6cv4cznytihsyshzy4@lqxhsn3qvjbz>
 <ZoYsguLOCnZjxOku@hu-varada-blr.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZoYsguLOCnZjxOku@hu-varada-blr.qualcomm.com>

On Thu, Jul 04, 2024 at 10:30:50AM GMT, Varadarajan Narayanan wrote:
> On Wed, Jul 03, 2024 at 01:46:54PM +0300, Dmitry Baryshkov wrote:
> > On Wed, Jul 03, 2024 at 02:46:42PM GMT, Varadarajan Narayanan wrote:
> > > cpr3 code assumes that 'acc_desc' is available for SoCs
> > > implementing CPR version 4 or less. However, IPQ9574 SoC
> > > implements CPRv4 without ACC. This causes NULL pointer accesses
> > > resulting in crashes. Hence, check if 'acc_desc' is populated
> > > before using it.
> > >
> > > Signed-off-by: Varadarajan Narayanan <quic_varada@quicinc.com>
> > > ---
> > > v4: Undo the acc_desc validation in probe function as that could
> > >     affect other SoC.
> > > ---
> > >  drivers/pmdomain/qcom/cpr3.c | 4 ++--
> > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/drivers/pmdomain/qcom/cpr3.c b/drivers/pmdomain/qcom/cpr3.c
> > > index c7790a71e74f..6ceb7605f84d 100644
> > > --- a/drivers/pmdomain/qcom/cpr3.c
> > > +++ b/drivers/pmdomain/qcom/cpr3.c
> > > @@ -2399,12 +2399,12 @@ static int cpr_pd_attach_dev(struct generic_pm_domain *domain,
> > >  		if (ret)
> > >  			goto exit;
> > >
> > > -		if (acc_desc->config)
> > > +		if (acc_desc && acc_desc->config)
> > >  			regmap_multi_reg_write(drv->tcsr, acc_desc->config,
> > >  					       acc_desc->num_regs_per_fuse);
> > >
> > >  		/* Enable ACC if required */
> > > -		if (acc_desc->enable_mask)
> > > +		if (acc_desc && acc_desc->enable_mask)
> > >  			regmap_update_bits(drv->tcsr, acc_desc->enable_reg,
> > >  					   acc_desc->enable_mask,
> > >  					   acc_desc->enable_mask);
> >
> > Should the same fix be applied to other places which access acc_desc?
> > For example cpr_pre_voltage() and cpr_post_voltage() which call
> > cpr_set_acc()?
> 
> With this patch alone, if acc_desc is NULL, cpr_probe() will fail
> at the start itself because of this check
> 
> 	if (!data->acc_desc && desc->cpr_type < CTRL_TYPE_CPRH)
> 		return -EINVAL;
> 
> After applying this patch series, cpr_probe will cross the above
> check to accomodate IPQ9574. However, the check below will ensure
> drv->tcsr is not initialized.
> 
> 	if (desc->cpr_type < CTRL_TYPE_CPRH &&
> 	    !of_device_is_compatible(dev->of_node, "qcom,ipq9574-cpr4"))
> 
> cpr_pre_voltage() and cpr_post_voltage() call cpr_set_acc() only
> if drv->tcsr is not NULL. Hence acc_desc need not be checked.
> 
> Will add the check to cpr_pre_voltage() and cpr_post_voltage() if
> you feel it will make it more robust regardless of the changes to
> cpr_probe in future. Please let me know.

Having !acc_desc check instead of the of_device_is_compatible would
solve the issue.

-- 
With best wishes
Dmitry

