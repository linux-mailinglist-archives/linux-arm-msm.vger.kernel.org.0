Return-Path: <linux-arm-msm+bounces-10512-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 62A0B85044B
	for <lists+linux-arm-msm@lfdr.de>; Sat, 10 Feb 2024 12:51:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A5BC52864D1
	for <lists+linux-arm-msm@lfdr.de>; Sat, 10 Feb 2024 11:51:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC7BF3AC01;
	Sat, 10 Feb 2024 11:51:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eD49aTLr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1E463D552
	for <linux-arm-msm@vger.kernel.org>; Sat, 10 Feb 2024 11:51:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707565913; cv=none; b=iUTU1IZMYgnT92d2GD5cI5wNdtxW2jCNluKlfbcPY8zwNruw6BNGti+JpTFXCc6xFk68f199oOYY7egtExl02qMJheOIlJJO7O5swY0hetAC2swK1u2iMfio3XAQ3UnakR3YOmF8sJHAkJD4aBM38RBNvI+CkdoGF7G0UYPTXpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707565913; c=relaxed/simple;
	bh=7rc3pZKZQ3h12KuocOBjke7RPf57CY1ulO+EwZZN21A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GourNhyEJnZhLkpMFLXN1kjwT/IoovK24corHwkHoUYIJIvE83v1h5N15cL3WLAT8oselyvAU7WowXDqG89B5yEiP6JggsgEv2/kLzYAEhLKv8GGgZpENPtXrj/UC6x0s4AAmukBpcks1wrRemv+g9fqHSlhiX85EcCAupsW6Zc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eD49aTLr; arc=none smtp.client-ip=209.85.219.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-db3a09e96daso1619142276.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 10 Feb 2024 03:51:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707565911; x=1708170711; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/RWQV9SF+U2wQY2whqhrKlZUzNhMlpaeidneMuAvWr8=;
        b=eD49aTLrjo1zBpbcKWa8Lp0I4bGsaRtsLcf4Amke/MSnEmX5dR9p6Ll52L7u0pu1yh
         yswivvSj4gKsx3pI/BVfbRTk7zkeLofnZUAiEDj0gf60H9Txjf92qhNygA3bV4kTHjgm
         JUuBr42exz9qGl/I5sGty/5dMkKSNpbC1JeMNmcComR7mzRV39jcnZ8ol2Z4RJGSvtwS
         S6eME+fCDoOonXv7vPj1xEuHnpphETVNaV+uAMDrJ6rBiYHOsPn6Yk371DKg2w4xAVsm
         JmJWW1576y9qoms7OGT9DvGRPUx+5UIh/dByFapO/BOMyMlgeR21Y9nonWRrfzyRzznt
         OfpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707565911; x=1708170711;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/RWQV9SF+U2wQY2whqhrKlZUzNhMlpaeidneMuAvWr8=;
        b=abBGmfN95ORCEKI09Ct+QGvriFVAN3usCr5T+gQeBdaPekoxMnf0neS4U0k8Gs0mK1
         MYJqBZ3uHv3c/y1dERXN35HolyiYHfO3qRlCY69yiAQqKau8VG3Tfh/sX5sQ6WkDamb3
         NlMKvVsRHlvxKfQlGZfAptcczQPHXf1Z3s4JUkH9kj23iC3yDlcgriz5twW45NxKwjPL
         kCWvy93bUgP5qELb3DU9GLDy+rT8u+ZvhG/MS0SKxyPBKWDWIWPil1H0H+Z+CrVmEAmy
         Abdi7aZddiE/eycQWrbvrG+HeCzDeYIIpGpQNNJRr5oYNaEYVAJ7KNdOZEyf4UPUc2Ef
         FkgA==
X-Gm-Message-State: AOJu0YzG3bJS+fJ/68/tEZyxIIJT7cRjX2lRm9ykPDV/KewVj65GDm3X
	jTB4nFjvHC1e66enMcxtCTVq5uVSOygq6p0ckt/YJzsmdxYZSxs2RqFrKAa/Um67kKf8RBrZc57
	XWh1fnTq1i1gkJsox7xDwWWew2fxiyiwNyeMZyIyp76an9/PvD/E=
X-Google-Smtp-Source: AGHT+IHFyIHD774MV2fP+SnSwgZs21+HYOwYBlaQnlLEfF4zRO80UDtJtaZAZIQJ+wWMOfEhJRsDBXclS9ily9CzMOU=
X-Received: by 2002:a25:bf8c:0:b0:dbd:2b6:6cfd with SMTP id
 l12-20020a25bf8c000000b00dbd02b66cfdmr1415270ybk.2.1707565910913; Sat, 10 Feb
 2024 03:51:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240210070934.2549994-1-swboyd@chromium.org> <20240210070934.2549994-21-swboyd@chromium.org>
In-Reply-To: <20240210070934.2549994-21-swboyd@chromium.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 10 Feb 2024 13:51:40 +0200
Message-ID: <CAA8EJpoS3+NJCMnR3HhGrh73W39ivz9O6PX3Fov_an3cY+sLLw@mail.gmail.com>
Subject: Re: [PATCH 20/22] arm64: dts: qcom: sc7180: pazquel: Add missing
 comment header
To: Stephen Boyd <swboyd@chromium.org>
Cc: chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org, 
	patches@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	Douglas Anderson <dianders@chromium.org>, Pin-yen Lin <treapking@chromium.org>, 
	cros-qcom-dts-watchers@chromium.org, Andy Gross <agross@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Sat, 10 Feb 2024 at 09:16, Stephen Boyd <swboyd@chromium.org> wrote:
>
> We put a header before modifying pinctrl nodes defined in
> sc7180-trogdor.dtsi in every other file. Add one here so we know that
> this section is for pinctrl modifications.
>
> Cc: <cros-qcom-dts-watchers@chromium.org>
> Cc: Andy Gross <agross@kernel.org>
> Cc: Bjorn Andersson <andersson@kernel.org>
> Cc: Konrad Dybcio <konrad.dybcio@linaro.org>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: <linux-arm-msm@vger.kernel.org>
> Cc: <devicetree@vger.kernel.org>
> Cc: Pin-yen Lin <treapking@chromium.org>
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> ---
>  arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel.dtsi | 2 ++
>  1 file changed, 2 insertions(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry

