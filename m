Return-Path: <linux-arm-msm+bounces-37776-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 363709C6EBE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Nov 2024 13:11:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E0AF31F276AC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Nov 2024 12:11:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1564201108;
	Wed, 13 Nov 2024 12:08:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tQ5B9VbY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F8F72010FC
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 Nov 2024 12:08:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731499687; cv=none; b=AXmbPOiZjG0QtV3JbXXVZG/qKHXNyDtgb7WtkNZPDp5Co2pzbKvnaZP5jdqbWLfkyLf+XH9Xc0g3egArM9sTpU3KvFnaWOu3Ru+0ThBnTXaXzKJjep+YvX40gavVLljgopvhOf2NAGm7yEMMktAl9W0I8eSgyBNpFBANKLSwlX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731499687; c=relaxed/simple;
	bh=+SQAYrBZEZritmGVvyh7dsWuqy5crTgzuGtLDSf+ZQE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=u5doaS/bGg3d0N/h1PM7w23f57W6lmVX3D0aRtsd+gYERZevYf6Lq4iE/havO6EaDan00DQDlOdADld7YjTdg4CLDPZ1Ash+ORMkB7SwnSCe4aBJem5RMvS4B/UpZGmgVxtiaquvlBoQzVrRfuTgpHNXMOOCaRQO6wSCtW+noaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tQ5B9VbY; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-6e377e4aea3so54568547b3.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Nov 2024 04:08:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731499685; x=1732104485; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=UGtyXwzMBHOXtnkZD1IDl7RIyBTD4iUeJ455sdaUv4M=;
        b=tQ5B9VbYSy/+lKDTj6hJcjXRFxw1V5Vx6+c9555+2gHN7KaobXWkXJZy5MCXustSo0
         p43uOasU2nFAufh9uQ+PY5MaGQLgaXnD4SvRhKBbjs5RviEeSGrctV6VQRIEADlyLVaY
         PIzg6Per8l1UKet1x9AKvWHQwMI/R6UKTBKFOMbMoN5ojvFVfMI7XZFlBL5whOoSIsv6
         ufXBIu2ptJ/MDp/X1srzfDfnlXW+yoMvj0H/FBRNjHvlfUsbgcBP+jbhYcvTd1POmiIT
         kqCbE4jW/LqfPQ8qia1jEBLS6FMqqDgsooVDic5kCrvAFB8LZ7Cw5mC1EepC6PVfFsG1
         NAXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731499685; x=1732104485;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UGtyXwzMBHOXtnkZD1IDl7RIyBTD4iUeJ455sdaUv4M=;
        b=cg1vrNXgQU1zuo4OIGx8dwwy48AKDGad42EsLbUem5CBLchaSGpYfEGz4CmzsD5YON
         YzKX0UKmgJbEdKyLhuByp2izP1S7iMyI/OGHXqko9cjOmXPbRGlrsZfJ0lYgHlk5fOy6
         vwxoGe3mQqqCgfPMva1DdEZt3TjRDeGerMefx8VI2q8T8wBa6iHH7xRnobvURHqSstdM
         T47o2p+EhPL0H4vM6h0nr4WRgo5Vpal9ol9UYkvofKvn6YHEjIkrejoLiFoQTu1zEe41
         OnVWTBI2bodvuxIcuuimtGddn9TVmEsNrn655aQGHtn2I9tAbGQar7rYYWo/cK27JzH5
         b7zQ==
X-Forwarded-Encrypted: i=1; AJvYcCUslvFk3mhbZcTgUV1oCMOfEnyzUAFbmA1chZh/8Fm+w5DIKPMDxXgysyNpkppKGkknSVfTfY+lFl4CXKeg@vger.kernel.org
X-Gm-Message-State: AOJu0YyCTeE0yO0ML8/cYdF6r6y3jwauX5bLWXZPTvGl7x9aFMK6g5pZ
	mxwNqp9eInwLio2vUf6bStYEN6uwkzlFn9gZgG76I1Acd+ORAp70hML7iVUwq4QKu1gDaxoBEaU
	LN08QGxSEPUZAM23fn8sEMd3jEJMUEKo7tKkaNw==
X-Google-Smtp-Source: AGHT+IGfdj17ZRR0vuBfO1QBwX6EXMq129/94BCmEcrTpxI9KLT5gLVvRTesocXnNuXdBrs2dgVgRPYFjcVuJRn6J6s=
X-Received: by 2002:a05:690c:7485:b0:6e2:2c72:3aaf with SMTP id
 00721157ae682-6eaddf81805mr207193107b3.31.1731499684980; Wed, 13 Nov 2024
 04:08:04 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241113-add-display-support-for-qcs615-platform-v2-0-2873eb6fb869@quicinc.com>
 <20241113-add-display-support-for-qcs615-platform-v2-1-2873eb6fb869@quicinc.com>
In-Reply-To: <20241113-add-display-support-for-qcs615-platform-v2-1-2873eb6fb869@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 13 Nov 2024 14:07:53 +0200
Message-ID: <CAA8EJpqQA3zDBRpm9FY5X-vS0aDgoGNFfDoTh9p1A2MqVa7KNQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/9] dt-bindings: display/msm: Add QCS615 DSI phy
To: Fange Zhang <quic_fangez@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Krishna Manikandan <quic_mkrishn@quicinc.com>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Li Liu <quic_lliu6@quicinc.com>, 
	Xiangxu Yin <quic_xiangxuy@quicinc.com>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 13 Nov 2024 at 13:53, Fange Zhang <quic_fangez@quicinc.com> wrote:
>
> From: Li Liu <quic_lliu6@quicinc.com>
>
> QCS615 platform uses the 14nm DSI PHY driver.
>
> Signed-off-by: Li Liu <quic_lliu6@quicinc.com>
> Signed-off-by: Fange Zhang <quic_fangez@quicinc.com>
> ---
>  Documentation/devicetree/bindings/display/msm/dsi-phy-14nm.yaml | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/display/msm/dsi-phy-14nm.yaml b/Documentation/devicetree/bindings/display/msm/dsi-phy-14nm.yaml
> index 52bbe132e6dae57246200757767edcd1c8ec2d77..babd73cdc44f6d12fdc59c6bef27c544d91f1afa 100644
> --- a/Documentation/devicetree/bindings/display/msm/dsi-phy-14nm.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/dsi-phy-14nm.yaml
> @@ -17,6 +17,7 @@ properties:
>      enum:
>        - qcom,dsi-phy-14nm
>        - qcom,dsi-phy-14nm-2290
> +      - qcom,dsi-phy-14nm-615

As stated in the comment to v1, no, this is not acceptable.


>        - qcom,dsi-phy-14nm-660
>        - qcom,dsi-phy-14nm-8953
>        - qcom,sm6125-dsi-phy-14nm
>
> --
> 2.34.1
>


--
With best wishes
Dmitry

