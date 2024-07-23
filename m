Return-Path: <linux-arm-msm+bounces-26836-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A9A6A9397C1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jul 2024 03:10:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 602252829C0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jul 2024 01:10:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E97711311A3;
	Tue, 23 Jul 2024 01:10:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pfCcvHWK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34CC11304BA
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jul 2024 01:10:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721697005; cv=none; b=SjWfcYSrYuGXPcjHCaC892y9M3LiQHq8AJWy4QCxWwNb+LUEoRwcQv0Rp4zF5nHugjgV1uyWw4B70xfF/GLk39314pUouNxmMuoOfYRchXcyyrtCg/QD4bwf4fel0jxfq31qlVBx7RKm7pyR1vD6Fxtpmpjo3ZB8eXndUfH0a+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721697005; c=relaxed/simple;
	bh=F/YVPIt96eiD4fDEqIVV0BjgbhD3AMknFfl6Pf7/Seo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Y3wBxosUN9zNK1QdJtlRxPBcTyQnjW4ckR4dgUalI5cd81n1u51oTkzWL/S7Iku4nkPQRAIAutZuFdCF4x3irHtOj/sZ7Tpgf5rFb4RsjYkHqZ8FUIsctFhmf3Lw7mFPJ14lXVzzuQkVwHtl925iALlA3LDCCc+ZiEp7EePOWK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pfCcvHWK; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-66ca5e8cc51so19657607b3.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jul 2024 18:10:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721697003; x=1722301803; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=M+1mttumgraTmz8as/o8R81jMF1pkFas9HuIkAF6YD8=;
        b=pfCcvHWKnncLvDK77wOZxrlYBUxm4zUEWiym7FZUc4hLGCfIZusQgzm/EuvrqrMZmf
         fxUZFGn4ZgNKNkFbtjdAH5SirzedHAI5SSq7eKRFI8SiRWAhnS2yJ8D0upOPR/DziyON
         UDBc5Ukzlx2LRSZCTkSx6q2yHOIKmnbppzjbKENRtNGpWnux86axCDc0qcJg+oE7PEVi
         hTJ77yFXvsWtjR8cCjWPhI21hPLziqVEJX7QS4k0O6qzgXf5hvv3X40ppnjxouPU+Z9V
         26XldUzrLd/U4PsNqkiOgagsBTrnJs7r0bF/GHcrRUxgdlSpsiGlIQqffVLTAtV2YG8/
         5+1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721697003; x=1722301803;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M+1mttumgraTmz8as/o8R81jMF1pkFas9HuIkAF6YD8=;
        b=YSJdD28oGAWh8oyLyWxsU7qSpi6AvTnNnhZDgtoC4CtnQ0QDfdseXSbHhS1GL4cuiE
         qGeGdsrk/CQ2fq7uZtAgF8qfoy9uof/li9vT666d4UdfZIalv69wXiDdFHJ2OlojZSlq
         nsQXBYLuSiul1Z4FKS8I4R3pj4+O2+qBhzjiHOiVx34VmkDRnNSl+i65bk+asXvX6i4r
         vfi+jJMETuXFMSUDXwvsAYyJShHZLDJWXKHYQ6T5B3Xk7wFsXfsJXkF0X11IPeccWmha
         gzr1wGM3mTX0bE7n59vLRG8splIbylTEqgFZ3z2ZWHA4ZrUcCnaskJ8O4ozkp6kAOgf9
         6/QQ==
X-Forwarded-Encrypted: i=1; AJvYcCV6JYj6gC0zHskUBEMUL54QrkachorQiDkVaUjKR/hsMQ3DwgjCcSiD83oNtbY/jFRaUDZZIgaRsKzBY/zYE0GyLGSl4VJ7+yFKNWLhzA==
X-Gm-Message-State: AOJu0Yzjxk2LqNZATXbzCWhSqKfeTdy5l5fN4fobZeK1A77IKoNLhIxh
	N9zdqkTT98anwm2TSh68e8FwYaTiEN2m+u1hpoluTml+s9zt4upzqCRYhPRuYp1SSPOtZHPddOX
	qRqBJEs+af3G17hH5Y0j1oUOPe8R+HSQHjPsreQ==
X-Google-Smtp-Source: AGHT+IFWh7F9HmWfROqNp44wr2VtiezP9UnvrKwkDXP8VHIqTEKzjfkOOrND9UfYVARn0ktR6qDNF/AN9J+nSHMSp2M=
X-Received: by 2002:a05:690c:4087:b0:651:a00f:698a with SMTP id
 00721157ae682-66a65e6516amr86737777b3.38.1721697003132; Mon, 22 Jul 2024
 18:10:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240722-miix630-support-v1-0-a6483cfe8674@linaro.org>
 <20240722-miix630-support-v1-1-a6483cfe8674@linaro.org> <cac3d7ba-2a62-479d-94c2-c6dc4d7a5ba2@linaro.org>
In-Reply-To: <cac3d7ba-2a62-479d-94c2-c6dc4d7a5ba2@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 23 Jul 2024 04:09:52 +0300
Message-ID: <CAA8EJprROf-aJgJvUMb3D+dCzOUO-eRzM3khM6ZY8b+z+_gByA@mail.gmail.com>
Subject: Re: [PATCH 1/4] arm64: dts: qcom: msm8998-lenovo-miix-630: enable touchscreen
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jeffrey Hugo <quic_jhugo@quicinc.com>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 23 Jul 2024 at 02:22, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>
> On 22.07.2024 1:57 PM, Dmitry Baryshkov wrote:
> > There is no point in keeping touchscreen disabled, enable corresponding
> > i2c-hid device.
> >
> > 04F3:2608 Touchscreen as /devices/platform/soc@0/c179000.i2c/i2c-0/0-0010/0018:04F3:2608.0001/input/input1
> > 04F3:2608 as /devices/platform/soc@0/c179000.i2c/i2c-0/0-0010/0018:04F3:2608.0001/input/input2
> > 04F3:2608 as /devices/platform/soc@0/c179000.i2c/i2c-0/0-0010/0018:04F3:2608.0001/input/input3
> > 04F3:2608 Stylus as /devices/platform/soc@0/c179000.i2c/i2c-0/0-0010/0018:04F3:2608.0001/input/input4
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >  .../boot/dts/qcom/msm8998-lenovo-miix-630.dts      | 28 ++++++++++++++++++++++
> >  1 file changed, 28 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/qcom/msm8998-lenovo-miix-630.dts b/arch/arm64/boot/dts/qcom/msm8998-lenovo-miix-630.dts
> > index a105143bee4a..118c55f5bcfd 100644
> > --- a/arch/arm64/boot/dts/qcom/msm8998-lenovo-miix-630.dts
> > +++ b/arch/arm64/boot/dts/qcom/msm8998-lenovo-miix-630.dts
> > @@ -11,6 +11,24 @@ / {
> >       chassis-type = "convertible";
> >  };
> >
> > +&blsp1_i2c5 {
> > +     clock-frequency = <400000>;
> > +     status = "okay";
> > +
> > +     tsc1: hid@10 {
> weird (and unused label)
>
> very non-specific node name too
>
> > +             compatible = "hid-over-i2c";
> > +             reg = <0x10>;
> > +             hid-descr-addr = <0x1>;
> > +
> > +             interrupts-extended = <&tlmm 125 IRQ_TYPE_LEVEL_LOW>;
> > +
> > +             pinctrl-0 = <&i2c5_hid_active>;
> > +             pinctrl-names = "default";
> > +
> > +             wakeup-source;
>
> double tap to wake? tap to wake?
>
> > +     };
> > +};
> > +
> >  &blsp1_i2c6 {
> >       status = "okay";
> >
> > @@ -35,3 +53,13 @@ &remoteproc_mss {
> >  &sdhc2 {
> >       cd-gpios = <&tlmm 95 GPIO_ACTIVE_HIGH>;
> >  };
> > +
> > +&tlmm {
> > +     i2c5_hid_active: i2c5-hid-active-state {
> > +             pins = "gpio125";
> > +             function = "gpio";
> > +
> > +             bias-pull-up;
> > +             drive-strength = <2>;
>
> Since there are no other pin definitions, you can do better and not
> copy the old rotten style ;)

Both node and pinctrl were c&p from c630. But was is rotten here?


-- 
With best wishes
Dmitry

