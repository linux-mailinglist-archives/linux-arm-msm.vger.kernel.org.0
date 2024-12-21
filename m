Return-Path: <linux-arm-msm+bounces-43046-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 413749FA18F
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Dec 2024 17:05:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A9F54167038
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Dec 2024 16:05:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22E3A146013;
	Sat, 21 Dec 2024 16:04:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Cz1L/YfL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B5FF55897
	for <linux-arm-msm@vger.kernel.org>; Sat, 21 Dec 2024 16:04:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734797095; cv=none; b=W33+SjTI0FJj4r1RJB+Jx5jMWkGsLBMxsdX3qqUpLWbF8Tkq9cadVNjuqKIQdOL/VAyvMv9pI38pAcPhVSxY4tjwrJGc6Ey6PIEEiH0k7uAiExIIyGwBOo3e5JYInx8AeZOJnZtB3TtLgy7ixuAFZsdkycwZDB63Oayh94lwb6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734797095; c=relaxed/simple;
	bh=XprkMDbQVHB7HHnSWENBhj2WANzn+uQp8Is/IQD88PE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RJPVD5pajL67GKyK6XQD0uBU1TJswoUo8Bafxltjq934ViL/DpTuZ3OgFVLkwFQ3O7aT7J13P6WVZn7Fz8lkxFmuXrjMY0szjwXnDtMtKGtfidjLAUTDMYi8I71AeHs57U2D5I1q93xz+76JFoB0SW2wpQniXwK9EeZuVk0DrDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Cz1L/YfL; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-30036310158so26293401fa.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 21 Dec 2024 08:04:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734797091; x=1735401891; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YNN+KzKb+y822BYZ4quule9WMgNPlKOzcu4nY8Sav+A=;
        b=Cz1L/YfLDR5GPwgQgkWNsScfj5Y2o9hBwSWR2rdqR9DqJO5BAfUx9gK3YLO9ldZNE6
         1UAxr19LxBFXK/MZWF930xh1WW/qkFKXKnRP0ntYj0HOMqHby4MirU7l3flEVsjpAxo8
         WhmkO8fmskaiSx8ZvxIMNf+NK6RgCcGtimstyFpTAASlnModc++VtQIL0AN3U910gU1U
         lKo/nlndEKY6CbssmlIcl+HYw6MtMNmjUu/KyDeMnw9eUKUjqISufwYIjyJP3JP2ZBxi
         Ex6R3vgpbSwQ9MzB0HuJA8adAMWx73yS0H6USLFSQ3XfHDBagGwVB+KhSzzViWkKSFcR
         LIzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734797091; x=1735401891;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YNN+KzKb+y822BYZ4quule9WMgNPlKOzcu4nY8Sav+A=;
        b=O1SGc7Ht++L4H7y2m9xr6/Tf+9fsuGExgYJR1RqpydyCwcSPqXgVYwGIvOWoT1Zvls
         1ycZXOtlXoLeQJcHOQymiznL7huOEmPr1telKAfcPB/W6NNQkafA+++oiKybq9py4/dy
         ZBX6A3oslQjYBCi0Z5/4tbff82vseFjhqI9lT3J5mpm8norKIbt8NjUCSC3zZe943Nhc
         9cUsddlhHJgNtLDsYkqCrC0kQNGOoLVnowIKtVqaFP007SUkQNOqnC6uitqTxAjeA8Ny
         AYLMlJalogyS/9tFh07ef7tz/B5zfjXI3688uUDIq4az1uLkQKJZ+8NOnNS5DDJU1QJU
         37EA==
X-Forwarded-Encrypted: i=1; AJvYcCWrVNd29oiuNour4lu5engFbTXuON9d/9zcsggTSh3GiWjlyNUEHDaZAW51wiheZT7ow4IwRAn/FoDhfrLR@vger.kernel.org
X-Gm-Message-State: AOJu0YzzxBPS0zvHXpf+z3bTwnDlURTIaWV5557JfH60UOP9fQgaHvU+
	ol2Uf+sgb5kJFApoD5xrjYKeoXz0dIMdlSkSZl50K2iUn9JLK9kYW3wDX2Cmx34=
X-Gm-Gg: ASbGnctujE524y+6Y2PIZa31eXXiABsagR35ew4agC6bstQvdCI31jCEM2icM8o9pL6
	cANBv6epf8mOzUxcwI7TrbcIAxqPhrl1lpgqqXvuhVuAI8GDgo68dR5AY+xaU759luC7Fc8TdY+
	0atz4rhvLPj5/zwTkhVSkh2cAdFcZNk32t2HbqCuJCoSJpHbmO6RyUOPRbay9WHcT4X1OIXaA+3
	UXyi+O+0bdkd9JyRNZXCkZIw9VtGX/eaC0rKF7bQYEkSnoWc0ATFTxY64aL7sj5nSMtKRur/ghe
	gZ/NwoSThtERc7triQ3v3yg/Z40LWZ4VjZP1
X-Google-Smtp-Source: AGHT+IH//aDjXNbR0mGsQ0JGNuZxSXVKCn/a6qPh41FbBA3dmcjSII54QdsRwpfOXPqNzMHYHc9c0A==
X-Received: by 2002:ac2:4c48:0:b0:542:2906:786 with SMTP id 2adb3069b0e04-5422953c28amr2351592e87.31.1734797091129;
        Sat, 21 Dec 2024 08:04:51 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54223832c26sm762223e87.279.2024.12.21.08.04.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Dec 2024 08:04:49 -0800 (PST)
Date: Sat, 21 Dec 2024 18:04:47 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Marijn Suijten <marijn.suijten@somainline.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 3/4] soc: qcom: pd-mapper: Add X1P42100
Message-ID: <uarbtdd5t5nufdzsddv57eu67bogj45zqmpnhzl42z2sslgm4g@ahqunjasrauh>
References: <20241221-topic-x1p4_soc-v1-0-55347831d73c@oss.qualcomm.com>
 <20241221-topic-x1p4_soc-v1-3-55347831d73c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241221-topic-x1p4_soc-v1-3-55347831d73c@oss.qualcomm.com>

On Sat, Dec 21, 2024 at 01:36:02PM +0100, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> X1P42100 is a cousin of X1E80100, and hence can make use of the
> latter's configuration. Do so.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  drivers/soc/qcom/qcom_pd_mapper.c | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

