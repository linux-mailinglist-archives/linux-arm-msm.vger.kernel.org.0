Return-Path: <linux-arm-msm+bounces-24642-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D126E91C0AA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Jun 2024 16:17:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 888CD2815EE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Jun 2024 14:17:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A574B1BF312;
	Fri, 28 Jun 2024 14:17:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BHlT5rxF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE6501C0043
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Jun 2024 14:17:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719584253; cv=none; b=ACm+i/UPN0CJV99eCbLYGoez4lhiAefzCBQds53WkWqO77+EFZS2jPTg/w+y6/oWioTsf/B121A27ySyPV92qiz5qbS/Q7Kg++Hqo1z7EA6Cp4mqmqLiqZAaEMC6uDNu3JqOrwlbs2LB9CjkkddmPbowtHiXSIjAJuimPffBRHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719584253; c=relaxed/simple;
	bh=X5an3abTWdvL8qtlTK3g1nKT+T6J9UFiLnTAbmQhG/I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IU6zkUI1toinkAW05cLtcxPtBLwOm3wjm4ZIByklGhJei63mtH+X7vT9W83BuAMdxC07oqWbp0KblZ5jDUAcov9R3gWzGTLQ1SUpm/uKnJnmH5eA+WIyKbz2tB6Bi4dHAV9zYLrgqO6kp2LpdWm9CdNPrYq8TL9xxgxNWgv5Uqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BHlT5rxF; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-648b9d03552so6058557b3.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Jun 2024 07:17:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719584251; x=1720189051; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=DGMldhhxstZD2VHINPtgUkJtig9Dn80WfHZSFwMmp2Q=;
        b=BHlT5rxFHSWv8sv4ru8q0rkky44r4ZlHhYBkqNNJ20WkX2JHeZtr+OQioKivAjB3/I
         phXINjdp+vtyWvJXjFEesmy4d+4tLq6q1P6gLej/3idYnVj0HSAy+8iIZJAyjI9gRwup
         FPpM8TGz0ygI8QIlxfizj5lTpg7+XFOmJYUkx+QDaL/Mx0Rzclyt9K6lP0uny4Pt3Dax
         iR1hqKU9AWGGXj2+gVzePLrTBvpehgRI1wTnb6X5H3M1T6psO5uSrSQxIMKBHCEOl9CI
         +mDyo9m1GH/tslLRM4WpHe1ml56Sfwzd7n+HsTZvFVIXgT57pC7zLxD306guYUt3oCmh
         f64Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719584251; x=1720189051;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DGMldhhxstZD2VHINPtgUkJtig9Dn80WfHZSFwMmp2Q=;
        b=SLLyg5YqdKMtFwwrgWGw5HE2W3Vez0LWBDXWu84PnDbuFNJVfeeejMuDmlaURO4phl
         Gu/w3vQ4/j7p2PkU6yckzCtrKcCeF2G412JRUcgPCBxjIinXiEMYdWZHqJzq9z1tPayy
         BIr9FqaK5cXvj0iafsN8ZEt4SLm78bDkEzQVmIbmEFbbfAFe8BpMh4K066/y1RTwa2WQ
         dxoaBqg6okI+DAtZxxmZRfe55CqGmrI71DnQ0mT0KO3jDLcLJPtuWGKOwz7UZ77E8gdj
         Nve58V8oOa2BQXG/iHk2HK3SLw0hVEfigbaFyJ8u2Z2ab/OoRsEgP22oQolw5xajl3Np
         IwaA==
X-Forwarded-Encrypted: i=1; AJvYcCXTDI2bm3CkaqOu6EN/eSKVI7Fv1pUzWinEbRTdnwhK+9KE7U7Qw188zm0SSu5OYtZbSDImTfDOP6Rq19yQJEVINtqvv6tjqqyC6UcMSg==
X-Gm-Message-State: AOJu0Ywy1AAl5TtAaUcZUDAMrG4HChSVF4kmnt/57LJbyQkP2iY5jwDn
	qYJlia3SO97b+w6UhyGfuZIu1WqrrY173Px6TM2/9KBAhrhl0z/RxKxNg5tcRtMOIOZ+VvsKMNs
	tKNW5N8vpBlm9ela1bw0BN7quLXaXH05zhuQtUQ==
X-Google-Smtp-Source: AGHT+IEnqc4gKd8d3/4CtY+9Z2dX/nIjYsaIb1fXkGgwuAAIIiovBHfJVK2XUUGwxWXGgo5SDGMIF1irekTJMnwHlS8=
X-Received: by 2002:a81:de4d:0:b0:627:778f:b0a8 with SMTP id
 00721157ae682-643aba4654bmr165212747b3.42.1719584250582; Fri, 28 Jun 2024
 07:17:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240627-b4-qcom-audio-lpass-codec-cleanups-v1-0-ede31891d238@linaro.org>
 <20240627-b4-qcom-audio-lpass-codec-cleanups-v1-2-ede31891d238@linaro.org>
 <grpb57rhum4auor3n66mqd2tpmd52gzofbdog3vlmxlamfxv5a@2mhfkigl6ek2> <1fa1da22-07a5-4d76-b4c7-fc16e3df4b32@linaro.org>
In-Reply-To: <1fa1da22-07a5-4d76-b4c7-fc16e3df4b32@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 28 Jun 2024 17:17:20 +0300
Message-ID: <CAA8EJpq_2RUs3go6JZ+uVuJ5PJKzv0e2T8uS5QJMrB_JUAtNPw@mail.gmail.com>
Subject: Re: [PATCH 2/4] ASoC: codecs: lpass-rx-macro: Keep static
 regmap_config as const
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Banajit Goswami <bgoswami@quicinc.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org, 
	linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 28 Jun 2024 at 11:39, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 28/06/2024 10:34, Dmitry Baryshkov wrote:
> > On Thu, Jun 27, 2024 at 05:23:44PM GMT, Krzysztof Kozlowski wrote:
> >> The driver has static 'struct regmap_config', which is then customized
> >> depending on device version.  This works fine, because there should not
> >> be two devices in a system simultaneously and even less likely that such
> >> two devices would have different versions, thus different regmap config.
> >> However code is cleaner and more obvious when static data in the driver
> >> is also const - it serves as a template.
> >>
> >> Mark the 'struct regmap_config' as const and duplicate it in the probe()
> >> with devm_kmemdup to allow customizing per detected device variant.
> >>
> >> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> >> ---
> >>  sound/soc/codecs/lpass-rx-macro.c | 17 +++++++++++++----
> >>  1 file changed, 13 insertions(+), 4 deletions(-)
> >
> > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >
> >>
> >> diff --git a/sound/soc/codecs/lpass-rx-macro.c b/sound/soc/codecs/lpass-rx-macro.c
> >> index 59fe76b13cdb..3d8149665439 100644
> >> --- a/sound/soc/codecs/lpass-rx-macro.c
> >> +++ b/sound/soc/codecs/lpass-rx-macro.c
> >> @@ -1662,7 +1662,7 @@ static bool rx_is_readable_register(struct device *dev, unsigned int reg)
> >>      return rx_is_rw_register(dev, reg);
> >>  }
> >>
> >> -static struct regmap_config rx_regmap_config = {
> >> +static const struct regmap_config rx_regmap_config = {
> >>      .name = "rx_macro",
> >>      .reg_bits = 16,
> >>      .val_bits = 32, /* 8 but with 32 bit read/write */
> >> @@ -3765,6 +3765,7 @@ static const struct snd_soc_component_driver rx_macro_component_drv = {
> >>  static int rx_macro_probe(struct platform_device *pdev)
> >>  {
> >>      struct reg_default *reg_defaults;
> >> +    struct regmap_config *reg_config;
> >>      struct device *dev = &pdev->dev;
> >>      kernel_ulong_t flags;
> >>      struct rx_macro *rx;
> >> @@ -3851,14 +3852,22 @@ static int rx_macro_probe(struct platform_device *pdev)
> >>              goto err;
> >>      }
> >>
> >> -    rx_regmap_config.reg_defaults = reg_defaults;
> >> -    rx_regmap_config.num_reg_defaults = def_count;
> >> +    reg_config = devm_kmemdup(dev, &rx_regmap_config, sizeof(*reg_config),
> >> +                              GFP_KERNEL);
> >> +    if (!reg_config) {
> >> +            ret = -ENOMEM;
> >> +            goto err;
> >> +    }
> >>
> >> -    rx->regmap = devm_regmap_init_mmio(dev, base, &rx_regmap_config);
> >> +    reg_config->reg_defaults = reg_defaults;
> >> +    reg_config->num_reg_defaults = def_count;
> >> +
> >> +    rx->regmap = devm_regmap_init_mmio(dev, base, reg_config);
> >>      if (IS_ERR(rx->regmap)) {
> >>              ret = PTR_ERR(rx->regmap);
> >>              goto err;
> >>      }
> >> +    devm_kfree(dev, reg_config);
> >>      devm_kfree(dev, reg_defaults);
> >
> > Seeing devm_kfree in the non-error path makes me feel strange. Maybe
> > it's one of the rare occasions when I can say that __free is suitable
> > here.
>
> These would have a bit different meaning in such case. The __free would
> not clean it in this spot, but on exit from the scope. I wanted to
> kfree() here, because the config (and reg_defaults) are not used by past
> regmap_init. I mentioned it briefly in previous patch msg.
>
> To me this code is readable and obvious - past this point nothing uses
> that allocation. However maybe instead of devm(), the code would be
> easier to read if non-devm-malloc + __free()?

Yes, that's what I was thinking about. But it's definitely an optional
topic. Your code is correct.


-- 
With best wishes
Dmitry

