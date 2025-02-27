Return-Path: <linux-arm-msm+bounces-49610-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F572A47456
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Feb 2025 05:22:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 91FB21883899
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Feb 2025 04:22:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F7481EB5C2;
	Thu, 27 Feb 2025 04:22:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oRog99tJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C63D51D934B
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Feb 2025 04:22:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740630138; cv=none; b=u34BR2vpjYmugQZC0ydUwCRQDQTH14tVm3K/Md99KAJpm7WYKY1nxUDKIMT+uCv0N1FxCo91OC7jqLpEZQuIfNPvObIWEmj8Df0hU6fnzPZcGm28NI+4S2w+JrI9iZ17UEBc4lHVXWmg+uIFAn4t/9zOPTpwN7A3FKlogY+3J+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740630138; c=relaxed/simple;
	bh=5oIUiPUuW9/Wfa4lWUIfURolnu3e+cbmsD0Czuzj46U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Bkkp5D4wVbKrTTPQfvxKf0v33a/ar36PezkXT43kUXJxrcB7fMG2YuMtDgUNamxpdEZVCrsORnrVEKK5ekP0YaEjHNOUnqI+7qNlJFaSDoyeyoT56PwNJhYyAuoRRTogb8Q0u0ugdaskGbrktyDCVvFcSyMFk1upwkR0Xl+N27c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oRog99tJ; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5452e6f2999so438794e87.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Feb 2025 20:22:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740630133; x=1741234933; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=EuAUHe2HvirnbniJws2V/C5qa0J/b2o5CG4USvlKN/o=;
        b=oRog99tJpPnueW6XTxb75LJJ5GtFoSaHHu09BtpB+DJoyvIVHgknmjAfbgoXn8DFiE
         ELDgOzq2tkJEVvlBy/yN5GCAwf536TmWe3C7yRVNQLgZR8oO0EcN1adS2RmdBjgeYFYg
         OtI2BpzXnm4crnRMdm2Gxvq9T/haAdT+GW58ohXTu2Hm5Q/OBha9bf+98X+PWltRMlSx
         e32EE4KT1Ll3UyBqRQqo+PZGW6JfdRW75yNx0VZacQVlASYTux1bbTJATYvnxQWqfrC6
         pG+gN33b0CNSHRGrFgjuxORq8QDiVdVE7fgXXJMkt55UtztKqLPBrXbtiFKJY0QYhvG5
         O8Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740630133; x=1741234933;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EuAUHe2HvirnbniJws2V/C5qa0J/b2o5CG4USvlKN/o=;
        b=qN9iK2YsRXnqmNY8fnrXfQX4MQKoJR2PyEyKQMfIe8d8inup+YqH1zG1/0PjXxXAy2
         iC/QZY5TMhKEE73JcQnIO4QSz0ZzkLNPn3ZhIuxoYU0pmBzYhLrFZbhdyq9c8/C7/OdL
         jnB/o0HWZmnooQkc/x7h9RHrRnza6zY7K/nlpRZRg43CARs1R1cxMy7LHqLHvuYHAZhH
         p6HoumBWhKtrctX+FMW2K/nsnJilwvsYdcUtjg3mEN+XT172DAz8PidbqVQCUzyUJzmI
         OURTyxkJOh1DBRej9BIUHJVvrMh839lBja//7nOt91JuyDVzUgGCRmC72PaUOgv3tLdB
         5twQ==
X-Forwarded-Encrypted: i=1; AJvYcCUWiRyKMzh2um/cUSQlD1JnxKk2HJj+p6UybyrLbuVoF2LM39V/X3eCQO6NpaRL/39N5APa3bDDQloli32O@vger.kernel.org
X-Gm-Message-State: AOJu0YxAWpixdqygolrbCkDXdhSe99wBKXIVrsxM1HZ39EfVN9YkUrYA
	ZB1OId3XjgTIY080VXPmR95igJREvzZcpMxYeMVufnwQk5iv+Vurf2pbpPoeL2Q=
X-Gm-Gg: ASbGnctpb/1KitAjbglkRLpVmg2VH0xFxkQlEFLI1zNKvi7vlAi2wrqOu3XcOEwmfZl
	stLssAqCjaFmh8hdzeCVwDzW74Mw2gxJqSPi1h14OOiSULR+yEgt7OkAGNyB+Si070ASi55umcm
	JHuD5M53LqpG13hmeU+eKvHBUzrx9Fjyrzc7Jq/648Rnzeoh4lsHr6fM09PmSWE2AvD0MzNc9+f
	GE/Sz+gcDPdI01XzfL+9nSD7pOcsNjbmspSIHXd2Roa3vXapInPDEiUR+h0ZmBisCKD7/d5Pa6T
	8bBU+USDSeTlsjDeaGkCGKN9OHLIiPOCbd822R9R9LlIqqkUXLn1bQ/E7narGx8B5wP2Myc9Hr/
	Fzjg5Wg==
X-Google-Smtp-Source: AGHT+IFVuxcTMXSGELJtG6vGwj4u7x9DOeXvKGs8bHxJRAKA8hCr0W76iJG58PMKSr6dsn2bX7BIrg==
X-Received: by 2002:a05:6512:b98:b0:545:353:4d46 with SMTP id 2adb3069b0e04-548510d8085mr4709485e87.25.1740630132885;
        Wed, 26 Feb 2025 20:22:12 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30b867c8f7dsm601111fa.48.2025.02.26.20.22.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2025 20:22:12 -0800 (PST)
Date: Thu, 27 Feb 2025 06:22:10 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rudraksha Gupta <guptarud@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, wctrl@proton.me
Subject: Re: [PATCH v3 2/2] ARM: dts: qcom: msm8960: Add tsens
Message-ID: <jt4o4btmvfxorguh24yqr4mxfy64o47h5uql4swtveqxlo4q2e@2ozfhduyvvst>
References: <20250226-expressatt-tsens-v3-0-bbf898dbec52@gmail.com>
 <20250226-expressatt-tsens-v3-2-bbf898dbec52@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250226-expressatt-tsens-v3-2-bbf898dbec52@gmail.com>

On Wed, Feb 26, 2025 at 07:50:42PM -0800, Rudraksha Gupta wrote:
> Copy tsens node from apq8064 and adjust these values:
> - thermal-zones
>   - adjust thermal-sensors
>   - delete coefficients
>   - trips
>     - copy temperature and hystersis from downstream
>     - delete cpu_crit
> - qfprom
>   - adjust compatible
> - gcc
>   - add syscon to compatible
>   - tsens
>     - change qcom,sensors to 5

I'd say, this is probably the most unusal commit message message that
I've seen.

Nevertheless,

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


> 
> Signed-off-by: Rudraksha Gupta <guptarud@gmail.com>
> ---
>  arch/arm/boot/dts/qcom/qcom-msm8960.dtsi | 59 +++++++++++++++++++++++++++++++-
>  1 file changed, 58 insertions(+), 1 deletion(-)
> 

-- 
With best wishes
Dmitry

