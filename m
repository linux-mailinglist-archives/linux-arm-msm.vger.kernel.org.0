Return-Path: <linux-arm-msm+bounces-24584-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2382F91B99D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Jun 2024 10:14:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D23E7280F96
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Jun 2024 08:14:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA610145FEF;
	Fri, 28 Jun 2024 08:14:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PAn8MuQD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04C1914373A
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Jun 2024 08:14:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719562492; cv=none; b=m6oF0WC90Bl8p92mB8QulgJELBHu+rjN13E9d5BErbWoDJDVoWkdbBG4BC8rbn0KQkeCuyOFmqA6OtYRrSkX3xt2cLqyOrgddGjc2R96rST4qwuyZZlDXuKrvpb+k4ymD0DO3wS2NX3skCLuIAB+v44HBsyIi/uHTfz3fhIwuMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719562492; c=relaxed/simple;
	bh=aIFPuYhbMEspAOzXfR/bH+Fm5KNxHLFrbI/0BWwUaQg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iCjDA9uXuncQmoQNm2j2jPT/VmuyQnBL7zuoJyiUbCw231PXNSGmMsvZ/Uwe82IpIqKQWcMqCIFZgN3B2I1hGbgKzRsffngwsMGM23oS6g2XqIoKqCkhSBlPVaSiDaayeC6p7bECnweh6ROykmP80vxipaSpeITFKJjBwZdItsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PAn8MuQD; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-42122ac2f38so1917995e9.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Jun 2024 01:14:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719562489; x=1720167289; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5p5vZCwu+kIfI6E/jSCcA3j2SGSRGBxA6ocPxaq30sA=;
        b=PAn8MuQDujwx80dRqoIi+PbRmh1eU2eqYgBkBvgXAgoZPwYHT6Ie2j5som5T5J8P6q
         yHNGtPkzcXYf7YD/ygjD2uqmkSaQ5y1mNxdCThr4e+EGoqHk/l2VOHp8QFU+2G7eXfer
         12X57xtqI0TFr2Iqll4m17tNQs0IBgxl2R/3i2dDe7iPZWfgmQxyzrTbX9jEL3lh1l6F
         NMlEFscCnAlZKQLAio4RrDLedictefVqCamWvtuL0RJCOKYEPB8GZKZUjE3ieZZB/B6j
         Jr9SUkgj115j7cfEaGMRyNysiSyXE5KWvdi2XLjj4gahLtPNVknU2HETyyVYiOO0W7vA
         Ct/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719562489; x=1720167289;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5p5vZCwu+kIfI6E/jSCcA3j2SGSRGBxA6ocPxaq30sA=;
        b=DDmxt8HXlQLDsIagEYmM7WfRic4SG6i92/oG/O7RZ/tyega+C3zw+6hgj2fp9G4yxX
         wsRZYPmqQWAJ8wG6FHBRsugTfbF+hKBI+ua4khuA0dwqGB58WZ3YwKBFczC8HWNbH4gQ
         kniEIMEIVpy8TcPhDgiUNDCMSTnU5h1M2K4mhBBEPNza2eVnwWNKh4yBdoRR9Rg/Wgf+
         tQsDhyy/pkFxN6mxqzr8czLH416CbL95IlgtwjmbzL+/fPBx9YP4hpMCF24hiJwIerJ+
         9wlGOL9gwk72SJy4lalQtWB0UT1pIQelAcaU6j9Dy9TlZvcgc+e8a9wEqLhQNXdtyO5x
         1yCA==
X-Forwarded-Encrypted: i=1; AJvYcCVegRy3IrQiThQbakGW8gmO5mCLlUkZGEfXF6Qv1NY1ZV0eWih75iBNbLuAFhVP4wZgdMBYWaE+Fne/d9D2tYrsRdFaMzLJ8xajBMW9wA==
X-Gm-Message-State: AOJu0YyPXIYwDnjID/voJJCt4nNu0xLa4SuxI9ObsUVjwOueXmfj/DZD
	MHiJLBP6GC6mRbLgTGBNsZYXdEBvxQ8yW0HefVDfTIfDCKNKvEb9xGnKaSppQJc=
X-Google-Smtp-Source: AGHT+IERat1T50yD424DDB+EpCE39bTSKhswb6OkBsxZplNjpH1EV9xixuDz3OSQBaaYIPvhFsoHTw==
X-Received: by 2002:a05:600c:1616:b0:421:b65d:2235 with SMTP id 5b1f17b1804b1-4256d4246f3mr8736965e9.0.1719562489347;
        Fri, 28 Jun 2024 01:14:49 -0700 (PDT)
Received: from linaro.org ([82.79.124.209])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4256af5b61bsm23968405e9.17.2024.06.28.01.14.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jun 2024 01:14:48 -0700 (PDT)
Date: Fri, 28 Jun 2024 11:14:47 +0300
From: Abel Vesa <abel.vesa@linaro.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: gcc-x1e80100: Set parent rate for USB3 sec
 and tert PHY pipe clks
Message-ID: <Zn5w9zKxIT/2OvB4@linaro.org>
References: <20240530-x1e80100-clk-gcc-usb3-sec-tert-set-parent-rate-v1-1-7b2b04cad545@linaro.org>
 <3ukguewuqqm5gmbd3afl62ihysdzkk44j3f2nuqht4gjuf5ruo@zu7jmmnbrpdj>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3ukguewuqqm5gmbd3afl62ihysdzkk44j3f2nuqht4gjuf5ruo@zu7jmmnbrpdj>

On 24-05-31 02:56:12, Dmitry Baryshkov wrote:
> On Thu, May 30, 2024 at 05:05:24PM +0300, Abel Vesa wrote:
> > Allow the USB3 second and third GCC PHY pipe clocks to propagate the
> > rate to the pipe clocks provided by the QMP combo PHYs. The first
> > instance is already doing that.
> 
> Which driver changes the rate of those clocks?

Sorry for the late reply.

These clocks are consumed by the combo PHYs, so driver is
phy-qcom-qmp-combo. This driver doesn't change the rates of the pipe
clocks as of yet.

The fix is still good, even if it's just to align all three clocks.

> 
> > 
> > Fixes: ("161b7c401f4b clk: qcom: Add Global Clock controller (GCC) driver for X1E80100")
> > Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> > ---
> >  drivers/clk/qcom/gcc-x1e80100.c | 2 ++
> >  1 file changed, 2 insertions(+)
> > 
> > diff --git a/drivers/clk/qcom/gcc-x1e80100.c b/drivers/clk/qcom/gcc-x1e80100.c
> > index 1404017be918..8c72fdc99fd9 100644
> > --- a/drivers/clk/qcom/gcc-x1e80100.c
> > +++ b/drivers/clk/qcom/gcc-x1e80100.c
> > @@ -5269,6 +5269,7 @@ static struct clk_branch gcc_usb3_sec_phy_pipe_clk = {
> >  				&gcc_usb3_sec_phy_pipe_clk_src.clkr.hw,
> >  			},
> >  			.num_parents = 1,
> > +			.flags = CLK_SET_RATE_PARENT,
> >  			.ops = &clk_branch2_ops,
> >  		},
> >  	},
> > @@ -5339,6 +5340,7 @@ static struct clk_branch gcc_usb3_tert_phy_pipe_clk = {
> >  				&gcc_usb3_tert_phy_pipe_clk_src.clkr.hw,
> >  			},
> >  			.num_parents = 1,
> > +			.flags = CLK_SET_RATE_PARENT,
> >  			.ops = &clk_branch2_ops,
> >  		},
> >  	},
> > 
> > ---
> > base-commit: 9d99040b1bc8dbf385a8aa535e9efcdf94466e19
> > change-id: 20240530-x1e80100-clk-gcc-usb3-sec-tert-set-parent-rate-420a9e2113d1
> > 
> > Best regards,
> > -- 
> > Abel Vesa <abel.vesa@linaro.org>
> > 
> 
> -- 
> With best wishes
> Dmitry

