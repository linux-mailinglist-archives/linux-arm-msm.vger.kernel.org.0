Return-Path: <linux-arm-msm+bounces-56989-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 12F60AACC25
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 May 2025 19:23:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1B5F97A8910
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 May 2025 17:22:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 326722853EA;
	Tue,  6 May 2025 17:23:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Hlk4tAXJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 481CD2222D5
	for <linux-arm-msm@vger.kernel.org>; Tue,  6 May 2025 17:23:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746552206; cv=none; b=LJpykULuzanVc4JA3aZKVprGJZJLHgC8S1YBYB0/COI550pFM9UTr4Uog+04wytw5tgJkMZY967/frxyzy/LFsZbD7OGScZRhd2cGfbn0C7SzVNskk1Q92qH/UXOHL9guHF7KEuwg4PhoZYOZI4j91x6wAu/QQC7J8e+xG5KT7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746552206; c=relaxed/simple;
	bh=fJVuLvipZaODLDOPSHa5k8oaRgCbH6Lmgvt9FeaV11A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SYnaUWUJt0kYgapLrE9JfniFxDJEIDcaDNFDOYvRpy1XYRsBC2g+qnJuR/584NtExxYH9Ba/xra+QQ+y0J3XYS21MGxmRQBXRdzKxqCgA7JKSX1iFJEMppZplGA8B/DVnj0XWw9Z9gmcbzfNrNXncSvIagiS5o6Dudk4d2LGFfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Hlk4tAXJ; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-acacb8743a7so17304566b.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 May 2025 10:23:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746552201; x=1747157001; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=CH+3YE8oQ2hbQKxa7VI83wPBVwlMSC91rnq+CEtI5/8=;
        b=Hlk4tAXJn2BqNfqtd8DkGZ6135dFLh+IEoNVVirED6/ojVoACWiWuTNY8suPfF2sLZ
         s+LRgXn5bpBBXv0fXe4A7cqCSyugDFhYXi8zllDMkKmxji+sUh4TdOnGbj7al/Zi6oUt
         rQQu4934vzqmWlxavoWBTCWuQT6RbVgYwZd0yO/X9cbvlUUCVNIm3vPqoKRf5fY0IkpR
         PTICC6qt730QQ014iZSK0SpaZD5z6x+tnsyEHgJSl6s1TBsMFmgW8/6AJHw6KiIaU/oa
         +Ee1MwfzW/I0NrAuWtUdMm/Bdz4yDmsfrU/gMuTYZx1xP3MlTJcMik9j/tJuZzu5Mie1
         esOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746552201; x=1747157001;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CH+3YE8oQ2hbQKxa7VI83wPBVwlMSC91rnq+CEtI5/8=;
        b=PRCmI5+UKKfU1PSpel5jvsFLj8aWh6bqyVZXqtjIV9pjX43rCWz1IKXWDR3ozWpSVU
         TjijT5o1CnjM64mOa0qwS31GnYUBi281si0CjJWaeonveV4xuLTSPoyJOUpUcBuOBUM6
         I9Ck+Bj0keb4QeoiABlmCpVJ/0cWUgx2Fny3aG9f7JepQP28QT80VkuEAk6ykCVdK+Az
         0e7PyiWhObBVTShHATn1MPXjhjf7Z5AJ2LVVhUJ4LPgtJsyp2Bd6nPCiPV1u/dFOSbrd
         KrDEfSVegLlUolA1qhhc6Nq2NhSQR5tj6m7u8g+D1Zq1oWNJL3s4nF/KUSqR7RLBRxPZ
         KhHg==
X-Forwarded-Encrypted: i=1; AJvYcCX4h89sLnlpbHbg0/ULe/VFPTC01PJfwn/WbzxxSGmccBuLcLjAfXk4ODcYaZL4DweeAA88lurOz+5CglnL@vger.kernel.org
X-Gm-Message-State: AOJu0YzSQcyV1AW8Nw2oAEwkcWbFPFN4q0DaZM25wJ/Seo0aXavoLkFl
	r8rYEYqbF3LMNy/gw1Mi2GGJqJVlMxt34EFcvdcvlAeym8AzyvE3DrJJo4lvp6RFqnjJglEqB/S
	PExtY14vpHHbfk7VSPcSRutwAvuT024XI2I3rBA==
X-Gm-Gg: ASbGnctM6R+dqrs/xejKdnrP3d2molPR9F+dc6U+bYprCrl2mK46X34pFvrIVY1ZLU7
	zZOLyOp0m1wAqg3vc1A8cA7hjHHkMVVJlboP84+ilE9u/+9jMB3HI0utUniWYxPNYd7sxReD08U
	YmmkSl6O2B9TFNN0chV2E0l97VUIu1XBh3khNaxQ6h8lk6ARFYjILDhg==
X-Google-Smtp-Source: AGHT+IFnrJNrgy1m/oRww7px8z7UAiAL/GjQDOBzHgoOoLO675fM7OGX500WyhrjcbjscragoGRNgo+LSuwB+tFMAUw=
X-Received: by 2002:a17:906:c10d:b0:ad1:8dd5:e69a with SMTP id
 a640c23a62f3a-ad1e7948a11mr58747966b.20.1746552201542; Tue, 06 May 2025
 10:23:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250503-pinctrl-msm-fix-v1-0-da9b7f6408f4@oss.qualcomm.com>
 <20250503-pinctrl-msm-fix-v1-3-da9b7f6408f4@oss.qualcomm.com> <CACMJSesbNz1Q5S4EDDk_O+oUfw8c6MQdovUAA_q2EZzuG2+i4Q@mail.gmail.com>
In-Reply-To: <CACMJSesbNz1Q5S4EDDk_O+oUfw8c6MQdovUAA_q2EZzuG2+i4Q@mail.gmail.com>
From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Date: Tue, 6 May 2025 19:23:10 +0200
X-Gm-Features: ATxdqUHOS3jqOuPdOa1ceB9XoLev0t0jfeVU0XwwsL27s3_XDnEK-YfaAN-y_GE
Message-ID: <CACMJSeuRDNo6Si+U-ACCgGnmW5H=D7Bcf32hqxxaLObt+_geew@mail.gmail.com>
Subject: Re: [PATCH 3/4] pinctrl: qcom: switch to devm_gpiochip_add_data()
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Guenter Roeck <linux@roeck-us.net>, Josh Cartwright <joshc@codeaurora.org>, 
	Matti Vaittinen <mazziesaccount@gmail.com>, Doug Anderson <dianders@chromium.org>, 
	linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 6 May 2025 at 19:18, Bartosz Golaszewski
<bartosz.golaszewski@linaro.org> wrote:
>
> On Sat, 3 May 2025 at 07:32, Dmitry Baryshkov
> <dmitry.baryshkov@oss.qualcomm.com> wrote:
> >
> > In order to simplify cleanup actions, use devres-enabled version of
> > gpiochip_add_data().
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> >  drivers/pinctrl/qcom/pinctrl-msm.c | 6 +-----
> >  1 file changed, 1 insertion(+), 5 deletions(-)
> >
> > diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
> > index 88dd462516c76d58b43d49accbddeea38af8f1ec..b2e8f7b3f3e3d5d232b2bd60e5cace62b21ffb03 100644
> > --- a/drivers/pinctrl/qcom/pinctrl-msm.c
> > +++ b/drivers/pinctrl/qcom/pinctrl-msm.c
> > @@ -1449,7 +1449,7 @@ static int msm_gpio_init(struct msm_pinctrl *pctrl)
> >         girq->handler = handle_bad_irq;
> >         girq->parents[0] = pctrl->irq;
> >
> > -       ret = gpiochip_add_data(&pctrl->chip, pctrl);
> > +       ret = devm_gpiochip_add_data(pctrl->dev, &pctrl->chip, pctrl);
> >         if (ret) {
> >                 dev_err(pctrl->dev, "Failed register gpiochip\n");
> >                 return ret;
> > @@ -1470,7 +1470,6 @@ static int msm_gpio_init(struct msm_pinctrl *pctrl)
> >                         dev_name(pctrl->dev), 0, 0, chip->ngpio);
> >                 if (ret) {
> >                         dev_err(pctrl->dev, "Failed to add pin range\n");
> > -                       gpiochip_remove(&pctrl->chip);
> >                         return ret;
> >                 }
> >         }
> > @@ -1608,9 +1607,6 @@ EXPORT_SYMBOL(msm_pinctrl_probe);
> >
> >  void msm_pinctrl_remove(struct platform_device *pdev)
> >  {
> > -       struct msm_pinctrl *pctrl = platform_get_drvdata(pdev);
> > -
> > -       gpiochip_remove(&pctrl->chip);
> >  }
> >  EXPORT_SYMBOL(msm_pinctrl_remove);
> >
> >
> > --
> > 2.39.5
> >
>
> If you're at it then why not remove this function here and the
> callback assignment throughout the pinctrl/qcom/ directory?
>
> Bart

Ah, it's in the next patch. I'd make it one commit though, no reason
to split it IMO.

Bartosz

