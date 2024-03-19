Return-Path: <linux-arm-msm+bounces-14503-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6716D87FC6D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Mar 2024 11:58:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 921E71C22355
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Mar 2024 10:58:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD1137F7C9;
	Tue, 19 Mar 2024 10:57:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rF/OU4cB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 447FA7F7C3
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Mar 2024 10:57:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710845833; cv=none; b=sTT655ehRnYGH7VvRVsdRG5N8CDnXe4GFMh02V8jVVPL/dG0ivJtl9ijbV2HuniVFqLj1HIRuV3Q+7INLg3csuVf4jWexUONGL+KebDmzECQsPu2Vr/XqQHlWsoupWb+cq94qjDN5PeauAhvu5ue0o1vXSNMHOrtYHk6QgzeIpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710845833; c=relaxed/simple;
	bh=cNAGzh5GSei7x1oCy67Dj8gDtsHa88fXDuEJkAfcQ6o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WIbjHQCkFx67yJaGBITKNKCIqmpoqaTXnE8pqhWj3bWesafO2nQNQNQcXdv06Fw02hl5h6bJLBguxgWuy7mj8iiDhfNIgD9dDjATo0GtEpZy1YU9GBLznw1zLE/IQ4K7kNAQc+FTVjc/tYbHS0ip+EcGETria/Tm6m9cXFpUBtw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rF/OU4cB; arc=none smtp.client-ip=209.85.219.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-dcc71031680so4731512276.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Mar 2024 03:57:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710845831; x=1711450631; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=lrvF/ITWTLZMt7k1zbPxhpoK+Pg/DG+kvR7sAP9yq+c=;
        b=rF/OU4cB7V1OTqxzO0+iTSl10EkA98jk27nTW9UJWzlrEgiaM37tNbYZi2xHLPISTW
         0wBgYXq6R5K9Lv723GOtX5zAdY3sOqf4g6sZQizjLUZyQJP8zVe5TqXcvq/aJWr61LAg
         MqdsVEIWT3iWuHgxtiiWBynxPkLDeNJ3Aq2oIKVBclN3V1E+a4g9hWzvyohBUFrP0Ffy
         wOcaKMXX4sYB22/6l92B06b7EM7QO5bhTCXtYarJRdCFVfgI1ZHwrU2iwpwHrKJl/phP
         GpC9YXuHMG1nosRGJJI5XXpKx5EolCoUyHwRDI+k7636y4k6zDNaI+GoEDM9qIDCS8Kg
         CUgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710845831; x=1711450631;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lrvF/ITWTLZMt7k1zbPxhpoK+Pg/DG+kvR7sAP9yq+c=;
        b=pEa78kihBMVM7oXYLwgsPtweQa2JKQ/5+WNPCJLXs9MIJ+qWDPRLvHrcKk79bvJ42E
         NxU74cEGbU3oEbbO7J5rUV6aSGFm2FtRScnadb9CHUmKrSUj02YY1HfN8WUm/UTFPiJl
         QcUlgJGHLzJPFXPEtLPj1hh49lWc1LzUeXbTlW7E8xIPqYdwTOtqqlGP/cJj604W85oU
         UBHDGlyCevFXnZtUBqV8guIsvF5DXqXU4/Z5X3yCA0peitduj69wiHqztlr2WE10l8iW
         ZIg0Qf0nazyqeRcG5Hs+EQE2VoF5S9AWfKhl9kOEj5tbmn2dLIp8twT0PWpo+9YVLiJt
         utlA==
X-Forwarded-Encrypted: i=1; AJvYcCWh1cSDDQTnuoDVo0KHZuBimYg9XiiD532FDlY4D1A7f4Nnt9ReFwyvWzJyq0/zKnugrZEShfVPqBOiyoPD6wltkS4DHbIFC+MOqcYS4Q==
X-Gm-Message-State: AOJu0YwSkCXSi2g3fIwxkUJSnPd9aFSQYD1O+HO+Mk8/tM5jBxiWsxK6
	N9R3kHqEJF++p68PRSnFY7yX64W7OquHyTKORxwlL5z42/MxYjZskGtOzaa5mR2UenXb5a21xvc
	ywEGv8VV7GHLV2EKWvdiQ6Cuk1wpgbw/G7rhEgg==
X-Google-Smtp-Source: AGHT+IFWahUbPbZ0gt9IIGvtcCSEaFVaaIjj/JI8BQjE3K74Qn0khAsyE4Dy379EPMpN+d6EFyJ04gOY3GwCbnEfYU0=
X-Received: by 2002:a25:b21d:0:b0:dcc:58ed:6ecc with SMTP id
 i29-20020a25b21d000000b00dcc58ed6eccmr9940482ybj.41.1710845831327; Tue, 19
 Mar 2024 03:57:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240319-topic-sm8x50-upstream-pcie-1-phy-aux-clk-v1-0-926d7a4ccd80@linaro.org>
 <20240319-topic-sm8x50-upstream-pcie-1-phy-aux-clk-v1-7-926d7a4ccd80@linaro.org>
In-Reply-To: <20240319-topic-sm8x50-upstream-pcie-1-phy-aux-clk-v1-7-926d7a4ccd80@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 19 Mar 2024 12:57:00 +0200
Message-ID: <CAA8EJpqTvkb3bea4RxeG4zSMe0Yae209Z_xxLn7DXQi0RZhaiA@mail.gmail.com>
Subject: Re: [PATCH 7/7] arm64: dts: qcom: sm8650: remove pcie-1-phy-aux-clk
 and add pcie1_phy pcie1_phy_aux_clk
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 19 Mar 2024 at 12:46, Neil Armstrong <neil.armstrong@linaro.org> wrote:
>
> Remove the dummy pcie-1-phy-aux-clk clock and replace with the pcie1_phy
> provided QMP_PCIE_PHY_AUX_CLK.
>
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sm8650-mtp.dts |  4 ----
>  arch/arm64/boot/dts/qcom/sm8650-qrd.dts |  4 ----
>  arch/arm64/boot/dts/qcom/sm8650.dtsi    | 13 ++++---------
>  3 files changed, 4 insertions(+), 17 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

