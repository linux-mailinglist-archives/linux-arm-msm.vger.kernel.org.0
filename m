Return-Path: <linux-arm-msm+bounces-15972-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 337CA89457B
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Apr 2024 21:29:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4EEB91C216AC
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Apr 2024 19:29:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 965EB524DF;
	Mon,  1 Apr 2024 19:28:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="K+paTXMS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com [209.85.219.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2F6C4A99C
	for <linux-arm-msm@vger.kernel.org>; Mon,  1 Apr 2024 19:28:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711999738; cv=none; b=EfPgIt+96iE9jRdcnb17eGZdL3dYAxhFc2/jnxmlqCQRtYzzyd5CIvSKcf8G4AnorbI6tisOUKWMpRuIS9d34FadTQQPzn2ontrXDpqeVQDSoxV7dhq3wRfbDqTs+8m73PePMnllEHnH+W9Tl8BJ7BTm5JquM7AbY1RT8RF/JuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711999738; c=relaxed/simple;
	bh=mnmY0cBO+zlO5HW4ZtU2S+tRM/eO4Elw33SMH/UnSAg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cFFNzAEdBGVqh4cg0NGt+CKOWXZz5QMxtjvIVv6JKoHEE0Kcf+apnKSbdIll5HQQDUSU3XsDp039iHl2gsNwEbI04youkUVZFe3GNz6zpvBMI5S6wov8E20lzAO4sJ9BZsHppuCgjUmwOVDbIeV8Vs6JLVJcGAnaBmNcGu0NZrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=K+paTXMS; arc=none smtp.client-ip=209.85.219.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-d9b9adaf291so4189789276.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 Apr 2024 12:28:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711999736; x=1712604536; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=xv+8f59G1ydE+wI15KfA8QF9QXVEjYWWFV8IUCQnbFc=;
        b=K+paTXMSL6rueuwKqVLstU4DsV51fa86RiCR8HuftlZwP4vSGrq5980FQt6nZaISMN
         LY+IXFlAZVkPxOfvDlSg9/KrmAjqzOpDS8PNN06hFfnb3Wgi36T8XdPWnLZFLxXCsivS
         TBZ5RTKw34hhWIsB+gpP8C8KI1tGEEySmBBmkjM6tlWdgcmJC+5t4rZO/bnCatYKJOUx
         fSmjfk5exOhJSPxz+Kq/+F40fGHIw7pp2x4NSuOg10c5wyyx638up/TzqheJUi40MArq
         fSPMBVownDhOwnm/KQcxJarOqOa0ttyDdP5PSPH/FjFJXE6e6WAGNfXYmW7R2r+Xt9zv
         Sdig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711999736; x=1712604536;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xv+8f59G1ydE+wI15KfA8QF9QXVEjYWWFV8IUCQnbFc=;
        b=XFyOvMxUa+AGIl1dDpckYvB+++y1TLv+NGsMarg7NTfrWdQ/FRrLGXhumtCMRYoWTf
         Avehfj5eEXf+VRkhfCbOlLIqLkYUD+iim/v8UV3R+Wd0p7XPyWqm17r7jQAe1cVIz7eO
         2INJzrht43JCAOHJardbrKf3Q9oZuivjkFripcPwXKS8/uuimKHYTIkDswch3Fdhreb4
         jZiCPBvA5I64POC1+REoiu5/ha+PKjpkwhqkKurcINaP02hvr0ePK38M8jnXz2bKQRHx
         nuWnkVkaYeAYA9MjRta/Vj4ZQCeL+5OZhMJOKxovBs2le/Cj4Ll7V0qaQFrDRj48X4bp
         vIng==
X-Forwarded-Encrypted: i=1; AJvYcCVhhblAFRT7p/eGDA8mtmgLKSshhrooS/UhJK+M8CqObt2swD4ISg8eNsjHwYWEE/1BGL5zyGV+TbMICgIGg7WPsNNVkJ7JOCL4SjtqPg==
X-Gm-Message-State: AOJu0YyaSoUsrcd+Ej8yLBy2i6oUQ4EF1+NONvnF1zuhVvKnf9F1B/sq
	/jZpMVR5if8uVHAYB9gThocUTCjH3EI04qPwQ+3ZPBQ2ojiZjswSK6QkhTxXp/R+a412WmtH7Qo
	smh5yLYQu4/UdBtVgB3+ysuO7xhFKJEhTk2Aysg==
X-Google-Smtp-Source: AGHT+IHWm5qMWsxo63k0eY6EYUiYPYuVMGXukv5t8HOOBs5noEUjCJ1wrRq1JKnYeS/rT1vhe03lP/9VxfD5xrb3lMs=
X-Received: by 2002:a25:8a07:0:b0:dd1:3cc1:5352 with SMTP id
 g7-20020a258a07000000b00dd13cc15352mr7406533ybl.15.1711999735796; Mon, 01 Apr
 2024 12:28:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240401182240.55282-1-danila@jiaxyga.com> <20240401182240.55282-3-danila@jiaxyga.com>
In-Reply-To: <20240401182240.55282-3-danila@jiaxyga.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 1 Apr 2024 22:28:44 +0300
Message-ID: <CAA8EJprM596sjqSt8DSqM5yn2s6uN98o1SixVaMnFg6mpfVhZw@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: qcom: sc7180: Fix UFS PHY clocks
To: Danila Tikhonov <danila@jiaxyga.com>
Cc: andersson@kernel.org, konrad.dybcio@linaro.org, vkoul@kernel.org, 
	kishon@kernel.org, robh@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	conor+dt@kernel.org, cros-qcom-dts-watchers@chromium.org, 
	manivannan.sadhasivam@linaro.org, davidwronek@gmail.com, 
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 1 Apr 2024 at 21:23, Danila Tikhonov <danila@jiaxyga.com> wrote:
>
> QMP PHY used in SC7180 requires 3 clocks:
>
> * ref - 19.2MHz reference clock from RPMh
> * ref_aux - Auxiliary reference clock from GCC
> * qref - QREF clock from GCC
>
> While at it, let's move 'clocks' property before 'clock-names' to match
> the style used commonly.
>
> Signed-off-by: Danila Tikhonov <danila@jiaxyga.com>
> ---
>  arch/arm64/boot/dts/qcom/sc7180.dtsi | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


--
With best wishes
Dmitry

