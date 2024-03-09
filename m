Return-Path: <linux-arm-msm+bounces-13768-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FBDF87748B
	for <lists+linux-arm-msm@lfdr.de>; Sun, 10 Mar 2024 00:45:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D45C51F21302
	for <lists+linux-arm-msm@lfdr.de>; Sat,  9 Mar 2024 23:45:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07B7A5338A;
	Sat,  9 Mar 2024 23:45:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jLyI/qk+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29D36535B7
	for <linux-arm-msm@vger.kernel.org>; Sat,  9 Mar 2024 23:45:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710027903; cv=none; b=gzlPb1yWrmgM11AOPQS/l0iP6YdDpkXTGEeTL9LZWTpF+bBRXPqBp4Ri3ridDotpFfsqVJrMKrvH+Up9Yg9AuSbp8NwCoKEiEP09ZE8X516zAUNfjsvR5sNTdsxfq4Cr30gR1HIfKI5xABgICsFECc1m05Joaa0v/D5Gxkaqfl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710027903; c=relaxed/simple;
	bh=3/X1psLY0Zim7ILl0IF3hRPUcK261kr1dKIcPs6BxMw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NTVrIXZXn09I6dzpp9lQJevV8/krUQYS1GCc42hwvjqE9HHyZ4owsjxyHZM5vQesAH6cYq9R50aH039HoVHrkdi8efTNrWo96NaPJbLo/OFjv/7v/ptNDtvQzDErkFcFNSaaqjzibI0AI/0Aygp+L4+lM3stMcStlbWtcwCPuP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jLyI/qk+; arc=none smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-60974cb1cd7so30679127b3.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 09 Mar 2024 15:45:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710027901; x=1710632701; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0qceh3sC8kiofPhUeytSOniPbrODQxl3H6CnR4Wu1NQ=;
        b=jLyI/qk+s/RmWhoWQuJbrPZ8XCGTJLIKMQ4kqA1A9pM9FkPG65cQIL1u2lXBXv+Ds5
         +UslktRtXmDiWp9kdkv1cu6rVjFUIBiYFXjvd/8DpoZzSh+D3Vh7PmIu2hBast2ZNPD5
         PN04i9PFrArGm7O/ssv7FThABXkNIUe/j6puUNXcJ7VV8sUSS8XZVHPkgbetAMiv5jEj
         OuN8PI0sXRCHtvgYKjXHVqBdJCV3ruY7vXPPvGdWsTxhllJ2veD2IeIyAzu+/kfkg+b/
         aBIyQSQiVa4DnxwmVx7+Sw5MWawM/c2RjD1PODtf5t6T3VN5qYJJpAi4LTt7++XKTSJr
         81ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710027901; x=1710632701;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0qceh3sC8kiofPhUeytSOniPbrODQxl3H6CnR4Wu1NQ=;
        b=mq04MDlJSUngXhberV8wPinO4M8XiY92FsrEYhR//LMkZZPwyFBrNW7ZAanFV77QCV
         19Dlds+5N7MSwTy8SbM/88GZ4t8GfzotmHI4+esl2HTDntuT9d3H1RTHtfXUoaVjz8ai
         I+W1ZY5pq1G/jLty4TayoZifDCtuowIHmbJ9VKKc24ehlv+cJGMlb1qh5sy0GQ4Dx55i
         9t7+z2LEDpnmAjrKW1uDwsuZQUccX1sbo6M/2k4yaWExO0xBtCJquREWx2LmoC61O3H2
         ggusawhEt8UWxZEWJ+/MnGQgtDGVJubKfgHHJqd8Cx4ACCr0Z736e2S0hGbbxwJ96ttF
         SD4w==
X-Forwarded-Encrypted: i=1; AJvYcCVYYOW0QVVIh10NTx/9VS+wVJB8+OtIgXnyXrREG0EV0hbCMa7UM4lYTEOyO49/nT9kgz3GkO6yDHryajyGPguc9XI+w1wZdYfslooGvw==
X-Gm-Message-State: AOJu0Yzue/dTR7u+zouZSaH5QKWbQsf3gk0WtFqOVMx4OX1Hy34yyOjY
	zo3NbR6Vfk+D4KjWIo9cHBMXyiAt9hmdZOGudxB39gF4Y1Nh/rWPUhtP+NF1+U/JGKYQyzmNsJq
	b9r2XS/APoRp6T7zcNSM4vGICHxbC2mFNHIlXtg==
X-Google-Smtp-Source: AGHT+IFjQ7Gcrqq5W6UpC7l3IWPSk0nRWcufMO5FpukUPjCY39q7UzwvY6a72jclK6kDbiYQJofABauyhz+jduzN9j0=
X-Received: by 2002:a81:a214:0:b0:609:ecb9:77c with SMTP id
 w20-20020a81a214000000b00609ecb9077cmr2763677ywg.18.1710027901171; Sat, 09
 Mar 2024 15:45:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240129092512.23602-1-quic_tengfan@quicinc.com>
 <20240129092512.23602-2-quic_tengfan@quicinc.com> <CAL_JsqJfsWaj9OPkvc34rBvx7W_3v9+1kZqNu6QKDsA=iWAA4w@mail.gmail.com>
 <CAL_JsqLbbRFijBXS5CyRm0P4FMY7bR3UUdgXA7xP4Z1oRevnzQ@mail.gmail.com>
In-Reply-To: <CAL_JsqLbbRFijBXS5CyRm0P4FMY7bR3UUdgXA7xP4Z1oRevnzQ@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 10 Mar 2024 00:44:50 +0100
Message-ID: <CACRpkdZ3uhyTnF7YkMk9sOeJJFZ4UPEna7PwpqPeBpWDdAmayA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: pinctrl: qcom: update compatible name
 for match with driver
To: Rob Herring <robh+dt@kernel.org>
Cc: Tengfei Fan <quic_tengfan@quicinc.com>, andersson@kernel.org, 
	konrad.dybcio@linaro.org, krzysztof.kozlowski+dt@linaro.org, 
	conor+dt@kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kernel@quicinc.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 8, 2024 at 9:10=E2=80=AFPM Rob Herring <robh+dt@kernel.org> wro=
te:
> On Tue, Feb 27, 2024 at 7:37=E2=80=AFAM Rob Herring <robh+dt@kernel.org> =
wrote:
> > On Mon, Jan 29, 2024 at 3:25=E2=80=AFAM Tengfei Fan <quic_tengfan@quici=
nc.com> wrote:
> > >
> > > Use compatible name "qcom,sm4450-tlmm" instead of "qcom,sm4450-pinctr=
l"
> > > to match the compatible name in sm4450 pinctrl driver.
> > >
> > > Fixes: 7bf8b78f86db ("dt-bindings: pinctrl: qcom: Add SM4450 pinctrl"=
)
> > > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > Signed-off-by: Tengfei Fan <quic_tengfan@quicinc.com>
> > > ---
> > >  Documentation/devicetree/bindings/pinctrl/qcom,sm4450-tlmm.yaml | 2 =
+-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sm4450-tl=
mm.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sm4450-tlmm.yaml
> > > index bb08ca5a1509..bb675c8ec220 100644
> > > --- a/Documentation/devicetree/bindings/pinctrl/qcom,sm4450-tlmm.yaml
> > > +++ b/Documentation/devicetree/bindings/pinctrl/qcom,sm4450-tlmm.yaml
> > > @@ -17,7 +17,7 @@ allOf:
> > >
> > >  properties:
> > >    compatible:
> > > -    const: qcom,sm4450-pinctrl
> > > +    const: qcom,sm4450-tlmm
> >
> > I think you forgot to update the example:
> >
> > Documentation/devicetree/bindings/pinctrl/qcom,sm4450-tlmm.example.dtb:
> > /example-0/pinctrl@f100000: failed to match any schema with
> > compatible: ['qcom,sm4450-tlmm']
>
> Still a warning in linux-next. Please send a fix.

I understand it as applying 1/2 is the fix so I applied it.

Yours,
Linus Walleij

