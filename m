Return-Path: <linux-arm-msm+bounces-17686-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 20B358A822D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Apr 2024 13:32:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 41AB21C212F5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Apr 2024 11:32:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C45313CF8D;
	Wed, 17 Apr 2024 11:32:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CPdvH8+w"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 757E113C8EE
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Apr 2024 11:32:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713353531; cv=none; b=V4vYJwe+/y2howgQ72Isa2/HfJPGlowgvbMtCOdUseMBzoHqPZCFDDjpD8Fq1LLAxoFsSSsTpaJJwnPhDGE02Nab9QZSOUZtuf5nwaLvT1OMKatPt5G0U2GeTf8Yf0hl8JqIJSb57SmmT2DW/fsnDQayjyYwaBKFuuupUh3R680=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713353531; c=relaxed/simple;
	bh=nFgsoHDRyjy2pIUsSKGk1hmqklyXjtnFV+C3uDT2Vhs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hHSLAVsh9xOB/6WN4xsEoX/Fz+wJwQMFy4sji10XR3rf5OkU74ZK78kn64zMdrPCKsjo4NnJMWu8t6OElslt112at5qXihK9ZgrGOoT1b7IATA3e+fevPD2vmPLGIgLgYwcKknDvKEofbEXtyyUbyy+KpZxtzsENGf7fHOKvcN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CPdvH8+w; arc=none smtp.client-ip=209.85.219.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-dcc80d6004bso5424995276.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Apr 2024 04:32:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713353527; x=1713958327; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4v6W4xRXl47pD7tcdIWVC0ohUwgC4w53EhK5/Us5XW8=;
        b=CPdvH8+wJfhTlC/mHx8KvpLpc2b+sBGpjenoeruZjuBU2w13lQSTba3LURSWxTIgV7
         eu8FHW1F49UiQmbwDE1Dkz0xL/MiEIUK7n50gAfWuQm1WeyngtAiN2+xDrkswQWbuduc
         d/iw0x5ObAaFDtP+d+cco/5pW8CkPN4Iq37ef6dTdHar7nM1t9xAVRtEhF37AJSj9e08
         ZZLCuBPgN9CbspkjvHcLLklqlZm18Ie5E/QKfY0wVUw9OLqgSGAyWIJBAVpqZ34kcHZe
         sAHmyllcF8NPKp5nMyUwxwsB5ff9SZQDcdYawfGAKrkkvQyXtXO2pBrPcxIJNDnsfyPe
         5/XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713353527; x=1713958327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4v6W4xRXl47pD7tcdIWVC0ohUwgC4w53EhK5/Us5XW8=;
        b=DQ0cK2HdmT/nZ+2kgZ5xb8ac0xJ13F3pJGJHysTxQr1i4OB+kZBOQZF3c4GjqJCPLk
         wbEqU1vP1zbi55b8cYCx3pTh0xeB9xqLTjh0EAeeuLSceV8zx109p23+NAh7J79g4bwk
         zWFV7nnRjPjILN5WvAhp1n5XMac6tApcQ7DZnY6GV7fRMC93hoTv4sTUaFy9bYZmetQj
         /v52whCJH7Hdmw4x96+et+5uvViETwYkbwNbythCGY4w3eo9vmimqFqa+Km4IcDsgZy4
         JvFsAyTjwh6m5GkqqfmsJj+TZRHsqariAPCK5Vl9D1Sid/q+ZvQG3W18DFFLgkK02q1u
         xnng==
X-Forwarded-Encrypted: i=1; AJvYcCX4yKq6xk7JSJo9lW8qMcFK7xCdVPtUE7pxo6XpvRdJmGFBideDvFtsW9kR19Eq1QvOAUIHvZSqImZsMUARuuUY96pFQLBiNL7AH2RLeQ==
X-Gm-Message-State: AOJu0YyK9zOogTCdY31fWXBw7UNM5OeGRAOPBHwY1Yt+Y6yliNsYwmhk
	TQABKlrJYHCalklMjQRP2vQDX2Gas9ljsiy4vSZRPgnlkjHvFbSRu3E355RaGv9kfFzN5PooJbG
	b52MsTSi/qoDI4VfBJeWB/EP3ApyzVyKxSLDs3g==
X-Google-Smtp-Source: AGHT+IGJsiKoSqmYiWaxLuSfBI71OWu7yHvjT6+1+LiQWOtye6HbuVUzEHh6QVyzBCyZxtzgkP9l9l9etXx82f2Rgm0=
X-Received: by 2002:a05:6902:545:b0:dc7:4ad4:c977 with SMTP id
 z5-20020a056902054500b00dc74ad4c977mr14666907ybs.25.1713353527377; Wed, 17
 Apr 2024 04:32:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240417-msm8660-mmcc-v1-1-efc9e455268c@herrie.org>
In-Reply-To: <20240417-msm8660-mmcc-v1-1-efc9e455268c@herrie.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 17 Apr 2024 14:31:56 +0300
Message-ID: <CAA8EJpo62Co3GjstPZQtgdYHkE=ZJ9x89FDBi_4zXO6W=2P8KQ@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: clock: Add qcom MSM8660 MMCC defines
To: Herman van Hazendonk <github.com@herrie.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, 17 Apr 2024 at 14:19, Herman van Hazendonk
<github.com@herrie.org> wrote:
>
> From: Linus Walleij <linus.walleij@linaro.org>
>
> The compatible binding for the MSM8660 MMCC already exist
> but the enumerator defines are missing. Add them.
>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Herman van Hazendonk <github.com@herrie.org>

Bindings don't make sense without a driver to back them. Otherwise
they are just dead headers.

> ---
>  include/dt-bindings/clock/qcom,mmcc-msm8660.h | 75 +++++++++++++++++++++++++++
>  include/dt-bindings/reset/qcom,mmcc-msm8660.h | 53 +++++++++++++++++++
>  2 files changed, 128 insertions(+)
>
> diff --git a/include/dt-bindings/clock/qcom,mmcc-msm8660.h b/include/dt-bindings/clock/qcom,mmcc-msm8660.h
> new file mode 100644
> index 000000000000..2c7a6a3ae328
> --- /dev/null
> +++ b/include/dt-bindings/clock/qcom,mmcc-msm8660.h
> @@ -0,0 +1,75 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> +/*
> + * Copyright (c) 2013, The Linux Foundation. All rights reserved.
> + */
> +
> +#ifndef _DT_BINDINGS_CLK_MSM_MMCC_8660_H
> +#define _DT_BINDINGS_CLK_MSM_MMCC_8660_H
> +
> +#define GMEM_AXI_CLK           0
> +#define IJPEG_AXI_CLK          1
> +#define IMEM_AXI_CLK           2
> +#define JPEGD_AXI_CLK          3
> +#define MDP_AXI_CLK            4
> +#define VCODEC_AXI_CLK         5
> +#define VFE_AXI_CLK            6
> +#define ROT_AXI_CLK            7
> +#define VPE_AXI_CLK            8
> +#define SMI_2X_AXI_CLK         9
> +#define AMP_AHB_CLK            10
> +#define CSI0_AHB_CLK           11
> +#define CSI1_AHB_CLK           12
> +#define DSI_M_AHB_CLK          13
> +#define DSI_S_AHB_CLK          14
> +#define GFX2D0_AHB_CLK         15
> +#define GFX2D1_AHB_CLK         16
> +#define GFX3D_AHB_CLK          17
> +#define HDMI_M_AHB_CLK         18
> +#define HDMI_S_AHB_CLK         19
> +#define IJPEG_AHB_CLK          20
> +#define IMEM_AHB_CLK           21
> +#define JPEGD_AHB_CLK          22
> +#define MDP_AHB_CLK            23
> +#define ROT_AHB_CLK            24
> +#define SMMU_AHB_CLK           25
> +#define TV_ENC_AHB_CLK         26
> +#define VCODEC_AHB_CLK         27
> +#define VFE_AHB_CLK            28
> +#define VPE_AHB_CLK            29
> +#define GFX3D_SRC              30
> +#define GFX3D_CLK              31
> +#define MDP_SRC                        32
> +#define MDP_CLK                        33
> +#define MDP_VSYNC_SRC          34
> +#define MDP_VSYNC_CLK          35
> +#define MDP_PIXEL_SRC          36
> +#define MDP_PIXEL_CLK          37
> +#define MDP_LCDC_CLK           38
> +#define ROT_SRC                        39
> +#define ROT_CLK                        40
> +#define CAM_SRC                        41
> +#define CAM_CLK                        42
> +#define CSI_SRC                        43
> +#define CSI0_CLK               44
> +#define CSI1_CLK               45
> +#define DSI_BYTE_SRC           46
> +#define DSI_BYTE_CLK           47
> +#define DSI_ESC_CLK            48
> +#define TV_SRC                 49
> +#define TV_ENC_CLK             50
> +#define TV_DAC_CLK             51
> +#define MDP_TV_CLK             52
> +#define HDMI_TV_CLK            53
> +#define HDMI_APP_CLK           54
> +#define VCODEC_SRC             55
> +#define VCODEC_CLK             56
> +#define VPE_SRC                        57
> +#define VPE_CLK                        58
> +#define VFE_SRC                        59
> +#define VFE_CLK                        60
> +#define CSI0_VFE_CLK           61
> +#define CSI1_VFE_CLK           62
> +#define PLL2                   63
> +#define PLL3                   64
> +
> +#endif
> diff --git a/include/dt-bindings/reset/qcom,mmcc-msm8660.h b/include/dt-bindings/reset/qcom,mmcc-msm8660.h
> new file mode 100644
> index 000000000000..c12156b3b8ac
> --- /dev/null
> +++ b/include/dt-bindings/reset/qcom,mmcc-msm8660.h
> @@ -0,0 +1,53 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> +/*
> + * Copyright (c) 2013, The Linux Foundation. All rights reserved.
> + */
> +
> +#ifndef _DT_BINDINGS_RESET_MSM_MMCC_8660_H
> +#define _DT_BINDINGS_RESET_MSM_MMCC_8660_H
> +
> +#define IJPEG_AXI_RESET                0
> +#define IMEM_AXI_RESET         1
> +#define MDP_AXI_RESET          2
> +#define VCODEC_AXI_RESET       3
> +#define VFE_AXI_RESET          4
> +#define ROT_AXI_RESET          5
> +#define VPE_AXI_RESET          6
> +#define AMP_AHB_RESET          7
> +#define CSI0_AHB_RESET         8
> +#define CSI1_AHB_RESET         9
> +#define DSI_M_AHB_RESET                10
> +#define DSI_S_AHB_RESET                11
> +#define GFX2D0_AHB_RESET       12
> +#define GFX2D1_AHB_RESET       13
> +#define GFX3D_AHB_RESET                14
> +#define HDMI_M_AHB_RESET       15
> +#define HDMI_S_AHB_RESET       16
> +#define IJPEG_AHB_RESET                17
> +#define IMEM_AHB_RESET         18
> +#define JPEGD_AHB_RESET                19
> +#define MDP_AHB_RESET          20
> +#define ROT_AHB_RESET          21
> +#define TV_ENC_AHB_RESET       22
> +#define VCODEC_AHB_RESET       23
> +#define VFE_AHB_RESET          24
> +#define VPE_AHB_RESET          25
> +#define MDP_RESET              26
> +#define MDP_VSYNC_RESET                27
> +#define MDP_PIXEL_RESET                28
> +#define ROT_RESET              29
> +#define GFX3D_RESET            30
> +#define CSI0_RESET             31
> +#define CSI1_RESET             32
> +#define DSI_BYTE_RESET         33
> +#define TV_ENC_RESET           34
> +#define MDP_TV_RESET           35
> +#define HDMI_TV_RESET          36
> +#define HDMI_APP_RESET         37
> +#define VCODEC_RESET           38
> +#define VPE_RESET              39
> +#define VFE_RESET              40
> +#define CSI0_VFE_RESET         41
> +#define CSI1_VFE_RESET         42
> +
> +#endif
>
> ---
> base-commit: 96fca68c4fbf77a8185eb10f7557e23352732ea2
> change-id: 20240417-msm8660-mmcc-51c1d1866dcb
>
> Best regards,
> --
> Herman van Hazendonk <github.com@herrie.org>
>
>


-- 
With best wishes
Dmitry

