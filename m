Return-Path: <linux-arm-msm+bounces-576-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C5407E9E1D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Nov 2023 15:06:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B7F5D280DD0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Nov 2023 14:06:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3833B20B35;
	Mon, 13 Nov 2023 14:06:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Kp1NHbLM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF3E920B22
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Nov 2023 14:06:48 +0000 (UTC)
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com [IPv6:2607:f8b0:4864:20::22c])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71921D63
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Nov 2023 06:06:47 -0800 (PST)
Received: by mail-oi1-x22c.google.com with SMTP id 5614622812f47-3b3f6dd612cso2624713b6e.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Nov 2023 06:06:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699884406; x=1700489206; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oyrc6FshW+z5U6vJqacgbhem3IFjlCautuYHlaSBfRo=;
        b=Kp1NHbLMShO28/6rld1FHRBGeFLK3VII9fHxBbUlmeGgms7ogzJZKdaL8Z68X+kvoq
         DoCHxOsQuAqfvg5+XfB1m0HqlO0oKAd6z/bTjjZlGybQX+vcRi8z5Qxt68HhfSk12feu
         Aiw2Ch5Q0gMSNm9M+sHkd5puGGROrGAnLhu+jwppJ7evvcs+KzCCSajXhQoe2GlFPtV7
         OXAaN86p+IEvWsInflTdW2l/q5oFfG0JV/KzvNioBzcqPmpsC15FwmI26gLh+coUgAQU
         4ctAl685rknz+4XG2IKWzSwq1GT6j5HXY8Kx0O+A5rneCpBEH46wKnF3FBZ/Y+ICUOjc
         JFzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699884406; x=1700489206;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oyrc6FshW+z5U6vJqacgbhem3IFjlCautuYHlaSBfRo=;
        b=E5SkfvoowJdFntA1ETaTo2W9OOvL4JfqHgDmsv9VuWAfZHigEQI+Fv69760FBXoONB
         eiCuLEao5JdFz2m3mDuL4EMZoybrY2xbeOKd+t/3dC9prjZaLVtF5Gm4aBp/+fF4QJQf
         zj5zoF866EGlRiNTzaXz6GJQdjals7kSzfGkVE/XJTcSoJ6AYIcoO7Fehd4hB67Kr8zp
         DbqsRgwyktNBDBbArDKJTCBnOqdenwtak92niRm5ldictQdOWXhEiNJ5fuXFhe8bpCDi
         ceMDmrA2mvxirh153hroq+8K/9fmisncls/3ljOM73xyAW55Rj27+9M5RWEPXZkfTkOJ
         HjtQ==
X-Gm-Message-State: AOJu0Yy3D+FVwVXlCdW/wvc/kY3VzjOZ9z6NJCOr6QZOoqen3hTKSfqB
	Lpg1rHo6unYinwUbuzS3QN3S3H5V0sGm5u0kl5Uc3g==
X-Google-Smtp-Source: AGHT+IE4LQpkmC3gS33ZjHm+rJ8dP97RNKPJ49IFJV4V19OzOvJ1ryzjchxsRhW4RHqYW/kj+O1GDoUY74Q5mJrcJgQ=
X-Received: by 2002:a05:6808:320b:b0:3b5:9965:2bc2 with SMTP id
 cb11-20020a056808320b00b003b599652bc2mr9568936oib.23.1699884406725; Mon, 13
 Nov 2023 06:06:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231106-topic-sm8650-upstream-tlmm-v3-0-0e179c368933@linaro.org>
In-Reply-To: <20231106-topic-sm8650-upstream-tlmm-v3-0-0e179c368933@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 13 Nov 2023 15:06:35 +0100
Message-ID: <CACRpkdYB7AQZ7HeNmE5d716sWz5_MHiVtAet6P5XOC1etDKNcw@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] pinctrl: qcom: Introduce Pinctrl/GPIO for SM8650
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 6, 2023 at 9:32=E2=80=AFAM Neil Armstrong <neil.armstrong@linar=
o.org> wrote:

> The SM8650 Top Level Mode Multiplexer supports 211 GPIOs,
> and the usual UFS Reset, SDC Clk/Cmd/Data special pins.
>
> An handful of pins can have their IRQ generated by the PDC
> module, and for this support for the new wakeup_present &
> wakeup_enable_bit is required to allow the "wakeup" event
> to be passed to PDC and generate an interrupt or a wakeup
> system event.
>
> As SM8550, it also supports the i2c_pull_bit bit to enable the
> on-SoC load resistor for I2C busses.
>
> Dependencies: None
>
> For convenience, a regularly refreshed linux-next based git tree containi=
ng
> all the SM8650 related work is available at:
> https://git.codelinaro.org/neil.armstrong/linux/-/tree/topic/sm8650/upstr=
eam/integ
>
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>

Patches applied, unless Bjorn has some last minutes regrets,
they are in.

Had to rebase the last patch manually because of Krzysztof's
LPASS driver, check the result pls.

Yours,
Linus Walleij

