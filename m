Return-Path: <linux-arm-msm+bounces-11517-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D023D858E3A
	for <lists+linux-arm-msm@lfdr.de>; Sat, 17 Feb 2024 09:59:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7161C1F21759
	for <lists+linux-arm-msm@lfdr.de>; Sat, 17 Feb 2024 08:59:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57AE11CFBF;
	Sat, 17 Feb 2024 08:59:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XE5kdVDk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E50811CFAB
	for <linux-arm-msm@vger.kernel.org>; Sat, 17 Feb 2024 08:59:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708160395; cv=none; b=uvD33+GYPakd9IeoEzUfgVDsfFFMKF+eXFGulIEnNtZzOhlWVqX3lYjb7eA/jqrXaXvAEz1UZqtY0T+xhQDX6Mw4S+dFS911/WHUWXIpbZBfGlIf4j0eht2OOKwhThNzjkc242OVzNlH1sE/s2oafxFcN0f5cbzmqoK1P9VWqdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708160395; c=relaxed/simple;
	bh=E+Is+t8IwP/LnNS1PT9AxiJ0yovhZY2MGDthRv5wJ3A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qqPKUXUtwHULlizf18Y4WEgpVxkUJRWpu97XzcEBWbiYoDlZB6jmOr7VH8fBRN9l6ZXlnBrFiz6WwFNiSf+ZflueDWeJEz1S+mi4F71xKP2RZ/Idm4VKtTA5gOfCTzQ3+wZIMQ/y+UCHYEaJGgLIDFIdkk12k7JNVIrmutaRdcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XE5kdVDk; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-6080f44d128so2792127b3.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 17 Feb 2024 00:59:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708160389; x=1708765189; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=K/ZRZyeQ+BpWdfJxshc7GD1plCDJLSP0ycmcd9yewl0=;
        b=XE5kdVDkvuib/h4cQyt+4TU344SP65CVLyJJAH1mxG0jE61hOLHXShCqofff8AtZbe
         A/NMtbf8Tc3qNuYkLz3LlFKMwjQ8KR/PuNcwTfU5HWZNQcKQmqgCD72QkFrJB04OYU/H
         W0uKvYrQ+rWWIMV3Eqyyh1RzJQ+h0xLZLYGzYWLTqZNg1qI7IaJWTVRyV4auuYvDHCrF
         iqTL4ZznttshWN2pU75EsnoeBOQd0zGat5H+CpScPYZbJ2yU1LDBoLg90KCKqnjGFBkK
         Yc20yQDdvI+eBv4xm1SZTqrLj4xvW1H2FSn0cH2Qto97ItkoQ1thVKMt3ipb8ZW1SA4r
         VbLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708160389; x=1708765189;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K/ZRZyeQ+BpWdfJxshc7GD1plCDJLSP0ycmcd9yewl0=;
        b=e1KuYOVAiFHxK0QvHHh7LVWKPX9eirIMRaTNad+KgUxFUzIIuT+mtn/lU+z62+WE3l
         RsXHy4B59EmGvT8Vujw9O1Jr5gjXipqelIfzysxnWhjjcaC0dfpe2mjkKVep1KtfckL/
         YUePLHUNdBCnqvIwrvCU+VDYOdNfQ7O/ZF5/KfXkr/XrMtitno+SFuXfm3JWEHn/vY6P
         xQmRulIUXmnCYMNapK4C04uA6aP5/F27SS6gawA2lc0IWJTfXPcvBYAxrrpQ3sKqXQjK
         Nzsagbvkx8wJ305cv7gcxu5O6qjFJqw5vs2Fmbq5xtSqXB+EHCFt3/F3S2Y6+4RjQz0n
         3xRg==
X-Forwarded-Encrypted: i=1; AJvYcCWcyzmNmaTrPEptW2oNne5pvyuzv4a6TcUMzHYE7rY9ZhpmLi8gSk3O2A2nmUneXMJpFvUo48pXxVQDou5k9Zbq2YMfO2dQxUAlkI/dug==
X-Gm-Message-State: AOJu0YyoupPIEWgjzL+s2Z/1S2pACc14i3J1vFysi1kEadnyjBc68TTP
	1dOkujhd2J9v5SHfh+gELeKpdnhplYam5+lRlZFNq9N1CW4wdNMPLF3zPaupskLoVATSao2as/I
	bWqIWmntVuZ6t4zPdlW0D4ClL2Lj68FQUkZf66g==
X-Google-Smtp-Source: AGHT+IGdwuSGCA9darDzqXB4fL8BkiAUsbyieawOf4PytWpH89WcZTmfZO9MQDVKE6s6cePMEyqXbgxt3K9F/atI6Ns=
X-Received: by 2002:a81:5748:0:b0:607:b864:530a with SMTP id
 l69-20020a815748000000b00607b864530amr7030556ywb.36.1708160388853; Sat, 17
 Feb 2024 00:59:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240216230228.26713-1-quic_parellan@quicinc.com> <20240216230228.26713-16-quic_parellan@quicinc.com>
In-Reply-To: <20240216230228.26713-16-quic_parellan@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 17 Feb 2024 10:59:38 +0200
Message-ID: <CAA8EJpqiC-sEb371Re9Pyv01=UBT_NxZNd9wu54DUxZTNmePuQ@mail.gmail.com>
Subject: Re: [PATCH v4 15/19] drm/msm/dp: enable SDP and SDE periph flush update
To: Paloma Arellano <quic_parellan@quicinc.com>
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, robdclark@gmail.com, seanpaul@chromium.org, 
	swboyd@chromium.org, quic_abhinavk@quicinc.com, quic_jesszhan@quicinc.com, 
	quic_khsieh@quicinc.com, marijn.suijten@somainline.org, 
	neil.armstrong@linaro.org
Content-Type: text/plain; charset="UTF-8"

On Sat, 17 Feb 2024 at 01:03, Paloma Arellano <quic_parellan@quicinc.com> wrote:
>
> DP controller can be setup to operate in either SDP update flush mode or
> peripheral flush mode based on the DP controller hardware version.
>
> Starting in DP v1.2, the hardware documents require the use of
> peripheral flush mode for SDP packets such as PPS OR VSC SDP packets.
>
> In-line with this guidance, lets program the DP controller to use
> peripheral flush mode starting DP v1.2
>
> Changes in v4:
>         - Clear up that DP_MAINLINK_CTRL_FLUSH_MODE register requires
>           the use of bits [24:23]
>         - Modify macros DP_MAINLINK_FLUSH_MODE_UPDATE_SDP and
>           DP_MAINLINK_FLUSH_MODE_SDP_PERIPH_UPDATE to explicitly set
>           their values in the bits of DP_MAINLINK_CTRL_FLUSH_MODE_MASK
>
> Changes in v3:
>         - Clear up that the DP_MAINLINK_FLUSH_MODE_SDE_PERIPH_UPDATE
>           macro is setting bits [24:23] to a value of 3
>
> Changes in v2:
>         - Use the original dp_catalog_hw_revision() function to
>           correctly check the DP HW version
>
> Signed-off-by: Paloma Arellano <quic_parellan@quicinc.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_catalog.c | 17 +++++++++++++++++
>  drivers/gpu/drm/msm/dp/dp_catalog.h |  1 +
>  drivers/gpu/drm/msm/dp/dp_ctrl.c    |  1 +
>  drivers/gpu/drm/msm/dp/dp_reg.h     |  6 ++++++
>  4 files changed, 25 insertions(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

