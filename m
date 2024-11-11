Return-Path: <linux-arm-msm+bounces-37484-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E0DD9C4369
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Nov 2024 18:18:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A3C01B20939
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Nov 2024 17:17:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71F141A4F09;
	Mon, 11 Nov 2024 17:17:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XngVegXb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0EE81A256B
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 Nov 2024 17:17:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731345466; cv=none; b=FkfaBfmpKFHILHMaS6yaktmNCdV9ohPTqc0HVHA554B/Mssi+ouECwpUHQLMv8FFNcJLTw4aDbRbhHs2UI7UBnUExMuS/ndtLDdAcOe/EFYPAFrWy1Qpfx5i4YnOkl3s3E72C2kbUF6Rn0NOVqfqvPgTGrC0bfm7eAozqW4Dxxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731345466; c=relaxed/simple;
	bh=EDZ3mHnLpjUN9aHt8g/8fj2vRwXsfUyj8HSmBX+UHAA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UvbWL/SQZsn+Ldzy9SXpt3u1SfBUgT9gp+Js2jPUUB9uQV2UbrtPjlmvYS0mZ7y0JoHDNzZrwuPJUB7xV/JonBYh7sAQKGz5gap5vSUJVx6UBvELOTnnpn8iSEUK1UKycgLASL9/cF5TmrvaHP/AwpscAgGmuRiLjP0N1a9zpmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XngVegXb; arc=none smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-6e2e41bd08bso47170697b3.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Nov 2024 09:17:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731345464; x=1731950264; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EVAoKlYuwhpxemTCYwh1Tkj7l1J7a1J0FZ6n/pZvepA=;
        b=XngVegXby8CiBbvSREBpcITB2/01b72froGCUbGGzuBgxO5CRHvcn/HwtGLKpW32om
         VdQacOJXtPx5RThT06bWtIdOUxLNhMvo3Gbie7Yweb0cG/pYkY4xYOheZ8RKjR1g14gg
         CaELrnXf7bdD+E33xZkiJ/XGuSulFhMzZtNOLyIUuDygHkVIQek42XbLs9+Kp2Y1Vt3e
         hdVE9KlQ5FPRwV0Y1w/jMnoysa0MHFD7hBbVAnV+vlY+75LvLxss5ECRK/ND33KRMDzc
         ngh9vfSiQHx4EQ9HjHvNZc+BklAB2A0XPfnyEirRqvHEEViA2RdGgNlP2lIlkdDTxBf/
         NjMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731345464; x=1731950264;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EVAoKlYuwhpxemTCYwh1Tkj7l1J7a1J0FZ6n/pZvepA=;
        b=AidTpDQJ75KserdDhIIkP2tKrNqMovAKGdgYnpLWIagKcS+AhnrE/xl+fAdszm2BMV
         uXh7t81c+Gl4JqkB95orYUpe1Vh6OFkkvEuRR5P2yRTjcQm/5cOmPc3E5xJIhgP3aI0q
         8mBGFPFCrzParK/WrMlDEPj1Ct/Ka/8DRsVsV7DbWf1j8eYswu3xQ+P0C79qFXw8wd5c
         DEX2fi3kIgQcmtrTSIJl6OzyiU5Ona115Ws7j/cHuKYKjoxAOU3yeZnRJt8QZz3j3DdI
         UnKfG7ToX6tFiEO+h+ZzH01d7SZdNntnrGeLO6YLaUhXNUmshv7wtS3VbOKeZNY03EAx
         tsng==
X-Forwarded-Encrypted: i=1; AJvYcCXk+cj1/poqh5GgdaUnfchWWzSpAw8mfZdK9Ha8T4EOiUTR/GAemPek7mO9bRKrMyWw1EE62nHiS+y3Zc3J@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+QSA0cf0w7dVhlRf5/st7Z7FIK6EVXbvKWisO6qoovP0Chg24
	lN9/CXaS9iRYQA4zWj5WgavyxGQpmeKcRXwVOeK+v/4HEXaYWWuMI9/5NJgXQI1LeW5e6m87hXM
	k06CoX+saolOny+SpNHjDVCOFf1jVRsXfA9eJvA==
X-Google-Smtp-Source: AGHT+IEIfKEgS8SXTmAU6JUeTqa2pA45BLVA8WQCryDvQyLebwuTTv0iL8Ym7trTq+NnT9YNlkjR5YyXNUj+tHbLJUc=
X-Received: by 2002:a05:690c:dc7:b0:6e3:34b9:961d with SMTP id
 00721157ae682-6eaddfbe812mr106611157b3.38.1731345463717; Mon, 11 Nov 2024
 09:17:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241009-patchv3_1-v4-0-cd683a9ca554@quicinc.com>
 <20241009-patchv3_1-v4-1-cd683a9ca554@quicinc.com> <ugkiv4m3etpydvosjkyzwr4qus74xnwccow7xrpvr77kzcx6bv@odlz7dzldqc5>
 <CAL_JsqJ0zoyaZAgZtyJ8xMsPY+YzrbF-YG1vPN6tFoFXQaW09w@mail.gmail.com>
In-Reply-To: <CAL_JsqJ0zoyaZAgZtyJ8xMsPY+YzrbF-YG1vPN6tFoFXQaW09w@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 11 Nov 2024 19:17:32 +0200
Message-ID: <CAA8EJppkv-BoiX-UQZ2S6iL5KQZMBAMREarHxxhc45dEq5U84g@mail.gmail.com>
Subject: Re: [PATCH v4 1/5] dt-bindings: display/msm: Document MDSS on SA8775P
To: Rob Herring <robh@kernel.org>
Cc: Mahadevan <quic_mahap@quicinc.com>, Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Kalyan Thota <quic_kalyant@quicinc.com>, 
	Jayaprakash Madisetty <quic_jmadiset@quicinc.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 11 Nov 2024 at 19:06, Rob Herring <robh@kernel.org> wrote:
>
> On Fri, Oct 18, 2024 at 6:00=E2=80=AFAM Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
> >
> > On Wed, Oct 09, 2024 at 08:02:01PM +0530, Mahadevan wrote:
> > > Document the MDSS hardware found on the Qualcomm SA8775P platform.
> > >
> > > Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > > Signed-off-by: Mahadevan <quic_mahap@quicinc.com>
> > > ---
> > >  .../bindings/display/msm/qcom,sa8775p-mdss.yaml    | 241 +++++++++++=
++++++++++
> > >  1 file changed, 241 insertions(+)
> > >
> > > diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sa877=
5p-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sa8775p-m=
dss.yaml
> > > new file mode 100644
> > > index 0000000000000000000000000000000000000000..37c04ae6876f873c2cddc=
51b5160b1f54e2b5118
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/display/msm/qcom,sa8775p-mdss=
.yaml
> >
> > [...]
> >
> > > +
> > > +        display-controller@ae01000 {
> > > +            compatible =3D "qcom,sa8775p-dpu";
> > > +            reg =3D <0x0ae01000 0x8f000>,
> > > +                  <0x0aeb0000 0x2008>;
> > > +            reg-names =3D "mdp", "vbif";
> > > +
> > > +            clocks =3D <&gcc GCC_DISP_HF_AXI_CLK>,
> > > +                     <&dispcc_ahb_clk>,
> > > +                     <&dispcc_mdp_lut_clk>,
> > > +                     <&dispcc_mdp_clk>,
> > > +                     <&dispcc_mdp_vsync_clk>;
> > > +            clock-names =3D "bus",
> > > +                          "iface",
> > > +                          "lut",
> > > +                          "core",
> > > +                          "vsync";
> > > +
> >
> > It's been more than a week since Rob reported issues with the bindings.
> > Any updates? Obviously I can not pick up patches with binding errors.
>
> Well, someone picked up this version rather than v5 which appears to
> have fixed it. So, probably need an incremental patch to fix the
> warning in linux-next.

Well, I picked up v5, [1]. I will check if there are warnings and send
a patch targeting linux-next / msm-fixes.

[1] https://gitlab.freedesktop.org/lumag/msm/-/commit/409685915f00


--=20
With best wishes
Dmitry

