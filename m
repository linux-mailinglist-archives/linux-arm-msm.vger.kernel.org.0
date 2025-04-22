Return-Path: <linux-arm-msm+bounces-54915-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C1C8BA960E7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Apr 2025 10:21:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AFDB0189BC8A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Apr 2025 08:21:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF5111EB1A7;
	Tue, 22 Apr 2025 08:21:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TivrMAQL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C92118632B
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Apr 2025 08:21:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745310086; cv=none; b=LT9CpI3VdxBQIfZ3X3ENKesWq9gL+YV05zld+eACTL7XRhIo/f2M31R0s/2dH9OjaNudwss7k6X5NSNox7/ZLfZ9MNB1+5Bz9U7j0lzqobOvbcQe6PHze15Ii5jfArAnWlvCSptT9bPuoIh1HLpoZaE6BkyxEFevgfmZnP9blm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745310086; c=relaxed/simple;
	bh=jpRL4uJSEdZLr7FL6t1JTRk0auYOuocwYz9sSV+moUE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GX60Y6l8o5GQdABkgNl1Qn8493RFfhAE6pZ780VU9d142mgFdWTHS+G/i3//n2ha+PBsT63EYj3vvBD1Q9U3te0xVWrBGkUXG9NVziMBDIUp4eIcLMMJ85VKUmqeb2WTFESX3buxRMadZX4a7FfQEuY0mO8V+L16eVAC/NJwb5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TivrMAQL; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-39d83782ef6so4098563f8f.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Apr 2025 01:21:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745310083; x=1745914883; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TuoukROcO2ElaqlkQLbNy3B557q2zcJ5qBkhA4bvFAU=;
        b=TivrMAQLFWx6Cn73WaO66dKGfJsdzVnoy/zPOVAbwif/nja7cHH2iQhRQ1fcfbAXpb
         wop0ifOeniF1JI+ruIVNGylpVpsdWc+4t79QO5ObGLhlmCeiRpihu+iPRGGbDyLKQSaG
         8mSopqRwueuI3Bj/uA2gSgodpZ264A/FlOrduEWWjgo952bQRqS5b3xBqny41kUeLXLz
         SaqvnbGrrJc2jJPTgYgpqV3PLR24XJ1i1xDn0tNPjY+wGP+f+t6Yn3C4+8Yu6PU/csJL
         6p2kuAM7vqpaAuf+6R/BE7mhy/Tp3z94xPlBPxku2EDGZrd1xrTpIWm88bZ36rFnXS1r
         kT/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745310083; x=1745914883;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TuoukROcO2ElaqlkQLbNy3B557q2zcJ5qBkhA4bvFAU=;
        b=VTTmoimYQVgbLtoe79bz7EJKOwP1UMZtIhvaolbHSh/xQImoVx+PVtOobG4aIutA/Z
         gpm4Dr/ZTREZp3AYN1mLD95cIsgUFD/TvHhWqTWXGCIZ9XMC+JxUj3EcM0GgrtpkWsWU
         Ao40kElvHeGm1oBduUEBBHDiGgwDevBammg0q+++g3nG/zlc5k+/qb0R7jgewFHdx76E
         yfFAoisnaWnajbA8K1mfPNeehRQEIVzYZYA8aKXmI2ahNWg5f90bGbFnABH88O4+pJD7
         qXaGZbVzmmjKzCIIRJtB084k9Xl4S0DZTzWQ3PY8lQUO0FwdM/G2/rQUWiAxEawM5Ce4
         kYzA==
X-Forwarded-Encrypted: i=1; AJvYcCXt9uGaEsYD6fY4h8+sfrkAZ+8NzLMjAjhD0Mg62LoxBedot6z/SREpZp1yE37LgRTL4sAYxStnhmRrR8R8@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/Uk5BNlfmTuZLi095AgUewYUoIASAcARsbTcAP54gS3Qwfujj
	SBwpYodcm4JYX9Hg3zxfAP5xymrC6a3f3g95lUYKAKauwUYUVUdxDjFeZE4Qa4c=
X-Gm-Gg: ASbGncuUQVRPkC8CxmPVaYajEyR3y3VUpn3dxAynn0DhiqNMkB8j+bjtOU9nQei9gQl
	/DI3M8qPiOvu22mSX5VBV7R0UirmKyUyN3Ey7+SLuinMM4+2CRp3IOefG7Am2V0kGxk/pkTaJ9u
	pMki66UDVISI3S9Z7CYNJj4cr5zCuF/qUsmc9ucFPFfVPgABJQwyqiN8apuFmh2digXFhPzD5nS
	w/9LrIXOgVYPt2nG+jjPgL+L0c1jOhLS+jJ9onIabDQL5jsLLa604mCVUea3xW9DjPnvChSMByz
	llMP+V4yRmjrgrAreh16J5x4AQ5pP5ddzTtPk60tLj5E7OyFEyPQRs9HYBkso5E=
X-Google-Smtp-Source: AGHT+IH9tuae0RqMiAjlvkLAuiChQYIp6/1WIla4R14zZPg7A3cy3CyoOen4tg78+umwpPgStlkyhw==
X-Received: by 2002:a05:6000:40db:b0:39c:1efb:eec9 with SMTP id ffacd0b85a97d-39efbd68416mr11766494f8f.13.1745310083047;
        Tue, 22 Apr 2025 01:21:23 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff21:ef30:28ea:ef8d:b4cb:c00c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa4331a9sm14597808f8f.36.2025.04.22.01.21.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 01:21:22 -0700 (PDT)
Date: Tue, 22 Apr 2025 10:21:18 +0200
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: =?iso-8859-1?B?QmFybmFi4XMgQ3rpbeFu?= <barnabas.czeman@mainlining.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org, Luca Weiss <luca@lucaweiss.eu>
Subject: Re: [PATCH 0/2] Fix fallback qcom,ipc parse
Message-ID: <aAdRfirB9AnAOlH8@linaro.org>
References: <20250421-fix-qcom-smd-v1-0-574d071d3f27@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250421-fix-qcom-smd-v1-0-574d071d3f27@mainlining.org>

On Mon, Apr 21, 2025 at 04:04:15AM +0200, Barnabás Czémán wrote:
> mbox_request_channel() returning value was changed in case of error.
> It uses returning value of of_parse_phandle_with_args().
> It is returning with -ENOENT instead of -ENODEV when no mboxes property
> exists.
> 
> ENODEV was checked before fallback to parse qcom,ipc property.
> 

Thanks for the fix!

Would be good to mention clearly that this fixes booting 6.15-rc on SoCs
that still use qcom,ipc (e.g. MSM8917, MSM8939).

Anyway, for both patches:

Reviewed-by: Stephan Gerhold <stephan.gerhold@linaro.org>
Tested-by: Stephan Gerhold <stephan.gerhold@linaro.org> # msm8939

> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
> ---
> Barnabás Czémán (2):
>       rpmsg: qcom_smd: Fix fallback to qcom,ipc parse
>       soc: qcom: smp2p: Fix fallback to qcom,ipc parse
> 
>  drivers/rpmsg/qcom_smd.c | 2 +-
>  drivers/soc/qcom/smp2p.c | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> ---
> base-commit: bc8aa6cdadcc00862f2b5720e5de2e17f696a081
> change-id: 20250421-fix-qcom-smd-76f7c414a11a
> 
> Best regards,
> -- 
> Barnabás Czémán <barnabas.czeman@mainlining.org>
> 

