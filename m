Return-Path: <linux-arm-msm+bounces-859-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E6767EEE0D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Nov 2023 10:04:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AE2761C2082F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Nov 2023 09:04:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC275DF53;
	Fri, 17 Nov 2023 09:04:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KRV/UNxM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4652711F
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Nov 2023 01:03:58 -0800 (PST)
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-1cc1ee2d8dfso15603115ad.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Nov 2023 01:03:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700211836; x=1700816636; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+a/E73oKPUIpqCJpWkfrUK2tYAxoil+7+qeJQEo9/6E=;
        b=KRV/UNxMVozR3SgGWNRkF+8KmXKiyHcs5wzL8F08b5nFnD+CTsPLOXU5mAMytb0gnj
         BocBX+nQyJjnIR2DfhTowuV48shRyf+pDUIhq9irTEQRZG3fDC+ufGOfY1nAZUUVNUqA
         +MmagW6+3rd3JBXfDpjrD9d0putr4wOkdhjSCLI4EF4ncYw0vTVg+VSi5isHLFJXHheH
         NRNZ/Juyb/nFz1cj87SKeyTr5I9z7TW5Qk4QXR0oAMN5+qFQcaAVOoTSTQD1gs3h40m2
         K/42xKCJbMTrTpuMsm1TL3MI1ApfygBFa/KOLzUW5VcQBGmGrgFeRyBM8ZEu8X2o2oZ5
         S3HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700211836; x=1700816636;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+a/E73oKPUIpqCJpWkfrUK2tYAxoil+7+qeJQEo9/6E=;
        b=b0oaq8j98tG5wesR67LW04ornqOSN2UXRtbdzfAvCZPmP8PmsE8nrDT0KZBx+NGhep
         kjLgblHIHzJftYpuBshUX4kCv2Wi84BYJwbWY4ubCuyn2Dzv0GwfWgdKOSxsI1pHbzVQ
         +G3AmnoSMNOE+fPyC0x+qoH10v6sNSTBPXn5LXs5eOGlbBXseMDt8m6KtBEBLLeBaDsA
         Oqo8XlP8BM7r5iADCZ8gURLy/Di8/ky3PaqEIGSlQEpKu+8abRNMh3mOgQA0Ele/fN8o
         8vYDVxbhfbowAFiPmSdCme47mFvxfTDvMQmuqirS2rOONbhr2B9UgErN4JT0VhLXwR94
         3ztw==
X-Gm-Message-State: AOJu0YwbzRL4yPptJMZMBcIXBZQuHzs8WUDXJZJoekHIQKd36TFgHVnM
	Jt/1JdPRv/cSgLKK0xO0xIep
X-Google-Smtp-Source: AGHT+IFja+WtC2OS4zhsenW8j0sFIeX9xO+zebfk77FBON46A04n4N2e+BUmVOq8jwsyvcPLOH/0Ew==
X-Received: by 2002:a17:903:2343:b0:1ca:1be4:bda4 with SMTP id c3-20020a170903234300b001ca1be4bda4mr13259932plh.4.1700211836575;
        Fri, 17 Nov 2023 01:03:56 -0800 (PST)
Received: from thinkpad ([103.28.246.177])
        by smtp.gmail.com with ESMTPSA id i4-20020a170902eb4400b001c62e3e1286sm944986pli.166.2023.11.17.01.03.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Nov 2023 01:03:56 -0800 (PST)
Date: Fri, 17 Nov 2023 14:33:49 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Rohit Agarwal <quic_rohiagar@quicinc.com>
Cc: catalin.marinas@arm.com, will@kernel.org, quic_bjorande@quicinc.com,
	geert+renesas@glider.be, konrad.dybcio@linaro.org, arnd@arndb.de,
	krzysztof.kozlowski@linaro.org, neil.armstrong@linaro.org,
	dmitry.baryshkov@linaro.org, nfraprado@collabora.com,
	m.szyprowski@samsung.com, u-kumar1@ti.com, peng.fan@nxp.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, kernel@quicinc.com
Subject: Re: [PATCH v3] arm64: defconfig: Enable GCC, pinctrl and
 interconnect for SDX75
Message-ID: <20231117090349.GA244633@thinkpad>
References: <20231117055849.534671-1-quic_rohiagar@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231117055849.534671-1-quic_rohiagar@quicinc.com>

On Fri, Nov 17, 2023 at 11:28:49AM +0530, Rohit Agarwal wrote:
> Enable Global Clock controller, pinctrl and interconnect framework
> support for Qualcomm's SDX75 SoC which is required to boot to
> console on sdx75-idp platform.
> 
> Signed-off-by: Rohit Agarwal <quic_rohiagar@quicinc.com>
> ---
> 
> Hi,
> 
> Changes in v3:
>  - Clubbed all the three patches in a single patch.
>  - Link to v2: https://lore.kernel.org/all/20231116093513.14259-1-quic_rohiagar@quicinc.com/
> 
> Changes in v2:
>  - Updated the commit message for the patches.
> 
> Thanks,
> Rohit.
> 
>  arch/arm64/configs/defconfig | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index b60aa1f89343..4c0cd428d073 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -599,6 +599,7 @@ CONFIG_PINCTRL_SC8280XP=y
>  CONFIG_PINCTRL_SDM660=y
>  CONFIG_PINCTRL_SDM670=y
>  CONFIG_PINCTRL_SDM845=y
> +CONFIG_PINCTRL_SDX75=y
>  CONFIG_PINCTRL_SM6115=y
>  CONFIG_PINCTRL_SM6115_LPASS_LPI=m
>  CONFIG_PINCTRL_SM6125=y
> @@ -1252,6 +1253,7 @@ CONFIG_SDM_GPUCC_845=y
>  CONFIG_SDM_VIDEOCC_845=y
>  CONFIG_SDM_DISPCC_845=y
>  CONFIG_SDM_LPASSCC_845=m
> +CONFIG_SDX_GCC_75=y
>  CONFIG_SM_CAMCC_8250=m
>  CONFIG_SM_DISPCC_6115=m
>  CONFIG_SM_DISPCC_8250=y
> @@ -1519,6 +1521,7 @@ CONFIG_INTERCONNECT_QCOM_SC7280=y
>  CONFIG_INTERCONNECT_QCOM_SC8180X=y
>  CONFIG_INTERCONNECT_QCOM_SC8280XP=y
>  CONFIG_INTERCONNECT_QCOM_SDM845=y
> +CONFIG_INTERCONNECT_QCOM_SDX75=y

Is there any criteria to make ICC built-in? I'd vote for built-in on all
platforms to keep it aligned eventhough old platforms do not require it for
booting.

- Mani

>  CONFIG_INTERCONNECT_QCOM_SM8150=m
>  CONFIG_INTERCONNECT_QCOM_SM8250=m
>  CONFIG_INTERCONNECT_QCOM_SM8350=m
> -- 
> 2.25.1
> 
> 

-- 
மணிவண்ணன் சதாசிவம்

