Return-Path: <linux-arm-msm+bounces-30163-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AAE296591C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Aug 2024 09:51:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BA9E6281843
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Aug 2024 07:51:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DC6A14EC41;
	Fri, 30 Aug 2024 07:51:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="M0atW2IK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 263EE157E62
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Aug 2024 07:51:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725004284; cv=none; b=qYP/uxa5HLxQldHbze4HW8De6vl2h5uU4ICe2kF/94L4FmiioTq+EahpsP92y60XCNpSB4ZApFpD3T2XyWbmhf3N2IZgfHUdOs2oWPj8bh89PmD66N9vbuEMMy+9LhI6moSsUMug4X9i+zGWV4qHlLddR/H+6G1oElZ36++/IQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725004284; c=relaxed/simple;
	bh=DGUmuhRxxCGg9vi/0rKa1zUzA/w1Wk8C4Iq6rNs+qFY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XcNz/dfYwEwRwD3lVL7HqcavQFQLmmqx/gtIJWAlrf81l0955Srs8yJ480nB1/15+P6gdmkY4r+C8dlssVje+E89DljVG7jOHZzmHO7YMLv2dffBrTIOkuz48Hr8QI+x/48t8oVdWxbfgkpk0k9SogCWUu0yAd/lDtIRsnnsAIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=M0atW2IK; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2f504652853so16913891fa.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Aug 2024 00:51:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725004280; x=1725609080; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=EMykQbUJVW9W9sXQRmc6M1cASoIaLQkUOCZZdts0xts=;
        b=M0atW2IKjuH2X3mSRLNHaQpRaybqldHIygKSFBIoS4J55QpcswKSi09cLoFgUntKdl
         cXtCsPUiQ5/2awEwjxKNlYTzhBsG264rARTtd6x6GkABIoHo05TlsmobS5YzxoJFlHox
         8h5IgEPLkhHUrKSdJokwv7e/iWzZAzbWlTSJ+qVSONlJJVV2oyfMp2fqGJB89SCqrm0P
         lzemXtI+KLFEtmukPf33DvTvUirfb2Bpij/GMbiA72mHrydJqsuft7Kb+Iq8MJj79SVh
         vQxnCb0DMGl8YiQ7T1TmFSn+wm92cXo/EuY2lEHzXKhgw5AlL0RlFHWYpemMI59Ud6Di
         5hMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725004280; x=1725609080;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EMykQbUJVW9W9sXQRmc6M1cASoIaLQkUOCZZdts0xts=;
        b=I9DtGuoKv3tgfliQyIHV2TgF9nezonNN2hIB7kPKzVL0Kvz/rf/JfJ4H/TGON5x+yE
         yU24nfmKZ2TFzwhT7MXT3oWm6QZ5CX/ZWK8YVsaQ4oTzX4Nv+EuJAoTjfZocMERlDbi6
         i/3soNZ3W/9WT9CrAjZLFnayTygFJAsajtGbkT/B5aZSQNGvpoZZTKEfn86hx8gmle3d
         uJhGVolgF08LS00z90V8SvbqWNM7IVXLCUGsi8dLaOEO/HpmLB+Etfz+U0ra4cbDHGd2
         /fYCiHJ+tcse7DySzXV2seZtcYJQjw/zKCIn884vtbeuHiHswncGHKk70MwG+JH91I9k
         cViQ==
X-Forwarded-Encrypted: i=1; AJvYcCUGcaIcCIEIyQqXkaL3CR/Hrj3J9jJh3j3uiiqODrfbhVU7nC+HqO+WE+9D4fWogzb9HFlMQxjZfh+VdN8Y@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7QPqQWgZ8l892vv0bgvFl/3AOoWO5m5crr49xrIVL14buefOY
	TvYYgPXfemc7W/p0/v+xagtko4CJbl1hX5LM2Odo//nC6wQIdkQJd9RZLO8EQF2ZlkDoACaZOnZ
	q
X-Google-Smtp-Source: AGHT+IFD8xmWdEqG4hdLLMpP5UGoKymovpPF1vANY5dTJv/PkTuwIIAOL72iFTwhOFpAPYmHZn+NBg==
X-Received: by 2002:a05:651c:198c:b0:2f3:d560:ed9f with SMTP id 38308e7fff4ca-2f61e025823mr8837721fa.5.1725004279543;
        Fri, 30 Aug 2024 00:51:19 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2f615194f2fsm5315721fa.134.2024.08.30.00.51.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Aug 2024 00:51:19 -0700 (PDT)
Date: Fri, 30 Aug 2024 10:51:17 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: Griffin Kroah-Hartman <griffin@kroah.com>, amahesh@qti.qualcomm.com, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	stable <stable@kernel.org>, Ekansh Gupta <quic_ekangupt@quicinc.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Joel Selvaraj <joelselvaraj.oss@gmail.com>
Subject: Re: [PATCH] Revert "misc: fastrpc: Restrict untrusted app to attach
 to privileged PD"
Message-ID: <jof6sunnfydjp34o543jnhwz3zmjn32f6cwre3etbn27ov2mxl@mdzkojaqeteq>
References: <20240815094920.8242-1-griffin@kroah.com>
 <b93eda80-828c-4873-a52b-34428f3570df@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b93eda80-828c-4873-a52b-34428f3570df@linaro.org>

On Thu, Aug 15, 2024 at 03:55:01PM GMT, Srinivas Kandagatla wrote:
> 
> 
> On 15/08/2024 10:49, Griffin Kroah-Hartman wrote:
> > This reverts commit bab2f5e8fd5d2f759db26b78d9db57412888f187.
> > 
> > Joel reported that this commit breaks userspace and stops sensors in
> > SDM845 from working. Also breaks other qcom SoC devices running postmarketOS.
> > 
> > Cc: stable <stable@kernel.org>
> > Cc: Ekansh Gupta <quic_ekangupt@quicinc.com>
> > Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> > Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > Reported-by: Joel Selvaraj <joelselvaraj.oss@gmail.com>
> > Link: https://lore.kernel.org/r/9a9f5646-a554-4b65-8122-d212bb665c81@umsystem.edu
> > Signed-off-by: Griffin Kroah-Hartman <griffin@kroah.com>
> > ---
> 
> 
> Lets fix this properly by updating existing device tree entries and bindings
> to enforce misuse of "qcom,non-secure-domain" on all Qcom SoC's.

It is not possible. We must remain compatible with existing DTs.

> 
> As this patch is only doing part of the job and breaking existing platforms,
> 
> Acked-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> 
> --srini
> 
> 
> 

-- 
With best wishes
Dmitry

