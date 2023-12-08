Return-Path: <linux-arm-msm+bounces-4007-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D70CE80A783
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Dec 2023 16:34:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 971981F213F1
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Dec 2023 15:34:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A77AE31A74;
	Fri,  8 Dec 2023 15:34:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="XWLHUzsp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF14C171D
	for <linux-arm-msm@vger.kernel.org>; Fri,  8 Dec 2023 07:34:50 -0800 (PST)
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-332c46d5988so2341688f8f.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 Dec 2023 07:34:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1702049687; x=1702654487; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0smOkN0JwIYP/mQNjuHR8QDcn+P+VGLbn6lLRSQdlCM=;
        b=XWLHUzspnX71sF/znGHYhHwaUhSKD0rt7yhIRhKO1VJza1uOWviKXlgOBF8ElpnMVW
         sySxCF6yn+asw1Rgq3LiePESGh1W1gWYjC49s5ddN/l8QqQyrQ05OmpJww3Spefy8lmN
         sJwe1J2/g//PmPPZQVg+qN0c+7ERmhz+iY12Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702049687; x=1702654487;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0smOkN0JwIYP/mQNjuHR8QDcn+P+VGLbn6lLRSQdlCM=;
        b=PBk6Nq7Vl3yW8ZenUzFBtBqChOWmSUtxJ6+8fypyneUCZNMXMeocBmXEk/bcEjRo4Z
         HbhauvIrZKxbRg3MJdVeh6BeqhDuPaXlfuDHiPjZdKnmuvN9LynNpSxQqTtdTKKtZncR
         3fZIu5rhmDccVXtLhLdbzTmuGD8ILb7uIMRq9kossmLnvsRwTLpC7j70+f+YyJl1Bo7Y
         SFl0N4Q00OdYjmF5A7ekyxqqDB4sfyPwTrD4KGJKIokHe2tvLS2k4rxMVkGkSMyb8CYB
         Vkjs3YuhWfkQaS/c54sMqBa3BT8yFeiDdkhsZErViiBzzfugjab499i8HJfB3/z1/9es
         4qzQ==
X-Gm-Message-State: AOJu0YwuWH6ix98i1/wPOqmvfuk8jcOD49rWKSFndL2DYhuK+s6NlBCX
	IhXP3d1dTWQqgcnugOjCln3QltF+WZdsCUOukbXtGw==
X-Google-Smtp-Source: AGHT+IHfBRgt157P+aIKumje232WzoSZ5Nvkn/wc0tBedYSpb+lSs90o0HVZeTT0BKMzm8/3rse57Q==
X-Received: by 2002:a05:600c:6907:b0:40c:30fb:60ab with SMTP id fo7-20020a05600c690700b0040c30fb60abmr78193wmb.134.1702049686537;
        Fri, 08 Dec 2023 07:34:46 -0800 (PST)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com. [209.85.128.49])
        by smtp.gmail.com with ESMTPSA id vk5-20020a170907cbc500b00a1ce56f7b16sm1128455ejc.71.2023.12.08.07.34.45
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 Dec 2023 07:34:46 -0800 (PST)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-40c3963f9fcso3715e9.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 Dec 2023 07:34:45 -0800 (PST)
X-Received: by 2002:a05:600c:b92:b0:40c:2399:d861 with SMTP id
 fl18-20020a05600c0b9200b0040c2399d861mr61604wmb.6.1702049685373; Fri, 08 Dec
 2023 07:34:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231106144335.v2.1.Ic7577567baff921347d423b722de8b857602efb1@changeid>
 <20231106144335.v2.9.Ie30c1d3f780666f6906fd2fd7c437632c229d987@changeid>
In-Reply-To: <20231106144335.v2.9.Ie30c1d3f780666f6906fd2fd7c437632c229d987@changeid>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 8 Dec 2023 07:34:28 -0800
X-Gmail-Original-Message-ID: <CAD=FV=XsPGvNggpJPCpF=xhkm3dOHsStycZvuVttA=ZH6=EUmw@mail.gmail.com>
Message-ID: <CAD=FV=XsPGvNggpJPCpF=xhkm3dOHsStycZvuVttA=ZH6=EUmw@mail.gmail.com>
Subject: Re: [PATCH v2 9/9] dt-bindings: watchdog: qcom-wdt: Make the
 interrupt example edge triggered
To: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>
Cc: swboyd@chromium.org, linux-watchdog@vger.kernel.org, 
	Rob Herring <robh+dt@kernel.org>, linux-arm-msm@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Andy Gross <agross@kernel.org>, 
	Sai Prakash Ranjan <quic_saipraka@quicinc.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Nov 6, 2023 at 2:44=E2=80=AFPM Douglas Anderson <dianders@chromium.=
org> wrote:
>
> As described in the patch ("arm64: dts: qcom: sc7180: Make watchdog
> bark interrupt edge triggered"), the Qualcomm watchdog timer's bark
> interrupt should be configured as edge triggered.
>
> Update the example in the bindings.
>
> Fixes: 7c631cdff391 ("dt-bindings: watchdog: qcom-wdt: allow interrupts")
> Reviewed-by: Guenter Roeck <linux@roeck-us.net>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
>
> (no changes since v1)
>
>  Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

I saw Bjorn landed all of the dts patches from this series but it
looks like the bindings patch got left behind. Anyone want to claim it
for their tree, or Ack it saying that you'd prefer for it to go
through someone else's tree? I assume Krzysztof's Ack means he's not
intending for it to go through the DT tree and Bjorn doesn't seem to
intend for it to go through the Qualcomm tree. Guenter/Wim: it feels
like this could go in the watchdog tree?

Thanks!

-Doug

