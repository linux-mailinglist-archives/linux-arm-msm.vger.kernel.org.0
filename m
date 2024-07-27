Return-Path: <linux-arm-msm+bounces-27114-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0049B93DECA
	for <lists+linux-arm-msm@lfdr.de>; Sat, 27 Jul 2024 12:47:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B01F2283A36
	for <lists+linux-arm-msm@lfdr.de>; Sat, 27 Jul 2024 10:47:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 624FD55E53;
	Sat, 27 Jul 2024 10:47:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Vd809/RX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3094433C4
	for <linux-arm-msm@vger.kernel.org>; Sat, 27 Jul 2024 10:47:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722077265; cv=none; b=fC+g1cHRGJoazteLj6jY4dKG4ae2c4Cqxx41mlxRNC5HPfE5qErGDm5bWBcPUJla3bggGv2jORaNSym4/9J/4ZWoqaHFPmmlgTK9zeOzaxoR5wfe50Ff9EHExHFBUv48Fzjskwl3a5MauBDFsWRAIr/7U5832jmAOn1wd1rJkng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722077265; c=relaxed/simple;
	bh=CxQCaVkPKiM+dSjOjWGM0B5dxgOP8eZ7QW6Iaue7xE0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qD0pP7+Es2xTBzqhLfcPzGXyQ+P0gL1hfPQiuAdG19MovVjN0VfK9YsfefaIqPiaJ/1zghgpRRPkqaYSWtLFwTAWsodjRmlyVKxOszttr6GiFQPdGFGUBslzzboGSnj6ZqMTqImiPYoBnoh4ORQJSHasdh1CQ2e/ZbVwPiSw+PA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Vd809/RX; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-52fcc56c882so1629403e87.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 27 Jul 2024 03:47:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722077262; x=1722682062; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PgZxzidyEshqEQG3bGebzLz9u8Tr8K9k35MYbayHhxk=;
        b=Vd809/RXii9JNNmHpkXbcVs43XkeOSFaw34SjtOH+6tf8YkhPlOz3LNuoqH/LNVqXP
         FX61XCh647KLtO5/mdTQ5Q6PtK6h6TSmUtyFFBlxYM+BRar2b8uvmasLbZyV0WCFe1fp
         7jyZ53fDtXokjU2AO/N8ISuebyt8k6qhT4UqIgSUnoTmQzLBTMJUCyayOhbY5CeACf9j
         za/UmYoxmxcPAj15Qt6hVFAo0/SlZ7/JCkseKBkrVYNwx9HekNhh6XYWcxqAM1sYdNIM
         dxE1Drw7PUbO5kBx5D5AnlpvqgvDw25Bry2hkCf53yy1Oq91gaQVJWd3FFk3MB3h7vfG
         XEvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722077262; x=1722682062;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PgZxzidyEshqEQG3bGebzLz9u8Tr8K9k35MYbayHhxk=;
        b=gNObIXG+frdh6SydjecoZNGQqjFQ88bWEKjv65gXvjI8IHyygb6QykX24Sigv0Z0RD
         v1wWh39g5D2ZVBetHnYQcWP8s4EpWvrnY5I+4gdsBVY46NPH+GcSJUqPu9/qymITeJqF
         6xSS4Hwhh75NU9YcqwQLN/7jMGw4LH5/jW/K2y9CHqip/eqWj6Ii07NAaz4N8fa3BjMb
         GvPAj2iphu+5FubWSXBwo1dxm4gdWcACw+2+mVHIbP+ZORLU2A3cQ00QI20ESB1pPE7b
         jX65t5B6UBoAMqahLq5YPsRmERmb0ivPQyAffzHKFZR7I3qr1a80oKrFmxn4s00k1tMJ
         6Ywg==
X-Forwarded-Encrypted: i=1; AJvYcCUCJEJ2nNF344U11PJnOmmusMicjLmPm3xGrVT1wwdx4oJwiB3/oJVCbUHCr/3D7yVeFiapKqikztGXVg6+gLXJ1DZwixOrpd4CgISlbQ==
X-Gm-Message-State: AOJu0Yyynv/Pr7QtcsHr2a3XkxgxoVRnmatUKhtn1bE1kTPgq1XO64N0
	NgC3IeGEq1oGIOdXFNepO90Qphd1mHrnvtr9jkT0btDtjENcxQo8x7vYqNE6I/I=
X-Google-Smtp-Source: AGHT+IFinSpQ7BYm+GtIK2AR4f2kI+7iSE/VNTey3Ki9zIDB4o0fctoD8bK6ZZn9hTNYPBvsFYkIVA==
X-Received: by 2002:ac2:5e23:0:b0:52c:caf3:98ed with SMTP id 2adb3069b0e04-5309b718d49mr435661e87.24.1722077261761;
        Sat, 27 Jul 2024 03:47:41 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52fd5c19ee3sm729586e87.220.2024.07.27.03.47.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Jul 2024 03:47:41 -0700 (PDT)
Date: Sat, 27 Jul 2024 13:47:39 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
	Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/7] ASoC: codecs: wcd938x: Drop unused defines and enums
Message-ID: <vcufh3cp5ulm3phbgucsofqapfrv77bqgf2e26qolftviia4wj@aztjalnuxqby>
References: <20240725-asoc-wsa88xx-port-arrays-v1-0-80a03f440c72@linaro.org>
 <20240725-asoc-wsa88xx-port-arrays-v1-4-80a03f440c72@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240725-asoc-wsa88xx-port-arrays-v1-4-80a03f440c72@linaro.org>

On Thu, Jul 25, 2024 at 01:23:46PM GMT, Krzysztof Kozlowski wrote:
> Drop defines and enums not used in the driver.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  sound/soc/codecs/wcd938x.c | 18 ------------------
>  1 file changed, 18 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry

