Return-Path: <linux-arm-msm+bounces-4186-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B9B980C513
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Dec 2023 10:45:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1CEC01C209D1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Dec 2023 09:45:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B56C9219E0;
	Mon, 11 Dec 2023 09:45:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xoIAos8k"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-x112d.google.com (mail-yw1-x112d.google.com [IPv6:2607:f8b0:4864:20::112d])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ECEDD198
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 Dec 2023 01:45:47 -0800 (PST)
Received: by mail-yw1-x112d.google.com with SMTP id 00721157ae682-5d40c728fc4so30968607b3.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Dec 2023 01:45:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702287947; x=1702892747; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=LpS2X863BqCbckfOeGv1uweVgiUEsH3nVqhMXbPH/Mk=;
        b=xoIAos8kG5j5ZthVtqFKeaLiSnRJEfEOSMRCuYT6nILtTUZ4wU/cqh+W02sPxtAS50
         q43fqDRmQ5pynVY4Vz8cVjkerkyJL1UQ7woVQx8qrCdJGAzFCkC+gs6DA3LveXc3x/hh
         ft/Hw9V9kyAqgIUn13aPSSZ5/Gs4t9+Gp+Ntvcyy5TXdqhygG9eYY7wjOoG6EkPH5nvZ
         YqyER1YxnG7URqENe/KL7uq+UoK3GnPnLBBeFZdel1eTylEWop4dlW9h8yufIHPyZdzs
         nmWV7LhJ1Dye0nzuw1ZkE6S9GbpC0TcDm7jEPDzrEgfMcq2j85Z7brhcVXAvjB+rqGGi
         bs5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702287947; x=1702892747;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LpS2X863BqCbckfOeGv1uweVgiUEsH3nVqhMXbPH/Mk=;
        b=aaF33xkO+kqrXOWLb4o8LsrRsSV83h0uqB/47scjaZnGPPJkEQwjjgPuP0C+CYis2P
         I7fuMWQaX8F8GZSeEOZdYqwkGk0vi1tCvNLjnZr7aG522hnNKsJydfh50N5LTpdUmahp
         npK1ZPdlRcFMGJP2IGaHT4YGeQ8hn3EW4e0vVcKNBX0hOlruiEWAd+0748Ln67jD653Q
         jr6LW+SZAT95dOvCC8+mGWNlZo/iBM8gJb7uersVsPjiANb4gbuqaeZDWYAhGgRzxXMM
         Uzj4UIYMiCG8GibnP3yI1vle7lJ5jXexFeDIV1ChzKRgkfQ0Y4CeF61uvExB6f2EYOQv
         e80g==
X-Gm-Message-State: AOJu0YzU/8IyFmQ5qqoFOyNI4Ad2fWF/b4Sc/i09HPkdcivav9fYc3dj
	9ceYCPRnW8uJNL1414NagiDyRC71LJItykxlo65bGQ==
X-Google-Smtp-Source: AGHT+IEdA2lchCkngKTLdWfeiqjIhis9dj4VJ2FHzG1FAryLDvngRcwgqBCjKabE9igBrprRTqwIRGCFN7ETgILY5SY=
X-Received: by 2002:a0d:e907:0:b0:5d8:9242:47ae with SMTP id
 s7-20020a0de907000000b005d8924247aemr2975958ywe.19.1702287947149; Mon, 11 Dec
 2023 01:45:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231209232132.3580045-1-dmitry.baryshkov@linaro.org>
 <20231209232132.3580045-5-dmitry.baryshkov@linaro.org> <92ae6379-5126-4a02-ad30-b5dd43d4d251@linaro.org>
In-Reply-To: <92ae6379-5126-4a02-ad30-b5dd43d4d251@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 11 Dec 2023 11:45:36 +0200
Message-ID: <CAA8EJprf0WyE=HBo3Yuh13-m0HMKmH6L+-8xW8oDXWHZtoerjA@mail.gmail.com>
Subject: Re: [PATCH 4/9] arm64: dts: qcom: sm8150-hdk: enable HDMI output
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Marijn Suijten <marijn.suijten@somainline.org>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Stephen Boyd <swboyd@chromium.org>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 11 Dec 2023 at 11:31, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>
> On 10.12.2023 00:21, Dmitry Baryshkov wrote:
> > Add DSI outputs and link them to the onboard Lontium LT9611 DSI-to-HDMI
> > bridge, enabling HDMI output on this board. While adding the display
> > resources, also drop the headless ("amd,imageon") compat string from the
> > GPU node, since the board now has output.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> [...]
>
>
> > +
> > +     lt9611_irq_pin: lt9611-irq-state {
> > +             pins = "gpio9";
> > +             function = "gpio";
> > +             bias-disable;
> No drive-strength?

For the input pin with no bias? I'm not sure. And yes, it was c&p from RB3.

> Otherwise lokos good at a glance!


-- 
With best wishes
Dmitry

