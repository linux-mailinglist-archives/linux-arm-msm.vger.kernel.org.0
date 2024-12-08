Return-Path: <linux-arm-msm+bounces-40893-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 76F359E83D9
	for <lists+linux-arm-msm@lfdr.de>; Sun,  8 Dec 2024 07:22:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 518511884857
	for <lists+linux-arm-msm@lfdr.de>; Sun,  8 Dec 2024 06:22:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6BD640BE5;
	Sun,  8 Dec 2024 06:22:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vNQsg0+X"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C40DEEEB2
	for <linux-arm-msm@vger.kernel.org>; Sun,  8 Dec 2024 06:22:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733638969; cv=none; b=qgkHm2qta2yLcx2Y8RCjvhgi9ycwZDGqiMyDEzScguKSSw3iIZwFsV5wFu48ecsmv9tW3n72kkY7aImhi2RlK0IkLFgyVQYmXP7G2W41TVuhp61Zp9WIM9G1+uip3DSCQfeGOS7Fs2+FdgyGU81/EGdumE1QCMvJocuPtUGiF80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733638969; c=relaxed/simple;
	bh=AS3azZ+PfLiRvJ+8Za68SmM9j3QMKamcxS6Oj0hfhCg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RKaKwIrrGY18soXW9FnUGX0aIZeXFqqfQG6lnyAN0ahkc51KlT0xL8Iv3CJPugTQybrzia7LH5xY8JCBrfN0JGI2yEHLc1SbwDmWyRfZEwLcp/kqExJut6xum60pxVSjHYLd+7AeK7bM7eJKOVErr+7nGrLbyW5ArahrRKpgDuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vNQsg0+X; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-53dd668c5easo3540739e87.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 07 Dec 2024 22:22:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733638966; x=1734243766; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=38gctL7UTrHCs9qA1LF95XHQwmYDkv868rO2ODhNpiw=;
        b=vNQsg0+XbJA/50xOX5QhhNHOkcpjGDe0dPR0n1Og2Y7qXki+XSWHcYhrYhS1cOXIKf
         uYnGlrIeWH8Ra4E6BovXVAhuO9DmU39OjELj+bdhMWVhgB6bSGpxNbKXW6t3dn/tcdAv
         RqXPwEKm/agWQY70/miDXS0z1NjHoRAzdUq61PwwYuQEsOlyXEcaW4r586LjHnuluYZQ
         Hq+dOXoVNs06I2MNBgvQx7IiGh/wY6hYtb/eVMABespHGLpFd3TTAFV6dLOUDUgMe3Bq
         VAq4aBcenP8BZ8zVDTW1DXgUOJ2x+lDw/ZVV338J2vw9YPryyXB7Gyj9l5PwECJ14sEW
         FBhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733638966; x=1734243766;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=38gctL7UTrHCs9qA1LF95XHQwmYDkv868rO2ODhNpiw=;
        b=XfM04DmMMcswM19BoHgGawLVil5Q7G1k/lGQ4zWir95F3r547uVPlwBx/HvPqiV4tQ
         KvNM9uObBfMPUPiMHZDr3xUmlT2cjGTMYndp+KG9/wQu6ptEKjlx1uDHpKM1b3h8NnR7
         ROMS3PL3aavCJiwaTddImecWIfAnUpragDM57bJegr8vxsdCFYElqRXefYyMWyVfiTPn
         wjalbu9kmuDoOYJcSzZgOp2agzJxryEbFJXDA+QVyf/g2AFgtFch6bJzB2XYs2q/UP16
         BQd0ww2ypBh7keZ7cVSU7arTShITuDcRRGiibwLXfIwhfy+dyyRLN8PiOOgVXeCjvweC
         kWWQ==
X-Forwarded-Encrypted: i=1; AJvYcCWAlKJvnv7PYD/fCKG4r+5gYSyZPeg4xiNj89T9CtjQwBbNOeTnbk6SsFqkIoVAHhb9N8Nb7rFaE/nY4/of@vger.kernel.org
X-Gm-Message-State: AOJu0YyJVVQpMefDYeTPaYzQoFEqEfGkcEHsaQKgGJVT9uVYLrUfJRgy
	78QzDkodEzpIPLh0yqV9o4CP3Xurx4Pc3h2OJTdcsGg2YyF2aHjF/8aZF0Qpwe4diCJ/BFqOdzm
	oQ1U=
X-Gm-Gg: ASbGncvKEekYZrcngYFvwY3HgGB7pWJ+O5T9ktN/6hSx4Qax9b+fPBywfkYHEjwicJS
	L3QnCHgDsQ03qaLtOEPR0h7RNSzYyW8KTc3jcQyqNv0wQQgwHLJ0k/Nt4SeSRs5/3DVOwetljnn
	9eJxbNUC4i2uZPAJzpKEhAvLuX3vSG2U5nYgB1xoQ4kCc9Nrh4vWDzR2ZF38BXI8jkYYo6Y3h6B
	Nh1PDD8JckOsZdILlFdIlS8mVj9oK9AS28MO21nj4gKKsadp93fFhlLa4gRdwclIvL88rxtUnbt
	AlT+y/64eeu+sr/RkcD4WfIxFHnllQ==
X-Google-Smtp-Source: AGHT+IH0qp1aPQA+2OpPaXQ/vPvKw2/kQ5aoewjrbzmt3QID8qu4PyXFLKKH22VCjIXIHCP65iqmvA==
X-Received: by 2002:a05:6512:3dac:b0:540:1bc3:1061 with SMTP id 2adb3069b0e04-5401bc31213mr349243e87.11.1733638965870;
        Sat, 07 Dec 2024 22:22:45 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5401c2c700fsm99554e87.86.2024.12.07.22.22.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Dec 2024 22:22:45 -0800 (PST)
Date: Sun, 8 Dec 2024 08:22:42 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Stephen Boyd <swboyd@chromium.org>, 
	Chandan Uddaraju <chandanu@codeaurora.org>, Guenter Roeck <groeck@chromium.org>, 
	Kuogee Hsieh <quic_khsieh@quicinc.com>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Vara Reddy <quic_varar@quicinc.com>, Rob Clark <robdclark@chromium.org>, 
	Tanmay Shah <tanmay@codeaurora.org>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	Jessica Zhang <quic_jesszhan@quicinc.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH 16/45] drm/msm/dp: add support for programming p1
 register block
Message-ID: <ku6ytypptjtydcgscdvwsi62cgxokxn6svwwzs2ce3otnnlrrl@uvr6st3365kv>
References: <20241205-dp_mst-v1-0-f8618d42a99a@quicinc.com>
 <20241205-dp_mst-v1-16-f8618d42a99a@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241205-dp_mst-v1-16-f8618d42a99a@quicinc.com>

On Thu, Dec 05, 2024 at 08:31:47PM -0800, Abhinav Kumar wrote:
> p1 register block is needed for the second mst stream.
> Add support in the catalog to be able to program this block.
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_catalog.c | 29 +++++++++++++++++++++++++++++
>  1 file changed, 29 insertions(+)

> @@ -145,6 +148,26 @@ static inline u32 msm_dp_read_p0(struct msm_dp_catalog_private *catalog,
>  	return readl_relaxed(catalog->io.p0.base + offset);
>  }
>  
> +static inline void msm_dp_write_p1(struct msm_dp_catalog_private *catalog,
> +				   u32 offset, u32 data)
> +{
> +	/*
> +	 * To make sure interface reg writes happens before any other operation,
> +	 * this function uses writel() instread of writel_relaxed()
> +	 */
> +	writel(data, catalog->io.p1.base + offset);
> +}
> +
> +static inline u32 msm_dp_read_p1(struct msm_dp_catalog_private *catalog,
> +				 u32 offset)
> +{
> +	/*
> +	 * To make sure interface reg writes happens before any other operation,
> +	 * this function uses writel() instread of writel_relaxed()
> +	 */
> +	return readl_relaxed(catalog->io.p1.base + offset);
> +}

After looking at the actual code, please implement
msm_dp_read_pn(stream_id)  / msm_dp_write_pn(stream_id)

> +
>  static inline u32 msm_dp_read_link(struct msm_dp_catalog_private *catalog, u32 offset)
>  {
>  	return readl_relaxed(catalog->io.link.base + offset);

-- 
With best wishes
Dmitry

