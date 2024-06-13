Return-Path: <linux-arm-msm+bounces-22639-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D96A907B45
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Jun 2024 20:28:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3DA1C1C21909
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Jun 2024 18:28:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16DCE14AD1E;
	Thu, 13 Jun 2024 18:28:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cBb8Z2tv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com [209.85.219.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AD9214A4F3
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Jun 2024 18:28:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718303330; cv=none; b=nkKtR3MZAVAgzC1d3FKrJTSRGLFMexLEJT/GDp8M+vc+tYJc07IJ7iy4WQ+tsb2kjH7TTHpxa5RhdVB3xE9J+W/pb5PAPJgBDhS/pX8JpYNWMrAYBwwXLQ/3kNvWrA8MnChjXTVG0iXdyHI39FdoCUT3wfkol71EeeCgpzjwMIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718303330; c=relaxed/simple;
	bh=q5ExunAWmbebKzotNJMdAXi6rxEoY/WwolotK+/xrJ8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rJJjQ25/3jxnoOd9Dbe2+stm/OUVlMpf9975Fs3K+wXk3TAwru1Dsw5qrr1jlCGKYYdGJAtkRjq8U06zK7NDb00EEu+5/xqo5oceOgep4zHjwOmtokE1j3D/H1iAprorJyH9YKp0MSj+hGPqrf4Lvi7K4cn8Nj4o1siCOkuJKsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cBb8Z2tv; arc=none smtp.client-ip=209.85.219.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f175.google.com with SMTP id 3f1490d57ef6-dff0c685292so836829276.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Jun 2024 11:28:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718303327; x=1718908127; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=U+WGFNDC6mtg/f9cHnSYOLXVNUvNyEN8oDHQ1rCjvO4=;
        b=cBb8Z2tvzh3z/fXzuxAOlifMFGHl+kgfdagaP6M8bB0Jgp9uynbGO0hYo0J2wIfg1U
         GhaP4SzgpHpZL+JBcur+krQl2C2H2158FMpVmBQes7tbP1SfmbqbQKH+O4h+nPmf7v/j
         WX6BXcDvH4S+aDJuJQ3E0QJCtIOKwXOd9nVLWUt9SVHg4ufDAgLyn5EbqBY4uArYG9av
         T4vjNr+tWvi5tdAOsrv27GQSkUTW/ILeHH55F3ldWkImTTDhF4FZlGifucm2tEU78PoA
         26M9S5x0PS+imFQPAR+vjR85ppSLMH5mYLKgU/VbCUSk5y8EPQ+lVRsLdM+I+4fCMH1J
         jIbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718303327; x=1718908127;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U+WGFNDC6mtg/f9cHnSYOLXVNUvNyEN8oDHQ1rCjvO4=;
        b=BFCE1NG0TI0JO+KQON9IRCPsvOd6oMME64oNEHUTDNkYtAx/BxGbdgCjKyI0E31fe1
         CLeg1ZZgIgNr2FqS9Q9nO7gv2x71FyOIZl3xtF2nfdPsFhVnhndVTUiTODpRdUFQW7Fj
         imBb0NTtkp2E1koR3CFijToTLsUDwumggDaAEV4QVwtCKC4uKz5QCwAikMmm1i3WPPjh
         cJRnqWRI3G8j0OT4B4iyaX2QNG8I2rc7YVKGvvTcGrHSl6fJ5kegUM50eBPU1WuobU86
         OOBYs+YWiMwiKEKm6MNakMpxUGB1Gay7Hlgpa2ufokeSxu0iPemp1U5oyCBSZ0ecRlWp
         Sbgw==
X-Forwarded-Encrypted: i=1; AJvYcCVG5js8fAkrOl4RrLbE0hWR8M3I0eVdiqh5xIfNY5EM4FuVeEJFsw6AvdGPpZIPXBHpovALIMXhQ9GMyzBKRhAobVpAPv7KAIQnOhg+5g==
X-Gm-Message-State: AOJu0YylWsHSLSggd/gE6Syf3vSRye4dZYmX5oM3deWaPFzrMN4Dx5XR
	OLEYrINnKCXbnez0rpl0woLR76o6OJ0QJlpHJ9QvT89PORaxQOoO+PpZxnkFe6xDrQtxLlx6BKT
	ZGsiLXUz6GKKwI/6Eu03yZ/XNpNxSZAys1gQO1g==
X-Google-Smtp-Source: AGHT+IG/LogtiqjFGi3ralediT2FCQjdnE/2k+qtPlJDqZS6gSIOLoajvxRo0WA2CCSBHqASlSsXhclFFYUs/1jkrbE=
X-Received: by 2002:a25:accb:0:b0:dfa:7513:59d7 with SMTP id
 3f1490d57ef6-dff15500d87mr278860276.65.1718303327456; Thu, 13 Jun 2024
 11:28:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240613-dpu-handle-te-signal-v2-0-67a0116b5366@linaro.org>
 <20240613-dpu-handle-te-signal-v2-1-67a0116b5366@linaro.org> <y2zzgi4m377rziplwtycijbbdqaaqgyenlrv6v43bpkkt6247y@2uen44jhbv5v>
In-Reply-To: <y2zzgi4m377rziplwtycijbbdqaaqgyenlrv6v43bpkkt6247y@2uen44jhbv5v>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 13 Jun 2024 21:28:36 +0300
Message-ID: <CAA8EJpqrJFAaS86s5S4uV_3b9h8Pi1rTE1KxOyvMSbrho4oQyQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/8] dt-bindings: display/msm/dsi: allow specifying TE source
To: Marijn Suijten <marijn.suijten@somainline.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Krishna Manikandan <quic_mkrishn@quicinc.com>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	devicetree@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, 13 Jun 2024 at 21:16, Marijn Suijten
<marijn.suijten@somainline.org> wrote:
>
> On 2024-06-13 20:05:04, Dmitry Baryshkov wrote:
> > Command mode panels provide TE signal back to the DSI host to signal
> > that the frame display has completed and update of the image will not
> > cause tearing. Usually it is connected to the first GPIO with the
> > mdp_vsync function, which is the default. In such case the property can
> > be skipped.
> >
> > Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >  .../bindings/display/msm/dsi-controller-main.yaml       | 17 +++++++++++++++++
> >  1 file changed, 17 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> > index 1fa28e976559..e1cb3a1fee81 100644
> > --- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> > +++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> > @@ -162,6 +162,22 @@ properties:
> >                  items:
> >                    enum: [ 0, 1, 2, 3 ]
> >
> > +              qcom,te-source:
> > +                $ref: /schemas/types.yaml#/definitions/string
> > +                description:
> > +                  Specifies the source of vsync signal from the panel used for
> > +                  tearing elimination.
> > +                default: mdp_vsync_p
> > +                enum:
> > +                  - mdp_vsync_p
> > +                  - mdp_vsync_s
> > +                  - mdp_vsync_e
>
> When discussing that these should be renamed, was it also documented what the
> suffix means?  I can only guess something like primary/secondary/e...?

external. Note, these names match the name in the datasheets.

>
> Are the mdp_intfX variants missing here that you're handling in patch 7/8?

I didn't test them, so I didn't document them.

>
> > +                  - timer0
> > +                  - timer1
> > +                  - timer2
> > +                  - timer3
> > +                  - timer4
> > +
> >      required:
> >        - port@0
> >        - port@1
> > @@ -452,6 +468,7 @@ examples:
> >                            dsi0_out: endpoint {
> >                                     remote-endpoint = <&sn65dsi86_in>;
> >                                     data-lanes = <0 1 2 3>;
> > +                                   qcom,te-source = "mdp_vsync_e";
> >                            };
> >                    };
> >             };
> >
> > --
> > 2.39.2
> >



-- 
With best wishes
Dmitry

