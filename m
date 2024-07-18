Return-Path: <linux-arm-msm+bounces-26600-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 30F62937027
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jul 2024 23:36:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A3EA81F21BDD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jul 2024 21:36:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F1E975808;
	Thu, 18 Jul 2024 21:36:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="M9dPxQjg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3F6C81219
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jul 2024 21:35:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721338562; cv=none; b=nCXkybbCuwXqyPGejFOzeDYqt4pthaqPmc//+CadFzCkggCLPcQmXhzyvKad3PccPznQjJKp1mVVpJysT/Dli3XhPm6bYCOKCPWLH1U3FQR9YzPCgwhcCerH2zmUTLsw9K/0yYS1auC4wYolVcyQJiZmC6GIZ4AsjzhbC2/CrY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721338562; c=relaxed/simple;
	bh=Fk1q37AkJRR10jxS0EvjOga9edYZklZD/stTuwe7plA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mQNoqzkT8wqgtrKWqv/r17KoWZBDzivoaaW+PiqwkirPl/nau0itVQScb4OxqbomxcJpdQpoq7qnHpcUrwUIkEfi/4miYvL+JC+bXdxtjMEms31/qvOn31PxT+yBAjCNL0zQASp28nzoKc+75LvPTDrNcSzdtfBF7JPT2aIniGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=M9dPxQjg; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-52ea929ea56so1702125e87.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jul 2024 14:35:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721338558; x=1721943358; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0/fJsgp/AZdEv3h8J8/jVqL+YwWPDVkh0WLdgpf556c=;
        b=M9dPxQjgACC4QZn9bVYibWBkr/H6Mv4NKQ7tOffQmL7ZpzJblKvOFxD/pNVCr/NKPK
         CTyFFZjz+KXp1BI3HGq9eX9o9fhXPdg+WzYu1SvLSgcPItNJVibs8MoKC9xwLpJM/AEG
         VAZVC6PHvNjhJS9jYjG1jlbp0RmkCMcf4aidKldO5PwVyHIlY6yzcxbYIH7IuIxJFAGT
         OezEbC6A08eBoBDV36BL7koauYpkbYlcubjhJe6QjdwjH/duYm/DXsxLQa5QYR5UPJe8
         5tgc9+tiFi8EDHXxR5tBwmCXnlJghwN/sllYc7Z5VAm3gXFyp3tfCeTgIo1gAYxSI0Ar
         QKVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721338558; x=1721943358;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0/fJsgp/AZdEv3h8J8/jVqL+YwWPDVkh0WLdgpf556c=;
        b=YbQ90B4BBIiYtDRm8ee4UfBYH/1spW9mrIvWyr4bAz/9oC9hUUsq8M2n66+5+o+5N4
         9AYveZ6Sw5jAFaGvBfL0X1jhlC0xpwx15mj11HU0Lufd4vtPVyGJYSf/Jaw4Hk+2IgA4
         DVrMlXWUM6nMGD1voL1+gNwGZhGs3J223NggEWvyef/emtJRzu+g26rVpCGbLQSbKoow
         MrsR3oNcuCHlnXAmM4BEp+zbWSKYNwvD7L101D9aOByVeAmHpao6pZ2ewrTgdksT6nZJ
         180IN5GIw4c8WqsgXwqLyklGD6nxt4zPD8rJtI2j+XE79A1+nogi4DN2ZeLbMRe8N+Qs
         yRng==
X-Gm-Message-State: AOJu0YykOv97PhgeZAnxuvEGiR++sT/fwLQG65L9amlgh8f68U1yY2wt
	d/qJj0jRBbHKmTGKvEhKRri8GT1prNq/zUc2QNsiTprSMtXpjpw5sFD+GSortf0=
X-Google-Smtp-Source: AGHT+IHuG7Yb6XcvPP/LuraXGboWeWjVx2oXL8KmKYQwMBVDG/13BqKI2G45L7A6gN329d5eBqY3OA==
X-Received: by 2002:a05:6512:1081:b0:52e:9904:71e with SMTP id 2adb3069b0e04-52ee53d7623mr5237291e87.28.1721338557906;
        Thu, 18 Jul 2024 14:35:57 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52ef07445b5sm204487e87.126.2024.07.18.14.35.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jul 2024 14:35:57 -0700 (PDT)
Date: Fri, 19 Jul 2024 00:35:55 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, Doug Anderson <dianders@chromium.org>, 
	Abel Vesa <abel.vesa@linaro.org>, Rob Clark <robdclark@chromium.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <quic_jesszhan@quicinc.com>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	"open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/3] dt-bindings: display: panel: samsung,atna45dc02:
 Document ATNA45DC02
Message-ID: <fnoc5jhpu5gwkfufm4cyyn4cjhh6dtw2if3jukk7t3tyvdwesv@pmr4j3vfgpjt>
References: <20240718184434.6307-1-robdclark@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240718184434.6307-1-robdclark@gmail.com>

On Thu, Jul 18, 2024 at 11:44:32AM GMT, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> The Samsung ATNA45DC02 panel is an AMOLED eDP panel, similar to the
> existing ATNA45AF01 and ATNA33XC20 panel but with a higher resolution.
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  .../devicetree/bindings/display/panel/samsung,atna33xc20.yaml   | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/samsung,atna33xc20.yaml b/Documentation/devicetree/bindings/display/panel/samsung,atna33xc20.yaml
> index d668e8d0d296..284a4ee79bbf 100644
> --- a/Documentation/devicetree/bindings/display/panel/samsung,atna33xc20.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/samsung,atna33xc20.yaml
> @@ -19,6 +19,8 @@ properties:
>        - samsung,atna33xc20
>        # Samsung 14.5" WQXGA+ (2880x1800 pixels) eDP AMOLED panel
>        - samsung,atna45af01
> +      # Samsung 14.5" 3K (2944x1840 pixels) eDP AMOLED panel
> +      - samsung,atna45dc02

This makes me wonder if we should define a cover compatible like
samsung,amoled-edp-panel.

>  
>    enable-gpios: true
>    port: true
> -- 
> 2.45.2
> 

-- 
With best wishes
Dmitry

