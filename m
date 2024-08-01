Return-Path: <linux-arm-msm+bounces-27678-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AFEC0944659
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Aug 2024 10:19:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 67341282B02
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Aug 2024 08:19:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F35C616CD0A;
	Thu,  1 Aug 2024 08:19:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pGeZCFcj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C15F16C856
	for <linux-arm-msm@vger.kernel.org>; Thu,  1 Aug 2024 08:19:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722500373; cv=none; b=edhaPJyjMijRUuPXDYYiB4W87b3NecqRvGYqpJQ3JHDWMBkWkwdNx9+pJVBKo2vDT+C+MCHVAxxz39ybR6m28tKsHeYpnVf7EuPjrjDaTgM9S1tPuEGE4FRK0dDftK49wNWO+MmT3ZfC3b8bKP2JzU1wwl1gdWMMlCRkXMB8fLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722500373; c=relaxed/simple;
	bh=sO5RzlUWFQWyLYtQT51QAOWQdgDxj1VtrkS2YOt8ONs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V31KbdkC22JPVUrGk7UOnX+IzmhnSsbBPxNaMz3fwHKaP5i/MINZI5YLjRqSnTvUY461BD6ikCrq+2YsOfbyOReLDGNYRm+mACHEpXLaJj/3E9FfKl2Ur/rQWXgvEfuY6Ks4yZfR179ATHPxzdrvEW4PpWKWx45YLr3jT+sycqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pGeZCFcj; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-530ad969360so2807800e87.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 01 Aug 2024 01:19:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722500370; x=1723105170; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HieJqVdMzMx3NEhnjcblA0j7rcIYuxfissUP0SJYQIQ=;
        b=pGeZCFcjSj6k1tNYxHnvtN8D6ooWNflm19CCduv3KMEdjGOYk9inrf7hvyRWfbFUkl
         sbJBUIjokHos1QUHnkC4rnIuCO2dTooM+NqbmmxAD35GOjJpWO7+r/iaTnWilo2nEfdw
         4Q9m/ucCNxlW7YWuEkBXy/fBkPVXVyv93ECBiX+6+l5voaa2rTZVvZp1c0E2nlWG3wFf
         RS/ELp8mVfhM5m/TaWGkB56SkRPco+pLtNakWiWJ32dpnKy9JuFAUHupU8z4rHs7OWdl
         MICXK79hNhhG6Nq5TO9wnY/vPP3D1iOdiDmRaiT790K1X+zMfV5qsfCtTxKHVx66Lal0
         S0NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722500370; x=1723105170;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HieJqVdMzMx3NEhnjcblA0j7rcIYuxfissUP0SJYQIQ=;
        b=MmxYmlbkhnhgW2U6YN1gVf1LC29ok+zS2xxuoe+bQdL0fKiA+E87OARvFcUf2GxDhK
         EfEa9OC98/dXZeRcIeBgNuziVK4Y8kSlYkHPyChrqxTWW/WQU4IeJr/CPjw7YWJ9JSVU
         mr9x8NqAocnJAQxSkthpgK4p8Sd/Uz5gd1PffN4ikKs/2pmFcrLMgb9L4A4gM2N62DJc
         nEIxoZjibR31ebeVm+mFDWHajA1O5ytt9lJKt17Q4wUgJlkb8NLa78P92AA2rn0Pr5MW
         K0JkZPoYqmMhqUm+9cv+/sDUor5t6NljIrHyy84uVy2ZwNZpFA+IMnqONd1yNWKjOpU+
         Ojrw==
X-Forwarded-Encrypted: i=1; AJvYcCULx5d8BPiT9WRoBM3Ht6u4wGg7mSp4G26cti/QTWvZ+nj1X1zy+yIDfJn7IKJUot1CZAB0+rCmPaG52Xim9a3FfTORGzWzQh/ULStd2Q==
X-Gm-Message-State: AOJu0YwnwjMRYJ+8EzVqD/H3WfVWMfJsvEhwUBnmVz5M2TOYQl2OAn72
	I8C6L3m+FwWOsUxThy1754G0M1ri6G/sUHo2urWSeafIZAKRHJ6tgdu0fHW/Ofc=
X-Google-Smtp-Source: AGHT+IHxwDRo4bANeGwuRF2uqlCxOH1WiG0myhUGRgNk9KvigLXA58tyO2IFTgWT4iS9vwJonFHhhA==
X-Received: by 2002:a19:ca1b:0:b0:52c:d5b3:1a6a with SMTP id 2adb3069b0e04-530b61bc63dmr789459e87.28.1722500370111;
        Thu, 01 Aug 2024 01:19:30 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52fd5bc4331sm2522097e87.21.2024.08.01.01.19.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Aug 2024 01:19:29 -0700 (PDT)
Date: Thu, 1 Aug 2024 11:19:28 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Elson Serrao <quic_eserrao@quicinc.com>
Cc: andersson@kernel.org, konrad.dybcio@linaro.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, gregkh@linuxfoundation.org, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org
Subject: Re: [PATCH 7/8] usb: misc: eud: Handle usb role switch notifications
Message-ID: <dhdxb4kiwsnsyqjhcfj2iglwwlubf5wajg4jggu35zq7hxm54p@tj2snlcnejdg>
References: <20240730222439.3469-1-quic_eserrao@quicinc.com>
 <20240730222439.3469-8-quic_eserrao@quicinc.com>
 <5nsextq3khhku3xfdwwj74wmx5ajyqhjyarfpnpa6i2tjx76ix@z7lpip6pi6re>
 <0c769a55-0fb7-4734-86b1-9469b4cc7b8c@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0c769a55-0fb7-4734-86b1-9469b4cc7b8c@quicinc.com>

On Wed, Jul 31, 2024 at 05:51:17PM GMT, Elson Serrao wrote:
> 
> 
> On 7/31/2024 6:06 AM, Dmitry Baryshkov wrote:
> > On Tue, Jul 30, 2024 at 03:24:38PM GMT, Elson Roy Serrao wrote:
> >> Since EUD is physically present between the USB connector and
> >> the USB controller, it should relay the usb role notifications
> >> from the connector. Hence register a role switch handler to
> >> process and relay these roles to the USB controller. This results
> >> in a common framework to send both connector related events
> >> and eud attach/detach events to the USB controller.
> >>
> >> Signed-off-by: Elson Roy Serrao <quic_eserrao@quicinc.com>
> >> ---
> >>  drivers/usb/misc/qcom_eud.c | 91 ++++++++++++++++++++++++++++---------
> >>  1 file changed, 69 insertions(+), 22 deletions(-)
> >>
> >> diff --git a/drivers/usb/misc/qcom_eud.c b/drivers/usb/misc/qcom_eud.c
> >> index 3de7d465912c..9a49c934e8cf 100644
> >> --- a/drivers/usb/misc/qcom_eud.c
> >> +++ b/drivers/usb/misc/qcom_eud.c
> >> @@ -10,6 +10,7 @@
> >>  #include <linux/iopoll.h>
> >>  #include <linux/kernel.h>
> >>  #include <linux/module.h>
> >> +#include <linux/mutex.h>
> >>  #include <linux/of.h>
> >>  #include <linux/phy/phy.h>
> >>  #include <linux/platform_device.h>
> >> @@ -35,12 +36,16 @@ struct eud_chip {
> >>  	struct device			*dev;
> >>  	struct usb_role_switch		*role_sw;
> >>  	struct phy			*usb2_phy;
> >> +
> >> +	/* mode lock */
> >> +	struct mutex			mutex;
> >>  	void __iomem			*base;
> >>  	void __iomem			*mode_mgr;
> >>  	unsigned int			int_status;
> >>  	int				irq;
> >>  	bool				enabled;
> >>  	bool				usb_attached;
> >> +	enum usb_role			current_role;
> >>  };
> >>  
> >>  static int eud_phy_enable(struct eud_chip *chip)
> >> @@ -64,6 +69,38 @@ static void eud_phy_disable(struct eud_chip *chip)
> >>  	phy_exit(chip->usb2_phy);
> >>  }
> >>  
> >> +static int eud_usb_role_set(struct eud_chip *chip, enum usb_role role)
> >> +{
> >> +	struct usb_role_switch *sw;
> >> +	int ret = 0;
> >> +
> >> +	mutex_lock(&chip->mutex);
> >> +
> >> +	/* Avoid duplicate role handling */
> >> +	if (role == chip->current_role)
> >> +		goto err;
> >> +
> >> +	sw = usb_role_switch_get(chip->dev);
> > 
> > Why isn't chip->role_sw good enough? Why do you need to get it each
> > time?
> >
> 
> Hi Dmitry
> 
> chip->role_sw is the eud role switch handler to receive role switch notifications from the
> USB connector. The 'sw' I am getting above is the role switch handler of the USB controller.
> As per this design, EUD receives role switch notification from the connector 
> (via chip->role_sw) and then relays it to the 'sw' switch handler of the USB controller.

The fact that you have repurposed existing structure field is not a
waiver for the inefficiency.

So what about keeping chip->role_sw as is and adding _new_ field for the
self-provided role switch?


-- 
With best wishes
Dmitry

