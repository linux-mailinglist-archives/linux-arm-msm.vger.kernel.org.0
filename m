Return-Path: <linux-arm-msm+bounces-15496-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F01E88F76A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Mar 2024 06:50:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D46C41F24635
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Mar 2024 05:50:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81BD74DA06;
	Thu, 28 Mar 2024 05:49:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="EqO1qpxd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80B3B4CB38
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 Mar 2024 05:49:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711604999; cv=none; b=Zd5Aj74ATxC4V7XvM4EOL9i839O2Wq1QmXHWpTNk14ClqJiEQHcP1/AG9OP2veTzwax0axgBpo1F/gC6lo/s7wfMcTk4NIeKRYNpCMuTs3pogT862AtL349I0J+QwX0ThNxNLfgYZtcF1zDqzpyxgN59SB10wT7OfXvfpS8a/98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711604999; c=relaxed/simple;
	bh=cn31nvUNUjuzpJBbAgPyDFbqbILk+7I0RyNp0AFjRSE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=n1yEjqESFZKKl3pTUyy0+HJq8dajM+4RmwKmEB8Ues57bufOnWw54vPaEZdfkPKRLeMfCjgrsnK/gdkSc2s0vNvsvkw7K9AX3dNgoxDuMfLA/9hyC8cDSIrsk+l+txjCi88Sck0dT09KX+IsuRNSV0YghD4MyBW4y1guvS1DkL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=EqO1qpxd; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-515b43b39fdso530485e87.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 Mar 2024 22:49:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1711604996; x=1712209796; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cn31nvUNUjuzpJBbAgPyDFbqbILk+7I0RyNp0AFjRSE=;
        b=EqO1qpxdgMVAy4qt4wi/S7W10sSAb99s7msAvI4h8uz8vL1JW1DivGxFbJKCO2CmVi
         uhno3Jc4F4VV312ZgktGxCVAHbFv3g4lC2Zs3yj0YSrA4l0ABpAZAqtVfub7B9yiEOn1
         qxc2TOsTmOGR94M9neC4O67OAtULhJNcHnWm8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711604996; x=1712209796;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cn31nvUNUjuzpJBbAgPyDFbqbILk+7I0RyNp0AFjRSE=;
        b=PhPDZ4bdTT1h9rNtNRjE3Uk6aWdeM9rIb0yHimQ/IS/SWx3/EMO+DxaoeVEo2F25Jy
         egOCkpfYU6U8A1U1mzUBMeC8dNpOdysSgBlh78zRjxELRBrDLAakLxphvClRrJwJPvvs
         Om+c9ZRI5Itwj26HOOQDQVEUgU5oO6moTmZOgSFzJ0PtmxA5/FruAsO066NFzyZz04vq
         /XpJlA2GsPQPoDxpw8zGJvbRcXFbOJ3jmkFyPlaxwJwQ+aqeGgkFJCTLy45n8nYkY5rp
         GBEI3o2r8EtKBw47KDqFwHbZhzRvTNZDY8k/+MEpAzJkp9IeVLvlR7khNtcoSXcw8GI2
         5pfQ==
X-Forwarded-Encrypted: i=1; AJvYcCVL4Bcl0VAr7LcRG0qi45uX1rtgsFFudxFgjQjaUIayVSmCvc+JC5/8MrxIKXpMo+6I03Ym+erY8oqvz/nqhU17dqv6ci2y1XWHOdqFyw==
X-Gm-Message-State: AOJu0YxLNyOdZm7nvSCNqcetDdSj9Ov1U5LMyk2bfUdF9Qdjngj9UIl4
	TT12CEp7BJ2UJAMA+ZLHw4ok2IlPB8+SAVLGG5gvYIm+2wDn5oUvI55UlaDBqI9iOGWInwrEcTJ
	mU5ukbh4DIN87slihWKnr2+R8II3bvBwnmS8g
X-Google-Smtp-Source: AGHT+IE9E7br29oy9RDRD35SwQNl2vwFiBtmvYXASR4vX3jKO04LtgAi9c4oMgaAsLskFkIEeHikqvJMsXTcDn6BjM0=
X-Received: by 2002:a05:6512:32bb:b0:513:dfac:b29e with SMTP id
 q27-20020a05651232bb00b00513dfacb29emr414742lfe.26.1711604995631; Wed, 27 Mar
 2024 22:49:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <1710418312-6559-1-git-send-email-quic_amrianan@quicinc.com>
 <1710418312-6559-3-git-send-email-quic_amrianan@quicinc.com>
 <f6f317d9-830d-4c38-998f-b229b3d9f95a@linaro.org> <20240316-germinate-browsing-6865db3a44d7@spud>
 <20240316-herring-skies-6ee1d4a9c0d2@spud> <CAD=FV=VZB9Dqsw6+2WBdWxaQVA9NgK_W2n0okBOU0haDMSogPw@mail.gmail.com>
In-Reply-To: <CAD=FV=VZB9Dqsw6+2WBdWxaQVA9NgK_W2n0okBOU0haDMSogPw@mail.gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 28 Mar 2024 13:49:44 +0800
Message-ID: <CAGXv+5HchqvT=J7_qsJMB7OthX-gtGp0E64Xfk3i3=DDX6o1=g@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] dt-bindings: qcom: Update DT bindings for multiple DT
To: Doug Anderson <dianders@chromium.org>, Amrit Anand <quic_amrianan@quicinc.com>
Cc: Conor Dooley <conor@kernel.org>, Caleb Connolly <caleb.connolly@linaro.org>, robh@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, agross@kernel.org, 
	andersson@kernel.org, konrad.dybcio@linaro.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	kernel@quicinc.com, peter.griffin@linaro.org, linux-riscv@lists.infradead.org, 
	chrome-platform@lists.linux.dev, linux-mediatek@lists.infradead.org, 
	Simon Glass <sjg@chromium.org>, Julius Werner <jwerner@chromium.org>, 
	Elliot Berman <quic_eberman@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 19, 2024 at 5:36=E2=80=AFAM Doug Anderson <dianders@chromium.or=
g> wrote:
>
> Hi,
>
> On Sat, Mar 16, 2024 at 9:51=E2=80=AFAM Conor Dooley <conor@kernel.org> w=
rote:
> >
> > On Sat, Mar 16, 2024 at 04:20:03PM +0000, Conor Dooley wrote:
> > > On Thu, Mar 14, 2024 at 02:20:38PM +0000, Caleb Connolly wrote:
> > > > On 14/03/2024 12:11, Amrit Anand wrote:
> > > > 2. A top level board-id property that isn't namespaced implies that=
 it
> > > > isn't vendor specific, but the proposed implementation doesn't even
> > > > pretend to be vendor agnostic.
> > >
> > > I pointed out previously that the Chromebook guys had some similar
> > > issues with dtb selection when the OEM varies parts but there does no=
t
> > > seem to be any of them on CC here.
> >
> > That's maybe a bit harsh of me actually, I see that there's a
> > chrome-platform address on CC, but I don't know if that's gonna reach
> > the guys that work on these devices (Chen-Yu Tsai and Doug Anderson in
> > particular).
>
> Thanks for the CC. Yeah, I don't watch the "chrome-platform" list
> myself, though maybe I should...
>
> The Chromebook boot flow and how we've handled this so far is
> documented in the kernel [1]. This method is what we've been using
> (with slight modifications over the years) since the earlier ARM
> Chromebooks and is, I believe, supported in both the depthcharge
> loader (used in Chromebooks) and also in U-Boot, though it's possible
> (?) that the U-Boot rules might vary ever so slightly. I haven't tried
> using U-Boot to boot a Chromebook in years.
>
> The current way things work for Chromebooks involves a heavy amount of
> duplication. We bundle an entire "DTB" for every relevant
> board/rev/sku combination even though many of those DTBs are 99% the
> same as the other ones. The DTBs have been relatively small and we
> compress them so this hasn't been a massive deal, but it's always been
> on the TODO list to come up with a scheme to use DT overlays. We've
> also talked about bundling a device tree that has the superset of
> components and then using an in-kernel driver to set the status of
> some components to okay and there is some overlap there in the
> possible way to represent board variants. I think Chen-Yu is going to
> talk about a few of these topics next month at EOSS [2].

That's right. It's the last talk before the closing game on the last day.

Elliot is also presenting the board-id proposal at EOSS [3], which is the
last talk of day 2.

> In terms of looking at your specific proposal, it's definitely trying
> to factor in a lot more things than the current one that Chromebooks
> use. The Chromebook model was "simple" enough that we could just
> leverage the compatible string, though the way we leverage it has
> ended up controversial over the years. Yours is definitely too
> complicated to work the same way. It seems like device tree overlays
> would be a better fit? I'm not an expert so maybe this is already
> solved somewhere, but I'd imagine the hard part is getting everyone to
> agree on how to specify stuff in the DT overlay that allows the
> bootloader to know whether to overlay it or not...

I think qcom,board-id + qcom,oem-id maps to our board name + SKU ID + revis=
ion.
The difference is probably because we make our device codenames public? We
don't actually have integer identifiers for each board family, though I do
see the appeal of it.

So it looks like this proposal is more about identifying boards without
polluting (?) the compatible namespace with all sorts of combinations
and hacks like we have.

> [1] https://docs.kernel.org/arch/arm/google/chromebook-boot-flow.html
> [2] https://eoss24.sched.com/event/1aBGe/second-source-component-probing-=
on-device-tree-platforms-chen-yu-tsai-google-llc

[3] https://eoss24.sched.com/event/1aBFy/shipping-multiple-devicetrees-how-=
to-identify-which-dtb-is-for-my-board-elliot-berman-qualcomm

