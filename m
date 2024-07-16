Return-Path: <linux-arm-msm+bounces-26343-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5058693273F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jul 2024 15:15:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 001141F2298A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jul 2024 13:15:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DF5C19AA6E;
	Tue, 16 Jul 2024 13:15:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PMXN53hx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9036D15CD63
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jul 2024 13:15:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721135720; cv=none; b=awW6YbaczJICYORJknkqrHMl0oe8mQLh/fI6irGYAtkkTa224bD1QCEkI7NCRCBfim+vbjSsIffFwmB5Hg5iE+Kz9eHFhn4sO4Y4J1CAyaeydGriZ170frQbCwOmuexVpb1AGhDWdZU2L7Z+KGrSTRN70hnz3GC1M7T1gwsU+Os=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721135720; c=relaxed/simple;
	bh=d6tVEyM4+zfsQ3f/Lp21lCQNFXCnL5duwmm+qOIsJ4Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Pn1zf3ELArHrhS9c/LgP4NBGzkqm0S98NcOGonsYU6XCuUa2UV7OxaprwVHsO+qaHifnL60PfiWnzrCsvikJroBZeN2A/4/0n+lHYckDa++dMI8jLetEHyJaS6oIermSZBqrlOTrh3pXaLJleM2htDtorFl1W8szLmTbYZi9vcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PMXN53hx; arc=none smtp.client-ip=209.85.219.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-dfe43dca3bfso5582647276.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jul 2024 06:15:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721135716; x=1721740516; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=nsbTKT2fsyn57FNCsAGBNDGfhW5cbmqj9qjWElmr/2o=;
        b=PMXN53hx9J8Cw2qI6JKeCaYmjC7ohmVmzHbF5QHVGPGrpSg0vOi+qLBZ/LsKnSRVlf
         SwYhn3ODIUC0CNMZd6/tPf+h9TsXYSpr/ZTD6sOd1szdU4l64dV0LCb31CC/qnSoCCaR
         JNV8O+4HMC+PituhtGeybvQd6+evGPlLl/FL8NcRNZtjtiD1fvjxyrDXVNXO6p6bQtaj
         v5Rj5Se4bwvuZ//xoMwijwNSQ9wBHFK2fkueskiTHPda8/0nqXyulYskXk4xwkLgcumO
         DJfK7g2nB7VwXiPYq8BkekLmsyINFkfQEOLOrCJQXCLWSx9WmSTWKlqxQvhf/puNBBtm
         tF4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721135716; x=1721740516;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nsbTKT2fsyn57FNCsAGBNDGfhW5cbmqj9qjWElmr/2o=;
        b=FCL06P4qJWzPJRbnzFeRS9iKSi162BVjuxBIjGAiVvHbfEn1Vd8m9ww0zkhgZAjKjs
         I6LXCYYC0afRyBShoG9l65KFzCNd48Js7gnvYKu065PovOHdTgTihQA0lcWLeeexcEkI
         0Z3LI4u7ZYItQwzvXW1knryH5k44g46CpruEHhxs9ov6ojD7yIO/AVYSeJEip/ctQgga
         KIP18q5dbEwk713KTgKRZY5MGxJLgdp9PqnlI7LxBYeyET5llBxtRa3SlFPumkUCJPS3
         dFDBUUkhahGo35A0vnse/huIhTcqkFIW6wQJ2k5ck4rPKiZfIoQY8MpanRgRBVrPTCiM
         sXyg==
X-Forwarded-Encrypted: i=1; AJvYcCXGZj/ykx+rdoLKKutB4ZFyqtnrkz6c0M1Cz/rTXBnK5MI6wRaBk53im0dK3zdSw18HHEiFAwUmRX+Dg90B+/4kEFBNAZdnUd3i04+89w==
X-Gm-Message-State: AOJu0YyuwH8wrwnQ2zaiJXjXco8ghYfKPq9WXvISx4t/2JBZOuT+O7H6
	R3RKmQPM85+oqcf/QakYxzJ/wSmik4SAisPFtqpKju1vd8i+AYVktxXR37MElPJsdIdzAOUrQe8
	FuINUwMb/gl/sD2DUxVWRpxneQjdKTSRGi+Lgqw==
X-Google-Smtp-Source: AGHT+IEwvdUN5GYHZf+oYL2BhSIhMj4XizKcfWTfNboHzaZQRsgNKDXEA+WWZyOEhNMgMjD9xNvIqRmYe8MWm5x6WVI=
X-Received: by 2002:a05:6902:2211:b0:dfb:d50:a761 with SMTP id
 3f1490d57ef6-e05d5d8b07emr2822669276.14.1721135716388; Tue, 16 Jul 2024
 06:15:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <74947f7f132a811cc951749907b01bd25dcf23e6.1721135509.git.geert+renesas@glider.be>
In-Reply-To: <74947f7f132a811cc951749907b01bd25dcf23e6.1721135509.git.geert+renesas@glider.be>
From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Date: Tue, 16 Jul 2024 15:15:05 +0200
Message-ID: <CACMJSevi+U81ASqG-DCSxcuW4C4hPRt-_nYgmnpaMXF_7Ozw-g@mail.gmail.com>
Subject: Re: [PATCH] firmware: qcom: QCOM_TZMEM_* should depend on QCOM_TZMEM
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Andrew Halaney <ahalaney@redhat.com>, Elliot Berman <quic_eberman@quicinc.com>, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 16 Jul 2024 at 15:12, Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
>
> The Qualcomm TrustZone interface memory allocator is specific to
> Qualcomm firmware.  Hence add a dependency on QCOM_TZMEM, to prevent
> asking the user about these options when configuring a kernel without
> Qualcomm firmware support.  Various Qualcomm drivers already select the
> main QCOM_SCM gatekeeper symbol, which in turn selects QCOM_TZMEM, so it
> is auto-enabled when needed.
>
> While at it, add "Qualcomm" to the one-line summary for the choice
> option, to make it clear this is not related to generic TrustZone
> support.
>
> Fixes: 84f5a7b67b61bfeb ("firmware: qcom: add a dedicated TrustZone buffer allocator")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  drivers/firmware/qcom/Kconfig | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/firmware/qcom/Kconfig b/drivers/firmware/qcom/Kconfig
> index 7f6eb41747346a4f..c607574397e9a7e7 100644
> --- a/drivers/firmware/qcom/Kconfig
> +++ b/drivers/firmware/qcom/Kconfig
> @@ -15,7 +15,8 @@ config QCOM_TZMEM
>         select GENERIC_ALLOCATOR
>
>  choice
> -       prompt "TrustZone interface memory allocator mode"
> +       prompt "Qualcomm TrustZone interface memory allocator mode"
> +       depends on QCOM_TZMEM
>         default QCOM_TZMEM_MODE_GENERIC
>         help
>           Selects the mode of the memory allocator providing memory buffers of
> --
> 2.34.1
>

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

