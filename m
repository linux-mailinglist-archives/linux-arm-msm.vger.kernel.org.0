Return-Path: <linux-arm-msm+bounces-4209-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C217980C7B3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Dec 2023 12:09:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 781441F21226
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Dec 2023 11:09:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D949C34CD5;
	Mon, 11 Dec 2023 11:09:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KykgmI5c"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-x112d.google.com (mail-yw1-x112d.google.com [IPv6:2607:f8b0:4864:20::112d])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E3FFD8
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 Dec 2023 03:09:46 -0800 (PST)
Received: by mail-yw1-x112d.google.com with SMTP id 00721157ae682-5cfc3a48ab2so35967537b3.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Dec 2023 03:09:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702292985; x=1702897785; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=PhJsxpUpZ7XgpcqIqxxRBw654ENRDk0ZPdEH2SQUoSE=;
        b=KykgmI5c+SkXuwLET8IdlNtAw3yPGR2F2EOZXm0/y7c2fgEYXipMjOLSucwwlimUwA
         m43zIuRAYfYxRVIwogd3mSERNt3e5WGMLAy21eGzVKJiainV3+9ea46J19+zk9G+Wy0b
         7ZZ3zq9kJjn/r7OPXK32NND8R6b6kCDaQzrZYj5s2QKk2YaDjCfdtqOncPxCgVQm1qU5
         jsLAv9YQlok1z3KlpM1xKJ4q0XaZULS8il9nSiGtSANC//XvVYxjIqiQroiBmvJRQtcY
         vaNw93rQopqlrcYlQ65wwbXlkJwGseyO7Epvpw0c6XLd9HRF/gcNE6wnd6eAnHGAgv4a
         yJzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702292985; x=1702897785;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PhJsxpUpZ7XgpcqIqxxRBw654ENRDk0ZPdEH2SQUoSE=;
        b=EUbJnBk4CAjCTKtZ44nLEI4i3PYdVzXALQpSZ/yNqWskAE6Up7+rlLLG5i2a5cx/ip
         /0o1TPGukGABkpuhnrnxP3rpbBTK3h9suXzjDR64Dk430z3iRodK8W7x7Y/tPGngaeLH
         c/+ba2k6aF1wzPwYnhV3yDGAGwdmQkRtpjpCe8rrizNRthDxe2blpoG4XiMvi44N+4WB
         7ENbycHt9+o+JSDY/ewy6ccC7crWY6dZ3mqWY14tX7kE/57vvPQRkAiuGUA505G5QyHy
         qg6/8mb6Tdzl7nYrbUPdOWNP7tnqEnbxk4WWcjEqm2G/dnzoDwelKuOLplD9K4ogrK1Z
         LIQQ==
X-Gm-Message-State: AOJu0Yx5/Kd81wghgoNArJcBQfwEQ2Rw2SnvYa1RbHMdzUhpsPhcqKOv
	MymMEAuLY+8DJARkoVHGVIxUlAIS/dfBuOIF7Ysnrw==
X-Google-Smtp-Source: AGHT+IH+1eXJKaJbPI4IGR1cC9SIY48i2Db6G6EhUnlBgyTPoR6YhcTGiNgp0UZ1SAxXVV23F5fJ4Fi4zMCykmLzzI8=
X-Received: by 2002:a81:83d0:0:b0:5d7:6ab7:3a22 with SMTP id
 t199-20020a8183d0000000b005d76ab73a22mr3000722ywf.10.1702292985558; Mon, 11
 Dec 2023 03:09:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231209215601.3543895-1-dmitry.baryshkov@linaro.org>
 <20231209215601.3543895-3-dmitry.baryshkov@linaro.org> <48a7c36e-2fa2-4be6-970d-a4a301fdf8f7@linaro.org>
 <CAA8EJpqw+hC05QP1mWkA-SsKEehjp7ipb_HzUW2nyWjqZ8WkXQ@mail.gmail.com> <730b81ae-1fc5-4d23-9a18-04d41e40a579@linaro.org>
In-Reply-To: <730b81ae-1fc5-4d23-9a18-04d41e40a579@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 11 Dec 2023 13:09:34 +0200
Message-ID: <CAA8EJpo+bwByDQcZaunC4Q__3P7oFcaRUqxY3car9krhpxMMkg@mail.gmail.com>
Subject: Re: [PATCH 3/4] soc: qcom: stats: support SM8150 platform
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 11 Dec 2023 at 12:46, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>
> On 11.12.2023 10:43, Dmitry Baryshkov wrote:
> > On Mon, 11 Dec 2023 at 11:11, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
> >>
> >> On 9.12.2023 22:56, Dmitry Baryshkov wrote:
> >>> On SM8150 the RPMh stats have 3 data records, but no DDR sleep stats,
> >>> which demands platform-specific compatible and data.
> >>>
> >>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >>> ---
> >> I don't think it makes sense considering the driver could detect the
> >> presence (or possibility of presence) of DDR stats at runtime.
> >
> > No, it can not really. We have safety nets for checking the offset
> > value and then checking the magic number. But I'd prefer to be
> > explicit here. It's not that the 'invalid' data at this offset is 0 or
> > ~0.
> > So, I'd prefer to be explicit here.
> I'd say we're quite covered:
>
> if (ddr_stats_offset)
>         if (offset is within the range) // your latest patchset
>                 if (ddr_stats_magic)
>                         if (entries)
>                                 "show stats"
>                         else
>                                 "show nothing"
>                 else
>                         "no ddr stats"
>         else
>                 "no ddr stats"
> else
>         "no ddr stats"
>
> Konrad

I'd say, too many ifs. I'd prefer to have it disabled for this platform.
-- 
With best wishes
Dmitry

