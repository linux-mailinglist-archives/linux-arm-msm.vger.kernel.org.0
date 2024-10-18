Return-Path: <linux-arm-msm+bounces-34979-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C0A0E9A4261
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Oct 2024 17:32:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EF3D91C22C5D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Oct 2024 15:32:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A25292022D6;
	Fri, 18 Oct 2024 15:31:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LF17OhnF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93BA813D52E
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Oct 2024 15:31:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729265515; cv=none; b=YYX2Xbbf/SWZmpN2ReoDeQpeaSi2chtzT3UyYdo9zMTuOTWjhqLH6rKICgzIdHcAZgx2bmnzEby8woA5yPRugm6UdTrILzX/0Eknc8FG/N1zspIygXV7LgiTUc9FT5VAZh0gimss5wVJGwXRRA5oUbyShtL0ZmpZ7V2Arwov+OM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729265515; c=relaxed/simple;
	bh=gQeddZA7AUNwll6ggmREqwiuhKzdOjqoIFQvMRD4+w0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fpMVAtRI5qpyQr4CY/1oMDGP2vYcLpEZrat1MuJF/K1bNt17bldhlAGJBJq1WfxApXeCzJf2yNtPxYFiS2AGyCUCdcMxytdAE0FBHbmeCiBdLzU8P2kO4g5QqBipW5V/HJC1lUmScZdC6vp4kDLM97RyjFK9XOUJk7WB/wDlgLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LF17OhnF; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-539e63c8678so2976842e87.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Oct 2024 08:31:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729265512; x=1729870312; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=v0nybU+upPHt2Dx8CJHCDz0JeIFRaZFDVbO6aBhUo3w=;
        b=LF17OhnFOdHr6XdlCUdYLDWBUF1bmSIVRBulPKzehc8LJtbTlpu/nRFQu08tH+Vrqb
         iBQeBKSOOYWCR1TH5WStbIG73V1hGT0OEImMwNg6Oo0V/pTbqP3I2EFDv2uLqTYFhYrB
         XKjPWarJP4aV4taRbbFcVoYa3V4M+IkieYHZhIGC1676Njl2UK6Qpeckxp2/EpckNutn
         RePP4oiO/9S+i3yIQkKsfGJdBVT1W9FIY3fOxNGMVRiQaU7EA1aMkO6iSZ/s6knAyRe4
         rwGbjXAIRONn6I6qGPWZ36/BRMB2yXS0amjSzKrr9MsNtCA2qIXtUscjbY6Cen0jHi1a
         xKWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729265512; x=1729870312;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v0nybU+upPHt2Dx8CJHCDz0JeIFRaZFDVbO6aBhUo3w=;
        b=AuhXOJYT0kOTVvajoO4jYaC4D0/580CdT6Ll3c/iPMjTwZeadCH6rAsMrTEsBW6L1I
         1hVaulVoVnq+aVxEEOfujh4KGjwNYO9WSFpjDyuhkbGzXSt4u3VGsseeAkzBGcnuTGlj
         xin7nsIjt1X6pKzEKgwuPQcj9H1hc8HzzFQAUujSb9DRpCFPoawDkb2ZW4e6QeVjmnSZ
         Ncd0Zs/lsueCC5kSgzmEU+Zp4yDwE1aTD5TQZYaI56kUT7lB3H1mNjRyN9kAYloRl7WE
         OMRs4JRAC8WRSmc095Tx9gCUdGUoRTffNanB/gxcNADAq5ExfKhUD/3j0rUFzpVUpnIH
         msgg==
X-Forwarded-Encrypted: i=1; AJvYcCWMhq1TFnBok1hqMr1Hb2yxoadGzHuEzjKO7QRXtEd+O+79xKJhWa4M3Mj0wKbXkTTLVRBOmRefWNF8fMDm@vger.kernel.org
X-Gm-Message-State: AOJu0YxaZ505m4IaRqfDjuZ1jZNm3We5pof/C549ZRf8ToC51q+5k3fb
	oGfKl46ZxmMDnUmGGSDDWgOD0ETb5tgNaoLuCixUCJjXF7RS9ne69PQpznHX6PI=
X-Google-Smtp-Source: AGHT+IEYN8Z/8ko7R/xwHM1JXJhtjnqNmKTe/HKd0kHZ6O4I/L4D+iF6YO0NLqlfFP8rSbsSSvLPgA==
X-Received: by 2002:a05:6512:12c3:b0:539:d870:9a51 with SMTP id 2adb3069b0e04-53a154f8ebbmr1992715e87.48.1729265511562;
        Fri, 18 Oct 2024 08:31:51 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53a151b934esm246241e87.100.2024.10.18.08.31.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 08:31:51 -0700 (PDT)
Date: Fri, 18 Oct 2024 18:31:48 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Johan Hovold <johan+linaro@kernel.org>, Kalle Valo <kvalo@kernel.org>, Abel Vesa <abel.vesa@linaro.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-pm@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH v6 2/6] power: sequencing: qcom-wcn: improve support for
 wcn6855
Message-ID: <gqgawgpcuw7ojttxh33fsymmucpfixeqhed23fkic5gz6n4nya@ubz23tw5x7vd>
References: <20241018-sc8280xp-pwrseq-v6-0-8da8310d9564@linaro.org>
 <20241018-sc8280xp-pwrseq-v6-2-8da8310d9564@linaro.org>
 <fee25ac2-14b8-412b-b093-1526443498e7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fee25ac2-14b8-412b-b093-1526443498e7@oss.qualcomm.com>

On Fri, Oct 18, 2024 at 04:30:17PM +0200, Konrad Dybcio wrote:
> On 18.10.2024 2:49 PM, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > 
> > WCN6855 (also known as QCA6490) is similar to the already supported
> > QCA6390 but takes in two more supplies so add a new vregs list for it.
> > 
> > On sm8450-hdk it also requires a short assert of the xo-clk pin so add
> > handling for it in a dedicated unit.
> 
> Any chance this fits into what
> 
> Documentation/devicetree/bindings/clock/gated-fixed-clock.yaml
> 
> describes?

No, this is a software controlled set of straps for the WCN device.

-- 
With best wishes
Dmitry

