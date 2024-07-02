Return-Path: <linux-arm-msm+bounces-24864-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6972C91F0BB
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Jul 2024 10:03:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D7EC01F22B80
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Jul 2024 08:03:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B56D148314;
	Tue,  2 Jul 2024 08:03:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oMhMwAIv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65C3616419
	for <linux-arm-msm@vger.kernel.org>; Tue,  2 Jul 2024 08:03:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719907434; cv=none; b=PBo7N0WO7MHyqyXUQAdIu7yGjwyJNtsynS5YmhDuvTRBNJYQ09SzPkJSPtHfs3u5dHU0upQPBGQrvSH7HE4xT93bgTXj5HWgD0QHZPNZC0Vdln4uehpFRhHvxeajMXdmN7YgYGvLsO9TgUSqEtvM7w6fTqIqpngGzfJFT0MjDBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719907434; c=relaxed/simple;
	bh=b/wmykKwVxbhO5h9j19Pvj79GV8/eI9inxecTME1l/0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QPZcW/0cr6h4xYNbrnlAM9nmsHl1tmuubqMRZo1Z9v/WM1xnGMAecTg23QdbcGZeckcJ0EQv7qU3zPouwBJwpvgexLbW2aQ9HS4Lhs/aX3T7h2qs3mikVbu4hH3uLd6+8JXKNXRK7YdpeK5OQ7k/Ohm3zRpTYxiJeOHklVNJ8G8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oMhMwAIv; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2ee4ae13aabso40868341fa.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Jul 2024 01:03:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719907430; x=1720512230; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4LAM6lIuRtsvCZNgiIxZSTOFr184re6ASNS29In5f8g=;
        b=oMhMwAIvZYMh4WI7lJoFpxtiVJoYl3l5oXQSlEjPyI6et5LNARcv/6Oz3PR79Oa0EP
         6hw4TcE2PYgmdcP0ywFwm74IBEsOljmbkqhBurFMB/dW6TF5dC6vPlw6EerkpdjQqPVD
         m0EQYbWOVrgZGKqSEVdq5iidXGW1wEqNiB9WusoBX8nwu25AL/u1yLkqoAh4azDVUhJN
         blFmb5fyWymsnuX31Qs0AfTr8iOtFkl9lmOB3wCR7nCyl6BwkcYyIIVqFhmc+LOtH4Y6
         HsX44vGLVL7GXI5fa9JImeAIx6vRcJq8zH4Yb5c3RhOGKByt81s5rYeZVR74tOQ+sOvq
         XDoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719907430; x=1720512230;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4LAM6lIuRtsvCZNgiIxZSTOFr184re6ASNS29In5f8g=;
        b=gVY70mScz7yq/+maUhqtM8vekGo/hj8frK6/fIzggqap47D0fsU+DBhxWc24ZZIluN
         UZbnM2xA9ddPTLn4Jnszb7e71JeQ0UEGnaUDoYBXeM8TqjeS2fnriQaHROtVjCuNDp85
         PXbSSCCpWbteoO2KHhNoP3UmsOeMOC4rvPwuHSLYn3Wn2nP/T+uX7LyPLA/hFix56e3q
         Zh8sfplvy0ntLCsl9k/X8cig/TdA/Ha4iLYBF5LKkPHQusyWr/y4v5pFjFCajVfkid1T
         b/3whWmvfRgNaqYL1625/TZ6tFgXT3p7Yzz8ACphb4CRWvvJewOgmercrCC3rxIAdl3f
         9DQw==
X-Forwarded-Encrypted: i=1; AJvYcCXOuRpilJkiTMFnZv4C3liGXbC7peIQI5/qSWI/8bcJYUxZ5QaHEEKffm0j6SKHTqxNpsmXfVFM5XI+iYE1lVpf30ZnLBy+c+c0BRCXYw==
X-Gm-Message-State: AOJu0YxGnfadqcfBBC3qky4oMNjWDix64P+scHUK9shQ1fnx8GK1Dpcm
	ShFjVx4txZIvuymtuVbRD0XrQ7GTDsWJP83KaOjiyvJiPVzGizGLU5FDqa8D4lI=
X-Google-Smtp-Source: AGHT+IF3ecEAZvC/pQ2gIHHNnpG1wqrG6SjuqFnUiYhmdot/hwZ/XHb/8hTTHi+H/mXFV5XzZdj6Qw==
X-Received: by 2002:a05:651c:220e:b0:2ec:174b:75bb with SMTP id 38308e7fff4ca-2ee5e38103emr57141381fa.28.1719907430551;
        Tue, 02 Jul 2024 01:03:50 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ee5160d26dsm16306991fa.25.2024.07.02.01.03.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jul 2024 01:03:50 -0700 (PDT)
Date: Tue, 2 Jul 2024 11:03:48 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Sudeepgoud Patil <quic_sudeepgo@quicinc.com>
Cc: quic_bjorande@quicinc.com, andersson@kernel.org, quic_clew@quicinc.com, 
	mathieu.poirier@linaro.org, linux-kernel@vger.kernel.org, quic_deesin@quicinc.com, 
	linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
	Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: Re: [PATCH V3 2/2] soc: qcom: smp2p: Introduce tracepoint support
Message-ID: <sgrgxfkvqnjeaiovvt665klmse443vkmzncb4jcun6oa432chh@ogaidyok27wf>
References: <20240627104831.4176799-1-quic_sudeepgo@quicinc.com>
 <20240627104831.4176799-3-quic_sudeepgo@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240627104831.4176799-3-quic_sudeepgo@quicinc.com>

On Thu, Jun 27, 2024 at 04:18:31PM GMT, Sudeepgoud Patil wrote:
> This commit introduces tracepoint support for smp2p, enabling

See Documentation/process/submitting-patches.rst, "This patch".

> logging of communication between local and remote processors.
> These tracepoints include information about the remote subsystem
> name, negotiation details, supported features, bit change
> notifications, and ssr activity. These logs are useful for
> debugging issues between subsystems.
> 
> Signed-off-by: Sudeepgoud Patil <quic_sudeepgo@quicinc.com>
> ---
>  drivers/soc/qcom/Makefile      |  1 +
>  drivers/soc/qcom/smp2p.c       |  9 ++++
>  drivers/soc/qcom/trace-smp2p.h | 98 ++++++++++++++++++++++++++++++++++
>  3 files changed, 108 insertions(+)
>  create mode 100644 drivers/soc/qcom/trace-smp2p.h
> 


-- 
With best wishes
Dmitry

