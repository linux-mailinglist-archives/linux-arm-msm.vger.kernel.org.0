Return-Path: <linux-arm-msm+bounces-5748-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 95CE281B6E8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Dec 2023 14:04:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 203CDB21BEB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Dec 2023 13:04:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20A46156D8;
	Thu, 21 Dec 2023 13:04:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YRxZzmPb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-il1-f175.google.com (mail-il1-f175.google.com [209.85.166.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFC2C73179
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 Dec 2023 13:04:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-il1-f175.google.com with SMTP id e9e14a558f8ab-35f519f3ea9so3388605ab.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Dec 2023 05:04:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1703163887; x=1703768687; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Fs/e9MeZesfWpR0gJSq5W4MUhBlmQTRQN91KHpHRCXc=;
        b=YRxZzmPbX3MoQv1tzLDq2yeekIvP/jzpSOT3NzQIH2ttKWlk1+wimM7uf3ej9giYlt
         uKAVxZYdgwMx7MrUiyoPcGX143hYZU2HLaCFP1JZ9cm0lWv2HoUWQV3qsqXUk2ERk3Tm
         ri+6TN+vq1lBZR0lZuYZUG+YkHnFj7cXnLbItDHE8MwtIHIm/xvdXO1Uhp2tAkckQPcX
         W3nrwW2esxMxBPwjcCC8Y/OwFZQTaXcUTPkvoiUWODXEOfBxR8z4dv87MvMfvfoUO0KA
         HFBJB8Ugj3Vw0XKqXvXMltYQbOgLmD1iyQyu7bfl7qk5izeoGFolQpaGmidahNhto7jg
         qfqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703163887; x=1703768687;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Fs/e9MeZesfWpR0gJSq5W4MUhBlmQTRQN91KHpHRCXc=;
        b=g/Deybw0Ad3H96CyoFbY8OBwsAIUPOY7VRNXUye9hhgVuG3N2gKq2UY+CqNgCzxmW6
         smNkAPbfOyMOS0Dx/7YxNtxXdyqkzAxSC1Aj2LtCxkcC7VL7VuCBl3/apNqJE9D1e3e9
         8xnIXTNL5B1xIRybrcle+7C4lRahyOv2bc2hjduMufAMiSB0Pnn+YRQnKXIRfE1JuG3Q
         Vm9zh3jhqA9tJuz95n0j0H1w7RsIaO+EPReUVrdCEToebJ+dU8ze6hI9E355xhcPM8yR
         RAcVrAMkePR/S9KCPwPd4eiKkwKt/NJRRkvZ8wMyRYJvzpqq+xnt4EXWnglgZowoodm8
         Y1ZA==
X-Gm-Message-State: AOJu0YzPGnaihzIhgz4bqv8g/fnC0zFgWVXD0nWDGKXNiidEihtpzrBl
	ILbbK4rDbD3iZuGdmfFfvy3FBHrfoOmq6Wf5xL3LIg==
X-Google-Smtp-Source: AGHT+IEcQ/qhM/HCfkhU+7e5HDDYE3nEr4TsCdNTTfentyyhZrmbiraH3QVG51wo4jYGji9DPRWtOoqov3OVlKaVhMM=
X-Received: by 2002:a05:6e02:3d05:b0:35f:ab11:1289 with SMTP id
 db5-20020a056e023d0500b0035fab111289mr6672760ilb.114.1703163886562; Thu, 21
 Dec 2023 05:04:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231220-sa8295p-gpu-v1-0-d8cdf2257f97@quicinc.com>
 <20231220-sa8295p-gpu-v1-2-d8cdf2257f97@quicinc.com> <8d206362-7d80-46dc-8474-871fc53abc20@linaro.org>
In-Reply-To: <8d206362-7d80-46dc-8474-871fc53abc20@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 21 Dec 2023 15:04:35 +0200
Message-ID: <CAA8EJpoEqKv_rWB8468WJzxqPA5w7u_zmGJJ0oKWAyaB9-f0eQ@mail.gmail.com>
Subject: Re: [PATCH 2/8] clk: qcom: gdsc: Enable supply reglator in GPU GX handler
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Bjorn Andersson <quic_bjorande@quicinc.com>, Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Taniya Das <quic_tdas@quicinc.com>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Johan Hovold <johan+linaro@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 21 Dec 2023 at 15:01, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>
> On 21.12.2023 04:50, Bjorn Andersson wrote:
> > The GX GDSC is modelled to aid the GMU in powering down the GPU in the
> > event that the GPU crashes, so that it can be restarted again. But in
> > the event that the power-domain is supplied through a dedicated
> > regulator (in contrast to being a subdomin of another power-domain),
> > something needs to turn that regulator on, both to make sure things are
> > powered and to match the operation in gdsc_disable().
> >
> > Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
> > ---
> >  drivers/clk/qcom/gdsc.c | 8 +++++++-
> >  1 file changed, 7 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/clk/qcom/gdsc.c b/drivers/clk/qcom/gdsc.c
> > index 5358e28122ab..d1139c895503 100644
> > --- a/drivers/clk/qcom/gdsc.c
> > +++ b/drivers/clk/qcom/gdsc.c
> > @@ -557,7 +557,13 @@ void gdsc_unregister(struct gdsc_desc *desc)
> >   */
> >  int gdsc_gx_do_nothing_enable(struct generic_pm_domain *domain)
> I suppose the name is confusing now..
>
> But at the same time I can't come up with anything that's less than
> like 6 words..

gdsc_gx_enable() ;-)

-- 
With best wishes
Dmitry

