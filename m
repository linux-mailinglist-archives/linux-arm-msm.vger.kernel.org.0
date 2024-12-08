Return-Path: <linux-arm-msm+bounces-40914-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BC2D29E84DD
	for <lists+linux-arm-msm@lfdr.de>; Sun,  8 Dec 2024 12:58:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A23AC1884A3E
	for <lists+linux-arm-msm@lfdr.de>; Sun,  8 Dec 2024 11:58:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F327E145324;
	Sun,  8 Dec 2024 11:58:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rcPkmu+x"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C9DC145FE0
	for <linux-arm-msm@vger.kernel.org>; Sun,  8 Dec 2024 11:58:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733659118; cv=none; b=HjjZkQi7oEo63ZnVhn2e/u36p51AwliLdWXEuqBfbIqCkkQAYAK4j0U/H1Kapg67IM6U6BTvxO/qIoWw9IGjEIp1xrG1Ua4IH4VyXdSoKMsOLP2P5ayZDyc7IkPT+pYcAMhwhyxQstLC76V2XARUHY0jWCz3hscTV1jVn5wsuAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733659118; c=relaxed/simple;
	bh=rnrobeummKXtlx5e1Mp8vjRMRR3hpHjznnrPkWV9jqA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U2JwZGcga9XkDQFPkpeN+XoWsocPBsnnqki/caAXeVqtz0gdl2y2Ngr4xp4k3hIP0/HoQAc0S9S4e/ysNyj1M0IRV7cyMoBsYOcugz5iDTw2iGYfZgmHmGJ8uzYZiTauw4eS9t8OApKLqzkVJv42h4xkHsb/VX29Lc7qvbEkxMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rcPkmu+x; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-53f757134cdso774592e87.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 08 Dec 2024 03:58:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733659115; x=1734263915; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CysgqJSoA6The5y4gGxS6RuFPaDLlk4I3KIup58ZBcs=;
        b=rcPkmu+x17qESYbWHj6lCGcqLOsCQq8Uo2bgX9yfcZZBLEBMq0EKW/E04qbKko9K93
         oX8uOhL12WPfqJiVGE6In9ZPiWlupNR2rRDCIl0qivzxGvnGMKwwajXFx64t3EKR6z2N
         5X3Ixo0boz42hvSfJV66i4QvAoWT2O27Q46UWrZW8L+rGnHaMjIsdUK9NtoYttHywfHv
         5BakHRX3DdnSKS/V9ByuGNtt8zQNPeEf3Cy1jKLIXpXO12AmVSMQ7eJsl113mnyrMB3E
         YKa2MEc6L51R136ZyLXadps521qwDNOvYn3fTWd5rPorPIbN97aVhrPGfYmFFg4XJE8o
         owsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733659115; x=1734263915;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CysgqJSoA6The5y4gGxS6RuFPaDLlk4I3KIup58ZBcs=;
        b=Luouy9mLI/cB+EUz7d7GiUAOa7EwA8DsG33tZYWTkaITAWxIS7v79fcVCXH4m49G1o
         x0NL7aUYomMWkMLoabErnktaht8EVfTDBDYb0aZu299qyMe2wItdWmy91LuGqjeSco5O
         0qDL7eG2DtXlzQeXDJAMTuSXAnkefBWdNFf/S0lDsxYoexchU8FtKc9cSmfbEZLwBATN
         +GM5gC73D4t0z5pMjvCAb4XnG3VuSAUGanAU8G+0/lG9Hbn1R2g8QLaLot1Tljqt77wY
         zZedgbz9MhNt8Y/zn97bpKGNesJnmo90YMTCZOYU0TD0wvrtxbHyqocokhJi1LoPfFoD
         gwgw==
X-Forwarded-Encrypted: i=1; AJvYcCXC7PT4RVPlk1Uv1cDPmzxOKodV+sFURVgG5oLw4pm0tlnS/PonWdIWX1/3tNiJ0gsK2Yjm7whmtO/UVMHQ@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8+97LuObrejmiV8XGYCHcSaKG5yGGVbhknmbDEcTbyEb7uZOz
	FMRDy8ZoXZxWAmbKDxBjmLMY8Dj8krZab+I7pH+461U1Cm7ya3S4JLKH+nxE48k=
X-Gm-Gg: ASbGnctmtt98mQHuAbcp35ItVNWBShRr+phlbQXw4KuvmXKdLg9jZFAnmorj1broU2x
	JMBhH2p7fevMyP0WQ87hHTBG8o5lsyYHnTPcWLI28ouw19g1mw6PiBMCJbXWEUo9VWu7a2nu7o/
	7JEepSlFcG1H53ZjTFmj4GcJ6pBjgn5b9N9MszGQmQggSvIZSFLMA8Q29gEo1PhXWi1K2mNCKeT
	YXPRYMUgrPkAvYwuknfGhHEHmQ67TJWTshyb9N3/+w5HvfrZAZY+7HJ9lXvCaQrGy4g1seNeKwN
	IEy2koFTygIIOc/DbWqo/zx/NsMTOw==
X-Google-Smtp-Source: AGHT+IFMxzujaEusISBpEqUr26OQV2IrA+gNY14wgz09Z76uRnfMuKHilK9vldlA5zCo+wLBFIB44w==
X-Received: by 2002:a05:6512:3d07:b0:53e:3a7d:a1df with SMTP id 2adb3069b0e04-53e3a7da2cdmr1577018e87.45.1733659115464;
        Sun, 08 Dec 2024 03:58:35 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53e94f77f3fsm424275e87.217.2024.12.08.03.58.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Dec 2024 03:58:35 -0800 (PST)
Date: Sun, 8 Dec 2024 13:58:32 +0200
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
Subject: Re: [PATCH 42/45] drm/msm/dp: mark ST_DISCONNECTED only if all
 streams are disabled
Message-ID: <blxp4p56inbzlwmnsj2mw3pllioemgwmyxmu6eqo2oicl5dbth@exdch2z3kk6a>
References: <20241205-dp_mst-v1-0-f8618d42a99a@quicinc.com>
 <20241205-dp_mst-v1-42-f8618d42a99a@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241205-dp_mst-v1-42-f8618d42a99a@quicinc.com>

On Thu, Dec 05, 2024 at 08:32:13PM -0800, Abhinav Kumar wrote:
> HPD state machine assumes only one active stream. Fix it to account
> for both while marking the state of the hpd as disconnected.
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

