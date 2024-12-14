Return-Path: <linux-arm-msm+bounces-42225-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CA5939F1E51
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Dec 2024 12:39:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 411701886A51
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Dec 2024 11:39:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02B5B18A92C;
	Sat, 14 Dec 2024 11:39:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jeZufbtC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49A36170A13
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Dec 2024 11:39:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734176380; cv=none; b=i3z+HRH1BoLqawYuAUwbAIlMOcJEcVkRCYSwqi007ye2XCmLPpSQENlCHrx4v7iqVSMnZARC7O/09Ct3BFH9AhFCa6z1X3i43A8niWA/AMQOUTfos7idh0w7cX8maMBDdQAhjrVVjKrXeMCC8a2Bla42ZqGVg/KrhYdpBj00GcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734176380; c=relaxed/simple;
	bh=Hi0KPvOMo5zpxOsXgD8nXO1azY36Pqum6h29Oow5cDk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BTEWQU3LCGpnQPm1dUjCSkbsvPBTaY9IW86dHirEKzlYiMuVRp7Wk3pXy9NqckNufzjHFgxc2xhQwmLW6Q+5+/4Jr9ZH6m33eGoORTBu4Dxp23qPYixLNNi0ap70XOHUEBfkXyafWrn7XNPy2eLTZoHEKyKHsJfT2HJiZFNz5/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jeZufbtC; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-540218726d5so2645276e87.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 14 Dec 2024 03:39:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734176377; x=1734781177; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OeCcjkbPl6Xl/41j85MrwKw61kLFoQEu17cYntkW6cA=;
        b=jeZufbtCrbo/2Sig2gMXZYop9UvtDEK/b2c5mthZIjMgeFD7vhPJlP5NME3ddxqgzd
         038ZUiIX2CnsVpJs+knAPeXK9olFF8iyEp0FqDAx1nEj9wa5+sXEPnm8Nr6knO+lNPAd
         FWc5oiRxtpw5+8YU0y2FcgY1Kl9eBs66/AXL3R/RtRyHxaVyj8xDd3yyJQFgN6T5w2LA
         BlI/tnyJXXcAS7fjLWMSqYR7jXlI0a2ax+zTRI6IFPgHe18gEkFi0V+3sU+U/6dYlM4/
         miK2vlloKr9FV97+zNBhaTdTepzuoLlj5fLow8hHjfcwFftoG0MBbyxjvv7Mwr3GIzWR
         MpTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734176377; x=1734781177;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OeCcjkbPl6Xl/41j85MrwKw61kLFoQEu17cYntkW6cA=;
        b=IxgZlHmtRVeLiZ5PMJsHKtATKnEoRqWfTT8UjC6sq/mzIALTipFrMMtnmrJjPYspRM
         OlHzHMaFV9rbyf/tPjacP95v+5BefKqjCw04hNqjnEwVi7pj5VDhwy5dBfyTcQFqSZEC
         OzgoIzTdjZ72FdFLAJ2vdyuCj91mQbPqjFb1FwNHwp1PRzdVL1/B0rlhPuDrOxZdNMIP
         oQM/rBtYk2gZ74CljFokOU1D9tj31UMOaTMr6slGoWrZeIxne3NrhZ52BwB8GLwCKT6V
         8HS+KW3jIXolVmmPYU7o8l2+6IudslmfFr56OQC8luhlIRwR771k6DMayK4MjeaWjGxS
         wXVg==
X-Forwarded-Encrypted: i=1; AJvYcCUmL8f7HJhfvyisAdiaWlrb4Eo9yADi2Rc4r0AgNa3DS9D5CwPExGbw8FKqLszq5zC9jrPaSUfPD1x2o4CG@vger.kernel.org
X-Gm-Message-State: AOJu0YwyiCYE9LNWIbN14NmalgdZwr72V7hCWhV9u70NIIEXTqRPB1Pg
	OiqqK4qRb8qd/m6LXQTProtx6NZuZYUDGRX1mOIRCZcUmCYpFxGdDOnZFPwGLtc=
X-Gm-Gg: ASbGncuUZqGnhNpoOxuTadkesAXvMEa0xtjtBajcVlE0PXJdU9lsL4SQ94Qm4uA3QCM
	zjRwMUT9iletV9vrB1xmxznEVqXVivLrUkzecVmnFaz3BPiz7jSipkHU55/kz0+4+VWjFmfp2hI
	oR4/B3irHGV6Md+iEJ2apj7NGdfBuzb5ZBN0UIk8WmSH2KZ1gUzqaXp/GBlbjpuaEJyBY/FFB11
	jDy07zu9LTBPMOVY1deFUylvsX/G9/4QOnNL0cG09p2lnwWUxUY/ARrhH2t4aRg3pDdHkYRJLri
	XmIEvIi95T12YTXWL/WFACXUBnLCtVQWkfUX
X-Google-Smtp-Source: AGHT+IGqTQ1pNqm/Ngay9AHMNf4hrhRAE2mYmS+Ahol55tRGPvjWEaqYkQ3xCrtSle4klGeWah9+hg==
X-Received: by 2002:a05:6512:401b:b0:540:1f7d:8bc0 with SMTP id 2adb3069b0e04-54099b6d6afmr1869994e87.49.1734176377364;
        Sat, 14 Dec 2024 03:39:37 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54120c20acdsm192457e87.261.2024.12.14.03.39.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Dec 2024 03:39:36 -0800 (PST)
Date: Sat, 14 Dec 2024 13:39:35 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Julius Werner <jwerner@chromium.org>
Cc: Doug Anderson <dianders@chromium.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Jeffrey Hugo <quic_jhugo@quicinc.com>, 
	Roxana Bradescu <roxabee@google.com>, bjorn.andersson@oss.qualcomm.com, 
	linux-arm-kernel@lists.infradead.org, Trilok Soni <quic_tsoni@quicinc.com>, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/6] arm64: errata: Add QCOM_KRYO_5XX_GOLD to the
 spectre_bhb_k24_list
Message-ID: <2qx75syaojhnsqt256li6sinafml4gohohvld6uw3zhejrayuj@biiep5dvko7t>
References: <20241209174430.2904353-1-dianders@chromium.org>
 <20241209094310.5.I41e227ed809ea607114027209b57d02dc0e98384@changeid>
 <l5rqbbxn6hktlcxooolkvi5n3arkht6zzhrvdjf6kis322nsup@5hsrak4cgteq>
 <CAD=FV=WQf+ig21u316WvQh0DoKsdKAmZgqPn5LB-myDXsJtXig@mail.gmail.com>
 <CAODwPW919K+XdxjUe3aPgxsv0CEWwx0P_Hxvf=VniLhk8eagkQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAODwPW919K+XdxjUe3aPgxsv0CEWwx0P_Hxvf=VniLhk8eagkQ@mail.gmail.com>

On Fri, Dec 13, 2024 at 05:28:55PM -0800, Julius Werner wrote:
> > Interesting. So the Gold/Prime are actually IDing themselves as
> > straight Cortex A77. The Silver is IDing itself the same as
> > KRYO_4XX_SILVER. ...so in that sense there's nothing to do here for
> > those cores.
> 
> Should we add some comments to cputype.h to record which other
> products are matched under the same ID?

I'd say, yes.

-- 
With best wishes
Dmitry

