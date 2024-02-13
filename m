Return-Path: <linux-arm-msm+bounces-10956-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C59BF85400D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Feb 2024 00:25:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3B2371F23274
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Feb 2024 23:25:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05DA463101;
	Tue, 13 Feb 2024 23:24:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="F3+vYI4K"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 458CB63123
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Feb 2024 23:24:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707866683; cv=none; b=nmbr5g1f4qjEZakDGnYcgoQV5pR+lCA3Bs9QM8C9j+hUql08fV8KAIZGSve/t3HJcvNigcC4WI0QGk2scvOLSyFbHZ/0rHjRPMMdTfZxUZPximtfZ1qPvQ6RW4Fg4zpYqOmDNoLIgUQ5/65RqzHJmIUzC6z29TM1F29sj3gK+Dw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707866683; c=relaxed/simple;
	bh=bcNZkTfy8xF0KWYq2Ov+PCZSbZ3Z6PXo5Nj4PAZaHYw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bZt+b4DV1mm32teMoAVlTMLqUeRB0JNW+r39FOr/Hse76vYFXtpCF1eeJUozuEqI/xFfA4IoE51gWOyFO6sIJDpMNWiPiVlZ4n0dOlUlfp/ZyZ86e2jw2f/ZnXTHSSGFXXtKW3LqDbpvyObbqvwwJbGKXO73rFODzUpM2fW2Hdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=F3+vYI4K; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-a3c1a6c10bbso427984366b.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Feb 2024 15:24:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1707866677; x=1708471477; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=owV9kvvQ01YV0IOM7V6TZ+A51SR1Xuk2YazbU2H7zpE=;
        b=F3+vYI4Ks+QwqwLqyhgeheLsu5sUasfXeVphMHt5VZb83QKsos3ylr5sllnJ98NcZc
         UY6SY5kDlsIJnans/8cuQpulZT9zJrYmk40TZHSGYV0udBh6GFiyrJKduFiHmLT2Wkwb
         D2pX+1xF7OoW090mL85De9TViDAmch1gDAiY8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707866677; x=1708471477;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=owV9kvvQ01YV0IOM7V6TZ+A51SR1Xuk2YazbU2H7zpE=;
        b=nZa2x10KLHcrYT36bIxNm7dd39HOkLl2j8flfQ08Rk/NJpfX4pa05ebd2JfJ+OFOrm
         XqUQBmrxm+x/okqNAocn8lrFYFSL1k6GHkYPfHnPDdsEDcrtGFGK32bdpTKsl/fqM/mI
         GMl2xaPDAztsNuzQtJNtbGJpiTg9lJc6cr8J/IFrsnD8G7rHaP9B2XJo9/l7fdgs7gP7
         lC55UGIBeTCPhnYFJZCBQGG8zoQn+JthhSioQlYcNrauw5iEz2cDZeOzJBo28jHOrg0f
         vS3MQ0/P3f/OILvNd/Qupqsjmc98yOyaBbklpP5YHw2h7T/8XvDAes6TgVR/O1KEOSqC
         bvnw==
X-Forwarded-Encrypted: i=1; AJvYcCUoePbx2gmdgBq32Pj8M4CUkqju2BVDBArLrEkzdQ6aJkRV3iRz479/pKcn1oFQKKgGV8PAAZ8V0cGTjHswojZ5ylQFGdbbGBmmxa9YRA==
X-Gm-Message-State: AOJu0Yy812rboMTp8+CGKv//xyCjUErqbp05Fu+yKDUcGYFNT2PtGBmQ
	ifmBJ3/5s01RO99DMv+MyLka8QXFXwAaXIJbTjJiRjT50S3izFjDwkObJOKrQoe1VURr+yQBprw
	onBwj
X-Google-Smtp-Source: AGHT+IG/G03lpjz9KQBi7ByEQ6GcoxpaI7HUUE43VHo0BRwpJsxRrayQYu7tdVH+Teyztnoqh7AYTw==
X-Received: by 2002:a17:906:751:b0:a3c:c89b:38ef with SMTP id z17-20020a170906075100b00a3cc89b38efmr552364ejb.74.1707866677749;
        Tue, 13 Feb 2024 15:24:37 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVfHxw1ANITawE9/20W29kJalH9QivofbGqi3the5Ng6v8gvI+VG2FwasCqhH2+8037PzKFRw59sQtOYO65Ujd5V6gSFYzbmh1NPU+7ng==
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com. [209.85.128.54])
        by smtp.gmail.com with ESMTPSA id ps7-20020a170906bf4700b00a3c7fb8cc74sm1711194ejb.154.2024.02.13.15.24.36
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Feb 2024 15:24:37 -0800 (PST)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-410cf70a057so97435e9.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Feb 2024 15:24:36 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVaiNW0IaqX18DncPtCwbRsTqbBKpzV3mY6GVxYM6NAd5w4V/ZB/G6n9vStgt6aUFVCwFhwg0QtQBsyFvYhyx9t/dlfLH9QljRcxflRmQ==
X-Received: by 2002:a05:600c:a01a:b0:411:e72d:e5c9 with SMTP id
 jg26-20020a05600ca01a00b00411e72de5c9mr7584wmb.5.1707866675833; Tue, 13 Feb
 2024 15:24:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240210070934.2549994-1-swboyd@chromium.org> <20240210070934.2549994-21-swboyd@chromium.org>
In-Reply-To: <20240210070934.2549994-21-swboyd@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 13 Feb 2024 15:24:20 -0800
X-Gmail-Original-Message-ID: <CAD=FV=XH=yJdEKSmOq50mXw12hsBc0-oWmhnc4h_itGqfoEjfA@mail.gmail.com>
Message-ID: <CAD=FV=XH=yJdEKSmOq50mXw12hsBc0-oWmhnc4h_itGqfoEjfA@mail.gmail.com>
Subject: Re: [PATCH 20/22] arm64: dts: qcom: sc7180: pazquel: Add missing
 comment header
To: Stephen Boyd <swboyd@chromium.org>
Cc: chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org, 
	patches@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	Pin-yen Lin <treapking@chromium.org>, cros-qcom-dts-watchers@chromium.org, 
	Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Feb 9, 2024 at 11:10=E2=80=AFPM Stephen Boyd <swboyd@chromium.org> =
wrote:
>
> We put a header before modifying pinctrl nodes defined in
> sc7180-trogdor.dtsi in every other file. Add one here so we know that
> this section is for pinctrl modifications.
>
> Cc: <cros-qcom-dts-watchers@chromium.org>
> Cc: Andy Gross <agross@kernel.org>
> Cc: Bjorn Andersson <andersson@kernel.org>
> Cc: Konrad Dybcio <konrad.dybcio@linaro.org>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: <linux-arm-msm@vger.kernel.org>
> Cc: <devicetree@vger.kernel.org>
> Cc: Pin-yen Lin <treapking@chromium.org>
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> ---
>  arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel.dtsi | 2 ++
>  1 file changed, 2 insertions(+)

Bjorn: happy to see this landed any time to shorten Stephen's series.

Reviewed-by: Douglas Anderson <dianders@chromium.org>

