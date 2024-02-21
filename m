Return-Path: <linux-arm-msm+bounces-12111-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B05E85ED45
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Feb 2024 00:43:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4C6A61C222AB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Feb 2024 23:43:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BA8A12BE83;
	Wed, 21 Feb 2024 23:43:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ra/5B1wO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDCB03BB2F
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Feb 2024 23:43:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708558999; cv=none; b=hjW7h74y9rb+/XyeRVxv1GpFxP3YEc07BpDQaWuCHGFn3cQNgkaAH6DZ5OW1imSzWetILgJTmrcBa7wTacwUwDtvoRXF6GM5VvKteXPJevieBO9Jci4TuBe/eo1UNO3jBOl0mgKP41IbQe8wnkvwS1dugZdRoQzDH2stpazKv48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708558999; c=relaxed/simple;
	bh=/YFr+KKxijw6h0HemmOAPDT4OuqNlZU/nP9qnoL9f6c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SJDhQrCSUE/iUJ0+NtB0FjlyiUyhXIau1eomJJkyjdVIpzf38I6FeQhTZGRh9sf9roiw4h2FEPc+OTvHIXL6YELLhvxE8YsZSr1OXieIV4yHBtCRxv1OYaiW3IDkvODrNQ4fvInVNeUV987n95m7DrkOCxITErwD73mg49RPn3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ra/5B1wO; arc=none smtp.client-ip=209.85.219.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-dc74435c428so6802744276.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Feb 2024 15:43:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708558996; x=1709163796; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=WFR+rdCdcNXgjwmjuY7WFWRvujdikiPSr9iXFhu+1EA=;
        b=ra/5B1wOIxcFhFIfRjZTmBFm+29T76Z7c9GwqjaHS1c0xFdKvdu3bf2rg1NMCBRV9U
         Q2AElrKtsgfU/eXNv9RhDkIYQPBnrcrvL8XhLy2RgyrC0hRjI6+YpgAJbRmpkMSM0e7b
         wUGGw1Jx0Yfps9rYYfy6rh8yBrsdyC+uHY/uaKsIS/0M3FsnbgqJf8AXvV6rvuwqAqMQ
         ubK2yOQukVQsPKZzbeXtHp/iVWd01UCdglzPS3au2V+gWN1RJabDwmL1VPJFiMTLqRSA
         a0AkV1RT985UOBJWxwvxwXcDsavE8By8M1bYnPEBu+an4mqp7EdkW87i2KGnQvLI/nv6
         Gufw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708558996; x=1709163796;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WFR+rdCdcNXgjwmjuY7WFWRvujdikiPSr9iXFhu+1EA=;
        b=VuZnPttlFNinC2VCk85M5OgTwZn9u+cTKZvUM0kv4dyEzeH7ZlKLljJzKXPa0+QgpZ
         gsjpEjQHKrAAYw1i//lXpk5cptw6fwO5yZ2kGkCPaH5B9entEK9OMqY/v1dQDbPxOcys
         yOtTifJaGsRZROiIj68jeWvIyiByxpdKACHXPX1yydf2ldly5duZXZC5lWTDW7rGQrKP
         SKa5QvKihhaW47Fl94t4oPGlOb6YU1wyV/BwQGjTR3vQ9EXGz7MRgN/dOOKQpE14jbyU
         iyOdiLWyIeouRQsICN1nlo7ot7I+H4Vl6WwdRTxAnrjY/eeD7TmBdsYA7Te3sj9e6oXI
         5ffA==
X-Forwarded-Encrypted: i=1; AJvYcCUNhj0zqRYS/E1DS4PwkrGyJ3MNSQoKFBtp70KHY+vu/BeeN2N/aGG91MBT1WR8tgdoUOHQugsEcaYIgiv8OUaxxklxx0Pyod5IwqJRJg==
X-Gm-Message-State: AOJu0YxuQZ6mS9gOq3Iq3xwqfdnAZua8Wzz5zfffTvlq7z8MArqzha2/
	v4L2SujF5FJd6xshsh/8/WgwhrTVdswASjum3jAXun9knUHc6OlH/3pms6DwwM9w55/CFEZqhq2
	xpiSKkvpipfrlM1vsoZ0Tv7wXYBs4ZEZW9DHy+A==
X-Google-Smtp-Source: AGHT+IFjJBtN7MtXNcf/QQ3e4+26sEK2XOSpTmqDfd6w2TNPck5yPGYCu8CgXttPPvLLkfQppUj/9j3CGsKu8RzEuYE=
X-Received: by 2002:a25:b1a0:0:b0:dcc:693e:b396 with SMTP id
 h32-20020a25b1a0000000b00dcc693eb396mr916615ybj.2.1708558995841; Wed, 21 Feb
 2024 15:43:15 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240221-rb3gen2-dp-connector-v1-0-dc0964ef7d96@quicinc.com> <20240221-rb3gen2-dp-connector-v1-2-dc0964ef7d96@quicinc.com>
In-Reply-To: <20240221-rb3gen2-dp-connector-v1-2-dc0964ef7d96@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 22 Feb 2024 01:43:04 +0200
Message-ID: <CAA8EJppPM9M0Jsb=GtqE4sdzWsKewEwkgKtF=Kb+n0tXZNSHkA@mail.gmail.com>
Subject: Re: [PATCH 2/9] arm64: dts: qcom: sc7280: Make eDP/DP controller
 default DP
To: Bjorn Andersson <quic_bjorande@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, cros-qcom-dts-watchers@chromium.org, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 22 Feb 2024 at 01:19, Bjorn Andersson <quic_bjorande@quicinc.com> wrote:
>
> The newly introduced mechanism for selecting eDP mode allow us to make a
> DisplayPort controller operate in eDP mode, but not the other way
> around. The qcom,sc7280-edp compatible is obviously tied to eDP, so this
> would not allow us to select DisplayPort-mode.
>
> Switch the compatible of the mdss_edp instance and make it eDP for the
> SC7280 qcard.
>
> Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/sc7280-qcard.dtsi | 2 ++
>  arch/arm64/boot/dts/qcom/sc7280.dtsi       | 2 +-
>  2 files changed, 3 insertions(+), 1 deletion(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry

