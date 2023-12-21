Return-Path: <linux-arm-msm+bounces-5708-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E12081AF24
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Dec 2023 08:09:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D67F41F229AA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Dec 2023 07:09:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E30E8D2E8;
	Thu, 21 Dec 2023 07:09:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SOdfePte"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86B5ECA49
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 Dec 2023 07:09:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-dbd38c6598fso290025276.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 Dec 2023 23:09:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1703142556; x=1703747356; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7FlHxB9ycdzSx3J7qd9DR/F+NC/7ujcGrvkDWkpFT4A=;
        b=SOdfePtevvjs4oBC3LuWIZZLJD+Otw7OovQdvaCHLIAuZazmeMtl9+Y+OwWxsMPfx2
         CSX/JWbpCeM1ZNQOK45nkrbAZI8Zb0W0yozcu2CeC4DrFZUmCOJPkPcXi0NL3kVftc/4
         QWlYgnSjibfxpETzDmZib0aGiqbes0IB3GYAFcCMUhXQr9IiVw23hSfFKtLp+OnL7ck7
         8f7yCA41bbOyflQeP1IC033Oy2JUmbvWW5hWA2w7eQB4w94Wustz/bxBfnUETppKCS6X
         iYpgIBr1EKI53fbiGiST60JSdAcvTFrgsyPLqU3jSEMn0kngr82xI+KQrWF01h+jF5EG
         i/eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703142556; x=1703747356;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7FlHxB9ycdzSx3J7qd9DR/F+NC/7ujcGrvkDWkpFT4A=;
        b=L54eJs/hMMJaMup5hHxTuu41pl2oY07e9xWb5JJsSrDLa7vXfzbhBdkgO3xy6AKUuI
         1a1/gfVLQyifBUlgZZHJk3+zpBkY63B0pCfoRyAoKoU1HYXhSEU9UJoizLGvesu2+BBZ
         CJUHmwhnnVv7fJX6Y1xJk08nK4vC9wcXwBV2MHBbqEJF5xyXul+dhc6ZdCH+oSeoTeHz
         lDSp0gVa5z60Di7wPn0DgcEH8IwQw+x0Bj8Y8dooLeA0Iy73Jqrbye7smE30hbF9Xgnh
         ImSrqBPSwphZyh3WdMvQUtO/s7NgvW+uXMfyBoj68gOYbRBVF1to6ABxUvTsuZFMiq4R
         gnpw==
X-Gm-Message-State: AOJu0YyBE9Z9dxtB/qco607h5+aXAI8boY0nUFbb0bEYQ8AJ7oi1rvqF
	EuiUcSrPOsIFkvpGWW2ClyWQO/WMLI5v/ejRsYjhnQ==
X-Google-Smtp-Source: AGHT+IHI6Gn2wy8/SWzwangQnRtcbelX3ONlareSqE9pUrFR2bGt1gHVhVZy5MqDQgRZzAuir+4F9MCMbVQTvd20YS8=
X-Received: by 2002:a25:d785:0:b0:da0:3d48:aa68 with SMTP id
 o127-20020a25d785000000b00da03d48aa68mr540126ybg.50.1703142556543; Wed, 20
 Dec 2023 23:09:16 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231220-sa8295p-gpu-v1-0-d8cdf2257f97@quicinc.com> <20231220-sa8295p-gpu-v1-7-d8cdf2257f97@quicinc.com>
In-Reply-To: <20231220-sa8295p-gpu-v1-7-d8cdf2257f97@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 21 Dec 2023 09:09:05 +0200
Message-ID: <CAA8EJpqiW7Sw-=3FzVjZMh0UcYgXWQCqL5P4Bk0QqrVahJYzQA@mail.gmail.com>
Subject: Re: [PATCH 7/8] arm64: dts: qcom: sa8295p-adp: Enable GPU
To: Bjorn Andersson <quic_bjorande@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Taniya Das <quic_tdas@quicinc.com>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Johan Hovold <johan+linaro@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 21 Dec 2023 at 05:52, Bjorn Andersson <quic_bjorande@quicinc.com> wrote:
>
> With the necessary support in place for supplying VDD_GFX from the
> MAX20411 regulator, enable the GPU clock controller, GMU, Adreno SMMU
> and the GPU on the SA8295P ADP.
>
> Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/sa8295p-adp.dts | 29 +++++++++++++++++++++++++++++
>  1 file changed, 29 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/sa8295p-adp.dts b/arch/arm64/boot/dts/qcom/sa8295p-adp.dts
> index e16406c9c19d..7775c5f4d2e8 100644
> --- a/arch/arm64/boot/dts/qcom/sa8295p-adp.dts
> +++ b/arch/arm64/boot/dts/qcom/sa8295p-adp.dts
> @@ -108,6 +108,13 @@ edp3_connector_in: endpoint {
>                         };
>                 };
>         };
> +
> +       reserved-memory {
> +               gpu_mem: gpu-mem@8bf00000 {
> +                       reg = <0 0x8bf00000 0 0x2000>;
> +                       no-map;
> +               };
> +       };
>  };
>
>  &apps_rsc {
> @@ -286,6 +293,28 @@ vdd_gfx: regulator@39 {
>         };
>  };
>
> +&gpucc {
> +       vdd-gfx-supply = <&vdd_gfx>;
> +       status = "okay";
> +};
> +
> +&gmu {
> +       status = "okay";
> +};
> +
> +&gpu {
> +       status = "okay";
> +
> +       zap-shader {
> +               memory-region = <&gpu_mem>;
> +               firmware-name = "qcom/sa8295p/a690_zap.mdt";

Can we please have .mbn here? Other than that, it looks good to me.

> +       };
> +};
> +
> +&gpu_smmu {
> +       status = "okay";
> +};
> +
>  &mdss0 {
>         status = "okay";
>  };
>
> --
> 2.25.1
>
>


-- 
With best wishes
Dmitry

