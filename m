Return-Path: <linux-arm-msm+bounces-33230-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id CBF35991F3D
	for <lists+linux-arm-msm@lfdr.de>; Sun,  6 Oct 2024 17:01:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 72C25B21A8D
	for <lists+linux-arm-msm@lfdr.de>; Sun,  6 Oct 2024 15:01:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4BDF1474B5;
	Sun,  6 Oct 2024 15:01:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BG7p6yPP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25264142621
	for <linux-arm-msm@vger.kernel.org>; Sun,  6 Oct 2024 15:01:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728226869; cv=none; b=ErNNmsuelGe0Zirc+ofZL5tOh1grD43jBGpssomiEqYLTOLW94gNrwyDHYuHV9rJ+dIcADx9Daekkuv76z1jU4+WOCW6HZBE1qzdu5P0JSnwY2zmyfpOYpVyhKPIdvkezFFzrQgv+vYxB7csiAHKIQ4H5IlSm3wiXTkRwDs+YnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728226869; c=relaxed/simple;
	bh=3Jox7XDbaksL3rWHMjU19bnxw0/FsWSY+Vx94uMawHk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GeHL7DBFV0CmLDcE/3wrvfiYSPMrhJPjAmiH+4EdCki9YNFl28NG/17jX4PBLFdnJrsAJk0s1CF4WXLKD1RKwiUj8C8wgOsaKoohFwb2wM8i38s1gmHghCeCCk6RnnyLpGcn2GmncA2TtDb63pbhnxzVIAyU03SO0trCW6y6wDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BG7p6yPP; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-6e2e41bd08bso5918457b3.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 06 Oct 2024 08:01:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728226866; x=1728831666; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=sr7kBmgWEcI5rnWGX+RCamDzTizwOpc6au1fxKMuuS4=;
        b=BG7p6yPPrCaRuC+CVEmOsKToR3szaMm/J0UDvq0hMCM3X9xGFCNwQF4sK7w/uhyWbD
         g/62NLP8hMIAEJ+4CIxgv2tEOE0UhzaBFqx4pcKKZrHv20imtZK+jQhqvpmFvaZ0bgXD
         4jvEzDnIgRy2wjlNpJogsmCO2DNHB3p0v9+c8Sw6UhFOLULbhxpUJzrrV1JsVh9AxyfQ
         V+w+SiAEKiX27EORDnXZ3lpy11qzheBiiGYS5/mTXyt4KIfvlBwlb9QkZAMAv+EbDhW2
         jXt9Rja0NuE0QQZVb8mdBOlv35O6mr40oOs7IpUDG32PpO90QwWVLrqT1Nf/I+7wLJHR
         TSVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728226866; x=1728831666;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sr7kBmgWEcI5rnWGX+RCamDzTizwOpc6au1fxKMuuS4=;
        b=MsMbz5xEezh/cGTopnNeTao5/yE9VYkAFqEOvSssWR7mR5Ru1tvdrk/vHywN4KnYNQ
         6Vr1Xu5cNZiC+OewV+DTONEpvnJFsbEYoyBFAnzfxXdKfHxOND+rdhOP5/rH+p6X/aS3
         KDC391RyYGAX4RUHpISSgZZ/iJBZBUq1fgu7XDtUJ1+2x/D0f7eouvNn2VfKQXxEN91Z
         OK9nJEkGyiI6vFM/CX/0jPMoCOiJLEigQd5txZHgXGmdkdnpCrT+gDAfXGbeHU5y6qlS
         1WpLlAow7zdsreuvL61k4GH+asLFMfP3t7qqvIEtx2mD6VSoXd9JVCPL7ptGr+vkgmKS
         iZZg==
X-Forwarded-Encrypted: i=1; AJvYcCUBfeK1fZiaf2BJi3S/FZ6RVODkfw5vFeD+U7+yDUSpGIUMT2UPwDZCkexBoNdVltF1WszG0yeH8iyRaF7O@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8cfhJ+voDCNkboAKgWK1bPEgxFfyXfkVaSN6e7he0+JQ8tqiV
	9JUR4pSjFPhR2PVPz1ZvN01tiWaad2smkd1G/yGM4fi9tsA6Tx+C5mlnatevwiSYN5tFmme8EkN
	jsCuUhLJ4dc4Q4PVmTF9znaHKVAIE/rQrP+UG1g==
X-Google-Smtp-Source: AGHT+IEJycb4R4aw3ReSCNgChwzrEXysCheiplWAjzc1sd3W64fhBUYqqbDLQsAk4nGd84s5GZgRtnV6rDxt3bUR/NM=
X-Received: by 2002:a05:690c:101:b0:6b1:735c:a2fc with SMTP id
 00721157ae682-6e2c72466ccmr69109727b3.27.1728226866169; Sun, 06 Oct 2024
 08:01:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241004103046.22209-1-quic_mukhopad@quicinc.com>
In-Reply-To: <20241004103046.22209-1-quic_mukhopad@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 6 Oct 2024 17:00:55 +0200
Message-ID: <CAA8EJprNz-Byy6T3qkkUyZnTkyb_7osyuevP8E-xYzzPSmQjUw@mail.gmail.com>
Subject: Re: [PATCH v4 0/5] Add support for DisplayPort on SA8775P platform
To: Soutrik Mukhopadhyay <quic_mukhopad@quicinc.com>
Cc: vkoul@kernel.org, kishon@kernel.org, konradybcio@kernel.org, 
	andersson@kernel.org, simona@ffwll.ch, abel.vesa@linaro.org, 
	robdclark@gmail.com, quic_abhinavk@quicinc.com, sean@poorly.run, 
	marijn.suijten@somainline.org, airlied@gmail.com, daniel@ffwll.ch, 
	maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	quic_khsieh@quicinc.com, konrad.dybcio@linaro.org, quic_parellan@quicinc.com, 
	quic_bjorande@quicinc.com, linux-arm-msm@vger.kernel.org, 
	linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	devicetree@vger.kernel.org, quic_riteshk@quicinc.com, 
	quic_vproddut@quicinc.com
Content-Type: text/plain; charset="UTF-8"

On Fri, 4 Oct 2024 at 12:30, Soutrik Mukhopadhyay
<quic_mukhopad@quicinc.com> wrote:
>
> This series adds support for the DisplayPort controller
> and eDP PHY v5 found on the Qualcomm SA8775P platform.
>
> ---
> v2: Fixed review comments from Dmitry and Bjorn
>         - Made aux_cfg array as const.
>         - Reused edp_swing_hbr_rbr and edp_swing_hbr2_hbr3 for v5.
>
> v3: Fixed review comments from Dmitry, Konrad and Bjorn
>         - Used a for loop to write the dp_phy_aux_cfg registers.
>         - Pre-defined the aux_cfg size to prevent any magic numbers.
>         - Added all the necessary DPTX controllers for this platform.
>
> v4: Fixed review comments from Dmitry and Krzysztof
>         - Updated commit message.

For which patches? How?

>
> ---
>
> Soutrik Mukhopadhyay (5):
>   dt-bindings: phy: Add eDP PHY compatible for sa8775p
>   phy: qcom: edp: Introduce aux_cfg array for version specific aux
>     settings
>   phy: qcom: edp: Add support for eDP PHY on SA8775P
>   dt-bindings: display: msm: dp-controller: document SA8775P compatible
>   drm/msm/dp: Add DisplayPort controller for SA8775P
>
>  .../bindings/display/msm/dp-controller.yaml   |  1 +
>  .../devicetree/bindings/phy/qcom,edp-phy.yaml |  1 +
>  drivers/gpu/drm/msm/dp/dp_display.c           |  9 +++
>  drivers/phy/qualcomm/phy-qcom-edp.c           | 74 +++++++++++++------
>  4 files changed, 61 insertions(+), 24 deletions(-)
>
> --
> 2.17.1
>


-- 
With best wishes
Dmitry

