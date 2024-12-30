Return-Path: <linux-arm-msm+bounces-43694-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F3C79FEBB3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Dec 2024 00:51:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CA63E3A2280
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Dec 2024 23:51:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C261C19CD17;
	Mon, 30 Dec 2024 23:51:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MizDj4V2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D85A32746B
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Dec 2024 23:51:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735602689; cv=none; b=PsPM1rdx3brykxwqbaM+2Va/S9B7XxfYglHFphFgq2z6gRGagN7optyz41FvnCkHV1ueUKYLIYbbYr2FUib9raUdDXfDbKjYOybjGfHaUJM3tqBAmC1Piw0kwmafv+A5Mo1K+ERGTdc/gdc0/T+etKYlLcLVVGS/lFbtGcX/TSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735602689; c=relaxed/simple;
	bh=qx8Xa76Z4p4ATeNrwBkObqYHsEqeYkkW9DFXBj+Tono=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AEnm2dGvF3fW3rsBvyOD35pcNGsg/h5xkWy4RnraZtbw3Kvu67wgcexaFeBqCCK/Sn2eBk++2Fn7PGYcdeermB9DLWblgWx0ct7gfJRDJw/+71PFtfBmONcQN/iNqEOigbKnbfzeIL0mQRCMJjarIIg+JeZ2I8NEPBAFUz7Bjhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MizDj4V2; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5401bd6ccadso9938004e87.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Dec 2024 15:51:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735602686; x=1736207486; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VN/PHlTdBBGpAVoKHbTwlI3UugMH1La/hOQzUtDLVnM=;
        b=MizDj4V23JnMIt/Joh7d9Vi030FjOGxR1VZTH9oPD1AvlemQ6Z/eoSLwKoKoAHelqJ
         u1gLsvLL2IWprfQ4VgAn3kqssVCq2M7Hz/q/5BUmHlBRweECgGo2hVAFaiNCZZZ6Qw2+
         cAId8NIp4LynWW2yyNTR5B5iZMl8/N4kP/Dm33Yi43bjPGsdxxEhG/B/mCp9YkzIegPT
         i0+X/x9kcXYO9yOR+4QgzO3KCFyiMBk/eS5pWpCmphVBolcE0Xxc22parKi2BDGhx4rC
         NMYA67Au6ynaQfPlI+BYLtGR8Hf6+tmKDpYZUyCaNZVCLx+v9ODEn8x50Ab3yR+5FrUb
         WFeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735602686; x=1736207486;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VN/PHlTdBBGpAVoKHbTwlI3UugMH1La/hOQzUtDLVnM=;
        b=u9oXNHSfC71rMGz+K3Wc5KriENrxVKgbsaCiZlSV5QY9rMJ+x8TtorB8DrwHv3rtHC
         3PM+Ib0sNbtt5j8ID2/yLoXUhf4Aj1mklbhJfPz/piRXANBGLAqqnpeaO1Jp40d+UQpr
         ieHz5mi5Zae3P1GiQjuh6sMOi9tMyeQkoUS0ECLW7k4jXieS5gXEXi/prEXAAI7RBalS
         bv/8Fz8kGOr0Zr15ppemQwQ7aCccNr0RB3Gkj57CtjfOo08yCMr/Qxaw3fMBvuItjUBa
         iomVt8TgB8qWmD2wLHOioItCJpoulBnek2AmXg3jrTfAbTFnHxxPmEwT1Y3dRLZle3Rp
         IRTA==
X-Gm-Message-State: AOJu0Yz90NwhD6jioO0il17jlBKjBjldRmAdxwDGxoqS4+JM0VZOgxKi
	r0v+jZlmRV2uXQ77Ip1sf4qxnlelUqKSv6qrkhqIIcimoR9/l7OAIMJE40nadeY=
X-Gm-Gg: ASbGncuyXryub1T8sQZACtzWBmLXbbEBKXVeB72cFEdexHGZoobt/7xfLo1GTPV0Cjw
	+7Rt4liLJXiuAtEP6q9lG2LLl7LiwN3QExtsVLVUd+tFOjTAZUbM4mghPUvBsif5r1NYPWLD6cK
	0uF1YEQ7UTQf6tpN/wS6hRPcOITvS/L+noQe2EuE3hq6R00yJ873rKArbUIVqWZJi1vN4HQcWhn
	vM1wX4pFh3IH1O9iR3LMYP78N9ItB8T/EY3JNS0upx4A/pDhw/NJe00sLAPP/czo31WC1S3NKTr
	qR1uy2UnfkHAOIqWUY79ughNWo36Gfp2mr57
X-Google-Smtp-Source: AGHT+IEHAzuWwFoPsiGDbIINuEZ4WyOxk6LeLernunLRlHUyizMS3uk6jY+lyVULKGUa4WS0giQACg==
X-Received: by 2002:a05:6512:3d0c:b0:540:1f7d:8b9c with SMTP id 2adb3069b0e04-5422955fc45mr10793626e87.45.1735602686021;
        Mon, 30 Dec 2024 15:51:26 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5423f9c31d1sm1722448e87.138.2024.12.30.15.51.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Dec 2024 15:51:24 -0800 (PST)
Date: Tue, 31 Dec 2024 01:51:22 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, 
	Ekansh Gupta <quic_ekangupt@quicinc.com>, gregkh@linuxfoundation.org, quic_bkumar@quicinc.com, 
	linux-kernel@vger.kernel.org, quic_chennak@quicinc.com, dri-devel@lists.freedesktop.org, 
	arnd@arndb.de
Subject: Re: [PATCH v1 0/2] Add missing fixes in fastrpc_get_args
Message-ID: <yyhd33y7rzz75ctyj2lnne7xsmcd6takrtge5ohtqdzuni7guy@sgsdbcf4iuj5>
References: <20241218102429.2026460-1-quic_ekangupt@quicinc.com>
 <173557534277.273714.16861047953843054499.b4-ty@linaro.org>
 <qd32erndjbtspx4im5u2ge2vgdc4qwwvxhkoaefxwzkue5x7kc@ghk5fdkma6vm>
 <8dee006c-cc1a-4274-8691-2d58372bc022@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8dee006c-cc1a-4274-8691-2d58372bc022@linaro.org>

On Mon, Dec 30, 2024 at 08:32:30PM +0000, Srinivas Kandagatla wrote:
> 
> 
> On 30/12/2024 18:22, Dmitry Baryshkov wrote:
> > On Mon, Dec 30, 2024 at 04:15:42PM +0000, Srinivas Kandagatla wrote:
> > > 
> > > On Wed, 18 Dec 2024 15:54:27 +0530, Ekansh Gupta wrote:
> > > > This patch series adds the listed bug fixes that have been missing
> > > > in upstream fastRPC driver:
> > > > - Page address for registered buffer(with fd) is not calculated
> > > >    properly.
> > > > - Page size calculation for non-registered buffer(copy buffer) is
> > > >    incorrect.
> > > > 
> > > > [...]
> > > 
> > > Applied, thanks!
> > 
> > May I ask, why they are being accepted with the obvious checkpatch
> > warnings?
> 
> If you are referring to this warning.
> WARNING: Invalid email format for stable: 'stable <stable@kernel.org>',
> prefer 'stable@kernel.org'
> 
> I tend to fix such small warnings before applying. These are fixed now.
> 
> > 
> > What kind of process is being followed, as those patches had review
> > comments to be implemented in the next iteration.
> 
> I apply these patches if it looks good to me. This also helps with getting
> it tested from wider audience via linux-next.
> 
> I do run TFLite workloads before it ends up in char-misc, but not for every
> patch.
> 
> sorry If I missed any blocker comments, but your comments were more on the
> cover letter content and asking about the work loads which triggers these
> bugs.
> 
> Are these patches breaking any of your test-cases?

No. But info about work-loads is the most important part: it makes sure
that none of the developers miss similar issue next time.

-- 
With best wishes
Dmitry

