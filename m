Return-Path: <linux-arm-msm+bounces-25383-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DDE1928AC2
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Jul 2024 16:34:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DD2551F20C2A
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Jul 2024 14:34:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88AA714B971;
	Fri,  5 Jul 2024 14:34:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZnOZ8YXR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF7D814AD2C
	for <linux-arm-msm@vger.kernel.org>; Fri,  5 Jul 2024 14:34:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720190077; cv=none; b=lOP8yx6alRW/1x3O24w31BdpQ8aZAy7c9585eR1x2pfG9ZgAOV4DaC9gN09EI1yaHYfbU2W/TEGaEBTtKlIkymtfTTLrL6uwWXZBhZWnl7CpDmIsUIfCI5smpCJMqrX8OUhJLfpCOs91aGPVCH3OdIkx253xcy6cJMnEAcncS2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720190077; c=relaxed/simple;
	bh=rxYd9JdXfkIGNNNMhpVSpFn2peaixDj62SxOq/kEikU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SvC/pyOj6daIgkEFaTTn2FQqJ75mTknlCvNl63TU3RWZ+DvdcETAUZvrAak+4loNj5V4Q6jRhW2CGF8i9JQVGi4ocBrOnfH+iQgkIEh4u5GDElJH4uf3atzrTZhK+wX5Kk3u9rUk2OT59L4hVRm75oFCOOZNcyUpMnCRJYuUOF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZnOZ8YXR; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-52ea5dc3c79so1189595e87.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Jul 2024 07:34:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720190074; x=1720794874; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LEJHO7rkl+xJJJhR/OlOUSXNtS4l+Ak5HXkZa8xkzw4=;
        b=ZnOZ8YXRFBF2esveuBoAVWQoCDU2oCQPBzP4BnbjPzQsf3X/zuqOJfnSzhiA+RNLg0
         DyyB6v4l61ROltK8ICnbBAgWqsVx0ibnX753KubIT+G88/3EslfpKnrM9phY8YztMO/b
         qaWlddIvVUQIF+ntvYcbvBhvyDLqVv5TAGQVvTxpBT7xb+RsMkexfXzvTJAGmQ5hzJcH
         LeMFGbs9Ul2i89PfCAzQAx6ucy5pqp2h7iLIn5b2zYbIF3fILgUtP/5vinjoewE12v8r
         EA5dkMAzVI+heIl/jbGwhXncn1g0efOFDyi/xnD5mdq2scqfYPYPH8EBnnNMtqcKShNQ
         jtaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720190074; x=1720794874;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LEJHO7rkl+xJJJhR/OlOUSXNtS4l+Ak5HXkZa8xkzw4=;
        b=w15z5jnWMdL/c7kXfOHu1djmhZx0I4P0/rWwJpfMhHDPqw9GkweuMERifDDRCGacxY
         cdDtHUgYOJrdoZoId7sJ+T2BfYWSWdpYmv0lZDQi4E54dFA52Kcs6u8AOfanfU2Tm1h1
         nA5i2xu2QEisTliGYCGmp6y48YTrMBGi4gQy2xTudAvx7aTwSsDjfT+pKroU/LCk5njZ
         9AYzkKrxXLEqCZlE8r+UnTwowrrVnXgqy3tZVhWpAg6V71rrKWTWZhYbOkquDu3wbCBT
         umeO8DEa4nYboCbN5ISr71TH0V7ErFpuGYqCeX2LtGE2HuvXg258AIO0UlKbKGupCmx4
         ju/A==
X-Forwarded-Encrypted: i=1; AJvYcCWkvTNQIko2zQGMb9kmsM+T/BYgT0Xv2M6Hs6SH7IsialY/RVqhmd/AwAbrAg3e3pR3sjeWJ1ApO1Xuo2QFCeJjy/6GiFh0WE61vWOrRA==
X-Gm-Message-State: AOJu0Yx+Lx/C1plaxwdH1ieqre9BEWwjCJdZbHdhVKAARM3xSA+FiNzk
	4weLrhmplwyRG2tB2V/WGjtftyoIbZPyZQCjvtZaV2YaBzNgZx+lo/kWhu8iQVg=
X-Google-Smtp-Source: AGHT+IExpSPLbhdfXO79t1NxOiXDtAHEROuoPPAPjqvX+SJpApir1f2/GJTe7nfTqsNHoDT+/oAc+Q==
X-Received: by 2002:a19:6a1a:0:b0:52c:f521:9423 with SMTP id 2adb3069b0e04-52ea064ee3dmr2962725e87.26.1720190073677;
        Fri, 05 Jul 2024 07:34:33 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52e9f183e00sm575303e87.305.2024.07.05.07.34.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jul 2024 07:34:33 -0700 (PDT)
Date: Fri, 5 Jul 2024 17:34:31 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Marc Gonzalez <mgonzalez@freebox.fr>
Cc: Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-phy@lists.infradead.org, Arnaud Vrac <avrac@freebox.fr>, 
	Pierre-Hugues Husson <phhusson@freebox.fr>, Jeffrey Hugo <quic_jhugo@quicinc.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: Re: [PATCH v2] drm/msm: add msm8998 hdmi phy/pll support
Message-ID: <5lbtymde3plfiqkvnd2lrjzxhengmsw242uqapnzpvfd5jrm25@x2ik2h6vrdxm>
References: <20240704-hdmi-phy-v2-1-a7f5af202cb5@freebox.fr>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240704-hdmi-phy-v2-1-a7f5af202cb5@freebox.fr>

On Thu, Jul 04, 2024 at 06:45:36PM GMT, Marc Gonzalez wrote:
> From: Arnaud Vrac <avrac@freebox.fr>
> 
> Ported from the downstream driver.

Please write some sensible commit message.

> 
> Signed-off-by: Arnaud Vrac <avrac@freebox.fr>
> Signed-off-by: Marc Gonzalez <mgonzalez@freebox.fr>
> ---
>  drivers/gpu/drm/msm/Makefile                   |   1 +
>  drivers/gpu/drm/msm/hdmi/hdmi.c                |   1 +
>  drivers/gpu/drm/msm/hdmi/hdmi.h                |   8 +
>  drivers/gpu/drm/msm/hdmi/hdmi_phy.c            |   5 +
>  drivers/gpu/drm/msm/hdmi/hdmi_phy_8998.c       | 789 +++++++++++++++++++++++++
>  drivers/gpu/drm/msm/registers/display/hdmi.xml |  89 +++
>  6 files changed, 893 insertions(+)

- Missing changelog
- Missing a pointer to bindings. Ideally bindings should come together
  with the driver.

I'm not going to check the math, but it looks pretty close to what we
have for msm8996.

> +
> +static const char * const hdmi_phy_8998_reg_names[] = {
> +	"vdda-pll",
> +	"vdda-phy",

Unless you have a strong reason to, please use vcca and vddio here, so
that we don't have unnecessary conditionals in schema.



-- 
With best wishes
Dmitry

