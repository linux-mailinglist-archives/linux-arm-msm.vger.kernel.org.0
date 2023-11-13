Return-Path: <linux-arm-msm+bounces-572-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 296D17E9DF3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Nov 2023 14:58:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 589D71C202D5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Nov 2023 13:58:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 503BF20B18;
	Mon, 13 Nov 2023 13:58:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ilmlLb13"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECEE81D69C
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Nov 2023 13:58:41 +0000 (UTC)
Received: from mail-yw1-x1133.google.com (mail-yw1-x1133.google.com [IPv6:2607:f8b0:4864:20::1133])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E5A56D5D
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Nov 2023 05:58:40 -0800 (PST)
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-5afbdbf3a19so51138377b3.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Nov 2023 05:58:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699883920; x=1700488720; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UZgE4RyaZYwPpDpDmOy4ALqEOGv9gIKIVZc2rBCan1U=;
        b=ilmlLb13j+wiuAfTgXWQj8IzVwYmrCiZa5VYqZcOOVeGmbRkzLpx9PmeUHU28seZ7+
         kBvAdsG8On5pAqEmZb/8QB/K3g23xJemuQ2GwO2f8ExJllJcMrJFPJHZtR9ILQTP0Zwo
         v367n21Im6a5N472QdhmrYEpPRCXD6U5OB1EUiVVl18YCE76FRaYw18Z2vLfPY8lmaRu
         fxol6/RnIfx2I7gm/S4EW5bV9zElaOMkD24w5x6cv2ykBXpzz14Q43u2LXOVktZhIJM5
         pZoKFf5ogtwRnNBsVP0u4OPXSXehLFg2p8ijG6JxixUgI3jJyoXWxU4rX+8Yy2EF/Yis
         YFag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699883920; x=1700488720;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UZgE4RyaZYwPpDpDmOy4ALqEOGv9gIKIVZc2rBCan1U=;
        b=aRzbXvYjn0qHCXo7EJkbXjzccbG69xmRe1bxzR5BQPU9EAM6jDmQDe55O+JAHLUOX0
         Yp+UVj14OkxErTwhuJ9twd0r5u4eN1M6KTpPNxiTypjLW6v/MvUx14w67Iv1rZNYXHGj
         GBERLc/zzIWpblhCNxygrzOQTqMwQl7WUoSi9kardYs/b8WDOOolxuXrdNBt226KWEiO
         DLjAWEi38UElxK5bL/m5t4N+GmF3Y2TSKWPBgAkrU4NqVpDAUDC4aPREsolidHr6LWOX
         oWugWx/DKyUDBXDPI+/CAmcN+whL+DRgWYCyeAhkRBUvpJWnnx31Ot2asNSvqE2Zyom7
         5FPw==
X-Gm-Message-State: AOJu0YyMZgSTfgKQaqxI6/sYNQf98ZogkW1gFMFjHZOIebzB7vO2DTy+
	dlGVFioo6HS+k81qXdEs7bDP41bGGwuVVgbpw8UFFjxxNTh71MCR
X-Google-Smtp-Source: AGHT+IG5c3s+o9BrWyZQxJS5cVO8U/DkjOW+r6e+D50agoGCB9Gj+0P+5CyAq0JBqKdwRUbTr85e+HJ5+N/ikQE8cJM=
X-Received: by 2002:a81:7c45:0:b0:5ae:fd4b:f06a with SMTP id
 x66-20020a817c45000000b005aefd4bf06amr7443270ywc.30.1699883920153; Mon, 13
 Nov 2023 05:58:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231027093615.140656-1-krzysztof.kozlowski@linaro.org> <20231027093615.140656-2-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20231027093615.140656-2-krzysztof.kozlowski@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 13 Nov 2023 14:58:29 +0100
Message-ID: <CACRpkdYtzAi-jPsPExvgXvj8i0m9QACzvd20cOLy7nrfAq=Dyw@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: pinctrl: qcom,sm8650-lpass-lpi-pinctrl:
 add SM8650 LPASS
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

> Add bindings for the pin controller in Low Power Audio SubSystem (LPASS)
> of Qualcomm SM8650 SoC.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Patch applied.

Yours,
Linus Walleij

