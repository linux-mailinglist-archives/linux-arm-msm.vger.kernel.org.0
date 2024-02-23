Return-Path: <linux-arm-msm+bounces-12423-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D165A861EE9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Feb 2024 22:24:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6089328BC6B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Feb 2024 21:24:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7642149387;
	Fri, 23 Feb 2024 21:24:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hv4K9X47"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04CF61493A0
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Feb 2024 21:24:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708723473; cv=none; b=KIm9KDCKCw+M4gn+eQQFavhG7ymhe4AR29tNEH7lXLWSSxmlbvionMvHsCoExpzHOYBpnSU9GAnwmS+At0T4/VR4AqmlH5miH2wM/8KHTfix3Tii9oF+IfB0nxDe6AicgWLpidGPWqYoCdaB317+29Hh0Lzmy1sFuG807j42yyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708723473; c=relaxed/simple;
	bh=H/tJhqv8w47L674SEcvyX50L+C3QiQZtQ8jkIBC/B54=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TXU8AkOhMkrZXLGQJiptbSz0H7HpSSnw7zzGkpKxEtBDlbS3Yt9J3PofgZElHZdKH2qT+u7num1vvB9Brngtne623ylMZ+J99fvfkKx6SczsxLWZQD3OVcQBsSYnNuakBIjNgS1On/0YT/g/YhgayygXeIDcXcYKLGQqFB06bAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hv4K9X47; arc=none smtp.client-ip=209.85.219.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-dcc84ae94c1so1264298276.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Feb 2024 13:24:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708723471; x=1709328271; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=akuPkkgI0y/oHinOKr0HxoZmwUf171P0m6vGM5/O5Js=;
        b=hv4K9X47aldLnHaFXYeYX2ZhiYjXGK1bQUZFnv8mm+NWj72tgPiNw7CJllytkU3wSj
         17U9T+RadYGszAvbjVFGZbrHC+I6a3IUsk8RD+JXljHi8gv7abpXm8SoD+i3MofH9Wdc
         Zt51DLzfpXIR0tU/AWRMUeRqJfCXkNH56TtM4Cd1myobOEBqG73he4W1UPR1YtwSFgq4
         UrPdkJB4qLOlc/1RK/u8cte1x92bj7K7cX7WTovIvXSV3sh0zCId/aVaIOXEL7cQl95w
         mRfIA2n2ZXJXDfVCo79FcCjMm9giiequxNZGsmn2DeOHfHdjFTynQYs4zZ2D4rQdppe/
         akig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708723471; x=1709328271;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=akuPkkgI0y/oHinOKr0HxoZmwUf171P0m6vGM5/O5Js=;
        b=N3iM9WxNd9WQEsoagU8ph+JizSkZpwd2axKgT7zS/x1c3tVxLmzsU3XPrHD54YfD3/
         b8cgsdU3auPSX6RA0a75SgMTa9gM7TFL/Yz9HQKjb1BSl1PZXd+/xt8yk6ln11+EQh7e
         xhILdfX239n6gtzB0pKoDETuYd8ZAyG2OLB8PhwHGDs0mKbcRseiIyuVlwm4+vDtNsQd
         wPYZRdUIEtpZO1UTeF8zeER/EiZyqqDnKpx59RWj7P1kgSfluwWLwsfVwaqPimfT2I4X
         x0z9FhL9fRjF46hidBO0Rr+GZgS1IRApGkdO1pmqwkJXep30M7MjPZ69V+VxK1drRjS4
         8t5g==
X-Forwarded-Encrypted: i=1; AJvYcCVhQHzS8itdOsX56pxQS1EfUymOGD4+12DpLjlErNLn0ZLVOnvJBvUwiSJYp11xngzBv86n1R4hcJoVsqREOfsFxBn/caoExburQrTHKw==
X-Gm-Message-State: AOJu0YzX1PB4fmzxc4LvQ/SJdh+rihIR0YmEQHZU44Jb2kD62210adNl
	aykx1Xlao5zP84zLHFWTqiTyJt9wUdFeI36Yjb8ys44ZBKgsTBvcQPedJIFnolWykr6zSlKqMIB
	xlgbZ7JhinatWugxkaE19UDo7gl1CkXZH+BesJQ==
X-Google-Smtp-Source: AGHT+IFbG9R3qzPDyULutJwOdT2KkYVwoLnuTNnZQAQUOT10IOJuFq9jx8p8pvPNgR7Ok5iVzV0j+sTC9nwDRCxlZ88=
X-Received: by 2002:a25:c511:0:b0:db9:9537:2c39 with SMTP id
 v17-20020a25c511000000b00db995372c39mr1121626ybe.2.1708723471023; Fri, 23 Feb
 2024 13:24:31 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240219-topic-rb1_gpu-v2-0-2d3d6a0db040@linaro.org> <20240219-topic-rb1_gpu-v2-2-2d3d6a0db040@linaro.org>
In-Reply-To: <20240219-topic-rb1_gpu-v2-2-2d3d6a0db040@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 23 Feb 2024 23:24:19 +0200
Message-ID: <CAA8EJprR=tPUsFit7DEzh0U9TDOm8TY29m=JVJwXQwH6vEN49A@mail.gmail.com>
Subject: Re: [PATCH v2 2/7] clk: qcom: clk-alpha-pll: Add HUAYRA_2290 support
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
	Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Marijn Suijten <marijn.suijten@somainline.org>, linux-arm-kernel@lists.infradead.org, 
	iommu@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Konrad Dybcio <konradybcio@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 23 Feb 2024 at 23:21, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>
> Commit 134b55b7e19f ("clk: qcom: support Huayra type Alpha PLL")
> introduced an entry to the alpha offsets array, but diving into QCM2290
> downstream and some documentation, it turned out that the name Huayra
> apparently has been used quite liberally across many chips, even with
> noticeably different hardware.
>
> Introduce another set of offsets and a new configure function for the
> Huayra PLL found on QCM2290. This is required e.g. for the consumers
> of GPUCC_PLL0 to properly start.
>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>  drivers/clk/qcom/clk-alpha-pll.c | 47 ++++++++++++++++++++++++++++++++++++++++
>  drivers/clk/qcom/clk-alpha-pll.h |  3 +++
>  2 files changed, 50 insertions(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

