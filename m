Return-Path: <linux-arm-msm+bounces-30262-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 88F5C96652A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Aug 2024 17:20:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AE2601C211E7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Aug 2024 15:20:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A4781B1D42;
	Fri, 30 Aug 2024 15:20:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JcDCZ7+Z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A47A716DED8
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Aug 2024 15:20:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725031206; cv=none; b=AuB+XUXIv8FcSa6Wc0DpyMRxISvCsWL+ar+j+9TivYf6Zs0NgN/E2ozsWBf+1RY2DXMivT5hS0ncBFRlyL87+XDywMA+9gFIaoWjv2yjaSXw3ygzauA3aJAazP+CtLI+Do10IaQ1j11jGkI1IlFrwWMYoOvtr7CPkwjUGbdFmcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725031206; c=relaxed/simple;
	bh=IZVb7HUaCckefGq1d8dAOvfWHArhc/80owEl5Mr2oQw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ED/1atspPw4A6t+80mIIw/26tA3SxSJ8419gWGsvihrHmonyQydbyqffNPZYuwFuffaI3qNEaGbNaxBMNhc+9KMGhUFa31QpKV3vgYBUrhVmeuI52rMAl2QCmJnu8paMyfzWv3AHNpZiN1RuQ/5NkVNapHVAPDuyvXgAZObJtC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JcDCZ7+Z; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-42bbd0a40faso5746165e9.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Aug 2024 08:20:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725031203; x=1725636003; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=o8gDLcdemCUhQhHJ5CRUyOJRFqr6ikAul9YHR14ZnX4=;
        b=JcDCZ7+ZuSXm0WXznXgTx/q4uSZ0Z7S5HhatkuxkxpAGBa+DKo76FWjSAdZtLHZOoK
         9c45KplkwD/8RlS7hrMS0XKaylXWwxkPsk/z5FYn9P27tFoWDrEjHRsq4bkXOXPJgGSv
         fyLrO9TJ3wb/P6g+W6AlUFlPQxzZj6Hhucm6RPyhBhF+L1fDIXr0K0XyVvmUlCNGUxfh
         EZbUAKL+JTTWjwy0RdUttGtQn/PoS9/y8hPMYur0yeP8tGa+DTN1xsAw2oN7KFo0Q6VW
         MOF/A3HCpi5gzInorz7Izc/fu/egUUAjuG8ZEKLl9AjQuIxv1QHGkKyZdwCZm521Glpi
         OObg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725031203; x=1725636003;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o8gDLcdemCUhQhHJ5CRUyOJRFqr6ikAul9YHR14ZnX4=;
        b=YSz5R5B/8tFnYPdtFCtWrKXgFgM393jJhS3wGAiNkhkDQr2Db1hIYr+NOXcwrzXfyn
         HJxKAre/Hpg+CfSKNABIPc1F4gBlzVsfJCNcjdJ9UZS+Kz+t8sgK4QhxvxJLtuail3j4
         LDGxAHmmeCgxUnsaF71bqas1o71En5rviW+k/lVxv/g0GemxrN9II5wtopI4LHaeFxOj
         IfMQm8d1u1w13jsPW4D4ljM3tE3+JrwY+yeW67xDp/Y456vZUTlNelLQMe4xsEma/XdC
         czL37oxuqUonUchf5c2pdcRbJUXrmXw8LrY9kU9xCCZDT1qg6n23D/KFDBRzWHy0N9WW
         eGTg==
X-Forwarded-Encrypted: i=1; AJvYcCX9x8a8l+C1SzmhNDPyBFzSvZv2R6UMevirbvxjo2Qoay9bpW2KCZjwP1QLg7KWwu9sdhxOTd/nUyWuuoIc@vger.kernel.org
X-Gm-Message-State: AOJu0YzSkqRN3yHc3YKcLkyHyfMc+f202H97HA4ZIuS2JTFxuIgIXD8T
	yWU0CGu+8+u5wzC+Islx6XyhjzmyhMkC2OQgSO/Ezihy698PVx3BRLHHIADcEOM=
X-Google-Smtp-Source: AGHT+IGa2f7spyxbcRGnpXyEx6q7etRa1xCqAahHQAa+kiLePXz7HVlF3+WsMhp6MCjFv1+atTgi0A==
X-Received: by 2002:a05:600c:474c:b0:428:1965:450d with SMTP id 5b1f17b1804b1-42bb02a82c4mr55229275e9.17.1725031202813;
        Fri, 30 Aug 2024 08:20:02 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42ba642594dsm84203405e9.47.2024.08.30.08.20.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Aug 2024 08:20:02 -0700 (PDT)
Date: Fri, 30 Aug 2024 18:19:56 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Yu Jiaoliang <yujiaoliang@vivo.com>,
	Bjorn Andersson <andersson@kernel.org>,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	opensource.kernel@vivo.com
Subject: Re: [PATCH v1] soc: qcom: pbs: Simplify with dev_err_probe()
Message-ID: <63162b67-22ef-482f-9600-861e9dbaf4fc@stanley.mountain>
References: <20240829124813.3264437-1-yujiaoliang@vivo.com>
 <894145dc-46fb-451f-a461-d0b9ff1e50dd@kernel.org>
 <10fad15b-d2a6-4ec1-8af7-bde8f7bf39be@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <10fad15b-d2a6-4ec1-8af7-bde8f7bf39be@kernel.org>

On Fri, Aug 30, 2024 at 12:03:20PM +0200, Konrad Dybcio wrote:
> On 30.08.2024 10:08 AM, Krzysztof Kozlowski wrote:
> > On 29/08/2024 14:48, Yu Jiaoliang wrote:
> >> Error handling in probe() can be a bit simpler with dev_err_probe().
> >>
> >> Signed-off-by: Yu Jiaoliang <yujiaoliang@vivo.com>
> >> ---
> >>  drivers/soc/qcom/qcom-pbs.c | 7 +++----
> >>  1 file changed, 3 insertions(+), 4 deletions(-)
> >>
> >> diff --git a/drivers/soc/qcom/qcom-pbs.c b/drivers/soc/qcom/qcom-pbs.c
> >> index 77a70d3d0d0b..ab9de12ec901 100644
> >> --- a/drivers/soc/qcom/qcom-pbs.c
> >> +++ b/drivers/soc/qcom/qcom-pbs.c
> >> @@ -201,10 +201,9 @@ static int qcom_pbs_probe(struct platform_device *pdev)
> >>  	}
> >>  
> >>  	ret = device_property_read_u32(pbs->dev, "reg", &val);
> >> -	if (ret < 0) {
> >> -		dev_err(pbs->dev, "Couldn't find reg, ret = %d\n", ret);
> >> -		return ret;
> >> -	}
> >> +	if (ret < 0)
> >> +		return dev_err_probe(pbs->dev, ret, "Couldn't find reg\n");
> > 
> > This cannot defer, so not much benefits. And you ignore other place in
> > the probe()... That's like a weird pattern with all your patches change
> > something irrelevant, but leave other places unchanged.
> > 
> > That's pointless and churn.
> 
> Hm, that's a good point.. Maybe the static checker folks could come up
> with a way that would find functions that call something that can defer
> at one point or another and suggest (not) using dev_err_probe with W=1/2..
> (although that is probably not going to be very high prio given all the
> other static checker issues we're still yet to resolve)
> 
> Unless we have something like that already? +CC Dan

I believe these patches are from people writing their own Coccinelle scripts to
do the conversions.  There aren't any published scripts which care one way or
the other.

device_property_read_u32() can't return -EPROBE_DEFER.  It's documented in a
comment.  So this is just a question of preferred style.  There isn't a kernel
wide preferred style on this.  Some maintainers prefer to not use dev_err_probe()
where it "doesn't make sense because ret isn't -EPROBE_DEFER".  Other maintainers
use it all the time even for error code literals like:
	return dev_err_probe(pbs->dev, -EINVAL, "invalid input.\n");
Because "it's cleaner, more uniform and only takes one line".  I think Julia
said she didn't want to get involved with this debate and I definitely don't.

There are a few things which we could do:

1) Returning -EPROBE_DEFER to an ioctl or something besides a probe()
   This is a bug right?  -EPROBE_DEFER is basically kernel internal for probe()
   functions.  It tried to write this but it was complicated so I gave up.

2) Printing an error message for -EPROBE_DEFER warnings
   I've written this check and I can test it tonight.

3) Not propagating the -EPROBE_DEFER returns
   This shouldn't be too hard to write.

Let me add a KTODO in case anyone wants to do this before I get around to it.

KTODO: write Smatch EPROBE_DEFER warnings

regards,
dan carpenter



