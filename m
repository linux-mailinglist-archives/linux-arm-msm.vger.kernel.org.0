Return-Path: <linux-arm-msm+bounces-11707-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C18B085A68D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Feb 2024 15:54:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5B6111F2195A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Feb 2024 14:54:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC17237705;
	Mon, 19 Feb 2024 14:54:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="u9BZQrte"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDB4437702
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Feb 2024 14:54:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708354487; cv=none; b=m5u6a6c/Gv6bSwMPjSVxv6s5f8xU8bBR5egbNdWkujqTJVqZIddes485A1FRivN5SI7fGdaRUjtXKEDZDdDv02Uir6bfvqHj6NXA9LVxWgNJyrAWqm9E7XFjou9PFD/20O2uSWhXjnGOIhcRsjv+xnTcZDx359OmBFPRDVs4zsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708354487; c=relaxed/simple;
	bh=rIE0IP0T9iSOPWSlThQHOn9NtZrcV1Ogn8zpUtpc8js=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DlWWkyE42sD1v/LrhHlSpXhCT9lTH73ZlIXSee35bgZDu8aQ3T7BrJdd9uRxLe3PvOWhMa1iVOpYB30BcTcGofWn7U0gbEvEVlMCx7QY6gx31t4tZIqm1sbqAjlK+V2vGbE3O1akedmNlxroIxgp40wkYn85oCKKGM+Rn/3x8vY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=u9BZQrte; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-603fd31f5c2so45475607b3.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Feb 2024 06:54:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708354484; x=1708959284; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/+Vf6X891RpEKNXrdBrteASyRB3a3/HliSNBQV8d1lo=;
        b=u9BZQrteEfrrR3r7IcyNbow5D73SHZ5BaLxnuMZdhkspfSLFm6DpB1kvbgYYabfLBD
         3Zi/MC5drv2x+vt1wBPCS3OI2yzd3axgnw5Y/PQsu6xsichkNyOYhfp1+Tdktzy8NL0a
         CrWVxzIaJwid4rXlhcWpNcR6CYU/8ptrtn2YWGZjHK9CP0xAjYXOkuEhhDNURI/LI3o8
         svEhklmqdIGDjm/DoUyzcJWyX2M4Qd8VPDePUJ23njm64YgFPQdRNtLmnXKibzXZ9R1d
         RV/6rdlN6ZlMyICoSqbEGgOFFWXxFgXQpiidlMGGCcq8OtSXXrg2bPKZMsIoKkoJgSuw
         Ocsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708354484; x=1708959284;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/+Vf6X891RpEKNXrdBrteASyRB3a3/HliSNBQV8d1lo=;
        b=cOtKyJ3FQeISljvli2d855t5LVK27F2qGA7ED25kTc+8+WbzMDHHmeHxxDF+CFuxG6
         3xVnnyy/5CDz9p8lXd57u4QNLwCuf4vcwCliFBu4oseV4wtFNbiSN0DFtVtFrwxHM2jO
         us1NMRkTKlv7kLg8K9A5lsLhuRQXKhAmgdWT0ThVs5FPpEMU1aC7ZPbNoV4UL2u2BQyQ
         8rdfkd4yV1nzlGCrsvQGrcQbIDgL9kA8TsMcMhDyXtmoy/RczVPzZR/7aKhCGzXGpMGF
         WJy75MfAauBDJMBu+sZZlNydJyr7UyOlwgXkGZV43gNAkOA0AgJSWa6ZeFx9O5P3SqJy
         +QLg==
X-Forwarded-Encrypted: i=1; AJvYcCXXIq8dGAEM7ZuF+W49gfCUbw3fNAC++sQ5Ix+wkeHirMVdhsG6FPueDiqe8nhnHzfpA4twREp3Sc5Y6YV9e4mDnmN3u+peaMGirBTCsw==
X-Gm-Message-State: AOJu0YwgSf6QbjXCgwkBvafEQQMTNLbdgZoiV82WKeAaaB/zAYjVtBHs
	qwhfCzuiMd1ai3Ig6smhYrJm5ML1FT7AhJ99765IBdXZbEehSCln65oNGiq2541TZCulstw6lon
	WBPy+PH1bARhemIaMO47xugukaUk0Ix4msVrtGQ==
X-Google-Smtp-Source: AGHT+IHg7XEOTTrtpgQqphtP3Xw9sPuPWwJbqow3gZN5qRELJzU++tbN2bRulnySBEDH7nL4PxT+8aS1knEIIJLBbCc=
X-Received: by 2002:a81:a185:0:b0:608:59a5:4ad1 with SMTP id
 y127-20020a81a185000000b0060859a54ad1mr39629ywg.22.1708354483969; Mon, 19 Feb
 2024 06:54:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240219-topic-rb1_gpu-v1-0-d260fa854707@linaro.org> <20240219-topic-rb1_gpu-v1-4-d260fa854707@linaro.org>
In-Reply-To: <20240219-topic-rb1_gpu-v1-4-d260fa854707@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 19 Feb 2024 16:54:33 +0200
Message-ID: <CAA8EJpq46Wn+gWKL81_zMxyddUpJRuKHDrx=4Q2DvbwufmWHWA@mail.gmail.com>
Subject: Re: [PATCH 4/8] clk: qcom: Add QCM2290 GPU clock controller driver
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

On Mon, 19 Feb 2024 at 15:36, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>
> Add a driver for the GPU clock controller block found on the QCM2290 SoC.
>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>  drivers/clk/qcom/Kconfig         |   9 +
>  drivers/clk/qcom/Makefile        |   1 +
>  drivers/clk/qcom/gpucc-qcm2290.c | 423 +++++++++++++++++++++++++++++++++++++++
>  3 files changed, 433 insertions(+)
>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

