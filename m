Return-Path: <linux-arm-msm+bounces-25880-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 39C0292D7AE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jul 2024 19:44:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E48841F21289
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jul 2024 17:44:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03A951953B9;
	Wed, 10 Jul 2024 17:42:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="LFsTWCmM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-io1-f50.google.com (mail-io1-f50.google.com [209.85.166.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 717A934545
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jul 2024 17:42:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720633365; cv=none; b=trqIC9OizYgoVJ9Jmy2LiRdHE7kUKBTV6l5e1j2d/qYyCWl6usH1G6L6Ryd4lnw/5wr3qDMPakc8haB+HfFjKbWUm6V26OY/dT1UJuSn6qU+9YHCx9j0BAg1x1EMltB6Mw+keOtloaBwdvAkmXgAdaLCaMWccCD4jIebtu26eP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720633365; c=relaxed/simple;
	bh=Uo4AsETtYXAveM1Xc57Wf8CaUxSqYIgmAdQWMhqNmic=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fk79chdOTrGG+t2hnkOFp2ZQmzLhzpJ83UFHAVu6QhbDbUTflZaAUjQF3MQlPXhtLDu2M1+jzd23NMm0IBxBeA/lUL54TIjke0Fe3poEtbzTe1mXfmQMYwALZYEvJRrf0gu2d/3/uOZ4YSTxrxEqRLOdGslSmjuwfoAOotZC/qM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=LFsTWCmM; arc=none smtp.client-ip=209.85.166.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-io1-f50.google.com with SMTP id ca18e2360f4ac-7ebde93bf79so1417139f.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jul 2024 10:42:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1720633363; x=1721238163; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zOdeMjN8zn02u2RJwNFjQMEU7jlojgabQSgPR5kH/Pk=;
        b=LFsTWCmMy73abxkVq2Q/jIkZndy0ygLsBpEvhZ2WuqO4LRSQQyPockRePfA+6duzcH
         GeD1bZsz44I9isa3ZofHjF8ubKk+OsEGW5S6+lHiD+j1mSxSjWjZc0Nq8R41eRLMdzhx
         Xgqdw2ZJxYtD+rqQMEdsBFoRtKnj3e80QyqPE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720633363; x=1721238163;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zOdeMjN8zn02u2RJwNFjQMEU7jlojgabQSgPR5kH/Pk=;
        b=nxEhsd1R1UKy1CDYGph32KWk636OWBOLlvakDsArOHBIrVXo+u+CV2KbNZIwqYltdY
         b+hK02799OXMoUytpHEXHleVx4WND5oNoRItE+/XxQ8JskbiYZzlAXvRPp7PqmF2BhCw
         8J2Dsv+nkq4x/PGkak54MjaUJhKsaqcUJ5c9koJ41ffrXwv+5qFKc1hXXDSYdAFE3NOU
         /4XOPe6/NHlG1LLcRmNE3cp4rW1KsS/4AJNpQP9wut1Yh0cpSwIiGmxAf4ovaIDQsJoV
         jhq1fu3wqggBqVZVjGxeDgGIaMci+iPCBlA+GE2/eW50ZFQHSz1NbzqjfXWJGEllyJci
         PvAw==
X-Forwarded-Encrypted: i=1; AJvYcCUrmwWxYVOpBocuIGGYWj3bOUrVxAvjpY44u0hT9NUBuWFFLswoOuXCZuyCJgPjyAZPzrYw60BL/m5FnWoDkySLm5N21d0c8uCiE2cwlg==
X-Gm-Message-State: AOJu0YxOOOWGQSYZ4+2Cepafv4mtkX+odiCaV9ayM3TrWDBVwccetcEf
	Rqa8J5pTr3yph6SgkJ12mpbNJhVFuL2nt8phNW0YIAO+GJJ8ISdNNMHQevC7mWo9IGKRLgHo6eo
	sgQ==
X-Google-Smtp-Source: AGHT+IFVnYlT3OOcakQKwAVC0jCGHrtCQRQyBH7mmKMtqxq3SFkuRqLplTiGXCwYJSbrWa01vVlKRw==
X-Received: by 2002:a6b:4417:0:b0:803:5e55:ecb2 with SMTP id ca18e2360f4ac-8035e55edc3mr454420039f.0.1720633362894;
        Wed, 10 Jul 2024 10:42:42 -0700 (PDT)
Received: from mail-il1-f177.google.com (mail-il1-f177.google.com. [209.85.166.177])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4c0b1c2c72esm1295476173.170.2024.07.10.10.42.42
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jul 2024 10:42:42 -0700 (PDT)
Received: by mail-il1-f177.google.com with SMTP id e9e14a558f8ab-375fc24a746so7255ab.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jul 2024 10:42:42 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWZx4gioLF17hz/q8UOU1JWfeNs/+S0TcBSC8dqKvwaOtUNfvi4ianHSTicXjSjMtdTBMboS7PzRcIfU+ZYHIaPixwKsMLzuzsLfVtyHQ==
X-Received: by 2002:ac8:7773:0:b0:447:d97f:9765 with SMTP id
 d75a77b69052e-44d0b00f42cmr42181cf.16.1720632956811; Wed, 10 Jul 2024
 10:35:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240710-x1e80100-crd-backlight-v1-0-eb242311a23e@linaro.org> <20240710-x1e80100-crd-backlight-v1-3-eb242311a23e@linaro.org>
In-Reply-To: <20240710-x1e80100-crd-backlight-v1-3-eb242311a23e@linaro.org>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 10 Jul 2024 10:35:45 -0700
X-Gmail-Original-Message-ID: <CAD=FV=X=rL9Jr91BXFX+a=X+SCjYX7vGhztbh9tEUVn9iLViJQ@mail.gmail.com>
Message-ID: <CAD=FV=X=rL9Jr91BXFX+a=X+SCjYX7vGhztbh9tEUVn9iLViJQ@mail.gmail.com>
Subject: Re: [PATCH 3/5] Revert "drm/panel-edp: Add SDC ATNA45AF01"
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Jessica Zhang <quic_jesszhan@quicinc.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	Abel Vesa <abel.vesa@linaro.org>, Johan Hovold <johan@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Jul 10, 2024 at 10:05=E2=80=AFAM Stephan Gerhold
<stephan.gerhold@linaro.org> wrote:
>
> This reverts commit 8ebb1fc2e69ab8b89a425e402c7bd85e053b7b01.
>
> The panel should be handled through the samsung-atna33xc20 driver for
> correct power up timings. Otherwise the backlight does not work correctly=
.
>
> We have existing users of this panel through the generic "edp-panel"
> compatible (e.g. the Qualcomm X1E80100 CRD), but the screen works only
> partially in that configuration: It works after boot but once the screen
> gets disabled it does not turn on again until after reboot. It behaves th=
e
> same way with the default "conservative" timings, so we might as well dro=
p
> the configuration from the panel-edp driver. That way, users with old DTB=
s
> will get a warning and can move to the new driver.
>
> Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
> ---
>  drivers/gpu/drm/panel/panel-edp.c | 2 --
>  1 file changed, 2 deletions(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>

