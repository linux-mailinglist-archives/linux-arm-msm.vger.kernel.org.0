Return-Path: <linux-arm-msm+bounces-573-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A40677E9DFB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Nov 2023 14:59:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D3EF61C20929
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Nov 2023 13:59:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09E4D20B28;
	Mon, 13 Nov 2023 13:59:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TCKOvUQ4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7C6120B22
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Nov 2023 13:59:13 +0000 (UTC)
Received: from mail-yw1-x112b.google.com (mail-yw1-x112b.google.com [IPv6:2607:f8b0:4864:20::112b])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4FD46D54
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Nov 2023 05:59:12 -0800 (PST)
Received: by mail-yw1-x112b.google.com with SMTP id 00721157ae682-5a92782615dso51861817b3.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Nov 2023 05:59:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699883951; x=1700488751; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jkvb5jXjgdppD5M3BE/7qL+8HuZSIdn/P5Opxdga4vg=;
        b=TCKOvUQ4CSkCSxPbE6alrem+biq8PaJkJSBINQyZ4QQ9WWz/ffRg+EnpMvR3ykCJDa
         FKr6ZHxgbnXnPMnAAVNQXaLQHmDxZfZoqrSNYkVTspltrJc5W6tDashZ09oPhzx4yMYI
         M0vbd+DMOT/giyez0MocDXpuW8gh9St8FjBkwtT3gQgp/aZgeFeK9gSnKOyUGQvux3lu
         rAhmp3nW2MA6eCeDXJI55tFJwCySlKKwIWEc8sVmPldNAWpIHl5IXEGoBunYDQd56O7O
         S+7LEHs2Dzl1HErh3B83ZpGT9gTXO9SIDjfeA1e6+UBPe5mX2EdPPWwAmuyfPM7XQktF
         /lwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699883951; x=1700488751;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Jkvb5jXjgdppD5M3BE/7qL+8HuZSIdn/P5Opxdga4vg=;
        b=Z17RTBGPU75qyxJuFpq7lPom2AeO2PxNgRal2XuhvdTCeEl8IY0ZzxkdJo6jFiH1rC
         sXKfP/97xIdef8HRarMJ+d7alJ3D6hjXio8xS+C5uwBGax3d77NMtEmDRjT+F03ssi9C
         B+ChzEMGUH5sDseO2WSasZR5UmlDcNmAinyR66Ew8G0FMdNzTAgGgtKe22GhkdvLzdNv
         i1QyOnkTT2F0jlKUCnkK0myc2VdxufIFQwTvXNBsommxzQDs09HESi0LcwqO/kP1/9iw
         oCIXUflua28VfUZHMZvriPVhAJrerLSJLS/AIWm7acpGd8MBJAarMd+1anDgQDUECmR5
         MSjQ==
X-Gm-Message-State: AOJu0YzBGepIM7gxoofjPW3tsy6JvzRp0YpY2ktQIhdq3DC2gL5e59nb
	4sb+1ZV6Jw+vDZNwEb5L0V1M+dvRKDrE4g1c3mua0A==
X-Google-Smtp-Source: AGHT+IFOcCkw5XM4JWZUE7/qoRjiVbjPcLcLFuTmK8ZrnLgJQhE8oa+pIkQakxeis9S8rmZPpg6AROJznV8FA2Cgah4=
X-Received: by 2002:a0d:e342:0:b0:5ad:289b:999 with SMTP id
 m63-20020a0de342000000b005ad289b0999mr6727763ywe.28.1699883951561; Mon, 13
 Nov 2023 05:59:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231027093615.140656-1-krzysztof.kozlowski@linaro.org> <20231027093615.140656-3-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20231027093615.140656-3-krzysztof.kozlowski@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 13 Nov 2023 14:59:00 +0100
Message-ID: <CACRpkdbSCkq7a-3=FfC6=bxh2JB8UZK9K1Eumf0PBnpuArkHSg@mail.gmail.com>
Subject: Re: [PATCH 2/2] pinctrl: qcom: sm8650-lpass-lpi: add SM8650 LPASS
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, linux-arm-msm@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 27, 2023 at 11:37=E2=80=AFAM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:

> Add driver for the pin controller in Low Power Audio SubSystem (LPASS)
> of Qualcomm SM8650 SoC.
>
> Notable differences against SM8550 LPASS pin controller:
> 1. Additional address space for slew rate thus driver uses
>    LPI_FLAG_SLEW_RATE_SAME_REG and sets slew rate via different
>    register.
>
> 2. Two new pin mux functions: qca_swr_clk and qca_swr_data
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Patch applied.

Yours,
Linus Walleij

