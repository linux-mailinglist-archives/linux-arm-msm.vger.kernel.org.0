Return-Path: <linux-arm-msm+bounces-17688-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 999248A824F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Apr 2024 13:46:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4C8B42815DB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Apr 2024 11:46:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A287D13CF9A;
	Wed, 17 Apr 2024 11:46:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mCpzGYZR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75D5213C8EA
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Apr 2024 11:46:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713354410; cv=none; b=c37un2c6vUS1zhFdLroKYuyrhzmxIGg4gV1y6gRuAp6dOaxQNDMVsL1tn8w3VhEoH+a/ID74/8kzOcJdOJhJkN5jMr4DyvRKl/eSWBjl2u/vkKyX+FXiOt1zd+1OzZ0Ms4KvRXUENodBCxKGidLcCdfmpHCnYcCMVz6TryAI8XY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713354410; c=relaxed/simple;
	bh=fvmf65/P9szpFK2qdaU9n3rF1YNMb7cvoUstdIgrV3o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ueCRUyttbJkm3VvC8pkfnKninuJ/Zs/lEebMCwF1fkrlRw/kLh0A07VEUqj2g+ThlPdubJRA2PeBGZ0S0GoD+A/zYULCfhjvfnreservd/wnJTe5PSITQlAGqWJrKv9CuLu3CH1AuUctP1GC5j1JP1YEx9sjF655+NgYq7HpVLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mCpzGYZR; arc=none smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-6157c30fbc9so54177997b3.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Apr 2024 04:46:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713354407; x=1713959207; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fvmf65/P9szpFK2qdaU9n3rF1YNMb7cvoUstdIgrV3o=;
        b=mCpzGYZR/46ZQuAau0bSRhR0FD5k7fh4SSEz3Nq7zi0S4UDs+2+/mgG8hbZ2TOEfFa
         VnuEAxEfiUW5dW8ztwTzgs7fezgt4SmjroWhsc5KCg2ILZ7XrFDUkqJj/kWhLJR9n3cX
         OAaASPVPTX8pPR4V3iIxqTyRES8TonOBKKbj8Ia9JgBKr6Qo2O9mnQjtJiGDMZl/CoIE
         l5+oqhw1O3ZLVLkibs1r73NVAeJmC+6UJmoA72qmo1LGEIGNvEbMA71jIQSfnMCbN4Q7
         Knym4rLCB+h0yYobOKyFaTbBeAhFXbW32Fkuc43l3jarw91MdMvjaNsXaBDxbbL2vQLm
         KYNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713354407; x=1713959207;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fvmf65/P9szpFK2qdaU9n3rF1YNMb7cvoUstdIgrV3o=;
        b=h9nc0OOMe3Y80ROtUEspHzfTst57vmum1mgUGd36cfu2P6VTHmBOm+0A4ZtmatZVNv
         z1C5C3FN7AbiFNXH8wlI5CXXF4F9rbNWhYERKzUD4Gi7AacaT+GM+UhsFe1bQSY5euja
         Ka7DPw/TEDSeq48Tr0TFdsxrDwaQHWwPMLAP3jnMCIHKj76Kc1UXiFjyIkCVj8v4fpGN
         Gf9YeKy/h0sSYzzfAs16OjtXMYDLLLgPw6tc8D8pQq+5qj4l1gZZHTCMdNfoLBM3cxT2
         PNx5wshcQnnZczcSRqdPFpfFEP649LzBUG1bY4QbxGW3uD7xrxOxGI5uPrRIpBpQtz2K
         Yzbg==
X-Forwarded-Encrypted: i=1; AJvYcCXJ8WgHrv8/H/vOesfW1tijZ/w0qjxUL6r7eA9UCdIySi8mFimb6SPYM40u6AvqwpCwYJLhhS76YewmJ1zDWrYg8NggqcEzWrBYfHAALA==
X-Gm-Message-State: AOJu0Yx0ZvKN46fIjqueJ6mGcf7hMPdJfLxrjXSMtmTFV6h7ggd+/Qww
	u9oCoH2M1EZYireOTQfGFmrPe1YzjkFw6BEn+relVUcPiUi9ByoiBZls8xEavc6tNH0qzpriKdF
	FbPxWYADaBoKoUvkEJE3Gg8AVUg2FdQL+Ve5nQg==
X-Google-Smtp-Source: AGHT+IHaD+oBtxsxurR2xr7+C5Dc/H+UHa4V1Pxg4C+1i8P8lLpLApH2p8YLciARVFNYj0rwHnv7aiDYHF6DmqUMe9U=
X-Received: by 2002:a0d:cc4d:0:b0:61a:e856:85f1 with SMTP id
 o74-20020a0dcc4d000000b0061ae85685f1mr6294364ywd.13.1713354407196; Wed, 17
 Apr 2024 04:46:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240417-msm8660-mmcc-v1-1-efc9e455268c@herrie.org>
In-Reply-To: <20240417-msm8660-mmcc-v1-1-efc9e455268c@herrie.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 17 Apr 2024 13:46:36 +0200
Message-ID: <CACRpkdZYujAGZc04Zk0CdzMvFi9KJB+8z8ADN6+VBgahxxPwUg@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: clock: Add qcom MSM8660 MMCC defines
To: Herman van Hazendonk <github.com@herrie.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 17, 2024 at 1:19=E2=80=AFPM Herman van Hazendonk
<github.com@herrie.org> wrote:

> From: Linus Walleij <linus.walleij@linaro.org>
>
> The compatible binding for the MSM8660 MMCC already exist
> but the enumerator defines are missing. Add them.
>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Herman van Hazendonk <github.com@herrie.org>

Same question as the other patch here:
do you have it working on real hardware?

I didn't submit it because I could never test it, and
for me something was missing (like SAW regulators,
interconnect or something like that).

Yours,
Linus Walleij

