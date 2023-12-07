Return-Path: <linux-arm-msm+bounces-3765-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ADC88090B1
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Dec 2023 19:54:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 35E5C1C20381
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Dec 2023 18:54:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D05242ABB;
	Thu,  7 Dec 2023 18:54:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JyVyKqnZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com [IPv6:2607:f8b0:4864:20::b2e])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7223A10F9
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 Dec 2023 10:54:44 -0800 (PST)
Received: by mail-yb1-xb2e.google.com with SMTP id 3f1490d57ef6-db549f869a3so1482787276.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 Dec 2023 10:54:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701975283; x=1702580083; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=VM/OB/atyyebuFQPzZqELsxx0GGeVNPiGK0+7436XGQ=;
        b=JyVyKqnZ0zR9VhqUNS131X8g0gbTA12SQgmRz/G0YPoABiFVMPN9feobU5w3L37ztS
         zGLIdU5QWIbub6rYf62JgY8IsXEnBiOYeDR89V80cn6VaZXw9F7V6GbIE71LtYu4m0F9
         bEiRFxG51xP6DVqT7QusxvDb6yB7jOWSSnK482lDorpP55HwJ2RXxjzmABUEGpoMWLvg
         HUwAPZZYYTF+16zbcwb4twmBc1DtHcn+PYVDtKFrhiyqvMTqzISF9fKsgdp9TQozkf7K
         k0hUzkX8oDTInHxZ+vlj2vVldQ0h/jhMLitFgQSPkElXl/7PVO+rpAkm1IoVqbrm2lHl
         R9hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701975283; x=1702580083;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VM/OB/atyyebuFQPzZqELsxx0GGeVNPiGK0+7436XGQ=;
        b=Md5KPxzjvzyC1cRQMpHdMOqihAKFpwZzLP6gzyqY06FgNr43rWU0QnS/2oCG8xZeIO
         UGmbM2omjXdMgFzjTf85h6+ziRrBdG813NUTZAWjjHkcFRO6SO2eGcm7TyJLF89uNt8f
         mk9q+r2qVX6XB/uCVMsauTOvOex+2WIpdfQuNMliFyUcDEpT1BpSvwObAwtAIB8/aOki
         6d+svXKxzReX8i975LQsgGTOfjgA0LEUWmbjzVoULwbLUV3Aa0NItJ+4Aptut5fy3Qe/
         CGM97kP5BFZbM0hVHgRtbU4AZWb30DfkJ40c1Lp4E4sAxqjNEO7/UGo3iKjDJLHRQvQv
         JLQQ==
X-Gm-Message-State: AOJu0YztUom7gJe9bltrTRkQY3EHIWfWNc05d5aIQxyu9DJhA9GNGoQy
	QQ8N1byP/clrcP2PP1nto6t9Ck4n3NbE/Tfsj5bQtw==
X-Google-Smtp-Source: AGHT+IFlacu8sH5jffAkUmShEDfKHbhNH/lx1OTgs7+dmfSvxJnCl7jLU98Pa20ue8jwSTu33MsxlIj5FJXitFDPNOQ=
X-Received: by 2002:a25:b31b:0:b0:db7:dacf:ed7a with SMTP id
 l27-20020a25b31b000000b00db7dacfed7amr3095673ybj.91.1701975283665; Thu, 07
 Dec 2023 10:54:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231115205318.2536441-1-pvorel@suse.cz> <2bferiemkljxua63v6ogifpzhlbj6m2gycxrbitgmc3ybj2a4p@7kfnzcrjj6jr>
In-Reply-To: <2bferiemkljxua63v6ogifpzhlbj6m2gycxrbitgmc3ybj2a4p@7kfnzcrjj6jr>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 7 Dec 2023 20:54:32 +0200
Message-ID: <CAA8EJpoEzTeOSVy5qVCs6eSBTxWKRfDq0UzrEjz1Kx1sG9xkCg@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] arm64: defconfig: Enable SDM660 Clock Controllers
To: Bjorn Andersson <andersson@kernel.org>
Cc: Petr Vorel <pvorel@suse.cz>, linux-arm-msm@vger.kernel.org, 
	Petr Vorel <petr.vorel@gmail.com>, Martin Botka <martin.botka@somainline.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Aboothahir U <aboothahirpkd@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 7 Dec 2023 at 18:27, Bjorn Andersson <andersson@kernel.org> wrote:
>
> On Wed, Nov 15, 2023 at 09:53:18PM +0100, Petr Vorel wrote:
> > From: Petr Vorel <petr.vorel@gmail.com>
> >
> > Enable support for the multimedia clock controller on SDM660 devices
> > and graphics clock controller on SDM630/636/660 devices.
> >
> > Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
> > ---
> > Changes v1->v2:
> > * added commit message (not just the subject)
> >
> > NOTE motivation for this is that some not yet mainlined DTS already use
> > both:
> >
> > https://github.com/sdm660-mainline/linux/blob/sdm660-next-stable/arch/arm64/boot/dts/qcom/sdm636-asus-x00td.dts
> >
> > Kind regards,
> > Petr
> >
> >  arch/arm64/configs/defconfig | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> > index acba803835b9..10a098aa8b1b 100644
> > --- a/arch/arm64/configs/defconfig
> > +++ b/arch/arm64/configs/defconfig
> > @@ -1235,6 +1235,8 @@ CONFIG_SC_GCC_8180X=y
> >  CONFIG_SC_GCC_8280XP=y
> >  CONFIG_SC_GPUCC_8280XP=m
> >  CONFIG_SC_LPASSCC_8280XP=m
> > +CONFIG_SDM_MMCC_660=m
> > +CONFIG_SDM_GPUCC_660=y
>
> I'd expect the GPU clock controller to be a module, can you please
> clarify why it needs to be builtin?

To allow the display to be enabled early enough?

>
> Regards,
> Bjorn
>
> >  CONFIG_SDM_CAMCC_845=m
> >  CONFIG_SDM_GPUCC_845=y
> >  CONFIG_SDM_VIDEOCC_845=y
> > --
> > 2.42.0
> >
>


-- 
With best wishes
Dmitry

