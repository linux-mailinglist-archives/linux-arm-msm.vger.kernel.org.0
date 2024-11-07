Return-Path: <linux-arm-msm+bounces-37248-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F28639C0819
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Nov 2024 14:51:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 307611C22768
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Nov 2024 13:51:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9AD152101B0;
	Thu,  7 Nov 2024 13:51:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dWYuPazp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4CBF20FA81
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 Nov 2024 13:51:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730987477; cv=none; b=OzT79Nc31a4W3YKTdVPSayHk5XzE7323T5zzUr9ygRHhfsv5rLqGAvbQoCf4kNZ9LyuXNAqv8ehcSQq4i3yfbpcC3eryVTfg5t6olJ5aTNodFxiFIMduD+2fJWO//ZRRXr9uUx1w9oIVw1PaD4+eIY2rI/w5lybuRWPpsQIp+vA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730987477; c=relaxed/simple;
	bh=NcVjILp/caZepFFB60+3XLNmk+XNW05BoJNj51Dg95o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fvC3uG0FVmUN1ZMuFEKbm4R0CoN5BVnlL6eV+6Wr55F2YytiXq6doUqSsKyw+7PJbOtyUfdtfNPJRosyRHovC8o6aYCurjWgT+wDjv8lTDJXPWuTAyiDUlzD9+CFY5uRq9PlqLaAHp9/So1cRUww037ZtYu25WSWECOBxDkDbUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dWYuPazp; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2fb587d0436so10360691fa.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 Nov 2024 05:51:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730987474; x=1731592274; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NcVjILp/caZepFFB60+3XLNmk+XNW05BoJNj51Dg95o=;
        b=dWYuPazp9WM/9vSSOM4D3EsSjWlJhI0SMs7FoOP5jm9yR4CWngxyCWOwYzy7RcP+X0
         QUipNMMuUFOq73NTu7IrUOa9gXvShW91Y99VNupmDZ6GX0DCRGUA6F6H4iIClU+soubf
         B+tJYfjToPeIvtqaoETJuO2xOQl6vaVxFtbwnrpwJo5lSTcmimu6F1zJRmDn+521mJUY
         A1KxpZ3A860jwm5j0ZzE3OlDlftdswJfEUTU6cpwOolZbhujR0GBMiStNEYXNCPPX7Ok
         K4IMqkSCOUTGwoWvayYcX0c1CUsKNYjO/ekW55yY9HLT1jb9XkSo0gRGjzr5LfzEogAF
         2fvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730987474; x=1731592274;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NcVjILp/caZepFFB60+3XLNmk+XNW05BoJNj51Dg95o=;
        b=SGXMmpKDFNLOLm6AgVNwqYJO54aYBhgTDN2KxHnjnI+TJYBH5vCvJemzulAPA2s1Vs
         FAMNF0r5YNyhqnKY2DGW+4AmEsMDSaTIi4/34YzjQABNfDnEyb9aP5ccqM3/lxDzEYUi
         KzPKe4psmSue3x8La236kQpHzU0GfLcKbaJkGStf9r00aFEQerUsB8YiniW6PHP+9pYo
         SrFSYUyFILrc360vz7oDqLGHqDL9u/fLegZexIyiWWEIAdEo3mV2SHAp0e/y17KAVtmm
         qdfeW6T3d9XuIcD/R++3CQjzyx/Fl8U78X0vKx/42rx3WX7fkhp0ZpfG+DWHv1lFFore
         1/Tg==
X-Forwarded-Encrypted: i=1; AJvYcCUQNu+eyPm12b/51dPgVSN9N80d4O4ZUmaOzJ7V4qWlDsjO96K8siPBbkOrPstde/J9tQtIdnXJ3xNT658N@vger.kernel.org
X-Gm-Message-State: AOJu0YyoH2kgnlywJ7dYEvYU1OpDNSCUvmeZyk3+UWy2ObCf/4aWaD+P
	bxXvY6wkvtuOPxm2KNn+TJviWZT+ZRV2ufxO5OQeJpyx2S9PW/qgwORvUDAIOfDCi7QOXZdPXkY
	T5/up7opMJuzvwNNn4x+p2wVtmdSB2V2bzlOTIw==
X-Google-Smtp-Source: AGHT+IGiWq7PtiVgzCFFWXw5DpnT7owotNtkDOgrZOKmEF+j8eLRrqW6X8/sDWUO8xLANvzfCAOHbn0yaa5j804ukJc=
X-Received: by 2002:a05:651c:1596:b0:2fc:ba7a:c97a with SMTP id
 38308e7fff4ca-2fedb83155emr127846251fa.39.1730987473829; Thu, 07 Nov 2024
 05:51:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241014-armv7-cacheinfo-v2-0-38ab76d2b7fa@linaro.org> <20241014-armv7-cacheinfo-v2-1-38ab76d2b7fa@linaro.org>
In-Reply-To: <20241014-armv7-cacheinfo-v2-1-38ab76d2b7fa@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 7 Nov 2024 14:51:02 +0100
Message-ID: <CACRpkdZ8--4fKxT6+AbYSvTbA7-7EM_HutNVPT7yS90NN1r5nw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] ARM: add CLIDR accessor functions
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>, Ard Biesheuvel <ardb@kernel.org>, 
	Russell King <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 14, 2024 at 3:55=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:

> Add functions to read the CLIDR, Cache Level ID Register.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

