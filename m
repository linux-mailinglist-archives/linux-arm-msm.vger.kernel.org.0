Return-Path: <linux-arm-msm+bounces-24591-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C7B1A91BA0D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Jun 2024 10:34:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 03E271C23689
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Jun 2024 08:34:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41F85152799;
	Fri, 28 Jun 2024 08:32:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hfKvL5gl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27B6B14F9D9
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Jun 2024 08:32:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719563549; cv=none; b=jcy7RvvJw/BhhIW0Dp5d1ijr9UA7jASrbUVuVdPRvEYhFpT9DZGbVyR0dkY0PwDd8ux+6OngrC7vG8YHtOQq+lDpHmcHqEyTdPqo9a7aGB5URYj0K6prx3a1h417MGDFzcx2I6zC0xhi9+CXxpF0jrKQnuUHZoPyWls5QFLWlKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719563549; c=relaxed/simple;
	bh=r7+eakRvT7ZiZ9WyL9rTTM6ysWPSIZYFNimdjEgNIJM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gI3NrZJivY7BWW9YEOGc1NsvOMdb9mZNUnaWijvPN6Rvpr1HAHW43l6Z5CxGr8+nVWMeC8CltIWFOY1j2QJsk0yjqju5xZxIv9kPThm2+qdolqN0PdbtIUqiVk45c1Ku9IanDtOuRlc3X3RoV6kYubHcTE7dP33ptyuGAob1zVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hfKvL5gl; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5295eb47b48so457899e87.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Jun 2024 01:32:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719563545; x=1720168345; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RJwxeW+GDgd+YjrwH0bRPELomJst4fhgHNABgR77E/Q=;
        b=hfKvL5glJDWnkKCm3Pt3eedbEmaBuw/7vyCk3OJF9HGv9Ejiav107XtJRaoLPNwhCL
         iFXdyy1BmoZHSSLowdvwOqnsHlrIYE+f43kdkrUWdAitJHMZIVrf2ZQ1BgjZSAT3/FCa
         l959aEQhv82XzlWxSnBKtmAHNBiYuP/1Rd0nBSDKcxJfBhIMaDuNkNspmTQv2RsqKnu+
         Ep4QlT78UaLmdgzKIzK5uqem0ABVikJ+s7OodD7AaLuynb4Ee9sOci+QAm5sphY6il77
         F5yIBE6DgooLxFKvsmsCL9ghj80UidYQTSr+KXPfvwQrPp0B7ETLJKhItPKXt6HDtLN3
         xNJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719563545; x=1720168345;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RJwxeW+GDgd+YjrwH0bRPELomJst4fhgHNABgR77E/Q=;
        b=nJXjbgBPvjDkwnEZR2/DRXbgo1+La6JbjZyHJ8HcohILF/t5/AYnMhj2vxv8rVvfP8
         XpL9XorcBbhfZlyMsZH8a8OE5AgX7YRBX+4B0FID7U0nil9yLFCfZMawLkO6NFpznEzZ
         Xw6HgYTStWE2ODObo00yTYO6cELCcGujCrA1kne6JXSXTtGYylgOfVGYKcwJRqfeynMP
         WW5ZE/AA7UArZtZqSmH1VWeG8LjPDqpkOEUveKqeSh2ax5ZtK7wFWYq2AbGQRw7rhEzq
         d2GRw4xC0SWEyz0bgqB4Ygp5wJ0fF3p4xkYOCqiJfSk+p6pjCRNz77T16MZnpsQcS9X1
         Xa4Q==
X-Forwarded-Encrypted: i=1; AJvYcCXMFa4O6NzDE59nr9FDZ1dItx9dUt0YfkJgi+7LMnwhFmaawZt+vV7wlYyVA+uGRy1FJ1x5FyZ3xmW1aYrmyzGr9G7EigE9JfrStOGXZg==
X-Gm-Message-State: AOJu0YzaYx4Lg6UlNOKTIlcWn7hdfaYzKZ+R6QmYxKhNblVKi2bhflHc
	rKmOmJHtnExvEuCNRfzzQqx3Gwk8eeMDbQ34nzRFiu4EpaSw11OvPvFtzfeO3uI=
X-Google-Smtp-Source: AGHT+IEBqgq8/ijDLYuWtZgrlxH0PdT/BNEB0C1UNr460C7LtzL4BXpKkJbR3oMqpmu0RY60Od9/Ag==
X-Received: by 2002:a19:ee17:0:b0:52c:def6:7c97 with SMTP id 2adb3069b0e04-52ce064146emr10914325e87.45.1719563545317;
        Fri, 28 Jun 2024 01:32:25 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52e7ab3b4cdsm208851e87.294.2024.06.28.01.32.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jun 2024 01:32:24 -0700 (PDT)
Date: Fri, 28 Jun 2024 11:32:23 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: gcc-x1e80100: Set parent rate for USB3 sec
 and tert PHY pipe clks
Message-ID: <6fr22a5ehq2vcd2ueeaphtzhauscpaj4llt2j62cj5m5wydw32@6ma244renp33>
References: <20240530-x1e80100-clk-gcc-usb3-sec-tert-set-parent-rate-v1-1-7b2b04cad545@linaro.org>
 <3ukguewuqqm5gmbd3afl62ihysdzkk44j3f2nuqht4gjuf5ruo@zu7jmmnbrpdj>
 <Zn5w9zKxIT/2OvB4@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zn5w9zKxIT/2OvB4@linaro.org>

On Fri, Jun 28, 2024 at 11:14:47AM GMT, Abel Vesa wrote:
> On 24-05-31 02:56:12, Dmitry Baryshkov wrote:
> > On Thu, May 30, 2024 at 05:05:24PM +0300, Abel Vesa wrote:
> > > Allow the USB3 second and third GCC PHY pipe clocks to propagate the
> > > rate to the pipe clocks provided by the QMP combo PHYs. The first
> > > instance is already doing that.
> > 
> > Which driver changes the rate of those clocks?
> 
> Sorry for the late reply.
> 
> These clocks are consumed by the combo PHYs, so driver is
> phy-qcom-qmp-combo. This driver doesn't change the rates of the pipe
> clocks as of yet.
> 
> The fix is still good, even if it's just to align all three clocks.
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry

