Return-Path: <linux-arm-msm+bounces-20902-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DF4B8D2F00
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 May 2024 09:59:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 40D381C20C91
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 May 2024 07:59:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82ECD168C04;
	Wed, 29 May 2024 07:58:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CSapUuEn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A91E016729D
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 May 2024 07:58:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716969538; cv=none; b=PFxd7hF/Ps4zrNjiHvgoFVY382X6O4K9Ehj9AmyefJVcu4sVOdF9zTKu5etQqjCsIQ4zuFzdJtgE/z1qF22rSFBI/TxV4bivTSlqLhPk0yDengVjOUYLPP9EGOtLxb7aE//qwMp0bFxI19p8DpaN6lS6uDes+uOAedsXQLROVio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716969538; c=relaxed/simple;
	bh=eV+TNUFOPSfrYTI5o/AT0Xf0B/1eVTyXgi/p7HYzCZ4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DEqSyyTiizK1sGiIC1QR8PFw0leirc6PDWGc821gLuXqJswcGDF1Wb+OEpDYdzCu7kqQShmCfnmP4h20U6UJbREIdkOJZovl3fOP4I91JmPY4rqHD0X9DJ1tA1JppuB0lYroH9tPcLV1+/tBFEEmlI9GGPBqKlEIuya3JxX7GHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CSapUuEn; arc=none smtp.client-ip=209.85.219.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-dfa52560cb3so24966276.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 May 2024 00:58:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716969534; x=1717574334; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=GT8+P4efjvmYbXaUJmIzbqIMG2b455xekjxbQfC1iiU=;
        b=CSapUuEnkLxIDRYPzlmgDUYCQXwHj2EoNWRp1wPZAbEy0F5LkQI8tdc/SR7QYki8lU
         ObCs8C/QzR2abZNeSKwTI6+NO2SdG737RlGFE2QeHvsbIV41NG4q1zfk3xMRNqHQdHf6
         mh8+nRNe7vuA8Ii9gO61N57Tpkj9uxyKanNdu3TEITaIJJ6AE1Wt41uIG9Osn6relYT/
         E5dkzFT6mBZK83bO0Hp5ugYyghBcY7XJgZQ/DEc9KWNbSvxbmNrhZwrFZ8xK7tqnQ4pw
         MdcZuefHH0YBgMFYnlNwRwoC2G04SNhf8yvjjFnvco5lPEojQt6Wfio2EPllMOljeGxz
         NrCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716969534; x=1717574334;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GT8+P4efjvmYbXaUJmIzbqIMG2b455xekjxbQfC1iiU=;
        b=VTetB7GGdPJoDFbf+Bov5ABLHTt+5MfiaHYN06c4d8r7wF/X0JpC9BL5okgzfN8kh0
         1ZF1mhAbWfzQ/EVxBU/EMF76NG+oJ0CYcLOkU8bN5ddvQKE+Ord4Av0j6pcrB0DJd8Lm
         rrbMXhIqqZ3tVy0nZYh69v1gtTFHwwfqYKL7eI6Fj9+1+AzzVqanqlhzyWT4BL5DnMyc
         BW7U5j5P4UG8/NS25Pr95E7VX/3VO4+gXaILkThx1JkTrzjZ4St72maVYBk7tZZSrPui
         7PJxUfJjsTay0CU/9sKXVTnGpuSyarQTigQIb+9NamUC/ast1LtmexISsHlwHlxk3rTS
         yN3w==
X-Forwarded-Encrypted: i=1; AJvYcCWCjD7SfN3JwC4FmUscQgWxOxITf3/k4Gaycv1FmLfI5Z6BLN3UxvadQMb+jxiH7KI8+f9r4yHbKce1kjNnmDXBW/zcgZ3F0M2KQNyBrw==
X-Gm-Message-State: AOJu0Yw0DYuV6dZpP3NqMXvwSW8SNMjrz+amS7r9e/1L3H76Sc+pp6vx
	zu4q/fXYqK9gzH0pCBw97k9FJ3MeQs+hxnePz0e0LBlVMdPEkGxsy1XRgkMXNaIOT9c+mtv9NY/
	XEM1gQwj6WAILhra7m9l0rajPGVUqIW/XQ1ibCg==
X-Google-Smtp-Source: AGHT+IFr9iaSo3OLjDZIJEEcFIuIAb4qCzBlRghHqswxxDMpC2NQvQSUVQp1F/1cySEOwsza82fXospyKoYSnOhYZHA=
X-Received: by 2002:a25:ab26:0:b0:ddd:7456:d203 with SMTP id
 3f1490d57ef6-df7722176bcmr13800190276.41.1716969534655; Wed, 29 May 2024
 00:58:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240528-qcom-gdscs-v1-0-03cf1b102a4f@linaro.org>
 <20240528-qcom-gdscs-v1-1-03cf1b102a4f@linaro.org> <9a1bbcbd-7f46-4266-8f08-5650a42234d4@kernel.org>
In-Reply-To: <9a1bbcbd-7f46-4266-8f08-5650a42234d4@kernel.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 29 May 2024 10:58:43 +0300
Message-ID: <CAA8EJppu8kKC_zXRBAK9XAaPZ7SYShiZwpfQGYpC10Aj28Lxjw@mail.gmail.com>
Subject: Re: [PATCH 01/10] dt-bindings: clock: qcom: split the non-PD schema
 for GCC
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Taniya Das <quic_tdas@quicinc.com>, Robert Marko <robimarko@gmail.com>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, linux-arm-msm@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 29 May 2024 at 10:34, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On 28/05/2024 22:43, Dmitry Baryshkov wrote:
> > On some of Qualcomm platforms the Global Clock Controller (GCC) doesn't
> > provide power domains. Split no-PD version from the common qcom,gcc schema.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
>
>
> > diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc.yaml
> > index 788825105f24..e7ec15b1780d 100644
> > --- a/Documentation/devicetree/bindings/clock/qcom,gcc.yaml
> > +++ b/Documentation/devicetree/bindings/clock/qcom,gcc.yaml
> > @@ -14,27 +14,14 @@ description: |
> >    Common bindings for Qualcomm global clock control module providing the
> >    clocks, resets and power domains.
> >
> > -properties:
> > -  '#clock-cells':
> > -    const: 1
> > -
> > -  '#reset-cells':
> > -    const: 1
> > +allOf:
> > +  - $ref: qcom,gcc-nopd.yaml
> >
> > +properties:
> >    '#power-domain-cells':
> >      const: 1
>
> So what's left here? One property? Not much benefit. Triple-schema
> (include something to include something) does not make it readable. Just
> do not require power-domain-cells in qcom,gcc.yaml.

And add it to the required list on all relevant platforms? Ack, sounds
fine to me.


-- 
With best wishes
Dmitry

