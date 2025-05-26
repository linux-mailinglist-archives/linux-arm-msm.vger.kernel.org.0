Return-Path: <linux-arm-msm+bounces-59458-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C77D2AC4424
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 May 2025 21:47:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6F0AE1783B8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 May 2025 19:47:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFA3D1D63C5;
	Mon, 26 May 2025 19:47:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OplpTF+D"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B6932CCDE;
	Mon, 26 May 2025 19:47:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748288868; cv=none; b=ofkqlmtOak2v/fjQ7J8/rUFxqoSZbAGIqYzaLCnyQjY3Wdfll6+DcR8JZVfu6olVSNK05emeqZkU60oG4SXREC4rQz3cf5UC7aDMMNP+JQuah6ULUGvUl1uBz1qaiU2kd1FsU50iBAr48Gy9/t2xGfoU+7+ZTtU2fCJdH2t/NB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748288868; c=relaxed/simple;
	bh=4KqVkDJQJ7wmSaMRmXEyaIS0NkKBSX1F3vJIe8XNIxU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rqAOlANv38JiJwF9EEn3ggtZTZrdApUU5r5kXJzcZ4J4quKzLm4SofbBrbKaGDuWfSegwZJT///n6OOcZqnekVNLI6VRGLU/R6jW5c4A6JJ+X4AwEfMYKtcC7nB4oBQtNExvBm7duzdOXQL/1Jo8x/RPwa6bHAlaxHsa/PV3O1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OplpTF+D; arc=none smtp.client-ip=209.85.167.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f170.google.com with SMTP id 5614622812f47-404a5f4cdedso456534b6e.0;
        Mon, 26 May 2025 12:47:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748288866; x=1748893666; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4lxG4RwYQ0CNvC7KfH6KqgSMfyW5/kygutUZd5gmeVM=;
        b=OplpTF+DzfjQeSN+XSmU6YNRoycLlmWNkrYEzWD94ZC5E+uNUVMwKM+6hkhPUJ86oE
         tCNPagqbmunS9OJ/k999wFkQ26BVEUkypxR/4rn3B2L9e3gaGxTw8LZKNpNCmjrVg2eW
         UjhnsZxkQey+Lw8qGMM1ajyqC90HAnT/A2SRfkzyNAAUfUQFOKdo987AJkrdj0SrfbEw
         Wi8v2+zkrz8qV6wm7gGvutilkJJ14ieHvxlDl5DofDqT8eTTgaBO++P71t/KdCRBhhq9
         RZJ8Q/V005owun/sLdeulTO4s07rcHtjzjjVlIDtQNRhZIY+CyLnmDBf4j3VfRcG+ZRI
         4IQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748288866; x=1748893666;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4lxG4RwYQ0CNvC7KfH6KqgSMfyW5/kygutUZd5gmeVM=;
        b=sYJo01PksQ+HY1K4hsd8r9f48zyOZJ8OYjJpvTrzdAH91bUFEHppn296avopHI7QrY
         85/Gnn5pcXsBVA7FeS2Aa9WC0FtD5xwpeQZW/6DAMeXwkrdwMvaQxkldk9/sFazQNBbR
         FD2SSFZRZ7l6FKXdFP1qau6xhmMcATnygoceqt8YU5VbLVjZAeh7j7OqXUNHXb83ps2C
         oNrAg5OORO81Bs8bDfbiPtVjexb30sOBpxEzgxtQM4FyUukh1CgWEl6YJCBlUm26cg9G
         TpZzAiI9MwPAoXqrQlcMYuQbPhhRMATnorBWS0WfFEahevhEDhM4WBoBtL5Ty8LUwxjZ
         8ybw==
X-Forwarded-Encrypted: i=1; AJvYcCUCM8EGLon93RA4iPdqG8C3CyvU5do/YQtbsMkcms4amf58/L+XfYYKlt4YbNDoHuvpfOsx5clagBN7@vger.kernel.org, AJvYcCUWalmZYBLuRLLDzPKCDflaPSWSbWUcvvypXSn4zvtPkvIpTMaFLsJ04DRCkDOihJpV2i5wmivF5f72mL6gKg==@vger.kernel.org, AJvYcCVEx8E9wDE6/4fbp8TnGvoZK5dyyQqUpbzcChTwRm29TEIe5QjeKU1B2DCVdMTS7G9Ved7iF7e4GrUp94Zy@vger.kernel.org, AJvYcCVlsG0Dk7Sw0KGQduCz43WxvSstsxzak0pB5fVHrABaY9FnKV5PZX12YfmppnOCRODqhm8C7fFcVWLx@vger.kernel.org
X-Gm-Message-State: AOJu0YwzRrkhcHiESszBre/ep0v5mgTbtQV1tVK7a23eAhTTOUzW9O0h
	3yV6Gh4jSfLgvI/2SQXXnSWdo0iNgl5L4en/fFpTcRXso1t56B8sRUlywf433Bg3JZEd3uZu0v5
	UXmo9yOyTXDSY3i+FXUrQnmMmLdLwWUQ=
X-Gm-Gg: ASbGnctG//SM60kgSx0BObdyxOUr8asVAi50OiwRzSzU/YlgDsY0/YBtlKu2gecEma+
	7hY/zVNQ2649RIg2CpsgXhV+P/ICSE+aZ+70P65C3p0XBDqdlA9on6DFO6SFKKMo4ThT+z+oyoS
	lL7r76m8tJQM0ikvd+5z/aRQLQwd+cAW7LrA==
X-Google-Smtp-Source: AGHT+IEJ0rmGDYHVgbL2oFttoN7DXxvLwFI/X2w1GedL73u0g6JyCd2425ooHw3cpjUX86RjEOmynFxzWpFNfqwPYeI=
X-Received: by 2002:a05:6808:80c5:b0:3fb:2937:937c with SMTP id
 5614622812f47-406467b8c4bmr5809894b6e.6.1748288866073; Mon, 26 May 2025
 12:47:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250506-qcom-apcs-mailbox-cc-v1-0-b54dddb150a5@linaro.org> <20250506-qcom-apcs-mailbox-cc-v1-2-b54dddb150a5@linaro.org>
In-Reply-To: <20250506-qcom-apcs-mailbox-cc-v1-2-b54dddb150a5@linaro.org>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Mon, 26 May 2025 14:47:34 -0500
X-Gm-Features: AX0GCFteTgTgIIhEMNd3LV6B3AyZoLARNnuA73iJCsHKTCOp4z_ZcwMh59Zhjp0
Message-ID: <CABb+yY2bSJ-dZ73DjZaNc+iEpXXU4bxbWBPaj0M_6qf+Zb=V_w@mail.gmail.com>
Subject: Re: [PATCH 2/4] mailbox: qcom-apcs-ipc: Assign OF node to clock
 controller child device
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
	Georgi Djakov <djakov@kernel.org>, 
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 6, 2025 at 8:10=E2=80=AFAM Stephan Gerhold
<stephan.gerhold@linaro.org> wrote:
>
> Currently, the child device for the clock controller inside the APCS bloc=
k
> is created without any OF node assigned, so the drivers need to rely on t=
he
> parent device for obtaining any resources.
>
> Add support for defining the clock controller inside a "clock-controller"
> subnode to break up circular dependencies between the mailbox and require=
d
> parent clocks of the clock controller. For backwards compatibility, if th=
e
> subnode is not defined, reuse the OF node from the parent device.
>
> Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
> ---
>  drivers/mailbox/qcom-apcs-ipc-mailbox.c | 16 ++++++++++++----
>  1 file changed, 12 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/mailbox/qcom-apcs-ipc-mailbox.c b/drivers/mailbox/qc=
om-apcs-ipc-mailbox.c
> index 11c41e935a3619b74ad0f5e2d82699ca8aa05722..8b24ec0fa191efc975625d9b9=
270140ad1fe7b9b 100644
> --- a/drivers/mailbox/qcom-apcs-ipc-mailbox.c
> +++ b/drivers/mailbox/qcom-apcs-ipc-mailbox.c
> @@ -116,10 +116,18 @@ static int qcom_apcs_ipc_probe(struct platform_devi=
ce *pdev)
>         }
>
>         if (apcs_data->clk_name) {
> -               apcs->clk =3D platform_device_register_data(&pdev->dev,
> -                                                         apcs_data->clk_=
name,
> -                                                         PLATFORM_DEVID_=
AUTO,
> -                                                         NULL, 0);
> +               struct device_node *np =3D of_get_child_by_name(pdev->dev=
.of_node,
> +                                                             "clock-cont=
roller");
> +               struct platform_device_info pdevinfo =3D {
> +                       .parent =3D &pdev->dev,
> +                       .name =3D apcs_data->clk_name,
> +                       .id =3D PLATFORM_DEVID_AUTO,
> +                       .fwnode =3D of_fwnode_handle(np) ?: pdev->dev.fwn=
ode,
> +                       .of_node_reused =3D !np,
> +               };
> +
> +               apcs->clk =3D platform_device_register_full(&pdevinfo);
> +               of_node_put(np);
>                 if (IS_ERR(apcs->clk))
>                         dev_err(&pdev->dev, "failed to register APCS clk\=
n");
>         }
>

I see the dt change is acked by the DT maintainer. I have no problem
with this patch and can merge, but do you want to wait for ack from
some Qcom dev?

thanks

