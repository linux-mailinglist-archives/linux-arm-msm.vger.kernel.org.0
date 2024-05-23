Return-Path: <linux-arm-msm+bounces-20298-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A0F68CCFBF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 May 2024 11:58:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B96BE1F235C0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 May 2024 09:58:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E2F013D538;
	Thu, 23 May 2024 09:58:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yLE7n8mI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AD3813D61E
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 May 2024 09:58:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716458301; cv=none; b=ueTAjIj2sqo0rEH22VIf0cnFSB47kS9LLsB/Uxx483hMRAxMyG8gaqmegv4qPF6NaxkB2udg7Jl2YiO+72cl3vrd3a9G8UbWqkBfS5Y17Icghd8mr3SHBPYqtQokWutq/FWB9wZzkuVvD1sDkiCQTBu9Es18S5QwAl6p1qf/zSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716458301; c=relaxed/simple;
	bh=MeQhY+H63qfrwa+ZV9kpemLqTZnKVQF3cpOAfLeW+7w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aNniVUp7oE7FgfJyCBGSzYYMa+2bT8RD8moDPQh5334yc/2t9jFx8YrN4/fRdRwyfeQSWtfQ50biFIUAdeDTdaBjhCoj8myGODAKHAbkSbOClnQvFsWvOo1DgAz+VYZfGEGFc/HUa+kQyToBlmwf7wUPAjPT1Ur5GaCMpVRFQP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yLE7n8mI; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-627dfbcf42aso18545637b3.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 May 2024 02:58:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716458299; x=1717063099; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=y1sOYJIvzvzoC2yvl9zoEh4JKtXSdU2JwzVDJiDmqfo=;
        b=yLE7n8mIg5EmGbVB2vV9x3KqXwPYqq+7m2+JVDM6gIezCcQz8OgzPJ/3WamOpI0M7t
         uuaZxqSSZM4HPcgxIegpijGNwZPCixRyt0AOKWfrtK+Pz93TA3SHfhbGx3udUGdHQ3OT
         5f+fusRXSkaMaZ6V8q2/EZHsHC65cfDcmsf05HH5wbuUVORK7GuVnglTlZOyzhJdmixU
         zTWBB1FlGDPtdO500Ci1Gcdp8eoyE7rJUWfF5akC7ewR/Iz5asTqB21B+MYpTDoKIhOY
         Yge39OX1XQ4vxwdrxzhRl4EggfmLmXItlrZqm/1hG5z5w6BGnytMRf3/PQVCQX7FwEDP
         QHYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716458299; x=1717063099;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y1sOYJIvzvzoC2yvl9zoEh4JKtXSdU2JwzVDJiDmqfo=;
        b=TvXm3u7WHFiZcmsf1jaopn7wSvapPACjagXTH3Li4Wr1iHR8oWDGM65S8+DYuuzsB1
         SF9UUy3Xg9ccu1LUGIoJnpsmu9J9shIx5tAJsxJ+E0Fx5dR44/oE499x349F/LuesFz0
         U0TqKX7ew7w6CYyvH9DyBmZBorKidY5UwDcehr4TkyUawH36m2lXHikPiRKzu1RCPM4J
         vVslnyODPWLINHgwdCLz8HgMoUW+fWmeLf7otSCZ6QK+cmNA7PI7dygkei4PqkJ3bVhG
         gMcp35YBTp/nNrftjEY34LXEj15UQ7MDE6yYHvE2ekEPvmANs3awMWcrFvrTu205jvzy
         OW+A==
X-Forwarded-Encrypted: i=1; AJvYcCXH78AOTJEuxBp3V79JH+QqZByyKP++BqlEvr7jjW2IpjaRX7C8wgWdgkbzmwJBL8DbMxxfCB8Yy+MvDXneFQhlLJtLGq47wC/XJNLfDA==
X-Gm-Message-State: AOJu0YzxLibn3Um7rA6XYYZH9cGUVBXH5vJTWEyGD9Js41U8PAWbubVF
	LeOKJaOXNSgFKeasyjxuvmGVb/UAitA8LB1JoZ8knxl/wOP9s8Be4FEKVUaloL9aWgCIVfAZ3gL
	IjsRchsvOkO51nYwWWhfVsuvpvgnSWSuZB+V9ig==
X-Google-Smtp-Source: AGHT+IFSx7eH9OK/hI8iq0vTScgxcbZqJWA8/FXYjaRvJCffCTFJs80i56nCHfpAt38cyIIYw5RoPljn2ZLPu/XiJlY=
X-Received: by 2002:a0d:e206:0:b0:61b:3304:cdc7 with SMTP id
 00721157ae682-627e4824bc6mr43478167b3.29.1716458298915; Thu, 23 May 2024
 02:58:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240520-dpu-handle-te-signal-v1-0-f273b42a089c@linaro.org>
 <20240520-dpu-handle-te-signal-v1-1-f273b42a089c@linaro.org>
 <224fa477-07ba-e7b2-2f7d-8f7d21f4a0c7@quicinc.com> <CAA8EJpp8kRPKboHNHwD+R5f1AcndjaQdGG=Q4ygmRE9VMNievQ@mail.gmail.com>
 <5cde2f43-89ab-d2d4-d68e-605f8f5d1da7@quicinc.com>
In-Reply-To: <5cde2f43-89ab-d2d4-d68e-605f8f5d1da7@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 23 May 2024 12:58:07 +0300
Message-ID: <CAA8EJpoMtr6OGjL8qq-cHadQSOVyDAaL8=2TLvOjBbYV2Z7+Mg@mail.gmail.com>
Subject: Re: [PATCH 1/7] dt-bindings: display/msm/dsi: allow specifying TE source
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Krishna Manikandan <quic_mkrishn@quicinc.com>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 23 May 2024 at 02:57, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 5/22/2024 1:05 PM, Dmitry Baryshkov wrote:
> > On Wed, 22 May 2024 at 21:38, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
> >>
> >>
> >>
> >> On 5/20/2024 5:12 AM, Dmitry Baryshkov wrote:
> >>> Command mode panels provide TE signal back to the DSI host to signal
> >>> that the frame display has completed and update of the image will not
> >>> cause tearing. Usually it is connected to the first GPIO with the
> >>> mdp_vsync function, which is the default. In such case the property can
> >>> be skipped.
> >>>
> >>
> >> This is a good addition overall. Some comments below.
> >>
> >>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >>> ---
> >>>    .../bindings/display/msm/dsi-controller-main.yaml        | 16 ++++++++++++++++
> >>>    1 file changed, 16 insertions(+)
> >>>
> >>> diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> >>> index 1fa28e976559..c1771c69b247 100644
> >>> --- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> >>> +++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> >>> @@ -162,6 +162,21 @@ properties:
> >>>                    items:
> >>>                      enum: [ 0, 1, 2, 3 ]
> >>>
> >>> +              qcom,te-source:
> >>> +                $ref: /schemas/types.yaml#/definitions/string
> >>> +                description:
> >>> +                  Specifies the source of vsync signal from the panel used for
> >>> +                  tearing elimination. The default is mdp_gpio0.
> >>
> >> panel --> command mode panel?
> >>
> >>> +                enum:
> >>> +                  - mdp_gpio0
> >>> +                  - mdp_gpio1
> >>> +                  - mdp_gpio2
> >>
> >> are gpio0, gpio1 and gpio2 referring to the vsync_p, vsync_s and vsync_e
> >> sources?
> >
> > No idea, unfortunately. They are gpioN or just mdp_vsync all over the
> > place. For the reference, in case of the SDM845 and Pixel3 the signal
> > is routed through SoC GPIO12.
> >
>
> GPIO12 on sdm845 is mdp_vsync_e.
>
> Thats why I think its better we use mdp_vsync_p/s/e instead of mdp_gpio0/1/2

Sure. This matches pins description. Are you fine with changing
defines in DPU driver to VSYNC_P / _S / _E too ?

>
> >> In that case wouldnt it be better to name it like that?
> >>
> >>> +                  - timer0
> >>> +                  - timer1
> >>> +                  - timer2
> >>> +                  - timer3
> >>> +                  - timer4
> >>> +
> >>
> >> These are indicating watchdog timer sources right?
> >
> > Yes.
> >
> >>
> >>>        required:
> >>>          - port@0
> >>>          - port@1
> >>> @@ -452,6 +467,7 @@ examples:
> >>>                              dsi0_out: endpoint {
> >>>                                       remote-endpoint = <&sn65dsi86_in>;
> >>>                                       data-lanes = <0 1 2 3>;
> >>> +                                   qcom,te-source = "mdp_gpio2";
> >>
> >> I have a basic doubt on this. Should te-source should be in the input
> >> port or the output one for the controller? Because TE is an input to the
> >> DSI. And if the source is watchdog timer then it aligns even more as a
> >> property of the input endpoint.
> >
> > I don't really want to split this. Both data-lanes and te-source are
> > properties of the link between the DSI and panel. You can not really
> > say which side has which property.
> >
>
> TE is an input to the DSI from the panel. Between input and output port,
> I think it belongs more to the input port.

Technically we don't have in/out ports. There are two ports which
define a link between two instances. For example, if the panel
supports getting information through DCS commands, then "panel input"
also becomes "panel output".

>
> I didnt follow why this is a link property. Sorry , I didnt follow the
> split part.

There is a link between the DSI host and the panel. I don't want to
end up in a situation when the properties of the link are split
between two different nodes.

>
> If we are unsure about input vs output port, do you think its better we
> make it a property of the main dsi node instead?

No, it's not a property of the DSI node at all. If the vendor rewires
the panel GPIOs or (just for example regulators), it has nothing to do
with the DSI host.

--
With best wishes
Dmitry

