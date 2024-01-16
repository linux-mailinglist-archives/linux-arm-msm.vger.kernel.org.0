Return-Path: <linux-arm-msm+bounces-7333-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 734F282EC78
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jan 2024 11:01:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1B1D01F222B7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jan 2024 10:01:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECC611B943;
	Tue, 16 Jan 2024 09:59:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="B6r3wqC3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E4CF175AF
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jan 2024 09:59:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-5ff484f2ae7so9313937b3.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jan 2024 01:59:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705399195; x=1706003995; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=n977xLZKtbxmqWIkeBAlyzycB8BQHRlez2+T0U3oZjg=;
        b=B6r3wqC3RvjP+dk5KX8xK/6FFIy0W5MmbozslMzz3QwG1bIkfQhnwmq4osDFHNyr+7
         jHa1lXfBNrI1JKZv0hQI6sRcohkiubozBT+FMy/hj32IIWyw1p4Ue5mJEwEa+zfElxwG
         o9QLOM+2bZ8r3H09NoSTgktJJy5iBulGbfyLkP8jLZPqQ5eZSvo/DE5scVf800G+bfnO
         cgjXl9UqMp2IczbJJ2pzj5lzNG5J1Agp6eOY4O9Sp2avYd+jkZiVyCdXGWPCt8ZRSyDk
         ftFMf68VyAG9dVs7m9s7CwmKlgz1m+jGpx2TrHnK+mT0ZZvLkKMnBJ33M7vrZbXTvx+T
         PehQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705399195; x=1706003995;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n977xLZKtbxmqWIkeBAlyzycB8BQHRlez2+T0U3oZjg=;
        b=SX2s5pTa08dit27nTxf9HoHwdIzVti+98QcdLdShds544ycsJzdQrwETmYjaF6IfH0
         0fc/NNWP4U8RCfUsKAsjGGGfEDTErx5gwXJofvgquuGOs/6U0fBWuj0f5+aoChXlK0iJ
         FbCe6Ka7f62XC+zUs7GaDUFxNeGFMFG/Dnj4JyvfSDR3ht2Fvx8yGWtJENkimwndQFN9
         5GktQcMkGcTDzAHtq0bQleCksljjMJDfJ1ESBUYXzm3fhT3cH8uhghL8dbFdPTIqTRDG
         ydBeLj4blptgctdfEnZD1QcOR9igx7JCgehQJIWWpijfJkr22n0dO1ZXlcvpuTwPXSqy
         JF9Q==
X-Gm-Message-State: AOJu0YxIY9FdrWbRnbDnvb99sScfMcy8gy12M2JS/PM8Ba1FBlxm8OtA
	uAUWT3HJ1ZEYCpM8NSap6MRW9U/vcktfCJKo2V7LNDJoRfnN5A==
X-Google-Smtp-Source: AGHT+IHTGKoEWWluMZDlCNLG9Lmvhz1txOmX0sES7QvTXTWHdQiwO7uEdOzPjmhAalPzyNROWI5FvO13Mrh41KGzZTA=
X-Received: by 2002:a81:4e42:0:b0:5ff:32a7:a31c with SMTP id
 c63-20020a814e42000000b005ff32a7a31cmr2405164ywb.89.1705399195341; Tue, 16
 Jan 2024 01:59:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240116094935.9988-1-quic_riteshk@quicinc.com> <20240116094935.9988-2-quic_riteshk@quicinc.com>
In-Reply-To: <20240116094935.9988-2-quic_riteshk@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 16 Jan 2024 11:59:44 +0200
Message-ID: <CAA8EJpo3YS4EzfsLtovYKbLSGYX=RwUn9dpmCW=j257LnvPrgw@mail.gmail.com>
Subject: Re: [PATCH 1/2] arm64: defconfig: enable Novatek NT36672E DSI Panel driver
To: Ritesh Kumar <quic_riteshk@quicinc.com>
Cc: andersson@kernel.org, konrad.dybcio@linaro.org, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
	catalin.marinas@arm.com, will@kernel.org, quic_bjorande@quicinc.com, 
	geert+renesas@glider.be, arnd@arndb.de, neil.armstrong@linaro.org, 
	nfraprado@collabora.com, m.szyprowski@samsung.com, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	quic_abhinavk@quicinc.com, quic_rajeevny@quicinc.com, 
	quic_vproddut@quicinc.com
Content-Type: text/plain; charset="UTF-8"

On Tue, 16 Jan 2024 at 11:49, Ritesh Kumar <quic_riteshk@quicinc.com> wrote:
>
> Build the Novatek NT36672E DSI Panel driver as module.

... because it is used on ....

>
> Signed-off-by: Ritesh Kumar <quic_riteshk@quicinc.com>
> ---
>  arch/arm64/configs/defconfig | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index 361c31b5d064..028d80be95f6 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -859,6 +859,7 @@ CONFIG_DRM_PANEL_LVDS=m
>  CONFIG_DRM_PANEL_SIMPLE=m
>  CONFIG_DRM_PANEL_EDP=m
>  CONFIG_DRM_PANEL_ILITEK_ILI9882T=m
> +CONFIG_DRM_PANEL_NOVATEK_NT36672E=m
>  CONFIG_DRM_PANEL_MANTIX_MLAF057WE51=m
>  CONFIG_DRM_PANEL_RAYDIUM_RM67191=m
>  CONFIG_DRM_PANEL_SITRONIX_ST7703=m
> --
> 2.17.1
>


-- 
With best wishes
Dmitry

