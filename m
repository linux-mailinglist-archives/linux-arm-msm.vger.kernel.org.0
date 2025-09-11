Return-Path: <linux-arm-msm+bounces-73083-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DE53AB52D18
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Sep 2025 11:23:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2FE59483851
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Sep 2025 09:23:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65BA62E9735;
	Thu, 11 Sep 2025 09:22:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="RprQKS9S"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B6831D8DFB
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Sep 2025 09:22:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757582574; cv=none; b=FrxFGqpyMrZS8j1npCHwzimXC0N5OgJVvneXlPf2dG6R/ZufvQ5gS9OOaC1aa/cuXm7mX1pGqDxZoSNmmKlNWJUyyLCtA6cveggf/UI2nyoQwBHBBiCZE/SNg72TeLtexh7xZGCz0Hecn1infL+oYTa7wBtZEVUkX2LP51sQVHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757582574; c=relaxed/simple;
	bh=91x2IFdC5zaQq2SHZjMI+Nt0EODRaAqqDPguE5q5Oqc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mSbVqe8NGf3/hzNFwiqilMQkMFcJ3PTYNyToiCANR/UwFFz3MmUMuNiTkEAxSW2V5BWj4/3B12LhmN9mHSn/+P6BozmY+Zi45kl7g/th5wUPQ1btp7uBtY5nVMBvVGVXnAoKRJgyzw4v9CvNMQD8kSEwFdrXdmuX/L0RArsJOCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=RprQKS9S; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-55f68d7a98aso485408e87.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Sep 2025 02:22:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1757582570; x=1758187370; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xClIjfrvAbF1xtvQXj+QQGe/hhZ9PeRp4erbvUtEvwI=;
        b=RprQKS9SldtTTCEsP85MNs0KXeUs27BEuVZv8j1xyEjbRYIpcyA7ogn5HnU4FZ5Hbf
         ELhOuvdT3vED5cjxMlyT4QwoK7gVdhtTJfpinsDeTJEifmBhwaLiljPUBVacwdP5r3D7
         C3/69LcaiiT1r8x5tlmB/xgtX7xve81EYhamQj1iCO52CCmcJCrTffyNOWwzH5i2a1ao
         XrcVjiDCXk0T+KPZA3FZJZUF7fEulAhkjzHPqd81h+TNI6BaEDq4Iu864G5pUiKXDzul
         dD4DUJWPQWMLgWxgduOtYTapfxsJ9lF6iDvZ84B+WeesovPlG4891C4YoSz3suIfaC48
         4Flw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757582570; x=1758187370;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xClIjfrvAbF1xtvQXj+QQGe/hhZ9PeRp4erbvUtEvwI=;
        b=XeHN0TTwPFPuBPq8bR1N9K8jnzklRp0ol3/IEj+VmWiap+8aDC2zms8DMcfpboNVsU
         kWwSi5ltJ1r3LTZ6XFUX0VCjJ7r6TK6bEExBqqwrIieGdcYxB8h12CT1vk7V46myLXwl
         k+jcA9P3dJArz+NhKuFAo1Kq+0TrpQ1yeMmXg2AKSBswq8eHwrSmTPX55rLY7cBuLBfE
         R9hZIPjE1RskrVd0FLod88qYZCPURxui0KgBw7YK1RZ3flTxiszS+5deNxUEYm1/HdGq
         4olH/QPLaOmYnYUfdsy5XfB6p9f3uA/l1I809OMNNzrr33c6QyMqbhL2PCTHDKoZAPwT
         YF9w==
X-Forwarded-Encrypted: i=1; AJvYcCUQ+R5sGykjgZJxRMyjaAaRojNDRJXfxMD0aneflJ0s6261YaR00A97BoVCXuJVp/tSGRN0iB8K6RQ1Phlb@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3NMYt1ykT/WCYJYcIaFySt9Iu2oi8A0w6mv39pZEmq6tUssYK
	LnPf8s/Y7He4Fxd3G0jegCTRJGO5mREbxsmKuQazSF6gB9acU9LRD+60+lK6ylw46uWGUQE7h5G
	w8ddje/McYtxAmSCH6YYGMwhLXTRYL6oFUT07DMdZDA==
X-Gm-Gg: ASbGnctMmSPy6Umxj/z3OeNcmYpilLQ72927/zWBym+qsFM1/3y4I00aVOGX2cux/39
	+kG/mPES8mzBmQdzr3okS0l0p2FeltSNiqGAfpRB4kODG/Ndul/629Kj05+a8OBme8YNmZ1jc2Q
	FOyNMEy8kVWKgYfDnLsvPXC4RV4h/UiuoAwUsjeG2ggt8Lk+e9d/jwU6+0kw03wRIhAhjZ64If8
	VmYXyoveaCaNYCbbg7wj/eAyY7nL7KA5v9wix4=
X-Google-Smtp-Source: AGHT+IFsnkGxYpIZ2no6WEiKw7trlyFszU8hXSZ7C1IoobeXgikTcX6nfxEwSn+eF6XIvxGU/64B9GjviqVf+lb37jo=
X-Received: by 2002:a05:6512:145b:10b0:562:d04d:fa0f with SMTP id
 2adb3069b0e04-562d04dfb5emr4915461e87.57.1757582570041; Thu, 11 Sep 2025
 02:22:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250910-qcom-sa8255p-emac-v1-0-32a79cf1e668@linaro.org>
 <20250910-qcom-sa8255p-emac-v1-2-32a79cf1e668@linaro.org> <175751081352.3667912.274641295097354228.robh@kernel.org>
 <CAMRc=Mfom=QpqTrTSc_NEbKScOi1bLdVDO7kJ0+UQW9ydvdKjQ@mail.gmail.com>
 <20250910143618.GA4072335-robh@kernel.org> <CAMRc=McKF1O4KmB=LVX=gTvAmKjBC3oAM3BhTkk77U_MXuMJAA@mail.gmail.com>
 <b83a59f9-16ae-4835-b185-d5209d70a0f6@oss.qualcomm.com>
In-Reply-To: <b83a59f9-16ae-4835-b185-d5209d70a0f6@oss.qualcomm.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 11 Sep 2025 11:22:38 +0200
X-Gm-Features: Ac12FXx_Hui0lKjh3pL6K30JyaITyJ2wgwj7xLN_jTKFVW2DjCpTudv5l9sTHKE
Message-ID: <CAMRc=Md83STGFYya5eu4j33=SQ+D6upcP-7fnBwKo2dPdTtX+g@mail.gmail.com>
Subject: Re: [PATCH 2/9] dt-bindings: net: qcom: document the ethqos device
 for SCMI-based systems
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	Eric Dumazet <edumazet@google.com>, linux-kernel@vger.kernel.org, 
	Andrew Lunn <andrew+netdev@lunn.ch>, Vinod Koul <vkoul@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, devicetree@vger.kernel.org, 
	Jose Abreu <joabreu@synopsys.com>, netdev@vger.kernel.org, 
	"David S. Miller" <davem@davemloft.net>, Conor Dooley <conor+dt@kernel.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Richard Cochran <richardcochran@gmail.com>, 
	Jakub Kicinski <kuba@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 11, 2025 at 10:53=E2=80=AFAM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 9/10/25 4:42 PM, Bartosz Golaszewski wrote:
> > On Wed, Sep 10, 2025 at 4:36=E2=80=AFPM Rob Herring <robh@kernel.org> w=
rote:
> >>
> >> On Wed, Sep 10, 2025 at 03:43:38PM +0200, Bartosz Golaszewski wrote:
> >>> On Wed, Sep 10, 2025 at 3:38=E2=80=AFPM Rob Herring (Arm) <robh@kerne=
l.org> wrote:
> >>>>
> >>>>
> >>>> On Wed, 10 Sep 2025 10:07:39 +0200, Bartosz Golaszewski wrote:
> >>>>> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >>>>>
> >>>>> Describe the firmware-managed variant of the QCom DesignWare MAC. A=
s the
> >>>>> properties here differ a lot from the HLOS-managed variant, lets pu=
t it
> >>>>> in a separate file.
> >>>>>
> >>>>> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >>>>> ---
>
> [...]
>
> >>> These seem to be a false-positives triggered by modifying the
> >>> high-level snps.dwmac.yaml file?
> >>
> >> No. You just made 3 power-domains required for everyone.
> >>
> >
> > With a maxItems: 3?
>
> In the common definition:
>
> minItems: n
> maxItems: 3
>

Just to make it clear: if I have a maxItems but no minItems, does this
make maxItems effectively work as a strict-number-of-items?

Bartosz

> In your new file that includes the main one:
>
> properties:
>         power-domains:
>                 minItems: 3
>
> Konrad

