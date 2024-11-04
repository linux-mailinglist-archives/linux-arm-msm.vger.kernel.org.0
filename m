Return-Path: <linux-arm-msm+bounces-36982-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DCDC9BBE32
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Nov 2024 20:43:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AE0EF1F22878
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Nov 2024 19:43:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E78741CBE9E;
	Mon,  4 Nov 2024 19:43:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VmfPBbWV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 168A71CC14C
	for <linux-arm-msm@vger.kernel.org>; Mon,  4 Nov 2024 19:43:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730749387; cv=none; b=okVK+Cc3Y7KFxi8+KaWj1LkXmPoCgpjnVGXclUoSm36f4L9r8+we4v9/x0VU02Khdj51IjA0IRJagnsl4MMPtDedK2JJpQbxskOjv2ABJXjsSfduWQlYy3Fau7lppi4OE+t1I+Tq+DxN7hzzEksGuiyIeS++P2OECAl02eoIkiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730749387; c=relaxed/simple;
	bh=8uG7NxRiDTkmNi/k3Lc393uYuyIs9n9TqQj13yylhtU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rrbZQzLxK1u2byzwufaZahSKwbxw3v1Ne5UtH5+cpLIRvhj5KoMT+Vh3hXe/YHxv+xB2tDZEHjcNbxayna9TjIZ/nm/Fha4zTy4mkzuRGHGjIf9+3Hf+r2Fc8uQKTQzAT47K4hpE6HIPcrwbo5O5WGFmbyvO0sZuOizEwu26suI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VmfPBbWV; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-539e4b7409fso4370678e87.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 Nov 2024 11:43:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730749384; x=1731354184; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=s1sFhrTq8uXHX1JSiq0qHtdmt7NVWrhKHjYOI9pukmc=;
        b=VmfPBbWV+Y7kJjDJauKgm8FESToE5jP/5szRxkDqZ+rNlVpx4AqL4iuUI1NjzCx58t
         czoDJsC1PfOAIEg3l/p0wrzlcb9IZ8I+1Bs0Nd6yop0YdnU/DBhh0++YGr3zBWrCaggE
         Mp5gZe9JiUryM+umH6x2oFkpsJPgXEJmNv1+odvpRJmBJu8eczvJlk0K44s+/APcEjW3
         vGPq/YT3XAKjLreyiTO9pFBagXcLRg1FWowetkTB4ianJ6eQev6Y3tHD/OWf+Np+Xzy+
         N/Ec+GBxlWQWt76Eb+Aawfp02rBaEeRnkZhmhd5vtcEmXR4t1IJUoI9S0E5VNlHfSbhB
         Urtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730749384; x=1731354184;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s1sFhrTq8uXHX1JSiq0qHtdmt7NVWrhKHjYOI9pukmc=;
        b=p9YRL3iDiRNiktLOe9Db6ZJPm+OD2piIm3YpQXsddkUyEo0N3X+PnSgKRWqp4IHSCh
         8G4z4llM/2Mx2ivKajJZ/qeaN4H4201c8CIstBAAK1UxsIJMOj1bK/drUMLnlpW6VbWx
         HzlhlkxfPbAdwbhjn09RVAGGuk0IRvWO0J//dvtZ8AjSr4WbVdwIkZwnfLR2R8a1Tm8s
         fZ1xLMHj/EJSvEQyVGhc09EHCom7P9wBbioTmt7lRbtSMjPjWK6jFx6yJeQ8uF+tr3UJ
         Ezv6Tnbp59tGxM2y5aL98Nlc7gfh9JRKNpMidbYm/CngsnvFSHySCNqQqMb7wW8f8/s0
         DDSg==
X-Forwarded-Encrypted: i=1; AJvYcCW4GGrUzVjh3p98d4PLrwtCiaYdVGSYVVQufo+724P0djqC1MbQiTBQ6HYl7SUlxo/6xz7UUu+9RMCFMlTn@vger.kernel.org
X-Gm-Message-State: AOJu0YzU9dLhxulF3QYTmV4djUDW8kgLipriTR+iZZr+4z+B0XTdMli/
	nUObXIwN+HMj4dWGKWY/Wxc5hfbJoKSqRE8yMyDDhlg+mQyGLReAxRQeb6PjN5M=
X-Google-Smtp-Source: AGHT+IFZD2ro3n38RZgJEeButltGS7jnHlfd1LciHrIxyNlhnIpQcrJDRg1Oac/Uo3ZixI3UAEfGBQ==
X-Received: by 2002:a05:6512:3ba4:b0:539:fde9:4bca with SMTP id 2adb3069b0e04-53d65dc727amr4209246e87.29.1730749384058;
        Mon, 04 Nov 2024 11:43:04 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53c7bdd03casm1831187e87.242.2024.11.04.11.43.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Nov 2024 11:43:02 -0800 (PST)
Date: Mon, 4 Nov 2024 21:43:00 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Johan Hovold <johan@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] firmware: qcom: scm: rework QSEECOM allowlist
Message-ID: <4iogtv4wqrvq54c2jqryrtivamn7ymz7alxkwmlfnrywli5v63@axjojnidvn3n>
References: <20241103-rework-qseecom-v1-0-1d75d4eedc1e@linaro.org>
 <20241103-rework-qseecom-v1-2-1d75d4eedc1e@linaro.org>
 <02171841-acd3-4f26-987d-1376caf11481@oss.qualcomm.com>
 <Zyi67e5Os0RhXNjn@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zyi67e5Os0RhXNjn@hovoldconsulting.com>

On Mon, Nov 04, 2024 at 01:15:41PM +0100, Johan Hovold wrote:
> On Mon, Nov 04, 2024 at 12:23:57PM +0100, Konrad Dybcio wrote:
> > On 3.11.2024 4:37 PM, Dmitry Baryshkov wrote:
> 
> > >  static const struct of_device_id qcom_scm_qseecom_allowlist[] __maybe_unused = {
> > > -	{ .compatible = "dell,xps13-9345" },
> > > -	{ .compatible = "lenovo,flex-5g" },
> > > -	{ .compatible = "lenovo,thinkpad-t14s" },
> > > -	{ .compatible = "lenovo,thinkpad-x13s", },
> > > -	{ .compatible = "lenovo,yoga-slim7x" },
> > > -	{ .compatible = "microsoft,arcata", },
> > > -	{ .compatible = "microsoft,romulus13", },
> > > -	{ .compatible = "microsoft,romulus15", },
> > > -	{ .compatible = "qcom,sc8180x-primus" },
> > > -	{ .compatible = "qcom,x1e80100-crd" },
> > > -	{ .compatible = "qcom,x1e80100-qcp" },
> > > +	{ .compatible = "qcom,sc8180x", .data = (void *)true },
> > > +	{ .compatible = "qcom,sc8280xp", .data = (void *)true },
> > > +	{ .compatible = "qcom,x1e80100", .data = (void *)true },
> > >  	{ }
> > >  };
> > 
> > + Steev I think you had some unhappy machine
> > 
> > And maybe 8180 Primus?
> 
> I have a sc8280xp crd here where variables can only be read, not stored
> (e.g. similar to the Lenovo Yoga C630). In it's current configuration
> the machine boots from UFS and this could possibly be related to how it
> has been provisioned, but this is the reason why "qcom,sc8280xp-crd" is
> not already in the above list.

Ok, so we need to add RO support first. Good point (that was pending for
c630 too, as you remember).

-- 
With best wishes
Dmitry

