Return-Path: <linux-arm-msm+bounces-34312-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E20C99C771
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Oct 2024 12:48:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C1AEDB265C7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Oct 2024 10:48:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA012158DC4;
	Mon, 14 Oct 2024 10:48:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sxAVaOfT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E228F156C52
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Oct 2024 10:48:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728902898; cv=none; b=aP9WxUZId5hmF3Jwr96pc1kiP0J++vaaOow7L5urkSNo69XbpnjH6T6v2qUMOJqZZu0eynJHuaIwHlre4/ySxX4B9VxaFnr+3MlVPdSXw0XQCqGelsJoW53MABTCm6t9etBugQPyWnHiKGzoWypPJSs81+98/wH5I7HjBNA+tSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728902898; c=relaxed/simple;
	bh=nbe8spZUdPu4SwsBXhHcJhwkYLWbzuzEx+kUD8J4ipM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n3u/5o9GuEaW9oA2qGGBqoHJmbpkl/07y3Amy7cGlLiT52+YhEAwhO8DBJ3hSoUkLG3aLTCp3Th5IgGn8MQBnFO3TyTDlp9ImBn1XsEqWkkEcKzzoGKnIKI1cUAk4kJI7jIAbrXX6b1Eccx+x9ptVYZaaKgi2e/h7HmcciY4IQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sxAVaOfT; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2fb4ec17f5cso6753091fa.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Oct 2024 03:48:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728902895; x=1729507695; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BtECzJ7j9MHziPXsbZWyhqMgPZ3aDGDGEvL3ndDGzQk=;
        b=sxAVaOfTk4zKo7UYmzZ/G98YcDL3CMfkhcND3tvwwNLijm2TkrMDaKSSTACC8LmRqe
         ukXIjyusuNLUYihKy5yCQsvMI+Qr+W3rO4qt4fEbOIt26FQGSkhgM8DcYQY5ceNBIU4H
         jPnHOsbirf/91GeRpg7BwfuSqtJj4+yiiMvMPXrk+AcMpzEzMj4E0yznk0PNWqC4ROzT
         Z0gD57qXC9t78E/GEXYR/s0X0ahSeVYAo0vgRnww4YzNiorVB4cWhKP+drZIdTLNBZKo
         820owKFjITzFnf4+xpcapKdCx8zTdFkqpH51J+SP9YeH+zUEH46PfcB4CTfR8rlc6doI
         hCEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728902895; x=1729507695;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BtECzJ7j9MHziPXsbZWyhqMgPZ3aDGDGEvL3ndDGzQk=;
        b=mcpXkv/7SFewmGh+o9GThQh2WAjiYjXKGEuENqN8pLRDgBn2tF+L+M6SatjfPv8vws
         8FZmDvOvNIh7DiFtT1IUOhr4LBpZqYfwpR9MPxYMmSVLMH3SHobr2EmVH/AAdi0mDoqr
         z2s6TXDlWxM9vpRhXCOgztv+cCmHVSv8WR1H7oGHwKAuY7ojsFde0jCPEos05i5/x5Bv
         ZMNUBerNHtUlOD65eQHVdaPojEBwMsdaOuSzEEnW3gZs8fUXGxJ0ivb5Ahb3jqyoiDXq
         +bZNh8Oi5kQYoXHeBfYQb75TAnkO6uB8CFFvroVBaNzZjvSh12Ze7PnXCsR/xEYwYHlD
         +a8A==
X-Forwarded-Encrypted: i=1; AJvYcCXCWqlbTKASt7oq9DJGsRmLcFALqJVs1GSNSBeSsHvloH8jYy50DgEhN3mfx42J/Nv5tARgl+ZOwrjhHQCK@vger.kernel.org
X-Gm-Message-State: AOJu0Ywf87FzesTwm96254NnZj/NUfvy6LyMZVCHDCH9CdDlZsRcjUK4
	rGytKYI39UT5LnWhERNwtQ8PPqqQIxxRXylJOMhYoZnbsUXad1lsB6pWH512Nq0=
X-Google-Smtp-Source: AGHT+IFdbXOdwtk+IqiiarJC9HmLsdoDlTfGZVTqmPT3NX57i+uowknA1oy7AXcy3BO8JlhGkclgUQ==
X-Received: by 2002:a05:651c:211b:b0:2fb:5786:251f with SMTP id 38308e7fff4ca-2fb57862748mr6417681fa.37.1728902894959;
        Mon, 14 Oct 2024 03:48:14 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2fb471aaf46sm6071561fa.72.2024.10.14.03.48.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Oct 2024 03:48:13 -0700 (PDT)
Date: Mon, 14 Oct 2024 13:48:11 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: quic_fangez@quicinc.com
Cc: kernel@quicinc.com, quic_lliu6@quicinc.com, quic_xiangxuy@quicinc.com, 
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 0/6] add_display_support_for_QCS615
Message-ID: <c56kabp3xe5gcvmz23xqvd66dsfgo3gkm3xrideq4mhutm55rt@tqqv4gbzuwet>
References: <20241014-add_display_support_for_qcs615-v1-0-4efa191dbdd4@quicinc.com>
 <rodjkasqm3orhszu7pp5eimhwgoyda76c6k3a25xkq6vtnkxag@v7dhv6ghhbqg>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <rodjkasqm3orhszu7pp5eimhwgoyda76c6k3a25xkq6vtnkxag@v7dhv6ghhbqg>

On Mon, Oct 14, 2024 at 01:36:52PM +0300, Dmitry Baryshkov wrote:
> On Mon, Oct 14, 2024 at 05:47:26PM +0800, fangez via B4 Relay wrote:
> > Signed-off-by: fangez <quic_fangez@quicinc.com>
> 
> You didn't copy any of corresponding maintainers or mailing lists, so
> most likely your patches will be ignored. Please use b4 tool for
> preparing and sending patches.
> 

Ok, you are using b4, excuse me. Then it makes me wonder, how and why
you ignored all B4 recommendations and pleads to get required To/Cc
lists.

> > ---
> > lliu6 (6):
> >       arm64: defconfig: Enable SX150X
> >       arm64: dts: qcom: qcs615: Add display mdss and dsi configuration
> >       drm/msm/dpu: Add QCS615 support
> >       dt-bindings: display/msm: Add QCS615 DSI phy
> >       dt-bindings: display/msm: Add QCS615 MDSS & DPU
> >       dt-bindings: display/msm: dsi-controller-main: Document QCS615
> > 
> >  .../bindings/display/msm/dsi-controller-main.yaml  |   1 +
> >  .../bindings/display/msm/dsi-phy-14nm.yaml         |   1 +
> >  .../bindings/display/msm/qcom,qcs615-dpu.yaml      | 117 +++++++++
> >  .../bindings/display/msm/qcom,qcs615-mdss.yaml     | 278 +++++++++++++++++++++
> >  arch/arm64/boot/dts/qcom/qcs615-ride.dts           | 101 ++++++++
> >  arch/arm64/boot/dts/qcom/qcs615.dtsi               | 195 +++++++++++++++
> >  arch/arm64/configs/defconfig                       |   1 +
> >  .../gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_qcs615.h | 268 ++++++++++++++++++++
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |   1 +
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |   1 +
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |   1 +
> >  drivers/gpu/drm/msm/dsi/dsi_cfg.c                  |  17 ++
> >  drivers/gpu/drm/msm/dsi/dsi_cfg.h                  |   1 +
> >  drivers/gpu/drm/msm/dsi/phy/dsi_phy.c              |   2 +
> >  drivers/gpu/drm/msm/dsi/phy/dsi_phy.h              |   1 +
> >  drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c         |  21 ++
> >  drivers/gpu/drm/msm/msm_mdss.c                     |   7 +
> >  17 files changed, 1014 insertions(+)
> > ---
> > base-commit: 77dca4e0530173cb10896cc113f14e6403f0a31a
> > change-id: 20241014-add_display_support_for_qcs615-b17bc0d4118e
> > 
> > Best regards,
> > -- 
> > fangez <quic_fangez@quicinc.com>
> > 
> > 
> 
> -- 
> With best wishes
> Dmitry

-- 
With best wishes
Dmitry

