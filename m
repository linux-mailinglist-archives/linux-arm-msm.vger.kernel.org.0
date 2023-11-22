Return-Path: <linux-arm-msm+bounces-1477-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B4EDA7F4352
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Nov 2023 11:12:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6F93E281468
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Nov 2023 10:12:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65FE625578;
	Wed, 22 Nov 2023 10:12:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vcS4qQIw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com [IPv6:2607:f8b0:4864:20::b31])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF6ED1A4
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Nov 2023 02:12:12 -0800 (PST)
Received: by mail-yb1-xb31.google.com with SMTP id 3f1490d57ef6-da3b4b7c6bdso6447274276.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Nov 2023 02:12:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700647932; x=1701252732; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=VSREVsoB+CesK7N1lJ9hwky3qVq4cMcaEkJfYCXHc2o=;
        b=vcS4qQIwzKHi9nBoZmfaH3sxKzDqDA/ZpVOh/ETXLV1sEEAqA4/3jNvbMfyIe1rmDH
         ESkrFFAVXDgKYfEjUbhXiN4+e+gOuQmh7CRiFeuusOsWIJaKad4QWBvQWBi3XzNKwhlR
         PPZY3+879Kb2295YJCjvyDiV7UdKHSlZprjlYlFWUI4wCu73NSGw1HIaHvjnFw+rs9kW
         UHYUb+XZGDtdK+UiCY9Pz07PHj6pDJazzj8bpOMp/ezT04kCgXzcuQuDXs5krCgWSWrL
         gpp/gNUq9Fp9cfRpgO6ja2In/AqGfTTyJaQYUkER9dUVDQaCHGQ3287fCiBjpbqRk/7g
         byLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700647932; x=1701252732;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VSREVsoB+CesK7N1lJ9hwky3qVq4cMcaEkJfYCXHc2o=;
        b=vxje2rapo27P3nwWzrk+ypSrcbumE2ayDJMcdttA0qQXQ54U/5Xur/lwnVKmuEQo5n
         X8/E9u6v29Q5FX26Xuv0K+7Qaaq2/2dY1lBdF4jta6lNBD9ZDiIikstLgoP6lA+KApEE
         s5xSh+nOjE+VKhKcY+5nwYD4MtL4+V0wccKzrmvfOD5OgNg5Cr0RkB6XmBk4SYdvUyBC
         4ciKwH/6vGdQYsS0iNtDALnaW9c8TudHYvEq73Scy72CHUXeeOFu7QhY5JUfd77DXtAJ
         dnUrkpDWlOJPabjG/hHxXfj+nsgGK30T3KgXyjQbL2acDCuKtkmAIGVB6XEOMi20do7G
         p/bQ==
X-Gm-Message-State: AOJu0YxTks9AV2jkqAWlmyF2vk7WR2kp77dVxMzHJD8tPJy5DAaYEHRC
	/AgRxwTKssRaJHsZUB/JNZoTpt7VQiMMNE3WZoi4tw==
X-Google-Smtp-Source: AGHT+IFoK6s2cp0X+5kb85bnx93gSvCPfnd5ajslb+t2IOP8hiHp9ntEKCFuwd1BgpAjTsed4Xf9HwYDAoGgI2aS+Os=
X-Received: by 2002:a0d:d6cb:0:b0:5c6:4de5:168f with SMTP id
 y194-20020a0dd6cb000000b005c64de5168fmr1594152ywd.10.1700647931878; Wed, 22
 Nov 2023 02:12:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231122-phy-qualcomm-v6-v6-20-v7-new-offsets-v1-0-d9340d362664@linaro.org>
 <20231122-phy-qualcomm-v6-v6-20-v7-new-offsets-v1-2-d9340d362664@linaro.org>
In-Reply-To: <20231122-phy-qualcomm-v6-v6-20-v7-new-offsets-v1-2-d9340d362664@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 22 Nov 2023 12:12:00 +0200
Message-ID: <CAA8EJpr2HhiXEbp0QsN-qB+L4WQWiV3o2yCc-f5oqdhdKZGL9A@mail.gmail.com>
Subject: Re: [PATCH 2/7] phy: qcom-qmp: qserdes-txrx: Add some more v6.20
 register offsets
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 22 Nov 2023 at 12:04, Abel Vesa <abel.vesa@linaro.org> wrote:
>
> Add some missing v6.20 registers offsets that are needed by the new
> Snapdragon X Elite (X1E80100) platform.
>
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v6_20.h | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v6_20.h b/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v6_20.h
> index 5385a8b60970..7402a94d1be8 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v6_20.h
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v6_20.h
> @@ -14,11 +14,14 @@
>  #define QSERDES_V6_20_TX_LANE_MODE_3                           0x80
>
>  #define QSERDES_V6_20_RX_UCDR_FO_GAIN_RATE_2                   0x08
> +#define QSERDES_V6_20_RX_UCDR_SO_GAIN_RATE_2                   0x18
>  #define QSERDES_V6_20_RX_UCDR_FO_GAIN_RATE_3                   0x0c

As a side note, this should be probably 0x1c. Could you please verify
it and send a fix?

>  #define QSERDES_V6_20_RX_UCDR_PI_CONTROLS                      0x20
>  #define QSERDES_V6_20_RX_UCDR_SO_ACC_DEFAULT_VAL_RATE3         0x34
>  #define QSERDES_V6_20_RX_IVCM_CAL_CTRL2                                0x9c
>  #define QSERDES_V6_20_RX_IVCM_POSTCAL_OFFSET                   0xa0
> +#define QSERDES_V6_20_RX_DFE_1                                 0xac
> +#define QSERDES_V6_20_RX_DFE_2                                 0xb0
>  #define QSERDES_V6_20_RX_DFE_3                                 0xb4
>  #define QSERDES_V6_20_RX_VGA_CAL_MAN_VAL                       0xe8
>  #define QSERDES_V6_20_RX_GM_CAL                                        0x10c
> @@ -41,5 +44,6 @@
>  #define QSERDES_V6_20_RX_MODE_RATE3_B4                         0x220
>  #define QSERDES_V6_20_RX_MODE_RATE3_B5                         0x224
>  #define QSERDES_V6_20_RX_MODE_RATE3_B6                         0x228
> +#define QSERDES_V6_20_RX_BKUP_CTRL1                            0x22c
>
>  #endif
>
> --
> 2.34.1
>
>


-- 
With best wishes
Dmitry

