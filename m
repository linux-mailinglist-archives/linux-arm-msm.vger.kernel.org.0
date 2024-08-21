Return-Path: <linux-arm-msm+bounces-29212-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B50395A16F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Aug 2024 17:35:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 757291C219B0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Aug 2024 15:35:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB16414C59B;
	Wed, 21 Aug 2024 15:35:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PXXsHuD8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com [209.85.161.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DF4E149C42
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Aug 2024 15:35:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724254522; cv=none; b=VcoLMnYXHBD3cUOpOkAgHXHyucSw8P7EBBagvMO1V1x0vNKRA166/gMEQtrcjz+NBxQvxucjrV5+ipPFvpy+O231NHCdA357gun2tXni/Yc5isjf/4PRVplqoNcZmVRQHGTUyFdt1HwCfkm97Z0qyGErAuaMZoBb7p92EZFvLO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724254522; c=relaxed/simple;
	bh=q0aRixnhWUWpxjM3Ck4bjrpb4pe7AI96MxRCxkxtVwA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PLoHee6cGeZZdJTeVXuz8w0jU8fTehl/lOVHXrXwLxfvWLyWBP4XcBb0swf/NucJJLQLYkfjM8gKrF+RS8+jrYiyGqJxDssQuN6SRuq8yaFzFSvjNFC0D/0x3D1TZ/7+3yE8/gt2ROPFKot2lg2194ZC16Ou9p11YEYv8lqqIwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PXXsHuD8; arc=none smtp.client-ip=209.85.161.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-5dcad91e64bso214427eaf.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Aug 2024 08:35:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724254520; x=1724859320; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=B92SIehQD/sLMBWjePhjq8cDV+wlqZQrnnvx6Bm71co=;
        b=PXXsHuD8muxBu9u7zISm/280RncJXoB7bBQbyDhwKHMlVmEuc/BCXqyh2l/i57uE/H
         fpA0qchv5IyhMZIan0fgEzcAZcB/cWP5FeWguolLSMb2v+S0C8all8ZwXhn7nMJ+24a8
         +q+KEW9xVxw8iw/rgxJWBU4jhIzCq6IqGfySZtxopgBw3lGHYb5Whvsab6tZFiBB9cd7
         t6IGpxGZy6VFgsRrvIvl4y71yJKjoKpvTyNgLZSwi/fkoylfhwmdYtyL2pk9QyjUKARH
         KrAbnMOYPY3YERhnibbFt+PRYgrdnD0rNyeyNIMvMKj4UkARHddu0WkZa4KrzRybg3K8
         zcrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724254520; x=1724859320;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B92SIehQD/sLMBWjePhjq8cDV+wlqZQrnnvx6Bm71co=;
        b=NNR8QTm8l6XzfF4bIKhm6M485pHphBJ7T2jw5g+dG113VNWcx0lyFawrrqedAnfStK
         qf0rqHDZvDcwOhkNX+/YNcI93FdNlJeLSpZk3fIu4xNatLW359yllUzFGaEnHFqgMgeW
         3PECShgU2hjZU/93bY8zL89WglSAyjPAfw/3DN0M3T2SQo0ZXze3xBEiDxrpaFdZEuAL
         MYnhGxxj+PelzWVog75hKdgMGwbRV1dBrVQ2HeenfWUILqrQ2memp2IY20bVjbmfIfiB
         XMQGgveKfuk4Yl+Qrx1LySjbxNOl/edrkpvwG1Mkd5FaI6qeWQ2pFBkIVwOffdU1+oZO
         nkgA==
X-Forwarded-Encrypted: i=1; AJvYcCVRwSYgNpQHKXduTQT4/3k+vCa4HX6APEV4xU34noikduYVFHzPaEJQeZdLKOMypUdIcj3pxO1NwMtCVCuS@vger.kernel.org
X-Gm-Message-State: AOJu0YwNrglY8L3xpPR9cs5IVBkwRg+P3vSlTwPHdFu9Vw0GpAwRT0yg
	K7Z7rHMZlC6o3SnMd3/w0ZOHojIFWVx+7i2rAjSP64Vf3KdNf6yETUHeraXC11dD2HyklxR26sZ
	DbE8o/Ui9gQ/lHwB5RAMNZBkmdrwqRvch4VAmeA==
X-Google-Smtp-Source: AGHT+IHtjLVFoilgrnbbIQMVwq05/DqJA4CW2+AENaI/70z5AgIJxpdFSd6TduzT2Mi5cnCvDMGVL39BMCO82c2hHq8=
X-Received: by 2002:a05:6358:310b:b0:1b5:a060:678b with SMTP id
 e5c5f4694b2df-1b5a265b26amr290392655d.3.1724254520067; Wed, 21 Aug 2024
 08:35:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240819233628.2074654-1-swboyd@chromium.org>
In-Reply-To: <20240819233628.2074654-1-swboyd@chromium.org>
From: Amit Pundir <amit.pundir@linaro.org>
Date: Wed, 21 Aug 2024 21:04:43 +0530
Message-ID: <CAMi1Hd3=1S0Jktej0vv0ZJna1Z=Kb6WHEzpbxuHFHdCaEUKWrQ@mail.gmail.com>
Subject: Re: [PATCH 0/2] clk: qcom: gcc-sm8550: Fix shared clk parking breakage
To: Stephen Boyd <swboyd@chromium.org>
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>, Bjorn Andersson <andersson@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, patches@lists.linux.dev, 
	linux-clk@vger.kernel.org, Taniya Das <quic_tdas@quicinc.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 20 Aug 2024 at 05:06, Stephen Boyd <swboyd@chromium.org> wrote:
>
> Amit Pundir reported[1] that a recent commit 01a0a6cc8cfd ("clk: qcom:
> Park shared RCGs upon registration") broke USB and audio on sm8550-hdk.
> These two patches fix the issue by skipping the parking bit of the
> shared RCGs for devices that can't run so slow.
>
> [1] https://lore.kernel.org/CAMi1Hd1KQBE4kKUdAn8E5FV+BiKzuv+8FoyWQrrTHPDoYTuhgA@mail.gmail.com/
>

Thank you for the patches Stephen. This series fixes the serial
console garbage, audio, and USB-C host mode regression I see on
SM8550-HDK running AOSP.

Tested-by: Amit Pundir <amit.pundir@linaro.org>


> Stephen Boyd (2):
>   clk: qcom: gcc-sm8550: Don't use parking clk_ops for QUPs
>   clk: qcom: gcc-sm8550: Don't park the USB RCG at registration time
>
>  drivers/clk/qcom/clk-rcg.h    |  1 +
>  drivers/clk/qcom/clk-rcg2.c   | 30 +++++++++++++++++++
>  drivers/clk/qcom/gcc-sm8550.c | 54 +++++++++++++++++------------------
>  3 files changed, 58 insertions(+), 27 deletions(-)
>
>
> base-commit: 8400291e289ee6b2bf9779ff1c83a291501f017b
> --
> https://chromeos.dev
>

