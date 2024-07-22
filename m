Return-Path: <linux-arm-msm+bounces-26728-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 03069938B49
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jul 2024 10:34:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A2C591F2103D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jul 2024 08:34:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C371133CD1;
	Mon, 22 Jul 2024 08:34:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MbVYqocF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27414125BA
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jul 2024 08:34:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721637287; cv=none; b=lXQq5vzF1FblULPcLljRJZ1qwx//Yp//5YF8rx72xTrlkEvW9SmEIL9pbgCJfM9DuBflIRM/ppltZieD4V1TqKtWaB99PE1H3kimlq7UyJicLu4hIebmP8jCNebq90ndvNf0FwgvOoZg0/yNDL+NIHUNmxOzFCqgkNLqswwpnRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721637287; c=relaxed/simple;
	bh=uY1yqkKtZzCU8/uzTpQoE3P9CyW6iyCSjUc6TqX69nY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cuCPrZCQ4uwxQL9T8iSXENz53yVSVVdpuoVWz+AGjpre2I2+DJDHoG8ZLTO+mqYHCT6QpGEAnO6Gq5Y5ij8WfumBODLRe+W4uKUnRD+G5wS33Gd7oTk228xt0XeyjMqoCFNBQm8eNQQp4NIjQ3Hhp/4yBQSSlgKGwRNNpwJHzFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MbVYqocF; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2ebed33cb65so46302141fa.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jul 2024 01:34:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721637284; x=1722242084; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2bCcctmphp7eaaFNl/P4rmhmnmFCkyJeC8pSv5glUL0=;
        b=MbVYqocFQx1K9F4DmyvD3lQFk9rPmMrjyIc2erl2Shy+TWZ5m91eq102Nep27wCwJ9
         WDG3pse+sZiCmZtnvyi4n5y9ExkvTlXC2CdQG0b5/7G9xpl7cydu9EtK4Xt0yfPwTvye
         gCJ4Eu2CbZGMJcMLiMcnStc+OVkTehU4sOs0gZBNr+jxadbjC2RevYcfSeeuoGtWCUFg
         9/ktmQEsDoXAuVVJq4Lc8Whq1ziWuRasUN/TdiwULJkolk1rupXR9Ij9TfZY4pIW4rbs
         +hwCZVVmAHCbUOeMYxOEA6R/8fv6AxfJCWT3JsNKnVCKdTQmHT6NedU2lf/Cx2S3D2xe
         Gvlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721637284; x=1722242084;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2bCcctmphp7eaaFNl/P4rmhmnmFCkyJeC8pSv5glUL0=;
        b=IW6V8lqUeEBQQZzzzMWm9grVXW2Lxjb1Sd2HdActU7b7VCwIQl11fKzxM4Eb/78YVS
         5AiNSMeJYIWD0gNbzCApN8+8iU4Vqyjq8vlnNBKzDhI53U4RsE0vk0azKSX3msKLiKP5
         9/QzTmBdtjQr+Evodrk9lFE8RZimyyFUvh+75GQDfDfsqYddDb8WSADUhEw3jQN+/Iy/
         wWwE1RV8P+sBbJgNq+vRJh/4M2k2XlgwG0FpWcGjvlEaXq4NOnfgpU7szFvCCCsbCJ0M
         XZiRdHz4V6FD3Ry9Mi+4aPKafTem09S0EflOb1vL2+nt1PTn/yJLVKwjOjIYiRMIM9bf
         5Stw==
X-Forwarded-Encrypted: i=1; AJvYcCV0QEmczUAYUbY1trmPRwvfucERRYal6yx73F85b9QL1CtuwQ02qRr6QAe5Ggu8tlY7j4WPKZNpInUfxI96a6zwlIDrg2LM9oCW15f/7w==
X-Gm-Message-State: AOJu0YzX940IvyW3yHwJuSSPQvyiHTS/RH0lrcEEu8kYC1R2B3DWJhvY
	EP0iKKGyNnjZ1jPffoS5pbtsmEGiiBLD/lk6GP2Qv5VsRtxpVrALHFTgzFlF+z0=
X-Google-Smtp-Source: AGHT+IEsWXCCThUeEb/tyiDFPzOaoGeM+rqNvDAQgD9HMylXNk8ux7RCYmKh0XPBMGSEjZyqBJjW4Q==
X-Received: by 2002:a2e:9e92:0:b0:2ee:7d37:49bd with SMTP id 38308e7fff4ca-2ef167bf52dmr46624991fa.22.1721637284298;
        Mon, 22 Jul 2024 01:34:44 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ef0fc3fcf1sm12082561fa.4.2024.07.22.01.34.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jul 2024 01:34:43 -0700 (PDT)
Date: Mon, 22 Jul 2024 11:34:42 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Ekansh Gupta <quic_ekangupt@quicinc.com>
Cc: srinivas.kandagatla@linaro.org, linux-arm-msm@vger.kernel.org, 
	gregkh@linuxfoundation.org, quic_bkumar@quicinc.com, linux-kernel@vger.kernel.org, 
	quic_chennak@quicinc.com, dri-devel@lists.freedesktop.org, arnd@arndb.de, 
	stable <stable@kernel.org>
Subject: Re: [PATCH v6 2/2] misc: fastrpc: Increase unsigned PD initmem size
Message-ID: <cr6xv4tsk23sjynnucve4366fwvffgq3rjnbkpxhzdfeiktwtr@ydrp3mduapui>
References: <20240722080200.3530850-1-quic_ekangupt@quicinc.com>
 <20240722080200.3530850-3-quic_ekangupt@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240722080200.3530850-3-quic_ekangupt@quicinc.com>

On Mon, Jul 22, 2024 at 01:32:00PM GMT, Ekansh Gupta wrote:
> For unsigned PD offloading requirement, additional memory is required
> because of additional static heap initialization. Without this
> additional memory, PD initialization would fail. Increase the initmem
> size by 2MB for unsigned PD initmem buffer allocation. Any additional
> memory sent to DSP during PD init is used as the PD heap.

From the previous commit message I had the feeling that DSP can request
more memory if required. Currently you are stating that PD init would
fail if it doesn't have enough mem.

> 
> Fixes: 7f1f481263c3 ("misc: fastrpc: check before loading process to the DSP")
> Cc: stable <stable@kernel.org>
> Signed-off-by: Ekansh Gupta <quic_ekangupt@quicinc.com>
> ---
>  drivers/misc/fastrpc.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 

-- 
With best wishes
Dmitry

