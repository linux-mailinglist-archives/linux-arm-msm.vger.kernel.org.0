Return-Path: <linux-arm-msm+bounces-11611-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F8868599AC
	for <lists+linux-arm-msm@lfdr.de>; Sun, 18 Feb 2024 23:07:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 67D7A2816FE
	for <lists+linux-arm-msm@lfdr.de>; Sun, 18 Feb 2024 22:07:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07D0D745DB;
	Sun, 18 Feb 2024 22:07:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mgJf9XqW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com [209.85.219.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF6A6745C2
	for <linux-arm-msm@vger.kernel.org>; Sun, 18 Feb 2024 22:07:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708294059; cv=none; b=NkYZrv0Uu9C0SzVCkMOvrIW1UgkmtZZ5VrmuJHaEkvyaYfeEfAhGp46ndBW64x2TirZgObeK9f4mq5a7I/GhzItA/PyVbFiD0iYai0k3LBl2DFaleydtoNbxiVm6Fhx1NfXd57HyxVASQFFHcX6JEcGbITe53rTx/YD9r9/F9Ms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708294059; c=relaxed/simple;
	bh=noyT0NVbOw9JrKezMpMB75c/1hxZ5UzrFj4VHYRvb7M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mEXMMIIjAcRWrh2M+lDsIgrO4y8ES0Fd22c0j0ZxSMkEPREMzwpd8byDBeYY7FDQSUSdAJ8mjPxQ7zm0VMBuFfYj6jJZMLjgqrFDOOEC2VphZyv0xCPtw9Pa/LQXOONfIxExHbJ5q8MWmP/7FZE9SQU2XLNyRGcnv6rdr/w0WF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mgJf9XqW; arc=none smtp.client-ip=209.85.219.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-dcc80d6004bso3725179276.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 18 Feb 2024 14:07:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708294045; x=1708898845; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=w/A2VqH3T77p5BaaLS4Ba0fiwlO0C0XzwKCCFd7AcBU=;
        b=mgJf9XqWGUumAC+UNXonICacLre696tHk+hJsYaLF7sJ6x/bEtcK6DUC0/6nP3/IBg
         qyfTzye5aMjFKYCAMX5XGbMCcbdWZPMvEV9zLzwlhV/0URrdFIHHKjB4vaoBD2gT/dgy
         cGiivjyKiEzSzg/aDXSs8UX6S0/wbP2y02PntYndRAtU080d9vrshuVtt6pNVMVgSQVA
         dgqlyvmfRTwt89cWHf8QnuOsx2EPp35CATQ9sa14ZCqgSQg8oFwTkvCAE+LtHqaBCcQ+
         NG1Z2/Ld/PSm72h5uH21ddClzCzv8NsDRz/CsnE/QCwQkPrFFHFBYWsEWK/n3hKD6iAv
         RO8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708294045; x=1708898845;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w/A2VqH3T77p5BaaLS4Ba0fiwlO0C0XzwKCCFd7AcBU=;
        b=Vb7FcsTsvNy+w+qGS/GBjOWI04OSEoled1/dpEdBDrl2nZFtBPREO1Xqqc2sPFTeAn
         hn4sWKLAN+R7ONU+3q7Tf00kqZDCkb1My2s3BVD9xG3F8jr2lpARMGpaNWbnD5KEo/Vy
         cbONkoO1LMQijN2y05259RwmGtKwfNPhgs2+Snok4e7KRXTD/vA2dow5htF907E1TA+/
         mwxYVTmPQ8y1YvzC5NpO7YFU16XInFJbiOgM0jGEGy8EBSFFdlstrM8k4iCXityZhyw6
         siJr4ox62H+qaSoykUxVScUwKtSumjbjQMGRnbN0amcziSOCa15RcMllWx392VED0yAq
         D4+g==
X-Forwarded-Encrypted: i=1; AJvYcCV1JZ0ur1H+PgGdmxxhafmcgiBYS+k2HwOdUmrgtcy9ySzjObQktYWJ5ccw787EDfbjp/Adj2Olb0Dhf60pa7V9ifhyMK//tP3liIYF4Q==
X-Gm-Message-State: AOJu0YxK3PHHYad0Zgfnb0V5S/7aUJEkAmBdHbJcymFkJSCu6jkzLyGg
	rh4bxk6dylYhv+xHUoA4wsPjmhjUeisFMEi1KzQyrWzgw3WSLd475ThgMruW62VQLfUepzW7ZIU
	Txe6cbe47fmnT/hYtNd6F0RGVQyVyz9cWEgsqeQ==
X-Google-Smtp-Source: AGHT+IELeLyIUJs5SAO08A3FKHyNU3pAuY4NxArUAv+xkFbNbCBUKbAWybGbjMfZ1EVD+aa6gQDaSPl5tjX9WAb5sEI=
X-Received: by 2002:a0d:ca12:0:b0:607:84d9:9820 with SMTP id
 m18-20020a0dca12000000b0060784d99820mr9366084ywd.24.1708294044760; Sun, 18
 Feb 2024 14:07:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240217163201.32989-1-danila@jiaxyga.com> <20240217163201.32989-4-danila@jiaxyga.com>
 <6bf11ccd-ff08-369b-913f-277c189afb76@linaro.org> <b0b732b8-456a-4021-8277-cd51f01ead17@jiaxyga.com>
 <44c669a0-3722-4a58-be78-0c91f0573ca1@linaro.org> <60728953-bdf0-4a06-a90a-d1191d41962b@jiaxyga.com>
In-Reply-To: <60728953-bdf0-4a06-a90a-d1191d41962b@jiaxyga.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 19 Feb 2024 00:07:13 +0200
Message-ID: <CAA8EJpqxoCwqOWuWe4B63swO_hvREhN2czOpe0wM5mt-FaWUgQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] arm64: dts: qcom: pm6150: define USB-C related blocks
To: Danila Tikhonov <danila@jiaxyga.com>
Cc: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, andersson@kernel.org, 
	konrad.dybcio@linaro.org, lgirdwood@gmail.com, broonie@kernel.org, 
	robh@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
	gregkh@linuxfoundation.org, quic_wcheng@quicinc.com, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sun, 18 Feb 2024 at 20:53, Danila Tikhonov <danila@jiaxyga.com> wrote:
>
> You are referring to Dmitry Baryshkov, as I see. But Dmitry has already
> reviewed my patch (message above).
> So it would be rude to change anything without his knowledge. Let's wait
> for his answer.

I missed this point, so please update the IRQ flags accordingly to
PM8150B, as Bryan has pointed out.

>
> ---
> Best wishes
> Danila
>
> On 2/18/24 20:14, Bryan O'Donoghue wrote:
> > On 18/02/2024 8:05 a.m., Danila Tikhonov wrote:
> >> I know that some interrupts have both for PM8150B, but for PM6150 all
> >> interrupts are rising.
> >> Please look at the downstream kernel:
> >> https://git.codelinaro.org/clo/la/kernel/msm-4.14/-/blob/187022f2721d584ac4ec92c0ac1af77da487521d/arch/arm64/boot/dts/qcom/pm6150.dtsi#L319
> >>
> >> https://git.codelinaro.org/clo/la/kernel/msm-4.14/-/blob/187022f2721d584ac4ec92c0ac1af77da487521d/arch/arm64/boot/dts/qcom/pm8150b.dtsi#L292
> >>
> >>
> >
> >
> > Please take a look here, I think the same logic should apply to your
> > patchset.
> >
> > https://www.spinics.net/lists/devicetree/msg665558.html
> >
> > ---
> > bod
>


-- 
With best wishes
Dmitry

