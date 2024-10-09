Return-Path: <linux-arm-msm+bounces-33750-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B2AB3997853
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Oct 2024 00:14:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D3EF11C213BF
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Oct 2024 22:14:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8132B1E285F;
	Wed,  9 Oct 2024 22:14:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="O51byx1b"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C062A1E0489
	for <linux-arm-msm@vger.kernel.org>; Wed,  9 Oct 2024 22:13:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728512040; cv=none; b=jrPm6P9WiYJy4OQDA313anwyMQfAG3iyvG7KJp0benR6cCmWOE2hnLThZWDAdqblrKXr/qBm7UbdVhlQZSEc5hsj0ZR5wv3Fe8a1V+qjrqRFX1qA4mwcKXgiUph6OaViJ5nN3VpotWSh0VKR833kBBbFuq7be1fXAe58Sxnj5RM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728512040; c=relaxed/simple;
	bh=cNmdKtfBj8UPaIz1fCuDcN6qXGE8nFWhMT394NCcRW4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=etFYrOaTXZE/Xo14kxCFp+WcK1HXq8K1WqB5swPlocVFI11KsawFIeN4PImhUBpckhNpJxcCFM3KrFUdN0PJkiA0Vrw41/3GpN2dSvnBnmyMSxKksvBFbbEOFBm4+6p++adT6TnrlYP+XhFwqAH0twi00B7gSnbUj3YMmEPcLJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=O51byx1b; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-6e2e3e4f65dso4052877b3.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Oct 2024 15:13:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728512038; x=1729116838; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7ZSnAryhvRVAxOzTa39firHYc0HGN21O7Mp2XuZXfKY=;
        b=O51byx1bOF5S6+pFj2Aj4YVB71DCxN+RHrTt6lhReO6BSD2HLsyeN8Vp1BKbDlUnym
         brlBDEIcOQd1OzdSASG+gVSeUKmzY3EqhyouOvvMmr7XCwuaEdiIrtZm+uXL0Swf/UAu
         Yp3ntF8cNky9+X8w2J28HvUgdofHJccIOqtWhwEot2ZVjz5YdVuvYsBrELAPikJ+6aL6
         uiHkuFQFMhoVMTGqPML4BuEUCVtK6SLwBmLhNGLsDlvxloGG+hfuweNPmWrCs+Xqi9VY
         r3qrNnya8yGbTkSc+icGvTbOSodU5G3SIcJeei2/jqoOqHqwqilX/RrF32q4iN3hj/ee
         GRWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728512038; x=1729116838;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7ZSnAryhvRVAxOzTa39firHYc0HGN21O7Mp2XuZXfKY=;
        b=qWJCcn7ewYuHFOctZ/PYBrZ7moEgF9Fpn/mCid/N4y5ulglj/JSgw59kzKk72mnt4+
         8NaOR9+VyASapC/BuiX0ReSLmXjXqjrwS75HyxbRjEppUigOh/dGTfKSuwWdTTajEZ7d
         4AaQ9t2F8stO5kmSiCD/QYlacTYrgbmRsiEehJYOin0h498paFcz0bnO4HnMsnBp8H0F
         3Gkdh3Wa53YGTJw0xYDCXtYlTmg88fgOWFOlQ57lPXZcT9Vz/Pxam6fnvhCLKwLyh1oX
         MzBAh6K0D5VNvrOHj6R929l/IJzswbFO+vkmkyDOrqf5Ho3AomSWrNiFLKUtTznOfLl1
         gXxw==
X-Forwarded-Encrypted: i=1; AJvYcCUPalqKWFS2H5j9VNz+M/PDRez43JRFQtUK9GQKA+so+sMTIOHfci38uJ709qSzqXI8mAKN+7WUJAzWmG96@vger.kernel.org
X-Gm-Message-State: AOJu0YwpV8iSxCd8L1KtP1fTo4FTsNiqAqVJOZ8pZ3C4AQtbwEplFoHl
	D7gp5LMewOcWSUs02zphwhEBPhMvaW/KUrl8xyZfJV0VW0aNMKCv9ErmMqM4c+VsyJIitxMQz6K
	NuqZmpKZkpgyRKAVWGTcvwDmPZp/SABeMAdBHkQ==
X-Google-Smtp-Source: AGHT+IE8N/AQRHVkfQpViJ7j87DJYPlLqudgKJPaHi0a2xWoaLY/SYqNoHWu/8CjFR85/GwjoCayPnP8Gpj2MkizG/U=
X-Received: by 2002:a05:690c:113:b0:6e3:ceb:ce2b with SMTP id
 00721157ae682-6e32250ade9mr39940947b3.44.1728512037720; Wed, 09 Oct 2024
 15:13:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241009-patchv3_1-v4-0-cd683a9ca554@quicinc.com>
In-Reply-To: <20241009-patchv3_1-v4-0-cd683a9ca554@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 10 Oct 2024 01:13:46 +0300
Message-ID: <CAA8EJpquGKn1kC1Z7dDgBd-ZXKO34ZFRPAHjYaAZQguUs6N__w@mail.gmail.com>
Subject: Re: [PATCH v4 0/5] Display enablement changes for Qualcomm SA8775P platform
To: Mahadevan <quic_mahap@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Kalyan Thota <quic_kalyant@quicinc.com>, 
	Jayaprakash Madisetty <quic_jmadiset@quicinc.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, 9 Oct 2024 at 17:34, Mahadevan <quic_mahap@quicinc.com> wrote:
>
> This series introduces support to enable the Mobile Display Subsystem (MDSS)
> and Display Processing Unit (DPU) for the Qualcomm SA8775P target. It
> includes the addition of the hardware catalog, compatible string,
> relevant device tree changes, and their YAML bindings.
>
> ---
> In this series
> - PATCH 1: "dt-bindings: display/msm: Document MDSS on SA8775P" depends on dp
>   binding documetion in this change:
>   https://lore.kernel.org/all/20240923113150.24711-5-quic_mukhopad@quicinc.com/
> - PATCH 5: "arm64: dts: qcom: sa8775p: add display dt nodes for MDSS0 and DPU"
>   depends on the clock enablement change:
>   https://lore.kernel.org/all/20240816-sa8775p-mm-v3-v1-0-77d53c3c0cef@quicinc.com/
>
> ---
>
> [v4]
> - Removed new YAML added for sa8775p dpu dt-binding documention as it is similar
>   to qcom,sm8650-dpu.yaml and added the compatible in same. [Krzysztof]

And this wasn't tested. Please test the bindings before posting.

>
> [v3]
> -Edited copyright for catalog changes. [Dmitry]
> -Fix dt_binding_check tool errors(update reg address as address-cells and
>  size-cells of root node one and maintain the same for child nodes of mdss,
>  added additionalProperties in schema).
>  [Rob, Bjorn, Krzysztof]
> -Add QCOM_ICC_TAG_ACTIVE_ONLY interconnect path tag to mdp0-mem and mdp1-mem
>  path in devicetree. [Dmitry]
> -Update commit subject and message for DT change. [Dmitry]
> -Remove interconnect path tags from dt bindings. (ref sm8450-mdss yaml)
>
> [v2]
> - Updated cover letter subject and message. [Dmitry]
> - Use fake DISPCC nodes to avoid clock dependencies in dt-bindings. [Dmitry]
> - Update bindings by fixing dt_binding_check tool errors (update includes in example),
>   adding proper spacing and indentation in the binding example, droping unused labels,
>   droping status disable, adding reset node. [Dmitry, Rob, Krzysztof]
> - Reorder compatible string of MDSS and DPU based on alphabetical order.[Dmitry]
> - add reg_bus_bw in msm_mdss_data. [Dmitry]
> - Fix indentation in the devicetree. [Dmitry]
>
> --
> 2.34.1
>
> ---
> Mahadevan (5):
>       dt-bindings: display/msm: Document MDSS on SA8775P
>       dt-bindings: display/msm: Document the DPU for SA8775P
>       drm/msm: mdss: Add SA8775P support
>       drm/msm/dpu: Add SA8775P support
>       arm64: dts: qcom: sa8775p: add display dt nodes for MDSS0 and DPU
>
>  .../bindings/display/msm/qcom,sa8775p-mdss.yaml    | 241 ++++++++++
>  .../bindings/display/msm/qcom,sm8650-dpu.yaml      |   1 +
>  arch/arm64/boot/dts/qcom/sa8775p.dtsi              |  89 ++++
>  .../drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h    | 485 +++++++++++++++++++++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |   1 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |   1 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |   1 +
>  drivers/gpu/drm/msm/msm_mdss.c                     |  11 +
>  8 files changed, 830 insertions(+)
> ---
> base-commit: e390603cfa79c860ed35e073f5fe77805b067a8e
> change-id: 20240930-patchv3_1-600cbc1549e8
>
> Best regards,
> --
> Mahadevan <quic_mahap@quicinc.com>
>


-- 
With best wishes
Dmitry

