Return-Path: <linux-arm-msm+bounces-86645-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id ECFEACDEB7C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Dec 2025 14:12:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 16864300B902
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Dec 2025 13:12:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B11A31D39F;
	Fri, 26 Dec 2025 13:12:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MB8rwNeA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3268931AF0A
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Dec 2025 13:12:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766754759; cv=none; b=YncuXQ6dGgHftagi9VS1h4i19bl9WcLu2bd1L44S9xDnMWAsP7fKwKTDmBWayuwACjVIpgUdcly4dcnf/lsYOOAnghi/zHf74BJm4N6fk22LrZdAKZ8QgCeeQc89pRj15t46lL6aQiHzktutQsm48DwTvaB9WhTak0Xl2Swm1s0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766754759; c=relaxed/simple;
	bh=IU9EFisuw/khuhiMGLReO/zEE6d8i4FZlx8JHbYAtUY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qsGwAuPTwiOmbrd2NA3wh8KYwkfI6WfIrvpmo8HpBpsQ6eJIlNVT4jJJlzOtsPVVvj2KR/9pJneIFVDu60BScydEvL7ebVy2AL4PDHLjeDUYH+JTSZ+HyVClW3GyKl5mAcCHKpTS+ei/eUfjWLlzwjWVmWm5t4MvDcwshsNlnIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MB8rwNeA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF6F4C116D0
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Dec 2025 13:12:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766754758;
	bh=IU9EFisuw/khuhiMGLReO/zEE6d8i4FZlx8JHbYAtUY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=MB8rwNeAfUaYTYTgU0HOxwHRxImZ20B+NkhgbZg8Uk1/RX/ozbN+K8bnocjdClv6R
	 /nc87gGh+nlxEtP+N/LqlAStboGdMWqhevkA9LQ22CF17w/FtVm/O+EnzRCu+N2g3D
	 uUBUiUEfSTztQvhbubrmvBChWGVQkLoCMWofcDqKEEhG+YGwbq/sCR/fN3TXVEC3bv
	 IlkAmEoB4p/OC86RZyfn6Y3nvE/NNGQzKRv+3HsFbkh1M22lLd94nrmqB2hA0l9lax
	 4Kxc/DGK/Jgou8s1WB+/YtdyPhMRDxjhlP3OB5BQ7ZGM4fbeype4AKStwELmzhPNKX
	 PRq15fBdPfCKA==
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-78fb7ab7562so45930907b3.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Dec 2025 05:12:38 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUasVi9VCPbRs0l4nE88quDgAZFmNhrYjskSPl2nnVRIA6n6lBfE4sz/4iimmtMbormkRTWdouLbwAjWyzT@vger.kernel.org
X-Gm-Message-State: AOJu0YyWNIgOlgzX4atXGUv3t+UeZ9QKs9Fw3+rX0zPPQk20EHY7ogCW
	v0zysK+2N90X9r46i8AFao6QF1sPnkuD1pm1L42xvbynw8WgQ7Xd0J8r6v+GxS3emkFVQ8vnQUQ
	mFvNyBp3hk7RNaS0wt+bINee+ZXUIcuQ=
X-Google-Smtp-Source: AGHT+IGmhlnJ0PToCvZmuGscbqXwcRqzYdAxN+NFwJU7gA7/JSlrLdG/1wm0C3KwDBBJAi3urx/GCXaraM6C2ePxBb8=
X-Received: by 2002:a05:690c:4d41:b0:78c:5803:f698 with SMTP id
 00721157ae682-78fb403b9aamr385026607b3.33.1766754757491; Fri, 26 Dec 2025
 05:12:37 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251222-drm-panels-sony-v2-0-82a87465d163@somainline.org> <20251222-drm-panels-sony-v2-3-82a87465d163@somainline.org>
In-Reply-To: <20251222-drm-panels-sony-v2-3-82a87465d163@somainline.org>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 26 Dec 2025 14:12:25 +0100
X-Gmail-Original-Message-ID: <CAD++jL=c0AVm+BD_G_AJjiXYVyWdM_HscqyoNQ-tBByJ1Dp1jQ@mail.gmail.com>
X-Gm-Features: AQt7F2r_DQWqe8tD8blx02oq3sr8lk-4w7LLSBCfnV6-rbVvc0VYIwBG758Oukk
Message-ID: <CAD++jL=c0AVm+BD_G_AJjiXYVyWdM_HscqyoNQ-tBByJ1Dp1jQ@mail.gmail.com>
Subject: Re: [PATCH v2 03/11] drm/panel: Add LGD LH599QH3-EDB1 panel driver
 for Sony Xperia XZ3
To: Marijn Suijten <marijn.suijten@somainline.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Sam Ravnborg <sam@ravnborg.org>, 
	David Airlie <airlied@gmail.com>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Jessica Zhang <jesszhan0024@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Simona Vetter <simona@ffwll.ch>, 
	Casey Connolly <casey.connolly@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Simona Vetter <simona.vetter@ffwll.ch>, 
	~postmarketos/upstreaming@lists.sr.ht, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>, 
	Martin Botka <martin.botka@somainline.org>, Jami Kettunen <jami.kettunen@somainline.org>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
	Jessica Zhang <quic_jesszhan@quicinc.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Konrad Dybcio <konradybcio@kernel.org>, 
	Dmitry Baryshkov <lumag@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Marijn,

thanks for your patch!

overall this looks very nice.

When adding new panels it's nice if we can figure out which display control=
ler
it is actually using, because that makes it possible to share a driver betw=
een
multiple displays using a per-display-controller driver.

But this one beats me, so keep it as-is... no idea what display controller
(DDIC) this is.

On Mon, Dec 22, 2025 at 12:32=E2=80=AFAM Marijn Suijten
<marijn.suijten@somainline.org> wrote:
>
> Sony provides an LGD LH599QH3-EDB1 panel + Atmel maXTouch assembly in
> its Xperia XZ3 (tama akatsuki) phone, with custom DCS commands to match.
>
> The panel is 1440x2880 pixels and runs at 60Hz.  It requires Display
> Stream Compression 1.1 to be driven at that mode.
>
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>

(...)
> +config DRM_PANEL_LGD_LH599QH3_EDB1
> +       tristate "LGD LH599QH3-EDB1 DSI cmd mode panel"
> +       depends on GPIOLIB
> +       depends on OF
> +       depends on DRM_MIPI_DSI
> +       depends on BACKLIGHT_CLASS_DEVICE
> +       select DRM_DISPLAY_DSC_HELPER
> +       select DRM_DISPLAY_HELPER

Nice use of helpers!

> +static int lgd_lh599qh3_edb1_program(struct lgd_lh599qh3_edb1 *ctx)
> +{
> +       struct mipi_dsi_multi_context dsi_ctx =3D { .dsi =3D ctx->dsi };
> +
> +       dsi_ctx.dsi->mode_flags |=3D MIPI_DSI_MODE_LPM;
> +
> +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x7f, 0x5a, 0x5a);
> +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf0, 0x5a, 0x5a);
> +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf1, 0x5a, 0x5a);
> +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf2, 0x5a, 0x5a);

Clearly an "unlock" sequence.

> +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x02, 0x01);
> +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x59, 0x01);
> +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MIPI_DCS_WRITE_CONTROL_DIS=
PLAY,
> +                                    WRITE_CONTROL_DISPLAY_BACKLIGHT);
> +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x57, 0x20, 0x80, 0xde, 0x=
60, 0x00);
> +       mipi_dsi_dcs_set_column_address_multi(&dsi_ctx, 0, 1440 - 1);
> +       mipi_dsi_dcs_set_page_address_multi(&dsi_ctx, 0, 2880 - 1);
> +
> +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MIPI_DCS_WRITE_POWER_SAVE,=
 0x00);
> +
> +       mipi_dsi_dcs_set_tear_on_multi(&dsi_ctx, MIPI_DSI_DCS_TEAR_MODE_V=
BLANK);
> +
> +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x7f, 0x5a, 0x5a);
> +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf0, 0x5a, 0x5a);
> +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf1, 0x5a, 0x5a);
> +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf2, 0x5a, 0x5a);

Cleary another copy of the "unlock" sequence.

Can you break it out to a subroutine?
lgd_lh599qh3_edb1_unlock()?

+/- this nitpick:
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

