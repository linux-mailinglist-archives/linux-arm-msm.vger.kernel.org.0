Return-Path: <linux-arm-msm+bounces-39116-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 65D699D8A48
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Nov 2024 17:27:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 17F25285282
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Nov 2024 16:27:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EFF81B4F0B;
	Mon, 25 Nov 2024 16:27:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VlaKL87e"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8371D2AD25
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Nov 2024 16:27:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732552062; cv=none; b=iyoGsGfmxIqbx/3SQ8mcyBLy6NJ9OCl3bFNG2si2Is7uTPz2M5v8CVYJCWwJBJhYmXecjvdVRQa2VZDBrMISqeEfy+FfqFZIR8oMqWqFkCoarSxcVa1leu9RkdMqbvMdtUXAx35s6cuZ9yN7xxL+d4JrEVgXEquwYFtb/IoraD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732552062; c=relaxed/simple;
	bh=R0SfJyrw7C0KxLOqn1gC0wVxvdRJvYjZ2Aw3X8fWg2c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XCXfcn+IBx2tsU39l/ITC66NzT/pBtuNPxBrxn1uwQmUjYpo40GFAESf3bLf9m6Gc5HUxYe3hYB4xGPO5VaMe3k0te/hGXRS5wErtQG/VhIJBJtVj7LXvRWVNh53YoJpa6lvVa3lOFxfJ3uJOrjGIkoAH/e6Rlc0jgNSLAnBhqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VlaKL87e; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2ffc81cee68so7985901fa.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Nov 2024 08:27:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732552058; x=1733156858; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yChQ+Bc3/hLFAIXQy5Qdf3pVGzUQXtJDQxX2P5y2ICQ=;
        b=VlaKL87ehHzpxul34gLSsW5ZTyFzGpS+H8arNwGCbjDtoYI1kd9VRs6G5d5joRZaQX
         xXB/COd+UFMIf5kSxolGyh7C8bFAuN3Qm62+Tp+kdhG5xaCwct9i9O5kh/XUUKOLXnzj
         wbrIgWJ27QZfjEAc15eELznwoogf9IxsoiumGvND/rpxB+zrkDdX08fVBHXdZ427JR1L
         IgSmYwdt491PETFW+jBXej9uEet+8NPfHDh9yK+b3NX8lymymd1By3BO4zAPXX7GdOUi
         Qgw+XpSqy1o+EyAjFn/jBYMqR3JRZH2POS4zhAXHiP6ZQRS7RTE8OfWx/VjHs/QqIe8w
         AXsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732552058; x=1733156858;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yChQ+Bc3/hLFAIXQy5Qdf3pVGzUQXtJDQxX2P5y2ICQ=;
        b=lDwZubUxwOsfL6MWmv0fdAR+3w/tdg6bugHlPWKvwc+rCh1TH0XuggK8XK2GprIZGw
         +FLHFSBdlDE31w/ADTkQjPPP1JW87KXSj5vWKyy3TZCeletog2mhr1Ysc5gmz/lwq6Ni
         hXEQMkrfRmfofKiXbskcaRcebkGxhf+rdVMOb6aOQ1T14U1OEausTkJXjJNmUxsvnRuz
         Wsm4Ca3fy35Q9bo5zw1tCqfAawEPovFVNI/h/UQnN4NllnB99gYUeRf+RM97BZtocJop
         GEvFyYCCzZlXKF0zC3QDoixpCLyP9jOOTOBd51nmiU/SyeVEirxH9eK7oW8l2zM31W/V
         yKCQ==
X-Forwarded-Encrypted: i=1; AJvYcCUx1NWg0NCnBI/CmqLSOr7FbzLJ2CDL9Bu7gTxk25Gvv6UVa3vvVVaX7BK7XNRWmIedG2X0ikZ3XwR6+jjX@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+96Qo7hY7VlITFZxP64FxJtYPhRXz9eJNCgd5i8TCCgliIxrW
	2IMB/PQjqjcoqLO8n/oCF7rqr/ASYiwJjloxSOYu+HJ4X79MMVd5aRD66n1X3Js=
X-Gm-Gg: ASbGncuUCJhsxrKU2TyBAumEjEle1BnnXdOn9MGqgSkVlI0ZwH1A9DQsT//2mZeqcuU
	7Lk1PbYEB7GG4ch4isWqrEU88p8Oc03l3EbXa7vGSI2pWJ4SV1AHyT30pqMykJzMb4FaWOW7k7y
	erbFRB/259w+WWlllJogd/yjypUk+T6t4rF4CU3pl8NKV5pWJQocaDm8L7SAYQeoOIZSewqOfCw
	oe/R1LC1RfNAZQkmLvt1lEJ5b+UFX+uD+1aDld/MdHy7zEYSH9FDiIsUAjNPOOF7hkRXq/hnDGV
	bk+grvtGmXQQIFls/yH2P1G03VW+/w==
X-Google-Smtp-Source: AGHT+IEPzuV6qF3LRJebCgOSfgvwIUrR22q8orC9Jdgp0xsNFNCHkZEIt9rCIrv8k5TvvcNBZU9pkQ==
X-Received: by 2002:a2e:a9ab:0:b0:2fb:6057:e67e with SMTP id 38308e7fff4ca-2ffa71a7b0amr69362691fa.32.1732552057728;
        Mon, 25 Nov 2024 08:27:37 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ffa4d3ee22sm15745961fa.43.2024.11.25.08.27.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Nov 2024 08:27:36 -0800 (PST)
Date: Mon, 25 Nov 2024 18:27:34 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: "Renjiang Han (QUIC)" <quic_renjiang@quicinc.com>
Cc: "bryan.odonoghue@linaro.org" <bryan.odonoghue@linaro.org>, 
	"Taniya Das (QUIC)" <quic_tdas@quicinc.com>, Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, "Vikash Garodia (QUIC)" <quic_vgarodia@quicinc.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>, 
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Subject: Re: [PATCH 1/2] clk: qcom: videocc: Use HW_CTRL_TRIGGER flag for
 video GDSC's
Message-ID: <rtmrsvtfukekss4cccnuxgzsm53er5mvgsfshx7xvdwn5vsio2@hgiowygrsmgd>
References: <20241122-switch_gdsc_mode-v1-0-365f097ecbb0@quicinc.com>
 <20241122-switch_gdsc_mode-v1-1-365f097ecbb0@quicinc.com>
 <zhco37pigrp4fh5alqx4xfxx3xhjitqlgw552vwiijka22bt4u@sl4ngzypwh4x>
 <1d9aa2e7-d402-42dc-baa6-155f01b132ca@quicinc.com>
 <23ho25gl3iwyi2jspb6a2x5bv76fco5pkg2x5ct4gu3c44dbiq@yec6evx5sihm>
 <eec92088-edfb-4d0c-b81d-9d4f1d968b20@linaro.org>
 <b411489f9f2441f7a0f936127678e36b@quicinc.com>
 <CAA8EJpqYSujKXPFkdWcqRpOKZ+dJHQDkYM33Mt5JxuA=Mfs+WQ@mail.gmail.com>
 <7765000a0f87447e98d827dee5977ca7@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7765000a0f87447e98d827dee5977ca7@quicinc.com>

On Mon, Nov 25, 2024 at 03:14:27PM +0000, Renjiang Han (QUIC) wrote:
> On Monday, November 25, 2024 9:55 PM, Dmitry Baryshkov wrote:
> > On Mon, 25 Nov 2024 at 07:31, Renjiang Han (QUIC) <quic_renjiang@quicinc.com> wrote:
> > > On Saturday, November 23, 2024 8:17 AM, Bryan O'Donoghue wrote:
> > > > On 23/11/2024 00:05, Dmitry Baryshkov wrote:
> > > > > This leaves sm7150, sm8150 and sm8450 untouched. Don't they also 
> > > > > need to use HW_CTRL_TRIGGER?
> > >
> > > > I believe the correct list here is anything that is HFI_VERSION_4XX 
> > > > in
> > >
> > > > You can't apply the second patch in this series without ensuring the 
> > > > clock controllers for sdm845 and sm7180
> > >
> > > > grep HFI_VERSION_4XX drivers/media/platform/qcom/venus/core.c
> > >
> > > > drivers/clk/qcom/videocc-sdm845.c
> > > > drivers/clk/qcom/videocc-sc7180.c
> > >
> > > > Hmm.. that's what this patch does, to be fair my other email was flippant.
> > >
> > > > This is fine in general, once we can get some Tested-by: for it.
> > >
> > > > That's my question - what platforms has this change been tested on ?
> > >
> > > > I can do sdm845 but, we'll need to find someone with 7180 to verify IMO.
> > >
> > > Thanks for your comment. We have run video case with these two patches on sc7180. The result is fine.
> 
> > A single case, a thorough tests, a mixture of suspend&resume while playing video cases?
> 
> > Also, can I please reiterate my question: sm7150, sm8150 and sm8450 ?
> > Should they also be changed to use HW_CTRL_TRIGGER?
> > Next question, sdm660, msm8996, msm8998: do they support HW_CTRL_TRIGGER?
> 
> Thanks for your review. The video playback and recording cases include video
> pause and resume, and full video playback. The results are fine.
> Also, this change is only for v4 core (HFI_VERSION_4XX ). Therefore, we have only tested it
> on platforms using v4 core. We have not tried other platforms.
> sm7150, sm8150 and sm8450 should not use venus v4 core. So they needn't to use HW_CTRL_TRIGGER.

We don't have venus / iris support for those platforms at all.
This patch is not about venus, it is about the clock drivers. So
mentioning venus is quite useless here.
If these platforms will benefit from HW_CTRL_TRIGGER, then we should
change them at the same time, before somebody even gets venus/iris on
them.

-- 
With best wishes
Dmitry

