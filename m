Return-Path: <linux-arm-msm+bounces-7920-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E55C838B56
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jan 2024 11:04:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 19B431F26AFF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jan 2024 10:04:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E13A35A108;
	Tue, 23 Jan 2024 10:04:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="dW4tmYxu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com [209.85.217.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7949A5646A
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jan 2024 10:04:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706004281; cv=none; b=JcgT789MbtFO0ABbaxPburs/1z3D5SWwbE0+vHHSSQKMpBncAJ89SIHdWuCX+Nw/ktPIA6j9PJeQ+aFiurRZghLs8cne57zA/r5kvf9kHbOUlunsmVUfOTQ09d7le3VpMKXkCFa+o5TTFSuh2E3XPgAj7qLlm+ggYO6hvTlrRm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706004281; c=relaxed/simple;
	bh=5vAc5dMR/Gkgelph0J80OaJPM3bIt5m4U43XM9yf3lk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kN08cw10sqM/llVp4HxcitrPFuRb22Sip7O1BcsQLTHOLTQDZQkDGRccf8TFt6HnWi+oN8BPgjqdIjdJnhCAE+5oW1zjxPjBpVcoFoH1wziF6FNZ3Zi9NUCUS6JDl/MGMH0SB1B+NVY3MZtm3Ti6q4vxJUFvWNOhDtyX7Kizfhc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=dW4tmYxu; arc=none smtp.client-ip=209.85.217.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-466fb1cbfe9so962547137.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jan 2024 02:04:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1706004278; x=1706609078; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5vAc5dMR/Gkgelph0J80OaJPM3bIt5m4U43XM9yf3lk=;
        b=dW4tmYxuZb2rn3K9uG5fmNHwHHvUMv+X86L2Jt0dPPcaDJ4QDCJUi/gsj5/QvLOJoI
         mtzFsZzLOT697oI9xtrrMdxpJpxyMpAgO1L9slgWz7qwk+Cn3ZFK4hPGaVG5tfz5LRGH
         s8S6TrnTyROExZX4b2tplmSMe6ePhHkvi+pHvVsjsf3G5h3lIEdUhl2DMy+coh1b7f1a
         HIMoTWuplUhyHhInIxooS0TtOz0dt6FkmjJZAyOKA/8nxBWr4B/NvUwmisJlMuaoe6qu
         11le9/fA/93btOu6tUv8yMMkCLa78Fel+zWeOov3HteFSnpDwfQms+nl3RaZdiy+7/A1
         jVEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706004278; x=1706609078;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5vAc5dMR/Gkgelph0J80OaJPM3bIt5m4U43XM9yf3lk=;
        b=H8aLr9WNOicFeFBX44qybq3hpTpPckfU8vjaocm8uCEZalLwZTe6FXcqosYq9u6nmK
         3b3KuON2a1wfLGi8+I0of8I+K0oWAQjUG0+bQixqc32lshNbxx5bTiyEDyh0R++WiKna
         sO5NJ9rJpG8WRQTTz+yYlkznr1lJWelNk81ddrmQK4Ck+apBcTtOEog1e/MNm8FpypmT
         rQLLucyjJlyZleSlH9Z2FMzQBpPzbnTScrrmj6cXOwJovmK/XXEuL9JD0qX3qcrAbPad
         I0+vJeSgXn/xLVQtvsoi+Y/nJ0qdbo5u2vrd6OEhBQnjGIG/2Wax1U+ADdAUvbiVV75H
         L1Zg==
X-Gm-Message-State: AOJu0YzoVg0WcAn12Lrqcggb3jQXnr4BFwIB9Ropfd92GMbpN6Za5xR7
	7wXRIzp/yny9YaZKI6Yr6Pk5jK1tYrriK4WUe7jVKylMoNK85oJT4eQqyCoFkdEG6bEzeuEg8Pz
	6RtBog+MxzA3/jCTyOVZC+76v+jJC/GAasQGnjA==
X-Google-Smtp-Source: AGHT+IHq+QhUDao5htbMwHdTS/OmUBt1hcN5E3DzlhYEGpGpjAeJ0k25WMpPPgDCK2so5vWCJusvRWnjPsYbXp0LbXU=
X-Received: by 2002:a67:eb8d:0:b0:469:b6a3:453f with SMTP id
 e13-20020a67eb8d000000b00469b6a3453fmr1561108vso.13.1706004278362; Tue, 23
 Jan 2024 02:04:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240122182158.69183-1-brgl@bgdev.pl> <98925264-badb-4954-b542-9287a0c7d184@linaro.org>
In-Reply-To: <98925264-badb-4954-b542-9287a0c7d184@linaro.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 23 Jan 2024 11:04:27 +0100
Message-ID: <CAMRc=Mc+GNoi57eTQg71DXkQKjdaoAmCpB=h2ndEpGnmdhVV-Q@mail.gmail.com>
Subject: Re: [RFC] arm64: dts: qcom: qrb5165-rb5: model the PMU of the QCA6391
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Abel Vesa <abel.vesa@linaro.org>, 
	Alex Elder <elder@linaro.org>, Srini Kandagatla <srinivas.kandagatla@linaro.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 23, 2024 at 9:30=E2=80=AFAM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 22/01/2024 19:21, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > I'm limiting the audience of this compared to the PCI power sequencing
> > series as I wanted to run the DT part by the maintainers before I commi=
t
> > to a doomed effort.
> >
> > Here is the DT representation of the QCA6390's PMU with its inputs and
> > outputs. If I were to implement the pwrseq framework that would be able
> > to assign the relevant pwrseq data to the consumer based on the actual
> > regulators and not abstract bt-pwrseq or wlan-pwrseq properties - would
> > that fly with you?
> >
> > We'd need to deprecate the existing BT bindings but unfortunately they
> > are already described as consuming the host PMIC regulators in bindings=
.
> >
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> Please provide lore link to the binding.
>
> Best regards,
> Krzysztof
>

This is the one:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Doc=
umentation/devicetree/bindings/net/bluetooth/qualcomm-bluetooth.yaml

Bart

