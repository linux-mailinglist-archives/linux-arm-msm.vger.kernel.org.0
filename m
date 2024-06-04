Return-Path: <linux-arm-msm+bounces-21686-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EE8B8FBFE5
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Jun 2024 01:35:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A11DD284389
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Jun 2024 23:35:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B11F14D708;
	Tue,  4 Jun 2024 23:35:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ypqfFRu+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3214E14D43D
	for <linux-arm-msm@vger.kernel.org>; Tue,  4 Jun 2024 23:35:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717544107; cv=none; b=hWFxurMZOsIYaZhKcWOJUxiVFdZ3OTi+z0TSTb0P2WUCXqALMtjro2DxDpXGlZqe8nQiUucpxvIwhS65i3sHPgODKymYXi3PS64gb4XOnn5cOc9F2dlbNTJodxVTi6KKIyfSJCFXTMqSnz9A3x5TXUkbF83qk06ktIY8XavOe0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717544107; c=relaxed/simple;
	bh=ljUZwH0wfZx09w13YocP3uzPKY+TNatl/gsxBoW/3SE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pmeyR1q/JuPcktgVem9/G8WfhndvLnpjKP8i75InK72bjOF4MUJJF+uepttrOureS3ibrSB++AA1UUtQgZqa3JzY6LSmgFfdtu4+xG7nZPSdOyWwW2qsIS8n1Ix3Gt/6yoZlxxmGBjwwDd9gjvwwaVzO/k9WdEc4zv4wrkq3Zqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ypqfFRu+; arc=none smtp.client-ip=209.85.219.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-dfa71ded97bso313558276.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Jun 2024 16:35:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717544104; x=1718148904; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=U5F59Y5F210ARWzU6IxQVbEufFPE5a5xbmD+TtWexxk=;
        b=ypqfFRu+uPKXPjMQPgBOuDv7GombmJURsrNzvb1dhGyJL++QPuKNJMwtjg7mzX2AGO
         EpJEE5DgnWwRbsoAbNI5wz4OPG1sEnjRhFT0XnPgxPWcjCEj3pZoXjhI6otg8UvBHBYO
         xl7w8Dcmya++BneGdZupinvOiyoHiLazgcFy+i1VS0V1rLcOMnh0f53A4K0rGqFAB1Ut
         xQlM465D31D1Jx6qDraao/DDsh5dKo0pArqVwUWIfXHPmkJeAmWgQWe/LfNLRmzsz4al
         rwFDPwRo2zLhMz6Ho4YTCJM+GDISJ87GtkipLCy4iQwWlfly7cXr8iDr1MiZo5t1Ofly
         jpwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717544104; x=1718148904;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U5F59Y5F210ARWzU6IxQVbEufFPE5a5xbmD+TtWexxk=;
        b=T/6C8lCOe0+ivJ8dCsDr97Uw5nEt/LctDpUG0JT8NQCa7xybxzXtxJu/YNoZVVqvLh
         qALAvu57a2kad2Bektd6FdADtQ+hguyZz8J4fQWNDCCFsgrv+P4y03umNl541okLBr2V
         an2Xe+UNzmvG3M80ke2r91HqQVIu9L+wtpJ/ohG5oR+cioe+D1E06zISGiblrr08PEjA
         aEmhSAqYsX4Csrnc96xzNN9L/hNPjyuHIZCbcNUpYiuDQl2Vd5JNH2Szw+nPOFvnR/Po
         l3mo4YuxsdeyjxJTMG7r1xYqYB+CFN4fxRzOpj7RLeDKULKd0CUJmWinjPnqHDBZaIRC
         U53w==
X-Forwarded-Encrypted: i=1; AJvYcCXkA4Gor05lYaw2/8nqOMcSh7vvj8n6r4jPYp9AtdJdVdi8TY9FJ7DYO5V0jBa5Fm6y6qc33UCUI1bYRWHNfyZQci5Q2K3P9Av727L7rg==
X-Gm-Message-State: AOJu0YxkpJ0LCRkoU9g1e7q8TbwGCGQHLZudMC71vqG31o8qjIIb7eIc
	u4DGiIlUT8SnLsQAJD5i+MkanP4DPWlZAI2lQqdSIGC20guFAaBgMJMNXFsl5gJN2uUTLeoEN3w
	uvuYctJAkwq2XSgJsz8pJRF1EU04tBBFNGYWY3g==
X-Google-Smtp-Source: AGHT+IFdoTto+OyWazk/s95VUduCXVBIPATg60NiVpHEaONaANNsRtZaVqiKS3evRYjowXOhqIkWoq2TlII04CwtgN4=
X-Received: by 2002:a25:dcd0:0:b0:dfa:48d9:b0 with SMTP id 3f1490d57ef6-dfab8b0312fmr3125447276.22.1717544104107;
 Tue, 04 Jun 2024 16:35:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240528-pwrseq-v8-16-d354d52b763c@linaro.org> <20240604232347.GA740032@bhelgaas>
In-Reply-To: <20240604232347.GA740032@bhelgaas>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 5 Jun 2024 02:34:52 +0300
Message-ID: <CAA8EJpomPLQmQbW8w3_ms_NMKHoSPcqBa7f2OhNTTOUSdB+9Eg@mail.gmail.com>
Subject: Re: [PATCH v8 16/17] PCI/pwrctl: add a PCI power control driver for
 power sequenced devices
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Marcel Holtmann <marcel@holtmann.org>, Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Balakrishna Godavarthi <quic_bgodavar@quicinc.com>, Rocky Liao <quic_rjliao@quicinc.com>, 
	Kalle Valo <kvalo@kernel.org>, Jeff Johnson <jjohnson@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Srini Kandagatla <srinivas.kandagatla@linaro.org>, 
	Elliot Berman <quic_eberman@quicinc.com>, Caleb Connolly <caleb.connolly@linaro.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Alex Elder <elder@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-bluetooth@vger.kernel.org, 
	netdev@vger.kernel.org, linux-wireless@vger.kernel.org, 
	ath11k@lists.infradead.org, Jeff Johnson <quic_jjohnson@quicinc.com>, 
	ath12k@lists.infradead.org, linux-pm@vger.kernel.org, 
	linux-pci@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, kernel@quicinc.com, 
	Amit Pundir <amit.pundir@linaro.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, 5 Jun 2024 at 02:23, Bjorn Helgaas <helgaas@kernel.org> wrote:
>
> On Tue, May 28, 2024 at 09:03:24PM +0200, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > Add a PCI power control driver that's capable of correctly powering up
> > devices using the power sequencing subsystem. The first users of this
> > driver are the ath11k module on QCA6390 and ath12k on WCN7850.
>
> Can you add a little detail here about what benefit we will see from
> this driver?  E.g., something that doesn't work correctly now, but
> will work with this driver?
>
> > +static const struct of_device_id pci_pwrctl_pwrseq_of_match[] = {
> > +     {
> > +             /* ATH11K in QCA6390 package. */
> > +             .compatible = "pci17cb,1101",
> > +             .data = "wlan",
> > +     },
> > +     {
> > +             /* ATH12K in WCN7850 package. */
> > +             .compatible = "pci17cb,1107",
> > +             .data = "wlan",
> > +     },
>
> IIUC, "pci17cb,1101" and "pci17cb,1107" exist partly so we can check
> that a DTS conforms to the schema, e.g., a "pci17cb,1101" node
> contains all the required regulators.  For that use, we obviously need
> a very specific "compatible" string.
>
> Is there any opportunity to add a more generic "compatible" string in
> addition to those so this list doesn't have to be updated for every
> PMU?  The .data here is "wlan" in both cases, and for this purpose, we
> don't care whether it's "pci17cb,1101" or "pci17cb,1107".

These two devices have different set of regulators and different
requirements to power them on.

-- 
With best wishes
Dmitry

