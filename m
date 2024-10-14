Return-Path: <linux-arm-msm+bounces-34307-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D00E299C73F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Oct 2024 12:37:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 948A928357B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Oct 2024 10:37:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23246170A2E;
	Mon, 14 Oct 2024 10:37:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dbjblQvk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40C1A158DD8
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Oct 2024 10:36:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728902220; cv=none; b=FlaF5fuV5Pf7PbZCGECAnkqoN7O3N46NMK2Gwy5DhF3o8dhbZi+Hy7N82YgdBT4zEUoH/Xh9d1jBPEAH+56whyoMcjCqo0koV7NMM0mBWApsKKaA3a24Qgb57QO4id9nHLgDZr3iTLjnREvYQVWj/eVISwYT71LfRyqMoRIz4oE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728902220; c=relaxed/simple;
	bh=h0xJVz9ARru4eQOiQXF/MNcNgt3ONDo6lIJslVEmTc4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R801bXL0gqfOeUP9G9WKBiJrXJXGyXQyrGk/g66SjxXQc3xsotA+Qe1VV9eCypwgo+nAYu1VeLMUjaBJJBeY3MZ0R3XtRvZSU6bspK7Gh7IDaVpRs8kqObXAsHNMYtl1Zcmz2voumCQL23HxVIglm8v7Rrdrpxkw6bv0YFAOsDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dbjblQvk; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-539f1292a9bso1130887e87.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Oct 2024 03:36:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728902216; x=1729507016; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Rs8pkA3PYoky3jNDJrBswrVklcdKSbgPfQeNXKvrhSs=;
        b=dbjblQvk51pdZWCor+AK49XX/ZBRE4CS9s3xiD7aqvUT4IWmHSeJ93tC6TSe0mm44d
         0K0xQ5bzgxtHJflKkTjNBa1w+Kws4gwgzA9DKPWP1xd+qsMnBIHirOfaKTGIiwoxbpzv
         5jykQRffS0vPhvaUnlrpc7tQVdfUYfKPrm5FyMvEgBBgCduX13X1LuR2PjHv7sRaBNau
         novgfnZfaa8HIq4jSt01T/hYRGDzwcGMeiA6UeUnuJN4qVDZOUU+QkxgMxyjZy7Ei8P0
         igTrpS9noSg+lv8NSEmuebKjxec4y+KaaMJ3qcEDJ0CCYPMrOjK6/BsokXkwQHpslxIE
         miRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728902216; x=1729507016;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rs8pkA3PYoky3jNDJrBswrVklcdKSbgPfQeNXKvrhSs=;
        b=KB3Fph5kCE4UVLdRIxppcVQk5CG+/WBlJnxP+S70ur+/NVZZT47ye2yWm1vJ+sHNrD
         VYzmvG6PnnKjgdvxYBDUl4jxPXlxn2UfUJObHSq7lPftYfJZN+7hVP35Hmd8tyDhYf4O
         eZjb0lyqzFvO7DuSK1A6IP7QG2m4jF7FeSHXG8fQVB7RtewhVuU51DYFwBNgXqjlvJMH
         0tVDHdN75RzI67mAogRGuKgwjShStLfW9ZS2smS9eoFl/09XrD99+hFiUanib+cbJCpI
         IRncnnuM5NGd7ZtXAJD05sSDVSpTz3gLUdovpBXZ5Q8XoWcUMpHKEVL31hd6ly0iVH+q
         zTzQ==
X-Forwarded-Encrypted: i=1; AJvYcCUFLn7O/fCbey/c9GiRZpxUd3n5mLUQ55GtupxjQql+aXJASeCppw0w8iJ1caRtZHgRCdeXoJBJ2kWg3eU3@vger.kernel.org
X-Gm-Message-State: AOJu0YwBlr7Og59az0NriH3JgD6z/HrxqKaQQ3qIG3XWlz5J9l3JxK41
	Slpg/jNUKgGhNXmvqSvdZK/yehoK506b7aevQD0WM37bU3Bsu1dJztPJUaLeHIw=
X-Google-Smtp-Source: AGHT+IHa88s8OntCl9bRuE3CzkBoVszokQ9EJQXqb/frUK9cikWwdSYdtz9ofWdSANEvI2FMaJ7PAQ==
X-Received: by 2002:a05:6512:3408:b0:535:6992:f2c3 with SMTP id 2adb3069b0e04-539da5479b9mr5075112e87.41.1728902216425;
        Mon, 14 Oct 2024 03:36:56 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-539ccfd92f6sm1558224e87.59.2024.10.14.03.36.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Oct 2024 03:36:55 -0700 (PDT)
Date: Mon, 14 Oct 2024 13:36:52 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: quic_fangez@quicinc.com
Cc: kernel@quicinc.com, quic_lliu6@quicinc.com, quic_xiangxuy@quicinc.com, 
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 0/6] add_display_support_for_QCS615
Message-ID: <rodjkasqm3orhszu7pp5eimhwgoyda76c6k3a25xkq6vtnkxag@v7dhv6ghhbqg>
References: <20241014-add_display_support_for_qcs615-v1-0-4efa191dbdd4@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241014-add_display_support_for_qcs615-v1-0-4efa191dbdd4@quicinc.com>

On Mon, Oct 14, 2024 at 05:47:26PM +0800, fangez via B4 Relay wrote:
> Signed-off-by: fangez <quic_fangez@quicinc.com>

You didn't copy any of corresponding maintainers or mailing lists, so
most likely your patches will be ignored. Please use b4 tool for
preparing and sending patches.

> ---
> lliu6 (6):
>       arm64: defconfig: Enable SX150X
>       arm64: dts: qcom: qcs615: Add display mdss and dsi configuration
>       drm/msm/dpu: Add QCS615 support
>       dt-bindings: display/msm: Add QCS615 DSI phy
>       dt-bindings: display/msm: Add QCS615 MDSS & DPU
>       dt-bindings: display/msm: dsi-controller-main: Document QCS615
> 
>  .../bindings/display/msm/dsi-controller-main.yaml  |   1 +
>  .../bindings/display/msm/dsi-phy-14nm.yaml         |   1 +
>  .../bindings/display/msm/qcom,qcs615-dpu.yaml      | 117 +++++++++
>  .../bindings/display/msm/qcom,qcs615-mdss.yaml     | 278 +++++++++++++++++++++
>  arch/arm64/boot/dts/qcom/qcs615-ride.dts           | 101 ++++++++
>  arch/arm64/boot/dts/qcom/qcs615.dtsi               | 195 +++++++++++++++
>  arch/arm64/configs/defconfig                       |   1 +
>  .../gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_qcs615.h | 268 ++++++++++++++++++++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |   1 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |   1 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |   1 +
>  drivers/gpu/drm/msm/dsi/dsi_cfg.c                  |  17 ++
>  drivers/gpu/drm/msm/dsi/dsi_cfg.h                  |   1 +
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy.c              |   2 +
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy.h              |   1 +
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c         |  21 ++
>  drivers/gpu/drm/msm/msm_mdss.c                     |   7 +
>  17 files changed, 1014 insertions(+)
> ---
> base-commit: 77dca4e0530173cb10896cc113f14e6403f0a31a
> change-id: 20241014-add_display_support_for_qcs615-b17bc0d4118e
> 
> Best regards,
> -- 
> fangez <quic_fangez@quicinc.com>
> 
> 

-- 
With best wishes
Dmitry

