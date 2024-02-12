Return-Path: <linux-arm-msm+bounces-10652-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 28343851579
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Feb 2024 14:40:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D858928475D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Feb 2024 13:40:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 175373A8DB;
	Mon, 12 Feb 2024 13:32:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="T4l71HbN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6761B3A8CD
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Feb 2024 13:32:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707744746; cv=none; b=sxfirVIDSpcAaZqMu4gJjhrAJVPKcQMFBsw0V1k9le9qtYLmGMS5JnvgA2jZjNydOlaLlRCfJlJ4squi6HGk2KxGqDhO42S8qKNIyaqDP/dCpb/x24KHWIjLJslckrxg3IwZQ88rk3YKhbd4vC87ICVLKMXY3kU4GdxrhCojZq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707744746; c=relaxed/simple;
	bh=mgxzYa/YHbjlNLGRFv1voK9063RzidnEcbp86ft+y0k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IsQ4+CvgRU3r+FYE0mH2fNEK5VYihXpa2AAboliEIzVox2wF8xzDWXmYFjLtykdFhOfoKf1xCXC8P+6I9YEx4eGCuV2kYjsqmTvtNpuwWlax2R8s26HrH3BsFK03MgW2Mv0/2nX0eYhoPPDo/A7u8m3xep1znHNOQ//zfAKHr/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=T4l71HbN; arc=none smtp.client-ip=209.85.219.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-dc75c2c3574so1983408276.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Feb 2024 05:32:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707744743; x=1708349543; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Cc0i1kM3GFsjytyQWwKzSBYGY5dJXRRO6XelaSiPAvw=;
        b=T4l71HbNmFjDN2/4WvdZxq4kgbZwo4w+Cuc3IKTCeO3YLIyWUuu06kxJ5NiliG3OyW
         LV8tiJ3bSDBOd9OI/nOSvtHQ8X/ONBjzjK0EC2LCykC7PJ+3MFb95eHnAOVZNXqK9CIK
         24kz7M//GshXB+z8HP3djVlvcZRdkBZe9jGhyfeB+beZs5g51cCB9La4tYErhkYiV24E
         6JJfO/ZB2MbJ4jGc84Ak5TX01za5vSOl7oSBcONS7JayNooxi+QhlM+Pp4WW6gU1597f
         dyRsOScOfKmcaSPhl2tIlO+DMuJnBH9xpj1iZdB3X3CgpTVt4hJBUzUvYVe2MCDtxbSF
         r/3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707744743; x=1708349543;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Cc0i1kM3GFsjytyQWwKzSBYGY5dJXRRO6XelaSiPAvw=;
        b=iiptcdu+ddZLgokEh4M8ZvjJkPinXGRibaB7Qp35y042Uug4zPhtW75DiEirKNLqWL
         NCPeZw146JeijRDZmEx/a2qxiGIONS9ES1z7N/88LCRcjV5k1DrdPkr4+m7FEyKeYugf
         nVmDprRUGalQrwOIgEaAu7oQkBi+vtf5N0mkTNEivpOv3M47tsRbMSxE4ycS9Rdf+V3I
         AK+lGvM1C30zYKEmBQlxf4iknwT/PZ/vj9SVLrNbGbmq3EGAvXDG5IMvcAMHm9Wtr2Sz
         Qpkel2Uov9PVHMbGQa4nlmF7QZkXAXb6Iegix3Tfny76TrX1PSutV9xXSAuyZ4DeLjUy
         r5ww==
X-Forwarded-Encrypted: i=1; AJvYcCVEJx3celftqf+gVXNQpmRobivS/6CD/nhPuWP+YkbkBPT0mWBkUjbyDP1Jg505JR7PawqxNLp0oW88D+Oyoo+pnFS1+rtLTDZCJSDQRg==
X-Gm-Message-State: AOJu0YyL1Y5zn4ZF5XqTLBqPZix3DU67EYF/rl4Q6498EP4mufP6SLHV
	g1Ljk7IMdKQOouRcimISdSi7bCe2fmTKkUJUVdOT6YiAPPq4h7i+fyTnks3C5ldJrKAA1y8VrVp
	eF5RF329IlzVdvlnUVmhRiSUMJHvl1eEbwkSUHg==
X-Google-Smtp-Source: AGHT+IHrimlujObx0gy/3DfQFabszO/ewn4clRRIqfcAPZot0WCgYdNU8XudKJCEXiqOZqbCse/xPRfzJJEpg6oz5Yc=
X-Received: by 2002:a25:b117:0:b0:dc7:4439:d14d with SMTP id
 g23-20020a25b117000000b00dc74439d14dmr5093350ybj.54.1707744743273; Mon, 12
 Feb 2024 05:32:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240212-topic-sm8650-gpu-v1-0-708a40b747b5@linaro.org> <20240212-topic-sm8650-gpu-v1-5-708a40b747b5@linaro.org>
In-Reply-To: <20240212-topic-sm8650-gpu-v1-5-708a40b747b5@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 12 Feb 2024 15:32:12 +0200
Message-ID: <CAA8EJpryCXUxs69ockt0TN4LOuBB-4dZkLYHUZyN1Uq0isMjYg@mail.gmail.com>
Subject: Re: [PATCH 5/5] arm64: dts: qcom: sm8650-qrd: enable GPU
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	iommu@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Mon, 12 Feb 2024 at 12:37, Neil Armstrong <neil.armstrong@linaro.org> wrote:
>
> Add path of the GPU firmware for the SM8650-QRD board
>
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sm8650-qrd.dts | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/sm8650-qrd.dts b/arch/arm64/boot/dts/qcom/sm8650-qrd.dts
> index 8515498553bf..7151f3dc67c4 100644
> --- a/arch/arm64/boot/dts/qcom/sm8650-qrd.dts
> +++ b/arch/arm64/boot/dts/qcom/sm8650-qrd.dts
> @@ -525,6 +525,14 @@ &ipa {
>         status = "okay";
>  };
>
> +&gpu {
> +       status = "okay";
> +
> +       zap-shader {
> +               firmware-name = "qcom/sm8650/gen70900_zap.mbn";

But why? For sm8450 / sm8550 we had "a730_zap.mbn" and "a740_zap.mbn"

> +       };
> +};
> +
>  &mdss {
>         status = "okay";
>  };
>
> --
> 2.34.1
>


-- 
With best wishes
Dmitry

