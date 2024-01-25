Return-Path: <linux-arm-msm+bounces-8265-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 610CF83C399
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jan 2024 14:26:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 00C911F24E41
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jan 2024 13:26:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5691F4F8B0;
	Thu, 25 Jan 2024 13:26:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rrOkFtiH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB2034F8A6
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jan 2024 13:26:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706189192; cv=none; b=FD8b5UJ1UfYlaSan5cMhpFdqXjKhNdTLQTVdghPf/+3dHHU0JJyWpGhwpLjRjA46MGaBnTXaL9X9PBqutkNn39k4CR/jo6yn/VN77WGtTjuFajhhBfLYhRGqztAfUr7OgM+3NM5JI3juN9TROV06zzAomoAfSvyTS4C8k3JFhYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706189192; c=relaxed/simple;
	bh=tjVa0aI9q6ew9EUWXQVX3W1VrK2Rhj45J/HNTMLU6qE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MRPD2N5lWVKUUGsuf2zGY5BxRuGgwP+nYnZte/fWJm5kb5loYGuyCkI5twukbspKpvDBAXka0e9Q2+1Lzp4RAQtFN12pdOmJhk6G06Sqy8biZmE1jWy9HGnKcsxzg/JuAqqlqPE/iVJB0Zjos5lqwoiVC4Tq/qFXrbnJmOrcLK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rrOkFtiH; arc=none smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-5edfcba97e3so67985757b3.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jan 2024 05:26:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706189190; x=1706793990; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=TbqG0TlSQM9fkiKnL3FpwdOMIuGQfy8Lt7OuP0KmsYM=;
        b=rrOkFtiHfpOCy6HaRGQwhErMH3e/j1zZJ1Ce7wUaaCXSLMND8mz7ndJcy6+Q4xgy2j
         ZQANSzziYUzRqXr8Gm8Yhfe8svRSUVIjwEpgVxktXmKh5C/xwgP/QkPUv9hjpNJ4EhAg
         4/o8Wy1JXsOUT8211eK/4srqQBGdZX9cArtPl/7TuuR6tDy25CbPNg/hIx5dxUoYghzv
         flwtPdZVdZgxQU+6lk01dYjLaBsDxkAMSOrKR4vNDnE4kadid3U63uU/geYA4mrqeSdB
         A9A+S7OCLo7LWnIYU33HBM4IhIPz5KYn6pTyd6B/zU562jt7HncJ402slHed6Zsw2hMW
         6qWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706189190; x=1706793990;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TbqG0TlSQM9fkiKnL3FpwdOMIuGQfy8Lt7OuP0KmsYM=;
        b=Rf/hoY3B6pqNjVYRrd9k1jwYOhDZKAeyM3t6h2EIt/9lTqn2YgjSkJYdvNFk5agFPr
         ITov4xTPqyUCE/A6H4znkDhZQru/iRo9N4qzT7iigLSQI1DPUGdGIJqyl1uIlPozqH/o
         2GD7zs9kKJYak2U2GLRhGmut6lR+Gr7V47p5XC3kOV7yZjAL2BcW8Kc9Pl01l/aJN7Am
         yFmysG+ppy+ZxnewaMHFZL5MNh8N6JdhgFY6myPbcIPVH3Fr6TyhrPLqtz4si9l1YBzN
         q93WNlChYLoByFdwNLbj6e4ak9+edNtZnvcYEkMM1XKWhXCdppcqXfLnOa4t6i+AREOF
         3Huw==
X-Gm-Message-State: AOJu0YzA1P+LP4n2yNAy3vgaXS1rkKhrif2yjK++UxgxaR9UBhKbTK4r
	Ou5H3rCvWwTqeUORSmhRKDYIITxiP/qjntfj2XBrehlP775fw+EaBJ9oSXTDl+Z6X1cffDa3Mel
	dJNMB/NOpN2LgBGsKUK68Ta8NpX59lxMpjiRKGQ==
X-Google-Smtp-Source: AGHT+IGO4JRw3ujg4HNVlq3irc0sTtMnxnmiwsPgbhs3j13dAPqNvOwPcHonxI/dO3veJg/vB9BphuDzRgiaLhbMIZw=
X-Received: by 2002:a81:484d:0:b0:5e7:c9de:1ae3 with SMTP id
 v74-20020a81484d000000b005e7c9de1ae3mr638734ywa.47.1706189189665; Thu, 25 Jan
 2024 05:26:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240125130626.390850-1-krzysztof.kozlowski@linaro.org> <20240125130626.390850-6-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20240125130626.390850-6-krzysztof.kozlowski@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 25 Jan 2024 15:26:18 +0200
Message-ID: <CAA8EJpq+LMsPXXcyYQNxCnymP_WPD-rStw12cywq8jhdM-VCUg@mail.gmail.com>
Subject: Re: [PATCH 6/6] arm64: dts: qcom: sm8650: describe all PCI MSI interrupts
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 25 Jan 2024 at 15:08, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> Each group of MSI interrupts is mapped to the separate host interrupt.
> Describe each of interrupts in the device tree for PCIe hosts.  Not
> tested on hardware.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sm8650.dtsi | 24 ++++++++++++++++++++----
>  1 file changed, 20 insertions(+), 4 deletions(-)
>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

